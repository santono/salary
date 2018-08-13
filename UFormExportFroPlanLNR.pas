unit UFormExportFroPlanLNR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  StdCtrls, Buttons, ComCtrls, FIBQuery, pFIBQuery;

type
  TFormExportFroPlanLNR = class(TForm)
    dsLists: TpFIBDataSet;
    btn2: TBitBtn;
    dtpDate: TDateTimePicker;
    fbntgrfldListsTABNO: TFIBIntegerField;
    dsListsFIO: TFIBStringField;
    dsListsZW: TFIBStringField;
    dsListsST: TFIBStringField;
    dsListsDOLG: TFIBStringField;
    pb1: TProgressBar;
    lblFio: TLabel;
    fbntgrfldListsRAZR: TFIBIntegerField;
    dsListsPROCUSFINAL: TFIBBCDField;
    dsListsPROCUZFINAL: TFIBBCDField;
    dsListsSTAG: TFIBBCDField;
    pfbtrnsctn1: TpFIBTransaction;
    dsListsPROCVYSLFINAL: TFIBBCDField;
    dsListsKOEF: TFIBBCDField;
    pfbqryL: TpFIBQuery;
    dsListsPROCPZWFINAL: TFIBBCDField;
    dsListsPZW: TFIBStringField;
    cbVisual: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    e:variant;
    sheetNo:Integer;
    sheetNoCalc:Integer;
    R_O:array[1..25] of real;

    procedure moveToExcel(mode:integer);
    function makeDolg(d:string):string;
    function openExcel:boolean;
    procedure moveKategToExcel(mode:integer);
    function FillOkladyForRazr:boolean;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExportFroPlanLNR: TFormExportFroPlanLNR;

implementation
   uses UFibModule,uFormWait,ComObj,DateUtils,ScrUtil,ScrDef,ExcelXP;

{$R *.dfm}

procedure TFormExportFroPlanLNR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if dsLists.Active then
        dsLists.Close;
     if pfbqryL.Open then
        pfbqryL.Close;
     if dsLists.Transaction.Active then
        dsLists.Transaction.Commit;
      Action:=caFree;
end;

procedure TFormExportFroPlanLNR.btn1Click(Sender: TObject);
begin
     FormWait.Show;
     Application.ProcessMessages;
     FIB.pFIBDatabaseSal.Execute('update kadry set comment=null');
     FormWait.Hide;
     Application.ProcessMessages;
end;

procedure TFormExportFroPlanLNR.btn2Click(Sender: TObject);

begin
     if not openExcel then exit;
     FormWait.Show;
     Application.ProcessMessages;
     FIB.pFIBDatabaseSal.Execute('update kadry set comment=null');
     FillOkladyForRazr;
     FormWait.Hide;
     Application.ProcessMessages;
     
     moveKategToExcel(1);
     moveKategToExcel(2);
     moveKategToExcel(3);
     moveKategToExcel(4);
     e.Calculation:=xlAutomatic;
     e.ScreenUpdating := true;
     e.DisplayAlerts  := true;

     e.Workbooks[1].WorkSheets[SheetNoCalc].EnableCalculation:=-1;
     e.Workbooks[1].WorkSheets[SheetNoCalc].calculate;
     e.visible:=true;
     e.UserControl := True; // отдадим управление пользователю
  //   e.Quit; // закрыть Excel
  //   e.Disconnect;
  //   FreeAndNil(e);
end;

function TFormExportFroPlanLNR.makeDolg(d:string):string;
  var finished:Boolean;
       i:Integer;
       l:Integer;
       retVal:string;
       dd:string;
  begin
       finished:=False;
       retVal:='';
       dd:=Trim(d);
       l:=Length(dd);
       if l>0 then
          for i:=1 to l do
             begin
                  if not (dd[i]  in ['0','1','2','3','4','5','6','7','8','9']) then
                     begin
                          retVal:=Copy(dd,i,length(dd));
                          finished:=True;
                          Break;
                     end;
             end;

       makeDolg:=retVal;
  end;
