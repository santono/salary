unit UFormPrikazyBrowseTot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms, frxExportRTF, frxExportXLS, frxClass, frxExportPDF,
  frxDBSet, StdCtrls, Buttons, ToolWin, ComCtrls, ImgList, ActnList;

type
  TFormPrikazyBrowseTot = class(TForm)
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
    dsPrikazyY: TFIBSmallIntField;
    dsPrikazyM: TFIBSmallIntField;
    dsPrikazyKODKP: TFIBStringField;
    dsPrikazyKODZKPPTR: TFIBStringField;
    dsPrikazyNAMEDOL: TFIBStringField;
    dsPrikazyIDCLASSIFICATOR: TFIBIntegerField;
    dsPrikazyNAMEPROF: TFIBStringField;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    dsPrikazyFIO: TStringField;
    dxDBGridPrikazyFIO: TdxDBGridColumn;
    ActionList1: TActionList;
    ActionSelPrikaz: TAction;
    ActionAddPrikaz: TAction;
    ActionDelPrikaz: TAction;
    ActionSeacrhPrikaz: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtn1Click(Sender: TObject);
    procedure dsPrikazyCalcFields(DataSet: TDataSet);
    procedure ActionSelPrikazExecute(Sender: TObject);
    procedure ActionAddPrikazExecute(Sender: TObject);
    procedure ActionDelPrikazExecute(Sender: TObject);
    procedure ActionSeacrhPrikazExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
       tabno:Integer;
       fio:string;
       wantedFilter:String;
       procedure setFilter;
    { Private declarations }
  public
     DateFr:TDate;
     DateTo:TDate;
     needDateFilter:boolean;
     prikazTypeFilter:integer;
     needTypeFilter:boolean;
     tabnoFilter:integer;
     needTabnoFilter:boolean;
     constructor createPrikaz(AOwner: TComponent;tabno:Integer);
     function getTabno:Integer;
     procedure setTabno(tabno:integer);
    { Public declarations }
  end;

var
  FormPrikazyBrowseTot: TFormPrikazyBrowseTot;

implementation
  uses UFibModule,UFormPrikazRekvizityTot,ScrUtil,SCrDef,DateUtils,
  UFormPrikazyFilter;

{$R *.dfm}

constructor TFormPrikazyBrowseTot.createPrikaz(AOwner: TComponent;tabno:Integer);
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
      dsPrikazy.Params[0].Value := tabno;
      dsPrikazy.Transaction.StartTransaction;
      dsPrikazy.Open;
 end;

procedure TFormPrikazyBrowseTot.setTabno(tabno:integer);
  begin
       Self.tabno:=tabno;
  end;
function TFormPrikazyBrowseTot.getTabno:integer;
  begin
       getTabno:=Self.tabno;
  end;
