//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>  
#include <vector.h>
#include <string.h>
#pragma hdrstop

#include "USerialCommunication.h"
#include "PortaSerial.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TFSerialPort *FSerialPort;

SerialPort *PortaSerial;

bool atuador1 = false;
bool atuador2 = false;

double tensao1 = 0;
int valor = 0;

AnsiString saida;

//Declaração das Threads de processamento.
Thread *ProcessaGrafico;

//------- Gráfico de sinais ------------------------------------------

FILE *arq_dados;

unsigned int max_tela = 100;
unsigned int i = 0;
unsigned int j = 0;
unsigned int posicao_do_grafico = 0;
unsigned char buffer[256] = {0};
bool LeArquivo = false;


//Declaração de Variáveis. --------------------------------------------------
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

float tensao = 0;
//---------------------------------------------------------------------------

__fastcall TFSerialPort::TFSerialPort(TComponent* Owner)
    : TForm(Owner)
{


}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::FormCreate(TObject *Sender)
{
    //------- Gráfico de sinais ------------------------------------------

    // Redimensiona o valor máximo do eixo x com o tamanho da tela desejada.
    GraficoLinha->BottomAxis->Maximum = max_tela;

    // Expande o gráfico para comportar a quantidade de amostras contidas em max_tela.
    for (unsigned int a = 0; a < max_tela+1; a++)
    {
        GraficoLinha->Series[0]->AddY(0);
    }

    // Atualiza o chart.
    GraficoLinha->Refresh();


    // Decalaração do ponteiro do arquivo que armazena os dados.
    arq_dados = fopen("dados.txt","w");

    //------- Gráfico de sinais ------------------------------------------



    // Verifica quais portas seriais estão disponíveis/conectadas.
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
/*
    unsigned char buffer[100] = {0};
    double tensao1 = 0;
    int valor = 0;
    AnsiString saida;

    //

    //Envia o buffer pela porta serial.
    PortaSerial->WriteABuffer("A", 1);

    //Instante de tempo para receber resposta do mestre.
    Sleep(50);

    //Armazena em buffer a resposta enviada pelo mestre com as temperaturas.
     strcpy(buffer, PortaSerial->ReadABuffer());

    //------------------------------------------------------------------------
    // AQUISIÇÃO DOS PACOTES DE DADOS DE MODO CONTÍNUO.
    //------------------------------------------------------------------------

    //Verificação e Validação do pacote de dados recebido.
    if (buffer[0] == '#' && buffer[1] == ':' && buffer[8] == ';')
    {
        //Elimina o zero ASCII e coloca o Zero numérico para a conversão.
        if (buffer[2] == '0') buffer[2] = 0x00;
        if (buffer[3] == '0') buffer[3] = 0x00;
        if (buffer[4] == '0') buffer[4] = 0x00;
        if (buffer[5] == '0') buffer[5] = 0x00;
        if (buffer[6] == '0') buffer[6] = 0x00;
        if (buffer[7] == '0') buffer[7] = 0x00;

        //Calculo da temperatura conforme os bytes recebidos (10 bits).
        valor = (buffer[2] << 8) + (buffer[3]);
        tensao1 = (valor * 0.004887585532749);

        //------- Gráfico de sinais ------------------------------------------

        //Verificação do fim do gráfico.
        if (posicao_do_grafico == max_tela+1)
        {
            posicao_do_grafico = 0;
        }

        //Plotagem dos dados.
        GraficoLinha->Series[0]->YValues->Value[posicao_do_grafico] = tensao1;

        //Incremento da posição do gráfico.
        posicao_do_grafico++;

        //Atualização do chart com os novos dados.
        GraficoLinha->Refresh();


        // Grava o canal 1 no arquivo.
        fprintf(arq_dados,"%0.2f\n", tensao1);

        //------- Gráfico de sinais -----------------------------------------
        saida ="Tensao1: "  + FloatToStrF(tensao1, ffFixed,10,2) + " [V] ";

        //Apresenta a saída.
        Log->Lines->Add(saida);
    }
    else
    {
        //Saída indicando erro de recebimento de pacotes.
        saida = saida + "\nErro no recebimento do pacote de dados!";

        //Apresenta a saída.
        Log->Lines->Add(saida);
    }
}

//---------------------------------------------------------------------------
*/
  /*
    char buff[100];

    if (PortaSerial != NULL)
    {
        if (!atuador1)
        {
            //Envia o buffer pela porta serial.
            PortaSerial->WriteABuffer("B",2);
            Sleep(100);
            strcpy(buff,PortaSerial->ReadABuffer());


        }
        else
        {
            //Envia o buffer pela porta serial.
            PortaSerial->WriteABuffer("C",2);
            Sleep(100);
            strcpy(buff,PortaSerial->ReadABuffer());


        }
        
        Log->Lines->Add(buff);
    }
}

//---------------------------------------------------------------------------
  *//*

    char buff[100];

    if (PortaSerial != NULL)
    {
        if (!atuador2)
        {
            //Envia o buffer pela porta serial.
            PortaSerial->WriteABuffer("D",2);
            Sleep(100);

            strcpy(buff,PortaSerial->ReadABuffer());

        }
        else
        {
            //Envia o buffer pela porta serial.
            PortaSerial->WriteABuffer("E",2);
            Sleep(100);
            strcpy(buff,PortaSerial->ReadABuffer());

          
        }

        Log->Lines->Add(buff);
    }
}
*/
//---------------------------------------------------------------------------
void __fastcall TFSerialPort::BtOpenPortClick(TObject *Sender)
{
    //Configurações da Porta Serial selecionada.
    PortaSerial = new SerialPort();
    PortaSerial->OpenSerialPort(CbSerialPort1->Text, CbBaudRate1->Text);

    CheckBoxModoContinuo->Enabled = true;
    LeArquivo = false;
    Log->Lines->Add("Porta Serial Aberta...");
    // Decalaração do ponteiro do arquivo que armazena os dados.
    arq_dados = fopen("dados.txt","w");

    // Declaração da thread para leitura dos pacotes e plotagem do gráfico.
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

     // Verificação da instância da thread de atualização do gráfico.
    if (ProcessaGrafico != NULL)
    {
        //ProcessaGrafico->WaitFor();
        ProcessaGrafico->Terminate();
        delete ProcessaGrafico;
        ProcessaGrafico = NULL;

        Log->Lines->Add("finalizou a thread e deletou a instância.");
    }

     // Verificação da instância da porta serial.
    if (PortaSerial != NULL)
    {
        Sleep(1000);
        PortaSerial->CloseSerialPort();

        Log->Lines->Add("Porta Serial Fechada...");
    }

    delete PortaSerial;
    PortaSerial = NULL;

    //Fecha o arquivo e salva alterações.
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
    // Verifica quais portas seriais estão disponíveis/conectadas.
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
    //------- Gráfico de sinais ------------------------------------------
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
                MessageDlg("Não há padrões selecionados", mtError, TMsgDlgButtons() << mbOK,0);

        }

        fclose(arq);
    }
}

