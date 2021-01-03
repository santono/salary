unit FormKafGruU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges;

type
  TFormSwodKafGru = class(TForm)
    GaugePodr: TGauge;
    LabelKaf: TLabel;
    GaugePerson: TGauge;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure MakeSwod;
  public
    { Public declarations }
  end;

var
  FormSwodKafGru: TFormSwodKafGru;



implementation
 uses ScrDef,ScrUtil,ScrIo,ScrLists,UFormView;
type PItemGru=^TItemGru;
     TItemGru=record
                ShifrGru : integer;
                Summa    : real;
              end;
     TListGru=class(TList)
               procedure AddItemGru(ShifrGru:integer;Summa:real);
              end;

{$R *.dfm}

procedure TListGru.AddItemGru(ShifrGru:integer;Summa:real);
 var i:integer;
     Finded:boolean;
     ItemGru:PItemGru;
 begin
      Finded:=false;
      if Self.Count>0 then
         for i:=1 to Self.Count do
             begin
                  if PItemGru(Items[i-1])^.ShifrGru=ShifrGru then
                     begin
                          PItemGru(Items[i-1])^.Summa:=PItemGru(Items[i-1])^.Summa+Summa;
                          Finded:=true;
                          break;
                     end;
             end;

      if not Finded then
         begin
              New(ItemGru);
              ItemGru^.ShifrGru:=ShifrGru;
              ItemGru^.Summa:=Summa;
              Self.Add(ItemGru);
         end;
 end;


procedure TFormSwodKafGru.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormSwodKafGru.BitBtn1Click(Sender: TObject);
begin
     MakeSwod;
end;

{ ********************************************************** }
{ * Свод по счетам и подразделениям            за 07.1997  * }
{ ********************************************************** }
procedure TFormSwodKafGru.MakeSwod;
const lenh=10;
var I:integer;
    NSRV_TEMP:INTEGER;
    NMES_TEMP:INTEGER;
    DEV:TextFile;
    List,ListT:TListGru;
    WANTED_SHIFR:INTEGER;
    Summa:real;
    FName:string;
    SwodMode:(NeedBoln,NotNeedBoln);
 function FilterAdd(Curr_Add:Add_Ptr):boolean;
   begin
        FilterAdd:=true;
        if SwodMode=NotNeedBoln then
           if (IsBolnShifr(Curr_Add^.Shifr)) or
              (Curr_Add^.Shifr=kassa_Shifr)  then
              FilterAdd:=false;
   end;
procedure First_Step;
 VAR Curr_person:person_ptr;
     Curr_Add:Add_ptr;
     Summa:Real;
     i:integer;
 BEGIN
      if Count_Person=0 then Exit;
      GaugePerson.MinValue:=1;
      GaugePerson.MaxValue:=Count_Person;
      GaugePerson.Progress:=1;
      Curr_person:=head_person;
      i:=0;
      WHILE (Curr_person<>NIL) DO
       BEGIN
            Inc(i);
            GaugePerson.Progress:=i;
            Application.ProcessMessages;
            Summa:=0;
            Curr_add:=Curr_person^.ADD;
            WHILE Curr_add<>NIL DO
             BEGIN
                  if FilterAdd(Curr_Add) then
                     Summa:=Summa+Sum(Curr_add^.summa);
                  curr_add:=curr_add^.Next;
             END;
            IF ABS(SUMMA)>0.001 THEN
               List.AddItemGru(CURR_PERSON^.GRUPPA,Summa);
            CURR_PERSON:=CURR_PERSON^.NEXT;
       END;
 END;
{
 PROCEDURE PRINTNAME(ITEM:POINTER);FAR;
  BEGIN
       WRITE(DEV,COPY(GET_IST_NAME(PITEM(ITEM)^.SHIFR)+SPACE(9),1,9),':');
  END;
}
PROCEDURE PRINT_FOOTER;
  var I:Integer;
       Summa:real;
       S:String;
 BEGIN
       WRITE(DEV,':',COPY(' И т о г о'+SPACE(30),1,30),':');
       for i:=1 to ListT.Count do
           begin
                SUMMA:=PItemGru(ListT.Items[i-1])^.SUMMA;
                IF ABS(SUMMA)>0.001 THEN
                    STR(SUMMA:lenh:2,S) ELSE S:=SPACE(lenh);
                WRITE(DEV,S,':');
           end;
       WRITELN(DEV);
       WRITELN(DEV,'--');
 END;
