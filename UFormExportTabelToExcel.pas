unit UFormExportTabelToExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormExportTabelToExcel = class(TForm)
    BitBtnDoExport: TBitBtn;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnDoExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    dayCodes:array[1..31] of integer;
    procedure exportToExcel;
    procedure fillDayCodes;
    function  getDayCode(i:integer):integer;
    function  getSTabel(CodeT:Byte):String;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExportTabelToExcel: TFormExportTabelToExcel;

implementation
  uses scrdef,scrutil,ComObj;

{$R *.dfm}

 const
         xlDown=-4121;
         //Border
         xlHairline = 	1;// 	Сверхтонкая (тонкой границы).
         xlMedium   = 	-4138; 	//От среднего.
         xlThick 	  =   4; 	//Жирное (широкой границы).
         xlThin 	  =   2;  //
         MAX_TABEL_KOD=17;
         SHIFR_TABEL:ARRAY[1..MAX_TABEL_KOD] OF STRING[2]=
         ('Я ','ОЖ','К ','Т ','У ','ОТ','А ','ЛЧ','Е ','Ч ','Г ','Р ','Б ','ПР','  ','ЛТ','До');

procedure TFormExportTabelToExcel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormExportTabelToExcel.BitBtnDoExportClick(Sender: TObject);
begin
     exportToExcel;
     self.Close;
end;

procedure TFormExportTabelToExcel.exportToExcel;
 var e:variant;
     fileName:string;
     s,s1:string;
     i,j,jjw,jjo,jji,jjt,k,r,l,d,currRow,sc:integer;
     dt:TdateTime;
     curr_person:person_ptr;
     lineno:integer;
     koef:real;
     pol,nal_code,koefS:string;
     shifrdol:integer;
     se:string;
 begin
      fillDayCodes;
      if kz<0 then exit;
      if isSVDN then
         fileName:=TemplateDIR+'Tabel_Short_SNU.xlt'
      else
         fileName:=TemplateDIR+'Tabel_Short_LNU.xlt';
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
//      E.Visible:=true;
      ProgressBar1.Min:=0;
      ProgressBar1.Max:=count_person;
      ProgressBar1.Position:=0;
      E.Visible:=false;
      E.WorkBooks.Open(fileName);
      s:=E.WorkBooks[1].WorkSheets[1].Cells[1,1];
      s1:=Trim(Name_Serv(nsrv));
      s:=Stringreplace(s,'Бухгалтерии',s1,[rfReplaceAll]);
      s1:=intToStr(curryear);
      s:=Stringreplace(s,'2018',s1,[rfReplaceAll]);
      if isSVDN then
         s1:='за '+getMonthUkr(nmes)
      else
         s1:='за '+getMonthRus(nmes);
      s:=stringReplace(s,'за                                            ',s1,[rfReplaceAll]);
      E.WorkBooks[1].WorkSheets[1].Cells[1,1]:=s;
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
//      for i:=1 to 3 do
      for i:=1 to 1 do
          begin
                case i of
                 1 : r:=3;
                 2 : r:=43;
                 3 : r:=81;
                end;
                if l=28 then
                   for j:=18 to 21 do
                       E.WorkBooks[1].WorkSheets[1].Cells[r,j]:=''
                else
                if l=29 then
                   for j:=19 to 21 do
                       E.WorkBooks[1].WorkSheets[1].Cells[r,j]:=''
                else
                if l=31 then
                       E.WorkBooks[1].WorkSheets[1].Cells[r,20]:='31';
          end;
//      for i:=1 to 3 do
      for i:=1 to 1 do
          begin
                d:=0;
                case i of
                 1 : r:=2;
                 2 : r:=42;
                 3 : r:=80;
                end ;
                for j:=6 to 21 do
                    begin
                         inc(d);
                         if (getDayCode(d)>1)then
                            E.WorkBooks[1].WorkSheets[1].Cells[r,j].Interior.Color:= clLtGray;
                    end;
                inc(r);
                for j:=6 to 21 do
                    begin
                        if d<l then
                           begin
                                 inc(d);
                                if (getDayCode(d)>1)then
                                   E.WorkBooks[1].WorkSheets[1].Cells[r,j].Interior.Color:= clLtGray;
                           end;
                    end;
          end;
      curr_person:=head_person;
      lineno:=0;
      currRow:=2;
      sc:=0;
      while (curr_person<>nil) do
        begin
            sc:=sc+1;
            ProgressBar1.Position:=sc;
            Label1.Caption:=trim(Curr_person^.fio)+' '+trim(curr_person^.dolg);
            Application.ProcessMessages;

             shifrDol:=getDolPerson(curr_person);
             if (shifrDol=1500) then
                 begin
                      curr_person:=curr_person^.next;
                      continue;
                 end;
//             E.WorkBooks[1].WorkSheets[1].Cells[currRow+2,1].Select;
//             E.WorkBooks[1].WorkSheets[1].Cells[currRow+4,1].Select;
             se:=intToStr(currRow+4)+':'+intToStr(currRow+5);
             E.WorkBooks[1].WorkSheets[1].Rows[se].Select;
             E.Selection.Insert(Shift :=xlDown);
             for i:=1 to 26 do
                 begin
                     if ((i>5) and (i<22)) then continue;
                     E.WorkBooks[1].WorkSheets[1].Range[E.WorkBooks[1].WorkSheets[1].Cells[currRow+4, i], E.WorkBooks[1].WorkSheets[1].Cells[currRow+5, i]].Select;
                     E.Selection.MergeCells:=True;
                 end;
             for i:=1 to 26 do
                 begin
