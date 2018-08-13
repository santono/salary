unit UFormEditPensProcNalogPrep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms, dxTL, dxCntner;

type
  TFormEditPensProcNalogPrep = class(TForm)
    pFIBDataSetHea: TpFIBDataSet;
    pFIBDataSetPr: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSetHeaDATEFR: TFIBDateField;
    pFIBDataSetHeaLIMITPENS: TFIBBCDField;
    pFIBDataSetHeaID: TFIBSmallIntField;
    pFIBDataSetPrIDPENS: TFIBIntegerField;
    pFIBDataSetPrSUMMAADD: TFIBBCDField;
    pFIBDataSetPrSUMMAFR: TFIBBCDField;
    pFIBDataSetPrSUMMATO: TFIBBCDField;
    pFIBDataSetPrPROCPENS: TFIBBCDField;
    DataSourceHea: TDataSource;
    DataSourcePr: TDataSource;
    dxDBGridHea: TdxDBGrid;
    dxDBGridHeaDATEFR: TdxDBGridDateColumn;
    dxDBGridHeaLIMITPENS: TdxDBGridCalcColumn;
    dxDBGridHeaID: TdxDBGridMaskColumn;
    dxDBGridPr: TdxDBGrid;
    dxDBGridPrIDPENS: TdxDBGridMaskColumn;
    dxDBGridPrSUMMAADD: TdxDBGridCalcColumn;
    dxDBGridPrSUMMAFR: TdxDBGridCalcColumn;
    dxDBGridPrSUMMATO: TdxDBGridCalcColumn;
    dxDBGridPrPROCPENS: TdxDBGridCalcColumn;
    pFIBTransactionWritePr: TpFIBTransaction;
    pFIBTransactionReadFr: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSetHeaAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditPensProcNalogPrep: TFormEditPensProcNalogPrep;

implementation
 uses FIB;

{$R *.dfm}

procedure TFormEditPensProcNalogPrep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetHea.Active then
        pFIBDataSetHea.Active := false;
     if pFIBDataSetHea.Transaction.Active then
        pFIBDataSetHea.Transaction.COMMIT;
     if pFIBDataSetHea.UpdateTransaction.Active then
        pFIBDataSetHea.UpdateTransaction.COMMIT;
     if pFIBDataSetPr.Active then
        pFIBDataSetPr.Active := false;
     if pFIBDataSetPr.Transaction.Active then
        pFIBDataSetPr.Transaction.COMMIT;
     if pFIBDataSetPr.UpdateTransaction.Active then
        pFIBDataSetPr.UpdateTransaction.COMMIT;

     Action:=caFree;
end;

procedure TFormEditPensProcNalogPrep.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetHea.Transaction.Active then
        pFIBDataSetHea.Transaction.StartTransaction;
     if not pFIBDataSetHea.Active then
        pFIBDataSetHea.Active:=true;
     if not pFIBDataSetPr.Transaction.Active then
        pFIBDataSetPr.Transaction.StartTransaction;
     if not pFIBDataSetPr.Active then
        pFIBDataSetPr.Active:=true;
end;

procedure TFormEditPensProcNalogPrep.pFIBDataSetHeaAfterInsert(
  DataSet: TDataSet);
begin
     if pFIBDataSetPr.Active then
        pFIBDataSetPr.Active:=False;
     if not pFIBDataSetPr.Active then
        pFIBDataSetPr.Active:=True;
end;

end.
