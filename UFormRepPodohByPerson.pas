unit UFormRepPodohByPerson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepPodohByPerson = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    LabelFio: TLabel;
    cbpodrMode: TComboBox;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    podrMode:Integer; //0-все 1-унив 2 кол 3 Алч 4 СТИ 5 Сев кол
    procedure CreateReport;
    procedure putPersonToList(curr_person:person_ptr);
    procedure ReportToExcel;
    function getPodrModeName:string;
  public
    { Public declarations }
  end;

var
  FormRepPodohByPerson: TFormRepPodohByPerson;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists;
  type pRec=^TRec;
       TRec=record
             fio          : string;
             tabno        : Integer;
             summaAdd     : Real;
             SummaPodRas  : real;
             SummaPodFakt : Real;
             SummaPodRazn : Real;
            end;

//  const nup=
//  const notusedpodr:array[1..nup] of integer =
  var list          : TList;
      E:Variant;
      FName:String;
      modeSort:Integer;

{$R *.dfm}
procedure TFormRepPodohByPerson.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

function TFormRepPodohByPerson.getPodrModeName: String;
begin
     case podrMode of
      0:
          getPodrModeName:='Все подразделения';
      1:
          getPodrModeName:='Университет';
      2:
          getPodrModeName:='Колледж';
      3:
          getPodrModeName:='Алчевск';
      4:
          getPodrModeName:='Северодонецк - СТИ';
      5:
          getPodrModeName:='Северодонецк - колледж';
      else
          getPodrModeName:='Неверный режим';

     end

end;
procedure TFormRepPodohByPerson.FormCreate(Sender: TObject);
begin
       modeSort:=0;
       podrMode:=0;
       cbpodrMode.ItemIndex:=0;
       BitBtn1.Enabled  := True;
       LabelFio.Caption := '';
       caption:='Детальный свод по подоходному налогу '+GetMonthRus(nmes)+ ' '+IntToStr(CURRYEAR)+' г.';
       Application.ProcessMessages;
end;

procedure TFormRepPodohByPerson.BitBtn1Click(Sender: TObject);
begin
     podrMode:=cbpodrMode.ItemIndex;
     if ((podrMode<0) or (podrMode>5)) then
        podrMode:=0;
     caption:=Trim(Caption)+getPodrModeName;
     BitBtn1.Enabled  := false;
     Application.ProcessMessages;
     CreateReport;
end;
function compare(Item1:Pointer;Item2:pointer):Integer;
 var retVal:Integer;
 begin
      if (modeSort=0) then
         retVal:=AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio)
      else
         begin
              if pRec(Item1).tabno>pRec(Item2).tabno then retVal:=1
              else
              if pRec(Item1).tabno<pRec(Item2).tabno then retVal:=-1
              else
                retVal := 0; //AnsiCompareText(pRec(Item1).fio,pRec(Item2).fio);
         end;
      compare:=retVal;
 end;

procedure TFormRepPodohByPerson.CreateReport;
  var savNMES,savNSRV:integer;
      iNSRV,i,j:Integer;
      curr_person:PERSON_PTR;
    function isInForbiddenPodr(shifrPod:integer):Boolean;
       var retVal:Boolean;
           i:Integer;
       begin
            retVal:=False;
            if podrMode=0 then
            else
            if ((podrMode=1) and not (IsUniversitetPodr(shifrPod))) then
               retVal:=True
            else
            if ((podrMode=2) and not (IsColedgPodr(shifrPod))) then
               retVal:=True
            else
            if ((podrMode=3) and not (IsAlchevskPodr(shifrPod))) then
               retVal:=True
            else
            if ((podrMode=4) and not (IsSeverodonetskPodr(shifrPod))) then
               retVal:=True
            else
            if ((podrMode=5) and not (IsSeverodonetskColedgPodr(shifrPod))) then
               retVal:=True;
            isInForbiddenPodr:=retVal;
       end;

  begin
       savNMES:=NMES;
       savNSRV:=NSRV;
       EMPTY_ALL_PERSON;
       list:=TList.Create;
       ProgressBar1.Min  := 0;
       ProgressBar1.Max  := Count_Serv;
       ProgressBar1.Step := 1;
       for iNSRV:=1 to Count_Serv do
          begin
             NSRV:=iNSRV;
             MKFLNM;
             ProgressBar1.StepIt;
             Application.ProcessMessages;
//             if IsColedgPodr(NSRV) then continue;
             if isInForbiddenPodr(NSRV) then Continue;
             if not fileexists(FNINF) then Continue;
             LabelFio.Caption:=Name_Serv(NSRV);
             Application.ProcessMessages;
             getinf(false);
             curr_person:=HEAD_PERSON;
             while (curr_person<>nil) do
                begin
                     putPersonToList(Curr_person);
                     curr_person:=curr_person^.NEXT;
                end;
             EMPTY_ALL_PERSON;
          end;
       Application.ProcessMessages;
       list.Sort(@Compare);
       try
          E:=CreateOleObject('Excel.Application');
       except
          ShowMessage('Ошибка запуска Excel');
          Exit;
       end;
       E.WorkBooks.add;
       E.Visible:=true;
       reportToExcel;
       list.Free;
       list:=nil;
       NMES:=savNMES;
       NSRV:=savNSRV;
       MKFLNM;
       getinf(true);
       ShowMessage('Свод создан.');
       Self.Close;
  end;
