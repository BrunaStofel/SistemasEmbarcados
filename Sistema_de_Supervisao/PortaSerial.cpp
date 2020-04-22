//---------------------------------------------------------------------------
#pragma hdrstop

#include "PortaSerial.h"
#include <vector.h>
#include "USerialCommunication.h"

//---------------------------------------------------------------------------

SerialPort::SerialPort()
{
    //Variável que que receberá a porta serial aberta.
    hComm = NULL;

    //Valores padrão.
    BaudRate = CBR_115200;  // CBR_38400, CBR_9600
    Parity   = NOPARITY;    // 0 - 4 = no, odd, even, mark, space
    StopBits = ONESTOPBIT;  // 0 - 2 = 1, 1.5, 2
    ByteSize = 8;

    //Configuração dos tamanhos dos buffers de leitura e escrita.
    dwToRead = 100;
}
//---------------------------------------------------------------------------

vector <AnsiString> SerialPort::CheckSerialPort()
{
    HANDLE hCommCheck;
    AnsiString asCommPort;
    AnsiString asPort;
    vector <AnsiString> asDetectedPorts;

    //Realiza a verificação das portas seriais de COM1 a COM30.
    for (int a = 1; a < 30; a++)
    {
        //Verifica se há uma porta serial ainda aberta.
        if (hCommCheck != NULL)
        {
            //Fecha a porta serial.
    		CloseHandle(hCommCheck);
            hCommCheck = NULL;
        }

        //Monta o nome da porta de acordo com o índice selecionado.
        asPort = "COM" + IntToStr(a);

        //Configuração do nome da porta serial a ser aberta.
        asCommPort = "\\\\.\\" + asPort;

        //Abertura da porta serial selecionada.
        hCommCheck = CreateFile( asCommPort.c_str(),     	// ponteiro para a porta selecionada.
                            GENERIC_READ | GENERIC_WRITE,	// Modo de acesso (escrita ou leitura).
                            0,	                            // Não utilizado.
                            0,	                            // Não utilizado.
                            CREATE_ALWAYS,              	// Como a porta será criada.
                            NULL,                       	// Não utilizado.
                            0);                             // Não utilizado.

        //Faz a verificação se a porta foi aberta corretamente.
    	if (hCommCheck != INVALID_HANDLE_VALUE)
        {
            asDetectedPorts.push_back(asPort);
        }
    }

    //Retorna as portas seriais detectadas.
    return (asDetectedPorts);
}

//---------------------------------------------------------------------------

