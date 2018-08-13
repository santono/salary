unit UFormReMakeOtp2014;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons,ScrDef, ExtCtrls;

type
  TFormReMakeOtp2014 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    function  MoveNadb:Integer;
    function  MoveBackOtp(WantedShifr:integer):integer;
    procedure MoveSZPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;WantedShifr:integer);
    procedure MoveOtpBackPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;WantedShifr:integer);
    function  FindPersonFor(Curr_Person:Person_Ptr):Person_Ptr;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReMakeOtp2014: TFormReMakeOtp2014;

implementation
  uses uformselpkg,ScrUtil,ScrLists,ScrIO;

{$R *.dfm}

procedure TFormReMakeOtp2014.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormReMakeOtp2014.BitBtn2Click(Sender: TObject);
begin
      Application.CreateForm(TFormSelPKG,FormSelPKG);
      FormSelPKG.ShowModal;
end;

procedure TFormReMakeOtp2014.BitBtn1Click(Sender: TObject);
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

procedure TFormReMakeOtp2014.FormCreate(Sender: TObject);
begin
     Label1.Caption:='';
     Label2.Caption:='';
end;

function TFormReMakeOtp2014.MoveNadb:integer;
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

procedure TFormReMakeOtp2014.MoveSZPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;WantedShifr:integer);
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



function TFormReMakeOtp2014.FindPersonFor(Curr_Person:Person_Ptr):Person_Ptr;
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

procedure TFormReMakeOtp2014.MoveOtpBackPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;WantedShifr:integer);
  const RecalcOtpId = 15;
  var
      Curr_Add   : ADD_PTR;
      Curr_Ud    : UD_PTR;
      OO         : Real;
      Finished   : boolean;
      I_C:Integer;
      L:Integer;
      PersonOsn:Person_Ptr;
      Summa:Real;
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
                        finded:=True;
                        if finded then
                           Break;
                   end;
                c_p:=c_p.NEXT;
           end;
          if finded then Result:=c_p
                    else Result:=nil;
     end;

    function getSummaOtp(Curr_Person:person_ptr;WantedShifr:integer):Real;
      var retVal:Real;
          c_p:PERSON_PTR;
          GUIDS1,GUIDS2:string;
          c_add:ADD_PTR;
      begin
           retVal:=0;
           SELECT(2);
           c_p:=HEAD_PERSON;
           GUIDS1:=GetGUIDPersonToString(Curr_Person);
           while (c_p<>nil) do
             begin
                  GUIDS2:=GetGUIDPersonToString(C_P);
                  if c_p^.tabno=curr_person^.TABNO then
                  if trim(GUIDS1)=trim(GUIDS2) then
                     begin
                           C_Add:=C_p^.ADD;
                           while (C_Add<>Nil) do
                             begin
                                  if (c_add.shifr=wantedShifr) then
                                  if (c_add.PERIOD=nmes) then
                                     begin
                                          retval:=c_add.SUMMA;
                                          Break;
                                     end;
                                  c_Add:=c_add.NEXT;
                             end;
                           Break;
                     end;
                  c_p:=c_p.NEXT;
             end;
           SELECT(1);
           getSummaOtp:=retVal;
      end;


  begin
    
    // PersonOsn:=getPersonOsn;
   //    if PersonOsn<>nil then
          begin
               Summa:=getSummaOtp(Curr_Person,HOLIDAY_FLOW_SHIFR);
               if Abs(Summa)>0.05 then
                  begin
                       NeedPut:=True;
                       Make_Add(Curr_Add,Curr_pERSON);
                       Curr_Add^.Shifr  := HOLIDAY_FLOW_SHIFR;
                       Curr_Add^.Period := NMES;
                       Curr_Add^.Year   := 2014-1990;
                       Curr_Add^.Summa  := -Summa;
                       Curr_Add^.FZP    := Curr_Add.SUMMA;
                       Curr_Add^.Who    := RecalcOtpId;
                       Curr_Add^.Vyplacheno := get_out;
                       if GET_DOL_CODE(Curr_Person)=1530 then
                          begin
                               Make_Ud(Curr_Ud,Curr_Person);
                               Curr_Ud^.Shifr  := PODOH_SHIFR;
                               Curr_Ud^.Period := NMES;
                               Curr_Ud^.Year   := 2014-1990;
                               Curr_Ud^.Summa  := -Summa;
                               Curr_Ud^.Who    := RecalcOtpId;
                               Curr_Ud^.Vyplacheno := get_out;
                          end;
                  end;
        {
               Summa:=getSummaOtp(Curr_Person,20);
               if Abs(Summa)>0.05 then
                  begin
                       Make_Add(Curr_Add,Curr_Person);
                       Curr_Add^.Shifr  := 20;
                       Curr_Add^.Period := NMES;
                       Curr_Add^.Year   := 2014-1990;
                       Curr_Add^.Summa  := Summa;
                       Curr_Add^.FZP    := Curr_Add.SUMMA;
                       Curr_Add^.Who    := RecalcOtpId;
                       Curr_Add^.Vyplacheno := get_out;
                  end;
}
          end;
  end;


