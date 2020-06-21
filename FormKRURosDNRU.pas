unit FormKRURosDNRU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, StdCtrls,
  ComCtrls, Buttons;

type
  TFormKRURosDNR = class(TForm)
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    LabelFio: TLabel;
    dpDateFr: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dpDateTo: TDateTimePicker;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    EditAwans: TEdit;
    Label4: TLabel;
    EditZarplata: TEdit;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    wantedTabno:Integer;
    wantedFIO:string;
    dateFr,dateTo:TDateTime;
    procedure fillFromSQL;
    procedure ExportToExcel;

  public
    { Public declarations }
  end;

var
  FormKRURosDNR: TFormKRURosDNR;

implementation
  USes uFIBModule,uFrmFindKadryFB,dateUtils,SCrDef,ScrUtil,UFormWait,ComObj;

{$R *.dfm}
  type pRec = ^TRec;
       tRec=record
             y:Integer;
             m:Integer;
             summaAdd:Real;
             summaUd:Real;
             summaAwans:Real;
             summaZarpl:Real;
            end;
   var list:TList;
procedure TFormKRURosDNR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormKRURosDNR.fillFromSQL;
var SQLStmnt:string;
    Rec:pRec;
    y,m:Integer;
    yF,mF,yT,mT:Integer;
    summa:Real;
    awanslist,zarplatalist:string;
    filter:string;
    i:Integer;
    function findRec(y,m:integer):pRec;
      var i:Integer;
          retVal:pRec;
          finded:Boolean;
      begin
           retVal:=nil;
           finded:=False;
           if list.Count>0 then
              for i:=0 to list.Count-1 do
                  if ((Prec(List.items[i]).y=y) and
                      (Prec(List.items[i]).m=m)) then
                     begin
                          finded:=True;
                          retVal:=pRec(List.items[i]);
                     end;
           findRec:=retVal;          
      end;
begin
     FormWait.Show;
     Application.ProcessMessages;
     awanslist:=Trim(EditAwans.Text);
     zarplatalist:=Trim(EditZarplata.Text);
     yF:=yearOf(dpDateFr.date);
     mF:=monthOf(dpDateFr.date);
     yT:=yearOf(dpDateTo.date);
     mT:=monthOf(dpDateTo.date);
     filter:='(((a.year_vy < '+IntToStr(yF)+')';
     filter:=Trim(filter)+' or (a.year_vy = '+IntToStr(yF)+' and a.month_vy < '+IntToStr(mF)+'))';
     filter:=Trim(filter)+' or ';
     filter:=Trim(filter)+' ((a.year_vy > '+IntToStr(yT)+')';
     filter:=Trim(filter)+' or (a.year_vy = '+IntToStr(yT)+' and a.month_vy > '+IntToStr(mT)+')))';
     SQLStmnt:='select a.year_vy y,a.month_vy m,sum(a.summa) summa from fadd a';
     SQLStmnt:=trim(SQLStmnt)+' where a.tabno='+IntToStr(wantedTabno);
     SQLStmnt:=trim(SQLStmnt)+' and not '+filter;
     SQLStmnt:=trim(SQLStmnt)+' group by 1,2';
     pFIBQuery1.Close;
     pFIBQuery1.SQL.Add(SQLStmnt);
     pFIBQuery1.Transaction.StartTransaction;
     pFIBQuery1.ExecQuery;
     while not (pFIBQuery1.eof) do
       begin
            i:=list.count;
            y:=pFIBQuery1.Fields[0].AsInteger;
            m:=pFIBQuery1.Fields[1].AsInteger;
            summa:=pFIBQuery1.Fields[2].AsFloat;
            New(Rec);
            fillchar(Rec^,SizeOf(Rec^),0);
            Rec.y:=y;
            Rec.m:=m;
            Rec.summaAdd:=summa;
            list.Add(Rec);
            pFIBQuery1.Next;
       end;
     SQLStmnt:='select a.year_vy y,a.month_vy m,sum(a.summa) summa from fud a';
     SQLStmnt:=trim(SQLStmnt)+' where a.tabno='+IntToStr(wantedTabno);
     SQLStmnt:=trim(SQLStmnt)+'  and a.shifrsta not in ('+AwansList+','+ZarplataList+')';
     SQLStmnt:=trim(SQLStmnt)+' and not '+filter;
     SQLStmnt:=trim(SQLStmnt)+' group by 1,2';
     pFIBQuery1.Close;
     pFIBQuery1.Transaction.COMMIt;
     pFIBQuery1.SQL.Clear;
     pFIBQuery1.SQL.Add(SQLStmnt);
     pFIBQuery1.Transaction.StartTransaction;
     pFIBQuery1.ExecQuery;
     while not (pFIBQuery1.eof) do
       begin
            y:=pFIBQuery1.Fields[0].AsInteger;
            m:=pFIBQuery1.Fields[1].AsInteger;
            summa:=pFIBQuery1.Fields[2].AsFloat;
            Rec:=findRec(y,m);
            if Rec<>nil then
               Rec.summaUd:=summa
            else
              begin
                  New(Rec);
                  fillchar(Rec^,SizeOf(Rec^),0);
                  Rec.y:=y;
                  Rec.m:=m;
                  Rec.summaUd:=summa;
                  list.Add(Rec);
              end;
            pFIBQuery1.Next;
       end;

     SQLStmnt:='select a.year_vy y,a.month_vy m,sum(a.summa) summa from fud a';
     SQLStmnt:=trim(SQLStmnt)+' where a.tabno='+IntToStr(wantedTabno);
     SQLStmnt:=trim(SQLStmnt)+'  and a.shifrsta in ('+AwansList+')';
     SQLStmnt:=trim(SQLStmnt)+' and not '+filter;
     SQLStmnt:=trim(SQLStmnt)+' group by 1,2';
     pFIBQuery1.Close;
     pFIBQuery1.Transaction.COMMIt;
     pFIBQuery1.SQL.Clear;
     pFIBQuery1.SQL.Add(SQLStmnt);
     pFIBQuery1.Transaction.StartTransaction;
     pFIBQuery1.ExecQuery;
     while not (pFIBQuery1.eof) do
       begin
            y:=pFIBQuery1.Fields[0].AsInteger;
            m:=pFIBQuery1.Fields[1].AsInteger;
            summa:=pFIBQuery1.Fields[2].AsFloat;
            Rec:=findRec(y,m);
            if Rec<>nil then
               Rec.summaAwans:=summa
            else
              begin
                  New(Rec);
                  fillchar(Rec^,SizeOf(Rec^),0);
                  Rec.y:=y;
                  Rec.m:=m;
                  Rec.summaAwans:=summa;
                  list.Add(Rec);
              end;
            pFIBQuery1.Next;
       end;

     SQLStmnt:='select a.year_vy y,a.month_vy m,sum(a.summa) summa from fud a';
     SQLStmnt:=trim(SQLStmnt)+' where a.tabno='+IntToStr(wantedTabno);
     SQLStmnt:=trim(SQLStmnt)+'  and a.shifrsta in ('+ZarplataList+')';
     SQLStmnt:=trim(SQLStmnt)+' and not '+filter;
     SQLStmnt:=trim(SQLStmnt)+' group by 1,2';
     pFIBQuery1.Close;
     pFIBQuery1.Transaction.COMMIt;
     pFIBQuery1.SQL.Clear;
     pFIBQuery1.SQL.Add(SQLStmnt);
     pFIBQuery1.Transaction.StartTransaction;
     pFIBQuery1.ExecQuery;
     while not (pFIBQuery1.eof) do
       begin
            y:=pFIBQuery1.Fields[0].AsInteger;
            m:=pFIBQuery1.Fields[1].AsInteger;
            summa:=pFIBQuery1.Fields[2].AsFloat;
            Rec:=findRec(y,m);
            if Rec<>nil then
               Rec.summaZarpl:=summa
            else
              begin
                  New(Rec);
                  fillchar(Rec,SizeOf(Rec^),0);
                  Rec.y:=y;
                  Rec.m:=m;
                  Rec.summaZarpl:=summa;
                  list.Add(Rec);
              end;
            pFIBQuery1.Next;
       end;
     FormWait.Hide;
     Application.ProcessMessages;


