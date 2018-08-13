unit uFormMkPensList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TFormMkPensList = class(TForm)
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CreateLists;
  private
    Code:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

type
      PPensionerRec=^TPensionerRec;
      TPensionerRec=record
                     Tabno:Integer;
                    end;
      TPensionerList=class(TList)
                      function IsPensioner(Tabno:Integer):boolean;
                     end;

var
  FormMkPensList: TFormMkPensList;
  PensionerList : TPensionerList;

procedure MakePensList(Code:Integer);
procedure DisposePensList;



implementation
  uses ScrDef,ScrUtil,ScrIo;

{$R *.dfm}
 function TPensionerList.IsPensioner(Tabno:Integer):boolean;
  var I:Integer;
  begin
       IsPensioner:=false;
       if Self.Count>0 then
           for i:=0 to Self.Count-1 do
               if PPensionerRec(Self.Items[i])^.Tabno=Tabno then
                  begin
                       IsPensioner:=true;
                       break;
                  end;
  end;

procedure MakePensList(Code:Integer);
 var i:integer;
 begin
      Application.CreateForm(TFormMkPensList, FormMkPensList);
      FormMkPensList.Code:=Code;
      if Code=2 then
         FormMkPensList.Caption:='Создание списка инвалидов'
                else
         FormMkPensList.Caption:='Создание списка пенсионеров';
      FormMkPensList.Show;
      Application.ProcessMessages;
      FormMkPensList.CreateLists;
      FormMkPensList.Free;
      i:=PensionerList.Count;
 end;
procedure DisposePensList;
 var i:Integer;
 begin
      if PensionerList<>nil then
      if Assigned(PensionerList) then
      if PensionerList.Count>0 then
      for i:=0 to PensionerList.Count-1 do
          Dispose(pPensionerRec(PensionerList.Items[i]));

      PensionerList.Free;
      PensionerList:=nil;
 end;

procedure TFormMkPensList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;


procedure TFormMkPensList.CreateLists;
 var
    NSRV_TEMP  : integer;
    NMES_TEMP  : integer;
    FLOW_MONTH : integer;
    I_NSRV     : integer;
    oldCountPerson : integer;
 PROCEDURE ADD_PERSON(CURR_PERSON:PERSON_PTR);
  VAR
      PensionerRec : PPensionerRec;
      I            : Integer;
  BEGIN
       I:=Curr_Person^.Tabno;
       if not PensionerList.IsPensioner(I) then
          begin
               New(PensionerRec);
               PensionerRec.Tabno:=I;
               PensionerList.Add(PensionerRec);
          end;
  END;

 PROCEDURE FIll_Person;
  VAR CURR_PERSON:PERSON_PTR;
 FUNCTION  IsPENS(CUR_PERSON:PERSON_PTR):BOOLEAN;
   VAR
       CURR_CN:CN_PTR;
       FOUND:BOOLEAN;
   BEGIN
       FOUND:=FALSE;
       CURR_CN:=CUR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) AND(NOT FOUND) DO
             IF CURR_CN^.SHIFR=PENSIONER_SHIFR+LIMIT_CN_BASE THEN FOUND:=TRUE
                                                             ELSE CURR_CN:=CURR_CN^.NEXT;
       IsPENS:=FOUND;
   END;

  BEGIN
       CURR_PERSON:=HEAD_PERSON;
       WHILE (CURR_PERSON<>NIL) DO
        BEGIN
             if ((Self.CODE=1) AND (IsPens(Curr_Person))) or
                ((Self.CODE=2) AND (Is_Invalid(Curr_Person)))   THEN
                ADD_PERSON(CURR_PERSON);
             CURR_PERSON:=CURR_PERSON^.NEXT;
        END;
  END;

begin
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     LabelPodr.Caption     := '';
     NSRV_TEMP := NSRV;
     NMES_TEMP := NMES;
     oldCountPerson:=COUNT_PERSON;
     if oldCountPerson>0 then
        begin
            PUTINF;
            empty_all_person;
        end;
     PensionerList:=TPensionerList.Create;
     FOR I_NSRV:=1 TO COUNT_SERV DO
        BEGIN
             NSRV:=I_NSRV;
             ProgressBar1.Position:=I_NSRV;
             LabelPodr.Caption:=trim(Name_SERV(NSRV))+' '+IntToStr(PensionerList.Count);
             Application.ProcessMessages;
             FLOW_MONTH:=NMES;
             MKFLNM;
             IF FILEEXIST(FNINF) THEN
                BEGIN
                     GetInf(TRUE);
                     Fill_Person;
                     empty_all_person;
                END; {IF FILEEXIST}
        END; {Конец цикла по NSRV}
    NSRV:=NSRV_TEMP;
    NMES:=NMES_TEMP;
    MKFLNM;
    if oldCountPerson>0 then
       GETINF(True);
    Self.Close;  
end;


end.
