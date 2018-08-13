unit UFormSelPodrPerson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons;

type
  TFormSelPodrPerson = class(TForm)
    StringGridPodr: TStringGrid;
    Label1: TLabel;
    btnPodr: TBitBtn;
    btnPerson: TBitBtn;
    BitBtn3: TBitBtn;
    btnMonth: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPodrClick(Sender: TObject);
    procedure btnPersonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnMonthClick(Sender: TObject);
  private
    { Private declarations }
    SavNMES:Integer;
    SavNSRV:Integer;
    SavSelect:Integer;
    WantedMode : integer; { 1 др подр  тек мес     }
                          { 2 тек подр др мес      }
                          { 3 др подр др мес       }
                          { 4 тек под - прошл мес  }
  public
       WantedPodr    : Integer;
       WantedTabno   : Integer;
       WantedPointer : Integer;
       WantedMonth   : Integer;
       procedure fillMonthGrid;
       procedure fillPodrGrid;
       procedure fillPersonList;
       function Execute:boolean;
       procedure setWantedMode(wantedMode:Integer);
    { Public declarations }
  end;

var
  FormSelPodrPerson: TFormSelPodrPerson;

implementation
 uses ScrLists, ScrDef, ScrIO, ScrUtil;

{$R *.dfm}

procedure TFormSelPodrPerson.fillMonthGrid;
 var i:Integer;
 begin
      Label1.Caption:='Укажите месяц';
      btnPerson.Hide;
      btnPerson.Enabled:=false;
      btnPodr.Hide;
      btnPodr.Enabled:=false;
      btnMonth.Show;
      btnMonth.Enabled:=True;
      StringGridPodr.ColCount := 2;
      StringGridPodr.RowCount := 13;
      StringGridPodr.Cells[0,0] := 'Номер';
      StringGridPodr.Cells[1,0] := 'Месяц';
      for i:=1 to 12 do
          begin
               StringGridPodr.Cells[0,i]:=IntToStr(i);
               StringGridPodr.Cells[1,i]:=GetMonthRus(i);
          end;
 end;


procedure TFormSelPodrPerson.fillPodrGrid;
 var i:Integer;
 begin
     // Может вызываться в режиме 1 или 3
      Label1.Caption:='Укажите подразделение';
      btnPerson.Hide;
      btnPerson.Enabled:=False;
      btnMonth.Hide;
      btnMonth.Enabled:=False;
      btnPodr.Show;
      btnPodr.Enabled:=True;
      StringGridPodr.ColCount := 2;
      StringGridPodr.RowCount := NameServList.Count+1;
      StringGridPodr.Cells[0,0] := 'Шифр';
      StringGridPodr.Cells[1,0] := 'Название подразделения';
      for i:=1 to Count_Serv do
          begin
               StringGridPodr.Cells[0,i]:=IntToStr(i);
               StringGridPodr.Cells[1,i]:=Name_Serv(i);
          end;
 end;

procedure TFormSelPodrPerson.fillPersonList;
 var  i:Integer;
      Curr_Person:PERSON_PTR;
      NmesTmp,NsrvTmp:Integer;

 function CountOsnPerson:Integer;
  var i:Integer;
      Curr_Person:PERSON_PTR;
  begin
       i:=0;
       Curr_Person:=Head_person;
       while (Curr_Person<>Nil) do
        begin
             if ((Curr_Person^.WID_RABOTY=1)and
                  (Curr_Person^.Main>0)) then
                i:=i+1;
             Curr_Person:=Curr_Person^.NEXT;
        end;
       Result:=i;
  end;
 begin
      NMESTmp:=NMES;
      NSRVTmp:=NSRV;
      NMES:=WantedMonth;
      NSRV:=WantedPodr;
      MKFLNM;
      if not FileExists(FNINF) then
         begin
              ShowMessage('Отсутствует файл '+fnInf);
              NMES:=NMESTmp;
              NSRV:=NSRVTmp;
              MKFLNM;
              ModalResult:=mrCancel;
              Exit;
         end;
      SELECT(2);
      GETINF(true);
   //   NMES:=NMESTmp;
   //   NSRV:=NSRVTmp;
      MKFLNM;
      Label1.Caption:='Укажите сотрудника из '+Name_Serv(WantedPodr);
      btnPerson.Show;
      btnPerson.Enabled:=True;
      btnPodr.Hide;
      btnPodr.Enabled:=false;
      btnMonth.Hide;
      btnMonth.Enabled:=false;
      StringGridPodr.ColCount := 3;
      StringGridPodr.RowCount := CountOsnPerson+1;
      StringGridPodr.Cells[0,0] := 'Таб.н.';
      StringGridPodr.Cells[1,0] := 'Ф И О';
      StringGridPodr.Cells[2,0] := 'Должность';
      i:=0;
      Curr_Person:=Head_Person;
      while (Curr_Person<>Nil) do
          begin
               if ((Curr_Person.Wid_Raboty=1) and 
                  (Curr_Person.Main>0)) then
                  begin
                       i:=i+1;
                       StringGridPodr.Cells[0,i]:=IntToStr(Curr_Person^.Tabno);
                       StringGridPodr.Cells[1,i]:=trim(Curr_Person^.FIO)+' '+trim(Curr_Person^.Dolg);
                       StringGridPodr.Cells[2,i]:=Curr_Person^.Dolg;
                  end;
               Curr_Person:=Curr_Person^.Next;
          end;
 end;

