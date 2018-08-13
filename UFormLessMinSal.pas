{$H+}
unit UFormLessMinSal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, frxClass, frxDBSet, DB, DBClient,
  frxExportRTF, frxExportXLS,scrdef, frxExportPDF, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, dxExEdtr, ExtCtrls, DBCtrls,
  dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, FIBSQLMonitor;

type
  TFormLessMinSal = class(TForm)
    pb1: TProgressBar;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dsTest: TClientDataSet;
    dsTestshifrPod: TIntegerField;
    dsTesttabno: TIntegerField;
    frxrprt1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dsTestsumma: TFloatField;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    dsTestsummaOtp: TFloatField;
    Btn24_01_2015: TBitBtn;
    frxReport2: TfrxReport;
    dsTestfio: TStringField;
    dsTesty: TIntegerField;
    dsTestm: TIntegerField;
    dsTestsumma_bd: TFloatField;
    dsTestsumma_razn: TFloatField;
    frxPDFExport1: TfrxPDFExport;
    cbFullTime: TCheckBox;
    cbFuture: TCheckBox;
    dsTestwd: TIntegerField;
    dsTestkoef: TFloatField;
    BitBtnBrowse: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure frxrprt1GetValue(const VarName: String; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure frxReport2GetValue(const VarName: String;
      var Value: Variant);
    procedure Btn24_01_2015Click(Sender: TObject);
    function buildListForAlla:tList;
    procedure FIBSQLMonitor1SQL(EventText: String; EventTime: TDateTime);
    procedure BitBtnBrowseClick(Sender: TObject);

  private
    { Private declarations }
      wantedMonth:Integer;
      wantedYear:Integer;
      procedure makeTesting;
      procedure makeTestingAlla;
      procedure FillFromDB(list:TList);
      procedure AddSummaFromAdd(List:TList;Curr_Person:PERSON_PTR;Curr_Add:ADD_PTR);

  public
    { Public declarations }
  end;

var
  FormLessMinSal: TFormLessMinSal;
  type prec=^trec;
       trec=record
            tabno      : Integer;
            y          : Integer;
            m          : Integer;
            summa      : Real;
            summaOtp   : Real;
            summa_db   : real;
            summa_razn : Real;
            shifrpod   : Integer;
            isKompens  : Boolean;
            workDay    : Integer;
            koef       : real;
           end;

   var dev:TextFile;        

implementation
  uses ScrUtil,scrio, UFibModule,UFormProgress,dateutils,UFormMinZP,
       uFormMkPensList;
  var List : TList;

  procedure TFormLessMinSal.AddSummaFromAdd(List:TList;Curr_Person:PERSON_PTR;Curr_Add:ADD_PTR);
    var finded : Boolean;
        rec    : prec;
        i      : Integer;
        y,m    : Integer;
    begin
          finded:=False;
          if IsOtherPeriodForMinSal(Curr_add^.shifr) then
             begin
                  m := curr_add^.PERIOD;
                  y := curr_add^.YEAR+1990;
             end
          else
             begin
                  m := WantedMonth;
                  y := WantedYear;
             end;

          if List.count>0 then
             for i:=0 to List.Count-1 do
                 begin
                      if prec(List.Items[i]).tabno=Curr_Person.TABNO then
                      if prec(List.Items[i]).y = y then
                      if prec(List.Items[i]).m = m then
                         begin
                              prec(List.Items[i]).summa := prec(List.Items[i]).summa+curr_add.SUMMA;
                              if Curr_Person.WID_RABOTY=1 then
                                 begin
                                      prec(List.Items[i]).workDay:= (WORK_DAY(1,31,curr_person));
                                      prec(List.Items[i]).koef:= GET_KOEF_OKLAD_CLEAR_PERSON(curr_person);
                                 end;
                              finded := True;
                              break
                         end;
                 end;
          if not finded then
             begin
                  New(rec);
                  rec.tabno      := curr_person.tabno;
                  rec.y          := y;
                  rec.m          := m;
                  rec.summa      := curr_add^.SUMMA;
                  rec.shifrpod   := NSRV;
                  rec.summaOtp   := 0;
                  rec.isKompens  := false;
                  rec.summa_db   := 0;
                  rec.summa_razn := 0;
                  rec.workDay    := 0;
                  rec.koef       := 0;
                  if Curr_Person.WID_RABOTY=1 then
                     rec.koef:=GET_KOEF_OKLAD_CLEAR_PERSON(curr_person);
                  if Curr_Person.WID_RABOTY=1 then
                     rec.workDay:=WORK_DAY(1,31,curr_person);
                  list.Add(rec);
             end;
    end;
  procedure AddSumma(list:TList;Curr_Person:PERSON_PTR;Summa:real);
    var finded : Boolean;
        rec    : prec;
        i      : Integer;
    begin
          finded:=False;
          if List.count>0 then
             for i:=0 to List.Count-1 do
                 begin
                      if prec(List.Items[i]).tabno=Curr_Person.TABNO then
                         begin
                              prec(List.Items[i]).summa:=prec(List.Items[i]).summa+summa;
                              finded:=True;
                              break
                         end;
                 end;
          if not finded then
             begin
                  New(rec);
                  rec.tabno    := curr_person.tabno;
                  rec.summa    := SUMMA;
                  rec.shifrpod := NSRV;
                  rec.summaOtp := 0;
                  rec.isKompens := false;
                  list.Add(rec);
             end;
    end;
  procedure MarkKompens(list:TList;Curr_Person:PERSON_PTR);
    var finded : Boolean;
        rec    : prec;
        i      : Integer;
    begin
          finded:=False;
          if List.count>0 then
             for i:=0 to List.Count-1 do
                 begin
                      if prec(List.Items[i]).tabno=Curr_Person.TABNO then
                         begin
                              prec(List.Items[i]).isKompens:=true;
                              finded:=True;
                              break
                         end;
                 end;
          if not finded then
             begin
                  New(rec);
                  rec.tabno    := curr_person.tabno;
                  rec.summa    := 0;
                  rec.shifrpod := NSRV;
                  rec.summaOtp := 0;
                  rec.isKompens := true;
                  list.Add(rec);
             end;
    end;

procedure deleteWithKompens(list:TList);
 var i,j:Integer;
     finished:Boolean;
 begin
     j:=0;
     repeat
           finished:=True;
           if List.count>0 then
           for i:=0 to list.count-1 do
               begin
                    if prec(List.Items[i]).tabno=9759 then
                       j:=1;
                    if prec(List.Items[i]).isKompens then
                       begin
                            List.Delete(i);
                            finished:=False;
                            Break;
                       end;
               end;
     until finished;

 end;
procedure deleteWithSalGtMinSal(list:TList);
 var i,j:Integer;
     finished:Boolean;
     minSalSumma,summa:Real;
     summaTotPerson:real;
 begin
     j:=0;
     minSalSumma:=GET_MIN_SALARY(curryear,nmes);
     repeat
           finished:=True;
           if List.count>0 then
           for i:=0 to list.count-1 do
               begin
                    summa:=prec(List.Items[i]).summa;
                    summaTotPerson:=summa+prec(List.Items[i]).summa_db;
                    if ((Abs(summaTotPerson)>0.01) and (Abs(summaTotPerson)>=minSalSumma)) then
                       begin
                    if prec(List.Items[i]).tabno=9759 then
                       j:=1;
                            List.Delete(i);
                            finished:=False;
                            Break;
                       end;
               end;
     until finished;

 end;

 {$R *.dfm}

procedure TFormLessMinSal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormLessMinSal.makeTesting;
  var tmpNMES , tmpNSRV , i_nsrv , i : Integer;
      Curr_Person : PERSON_PTR;
      Curr_Add    : Add_Ptr;
      Count       : Integer;
      fio         : string;
      v           : Variant;
      SQLStmnt    : string;
      summa,minsalsumma,summaOtp:Real;
  begin
       tmpNMES := NMES;
       tmpNSRV := NSRV;
       putinf;
       EMPTY_ALL_PERSON;
       pb1.Max      := Count_Serv;
       pb1.Min      := 0;
       pb1.Position := 0;
       COUNT        := 0;
       list   := TList.Create;
       for i_nsrv:=1 to Count_Serv do
           begin
                pb1.Position := i_nsrv ;
                lbl1.Caption := Name_Serv(i_nsrv);
                Application.ProcessMessages ;
                nsrv:=i_nsrv;
                mkflnm;
                if not FileExists(fninf) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (Curr_Person<>Nil) do
                  begin
                       curr_Add:=curr_person.Add;
                       while (Curr_Add<>Nil) do
                         begin
                              AddSummaFromAdd(List,Curr_Person,Curr_Add);
                              Curr_Add:=Curr_Add.Next;
                         end;
                       Curr_Person:=Curr_Person.NEXT;
                  end;
                EMPTY_ALL_PERSON;

           end;
       if List.Count>0 then
          begin
              minsalsumma:=GET_MIN_SALARY(CURRYEAR,NMES);
              dsTest.Open;
              for i:=0 to list.count-1 do
                  begin
                       summaOtp:=0;
                       summa:=prec(List.Items[i]).summa;
                       if ((Abs(summa)>0.01) and (Abs(summa)<minSalSumma)) then
                          begin
                    //          SQLStmnt:='select sum(summa) from fadd a where a.tabno='+IntToStr(prec(List.Items[i]).tabno)+' and a.year';
                              SQLStmnt:='select coalesce(sum(coalesce(summa,0)),0) from fadd a where a.tabno='+IntToStr(prec(List.Items[i]).tabno)+' and a.year_za='+IntToStr(CURRYEAR)+' and a.month_za='+intToStr(nmes)+' and a.month_vy<>'+intToStr(nmes)+' and a.shifrsta in (5,6,20)';
                              v:=fib.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
                              if VarIsNumeric(v) then
                                 summaOtp:=v;
                              if ((Abs(summa+summaOtp)>0.01) and (Abs(summa+summaOtp)<minSalSumma)) then
                                 begin
                                       dstest.Append;
                                       dsTestshifrPod.Value:=prec(List.Items[i]).shifrpod;
                                       dsTesttabno.Value:=prec(List.Items[i]).tabno;
                                       dsTestsumma.Value:=prec(List.Items[i]).summa+summaOtp;
                                       dsTestsummaOtp.Value:=summaOtp;
                                       dsTestfio.Value:=GetFullUkrFioPerson(dsTesttabno.Value);
                                       dstest.Post;
                                 end
                          end
                  end;
              for i:=0 to List.Count-1 do
                  Dispose(pRec(List.Items[i]));
              List.Free;
              frxrprt1.ShowReport;
              dsTest.Close;
          end
        //  ShowMessage('Найдено '+intToStr(Count)+' несоответствий')
       else
          ShowMessage('Не найдено сотрудников ');
       NMES := tmpNMES;
       NSRV := tmpNSRV;
       mkflnm;
       getInf(true);

  end;


procedure TFormLessMinSal.btn1Click(Sender: TObject);
begin
     makeTesting;
     Close;
end;

procedure TFormLessMinSal.frxrprt1GetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthRus(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          Value:=IntToStr(CURRYEAR)+' г.';
end;

procedure TFormLessMinSal.FormCreate(Sender: TObject);
begin
      wantedYear:=CURRYEAR;
      wantedMonth:=NMES;
      lbl1.Caption:='';
      if isLNR then
         begin
              btn1.Show;
              btn1.Enabled:=True;
              Btn24_01_2015.Hide;
              Btn24_01_2015.Enabled:=false;
              BitBtnBrowse.Hide;
              BitBtnBrowse.Enabled:=false;
         end
      else
         begin
              btn1.Hide;
              btn1.Enabled:=false;
              Btn24_01_2015.Show;
              Btn24_01_2015.Enabled:=true;
              BitBtnBrowse.Show;
              BitBtnBrowse.Enabled:=true;

         end;
       cbFuture.Checked:=True;
       cbFullTime.Checked:=True;

end;

procedure TFormLessMinSal.FillFromDB(list:TList);
  var i:Integer;
      SQLStmnt,ds:string;
      v:Variant;
      summa:Real;
      s:string;
  begin
       pb1.Visible:=true;
       pb1.Min:=0;
       pb1.Max:=list.count;
       pb1.Position:=0;
       pb1.Step:=1;
       Application.ProcessMessages;
       ds:=IntToStr(wantedYear)+'-'+intToStr(wantedMonth)+'-01';
       if list.count>0 then
          for i:=0 to list.Count-1 do
              begin
                    pb1.StepIt;
                    Application.ProcessMessages;
                    summa     := 0;
                    if pREC(list.Items[i]).tabno=8576 then
                       summa :=0;
                    s:=fib.pFIBDatabaseSal.DBFileName;   
                    SQLStmnt:='select first 1 summa from PR_GT_LIMIT_REC('+intToStr(pREC(list.Items[i]).tabno)+','+intToStr(pREC(list.Items[i]).y)+','+intToStr(pREC(list.Items[i]).m)+','''+ds+''')';
                    v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
                    if VarIsNumeric(v) then
                       begin
                           if pREC(list.Items[i])^.tabno=9759 then
                              summa:=v;
                           summa:=v;
                           pRec(list.Items[i]).summa_db     := summa;
                       end;

              end;
  end;

function TFormLessMinSal.buildListForAlla:tList;
  var list:TList;
      tmpNMES , tmpNSRV , i_nsrv , i : Integer;
      Curr_Person : PERSON_PTR;
      Curr_Cn     : Cn_Ptr;
      Curr_Add    : Add_Ptr;
      Count       : Integer;
      summa,minsalsumma,summaOtp:Real;
      tn:Integer;
      p:Boolean;
      d:Integer;
     
    function isShifrKompens(Curr_Person:Person_Ptr):Boolean;
     var retVal:Boolean;
         curr_add:Add_PTR;
     begin
         retVal:=False;
         curr_add:=curr_person^.add;
         while (curr_add<>nil) do
           begin
                if (curr_add^.shifr=NOT_USE_HOLIDAY_SHIFR) then
                //    (curr_add^.shifr=PerersZaProshlPeriody)) then
                   begin
                        markKompens(List,Curr_Person);
                        retVal:=True;
                        Break;
                   end;
                curr_add:=curr_ADD^.next;
           end;

         isShifrKompens:=retVal;
     end;
    function futureDate(Curr_Add:add_ptr):Boolean;
     var res:Boolean;
     begin
          res:=False;
          if (curr_add^.YEAR+1990>wantedYear) or
             (
              (curr_add^.YEAR+1990=wantedYear) and
              (curr_add^.PERIOD>wantedMonth)
             ) then
            res:=True;
          futureDate:=Res;
     end;

    function IS_OTP_BEZ_OPLATY(curr_person:person_ptr):boolean;
     var res:Boolean;
         i:integer;
         l:Integer;
         dt:TDateTime;
     begin
          res:=False;
//          dt:=EncodeDate(wantedYear,wantedMonth,1);
//          i:=LenMonth(dt);
//          for i:=1 to LenMonth(dt) do
//              if Curr_Person.tabel[i]=OTPUSK_BEZ_OPLATY then
//                 begin
//                      res:=True;
//                      Break;
//                 end;
          IS_OTP_BEZ_OPLATY:=res;
      end;
    function IS_NEZAPOLN_TABEL(curr_person:person_ptr):boolean;
     var res:Boolean;
         i:integer;
         l:Integer;
         dt:TDateTime;
     begin
          res:=False;
          dt:=EncodeDate(wantedYear,wantedMonth,1);
          i:=LenMonth(dt);
          for i:=1 to LenMonth(dt) do
              if Curr_Person.tabel[i]=NEZAPOLN then
                 begin
                      res:=True;
                      Break;
                 end;
          IS_NEZAPOLN_TABEL:=res;
      end;


  begin
       tmpNMES := NMES;
       tmpNSRV := NSRV;
       putinf;
       EMPTY_ALL_PERSON;
       COUNT        := 0;
       list         := TList.Create;
       MAKEPENSLIST(2); //Создать список инвалидов
       Application.CreateForm(TFormProgress,formProgress);
       FormProgress.Show;
       FormProgress.Gauge.MinValue:=0;
       FormProgress.Gauge.MaxValue:=count_Serv;
       FormProgress.Gauge.Progress:=0;
       FormProgress.Caption:='Создание списка сотрудников с з.п. < мин  ';
       FormProgress.LabelHeader.Caption:='';
       FormProgress.LabelFooter.Caption:='';
       for i_nsrv:=1 to Count_Serv do
           begin

                FormProgress.Gauge.Progress := i_nsrv ;
       //         FormProgress.Caption := Name_Serv(i_nsrv);
                FormProgress.LabelHeader.Caption:=Name_Serv(i_nsrv);
                Application.ProcessMessages ;
                if isSVDN then
                if ( //(i_nsrv=11)  or
      //               (i_nsrv=115) or
                     (i_nsrv=121) or
                     (i_nsrv=82)) then Continue;
                nsrv:=i_nsrv;
                mkflnm;
                if not FileExists(fninf) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (Curr_Person<>Nil) do
                  begin
                       tn:=curr_person^.TABNO;
                       if tn=9759 then
                          tn:=curr_person^.TABNO;
(*
                       if isSVDN then
                          if False and (
                            (tn=11621) or
                            (tn=11530) or
                            (tn= 6560) or
                            (tn= 1242) or
                            (tn=  479) or
                            (tn= 9168) or
                            (tn=   18) or
                            (tn= 5470) or
                            (tn= 2995) or
                            (tn= 6911) or
                            (tn= 3353) or
                            (tn=11786) or
                            (tn=  567) or
                            (tn=11814) or
                            (tn=11668) or
                            (tn= 5724) or
                            (tn= 2017) or
                            (tn= 3222) or
                            (tn= 5396) or
                            (tn=   80) or
                            (tn= 7344) or
                            (tn= 2617) or
                            (tn=   30) or
                            (tn=11601) or
                            (tn=11738)  or
                            (tn=11639)  or
                            (tn=11726)  or
                            (tn=11024)  or
                            (tn=11672)  or
                            (tn=11461)  or
                            (tn=11673)
                            )
                             then
                          begin
                               Curr_Person:=Curr_Person^.NEXT;
                               Continue;
                          end;
                       if isShifrKompens(Curr_Person) then
                          begin
                               Curr_Person:=Curr_Person^.NEXT;
                               Continue;
                          end;

                       if (isUwolenFromSQL(Curr_Person) or
                           IS_PRINAT_UWOLEN(Curr_Person) or
                           STORONNEE_PODRAZD(curr_person^.MESTO_OSN_RABOTY) or
                           DOG_POD_PODRAZD(curr_person^.MESTO_OSN_RABOTY)) then
                          begin
                               Curr_Person:=Curr_Person^.NEXT;
                               Continue;
                          end;
                       if (isLNR and (getSummaAddForPerson(Curr_person)<0.0001))
                          or
                          (isSVDN and (getSummaAddForThisMonthForPerson(Curr_person)<0.0001)) then
                          begin
                               Curr_Person:=Curr_Person^.NEXT;
                               Continue;
                          end;
                       summa:=Curr_person^.OKLAD;

                       curr_cn:=curr_person.cn;
                       while (Curr_CN<>Nil) do
                         begin
                              if Curr_cn^.AUTOMATIC=automatic_mode then
                              if Curr_cn^.kod in [2,4,6] then
                                 summa:=R10(summa)+r10(curr_person^.oklad*curr_cn^.summa/100.00)
                              else
                              if Curr_cn^.kod in [1,3,5] then
                                 summa:=R10(summa)+r10(curr_cn^.summa);

                              Curr_cn:=Curr_cn.Next;
                         end;
                       AddSumma(List,Curr_Person,Summa);
                       curr_Add:=curr_person.Add;
                       while (Curr_Add<>Nil) do
                         begin
                              if Curr_Add^.SHIFR in [2,156] then
                                 AddSummaFromAdd(List,Curr_Person,Curr_Add);
                              Curr_Add:=Curr_Add.Next;
                         end;
*)
                       if ((Curr_person^.WID_RABOTY=2) and
                           (Curr_person^.MESTO_OSN_RABOTY=82)) then
                          begin
                               curr_person:=curr_person^.NEXT;
                               Continue;
                          end;
                       if Curr_Person.tabno=11945 then
                          begin
                               p:=isPrinjatFromSQL(Curr_Person);
                               d:=getDayOfPriFromSQL(Curr_Person);
                          end;
                       // Проверить инвалидов   
                       if PensionerList.IsPensioner(Curr_Person^.Tabno) then
                          begin
                               curr_person:=curr_person^.NEXT;
                               Continue;
                          end;
                       if (isUwolenFromSQLForNMES(Curr_Person) or
                           IS_PRINAT_UWOLEN(Curr_Person) or
                           STORONNEE_PODRAZD(curr_person^.MESTO_OSN_RABOTY) or
                           DOG_POD_PODRAZD(curr_person^.MESTO_OSN_RABOTY) or
                           IS_OTP_BEZ_OPLATY(curr_person) or
                           IS_NEZAPOLN_TABEL(curr_person) or
                           (
                            (isPrinjatFromSQLForNMES(Curr_Person)) and
                            (getDayOfPriFromSQLForNMES(Curr_Person)>1)
                           )
                           ) then
                          begin
                               Curr_Person:=Curr_Person^.NEXT;
                               Continue;
                          end;
                          
                       curr_Add:=curr_person.Add;
                       while (Curr_Add<>Nil) do
                         begin
//                              if Curr_Add^.SHIFR in [2,156] then
                              // из 11-го всех убрать
                            //  if NSRV=11 then Curr_Add^.summa:=100000; //
                              if not (cbFuture.Checked and futureDate(curr_add)) then
                              if curr_add^.PERIOD=NMES then
                                 AddSummaFromAdd(List,Curr_Person,Curr_Add);
                              Curr_Add:=Curr_Add.Next;
                         end;
                       Curr_Person:=Curr_Person.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       fillFromDB(list);
       FormProgress.Hide;
       FormProgress.Free;
       if List.Count>0 then
          begin
               DeleteWithKompens(list);
            //   DeleteSowm(List);
               deleteWithSalGtMinSal(List);
          end
        //  ShowMessage('Найдено '+intToStr(Count)+' несоответствий')
       else
          ShowMessage('Не найдено сотрудников ');
       NMES := tmpNMES;
       NSRV := tmpNSRV;
       mkflnm;
       getInf(true);
       DisposePensList;
      buildListForAlla:=list;
  end;
procedure TFormLessMinSal.makeTestingAlla;
  var i : Integer;
     Count       : Integer;
     summa : Real;
     summa_db : Real;
     summaRazn:Real;
     summaMinSal:Real;
     summaRaznTot:Real;
     dt:TDateTime;
     SQLStmnt:widestring;
     id:Integer;
     v:Variant;
     FIO:string;
     l:integer;
  begin
       list:=buildListForAlla;
       SQLStmnt:='delete from TB_SV_LESS_MIN_ZP where y='+intToStr(wantedYear)+' and m='+intToStr(wantedMonth);
       FIB.pFIBDatabaseSal.Execute(SQLStmnt);
       SQLStmnt:='select count(*) from TB_SV_LESS_MIN_ZP';
       v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
       if VarIsNumeric(v) then
          id:=v
       else
          id:=0;
       if id>0 then
          begin
               SQLStmnt:='select max(id) from TB_SV_LESS_MIN_ZP';
               v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
               if VarIsNumeric(v) then
                  id:=v
               else
                  id:=0;
          end;

       if List.Count>0 then
          begin
              summaRaznTot:=0;
              summaMinSal:=GET_MIN_SALARY(wantedyear,wantedMonth);

              dsTest.Open;
              for i:=0 to list.count-1 do
                  begin
                       Inc(id);
                       SQLStmnt:='insert into tb_sv_less_min_zp (id,y,m,tabno,year_za,month_za,summa,summa_db,summa_razn,workday,koef,fio,need_not) values (';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(id)+',';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(wantedYear)+',';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(wantedMonth)+',';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(prec(List.Items[i]).tabno)+',';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(prec(List.Items[i]).y)+',';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(prec(List.Items[i]).m)+',';
                       summa:=prec(List.Items[i]).summa;
                       summa_db:=prec(List.Items[i]).summa_db;
                       summaRazn:=summaMinSal-(summa+summa_db);
                       FIO:=getFullUkrFioPerson(prec(List.Items[i]).tabno);
                       SQLStmnt:=Trim(SQLStmnt)+formatFloatPoint(summa)+',';
                       SQLStmnt:=Trim(SQLStmnt)+formatFloatPoint(summa_db)+',';
                       if (prec(List.Items[i]).y>wantedYear)
                          or
                          (
                           (prec(List.Items[i]).y=wantedYear) and
                           (prec(List.Items[i]).m>wantedMonth)
                          ) then
                          summaRazn:=0; // За будущее разницу не считаем
                       SQLStmnt:=Trim(SQLStmnt)+formatFloatPoint(summarazn)+',';
                       SQLStmnt:=Trim(SQLStmnt)+formatFloatPoint(prec(List.Items[i]).workDay)+',';
                       SQLStmnt:=Trim(SQLStmnt)+formatFloatPoint(prec(List.Items[i]).koef)+',''';
                       l:=length(SQLStmnt);
                       SQLStmnt:=Trim(SQLStmnt)+trim(ReplQto2Q(fio))+''',0)';
                       FIB.pFIBDatabaseSal.Execute(SQLStmnt);
                       dstest.Append;
                       dsTestshifrPod.Value:=prec(List.Items[i]).shifrpod;
                       dsTesttabno.Value:=prec(List.Items[i]).tabno;
                       dsTestsumma.Value:=prec(List.Items[i]).summa;
                       dsTestsummaOtp.Value:=0;
                       dsTestsumma_bd.Value:=prec(List.Items[i]).summa_db;
                       dsTesty.Value:=prec(List.Items[i]).y;
                       dsTestm.Value:=prec(List.Items[i]).m;
                       dsTestsumma_razn.Value:=summaRazn;
                       dsTestfio.Value  := Trim(fio);
                       summaRaznTot     := SUM(summaRaznTot)+sum(summaRazn);
                       dsTestwd.Value   := prec(List.Items[i]).workDay;
                       dsTestkoef.Value := prec(List.Items[i]).koef;
                       dstest.Post;
                  end;
              for i:=0 to List.Count-1 do
                  Dispose(pRec(List.Items[i]));
              List.Free;
              frxReport2.ShowReport;
              dsTest.Close;
              getSVDNFooterRec;
              SVDNfooterRec.summa_lt_min_sal:=summaRaznTot;
              dt:=Time;
              SVDNfooterRec.dtsumma_lt_min_sal:=date;
              SVDNfooterRec.dtsumma_lt_min_sal:=recodeTime(SVDNfooterRec.dtsumma_lt_min_sal,hourOf(dt),MinuteOf(dt),SecondOf(dt),0);
              putSVDNFooterRec;
          end;

  end;



procedure TFormLessMinSal.frxReport2GetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthUkr(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          Value:=IntToStr(CURRYEAR)+' р.';
end;

procedure TFormLessMinSal.Btn24_01_2015Click(Sender: TObject);
var i:Integer;
begin
     i:=1;
     AssignFile(dev,'d:\p.txt');
     reWrite(dev);
     makeTestingAlla;
     CloseFile(dev);

end;

procedure TFormLessMinSal.FIBSQLMonitor1SQL(EventText: String;
  EventTime: TDateTime);
begin
     Writeln(dev,EventText);
end;

procedure TFormLessMinSal.BitBtnBrowseClick(Sender: TObject);
begin
     Application.CreateForm(TFormMinZP,FormMinZp);;
     FormMinZP.ShowModal;
end;

end.
