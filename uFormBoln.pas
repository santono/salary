{$WARNINGS OFF}
{$HINTS OFF}

unit uFormBoln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, ComCtrls, dxExEdtr, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, ExtCtrls, DBCtrls, Menus,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, OleServer, ExcelXP,
  frxClass, frxDBSet, frxExportPDF, frxDMPExport, frxCross, frxExportTXT,
  frxExportRTF;
                           
type
  TFormBoln = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DataSourceBoln: TDataSource;
    pFIBDataSetBoln: TpFIBDataSet;
    pFIBDataSetBolnTABNO: TFIBIntegerField;
    pFIBDataSetBolnFIO: TFIBStringField;
    pFIBDataSetBolnF_DATA: TFIBDateField;
    pFIBDataSetBolnL_DATA: TFIBDateField;
    pFIBDataSetBolnK_WO_DAY: TFIBSmallIntField;
    pFIBDataSetBolnSUMMA_BOL: TFIBBCDField;
    pFIBDataSetBolnSHIFRID: TFIBIntegerField;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1TABNO: TdxDBGridMaskColumn;
    dxDBGrid1FIO: TdxDBGridMaskColumn;
    dxDBGrid1F_DATA: TdxDBGridDateColumn;
    dxDBGrid1L_DATA: TdxDBGridDateColumn;
    dxDBGrid1K_WO_DAY: TdxDBGridMaskColumn;
    dxDBGrid1SUMMA_BOL: TdxDBGridCurrencyColumn;
    dxDBGrid1SHIFRID: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    pFIBDataSetBolnSHIFRKAT: TFIBSmallIntField;
    pFIBDataSetBolnSHIFRGRU: TFIBSmallIntField;
    pFIBDataSetBolnNOMER_B: TFIBStringField;
    pFIBDataSetBolnDATA_P: TStringField;
    pFIBDataSetBolnDATA_P_BUD: TFIBDateField;
    dxDBGrid1Data_P: TdxDBGridColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    pFIBQuerySecond: TpFIBQuery;
    pFIBTransactionSecond: TpFIBTransaction;
    N3: TMenuItem;
    pFIBDataSetBolnMODE_V_Z: TFIBSmallIntField;
    pFIBDataSetBolnSHIFR_STA: TFIBSmallIntField;
    dxDBGrid1ShifrSta: TdxDBGridDateColumn;
    pFIBDataSetBolnMODE_ILL: TFIBSmallIntField;
    dxDBGrid1ColumnModeIll: TdxDBGridColumn;
    N4: TMenuItem;
    pFIBDataSetBolnPROCENT: TFIBBCDField;
    pFIBDataSetBolnMEAN_DAY_BUD: TFIBBCDField;
    pFIBDataSetBolnMEAN_DAY_VNE: TFIBBCDField;
    pFIBDataSetBolnMEAN_DAY_GN: TFIBBCDField;
    pFIBDataSetBolnMEAN_DAY_NIS: TFIBBCDField;
    pFIBDataSetBolnMEAN_DAY: TFIBBCDField;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    pFIBDataSetBolnUchSwod: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetBolnUchSwodSHIFRKATB: TFIBIntegerField;
    pFIBDataSetBolnUchSwodNAMEKATB: TFIBStringField;
    pFIBDataSetBolnUchSwodSHIFRBAY: TFIBIntegerField;
    pFIBDataSetBolnUchSwodNAMEBAY: TFIBStringField;
    pFIBDataSetBolnUchSwodDAY_5: TFIBIntegerField;
    pFIBDataSetBolnUchSwodSUMMA_5: TFIBBCDField;
    pFIBDataSetBolnUchSwodDAY_O: TFIBIntegerField;
    pFIBDataSetBolnUchSwodSUMMA_O: TFIBBCDField;
    pFIBDataSetBolnUchSwodDAY_UH: TFIBIntegerField;
    pFIBDataSetBolnUchSwodSUMMA_UH: TFIBBCDField;
    pFIBDataSetBolnUchSwodDAY_DEK: TFIBIntegerField;
    pFIBDataSetBolnUchSwodSUMMA_DEK: TFIBBCDField;
    pFIBDataSetBolnUchSwodDAY_5_TOT: TFIBIntegerField;
    pFIBDataSetBolnUchSwodSUMMA_5_TOT: TFIBBCDField;
    pFIBDataSetBolnUchSwodDAY_TOT: TFIBIntegerField;
    DataSourceBolnUchSwod: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    N8: TMenuItem;
    pFIBDataSetBolnUchSwodSUMMA_TOT: TFIBBCDField;
    frxPDFExport1: TfrxPDFExport;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    N10: TMenuItem;
    frxReport1: TfrxReport;
    frxCrossObject1: TfrxCrossObject;
    FR1: TMenuItem;
    N21: TMenuItem;
    frxTXTExport1: TfrxTXTExport;
    frxRTFExport1: TfrxRTFExport;
    pFIBDataSetBolnMODE_DAY_CLOCK: TFIBSmallIntField;
    frxReport2: TfrxReport;
    frxReport3: TfrxReport;
    pFIBDataSetBolnDATA_P_VNE: TFIBDateField;
    pFIBDataSetBolnDATA_P_V: TStringField;
    dxDBGrid1Data_P_V: TdxDBGridColumn;
    pFIBDataSetBolnSWIDSS: TFIBStringField;
    pFIBDataSetBolnCODE_REASON_ILL: TFIBIntegerField;
    frxReport4: TfrxReport;
    pFIBDataSetBolnSHIFRBUH: TFIBIntegerField;
    pFIBDataSetBolnMODEWR: TFIBIntegerField;
    pFIBDataSetBolnmodewrname: TStringField;
    dxDBGrid1MODEWRNAME: TdxDBGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure pFIBDataSetBolnCalcFields(DataSet: TDataSet);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure dxDBGrid1CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure PrintReestrBoln(WantedBay:integer);
    procedure N8Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure frxReport2ManualBuild(Page: TfrxPage);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure frxReport3ManualBuild(Page: TfrxPage);
    procedure N21Click(Sender: TObject);
    procedure FR1Click(Sender: TObject);
    procedure frxReport4ManualBuild(Page: TfrxPage);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    CrossSum :  TfrxCrossView;
    CrossBol :  TfrxCrossView;
    WantedYear:integer;
    WantedMonth:integer;
    procedure ShowTable;
    procedure PrintBolnFR(ShifrIdBoln:integer);
    procedure PrintBolnFRCross(ShifrIdBoln:integer);
    procedure PrintBolnListFROld(ShifrIdBoln:integer);

    procedure PrintSelectedBoln;
    procedure PrintSelectedBolnCross;
    procedure PrintSelectedBolnFROld;



  public
    WantedMode : integer; {10- командировки: Остальное - больничные}
    { Public declarations }
  end;

procedure PrintBolnList(ShifrIdBoln:integer);
procedure PrintBolnListM(ShifrIdBoln:integer);
procedure PrintBolnListN(ShifrIdBoln:integer);
//procedure PrintBolnListOld(ShifrIdBoln:integer);

var
  FormBoln: TFormBoln;

implementation
uses uFrmFindKadryFB,UFibModule,
     UFormUpdBoln,ScrDef,UFormWait,
     ComObj,ScrUtil,ScrLists,UFormSelBay,UFormView,uSQLUnit;

{$R *.dfm}

procedure TFormBoln.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     if pFIBDataSetBoln.Active then pFIBDataSetBoln.Active:=false;
     if FIB.pFIBTransactionSAL.InTransaction then
        FIB.pFIBTransactionSAL.Commit;
     Action:=caFree;
end;

procedure TFormBoln.FormCreate(Sender: TObject);
var Wanteddata:TDateTime;
    Year,Month,Day:word;
    selectSQL:wideString;
    deleteSQL:widestring;
    insertSQL:widestring;
    updateSQL:widestring;
    refreshSQL:widestring;

begin
      Year  := CurrYear;
      Month := NMES;
{      WantedData  :=  Now;}
{      DecodeDate(WantedData, Year, Month, Day);}
      WantedYear  := Year;
      WantedMonth := Month;
      WantedData  := EncodeDate(WantedYear, WantedMonth, 1);
      WantedMode  := 0;
      DateTimePicker1.Date := WantedData;
//      dxDBGrid1.Height:=Self.Height-Screen.PixelsPerInch*23 div 25;
      if FLOW_MONTH<>NMES then
         DBNavigator1.VisibleButtons:=DBNavigator1.VisibleButtons-[nbInsert];

      if isLNR then
        begin
              selectSQL:='select tabno,fio,f_data,l_data,k_wo_day,'+
                        'summa_bol,ShifrId,ShifrKat,ShifrGru,Nomer_B,'+
                        'Data_P_Bud,Mode_V_Z,Shifr_Sta,Mode_Ill,PROCENT,'+
                        'MEAN_DAY,MEAN_DAY_BUD,MEAN_DAY_VNE,MEAN_DAY_GN,'+
                        'MEAN_DAY_NIS,MODE_DAY_CLOCK,Data_P_Vne,SwidSS,'+
                        'CODE_REASON_ILL,SHIFRBUH,modeWR from boln '+
                        ' where Year_Vy=:WantedYear and Month_Vy=:WantedMonth '+
                        ' order by fio';

              insertSQL:='INSERT INTO BOLN('+
                         'TABNO,'+
                         'FIO,'+
                         'F_DATA,'+
                         'L_DATA,'+
                         'K_WO_DAY,'+
                         'SUMMA_BOL,'+
                         'SHIFRID'+
                         ') '+
                         ' VALUES('+
                          ':TABNO,'+
                          ':FIO,'+
                          ':F_DATA,'+
                          ':L_DATA,'+
                          ':K_WO_DAY,'+
                          ':SUMMA_BOL,'+
                          ':SHIFRID'+
                         ')';

              refreshSQL:='select tabno,fio,f_data,l_data,k_wo_day,'+
                         'summa_bol,ShifrId,ShifrKat,ShifrGru,Nomer_B,'+
                         'Data_P_Bud,Mode_V_Z,Shifr_Sta,Mode_Ill,PROCENT,'+
                         'MEAN_DAY,MEAN_DAY_BUD,MEAN_DAY_VNE,MEAN_DAY_GN,'+
                         'MEAN_DAY_NIS,MODE_DAY_CLOCK,Data_P_Vne,SwidSS,'+
                         'CODE_REASON_ILL,SHIFRBUH,modeWR from boln '+
                         ' where Year_Vy=:WantedYear and Month_Vy=:WantedMonth'+
                         ' order by fio';

              updateSQL:='UPDATE BOLN '+
                         ' SET '+
                         ' TABNO = :TABNO,'+
                         ' FIO = :FIO,'+
                         ' F_DATA = :F_DATA,'+
                         ' L_DATA = :L_DATA,'+
                         ' K_WO_DAY = :K_WO_DAY,'+
                         ' SUMMA_BOL = :SUMMA_BOL'+
                         ' WHERE '+
                         ' SHIFRID = :OLD_SHIFRID';

              deleteSQL:='DELETE FROM BOLN WHERE SHIFRID = :OLD_SHIFRID';
//              pFIBDataSetBolnMODEWR.Visible := true;
//              dxDBGrid1MODEWRNAME.Visible   := true;
        end
      else
        begin
              selectSQL:='select tabno,fio,f_data,l_data,k_wo_day,'+
                        'summa_bol,ShifrId,ShifrKat,ShifrGru,Nomer_B,'+
                        'Data_P_Bud,Mode_V_Z,Shifr_Sta,Mode_Ill,PROCENT,'+
                        'MEAN_DAY,MEAN_DAY_BUD,MEAN_DAY_VNE,MEAN_DAY_GN,'+
                        'MEAN_DAY_NIS,MODE_DAY_CLOCK,Data_P_Vne,SwidSS,'+
                        'CODE_REASON_ILL,SHIFRBUH,MODEWR from boln '+
                        ' where Year_Vy=:WantedYear and Month_Vy=:WantedMonth '+
                        ' order by fio';

              insertSQL:='INSERT INTO BOLN('+
                         'TABNO,'+
                         'FIO,'+
                         'F_DATA,'+
                         'L_DATA,'+
                         'K_WO_DAY,'+
                         'SUMMA_BOL,'+
                         'SHIFRID'+
                         ') '+
                         ' VALUES('+
                          ':TABNO,'+
                          ':FIO,'+
                          ':F_DATA,'+
                          ':L_DATA,'+
                          ':K_WO_DAY,'+
                          ':SUMMA_BOL,'+
                          ':SHIFRID'+
                         ')';

              refreshSQL:='select tabno,fio,f_data,l_data,k_wo_day,'+
                         'summa_bol,ShifrId,ShifrKat,ShifrGru,Nomer_B,'+
                         'Data_P_Bud,Mode_V_Z,Shifr_Sta,Mode_Ill,PROCENT,'+
                         'MEAN_DAY,MEAN_DAY_BUD,MEAN_DAY_VNE,MEAN_DAY_GN,'+
                         'MEAN_DAY_NIS,MODE_DAY_CLOCK,Data_P_Vne,SwidSS,'+
                         'CODE_REASON_ILL,SHIFRBUH,0 as modeWR from boln '+
                         ' where Year_Vy=:WantedYear and Month_Vy=:WantedMonth'+
                         ' order by fio';

              updateSQL:='UPDATE BOLN '+
                         ' SET '+
                         ' TABNO = :TABNO,'+
                         ' FIO = :FIO,'+
                         ' F_DATA = :F_DATA,'+
                         ' L_DATA = :L_DATA,'+
                         ' K_WO_DAY = :K_WO_DAY,'+
                         ' SUMMA_BOL = :SUMMA_BOL'+
                         ' WHERE '+
                         ' SHIFRID = :OLD_SHIFRID';

              deleteSQL:='DELETE FROM BOLN WHERE SHIFRID = :OLD_SHIFRID';
//              pFIBDataSetBolnMODEWR.Visible:=false;
//              dxDBGrid1MODEWRNAME.Visible:=false;

        end;
     pFIBDataSetBoln.SQLs.SelectSQL.Clear;
     pFIBDataSetBoln.SQLs.SelectSQL.Add(trim(selectSQL));
     pFIBDataSetBoln.SQLs.InsertSQL.Clear;
     pFIBDataSetBoln.SQLs.InsertSQL.Add(trim(insertSQL));
     pFIBDataSetBoln.SQLs.RefreshSQL.Clear;
     pFIBDataSetBoln.SQLs.RefreshSQL.Add(trim(refreshSQL));
     pFIBDataSetBoln.SQLs.UpdateSQL.Clear;
     pFIBDataSetBoln.SQLs.UpdateSQL.Add(trim(updateSQL));
     pFIBDataSetBoln.SQLs.DeleteSQL.Clear;
     pFIBDataSetBoln.SQLs.DeleteSQL.Add(trim(deleteSQL));




      ShowTable;


end;

procedure TFormBoln.ShowTable;
 var I_Count:integer;
begin
      FormWait.Show;
      Application.ProcessMessages;
      if pFIBDataSetBoln.Active then
         pFIBDataSetBoln.Active:=false;
      pFIBDataSetBoln.Params[0].AsString:=IntToStr(Self.WantedYear);
      pFIBDataSetBoln.Params[1].AsString:=IntToStr(WantedMonth);
      pFIBDataSetBoln.Prepare;
      pFIBDataSetBoln.Open;
      if WantedMode=10 then
         begin
              pFIBDataSetBoln.Filter:='Mode_Ill=10';
              Caption:='Командировки';
         end
      else
         begin
              Caption:='Больничные';
              pFIBDataSetBoln.Filter:='Mode_Ill<>10';
         end;
      pFIBDataSetBoln.Filtered:=true;
      FormWait.Hide;
      I_Count:=pFIBDataSetBoln.RecordCount;
      DBNavigator1.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast];
      if ((Flow_Month=NMES) and (WantedYear=CurrYear)) then
         begin
              DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons +
                    [nbInsert,nbPost,nbCancel];
              if I_Count>0 then
                 DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons + [nbDelete];
         end;
      if I_Count>0 then
         DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons + [nbEdit,nbRefresh];

end;

procedure TFormBoln.DateTimePicker1Change(Sender: TObject);
var Year,Month,Day:word;
    I_Count:Integer;
begin
     DecodeDate(DateTimePicker1.Date, Year, Month, Day);
     WantedYear  := Year;
     WantedMonth := Month;
     ShowTable;
     I_Count:=pFIBDataSetBoln.RecordCount;
     DBNavigator1.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast];
     if ((WantedMonth=NMES) and (WantedYear=CurrYear)) then
        begin
             DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons +
                   [nbInsert,nbPost,nbCancel];
             if I_Count>0 then
                DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons + [nbDelete];
        end;
     if I_Count>0 then
        DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons + [nbEdit,nbRefresh];

end;

procedure TFormBoln.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
var
  BtnName: string;
  Act:integer;
  ShifrIdB:integer;
  S:String;