end;

procedure TFormKRURosDNR.FormCreate(Sender: TObject);
begin
      LabelFio.Caption:='Укажите сотрудника';
      wantedTabno:=0;
      dateTo:=EncodeDate(CurrYear,NMES,1);
      dateFr:=IncMonth(dateTo,-1);
      dpDateFr.Date     := dateFr;
      dpDateTo.Date     := dateTo;
      EditAwans.Text    := '51,52,61,65,86,80,67,103';
      EditZarplata.Text := '53,67,69,77,91,52,102';
end;

procedure TFormKRURosDNR.BitBtn1Click(Sender: TObject);
begin
    LabelFio.Caption:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     Self.WantedTabno:=GetTabno;
                     Self.WantedFIO:=GetFio;
                     LabelFio.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.WantedFio);
               end;
         finally
{            free;}
         end;
       Self.Repaint;

end;

function compare(item1,item2:pointer):Integer;
 var retVal:Integer;
 begin
      retVal:=0;
      if pRec(item1)^.y<pRec(item2)^.y then retVal:=-1
      else
      if (pRec(item1)^.y=pRec(item2)^.y)
         and
         (pRec(item1)^.m<pRec(item2)^.m)
      then retVal:=-1
      else
      if pRec(item1)^.y>pRec(item2)^.y then retVal:=1
      else
      if (pRec(item1)^.y=pRec(item2)^.y)
         and
         (pRec(item1)^.m>pRec(item2)^.m)
      then retVal:=1
      else retVal:=0;
      compare:=retVal;
 end;
procedure TFormKRURosDNR.BitBtn2Click(Sender: TObject);
var i:Integer;
begin
     if wantedTabno>0 then
        begin
             list:=TList.Create;
             fillFromSQL;
             IF list.Count>0 then
                BEGIN
                     list.Sort(@compare);
                     ExportToExcel;
                     for i:=0 to list.Count-1 do
                        Dispose(pRec(list.Items[i]));
                END;
             list.Clear;
             list.Free;
             list:=nil;
        end;
end;

procedure TFormKRURosDNR.ExportToExcel;
var E,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    i:Integer;
    rec:pRec;
    ms:string;
begin
     FName:=TemplateDIR+'RosZP.xlt';
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
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     exRow:=4;
     exCol:=4;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=wantedFIO;
     exRow:=7;
     for i:=0 to list.Count-1 do
       begin
            rec:=pRec(list.Items[i]);
            ms:=getMonthRus(rec.m)+' '+IntToStr(rec.y);
            Inc(ExRow);
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1].Select;
            E.Selection.EntireRow.Insert;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=ms;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=rec^.summaadd;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=rec^.summaud;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=rec^.summaawans;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=rec^.summazarpl;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]:=rec^.summaawans+rec^.summazarpl;

       end;

end;

end.
