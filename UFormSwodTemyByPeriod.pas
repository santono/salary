unit UFormSwodTemyByPeriod;
                              
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls,scrdef;

type
  TFormSwodTemyByPeriod = class(TForm)
    ProgressBar: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    cbPeriods: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    wantedMonth:Integer;  // Ìåñÿö çà
    PeriodsList:TList;
    procedure MAKE_TEMY_L_F;
    procedure AnalyzePodrForPeriod;
    procedure AnalyzeSelectedPodrs;
    function is_Need(N_TEMY:STRING):BOOLEAN;
    function Get_NSRV(curr_person:person_ptr):integer;


  public
    { Public declarations }
  end;

var
  FormSwodTemyByPeriod: TFormSwodTemyByPeriod;

implementation
 Uses ScrUtil,ScrIo,UFormView, UFormSelPKG,ScrLists,dateUtils;

  CONST  GN  : STRING  = ('ÃÍ');
         KGN : STRING = ('ÊÃÍ');
         SGN : STRING = ('ÑÃÍ');
         CGN : STRING = ('CÃÍ');
         LEN      = 15;
         MIN_SOWM = 85;
         MAX_SOWM = 90;

{$R *.dfm}



procedure TFormSwodTemyByPeriod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

PROCEDURE TFormSwodTemyByPeriod.MAKE_TEMY_L_F;

  TYPE PItem = ^TItem;
       TItem = record
                 N_TEMY      : string;
                 OSN_SUMMA   : REAL;
                 SOWM_SUMMA  : REAL;
                 ITOGO_SUMMA : REAL;
                 SUMMA_B_5   : real;
                 SUMMA_B     : real;
               end;
       PCount = ^TCount;
       TCount = record
                  NSRV     : INTEGER;
                  ITEMLIST : TList;
                end;



 VAR CountList:TList;
     SWOD_NAME:STRING;
     Nsrv_Temp,Nmes_Temp,IJI,JIJ,icount,iCurr:INTEGER;
     Dev:TextFile;
     Dev_082,Dev_GN,Dev_KGN:TextFile;
     Current_Srv : integer;
     Curr_Serv : string;

 procedure Add_Summa_To_Count(MNSRV:integer;N_TEMY:string;
                             Adding_Osn,Adding_Sowm,B_5,B:real);
  var
     FoundCount : boolean;
     Finded     : boolean;
     I,J        : integer;
     Count      : PCount;
     Item       : PItem;
  begin
       FoundCount:=false;
       if CountList.Count>0 then
          for i:=0 to CountList.Count-1 do
              if PCount(CountList.Items[i])^.NSRV=MNSRV then
                  begin
                       Finded:=false;
                       if PCount(CountList.Items[i])^.ITEMLIST.Count>0 then
                          for j:=0 to PCount(CountList.Items[i])^.ITEMLIST.Count-1 do
                              if trim(Upper_String(PItem(PCount(CountList.Items[i])^.ItemList.Items[j])^.N_Temy))=trim(Upper_String(N_Temy)) then
                                 begin
                                      with PItem(PCount(CountList.Items[i])^.ItemList.Items[j])^ do
                                       begin
                                             OSN_SUMMA    := OSN_SUMMA   + Adding_Osn  ;
                                             SOWM_SUMMA   := SOWM_SUMMA  + Adding_Sowm ;
                                             ITOGO_SUMMA  := ITOGO_SUMMA + Adding_Osn + Adding_Sowm;
                                             SUMMA_B_5    := SUMMA_B_5   + B_5;
                                             SUMMA_B      := Summa_B     + B;
                                       end;
                                      Finded:=true;
                                      break;
                                  end;
                       if not finded then
                          begin
                               Item:=New(PItem);
                               Item^.N_Temy      := Upper_String(Trim(N_Temy));
                               Item^.Osn_Summa   := Adding_Osn  ;
                               Item^.Sowm_Summa  := Adding_Sowm ;
                               Item^.Itogo_Summa := Adding_Osn + Adding_Sowm ;
                               Item^.SUMMA_B_5   := B_5;
                               Item^.SUMMA_B     := B;
                               PCount(CountList.Items[i])^.ItemList.Add(Item);
                          end;
                       FoundCount:=true;
                       break;
                  end;
       if Not FoundCount then
          begin
                Count:=New(PCount);
                Count^.NSRV:=MNsrv;
                Count^.ITEMLIST:=TList.Create;
                Item:=New(PItem);
                Item^.N_Temy      := Upper_String(Trim(N_Temy));
                Item^.Osn_Summa   := Adding_Osn  ;
                Item^.Sowm_Summa  := Adding_Sowm ;
                Item^.Itogo_Summa := Adding_Osn + Adding_Sowm ;
                Item^.SUMMA_B_5   := B_5;
                Item^.SUMMA_B     := B;
                Count^.ITEMLIST.Add(Item);
                CountList.Add(Count);
          end;
  end;


