unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids;

type
  TFormPodr = class(TForm)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPodr: TFormPodr;

implementation
  uses ScrDef;
{$R *.dfm}

procedure TFormPodr.FormCreate(Sender: TObject);
var i:integer;
    PodrRec:PPodrRec;
begin
     for i:=1 to NameServList.Count do
       begin
            PodrRec:=NameServList.Items[i];
            StringGrid1.Cells[i-1,0]:=IntToStr(PodrRec^.Shifr);
            StringGrid1.Cells[i-1,1]:=PodrRec^.Name;
       end;
end;

procedure TFormPodr.BitBtn1Click(Sender: TObject);
begin
     Action:=caFree;
end;

end.
