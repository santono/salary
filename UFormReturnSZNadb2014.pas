unit UFormReturnSZNadb2014;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons,ScrDef, ExtCtrls, DB, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet;

type
  TFormReturnSZNadb2014 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    RadioGroup1: TRadioGroup;
    dtpData: TDateTimePicker;
    pFIBdsList: TpFIBDataSet;
    pFIBTrRead: TpFIBTransaction;
    dsoList: TDataSource;
    pFIBdsListTABNO: TFIBSmallIntField;
    pFIBdsListSUMMA: TFIBBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    function  MoveNadb:Integer;
    function  MoveNadbVysl(WantedShifr:integer;WantedMonth:integer):integer;
    procedure MoveSZPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;WantedShifr:integer);
    procedure MoveVyslPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;WantedShifr:integer);
    function  FindPersonFor(Curr_Person:Person_Ptr):Person_Ptr;
    procedure ExecutePerson(Tabno:Integer;Summa:Real;WantedShifr:Integer;WantedMonth:integer);


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReturnSZNadb2014: TFormReturnSZNadb2014;

implementation
  uses uformselpkg,ScrUtil,ScrLists,ScrIO,UFIBModule,DateUtils;

{$R *.dfm}

procedure TFormReturnSZNadb2014.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormReturnSZNadb2014.BitBtn2Click(Sender: TObject);
begin
      Application.CreateForm(TFormSelPKG,FormSelPKG);
      FormSelPKG.ShowModal;
end;

procedure TFormReturnSZNadb2014.BitBtn1Click(Sender: TObject);
 var RetVal:Integer;
begin
     Exit;
     if not ((NMES=1) and (WORK_YEAR_VAL=2014)) then
        begin
             ShowMessage('Можно запустить только в январе 2014 г.');
             Exit;
        end;
     if (NameServList.CountSelected<1) then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     RetVal:=MoveNadb;
     if RetVal>0 then
        ShowMessage('Перенесено '+IntToStr(RetVal)+' надбавок.');
     Close;
end;

procedure TFormReturnSZNadb2014.FormCreate(Sender: TObject);
begin
     Label1.Caption:='';
     Label2.Caption:='';
     dtpData.MaxDate:=EncodeDate(2014,2,28);
     dtpData.MinDate:=EncodeDate(2014,1,1);
     dtpData.Date:=EncodeDate(2014,2,1);
     RadioGroup1.ItemIndex:=0;
end;

function TFormReturnSZNadb2014.MoveNadb:integer;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     NeedPut:Boolean;
     Curr_Person:PERSON_PTR;
     I_C_1,I_C_2:Integer;
     WantedShifr:Integer;
begin
     WantedShifr:=ZA_STEP_SHIFR;
     RetVal  := 0;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              if not NameServList.IsSelected(I_podr) then Continue;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              i_c_1:=Count_Person;
              NeedPut:=False;
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
                 begin
                      Label2.Caption:=Curr_Person^.FIO;
                      if Curr_Person^.KATEGORIJA=1 then
                      if Curr_Person^.GRUPPA=1     then
                         MoveSZPerson(Curr_Person,NeedPut,WantedShifr);
                      Application.ProcessMessages;
                      Curr_Person:=Curr_Person.Next;
                 end;
              i_c_2:=Count_Person;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     MoveNadb:=RetVal;
end;