FUNCTION IS_IN_GN(N_TEMY:STRING):BOOLEAN;
 VAR
     L:BOOLEAN;
 BEGIN
     L := FALSE;
     IF POS(GN,ALLTRIM(N_TEMY))=1  THEN L:=TRUE;
     IF POS(SGN,ALLTRIM(N_TEMY))=1 THEN L:=TRUE;
     IF POS(CGN,ALLTRIM(N_TEMY))=1 THEN L:=TRUE;
     IS_IN_GN:=L;
 END;
FUNCTION IS_IN_KGN(N_TEMY:STRING):BOOLEAN;
 VAR
     L:BOOLEAN;
 BEGIN
     L := FALSE;
     IF POS(KGN,ALLTRIM(N_TEMY))>0 THEN L:=TRUE;
     IS_IN_KGN:=L;
 END;
FUNCTION IS_IN_082(N_TEMY:STRING):BOOLEAN;
 VAR
     L:BOOLEAN;
 BEGIN
     L := FALSE;
     IF (POS(KGN,ALLTRIM(N_TEMY))   <>1) THEN
     IF (POS(GN,ALLTRIM(N_TEMY))    <>1) THEN
     IF (POS(SGN,ALLTRIM(N_TEMY))   <>1) THEN
     IF (POS(CGN,ALLTRIM(N_TEMY))   <>1) THEN
     IF (POS('210',ALLTRIM(N_TEMY)) <>1) THEN
     IF (POS('211',ALLTRIM(N_TEMY)) <>1) THEN
     L:=TRUE;
     IS_IN_082:=L;
 END;

PROCEDURE Temy_Hat;
VAR DEW:TextFile;
    S:STRING;
    I:INTEGER;
BEGIN
     AssignFile(DEW,CDIR+'LABEL.TXT');
     IF FileExists(CDIR+'LABEL.TXT') THEN
        BEGIN
             RESET(DEW);
             WHILE NOT EOF(DEW) DO
               BEGIN
                    ReadLn(DEW,S);
                    S:=DosToWin(S);
                    Writeln(DEV,S);
                END;
             CloseFile(DEW);
        END;
     writeln(DEV,' ');
     writeln(DEV,'           ÑÂÎÄÍÀß ÂÅÄÎÌÎÑÒÜ ÏÎ ÒÅÌÀÌ');
     writeln(DEV,'                Â ',GetMonthRus(NMES),'ÇÀ ',GetMonthRus(wantedMonth));
     S:='';
     for I:=1 to MAX_GRUPPA do if CURR_GRUPPA[I] then S:=S+ALLTRIM(Get_Ist_Name(i))+' ';
     writeln(DEV,'---------------------------------------------------------------------------------------------------------------');
     writeln(DEV,':Øèôð:Íàèìåíîâàíèå ïîäðàçäåëåíèÿ   : Ò Å Ì À :  Îñíîâíàÿ  : Cîâìåùåíèå :  È Ò Î Ã Î : Áîëüíè÷í.5 : Áîëüíè÷íûå :');
     writeln(DEV,'---------------------------------------------------------------------------------------------------------------');
END;
PROCEDURE FOOTER(OSN_SUMMA,SOWM_SUMMA,ITOGO_SUMMA ,
                 SUMMA_082_OSN , SUMMA_082_SOWM   , SUMMA_082_DOG ,
                 SUMMA_GN_OSN  , SUMMA_GN_SOWM    , SUMMA_GN_DOG  ,
                 SUMMA_KGN_OSN , SUMMA_KGN_SOWM   , SUMMA_KGN_DOG ,
                 SUMMA_SOWM_OSN,SUMMA_SOWM_SOWM:REAL);
 var T,TT,TTT:String;                
