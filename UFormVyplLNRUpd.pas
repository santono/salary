unit UFormVyplLNRUpd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxCalc, cxDBEdit, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar, StdCtrls, Buttons, cxCheckBox,
  DBCtrls;

type
  TFormVyplLNRUpd = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBCalcEdit1: TcxDBCalcEdit;
    cxDBCalcEdit2: TcxDBCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cxDBCalcEdit3: TcxDBCalcEdit;
    cxDBCalcEdit4: TcxDBCalcEdit;
    cxDBCalcEdit5: TcxDBCalcEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    cxDBTextEdit1: TcxDBTextEdit;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVyplLNRUpd: TFormVyplLNRUpd;

implementation
  uses UFormVyplLNR,DateUtils,DB;

{$R *.dfm}

procedure TFormVyplLNRUpd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     
     if FormVyplLNR.dsVypl.State in [dsInsert,dsEdit] then
        FormVyplLNR.dsVypl.Cancel;
     Action:=caFree;
end;

procedure TFormVyplLNRUpd.BitBtn1Click(Sender: TObject);
begin
     FormVyplLNR.dsVyplYVY.Value:=yearOf(cxDBDateEdit1.Date);
     FormVyplLNR.dsVyplMVY.Value:=monthOf(cxDBDateEdit1.Date);
     FormVyplLNR.dsVypl.Post;
     Close;
end;

end.
