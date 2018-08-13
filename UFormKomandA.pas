{$WARNINGS OFF}
{$HINTS OFF}
unit UFormKomandA;
                                 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, dxCntner, StdCtrls, Buttons, FIBDatabase,
  pFIBDatabase, ExtCtrls, DBCtrls;

type
  TFormKomandA = class(TForm)
    DataSourceKomandA: TDataSource;
    pFIBDataSetKomandA: TpFIBDataSet;
    dxDBGridKomandA: TdxDBGrid;
    pFIBDataSetKomandAW_PLACE: TFIBSmallIntField;
    pFIBDataSetKomandANAME: TFIBStringField;
    pFIBDataSetKomandAW_R: TFIBSmallIntField;
    pFIBDataSetKomandASHIFRGRU: TFIBSmallIntField;
    pFIBDataSetKomandANAME1: TFIBStringField;
    pFIBDataSetKomandASHIFRKAT: TFIBSmallIntField;
    pFIBDataSetKomandANAME2: TFIBStringField;
    pFIBDataSetKomandASHIFRSTA: TFIBSmallIntField;
    pFIBDataSetKomandANAME3: TFIBStringField;
    pFIBDataSetKomandAMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetKomandAYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetKomandAMONTH_VY: TFIBSmallIntField;
    pFIBDataSetKomandAYEAR_VY: TFIBSmallIntField;
    pFIBDataSetKomandASUMMA: TFIBBCDField;
    pFIBDataSetKomandAVYPL: TFIBSmallIntField;
    pFIBDataSetKomandAMARKED: TFIBSmallIntField;
    pFIBDataSetKomandAID_CLAR: TFIBIntegerField;
    pFIBDataSetKomandASHIFRIDTMP: TFIBIntegerField;
    pFIBDataSetKomandAWRN: TFIBStringField;
    dxDBGridKomandANAME: TdxDBGridMaskColumn;
    dxDBGridKomandANAME1: TdxDBGridMaskColumn;
    dxDBGridKomandANAME2: TdxDBGridMaskColumn;
    dxDBGridKomandASHIFRSTA: TdxDBGridMaskColumn;
    dxDBGridKomandANAMESta: TdxDBGridMaskColumn;
    dxDBGridKomandAMONTH_VY: TdxDBGridMaskColumn;
    dxDBGridKomandAYEAR_VY: TdxDBGridMaskColumn;
    dxDBGridKomandASUMMA: TdxDBGridCurrencyColumn;
    dxDBGridKomandAVYPL: TdxDBGridMaskColumn;
    dxDBGridKomandASHIFRIDTMP: TdxDBGridMaskColumn;
    dxDBGridKomandAWRN: TdxDBGridMaskColumn;
    dxDBGridKomandAMARKED: TdxDBGridCheckColumn;
    BitBtn1: TBitBtn;
    dxDBGridKomandAMONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridKomandAYEAR_ZA: TdxDBGridMaskColumn;
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
    procedure pFIBDataSetKomandAMARKEDChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    WantedYear     : INTEGER;
    WantedMonth    : INTEGER;
    WantedMode_V_Z : integer;
  end;

var
  FormKomandA: TFormKomandA;

implementation
USES UFibModule;

{$R *.dfm}

procedure TFormKomandA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetKomandA.Active then
         pFIBDataSetKomandA.Close;
      if pFIBDataSetKomandA.Transaction.Active then
         pFIBDataSetKomandA.Transaction.Commit;
      if pFIBDataSetKomandA.UpdateTransaction.Active then
         pFIBDataSetKomandA.UpdateTransaction.Commit;

      Action:=caFree;
end;

procedure TFormKomandA.ShowTable;
begin
      if pFIBDataSetKomandA.Active then
         pFIBDataSetKomandA.Active:=false;
      pFIBDataSetKomandA.Params[0].AsString:=IntToStr(WantedMode_V_Z);
      pFIBDataSetKomandA.Params[1].AsString:=IntToStr(Self.WantedYear);
      pFIBDataSetKomandA.Params[2].AsString:=IntToStr(WantedMonth);
      pFIBDataSetKomandA.Prepare;
      pFIBDataSetKomandA.Open;
end;

function TFormKomandA.Execute: boolean;
begin
  ShowTable;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;


procedure TFormKomandA.BitBtn1Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TFormKomandA.BitBtn2Click(Sender: TObject);
begin
     if pFIBDataSetKomandA.State=dsEdit then
        pFIBDataSetKomandA.Post;
end;

procedure TFormKomandA.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetKomandA.Transaction.Active then
        pFIBDataSetKomandA.Transaction.StartTransaction;
end;

procedure TFormKomandA.pFIBDataSetKomandAMARKEDChange(Sender: TField);
begin
{
     if pFIBDataSetKomandA.State=dsEdit then
        begin
             if not pFIBDataSetKomandA.UpdateTransaction.Active then
                pFIBDataSetKomandA.UpdateTransaction.StartTransaction;
             pFIBDataSetKomandA.Post;
             if pFIBDataSetKomandA.UpdateTransaction.Active then
                pFIBDataSetKomandA.UpdateTransaction.Commit;
             pFIBDataSetKomandA.Edit;
        end;
}

      Caption:='Список начислений для больничного'
end;

end.
