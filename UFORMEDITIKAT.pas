unit UFORMEDITIKAT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  ComCtrls, ExtCtrls, DBCtrls;

type
  TFormEditiKat = class(TForm)
    pFIBDataSetIKat: TpFIBDataSet;
    pFIBDataSetKat: TpFIBDataSet;
    pFIBDataSetKatSHIFR: TFIBIntegerField;
    pFIBDataSetKatNAME: TFIBStringField;
    DataSourceIKat: TDataSource;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    PageControl1: TPageControl;
    dxDBGridIKat: TdxDBGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    pFIBDataSetIKatSHIFR_KAT: TFIBSmallIntField;
    pFIBDataSetIKatSHIFRID: TFIBIntegerField;
    pFIBDataSetIKatNAME_KAT: TStringField;
    dxDBGridIKatSHIFR_KAT: TdxDBGridMaskColumn;
    dxDBGridIKatSHIFRID: TdxDBGridMaskColumn;
    dxDBGridIKatNAME_KAT: TdxDBGridLookupColumn;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditiKat: TFormEditiKat;

implementation
uses UFibModule;

{$R *.dfm}

procedure TFormEditiKat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetKat.Active then
        pFIBDataSetKat.Active:=false;
     if pFIBDataSetIKat.Active then
        pFIBDataSetIKat.Active:=false;
     if pFIBDataSetKat.Transaction.Active then
        pFIBDataSetKat.Transaction.Commit;
     if pFIBDataSetIKat.Transaction.Active then
        pFIBDataSetIKat.Transaction.Commit;
     if pFIBDataSetIKat.UpdateTransaction.Active then
        pFIBDataSetIKat.UpdateTransaction.Commit;
      Action:=caFree;
end;

procedure TFormEditiKat.FormShow(Sender: TObject);
begin
     if not pFIBDataSetKat.Active then
        pFIBDataSetKat.Active:=TRUE;
     if not pFIBDataSetIKat.Active then
        pFIBDataSetIKat.Active:=TRUE;
end;

procedure TFormEditiKat.FormCreate(Sender: TObject);
begin
      if not pFIBDataSetIKat.Transaction.Active then
         pFIBDataSetIKat.Transaction.StartTransaction;
      if not pFIBDataSetKat.Transaction.Active then
         pFIBDataSetKat.Transaction.StartTransaction;
     if not pFIBDataSetKat.Active then
        pFIBDataSetKat.Active:=TRUE;
     if pFIBDataSetIKat.Active then
        pFIBDataSetIKat.Active:=false;
     pFIBDataSetIKat.Params[0].AsInteger:= 1;
     pFIBDataSetIKat.Open;
     PageControl1.ActivePageIndex:=0;
end;

procedure TFormEditiKat.PageControl1Change(Sender: TObject);
begin
     pFIBDataSetIKat.Close;
     case PageControl1.ActivePageIndex of
      1 : pFIBDataSetIKat.Params[0].AsInteger:=2;
      2 : pFIBDataSetIKat.Params[0].AsInteger:=3;
      3 : pFIBDataSetIKat.Params[0].AsInteger:=4;
      else
          pFIBDataSetIKat.Params[0].AsInteger:=1;
     end;
     pFIBDataSetIKat.Open;
end;

end.
