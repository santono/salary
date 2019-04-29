unit UFormSearchClassificator;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, StdCtrls, Buttons, cxControls, cxContainer, cxEdit,
  cxTextEdit, ExtCtrls, DBCtrls, dxTL, dxDBCtrl, dxDBGrid, DB, FIBDataSet,
  dxCntner, FIBDatabase, pFIBDatabase, pFIBDataSet;

type
  TFormSearchClassificator = class(TForm)
    dsClassificator: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsoClassificator: TDataSource;
    dxDBGridCla: TdxDBGrid;
    dsClassificatorKODKP: TFIBStringField;
    dsClassificatorKODZKPPTR: TFIBStringField;
    dsClassificatorETKD: TFIBStringField;
    dsClassificatorDKHP: TFIBStringField;
    dsClassificatorNAME: TFIBStringField;
    dsClassificatorID: TFIBIntegerField;
    dxDBGridClaKODKP: TdxDBGridMaskColumn;
    dxDBGridClaKODZKPPTR: TdxDBGridMaskColumn;
    dxDBGridClaETKD: TdxDBGridMaskColumn;
    dxDBGridClaDKHP: TdxDBGridMaskColumn;
    dxDBGridClaNAME: TdxDBGridMaskColumn;
    dxDBGridClaID: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    cxTextEditFilter: TcxTextEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dxDBGridClaDblClick(Sender: TObject);
  private
    { Private declarations }
    filterActive:boolean;
    filterExpression:string;
  public
    { Public declarations }
  end;

var
  FormSearchClassificator: TFormSearchClassificator;

implementation

{$R *.dfm}

procedure TFormSearchClassificator.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//     dsClassificator.Close;
//     dsClassificator.Transaction.Commit;
//     Action:=caFree;
end;

procedure TFormSearchClassificator.FormCreate(Sender: TObject);
begin
     filterActive:=false;
     filterExpression:='';
     bitbtn2.Hide;
     bitbtn2.Enabled := false;
     dsClassificator.Transaction.StartTransaction;
     dsClassificator.Open;
end;

procedure TFormSearchClassificator.BitBtn2Click(Sender: TObject);
begin
     bitbtn2.Hide;
     bitbtn2.Enabled:=false;
     filterActive:=false;
//     filterExpression:='';
     dsClassificator.Filtered:=false;
     bitbtn1.Show;
     bitbtn1.Enabled:=true;
end;

procedure TFormSearchClassificator.BitBtn1Click(Sender: TObject);
var s:string;
begin
     filterExpression:=cxTextEditFilter.Text;
     if length(trim(filterExpression))<1 then
        begin
             showMessage('Фильтр не установлен');
             exit;
        end;
     bitbtn1.Hide;
     bitbtn1.Enabled:=false;
     filterActive:=true;
     filterExpression:=trim(filterExpression);
     s:=AnsiUpperCase(filterExpression);
     dsClassificator.Filter:='UPPER(NAME)  LIKE ' + #39 + '%'+s + '%' + #39;
     dsClassificator.Filtered:=true;
     bitbtn2.Show;
     bitbtn2.Enabled:=true;

end;

procedure TFormSearchClassificator.dxDBGridClaDblClick(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

end.