BEGIN
     WRITELN(DEV,'----------------------------------------------------------------------------------------------');
     T   := FORMAT_K(OSN_SUMMA   , 12);
     TT  := FORMAT_K(SOWM_SUMMA  , 12);
     TTT := FORMAT_K(ITOGO_SUMMA , 12);
     WRITELN(DEV,': È Ò Î Ã Î                                  :',T,':',TT,':',TTT,':');
     T   := FORMAT_K(SUMMA_082_OSN , 12);
     TT  := FORMAT_K(SUMMA_GN_OSN  , 12);
     TTT := FORMAT_K(SUMMA_KGN_OSN , 12);
     WRITELN(DEV,': È Ò Î Ã Î   ØÒÀÒÍÛÅ ÐÀÁÎÒÍÈÊÈ     ÍÈÑ      :',T   , ':');
     WRITELN(DEV,':                                   ÃÍ       :',TT  , ':');
     WRITELN(DEV,':                                  ÊÃÍ       :',TTT , ':');
     T   := FORMAT_K(SUMMA_082_DOG , 12);
     TT  := FORMAT_K(SUMMA_GN_DOG  , 12);
     TTT := FORMAT_K(SUMMA_KGN_DOG , 12);
     WRITELN(DEV,': È Ò Î Ã Î   Äîãîâîðà ÏÎÄÐßÄÀ     ÍÈÑ       :',T   , ':');
     WRITELN(DEV,':                                   ÃÍ       :',TT  , ':');
     WRITELN(DEV,':                                  ÊÃÍ       :',TTT , ':');
     T   := FORMAT_K(SUMMA_082_SOWM , 12);
     TT  := FORMAT_K(SUMMA_GN_SOWM  , 12);
     TTT := FORMAT_K(SUMMA_KGN_SOWM , 12);
     WRITELN(DEV,': È Ò Î Ã Î   ÑÎÂÌÅÑÒÈÒÅËÈ         ÍÈÑ       :',T   , ':');
     WRITELN(DEV,':                                   ÃÍ       :',TT  , ':');
     WRITELN(DEV,':                                  ÊÃÍ       :',TTT , ':');
     WRITELN(DEV,'----------------------------------------------------------------------------------------------');
END;
PROCEDURE MK_SWOD;
VAR I,J,P_COUNT,A_COUNT:INTEGER;
    CURR_PERSON:PERSON_PTR;
    CURR_ADD   :ADD_PTR;
    ADD_NSRV,WORK_NSRV:INTEGER;
    O_SUMMA,S_SUMMA:REAL;
    B_5,B:real;
