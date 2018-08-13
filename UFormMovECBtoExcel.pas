{$WARNINGS OFF}
{$HINTS OFF}
unit UFormMovECBtoExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery;

type
  TFormMovECBtoExcel = class(TForm)
    ProgressBarPFU: TProgressBar;
    BitBtn2: TBitBtn;
    LabelUp: TLabel;
    LabelDown: TLabel;
    pFIBQueryECB: TpFIBQuery;
    pFIBTransactionECBRead: TpFIBTransaction;
    BitBtn6: TBitBtn;
    BtnSta: TBitBtn;
    BtnDisk: TBitBtn;
    gb6: TGroupBox;
    gb5: TGroupBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn6Click(Sender: TObject);
    procedure BtnStaClick(Sender: TObject);
    procedure BtnDiskClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure FillExcelTable(ModeExcel:integer;modeExlOut:integer);
    function MakeExcelFile(modeExcel:Integer;modeExlOut:integer):String;
    procedure getStatistic;


  public
        WantedYear  : integer;
        WantedMonth : integer;
    { Public declarations }
  end;

var
  FormMovECBtoExcel: TFormMovECBtoExcel;

implementation
  uses DBF,UFibModule,IniFiles,ScrUtil,ComObj,ScrDef,DateUtils;

{$R *.dfm}

procedure TFormMovECBtoExcel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;


function TFormMovECBtoExcel.MakeExcelFile(modeExcel:Integer;modeExlOut:integer):String;
 const FNameINI='DScroll.Ini';
 var
    Ini      : TIniFile ;
    S        : string   ;
    Ch       : string   ;
    FileName : string;
 begin
     S   := ExtractFilePath(Application.ExeName)+FNameINI;
     Ini := TIniFile.Create(S);
     try
         if modeExlOut=0 then
            FileName := Ini.ReadString( 'Parameters', 'ExcelECBName', '' )
         else
         if modeExcel=6 then
            FileName := Ini.ReadString( 'Parameters', 'ExcelECBOutName6', '' )
         else
            FileName := Ini.ReadString( 'Parameters', 'ExcelECBOutName5', '' );
     finally
         Ini.Free;
     end;
     FileName:=Trim(FileName);
     if Length(FileName)<5 then
        begin
             if modeExlOut=1 then
                 ShowMessage('Не указан параметр ExcelECBOutName в файле DScroll.ini')
             else
                 ShowMessage('Не указан параметр ExcelECBName в файле DScroll.ini');
             Result:='';
             Exit;
        end;
     if not FileExists(FileName) then
        begin
             ShowMessage('Отсутствует файл '+FileName);
             Result:='';
             Exit;
        end;
     Result:=FileName;
 end;



procedure TFormMovECBtoExcel.FillExcelTable(ModeExcel:integer;modeExlOut:Integer);
const procECB=0.31;
var e,WC : variant;
    RecordBound, ix : integer ;
    fmsFloatPoint : TFormatSettings;
    iCheckMode    : integer   ;
    FName         : string    ;
    SQLStmnt      : widestring    ;
    FNameExcel,FnameTable      : string    ;
    RowNum        : Integer;
    CurrRow       : Integer;
    sheetNo       : Integer;
    SummaTot      : real;
    SummaTotInsProc:Real;
    SummaTotIns   : real;
    ran           : string;
function GetName(ModeDBF:integer):string;
 begin
       {$IFDEF SVDN}
       case ModeDbf of
        5 :  Result:='e04t05i';
        6 :  Result:='e04t06i';
        7 :  Result:='e04t07i';
       else
            Result:='';
       end;
       {$ELSE}
       case ModeDbf of
          5 :  Result:='e04t05h';
          6 :  Result:='e04t06h';
          7 :  Result:='e04t07h';
       else
            Result:='';
       end;
       {$ENDIF}
 end;
function GetNameTable(ModeExcel:integer):string;
 begin
       case ModeExcel of
        5 :  Result:='e04t05c';
        6 :  Result:='e04t06c';
        7 :  Result:='e04t07c';
       else
            Result:='';
       end;
 end;