procedure TFormExportFroPlanLNR.moveToExcel(mode:integer);
 var
     StartRow:Integer;
     StartRowCalc:integer;
     StepRow:Integer;
     LimitNumber:Integer;
     FioCol,DolgCol,ZwanCol:Integer;
     CurrRow:integer;
     Fio,ShortF:string;
     Dolg,NameDolg:string;
     Uz,us, Kateg:string;
     nmbOfLines:Integer;
     RazrCol,RazrRow,CurrRazrRow:Integer;
     ProcStCol:Integer;
     ProcZwCol:Integer;
     PochetnZwCol:Integer;
     SummaOzdCol:Integer;
     VyslCol:Integer;
     Razr:Integer;
     StagYearA:Real;
     StagYear:Integer;
     ProcStA:Real;
     ProcSt:Integer;
     ProcZwA:Real;
     ProcZw:Integer;
     ProcVyslA:Real;
     ProcVysl:Integer;
     ProcPZA:Real;
     ProcPz:Integer;
     procBibl:Integer;
     procUbor:Integer; // уборщица - за вредность
     i,j:Integer;
     s:string;
     Clockcol:Integer;
     koefCol:Integer;
     biblCol:Integer;
     uborCol:Integer;
     nightCol:integer;
     prazdnCol:integer;
     koef:Double;
     clocks:Integer;
     SQLStmnt,SQLStmntCount:widestring;
     nameMode:string;
     sc:Integer;
     summaZw,summaOZD:real;
     summaNight,summaPrazdn:real;
     tabno:Integer;
 begin
     case mode of
      1: begin                //АУП - ППС
           sheetNo := 1;      //Номер листа с фамилиями
           StartRow:=2;
           RazrRow :=3280;    //строка для заполнени данных по зп по месяцу
           FioCol  :=12;
           DolgCol :=13;
           ZwanCol :=15;
           StepRow := 2;
           LimitNumber:=130;
           RazrCol:=6;
           ProcStCol:=48;
           ProcZwCol:=76; //Было 42;
           PochetnZwCol:=39;
           summaOzdCol:=90;
           VyslCol:=37;
           ClockCol:=11;
           koefCol:=12;
           biblCol:=0;
           uborCol:=0;
           nightCol:=0;
           prazdnCol:=0;
           nameMode:='АУП';
         end;
      2: begin
           SheetNo  := 1 ; //Номер листа с фамилиями
           StartRow := 0;
           RazrRow  := 4;
           StepRow  := 4;
           FioCol   := 2;
           DolgCol  := 3;
           ZwanCol  := 4;
           LimitNumber:=780;
           RazrCol:=6;
           ProcStCol:=48; //Было 48
           ProcZwCol:=76; // было 42;
           PochetnZwCol:=39;
           VyslCol  := 37;
           ClockCol := 11;
           koefCol  := 12;
           biblCol  := 0;
           uborCol  := 0;
           nightCol:=0;
           prazdnCol:=0;
           summaOzdCol:=90;
           nameMode:='ППС';
         end;
      3: begin
           SheetNo:=2; //УВП
           StartRow:=3;
           RazrRow:=3543;
           StepRow:=1;
           FioCol  :=2;
           DolgCol :=3;
           ZwanCol :=4;
           LimitNumber:=650;
           RazrCol:=6;
           ProcStCol:=0;
           ProcZwCol:=0;
           PochetnZwCol:=0;
           VyslCol:=37;     //Выслуга для библиотекарей
           ClockCol:=11;
           KoefCol:=12;
           biblCol:=35;
           uborCol:=0;
           nightCol:=0;
           prazdnCol:=0;
           summaOzdCol:=0;
           nameMode:='УВП';
         end;
      4: begin                  //Рабочие
           SheetNo:=2;
           StartRow:=3;
           RazrRow:=4195;
           StepRow:=1;
           FioCol  :=7;
           DolgCol :=8;
           ZwanCol :=9;
           LimitNumber:=500;
           PochetnZwCol:=0;
           RazrCol:=6;
           ProcStCol:=0;
           ProcZwCol:=0;
           VyslCol:=0;
           ClockCol:=11;
           koefCol:=12;
           summaOzdCol:=0;
           biblCol:=0;
           uborCol:=75; //10 за уборку туалетов
           nightCol:=79;
           prazdnCol:=81;
           nameMode:='АХЧ';


         end;
     end;
  //   E.Visible:=true;
     CurrRow:=StartRow;
     CurrRazrRow:=RazrRow;
     nmbOfLines:=0;
  //   pb1.Min:=0;
  //   pb1.Max:=dsLists.RecordCount;
  //   pb1.Position:=0;
     Application.ProcessMessages;

  //   if mode<>2 then Exit;
  //   s:=e.Workbooks[1].WorkSheets[SheetNoCalc].Name;
  //   for i:=1 to 15 do
  //    begin
  //   CurrRazrRow:=CurrRazrRow+stepRow;
  //   e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,ProcStCol]:=15;
  //   e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,VyslCol]:=15;
  //   e.Workbooks[1].WorkSheets['сентябрь'].Cells[CurrRazrRow,RazrCol]:=15;
  //   ShowMessage('SheetNoCalc='+IntToStr(SheetNoCalc)+' CurrRazrRow='+IntToStr(CurrRazrRow)+' RazrCol='+IntToStr(RazrCol));
  //   j:=e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,RazrCol];
  //   Application.ProcessMessages;
  //    end;
  //   Exit;
   //  while (not dsLists.Eof) do
     pb1.Min:=0;
     pb1.Max:=pfbqryL.RecordCount;
     pb1.Position:=0;
     sc:=0;
     while (not pfbqryL.Eof) do
       begin
            if mode=3 then
               sc:=sc;
            inc(nmbOfLines);
            inc(sc);
            tabno:=pfbqryL.Fields[0].AsInteger;
            if tabno=952 then
               tabno:=953;
   //         pb1.Position:=nmbOfLines;
            pb1.Position:=sc;
            Fio:=Trim(pfbqryL.Fields[1].AsString);
            lblFio.Caption:=Trim(nameMode)+' '+IntToStr(nmbOfLines)+' '+trim(fio);
            Application.ProcessMessages;
            if (nmbOfLines>LimitNumber) then
               begin
                    case mode of
                     1:fio:='приравненные к ППС';
                     2:fio:='ППС';
                     3:fio:='специалисты';
                     else
                        fio:='рабочие';
                    end;
                    ShowMessage(fio+' не больше '+intToStr(LimitNumber)+' строк');
                    Break;
               end;
            CurrRow     := CurrRow     + StepRow;
            CurrRazrRow := CurrRazrRow + stepRow;
            summaZw     := 0;
            summaOZD    := 0;
            summaNight  := 0;
            summaPrazdn := 0;
            procBibl    := 0;
            if mode=2 then
               Dolg:='';
        //    Fio:=dsListsFIO.Value;
            Fio:=Trim(pfbqryL.Fields[1].AsString);
            ShortF:=short_fio(fio);
        //    Dolg:=dsListsDOLG.Value;
            Dolg:=Trim(pfbqryL.Fields[5].AsString);
            NameDolg:=Trim(makeDolg(Dolg));
        //   uz:=Trim(dsListsZW.Value);
            uz:=Trim(pfbqryL.Fields[2].AsString);
        //    us:=Trim(dsListsST.Value);
            us:=Trim(pfbqryL.Fields[3].AsString);
        //    razr:=fbntgrfldListsRAZR.Value;
            razr:=pfbqryL.Fields[4].AsInteger;

        //    ProcStA:=dsListsPROCUSFINAL.Value;
            ProcStA:=pfbqryL.Fields[6].AsFloat;
            ProcSt:=Round(ProcStA);
        //    StagYearA:=dsListsSTAG.Value;
            StagYearA:=pfbqryL.Fields[8].AsFloat;
            StagYear:=Round(StagYearA);
        //    ProcVyslA:=dsListsPROCVYSLFINAL.Value;
            ProcVyslA:=pfbqryL.Fields[9].AsFloat;
            ProcVysl:=Round(procVyslA);
        //    ProcZwA:=dsListsPROCUZFINAL.Value;
            ProcZwA:=pfbqryL.Fields[7].AsFloat;
            ProcZw:=Round(ProcZwA);
            koef:=pfbqryL.Fields[10].AsFloat;
            if koef<0.01 then koef:=0;
            if koef>1.5 then koef:=1.5;
            if ((ProcZw>10) and (ProcZw<35)) then
            if ((Razr>0) and (Razr<26)) then
               begin
                    SummaZw:=R_O[Razr]*ProcZw/100.00;
                    if ((koef>0.05) and (koef<0.99)) then
                       SummaZw:=SummaZw*koef;
               end;
        //    koef:=dsListsKOEF.Value;
        //    koef:=dsListsKOEF.Value;
            ProcPZA  := pfbqryL.Fields[12].AsFloat;
            ProcPz   := Round(ProcPzA);
            SummaOZD := pfbqryL.Fields[14].AsFloat;
            procBibl := pfbqryL.Fields[15].AsInteger;
            procUbor := pfbqryL.Fields[16].AsInteger;
            summaNight  := pfbqryL.Fields[17].AsFloat;
            summaPrazdn := pfbqryL.Fields[18].AsFloat;
            if ((Length(uz)>0) and (Length(us)>0)) then
               Kateg:=Trim(us)+','+trim(uz)
            else
            if Length(uz)>0 then
               Kateg:=trim(uz)
            else
            if Length(us)>0 then
               Kateg:=trim(us)
            else
               Kateg:='';
            if ((mode=1) or (mode=2)) then
               if Length(Trim(kateg))>0 then
                  Kateg:=Trim(kateg)+', высшее'
               else
                  Kateg:='высшее';
            if mode=2 then
               mode:=2;      
            E.WorkBooks[1].WorkSheets[SheetNo].Cells[CurrRow,FioCol]:=ShortF;
            if Length(Trim(nameDolg))>0 then
            E.WorkBooks[1].WorkSheets[SheetNo].Cells[CurrRow,DolgCol]:=nameDolg;
            if Length(Trim(Kateg))>0 then
            E.WorkBooks[1].WorkSheets[SheetNo].Cells[CurrRow,ZwanCol]:=kateg;
            if (RazrCol>0)then
            if ((Razr>0) and (Razr<26)) then
               begin
                   e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,RazrCol]:=Razr;
