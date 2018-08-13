unit UFormImportFromKU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormImportFromKU = class(TForm)
    dpFr: TDateTimePicker;
    OpenDialog1: TOpenDialog;
    LabelFName: TLabel;
    BitBtnFile: TBitBtn;
    BitBtnExecute: TBitBtn;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnFileClick(Sender: TObject);
    procedure BitBtnExecuteClick(Sender: TObject);
  private
    { Private declarations }
    ExcelFileName:string;
    excelDirectory:string;
    wantedMonth:integer;
    wantedYear:integer;
    sheetNo:integer;
    podrNo:Integer;
    rowStart,rowEnd:integer;
    fioCol   : Integer;
    dolgCol  : Integer;
    okladCol : Integer;
    koefCol  : Integer;
    summaOklCol : Integer;
    innCol   : Integer;
    bankCol  : Integer;
    summaVyplCol: Integer;
    shifrWr  : Integer;
    shifrKat : Integer;
    shifrGru : Integer;
    shifrMOR : Integer;
    cntSheet : Integer;
    procedure moveVyplaty;
    procedure moveZP;
    procedure movePodr;
    function findTabno(FIO:string;inn:string;bankCount:string):integer;
    function StopExcel:boolean;
    procedure  getMonth;

  public
    { Public declarations }
  end;

var
  FormImportFromKU: TFormImportFromKU;

implementation
  uses scrdef,scrutil,scrnalog,comobj,UFibModule,dateUtils,SCrIo;
  var e:variant;
{$R *.dfm}

  type EParseException=class(Exception);

  type
      psummarec=^summarec;
      summarec=record
                shifr    : Integer;
                addud    : Integer;
                summacol : integer;
                proccol  : Integer;
             end;
  var  list:TList;

procedure TFormImportFromKU.FormCreate(Sender: TObject);
 var currdate:TDateTime;
begin
     currDate:=EncodeDate(2016,NMES,1);
     dpFr.date:=currDate;
     wantedMonth:=MonthOf(currDate);
     wantedYear:=yearOf(currDate);
end;

procedure TFormImportFromKU.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      action:=caFree;
end;

procedure TFormImportFromKU.BitBtnFileClick(Sender: TObject);
begin
       if OpenDialog1.Execute  then
          begin
               ExcelFileName:=OpenDialog1.FileName;
               LabelFName.Caption:=excelFileName;
               Application.ProcessMessages;
          end;
end;

procedure TFormImportFromKU.BitBtnExecuteClick(Sender: TObject);
begin
     Memo1.Clear;
     getMonth;
     Exit;
     if not fileexists(excelFileName) then
        begin
             showMessage('Отсутствует файл '+excelFileName);
        end;

     wantedMonth:=MonthOf(date);
     wantedYear:=yearOf(date);

     sheetNo:=3;
     rowStart:=7;
     rowEnd:=65;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.Visible:=True;
     E.WorkBooks.Open(ExcelFileName,0,True); //Только чтение
     moveVyplaty;
     stopExcel;
 //    e.close;
 //    e.free;

end;
procedure TFormImportFromKU.moveVyplaty;
 var i,i_row:integer;
     Fio:string;
     tabno:Integer;
     nalCode:string;
     bankCount:string;
     summa:Real;
     iErr:Integer;
     iVal:Integer;
     aVal:Real;
     s:string;
     recNmb:Integer;
     summaTot:Real;
   begin
        summaTot:=0;
        recNmb:=0;
        for i_row:=rowStart to rowEnd do
          begin
              s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,1];
              Val(s,iVal,iErr);
            //  if iErr>0 then break;
            //  if iVal<1 then Break;
              s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,fioCol];
              fio:=trim(s);
              if Length(Trim(fio))=0 then
                 continue;
              s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,innCol];
              nalCode:=trim(s);
              s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,bankCol];
              bankCount:=trim(s);
              s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,summaVyplCol];
              s:=trim(s);
              s:=ReplChar(s,',','.');
              val(s,aVal,iErr);
              if iErr>0 then break;
              summa:=aVal;
              if summa<0.01 then
                 Continue;
              tabno:=findTabno(Fio,nalCode,bankCount);
              inc(recNmb);
              summaTot:=summaTot+summa;

          end;
         Memo1.Lines.Add('0-Выплат - '+intToStr(recNmb)+' записей. На сумму +'+FormatFloatPoint(summaTot));
         Application.ProcessMessages;

   end;

