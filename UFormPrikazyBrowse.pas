unit UFormPrikazyBrowse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms, frxExportRTF, frxExportXLS, frxClass, frxExportPDF,
  frxDBSet, StdCtrls, Buttons;

type
  TFormPrikazyBrowse = class(TForm)
    dsoPrikazy: TDataSource;
    DBNavigator1: TDBNavigator;
    dsPrikazy: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsPrikazyID: TFIBIntegerField;
    dsPrikazyTABNO: TFIBIntegerField;
    dsPrikazyDATAPRIK: TFIBDateField;
    dsPrikazyNOMERPRIK: TFIBStringField;
    dsPrikazyDATABEG: TFIBDateField;
    dsPrikazyDATAEND: TFIBDateField;
    dsPrikazyCONTENT: TFIBStringField;
    dxDBGridPrikazy: TdxDBGrid;
    dxDBGridPrikazyID: TdxDBGridMaskColumn;
    dxDBGridPrikazyTABNO: TdxDBGridMaskColumn;
    dxDBGridPrikazyDATAPRIK: TdxDBGridDateColumn;
    dxDBGridPrikazyNOMERPRIK: TdxDBGridMaskColumn;
    dxDBGridPrikazyDATABEG: TdxDBGridDateColumn;
    dxDBGridPrikazyDATAEND: TdxDBGridDateColumn;
    dxDBGridPrikazyCONTENT: TdxDBGridMaskColumn;
    dsPrikazySHIFRIDTYP: TFIBIntegerField;
    dsPriType: TpFIBDataSet;
    dsPrikazyNameType: TStringField;
    dsPriTypeID: TFIBIntegerField;
    dsPriTypeNAME: TFIBStringField;
    dsPriTypeCONTENT: TFIBStringField;
    dsoPriType: TDataSource;
    frxReport1: TfrxReport;
    frxDBDatasetPrikazy: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtn1Click(Sender: TObject);
  private
       tabno:Integer;
       fio:string;

    { Private declarations }
  public
     constructor createPrikaz(AOwner: TComponent;tabno:Integer);
     function getTabno:Integer;
     procedure setTabno(tabno:integer);
    { Public declarations }
  end;

var
  FormPrikazyBrowse: TFormPrikazyBrowse;

implementation
  uses UFibModule,UFormPrikazRekvizity,ScrUtil;

{$R *.dfm}

constructor TFormPrikazyBrowse.createPrikaz(AOwner: TComponent;tabno:Integer);
 var SQLStmnt:string;
     v:variant;
 begin
      inherited Create(AOwner);
      Self.tabno:=tabno;
      SQLStmnt:='select first 1 fio from kadry where tabno='+IntToStr(tabno);
      v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
      fio:='Не указан';
      if VarIsStr(v) then
         fio:=v;
      Caption:='Приказы по '+IntToStr(Tabno)+' '+trim(fio);
      if dsPrikazy.Active then
         dsPrikazy.Close;
      if dsPrikazy.Transaction.Active then
         dsPrikazy.Transaction.Commit;
      if dsPrikazy.UpdateTransaction.Active then
         dsPrikazy.UpdateTransaction.Commit;
      dsPriType.Open;
      dsPrikazy.Params[0].Value:=tabno;
      dsPrikazy.Transaction.StartTransaction;
      dsPrikazy.Open;
 end;

procedure TFormPrikazyBrowse.setTabno(tabno:integer);
  begin
       Self.tabno:=tabno;
  end;
function TFormPrikazyBrowse.getTabno:integer;
  begin
       getTabno:=Self.tabno;
  end;
procedure TFormPrikazyBrowse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if dsPriType.Active then
        dsPriType.Close;
     if dsPrikazy.Active then
        dsPrikazy.Close;
     if dsPrikazy.Transaction.Active then
        dsPrikazy.Transaction.Commit;
     if dsPrikazy.UpdateTransaction.Active then
        dsPrikazy.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormPrikazyBrowse.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
 var SQLAction:Integer;
begin
     SQLAction := 0;
     case Button of
           nbInsert : SQLAction := 1;
//          nbDelete : BtnName := 'nbDelete';
           nbEdit   : SQLAction := 2;
      end;
     if SQLAction=0 then Exit;
     FormPrikazRekvizity:=TFormPrikazRekvizity.CreateP(Self,SQLAction);
     FormPrikazRekvizity.ShowModal;
end;

procedure TFormPrikazyBrowse.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(UPPER_STRING(Trim(VarName)),'TABNO')=0 then
        Value:=IntToStr(Self.tabno)
     else
     if CompareText(UPPER_STRING(Trim(VarName)),'FIO')=0 then
        Value:=Trim(Self.fio);
end;

procedure TFormPrikazyBrowse.BitBtn1Click(Sender: TObject);
begin
     if dsPrikazy.RecordCount>0 then
        frxReport1.ShowReport()
     else
        ShowMessage('Нет записей приказа');
end;

end.
