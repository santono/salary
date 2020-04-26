unit toMoodle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var fNameI,FNameO:string;
    devi,devo:textFile;
    s:widestring;
    s1:widestring;
    i:integer;
begin
     if not OpenDialog1.Execute then exit;
     fNameI:= OpenDialog1.FileName;
     FNameO:=ExtractFilePath(fnamei)+'output.txt';
     AssignFile(devi,fnamei);
     AssignFile(devo,fnameo);
     Reset(devi);
     reWrite(devo);
     i:=0;
     while not eof(devi) do
      begin
           readln(devi,s);
           inc(i);
           s1:='::B '+trim(intToStr(i))+'::'+trim(s)+'{}';
           writeln(devo,s1);
           writeln(devo);
           writeln(devo);
      end;
     closeFile(devo);
     closeFile(devi);
     showMessage('Конвертация закончена');
end;

end.
