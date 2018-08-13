{$WARNINGS OFF}
{$HINTS OFF}
unit UFormBolKoe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxCntner,
  dxDBGrid, DB, FIBDataSet, pFIBDataSet, ExtCtrls, DBCtrls, FIBDatabase,
  pFIBDatabase, ComCtrls;

type
  TFormBolKoe = class(TForm)
    DataSourceBolKoe: TDataSource;
    pFIBDataSetBolKoe: TpFIBDataSet;
    dxDBGridBolKoe: TdxDBGrid;
    dxDBGridBolKoeColumnDataFr: TdxDBGridDateColumn;
    dxDBGridBolKoeColumnDataZa: TdxDBGridDateColumn;
    dxDBGridBolKoeColumnKoef3: TdxDBGridCalcColumn;
    pFIBDataSetBolKoeDATEB: TFIBDateField;
    pFIBDataSetBolKoeDATEZA: TFIBDateField;
    pFIBDataSetBolKoeKOEF: TFIBBCDField;
    DBNavigator1: TDBNavigator;
    pFIBTransactionSalWrite: TpFIBTransaction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pFIBDataSetBolKoeSHIFRID: TFIBIntegerField;
    pFIBDataSetOtpKoe: TpFIBDataSet;
    pFIBDataSetOtpKoeDATEB: TFIBDateField;
    pFIBDataSetOtpKoeDATEZA: TFIBDateField;
    pFIBDataSetOtpKoeKOEF: TFIBBCDField;
    pFIBDataSetOtpKoeSHIFRID: TFIBIntegerField;
    DataSourceOtpKoe: TDataSource;
    dxDBGridOtpKoe: TdxDBGrid;
    DBNavigator2: TDBNavigator;
    dxDBGridOtpKoeDATEB: TdxDBGridDateColumn;
    dxDBGridOtpKoeDATEZA: TdxDBGridDateColumn;
    dxDBGridOtpKoeKOEF: TdxDBGridCalcColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBolKoe: TFormBolKoe;

implementation
uses UFibModule;


{$R *.dfm}

procedure TFormBolKoe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     FIB.pFIBTransactionSAL.Commit;
     if pFIBTransactionSalWrite.Active then
        pFIBTransactionSalWrite.Commit;
     if pFIBDataSetBolKoe.Active then
        pFIBDataSetBolKoe.Active:=FALSE;
     if pFIBDataSetOtpKoe.Active then
        pFIBDataSetOtpKoe.Active:=FALSE;
     Action:=caFree;
end;

procedure TFormBolKoe.FormShow(Sender: TObject);
begin
     if not pFIBDataSetBolKoe.Active then
        pFIBDataSetBolKoe.Active:=TRUE;
     if not pFIBDataSetOtpKoe.Active then
        pFIBDataSetOtpKoe.Active:=TRUE;
{
     if not pFIBDataSetBolKoe.Active then
        pFIBDataSetBolKoe.Active:=TRUE;
}
end;

procedure TFormBolKoe.FormCreate(Sender: TObject);
begin
{
    dxDBGridBolKoeColumnDataFr.DateValidation  := true;
    dxDBGridBolKoeColumnDataFr.SaveTime := false;
    dxDBGridBolKoeColumnDataZA.DateValidation  := true;
    dxDBGridBolKoeColumnDataZA.SaveTime := false;
}
end;

end.
