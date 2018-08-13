unit tests;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
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
var dev:TextFile;
    nmbOfTest:Integer;
    nmbOfCity:Integer;
    nmbOfEdges:Integer;
    i,j,k:Integer;
begin
     nmbOfTest:=10;
     nmbOfCity:=9000;
     nmbOfEdges:=nmbOfCity div 2;
     Assign(dev,'d:t.txt');
     Rewrite(dev);
     Writeln(dev,trim(IntToStr(nmbOfTest)));
     for i:=1 to nmbOfTest do
         begin
              if i>1 then Writeln(dev);
              Writeln(dev,trim(IntToStr(nmbOfCity)));
              for j:=1 to nmbOfCity do
                 begin
                     Writeln(dev,'city'+intToStr(j));
                     for k:=1 to nmbOfEdges do
                         begin
                         
                         end;

                 end;

         end;
     CloseFile(dev);
end;

end.
