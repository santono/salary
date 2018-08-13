unit UFormDolg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBCtrl, dxDBGrid, dxTL, dxDBTLCl, dxGrClms, dxCntner,
  ExtCtrls, DBCtrls;

type
  TFormDolg = class(TForm)
    pFIBDataSetDolg: TpFIBDataSet;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetDolgSHIFRDOL: TFIBIntegerField;
    pFIBDataSetDolgNAME: TFIBStringField;
    pFIBDataSetDolgRAZR: TFIBIntegerField;
    pFIBDataSetDolgOKLAD: TFIBBCDField;
    dxDBGridDolg: TdxDBGrid;
    DataSourceDolg: TDataSource;
    dxDBGridDolgSHIFRDOL: TdxDBGridCalcColumn;
    dxDBGridDolgNAME: TdxDBGridMaskColumn;
    dxDBGridDolgRAZR: TdxDBGridCalcColumn;
    dxDBGridDolgOKLAD: TdxDBGridCalcColumn;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDolg: TFormDolg;

implementation
 uses UFibModule;

{$R *.dfm}

procedure TFormDolg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetDolg.Active then
        pFIBDataSetDolg.Active:=false;
     if pFIBDataSetDolg.Transaction.Active then
        pFIBDataSetDolg.Transaction.Commit;
     if pFIBDataSetDolg.UpdateTransaction.Active then
        pFIBDataSetDolg.UpdateTransaction.Commit;
      Action:=caFree;
end;

procedure TFormDolg.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetDolg.Transaction.Active then
        pFIBDataSetDolg.Transaction.StartTransaction;
     if not pFIBDataSetDolg.Active then
        pFIBDataSetDolg.Active:=true;
end;

end.
