//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#include <vector.h>
#include <string.h>
#include <time.h>

#pragma hdrstop

#include "USerialCommunication.h"
#include "PortaSerial.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

#define read        "r"				// Abre um arquivo-texto para leitura
#define write       "w"				// Cria um arq-txt para escrita
#define append      "a"				// Adiciona dados no fianl de um arq txt
#define readBin     "rb"			// Abre um arq-binario para leitura
#define writeBin    "wb"			// cria um arq-binario para escrita
#define appendBin   "ab"			// Adiciona dados no final de um arq binario
#define readMais    "r+"			// Abre arq-txt para Leitura/escrita
#define writeMais   "w+"			// Cria arq-txt para Leitura/escrita
#define apendMais   "a+"			// Anexa ou cria um arq-txt para Leitura/escrita
#define readBinMais "r+b"			// Abre um arq-binario para leitura/escrita
#define writeBinMais "w+b"			// Cria um arq-binario para leitura/escrita
#define appendBinMais "a+b"			// anexa ou cria um arq-binario para leitura/escrita

TFSerialPort *FSerialPort;

SerialPort *PortaSerial;

bool atuador1 = false;
bool atuador2 = false;





//double tensao1 = 0;
int valor, Tatual = 0;

AnsiString saida;

//Declara��o das Threads de processamento.
Thread *ProcessaGrafico;

//------- Gr�fico de sinais ------------------------------------------

FILE *arq_dados;

unsigned int max_tela = 100;
unsigned int i = 0;
unsigned int j = 0;
unsigned int posicao_do_grafico = 0;
unsigned char buffer[256] = {0};
bool LeArquivo = false;

//Declara��o de Vari�veis. --------------------------------------------------
AnsiString NomeArquivoDeDados;

unsigned long PosicaoInicial;
unsigned long PosicaoAtual;
unsigned long PosicaoFinal;
unsigned long Fim;

unsigned int TamanhoDaJanelaEmSegundos;
unsigned int TamanhoDoRegistro;
unsigned int NumeroDeAmostras;
unsigned int TamanhoDaEpoca;
unsigned int Deslocamento;
const int hourToSec = 3600; // 60sX60min
float tensao = 0;

double itens[hourToSec];

//---------------------------------------------------------------------------

__fastcall TFSerialPort::TFSerialPort(TComponent* Owner)
    : TForm(Owner)
{


}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::FormCreate(TObject *Sender)
{
    //------- Gr�fico de sinais ------------------------------------------

    // Redimensiona o valor m�ximo do eixo x com o tamanho da tela desejada.
    GraficoLinha->BottomAxis->Maximum = max_tela;

    // Expande o gr�fico para comportar a quantidade de amostras contidas em max_tela.
    for (unsigned int a = 0; a < max_tela+1; a++)
    {
        GraficoLinha->Series[0]->AddY(0);
    }

    // Atualiza o chart.
    GraficoLinha->Refresh();

    // Decalara��o do ponteiro do arquivo que armazena os dados.
    arq_dados = fopen("dados.dat", writeBin);

    // Verifica quais portas seriais est�o dispon�veis/conectadas.
    vector <AnsiString> asDetectedPorts;
    asDetectedPorts = PortaSerial->CheckSerialPort();

    CbSerialPort1->Clear();
     for (unsigned int a = 0; a < asDetectedPorts.size(); a++)
    {
        CbSerialPort1->Items->Add(asDetectedPorts[a]);
    }
     CbSerialPort1->ItemIndex = 0;
}

//---------------------------------------------------------------------------
    //Instante de tempo para receber resposta do mestre.
//    Sleep(50);
    //Armazena em buffer a resposta enviada pelo mestre com as temperaturas.
//     strcpy(buffer, PortaSerial->ReadABuffer());
//------------------------------------------------------------------------
        // Grava o canal 1 no arquivo.
//        fprintf(arq_dados,"%0.2f\n", tensao1);
        //------- Gr�fico de sinais -----------------------------------------
