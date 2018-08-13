unit UFormSBSPr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  StdCtrls;

type
  TFormSbsPr = class(TForm)
    DataSource1: TDataSource;
    pFIBDataSetSBSPr: TpFIBDataSet;
    pFIBTransactionSbsPr: TpFIBTransaction;
    pFIBDataSetSBSPrSHIFRID: TFIBIntegerField;
    pFIBDataSetSBSPrSHIFRIDOWNER: TFIBIntegerField;
    pFIBDataSetSBSPrYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetSBSPrMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetSBSPrSUMMA: TFIBBCDField;
    pFIBDataSetSBSPrSUMMA_ALIM: TFIBBCDField;
    dxDBGridSbs: TdxDBGrid;
    dxDBGridSbsSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSbsSHIFRIDOWNER: TdxDBGridMaskColumn;
    dxDBGridSbsYEAR_ZA: TdxDBGridMaskColumn;
    dxDBGridSbsMONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridSbsSUMMA: TdxDBGridCurrencyColumn;
    dxDBGridSbsSUMMA_ALIM: TdxDBGridCurrencyColumn;
    dxDBGridSbsColumn7: TdxDBGridButtonColumn;
    LabelFio: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dxDBGridSbsColumn7ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
  public
    ShifrIdOwner : integer;
    Fio : string;
    Mode_Vy_Za : integer;
    { Public declarations }
  end;

var
  FormSbsPr: TFormSbsPr;

implementation
  uses uFibModule,UFormSbsPrAdd;

{$R *.dfm}

procedure TFormSbsPr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetSBSPr.Active then
        pFIBDataSetSBSPr.Close;
     if pFIBDataSetSBSPr.Transaction.Active then
        pFIBDataSetSBSPr.Transaction.Commit;
     if pFIBDataSetSBSPr.UpdateTransaction.Active then
        pFIBDataSetSBSPr.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormSbsPr.FormShow(Sender: TObject);
begin
      LabelFio.Caption:=trim(Self.Fio);
      if pFIBDataSetSBSPr.Active then
         pFIBDataSetSBSPr.Close;
      if pFIBDataSetSBSPr.Transaction.Active then
         pFIBDataSetSBSPr.Transaction.Commit;
      if pFIBDataSetSBSPr.UpdateTransaction.Active then
         pFIBDataSetSBSPr.UpdateTransaction.Commit;
      pFIBDataSetSBSPr.Transaction.StartTransaction;
      pFIBDataSetSBSPr.Params[0].AsInteger:=ShifrIdOwner;
      pFIBDataSetSBSPr.Prepare;
      pFIBDataSetSBSPr.Open;

end;

procedure TFormSbsPr.dxDBGridSbsColumn7ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
      Application.CreateForm(TFormSbsPrAdd,FormSbsPrAdd);
      FormSbsPrAdd.ShifrIdOwner:=pFIBDataSetSBSPrSHIFRID.Value;
      FormSbsPrAdd.Mode_Vy_Za:=Mode_Vy_Za;
      FormSbsPrAdd.M:=pFIBDataSetSBSPrMONTH_ZA.Value;
      FormSbsPrAdd.Y:=pFIBDataSetSBSPrYear_ZA.Value;
      FormSbsPrAdd.ShowModal;
end;

end.
