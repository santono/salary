unit UFORMBUH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, dxDBTLCl, dxGrClms, ExtCtrls, DBCtrls, FIBSQLMonitor, ComCtrls,
  StdCtrls;

type
  TFormOpe = class(TForm)
    pFIBDataSetOpe: TpFIBDataSet;
    pFIBDataSetOpeSHIFRWRK: TFIBIntegerField;
    pFIBDataSetOpeLOGIN: TFIBStringField;
    pFIBDataSetOpePSSWD: TFIBStringField;
    pFIBDataSetOpeSHIFRPRA: TFIBIntegerField;
    pFIBDataSetOpeFIOOP: TFIBStringField;
    pFIBDataSetOpeNAMEOP: TFIBStringField;
    DataSourceOpe: TDataSource;
    dxDBGridOpe: TdxDBGrid;
    dxDBGridOpeSHIFRWRK: TdxDBGridMaskColumn;
    dxDBGridOpeLOGIN: TdxDBGridMaskColumn;
    dxDBGridOpePSSWD: TdxDBGridMaskColumn;
    dxDBGridOpeSHIFRPRA: TdxDBGridMaskColumn;
    dxDBGridOpeFIOOP: TdxDBGridMaskColumn;
    dxDBGridOpeNAMEOP: TdxDBGridMaskColumn;
    dxDBGridPodr: TdxDBGrid;
    pFIBDataSetPodr: TpFIBDataSet;
    DataSourcePodr: TDataSource;
    pFIBDataSetSelPodr: TpFIBDataSet;
    pFIBDataSetPodrSHIFRPOD: TFIBIntegerField;
    pFIBDataSetPodrNAMEPOD: TStringField;
    pFIBDataSetSelPodrSHIFRPOD: TFIBIntegerField;
    pFIBDataSetSelPodrNAME: TFIBStringField;
    DataSourceSelPodr: TDataSource;
    dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridPodrNAMEPOD: TdxDBGridLookupColumn;
    DBNavigator1: TDBNavigator;
    pFIBDataSetPodrSHIFRBUH: TFIBIntegerField;
    PageControl1: TPageControl;
    TabSheetBay: TTabSheet;
    TabSheetAccess: TTabSheet;
    pFIBDataSetAcc: TpFIBDataSet;
    pFIBDataSetAccSHIFRPOD: TFIBIntegerField;
    pFIBDataSetAccSHIFRBUH: TFIBIntegerField;
    pFIBDataSetAccNAMEPOD: TStringField;
    pFIBDataSetAccShifrIdAcc: TIntegerField;
    DataSourceAcc: TDataSource;
    dxDBGridAcc: TdxDBGrid;
    dxDBGridAccSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridAccSHIFRBUH: TdxDBGridMaskColumn;
    dxDBGridAccNAMEPOD: TdxDBGridLookupColumn;
    dxDBGridAccShifrIdAcc: TdxDBGridColumn;
    DBNavigator2: TDBNavigator;
    TabSheetDop: TTabSheet;
    pFIBDataSetDop: TpFIBDataSet;
    pFIBDataSetDopSHIFRPOD: TFIBIntegerField;
    pFIBDataSetDopSHIFRBUH: TFIBIntegerField;
    pFIBDataSetDopNAMEPOD: TStringField;
    DataSourceDop: TDataSource;
    pFIBDataSetDopShifrIdDop: TIntegerField;
    dxDBGridDop: TdxDBGrid;
    DBNavigatorDop: TDBNavigator;
    dxDBGridDopSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridDopSHIFRBUH: TdxDBGridMaskColumn;
    dxDBGridDopNAMEPOD: TdxDBGridLookupColumn;
    dxDBGridDopShifrIdDop: TdxDBGridColumn;
    pFIBDataSetOpeNOMEROP: TFIBSmallIntField;
    dxDBGridOpeNomerOpe: TdxDBGridCalcColumn;
    DBNavigatorOpe: TDBNavigator;
    DBTextOpe: TDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure pFIBDataSetOpeAfterScroll(DataSet: TDataSet);
    procedure FIBSQLMonitor1SQL(EventText: String; EventTime: TDateTime);
    procedure pFIBDataSetPodrBeforePost(DataSet: TDataSet);
    procedure pFIBDataSetAccCalcFields(DataSet: TDataSet);
    procedure pFIBDataSetSelPodrCalcFields(DataSet: TDataSet);
    procedure pFIBDataSetDopCalcFields(DataSet: TDataSet);
    procedure pFIBDataSetOpeBeforeInsert(DataSet: TDataSet);
    procedure DataSourceOpeStateChange(Sender: TObject);
    procedure pFIBDataSetOpeAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOpe: TFormOpe;

