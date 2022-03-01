unit FormRecalcPersonU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls,ScrDef;

type
  TFormTestRecalcPerson = class(TForm)
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTestRecalcPerson: TFormTestRecalcPerson;
  Curr_Person:Person_Ptr;

implementation
 uses ScrExport,DateUtils;

{$R *.dfm}

procedure TFormTestRecalcPerson.BitBtn1Click(Sender: TObject);
var YearZa,MonthZa:integer;
    Y,M,D:word;
begin
     BitBtn1.Enabled:=False;
     Application.ProcessMessages;
     DecodeDate(DateTimePicker1.Date,Y,M,D);
     YearZa:=Y;
     MonthZa:=M;
     Recalc_Person_Sql(Curr_Person,YearZa,MonthZa,0);
     BitBtn1.Enabled:=true;
     Application.ProcessMessages;
end;

procedure TFormTestRecalcPerson.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormTestRecalcPerson.FormCreate(Sender: TObject);
var dt:TDateTime;
    y,m:Integer;
begin
      Label1.Caption := Trim(Curr_Person^.FIO)+' '+Trim(Curr_Person^.Dolg);
      y:=CURRYEAR;
      m:=nmes;
      Dec(m);
      if m<1 then
         begin
              m:=12;
              Dec(y);
         end;
      dt:=EncodeDate(y,m,1);
      DateTimePicker1.Date:=dt;
      if isSVDN then
         begin
               Caption:='Перевiрка перерахунку спiвробiтника';
               Label1.Caption:='Рiк та мiсяць для перерахунку';
         end

end;

end.