//                   e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,RazrCol]:=Razr;
//                   e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,RazrCol]:=Razr;
               end;
            if ProcStCol>0 then
            if ProcSt>0 then
               begin
                    e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,ProcStCol]:=ProcSt;
//                    e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,ProcStCol]:=ProcSt;
//                    e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,ProcStCol]:=ProcSt;
               end;
            if VyslCol>0 then
            if StagYear>0 then
               begin
                   e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,RazrCol-1]:=StagYear;
                   e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,VyslCol]:=ProcVysl;
//                   e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,RazrCol-1]:=StagYear;
//                   e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,VyslCol]:=ProcVysl;
//                   e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,RazrCol-1]:=StagYear;
//                   e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,VyslCol]:=ProcVysl;
               end;
            if (ProcZwCol>0) then
            if (mode<3) then
//            if SummaZw>0.1 then   //ученое звание бъется суммой
            if SummaZw>0.1 then   //ученое звание бъется суммой
               begin
            //       e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,ProcZwCol]:=ProcZw;
                   e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,ProcZwCol]:=r10(SummaZw);
//                   e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,ProcZwCol]:=SummaZw;
//                   e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,ProcZwCol]:=SummaZw;
                   case ProcZw of
                       25:s:='за звание доцента';
                       33:s:='за звание профессора';
                       else s:='';
                   end;
                   if Length(Trim(s))>0 then
                      begin
                           e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,ProcZwCol+2]:=s;
