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
    ButtonSelPKG: TButton;
    rgModeSowm: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ButtonSelPKGClick(Sender: TObject);
  private
    { Private declarations }
    modeSowm:Integer;
    procedure CreateReport;
    procedure fillPerson(curr_person:person_ptr);
    procedure fillPersonDop(curr_person:person_ptr);
    procedure moveToExcel;
    procedure fillDopList;

  public
    { Public declarations }
  end;

var
  FormRepRazr: TFormRepRazr;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists,uFormSelPKG;
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
       pDopRec=^TDopRec;
       TDopRec=record
                shifrDol : integer;
                nameDol  : string;
                procent  : real;
                baseRazr : integer;
                fraza    : string;
                koef     : real;
               end;

  var list         : TList;
      listDop      : TList;
      listDopSpr   : TList;
{$R *.dfm}

procedure TFormRepRazr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepRazr.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);
     rgModeSowm.ItemIndex := 0;
     modeSowm := rgModeSowm.ItemIndex;
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
      shifrKat, shifrGru,i : integer;
      currModeSowm : Integer;
  begin
//       if NameServList.CountSelected<1 then
//          begin
//               showMessage('Не указаны подразделения');
//               exit;
//          end;
//       if GruppyList.Count<1 then
//          begin
//               showMessage('Не указаны счета');
//               exit;
//          end;
//       if KategList.Count<1 then
//          begin
//               showMessage('Не указаны категории работников');
//               exit;
//          end;
       savNMES:=NMES;
       savNSRV:=NSRV;
       EMPTY_ALL_PERSON;
       modeSowm:=rgModeSowm.ItemIndex;
       list:=TList.Create;
       listDop:=TList.Create;
       fillDopList;
       ProgressBar1.Min:=0;
       ProgressBar1.Max:=Count_Serv;
       ProgressBar1.Step:=1;
       for iNSRV:=1 to Count_Serv do
           begin
                ProgressBar1.StepIt;
                Application.ProcessMessages;
//                if not NameServList.IsSelected(iNSRV) then continue;

//                if IsColedgPodr(iNSRV) then continue;
//                if DOG_POD_PODRAZD(iNSRV) then continue;
//                if iNSRV=82 then continue;
//                if iNSRV=121 then continue;
                NSRV:=iNSRV;
                if not NameServList.IS_MO_BUD(nsrv) then Continue;
                if nsrv in [82] then continue;
                MKFLNM;
                if not fileexists(FNINF) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       shifrKat:=curr_person^.kategorija;
                       shifrGru:=curr_person^.gruppa;
                       if shifrGru=1 then
                          begin
                               if ((modeSowm=0)
                                  or
                                 ((modeSowm=1) and IS_OSN_WID_RABOTY(curr_person))
                                  or
                                  ((modeSowm=2) and not IS_OSN_WID_RABOTY(curr_person)))
                               then
//                       if GruppyList.IsSelected(shifrGru) then
//                       if KategList.IsSelected(shifrKat)  then
                                fillPerson(Curr_person);
                          end;
                       curr_person:=curr_person^.NEXT;
                  end;
                EMPTY_ALL_PERSON;
           end;
       Application.ProcessMessages;
       list.Sort(@Compare);
       moveToExcel;
       if list.count>0 then
          for i:=0 to list.count-1 do
              dispose(pRec(list.Items[i]));
       list.Free;
       list:=nil;
       if listDop.count>0 then
          for i:=0 to listDop.count-1 do
              dispose(pRec(listDop.Items[i]));
       listDop.Free;
       listDop:=nil;
       if listDopSpr.count>0 then
          begin
               for i:=0 to listDopSpr.count-1 do
                   dispose(pDopRec(listDopSpr.Items[i]));
          end;
       listDopSpr.Free;
       listDopSpr:=nil;
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
  function isInDolSpr(shifrDol:integer):boolean;
   var retVal:boolean;
       i:integer;
   begin
        retVal:=false;
        if listDopSpr.count>0 then
           for i:=0 to listDopSpr.count-1 do
               if pDopRec(listDopSpr.Items[i]).shifrDol=shifrDol then
                  begin
                       retVal:=true;
                       break;
                  end;
        isInDolSpr:=retVal;
   end;
  begin
       shifrDol:=GET_DOL_CODE(curr_person);
       if shifrDol<10 then exit;
       if shifrDol=1500 then exit;
