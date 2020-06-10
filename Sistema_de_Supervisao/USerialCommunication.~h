//---------------------------------------------------------------------------

#ifndef USerialCommunicationH
#define USerialCommunicationH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Menus.hpp>
#include <Dialogs.hpp>
#include <ComCtrls.hpp>
#include <Grids.hpp>
#include <ExtCtrls.hpp>
#include <Chart.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <Buttons.hpp>
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TFSerialPort : public TForm
{
__published:	// IDE-managed Components
    TMainMenu *MainMenu1;
    TMenuItem *Arquivo1;
    TMenuItem *N1;
    TMenuItem *Sair1;
    TMenuItem *Abri1;
    TMenuItem *Salvar1;
    TMenuItem *SalvarComo1;
    TMenuItem *Fechar1;
    TMenuItem *N2;
    TSaveDialog *SaveDialog1;
    TOpenDialog *OpenDialog1;
    TStatusBar *StatusBar1;
    TTimer *Timer1;
        TGroupBox *config;
    TLabel *Label5;
    TLabel *Label4;
    TLabel *Label3;
    TLabel *Label2;
    TLabel *Label1;
    TComboBox *ComboBox4;
    TComboBox *ComboBox3;
    TComboBox *CbParity1;
    TComboBox *CbBaudRate1;
    TComboBox *CbSerialPort1;
    TButton *BtOpenPort;
    TButton *BtClosePort;
    TEdit *EdCommand;
    TButton *Enviar;
        TPageControl *PageControl1;
        TTabSheet *TabSheet1;
        TLabel *Label10;
        TGroupBox *GroupBox1;
        TMemo *Log;
        TTabSheet *TabSheet3;
        TPanel *Panel2;
        TChart *GraficoLinha;
        TLineSeries *Series2;
        TDateTimePicker *tempo;
        TLabel *horalabel;
        TLabel *Label6;
        TLabel *Label7;
        TButton *Avancar;
        TButton *Voltar;
        TLabel *Label8;
        TLabel *Label9;
    void __fastcall BtClosePortClick(TObject *Sender);
    void __fastcall BtOpenPortClick(TObject *Sender);
    void __fastcall Sair1Click(TObject *Sender);
    void __fastcall EnviarClick(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall CbSerialPort1DropDown(TObject *Sender);
    void __fastcall GraficoLinhaAfterDraw(TObject *Sender);
    void __fastcall SalvarComo1Click(TObject *Sender);
        void __fastcall Abri1Click(TObject *Sender);
        void __fastcall AvancarClick(TObject *Sender);
        void __fastcall VoltarClick(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFSerialPort(TComponent* Owner);
    void __fastcall AtualizaGrafico();
    void __fastcall LerPortaSerial();
};


//---------------------------------------------------------------------------

class Thread : public TThread
{
        private:
        protected:
                void __fastcall Execute();

        public:
                __fastcall Thread(bool CreateSuspended);

};

//---------------------------------------------------------------------------




//---------------------------------------------------------------------------
extern PACKAGE TFSerialPort *FSerialPort;
//---------------------------------------------------------------------------
#endif