//        saida ="Tensao1: "  + FloatToStrF(tensao1, ffFixed,10,2) + " [V] ";
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
void __fastcall TFSerialPort::BtOpenPortClick(TObject *Sender)
{
    //Configura��es da Porta Serial selecionada.
    PortaSerial = new SerialPort();
    PortaSerial->OpenSerialPort(CbSerialPort1->Text, CbBaudRate1->Text);

    CheckBoxModoContinuo->Enabled = true;
    LeArquivo = false;
    Log->Lines->Add("Porta Serial Aberta...");
    // Decalara��o do ponteiro do arquivo que armazena os dados.
    arq_dados = fopen("dados.txt","w");

    // Declara��o da thread para leitura dos pacotes e plotagem do gr�fico.
    ProcessaGrafico = new Thread(true);
    ProcessaGrafico->Resume();
      Timer1->Enabled = true;
    BtOpenPort->Enabled = false;
}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::BtClosePortClick(TObject *Sender)
{
    CheckBoxModoContinuo->Checked = false;
    CheckBoxModoContinuo->Enabled = false;
    BtOpenPort->Enabled = true;
    Timer1->Enabled = false;

     // Verifica��o da inst�ncia da thread de atualiza��o do gr�fico.
    if (ProcessaGrafico != NULL)
    {
        //ProcessaGrafico->WaitFor();
        ProcessaGrafico->Terminate();
        delete ProcessaGrafico;
        ProcessaGrafico = NULL;

        Log->Lines->Add("finalizou a thread e deletou a inst�ncia.");
    }

     // Verifica��o da inst�ncia da porta serial.
    if (PortaSerial != NULL)
    {
        Sleep(1000);
        PortaSerial->CloseSerialPort();

        Log->Lines->Add("Porta Serial Fechada...");
    }

    delete PortaSerial;
    PortaSerial = NULL;

    //Fecha o arquivo e salva altera��es.
    fclose(arq_dados);
}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::EnviarClick(TObject *Sender)
{
    char buff[100];

    //Converte uma string em array.
    strcpy(buffer, EdCommand->Text.c_str());

    //Envia o buffer pela porta serial.
    PortaSerial->WriteABuffer(buffer, EdCommand->Text.Length());

    Sleep(100);

    strcpy(buff,PortaSerial->ReadABuffer());
    Log->Lines->Add(buff);
}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::CheckBoxModoContinuoClick(TObject *Sender)
{
    Timer1->Enabled = CheckBoxModoContinuo->Checked;
}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::CbSerialPort1DropDown(TObject *Sender)
{
    // Verifica quais portas seriais est�o dispon�veis/conectadas.
    vector <AnsiString> asDetectedPorts;
    asDetectedPorts = PortaSerial->CheckSerialPort();

    CbSerialPort1->Clear();
    for (unsigned int a = 0; a < asDetectedPorts.size(); a++)
    {
        CbSerialPort1->Items->Add(asDetectedPorts[a]);
    }
     CbSerialPort1->ItemIndex = 0;
}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::Sair1Click(TObject *Sender)
{
    delete PortaSerial;

    Close();
}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::GraficoLinhaAfterDraw(TObject *Sender)
{
    //------- Gr�fico de sinais ------------------------------------------
    if (!LeArquivo)
    {
    double xi, xf, yi, yf;

    xi = GraficoLinha->BottomAxis->CalcPosValue(posicao_do_grafico - 1);
    yi = GraficoLinha->LeftAxis->CalcPosValue(GraficoLinha->LeftAxis->Minimum) + 1;
    xf = GraficoLinha->BottomAxis->CalcPosValue(posicao_do_grafico - 1) + 5;
    yf = GraficoLinha->LeftAxis->CalcPosValue(GraficoLinha->LeftAxis->Maximum) - 1;

    GraficoLinha->Canvas->Pen->Style = psSolid;
    GraficoLinha->Canvas->Pen->Color = clBlack;
    GraficoLinha->Canvas->Brush->Color = clBlack;
    GraficoLinha->Canvas->Rectangle(xi,yi,xf,yf);
    }

}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::SalvarComo1Click(TObject *Sender)
{

    SaveDialog1->InitialDir = "Supervisao";

    if (FileExists("dados.txt"))
    {
        FILE *arq;

        if (SaveDialog1->Execute())
        {
            arq = fopen(SaveDialog1->FileName.c_str(),"w");
            if (CopyFile("dados.txt", SaveDialog1->FileName.c_str(), True))
                MessageDlg("N�o h� padr�es selecionados", mtError, TMsgDlgButtons() << mbOK,0);

        }
        fclose(arq);
    }
}

//---------------------------------------------------------------------------
void __fastcall TFSerialPort::Abri1Click(TObject *Sender)
{
    // Atribui o diret�rio inicial dos arquivos.
    OpenDialog1->InitialDir = "c:\\Desenvolvimento\\";

    // Executa OpenDialog para sele��o do arquivo.
    if (OpenDialog1->Execute())
    {
        LeArquivo = true;

        // Fecha o ponteiro do arquivo de dados caso esteja aberto.
        if (arq_dados != NULL)
        {
            fclose(arq_dados);
        }

        // Atribui��o do nome do arquivo selecionado para utiliza��o global.
        NomeArquivoDeDados = OpenDialog1->FileName;

        // Abertura do arquivo para verifica��o configura��o inicial.
        arq_dados = fopen(NomeArquivoDeDados.c_str(), readBin);

        // Posiciona o Ponteiro do Arquivo.
        PosicaoAtual = 0;
        fseek(arq_dados, 0, 0);
        fseek(arq_dados, PosicaoAtual, 1);  // Modificar a posi��o do ponteiro de arquivo para buscar mais janelas de pontos.

        // Posiciona o Ponteiro no fim do Arquivo.
        //fseek(arq_dados, 0, 2);
        //PosicaoFinal = ftell(arq_dados);

        // Limpa todas as s�ries criadas.
        GraficoLinha->Series[i]->Clear();

        // Deve ser preenchido as s�ries com valores iniciais para poderem ser trabalhadas.
        for (unsigned int i = 0; i < GraficoLinha->BottomAxis->Maximum; i++)
        {
            GraficoLinha->Series[j]->AddY(0.0);
        }

        // Deve ser preenchido as s�ries com valores iniciais para poderem ser trabalhadas.
        for (unsigned int i = 0; i < 100; i++)
        {
             // Realiza a Leitura da Frequencia de Amostragem do arquivo.
             fscanf(arq_dados,"%f", &tensao);
             GraficoLinha->Series[0]->YValues->Value[i] = tensao;
        }

        GraficoLinha->Refresh();
    }
}
//---------------------------------------------------------------------------


