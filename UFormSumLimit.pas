unit UFormSumLimit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  StdCtrls, ComCtrls, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms, Buttons, DBClient,MidasLib;

type
  tModeSQL=(ModeVy,ModeZA,Mode2011);

  TFormSumLimit = class(TForm)
    pFIBdsZa: TpFIBDataSet;
    pFIBdsVy: TpFIBDataSet;
    pFIBtrZa: TpFIBTransaction;
    pFIBtrVy: TpFIBTransaction;
    dsoZa: TDataSource;
    dsoVY: TDataSource;
    pFIBdsZaTN: TFIBIntegerField;
    pFIBdsZaFIO: TFIBStringField;
    pFIBdsZaSZA: TFIBBCDField;
    pFIBdsVyTN: TFIBIntegerField;
    pFIBdsVyFIO: TFIBStringField;
    pFIBdsVySZA: TFIBBCDField;
    DateTimePicker1: TDateTimePicker;
    Button1: TButton;
    PageControl1: TPageControl;
    TabSheetZa: TTabSheet;
    TabSheetVy: TTabSheet;
    dxDBGridZa: TdxDBGrid;
    dxDBGridZaTN: TdxDBGridMaskColumn;
    dxDBGridZaFIO: TdxDBGridMaskColumn;
    dxDBGridZaSZA: TdxDBGridCurrencyColumn;
    dxDBGridVy: TdxDBGrid;
    dxDBGridVyTN: TdxDBGridMaskColumn;
    dxDBGridVyFIO: TdxDBGridMaskColumn;
    dxDBGridVySZA: TdxDBGridCurrencyColumn;
    pFIBds2011: TpFIBDataSet;
    pFIBTr2011: TpFIBTransaction;
    dso2011: TDataSource;
    pFIBds2011TABNO: TFIBIntegerField;
    pFIBds2011FIO: TFIBStringField;
    pFIBds2011SUMMA: TFIBBCDField;
    TabSheetVy2011: TTabSheet;
    dxDBGridVy2011: TdxDBGrid;
    dxDBGridVy2011TABNO: TdxDBGridMaskColumn;
    dxDBGridVy2011FIO: TdxDBGridMaskColumn;
    dxDBGridVy2011SUMMA: TdxDBGridCurrencyColumn;
    BitBtn1: TBitBtn;
    CDSVy: TClientDataSet;
    CDSVyTabno: TIntegerField;
    CDSVyFIO: TStringField;
    CDSVySumma: TFloatField;
    TabSheetCDSVY: TTabSheet;
    dxDBGridCDSVy: TdxDBGrid;
    dsoCDSVy: TDataSource;
    dxDBGridCDSVyTabno: TdxDBGridMaskColumn;
    dxDBGridCDSVyFIO: TdxDBGridMaskColumn;
    dxDBGridCDSVySumma: TdxDBGridMaskColumn;
    CDSZa: TClientDataSet;
    CDS2011: TClientDataSet;
    dsoCDS2011: TDataSource;
    CDSZaTabno: TIntegerField;
    CDSZaFIO: TStringField;
    CDSZaSummy: TFloatField;
    CDS2011Tabno: TIntegerField;
    CDS2011FIO: TStringField;
    CDS2011Summa: TFloatField;
    dsoCDSZa: TDataSource;
    TabSheetCDSZa: TTabSheet;
    TabSheetCDS2011: TTabSheet;
    dxDBGridCDSZa: TdxDBGrid;
    dxDBGridCDSZaTabno: TdxDBGridMaskColumn;
    dxDBGridCDSZaFIO: TdxDBGridMaskColumn;
    dxDBGridCDSZaSummy: TdxDBGridMaskColumn;
    dxDBGridCDS2011: TdxDBGrid;
    dxDBGridCDS2011Tabno: TdxDBGridMaskColumn;
    dxDBGridCDS2011FIO: TdxDBGridMaskColumn;
    dxDBGridCDS2011Summa: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure MakeCurrentSummy(WantedY:Integer;WantedM:Integer);
    function  FindRecInList(tabno:integer):pointer;
    procedure AddSummyFromDB(WantedY:Integer;WantedM:Integer;WantedDateS:string;CurrDateS:String;ModeSQL:tModeSQL=modeVY);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSumLimit: TFormSumLimit;

