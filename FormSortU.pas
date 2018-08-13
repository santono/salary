unit FormSortU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormSort = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure SetModeSort(M:Integer);
    function Execute: boolean;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    c:integer;
    t:integer;
    Mode:Integer;
    { Private declarations }
    procedure MakeSort;
  public
    { Public declarations }
  end;

var
  FormSort: TFormSort;

implementation
   uses ScrDef,ScrUtil;
{$R *.dfm}
function TFormSort.Execute: boolean;
 begin
      Self.visible:=false;
{     Self.SetUpFocus;   }
      if ShowModal = mrOk then begin
         result := true;
      end else begin
         result := false;
      end;
 end;

procedure TFormSort.SetModeSort(M:Integer);
 begin
      Caption:='Сортировка работников по ';
      if M=1 then Caption:=AllTrim(Caption)+'табельным номерам'
             else
      if M=2 then Caption:=AllTrim(Caption)+'фамилиям'
             else Caption:=AllTrim(Caption)+'подразделенриям и фамилиям';
      caption:=AllTrim(Caption)+' Всего работников '+IntToStr(Count_Person);
      Mode:=M;
 end;

procedure TFormSort.MakeSort;
 var TmpHead:Person_Ptr;
     MinTabno:integer;
     MinFio:string;
     Done:boolean;
     Curr_Person,Prev_Person,Min_Person,Prev_Min_Person:Person_Ptr;
     i   : integer;
     iii : Integer;
  function ComparePerson(Mode:Integer;Person1:PERSON_PTR;Person2:person_Ptr):Integer;
   var i      : Integer;
       RetVal : integer;
       PorN1,PorN2 : Integer;
       PodrN1,PodrN2 : Integer;
   begin
        RetVal:=0;
        if ((not Assigned(Person1)) and (Assigned(Person2))) then
           begin
                RetVal:=1;
                ComparePerson:=RetVal;
                Exit;
           end;
        if ((Assigned(Person1)) and ( not Assigned(Person2))) then
           begin
                RetVal:=-1;
                ComparePerson:=RetVal;
                Exit;
           end;
        if ((not Assigned(Person1)) and ( not Assigned(Person2))) then
           begin
                RetVal:=0;
                ComparePerson:=RetVal;
                Exit;
           end;
        if Mode=1 then
           if Person1^.Tabno>Person2^.TABNO then
              RetVal:=1
           else
           if Person1^.Tabno<Person2^.TABNO then
              RetVal:=-1
           else
        else
        if Mode=2 then
          RetVal:=CompareUkrText(Person1.FIO,Person2.FIO)
        else
           begin
                PodrN1 := GetPodrNomerPerson(Person1);
                PodrN2 := GetPodrNomerPerson(Person2);
                if ((PodrN1>0) or (PodrN2>0)) then
                   if PodrN1>PodrN2 then RetVal:=1
                   else
                   if PodrN1<PodrN2 then RetVal:=-1
                   else
                      RetVal:=CompareUkrText(Person1.FIO,Person2.FIO)
                else
                   RetVal:=CompareUkrText(Person1.FIO,Person2.FIO)
           end;
        if RetVal=0 then
           begin
                PorN1 := GetPorNomerPerson(Person1);
                PorN2 := GetPorNomerPerson(Person2);
                if ((PorN1>0) and (PorN2>0)) then
                   if PorN1<PorN2 then RetVal:=-1
                   else
                   if PorN1>PorN2 then RetVal:=1;
           end;
        if RetVal=0 then
           begin

                if Person1^.Wid_Raboty=1 then RetVal:=-1
                else
                if IS_OSN_WID_RABOTY(Person1) then RetVal:=-1
                else
                if (GET_DOL_CODE(PERSON1)=1455)  //Почасовка
                 or(GET_DOL_CODE(PERSON1)=1500)  //Больничные
                 or(GET_DOL_CODE(PERSON1)=1510)  //Больничные Чернобыльские
                 or(GET_DOL_CODE(PERSON1)=4)     //Больничные Чернобыльские
                 or(GET_DOL_CODE(PERSON1)=5)     //Больничные Чернобыльские
                 or(GET_DOL_CODE(PERSON1)=7)     //Больничные Чернобыльские
                 or(GET_DOL_CODE(PERSON1)=8)     //Больничные Чернобыльские
                 then
                    RetVal:=1;
           end;
        ComparePerson:=RetVal;
   end;
 begin
     ProgressBar1.Min:=0;
     ProgressBar1.Max:=Count_Person;
     TmpHead:=Nil;
     Done:=false;
     c:=0;
     t:=Count_Person;
     while not Done do
      begin
           if Head_Person=Nil then break;
           Curr_Person     := Head_Person;
           if Curr_Person^.Tabno=897 then
              Curr_Person^.Tabno:=Curr_Person^.Tabno;
           iii:=count_Person;   
           Prev_Person     := Nil;
           Min_Person      := Nil;
           Prev_Min_Person := Nil;
           MinTabno        := 999999;
           MinFio          := chr($FF);
           inc(c);
           ProgressBar1.Position:=c;
           Label1.Caption:=IntToStr(c)+' / '+IntToStr(t);
           if c>t then
              begin
                   i:=Count_person;
                   c:=c;
                   break;
              end;
           Self.Repaint;
           while Curr_Person<>Nil do
            begin
                 if ComparePerson(Mode,Min_Person,Curr_Person)>0 then
                    begin
                          if Mode=1 then MinTabno:=Curr_Person^.TABNO
                                    else MinFio:=Trim(Curr_Person^.Fio);
                          Min_Person:=Curr_Person;
                          Prev_Min_Person:=Prev_Person;
                    end ;
                 Prev_Person:=Curr_Person;
                 Curr_Person:=Curr_Person^.Next;
            end;
            if Min_Person<>Nil then
               begin
                    if Prev_Min_Person=Nil then
                       Head_Person:=Min_Person.NEXT
                                           else
                       Prev_Min_Person^.NEXT:=Min_Person^.NEXT;
                    if TmpHead=Nil then TmpHead:=Min_Person
                                   else
                       begin
                            Curr_Person:=TmpHead;
                            Prev_Person:=Nil;
                            while Curr_Person<>Nil do
                             begin
                                  Prev_Person:=Curr_Person;
                                  Curr_Person:=Curr_Person^.NEXT;
                             end;
                            Prev_Person^.NEXT:=Min_Person;
                       end;
                    Min_Person^.NEXT:=Nil;
               end;
      end;
     Head_Person:=TmpHead;

 end;
procedure TFormSort.FormShow(Sender: TObject);
begin
{     MakeSort; }
end;

procedure TFormSort.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormSort.BitBtn1Click(Sender: TObject);
begin
     MakeSort;
     ModalResult:=mrOk;
end;

end.
