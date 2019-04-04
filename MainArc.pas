unit MainArc;
                        
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ActnList, Menus, ToolWin, FIBDatabase, USMessages;

type
  TFormMainArc = class(TForm)
    MainMenu1: TMainMenu;
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    ActionPens2006: TAction;
    ToolButton1: TToolButton;
    N1: TMenuItem;
    N20071: TMenuItem;
    N2: TMenuItem;
    ActionArc: TAction;
    ToolButton2: TToolButton;
    N3: TMenuItem;
    ActEditPensSpra: TAction;
    N20072: TMenuItem;
    ActionArcTot: TAction;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    N4: TMenuItem;
    ActionEditSecret: TAction;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionPens2006Execute(Sender: TObject);
    procedure ActionArcExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StartTransactionSal;
    procedure StartTransactionArc;
    procedure EndTransactionSal;
    procedure EndTransactionArc;
    procedure FormCreate(Sender: TObject);
    procedure ActEditPensSpraExecute(Sender: TObject);
    procedure ActionArcTotExecute(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure ActionEditSecretExecute(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);

  private
    { Private declarations }
     NmbOfTransactSal:integer;
     NmbOfTransactArc:integer;
     procedure SXTRStarted(var Msg:TMessage); message SX_TRSTARTED;

  public
    { Public declarations }
    procedure ShowNmbOfTransAct;

  end;

var
  FormMainArc: TFormMainArc;

implementation
 uses UFibModule, uFormEditPensSpr,uFormArc,uFormPensSprPra,uFormArcTot,UFormSecretSotr,
      UInitArc,USQLunit;

{$R *.dfm}

procedure TFormMainArc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if (Application.MessageBox('Выйти из программы?','Запрос',mb_YesNo)=IDYES) then
        begin
             if FIB.pFIBDatabaseSal.Connected then
                FIB.pFIBDatabaseSal.Connected:=false;
             if FIB.pFIBDatabaseArc.Connected then
                FIB.pFIBDatabaseArc.Connected:=false;
             Action:=caFree;
        end
     else
        Action:=caNone;

end;

procedure TFormMainArc.ActionPens2006Execute(Sender: TObject);
begin
    Application.CreateForm(TFormEditPensSpr, FormEditPensSpr);
    FormEditPensSpr.ShowModal;
end;

procedure TFormMainArc.ActionArcExecute(Sender: TObject);
begin
    Application.CreateForm(TFormArc, FormArc);
    FormArc.ShowModal;
end;

procedure TFormMainArc.FormShow(Sender: TObject);
var CurrWrk:Integer;
    CurrWrkFio:string;
    CurrWrkSecretTabno:Integer;
begin
     CurrWrk    := FIB.GetShifrWrk;
     CurrWrkFio := FIB.GetFioCurrWrk(CurrWrk);
     CurrWrkSecretTabno := FIB.GetShifrSecretRight;
     Caption:=CurrWrkFio;
end;
procedure TFormMainArc.StartTransactionSal;
  begin
        Inc(NmbOfTransactSal);
        Self.ShowNmbOfTransAct;
  end;
procedure TFormMainArc.StartTransactionArc;
  begin
        Inc(NmbOfTransactArc);
        Self.ShowNmbOfTransAct;
  end;
procedure TFormMainArc.EndTransactionArc;
  begin
        Dec(NmbOfTransactArc);
        Self.ShowNmbOfTransAct;
  end;
procedure TFormMainArc.EndTransactionSal;
  begin
        Dec(NmbOfTransactSal);
        Self.ShowNmbOfTransAct;
  end;
procedure TFormMainArc.ShowNmbOfTransAct;
 begin
      StatusBar1.Panels[2].Text:=IntToStr(NmbOfTransactSal)+'-'+IntToStr(NmbOfTransactArc);
      Application.ProcessMessages;
 end;

procedure TFormMainArc.FormCreate(Sender: TObject);
begin
     NmbOfTransactSal:=0;
     NmbOfTransactArc:=0;

     if not InitParamFromIniFile then
        Halt;
     if Block_Program then
        begin
             ShowMessage('Воспользуйтесь программой с нового сервера. Пожалуйста!');
             Halt;
        end;
     uSQLUnit.setSal;

   {
     Fib.pFIBDatabaseSal.AfterStartTransaction := StartTransactionSal;
     Fib.pFIBDatabaseArc.AfterStartTransaction := StartTransactionArc;
     FIB.pFIBDatabaseSal.AfterEndTransaction   := EndTransactionDatabaseSal;
     FIB.pFIBDatabaseArc.AfterEndTransaction   := EndTransactionDatabaseArc;
}
end;

procedure TFormMainArc.ActEditPensSpraExecute(Sender: TObject);
begin
    Application.CreateForm(TFormPensSprPra, FormPensSprPra);
    FormPensSprPra.ShowModal;
end;

procedure TFormMainArc.ActionArcTotExecute(Sender: TObject);
begin
    Application.CreateForm(TFormArcTot, FormArcTot);
    FormArcTot.ShowModal;
end;

procedure TFormMainArc.N4Click(Sender: TObject);
begin
     ActionArcTotExecute(Sender);
end;

procedure TFormMainArc.SXTRStarted(var Msg:TMessage);
 begin
{       ShowMessage('Event '+IntToStr(Msg.Msg)+' WParam='+IntToStr(Msg.WParam)+' LParam='+IntToStr(Msg.LParam));}
       case Msg.WParam of
         1 : case Msg.LParam of
                     1 : StartTransactionSal;
                     2 : EndTransactionSal;
             end;
         2 : case Msg.LParam  of
                     1 : StartTransactionArc;
                     2 : EndTransactionArc;
             end
       end
 end;

procedure TFormMainArc.ActionEditSecretExecute(Sender: TObject);
begin
    Application.CreateForm(TFormTabnoSecret, FormTabnoSecret);
    FormTabnoSecret.ShowModal;
end;

procedure TFormMainArc.N5Click(Sender: TObject);
begin
     ActionEditSecretExecute(Sender);
end;

procedure TFormMainArc.N7Click(Sender: TObject);
begin
      Self.Close;
end;

procedure TFormMainArc.N6Click(Sender: TObject);
begin
     Self.Close;
end;

end.