procedure TFormPrikazyBrowseTot.FormClose(Sender: TObject;
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

procedure TFormPrikazyBrowseTot.DBNavigator1Click(Sender: TObject;
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
     Application.CreateForm(TFormPrikazRekvizityTot,FormPrikazRekvizityTot);
     FormPrikazRekvizityTot.ShowModal;
end;

procedure TFormPrikazyBrowseTot.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     value:='-';
//     if CompareText(UPPER_STRING(Trim(VarName)),'TABNO')=0 then
//        Value:=IntToStr(Self.tabno)
//     else
//     if CompareText(UPPER_STRING(Trim(VarName)),'FIO')=0 then
//        Value:=Trim(Self.fio);
end;

procedure TFormPrikazyBrowseTot.BitBtn1Click(Sender: TObject);
begin
     if dsPrikazy.RecordCount>0 then
        frxReport1.ShowReport()
     else
        ShowMessage('Нет записей приказа');
end;

procedure TFormPrikazyBrowseTot.dsPrikazyCalcFields(DataSet: TDataSet);
var fio:string;
begin
     fio:='';
     if dsPrikazyTABNO.Value>0 then
        begin
             fio:=GetFullUkrFioPerson(dsPrikazyTABNO.Value);
             if length(trim(fio))>0 then
                fio:=SHORT_FIO(fio);
        end;
     dsPrikazyFIO.Value:=trim(fio);
end;

procedure TFormPrikazyBrowseTot.ActionSelPrikazExecute(Sender: TObject);
begin
     dsPrikazy.Edit;
     Application.CreateForm(TFormPrikazRekvizityTot,FormPrikazRekvizityTot);
     FormPrikazRekvizityTot.ShowModal;
      //Update Prikaz
end;

procedure TFormPrikazyBrowseTot.ActionAddPrikazExecute(Sender: TObject);
begin
// Add prikaz
     dsPrikazy.Insert;
     Application.CreateForm(TFormPrikazRekvizityTot,FormPrikazRekvizityTot);
     FormPrikazRekvizityTot.ShowModal;
end;

procedure TFormPrikazyBrowseTot.ActionDelPrikazExecute(Sender: TObject);
begin
     if yesNo('Удалить строку приказа') then
        dsPrikazy.Delete;
// delete prikaz
end;

procedure TFormPrikazyBrowseTot.ActionSeacrhPrikazExecute(Sender: TObject);
begin
// sel filter
    Application.CreateForm(TFormPrikazyFilter, FormPrikazyFilter);
    if FormPrikazyFilter.ShowModal=mrOk then
       setFilter;

end;

procedure TFormPrikazyBrowseTot.FormCreate(Sender: TObject);
var DateFrS,DateToS:String;
begin
//     dsPriType.Transaction.StartTransaction;
     dateFr:=encodeDAte(Curryear,nmes,1);
     dateTo:=encodeDAte(YearOf(DateFr),MonthOf(DateFr),lenmonth(dateFr));
     dateFrS:=intToStr(YearOf(DateFr))+'-'+intToStr(monthOf(DateFr))+'-01';
     dateToS:=intToStr(YearOf(DateTo))+'-'+intToStr(monthOf(DateTo))+'-'+intToStr(dayOf(DateTo));
//     filter:='DATAPRIK >= '+QuotedStr(dateFrS)+' and DATAPRIK <='+quotedStr(dateToS);
     needDateFilter  := true;
     needTypeFilter  := false;
     needTabnoFilter := false;
     tabnoFilter     := 0;
     prikazTypeFilter := 0;
     setFilter;

//     wantedFilter:='DATAPRIK >= '+QuotedStr(dateToStr(dateFr))+' and DATAPRIK <='+quotedStr(dateToStr(dateTo));
//     dsPrikazy.Filter:=Filter;
//     dsPrikazy.Filtered:=true;
     if dsPriType.Active then
        dsPriTYpe.Close;
     if dsPrikazy.Active then
        dsPrikazy.Close;
     if dsPrikazy.Transaction.Active then
        dsPrikazy.Transaction.Commit;
     if dsPrikazy.UpdateTransaction.Active then
        dsPrikazy.UpdateTransaction.Commit;

     dsPrikazy.Transaction.StartTransaction;
     if not dsPriType.Transaction.Active then
        dsPriType.Transaction.StartTransaction;
     dsPriType.Open;
     dsPrikazy.Open;
end;

procedure TFormPrikazyBrowseTot.setFilter;
var DateFrS,DateToS:String;
begin
     if dsPrikazy.Filtered
        and not needDateFilter
        and not needTypeFilter
        and not needTabnoFilter then
        begin
             dsPrikazy.Filtered:=false;
             dsPrikazy.Filter:='';
             exit;
        end;
     if not needDateFilter
        and not needTypeFilter
        and not needTabnoFilter then
        exit;
     wantedFilter:='';
     if needDateFilter then
        begin
             wantedFilter:='DATAPRIK >= '+QuotedStr(dateToStr(dateFr))+' and DATAPRIK <='+quotedStr(dateToStr(dateTo));

        end;
     if needTypeFilter then
        begin
          if length(trim(wantedFilter))>0 then
             wantedFilter:=wantedFilter+' and ';
             wantedFilter:=wantedFilter+'SHIFRIDTYP = '+intToStr(prikazTypeFilter);

        end;
     if needTabnoFilter then
        begin
          if length(trim(wantedFilter))>0 then
             wantedFilter:=wantedFilter+' and ';
             wantedFilter:=wantedFilter+'TABNO = '+intToStr(tabnoFilter);

        end;
     dsPrikazy.Filter:=wantedFilter;
     dsPrikazy.Filtered:=true;
end;
end.
