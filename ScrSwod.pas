{$WARNINGS OFF}
{$HINTS OFF}
unit ScrSwod;

interface                     
    uses Classes,ScrDef;
         PROCEDURE MAKE_MAIN_SWOD(Select_Key:Integer;
                                  Select_Bay_Mode:Integer;
                                  SelectedBay:integer;
                                  NameBay:String;NeedDogPod:boolean;
                                  TotalMode:boolean;
                                  PrintMode:integer;
                                  ModeIllSS:integer;
                                  SwodSowmMode:integer;
                                  ChernobMode:integer);
type
       PCell_Rec=^TCell_Rec;
       TCell_Rec = RECORD
                    Shifr  : integer;
                    PERIOD : INTEGER;
                    SUMMA  : REAL;
                    FMP    : REAL;
                    FZP    : REAL;
                    OTHER  : REAL;
                    shifrban : integer;
                   END;

       TItemList = class(TList)
                     procedure AddItem(Shifr:integer;Period:Integer;Summa,FZP,FMP,Other:Real;shifrban:integer);
                     function SummaItema:Real;
                     function SummaWantedItem(WantedShifr:Integer):Real;
                   end;
type PSwodDetRec=^TSwodDetRec;
     TSwodDetRec=record
                  shifrpod : integer;
                  shifrsta : Integer;
                  Period   : Integer;
                  shifrBan : Integer;
                  nmbofrec : Integer;
                  summa    : real;
                  summafzp : Real;
                  summafmp : Real;
                  summaoth : Real;
                 end;
      TSQLSwodClass=class
                     private
                      list        : TList;
                      ShifrIdSwod : Integer;
                      Y,M         : Integer;
                      public
                      constructor init(Y,M:Integer);
                      destructor Done;
                  //    procedure PutToSQL(name:string;NameSQL:WideString);
                      procedure PutToSQL(NameSwod   : string       ;
                                         NameSQL    : WideString   ;
                                         Select_key : Integer      ;
                                         Select_Bay_Mode : Integer ;
                                         SelectedBay     : Integer ;
                                         NeedDogPod   : Boolean    ;
                                         TotalMode    : boolean    ;
                                         ModeIllSS    : Integer    ;
                                         SwodSowmMode : Integer    ;
                                         ChernobMode  : integer);

                      procedure AddItemAdd(Curr_Add:Add_Ptr;ShifrPod:Integer);
                      procedure AddItemUd(Curr_ud:Ud_Ptr;ShifrPod:Integer;Curr_Person:person_ptr);
                    end;

var
    ItemAddList  : TItemList;
    ItemUdList   : TItemList;

implementation
  uses Forms,SysUtils,ScrUtil,uFormMkPensList,ScrLists,ScrIo,
       UFormView,UFormProgress,Dialogs,UFibModule,UFormWait,ComObj,
       UFormSwodMNFR, frxClass, DateUtils;
TYPE
       PNeedPodrRec=^TNeedPodrRec;
       TNeedPodrRec=record
                     ShifrPod:integer;
                    end;
       TNeedPodrList = class(TList)
                        function IsNeedPodr(ShifrPod:integer):boolean;
                       end;


  var
    SQLSwodClass:TSQLSwodClass;
    needSVDNFooter:boolean;
    constructor TSQLSwodClass.init(Y,M:integer);
      begin
           Self.List:=TList.Create;
         //  Self.ShifrIdSwod:=ShifrIdSwod;
           Self.Y:=Y;
           Self.M:=M;
      end;
    destructor TSQLSwodClass.done;
     var I:Integer;
      begin
           if list.Count>0 then
              for i:=0 to list.Count-1 do
                  Dispose(PSwodDetRec(list.Items[i]));
           List.Free;
           List:=nil;
      end;
