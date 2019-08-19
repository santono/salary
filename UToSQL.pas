unit UToSQL;
                                      
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FMTBcd, DB, SqlExpr, Menus, Gauges;

type
  TFormToSQL = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label3: TLabel;
    BitBtn6: TBitBtn;
    DateTimePickerFr: TDateTimePicker;
    DateTimePickerTo: TDateTimePicker;
    BitByn7: TBitBtn;
    Gauge3: TGauge;
    Gauge2: TGauge;
    Gauge1: TGauge;
    CheckBoxClear: TCheckBox;
    CheckBoxArc: TCheckBox;
    CheckBoxNeedIb: TCheckBox;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtnGener: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DateTimePickerFrChange(Sender: TObject);
    procedure DateTimePickerToChange(Sender: TObject);
    procedure BitByn7Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtnGenerClick(Sender: TObject);
  private
    { Private declarations }
    MonthFr:Integer;
    MonthTo:Integer;
    YearFR:Integer;
    YearTo:Integer;
    DateFr,DateTo:TDateTime;
    procedure AnalyzeIskra(ShowMode:boolean=true);
    procedure MoveAllPodrToSQL;

  public
    { Public declarations }
  end;

var
  FormToSQL: TFormToSQL;

implementation
  USES DateUtils,SCRDEF,SCRUTIL,SCRIO,DBUnit,SCRExport, UFibModule,uFormWait,uFormWaitMess;

{$R *.dfm}

procedure TFormToSQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormToSQL.BitBtn1Click(Sender: TObject);
 begin
      AnalyzeIskra;
 end;

procedure TFormToSQL.MoveAllPodrToSQL;
const podr_transact=10;
VAR I,J       : INTEGER;
    NSRVT     : INTEGER;
    NMES_T    : INTEGER;
    C_Year    : Integer;
    CurrData  : TDateTime;
    Y,M,C     : integer;
    NeedClear : boolean;
    ModeArc   : boolean;
    DstMode   : TDstMode;