begin
  Act:=0;
  case Button of
    nbInsert : Act:=1;
    nbDelete : Act:=3;
    nbEdit   : Act:=2;
  end;
  IF ((ACT=1) OR (ACT=3)) AND ((Flow_Month<>NMES) OR (WantedYear<>CurrYear)) THEN EXIT;
  if Act>0 then
     begin
          with TFormUpdBoln.Create(nil) do
            begin
               try
                  ActionClar:=Act;
                  WantedTabno:=0;
                  Fio:='';
                  WorkYear    := WantedYear;
                  WorkMonth   := WantedMonth;
                  ShifrIdBoln := 0;
                  Mode_Ill_GLO    := 0;
                  ModeDC      := 0;
                  WantedCodeIll := 1;
                  ShifrBuh    := CurrWrk;
                  WantedMode  := Self.WantedMode;
                  WantedPodr  := NSRV;
                  Mode_V_Z    := 1; // в
                  if Self.WantedMode=10 then
                     Mode_V_Z    := 0; // за - для командировочных

                  if Act=1 then
                     begin
                          if not FIB.pFIBQuery.Transaction.Active then
                             FIB.pFIBQuery.Transaction.StartTransaction;
                          FIB.pFIBQuery.SQL.Clear;
                          s:='EXECUTE PROCEDURE PR_DELETE_ALL_FROM_TMP_BOLN';
                          FIB.pFIBQuery.SQL.Add(s);
                          try
                               FIB.pFIBQuery.ExecQuery;
                               FIB.pFIBQuery.Close;
                          except
                               else
                                    begin
                                         ShowMessage('Ошибка чистки временных таблиц отпускных');
                                         Exit;
                                    end
                          end;
                          if FIB.pFIBQuery.Transaction.Active then
                             FIB.pFIBQuery.Transaction.Commit;
                     end;
                  if Act<>1 then
                     begin
                          WantedTabno:=SELF.pFIBDataSetBoln.FieldByName('TABNO').AsInteger;
                          Fio:=SELF.pFIBDataSetBoln.FieldByName('FIO').AsString;
                          ShifrKat:=SELF.pFIBDataSetBoln.FieldByName('SHIFRKAT').AsInteger;
                          ShifrGru:=SELF.pFIBDataSetBoln.FieldByName('SHIFRGRU').AsInteger;
                          ShifrIdBoln:=SELF.pFIBDataSetBoln.FieldByName('SHIFRID').AsInteger;
                          NomerB:=SELF.pFIBDataSetBoln.FieldByName('NOMER_B').AsString;
                          SwidSS:=SELF.pFIBDataSetBoln.FieldByName('SWIDSS').AsString;
                          WantedCodeIll := SELF.pFIBDataSetBoln.FieldByName('CODE_REASON_ILL').AsInteger;
                          DateTimePickerFr.Date:=SELF.pFIBDataSetBoln.FieldByName('F_DATA').AsDateTime;
                          DateTimePickerTo.Date:=SELF.pFIBDataSetBoln.FieldByName('L_DATA').AsDateTime;
                          Mode_V_Z    := SELF.pFIBDataSetBoln.FieldByName('MODE_V_Z').AsInteger;
                          B_Day       := SELF.pFIBDataSetBoln.FieldByName('K_WO_DAY').AsInteger;
                          WantedProc  := SELF.pFIBDataSetBoln.FieldByName('PROCENT').AsFloat;
                          MeanDay     := SELF.pFIBDataSetBoln.FieldByName('MEAN_DAY').AsFloat;
                          MeanDay_Bud := SELF.pFIBDataSetBoln.FieldByName('MEAN_DAY_BUD').AsFloat;
                          MeanDay_Vne := SELF.pFIBDataSetBoln.FieldByName('MEAN_DAY_VNE').AsFloat;
                          MeanDay_GN  := SELF.pFIBDataSetBoln.FieldByName('MEAN_DAY_GN').AsFloat;
                          MeanDay_NIS := SELF.pFIBDataSetBoln.FieldByName('MEAN_DAY_NIS').AsFloat;
                          WantedShifrSta :=SELF.pFIBDataSetBoln.FieldByName('SHIFR_STA').AsInteger;
                          Mode_Ill_GLO       :=SELF.pFIBDataSetBoln.FieldByName('MODE_ILL').AsInteger;
                          ModeDC       :=SELF.pFIBDataSetBoln.FieldByName('MODE_DAY_CLOCK').AsInteger;
                          ShifrBuh     :=SELF.pFIBDataSetBoln.FieldByName('SHIFRBUH').AsInteger;
                     end;
                  ShifrIdB:=ShifrIdBoln;
                  if execute then
                     begin
                     end;
                  ShifrIdB:=ShifrIdBoln;
              finally
                free;
              end;
            ShowTable;
            if ShifrIdB>0 then
               begin
{                    ShifrIdB:=ShifrIdBoln;}
{                   SELF.pFIBDataSetBoln.FieldByName('SHIFRID').AsInteger:=ShifrIdBoln;}
                    SELF.pFIBDataSetBoln.Locate('ShifrId',ShifrIdB,[loPartialKey]);
               end;
           end;
     end;

end;

procedure TFormBoln.DBNavigator1BeforeAction(Sender: TObject;
  Button: TNavigateBtn);
VAR Act:INTEGER;
begin
 Act:=0;
  case Button of
    nbInsert : Act:=1;
    nbDelete : Act:=3;
    nbEdit   : Act:=2;
  end;
  IF ((ACT=1) OR (ACT=3)) AND
     ((WantedMonth<>NMES) OR
      (WantedYear<>CurrYear)) THEN
     begin
          pFIBDataSetBoln.Cancel;
          EXIT;
     end;
end;

procedure TFormBoln.pFIBDataSetBolnCalcFields(DataSet: TDataSet);
var DT:TDateTime;
    Y,M,D:Word;
begin
     Dt:=DataSet.FieldByName('Data_P_Bud').AsDateTime;
     DeCodeDate(DT,Y,M,D);
     if Y<1995 then
        pFIBDataSetBolnDATA_P.Value:=''
               else
        pFIBDataSetBolnDATA_P.Value:=IntToStr(D)+'.'+IntToStr(M)+'.'+IntToStr(Y);
     Dt:=DataSet.FieldByName('Data_P_Vne').AsDateTime;
     DeCodeDate(DT,Y,M,D);
     if Y<1995 then
        pFIBDataSetBolnDATA_P_V.Value:=''
               else
        pFIBDataSetBolnDATA_P_V.Value:=IntToStr(D)+'.'+IntToStr(M)+'.'+IntToStr(Y);
// if isLNR then
    if pFIBDataSetBolnMODEWR.IsNull then
        pFIBDataSetBolnMODEWRNAME.Value:='ОиС'
    else
    case pFIBDataSetBolnMODEWR.Value of
      1 : pFIBDataSetBolnMODEWRNAME.Value:='Осн';
      2 : pFIBDataSetBolnMODEWRNAME.Value:='Свм';
      else
        pFIBDataSetBolnMODEWRNAME.Value:='ОиС';
    end
// else
//    pFIBDataSetBolnMODEWRNAME.Value:='';

end;

procedure TFormBoln.N1Click(Sender: TObject);
var E,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    LineNo,CntMonth:integer;
begin
     FName:=TemplateDIR+'ReeBol.xls';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     ExRow:=3;
     ExCol:=1;
     E.WorkBooks[1].WorkSheets['reestr'].Cells[ExRow,1]:=' за '+Trim(GetMonthRus(WantedMonth))+' '+IntToStr(WantedYear)+' года';

     if not pFIBTransactionSecond.Active then
        pFIBTransactionSecond.StartTransaction;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add(' select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,Nomer_B,Procent,MEAN_DAY,NAL_CODE from boln');
     FIB.pFIBQuery.SQL.Add(' where Year_Vy='+IntToStr(WantedYear)+' and Month_Vy='+IntToStr(WantedMonth));
     FIB.pFIBQuery.SQL.Add(' order by fio');
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     try
        LineNo:=0;
        FIB.pFIBQuery.ExecQuery;
        ExRow:=16;
        while not FIB.pFIBQuery.Eof do
          begin
               Inc(LineNo);
               Inc(ExRow);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1].Select;
               E.Selection.EntireRow.Insert;
               WC:=E.ActiveCell;
{               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=LineNo;}
               WC.Value:=LineNo;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=FIB.pFIBQuery.FieldByName('NOMER_B').AsString;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=FIB.pFIBQuery.Fields[0].AsInteger;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=trim(FIB.pFIBQuery.FieldByName('NAL_CODE').AsString);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=trim(FIB.pFIBQuery.FieldByName('FIO').AsString);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=DateToStr(FIB.pFIBQuery.FieldByName('F_DATA').AsDate);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=DateToStr(FIB.pFIBQuery.FieldByName('L_DATA').AsDate);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=FIB.pFIBQuery.FieldByName('K_WO_DAY').AsInteger;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]:=FIB.pFIBQuery.FieldByName('Procent').AsFloat;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10]:=FIB.pFIBQuery.FieldByName('SUMMA_BOL').AsFloat;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11]:=GET_kat_name(FIB.pFIBQuery.FieldByName('SHIFRKAT').AsInteger);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,12]:=FIB.pFIBQuery.FieldByName('MEAN_DAY').AsFloat;
               pFIBQuerySecond.SQL.Clear;
               pFIBQuerySecond.SQL.Add(' select MONTH_ZA,B_DAY,SUMMA_B_BUD+SUMMA_B_VNE+SUMMA_B_GN+SUMMA_B_NIS from BOLN_RES');
               pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
               pFIBQuerySecond.SQL.Add(' order by YEAR_ZA,MONTH_ZA');
               try
                  pFIBQuerySecond.ExecQuery;
                  CntMonth:=0;
                  while not pFIBQuerySecond.Eof do
                    begin
                         Inc(CntMonth);
                         if CntMonth>1 then
                            begin
                                 Inc(ExRow);
                                 E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1].Select;
                                 E.Selection.EntireRow.Insert;
                            end;
                         E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13]:=Trim(GetMonthRus(pFIBQuerySecond.FieldByName('MONTH_ZA').AsINTEGER));
                         E.WorkBooks[1].WorkSheets[1].Cells[ExRow,14]:=pFIBQuerySecond.FieldByName('B_DAY').AsINTEGER;
                         E.WorkBooks[1].WorkSheets[1].Cells[ExRow,15]:=pFIBQuerySecond.Fields[2].AsFloat;
                         pFIBQuerySecond.Next;
                    end;
                  if pFIBQuerySecond.Open then
                     pFIBQuerySecond.Close;
               except
                    ShowMessage('Ошибка выполнения запроса параметров больничного листка');
                    exit;
               end;
               pFIBQuerySecond.SQL.Clear;
               pFIBQuerySecond.SQL.Add(' select MONTH_ZA,DAYS,SUMMA_BUD+SUMMA_VNE+SUMMA_GN+SUMMA_NIS from BOLN_SUMMY');
               pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
               pFIBQuerySecond.SQL.Add(' and SEL>0');
               pFIBQuerySecond.SQL.Add(' order by YEAR_ZA DESC,MONTH_ZA DESC');
               try
                  pFIBQuerySecond.ExecQuery;
                  while not pFIBQuerySecond.Eof do
                    begin
                         Inc(ExRow);
                         E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1].Select;
                         E.Selection.EntireRow.Insert;
                         E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11]:='Исх.данные';
                         E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13]:=Trim(GetMonthRus(pFIBQuerySecond.FieldByName('MONTH_ZA').AsINTEGER));
                         E.WorkBooks[1].WorkSheets[1].Cells[ExRow,14]:=pFIBQuerySecond.FieldByName('DAYS').AsINTEGER;
                         E.WorkBooks[1].WorkSheets[1].Cells[ExRow,15]:=pFIBQuerySecond.Fields[2].AsFloat;
                         pFIBQuerySecond.Next;
                    end;
                    if pFIBQuerySecond.Open then
                      pFIBQuerySecond.Close;


               except
                    ShowMessage('Ошибка выполнения запроса исходных данных больничного листка');
                    exit;
               end;
                  for ExCol:=1 to 15 do
                      begin
{
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeLeft].LineStyle     := xlContinuous;
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeLeft].Weight     := xlThin;
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeLeft].ColorIndex := xlAutomatic;

                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeTop].LineStyle := xlNone;
}

                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeBottom].LineStyle  := xlContinuous;
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeBottom].Weight     := xlThin;
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeBottom].ColorIndex := xlAutomatic;
{
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeRight].LineStyle  := xlContinuous;
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeRight].Weight     := xlThin;
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeRight].ColorIndex := xlAutomatic;

                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlInsideVertical].LineStyle  := xlContinuous;
}                           
{                          E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlInsideVertical].Weight     := xlThin;
                          E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlEdgeRight].Weight     := xlThin;
                          E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Borders[xlInsideVertical].ColorIndex := xlAutomatic;      }

                      end;
               FIB.pFIBQuery.Next;
          end;
       { Формирование итоговых сумм }
        pFIBQuerySecond.SQL.Clear;
        pFIBQuerySecond.SQL.Add('SELECT SUM(BOLN_RES.SUMMA_B_BUD),SUM(BOLN_RES.SUMMA_B_VNE+BOLN_RES.SUMMA_B_GN+BOLN_RES.SUMMA_B_NIS) from BOLN JOIN BOLN_RES ON BOLN.SHIFRID=BOLN_RES.SHIFRIDBOLN');
        pFIBQuerySecond.SQL.Add(' WHERE BOLN.MONTH_VY='+IntToStr(WantedMonth)+' AND BOLN.YEAR_VY='+IntToStr(WantedYear));
        try
           pFIBQuerySecond.ExecQuery;
           E.WorkBooks[1].WorkSheets[1].Cells[ExRow+3,10]:=pFIBQuerySecond.Fields[0].AsFloat;
           E.WorkBooks[1].WorkSheets[1].Cells[ExRow+4,10]:=pFIBQuerySecond.Fields[1].AsFloat;
           if pFIBQuerySecond.Open then
              pFIBQuerySecond.Close;
        except
              ShowMessage('Ошибка выполнения запроса итогов больничных листков за указанный период');
        end;
     except
        ShowMessage('Ошибка выполнения запроса списка больничных за указанный период');
     end;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.Transaction.Commit;
     if pFIBTransactionSecond.Active then
        pFIBTransactionSecond.Commit;
     ShowTable;
end;

procedure TFormBoln.N2Click(Sender: TObject);
var E,WB,XLS,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    Tabno : integer;
    Cnt,CntMonth:integer;
    ShifrIdBoln:integer;
begin
     ShifrIdBoln:=SELF.pFIBDataSetBoln.FieldByName('SHIFRID').AsInteger;
     PrintBolnListM(ShifrIdBoln);