procedure TFormReturnSZNadb2014.MoveSZPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;WantedShifr:integer);
  var Curr_Cn:CN_PTR;
      Curr_Add:ADD_PTR;
      New_Cn:CN_PTR;
      New_Add:ADD_PTR;
      New_Person:PERSON_PTR;
      OO : Real;
      Finished:boolean;
      I_C:Integer;
      L:Integer;
  begin
    //   NeedPut:=False;
       Curr_Cn:=Curr_Person.CN;
       New_Person:=nil;
       while (Curr_Cn<>Nil) do
        begin
             if ((Curr_Cn.Shifr=ZA_STEP_SHIFR) or
                 (Curr_Cn.Shifr=ZA_ZWAN_SHIFR)) then
                begin
                     NeedPut:=true;
                     if (New_Person=nil) then
                        begin
                             i_c:=Count_Person;
                             MAKE_PERSON(New_Person,Curr_Person);
                             i_c:=Count_Person;
                             l:=SizeOf(New_Person^)-SizeOf(New_Person.NEXT)
                                                                            -SizeOf(New_Person.ADD)
                                                                            -SizeOf(New_Person.UD)
                                                                            -SizeOf(New_Person.CN)
                                                                            -SizeOf(New_Person.Sowm);
                             Move(Curr_Person^,New_Person^,L);
                             New_Person.DOLG:='Внеб.над.';
                             MAKE_DOL_PERSON(New_Person,1520);
                             MakeGUID(New_Person);
                             New_Person.GRUPPA := 11;
                             New_Person.OKLAD  := 0;
                             New_Person.WID_RABOTY:=SOWM_WID_RABOTY;
                             if IS_OSN_WID_RABOTY(Curr_Person) then
                                PUT_SWM_MODE_TO_PERSON(New_Person,1);
                        end;
                     MAKE_CN(New_Cn,New_Person);
                     New_Cn.Kod:=1;
                     New_Cn.Shifr:=Curr_Cn.Shifr;
                     OO:=GetWDay(NMES);
                     New_Cn.Summa:=Curr_Person^.OKLAD*NADBAWKA_DAY(1,31,New_Person)*Curr_Cn^.SUMMA/100/OO;
                     Curr_Cn.AUTOMATIC:=MANUAL_MODE;
                end;
             Curr_Cn:=Curr_Cn.Next;
        end;
       repeat
             finished:=true;
             curr_Add:=Curr_Person.ADD;
             while (Curr_Add<>Nil) do
               begin
                    if ((Curr_Add.Shifr=Za_Step_Shifr) or
                        (Curr_Add.Shifr=Za_Zwan_Shifr))  then
                       begin
                            if Curr_Person.Automatic=Manual_Mode then
                            if (New_Person<>nil) then
                               begin
                                    Make_Add(New_Add,New_Person);
                                    New_Add.Shifr      := Curr_add.SHIFR;
                                    New_Add.Summa      := Curr_Add.SUMMA;
                                    New_Add.Period     := Curr_Add.PERIOD;
                                    New_Add.Year       := Curr_Add.YEAR;
                                    New_Add.FZP        := Curr_Add.FZP;
                                    New_Add.FMP        := Curr_Add.FMP;
                                    New_Add.Other      := Curr_Add.Other;
                                    New_Add.Who        := Curr_Add.WHO;
                                    New_Add.VYPLACHENO := Curr_Add.VYPLACHENO;
                               end;
                            del_add(Curr_Add,Curr_Person);
                            Finished:=False;
                            break;
                       end;
                    Curr_Add:=Curr_Add.NEXT;
               end;
       until finished;

  end;



function TFormReturnSZNadb2014.FindPersonFor(Curr_Person:Person_Ptr):Person_Ptr;
 var RetPerson : PERSON_PTR;
     cPerson   : PERSON_PTR;
 begin

     RetPerson:=nil;
     FindPersonFor:=nil;
     if Curr_Person.GRUPPA<>1 then Exit;
     cPerson:=HEAD_PERSON;
     while (cPerson<>Nil) do
       begin
            if (cPerson.TABNO=Curr_Person.TABNO) then
            if (GET_DOL_CODE(cPerson)=1520)      then
            if (cPerson.GRUPPA=11)               then
               begin
                    retPerson:=cPerson;
                    Break;
               end;
            cPerson:=cPerson.NEXT;
       end;

     FindPersonFor:=RetPerson;

 end;

