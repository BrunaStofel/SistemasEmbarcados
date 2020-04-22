#include <xc.h>
#include <stdlib.h>

// Configuração dos Fuses do Microcontrolador.
#define _XTAL_FREQ	   18432000 // Cristal de 18.432 Mhz.
#pragma config FOSC  = HS   	// Oscillator Selection bits (HS oscillator: High-speed crystal/resonator on RA6/OSC2/CLKOUT and RA7/OSC1/CLKIN).
#pragma config WDTE  = OFF  	// Watchdog Timer Enable bit (WDT disabled).
#pragma config PWRTE = ON   	// Power-up Timer Enable bit (PWRT enabled).
#pragma config BOREN = OFF		// Brown-out Detect Enable bit (BOD disabled).
#pragma config LVP   = OFF  	// Low-Voltage Programming Enable bit (RB4/PGM pin has digital I/O function, HV on MCLR must be used for programming).
#pragma config CPD   = OFF  	// Data EE Memory Code Protection bit (Data memory code protection off).
#pragma config CP    = OFF  	// Flash Program Memory Code Protection bit (Code protection off).

//Variáveis Globais de Controle.
unsigned short ADCResult = 0;
unsigned char *Display;
float input = 0;
int status = 0;
unsigned char buffer[9];

//-----------------------------------------------------------------------------
void USART_Init(long BaudRate)
{
	// Tempo de envio de um bit:
	// BaudRate = 9600 -> 1/baudrate = 1/9600 = 1,041667e-4 = 1000000/9600 = 104,16us
	// BaudRate = 115200 -> 1/baudrate = 1/115200 = 8,6856e-6 = 1000000/115200 = 8,68us
	
	unsigned char BR = 0;

	// Cálculo do valor para o registrador SPBRG para uma determinada velocidade em bps.	
	BR = (_XTAL_FREQ / (16 * BaudRate)) - 1;
	SPBRG = BR;
	
    // Configuração do Registrador TXSTA.
    TXSTAbits.CSRC	= 0;	// Seleção MASTER/SLAVE para o Modo Síncrono.
    TXSTAbits.TX9	= 0;	// Transmição de Dados em 8 Bits.
    TXSTAbits.TXEN	= 1; 	// Habilita a Transmição de Dados.
    TXSTAbits.SYNC	= 0; 	// Modo de Comunicação Assíncrono.
    TXSTAbits.BRGH	= 1;	// Baud Rate em alta(1) ou baixa(0) velocidade.
    TXSTAbits.TRMT	= 1;	// Situação do Registrador Interno de Transmissão (TSR).
    TXSTAbits.TX9D	= 0;	// Valor a Ser Transmitido como 9º bit (Paridade/Endereçamento).

    // Configuração do Registrador RCSTA.
    RCSTAbits.SPEN	= 1;	// Habilita o Sistema USART.
    RCSTAbits.RX9	= 0;    // Recepção de Dados em 8 Bits.
    RCSTAbits.SREN	= 0;	// Desabilita Recepção Unitária (Somente Modo Síncrono em MASTER).
    RCSTAbits.CREN	= 1;   	// Habilita a Recepção Contínua de Dados.
    RCSTAbits.ADDEN	= 0;  	// Desabilita o Sistema de Endereçamento.
    RCSTAbits.FERR	= 0;	// Erro de Stop Bit.
    RCSTAbits.OERR	= 0;	// Erro de Muitos Bytes Recebidos sem Leitura.
    RCSTAbits.RX9D	= 0;	// Valor a Ser Recebido como 9º bit (Paridade/Endereçamento).

    // Configuração da Interrupção USART.
	PIE1bits.RCIE 	= 1;	// Habilita a Interrupção Serial.
	PIR1bits.RCIF 	= 0;	// Habilita a Interrupção Serial de Recepção.
}

//-----------------------------------------------------------------------------
void USART_WriteChar(unsigned char USARTData)
{
	while(!PIR1bits.TXIF);
	TXREG = USARTData;
}

//-----------------------------------------------------------------------------
void USART_WriteString(const char *str)
{
	// Efetua a transmissão da string para a USART.
	while(*str != '\0')
  	{
    	// Envio da string byte a byte.
		USART_WriteChar(*str);
      	str++;
  	}
}

