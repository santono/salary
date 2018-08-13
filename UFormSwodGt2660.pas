unit UFormSwodGt2660;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery,SCrDef, DB, DBClient, frxClass, frxDBSet;

type
  TFormSwodGt2660 = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pFIBTransactionQ: TpFIBTransaction;
    pFIBQueryQ: TpFIBQuery;
    ProgressBar1: TProgressBar;
    cdsList: TClientDataSet;
    cdsListtabno: TIntegerField;
    cdsListFIO: TStringField;
    cdsListsumma: TFloatField;
    cdsListsumma_bud: TFloatField;
    cdsListsumma_vne: TFloatField;
    cdsListsumma_gn: TFloatField;
    cdsListsumma_nis: TFloatField;
    cdsListsumma_db: TFloatField;
    cdsListsumma_bud_db: TFloatField;
    cdsListsumma_vne_db: TFloatField;
    cdsListsumma_gn_db: TFloatField;
    cdsListsumma_nis_db: TFloatField;
    cdsListsumma_prev: TFloatField;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    cdsListy: TIntegerField;
    cdsListm: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
    limitsumma:Real;
    WantedYear:integer;
    WantedMonth:integer;
    WantedMode:integer;       { 1 за ; все остальноен в}
    procedure PrivateSwod;
    procedure addSummaToList(Curr_Person:PERSON_PTR;Curr_add:Add_Ptr);
    procedure FillFromDB;

  public
    { Public declarations }
  end;

var
  FormSwodGt2660: TFormSwodGt2660;

implementation
 uses UFIBModule,DateUtils,ComObj,ScrUtil,UFormWait,ScrIo;

{$R *.dfm}

 type PRec=^TRec;
      TRec=record
             tabno        : integer;
             m            : Integer;
             y            : Integer;
             summa        : real;
             summa_bud    : real;
             summa_gn     : real;
             summa_vne    : real;
             summa_nis    : real;
             summa_db     : real;
             summa_bud_db : real;
             summa_gn_db  : real;
             summa_vne_db : real;
             summa_nis_db : real;
             summa_prev   : Real;
           end;
  var list:TList;

procedure TFormSwodGt2660.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormSwodGt2660.addSummaToList(Curr_Person:PERSON_PTR;Curr_add:Add_Ptr);
 var finded:Boolean;
     rec:PRec;
     m,y:Integer;
     i:Integer;
 begin
     finded:=False;
     if  (isSVDN and
            IsOtherPeriodECBShifr(Curr_add^.shifr))
         or
         (isLNR and IsOtherPeriodECBShifrLNRForSwodGtLimit(Curr_add^.shifr))
             then
        begin
             m:=curr_add^.PERIOD;
             y:=curr_add^.YEAR+1990;
        end
     else
        begin
             m:=WantedMonth;
             y:=WantedYear;
        end;
     if list.Count>0 then
        for i:=0 to list.Count-1 do
            if Prec(list.Items[i]).tabno=Curr_Person.TABNO then
            if Prec(list.Items[i]).y=y then
            if Prec(list.Items[i]).m=m then
               begin
                    rec:=Prec(list.Items[i]);
                    finded:=True;
                    Prec(list.Items[i]).summa:=Prec(list.Items[i]).summa+curr_add^.SUMMA;
                    case getPersonBVGN(Curr_Person) of
                     2: rec.summa_vne := rec.summa_vne + curr_add^.summa;
                     3: rec.summa_gn  := rec.summa_gn  + curr_add^.summa;
                     4: rec.summa_nis := rec.summa_vne + curr_add^.summa;
                    else
                      rec.summa_bud := rec.summa_bud + curr_add^.summa;
                    end;

                    Break;
               end;
     if not finded then
        begin
             New(rec);
             FillChar(rec^,SizeOf(TRec),0);
             rec.tabno  := curr_person^.TABNO;
             rec.m      := m;
             rec.y      := y;
             rec.summa  := curr_add^.SUMMA;
             rec.summa_bud := 0;
             rec.summa_vne := 0;
             rec.summa_gn  := 0;
             rec.summa_nis := 0;

             rec.summa_db:=0;
             case getPersonBVGN(Curr_Person) of
              2: rec.summa_vne:=rec.summa;
              3: rec.summa_gn:=rec.summa;
              4: rec.summa_nis:=rec.summa;
              else
                 rec.summa_bud:=rec.summa;
              end;

             rec.summa_bud_db := 0;
             rec.summa_vne_db := 0;
             rec.summa_gn_db  := 0;
             rec.summa_nis_db := 0;
             list.Add(rec);
        end;
 end;

