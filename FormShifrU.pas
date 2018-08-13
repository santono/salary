unit FormShifrU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids;

type
  TFormShifr = class(TForm)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormShifr: TFormShifr;

implementation
   uses ScrDef,ScrLists,ScrExport;
{$R *.dfm}

procedure TFormShifr.FormCreate(Sender: TObject);
var i:integer;
    ShifrRec:PShifrRec;
begin
     StringGrid1.ColCount:=10;
     StringGrid1.RowCount:=Count_Shifr;
     StringGrid1.Cells[0,0]:='Номер';
     StringGrid1.Cells[1,0]:='Название';
     StringGrid1.Cells[2,0]:='Под.н.';
     StringGrid1.Cells[3,0]:='Пенс.н.';
     StringGrid1.Cells[4,0]:='Проф.вз.';
     StringGrid1.Cells[5,0]:='Ф.з.';
     StringGrid1.Cells[6,0]:='Отп.';
     StringGrid1.Cells[7,0]:='Болн.';
     StringGrid1.Cells[8,0]:='Алим.';
     StringGrid1.Cells[9,0]:='Соц.с.';
     for i:=1 to ShifrList.Count do
       begin
            ShifrRec:=ShifrList.Items[i-1];
{            StringGrid1.Cells[0,i]:=IntToStr(PodrRec^.Shifr);}
            StringGrid1.Cells[0,i]:=IntToStr(ShifrRec.Shifr);
            StringGrid1.Cells[1,i]:=ShifrRec^.Short_Name;
            if ShifrRec^.Add then
               begin
                    if (ShifrRec^.Attrib and fsPodoh)<>0  then StringGrid1.Cells[2,i]:='+';
                    if (ShifrRec^.Attrib and fsPens)<>0   then StringGrid1.Cells[3,i]:='+';
                    if (ShifrRec^.Attrib and fsProf)<>0   then StringGrid1.Cells[4,i]:='+';
                    if (ShifrRec^.Attrib and fsFondZ)<>0  then StringGrid1.Cells[5,i]:='+';
                    if (ShifrRec^.Attrib and fsOtpusk)<>0 then StringGrid1.Cells[6,i]:='+';
                    if (ShifrRec^.Attrib and fsBoln)<>0   then StringGrid1.Cells[7,i]:='+';
                    if (ShifrRec^.Attrib and fsAlim)<>0   then StringGrid1.Cells[8,i]:='+';
                    if (ShifrRec^.Attrib and fsS_s)<>0    then StringGrid1.Cells[9,i]:='+';
               end;
     {       StringGrid1.Row:=10;}
       end;
end;

procedure TFormShifr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree
end;

procedure TFormShifr.BitBtn2Click(Sender: TObject);
begin
     ExportShifr;
end;

end.
