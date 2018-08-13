unit UFormEditGru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  ExtCtrls, DBCtrls, DB, FIBDataSet, dxCntner, pFIBDataSet, StdCtrls,
  Buttons, FIBDatabase, pFIBDatabase;

type
  TFormEditGruppy = class(TForm)
    pFIBDataSetGru: TpFIBDataSet;
    DataSourceGru: TDataSource;
    dxDBGridGru: TdxDBGrid;
    pFIBDataSetGruSHIFR: TFIBIntegerField;
    pFIBDataSetGruNAME: TFIBStringField;
    pFIBDataSetGruMO_BUD: TFIBSmallIntField;
    pFIBDataSetGruMO_VNE: TFIBSmallIntField;
    pFIBDataSetGruMO_KOL_BUD: TFIBSmallIntField;
    pFIBDataSetGruMO_KOL_VNE: TFIBSmallIntField;
    pFIBDataSetGruMO_GN: TFIBSmallIntField;
    pFIBDataSetGruMO_NIS: TFIBSmallIntField;
    pFIBDataSetGruMO_MAG_BUD: TFIBSmallIntField;
    pFIBDataSetGruMO_MAG_VNE: TFIBSmallIntField;
    DBNavigatorGru: TDBNavigator;
    dxDBGridGruSHIFR: TdxDBGridMaskColumn;
    dxDBGridGruNAME: TdxDBGridMaskColumn;
    dxDBGridGruMO_BUD: TdxDBGridCheckColumn;
    dxDBGridGruMO_VNE: TdxDBGridCheckColumn;
    dxDBGridGruMO_KOL_BUD: TdxDBGridCheckColumn;
    dxDBGridGruMO_KOL_VNE: TdxDBGridCheckColumn;
    dxDBGridGruMO_GN: TdxDBGridCheckColumn;
    dxDBGridGruMO_NIS: TdxDBGridCheckColumn;
    dxDBGridGruMO_MAG_BUD: TdxDBGridCheckColumn;
    dxDBGridGruMO_MAG_VNE: TdxDBGridCheckColumn;
    BitBtn1: TBitBtn;
    dxDBGridGruMO_MP: TdxDBGridCheckColumn;
    pFIBDataSetGruMO_MP: TFIBIntegerField;
    pFIBDataSetGruNAME_PLAT: TFIBStringField;
    dxDBGridGruName_Plat: TdxDBGridColumn;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSetGruM: TpFIBDataSet;
    pFIBDataSetGruMSHIFRGRUM: TFIBSmallIntField;
    pFIBDataSetGruMNAME: TFIBStringField;
    pFIBDataSetGruSHIFRGRUM: TFIBSmallIntField;
    pFIBDataSetGruNAME_GRUM: TStringField;
    dxDBGridGruName_GRUM: TdxDBGridLookupColumn;
    pFIBDataSetGruACTIVE: TFIBSmallIntField;
    dxDBGridGruActive: TdxDBGridCheckColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditGruppy: TFormEditGruppy;

implementation
 uses UFibModule;

{$R *.dfm}

procedure TFormEditGruppy.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetGru.Active then
        pFIBDataSetGru.Active:=false;
     if pFIBDataSetGruM.Active then
        pFIBDataSetGruM.Active:=false;
      if pFIBDataSetGru.Transaction.Active then
         pFIBDataSetGru.Transaction.Commit;
      if pFIBDataSetGruM.Transaction.Active then
         pFIBDataSetGruM.Transaction.Commit;
      if pFIBDataSetGru.UpdateTransaction.Active then
         pFIBDataSetGru.UpdateTransaction.Commit;

     Action:=caFree;
end;

procedure TFormEditGruppy.FormShow(Sender: TObject);
begin
{
      if not pFIBDataSetGru.Active then
         pFIBDataSetGru.Active:=true;
}
end;

procedure TFormEditGruppy.FormCreate(Sender: TObject);
begin
      if not pFIBDataSetGru.Transaction.Active then
         pFIBDataSetGru.Transaction.StartTransaction;
      if not pFIBDataSetGruM.Transaction.Active then
         pFIBDataSetGruM.Transaction.StartTransaction;
      if not pFIBDataSetGru.Active then
         pFIBDataSetGru.Active:=true;
      if not pFIBDataSetGruM.Active then
         pFIBDataSetGru.Active:=true;

end;

end.