BOOL SerialPort::OpenSerialPort(AnsiString asPort, AnsiString asBaudRate)
{
    AnsiString asCommPort;

    //Verifica se há uma porta serial ainda aberta caso exista ela é fechada.
    if (hComm != NULL)
    {
        //Fecha a porta serial.
		CloseHandle(hComm);
        hComm = NULL;
    }

    //Configuração do nome da porta serial selecionada.
    asCommPort = "\\\\.\\" + asPort;

    //Configurações do Baud Rate da porta serial selecionada.
    if (asBaudRate == "256000") BaudRate = CBR_256000;
    if (asBaudRate == "128000") BaudRate = CBR_128000;
    if (asBaudRate == "115200") BaudRate = CBR_115200;
    if (asBaudRate == "57600")  BaudRate = CBR_57600;
    if (asBaudRate == "56000")  BaudRate = CBR_56000;
    if (asBaudRate == "38400")  BaudRate = CBR_38400;
    if (asBaudRate == "19200")  BaudRate = CBR_19200;
    if (asBaudRate == "14400")  BaudRate = CBR_14400;
    if (asBaudRate == "9600")   BaudRate = CBR_9600;
    if (asBaudRate == "4800")   BaudRate = CBR_4800;
    if (asBaudRate == "2400")   BaudRate = CBR_2400;
    if (asBaudRate == "1200")   BaudRate = CBR_1200;

    //Abertura da porta serial selecionada.
    hComm = CreateFile( asCommPort.c_str(),     	    // ponteiro para a porta selecionada.
                        GENERIC_READ | GENERIC_WRITE,	// Modo de acesso (escrita ou leitura).
                        0,	                            // Não utilizado.
                        0,	                            // Não utilizado.
                        CREATE_ALWAYS,              	// Como a porta será criada.
                        NULL,                       	// Não utilizado.
                        0);                             // Não utilizado.

    //Faz a verificação se a porta foi aberta corretamente.
	if (hComm != INVALID_HANDLE_VALUE)
    {
        //Configuração dos Timeouts da Porta Serial.
        COMMTIMEOUTS CommTimeouts;

        //Atribuição dos valores definidos para os Timeouts.
        CommTimeouts.ReadIntervalTimeout            = MAXDWORD;
        CommTimeouts.ReadTotalTimeoutMultiplier     = 0;
        CommTimeouts.ReadTotalTimeoutConstant       = 0;
        CommTimeouts.WriteTotalTimeoutMultiplier    = 0;
        CommTimeouts.WriteTotalTimeoutConstant      = 0;

        //Verificação se os parâmetros de configuração foram aceitos.
        if (SetCommTimeouts(hComm, &CommTimeouts) == 0)
        {
            ShowMessage("ERRO AO ALTERAR DADOS DE CONFIGURAÇÃO DA PORTA SERIAL" + asPort);
            CloseHandle(hComm);
            hComm = NULL;

            return (false);
        }

        //Configurações dos parâmetros de funcionamento da Porta Serial.
        DCB dcb = {0};

        //Verificação se foi possível obter os parâmetros de configuração originais da Porta Serial.
        if (GetCommState(hComm, &dcb) == 0)
        {
            ShowMessage("ERRO AO OBTER DADOS DE CONFIGURAÇÃO DA PORTA SERIAL" + asPort);
            CloseHandle(hComm);
            hComm = NULL;

            //Sinaliza erro na abertura da porta serial.
            return (false);
        }

        //Estrutura de configuração da porta serial.
        dcb.DCBlength           = sizeof(dcb);  // sizeof(DCB)

        //Atribuição dos parâmetros (DEFAULT) de configuração da Porta Serial.
        dcb.BaudRate            = BaudRate;     // current baud rate
        dcb.fBinary             = true;         // binary mode, no EOF check
        dcb.fParity             = true;         // enable parity checking
        dcb.ByteSize            = 8;            // number of bits/byte, 4-8
        dcb.Parity              = NOPARITY;     // 0 - 4 = no, odd, even, mark, space
        dcb.StopBits            = ONESTOPBIT;   // 0, 1, 2 = 1, 1.5, 2

        //Demais parâmetros opcional.
        dcb.fOutxCtsFlow        = false;        // CTS output flow control
        dcb.fOutxDsrFlow        = false;        // DSR output flow control
        dcb.fDtrControl         = DTR_CONTROL_DISABLE;  // DTR flow control type
        dcb.fDsrSensitivity     = false;        // DSR sensitivity
        dcb.fTXContinueOnXoff   = false;        // XOFF continues Tx            2
        dcb.fOutX               = false;        // XON/XOFF out flow control
        dcb.fInX                = false;        // XON/XOFF in flow control
        dcb.fErrorChar          = false;        // enable error replacement     1
        dcb.fNull               = false;        // enable null stripping
        dcb.fRtsControl         = RTS_CONTROL_DISABLE;  // RTS flow control
        dcb.fAbortOnError       = false;        // abort reads/writes on error
        dcb.fDummy2             = false;        // reserved                     1
        dcb.XonLim              = 0;            // transmit XON threshold       1
        dcb.XoffLim             = 0;            // transmit XOFF threshold      1
        dcb.XonChar             = 0;            // Tx and Rx XON character
        dcb.XoffChar            = 0;            // Tx and Rx XOFF character
        dcb.ErrorChar           = 0;            // error replacement character
        dcb.EofChar;                            // end of input character
        dcb.EvtChar             = 0;
        //dcb.wReserved;                        // not currently used           1
        dcb.wReserved1;                         // reserved; do not use

        //Verificação se os parâmetros de configuração foram aceitos.
        if (SetCommState(hComm,&dcb) == 0)
        {
            ShowMessage("ERRO AO ALTERAR DADOS DE CONFIGURAÇÃO DA PORTA SERIAL" + asPort);
            CloseHandle(hComm);
            hComm = NULL;

            return (false);
        }
    }
    else
    {
        ShowMessage("ERRO AO ABRIR A PORTA SERIAL" + asPort);
        CloseHandle(hComm);
        hComm = NULL;

        return (false);
    }

    //Descarta caracteres presentes na porta e termina processos pendentes de leitura e transmissão.
    PurgeComm(hComm, PURGE_TXABORT | PURGE_RXABORT | PURGE_TXCLEAR | PURGE_RXCLEAR);

    return (true);
}

