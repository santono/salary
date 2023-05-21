unit UFormToExcelKomend;

interface
                         

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  DB, FIBDataSet, pFIBDataSet, frxClass, frxDBSet, frxExportRTF,
  frxExportXLS, frxExportPDF, DBClient, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc;

type
  TFormToExcelKomend = class(TForm)
    rgMode: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    pFIBQuery1: TpFIBQuery;
    pfbtrnsctnRead: TpFIBTransaction;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dxCalcEdit1: TdxCalcEdit;
    Label1: TLabel;
    frxrprt1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dsRub: TpFIBDataSet;
    dsRubNPP: TFIBIntegerField;
    dsRubFIO: TFIBStringField;
    dsRubTABNO: TFIBIntegerField;
    dsRubSUMMA: TFIBBCDField;
    dsRubSUMMA_RUB: TFIBBCDField;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    frxrprt2: TfrxReport;
    cdsRub: TClientDataSet;
    cdsRubNPP: TIntegerField;
    cdsRubTABNO: TIntegerField;
    cdsRubFIO: TStringField;
    cdsRubSUMMA: TFloatField;
    cdsRubSUMMA_RUB: TFloatField;
    frxReportMem: TfrxReport;
    frxDBDatasetMem: TfrxDBDataset;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    frxReportDot: TfrxReport;
    cdsRubIDCODE: TStringField;
    cdsRubBANKCOUNT: TStringField;
    BitBtn12: TBitBtn;
    rgKassa: TRadioGroup;
    cxCalcEdit1: TcxCalcEdit;
    Label2: TLabel;
    cbVypl: TCheckBox;
    dsDolgi: TpFIBDataSet;
    trDolgi: TpFIBTransaction;
    Button1: TButton;
    dsDolgiTABNO: TFIBIntegerField;
    dsDolgiSUMMA: TFIBBCDField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dxCalcEdit1Validate(Sender: TObject; var ErrorText: String;
      var Accept: Boolean);
    procedure btn1Click(Sender: TObject);
    procedure frxrprt1GetValue(const VarName: String; var Value: Variant);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure frxrprt2GetValue(const VarName: String; var Value: Variant);
    procedure frxReportMemGetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure PrintDeponenty;
    procedure frxReportDotGetValue(const VarName: String;
      var Value: Variant);
    procedure Button1Click(Sender: TObject);

  private
    koefVypl:Real;
    SummaTotGrn     , SummaTotRub     : Double;
    SummaTotGrnS    , SummaTotRubS    : String;
    SummaTotGrnI    , SummaTotRubI    : integer;
    SummaTotGrnKopI , SummaTotRubKopI : integer;
    SummaTotGrnKopS , SummaTotRubKopS : string;
    DateFr,DateTo : TDate;
    DateFrS,DateToS,ds,ms : string;
    KoefVyplS:string;
    ShifrSta : Integer;
    RecordCount:Integer;
    uMode:Integer;
    VIPList:TList;
    kindVip:Integer;
    HatForDotReport : string;
    procHeight:double;
    procedure ListToExcelRub(Umode:integer);
    procedure PrepSummy(Umode:integer);
    procedure PlatToFR(uMode:integer;vip_mode:integer=0);
    procedure MarkPodr(uMode:integer);
    procedure MarkPodrInList(uMode:integer);
    procedure EmptyMarkPodr;
    procedure MakeCurrentPlat(uMode:Integer;wantedShifr:integer;VIPMode:integer);
    procedure initVIPList;
    function  inVIPList(tabno:integer;kind:integer=0):boolean;
    procedure setDetailHeight;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormToExcelKomend: TFormToExcelKomend;

implementation
  uses ScrDef,ComObj,ScrUtil,UFibModule,uFormWait,Math, DateUtils,ScrLists,
       UFormSelPKG,ScrIO, UFormDeponenty;

 type pRec=^trec;
      trec=record
            tabno:Integer;
            fio:string;
            summagrn:Real;
            summarub:Real;
           end;
      pVipRec=^tVipRec;
      tVipRec=record
               tabno : integer;
               kind  : integer;
              end;

   var dolgi1415Mode:boolean;
       yDolg:Integer;
       mDolg:Integer;


{$R *.dfm}

procedure TFormToExcelKomend.BitBtn1Click(Sender: TObject);
 var SQLStmnt : string;
     Mode     : Integer;
     LineNo   : Integer;
     CurrRow  : Integer;
     FName    : string;
     E        : Variant;
     LineH1   : string;
     LineH2   : string;
     LineH3   : string;
     v,WC     : Variant;
     Rec      : Integer;
     sc       : Integer;
     S        : string;
     aVal     : real;
     iErr     : Integer;
     i        : Integer;
begin
 //    s:=NumeralToPhrase(1345678,0);
     LineH1 :='Ведомость на получение зарплаты за '+GetMonthRus(Nmes)+' '+IntToStr(CURRYEAR)+' года';
     LineH2 :='Луганский университет имени Владимира Даля';
     LineH3 := '(профессорско-преподавательский состав)';
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

  //   ShifrSta:=103;
     FName:=TemplateDIR+'SwodKo.xlt';
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

     Mode:=rgMode.ItemIndex;
     Inc(Mode);
     if (Mode=6) then Mode:=12;
     if (Mode=7) then Mode:=13;
     case Mode of
      1: LineH3:='Ректорат';
      2: LineH3:='административно-управленческий персонал';
      3: LineH3:='профессорско-преподавательский состав';
      4: LineH3:='учебно вспомагательный персонал';
      5: LineH3:='административно-хозяйственная часть';
     12:
         begin
              LineH2 :='коледж луганского университета имени Владимира Даля';
              LineH3:='преподавательский состав';
         end;
     13:
         begin
              LineH2 :='коледж луганского университета имени Владимира Даля';
              LineH3 :='административно-хозяйственная часть';
         end;
     end;
     SQLStmnt := 'select count(*) from PR_LIST_KOMEND('+IntToStr(CurrYear)+','+IntToStr(NMES)+','+IntToStr(Mode)+','+IntToStr(ShifrSta)+')';
     FormWait.Show;
     v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     Rec:=v;
     sc:=0;
     ProgressBar1.Max:=Rec;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     SQLStmnt := 'select npp,fio,tabno,dolg,adres,pasp,summa from PR_LIST_KOMEND('+IntToStr(CurrYear)+','+IntToStr(NMES)+','+IntToStr(Mode)+','+IntToStr(ShifrSta)+') order by fio';
     pFIBQuery1.SQL.Clear;
     pFIBQuery1.SQL.Add(SQLSTmnt);
     pFIBQuery1.Transaction.StartTransaction;
     pFIBQuery1.ExecQuery;
     FormWait.Hide;
     LineNo :=0;
     CurrRow:=3;
     E.Visible:=true;
     E.WorkBooks.Open(FName);
     E.WorkBooks[1].WorkSheets[1].Cells[1,1]:=LineH1+chr(13)+chr(10)+LineH2+chr(13)+chr(10)+LineH3;
     while (not pFIBQuery1.Eof) do
       begin
            sc:=sc+1;
            ProgressBar1.Position:=sc;
            LabelPodr.Caption:=pFIBQuery1.Fields[1].AsString;
            Application.ProcessMessages;
            Inc(LineNo);
            Inc(CurrRow);
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1].Select;
            E.Selection.EntireRow.Insert;
            WC:=E.ActiveCell;

            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=LineNo;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=pFIBQuery1.Fields[1].AsString;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=pFIBQuery1.Fields[2].AsInteger;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:=pFIBQuery1.Fields[3].AsString;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=pFIBQuery1.Fields[4].AsString;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=pFIBQuery1.Fields[5].AsString;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7]:=pFIBQuery1.Fields[6].AsFloat;
            pFIBQuery1.Next;
       end;
     S:=E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+2,7];
     S:=StringReplace(S,',','.',[rfReplaceAll]);
     Val(s,aVal,iErr);
     if (iErr=0) then
        begin
             S:=NumeralToPhrase(aVal,0);
             E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+3,2]:=S;
        end;
     pFIBQuery1.Close;
     pFIBQuery1.Transaction.Commit;