begin
     if CheckBoxClear.Checked    then NeedClear := true
                                 else NeedClear := false;
     if CheckBoxArc.Checked      then ModeArc   := true
                                 else ModeArc   := false;
     if CheckBoxNeedIB.Checked   then NeedLogIb := true
                                 else NeedLogIb := false;
     if (modeArc and not ModeIskra) then
        begin
             movePodrToArc;
        end;

     DstMode:=salDstMode;
     if ModeArc then
        begin
             DstMode:=salarcDstMode;
             if FIB.pFIBTransactionSAL.FindDatabase(FIB.pFIBDatabaseArc)<0 then
                begin
                     if FIB.pFIBTransactionSAL.Active then
                        FIB.pFIBTransactionSAL.Commit;
                     FIB.pFIBTransactionSAL.ReplaceDatabase(FIB.pFIBDatabaseSal,FIB.pFIBDatabaseArc);
                     FIB.pFIBQuery.DataBase:=FIB.pFIBDatabaseArc;
                end
        end
                else
        begin
             if FIB.pFIBTransactionSAL.FindDatabase(FIB.pFIBDatabaseSal)<0 then
                begin
                     if FIB.pFIBTransactionSAL.Active then
                        FIB.pFIBTransactionSAL.Commit;
                     FIB.pFIBTransactionSAL.ReplaceDatabase(FIB.pFIBDatabaseArc,FIB.pFIBDatabaseSal);
                     FIB.pFIBQuery.DataBase:=FIB.pFIBDatabaseSal;
                end
        end;

     if FIB.pFIBDatabaseSal.ActiveTransactionCount>0 then
        begin
             ShowMessage('Кто-то не закрыл программу!'+#13#10+
                         'Транзакций '+IntToStr(FIB.pFIBDatabaseSal.ActiveTransactionCount)+
                         ' nmes='+IntToStr(nmes)+' nsrv='+IntToStr(NSRV));
             EXIT;
        end;

     if NeedClear then
     if (ModeArc and not ModeIskra) or (not ModeArc) then
        begin
             Label2.Caption:='Чистка базы данных с '+DateToStr(DateFr)+' по '+DateToStr(DateTo);
             FormWaitMess.SetMessage('Чистка БД. Ждите.');
             FormWaitMess.Show;
             Application.ProcessMessages;
             Delete_All_Podr(DateFr,DateTo,ModeArc);
             FormWaitMess.Hide;
             Label2.Caption:='Чистка закончена';
             Application.ProcessMessages;
        end;
     C_Year          := CurrYear;
     CurrYear        := 2005;
     Gauge1.MinValue := 0;
     Gauge1.MaxValue := Count_Serv;
     Gauge1.Progress :=  1;
     Gauge2.MinValue :=  0;
     Gauge2.MaxValue := 12;
     Gauge2.Progress :=  1;
     Gauge3.MinValue :=  0;
     Gauge3.MaxValue := 12;
     Gauge3.Progress :=  0;
     NSRVT := NSRV;
     EMPTY_ALL_PERSON;
     nmes_t := nmes;
     nmes   := 1;
     CurrData:=DateFr;
     C:=1;
     { Подсчет количества месяцев }
     while not ((MonthOF(CurrData)=MonthOf(DateTo)) and (YearOf(CurrData)=YearOf(DateTo))) do
         begin
               M:=MonthOF(CurrData);
               Y:=YearOF(CurrData);
               Inc(M);
               if M>12 then begin M:=1; Inc(Y); end;
               CurrData := RecodeMonth(CurrData,M);
               CurrData := RecodeYear(CurrData,Y);
               Inc(C);
               if (C>11) then break;
         end;
     CurrData:=DateFr;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     FIB.pFIBQuery.Transaction.StartTransaction;
     Max_Person_Id:=0;
     FOR j:=1 TO C do
         begin
              M:=MonthOF(CurrData);
              Y:=YearOF(CurrData);
              NMES:=M;
              CurrYear:=Y;
              Gauge2.Progress:=j;
              Label2.Caption:=Trim(MONTH[NMES])+' '+IntToStr(CurrYear)+' г.';
              Label2.ReFresh;
              Label2.RePaint;
              FOR I:=1 TO COUNT_SERV DO
                  BEGIN
                       NSRV:=I;
                       if C_Year=Y then MKFLNM else MKFLNM_Y;
                       Gauge1.Progress:=i;
                       Label1.Caption:=NAME_SERV(NSRV);
                       Label1.ReFresh;
                       Label1.RePaint;
                       Application.ProcessMessages;
                       if (modeIskra and (NSRV<>IskraPodr)) then Continue;
                       if (not modeIskra and (NSRV=IskraPodr)) then Continue;
                       if not FileExists(FNINF) then continue;
                       GETINF(TRUE);
                       PUTTOSQL(NeedClear,DstMode);
                       EMPTY_ALL_PERSON;
                       Application.ProcessMessages;
                       if ModeArc then
                          if FIB.pFIBDatabaseArc.ActiveTransactionCount>1 then
                             begin
                                  ShowMessage('Транзакций '+IntToStr(FIB.pFIBDatabaseArc.ActiveTransactionCount)+
                                              ' nmes='+IntToStr(nmes)+' nsrv='+IntToStr(NSRV))
                             end
                          else
                       else
                          if FIB.pFIBDatabaseSal.ActiveTransactionCount>1 then
                             begin
                                  ShowMessage('Транзакций '+IntToStr(FIB.pFIBDatabaseSAl.ActiveTransactionCount)+
                                              ' nmes='+IntToStr(nmes)+' nsrv='+IntToStr(NSRV))
                             end;

                       if i mod podr_transact = 0 then
                          if FIB.pFIBQuery.Transaction.Active then
                             begin
    {                             FIB.pFIBTransactionSAL.CommitRetaining;}
                                 FIB.pFIBQuery.Transaction.Commit;
                                 FIB.pFIBQuery.Transaction.StartTransaction;
                             end
                  END;
              Inc(M);
              if M>12 then begin M:=1; Inc(Y); end;
              CurrData := RecodeMonth(CurrData,M);
              CurrData := RecodeYear(CurrData,Y);
         END;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     if ModeArc then
        begin
             if FIB.pFIBTransactionSAL.FindDatabase(FIB.pFIBDatabaseSal)<0 then
                begin
                     if FIB.pFIBTransactionSAL.Active then
                        FIB.pFIBTransactionSAL.Commit;
                     FIB.pFIBTransactionSAL.ReplaceDatabase(FIB.pFIBDatabaseArc,FIB.pFIBDatabaseSal);
                     FIB.pFIBQuery.DataBase:=FIB.pFIBDatabaseSal;
                end
        end;
     NMES:=NMES_T;
     NSRV:=NSRVT;
  //   Error('Перенос закончен');
     CurrYear:=C_Year;