BEGIN
  P_COUNT:=COUNT_PERSON;
  IF P_COUNT=0 THEN EXIT;
  FOR I:=1 TO P_COUNT DO
     BEGIN
           IF I=1 THEN CURR_PERSON:=HEAD_PERSON
                  ELSE CURR_PERSON:=CURR_PERSON^.NEXT;
           IF (CURR_PERSON^.GRUPPA>0) AND (CURR_PERSON^.GRUPPA<MAX_GRUPPA) THEN
{           IF (CURR_GRUPPA[CURR_PERSON^.GRUPPA]) THEN}
           if GruppyList.IsSelected(CURR_PERSON^.GRUPPA) then
           IF LENGTH(ALLTRIM(CURR_PERSON^.N_TEMY))>1 THEN
           IF IS_NEED(CURR_PERSON^.N_TEMY) THEN
              BEGIN
                   ADD_NSRV:=0;
                   ADD_NSRV:=GET_NSRV(CURR_PERSON);
                   A_COUNT:=COUNT_ADD(CURR_PERSON);
                   IF (A_COUNT>0) AND (ADD_NSRV IN [1..MAX_COUNT_PODRAZD]) THEN
                   FOR J:=1 TO A_COUNT DO
                       BEGIN
                             IF J=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                                     ELSE CURR_ADD:=CURR_ADD^.NEXT;
                             if Curr_Add^.Period<>WantedMonth then
                                Continue;
                             IF NOT (CURR_ADD^.SHIFR IN [{BOL_TEK_SHIFR         ,
                                                         BOL_FUTURE_SHIFR      ,
                                                         BOL_PROSHL_SHIFR      , }
                                                         KASSA_SHIFR           ,
                                                         ZA_STRAH_VZNOCY_SHIFR ,
                                                         DEKRET_SHIFR          ,
                                                         INDEX_BOL_SHIFR,
                                                         BOL_25_SHIFR,
                                                         BOL_DOPL_SHIFR])   then
                                BEGIN
                                      O_SUMMA := 0;
                                      S_SUMMA := 0;
                                      B_5     := 0;
                                      B       := 0;
                                      WORK_NSRV:=ADD_NSRV;
                                      IF CURR_PERSON^.WID_RABOTY=OSN_WID_RABOTY THEN
                                         if IsBolnShifr(curr_add^.shifr) then
                                            if curr_add^.shifr=bol_5_shifr then B_5:=sum(B_5)+sum(Curr_Add^.Summa)
                                                                           else B:=sum(B)+sum(Curr_Add^.Summa)
                                                                         else O_SUMMA:=CURR_ADD^.SUMMA
                                                                                ELSE S_SUMMA:=CURR_ADD^.SUMMA;
                                      ADD_SUMMA_TO_COUNT(WORK_NSRV,trim(Upper_String(Curr_Person^.N_TEMY)),O_SUMMA,S_SUMMA,B_5,B);
                                      IF IS_IN_GN(CURR_PERSON^.N_TEMY) THEN
                                      IF DOG_POD_PODRAZD(NSRV) THEN
                                         WRITELN(DEV_GN,':',CURR_PERSON^.TABNO:4,':',COPY(CURR_PERSON^.FIO+SPACE(20),1,20),':',
                                                 SPACE(12),':',SPACE(12),':',CURR_ADD^.SUMMA:12:2,':')
                                                       ELSE
                                      IF (NSRV>=MIN_SOWM) AND (NSRV<=MAX_SOWM) THEN
                                         WRITELN(DEV_GN,':',CURR_PERSON^.TABNO:4,':',COPY(CURR_PERSON^.FIO+SPACE(20),1,20),':',
                                                 SPACE(12),':',CURR_ADD^.SUMMA:12:2,':',SPACE(12),':')
                                                       ELSE
                                         WRITELN(DEV_GN,':',CURR_PERSON^.TABNO:4,':',COPY(CURR_PERSON^.FIO+SPACE(20),1,20),':',
                                                 CURR_ADD^.SUMMA:12:2,':',SPACE(12),':',SPACE(12),':');

                                      IF IS_IN_KGN(CURR_PERSON^.N_TEMY) THEN
                                      IF DOG_POD_PODRAZD(NSRV) THEN
                                        WRITELN(DEV_KGN,':',CURR_PERSON^.TABNO:4,':',COPY(CURR_PERSON^.FIO+SPACE(20),1,20),':',
                                                 SPACE(12),':',SPACE(12),':',CURR_ADD^.SUMMA:12:2,':')
                                                       ELSE
                                      IF (NSRV>=MIN_SOWM) AND (NSRV<=MAX_SOWM) THEN
                                        WRITELN(DEV_KGN,':',CURR_PERSON^.TABNO:4,':',COPY(CURR_PERSON^.FIO+SPACE(20),1,20),':',
                                                 SPACE(12),':',CURR_ADD^.SUMMA:12:2,':',SPACE(12),':')
                                                       ELSE
                                        WRITELN(DEV_KGN,':',CURR_PERSON^.TABNO:4,':',COPY(CURR_PERSON^.FIO+SPACE(20),1,20),':',
                                                 CURR_ADD^.SUMMA:12:2,':',SPACE(12),':',SPACE(12),':');

                                      IF IS_IN_082(CURR_PERSON^.N_TEMY) THEN
                                      IF DOG_POD_PODRAZD(NSRV) THEN
                                        WRITELN(DEV_082,':',CURR_PERSON^.TABNO:4,':',COPY(CURR_PERSON^.FIO+SPACE(20),1,20),':',
                                                 SPACE(12),':',SPACE(12),':',CURR_ADD^.SUMMA:12:2,':')
                                                       ELSE
                                      IF (NSRV>=MIN_SOWM) AND (NSRV<=MAX_SOWM) THEN
                                        WRITELN(DEV_082,':',CURR_PERSON^.TABNO:4,':',COPY(CURR_PERSON^.FIO+SPACE(20),1,20),':',
                                                 SPACE(12),':',CURR_ADD^.SUMMA:12:2,':',SPACE(12),':')
                                                       ELSE
                                        WRITELN(DEV_082,':',CURR_PERSON^.TABNO:4,':',COPY(CURR_PERSON^.FIO+SPACE(20),1,20),':',
                                                 CURR_ADD^.SUMMA:12:2,':',SPACE(12),':',SPACE(12),':');
                                END;
                       END;
              END;
     END;
END;
PROCEDURE PREPARE_PRINTER;

 BEGIN
     KZ:=0;
     MKFLNM;
     SWOD_NAME:=CDOC+'TEMY_L_F'+'.DOC';
     AssignFile(DEV,SWOD_NAME);
     ReWrite(DEV);
 END;