//                           e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,ProcZwCol+2]:=s;
//                           e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,ProcZwCol+2]:=s;
                      end ;
               end;
            if (ProcPZ>0) then
            if (mode<3) then
            if ProcPz>1 then
               begin
                   e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,PochetnZwCol]:=ProcPz;
//                   e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,PochetnZwCol]:=ProcPz;
//                   e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,PochetnZwCol]:=ProcPz;
                   case ProcPz of
                       20:s:='за звание заслуженного';
                       33:s:='за звание мастер спорта';
                       else s:='';
                   end;
                   s:='';
                   if Length(Trim(s))>0 then
                      begin
                           e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,PochetnZwCol+2]:=s;
//                           e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,PochetnZwCol+2]:=s;
//                           e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,PochetnZwCol+2]:=s;
                      end;
               end;
         //   if (mode=2) then
            if (false) then
               begin
                     clocks:=Round(18.0*koef);
                     e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,ClockCol]:=clocks;
//                     e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,ClockCol]:=clocks;
//                     e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,ClockCol]:=clocks;
               end
            else
               begin
                     if koef>0.01 then
                        begin
                             e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,ClockCol+1]:=koef;
//                             e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,ClockCol+1]:=koef;
//                             e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,ClockCol+1]:=koef;
                        end
               end;
        //    if ((mode=1) or (mode=2)) then
            if summaOZD>1 then
               begin
                     e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,SummaOzdCol]:=summaOZD;
