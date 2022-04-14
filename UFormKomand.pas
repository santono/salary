{$WARNINGS OFF}
{$HINTS OFF}

unit UFormKomand;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, ComCtrls, dxExEdtr, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, ExtCtrls, DBCtrls, Menus,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, OleServer, ExcelXP;


type
  TFormKomand = class(TForm)
    DateTimePicker1: TDateTimePicker;
    DataSourceKomand: TDataSource;
    pFIBDataSetKomand: TpFIBDataSet;
    pFIBDataSetKomandTABNO: TFIBIntegerField;
    pFIBDataSetKomandFIO: TFIBStringField;
    pFIBDataSetKomandF_DATA: TFIBDateField;
    pFIBDataSetKomandL_DATA: TFIBDateField;
    pFIBDataSetKomandK_WO_DAY: TFIBSmallIntField;
    pFIBDataSetKomandSHIFRID: TFIBIntegerField;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1TABNO: TdxDBGridMaskColumn;
    dxDBGrid1FIO: TdxDBGridMaskColumn;
    dxDBGrid1F_DATA: TdxDBGridDateColumn;
    dxDBGrid1L_DATA: TdxDBGridDateColumn;
    dxDBGrid1K_WO_DAY: TdxDBGridMaskColumn;
    dxDBGrid1SUMMA_BOL: TdxDBGridCurrencyColumn;
    dxDBGrid1SHIFRID: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    pFIBDataSetKomandSHIFRKAT: TFIBSmallIntField;
    pFIBDataSetKomandSHIFRGRU: TFIBSmallIntField;
    pFIBDataSetKomandDATA_P: TStringField;
    pFIBDataSetKomandDATA_P_BUD: TFIBDateField;
    dxDBGrid1Data_P: TdxDBGridColumn;
    pFIBTransactionSecond: TpFIBTransaction;
    pFIBDataSetKomandMODE_V_Z: TFIBSmallIntField;
    pFIBDataSetKomandSHIFR_STA: TFIBSmallIntField;
    dxDBGrid1ShifrSta: TdxDBGridDateColumn;
    dxDBGrid1ColumnModeIll: TdxDBGridColumn;
    pFIBDataSetKomandMEAN_DAY_BUD: TFIBBCDField;
    pFIBDataSetKomandMEAN_DAY_VNE: TFIBBCDField;
    pFIBDataSetKomandMEAN_DAY_GN: TFIBBCDField;
    pFIBDataSetKomandMEAN_DAY_NIS: TFIBBCDField;
    pFIBDataSetKomandMEAN_DAY: TFIBBCDField;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetKomandDATA_P_VNE: TFIBDateField;
    pFIBDataSetKomandDATA_P_V: TStringField;
    dxDBGrid1Data_P_V: TdxDBGridColumn;
    pFIBDataSetKomandSHIFRBUH: TFIBIntegerField;
    pFIBDataSetKomandSUMMA_KMD: TFIBBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure DBNavigator1BeforeAction(Sender: TObject;
      Button: TNavigateBtn);
    procedure pFIBDataSetKomandCalcFields(DataSet: TDataSet);

  private
    WantedYear:integer;
    WantedMonth:integer;
    procedure ShowTable;

  end;


var
  FormKomand: TFormKomand;

implementation
uses uFrmFindKadryFB,UFibModule,
     UFormUpdKmnd,ScrDef,UFormWait,USQLUnit,
     ComObj,ScrUtil,ScrLists,UFormSelBay,UFormView;

{$R *.dfm}

procedure TFormKomand.FormClose(Sender: TObject; var Action: TCloseAction);
begin

     if pFIBDataSetKomand.Active then pFIBDataSetKomand.Active:=false;
     if pFIBDataSetKomand.Transaction.Active then
        pFIBDataSetKomand.Transaction.Commit;
     if pFIBDataSetKomand.UpdateTransaction.Active then
        pFIBDataSetKomand.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormKomand.FormCreate(Sender: TObject);
var Wanteddata:TDateTime;
    Year,Month,Day:word;
begin
      Year  := CurrYear;
      Month := NMES;
      WantedYear  := Year;
      WantedMonth := Month;
      WantedData  := EncodeDate(WantedYear, WantedMonth, 1);
      DateTimePicker1.Date := WantedData;
      if FLOW_MONTH<>NMES then
         DBNavigator1.VisibleButtons:=DBNavigator1.VisibleButtons-[nbInsert];
      ShowTable;


end;

procedure TFormKomand.ShowTable;
 var I_Count:integer;
begin
      FormWait.Show;
      Application.ProcessMessages;
      if pFIBDataSetKomand.Active then
         pFIBDataSetKomand.Active:=false;
      pFIBDataSetKomand.Params[0].AsString:=IntToStr(Self.WantedYear);
      pFIBDataSetKomand.Params[1].AsString:=IntToStr(WantedMonth);
      pFIBDataSetKomand.Prepare;
      pFIBDataSetKomand.Open;
      FormWait.Hide;
      I_Count:=pFIBDataSetKomand.RecordCount;
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

procedure TFormKomand.DateTimePicker1Change(Sender: TObject);
var Year,Month,Day:word;
    I_Count:Integer;
begin
     DecodeDate(DateTimePicker1.Date, Year, Month, Day);
     WantedYear  := Year;
     WantedMonth := Month;
     ShowTable;
     I_Count:=pFIBDataSetKomand.RecordCount;
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