PROCEDURE PRINT_ALL_ITEM(OCOUNT:PCOUNT;VAR OSN_SUMMA,SOWM_SUMMA,ITOGO_SUMMA,
                 SUMMA_082_OSN  , SUMMA_082_SOWM, SUMMA_082_DOG ,
                 SUMMA_GN_OSN   , SUMMA_GN_SOWM , SUMMA_GN_DOG  ,
                 SUMMA_KGN_OSN  , SUMMA_KGN_SOWM, SUMMA_KGN_DOG:REAL);
 VAR WORK_SRV:INTEGER;
     I:integer;
 PROCEDURE PRINT_ITEM(P:PItem);
  VAR S,S1,T,TT,TTT,TTTT,TTTTT:STRING;
  BEGIN
        IF CURRENT_SRV<>WORK_SRV THEN
           BEGIN
                 S1:=CURR_SERV;
                 WORK_SRV:=CURRENT_SRV;
           END
                                 ELSE
           BEGIN
                S1:='        -    "    -           ';
           END;
        S:=copy(Trim(P^.N_TEMY)+SPACE(9),1,9);
        IF length(trim(S))<=0 THEN EXIT;

        T     := FORMAT_K(P^.OSN_SUMMA   , 12);
        TT    := FORMAT_K(P^.SOWM_SUMMA  , 12);
        TTT   := FORMAT_K(P^.ITOGO_SUMMA , 12);
        TTTT  := FORMAT_K(P^.SUMMA_B_5   , 12);
        TTTTT := FORMAT_K(P^.SUMMA_B     , 12);
        writeln(dev,':   :',S1,':',S,':',T,':',TT,':',TTT,':',TTTT,':',TTTTT,':');
        IF IS_IN_082(P^.N_TEMY) THEN
           BEGIN
                 IF DOG_POD_PODRAZD(WORK_SRV) THEN SUMMA_082_DOG:=SUM(SUMMA_082_DOG)+SUM(P^.OSN_SUMMA)+SUM(P^.SOWM_SUMMA)
                                      ELSE
                    BEGIN
                         SUMMA_082_OSN  := SUM(SUMMA_082_OSN)  + SUM(P^.OSN_SUMMA);
                         IF (WORK_SRV>=MIN_SOWM) AND (WORK_SRV<=MAX_SOWM) THEN
                            SUMMA_082_SOWM := SUM(SUMMA_082_SOWM) + SUM(P^.SOWM_SUMMA);
                    END
           END
                                 ELSE
        IF IS_IN_KGN(P^.N_TEMY) THEN
           BEGIN
                 IF DOG_POD_PODRAZD(WORK_SRV) THEN
                    SUMMA_KGN_DOG:=SUM(SUMMA_KGN_DOG)+SUM(P^.OSN_SUMMA)+SUM(P^.SOWM_SUMMA)
                                      ELSE
                    BEGIN
                         SUMMA_KGN_OSN  := SUMMA_KGN_OSN  + P^.OSN_SUMMA ;
                         IF (WORK_SRV>=MIN_SOWM) AND (WORK_SRV<=MAX_SOWM) THEN
                         SUMMA_KGN_SOWM := SUMMA_KGN_SOWM + P^.SOWM_SUMMA;
                    END
           END
                                 ELSE
        IF IS_IN_GN (P^.N_TEMY)  THEN
           BEGIN
                 IF DOG_POD_PODRAZD(WORK_SRV) THEN SUMMA_GN_DOG:=SUM(SUMMA_GN_DOG)+SUM(P^.OSN_SUMMA)+SUM(P^.SOWM_SUMMA)
                                      ELSE
                    BEGIN
                        SUMMA_GN_OSN  := SUMMA_GN_OSN  + P^.OSN_SUMMA;
                        IF (WORK_SRV>=MIN_SOWM) AND (WORK_SRV<=MAX_SOWM) THEN
                           SUMMA_GN_SOWM := SUMMA_GN_SOWM + P^.SOWM_SUMMA;
                    END
           END;
        OSN_SUMMA   := SUM(OSN_SUMMA)   + SUM(P^.OSN_SUMMA);
        SOWM_SUMMA  := SUM(SOWM_SUMMA)  + SUM(P^.SOWM_SUMMA);
        ITOGO_SUMMA := SUM(ITOGO_SUMMA) + SUM(P^.ITOGO_SUMMA);
  END;
 BEGIN
      OSN_SUMMA  :=0;
      SOWM_SUMMA :=0;
      ITOGO_SUMMA:=0;
      WORK_SRV:=0;
      if OCOUNT.ITEMLIST.Count>0 then
         for i:=0 to OCOUNT.ITEMLIST.Count-1 do
             Print_Item(PItem(OCOUNT.ITEMLIST.Items[i]));
 END;
