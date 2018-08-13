unit UFormTestE4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  FIBQuery, pFIBQuery, StdCtrls, Buttons, ExtCtrls;

type
  TFormTestE4 = class(TForm)
    PageControl1: TPageControl;
    Tab6: TTabSheet;
    Tab7: TTabSheet;
    pFIBDataSetAdd: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    pFIBTransaction2: TpFIBTransaction;
    pFIBDataSetAddTABNO: TFIBIntegerField;
    pFIBDataSetAddFIO: TFIBStringField;
    pFIBDataSetAddNAL_CODE: TFIBStringField;
    pFIBDataSetAddSUM_SAL: TFIBBCDField;
    dxDBGridAdd: TdxDBGrid;
    DataSourceAdd: TDataSource;
    dxDBGridAddTABNO: TdxDBGridMaskColumn;
    dxDBGridAddFIO: TdxDBGridMaskColumn;
    dxDBGridAddNAL_CODE: TdxDBGridMaskColumn;
    dxDBGridAddSUM_TOTAL_6: TdxDBGridCurrencyColumn;
    dxDBGridAddSUM_SAL: TdxDBGridCurrencyColumn;
    pFIBDataSetPens: TpFIBDataSet;
    pFIBTransaction3: TpFIBTransaction;
    pFIBTransaction4: TpFIBTransaction;
    DataSourcePens: TDataSource;
    pFIBDataSetPensTABNO: TFIBIntegerField;
    pFIBDataSetPensFIO: TFIBStringField;
    pFIBDataSetPensNAL_CODE: TFIBStringField;
    dxDBGridPens: TdxDBGrid;
    dxDBGridPensTABNO: TdxDBGridMaskColumn;
    dxDBGridPensFIO: TdxDBGridMaskColumn;
    dxDBGridPensNAL_CODE: TdxDBGridMaskColumn;
    dxDBGridPensSUM_INS: TdxDBGridCurrencyColumn;
    dxDBGridPensSUM_ECB: TdxDBGridCurrencyColumn;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction5: TpFIBTransaction;
    BitBtn1: TBitBtn;
    pFIBDataSetAddSUM_TOTAL: TFIBBCDField;
    pFIBDataSetPensSUM_INS: TFIBBCDField;
    pFIBDataSetPensSUM_ECB: TFIBBCDField;
    TabMinZP: TTabSheet;
    dsoE6MZ: TDataSource;
    dsoMZE6: TDataSource;
    dsE6MZ: TpFIBDataSet;
    dsMZE6: TpFIBDataSet;
    pFIBTransactionMZ: TpFIBTransaction;
    pFIBTransaction7: TpFIBTransaction;
    dsMZE6TABNO: TFIBIntegerField;
    dsMZE6FIO: TFIBStringField;
    dsMZE6YEAR_ZA: TFIBIntegerField;
    dsMZE6MONTH_ZA: TFIBIntegerField;
    dsMZE6SUMMA_RAZN: TFIBBCDField;
    dsMZE6WORKDAY: TFIBIntegerField;
    dsMZE6KOEF: TFIBBCDField;
    dsE6MZTABNO: TFIBIntegerField;
    dsE6MZFIO: TFIBStringField;
    dsE6MZPAY_YEAR: TFIBSmallIntField;
    dsE6MZPAY_MNTH: TFIBSmallIntField;
    dsE6MZSUM_DIFF: TFIBBCDField;
    dxDBGridE6MZ: TdxDBGrid;
    dsE6MZKey: TIntegerField;
    dsMZE6key: TIntegerField;
    dxDBGridE6MZTABNO: TdxDBGridMaskColumn;
    dxDBGridE6MZFIO: TdxDBGridMaskColumn;
    dxDBGridE6MZPAY_YEAR: TdxDBGridMaskColumn;
    dxDBGridE6MZPAY_MNTH: TdxDBGridMaskColumn;
    dxDBGridE6MZSUM_DIFF: TdxDBGridCurrencyColumn;
    dxDBGridE6MZKey: TdxDBGridColumn;
    dxDBGridMZE6: TdxDBGrid;
    dxDBGridMZE6TABNO: TdxDBGridMaskColumn;
    dxDBGridMZE6FIO: TdxDBGridMaskColumn;
    dxDBGridMZE6YEAR_ZA: TdxDBGridMaskColumn;
    dxDBGridMZE6MONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridMZE6SUMMA_RAZN: TdxDBGridCurrencyColumn;
    dxDBGridMZE6WORKDAY: TdxDBGridMaskColumn;
    dxDBGridMZE6KOEF: TdxDBGridCurrencyColumn;
    dxDBGridMZE6key: TdxDBGridColumn;
    Label1: TLabel;
    Label2: TLabel;
    Splitter1: TSplitter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dsE6MZCalcFields(DataSet: TDataSet);
    procedure dsMZE6CalcFields(DataSet: TDataSet);
    procedure TabMinZPResize(Sender: TObject);
  private
    procedure ReOpenDataSets;
    { Private declarations }
  public
     Y,M : integer;
    { Public declarations }
  end;

