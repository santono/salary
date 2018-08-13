unit UFormSeekUwolReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, DBCtrls;

type
  TFormSeekUwolReason = class(TForm)
    dsoUwol: TDataSource;
    dsUwolSpr: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsUwolSprID: TFIBSmallIntField;
    dsUwolSprCODE_EIAC: TFIBStringField;
    dsUwolSprNAME: TFIBStringField;
    dsUwolSprREASON: TFIBStringField;
    dxUwol: TdxDBGrid;
    dxUwolID: TdxDBGridMaskColumn;
    dxUwolCODE_EIAC: TdxDBGridMaskColumn;
    dxUwolNAME: TdxDBGridMaskColumn;
    dxUwolREASON: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxUwolDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    code_uwol: Integer;
    desc_uwol: string;
    procedure setActiveRow;
    { Public declarations }
  end;

var
  FormSeekUwolReason: TFormSeekUwolReason;

implementation

{$R *.dfm}

procedure TFormSeekUwolReason.FormCreate(Sender: TObject);
begin
      dsUwolSpr.Transaction.StartTransaction;
      dsUwolSpr.Open;
end;

procedure TFormSeekUwolReason.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsUwolSpr.Close;
     dsUwolSpr.Transaction.Commit;
end;

procedure TFormSeekUwolReason.dxUwolDblClick(Sender: TObject);
begin
     code_uwol:=dsUwolSprID.Value;
     desc_uwol:=Trim(dsUwolSprREASON.Value)+' '+trim(dsUwolSprName.Value);
     ModalResult:=mrOk;
end;

procedure TFormSeekUwolReason.setActiveRow;
 begin
      if code_uwol>0 then
         begin
              dsUwolSpr.Locate('id',code_uwol,[loCaseInsensitive, loPartialKey]);
         end;
 end;

end.
