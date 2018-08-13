unit UFormRepAUP_PPS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepAUP_PPS = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtIn: TDateTimePicker;
    Label2: TLabel;
    rgSort: TRadioGroup;
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateReport;
    procedure fillPerson(curr_person:person_ptr);
    procedure moveToExcel;

  public
    { Public declarations }
  end;

var
  FormRepAUP_PPS: TFormRepAUP_PPS;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists;
  type pRec=^TRec;
       TRec=record
             fio      : string;
             tabno    : Integer;
             dolg     : string;
             shifrpod : Integer;
             shifrDol : Integer;
             summaAdd : Real;
             summaUd  : Real;
             shifrGru : Integer;
            end;

  var list:TList;
      modeSort:Integer;
{$R *.dfm}

procedure TFormRepAUP_PPS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepAUP_PPS.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);
     rgSort.ItemIndex := 0;
end;

procedure TFormRepAUP_PPS.BitBtn1Click(Sender: TObject);
begin
     CreateReport;
end;
function compare(Item1:Pointer;Item2:pointer):Integer;
 var retVal:Integer;
 begin
      if (modeSort=0) then
         retVal:=AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio)
      else
      if (modeSort=1) then
         begin
              if pRec(Item1).shifrpod>pRec(Item2).shifrpod then retVal:=1
              else
              if pRec(Item1).shifrpod<pRec(Item2).shifrpod then retVal:=-1
              else
                retVal:=AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio);
         end
      else
      if (modeSort=2) then
         begin
              if pRec(Item1).shifrDol>pRec(Item2).shifrDol then retVal:=1
              else
              if pRec(Item1).shifrDol<pRec(Item2).shifrDol then retVal:=-1
              else
                retVal:=AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio);
         end
      else
         begin
              if pRec(Item1).shifrGru>pRec(Item2).shifrGru then retVal:=1
              else
              if pRec(Item1).shifrGru<pRec(Item2).shifrGru then retVal:=-1
              else
                retVal:=AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio);
         end;
      compare:=retVal;
 end;

procedure TFormRepAUP_PPS.CreateReport;
  var savNMES,savNSRV:integer;
      iNSRV:Integer;
      curr_person:PERSON_PTR;
  begin
       modeSort:=rgSort.ItemIndex;
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
                       if isPersonAUP_PPS(curr_person) then
                          fillPerson(Curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       Application.ProcessMessages;
       list.Sort(@Compare);
       moveToExcel;
       list.Free;
       NMES:=savNMES;
       NSRV:=savNSRV;
       MKFLNM;
       getinf(true);
  end;
procedure TFormRepAUP_PPS.fillPerson(curr_person:person_ptr);
  var rec:pRec;
  begin
       New(rec);
       rec.tabno    := curr_person^.tabno;
       rec.fio      := Trim(curr_person^.fio);
       rec.shifrpod := nsrv;
       rec.shifrDol := get_dol_code(curr_person);
       rec.dolg     := Trim(Curr_person^.DOLG);
       rec.shifrGru := curr_person^.GRUPPA;
       rec.summaAdd := getSummaAddForPerson(curr_person);
       rec.summaUd  := getSummaUdForPerson(curr_person);
       list.Add(Rec);
  end;
procedure TFormRepAUP_PPS.moveToExcel;
  var E,WC:Variant;
    ExRow,ExCol:integer;
    i:Integer;
    currPod:Integer;
    lineno:Integer;
    currdol:Integer;
    currGru:Integer;
  begin
     currPod:=0;
     currDol:=0;
     currGru:=0;
     try
        E:=CreateOleObject('Excel.Application');
     except
       on e:Exception do
          begin
               ShowMessage('Ошибка запуска Excel '+E.Message);
               Exit;
          end;
     end;
     E.WorkBooks.add;
     E.Visible:=False;
     FormWait.Show;
     Application.ProcessMessages;
     exRow:=5;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow-2,1]:='Список АУП-ППС за '+getMonthRus(NMES)+' '+intToStr(CurrYear)+' г.';
     for i:=0 to list.Count-1 do
       begin
            Inc(exRow);
            lineno:=0;
            if modeSort=0 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=i+1;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=pRec(list.Items[i]).summaAdd;
            //        E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).summaUd;
               end
            else
            if (modeSort=1) then
               begin
                    if currPod<>pRec(list.Items[i]).shifrpod then
                       begin
                            currPod:=pRec(list.Items[i]).shifrpod;
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=Name_Serv(currPod);
                            Inc(ExRow);
                            lineno:=0;
                       end;
                       Inc(lineno);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=lineno;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=pRec(list.Items[i]).summaAdd;
              //         E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).summaUd;
               end
            else
            if (modeSort=2) then
               begin
                    if currDol<>pRec(list.Items[i]).shifrDol then
                       begin
                            currDol:=pRec(list.Items[i]).shifrDol;
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=NameDolgList.GetName(currDol);// NAME_DOLG(currDol);
                            Inc(ExRow);
                            lineno:=0;
                       end;
                       Inc(lineno);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=lineno;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=Name_Serv(pRec(list.Items[i]).shifrpod);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).summaAdd;
                //       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pRec(list.Items[i]).summaUd;
               end
            else
               begin
                    if currGru<>pRec(list.Items[i]).shifrGru then
                       begin
                            currGru:=pRec(list.Items[i]).shifrGru;
                            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=ist_fin_name[currGru];
                            Inc(ExRow);
                            lineno:=0;
                       end;
                       Inc(lineno);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=lineno;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).fio;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).dolg;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=Name_Serv(pRec(list.Items[i]).shifrpod);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).summaAdd;
                  //     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pRec(list.Items[i]).summaUd;
               end

       end;
     FormWait.Hide;
     Application.ProcessMessages;
     E.Visible:=true;


  end;

end.