void __fastcall TFSerialPort::AtualizaGrafico()
{
    // Plota a amostra no gr�fico.
    FSerialPort->GraficoLinha->Series[0]->YValues->Value[posicao_do_grafico] = itens[Tatual];
}


//---------------------------------------------------------------------------//
//                Declara��o da thread de processamento                      //
//---------------------------------------------------------------------------//

__fastcall Thread::Thread(bool CreateSuspended)
                : TThread(CreateSuspended)
{
    Priority = tpHigher; //Normal;
    FSerialPort->Log->Lines->Add("iniciou a thread...");
}

//---------------------------------------------------------------------------

void __fastcall Thread::Execute()
{
    AnsiString check;
   // char timeStr[9];

    while(!Terminated)
    {
        vector <unsigned char> buffer1;

        int valor = 0;
        AnsiString saida;
        Sleep(1000);
        // Envia o buffer pela porta serial.
        PortaSerial->WriteABuffer("A", 1);

        // Instante de tempo para receber resposta do mestre.
        Sleep(30);

        // Armazena em buffer a resposta enviada pelo mestre com as temperaturas.
        buffer1 = PortaSerial->ReadBuffer();

        //------------------------------------------------------------------------
        // AQUISI��O DOS PACOTES DE DADOS DE MODO CONT�NUO.
        //------------------------------------------------------------------------

        // Verifica��o e Valida��o do pacote de dados recebido.
        if (buffer1[0] == '#' && buffer1[1] == '$' && buffer1[2] == ':')
        {

            unsigned char checksum = 0x00;
		    for(unsigned char index = 0; index < 5; index++)
			{
                checksum ^= buffer1[index];
            }

            if (buffer1[5] == checksum)
                check = "PACOTE V�LIDO";
            else
                check = "PACOTE INV�LIDO";


            // Calculo da temperatura conforme os bytes recebidos (10 bits).
            valor = (buffer1[3] << 8) + (buffer1[4]);
            itens[Tatual] = (valor * 0.004887585532749);

            //------- Gr�fico de sinais ------------------------------------------

            // Verifica��o do fim do gr�fico.
            if (posicao_do_grafico == max_tela + 1)
            {
                posicao_do_grafico = 0;
            }

            // Plotagem dos dados sincronizados com a thread.
            Synchronize(FSerialPort->AtualizaGrafico);

            // Incremento da posi��o do gr�fico.
            posicao_do_grafico++;

            // Atualiza��o do chart com os novos dados.
            FSerialPort->GraficoLinha->Refresh();

            // Grava o canal 1 no arquivo.
            char timeStr[9];
            _strtime( timeStr );
//            char hora[9] = timeStr;
            if(itens[Tatual] >= hourToSec)
            {
                //Gravar em outro arquivo
            }else{ //grava no arquivo
               // result = fwrite (&itens[Tatual], sizeof(double), 1, arq_dados);
                    fprintf(arq_dados,"%0.3f\n", itens[Tatual]);

            }

            //------- Gr�fico de sinais ------------------------------------------

            // Apresenta a sa�da.
            saida = saida + DateTimeToStr(Now()) +  " - " + "Temperatura: "  + FloatToStrF(itens[Tatual], ffFixed,10,3) + " [V] " +
                            " inteiro: " + IntToStr(valor) + " - " + check;

            FSerialPort->Log->Lines->Add(saida);
        }
        else
        {
            // Sa�da indicando erro de recebimento de pacotes.
            saida = saida + "\nErro no recebimento do pacote de dados!";

            // Apresenta a sa�da.
            FSerialPort->Log->Lines->Add(saida);
        }
    }
}


void __fastcall TFSerialPort::horalabelClick(TObject *Sender)
{
   char timeStr[9];
   _strtime( timeStr );
   horalabel->SetTextBuf(timeStr);
}
//---------------------------------------------------------------------------




