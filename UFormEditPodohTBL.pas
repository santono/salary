unit UFormEditPodohTBL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxCntner, dxDBGrid,
  ExtCtrls, DBCtrls;

type
  TFormEditPodohTBL = class(TForm)
    pFIBDataSetPodoh: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSetPodohDATEFR: TFIBDateField;
    pFIBDataSetPodohSUMMALGOTY: TFIBBCDField;
    pFIBDataSetPodohLIMITLGOTY: TFIBBCDField;
    pFIBDataSetPodohPROC: TFIBBCDField;
    DataSourcePo: TDataSource;
    dxDBGridPo: TdxDBGrid;
    dxDBGridPoDATEFR: TdxDBGridDateColumn;
    dxDBGridPoSUMMALGOTY: TdxDBGridCalcColumn;
    dxDBGridPoLIMITLGOTY: TdxDBGridCalcColumn;
    dxDBGridPoPROC: TdxDBGridCalcColumn;
    pFIBDataSetPodohLIMITFORSEC: TFIBBCDField;
    pFIBDataSetPodohADDPODOH: TFIBBCDField;
    pFIBDataSetPodohPROCADD: TFIBBCDField;
    dxDBGridPoLimitSec: TdxDBGridCalcColumn;
    dxDBGridPoAddPodoh: TdxDBGridCalcColumn;
    dxDBGridPoProcAdd: TdxDBGridCalcColumn;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditPodohTBL: TFormEditPodohTBL;

implementation
 uses FIB;

{$R *.dfm}

procedure TFormEditPodohTBL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetPodoh.Active then
        pFIBDataSetPodoh.Active := false;
     if pFIBDataSetPodoh.Transaction.Active then
        pFIBDataSetPodoh.Transaction.COMMIT;
     if pFIBDataSetPodoh.UpdateTransaction.Active then
        pFIBDataSetPodoh.UpdateTransaction.COMMIT;
     Action:=caFree;
end;

procedure TFormEditPodohTBL.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetPodoh.Transaction.Active then
        pFIBDataSetPodoh.Transaction.StartTransaction;
     if not pFIBDataSetPodoh.Active then
        pFIBDataSetPodoh.Active:=true;
end;

end.
