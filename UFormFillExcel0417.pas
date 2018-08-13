unit UFormFillExcel0417;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery;

type
  TFormFillExcel0417 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure fillExcel;
    { Public declarations }
  end;

var
  FormFillExcel0417: TFormFillExcel0417;

implementation
  uses scrdef,scrutil,comobj,UFibModule,Math,scrlists;

{$R *.dfm}

procedure TFormFillExcel0417.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormFillExcel0417.BitBtn1Click(Sender: TObject);
begin
     if yesNo('Перенести данные отчета за 04 2017 в Excel?') then
        fillExcel;
end;

procedure TFormFillExcel0417.fillExcel;
var E,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    sheetNo:integer;
  procedure fillPage3(modeu:integer=1);
   const lenids=27;
         shifrs:array[1..lenids] of integer=( 1,  5,  7,  8, 10,
                                             12, 13, 17, 18, 22,
                                             30, 33, 37, 38, 39,
                                             40, 41, 44, 45, 48,
                                            138,155,156,158,163,
                                            164,169);
   const lenidsk=16;
         shifrsk:array[1..lenidsk] of integer=( 1,  5,  8, 12, 13,
                                              17, 30, 33, 37, 39,
                                              40,150,151,152,153,
                                            169);                                       
   var SQLStmnt:String;
       razr,shifrsta:integer;
       summa:real;
       row,col,i:integer;
   begin
        row:=6;
        sheetNo:=3;
        if modeu=1 then
        for i:=1 to lenids do
            begin
                 col:=i+9;
                 shifrsta:=shifrs[i];
                 E.WorkBooks[1].WorkSheets[sheetNo].Cells[Row,Col]:=shifrsta;
                 E.WorkBooks[1].WorkSheets[sheetNo].Cells[Row+1,Col]:=ShifrList.GetName(ShifrSta);
            end
        else
        for i:=1 to lenidsk do
            begin
                 col:=i+9;
                 shifrsta:=shifrsk[i];
                 E.WorkBooks[1].WorkSheets[sheetNo].Cells[Row,Col]:=shifrsta;
                 E.WorkBooks[1].WorkSheets[sheetNo].Cells[Row+1,Col]:=ShifrList.GetName(ShifrSta);
            end;


        SQLStmnt:='select b.shifrsta,bb.razr,sum(b.summa) from tb_rclc0416_det b join tb_rclc0416 bb on b.idowner=bb.id group by 1,2 order by shifrsta';
        pFIBQuery1.Transaction.StartTransaction;
        pFIBQuery1.SQL.Clear;
        pFIBQuery1.SQL.Add(SQLStmnt);
        pFIBQuery1.ExecQuery;
        while not pFIBQuery1.Eof do
          begin
               razr:=pFIBQuery1.Fields[1].Value;
               shifrsta:=pFIBQuery1.Fields[0].Value;
               summa:=pFIBQuery1.Fields[2].Value;
               if (abs(summa)>0.01) then
                  begin
                       row:=razr+7;
                       if shifrsta=1 then
                          begin
                               col:=3;
                               E.WorkBooks[1].WorkSheets[sheetNo].Cells[Row,Col]:=roundTo(summa/1000.00,0);
                          end;     
                       col:=0;
                       if modeu=1 then
                       for i:=1 to lenids do
                           begin
                                if shifrsta=shifrs[i] then
                                   begin
                                        col:=i+9;
                                        break;
                                   end;
                           end
                       else
                       for i:=1 to lenidsk do
                           begin
                                if shifrsta=shifrsk[i] then
                                   begin
                                        col:=i+9;
                                        break;
                                   end;
                           end ;

                       if col>0 then
                          begin
                               E.WorkBooks[1].WorkSheets[sheetNo].Cells[Row,Col]:=roundTo(summa,-2);
                          end
                  end;
               pFIBQuery1.Next;
          end;
   end;
 begin
     FName:=TemplateDIR+'Swod0417.xlt';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.WorkBooks.Open(FName);
     E.Visible := true;

     fillPage3(1);
//     fillPage1;
//     fillPage2
//     ExRow:=13;
//     ExCol:=11;
//     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=Dolg;
       showMessage('Перенос закончен');

 end;


end.
