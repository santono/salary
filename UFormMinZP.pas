unit UFormMinZP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, ComCtrls;

type
  TFormMinZP = class(TForm)
    DBNavigator1: TDBNavigator;
    dsoMinZP: TDataSource;
    dsMinZP: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsMinZPID: TFIBIntegerField;
    dsMinZPTABNO: TFIBIntegerField;
    dsMinZPYEAR_ZA: TFIBIntegerField;
    dsMinZPMONTH_ZA: TFIBIntegerField;
    dsMinZPSUMMA: TFIBBCDField;
    dsMinZPSUMMA_DB: TFIBBCDField;
    dsMinZPSUMMA_RAZN: TFIBBCDField;
    dsMinZPWORKDAY: TFIBIntegerField;
    dsMinZPKOEF: TFIBBCDField;
    dsMinZPFIO: TFIBStringField;
    dsMinZPNEED_NOT: TFIBSmallIntField;
    dxDBGridMZ: TdxDBGrid;
    dxDBGridMZID: TdxDBGridMaskColumn;
    dxDBGridMZTABNO: TdxDBGridMaskColumn;
    dxDBGridMZYEAR_ZA: TdxDBGridMaskColumn;
    dxDBGridMZMONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridMZSUMMA: TdxDBGridCurrencyColumn;
    dxDBGridMZSUMMA_DB: TdxDBGridCurrencyColumn;
    dxDBGridMZSUMMA_RAZN: TdxDBGridCurrencyColumn;
    dxDBGridMZWORKDAY: TdxDBGridMaskColumn;
    dxDBGridMZKOEF: TdxDBGridCurrencyColumn;
    dxDBGridMZFIO: TdxDBGridMaskColumn;
    DateTimePicker1: TDateTimePicker;
    dxDBGridMZChk: TdxDBGridCheckColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    wantedYear  : Integer;
    wantedMonth : Integer;
    { Private declarations }
    procedure showCaption;
    procedure openDS;

  public
    { Public declarations }
  end;

var
  FormMinZP: TFormMinZP;

implementation
 uses UFibModule,SCrDef,ScrUtil,DateUtils;

{$R *.dfm}

procedure TFormMinZP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if dsMinZP.Active then
        dsMinZP.Close;
     if dsMinZP.UpdateTransaction.Active then
        dsMinZP.UpdateTransaction.Commit;
     if dsMinZP.Transaction.Active then
        dsMinZP.Transaction.Commit;
      action:=caFree;
end;

procedure TFormMinZP.FormCreate(Sender: TObject);
begin
     wantedYear:=2016;
     wantedMonth:=10;
     showCaption;
     openDS;
     DateTimePicker1.Date:=EncodeDate(wantedYear,wantedMonth,1);
end;
procedure TFormMinZP.openDS;
 begin
     if dsMinZP.Active then
        dsMinZP.Close;
     if dsMinZP.UpdateTransaction.Active then
        dsMinZP.UpdateTransaction.Commit;
     if dsMinZP.Transaction.Active then
        dsMinZP.Transaction.Commit;
     dsMinZP.Params[0].Value:=wantedYear;
     dsMinZP.Params[1].Value:=wantedMonth;
     dsMinZP.Transaction.StartTransaction;
     dsMinZp.Open;
 end;
procedure TFormMinZP.showCaption;
 begin
     if isSVDN then
         caption:='ћенш н≥ж м≥н≥мальна у '+getMonthUkr(wantedMonth)+' '+intToStr(wantedYear)+' р.'
     else
         caption:='ћеньше минимальной в '+getMonthRus(wantedMonth)+' '+intToStr(wantedYear)+' г.';

 end;

procedure TFormMinZP.DateTimePicker1Change(Sender: TObject);
begin
     wantedMonth:=MonthOf(DateTimePicker1.Date);
     wantedYear:=YearOf(DateTimePicker1.Date);
     showCaption;
     openDS;
end;

end.