//                     e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,SummaOzdCol]:=summaOZD;
//                     e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,SummaOzdCol]:=summaOZD;
               end;
        // Надбавки библиотекарям
            if (mode=3) then
               if biblCol>0 then
               if procBibl=50 then
                  begin
                      e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,biblCol]:=procbibl;
//                      e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,biblCol]:=procbibl;
//                      e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,biblCol]:=procbibl;
                      if VyslCol>0 then
                      if ProcVysl>1 then
                         begin
                              e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,vyslCol]:=ProcVysl;
                              e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,RazrCol-1]:=StagYear;
//                              e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,vyslCol]:=ProcVysl;
//                              e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,RazrCol-1]:=StagYear;
//                              e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,vyslCol]:=ProcVysl;
//                              e.Workbooks[1].WorkSheets[SheetNoCalc+2].Cells[CurrRazrRow,RazrCol-1]:=StagYear;
                         end;
                  end;
        // Надбавки уборщицам, а также ночные и праздничные
            if (mode=4) then
               begin
                   if uborCol>0 then
                   if procUbor=10 then
                      begin
                          e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,uborCol]:=procUbor;
//                          e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,uborCol]:=procUbor;
//                          e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,uborCol]:=procUbor;
                      end;
                   // Ночные
                   if nightCol>0 then
                   if summaNight>1.00 then
                      begin
                          e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,nightCol]:=R10(summaNight);
//                          e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,nightCol]:=R10(summaNight);
//                          e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,nightCol]:=R10(summaNight);
                      end;
                   // Праздничные
                   if prazdnCol>0 then
                   if summaPrazdn>1.00 then
                      begin
                          e.Workbooks[1].WorkSheets[SheetNoCalc].Cells[CurrRazrRow,prazdnCol]:=R10(summaPrazdn);
//                          e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,prazdnCol]:=R10(summaPrazdn);
//                          e.Workbooks[1].WorkSheets[SheetNoCalc+1].Cells[CurrRazrRow,prazdnCol]:=R10(summaPrazdn);
                      end;
               end;
            pfbqryL.Next;
       end;
(*
     lblFio.Caption:='Сохранение документа';
     Application.ProcessMessages;

     e.WorkBooks[1].save;
     lblFio.Caption:='Удаление документа из памяти';
     Application.ProcessMessages;
     e.WorkBooks[1].close;
     lblFio.Caption:='Операция переноса закончена';
     Application.ProcessMessages;
   //  e.free;
     e:=Unassigned;
*)
 end;


procedure TFormExportFroPlanLNR.FormCreate(Sender: TObject);
begin
     lblFio.Caption:='';
     cbVisual.Checked:=False;
end;

