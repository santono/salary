unit uFormIGruppy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  ExtCtrls, DBCtrls;

type
  TFormIGruppy = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    pFIBDataSetGru: TpFIBDataSet;
    pFIBDataSetBoln: TpFIBDataSet;
    pFIBDataSetOtp: TpFIBDataSet;
    pFIBDataSetKomp: TpFIBDataSet;
    pFIBDataSetMag: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    DataSourceKomp: TDataSource;
    DataSourceMag: TDataSource;
    DataSourceBoln: TDataSource;
    DataSourceOtp: TDataSource;
    pFIBDataSetGruSHIFR: TFIBIntegerField;
    pFIBDataSetGruNAME: TFIBStringField;
    pFIBDataSetBolnSHIFRID: TFIBIntegerField;
    pFIBDataSetBolnSHIFR_GRU: TFIBSmallIntField;
    pFIBDataSetBolnNAME_GRU: TStringField;
    pFIBDataSetOtpSHIFR_GRU: TFIBSmallIntField;
    pFIBDataSetOtpSHIFRID: TFIBIntegerField;
    pFIBDataSetOtpNAME_GRU: TStringField;
    pFIBDataSetKompSHIFR_GRU: TFIBSmallIntField;
    pFIBDataSetKompSHIFRID: TFIBIntegerField;
    pFIBDataSetKompNAME_GRU: TStringField;
    pFIBDataSetMagSHIFR_GRU: TFIBSmallIntField;
    pFIBDataSetMagSHIFRID: TFIBIntegerField;
    pFIBDataSetMagNAME_GRU: TStringField;
    dxDBGridBoln: TdxDBGrid;
    dxDBGridBolnSHIFRID: TdxDBGridMaskColumn;
    dxDBGridBolnSHIFR_GRU: TdxDBGridMaskColumn;
    dxDBGridBolnNAME_GRU: TdxDBGridLookupColumn;
    dxDBGridOtp: TdxDBGrid;
    dxDBGridKomp: TdxDBGrid;
    dxDBGridMag: TdxDBGrid;
    dxDBGridOtpSHIFR_GRU: TdxDBGridMaskColumn;
    dxDBGridOtpSHIFRID: TdxDBGridMaskColumn;
    dxDBGridOtpNAME_GRU: TdxDBGridLookupColumn;
    DBNavigatorOtp: TDBNavigator;
    DBNavigatorBoln: TDBNavigator;
    dxDBGridKompSHIFR_GRU: TdxDBGridMaskColumn;
    dxDBGridKompSHIFRID: TdxDBGridMaskColumn;
    dxDBGridKompNAME_GRU: TdxDBGridLookupColumn;
    DBNavigatorKomp: TDBNavigator;
    DBNavigatorMag: TDBNavigator;
    dxDBGridMagSHIFR_GRU: TdxDBGridMaskColumn;
    dxDBGridMagSHIFRID: TdxDBGridMaskColumn;
    dxDBGridMagNAME_GRU: TdxDBGridLookupColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormIGruppy: TFormIGruppy;

implementation

{$R *.dfm}

procedure TFormIGruppy.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetGru.Active then
            pFIBDataSetGru.Active:=false;
     if pFIBDataSetBoln.Active then
            pFIBDataSetBoln.Active:=false;
     if pFIBDataSetOtp.Active then
            pFIBDataSetOtp.Active:=false;
     if pFIBDataSetKomp.Active then
            pFIBDataSetKomp.Active:=false;
     if pFIBDataSetMag.Active then
            pFIBDataSetMag.Active:=false;
     if pFIBDataSetGru.Transaction.Active then
            pFIBDataSetGru.Transaction.Commit;
     if pFIBDataSetBoln.Transaction.Active then
            pFIBDataSetBoln.Transaction.Commit;
     if pFIBDataSetOtp.Transaction.Active then
            pFIBDataSetOtp.Transaction.Commit;
     if pFIBDataSetKomp.Transaction.Active then
            pFIBDataSetKomp.Transaction.Commit;
     if pFIBDataSetMag.Transaction.Active then
            pFIBDataSetMag.Transaction.Commit;
     if pFIBDataSetBoln.UpdateTransaction.Active then
            pFIBDataSetBoln.UpdateTransaction.Commit;
     if pFIBDataSetOtp.UpdateTransaction.Active then
            pFIBDataSetOtp.UpdateTransaction.Commit;
     if pFIBDataSetKomp.UpdateTransaction.Active then
            pFIBDataSetKomp.UpdateTransaction.Commit;
     if pFIBDataSetMag.UpdateTransaction.Active then
            pFIBDataSetMag.UpdateTransaction.Commit;

     Action:=caFree;
end;

procedure TFormIGruppy.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetGru.Transaction.Active then
            pFIBDataSetGru.Transaction.StartTransaction;
     if not pFIBDataSetBoln.Transaction.Active then
            pFIBDataSetBoln.Transaction.StartTransaction;
     if not pFIBDataSetOtp.Transaction.Active then
            pFIBDataSetOtp.Transaction.StartTransaction;
     if not pFIBDataSetKomp.Transaction.Active then
            pFIBDataSetKomp.Transaction.StartTransaction;
     if not pFIBDataSetMag.Transaction.Active then
            pFIBDataSetMag.Transaction.StartTransaction;
     if not pFIBDataSetGru.Active then
            pFIBDataSetGru.Active:=true;
     if not pFIBDataSetBoln.Active then
            pFIBDataSetBoln.Active:=true;
     if not pFIBDataSetOtp.Active then
            pFIBDataSetOtp.Active:=true;
     if not pFIBDataSetKomp.Active then
            pFIBDataSetKomp.Active:=true;
     if not pFIBDataSetMag.Active then
            pFIBDataSetMag.Active:=true;
end;

end.