end;

procedure TFormToSQL.AnalyzeIskra(ShowMode:boolean=true);

  var IsArc:Boolean;
      SavDataPath:string;
      SavNMES,SavNSRV:Integer;
  begin
     if modeIskra then
        begin
             ShowMessage('В режиме работы с ИСКРОЙ нельзя переносить данные в БД');
             Exit;
        end;
     SavNMES:=NMES;
     SavNSRV:=NSRV;
     EMPTY_ALL_PERSON;
     Caption:='Перенос данных - Университет';
     MoveAllPodrToSQL;
     if CheckBoxArc.Checked      then IsArc   := true
                                 else IsArc   := false;
     if isSVDN then
        begin
          Caption:='Перенос данных - Искра';
          if not IsArc then
             begin
                  SavDataPath:=DDIR;
                  Ddir:=StringReplace(DDIR,'DATA','DATAISKR',[rfReplaceAll, rfIgnoreCase]);
                  FIB.changeSALtoSALISKRA;
                  modeIskra:=True;
                  MoveAllPodrToSQL;
                  modeIskra:=false;
                  FIB.changeSALISKRAtoSAL;
                  DDir:=SavDataPath;
             end
          else
             begin
                  SavDataPath:=DDIR;
                  DDIR:=StringReplace(DDIR,'DATA','DATAISKR',[rfReplaceAll, rfIgnoreCase]);
        //     FIB.changeSALtoSALISKRA;
                  modeIskra:=True;
                  MoveAllPodrToSQL;
                  modeIskra:=false;
                  DDir:=SavDataPath;
             end;
        end;
     NMES:=SavNMES;
     NSRV:=SavNSRV;
     MKFLNM;
     GETINF(True);
     if not needHideGenerMessages then
     if ShowMode then
        ShowMessage('Перенос данных - Закончен');
  end;

procedure TFormToSQL.N1Click(Sender: TObject);
begin
     ExportPODR;
end;

procedure TFormToSQL.BitBtn3Click(Sender: TObject);
begin
      if not YesNo('Эта процедура переносит справочник подразделений в архив.'+^M+' Выполнить?') then Exit;
{     ExportPodr;}
 //    UpdatePodr;
     MovePodrToArc;
     ShowMessage('Справочник подразделений в архиве успешно обновлен');

end;

procedure TFormToSQL.BitBtn4Click(Sender: TObject);
begin
     if YesNo('Перенести статьи начислений-удержаний в архив?') then
        ExportShifr;
end;

procedure TFormToSQL.BitBtn5Click(Sender: TObject);
begin
{      ExportKadry;}
     if YesNo('Перенести кадры в архив в архив?') then
      UpdateKadry;
end;

procedure TFormToSQL.BitBtn6Click(Sender: TObject);
begin
     ExportBoln;
end;

procedure TFormToSQL.FormCreate(Sender: TObject);
begin
     MonthFr := Nmes;
     MonthTo := Nmes;
     YearFr  := CurrYear;
     YearTo  := CurrYear;
     DateFr  := EncodeDate(YearFr,MonthFr,10);
     DateTo  := EncodeDate(YearTo,MonthTo,10);
     DateFr  := RecodeYear(DateFr,YearFr);
     DateTo  := RecodeYear(DateTo,YearTo);
     DateFr  := RecodeMonth(DateFr,MonthFr);
     DateTo  := RecodeMonth(DateTo,MonthTo);
     DateFr  := RecodeDay(DateFr,10);
     DateTo  := RecodeDay(DateTo,10);
end;

procedure TFormToSQL.FormShow(Sender: TObject);
begin
     DateTimePickerFr.Date:=DateFr;
     DateTimePickerTo.Date:=DateTo;
end;

procedure TFormToSQL.DateTimePickerFrChange(Sender: TObject);
begin
     DateFr  := DateTimePickerFr.Date;
     YearFr  := YearOf(DateFr);
     MonthFr := MonthOf(DateFr);
end;

