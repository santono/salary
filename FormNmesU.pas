unit FormNmesU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TFormNmes = class(TForm)
    StringGrid1: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetNMes(I:integer);
    function GetNMes:integer;
    function Execute: boolean;
  private
    SelectedNMes:integer;
    procedure MakeGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNmes: TFormNmes;

implementation
  uses ScrDef,ScrLists,ScrExport,ScrUtil;

procedure TFormNmes.FormCreate(Sender: TObject);
begin
end;

{$R *.dfm}

procedure TFormNmes.MakeGrid;
 var i:integer;
 begin
     ModalResult := mrCancel;
     StringGrid1.ColCount:=2;
     StringGrid1.RowCount:=13;

     StringGrid1.ColWidths[0]:=40;
     StringGrid1.ColWidths[1]:=100;
     StringGrid1.Width:=StringGrid1.ColWidths[0]+StringGrid1.ColWidths[1]+5;
     Width:=StringGrid1.Width+50;
     Height:=StringGrid1.Height+100;
     StringGrid1.Cells[0,0]:='Номер';
     StringGrid1.Cells[1,0]:='Месяц';
     for i:=1 to 12 do
       begin
            StringGrid1.Cells[0,i]:=IntToStr(I);
            StringGrid1.Cells[1,i]:=GetMonthRus(I);
       end;
     if (SelectedNmes>0) and (SelectedNmes<13) then
        StringGrid1.Row:=SelectedNmes;
{     StringGrid1.SetFocus;}
end;

procedure TFormNmes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormNmes.StringGrid1DblClick(Sender: TObject);
var S:String;
    i,k:integer;
begin
     S:=StringGrid1.Cells[0,StringGrid1.Row];
     val(S,I,K);
     SelectedNmes:=0;
     if k=0 then SelectedNmes:=I;
     ModalResult:=mrOk;
{     FormClose;      }
end;

procedure TFormNmes.FormShow(Sender: TObject);
begin
     Self.MakeGrid;
     StringGrid1.SetFocus;
end;

procedure TFormNmes.SetNMes(I:integer);
 begin
      SelectedNmes:=i;
 end;

function TFormNmes.GetNMes:integer;
 begin
      Result:=SelectedNmes;
 end;

function TFormNmes.Execute: boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;

end.