procedure TFormImportFromKU.moveZP;
const np=6;
 const nr:array[1..np,1..3] of Integer=((183,8,1),
                                       (184,14,17),
                                       (185,20,33),
                                       (186,36,39),
                                       (187,42,47),
                                       (188,50,53));
 var i,i_row:integer;
     Fio:string;
     tabno:Integer;
     nalCode:string;
     bankCount:string;
     summa:Real;
     iErr:Integer;
     iVal:Integer;
     aVal:Real;
     s:string;
     recNmb:Integer;
     summaTot:Real;
     Dolg : string;
     Oklad : Real;
     summaOkl:Real;
     procSt,summaSt:Real;
     procZw,summaZw:Real;
     procVysl,summaVysl:Real;
     procZasl,summaZasl:Real;
     procVredn,summaVredn:Real;
     procSlogn,summaSlogn:Real;
     procPrest,summaPrest:Real;
     summaOtp,summaBol,summaBol_5,summaOzd,summaPochas,summaPere:Real;
     summaPod,summaProf,summaNach:Real;
     koef:Real;
     podrNo : Integer;
    procedure makeGKHPerson;
     var Curr_Person:PERSON_PTR;
     procedure makeUd(shifr:Integer;summa:Real);
      var
          curr_Ud:Ud_ptr;
      begin
           MAKE_UD(curr_Ud,curr_person);
           curr_ud^.shifr:=shifr;
           curr_ud^.summa:=summa;
           curr_ud^.period:=wantedMonth;
           curr_ud^.year := wantedYear-1990;

      end;
     procedure makeAdd(shifr:Integer;summa:Real);
      var
          curr_add:add_ptr;
      begin
           MAKE_ADD(curr_add,curr_person);
           curr_add^.shifr:=shifr;
           curr_add^.summa:=summa;
           curr_add^.fzp:=summa;
           curr_add^.period:=wantedMonth;
           curr_add^.year := wantedYear-1990;

      end;
     procedure makeNadb(shifr:Integer;proc,summa:Real);
      var curr_cn:CN_PTR;
      begin
           MAKE_CN(curr_cn,curr_person);
           curr_cn^.SHIFR:=shifr;
           curr_cn^.KOD:=2;
           curr_cn^.SUMMA:=proc;
           makeAdd(shifr,summa);
      end;
     begin
          MAKE_PERSON(Curr_Person);
          curr_person^.TABNO:=tabno;
          curr_person^.FIO  := SHORT_FIO(fio);
          curr_person^.DOLG := Copy(Trim(dolg)+space(10),1,10);
          curr_person^.OKLAD := Oklad;
          curr_person^.WID_RABOTY := shifrWr;
          MAKE_KOEF_OKLAD_PERSON(Curr_Person,koef);
          if summaProf>0.01 then
             curr_person^.PROFSOJUZ:=1;
          if procSt>0.001 then
             makeNadb(ZA_STEP_SHIFR,procSt,summaSt);
          if procZw>0.001 then
             makeNadb(ZA_ZWAN_SHIFR,procZw,summaZw);
          if procZasl>0.001 then
             makeNadb(ZA_ZASL_PROF_SHIFR,procZasl,summaZasl);
          if procVredn>0.001 then
             makeNadb(NADBAWKA_SHIFR,procVredn,summaVredn);
          if procSlogn>0.001 then
             makeNadb(NADBAWKA_SHIFR,procSlogn,summaSlogn);
          if procPrest>0.001 then
             makeNadb(NADBAWKA_SHIFR,procPrest,summaPrest);
          if Abs(summaOzd)>0.01 then
             makeAdd(HOLIDAY_FLOW_SHIFR,summaOzd);
          if Abs(summaBol_5)>0.01 then
             makeAdd(BOL_5_SHIFR,summaBol_5);
          if Abs(summaBol)>0.01 then
             makeAdd(BOL_TEK_SHIFR,summaBol);
          if Abs(summaPere)>0.01 then
             makeAdd(PerersZaProshlPeriody,summaPere);
          if Abs(summaPochas)>0.01 then
             makeAdd(POCHAS_SHIFR,summaPochas);
          if Abs(summaProf)>0.01 then
             makeUd(PROF_SHIFR,summaProf);
          if Abs(summaPod)>0.01 then
             makeUd(PODOH_SHIFR,summaPod);
     end;
    function getRealValue(r:Integer;c:integer):Real;
      var s:string;
          retVal,aVal:Real;
          iErr:Integer;
      begin
          retVal := 0;
          aVal   := 0;
          s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,6];
          s:=trim(s);
          s:=ReplChar(s,',','.');
          val(s,aVal,iErr);
          if iErr=0 then
             retVal:=aVal;
          getRealValue:=retVal;

      end;
   begin
        sheetNo:=1;
        rowStart:=8;
        rowEnd:=53;
        summaTot:=0;
        recNmb:=0;
        for i_row:=rowStart to rowEnd do
          begin
               Oklad     := 0;
               summaOkl  := 0;
               procSt    := 0;
               summaSt   := 0;
               procZw    := 0;
               summaZw   := 0;
               procVysl  := 0;
               summaVysl := 0;
               procZasl  := 0;
               summaZasl := 0;
               procVredn := 0;
               summaVredn:= 0;
               procSlogn := 0;
               summaSlogn:= 0;
               procPrest := 0;
               summaPrest:= 0;

               summaOtp  := 0;
               summaOzd  := 0;
               summaBol  := 0;
               summaBol_5:=0;
               summaPochas:=0;
               summaPere := 0;
               summaNach := 0;
               summaProf := 0;
               summaPod  := 0;
               koef      := 0;
               nalCode   := '';
               bankCount := '';
               s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,1];
               Val(s,iVal,iErr);
            //  if iErr>0 then break;
            //  if iVal<1 then Break;
               s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,2];
               dolg:=trim(s);
               s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,3];
               fio:=trim(s);
               if Length(Trim(fio))=0 then
                 continue;
               oklad      := getRealValue(i_row,4);
               koef       := getRealValue(i_row,5);
               summaOkl   := getRealValue(i_row,6);
               procVysl   := getRealValue(i_row,7);
               summaVysl  := getRealValue(i_row,8);
               procSt     := getRealValue(i_row,11);
               summaSt    := getRealValue(i_row,12);
               procZw     := getRealValue(i_row,13);
               summaZw    := getRealValue(i_row,14);
               procZasl   := getRealValue(i_row,15);
               summaZasl  := getRealValue(i_row,16);
               procVredn  := getRealValue(i_row,17);
               summaVredn := getRealValue(i_row,18);
               procSlogn  := getRealValue(i_row,19);
               summaSlogn := getRealValue(i_row,20);
               procPrest  := getRealValue(i_row,21);
               summaPrest := getRealValue(i_row,22);
               summaOzd   := getRealValue(i_row,23);
               summaOtp   := getRealValue(i_row,24);
               summaBol_5 := getRealValue(i_row,25);
               summaBol   := getRealValue(i_row,26);
               summaPochas:= getRealValue(i_row,27);
               summaPere  := getRealValue(i_row,28);
               summaNach  := getRealValue(i_row,29);
               summaProf  := getRealValue(i_row,30);
               summaPod   := getRealValue(i_row,31);
               tabno:=findTabno(Fio,nalCode,bankCount);
               inc(recNmb);
               summaTot:=summaTot+summaNach;
               if Abs(summaNach)>0.1 then
                  makeGKHPerson;

          end;
         showMessage('Перенесено '+intToStr(recNmb)+' записей. На сумму +'+FormatFloatPoint(summaTot));

   end;

