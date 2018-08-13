{$WARNINGS OFF}
{$HINTS OFF}
unit FormAutoRepU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBQuery, pFIBQuery;

type
  TFormAutoRep = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DateFr: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DateTo: TDateTimePicker;
    BitBtn3: TBitBtn;
    pFIBQuery: TpFIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
         procedure MakeAutoReport(i_nsrv:integer;month_vy:integer;year_vy:integer);
  public
    { Public declarations }
  end;

var
  FormAutoRep: TFormAutoRep;

implementation
   uses ScrDef,DateUtils,ScrLists,UFormProgress,ScrUtil,uFIBModule,ComOBJ,UFormSelPKG,ExcelXP,
        USQLUnit;
{$R *.dfm}

procedure TFormAutoRep.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormAutoRep.FormCreate(Sender: TObject);
begin
      DateFr.Date:=Date;
      DateTo.Date:=Date;
end;

procedure TFormAutoRep.BitBtn2Click(Sender: TObject);
var CurrDate:TDate;
    Nmes_Temp:integer;
    Nsrv_Temp:integer;
    Month_Vy,Year_Vy:integer;
    i_nsrv : integer;
begin
     DateFr.Date:=EncodeDate(YearOf(DateFr.Date),MonthOf(DateFr.Date),10);
     DateTo.Date:=EncodeDate(YearOf(DateTo.Date),MonthOf(DateTo.Date),10);
     if DateTo.Date<=DateFr.Date then
        begin
             ShowMessage('Неверно заданы даты отчета');
             Exit;
        end;
     if (YearOf(DateFr.Date)<1991) then
        begin
             ShowMessage('Не верна первая дата');
             Exit;
        end;

     if NameServList.Count<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     CurrDate := DateFr.Date;
     Month_Vy := MonthOf(CurrDate);
     Year_Vy  := YearOf(CurrDate);
     while true do
      begin
           Application.CreateForm(TFormProgress, FormProgress);
           FormProgress.Gauge.MinValue:=0;
           FormProgress.Gauge.MaxValue:=NameServList.Count;
           FormProgress.Gauge.Progress:=0;
           FormProgress.LabelHeader.Caption:='';
           FormProgress.LabelFooter.Caption:='';
           FormProgress.Caption:='Создание свода';
           FormProgress.Show;

           for i_nsrv:=1 to NameServList.Count do
               begin
                    FormProgress.Gauge.Progress:=I_NSRV;
                    FormProgress.LabelHeader.Caption:=NAME_SERV(I_NSRV);
                    FormProgress.LabelFooter.Caption:=NAME_SERV(I_NSRV);
                    FormProgress.RePaint;
                    Application.ProcessMessages;
                    if NameServList.IsSelected(i_nsrv) then
                       MakeAutoReport(i_nsrv,month_vy,year_vy);
               end;
           FormProgress.Free;
           if  ((Month_Vy=MonthOf(DateTo.Date))  and (Year_Vy=YearOf(DateTo.Date))) then
               break;
           Inc(Month_Vy);
           if Month_Vy>12 then
              begin
                    Month_Vy:=1;
                    inc(Year_Vy)
              end;
      end;