implementation
 USES UFibModule,USQLUnit;

{$R *.dfm}

procedure TFormOpe.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetOpe.Active then
         pFIBDataSetOpe.Active:=false;
      if pFIBDataSetPodr.Active then
         pFIBDataSetPodr.Active:=false;
      if pFIBDataSetAcc.Active then
         pFIBDataSetAcc.Active:=false;
      if pFIBDataSetSelPodr.Active then
         pFIBDataSetSelPodr.Active:=false;
      if pFIBDataSetOpe.Transaction.Active then
         pFIBDataSetOpe.Transaction.Commit;
      if pFIBDataSetSelPodr.Transaction.Active then
         pFIBDataSetSelPodr.Transaction.Commit;
      if pFIBDataSetPodr.Transaction.Active then
         pFIBDataSetPodr.Transaction.Commit;
      if pFIBDataSetAcc.Transaction.Active then
         pFIBDataSetAcc.Transaction.Commit;
      if pFIBDataSetDop.Transaction.Active then
         pFIBDataSetDop.Transaction.Commit;
      Action:=caFree;
end;

procedure TFormOpe.FormShow(Sender: TObject);
begin
      if pFIBDataSetOpe.Active then
         pFIBDataSetOpe.Active:=false;
      pFIBDataSetOpe.Open;
      if pFIBDataSetPodr.Active then
         pFIBDataSetPodr.Active:=false;
      pFIBDataSetPodr.Open;
      if pFIBDataSetAcc.Active then
         pFIBDataSetAcc.Active:=false;
      pFIBDataSetAcc.Open;
      if pFIBDataSetDop.Active then
         pFIBDataSetDop.Active:=false;
      pFIBDataSetDop.Open;
      if pFIBDataSetSelPodr.Active then
         pFIBDataSetSelPodr.Active:=false;
      pFIBDataSetSelPodr.Open;

end;

procedure TFormOpe.pFIBDataSetOpeAfterScroll(DataSet: TDataSet);
begin
{     ShowMessage(IntToStr(DataSet.FieldByName('ShifrWrk').AsInteger));}
{
     if pFIBDataSetPodr.Active then
        pFIBDataSetPodr.Active:=false;
     pFIBDataSetPodr.Params[0].AsString:=IntToStr(DataSet.FieldByName('ShifrWrk').AsInteger);
     pFIBDataSetPodr.Prepare;
     pFIBDataSetPodr.Open;
}     
end;

procedure TFormOpe.FIBSQLMonitor1SQL(EventText: String;
  EventTime: TDateTime);
var S:String;
begin
     S:=EventText;
end;

procedure TFormOpe.pFIBDataSetPodrBeforePost(DataSet: TDataSet);
var S:String;
    I:Integer;
begin
     S:='';
     for i:=1 to pFIBDataSetPodr.InsertSql.Count do
          S:=S+' '+pFIBDataSetPodr.InsertSql[i-1];
     S:=S;
end;

procedure TFormOpe.pFIBDataSetAccCalcFields(DataSet: TDataSet);
begin
      pFIBDataSetAccShifrIdAcc.Value:= pFIBDataSetAccSHIFRPOD.Value + pFIBDataSetAccSHIFRBUH.Value*10000;
end;

procedure TFormOpe.pFIBDataSetSelPodrCalcFields(DataSet: TDataSet);
begin
{      pFIBDataSetAccShifrIdAcc.Value:= pFIBDataSetAccSHIFRPOD.Value + pFIBDataSetAccSHIFRBUH.Value*10000;}
end;