//    procedure TSQLSwodClass.PutToSQL(name:string;NameSQL:WideString);
      procedure TSQLSwodClass.PutToSQL(NameSwod     : String;
                                       NameSQL      : WideString;
                                       Select_key   : Integer;
                                       Select_Bay_Mode : Integer;
                                       SelectedBay  : Integer;
                                       NeedDogPod   : Boolean;
                                       TotalMode    : Boolean;
                                       ModeIllSS    : Integer;
                                       SwodSowmMode : Integer;
                                       ChernobMode  : Integer);
      var SQLStmnt:string;
          ShifrId:Integer;
          i,j:Integer;
      begin
           i:=0;
           j:=0;
           if NeedDogPod then i:=1;
           if TotalMode  then j:=1;

           SQLStmnt:='insert into tb_swody_hat(name,yearvy,monthvy,namedet,select_key,select_bay_mode,selectedbay,ModeIllSS,SwodSowmMode,ModeChernob,NeedDogPod,TotalMode) values('+
                      ''''+trim(ReplSToDQuote(NameSwod))+''','+IntToStr(Y)+','+IntToStr(M)+','''+trim(ReplSToDQuote(NameSQL))+''','+
                      IntToStr(Select_Key)+','+IntToStr(Select_Bay_Mode)+','+IntToStr(SelectedBay)+','+IntToStr(ModeIllSS)+','+IntToStr(SwodSowmMode)+
                      ','+IntToStr(ChernobMode)+','+IntToStr(i)+','+IntToStr(j)+')';
{
    SEL              TSMALLCODE ,
    SOWM_SWOD        TSMALLCODE /* TSMALLCODE = SMALLINT DEFAULT 0 */,
    SWOD_MODE        TSMALLCODE /* TSMALLCODE = SMALLINT DEFAULT 0 */,
    NEEDDOGPOD       TSMALLCODE /* TSMALLCODE = SMALLINT DEFAULT 0 */,
    TOTALMODE        TSMALLCODE /* TSMALLCODE = SMALLINT DEFAULT 0 */,
    MODEILLSS        TSMALLCODE /* TSMALLCODE = SMALLINT DEFAULT 0 */,
    MODECHERNOB      TSMALLCODE /* TSMALLCODE = SMALLINT DEFAULT 0 */,
    SELECT_KEY       TSMALLCODE /* TSMALLCODE = SMALLINT DEFAULT 0 */,
    SELECT_BAY_MODE  TSMALLCODE /* TSMALLCODE = SMALLINT DEFAULT 0 */,
    SELECTEDBAY      TSMALLCODE /* TSMALLCODE = SMALLINT DEFAULT 0 */,
    SWODSOWMMODE     TSMALLCODE /* TSMALLCODE = SMALLINT DEFAULT 0 */
}
           if FIB.pFIBQuery.Open then
              FIB.pFIBQuery.Close;
           if FIB.pFIBQuery.Transaction.Active then
              FIB.pFIBQuery.Transaction.Commit;
           FIB.pFIBQuery.Transaction.StartTransaction;
           FIB.pFIBQuery.SQL.Clear;
           FIB.pFIBQuery.SQL.Add(SQLStmnt);
           FIB.pFIBQuery.ExecQuery;
           FIB.pFIBQuery.Close;
           SQLStmnt:='select first 1 shifrid from tb_swody_hat order by shifrid desc';
           FIB.pFIBQuery.SQL.Clear;
           FIB.pFIBQuery.SQL.Add(SQLStmnt);
           FIB.pFIBQuery.ExecQuery;
           shifrid:=FIB.pFIBQuery.Fields[0].Asinteger;
           FIB.pFIBQuery.Close;
           if list.Count>0 then
              for i:=0 to list.count-1 do
                  begin
                       SQLStmnt:='insert into tb_swody_det(shifridswod,shifrpod,shifrsta,period,nmbofrec,';
                       SQLStmnt:=Trim(SQLStmnt)+'summa,summafzp,summafmp,summaoth) values(';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(Shifrid)+',';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(PSwodDetRec(list.Items[i]).ShifrPod)+',';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(PSwodDetRec(list.Items[i]).ShifrSta)+',';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(PSwodDetRec(list.Items[i]).Period)+',';
                       SQLStmnt:=Trim(SQLStmnt)+IntToStr(PSwodDetRec(list.Items[i]).nmbofrec)+',';
                       SQLStmnt:=Trim(SQLStmnt)+FormatFloatPoint(PSwodDetRec(list.Items[i]).Summa)+',';
                       SQLStmnt:=Trim(SQLStmnt)+FormatFloatPoint(PSwodDetRec(list.Items[i]).Summafzp)+',';
                       SQLStmnt:=Trim(SQLStmnt)+FormatFloatPoint(PSwodDetRec(list.Items[i]).Summafmp)+',';
                       SQLStmnt:=Trim(SQLStmnt)+FormatFloatPoint(PSwodDetRec(list.Items[i]).SummaOth)+')';
                       FIB.pFIBQuery.SQL.Clear;
                       FIB.pFIBQuery.SQL.Add(SQLStmnt);
                       FIB.pFIBQuery.ExecQuery;
                       FIB.pFIBQuery.Close;
                  end;

           FIB.pFIBQuery.Transaction.Commit;


      end;
    procedure TSQLSwodClass.AddItemAdd(Curr_Add:Add_Ptr;ShifrPod:Integer);
      var i : Integer;
          finded : boolean;
          SwodDetRec : PSwodDetRec;
      begin
           finded:=False;
           if list.Count>0 then
              for i:=0 to list.Count-1 do
                  if (
                     (PSwodDetRec(list.Items[i]).shifrpod = ShifrPod) and
                     (PSwodDetRec(list.Items[i]).shifrsta = Curr_Add^.Shifr) and
                     (PSwodDetRec(list.Items[i]).Period   = Curr_Add^.Period)
                     ) then
                     begin
                          Finded:=True;
                          Break;
                     end;
           if finded then
              begin
                Inc(PSwodDetRec(list.Items[i]).nmbofrec);
                PSwodDetRec(list.Items[i]).Summa:=PSwodDetRec(list.Items[i]).Summa       + Curr_Add^.SUMMA;
                PSwodDetRec(list.Items[i]).Summafzp:=PSwodDetRec(list.Items[i]).Summafzp + Curr_Add^.SUMMA;
                PSwodDetRec(list.Items[i]).Summafmp:=PSwodDetRec(list.Items[i]).Summafmp + Curr_Add^.SUMMA;
                PSwodDetRec(list.Items[i]).Summaoth:=PSwodDetRec(list.Items[i]).Summaoth + Curr_Add^.SUMMA;
              end
           else
              begin
                   New(SwodDetRec);
                   SwodDetRec.shifrpod := ShifrPod;
                   SwodDetRec.shifrsta := Curr_Add^.SHIFR;
                   SwodDetRec.Period   := Curr_Add^.Period;
                   SwodDetRec.nmbofrec := 1;
                   SwodDetRec.summa    := Curr_Add^.SUMMA;
                   SwodDetRec.summafzp := Curr_Add^.FZP;
                   SwodDetRec.summafmp := Curr_Add^.FMP;
                   SwodDetRec.summaoth := Curr_Add^.Other;
                   SwodDetRec.shifrBan := 0; 
                   list.Add(SwodDetRec);
              end;

      end;

    procedure TSQLSwodClass.AddItemUd(Curr_Ud:Ud_Ptr;ShifrPod:Integer;Curr_Person:PERSON_PTR);
      var i          : Integer;
          finded     : boolean;
          SwodDetRec : PSwodDetRec;
          shifrBan   : Integer;
      begin
           shifrBan := Curr_Person^.Bank;
           if (shifrBan<1) or
              (shifrBan>100) then
              shifrBan:=0;
           if (shifrBan>0) then
           if (not (IsBankShifr(Curr_ud^.shifr))) then
              shifrBan:=0;
           finded:=False;
           if list.Count>0 then
              for i:=0 to list.Count-1 do
                  if (
                     (PSwodDetRec(list.Items[i]).shifrpod = ShifrPod)        and
                     (PSwodDetRec(list.Items[i]).shifrsta = Curr_Ud^.Shifr)  and
                     (PSwodDetRec(list.Items[i]).Period   = Curr_Ud^.Period) and
                     (PSwodDetRec(list.Items[i]).shifrBan = shifrBan)
                     ) then
                     begin
                          Finded:=True;
                          Break;
                     end;

           if finded then
              begin
                Inc(PSwodDetRec(list.Items[i]).nmbofrec);
                PSwodDetRec(list.Items[i]).Summa:=PSwodDetRec(list.Items[i]).Summa+ Curr_Ud^.SUMMA;
              end
           else
              begin
                   New(SwodDetRec);
                   SwodDetRec.shifrpod := ShifrPod;
                   SwodDetRec.shifrsta := Curr_Ud^.SHIFR;
                   SwodDetRec.Period   := Curr_Ud^.Period;
                   SwodDetRec.nmbofrec := 1;
                   SwodDetRec.summa    := Curr_Ud^.SUMMA;
                   SwodDetRec.summafzp := 0;
                   SwodDetRec.summafmp := 0;
                   SwodDetRec.summaoth := 0;
                   SwodDetRec.shifrBan := shifrBan;
                   list.Add(SwodDetRec);
              end;

      end;

    function CompareItems(Item1, Item2: Pointer): Integer;
     begin
          if PCell_Rec(Item1)^.Shifr>PCell_Rec(Item2)^.Shifr then Result:=1
          else if PCell_Rec(Item1)^.Shifr<PCell_Rec(Item2)^.Shifr then Result:=-1
          else if PCell_Rec(Item1)^.Period>PCell_Rec(Item2)^.Period then Result:=1
          else if PCell_Rec(Item1)^.Period<PCell_Rec(Item2)^.Period then Result:=-1
          else Result:=0;
     end;

  procedure TItemList.AddItem(Shifr:integer;Period:Integer;Summa,FZP,FMP,Other:Real;shifrban:integer);
   var i:integer;
       Cell_Rec:PCell_Rec;
       Finded:Boolean;
   begin
        if ((shifrban<0) or (shifrban>100)) then
            shifrBan:=0;
        if (shifrBan>0) then
        if (not (IsBankShifr(shifr))) then
           shifrBan:=0;

        Summa := R10(Summa);
        FZP   := R10(FZP);
        FMP   := R10(FMP);
        Other := R10(Other);
        finded:=true;
        if ShifrList.IsAdd(Shifr) then
           if abs(Summa)>0.01 then
           if abs(FZP)>0.01 then
              FZP:=Summa
           else if abs(FMP)>0.01 then
              FMP:=Summa
           else if abs(Other)>0.01 then
              Other:=Summa;
        if Shifr=28 then
           Other:=Other;   
        if ShifrList.IsAdd(Shifr) then
        if abs(Summa-FZP-FMP-Other)>0.005 then
           Other:=Other;
        if ShifrList.IsAdd(Shifr) then
        if Abs(Summa-FZP-FMP-OTHER)>0.005 then
      //  if Shifr<40 then
           Finded:=false;

        if ShifrList.IsAdd(Shifr) then
           if (Shifr=NIGHT_SHIFR)  or
              (Shifr=PRAZDN_SHIFR) or
              ((abs(FMP)<0.01)     and
               (abs(OTHER)<0.01)) then
               FZP:=SUM(Summa);

        Finded:=false;
        if Self.Count>0 then
           begin
                for i:=1 to Self.Count do
                    if ((PCell_Rec(Self.Items[i-1])^.Shifr=Shifr) and
                        (PCell_Rec(Self.Items[i-1])^.Period=Period) and
                        (PCell_Rec(Self.Items[i-1])^.shifrban=shifrban))
                        then
                            begin
                                 PCell_Rec(Self.Items[i-1])^.Summa := Sum(PCell_Rec(Self.Items[i-1])^.Summa) + Sum(Summa);
                                 if abs(FMP)>0.009 then
                                 PCell_Rec(Self.Items[i-1])^.FMP   := Sum(PCell_Rec(Self.Items[i-1])^.FMP)   + Sum(Summa);
                                 if abs(FZP)>0.009 then
                                 PCell_Rec(Self.Items[i-1])^.FZP   := Sum(PCell_Rec(Self.Items[i-1])^.FZP)   + Sum(Summa);
                                 if abs(Other)>0.009 then
                                 PCell_Rec(Self.Items[i-1])^.Other := Sum(PCell_Rec(Self.Items[i-1])^.Other) + Sum(Summa);

                                 if ShifrList.IsAdd(Shifr) then
                                 if Abs(PCell_Rec(Self.Items[i-1])^.Summa -
                                    PCell_Rec(Self.Items[i-1])^.FZP   -
                                    PCell_Rec(Self.Items[i-1])^.FMP   -
                                    PCell_Rec(Self.Items[i-1])^.Other)>0.01 then

//                                 if Shifr<40 then
                                    Finded:=True;

                                 Finded:=True;
                                 break;
                            end
           end;
        if not finded then
           begin
                 New(Cell_Rec);
                 Cell_Rec^.Shifr  := Shifr;
                 Cell_Rec^.Period := Period;
                 Cell_Rec^.Summa  := sum(Summa);
                 Cell_Rec^.FMP    := sum(FMP);
                 Cell_Rec^.FZP    := sum(FZP);
                 Cell_Rec^.Other  := sum(Other);
                 Cell_Rec^.shifrBan := shifrBan;
                 Add(Cell_Rec);
                 if ShifrList.IsAdd(Shifr) then
                 if Abs(Cell_Rec^.SUMMA-Cell_Rec^.FZP-Cell_Rec^.FMP-Cell_Rec^.OTHER)>0.005 then
                    Finded:=False;
           end;
     end;


function TItemList.SummaItema:Real;
 var
     Summa:Real;
     I:Integer;
 begin
       Summa:=0;
       for i:=1 to Self.Count do
           Summa:=Summa+PCell_Rec(Self.Items[i-1])^.Summa;
       Result:=Summa;

 end;

function TItemList.SummaWantedItem(WantedShifr:Integer):Real;
 var
     Summa:Real;
     I:Integer;
 begin
       Summa:=0;
       for i:=1 to Self.Count do
           if PCell_Rec(Self.Items[i-1])^.Shifr=WantedShifr then
              begin
                   Summa:=PCell_Rec(Self.Items[i-1])^.Summa;
                   break;
              end;
       Result:=Summa;

 end;

  function TNeedPodrList.IsNeedPodr(ShifrPod:integer):boolean;
   var i           : integer;
       NeedPodrRec : PNeedPodrRec;
   begin
        IsNeedPodr:=false;
        for i:=1 to Self.Count do
            if PNeedPodrRec(Self.Items[i-1])^.ShifrPod=ShifrPod then
               begin
                    IsNeedPodr:=true;
                    Exit;
               end;
   end;

