unit UFormGetDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFormGetDate = class(TForm)
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function GetMonYear(var M:integer; var Y:integer; var RecalcMode:integer; var RecalcProgram:integer):boolean;
var
  FormGetDate: TFormGetDate;

implementation
  uses ScrDef,DateUtils;
  var WantedDt:TDateTime;
      RecalcModeDt:Integer;
      RecalcProgramDt:Integer;

{$R *.dfm}

procedure TFormGetDate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormGetDate.FormCreate(Sender: TObject);
 var Dt : TDateTime;
     y,m,d  :  word;
begin
     m:=nmes;
     y:=CurrYear;
     dec(m);
     if (m<1) then
        begin
             Dec(Y);
             m:=12;
        end;
     dt:=EnCodeDate(y,m,1);
     DateTimePicker1.Date := dt;
     RadioGroup1.ItemIndex:=2;
end;

procedure TFormGetDate.BitBtn1Click(Sender: TObject);
 var Dt : TDateTime;
begin
     Dt := DateTimePicker1.Date;
     WantedDt:=Dt;
     RecalcModeDt:=RadioGroup1.ItemIndex;
     RecalcProgramDt:=1;
     ModalResult:=mrOk;
end;

function GetMonYear(var M:integer; var Y:integer; var RecalcMode:integer; var RecalcProgram:integer):boolean;
 var RetVal:boolean;
 begin
      RetVal:=false;
      Application.CreateForm(TFormGetDate,FormGetDate);
      if FormGetDate.ShowModal=mrOk then
         begin
              m:=monthof(WantedDt);
              y:=yearof(WantedDt);
              RecalcMode:=RecalcModeDt;
              if ((RecalcMode<0) or (RecalcMode>2)) then
                 RecalcMode:=2;
              RecalcProgram:=RecalcProgramDt;
              if ((RecalcProgram<0) or (RecalcProgram>2)) then
                 RecalcProgram:=1;
              RetVal:=true;
         end;
      GetMonYear:=RetVal;
 end;


procedure TFormGetDate.Button1Click(Sender: TObject);
 var Dt : TDateTime;
begin
     Dt := DateTimePicker1.Date;
     WantedDt:=Dt;
     RecalcModeDt:=RadioGroup1.ItemIndex;
     RecalcProgramDt:=2;
     ModalResult:=mrOk;
end;

end.