end;

procedure TFormToExcelKomend.FormCreate(Sender: TObject);
var i:Integer;
begin
     yDolg:=2014;
     mDolg:=10;
     dolgi1415Mode:=false;
     rgMode.ItemIndex:=0;
     koefVypl:=1.00;
     dxCalcEdit1.Text:=Format('%6.2f' ,[KoefVypl]);
     for i:=1 to MAX_GRUPPA do
         CURR_GRUPPA[i]:=False;
     rgKassa.ItemIndex:=1;
     procHeight:=100;
     cxCalcEdit1.Value:=procHeight;
     cbVypl.Checked:=true;
end;

procedure TFormToExcelKomend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormToExcelKomend.BitBtn3Click(Sender: TObject);
var i:Integer;
begin
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

      ListToExcelRub(1);
end;


procedure TFormToExcelKomend.PrepSummy(Umode:integer);
 var SQLStmnt:string;
     Av,v:Variant;
     aVal:Real;
     iErr:Integer;
     koefRubS:String;
     koefRub:real;
     amnt:Integer;
 begin
     dxCalcEdit1.Text:=StringReplace(Trim(dxCalcEdit1.Text),',','.',[rfReplaceAll]);
     Val(Trim(dxCalcEdit1.Text),aVal,iErr);
     if iErr<>0 then koefVypl:=1
     else koefVypl:=aVal;
     if (koefVypl<0.01) or (koefVypl>1.001) then
         koefVypl:=1;
     KoefVyplS:=Format('%10.2f',[koefVypl]);
     KoefVyplS:=StringReplace(Trim(KoefVyplS),',','.',[rfReplaceAll]);
     koefrub:=2.0;
     if (CURRYEAR>2015) or
        ((CURRYEAR=2015) and (NMES>8)) then
        koefrub:=1.0;
     KoefRubS:=Format('%10.2f',[koefRub]);
     KoefRubS:=StringReplace(Trim(KoefRubS),',','.',[rfReplaceAll]);

//     ShifrSta:=103;
     if uMode<>-1 then
        SQLStmnt := 'select count(*),sum(summa),sum(summa_rub) from PR_LIST_KOMEND_RUB('+IntToStr(CurrYear)+','+IntToStr(NMES)+','+IntToStr(ShifrSta)+','+IntToStr(umode)+','+trim(koefVyplS)+','+trim(koefRubS)+')'
     else
        SQLStmnt := 'select count(*),sum(summa),sum(summa_rub) from PR_LIST_KOMEND_RUB_BY_PODR('+IntToStr(CurrYear)+','+IntToStr(NMES)+','+IntToStr(ShifrSta)+','+IntToStr(umode)+','+trim(koefVyplS)+',0'+','+trim(koefRubS)+')';
     FormWait.Show;
     application.processMessages;
     av:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
     FormWait.Hide;
     application.processMessages;
     v:=aV[0];
     recordCount:=v;
     if recordCount<1 then
        begin
             ShowMessage('Не было переводов на банк по статье '+intToStr(ShifrSta));
             Exit;
        end;
     summaTotGrn:=aV[1];
     summaTotRub:=aV[2];
     SummaTotGrnI:=Floor(summaTotGrn);
     SummaTotRubI:=Floor(summaTotRub);
     SummaTotGrnKopI:=Round((summaTotGrn-SummaTotGrnI)*100);
     SummaTotGrnKopS:=Trim(IntToStr(SummaTotGrnKopI));
     if SummaTotGrnKopS='0' then
        SummaTotGrnKopS:='00';
     SummaTotRubKopI:=Round((summaTotRub-SummaTotRubI)*100);;
     SummaTotRubKopS:=Trim(IntToStr(SummaTotRubKopI));
     if SummaTotRubKopS='0' then
        SummaTotRubKopS:='00';

     summaTotGrnS:=NumeralToPhrase(summaTotGrn,0,true);
     summaTotRubS:=NumeralToPhrase(summaTotRub,0,true);

     DateFr:=EncodeDate(CURRYEAR,NMES,1);
     DateTo:=EncodeDate(CURRYEAR,NMES,DaysInMonth(DateFr));
     ds:=IntToStr(DayOf(DateFr));
     if DayOf(DateFr)<10 then
        ds:='0'+ds;
     ms:=IntToStr(monthOf(DateFr));
     if monthOf(DateFr)<10 then
        ms:='0'+ms;

     DateFrS := ds+'.'+ms+'.'+intToStr(YearOf(DateFr));

     ds:=IntToStr(DayOf(DateTo));
     if DayOf(DateTo)<10 then
        ds:='0'+ds;
     ms:=IntToStr(monthOf(DateTo));
     if monthOf(DateTo)<10 then
        ms:='0'+ms;

     DateToS := ds+'.'+ms+'.'+intToStr(YearOf(DateTo));
     RecordCount:=v;
 end;
procedure TFormToExcelKomend.ListToExcelRub(Umode:integer);
 var SQLStmnt : string;
     LineNo   : Integer;
     CurrRow  : Integer;
     FName    : string;
     E        : Variant;
     WC     : Variant;
 //    av       : array[0..2] of Variant;
     Rec      : Integer;
     sc       : Integer;
     S        : string;
   //  aVal     : real;
   //  iErr     : Integer;
     CellFr,
     CellTo,
     RangeM   : variant;
begin
 //    s:=NumeralToPhrase(1345678,0);
  //   LineH1 :='Ведомость на получение зарплаты за '+GetMonthRus(Nmes)+' '+IntToStr(CURRYEAR)+' года';
 //    LineH2 :='Луганский университет имени Владимира Даля';
 //    LineH3 := '(профессорско-преподавательский состав)';
     FName:=TemplateDIR+'SwodKoRub.xlt';
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
     PrepSummy(umode);
     if RecordCount<1 then
        Exit;


  //   SQLStmnt := 'select count(*),sum(summa),sum(summa_rub) from PR_LIST_KOMEND_RUB('+IntToStr(CurrYear)+','+IntToStr(NMES)+','+IntToStr(ShifrSta)+','+IntToStr(umode)+','+trim(koefVyplS)+')';
  //   SQLStmnt := 'select count(*),sum(summa),sum(summa_rub) from PR_LIST_KOMEND_RUB_10('+IntToStr(CurrYear)+','+IntToStr(NMES)+','+IntToStr(ShifrSta)+','+IntToStr(umode)+','+trim(koefVyplS)+')';
  //   SQLStmnt := 'select count(*) from PR_LIST_KOMEND_RUB_10('+IntToStr(CurrYear)+','+IntToStr(NMES)+','+IntToStr(ShifrSta)+')';
