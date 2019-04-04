unit UFormTabelItogoClocks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormTabelItogoClocks = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LabelPPS: TLabel;
    LabelOther: TLabel;
    LabelPPSOuther: TLabel;
    LabelOtherOuther: TLabel;
    LabelPPSItogo: TLabel;
    LabelOtherITOGO: TLabel;
    LabelItogoRow: TLabel;
    LabelItogoInner: TLabel;
    LabelItogoOuter: TLabel;
    LabelItogoItogo: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure executeCalculations;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTabelItogoClocks: TFormTabelItogoClocks;

implementation
 uses scrdef,scrutil,Math;

{$R *.dfm}

procedure TFormTabelItogoClocks.FormCreate(Sender: TObject);
begin
     Caption:='Відпрацьовано годин у '+GetMonthUkr(nmes)+' '+intToStr(CURRYEAR)+' '+name_serv(nsrv);
     executeCalculations;
end;
procedure TFormTabelItogoClocks.executeCalculations;
 var curr_Person:Person_Ptr;
     clocksPPS,clocksOther,clocksTotal:real;
     clocksPPSOuther,clocksOtherOuther,clocksTotalOuther:real;
     clocksPPSItogo,clocksOtherItogo,clocksTotalItogo:real;
     s:string;
 begin
     clocksPPS:=0;
     clocksOther:=0;
     clocksTotal:=0;
     clocksPPSOuther:=0;
     clocksOtherOuther:=0;
     clocksTotalOuther:=0;
     clocksPPSItogo:=0;
     clocksOtherItogo:=0;
     clocksTotalItogo:=0;
     curr_person:=head_person;
     while (Curr_person<>Nil) do
      begin
           if Curr_Person.MESTO_OSN_RABOTY=82 then
              begin
                   if Curr_person^.KATEGORIJA=1 then
                      clocksPPSOUther:=clocksPPSOuther+WORK_CLOCK_LERA(1,31,curr_person)
                   else
                      clocksOtherOuther:=clocksOtherOuther+WORK_CLOCK_LERA(1,31,curr_person);
              end
           else
              begin
                   if Curr_person^.KATEGORIJA=1 then
                      clocksPPS:=clocksPPS+WORK_CLOCK_LERA(1,31,curr_person)
                   else
                      clocksOther:=clocksOther+WORK_CLOCK_LERA(1,31,curr_person);
              end;
           Curr_person:=Curr_Person^.next;
      end;
      clocksTotal:=clocksPPS+clocksOther;
      clocksTotalOuther:=clocksPPSOuther+clocksOtherOuther;
      clocksPPSItogo:=clocksPPS+clocksPPSOuther;
      clocksOtherItogo:=clocksOther+clocksOtherOuther;
      clocksTotalItogo:=clocksTotal+clocksTotalOuther;
      str(roundTo(clocksPPS,-1):10:1,s);
      LabelPPS.Caption:=s;
      str(roundTo(clocksOther,-1):10:1,s);
      LabelOther.Caption:=s;
      str(roundTo(clocksTotal,-1):10:1,s);
      LabelItogoInner.Caption:=s;
      str(roundTo(clocksPPSOuther,-1):10:1,s);
      LabelPPSOuther.Caption:=s;
      str(roundTo(clocksOtherOuther,-1):10:1,s);
      LabelOtherOuther.Caption:=s;
      str(roundTo(clocksTotalOuther,-1):10:1,s);
      LabelItogoOuter.Caption:=s;
      str(roundTo(clocksPPSItogo,-1):10:1,s);
      LabelPPSItogo.Caption:=s;
      str(roundTo(clocksOtherItogo,-1):10:1,s);
      LabelOtherITOGO.Caption:=s;
      str(roundTo(clocksTotalItogo,-1):10:1,s);
      LabelItogoItogo.Caption:=s;
      Application.ProcessMessages;
 end;

procedure TFormTabelItogoClocks.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

end.
