unit UFormSetBaseData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, Spin, ExtCtrls;

type
  TFormSetBaseData = class(TForm)
    DateTimePickerNeed: TDateTimePicker;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    SpinEditRazrFr: TSpinEdit;
    SpinEditRazrTo: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    RadioGroupNadb: TRadioGroup;
    cbLeaveNewer: TCheckBox;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
      DateNeed : TDateTime;
      DateOld  : TDateTime;
      RazrFr   : integer;
      RazrTo   : integer;
      ModeSet  : integer;
      ModeNadb : integer; //0 c надюаками 1 без
      procedure RepairIndDate201404;
      procedure RepairIndDate201511;
      procedure SetIndDate201601;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSetBaseData: TFormSetBaseData;

implementation
  uses ScrLists,ScrDef,ScrUtil, UFormSelPKG,ScrIO;

{$R *.dfm}

procedure TFormSetBaseData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormSetBaseData.Button2Click(Sender: TObject);
var SavMonth,SavPodr,Sc,I_NSRV,m,y,Razr ,lm,ly: integer;
    NeedPut:boolean;
    Curr_Person:Person_Ptr;
    wd,wm,wy:word;
    od,om,oy:word;
    CurrDate:TDatetime;

  function IsDopl(Curr_Person:Person_Ptr):boolean;
   var Curr_Add:Add_Ptr;
       RetVal:boolean;
       c_p:Person_Ptr;
   begin
       RetVal:=false;
       Curr_Add:=Curr_Person^.ADD;
       while (Curr_Add<>Nil) do
        begin
             if ((Curr_Add^.shifr=night_shifr) or
                 (Curr_Add^.shifr=prazdn_shifr) or
                 (curr_add^.Shifr=33)) then
                 begin
                      RetVal:=true;
                      break;
                 end;
             Curr_Add:=Curr_Add^.NEXT;
        end;
      if not Retval then
         begin
              c_p:=head_Person;
              while (C_P<>Nil) do
                begin
                     if C_P^.Tabno=Curr_Person^.TABNO then
                        begin
                             if Get_Dol_Code(C_P)=5 then
                                begin
                                     Curr_Add:=C_P^.ADD;
                                     while (Curr_Add<>Nil) do
                                           begin
                                                if (Curr_Add^.shifr=30) then
                                                   begin
                                                         RetvaL:=true;
                                                         break;
                                                   end;
                                                Curr_Add:=Curr_Add^.NEXT;
                                           end;
                                end;
                             if RetVal then break;
                        end;
                     C_P:=C_P^.NEXT;
                end;
         end;
      Result:=Retval;

   end;
begin
     DateNeed:=DateTimePickerNeed.Date;
     DateOld:=DateTimePicker1.Date;
     ModeSet:=RadioGroup1.ItemIndex;
     RazrFr:=SpinEditRazrFr.Value;
     RazrTo:=SpinEditRazrTo.Value;
     if (RazrTo < 1) or (RazrTo > 25) or
        (RazrFr < 1) or (RazrFr > 25) or
        (RazrTo < RazrFr) then
        begin
              ShowMessage('Неверно заданы разряды');
              Exit;
        end;
      if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

     if KategList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны категории');
             Exit;
        end;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны счета');
             Exit;
        end;
      Modenadb:=1;
      if RadioGroupNadb.ItemIndex<>1 then
         Modenadb:=0;  // С надбавками

      SavMonth := NMES;
      SavPodr  := NSRV;
      PUTINF;
      ldel_person;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      Sc:=0;
      DeCodeDate(DateNeed,wy,wm,wd);
      DeCodeDate(DateOld,oy,om,od);
      lm:=wm;
      ly:=wy;

      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                if not NameServList.IsSelected(NSRV) then continue;
                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                NeedPut:=false;
                Curr_Person:=Head_Person;
                while (Curr_Person<>Nil)do
                 begin
                      Razr:=GetRazrjadPerson(CURR_PERSON);
                      if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                      if KategList.IsSelected(Curr_Person^.Kategorija) then
                      if ((Razr>=RazrFr) and (Razr<=RazrTo)) then
          //            if (((IsDopl(Curr_Person)) and (ModeNadb=0)) or
          //                ((not IsDopl(Curr_Person)) and (ModeNadb=1))) then
                         begin
                              if ModeSet=0 then
                                 if GetBaseMonthYearPerson(Curr_Person, m , y) then
                                    begin
                               //           CurrDate:=EnCodedate(y,m,1);
                                          if ((m=om) and (y=oy)) then
                                             begin
                                                  SetBaseMonthYearPerson(Curr_Person, lm , ly);
                                                  NeedPut:=true;
                                             end
                                    end
                                 else
                              else
                                 begin
                                      if Curr_Person.Tabno=1356 then
                                         Curr_Person.Tabno:=1356;
                                      if cbLeaveNewer.Checked then
                                         begin
                                              if GetBaseMonthYearPerson(Curr_Person, m , y) then
                                              if (y<wy) or ((y=wy) and (m<wm)) then
                                                 SetBaseMonthYearPerson(Curr_Person, lm , ly);
                                         end
                                      else
                                         SetBaseMonthYearPerson(Curr_Person, lm , ly);
                                      NeedPut:=true;
                                 end;
                         end;
                      Curr_Person:=Curr_Person^.NEXT;
                 end;
                if NeedPut then putinf;
                while (head_person<>nil) do del_person(head_person);

          end;
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);
end;

