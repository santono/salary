unit UFormPers22SVDN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, frxClass, frxDBSet, DB, DBClient,
  frxExportRTF, frxExportXLS;

type
  TFormPers22SVDN = class(TForm)
    pb1: TProgressBar;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dsTest: TClientDataSet;
    dsTestshifrPod: TIntegerField;
    dsTesttabno: TIntegerField;
    frxrprtLnr: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dsTestsumma: TFloatField;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    dsTestfio: TStringField;
    dsTestsummaMax: TFloatField;
    dsTestsumma22: TFloatField;
    frxReportSVDN: TfrxReport;
    dsTestsumma22Cor: TFloatField;
    dsTestsumma22Res: TFloatField;
    dsTestisInvalid: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure frxrprtLnrGetValue(const VarName: String; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure frxReportSVDNGetValue(const VarName: String;
      var Value: Variant);
  private
    summaMatHelp  : Real;
    summaVyhodnPosobie     : Real;
    summaInvalid  : Real;
    summaItogoTot : Real;
    summaPogr     : Real;
    { Private declarations }
      procedure makeList;

  public
    { Public declarations }
  end;

var
  FormPers22SVDN: TFormPers22SVDN;

implementation
  uses ScrDef,ScrUtil,scrio, UFibModule,UFormLessMinSal,Math;
  
  type prec=^trec;
       trec=record
            tabno      : Integer;
            fio        : string;
            summa      : Real;
            summaMax   : Real;
            summa22    : Real;
            summa22cor : Real;
            summa22Res : real;
            isInvalid  : Boolean;
           end;
  var List : TList;
      listMinSal : TList;

  procedure AddSummaFromAdd(Curr_Person:PERSON_PTR;Curr_Add:ADD_PTR);
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
                              prec(List.Items[i]).summa:=prec(List.Items[i]).summa+curr_add.SUMMA;
                              prec(List.Items[i]).summaMax:=prec(List.Items[i]).summa;
                              finded:=True;
                              break
                         end;
                 end;
          if not finded then
             begin
                  New(rec);
                  rec.tabno    := curr_person.tabno;
                  if isLNR then
                     rec.fio      := Trim(GetFullRusFioPerson(curr_person.tabno))
                  else
                     rec.fio      := Trim(GetFullUkrFioPerson(curr_person.tabno));
                  rec.summa       := curr_add^.SUMMA;
                  rec.summaMax    := curr_add^.SUMMA;
                  rec.summa22     := 0.00;
                  rec.summa22cor  := 0.00;
                  rec.summa22Res  := 0.00;
                  if IS_INVALID(Curr_Person) then
                     rec.isInvalid:=true
                  else
                     rec.isInvalid:=false;
                  list.Add(rec);
             end;
    end;

{$R *.dfm}

procedure TFormPers22SVDN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;
function compare(item1:Pointer;item2:pointer):Integer;
 var retVal:Integer;
     rec:prec;
 begin
      retVal:=0;
      if UPPER_STRING(prec(item1).fio)>UPPER_STRING(prec(item2).fio) then retVal:=1
      else
      if UPPER_STRING(prec(item1).fio)<UPPER_STRING(prec(item2).fio) then retVal:=-1;
      compare:=retVal;
 end;

procedure TFormPers22SVDN.makeList;
  var tmpNMES , tmpNSRV , i_nsrv , i ,j: Integer;
      Curr_Person : PERSON_PTR;
      Curr_Add    : Add_Ptr;
      Count       : Integer;
      fio         : string;
      v           : Variant;
      SQLStmnt    : string;
      summa,summa22,summaTot,summaTot22:Real;
      summaMax,summaMaxTot,limit:Real;
      proc : Real;
      procInv : real;
      minsal : real;
  begin
       if isLNR then
          begin
               proc:=0.31;
               procInv:=proc;
          end
       else
          begin
               proc:=0.22;
               procInv:=0.0841;
          end;

       tmpNMES := NMES;
       tmpNSRV := NSRV;
       putinf;
       while HEAD_PERSON<>nil do DEL_PERSON(head_person);
       pb1.Max       := Count_Serv;
       pb1.Min       := 0;
       pb1.Position  := 0;
       COUNT         := 0;
       list          := TList.Create;
       limit         := GET_LIMIT_FOR_PENS(CURRYEAR,nmes);
       summaMatHelp  := 0.00;
       summaVyhodnPosobie     := 0.00;
       summaItogoTot := 0.00;
       summaInvalid  := 0.00;
       summaPogr     := 0.00;
       for i_nsrv:=1 to Count_Serv do
           begin
                pb1.Position := i_nsrv ;
                lbl1.Caption := Name_Serv(i_nsrv);
                Application.ProcessMessages ;
         //       if i_nsrv in [105,106] then Continue;
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
                                      if not (Curr_Add^.SHIFR  in [ VYHODNOE_POSOBIE_SHIFR ,31,139]) then  //Материальная помошь, выходное пособие и пособие на погребение 139 не входят
                                         if NSRV in [105,106] then
                                            summaMatHelp:=R10(summaMatHelp) + R10(Curr_Add^.summa)
                                         else
                                         if IS_INVALID(Curr_Person) then
                                            summaInvalid:=R10(summaInvalid) + R10(Curr_Add^.summa)
                                         else
                                            AddSummaFromAdd(Curr_Person,Curr_Add)
                                      else
                                      if (Curr_Add^.SHIFR  in [ VYHODNOE_POSOBIE_SHIFR ]) then  //Материальная помошь компенс за неисп отпуск не входят
                                         summaVyhodnPosobie:=R10(summaVyhodnPosobie) + R10(Curr_Add^.summa)
                                      else
                                      if (Curr_Add^.SHIFR = 139) then  //Пособие на погребение
                                         summaPogr:=R10(summaPogr) + R10(Curr_Add^.summa)
                                      else
                                         summaMatHelp:=R10(summaMatHelp) + R10(Curr_Add^.summa);
                                      Curr_Add:=Curr_Add.Next;
                                 end;
                       Curr_Person:=Curr_Person.NEXT;
                  end;
                EMPTY_ALL_PERSON;

           end;
       if isSVDN then
          begin
               minsal:=GET_MIN_SALARY(CURRYEAR,NMES);
               Application.CreateForm(TFormLessMinSal,FormLessMinSal);
               listMinSal:=FormLessMinSal.buildListForAlla;
               FormLessMinSal.Free;
               if listMinSal.Count>0 then
                  for i:=0 to listMinSal.count-1 do
                      for j:=0 to List.Count-1  do
                          if ((pRec(List.Items[j]).tabno=UFormLessMinSal.prec(listMinSal.Items[i]).tabno) and
                              (Abs(pRec(List.Items[j]).summa)<(minsal-0.5)))
                            then
                             begin
                                  if pRec(List.Items[j]).isInvalid then
                                     pRec(List.Items[j]).summa22cor:= r10(R10(minsal)*roundTo(procInv,-4))
                                  else
                                     pRec(List.Items[j]).summa22cor:= r10(R10(minsal)*r10(proc));
                                  break;
                             end;
               if listMinSal.count>0 then
                 for i:=0 to ListMinSal.Count-1 do
                     Dispose(UFormLessMinSal.pRec(ListMinSal.Items[i]));

               listMinSal.Free;
          end;
       if List.Count>0 then
          begin
              dsTest.Open;
              summaTot:=0;
              summaTot22:=0;
              summaMaxTot:=0;
              List.Sort(@Compare);
              for i:=0 to list.count-1 do
                  begin
                       summa:=prec(List.Items[i]).summa;
                       if (Abs(summa)>0.01) then
                          begin
                               summaMax:=summa;
                               if summaMax>LIMIT then
                                  summaMax:=limit;

                               summaTot    := R10(r10(summaTot)+r10(summa));
                               summaMaxTot := R10(r10(summaMaxTot)+r10(summaMax));
                               summa22     := R10(r10(summaMaxTot)*r10(proc))-r10(summaTot22);
                               summa22     := R10(summa22);
                               prec(List.Items[i]).summa22  := summa22;
                               prec(List.Items[i]).summaMax := summaMax;
                               summaTot22  := r10(summaTot22)+r10(summa22);
                               summaTot22  := R10(summaTot22);
                               if Abs(prec(List.Items[i]).summa22cor)>0.001 then
                                  begin
                                       prec(List.Items[i]).summa22Res:=prec(List.Items[i]).summa22cor;
                                       prec(List.Items[i]).summa22cor:=prec(List.Items[i]).summa22cor-prec(List.Items[i]).summa22;
                                  end
                               else
                                  prec(List.Items[i]).summa22Res:=prec(List.Items[i]).summa22;
                          end;
                  end;
              summaItogoTot:=summaTot+SummaMatHelp+SummaVyhodnPosobie+SummaInvalid+SummaPogr;    
// Корректировка инвалидов
              for i:=0 to list.count-1 do
                  if prec(List.Items[i]).isInvalid  then                  begin
                       if (Abs(prec(List.Items[i]).summa)>0.01) then
                          begin
                               summa    := prec(List.Items[i]).summa;
                               summaMax := summa;
                               if summaMax>LIMIT then
                                  summaMax:=limit;
                               summa22:=R10(r10(summaMax)*roundTo(procInv,-4));
                               prec(List.Items[i]).summaMax := summaMax;
                               prec(List.Items[i]).summa22  := summa22;
                               if Abs(prec(List.Items[i]).summa22cor)>0.001 then
                                  begin
                                       prec(List.Items[i]).summa22Res:=R10(prec(List.Items[i]).summa22cor);
                                       prec(List.Items[i]).summa22Cor:=R10(R10(prec(List.Items[i]).summa22cor)-r10(prec(List.Items[i]).summa22));
                                  end
                               else
                                  prec(List.Items[i]).summa22Res:=prec(List.Items[i]).summa22;
                          end;
                  end;
              for i:=0 to list.count-1 do
                  begin
                       summa:=prec(List.Items[i]).summa;
                       if (Abs(summa)>0.01) then
                          begin
                               dstest.Append;
                   //            dsTestshifrPod.Value:=prec(List.Items[i]).shifrpod;
                               dsTesttabno.Value      := prec(List.Items[i]).tabno;
                               dsTestsumma.Value      := prec(List.Items[i]).summa;
                               dsTestsummaMax.Value   := prec(List.Items[i]).summaMax;
                               dsTestsumma22.Value    := prec(List.Items[i]).summa22;
                               dsTestsumma22cor.Value := prec(List.Items[i]).summa22cor;
                               dsTestsumma22res.Value := prec(List.Items[i]).summa22res;
//                               SQLStmnt:='select first 1 fio from kadry where tabno='+IntToStr(prec(List.Items[i]).tabno);
//                               v:=fib.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
//                               if VarIsStr(v) then
//                                  fio:=v
//                               else
//                                  fio:='Не найден';
                               dsTestfio.Value:=prec(List.Items[i]).fio;
                               if prec(List.Items[i]).isInvalid then
                                  dsTestfio.Value:=Trim(dsTestfio.Value)+' (инвалид)';
                               dstest.Post;
                          end
                  end;
              for i:=0 to List.Count-1 do
                  Dispose(pRec(List.Items[i]));
              List.Free;
              if isSVDN then
                 frxReportSVDN.ShowReport
              else
                 frxrprtLnr.ShowReport;
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


procedure TFormPers22SVDN.btn1Click(Sender: TObject);
begin
     makeList;
     Close;
end;

procedure TFormPers22SVDN.frxrprtLnrGetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthRus(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          Value:=IntToStr(CURRYEAR)+' г.';
      if (Trim(UPPER_STRING(VarName))='MONTH') then
         if isLNR then
            Value:=GetMonthRus(NMES)
          else
            Value:=GetMonthUkr(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
         if isLNR then
            Value:=IntToStr(CURRYEAR)+' г.'
         else
            Value:=IntToStr(CURRYEAR)+' р.'
      else
      if (Trim(UPPER_STRING(VarName))='PROCSTR') then
         if isLNR then
            Value:='31%'
         else
            Value:='22%'
      else
      if (Trim(UPPER_STRING(VarName))='PROCVAL') then
         if isLNR then
            Value:='31%'
         else
            Value:='22%';


end;

procedure TFormPers22SVDN.FormCreate(Sender: TObject);
begin
      if isLNR then
         Caption:='Суммы начислений и 31%'
      else
         Caption:='Суми нарахуваннь та 22%';

      lbl1.Caption:='';


end;


  




procedure TFormPers22SVDN.frxReportSVDNGetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthRus(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          Value:=IntToStr(CURRYEAR)+' г.';
      if (Trim(UPPER_STRING(VarName))='MONTH') then
         if isLNR then
            Value:=GetMonthRus(NMES)
          else
            Value:=GetMonthUkr(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
         if isLNR then
            Value:=IntToStr(CURRYEAR)+' г.'
         else
            Value:=IntToStr(CURRYEAR)+' р.'
      else
      if (Trim(UPPER_STRING(VarName))='PROCSTR') then
         if isLNR then
            Value:='31%'
         else
            Value:='22%'
      else
      if (Trim(UPPER_STRING(VarName))='PROCVAL') then
         if isLNR then
            Value:='31%'
         else
            Value:='22%'
      else
      if (Trim(UPPER_STRING(VarName))='SUMMAMATHELP') then
         Value:=summaMatHelp
      else
      if (Trim(UPPER_STRING(VarName))='SUMMAVYHODNPOSOBIE') then
         Value:=summaVyhodnPosobie
      else
      if (Trim(UPPER_STRING(VarName))='SUMMAINVALID') then
         Value:=summaInvalid
      else
      if (Trim(UPPER_STRING(VarName))='SUMMAPOGR') then
         Value:=summaPogr
      else
      if (Trim(UPPER_STRING(VarName))='SUMMARESULT') then
         Value:=summaItogoTot;


end;

end.