(*
     FormWait.Show;
     application.processMessages;
 //    v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     av:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
     FormWait.Hide;
     application.processMessages;
     v:=aV[0];
     summaTotGrn:=aV[1];
     summaTotRub:=aV[2];
     SummaTotGrnI:=Floor(summaTotGrn);
     SummaTotRubI:=Floor(summaTotRub);
     SummaTotGrnKopI:=Round((summaTotGrn-SummaTotGrnI)*100);
     SummaTotGrnKopS:=Trim(IntToStr(SummaTotGrnKopI));
     if SummaTotGrnKopS='0' then
        SummaTotGrnKopS:='00';
     SummaTotRubKopI:=Round((summaTotRub-SummaTotRubI)*100);;
     SummaTotRubKopS:=Trim(IntToStr(SummaTotRubKopI));
     if SummaTotRubKopS='0' then
        SummaTotRubKopS:='00';

     summaTotGrnS:=NumeralToPhrase(summaTotGrn,0,true);
     summaTotRubS:=NumeralToPhrase(summaTotRub,0,true);

     DateFr:=EncodeDate(CURRYEAR,NMES,1);
     DateTo:=EncodeDate(CURRYEAR,NMES,DaysInMonth(DateFr));
     ds:=IntToStr(DayOf(DateFr));
     if DayOf(DateFr)<10 then
        ds:='0'+ds;
     ms:=IntToStr(monthOf(DateFr));
     if monthOf(DateFr)<10 then
        ms:='0'+ms;

     DateFrS := ds+'.'+ms+'.'+intToStr(YearOf(DateFr));

     ds:=IntToStr(DayOf(DateTo));
     if DayOf(DateTo)<10 then
        ds:='0'+ds;
     ms:=IntToStr(monthOf(DateTo));
     if monthOf(DateTo)<10 then
        ms:='0'+ms;

     DateToS := ds+'.'+ms+'.'+intToStr(YearOf(DateTo));
*)
     Rec:=RecordCount;
     sc:=0;
     ProgressBar1.Max:=Rec;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
 //    SQLStmnt := 'select npp,fio,tabno,summa,summa_rub from PR_LIST_KOMEND_RUB_10('+IntToStr(CurrYear)+','+IntToStr(NMES)+','+IntToStr(ShifrSta)+','+IntToStr(umode)+','+trim(koefVyplS)+') order by fio';
     SQLStmnt := 'select npp,fio,tabno,summa,summa_rub from PR_LIST_KOMEND_RUB('+IntToStr(CurrYear)+','+IntToStr(NMES)+','+IntToStr(ShifrSta)+','+IntToStr(umode)+','+trim(koefVyplS)+') order by fio';
     pFIBQuery1.SQL.Clear;
     pFIBQuery1.SQL.Add(SQLSTmnt);
     pFIBQuery1.Transaction.StartTransaction;
     pFIBQuery1.ExecQuery;
     FormWait.Hide;
     LineNo    :=    0 ;
     CurrRow   :=   37 ;
     E.Visible := false ;
     E.WorkBooks.Open(FName);
  //   E.WorkBooks[1].WorkSheets[1].Cells[1,1]:=LineH1+chr(13)+chr(10)+LineH2+chr(13)+chr(10)+LineH3;
     E.WorkBooks[1].WorkSheets[1].Cells[16,8]  := SummaTotRubS    ;
     E.WorkBooks[1].WorkSheets[1].Cells[18,56] := SummaTotRubKopS ;
     E.WorkBooks[1].WorkSheets[1].Cells[18,69] := SummaTotRubI    ;
     E.WorkBooks[1].WorkSheets[1].Cells[18,90] := SummaTotRubKopS ;
     E.WorkBooks[1].WorkSheets[1].Cells[20,8]  := SummaTotGrnS    ;
     E.WorkBooks[1].WorkSheets[1].Cells[22,56] := SummaTotGrnKopS ;
     E.WorkBooks[1].WorkSheets[1].Cells[22,69] := SummaTotGrnI    ;
     E.WorkBooks[1].WorkSheets[1].Cells[22,90] := SummaTotGrnKopS ;

     E.WorkBooks[1].WorkSheets[1].Cells[32,85]  := DateFrS ;
     E.WorkBooks[1].WorkSheets[1].Cells[32,101] := DateToS ;

     while (not pFIBQuery1.Eof) do
       begin
            sc:=sc+1;
            ProgressBar1.Position:=sc;
            LabelPodr.Caption:=pFIBQuery1.Fields[1].AsString;
            Application.ProcessMessages;
            Inc(LineNo);
            Inc(CurrRow);
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1].Select;
            E.Selection.EntireRow.Insert;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+1,1].Select;
            CellTo:=E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1];
            E.Selection.EntireRow.Copy(CellTo);
        //    CellFr:=E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+1,1];
    //        RangeM:=E.WorkBooks[1].WorkSheets[1].Range[CellFr,EmptyParam];
      //      CellTo:=E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+1,1];
           // E.WorkBooks[1].WorkSheets[1].Paste(RangeM,emptyParam,lcid);
  //             E.WorkBooks[1].WorkSheets[1].Range[
  //                  E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+1,1],
  //                  EmptyParam], EmptyParam, lcid);
       //     s:='A'+IntToStr(CurrRow+1)+':I'+IntToStr(CurrRow+1);
  //          E.Selection.EntireRow.Copy(E.WorkBooks[1].WorkSheets[1].Cells(CurrRow+1,1));
        //    E.WorkBooks[1].WorkSheets[1].Range[E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+1,1],E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+1,9]].Merge(true);
//            E.WorkBooks[1].WorkSheets[1].Range[S].Merge(true);
    //        E.WorkBooks[1].WorkSheets[1].Range[S,EmptyParam].Merge(true);
    //        if E.WorkBooks[1].WorkSheets[1].Range[S,EmptyParam].MergeCells then
    //           CurrRow:=CurrRow;
       //     E.Selection.Merge(false);

            WC:=E.ActiveCell;

            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=LineNo;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,10]:=pFIBQuery1.Fields[2].AsInteger;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,22]:=pFIBQuery1.Fields[1].AsString;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,58]:=pFIBQuery1.Fields[4].AsFloat;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,84]:=pFIBQuery1.Fields[3].AsFloat;
            pFIBQuery1.Next;
       end;
     E.Visible := true ;
{
     S:=E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+2,7];
     S:=StringReplace(S,',','.',[rfReplaceAll]);
     Val(s,aVal,iErr);
     if (iErr=0) then
        begin
             S:=NumeralToPhrase(aVal,0);
             E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+3,2]:=S;
        end;
}
     pFIBQuery1.Close;
     pFIBQuery1.Transaction.Commit;

end;

procedure TFormToExcelKomend.BitBtn4Click(Sender: TObject);
var i:Integer;
begin
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

     ListToExcelRub(2);
end;


procedure TFormToExcelKomend.dxCalcEdit1Validate(Sender: TObject;
  var ErrorText: String; var Accept: Boolean);
var aVal : Double;
    iErr : Integer;
    S    : string;

begin
     S := Trim(dxCalcEdit1.Text);
     S:=StringReplace(Trim(S),',','.',[rfReplaceAll]);
     Accept:= True;
     Val(S,aVal,iErr);
     if (iErr<>0) then
        begin
            Accept    := False;
            ErrorText := 'Неверный коэффициент выплаты '+dxCalcEdit1.Text;
            Exit;
        end;
     if not ((aVal>0.01) and (aVal<1.01)) then
        begin
            Accept    := False;
            ErrorText := 'Неверный коэффициент выплаты '+dxCalcEdit1.Text;
            Exit;
        end;

end;



procedure TFormToExcelKomend.PlatToFR(uMode:integer;vip_mode:integer=0);
var koefrub:Real;
begin
      Self.uMode:=uMode; 
      PrepSummy(uMode);
     if RecordCount<1 then
        Exit;

    //  if dsRub.Active then
    //     dsRub.Close;
    //  if dsRub.Transaction.Active then
   //      dsRub.Transaction.Commit;