(*
     if ShifrIdBoln<1 then
        begin
             ShowMessage('Неверно указан больничный лист');
             Exit;
        end;
     FName:=TemplateDIR+'BolList.xls';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add(' select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,Nomer_B,Procent,MEAN_DAY,NAL_CODE,SHIFR_STA from boln');
     FIB.pFIBQuery.SQL.Add(' where ShifrId='+IntToStr(ShifrIdBoln));
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     try
        FIB.pFIBQuery.ExecQuery;
        Tabno:=FIB.pFIBQuery.FieldByName('TABNO').AsInteger;
        ExRow:=16;
        E.WorkBooks[1].WorkSheets[1].Cells[2,4]:=FIB.pFIBQuery.FieldByName('NOMER_B').AsString;
        E.WorkBooks[1].WorkSheets[1].Cells[3,3]:=FIB.pFIBQuery.FieldByName('FIO').AsString;
        E.WorkBooks[1].WorkSheets[1].Cells[3,5]:=FIB.pFIBQuery.FieldByName('TABNO').AsInteger;
        E.WorkBooks[1].WorkSheets[1].Cells[3,8]:=FIB.pFIBQuery.FieldByName('NAL_CODE').AsString;
        E.WorkBooks[1].WorkSheets[1].Cells[4,3]:=DateToStr(FIB.pFIBQuery.FieldByName('F_DATA').AsDate);
        E.WorkBooks[1].WorkSheets[1].Cells[4,5]:=DateToStr(FIB.pFIBQuery.FieldByName('L_DATA').AsDate);
        E.WorkBooks[1].WorkSheets[1].Cells[4,8]:=FIB.pFIBQuery.FieldByName('K_WO_DAY').AsFloat;
        E.WorkBooks[1].WorkSheets[1].Cells[5,3]:=FIB.pFIBQuery.FieldByName('PROCENT').AsFloat;
        E.WorkBooks[1].WorkSheets[1].Cells[6,3]:=IntToStr(FIB.pFIBQuery.FieldByName('SHIFR_STA').AsInteger)+' '+trim(ShifrList.GetName(FIB.pFIBQuery.FieldByName('SHIFR_STA').AsInteger));
        E.WorkBooks[1].WorkSheets[1].Cells[7,3]:=FIB.pFIBQuery.FieldByName('MEAN_DAY').AsFloat;

        if not pFIBTransactionSecond.Active then
           pFIBTransactionSecond.StartTransaction;
        pFIBQuerySecond.SQL.Clear;
        pFIBQuerySecond.SQL.Add('select first 1 oklad,shifrkat from person a');
        pFIBQuerySecond.SQL.Add(' where a.tabno='+IntToStr(Tabno)+' and');
        pFIBQuerySecond.SQL.Add(' a.yearvy*12+a.monthvy <= '+IntToStr(WantedYear*12+WantedMonth)+' and');
        pFIBQuerySecond.SQL.Add(' a.w_r=1');
        pFIBQuerySecond.SQL.Add(' order by a.yearvy desc, a.monthvy desc');
        try
           pFIBQuerySecond.ExecQuery;
           E.WorkBooks[1].WorkSheets[1].Cells[6,7]:=pFIBQuerySecond.FieldByName('OKLAD').AsFloat;
           E.WorkBooks[1].WorkSheets[1].Cells[5,5]:=GET_KAT_NAME(pFIBQuerySecond.FieldByName('SHIFRKAT').AsInteger);
        except
           ShowMessage('Ошибка запроса оклада и категории работника');
        end;
        pFIBQuerySecond.Close;
        pFIBQuerySecond.SQL.Clear;
        pFIBQuerySecond.SQL.Add(' select MONTH_ZA,B_DAY,SUMMA_B_BUD,SUMMA_B_VNE,SUMMA_B_GN,SUMMA_B_NIS from BOLN_RES');
        pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
        pFIBQuerySecond.SQL.Add(' order by YEAR_ZA,MONTH_ZA');
        try
           ExRow := 10;
           pFIBQuerySecond.ExecQuery;
           while not pFIBQuerySecond.Eof do
             begin
                  inc(ExRow);
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=Trim(GetMonthRus(pFIBQuerySecond.FieldByName('MONTH_ZA').AsINTEGER));
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=pFIBQuerySecond.FieldByName('B_DAY').AsINTEGER;
                  if abs(pFIBQuerySecond.Fields[2].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]:=pFIBQuerySecond.Fields[2].AsFloat;
                  if abs(pFIBQuerySecond.Fields[3].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10]:=pFIBQuerySecond.Fields[3].AsFloat;
                  if abs(pFIBQuerySecond.Fields[4].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10]:=pFIBQuerySecond.Fields[4].AsFloat;
                  if abs(pFIBQuerySecond.Fields[5].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10]:=pFIBQuerySecond.Fields[5].AsFloat;
                  pFIBQuerySecond.Next;
             end;
           if pFIBQuerySecond.Open then
           pFIBQuerySecond.Close;
        except
           ShowMessage('Ошибка выполнения запроса параметров больничного листка');
           exit;
        end;

        pFIBQuerySecond.SQL.Clear;
        pFIBQuerySecond.SQL.Add(' select MONTH_ZA,DAYS,SUMMA_BUD,SUMMA_VNE+SUMMA_GN+SUMMA_NIS,SEL from BOLN_SUMMY');
        pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
{        pFIBQuerySecond.SQL.Add(' and SEL>0');}
        pFIBQuerySecond.SQL.Add(' order by YEAR_ZA DESC,MONTH_ZA DESC');
        try
           ExRow := 9;
           pFIBQuerySecond.ExecQuery;
           while not pFIBQuerySecond.Eof do
             begin
                  Inc(ExRow);
                  if pFIBQuerySecond.FieldByName('SEL').AsInteger>0 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:='+';
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=Trim(GetMonthRus(pFIBQuerySecond.FieldByName('MONTH_ZA').AsINTEGER));
                  if abs(pFIBQuerySecond.Fields[2].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pFIBQuerySecond.Fields[2].AsFloat;
                  if abs(pFIBQuerySecond.Fields[3].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=pFIBQuerySecond.Fields[3].AsFloat;
                  if pFIBQuerySecond.FieldByName('DAYS').AsINTEGER>0 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pFIBQuerySecond.FieldByName('DAYS').AsINTEGER;
                  pFIBQuerySecond.Next;
             end;
           if pFIBQuerySecond.Open then
              pFIBQuerySecond.Close;
        except
              ShowMessage('Ошибка выполнения запроса исходных данных больничного листка');
              exit;
        end;
     except
        ShowMessage('Ошибка выполнения запроса параметров больничного листка');
     end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     if pFIBTransactionSecond.Active then
        pFIBTransactionSecond.Commit;
*)        
     ShowTable;
     if ShifrIdBoln>0 then
        SELF.pFIBDataSetBoln.Locate('ShifrId',ShifrIdBoln,[loPartialKey]);

end;


procedure TFormBoln.PrintReestrBoln(WantedBay:integer);
var E,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    LineNo,CntMonth:integer;
    FIOOP:String;
begin
     FName:=TemplateDIR+'SwodBol.xls';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     if WantedBay>0 then FioOp:=FIB.GetFioCurrWrk(WantedBay);
     E.Visible := True;
     E.WorkBooks.Open(FName);
     ExRow     := 5;
     ExCol     := 1;
     if WantedBay=0 then
        E.WorkBooks[1].WorkSheets['Reestr'].Cells[ExRow,1]:=' Свод лікарняних за '+Trim(GetMonthRus(WantedMonth))+' '+IntToStr(WantedYear)+' року'
     else
        E.WorkBooks[1].WorkSheets['Reestr'].Cells[ExRow,1]:=' Свод лікарняних за '+Trim(GetMonthRus(WantedMonth))+' '+IntToStr(WantedYear)+' року. Участок '+Trim(FioOp);

     FIB.pFIBQuery.SQL.Clear;

     FIB.pFIBQuery.SQL.Add('select c.shifrbuh as ShifrBuh,a.F_DATA,a.tabno,a.nal_code,a.fio,a.nomer_b,');
     FIB.pFIBQuery.SQL.Add(' sum(b.summa_b_bud+b.summa_b_vne+b.summa_b_gn+b.summa_b_nis) as S,');
     FIB.pFIBQuery.SQL.Add(' sum(case when b.shifrsta=12 then b.summa_b_bud+b.summa_b_vne+b.summa_b_gn+b.summa_b_nis else 0 end) as S_5,');
     FIB.pFIBQuery.SQL.Add(' sum(case when b.shifrsta<>12 then b.summa_b_bud+b.summa_b_vne+b.summa_b_gn+b.summa_b_nis else 0  end) as S_V,');
     FIB.pFIBQuery.SQL.Add('  sum(b.summa_b_bud) as S_BUD,');
     FIB.pFIBQuery.SQL.Add('  sum(b.summa_b_vne) as S_VNE,');
     FIB.pFIBQuery.SQL.Add('  sum(b.summa_b_gn)  as S_GN,');
     FIB.pFIBQuery.SQL.Add('  sum(b.summa_b_nis) as S_NIS');
     FIB.pFIBQuery.SQL.Add(' from boln a');
     FIB.pFIBQuery.SQL.Add(' join boln_res b on a.shifrid=b.shifridboln');
     FIB.pFIBQuery.SQL.Add(' join bay c on c.shifrpod = a.w_place');
     FIB.pFIBQuery.SQL.Add(' where a.year_vy='+IntToStr(WantedYear)+' and a.month_vy='+IntToStr(WantedMonth));
     FIB.pFIBQuery.SQL.Add(' and c.shifrbuh not in (11,12)');
     FIB.pFIBQuery.SQL.Add(' group by 1,2,3,4,5,6');
     FIB.pFIBQuery.SQL.Add(' order by 5');

     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     try
        LineNo:=0;
        FIB.pFIBQuery.ExecQuery;
        ExRow:=8;
        while not FIB.pFIBQuery.Eof do
          begin
               if (WantedBay=0) or (WantedBay=FIB.pFIBQuery.FieldByName('ShifrBuh').AsInteger) then
                  begin
                     Inc(LineNo);
                     Inc(ExRow);
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1].Select;
                     E.Selection.EntireRow.Insert;
                     WC:=E.ActiveCell;
{               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=LineNo;}
                      WC.Value:=LineNo;
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=LineNo;
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=FIB.pFIBQuery.FieldByName('Tabno').AsInteger;
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=trim(FIB.pFIBQuery.FieldByName('NAL_CODE').AsString);
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=trim(FIB.pFIBQuery.FieldByName('NOMER_B').AsString);
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=trim(FIB.pFIBQuery.FieldByName('FIO').AsString);
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=FIB.pFIBQuery.FieldByName('S').AsFloat;
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=FIB.pFIBQuery.FieldByName('S_5').AsFloat;
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=FIB.pFIBQuery.FieldByName('S_V').AsFloat;
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]:=FIB.pFIBQuery.FieldByName('S_BUD').AsFloat;
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10]:=FIB.pFIBQuery.FieldByName('S_VNE').AsFloat;
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11]:=FIB.pFIBQuery.FieldByName('S_GN').AsFloat;
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,12]:=FIB.pFIBQuery.FieldByName('S_NIS').AsFloat;
                  end;
               FIB.pFIBQuery.Next;
          end;
     except
           ShowMessage('Ошибка выполнения запроса списка больничных');
     end;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.Transaction.Commit;
     ShowTable;
end;

procedure PrintBolnList(ShifrIdBoln:integer);
var E,WB,XLS,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    Tabno : integer;
    Cnt,CntMonth:integer;
    WantedMonth,WantedYear:integer;
begin
     if ShifrIdBoln<1 then
        begin
             ShowMessage('Неверно указан больничный лист');
             Exit;
        end;
     FName:=TemplateDIR+'BolList.xls';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add(' select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,Nomer_B,Procent,MEAN_DAY,NAL_CODE,SHIFR_STA,YEAR_VY,MONTH_VY from boln');
     FIB.pFIBQuery.SQL.Add(' where ShifrId='+IntToStr(ShifrIdBoln));
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     try
        FIB.pFIBQuery.ExecQuery;
        Tabno:=FIB.pFIBQuery.FieldByName('TABNO').AsInteger;
        ExRow:=16;
        E.WorkBooks[1].WorkSheets[1].Cells[2,4]:=FIB.pFIBQuery.FieldByName('NOMER_B').AsString;
        E.WorkBooks[1].WorkSheets[1].Cells[3,3]:=FIB.pFIBQuery.FieldByName('FIO').AsString;
        E.WorkBooks[1].WorkSheets[1].Cells[3,5]:=FIB.pFIBQuery.FieldByName('TABNO').AsInteger;
        E.WorkBooks[1].WorkSheets[1].Cells[3,8]:=FIB.pFIBQuery.FieldByName('NAL_CODE').AsString;
        E.WorkBooks[1].WorkSheets[1].Cells[4,3]:=DateToStr(FIB.pFIBQuery.FieldByName('F_DATA').AsDate);
        E.WorkBooks[1].WorkSheets[1].Cells[4,5]:=DateToStr(FIB.pFIBQuery.FieldByName('L_DATA').AsDate);
        E.WorkBooks[1].WorkSheets[1].Cells[4,8]:=FIB.pFIBQuery.FieldByName('K_WO_DAY').AsFloat;
        E.WorkBooks[1].WorkSheets[1].Cells[5,3]:=FIB.pFIBQuery.FieldByName('PROCENT').AsFloat;
        E.WorkBooks[1].WorkSheets[1].Cells[6,3]:=IntToStr(FIB.pFIBQuery.FieldByName('SHIFR_STA').AsInteger)+' '+trim(ShifrList.GetName(FIB.pFIBQuery.FieldByName('SHIFR_STA').AsInteger));
        E.WorkBooks[1].WorkSheets[1].Cells[7,3]:=FIB.pFIBQuery.FieldByName('MEAN_DAY').AsFloat;
        WantedMonth:=FIB.pFIBQuery.FieldByName('MONTH_VY').AsInteger;
        WantedYear:=FIB.pFIBQuery.FieldByName('YEAR_VY').AsInteger;