procedure TFormSelPodrPerson.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //    NMES:=SavNMES;
  //    NSRV:=SavNSRV;
  //    SELECT(SavSelect);

    // Action:=caFree;
end;

procedure TFormSelPodrPerson.btnPodrClick(Sender: TObject);
begin
      WantedPodr:=StringGridPodr.Row;
      fillPersonList;
end;

function TFormSelPodrPerson.Execute:boolean;
 begin
      if ShowModal=mrOk then
         Execute:=True
      else
         Execute:=False;
 end;

procedure TFormSelPodrPerson.btnPersonClick(Sender: TObject);
var i,j:Integer;
    S:string;
    Curr_Person:PERSON_PTR;
begin
     j:=0;
     WantedTabno:=StringGridPodr.Row;
     s:=StringGridPodr.Cells[0,WantedTabno];
     Val(s,i,j);
     if j=0 then
        begin
             ModalResult:=mrOk;
             WantedTabno:=i;
             Curr_Person:=Head_Person;
             i:=0;
             j:=0;
             while (Curr_Person<>Nil) do
               begin
                    i:=i+1;
                    if Curr_Person^.Tabno=WantedTabno then
                    if Curr_Person^.Wid_Raboty=1 then
                       begin
                            j:=1;
                            WantedPointer:=i;
                            Break;
                       end;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
        end;
     if j=1 then
        ModalResult:=mrOk
     else
        ModalResult:=mrCancel;
end;

procedure TFormSelPodrPerson.FormCreate(Sender: TObject);
begin
      SavNMES:=NMES;
      SavNSRV:=NSRV;
      SavSelect:=SELECTED_FIELD;
      WantedPodr    := NSRV;
      WantedTabno   := 0;
      WantedPointer := 0;
      WantedMonth   := NMES;
      WantedMode    := 1;
      btnPerson.Caption := '2. Выбрать сотрудника';
      btnPodr.Caption   := '1. Выбрать подразделение';
      btnMonth.Hide;
      btnMonth.Enabled:=false;
end;

procedure TFormSelPodrPerson.setWantedMode(wantedMode:Integer);
  var NMESTMP:Integer;
  begin
       Self.WantedMode:=WantedMode;
       case Self.WantedMode of
        2: begin
            btnMonth.Caption   := '1. Выбрать месяц';
            btnPerson.Caption  := '2. Выбрать сотрудника';
            btnMonth.Show;
            btnMonth.Enabled:=true;
            btnPodr.Hide;
            btnPodr.Enabled:=false;
            WantedPodr:=NSRV;
            fillMonthGrid;
           end;
        3: begin
            btnMonth.Caption   := '1. Выбрать месяц';
            btnPodr.Caption    := '2. Выбрать сотрудника';
            btnPerson.Caption  := '3. Выбрать сотрудника';
            btnMonth.Show;
            btnMonth.Enabled:=true;
            btnPodr.Show;
            btnPodr.Enabled:=true;
            fillMonthGrid;
           end;
        4: begin
            btnPerson.Caption  := 'Выбрать сотрудника';
            btnMonth.Hide;
            btnMonth.Enabled:=false;
            btnPodr.Hide;
            btnPodr.Enabled:=false;
            WantedPodr:=NSRV;
  //          WantedMonth:=nmes-1;
            WantedMonth:=6;
            if WantedMonth<1 then
               WantedMonth:=12;
            fillPersonList;
           end;
        else
           begin
            btnPerson.Caption := '2. Выбрать сотрудника';
            btnPodr.Caption   := '1. Выбрать подразделение';
            btnMonth.Hide;
            btnMonth.Enabled:=false;
            btnPodr.Show;
            btnPodr.Enabled:=true;
            WantedMonth:=NMES;
            fillPodrGrid;
           end;
        end;

  end;

procedure TFormSelPodrPerson.btnMonthClick(Sender: TObject);
var NMESTmp : Integer;
begin
      NMESTmp := NMES;
      WantedMonth:=StringGridPodr.Row;
      if ((WantedMonth<1) or (WantedMonth>12)) then
         WantedMonth:=NMES;
      case WantedMode of
       2:fillPersonList;
       3:fillPodrGrid;
      end;
end;

end.