//      shifrSta:=103;
      koefrub:=2.0;
      if (CURRYEAR>2015) or
         ((CURRYEAR=2015) and (NMES>8)) then
         koefrub:=1.0;
      dsRub.Transaction.StartTransaction;
      dsRub.Params[0].Value:=CURRYEAR;
      dsRub.Params[1].Value:=NMES;
      dsRub.Params[2].Value:=shifrSta;
      dsRub.Params[3].Value:=uMode;
      dsRub.Params[4].Value:=koefVypl;
      dsRub.Params[5].Value:=vip_mode;
      dsRub.Params[6].Value:=koefrub;
      dsRub.Open;
      if (CURRYEAR>2015) or
         ((CURRYEAR=2015) and (NMES>8)) then
          frxrprt2.ShowReport
      else
          frxrprt1.ShowReport;
      dsRub.Close;
      dsRub.Transaction.Commit;
      EmptyMarkPodr;
end;



procedure TFormToExcelKomend.btn1Click(Sender: TObject);
var i:Integer;
begin
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

      MarkPodr(1);
      PlatToFR(1,0);
end;


procedure TFormToExcelKomend.frxrprt1GetValue(const VarName: String;
  var Value: Variant);
  var i:Integer;
begin
     if CompareText(Trim(varName),'SUMMAPROPRUB')=0 then
        Value:=Trim(SummaTotRubS)
     else
     if CompareText(Trim(varName),'SUMMAPROPGRN')=0 then
        Value:=Trim(SummaTotGrnS)
     else
     if CompareText(Trim(varName),'SUMMARUB')=0 then
        Value:=IntToStr(SummaTotRubI)
     else
     if CompareText(Trim(varName),'SUMMAGRN')=0 then
        Value:=IntToStr(SummaTotGrnI)
     else
     if CompareText(Trim(varName),'SUMMARUBKOP')=0 then
        Value:=SummaTotRubKopS
     else
     if CompareText(Trim(varName),'SUMMAGRNKOP')=0 then
        Value:=SummaTotGrnKopS
     else
     if CompareText(Trim(varName),'DATEFRS')=0 then
        Value:=DateFrS
     else
     if CompareText(Trim(varName),'DATETOS')=0 then
        Value:=DateToS
     else
     if CompareText(Trim(varName),'NAMEPODR')=0 then
        if Self.uMode=2 then
           Value := 'колледж'
        else
        if Self.uMode=-1 then
           if NameServList.CountSelected=1 then
              for i:=1 to NameServList.Count do
                  begin
                      if NameServList.isSelected(i) then
                         begin
                             value:=Name_Serv(i);
                             Break;
                         end
                  end
           else
              value:=''
        else
           Value:='';
end;
procedure TFormToExcelKomend.MarkPodr(uMode:integer);
 var SqlStmnt:string;
     i:Integer;
 begin
      SQLStmnt:='delete from TB_TMP_SELECTED_RECVIZITY WHERE curr_con=current_connection';
      FIB.pFIBDatabaseSal.Execute(SQLStmnt);
      for i:=1 to Count_Serv do
          begin

               if (
                   ((uMode=2) and IsColedgPodr(i))
                   or
                   ((uMode=1) and not IsColedgPodr(i))
                   or
                   ((uMode=-1) and (NameServList.IsSelected(i)))
                  ) then
                  begin
                       SQLStmnt:='insert into TB_TMP_SELECTED_RECVIZITY (SHIFRTYP,SHIFRPOD) VALUES(1,'+intToStr(i)+')';
                       FIB.pFIBDatabaseSal.Execute(SQLStmnt);
                  end;
          end;
 end;

procedure TFormToExcelKomend.MarkPodrInList(uMode:integer);
 var
     i,j:Integer;
 begin
      if not ((uMode=1) or (uMode=2)) then Exit;
      for i:=1 to Count_Serv do
          begin
               if i=165 then
                  j:=165;
               if (
                   ((uMode=2) and IsColedgPodr(i))
                   or
                   ((uMode=1) and not IsColedgPodr(i))
                  ) then
                  begin
                       NameServList.SetSelected(i);
                  end;
          end;
 end;

procedure TFormToExcelKomend.EmptyMarkPodr;
 var SqlStmnt:string;

 begin
      SQLStmnt:='delete from TB_TMP_SELECTED_RECVIZITY WHERE curr_con=current_connection';
      FIB.pFIBDatabaseSal.Execute(SQLStmnt);
 end;

procedure TFormToExcelKomend.btn2Click(Sender: TObject);
var i:Integer;
begin
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

      markPodr(2);
      PlatToFR(2,0);
end;

procedure TFormToExcelKomend.btn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormToExcelKomend.btn4Click(Sender: TObject);
var i:Integer;
begin
      if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

      MarkPodr(-1);
      PlatToFR(-1,0);

end;

procedure TFormToExcelKomend.BitBtn5Click(Sender: TObject);
var i:Integer;
begin
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

      MarkPodr(1);
      PlatToFR(1,1);

end;

procedure TFormToExcelKomend.BitBtn6Click(Sender: TObject);
var i:Integer;
begin
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     if GruppyList.CountSelected<1 then
        begin
             ShowMessage('Не указаны счета');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;
      MarkPodr(1);
      PlatToFR(1,2);

end;

procedure TFormToExcelKomend.frxrprt2GetValue(const VarName: String;
  var Value: Variant);
  var i:Integer;
begin
     if CompareText(Trim(varName),'NAMEUNI')=0 then
        Value:=getNameUniFromSQL
     else
     if CompareText(Trim(varName),'SUMMAPROPRUB')=0 then
        Value:=Trim(SummaTotRubS)
     else
     if CompareText(Trim(varName),'SUMMARUB')=0 then
        Value:=IntToStr(SummaTotRubI)
     else
     if CompareText(Trim(varName),'SUMMARUBKOP')=0 then
        Value:=SummaTotRubKopS
     else
     if CompareText(Trim(varName),'DATEFRS')=0 then
        Value:=DateFrS
     else
     if CompareText(Trim(varName),'DATETOS')=0 then
        Value:=DateToS
     else
     if CompareText(Trim(varName),'NAMEPODR')=0 then
        if Self.uMode=2 then
           Value := 'колледж'
        else
        if Self.uMode=-1 then
           if NameServList.CountSelected=1 then
              for i:=1 to NameServList.Count do
                  begin
                      if NameServList.isSelected(i) then
                         begin
                             value:=Name_Serv(i);
                             Break;
                         end
                  end
           else
              value:=''
        else
           Value:='';
end;


function CompareFio(Item1, Item2: Pointer): Integer;
begin
  Result := CompareText(pRec(Item1).Fio, prec(Item2).fio);
end;
procedure TFormToExcelKomend.setDetailHeight;
var
    Memo1 : TfrxMemoView;
    B     : TfrxBand;
    i,j,koef : Extended;
begin
   // Memo73 74 75 76 77 86
    procHeight:=cxCalcEdit1.Value;
    if Abs(abs(procHeight)-100.00)<0.01 then
       Exit;
    if (procHeight<0.00001) then Exit;
    if (procHeight>4.00) then koef:=(procHeight / 100.00)
    else koef:=procHeight;
    B := frxReportMem.FindObject('MasterData1') as TfrxBand;
    j:=B.Height;
    j:=j*koef;
    B.Height:=j;
    Memo1 := frxReportMem.FindObject('Memo73') as TfrxMemoView;
    Memo1.Height:=j;
    Memo1 := frxReportMem.FindObject('Memo74') as TfrxMemoView;
    Memo1.Height:=j;
    Memo1 := frxReportMem.FindObject('Memo75') as TfrxMemoView;
    Memo1.Height:=j;
    Memo1 := frxReportMem.FindObject('Memo76') as TfrxMemoView;
    Memo1.Height:=j;
    Memo1 := frxReportMem.FindObject('Memo77') as TfrxMemoView;
    Memo1.Height:=j;
    Memo1 := frxReportMem.FindObject('Memo86') as TfrxMemoView;
    Memo1.Height:=j;