{ **************************************************** }
{ *     Создание  отчета  по  всем  подразделениям   * }
{ **************************************************** }
PROCEDURE MAKE_MAIN_SWOD(Select_Key:Integer;Select_Bay_Mode:Integer;
                         SelectedBay:integer;NameBay:String;NeedDogPod:boolean;
                         TotalMode:boolean;
                         PrintMode:integer;
                         ModeIllSS:integer;
                         SwodSowmMode:integer;
                         ChernobMode:integer);
VAR
    I,J,II,III:INTEGER;
    S_SUMMA_invalidy:REAL;
    S_SUMMA,U_SUMMA,S_FMP,S_FZP,S_OTHER,
    s_summa_MP_31,s_summa_vyh_pos_23,
    s_summa_MP_NE_31,
    s_summa_pogr_165:REAL;
    s_summa_lt_min_sal:Real;
    s_summa_kompens_1:Real;
    s_summa_gt_max_sal:Real;

    SL,ISS:BOOLEAN;
    DEV:TEXT;
    VYDACHA,DOLG,OST_DOLGA:REAL;
    NMES_TEMP,NSRV_TEMP:INTEGER;
    SELECTED_MODE:INTEGER;
    TOTAL_PODR_SBRK:REAL;
    TOTAL_SBRK:REAL;
    JIJI:INTEGER;
    TOTAL_BETWEEN:REAL;
    PRNTR:BOOLEAN;
    T_KATEG:ARRAY[1..MAX_KAT] OF REAL;
    T_GRUPPA:ARRAY[1..MAX_GRUPPA] OF REAL;
    XT,YT:INTEGER;
    FILL:CHAR;
    SUMMS:REAL;
    LAST_NSRV:integer;
    FName:String;
 //   ItemAddList  : TItemList;
 //   ItemUdList   : TItemList;
    NeedPodrList : TNeedPodrList;
    AddList:TStringList;
    UdList:TStringList;
    Detail_Swod:boolean;
    SummaTot:real;
    NameSQL:WideString;
    NameSwod:string;
    footerStr:widestring;
    footerInvalidy:string;

{    DevT:TextFile;}

FUNCTION CALC_NACH(CURR_PERSON:PERSON_PTR):REAL;
 VAR CURR_ADD:ADD_PTR;
     B:REAL;
 BEGIN
     B:=0;
     Curr_Add:=Curr_Person^.ADD;
     while (Curr_Add<>Nil) do
        BEGIN
              B:=SUM(B)+SUM(CURR_ADD^.SUMMA);
              Curr_Add:=Curr_Add^.NEXT;
        END;
     CALC_NACH:=SUM(B);
 END;
FUNCTION CALC_UD(CURR_PERSON:PERSON_PTR):REAL;
 VAR CURR_UD:UD_PTR;
     B:REAL;
 BEGIN
     B:=0;
     Curr_Ud:=Curr_Person^.Ud;
     while (Curr_Ud<>Nil) DO
        BEGIN
              B:=SUM(B)+SUM(CURR_UD^.SUMMA);
              Curr_Ud:=Curr_Ud^.NEXT;
        END;
     CALC_UD:=SUM(B);
 END;

PROCEDURE F89_HAT(var NameSQL:WideString);
VAR DEW:TextFile;
    S:STRING;
    I:INTEGER;
BEGIN
     NameSQL:='';
     ASSIGN(DEW,CDIR+'LABEL.TXT');
     IF FILEEXIST(CDIR+'LABEL.TXT') THEN
        BEGIN
             RESET(DEW);
             WHILE NOT EOF(DEW) DO
              BEGIN
                   READLN(DEW,S);
                   WRITELN(DEV,DOSTOWIN(S));
              END;
             CLOSE(DEW);
        END;
WRITELN(DEV,' ');
WRITELN(DEV,'              СВОДНАЯ РАСЧЕТНАЯ ВЕДОМОСТЬ ПО ЗАРАБОТНОЙ ПЛАТЕ         ЭКЗ. N 1    ЛИСТ N 1');
WRITELN(DEV,' ');
WRITELN(DEV,'                                                     ЗА ',TRIM(MONTH[NMES])+' '+IntToStr(Work_Year_Val)+' г.');
WRITELN(DEV,'   ');
NameSQL:='Свод за '+TRIM(MONTH[NMES])+' '+IntToStr(Work_Year_Val)+' г.';
if TotalMode then
  begin
       writeln(Dev,'свод по всем подразделениям, всем начислениям и все удержаниям');
       NameSQL:=Trim(NameSQL)+' по всем подразделениям, всем начислениям и все удержаниям';
  end
else
    begin
IF SELECTED_MODE=2 THEN BEGIN      {По источникам финансирования}
                             WRITE(DEV,'       Источники финансирования - ');
                             NameSQL:=Trim(nameSQL)+'. Источники финансирования - ';
                             FOR I:=1 TO MAX_GRUPPA DO
                                IF CURR_GRUPPA[I] THEN
                                   begin
                                        WRITE(DEV,' ',Get_Ist_Name(i),' ');
                                        NameSQL:=Trim(NameSQL)+' '+trim(Get_Ist_Name(i));
                                   end;
                        END;
IF SELECTED_MODE=3 THEN BEGIN      {По категориям работников}
                             WRITE(DEV,'Категории работников - ');
                             nameSQL:=Trim(nameSQL)+'. Категории работников - ';
                             FOR I:=1 TO MAX_KATEGORIJA DO
                               IF CURR_KATEGORIJA[I] THEN
                                  begin
                                       WRITE(DEV,GET_KAT_NAME(I));
                                       NameSQL:=Trim(NameSQL)+' '+trim(GET_KAT_NAME(I));
                                  end;
                        END;
IF SELECTED_MODE=4 THEN BEGIN      {По категориям работников и по группам}
                             WRITE(DEV,'Категории работников - ');
                             nameSQL:=Trim(nameSQL)+'. Категории работников - ';
                             FOR I:=1 TO MAX_KATEGORIJA DO
                               IF CURR_KATEGORIJA[I] THEN
                                  begin
                                       WRITE(DEV,GET_KAT_NAME(I));
                                       NameSQL:=Trim(NameSQL)+' '+trim(GET_KAT_NAME(I));
                                  end;
                             WRITELN(DEV);
                             WRITE(DEV,'       Источники финансирования - ');
                             nameSQL:=nameSQL+'. Источники финансирования - ';
                             FOR I:=1 TO MAX_GRUPPA DO
                                 IF CURR_GRUPPA[I] THEN
                                    begin
                                         WRITE(DEV,' ',Get_Ist_Name(i),' ');
                                         NameSQL:=Trim(NameSQL)+' '+trim(Get_Ist_Name(i));
                                    end;
                        END;
IF SELECTED_MODE=5 THEN BEGIN      {Сохраненный отчет}
                             WRITEln(DEV,NameBAY);
                             WRITE(DEV,'Счета - ');
                             nameSQL:=Trim(nameSQL)+' '+trim(NameBay)+' Счета - ';
                             FOR I:=1 TO MAX_KATEGORIJA DO
                               IF CURR_KATEGORIJA[I] THEN
                                  begin
                                       WRITE(DEV,GET_KAT_NAME(I));
                                       NameSQL:=Trim(NameSQL)+' '+trim(GET_KAT_NAME(I));
                                  end;
                             WRITELN(DEV);
                             WRITE(DEV,'       Источники финансирования - ');
                             FOR I:=1 TO MAX_GRUPPA DO
                                 IF CURR_GRUPPA[I] THEN
                                    begin
                                         WRITE(DEV,' ',Get_Ist_Name(i),' ');
                                         NameSQL:=Trim(NameSQL)+' '+trim(Get_Ist_Name(i));
                                    end;
                        END;
if (swod_mode=invalid_swod) then
   begin
     //   writeln(dev,' Инвалиды (включая коледж)');
     //   nameSQL:=Trim(nameSQL)+' Инвалиды (включая коледж)';
        writeln(dev,' Инвалиды');
        nameSQL:=Trim(nameSQL)+' Инвалиды';
   end
                            else
if (swod_mode=pens_swod) then
   begin
    //    writeln(dev,' Пенсионеры (включая коледж)');
    //    nameSQL:=Trim(nameSQL)+' Пенсионеры (включая коледж)';
        writeln(dev,' Пенсионеры');
        nameSQL:=Trim(nameSQL)+' Пенсионеры';
   end
                else WRITELN(DEV,' ');
if Select_Bay_Mode=2 then
   begin
        writeln(Dev,' по участку '+NameBay);
//        nameSQL:=Trim(nameSQL)+' по Пенсионеры (включая коледж)';
        nameSQL:=Trim(nameSQL)+' по участку '+NameBay;

   end
                     else
if Select_Bay_Mode=3 then
   begin
        writeln(Dev,' по '+Name_Serv(SelectedBay));
        nameSQL:=Trim(nameSQL)+' '+trim(Name_Serv(SelectedBay));
   end;