procedure TFormToSQL.DateTimePickerToChange(Sender: TObject);
begin
     DateTo  := DateTimePickerTo.Date;
     YearTo  := YearOf(DateTo);
     MonthTo := MonthOf(DateTo);
end;

procedure TFormToSQL.BitByn7Click(Sender: TObject);
begin
     ExportOtp;

end;

procedure TFormToSQL.BitBtn7Click(Sender: TObject);
begin
     UpdateDolg;
end;

procedure TFormToSQL.BitBtn8Click(Sender: TObject);
begin
     EXPORT_DAY_KOD;
end;

procedure TFormToSQL.BitBtn9Click(Sender: TObject);
var Rec:integer;
    DataUw,DataPri:TDate;
    DataUwS,DataPriS,FIO:string;
begin
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select count(*) from kadry');
     try
         FIB.pFIBQuery.ExecQuery;
         Rec:=FIB.pFIBQuery.Fields[0].AsInteger;
     except
           ShowMessage('Ошибка запроса колиства строк к кадрах');
           Exit;
     end;
     if not FIB.pFIBQueryArc.Transaction.Active then
        FIB.pFIBQueryArc.Transaction.StartTransaction;
     Gauge3.MinValue := 0;
     Gauge3.MaxValue := Rec;
     Gauge3.Progress :=  1;
     Application.ProcessMessages;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select tabno,fio,nal_code,shifr_pod,pib,');
     FIB.pFIBQuery.SQL.Add(' DATA_PRI,DATA_UW,DATA_BIRTH,STAG_DO_Y,STAG_DO_M,');
     FIB.pFIBQuery.SQL.Add(' K_WO_MIN,OKLAD,STAWKA,PASP_SER,PASP_N,');
     FIB.pFIBQuery.SQL.Add(' PASP_DATA,PASP_VYD,K_WO_ST,SHIFR_DOL,SHIFR_RAJ,');
     FIB.pFIBQuery.SQL.Add(' SHIFR_U_S,SHIFR_U_Z,WID_RAB,SHIFR_KAT,SHIFR_GRU,');
     FIB.pFIBQuery.SQL.Add(' SHIFR_POL,PROF,DOLGNOST,ADRES,MESTO_R,COMMENT FROM KADRY');
     try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.Eof do
           begin
                 Gauge3.Progress := Gauge3.Progress + 1;
                 Label3.Caption:=IntToStr(FIB.pFIBQuery.FieldByName('TABNO').AsInteger)+
                        ' '+Trim(FIB.pFIBQuery.FieldByName('FIO').AsString);
                 Application.ProcessMessages;
                 if FIB.pFIBQuery.FieldByName('TABNO').AsInteger=1356 then
                    DataUwS:='Null';

                 DataUw  := FIB.pFIBQuery.FieldByName('DATA_UW').AsDate;
                 DataPri := FIB.pFIBQuery.FieldByName('DATA_PRI').AsDate;
                 if YearOf(DataUw)>1950 then
                    DataUwS:=''''+IntToStr(YearOf(DataUw))+'-'+
                                  IntToStr(MonthOf(DataUw))+'-'+
                                  IntToStr(DayOf(DataUw))+''''
                 else
                    DataUwS:='Null';
                 FIO:=trim(FIB.pFIBQuery.FieldByName('FIO').AsString);
                 FIO:=ReplQto2Q(FIO);
                 DataUwS:=trim(DataUwS);
                 if YearOf(DataPri)>1950 then
                    DataPriS:=''''+IntToStr(YearOf(DataPri))+'-'+
                                  IntToStr(MonthOf(DataPri))+'-'+
                                  IntToStr(DayOf(DataPri))+''''
                 else
                    DataPriS:='Null';
                 DataPriS:=trim(DataPriS);
                 if FIB.pFIBQueryArc.Open then
                    FIB.pFIBQueryArc.Close;
                 FIB.pFIBQueryArc.SQL.Clear;
                 FIB.pFIBQueryArc.SQL.Add('select count(*) from kadry where tabno='+IntToStr(FIB.pFIBQuery.FieldByName('TABNO').AsInteger));
                 try
                    FIB.pFIBQueryArc.ExecQuery;
                    Rec:=FIB.pFIBQueryArc.Fields[0].AsInteger;
                 except
                    ShowMessage('Ошибка получения числа работников с заданным табельным номером');
                    Exit;
                 end;
                 if Rec>1 then
                    begin
                         if FIB.pFIBQueryArc.Open then
                            FIB.pFIBQueryArc.Close;
                         FIB.pFIBQueryArc.SQL.Clear;
                         FIB.pFIBQueryArc.SQL.Add('delete from kadry where tabno='+IntToStr(FIB.pFIBQuery.FieldByName('TABNO').AsInteger));
                         try
                            FIB.pFIBQueryArc.ExecQuery;
                            Rec:=0;
                         except
                            ShowMessage('Ошибка удаления работников из архива');
                         end;
                    end;
                 if Rec=1 then
                    begin
                         if FIB.pFIBQueryArc.Open then
                            FIB.pFIBQueryArc.Close;
                         FIB.pFIBQueryArc.SQL.Clear;
                         FIB.pFIBQueryArc.SQL.Add('update kadry set ');
                         FIB.pFIBQueryArc.SQL.Add(' FIO='''+trim(FIO)+''',');
                         FIB.pFIBQueryArc.SQL.Add(' NAL_CODE='''+trim(FIB.pFIBQuery.FieldByName('NAL_CODE').AsString)+''',');
                         FIB.pFIBQueryArc.SQL.Add(' SHIFR_POD='+IntToStr(FIB.pFIBQuery.FieldByName('SHIFR_POD').AsInteger)+',');
                         FIB.pFIBQueryArc.SQL.Add(' DATA_PRI='+Trim(DataPriS)+',');
                         FIB.pFIBQueryArc.SQL.Add(' DATA_UW='+Trim(DataUwS));
                         FIB.pFIBQueryArc.SQL.Add(' where tabno='+IntToStr(FIB.pFIBQuery.FieldByName('TABNO').AsInteger));
                         try
                            FIB.pFIBQueryArc.ExecQuery;
                         except
                               ShowMessage('Ошибка обновления записи в кадрах архива ');
                               Exit;
                         end;
                    end
                 else
                    begin
                         if FIB.pFIBQueryArc.Open then
                            FIB.pFIBQueryArc.Close;
                         FIB.pFIBQueryArc.SQL.Clear;
                         FIB.pFIBQueryArc.SQL.Add('INSERT INTO  kadry (TABNO,FIO,NAL_CODE,SHIFR_POD,DATA_PRI,DATA_UW) VALUES(');
                         FIB.pFIBQueryArc.SQL.Add(IntToStr(FIB.pFIBQuery.FieldByName('TABNO').AsInteger)+',');
                         FIB.pFIBQueryArc.SQL.Add(''''+trim(FIO)+''',');
                         FIB.pFIBQueryArc.SQL.Add(''''+trim(FIB.pFIBQuery.FieldByName('NAL_CODE').AsString)+''',');
                         FIB.pFIBQueryArc.SQL.Add(IntToStr(FIB.pFIBQuery.FieldByName('SHIFR_POD').AsInteger)+',');
                         FIB.pFIBQueryArc.SQL.Add(trim(DataPriS)+','+trim(DataUwS)+')');
                         try
                            FIB.pFIBQueryArc.ExecQuery;
                         except
                               ShowMessage('Ошибка добавления записи в кадры');
                               Exit;
                         end;
                    end;
                 FIB.pFIBQuery.Next;
           end;

     except
           ShowMessage('Ошибка чтения записи из таблицы KADRY');
           Exit;
     end;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     if FIB.pFIBQueryArc.Open then
        FIB.pFIBQueryArc.Close;
     if FIB.pFIBQueryArc.Transaction.Active then
        FIB.pFIBQueryArc.Transaction.Commit;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;




end;


procedure TFormToSQL.BitBtnGenerClick(Sender: TObject);
begin
    if not needHideGenerMessages then
       if not YesNo('Перенести данные в оба архива с чисткой?') then Exit;
    CheckBoxClear.Checked := true;
    CheckBoxArc.Checked   := true;
    Application.ProcessMessages;
    AnalyzeIskra(false);
    CheckBoxArc.Checked   := false;
    Application.ProcessMessages;
    AnalyzeIskra(false);
    if not needHideGenerMessages then
       ShowMessage('Данные для генерации нового месяца перенесены.');
end;

end.