PROCEDURE PRINT_ALL_COUNT(VAR OSN_SUMMA,SOWM_SUMMA,ITOGO_SUMMA,
                 SUMMA_082_OSN  , SUMMA_082_SOWM, SUMMA_082_DOG ,
                 SUMMA_GN_OSN   , SUMMA_GN_SOWM , SUMMA_GN_DOG  ,
                 SUMMA_KGN_OSN  , SUMMA_KGN_SOWM, SUMMA_KGN_DOG ,
                 SUMMA_SOWM_OSN , SUMMA_SOWM_SOWM : REAL);
 var I:integer;
 PROCEDURE PRINT_COUNT(P:PCOUNT);
  VAR OSN_PSUMMA,SOWM_PSUMMA,ITOGO_PSUMMA:REAL;
      T,TT,TTT:STRING;
  BEGIN
        CURRENT_SRV:=P^.NSRV;
        CURR_SERV:=COPY(NAME_SERV(P^.NSRV)+SPACE(30),1,30);
        PRINT_ALL_ITEM(P,OSN_PSUMMA,SOWM_PSUMMA,ITOGO_PSUMMA,
                 SUMMA_082_OSN , SUMMA_082_SOWM , SUMMA_082_DOG ,
                 SUMMA_GN_OSN  , SUMMA_GN_SOWM  , SUMMA_GN_DOG  ,
                 SUMMA_KGN_OSN , SUMMA_KGN_SOWM , SUMMA_KGN_DOG );
        T   := FORMAT_K(OSN_PSUMMA   , 12);
        TT  := FORMAT_K(SOWM_PSUMMA  , 12);
        TTT := FORMAT_K(ITOGO_PSUMMA , 12);
        WRITELN(DEV,': È Ò Î Ã Î   Ï Î   Ê À Ô Å Ä Ð Å            :',T,':',TT,':',TTT,':');
        IF P^.NSRV IN [MIN_SOWM..MAX_SOWM] THEN
           BEGIN
                 SUMMA_SOWM_OSN  := SUM(SUMMA_SOWM_OSN ) + SUM(OSN_PSUMMA );
                 SUMMA_SOWM_SOWM := SUM(SUMMA_SOWM_SOWM) + SUM(SOWM_PSUMMA);
           END;
        OSN_SUMMA   := SUM(OSN_SUMMA)   + SUM(OSN_PSUMMA);
        SOWM_SUMMA  := SUM(SOWM_SUMMA)  + SUM(SOWM_PSUMMA);
        ITOGO_SUMMA := SUM(ITOGO_SUMMA) + SUM(ITOGO_PSUMMA);
  END;
 BEGIN
      OSN_SUMMA       := 0;
      SOWM_SUMMA      := 0;
      ITOGO_SUMMA     := 0;
      SUMMA_082_OSN   := 0;
      SUMMA_082_SOWM  := 0;
      SUMMA_082_DOG   := 0;
      SUMMA_GN_OSN    := 0;
      SUMMA_GN_SOWM   := 0;
      SUMMA_GN_DOG    := 0;
      SUMMA_KGN_OSN   := 0;
      SUMMA_KGN_SOWM  := 0;
      SUMMA_KGN_DOG   := 0;
      SUMMA_SOWM_OSN  := 0;
      SUMMA_SOWM_SOWM := 0;
      WRITELN(DEV);
      if CountList.Count>0 then
         for i:=0 to CountList.Count-1 do
            Print_Count(PCount(CountList.Items[i]));
 END;