if ModeIllSS=0 then
   begin
       writeln(Dev,' больничные включены');
       nameSQL:=Trim(nameSQL)+' больничные включены';
   end;
if ModeIllSS=1 then
   begin
       writeln(Dev,' больничные не включены');
       nameSQL:=Trim(nameSQL)+' больничные не включены';
   end;
if ModeIllSS=2 then
   begin
        writeln(Dev,' больничные соц.страх.');
        nameSQL:=Trim(nameSQL)+' больничные соц.страх.';
   end;
case SwodSowmMode of
 1 : begin
          writeln(Dev,' Основное место работы');
          nameSQL:=Trim(nameSQL)+' Основное место работы';
     end;
 2 :
     begin
          writeln(Dev,' Совместители внутренние.');
          nameSQL:=Trim(nameSQL)+' Совместители внутренние.';
     end;
 3 :
     begin
           writeln(Dev,' Совместители внешние');
           nameSQL:=Trim(nameSQL)+' Совместители внешние.';
     end;
else
     begin
          writeln(Dev,' Основные и совместители');
          nameSQL:=Trim(nameSQL)+' Основные и совместители';
     end;
end;
end;
WRITELN(DEV,' ');
WRITELN(DEV,'----------------------------------------------------------------------------------------------------------------------------');
WRITELN(DEV,':                       Н   А   Ч   И   С   Л   Е   Н   И   Я                    :    У   Д   Е   Р   Ж   А   Н   И   Я    :');
WRITELN(DEV,'----------------------------------------------------------------------------------------------------------------------------');
WRITELN(DEV,': Ш :       ВИД          : N :   СУММА    :             ИЗ     НИХ               : Ш :        ВИД         : N :   СУММА    :');
WRITELN(DEV,': И :                    :МЕ-:   ВСЕГО    :--------------------------------------: И :                    :МЕ-: УДЕРЖАНИЙ  :');
WRITELN(DEV,': Ф :     НАЧИСЛЕНИЙ     :СЯ-:  (ГРВ)     :   ФЗП      :   ФМП       :  652 б.л. : Ф :     УДЕРЖАНИЙ      :СЯ-:   (ГРВ)    :');
WRITELN(DEV,': Р :                    :ЦА :            :  КЕКВ 1111 : КЕКВ  1113  : КЕКВ 1120 : Р :                    :ЦА :            :');
WRITELN(DEV,'----------------------------------------------------------------------------------------------------------------------------');
END;

PROCEDURE MK_SWOD;
VAR I,J,II,KOD  : INTEGER;
    CURR_PERSON : PERSON_PTR;
    CURR_ADD    : ADD_PTR;
    CURR_UD     : UD_PTR;
    A,B         : REAL;
    SUMMA_P     : REAL;
    S_DOLG      : REAL;
    SummaPodr   : real;
    stop        : Boolean;
BEGIN
  SummaPodr:=0;
  Curr_Person:=Head_Person;
  if NSRV=106 then
     Curr_Person:=Head_Person;

  while (Curr_Person<>Nil) DO
     BEGIN
           if SWOD_MODE=INVALID_SWOD then
              if not PensionerList.IsPensioner(Curr_Person^.Tabno) then
                 begin
                      Curr_Person:=Curr_Person^.NEXT;
                      continue;
                 end;
           if SWOD_MODE=pens_SWOD then
              if not PensionerList.IsPensioner(Curr_Person^.Tabno) then
                 begin
                      Curr_Person:=Curr_Person^.NEXT;
                      continue;
                 end;
   // ---------- Проверить больничные 10 01 2011 -------------

           case ModeIllSS of
            1 :                   // не включать больничные
                if Get_Dol_Code(Curr_Person)=1500 then
                   begin
                        Curr_Person:=Curr_Person^.NEXT;
                        continue;
                   end;
            2 :                   // включать только больничные +
                                  //   165
                if not ((Get_Dol_Code(Curr_Person)=1500) or
                   (NSRV=165)) then
                   begin
                        Curr_Person:=Curr_Person^.NEXT;
                        continue;
                   end;
           end;
           if (ChernobMode=0) and (not TotalMode) and (Curr_Person^.GRUPPA=ChernobSchet) then
              begin
                   Curr_Person:=Curr_Person^.NEXT;
                   continue;
              end;

           if SwodSowmMode=1 then // только основные
              begin
                   if not IS_OSN_WID_RABOTY(CURR_PERSON) then
                      begin
                           Curr_Person:=Curr_Person^.NEXT;
                           continue;
                      end;
              end;
           if SwodSowmMode=2 then // совместители внутренние
              begin
                   if ((IS_OSN_WID_RABOTY(CURR_PERSON)) or
                       (storonnee_podrazd(Nomer_Serv(CURR_PERSON^.MESTO_OSN_RABOTY)))) then
                       begin
                            Curr_Person:=Curr_Person^.NEXT;
                            continue;
                       end;
              end;
           if SwodSowmMode=3 then // совместители внешние
              begin
                   if ((IS_OSN_WID_RABOTY(CURR_PERSON)) or
                       (not storonnee_podrazd(Nomer_Serv(CURR_PERSON^.MESTO_OSN_RABOTY)))) then
                       begin
                            Curr_Person:=Curr_Person^.NEXT;
                            continue;
                       end;
              end;
   // ---------------------------------------------

           SUMMA_P:=0;
            If (TotalMode) or (NeedDogPod or ((not NeedDogPod) and (not DOG_POD_PODRAZD(NSRV)))) then
            IF ((SELECTED_MODE=1) AND (NOT SOWM_SWOD))
               or ((SELECTED_MODE=1) AND (SOWM_SWOD) AND (storonnee_podrazd(Nomer_Serv(CURR_PERSON^.MESTO_OSN_RABOTY))))
{------------------  убрать договора подряда из проверки 13 12 2009
              OR ((not DOG_POD_PODRAZD(NSRV)) AND (SELECTED_MODE=2) AND (CURR_GRUPPA[CURR_PERSON^.GRUPPA]))
              OR ((not DOG_POD_PODRAZD(NSRV)) AND (SELECTED_MODE=3) AND (CURR_KATEGORIJA[CURR_PERSON^.KATEGORIJA]))
              OR ((not DOG_POD_PODRAZD(NSRV)) AND
                  (SELECTED_MODE=4)       AND
                  (CURR_KATEGORIJA[CURR_PERSON^.KATEGORIJA]) AND
                  (CURR_GRUPPA[CURR_PERSON^.GRUPPA]))
              OR ((not DOG_POD_PODRAZD(NSRV)) AND (SELECTED_MODE=3) AND (CURR_KATEGORIJA[8])) THEN
}
              OR ((SELECTED_MODE=2) AND (CURR_GRUPPA[CURR_PERSON^.GRUPPA]))
              OR ((SELECTED_MODE=3) AND (CURR_KATEGORIJA[CURR_PERSON^.KATEGORIJA]))
              OR ((SELECTED_MODE=4)       AND
                  (CURR_KATEGORIJA[CURR_PERSON^.KATEGORIJA]) AND
                  (CURR_GRUPPA[CURR_PERSON^.GRUPPA]))
              OR ((SELECTED_MODE=3) AND (CURR_KATEGORIJA[8]))
              OR ((SELECTED_MODE=5) AND    { сохраненные отчеты }
                  (CURR_KATEGORIJA[CURR_PERSON^.KATEGORIJA]) AND
                  (CURR_GRUPPA[CURR_PERSON^.GRUPPA]))
              OR (TOTALMODE=TRUE) THEN
              begin
                    A:=SUM(CALC_NACH(CURR_PERSON));
                    B:=SUM(CALC_UD(CURR_PERSON));
                    a:=r10(a);
                    b:=r10(b);
                    S_DOLG:=0;
                    CURR_UD:=CURR_PERSON^.UD;
                     WHILE CURR_UD<>NIL DO
                      BEGIN
                           IF CURR_UD^.SHIFR=DOLG_ZA_RABOCHIM_SHIFR THEN
                           IF CURR_UD^.SUMMA>0.0099                 THEN S_DOLG:=S_DOLG+CURR_UD^.SUMMA;
                           CURR_UD:=CURR_UD^.NEXT;
                      END;
                    IF (A-B)>0.0099 THEN VYDACHA:=SUM(VYDACHA)+A-B
                                    ELSE
                       BEGIN
                             DOLG:=R10(DOLG)+R10(B)-R10(A);
                             DOLG:=R10(DOLG);
                             if Abs(DOLG)>0.0051 then
                                stop:=True;
                             OST_DOLGA:=OST_DOLGA+(GET_OLD_DOLG(CURR_PERSON)-S_DOLG);
                       END;
                     Curr_Add:=Curr_Person^.ADD;
                     while (Curr_Add<>Nil) do
                      BEGIN
                           KOD:=CURR_ADD^.SHIFR;
                           if isSVDN then
                           case KOD of                   // 25 05 2015
                             DogPodShifr,Prem_Sotr_Shifr : KOD:=OKLAD_SHIFR;
                           end;
                           if Swod_Mode=Pens_Swod then
                              if KOD=FOND_Z_SHIFR THEN
                                 begin
                                      Curr_Add:=Curr_Add^.Next;
                                      continue;
                                 end;
                           IF NOT (CURR_ADD^.SHIFR IN [BOL_TEK_SHIFR         ,
                                                       BOL_FUTURE_SHIFR      ,
                                                       BOL_PROSHL_SHIFR      ,
                                                       KASSA_SHIFR           ,
                                                       ZA_STRAH_VZNOCY_SHIFR ,
                                                       DEKRET_SHIFR])
                                                       THEN
                              SUMMA_P:=SUMMA_P+SUM(CURR_ADD^.SUMMA);
                           IF KOD=HOLIDAY_FLOW_SHIFR THEN
                              IF (CURR_ADD^.PERIOD>NMES) OR (ABS(CURR_ADD^.PERIOD-NMES)>6) THEN
                                 KOD:=HOLIDAY_FUTURE_SHIFR;
                           if not Detail_Swod then Curr_Add^.Period:=nmes;
                           if Curr_Person^.Tabno=4107 then
                              SummaTot:=SummaTot;
                           SummaTot:=SummaTot+Sum(Curr_Add^.Summa);
                           ItemAddList.AddItem(Kod,Curr_Add^.PERIOD,Curr_Add^.Summa,Curr_Add^.FZP,Curr_Add^.FMP,Curr_Add^.Other,0);
                           SQLSwodClass.AddItemAdd(CURR_ADD,NSRV);

                           SummaPodr:=ItemAddList.SummaItema;
                           if abs(SummaTot-SummaPodr)>0.01 then
                              SummaTot:=SummaTot;
{                           Summapodr:=SummaPodr+SUM(CURR_ADD^.SUMMA);}
                           Curr_Add:=Curr_Add^.NEXT;
                      END;
                     Curr_Ud:=Curr_Person^.UD;
                     while (Curr_Ud<>Nil) do
                       BEGIN
                            if Curr_Person^.Tabno=4104 then
                               Curr_Ud^.SUMMA:=Curr_Ud^.SUMMA;
                            KOD:=CURR_UD^.SHIFR;
                            if Swod_Mode=Pens_Swod then
                               if KOD=FOND_Z_SHIFR THEN
                                  begin
                                        Curr_Ud:=Curr_Ud^.NEXT;
                                        continue;
                                  end;
                            IF KOD IN [GOSSTRAH1_SHIFR..GOSSTRAH4_SHIFR,
                                       GOSSTRAH5_SHIFR,GOSSTRAH6_SHIFR] THEN KOD:=GOSSTRAH1_SHIFR;
                            if not Detail_Swod then Curr_Ud^.Period:=nmes;
                            ItemUdList.AddItem(Kod,Curr_Ud^.Period,Curr_Ud^.Summa,0,0,0,Curr_Person^.Bank);
                            SQLSwodClass.AddItemUd(CURR_Ud,NSRV,CURR_PERSON);

                            Curr_Ud:=Curr_Ud^.NEXT;
                       END;
              end;
         Curr_Person:=Curr_Person^.NEXT;
     END;
