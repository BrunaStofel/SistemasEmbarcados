#include <xc.h>
#include <stdlib.h>

// Configura��o dos Fuses do Microcontrolador.
#define _XTAL_FREQ	   18432000 // Cristal de 18.432 Mhz.
#pragma config FOSC  = HS   	// Oscillator Selection bits (HS oscillator: High-speed crystal/resonator on RA6/OSC2/CLKOUT and RA7/OSC1/CLKIN).
#pragma config WDTE  = OFF  	// Watchdog Timer Enable bit (WDT disabled).
#pragma config PWRTE = ON   	// Power-up Timer Enable bit (PWRT enabled).
#pragma config BOREN = OFF		// Brown-out Detect Enable bit (BOD disabled).
#pragma config LVP   = OFF  	// Low-Voltage Programming Enable bit (RB4/PGM pin has digital I/O function, HV on MCLR must be used for programming).
#pragma config CPD   = OFF  	// Data EE Memory Code Protection bit (Data memory code protection off).
#pragma config CP    = OFF  	// Flash Program Memory Code Protection bit (Code protection off).

//Vari�veis Globais de Controle.
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

	// C�lculo do valor para o registrador SPBRG para uma determinada velocidade em bps.	
	BR = (_XTAL_FREQ / (16 * BaudRate)) - 1;
	SPBRG = BR;
	
    // Configura��o do Registrador TXSTA.
    TXSTAbits.CSRC	= 0;	// Sele��o MASTER/SLAVE para o Modo S�ncrono.
    TXSTAbits.TX9	= 0;	// Transmi��o de Dados em 8 Bits.
    TXSTAbits.TXEN	= 1; 	// Habilita a Transmi��o de Dados.
    TXSTAbits.SYNC	= 0; 	// Modo de Comunica��o Ass�ncrono.
    TXSTAbits.BRGH	= 1;	// Baud Rate em alta(1) ou baixa(0) velocidade.
    TXSTAbits.TRMT	= 1;	// Situa��o do Registrador Interno de Transmiss�o (TSR).
    TXSTAbits.TX9D	= 0;	// Valor a Ser Transmitido como 9� bit (Paridade/Endere�amento).

    // Configura��o do Registrador RCSTA.
    RCSTAbits.SPEN	= 1;	// Habilita o Sistema USART.
    RCSTAbits.RX9	= 0;    // Recep��o de Dados em 8 Bits.
    RCSTAbits.SREN	= 0;	// Desabilita Recep��o Unit�ria (Somente Modo S�ncrono em MASTER).
    RCSTAbits.CREN	= 1;   	// Habilita a Recep��o Cont�nua de Dados.
    RCSTAbits.ADDEN	= 0;  	// Desabilita o Sistema de Endere�amento.
    RCSTAbits.FERR	= 0;	// Erro de Stop Bit.
    RCSTAbits.OERR	= 0;	// Erro de Muitos Bytes Recebidos sem Leitura.
    RCSTAbits.RX9D	= 0;	// Valor a Ser Recebido como 9� bit (Paridade/Endere�amento).

    // Configura��o da Interrup��o USART.
	PIE1bits.RCIE 	= 1;	// Habilita a Interrup��o Serial.
	PIR1bits.RCIF 	= 0;	// Habilita a Interrup��o Serial de Recep��o.
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
	// Efetua a transmiss�o da string para a USART.
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
		USART_Data 		= RCREG;	// Recebe o byte da USART e atribui a vari�vel USARTData.
    	PIR1bits.RCIF 	= 0;		// Limpa a Flag da Interrup��o de Recep��o.
	}
	else
	{
		USART_WriteString("\n\r ------- ESTOURO DE PILHA ------- \n\r ");

		RCSTAbits.CREN 	= 0;   		// Desabilita a Recep��o Cont�nua de Dados Momentaneamente.
		USART_Data 		= RCREG;	// Recebe o byte da USART e atribui a vari�vel USARTData.
		RCSTAbits.CREN 	= 1;   		// Habilita a Recep��o Cont�nua de Dados Novamente.
    	PIR1bits.RCIF 	= 0;		// Limpa a Flag da Interrup��o de Recep��o.				
	}
	
	return(USART_Data);
}
//-----------------------------------------------------------------------------
void ADC_Init()
{
	//Configura��o do Registrador ADCON1 para a Convers�o A/D.
	ADCON1bits.ADFM  = 1;	// valores de bits justificados a direita
	ADCON1bits.PCFG3 = 1;	// 1001 - 6 canais anal�gicos. AN0 - AN5
	ADCON1bits.PCFG2 = 1;	// 1110 - 1 canal analogico AN0
	ADCON1bits.PCFG1 = 1;
	ADCON1bits.PCFG0 = 0;

	//Configura��o do Registrador ADCON0 para a Convers�o A/D.
	//ADCON1bits.ADCS2 = 1;
	ADCON0bits.ADCS1 = 1;	// Fosc/32 = 32/18.432.000 = 1,73611111x10-6 <Respeita o tad de 1,6us>
	ADCON0bits.ADCS0 = 0;

	//Configura��o dos Registradores PIE1 e PIR1 para a Convers�o A/D.
	PIE1bits.ADIE = 0;
    PIR1bits.ADIF = 0;
}
//-----------------------------------------------------------------------------
void ADC_Read(unsigned short channel)
{
	ADCON0bits.CHS = channel;	// Configura��o do canal a ser lido (mesmo que CHS2:CHS1:CHS0 em bits).
	ADCON0bits.ADON	= 1;		// Ativa o m�dulo do conversor A/D.

	__delay_us(25); 			// Espera o tempo requerido para adequa��o do conversor A/D.

	ADCON0bits.GO = 1;			// Ativa o sistema de convers�o de dados.
	while(ADCON0bits.GO_DONE);	// Espera at� que o dado lino no canal seja convertido.
    
	PIR1bits.ADIF = 0;			// Caso esteja utilizando a interrup��o A/D, limpa a flag para nova convers�o.
}
//-----------------------------------------------------------------------------
void interrupt ISR(void)
{
	// Verifica��o se a Interrup��o foi causada pela convers�o A/D.
	if (PIR1bits.ADIF)
	{
		ADC_Read(0);							// Leitura do canal 0.
		ADCResult = ((ADRESH << 8) + ADRESL);	// Converte em um valor de 10 bits o valor lido do canal 0.
		input = ADCResult * 0.004887585533;		// Formata��o do valor de 10 bits em tens�o (0V e 5V).
		Display = ftoa(input, &status);			// Converte um valor real em string para visualiza��o.
		//USART_WriteString("AN0: ");
		USART_WriteString(Display);
	//	USART_WriteString("\n\r");
		__delay_us(2);
		// Caso a interrup��o seja ativada... a manipula��o dos dados pode ser feita aqui!	
		PIR1bits.ADIF = 0;	// Limpa a flag da interrup��o do conversor A/D.
	}

	// Verifica se a interrup��o foi causada pela recep��o de bytes.
	if (PIR1bits.RCIF)		
    {
		char resp;
		unsigned char byte2;
		unsigned char byte1;

		resp = USART_ReceiveChar();

		//Compara��o se coincide com o inicializador do pacote de dados.
    	switch(resp)
    	{
			case 'A' :
       			//Formata��o do Pacote de dados.
       			buffer[0] = '#';
       			buffer[1] = ':';
		
       			//Convers�o de um valor de 10 bits em 2 bytes para transmiss�o via serial.
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
    TRISA	= 0b00011111;	// Configura��o dos canais anal�gicos do PORTA.
    PORTA	= 0b00011111;  	// Inicializa��o dos canais anal�gicos do PORTA.
    TRISB	= 0b00000000;	// Configura��o das entradas/sa�das do PORTB.
    PORTB	= 0b00000000;  	// Inicializa��o das entradas/sa�das do PORTB.
	TRISC	= 0b10000000;	// Configura��o das entradas/sa�das do PORTC.
    PORTC	= 0b11000000;  	// Inicializa��o das entradas/sa�das do PORTC.
    TRISD	= 0b00000000;	// Configura��o das entradas/sa�das do PORTD.		
    PORTD	= 0b00000000;  	// Inicializa��o das das entradas/sa�das do PORTD.
    TRISE	= 0b00000111;	// Configura��o dos canais anal�gicos do PORTE.
    PORTE	= 0b00000111;  	// Inicializa��o dos canais anal�gicos do PORTE.

	USART_Init(115200);		// Inicializa��o da USART.
	ADC_Init();				// Inicializa��o do m�dulo do conversor A/D.
	
	INTCONbits.PEIE	= 1;	// Habilita Interrup��o de Perif�ricos do Microcontrolador.
	INTCONbits.GIE	= 1;	// Habilita Interrup��o Global.

    
	USART_WriteString("Inicializando...");	// Escrita da string no LCD.

	__delay_ms(1000);

	while(1)	//La�o Principal.
    {	
	
    }
}
//-----------------------------------------------------------------------------
