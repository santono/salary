unit FormEditParSelPlatU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,UFibModule, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, dxExEdtr, ExtCtrls, DBCtrls, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, dxDBTLCl, dxGrClms;

type
  TFormEditParSelPlat = class(TForm)
    pFIBDataSetSPP: TpFIBDataSet;
    pFIBDataSetShifry: TpFIBDataSet;
    pFIBDataSetPodrList: TpFIBDataSet;
    pFIBDataSetGruList: TpFIBDataSet;
    pFIBDataSetGruListSHIFRID: TFIBIntegerField;
    pFIBDataSetGruListNAME: TFIBStringField;
    pFIBDataSetPodrListSHIFRID: TFIBIntegerField;
    pFIBDataSetPodrListNAME: TFIBStringField;
    pFIBDataSetShifrySHIFR: TFIBIntegerField;
    pFIBDataSetShifryNAME: TFIBStringField;
    pFIBDataSetSPPSHIFRID: TFIBSmallIntField;
    pFIBDataSetSPPSHIFRPODLIST: TFIBIntegerField;
    pFIBDataSetSPPSHIFRGRULIST: TFIBIntegerField;
    pFIBDataSetSPPSHIFRSTA: TFIBIntegerField;
    pFIBDataSetSPPMODE_U_K: TFIBSmallIntField;
    pFIBDataSetSPPNAME: TFIBStringField;
    pFIBDataSetSPPNAMESTA: TFIBStringField;
    pFIBDataSetSPPNAMEPOD: TFIBStringField;
    pFIBDataSetSPPNAMEGRU: TFIBStringField;
    pFIBTransactionRW: TpFIBTransaction;
    pFIBTransactionRead: TpFIBTransaction;
    DataSourceSPP: TDataSource;
    dxDBGridSPP: TdxDBGrid;
    DBNavigatorSPP: TDBNavigator;
    dxDBGridSPPSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSPPSHIFRPODLIST: TdxDBGridMaskColumn;
    dxDBGridSPPSHIFRGRULIST: TdxDBGridMaskColumn;
    dxDBGridSPPMODE_U_K: TdxDBGridCheckColumn;
    dxDBGridSPPNAME: TdxDBGridMaskColumn;
    dxDBGridSPPNAMESTA: TdxDBGridLookupColumn;
    dxDBGridSPPNAMEPOD: TdxDBGridLookupColumn;
    dxDBGridSPPNAMEGRU: TdxDBGridLookupColumn;
    dxDBGridSPPSHIFRSTA: TdxDBGridCalcColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSetSPPBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditParSelPlat: TFormEditParSelPlat;

implementation

{$R *.dfm}

procedure TFormEditParSelPlat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetShifry.Active then
        pFIBDataSetShifry.Active:=false;
     if pFIBDataSetGruList.Active then
        pFIBDataSetGruList.Active:=false;
     if pFIBDataSetPodrList.Active then
        pFIBDataSetPodrList.Active:=false;
     if pFIBDataSetSPP.Active then
        pFIBDataSetSPP.Active:=false;
     if pFIBDataSetSPP.Transaction.Active then
        pFIBDataSetSPP.Transaction.Commit;
     if pFIBDataSetSPP.UpdateTransaction.Active then
        pFIBDataSetSPP.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormEditParSelPlat.FormCreate(Sender: TObject);
begin
     if pFIBDataSetGruList.Active then
        pFIBDataSetGruList.Active:=false;
     if pFIBDataSetPodrList.Active then
        pFIBDataSetPodrList.Active:=false;
     if pFIBDataSetShifry.Active then
        pFIBDataSetShifry.Active:=false;
     if pFIBDataSetSPP.Active then
        pFIBDataSetSPP.Active:=false;
     if pFIBDataSetSPP.Transaction.Active then
        pFIBDataSetSPP.Transaction.Commit;
     if pFIBDataSetSPP.UpdateTransaction.Active then
        pFIBDataSetSPP.UpdateTransaction.Commit;
     pFIBDataSetSPP.Transaction.StartTransaction;
     pFIBDataSetShifry.Active   := true;
     pFIBDataSetGruList.Active  := true;
     pFIBDataSetPodrList.Active := true;
     pFIBDataSetSPP.Active      := true;

end;

procedure TFormEditParSelPlat.pFIBDataSetSPPBeforeInsert(
  DataSet: TDataSet);
begin
{
     pFIBDataSetSPPMODE_U_K.Value :=   0;
     pFIBDataSetSPPSHIFRSTA.Value := 103;
}     
end;

end.