procedure TFormReturnSZNadb2014.MoveVyslPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;WantedShifr:integer);
  var Curr_Cn:CN_PTR;
      Curr_Add:ADD_PTR;
      New_Cn:CN_PTR;
      New_Add:ADD_PTR;
      New_Person:PERSON_PTR;
      OO : Real;
      Finished:boolean;
      I_C:Integer;
      L:Integer;
      PersonOsn:Person_Ptr;
    function getPersonOsn:PERSON_PTR;
     var i:Integer;
         c_p:PERSON_PTR;
         c_cn:CN_PTR;
         finded:Boolean;
     begin
          finded:=False;
          c_p:=HEAD_PERSON;
          while (c_p<>nil) do
           begin
                if c_p^.tabno=curr_Person^.TABNO then
                if c_p^.GRUPPA=1 then
                if IS_OSN_WID_RABOTY(c_p) then
                   begin
                        c_cn:=c_p.CN;
                        while (c_cn<>Nil) do
                         begin
                              if c_cn.shifr=WantedShifr then
                              if c_cn.AUTOMATIC=manual_mode then
                                 begin
                                      finded:=True;
                                      c_cn.AUTOMATIC:=AUTOMATIC_MODE;
                                      Break;
                                 end;
                              c_cn:=c_cn.Next;
                         end;
                   end;
                if finded then Break;
                c_p:=c_p.NEXT;
           end;
          if finded then Result:=c_p
                    else Result:=nil;
     end;
  begin
    //   NeedPut:=False;
       Curr_Cn:=Curr_Person.CN;
       New_Person:=nil;
       while (Curr_Cn<>Nil) do
        begin
             if (Curr_Cn.Shifr=WantedShifr) then
                begin
                     NeedPut:=true;
                     if getPersonOsn<>nil then
                        begin
                             Curr_Cn.AUTOMATIC:=MANUAL_MODE;
                             repeat
                                   finished:=true;
                                   curr_add:=curr_Person^.ADD;
                                   while (Curr_Add<>Nil) do
                                     begin
                                          if Curr_Add.Shifr=WantedShifr then
                                          if Curr_Add.VYPLACHENO=not_get_out then
                                             begin
                                                  DEL_ADD(Curr_Add,Curr_Person);
                                                  finished:=False;
                                                  Break;
                                             end;
                                          curr_add:=Curr_Add.NEXT;
                                     end;
                             until finished;
                        end;
                end;
             Curr_Cn:=Curr_Cn.Next;
        end;
  end;


function TFormReturnSZNadb2014.MoveNadbVysl(WantedShifr:integer;WantedMonth:integer):integer;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     NeedPut:Boolean;
     Curr_Person:PERSON_PTR;
     I_C_1,I_C_2:Integer;
     Tabno:Integer;
     Summa:Real;
begin
     RetVal  := 0;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     pFIBdsList.Transaction.StartTransaction;
     pFIBdsList.Prepare;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              if not NameServList.IsSelected(I_podr) then Continue;
              NSRV:=I_Podr;
              pFIBdsList.Params[0].AsInteger:=2014;
              pFIBdsList.Params[1].AsInteger:=WantedMonth;
              pFIBdsList.Params[2].AsInteger:=11; // Вне бюджет
              pFIBdsList.Params[3].AsInteger:=WantedShifr;
              pFIBdsList.Params[4].AsInteger:=NSRV;
              pFIBDsList.Open;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              while not pFIBdsList.EOF do
                begin
                     Tabno:=pFIBdsListTabno.Value;
                     Summa:=pFIBdsListSumma.Value;
                     ExecutePerson(Tabno,Summa,WantedShifr,WantedMonth);
                     pFIBdsList.Next;
                end;

              pFIBDsList.Close;
              PutInf;
              LDEL_PERSON;
         end;
     pFIBdsList.Transaction.Commit;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     MoveNadbVysl:=RetVal;
end;



