unit UFormMoveDoplTo156;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormMoveDoplTo156 = class(TForm)
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure executeMoveDoplTo156;
  end;

var
  FormMoveDoplTo156: TFormMoveDoplTo156;

implementation

{$R *.dfm}
  uses scrio,scrdef,scrnalog, scrlists, scrutil,uFormSelPKG;

procedure TFormMoveDoplTo156.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormMoveDoplTo156.FormCreate(Sender: TObject);
begin
      LabelPodr.Caption:='';
end;

procedure TFormMoveDoplTo156.BitBtn1Click(Sender: TObject);
begin
     if not ((nmes=11) and (CURRYEAR=2022)) then
        begin
             showMessage('Перенос можно выполнить только в ноябре 2022 г.');
             exit;
        end;
     BitBtn1.Enabled:=False;
     Application.ProcessMessages;
     executeMoveDoplTo156;
     ShowMessage('Перенос выполнен!');
end;

procedure TFormMoveDoplTo156.executeMoveDoplTo156;
const wantedShifr=DOPL_DO_MIN_SHIFR;
      id=37;
      wantedPeriod=10;
      wantedYear=2022;
      mess='До.мин.з.п.10.22';
 var tmpNMES : integer;
     tmpNSRV : integer;
     i_nsrv  : integer;
     curr_person:person_ptr;
     maked   : boolean;
     cntMaked: Integer;
 procedure  moveDoplInPerson(curr_person:person_ptr);
  var Curr_Person_Jan:person_ptr;
      curr_Add:Add_ptr;
      summa:real;
  BEGIN
       SUMMA:=0;
       curr_add:=curr_person^.add;
       while (curr_add<>nil) do
        begin
             IF Curr_add^.SHIFR=WANTEDSHIFR THEN
             IF Curr_add^.PERIOD=wantedPeriod THEN
             IF Curr_add^.YEAR+1990=wantedYear THEN
                begin
                      SUMMA:=curr_add^.SUMMA;
                      curr_add^.SHIFR:=PerersZaProshlPeriody;
                      put156MessageToCn(curr_person,CURR_adD^.PERIOD,summa,Curr_Add^.who,Mess);
                      maked:=True;
                      Inc(cntMaked);
                end;
             curr_add:=curr_add^.NEXT;
        end;
  END;


 begin
      tmpNMES := NMES;
      tmpNSRV := NSRV;
      putinf;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      ProgressBar1.Step:=1;
      cntMaked:=0;
      for I_NSRV:=1 to Count_Serv do
        begin
              ProgressBar1.StepIt;
              LabelPodr.Caption:=Name_Serv(i_NSRV);
              Application.ProcessMessages;
              nsrv:=i_nsrv;
              mkflnm;
              if not fileexists(fninf) then continue;
              getinf(true);
              maked:=false;
              curr_person:=head_person;
              while (curr_person<>nil) do
                 begin
//                   if (curr_person.AUTOMATIC=MANUAL_MODE) then
//                      begin
//                           curr_person:=curr_person^.NEXT;
//                           continue;
//                      end;
                   moveDoplInPerson(curr_person);
                   curr_person:=curr_person^.NEXT;
                 end;
              if maked then
                 putinf;
              EMPTY_ALL_PERSON;
        end;
      NMES := tmpNMES;
      NSRV := tmpNSRV;
      MKFLNM;
      getinf(true);
      ShowMessage('Перенесено '+IntToStr(cntMaked)+' статей.');
 end;



end.
