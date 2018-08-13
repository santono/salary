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
 uses ScrExport;

{$R *.dfm}

procedure TFormTestRecalcPerson.BitBtn1Click(Sender: TObject);
var YearZa,MonthZa:integer;
    Y,M,D:word;
begin
     DecodeDate(DateTimePicker1.Date,Y,M,D);
     YearZa:=Y;
     MonthZa:=M;
     Recalc_Person_Sql(Curr_Person,YearZa,MonthZa,0);
end;

procedure TFormTestRecalcPerson.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormTestRecalcPerson.FormCreate(Sender: TObject);
begin
      Label1.Caption := Trim(Curr_Person^.FIO)+' '+Trim(Curr_Person^.Dolg);
end;

end.