//       if not IS_OSN_WID_RABOTY(curr_person) then exit;
       if curr_person^.OKLAD<1.00 then exit;
       if isInDolSpr(shifrDol) then
          begin
               fillPersonDop(curr_person);
               exit;
          end;
       razr:=GetRazrjadPerson(curr_person);
       if razr<1 then exit;
       if razr>25 then exit;
    //   if ExistsTabnoIntList(Curr_Person^.tabno) then exit;
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
procedure TFormRepRazr.fillPersonDop(curr_person:person_ptr);
  var rec:pRec;
      shifrDol:integer;
      shifrKat:integer;
      i:integer;
      razr:integer;
  function ExistsTabnoInListDop(tabno:integer):boolean;
   var retVal:boolean;
       i:integer;
   begin
        retVal:=false;
        if listDop.count>0 then
           for i:=0 to listDop.count-1 do
               if pRec(listDop.Items[i]).tabno=tabno then
                  begin
                       retVal:=true;
                       break;
                  end;
        ExistsTabnoInListDop:=retVal;
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
       if ExistsTabnoInListDop(Curr_Person^.tabno) then exit;
       New(rec);
       rec.razr     := razr;
       rec.tabno    := curr_person^.tabno;
       rec.fio      := Trim(curr_person^.fio);
       rec.shifrpod := nsrv;
       rec.shifrDol := shifrDol;
       rec.dolg     := Trim(Curr_person^.DOLG);
       rec.shifrLine:= shifrKat;
       rec.koef     := GET_KOEF_OKLAD_PERSON(Curr_Person);
       listDop.Add(Rec);
  end;
procedure TFormRepRazr.moveToExcel;
  var E,WC:Variant;
    ExRow,ExCol:integer;
    lastRow1, lastRow2:integer;
    i:Integer;
    currPod:Integer;
    lineno:Integer;
    currdol:Integer;
    currGru:Integer;
  function getSumKoefForRazr(r:integer):real;
   var retVal:real;
       i:integer;
   begin
        retVal:=0;
        if list.count>0 then
           for i:=0 to list.count-1 do
               if pRec(list.Items[i]).razr=r then
                  retVal:=retVal + pRec(list.Items[i])^.koef;
        getSumKoefForRazr:=retVal;
   end;
  function createListDopSprCount:integer;
   var retVal:real;
       i,j:integer;
   begin
        retVal:=0;
        if listDopSpr.count>0 then
           for i:=0 to listDopSpr.count-1 do
               begin
                    retVal:=0;
                    for j:=0 to listDop.count-1 do
                      if pRec(listDop.Items[j]).shifrDol=pDopRec(listDopSpr.Items[i]).shifrDol then
                         retVal := retVal + pRec(listDop.items[j]).koef;
                    pDopRec(listDopSpr.Items[i]).koef:= retVal;
               end;
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
     lastRow1 := ExRow;
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
            lastRow1:=exRow;
       end;
     exRow:=5;
     lastRow2 := ExRow;
     for i:=1 to 24 do
       begin
            Inc(exRow);
            inc(lineno);
            E.WorkBooks[1].WorkSheets[2].Cells[ExRow,1]:=i;
            E.WorkBooks[1].WorkSheets[2].Cells[ExRow,2]:=getSumKoefForRazr(i);
            lastRow2:=exRow;
       end;
     createListDopSprCount;


     lineno:=0;
     exRow:=lastRow1+5;
     for i:=0 to listDop.Count-1 do
       begin
            ProgressBar1.StepIt;
            Application.ProcessMessages;
            Inc(exRow);
            inc(lineno);
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=i+1;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pRec(listDop.Items[i]).razr;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pRec(listDop.Items[i]).tabno;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=pRec(listDop.Items[i]).fio;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pRec(listDop.Items[i]).dolg;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pRec(listDop.Items[i]).koef;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=pRec(listDop.Items[i]).dolg;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=pRec(listDop.Items[i]).shifrpod;

       end;
     exRow:=lastRow2+5;
     lineno:=0;
     if listDopSpr.count>0 then
     for i:=0 to listDopSpr.count-1 do
       begin
            if pDopRec(listDopSpr.Items[i])^.koef>0.1 then
               begin
                 Inc(exRow);
                 inc(lineno);
                 E.WorkBooks[1].WorkSheets[2].Cells[ExRow,1]:=i;
                 E.WorkBooks[1].WorkSheets[2].Cells[ExRow,2]:=pDopRec(listDopSpr.items[i])^.fraza;
                 E.WorkBooks[1].WorkSheets[2].Cells[ExRow,3]:=pDopRec(listDopSpr.items[i])^.koef;
                 E.WorkBooks[1].WorkSheets[2].Cells[ExRow,4]:=pDopRec(listDopSpr.items[i])^.nameDol;
               end;
       end;


     FormWait.Hide;
     Application.ProcessMessages;
     E.Visible:=true;


  end;


