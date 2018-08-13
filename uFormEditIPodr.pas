unit uFormEditIPodr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBCtrl, dxDBGrid, dxTL,
  dxDBTLCl, dxGrClms, dxCntner, ExtCtrls, DBCtrls, ComCtrls, FIBDatabase,
  pFIBDatabase;

type
  TFormEditIPodr = class(TForm)
    pFIBDataSetIPodr: TpFIBDataSet;
    DataSourceIPodr: TDataSource;
    pFIBDataSetPodr: TpFIBDataSet;
    DataSourcePodr: TDataSource;
    pFIBDataSetPodrSHIFRPOD: TFIBIntegerField;
    pFIBDataSetPodrNAME: TFIBStringField;
    pFIBDataSetIPodrSHIFR_POD: TFIBSmallIntField;
    pFIBDataSetIPodrNamePod: TFIBStringField;
    pFIBDataSetIPodrSHIFRID: TFIBIntegerField;
    pFIBDataSetOtp: TpFIBDataSet;
    pFIBDataSetOtpSHIFR_POD: TFIBSmallIntField;
    pFIBDataSetOtpSHIFRID: TFIBIntegerField;
    pFIBDataSetOtpNAME_POD: TStringField;
    DataSourceOTP: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    dxDBGridIPodr: TdxDBGrid;
    dxDBGridIPodrShifrPod: TdxDBGridColumn;
    dxDBGridIPodrNAME: TdxDBGridLookupColumn;
    dxDBGridIPodrId: TdxDBGridColumn;
    DBNavigator1: TDBNavigator;
    TabSheet2: TTabSheet;
    dxDBGridOtp: TdxDBGrid;
    dxDBGridOtpSHIFR_POD: TdxDBGridMaskColumn;
    dxDBGridOtpSHIFRID: TdxDBGridMaskColumn;
    dxDBGridOtpNAME_POD: TdxDBGridLookupColumn;
    DBNavigator2: TDBNavigator;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSetKomp: TpFIBDataSet;
    pFIBDataSetMag: TpFIBDataSet;
    pFIBDataSetKompSHIFR_POD: TFIBSmallIntField;
    pFIBDataSetKompSHIFRID: TFIBIntegerField;
    pFIBDataSetKompNAME_PODR: TStringField;
    pFIBDataSetMagSHIFR_POD: TFIBSmallIntField;
    pFIBDataSetMagSHIFRID: TFIBIntegerField;
    pFIBDataSetMagNAME_PODR: TStringField;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    dxDBGridKomp: TdxDBGrid;
    DataSourceKomp: TDataSource;
    DataSourceMag: TDataSource;
    dxDBGridKompSHIFR_POD: TdxDBGridMaskColumn;
    dxDBGridKompSHIFRID: TdxDBGridMaskColumn;
    dxDBGridKompNAME_PODR: TdxDBGridLookupColumn;
    dxDBGridMag: TdxDBGrid;
    dxDBGridMagSHIFR_POD: TdxDBGridMaskColumn;
    dxDBGridMagSHIFRID: TdxDBGridMaskColumn;
    dxDBGridMagNAME_PODR: TdxDBGridLookupColumn;
    DBNavigator3: TDBNavigator;
    DBNavigator4: TDBNavigator;
    TabSheet5: TTabSheet;
    pFIBDataSetInd: TpFIBDataSet;
    pFIBDataSetIndSHIFR_POD: TFIBSmallIntField;
    pFIBDataSetIndSHIFRID: TFIBIntegerField;
    pFIBDataSetIndNAME_PODR: TStringField;
    dxDBGridInd: TdxDBGrid;
    DataSourceInd: TDataSource;
    DBNavigatorInd: TDBNavigator;
    dxDBGridIndSHIFR_POD: TdxDBGridMaskColumn;
    dxDBGridIndSHIFRID: TdxDBGridMaskColumn;
    dxDBGridIndNAME_PODR: TdxDBGridLookupColumn;
    TabSheet6: TTabSheet;
    pFIBDataSetNPOtp: TpFIBDataSet;
    pFIBDataSetNPOtpSHIFR_POD: TFIBSmallIntField;
    pFIBDataSetNPOtpSHIFRID: TFIBIntegerField;
    pFIBDataSetNPOtpNAME_PODR: TStringField;
    DataSourceNPOtp: TDataSource;
    dxDBGridNPOtp: TdxDBGrid;
    dxDBGridNPOtpSHIFR_POD: TdxDBGridMaskColumn;
    dxDBGridNPOtpSHIFRID: TdxDBGridMaskColumn;
    dxDBGridNPOtpNAME_PODR: TdxDBGridLookupColumn;
    DBNavigator5: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pFIBDataSetIPodrAfterDelete(DataSet: TDataSet);
    procedure pFIBDataSetOtpAfterDelete(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditIPodr: TFormEditIPodr;

implementation
uses UFibModule;
{$R *.dfm}


procedure TFormEditIPodr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetPodr.Active then
        pFIBDataSetPodr.Active:=false;
     if pFIBDataSetIPodr.Active then
        pFIBDataSetIPodr.Active:=false;
     if pFIBDataSetOtp.Active then
        pFIBDataSetOtp.Active:=false;
     if pFIBDataSetKomp.Active then
        pFIBDataSetKomp.Active:=false;
     if pFIBDataSetMag.Active then
        pFIBDataSetMag.Active:=false;
     if pFIBDataSetInd.Active then
        pFIBDataSetInd.Active:=false;

     if pFIBDataSetIPodr.Transaction.Active then
        pFIBDataSetIPodr.Transaction.Commit;
     if pFIBDataSetIPodr.UpdateTransaction.Active then
        pFIBDataSetIPodr.UpdateTransaction.Commit;
     if FIB.pFIBTransactionSAL.Active then
        FIB.pFIBTransactionSAL.Commit;
     Action:=caFree;
end;

procedure TFormEditIPodr.FormShow(Sender: TObject);
begin
     if not pFIBDataSetPodr.Active then
            pFIBDataSetPodr.Active:=true;
     if not pFIBDataSetIPodr.Active then
            pFIBDataSetIPodr.Active:=true;
     if not pFIBDataSetOtp.Active then
            pFIBDataSetOtp.Active:=true;
     if not pFIBDataSetKomp.Active then
            pFIBDataSetKomp.Active:=true;
     if not pFIBDataSetMag.Active then
            pFIBDataSetMag.Active:=true;
     if not pFIBDataSetInd.Active then
            pFIBDataSetInd.Active:=true;
end;

procedure TFormEditIPodr.pFIBDataSetIPodrAfterDelete(DataSet: TDataSet);
begin
     if pFIBDataSetIPodr.State=dsEdit then
        pFIBDataSetIPodr.Post;
     pFIBDataSetIPodr.Refresh;
     dxDBGridIPodr.ResetFullRefresh;
end;

procedure TFormEditIPodr.pFIBDataSetOtpAfterDelete(DataSet: TDataSet);
begin
     if pFIBDataSetOtp.State=dsEdit then
        pFIBDataSetOtp.Post;
     pFIBDataSetOtp.Refresh;
     dxDBGridOtp.ResetFullRefresh;
end;

procedure TFormEditIPodr.FormCreate(Sender: TObject);
begin
      if not pFIBDataSetPodr.Transaction.Active then
         pFIBDataSetPodr.Transaction.StartTransaction;
      if not pFIBDataSetIPodr.Transaction.Active then
         pFIBDataSetIPodr.Transaction.StartTransaction;
      if not pFIBDataSetOtp.Transaction.Active then
         pFIBDataSetOtp.Transaction.StartTransaction;
      if not pFIBDataSetKomp.Transaction.Active then
         pFIBDataSetKomp.Transaction.StartTransaction;
      if not pFIBDataSetMag.Transaction.Active then
         pFIBDataSetMag.Transaction.StartTransaction;
      if not pFIBDataSetInd.Transaction.Active then
         pFIBDataSetInd.Transaction.StartTransaction;
end;

end.
