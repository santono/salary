unit UFormAskData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormAskData = class(TForm)
    DateTimePickerData: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Data:TDateTime;
  public
    function GetData:TDateTime;
    { Public declarations }
  end;

var
  FormAskData: TFormAskData;

implementation
  uses DateUtils;

{$R *.dfm}

procedure TFormAskData.FormCreate(Sender: TObject);
begin
     Data:=EnCodeDate(yearOf(Date()),monthOf(Date()),1);
     DateTimePickerData.Date:=Data;
end;

procedure TFormAskData.BitBtn1Click(Sender: TObject);
begin
     Data:=DateTimePickerData.Date;
     Data:=StartOfTheMonth(Data);
     ModalResult:=mrOk;
end;

function TFormAskData.GetData:TDateTime;
begin
     GetData:=Data;
end;

end.
