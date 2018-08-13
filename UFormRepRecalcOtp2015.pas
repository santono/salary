unit UFormRepRecalcOtp2015;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,ScrDef;

type
  TFormRepRecalcOtp2015 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rgSort: TRadioGroup;
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateReport;
    procedure fill_person(curr_person:person_ptr);
    procedure moveToExcel;

  public
    { Public declarations }
  end;

var
  FormRepRecalcOtp2015: TFormRepRecalcOtp2015;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,SCrIO;

  type pRec=^TRec;
       TRec=record
             fio       : string;
             tabno     : Integer;
             dolg      : string;
             shifrpod  : Integer;
             SummaOtp  : Real;
             SummaEcb  : real;
             SummaEcbN : real;
             SummaPod  : Real;
            end;

  var list:TList;
      modeSort:Integer;
{$R *.dfm}

procedure TFormRepRecalcOtp2015.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepRecalcOtp2015.FormCreate(Sender: TObject);
begin
    // dtIn.Date        := IncMonth(Date,-1);
     rgSort.ItemIndex := 0;
end;

procedure TFormRepRecalcOtp2015.BitBtn1Click(Sender: TObject);
begin
     if not ((NMES=4) and (CURRYEAR=2017)) then
        begin
             ShowMessage('Отчет только в апреле 2017 года');
        end;
     CreateReport;
     Close;
end;
procedure TFormRepRecalcOtp2015.CreateReport;
  var savNMES,savNSRV:integer;
      iNSRV:Integer;
      curr_person:PERSON_PTR;

  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       EMPTY_ALL_PERSON;
       modeSort:=rgSort.ItemIndex;
       list:=TList.Create;
       ProgressBar1.Min:=0;
       ProgressBar1.Max:=Count_Serv;
       ProgressBar1.Step:=1;
       for iNSRV:=1 to Count_Serv do
           begin
                NSRV:=iNSRV;
                MKFLNM;
                ProgressBar1.StepIt;
                Application.ProcessMessages;
                if not fileexists(FNINF) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       fill_person(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       Application.ProcessMessages;
       moveToExcel;
       list.Free;
       NMES:=savNMES;
       NSRV:=savNSRV;
       MKFLNM;
       getinf(true);
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
procedure TFormRepRecalcOtp2015.fill_person(curr_person:person_ptr);
  var rec:pRec;
      Curr_Add:ADD_PTR;
      Curr_Ud:UD_PTR;
      SummaAdd,summaECB,summaECBN,summaPod:Real;
  begin
       SummaAdd:=0;
       summaECB:=0;
       summaECBN:=0;
       summaPod:=0;
       curr_Add:=curr_Person^.ADD;
       while (Curr_Add<>nil) do
         begin
              if curr_Add^.shifr=169 then
              if curr_add^.period=12 then
                 begin
                      summaAdd:=curr_add^.SUMMA;
                      break;
                 end;
              curr_add:=curr_add^.NEXT;
         end;
       curr_Ud:=curr_Person^.ud;
       while (Curr_Ud<>nil) do
         begin
              if (curr_Ud^.shifr=ECBSHIFR) then
              if curr_Ud^.period=12 then
                 summaECB:=curr_ud^.SUMMA;
              if (curr_Ud^.shifr=ECBNSHIFR) then
              if curr_Ud^.period=12 then
                 summaECBN:=curr_ud^.SUMMA;
              if curr_Ud^.shifr = PODOH_SHIFR then
              if curr_Ud^.period=12 then
              if curr_Ud^.YEAR+1990=2015 then
                 summaPod:=curr_ud^.SUMMA;
              curr_ud:=curr_ud^.NEXT;
         end;
       if ((Abs(summaAdd)>0.005) or
           (Abs(summaECB)>0.005) or
           (Abs(summaECBN)>0.005) or
           (Abs(summaPod)>0.005)) then
         begin
              New(rec);
              rec.tabno:=curr_person^.tabno;
              rec.fio:=Trim(curr_person^.FIO);
              rec.shifrpod:=NSRV;
              rec.SummaOtp  := SummaAdd;
              rec.summaECB  := summaECB;
              rec.summaECBN := summaECBN;
              rec.summaPod  := summaPod;
              list.Add(Rec);
         end;
       list.Sort(@compare);
  end;
procedure TFormRepRecalcOtp2015.moveToExcel;
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
     exRow:=5;
     FormWait.Show;
     Application.ProcessMessages;
     for i:=0 to list.Count-1 do
       begin
            Inc(exRow);
            if modeSort=0 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=i+1;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).SummaOtp;
                    if abs(pRec(list.Items[i]).SummaEcb)>0.005 then
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=pRec(list.Items[i]).SummaEcb;
                    if abs(pRec(list.Items[i]).SummaEcbN)>0.005 then
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).SummaEcbN;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pRec(list.Items[i]).SummaPod;
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
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).SummaOtp;
                    if abs(pRec(list.Items[i]).SummaEcb)>0.005 then
                      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=pRec(list.Items[i]).SummaEcb;
                    if abs(pRec(list.Items[i]).SummaEcbN)>0.005 then
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).SummaEcbN;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pRec(list.Items[i]).SummaPod;
               end
       end;
     FormWait.Hide;
     Application.ProcessMessages;
     E.Visible:=True;


  end;

end.