procedure TFormRepPodohByPerson.putPersonToList(curr_person:person_ptr);
  var rec:pRec;
      i:integer;
      curr_add:ADD_PTR;
      curr_ud:UD_PTR;
      finded:Boolean;
      summaAdd,summaPodFakt:real;
     begin
          finded:=False;
          summaAdd:=0.00;
          summaPodFakt:=0.00;
          curr_add:=curr_person^.ADD;
          while (curr_add<>nil) do
            begin
                 if ShifrList.IsPodoh(curr_add^.shifr) then
                    summaAdd:=summaAdd+curr_add^.SUMMA;
                 curr_add:=curr_Add^.NEXT;
            end;
          curr_ud:=curr_person^.uD;
          while (curr_ud<>nil) do
            begin
                 if curr_ud^.shifr=podoh_shifr then
                    summaPodFakt:=summaPodFakt+curr_ud^.SUMMA;
                 curr_ud:=curr_ud^.NEXT;
            end;
          if ((Abs(summaAdd)<0.01) or (Abs(summaPodFakt)<0.01)) then
             Exit;
          if list.count>0 then
             for i:=0 to list.Count-1 do
                 if pRec(List.Items[i])^.tabno=curr_person^.tabno then
                    begin
                         finded:=True;
                         rec:=pRec(list.Items[i]);
                         Break;
                    end;

          if not finded then
             begin
                 New(rec);
                 fillChar(rec^,SizeOf(rec^),0);
                 rec.tabno    := curr_person^.tabno;
                 rec.fio      := curr_person^.FIO;
                 list.Add(rec);
             end;
          rec.summaAdd:=rec.summaAdd+summaAdd;
          rec.SummaPodFakt:=rec.SummaPodFakt+summaPodFakt;
          rec.SummaPodRas:=R10(rec.summaAdd*0.13);
          rec.SummaPodRazn:=rec.SummaPodRas-rec.SummaPodFakt;
     end;
procedure TFormRepPodohByPerson.reportToExcel;

var
    S:String;
    k,i:integer;
    exRow:integer;
    h:string;
    wbs:variant;
    Rec:pRec;
    currRow:Integer;
    R10_Podoh_summa,r:Real;
begin
     Application.ProcessMessages;
     wbs:=E.WorkBooks[1].WorkSheets[1];
     h:=getPodrModeName;
     wbs.Cells[3,1] := h;
     currRow:=5;
     ProgressBar1.Min  := 0;
     ProgressBar1.Max  := list.Count;
     ProgressBar1.Step := 1;
     ProgressBar1.Position:=0;
     LabelFio.Caption:='0/'+IntToStr(ProgressBar1.Max);
     Application.ProcessMessages;
     wbs.Cells[currRow,1]  := 'Т.н.';
     wbs.Cells[currRow,2]  := 'ФИО';
     wbs.Cells[currRow,3].Value := 'Начислено';
     wbs.Cells[currRow,4].Value := 'Удержано';
     wbs.Cells[currRow,5].Value := ' 13%';
     wbs.Cells[currRow,6].Value := 'Разница';
     for k:=0 to list.Count-1 do
        begin
             ProgressBar1.StepIt;
             LabelFio.Caption:=IntToStr(k+1)+'/'+IntToStr(ProgressBar1.Max);
             Application.ProcessMessages;

             rec:=pRec(list.Items[k]);
             Inc(currRow);
             wbs.Cells[currRow,1].Value := Rec^.tabno;
             wbs.Cells[currRow,2]  := Rec^.FIO;
             wbs.Cells[currRow,3].Value := Rec^.summaAdd;
             wbs.Cells[currRow,4].Value := Rec^.summaPodFakt;
             if rec^.tabno=6516 then
                h:=' ';
             R10_Podoh_Summa:=R10_PODOH(Rec^.summaPodFakt);
             r:=abs(Abs(Rec^.summaPodFakt)-Abs(R10_Podoh_Summa));
             if r>0.009 then
                begin
                     wbs.Cells[currRow,4].font.color:=clWhite;
                     wbs.Cells[currRow,4].Interior.color:=clRed;
                end;
             wbs.Cells[currRow,5].Value := Rec^.summaPodRas;
             wbs.Cells[currRow,6].Value := Rec^.summaPodRazn;
             if Abs(Rec^.summaPodRazn)>0.50 then
                begin
                     wbs.Cells[currRow,6].font.color:=clWhite;
                     wbs.Cells[currRow,6].Interior.color:=clRed;
                end;
        end;
end;

end.
