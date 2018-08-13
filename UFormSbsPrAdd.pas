unit UFormSbsPrAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  StdCtrls;

type
  TFormSbsPrAdd = class(TForm)
    DataSourceSBSPrADD: TDataSource;
    pFIBDataSetSBSPrAdd: TpFIBDataSet;
    pFIBTransactionSBSPrAdd: TpFIBTransaction;
    pFIBDataSetSBSPrAddSHIFRID: TFIBIntegerField;
    pFIBDataSetSBSPrAddW_PLACE: TFIBSmallIntField;
    pFIBDataSetSBSPrAddNAMEPOD: TFIBStringField;
    pFIBDataSetSBSPrAddW_R: TFIBSmallIntField;
    pFIBDataSetSBSPrAddNAMEWR: TFIBStringField;
    pFIBDataSetSBSPrAddSHIFRGRU: TFIBSmallIntField;
    pFIBDataSetSBSPrAddNAMEGRU: TFIBStringField;
    pFIBDataSetSBSPrAddSHIFRKAT: TFIBSmallIntField;
    pFIBDataSetSBSPrAddNAMEKAT: TFIBStringField;
    pFIBDataSetSBSPrAddSHIFRSTA: TFIBSmallIntField;
    pFIBDataSetSBSPrAddNAMESTA: TFIBStringField;
    pFIBDataSetSBSPrAddMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetSBSPrAddYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetSBSPrAddMONTH_VY: TFIBSmallIntField;
    pFIBDataSetSBSPrAddYEAR_VY: TFIBSmallIntField;
    pFIBDataSetSBSPrAddSUMMA: TFIBBCDField;
    pFIBDataSetSBSPrAddMARK: TFIBSmallIntField;
    dxDBGridSBSPrAdd: TdxDBGrid;
    dxDBGridSBSPrAddSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddW_PLACE: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddNAMEPOD: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddW_R: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddNAMEWR: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddSHIFRGRU: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddNAMEGRU: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddSHIFRKAT: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddNAMEKAT: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddSHIFRSTA: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddNAMESTA: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddMONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddYEAR_ZA: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddMONTH_VY: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddYEAR_VY: TdxDBGridMaskColumn;
    dxDBGridSBSPrAddSUMMA: TdxDBGridCurrencyColumn;
    dxDBGridSBSPrAddMARK: TdxDBGridCheckColumn;
    LabelCmnt: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dxDBGridSBSPrAddDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    ShifrIdOwner : integer;
    Mode_Vy_za   : integer;
    M            : integer;
    Y            : integer;
    { Public declarations }
  end;

var
  FormSbsPrAdd: TFormSbsPrAdd;

implementation
 uses UFibModule,ScrUtil;

{$R *.dfm}

procedure TFormSbsPrAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetSBSPrAdd.Active then
        pFIBDataSetSBSPrAdd.Close;
     if pFIBDataSetSBSPrAdd.Transaction.Active then
        pFIBDataSetSBSPrAdd.Transaction.Commit;
     if pFIBDataSetSBSPrAdd.UpdateTransaction.Active then
        pFIBDataSetSBSPrAdd.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormSbsPrAdd.FormShow(Sender: TObject);
begin
      if Mode_Vy_Za=1 then
         LabelCmnt.Caption:='за'
      else
         LabelCmnt.Caption:='в';
      LabelCmnt.Caption:=trim(LabelCmnt.Caption)+' '+GetMonthRus(m)+' '+IntToStr(y)+'г.';
      if pFIBDataSetSBSPrAdd.Active then
         pFIBDataSetSBSPrAdd.Close;
      if pFIBDataSetSBSPrAdd.Transaction.Active then
         pFIBDataSetSBSPrAdd.Transaction.Commit;
      if pFIBDataSetSBSPrAdd.UpdateTransaction.Active then
         pFIBDataSetSBSPrAdd.UpdateTransaction.Commit;
      pFIBDataSetSBSPrAdd.Transaction.StartTransaction;
      pFIBDataSetSBSPrAdd.Params[0].AsInteger:=ShifrIdOwner;
      pFIBDataSetSBSPrAdd.Prepare;
      pFIBDataSetSBSPrAdd.Open;

end;

procedure TFormSbsPrAdd.dxDBGridSBSPrAddDblClick(Sender: TObject);
begin
     pFIBDataSetSBSPrAdd.Edit;
     if pFIBDataSetSBSPrAddMARK.Value=1 then
        pFIBDataSetSBSPrAddMARK.Value:=0
     else
        pFIBDataSetSBSPrAddMARK.Value:=1;
     pFIBDataSetSBSPrAdd.Post;
end;

end.