procedure TFormOpe.pFIBDataSetDopCalcFields(DataSet: TDataSet);
begin
      pFIBDataSetDopShifrIdDop.Value:= pFIBDataSetDopSHIFRPOD.Value + pFIBDataSetDopSHIFRBUH.Value*10000;
end;

procedure TFormOpe.pFIBDataSetOpeBeforeInsert(DataSet: TDataSet);
var newShifrWrk:Integer;
    newNomerOp:Integer;
    SQlStmnt:String;
    v:Variant;
begin
  (*
     newShifrWrk:=0;
     newNomerOp:=0;
     SQlStmnt:='select max(coalesce(shifrwrk,0)) from operatory';
     v:=SQLQueryValue(SQlStmnt);
     if VarIsNumeric(v) then
        newShifrWrk:=v;
     SQlStmnt:='select max(coalesce(nomerOp,0)) from operatory';
     v:=SQLQueryValue(SQlStmnt);
     if VarIsNumeric(v) then
        newNomerOP:=v;
     if NewShifrWrk>0 then
        pFIBDataSetOpeSHIFRWRK.Value:=newShifrWrk+1;
     if NewNomerOp>0 then
        pFIBDataSetOpeNomerOP.Value:=newNomerOp+1;
     pFIBDataSetOpeSHIFRPRA.Value:=2;
 //    pFIBDataSetOpeSecretRight.Value:=0;
 *)
 end;

procedure TFormOpe.DataSourceOpeStateChange(Sender: TObject);
var newShifrWrk:Integer;
    newNomerOp:Integer;
    SQlStmnt:String;
    v:Variant;
begin
  (*
     if pFIBDataSetOpe.State<>dsInsert then Exit;
     newShifrWrk:=0;
     newNomerOp:=0;
     SQlStmnt:='select max(coalesce(shifrwrk,0)) from operatory';
     v:=SQLQueryValue(SQlStmnt);
     if VarIsNumeric(v) then
        newShifrWrk:=v;
     SQlStmnt:='select max(coalesce(nomerOp,0)) from operatory';
     v:=SQLQueryValue(SQlStmnt);
     if VarIsNumeric(v) then
        newNomerOP:=v;
     if NewShifrWrk>0 then
        pFIBDataSetOpeSHIFRWRK.Value:=newShifrWrk+1;
     if NewNomerOp>0 then
        pFIBDataSetOpeNomerOP.Value:=newNomerOp+1;
     pFIBDataSetOpeSHIFRPRA.Value:=2;
     *)

end;

procedure TFormOpe.pFIBDataSetOpeAfterInsert(DataSet: TDataSet);
var newShifrWrk:Integer;
    newNomerOp:Integer;
    SQlStmnt:String;
    v:Variant;
begin
   //  if pFIBDataSetOpe.State<>dsInsert then Exit;
     newShifrWrk:=0;
     newNomerOp:=0;
     SQlStmnt:='select max(coalesce(shifrwrk,0)) from operatory';
     v:=SQLQueryValue(SQlStmnt);
     if VarIsNumeric(v) then
        newShifrWrk:=v;
     SQlStmnt:='select max(coalesce(nomerOp,0)) from operatory';
     v:=SQLQueryValue(SQlStmnt);
     if VarIsNumeric(v) then
        newNomerOP:=v;
     if NewShifrWrk>0 then
        pFIBDataSetOpeSHIFRWRK.Value:=newShifrWrk+1;
     if NewNomerOp>0 then
        pFIBDataSetOpeNomerOP.Value:=newNomerOp+1;
     pFIBDataSetOpeSHIFRPRA.Value:=2;
     pFIBDataSetOpeFIOOP.Value:='‘»Œ'+IntToStr(pFIBDataSetOpeSHIFRWRK.Value);
     pFIBDataSetOpeNAMEOP.Value:='»Ãﬂ'+IntToStr(pFIBDataSetOpeSHIFRWRK.Value);


end;

end.