procedure TFormExportFroPlanLNR.btn3Click(Sender: TObject);
var y,m:Integer;
begin
     y:=Yearof(dtpDate.date);
     m:=Monthof(dtpDate.date);
     if dsLists.Active then
        dsLists.Close;
     if dsLists.Transaction.Active then
        dsLists.Transaction.Commit;
     dsLists.Transaction.StartTransaction;
     dsLists.Params[0].AsInteger:=y;
     dsLists.Params[1].AsInteger:=m;
     dsLists.Params[2].AsInteger:=2;
     dsLists.Params[3].AsInteger:=1;
     FormWait.Show;
     Application.ProcessMessages;
     dsLists.Open;
     moveToExcel(2);
     dsLists.close;
     FormWait.Hide;
     Application.ProcessMessages;
     dsLists.Transaction.Commit;

end;

procedure TFormExportFroPlanLNR.btn4Click(Sender: TObject);
var y,m:Integer;
begin
     y:=Yearof(dtpDate.date);
     m:=Monthof(dtpDate.date);
     if dsLists.Active then
        dsLists.Close;
     if dsLists.Transaction.Active then
        dsLists.Transaction.Commit;
     dsLists.Transaction.StartTransaction;
     dsLists.Params[0].AsInteger:=y;
     dsLists.Params[1].AsInteger:=m;
     dsLists.Params[2].AsInteger:=3;
     dsLists.Params[3].AsInteger:=1;
     FormWait.Show;
     Application.ProcessMessages;
     dsLists.Open;
     moveToExcel(3);
     dsLists.close;
     FormWait.Hide;
     Application.ProcessMessages;
     dsLists.Transaction.Commit;

end;

procedure TFormExportFroPlanLNR.btn5Click(Sender: TObject);
var y,m:Integer;
begin
     y:=Yearof(dtpDate.date);
     m:=Monthof(dtpDate.date);
     if dsLists.Active then
        dsLists.Close;
     if dsLists.Transaction.Active then
        dsLists.Transaction.Commit;
     dsLists.Transaction.StartTransaction;
     dsLists.Params[0].AsInteger:=y;
     dsLists.Params[1].AsInteger:=m;
     dsLists.Params[2].AsInteger:=4;
     dsLists.Params[3].AsInteger:=1;
     FormWait.Show;
     Application.ProcessMessages;
     dsLists.Open;
     moveToExcel(4);
     dsLists.close;
     FormWait.Hide;
     Application.ProcessMessages;
     dsLists.Transaction.Commit;

end;

function TFormExportFroPlanLNR.openExcel:boolean;
 var FName:string;
 begin
     FName:=TemplateDIR+'070602_YY_2017_ВУЗы.xlt';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             openExcel:=false;
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        openExcel:=false;
        Exit;
     end;
     SheetNo:=1;
     case MonthOf(dtpDate.Date) of
       7 : SheetNoCalc:=10;
       8 : SheetNoCalc:=11;
       9 : SheetNoCalc:=12;
      10 : SheetNoCalc:=13;
      11 : SheetNoCalc:=14;
      12 : SheetNoCalc:=15;
       else
          ShowMessage('Неверно указан месяц');
          openExcel:=false;
          Exit;
     end;
     FormWait.Show;
     lblFio.Caption:='Загрузка документа';
     Application.ProcessMessages;
     E.WorkBooks.Open(FName);
     FormWait.Hide;
     lblFio.Caption:='';
     Application.ProcessMessages;
  //   e.visible:=True;
     e.Workbooks[1].WorkSheets[SheetNoCalc].EnableCalculation:=0;
     e.Calculation:=xlManual;
     e.ScreenUpdating := false;
     e.DisplayAlerts  := false;
     if cbVisual.Checked then
        e.visible:=True
     else
        e.visible:=false;
     openExcel:=true;
 end;

 procedure TFormExportFroPlanLNR.moveKategToExcel(mode:integer);
var y , m : Integer;
    SQLStmnt:string;
    //Y,M:integer;
