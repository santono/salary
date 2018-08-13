unit UFORMEDITPRZB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxTL, dxDBCtrl, dxDBTLCl,
  dxGrClms, dxCntner, dxDBGrid, ComCtrls, FIBDatabase, pFIBDatabase,
  ExtCtrls, DBCtrls;

type
  TFormEditPrzB = class(TForm)
    pFIBDataSet1: TpFIBDataSet;
    pFIBDataSet1DATEPRZ: TFIBDateField;
    DataSource1: TDataSource;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1DATEPRZ: TdxDBGridDateColumn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pFIBDataSet1DayOfWeek: TStringField;
    dxDBGrid1DoW: TdxDBGridColumn;
    pFIBDataSetOtp: TpFIBDataSet;
    DataSourceOtp: TDataSource;
    pFIBDataSetOtpDATEPRZ: TFIBDateField;
    pFIBDataSetOtpDayOfWeek: TStringField;
    dxDBGridOtp: TdxDBGrid;
    dxDBGridOtpDATEPRZ: TdxDBGridDateColumn;
    dxDBGridOtpDayOfWeek: TdxDBGridColumn;
    pFIBTransactionWrite: TpFIBTransaction;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    pFIBDataSet1SHIFRID: TFIBIntegerField;
    pFIBDataSetOtpSHIFRID: TFIBIntegerField;
    dxDBGrid1ShifrId: TdxDBGridColumn;
    dxDBGridOtpShifrId: TdxDBGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pFIBDataSet1CalcFields(DataSet: TDataSet);
    procedure pFIBDataSetOtpCalcFields(DataSet: TDataSet);
    procedure pFIBDataSetOtpBeforeInsert(DataSet: TDataSet);
    procedure pFIBDataSetOtpAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditPrzB: TFormEditPrzB;

implementation
uses UFibModule;

{$R *.dfm}


procedure TFormEditPrzB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if FIB.pFIBTransactionSAL.InTransaction then
         FIB.pFIBTransactionSAL.Commit;
      if pFIBTransactionWrite.InTransaction then
         pFIBTransactionWrite.Commit;
{      pFIBTransactionWrite.Commit;}
      if pFIBDataSet1.Active then
         pFIBDataSet1.Active:=false;
      if pFIBDataSetOtp.Active then
         pFIBDataSetOtp.Active:=false;
      Action:=caFree;
end;

procedure TFormEditPrzB.FormShow(Sender: TObject);
begin
{      if not FIB.pFIBTransactionSAL.InTransaction then
         FIB.pFIBTransactionSAL.StartTransaction;      }
      if not pFIBDataSet1.Active then
         pFIBDataSet1.Active:=true;
      if not pFIBDataSetOtp.Active then
         pFIBDataSetOtp.Active:=true;
end;



procedure TFormEditPrzB.pFIBDataSet1CalcFields(DataSet: TDataSet);
begin
     case DayOfWeek(pFIBDataSet1DATEPRZ.Value) of
      1: pFIBDataSet1DayOfWeek.Value:='�����������';
      2: pFIBDataSet1DayOfWeek.Value:='�����������';
      3: pFIBDataSet1DayOfWeek.Value:='�������';
      4: pFIBDataSet1DayOfWeek.Value:='�����';
      5: pFIBDataSet1DayOfWeek.Value:='�������';
      6: pFIBDataSet1DayOfWeek.Value:='�������';
      7: pFIBDataSet1DayOfWeek.Value:='�������';
      else
         pFIBDataSet1DayOfWeek.Value:='';
     end;

end;

procedure TFormEditPrzB.pFIBDataSetOtpCalcFields(DataSet: TDataSet);
begin
     case DayOfWeek(pFIBDataSetOtpDATEPRZ.Value) of
      1: pFIBDataSetOtpDayOfWeek.Value:='�����������';
      2: pFIBDataSetOtpDayOfWeek.Value:='�����������';
      3: pFIBDataSetOtpDayOfWeek.Value:='�������';
      4: pFIBDataSetOtpDayOfWeek.Value:='�����';
      5: pFIBDataSetOtpDayOfWeek.Value:='�������';
      6: pFIBDataSetOtpDayOfWeek.Value:='�������';
      7: pFIBDataSetOtpDayOfWeek.Value:='�������';
      else
         pFIBDataSetOtpDayOfWeek.Value:='';
     end;

end;

procedure TFormEditPrzB.pFIBDataSetOtpBeforeInsert(DataSet: TDataSet);
var i:integer;
begin
     i:=1;
end;

procedure TFormEditPrzB.pFIBDataSetOtpAfterInsert(DataSet: TDataSet);
var i:integer;
begin
     i:=2;
end;

end.