procedure TFormSwodGt2660.FillFromDB;
  var i:Integer;
      SQLStmnt,ds:string;
      v:Variant;
      summa,summa_bud,summa_vne,summa_gn,summaNis:Real;
  begin
       ProgressBar1.Visible:=true;
       ProgressBar1.Min:=0;
       ProgressBar1.Max:=list.count;
       ProgressBar1.Position:=0;
       ProgressBar1.Step:=1;
       Application.ProcessMessages;
       ds:=IntToStr(wantedYear)+'-'+intToStr(wantedMonth)+'-01';
       if list.count>0 then
          for i:=0 to list.Count-1 do
              begin
                    ProgressBar1.StepIt;
                    Application.ProcessMessages;
                    summa     := 0;
                    summa_bud := 0;
                    summa_vne := 0;
                    summa_gn  := 0;
                    summaNis  := 0;
                    SQLStmnt:='select first 1 summa,summa_bud,summa_vne,summa_gn from PR_GT_LIMIT_REC('+intToStr(pREC(list.Items[i]).tabno)+','+intToStr(pREC(list.Items[i]).y)+','+intToStr(pREC(list.Items[i]).m)+','''+ds+''')';
                    v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
                    if VarIsArray(v) then
                       begin
                           if VarIsNumeric(v[0]) then
                              summa:=v[0];
                           if VarIsNumeric(v[1]) then
                              summa_bud:=v[1];
                           if VarIsNumeric(v[2]) then
                              summa_vne:=v[2];
                           if VarIsNumeric(v[3]) then
                              summa_gn:=v[3];
                           pRec(list.Items[i]).summa_db     := summa;
                           pRec(list.Items[i]).summa_bud_db := summa_bud;
                           pRec(list.Items[i]).summa_vne_db := summa_vne;
                           pRec(list.Items[i]).summa_gn_db  := summa_gn;
                       end;

              end;
  end;

procedure TFormSwodGt2660.BitBtn1Click(Sender: TObject);
var E,WC:Variant;
    FName:String;
    ExRow,ExCol:integer;
    LineNo:integer;
begin
     WantedYear  := YearOf(DateTimePicker1.Date);
     WantedMonth := MonthOf(DateTimePicker1.Date);
     WantedMode  := RadioGroup1.ItemIndex;
     PrivateSwod;
     Exit;
     if (WantedMode<0) or (WantedMode>1) then
        WantedMode:=0;
     if (WantedMode=0) and (WantedMonth=NMES) and (WantedYear=CurrYear) then
        begin
             PrivateSwod;
             Exit;
        end;
     FName:=TemplateDIR+'L2660VY.xls';
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

     if not pFIBTransactionQ.Active then
        pFIBTransactionQ.StartTransaction;
     pFIBQueryQ.SQL.Clear;
     pFIBQueryQ.SQL.Add(' select TABNO,FIO,NAL_CODE,SUMMA,SUMMA_BUD,SUMMA_GN,SUMMA_VNE,SUMMA_PREV,PENSLIMIT from PR_GET_GT_2660('+IntToStr(WantedYear)+','+IntToStr(WantedMonth)+','+IntToStr(WantedMode)+')');
     try
        FormWait.Show;
        Application.ProcessMessages;
        pFIBQueryQ.ExecQuery;
        FormWait.Hide;
        Application.ProcessMessages;
        E.Visible:=True;
        E.WorkBooks.Open(FName);
        ExRow:=3;
        if WantedMode=1 then
           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:='сотрудников, начисления у которых за '+Trim(GetMonthRus(WantedMonth))+' '+IntToStr(WantedYear)+' г.'
        else
           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:='сотрудников, начисления у которых в '+Trim(GetMonthRus(WantedMonth))+' '+IntToStr(WantedYear)+' г.';
        LineNo:=0;
        ExRow:=8;
        while not pFIBQueryQ.Eof do
          begin
               Inc(LineNo);
               Inc(ExRow);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1].Select;
               E.Selection.EntireRow.Insert;
               WC:=E.ActiveCell;
{               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=LineNo;}
               WC.Value:=LineNo;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pFIBQueryQ.FieldByName('TABNO').AsInteger;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=trim(pFIBQueryQ.FieldByName('NAL_CODE').AsString);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=trim(pFIBQueryQ.FieldByName('FIO').AsString);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pFIBQueryQ.FieldByName('SUMMA').AsFloat;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pFIBQueryQ.FieldByName('SUMMA_BUD').AsFloat;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=pFIBQueryQ.FieldByName('SUMMA_GN').AsFloat;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=pFIBQueryQ.FieldByName('SUMMA_VNE').AsFloat;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]:=pFIBQueryQ.FieldByName('SUMMA_PREV').AsFloat;
               if LineNo=1 then
                  E.WorkBooks[1].WorkSheets[1].Cells[4,1]:='превысили '+FloatToStr(pFIBQueryQ.FieldByName('PENSLIMIT').AsFloat)+' грв.';
               pFIBQueryQ.Next;
          end;
     except
        ShowMessage('Ошибка выполнения запроса списка сотрудников');
     end;
     if pFIBQueryQ.Open then
        pFIBQueryQ.Close;
     if pFIBTransactionQ.Active then
        pFIBTransactionQ.Commit;

end;
 function Compare(Item1, Item2: Pointer): Integer;
  begin
       if PRec(Item1)^.Summa<PRec(Item2)^.Summa then Result:=1
                                                else
       if PRec(Item1)^.Summa>PRec(Item2)^.Summa then Result:=-1
                                                else Result:=0;
  end;


procedure TFormSwodGt2660.PrivateSwod;
 var NMESTemp,NSRVTemp,I,I_NSRV:integer;
     Curr_Person:Person_ptr;
     Curr_Add:Add_Ptr;
     SummaAdd:real;
     Rec:PRec;
     Done,Finded:boolean;
     FIO,Nal_Code:string;
     ExRow:integer;
     E,WC:variant;
     FName:string;
     SQLStmnt:string;
     v:Variant;
     summaPrevTot:Real;
     dt:TDateTime;
     testEmpty:Boolean;
 begin
      NMESTemp:=NMES;
      NSRVTemp:=NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      NMES:=WantedMonth;
      ProgressBar1.Visible:=true;
      Application.ProcessMessages;
      ProgressBar1.Min:=1;
      ProgressBar1.Max:=COUNT_SERV;
      List:=TList.Create;
      list.Clear;
      i_nsrv:=list.Count;
      summaPrevTot:=0;
      for i_nsrv:=1 to COUNT_SERV do
          begin
               ProgressBar1.Position:=ProgressBar1.Position+1;
               Application.ProcessMessages;
               NSRV:=I_NSRV;
               MKFLNM;
               if not FileExists(FNINF) then continue;
               GetInf(true);
               Curr_Person:=Head_Person;
               while (Curr_Person<>Nil) do
                    begin
//                      if curr_person^.tabno<>29 then
//                         begin
//                              Curr_Person:=Curr_Person^.Next;
//                              Continue;
//                         end;
//                      if curr_person^.tabno=9203 then
//                         summaadd:=0;
                         SummaAdd:=0;
                         Curr_Add:=Curr_Person^.Add;
                         while Curr_Add<>Nil do
                               begin
                                    addSummaToList(Curr_Person,curr_add);
                                    Curr_Add:=Curr_Add^.Next;
                               end;
                         Curr_Person:=Curr_Person^.Next;
                    end;
               EMPTY_ALL_PERSON;
          end;
      i_nsrv:=list.Count;

       FillFromDB;
      i_nsrv:=list.Count;

{ Получить лимит пенсионного }
      SQLStmnt:='select first 1 c.limitmax from sslimity c where c.datefr<='''+IntToStr(WantedYear)+'-'+IntToStr(WantedMonth)+'-01'' order by c.datefr desc';
      v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
      if VarIsNumeric(v) then
         limitSumma:=v;
      Done:=false;
      while not Done do
            begin
                 Done:=true;
                 if List.Count>0 then
                 for i:=0 to List.Count-1 do
                     begin
                          Rec:=List.Items[i];
                          if Rec.tabno=7622 then
                             done:=True;
                          if (Rec^.Summa+Rec^.summa_db)<LimitSumma then
                             begin
                                  Dispose(Rec);
                                  List.Delete(i);
                                  Done:=false;
                                  break;
                             end
                          else
                              if Rec^.summa_db>LimitSumma then
                                 rec^.summa_prev:=rec^.summa
                              else
                                Rec^.Summa_Prev:=(Rec^.Summa+Rec^.summa_db) - LimitSumma;
                         if Rec.summa_prev<0.1  then
                            begin
                                  Dispose(Rec);
                                  List.Delete(i);
                                  Done:=false;
                                  break;

                            end;
                     end;
            end;
      List.Sort(@Compare);
  {   Вывод в Ексел }

      if List.Count>0 then
         begin
              cdsList.Open;
              i:=0;
              testEmpty:=not cdsList.IsEmpty;
              while  testEmpty do
                begin
                     cdsList.First;
                     cdsList.Delete;
           //          cdsList.Post;
                     testEmpty:=not cdsList.IsEmpty;
                     Inc(i);
                     if (i>100000)  then
                        begin
                             ShowMessage('Не удалось очистить ClientDataSet');
                             Break;

                        end;
                end;
              summaPrevTot:=0;
              for i:=0 to list.Count-1 do
                  begin
                       cdsList.Append;
                       cdsListtabno.Value:=pRec(list.Items[i]).tabno;
                       cdsListFIO.Value:=GetFullUkrFioPerson(pRec(list.Items[i]).tabno);
                       cdsListy.Value:=pRec(list.Items[i]).y;
                       cdsListm.Value:=pRec(list.Items[i]).m;
                       cdsListsumma.Value:=pRec(list.Items[i]).summa;
                       cdsListsumma_bud.Value:=pRec(list.Items[i]).summa_bud;
                       cdsListsumma_vne.Value:=pRec(list.Items[i]).summa_vne;
                       cdsListsumma_gn.Value:=pRec(list.Items[i]).summa_gn;
                       cdsListsumma_nis.Value:=pRec(list.Items[i]).summa_nis;
                       cdsListsumma_db.Value:=pRec(list.Items[i]).summa_db;
                       cdsListsumma_bud_db.Value:=pRec(list.Items[i]).summa_bud_db;
                       cdsListsumma_vne_db.Value:=pRec(list.Items[i]).summa_vne_db;
                       cdsListsumma_gn_db.Value:=pRec(list.Items[i]).summa_gn_db;
                       cdsListsumma_nis_db.Value:=pRec(list.Items[i]).summa_nis_db;
                       cdsListsumma_prev.Value:=pRec(list.Items[i]).summa_prev;
                       summaPrevTot:=sum(summaPrevTot)+sum(pRec(list.Items[i]).summa_prev);
                       cdsList.Post;
                  end;
              if isSVDN then
                 begin
                      getSVDNFooterRec;
                      SVDNfooterRec.summa_gt_max_sal:=summaPrevTot;
                      dt:=Time;
                      SVDNfooterRec.dtsumma_gt_max_sal:=date;
                      SVDNfooterRec.dtsumma_gt_max_sal:=recodeTime(SVDNfooterRec.dtsumma_gt_max_sal,hourOf(dt),MinuteOf(dt),SecondOf(dt),0);
                      putSVDNFooterRec;
                 end;
              frxReport1.ShowReport();
              cdsList.Close;