END;
PROCEDURE FOOTER;
VAR S:STRING;
    T,TT:STRING;
    dt:TDateTime;
BEGIN
    WRITELN(DEV,'-----------------------------------------------------------------------------------------------------------------------');
    STR(TOTAL_ADD_SHIFR:3,T);
    S:=':'+T+':ВСЕГО НАЧИСЛЕНО     :   :';
    T:=FORMAT_S(S_SUMMA,12);
    S:=S+T+':';
    T:=FORMAT_S(S_FZP,12);
    S:=S+T+':';
    T:=FORMAT_S(S_FMP,12);
    S:=S+T+':';
    T:=FORMAT_S(S_OTHER,12);
    S:=S+T+':';
    STR(COUNT_SHIFR:3,T);
    S:=S+T+':ВСЕГО УДЕРЖАНО      :   :';
    T:=FORMAT_S(U_SUMMA,12);
    S:=S+T+':';
    WRITELN(DEV,S);
    WRITELN(DEV,'-----------------------------------------------------------------------------------------------------------------------');
    S:=':   :К ВЫДАЧЕ            :   :';
    T:=FORMAT_S(VYDACHA,12);
    TT:=FORMAT_S(OST_DOLGA,12);
    S:=S+T+':            :ДОЛГ (ОСТ) :'+TT;
    S:=S+':   :ДОЛГ ЗА РАБОЧИМ     :   :';
    T:=FORMAT_S(DOLG,12);
    S:=S+T+':';
    WRITELN(DEV,S);
    WRITELN(DEV,'-----------------------------------------------------------------------------------------------------------------------');
    if isSVDN then
       begin
            if SWOD_MODE=INVALID_SWOD then
               begin
                    Writeln(dev,footerInvalidy);
                    getSVDNFooterRec;
                    SVDNfooterRec.summa_invalidy:=S_SUMMA;
                    dt:=Time;
                    SVDNfooterRec.dtsumma_invalidy:=date;
                    SVDNfooterRec.dtsumma_invalidy:=recodeTime(SVDNfooterRec.dtsumma_invalidy,hourOf(dt),MinuteOf(dt),SecondOf(dt),0);
                    putSVDNFooterRec;
               end;
            if not (
                (SWOD_MODE=INVALID_SWOD)
                or
                (SWOD_MODE=PENS_SWOD)
                or TotalMode
                )
             then
              begin
                   Writeln(dev,'Начислено                   - '+trim(FormatFloatPoint(S_SUMMA)));
                   Writeln(dev,'Мат помощь(31)              - '+trim(FormatFloatPoint(s_summa_MP_31)));;
                   Writeln(dev,'Мат помощь(141)             - '+trim(FormatFloatPoint(s_summa_MP_NE_31)));
                   Writeln(dev,'Выхолное пособие (23)       - '+trim(FormatFloatPoint(s_summa_vyh_pos_23)));
                   Writeln(dev,'Компенсация 1               - '+trim(FormatFloatPoint(s_summa_kompens_1)));
                   Writeln(dev,'Помощь на погребение (165)  - '+trim(FormatFloatPoint(s_summa_pogr_165)));
                   Writeln(dev,'Инвалиды                    - '+trim(FormatFloatPoint(SVDNfooterRec.summa_invalidy)));
                   Writeln(dev,'Превышение лимита           - '+trim(FormatFloatPoint(SVDNfooterRec.summa_gt_max_sal)));
                   Writeln(dev,'Доплата до минимальной з.п. - '+trim(FormatFloatPoint(SVDNfooterRec.summa_lt_min_sal)));
                   Writeln(dev,footerStr);
              end;
       end;
    WRITELN(DEV,' ');
    WRITELN(DEV,GL_BUH_DOLG_NAME);
END;
Procedure MakeStringLists;
 var I:Integer;
     S,S1:String;
     L_a,L_u:integer;
     nameBan:string;
 begin
       ItemAddList.Sort(@CompareItems);
       ItemUdList.Sort(@CompareItems);
       AddList := TStringList.Create;
       UdList  := TStringList.Create;
       
       for i:=1 to ItemAddList.Count do
           begin
                 str(PCell_Rec(ItemAddList.Items[i-1]).Shifr:3,s);
                 s:=':'+S+':';
                 S1:=copy(ShifrList.GetName(PCell_Rec(ItemAddList.Items[i-1]).Shifr)+space(20),1,20);
                 S:=S+S1+':';
                 str(PCell_Rec(ItemAddList.Items[i-1]).Period:3,s1);
                 S:=S+S1+':';
                 S1:=Format_se(PCell_Rec(ItemAddList.Items[i-1]).Summa,12);
                 S:=S+S1+':';
                 S1:=Format_se(PCell_Rec(ItemAddList.Items[i-1]).FZP,12);
                 S:=S+S1+':';
                 S1:=Format_se(PCell_Rec(ItemAddList.Items[i-1]).FMP,12);
                 S:=S+S1+':';
                 S1:=Format_se(PCell_Rec(ItemAddList.Items[i-1]).Other,12);
                 S:=S+S1+':';
                 AddList.Add(S);
    //             if ((NSRV<>105) and (NSRV<>106)) then
                 if PCell_Rec(ItemAddList.Items[i-1]).Shifr=31 then
                    begin
                         s_summa_MP_31:=SUM(s_summa_MP_31)+Sum(PCell_Rec(ItemAddList.Items[i-1]).Summa);
                    end;
                 if PCell_Rec(ItemAddList.Items[i-1]).Shifr=141 then
                    begin
                         s_summa_MP_NE_31:=SUM(s_summa_MP_NE_31)+Sum(PCell_Rec(ItemAddList.Items[i-1]).Summa);
                    end;
