unit UFormRepairUwol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormRepairUwol = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
         procedure CorrectTabelUwol;

  public
    { Public declarations }
  end;

var
  FormRepairUwol: TFormRepairUwol;

implementation

{$R *.dfm}

   uses ScrDef,ScrIo,ScrUtil,dateUtils;
procedure TFormRepairUwol.CorrectTabelUwol;
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
     S       : String;
     aVal    : Real;
     i       : Integer;
     list    : TList;
     fName   : string;
     dev     : TextFile;
 PROCEDURE FILL_TABEL_UW(CURR_PERSON:PERSON_PTR;var needPut:boolean);
  VAR I   : INTEGER;
      Dt  : TDateTime;
      D   : Integer;
      y,m : integer;
      finded : Boolean;
      pTabno:PInteger;
  BEGIN
       if CURR_PERSON^.TABNO=11899 then
          y:=1;
       Dt := getDataUwPerson(Curr_person);
       y  := yearof(dt);
       m  := monthof(dt);
       d  := dayof(dt);
       if YearOf(Dt)  <> Work_Year_Val then Exit;
       if MonthOf(Dt) <> NMES          then Exit;
                    finded:=False;
                    if list.count>0 then
                       for i:=0 to list.Count-1 do
                           if pInteger(list.Items[i])^=curr_person^.TABNO then
                              begin
                                   finded:=True;
                                   Break;
                              end;
                    if not finded then
                       begin
                            New(ptabno);
                            pTabno^:=curr_person^.TABNO;
                            list.Add(ptabno);
                       end;

       D:=DayOf(Dt);
   //    IF CURR_PERSON^.MAIN<=0 THEN EXIT;
       FOR I:=1 TO 31 DO
          //      CASE MONTH_DAY[2,NMES,I] OF
       if i=D then
       if CURR_PERSON^.TABEL[I]=NEZAPOLN then
          begin
               CURR_PERSON^.TABEL[I] := JAWKA;
               Inc(AmountOfPerson);
               needPut:=True;
          end
  END;


begin

     AmountOfPerson:=0;
     if not ((NMES=06) and (CURRYEAR=2017)) then
        begin
             ShowMessage('Можно запустить только в июне 2017');
             Exit;
        end;
     if not YesNo('Откорректировать табель для увольняемых с 30.06.2017?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Cnt           := 0;
     list          := TList.Create;
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
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    FILL_TABEL_UW(CURR_PERSON,needPut);
//                    FILL_TABEL_UW(CURR_PERSON,needPut);
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              EMPTY_ALL_PERSON;


         end;
     if list.count>0 then
        begin
             fName:=cdoc+'needTN.txt';
             Rewrite(dev,fname);
             for i:=0 to list.count-1 do
                 writeln(dev,PInteger(list.items[i])^:5,2017:5,6:3);
             CloseFile(dev);    
        end;
     list.Free;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Откорректировано '+IntToStr(AmountOfPerson)+' сотрудников.');
end;


procedure TFormRepairUwol.BitBtn1Click(Sender: TObject);
begin
     CorrectTabelUwol;
end;

procedure TFormRepairUwol.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action := caFree;
end;

end.
