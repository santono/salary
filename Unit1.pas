unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
 var i:Integer;
     J:Cardinal;

begin
     i:=Ord(Edit1.Text[4]);
     J:=i*256*256*256;
     i:=Ord(Edit1.Text[3]);
     J:=j+i*256*256;
     i:=Ord(Edit1.Text[2]);
     J:=j+i*256;
     i:=Ord(Edit1.Text[1]);
     J:=j+i;
     j:=j mod 7;
     Label1.Caption:=IntToStr(j);

end;

end.