procedure TFormImportFromKU.movePodr;
 var i,i_row : integer;
     Fio     : string;
     tabno   : Integer;
     nalCode : string;
     bankCount : string;
     summa   : Real;
     iErr    : Integer;
     iVal    : Integer;
     aVal    : Real;
     s       : string;
     recNmb  : Integer;
     koef    : Real;
     proc    : Real;
     workCol : Integer;
     dolg    : string;
     oklad   : Real;
     saveNSRV : Integer;
     MOR     : Integer;
    function getRealValue(r:Integer;c:integer):Real;
      var s:string;
          retVal,aVal:Real;
          iErr:Integer;
      begin
          retVal := 0;
          aVal   := 0;
          if c>0 then
             s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[r,c]
          else
            s:='---';
          s:=trim(s);
          s:=ReplChar(s,',','.');
          val(s,aVal,iErr);
          if iErr=0 then
             retVal:=aVal;
          getRealValue:=retVal;

      end;

    procedure makeGKHPerson;
     var Curr_Person:PERSON_PTR;
         i_item   : Integer;
         razr     : Integer;
         summa1,summa2,summa3:Real;
         shifrDol : Integer;
     function getDolCodeFromSQL:integer;
      var SQLStmnt:WideString;
          retVal:integer;

          v:Variant;
      begin
           retVal:=0;
           SQLStmnt:='select first 1 prim from fcn cn';
           SQLStmnt:=SQLStmnt+' join person pe on cn.shifridperson=pe.shifrid ';
           SQLStmnt:=SQLStmnt+' where cn.shifrsta=600';
           SQLStmnt:=SQLStmnt+' and pe.tabno='+intToStr(Curr_Person^.tabno);
  //         SQLStmnt:=SQLStmnt+' and (select first 1 shifriddolg from pr_get_dolg_person_by_id(pe.shifrid))=:shifrdol
           SQLStmnt:=SQLStmnt+' and pe.w_r='+intToStr(curr_person^.WID_RABOTY);
           SQLStmnt:=SQLStmnt+' and pe.w_place='+intToStr(NSRV);
           SQLStmnt:=SQLStmnt+' and pe.shifrgru='+intToStr(curr_person^.GRUPPA);
           SQLStmnt:=SQLStmnt+' and pe.shifrkat='+intToStr(curr_person^.KATEGORIJA);
           SQLStmnt:=SQLStmnt+' and upper(trim(pe.dolg))=upper(trim('''+trim(curr_person^.dolg)+'''))';
           v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
           if VarIsNumeric(v) then
              retVal:=v;
           getDolCodeFromSQL:=retVal;
      end;


     function getUIDFromSQL(var summa1:Real;var summa2:Real;var summa3:Real):boolean;
      var SQLStmnt:WideString;
          retVal:boolean;

          v:Variant;
      begin
           retVal:=false;
           SQLStmnt:='select first 1 summa,flow_summa,limit_summa from fcn cn';
           SQLStmnt:=SQLStmnt+' join person pe on cn.shifridperson=pe.shifrid ';
           SQLStmnt:=SQLStmnt+' where cn.shifrsta=640';
           SQLStmnt:=SQLStmnt+' and pe.tabno='+intToStr(Curr_Person^.tabno);
  //         SQLStmnt:=SQLStmnt+' and (select first 1 shifriddolg from pr_get_dolg_person_by_id(pe.shifrid))=:shifrdol
           SQLStmnt:=SQLStmnt+' and pe.w_r='+intToStr(curr_person^.WID_RABOTY);
           SQLStmnt:=SQLStmnt+' and pe.w_place='+intToStr(NSRV);
           SQLStmnt:=SQLStmnt+' and pe.shifrgru='+intToStr(curr_person^.GRUPPA);
           SQLStmnt:=SQLStmnt+' and pe.shifrkat='+intToStr(curr_person^.KATEGORIJA);
           SQLStmnt:=SQLStmnt+' and upper(trim(pe.dolg))=upper(trim('''+trim(curr_person^.dolg)+'''))';
           v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
           if VarIsArray(v) then
              begin
                  if VarIsNumeric(v[0]) and
                     VarIsNumeric(v[1]) and
                     VarIsNumeric(v[2]) then
                     begin
                          summa1:=v[0];
                          summa2:=v[1];
                          summa3:=v[2];
                          retVal:=True;
                     end;
              end;
           getUIDFromSQL:=retVal;
      end;
     procedure addTo82;
      var TempHeadPerson : PERSON_PTR;
          tempNSRV       : Integer;
          saveSelect     : Integer;
          finded         : Boolean;
          W_P            : Integer;
          c_person       : PERSON_PTR;
          c_sowm         : sowm_ptr;
          i              : Integer;
 procedure Repair_Sowm(C_Person:Person_Ptr;W_P:integer;C:Integer);
  var Curr_Sowm:Sowm_Ptr;
      Done:boolean;
      i:integer;
  begin
       Done:=false;
       Curr_Sowm:=C_Person^.Sowm;
       while not Done do
        begin
             Done:=true;
             Curr_Sowm:=C_Person^.Sowm;
             while (Curr_Sowm<>Nil) do
              begin
                   if Curr_Sowm^.Where=W_P then
                      begin
                           Del_Sowm(Curr_Sowm,C_Person);
                           Done:=false;
                           break;
                      end;
                   Curr_Sowm:=Curr_Sowm^.NEXT;
              end;
        end;
       if C>0 then
          for i:=1 to C do
              begin
                   make_Sowm(Curr_Sowm,C_Person);
                   Curr_Sowm^.WHERE:=W_p;
              end;
  end;

      begin
           W_P            := 82;
           TempHeadPerson := Head_Person;
           TempNSRV       := NSRV;
           saveSelect     := SELECTED_FIELD;
           finded         := false;
           NSRV           := W_P;
           MKFLNM;
           i              := findFreeSelected;
           if not FileExists(fninf) then
              begin
                   Select(i);
                   MAKE_PERSON(c_person);
                   c_person^.TABNO := curr_person^.TABNO;
                   c_person^.FIO   := curr_person^.FIO;
                   MAKE_SOWM(c_sowm,c_person);
                   c_sowm^.WHERE:=tempNSRV;
                   PUTINF;
                   EMPTY_ALL_PERSON;
                   Select(saveSelect);
              end
           else
              begin
                   Select(i);
                   GETINF(TRUE);
                   c_person:=head_Person;
                   while (c_Person<>Nil) do
                     begin
                          if c_Person^.tabno=tabno then
                          if c_Person^.wid_raboty=1 then
                             begin
                                  Repair_Sowm(C_Person,W_P,1);
                                  finded:=True;
                                  break;
                             end;
                          c_person:=c_person^.Next;
                     end;
                   if not finded then
                      begin
                           MAKE_PERSON(c_person);
                           c_person^.TABNO := curr_person^.TABNO;
                           c_person^.FIO   := curr_person^.FIO;
                           MAKE_SOWM(c_sowm,c_person);
                           c_sowm^.WHERE:=tempNSRV;
                      end;
                   PUTINF;
                   EMPTY_ALL_PERSON;
                   Select(saveSelect);
              end;
           NSRV:=TempNSRV;
           MKFLNM;
      end;

     function getRazr(Oklad:Real):integer;
      var retVal:integer;
         SQLStmnt : string;
         v        : variant;
      begin
          retVal:=0;
          SQLStmnt:='select first 1 razr from tb_razr_proc where datefr=''2016-07-01'' and abs(abs(oklad) - abs('+FormatFloatPoint(Oklad)+'))<1.0';
          v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
          if VarIsNumeric(v) then
             begin
                   retVal:=v;
                   if not ((retVal>0) and (retVal<26)) then
                      retVal:=0;
             end;
          getRazr:=retVal;

      end;

     procedure makeUd(shifr:Integer;summa:Real);
      var
          curr_Ud:Ud_ptr;
      begin
           MAKE_UD(curr_Ud,curr_person);
           curr_ud^.shifr:=shifr;
           curr_ud^.summa:=summa;
           curr_ud^.period:=wantedMonth;
           curr_ud^.year := wantedYear-1990;

      end;
     procedure makeAdd(shifr:Integer;summa:Real);
      var
          curr_add:add_ptr;
      begin
           MAKE_ADD(curr_add,curr_person);
           curr_add^.shifr  := shifr;
           curr_add^.summa  := summa;
           curr_add^.fzp    := summa;
           curr_add^.period := wantedMonth;
           curr_add^.year   := wantedYear-1990;

      end;
     procedure makeNadb(shifr:Integer;proc,summa:Real);
      var curr_cn:CN_PTR;
      begin
           MAKE_CN(curr_cn,curr_person);
           curr_cn^.SHIFR := shifr;
           curr_cn^.KOD   := 2;
           curr_cn^.SUMMA := proc;
           makeAdd(shifr,summa);
      end;
     begin
          MAKE_PERSON(Curr_Person);
          curr_person^.TABNO      := tabno;
          curr_person^.FIO        := SHORT_FIO(fio);
          curr_person^.DOLG       := Copy(Trim(dolg)+space(10),1,10);
          curr_person^.GRUPPA     := shifrGru;
          curr_person^.KATEGORIJA := shifrKat;
          curr_person^.wid_raboty := shifrWR;
          if shifrWr=2 then
             begin
                  if shifrMOR=1 then
                     MOR:=NSRV
                  else
                     MOR:=shifrMOR;
                  if shifrMOR>=1 then
                     if shifrMOR=82 then
                        addTo82
                     else
                        SetUpSowm(Curr_person^.Tabno,MOR);
                  if shifrMOR<>82 then
                     PUT_SWM_MODE_TO_PERSON(Curr_Person,2)
                  else
                     PUT_SWM_MODE_TO_PERSON(Curr_Person,MOR);
             end;
          if shifrMOR>1 then
             curr_person^.MESTO_OSN_RABOTY := shifrMOR;
          if koef>0.01 then
             MAKE_KOEF_OKLAD_PERSON(Curr_Person,koef);
          if oklad>0.01 then
             curr_person^.OKLAD := r10(Oklad*koef);
          razr:=getRazr(Oklad);
          if razr>0 then
             SetRazrjadPerson(Curr_Person,razr);
          if NMES<>9 then
             begin
                  if getUIDFromSQL(summa1,summa2,summa3) then
                     begin
                          putGUIDToPerson(Curr_Person,summa1,summa2,summa3);
                     end;
                   if NSRV=81 then
                      shifrDol:=6
                   else
                      shifrDol:=getDolCodeFromSQL;
                   if shifrDol>0 then
                      MAKE_DOL_PERSON(Curr_Person,shifrDol);
             end;
          if list.Count>0 then
             begin
                  for i_item:=0 to list.Count-1 do
                      if (pSummaRec(list.Items[i_item]).proccol>0) then
                         begin
                              workCol := pSummaRec(list.Items[i_item]).proccol;
                              if workCol>1000 then
                                 proc:=workCol-1000
                              else
                                 proc    := getRealValue(i_row,workCol);
                              if ((proc>0.01) and (proc<0.999)) then
                                 proc := proc * 100;
                              workCol := pSummaRec(list.Items[i_item]).summacol;
                              summa   := getRealValue(i_row,workCol);
                              if summa>0.01 then
                                 makeNadb(pSummaRec(list.Items[i_item]).shifr,
                                          proc, summa);
                         end
                      else
                         begin
                              workCol := pSummaRec(list.Items[i_item]).summacol;
                              summa   := getRealValue(i_row,workCol);
                              if summa>0.01 then
                                 if pSummaRec(list.Items[i_item]).addud=1 then
                                    makeAdd(pSummaRec(list.Items[i_item]).shifr,summa)
                                 else
                                    makeUd(pSummaRec(list.Items[i_item]).shifr,summa);
                         end
             end;
     end;
   begin
        saveNSRV:=NSRV;
        EMPTY_ALL_PERSON;
        NSRV:=podrNo;
        MKFLNM;
        if fileexists(fninf) then
           GETINF(true);

        recNmb:=0;
        for i_row:=rowStart to rowEnd do
          begin
               Oklad     := 0;
               koef      := 0;
               nalCode   := '';
               bankCount := '';
               s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,dolgCol];
               dolg:=trim(s);
               s:=E.WorkBooks[1].WorkSheets[sheetNo].Cells[i_row,fioCol];
               fio:=trim(s);
               if Length(Trim(fio))=0 then
                 continue;
               if okladCol>0 then
                  oklad      := getRealValue(i_row,okladCol)
               else
                  oklad := 0;
               if koefCol>0 then
                  koef       := getRealValue(i_row,koefCol)
               else
                  koef:=0;
               tabno:=findTabno(Fio,nalCode,bankCount);
               inc(recNmb);
               makeGKHPerson;

          end;
        PUTINF;
        NSRV:=saveNSRV;
        MKFLNM;
        if FileExists(fninf) then
           getInf(true);
        Memo1.Lines.Add('Страница '+intToStr(sheetNo)+' Подр '+IntToStr(podrNo)+' Перенесено '+intToStr(recNmb)+' записей.');

   end;


function TFormImportFromKU.findTabno(FIO:string;inn:string;bankCount:string):integer;
  var SQLStmnt:string;
      S:string;
      v:Variant;
      retVal:Integer;
  begin
       retVal:=0;
       S:=Trim(fio);
       SQLStmnt:='select tabno from kadry a where upper(trim(a.pib))=UPPER('''+S+''')';
       v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
       if VarIsNumeric(v) then
          retVal:=v
       else
          begin
               SQLStmnt:='select max(tabno) from kadry';
               v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
               retVal:=v;
               if retVal<17000 then
                  retVal:=17000;
               inc(retVal);
               SQLStmnt:='insert into kadry (tabno,pib,fio,nal_code,bank_count) values('+intToStr(retVal)+','''+S+''','''+S+''','''+trim(inn)+''','''+bankCount+''')';
               FIB.pFIBDatabaseSal.Execute(SQLStmnt);
          end;
       SQLStmnt:='update kadry set mesto_r=''gkh'' where tabno='+intToStr(retVal);
       FIB.pFIBDatabaseSal.Execute(SQLStmnt);
       findTabno:=retVal;
  end;
function TFormImportFromKU.StopExcel:boolean;
begin
  try
    if E.Visible then E.Visible:=false;
    E.DisplayAlerts := False;
    E.Quit;
    E:=Unassigned;
    Result:=True;
  except
    Result:=false;
  end;
end;

procedure  TFormImportFromKU.getMonth;
 var dev:TextFile;
     fName:string;
     s:string;
     pRec:psummarec;
     cntproc,i_cnt,cntsumma,cntPodr:Integer;
     shifr , procCol,summaCol  : Integer;
     kindaddud:Integer;
     i_cntSheet : Integer;
     LineNo:Integer;
  function getLine():string;
    begin
          repeat
                if eof(dev) then
                   raise EParseException.Create('Конец файла');
                inc(LineNo);
                Readln(dev,s);
          until not ((Pos('//',s)>0) or (Length(Trim(s))<10));
          getLine:=s;
    end;
  function getString(key:string;var s:string):string;
    var retVal:string;
        i:integer;
    begin
         s:=upper_String(getLine());
         if Pos(Upper_String(key),s)=0 then
            raise EParseException.Create('Строка '+intToStr(lineno)+ '.Ошибка анализа строки '+s+' на ключ '+key);
         i:=Pos('=',s);
         if i=0 then
            raise EParseException.Create('Нет знака = в '+s);
         retVal:=Copy(s,i+1,Length(s));
         retVal:=Trim(retVal);
         if Length(retVal)=0 then
            raise EParseException.Create('Не задано значение в строке '+s);
         getString:=retVal;

    end;
  function getInt(key:string;s:string):integer;
    var retVal,iVal,iErr:integer;
        ss:string;
    begin
        ss:=getString(key,s);
        Val(ss,iVal,iErr);
        if iErr>0 then
           raise EParseException.Create('Ошибка числового значения в строке '+s);
        retVal:=iVal;
        getInt:=retVal;

    end;
 begin
     fName:=excelFileName;
     AssignFile(dev,fName);
     Reset(dev);
     LineNo:=0;
     try
   //    s:=getLine();
       try
          E:=CreateOleObject('Excel.Application');
       except
          ShowMessage('Ошибка запуска Excel');
          Exit;
       end;
       excelDirectory:=getString('excelDir',s);
       if not DirectoryExists(excelDirectory) then
          raise EParseException.Create('Каталог '+excelDirectory+' не существует.');
   //  1 - Выплаты и кадры
       excelFileName:=getString('excelFileName',s);
       if Pos('-----',excelFileName)=0 then
          begin
               sheetNo  := getInt('sheetNo',s);
               fioCol   := getInt('fioCol',s);
               innCol   := getInt('innCol',s);
               bankCol  := getInt('bankCol',s);
               summaVyplCol := getInt('summaCol',s);
               rowStart := getInt('rowStart',s);
               rowEnd   := getInt('rowEnd',s);

   //    E.Visible:=True;
               excelFileName:=excelDirectory+'\'+ExcelFileName;
               E.WorkBooks.Open(ExcelFileName,0,True); //Только чтение
               moveVyplaty;
               E.WorkBooks.Close;
          end;
   //    E.ActiveWorkbook.Close

   //  2 - Перенос зарплаты

       excelFileName:=getString('excelFileName',s);
       excelFileName:=excelDirectory+'\'+excelFileName;
       if not FileExists(excelFileName) then
          raise EParseException.Create('Каталог '+excelDirectory+' не существует.');
//       try
//          E:=CreateOleObject('Excel.Application');
//       except
//          ShowMessage('Ошибка запуска Excel');
//          Exit;
//       end;
//       E.Visible:=True;
       E.WorkBooks.Open(ExcelFileName,0,True); //Только чтение

       cntSheet  := getInt('cntSheet' , s);
       if cntSheet>0 then
       for i_cntSheet:=1 to cntSheet do
           begin

                sheetNo  := getInt('sheetNo' , s);
                fioCol   := getInt('fioCol'  , s);
                dolgCol  := getInt('dolgCol' , s);
                okladCol := getInt('okladCol', s);
                koefCol  := getInt('koefCol' , s);
                shifrWR  := getInt('shifrWR' , s);
                shifrMOR := getInt('shifrMOR', s);
  //     summaOklCol := getInt('summaOklCol',s);
                list:=TList.Create;
                cntProc := getInt('cntProc',s);
                if cntProc > 0 then
                for i_cnt:=1 to cntProc do
                    begin
                         shifr    := getInt('shifr',s);
                         procCol  := getInt('procCol',s);
                         summaCol := getInt('summaCol',s);
                         New(pRec);
                         pRec^.shifr    := shifr;
                         pRec^.summacol := summaCol;
                         pRec^.addud    := 1;
                         pRec^.proccol  := procCol;
                         list.Add(pRec);
                     end;
                cntSumma := getInt('cntSumma',s);
                if cntSumma > 0 then
                for i_cnt:=1 to cntSumma do
                    begin
                         shifr        := getInt('shifr',s);
                         kindaddud    := getInt('kindaddud',s);
                         summaCol     := getInt('summaCol',s);
                         New(pRec);
                         pRec^.shifr    := shifr;
                         pRec^.summacol := summaCol;
                         pRec^.addud    := kindaddud;
                         pRec^.proccol  := 0;
                         list.Add(pRec);
                    end;
                cntPodr:=getInt('cntPodr',s);
                for i_cnt:=1 to cntPodr do
                    begin
                         podrNo   := getInt('podrNo',s);
                         rowStart := getInt('rowStart',s);
                         rowEnd   := getInt('rowEnd',s);
                         shifrGru := getInt('shifrGru',s);
                         shifrKat := getInt('shifrKat',s);
                         movePodr;
                    end;
                if list.Count>0 then
                   for i_cnt:=0 to list.Count-1 do
                       Dispose(pSummaRec(list.items[i_cnt]));
                list.Free;
                list:=nil;
           end;
       if cntSheet>0 then
          Memo1.Lines.Add('*** Перенос закончен ***');

       stopExcel;

     except
        on e:EParseException do
           ShowMessage(e.Message);
     end;
     CloseFile(dev);

 end;

end.