PROCEDURE PRINT_SWOD;
 VAR 
     OSN_SUMMA,SOWM_SUMMA,ITOGO_SUMMA:REAL;
     SUMMA_082_OSN,SUMMA_082_SOWM,SUMMA_082_DOG,
     SUMMA_GN_OSN,SUMMA_GN_SOWM,SUMMA_GN_DOG,
     SUMMA_KGN_OSN,SUMMA_KGN_SOWM,SUMMA_KGN_DOG,
     SUMMA_SOWM_OSN,SUMMA_SOWM_SOWM:REAL;
 BEGIN
     if CountList.Count=0 then Exit;
     TEMY_HAT;
     PRINT_ALL_COUNT(OSN_SUMMA,SOWM_SUMMA,ITOGO_SUMMA,
                 SUMMA_082_OSN , SUMMA_082_SOWM, SUMMA_082_DOG,
                 SUMMA_GN_OSN  , SUMMA_GN_SOWM,  SUMMA_GN_DOG,
                 SUMMA_KGN_OSN , SUMMA_KGN_SOWM, SUMMA_KGN_DOG,
                 SUMMA_SOWM_OSN, SUMMA_SOWM_SOWM);
     FOOTER(OSN_SUMMA,SOWM_SUMMA,ITOGO_SUMMA    ,
                 SUMMA_082_OSN , SUMMA_082_SOWM , SUMMA_082_DOG ,
                 SUMMA_GN_OSN  , SUMMA_GN_SOWM  , SUMMA_GN_DOG  ,
                 SUMMA_KGN_OSN , SUMMA_KGN_SOWM , SUMMA_KGN_DOG ,
                 SUMMA_SOWM_OSN, SUMMA_SOWM_SOWM);
 END;
 BEGIN
     KZ:=0;
{
     SEL_GRUPPA;
     IF KZ<0 THEN EXIT;
}
     NSRV_TEMP:=NSRV;
     NMES_TEMP:=NMES;
     PUTINF;
     while (HEAD_PERSON<>Nil) do DEL_PERSON(head_person);
     COUNTLIST:=TList.Create;
     PREPARE_PRINTER;
     ASSIGNFILE(DEV_GN  , CDOC+'GN_LIST.TXT');
     ASSIGNFILE(DEV_KGN , CDOC+'KGN_LIST.TXT');
     ASSIGNFILE(DEV_082 , CDOC+'082_LIST.TXT');
     REWRITE(DEV_GN);
     REWRITE(DEV_KGN);
     REWRITE(DEV_082);
     ProgressBar.Min:=1;
     ProgressBar.Max:=COUNT_SERV;
     ProgressBar.Position:=0;
     Application.ProcessMessages;
     FOR IJI:=1 TO  COUNT_SERV DO
         BEGIN
              NSRV:=IJI;
              ProgressBar.Position:=ProgressBar.Position+1;
              Application.ProcessMessages;
              MKFLNM;
              IF FILEEXIST(FNINF) THEN
                 BEGIN
                      GETINF(FALSE);
                      MK_SWOD;
                      WHILE(HEAD_PERSON<>NIL) DO DEL_PERSON(HEAD_PERSON);
                 END
         END;

     CloseFile(DEV_GN);
     CloseFile(DEV_KGN);
     CloseFile(DEV_082);
     Print_Swod;
     if CountList.Count>0 then
        for iji:=0 to CountList.Count-1 do
            begin
                 if PCount(CountList.Items[iji])^.ITEMLIST.Count>0 then
                    for jij:=0 to PCount(CountList.Items[iji])^.ItemList.Count-1 do
                        Dispose(PCount(CountList.Items[iji])^.ItemList.Items[jij]);
                    PCount(CountList.Items[iji])^.ITEMLIST.Free;
                 Dispose(PCount(CountList.Items[iji]));
            end;

     CountList.Free;
     CloseFile(DEV);
     VIEW(SWOD_NAME);
     NSRV:=NSRV_TEMP;
     NMES:=NMES_TEMP;
     MUST_SHOW_IO_TABLE:=TRUE;
     MKFLNM;
     GETINF(NEED_NET_FOR_GETINF);
END;

procedure TFormSwodTemyByPeriod.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormSwodTemyByPeriod.BitBtn2Click(Sender: TObject);
 var i : Integer;
begin
{
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Íå âûáðàíû ïîäðàçäåëåíèÿ');
             Exit;
        end;
     if KategList.CountSelected<=0 then
        begin
             ShowMessage('Íå âûáðàíû êàòåãîðèè');
             Exit;
        end;
}
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Íå âûáðàíû ñ÷åòà');
             Exit;
        end;

     if cbPeriods.Enabled=False then
        begin
             AnalyzeSelectedPodrs;
             if PeriodsList.Count=0 then
                begin
                     ShowMessage('Íå áûëî íà÷èñëåíèé');
                     Close;
                end;
             cbPeriods.Items.Clear;
             cbPeriods.ItemIndex := -1;
             for i:=0 to PeriodsList.Count-1 do
                 begin
                      cbPeriods.Items.Append(GetMonthUkr(PInteger(PeriodsList.Items[i])^));
                 end;
             cbPeriods.ItemIndex := 0;
             cbPeriods.Show;
             cbPeriods.Enabled:=True;
        end
     else
        begin
             wantedMonth:=pInteger(PeriodsList.Items[cbPeriods.ItemIndex])^;
             MAKE_TEMY_L_F;
        end;
