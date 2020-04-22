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
    TGroupBox *GroupBox3;
    TLabel *Label5;
    TLabel *Label4;
    TLabel *Label3;
    TLabel *Label2;
    TLabel *Label1;
    TBevel *Bevel1;
    TBevel *Bevel2;
    TBevel *Bevel3;
    TComboBox *ComboBox4;
    TComboBox *ComboBox3;
    TComboBox *CbParity1;
    TComboBox *CbBaudRate1;
    TComboBox *CbSerialPort1;
    TButton *BtOpenPort;
    TButton *BtClosePort;
        TCheckBox *CheckBoxModoContinuo;
    TEdit *EdCommand;
    TButton *Enviar;
        TPageControl *PageControl1;
        TTabSheet *TabSheet1;
        TLabel *Label10;
        TGroupBox *GroupBox1;
        TMemo *Log;
        TTabSheet *TabSheet2;
        TLabel *Label7;
        TPanel *Panel1;
        TChart *Chart1;
        TBarSeries *Series1;
        TTabSheet *TabSheet3;
        TPanel *Panel2;
        TChart *GraficoLinha;
        TLineSeries *Series2;
    void __fastcall BtClosePortClick(TObject *Sender);
    void __fastcall BtOpenPortClick(TObject *Sender);
    void __fastcall Sair1Click(TObject *Sender);
    void __fastcall EnviarClick(TObject *Sender);
    void __fastcall CheckBoxModoContinuoClick(TObject *Sender);
    void __fastcall Timer1Timer(TObject *Sender);
    void __fastcall FormCreate(TObject *Sender);
    void __fastcall ImValvula2Click(TObject *Sender);
        void __fastcall ImValvula1Click(TObject *Sender);
    void __fastcall CbSerialPort1DropDown(TObject *Sender);
    void __fastcall GraficoLinhaAfterDraw(TObject *Sender);
    void __fastcall SalvarComo1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
    __fastcall TFSerialPort(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFSerialPort *FSerialPort;
//---------------------------------------------------------------------------
#endif
