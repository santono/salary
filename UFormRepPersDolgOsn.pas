unit UFormRepPersDolgOsn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls;

type
  TFormRepPersDolgOsn = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsoREP: TDataSource;
    pFIBdsRep: TpFIBDataSet;
    pFIBTrRepRead: TpFIBTransaction;
    dtIn: TDateTimePicker;
    Label2: TLabel;
    pFIBdsRepTABNO: TFIBIntegerField;
    pFIBdsRepFIO: TFIBStringField;
    pFIBdsRepDOLG: TFIBStringField;
    pFIBdsRepSHIFRPOD: TFIBSmallIntField;
    pFIBdsRepDOLG1: TFIBStringField;
    rgSort: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateReport;
    procedure fillList;
    procedure moveToExcel;

  public
    { Public declarations }
  end;

var
  FormRepPersDolgOsn: TFormRepPersDolgOsn;

implementation
  uses
      uFIBModule,scRdEF,UFormWait,ScrUtil,DateUtils,ComObj;

  type pRec=^TRec;
       TRec=record
             fio      : string;
             tabno    : Integer;
             dolg     : string;
             shifrpod : Integer;
            end;

  var list:TList;
      modeSort:Integer;
{$R *.dfm}

procedure TFormRepPersDolgOsn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepPersDolgOsn.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);
     rgSort.ItemIndex := 0;
end;

procedure TFormRepPersDolgOsn.BitBtn1Click(Sender: TObject);
begin
     if YesNo('Отчет создается из БД.'+^M+' Если данные перенесены в БД создавайте отчет. Создать отчет из БД?') then
        begin
             CreateReport;
             Close;
        end;
end;
procedure TFormRepPersDolgOsn.CreateReport;
  begin
       if pFIBdsRep.Active then
          pFIBdsRep.Close;
       if pFIBdsRep.Transaction.Active then
          pFIBdsRep.Transaction.Commit;
       pFIBdsRep.Transaction.StartTransaction;
       pFIBdsRep.Params[0].AsInteger := YearOf(dtIn.Date);
       pFIBdsRep.Params[1].AsInteger := monthOf(dtIn.Date);
       FormWait.Show;
       Application.ProcessMessages;
       pFIBdsRep.Open;
       FormWait.Hide;
       Application.ProcessMessages;
       fillList;
       moveToExcel;
       pFIBdsRep.Close;
       pFIBdsRep.Transaction.Commit;
       list.Free;
  end;
function compare(Item1:Pointer;Item2:pointer):Integer;
 var retVal:Integer;
 begin
      if (modeSort=0) then
         retVal:=AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio)
      else
         begin
              if pRec(Item1).shifrpod>pRec(Item2).shifrpod then retVal:=1
              else
              if pRec(Item1).shifrpod<pRec(Item2).shifrpod then retVal:=-1
              else
                retVal:=AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio);
         end;
      compare:=retVal;
 end;
procedure TFormRepPersDolgOsn.fillList;
  var rec:pRec;
  begin
       modeSort:=rgSort.ItemIndex;
       list:=TList.Create;
       pFIBdsRep.First;
       while not pFIBdsRep.Eof do
         begin
              New(rec);
              rec.tabno:=pFIBdsRepTABNO.Value;
              rec.fio:=pFIBdsRepFIO.Value;
              rec.shifrpod:=pFIBdsRepSHIFRPOD.Value;
              rec.dolg:=pFIBdsRepDolg.Value;
              list.Add(Rec);
              pFIBdsRep.Next;
         end;
       list.Sort(@compare);
  end;
procedure TFormRepPersDolgOsn.moveToExcel;
  var E,WC:Variant;
    ExRow,ExCol:integer;
    i:Integer;
    currPod:Integer;
  begin
     currPod:=0;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.WorkBooks.add;
     E.Visible:=True;
     exRow:=5;
     for i:=0 to list.Count-1 do
       begin
            Inc(exRow);
            if modeSort=0 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=i+1;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
               end
            else
               begin
                    if currPod<>pRec(list.Items[i]).shifrpod then
                       begin
                            currPod:=pRec(list.Items[i]).shifrpod;
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=Name_Serv(currPod);
                            Inc(ExRow);
                       end;
             //          E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=i+1;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
               end
       end;


  end;

end.