{        if not FIB.pFIBTransactionSecond.Active then
           FIB.pFIBTransactionSecond.StartTransaction;
}
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add('select first 1 oklad,shifrkat from person a');
        FIB.pFIBQuerySecond.SQL.Add(' where a.tabno='+IntToStr(Tabno)+' and');
        FIB.pFIBQuerySecond.SQL.Add(' a.yearvy*12+a.monthvy <= '+IntToStr(WantedYear*12+WantedMonth)+' and');
        FIB.pFIBQuerySecond.SQL.Add(' a.w_r=1');
        FIB.pFIBQuerySecond.SQL.Add(' order by a.yearvy desc, a.monthvy desc');
        try
           FIB.pFIBQuerySecond.ExecQuery;
           E.WorkBooks[1].WorkSheets[1].Cells[6,7]:=FIB.pFIBQuerySecond.FieldByName('OKLAD').AsFloat;
           E.WorkBooks[1].WorkSheets[1].Cells[5,5]:=GET_KAT_NAME(FIB.pFIBQuerySecond.FieldByName('SHIFRKAT').AsInteger);
        except
           ShowMessage('Ошибка запроса оклада и категории работника');
        end;
        FIB.pFIBQuerySecond.Close;
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(' select MONTH_ZA,B_DAY,SUMMA_B_BUD,SUMMA_B_VNE,SUMMA_B_GN,SUMMA_B_NIS from BOLN_RES');
        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
        FIB.pFIBQuerySecond.SQL.Add(' order by YEAR_ZA,MONTH_ZA');
        try
           ExRow := 10;
           FIB.pFIBQuerySecond.ExecQuery;
           while not FIB.pFIBQuerySecond.Eof do
             begin
                  inc(ExRow);
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=Trim(GetMonthRus(FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger));
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=FIB.pFIBQuerySecond.FieldByName('B_DAY').AsInteger;
                  if abs(FIB.pFIBQuerySecond.Fields[2].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]  := FIB.pFIBQuerySecond.Fields[2].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[3].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10] := FIB.pFIBQuerySecond.Fields[3].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[4].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11] := FIB.pFIBQuerySecond.Fields[4].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[5].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,12] := FIB.pFIBQuerySecond.Fields[5].AsFloat;
                  FIB.pFIBQuerySecond.Next;
             end;
           if FIB.pFIBQuerySecond.Open then
           FIB.pFIBQuerySecond.Close;
        except
           ShowMessage('Ошибка выполнения запроса параметров больничного листка');
           exit;
        end;

        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(' select MONTH_ZA,DAYS,SUMMA_BUD,SUMMA_VNE+SUMMA_GN+SUMMA_NIS,SEL from BOLN_SUMMY');
        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
        FIB.pFIBQuerySecond.SQL.Add(' and SEL>0');
        FIB.pFIBQuerySecond.SQL.Add(' order by YEAR_ZA DESC,MONTH_ZA DESC');
        try
           ExRow := 9;
           FIB.pFIBQuerySecond.ExecQuery;
           while not FIB.pFIBQuerySecond.Eof do
             begin
                  Inc(ExRow);
                  if FIB.pFIBQuerySecond.FieldByName('SEL').AsInteger>0 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:='+';
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=Trim(GetMonthRus(FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsINTEGER));
                  if abs(FIB.pFIBQuerySecond.Fields[2].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=FIB.pFIBQuerySecond.Fields[2].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[3].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=FIB.pFIBQuerySecond.Fields[3].AsFloat;
                  if FIB.pFIBQuerySecond.FieldByName('DAYS').AsINTEGER>0 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=FIB.pFIBQuerySecond.FieldByName('DAYS').AsInteger;
                  FIB.pFIBQuerySecond.Next;
             end;
           if FIB.pFIBQuerySecond.Open then
              FIB.pFIBQuerySecond.Close;
        except
              ShowMessage('Ошибка выполнения запроса исходных данных больничного листка');
              exit;
        end;
     except
        ShowMessage('Ошибка выполнения запроса параметров больничного листка');
     end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
{
     if FIB.pFIBTransactionSecond.Active then
        FIB.pFIBTransactionSecond.Commit;
}        

end;


procedure PrintBolnListM(ShifrIdBoln:integer);
 const F2='######0.00';
 const F4='######0.0000';

var E,WB,XLS,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    Tabno : integer;
    Cnt,CntMonth:integer;
    WantedMonth,WantedYear:integer;
    Procent,Mean_Day : real;
    ShifrSta:integer;
    I_Count:integer;
    Mode_Ill : integer;
    limitMonth : integer;
    SQLStmnt:string;
    v:Variant;
    shifrKat,shifrGru:Integer;
    dolg:string;
    oklad:Real;
    shifrPod:integer;
    FIO:string;
    monName : string;
begin
     limitMonth:=12;  // c 01 11 2020 расчет за 12 мес.
     if isSVDN then
       limitMonth:=12;
     if ShifrIdBoln<1 then
        begin
             ShowMessage('Неверно указан больничный лист');
             Exit;
        end;
         //                      0     1    2      3       4           5      6        7       8       9     10         11       12       13       14      15
     SQLStmnt:=' select first 1 tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,Nomer_B,Procent,MEAN_DAY,NAL_CODE,SHIFR_STA,YEAR_VY,MONTH_VY,MODE_ILL from boln';
     SQLStmnt:=trim(SQLSTmnt)+' where ShifrId='+IntToStr(ShifrIdBoln);
//     v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
     v:=SQLQueryRecValues(SQLStmnt);
     if not VarIsArray(v) then
        begin
             ShowMessage('Не найден больничый лист в БД');
             Exit;
        end;

     FName:=TemplateDIR+'BolListM.xlt';
     if isSVDN then
        FName:=TemplateDIR+'BolListM_SV.xlt';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     Tabno:=v[0];

     ExRow:=16;
     if isSVDN then
        begin
             E.WorkBooks[1].WorkSheets[1].Cells[2,1]:='Номер лікарняного лістку '+trim(getVariantString(v[8])); //'NOMER_B';
             E.WorkBooks[1].WorkSheets[1].Cells[3,1]:='Співробітник '+trim(getVariantString(v[1])) +// trim(FIB.pFIBQuery.FieldByName('FIO').AsString) +
                   '     т.н.'+trim(IntToStr(getVariantInteger(v[0])))+
                   '     ідентіф.код'+trim(getVariantString(v[11]));
             E.WorkBooks[1].WorkSheets[1].Cells[4,1]:='Лікарняний з '+DateToStr(getVariantDate(v[2])) +
                   ' по ' + DateToStr(getVariantDate(v[3])) +
                   '      тривалість '+trim(IntToStr(getVariantInteger(v[4])))+' днів';
        end
     else
        begin
             E.WorkBooks[1].WorkSheets[1].Cells[2,1]:='Номер больничного листка '+trim(getVariantString(v[8])); //'NOMER_B';
             if tabno>0 then
                FIO:=GetFullRusFioPerson(tabno)
             else
                fio:=getVariantString(v[1]);
             E.WorkBooks[1].WorkSheets[1].Cells[3,1]:='Сотрудник '+trim(fio) +// trim(FIB.pFIBQuery.FieldByName('FIO').AsString) +
                   '     т.н.'+trim(IntToStr(getVariantInteger(v[0])))+
                   '     идентиф.код'+trim(getVariantString(v[11]));
             E.WorkBooks[1].WorkSheets[1].Cells[4,1]:='Больничный с '+DateToStr(getVariantDate(v[2])) +
                   ' по ' + DateToStr(getVariantDate(v[3])) +
                   '      продолжительность '+trim(IntToStr(getVariantInteger(v[4])))+' дней';
        end ;

     Procent     := getVariantReal(v[9]);
     Mean_Day    := getVariantReal(v[10]);
     ShifrSta    := getVariantInteger(v[12]);
     WantedMonth := getVariantInteger(v[14]);
     WantedYear  := getVariantInteger(v[13]);
     Mode_Ill    := getVariantInteger(v[15]);


//---------------
(*  -- 1 ---
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add(' select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,Nomer_B,Procent,MEAN_DAY,NAL_CODE,SHIFR_STA,YEAR_VY,MONTH_VY,MODE_ILL from boln');
     FIB.pFIBQuery.SQL.Add(' where ShifrId='+IntToStr(ShifrIdBoln));
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     try
        FIB.pFIBQuery.ExecQuery;
        Tabno:=FIB.pFIBQuery.FieldByName('TABNO').AsInteger;
        ExRow:=16;
        E.WorkBooks[1].WorkSheets[1].Cells[2,1]:='Номер лікарняного лістку '+FIB.pFIBQuery.FieldByName('NOMER_B').AsString;
        E.WorkBooks[1].WorkSheets[1].Cells[3,1]:='Співробітник '+trim(FIB.pFIBQuery.FieldByName('FIO').AsString) +
                        '     т.н.'+trim(IntToStr(FIB.pFIBQuery.FieldByName('TABNO').AsInteger))                      +
                        '     ідентіф.код'+trim(FIB.pFIBQuery.FieldByName('NAL_CODE').AsString);
        E.WorkBooks[1].WorkSheets[1].Cells[4,1]:='Лікарняний з '+DateToStr(FIB.pFIBQuery.FieldByName('F_DATA').AsDate) +
                        ' по ' + DateToStr(FIB.pFIBQuery.FieldByName('L_DATA').AsDate) +
                        '      тривалість '+trim(IntToStr(FIB.pFIBQuery.FieldByName('K_WO_DAY').AsInteger))+' днів';
        Procent  :=  FIB.pFIBQuery.FieldByName('PROCENT').AsFloat;
        Mean_Day :=  FIB.pFIBQuery.FieldByName('MEAN_DAY').AsFloat;
        ShifrSta :=  FIB.pFIBQuery.FieldByName('SHIFR_STA').AsInteger;
   //     E.WorkBooks[1].WorkSheets[1].Cells[6,3]:=IntToStr(FIB.pFIBQuery.FieldByName('SHIFR_STA').AsInteger)+' '+trim(ShifrList.GetName(FIB.pFIBQuery.FieldByName('SHIFR_STA').AsInteger));
   //     E.WorkBooks[1].WorkSheets[1].Cells[7,3]:=FIB.pFIBQuery.FieldByName('MEAN_DAY').AsFloat;
        WantedMonth:=FIB.pFIBQuery.FieldByName('MONTH_VY').AsInteger;
        WantedYear:=FIB.pFIBQuery.FieldByName('YEAR_VY').AsInteger;
        Mode_Ill:=FIB.pFIBQuery.FieldByName('MODE_ILL').AsInteger;

{        if not FIB.pFIBTransactionSecond.Active then
           FIB.pFIBTransactionSecond.StartTransaction;
}
*)
(* --- 2 ---
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add('select first 1 oklad,shifrkat,dolg,w_place from person a');
        FIB.pFIBQuerySecond.SQL.Add(' where a.tabno='+IntToStr(Tabno)+' and');
        FIB.pFIBQuerySecond.SQL.Add(' a.yearvy*12+a.monthvy <= '+IntToStr(WantedYear*12+WantedMonth)+' and');
        FIB.pFIBQuerySecond.SQL.Add(' a.w_r=1');
        FIB.pFIBQuerySecond.SQL.Add(' order by a.yearvy desc, a.monthvy desc');
        try
           FIB.pFIBQuerySecond.ExecQuery;
           E.WorkBooks[1].WorkSheets[1].Cells[5,1]:='Процент '+FloatToStr(Procent)+'%.      Категорія '+trim(GET_KAT_NAME(FIB.pFIBQuerySecond.FieldByName('SHIFRKAT').AsInteger))+
                          '     Посада '+trim(FIB.pFIBQuerySecond.FieldByName('DOLG').AsString);
           E.WorkBooks[1].WorkSheets[1].Cells[6,1]:='Стаття '+IntToStr(ShifrSta)+' '+trim(ShifrList.GetName(ShifrSta))+
                          '     Оклад '+FormatFloat(F2,FIB.pFIBQuerySecond.FieldByName('OKLAD').AsFloat)+getShortCurrencyName;
           E.WorkBooks[1].WorkSheets[1].Cells[7,1]:='Середня денна з/п '+FormatFloat(F4,Mean_Day)+getShortCurrencyName+
                           '    Підрозділ '+Name_Serv(FIB.pFIBQuerySecond.FieldByName('w_place').AsInteger);
        except
           ShowMessage('Ошибка запроса оклада и категории работника');
        end;
        FIB.pFIBQuerySecond.Close;
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(' select MONTH_ZA,B_DAY,SUMMA_B_BUD,SUMMA_B_VNE,SUMMA_B_GN,SUMMA_B_NIS,SHIFRSTA from BOLN_RES');
        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
        FIB.pFIBQuerySecond.SQL.Add(' order by YEAR_ZA,MONTH_ZA');
        try
           ExRow := 9;
           FIB.pFIBQuerySecond.ExecQuery;
           I_Count:=0;
           while not FIB.pFIBQuerySecond.Eof do
             begin
                  inc(i_Count);
                  if i_Count>limitMonth then break;
                  inc(ExRow);
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=Trim(GetMonthShortUkr(FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger));
//                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger;
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=FIB.pFIBQuerySecond.FieldByName('B_DAY').AsInteger;
                  if abs(FIB.pFIBQuerySecond.Fields[2].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]  := FIB.pFIBQuerySecond.Fields[2].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[3].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10] := FIB.pFIBQuerySecond.Fields[3].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[4].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11] := FIB.pFIBQuerySecond.Fields[4].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[5].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,12] := FIB.pFIBQuerySecond.Fields[5].AsFloat;
                  if FIB.pFIBQuerySecond.FieldByName('SHIFRSTA').AsInteger=12 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13] := 'ФМП'
                  else
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13] := 'ФСС';

                  FIB.pFIBQuerySecond.Next;
             end;
           if FIB.pFIBQuerySecond.Open then
           FIB.pFIBQuerySecond.Close;
        except
           ShowMessage('Ошибка выполнения запроса параметров больничного листка');
           exit;
        end;

*)
                              //    0      1       2     3
        SQLStmnt:='select first 1 oklad,shifrkat,dolg,w_place from person a';
        SQLStmnt:=trim(SQLStmnt)+' where a.tabno='+IntToStr(Tabno)+' and';
        SQLStmnt:=trim(SQLStmnt)+' a.yearvy*12+a.monthvy <= '+IntToStr(WantedYear*12+WantedMonth)+' and';
        SQLStmnt:=trim(SQLStmnt)+' a.w_r=1';
        SQLStmnt:=trim(SQLStmnt)+' order by a.yearvy desc, a.monthvy desc';
        v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
        if not VarIsArray(v) then
           begin
                ShowMessage('Ошибка запроса оклада и категории работника');
           end
        else
           begin
                if VarIsNull(v[1]) then shifrKat:=0
                else shifrKat:=v[1];
                if VarIsNull(v[2]) then dolg:=''
                else dolg:=v[2];
                if VarIsNull(v[0]) then oklad:=0
                else oklad:=v[0];
                if VarIsNull(v[3]) then shifrPod:=0
                else shifrPod:=v[3];
                if isSVDN then
                   begin
                        E.WorkBooks[1].WorkSheets[1].Cells[5,1]:='Процент '+FloatToStr(Procent)+'%.      Категорія '+trim(GET_KAT_NAME(shifrKat))+
                          '     Посада '+dolg;
                        E.WorkBooks[1].WorkSheets[1].Cells[6,1]:='Стаття '+IntToStr(ShifrSta)+' '+trim(ShifrList.GetName(ShifrSta))+
                          '     Оклад '+FormatFloat(F2,oklad)+getShortCurrencyName;
                        E.WorkBooks[1].WorkSheets[1].Cells[7,1]:='Середня денна з/п '+FormatFloat(F4,Mean_Day)+getShortCurrencyName+
                           '    Підрозділ '+Name_Serv(shifrPod);
                   end
                else
                   begin
                        E.WorkBooks[1].WorkSheets[1].Cells[5,1]:='Процент '+FloatToStr(Procent)+'%.      Категория '+trim(GET_KAT_NAME(shifrKat))+
                          '     Должность '+dolg;
                        E.WorkBooks[1].WorkSheets[1].Cells[6,1]:='Стаття '+IntToStr(ShifrSta)+' '+trim(ShifrList.GetName(ShifrSta))+
                          '     Оклад '+FormatFloat(F2,oklad)+getShortCurrencyName;
                        E.WorkBooks[1].WorkSheets[1].Cells[7,1]:='Среднедневная з/п '+FormatFloat(F4,Mean_Day)+getShortCurrencyName+
                           '    Подразделение '+Name_Serv(shifrPod);
                   end;

           end;

        if not FIB.pFIBQuerySecond.Transaction.Active  then
           FIB.pFIBQuerySecond.Transaction.StartTransaction;
        FIB.pFIBQuerySecond.Close;
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(' select MONTH_ZA,B_DAY,SUMMA_B_BUD,SUMMA_B_VNE,SUMMA_B_GN,SUMMA_B_NIS,SHIFRSTA from BOLN_RES');
      //  FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(ShifrIdBoln));
        FIB.pFIBQuerySecond.SQL.Add(' order by YEAR_ZA,MONTH_ZA');
        try
           ExRow := 9;
           FIB.pFIBQuerySecond.ExecQuery;
           I_Count:=0;
           while not FIB.pFIBQuerySecond.Eof do
             begin
                  inc(i_Count);
                  if i_Count>limitMonth then break;
                  inc(ExRow);
                  if isSVDN then
                     monName:=Trim(GetMonthShortUkr(FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger))
                  else
                     monName:=Trim(GetMonthShortRus(FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger));
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=Trim(monName);
//                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger;
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=FIB.pFIBQuerySecond.FieldByName('B_DAY').AsInteger;
                  if abs(FIB.pFIBQuerySecond.Fields[2].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]  := FIB.pFIBQuerySecond.Fields[2].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[3].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10] := FIB.pFIBQuerySecond.Fields[3].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[4].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11] := FIB.pFIBQuerySecond.Fields[4].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[5].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,12] := FIB.pFIBQuerySecond.Fields[5].AsFloat;
                  if FIB.pFIBQuerySecond.FieldByName('SHIFRSTA').AsInteger=12 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13] := 'ФМП'
                  else
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13] := 'ФСС';

                  FIB.pFIBQuerySecond.Next;
             end;
           if FIB.pFIBQuerySecond.Open then
           FIB.pFIBQuerySecond.Close;
        except
           ShowMessage('Ошибка выполнения запроса параметров больничного листка');
           exit;
        end;






        FIB.pFIBQuerySecond.SQL.Clear;
        if isLNR then
           FIB.pFIBQuerySecond.SQL.Add(' select MONTH_ZA,DAYS,SUMMA_BUD,SUMMA_VNE,SUMMA_GN,SUMMA_NIS,SEL,GRAPHIC_DAY,DAY_KALEND_WORK from BOLN_SUMMY')
        else
          FIB.pFIBQuerySecond.SQL.Add(' select MONTH_ZA,DAYS,SUMMA_BUD,SUMMA_VNE,SUMMA_GN,SUMMA_NIS,SEL,GRAPHIC_DAY from BOLN_SUMMY');
//        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(ShifrIdBoln));
        FIB.pFIBQuerySecond.SQL.Add(' and SEL>0');
        FIB.pFIBQuerySecond.SQL.Add(' order by YEAR_ZA DESC,MONTH_ZA DESC');
        try
           ExRow := 9;
           FIB.pFIBQuerySecond.ExecQuery;
           I_Count:=0;
           while not FIB.pFIBQuerySecond.Eof do
             begin
                  Inc(i_Count);
                  if i_Count>limitMonth then break;
                  Inc(ExRow);
 //                 if FIB.pFIBQuerySecond.FieldByName('SEL').AsInteger>0 then
 //                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:='+';
                   if isSVDN then
                     monName:=Trim(GetMonthShortUkr(FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger))
                  else
                     monName:=Trim(GetMonthShortRus(FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger));
                 E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=Trim(monName);
 //                 E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger;
                  if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_BUD').AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=FIB.pFIBQuerySecond.FieldByName('Summa_Bud').AsFloat;
                  if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_VNE').AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=FIB.pFIBQuerySecond.FieldByName('Summa_Vne').AsFloat;
                  if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_GN').AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=FIB.pFIBQuerySecond.FieldByName('Summa_GN').AsFloat;
                  if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_NIS').AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=FIB.pFIBQuerySecond.FieldByName('Summa_NIS').AsFloat;
                  if Mode_Ill=1 then  // Декретныее
                     if FIB.pFIBQuerySecond.FieldByName('GRAPHIC_DAY').AsINTEGER>0 then
                        E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=FIB.pFIBQuerySecond.FieldByName('GRAPHIC_DAY').AsInteger
                     else
                  else  // Обычные
                     if isLNR  then
                        if (((NMES>11) and (curryear=2016)) or (curryear>2015))  then
                           begin
                             if FIB.pFIBQuerySecond.FieldByName('DAY_KALEND_WORK').AsINTEGER>0 then
                                E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=FIB.pFIBQuerySecond.FieldByName('DAY_KALEND_WORK').AsInteger
                             else
                                E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=0
                           end
                        else
                            begin
                              if FIB.pFIBQuerySecond.FieldByName('DAYS').AsINTEGER>0 then
                                 E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=FIB.pFIBQuerySecond.FieldByName('DAYS').AsInteger
                              else
                                 E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=0
                            end
                     else  // SVDDN
                        if FIB.pFIBQuerySecond.FieldByName('GRAPHIC_DAY').AsINTEGER>0 then
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=FIB.pFIBQuerySecond.FieldByName('GRAPHIC_DAY').AsInteger
                        else
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=0;
                  // Конец SVDN
                  FIB.pFIBQuerySecond.Next;
             end;
           if FIB.pFIBQuerySecond.Open then
              FIB.pFIBQuerySecond.Close;
        except
              ShowMessage('Ошибка выполнения запроса исходных данных больничного листка');
              exit;
        end;
   //  except
   //     ShowMessage('Ошибка выполнения запроса параметров больничного листка');
   //  end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     if FIB.pFIBQuerySecond.Transaction.Active then
        FIB.pFIBQuerySecond.Transaction.Commit;
{
     if FIB.pFIBTransactionSecond.Active then
        FIB.pFIBTransactionSecond.Commit;
}