end;
procedure TFormToExcelKomend.MakeCurrentPlat(uMode:Integer;wantedShifr:integer;VIPMode:integer);
 var nmesTmp,nsrvTmp:Integer;
     i_nsrv      : Integer;
     Curr_Person : PERSON_PTR;
     Curr_Ud     : UD_PTR;
     list        : TList;
     i           : Integer;
     BankReason  : string;
     KoefVypl    : Real;
     KoefS       : string;
     modified    : boolean;
     fio         : string;  
     procedure AddToList;
       var rec:pRec;
           i:Integer;
           finded:Boolean;
       begin
           finded:=False;
           if list.count>0 then
              for i:=0 to list.Count-1 do
                  if pRec(list.Items[i])^.tabno=curr_person^.TABNO then
                     begin
                          pRec(list.Items[i])^.summagrn:=R10(pRec(list.Items[i])^.summagrn+Curr_Ud^.SUMMA);
                          pRec(list.Items[i])^.summarub:=R10(pRec(list.Items[i])^.summarub+Curr_Ud^.SUMMA);
                          finded:=True;
                          Break;
                     end;
           if not finded then
              begin
                   New(Rec);
                   Rec.tabno    := Curr_Person^.TABNO;
                   rec.summagrn := curr_ud^.SUMMA;
                   rec.summarub := curr_ud^.SUMMA;
                   list.add(Rec);
              end;

       end;
     procedure ExportToBankExcel(BankReason:STring);
       var FName:string;
           E,WC:Variant;
           sc,i:Integer;
           rec,lineno,currrow,currcol:Integer;
       begin //----------------------
           FName:=TemplateDIR+'Bank_Lnr.xlt';
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

           sc:=0;
           rec:=list.count;
           ProgressBar1.Max:=Rec;
           ProgressBar1.Min:=0;
           ProgressBar1.Position:=0;
           LineNo :=0;
           CurrRow:=4;
           E.Visible:=true;
           E.WorkBooks.Open(FName);
           for i:=0 to list.count-1 do
               begin
                    sc:=sc+1;
                    ProgressBar1.Position:=sc;
                    Application.ProcessMessages;
                    Inc(LineNo);
                    Inc(CurrRow);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1].Select;
                    E.Selection.EntireRow.Insert;
                    WC:=E.ActiveCell;

                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=LineNo;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=pRec(list.Items[i]).fio;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=getPersonInn(pRec(list.Items[i]).tabno);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:=getPersonBankCount(pRec(list.Items[i]).tabno);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=R10(pRec(list.Items[i]).summarub);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=BankReason;
              end;


       end;  //-----------------------
     procedure ExportToPSBBankExcel(RezStr:string);
       var FName:string;
           E,WC:Variant;
           sc,i:Integer;
           rec,currrow,currcol:Integer;
           FAM,NAM,OTC,SSumma:ShortString;
       begin //----------------------
           FName:=TemplateDIR+'PSB_Bank.xlt';
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

           sc:=0;
           rec:=list.count;
           ProgressBar1.Max:=Rec;
           ProgressBar1.Min:=0;
           ProgressBar1.Position:=0;
           CurrRow:=0;
           E.Visible:=true;
           E.WorkBooks.Open(FName);
           for i:=0 to list.count-1 do
               begin
                    sc:=sc+1;
                    ProgressBar1.Position:=sc;
                    Application.ProcessMessages;
                    Inc(CurrRow);
//                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1].Select;
//                    E.Selection.EntireRow.Insert;
//                    WC:=E.ActiveCell;
                    if rezStr='21' then
                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=GET_PSBBANK_COUNT_REZ(pRec(list.Items[i]).tabno)
                    else
                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=GET_PSBBANK_COUNT_NEREZ(pRec(list.Items[i]).tabno);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:='810';
                    SSumma:=trim(FormatFloatPoint(R10(pRec(list.Items[i]).summarub)));
                    SSumma:=''''+SSumma;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=SSumma;
                    SplitFIO(pRec(list.Items[i]).fio,Fam,Nam,OTC);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:=FAM;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=NAM;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=OTC;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7]:=RezStr;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,8]:=GET_PSBBANK_PASSPORT(pRec(list.Items[i]).tabno);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,9]:=pRec(list.Items[i]).tabno;
              end;


       end;  //-----------------------

     procedure ExportToBankForCardExcel(BankReason:STring);
       var FName:string;
           E,WC:Variant;
           sc,i:Integer;
           rec,lineno,currrow,currcol:Integer;
       begin //----------------------
           FName:=TemplateDIR+'Bank_Card_Lnr.xlt';
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

           sc:=0;
           rec:=list.count;
           ProgressBar1.Max:=Rec;
           ProgressBar1.Min:=0;
           ProgressBar1.Position:=0;
           LineNo :=0;
           CurrRow:=3;
           E.Visible:=true;
           E.WorkBooks.Open(FName);
           for i:=0 to list.count-1 do
               begin
                    sc:=sc+1;
                    ProgressBar1.Position:=sc;
                    Application.ProcessMessages;
                    Inc(LineNo);
                    Inc(CurrRow);
//                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1].Select;
//                    E.Selection.EntireRow.Insert;
//                    WC:=E.ActiveCell;

                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=LineNo;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=pRec(list.Items[i]).fio;
                //    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=getPersonInn(pRec(list.Items[i]).tabno);
                    if length(trim(getPersonBankCount(pRec(list.Items[i]).tabno)))>10 then
//                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=''''+getPersonBankCount(pRec(list.Items[i]).tabno)+'.643';
                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=''''+getPersonBankCount(pRec(list.Items[i]).tabno);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=R10(pRec(list.Items[i]).summarub);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:='RUR';
                    if length(trim(getPersonINN(pRec(list.Items[i]).tabno)))>0 then
                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=''''+getPersonINN(pRec(list.Items[i]).tabno)
                    else
                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:='''0000000000';
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=pRec(list.Items[i]).fio;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7]:=BankReason;
              end;


       end;  //-----------------------
     procedure ExportToBankForCardExcel2018(BankReason:STring);
       var FName : string;
           E,WC  : Variant;
           sc,i  : Integer;
           rec,lineno,currrow,currcol:Integer;
           dataS : string;
           currData:TDate;
           ds,ms,ys:String;
           summaTot:real;
       begin //----------------------
           FName:=TemplateDIR+'Bank_Card_Lnr_2018.xlt';
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

           sc:=0;
           rec:=list.count;
           ProgressBar1.Max:=Rec;
           ProgressBar1.Min:=0;
           ProgressBar1.Position:=0;
           LineNo    := 0;
           CurrRow   := 3;
           E.Visible := true;
           E.WorkBooks.Open(FName);
           currData := now();
           ds:=intToStr(dayOf(currData));
           if dayOf(currData)<10 then
              ds:='0'+ds;
           ms:=intToStr(monthOf(currData));
           if monthOf(currData)<10 then
              ms:='0'+ms;
           ys:=intToStr(yearOf(currData)-2000);
           DataS:=''''+ds+'.'+ms+'.'+ys;
           E.WorkBooks[1].WorkSheets[1].Cells[CurrRow-1,1]:=DataS;
           summaTot:=0;
           for i:=0 to list.count-1 do
               begin
//                    if i>5 then break;
                    sc:=sc+1;
                    ProgressBar1.Position:=sc;
                    Application.ProcessMessages;
                    Inc(LineNo);
                    Inc(CurrRow);
                    if i<list.Count-1 then
                       begin
                            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow+1,1].Select;
                            E.Selection.EntireRow.Insert;
                       end;