begin
     if dsLists.Active then
        dsLists.Close;
     if dsLists.Transaction.Active then
        dsLists.Transaction.Commit;
     y:=yearOf(dtpDate.Date);
     m:=monthOf(dtpDate.Date);
     case mode of
     1: begin
           SQLStmnt:='select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from (';
           SQLStmnt:=Trim(SQLStmnt)+'select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from pr_pl_toexcel('+IntToStr(y)+','+IntToStr(m)+',1,1)';
           SQLStmnt:=Trim(SQLStmnt)+' )  order by fio,w_r_final';
        end;
     2: begin
           SQLStmnt:=' select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from (';
           SQLStmnt:=Trim(SQLStmnt)+'select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from pr_pl_toexcel('+IntToStr(y)+','+IntToStr(m)+',2,1)';
           SQLStmnt:=Trim(SQLStmnt)+' union ';
           SQLStmnt:=Trim(SQLStmnt)+' select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from pr_pl_toexcel('+IntToStr(y)+','+IntToStr(m)+',2,2)';
           SQLStmnt:=Trim(SQLStmnt)+' )  order by fio,w_r_final';

        end;
     3: begin
           SQLStmnt:=' select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from (';
           SQLStmnt:=Trim(SQLStmnt)+'select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from pr_pl_toexcel('+IntToStr(y)+','+IntToStr(m)+',3,1)';
           SQLStmnt:=Trim(SQLStmnt)+' union ';
           SQLStmnt:=Trim(SQLStmnt)+' select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from pr_pl_toexcel('+IntToStr(y)+','+IntToStr(m)+',3,2)';
           SQLStmnt:=Trim(SQLStmnt)+' )  order by fio,w_r_final';

        end;
     4: begin
           SQLStmnt:=' select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from (';
           SQLStmnt:=Trim(SQLStmnt)+'select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from pr_pl_toexcel('+IntToStr(y)+','+IntToStr(m)+',4,1)';
           SQLStmnt:=Trim(SQLStmnt)+' union ';
           SQLStmnt:=Trim(SQLStmnt)+' select tabno,FIO,ZW,ST,RAZR,DOLG,PROCUSFINAL,PROCUZFINAL,STAG,PROCVYSLFINAL,KOEF,W_R_FINAL,PROCPZWFINAL,PZW,SUMMAOZD,PROCBIBL,PROCUBOR,SUMMANIGHT,SUMMAPRAZDN from pr_pl_toexcel('+IntToStr(y)+','+IntToStr(m)+',4,2)';
           SQLStmnt:=Trim(SQLStmnt)+' )  order by fio,w_r_final';

        end;
     end;
     dsLists.Transaction.StartTransaction;
     pfbqryL.SQL.clear;
     pfbqryL.SQL.Add(SQLStmnt);
//     dsLists.Params[0].AsInteger:=y;
//     dsLists.Params[1].AsInteger:=m;
//     dsLists.Params[2].AsInteger:=mode;
     FormWait.Show;
     Application.ProcessMessages;
//     dsLists.Open;
     pfbqryL.ExecQuery;
     moveToExcel(mode);
//     dsLists.close;
     pfbqryL.Close;
     FormWait.Hide;
     Application.ProcessMessages;
     dsLists.Transaction.Commit;

end;


function TFormExportFroPlanLNR.FillOkladyForRazr:boolean;
 var SQLStmnt:string;
     i:integer;
 begin
       for i:=1 to 25 do R_O[i]:=0;
       if pfbqryL.Transaction.Active then
          pfbqryL.Transaction.Commit;
       pfbqryL.Transaction.StartTransaction;
       if pfbqryL.Open then
          pfbqryL.Close;
       pfbqryL.SQL.Clear;
       SQLStmnt:='select a.razr, a.oklad from tb_razr_proc a';
       SQLStmnt:=SQLStmnt+' where a.datefr = (select max(b.datefr) from tb_razr_proc b)';
       SQLStmnt:=SQLStmnt+' order by 1';
       pfbqryL.SQL.Add(SQLStmnt);
       pfbqryL.ExecQuery;
       i:=0;
       while (not pfbqryL.Eof) and (i<25) do
         begin
              if ((pfbqryL.Fields[0].AsInteger>0) and
                  (pfbqryL.Fields[0].AsInteger<26)) then
                 begin
                      R_O[pfbqryL.Fields[0].AsInteger]:=pfbqryL.Fields[1].AsFloat;
                 end;
              pfbqryL.Next;
         end;
       pfbqryL.Close;
       pfbqryL.Transaction.Commit;



       Result:=true;
 end;



end.