//-----------------------------------------------------------------------------
unsigned char USART_ReceiveChar(void)
{
	unsigned char USART_Data;

	if (!OERR)						// Erro de Muitos Bytes Recebidos sem Nenhuma Leitura.
	{
		USART_Data 		= RCREG;	// Recebe o byte da USART e atribui a variável USARTData.
    	PIR1bits.RCIF 	= 0;		// Limpa a Flag da Interrupção de Recepção.
	}
	else
	{
		USART_WriteString("\n\r ------- ESTOURO DE PILHA ------- \n\r ");

		RCSTAbits.CREN 	= 0;   		// Desabilita a Recepção Contínua de Dados Momentaneamente.
		USART_Data 		= RCREG;	// Recebe o byte da USART e atribui a variável USARTData.
		RCSTAbits.CREN 	= 1;   		// Habilita a Recepção Contínua de Dados Novamente.
    	PIR1bits.RCIF 	= 0;		// Limpa a Flag da Interrupção de Recepção.				
	}
	
	return(USART_Data);
}
//-----------------------------------------------------------------------------
void ADC_Init()
{
	//Configuração do Registrador ADCON1 para a Conversão A/D.
	ADCON1bits.ADFM  = 1;	// valores de bits justificados a direita
	ADCON1bits.PCFG3 = 1;	// 1001 - 6 canais analógicos. AN0 - AN5
	ADCON1bits.PCFG2 = 1;	// 1110 - 1 canal analogico AN0
	ADCON1bits.PCFG1 = 1;
	ADCON1bits.PCFG0 = 0;

	//Configuração do Registrador ADCON0 para a Conversão A/D.
	//ADCON1bits.ADCS2 = 1;
	ADCON0bits.ADCS1 = 1;	// Fosc/32 = 32/18.432.000 = 1,73611111x10-6 <Respeita o tad de 1,6us>
	ADCON0bits.ADCS0 = 0;

	//Configuração dos Registradores PIE1 e PIR1 para a Conversão A/D.
	PIE1bits.ADIE = 0;
    PIR1bits.ADIF = 0;
}
//-----------------------------------------------------------------------------
void ADC_Read(unsigned short channel)
{
	ADCON0bits.CHS = channel;	// Configuração do canal a ser lido (mesmo que CHS2:CHS1:CHS0 em bits).
	ADCON0bits.ADON	= 1;		// Ativa o módulo do conversor A/D.

	__delay_us(25); 			// Espera o tempo requerido para adequação do conversor A/D.

	ADCON0bits.GO = 1;			// Ativa o sistema de conversão de dados.
	while(ADCON0bits.GO_DONE);	// Espera até que o dado lino no canal seja convertido.
    
	PIR1bits.ADIF = 0;			// Caso esteja utilizando a interrupção A/D, limpa a flag para nova conversão.
}
//-----------------------------------------------------------------------------
void interrupt ISR(void)
{
	// Verificação se a Interrupção foi causada pela conversão A/D.
	if (PIR1bits.ADIF)
	{
		ADC_Read(0);							// Leitura do canal 0.
		ADCResult = ((ADRESH << 8) + ADRESL);	// Converte em um valor de 10 bits o valor lido do canal 0.
		input = ADCResult * 0.004887585533;		// Formatação do valor de 10 bits em tensão (0V e 5V).
		Display = ftoa(input, &status);			// Converte um valor real em string para visualização.
		//USART_WriteString("AN0: ");
		USART_WriteString(Display);
	//	USART_WriteString("\n\r");
		__delay_us(2);
		// Caso a interrupção seja ativada... a manipulação dos dados pode ser feita aqui!	
		PIR1bits.ADIF = 0;	// Limpa a flag da interrupção do conversor A/D.
	}

	// Verifica se a interrupção foi causada pela recepção de bytes.
	if (PIR1bits.RCIF)		
    {
		char resp;
		unsigned char byte2;
		unsigned char byte1;

		resp = USART_ReceiveChar();

		//Comparação se coincide com o inicializador do pacote de dados.
    	switch(resp)
    	{
			case 'A' :
       			//Formatação do Pacote de dados.
       			buffer[0] = '#';
       			buffer[1] = ':';
		
       			//Conversão de um valor de 10 bits em 2 bytes para transmissão via serial.
				ADC_Read(0);
       			byte2 = ADRESH;
       			byte1 = ADRESL;

		        //Tratamento de terminadores nulos da String.
       			if (byte2 == '\0') byte2 = '0';
       			if (byte1 == '\0') byte1 = '0';
   
       			buffer[2] = byte2;
       			buffer[3] = byte1;
	       		/* 1 xxxx*/
       			buffer[4] = '0';
       			buffer[5] = '0';
				/* 2 xxxx*/
       			buffer[6] = '0';
       			buffer[7] = '0';
       			buffer[8] = ';';				
	
				USART_WriteString(buffer);

				resp = '#';

			break;
			case 'B' :
				RB4 = 1;
				USART_WriteString("------------> valvula 1 ativada");
				resp = '#';				
			break;

			case 'C' :
				RB4 = 0;
				USART_WriteString("------------> valvula 1 desativada");
				resp = '#';			
			break;

			case 'D' :
				RB5 = 1;
				USART_WriteString("------------> valvula 2 ativada");
				resp = '#';				
			break;

			case 'E' :
				RB5 = 0;
				USART_WriteString("------------> valvula 2 desativada");
				resp = '#';			
			break;
		}
    }	
}

//-----------------------------------------------------------------------------
void main(void)
{
    TRISA	= 0b00011111;	// Configuração dos canais analógicos do PORTA.
    PORTA	= 0b00011111;  	// Inicialização dos canais analógicos do PORTA.
    TRISB	= 0b00000000;	// Configuração das entradas/saídas do PORTB.
    PORTB	= 0b00000000;  	// Inicialização das entradas/saídas do PORTB.
	TRISC	= 0b10000000;	// Configuração das entradas/saídas do PORTC.
    PORTC	= 0b11000000;  	// Inicialização das entradas/saídas do PORTC.
    TRISD	= 0b00000000;	// Configuração das entradas/saídas do PORTD.		
    PORTD	= 0b00000000;  	// Inicialização das das entradas/saídas do PORTD.
    TRISE	= 0b00000111;	// Configuração dos canais analógicos do PORTE.
    PORTE	= 0b00000111;  	// Inicialização dos canais analógicos do PORTE.

	USART_Init(115200);		// Inicialização da USART.
	ADC_Init();				// Inicialização do módulo do conversor A/D.
	
	INTCONbits.PEIE	= 1;	// Habilita Interrupção de Periféricos do Microcontrolador.
	INTCONbits.GIE	= 1;	// Habilita Interrupção Global.

    
	USART_WriteString("Inicializando...");	// Escrita da string no LCD.

	__delay_ms(1000);

	while(1)	//Laço Principal.
    {	
	
    }
}
//-----------------------------------------------------------------------------
