unit uFormEdirDayClock;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  ExtCtrls, DBCtrls;

type
  TFormEditDayClock = class(TForm)
    DataSourceDC: TDataSource;
    pFIBDataSetDC: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSetDCYEARZA: TFIBSmallIntField;
    pFIBDataSetDCMONTHZA: TFIBSmallIntField;
    pFIBDataSetDCWDAYS: TFIBSmallIntField;
    pFIBDataSetDCCLOCKS: TFIBBCDField;
    pFIBDataSetDCSHIFRIDYM: TFIBIntegerField;
    dxDBGridDC: TdxDBGrid;
    dxDBGridDCYEARZA: TdxDBGridSpinColumn;
    dxDBGridDCMONTHZA: TdxDBGridSpinColumn;
    dxDBGridDCWDAYS: TdxDBGridSpinColumn;
    dxDBGridDCCLOCKS: TdxDBGridCalcColumn;
    dxDBGridDCSHIFRIDYM: TdxDBGridMaskColumn;
    pFIBDataSetDCmonthName: TStringField;
    dxDBGridDCMonthName: TdxDBGridColumn;
    DBNavigatorDC: TDBNavigator;
    pFIBDataSetDCWDAYSCOLEDG: TFIBSmallIntField;
    pFIBDataSetDCWCLOCKSCOLEDG: TFIBBCDField;
    dxDBGridDCWClocksCol: TdxDBGridCalcColumn;
    dxDBGridDCWDaysCol: TdxDBGridSpinColumn;
    procedure pFIBDataSetDCCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSetDCBeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditDayClock: TFormEditDayClock;

implementation
 uses UFibModule,ScrUtil,DateUtils;

{$R *.dfm}

procedure TFormEditDayClock.pFIBDataSetDCCalcFields(DataSet: TDataSet);
begin
     pFIBDataSetDCmonthName.AsString:=GetMonthRus(pFIBDataSetDCMONTHZA.AsInteger);
end;

procedure TFormEditDayClock.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetDC.Active then
        pFIBDataSetDC.Close;
     if pFIBDataSetDC.Transaction.Active then
        pFIBDataSetDC.Transaction.Commit;
     if pFIBDataSetDC.UpdateTransaction.Active then
        pFIBDataSetDC.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormEditDayClock.FormCreate(Sender: TObject);
begin
     if pFIBDataSetDC.Active then
        pFIBDataSetDC.Close;
     if not pFIBDataSetDC.Transaction.Active then
        pFIBDataSetDC.Transaction.StartTransaction;
     pFIBDataSetDC.Open;
end;


procedure TFormEditDayClock.pFIBDataSetDCBeforeInsert(DataSet: TDataSet);
begin
     if (
          (pFIBDataSetDCYEARZA.Value<pFIBDataSetDCYEARZA.MinValue) or
          (pFIBDataSetDCYEARZA.Value>pFIBDataSetDCYEARZA.MaxValue)
        )  then
        pFIBDataSetDCYEARZA.Value:=YearOf(Date);

end;

end.
