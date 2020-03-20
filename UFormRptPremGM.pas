unit UFormRptPremGM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalc, frxExportXLS, frxExportPDF, frxExportHTML, frxExportRTF;

type
  TFormRptPremGM = class(TForm)
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
    function eraseCodeDolg(src:string):string;
    procedure fillDolg;
  public
    { Public declarations }
  end;

var
  FormRptPremGM : TFormRptPremGM;
  CntFormWantedAdd : integer;

implementation
  uses ScrIo , ScrDef , ScrUtil,ComObj,ScrLists, UFormSelPKG;

  type  PRecAddl=^TRecAddl;
        TRecAddL = record
                 tabno   : integer;
                 fio     : string;
                 dolg    : string;
                 shifrdol : integer;
                 dbDolg  :string;
                 w_place : integer;
                 name_place : string;
                 period  : integer;
                 year    : integer;
                 summa   : real;
                end;

  var List:TList;
      i_count:integer;
{$R *.dfm}

procedure TFormRptPremGM.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormWantedAdd>0 then
         Dec(CntFormWantedAdd);
end;

procedure TFormRptPremGM.FormCreate(Sender: TObject);
begin
      Inc(CntFormWantedAdd) ;
      WantedShifrSta := 0   ;
      WantedPeriod   := 0   ;
end;

procedure TFormRptPremGM.Button1Click(Sender: TObject);
begin
     makeReport;
end;


procedure TFormRptPremGM.MakeReport(mode:integer=0);
 var savnmes,savnsrv:integer;
     i_nsrv,i    : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_ptr;
     RecAddl     : PRecAddl;
     shifrDol    : integer;
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
//                                     if (i>-1) then
//                                        PRecAddl(List.Items[i])^.Summa:=PRecAddl(List.Items[i])^.Summa+Curr_Add^.Summa
//                                     else
                                        begin
                                             shifrDol:=0;
                                             shifrDol:=GET_DOL_CODE(curr_person);
                                             if (shifrDol<10) then
                                                shifrDol:=0;
                                             New(RecAddl);
                                             fillChar(RecAddl^,sizeOf(RecAddl^),0);
                                             RecAddl^.tabno   := Curr_Person^.TABNO;
                                             if RecAddl^.tabno=3719 then
                                                shifrDol:=shifrdol;
                                             if isSVDN then
                                                RecAddl^.fio := GetFullUkrFioPerson(Curr_Person^.tabno)
                                             else
                                                RecAddl^.fio := GetFullRusFioPerson(Curr_Person^.tabno);
             //                                RecAddl^.Dolg    := Curr_Person^.Dolg;
                                             recAddl^.dolg    :=  trim(NAME_DOLG_BY_SHIFR(GET_DOL_CODE(curr_person)));
                                             RecAddl^.w_place := NSRV;
                                             RecAddl^.name_place := trim(name_serv(nsrv));
                                             RecAddl^.summa   := Curr_Add^.SUMMA;
                                             RecAddl^.Period  := WantedPeriod;
                                             RecAddl^.Year    := Curr_Add^.Year+1990;
                                             RecAddl^.shifrdol := shifrDol ;
                                             recAddl^.dbDolg  := '';
                                             if shifrDol>0 then
                                                begin
                                                    recAddL.dbDolg:=eraseCodeDolg(trim(NAME_DOLG_BY_SHIFR(shifrdol)));
                                                end;
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
             nsrv    := savnsrv;
             nmes    := savnmes;

             fillDolg;
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

procedure TFormRptPremGM.frxUserDataSetAddlFirst(Sender: TObject);
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
procedure TFormRptPremGM.doOutputToExcel;
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
procedure TFormRptPremGM.frxUserDataSetAddlNext(Sender: TObject);
begin
      inc(i_count);
end;

procedure TFormRptPremGM.frxUserDataSetAddlGetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'tabno')=0 then
        Value:=PRecAddL(List.Items[i_count])^.tabno
     else if CompareText(VarName,'fio')=0 then
             Value:=PRecAddL(List.Items[i_count])^.fio
     else if CompareText(VarName,'dolg')=0 then
          if length(trim(PRecAddL(List.Items[i_count])^.dbdolg))>0 then
             value:=trim(PRecAddL(List.Items[i_count])^.dbdolg)
          else
             Value:=PRecAddL(List.Items[i_count])^.dolg
     else if CompareText(VarName,'w_place')=0 then
             Value:=PRecAddL(List.Items[i_count])^.name_place
//             Value:=PRecAddL(List.Items[i_count])^.w_place
     else if CompareText(VarName,'summa')=0 then
             Value:=format('%10.2f',[PRecAddL(List.Items[i_count])^.summa])
     else if CompareText(VarName,'period')=0 then
             Value:=PRecAddL(List.Items[i_count])^.period;
end;