implementation
  uses uFIBModule,DateUtils,ScrDef,ScrUtil,UCDSFactory,ScrIo,UFormprogress,
       FIBQuery,pFIBProps,pFIBCacheQueries,uFormWait;

  type pPersonSummyRec = ^tPersonSummyRec;
       tPersonSummyRec = record
                          tabno     : Integer;
                          fio       : string;
                          summaza   : Real;
                          summavy   : Real;
                          summa2011 : Real;
                         end;

   var PersonSummyList : TList;
{$R *.dfm}

procedure TFormSumLimit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if CDSVy.Active then
        CDSVy.Close;
     if CDSZa.Active then
        CDSZa.Close;
     if CDS2011.Active then
        CDS2011.Close;
(*
     if pFIBdsZa.Active then
        pFIBdsZa.Close;
     if pFIBdsVy.Active then
        pFIBdsVy.Close;
     if pFIBds2011.Active then
        pFIBds2011.Close;
     if pFIBdsZa.Transaction.Active then
        pFIBdsZa.Transaction.Commit;
     if pFIBdsVy.Transaction.Active then
        pFIBdsVy.Transaction.Commit;
     if pFIBds2011.Transaction.Active then
        pFIBds2011.Transaction.Commit;
*)        
     Action:=caFree;
end;

procedure TFormSumLimit.Button1Click(Sender: TObject);
 var S:string;

begin
      BitBtn1Click(Sender);
      Exit;
 (*
     if (
        (FLOW_MONTH=MonthOf(DateTimePicker1.Date)) and
        (WORK_YEAR_VAL=YearOf(DateTimePicker1.Date))
        ) then
        TestCDSFull;
*)
     ShowMessage('Итоги будут корректными только после переноса данных в SAL1');
     S:=IntToStr(YearOf(DateTimePicker1.Date))+'-'+IntToStr(MonthOf(DateTimePicker1.Date))+'-'+IntToStr(DayOf(DateTimePicker1.Date));
     if pFIBdsZa.Active then
        pFIBdsZa.Close;
     if pFIBdsVy.Active then
        pFIBdsVy.Close;
     if pFIBds2011.Active then
        pFIBds2011.Close;
     pFIBdsZa.Params[0].AsInteger:=YearOf(DateTimePicker1.Date);
     pFIBdsZa.Params[1].AsInteger:=MonthOf(DateTimePicker1.Date);
     pFIBdsZa.Params[2].AsString:=S;
     pFIBdsVy.Params[0].AsInteger:=YearOf(DateTimePicker1.Date);
     pFIBdsVy.Params[1].AsInteger:=MonthOf(DateTimePicker1.Date);
     pFIBdsVy.Params[2].AsString:=S;
     pFIBds2011.Params[0].AsInteger:=YearOf(DateTimePicker1.Date);
     pFIBds2011.Params[1].AsInteger:=MonthOf(DateTimePicker1.Date);
     pFIBds2011.Params[2].AsString:=S;
     pFIBdsVy.Prepare;
     pFIBdsZa.Prepare;
     pFIBds2011.Prepare;
     pFIBdsVy.Open;
     pFIBdsZa.Open;
     pFIBds2011.Open;
end;

procedure TFormSumLimit.FormCreate(Sender: TObject);
begin
(*
     if pFIBdsZa.Transaction.Active then
        pFIBdsZa.Transaction.Commit;
     if pFIBdsVy.Transaction.Active then
        pFIBdsVy.Transaction.Commit;
     if pFIBds2011.Transaction.Active then
        pFIBds2011.Transaction.Commit;
     pFIBdsVy.Transaction.StartTransaction;
     pFIBdsZa.Transaction.StartTransaction;
     pFIBds2011.Transaction.StartTransaction;
*)
     TabSheetZa.TabVisible:=false;
     TabSheetvy.TabVisible:=false;              
     TabSheetVy2011.TabVisible:=false;
     DateTimePicker1.Date:=encodedate(curryear,nmes,1);
