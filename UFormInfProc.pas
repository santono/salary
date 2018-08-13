unit UFormInfProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, ExtCtrls, DBCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms;

type
  TFormInfProc = class(TForm)
    pFIBDataSetIP: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    DataSourceIP: TDataSource;
    pFIBDataSetIPDATA: TFIBDateField;
    pFIBDataSetIPPROCINF: TFIBBCDField;
    dxDBGridIP: TdxDBGrid;
    DBNavigator1: TDBNavigator;
    dxDBGridIPColumn1: TdxDBGridDateColumn;
    dxDBGridIPProc: TdxDBGridCalcColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormInfProc: TFormInfProc;

implementation
uses UFibModule;

{$R *.dfm}

procedure TFormInfProc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetIP.Active then
        pFIBDataSetIP.Close;
     if pFIBDataSetIP.Transaction.Active then
        pFIBDataSetIP.Transaction.Commit;
     if pFIBDataSetIP.UpdateTransaction.Active then
        pFIBDataSetIP.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormInfProc.FormCreate(Sender: TObject);
begin
     if pFIBDataSetIP.Active then
        pFIBDataSetIP.Close;
     if pFIBDataSetIP.Transaction.Active then
        pFIBDataSetIP.Transaction.Commit;
     if pFIBDataSetIP.UpdateTransaction.Active then
        pFIBDataSetIP.UpdateTransaction.Commit;
     pFIBDataSetIP.Transaction.StartTransaction;
     pFIBDataSetIP.Open;

end;

end.