end;

 procedure TFormAutoRep.MakeAutoReport(i_nsrv:integer;month_vy:integer;year_vy:integer);
  const StartedCol=6;
        StartedRow=5;
  type PRec=^TRec;
       TRec=record
             Shifr : integer;
             Summa : real;
             ShifrCol : integer;
            end;
  var Rec             : PRec;
      ListAdd         : TList;
      ListUd          : TList;
      CurrCol         : integer;
      CurrRow         : integer;
      V               : variant;
      i               : integer;
      WantedCol       : integer;
      WantedId        : integer;
      SummaAddCol     : integer;
      SummaUdCol      : integer;
      SummaOnHandCol  : integer;
      SummaDolgCol    : integer;
      Formula         : string;
      Range           : variant;
      CellTL,CellBR   : variant;
      FileName        : string;
      SQLStmnt        : string;
      nameSta         : string;
 function CompareItems(Item1, Item2: Pointer): Integer;
  begin
       if PRec(Item1)^.Shifr>PRec(Item2)^.Shifr      then Result:=1
       else if PRec(Item1)^.Shifr<PRec(Item2)^.Shifr then Result:=-1
                                                     else Result:=0;
  end;

  begin
       if not IsExcelInstalled then
          begin
               ShowMessage('Excel не установлен');
               Exit;
          end;
       SQLStmnt:='';
       SQLStmnt:='select count(*) from fadd join person on fadd.shifridperson=person.shifrid where person.monthvy='+IntToStr(month_vy)+' and person.yearvy='+IntToStr(year_vy)+' and person.w_place='+IntToStr(i_nsrv)+' and abs(fadd.summa)>0.005 ';