end;



procedure TFormBoln.dxDBGrid1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  Value: Variant;
  i:integer;
begin
  if ANode.HasChildren then
    Exit;
  //if not ASelected and (AColumn = dxDBGrid2PaymentAmount) then
  if not ASelected then
  begin
     i := TdxDBGrid(Sender).ColumnByFieldName('MODE_ILL').Index;
     Value := ANode.Values[i];
     if not VarIsNull(Value) then
        begin
             if Value=1 then
                AColor := clYellow
             else if Value=2 then
                AColor := clInactiveCaptionText;
        end;
  end;

end;
procedure PrintBolnListN(ShifrIdBoln:integer);
 const F2='######0.00';
       F4='######0.0000';

var E,WB,XLS,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    Tabno,I : integer;
    Cnt,CntMonth:integer;
    WantedMonth,WantedYear:integer;
    ShifrSta : integer;
    Summa_B_Bud,Summa_B_Vne,Summa_B_GN,Summa_B_Nis,Summa:real;
begin
     if ShifrIdBoln<1 then
        begin
             ShowMessage('Неверно указан больничный лист');
             Exit;
        end;
     FName:=TemplateDIR+'BolListN.xls';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add(' select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,Nomer_B,Procent,MEAN_DAY,NAL_CODE,SHIFR_STA,YEAR_VY,MONTH_VY from boln');
     FIB.pFIBQuery.SQL.Add(' where ShifrId='+IntToStr(ShifrIdBoln));
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     try
        FIB.pFIBQuery.ExecQuery;
        Tabno    := FIB.pFIBQuery.FieldByName('TABNO').AsInteger;
        ShifrSta := FIB.pFIBQuery.FieldByName('SHIFR_STA').AsInteger;

        WantedMonth:=FIB.pFIBQuery.FieldByName('MONTH_VY').AsInteger;
        WantedYear:=FIB.pFIBQuery.FieldByName('YEAR_VY').AsInteger;
        E.WorkBooks[1].WorkSheets[1].Cells[4,1]:='Звітна дата '+Trim(GetMonthUkr(WantedMonth))+' '+IntToStr(WantedYear)+' р.';
        E.WorkBooks[1].WorkSheets[1].Cells[ 7,1] := FIB.pFIBQuery.FieldByName('FIO').AsString;
        E.WorkBooks[1].WorkSheets[1].Cells[ 8,1] := 'Таб.номер '+IntToStr(FIB.pFIBQuery.FieldByName('TABNO').AsInteger);
        E.WorkBooks[1].WorkSheets[1].Cells[11,1] := 'Лікарняний ліст № '+FIB.pFIBQuery.FieldByName('NOMER_B').AsString;
        if ShifrSta=32 then
           E.WorkBooks[1].WorkSheets[1].Cells[12,1]:='Код захворювання 2 - Декретний лікарняний'
        else
           E.WorkBooks[1].WorkSheets[1].Cells[12,1]:='Код захворювання 1 - загальне захворювання';
        E.WorkBooks[1].WorkSheets[1].Cells[22,1] := 'Процент оплати '+FloatToStr(FIB.pFIBQuery.FieldByName('PROCENT').AsFloat)+'%';
        E.WorkBooks[1].WorkSheets[1].Cells[23,1] := 'Середній заробіток у день '+FormatFloat(F4,FIB.pFIBQuery.FieldByName('MEAN_DAY').AsFloat)+' '+getShortCurrencyName;

        E.WorkBooks[1].WorkSheets[1].Cells[24,1] := 'Ітого к оплаті по лікарняному '+FormatFloat(F2,FIB.pFIBQuery.FieldByName('Summa_Bol').AsFloat)+' '+getShortCurrencyName;

{        if not FIB.pFIBTransactionSecond.Active then
           FIB.pFIBTransactionSecond.StartTransaction;
}
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add('select first 1 oklad,shifrkat,dolg,w_place from person a');
        FIB.pFIBQuerySecond.SQL.Add(' where a.tabno='+IntToStr(Tabno)+' and');
        FIB.pFIBQuerySecond.SQL.Add(' a.yearvy*12+a.monthvy <= '+IntToStr(WantedYear*12+WantedMonth)+' and');
        FIB.pFIBQuerySecond.SQL.Add(' a.w_r=1');
        FIB.pFIBQuerySecond.SQL.Add(' order by a.yearvy desc, a.monthvy desc');
        try
           FIB.pFIBQuerySecond.ExecQuery;
           E.WorkBooks[1].WorkSheets[1].Cells[10,1]:='Професія '+trim(FIB.pFIBQuerySecond.FieldByName('dolg').AsString);
           E.WorkBooks[1].WorkSheets[1].Cells[9,1]:='Підрозділ '+trim(Name_Serv(FIB.pFIBQuerySecond.FieldByName('W_Place').AsInteger));
        except
           ShowMessage('Ошибка запроса оклада и категории работника');
        end;
        FIB.pFIBQuerySecond.Close;
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(' select MONTH_ZA,B_DAY,SUMMA_B_BUD,SUMMA_B_VNE,SUMMA_B_GN,SUMMA_B_NIS,SHIFRSTA,YEAR_ZA from BOLN_RES');
        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
        FIB.pFIBQuerySecond.SQL.Add(' order by YEAR_ZA,MONTH_ZA');
        try
           ExRow := 26;
           FIB.pFIBQuerySecond.ExecQuery;
           while not FIB.pFIBQuerySecond.Eof do
             begin
                  Summa_B_Bud := FIB.pFIBQuerySecond.FieldByName('SUMMA_B_BUD').AsFloat;
                  Summa_B_Vne := FIB.pFIBQuerySecond.FieldByName('SUMMA_B_VNE').AsFloat;
                  Summa_B_GN  := FIB.pFIBQuerySecond.FieldByName('SUMMA_B_GN').AsFloat;
                  Summa_B_NIS := FIB.pFIBQuerySecond.FieldByName('SUMMA_B_NIS').AsFloat;
                  ShifrSta    := FIB.pFIBQuerySecond.FieldByName('SHIFRSTA').AsInteger;
                  for i:=1 to 4 do
                      begin
                           if ((i=1) and (abs(Summa_B_bud)<0.01)) then continue;
                           if ((i=2) and (abs(Summa_B_Vne)<0.01)) then continue;
                           if ((i=3) and (abs(Summa_B_GN)<0.01))  then continue;
                           if ((i=4) and (abs(Summa_B_NIS)<0.01)) then continue;

                           inc(ExRow);
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger;
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=FIB.pFIBQuerySecond.FieldByName('YEAR_ZA').AsInteger;
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=SHIFRSTA;
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=FIB.pFIBQuerySecond.FieldByName('B_DAY').AsInteger;
                            case i of
                             1 : begin S:='Бюд'; Summa:=Summa_B_Bud; end;
                             2 : begin S:='Вне'; Summa:=Summa_B_Vne; end;
                             3 : begin S:='ГН';  Summa:=Summa_B_GN;  end;
                             4 : begin S:='НИС'; Summa:=Summa_B_NIS; end;
                            end;
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]  := trim(s);
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]  := Summa;
                            if ShifrSta=12 then
                               S:='Оплата л/л з ФЗП'
                            else
                               S:='лікарняні з ФСС';
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]  := trim(s);
                      end;
                  FIB.pFIBQuerySecond.Next;
             end;
           if FIB.pFIBQuerySecond.Open then
           FIB.pFIBQuerySecond.Close;
        except
           ShowMessage('Ошибка выполнения запроса параметров больничного листка');
           exit;
        end;

        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(' select MONTH_ZA,DAYS,SUMMA_BUD,SUMMA_VNE+SUMMA_GN+SUMMA_NIS,SEL,SUMMA_BUD+SUMMA_VNE+SUMMA_GN+SUMMA_NIS,YEAR_ZA from BOLN_SUMMY');
        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
        FIB.pFIBQuerySecond.SQL.Add(' and SEL>0');
        FIB.pFIBQuerySecond.SQL.Add(' order by YEAR_ZA DESC,MONTH_ZA DESC');
        try
           ExRow := 13;
           FIB.pFIBQuerySecond.ExecQuery;
           while not FIB.pFIBQuerySecond.Eof do
             begin
                  Inc(ExRow);
     //             if FIB.pFIBQuerySecond.FieldByName('SEL').AsInteger>0 then
     //                E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:='+';
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger;
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=FIB.pFIBQuerySecond.FieldByName('YEAR_ZA').AsInteger;
                  if FIB.pFIBQuerySecond.FieldByName('DAYS').AsINTEGER>0 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=FIB.pFIBQuerySecond.FieldByName('DAYS').AsInteger;
                  if abs(FIB.pFIBQuerySecond.Fields[4].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=FIB.pFIBQuerySecond.Fields[5].AsFloat;
                  FIB.pFIBQuerySecond.Next;
             end;
           if FIB.pFIBQuerySecond.Open then
              FIB.pFIBQuerySecond.Close;
        except
              ShowMessage('Ошибка выполнения запроса исходных данных больничного листка');
              exit;
        end;
     except
        ShowMessage('Ошибка выполнения запроса параметров больничного листка');
     end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
{
     if FIB.pFIBTransactionSecond.Active then
        FIB.pFIBTransactionSecond.Commit;
}

end;


procedure TFormBoln.N4Click(Sender: TObject);
var ShifrIdBoln:integer;
begin
 ShifrIdBoln:=SELF.pFIBDataSetBoln.FieldByName('SHIFRID').AsInteger;
     PrintBolnListN(ShifrIdBoln);
  ShowTable;
     if ShifrIdBoln>0 then
        SELF.pFIBDataSetBoln.Locate('ShifrId',ShifrIdBoln,[loPartialKey]);

end;

procedure TFormBoln.N6Click(Sender: TObject);
begin
     PrintReestrBoln(0);
end;

procedure TFormBoln.N7Click(Sender: TObject);
begin
     Application.CreateForm(TFormSelBay, FormSelBay);
     FormSelBay.ShowModal;
end;

procedure TFormBoln.N8Click(Sender: TObject);
begin
     FormWait.Show;
     Application.ProcessMessages;
     if pFIBDataSetBolnUchSwod.Active then
        pFIBDataSetBolnUchSwod.Active:=false;
     if pFIBDataSetBolnUchSwod.Transaction.Active then
        pFIBDataSetBolnUchSwod.Transaction.Commit;
     pFIBDataSetBolnUchSwod.Params[0].AsString:=IntToStr(Self.WantedYear);
     pFIBDataSetBolnUchSwod.Params[1].AsString:=IntToStr(WantedMonth);
     pFIBDataSetBolnUchSwod.Prepare;
     if not pFIBDataSetBolnUchSwod.Transaction.Active then
        pFIBDataSetBolnUchSwod.Transaction.StartTransaction;
     pFIBDataSetBolnUchSwod.Open;
     FormWait.Hide;
     frxReport1.ShowReport;
     pFIBDataSetBolnUchSwod.Close;
     pFIBDataSetBolnUchSwod.Transaction.Commit;
end;

procedure TFormBoln.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if VarName='y' then Value:=IntToStr(Self.WantedYear)
     else if VarName='m' then Value:=GetMontHRus(WantedMonth);
end;

procedure TFormBoln.frxReport2ManualBuild(Page: TfrxPage);
 var ShifrIdBoln : integer;
     i,j,k:integer;
begin
{
     ShifrIdBoln:=SELF.pFIBDataSetBoln.FieldByName('SHIFRID').AsInteger;
     PrintBolnFR(ShifrIdBoln);
}
  if dxDBGrid1.SelectedCount>0 then
    with dxDBGrid1.DataSource.DataSet do
      for i:=0 to dxDBGrid1.SelectedCount-1 do
      begin
{           GotoBookmark(pointer(dxDBGridPodr.SelectedRows.Items[i]));}
{           j:=Fields[0].AsInteger;}
           val(dxDBGrid1.SelectedNodes[i].Strings[7],j,k);
           if k=0 then
               if j>0 then
                  PrintBolnFR(j);
           if i mod 2 = 1 then
              frxReport2.Engine.NewPage;

      end;

end;

procedure TFormBoln.PrintBolnFR(ShifrIdBoln:integer);
 var Tabno    : integer;
     Nomer_B  : string;
     Fio      : string;
     Nal_Code : string;
     F_DataS  : string;
     L_DataS  : string;
     KwoDay   : real;
     Procent  : real;
     NameSta  : string;
     MeanDay  : real;
     WantedMonth : integer;
     WantedYear  : integer;
     Oklad    : real;
     ShifrKat : integer;
     ShifrGru : integer;
     NameKat  : string;
     Posada   : string;
     NamePodr : string;
     I_Count,Days,DaySTot  : integer;
     SummaBud,SummaVne,SummaGN,SummaNIS:real;
     SummaBudTot,SummaVneTot,SummaGNTot,SummaNISTot:real;
     NameMon : string;
     ShifrSta : integer;
     Mode_Ill : integer;
  procedure PrintHat;
   var S:string;
       i:integer;
   begin
        for i:=1 to 5 do
            frxReport2.Engine.ShowBand(frxReport2.FindObject('MasterDataEmpty') as TfrxMasterData);

        s:='Номер лікарняного лістку '+Nomer_B;
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport2.Variables['s1']:=''''+s+'''';
        s:='Співробітник '+Trim(Fio)+' т.н. '+IntToStr(Tabno)+' ІНН '+trim(Nal_Code);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport2.Variables['s2']:=''''+s+'''';
        s:='Лікарняний э '+trim(F_DataS)+' по '+trim(L_DataS)+' тривалість '+trim(format('%5.0f',[KwoDay]))+' днів';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport2.Variables['s3']:=''''+s+'''';
        s:='Процент '+trim(format('%5.0f',[Procent]))+' Категорія '+trim(NameKat)+' Посада '+trim(Posada);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport2.Variables['s4']:=''''+s+'''';
        s:='Стаття '+trim(NameSta)+' Оклад '+trim(format('%12.2f',[Oklad]))+' '+getShortCurrencyName;
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport2.Variables['s5']:=''''+s+'''';
        s:='Середня дена з/п '+trim(format('%12.4f',[MeanDay]))+' '+getShortCurrencyName+' Підрозділ '+trim(NamePodr);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport2.Variables['s6']:=''''+s+'''';
        frxReport2.Engine.ShowBand(frxReport2.FindObject('MasterData1') as TfrxMasterData);
   end;
  procedure PrintDetSum;
   var s:string;
   begin
        S:=trim(NameMon);
        frxReport2.Variables['m']:=''''+s+'''';
        S:=FORMAT('%3d',[Days]);
        s:=ReplQuot(s);
        frxReport2.Variables['days']:=''''+s+'''';
        s:='';
        if abs(SummaBud)>0.002 then
           S:=FORMAT('%10.2f',[SummaBud]);
        frxReport2.Variables['summabud']:=''''+s+'''';
        s:='';
        if abs(SummaVne)>0.002 then
           S:=FORMAT('%10.2f',[SummaVne]);
        frxReport2.Variables['summavne']:=''''+s+'''';
        s:='';
        if abs(SummaGn)>0.002 then
           S:=FORMAT('%10.2f',[SummaGN]);
        frxReport2.Variables['summagn']:=''''+s+'''';
        if abs(SummaNIS)>0.002 then
           S:=FORMAT('%10.2f',[SummaNIS]);
        frxReport2.Variables['summanis']:=''''+s+'''';
        s:='';
        if shifrsta>0 then
           if ShifrSta=12 then s:='ФМП'
                          else s:='ФСС';
        frxReport2.Variables['fond']:=''''+s+'''';
        frxReport2.Engine.ShowBand(frxReport2.FindObject('MasterDataSum') as TfrxMasterData);

   end;
  procedure PrintDetSumRazom;
   var s:string;
   begin
        S:='Рзм';
        frxReport2.Variables['m']:=''''+s+'''';
        S:=FORMAT('%3d',[DaysTot]);
        s:=ReplQuot(s);
        frxReport2.Variables['days']:=''''+s+'''';
        s:='';
        if abs(SummaBudTot)>0.002 then
           S:=FORMAT('%10.2f',[SummaBudTot]);
        frxReport2.Variables['summabud']:=''''+s+'''';
        s:='';
        if abs(SummaVneTot)>0.002 then
           S:=FORMAT('%10.2f',[SummaVneTot]);
        frxReport2.Variables['summavne']:=''''+s+'''';
        s:='';
        if abs(SummaGnTot)>0.002 then
           S:=FORMAT('%10.2f',[SummaGNTot]);
        frxReport2.Variables['summagn']:=''''+s+'''';
        if abs(SummaNISTot)>0.002 then
           S:=FORMAT('%10.2f',[SummaNISTot]);
        frxReport2.Variables['summanis']:=''''+s+'''';
        s:='';
        frxReport2.Variables['fond']:=''''+s+'''';
        frxReport2.Engine.ShowBand(frxReport2.FindObject('MasterDataSum') as TfrxMasterData);

   end;
  procedure PrintItg;
   var S : string;
       a : real;
   begin
        s:='Лікарняні разом ';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        a:=summabudtot+summavnetot+summanistot+summagntot;
        s:=s+trim(format('%12.2f',[a])+getShortCurrencyName);
        s:=ReplQuot(s);
        frxReport2.Variables['razom']:=''''+s+'''';
        frxReport2.Engine.ShowBand(frxReport2.FindObject('MasterDataItg') as TfrxMasterData);
   end;
 begin
     if pFIBQuerySecond.Open then
        pFIBQuerySecond.Close;
     if not pFIBQuerySecond.Transaction.Active then
        pFIBQuerySecond.Transaction.StartTransaction;

      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add(' select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,Nomer_B,Procent,MEAN_DAY,NAL_CODE,SHIFR_STA,YEAR_VY,MONTH_VY,MODE_ILL from boln');
      pFIBQuerySecond.SQL.Add(' where ShifrId='+IntToStr(ShifrIdBoln));
      pFIBQuerySecond.ExecQuery;
      Tabno    := pFIBQuerySecond.FieldByName('TABNO').AsInteger;
      Nomer_B  := pFIBQuerySecond.FieldByName('NOMER_B').AsString;
      Fio      := pFIBQuerySecond.FieldByName('FIO').AsString;
      Nal_Code := pFIBQuerySecond.FieldByName('NAL_CODE').AsString;
      F_DataS  := DateToStr(pFIBQuerySecond.FieldByName('F_DATA').AsDate);
      L_DataS  := DateToStr(pFIBQuerySecond.FieldByName('L_DATA').AsDate);
      KwoDay   := pFIBQuerySecond.FieldByName('K_WO_DAY').AsFloat;
      Procent  := pFIBQuerySecond.FieldByName('PROCENT').AsFloat;
      NameSta  := IntToStr(pFIBQuerySecond.FieldByName('SHIFR_STA').AsInteger)+' '+trim(ShifrList.GetName(pFIBQuerySecond.FieldByName('SHIFR_STA').AsInteger));
      MeanDay  := pFIBQuerySecond.FieldByName('MEAN_DAY').AsFloat;
      WantedMonth:=pFIBQuerySecond.FieldByName('MONTH_VY').AsInteger;
      WantedYear:=pFIBQuerySecond.FieldByName('YEAR_VY').AsInteger;
      Mode_Ill  := pFIBQuerySecond.FieldByName('MODE_ILL').AsInteger;

      pFIBQuerySecond.Close;

      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add('select first 1 oklad,shifrkat,dolg,w_place from person a');
      pFIBQuerySecond.SQL.Add(' where a.tabno='+IntToStr(Tabno)+' and');
      pFIBQuerySecond.SQL.Add(' a.yearvy*12+a.monthvy <= '+IntToStr(WantedYear*12+WantedMonth)+' and');
      pFIBQuerySecond.SQL.Add(' a.w_r=1');
      pFIBQuerySecond.SQL.Add(' order by a.yearvy desc, a.monthvy desc');
      pFIBQuerySecond.ExecQuery;
      Oklad   := pFIBQuerySecond.FieldByName('OKLAD').AsFloat;
      NameKat := GET_KAT_NAME(pFIBQuerySecond.FieldByName('SHIFRKAT').AsInteger);
      Posada :=  trim(pFIBQuerySecond.FieldByName('DOLG').AsString);
      NamePodr := Name_Serv(pFIBQuerySecond.FieldByName('w_place').AsInteger);
      PrintHat;

      pFIBQuerySecond.Close;
      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add(' select MONTH_ZA,DAYS,SUMMA_BUD,SUMMA_VNE,SUMMA_GN,SUMMA_NIS,SEL,GRAPHIC_DAY from BOLN_SUMMY');
      pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(ShifrIdBoln));
      pFIBQuerySecond.SQL.Add(' and SEL>0');
      pFIBQuerySecond.SQL.Add(' order by YEAR_ZA DESC,MONTH_ZA DESC');
      pFIBQuerySecond.ExecQuery;
      SummaBudTot:=0;
      SummaVneTot:=0;
      SummaNisTot:=0;
      SummaGNTot :=0;
      DaySTot    :=0;
      I_Count    :=0;
      ShifrSta   :=0;
      while not pFIBQuerySecond.Eof do
        begin
             Inc(i_Count);
             if i_Count>6 then break;
             NameMon := Trim(GetMonthShortUkr(pFIBQuerySecond.FieldByName('MONTH_ZA').AsINTEGER));
             SummaBud:=pFIBQuerySecond.FieldByName('Summa_Bud').AsFloat;
             SummaVne:=pFIBQuerySecond.FieldByName('Summa_Vne').AsFloat;
             SummaGn:=pFIBQuerySecond.FieldByName('Summa_GN').AsFloat;
             SummaNis:=pFIBQuerySecond.FieldByName('Summa_Nis').AsFloat;
             DayS := pFIBQuerySecond.FieldByName('DAYS').AsInteger;
             if Mode_Ill=1 then
                DayS := pFIBQuerySecond.FieldByName('GRAPHIC_DAY').AsInteger;
             SummaBudTot:=SummaBudTot+SummaBud;
             SummaVneTot:=SummaVneTot+SummaVne;
             SummaNisTot:=SummaNisTot+SummaNis;
             SummaGNTot :=SummaGNTot+SummaGN;
             DaySTot    := DaysTot + Days;
             PrintDetSum;
             pFIBQuerySecond.Next;
        end;
      PrintDetSumRazom;

      SummaBudTot:=0;
      SummaVneTot:=0;
      SummaNisTot:=0;
      SummaGNTot :=0;
      DaySTot    :=0;

      frxReport2.Engine.ShowBand(frxReport2.FindObject('MasterDataLic') as TfrxMasterData);

      pFIBQuerySecond.Close;
      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add(' select MONTH_ZA,B_DAY,SUMMA_B_BUD,SUMMA_B_VNE,SUMMA_B_GN,SUMMA_B_NIS,SHIFRSTA from BOLN_RES');
      pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(ShifrIdBoln));
      pFIBQuerySecond.SQL.Add(' order by YEAR_ZA,MONTH_ZA');
      pFIBQuerySecond.ExecQuery;
      I_Count:=0;
      while not pFIBQuerySecond.Eof do
        begin
             inc(i_Count);
             if i_Count>6 then break;
             NameMon    := Trim(GetMonthShortUkr(pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger));
             Days       := pFIBQuerySecond.FieldByName('B_DAY').AsInteger;
             SummaBud   := pFIBQuerySecond.Fields[2].AsFloat;
             SummaVne   := pFIBQuerySecond.Fields[3].AsFloat;
             SummaGN    := pFIBQuerySecond.Fields[4].AsFloat;
             SummaNIS   := pFIBQuerySecond.Fields[5].AsFloat;
             SummaBudTot:= SummaBudTot + SummaBud;
             SummaVneTot:= SummaVneTot + SummaVne;
             SummaNisTot:= SummaNisTot + SummaNis;
             SummaGNTot := SummaGNTot  + SummaGN;
             DaySTot    := DaysTot + Days;
             ShifrSta   := pFIBQuerySecond.FieldByName('SHIFRSTA').AsInteger;
{
             if FIB.pFIBQuerySecond.FieldByName('SHIFRSTA').AsInteger=12 then
                E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13] := 'ФМП'
              else
                E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13] := 'ФСС';
}
             PrintDetSum;
             pFIBQuerySecond.Next;
        end;
      PrintDetSumRazom;
      PrintItg;


      pFIBQuerySecond.Close;
      pFIBQuerySecond.Transaction.Commit;

 end;