end;
function SortPersonRec(Item1, Item2: Pointer): Integer;
 var personSummyRec1,personSummyRec2 : pPersonSummyRec;
     retVal:Integer;
 begin
      if pPersonSummyRec(Item1).tabno>pPersonSummyRec(Item2).tabno then
         retVal:=1
      else if pPersonSummyRec(Item1).tabno<pPersonSummyRec(Item2).tabno then
         retVal:=-1
      else
         retVal:=0;
      sortPersonRec:=retVal;
 end;
function  TFormSumLimit.FindRecInList(tabno:integer):pointer;
  var retVal:Pointer;
      i : Integer;
  begin
       retVal := nil;
       if PersonSummyList.Count>0 then
          for i:=0 to PersonSummyList.Count-1 do
              begin
                   if pPersonSummyRec(PersonSummyList.Items[i]).tabno=tabno then
                      begin
                           retVal:=pPersonSummyRec(PersonSummyList.Items[i]);
                           Break;
                      end;
              end;
       FindRecInList:=retVal;
  end;


procedure TFormSumLimit.MakeCurrentSummy(WantedY:Integer;WantedM:Integer);
 var personSummyRec  : pPersonSummyRec;
     NSRVtmp,NMEStmp : Integer;
     I_NSRV      : Integer;
     curr_Person : PERSON_PTR;
     curr_add : ADD_PTR;
     isFirst  : Boolean;
     isSumma  : Real;
 begin
     NSRVtmp := NSRV;
     NMEStmp := NMES;
     putinf;
     LDEL_PERSON;
     Application.CreateForm(TFormProgress,FormProgress);
     FormProgress.Caption:='Формирование списка';
     FormProgress.Gauge.MinValue := 0;
     FormProgress.Gauge.MaxValue := Count_Serv;
     FormProgress.Gauge.Progress := 0;
     FormProgress.Show;
     PersonSummyList:=TList.Create;
     for I_NSRV:=1 to Count_Serv do
       begin
            NSRV := I_NSRV;
            MKFLNM;
            FormProgress.Gauge.Progress:=I_NSRV;
            FormProgress.LabelHeader.Caption:=name_serv(I_NSRV);
            FormProgress.Repaint;
            Formprogress.Refresh;
            Application.ProcessMessages;
            if not FileExists(fninf) then continue;
            GetInf(false);
            Curr_Person:=Head_Person;
            while (Curr_Person<>nil) do
              begin
                   FormProgress.LabelFooter.Caption:=Curr_Person.Fio+' ' +Curr_Person.Dolg;
                   Application.ProcessMessages;
                   isFirst:=true;
                   curr_add:=curr_Person.ADD;
                   while (Curr_Add<>nil) do
                    begin
                         isSumma := 0;
                         if (WantedM=NMES) and
                            (WantedY=CurrYear) then
                            isSumma:=Curr_Add^.SUMMA;
                         if (curr_add.period=WantedM) and
                            (curr_add.year+1990=WantedY) then
                            isSumma:=Curr_Add^.SUMMA;
                         if Abs(isSumma)<0.01 then
                            begin
                                 Curr_Add:=curr_add.NEXT;
                                 Continue;
                            end;
                         if (isFirst) then
                            begin
                                 PersonSummyRec:=pPersonSummyRec(FindRecInList(Curr_Person.tabno));
                                 if PersonSummyRec = nil then
                                    begin
                                         personSummyRec           := new(pPersonSummyRec) ;
                                         personSummyRec.Tabno     := curr_person.TABNO    ;
                                         personSummyRec.FIO       := curr_person.FIO      ;
                                         personSummyRec.SummaVy   := 0.00 ;
                                         personSummyRec.SummaZa   := 0.00 ;
                                         personSummyRec.Summa2011 := 0.00 ;
                                         PersonSummyList.Add(personSummyRec);
                                    end;
                                 isFirst:=false;
                            end;
                         if (WantedM=NMES) and (WantedY=CurrYear) then
                             personSummyRec.SummaVy   := personSummyRec.SummaVy + curr_add.summa;
                         if (curr_add.period=WantedM) and
                            (curr_add.year+1990=WantedY) then
                             personSummyRec.SummaZa   := personSummyRec.SummaZa + curr_add.summa;
                         if not isOtherPeriodECBShifr(Curr_Add.shifr) then
                            if (nmes=WantedM) and
                               (curryear=WantedY) then
                               personSummyRec.Summa2011 := personSummyRec.Summa2011 + curr_add.summa
                            else
                         else
                            if (curr_add.period=WantedM) and
                               (curr_add.year+1990=WantedY) then
                               personSummyRec.Summa2011 := personSummyRec.Summa2011 + curr_add.summa;
                         curr_add:=curr_add.NEXT;
                    end;
                   curr_Person:=curr_Person.NEXT;
              end;
       end;
     FormProgress.Hide;
     FormProgress.Free;
     PersonSummyList.Sort(@SortPersonRec);
  //   ShowMessage(IntToStr(PersonSummyList.Count));
     NSRV := NSRVtmp;
     NMES := NMEStmp;
     MKFLNM;

     getinf(true);


 end;