function TFormReMakeOtp2014.MoveBackOtp(WantedShifr:integer):integer;
 var I_Podr,Cnt  : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal      : Integer;
     NeedPut     : Boolean;
     Curr_Person : PERSON_PTR;
     I_C_1,I_C_2 : Integer;
     savNMES     : Integer;

   procedure DeleteOldRecordsForPodr;
    var Curr_Person : PERSON_PTR;
        Curr_Add    : Add_Ptr;
        Curr_Ud     : UD_PTR;
        finished    : Boolean;
    begin
         Curr_Person:=HEAD_PERSON;
         while (Curr_Person<>nil) do
          begin
               repeat
                     finished:=True;
                     curr_Add:=Curr_person.ADD;
                     while (Curr_Add<>Nil) do
                      begin
                           if Curr_Add.shifr=holiday_flow_shifr then
                           if Curr_Add.who=15 then
                           if Curr_Add.vyplacheno=get_out then
                           if Curr_Add.period=nmes then
                              begin
                                   DEL_ADD(Curr_Add,Curr_Person);
                                   finished:=False;
                                   Break;
                              end;
                           Curr_Add:=Curr_Add.NEXT;
                      end;
                     finished:=True;
                     curr_Ud:=Curr_person.Ud;
                     while (Curr_Ud<>Nil) do
                      begin
                           if Curr_Ud.shifr=podoh_shifr then
                           if Curr_Ud.who=15 then
                           if Curr_Ud.vyplacheno=get_out then
                           if Curr_Ud.period=nmes then
                              begin
                                   DEL_UD(Curr_Ud,Curr_Person);
                                   finished:=False;
                                   Break;
                              end;
                           Curr_Ud:=Curr_Ud.NEXT;
                      end;

               until finished;
               Curr_Person:=Curr_Person.NEXT;
          end;

    end;

   function ExistsPredvaritOtp(Curr_Person:Person_Ptr):Boolean;
     var curr_add:ADD_PTR;
         c_p:PERSON_PTR;
         GUIDS1,GUIDS2:string;
         retval:Boolean;
     begin
          retval:=false;
          SELECT(2);
          GUIDS1:=GetGUIDPersonToString(Curr_Person);
          c_p:=HEAD_PERSON;
          while (c_p<>Nil)do
            begin
                 GUIDS2:=GetGUIDPersonToString(C_P);
                 if Curr_Person^.tabno=c_p^.TABNO then
                 if (GUIDS1=GUIDS2) then
                    begin
                         curr_add:=c_p^.ADD;
                         while (curr_add<>Nil) do
                          begin
                                if Curr_add^.shifr=holiday_flow_shifr then
                                if Curr_add^.Period=nmes then
                                if Curr_add^.who=14 then
                                   begin
                                        retval:=True;
                                        Break;
                                   end;
                                Curr_add:=curr_add.NEXT;
                          end;
                    end;
                 if retval then Break;
                 c_p:=c_p.NEXT;
            end;
          SELECT(1);
          ExistsPredvaritOtp:=retval;
     end;



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
              savNMES:=NMES;
              NMES:=6;
              MKFLNM;
              SELECT(2);
              GETINF(false);
              MKFLNM;
              SELECT(1);
              NMES:=savNMES;
              MKFLNM;
              NeedPut:=False;
              DeleteOldRecordsForPodr;
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
                 begin
                      Label2.Caption:=Curr_Person^.FIO;
                      if Curr_Person^.Tabno=693 then
                         Curr_Person^.Tabno:=693;
                      if Curr_Person^.GRUPPA=11    then
                      if get_dol_code(Curr_Person)=1530 then
//                      if Curr_Person^.automatic=automatic_mode then
                         MoveOtpBackPerson(Curr_Person,NeedPut,WantedShifr);
                      if get_dol_code(Curr_Person)<1500  then
                      if get_dol_code(Curr_Person)>9     then
                      if get_dol_code(Curr_Person)<>1455 then
//                      if Curr_Person^.Gruppa<>11 then
                      if ExistsPredvaritOtp(Curr_Person) then
                         MoveOtpBackPerson(Curr_Person,NeedPut,WantedShifr);

                      Application.ProcessMessages;
                      Curr_Person:=Curr_Person.Next;
                 end;
              i_c_2:=Count_Person;
              SELECT(2);
              LDEL_PERSON;
              SELECT(1);
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     MoveBackOtp:=RetVal;
end;

procedure TFormReMakeOtp2014.BitBtn4Click(Sender: TObject);
 var RetVal : Integer;
     WantedShifr:Integer;
begin
     if not YesNo('Запустить возврат в бюджет предварительніх отпускных за июль 2014?') then
        Exit;
     if not ((NMES=7) and (WORK_YEAR_VAL=2014)) then
        begin
             ShowMessage('Можно запустить только в июле 2014 г.');
             Exit;
        end;
     if (NameServList.CountSelected<1) then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     WantedShifr:=HOLIDAY_FLOW_SHIFR;
     RetVal:=MoveBackOtp(WantedShifr);
     if RetVal>0 then
        ShowMessage('Перенесено '+IntToStr(RetVal)+' отпускных.');
     Close;

end;



procedure TFormReMakeOtp2014.BitBtn5Click(Sender: TObject);
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
