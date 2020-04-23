//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "USerialCommunication.h"
#include "PortaSerial.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"

TFSerialPort *FSerialPort;

SerialPort *PortaSerial;

char buffer[100];

bool atuador1 = false;
bool atuador2 = false;


//------- Gráfico de sinais ------------------------------------------

FILE *arq_dados;

unsigned int max_tela = 100;
unsigned int i = 0;
unsigned int j = 0;
unsigned int posicao_do_grafico = 0;

//------- Gráfico de sinais ------------------------------------------


//---------------------------------------------------------------------------

__fastcall TFSerialPort::TFSerialPort(TComponent* Owner)
    : TForm(Owner)
{


}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::FormCreate(TObject *Sender)
{
    // Cria as três séries em cada um dos três charts.
    Chart1->Series[0]->AddXY(0,0);
    


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

void __fastcall TFSerialPort::Timer1Timer(TObject *Sender)
{
    unsigned char buffer[100] = {0};
    double tensao1 = 0;
    int valor = 0;
    AnsiString saida;

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


        //Manipulação dos valores dos gráficos.
      Chart1->Series[0]->YValues->Value[0] = tensao1;

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
        saida = saida + "Tensao1: "  + FloatToStrF(tensao1, ffFixed,10,2) + " [V] ";

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

void __fastcall TFSerialPort::ImValvula1Click(TObject *Sender)
{
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

void __fastcall TFSerialPort::ImValvula2Click(TObject *Sender)
{
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

//---------------------------------------------------------------------------
void __fastcall TFSerialPort::BtOpenPortClick(TObject *Sender)
{
    //Configurações da Porta Serial selecionada.
    PortaSerial = new SerialPort();
    PortaSerial->OpenSerialPort(CbSerialPort1->Text, CbBaudRate1->Text);

    CheckBoxModoContinuo->Enabled = true;

    Log->Lines->Add("Porta Serial Aberta...");
}

//---------------------------------------------------------------------------

void __fastcall TFSerialPort::BtClosePortClick(TObject *Sender)
{
    CheckBoxModoContinuo->Checked = false;
    CheckBoxModoContinuo->Enabled = false;

    Timer1->Enabled = false;

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

    double xi, xf, yi, yf;

    xi = GraficoLinha->BottomAxis->CalcPosValue(posicao_do_grafico - 1);
    yi = GraficoLinha->LeftAxis->CalcPosValue(GraficoLinha->LeftAxis->Minimum) + 1;
    xf = GraficoLinha->BottomAxis->CalcPosValue(posicao_do_grafico - 1) + 5;
    yf = GraficoLinha->LeftAxis->CalcPosValue(GraficoLinha->LeftAxis->Maximum) - 1;

    GraficoLinha->Canvas->Pen->Style = psSolid;
    GraficoLinha->Canvas->Pen->Color = clBlack;
    GraficoLinha->Canvas->Brush->Color = clBlack;
    GraficoLinha->Canvas->Rectangle(xi,yi,xf,yf);

    //------- Gráfico de sinais ------------------------------------------

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