//                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1].Select;
//                    E.Selection.EntireRow.Insert;
//                    WC:=E.ActiveCell;

                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=LineNo;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=pRec(list.Items[i]).fio;
                //    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=getPersonInn(pRec(list.Items[i]).tabno);
                    if length(trim(getPersonBankCount(pRec(list.Items[i]).tabno)))>10 then
//                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=''''+getPersonBankCount(pRec(list.Items[i]).tabno)+'.643';
                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=''''+getPersonBankCount(pRec(list.Items[i]).tabno);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=R10(pRec(list.Items[i]).summarub);
                    summaTot:=summaTot+r10(pRec(list.Items[i]).summarub);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:='RUR';
                    if length(trim(getPersonINN(pRec(list.Items[i]).tabno)))>0 then
                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=''''+getPersonINN(pRec(list.Items[i]).tabno)
                    else
                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:='''0000000000';
//                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=pRec(list.Items[i]).fio;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7]:=BankReason;
              end;
            E.WorkBooks[1].WorkSheets[1].Cells[2,5]:=summaTot;

       end;  //-----------------------
 procedure FillListFromSalDb;
   var tabno:Integer;
       summa:Real;
       i:integer;
     procedure AddToList(tabno:Integer;summa:real);
       var rec:pRec;
           i:Integer;
           finded:Boolean;
       begin
           finded:=False;
           if list.count>0 then
              for i:=0 to list.Count-1 do
                  if pRec(list.Items[i])^.tabno=TABNO then
                     begin
                          pRec(list.Items[i])^.summagrn:=R10(pRec(list.Items[i])^.summagrn+SUMMA);
                          pRec(list.Items[i])^.summarub:=R10(pRec(list.Items[i])^.summarub+summa);
                          finded:=True;
                          Break;
                     end;
           if not finded then
              begin
                   New(Rec);
                   Rec.tabno    := tabno;
                   rec.summagrn := R10(SUMMA);
                   rec.summarub := R10(SUMMA);
                   list.add(Rec);
              end;

       end;

  begin
       trDolgi.StartTransaction;
//       dsDolgi.Params[0].AsInteger:=yDolg;
//       dsDolgi.Params[1].AsInteger:=mDolg;
//       dsDolgi.Params[2].AsInteger:=uMode-1;
       dsDolgi.Params[0].AsInteger:=mDolg;
       dsDolgi.Params[1].AsInteger:=uMode;
       dsDolgi.Open;
       while not dsDolgi.Eof do
         begin
               tabno:=dsDolgiTabno.Value;
               summa:=dsDolgiSUMMA.Value;
               if tabno=1356 then
                  i:=1;
               AddToList(tabno,summa);
               dsDolgi.Next;
         end;
       dsDolgi.Close;
       trDolgi.Commit;

  end;


 begin

      if VIPMode>0 then
         initVIPList;
      koefVypl:=1.0;
      koefS:=Trim(dxCalcEdit1.Text);
      if Length (KoefS)>0  then
         begin
             Val(KoefS,KoefVypl,i_nsrv);
             if i_nsrv<>0 then
                koefVypl:=1.0
             else
             if koefVypl<0.0001 then
                koefVypl:=1.0
             else
             if koefVypl>99.99999 then
                koefVypl:=1.0
             else
             if koefVypl>1 then
                koefVypl:=koefVypl/100;
         end;

      nmesTmp:=nmes;
      nsrvTmp:=NSRV;
      MarkPodrInList(uMode);
      putinf;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      list:=TList.Create;
      if dolgi1415Mode then
            FillListFromSalDb
         else
      for i_nsrv:=1 to Count_Serv do
          begin
               ProgressBar1.Position:=i_nsrv;
               Application.ProcessMessages;
               if not NameServList.IsSelected(i_nsrv) then
                  Continue;
               nsrv:=i_nsrv;
               MKFLNM;
               if not FileExists(fninf) then
                  Continue;
               getinf(false);
               modified:=false;
               Curr_person:=HEAD_PERSON;
               while (Curr_Person<>Nil) do
                  begin
                       if (rgKassa.ItemIndex=1)
                          and
                          (IsKassaPerson(Curr_Person))
                       then
                          begin
                               Curr_Person:=Curr_Person^.NEXT;
                               Continue;
                          end;
                       if (rgKassa.ItemIndex=2)                  //Банк ЛНР
                          and
                          (not IsKassaPerson(Curr_Person))
                       then
                          begin
                               Curr_Person:=Curr_Person^.NEXT;
                               Continue;
                          end;
                       if (rgKassa.ItemIndex=3)                 //ПСБ - рез
                          and
                          (length(trim(GET_PSBBANK_COUNT_REZ(Curr_Person^.TABNO)))<>20) then
                          begin
                               Curr_Person:=Curr_Person^.NEXT;
                               Continue;
                          end;
                       if (rgKassa.ItemIndex=4)                 //ПСБ - нерез
                          and
                          (length(trim(GET_PSBBANK_COUNT_NEREZ(Curr_Person^.TABNO)))<>20) then
                          begin
                               Curr_Person:=Curr_Person^.NEXT;
                               Continue;
                          end;
                       if (
                           ((VIPMode=1) and (inVIPList(Curr_Person^.Tabno,kindVip)))
                           or
                           ((VIPMode=2) and (not inVIPList(Curr_Person^.Tabno,0)))
                           or (VIPMode=0)
                          ) then

                       if GruppyList.IsSelected(Curr_Person^.GRUPPA)  then
                          begin
                               curr_ud:=curr_person.UD;
                               while (Curr_Ud<>nil) do
                                 begin
                                      if (Curr_Ud^.SHIFR=wantedShifr) then
                                         begin
                                              if ((koefVypl>0.0001) and (koefVypl<0.999999)) then
                                                 Curr_Ud^.SUMMA:=RoundTo(Curr_Ud^.SUMMA*KoefVypl,0);
                                              AddToList;
                                              if ((cbVypl.Checked) and (nmes=FLOW_MONTH)) then
                                                 begin
                                                      Curr_ud^.VYPLACHENO:=get_out;
                                                      modified:=true;
                                                 end;
                                         end;
                                      Curr_Ud:=Curr_Ud.NEXT;
                                 end;
                          end;
                       Curr_Person:=Curr_Person.NEXT;
                  end;
               if modified then
                  putinf;
               EMPTY_ALL_PERSON;
          end;
      if list.Count>0 then
         begin
              for i:=0 to list.Count-1 do
                  begin
                       fio:=GetFullRusFioPerson(prec(list.Items[i]).tabno);
                       fio:=trim(fio);
                       if Length(fio) =0 then
                          fio:=GetFullUkrFioPerson(prec(list.Items[i]).tabno);
                       prec(list.Items[i]).fio:=fio;
                  end;
              list.Sort(@CompareFio);
              cdsRub.Open;
              cdsRub.EmptyDataSet;
              summaTotRub:=0;
              for i:=0 to list.Count-1 do
                  begin
                       cdsRub.Append;
                       cdsRubNPP.Value       := i+1;
                       cdsRubTABNO.Value     := prec(list.Items[i]).tabno;
                       cdsRubFIO.Value       := prec(list.Items[i]).fio;
                       cdsRubSUMMA.Value     := R10(prec(list.Items[i]).summagrn);
                       cdsRubSUMMA_RUB.Value := R10(prec(list.Items[i]).summarub);
                       cdsRubIDCODE.Value    := getPersonInn(prec(list.Items[i]).tabno);
                       if rgKassa.itemIndex=2 then
                          cdsRubBANKCOUNT.Value := getPersonBankCount(prec(list.Items[i]).tabno)
                       else
                       if rgKassa.itemIndex=3 then
                          cdsRubBANKCOUNT.Value := GET_PSBBANK_COUNT_REZ(prec(list.Items[i]).tabno);
                       if rgKassa.itemIndex=4 then
                          cdsRubBANKCOUNT.Value := GET_PSBBANK_COUNT_NEREZ(prec(list.Items[i]).tabno);
                       if (CURRYEAR=2015) and (NMES<9) then
                          cdsRubSUMMA_RUB.Value:=R10(cdsRubSUMMA_RUB.Value*2);
                          summaTotRub:=R10(R10(summaTotRub)+r10(cdsRubSUMMA_RUB.Value));
                       cdsRub.Post;
                  end;
              SummaTotRubI    := Floor(summaTotRub);
              SummaTotRubKopI := Round((summaTotRub-SummaTotRubI)*100);;
              SummaTotRubKopS := Trim(IntToStr(SummaTotRubKopI));
              if SummaTotRubKopS='0' then
                 SummaTotRubKopS:='00';

              summaTotRubS:=NumeralToPhrase(summaTotRub,0,true);
              DateFr:=EncodeDate(CURRYEAR,NMES,1);
              if dolgi1415Mode then
                 DateFr:=EncodeDate(YDolg,mDolg,1);
              DateTo:=EncodeDate(YearOf(DateFr),monthOf(DateFr),DaysInMonth(DateFr));

              ds:=IntToStr(DayOf(DateFr));
              if DayOf(DateFr)<10 then
                 ds:='0'+ds;
              ms:=IntToStr(monthOf(DateFr));
              if monthOf(DateFr)<10 then
                 ms:='0'+ms;

              DateFrS := ds+'.'+ms+'.'+intToStr(YearOf(DateFr));

              ds:=IntToStr(DayOf(DateTo));
              if DayOf(DateTo)<10 then
                 ds:='0'+ds;
              ms:=IntToStr(monthOf(DateTo));
              if monthOf(DateTo)<10 then
                 ms:='0'+ms;

              DateToS := ds+'.'+ms+'.'+intToStr(YearOf(DateTo));
              RecordCount:=list.count;
              setDetailHeight;
              frxReportMem.ShowReport;
              if YesNo('Подготовить файл для банка?') then
                 begin
                      if (rgKassa.ItemIndex=1)  then
                         begin
                              BankReason:=InputBox('Название выплаты','Укажите название выплаты',ShifrList.GetName(wantedShifr));
                              if YesNo('Для перечисления на карту?') then
                                 ExportToBankForCardExcel2018(BankReason)
//                                  ExportToBankForCardExcel(BankReason)
                              else
                                 begin
                                    ExportToBankExcel(BankReason);
                //      HatForDotReport:='Зарплата за '+getMonthRus(nmes)+' '+intToStr(CurrYear)+' г.';
                                   HatForDotReport:=InputBox('Название выплаты','Укажите название выплаты для распечатки банка','Зарплата за '+getMonthRus(nmes)+' '+intToStr(CurrYear)+' г.');
                                   frxReportDot.ShowReport;
                                 end
                        end
                      else
                      if (rgKassa.ItemIndex=3)  then
                          ExportToPSBBankExcel('21')  // Резиденты
                      else
                      if (rgKassa.ItemIndex=4)  then
                          ExportToPSBBankExcel('10')  // Нерезиденты
                 end;
         end
      else
         begin
              ShowMessage('Нет сумм для вывода в платежную ведомость.');
         end;
      if list.count>0 then
         for i:=0 to list.count-1 do
             Dispose(pRec(list.Items[i]));
      list.Free;
      if VIPMode>0 then
         if VIPList<>nil then
            begin
                if VIPList.Count>0 then
                   for i:=0 to VipList.count-1 do
                       Dispose(pVipRec(VipList.Items[i]));
                VIPList.Free;
                VIPList:=nil;
            end;
      nmes:=nmesTmp;
      NSRV:=nsrvTmp;
      MKFLNM;
      getinf(true);


 end;


procedure TFormToExcelKomend.PrintDeponenty;
 var
     i:Integer;
     BankReason:string;
     procedure ExportToBankExcel(BankReason:STring);
       var FName:string;
           E,WC:Variant;
           sc,i:Integer;
           rec,lineno,currrow,currcol:Integer;
       begin //----------------------
           FName:=TemplateDIR+'Bank_Lnr.xlt';
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

           sc:=0;
           rec:=RecordCount;
           ProgressBar1.Max:=Rec;
           ProgressBar1.Min:=0;
           ProgressBar1.Position:=0;
           LineNo :=0;
           CurrRow:=4;
           E.Visible:=true;
           E.WorkBooks.Open(FName);
           cdsRub.First;
           while (not cdsRub.eof) do
               begin
                    sc:=sc+1;
                    ProgressBar1.Position:=sc;
                    Application.ProcessMessages;
                    Inc(LineNo);
                    Inc(CurrRow);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1].Select;
                    E.Selection.EntireRow.Insert;
                    WC:=E.ActiveCell;

                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=LineNo;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=cdsRubFIO.value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=cdsRubTabno.value;;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:=cdsRubBankCount.value;;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=cdsRubSUMMA_RUB.value;;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=BankReason;
                    cdsRub.next;
              end;


       end;  //-----------------------
 begin
       summaTotRub:=0;
       cdsRub.First;
       i:=0;
       while (not cdsRub.eof) do
         begin
              Inc(i);
              summaTotRub:=R10(R10(summaTotRub)+r10(cdsRubSUMMA_RUB.Value));
              cdsRub.Next;
         end;
       SummaTotRubI    := Floor(summaTotRub);
       SummaTotRubKopI := Round((summaTotRub-SummaTotRubI)*100);;
       SummaTotRubKopS := Trim(IntToStr(SummaTotRubKopI));
       if SummaTotRubKopS='0' then
          SummaTotRubKopS:='00';

       summaTotRubS:=NumeralToPhrase(summaTotRub,0,true);

       DateFr:=EncodeDate(CURRYEAR,NMES,1);
       DateTo:=EncodeDate(CURRYEAR,NMES,DaysInMonth(DateFr));
       ds:=IntToStr(DayOf(DateFr));
       if DayOf(DateFr)<10 then
          ds:='0'+ds;
       ms:=IntToStr(monthOf(DateFr));
       if monthOf(DateFr)<10 then
          ms:='0'+ms;

       DateFrS := ds+'.'+ms+'.'+intToStr(YearOf(DateFr));

       ds:=IntToStr(DayOf(DateTo));
       if DayOf(DateTo)<10 then
          ds:='0'+ds;
       ms:=IntToStr(monthOf(DateTo));
       if monthOf(DateTo)<10 then
          ms:='0'+ms;

       DateToS := ds+'.'+ms+'.'+intToStr(YearOf(DateTo));
       RecordCount:=i;
       frxReportMem.ShowReport;
       if YesNo('Подготовить файл для банка?') then
          begin
               BankReason:=InputBox('Название выплаты','Укажите название выплаты','Депонированная зарплата');
               ExportToBankExcel(BankReason);
               frxReportDot.ShowReport;
          end;
 end;


procedure TFormToExcelKomend.frxReportMemGetValue(const VarName: String;
  var Value: Variant);
  var i:Integer;
begin
     if CompareText(Trim(varName),'NAMEDOLGREKTOR')=0 then
        Value:=Trim(getRektorDolg)
     else
     if CompareText(Trim(varName),'NAMEREKTOR')=0 then
        Value:=Trim(getRektorFIO)
     else
     if CompareText(Trim(varName),'NAMEGLBUH')=0 then
        Value:=Trim(getGlBuhFIO)
     else
     if CompareText(Trim(varName),'NAMEUNI')=0 then
        Value:=Trim(getNameUniFromSQL)
     else
     if CompareText(Trim(varName),'SUMMAPROPRUB')=0 then
        Value:=Trim(SummaTotRubS)
     else
     if CompareText(Trim(varName),'SUMMARUB')=0 then
        Value:=IntToStr(SummaTotRubI)
     else
     if CompareText(Trim(varName),'SUMMARUBKOP')=0 then
        Value:=SummaTotRubKopS
     else
     if CompareText(Trim(varName),'DATEFRS')=0 then
        Value:=DateFrS
     else
     if CompareText(Trim(varName),'DATETOS')=0 then
        Value:=DateToS
     else
     if CompareText(Trim(varName),'NAMEPODR')=0 then
        if Self.uMode=2 then
           Value := 'колледж'
        else
        if Self.uMode=-1 then
           if NameServList.CountSelected=1 then
              for i:=1 to NameServList.Count do
                  begin
                      if NameServList.isSelected(i) then
                         begin
                             value:=Name_Serv(i);
                             Break;
                         end
                  end
           else
              value:=''
        else
           Value:='';

end;

procedure TFormToExcelKomend.BitBtn7Click(Sender: TObject);
 var ShifrSta,i:Integer;
begin
     if GruppyList.CountSelected<1 then
        begin
             ShowMessage('Не указаны счета');
             Exit;
        end;

     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
//         if i=53 then
//            begin
//                 ShifrSta:=53;
//                 Break;
//            end
//         else   
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

     MakeCurrentPlat(1,shifrSta,0);
end;

procedure TFormToExcelKomend.BitBtn8Click(Sender: TObject);
 var ShifrSta,i:Integer;
begin
     if GruppyList.CountSelected<1 then
        begin
             ShowMessage('Не указаны счета');
             Exit;
        end;

     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

     MakeCurrentPlat(2,shifrSta,0);

end;

procedure TFormToExcelKomend.BitBtn9Click(Sender: TObject);
 var ShifrSta,i:Integer;
begin
     if GruppyList.CountSelected<1 then
        begin
             ShowMessage('Не указаны счета');
             Exit;
        end;

     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

     MakeCurrentPlat(-1,shifrSta,0);


end;

procedure TFormToExcelKomend.BitBtn10Click(Sender: TObject);
var shifrSta:Integer;
    i:Integer;
    s:string;
    iVal,iErr:Integer;
begin
     if GruppyList.CountSelected<1 then
        begin
             ShowMessage('Не указаны счета');
             Exit;
        end;

     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;
     kindVip:=0;
     s:= InputBox('Категория', 'Номер списка', '0');
     Val(s,iVal,iErr);
     if (iErr>0) then Exit;
     if (iVal<1) or (iVal>10) then Exit;
     kindVip:=iVal;

     MakeCurrentPlat(1,shifrSta,1);

end;

procedure TFormToExcelKomend.initVIPList;
 var SQLStmnt:string;
     vipRec:pVipRec;
     kind : Integer;
 begin
     if (VIPList=Nil) or (not Assigned(VIPList)) then
        VIPList:=TList.Create;
     VIPList.Clear;
     SQLStmnt := 'select tabno,kind from tb_vip_tabno';
     pFIBQuery1.SQL.Clear;
     pFIBQuery1.SQL.Add(SQLSTmnt);
     pFIBQuery1.Transaction.StartTransaction;
     pFIBQuery1.ExecQuery;
     while (not pFIBQuery1.eof) do
        begin
             New(vipRec);
             vipRec^.tabno:=pFIBQuery1.Fields[0].AsInteger;
             vipRec^.kind:=pFIBQuery1.Fields[1].AsInteger;
             VIPList.Add(vipRec);
             pFIBQuery1.next;
        end;
     pFIBQuery1.close;
     pFIBQuery1.Transaction.commit;


 end;

 function TFormToExcelKomend.inVIPList(tabno:integer;kind:integer=0):boolean;
  // kind=0 - любой номер;
 var i:integer;
     retVal:Boolean;
 begin
     retVal:=False;
     if (VIPList<>Nil) and (Assigned(VIPList)) then
     if VIPList.Count>0 then
         begin

             for i:=0 to VIPList.Count-1 do
                 if (pVipRec(VIPList.Items[i])^.tabno=tabno) then
                 if (kind=0) or (pVipRec(VIPList.Items[i])^.kind=kind) then
                    begin
                         retVal:=true;
                         break;
                    end;
         end;
     inVIPList:=retVal;

 end;

procedure TFormToExcelKomend.BitBtn11Click(Sender: TObject);
var shifrSta:Integer;
    i:Integer;
begin
     
     if GruppyList.CountSelected<1 then
        begin
             ShowMessage('Не указаны счета');
             Exit;
        end;

     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья выплат');
             Exit;
        end;
     ShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                ShifrSta:=i;
                break;
            end;
     if ShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;

     MakeCurrentPlat(1,shifrSta,2);

end;


procedure TFormToExcelKomend.BitBtn12Click(Sender: TObject);
begin
     Application.CreateForm(TformDeponenty,formDeponenty);
     formDeponenty.ShowModal;
end;

procedure TFormToExcelKomend.frxReportDotGetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(Trim(varName),'HAT')=0 then
        Value:=HatForDotReport
     else
     if CompareText(Trim(varName),'DOLGREKTOR')=0 then
        Value:=getRektorDolg
     else
     if CompareText(Trim(varName),'FIOREKTOR')=0 then
        Value:=getRektorFIO
     else
     if CompareText(Trim(varName),'DOLGGLBUH')=0 then
        Value:=getGlBuhDolg
     else
     if CompareText(Trim(varName),'FIOGLBUH')=0 then
        Value:=getGlBuhFIO
     else
     if CompareText(Trim(varName),'NAMEUNI')=0 then
        Value:=getNameUniFromSQL;

end;



procedure TFormToExcelKomend.Button1Click(Sender: TObject);
 var s,s1:string;
     iValM,iValY,iErr,iPos,l:Integer;
     mode_u_k:Integer;
begin
     s:=InputBox('Месяц и год долга','Год и месяц в формате мм гг','11 14');
     s:=Trim(s);
     l:=Length(s);
     if not (l in [4,5]) then Exit;
     iPos := Pos(' ',s);
     if (iPos<2) or (iPos>3) then Exit;
     s1:=Copy(s,1,iPos-1);
     s1:=trim(s1);
     Val(s1,iValM,iErr);
     if iErr<>0 then Exit;
     s1:=Copy(s,iPos+1,99);
     s1:=trim(s1);
     Val(s1,iValY,iErr);
     if iErr<>0 then Exit;
     if ((iValY<14) or (iValY>15)) then Exit;
     if iValY=14 then
        if ((iValM<11) or (iValM>12)) then Exit;
     if iValY=15 then
        if ((iValM<0) or (iValM>4)) then Exit;
     yDolg:=iValY+2000;
     mDolg:=iValM;
     s:=InputBox('Укажите колледж или университет','Университет - 1; Колледж - 2','1');
     s:=Trim(s);
     l:=Length(s);
     if l<>1 then Exit;
     Val(s,mode_U_K,iErr);
     if iErr<>0 then Exit;
     if ((mode_u_k<1) or (mode_u_k>2)) then Exit;
     dolgi1415Mode:=True;
     MakeCurrentPlat(mode_U_K,shifrSta,0);
     dolgi1415Mode:=False;

end;

end.
