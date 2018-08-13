unit UFormIndProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, ExtCtrls, DBCtrls, DB, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, FIBDataSet, FIBDatabase, pFIBDatabase, pFIBDataSet, dxDBTLCl,
  dxGrClms;

type
  TFormIndProc = class(TForm)
    pFIBDataSetProc: TpFIBDataSet;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetProcDATAB: TFIBDateField;
    pFIBDataSetProcKOEF: TFIBBCDField;
    dxDBGridProc: TdxDBGrid;
    DataSourceProc: TDataSource;
    DBNavigator1: TDBNavigator;
    dxDBGridProcDATAB: TdxDBGridDateColumn;
    dxDBGridProcKOEF: TdxDBGridCalcColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormIndProc: TFormIndProc;

implementation
uses UFibModule;
{$R *.dfm}

procedure TFormIndProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if pFIBDataSetProc.Active then
         pFIBDataSetProc.Close;
      if pFIBDataSetProc.Transaction.Active then
         pFIBDataSetProc.Transaction.Commit;
      if pFIBDataSetProc.UpdateTransaction.Active then
         pFIBDataSetProc.UpdateTransaction.Commit;

      Action:=caFree;
end;

procedure TFormIndProc.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetProc.Transaction.Active then
        pFIBDataSetProc.Transaction.StartTransaction;
     if not pFIBDataSetProc.Active then
        pFIBDataSetProc.Open;
end;

end.