//---------------------------------------------------------------------------


/*



 FILE *arq_conjuntos;
  AnsiString nome_arquivo_conjuntos;
  bool padroes_sem_valores=false;

  if (!FLBConjuntoTreinamento->FileName.IsEmpty())
  {
    //Sugere o nome do arquivo em edição.
    SDConjuntos->FileName=FLBConjuntoTreinamento->FileName;
  }
  else
  {
    //Sugere o nome do arquivo em edição.
    SDConjuntos->FileName = "Arquivo";
  }

  //Verificação se foi incluido algum padrão para ser salvo.
  if (numero_arquivos > 0)
  {
    for (int a = 0; a < SGArquivosPadroes->RowCount - 1; a++)
    {
      if (SGArquivosPadroes->Cells[3][a + 1].IsEmpty())
      {
        padroes_sem_valores = true;
      }
    }

    if (!padroes_sem_valores)
    {
      //Abre janela para salvar o arquivo de conjunto de padrões.
      if (SDConjuntos->Execute())
      {
        nome_arquivo_conjuntos = SDConjuntos->FileName;
        arq_conjuntos = fopen(nome_arquivo_conjuntos.c_str(),"w");

        numero_padroes = SGArquivosPadroes->RowCount - 1;
        fprintf(arq_conjuntos,"%d\n", numero_padroes);
        fprintf(arq_conjuntos,"%d\n", numero_amostras_padrao);

        for (int a = 0; a < SGArquivosPadroes->RowCount - 1; a++)
        {
          fprintf(arq_conjuntos,"\n%s\t", SGArquivosPadroes->Cells[0][a + 1]);
          fprintf(arq_conjuntos,"%d", StrToInt(SGArquivosPadroes->Cells[3][a + 1]));
        }

        //Atualiza o FileListBox dos Conjuntos de treinamento e validação.
        FLBConjuntoTreinamento->Update();

        //Fecha o arquivo e salva alterações.
        fclose(arq_conjuntos);
      }
    }
    else
    {
      MessageDlg("Padrões selecionados sem valor correspondente", mtError, TMsgDlgButtons() << mbOK,0);
    }
  }
  else
  {
    MessageDlg("Não há padrões selecionados", mtError, TMsgDlgButtons() << mbOK,0);
  }



*/