procedure TFormRptPremGM.frxUserDataSetAddlCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=List.Count-1 then Eof:=true
      else eof:=false;
end;

procedure TFormRptPremGM.frxReportAddLGetValue(const VarName: String;
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
              if isSVDN then
                 Value:='за усi перiоди'
              else
                 Value:='за все периоды'
           else
              if isSVDN then
                 Value:='за '+GetMonthUkr(WantedPeriod)
              else
                 Value:='за '+GetMonthRus(WantedPeriod);
end;

procedure TFormRptPremGM.BitBtn2Click(Sender: TObject);
begin
      makeReport(1);
end;

procedure TFormRptPremGM.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;
procedure TFormRptPremGM.fillDolg;
  var i:integer;
      i_nsrv:integer;
      savnmes,savnsrv:integer;
      curr_person:person_ptr;
      finished:boolean;
    function done:boolean;
      var i:integer;
        finded:boolean;
     begin
        finded:=false;
        if list.count>0 then
           for i:=0 to list.Count-1 do
             if PRecAddl(list.items[i])^.shifrdol=0 then
                begin
                    finded:=true;
                    break;
                end;
         done:=not finded;
     end;
    function checkDolg(curr_person:person_ptr):boolean;
     var i:integer;
         finded:boolean;
         shifrDol:integer;
     begin
         finded:=false;
         if list.count>0 then
            for i:=0 to list.Count-1 do
                begin
                     if (pRecAddl(list.items[i])^.tabno=curr_person^.tabno) then
                     if pRecAddl(list.items[i])^.shifrdol=0 then
                        begin
                            shifrDol:=get_dol_code(curr_person);
                            if shifrdol>1 then
                               begin
                                   pRecAddl(list.items[i])^.shifrDol:=shifrDol;
                                   pRecAddl(list.items[i])^.dbDolg:=eraseCodeDolg(trim(NAME_DOLG_BY_SHIFR(shifrdol)));
                                   finded:=true;
                               end;
                        end;
                end;
         checkDolg:=finded;
     end;

begin
     if done then exit;
     savnmes := nmes;
     savnsrv := nsrv;
//     putinf;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     finished:=false;
     for i_nsrv:=1 to count_serv do
         begin
              ProgressBar1.Position:=i_nsrv;
              if not nameservlist.IsSelected(i_nsrv) then
                 continue;
              if i_nsrv in [11,81,82,102,121,140] then continue;
              nsrv:=i_nsrv;
              mkflnm;
              if not FileExists(fninf) then continue;
              getinf(true);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                      if (curr_person.wid_raboty=OSN_WID_RABOTY) and
                         (getSummaAddForPerson(curr_person)>10) then
                         begin
                         if curr_person.tabno=3719 then
                            finished:=false;
                              if checkDolg(curr_person) then
                                 if done then
                                    begin
                                         finished:=true;
                                         break;
                                    end;
                         end;
                     curr_person:=curr_person^.next;
                end;
              EMPTY_ALL_PERSON;
              if finished then break;
         end;
      if not done then
         begin
              ProgressBar1.Max:=Count_Serv;
              ProgressBar1.Min:=0;
              ProgressBar1.Position:=0;
              Application.ProcessMessages;
              finished:=false;
              for i_nsrv:=1 to count_serv do
                  begin
                       ProgressBar1.Position:=i_nsrv;
                       if not nameservlist.IsSelected(i_nsrv) then
                          continue;
                       if i_nsrv in [11,81,82,102,121,140] then continue;
                       nsrv:=i_nsrv;
                       mkflnm;
                       if not FileExists(fninf) then continue;
                       getinf(true);
                       curr_person:=head_person;
                       while (curr_Person<>NIl) do
                           begin
                                if (getSummaAddForPerson(curr_person)>10) then
                                   begin
                                       if curr_person.tabno=3719 then
                                          finished:=false;
                                       if checkDolg(curr_person) then
                                          if done then
                                             begin
                                                  finished:=true;
                                                  break;
                                             end;
                                   end;
                                curr_person:=curr_person^.next;
                           end;
                        EMPTY_ALL_PERSON;
                        if finished then break;
                end;
         end;
      nsrv:=savnsrv;
      nmes:=savnmes;
      mkflnm;
//      getinf(true);

end;

function TFormRptPremGM.eraseCodeDolg(src:string):string;
 var i,l:integer;
     s,ss:string;
 begin
      i:=0;
      s:=trim(src);
      l:=length(s);
      while (i<l) do
        begin
             inc(i);
             if s[i] in ['0','1','2','3','4','5','6','7','8','9'] then
                continue;
             ss:=trim(copy(s,i,l-1+1));
             s:=trim(ss);
             break;
        end;
     eraseCodeDolg:=s;
 end;
begin
  CntFormWantedAdd:=0;

end.