procedure TFormSetBaseData.Button1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

procedure TFormSetBaseData.FormCreate(Sender: TObject);
begin
      cbLeaveNewer.Checked:=true;
end;

procedure TFormSetBaseData.RepairIndDate201404;
var SavMonth,SavPodr,Sc,I_NSRV,m,y,Razr ,lm,ly: integer;
    NeedPut:boolean;
    Curr_Person:Person_Ptr;
    wd,wm,wy:word;
    od,om,oy:word;
    CurrDate:TDatetime;

begin
     DateNeed:=DateTimePickerNeed.Date;
     DateOld:=DateTimePicker1.Date;
     ModeSet:=RadioGroup1.ItemIndex;
      SavMonth := NMES;
      SavPodr  := NSRV;
      PUTINF;
      ldel_person;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      Sc:=0;
      wm:=1;
      wy:=2013;
      lm:=12;
      ly:=2013;

      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                NeedPut:=false;
                Curr_Person:=Head_Person;
                while (Curr_Person<>Nil)do
                 begin
                      y:=0;
                      Razr:=GetRazrjadPerson(CURR_PERSON);
                      if GetBaseMonthYearPerson(Curr_Person, m , y) then
                      if (y<2013) and (y>2000) then
                          begin
                                if Razr<6 then
                                   SetBaseMonthYearPerson(Curr_Person, 12 , 2013)
                                else
                                   SetBaseMonthYearPerson(Curr_Person, 1 , 2013);
                                NeedPut:=true;
                          end;
                      Curr_Person:=Curr_Person^.NEXT;
                 end;
                if NeedPut then putinf;
                while (head_person<>nil) do del_person(head_person);

          end;
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);
end;
procedure TFormSetBaseData.RepairIndDate201511;
var SavMonth,SavPodr,Sc,I_NSRV,m,y,Razr ,lm,ly: integer;
    NeedPut:boolean;
    Curr_Person:Person_Ptr;
    wd,wm,wy:word;
    od,om,oy:word;
    countChanged:integer;
    CurrDate:TDatetime;
begin
      if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

      SavMonth := NMES;
      SavPodr  := NSRV;
      PUTINF;
      ldel_person;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      Sc:=0;
      countChanged:=0;
      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Application.ProcessMessages;
                if not NameServList.IsSelected(I_NSRV) then continue;
                NSRV:=I_NSRV;
                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                NeedPut:=false;
                Curr_Person:=Head_Person;
                while (Curr_Person<>Nil)do
                 begin
                      if (Curr_Person.MESTO_OSN_RABOTY<>82) then
                         begin
                              if GetBaseMonthYearPerson(Curr_Person, m , y) then
                                begin
                                     if (
                                          (y<2015) or
                                          ((y=2015) and (m<9))
                                        ) then
                                     SetBaseMonthYearPerson(Curr_Person, 9 , 2015);
                                     NeedPut:=true;
                                     Inc(countChanged);
                                end;
                         end;
                      Curr_Person:=Curr_Person^.NEXT;
                 end;
                if NeedPut then putinf;
                while (head_person<>nil) do del_person(head_person);

          end;
      ShowMessage('Готово. Изменено '+intToStr(countChanged)+' дат' );
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);
end;

procedure TFormSetBaseData.BitBtn3Click(Sender: TObject);
begin
     if  not ((NMES=02) and (WORK_YEAR_VAL=2016)) then
         begin
              ShowMessage('Эта фукнция доступна только в феврале 2016');

              Exit;
         end;
//     RepairIndDate201511;
     SetIndDate201601;

end;

procedure TFormSetBaseData.SetIndDate201601;
var SavMonth,SavPodr,Sc,I_NSRV,m,y,Razr ,lm,ly: integer;
    NeedPut:boolean;
    Curr_Person:Person_Ptr;
    wd,wm,wy:word;
    od,om,oy:word;
    countChanged:integer;
    CurrDate:TDatetime;
begin
      if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

      SavMonth := NMES;
      SavPodr  := NSRV;
      PUTINF;
      ldel_person;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      Sc:=0;
      countChanged:=0;
      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Application.ProcessMessages;
                if not NameServList.IsSelected(I_NSRV) then continue;
                NSRV:=I_NSRV;
                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                NeedPut:=false;
                Curr_Person:=Head_Person;
                while (Curr_Person<>Nil)do
                 begin
                      if not(STORONNEE_PODRAZD(Curr_Person.MESTO_OSN_RABOTY)) then
                         begin
                              SetBaseMonthYearPerson(Curr_Person, 1 , 2016);
                              NeedPut:=true;
                              Inc(countChanged);
                         end;
                      Curr_Person:=Curr_Person^.NEXT;
                 end;
                if NeedPut then putinf;
                while (head_person<>nil) do del_person(head_person);

          end;
      ShowMessage('Готово. Изменено '+intToStr(countChanged)+' дат' );
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);
end;


end.