void __fastcall TFSerialPort::Abri1Click(TObject *Sender)
{
    // Atribui o diretório inicial dos arquivos.
    OpenDialog1->InitialDir = "c:\\Desenvolvimento\\";

    // Executa OpenDialog para seleção do arquivo.
    if (OpenDialog1->Execute())
    {
        LeArquivo = true;

        // Fecha o ponteiro do arquivo de dados caso esteja aberto.
        if (arq_dados != NULL)
        {
            fclose(arq_dados);
        }

        // Atribuição do nome do arquivo selecionado para utilização global.
        NomeArquivoDeDados = OpenDialog1->FileName;

        // Abertura do arquivo para verificação configuração inicial.
        arq_dados = fopen(NomeArquivoDeDados.c_str(), "rb");

        // Posiciona o Ponteiro do Arquivo.
        PosicaoAtual = 0;
        fseek(arq_dados, 0, 0);
        fseek(arq_dados, PosicaoAtual, 1);  // Modificar a posição do ponteiro de arquivo para buscar mais janelas de pontos.

        // Posiciona o Ponteiro no fim do Arquivo.
        //fseek(arq_dados, 0, 2);
        //PosicaoFinal = ftell(arq_dados);

        // Limpa todas as séries criadas.
        GraficoLinha->Series[i]->Clear();

        // Deve ser preenchido as séries com valores iniciais para poderem ser trabalhadas.
        for (unsigned int i = 0; i < GraficoLinha->BottomAxis->Maximum; i++)
        {
            GraficoLinha->Series[j]->AddY(0.0);
        }

        // Deve ser preenchido as séries com valores iniciais para poderem ser trabalhadas.
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
    // Plota a amostra no gráfico.
    FSerialPort->GraficoLinha->Series[0]->YValues->Value[posicao_do_grafico] = tensao1;
}


//---------------------------------------------------------------------------//
//                Declaração da thread de processamento                      //
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
        // AQUISIÇÃO DOS PACOTES DE DADOS DE MODO CONTÍNUO.
        //------------------------------------------------------------------------

        // Verificação e Validação do pacote de dados recebido.
        if (buffer1[0] == '#' && buffer1[1] == '$' && buffer1[2] == ':')
        {

            unsigned char checksum = 0x00;
		    for(unsigned char index = 0; index < 5; index++)
			{
                checksum ^= buffer1[index];
            }

            if (buffer1[5] == checksum)
                check = "PACOTE VÁLIDO";
            else
                check = "PACOTE INVÁLIDO";


     /*


    while (RxBytes > 0)
    {
        FT_Read(Dev->Handle,Buf,RxBytes < 256 ? RxBytes : 256,&BytesRead);
        RxBytes -= BytesRead;

        if (!Dev->RxFile)
        {
            char *s = Buf;
            while (BytesRead--)
                W->PutChar(*s++);

            W->PutStr(Buf,BytesRead);
            W->Flush();
        }
        else
        {
            fwrite(Buf,1,BytesRead,Dev->RxFile);
        }
    }

       */


            // Calculo da temperatura conforme os bytes recebidos (10 bits).
            valor = (buffer1[3] << 8) + (buffer1[4]);
            tensao1 = (valor * 0.004887585532749);

            //------- Gráfico de sinais ------------------------------------------

            // Verificação do fim do gráfico.
            if (posicao_do_grafico == max_tela + 1)
            {
                posicao_do_grafico = 0;
            }

            // Plotagem dos dados sincronizados com a thread.
            Synchronize(FSerialPort->AtualizaGrafico);

            // Incremento da posição do gráfico.
            posicao_do_grafico++;

            // Atualização do chart com os novos dados.
            FSerialPort->GraficoLinha->Refresh();

            // Grava o canal 1 no arquivo.
            fprintf(arq_dados,"%0.3f\n", tensao1);

            //------- Gráfico de sinais ------------------------------------------

            // Apresenta a saída.
            saida = saida + "Tensão1: "  + FloatToStrF(tensao1, ffFixed,10,3) + " [V] " +
                            " inteiro: " + IntToStr(valor) + " - " + check;

            FSerialPort->Log->Lines->Add(saida);
        }
        else
        {
            // Saída indicando erro de recebimento de pacotes.
            saida = saida + "\nErro no recebimento do pacote de dados!";

            // Apresenta a saída.
            FSerialPort->Log->Lines->Add(saida);
        }
    }
}