end;

procedure TFormSwodTemyByPeriod.FormCreate(Sender: TObject);
begin
     wantedMonth := NMES;
     cbPeriods.Hide;
     cbPeriods.Enabled:=False;
end;


procedure TFormSwodTemyByPeriod.AnalyzePodrForPeriod;
VAR
    CURR_PERSON : PERSON_PTR;
    CURR_ADD    : ADD_PTR;
    pI          : PInteger;
    i           : integer;
    finded      : boolean;
 begin
  IF COUNT_PERSON<=1 THEN EXIT;
  curr_Person:=HEAD_PERSON;
  while (CURR_PERSON<>Nil) do
        begin
{           IF (CURR_GRUPPA[CURR_PERSON^.GRUPPA]) THEN}
           if GruppyList.IsSelected(CURR_PERSON^.GRUPPA) then
           IF LENGTH(ALLTRIM(CURR_PERSON^.N_TEMY))>1 THEN
           IF IS_NEED(CURR_PERSON^.N_TEMY) THEN
              BEGIN
                   curr_Add:=Curr_Person.Add;
                   while (CURR_ADD<>Nil) do
                       BEGIN
                             IF NOT (CURR_ADD^.SHIFR IN [{BOL_TEK_SHIFR         ,
                                                         BOL_FUTURE_SHIFR      ,
                                                         BOL_PROSHL_SHIFR      , }
                                                         KASSA_SHIFR           ,
                                                         ZA_STRAH_VZNOCY_SHIFR ,
                                                         DEKRET_SHIFR          ,
                                                         INDEX_BOL_SHIFR,
                                                         BOL_25_SHIFR,
                                                         BOL_DOPL_SHIFR])   then
                                BEGIN
                                    finded:=false;
                                    if (PeriodsList.Count>0) then
                                        for i:=0 to PeriodsList.Count-1 do
                                            begin
                                                 if pInteger(PeriodsList.Items[i])^=CURR_ADD.Period then
                                                    begin
                                                         finded:=True;
                                                         Break;
                                                    end;
                                            end;
                                     if not finded then
                                        begin
                                             new(pI);
                                             pI^:=Curr_Add.PERIOD;
                                             PeriodsList.Add(pI);
                                        end
                                END;
                             Curr_Add:=CURR_ADD.NEXT;
                       END;

              END;
           Curr_Person:=Curr_Person.Next;
        END;
 end;

FUNCTION TFormSwodTemyByPeriod.IS_NEED(N_TEMY:STRING):BOOLEAN;
 VAR
     L:BOOLEAN;
 BEGIN
     L := FALSE;
     IF (POS('211',ALLTRIM(N_TEMY)) <>1) THEN
     IF (POS('210',ALLTRIM(N_TEMY)) <>1) THEN
     L:=TRUE;
     IS_NEED:=L;
 END;
 function TFormSwodTemyByPeriod.Get_NSRV(curr_person:person_ptr):integer;
   begin
        Get_NSRV:=NSRV;
   end;

 procedure TFormSwodTemyByPeriod.AnalyzeSelectedPodrs;
 var
     NSRV_TEMP : integer;
     NMES_TEMP : integer;
     IJI       : Integer;
 BEGIN
     KZ:=0;
     NSRV_TEMP:=NSRV;
     NMES_TEMP:=NMES;
     PUTINF;
     while (HEAD_PERSON<>Nil) do DEL_PERSON(head_person);
     PeriodsList:=TList.Create;
     ProgressBar.Min:=1;
     ProgressBar.Max:=COUNT_SERV;
     ProgressBar.Position:=0;
     Application.ProcessMessages;
     FOR IJI:=1 TO  COUNT_SERV DO
         BEGIN
              NSRV:=IJI;
              ProgressBar.Position:=ProgressBar.Position+1;
              Application.ProcessMessages;
              MKFLNM;
              IF FILEEXIST(FNINF) THEN
                 BEGIN
                      GETINF(FALSE);
                      AnalyzePodrForPeriod;
                      WHILE(HEAD_PERSON<>NIL) DO DEL_PERSON(HEAD_PERSON);
                 END
         END;
     NSRV:=NSRV_TEMP;
     NMES:=NMES_TEMP;
     MUST_SHOW_IO_TABLE:=TRUE;
     MKFLNM;
     GETINF(NEED_NET_FOR_GETINF);
END;


end.
