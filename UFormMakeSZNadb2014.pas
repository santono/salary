unit UFormMakeSZNadb2014;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons,ScrDef;

type
  TFormMakeSZNadb2014 = class(TForm)
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
    function  MoveNadbVysl:integer;
    procedure MoveSZPerson(Curr_Person:Person_Ptr;var NeedPut:boolean);
    procedure MoveVyslPerson(Curr_Person:Person_Ptr;var NeedPut:boolean);
    function  FindPersonFor(Curr_Person:Person_Ptr):Person_Ptr;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeSZNadb2014: TFormMakeSZNadb2014;

implementation
  uses uformselpkg,ScrUtil,ScrLists,ScrIO;

{$R *.dfm}

procedure TFormMakeSZNadb2014.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMakeSZNadb2014.BitBtn2Click(Sender: TObject);
begin
      Application.CreateForm(TFormSelPKG,FormSelPKG);
      FormSelPKG.ShowModal;
end;

procedure TFormMakeSZNadb2014.BitBtn1Click(Sender: TObject);
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

procedure TFormMakeSZNadb2014.FormCreate(Sender: TObject);
begin
     Label1.Caption:='';
     Label2.Caption:='';
end;

function TFormMakeSZNadb2014.MoveNadb:integer;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     NeedPut:Boolean;
     Curr_Person:PERSON_PTR;
     I_C_1,I_C_2:Integer;
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
              NeedPut:=False;
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
                 begin
                      Label2.Caption:=Curr_Person^.FIO;
                      if Curr_Person^.KATEGORIJA=1 then
                      if Curr_Person^.GRUPPA=1     then
                         MoveSZPerson(Curr_Person,NeedPut);
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

procedure TFormMakeSZNadb2014.MoveSZPerson(Curr_Person:Person_Ptr;var NeedPut:boolean);
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
                     OO:=GetWDay(NMES,curr_person);
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



function TFormMakeSZNadb2014.FindPersonFor(Curr_Person:Person_Ptr):Person_Ptr;
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

procedure TFormMakeSZNadb2014.MoveVyslPerson(Curr_Person:Person_Ptr;var NeedPut:boolean);
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
             if (Curr_Cn.Shifr=VYSLUGA_SHIFR) then
                begin
                     NeedPut:=true;
                     if (New_Person=nil) then
                        New_Person:=FindPersonFor(Curr_Person);
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
                     OO:=GetWDay(NMES,new_person);
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
                    if (Curr_Add.Shifr=VYSLUGA_SHIFR) then
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


function TFormMakeSZNadb2014.MoveNadbVysl:integer;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     NeedPut:Boolean;
     Curr_Person:PERSON_PTR;
     I_C_1,I_C_2:Integer;
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
              NeedPut:=False;
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
                 begin
                      Label2.Caption:=Curr_Person^.FIO;
                      if Curr_Person^.KATEGORIJA=1 then
                      if Curr_Person^.GRUPPA=1     then
                         MoveVyslPerson(Curr_Person,NeedPut);
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
     MoveNadbVysl:=RetVal;
end;

procedure TFormMakeSZNadb2014.BitBtn4Click(Sender: TObject);
 var RetVal:Integer;
begin
     if not ((NMES=2) and (WORK_YEAR_VAL=2014)) then
        begin
             ShowMessage('Можно запустить только в феврале 2014 г.');
             Exit;
        end;
     if (NameServList.CountSelected<1) then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     RetVal:=MoveNadbVysl;
     if RetVal>0 then
        ShowMessage('Перенесено '+IntToStr(RetVal)+' надбавок.');
     Close;

end;



procedure TFormMakeSZNadb2014.BitBtn5Click(Sender: TObject);
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