//                 if ((NSRV=105) or (NSRV=106)) then
//                 if PCell_Rec(ItemAddList.Items[i-1]).Shifr<>31 then
//                    begin
//                         s_summa_MP_NE_31:=SUM(s_summa_MP_NE_31)+Sum(PCell_Rec(ItemAddList.Items[i-1]).Summa);
//                    end;
                 if PCell_Rec(ItemAddList.Items[i-1]).Shifr=23 then
                    begin
                         s_summa_vyh_pos_23:=SUM(s_summa_vyh_pos_23)+Sum(PCell_Rec(ItemAddList.Items[i-1]).Summa);
                    end;
                 if NSRV=165 then
                    begin
                         s_summa_pogr_165:=SUM(s_summa_pogr_165)+Sum(PCell_Rec(ItemAddList.Items[i-1]).Summa);
                    end;
                 if PCell_Rec(ItemAddList.Items[i-1]).Shifr=167 then
                    begin
                         s_summa_kompens_1:=SUM(s_summa_kompens_1)+Sum(PCell_Rec(ItemAddList.Items[i-1]).Summa);
                    end;
//                 if pensionerList.IsPensioner(curr_person^.tabno) then
//                    begin
//                         s_summa_invalid:=SUM(s_summa_invalid)+Sum(PCell_Rec(ItemAddList.Items[i-1]).Summa);
//                    end;

                 S_SUMMA   := sum(S_SUMMA) + Sum(PCell_Rec(ItemAddList.Items[i-1]).Summa);
                 S_FZP     := sum(S_FZP)   + Sum(PCell_Rec(ItemAddList.Items[i-1]).FZP);
                 S_FMP     := sum(S_FMP)   + Sum(PCell_Rec(ItemAddList.Items[i-1]).FMP);
                 S_OTHER   := sum(S_OTHER) + Sum(PCell_Rec(ItemAddList.Items[i-1]).Other);
                 if abs(S_SUMMA)-abs(S_FZP)-abs(S_FMP)-ABS(S_OTHER)>0.005 then
                    S:=S;
                 if abs(PCell_Rec(ItemAddList.Items[i-1]).Summa)-abs(PCell_Rec(ItemAddList.Items[i-1]).FZP)>0.005 then
                    S:=S;
                 S1:=copy(ShifrList.GetName(PCell_Rec(ItemAddList.Items[i-1]).Shifr)+space(20),1,20);
                 if Length(S1)<21 then continue;
                 S1:=copy(S1+Space(20),21,20);
                 S:=':   :'+S1+':   :'+Space(12)+':'+space(12)+':'+Space(12)+':';
                 AddList.Add(S);
           end;
       for i:=1 to ItemUdList.Count do
           begin
                 str(PCell_Rec(ItemUdList.Items[i-1]).Shifr:3,s);
                 s:=S+':';
                 S1:=copy(ShifrList.GetName(PCell_Rec(ItemUdList.Items[i-1]).Shifr)+space(20),1,20);
                 nameBan:='';
                 if PCell_Rec(ItemUdList.Items[i-1]).shifrban>0 then
                    nameBan:=Trim(BankiList.getBankName(PCell_Rec(ItemUdList.Items[i-1]).shifrban));
                 if Length(Trim(nameBan))>0 then
                    s1:=Copy(Trim(nameBan)+space(11),1,11)+' '+s1; //+space(20),1,20)
                 S:=S+S1+':';
                 str(PCell_Rec(ItemUdList.Items[i-1]).Period:3,s1);
                 S:=S+S1+':';
                 S1:=Format_Se(PCell_Rec(ItemUdList.Items[i-1]).Summa,12);
                 S:=S+S1+':';
                 UdList.Add(S);
                 U_SUMMA   := sum(U_SUMMA) + Sum(PCell_Rec(ItemUdList.Items[i-1]).Summa);
                 S1:=copy(ShifrList.GetName(PCell_Rec(ItemUdList.Items[i-1]).Shifr)+space(20),1,20);
                 if Length(S1)<21 then continue;
                 S1:=copy(S1+Space(20),21,20);
                 S:='   :'+S1+':   :'+Space(12)+':';
                 UdList.Add(S);
           end;
       if AddList.Count>UdList.Count then
          begin
               L_a := AddList.Count;
               L_u := UdList.Count;
               S := '   :'+Space(20)+':   :'+Space(12)+':';
               for i:=1 to L_a-L_u do UdList.Add(S);
          end
       else if AddList.Count<UdList.Count then
          begin
               L_a := AddList.Count;
               L_u := UdList.Count;
               S := ':   :'+space(20)+':   :'+Space(12)+':'+space(12)+':'+Space(12)+':'+Space(12)+':';
               for i:=1 to L_u-L_a do AddList.Add(S);
          end
 end;
function Is_Need_This_Serv(I:INTEGER):BOOLEAN;
 begin
      if TotalMode then
         begin
              Is_Need_This_Serv:=true;
              exit;
         end;
      if Select_Key=5 then { Сохраненный отчет }
         begin
              if NameServList.IsSelected(i) then
                 Is_Need_This_Serv:=true
              else
                 Is_Need_This_Serv:=false;
              exit;
         end;
   //   if (Swod_Mode=Pens_Swod) or (Swod_Mode=Invalid_Swod) then Is_Need_This_Serv:=true
   //                                                        else

      if NeedPodrList.IsNeedPodr(I) then Is_Need_This_Serv:=true
                                    else Is_Need_This_Serv:=false;
      if  modeIskra then
      if not (IsIskraPodr(i)) then
         is_need_this_serv:=False;                              
      if  not modeIskra then
      if (IsIskraPodr(i)) then
         is_need_this_serv:=False;
 end;

PROCEDURE INIT_NEED_SERV_BAY;
var I:Integer;
    NeedPodrRec:PNeedPodrRec;
BEGIN
     KZ:=0;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('SELECT ShifrPod FROM BAY WHERE ShifrBuh='+IntToSTr(SelectedBay));
     FIB.pFIBTransactionSAL.StartTransaction;
     try
        FormWait.Show;
        Application.ProcessMessages;
        FIB.pFIBQuery.ExecQuery;
{        FIB.pFIBQuery.First;    }
        while not FIB.pFIBQuery.Eof do
              begin
                   I:=FIB.pFIBQuery.Fields[0].AsInteger;
                   New(NeedPodrRec);
                   NeedPodrRec.ShifrPod := I;
                   NeedPodrList.Add(NeedPodrRec);
                   FIB.pFIBQuery.Next;
              end;
        FormWait.Hide;
        FIB.pFIBQuery.Close;
     except
           MessageDlg('Ошибка получения списка подразделений для участка',mtInformation, [mbOk], 0);
           KZ:=-1;
           Exit;
     end;
     FIB.pFIBTransactionSAL.Commit;
END;
PROCEDURE INIT_NEED_SERV;
var NeedPodrRec:PNeedPodrRec;
BEGIN
     KZ:=0;
     New(NeedPodrRec);
     NeedPodrRec.ShifrPod := SelectedBay;
     NeedPodrList.Add(NeedPodrRec);
END;

PROCEDURE  INIT_NEED_THIS_SERV;
 VAR I,J : Integer;
     DEV : TextFile;
     S   : String;
     NeedPodrRec:PNeedPodrRec;
 BEGIN
      KZ:=0;
      IF NOT FILEEXIST(CDIR+'_SWOD.TXT') THEN
         BEGIN
              KZ:=-1;
              EXIT;
         END;
      ASSIGN(DEV,CDIR+'_SWOD.TXT');
      RESET(DEV);
      READLN(DEV);
      WHILE NOT EOF(DEV) DO
       BEGIN
            READLN (DEV,  S);
            VAL  (S, I, J);
            if J=0           then
            if I>0           then
            if I<=COUNT_SERV then
               begin
                    New(NeedPodrRec);
                    NeedPodrRec.ShifrPod := I;
                    NeedPodrList.Add(NeedPodrRec);
               end;
       END;
      CLOSE(DEV);

      { Включить договора подряда, если отмечена птичка ДОГОВОРА ПОДРЯДА }
      { 10 01 2012 }
      if NeedDogPod then
         for i:=1 to Count_Serv do
             if DOG_POD_PODRAZD(i) then
               if not IsColedgPodr(Nsrv) then
                if not Is_Need_This_Serv(i) then
                   if not (isLNR and isGKH and not isGKHPodr(i)) then
                   begin
                         New(NeedPodrRec);
                         NeedPodrRec.ShifrPod := I;
                         NeedPodrList.Add(NeedPodrRec);
                   end;

      { Включить 165 если только боличные и СС ModeIllSS=2 }
      { 23 10 2013 }
      if not Is_Need_This_Serv(165) then
      if not (isLNR and isGKH) then
          begin
               New(NeedPodrRec);
               NeedPodrRec.ShifrPod := 165;
               NeedPodrList.Add(NeedPodrRec);
          end;
 END;

procedure Fill_Curr_Gru_And_Kat;
 var i:integer;
 begin
      for i:=1 to MAX_KATEGORIJA do CURR_KATEGORIJA[i]:=false;
      for i:=1 to MAX_GRUPPA     do CURR_GRUPPA[i]:=false;
      for i:=1 to GruppyList.Count do
          if GruppyList.IsSelected(i) then
             CURR_GRUPPA[i]:=true;
      for i:=1 to KategList.Count do
          if KategList.IsSelected(i) then
             CURR_KATEGORIJA[i]:=true;
 end;



procedure SwodToExcel;
var E,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    L_U,L_A,L_M,I:Integer;
    nameBan,nameSta:string;