(*
              FName:=TemplateDIR+'L2660VY.xls';
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
              if WantedMode=1 then
                 E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:='сотрудников, начисления у которых за '+Trim(GetMonthRus(WantedMonth))+' '+IntToStr(WantedYear)+' г.'
              else
                 E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:='сотрудников, начисления у которых в '+Trim(GetMonthRus(WantedMonth))+' '+IntToStr(WantedYear)+' г.';

              ExRow:=8;
              for i:=0 to List.Count-1 do
                  begin
//                       if pFIBQueryQ.Open then pFIBQueryQ.Close;
//                       pFIBQueryQ.SQL.Clear;
//                       pFIBQueryQ.SQL.Add('select first 1 FIO,NAL_CODE from kadry');
//                       pFIBQueryQ.SQL.Add(' where tabno='+IntToStr(PRec(List.Items[i])^.Tabno));
//                       try
//                          pFIBQueryQ.ExecQuery;
//                          FIO:=pFIBQueryQ.Fields[0].AsString;
//                          NAL_CODE:=pFIBQueryQ.Fields[1].AsString;
//                       except
//                          FIO:='Не нйден';
//                          NAL_CODE:='';
//                       end;
                       pFIBQueryQ.Close;
                       FIO:=GetFullUkrFioPerson(PRec(List.Items[i])^.Tabno);
                       NAL_CODE:=GetNal_CodePerson(PRec(List.Items[i])^.Tabno);
                       Inc(ExRow);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1].Select;
                       E.Selection.EntireRow.Insert;
                       WC:=E.ActiveCell;
              { E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=LineNo;}
                       WC.Value:=i+1;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=PRec(List.Items[i])^.Tabno;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=trim(NAL_CODE);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=trim(FIO);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=PRec(List.Items[i])^.Summa;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=PRec(List.Items[i])^.Summa_Bud;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=PRec(List.Items[i])^.Summa_GN;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=PRec(List.Items[i])^.Summa_VNE;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]:=PRec(List.Items[i])^.Summa_PREV;
                       if i=0 then
                          E.WorkBooks[1].WorkSheets[1].Cells[4,1]:='превысили '+FloatToStr(LimitSumma)+' грв.';
                  end;
