unit UFormRptWantedAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalc, frxExportXLS, frxExportPDF, frxExportHTML, frxExportRTF;

type
  TFormRptWantedAdd = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    frxDotMatrixExportAddL: TfrxDotMatrixExport;
    ProgressBar1: TProgressBar;
    frxUserDataSetAddl: TfrxUserDataSet;
    frxXLSExportAddL: TfrxXLSExport;
    cxCalcEditSta: TcxCalcEdit;
    cxCalcEditPe: TcxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    frxReportAddL: TfrxReport;
    frxRTFExport1: TfrxRTFExport;
    frxHTMLExport1: TfrxHTMLExport;
    frxPDFExport1: TfrxPDFExport;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure frxUserDataSetAddlFirst(Sender: TObject);
    procedure frxUserDataSetAddlNext(Sender: TObject);
    procedure frxUserDataSetAddlGetValue(const VarName: String;
      var Value: Variant);
    procedure frxUserDataSetAddlCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxReportAddLGetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    WantedShifrSta : integer;
    WantedPeriod   : integer;
    SummaTot       : real;
    procedure MakeReport(mode:integer=0);
    procedure doOutputToExcel;
  public
    { Public declarations }
  end;

var
  FormRptWantedAdd : TFormRptWantedAdd;
  CntFormWantedAdd : integer;

implementation
  uses ScrIo , ScrDef , ScrUtil,ComObj,ScrLists, UFormSelPKG;

  type  PRecAddl=^TRecAddl;
        TRecAddL = record
                 tabno   : integer;
                 fio     : string;
                 dolg    : string;
                 w_place : integer;
                 period  : integer;
                 year    : integer;
                 summa   : real;
                end;

  var List:TList;
      i_count:integer;
{$R *.dfm}

procedure TFormRptWantedAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormWantedAdd>0 then
         Dec(CntFormWantedAdd);
end;

procedure TFormRptWantedAdd.FormCreate(Sender: TObject);
begin
      Inc(CntFormWantedAdd) ;
      WantedShifrSta := 0   ;
      WantedPeriod   := 0   ;
end;

procedure TFormRptWantedAdd.Button1Click(Sender: TObject);
begin
     makeReport;
end;


procedure TFormRptWantedAdd.MakeReport(mode:integer=0);
 var savnmes,savnsrv:integer;
     i_nsrv,i    : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_ptr;
     RecAddl     : PRecAddl;
  function InList(Period:integer;Tabno:integer):integer;
   var RetVal:boolean;
       i : integer;
   begin
       RetVal:=false;
       if List.Count>0 then
          begin
               for i:=0 to List.Count-1 do
                   if PRecAddl(List.Items[i])^.period = Period then
                   if PRecAddl(List.Items[i])^.tabno  = tabno  then
                      begin
                           RetVal:=true;
                           break;
                      end;
          end;
       if RetVal then
          InList:=i
       else
          InList:=-1;
   end;
begin
     if (nameservlist.CountSelected<1) then
        begin
             showMessage('Не указаны подразделения');
             exit;
        end;
     if (Kateglist.CountSelected<1) then
        begin
             showMessage('Не указаны категории сотрудников');
             exit;
        end;
     if (Gruppylist.CountSelected<1) then
        begin
             showMessage('Не указаны счета');
             exit;
        end;
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья');
             Exit;
        end;
     wantedShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                WantedShifrSta:=i;
                break;
            end;
     if WantedShifrSta<1 then
        begin
             ShowMessage('Указан неверный код начисления');
             Exit;
        end;

     WantedPeriod := round(cxCalcEditPe.Value);
     if not ((WantedPeriod>=0) and (WantedPeriod<13)) then
        begin
             ShowMessage('Неверно указан период');
             Exit;
        end;
