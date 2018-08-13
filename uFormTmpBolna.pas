{$WARNINGS OFF}
{$HINTS OFF}
unit uFormTmpBolna;
                                 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, dxCntner, StdCtrls, Buttons, FIBDatabase,
  pFIBDatabase, ExtCtrls, DBCtrls;

type
  TFormBolnA = class(TForm)
    DataSourceBolnA: TDataSource;
    pFIBDataSetBolnA: TpFIBDataSet;
    dxDBGridBolnA: TdxDBGrid;
    pFIBDataSetBolnAW_PLACE: TFIBSmallIntField;
    pFIBDataSetBolnANAME: TFIBStringField;
    pFIBDataSetBolnAW_R: TFIBSmallIntField;
    pFIBDataSetBolnASHIFRGRU: TFIBSmallIntField;
    pFIBDataSetBolnANAME1: TFIBStringField;
    pFIBDataSetBolnASHIFRKAT: TFIBSmallIntField;
    pFIBDataSetBolnANAME2: TFIBStringField;
    pFIBDataSetBolnASHIFRSTA: TFIBSmallIntField;
    pFIBDataSetBolnANAME3: TFIBStringField;
    pFIBDataSetBolnAMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetBolnAYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetBolnAMONTH_VY: TFIBSmallIntField;
    pFIBDataSetBolnAYEAR_VY: TFIBSmallIntField;
    pFIBDataSetBolnASUMMA: TFIBBCDField;
    pFIBDataSetBolnAVYPL: TFIBSmallIntField;
    pFIBDataSetBolnAMARKED: TFIBSmallIntField;
    pFIBDataSetBolnAID_CLAR: TFIBIntegerField;
    pFIBDataSetBolnASHIFRIDTMP: TFIBIntegerField;
    pFIBDataSetBolnAWRN: TFIBStringField;
    dxDBGridBolnANAME: TdxDBGridMaskColumn;
    dxDBGridBolnANAME1: TdxDBGridMaskColumn;
    dxDBGridBolnANAME2: TdxDBGridMaskColumn;
    dxDBGridBolnASHIFRSTA: TdxDBGridMaskColumn;
    dxDBGridBolnANAMESta: TdxDBGridMaskColumn;
    dxDBGridBolnAMONTH_VY: TdxDBGridMaskColumn;
    dxDBGridBolnAYEAR_VY: TdxDBGridMaskColumn;
    dxDBGridBolnASUMMA: TdxDBGridCurrencyColumn;
    dxDBGridBolnAVYPL: TdxDBGridMaskColumn;
    dxDBGridBolnASHIFRIDTMP: TdxDBGridMaskColumn;
    dxDBGridBolnAWRN: TdxDBGridMaskColumn;
    dxDBGridBolnAMARKED: TdxDBGridCheckColumn;
    BitBtn1: TBitBtn;
    dxDBGridBolnAMONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridBolnAYEAR_ZA: TdxDBGridMaskColumn;
    BitBtn2: TBitBtn;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function Execute: boolean;
    procedure ShowTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSetBolnAMARKEDChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    WantedYear     : INTEGER;
    WantedMonth    : INTEGER;
    WantedMode_V_Z : integer;
  end;

var
  FormBolnA: TFormBolnA;

implementation
USES UFibModule;

{$R *.dfm}

procedure TFormBolnA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetBolnA.Active then
         pFIBDataSetBolnA.Close;
      if pFIBDataSetBolnA.Transaction.Active then
         pFIBDataSetBolnA.Transaction.Commit;
      if pFIBDataSetBolnA.UpdateTransaction.Active then
         pFIBDataSetBolnA.UpdateTransaction.Commit;

      Action:=caFree;
end;

procedure TFormBolnA.ShowTable;
begin
      if pFIBDataSetBolnA.Active then
         pFIBDataSetBolnA.Active:=false;
      pFIBDataSetBolnA.Params[0].AsString:=IntToStr(WantedMode_V_Z);
      pFIBDataSetBolnA.Params[1].AsString:=IntToStr(Self.WantedYear);
      pFIBDataSetBolnA.Params[2].AsString:=IntToStr(WantedMonth);
      pFIBDataSetBolnA.Prepare;
      pFIBDataSetBolnA.Open;
end;

function TFormBolnA.Execute: boolean;
begin
  ShowTable;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;


procedure TFormBolnA.BitBtn1Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TFormBolnA.BitBtn2Click(Sender: TObject);
begin
     if pFIBDataSetBolnA.State=dsEdit then
        pFIBDataSetBolnA.Post;
end;

procedure TFormBolnA.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetBolnA.Transaction.Active then
        pFIBDataSetBolnA.Transaction.StartTransaction;
end;

procedure TFormBolnA.pFIBDataSetBolnAMARKEDChange(Sender: TField);
begin
{
     if pFIBDataSetBolnA.State=dsEdit then
        begin
             if not pFIBDataSetBolnA.UpdateTransaction.Active then
                pFIBDataSetBolnA.UpdateTransaction.StartTransaction;
             pFIBDataSetBolnA.Post;
             if pFIBDataSetBolnA.UpdateTransaction.Active then
                pFIBDataSetBolnA.UpdateTransaction.Commit;
             pFIBDataSetBolnA.Edit;
        end;
}

      Caption:='Список начислений для больничного'
end;

end.