procedure TFormBoln.N9Click(Sender: TObject);
begin
        frxReport2.ShowReport;
end;

procedure TFormBoln.PrintSelectedBoln;
begin
  frxReport2.ShowReport;
end;



procedure TFormBoln.N10Click(Sender: TObject);
begin
     PrintSelectedBoln;
end;


procedure TFormBoln.frxReport3ManualBuild(Page: TfrxPage);
 var ShifrIdBoln : integer;
     i,j,k:integer;
     S:String;
begin
{
     ShifrIdBoln:=SELF.pFIBDataSetBoln.FieldByName('SHIFRID').AsInteger;
     PrintBolnFR(ShifrIdBoln);
}
  S:=Page.Name;
  if dxDBGrid1.SelectedCount>0 then
    with dxDBGrid1.DataSource.DataSet do
      for i:=0 to dxDBGrid1.SelectedCount-1 do
      begin
{           GotoBookmark(pointer(dxDBGridPodr.SelectedRows.Items[i]));}
{           j:=Fields[0].AsInteger;}
           val(dxDBGrid1.SelectedNodes[i].Strings[7],j,k);
           if (i mod 2 = 0) and (i>0) then
              frxReport3.Engine.NewPage;
           if k=0 then
               if j>0 then
                  PrintBolnFRCross(j);
      end;

end;

procedure TFormBoln.PrintBolnFRCross(ShifrIdBoln:integer);
 var Tabno    : integer;
     Nomer_B  : string;
     Fio      : string;
     Nal_Code : string;
     F_DataS  : string;
     L_DataS  : string;
     KwoDay   : real;
     Procent  : real;
     NameSta  : string;
     MeanDay  : real;
     WantedMonth : integer;
     WantedYear  : integer;
     Oklad    : real;
     ShifrKat : integer;
     ShifrGru : integer;
     NameKat  : string;
     Posada   : string;
     NamePodr : string;
     I_Count,Days,DaySTot  : integer;
     SummaBud,SummaVne,SummaGN,SummaNIS:real;
     SummaBudTot,SummaVneTot,SummaGNTot,SummaNISTot:real;
     NameMon : string;
     ShifrSta : integer;
  procedure PrintHat;
   var S:string;
       i,j:integer;
       a,b : extended;
   begin
        for i:=1 to 5 do
            frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataEmpty') as TfrxMasterData);

        s:='Номер лікарняного лістку '+Nomer_B;
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport3.Variables['s1']:=''''+s+'''';
        s:='Співробітник '+Trim(Fio)+' т.н. '+IntToStr(Tabno)+' ІНН '+trim(Nal_Code);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport3.Variables['s2']:=''''+s+'''';
        s:='Лікарняний э '+trim(F_DataS)+' по '+trim(L_DataS)+' тривалість '+trim(format('%5.0f',[KwoDay]))+' днів';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport3.Variables['s3']:=''''+s+'''';
        s:='Процент '+trim(format('%5.0f',[Procent]))+' Категорія '+trim(NameKat)+' Посада '+trim(Posada);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport3.Variables['s4']:=''''+s+'''';
        s:='Стаття '+trim(NameSta)+' Оклад '+trim(format('%12.2f',[Oklad]))+' '+getShortCurrencyName+' ';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport3.Variables['s5']:=''''+s+'''';
        s:='Середня дена з/п '+trim(format('%12.4f',[MeanDay]))+' '+getShortCurrencyName+' Підрозділ '+trim(NamePodr);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport3.Variables['s6']:=''''+s+'''';
        i:=frxReport3.Engine.CurLine;
        a:=frxReport3.Engine.CurY;

        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterData1') as TfrxMasterData);
        j:=frxReport3.Engine.CurLine;
        b:=frxReport3.Engine.CurY;
   end;

  procedure PrintDetSum;
   var s:string;
   begin
         CrossSum.AddValue([NameMon],['Днів'],[DayS]);
         S:=FORMAT('%3d',[DaysTot]);
         s:=ReplQuot(s);
         CrossSum.AddValue([NameMon],['Днів'],[S]);
         if abs(SummaBud)>0.005 then
            begin
                 S:=FORMAT('%10.2f',[SummaBud]);
                 CrossSum.AddValue([NameMon],['Бюджет'],[S]);
            end;
         if abs(SummaVne)>0.005 then
            begin
                 S:=FORMAT('%10.2f',[SummaVne]);
                 CrossSum.AddValue([NameMon],['Вне бюджет'],[S]);
            end;
         if abs(SummaGn)>0.005 then
            begin
                 S:=FORMAT('%10.2f',[SummaGN]);
                 CrossSum.AddValue([NameMon],['Г Н'],[S]);
            end;
         if abs(SummaNIS)>0.005 then
            begin
                 S:=FORMAT('%10.2f',[SummaNIS]);
                 CrossSum.AddValue([NameMon],['Н I C'],[S]);
            end;
   end;


  procedure PrintDetSumRazom;
   var s:string;
       i,j:integer;
       Band : TFrxMasterData;
       Name : string;
       a,b  : extended;
   begin
  //      i:=CrossSum.ColCount;
  //      j:=CrossSum.RowCount;
        Band:=frxReport3.FindObject('MasterDataSB') as TfrxMasterData;
        Name:=Band.Name;
        a:=frxReport3.Engine.CurY;
        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataSB') as TfrxMasterData);
     //   j:=frxReport3.Engine.CurY;
        b:=frxReport3.Engine.CurY;