//---------------------------------------------------------------------------

BOOL SerialPort::WriteABuffer(char *Buffer, DWORD dwToWrite)
{
    OVERLAPPED osWrite = {0};

    if (hComm != NULL)
    {
        // Create this writes OVERLAPPED structure hEvent.
        osWrite.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);

        if (osWrite.hEvent == NULL)
        {
            return (false);     // Error creating overlapped event handle.
        }

        if (!WriteFile(hComm, Buffer, dwToWrite, &dwWritten, &osWrite))
        {
            ShowMessage("ERRO AO ENVIAR DADOS PARA A PORTA SERIAL");
        }

        CloseHandle(osWrite.hEvent);
    }
    else
    {
        ShowMessage("ERRO AO ABRIR A PORTA SERIAL");
        CloseHandle(hComm);
        return (FALSE);
    }

    //Finaliza todas as pendências de escrita e leitura da porta serial selecionada.
    PurgeComm(hComm, PURGE_TXABORT | PURGE_RXABORT | PURGE_TXCLEAR | PURGE_RXCLEAR);

    return (true);
}

//---------------------------------------------------------------------------

char * SerialPort::ReadABuffer()
{
    OVERLAPPED osRead = {0};

    if (hComm != NULL)
    {
        // Create this writes OVERLAPPED structure hEvent.
        osRead.hEvent = CreateEvent(NULL, TRUE, FALSE, NULL);

        if (osRead.hEvent != NULL)
        {
            strcpy(Buffer,"\x0");
            if (ReadFile(hComm, &Buffer, dwToRead, &dwRead, &osRead))
            {
                //Encerra corretamente a string para não retornar lixo.
                Buffer[dwRead] = '\0';
            }
            else
            {
                ShowMessage("ERRO AO LER DADOS DA PORTA SERIAL");
            }
        }
        else
        {
            ShowMessage("ERRO AO ABRIR A PORTA SERIAL");
            CloseHandle(hComm);
            return (FALSE);
        }
        
        CloseHandle(osRead.hEvent);
    }
    else
    {
        ShowMessage("ERRO AO ABRIR A PORTA SERIAL");
        CloseHandle(hComm);
        return (FALSE);
    }

    //Finaliza todas as pendências de escrita e leitura da porta serial selecionada.
    PurgeComm(hComm, PURGE_TXABORT | PURGE_RXABORT | PURGE_TXCLEAR | PURGE_RXCLEAR);

    //Retorna o buffer recebido.
    return (Buffer);
}

//---------------------------------------------------------------------------

unsigned int SerialPort::getBufferSize()
{
    //Obtém o número de bytes no buffer serial a serem lidos.
    return (dwRead);
}

//---------------------------------------------------------------------------

void SerialPort::CloseSerialPort()
{
    //Fecha a porta serial aberta.
    if (hComm != NULL)
    {
        SetCommMask(hComm, 0L);

        CloseHandle(hComm);
        hComm = NULL;
    }
}

//---------------------------------------------------------------------------
#pragma package(smart_init)