//       i:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
       i:=SQLQueryValue(SQLStmnt);
       if i<1 then
          begin
               ShowMessage('Нет данных в БД по подразделению '+NAME_SERV(I_NSRV));
               Exit;
          end;
       if not pFIBQuery.Transaction.Active then
          pFIBQuery.Transaction.StartTransaction;
       pFIBQuery.SQL.Clear;
       pFIBQuery.SQL.Add('select fadd.shifrsta from fadd');
       pFIBQuery.SQL.Add(' join person on fadd.shifridperson=person.shifrid');
       pFIBQuery.SQL.Add(' where person.monthvy='+IntToStr(month_vy)+' and person.yearvy='+IntToStr(year_vy)+' and person.w_place='+IntToStr(i_nsrv)+' and abs(fadd.summa)>0.005 ');
       pFIBQuery.SQL.Add(' group by 1');
       try
          pFIBQuery.ExecQuery;
       except
         on e:Exception do
            begin
             ShowMessage('Ошибка получения списка шифров начислений '+e.message);
             if pFIBQuery.Transaction.Active then
                pFIBQuery.Transaction.Commit;
             Exit;
             end
       end;
       ListAdd:=TList.Create;
       while not pFIBQuery.Eof do
         begin
               New(Rec);
               Rec^.Shifr    := pFIBQuery.Fields[0].AsInteger;
               Rec^.Summa    := 0;
               Rec^.ShifrCol := 0;
               ListAdd.Add(Rec);
               pFIBQuery.Next;
         end;
       pFIBQuery.Close;
       pFIBQuery.SQL.Clear;
       pFIBQuery.SQL.Add(' select fud.shifrsta from fud');
       pFIBQuery.SQL.Add(' join person on fud.shifridperson=person.shifrid');
       pFIBQuery.SQL.Add(' where person.monthvy='+IntToStr(month_vy)+' and person.yearvy='+IntToStr(year_vy)+' and person.w_place='+IntToStr(i_nsrv)+' and abs(fud.summa)>0.005 ');
       pFIBQuery.SQL.Add(' group by 1');
       try
          pFIBQuery.ExecQuery;
       except
           on e:Exception do
              begin
                   ShowMessage('Ошибка получения списка шифров удержаний '+E.Message);
                   if pFIBQuery.Transaction.Active then
                      pFIBQuery.Transaction.Commit;
                   Exit;
              end
       end;
       ListUd:=TList.Create;
       while not pFIBQuery.Eof do
         begin
               New(Rec);
               Rec^.Shifr    := pFIBQuery.Fields[0].AsInteger;
               Rec^.Summa    := 0;
               Rec^.ShifrCol := 0;
               ListUd.Add(Rec);
               pFIBQuery.Next;
         end;


       ListAdd.Sort(@CompareItems);
       CurrCol:=StartedCol;
       for i:=0 to ListAdd.Count-1 do
           begin
                Inc(CurrCol);
                PRec(ListAdd.Items[i])^.ShifrCol:=CurrCol;
           end;
       Inc(CurrCol);
       SummaAddCol:=CurrCol;
       ListUd.Sort(@CompareItems);
       for i:=0 to ListUd.Count-1 do
           begin
                Inc(CurrCol);
                PRec(ListUd.Items[i])^.ShifrCol:=CurrCol;
           end;
       SummaUdCol     := CurrCol+1;
       SummaOnHandCol := CurrCol+2;
       SummaDolgCol   := CurrCol+3;
{
       try
          // Ищем запущеный экземплят Excel,
        	//если он не найден, вызывается исключение
          V := GetActiveOleObject('Excel.Application');
       except
}
            try
                V:=CreateOleObject('Excel.Application');
            except
                ShowMessage('Ошибка запуска Excel');
                if pFIBQuery.Transaction.Active then
                   pFIBQuery.Transaction.Commit;
                Exit;
            end;
{
       end;
}       
       V.Visible:=True;
       V.WorkBooks.Add;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-2,2]:=trim(Name_Serv(I_nsrv))+' в '+trim(GetMonthRus(Month_Vy))+' '+IntToStr(Year_Vy)+' г.';
       for i:=0 to ListAdd.Count-1 do
           begin
                SQLStmnt:='select first 1 name from shifr where shifr='+IntToStr(PRec(ListAdd.Items[i])^.Shifr);
                nameSta:=SQLQueryValue(SQLStmnt);
                CurrCol:=PRec(ListAdd.Items[i])^.ShifrCol;
                V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,CurrCol]:=IntToSTr(PRec(ListAdd.Items[i])^.Shifr)+' '+trim(nameSta);
                V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,CurrCol].WrapText:=true;
                V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,CurrCol].VerticalAlignment := xlCenter;

           end;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaAddCol]:='100 Всего начислено';
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaAddCol].WrapText:=true;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaUdCol].VerticalAlignment := xlCenter;
       for i:=0 to ListUd.Count-1 do
           begin
                SQLStmnt:='select first 1 name from shifr where shifr='+IntToStr(PRec(ListUd.Items[i])^.Shifr);
                nameSta:=SQLQueryValue(SQLStmnt);
                CurrCol:=PRec(ListUd.Items[i])^.ShifrCol;
                V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,CurrCol]:=IntToSTr(PRec(ListUd.Items[i])^.Shifr)+' '+trim(nameSta);
                V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,CurrCol].WrapText:=true;
                V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,CurrCol].VerticalAlignment := xlCenter;
           end;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaUdCol]:='200 Всего удержано';
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaUdCol].WrapText:=true;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaUdCol].VerticalAlignment := xlCenter;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaOnHandCol]:='300 К выдаче';
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaOnHandCol].WrapText:=true;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaOnHandCol].VerticalAlignment := xlCenter;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaDolgCol]:='400 Долг';
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaDolgCol].WrapText:=true;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,SummaDolgCol].VerticalAlignment := xlCenter;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,1]:='Таб.ном.';
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,1].VerticalAlignment := xlCenter;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,2]:='Фамилия И О';
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,2].VerticalAlignment := xlCenter;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,3]:='Должность';
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,3].VerticalAlignment := xlCenter;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,4]:='Счет';
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,4].VerticalAlignment := xlCenter;
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,5]:='Ставок';
       V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,5].VerticalAlignment := xlCenter;

       pFIBQuery.Close;
       pFIBQuery.SQL.Clear;
       pFIBQuery.SQL.Add('select person.shifrid,person.tabno,person.fio,person.dolg,');
       pFIBQuery.SQL.Add(' (select first 1 gruppy.name from gruppy where gruppy.shifr=person.shifrgru),');
       pFIBQuery.SQL.Add(' (select first 1 fcn.summa from  fcn where fcn.shifridperson=person.shifrid and fcn.shifrsta=99+500)');
       pFIBQuery.SQL.Add(' from person');
       pFIBQuery.SQL.Add(' where person.monthvy='+IntToStr(Month_Vy)+' and person.yearvy='+IntToStr(Year_Vy)+' and person.w_place='+IntToStr(I_NSRV));
       pFIBQuery.SQL.Add(' order by 3,person.w_r');
       try
           pFIBQuery.ExecQuery;
       except
          on e:Exception do
             begin
                  if pFIBQuery.Transaction.Active then
                     pFIBQuery.Transaction.Commit;
                  ShowMessage('Ошибка запроса данных о начисениях сотрудников '+E.Message);
                  Exit;
             end;
       end;
       CurrRow:=StartedRow;
       while not pFIBQuery.Eof do
         begin

              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=pFIBQuery.Fields[1].AsInteger;

              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=pFIBQuery.Fields[2].AsString;
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=pFIBQuery.Fields[3].AsString;
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:=pFIBQuery.Fields[4].AsString;
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=pFIBQuery.Fields[5].AsFloat;
              Formula:='=SUM(R'+Trim(IntToStr(CurrRow))+'C'+Trim(IntToStr(StartedCol))+':R'+Trim(IntToStr(CurrRow))+'C'+Trim(IntToStr(SummaAddCol-1))+')';
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Formula:=trim(Formula);
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].NumberFormat:='0,00';
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Interior.ColorIndex := 35;
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Font.Bold := true;
{              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Interior.Pattern := xlSolid;    }
              Formula:='=SUM(R'+Trim(IntToStr(CurrRow))+'C'+Trim(IntToStr(SummaAddCol+1))+':R'+Trim(IntToStr(CurrRow))+'C'+Trim(IntToStr(SummaUdCol-1))+')';
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].Formula:=trim(Formula);
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].NumberFormat:='0,00';
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].Interior.ColorIndex := 35;
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].Font.Bold := true;
              Formula:='=R'+Trim(IntToStr(CurrRow))+'C'+Trim(IntToStr(SummaAddCol))+'-R'+Trim(IntToStr(CurrRow))+'C'+Trim(IntToStr(SummaUdCol));
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaOnHandCol].Formula:=trim(Formula);
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaOnHandCol].NumberFormat:='0,00';
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaOnHandCol].Interior.ColorIndex := 35;
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaOnHandCol].Font.Bold := true;
              Formula:='=R'+Trim(IntToStr(CurrRow))+'C'+Trim(IntToStr(SummaAddCol))+'-R'+Trim(IntToStr(CurrRow))+'C'+Trim(IntToStr(SummaUdCol));
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol].Formula:=trim(Formula);
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol].NumberFormat:='0,00';
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol].Interior.ColorIndex := 35;
              V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol].Font.Bold := true;
{              V.WorkBooks[1].WorkSheets[1].ActiveCell.NumberFormat:='0.00_ ;[Red]-0.00 ';}
              if not FIB.pFIBQuery.Transaction.Active then
                 FIB.pFIBQuery.Transaction.StartTransaction;
              if FIB.pFIBQuery.Open then
                 FIB.pFIBQuery.Close;
              FIB.pFIBQuery.SQL.Clear;
              WantedId:=pFIBQuery.Fields[0].AsInteger;
              FIB.pFIBQuery.SQL.Add('select fadd.shifrsta,sum(fadd.summa) from fadd where fadd.shifridperson='+IntToStr(WantedId)+' group by 1');
              try
                 FIB.pFIBQuery.ExecQuery;
              except
                    ShowMessage('Ошибка запроса данных по начислениям сторудника');
                    if pFIBQuery.Transaction.Active then
                       pFIBQuery.Transaction.Commit;
                    if FIB.pFIBQuery.Transaction.Active then
                       FIB.pFIBQuery.Transaction.Commit;
                    Exit;
              end;
              while not FIB.pFIBQuery.EOF do
                    begin
                         WantedCol:=FIB.pFIBQuery.Fields[0].AsInteger;
                         CurrCol:=0;
                         for i:=0 to ListAdd.Count-1 do
                             begin
                                  if PRec(ListAdd.Items[i])^.Shifr=WantedCol then
                                     begin
                                          CurrCol:=PRec(ListAdd.Items[i])^.ShifrCol;
                                          Break;
                                     end;
                             end;
                         if CurrCol>0 then
                            begin
                                 V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol]:=FIB.pFIBQuery.Fields[1].AsFloat;
                                 V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol].NumberFormat:='0,00';
                            end;
                         FIB.pFIBQuery.Next;
                    end;
              { Удержания }
              FIB.pFIBQuery.Close;
              FIB.pFIBQuery.SQL.Clear;
              WantedId:=pFIBQuery.Fields[0].AsInteger;
              FIB.pFIBQuery.SQL.Add('select fud.shifrsta,sum(fud.summa) from fud where fud.shifridperson='+IntToStr(WantedId)+' group by 1');
              try
                 FIB.pFIBQuery.ExecQuery;
              except
                  on e:Exception do
                     begin
                          ShowMessage('Ошибка запроса данных по удержаниям сторудника');
                          if pFIBQuery.Transaction.Active then
                             pFIBQuery.Transaction.Commit;
                          if FIB.pFIBQuery.Transaction.Active then
                             FIB.pFIBQuery.Transaction.Commit;
                          Exit;
                     end;
              end;
              while not FIB.pFIBQuery.EOF do
                    begin
                         WantedCol:=FIB.pFIBQuery.Fields[0].AsInteger;
                         CurrCol:=0;
                         for i:=0 to ListUd.Count-1 do
                             begin
                                  if PRec(ListUd.Items[i])^.Shifr=WantedCol then
                                     begin
                                          CurrCol:=PRec(ListUd.Items[i])^.ShifrCol;
                                          Break;
                                     end;
                             end;
                         if CurrCol>0 then
                            begin
                                 V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol]:=FIB.pFIBQuery.Fields[1].AsFloat;
                                 V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol].NumberFormat:='0,00';
                            end;
                         FIB.pFIBQuery.Next;
                    end;
              if V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Value -
                 V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].Value>0.005 then
                 V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaOnHandCol]:=
                   V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Value -
                   V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].Value
              else V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaOnHandCol]:='';
              if V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].Value -
                 V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Value>0.005 then
                 V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol]:=
                   V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].Value -
                   V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Value
              else V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol]:='';
              inc(CurrRow);
              pFIBQuery.Next;
         end;
       if CurrRow>StartedRow then
          begin
                for i:=0 to ListAdd.Count-1 do
                    begin
                         CurrCol:=PRec(ListAdd.Items[i])^.ShifrCol;
                         V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol].Formula:='=sum(r'+IntToStr(StartedRow)+'c'+IntToStr(CurrCol)+':r'+IntToStr(CurrRow-1)+'c'+IntToStr(CurrCol)+')';
                         V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol].NumberFormat:='0,00';
                         V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol].Interior.ColorIndex := 35;
                         V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol].Font.Bold := true;

                    end;
                for i:=0 to ListUd.Count-1 do
                    begin
                         CurrCol:=PRec(ListUd.Items[i])^.ShifrCol;
                         V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol].Formula:='=sum(r'+IntToStr(StartedRow)+'c'+IntToStr(CurrCol)+':r'+IntToStr(CurrRow-1)+'c'+IntToStr(CurrCol)+')';
                         V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol].NumberFormat:='0,00';
                         V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol].Interior.ColorIndex := 35;
                         V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,CurrCol].Font.Bold := true;
                    end;
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Formula:='=sum(r'+IntToStr(StartedRow)+'c'+IntToStr(SummaAddCol)+':r'+IntToStr(CurrRow-1)+'c'+IntToStr(SummaAddCol)+')';
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].NumberFormat:='0,00';
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Interior.ColorIndex := 35;
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaAddCol].Font.Bold := true;
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].Formula:='=sum(r'+IntToStr(StartedRow)+'c'+IntToStr(SummaUdCol)+':r'+IntToStr(CurrRow-1)+'c'+IntToStr(SummaUdCol)+')';
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].NumberFormat:='0,00';
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].Interior.ColorIndex := 35;
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaUdCol].Font.Bold := true;
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaOnHandCol].Formula:='=sum(r'+IntToStr(StartedRow)+'c'+IntToStr(SummaOnHandCol)+':r'+IntToStr(CurrRow-1)+'c'+IntToStr(SummaOnHandCol)+')';
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaOnHandCol].NumberFormat:='0,00';
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaOnHandCol].Interior.ColorIndex := 35;
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaOnHandCol].Font.Bold := true;
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol].Formula:='=sum(r'+IntToStr(StartedRow)+'c'+IntToStr(SummaDolgCol)+':r'+IntToStr(CurrRow-1)+'c'+IntToStr(SummaDolgCol)+')';
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol].NumberFormat:='0,00';
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol].Interior.ColorIndex := 35;
                V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol].Font.Bold := true;
          end;
       CellTL:=V.WorkBooks[1].WorkSheets[1].Cells[StartedRow-1,1];
       CellBR:=V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,SummaDolgCol];
       Range:=V.WorkBooks[1].WorkSheets[1].Range[CellTL,CellBR];
{
       Formula:='r'+IntToStr(StartedRow)+'c1:r'+IntToStr(CurrRow)+'c'+IntToStr(SummaDolgCol);
       Range:=V.WorkBooks[1].WorkSheets[1].Range['r4c4:r28c41'];
}
       Range.Borders[xlEdgeLeft].LineStyle := xlContinuous;
       Range.Borders[xlEdgeLeft].Weight := xlThin;
       Range.Borders[xlEdgeLeft].ColorIndex := xlAutomatic;

       Range.Borders[xlEdgeRight].LineStyle := xlContinuous;
       Range.Borders[xlEdgeRight].Weight := xlThin;
       Range.Borders[xlEdgeRight].ColorIndex := xlAutomatic;

       Range.Borders[xlEdgeTop].LineStyle := xlContinuous;
       Range.Borders[xlEdgeTop].Weight := xlThin;
       Range.Borders[xlEdgeTop].ColorIndex := xlAutomatic;

       Range.Borders[xlEdgeBottom].LineStyle := xlContinuous;
       Range.Borders[xlEdgeBottom].Weight := xlThin;
       Range.Borders[xlEdgeBottom].ColorIndex := xlAutomatic;

       Range.Borders[xlInsideVertical].LineStyle := xlContinuous;
       Range.Borders[xlInsideVertical].Weight := xlThin;
       Range.Borders[xlInsideVertical].ColorIndex := xlAutomatic;

       Range.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
       Range.Borders[xlInsideHorizontal].Weight := xlThin;
       Range.Borders[xlInsideHorizontal].ColorIndex := xlAutomatic;




       if pFIBQuery.Open then
          pFIBQuery.Close;
       if FIB.pFIBQuery.Open then
          FIB.pFIBQuery.Close;
       if pFIBQuery.Transaction.Active then
          pFIBQuery.Transaction.Commit;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       if ListAdd.Count>0 then
          for i:=0 to ListAdd.Count-1 do dispose(PRec(ListAdd.Items[i]));
       ListAdd.Free;
       if ListUd.Count>0 then
          for i:=0 to ListUd.Count-1 do dispose(PRec(ListUd.Items[i]));
       ListUd.Free;
       FileName:=CDOC+'P'+IntToStr(I_NSRV)+'_'+IntToStr(MONTH_VY)+'_'+IntToStr(YEAR_VY)+'.XLS';
       V.ActiveWorkBook.SaveAs(fileName);
       V.Quit;
       V:=Unassigned;
  end;



procedure TFormAutoRep.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

end.