var
  FormTestE4: TFormTestE4;

implementation
  uses UFIBModule, uFormWait,scrdef;

{$R *.dfm}

procedure TFormTestE4.FormClose(Sender: TObject; var Action: TCloseAction);
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
     if isSVDN then
        begin
             if dsE6MZ.Active then
                dsE6MZ.Close;
             if dsMZE6.Active then
                dsMZE6.Close;
             if dsE6MZ.Transaction.Active then
                dsE6MZ.Transaction.Commit;
        end;


     Action:=caFree;
end;

procedure TFormTestE4.FormCreate(Sender: TObject);

begin
     if isSVDN then
        TabMinZP.TabVisible:=True
     else
        TabMinZP.TabVisible:=false;
     if isSVDN then
        begin
             Splitter1.Parent:=TabMinZP;
             Splitter1.Left  := dxDBGridE6MZ.Left + dxDBGridE6MZ.Width + 1;
             Splitter1.Align := dxDBGridE6MZ.Align;
        end;
//     Caption:=Trim(Caption)+' '+IntToStr(M)+' '+IntToStr(Y);
     ReOpenDataSets;
end;



procedure TFormTestE4.BitBtn1Click(Sender: TObject);
var SQLStmnt:string;
begin
      if pFIBQuery1.Transaction.Active then
         pFIBQuery1.Transaction.Commit;
      pFIBQuery1.Transaction.StartTransaction;
      if PFIBQuery1.Open then
         PFIBQuery1.Close;
      SQLStmnt:='select sum_ins_sv,sum_ecb_sv,sum_total_sv,sum_totalzp_sv from PR_E4_TEST('+IntToSTr(Y)+','+IntToStr(M)+')';
      pFIBQuery1.SQL.Clear;
      pFIBQuery1.SQL.Add(SQLStmnt);
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

procedure TFormTestE4.ReOpenDataSets;
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
     if isSVDN then
        begin
             if dsE6MZ.Transaction.Active then
                dsE6MZ.Transaction.Commit;
             dsE6MZ.Transaction.StartTransaction;
             if dsE6MZ.Active then
                dsE6MZ.Close;
             if dsMZE6.Active then
                dsMZE6.Close;
             dsE6MZ.Params[0].Value:=Y;
             dsE6MZ.Params[1].Value:=M;
             dsMZE6.Params[0].Value:=Y;
             dsMZE6.Params[1].Value:=M;
             dsE6MZ.Open;
             dsMZE6.Open;
        end;

  end;


procedure TFormTestE4.dsE6MZCalcFields(DataSet: TDataSet);
begin
     dsE6MZKey.Value:= (dsE6MZPAY_year.value*12+ dsE6MZPAY_MNTH.value)*20000+dsE6MZtabno.Value;
end;

procedure TFormTestE4.dsMZE6CalcFields(DataSet: TDataSet);
begin
     dsMZE6Key.Value:= (dsMZE6YEAR_ZA.value*12+ dsMZE6MONTH_ZA.value)*20000+dsMZE6tabno.Value;
end;

procedure TFormTestE4.TabMinZPResize(Sender: TObject);
var fullWidth:Integer;
begin
     fullWidth:=TabMinZP.Width;
     dxDBGridE6MZ.Width:=fullWidth*4 div 10;
     dxDBGridMZE6.Left:=dxDBGridE6MZ.Left+dxDBGridE6MZ.Width+1;
     dxDBGridMZE6.Width:=fullWidth-dxDBGridMZE6.Left-5;
     Application.ProcessMessages;
end;

end.