begin
     FName:=TemplateDIR+'MainSwod.xls';
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
     L_A:=ItemAddList.Count;
     L_U:=ItemUdList.Count;
     if L_A>L_U then L_M:=L_A else L_M:=L_U;
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     ExRow:=13;
     ExCol:=11;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=Dolg;
     ExCol:=04;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=VYDACHA;
     ExRow:=5;
     case Selected_Mode of
      2 : begin      { По источникам финансирования }
               S:='       Источники финансирования - ';
               for i:=1 to MAX_GRUPPA do
                   if CURR_GRUPPA[I] then
                      s:=s+' '+Get_Ist_Name(i)+' ';
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=S;
          end;
      3 : begin      { По категориям работников     }
              S:='Категории работников - ';
              for i:=1 to MAX_KATEGORIJA do
                  if CURR_KATEGORIJA[I] then
                      S:=S+' '+GET_KAT_NAME(I);
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=S;
          end;
      4 : begin      { По категориям работников и по группам}
              S:='Категории работников - ';
              for i:=1 to MAX_KATEGORIJA do
                  if CURR_KATEGORIJA[i] then
                     S:=S+' '+trim(GET_KAT_NAME(i));
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=S;
              S:='       Источники финансирования - ';
              for i:=1 to MAX_GRUPPA do
                  if CURR_GRUPPA[i] then
                      s:=s+' '+trim(Get_Ist_Name(i));
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,1]:=S;
          end;
      5 : begin   { сохраненные отчеты }
              S:=NameBay+' Категории работников - ';
              for i:=1 to MAX_KATEGORIJA do
                  if CURR_KATEGORIJA[i] then
                     S:=S+' '+trim(GET_KAT_NAME(i));
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=S;
              S:='       Источники финансирования - ';
              for i:=1 to MAX_GRUPPA do
                  if CURR_GRUPPA[i] then
                      s:=s+' '+trim(Get_Ist_Name(i));
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,1]:=S;
          end;
     end;  { CASE }
     S:='';
     if (swod_mode=invalid_swod) then
//         s:=' Инвалиды (включая коледж)'
         s:=' Инвалиды'
                                 else
     if (swod_mode=pens_swod) then
//        s:=' Пенсионеры (включая коледж)';
        s:=' Пенсионеры';
     if Select_Bay_Mode=2 then
        S:=S+' по участку '+NameBay
                          else
     if Select_Bay_Mode=3 then
        S:=S+' по '+Name_Serv(SelectedBay);
     ExRow:=4;
     S:=' в '+Trim(GetMonthRus(NMES))+' '+IntToStr(Work_Year_Val)+' г. '+S;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=S;

     ExRow:=10;
     for i:=0 to L_M-1 do
         begin
               Inc(ExRow);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1].Select;
               E.Selection.EntireRow.Insert;
               WC:=E.ActiveCell;
               if I<L_A then
                  begin
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=PCell_Rec(ItemAddList.Items[i]).Shifr;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=ShifrList.GetName(PCell_Rec(ItemAddList.Items[i]).Shifr);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=PCell_Rec(ItemAddList.Items[i]).Period;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=PCell_Rec(ItemAddList.Items[i]).Summa;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=PCell_Rec(ItemAddList.Items[i]).FZP;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=PCell_Rec(ItemAddList.Items[i]).FMP;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=PCell_Rec(ItemAddList.Items[i]).Other;
                  end;
               if I<L_U then
                  begin
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=PCell_Rec(ItemUdList.Items[i]).Shifr;
                       nameSta:=Trim(ShifrList.GetName(PCell_Rec(ItemUdList.Items[i]).Shifr));
                       if PCell_Rec(ItemUdList.Items[i]).shifrban>0 then
                          begin
                               nameBan:=Trim(BankiList.getBankName(PCell_Rec(ItemUdList.Items[i]).shifrban));
                               if length(Trim(nameBan))>0 then
                                  nameSta:=Trim(nameBan)+' '+trim(nameSta);
                          end;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]:=nameSta;
           //            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]:=ShifrList.GetName(PCell_Rec(ItemUdList.Items[i]).Shifr);
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10]:=PCell_Rec(ItemUdList.Items[i]).Period;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11]:=PCell_Rec(ItemUdList.Items[i]).Summa;
                       E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11]:=PCell_Rec(ItemUdList.Items[i]).Summa;
                  end;

          end;
     if not (isSVDN and TotalMode) then Exit;
     ExRow:=exRow+5;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,2]:='Нараховано';
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,4]:=S_SUMMA;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+2,2]:='Мат.допомога (31)';
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+2,4]:=s_summa_MP_31;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+3,2]:='Мат.допомога (141)';
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+3,4]:=s_summa_MP_NE_31;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+4,2]:='Вих.пособіє (23)';
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+4,4]:=s_summa_vyh_pos_23;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+5,2]:='Компенсация 1';
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+5,4]:=s_summa_kompens_1;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+6,2]:='Мат.допом.погр. (165)';
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+6,4]:=s_summa_pogr_165;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+7,2]:='Інваліди';
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+7,4]:=S_SUMMA_invalidy;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+8,2]:='З.п. вище макс.';
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+8,4]:=s_summa_gt_max_sal;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+9,2]:='Доплата до мин.з.п.';
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+9,4]:=s_summa_lt_min_sal;
     E.WorkBooks[1].WorkSheets[1].Cells[ExRow+10,2]:=FooterStr;


end;

//----------------------------------------------
function Swod_To_FR:boolean;
 begin
       Application.CreateForm(TFormSwodMNFR, FormSwodMNFR);
       FormSwodMNFR.Selected_Mode   := Selected_Mode;
       FormSwodMNFR.Select_Bay_Mode := Select_Bay_Mode;
       FormSwodMNFR.SelectedBay     := SelectedBay;
       FormSwodMNFR.NameBay         := NameBay;
       FormSwodMNFR.TotalMode       := TotalMode;
       FormSwodMNFR.SummaKVyd       := VYDACHA;
       FormSwodMNFR.SummaDolgOst    := OST_DOLGA;
       FormSwodMNFR.SummaDolgZaRab  := DOLG;
       FormSwodMNFR.ModeIllSS       := ModeIllSS;
       FormSwodMNFR.SwodSowmMode    := SwodSowmMode;
       FormSwodMNFr.S_SUMMA            := 0;
       FormSwodMNFr.s_summa_MP_31      := 0;
       FormSwodMNFr.s_summa_MP_NE_31   := 0;
       FormSwodMNFr.s_summa_kompens_1  := 0;
       FormSwodMNFr.s_summa_vyh_pos_23 := 0;
       FormSwodMNFr.s_summa_pogr_165   := 0;
       FormSwodMNFr.S_SUMMA_invalidy   := 0;
       FormSwodMNFr.s_summa_gt_max_sal := 0;
       FormSwodMNFr.s_summa_lt_min_sal := 0;
       FormSwodMNFr.footerStr          := '';
       if isSVDN and TotalMode then
          begin
               FormSwodMNFr.S_SUMMA            := S_SUMMA;
               FormSwodMNFr.s_summa_MP_31      := s_summa_MP_31;
               FormSwodMNFr.s_summa_MP_NE_31   := s_summa_MP_NE_31;
               FormSwodMNFr.s_summa_vyh_pos_23 := s_summa_vyh_pos_23;
               FormSwodMNFr.s_summa_kompens_1  := s_summa_kompens_1;
               FormSwodMNFr.s_summa_pogr_165   := s_summa_pogr_165;
               FormSwodMNFr.S_SUMMA_invalidy   := S_SUMMA_invalidy;
               FormSwodMNFr.s_summa_gt_max_sal := s_summa_gt_max_sal;
               FormSwodMNFr.s_summa_lt_min_sal := s_summa_lt_min_sal;
               FormSwodMNFr.footerStr          := footerStr;
          end;


  //     FormSwodMNFR.ShowModal;
       FormSwodMNFR.frxReport1.ShowReport;
       FormSwodMNFR.Free;
 //      FormSwodMNFR.ShowModal;
 end;

// ------------
// Внутрення процедура для формирования строки для Аллы
//  25 10 2016
 procedure  makeFooterForSVDN;
  var summa,r:real;
      s:string;
  begin
       getSVDNFooterRec;
       s_summa_invalidy:=SVDNFooterRec.summa_invalidy;
       s_summa_lt_min_sal:=SVDNFooterRec.summa_lt_min_sal;
       s_summa_gt_max_sal:=SVDNFooterRec.summa_gt_max_sal;
       summa:=SUM(S_summa)-sum(s_summa_MP_31)-sum(s_summa_MP_NE_31)-sum(s_summa_vyh_pos_23)-sum(s_summa_pogr_165)-sum(s_summa_invalidy)-sum(s_summa_gt_max_sal)-SUM(s_summa_kompens_1)+sum(s_summa_lt_min_sal);
