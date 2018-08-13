unit UFormTestP4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  FIBQuery, pFIBQuery, StdCtrls, Buttons;

type
  TFormTestP4 = class(TForm)
    PageControl1: TPageControl;
    Tab6: TTabSheet;
    Tab7: TTabSheet;
    pFIBDataSetAdd: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    pFIBTransaction2: TpFIBTransaction;
    pFIBDataSetAddTABNO: TFIBIntegerField;
    pFIBDataSetAddFIO: TFIBStringField;
    pFIBDataSetAddNAL_CODE: TFIBStringField;
    pFIBDataSetAddSUM_TOTAL_6: TFIBBCDField;
    pFIBDataSetAddSUM_TOTAL_7: TFIBBCDField;
    pFIBDataSetAddSUM_SAL: TFIBBCDField;
    dxDBGridAdd: TdxDBGrid;
    DataSourceAdd: TDataSource;
    dxDBGridAddTABNO: TdxDBGridMaskColumn;
    dxDBGridAddFIO: TdxDBGridMaskColumn;
    dxDBGridAddNAL_CODE: TdxDBGridMaskColumn;
    dxDBGridAddSUM_TOTAL_6: TdxDBGridCurrencyColumn;
    dxDBGridAddSUM_TOTAL_7: TdxDBGridCurrencyColumn;
    dxDBGridAddSUM_SAL: TdxDBGridCurrencyColumn;
    pFIBDataSetPens: TpFIBDataSet;
    pFIBTransaction3: TpFIBTransaction;
    pFIBTransaction4: TpFIBTransaction;
    DataSourcePens: TDataSource;
    pFIBDataSetPensTABNO: TFIBIntegerField;
    pFIBDataSetPensFIO: TFIBStringField;
    pFIBDataSetPensNAL_CODE: TFIBStringField;
    pFIBDataSetPensSUM_INS_6: TFIBBCDField;
    pFIBDataSetPensSUM_INS_7: TFIBBCDField;
    pFIBDataSetPensSUM_PENS: TFIBBCDField;
    dxDBGridPens: TdxDBGrid;
    dxDBGridPensTABNO: TdxDBGridMaskColumn;
    dxDBGridPensFIO: TdxDBGridMaskColumn;
    dxDBGridPensNAL_CODE: TdxDBGridMaskColumn;
    dxDBGridPensSUM_INS_6: TdxDBGridCurrencyColumn;
    dxDBGridPensSUM_INS_7: TdxDBGridCurrencyColumn;
    dxDBGridPensSUM_PENS: TdxDBGridCurrencyColumn;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction5: TpFIBTransaction;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure ReOpenDataSets;
    { Private declarations }
  public
     Y,M : integer;
    { Public declarations }
  end;

var
  FormTestP4: TFormTestP4;

implementation
  uses UFIBModule, uFormWait;

{$R *.dfm}

procedure TFormTestP4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetAdd.Active then
        pFIBDataSetAdd.Close;
     if pFIBDataSetPens.Active then
        pFIBDataSetPens.Close;
     if pFIBDataSetAdd.Transaction.Active then
        pFIBDataSetAdd.Transaction.Commit;
     if pFIBDataSetPens.Transaction.Active then
        pFIBDataSetPens.Transaction.Commit;
     if pFIBDataSetPens.UpdateTransaction.Active then
        pFIBDataSetPens.UpdateTransaction.Commit;
     if pFIBDataSetAdd.UpdateTransaction.Active then
        pFIBDataSetAdd.UpdateTransaction.Commit;

     Action:=caFree;
end;

procedure TFormTestP4.FormCreate(Sender: TObject);
begin
//     Caption:=Trim(Caption)+' '+IntToStr(M)+' '+IntToStr(Y);
     ReOpenDataSets;
end;



procedure TFormTestP4.BitBtn1Click(Sender: TObject);
begin
      if pFIBQuery1.Transaction.Active then
         pFIBQuery1.Transaction.Commit;
      pFIBQuery1.Transaction.StartTransaction;
      if PFIBQuery1.Open then
         PFIBQuery1.Close;
      pFIBQuery1.SQL.Add('EXECUTE PROCEDURE PR_P4_TEST('+IntToSTr(Y)+','+IntToStr(M)+')');
      FormWait.Show;
      Application.ProcessMessages;
      pFIBQuery1.ExecQuery;
      FormWait.Hide;
      Application.ProcessMessages;
      PFIBQuery1.Close;
      pFIBQuery1.Transaction.Commit;
      ReOpenDataSets;
      Application.ProcessMessages;
end;

procedure TFormTestP4.ReOpenDataSets;
  begin
     if pFIBDataSetAdd.Transaction.Active then
        pFIBDataSetAdd.Transaction.Commit;
     pFIBDataSetAdd.Transaction.StartTransaction;
     if pFIBDataSetPens.Transaction.Active then
        pFIBDataSetPens.Transaction.Commit;
     pFIBDataSetPens.Transaction.StartTransaction;
     if pFIBDataSetAdd.Active then
        pFIBDataSetAdd.Close;
     pFIBDataSetAdd.Open;
     if pFIBDataSetPens.Active then
        pFIBDataSetPens.Close;
     pFIBDataSetPens.Open;


  end;


end.
