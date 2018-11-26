unit UFormExportTableToExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormExportTableToExcel = class(TForm)
    BitBtnDoExport: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnDoExportClick(Sender: TObject);
  private
    procedure exportToExcel;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExportTableToExcel: TFormExportTableToExcel;

implementation
  uses scrdef,scrutil,ComObj;

{$R *.dfm}

procedure TFormExportTableToExcel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormExportTableToExcel.BitBtnDoExportClick(Sender: TObject);
begin
     exportToExcel;
end;

procedure TFormExportTableToExcel.exportToExcel;
 var e:variant;
     fileName:string;
     s,s1:string;
     i,j,k,r,l:integer;
     dt:TdateTime;

 begin
      fileName:=TemplateDIR+'Tabel_LNU.xlt';
      if not FileExists(fileName) then
        begin
             ShowMessage('Отсутствует шаблон '+fileName);
             Exit;
        end;
      try
         E:=CreateOleObject('Excel.Application');
      except
         ShowMessage('Ошибка запуска Excel');
         Exit;
      end;
      E.Visible:=true;
      E.WorkBooks.Open(fileName);
      s:=E.WorkBooks[1].WorkSheets[1].Cells[1,1];
      s1:=Trim(Name_Serv(nsrv));
      s:=Stringreplace(s,'Бухгалтерия',s1,[rfReplaceAll]);
      s1:=intToStr(curryear);
      s:=Stringreplace(s,'2018',s1,[rfReplaceAll]);
      s1:='за '+getMonthRus(nmes);
      s:=stringReplace(s,'за                                            ',s1,[rfReplaceAll]);
      for i:=1 to 3 do
          begin
                case i of
                 1 : r:=2;
                 2 : r:=42;
                 3 : r:=80;
                end ;
                for j:=6 to 21 do
                    E.WorkBooks[1].WorkSheets[1].Cells[r,j].Interior.Color:= clWhite;
                inc(r);
                for j:=6 to 21 do
                    E.WorkBooks[1].WorkSheets[1].Cells[r,j].Interior.Color:= clWhite;
          end;
      dt:=encodedate(curryear,nmes,1);
      l:=lenmonth(dt);
      for i:=1 to 3 do
          begin
                case i of
                 1 : r:=3;
                 2 : r:=43;
                 3 : r:=81;
                end;
                if i=28 then
                   for j:=18 to 21 do
                       E.WorkBooks[1].WorkSheets[1].Cells[r,j]:=''
                else
                if i=29 then
                   for j:=19 to 21 do
                       E.WorkBooks[1].WorkSheets[1].Cells[r,j]:=''
                else
                if i=31 then
                       E.WorkBooks[1].WorkSheets[1].Cells[r,20]:='31';
          end;
      e.free;
 end;

end.