procedure TFormRepRazr.ButtonSelPKGClick(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormRepRazr.fillDopList;
   const len=13;
         shifryDol:array[1..len] of Integer =(20,30,40,520,605,1424,80,1531,1532,185,1536,180,302);
     {
                                      20,30,40: Curr_Person^.OKLAD := OkladProrektor;
                                      520:      Curr_Person^.OKLAD := OkladPomRektora;
                                      605:      Curr_Person^.OKLAD := OkladGlBuh;
                                      1424:     Curr_Person^.OKLAD := OkladZamGlBuh;
                                      80,1531:  Curr_Person^.OKLAD := OkladZamDekana;
                                      1532:     Curr_Person^.OKLAD := OkladZamDirInst;
                                      185:      Curr_Person^.OKLAD := OkladZamDirStudGorodka;
                                      1536:     Curr_Person^.OKLAD := OkladZamDirBiblioteki;
                                      180:      Curr_Person^.OKLAD := OkladZamNachUcjOtdela;
                                      302:      Curr_Person^.OKLAD := OkladZamNachETO;
     }
   var i:integer;
       rec:pDopRec;
  begin
       listDopSpr:=TList.Create;
       for i:=1 to len do
           begin
                new(rec);
                fillChar(rec^,sizeOf(rec^),0);
                rec^.shifrDol:=shifryDol[i];
                rec^.nameDol:=nameDolgList.GetName(rec^.shifrDol);
                case rec^.shifrDol of
                   20,30,40: begin rec^.procent:=0.95; rec^.baseRazr:=24;rec^.fraza:='95% от 24 т.р.';   end;
                   520:      begin rec^.procent:=0.7;  rec^.baseRazr:=24;rec^.fraza:='70% от 24 т.р.';   end;
                   605:      begin rec^.procent:=0.9;  rec^.baseRazr:=24;rec^.fraza:='90% от 24 т.р.';   end;
                   1424:     begin rec^.procent:=0.885;rec^.baseRazr:=24;rec^.fraza:='85.5% от 24 т.р.'; end;
                   80,1531:  begin rec^.procent:=0.9;  rec^.baseRazr:=22;rec^.fraza:='90% от 22 т.р.';   end;
                   1532:     begin rec^.procent:=0.9;  rec^.baseRazr:=21;rec^.fraza:='90% от 21 т.р.';   end;
                   185:      begin rec^.procent:=0.85; rec^.baseRazr:=10;rec^.fraza:='85% от 10 т.р.';   end;
                   1536:     begin rec^.procent:=0.95; rec^.baseRazr:=15;rec^.fraza:='95% от 15 т.р.';   end;
                   180:      begin rec^.procent:=0.9;  rec^.baseRazr:=11;rec^.fraza:='90% от 11 т.р.';   end;
                   302:      begin rec^.procent:=0.95; rec^.baseRazr:=11;rec^.fraza:='95% от 11 т.р.';   end;
                end;
                listDopSpr.Add(rec);
           end;
  end;

end.