//     WantedShifrSta := round(cxCalcEditSta.Value);
//     if (WantedShifrSta=0) then
//        begin
//             ShowMessage('Неверно указана статья');
//             Exit;
//        end;
     savnmes := nmes;
     savnsrv := nsrv;
     putinf;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     List:=TList.Create;
     for i_nsrv:=1 to count_serv do
         begin
              ProgressBar1.Position:=i_nsrv;
              if not nameservlist.IsSelected(i_nsrv) then
                 continue;
              nsrv:=i_nsrv;
              mkflnm;
              if not FileExists(fninf) then continue;
              getinf(true);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                     if not kateglist.IsSelected(curr_person.KATEGORIJA) then
                        begin
                             curr_person:=curr_person^.NEXT;
                             continue;
                        end;
                     if not Gruppylist.IsSelected(curr_person.Gruppa) then
                        begin
                             curr_person:=curr_person^.NEXT;
                             continue;
                        end;
                     Curr_Add:=Curr_Person^.Add;
                     while (Curr_Add<>Nil) do
                       begin
                            if (Curr_Add^.Shifr=WantedShifrSta) then
                            if ((WantedPeriod=0) or (WantedPeriod=Curr_Add^.Period)) then
                                begin
                                     i:=InList(WantedPeriod,Curr_Person^.TABNO);
                                     if (i>-1) then
                                        PRecAddl(List.Items[i])^.Summa:=PRecAddl(List.Items[i])^.Summa+Curr_Add^.Summa
                                     else
                                        begin
                                             New(RecAddl);
                                             RecAddl^.tabno   := Curr_Person^.TABNO;
                                             RecAddl^.fio     := Curr_Person^.FIO;
                                             RecAddl^.Dolg    := Curr_Person^.Dolg;
                                             RecAddl^.w_place := NSRV;
                                             RecAddl^.summa   := Curr_Add^.SUMMA;
                                             RecAddl^.Period  := WantedPeriod;
                                             RecAddl^.Year    := Curr_Add^.Year+1990;
                                             List.Add(RecAddl);
                                        end
                                end;
                            Curr_Add:=Curr_Add^.Next;
                       end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              EMPTY_ALL_PERSON;
         end;
     if List.Count>0 then
        begin
             // Test Excel
             if (mode=1) then doOutputToExcel
             else
                begin
         //    frxUserDataSetSl.RangeBegin := rbFirst;
         //    frxUserDataSetSl.RangeEnd   := rbLast;
                     summatot:=0;
                     for i_nsrv:=0 to List.Count-1 do
                         SummaTot:=SummaTot+r10(PRecAddl(List.Items[i_nsrv]).summa);
                     frxUserDataSetAddl.RangeEndCount := List.Count;
                     frxReportAddL.ShowReport;
                end;
        end;
     List.Free;
     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);
     Self.Close;
end;

procedure TFormRptWantedAdd.frxUserDataSetAddlFirst(Sender: TObject);
begin
      i_count:=0;
end;
    
function  compare(item1,item2:pointer):integer;
 begin
//      if PRecAddl(item1).fio>PRecAddl(item2).fio then return 1
//      else
//      if PRecAddl(item1).fio<PRecAddl(item2).fio then return -1
//      else return 0;
      Result := CompareText(PRecAddl(Item1).Fio, PRecAddl(Item2).Fio);


 end;
procedure TFormRptWantedAdd.doOutputToExcel;
 var E,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    i:integer;
 begin
    list.Sort(@compare);
    try
        E:=CreateOleObject('Excel.Application');
    except
        ShowMessage('Ошибка запуска Excel');
        Exit;
    end;
    E.WorkBooks.add;
    E.visible:=true;
    ExCol:=04;
    exRow:=8;
    for i:=1 to list.Count do
        begin
             inc(exRow);
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=i;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=PRecAddl(list.Items[i-1]).tabno;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=PRecAddl(list.Items[i-1]).Fio;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=PRecAddl(list.Items[i-1]).Dolg;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=PRecAddl(list.Items[i-1]).Summa;
        end

 end;
procedure TFormRptWantedAdd.frxUserDataSetAddlNext(Sender: TObject);
begin
      inc(i_count);
end;

procedure TFormRptWantedAdd.frxUserDataSetAddlGetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'tabno')=0 then
        Value:=PRecAddL(List.Items[i_count])^.tabno
     else if CompareText(VarName,'fio')=0 then
             Value:=PRecAddL(List.Items[i_count])^.fio
     else if CompareText(VarName,'dolg')=0 then
             Value:=PRecAddL(List.Items[i_count])^.dolg
     else if CompareText(VarName,'w_place')=0 then
             Value:=PRecAddL(List.Items[i_count])^.w_place
     else if CompareText(VarName,'summa')=0 then
             Value:=format('%10.2f',[PRecAddL(List.Items[i_count])^.summa])
     else if CompareText(VarName,'period')=0 then
             Value:=PRecAddL(List.Items[i_count])^.period;
end;

procedure TFormRptWantedAdd.frxUserDataSetAddlCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=List.Count-1 then Eof:=true
      else eof:=false;
end;

procedure TFormRptWantedAdd.frxReportAddLGetValue(const VarName: String;
  var Value: Variant);
begin
      if CompareText(VarName,'month')=0 then
         Value:=GetMonthRus(nmes)
      else if CompareText(VarName,'year')=0 then
         Value:=CurrYear
      else if CompareText(VarName,'namesta')=0 then
         Value:=GetNameShifr(WantedShifrSta)
      else if CompareText(VarName,'summatot')=0 then
         Value:=format('%10.2f',[summatot])
      else if CompareText(VarName,'periodglo')=0 then
           if WantedPeriod=0 then
              Value:='за все периоды'
           else
              Value:='за '+GetMonthRus(WantedPeriod);
end;

procedure TFormRptWantedAdd.BitBtn2Click(Sender: TObject);
begin
      makeReport(1);
end;

procedure TFormRptWantedAdd.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;
begin
  CntFormWantedAdd:=0;

end.