*)
         end
      else
         begin
              ShowMessage('Нет сотрудников зарплата которых превышает установленный лимит '+FormatFloatPoint(limitsumma));
              if isSVDN then
                 begin
                      getSVDNFooterRec;
                      SVDNfooterRec.summa_gt_max_sal:=0.00;
                      dt:=Time;
                      SVDNfooterRec.dtsumma_gt_max_sal:=date;
                      SVDNfooterRec.dtsumma_gt_max_sal:=recodeTime(SVDNfooterRec.dtsumma_gt_max_sal,hourOf(dt),MinuteOf(dt),SecondOf(dt),0);
                      putSVDNFooterRec;
                 end;

         end;
//      if pFIBTransactionQ.Active then
//         pFIBTransactionQ.Commit;

      if List.Count>0 then
         for i:=0 to List.Count-1 do
            begin
                 Rec:=List.Items[i];
                 Dispose(Rec);
            end;
      List.Free;
      ProgressBar1.Visible:=false;
      Application.ProcessMessages;
      NMES:=NMESTemp;
      NSRV:=NSRVTemp;
      MKFLNM;
      GETINF(TRUE);
 end;


procedure TFormSwodGt2660.FormCreate(Sender: TObject);
begin
      ProgressBar1.Visible:=false;
      DateTimePicker1.Date:=Date;
      RadioGroup1.Hide;
      
end;

procedure TFormSwodGt2660.frxReport1GetValue(const VarName: String;
  var Value: Variant);
  var s:string;
begin
     if CompareText(varName,'LIMITSUMMA')=0 then
        begin
             Str(limitSumma:12:2,s);
             if isSVDN then
                s:='з сумою, яка перевищує '+trim(s)+' грн.'
             else
                s:='c суммой, превышающей '+trim(s)+' руб.';
             value:=Trim(s);
        end
     else
     if CompareText(varName,'CURRENTDATA')=0 then
        begin
             if isSVDN then
                s:='Перелік співробітників за '+getMonthUkr(wantedMonth)+' '+IntToStr(wantedYear)+' р.'
             else
                s:='Список сотрудников за '+getMonthRus(wantedMonth)+' '+IntToStr(wantedYear)+' г.';
//             S:=getMonthUkr(wantedMonth)+' '+IntToStr(wantedYear)+' р.';
             value:=Trim(s);
        end
end;

end.