PROCEDURE SECOND_STEP;
 VAR CURR_PERSON:PERSON_PTR;
     CURR_ADD:ADD_PTR;
     I:Integer;
     Finded:boolean;
     Summa:real;
     S:String;
 BEGIN
      if Count_Person=0 then Exit;
      for i:=1 to List.Count do
          PItemGru(List.items[i-1])^.Summa:=0;
      GaugePerson.MinValue:=1;
      GaugePerson.MaxValue:=Count_Person;
      GaugePerson.Progress:=1;
      i:=0;
      CURR_PERSON:=HEAD_PERSON;
      WHILE (CURR_PERSON<>NIL) DO
       BEGIN
            inc(i);
            GaugePerson.Progress:=i;
            Application.ProcessMessages;
            SUMMA:=0;
            CURR_ADD:=CURR_PERSON^.ADD;
            WHILE CURR_ADD<>NIL DO
             BEGIN
                  if FilterAdd(Curr_Add) then
                     SUMMA:=SUMMA+SUM(CURR_ADD^.SUMMA);
                  CURR_ADD:=CURR_ADD^.NEXT;
             END;
            IF ABS(SUMMA)>0.001 THEN
               BEGIN
                    List.AddItemGru(CURR_PERSON^.GRUPPA,Summa);
                    ListT.AddItemGru(CURR_PERSON^.GRUPPA,Summa);
               END;
            CURR_PERSON:=CURR_PERSON^.NEXT;
       END;
       Finded:=false;
       for i:=1 to List.Count do
           if (abs(PItemGru(List.Items[i-1])^.Summa)>0.009) then
              begin
                   Finded:=true;
                   break;
              end;
       IF Finded THEN
          BEGIN
               WRITE(DEV,':',COPY(NAME_SERV(NSRV)+SPACE(30),1,30),':');
               for i:=1 to List.Count do
                   begin
                        SUMMA:=PItemGru(List.ITEMS[i-1])^.SUMMA;
                        IF ABS(SUMMA)>0.001 THEN
                           STR(SUMMA:lenh:2,S) ELSE
                           S:=SPACE(lenh);
                        WRITE(DEV,S,':');
                   end;
               WRITELN(DEV);
          END;
 END;
BEGIN
    SwodMode:=NotNeedBoln;
    if CheckBox1.Checked then SwodMode:=NeedBoln;
    NSRV_TEMP:=NSRV;
    PUTINF;
    NMES_TEMP:=NMES;
    LIST:=TListGru.Create;;
    LISTT:=TListGru.Create;;
    GaugePodr.MinValue:=1;
    GaugePodr.MaxValue:=NameServList.Count*2;
    GaugePodr.Progress:=1;

    FOR I:=1 TO COUNT_SERV DO
        BEGIN
             NSRV:=i;
             LabelKAF.Caption:=NAME_SERV(NSRV);
             GaugePodr.Progress:=NSRV;
             Application.ProcessMessages;
             MKFLNM;
             IF FILEEXIST(FNINF) THEN
                BEGIN
                     GETINF(TRUE);
                     FIRST_STEP;
                     EMPTY_ALL_PERSON;
                END;
        END; {Конец цикла по NSRV}
    IF LIST.COUNT>0 THEN
       BEGIN
            FNAME:=CDOC+'COUNTS.TXT';
            ASSIGNFILE(DEV,FNAME);
            REWRITE(DEV);
            WRITELN(DEV,'Свод по счетам за ',MONTH[NMES],' ',WORK_YEAR,' года');
            WRITE(DEV,':'+SPACE(30)+':');
            for i:=1 to List.Count do
                WRITE(DEV,COPY(GET_IST_NAME(PITEMGRU(List.Items[i-1])^.SHIFRGRU)+SPACE(lenh),1,lenh),':');
            WRITELN(DEV);
            FOR I:=1 TO COUNT_SERV DO
                BEGIN
                         LabelKAF.Caption:=NAME_SERV(NSRV);
                         NSRV:=i;
                         GaugePodr.Progress:=NSRV+NameServList.Count;;
                         Application.ProcessMessages;
                         MKFLNM;
                         IF FILEEXIST(FNINF) THEN
                            BEGIN
                                GETINF(TRUE);
                                SECOND_STEP;
                                EMPTY_ALL_PERSON;
                            END;
                     END; {Конец цикла по NSRV}
                PRINT_FOOTER;
                CLOSEfile(DEV);
                VIEW(FNAME);
           END;
        LIST.Free;
        LISTT.Free;
        NSRV:=NSRV_TEMP;
        NMES:=NMES_TEMP;
        MKFLNM;
        GETINF(NEED_NET_FOR_GETINF);
  END;


end.