//                     if ((i>5) and (i<22)) then continue;
                     E.WorkBooks[1].WorkSheets[1].Range[E.WorkBooks[1].WorkSheets[1].Cells[currRow+4, i], E.WorkBooks[1].WorkSheets[1].Cells[currRow+4, i]].Select;
                     E.Selection.Borders.Weight:=xlMedium;
                     E.Selection.Borders.LineStyle:=1;
                     if ((i>5) and (i<22)) then
                        begin
                             E.WorkBooks[1].WorkSheets[1].Range[E.WorkBooks[1].WorkSheets[1].Cells[currRow+5, i], E.WorkBooks[1].WorkSheets[1].Cells[currRow+5, i]].Select;
                             E.Selection.Borders.Weight    := xlMedium;
                             E.Selection.Borders.LineStyle := 1;
                        end;

                 end;
             //             E.Selection.EntireRow.Insert;
//             WC:=E.ActiveCell;
             inc(lineno);
//             if (lineno=20)  then
//                currRow:=42
//             else
//             if (lineno=38)  then
//                currRow:=80;
             currRow:=currRow+2;
             E.WorkBooks[1].WorkSheets[1].Cells[currRow,1]:=lineNo;
             E.WorkBooks[1].WorkSheets[1].Cells[currRow,3]:=trim(Curr_Person^.Fio);
             E.WorkBooks[1].WorkSheets[1].Cells[currRow,4]:=trim(Curr_Person^.Dolg);
             koef:=GET_KOEF_OKLAD_PERSON(Curr_person);
             nal_code:=curr_person^.nal_code;
             pol:='';
             if (length(trim(nal_code))=10) then
                begin
                    pol:=getPolRusByNalCode(nal_code);
                    E.WorkBooks[1].WorkSheets[1].Cells[currRow,2]:=trim(pol);
                end;
             koefS:=FormatFloatPoint(koef);
             koefs:=stringReplace(koefs,'.00','',[rfReplaceAll]);
             if (koef>0.0001) then
                 E.WorkBooks[1].WorkSheets[1].Cells[currRow,5]:=trim(koefS);
             for i:=1 to l do
                 begin
                      if i<17 then
                         E.WorkBooks[1].WorkSheets[1].Cells[currRow,5+i]:=Self.GetSTabel(Curr_Person^.Tabel[i])
                      else
                         E.WorkBooks[1].WorkSheets[1].Cells[currRow+1,5+(i-16)]:=Self.GetSTabel(Curr_Person.Tabel[i]);
                 end;
             JJW:=Work_Day(1,31,Curr_Person);
             if JJW>0 then
                E.WorkBooks[1].WorkSheets[1].Cells[currRow,22]:=IntToStr(JJW);
             JJO:=Otpusk_Day(1,Curr_Person);
             if JJO>0 then
                E.WorkBooks[1].WorkSheets[1].Cells[currRow,24]:=IntToStr(JJO);
             JJI:=Ill_Day(1,Curr_Person);
             if JJI>0 then
                E.WorkBooks[1].WorkSheets[1].Cells[currRow,25]:=IntToStr(JJI);
             jjt:=jjw+jjo+jji;
             if JJT>0 then
                E.WorkBooks[1].WorkSheets[1].Cells[currRow,26]:=IntToStr(JJT);
             curr_person:=curr_person^.NEXT;
        end;
      E.Visible:=true;


      e.quit;
      e := Unassigned;
 end;
 procedure TFormExportTabelToExcel.fillDayCodes;
  var FName,s:string;
      dev:textFile;
      i:integer;
  begin
       fillChar(daycodes,SIZEOF(daycodes),0);
       kz:=0;
       s:=intToStr(currYear-2000);
       if currYear<2010 then s:='0'+s;
       fName:=cdir+'month'+s+'.txt';
       if not fileExists(fName) then
          begin
               showMessage('Отсутствует файл '+fName);
               kz:=-1;
               Exit;
          end;
        AssignFile(dev,fName);
        Reset(dev);
        i:=1;
        if i<nmes then
           for i:=1 to nmes-1 do
               readln(dev);
        for i:=1 to 31 do
            read(dev,dayCodes[i]);
        closeFile(dev);
  end;
 function TFormExportTabelToExcel.getDayCode(i:integer):integer;
   var retVal:integer;
   begin
         retVal:=0;
        if ((i>0) and (i<321)) then
            retVal:=dayCodes[i];
        getDayCode:=retVal;
   end;
 function TFormExportTabelToExcel.GetSTabel(CodeT:Byte):String;
  begin
      Result:=' ';
      if ((CodeT>0) and (CodeT<=MAX_TABEL_KOD)) then
         Result:=Trim(SHIFR_TABEL[CodeT]);
  end;


procedure TFormExportTabelToExcel.FormCreate(Sender: TObject);
begin
     Label1.Caption:='';

end;

end.