//        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataDS') as TfrxMasterData);
//        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataHS') as TfrxMasterData);
//        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataDS') as TfrxMasterData);
{
        S:='Рзм';
        frxReport3.Variables['m']:=''''+s+'''';
        S:=FORMAT('%3d',[DaysTot]);
        s:=ReplQuot(s);
        frxReport3.Variables['days']:=''''+s+'''';
        s:='';
        if abs(SummaBudTot)>0.002 then
           S:=FORMAT('%10.2f',[SummaBudTot]);
        frxReport3.Variables['summabud']:=''''+s+'''';
        s:='';
        if abs(SummaVneTot)>0.002 then
           S:=FORMAT('%10.2f',[SummaVneTot]);
        frxReport3.Variables['summavne']:=''''+s+'''';
        s:='';
        if abs(SummaGnTot)>0.002 then
           S:=FORMAT('%10.2f',[SummaGNTot]);
        frxReport3.Variables['summagn']:=''''+s+'''';
        if abs(SummaNISTot)>0.002 then
           S:=FORMAT('%10.2f',[SummaNISTot]);
        frxReport3.Variables['summanis']:=''''+s+'''';
        s:='';
        frxReport3.Variables['fond']:=''''+s+'''';
        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataSum') as TfrxMasterData);
}
   end;
  procedure PrintItg;
   var S : string;
       a : real;
   begin
        s:='Лікарняні разом ';
        a:=summabudtot+summavnetot+summanistot+summagntot;
        s:=s+trim(format('%12.2f',[a])+getShortCurrencyName);
        s:=ReplQuot(s);
        frxReport3.Variables['razom']:=''''+s+'''';
        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataItg') as TfrxMasterData);
   end;
 begin
     if pFIBQuerySecond.Open then
        pFIBQuerySecond.Close;
     if not pFIBQuerySecond.Transaction.Active then
        pFIBQuerySecond.Transaction.StartTransaction;

      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add(' select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,Nomer_B,Procent,MEAN_DAY,NAL_CODE,SHIFR_STA,YEAR_VY,MONTH_VY from boln');
      pFIBQuerySecond.SQL.Add(' where ShifrId='+IntToStr(ShifrIdBoln));
      pFIBQuerySecond.ExecQuery;
      Tabno    := pFIBQuerySecond.FieldByName('TABNO').AsInteger;
      Nomer_B  := pFIBQuerySecond.FieldByName('NOMER_B').AsString;
      Fio      := pFIBQuerySecond.FieldByName('FIO').AsString;
      Nal_Code := pFIBQuerySecond.FieldByName('NAL_CODE').AsString;
      F_DataS  := DateToStr(pFIBQuerySecond.FieldByName('F_DATA').AsDate);
      L_DataS  := DateToStr(pFIBQuerySecond.FieldByName('L_DATA').AsDate);
      KwoDay   := pFIBQuerySecond.FieldByName('K_WO_DAY').AsFloat;
      Procent  := pFIBQuerySecond.FieldByName('PROCENT').AsFloat;
      NameSta  := IntToStr(pFIBQuerySecond.FieldByName('SHIFR_STA').AsInteger)+' '+trim(ShifrList.GetName(pFIBQuerySecond.FieldByName('SHIFR_STA').AsInteger));
      MeanDay  := pFIBQuerySecond.FieldByName('MEAN_DAY').AsFloat;
      WantedMonth:=pFIBQuerySecond.FieldByName('MONTH_VY').AsInteger;
      WantedYear:=pFIBQuerySecond.FieldByName('YEAR_VY').AsInteger;

      pFIBQuerySecond.Close;

      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add('select first 1 oklad,shifrkat,dolg,w_place from person a');
      pFIBQuerySecond.SQL.Add(' where a.tabno='+IntToStr(Tabno)+' and');
      pFIBQuerySecond.SQL.Add(' a.yearvy*12+a.monthvy <= '+IntToStr(WantedYear*12+WantedMonth)+' and');
      pFIBQuerySecond.SQL.Add(' a.w_r=1');
      pFIBQuerySecond.SQL.Add(' order by a.yearvy desc, a.monthvy desc');
      pFIBQuerySecond.ExecQuery;
      Oklad   := pFIBQuerySecond.FieldByName('OKLAD').AsFloat;
      NameKat := GET_KAT_NAME(pFIBQuerySecond.FieldByName('SHIFRKAT').AsInteger);
      Posada :=  trim(pFIBQuerySecond.FieldByName('DOLG').AsString);
      NamePodr := Name_Serv(pFIBQuerySecond.FieldByName('w_place').AsInteger);
      PrintHat;
{ Печать второго суботчета }
      CrossSum :=  frxReport3.FindObject('CrossSum') as TfrxCrossView;
      pFIBQuerySecond.Close;
      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add(' select MONTH_ZA,DAYS,SUMMA_BUD,SUMMA_VNE,SUMMA_GN,SUMMA_NIS,SEL from BOLN_SUMMY');
      pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(ShifrIdBoln));
      pFIBQuerySecond.SQL.Add(' and SEL>0');
      pFIBQuerySecond.SQL.Add(' order by YEAR_ZA DESC,MONTH_ZA DESC');
      pFIBQuerySecond.ExecQuery;
      SummaBudTot:=0;
      SummaVneTot:=0;
      SummaNisTot:=0;
      SummaGNTot :=0;
      DaySTot    :=0;
      I_Count    :=0;
      ShifrSta   :=0;
      while not pFIBQuerySecond.Eof do
        begin
             Inc(i_Count);
             if i_Count>6 then break;
             NameMon := Trim(GetMonthShortUkr(pFIBQuerySecond.FieldByName('MONTH_ZA').AsINTEGER));
             SummaBud:=pFIBQuerySecond.FieldByName('Summa_Bud').AsFloat;
             SummaVne:=pFIBQuerySecond.FieldByName('Summa_Vne').AsFloat;
             SummaGn:=pFIBQuerySecond.FieldByName('Summa_GN').AsFloat;
             SummaNis:=pFIBQuerySecond.FieldByName('Summa_Nis').AsFloat;
             DayS := pFIBQuerySecond.FieldByName('DAYS').AsInteger;
             SummaBudTot:=SummaBudTot+SummaBud;
             SummaVneTot:=SummaVneTot+SummaVne;
             SummaNisTot:=SummaNisTot+SummaNis;
             SummaGNTot :=SummaGNTot+SummaGN;
             DaySTot    := DaysTot + Days;
             if abs(SummaBud)>0.005 then
                CrossSum.AddValue([NameMon],['Бюджет'],[SummaBud]);
             if abs(SummaVne)>0.005 then
                CrossSum.AddValue([NameMon],['Вне бюджет'],[SummaVne]);
             if abs(SummaGn)>0.005 then
                CrossSum.AddValue([NameMon],['Г Н'],[SummaGN]);
             if abs(SummaNIS)>0.005 then
                CrossSum.AddValue([NameMon],['Н I C'],[SummaNis]);
             pFIBQuerySecond.Next;
        end;
      PrintDetSumRazom;

      SummaBudTot:=0;
      SummaVneTot:=0;
      SummaNisTot:=0;
      SummaGNTot :=0;
      DaySTot    :=0;

      frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataLic') as TfrxMasterData);

      pFIBQuerySecond.Close;
      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add(' select MONTH_ZA,B_DAY,SUMMA_B_BUD,SUMMA_B_VNE,SUMMA_B_GN,SUMMA_B_NIS,SHIFRSTA from BOLN_RES');
      pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(ShifrIdBoln));
      pFIBQuerySecond.SQL.Add(' order by YEAR_ZA,MONTH_ZA');
      pFIBQuerySecond.ExecQuery;
      I_Count:=0;
      while not pFIBQuerySecond.Eof do
        begin
             inc(i_Count);
             if i_Count>6 then break;
             NameMon    := Trim(GetMonthShortUkr(pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger));
             Days       := pFIBQuerySecond.FieldByName('B_DAY').AsInteger;
             SummaBud   := pFIBQuerySecond.Fields[2].AsFloat;
             SummaVne   := pFIBQuerySecond.Fields[3].AsFloat;
             SummaGN    := pFIBQuerySecond.Fields[4].AsFloat;
             SummaNIS   := pFIBQuerySecond.Fields[5].AsFloat;
             SummaBudTot:= SummaBudTot + SummaBud;
             SummaVneTot:= SummaVneTot + SummaVne;
             SummaNisTot:= SummaNisTot + SummaNis;
             SummaGNTot := SummaGNTot  + SummaGN;
             DaySTot    := DaysTot + Days;
             ShifrSta   := pFIBQuerySecond.FieldByName('SHIFRSTA').AsInteger;
{
             if FIB.pFIBQuerySecond.FieldByName('SHIFRSTA').AsInteger=12 then
                E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13] := 'ФМП'
              else
                E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13] := 'ФСС';
}
             PrintDetSum;
             pFIBQuerySecond.Next;
        end;
    //  PrintDetSumRazom;
   //   PrintItg;


      pFIBQuerySecond.Close;
      pFIBQuerySecond.Transaction.Commit;

 end;


procedure TFormBoln.N21Click(Sender: TObject);
begin
{     PrintSelectedBolnCross;}
     PrintSelectedBolnFROld;
end;

procedure TFormBoln.PrintSelectedBolnFROld;
 begin
     frxReport4.ShowReport;
 end;



procedure TFormBoln.PrintSelectedBolnCross;
begin
  frxReport3.ShowReport;
end;

procedure TFormBoln.FR1Click(Sender: TObject);
begin
     N10Click(Sender);
end;


procedure TFormBoln.PrintBolnListFROld(ShifrIdBoln:integer);
 var Tabno    : integer;
     Nomer_B  : string;
     Fio      : string;
     Nal_Code : string;
     F_DataS  : string;
     L_DataS  : string;
     KwoDay   : real;
     Procent  : real;
     NameSta  : string;
     MeanDay  : real;
     WantedMonth : integer;
     WantedYear : integer;
     Oklad,Koef : real;
     ShifrKat : integer;
     ShifrGru : integer;
     NameKat  : string;
     Posada   : string;
     NamePodr : string;
     I_Count,DaySTot,DaySBTot  : integer;
     SummaBudTot,SummaVneTot,SummaGNTot,SummaNISTot:real;
     SummaBBudTot,SummaBVneTot,SummaBGNTot,SummaBNISTot:real;
     NameMon      : string;
     ShifrSta     : integer;
     LINENO       : INTEGER;
     mis          : string;
     DAYS         : INTEGER;
     SUMMA_BUD    : real;
     SUMMA_VNE    : real;
     SUMMA_GN     : real;
     SUMMA_NIS    : real;
     MONTH_BOL    : string;
     SHIFR_STA    : integer;
     DAY_BOL      : integer;
     SUMMABOL_BUD : real;
     SUMMABOL_VNE : real;
     SUMMABOL_GN  : real;
     SUMMABOL_NIS : real;
     FOND         : string;
     ModeDC       : integer;
     DevBoln      : TextFile;
     FName,S      : string;



  procedure PrintHatUkr;
   var S:string;
       i,j:integer;
       a,b : extended;
   begin
        for i:=1 to 5 do
            frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterDataEmpty') as TfrxMasterData);

        s:='Номер лікарняного лістку '+Nomer_B;
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s1']:=''''+s+'''';
        s:='Співробітник '+Trim(Fio)+' т.н. '+IntToStr(Tabno)+' ІНН '+trim(Nal_Code);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s2']:=''''+s+'''';
        if ModeDC=1 then
           s:='Лікарняний э '+trim(F_DataS)+' по '+trim(L_DataS)+' тривалість '+trim(format('%5.0f',[KwoDay]))+' годин'
        else
           s:='Лікарняний э '+trim(F_DataS)+' по '+trim(L_DataS)+' тривалість '+trim(format('%5.0f',[KwoDay]))+' днів';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s3']:=''''+s+'''';
        s:='Процент '+trim(format('%5.0f',[Procent]))+' Категорія '+trim(NameKat)+' Посада '+trim(Posada);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s4']:=''''+s+'''';
        s:='Стаття '+trim(NameSta)+' Оклад '+trim(format('%12.2f',[Oklad]))+' '+getShortCurrencyName+' '+trim(format('%8.2f',[Koef]))+' ставки';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s5']:=''''+s+'''';
        s:='Середня дена з/п '+trim(format('%12.4f',[MeanDay]))+' '+getShortCurrencyName+' Підрозділ '+trim(NamePodr);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s6']:=''''+s+'''';
        i:=frxReport4.Engine.CurLine;
        a:=frxReport4.Engine.CurY;
        if ModeDC=1 then
           s:=':Мiс:Год.: Бюжет   :Вне бюдж.:    ГН   :   НIС   :Мiс:Шфр:Год.: Бюжет   :Вне бюдж.:    ГН   :   НIС   :   :'
        else
           s:=':Мiс:Днiв: Бюжет   :Вне бюдж.:    ГН   :   НIС   :Мiс:Шфр:Днiв: Бюжет   :Вне бюдж.:    ГН   :   НIС   :   :';
        frxReport4.Variables['s7']:=''''+s+'''';

        frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterData1') as TfrxMasterData);
        frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterData2') as TfrxMasterData);
        frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterData3') as TfrxMasterData);
        j:=frxReport4.Engine.CurLine;
        b:=frxReport4.Engine.CurY;
   end;

  procedure PrintHatRus;
   var S:string;
       i,j:integer;
       a,b : extended;
   begin
        for i:=1 to 5 do
            frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterDataEmpty') as TfrxMasterData);

        s:='Номер больничного листка '+Nomer_B;
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s1']:=''''+s+'''';
        s:='Сотрудник '+Trim(Fio)+' т.н. '+IntToStr(Tabno)+' ИНН '+trim(Nal_Code);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s2']:=''''+s+'''';
        if ModeDC=1 then
           s:='Больничный с '+trim(F_DataS)+' по '+trim(L_DataS)+' продолжитедьность '+trim(format('%5.0f',[KwoDay]))+' часов'
        else
           s:='Больничный с '+trim(F_DataS)+' по '+trim(L_DataS)+' продолжитедьность '+trim(format('%5.0f',[KwoDay]))+' дней';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s3']:=''''+s+'''';
        s:='Процент '+trim(format('%5.0f',[Procent]))+' Категория '+trim(NameKat)+' Должность '+trim(Posada);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s4']:=''''+s+'''';
        s:='Статья '+trim(NameSta)+' Оклад '+trim(format('%12.2f',[Oklad]))+' '+getShortCurrencyName+' '+trim(format('%8.2f',[Koef]))+' ставки';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s5']:=''''+s+'''';
        s:='Средняя дневная з/п '+trim(format('%12.4f',[MeanDay]))+' '+getShortCurrencyName+' Подразделение '+trim(NamePodr);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        frxReport4.Variables['s6']:=''''+s+'''';
        i:=frxReport4.Engine.CurLine;
        a:=frxReport4.Engine.CurY;
        if ModeDC=1 then
           s:=':Мес:Час.: Бюджет  :Вне бюдж.:    ГН   :   НИС   :Мес:Шфр:Час.: Бюджет  :Вне бюдж.:    ГН   :   НИС   :   :'
        else
           s:=':Мес:Дней: Бюджет  :Вне бюдж.:    ГН   :   НИС   :Мес:Шфр:Дней: Бюджет  :Вне бюдж.:    ГН   :   НИС   :   :';
        frxReport4.Variables['s7']:=''''+s+'''';

        frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterData1') as TfrxMasterData);
        frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterData2') as TfrxMasterData);
        frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterData3') as TfrxMasterData);
        j:=frxReport4.Engine.CurLine;
        b:=frxReport4.Engine.CurY;
   end;

  procedure PrintHatToFileUkr;
   var S:string;
       i,j:integer;
       a,b : extended;
   begin
        for i:=1 to 5 do
            writeln(DevBoln);

        s:='Номер лікарняного лістку '+Nomer_B;
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        s:='Співробітник '+Trim(Fio)+' т.н. '+IntToStr(Tabno)+' ІНН '+trim(Nal_Code);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        if ModeDC=1 then
           s:='Лікарняний э '+trim(F_DataS)+' по '+trim(L_DataS)+' тривалість '+trim(format('%5.0f',[KwoDay]))+' годин'
        else
           s:='Лікарняний э '+trim(F_DataS)+' по '+trim(L_DataS)+' тривалість '+trim(format('%5.0f',[KwoDay]))+' днів';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        s:='Процент '+trim(format('%5.0f',[Procent]))+' Категорія '+trim(NameKat)+' Посада '+trim(Posada);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        s:='Стаття '+trim(NameSta)+' Оклад '+trim(format('%12.2f',[Oklad]))+' '+getShortCurrencyName+' '+trim(format('%8.2f',[Koef]))+' ставки';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        s:='Середня дена з/п '+trim(format('%12.4f',[MeanDay]))+' '+getShortCurrencyName+' Підрозділ '+trim(NamePodr);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        s:=' Вихiднi данi                                                     Лiкарнянi';
        writeln(DevBoln,s);
        s:='-----------------------------------------------------------------------------------------------------------';
        writeln(DevBoln,s);
        if ModeDC=1 then
           s:=':Мiс:Год.: Бюжет   :Вне бюдж.:    ГН   :   НIС   :Мiс:Шфр:Год.: Бюжет   :Вне бюдж.:    ГН   :   НIС   :   :'
        else
           s:=':Мiс:Днiв: Бюжет   :Вне бюдж.:    ГН   :   НIС   :Мiс:Шфр:Днiв: Бюжет   :Вне бюдж.:    ГН   :   НIС   :   :';
        writeln(DevBoln,s);
        s:=':---:----:---------:---------:---------:---------:---:---:----:---------:---------:---------:---------:---:';
        writeln(DevBoln,s);
   end;

  procedure PrintHatToFileRus;
   var S:string;
       i,j:integer;
       a,b : extended;
   begin
        for i:=1 to 5 do
            writeln(DevBoln);

        s:='Номер больничного листка '+Nomer_B;
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        s:='Сотрудник '+Trim(Fio)+' т.н. '+IntToStr(Tabno)+' ИНН '+trim(Nal_Code);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        if ModeDC=1 then
           s:='Больничный с '+trim(F_DataS)+' по '+trim(L_DataS)+' продолжительность '+trim(format('%5.0f',[KwoDay]))+' часов'
        else
           s:='Больничный с '+trim(F_DataS)+' по '+trim(L_DataS)+' продолжительность '+trim(format('%5.0f',[KwoDay]))+' дней';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        s:='Процент '+trim(format('%5.0f',[Procent]))+' Категория '+trim(NameKat)+' Должность '+trim(Posada);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        s:='Статья '+trim(NameSta)+' Оклад '+trim(format('%12.2f',[Oklad]))+' '+getShortCurrencyName+' '+trim(format('%8.2f',[Koef]))+' ставки';
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        s:='Средняя дневная з/п '+trim(format('%12.4f',[MeanDay]))+' '+getShortCurrencyName+' Подразделение '+trim(NamePodr);
        s:=ReplChar(s,'і','i');
        s:=ReplChar(s,'І','I');
        s:=ReplQuot(s);
        writeln(DevBoln,s);
        s:=' Выходные данные                                                     Больничные';
        writeln(DevBoln,s);
        s:='-----------------------------------------------------------------------------------------------------------';
        writeln(DevBoln,s);
        if ModeDC=1 then
           s:=':Мес:Час.: Бюджет  :Вне бюдж.:    ГН   :   НИС   :Мес:Шфр:Час.: Бюджет  :Вне бюдж.:    ГН   :   НИС   :   :'
        else
           s:=':Мес:Дней: Бюджет  :Вне бюдж.:    ГН   :   НИС   :Мес:Шфр:Дней: Бюджет  :Вне бюдж.:    ГН   :   НИС   :   :';
        writeln(DevBoln,s);
        s:=':---:----:---------:---------:---------:---------:---:---:----:---------:---------:---------:---------:---:';
        writeln(DevBoln,s);
   end;

  procedure PrintDet;
   var s:string;
   begin
         S:=FORMAT('%3s',[mis]);
         s:=ReplQuot(s);
         frxReport4.Variables['mis']:=''''+s+'''';

         S:=FORMAT('%3d',[Days]);
         s:=ReplQuot(s);
         if Days<1 then
            S:=' ';
         frxReport4.Variables['day']:=''''+s+'''';

         S:=FORMAT('%9.2f',[summa_bud]);
         s:=ReplQuot(s);
         if abs(summa_bud)<0.005 then s:=' ';
         frxReport4.Variables['summa_bud']:=''''+s+'''';

         S:=FORMAT('%9.2f',[summa_vne]);
         s:=ReplQuot(s);
         if abs(summa_vne)<0.005 then s:=' ';
         frxReport4.Variables['summa_vne']:=''''+s+'''';

         S:=FORMAT('%9.2f',[summa_gn]);
         s:=ReplQuot(s);
         if abs(summa_gn)<0.005 then s:=' ';
         frxReport4.Variables['summa_gn']:=''''+s+'''';

         S:=FORMAT('%9.2f',[summa_nis]);
         s:=ReplQuot(s);
         if abs(summa_nis)<0.005 then s:=' ';
         frxReport4.Variables['summa_nis']:=''''+s+'''';
{
         S:=FORMAT('%9.2f',[summa_nis]);
         s:=ReplQuot(s);
         if abs(summa_nis)<0.005 then s:=' ';
         frxReport4.Variables['summa_bud']:=''''+s+'''';
}

         S:=FORMAT('%3s',[month_bol]);
         s:=ReplQuot(s);
         frxReport4.Variables['mis_b']:=''''+s+'''';

         S:=FORMAT('%3d',[shifr_sta]);
         s:=ReplQuot(s);
         if shifr_sta<1 then
            s:=' ';
         frxReport4.Variables['shifr_sta']:=''''+s+'''';

         S:=FORMAT('%3d',[day_bol]);
         s:=ReplQuot(s);
         if day_bol<1 then
            s:=' ';
         frxReport4.Variables['day_b']:=''''+s+'''';

         S:=FORMAT('%9.2f',[summabol_bud]);
         s:=ReplQuot(s);
         if abs(summabol_bud)<0.005 then s:=' ';
         frxReport4.Variables['summa_b_bud']:=''''+s+'''';

         S:=FORMAT('%9.2f',[summabol_vne]);
         s:=ReplQuot(s);
         if abs(summabol_vne)<0.005 then s:=' ';
         frxReport4.Variables['summa_b_vne']:=''''+s+'''';

         S:=FORMAT('%9.2f',[summabol_gn]);
         s:=ReplQuot(s);
         if abs(summabol_gn)<0.005 then s:=' ';
         frxReport4.Variables['summa_b_gn']:=''''+s+'''';

         S:=FORMAT('%9.2f',[summabol_nis]);
         s:=ReplQuot(s);
         if abs(summabol_nis)<0.005 then s:=' ';
         frxReport4.Variables['summa_b_nis']:=''''+s+'''';

         S:=FORMAT('%3s',[fond]);
         s:=ReplQuot(s);
         frxReport4.Variables['fond']:=''''+s+'''';

         frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterData4') as TfrxMasterData);
   end;

  procedure PrintDetToFile;
   var s:string;
       LineS:string;
   begin
         LineS:=':';
         S:=FORMAT('%3s',[mis]);
         s:=ReplQuot(s);
         if length(s)>3 then s:=copy(s,1,3);
         LineS:=LineS+s+':';
         S:=FORMAT('%3d',[Days]);
         s:=ReplQuot(s);
         if Days<1 then
            S:=all(' ',3);
         LineS:=LineS+s+' :';
         S:=FORMAT('%9.2f',[summa_bud]);
         s:=ReplQuot(s);
         if abs(summa_bud)<0.005 then s:=all(' ',9);
         LineS:=LineS+s+':';
         S:=FORMAT('%9.2f',[summa_vne]);
         s:=ReplQuot(s);
         if abs(summa_vne)<0.005 then s:=all(' ',9);
         LineS:=LineS+s+':';
         S:=FORMAT('%9.2f',[summa_gn]);
         s:=ReplQuot(s);
         if abs(summa_gn)<0.005 then s:=all(' ',9);
         LineS:=LineS+s+':';
         S:=FORMAT('%9.2f',[summa_nis]);
         s:=ReplQuot(s);
         if abs(summa_nis)<0.005 then s:=all(' ',9);
         LineS:=LineS+s+':';
         S:=FORMAT('%3s',[month_bol]);
         if length(s)>3 then s:=copy(s,1,3);
         s:=ReplQuot(s);
         LineS:=LineS+s+':';
         S:=FORMAT('%3d',[shifr_sta]);
         s:=ReplQuot(s);
         if shifr_sta<1 then s:=all(' ',3);
         LineS:=LineS+s+' :';
         S:=FORMAT('%3d',[day_bol]);
         s:=ReplQuot(s);
         if day_bol<1 then all(' ',3);
         LineS:=LineS+s+':';
         S:=FORMAT('%9.2f',[summabol_bud]);
         s:=ReplQuot(s);
         if abs(summabol_bud)<0.005 then s:=all(' ',9);
         LineS:=LineS+s+':';
         S:=FORMAT('%9.2f',[summabol_vne]);
         s:=ReplQuot(s);
         if abs(summabol_vne)<0.005 then s:=all(' ',9);
         LineS:=LineS+s+':';
         S:=FORMAT('%9.2f',[summabol_gn]);
         s:=ReplQuot(s);
         if abs(summabol_gn)<0.005 then s:=all(' ',9);
         LineS:=LineS+s+':';
         S:=FORMAT('%9.2f',[summabol_nis]);
         s:=ReplQuot(s);
         if abs(summabol_nis)<0.005 then s:=all(' ',9);
         LineS:=LineS+s+':';
         S:=FORMAT('%3s',[fond]);
         if length(s)>3 then s:=copy(s,1,3);
         s:=ReplQuot(s);
         LineS:=LineS+s+':';
         writeln(DevBoln,LineS);
   end;


  procedure PrintItgUkr;
   var S : string;
       a : real;
   begin
        s:='Лiкарнянi разом ';
        a:=summabbudtot+summabvnetot+summabnistot+summabgntot;
        s:=s+trim(format('%12.2f',[a])+' '+getShortCurrencyName);
        s:=ReplQuot(s);
        frxReport4.Variables['razom']:=''''+s+'''';
        frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterDataItg') as TfrxMasterData);
   end;
  procedure PrintItgRus;
   var S : string;
       a : real;
   begin
        s:='Больничные всего ';
        a:=summabbudtot+summabvnetot+summabnistot+summabgntot;
        s:=s+trim(format('%12.2f',[a])+' '+getShortCurrencyName);
        s:=ReplQuot(s);
        frxReport4.Variables['razom']:=''''+s+'''';
        frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterDataItg') as TfrxMasterData);
   end;

  procedure PrintItgToFileUkr;
   var S : string;
       a : real;
       i : integer;
   begin
        s:='-----------------------------------------------------------------------------------------------------------';
        writeln(DevBoln,s);
        s:='   Лiкарнянi разом ';
        a:=summabbudtot+summabvnetot+summabnistot+summabgntot;
        s:=s+trim(format('%12.2f',[a])+' '+getShortCurrencyName);
        s:=ReplQuot(s);
        writeln(devboln,s);
        writeln(devboln);
        writeln(devboln,' Бухгалтер р в');
   end;
  procedure PrintItgToFileRus;
   var S : string;
       a : real;
       i : integer;
   begin
        s:='-----------------------------------------------------------------------------------------------------------';
        writeln(DevBoln,s);
        s:='   Больничные итого ';
        a:=summabbudtot+summabvnetot+summabnistot+summabgntot;
        s:=s+trim(format('%12.2f',[a])+' '+getShortCurrencyName);
        s:=ReplQuot(s);
        writeln(devboln,s);
        writeln(devboln);
        writeln(devboln,' Бухгалтер р о');
   end;
 begin
     if pFIBQuerySecond.Open then
        pFIBQuerySecond.Close;
     if not pFIBQuerySecond.Transaction.Active then
        pFIBQuerySecond.Transaction.StartTransaction;

      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add(' select tabno,fio,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,Nomer_B,Procent,MEAN_DAY,NAL_CODE,SHIFR_STA,YEAR_VY,MONTH_VY,MODE_ILL,MODE_DAY_CLOCK from boln');
      pFIBQuerySecond.SQL.Add(' where ShifrId='+IntToStr(ShifrIdBoln));
      pFIBQuerySecond.ExecQuery;
      Tabno    := pFIBQuerySecond.FieldByName('TABNO').AsInteger;
      Nomer_B  := pFIBQuerySecond.FieldByName('NOMER_B').AsString;
      Fio      := pFIBQuerySecond.FieldByName('FIO').AsString;
      Nal_Code := pFIBQuerySecond.FieldByName('NAL_CODE').AsString;
      F_DataS  := DateToStr(pFIBQuerySecond.FieldByName('F_DATA').AsDate);
      L_DataS  := DateToStr(pFIBQuerySecond.FieldByName('L_DATA').AsDate);
      KwoDay   := pFIBQuerySecond.FieldByName('K_WO_DAY').AsFloat;
      Procent  := pFIBQuerySecond.FieldByName('PROCENT').AsFloat;
      NameSta  := IntToStr(pFIBQuerySecond.FieldByName('SHIFR_STA').AsInteger)+' '+trim(ShifrList.GetName(pFIBQuerySecond.FieldByName('SHIFR_STA').AsInteger));
      MeanDay  := pFIBQuerySecond.FieldByName('MEAN_DAY').AsFloat;
      WantedMonth:=pFIBQuerySecond.FieldByName('MONTH_VY').AsInteger;
      WantedYear:=pFIBQuerySecond.FieldByName('YEAR_VY').AsInteger;
      ModeDC    :=pFIBQuerySecond.FieldByName('MODE_DAY_CLOCK').AsInteger;


      pFIBQuerySecond.Close;

      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add('select first 1 oklad,shifrkat,dolg,w_place,');
      pFIBQuerySecond.SQL.Add('(select first 1 b.summa  from fcn b where a.shifrid=b.shifridperson and b.shifrsta in (99,99+500)) as koef');
      pFIBQuerySecond.SQL.Add(' from person a');
      pFIBQuerySecond.SQL.Add(' where a.tabno='+IntToStr(Tabno)+' and');
      pFIBQuerySecond.SQL.Add(' a.yearvy*12+a.monthvy <= '+IntToStr(WantedYear*12+WantedMonth)+' and');
      pFIBQuerySecond.SQL.Add(' a.w_r=1');
      pFIBQuerySecond.SQL.Add(' order by a.yearvy desc, a.monthvy desc');
      pFIBQuerySecond.ExecQuery;
      Oklad    := pFIBQuerySecond.FieldByName('OKLAD').AsFloat;
      NameKat  := GET_KAT_NAME(pFIBQuerySecond.FieldByName('SHIFRKAT').AsInteger);
      Posada   := trim(pFIBQuerySecond.FieldByName('DOLG').AsString);
      NamePodr := Name_Serv(pFIBQuerySecond.FieldByName('w_place').AsInteger);
      koef     := pFIBQuerySecond.FieldByName('KOEF').AsFloat;
      if isSVDN then
         PrintHatUkr
      else
         PrintHatRus;
      if NeedFileBolnMode then
         begin
              FName:=CDoc+'Boln.txt';
              AssignFile(DevBoln,FName);
              ReWrite(DevBoln);
              if isSVDN then
                 PrintHatToFileUkr
              else
                 PrintHatToFileRus;
         end;