procedure TFormKomand.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
var
  BtnName: string;
  Act:integer;
  ShifrIdKmd:integer;
  S:String;
  v:Variant;
  shifrSta,shifrTabel:Integer;
  guid:string;
  mode_six_five_day:Integer;
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

          with TFormUpdKmnd.Create(nil) do
            begin
               try
                  ActionClar:=Act;
                  WantedTabno:=0;
                  Fio:='';
                  WorkYear    := WantedYear;
                  WorkMonth   := WantedMonth;
                  ShifrIdKmnd := 0;
                  ShifrBuh    := CurrWrk;
                  WantedPodr  := NSRV;
                  Mode_V_Z    := 0; // за - для командировочных
                  GUID        := '';
                  WantedShifrSta := Komandirowki_Shifr;
                  wantedShifrTabel:=KOMANDIROWKA;
                  if Act=1 then
                     begin
                          s:='EXECUTE PROCEDURE PR_DELETE_ALL_FROM_TMP_KOMAND';
                          FIB.pFIBDatabaseSal.Execute(s);
                     end;
                  if Act<>1 then
                     begin
                          WantedTabno:=SELF.pFIBDataSetKomand.FieldByName('TABNO').AsInteger;
                          Fio:=SELF.pFIBDataSetKomand.FieldByName('FIO').AsString;
                          ShifrKat:=SELF.pFIBDataSetKomand.FieldByName('SHIFRKAT').AsInteger;
                          ShifrGru:=SELF.pFIBDataSetKomand.FieldByName('SHIFRGRU').AsInteger;
                          ShifrIdKmnd:=SELF.pFIBDataSetKomand.FieldByName('SHIFRID').AsInteger;
                          ShifrIdKmd:=ShifrIdKmnd;
                          DateTimePickerFr.Date:=SELF.pFIBDataSetKomand.FieldByName('F_DATA').AsDateTime;
                          DateTimePickerTo.Date:=SELF.pFIBDataSetKomand.FieldByName('L_DATA').AsDateTime;
                          Mode_V_Z    := SELF.pFIBDataSetKomand.FieldByName('MODE_V_Z').AsInteger;
                          Kmnd_Day    := SELF.pFIBDataSetKomand.FieldByName('K_WO_DAY').AsInteger;
                          MeanDay     := SELF.pFIBDataSetKomand.FieldByName('MEAN_DAY').AsFloat;
                          MeanDay_Bud := SELF.pFIBDataSetKomand.FieldByName('MEAN_DAY_BUD').AsFloat;
                          MeanDay_Vne := SELF.pFIBDataSetKomand.FieldByName('MEAN_DAY_VNE').AsFloat;
                          MeanDay_GN  := SELF.pFIBDataSetKomand.FieldByName('MEAN_DAY_GN').AsFloat;
                          MeanDay_NIS := SELF.pFIBDataSetKomand.FieldByName('MEAN_DAY_NIS').AsFloat;
                          WantedShifrSta :=SELF.pFIBDataSetKomand.FieldByName('SHIFR_STA').AsInteger;
                          ShifrBuh    :=SELF.pFIBDataSetKomand.FieldByName('SHIFRBUH').AsInteger;
                          if isLNR then
                             begin
                                  v:=SQLQueryRecValues('select coalesce(shifr_sta,138),coalesce(shifrtabel,3),coalesce(guid,''''),coalesce(mode_six_five_day,5) from tb_komand where shifrid='+IntToStr(ShifrIdKmd));
                                  shifrSta:=v[0];
                                  shifrTabel:=v[1];
                                  GUID:=v[2];
                                  mode_six_five_day:=v[3];
                             end
                          else
                             begin
                                  shifrSta:=Komandirowki_Shifr;
                                  shifrTabel:=KOMANDIROWKA;
                                  mode_six_five_day:=6;
                                  GUID:='';
                             end;

                     end;
                  ShifrIdKmd:=ShifrIdKmnd;
                  if execute then
                     begin
                     end;
                  ShifrIdKmd:=ShifrIdKmnd;
              finally
                free;
              end;

            ShowTable;
            if ShifrIdKmd>0 then
               begin
                    SELF.pFIBDataSetKomand.Locate('ShifrId',ShifrIdKmd,[loPartialKey]);
               end;
           end;

     end;

end;

procedure TFormKomand.DBNavigator1BeforeAction(Sender: TObject;
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
          pFIBDataSetKomand.Cancel;
          EXIT;
     end;
end;

procedure TFormKomand.pFIBDataSetKomandCalcFields(DataSet: TDataSet);
var DT:TDateTime;
    Y,M,D:Word;
begin
     Dt:=DataSet.FieldByName('Data_P_Bud').AsDateTime;
     DeCodeDate(DT,Y,M,D);
     if Y<1995 then
        pFIBDataSetKomandDATA_P.Value:=''
               else
        pFIBDataSetKomandDATA_P.Value:=IntToStr(D)+'.'+IntToStr(M)+'.'+IntToStr(Y);
     Dt:=DataSet.FieldByName('Data_P_Vne').AsDateTime;
     DeCodeDate(DT,Y,M,D);
     if Y<1995 then
        pFIBDataSetKomandDATA_P_V.Value:=''
               else
        pFIBDataSetKomandDATA_P_V.Value:=IntToStr(D)+'.'+IntToStr(M)+'.'+IntToStr(Y);
end;











end.