procedure TFormSumLimit.AddSummyFromDB(WantedY:Integer;WantedM:Integer;WantedDateS:string;CurrDateS:String;ModeSQL:tModeSQL=modeVY);
 var SQLStmnt:string;
     pFIBQ           : TFIBQuery;
     pFIBTransaction : TpFIBTransaction;
     Tabno:Integer;
     FIO:string;
     Summa:Real;
     PersonSummyRec:pPersonSummyRec;

 begin
      if ModeSQL=ModeZA then //ZA
        begin
            SQLStmnt:='select tn,fio,sza from  (';
            SQLStmnt:=Trim(SQLStmnt)+'select a.tabno tn,a.fio fio,coalesce((';
            SQLStmnt:=Trim(SQLStmnt)+'select sum(coalesce(b.summa,0.00)) from fadd b where b.tabno=a.tabno and b.year_za=:y and b.month_za=:m';
            SQLStmnt:=Trim(SQLStmnt)+' and cast((b.year_vy||''-''||b.month_vy||''-01'') as date)<:dateCurr';
            SQLStmnt:=Trim(SQLStmnt)+'),0.00) sza from kadry a group by 1,2 ) where abs(sza)>0.01';
        end
      else
      if ModeSQL=Mode2011 then //2011
        begin
            SQLStmnt:='select tn,fio,sza from  (';
            SQLStmnt:=Trim(SQLStmnt)+'select a.tabno tn,a.fio fio,coalesce((';
            SQLStmnt:=Trim(SQLStmnt)+'select sum(coalesce(b.summa,0.00)) from fadd b where b.tabno=a.tabno and abs(b.summa)>0.01';
            SQLStmnt:=Trim(SQLStmnt)+' and cast((b.year_vy||''-''||b.month_vy||''-01'') as date)<:dateCurr';
            SQLStmnt:=Trim(SQLStmnt)+' and (';
            SQLStmnt:=Trim(SQLStmnt)+' (b.year_vy=:y  and';
            SQLStmnt:=Trim(SQLStmnt)+' b.month_vy=:m and';
            SQLStmnt:=Trim(SQLStmnt)+'(select first 1 d.retval from pr_isotherperiodecbshifr(b.shifrsta) d)=0';
            SQLStmnt:=Trim(SQLStmnt)+') or';
            SQLStmnt:=Trim(SQLStmnt)+' (b.year_za=:y  and';
            SQLStmnt:=Trim(SQLStmnt)+' b.month_za=:m and';
            SQLStmnt:=Trim(SQLStmnt)+' (select first 1 e.retval from pr_isotherperiodecbshifr(b.shifrsta) e)=1';
            SQLStmnt:=Trim(SQLStmnt)+'))),0.00) sza from kadry a ';
            SQLStmnt:=Trim(SQLStmnt)+' group by 1,2';
            SQLStmnt:=Trim(SQLStmnt)+') where abs(sza)>0.01';
        end
      else
        begin   //VY
            SQLStmnt:='select tn,fio,sza from  (';
            SQLStmnt:=Trim(SQLStmnt)+'select a.tabno tn,a.fio fio,coalesce((';
            SQLStmnt:=Trim(SQLStmnt)+'select sum(coalesce(b.summa,0.00)) from fadd b where b.tabno=a.tabno and b.year_vy=:y and b.month_vy=:m';
            SQLStmnt:=Trim(SQLStmnt)+' and cast((b.year_vy||''-''||b.month_vy||''-01'') as date)<:dateCurr';
            SQLStmnt:=Trim(SQLStmnt)+'),0.00) sza from kadry a group by 1,2 ) where abs(sza)>0.01';
        end;
      pFIBTransaction := TpFIBTransaction.Create(Nil);
      pFIBTransaction.DefaultDatabase:=FIB.pFIBDatabaseSal;
      pFIBTransaction.TPBMode:=tpbDefault;
      pFIBTransaction.TRParams.Clear;
      pFIBTransaction.TRParams.Add('isc_tpb_read');
      pFIBTransaction.TRParams.Add('isc_tpb_nowait');
      pFIBTransaction.TRParams.Add('isc_tpb_rec_version');
      pFIBTransaction.TRParams.Add('isc_tpb_read_committed');
      pFIBTransaction.Name:='tr';
      pFIBQ:=GetQueryForUse(pFIBTransaction,SQLStmnt);
      pFIBQ.Transaction.StartTransaction;
      pFIBQ.ParamByName('y').AsInteger := WantedY;
      pFIBQ.ParamByName('m').AsInteger := WantedM;
      pFIBQ.ParamByName('dateCurr').AsString  := CurrDateS;
      pFIBQ.ExecQuery;
      while  not pFIBQ.Eof do
           begin
                 Tabno := pFIBQ.Fields[0].AsInteger;
                 FIO   := pFIBQ.Fields[1].AsString;
                 Summa := pFIBQ.Fields[2].AsFloat;
                 PersonSummyRec:=pPersonSummyRec(FindRecInList(tabno));
                 if PersonSummyRec = nil then
                    begin
                         personSummyRec           := new(pPersonSummyRec) ;
                         personSummyRec.Tabno     := TABNO    ;
                         personSummyRec.FIO       := FIO      ;
                         personSummyRec.SummaVy   := 0.00 ;
                         personSummyRec.SummaZa   := 0.00 ;
                         personSummyRec.Summa2011 := 0.00 ;
                         PersonSummyList.Add(personSummyRec);
                    end;
                 case (ModeSql) of
                   ModeZA : personSummyRec.SummaZa:=personSummyRec.SummaZa + Summa;
                   ModeVY : personSummyRec.SummaVy:=personSummyRec.SummaVy + Summa;
                   else
                            personSummyRec.Summa2011:=personSummyRec.Summa2011 + Summa;
                 end;
                 pFIBQ.Next;
           end;
      pFIBQ.Transaction.Commit;
      pFIBTransaction.Free;

 end;

