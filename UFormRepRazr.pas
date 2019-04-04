unit UFormRepRazr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepRazr = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtIn: TDateTimePicker;
    Label2: TLabel;
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
  FormRepRazr: TFormRepRazr;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists;
  type pRec=^TRec;
       TRec=record
             razr     : integer;
             fio      : string;
             tabno    : Integer;
             dolg     : string;
             shifrpod : Integer;
             shifrLine: integer;
             shifrDol : Integer;
             koef     : real;
            end;

  var list         : TList;
{$R *.dfm}

procedure TFormRepRazr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepRazr.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);

end;

procedure TFormRepRazr.BitBtn1Click(Sender: TObject);
begin
     CreateReport;
end;
function compare(Item1:Pointer;Item2:pointer):Integer;
 var retVal:Integer;
 begin
      if pRec(Item1).razr>pRec(Item2).razr then retVal:=1
      else
      if pRec(Item1).razr<pRec(Item2).razr then retVal:=-1
      else
      retVal:=ansicompareText(pRec(Item1)^.fio,pRec(Item2)^.fio);
      if retVal<0 then retVal:=-1;
      if retVal>0 then retVal:=1;
      compare:=retVal;
 end;

procedure TFormRepRazr.CreateReport;
  var savNMES,savNSRV:integer;
      iNSRV:Integer;
      curr_person:PERSON_PTR;
  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       EMPTY_ALL_PERSON;
       list:=TList.Create;
       ProgressBar1.Min:=0;
       ProgressBar1.Max:=Count_Serv;
       ProgressBar1.Step:=1;
       for iNSRV:=1 to Count_Serv do
           begin
                ProgressBar1.StepIt;
                Application.ProcessMessages;
                if IsColedgPodr(iNSRV) then continue;
                if DOG_POD_PODRAZD(iNSRV) then continue;
                if iNSRV=82 then continue;
                if iNSRV=121 then continue;
                NSRV:=iNSRV;
                MKFLNM;
                if not fileexists(FNINF) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
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
procedure TFormRepRazr.fillPerson(curr_person:person_ptr);
  var rec:pRec;
      shifrDol:integer;
      shifrKat:integer;
      i:integer;
      razr:integer;
  function ExistsTabnoIntList(tabno:integer):boolean;
   var retVal:boolean;
       i:integer;
   begin
        retVal:=false;
        if list.count>0 then
           for i:=0 to list.count-1 do
               if pRec(list.Items[i]).tabno=tabno then
                  begin
                       retVal:=true;
                       break;
                  end;
        ExistsTabnoIntList:=retVal;
   end;
  begin
       shifrDol:=GET_DOL_CODE(curr_person);
       if shifrDol<10 then exit;
       if shifrDol=1500 then exit;
       if not IS_OSN_WID_RABOTY(curr_person) then exit;
       if curr_person^.OKLAD<1.00 then exit;
       razr:=GetRazrjadPerson(curr_person);
       if razr<1 then exit;
       if razr>25 then exit;
       if ExistsTabnoIntList(Curr_Person^.tabno) then exit;
       New(rec);
       rec.razr     := razr;
       rec.tabno    := curr_person^.tabno;
       rec.fio      := Trim(curr_person^.fio);
       rec.shifrpod := nsrv;
       rec.shifrDol := shifrDol;
       rec.dolg     := Trim(Curr_person^.DOLG);
       rec.shifrLine:= shifrKat;
       rec.koef     := GET_KOEF_OKLAD_PERSON(Curr_Person);
       list.Add(Rec);
  end;
procedure TFormRepRazr.moveToExcel;
  var E,WC:Variant;
    ExRow,ExCol:integer;
    i:Integer;
    currPod:Integer;
    lineno:Integer;
    currdol:Integer;
    currGru:Integer;
  function getRazrCount(r:integer):integer;
   var retVal:integer;
       i:integer;
   begin
        retVal:=0;
        if list.count>0 then
           for i:=0 to list.count-1 do
               if pRec(list.Items[i]).razr=r then
                  inc(retVal);
        getRazrCount:=retVal;
   end;
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
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow-2,1]:='Список работников для свода по разрядам за '+getMonthRus(NMES)+' '+intToStr(CurrYear)+' г.';
     lineno:=0;
     ProgressBar1.Min:=0;
     ProgressBar1.Max:=list.Count;
     ProgressBar1.Position:=ProgressBar1.Min;
     ProgressBar1.Step:=1;
     for i:=0 to list.Count-1 do
       begin
            ProgressBar1.StepIt;
            Application.ProcessMessages;
            Inc(exRow);
            inc(lineno);
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=i+1;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(list.Items[i]).razr;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(list.Items[i]).tabno;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=pRec(list.Items[i]).fio;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(list.Items[i]).dolg;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pRec(list.Items[i]).koef;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=pRec(list.Items[i]).dolg;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=pRec(list.Items[i]).shifrpod;

       end;
     exRow:=5;
     for i:=1 to 24 do
       begin
            Inc(exRow);
            inc(lineno);
            E.WorkBooks[1].WorkSheets[2].Cells[ExRow,1]:=i;
            E.WorkBooks[1].WorkSheets[2].Cells[ExRow,2]:=getRazrCount(i);
       end;
     FormWait.Hide;
     Application.ProcessMessages;
     E.Visible:=true;


  end;


end.