(*
       footerStr:='Начислено - '+trim(FormatFloatPoint(S_SUMMA))+#13#10;
       footerStr:=trim(FooterStr)+'Мат помощь(31)              - '+trim(FormatFloatPoint(s_summa_MP_31))      + chr(13) + chr(10);
       footerStr:=trim(FooterStr)+'Мат помощь(141)             - '+trim(FormatFloatPoint(s_summa_MP_NE_31))   + chr(13) + chr(10);
       footerStr:=trim(FooterStr)+'Выхолное пособие (23)       - '+trim(FormatFloatPoint(s_summa_vyh_pos_23)) + chr(13) + chr(10);
       footerStr:=trim(FooterStr)+'Помощь на погребение (165)  - '+trim(FormatFloatPoint(s_summa_pogr_165))   + chr(13) + chr(10);
       footerStr:=trim(FooterStr)+'Инвалиды                    - '+trim(FormatFloatPoint(S_SUMMA_invalid))    + chr(13) + chr(10);
       footerStr:=trim(FooterStr)+'Превышение лимита           - '+trim(FormatFloatPoint(s_summa_gt_max_sal)) + chr(13) + chr(10);
       footerStr:=trim(FooterStr)+'Доплата до минимальной з.п. - '+trim(FormatFloatPoint(s_summa_lt_min_sal)) + chr(13) + chr(10);
       FooterStr:=trim(FooterStr)+'[';
*)
       FooterStr:='[';
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(S_SUMMA))+'-';
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(s_summa_MP_31))+'-';
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(s_summa_MP_NE_31))+'-';
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(s_summa_vyh_pos_23))+'-';
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(s_summa_kompens_1))+'-';
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(s_summa_pogr_165))+'-';
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(s_summa_invalidy))+'-';
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(s_summa_gt_max_sal))+'+';
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(s_summa_lt_min_sal));
       FooterStr:=trim(FooterStr)+']*22%=';
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(summa))+'*22%=';
       r:=sum(sum(summa)*0.22);
       FooterStr:=trim(FooterStr)+trim(FormatFloatPoint(r));
  end;


 procedure  makeFooterInvalidyForSVDN;
  var summa,r:real;
      s:string;
  begin
       summa:=SUM(S_summa);
       FooterInvalidy:=trim(FormatFloatPoint(S_SUMMA))+'*8.41%=';
       r:=sum(sum(summa)*0.0841);
       FooterInvalidy:=trim(FooterInvalidy)+trim(FormatFloatPoint(r));
  end;


//  -- Конец изменений от 25 10 2016

//----------------------------------------------










BEGIN
{     assignfile(devt,cdoc+'t.txt');
     Rewrite(devt);
}
     MUST_SHOW_IO_TABLE:=FALSE;
     KZ            := 0 ;
     SUMMS         := 0 ;
     SELECTED_MODE := SELECT_KEY;
     IF ((SELECTED_MODE>5) OR (SELECTED_MODE<1)) THEN EXIT;
     NMES_TEMP:=NMES;
     NSRV_TEMP:=NSRV;
     if (SWOD_MODE=PENS_SWOD)    THEN MAKEPENSLIST(1);
     if (SWOD_MODE=INVALID_SWOD) THEN MAKEPENSLIST(2);
     NeedPodrList := TNeedPodrList.Create;
     if Select_Bay_Mode=3 then     { По отдельным подразделениям }
        INIT_NEED_SERV
                          else
     if Select_Bay_Mode=2 then     { По участкам                 }
        INIT_NEED_SERV_BAY
                          else
        Init_Need_This_Serv;       { По университету             }
     if KZ<0 then
        begin
             NeedPodrList.Free;
             Exit;
        end;
     if Select_Key=5 then { сохраненный отчет }
        Fill_Curr_Gru_and_Kat;
     ItemAddList := TItemList.Create;
     ItemUdList  := TItemList.Create;
     Safe_PutInf := true;
     PUTINF;
     EMPTY_ALL_PERSON;
     VYDACHA   := 0;
     DOLG      := 0;
     OST_DOLGA := 0;
     SUMMS     := 0;
     S_SUMMA   := 0;
     U_SUMMA   := 0;
     S_FZP     := 0;
     S_FMP     := 0;
     S_OTHER           := 0;
     s_summa_MP_31     := 0;
     s_summa_MP_NE_31  := 0;
     s_summa_vyh_pos_23:= 0;
     s_summa_kompens_1 := 0;
     s_summa_pogr_165  := 0;
     S_SUMMA_invalidy  := 0;
     s_summa_lt_min_sal  := 0;
     s_summa_gt_max_sal  := 0;
     LAST_NSRV := 1;
     Detail_Swod:=false;
     footerstr:='';
     needSVDNFooter:=false;
     if isSVDN then
        needSVDNFooter:=true;
     IF YESNO('Разбивать по периодам ?') THEN Detail_Swod:=TRUE;
     SQLSwodClass:=TSQLSwodClass.Init(Work_Year_Val,NMES);
     Application.CreateForm(TFormProgress, FormProgress);
     FormProgress.Gauge.MinValue      := 0;
     FormProgress.Gauge.MaxValue      := COUNT_SERV;
     FormProgress.Gauge.Progress      := 0;
     FormProgress.LabelHeader.Caption := '';
     FormProgress.LabelFooter.Caption := '';
     FormProgress.Caption             := 'Создание свода';
     FormProgress.Show;
     SummaTot:=0;
     FOR III:=1 TO COUNT_SERV DO
         BEGIN
           NSRV:=III;
           FormProgress.Gauge.Progress      := III;
           FormProgress.LabelHeader.Caption := NAME_SERV(NSRV);
           FormProgress.LabelFooter.Caption := NAME_SERV(NSRV);
           FormProgress.RePaint;
           Application.ProcessMessages;
           MKFLNM;
           IF IS_NEED_THIS_SERV(NSRV) THEN
           IF FILEEXIST(FNINF)    THEN
              BEGIN
                   LAST_NSRV:=NSRV;
                   GETINF(FALSE);
                   TOTAL_PODR_SBRK:=0;
                   MK_SWOD;
                   EMPTY_ALL_PERSON;
{                   writeln(devt,IntToStr(nsrv)+' '+FORMAT('%12.2f',[ItemAddList.SummaWantedItem(1)]));}
              END;
         END;
{    closefile(devt);}
     FormProgress.Free;

     if (swod_mode=pens_swod) or
        (swod_mode=invalid_swod) then
         begin
              DisposePensList;
//              for iii:=0 to PensionerList.Count-1 do
//                  Dispose(PPensionerRec(PensionerList.Items[iii]));
//              PensionerList.Free;
         end;
 //    ShowMessage(FloatToStr(SummaTot));


     NSRV:=LAST_NSRV;
     Safe_PutInf:=false;
     IF ((ItemAddList.Count=0) and (ItemUdList.Count=0)) THEN
        BEGIN
             SQLSwodClass.Done;
             ERROR('НЕ БЫЛО ПРОИЗВЕДЕНО НАЧИСЛЕНИЙ/УДЕРЖАНИЙ');
             NMES:=NMES_TEMP;
             NSRV:=NSRV_TEMP;
             MUST_SHOW_IO_TABLE:=TRUE;
             MKFLNM;
             GETINF(NEED_NET_FOR_GETINF);
             EXIT;
        END;
     str(nmes,FName);
     FName:=trim(FName);
     FName:=CDOC+'SWODMN'+FName+'.TXT';
     ASSIGN(DEV,FName);
     REWRITE(DEV);
     F89_HAT(NameSQL);
     SL:=TRUE;
     MakeStringLists;
     for i:=1 to AddList.Count do
      BEGIN
           Write(Dev,AddList.Strings[i-1]);
           Writeln(Dev,UdList.Strings[i-1]);
      END; { END WHILE}
     if isSVDN and TotalMode then
        begin
             makeFooterForSVDN;
        end;
     Footer;
     Close(Dev);
     case PrintMode of
       1 : SwodToExcel;
       else
          Swod_To_FR;
     end;
     for i:=0 to ItemAddList.Count-1 do
         Dispose(PCell_Rec(ItemAddList.Items[i]));
     ItemAddList.Free;
     for i:=0 to ItemUdList.Count-1 do
         Dispose(PCell_Rec(ItemUdList.Items[i]));
     ItemUdList.Free;
     UdList.Free;
     AddList.Free;
{     i:=PensionerList.Count;
     PensionerList.Free;
}
     NeedPodrList.Free;
     if Length(trim(nameBay))>0 then
        NameSwod:=trim(nameBay)
     else
        NameSwod:='Свод';
     SQLSwodClass.PutToSQL(NameSwod,NameSQL,Select_key,Select_Bay_Mode,SelectedBay,NeedDogPod,TotalMode,ModeIllSS,SwodSowmMode,ChernobMode);
 {
         PROCEDURE MAKE_MAIN_SWOD(Select_Key:Integer;
                                  Select_Bay_Mode:Integer;
                                  SelectedBay:integer;
                                  NameBay:String;NeedDogPod:boolean;
                                  TotalMode:boolean;
                                  PrintMode:integer;
                                  ModeIllSS:integer;
                                  SwodSowmMode:integer;
                                  ChernobMode:integer);
     }
     SQLSwodClass.Done;
     NMES:=NMES_TEMP;
     NSRV:=NSRV_TEMP;
     MKFLNM;
     GETINF(NEED_NET_FOR_GETINF);
     if PrintMode=2 then view(FNAME);
     MUST_SHOW_IO_TABLE:=TRUE;
 END;

end.
