unit UFormMinSal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, DB, FIBDataSet,
  FIBDatabase, pFIBDatabase, pFIBDataSet, dxDBTLCl, dxGrClms, ExtCtrls,
  DBCtrls;

type
  TFormMinSalSpr = class(TForm)
    pFIBDataSetMinSal: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    DataSourceMinSal: TDataSource;
    pFIBDataSetMinSalDATEFR: TFIBDateField;
    pFIBDataSetMinSalLIMPROC: TFIBBCDField;
    pFIBDataSetMinSalLIMITMAX: TFIBBCDField;
    pFIBDataSetMinSalPROCSSDOLIM: TFIBBCDField;
    pFIBDataSetMinSalPROCSSAFTERLIM: TFIBBCDField;
    pFIBDataSetMinSalMINSAL: TFIBBCDField;
    pFIBDataSetMinSalPROGMIN: TFIBBCDField;
    dxDBGridMinSal: TdxDBGrid;
    dxDBGridMinSalDATEFR: TdxDBGridDateColumn;
    dxDBGridMinSalLIMPROC: TdxDBGridCalcColumn;
    dxDBGridMinSalLIMITMAX: TdxDBGridCalcColumn;
    dxDBGridMinSalPROCSSDOLIM: TdxDBGridCalcColumn;
    dxDBGridMinSalPROCSSAFTERLIM: TdxDBGridCalcColumn;
    dxDBGridMinSalMINSAL: TdxDBGridCalcColumn;
    dxDBGridMinSalPROGMIN: TdxDBGridCalcColumn;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMinSalSpr: TFormMinSalSpr;

implementation
  uses FIB;

{$R *.dfm}

procedure TFormMinSalSpr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetMinSal.Active then
        pFIBDataSetMinSal.Active := false;
     if pFIBDataSetMinSal.Transaction.Active then
        pFIBDataSetMinSal.Transaction.COMMIT;
     if pFIBDataSetMinSal.UpdateTransaction.Active then
        pFIBDataSetMinSal.UpdateTransaction.COMMIT;
     Action:=caFree;
end;

procedure TFormMinSalSpr.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetMinSal.Transaction.Active then
        pFIBDataSetMinSal.Transaction.StartTransaction;
     if not pFIBDataSetMinSal.Active then
        pFIBDataSetMinSal.Active:=true;
end;

end.