function BuildSQLStmnt(ModeExcel:integer):widestring;
 begin
       case ModeExcel of
        5:
           if isLNR then
    //                          0        1    2     3     4         5          6          7      8         9     10
           result:='select a.numident,a.fio,a.nm,a.ftn,a.start_dt,a.end_dt,a.ukr_gromad,a.zo,a.dog_cph,a.pid_zv,b.pib from tb_e04t05c  a join kadry b on a.tabno=b.tabno where a.yearvy='+IntToStr(WantedYear)+' and a.monthvy='+IntToStr(WantedMonth)+' order by b.pib'
           else
    //                        0      1   2  3    4         5       6      7   8        9
           result:='select numident,fio,nm,ftn,start_dt,end_dt,ukr_gromad,zo,dog_cph,pid_zv from tb_e04t05c where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
        6:
           if isLNR then
     {                          0        1   2      3   4        5          6      7           8    9     10         11         12         13        14     15      16        17    18       19       20         21      22     23      24}
           result:='select a.numident,a.fio,a.nm,a.ftn,a.zo,a.sum_total,a.sum_max,a.sum_ins,a.otk,a.exp,a.pay_tp,a.pay_mnth,a.pay_year,a.ukr_gromad,a.st,a.kd_np,a.kd_nzp,a.kd_ptv,a.nrm,a.kd_vp,a.sum_diff,a.sum_narah,a.nrc,a.tabno,b.pib'+'  from tb_e04t06c a join kadry b on a.tabno=b.tabno where a.yearvy='+IntToStr(WantedYear)+' and a.monthvy='+IntToStr(WantedMonth)+' order by b.pib'
           else
     {                        0      1   2  3   4  5            6      7     8   9    10     11       12       13       14  15    16      17    18  19    20        21      22    23}
           result:='select numident,fio,nm,ftn,zo,sum_total,sum_max,sum_ins,otk,exp,pay_tp,pay_mnth,pay_year,ukr_gromad,st,kd_np,kd_nzp,kd_ptv,nrm,kd_vp,sum_diff,sum_narah,nrc,tabno from tb_e04t06c where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
        7:
     {                        0      1   2  3   4     5      6      7        8     9         10  }
           result:='select numident,fio,nm,ftn,c_pid,days,start_dt,end_dt,seazon,ukr_gromad,norma from tb_e04t07c where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
        else
           result:='';
       end;
 end;

 function FillExcelRecord(ModeExcel:integer;RowNum:Integer;modeExlOut:integer):boolean;
  var
     Fam,Nam,Otc    : shortstring    ;
     FamRus,NamRus,OtcRus : shortstring;
     fiorus:shortstring;
     NumIdent       : string    ;
     Start_Dt       : integer   ;
     End_Dt         : integer   ;
     zo,otk,exp,Dog_Cph              : integer   ;
     pay_mnth,pay_year,pay_tp        : integer   ;
     Sum_Total,Sum_Max,Sum_Ins       : real      ;
     Sum_diff,Sum_Narah              : Real      ;
     Sum_TotalS,Sum_MaxS,Sum_InsS    : string    ;
     Sum_diffS,Sum_NarahS            : string    ;
     pid_zv                          : string    ;
     days,season,ukr_gromad,st,norma : integer   ;
     c_pid                           : string    ;
     kd_np,kd_nzp,kd_ptv,kd_vp,nrm   : Integer   ;
     nrc                             : Integer   ;
     FIO   : shortstring;
     tabno : Integer;
     inn,pol: string;
     m_y : string;
     rub,kop:Integer;
     kopS:string;
     poli:Integer;
     i:Integer;
     MM_FR,YY_FR,MM_TO,YY_TO,DATE_FR_S,DATE_TO_S:string;
 begin
       case ModeExcel of
        5:begin
              NumIdent:=pFIBQueryECB.Fields[0].AsString;
              Fam:=pFIBQueryECB.Fields[1].AsString;
              Nam:=pFIBQueryECB.Fields[2].AsString;
              Otc:=pFIBQueryECB.Fields[3].AsString;
  //            Fam:=WinToDos(Fam);
  //            Nam:=WinToDos(Nam);
  //            Otc:=WinToDos(Otc);
              Start_Dt := pFIBQueryECB.Fields[4].AsInteger;
              End_Dt   := pFIBQueryECB.Fields[5].AsInteger;
              Ukr_Gromad := pFIBQueryECB.Fields[6].AsInteger;
              zo   := pFIBQueryECB.Fields[7].AsInteger;
              Dog_Cph   := pFIBQueryECB.Fields[8].AsInteger;
              pid_zv    := pFIBQueryECB.Fields[9].AsString;
              pid_zv    := Trim(pid_zv);
              FIO       := Trim(pFIBQueryECB.Fields[10].AsString);
              SplitFIO(FIO,Fam,Nam,OTC);
              MM_FR:=' ';
              YY_FR:=' ';
              MM_TO:=' ';
              YY_TO:=' ';
              if Start_Dt>0 then
                 begin
                      MM_FR:=IntToStr(Start_Dt);
                      if Length(Trim(MM_FR))=1 then
                         MM_FR:='0'+MM_FR;
                 end;
              if end_Dt>0 then
                 begin
                      MM_TO:=IntToStr(end_Dt);
                      if Length(Trim(MM_TO))=1 then
                         MM_TO:='0'+MM_TO;
                 end;
              if modeExlOut=0 then
                 begin
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,1]:=rowNum;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,4]:=Dog_Cph;
                      for i:=1 to 10 do
                          E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,14+2*(i-1)]:=Copy(numIdent+space(10),i,1);
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,34]:=FAM;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,41]:=NAM;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,49]:=OTC;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,57]:=MM_FR;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,60]:=YY_FR;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,64]:=MM_TO;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,67]:=YY_TO;
                 end
              else
                 begin
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,1]:=Dog_Cph;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,2]:=numIdent;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,3]:=FAM;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,4]:=NAM;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,5]:=OTC;
                      DATE_FR_S:='';
                      if Start_Dt>0 then
                         begin
                              DaTE_FR_S:=intToStr(Start_Dt);
                              if Length(trim(Date_Fr_S))=1 then
                                 date_Fr_S:='0'+Date_Fr_s;
                              mm_fr:=IntToStr(WantedMonth);
                              if Length(trim(mm_fr))=1 then
                                 mm_fr:='0'+mm_fr;
                              yy_fr:=IntToStr(WantedYear-2000);
                              date_Fr_S:=date_Fr_S+'.'+MM_fr+'.'+yy_fr;
                         end;
                      DATE_TO_S:='';
                      if End_Dt>0 then
                         begin
                              DaTE_TO_S:=intToStr(End_Dt);
                              if Length(trim(Date_To_S))=1 then
                                 date_To_S:='0'+Date_To_s;
                              mm_to:=IntToStr(WantedMonth);
                              if Length(trim(mm_to))=1 then
                                 mm_to:='0'+mm_to;
                              yy_to:=IntToStr(WantedYear-2000);
                              date_To_S:=date_To_S+'.'+MM_to+'.'+yy_to;
                         end;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,6]:=DATE_FR_S;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,7]:=DATE_TO_S;
                 end;
              result:=true;
          end ;
        6:begin
              NumIdent:=pFIBQueryECB.Fields[0].AsString;
              Fam:=pFIBQueryECB.Fields[1].AsString;
              Nam:=pFIBQueryECB.Fields[2].AsString;
              Otc:=pFIBQueryECB.Fields[3].AsString;
   //           Fam:=WinToDos(Fam);
   //           Nam:=WinToDos(Nam);
   //           Otc:=WinToDos(Otc);
              zo  := pFIBQueryECB.Fields[4].AsInteger;

              sum_total := pFIBQueryECB.Fields[5].AsFloat;
              sum_max   := pFIBQueryECB.Fields[6].AsFloat;
              sum_ins   := pFIBQueryECB.Fields[7].AsFloat;

        {
              sum_total := 0.00;
              sum_max   := 0.00;
              sum_ins   := 0.00;
        }
              tabno:=pFIBQueryECB.Fields[23].AsInteger;
              otk := pFIBQueryECB.Fields[8].AsInteger;
              exp := pFIBQueryECB.Fields[9].AsInteger;
              Pay_Tp := pFIBQueryECB.Fields[10].AsInteger;
              Pay_Mnth := pFIBQueryECB.Fields[11].AsInteger;
              Pay_Year := pFIBQueryECB.Fields[12].AsInteger;
              Ukr_Gromad := pFIBQueryECB.Fields[13].AsInteger;
              St         := pFIBQueryECB.Fields[14].AsInteger;
              kd_np      := pFIBQueryECB.Fields[15].AsInteger;
              kd_nzp     := pFIBQueryECB.Fields[16].AsInteger;
              kd_ptv     := pFIBQueryECB.Fields[17].AsInteger;
              nrm        := pFIBQueryECB.Fields[18].AsInteger;
              kd_vp      := pFIBQueryECB.Fields[19].AsInteger;

              sum_diff   := pFIBQueryECB.Fields[20].AsFloat;
              sum_narah  := pFIBQueryECB.Fields[21].AsFloat;
              nrc        := pFIBQueryECB.Fields[22].AsInteger;

              sum_totals := format('%16.2f',[sum_total]);
              sum_maxs   := format('%16.2f',[sum_max]);
              sum_inss   := format('%16.2f',[sum_ins]);
              sum_diffs  := format('%16.2f',[sum_diff]);
              sum_narahs := format('%16.2f',[sum_narah]);
              sum_totals := ReplChar(sum_totals,'.',',');
              sum_maxs   := ReplChar(sum_maxs,'.',',');
              sum_inss   := ReplChar(sum_inss,'.',',');
              FIO        := Trim(pFIBQueryECB.Fields[24].AsString);
              fioRus     := fio;
              if not SplitFIO(fioRus,FAMrus,NAMRus,OTCRus) then
                 begin
                      famrus:=fam;
                      namrus:=nam;
                      otcrus:=otc;
                 end;

              inn        := numident;
              pol        := getPolRusByNalCode(inn);
              m_y:=IntToStr(pay_mnth)+' '+inttostr(pay_year);
              if ((pay_mnth<10) and (pay_mnth>0)) then
                  m_y:='0'+m_y;
              if modeExlOut=1 then
                 begin
                   //   E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,1]:=RowNum;
                      if pol='м' then poli:=1
                      else poli:=0;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,2]:=Poli;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,3]:=''''+inn;
//                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,4]:=fio;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,4]:=famrus;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,5]:=namrus;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,6]:=otcrus;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,7]:=pay_tp;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,8]:=pay_mnth;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,9]:=pay_year;
                      if kd_np>0 then
                         E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,10]:=kd_np;
                      if kd_nzp>0 then
                         E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,11]:=kd_nzp;
                      if kd_ptv>0 then
                         E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,12]:=kd_ptv;
                      if Abs(sum_total)>0.01 then
                         begin
//                              sum_ins:=R10(sum_total*0.31);
                              SummaTot:=r10(SummaTot)+r10(Sum_total);
                              if (pay_year=2015) and (pay_mnth=12) then
                              else
                                 sum_ins:=R10(R10(summaTot*0.31)-r10(SummaTotIns));
                              SummaTotIns:=R10(SummaTotIns)+r10(Sum_ins);
                              sum_inss   := format('%16.2f',[sum_ins]);
                              sum_inss   := ReplChar(sum_inss,'.',',');
                              E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,13]:=Sum_Total;
                              E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,14]:=Sum_Total;
                            //  SummaTotIns:=R10(SummaTotIns)+Sum_ins;
//                              E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,13]:=sum_ins;
                              E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,15]:=1;
                         end;

                 end
              else
                 begin
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,1]:=RowNum;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,3]:=Pol;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,4]:=''''+inn;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,7]:=fio;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,16]:=pay_tp;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,17]:=''''+m_y;
                      E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,29]:=0;
                      if kd_np>0 then
                         E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,19]:=kd_np;
                      if kd_nzp>0 then
                         E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,21]:=kd_nzp;
                      if kd_ptv>0 then
                         E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,22]:=kd_ptv;
                      if Abs(sum_total)>0.01 then
                         begin
                              sum_total:=R10(sum_total);
                              SummaTot:=r10(SummaTot)+Sum_total;
                              SummaTotInsProc:=r10(summaTot*procECB);
                              rub:=Round(int(sum_total));
                              kop:= Round(frac(sum_total)*100);
                              kopS:=IntToStr(kop);
                              if kop<10 then
                                 kopS:='0'+kopS;
                              E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,23]:=rub;
                              E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,24]:=kops;
                              E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,25]:=rub;
                              E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,26]:=kops;
                              if (pay_year=2015) and (pay_mnth=12) then
                              else
                                 sum_ins:=R10(R10(summaTot*0.31)-r10(SummaTotIns));
                              SummaTotIns:=R10(SummaTotIns)+r10(Sum_ins);
                              rub:=Round(int(sum_ins));
                              kop:= Round(frac(sum_ins)*100);
                              kopS:=IntToStr(kop);
                              if kop<10 then
                                 kopS:='0'+kopS;
                              E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,27]:=rub;
                              E.WorkBooks[1].WorkSheets[sheetNo].Cells[currRow,28]:=kops;
                         end;
                 end;

          end;
        7:begin
(*

              NumIdent:=pFIBQueryECB.Fields[0].AsString;
              Fam:=pFIBQueryECB.Fields[1].AsString;
              Nam:=pFIBQueryECB.Fields[2].AsString;
              Otc:=pFIBQueryECB.Fields[3].AsString;
              c_pid:=pFIBQueryECB.Fields[4].AsString;
    //          Fam:=WinToDos(Fam);
    //          Nam:=WinToDos(Nam);
    //          Otc:=WinToDos(Otc);
    //          c_pid:=WinToDos(c_pid);
              days     := pFIBQueryECB.Fields[5].AsInteger;
              start_dt := pFIBQueryECB.Fields[6].AsInteger;
              end_dt   := pFIBQueryECB.Fields[7].AsInteger;
              season   := pFIBQueryECB.Fields[8].AsInteger;
              Ukr_Gromad := pFIBQueryECB.Fields[9].AsInteger;
              Norma    := pFIBQueryECB.Fields[10].AsInteger;

              dBASE.SetFieldData(3 , IntToStr(RowNum));
              dBASE.SetFieldData(4 , IntToStr(Ukr_Gromad));
              dBASE.SetFieldData(5 , NumIdent);
              dBASE.SetFieldData(6 , Fam);
              dBASE.SetFieldData(7 , Nam);
              dBASE.SetFieldData(8 , Otc);
              dBASE.SetFieldData(9 , c_pid);
              dBASE.SetFieldData(10 , IntToStr(start_dt));
              dBASE.SetFieldData(11 , IntToStr(end_dt));
              dBASE.SetFieldData(12 , IntToStr(days));
              dBASE.SetFieldData(16 , IntToStr(Norma));
*)
          end;

        else
           result:=false;
       end;
 end;

 procedure FillTot6;
  var
      rub,kop:Integer;
      kops:string;
      row:Integer;
  begin
       row:=15+Rownum;
       SummaTot:=R10(SummaTot);
       rub:=Round(int(SummaTot));
       kop:= Round(frac(SummaTot)*100);
       kopS:=IntToStr(kop);
       if kop<10 then
          kopS:='0'+kopS;
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[Row,23]:=rub;
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,24]:=kops;
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[Row,25]:=rub;
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,26]:=kops;
       SummaTotIns:=R10(SummaTotIns);
       rub:=Round(int(SummaTotIns));
       kop:= Round(frac(SummaTotIns)*100);
       kopS:=IntToStr(kop);
       if kop<10 then
          kopS:='0'+kopS;
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[Row,27]:=rub;
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,28]:=kops;

  end;
 procedure FillTot5;
 const rinn='1912511491';
       binn='1967902405';
  var
      rub,kop:Integer;
      kops:string;
      row:Integer;
      MM,YY,DD:string;
      i:integer;
  begin
       row:=33+rowNum;
       MM:=IntToStr(WantedMonth);
       if Length(Trim(MM))=1 then
          MM:='0'+MM;
       YY:=IntToStr(WantedYear);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[7,1]:='Луганский государственнй университет им. В.Даля ГОУ ВПО ЛНР';
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[10,15]:=Copy(MM,1,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[10,18]:=Copy(MM,2,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[10,26]:=Copy(YY,1,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[10,26]:=Copy(YY,1,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[10,29]:=Copy(YY,2,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[10,32]:=Copy(YY,3,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[10,35]:=Copy(YY,4,1);
       DD:=IntToStr(dayOf(date));
       if Length(Trim(DD))=1 then
          DD:='0'+DD;
       MM:=IntToStr(monthOf(date));
       if Length(Trim(MM))=1 then
          MM:='0'+MM;
       YY:=IntToStr(yearOf(date));

       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,29]:=Copy(DD,1,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,31]:=Copy(DD,2,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,35]:=Copy(MM,1,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,37]:=Copy(MM,2,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,41]:=Copy(YY,1,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,43]:=Copy(YY,2,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,45]:=Copy(YY,1,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,57]:=Copy(YY,2,1);
       mm:=IntToStr(rowNum);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,79]:=Copy(MM,1,1);
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row,81]:=Copy(MM,2,1);

       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row+2,32]:='Рябичев В.Д.';
       E.WorkBooks[1].WorkSheets[sheetNo].Cells[row+2,90]:='Пятковская Р.Г.';
       for i:=1 to 10 do
           E.WorkBooks[1].WorkSheets[sheetNo].Cells[row+2,4+2*(i-1)]:=copy(rinn,i,1);
       for i:=1 to 10 do
           E.WorkBooks[1].WorkSheets[sheetNo].Cells[row+2,63+2*(i-1)]:=copy(binn,i,1);


  end;

 procedure HideZeroRowExcel;
  var   StartRow,EndRow : integer;
        HideCol         : integer;
        HideModeRow     : integer;
        I,J,M           : Integer;
        s               : Variant;
        need            : Boolean;
        vs              : string;
        vi              : Integer;
  begin
        if ModeExcel=5 then
        if modeExlOut=0 then
           begin
                 HideCol     :=  4;
                 StartRow    :=  15;
                 EndRow      := StartRow+15+rowNum;
           end
        else
           begin
                 HideCol     :=  1;
                 StartRow    :=  3;
                 EndRow      := StartRow+8+rowNum;
           end
        else
        if ModeExcel=6 then
        if modeExlOut=0 then
           begin
   //              exit;
                 HideCol     :=  1;
                 StartRow    :=  12;
                 EndRow      := StartRow+3+rowNum;
           end
        else
           begin
    //             exit;
                 HideCol     :=  3;
                 StartRow    :=  4;
                 EndRow      := StartRow+12+rowNum;
           end;

        for i:=StartRow to EndRow do
            begin
                 need:=False;
                 s:=e.WorkBooks[1].WorkSheets[sheetNo].Cells[i,HideCol];
                 vs:=varAsType(s,varString);
        //         vi:=varAsType(s,varInteger);
                 j:=VarType(s);
                 if (j=9) and (length(trim(vs))=0) then
                    need:=true;
                 if not need then
                 if VarIsNull(s) then
                    need:=True;
                 if not need then
                 if VarIsClear(s) then
                    need:=true;
                 if not need then
                 if VarIsNumeric(s) then
                 if s=0 then
                    need:=True;
                 if not need then
                 if VarIsStr(s) then
                 if (Length(Trim(s))=0) then
                    need:=true;
         //        if not need then
                 if need then
                    e.WorkBooks[1].WorkSheets[sheetNo].Rows[i].Hidden:=true;
            end;
  end;


begin
     SummaTot    := 0.0;
     SummaTotIns := 0.0;
     case ModeExcel of
      5:sheetNo:=3;
      6:sheetNo:=4;
     else
        sheetNo:=1;
     end;
     if modeExlout=1 then
        sheetNo:=1;
     FNameTable := GetNameTable(ModeExcel);
     if Length(Trim(FNameTable))<5 then Exit;
     LabelUp.Caption:='Перенос таблицы '+FNameTable;
     Application.ProcessMessages;
     FName:=MakeExcelFile(ModeExcel,modeExlOut);
     FName:=trim(FName);
     if Length(FName)<5 then Exit;
     if pFIBQueryECB.Open then
        pFIBQueryECB.Close;
     if pFIBQueryECB.Transaction.Active then
        pFIBQueryECB.Transaction.Commit;
     SQLStmnt:='select count(*) from tb_'+FNameTable+' where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
     pFIBQueryECB.Transaction.StartTransaction;
     pFIBQueryECB.SQL.Clear;

     pFIBQueryECB.SQL.Add(SQLStmnt);
     pFIBQueryECB.ExecQuery;
     RecordBound:=pFIBQueryECB.Fields[0].AsInteger;
     if RecordBound<1 then
        begin
             ShowMessage('Нет записей в таблице '+FNameTable+' за '+IntToStr(WantedYear)+' '+IntToStr(WantedMOnth));
             pFIBQueryECB.Close;
             pFIBQueryECB.Transaction.Commit;
             Exit;
        end;

     fmsFloatPoint.DecimalSeparator := '.';


     try
        E:=CreateOleObject('Excel.Application');
     except
       on E: Exception do
       begin
           ShowMessage('Ошибка запуска Excel');
           Exit;
       end;
     end;
//     E.Visible:=true;
     E.WorkBooks.Open(FName);
     E.WorkBooks[1].WorkSheets[sheetNo].Activate;
     pFIBQueryECB.Close;
     SQLStmnt:=BuildSQLStmnt(ModeExcel);
     pFIBQueryECB.SQL.Clear;
     pFIBQueryECB.SQL.Add(SQLStmnt);
     pFIBQueryECB.ExecQuery;
     ProgressBarPFU.Min:=0;
     ProgressBarPFU.Max:=RecordBound;
     ProgressBarPFU.Position:=0;
     ix:=0;
     RowNum:=0;
     if ModeExcel=6 then
        if modeExlOut=1 then
           currRow:=5
        else
          CurrRow:=12
     else
     if modeExcel=5 then
        if modeExlOut=1 then
           currRow:=5
        else
          CurrRow:=16;
     while not pFIBQueryECB.Eof do
       begin
              inc(currRow);
//              if RowNum>10 then
//                 break;
              Inc(RowNum);
              E.WorkBooks[1].WorkSheets[sheetNo].Cells[CurrRow,80].Select;
              E.Selection.EntireRow.Insert;
              WC:=E.ActiveCell;
              E.WorkBooks[1].WorkSheets[sheetNo].Cells[CurrRow,1].Select;
       //       Ran:='r'+IntToStr(currrow)+'c4:r'+IntToStr(currrow)+'c6';
   //           E.Selection.Merge;
       //       E.WorkBooks[1].WorkSheets[sheetNo].Range[ran].Select;
       //       E.Selection.MergeCells := True;
          //    E.Selection.Merge;
          //    st := Excel.ActiveWorkBook.WorkSheets[1].Cells[CurrRow,4];
          //    st1 := Excel.ActiveWorkBook.WorkSheets[1].Cells[CurrRow,6];
        //      e.ActiveWorkBook.WorkSheets[sheetNo].cells[st,st1].merge;

              if (ModeExcel=6) and (modeExlOut=0) then
                 begin
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,4], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,6]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,7], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,14]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,17], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,18]].MergeCells:=True;
                 end
              else
              if (ModeExcel=5) and (modeExlOut=0) then
                 begin
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,1], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,3]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,4], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,13]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,14], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,15]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,16], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,17]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,18], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,19]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,20], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,21]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,22], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,23]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,24], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,25]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,26], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,27]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,28], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,29]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,30], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,31]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,32], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,33]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,34], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,40]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,41], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,48]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,49], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,56]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,57], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,59]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,60], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,63]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,64], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,66]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,67], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,70]].MergeCells:=True;
                      e.ActiveWorkBook.WorkSheets[sheetNo].Range[e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,71], e.ActiveWorkBook.WorkSheets[sheetNo].Cells.Item[currRow,79]].MergeCells:=True;
                 end ;

              FillExcelRecord(ModeExcel,RowNum,modeExlOut);
              inc(ix);
              ProgressBarPFU.Position := ix;
              LabelDown.Caption:=IntToStr(ix)+' / '+IntToStr(RecordBound);
              application.ProcessMessages;
              pFIBQueryECB.Next;
       end;
     if (ModeExcel=6) and (modeExlOut=0) then
        FillTot6
     else
     if (ModeExcel=5) and (modeExlOut=0) then
        FillTot5;
     HideZeroRowExcel;   
     E.Visible:=true;

     if pFIBQueryECB.Open then
        pFIBQueryECB.Close;
     if pFIBQueryECB.Transaction.Active then
        pFIBQueryECB.Transaction.Commit;

end;

procedure TFormMovECBtoExcel.getStatistic;
 var SqlStmnt:string;
     v:Variant;
     amntOfPerson:integer;
     amntOfWomen:integer;
     amntOfMan:integer;

 begin
      sqlStmnt:='select count(*),sum(';
      SqlStmnt:=Trim(sqlStmnt)+' case ';
      SqlStmnt:=Trim(sqlStmnt)+' when substr(inn,9,9) in (''0'',''2'',''4'',''6'',''8'') then 1';
      SqlStmnt:=Trim(sqlStmnt)+' else 0';
      SqlStmnt:=Trim(sqlStmnt)+' end';
      SqlStmnt:=Trim(sqlStmnt)+' ) w, sum(';
      SqlStmnt:=Trim(sqlStmnt)+' case';
      SqlStmnt:=Trim(sqlStmnt)+' when substr(inn,9,9) in (''0'',''2'',''4'',''6'',''8'') then 0';
      SqlStmnt:=Trim(sqlStmnt)+' else 1';
      SqlStmnt:=Trim(sqlStmnt)+' end';
      SqlStmnt:=Trim(sqlStmnt)+' ) m';
      SqlStmnt:=Trim(sqlStmnt)+' from (';
      SqlStmnt:=Trim(sqlStmnt)+' select distinct a.numident inn,a.fio,a.nm,a.ftn from tb_e04t06c a';
      SqlStmnt:=Trim(sqlStmnt)+' where a.yearvy='+intToStr(wantedYear);
      SqlStmnt:=Trim(sqlStmnt)+'   and a.monthvy='+intToStr(wantedMonth)+')';
      v:=FIB.pFIBDatabaseSal.QueryValues(sqlStmnt);
      if VarIsArray(v) then
         begin
              amntOfPerson:=0;
              amntOfWomen:=0;
              amntOfMan:=0;
              amntOfPerson:=0;
              if VarIsNumeric(v[0]) then
                 amntOfPerson:=v[0];
              if VarIsNumeric(v[1]) then
                 amntOfWomen:=v[1];
              if VarIsNumeric(v[2]) then
                 amntOfMan:=v[2];
              ShowMessage('Сотрудников '+intToStr(amntOfPerson)+' женщин-'+intToStr(amntOfWomen)+' мужчин-'+intToStr(amntOfman));
         end
      else
         ShowMessage('Ощибка выполнения запроса к БД');
 end;


procedure TFormMovECBtoExcel.BitBtn6Click(Sender: TObject);
begin
   //  FillDBFTable(5);
     Caption:='Подготовка данных таблицы 6';
     Application.ProcessMessages;
     FillExcelTable(6,0);
   //  FillDBFTable(7);
end;

procedure TFormMovECBtoExcel.BtnStaClick(Sender: TObject);
begin
     getStatistic;
end;

procedure TFormMovECBtoExcel.BtnDiskClick(Sender: TObject);
begin
     Caption:='Подготовка данных таблицы 6';
     Application.ProcessMessages;
     FillExcelTable(6,1);
end;

procedure TFormMovECBtoExcel.BitBtn1Click(Sender: TObject);
begin
     Caption:='Подготовка данных таблицы 5';
     Application.ProcessMessages;
     FillExcelTable(5,0);
end;

procedure TFormMovECBtoExcel.BitBtn3Click(Sender: TObject);
begin
     Caption:='Подготовка данных таблицы 5';
     Application.ProcessMessages;
     FillExcelTable(5,1);

end;

end.