{ Печать второго суботчета }
      pFIBQuerySecond.Close;
      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add('execute procedure pr_print_boln('+IntToStr(ShifrIdBoln)+')');
      pFIBQuerySecond.ExecQuery;

      pFIBQuerySecond.Close;
      pFIBQuerySecond.SQL.Clear;
      pFIBQuerySecond.SQL.Add(' select LINENO,"MONTH",DAYS,SUMMA_BUD,SUMMA_VNE,SUMMA_GN,SUMMA_NIS,');
      pFIBQuerySecond.SQL.Add('MONTH_BOL,SHIFR_STA,DAY_BOL,');
      pFIBQuerySecond.SQL.Add('SUMMABOL_BUD,SUMMABOL_VNE,SUMMABOL_GN,SUMMABOL_NIS,FOND');
      pFIBQuerySecond.SQL.Add(' FROM TB_TMP_BOL_PRINT');
//      pFIBQuerySecond.SQL.Add(' where conn_id=CURRENT_CONNECTION'+IntToStr(ShifrIdBoln));
      pFIBQuerySecond.SQL.Add(' where conn_id=CURRENT_CONNECTION');
      pFIBQuerySecond.SQL.Add(' order by lineno');


      pFIBQuerySecond.ExecQuery;
      DaySTot     :=0;
      SummaBudTot :=0;
      SummaVneTot :=0;
      SummaNisTot :=0;
      SummaGNTot  :=0;
      DaySBTot    :=0;
      SummaBBudTot:=0;
      SummaBVneTot:=0;
      SummaBNisTot:=0;
      SummaBGNTot :=0;
      I_Count     :=0;
      ShifrSta    :=0;
      while not pFIBQuerySecond.Eof do
        begin
             Inc(i_Count);
             if i_Count>6 then break;
             MIS       := Trim(pFIBQuerySecond.FieldByName('MONTH').AsString);
             DAYS      := pFIBQuerySecond.FieldByName('DAYS').AsInteger;
             Summa_Bud := pFIBQuerySecond.FieldByName('Summa_Bud').AsFloat;
             Summa_Vne := pFIBQuerySecond.FieldByName('Summa_Vne').AsFloat;
             Summa_Gn  := pFIBQuerySecond.FieldByName('Summa_GN').AsFloat;
             Summa_Nis := pFIBQuerySecond.FieldByName('Summa_Nis').AsFloat;
             SummaBol_Bud := pFIBQuerySecond.FieldByName('SummaBol_Bud').AsFloat;
             SummaBol_Vne := pFIBQuerySecond.FieldByName('SummaBol_Vne').AsFloat;
             SummaBol_Gn  := pFIBQuerySecond.FieldByName('SummaBol_GN').AsFloat;
             SummaBol_Nis := pFIBQuerySecond.FieldByName('SummaBol_Nis').AsFloat;
             MONTH_BOL    := Trim(pFIBQuerySecond.FieldByName('MONTH_BOL').AsString);
             SHIFR_STA    := pFIBQuerySecond.FieldByName('SHIFR_STA').AsInteger;
             DAY_BOL      := pFIBQuerySecond.FieldByName('DAY_BOL').AsInteger;
             FOND         := trim(pFIBQuerySecond.FieldByName('FOND').AsString);

             SummaBudTot :=SummaBudTot  + Summa_Bud;
             SummaVneTot :=SummaVneTot  + Summa_Vne;
             SummaNisTot :=SummaNisTot  + Summa_Nis;
             SummaGNTot  :=SummaGNTot   + Summa_GN;
             SummaBBudTot:=SummaBBudTot + SummaBol_Bud;
             SummaBVneTot:=SummaBVneTot + SummaBol_Vne;
             SummaBNisTot:=SummaBNisTot + SummaBol_Nis;
             SummaBGNTot :=SummaBGNTot  + SummaBol_GN;
             DaySTot     := DaysTot     + Days;
             DaysBTot    := DaysBTot    + Day_Bol;
             PrintDet;
             if NeedFileBolnMode then
                PrintDetToFile;

             pFIBQuerySecond.Next;
        end;
      pFIBQuerySecond.Close;
      pFIBQuerySecond.Transaction.Commit;

      Summa_Bud    := SummaBudTot;
      Summa_Vne    := SummaVneTot;
      Summa_Gn     := SummaGnTot;
      Summa_Nis    := SummaNisTot;
      SummaBol_Bud := SummaBBudTot;
      SummaBol_Vne := SummaBVneTot;
      SummaBol_Gn  := SummaBGnTot;
      SummaBol_Nis := SummaBNisTot;
      Days         := DaysTot;
      Day_Bol      := DaysBTot;
      frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterData3') as TfrxMasterData);
      if isSVDN  then
         begin
              mis := 'Iтг';
              PrintDet;
         end
      else
         begin
              mis := 'Итг';
              PrintDet;
         end;
      if NeedFileBolnMode then
         begin
              s:=':---:----:---------:---------:---------:---------:---:---:----:---------:---------:---------:---------:---:';
              writeln(DevBoln,s);
              PrintDetToFile;
         end;
      frxReport4.Engine.ShowBand(frxReport4.FindObject('MasterData5') as TfrxMasterData);
      if isSVDN then
         PrintItgUkr
      else
         PrintItgRus;

      if NeedFileBolnMode then
         begin
              if isSVDN then
                 PrintItgToFileUkr
              else
                 PrintItgToFileRus;
              CloseFile(DevBoln);
              View(FName);
         end;




 end;

procedure TFormBoln.frxReport4ManualBuild(Page: TfrxPage);
 var ShifrIdBoln : integer;
     i,j,k:integer;
     S:String;
begin
  S:=Page.Name;
  if dxDBGrid1.SelectedCount>0 then
    with dxDBGrid1.DataSource.DataSet do
      for i:=0 to dxDBGrid1.SelectedCount-1 do
      begin
           val(dxDBGrid1.SelectedNodes[i].Strings[7],j,k);
           if (i mod 2 = 0) and (i>0) then
              frxReport4.Engine.NewPage;
           if k=0 then
               if j>0 then
                  PrintBolnListFROld(j);
      end;
end;

procedure TFormBoln.FormShow(Sender: TObject);
begin
      if WantedMode=10 then
         begin
              pFIBDataSetBoln.Filter:='Mode_Ill=10';
              Caption:='Командировки';
         end
      else
         begin
              Caption:='Больничные';
              pFIBDataSetBoln.Filter:='Mode_Ill<>10';
         end;
      pFIBDataSetBoln.Filtered:=true;
end;

end.