procedure TFormSumLimit.BitBtn1Click(Sender: TObject);
var S,SCurr:string;
    y,m:Integer;
    SummaLimit,SummaLimitTot:Real;
    SQLStmnt:string;
    i:Integer;
    Finished:Boolean;
begin
     MakeCurrentSummy(YearOf(DateTimePicker1.Date),MonthOf(DateTimePicker1.Date));
     S:=IntToStr(YearOf(DateTimePicker1.Date))+'-'+IntToStr(MonthOf(DateTimePicker1.Date))+'-'+IntToStr(DayOf(DateTimePicker1.Date));
     SCurr:=IntToStr(WORK_YEAR_VAL)+'-'+IntToStr(NMES)+'-01';
     y:=YearOf(DateTimePicker1.Date);
     m:=MonthOf(DateTimePicker1.Date);
     FormWait.Show;
     AddSummyFromDB(y,m,S,SCurr,ModeZa);
     AddSummyFromDB(y,m,S,SCurr,ModeVy);
     AddSummyFromDB(y,m,S,SCurr,Mode2011);
     SQLStmnt:='select first 1  c.minsal from sslimity c where  c.datefr<'''+S+''' order by c.datefr desc';
     SummaLimit:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     SummaLimitTot:=SummaLimit*15;
     repeat
           Finished:=True;
           for i:=0 to PersonSummyList.Count-1 do
               begin
                    if (pPersonSummyRec(PersonSummyList.Items[i]).summaza<SummaLimitTot) and
                       (pPersonSummyRec(PersonSummyList.Items[i]).summavy<SummaLimitTot) and
                       (pPersonSummyRec(PersonSummyList.Items[i]).summa2011<SummaLimitTot) then
                      begin
                           Dispose(pPersonSummyRec(PersonSummyList.Items[i]));
                           PersonSummyList.Delete(i);
                           Finished:=False;
                           Break;
                      end
               end;
     until Finished;
     FormWait.Hide;
     if PersonSummyList.Count=0 then
        begin
             ShowMessage('Нет превышений суммы '+FloatToStr(SummaLimitTot)+' '+getShortCurrencyName);;
        end
     else
        begin
           if CDSVy.Active then
              CDSVy.Close;
           if CDSZa.Active then
              CDSZa.Close;
           if CDS2011.Active then
              CDS2011.Close;
           CDSVy.Open;
           CDSZa.Open;
           CDS2011.Open;
           CDSVy.EmptyDataSet;
           CDSZa.EmptyDataSet;
           CDS2011.EmptyDataSet;

           for i:=0 to PersonSummyList.Count-1 do
               begin
                    if (pPersonSummyRec(PersonSummyList.Items[i]).summavy>SummaLimitTot) then
                      begin
                           CDSVy.Insert;
                           CDSVyTabno.Value:=pPersonSummyRec(PersonSummyList.Items[i]).Tabno;
                           CDSVyFIO.Value:=pPersonSummyRec(PersonSummyList.Items[i]).FIO;
                           CDSVySumma.Value:=pPersonSummyRec(PersonSummyList.Items[i]).SummaVy;
                           CDSVy.Post;
                      end;
                    if (pPersonSummyRec(PersonSummyList.Items[i]).summaza>SummaLimitTot) then
                      begin
                           CDSZa.Insert;
                           CDSZaTabno.Value:=pPersonSummyRec(PersonSummyList.Items[i]).Tabno;
                           CDSZaFIO.Value:=pPersonSummyRec(PersonSummyList.Items[i]).FIO;
                           CDSZaSummy.Value:=pPersonSummyRec(PersonSummyList.Items[i]).SummaZa;
                           CDSZa.Post;
                      end;
                    if (pPersonSummyRec(PersonSummyList.Items[i]).summa2011>SummaLimitTot) then
                      begin
                           CDS2011.Insert;
                           CDS2011Tabno.Value:=pPersonSummyRec(PersonSummyList.Items[i]).Tabno;
                           CDS2011FIO.Value:=pPersonSummyRec(PersonSummyList.Items[i]).FIO;
                           CDS2011Summa.Value:=pPersonSummyRec(PersonSummyList.Items[i]).Summa2011;
                           CDS2011.Post;
                      end
               end;
           for i:=0 to PersonSummyList.Count-1 do
               Dispose(pPersonSummyRec(PersonSummyList.Items[i]));

        end;
     PersonSummyList.Free;

end;

end.