procedure TFormReturnSZNadb2014.ExecutePerson(Tabno:Integer;Summa:Real;WantedShifr:Integer;WantedMonth:integer);
 CONST R_ID=120;
 var curr_Person:PERSON_PTR;
     curr_Add:ADD_PTR;
 function ExistsWantedCN:Boolean;
  var Curr_Cn:CN_PTR;
      finded:Boolean;
  begin
       finded:=False;
       Curr_CN:=Curr_Person.CN;
       while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn.SHIFR=wantedShifr then
                begin
                     finded:=True;
                     Break;
                end;
             Curr_Cn:=Curr_cn.Next;
        end;
       ExistsWantedCN:=finded;

  end;
 begin
      Curr_Person:=HEAD_PERSON;
      while (Curr_Person<>Nil) do
            begin
                 if Curr_Person^.KATEGORIJA=1 then
                 if Curr_Person^.GRUPPA=11    then
                 if curr_Person.TABNO=Tabno   then
                 if get_dol_code(Curr_Person)=1520 then
//                      if Curr_Person^.automatic=automatic_mode then
                    begin
                         MAKE_ADD(curr_Add,Curr_Person);
                         curr_Add.SHIFR:=wantedshifr;
                         curr_Add.SUMMA:=-summa;
                         curr_Add.FZP:=curr_Add.SUMMA;
                         curr_Add.Period:=wantedMonth;
                         curr_Add.YEAR:=2014-1990;
                         curr_Add.WHO:=r_iD;
                         Break;
                    end;
                 Curr_Person:=Curr_Person.Next;
            end;
      Curr_Person:=HEAD_PERSON;
      while (Curr_Person<>Nil) do
            begin
                 if Curr_Person^.KATEGORIJA=1 then
                 if Curr_Person^.GRUPPA=1     then
                 if curr_Person.TABNO=Tabno   then
                 if ExistsWantedCN            then
                    begin
                         MAKE_ADD(curr_Add,Curr_Person);
                         curr_Add.SHIFR:=wantedshifr;
                         curr_Add.SUMMA:=summa;
                         curr_Add.FZP:=curr_Add.SUMMA;
                         curr_Add.Period:=wantedMonth;
                         curr_Add.YEAR:=2014-1990;
                         curr_Add.WHO:=r_iD;
                         Break;
                    end;
                 Curr_Person:=Curr_Person.Next;
            end;
 end;



procedure TFormReturnSZNadb2014.BitBtn4Click(Sender: TObject);
 var RetVal      : Integer;
     WantedShifr : Integer;
     WantedMonth : Integer;
begin
     if not ((NMES=6) and (WORK_YEAR_VAL=2014)) then
        begin
             ShowMessage('Можно запустить только в июне 2014 г.');
             Exit;
        end;
     if (NameServList.CountSelected<1) then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if RadioGroup1.ItemIndex=0 then
        WantedShifr := ZA_STEP_SHIFR
     else
     if RadioGroup1.ItemIndex=1 then
        WantedShifr := ZA_ZWAN_SHIFR
     else
     if RadioGroup1.ItemIndex=2 then
        WantedShifr := VYSLUGA_SHIFR
     else
        WantedShifr := 0;
     if (WantedShifr < 1) then
        begin
             ShowMessage('Неверно указан шифр.');
             Exit;
        end;
      if YearOf(dtpData.Date)<>2014 then
        begin
             ShowMessage('Год должен быть только 2014.');
             Exit;
        end;

     WantedMonth:=MonthOf(dtpData.Date);
     if not (WantedMonth in [1,2,3,4,5]) then
        begin
             ShowMessage('Месяц должен быть только январь-май.');
             Exit;
        end;

     RetVal:=MoveNadbVysl(WantedShifr,WantedMonth);
     if RetVal>0 then
        ShowMessage('Перенесено '+IntToStr(RetVal)+' надбавок.');
     Close;

end;



procedure TFormReturnSZNadb2014.BitBtn5Click(Sender: TObject);
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     NeedPut:Boolean;
     Curr_Person:PERSON_PTR;
     I_C_1,I_C_2:Integer;
begin
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              NeedPut:=False;
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
                 begin
                      if GET_DOL_CODE(Curr_Person)=1920 then
                         begin
                              NeedPut:=True;
                              MAKE_DOL_PERSON(Curr_Person,1520);
                         end;
                      Label2.Caption:=Curr_Person^.FIO;
                      Application.ProcessMessages;
                      Curr_Person:=Curr_Person.Next;
                 end;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);

end;

end.
