{$H-}
{$WARNINGS OFF}
{$HINTS OFF}
{$I+}
unit ScrUtil;

interface
   USES SCRDEF;
   type DWord = LongWord;
        TArrOfString = array of string;

   PROCEDURE MKFLNM;
   FUNCTION testFninf : boolean;
   PROCEDURE MKFLNM_Y;
   function MKFLPODR_Y:string;
   function MKFLNM_TMP_SAVE(var EscPressed:boolean):string;
   PROCEDURE MK_OLD_FNINF;
   PROCEDURE MKFLNM_BAK(VAR FNINF_BAK:String);
   PROCEDURE MKFLNM_BAK_FOR_READ(VAR FNINF_BAK:String);
   PROCEDURE MKFLNM_BAK_FOR_WRITE(VAR FNINF_BAK:String);
   PROCEDURE MKFLNM_BAK_FOR_VERSION(VAR FNINF_BAK_FOR_VERSION:String);
   procedure makeServerBDir(var escPressed:boolean);
   procedure makeServerTmpDir(var EscPressed:boolean);
   procedure makeServerDataDirs;

   FUNCTION ALLTRIM(T:STRING):STRING;
   Function FormatDateTime(dt:TDateTime):String;
   Function FormatDate(dt:TDateTime):String;
   Function FormatFloatPoint(A:Real):String;
   Function FormatFloatPointL(A:Real;L:integer):String;
   function ReplQuot(C:String):String;
   Function ReplSToDQuote(S:String):String;
   Function ReplQto2Q(S:String):String;
   Function ReplToUkrI(S:String):String;
   Function ReplChar(S:String;CFR:String;CTO:String):String;
   FUNCTION FILEEXIST(FILENAME:STRIng):BOOLEAN;
   FUNCTION NOMER_SERV(WN:INTEGER):INTEGER;
   FUNCTION SHIFR_SERV(WN:INTEGER):INTEGER;
   function Name_Serv(WN:integer):String;
   function GetMonthRus(N:Integer):string;
   function GetMonthShortRus(N:Integer):string;
   function GetMonthUkr(N:Integer):string;
   function GetMonthShortUkr(N:Integer):string;
   FUNCTION SHORT_FIO(FFIO:STRING):STRING;
   function Split(const StringParam: String; const DelimChar: String): TArrOfString;
   function SplitFIO(FIO:STRING;var FAM,NAM,OTC:string):boolean;
   FUNCTION GET_kat_name(n_kat:INTEGER):string;
   FUNCTION GET_kat_short_name(n_kat:INTEGER):string;
   FUNCTION GET_IST_NAME(N_IST:INTEGER):STRING;
   FUNCTION GET_IST_plt_name(n_IST:INTEGER):string;
   FUNCTION WORK_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR;maxTabelDays:integer=0):integer;
   FUNCTION PROSTOY_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR;maxTabelDays:integer=0):integer;
   FUNCTION TvOtp_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR;maxTabelDays:integer=0):integer;
   FUNCTION WORK_DAY_NADB(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR;maxTabelDays:integer=0):integer;
   FUNCTION WORK_CLOCK(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION WORK_CLOCK_LERA(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION ILL_DAY(START_DAY:INTEGER;CURR_PERSON:PERSON_PTR):integer;
   FUNCTION OTPUSK_DAY(START_DAY:INTEGER;CURR_PERSON:PERSON_PTR):integer;
   FUNCTION OTPUSK_BEZ_DAY(START_DAY:INTEGER;CURR_PERSON:PERSON_PTR):integer;
   FUNCTION NADBAWKA_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION THIS_PERSON(CURR_PERSON:PERSON_PTR):BOOLEAN;
   function OK_FREE_MEM(Len:Integer):boolean;
   function WinToDos(s:string):string;
   function DosToWin(s:string):string;
   procedure Error(S:String);
   function YesNo(S:String):boolean;
   function GetClarionDate(var y,m,d:integer;dcC:LongInt):boolean;
   FUNCTION  UPPER_STRING(S:STRING):STRING;
   FUNCTION Lower_String(S:STRING):STRING;
   FUNCTION UPPER(Ch:char):char;
   FUNCTION GET_CURRENT_DISK:string;
   FUNCTION ALL(C:CHAR;L:INTEGER):STRING;
   FUNCTION SPACE(L:INTEGER):STRING;
   FUNCTION GetNameShifr(I:Integer):String;
   FUNCTION GetNameShifrByNo(I:Integer):String;
   PROCEDURE SortPerson(Mode:Integer);
   PROCEDURE SortAdd(Curr_Person:Person_Ptr);
   PROCEDURE SortUd(Curr_Person:Person_Ptr);
   FUNCTION GET_KOEF_OKLAD_PERSON(CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION GET_KOEF_OKLAD_CLEAR_PERSON(CURR_PERSON:PERSON_PTR):REAL;
   PROCEDURE MAKE_KOEF_OKLAD_PERSON(CURR_PERSON:PERSON_PTR;A:REAL);
   FUNCTION GET_KOEF_UW_OKLAD_PERSON(CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION GET_PERSON_OKLAD(CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION GET_DOL_CODE(CURR_PERSON:PERSON_PTR):INTEGER;
   FUNCTION GET_DOL_NAME(CURR_PERSON:PERSON_PTR):STRING;
   PROCEDURE MAKE_DOL_PERSON(CURR_PERSON:PERSON_PTR;A:INTEGER);
   PROCEDURE MAKE_IDDOGPODFORSOWM_PERSON(CURR_PERSON:PERSON_PTR;A:INTEGER);
   FUNCTION GET_IDDOGPODFORSOWM_PERSON(CURR_PERSON:PERSON_PTR):INTEGER;
   FUNCTION GET_IDDOGPODFORSOWM_PERSON_FROM_SQL(CURR_PERSON:PERSON_PTR):INTEGER;
   FUNCTION NAME_DOLG(WANTED_DOLG:INTEGER):STRING;
   FUNCTION NAME_DOLG_BY_SHIFR(WANTED_DOLG:INTEGER):STRING;
   FUNCTION RAZR_DOLG(WANTED_DOLG:INTEGER):INTEGER;
   FUNCTION OKLAD_DOLG(WANTED_DOLG:INTEGER):REAL;
   FUNCTION NOMER_DOLG(WANTED_DOLG:INTEGER):INTEGER;
   FUNCTION SHIFR_DOLG(WANTED_DOLG:INTEGER):INTEGER;
   FUNCTION GET_WR_NAME(WANTED_WR:Integer):String;
   FUNCTION GET_SWM_NAME(WANTED_SWM:Integer):String;
   FUNCTION IS_OSN_WID_RABOTY(CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION IS_OSN_W_R_FOR_NALOG_RECALC(CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION GET_SWM_MODE_PERSON(CURR_PERSON:PERSON_PTR):integer;
   PROCEDURE PUT_SWM_MODE_TO_PERSON(CURR_PERSON:PERSON_PTR;WANTED_SWM:Integer);
   FUNCTION GET_OLD_DOLG(CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION getDolPerson(CURR_PERSON:PERSON_PTR):integer;
//   PROCEDURE MAKE_PERSON(VAR CURR_PERSON:PERSON_PTR);
   PROCEDURE MAKE_PERSON(VAR CURR_PERSON:PERSON_PTR;Wanted_Person_After:PERSON_PTR=NIl);
   PROCEDURE MAKE_ADD(VAR CURR_ADD:ADD_PTR;CURR_PERSON:PERSON_PTR);
   PROCEDURE MAKE_SOWM(VAR CURR_SOWM:SOWM_PTR;CURR_PERSON:PERSON_PTR);
   PROCEDURE MAKE_UD(VAR CURR_UD:UD_PTR;CURR_PERSON:PERSON_PTR);
   PROCEDURE MAKE_CN(VAR CURR_CN:CN_PTR;CURR_PERSON:PERSON_PTR);
   PROCEDURE DEL_ADD(VAR CURR_ADD:ADD_PTR;CURR_PERSON:PERSON_PTR);
   PROCEDURE DEL_SOWM(VAR CURR_SOWM:SOWM_PTR;CURR_PERSON:PERSON_PTR);
   PROCEDURE DEL_UD(VAR CURR_UD:UD_PTR;CURR_PERSON:PERSON_PTR);
   PROCEDURE DEL_CN(VAR CURR_CN:CN_PTR;CURR_PERSON:PERSON_PTR);
   PROCEDURE DEL_PERSON(VAR CURR_PERSON:PERSON_PTR);
   PROCEDURE LDEL_PERSON_OLD;
   PROCEDURE LDEL_PERSON;
   PROCEDURE LDEL_PERSON_ZERO;
   PROCEDURE EMPTY_ALL_PERSON;
   PROCEDURE LDEL_ADD_ZERO(CURR_PERSON:PERSON_PTR);
   PROCEDURE LDEL_UD_ZERO(CURR_PERSON:PERSON_PTR);
   PROCEDURE LDEL_CN_ZERO(CURR_PERSON:PERSON_PTR);
   PROCEDURE LDEL_SOWM_ZERO(CURR_PERSON:PERSON_PTR);
   FUNCTION  COUNT_PERSON:INTEGER;
   FUNCTION  COUNT_ADD(CURR_PERSON:PERSON_PTR):INTEGER;
   FUNCTION  COUNT_SOWM(CURR_PERSON:PERSON_PTR):INTEGER;
   FUNCTION  COUNT_UD(CURR_PERSON:PERSON_PTR):INTEGER;
   FUNCTION  COUNT_WANTED_UD_YEAR(CURR_PERSON:PERSON_PTR;WANTED_SHIFR:Integer;START_MONTH:Integer;START_YEAR:INTEGER):INTEGER;

   FUNCTION  COUNT_CN(CURR_PERSON:PERSON_PTR):INTEGER;
   FUNCTION  TEST_PERSON(CURR_PERSON:PERSON_PTR;VAR KOD:INTEGER;VAR VALUE:REAL):BOOLEAN;
   FUNCTION  INIT_PERSON_ITERATOR:PERSON_PTR;
   FUNCTION  GET_NEXT_PERSON_ITERATOR(VAR CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION  INIT_PERSON_ITERATOR_ABSOLUTE:PERSON_PTR;
   FUNCTION  GET_NEXT_PERSON_ITERATOR_ABSOLUTE(VAR CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION  OK_PERSON_ITERATOR(CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION  COUNT_PERSON_WITH_FILTER:INTEGER;
   FUNCTION  DEL_WANTED_CN(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION  DEL_WANTED_UD_YEAR(WANTED_SHIFR:INTEGER;
                                CURR_PERSON:PERSON_PTR;
                                START_MONTH:INTEGER;START_YEAR:integer):BOOLEAN;
   FUNCTION  DEL_WANTED_UD(WANTED_SHIFR:INTEGER;
                          CURR_PERSON:PERSON_PTR;
                          START_MONTH:INTEGER):BOOLEAN;
   FUNCTION  DEL_WANTED_ADD(WANTED_SHIFR:INTEGER;
                           CURR_PERSON:PERSON_PTR;
                           START_MONTH:INTEGER):BOOLEAN;
   FUNCTION  EXISTS_WANTED_UD(WANTED_SHIFR:INTEGER;
                          CURR_PERSON:PERSON_PTR;
                          START_MONTH:INTEGER):BOOLEAN;

   PROCEDURE REWRITE_NET(VAR F;RECSIZE:WORD;FNAME:STRING);
   PROCEDURE RESET_NET(VAR F:FILE;RECSIZE:WORD;FNAME:STRING);
   FUNCTION  IS_PENSIONER(CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION  IS_INVALID(CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION  IS_INNERSOWM(CURR_PERSON:PERSON_PTR):BOOLEAN;
   PROCEDURE SELECT(I:INTEGER);
   function findFreeSelected:Integer;
   procedure Delay(R:Integer);
   procedure DelayPascal(dwMilliseconds: Longint);
   FUNCTION IS_KAND_NAUK(CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION IS_DOCENT(CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION IS_DOKTOR_NAUK(CURR_PERSON:PERSON_PTR):BOOLEAN;
   FUNCTION IS_PROFESSOR(CURR_PERSON:PERSON_PTR):BOOLEAN;

   FUNCTION  IS_PRINAT_UWOLEN(CURR_PERSON:PERSON_PTR):BOOLEAN;
   function  STORONNEE_PODRAZD(wanted_serv:integer):boolean;
   function  RECENZENT_PODRAZD(wanted_serv:integer):boolean;
   FUNCTION  GetLgotyPN2004(CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION  GetProcPensNalog(CURR_PERSON:PERSON_PTR;Summa:Real;var PensNalog:real;START_MONTH:INTEGER;
                             START_YEAR:INTEGER):REAL;
   FUNCTION  GetProcECBNalog(CURR_PERSON:PERSON_PTR;Summa:Real;var ECBNalog:real;START_MONTH:INTEGER;
                    START_YEAR:INTEGER; var WantedECBShifr:integer):REAL;
   FUNCTION GetProcECBNalogDirect(CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER;
            START_YEAR:INTEGER; var WantedECBShifr:integer;WantedPodr:integer=0):REAL;

   Function  IsColedgPodr(nserv:integer):boolean;
   Function  IsGKHPodr(nserv:integer):boolean;
   Function  IsIskraPodr(nserv:integer):boolean;
   FUNCTION  IS_FOND5(CURR_PERSON:PERSON_PTR):BOOLEAN;
   PROCEDURE MAKE_FOND5(CURR_PERSON:PERSON_PTR);
   FUNCTION  IS_NOTFOND5(CURR_PERSON:PERSON_PTR):BOOLEAN;
   PROCEDURE MAKE_NOTFOND5(CURR_PERSON:PERSON_PTR);
   FUNCTION  IS_PENS_PROC_ZAKON(CURR_PERSON:PERSON_PTR):BOOLEAN;
   function  GetSummaNachForPodohInCn(Curr_Person:Person_Ptr;WantedPeriod:word):real;
   function  GetSummaPodohInCn(Curr_Person:Person_Ptr;WantedPeriod:word):real;
   function  GetSummaPensInCn(Curr_Person:Person_Ptr;WantedPeriod:word):real;
   function  IsOtherPeriodECBShifr(I:Integer):boolean;
   function  IsOtherPeriodECBShifrLNRForSwodGtLimit(I:Integer):boolean;
   function  IsOtherPeriodForMinSal(I:Integer):boolean;
   function  IsOtherPeriodECBShifrForYear(I:Integer;Y:integer):boolean;
   function  IsBolnShifr(I:Integer):boolean;
   function  IsBolnShifrForECB(I:Integer):boolean;
   function  IsOtpShifr(I:Integer):boolean;
   function  IsBolnShifrLera(I:Integer):boolean;
   function  IsKassaShifr(I:Integer):boolean;
   function  IsOnHandShifr(I:Integer):boolean;
   function  isDogPodOnlyNach(Curr_Person:Person_Ptr):Boolean;
   function  isBolnSSOnlyNach(Curr_Person:Person_Ptr):Boolean;
//   function IsOtherPeriodECBShifr(I:Integer):boolean;
   FUNCTION  IS_ALIMENTY_SHIFR(SHIFR:INTEGER):BOOLEAN;
   FUNCTION  SUM(SUMMA:REAL):REAL;
   PROCEDURE SET_UP_FOR_PODOH_SOWM_SEARCH(CURR_PERSON:PERSON_PTR);
   FUNCTION  FIND_CN_BASE(CURR_PERSON:PERSON_PTR;
                          WANTED_SHIFR:INTEGER;
                          WANTED_MONTH:INTEGER):CN_PTR;
   function  GET_PROCENT_POCHTOW_SBOR(SUMMA:REAL;MODE:INTEGER;VAR CODE_PROC:REAL):REAL;
   FUNCTION  GET_ALIMENTY_MODE(ALABEL:word):BYTE;
   FUNCTION  IS_TEST_DEKRET(CURR_PERSON:PERSON_PTR):BOOLEAN;
   function  IsNetLgotyPN(CURR_PERSON:PERSON_PTR):BOOLEAN;

   FUNCTION  SUM_VYPLACHENO_UD(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):REAL;
   FUNCTION  SUM_VYPLACHENO_ADD(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):REAL;
   FUNCTION  SUM_VYPLACHENO_ADD_ID(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER;ID:WORD):REAL;
   FUNCTION  R10(SUMMA:REAL):REAL;
   FUNCTION  FORMAT_S(B:REAL;L:INTEGER):STRING;
   FUNCTION  FORMAT_SE(B:REAL;L:INTEGER):STRING;
   FUNCTION  FORMAT_K(A:REAL;L:INTEGER):STRING;
   function  GetRazrjadPerson(CURR_PERSON:PERSON_PTR):INTEGER;
   PROCEDURE SetRazrjadPerson(CURR_PERSON:PERSON_PTR;RAZR:INTEGER);
   FUNCTION  GET_MEM_PAR(SWODMODE:WORD):BOOLEAN;
   procedure MoveBolToPerson(ShifrIdBoln : integer;
                             Gruppa   : integer;
                             Tabno    : integer;
                             ShifrPod : integer;
                             ShifrKat : integer;
                             ShifrGru : integer;
                             ShifrDol : integer;
                             ShifrWR  : integer;
                             ShifrSwmMode : integer;
                             Dolg     : string;
                             NeedAdd  : boolean;
                             CodeMOve : integer);
   procedure MoveOtpToPerson(ShifrIdOtp : integer;
                             Gruppa   : integer;
                             Tabno    : integer;
                             ShifrPod : integer;
                             ShifrKat : integer;
                             ShifrGru : integer;
                             ShifrDol : integer;
                             ShifrWR  : integer;
                             ShifrSwmMode : integer;
                             Dolg     : string;
                             GUID     : string;
                             NeedAdd  : boolean);
   procedure MoveKmdToPerson(ShifrIdKmd : integer;
                             Gruppa   : integer;
                             Tabno    : integer;
                             ShifrPod : integer;
                             ShifrKat : integer;
                             ShifrGru : integer;
                             ShifrDol : integer;
                             ShifrWR  : integer;
                             ShifrSwmMode : integer;
                             Dolg     : string;
                             NeedAdd  : boolean);
   FUNCTION  LenMonth(DateW:TDateTime):Integer;
   function  DateBetween(TestedDate,DateB,DateE:TDateTime):boolean;
   function  NeedCorrectBolnTabel(DateB,DateE,DateFr,DateTo:TDateTime):boolean;
   PROCEDURE MAKE_ILL_TABEL(Curr_Person:Person_Ptr;DataFr,DataTo:TDateTime);
   PROCEDURE MAKE_KMD_TABEL(Curr_Person:Person_Ptr;DataFr,DataTo:TDateTime);
   PROCEDURE MAKE_OTP_TABEL(Curr_Person:Person_Ptr;DataFr,DataTo:TDateTime);
   PROCEDURE MAKE_OTP_TABEL_FROM_SQL(Curr_Person:Person_Ptr);
   PROCEDURE MAKE_OG_TABEL_FROM_SQL(Curr_Person:Person_Ptr);
   function GetShifrWrk:integer;
   function get_bank_name(shifrban:integer):string;
   FUNCTION IS_LUGANSK(S:STRING):BOOLEAN;
   FUNCTION IS_KASSA(S:STRING):BOOLEAN;
   FUNCTION IS_PRAVEKSBANK(S:STRING):BOOLEAN;
   FUNCTION IS_PRIVATBANK(S:STRING):BOOLEAN;
   FUNCTION GET_ALIMENTY_PRIM(ALABEL:WORD):WORD;
   FUNCTION CODE_ALIMENTY_PRIM(ALABEL:WORD;MODE:BYTE):WORD;
   function DOG_POD_PODRAZD(wanted_serv:integer):boolean;
   function IsPrivatBankPerson(Curr_Person:Person_Ptr):boolean;
   function IsBrokBiznesBankPerson(Curr_Person:Person_Ptr):boolean;
   function IsUkrSibBankPerson(Curr_Person:Person_Ptr):boolean;
   function IsKassaPerson(Curr_Person:Person_Ptr):boolean;
   function GetNamePSbor(code:integer):string;

   function WinExecAndWait32(FileName: string; Visibility: integer): LongInt;
   FUNCTION REPLICATE(SYMB:CHAR;N:INTEGER):STRING;
   function ConvertUkrStrToSql(S:String):String;
   FUNCTION GetKwoDetOdMPN2004(CURR_PERSON:PERSON_PTR):integer;
   FUNCTION getSingleMonherForPN2004(CURR_PERSON:PERSON_PTR):Boolean;
   function GetPorNomerPerson(CURR_PERSON:PERSON_PTR):INTEGER;
   FUNCTION GetKreditNomerDog(CURR_PERSON:PERSON_PTR):integer;
   function CompareUkrText(S1, S2: string): integer;
   function ReplCommaOnPoint(src:string):string;
   function IsExcelInstalled: boolean;
   FUNCTION GET_PROG_MIN(Y:Integer;W_NMES:INTEGER):REAL;
   FUNCTION GET_LIMIT_FOR_PENS(Y:Integer;W_NMES:INTEGER):REAL;
   FUNCTION GET_MIN_SALARY(Y:Integer;W_NMES:INTEGER):REAL;
   FUNCTION IsPensionerByDate(Curr_Person:Person_Ptr):boolean;
 //  function NumeralToPhrase(const SVal: real) : String;
   function NumeralToPhrase(const SVal: real;Mode:integer=0;ShortMode:boolean=false) : String;
   function isSixDayMode(curr_person:person_ptr):boolean;
   function isFiveDayMode(curr_person:person_ptr):boolean;
   function GetWDay(Period:integer;curr_person:person_ptr):Real;
   function GetWorkClockForYearMonth(Y:integer;M:Integer):real;
   function GetDayCode(k:integer):Integer;
   procedure SetUpSowm(Tabno,W_P:integer);
   function GetNal_CodePerson(Tabno:integer):string;
   function GetFullRusFioPerson(Tabno:integer):string;
   function GetFullUkrFioPerson(Tabno:integer):string;
   function getPersonInn(tabno:integer):string;
   function getPersonPaspForInn(Tabno:integer):string;
   function getPersonBankCount(tabno:integer):string;
   function IsSecretTabno(Tabno:integer):boolean;
   function IsSecretPodr(ServNo:integer):boolean;
   function NeedCodePersonLine(Tabno:integer):boolean;
   function ExistDataIndInCn(Curr_Person:Person_Ptr):Boolean;
   function GetBaseMonthYearPerson(Curr_Person:Person_Ptr; var m:integer; var y:integer):boolean;
   function SetBaseMonthYearPerson(Curr_Person:Person_Ptr; m:integer; y:integer):boolean;
   procedure DeleteAllFromTmpBolnTables;
   procedure DeleteAllFromTmpOtpTables;
   procedure DeleteAllFromTmpPersonTables;
   function getSummaAddForPerson(curr_person:PERSON_PTR):Real;
   function getSummaPremForPerson(curr_person:PERSON_PTR):Real;
   function getSummaAddForThisMonthForPerson(curr_person:PERSON_PTR):Real;
   function getSummaUdForPerson(curr_person:PERSON_PTR):Real;
   function getSummaAddForPersonW(curr_person:PERSON_PTR;WantedShifr:Integer;wantedPeriod:integer):Real;
   function getSummaNalogiPerson(curr_person:PERSON_PTR):Real;


   function IsShifrInAddPerson(Curr_Person:Person_Ptr;WantedShifr:integer):boolean;
   function ExistWantedudShifrInPerson(WantedShifr:integer;
                                    Curr_Person:Person_Ptr;
                                    WantedY:integer;
                                    WantedM:integer):boolean;
   function ExistWantedAddShifrInPerson(WantedShifr:integer;
                                    Curr_Person:Person_Ptr;
                                    WantedY:integer;
                                    WantedM:integer):boolean;

   //   function GetGUID(var S:String;var Summa:Real):boolean;
   function GetGUID(var S:String;var Summa1,Summa2,Summa3:Real):boolean;
//   function  FormatGUID(S:String;Summa:real):string;
   function  FormatGUID(S:String;Summa1,Summa2,Summa3:real):string;
   procedure MakeGUID(Curr_Person:Person_Ptr);
   function GetGUIDPerson(Curr_Person:Person_ptr; var GUIDS:string):boolean;
   function GetGUIDPersonToString(Curr_Person:Person_ptr):string;
   procedure putGUIDToPerson(Curr_Person:PERSON_PTR;summa1:Real;summa2:Real;summa3:real);
   PROCEDURE MAKE_PERSON_STATE(CURR_PERSON:PERSON_PTR);
   function MakeArchivForData(wantedMonth:integer):string;

   function GetOsnKateg(Curr_Person:Person_Ptr):integer;
   function DeCodeReasonILL(SrcCode:integer):integer;
   function CodeReasonILL(SrcCode:integer):integer;
   function IsLgotyPN2011(CURR_PERSON:PERSON_PTR):boolean;
   function IsSciPed(Curr_Person:Person_Ptr):boolean;
   function CalcECB(Curr_Person : Person_Ptr;
                    W_Place     : integer;
                    Start_Month : integer;
                    Start_Year  : integer;
                    ECBNNach      ,
                    ECBNUd        ,
                    ECBNach       ,
                    ECBUd         ,
                    ECBDPNAch     ,
                    ECBDPUd       ,
                    ECBIllNach    ,
                    ECBIllUd      ,
                    ECB_Self_Nach ,
                    ECB_Self_Ud   : real):real;
   function CalcECBFull(Curr_Person : Person_Ptr;
                     W_Place     : integer;
                     Start_Month : integer;
                     Start_Year  : integer;
                     ECBNNach   ,
                     ECBNUd     ,
                     ECBNach    ,
                     ECBUd      ,
                     ECBDPNAch  ,
                     ECBDPUd    ,
                     ECBIllNach ,
                     ECBIllUd   ,
                     ECB_Self_Nach ,
                     ECB_Self_Ud   : real):real;
 function CalculateECBNSelf(Curr_Person : Person_Ptr;
                     W_Place     : integer;
                     Start_Month : integer;
                     Start_Year  : integer;
                     ECBNNach   ,
                     ECBNUd     ,
                     ECBNach    ,
                     ECBUd      ,
                     ECBDPNAch  ,
                     ECBDPUd    ,
                     ECBIllNach ,
                     ECBIllUd   ,
                     ECB_Self_Nach ,
                     ECB_Self_Ud   : real):real;
 function CalculateECBNFull(Curr_Person : Person_Ptr;
                     W_Place     : integer;
                     Start_Month : integer;
                     Start_Year  : integer;
                     ECBNNach   ,
                     ECBNUd     ,
                     ECBNach    ,
                     ECBUd      ,
                     ECBDPNAch  ,
                     ECBDPUd    ,
                     ECBIllNach ,
                     ECBIllUd   ,
                     ECB_Self_Nach ,
                     ECB_Self_Ud   : real;
                     var EcbForNalog:real):real;

 function CalculateECBSelf(Curr_Person : Person_Ptr;
                     W_Place     : integer;
                     Start_Month : integer;
                     Start_Year  : integer;
                     ECBNNach   ,
                     ECBNUd     ,
                     ECBNach    ,
                     ECBUd      ,
                     ECBDPNAch  ,
                     ECBDPUd    ,
                     ECBIllNach ,
                     ECBIllUd   ,
                     ECB_Self_Nach ,
                     ECB_Self_Ud   : real):real;

 function CalculateECBFull(Curr_Person : Person_Ptr;
                     W_Place     : integer;
                     Start_Month : integer;
                     Start_Year  : integer;
                     ECBNNach   ,
                     ECBNUd     ,
                     ECBNach    ,
                     ECBUd      ,
                     ECBDPNAch  ,
                     ECBDPUd    ,
                     ECBIllNach ,
                     ECBIllUd   ,
                     ECB_Self_Nach ,
                     ECB_Self_Ud   : real;
                     var EcbForNalog:real):real;

 function CalculateECBDPSelf(Curr_Person : Person_Ptr;
                             W_Place     : integer;
                             Start_Month : integer;
                             Start_Year  : integer;
                             ECBNNach   ,
                             ECBNUd     ,
                             ECBNach    ,
                             ECBUd      ,
                             ECBDPNAch  ,
                             ECBDPUd    ,
                             ECBIllNach ,
                             ECBIllUd   ,
                             ECB_Self_Nach ,
                             ECB_Self_Ud   : real):real;

 function CalculateECBDPFull(Curr_Person : Person_Ptr;
                             W_Place     : integer;
                             Start_Month : integer;
                             Start_Year  : integer;
                             ECBNNach   ,
                             ECBNUd     ,
                             ECBNach    ,
                             ECBUd      ,
                             ECBDPNAch  ,
                             ECBDPUd    ,
                             ECBIllNach ,
                             ECBIllUd   ,
                             ECB_Self_Nach ,
                             ECB_Self_Ud   : real):real;

 function CalculateECBIllSelf(Curr_Person : Person_Ptr;
                             W_Place     : integer;
                             Start_Month : integer;
                             Start_Year  : integer;
                             ECBNNach   ,
                             ECBNUd     ,
                             ECBNach    ,
                             ECBUd      ,
                             ECBDPNAch  ,
                             ECBDPUd    ,
                             ECBIllNach ,
                             ECBIllUd   ,
                             ECB_Self_Nach ,
                             ECB_Self_Ud   : real):real;

 function CalculateECBIllFull(Curr_Person : Person_Ptr;
                             W_Place     : integer;
                             Start_Month : integer;
                             Start_Year  : integer;
                             ECBNNach   ,
                             ECBNUd     ,
                             ECBNach    ,
                             ECBUd      ,
                             ECBDPNAch  ,
                             ECBDPUd    ,
                             ECBIllNach ,
                             ECBIllUd   ,
                             ECB_Self_Nach ,
                             ECB_Self_Ud   : real):real;


  FUNCTION IS_ALL_BLOCKED(CURR_PERSON:PERSON_PTR):BOOLEAN;
  procedure MakeLgotyPNInCN(Curr_Person:Person_Ptr);
  function CanModify:Boolean;
  function SavePodr : boolean;
  function RestorePodr : boolean;
  procedure EmptySavedArea ;
  procedure EmptyWorkArea ;
  function FillClockForPerson(Tabno:Integer;Curr_Add:Add_Ptr):real;
  function GetPochasClockFromDB(Tabno:integer):real;
  function FormatSummaForPlt(a:real):string;
  FUNCTION GET_PERSON_CURFIL(CURFIL:INTEGER):PERSON_PTR;
  function makeJournalFileName(var escPressed:boolean):string;
  function getNameHat:string;
  function convertTabnoToIskraOldStyle(snuTabno:integer):integer;
  function isParameterIskra:boolean;
  function ConvertDataForDBF(D:TdateTime):string;
  function ConvertDataToDDMMYYYY(D:TdateTime):string;
  function IsNumericString(S:String):Boolean;
  function SetWorkPlaceKadrySQL(WorkPlace:word;Tabno:integer):boolean;
  function ZeroWorkPlaceKadrySQL(Tabno:integer):boolean;
  function GetMd5ForNSRV:string;
  function GetFeaturesOfNSRV(var nmbofperson,nmbofadd,nmbofud,nmbofcn,nmbofsowm:integer):boolean;
  procedure putNSRVFeaturesToSQLAfterPutInf;
  procedure putNSRVFeaturesToSQLAfterGetInf;
  function CompareNSRV(var Mes:string):Boolean;
  procedure setDataUwPerson(Curr_Person:Person_Ptr;DataUwPerson:TDateTime);
  function getDataUwPerson(Curr_Person:Person_Ptr):TDateTime;
  function getDataUwPersonFromSQL(Tabno:integer):TDateTime;
  function getDataPriPersonFromSQL(Tabno:integer):TDateTime;
  function getDayOfUwol(Curr_Person:Person_Ptr):Integer;
  function getDayOfUwolFromSQL(Curr_Person:Person_Ptr):Integer;
  function getDayOfUwolFromSQLForNMES(Curr_Person:Person_Ptr):Integer;
  function getDayOfPriFromSQL(Curr_Person:Person_Ptr):Integer;
  function getDayOfPriFromSQLForNMES(Curr_Person:Person_Ptr):Integer;
  function isUwolenFromSQL(Curr_Person:Person_Ptr):boolean;
  function isUwolenFromSQLForNMES(Curr_Person:Person_Ptr):boolean;
  function isPrinjatFromSQL(Curr_Person:Person_Ptr):boolean;
  function isPrinjatFromSQLForNMES(Curr_Person:Person_Ptr):boolean;
  function DecodeDataFromPrim1(S:String):TDateTime;
  procedure CheckTabelForUwol(Curr_Person:Person_Ptr);
  function getStaNameForSwodFromSQL(WantedShifr:integer):string;
  function GetMemoryTotalPhys : DWord;
  function IsBankShifr(Shifr:integer):Boolean;
  function getOkladLastForRazr(wantedRazr:integer):real;
  PROCEDURE FILL_STANDARD_TABEL_PERSON(CURR_PERSON:Person_Ptr);
//  procedure Make_Otp_Tabel_person(Curr_Person:Person_ptr);
  procedure FILL_TABEL_UW_PERSON(curr_person:person_ptr);
  procedure RestPerson09(Curr_Person:Person_Ptr;fname:string);
  procedure tryToFind09inAllFiles(Curr_Person:Person_Ptr);
  function getRektorFIO:string;
  function getRektorDolg:string;
  function getGlBuhFIO:string;
  function getGlBuhDolg:string;
  function getNameUniFromSQL:string;
  function getShortCurrencyName:string;
  function getRazrOkladByDolg(shifrIdDolg:Integer;var razr:Integer;var oklad:real):boolean;
  function getPolRusByNalCode(nalCode:string):string;
  function getPolForF6(nalCode:string):integer;
  function isForbiddenPodrWrite(N_SERV:integer):Boolean;
  function GetFullPodrNameFromSQL(nserv:integer):string;
  function GetHistoryPodrNameFromSQL(nserv:integer;y,m:integer):string;
  function GetHistoryPodrNameFromSQLSalArc(nserv:integer;y,m:integer):string;
  function checkNeedDolgTest(shifrDol:integer):boolean;
  function putSVDNFooterRec:Boolean;
  function getSVDNFooterRec:Boolean;
  procedure testSVDNRec;
  function getPersonBVGN(curr_person:PERSON_PTR):Integer;
  function mayBeEmptyPodr(shifrPod:integer):boolean;
  function getVariantInteger(v:variant):Integer;
  function getVariantReal(v:variant):Real;
  function getVariantString(v:variant):String;
  function getVariantDate(v:variant):TDateTime;
  procedure putSQLStmntToLog(SqlStmnt:string);
  function getNachPremForPerson(Curr_Person:person_ptr):real;
  function getNachPremForPersonInNSRV(Curr_Person:person_ptr):real;
  function isPersonAUP_PPS(curr_person:person_ptr):Boolean;
  function getDepCodeFromSQL(currCode:integer=0):integer;
  function getNameDepPodrFromSQL(shifrDepPodr:integer):string;
  function GetPodrNomerPerson(CURR_PERSON:PERSON_PTR):INTEGER;
  function isProtectedPodr(shifrPod:integer):boolean;
  procedure fillNamesReservPodr;
  function getNameNextData:string;
  procedure getNextMY(var m:integer; var y: integer);
  procedure markPKG66(wantedShifrPKG:integer);
  procedure makeMonthForYear(Y:integer);
  function CheckExcelInstalled(AValue: String): boolean;
  function getMORForPutInf:integer;
  function getIniFileName:string;
  function isCorrectLNRPodoh13Person(curr_person:person_ptr):boolean;
  function checkForma5ForVnePerson(curr_person:person_ptr):boolean;
  procedure DeleteViruses;
  function getIOSemaphore(kind:Integer=2):boolean;
  procedure freeIOSemaphore;
  procedure receiveIOSemaphoreForWrite;
  procedure receiveIOSemaphoreForRead;
  function  getShifrWrForBoln(TABNO:Integer;summa:Real;Y:integer;m:integer):Integer;
  function isSciPedForSwod(curr_person:person_ptr):boolean;
  function get156MessageFromCn(Curr_Person:Person_ptr;Period:Integer;Summa:Real):string;
  procedure put156MessageToCn(Curr_Person:Person_ptr;Period:Integer;Summa:Real;Mess:string);
  procedure delete156MessageFromCn(Curr_Person:Person_ptr);



implementation
   uses Math,SysUtils,QDialogs,DateUtils,QControls,ScrLists,ScrIo,ScrLini,
        UFIBModule,uFormWait,FORMS,ScrNalog,ShellApi,WinDows,ScrExport,Classes,
        ComObj,ActiveX,IniFiles,uMD5,Variants, FIBDatabase,USQLUnit,UFormDepartmentSeek,
        scrnetwork,types,SqlTimSt;
   const doss:array[1..72] of byte = ($49,$69,$80,$81,$82,$83,$84,$85,$F0,$F2,$F3,$F4,$F5,$86,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F,$90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F,$A0,$A1,$A2,$A3,$A4,$A5,$F1,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF);
   const wins:array[1..72] of byte = ($B2,$B3,$C0,$C1,$C2,$C3,$C4,$C5,$A8,$AA,$BA,$AF,$BF,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$B8,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$FF);
 { AA(BA) -win f2(f3) - dos ukr E; AF(BF) - win F4(F5) - dos ukr II}
 { B2(B3) -win I     49(69) - dos ukr I}
   // Sets UnixStartDate to TDateTime of 01/01/1970
  UnixStartDate: TDateTime = 25569.0;


 TYPE SEARCH_TYPE = (ANY,OTHER);
      R_TYPE = RECORD
                      TABNO            : SEARCH_TYPE;
                      FIO              : SEARCH_TYPE;
                      GRUPPA           : SEARCH_TYPE;
                      KATEGORIJA       : SEARCH_TYPE;
                      DOLG             : SEARCH_TYPE;
                      OKLAD            : SEARCH_TYPE;
                      WID_RABOTY       : SEARCH_TYPE;
                      N_TEMY           : SEARCH_TYPE;
                      MESTO_OSN_RABOTY : SEARCH_TYPE;
                      WID_OPLATY       : SEARCH_TYPE;
                      MODE             : SEARCH_TYPE;
                      MAIN             : SEARCH_TYPE;
               END;
      C_TYPE = RECORD
                      TABNO            : INTEGER;
                      FIO              : STRING[20];
                      GRUPPA           : INTEGER;
                      KATEGORIJA       : INTEGER;
                      DOLG             : STRING[10];
                      OKLAD            : REAL;
                      WID_RABOTY       : INTEGER;
                      N_TEMY           : STRING[10];
                      MESTO_OSN_RABOTY : INTEGER;
                      WID_OPLATY       : INTEGER;
                      MODE             : INTEGER;
                      MAIN             : INTEGER;
               END;
 VAR R : R_TYPE;
     C : C_TYPE;
     STEP_NET:REAL;

function DateTimeToUnix(ConvDate: TDateTime): Longint;
 begin
   //example: DateTimeToUnix(now); 
  Result := Round((ConvDate - UnixStartDate) * 86400);
 end;

 function UnixToDateTime(USec: Longint): TDateTime;
 begin
   //Example: UnixToDateTime(1003187418); 
  Result := (Usec / 86400) + UnixStartDate;
 end;
   PROCEDURE MKFLNM;
    VAR S,D,P:STRING;
        RealNsrv:Integer;
    BEGIN
        FNINF:='d:\vugu\data\august\f0108057.dat';

        IF NMES>9 THEN STR(NMES:2,S)
                  ELSE BEGIN STR(NMES:1,S); S:='0'+S END;
        RealNsrv:=Shifr_Serv(Nsrv);
        IF (RealNSRV>9) AND (RealNsrv<100) THEN BEGIN STR(RealNSRV:2,D); D:='0'+D; END;
        IF (RealNSRV>99) THEN STR(RealNSRV:3,D);
        IF RealNSRV<10   THEN BEGIN STR(RealNSRV:1,D); D:='00'+D END;
        IF NPDR>9 THEN STR(NPDR:2,P)
                  ELSE BEGIN STR(NPDR:1,P); P:='0'+P END;
     //   IF (NMES<>FLOW_MONTH) THEN
     //      FNINF:=GET_CURRENT_DISK+COPY(ALLTRIM(DDIR),3,LENGTH(ALLTRIM(DDIR))-2)+A_MONTH[NMES]+'\F'+P+S+D+'.DAT'
     //               ELSE
         FNINF:=DDIR+A_MONTH[NMES]+'\F'+P+S+D+'.DAT';


    END;
   FUNCTION testFninf:boolean;
    VAR retVal               : boolean;
        shifrPod,shifrNmes   : integer;
        shifrPodS,shifrNmesS : String;
        fileName             : string;
        iErr:integer;
    BEGIN
        retVal:=false;
        fileName   := ExtractFileName(fninf);
        ShifrPodS  := copy(fileName,6,3);
        val(shifrPodS,shifrPod,iErr);
        if iErr>0 then
           begin
                testFninf:=retVal;
                exit;
           end;
        if not ((ShifrPod>=1) and (ShifrPod<=MAX_COUNT_PODRAZD)) then
           begin
                testFninf:=retVal;
                exit;
           end;
        if (shifrPod<>NSRV) then
           begin
                testFninf:=retVal;
                exit;
           end;

        shifrNmesS:=copy(fileName,4,2);
        val(shifrNmesS,shifrNmes,iErr);
        if iErr>0 then
           begin
                testFninf:=retVal;
                exit;
           end;
        if not ((ShifrNmes>=1) and (ShifrNmes<=12)) then
           begin
                testFninf:=retVal;
                exit;
           end;
        if (shifrNmes<>NMES) then
           begin
                testFninf:=retVal;
                exit;
           end;
        retVal:=true;
         testFninf:=retVal;

    END;
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
   function MKFLNM_TMP_SAVE(var EscPressed:boolean):string;
    VAR S,D,P    : STRING;
        RealNsrv : Integer;
        DirName  : string;
    BEGIN
        EscPressed:=False;
        Result:='';
        IF NMES>9 THEN STR(NMES:2,S)
                  ELSE BEGIN STR(NMES:1,S); S:='0'+S END;
        RealNsrv:=Shifr_Serv(Nsrv);
        IF (RealNSRV>9) AND (RealNsrv<100) THEN BEGIN STR(RealNSRV:2,D); D:='0'+D; END;
        IF (RealNSRV>99) THEN STR(RealNSRV:3,D);
        IF RealNSRV<10   THEN BEGIN STR(RealNSRV:1,D); D:='00'+D END;
        IF NPDR>9 THEN STR(NPDR:2,P)
                  ELSE BEGIN STR(NPDR:1,P); P:='0'+P END;
        IF (NMES<>FLOW_MONTH) THEN
           DirName :=GET_CURRENT_DISK+COPY(ALLTRIM(DDIR),3,LENGTH(ALLTRIM(DDIR))-2)+A_MONTH[NMES]+'\Tmp'
        ELSE
           DirName := DDIR+A_MONTH[NMES]+'\Tmp';
        if isLNR then
           if needServerAppData then
               dirName:=tmpDir+trim(A_MONTH[NMES])+'\Tmp';
        if not DirectoryExists(DirName) then
           if not CreateDir(DirName) then
              if not ForceDirectories(dirName) then
                 EscPressed:=True;
        MKFLNM_TMP_SAVE   := DirName+'\F'+P+S+D+'.DAT';
    END;
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
   PROCEDURE MKFLNM_Y;
    VAR S,D,P,Y_S:STRING;
        RealNsrv:Integer;
    BEGIN
        FNINF:='d:\vugu\data\august\f0108057.dat';

        IF NMES>9 THEN STR(NMES:2,S)
                  ELSE BEGIN STR(NMES:1,S); S:='0'+S END;
        RealNsrv:=Shifr_Serv(Nsrv);
        IF (RealNSRV>9) AND (RealNsrv<100) THEN BEGIN STR(RealNSRV:2,D); D:='0'+D; END;
        IF (RealNSRV>99) THEN STR(RealNSRV:3,D);
        IF RealNSRV<10   THEN BEGIN STR(RealNSRV:1,D); D:='00'+D END;
        IF NPDR>9 THEN STR(NPDR:2,P)
                  ELSE BEGIN STR(NPDR:1,P); P:='0'+P END;
        if ((CurrYear>1990) and (CurrYear<2100)) then Y_S:=IntToStr(CurrYear)
                                                 else Y_S:='';
{        IF (NMES<>FLOW_MONTH) THEN}
           FNINF:=GET_CURRENT_DISK+COPY(ALLTRIM(DDIR),3,LENGTH(ALLTRIM(DDIR))-3)+TRIM(Y_S)+'\'+A_MONTH[NMES]+'\F'+P+S+D+'.DAT'
{                    ELSE
        FNINF:=DDIR+A_MONTH[NMES]+TRIM(Y_S)+'\F'+P+S+D+'.DAT';
}        
    END;
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
   function MKFLPODR_Y:string;
    VAR retVal,f:string;
    BEGIN
        retVal:=DDIR+A_MONTH[NMES]+'\PODR1.TXT';
        MKFLPODR_Y:=retVal;
    END;

{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
   PROCEDURE MKFLNM_BAK_FOR_VERSION(VAR FNINF_BAK_FOR_VERSION:String);
    VAR S,D,P:STRING;
        I:INTEGER;
        RealNsrv:Integer;
        DirName:string;
        WantedDrive:string;
        WantedDriveVal:byte;
        DF,DS:int64;
        DP,DFR,DSR:real;
    BEGIN
        IF NMES>9 THEN STR(NMES:2,S)
                  ELSE BEGIN STR(NMES:1,S); S:='0'+S END;
        RealNsrv:=Shifr_Serv(Nsrv);
        IF (RealNSRV>9) AND
           (RealNSRV<100) THEN
            BEGIN
                 STR(RealNSRV:2,D);
                 D:='0'+D;
            END;
        IF (RealNSRV>99) THEN
            str(RealNSRV:3,D);
        IF RealNSRV<10 THEN
           BEGIN
                STR(RealNSRV:1,D);
                D:='00'+D
           END;
        IF NPDR>9 THEN STR(NPDR:2,P)
                  ELSE BEGIN STR(NPDR:1,P); P:='0'+P END;
//        IF (NET_MODE) AND (NMES<>FLOW_MONTH) THEN
        bdir:=trim(bdir);
        i:=pos(':',bdir);
        if i=2 then
           begin
                 WantedDrive:=copy(bdir,1,1);
                 WantedDriveVal:=Ord(WantedDrive[1])-Ord('A')+1;
                 DF:=DiskFree(WantedDriveVal);
                 DS:=DiskSize(WantedDriveVal);
                 if ds>0 then
                    begin
                         DFR:=DF;
                         DSR:=DS;
                         DP:=r10(DFR  / DSR*100);
                         if DP<5 then
                            ShowMessage('Осталось менее 5% св места на диске '+WantedDrive+'. Очистите диск!!!');
                    end;

           end;
        DirName:=BDIR+A_MONTH[NMES]+'\'+D;
        if not DirectoryExists(DirName) then
           if not CreateDir(DirName) then
              if not ForceDirectories(DirName) then
                 raise Exception.Create('Cannot create '+Dirname);
        FNINF_BAK_FOR_VERSION:=DirName+'\F'+P+S+D+'_????.DAT';
    END;
   function mk_flnm_bak_versio(Actn:integer):string;
     var
        sr         : TSearchRec;
        FileAttrs  : Integer;
        CurrVersio : Integer;
        Template   : string;
        S,ss       : string;
        i,j        : Integer;
     begin
           CurrVersio:=0;
           MKFLNM_BAK_FOR_VERSION(Template);
           FileAttrs := 0;
           FileAttrs := FileAttrs + faAnyFile;
           if FindFirst(Template, FileAttrs, sr) = 0 then
              repeat
                   S:=Trim(sr.Name);
                   s:=Copy(S,length(S)-7,4);
                   Val(s,i,j);
                   if j=0 then
                      if i>CurrVersio then
                         CurrVersio:=i;
              until FindNext(sr) <> 0;
           SysUtils.FindClose(sr);
           if Actn=1 then
              Inc(CurrVersio);
           s:=Trim(IntToStr(CurrVersio));
           while (Length(s)<4) do s:='0'+s;
           ss:=StringReplace(Template,'????',s,[]);
           mk_flnm_bak_versio:=SS;

     end;
   PROCEDURE MKFLNM_BAK_FOR_READ(VAR FNINF_BAK:String);
     begin
         FNINF_BAK:=mk_flnm_bak_versio(0);
     end;
   PROCEDURE MKFLNM_BAK_FOR_WRITE(VAR FNINF_BAK:String);
     begin
         FNINF_BAK:=mk_flnm_bak_versio(1);
     end;
   PROCEDURE MKFLNM_BAK(VAR FNINF_BAK:String);
    VAR S,D,P:STRING;
        I:INTEGER;
        RealNsrv:Integer;
    BEGIN
        IF NMES>9 THEN STR(NMES:2,S)
                  ELSE BEGIN STR(NMES:1,S); S:='0'+S END;
        RealNsrv:=Shifr_Serv(Nsrv);
        IF (RealNSRV>9) AND
           (RealNSRV<100) THEN
            BEGIN
                 STR(RealNSRV:2,D);
                 D:='0'+D;
            END;
        IF (RealNSRV>99) THEN
            str(RealNSRV:3,D);
        IF RealNSRV<10 THEN
           BEGIN
                STR(RealNSRV:1,D);
                D:='00'+D
           END;
        IF NPDR>9 THEN STR(NPDR:2,P)
                  ELSE BEGIN STR(NPDR:1,P); P:='0'+P END;
//        IF (NET_MODE) AND (NMES<>FLOW_MONTH) THEN
        IF (NMES<>FLOW_MONTH) THEN
           FNINF_BAK:=GET_CURRENT_DISK+COPY(ALLTRIM(BDIR),3,LENGTH(ALLTRIM(BDIR))-2)+A_MONTH[NMES]+'\F'+P+S+D+'.DAT'
                    ELSE FNINF_BAK:=BDIR+A_MONTH[NMES]+'\F'+P+S+D+'.DAT';
    END;

{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }

   PROCEDURE MK_OLD_FNINF;
    VAR S,D,P:STRING;
        I:INTEGER;
    BEGIN
        IF NMES>9 THEN STR(NMES:2,S)
                  ELSE BEGIN STR(NMES:1,S); S:='0'+S END;
        IF (NSRV>9) AND (NSRV<100) THEN BEGIN STR(NSRV:2,D); D:='0'+D; END;
        IF (NSRV>99) THEN STR(NSRV:3,D);
        IF NSRV<10   THEN BEGIN STR(NSRV:1,D); D:='00'+D END;
        IF NPDR>9 THEN STR(NPDR:2,P)
                  ELSE BEGIN STR(NPDR:1,P); P:='0'+P END;
        FNINF:=DDIR+'OLDMONTH\F'+P+D+'.DAT';
   END;





{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
FUNCTION GET_CURRENT_DISK:STRING;
 VAR S:STRING;
 BEGIN
      GETDIR(0,S);
      GET_CURRENT_DISK:=COPY(S,1,2);
 END;
Function ReplSToDQuote(S:String):String;
 var REtVal:String;
     i,k:integer;
 begin
      RetVal:=S;
      if Length(S)>0 then
         begin
               RetVal:='';
               k:=Length(S);
               for i:=1 to k do
                   if s[i]='''' then RetVal:=RetVal+'"'
                                else RetVal:=RetVal+s[i];
         end;
      ReplSToDQuote:=RetVal;
 end;

Function ReplChar(S:String;CFR:String;CTO:String):String;
 var REtVal:String;
     i,k:integer;
 begin
      RetVal:=S;
      if Length(S)>0 then
         begin
               RetVal:='';
               k:=Length(S);
               for i:=1 to k do
                   if s[i]=CFR then RetVal:=RetVal+CTO
                                else RetVal:=RetVal+s[i];
         end;
      ReplChar:=RetVal;
 end;


Function ReplQto2Q(S:String):String;
// Заменяет кавычку на две
 var RetVal:String;
     i,k:integer;
 begin
      RetVal:=S;
      if Length(S)>0 then
         begin
               RetVal:='';
               k:=Length(S);
               for i:=1 to k do
                   begin
                        RetVal:=RetVal+s[i];
                        if s[i]='''' then RetVal:=RetVal+'''';
                   end;
         end;
      ReplQto2Q:=RetVal;
 end;

Function ReplToUkrI(S:String):String;
// Заменяет кавычку на две
 var RetVal:String;
     i,k:integer;
 begin
      RetVal:=S;
      if Length(S)>0 then
         begin
               RetVal:='';
               k:=Length(S);
               for i:=1 to k do
                   begin
                        if s[i]='i' then s[i]:=Chr(179)
                                    else
                        if s[i]='I' then s[i]:=Chr(178);
                        RetVal:=RetVal+s[i];
//                        if s[i]='''' then RetVal:=RetVal+'''';
                   end;
         end;
      ReplToUkrI:=RetVal;
 end;


   function ReplQuot(C:String):String;
    var i      : integer ;
        RetVal : string  ;
    begin
         FillChar(RetVal,SizeOf(RetVal),0);
         if length(AllTrim(C))=0 then RetVal:=c
                                 else
            begin
                 for i:=1 to length(C) do
                     begin
                           if ord(c[i])<ord(' ') then continue;
                           if not ((c[i]='''') or (c[i]='"')) then RetVal:=RetVal+c[i]
                                         else
                              begin
                                   RetVal:=RetVal+'''';
                                   RetVal:=RetVal+'''';
                              end;
                     end;
            end;
        ReplQuot:=RetVal;
    end;

Function FormatDateTime(dt:TDateTime):String;
     var S:String;
         y,m,d,Hour, Min, Sec, MSec:word;
         sy,sm,sd,sh,smi,ssec,smsec:String;
  begin
       DecodeDate(dt, y, m, d);
       DecodeTime(dt, Hour, Min, Sec, MSec);
       sy:=trim(intToStr(y));
       sm:=trim(intToStr(m));
       sd:=trim(intToStr(d));
       if m<10 then sm:='0'+sm;
       if d<10 then sd:='0'+sd;
       sh:=trim(intToStr(hour));
       smi:=trim(intToStr(min));
       ssec:=trim(intToStr(sec));
       if hour<9 then sh:='0'+sh;
       if min <9 then smi:='0'+smi;
       if sec <9 then ssec:='0'+ssec;
       s:=sy+'-'+sm+'-'+sd+' '+sh+':'+smi+':'+ssec;
       FormatDateTime:=s;
  end;

Function FormatDate(dt:TDateTime):String;
     var S:String;
         sy,sm,sd:String;
         y,m,d:word;
  begin
       DecodeDate(dt, y, m, d);
       sy:=trim(intToStr(y));
       sm:=trim(intToStr(m));
       sd:=trim(intToStr(d));
       if m<10 then sm:='0'+sm;
       if d<10 then sd:='0'+sd;
       s:=sd+'.'+sm+'.'+sy;
       FormatDate:=s;
  end;

Function FormatFloatPoint(A:Real):String;
  const F='######0.00';
     var S:String;
  begin
       S:=FormatFloat(F,A);
       FormatFloatPoint:=ReplChar(S,',','.')
  end;
Function FormatFloatPointL(A:Real;L:integer):String;
{  const F='######0.';}
     var S:String;
         I:integer;
         F:STring;
  begin
       F:='######0.';
       for i:=1 to L do F:=F+'0';
       S:=FormatFloat(F,A);
       FormatFloatPointL:=ReplChar(S,',','.')
  end;

FUNCTION ALLTRIM(T:STRING):STRING;
 VAR S:STRING[1];
     I,J:INTEGER;
     SS,SSS:STRING;
 BEGIN
      I:=LENGTH(T);
      IF I>0 THEN
         BEGIN
              J:=0;
              REPEAT
                    J:=J+1;
                    S:=COPY(T,J,1);
              UNTIL (J=I) OR (ORD(S[1])<>ORD(' '));
              SS:=COPY(T,J,I-J+1);
              SSS:=SS;
              I:=LENGTH(SS);
              IF I>0 THEN
                 BEGIN
                       J:=I+1;
                       REPEAT
                             J:=J-1;
                             S:=COPY(SS,J,1);
                       UNTIL (J=1)  OR  (S[1]<>' ');
                       SSS:=COPY(SS,1,J);
                 END;
         ALLTRIM:=SSS;
         END
             ELSE
         ALLTRIM:=T;
 END;
 function cwd(c:char):char;
  var i:integer;
  begin
       cwd:=c;
       if ord(c)<$80 then Exit;
       for i:=1 to length(wins) do
           if wins[i]=ord(c) then
              begin
                   cwd:=chr(doss[i]);
                   exit;
              end;
  end;

 function cdw(c:char):char;
  var i:integer;
  begin
       cdw:=c;
       if ((ord(c)<$80) and (c<>'I') and (c<>'i')) then Exit;
       for i:=1 to length(doss) do
           if doss[i]=ord(c) then
              begin
                   cdw:=chr(wins[i]);
                   exit;
              end;
  end;

  function WinToDos(s:string):string;
   var RetVal:string;
       i:integer;
       c:char;
   begin
        if length(s)=0 then
           begin
                WinToDos:='';
                Exit;
           end;
        RetVal:='';
        for i:=1 to length(s) do
            begin
                 c:=s[i];
                 RetVal:=RetVal+cwd(c);
            end;
        WinToDos:=RetVal;
   end;

  function DosToWin(s:string):string;
   var RetVal:string;
       i:integer;
       c:char;
   begin
{
        DosToWin:=S;
        Exit;
}
        if length(s)=0 then
           begin
                DosToWin:='';
                Exit;
           end;
        RetVal:='';
        for i:=1 to length(s) do
            begin
                 c:=s[i];
                 RetVal:=RetVal+cdw(c);
            end;
        DosToWin:=RetVal;

   end;

  function GetClarionDate(var y,m,d:integer;dcC:LongInt):boolean;
   var 
       i:word;
       n:array[1..12] of word;
       DC:LONGINT;
   begin
        DC:=DCC;
        n[1]:=31;
        n[2]:=28;
        n[3]:=31;
        n[4]:=30;
        n[5]:=31;
        n[6]:=30;
        n[7]:=31;
        n[8]:=31;
        n[9]:=30;
        n[10]:=31;
        n[11]:=30;
        n[12]:=31;
        y:=0;
        m:=0;
        d:=0;
        if (dc <= 3) OR (dc > 109211) THEN
           begin
                GetClarionDate:=false;
                exit;
           end;
	IF dc > 36527 THEN dc := dc - 3
                      ELSE dc := dc - 4;
	y := (1801 + (4* (dc div 1461)));
	dc := dc mod 1461;
	IF dc <> 1460 THEN
           begin
		y := y + (dc div 365);
		d := dc mod 365;
           end
		      ELSE
           begin
		y := y + 3;
		d := 365;
	   end;
	IF y < 100 THEN y := y + 1900;
	IF (y mod 4 = 0) AND (y <> 1900) THEN n[2] := 29
                                         ELSE n[2] := 28;
	for i := 1 TO 12 do
            begin
		 d := d - n[i];
		IF d < 0 THEN
                   begin
			 d := d + n[i]+1;
                         BREAK;
		   end;
            end;
         M := i;
         GetClarionDate:=true;
     end;


  FUNCTION FILEEXIST(FILENAME:STRIng):BOOLEAN;
    var
       f: file;
       KOD:INTEGER;
       TEMP_FILEMODE:BYTE;
       DONE:BOOLEAN;
       DS,DC:TDATETIME;
       Otr:integer;
    begin
        TEMP_FILEMODE:=FILEMODE;
        FILEMODE:=$40;
        Assign(f, FileName);
        DONE:=FALSE;
        DS:=TIME;
        KOD:=0;
        WHILE NOT DONE DO
         BEGIN
          {$I-}
          RESET(F);
          CLOSE(F);
          {$I+}
          KOD:=IORESULT;
          IF (KOD<5) OR (KOD=103) THEN DONE:=TRUE
                   ELSE
             BEGIN
                  DC:=Time;
                  otr:=SecondsBetween(DC,DS);
                  IF OTR>LIMIT_NET_TIME THEN
                     BEGIN
                          ShowMessage('При проверке сетевого файла '+ALLTRIM(FNINF)+
                                ' превышен лимит ожидания в '+IntToStr(LIMIT_NET_TIME)+' сек');
                          IF MessageDlg('Сделать еще одну попытку проверки ?',
                             mtConfirmation, [mbYes, mbNo], 0, mbYes)= mrYes THEN
                                  DS:=TIME
                                                                          ELSE
                             HALT(5);
                      END;{
                                             ELSE
                      DELAY(DELAY_NET);}
             END;
        END;
    IF (KOD=0) AND (FILENAME<>'') THEN FILEEXIST:=TRUE
                                  ELSE FILEEXIST:=FALSE;
{    IF KOD<>0 THEN ERROR('В FILEEXIST ДЛЯ '+ALLTRIM(FILENAME)+' КОД='+MY_STR_INT(KOD));
}    FILEMODE:=TEMP_FILEMODE;
  end;  { FileExist }
  FUNCTION NOMER_SERV(WN:INTEGER):INTEGER;
   var
       i:integer;
       PodrRec:PPodrRec;
   BEGIN
        NOMER_SERV:=999;
        for i:=0 to NameServList.Count-1 do
            begin
                 PodrRec:=NameServList.Items[i];
                 if PodrRec^.Shifr=WN then
                    begin
                         Nomer_Serv:=i+1;
                         break;
                    end;
            end;
{        IF NAMESERVLIST^.SEARCH(ADDR(WANTED_SERV),JINDEX) THEN NOMER_SERV:=JINDEX+1}
   END;
  FUNCTION SHIFR_SERV(WN:INTEGER):INTEGER;
   var
       PodrRec:PPodrRec;
   BEGIN
        SHIFR_SERV:=WN;
        if wn<=NAMESERVLIST.Count then
           begin
                PodrRec:=NameServList.Items[Wn-1];
                Shifr_Serv:=PodrRec^.Shifr;
{                Shifr_Serv:=PItem(NAMESERVLIST^.At(Wanted_Serv-1))^.ShifrId}
           end
        else
           Shifr_Serv:=WN;

   END;
  function Name_Serv(WN:integer):String;
   var
      S:STRING;
      W_Serv:integer;
      i:integer;
      Finded:boolean;
      PodrRec:PPodrRec;
   begin
         Name_Serv:='Нужно сделать';
         if wn<=0 then
            begin
                 Name_Serv:=intToSTr(WN)+' не найдено'; 
                 exit;
            end;

         W_serv:=Shifr_Serv(WN);
         finded:=false;
         PodrRec:=nil;
         for i:=0 to NameServList.Count-1 do
             begin
                  PodrRec:=NameServList.Items[i];
                  if PodrRec^.Shifr=W_Serv then
                     begin
                          Finded:=true;
                          break;
                     end;
             end;
         IF Finded THEN S:=PodrRec^.NAME
                   ELSE
          begin
               STR(WN,S);
               S:=S+' Не найден';
          end;
       NAME_SERV:=S;

   end;

  FUNCTION GetNameShifrByNo(I:Integer):String;
   begin
         GetNameShifrByNo:=ShifrList.GetNameByNo(I);
   end;
  FUNCTION GetNameShifr(I:Integer):String;
   var KoledgRec : PKoledgRec;
       j : integer;
   begin
         GetNameShifr:=ShifrList.GetName(I);
         if ((NSRV>150) and (NSRV<169)) then
         if Assigned(KoledgShifrList)   then
         if KoledgShifrList.Count>0     then
            begin
                  for j:=1 to KoledgShifrList.Count do
                      begin
                           KoledgRec := PKoledgRec(KoledgShifrList.Items[j-1]);
                           if (KoledgRec^.Shifr=i) then
                              begin
                                   GetNameShifr:=KoledgRec^.Name;
                                   Break;
                              end
                      end;
            end;
   end;

  procedure Error(S:String);
   begin
        ShowMessage(S);
   end;

 FUNCTION UPPER(Ch:char):char;
  const lc='абвгдеёжзийклмнопрстуфхцчшщьъыэюяіїє';
        uc='АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЪЫЭЮЯІЇЄ';
  var i:integer;
  begin
       Upper:=Ch;
       i:=pos(Ch,Lc);
       if i>0 then Upper:=uc[i]
              else Upper:=UpCase(Ch);
  end;
 FUNCTION UPPER_STRING(S:STRING):STRING;
  VAR CS:STRING[2];
      I,L:INTEGER;
      S1:STRING;
  BEGIN
        S:=ReplChar(S,'i','і');
        S:=ReplChar(S,'I','І');
        S1:='';
        L:=LENGTH(S);
        IF L>0 THEN FOR I:=1 TO L DO
           BEGIN
                CS:=COPY(S,I,1);
                S1:=S1+UPPER(CS[1]);
           END
               ELSE S1:=S;
        UPPER_STRING:=S1;
  END;
 FUNCTION Lower(Ch:char):char;
  const lc='абвгдеёжзийклмнопрстуфхцчшщьъыэюяіїє';
        uc='АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЪЫЭЮЯІЇЄ';
  var i:integer;
  begin
       Lower:=Ch;
       i:=pos(Ch,Uc);
       if i>0 then Lower:=lc[i]
              else Lower:=LowerCase(Ch)[1];
  end;
 FUNCTION Lower_String(S:STRING):STRING;
  VAR CS:STRING[2];
      I,L:INTEGER;
      S1:STRING;
  BEGIN
        S:=ReplChar(S,'i','і');
        S:=ReplChar(S,'I','І');
        S1:='';
        L:=LENGTH(S);
        IF L>0 THEN FOR I:=1 TO L DO
           BEGIN
                CS:=COPY(S,I,1);
                S1:=S1+Lower(CS[1]);
           END
               ELSE S1:=S;
        Lower_STRING:=S1;
  END;

 FUNCTION ALL(C:CHAR;L:INTEGER):STRING;
   var RetVal:string;
       i:integer;
   begin
        RetVal:='';
        if (L>0) and (L<500) then for i:=1 to L do RetVal:=RetVal+C;
        All:=RetVal;
   end;
   FUNCTION SPACE(L:INTEGER):STRING;
    var retVal:string;
    begin
         retVal:='';
         if l>0 then
            retVal:=All(' ',L);
         space:=retVal;
    end;

 FUNCTION SHORT_FIO(FFIO:STRING):STRING;
 VAR BLANK:CHAR;
     FLSTR:STRING;
     I,J,LIMIT:INTEGER;
 BEGIN
     I:=1;
     LIMIT:=38;
     BLANK:=' ';
     FLSTR:=COPY(FFIO+'                    ',1,20);
     WHILE  (COPY(FFIO,I,1)=BLANK) AND (I<LIMIT) DO I:=I+1;
     IF I<LIMIT THEN BEGIN
        J:=I;
        WHILE ( NOT ((COPY(FFIO,I,1)=BLANK) AND (COPY(FFIO,I+1,1)<>BLANK)) AND (I<LIMIT-1)) DO I:=I+1;
        IF I<LIMIT-1 THEN
           BEGIN
                FLSTR:=COPY(FFIO,J,I-J)+' '+COPY(FFIO,I+1,1)+'.';
                I:=I+1;
                WHILE ( NOT ((COPY(FFIO,I,1)=BLANK) AND (COPY(FFIO,I+1,1)<>BLANK)) AND (I<LIMIT-1)) DO I:=I+1;
                IF I<LIMIT-1 THEN FLSTR:=FLSTR+COPY(FFIO,I+1,1)+'.';
           END;
                      END;
       SHORT_FIO:=COPY(FLSTR+'                    ',1,20);
 END;
function Split(const StringParam: String; const DelimChar: String): TArrOfString;
  
var
  sTMP  : string;
  sa      : TArrOfString;
  n,i,y   : Integer;

begin
  try
      sTMP:=StringParam;
      n:=Pos(DelimChar, sTMP)-1;
      i:=0;
      y:=Length(DelimChar);

    while n>0 do begin
      i:=i+1;
      SetLength(sa,i);
      sa[i-1]:=Copy(sTMP,1,n);

      Delete(sTMP,1,n+y);

      n:=Pos(DelimChar, sTMP)-1;
    end;
      i:=i+1;
      n:=Length(sTMP);
      SetLength(sa,i);
      sa[i-1]:=Copy(sTMP,1,n);
      Result:=sa;
  finally
      sTMP:='';
      sa:=nil;
  end;
end;
function SplitFIO(FIO:STRING;var FAM,NAM,OTC:string):boolean;
 var s1: TArrOfString;
     retVal:boolean;
 begin
       FAM:='';
       NAM:='';
       OTC:='';
       retVal:=True;
       FIO:=Trim(FIO);
       while True do
         begin
              if Pos('  ',FIO)>0 then
                 FIO:=StringReplace(FIO,'  ',' ',[rfReplaceAll])
              else
                 break;
         end;
       s1:=Split(FIO,' ');
       FAM:=s1[0];
       NAM:='';
       OTC:='';
       if Length(s1)>1 then
          NAM:=s1[1];
       if Length(s1)>2 then
          OTC:=s1[2];
       SplitFIO:=retVal;
 end;



  FUNCTION GET_IST_NAME(N_Ist:INTEGER):STRING;
   BEGIN
         if (n_IST<1) or (n_IST>max_IST_FIN) then get_IST_name:='ош.номер'
            else get_IST_name:=IST_FIN_name[n_IST];
   END;

  FUNCTION GET_IST_plt_name(n_IST:INTEGER):string;
  var S:string;
  begin
    if (n_IST<1) or (n_IST>max_IST_FIN) then S:='_Err'
      else s:=AllTrim(GET_IST_NAME(n_IST));
    if pos('.',S)=0 then s:=AllTrim(S)+'.txt';
    Get_Ist_Plt_Name:=S;
  end;

  FUNCTION GET_kat_name(n_kat:INTEGER):string;
  begin
    if (n_kat<1) or (n_kat>max_katEGORIJA) then get_kat_name:='ош.номер'
      else get_kat_name:=kat_name[n_kat];
  end;

  FUNCTION GET_kat_short_name(n_kat:INTEGER):string;
  begin
    if (n_kat<1) or (n_kat>max_katEGORIJA) then get_kat_short_name:='ош.номер'
      else get_kat_short_name:=kat_short_name[n_kat];
  end;

FUNCTION WORK_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR;maxTabelDays:integer=0):integer;
 VAR I,J:INTEGER;
 BEGIN
      J:=0;
      FOR I:=START_DAY TO LAST_DAY DO IF ((CURR_PERSON^.TABEL[I]=RABOTA)       OR
                       //    (CURR_PERSON^.TABEL[I]=KOMANDIROWKA) OR
                       //    (CURR_PERSON^.TABEL[I]=Donorsk_tabel)    OR     Т И сказала, что донорские в раб.дни не входят 13 03 2018
                           (CURR_PERSON^.TABEL[I]=LEGK_TRUD)     OR
//                           (CURR_PERSON^.TABEL[I]=PROSTOY_TABEL) OR
                           (CURR_PERSON^.TABEL[I]=GOS_OB))       THEN
                           J:=J+1;
      if ((maxTabelDays>0) and (maxTabelDays<32)) then
      if j>maxTabelDays then
         j:=maxTabelDays;
      WORK_DAY:=J;
 END;
FUNCTION PROSTOY_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR;maxTabelDays:integer=0):integer;
 VAR I,J:INTEGER;
 BEGIN
      J:=0;
      FOR I:=START_DAY TO LAST_DAY DO
         IF ((
//              CURR_PERSON^.TABEL[I]=RABOTA)       OR
         //    (CURR_PERSON^.TABEL[I]=KOMANDIROWKA) OR
         //    (CURR_PERSON^.TABEL[I]=Donorsk_tabel)    OR     Т И сказала, что донорские в раб.дни не входят 13 03 2018
//                  (CURR_PERSON^.TABEL[I]=LEGK_TRUD)     OR
                           (CURR_PERSON^.TABEL[I]=PROSTOY_TABEL)
//                           (CURR_PERSON^.TABEL[I]=GOS_OB
              ))       THEN
                           J:=J+1;
      if ((maxTabelDays>0) and (maxTabelDays<32)) then
      if j>maxTabelDays then
         j:=maxTabelDays;
     PROSTOY_DAY:=J;
 END;
FUNCTION TvOtp_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR;maxTabelDays:integer=0):integer;
 VAR I,J:INTEGER;
 BEGIN
      J:=0;
      FOR I:=START_DAY TO LAST_DAY DO
         IF ((
//              CURR_PERSON^.TABEL[I]=RABOTA)       OR
         //    (CURR_PERSON^.TABEL[I]=KOMANDIROWKA) OR
         //    (CURR_PERSON^.TABEL[I]=Donorsk_tabel)    OR     Т И сказала, что донорские в раб.дни не входят 13 03 2018
//                  (CURR_PERSON^.TABEL[I]=LEGK_TRUD)     OR
                           (CURR_PERSON^.TABEL[I]=Tvorch_otp_tabel )
//                           (CURR_PERSON^.TABEL[I]=GOS_OB
              ))       THEN
                           J:=J+1;
      if ((maxTabelDays>0) and (maxTabelDays<32)) then
      if j>maxTabelDays then
         j:=maxTabelDays;
     TvOtp_DAY:=J;
 END;

FUNCTION WORK_DAY_NADB(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR;maxTabelDays:integer=0):integer;
 var retVal:Integer;
 begin
      retVal:=0;
      retVal := WORK_DAY(start_day,last_day,curr_person,maxTabelDays);
//      if isSVDN then
//         retVal:=retVal+prostoy_day(start_day,last_day,curr_person,maxTabelDays);
      WORK_DAY_NADB:=retVal;
 end;

   FUNCTION ILL_DAY(START_DAY:INTEGER;CURR_PERSON:PERSON_PTR):INTEGER;
    VAR I,J:INTEGER;
    BEGIN
         J:=0;
         FOR I:=START_DAY TO 31 DO IF (CURR_PERSON^.TABEL[I]=ILLNESS) THEN J:=J+1;
         ILL_DAY:=J;
    END;
FUNCTION OTPUSK_DAY(START_DAY:INTEGER;CURR_PERSON:PERSON_PTR):INTEGER;
 VAR I,J:INTEGER;
 BEGIN
      J:=0;
      FOR I:=START_DAY TO 31 DO IF (CURR_PERSON^.TABEL[I]=TARIFN_OTPUSK) THEN J:=J+1;
      OTPUSK_DAY:=J;
 END;
FUNCTION OTPUSK_BEZ_DAY(START_DAY:INTEGER;CURR_PERSON:PERSON_PTR):INTEGER;
 VAR I,J:INTEGER;
 BEGIN
      J:=0;
      FOR I:=START_DAY TO 31 DO IF (CURR_PERSON^.TABEL[I]=OTPUSK_BEZ_OPLATY) THEN inc(J);
      OTPUSK_BEZ_DAY:=J;
 END;

FUNCTION WORK_CLOCK(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 VAR I:INTEGER;
     A,OO:REAL;
 FUNCTION TEST_SUBBOTA(I:INTEGER):BOOLEAN;
   var L:boolean;
  BEGIN
     L:=FALSE;
     IF CURR_PERSON^.TABEL[I+1]=VYHODN THEN L:=TRUE
                                       ELSE
          //    IF (((GetDayKodDAY_KOD[I+1]=0) OR (I=31)) AND (CURR_PERSON^.TABEL[I-6]=VYHODN))
              IF (((GetDayCode(I+1)=0) OR (I=31)) AND (CURR_PERSON^.TABEL[I-6]=VYHODN))
                                                 THEN  L:=TRUE
                                       ELSE
              IF (NMES=4) AND (I=30) THEN L:=TRUE;
     TEST_SUBBOTA:=L;
  END;
 BEGIN
      A:=0;
      IF isFiveDayMode(CURR_PERSON) THEN
         BEGIN
    //          FOR I:=1 TO 31 DO IF DAY_KOD[I]=1 THEN
    //                            IF DAY_KOD[I+1]=4 THEN A:=A+6
              FOR I:=1 TO 31 DO IF GetDayCode(I)=1 THEN
                                IF GetDayCode(I+1)=4 THEN A:=A+6
                                                  ELSE A:=A+7
                                                ELSE
//                             IF DAY_KOD[I]=2 THEN A:=A+6;
                             IF GetDayCode(I)=2 THEN A:=A+6;

              OO:=WORK_DAY(START_DAY,LAST_DAY,CURR_PERSON,round(GetWDay(NMES,CURR_PERSON)));
             // A:=A/W_DAY[NMES]*OO;
              A:=A/GetWDay(NMES,CURR_PERSON)*OO;
         END
                                    ELSE
         FOR I:=START_DAY TO LAST_DAY DO IF ((CURR_PERSON^.TABEL[I]=RABOTA)       OR
        //                      (CURR_PERSON^.TABEL[I]=KOMANDIROWKA) OR
                              (CURR_PERSON^.TABEL[I]=PROSTOY_TABEL) OR
                              (CURR_PERSON^.TABEL[I]=GOS_OB))       THEN
                              IF TEST_SUBBOTA(I) THEN  A:=A+6
                                                 ELSE  A:=A+7;
      CURR_PERSON^.DAY:=A;
      WORK_CLOCK:=A;
 END;

FUNCTION WORK_CLOCK_LERA(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 VAR I:INTEGER;
     A,OO:REAL;
     koef:real;
 FUNCTION TEST_SUBBOTA(I:INTEGER):BOOLEAN;
   var L:boolean;
  BEGIN
     L:=FALSE;
     IF CURR_PERSON^.TABEL[I+1]=VYHODN THEN L:=TRUE
                                       ELSE
          //    IF (((GetDayKodDAY_KOD[I+1]=0) OR (I=31)) AND (CURR_PERSON^.TABEL[I-6]=VYHODN))
              IF (((GetDayCode(I+1)=0) OR (I=31)) AND (CURR_PERSON^.TABEL[I-6]=VYHODN))
                                                 THEN  L:=TRUE
                                       ELSE
              IF (NMES=4) AND (I=30) THEN L:=TRUE;
     TEST_SUBBOTA:=L;
  END;
 BEGIN
      A:=0;
         FOR I:=START_DAY TO LAST_DAY DO IF ((CURR_PERSON^.TABEL[I]=RABOTA)       OR
        //                      (CURR_PERSON^.TABEL[I]=KOMANDIROWKA) OR
                              (CURR_PERSON^.TABEL[I]=PROSTOY_TABEL) OR
                              (CURR_PERSON^.TABEL[I]=GOS_OB))       THEN
                              if curr_person^.kategorija=1 then A:=A+7.2
                                                      ELSE  A:=A+8;

      if a>CLOCKS[nmes] then
         a:=clocks[nmes];
      koef:=GET_KOEF_OKLAD_PERSON(curr_person);
      a:=a*koef;
      if abs(curr_person^.oklad)<1.00 then a:=0;
      a:=RoundTo(a,-1);
      WORK_CLOCK_LERA:=A;
 END;

FUNCTION NADBAWKA_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 VAR I,J:INTEGER;
     T:byte;
 FUNCTION TEST_SUBBOTA(I:INTEGER):BOOLEAN;
  VAR
     J:INTEGER;
     Y,M,D,DOW:WORD;
     DateWrk,Dt:TDateTime;
  BEGIN
     VAL(WORK_YEAR,Y,J);
     IF J<>0 THEN BEGIN TEST_SUBBOTA:=FALSE; EXIT; END;
     M:=NMES;
     D:=I;
     Dt:=EndOfAMonth(Y,M);
     if D>DayOf(Dt) then
        begin
             Test_Subbota:=false;
             Exit;
        end;
     DateWrk:=EncodeDate(y,m,d);
//     RecodeYear(DateWrk,Y);
//     RecodeMonth(DateWrk,M);
//     RecodeDay(DateWrk,D);
     Dow:=DayOfWeek(DateWrk);
     IF DOW=6 THEN TEST_SUBBOTA:=TRUE ELSE TEST_SUBBOTA:=FALSE;
     EXIT;
  END;
 BEGIN
      J:=0;
      NADBAWKA_DAY:=j;      
      IF Curr_Person=Nil then Exit;
      FOR I:=START_DAY TO LAST_DAY DO
          IF (isFiveDayMode(CURR_PERSON))
         AND (CURR_PERSON^.TABEL[I] IN [TARIFN_OTPUSK,ILLNESS]) AND (TEST_SUBBOTA(I))  THEN
                                                                              ELSE
             begin
                  T:=CURR_PERSON^.TABEL[I];
                  IF NOT (T IN [NEZAPOLN          ,
                                PROGUL            ,
                                VYHODN            ,
                                OTPUSK_BEZ_OPLATY ,
                                TARIFN_OTPUSK      ,
                                ILLNESS           ,
                                KOMANDIROWKA      ,
                                PROSTOY_TABEL      ,
                                NEOPL_NETRUD])      THEN INC(J);
             end;
      NADBAWKA_DAY:=J;
 END;

{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
FUNCTION THIS_PERSON(CURR_PERSON:PERSON_PTR):BOOLEAN;
 VAR L:BOOLEAN;
 BEGIN
       L:=FALSE;
       IF (R.TABNO=ANY)      OR (C.TABNO=CURR_PERSON^.TABNO) THEN
       IF (R.FIO=ANY)        OR (ALLTRIM(UPPER_STRING(C.FIO))=ALLTRIM(UPPER_STRING(CURR_PERSON^.FIO))) THEN
       IF (R.GRUPPA=ANY)     OR (C.GRUPPA=CURR_PERSON^.GRUPPA) THEN
       IF (R.KATEGORIJA=ANY) OR (C.KATEGORIJA=CURR_PERSON^.KATEGORIJA) THEN
       IF (R.DOLG=ANY)       OR (ALLTRIM(UPPER_STRING(C.DOLG))=ALLTRIM(UPPER_STRING(CURR_PERSON^.DOLG))) THEN
       IF (R.OKLAD=ANY)      OR (C.OKLAD=CURR_PERSON^.OKLAD) THEN
       IF (R.WID_RABOTY=ANY) OR (C.WID_RABOTY=CURR_PERSON^.WID_RABOTY) THEN
       IF (R.N_TEMY=ANY)     OR (ALLTRIM(UPPER_STRING(C.N_TEMY))=ALLTRIM(UPPER_STRING(CURR_PERSON^.N_TEMY))) THEN
       IF (R.MESTO_OSN_RABOTY=ANY) OR (C.MESTO_OSN_RABOTY=CURR_PERSON^.MESTO_OSN_RABOTY) THEN
       IF (R.WID_OPLATY=ANY) OR (C.WID_OPLATY=CURR_PERSON^.WID_OPLATY) THEN
       IF (R.MODE=ANY)       OR (C.MODE=CURR_PERSON^.MODE) THEN
       IF (R.MAIN=ANY){      OR (C.MAIN=CURR_PERSON^.MAIN)} THEN
          L:=TRUE;

       THIS_PERSON:=L;
 END;


 FUNCTION COUNT_PERSON:INTEGER;
 VAR I:INTEGER;
     W:PERSON_PTR;
     CURR_HEAD:PERSON_PTR;
 BEGIN
{     IF OLD_FILE THEN CURR_HEAD:=HEAD_PERSON_OLD ELSE CURR_HEAD:=HEAD_PERSON;}
     CURR_HEAD:=HEAD_PERSON;
     IF CURR_HEAD=NIL THEN COUNT_PERSON:=0
                        ELSE
                         BEGIN
                          I:=1;
                          W:=CURR_HEAD;
                          WHILE W^.NEXT<>NIL DO BEGIN
                                                 I:=I+1;
                                                 W:=W^.NEXT
                                                END;
                          COUNT_PERSON:=I
                         END
 END;
 FUNCTION COUNT_ADD(CURR_PERSON:PERSON_PTR):INTEGER;
 VAR I:INTEGER;
     W:ADD_PTR;
 BEGIN
     IF CURR_PERSON^.ADD=NIL THEN COUNT_ADD:=0
                        ELSE
                         BEGIN
                          I:=1;
                          W:=CURR_PERSON^.ADD;
                          WHILE W^.NEXT<>NIL DO BEGIN
                                                 I:=I+1;
                                                 W:=W^.NEXT
                                                END;
                          COUNT_ADD:=I
                         END
 END;
 FUNCTION COUNT_SOWM(CURR_PERSON:PERSON_PTR):INTEGER;
 VAR I:INTEGER;
     W:SOWM_PTR;
 BEGIN
     IF CURR_PERSON^.SOWM=NIL THEN COUNT_SOWM:=0
                        ELSE
                         BEGIN
                          I:=1;
                          W:=CURR_PERSON^.SOWM;
                          WHILE W^.NEXT<>NIL DO BEGIN
                                                 I:=I+1;
                                                 W:=W^.NEXT;
                                                END;
                          COUNT_SOWM:=I
                         END
 END;
 FUNCTION COUNT_UD(CURR_PERSON:PERSON_PTR):INTEGER;
 VAR I:INTEGER;
     W:UD_PTR;
 BEGIN
     IF CURR_PERSON^.UD=NIL THEN COUNT_UD:=0
                        ELSE
                         BEGIN
                          I:=1;
                          W:=CURR_PERSON^.UD;
                          WHILE W^.NEXT<>NIL DO BEGIN
                                                 I:=I+1;
                                                 W:=W^.NEXT
                                                END;
                          COUNT_UD:=I
                         END
 END;
 FUNCTION COUNT_WANTED_UD_YEAR(CURR_PERSON:PERSON_PTR;WANTED_SHIFR:Integer;START_MONTH:Integer;START_YEAR:INTEGER):INTEGER;
 VAR I:INTEGER;
     W:UD_PTR;
     Y:Integer;
     retVal:Integer;
 BEGIN
     Y:=START_YEAR;
     if y>1990 then
        y:=start_year-1990;
     retval:=0;
     w:=curr_Person.UD;
     while (w<>nil) do
       begin
            if w.SHIFR=WANTED_SHIFR then
            if w.period=START_MONTH then
            if w.YEAR=y then
               inc(retVal);
            w:=w.NEXT;
       end;
      COUNT_WANTED_UD_YEAR:=retVal;
 END;
 FUNCTION COUNT_CN(CURR_PERSON:PERSON_PTR):INTEGER;
 VAR I:INTEGER;
     W:CN_PTR;
 BEGIN
     IF CURR_PERSON^.CN=NIL THEN COUNT_CN:=0
                        ELSE
                         BEGIN
                          I:=1;
                          W:=CURR_PERSON^.CN;
                          WHILE W^.NEXT<>NIL DO BEGIN
                                                 I:=I+1;
                                                 W:=W^.NEXT
                                                END;
                          COUNT_CN:=I
                         END
 END;

 PROCEDURE FILL_STANDARD_TABEL_PERSON(CURR_PERSON:Person_Ptr);
  VAR I:INTEGER;
  BEGIN
       FOR I:=1 TO 31 DO
           //     CASE DAY_KOD[I] OF
                CASE GetDayCode(I) OF
                     0 : CURR_PERSON^.TABEL[I]:=NEZAPOLN;
                     1 : CURR_PERSON^.TABEL[I]:=JAWKA;
                     2 : IF isFiveDayMode(CURR_PERSON) THEN CURR_PERSON^.TABEL[I]:=VYHODN
                                                       ELSE CURR_PERSON^.TABEL[I]:=JAWKA;
                     3 : CURR_PERSON^.TABEL[I]:=VYHODN;
                     4 : CURR_PERSON^.TABEL[I]:=VYHODN;
                END;
  END;
 PROCEDURE FILL_TABEL_UW_PERSON(CURR_PERSON:PERSON_PTR);
  VAR I   : INTEGER;
      Dt  : TDateTime;
      D   : Integer;
      y,m : integer;
  BEGIN
       Dt := getDataUwPerson(Curr_person);
       y  := yearof(dt);
       m  := monthof(dt);
       d  := dayof(dt);
       if YearOf(Dt)  <> Work_Year_Val then Exit;
       if MonthOf(Dt) <> NMES          then Exit;
       D:=DayOf(Dt);
       IF CURR_PERSON^.MAIN<=0 THEN EXIT;
       FOR I:=1 TO 31 DO
          //      CASE MONTH_DAY[2,NMES,I] OF
           if isLNR then
               if i>D then
                  CURR_PERSON^.TABEL[I]:=NEZAPOLN
               else
           else
               if i>=D then
                  CURR_PERSON^.TABEL[I]:=NEZAPOLN;
  END;






  PROCEDURE MAKE_PERSON(VAR CURR_PERSON:PERSON_PTR;Wanted_Person_After:PERSON_PTR=NIl);
   VAR I,J:INTEGER;
       CURR:PERSON_PTR;
 PROCEDURE FILL_STANDARD_TABEL;
  VAR I:INTEGER;
  BEGIN
       FOR I:=1 TO 31 DO
           //     CASE DAY_KOD[I] OF
                CASE GetDayCode(I) OF
                     0 : CURR_PERSON^.TABEL[I]:=NEZAPOLN;
                     1 : CURR_PERSON^.TABEL[I]:=JAWKA;
                     2 : IF isFiveDayMode(CURR_PERSON) THEN CURR_PERSON^.TABEL[I]:=VYHODN
                                                       ELSE CURR_PERSON^.TABEL[I]:=JAWKA;
                     3 : CURR_PERSON^.TABEL[I]:=VYHODN;
                     4 : CURR_PERSON^.TABEL[I]:=VYHODN;
                END;
 {      MAKE_OTP_TABEL(CURR_PERSON);}
  END;
   BEGIN
       NEW(CURR_PERSON);
       FillChar(Curr_Person^,SizeOf(Curr_Person^),0);
       if (Wanted_Person_After=nil) then
          begin
               if Assigned(HEAD_PERSON) then
                  begin
                       Curr:=HEAD_PERSON;
                       while (CURR.Next<>Nil) do
                              curr:=Curr^.NEXT;
                       CURR.NEXT:=CURR_PERSON;
                  end
               ELSE
                  HEAD_PERSON:=CURR_PERSON
          end
       else
          begin
               Curr_Person.NEXT:=Wanted_Person_After.NEXT;
               Wanted_Person_After.NEXT:=CURR_PERSON;
          end;
       WITH CURR_PERSON^ DO
            BEGIN
                TABNO      := 0;
                FIO        := space(20);
                GRUPPA     := 1;             {BUJDGET}
                KATEGORIJA := 1;          {PREPOD}
                DOLG       := space(10);
                WID_RABOTY := 1;         {OSN}
                N_TEMY     := space(10);
                MESTO_OSN_RABOTY:=SHIFR_SERV(NSRV);
                WID_OPLATY := 1;         {STAWKA}
                MODE       := FIVE_DAY;       {Пятидневка}
                OKLAD      := 0.;
                FROM       := 0;               {OTKUDA PRIBYL}
                MALO       := 0;
                PODOH      := 100;
                if isSVDN then
                   PROFSOJUZ  := 0
                else
                   PROFSOJUZ  := 1;
                DAY        := 0;
                MAIN       := 3;
{               RECALC:=0;}
                BANK       := 1;
                ID         := 0;
                Reserved   := 0;
//                FOR I:=1 TO 8 DO RESERVED[I]:=0;
                STATE      := PERSON_WORK_STATE;
                AUTOMATIC  := AUTOMATIC_MODE;
                NAL_CODE   := '';
                START_DAY  := 1;
                PENS       := 100;
                if Wanted_Person_After=nil then
                   NEXT       := NIL;
                SOWM       := NIL;
                ADD        := NIL;
                UD         := NIL;
                CN         := NIL;
            END;
       FILL_STANDARD_TABEL;
       FillChar(CURR_PERSON^.HOLIDAY,SizeOf(CURR_PERSON^.HOLIDAY),0);
   END;
  PROCEDURE MAKE_ADD(VAR CURR_ADD:ADD_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR:ADD_PTR;
   BEGIN
   {    IF CURR_PERSON^.ADD<>NIL THEN}
{       IF NOT OK_FREE_MEM(SIZEOF(CURR_PERSON^.ADD^)) THEN EXIT;}
       NEW(CURR_ADD);
       FillChar(Curr_Add^,SizeOf(Curr_add^),0);
       WITH CURR_ADD^ DO
            BEGIN
                SHIFR      := 0;
                PERIOD     := 0;
                YEAR       := CURRYEAR-1990;
                SUMMA      := 0.;
                FMP        := 0.;
                FZP        := 0.;
                OTHER      := 0.;
                VYPLACHENO := NOT_GET_OUT;
                COUNT      := GET_IST_NAME(CURR_PERSON^.GRUPPA);
                SHIFR_KAT  := CURR_PERSON^.KATEGORIJA;
                SHIFR_GRU  := CURR_PERSON^.GRUPPA;
                WORK_DAY   := 0;
                WORK_CLOCK := 0;
                WHO        := 0;
                NEXT       := NIL;
            END;
       IF CURR_PERSON^.ADD=NIL THEN
          CURR_PERSON^.ADD:=CURR_ADD
       ELSE
          BEGIN
               CURR:=CURR_PERSON^.ADD;
               WHILE CURR^.NEXT<>NIL DO CURR:=CURR^.NEXT;
               CURR^.NEXT:=CURR_ADD
          END;
   END;
  PROCEDURE MAKE_SOWM(VAR CURR_SOWM:SOWM_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR:SOWM_PTR;
   BEGIN
       IF CURR_PERSON^.SOWM<>NIL THEN
       IF NOT OK_FREE_MEM(SIZEOF(CURR_PERSON^.SOWM^)) THEN EXIT;
       NEW(CURR_SOWM);
       FillChar(Curr_Sowm^,SizeOf(Curr_Sowm^),0);
       WITH CURR_SOWM^ DO
            BEGIN
                WHERE := 1;
                NEXT  := NIL;
            END;
       IF CURR_PERSON^.SOWM=NIL THEN
          CURR_PERSON^.SOWM:=CURR_SOWM
       ELSE
           BEGIN
                CURR:=CURR_PERSON^.SOWM;
                WHILE CURR^.NEXT<>NIL DO CURR:=CURR^.NEXT;
                CURR^.NEXT:=CURR_SOWM
           END;
   END;
  PROCEDURE MAKE_UD(VAR CURR_UD:UD_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR:UD_PTR;
   BEGIN
       IF CURR_PERSON^.UD<>NIL THEN
       IF NOT OK_FREE_MEM(SIZEOF(CURR_PERSON^.UD^)) THEN EXIT;
       NEW(CURR_UD);
       FillChar(Curr_Ud^,SizeOf(Curr_Ud^),0);
       WITH CURR_UD^ DO
            BEGIN
                SHIFR      := 0;
                PERIOD     := 0;
                YEAR       := CURRYEAR-1990;
                SUMMA      := 0.;
                VYPLACHENO := NOT_GET_OUT;
                WHO        := 0;
                COUNT      := GET_IST_NAME(CURR_PERSON^.GRUPPA);
                NEXT       := NIL;
            END;
       IF CURR_PERSON^.UD=NIL THEN
          CURR_PERSON^.UD:=CURR_UD
                               ELSE
          BEGIN
               CURR:=CURR_PERSON^.UD;
               WHILE CURR^.NEXT<>NIL DO CURR:=CURR^.NEXT;
               CURR^.NEXT:=CURR_UD
          END;
   END;
  PROCEDURE MAKE_CN(VAR CURR_CN:CN_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR:CN_PTR;
   FUNCTION MAKE_NEW_ID_CN:BYTE;
    VAR I,I_C:INTEGER;
        CURR_CN:CN_PTR;
        R:BYTE;
        L:BOOLEAN;
    BEGIN
         I_C:=COUNT_CN(CURR_PERSON);
         REPEAT
               R:=0;
               WHILE R=0 DO R:=RANDOM(255);
               Curr_Cn:=Curr_Person^.CN;
               L:=FALSE;
               while Assigned(Curr_Cn) do
                  begin
                       if Curr_Cn^.Id=r then
                          begin
                               L:=True;
                               Break;
                          end;
                       Curr_Cn:=Curr_Cn^.Next;
                  end;
{
               IF I_C>0 THEN FOR I:=1 TO I_C DO
                  BEGIN
                       IF I=1 THEN CURR_CN:=CURR_PERSON^.CN
                              ELSE CURR_CN:=CURR_CN^.NEXT;
                       IF CURR_CN^.ID=R THEN L:=TRUE;
                  END;
}                  
         UNTIL NOT L;
         MAKE_NEW_ID_CN:=R;
    END;
   BEGIN
       if not Assigned(Curr_Person) then Exit;
       if CURR_PERSON=nil then Exit;
       IF CURR_PERSON^.CN<>NIL THEN
       IF NOT OK_FREE_MEM(SIZEOF(CURR_PERSON^.CN^)) THEN EXIT;
       NEW(CURR_CN);
       FillChar(CURR_CN^,SizeOf(Curr_Cn^),0);
       WITH CURR_CN^ DO
            BEGIN
                SHIFR  := 0;
                KOD    := 0;
                SUMMA  := 0.;
                PRIM   := 0;
                PRIM_1 := space(8);
                DEJA_COUNTED := NOT_DEJA_COUNTED;
                FLOW_SUMMA   := 0;
                LIMIT_SUMMA  := 0;
                AUTOMATIC    := AUTOMATIC_MODE;
                ID           := MAKE_NEW_ID_CN;
                COUNT        := GET_IST_NAME(CURR_PERSON^.GRUPPA);
                NEXT         := NIL;
            END;
       IF CURR_PERSON^.CN=NIL THEN
          CURR_PERSON^.CN:=CURR_CN
       ELSE
          BEGIN
              CURR:=CURR_PERSON^.CN;
              WHILE CURR^.NEXT<>NIL DO CURR:=CURR^.NEXT;
              CURR^.NEXT:=CURR_CN
          END;
   END;
  PROCEDURE DEL_ADD(VAR CURR_ADD:ADD_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR,DELETED_ADD:ADD_PTR;
       err:Boolean;
   BEGIN
        if not Assigned(Curr_Add)        then Exit;
        if not Assigned(Curr_Person)     then Exit;
        if not Assigned(Curr_Person.Add) then Exit;
        err:=false;
{
        try
           if ((Curr_Add.Period<0) or (Curr_Add.Period>12)) then
              err:=True;
        except
           else
               begin
                    err     := true;
                    Curr_Add := Nil;
               end
        end;
        if err then Exit;
}
        DELETED_ADD:=CURR_ADD;
        err:=False;
        IF CURR_PERSON^.ADD=CURR_ADD THEN
           CURR_PERSON^.ADD:=CURR_ADD^.NEXT
        ELSE
            BEGIN
                 CURR:=CURR_PERSON^.ADD;
                 WHILE CURR^.NEXT<>CURR_ADD DO
                      begin
                           if not Assigned(Curr) then
                              begin
                                   err:=True;
                                   Break;
                              end;
                           CURR:=CURR^.NEXT;
                      end;
                 if not err then
                   CURR^.NEXT:=CURR_ADD^.NEXT;
            END;
        try
           DELETED_ADD.NEXT:=nil;
           DISPOSE(DELETED_ADD);
        except
{
          on EInvalidPointer do
             begin
                  Curr_Add    := Nil;
                  Deleted_Add := nil;
             end;
}             
          on E:Exception do
             begin
                  if YesNo('Ошибка удаление Curr_Add.'+trim(E.Message)+' '+^M+'Выйти из программы?') then
                     halt;
             end;
        end;
        Curr_Add:=nil;
   END;
  PROCEDURE DEL_SOWM(VAR CURR_SOWM:SOWM_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR,DELETED_SOWM:SOWM_PTR;
       err:Boolean;
   BEGIN
        if not Assigned(Curr_Sowm)        then Exit;
        if not Assigned(Curr_Person)      then Exit;
        if not Assigned(Curr_Person.Sowm) then Exit;
        err:=false;
{
        try
           if ((Curr_Sowm.where<0) or (Curr_Sowm.Where>300)) then
              err:=True;
        except
           else
               begin
                    err     := true;
                    Curr_Sowm := Nil;
               end
        end;
        if err then Exit;
}
        DELETED_SOWM:=CURR_SOWM;
        err:=false;
        IF CURR_PERSON^.SOWM=CURR_SOWM THEN
           CURR_PERSON^.SOWM:=CURR_SOWM^.NEXT
        ELSE
            BEGIN
                 CURR:=CURR_PERSON^.SOWM;
                 WHILE CURR^.NEXT<>CURR_SOWM DO
                       begin
                            if not Assigned(curr) then
                               begin
                                    err:=True;
                                    break;
                               end;
                            CURR:=CURR^.NEXT;
                       end;
                 if not err then
                    CURR^.NEXT:=CURR_SOWM^.NEXT;
            END;
       try
           DELETED_SOWM.NEXT:=nil;
           DISPOSE(DELETED_SOWM);
       except
{
           on EInvalidPointer do
              begin
                   CURR_SOWM    := nil;
                   Deleted_Sowm := nil;
              end;
}
          on E:Exception do
             begin
                  if YesNo('Ошибка удаление Curr_Sowm.'+trim(E.Message)+' '+^M+'Выйти из программы?') then
                     halt;
             end;

       end
   END;
  PROCEDURE DEL_UD(VAR CURR_UD:UD_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR,DELETED_UD:UD_PTR;
       err : boolean;
   BEGIN
        if not Assigned(Curr_Ud)        then Exit;
        if not Assigned(Curr_Person)    then Exit;
        if not Assigned(Curr_Person.Ud) then Exit;
        if Curr_Ud=nil                  then Exit;
        if Curr_Person=nil              then Exit;
        if Curr_Person.Ud=nil           then Exit;
        err:=false;
{
        try
           if ((Curr_Ud.SHIFR<0) or (Curr_Ud.Shifr>500)) then
              err:=True;
        except
           else
               begin
                    err     := true;
                    Curr_Ud := Nil;
               end
        end;
        if err then Exit;
}
        DELETED_UD:=CURR_UD;
        err:=false;
        IF (CURR_PERSON^.UD=CURR_UD) THEN
           CURR_PERSON^.UD:=CURR_UD^.NEXT
        ELSE
            BEGIN
                 CURR:=CURR_PERSON^.UD;
                 WHILE CURR^.NEXT<>CURR_UD DO
                       begin
                            if not Assigned(Curr) then
                               begin
                                    err:=True;
                                    Break;
                               end;
                            CURR:=CURR^.NEXT;
                       end;
                 if not err then
                    CURR^.NEXT:=CURR_UD^.NEXT;
            END;
        try
           DELETED_UD.NEXT:=nil;
           DISPOSE(DELETED_UD);
        except
{
          on EInvalidPointer do
             begin
                  Curr_Ud    := nil;
                  Deleted_Ud := nil;
             end;
}
          on E:Exception do
             begin
                  if YesNo('Ошибка удаление Curr_Cn.'+trim(E.Message)+' '+^M+'Выйти из программы?') then
                     halt;
             end;
        end;
        Curr_Ud:=nil;
   END;
  PROCEDURE DEL_CN(VAR CURR_CN:CN_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR,DELETED_CN:CN_PTR;
       err:Boolean;
   BEGIN
        if not Assigned(Curr_Cn)        then Exit;
        if not Assigned(Curr_Person)    then Exit;
        if not Assigned(Curr_Person.Cn) then Exit;
{
        err:=false;
        try
           if ((CURR_CN.SHIFR<0) or (CURR_CN.Shifr>10000)) then
              err:=True;
        except
           else
               begin
                    err:=true;
                    Curr_Cn:=Nil;
               end
        end;
        if err then Exit;
}        
        DELETED_CN:=CURR_CN;
        err:=false;
        IF CURR_PERSON^.CN=CURR_CN THEN
           CURR_PERSON^.CN:=CURR_CN^.NEXT
        ELSE
           BEGIN
                CURR:=CURR_PERSON^.CN;
                WHILE (CURR^.NEXT<>CURR_CN) DO
                 begin
                      CURR:=CURR^.NEXT;
                      if not Assigned(Curr) then
                         begin
                              err:=True;
                              break;
                         end;
                 end;
                if not err then
                   CURR^.NEXT:=CURR_CN^.NEXT;
           END;
       try
          Dispose(Deleted_Cn);
       except
{
          on EInvalidPointer do
             begin
                  Deleted_Cn := nil ;
                  Curr_Cn    := nil ;
             end
}
          on E:Exception do
             begin
                  if YesNo('Ошибка удаление Curr_Cn.'+trim(E.Message)+' '+^M+'Выйти из программы?') then
                     halt;
             end;

       end
   END;
  PROCEDURE DEL_PERSON(VAR CURR_PERSON:PERSON_PTR);
   VAR
       CURR,DELETED_PERSON   :PERSON_PTR;
       err:Boolean;
     BEGIN
       if not Assigned(Curr_Person) then Exit;
       if not Assigned(Head_Person) then Exit;
       if Curr_Person=nil           then Exit;
       if Head_Person=nil           then Exit;
       err:=false;
       try
          if ((Curr_Person.Tabno<0) or (CURR_PERSON.Tabno>25000)) then
             err:=True;
       except
         else
           begin
             if DebugMemoryCorruption then
                ShowMessage('Ошибка удаления записи сотрудника');
             err:=True;
           end
       end;
       if err then Exit;
       DELETED_PERSON:=CURR_PERSON;
       WHILE Assigned(CURR_PERSON^.SOWM) DO DEL_SOWM(CURR_PERSON^.SOWM , CURR_PERSON);
       WHILE Assigned(CURR_PERSON^.ADD)  DO DEL_ADD(CURR_PERSON^.ADD   , CURR_PERSON);
       WHILE Assigned(CURR_PERSON^.UD)   DO DEL_UD(CURR_PERSON^.UD     , CURR_PERSON);
       WHILE Assigned(CURR_PERSON^.CN)   DO DEL_CN(CURR_PERSON^.CN     , CURR_PERSON);
       err := false;
       IF HEAD_PERSON=CURR_PERSON THEN
          HEAD_PERSON:=CURR_PERSON^.NEXT
       ELSE
          BEGIN
               CURR:=HEAD_PERSON;
               WHILE CURR^.NEXT<>CURR_PERSON DO
                     begin
                          CURR:=CURR^.NEXT;
                          if not Assigned(Curr) then
                             begin
                                  err:=True;
                                  Break;
                             end;
                     end;
               CURR^.NEXT:=CURR_PERSON^.NEXT
          END;
       try
          DELETED_PERSON.ADD  := nil;
          DELETED_PERSON.UD   := nil;
          DELETED_PERSON.CN   := nil;
          DELETED_PERSON.SOWM := nil;
          DELETED_PERSON      := nil;
          Dispose(Deleted_Person);
       except
{
          on EInvalidPointer do
             begin
                  Deleted_Person := nil ;
                  Curr_Person    := nil ;
             end
}             
          on E:Exception do
             begin
                  if YesNo('Ошибка удаление Curr_Person.'+trim(E.Message)+' '+^M+'Выйти из программы?') then
                     halt;
             end;

       end;
       Curr_Person:=nil;
   END;

  PROCEDURE EMPTY_ALL_PERSON;
   BEGIN
      WHILE (HEAD_PERSON<>NIL) DO DEL_PERSON(HEAD_PERSON);
   END;


  PROCEDURE LDEL_PERSON_OLD;
   BEGIN
      IF SELECTED_FIELD=1 THEN BEGIN
         ShowMessage('IN LDEL_PERSON_OLD ENTERED WITH SELECTED_FIELD=1');
         EXIT;
                               END;
      EMPTY_ALL_PERSON;
   END;


function OK_FREE_MEM(Len:Integer):boolean;
 begin
      OK_FREE_MEM:=true;
 end;

 FUNCTION INIT_PERSON_ITERATOR:PERSON_PTR;
  VAR CURR_PERSON:PERSON_PTR;
      KOD:INTEGER;
      A:REAL;
  BEGIN
       KZ:=0;
       IF FLAG_FILTER THEN
          BEGIN
                CURR_PERSON:=HEAD_PERSON;
                WHILE NOT (TEST_PERSON(CURR_PERSON,KOD,A)) AND
                         (KZ=0) AND (CURR_PERSON<>NIL) DO CURR_PERSON:=CURR_PERSON^.NEXT;
                IF KZ<0 THEN CURR_PERSON:=NIL;
                INIT_PERSON_ITERATOR:=CURR_PERSON;
          END
                      ELSE  INIT_PERSON_ITERATOR:=HEAD_PERSON;
 end;
  PROCEDURE LDEL_PERSON;
  VAR
      W:PERSON_PTR;
      DONE : BOOLEAN;
   BEGIN
      KZ:=0;
      REPEAT
            DONE:=TRUE;
            W:=INIT_PERSON_ITERATOR;
            IF W<>NIL THEN
            REPEAT
                  IF W<>NIL THEN
                     BEGIN
                          DEL_PERSON(W);
                          DONE:=FALSE;
                     END
                            ELSE
                     IF GET_NEXT_PERSON_ITERATOR(W) THEN;
            UNTIL (W=NIL) OR (NOT DONE) OR (KZ<0);
      UNTIL DONE;
   END;

  PROCEDURE LDEL_PERSON_ZERO;
  VAR
      W:PERSON_PTR;
      DONE : BOOLEAN;
   BEGIN
      KZ:=0;
      REPEAT
            DONE:=TRUE;
            W:=INIT_PERSON_ITERATOR;
            IF W<>NIL THEN
            REPEAT
                  IF (W<>NIL) and (W^.Tabno=0) THEN
                     BEGIN
                          DEL_PERSON(W);
                          DONE:=FALSE;
                          break;
                     END
                            ELSE
                     IF GET_NEXT_PERSON_ITERATOR(W) THEN;
            UNTIL (W=NIL) OR (NOT DONE) OR (KZ<0);
      UNTIL DONE;
   END;

PROCEDURE LDEL_SOWM_ZERO(CURR_PERSON:PERSON_PTR);
 var Curr_Sowm:Sowm_Ptr;
     Done:boolean;
 begin
      Done:=false;
      while not Done do
       begin
             Done:=true;
             Curr_Sowm:=Curr_Person^.Sowm;
             while (Curr_Sowm<>Nil) do
              begin
                   if Curr_Sowm^.Where<1 then
                      begin
                           Del_Sowm(Curr_Sowm,Curr_Person);
                           Done:=false;
                           Break;
                      end;
                   Curr_Sowm:=Curr_Sowm^.Next;
              end;
       end;
 end;

PROCEDURE LDEL_ADD_ZERO(CURR_PERSON:PERSON_PTR);
 var Curr_Add:Add_Ptr;
     Done:boolean;
 begin
      Done:=false;
      while not Done do
       begin
             Done:=true;
             Curr_Add:=Curr_Person^.Add;
             while (Curr_Add<>Nil) do
              begin
                   if Curr_Add^.Shifr<1 then
                      begin
                           Del_Add(Curr_Add,Curr_Person);
                           Done:=false;
                           Break;
                      end;
                   Curr_Add:=Curr_Add^.Next;
              end;
       end;
 end;

PROCEDURE LDEL_UD_ZERO(CURR_PERSON:PERSON_PTR);
 var Curr_Ud:Ud_Ptr;
     Done:boolean;
 begin
      Done:=false;
      while not Done do
       begin
             Done:=true;
             Curr_Ud:=Curr_Person^.Ud;
             while (Curr_Ud<>Nil) do
              begin
                   if Curr_Ud^.Shifr<1 then
                      begin
                           Del_Ud(Curr_Ud,Curr_Person);
                           Done:=false;
                           Break;
                      end;
                   Curr_Ud:=Curr_Ud^.Next;
              end;
       end;
 end;

PROCEDURE LDEL_CN_ZERO(CURR_PERSON:PERSON_PTR);
 var Curr_CN:CN_Ptr;
     Done:boolean;
 begin
      Done:=false;
      while not Done do
       begin
             Done:=true;
             Curr_CN:=Curr_Person^.CN;
             while (Curr_CN<>Nil) do
              begin
                   if Curr_CN^.Shifr<1 then
                      begin
                           Del_CN(Curr_CN,Curr_Person);
                           Done:=false;
                           Break;
                      end;
                   Curr_CN:=Curr_CN^.Next;
              end;
       end;
 end;

{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
 FUNCTION GET_NEXT_PERSON_ITERATOR(VAR CURR_PERSON:PERSON_PTR):BOOLEAN;
  VAR KOD:INTEGER;
      A  :REAL;
      L  :BOOLEAN;
  BEGIN
       L:=FALSE;
       IF CURR_PERSON<>NIL THEN
           REPEAT
                CURR_PERSON:=CURR_PERSON^.NEXT;
                IF (TEST_PERSON(CURR_PERSON,KOD,A)) AND (KZ=0) THEN L:=TRUE;
           UNTIL (L=TRUE) OR (CURR_PERSON=NIL) OR (KZ<0);
       IF L THEN GET_NEXT_PERSON_ITERATOR:=TRUE
            ELSE GET_NEXT_PERSON_ITERATOR:=FALSE;
  END;

{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
 FUNCTION INIT_PERSON_ITERATOR_ABSOLUTE:PERSON_PTR;
  BEGIN
       INIT_PERSON_ITERATOR_ABSOLUTE:=HEAD_PERSON;
  END;
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
 FUNCTION GET_NEXT_PERSON_ITERATOR_ABSOLUTE(VAR CURR_PERSON:PERSON_PTR):BOOLEAN;
  BEGIN
       IF CURR_PERSON<>NIL THEN CURR_PERSON:=CURR_PERSON^.NEXT;
       IF CURR_PERSON<>NIL THEN GET_NEXT_PERSON_ITERATOR_ABSOLUTE:=TRUE
                           ELSE GET_NEXT_PERSON_ITERATOR_ABSOLUTE:=FALSE;
  END;
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
 FUNCTION OK_PERSON_ITERATOR(CURR_PERSON:PERSON_PTR):BOOLEAN;
  VAR WORK_PERSON:PERSON_PTR;
  BEGIN
      WORK_PERSON:=CURR_PERSON;
      IF GET_NEXT_PERSON_ITERATOR(WORK_PERSON) THEN OK_PERSON_ITERATOR:=TRUE
                                               ELSE OK_PERSON_ITERATOR:=FALSE;
  END;
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
 FUNCTION COUNT_PERSON_WITH_FILTER:INTEGER;
  VAR I:INTEGER;
      CURR_PERSON:PERSON_PTR;
  BEGIN
       IF NOT FLAG_FILTER THEN
          BEGIN
               COUNT_PERSON_WITH_FILTER:=COUNT_PERSON;
               EXIT;
          END;
       I:=0;
       CURR_PERSON:=INIT_PERSON_ITERATOR;
       IF CURR_PERSON<>NIL THEN I:=1;
       WHILE (GET_NEXT_PERSON_ITERATOR(CURR_PERSON)) DO I:=I+1;
       COUNT_PERSON_WITH_FILTER:=I;
  END;

FUNCTION TEST_PERSON(CURR_PERSON:PERSON_PTR;VAR KOD:INTEGER;VAR VALUE:REAL):BOOLEAN;
 CONST
      NUMERIC_TYPE = 1;
      BOOLEAN_TYPE = 2;
      STRING_TYPE  = 3;
 VAR
     TYPE_OF_VALUE:INTEGER;
     VALUE_OF_NUMERIC : REAL;
     VALUE_OF_BOOLEAN : BOOLEAN;
     VALUE_OF_STRING  : STRING;
 BEGIN
     Test_Person:=true;
{
     IF (FILTER_STRING='') OR (NOT FLAG_FILTER) THEN BEGIN TEST_PERSON:=TRUE; EXIT; END;
     KZ:=0;
     IF FILTER(FILTER_STRING,CURR_PERSON,VALUE_OF_NUMERIC,VALUE_OF_BOOLEAN,VALUE_OF_STRING,TYPE_OF_VALUE) THEN ELSE;
     IF KZ<0 THEN BEGIN TEST_PERSON:=FALSE; EXIT; END;
     KOD:=1;
     CASE TYPE_OF_VALUE OF
      NUMERIC_TYPE : BEGIN VALUE:=VALUE_OF_NUMERIC; KOD:=2; TEST_PERSON:=TRUE; END;
      BOOLEAN_TYPE : TEST_PERSON:=VALUE_OF_BOOLEAN;
      ELSE           TEST_PERSON:=FALSE;
     END;
}
 END;
FUNCTION DEL_WANTED_CN(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR):BOOLEAN;
 VAR L,FOUND:BOOLEAN;
     CURR_CN:CN_PTR;
     I,I_C:INTEGER;
 BEGIN
     L:= FALSE;
     REPEAT
           FOUND:=FALSE;
           I_C:=COUNT_CN(CURR_PERSON);
           I:=0;
           IF I_C>0 THEN
              REPEAT
                    I:=I+1;
                    IF I=1 THEN CURR_CN:=CURR_PERSON^.CN
                           ELSE CURR_CN:=CURR_CN^.NEXT;
                    IF CURR_CN^.SHIFR      = WANTED_SHIFR     THEN
                    IF CURR_CN^.AUTOMATIC  = AUTOMATIC_MODE   THEN
                       BEGIN
                            L:=TRUE;
                            FOUND:=TRUE;
                            DEL_CN(CURR_CN,CURR_PERSON);
                       END;
              UNTIL (I=I_C) OR (FOUND);
     UNTIL NOT FOUND;
     DEL_WANTED_CN:=L;
 END;

FUNCTION DEL_WANTED_UD_YEAR(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER;START_YEAR:INTEGER):BOOLEAN;
 VAR L,FOUND:BOOLEAN;
     CURR_UD:UD_PTR;
     I,I_U:INTEGER;
     Y:Integer;
 BEGIN
     Y:=START_YEAR;
     if y>1990 then
        y:=y-1990;
     L:= FALSE;
     REPEAT
           FOUND:=FALSE;
           I_U:=COUNT_UD(CURR_PERSON);
           I:=0;
           IF I_U>0 THEN
              REPEAT
                    I:=I+1;
                    IF I=1 THEN CURR_UD:=CURR_PERSON^.UD
                           ELSE CURR_UD:=CURR_UD^.NEXT;
                    IF CURR_UD^.SHIFR=WANTED_SHIFR     THEN
                    IF CURR_UD^.VYPLACHENO=NOT_GET_OUT THEN
                    IF CURR_UD^.PERIOD = START_MONTH THEN
                    IF CURR_UD^.YEAR   = Y THEN
                       BEGIN
                            L:=TRUE;
                            FOUND:=TRUE;
                            DEL_UD(CURR_UD,CURR_PERSON);
                       END;
              UNTIL (I=I_U) OR (FOUND);
     UNTIL NOT FOUND;
     DEL_WANTED_UD_YEAR:=L;
 END;


FUNCTION DEL_WANTED_UD(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):BOOLEAN;
 VAR L,FOUND:BOOLEAN;
     CURR_UD:UD_PTR;
     I,I_U:INTEGER;
 BEGIN
     L:= FALSE;
     REPEAT
           FOUND:=FALSE;
           I_U:=COUNT_UD(CURR_PERSON);
           I:=0;
           IF I_U>0 THEN
              REPEAT
                    I:=I+1;
                    IF I=1 THEN CURR_UD:=CURR_PERSON^.UD
                           ELSE CURR_UD:=CURR_UD^.NEXT;
                    IF CURR_UD^.SHIFR=WANTED_SHIFR     THEN
                    IF CURR_UD^.VYPLACHENO=NOT_GET_OUT THEN
                    IF CURR_UD^.PERIOD=START_MONTH THEN
                       BEGIN
                            L:=TRUE;
                            FOUND:=TRUE;
                            DEL_UD(CURR_UD,CURR_PERSON);
                       END;
              UNTIL (I=I_U) OR (FOUND);
     UNTIL NOT FOUND;
     DEL_WANTED_UD:=L;
 END;
FUNCTION DEL_WANTED_ADD(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):BOOLEAN;
 VAR L,FOUND:BOOLEAN;
     CURR_ADD:ADD_PTR;
     I,I_A:INTEGER;
 BEGIN
     L:= FALSE;
     REPEAT
           FOUND:=FALSE;
           I_A:=COUNT_ADD(CURR_PERSON);
           I:=0;
           IF I_A>0 THEN
              REPEAT
                    I:=I+1;
                    IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                           ELSE CURR_ADD:=CURR_ADD^.NEXT;
                    IF CURR_ADD^.SHIFR=WANTED_SHIFR     THEN
                    IF CURR_ADD^.VYPLACHENO=NOT_GET_OUT THEN
                    IF CURR_ADD^.PERIOD=START_MONTH THEN
                       BEGIN
                            L:=TRUE;
                            FOUND:=TRUE;
                            DEL_ADD(CURR_ADD,CURR_PERSON);
                       END;
              UNTIL (I=I_A) OR (FOUND);
     UNTIL NOT FOUND;
     DEL_WANTED_ADD:=L;
 END;
FUNCTION EXISTS_WANTED_UD(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):BOOLEAN;
 VAR FOUND:BOOLEAN;
     CURR_UD:UD_PTR;
 BEGIN
      FOUND:=FALSE;
      CURR_UD:=CURR_PERSON^.UD;
      WHILE (CURR_UD<>NIL) DO
        begin
             IF CURR_UD^.SHIFR=WANTED_SHIFR     THEN
             IF CURR_UD^.PERIOD=START_MONTH THEN
                BEGIN
                     FOUND:=TRUE;
                     Break;
                END;
             CURR_UD:=CURR_UD^.NEXT;
        end;
      EXISTS_WANTED_UD:=FOUND;

 END;

function GetMonthRus(N:Integer):string;
 begin
      case N of
       1: GetMonthRus:='январь';
       2: GetMonthRus:='февраль';
       3: GetMonthRus:='март';
       4: GetMonthRus:='апрель';
       5: GetMonthRus:='май';
       6: GetMonthRus:='июнь';
       7: GetMonthRus:='июль';
       8: GetMonthRus:='август';
       9: GetMonthRus:='сентябрь';
      10: GetMonthRus:='октябрь';
      11: GetMonthRus:='ноябрь';
      12: GetMonthRus:='декабрь';
      else
          GetMonthRus:='неверный';
     end;
 end;
 function GetMonthShortRus(N:Integer):string;
 begin
      case N of
       1: GetMonthShortRus:='янв';
       2: GetMonthShortRus:='фев';
       3: GetMonthShortRus:='мар';
       4: GetMonthShortRus:='апр';
       5: GetMonthShortRus:='май';
       6: GetMonthShortRus:='июн';
       7: GetMonthShortRus:='июл';
       8: GetMonthShortRus:='авг';
       9: GetMonthShortRus:='сен';
      10: GetMonthShortRus:='окт';
      11: GetMonthShortRus:='ноя';
      12: GetMonthShortRus:='дек';
      else
          GetMonthShortRus:='неверный';
     end;
 end;

 function GetMonthUkr(N:Integer):string;
 begin
      case N of
       1: GetMonthUkr:='січень';
       2: GetMonthUkr:='лютий';
       3: GetMonthUkr:='березень';
       4: GetMonthUkr:='квітень';
       5: GetMonthUkr:='травень';
       6: GetMonthUkr:='червень';
       7: GetMonthUkr:='липень';
       8: GetMonthUkr:='серпень';
       9: GetMonthUkr:='вересень';
      10: GetMonthUkr:='жовтень';
      11: GetMonthUkr:='листопад';
      12: GetMonthUkr:='грудень';
      else
          GetMonthUkr:='невірний';
     end;
 end;

 function GetMonthShortUkr(N:Integer):string;
 begin
      case N of
       1: GetMonthShortUkr:='січ';
       2: GetMonthShortUkr:='лют';
       3: GetMonthShortUkr:='бер';
       4: GetMonthShortUkr:='кві';
       5: GetMonthShortUkr:='тра';
       6: GetMonthShortUkr:='чер';
       7: GetMonthShortUkr:='лип';
       8: GetMonthShortUkr:='сер';
       9: GetMonthShortUkr:='вер';
      10: GetMonthShortUkr:='жов';
      11: GetMonthShortUkr:='лис';
      12: GetMonthShortUkr:='гру';
      else
          GetMonthShortUkr:='невірний';
     end;
 end;


 PROCEDURE SortPerson(Mode:Integer);
 var TmpHead:Person_Ptr;
     MinTabno:integer;
     MinFio:string;
     Done:boolean;
     Curr_Person,Prev_Person,Min_Person,Prev_Min_Person:Person_Ptr;
 begin
     TmpHead:=Nil;
     Done:=false;
     while not Done do
      begin
           if Head_Person=Nil then break;
           Curr_Person     := Head_Person;
           Prev_Person     := Nil;
           Min_Person      := Nil;
           Prev_Min_Person := Nil;
           MinTabno        := 999999;
           MinFio          := CHR($FF);
           while Curr_Person<>Nil do
            begin
                 if Mode=1 then
                    begin
                         if MinTabno>Curr_Person^.TABNO then
                            begin
                                 MinTabno:=Curr_Person^.TABNO;
                                 Min_Person:=Curr_Person;
                                 Prev_Min_Person:=Prev_Person;
                            end
                    end
                           else
                    if MinFio>Curr_Person^.Fio then
                        begin
                             MinFio:=Curr_Person^.Fio;
                             Min_Person:=Curr_Person;
                             Prev_Min_Person:=Prev_Person;
                        end;
                 Prev_Person:=Curr_Person;
                 Curr_Person:=Curr_Person^.Next;
            end;
           if Min_Person<>Nil then
              begin
                    if Prev_Min_Person=Nil then
                       Head_Person:=Min_Person^.NEXT
                                           else
                       Prev_Min_Person^.NEXT:=Min_Person^.NEXT;
                    if TmpHead=Nil then TmpHead:=Min_Person
                                   else
                       begin
                            Curr_Person:=TmpHead;
                            Prev_Person:=Nil;
                            while Curr_Person<>Nil do
                             begin
                                  Prev_Person:=Curr_Person;
                                  Curr_Person:=Curr_Person^.NEXT;
                             end;
                            Prev_Person^.NEXT:=Min_Person;
                       end;
                    Min_Person^.NEXT:=Nil;
               end;
      end;
     Head_Person:=TmpHead;
 end;

PROCEDURE SortAdd(Curr_Person:Person_Ptr);
 var TmpAdd:Add_Ptr;
     MinShifr:integer;
     MinPeriod:integer;
     Done:boolean;
     Curr_Add,Prev_Add,Min_Add,Prev_Min_Add:Add_Ptr;
 begin
     TmpAdd:=Nil;
     Done:=false;
     while not Done do
      begin
           if Curr_Person^.Add=Nil then break;
           Curr_Add:=Curr_Person^.Add;
           Prev_Add:=Nil;
           Min_Add:=Nil;
           Prev_Min_Add:=Nil;
           MinShifr:=999999;
           MinPeriod:=9999;
           while Curr_Add<>Nil do
            begin
                 if (MinShifr>Curr_Add^.Shifr) or
                    ((MinShifr=Curr_Add^.Shifr) and (MinPeriod>Curr_Add^.Period)) then
                    begin
                         MinShifr:=Curr_Add^.Shifr;
                         MinPeriod:=Curr_Add^.Period;
                         Min_Add:=Curr_Add;
                         Prev_Min_Add:=Prev_Add;
                    end;
                 Prev_Add:=Curr_Add;
                 Curr_Add:=Curr_Add^.Next;
            end;
            if Min_Add<>Nil then
               begin
                    if Prev_Min_Add=Nil then
                       Curr_Person^.Add:=Min_Add^.NEXT
                                           else
                       Prev_Min_Add^.NEXT:=Min_Add^.NEXT;
                    if TmpAdd=Nil then TmpAdd:=Min_Add
                                   else
                       begin
                            Curr_Add:=TmpAdd;
                            Prev_Add:=Nil;
                            while Curr_Add<>Nil do
                             begin
                                  Prev_Add:=Curr_Add;
                                  Curr_Add:=Curr_Add^.NEXT;
                             end;
                            Prev_Add^.NEXT:=Min_Add;
                       end;
                    Min_Add^.NEXT:=Nil;
               end;
      end;
     Curr_Person^.Add:=TmpAdd;
 end;

PROCEDURE SortUd(Curr_Person:Person_Ptr);
 var TmpUd:Ud_Ptr;
     MinShifr:integer;
     MinPeriod:integer;
     Done:boolean;
     Curr_Ud,Prev_Ud,Min_Ud,Prev_Min_Ud:Ud_Ptr;
 begin
     TmpUd:=Nil;
     Done:=false;
     while not Done do
      begin
           if Curr_Person^.Ud=Nil then break;
           Curr_Ud:=Curr_Person^.Ud;
           Prev_Ud:=Nil;
           Min_Ud:=Nil;
           Prev_Min_Ud:=Nil;
           MinShifr:=999999;
           MinPeriod:=9999;
           while Curr_Ud<>Nil do
            begin
                 if (MinShifr>Curr_Ud^.Shifr) or
                    ((MinShifr=Curr_Ud^.Shifr) and (MinPeriod>Curr_Ud^.Period)) then
                    begin
                         MinShifr:=Curr_Ud^.Shifr;
                         MinPeriod:=Curr_Ud^.Period;
                         Min_Ud:=Curr_Ud;
                         Prev_Min_Ud:=Prev_Ud;
                    end;
                 Prev_Ud:=Curr_Ud;
                 Curr_Ud:=Curr_Ud^.Next;
            end;
            if Min_Ud<>Nil then
               begin
                    if Prev_Min_Ud=Nil then
                       Curr_Person^.Ud:=Min_Ud^.NEXT
                                           else
                       Prev_Min_Ud^.NEXT:=Min_Ud^.NEXT;
                    if TmpUd=Nil then TmpUd:=Min_Ud
                                   else
                       begin
                            Curr_Ud:=TmpUd;
                            Prev_Ud:=Nil;
                            while Curr_Ud<>Nil do
                             begin
                                  Prev_Ud:=Curr_Ud;
                                  Curr_Ud:=Curr_Ud^.NEXT;
                             end;
                            Prev_Ud^.NEXT:=Min_Ud;
                       end;
                    Min_Ud^.NEXT:=Nil;
               end;
      end;
     Curr_Person^.Ud:=TmpUd;
 end;

procedure SetUpSowm(Tabno,W_P:integer);
{ W_P - место основной работы}
 var C_Person:Person_Ptr;
     C,i:integer;
     TempHeadPerson:Person_Ptr;
     TempNSRV:INTEGER;
     saveSelect:Integer;
     finded:boolean;
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
      c:=0;
      c_Person:=head_Person;
      while (C_Person<>Nil) do
       begin
            if (c_Person^.Tabno=TABNO) then
            if (c_Person^.wid_raboty=Sowm_Wid_Raboty) then Inc(c);
            C_Person:=C_Person^.NEXT;
       end;

      if W_p=NSRV then
         begin
              c_person:=head_Person;
              while c_Person<>Nil do
               begin
                    if c_Person^.Tabno      = Tabno then
                    if c_Person^.wid_raboty = Osn_Wid_Raboty then
                       begin
                            Repair_Sowm(C_Person,nsrv,c);
                            break;
                       end;
                    c_person:=c_person^.Next;
               end;
         end
                  else
         begin
              i:=findFreeSelected;
              if i>0 then
                 begin
                      TempHeadPerson := Head_Person;
                      TempNSRV       := NSRV;
                      saveSelect     := SELECTED_FIELD;
                      finded:=false;
                      NSRV:=W_P;
                      MKFLNM;
                      if FileExists(fninf) then
                         begin
                              Select(i);
                              GETINF(TRUE);
                              c_person:=head_Person;
                              while (c_Person<>Nil) do
                                begin
                                     if c_Person^.tabno=tabno then
                                     if c_Person^.wid_raboty=1 then
                                        begin
                                             Repair_Sowm(C_Person,W_P,c);
                                             finded:=True;
                                             break;
                                        end;
                                     c_person:=c_person^.Next;
                                 end;
                              if finded then
                                 PUTINF;
                              EMPTY_ALL_PERSON;
                              Select(saveSelect);
                         end;
                      NSRV:=TempNSRV;
                      MKFLNM;
                 end;
                  //    Head_Person:=TempHeadPerson;
         end;
 end;




FUNCTION GET_KOEF_OKLAD_PERSON(CURR_PERSON:PERSON_PTR):REAL;
 VAR CURR_CN:CN_PTR;
     FINDED:BOOLEAN;
     A:REAL;
 BEGIN
     A:=1;
     CURR_CN:=CURR_PERSON^.CN;
     FINDED:=FALSE;
     WHILE (NOT FINDED) AND (CURR_CN<>NIL) DO
      BEGIN
           IF CURR_CN^.SHIFR=KOEF_OKLAD_SHIFR+LIMIT_CN_BASE THEN
              BEGIN
                   FINDED:=TRUE;
                   A:=CURR_CN^.SUMMA;
                   IF (A>3) AND (A<101)    THEN A:=A/100
                                           ELSE
                   IF (A>-0.0001) AND (A<=1) THEN A:=A
                                             ELSE A:=1;
              END
                                                                 ELSE
              CURR_CN:=CURR_CN^.NEXT;
      END;
     GET_KOEF_OKLAD_PERSON:=A;
 END;
FUNCTION GET_KOEF_OKLAD_CLEAR_PERSON(CURR_PERSON:PERSON_PTR):REAL;
 VAR CURR_CN:CN_PTR;
     FINDED:BOOLEAN;
     A:REAL;
 BEGIN
     A:=0;
     CURR_CN:=CURR_PERSON^.CN;
     FINDED:=FALSE;
     WHILE (NOT FINDED) AND (CURR_CN<>NIL) DO
      BEGIN
           IF CURR_CN^.SHIFR=KOEF_OKLAD_SHIFR+LIMIT_CN_BASE THEN
              BEGIN
                   FINDED:=TRUE;
                   A:=CURR_CN^.SUMMA;
                   IF (A>3) AND (A<101)    THEN A:=A/100
                                           ELSE
                   IF (A>-0.0001) AND (A<=1) THEN A:=A
                                             ELSE A:=1;
              END
                                                                 ELSE
              CURR_CN:=CURR_CN^.NEXT;
      END;
     GET_KOEF_OKLAD_CLEAR_PERSON:=A;
 END;

PROCEDURE MAKE_KOEF_OKLAD_PERSON(CURR_PERSON:PERSON_PTR;A:REAL);
 VAR CURR_CN:CN_PTR;
     FINDED:BOOLEAN;
 BEGIN
     CURR_CN:=CURR_PERSON^.CN;
     FINDED:=FALSE;
     WHILE (NOT FINDED) AND (CURR_CN<>NIL) DO
      IF CURR_CN^.SHIFR=KOEF_OKLAD_SHIFR+LIMIT_CN_BASE THEN
         FINDED:=TRUE
                                                       ELSE
         CURR_CN:=CURR_CN^.NEXT;
     IF NOT FINDED THEN
        BEGIN
             MAKE_CN(CURR_CN,CURR_PERSON);
             CURR_CN^.SHIFR:=KOEF_OKLAD_SHIFR+LIMIT_CN_BASE;
             CURR_CN^.KOD:=100;
        END;
     CURR_CN^.SUMMA:=A;
 END;

FUNCTION GET_KOEF_UW_OKLAD_PERSON(CURR_PERSON:PERSON_PTR):REAL;
 VAR CURR_CN:CN_PTR;
     FINDED:BOOLEAN;
     A:REAL;
 BEGIN
     A:=0;
     CURR_CN:=CURR_PERSON^.CN;
     FINDED:=FALSE;
     WHILE (NOT FINDED) AND (CURR_CN<>NIL) DO
      BEGIN
           IF CURR_CN^.SHIFR=KOEF_UW_OKLAD_SHIFR+LIMIT_CN_BASE THEN
              BEGIN
                   FINDED:=TRUE;
                   A:=CURR_CN^.SUMMA;
                   IF (A>3) AND (A<101)    THEN A:=A/100
                                           ELSE
                   IF (A>-0.0001) AND (A<=1) THEN A:=A
                                             ELSE A:=0;
              END
                                                                 ELSE
              CURR_CN:=CURR_CN^.NEXT;
      END;
     GET_KOEF_UW_OKLAD_PERSON:=A;
 END;



 FUNCTION GET_DOL_NAME(CURR_PERSON:PERSON_PTR):STRING;
 VAR CURR_CN:CN_PTR;
     FINDED:BOOLEAN;
     A:INTEGER;
 BEGIN
     A:=1;
     CURR_CN := CURR_PERSON^.CN;
     FINDED  := FALSE;
     WHILE (NOT FINDED) AND (CURR_CN<>NIL) DO
      BEGIN
           IF CURR_CN^.SHIFR=KOD_DOLG_SHIFR+LIMIT_CN_BASE THEN
              BEGIN
                   FINDED:=TRUE;
                   A:=CURR_CN^.PRIM;
              END
                                                          ELSE
              CURR_CN:=CURR_CN^.NEXT;
      END;
     GET_DOL_NAME:=NAME_DOLG_BY_SHIFR(A);
   END;

 FUNCTION GET_DOL_CODE(CURR_PERSON:PERSON_PTR):INTEGER;
 VAR CURR_CN:CN_PTR;
     FINDED:BOOLEAN;
     A:INTEGER;
 BEGIN
     A:=1;
     CURR_CN:=CURR_PERSON^.CN;
     FINDED:=FALSE;
     WHILE (NOT FINDED) AND (CURR_CN<>NIL) DO
      BEGIN
           IF CURR_CN^.SHIFR=KOD_DOLG_SHIFR+LIMIT_CN_BASE THEN
              BEGIN
                   FINDED:=TRUE;
                   A:=CURR_CN^.PRIM;
              END
                                                          ELSE
              CURR_CN:=CURR_CN^.NEXT;
      END;
     GET_DOL_CODE:=A;
   END;

PROCEDURE MAKE_DOL_PERSON(CURR_PERSON:PERSON_PTR;A:INTEGER);
 VAR CURR_CN:CN_PTR;
     FINDED:BOOLEAN;
 BEGIN
     CURR_CN:=CURR_PERSON^.CN;
     FINDED:=FALSE;
     WHILE (NOT FINDED) AND (CURR_CN<>NIL) DO
      IF CURR_CN^.SHIFR=KOD_DOLG_SHIFR+LIMIT_CN_BASE THEN
         FINDED:=TRUE
                                                       ELSE
         CURR_CN:=CURR_CN^.NEXT;
     IF NOT FINDED THEN
        BEGIN
             MAKE_CN(CURR_CN,CURR_PERSON);
             CURR_CN^.SHIFR:=KOD_DOLG_SHIFR+LIMIT_CN_BASE;
             CURR_CN^.KOD:=100;
        END;
     CURR_CN^.PRIM:=A;
 END;
PROCEDURE MAKE_IDDOGPODFORSOWM_PERSON(CURR_PERSON:PERSON_PTR;A:INTEGER);
 VAR CURR_CN:CN_PTR;
     FINDED:BOOLEAN;
 BEGIN
   {$IFDEF SVDN}
     CURR_CN:=CURR_PERSON^.CN;
     FINDED:=FALSE;
     WHILE (NOT FINDED) AND (CURR_CN<>NIL) DO
      IF CURR_CN^.SHIFR=DOG_POD_VNESH_SOWM_SHIFR+LIMIT_CN_BASE THEN
         FINDED:=TRUE
                                                       ELSE
         CURR_CN:=CURR_CN^.NEXT;
     IF NOT FINDED THEN
        BEGIN
             MAKE_CN(CURR_CN,CURR_PERSON);
             CURR_CN^.SHIFR:=DOG_POD_VNESH_SOWM_SHIFR+LIMIT_CN_BASE;
             CURR_CN^.KOD:=100;
        END;
     CURR_CN^.PRIM:=A;
    {$ENDIF}
 END;
FUNCTION GET_IDDOGPODFORSOWM_PERSON(CURR_PERSON:PERSON_PTR):INTEGER;
 VAR CURR_CN:CN_PTR;
     FINDED:BOOLEAN;
     RETVAL:integer;
 BEGIN
     RETVAL:=-1;
     {$IFDEF SVDN}
     CURR_CN:=CURR_PERSON^.CN;
     FINDED:=FALSE;
     WHILE (CURR_CN<>NIL) DO
       begin
          IF CURR_CN^.SHIFR=DOG_POD_VNESH_SOWM_SHIFR+LIMIT_CN_BASE THEN
             begin
                retVal:=curr_cn^.PRIM;
                FINDED:=TRUE;
                break;
              end;
          curr_cn:=curr_cn^.next;
       end;
     {$ENDIF}
     GET_IDDOGPODFORSOWM_PERSON:=retval;
 END;
FUNCTION GET_IDDOGPODFORSOWM_PERSON_FROM_SQL(CURR_PERSON:PERSON_PTR):INTEGER;
 VAR
     RETVAL:integer;
     SQLStmnt:string;
     v:Variant;
 BEGIN
     RETVAL:=-1;
     {$IFDEF SVDN}
     SQLStmnt:='select first 1 coalesce(id,0) from TB_DOGOVORA_GN_DET';
     SQLStmnt:=trim(SQLStmnt)+' where tabno='+trim(intToStr(curr_person^.tabno));
     SQLStmnt:=trim(SQLStmnt)+' order by id desc';
     v:=SQLQueryValue(SQLStmnt);
     if VarIsNumeric(v) then
        if v>0 then
           retVal:=v;
     {$ENDIF}
     GET_IDDOGPODFORSOWM_PERSON_FROM_SQL:=retval;
 END;

 FUNCTION GET_PERSON_OKLAD(CURR_PERSON:PERSON_PTR):REAL;
  BEGIN
  {     GET_PERSON_OKLAD:=CURR_PERSON^.OKLAD*GET_KOEF_OKLAD_PERSON(CURR_PERSON);}
        GET_PERSON_OKLAD:=R10(CURR_PERSON^.OKLAD+CURR_PERSON^.OKLAD*R10(get_KOEF_UW_OKLAD_PERSON(curr_Person)));
  END;

 FUNCTION NAME_DOLG(WANTED_DOLG:INTEGER):STRING;
  BEGIN
       NAME_DOLG:=NAMEDOLGLIST.GetNameByNo(Wanted_Dolg);
{
       W_serv:=Shifr_Dolg(Wanted_Dolg);
       IF NAMEDOLGLIST^.SEARCH(ADDR(W_SERV),JINDEX) THEN S:=PITEM(NAMEDOLGLIST^.AT(JINDEX))^.NAME^
                                                    ELSE
          begin
               STR(WANTED_DOLG,S);
               S:=S+' Не найден';
          end;
       NAME_DOLG:=S;
}
  END;

FUNCTION RAZR_DOLG(WANTED_DOLG:INTEGER):INTEGER;
{  VAR JINDEX:INTEGER;
      W_Serv:integer;
      RAZR:WORD;
}
  BEGIN
       Razr_Dolg:=NAMEDOLGLIST.GetRazrByNo(Wanted_Dolg);
{       Razr := 0;
       W_serv:=Shifr_Dolg(Wanted_Dolg);
       IF NAMEDOLGLIST^.SEARCH(ADDR(W_SERV),JINDEX) THEN
               RAZR:=PDOLGITEM(NAMEDOLGLIST^.AT(JINDEX))^.RAZR;
       RAZR_DOLG:=RAZR;
}
  END;

FUNCTION OKLAD_DOLG(WANTED_DOLG:INTEGER):REAL;
{  VAR JINDEX:INTEGER;
      W_Serv:integer;
      OKLAD:REAL;
}
  BEGIN
       OKLAD_DOLG:=NAMEDOLGLIST.GetOkladByNo(Wanted_Dolg);
{       OKLAD := 0;
       W_serv:=Shifr_Dolg(Wanted_Dolg);
       IF NAMEDOLGLIST^.SEARCH(ADDR(W_SERV),JINDEX) THEN
               OKLAD:=PDOLGITEM(NAMEDOLGLIST^.AT(JINDEX))^.OKLAD;
       OKLAD_DOLG:=OKLAD;
}
  END;



 FUNCTION NAME_DOLG_BY_SHIFR(WANTED_DOLG:INTEGER):STRING;
  BEGIN
       NAME_DOLG_BY_SHIFR:=NAMEDOLGLIST.GetName(Wanted_Dolg);
{
       W_serv:=WANTED_DOLG;
       IF NAMEDOLGLIST^.SEARCH(ADDR(W_SERV),JINDEX) THEN S:=PITEM(NAMEDOLGLIST^.AT(JINDEX))^.NAME^
                                                    ELSE
          begin
               STR(WANTED_DOLG,S);
               S:=S+' Не найден';
          end;
       NAME_DOLG_BY_SHIFR:=S;
}       
  END;

 FUNCTION SHIFR_DOLG(WANTED_DOLG:INTEGER):INTEGER;
  BEGIN
       Shifr_Dolg:=NAMEDOLGLIST.GetShifrByNo(Wanted_DOlg);
{
       if wanted_DOLG<=NAMEDOLGLIST^.Count then Shifr_DOLG:=PItem(NameDolgList^.At(Wanted_DOLG-1))^.ShifrId
                                           else Shifr_DOLG:=Wanted_DOLG;
}                                           
  END;

 FUNCTION NOMER_DOLG(WANTED_DOLG:INTEGER):INTEGER;
  BEGIN
       NOMER_DOLG:=NAMEDOLGLIST.GetNomerByShifr(Wanted_Dolg);
{
       IF NAMEDOLGLIST^.SEARCH(ADDR(WANTED_DOLG),JINDEX) THEN NOMER_DOLG:=JINDEX+1
                                                         ELSE NOMER_DOLG:=999;
}
  END;

FUNCTION GET_WR_NAME(WANTED_WR:Integer):String;
 begin
      if (WANTED_WR=1) then GET_WR_NAME:='основная'
                       else
      if (WANTED_WR=2) then GET_WR_NAME:='совмещение'
                       else GET_WR_NAME:=IntToStr(WANTED_WR)+' не верный'
 end;

FUNCTION GET_SWM_NAME(WANTED_SWM:Integer):String;
 begin
      if (WANTED_SWM=1) then GET_SWM_NAME:='основная'
                       else
      if (WANTED_SWM=2) then GET_SWM_NAME:='совмеcтительство'
                       else
      if (WANTED_SWM=3) then GET_SWM_NAME:='совмещение'
                       else GET_SWM_NAME:=IntToStr(WANTED_SWM)+' не верный'
 end;

procedure PUT_SWM_MODE_TO_PERSON(CURR_PERSON:PERSON_PTR;WANTED_SWM:Integer);
 var Curr_Cn:Cn_Ptr;
 begin
      REPEAT
      UNTIL NOT DEL_WANTED_CN(SOWMESTIT_CN_SHIFR,CURR_PERSON);
      REPEAT
      UNTIL NOT DEL_WANTED_CN(SOWMESTIT_CN_SHIFR+LIMIT_CN_BASE,CURR_PERSON);
      REPEAT
      UNTIL NOT DEL_WANTED_CN(OSN_MESTO_RABOTY_SHIFR,CURR_PERSON);
      REPEAT
      UNTIL NOT DEL_WANTED_CN(OSN_MESTO_RABOTY_SHIFR+LIMIT_CN_BASE,CURR_PERSON);
      CASE WANTED_SWM OF
       1: BEGIN
               MAKE_CN(CURR_CN,CURR_PERSON);
               CURR_CN^.SHIFR := OSN_MESTO_RABOTY_SHIFR+LIMIT_CN_BASE;
               CURR_CN^.KOD   := 100;
          END;
       2: BEGIN
               MAKE_CN(CURR_CN,CURR_PERSON);
               CURR_CN^.SHIFR := SOWMESTIT_CN_SHIFR+LIMIT_CN_BASE;
               CURR_CN^.KOD   := 100;
          END;
      END;
  end;
FUNCTION GET_SWM_MODE_PERSON(CURR_PERSON:PERSON_PTR):integer;
 var Curr_Cn:Cn_Ptr;
 begin
      GET_SWM_MODE_PERSON:=3;
      Curr_Cn:=Curr_Person^.CN;
      while (Curr_Cn<>Nil) do
       begin
            if Curr_Cn^.Shifr=SOWMESTIT_CN_SHIFR+LIMIT_CN_BASE then
               begin
                    GET_SWM_MODE_PERSON:=2;
                    break;
               end
            else if Curr_Cn^.Shifr=OSN_MESTO_RABOTY_SHIFR+LIMIT_CN_BASE then
               begin
                    GET_SWM_MODE_PERSON:=1;
                    break;
               end;
            Curr_Cn:=Curr_Cn^.Next;
       end;

 end;

 FUNCTION IS_OSN_WID_RABOTY(CURR_PERSON:PERSON_PTR):BOOLEAN;
  VAR CURR_CN:CN_PTR;
      retVal:boolean;
  BEGIN
      retVal:=FALSE;
      IF CURR_PERSON^.WID_RABOTY=OSN_WID_RABOTY THEN
         retVal:=TRUE
      ELSE
         BEGIN
              CURR_CN:=CURR_PERSON^.CN;
              WHILE (CURR_CN<>NIL) AND (NOT retVal) DO
                   IF CURR_CN^.SHIFR=OSN_MESTO_RABOTY_SHIFR+LIMIT_CN_BASE THEN
                      retVal:=TRUE
                   ELSE
                      curr_cn:=curr_cn^.NEXT;
         END;
      IS_OSN_WID_RABOTY:=retVal;
  END;

 FUNCTION IS_OSN_W_R_FOR_NALOG_RECALC(CURR_PERSON:PERSON_PTR):BOOLEAN;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
      FINDED_CN:Boolean;
  BEGIN
      FINDED_CN:=false;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) DO
        begin
            IF CURR_CN^.SHIFR=OSN_MESTO_RABOTY_SHIFR+LIMIT_CN_BASE THEN
               begin
                    Finded_Cn:=True;
                    Break;
               end;
            Curr_CN:=Curr_Cn^.Next;
        end;    
      if ((not FINDED_CN) and (CURR_PERSON^.WID_RABOTY=OSN_WID_RABOTY))  then
         IS_OSN_W_R_FOR_NALOG_RECALC:=True
      else
         IS_OSN_W_R_FOR_NALOG_RECALC:=false;
  END;

 PROCEDURE RESET_NET(VAR F:FILE;RECSIZE:WORD;FNAME:STRING);
  VAR DONE:BOOLEAN;
      KOD:WORD;
  BEGIN
       DONE:=FALSE;
       STEP_NET:=0;
       FILEMODE:=$42;
       WHILE NOT DONE DO
        BEGIN
             {$I-}
             IF RECSIZE=0 THEN RESET(F)
                          ELSE RESET(F,RECSIZE);
             KOD:=IORESULT;
             {$I+}
             IF (KOD<5) AND (KOD>0)  THEN
                BEGIN
                     ERROR('Ошибка RESET c сетевым с файлом '+ALLTRIM(FNAME)+'. Код='+INTTOSTR(KOD));
                     FILEMODE:=2;
                     KZ:=-1;
                     EXIT;
                END
                       ELSE
             IF (KOD<>0) and (KOD<>32) THEN
                BEGIN
                     STEP_NET:=STEP_NET+1;
                     IF STEP_NET>LIMIT_OPEN_TRY_NET THEN
                        BEGIN
          ERROR('После '+FloatToStrF(LIMIT_OPEN_TRY_NET,ffFixed,5,0)+' попыток не открылся (RESET) файл '+ALLTRIM(FNAME)+'. Код ошибки '+
                                   IntToStr(KOD));
                             DONE:=TRUE;
                             KZ:=-1;
                        END
                                   ELSE
                        BEGIN
                             DELAY(DELAY_NET)
                        END;
                END
                       ELSE
                BEGIN
                     DONE:=TRUE;
                     KZ:=0;
                END
        END;
  END;

{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }

 PROCEDURE REWRITE_NET(VAR F;RECSIZE:WORD;FNAME:STRING);
  VAR FIL : FILE ABSOLUTE F;
      DONE:BOOLEAN;
      KOD:WORD;
  BEGIN
       DONE:=FALSE;
       STEP_NET:=0;
       FILEMODE:=$12;
       WHILE NOT DONE DO
        BEGIN
             {$I-}
             IF RECSIZE=0 THEN REWRITE(FIL)
                          ELSE REWRITE(FIL,RECSIZE);
             KOD:=IORESULT;
             {$I+}
             IF (KOD<5) AND (KOD>0) THEN
                BEGIN
                     ShowMessage('Ошибка REWRITE с сетевым файлом '+ALLTRIM(FNAME)+'. Код='+IntToStr(KOD));
                     FILEMODE:=2;
                     KZ:=-1;
                     EXIT;
                END
                       ELSE
             IF KOD<>0 THEN
                BEGIN
                     STEP_NET:=STEP_NET+1;
                     IF STEP_NET>LIMIT_OPEN_TRY_NET THEN
                        BEGIN
   ERROR('После '+FloatToStrF(LIMIT_OPEN_TRY_NET,ffFixed,5,0)+' попыток не открылся (REWRITE) файл '+ALLTRIM(FNAME)+'. Код ошибки '+
                                   IntToStr(KOD));
                             DONE:=TRUE;
                             KZ:=-1;
                        END
                                   ELSE
                        BEGIN
                             DELAY(DELAY_NET)
                        END;
                END
                       ELSE
                BEGIN
                     DONE:=TRUE;
                     KZ:=0;
                END
        END;
  END;

procedure Delay(R:Integer);
 var ist,ic:TDateTime;
     jst,jc:TTimeStamp;
     js,jct:integer;
 begin
       ist:=time;
       jst:=DateTimeToTimeStamp(ist);
       js:=jst.time;

       ic:=time;
       jc:=DateTimeToTimeStamp(ic);
       jct:=jc.time;

       while (jct-js)<r do
        begin
             ic:=time;
             jc:=DateTimeToTimeStamp(ic);
             jct:=jc.time;
        end;

 end;

 procedure DelayPascal(dwMilliseconds: Longint);
 var
   iStart, iStop: DWORD;
 begin
   iStart := GetTickCount;
   repeat
     iStop := GetTickCount;
     Application.ProcessMessages;
   until (iStop - iStart) >= dwMilliseconds;
 end;

 function YesNo(S:String):boolean;
  begin
       if  MessageDlg(S,mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
           Result:=true else Result:=false;
  end;

function GetOsnKateg(Curr_Person:Person_Ptr):integer;
 var RetVal:integer;
     c_Person:person_ptr;
     Save_Selected:integer;
     Save_nsrv:integer;
 begin
      RetVal:=Curr_Person^.Kategorija;
      GetOsnKateg:=RetVal;
      Exit;
      if Curr_Person^.Wid_Raboty<>Osn_Wid_raboty then
         begin
              if Curr_Person^.Mesto_Osn_Raboty=nsrv then
                 begin
                      c_person:=head_person;
                      while c_person<>nil do
                       begin
                            if c_person^.tabno=curr_person^.tabno then
                            if c_person^.Wid_Raboty=Osn_Wid_raboty then
                               begin
                                    RetVal:=c_Person^.Kategorija;
                                    break;
                               end;
                            c_person:=c_person^.next;
                       end;
                 end
                                                    else
                 begin
                      save_nsrv:=nsrv;
                      nsrv:=Curr_person^.Mesto_osn_raboty;
                      mkflnm;
                      if fileexist(Fninf) then
                         begin
                              Save_Selected:=Selected_Field;
                              select(Max_Field);
                              getinf(false);
                              c_person:=head_person;
                              while c_person<>nil do
                                begin
                                     if c_person^.tabno=curr_person^.tabno then
                                     if c_person^.Wid_Raboty=Osn_Wid_raboty then
                                        begin
                                             RetVal:=c_Person^.Kategorija;
                                             break;
                                        end;
                                     c_person:=c_person^.next;
                                end;

                              EMPTY_ALL_PERSON;
                              select(Save_Selected);
                         end;
                      nsrv:=save_nsrv;
                      mkflnm;
                 end;
         end;
      GetOsnKateg:=RetVal;
 end;


function IsOsnPensioner(Curr_Person:Person_Ptr):boolean;
 var RetVal:boolean;
     c_Person:person_ptr;
     Save_Selected:integer;
     Save_nsrv:integer;
 FUNCTION  FINDPENSIONER(CUR_PERSON:PERSON_PTR):BOOLEAN;
   VAR
       CURR_CN:CN_PTR;
       FOUND:BOOLEAN;
   BEGIN
       FOUND:=FALSE;
       CURR_CN:=CUR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) AND(NOT FOUND) DO
             IF CURR_CN^.SHIFR=PENSIONER_SHIFR+LIMIT_CN_BASE THEN FOUND:=TRUE
                                                             ELSE CURR_CN:=CURR_CN^.NEXT;
       FINDPENSIONER:=FOUND;
   END;
 begin
      RetVal:=FindPensioner(Curr_Person);
      if Curr_Person^.Wid_Raboty<>Osn_Wid_raboty then
         begin
              if Curr_Person^.Mesto_Osn_Raboty=nsrv then
                 begin
                      c_person:=head_person;
                      while c_person<>nil do
                       begin
                            if c_person^.tabno=curr_person^.tabno then
                            if c_person^.Wid_Raboty=Osn_Wid_raboty then
                               begin
                                    RetVal:=FindPensioner(C_Person);
                                    break;
                               end;
                            c_person:=c_person^.next;
                       end;
                 end
                                                    else
                 begin
                      save_nsrv:=nsrv;
                      nsrv:=Curr_person^.Mesto_osn_raboty;
                      mkflnm;
                      if fileexist(Fninf) then
                         begin
                              Save_Selected:=Selected_Field;
                              select(Max_Field);
                              getinf(false);
                              c_person:=head_person;
                              while c_person<>nil do
                                begin
                                     if c_person^.tabno=curr_person^.tabno then
                                     if c_person^.Wid_Raboty=Osn_Wid_raboty then
                                        begin
                                             RetVal:=FindPensioner(C_Person);
                                             break;
                                        end;
                                     c_person:=c_person^.next;
                                end;

                              EMPTY_ALL_PERSON;
                              select(Save_Selected);
                         end;
                      nsrv:=save_nsrv;
                      mkflnm;
                 end;
         end;
      IsOsnPensioner:=RetVal;
 end;
PROCEDURE SELECT(I:INTEGER);
  VAR CURR_HEAD:PERSON_PTR;
  BEGIN
       IF (I<1) OR (I>MAX_FIELD) THEN
          BEGIN
                Error('Неправильный селектор рабочего поля '+IntToStr(I));
                EXIT;
          END;
       HEAD_ARRAY[SELECTED_FIELD]:=HEAD_PERSON;
       HEAD_PERSON:=HEAD_ARRAY[I];
       SELECTED_FIELD:=I;
  END;

 function findFreeSelected:Integer;
  var i:Integer;
      retVal:Integer;
  begin
       retVal:=0;
       for i:=1 to MAX_FIELD do
           if i<>SELECTED_FIELD then
              begin
                   if HEAD_ARRAY[i]=nil then
                      begin
                           retVal:=i;
                           Break;
                      end;
              end;
       findFreeSelected:=retVal;
  end;
 FUNCTION  IS_PENSIONER(CURR_PERSON:PERSON_PTR):BOOLEAN;
   VAR
       CURR_CN:CN_PTR;
       FOUND:BOOLEAN;
   BEGIN
       FOUND:=FALSE;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) AND(NOT FOUND) DO
             IF CURR_CN^.SHIFR=PENSIONER_SHIFR+LIMIT_CN_BASE THEN FOUND:=TRUE
                                                             ELSE CURR_CN:=CURR_CN^.NEXT;
       IS_PENSIONER:=FOUND;
       IS_PENSIONER:=IsOsnPensioner(Curr_Person);
   END;

 FUNCTION  IS_INVALID(CURR_PERSON:PERSON_PTR):BOOLEAN;
   VAR
       CURR_CN:CN_PTR;
       FOUND:BOOLEAN;
   BEGIN
       FOUND:=FALSE;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) AND(NOT FOUND) DO
             IF CURR_CN^.SHIFR=INVALID_SHIFR+LIMIT_CN_BASE THEN FOUND:=TRUE
                                                           ELSE CURR_CN:=CURR_CN^.NEXT;
       IS_INVALID:=FOUND;
   END;
 FUNCTION  IS_INNERSOWM(CURR_PERSON:PERSON_PTR):BOOLEAN;
   VAR
       CURR_CN:CN_PTR;
       FOUND:BOOLEAN;
   BEGIN
       FOUND:=FALSE;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) AND(NOT FOUND) DO
             IF CURR_CN^.SHIFR=INNERSOWM_SHIFR+LIMIT_CN_BASE THEN FOUND:=TRUE
                                                           ELSE CURR_CN:=CURR_CN^.NEXT;
       IS_INNERSOWM:=FOUND;
   END;

 FUNCTION IS_PRINAT_UWOLEN(CURR_PERSON:PERSON_PTR):BOOLEAN;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
  BEGIN
      DONE:=FALSE;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
       IF CURR_CN^.SHIFR=PRINAT_UWOLEN_SHIFR+LIMIT_CN_BASE THEN DONE:=TRUE
                                                           ELSE CURR_CN:=CURR_CN^.NEXT;
      IS_PRINAT_UWOLEN:=DONE;
  END;

 FUNCTION IS_KAND_NAUK(CURR_PERSON:PERSON_PTR):BOOLEAN;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
  BEGIN
      DONE:=FALSE;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
        begin
       IF CURR_CN^.SHIFR=ZA_STEP_SHIFR THEN
       if Abs(Curr_cn^.SUMMA-15)<0.01 then
          begin
                DONE:=TRUE;
                Break;
          end;
       CURR_CN:=CURR_CN^.NEXT;
       end;
      IS_KAND_NAUK:=DONE;
  END;
 FUNCTION IS_DOCENT(CURR_PERSON:PERSON_PTR):BOOLEAN;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
  BEGIN
      DONE:=FALSE;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
       begin
            IF CURR_CN^.SHIFR=ZA_ZWAN_SHIFR THEN
            if Abs(Curr_cn^.SUMMA-25.0)<0.01 then
               begin
                    DONE:=TRUE;
                    Break;
               end;

       CURR_CN:=CURR_CN^.NEXT;
       end;
      IS_DOCENT:=DONE;
  END;
 FUNCTION IS_DOKTOR_NAUK(CURR_PERSON:PERSON_PTR):BOOLEAN;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
  BEGIN
      DONE:=FALSE;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
       begin
            IF CURR_CN^.SHIFR=ZA_STEP_SHIFR THEN
            if Abs(Curr_cn^.SUMMA-25)<0.01 then
               begin
                    DONE:=TRUE;
                    Break;
               end;
            CURR_CN:=CURR_CN^.NEXT;
       end;
      IS_DOKTOR_NAUK:=DONE;
  END;


 FUNCTION IS_PROFESSOR(CURR_PERSON:PERSON_PTR):BOOLEAN;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
  BEGIN
      DONE:=FALSE;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
       begin
            IF CURR_CN^.SHIFR=ZA_ZWAN_SHIFR THEN
            if Abs(Curr_cn^.SUMMA-33.0)<0.01 then
               begin
                    DONE:=TRUE;
                    Break;
               end ;
            CURR_CN:=CURR_CN^.NEXT;
       end ;
      IS_PROFESSOR:=DONE;
  END;


 function STORONNEE_PODRAZD(wanted_serv:integer):boolean;
  const max_stor=2;
        s:array[1..max_stor] of integer = (82,161);
  var finded:boolean;
      i:integer;
  begin
       finded:=false;
       for i:=1 to Max_stor do
           if wanted_serv=s[i] then
              begin
                   finded:=true;
                   break;
              end;
       Storonnee_Podrazd:=finded;
  end;

 function RECENZENT_PODRAZD(wanted_serv:integer):boolean;
  const max_stor=2;
        s:array[1..max_stor] of integer = (105,121);
  var finded:boolean;
      i:integer;
  begin
       finded:=false;
       for i:=1 to Max_stor do
           if wanted_serv=s[i] then
              begin
                   finded:=true;
                   break;
              end;
       Recenzent_Podrazd:=finded;
  end;

 FUNCTION GetLgotyPN2004(CURR_PERSON:PERSON_PTR):REAL;
  var RetVal:real;
      Curr_Cn:Cn_Ptr;
  begin
      GetLgotyPN2004:=0;
      if (Curr_Person=nil) then
          Exit;
      RetVal:=0;
      Curr_Cn:=Curr_Person^.Cn;
      while (Curr_Cn<>Nil) do
       begin
            if Curr_Cn^.Shifr=Limit_Cn_Base+LgotyPn2004Shifr then
            if Curr_Cn^.Kod=100                              then
               begin
                    RetVal:=RetVal+Curr_Cn^.Summa;
                    Break;
               end;
            Curr_Cn:=Curr_Cn^.Next;
       end;
   GetLgotyPN2004:=RetVal;
  end;
 FUNCTION R10(SUMMA:REAL):REAL;
  VAR I,A:INTEGER;
      I64:Int64;
      RetVal        : real;
      CurrSumma     : real;
      Summa1,su     : Double;
  BEGIN
 //      {$IFNDEF SVDN}
 //      if (CURRYEAR>2015) or ((CURRYEAR=2015) and (NMES>8)) then
 //         begin
 //              Su:=SUMMA;
 //              RetVal:=SimpleRoundTo(SU,0);
 //              R10:=RetVal;
 //              Exit;
 //         end;
 //      {$ENDIF}
       Su:=SUMMA;
       Summa1:=SimpleRoundTo(SU,-3);
       I64:=Round(Summa1*1000);
       if I64 mod 5 = 0 then
          begin
               I64:=i64+1;
               Summa1:=SimpleRoundTo(I64 / 1000.0,-3);
          end
       else
         Summa1:=Su;
       if Summa1<-0.01 then
          Summa1:=Summa1-0.009;
       IF ABS(SUMMA)<100000000 THEN RetVal:=SimpleRoundTo(SUMMA1,-2)
                               ELSE RetVal:=ROUND(SUMMA/1000)*1000;
//     IF ABS(SUMMA)<100000000 THEN R10:=ROUND(SUMMA*100)/100
       R10:=RetVal;
  END;

 FUNCTION SUM(SUMMA:REAL):REAL;
  begin
{       Sum:=R10(SUMMA);}
      { Sum:=RoundTo(SUMMA,-2);}
       Sum:=R10(SUMMA);
  end;

Function IsColedgPodr(nserv:integer):boolean;
  begin
       IsColedgPodr:=false;
       if (Nomer_Serv(nserv)>=151) and (Nomer_Serv(nserv)<=168) then IsColedgPodr:=true;
       if Nomer_Serv(nserv)=165 then IsColedgPodr:=False;
  end;
Function IsGKHPodr(nserv:integer):boolean;
  const
      amntofpodr=10;
      GKHPodr:array[1..amntofpodr] of Integer=(81,82,191,192,193,194,195,196,197,198);
  var
      i:Integer;
  begin
       IsGKHPodr:=false;
       for i:=1 to amntofpodr do
           if Nomer_Serv(nserv)=GKHPodr[i] then
              begin
                   IsGKHPodr:=true;
                   break;
              end
  end;
Function IsIskraPodr(nserv:integer):boolean;
  begin
       IsIskraPodr:=false;
       if (Nomer_Serv(nserv)=179)
       or (Nomer_Serv(nserv)=180) then
          IsIskraPodr:=true;
  end;

FUNCTION IS_NOTFOND5(CURR_PERSON:PERSON_PTR):BOOLEAN;
   VAR
       CURR_CN:CN_PTR;
       FOUND:BOOLEAN;
   BEGIN
       FOUND:=FALSE;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) AND(NOT FOUND) DO
             IF CURR_CN^.SHIFR=NotNeedPensProcSHIFR+LIMIT_CN_BASE THEN FOUND:=TRUE
                                                               ELSE CURR_CN:=CURR_CN^.NEXT;
       IS_NotFOND5:=FOUND;
   END;

FUNCTION IS_FOND5(CURR_PERSON:PERSON_PTR):BOOLEAN;
   VAR
       CURR_CN:CN_PTR;
       FOUND:BOOLEAN;
   BEGIN
       FOUND:=FALSE;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) AND(NOT FOUND) DO
             IF CURR_CN^.SHIFR=NeedPensProcSHIFR+LIMIT_CN_BASE THEN FOUND:=TRUE
                                                               ELSE CURR_CN:=CURR_CN^.NEXT;
       IS_FOND5:=FOUND;
   END;

 PROCEDURE  MAKE_FOND5(CURR_PERSON:PERSON_PTR);
   VAR
       CURR_CN:CN_PTR;
   BEGIN
       IF IS_FOND5(CURR_PERSON) THEN EXIT;
       MAKE_CN(CURR_CN,CURR_PERSON);
       CURR_CN^.SHIFR:=NeedPensProcSHIFR+LIMIT_CN_BASE;
       CURR_CN^.KOD:=100;
   END;
 PROCEDURE  MAKE_NOTFOND5(CURR_PERSON:PERSON_PTR);
   VAR
       CURR_CN:CN_PTR;
   BEGIN
       IF IS_NOTFOND5(CURR_PERSON) THEN EXIT;
       MAKE_CN(CURR_CN,CURR_PERSON);
       CURR_CN^.SHIFR:=NotNeedPensProcSHIFR+LIMIT_CN_BASE;
       CURR_CN^.KOD:=100;
   END;

 function  IsNetLgotyPN(CURR_PERSON:PERSON_PTR):BOOLEAN;
   VAR
       CURR_CN : CN_PTR;
       RETVAL  : BOOLEAN;
   BEGIN
       RETVAL:=FALSE;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) DO
        BEGIN
             IF ((CURR_CN^.SHIFR=NetLgotyPNShifr) OR (CURR_CN^.SHIFR=NetLgotyPNShifr+LIMIT_CN_BASE)) THEN
                BEGIN
                     RETVAL:=TRUE;
                     BREAK;
                END;
             CURR_CN:=CURR_CN^.NEXT;
        END;
       IsNetLgotyPN := RetVal;
   END;


FUNCTION IS_PENS_PROC_ZAKON(CURR_PERSON:PERSON_PTR):BOOLEAN;
   VAR
       CURR_CN:CN_PTR;
       FOUND:BOOLEAN;
   BEGIN
       FOUND:=FALSE;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) AND(NOT FOUND) DO
             IF CURR_CN^.SHIFR=PENS_PROC_ZAKON_SHIFR+LIMIT_CN_BASE THEN FOUND:=TRUE
                                                           ELSE CURR_CN:=CURR_CN^.NEXT;
       IS_PENS_PROC_ZAKON:=FOUND;
   END;

(*
FUNCTION GetProcPensNalog(CURR_PERSON:PERSON_PTR;Summa:Real;var PensNalog:real;Start_Month:integer):REAL;
  VAR CURR_CN   : CN_PTR;
      DONE      : INTEGER;
      NeedTable : boolean;
      p         : real;
      Procent,Low,AddS:Real;
  BEGIN
      if Curr_Pens_Month<>Start_Month then
         if not FILL_PENS(START_MONTH) then
            ERROR('Нет данных по пенсионному налогу за '+IntToStr(Start_Month));


      PensNalog:=0;
      p:=0.02;
      NeedTable:=false;
      if (GetOsnKateg(Curr_Person)=TEACHER_KATEGORIJA) and
{      if (Curr_Person^.Kategorija=TEACHER_KATEGORIJA) and}
{         (Nomer_Serv(Nsrv)<150) and {УБРАТЬ ТЕХНИКУМ}}
         (not IsColedgPodr(Nsrv)) and {УБРАТЬ ТЕХНИКУМ}
         (not IS_NotFond5(Curr_Person)) then NeedTable:=true
                                               else
      if Is_Fond5(Curr_Person) then NeedTable:=true;
      if Not NeedTable then
         begin
              IF ABS(Summa)<150 THEN
                IF IS_PENS_PROC_ZAKON(CURR_PERSON) THEN P:=0.01;
         end
                       else
         begin
              Procent := PensList.Procent(Summa);
              Low     := PensList.Low(Summa);
              AddS    := PensList.Adds(Summa);
              PensNalog:=Procent*(Summa-Low)+AddS;
{              PensNalog:=PensList.Procent(Summa)*(Summa-PensList.Low(Summa))+PensList.AddS(Summa);}
              P:=PensList.Procent(Summa);
         end;

      GetProcPensNalog:=p;
  END;
*)

FUNCTION GetProcPensNalog(CURR_PERSON:PERSON_PTR;Summa:Real;var PensNalog:real;START_MONTH:INTEGER;START_YEAR:INTEGER):REAL;
  VAR CURR_CN   : CN_PTR;
      DONE      : INTEGER;
      NeedTable : boolean;
      p         : real;
      Procent,Low,AddS:Real;
  BEGIN
       if Curr_Pens_Month<>Start_Month then
          if not FILL_PENS(START_MONTH) then
            ERROR('Нет данных по пенсионному налогу за '+IntToStr(Start_Month));

      PensNalog := 0    ;
      p         := 0.02 ;
      NeedTable := false;
      if (GetOsnKateg(Curr_Person)=TEACHER_KATEGORIJA) and
{      if (Curr_Person^.Kategorija=TEACHER_KATEGORIJA) and}
//         (Nomer_Serv(Nsrv)<150) and {УБРАТЬ ТЕХНИКУМ}
         (not IsColedgPodr(Nsrv)) and {УБРАТЬ ТЕХНИКУМ}
         (not IS_NotFond5(Curr_Person)) then NeedTable:=true
                                               else
      if Is_Fond5(Curr_Person) then NeedTable:=true;
      if Not NeedTable then
         begin
              IF IS_PENS_PROC_ZAKON(CURR_PERSON) THEN
                 if Start_Year>2007 then  PensNalog := SUM(SUMMA*0.02)
                 else if Start_Month=2007 then
                      begin
                           IF Summa<=GET_PROG_MIN(START_YEAR,START_MONTH) THEN
                              BEGIN
                                   PensNalog := SUM(SUMMA*0.005);
                                   P := 0.005;
                              END
                           ELSE
                              BEGIN
                                   PensNalog := SUM((SUMMA-GET_PROG_MIN(START_YEAR,START_MONTH))*0.02+GET_PROG_MIN(START_YEAR,START_MONTH)*0.005);
                                   P := 0.02;
                              END
                      end

                 ELSE      { ПО СТАРОМУ ЗА 2006 ГОД }
                     IF ABS(Summa)<150 THEN
                        IF IS_PENS_PROC_ZAKON(CURR_PERSON) THEN P:=0.01;
{
              IF ABS(Summa)<150 THEN
                IF IS_PENS_PROC_ZAKON(CURR_PERSON) THEN P:=0.01;
}
         end
                       else
         begin
(*
              PensItem:=PPensItem(PensList^.FirstThat(@Match));
              if PensItem<>Nil then
                 begin
{                      PensNalog:=SUM(PensItem^.Procent*(Summa-PensItem^.Low)+PensItem^.Add);}
                      PensNalog:=SUM(PensItem^.Procent*Summa);
                      P:=PensItem^.Procent;
                 end;
*)
              Procent := PensList.Procent(Summa);
              Low     := PensList.Low(Summa);
              AddS    := PensList.Adds(Summa);
{              PensNalog:=Procent*(Summa-Low)+AddS;}
              PensNalog:=Sum(Procent*Summa);
{              PensNalog:=PensList.Procent(Summa)*(Summa-PensList.Low(Summa))+PensList.AddS(Summa);}
              P:=PensList.Procent(Summa);

         end;

      GetProcPensNalog:=p;
  END;

 FUNCTION GetProcECBNalog(CURR_PERSON:PERSON_PTR;Summa:Real;var ECBNalog:real;START_MONTH:INTEGER;
            START_YEAR:INTEGER; var WantedECBShifr:integer):REAL;
  VAR CURR_CN   : CN_PTR;
      DONE      : INTEGER;
      NeedTable : boolean;
      p         : real;
      Y         : integer;
  BEGIN
      WantedECBShifr := ECBShifr;
      ECBNalog := 0;
      GetProcECBNalog := 0.00;
      Y:=START_YEAR;
      if Y<100 then Y:=Y+1990;
      if Y<2010 then
         Exit;
      EcbNalog  := 0    ;
      p         := ECBProc;
      NeedTable := false;
      if (GetOsnKateg(Curr_Person)=TEACHER_KATEGORIJA) and
{      if (Curr_Person^.Kategorija=TEACHER_KATEGORIJA) and}
(*         (Nomer_Serv(Nsrv)<150) and {УБРАТЬ ТЕХНИКУМ}*)
         (not IsColedgPodr(Nsrv)) and {УБРАТЬ ТЕХНИКУМ}
         (not IS_NotFond5(Curr_Person)) then NeedTable:=true
                                               else
      if Is_Fond5(Curr_Person) then NeedTable:=true;
      if Not NeedTable then
         begin
              IF IS_PENS_PROC_ZAKON(CURR_PERSON) THEN
                 if Start_Year>2010 then  ECBNalog := SUM(SUMMA*p);
         end
                       else
         begin
              p:=ECBNProc;
              WantedECBShifr := ECBNShifr;
         end;
{
      if IS_INVALID(CURR_PERSON) then
         begin
              p:=ECBInvProc;
              WantedECBShifr := ECBInvShifr;
         end;
}

      GetProcEcbNalog:=p;
  END;


 function GetSummaNachForPodohInCn(Curr_Person:Person_Ptr;WantedPeriod:word):real;
  var RetVal:real;
      Curr_Cn:Cn_Ptr;
  begin
      GetSummaNachForPodohInCn:=0;
      Exit;
      RetVal:=0;
      Curr_Cn:=Curr_Person^.Cn;
      while (Curr_Cn<>Nil) do
       begin
            if Curr_Cn^.Shifr>Limit_Cn_Base             then
            if Curr_Cn^.Shifr<Limit_Cn_Base+Total_Add_Shifr then
            if Curr_Cn^.Kod=100                         then
            if Curr_Cn^.Prim=WantedPeriod               then
            if ShifrList.IsPodoh(Curr_Cn^.Shifr-Limit_Cn_Base)    then
               begin
                    RetVal:=RetVal+Curr_Cn^.Summa;
               end;
            Curr_Cn:=Curr_Cn^.Next;
       end;
   GetSummaNachForPodohInCn:=RetVal;
  end;
 function GetSummaPodohInCn(Curr_Person:Person_Ptr;WantedPeriod:word):real;
  var RetVal:real;
      Curr_Cn:Cn_Ptr;
  begin
      GetSummaPodohInCn:=0;
      Exit;
      RetVal:=0;
      Curr_Cn:=Curr_Person^.Cn;
      while (Curr_Cn<>Nil) do
       begin
            if Curr_Cn^.Shifr>Limit_Cn_Base+Total_Add_Shifr then
            if Curr_Cn^.Kod=100                         then
            if Curr_Cn^.Prim=WantedPeriod               then
            if Curr_Cn^.Shifr-Limit_Cn_Base=Podoh_Shifr then
               begin
                    RetVal:=RetVal+Curr_Cn^.Summa;
               end;
            Curr_Cn:=Curr_Cn^.Next;
       end;
   GetSummaPodohInCn:=RetVal;
  end;
 FUNCTION GetProcECBNalogDirect(CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER;
            START_YEAR:INTEGER; var WantedECBShifr:integer;WantedPodr:integer=0):REAL;
  VAR CURR_CN   : CN_PTR;
      DONE      : INTEGER;
      NeedTable : boolean;
      p         : real;
      Y         : integer;
  BEGIN
      if WantedPodr=0 then
         WantedPodr:=NSRV;
      WantedECBShifr := ECBShifr;
      GetProcECBNalogDirect := 0.00;
      Y:=START_YEAR;
      if Y<100 then Y:=Y+1990;
      if Y<2010 then
         Exit;
      p         := ECBProc;
      NeedTable := false;
      if ((Curr_Person^.Kategorija=TEACHER_KATEGORIJA) or
          (Curr_Person^.Kategorija=SCIENTIFIC_WORKER_KATEGORIJA)) and
         (not IsColedgPodr(WantedPodr)) and {УБРАТЬ ТЕХНИКУМ}
         (not IS_NotFond5(Curr_Person)) then NeedTable:=true
                                               else
      if Is_Fond5(Curr_Person) then NeedTable:=true;
      if Is_NotFond5(Curr_Person) then NeedTable:=false;
      if Not NeedTable then
         begin
              p:=ECBProc;
              WantedECBShifr := ECBShifr;
         end
                       else
         begin
              p:=ECBNProc;
              WantedECBShifr := ECBNShifr;
         end;
      GetProcEcbNalogDirect:=p;

  END;



 function GetSummaPensInCn(Curr_Person:Person_Ptr;WantedPeriod:word):real;
  var RetVal:real;
      Curr_Cn:Cn_Ptr;
  begin
      GetSummaPensInCn:=0;
      Exit;
      RetVal:=0;
      Curr_Cn:=Curr_Person^.Cn;
      while (Curr_Cn<>Nil) do
       begin
            if Curr_Cn^.Shifr>Limit_Cn_Base+Total_Add_Shifr then
            if Curr_Cn^.Kod=100                         then
            if Curr_Cn^.Prim=WantedPeriod               then
            if Curr_Cn^.Shifr-Limit_Cn_Base=Pens_Shifr  then
               begin
                    RetVal:=RetVal+Curr_Cn^.Summa;
               end;
            Curr_Cn:=Curr_Cn^.Next;
       end;
   GetSummaPensInCn:=RetVal;
  end;

 function IsOtpShifr(I:Integer):boolean;
  begin

       if (i=HOLIDAY_FLOW_SHIFR)     or
          (i=HOLIDAY_FUTURE_SHIFR)   or
          (i=UCH_OTP_SHIFR)          or
        //  (i=20)                     or //Помощь к отпуску
          (i=UCH_OTP_PASS_PRD_SHIFR) or
          (i=CHERNOBOTPSHIFR) or
          (i=DopOtpForChildrenShifr) then IsOtpShifr:=true
                                     else IsOtpShifr:=false;
  end;
 function IsBolnShifr(I:Integer):boolean;
  begin

       if (i=BOL_TEK_SHIFR) or
          (i=BOL_PROSHL_SHIFR) or
        //  (i=BOL_FUTURE_SHIFR) or
          (i=BOL_5_SHIFR) or
          (i=DEKRET_SHIFR) then IsBolnShifr:=true
                           else IsBolnShifr:=false;
  end;
 function IsBolnShifrForECB(I:Integer):boolean;
  begin

       if (i=BOL_TEK_SHIFR) or
          (i=BOL_PROSHL_SHIFR) or
        //  (i=BOL_FUTURE_SHIFR) or
          (i=BOL_5_SHIFR) or
          (i=DEKRET_SHIFR)   // 07 05 2020 декретные входят в Т6 (Деревянкина)
          then IsBolnShifrForECB:=true
                           else IsBolnShifrForECB:=false;
  end;

 function IsBolnShifrLera(I:Integer):boolean;
  begin

       if (i=BOL_TEK_SHIFR) or
          (i=BOL_PROSHL_SHIFR) or
          (i=BOL_FUTURE_SHIFR) or
          (i=BOL_5_SHIFR) or
          (i=DEKRET_SHIFR) then IsBolnShifrLera:=true
                           else IsBolnShifrLera:=false;
  end;

 function IsOtherPeriodECBShifr(I:Integer):boolean;
  begin
       if (isLNR) or (CURRYEAR<2016) then
           IsOtherPeriodECBShifr:=False
       else

       if (i=BOL_TEK_SHIFR)          or
          (i=BOL_PROSHL_SHIFR)       or
        //  (i=BOL_FUTURE_SHIFR) or
          (i=BOL_5_SHIFR)            or
          (i=DEKRET_SHIFR)           or
          (i=HOLIDAY_FLOW_SHIFR)     or
          (i=HOLIDAY_FUTURE_SHIFR)   or
          (i=UCH_OTP_SHIFR)          or
    //      (i=NOT_USE_HOLIDAY_SHIFR)  or
      //    (i=20)                     or //Помощь к отпуску
          (i=UCH_OTP_PASS_PRD_SHIFR) or
          (i=CHERNOBOTPSHIFR)        or
          (i=DopOtpForChildrenShifr) or
          (i=PerersZaProshlPeriody)  or
          (i=DogPodShifr)            or
          (i=index_shifr)            or
          (i=NOT_USE_HOLIDAY_SHIFR)  then IsOtherPeriodECBShifr:=true
                                     else IsOtherPeriodECBShifr:=false;

  end;
 function IsOtherPeriodECBShifrLNRForSwodGtLimit(I:Integer):boolean;
  begin
       if isSVDN then
           IsOtherPeriodECBShifrLNRForSwodGtLimit:=False
       else

       if (i=BOL_TEK_SHIFR)          or
          (i=BOL_PROSHL_SHIFR)       or
        //  (i=BOL_FUTURE_SHIFR) or
          (i=BOL_5_SHIFR)            or
          (i=DEKRET_SHIFR)           or
          (i=HOLIDAY_FLOW_SHIFR)     or
          (i=HOLIDAY_FUTURE_SHIFR)   or
          (i=UCH_OTP_SHIFR)          or
    //      (i=NOT_USE_HOLIDAY_SHIFR)  or
      //    (i=20)                     or //Помощь к отпуску
          (i=UCH_OTP_PASS_PRD_SHIFR) or
          (i=CHERNOBOTPSHIFR)        or
          (i=DopOtpForChildrenShifr) or
          (i=PerersZaProshlPeriody)  or
          (i=DogPodShifr)            or
          (i=index_shifr)            or
          (i=NOT_USE_HOLIDAY_SHIFR)  then IsOtherPeriodECBShifrLNRForSwodGtLimit:=true
                                     else IsOtherPeriodECBShifrLNRForSwodGtLimit:=false;

  end;
   function  IsOtherPeriodForMinSal(I:Integer):boolean;
  begin
       if (isLNR) or (CURRYEAR<2016) then
           IsOtherPeriodForMinSal:=False
       else

       if (i=BOL_TEK_SHIFR)          or
          (i=BOL_PROSHL_SHIFR)       or
        //  (i=BOL_FUTURE_SHIFR) or
          (i=BOL_5_SHIFR)            or
          (i=DEKRET_SHIFR)           or
          (i=HOLIDAY_FLOW_SHIFR)     or
          (i=HOLIDAY_FUTURE_SHIFR)   or
          (i=UCH_OTP_SHIFR)          or
    //      (i=NOT_USE_HOLIDAY_SHIFR)  or
      //    (i=20)                     or //Помощь к отпуску
          (i=UCH_OTP_PASS_PRD_SHIFR) or
          (i=CHERNOBOTPSHIFR)        or
          (i=DopOtpForChildrenShifr) or
          (i=index_shifr)            or
          (i=NOT_USE_HOLIDAY_SHIFR)  then IsOtherPeriodForMinSal:=true
                                     else IsOtherPeriodForMinSal:=false;

  end;

 function IsOtherPeriodECBShifrForYear(I:Integer;Y:integer):boolean;
  var yy:Integer;
  begin
       yy:=y;
       if (y>0) and (y<50) then yy:=y+1990;
       IsOtherPeriodECBShifrForYear:=False;
       if Yy>=2016 then
          IsOtherPeriodECBShifrForYear:=IsOtherPeriodECBShifr(I);
  end;

 function IsKassaShifr(I:Integer):boolean;
  begin

       if (i=KASSA_SHIFR) THEN IsKassaShifr:=true
                          else IsKassaShifr:=false;
  end;
 function  IsOnHandShifr(I:Integer):boolean;
  var retVal:boolean;
  begin
       retVal:=False;
       if i in [51,52,53,65,67,68,69,70,72,76,77,80,86,87,102,103,104,123,124,125,131,132,133,134,135,136] then
          retVal:=True;
       IsOnHandShifr:=retVal;
  end;

FUNCTION GETNAMEPSBOR(CODE:integer):string;
 begin
       case code of
        1 : Result:='в Луганск';
        2 : Result:='вне Луганска';
        3 : Result:='Касса';
        4 : Result:='Приватбанк';
        5 : Result:='Правексбанк';
        else Result:='Неверно указан';
       end;
 end;
FUNCTION IS_ALIMENTY_SHIFR(SHIFR:integer):BOOLEAN;
 BEGIN
      IF SHIFR IN [ALIMENTY_ABS_SUMMA_SHIFR,
                   ALIMENTY_SHIFR,
                   ALIMENTY_DOLG_SHIFR_S,
                   ALIMENTY_DOLG_SHIFR,
                   PerechPoIspListamShifr] THEN IS_ALIMENTY_SHIFR:=TRUE
                                           ELSE IS_ALIMENTY_SHIFR:=FALSE;
 END;

PROCEDURE SET_UP_FOR_PODOH_SOWM_SEARCH(CURR_PERSON:PERSON_PTR);
 BEGIN
       WITH R DO
        BEGIN
              TABNO            := OTHER;
              FIO              := ANY;
              GRUPPA           := ANY;
              KATEGORIJA       := ANY;
              DOLG             := ANY;
              OKLAD            := ANY;
              WID_RABOTY       := OTHER;
              N_TEMY           := ANY;
              MESTO_OSN_RABOTY := ANY;
              WID_OPLATY       := ANY;
              MODE             := ANY;
              MAIN             := ANY;
        END;
        WITH C DO
         BEGIN
               TABNO      := CURR_PERSON^.TABNO;
               WID_RABOTY := SOWM_WID_RABOTY;
               MAIN       := 1;
         END;
        MUST_FIND_PERSON:=TRUE;       {УСТ ФЛАГ ДЛЯ ПРОГРАММЫ GETINF}
        SEARCH_ONLY_ONE_PERSON:=FALSE;{НАЙТИ ВСЕX ПЕРСОН, УДОВЛЕТВОРЯЮЩИХ УСЛИВИЮ}
 END;

FUNCTION FIND_CN_BASE(CURR_PERSON:PERSON_PTR;
                 WANTED_SHIFR:INTEGER;
                 WANTED_MONTH:INTEGER):CN_PTR;
  VAR
      CURR_CN,CURR_CNC:CN_PTR;
      I_C,I:INTEGER;
      FOUND:BOOLEAN;
  BEGIN
       CURR_CNC:=NIL;
       curr_cn:=CURR_PERSON^.CN;
       while (curr_cn<>nil) do
         begin
               IF CURR_CN^.SHIFR = WANTED_SHIFR+LIMIT_CN_BASE THEN
               IF CURR_CN^.PRIM  = WANTED_MONTH THEN
                  begin
                       CURR_CNC:=CURR_CN;
                       break;
                  end;
               curr_cn:=curr_cn^.Next;
         end;

       FIND_CN_BASE:=CURR_CNC;
  END;

function GET_PROCENT_POCHTOW_SBOR(SUMMA:REAL;MODE:INTEGER;VAR CODE_PROC:REAL):REAL;
 var RetVal:real;
 begin
      CODE_PROC:=0;
      RetVal:=0;
      if mode=2 then RetVal:=8.76      { Россия (вне Луганска) }
                else
      if mode=1 then                   { Луганск               }
         if Summa<=17  then begin RetVal:=0; Code_Proc:=0.9; end
                       else
         if Summa<=300 then RetVal:=4.8
                       else RetVal:=4.2;
      GET_PROCENT_POCHTOW_SBOR:=RetVal;
 end;

FUNCTION GET_ALIMENTY_MODE(ALABEL:WORD):BYTE;
 VAR  I,J:INTEGER;
 BEGIN
      J:=ALABEL AND $F800;
      I:=J SHR 12;
      GET_ALIMENTY_MODE:=I;
 END;
FUNCTION IS_TEST_DEKRET(CURR_PERSON:PERSON_PTR):BOOLEAN;
  VAR I,J,K:INTEGER;
      CURR_ADD:ADD_PTR;
      FLAG:BOOLEAN;
  BEGIN
       IF CURR_PERSON^.STATE=PERSON_DEKRET_STATE THEN FLAG:=TRUE
                                                 ELSE FLAG:=FALSE;
        IS_TEST_DEKRET:=FLAG;
  END;
 FUNCTION SUM_VYPLACHENO_UD(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):REAL;
  VAR
      SUMMA:REAL;
//      I,I_U:INTEGER;
      CURR_UD:UD_PTR;
  BEGIN
       SUMMA:=0;
       curr_ud:=curr_person^.UD;
       while (curr_ud<>nil) do
        begin
             IF CURR_UD^.SHIFR=WANTED_SHIFR THEN
             IF CURR_UD^.VYPLACHENO=GET_OUT THEN
             IF CURR_UD^.PERIOD=START_MONTH THEN
                 SUMMA:=SUMMA+CURR_UD^.SUMMA;
             curr_ud:=curr_ud^.NEXT;
        end;
{
       I_U:=COUNT_UD(CURR_PERSON);
       IF I_U>0 THEN FOR I:=1 TO I_U DO
          BEGIN
               IF I=1 THEN CURR_UD:=CURR_PERSON^.UD
                       ELSE CURR_UD:=CURR_UD^.NEXT;
               IF CURR_UD^.SHIFR=WANTED_SHIFR THEN
               IF CURR_UD^.VYPLACHENO=GET_OUT THEN
               IF CURR_UD^.PERIOD=START_MONTH THEN
                  SUMMA:=SUMMA+CURR_UD^.SUMMA;
          END;
}
       SUM_VYPLACHENO_UD:=SUMMA;
  END;
 FUNCTION SUM_VYPLACHENO_ADD(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):REAL;
  VAR
      SUMMA:REAL;
//      I,I_A:INTEGER;
      CURR_ADD:ADD_PTR;
  BEGIN
       SUMMA:=0;
       curr_add:=curr_person^.add;
       while (curr_add<>nil) do
        begin
             IF CURR_adD^.SHIFR=WANTED_SHIFR THEN
             IF CURR_adD^.VYPLACHENO=GET_OUT THEN
             IF CURR_adD^.PERIOD=START_MONTH THEN
                 SUMMA:=SUMMA+CURR_adD^.SUMMA;
             curr_add:=curr_add^.NEXT;
        end;
{
       I_A:=COUNT_ADD(CURR_PERSON);
       IF I_A>0 THEN FOR I:=1 TO I_A DO
          BEGIN
               IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                       ELSE CURR_ADD:=CURR_ADD^.NEXT;
               IF CURR_ADD^.SHIFR=WANTED_SHIFR THEN
               IF CURR_ADD^.VYPLACHENO=GET_OUT THEN
               IF CURR_ADD^.PERIOD=START_MONTH THEN
                  SUMMA:=SUMMA+CURR_ADD^.SUMMA;
          END;
}
       SUM_VYPLACHENO_ADD:=SUMMA;
  END;
 FUNCTION SUM_VYPLACHENO_ADD_ID(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER;ID:WORD):REAL;
  VAR
      SUMMA:REAL;
      CURR_ADD:ADD_PTR;
      CURR_CNC:CN_PTR;
  BEGIN
       SUMMA:=0;
       CURR_ADD:=CURR_PERSON^.ADD;
       WHILE (CURR_ADD<>NIL) DO
         BEGIN
               IF CURR_ADD^.SHIFR=WANTED_SHIFR THEN
               IF CURR_ADD^.VYPLACHENO=GET_OUT THEN
               IF CURR_ADD^.PERIOD=START_MONTH THEN
               IF CURR_ADD^.WHO=ID THEN
                  SUMMA:=SUMMA+CURR_ADD^.SUMMA;
              CURR_ADD:=CURR_ADD^.next;
         END;
       CURR_CNC:=FIND_CN_BASE(CURR_PERSON,WANTED_SHIFR,NMES);
       IF CURR_CNC<>NIL THEN SUMMA:=SUMMA+CURR_CNC^.SUMMA;
       IF NMES=1 THEN
       IF SUMMA<0 THEN SUMMA:=0;
       SUM_VYPLACHENO_ADD_ID:=SUMMA;
  END;


    FUNCTION FIND_OLD_DOLG(CURR_PERSON:PERSON_PTR):CN_PTR;
    VAR CURR_CN:CN_PTR;
        FOU:BOOLEAN;
    BEGIN
        FOU := FALSE;
        CURR_CN:=CURR_PERSON^.CN;
        WHILE (CURR_CN<>NIL) AND (NOT FOU) DO
            BEGIN
                 IF CURR_CN^.SHIFR=DOLG_ZA_RABOCHIM_SHIFR+LIMIT_CN_BASE THEN
                    begin
                         FOU:=TRUE;
                         Break;
                    end;
                 Curr_Cn:=Curr_Cn^.Next;
            END;
        IF FOU THEN FIND_OLD_DOLG:=Curr_CN
               ELSE FIND_OLD_DOLG:=NIL;
    END;

  FUNCTION GET_OLD_DOLG(CURR_PERSON:PERSON_PTR):REAL;
   VAR  CURR_CN:CN_PTR;
   BEGIN
        CURR_CN:=FIND_OLD_DOLG(CURR_PERSON);
        IF CURR_CN=NIL THEN GET_OLD_DOLG:=0
                       ELSE GET_OLD_DOLG:=CURR_CN^.SUMMA;
   END;
 FUNCTION getDolPerson(CURR_PERSON:PERSON_PTR):integer;
   VAR  CURR_CN:CN_PTR;
        finded:Boolean;
        retVal:Integer;
   BEGIN
        retVal:=0;
        CURR_CN:=CURR_PERSON^.CN;
        WHILE (CURR_CN<>NIL) DO
            BEGIN
                 IF CURR_CN^.SHIFR=KOD_DOLG_SHIFR+LIMIT_CN_BASE THEN
                    begin
                         retVal:=curr_cn^.prim;
                         Finded:=TRUE;
                         Break;
                    end;
                 Curr_Cn:=Curr_Cn^.Next;
            END;
          getDolPerson:=retVal;
   END;


FUNCTION FORMAT_K(A:REAL;L:INTEGER):STRING;
 CONST R=',';
       M=25;
 VAR S,S1:STRING;
     I:INTEGER;
     {   XX,XXX,XXX,XXX,XXX,XXX.XX }
     {   1 3   7  11  15  19       }
 BEGIN
      STR(A:M:2,S);
{
      IF (ABS(A)>(1E3 -0.01))   THEN BEGIN FOR I:=1 TO 18 DO S[I]:=S[I+1]; S[19]:=R; END;
      IF (ABS(A)>(1E6 -0.01))   THEN BEGIN FOR I:=1 TO 14 DO S[I]:=S[I+1]; S[15]:=R; END;
      IF (ABS(A)>(1E9 -0.01))   THEN BEGIN FOR I:=1 TO 10 DO S[I]:=S[I+1]; S[11] :=R; END;
      IF (ABS(A)>(1E12-0.01))   THEN BEGIN FOR I:=1 TO  6 DO S[I]:=S[I+1]; S[7] :=R; END;
      IF (ABS(A)>(1E15-0.01))   THEN BEGIN FOR I:=1 TO  2 DO S[I]:=S[I+1]; S[3] :=R; END;
      IF L>=M THEN L:=M-1;
{      I:=POS('.',S);
      IF I>0 THEN
         BEGIN
         S1:=S;
         S:=COPY(S,1,I-1)+'-'+COPY(S,I+1,LENGTH(ALLTRIM(S))-I);
         ERROR(MY_STR_REAL(A,2)+' BEFORE S1='+S1+' '+S);
         END;
}      I:=0;
      WHILE (I<BYTE(S[0])) DO
       BEGIN
            INC(I);
            IF S[I]='.' THEN S[I]:='-';
       END;
      FORMAT_K:=COPY(S,M-L+1,L);
 END;

FUNCTION FORMAT_S(B:REAL;L:INTEGER):STRING;
 CONST R=',';
       M=22;
 VAR S:STRING[M];
     I:INTEGER;
     A:REAL;
     {   XX,XXX,XXX,XXX,XXX,XXX }
     {   1 3   7  11  15  19    }
 BEGIN
      A:=B;
      IF FORMAT_MODE=NEW_FORMAT_MODE THEN
         FORMAT_S:=FORMAT_K(A,L)
      ELSE
         BEGIN
              A:=B / 1000;
              STR(A:M:0,S);
              IF (ABS(A)>(1E3 -0.01))   THEN BEGIN FOR I:=1 TO 18 DO S[I]:=S[I+1]; S[19]:=R; END;
              IF (ABS(A)>(1E6 -0.01))   THEN BEGIN FOR I:=1 TO 14 DO S[I]:=S[I+1]; S[15]:=R; END;
              IF (ABS(A)>(1E9 -0.01))   THEN BEGIN FOR I:=1 TO 10 DO S[I]:=S[I+1]; S[11] :=R; END;
              IF (ABS(A)>(1E12-0.01))   THEN BEGIN FOR I:=1 TO  6 DO S[I]:=S[I+1]; S[7] :=R; END;
              IF (ABS(A)>(1E15-0.01))   THEN BEGIN FOR I:=1 TO  2 DO S[I]:=S[I+1]; S[3] :=R; END;
              IF L>=M THEN L:=M-1;
              FORMAT_S:=COPY(S,M-L+1,L);
         END;
 END;

 FUNCTION FORMAT_SE(B:REAL;L:INTEGER):STRING;
 CONST R=',';
       M=22;
 VAR S:STRING[M];
     I:INTEGER;
     A:REAL;
     {   XX,XXX,XXX,XXX,XXX,XXX }
     {   1 3   7  11  15  19    }
 BEGIN
      A:=B;
      IF FORMAT_MODE=NEW_FORMAT_MODE THEN
         IF (ABS(A)<0.01) THEN FORMAT_SE:=SPACE(l)
                          ELSE FORMAT_SE:=FORMAT_K(A,L)
      ELSE
         BEGIN
              A:=B / 1000;
              STR(A:M:0,S);
              IF (ABS(A)>(1E3 -0.01))   THEN BEGIN FOR I:=1 TO 18 DO S[I]:=S[I+1]; S[19]:=R; END;
              IF (ABS(A)>(1E6 -0.01))   THEN BEGIN FOR I:=1 TO 14 DO S[I]:=S[I+1]; S[15]:=R; END;
              IF (ABS(A)>(1E9 -0.01))   THEN BEGIN FOR I:=1 TO 10 DO S[I]:=S[I+1]; S[11] :=R; END;
              IF (ABS(A)>(1E12-0.01))   THEN BEGIN FOR I:=1 TO  6 DO S[I]:=S[I+1]; S[7] :=R; END;
              IF (ABS(A)>(1E15-0.01))   THEN BEGIN FOR I:=1 TO  2 DO S[I]:=S[I+1]; S[3] :=R; END;
              IF L>=M THEN L:=M-1;
              FORMAT_SE:=COPY(S,M-L+1,L);
         END;
 END;

 function  GetRazrjadPerson(CURR_PERSON:PERSON_PTR):INTEGER;
   VAR
       CURR_CN:CN_PTR;
       RETVAL:INTEGER;
   BEGIN
       RETVAL:=0;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) DO
        BEGIN
             IF ((CURR_CN^.SHIFR=RAZRJADSHIFR) OR (CURR_CN^.SHIFR=RAZRJADSHIFR+LIMIT_CN_BASE)) THEN
                BEGIN
                     RETVAL:=CURR_CN^.PRIM;
                     BREAK;
                END;
             CURR_CN:=CURR_CN^.NEXT;
        END;
       GetRazrjadPerson:=RetVal;
   END;

 function  GetPorNomerPerson(CURR_PERSON:PERSON_PTR):INTEGER;
   VAR
       CURR_CN:CN_PTR;
       RETVAL:INTEGER;
   BEGIN
       RETVAL:=0;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) DO
        BEGIN
             IF ((CURR_CN^.SHIFR=PorNomerShifr) OR (CURR_CN^.SHIFR=PorNomerShifr+LIMIT_CN_BASE)) THEN
                BEGIN
                     RETVAL:=CURR_CN^.PRIM;
                     BREAK;
                END;
             CURR_CN:=CURR_CN^.NEXT;
        END;
       GetPorNomerPerson:=RetVal;
   END;

 FUNCTION GetKreditNomerDog(CURR_PERSON:PERSON_PTR):integer;
  var RetVal:integer;
      Curr_Cn:Cn_Ptr;
  begin
      GetKreditNomerDog:=0;
      RetVal:=0;
      Curr_Cn:=Curr_Person^.Cn;
      while (Curr_Cn<>Nil) do
       begin
            if (Curr_Cn^.Shifr=Limit_Cn_Base+Kredit_Shifr) or
               (Curr_Cn^.Shifr=Kredit_Shifr) then
               begin
                    RetVal:=Curr_Cn^.Prim;
                    Break;
               end;
            Curr_Cn:=Curr_Cn^.Next;
       end;
   GetKreditNomerDog:=RetVal;
  end;

 FUNCTION GetKwoDetOdMPN2004(CURR_PERSON:PERSON_PTR):integer;
  var RetVal:integer;
      Curr_Cn:Cn_Ptr;
  begin
      if (CURR_PERSON=nil) then
         begin
              GetKwoDetOdMPN2004:=0;
              Exit;
         end;
      GetKwoDetOdMPN2004:=0;
      RetVal:=0;
      Curr_Cn:=Curr_Person^.Cn;
      while (Curr_Cn<>Nil) do
       begin
            if Curr_Cn^.Shifr=Limit_Cn_Base+KwoDetejOdMateriShifr then
            if Curr_Cn^.Kod=100                         then
               begin
                    RetVal := RetVal + Curr_Cn^.Prim;
                    Break;
               end;
            Curr_Cn:=Curr_Cn^.Next;
       end;
   GetKwoDetOdMPN2004:=RetVal;
  end;
 FUNCTION getSingleMonherForPN2004(CURR_PERSON:PERSON_PTR):Boolean;
  var RetVal:Boolean;
      kd:Integer;
      Curr_Cn:Cn_Ptr;
      Summa:real;
  begin
      getSingleMonherForPN2004:=false;
      if (CURR_PERSON=nil) then
         begin
              Exit;
         end;
      RetVal:=false;
      kd:=0;
      summa:=0;
      Curr_Cn:=Curr_Person^.Cn;
      while (Curr_Cn<>Nil) do
       begin
            if Curr_Cn^.Shifr=Limit_Cn_Base+KwoDetejOdMateriShifr then
            if Curr_Cn^.Kod=100                         then
               begin
                    kd := kd + Curr_Cn^.Prim;
                    summa:= Curr_Cn^.SUMMA;
                    Break;
               end;
            Curr_Cn:=Curr_Cn^.Next;
       end;
      if kd>0 then
         if Abs(Abs(summa)-150.00)<0.01 then
            retVal:=True;
      getSingleMonherForPN2004:=RetVal;
  end;
 function ExistDataIndInCn(Curr_Person:Person_Ptr):Boolean;
  var Curr_Cn:Cn_Ptr;
  begin
      Result:=false;
      Curr_Cn:=Curr_Person^.Cn;
      while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn^.Shifr=ForIndexShifr+Limit_Cn_Base then
                begin
                     Result:=true;
                     break;
                end;
             Curr_Cn:=Curr_Cn^.Next;
        end;
  end;

 function GetBaseMonthYearPerson(Curr_Person:Person_Ptr; var m:integer; var y:integer):boolean;
  var Curr_Cn:Cn_Ptr;
      Finded:boolean;
      c_person:Person_ptr;
  begin
      GetBaseMonthYearPerson:=false;
      m:=nmes;
      y:=CurrYear;
      Curr_Cn:=Curr_Person^.Cn;
      Finded:=false;
      while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn^.Shifr=ForIndexShifr+Limit_Cn_Base then
                begin
                     m:=round(Curr_Cn^.Summa);
                     y:=Curr_Cn^.Prim;
                     GetBaseMonthYearPerson:=true;
                     Finded:=true;
                     break;
                end;
             Curr_Cn:=Curr_Cn^.Next;
        end;
  end;

 function SetBaseMonthYearPerson(Curr_Person:Person_Ptr; m:integer;  y:integer):boolean;
  var Curr_Cn:Cn_Ptr;
      Finded:boolean;
  begin
      SetBaseMonthYearPerson:=false;
      Curr_Cn:=Curr_Person^.Cn;
      Finded:=false;
      while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn^.Shifr=ForIndexShifr+Limit_Cn_Base then
                begin
                     Curr_Cn^.Summa:=m;
                     Curr_Cn^.Prim:=y;
                     SetBaseMonthYearPerson:=true;
                     Finded:=true;
                     break;
                end;
             Curr_Cn:=Curr_Cn^.Next;
        end;
      if not Finded then
         begin
              Make_Cn(Curr_Cn,Curr_Person);
              Curr_Cn^.SHIFR:=ForIndexShifr+Limit_Cn_Base;
              Curr_Cn^.Summa:=m;
              Curr_Cn^.Prim:=y;
              Curr_Cn^.KOD:=100;
              SetBaseMonthYearPerson:=true;
              Finded:=true;
         end;
  end;



 PROCEDURE  SetRazrjadPerson(CURR_PERSON:PERSON_PTR;RAZR:INTEGER);
   VAR
       CURR_CN:CN_PTR;
   BEGIN
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) DO
        BEGIN
             IF ((CURR_CN^.SHIFR=RAZRJADSHIFR) OR (CURR_CN^.SHIFR=RAZRJADSHIFR+LIMIT_CN_BASE)) THEN
                BEGIN
                     DEL_CN(CURR_CN,CURR_PERSON);
                     BREAK;
                END;
             CURR_CN:=CURR_CN^.NEXT;
        END;

       MAKE_CN(CURR_CN,CURR_PERSON);
       CURR_CN^.SHIFR:=RAZRJADSHIFR+LIMIT_CN_BASE;
       CURR_CN^.KOD:=100;
       CURR_CN^.PRIM:=RAZR;
   END;

FUNCTION GET_MEM_PAR(SWODMODE:WORD):BOOLEAN;

 CONST MAX_S=12;
      FN:ARRAY[1..MAX_S] OF STRING[12]=('BUDU.TXT','BUDK.TXT','NEBK.TXT','NEBL.TXT','NEBM802.TXT',
                                        'NEBM811.TXT','NEBD.TXT','CPO.TXT','GN.TXT','NIS.TXT','PREM.TXT','MP.TXT');
 VAR FNAME:STRING;
     DEV:TEXT;
     S,C:STRING;
     SHIFRSPRS:STRING;
     SHIFRSPR,I,J,VALV,L:INTEGER;
 BEGIN
      GET_MEM_PAR:=FALSE;
      IF SWODMODE<1 THEN EXIT;
      IF SWODMODE>MAX_S THEN EXIT;
      FNAME:=CMEM+ALLTRIM(FN[SWODMODE]);
      IF NOT FILEEXIST(FNAME) THEN
         BEGIN
              ERROR('Отсутствует файл '+FNAME);
              EXIT;
         END;
      for i:=1 to max_gruppa     do curr_gruppa[i]     := false;
      for i:=1 to max_kategorija do curr_kategorija[i] := false;
      for i:=1 to max_person     do is_selected[i]     := false;
      ASSIGN(DEV,FNAME);
      RESET(DEV);
      WHILE NOT EOF(DEV) DO
       BEGIN
             READLN(DEV,S);
             S:=ALLTRIM(S);
             I:=POS(' ',S);
             IF I<2 THEN CONTINUE;
             SHIFRSPRS:=COPY(S,1,I-1);
             VAL(SHIFRSPRS,SHIFRSPR,J);
             IF (J<>0) THEN CONTINUE;
             IF SHIFRSPR<1 THEN CONTINUE;
             IF SHIFRSPR>3 THEN CONTINUE;
             DELETE(S,1,I);
             IF LENGTH(S)=0 THEN CONTINUE;
             S:=ALLTRIM(S);
             IF LENGTH(S)=0 THEN CONTINUE;
             C := '' ;
             I := 0  ;
             L := ORD(S[0]);
             FOR I:=1 TO L DO
              BEGIN
                   IF NOT (S[I] IN ['0'..'9']) THEN BREAK;
                   C:=C+S[I];
              END;
             VAL(C,VALV,J);
             if valv>175 then
                valv:=valv;
             IF J<>0 THEN CONTINUE;
             IF SHIFRSPR=1 THEN { Источники финансирования }
                IF (VALV<1) OR (VALV>MAX_GRUPPA) THEN CONTINUE;
             IF SHIFRSPR=2 THEN { Источники подразделение  }
                IF (VALV<1) OR (VALV>180) THEN CONTINUE;
             IF SHIFRSPR=3 THEN { Категории }
                IF (VALV<1) OR (VALV>MAX_KATEGORIJA) THEN CONTINUE;
             IF SHIFRSPR=1 THEN CURR_GRUPPA[VALV]:=TRUE;
             i:=NOMER_SERV(VALV);
             IF SHIFRSPR=2 THEN IS_SELECTED[VALV]:=TRUE;
             IF SHIFRSPR=3 THEN CURR_KATEGORIJA[VALV]:=TRUE;
       END;
      CLOSE(DEV);
      GET_MEM_PAR:=TRUE;
 END;
  procedure MoveBolToPerson(ShifrIdBoln : integer;
                            Gruppa   : integer;
                            Tabno    : integer;
                            ShifrPod : integer;
                            ShifrKat : integer;
                            ShifrGru : integer;
                            ShifrDol : integer;
                            ShifrWR  : integer;
                            ShifrSwmMode : integer;
                            Dolg     : string;
                            NeedAdd  : boolean;
                            CodeMove : integer);   { True нужно переносить начисления больничного False только перерасчет (переносит начисления больничного не надо)}
  type PPeriodRec=^TPeriodRec;
       TPeriodRec=record
                   YearZa  : integer;
                   MonthZa : integer;
                  end;

  var Nsrv_Temp     : integer;
      Curr_Person   : Person_Ptr;
      Finded        : boolean;
      S             : string;
      Curr_Add      : Add_Ptr;
      ShifrSta      : integer;
      YearZa        : integer;
      MonthZa       : integer;
      B_Day         : integer;
      Summa         : real;
      ShifrId       : integer;
      DateFr,DateTo : TDateTime;
      DateB,DateE   : TDateTime;     {Первый и посление дни текущего месяца}
      Y,M,D         : word;
      Updated       : boolean;
      CurrD         : TDateTime;
      DatePS,FieldS : string;
      PeriodRec     : PPeriodRec;
      List          : TList;
      I,J           : integer;
      NewPerson     : Person_Ptr;
      DebugMode     : integer;
  function NeedNewPerson:boolean;
   begin
        Result := false;
        if (ShifrPod = 0) and
         //  (ShifrKat = 0) and
         //  (ShifrGru = 0) and
           (ShifrDol = 0) and
           (ShifrWR  = 0) and
           (ShifrSwmMode = 0) then
           Result := true;
   end;

  procedure CreateNewPerson;
   var W_P:Integer;
   function GetFio:String;
    var RetVal:string;
        Curr_Person:Person_Ptr;
    begin
         RetVal := 'Нет';
         Curr_Person:=Head_Person;
         while Curr_Person<>NIl do
            begin
                 if Curr_Person^.Tabno=Tabno then
                    begin
                          RetVal:=Curr_Person^.FIO;
                          Break;
                    end;
                 Curr_Person:=Curr_Person^.NEXT;
            end;
         GetFio:=RetVal;
    end;
   begin
        Make_Person(NewPerson);
        NewPerson^.FIO              := GetFio;
        NewPerson^.Dolg             := 'Прнс.блн.';
        NewPerson^.TABNO            := TABNO;
        if ShifrGru>0 then
           NewPerson^.GRUPPA        := ShifrGru          { BUJDGET}
        else
           NewPerson^.GRUPPA        := 1;          { BUJDGET}
        if ShifrKat>0 then
           NewPerson^.KATEGORIJA    := ShifrKat          { PREPOD}
        else
           NewPerson^.KATEGORIJA    := 1;          { PREPOD}
        NewPerson^.WID_RABOTY       := 2;          { OSN}
        NewPerson^.N_TEMY           := 'Перенос.';
        NewPerson^.MESTO_OSN_RABOTY := SHIFR_SERV(NSRV);
        NewPerson^.FROM             := SHIFR_SERV(NSRV);               {OTKUDA PRIBYL}
        W_P                         := NewPerson^.MESTO_OSN_RABOTY;
        NewPerson^.Bank             := 1; { Приват банк }
        NewPerson^.Nal_Code         := GetNal_CodePerson(Tabno);
        if CodeMove=6 then
           Make_Dol_Person(NewPerson,1500);
        SetUpSowm(Tabno,W_P);
        if CodeMove=6 then
        case Gruppa of
         2 : begin
                  NewPerson^.GRUPPA := 11;  // 211 / 4
                  if ((NSRV>=150) and (NSRV<169)) then
                     NewPerson^.GRUPPA := 25;
             end;
         3 : NewPerson^.GRUPPA := 3;   // ГН
         4 : NewPerson^.GRUPPA := 2;   // НИС
         else
             NewPerson^.GRUPPA := 1;
        end;
        MakeGUID(NewPerson);

 (*  Изменения от 16 04 2011
     добавить льготі ПН в F4 *)
        MakeLgotyPNInCN(NewPerson);



   end;

  begin
       { 0. Создать нового сотрудника, если нужно      }

       NewPerson := Nil;
       if NeedNewPerson then
          begin
               if Not NeedAdd then Exit;     // Если только табель то выйти
               CreateNewPerson;
          end;

       { 1. Прочитать другое подразделение, если нужно }
       Nsrv_Temp:=Nsrv;
       if (not Assigned(NewPerson)) and (ShifrPod>0) then        // Для нового сотрудника не проверять
       if ShifrPod<>NSRV then
          begin
               PutInf;
               EMPTY_ALL_PERSON;
               Nsrv:=ShifrPod;
               MKFLNM;
               GETINF(TRUE);
          end;

       { 2. Найти сотрудника  }
       DateB       := EncodeDate(CurrYear,NMES,1);
       DateE       := EncodeDate(CurrYear,NMES,LenMonth(DateB));
       Finded      := false;
       if Assigned(NewPerson) then
          begin
                Finded      := true;
                Curr_Person := NewPerson;
          end;
       if Not Finded then
          begin
               Curr_Person := HEAD_PERSON;
               while (Curr_Person<>Nil) do
                 begin
                      if Curr_Person^.Tabno         = Tabno    then
                      if Curr_Person^.Gruppa        = ShifrGru then
                      if Curr_Person^.Kategorija    = ShifrKat then
                      if Get_Dol_Code(Curr_Person)  = ShifrDol then
                      if AllTrim(Curr_Person^.Dolg) = AllTrim(Dolg) then
                      if GET_SWM_MODE_PERSON(Curr_Person) = ShifrSwmMode then
//              if Curr_Person^.Wid_Raboty    = ShifrWR then
                      if ((IS_OSN_WID_RABOTY(Curr_Person) and  (ShifrWR=1)) or
                          (Not IS_OSN_WID_RABOTY(Curr_Person) and  (ShifrWR=2))) then
                           begin
                                Finded:=true;
                                Break;
                           end;
                      Curr_Person:=Curr_Person^.Next;
                 end;
          end;
       { Выйти если сотрудник не найден }
       if not finded then
          begin
               { Восстановить текущее подразделение }
               if ShifrPod<>Nsrv_Temp then
                   begin
                         LDel_Person;
                         Nsrv:=Nsrv_Temp;
                         MKFLNM;
                         GETINF(TRUE);
                   end;
               Exit
          end;
         List:=TList.Create;
         Updated := false;
         S:= 'select ShifrSta,summa_b_bud, summa_b_vne, summa_b_gn, summa_b_nis,'+
             ' Year_Za,Month_Za,a.b_day,b.ShifrId,b.f_data,b.l_data' +
             ' from boln_res a join boln b on a.ShifrIdBoln=b.ShifrId' +
             ' where b.ShifrId=' + IntToStr(ShifrIDBoln);
         if CodeMove=5 then
            s:=s+' and a.shifrsta=12'
         else if CodeMove=6 then
            s:=s+' and a.shifrsta<>12';
         if not FIB.pFIBQuery.Transaction.Active then
            FIB.pFIBQuery.Transaction.StartTransaction;

         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(S);
         try
            FormWait.Show;
            Application.ProcessMessages;
            FIB.pFIBQuery.ExecQuery;
            FormWait.Hide;
            DateFr:=date;
            DateTo:=date;
            ShifrSta:=1;
            while not FIB.pFIBQuery.Eof do
             begin
                  ShifrSta := FIB.pFIBQuery.Fields[0].AsInteger;
                  YearZa   := FIB.pFIBQuery.Fields[5].AsInteger;
                  MonthZa  := FIB.pFIBQuery.Fields[6].AsInteger;
                  B_Day    := FIB.pFIBQuery.Fields[7].AsInteger;
                  Summa    := FIB.pFIBQuery.Fields[gruppa].AsFloat;  //Gruppa
                  ShifrId  := FIB.pFIBQuery.Fields[8].AsInteger;
                  DateFr   := FIB.pFIBQuery.Fields[9].AsDate;
                  DateTo   := FIB.pFIBQuery.Fields[10].AsDate;
                  DecodeDate(DateFr,Y,M,D);
                  DecodeDate(DateTo,Y,M,D);

                  { Изменение от 17 05 2009 }
                  { занести в список для Изменение от 17 05 2009 }
{ ======================================================= }
                   Finded:=false;
                   for i:=0 to List.Count-1 do
                       if (PPeriodRec(List.Items[i])^.YearZa  = YearZa) and
                          (PPeriodRec(List.Items[i])^.MonthZa = MonthZa) then
                          begin
                                Finded:=true;
                                break;
                          end;
                   if not Finded then
                      if (YearZa<>CurrYear) or (MonthZa<>NMES) then
                         begin
                              New(PeriodRec);
                              PeriodRec.YearZa  := YearZa;
                              PeriodRec.MonthZa := MonthZa;
                              List.Add(PeriodRec);
                         end;
{ ======================================================= }
                  { Конец изменений от 17 05 2009 }




                  if abs(Summa)>0.009  then
                     begin
                          if NeedAdd then
                             begin
                                   Make_Add(Curr_Add,Curr_Person);
                                   Curr_Add^.Shifr    := ShifrSta;
                                   Curr_Add^.Period   := MonthZa;
                                   Curr_Add^.Year     := YearZa-1990;
                                   Curr_Add^.Summa    := Summa;
                                   if Curr_Add^.Shifr=Komandirowki_Shifr then
                                      Curr_Add^.FZP   := Summa
                                   else
                                   if Curr_Add^.Shifr=bol_5_Shifr then
                                       if isLNR then
                                          Curr_Add^.FZP   := Summa
                                       else
                                          Curr_Add^.FMP   := Summa
                                   else
                                      Curr_Add^.Other := Summa;
                                   Curr_Add^.Work_Day := B_Day;
                                   Curr_Add^.Who      := ShifrId mod 60000;
                                   Updated := true;
                             end;
{
                          Finded:=false;
                          for i:=0 to List.Count-1 do
                              if (PPeriodRec(List.Items[i])^.YearZa  = YearZa) and
                                 (PPeriodRec(List.Items[i])^.MonthZa = MonthZa) then
                                  begin
                                       Finded:=true;
                                       break;
                                  end;
                          if not Finded then
                          if (YearZa<>CurrYear) or (MonthZa<>NMES) then
                             begin
                                   New(PeriodRec);
                                   PeriodRec.YearZa  := YearZa;
                                   PeriodRec.MonthZa := MonthZa;
                                   List.Add(PeriodRec);
                             end;
}
                     end;
                  FIB.pFIBQuery.Next;
             end;
            FIB.pFIBQuery.Close;
         except
            else
            MessageDlg('Ошибка SQL запроса',mtInformation, [mbOk], 0);
            Exit;
         end;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       if Assigned(Curr_Person) then
       if NeedCorrectBolnTabel(DateB,DateE,DateFr,DateTo) then
          begin
               if ShifrSta=Komandirowki_shifr then
                   Make_Kmd_Tabel(Curr_Person,DateFr,DateTo)
               else
                   Make_Ill_Tabel(Curr_Person,DateFr,DateTo);
               if IsShifrInAddPerson(Curr_Person,138) then
                   ShifrSta:=ShifrSta;
               Calc_Naud_Person(Curr_Person,31);
               if IsShifrInAddPerson(Curr_Person,138) then
                   ShifrSta:=ShifrSta;
{
               Curr_Person^.HOLIDAY[1,1,1]:=DayOf(DateFr);
               Curr_Person^.HOLIDAY[1,1,2]:=MonthOf(DateFr);
               Curr_Person^.HOLIDAY[1,1,3]:=YearOf(DateFr) - 1900;
               Curr_Person^.HOLIDAY[1,2,1]:=DayOf(DateFr);
               Curr_Person^.HOLIDAY[1,2,2]:=MonthOf(DateFr);
               Curr_Person^.HOLIDAY[1,2,3]:=YearOf(DateFr) - 1900;
}
          end;
       for i:=1 to List.Count do
           begin
                j:=i;
          //      ShowMessage('y='+IntToStr(PPeriodRec(List.Items[i-1])^.YearZa)+' m='+IntToStr(PPeriodRec(List.Items[i-1])^.MonthZa));
                DebugMode:=0;
                if (trim(Curr_Person^.Dolg)='до 31.01.11') then
//                  begin
                    DebugMode:=1;
                    if Curr_Person^.AUTOMATIC=AUTOMATIC_MODE then
                       begin
                            Recalc_Person_Sql(Curr_Person,PPeriodRec(List.Items[i-1])^.YearZa,PPeriodRec(List.Items[i-1])^.MonthZa,DebugMode);
                            if PPeriodRec(List.Items[i-1])^.MonthZa=NMES then
                               Calc_Naud_Person(Curr_Person,31)
                                                 else
                               begin
                                    FLAG_NAUD_FOR_OTHER_MONTH:=true;
                                    Update_Podoh(Curr_Person,PPeriodRec(List.Items[i-1])^.MonthZa,PPeriodRec(List.Items[i-1])^.YearZa-1990);
                                    FLAG_NAUD_FOR_OTHER_MONTH:=false;
                               end
                       end;
//                  end;
           end;
     { Пометить больничный как перенесеный }
       for i:=0 to List.Count-1 do
           Dispose(PPeriodRec(List.Items[i]));
       List.Free;

       if (Updated) and (NeedAdd) then
          begin
               CurrD  := Date;
               DeCodeDate(CurrD,Y,M,D);
               DatePS := IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
               if CodeMove<>6 then
                  FieldS := 'DATA_P_BUD'
               else
                  FieldS := 'DATA_P_VNE';
{
               case Gruppa of
                    2: FieldS:='DATA_P_VNE';
                    3: FieldS:='DATA_P_GN';
                    4: FieldS:='DATA_P_NIS';
                    else
                       FieldS:='DATA_P_BUD';
               end;
}
               S:= 'update boln set '+FieldS+'='''+DatePS+'''';
               S:=S+' where shifrid='+IntToStr(ShifrIdBoln);
               if not FIB.pFIBQuery.Transaction.Active then
                  FIB.pFIBQuery.Transaction.StartTransaction;
               FIB.pFIBQuery.SQL.Clear;
               FIB.pFIBQuery.SQL.Add(S);
               try
                  FormWait.Show;
                  Application.ProcessMessages;
                  FIB.pFIBQuery.ExecQuery;
                  FormWait.Hide;
                  FIB.pFIBQuery.Close;
              except
                   ShowMessage('Ошибка записи даты переноса');
               end;
          end;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;

       if ShifrPod<>NSRV_Temp then
          begin
               PutInf;
               EMPTY_ALL_PERSON;
               Nsrv:=NSRV_TEMP;
               MKFLNM;
               GETINF(TRUE);
          end;

  end;



//+++++++++++++++++++++++
  procedure MoveKmdToPerson(ShifrIdKmd : integer;
                            Gruppa   : integer;
                            Tabno    : integer;
                            ShifrPod : integer;
                            ShifrKat : integer;
                            ShifrGru : integer;
                            ShifrDol : integer;
                            ShifrWR  : integer;
                            ShifrSwmMode : integer;
                            Dolg     : string;
                            NeedAdd  : boolean);
  type PPeriodRec=^TPeriodRec;
       TPeriodRec=record
                   YearZa  : integer;
                   MonthZa : integer;
                  end;

  var Nsrv_Temp     : integer;
      Curr_Person   : Person_Ptr;
      Finded        : boolean;
      S             : string;
      Curr_Add      : Add_Ptr;
      ShifrSta      : integer;
      YearZa        : integer;
      MonthZa       : integer;
      K_Day         : integer;
      Summa         : real;
      ShifrId       : integer;
      DateFr,DateTo : TDateTime;
      DateB,DateE   : TDateTime;     {Первый и посление дни текущего месяца}
      Y,M,D         : word;
      Updated       : boolean;
      CurrD         : TDateTime;
      DatePS,FieldS : string;
      PeriodRec     : PPeriodRec;
      List          : TList;
      I,J           : integer;
      DebugMode     : integer;


  begin
       { 0. Создать нового сотрудника, если нужно      }
       if ShifrPod<1 then Exit;

       { 1. Прочитать другое подразделение, если нужно }
       Nsrv_Temp:=Nsrv;
       if (ShifrPod>0) then        // Для нового сотрудника не проверять
       if ShifrPod<>NSRV then
          begin
               PutInf;
               EMPTY_ALL_PERSON;
               Nsrv:=ShifrPod;
               MKFLNM;
               GETINF(TRUE);
          end;

       { 2. Найти сотрудника  }
       DateB       := EncodeDate(CurrYear,NMES,1);
       DateE       := EncodeDate(CurrYear,NMES,LenMonth(DateB));
       Finded      := false;
       if Not Finded then
          begin
               Curr_Person := HEAD_PERSON;
               while (Curr_Person<>Nil) do
                 begin
                      if Curr_Person^.Tabno         = Tabno    then
                      if Curr_Person^.Gruppa        = ShifrGru then
                      if Curr_Person^.Kategorija    = ShifrKat then
                      if Get_Dol_Code(Curr_Person)  = ShifrDol then
                      if AllTrim(Curr_Person^.Dolg) = AllTrim(Dolg) then
                      if GET_SWM_MODE_PERSON(Curr_Person) = ShifrSwmMode then
//              if Curr_Person^.Wid_Raboty    = ShifrWR then
                      if ((IS_OSN_WID_RABOTY(Curr_Person) and  (ShifrWR=1)) or
                          (Not IS_OSN_WID_RABOTY(Curr_Person) and  (ShifrWR=2))) then
                           begin
                                Finded:=true;
                                Break;
                           end;
                      Curr_Person:=Curr_Person^.Next;
                 end;
          end;
       { Выйти если сотрудник не найден }
       if not finded then
          begin
               { Восстановить текущее подразделение }
               if ShifrPod<>Nsrv_Temp then
                   begin
                         EMPTY_ALL_PERSON;
                         Nsrv:=Nsrv_Temp;
                         MKFLNM;
                         GETINF(TRUE);
                   end;
               Exit
          end;
         List:=TList.Create;
         Updated := false;
         S:= 'select ShifrSta,summa_k_bud, summa_k_vne, summa_k_gn, summa_k_nis,'+
             ' Year_Za,Month_Za,a.k_day,b.ShifrId,b.f_data,b.l_data' +
             ' from tb_komand_res a join tb_komand b on a.ShifrIdKmnd=b.ShifrId' +
             ' where b.ShifrId=' + IntToStr(ShifrIDKmd);
         if not FIB.pFIBQuery.Transaction.Active then
            FIB.pFIBQuery.Transaction.StartTransaction;

         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(S);
         try
            FormWait.Show;
            Application.ProcessMessages;
            FIB.pFIBQuery.ExecQuery;
            FormWait.Hide;
            DateFr:=date;
            DateTo:=dateFr;
            shifrsta:=1;
            while not FIB.pFIBQuery.Eof do
             begin
                  ShifrSta := FIB.pFIBQuery.Fields[0].AsInteger;
                  YearZa   := FIB.pFIBQuery.Fields[5].AsInteger;
                  MonthZa  := FIB.pFIBQuery.Fields[6].AsInteger;
                  K_Day    := FIB.pFIBQuery.Fields[7].AsInteger;
                  Summa    := FIB.pFIBQuery.Fields[Gruppa].AsFloat;
                  ShifrId  := FIB.pFIBQuery.Fields[8].AsInteger;
                  DateFr   := FIB.pFIBQuery.Fields[9].AsDate;
                  DateTo   := FIB.pFIBQuery.Fields[10].AsDate;
                  DecodeDate(DateFr,Y,M,D);
                  DecodeDate(DateTo,Y,M,D);

                  { Изменение от 17 05 2009 }
                  { занести в список для Изменение от 17 05 2009 }
{ ======================================================= }
                   Finded:=false;
                   for i:=0 to List.Count-1 do
                       if (PPeriodRec(List.Items[i])^.YearZa  = YearZa) and
                          (PPeriodRec(List.Items[i])^.MonthZa = MonthZa) then
                          begin
                                Finded:=true;
                                break;
                          end;
                   if not Finded then
                      if (YearZa<>CurrYear) or (MonthZa<>NMES) then
                         begin
                              New(PeriodRec);
                              PeriodRec.YearZa  := YearZa;
                              PeriodRec.MonthZa := MonthZa;
                              List.Add(PeriodRec);
                         end;
{ ======================================================= }
                  { Конец изменений от 17 05 2009 }




                  if abs(Summa)>0.009  then
                     begin
                          if NeedAdd then
                             begin
                                   Make_Add(Curr_Add,Curr_Person);
                                   Curr_Add^.Shifr    := ShifrSta;
                                   Curr_Add^.Period   := MonthZa;
                                   Curr_Add^.Year     := YearZa-1990;
                                   Curr_Add^.Summa    := Summa;
                                   Curr_Add^.FZP      := Summa;
                                   Curr_Add^.Work_Day := K_Day;
                                   Curr_Add^.Who      := ShifrId mod 60000;
                                   Updated := true;
                             end;
{
                          Finded:=false;
                          for i:=0 to List.Count-1 do
                              if (PPeriodRec(List.Items[i])^.YearZa  = YearZa) and
                                 (PPeriodRec(List.Items[i])^.MonthZa = MonthZa) then
                                  begin
                                       Finded:=true;
                                       break;
                                  end;
                          if not Finded then
                          if (YearZa<>CurrYear) or (MonthZa<>NMES) then
                             begin
                                   New(PeriodRec);
                                   PeriodRec.YearZa  := YearZa;
                                   PeriodRec.MonthZa := MonthZa;
                                   List.Add(PeriodRec);
                             end;
}
                     end;
                  FIB.pFIBQuery.Next;
             end;
            FIB.pFIBQuery.Close;
         except
            MessageDlg('Ошибка SQL запроса',mtInformation, [mbOk], 0);
            Exit;
         end;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       if Assigned(Curr_Person) then
       if NeedCorrectBolnTabel(DateB,DateE,DateFr,DateTo) then
          begin
               Make_Kmd_Tabel(Curr_Person,DateFr,DateTo);
               if IsShifrInAddPerson(Curr_Person,138) then
                   ShifrSta:=ShifrSta;
               Calc_Naud_Person(Curr_Person,31);
               if IsShifrInAddPerson(Curr_Person,138) then
                   ShifrSta:=ShifrSta;
{
               Curr_Person^.HOLIDAY[1,1,1]:=DayOf(DateFr);
               Curr_Person^.HOLIDAY[1,1,2]:=MonthOf(DateFr);
               Curr_Person^.HOLIDAY[1,1,3]:=YearOf(DateFr) - 1900;
               Curr_Person^.HOLIDAY[1,2,1]:=DayOf(DateFr);
               Curr_Person^.HOLIDAY[1,2,2]:=MonthOf(DateFr);
               Curr_Person^.HOLIDAY[1,2,3]:=YearOf(DateFr) - 1900;
}
          end;
       for i:=1 to List.Count do
           begin
                j:=i;
          //      ShowMessage('y='+IntToStr(PPeriodRec(List.Items[i-1])^.YearZa)+' m='+IntToStr(PPeriodRec(List.Items[i-1])^.MonthZa));
                DebugMode:=0;
                if (trim(Curr_Person^.Dolg)='до 31.01.11') then
//                  begin
                    DebugMode:=1;
                    if Curr_Person^.AUTOMATIC=AUTOMATIC_MODE then
                       begin
                            Recalc_Person_Sql(Curr_Person,PPeriodRec(List.Items[i-1])^.YearZa,PPeriodRec(List.Items[i-1])^.MonthZa,DebugMode);
                            if PPeriodRec(List.Items[i-1])^.MonthZa=NMES then
                               Calc_Naud_Person(Curr_Person,31)
                                                 else
                               begin
                                    FLAG_NAUD_FOR_OTHER_MONTH:=true;
                                    Update_Podoh(Curr_Person,PPeriodRec(List.Items[i-1])^.MonthZa,PPeriodRec(List.Items[i-1])^.YearZa-1990);
                                    FLAG_NAUD_FOR_OTHER_MONTH:=false;
                               end
                       end;
//                  end;
           end;
     { Пометить больничный как перенесеный }
       for i:=0 to List.Count-1 do
           Dispose(PPeriodRec(List.Items[i]));
       List.Free;

       if (Updated) and (NeedAdd) then
          begin
               CurrD  := Date;
               DeCodeDate(CurrD,Y,M,D);
               DatePS := IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
               FieldS := 'DATA_P_BUD';
               S:= 'update tb_komand set '+FieldS+'='''+DatePS+'''';
               S:=S+' where shifrid='+IntToStr(ShifrIdKmd);
               try
                  FormWait.Show;
                  Application.ProcessMessages;
                  SQLExecute(S);
                  FormWait.Hide;
              except
                   ShowMessage('Ошибка записи даты переноса');
               end;
          end;

       if ShifrPod<>NSRV_Temp then
          begin
               PutInf;
               EMPTY_ALL_PERSON;
               Nsrv:=NSRV_TEMP;
               MKFLNM;
               GETINF(TRUE);
          end;

  end;

//+++++++++++++++++++++++


 PROCEDURE MAKE_ILL_TABEL(Curr_Person:Person_Ptr;DataFr,DataTo:TDateTime);
  VAR I,L,U_BOUND,L_BOUND:INTEGER;
      YFR,MFR,DFR:WORD;
      YTO,MTO,DTO:WORD;
      CurrDate:TDateTime;
      IsBetween:boolean;
  BEGIN
        CurrDate:=EncodeDate(CurrYear,NMES,1);
        L:=LenMonth(CurrDate);
        IsBetween:=false;
        for i:=1 to L do
            begin
                 CurrDate:=EncodeDate(CurrYear,NMES,i);
                 if DateBetween(CurrDate,DataFr,DataTo) then
                    begin
                          IsBetween:=true;
                          break;
                    end;
            end;
        if not IsBetween then Exit;
        DeCodeDate(DataFr,YFR,MFR,DFR);
        DeCodeDate(DataTo,YTO,MTO,DTO);
{
        if CurrYear<YFR then Exit;
        if Nmes<MFR  then Exit;
        if Nmes>MTO  then Exit;
        if CurrYear>YTO  then Exit;
}
        U_BOUND:=LENMONTH(EnCodeDate(CurrYear,NMes,1));
        IF NMES=MTO  THEN U_BOUND:=DTO;
        L_BOUND:=1;
        IF NMES=MFR  THEN L_BOUND:=DFR;
        FOR L:=L_BOUND TO U_BOUND DO
            IF ((MONTH_DAY[2,NMES,L]=1) OR
                (MONTH_DAY[2,NMES,L]=2) or
                (isLNR and (MONTH_DAY[2,NMES,L] in [3,4]))
               )   THEN
               IF CURR_PERSON^.STATE=PERSON_DEKRET_BOLN_STATE THEN CURR_PERSON^.TABEL[L]:=BEREM_OTPUSK
                                                              ELSE CURR_PERSON^.TABEL[L]:=ILLNESS;
  END;

 PROCEDURE MAKE_KMD_TABEL(Curr_Person:Person_Ptr;DataFr,DataTo:TDateTime);
  VAR I,L,U_BOUND,L_BOUND:INTEGER;
      YFR,MFR,DFR:WORD;
      YTO,MTO,DTO:WORD;
      CurrDate:TDateTime;
      IsBetween:boolean;
  BEGIN
        CurrDate:=EncodeDate(CurrYear,NMES,1);
        L:=LenMonth(CurrDate);
        IsBetween:=false;
        for i:=1 to L do
            begin
                 CurrDate:=EncodeDate(CurrYear,NMES,i);
                 if DateBetween(CurrDate,DataFr,DataTo) then
                    begin
                          IsBetween:=true;
                          break;
                    end;
            end;
        if not IsBetween then Exit;
        DeCodeDate(DataFr,YFR,MFR,DFR);
        DeCodeDate(DataTo,YTO,MTO,DTO);
{
        if CurrYear<YFR then Exit;
        if Nmes<MFR  then Exit;
        if Nmes>MTO  then Exit;
        if CurrYear>YTO  then Exit;
}
        U_BOUND:=LENMONTH(EnCodeDate(CurrYear,NMes,1));
        IF NMES=MTO  THEN U_BOUND:=DTO;
        L_BOUND:=1;
        IF NMES=MFR  THEN L_BOUND:=DFR;
        FOR L:=L_BOUND TO U_BOUND DO
            IF ((MONTH_DAY[2,NMES,L]=1) OR
                (MONTH_DAY[2,NMES,L]=2))   THEN
                CURR_PERSON^.TABEL[L]:=KOMANDIROWKA;
  END;


 PROCEDURE MAKE_OTP_TABEL_FROM_SQL(Curr_Person:Person_Ptr);
  VAR L,U_BOUND,L_BOUND:INTEGER;
      YFR,MFR,DFR:WORD;
      YTO,MTO,DTO:WORD;
      Template:array[1..31] of Byte;
      corrected:boolean;
      dtUw:TDateTime;
      amntOfSowm:Integer;
      shifrIdDol:Integer;
      needcont:boolean;
  function countOtpDay(curr_person:person_ptr):Integer;
   var retVal:Integer;
       i:Integer;
   begin
        retVal:=0;
        for i:=1 to 31 do
           if curr_person^.TABEL[i]=TARIFN_OTPUSK then
              Inc(RetVal);
        countOtpDay:=retVal;
   end;
  function countSowm(curr_person:person_ptr):integer;
    var retVal:Integer;
        c_person:PERSON_PTR;
        shifrdol:Integer;
    begin
         retVal:=0;
         c_person:=HEAD_PERSON;
         while (c_person<>nil) do
          begin
                shifrdol := GET_DOL_CODE(c_person);
                if c_person^.TABNO=curr_person^.TABNO then
                if c_person^.WID_RABOTY=2 then
                if c_person^.oklad>0 then
                if (shifrdol>9) and (shifrdol<>1500) then
                   retVal:=retVal+1;
                c_person:=c_person^.next;
          end;
         countSowm:=retVal;

    end;
  function SetTemplate:Boolean;
    var RetVal:boolean;
        SQLStmnt:widestring;
        IsStarted:Boolean;
        YS,DataFrS,DataToS:String;
        DateFr,DateTo:TDateTime;
        df,dt,i:integer;
        modewr:integer;
        GUIDPerson:string;
     function getGuidFromOtpSQL:widestring;
      var SQLStmnt:widestring;
      begin
  //         SQLStmnt:='++'+'--';
           SQLStmnt:='select first 1 guid from ( ';
           SQLStmnt:=Trim(SQLStmnt)+' select oa1.summa' ;
           SQLStmnt:=Trim(SQLStmnt)+' ,(select first 1';
           SQLStmnt:=Trim(SQLStmnt)+'    (select first 1 guid from pr_getguid(p.shifrid, 0)) guid';
           SQLStmnt:=Trim(SQLStmnt)+' from fadd fad';
           SQLStmnt:=Trim(SQLStmnt)+'           join person p on p.shifrid=fad.shifridperson';
           SQLStmnt:=Trim(SQLStmnt)+'           where fad.tabno=a.tabno';
           SQLStmnt:=Trim(SQLStmnt)+'           and fad.year_vy=oa1.year_vy';
           SQLStmnt:=Trim(SQLStmnt)+'           and fad.month_vy=oa1.month_vy';
           SQLStmnt:=Trim(SQLStmnt)+'           and fad.w_place=oa1.w_place';
           SQLStmnt:=Trim(SQLStmnt)+'           and fad.year_za=oa1.year_za';
           SQLStmnt:=Trim(SQLStmnt)+'           and fad.month_za=oa1.month_za';
           SQLStmnt:=Trim(SQLStmnt)+'           and fad.shifrsta=oa1.shifrsta';
           SQLStmnt:=Trim(SQLStmnt)+'           and fad.summa=oa1.summa';
           SQLStmnt:=Trim(SQLStmnt)+' )';
           SQLStmnt:=Trim(SQLStmnt)+' from otp_add oa1';
       //    SQLStmnt:=Trim(SQLStmnt)+' --join otpuska ot on ot.shifrid=oa1.shifridotp';
           SQLStmnt:=Trim(SQLStmnt)+' where oa1.shifridotp=a.shifrid';//+IntToStr(ShifrIdOtp);
           SQLStmnt:=Trim(SQLStmnt)+'  and oa1.sel>0';
           SQLStmnt:=Trim(SQLStmnt)+')';
           SQLStmnt:=Trim(SQLStmnt)+' group by 1';
           SQLStmnt:=Trim(SQLStmnt)+' order by count(*) desc';
           getGuidFromOtpSQL:=SQLStmnt;
      end;
    begin
         RetVal:=False;
         FillChar(Template,SizeOf(Template),0);
         YS:=IntToStr(Work_Year_Val);
         DataFrS:=YS+'-'+IntToStr(NMES)+'-01';
         DateFr:=EncodeDate(Word(Work_Year_Val),word(Nmes),1);
         DataToS:=YS+'-'+IntToStr(NMES)+'-'+IntToStr(LenMonth(DateFr));
         DateTo:=EncodeDate(Word(Work_Year_Val),word(Nmes),Word(LenMonth(DateFr)));
         if IS_OSN_WID_RABOTY(curr_person) then
            modewr:=1
         else
            modewr:=2;
         GUIDperson:=Trim(GetGUIDPersonToString(curr_person));
         if curr_person^.tabno=11648 then
           isLNR:=true;

         SQLStmnt:=         'select a.f_data,a.l_data,a.shifrid';
//         if isLNR then
//            begin
//                 SQLStmnt:=SQLStmnt+' (select first 1 coalesce(oa.w_place,0) from otp_add oa
//                 SQLStmnt:=SQLStmnt+' where oa.shifridotp=a.shifrid';
//                 SQLStmnt:=SQLStmnt+'     and coalesce(oa.sel,0)>0) shifrpod';
//            end;
         SQLStmnt:=SQLStmnt+' from otpuska a';
         SQLStmnt:=SQLStmnt+' where not ((a.f_data>'''+DataToS+''') or (a.l_data<'''+DataFrS+'''))';
         SQLStmnt:=SQLStmnt+' and a.tabno='+IntToStr(Curr_Person^.Tabno);
         SQLStmnt:=SQLStmnt+' and coalesce(a.mode,0)<>1' ; //Компенсация на табель не должна влиять
         SQLStmnt:=SQLStmnt+' and exists (select  * from otp_res b where b.shifridotp=a.shifrid';
//         if not (isLNR and (NMES=8) and (CURRYEAR=2020) and (NSRV<>162)) then
//            begin
//         SQLStmnt:=SQLStmnt+' and (extract(year from b.data_pere_bud)='+YS+' or';
//         SQLStmnt:=SQLStmnt+'      extract(year from b.data_pere_vne)='+YS+' or';
//         SQLStmnt:=SQLStmnt+'      extract(year from b.data_pere_gn)=' +YS+' or';
//         SQLStmnt:=SQLStmnt+'      extract(year from b.data_pere_nis)='+YS+')';
//            end;
      //   if False then
         if isLNR then
            begin
                SQLStmnt:=SQLStmnt + ' and coalesce(a.modewr,0)='+IntToStr(modewr);
                SQLStmnt:=SQLStmnt+' and exists (select * from otp_add oa';
                SQLStmnt:=SQLStmnt+'  where oa.shifridotp=a.shifrid';
                SQLStmnt:=SQLStmnt+'     and coalesce(oa.sel,0)=1';
                SQLStmnt:=SQLStmnt+'     and coalesce(oa.w_place,0)='+IntToStr(NSRV)+'))';
//                SQLStmnt:=SQLStmnt+' and  ('+getGuidFromOtpSQL+')='''+GUIDperson+'''';


 //               SQLStmnt:=SQLStmnt + ' and (CHAR_LENGTH(coalesce(a.guid,''1''))>5 and coalesce(a.guid,''1'')='''+GUIDPerson+''') ';
            end
         else
             SQLStmnt:=Trim(SQLStmnt)+')';

//         SQLStmnt='select first 1 s from pr_bld_otp_tabel('+IntToStr(Curr_Person^.Tabno)+','+ys+','+IntToStr
         IsStarted:=false;
         if not FIB.pFIBQuery.Transaction.Active then
            begin
                 FIB.pFIBQuery.Transaction.StartTransaction;
                 IsStarted:=True;
            end;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(SQLStmnt);
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.Eof do
              begin
                    if DateFr>=FIB.pFIBQuery.Fields[0].AsDate then df:=1
                       else df:=DayOf(FIB.pFIBQuery.Fields[0].AsDate);
                    if FIB.pFIBQuery.Fields[1].AsDate>DateTo then dt:=DayOf(DateTo)
                       else dt:=DayOf(FIB.pFIBQuery.Fields[1].AsDate);
                    if (dt>=df) then
                    for i:=df to dt do
                        Template[i]:=1;

                   FIB.pFIBQuery.Next;
              end;
         FIB.pFIBQuery.Close;
         if IsStarted then
            FIB.pFIBQuery.Transaction.Commit;
         for i:=1 to 31 do
             if Template[i]=1 then
                begin
                     RetVal:=true;
                     Break;
                end;
         SetTemplate:=RetVal;
    end;
  BEGIN
//<<<<<<< HEAD
        if curr_person^.tabno=7817 then
           isLnr:=true;
        if isLNR then
        if (CURRYEAR=2020) and (NMES=8) then
           begin
               L_BOUND:= countOtpDay(curr_person);
               if L_BOUND>0 then Exit;
           END;    
        needcont:=false;
        shifridDol := GET_DOL_CODE(curr_person);
        if SetTemplate then needcont:=True
        else
        if isLNR then
        if curr_person^.WID_RABOTY=2 then
        if (shifridDol>9) and (shifriddol<>1500) then
        if Curr_Person^.KATEGORIJA=1 then //pps
        if (CURRYEAR=2020) and (NMES in [7,8]) then
           begin
                needcont:=True;
           end;
        if not needcont then Exit;

        U_BOUND:=LENMONTH(EnCodeDate(CurrYear,NMes,1));
        IF NMES=MTO  THEN U_BOUND:=DTO;
        L_BOUND:=1;
        IF NMES=MFR  THEN L_BOUND:=DFR;
        corrected:=false;
        if curr_person^.tabno=1356 then
           isLNR:=true;
        if curr_person^.WID_RABOTY=2 then
           begin
                 amntOfSowm:=countSowm(curr_person);
           end;
        if not (
           (isLNR) and
           (curr_person^.WID_RABOTY=2) and
           (NMES in [7,8]) and
           (CURRYEAR=2020) and
           (curr_person^.KATEGORIJA=1) and
           (Pos('КАФЕДРА',UPPER_STRING(Name_Serv(NSRV)))>0)

         ) then

{=======
        if not SetTemplate then Exit;
//        U_BOUND:=LENMONTH(EnCodeDate(CurrYear,NMes,1));
//        IF NMES=MTO  THEN U_BOUND:=DTO;
//        L_BOUND:=1;
//        IF NMES=MFR  THEN L_BOUND:=DFR;
>>>>>>> newio
}
        for l:=1 to 31 do
            if Template[l]=1 then
            if
               (
               ((GetDayCode(l)=1) OR
                (GetDayCode(l)=2) OR
                (GetDayCode(l)=3))
                ) or isLNR   THEN
                  begin
    //        IF ((MONTH_DAY[2,NMES,L]=1) OR
    //            (MONTH_DAY[2,NMES,L]=2) OR
    //            (MONTH_DAY[2,NMES,L]=3))   THEN
               CURR_PERSON^.TABEL[L]:=TARIFN_OTPUSK;
                  corrected:=True;
                  end;

        if isLNR then
        if (nmes in [7,8]) and (CURRyear=2020) then
        if ((curr_person^.WID_RABOTY=2)
             and
            (curr_person^.KATEGORIJA=1)
            and (Pos('КАФЕДРА',UPPER_STRING(Name_Serv(NSRV)))>0)
            ) then
    //    if corrected then
           begin
                if Curr_Person^.tabno=1356 then
                   isLNR:=True;
                dtUw:=encodedate(2020,6,30);
                setDataUwPerson(Curr_Person,dtUw);
                curr_person^.AUTOMATIC:=MANUAL_MODE;
           end;

  END;

 PROCEDURE MAKE_OG_TABEL_FROM_SQL(Curr_Person:Person_Ptr);
  VAR L,U_BOUND,L_BOUND:INTEGER;
      YFR,MFR,DFR:WORD;
      YTO,MTO,DTO:WORD;
      Template:array[1..31] of Byte;
  function SetTemplate:Boolean;
    var RetVal:boolean;
        SQLStmnt:widestring;
        IsStarted:Boolean;
        YS,DataFrS,DataToS:String;
        DateFr,DateTo:TDateTime;
        df,dt,i:integer;
    begin
         RetVal:=False;
         FillChar(Template,SizeOf(Template),0);
         YS:=IntToStr(Work_Year_Val);
         DataFrS:=YS+'-'+IntToStr(NMES)+'-01';
         DateFr:=EncodeDate(Word(Work_Year_Val),word(Nmes),1);
         DataToS:=YS+'-'+IntToStr(NMES)+'-'+IntToStr(LenMonth(DateFr));
         DateTo:=EncodeDate(Word(Work_Year_Val),word(Nmes),Word(LenMonth(DateFr)));

         SQLStmnt:=         'select a.f_data,a.l_data from boln a';
         SQLStmnt:=SQLStmnt+' where not ((a.f_data>'''+DataToS+''') or (a.l_data<'''+DataFrS+'''))';
         SQLStmnt:=SQLStmnt+' and exists (select  * from boln_res b where b.shifridboln=a.shifrid)';
         SQLStmnt:=SQLStmnt+' and (extract(year from a.data_p_bud)='+YS+' or';
         SQLStmnt:=SQLStmnt+'      extract(year from a.data_p_vne)='+YS+' or';
         SQLStmnt:=SQLStmnt+'      extract(year from a.data_p_gn)=' +YS+' or';
         SQLStmnt:=SQLStmnt+'      extract(year from a.data_p_nis)='+YS+')';
         SQLStmnt:=SQLStmnt+' and a.tabno='+IntToStr(Curr_Person^.Tabno);
         SQLStmnt:=SQLStmnt+' and a.mode_ill=1';

//         SQLStmnt='select first 1 s from pr_bld_otp_tabel('+IntToStr(Curr_Person^.Tabno)+','+ys+','+IntToStr
         IsStarted:=false;
         if not FIB.pFIBQuery.Transaction.Active then
            begin
                 FIB.pFIBQuery.Transaction.StartTransaction;
                 IsStarted:=True;
            end;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(SQLStmnt);
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.Eof do
              begin
                    if DateFr>=FIB.pFIBQuery.Fields[0].AsDate then df:=1
                       else df:=DayOf(FIB.pFIBQuery.Fields[0].AsDate);
                    if FIB.pFIBQuery.Fields[1].AsDate>DateTo then dt:=DayOf(DateTo)
                       else dt:=DayOf(FIB.pFIBQuery.Fields[1].AsDate);
                    if (dt>=df) then
                    for i:=df to dt do
                        Template[i]:=1;

                   FIB.pFIBQuery.Next;
              end;
         FIB.pFIBQuery.Close;
         if IsStarted then
            FIB.pFIBQuery.Transaction.Commit;
         for i:=1 to 31 do
             if Template[i]=1 then
                begin
                     RetVal:=true;
                     Break;
                end;
         SetTemplate:=RetVal;
    end;
 BEGIN
        if not SetTemplate then Exit;
//        U_BOUND:=LENMONTH(EnCodeDate(CurrYear,NMes,1));
//        IF NMES=MTO  THEN U_BOUND:=DTO;
//        L_BOUND:=1;
//        IF NMES=MFR  THEN L_BOUND:=DFR;
        for l:=1 to 31 do
            if Template[l]=1 then
            IF ((GetDayCode(l)=1) OR
                (GetDayCode(l)=2) OR
                (GetDayCode(l)=3))   THEN
    //        IF ((MONTH_DAY[2,NMES,L]=1) OR
    //            (MONTH_DAY[2,NMES,L]=2) OR
    //            (MONTH_DAY[2,NMES,L]=3))   THEN
               CURR_PERSON^.TABEL[L]:=BEREM_OTPUSK;
  END;


 PROCEDURE MAKE_OTP_TABEL(Curr_Person:Person_Ptr;DataFr,DataTo:TDateTime);
  VAR L,U_BOUND,L_BOUND:INTEGER;
      YFR,MFR,DFR:WORD;
      YTO,MTO,DTO:WORD;
  BEGIN
        MAKE_OTP_TABEL_FROM_SQL(Curr_Person);
        Exit;
        DeCodeDate(DataFr,YFR,MFR,DFR);
        DeCodeDate(DataTo,YTO,MTO,DTO);
        if CurrYear<YFR then Exit;
        if CurrYear>YTO  then Exit;
        if (Nmes<MFR) and (CurrYear=YFR) then Exit;
        if (Nmes>MTO) and (CurrYear=YTO) then Exit;
        U_BOUND:=LENMONTH(EnCodeDate(CurrYear,NMes,1));
        IF NMES=MTO  THEN U_BOUND:=DTO;
        L_BOUND:=1;
        IF NMES=MFR  THEN L_BOUND:=DFR;
        FOR L:=L_BOUND TO U_BOUND DO
            IF ((MONTH_DAY[2,NMES,L]=1) OR
                (MONTH_DAY[2,NMES,L]=2) OR
                (MONTH_DAY[2,NMES,L]=3))   THEN
               CURR_PERSON^.TABEL[L]:=TARIFN_OTPUSK;
  END;


  FUNCTION LenMonth(DateW:TDateTime):Integer;
   begin
        LenMonth:=DaysInMonth(DateW);
{
        DecodeDate(DateW,Y,M,D);
        RetVal:=31;
        case m of
             4,6,9,11:RetVal:=30;
             2:if Y Mod 4 = 0 then RetVal:=29
                               else RetVal:=28;
        end;
        LenMonth:=RetVal;
}
   end;
 function DateBetween(TestedDate,DateB,DateE:TDateTime):boolean;
   var R1,R2:Integer;
   begin
         Result:=false;
         R1:=CompareDate(TestedDate,DateB);
         R2:=CompareDate(TestedDate,DateE);
         if ((R1=0) or (R1=1)) and ((R2=-1) or (R2=0)) then Result:=true;
   end;
 function NeedCorrectBolnTabel(DateB,DateE,DateFr,DateTo:TDateTime):boolean;
   var I,L:Integer;
       DateW:TDateTime;
       Y,M,D:word;
       DateFrY,DateFrM,DateFrD:word;
       DateToY,DateToM,DateToD:word;
   begin
        Result:=false;
        L:=DaysInMonth(DateB);
        DecodeDate(DateB,Y,M,D);
        DecodeDate(DateFr,DateFrY,DateFrM,DateFrD);
        DecodeDate(DateTo,DateToY,DateToM,DateToD);
        for i:=1 to L do
            begin
                  d:=i;
                  DateW:=EncodeDate(Y,M,D);
                  if DateBetween(DateW,DateFr,DateTo) then
                     begin
                          Result:=true;
                          break
                     end;
            end;
   end;

  function GetShifrWrk:integer;
   var I:Integer;
   begin
        FIB.pFIBQuery.SQL.Clear;
        FIB.pFIBQuery.SQL.Add('select FIRST 1 shifrwrk from CURRSHIFRWRK');
        FIB.pFIBTransactionSAL.StartTransaction;
        try
               FIB.pFIBQuery.ExecQuery;
               I:=FIB.pFIBQuery.Fields[0].AsInteger;
               FIB.pFIBQuery.Close;
               GetShifrWrk:=I;
        except
               MessageDlg('Ошибка GetShifrWrk ',mtInformation, [mbOk], 0);
               GetShifrWrk:=1;
               Exit;
        end;
        FIB.pFIBTransactionSAL.Commit;
   end;

 function GetDayCode(k:integer):Integer;
  var RetVal:Integer;
  begin
       if ((k<1) or (k>31)) then
          begin
               showMessage('error: k='+intToStr(k)); 
               Result:=0;
               exit;
          end;
       RetVal:=Day_Kod[k];
       if IsColedgPodr(nsrv) then
          RetVal:=Day_Kod_Coledge[k];

      Result:=RetVal;
  end;

 function isSixDayMode(curr_person:person_ptr):boolean;
  const ld=12;
        dolgl:array[1..ld] of Integer=(70,80,1532,47,10,40,20,30,45,47,50,60);
        lNSRV=3;
        nsrvl:array[1..lNSRV] of Integer=(1,8,72);
        lBiblDolg=7;
        bibldolgl:array[1..lBiblDolg] of Integer=(825,827,1393,1423,1426,1427,1435);
  var retVal:boolean;
      shifrdol:integer;
      function isindol(wi:integer):boolean;
        var retval:boolean;
            i:integer;
        begin
             retval:=false;
             for i:=1 to ld do
               begin
                    if dolgl[i]=wi then
                       begin
                           retval:=true;
                           break;
                       end;
               end;
             isindol:=retval;
        end;
      function isinnsrvl(wi:integer):boolean;
        var retval:boolean;
            i:integer;
        begin
             retval:=false;
             for i:=1 to lNSRV do
               begin
                    if nsrvl[i]=wi then
                       begin
                           retval:=true;
                           break;
                       end;
               end;
             isinnsrvl:=retval;
        end;
      function isinbibldolgl(wi:integer):boolean;
        var retval:boolean;
            i:integer;
        begin
             retval:=false;
             for i:=1 to lBiblDolg do
               begin
                    if bibldolgl[i]=wi then
                       begin
                           retval:=true;
                           break;
                       end;
               end;
             isinbibldolgl:=retval;
        end;
  begin
       retVal:=false;
       shifrDol:=GET_DOL_CODE(curr_person);
       if (currYear>2018) or ((currYear=2018) and (nmes>8)) then
{
       if isLNR then
          if not IsColedgPodr(NSRV) then
             if not isinnsrvl(NSRV) then
                     if isindol(shifrDol) then
                         retVal:=true;
}
       if (isLNR
           and not IsColedgPodr(NSRV)
           and not isinnsrvl(NSRV)
           and not isindol(shifrDol)
           ) then
       if (curr_Person.KATEGORIJA=1)         then
    //       or
    //       (isPersonAUP_PPS(curr_person))) then
          retVal:=true;
     // Библиотека
{
       if isLNR then
       if not retVal then
       if nsrv=9 then
       if isinbibldolgl(shifrdol) then
          retVal:=true;
}
       isSixDayMode:=retVal;
  end;
 function isFiveDayMode(curr_person:person_ptr):boolean;
  var retVal:boolean;
  begin
       retVal:=not isSixDayMode(curr_person);
       isFiveDayMode:=retVal;
  end;
 function GetWDay(Period:integer;curr_person:person_ptr):Real;
  var RetVal:Real;
  begin
       RetVal:=W_Day_5[Period];
       if isSixDayMode(curr_person) then
          retVal:=w_day_6[Period]; 
       if IsColedgPodr(NSRV) then
       if W_DayColedg[Period]>0 then
          RetVal:=W_DayColedg[Period];
       GetWDay:=RetVal;
  end;
 function GetWorkClockForYearMonth(Y:integer;M:Integer):real;
   var I:Integer;
       RetVal:Real;
       IStartTransaction:boolean;
   begin
        IStartTransaction:=false;
        RetVal := 0;
        if Y<1990 then Y:=Y+1990;
        if FIB.pFIBQuery.Open then
           FIB.pFIBQuery.Close;
        FIB.pFIBQuery.SQL.Clear;
        FIB.pFIBQuery.SQL.Add('select first 1 clocks from TB_DAYS where yearza='+IntToStr(Y)+' and monthza='+IntToStr(M));
        if not FIB.pFIBQuery.Transaction.Active then
           begin
                FIB.pFIBTransactionSAL.StartTransaction;
                IStartTransaction:=true;
           end;
        try
               FIB.pFIBQuery.ExecQuery;
               RetVal:=FIB.pFIBQuery.Fields[0].AsFloat;
               FIB.pFIBQuery.Close;
               GetWorkClockForYearMonth:=RetVal;
        except
               MessageDlg('Ошибка GetWorkClock ',mtInformation, [mbOk], 0);
               GetWorkClockForYearMonth:=0;
        end;
        if FIB.pFIBQuery.Open then
           FIB.pFIBQuery.Close;
        if IStartTransaction then
           FIB.pFIBTransactionSAL.Commit;
   end;

 function GetPochasClockFromDB(Tabno:integer):real;
   var I:Integer;
       RetVal:Real;
       RV:Variant;
       IStartTransaction:boolean;
       SQLStmnt:widestring;
       Y:Integer;
       DateBeginS:string;
       yb:word;
   begin
        IStartTransaction:=false;
        RetVal := 0;
        if FIB.pFIBQuery.Open then
           FIB.pFIBQuery.Close;
        FIB.pFIBQuery.SQL.Clear;
        Y:=WORK_YEAR_VAL;
        if NMES>8 then yb:=y
                  else yb:=y-1;
        DateBeginS := IntToStr(YB)+'-09-01';
        SQLStmnt:='select sum(coalesce(a.wclock,0.00)) from fadd a where a.tabno='+IntToStr(Tabno);
        SQLStmnt:=SQLStmnt+' and a.year_vy  in (2010,2011,2012,2013,2014)';
        SQLStmnt:=SQLStmnt+' and cast(a.year_vy||''-''||a.month_vy||''-01'' as Date)<cast('''+IntToStr(Y)+'-'+IntToStr(NMES)+'-01'' as date)';
        SQLStmnt:=SQLStmnt+' and cast(a.year_vy||''-''||a.month_vy||''-01'' as Date)>cast('''+DateBeginS+''' as Date)';;
(*
        FIB.pFIBQuery.SQL.Add(SQLStmnt);

        if not FIB.pFIBQuery.Transaction.Active then
           begin
                FIB.pFIBTransactionSAL.StartTransaction;
                IStartTransaction:=true;
           end;
        try
               FIB.pFIBQuery.ExecQuery;
               RetVal:=FIB.pFIBQuery.Fields[0].AsFloat;
               GetPochasClockFromDB:=RetVal;
        except
               MessageDlg('Ошибка GetWorkClock ',mtInformation, [mbOk], 0);
               GetPochasClockFromDB:=0.00;
        end;
        FIB.pFIBQuery.Close;
        if IStartTransaction then
           FIB.pFIBTransactionSAL.Commit;
*)
        try
           RV:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
           if varIsFloat(RV) then
              retVal:=RV
           else
              retVal:=0.00;
           GetPochasClockFromDB:=RetVal;
        except
          else
             begin
               MessageDlg('Ошибка GetWorkClock ',mtInformation, [mbOk], 0);
               GetPochasClockFromDB:=0.00;
             end;
        end;
   end;

 function GetNal_CodePerson(Tabno:integer):string;
   var I:Integer;
       RetVal:string;
       IStartTransaction:boolean;
       SQLStmnt:string;
       v:variant;
   begin
        IStartTransaction:=false;
        RetVal := '';
        Result := '';
        if (Tabno<0) or (Tabno>20000) then Exit;
        SQLStmnt := 'select first 1 nal_code from kadry where tabno='+IntToStr(Tabno);
        v:=SQLQueryValue(SQLStmnt);
        if VarIsStr(v) then
           begin
                 retVal:=v;
                 retVal:=trim(retVal);
                 if not ((length(retval)>8) and (length(retval)<12)) then
                    retVal:='';
           end;
        GetNal_CodePerson:=retVal;
   end;

 function GetFullRusFioPerson(Tabno:integer):string;
   var I:Integer;
       RetVal:string;
       SQLStmnt:string;
       v:Variant;
   begin
        RetVal := '';
        GetFullRusFioPerson:=RetVal;
        if (Tabno<0) or (Tabno>20000) then Exit;
        SQLStmnt:='select first 1 PIB from kadry where tabno='+IntToStr(Tabno);
        v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
        if VarIsStr(v) then
           retVal:=v;
        GetFullRusFioPerson:=RetVal;
   end;
 function GetFullUkrFioPerson(Tabno:integer):string;
   var I:Integer;
       RetVal:string;
       SQLStmnt:string;
       v:Variant;
   begin
        RetVal := '';
        GetFullUkrFioPerson:=RetVal;
        if (Tabno<0) or (Tabno>20000) then Exit;
        SQLStmnt:='select first 1 FIO from kadry where tabno='+IntToStr(Tabno);
        v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
        if VarIsStr(v) then
           retVal:=v;
        GetFullUkrFioPerson:=RetVal;
   end;
 function getPersonInn(Tabno:integer):string;
   var I:Integer;
       RetVal:string;
       SQLStmnt:string;
       v:Variant;
   begin
        RetVal := '';
        GetPersonInn:=RetVal;
        if (Tabno<0) or (Tabno>20000) then Exit;
        SQLStmnt:='select first 1 nal_code from kadry where tabno='+IntToStr(Tabno);
        v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
        if VarIsStr(v) then
           retVal:=v;
        GetPersonInn:=RetVal;
   end;
 function getPersonPaspForInn(Tabno:integer):string;
   var I:Integer;
       RetVal:string;
       SQLStmnt:string;
       v:Variant;
       pasp_n,pasp_ser:string;
   begin
        RetVal := '';
        pasp_n := '';
        pasp_ser := '';
        GetPersonPaspForInn:=RetVal;
        if (Tabno<0) or (Tabno>20000) then Exit;
        SQLStmnt:='select first 1 nal_code,pasp_n,pasp_ser from kadry where tabno='+IntToStr(Tabno);
        v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
        if VarIsArray(v) then
           begin
               if VarIsStr(v[1]) then
                  pasp_n:=v[1];
               if VarIsStr(v[2]) then
                  pasp_ser:=v[2];
           end;
        if (((Length(Trim(pasp_n)))>0) and ((Length(Trim(pasp_ser))>0))) then
            retVal:=Trim(pasp_ser)+' '+trim(pasp_n);
        getPersonPaspForInn:=RetVal;
   end;
 function getPersonBankCount(Tabno:integer):string;
   var I:Integer;
       RetVal:string;
       SQLStmnt:string;
       v:Variant;
   begin
        RetVal := '';
        GetPersonBankCount:=RetVal;
        if (Tabno<0) or (Tabno>20000) then Exit;
        SQLStmnt:='select first 1 BANK_COUNT from kadry where tabno='+IntToStr(Tabno);
        v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
        if VarIsStr(v) then
           retVal:=v;
        GetPersonBankCount:=RetVal;
   end;


 FUNCTION IS_LUGANSK(S:STRING):BOOLEAN;
  VAR I,J:INTEGER;
      L:BOOLEAN;
      LU:STRING;
      C:STRING[1];
  BEGIN
      L:=FALSE;
      LU:='Луганск';
      I:=POS(LU,S);
      IF I>0 THEN
         BEGIN
              J:=I+7;
              C:=COPY(S,J,1);
              IF C[1] IN ['.',' ',','] THEN L:=TRUE;
         END;
      IS_LUGANSK:=L;
  END;
 function get_bank_name(shifrban:integer):string;
  var RetVal:string;
  begin
       retVal:='Не найден';
       if shifrban=0 then
          retVal:='Касса'
       else
       if bankiList.count>0 then
          begin
               retVal:=BankiList.getBankName(shifrBan);
          end;
       get_bank_name:=RetVal;
  end;
 FUNCTION IS_KASSA(S:STRING):BOOLEAN;
  VAR
      L:BOOLEAN;
      LU:STRING;
  BEGIN
      L:=FALSE;
      LU:='Касса';
      IF POS(LU,S)>0 THEN  L:=TRUE;
      IS_KASSA:=L;
  END;
 FUNCTION IS_PRAVEKSBANK(S:STRING):BOOLEAN;
  VAR
      L:BOOLEAN;
      LU:STRING;
  BEGIN
      L:=FALSE;
      LU:='Правекс-Банк';
      IF POS(LU,S)>0 THEN  L:=TRUE;
      IS_PRAVEKSBANK:=L;
  END;
 FUNCTION IS_PRIVATBANK(S:STRING):BOOLEAN;
  VAR
      L:BOOLEAN;
      LU:STRING;
      SS:String;
 BEGIN
     L:=FALSE;
     LU:='ПРИВАТ';
     SS:=UPPER_STRING(S);
     IF POS(LU,SS)>0 THEN  L:=TRUE;
     IS_PRIVATBANK:=L;
 END;

FUNCTION GET_ALIMENTY_PRIM(ALABEL:WORD):WORD;
 VAR K:WORD;
 BEGIN
      K:=ALABEL AND $07FF;
      GET_ALIMENTY_PRIM:=K;
 END;

FUNCTION CODE_ALIMENTY_PRIM(ALABEL:WORD;MODE:BYTE):WORD;
 VAR  I,J,K:WORD;
 BEGIN
      I:=MODE;
      J:=I SHL 12;
      K:=ALABEL OR J;
      CODE_ALIMENTY_PRIM:=K;
 END;


 function DOG_POD_PODRAZD(wanted_serv:integer):boolean;
 {$IFDEF SVDN}
  const max_stor=4;
        s:array[1..max_stor] of integer = (81,140,157,180);
 {$ELSE}
  const max_stor=5;
        s:array[1..max_stor] of integer = (81,140,157,180,182);
 {$ENDIF}
  var finded:boolean;
      i:integer;
  begin
       finded:=false;
       for i:=1 to Max_stor do
           if wanted_serv=s[i] then
              begin
                   finded:=true;
                   break;
              end;
       DOG_POD_PODRAZD:=finded;
  end;

FUNCTION REPLICATE(SYMB:CHAR;N:INTEGER):STRING;
 VAR I:INTEGER;
     S:STRING;
 BEGIN
     S:='';
     IF N IN [1..250] THEN FOR I:=1 TO N DO S:=S+SYMB;
     REPLICATE:=S;
 END;

function IsPrivatBankPerson(Curr_Person:Person_Ptr):boolean;
 begin
       if Curr_Person.BANK=1 then
          Result:=true
       else
          Result:=false;
 end;

function IsBrokBiznesBankPerson(Curr_Person:Person_Ptr):boolean;
 begin
       if Curr_Person.BANK=2 then
          Result:=true
       else
          Result:=false;
 end;
function IsUkrSibBankPerson(Curr_Person:Person_Ptr):boolean;
 begin
       if Curr_Person.BANK=3 then
          Result:=true
       else
          Result:=false;
 end;

function IsKassaPerson(Curr_Person:Person_Ptr):boolean;
 var s:string;
     retVal:Boolean;
 begin
      retVal:=true;
      if (Curr_Person^.BANK>0) then
         begin
           s:=BankiList.getBankName(Curr_Person^.BANK);
           if UPPER_STRING(Trim(s))<>'Касса' then retVal:=false;
         end;
      Result:=retVal;
 end;

 function WinExecAndWait32(FileName: string; Visibility: integer): LongInt;
var

  zAppName: array[0..512] of char;
  zCurDir: array[0..255] of char;
  WorkDir: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  res: cardinal;
{  LPTHandle:THandle;
  S:String;
  ZapisanoBytes:cardinal;  }
begin
{
    LPTHandle := CreateFile( 'LPT1',GENERIC_WRITE,
         0, PSecurityAttributes(nil),
         OPEN_EXISTING, FILE_FLAG_OVERLAPPED,
        0);
writefile(LPTHandle,S[1],Length(S),ZapisanoBytes,Nil);
CloseHandle(LPTHandle);
}
{
While not
TransmitCommChar( LPTHandle, CharToSend ) do
Application.ProcessMessages;
}
      StrPCopy(zAppName, FileName);
      GetDir(0, WorkDir);
      StrPCopy(zCurDir, WorkDir);
      FillChar(StartupInfo, Sizeof(StartupInfo), #0);
      StartupInfo.cb := Sizeof(StartupInfo);

      StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
      StartupInfo.wShowWindow := Visibility;
      if not CreateProcess(nil,
         zAppName, { указатель командной строки }
         nil,      { указатель на процесс атрибутов безопасности }
         nil,      { указатель на поток атрибутов безопасности }
         false,    { флаг родительского обработчика }
         CREATE_NEW_CONSOLE or { флаг создания }
         NORMAL_PRIORITY_CLASS,
         nil,      { указатель на новую среду процесса   }
         nil,      { указатель на имя текущей директории }
         StartupInfo, { указатель на STARTUPINFO }
         ProcessInfo) then
         Result := -1 { указатель на PROCESS_INF }

      else begin
               while WaitforSingleObject(ProcessInfo.hProcess, 10) = WAIT_TIMEOUT do
               Application.ProcessMessages;
               GetExitCodeProcess(ProcessInfo.hProcess, res);
               Result := Integer(res);
           end;
end;

  procedure MoveOtpToPerson(ShifrIdOtp : integer;
                             Gruppa   : integer;
                             Tabno    : integer;
                             ShifrPod : integer;
                             ShifrKat : integer;
                             ShifrGru : integer;
                             ShifrDol : integer;
                             ShifrWR  : integer;
                             ShifrSwmMode : integer;
                             Dolg     : string;
                             GUID     : string;
                             NeedAdd  : boolean);
  type PPeriodRec=^TPeriodRec;
       TPeriodRec=record
                   YearZa:integer;
                   MonthZa:integer;
                  end;

  var Nsrv_Temp     : integer;
      Curr_Person   : Person_Ptr;
      Finded        : boolean;
      S             : string;
      Curr_Add      : Add_Ptr;
      ShifrSta      : integer;
      YearZa        : integer;
      MonthZa       : integer;
      O_Day         : integer;
      Summa         : real;
      ShifrId       : integer;
      DateFr,DateTo : TDateTime;
      DateB,DateE   : TDateTime;     {Первый и посление дни текущего месяца}
      Y,M,D         : word;
      Updated       : boolean;
      CurrD         : TDateTime;
      DatePS        : string;
      PeriodRec     : PPeriodRec;
      List          : TList;
      I             : integer;
      NewPerson     : Person_Ptr;
      Debug_Mode    : integer;
      Data_Pere_Bud : TDateTime;
      Data_Pere_Vne : TDateTime;
      Data_Pere_Gn  : TDateTime;
      Data_Pere_Nis : TDateTime;
      Mode_Recalc   : integer;
      ChernobPerson : PERSON_PTR;
  function NeedNewPerson:boolean;
   begin
        Result := false;
        if (ShifrPod = 0) and
           (ShifrKat = 0) and
           ((ShifrGru = 0) or
            (ShifrGru=ChernobSchet)) and
           (ShifrDol = 0) and
           (ShifrWR  = 0) and
           (ShifrSwmMode = 0) then
           Result := true;
   end;

  procedure CreateNewPerson;
   var W_P:Integer;
   function GetFio:String;
    var RetVal:string;
        Curr_Person:Person_Ptr;
    begin
         RetVal := 'Нет';
         Curr_Person:=Head_Person;
         while Curr_Person<>NIl do
            begin
                 if Curr_Person^.Tabno=Tabno then
                    begin
                          RetVal:=Curr_Person^.FIO;
                          Break;
                    end;
                 Curr_Person:=Curr_Person^.NEXT;
            end;
         GetFio:=RetVal;
    end;
   function GetKategorija:Integer;
    var RetVal:integer;
        Curr_Person:Person_Ptr;
        KOsn:integer;

    begin
         KOsn   := 0;
         RetVal := 1;
         Curr_Person:=Head_Person;
         while Curr_Person<>NIl do
            begin
                 if Curr_Person^.Tabno=Tabno then
                    begin
                          RetVal:=Curr_Person^.KATEGORIJA;
                          Break;
                    end;
                 Curr_Person:=Curr_Person^.NEXT;
            end;
         Curr_Person:=Head_Person;
         while Curr_Person<>NIl do
            begin
                 if Curr_Person^.Tabno=Tabno then
                 if Curr_Person^.WID_RABOTY=OSN_WID_RABOTY then
                    begin
                          KOsn:=Curr_Person^.KATEGORIJA;
                          Break;
                    end;
                 Curr_Person:=Curr_Person^.NEXT;
            end;
         if KOsn>0 then RetVal:=KOsn;
         GetKategorija:=RetVal;
    end;
   procedure SetLgotyPn;
    var RetVal:integer;
        Curr_Person:Person_Ptr;
        Curr_Cn:CN_PTR;
        KOsn:integer;
        IsOsnLgota:integer;
    begin
         KOsn       := 0;
         RetVal     := 1;
         IsOsnLgota := 0;
         Curr_Person:=Head_Person;
         while Curr_Person<>NIl do
            begin
                 if Curr_Person^.Tabno=Tabno then
                    begin
                          if IsLgotyPN2011(Curr_Person) then
                             begin
                                  IsOsnLgota:=1;
                                  Break;
                             end;
                    end;
                 Curr_Person:=Curr_Person^.NEXT;
            end;
         Curr_Person:=Head_Person;
         while Curr_Person<>NIl do
            begin
                 if Curr_Person^.Tabno=Tabno then
                 if Curr_Person^.WID_RABOTY=OSN_WID_RABOTY then
                    begin
                          if IsLgotyPN2011(Curr_Person) then
                             begin
                                  IsOsnLgota:=1;
                                  Break;
                             end;
                          Break;
                    end;
                 Curr_Person:=Curr_Person^.NEXT;
            end;
         if (IsOsnLgota=1) then
            begin
                 MAKE_CN(Curr_Cn,Curr_Person);
                 Curr_Cn^.SHIFR:=LgotyPN2011Shifr+Limit_Cn_Base;
                 Curr_Cn^.KOD:=100;
            end;

    end;
   begin
        Make_Person(NewPerson);
        NewPerson^.FIO              := GetFio;
        NewPerson^.Dolg             := 'Перенос.';
        NewPerson^.TABNO            := TABNO;
        NewPerson^.GRUPPA           := 1;          { BUJDGET}
        NewPerson^.KATEGORIJA       := 1;          { PREPOD}
        NewPerson^.WID_RABOTY       := 2;          { OSN}
        NewPerson^.N_TEMY           := 'Перенос.';
        NewPerson^.MESTO_OSN_RABOTY := SHIFR_SERV(NSRV);
        NewPerson^.FROM             := SHIFR_SERV(NSRV);               {OTKUDA PRIBYL}
        W_P                         := NewPerson^.MESTO_OSN_RABOTY;
        NewPerson^.Bank             := 1; { Приват банк }
        NewPerson^.Nal_Code         :=  GetNal_CodePerson(Tabno);
        SetUpSowm(Tabno,W_P);

        if NeedAdd then
           case Gruppa of
             2 : begin
                      NewPerson^.GRUPPA := 11;  // 211 / 4
                     if ((NSRV>=150) and (NSRV<169)) then
                        NewPerson^.GRUPPA := 25;
                 end;
             3 : NewPerson^.GRUPPA := 3;   // ГН
             4 : NewPerson^.GRUPPA := 2;   // НИС
           else
             NewPerson^.GRUPPA := 1;
           end;
        if ShifrGru=ChernobSchet then
           begin
                 NewPerson.GRUPPA:=ChernobSchet;
                 NewPerson.PROFSOJUZ:=0;
                 MAKE_DOL_PERSON(NewPerson,1510);
           end;

        NewPerson^.KATEGORIJA:=GetKategorija;
        MakeGUID(NewPerson);

   end;
  function FindChernobPerson:PERSON_PTR;
   var Curr_Person:PERSON_PTR;
       Finded:boolean;
   begin
        Finded:=false;
        Result:=nil;
        Curr_Person:=HEAD_PERSON;
        while (Curr_Person<>Nil) do
         begin
              if Curr_Person^.Tabno=TABNO then
              if Curr_Person^.Gruppa=ChernobSchet then
              if GET_DOL_CODE(Curr_Person)=1510 then
                 begin
                      Finded:=True;
                      Result:=Curr_Person;
                      Break;
                 end;

              Curr_Person:=Curr_Person^.NEXT;
         end;
        if not Finded then
           Result:=nil;
//        Result:=finded;
   end;

  {    MoveOtpPerson }
  begin
       {-1 Проверить даты переноса}
       { -отключено 10 06 2012
       S:= 'select b.data_pere_bud,b.data_pere_vne,b.data_pere_gn,b.data_pere_nis from otpuska b where b.ShifrId=' + IntToStr(ShifrIDOtp);
       if not FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.StartTransaction;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add(S);
       FIB.pFIBQuery.ExecQuery;
       Data_Pere_Bud := FIB.pFIBQuery.Fields[0].AsDate;
       Data_Pere_Vne := FIB.pFIBQuery.Fields[1].AsDate;
       Data_Pere_Gn  := FIB.pFIBQuery.Fields[2].AsDate;
       Data_Pere_Nis := FIB.pFIBQuery.Fields[3].AsDate;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;

       if NeedAdd then
       case Gruppa of
        1:
          if (YearOf(Data_Pere_Bud)>2010) then
             begin
                  ShowMessage('Бюджетная часть отпускных уже перенесена '+DateToStr(Data_Pere_Bud));
                  Exit;
             end;
        2:
          if (YearOf(Data_Pere_Vne)>2010) then
             begin
                  ShowMessage('Внебюджетная часть отпускных уже перенесена '+DateToStr(Data_Pere_Vne));
                  Exit;
             end;
        3:
          if (YearOf(Data_Pere_GN)>2010) then
             begin
                  ShowMessage('ГНовская часть отпускных уже перенесена '+DateToStr(Data_Pere_GN));
                  Exit;
             end;
        4:
          if (YearOf(Data_Pere_NIS)>2010) then
             begin
                  ShowMessage('НИСовская часть отпускных уже перенесена '+DateToStr(Data_Pere_NIS));
                  Exit;
             end;
       end;

    -- конец отключения проверки переноса}


       { 0. Создать нового сотрудника, если нужно      }

       NewPerson := Nil;
       ChernobPerson:=Nil;
       if NeedNewPerson then
          begin
               if Not needAdd then Exit;     // Если только табель то выйти
               if ShifrGru=ChernobSchet then
                  ChernobPerson:=FindChernobPerson;
               if ChernobPerson=NIl then
                  CreateNewPerson;
          end;

       { 1. Прочитать другое подразделение, если нужно }
       Nsrv_Temp:=Nsrv;
       if (not Assigned(NewPerson)) and (ShifrPod>0) then        // Для нового сотрудника не проверять
       if ShifrPod<>NSRV then
          begin
               PutInf;
               EMPTY_ALL_PERSON;
               Nsrv:=ShifrPod;
               MKFLNM;
               GETINF(TRUE);
          end;
       S:=GUID;
       { 2. Найти сотрудника  }
       DateB       := EncodeDate(CurrYear,NMES,1);
       DateE       := EncodeDate(CurrYear,NMES,LenMonth(DateB));
       Finded      := false;
       if Assigned(NewPerson) then
          begin
                Finded      := true;
                Curr_Person := NewPerson;
          end;
       if Assigned(ChernobPerson) then
          begin
                Finded      := true;
                Curr_Person := ChernobPerson;
          end;

       if Not Finded then
          begin
               Curr_Person := HEAD_PERSON;
               while (Curr_Person<>Nil) do
                 begin
                      if Curr_Person^.Tabno         = Tabno    then
                      if Curr_Person^.Gruppa        = ShifrGru then
                      if Curr_Person^.Kategorija    = ShifrKat then
                      if Get_Dol_Code(Curr_Person)  = ShifrDol then
                      if AllTrim(Curr_Person^.Dolg) = AllTrim(Dolg) then
                      if GET_SWM_MODE_PERSON(Curr_Person) = ShifrSwmMode then
  //            if Curr_Person^.Wid_Raboty    = ShifrWR then
                      if GetGUIDPersonToString(Curr_Person)=GUID then
                      if ((IS_OSN_WID_RABOTY(Curr_Person) and  (ShifrWR=1)) or
                          (Not IS_OSN_WID_RABOTY(Curr_Person) and  (ShifrWR=2))) then
                           begin
                                Finded:=true;
                                Break;
                           end;
                      Curr_Person:=Curr_Person^.Next;
                 end;
          end;
       { Выйти если сотрудник не найден }
       if not finded then
          begin
               { Восстановить текущее подразделение }
               if ShifrPod<>Nsrv_Temp then
                   begin
                         EMPTY_ALL_PERSON;
                         Nsrv:=Nsrv_Temp;
                         MKFLNM;
                         GETINF(TRUE);
                   end;
               Exit
          end;
         List:=TList.Create;
         Updated := false;
{
         S:= 'select a.ShifrSta,summa_o_bud, summa_o_vne, summa_o_gn, summa_o_nis,'+
             ' Year_Za,Month_Za,a.o_day,b.ShifrId,b.f_data,b.l_data' +
             ' from otp_res a join otpuska b on a.ShifrIdOtp=b.ShifrId' +
             ' where b.ShifrId=' + IntToStr(ShifrIDOtp);
}
         FIB.pFIBQuery.SQL.Clear;
         S:='select a.ShifrSta,'+
            'case when a.need_pere_bud =1 and extract(year from cast(coalesce(a.data_pere_bud, ''1900-01-01'') as date))<2000 then summa_o_bud else 0 end as summa_o_bud,';
         FIB.pFIBQuery.SQL.Add(S);
         s:='case when a.need_pere_vne =1 and extract(year from cast(coalesce(a.data_pere_vne, ''1900-01-01'') as date))<2000 then summa_o_vne else 0 end as summa_o_vne,';
         FIB.pFIBQuery.SQL.Add(S);
         s:='case when a.need_pere_gn =1  and extract(year from cast(coalesce(a.data_pere_gn,  ''1900-01-01'') as date))<2000 then summa_o_gn  else 0 end as summa_o_gn,';
         FIB.pFIBQuery.SQL.Add(S);
         s:='case when a.need_pere_nis =1 and extract(year from cast(coalesce(a.data_pere_nis, ''1900-01-01'') as date))<2000 then summa_o_nis else 0 end as summa_o_nis,';
         FIB.pFIBQuery.SQL.Add(S);
         s:='Year_Za,Month_Za,a.o_day,b.ShifrId,b.f_data,b.l_data'+
            ' from otp_res a join otpuska b on a.ShifrIdOtp=b.ShifrId';
         FIB.pFIBQuery.SQL.Add(S);

         s:=' where b.ShifrId=' + IntToStr(ShifrIDOtp)+
            ' and ( '+
            ' (a.need_pere_bud = 1 and extract(year from cast(coalesce(a.data_pere_bud, ''1900-01-01'') as date))<2000 and abs(a.summa_o_bud)>0.01) or';
         FIB.pFIBQuery.SQL.Add(S);
         s:=' (a.need_pere_vne = 1 and extract(year from cast(coalesce(a.data_pere_vne, ''1900-01-01'') as date))<2000 and abs(a.summa_o_vne)>0.01) or';
         FIB.pFIBQuery.SQL.Add(S);
         s:=' (a.need_pere_gn  = 1 and extract(year from cast(coalesce(a.data_pere_gn,  ''1900-01-01'') as date))<2000 and abs(a.summa_o_gn)>0.01)  or';
         FIB.pFIBQuery.SQL.Add(S);
         s:=' (a.need_pere_nis = 1 and extract(year from cast(coalesce(a.data_pere_nis, ''1900-01-01'') as date))<2000 and abs(a.summa_o_nis)>0.01))';
         FIB.pFIBQuery.SQL.Add(S);
         if not FIB.pFIBQuery.Transaction.Active then
            FIB.pFIBQuery.Transaction.StartTransaction;

         try
            FormWait.Show;
            Application.ProcessMessages;
            FIB.pFIBQuery.ExecQuery;
            FormWait.Hide;
            Datefr:=date;
            DateTo:=DateFr;
            shifrSta:=1;
            while not FIB.pFIBQuery.Eof do
             begin
                  ShifrSta := FIB.pFIBQuery.Fields[0].AsInteger;
                  YearZa   := FIB.pFIBQuery.Fields[5].AsInteger;
                  MonthZa  := FIB.pFIBQuery.Fields[6].AsInteger;
                  O_Day    := FIB.pFIBQuery.Fields[7].AsInteger;
                  Summa    := FIB.pFIBQuery.Fields[Gruppa].AsFloat;
                  ShifrId  := FIB.pFIBQuery.Fields[8].AsInteger;
                  DateFr   := FIB.pFIBQuery.Fields[9].AsDate;
                  DateTo   := FIB.pFIBQuery.Fields[10].AsDate;
                  DecodeDate(DateFr,Y,M,D);
                  DecodeDate(DateTo,Y,M,D);
               // установить даты отпускных в Person
                  Curr_Person^.HOLIDAY[1,1,1]:=DayOf(DateFr);
                  Curr_Person^.HOLIDAY[1,1,2]:=MonthOf(DateFr);
                  Curr_Person^.HOLIDAY[1,1,3]:=YearOf(DateFr)-2000;
                  Curr_Person^.HOLIDAY[1,2,1]:=DayOf(DateTo);
                  Curr_Person^.HOLIDAY[1,2,2]:=MonthOf(DateTo);
                  Curr_Person^.HOLIDAY[1,2,3]:=YearOf(DateTo)-2000;
               // Перенести суммы отпусных
                  if abs(Summa)>0.009  then
                     begin
                          if NeedAdd then
                             begin
                                   Make_Add(Curr_Add,Curr_Person);
                                   Curr_Add^.Shifr    := ShifrSta;
                                   Curr_Add^.Period   := MonthZa;
                                   Curr_Add^.Year     := YearZa-1990;
                                   Curr_Add^.Summa    := Summa;
                                   Curr_Add^.FZP      := Summa;
                                   Curr_Add^.Work_Day := O_Day;
                                   Curr_Add^.Who      := ShifrId mod 60000;
                                   Updated := true;
                             end;
                          if (YearZa<>CurrYear) or (MonthZa<>NMES) then
                             begin
                                   Finded:=false;
                                   for i:=0 to List.Count-1 do
                                       if (PPeriodRec(List.Items[i])^.YearZa  = YearZa) and
                                          (PPeriodRec(List.Items[i])^.MonthZa = MOnthZa) then
                                          begin
                                               Finded:=true;
                                               break;
                                          end;
                                   if not Finded then
                                      begin
                                            New(PeriodRec);
                                            PeriodRec.YearZa  := YearZa;
                                            PeriodRec.MonthZa := MonthZa;
                                            List.Add(PeriodRec);
                                      end;
                             end;
                     end;
                  FIB.pFIBQuery.Next;
             end;
            FIB.pFIBQuery.Close;
         except
            MessageDlg('Ошибка SQL запроса',mtInformation, [mbOk], 0);
            Exit;
         end;
       if YearOf(DateFr)<2000 then
          // получить даты для корректировки табеля, если их нет
          begin
               FIB.pFIBQuery.SQL.Clear;
               S:='select first 1 a.f_data,a.l_data from otpuska a where a.shifrid='+intToStr(ShifrIDOtp);
               FIB.pFIBQuery.SQL.Add(S);
               try
                  FIB.pFIBQuery.ExecQuery;
                  DateFr:=FIB.pFIBQuery.Fields[0].AsDate;
                  DateTo:=FIB.pFIBQuery.Fields[1].AsDate;
               except
                  else
                 ShowMessage('Ошибка извлечения дат');
               end;
               FIB.pFIBQuery.Close;
          end;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       if Assigned(Curr_Person) then
 //      if NeedAdd               then
       if NeedCorrectBolnTabel(DateB,DateE,DateFr,DateTo) then
          begin
               I:=Curr_Person^.TABNO;
               if ((YearOf(DateFr)>2000) and (YearOf(DateTo)>2000)) then
                  begin
               // установить даты отпускных в Person
                         Curr_Person^.HOLIDAY[1,1,1]:=DayOf(DateFr);
                         Curr_Person^.HOLIDAY[1,1,2]:=MonthOf(DateFr);
                         Curr_Person^.HOLIDAY[1,1,3]:=YearOf(DateFr)-2000;
                         Curr_Person^.HOLIDAY[1,2,1]:=DayOf(DateTo);
                         Curr_Person^.HOLIDAY[1,2,2]:=MonthOf(DateTo);
                         Curr_Person^.HOLIDAY[1,2,3]:=YearOf(DateTo)-2000;
                  end;
               if ShifrSta<>13 then //Для компенсации не испр табель
                  Make_Otp_Tabel(Curr_Person,DateFr,DateTo);
               Calc_Naud_Person(Curr_Person,31);
          end;
 //      if not NeedAdd then
       for i:=1 to List.Count do
           begin
                 Debug_Mode:=0;
                 if not NeedAdd then
                 if (PPeriodRec(List.Items[i-1])^.YearZa=2009) and
                    (PPeriodRec(List.Items[i-1])^.MOnthZa=7)   then
                    Debug_Mode:=0;
                 if ((YearOf(DateFr)>2000) and (YearOf(DateTo)>2000)) then
                    begin
               // установить даты отпускных в Person
                         Curr_Person^.HOLIDAY[1,1,1]:=DayOf(DateFr);
                         Curr_Person^.HOLIDAY[1,1,2]:=MonthOf(DateFr);
                         Curr_Person^.HOLIDAY[1,1,3]:=YearOf(DateFr)-2000;
                         Curr_Person^.HOLIDAY[1,2,1]:=DayOf(DateTo);
                         Curr_Person^.HOLIDAY[1,2,2]:=MonthOf(DateTo);
                         Curr_Person^.HOLIDAY[1,2,3]:=YearOf(DateTo)-2000;
                    end;
                 { Расчет только для не блокированных }
                 if Curr_Person^.AUTOMATIC=Automatic_Mode then
                    begin
                         Recalc_Person_Sql(Curr_Person,PPeriodRec(List.Items[i-1])^.YearZa,PPeriodRec(List.Items[i-1])^.MonthZa,Debug_Mode);
                         if PPeriodRec(List.Items[i-1])^.MonthZa=NMES then
                            Calc_Naud_Person(Curr_Person,31)
                         else
                            begin
                                 FLAG_NAUD_FOR_OTHER_MONTH:=true;
                                 if Curr_Person^.Wid_Raboty=OSN_WID_RABOTY THEN
                                    Mode_Recalc:=0
                                 else
                                    Mode_Recalc:=1;
                                 Update_Podoh(Curr_Person,PPeriodRec(List.Items[i-1])^.MonthZa,PPeriodRec(List.Items[i-1])^.YearZa-1990,Mode_Recalc);
                                 PROF_PERSON(Curr_Person);
                                 FLAG_NAUD_FOR_OTHER_MONTH:=false;
                             end;
                    end;
           end;

{ ----- }
{ временно     }
{ SQL нужно поставит расчет профсоюзных взносов }
     //  Calc_Naud_Person(Curr_Person,31);
{ ----- }


     { Пометить отпускной как перенесеный }
       for i:=0 to List.Count-1 do
           Dispose(PPeriodRec(List.Items[i]));
       List.Free;
       if (Updated) and (NeedAdd) then
          begin
{
               CurrD  := Date;
               DeCodeDate(CurrD,Y,M,D);
               DatePS := IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
               case Gruppa of
                1 :
                    S:= 'update otpuska set data_pere_bud='''+DatePS+'''';
                2 :
                    S:= 'update otpuska set data_pere_vne='''+DatePS+'''';
                3 :
                    S:= 'update otpuska set data_pere_gn='''+DatePS+'''';
                4 :
                    S:= 'update otpuska set data_pere_nis='''+DatePS+'''';
                else
                    S:= 'update otpuska set data_pere='''+DatePS+'''';

               end;
               S:=S+' where shifrid='+IntToStr(ShifrIdOtp);
}
               S:='select first 1 retval from pr_setdotpmov('+IntToStr(ShifrIdOtp)+','+IntToStr(Gruppa)+')';
               if not FIB.pFIBQuery.Transaction.Active then
                  FIB.pFIBQuery.Transaction.StartTransaction;
               FIB.pFIBQuery.SQL.Clear;
               FIB.pFIBQuery.SQL.Add(S);
               try
                  FormWait.Show;
                  Application.ProcessMessages;
                  FIB.pFIBQuery.ExecQuery;
                  FormWait.Hide;
                  FIB.pFIBQuery.Close;
              except
                   ShowMessage('Ошибка записи даты переноса');
               end;
          end;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;

       if ShifrPod<>NSRV_Temp then
          begin
               PutInf;
               EMPTY_ALL_PERSON;
               Nsrv:=NSRV_TEMP;
               MKFLNM;
               GETINF(TRUE);
          end;

  end;

function ConvertUkrStrToSql(S:String):String;
 var I:integer;
     STo:string;
 begin

     STo:='';
     S:=trim(S);
     if length(S)>0 then
        for i:=1 to length(S) do
            begin
{                 if s[i]='''' then STo:=STo+'''';}
                 if s[i]='I' then S[i]:='І';
                 if s[i]='i' then S[i]:='і';
                 STo:=STo+S[i];
            end
     else
         STo:=S;

     Result:=STo;
 end;



function CompareUkrText(S1, S2: string): integer;
//массив, который заменит ASCI таблицу
const
  Chars: array[1..137] of char =
  ('1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D', 'E',
      'F', 'G',
    'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V',
      'W', 'X',
    'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
      'n', 'o',
    'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'А', 'Б', 'В', 'Г',
      'Ґ', 'Д',
    'Е', 'Ё', 'Є', 'Ж', 'З', 'И', 'І', 'Ї', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П',
      'Р', 'С',
    'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я', 'а',
      'б', 'в',
    'г', 'ґ', 'д', 'е', 'ё', 'є', 'ж', 'з', 'и', 'і', 'ї', 'й', 'к', 'л', 'м',
      'н', 'о',
    'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э',
      'ю', 'я',' ');

  function GetNum(C: char): integer;
    //динам. функция получения номера символа из нашего массива
  var
    i: integer;
  begin
    Result := 0;
    for i := 1 to 137 do
      if Chars[i] = C then
      begin
        Result := i;
        exit;
      end;
  end;

  function CompCh(C1, C2: integer): integer;
    //динам. функция определения "что больше???"
  begin
    if C1 = C2 then
      Result := 0
    else
    if C1 > C2 then
      Result := 1
    else
//    if C1 < C2 then
      Result := -1;
  end;
var
  i, xS1, xS2, CurrR: integer;
begin //начало функции сортировки
  Result := 0;
  CurrR := 0; //временный результат
  if S1 <> S2 then
  begin
    //сканирование сток посимвольно
    for i := 1 to Length(S1) do
    begin
      if Length(S2) >= i then
      begin
        xS1 := GetNum(S1[i]);
        xS2 := GetNum(S2[i]);
        if (xS1 <> 0) and (xS2 <> 0) and (xS1 <> xS2) then
          CurrR := CompCh(xS1, xS2)
        else
        begin
          if (xS1 = 0) or (xS2 = 0) then
          begin
            if xS2 = 0 then
              CurrR := 1;
            if xS1 = 0 then
              CurrR := -1;
          end;
        end;
        if CurrR <> 0 then
        begin
          Result := CurrR;
          Exit;
        end;
      end
      else
      begin
        Result := CurrR;
        Exit;
      end;
    end;
  end;
end;

function ReplCommaOnPoint(src:string):string;
var dst:string;
    i:integer;
    ch:char;
begin
     dst:=src;
     if length(trim(src))>0 then
        begin
             for i:=1 to length(src) do
                 begin
                      ch:=src[i];
                      if ch=',' then dst[i]:='.';
                 end;
        end;
     Result:=Dst;
end;



function IsOLEObjectInstalled(Name: String): boolean;
var
  ClassID: TCLSID;
  Rez : HRESULT;
begin
  // Ищем CLSID OLE-объекта
  Rez := CLSIDFromProgID(PWideChar(WideString(Name)), ClassID);

  if Rez = S_OK then  // Объект найден
    Result := true
  else
    Result := false;
end;

function IsExcelInstalled: boolean;
 begin
      if not IsOLEObjectInstalled('Excel.Application') then
         Result:=false
      else
         Result:=true
 end;

 FUNCTION GET_PROG_MIN(Y:Integer;W_NMES:INTEGER):REAL;
  var ProgMin : Real;
  BEGIN
       if ((y>0) and  (y<100)) then y:=y+1990;
       if (y<=0) then y:=CURRYEAR;
       if (W_NMES<1) or (W_NMES>12) then w_nmes:=NMES;
       ProgMin:=SSLimityList.GetProgMin(y,w_nmes);
       GET_PROG_MIN:=ProgMin;

  end;
 FUNCTION GET_LIMIT_FOR_PENS(Y:Integer;W_NMES:INTEGER):REAL;
  var LimitECB : Real;
  BEGIN
       if ((y>0) and  (y<100)) then y:=y+1990;
       if (y<=0) then y:=CURRYEAR;
       if (W_NMES<1) or (W_NMES>12) then w_nmes:=NMES;
       LimitECB:=SSLimityList.GetLimitForECB(y,w_nmes);
       GET_LIMIT_FOR_PENS:=LimitECB;
  END;

{
 FUNCTION GET_MIN_SALARY(W_NMES:INTEGER):REAL;
  BEGIN
       IF (W_NMES<1) OR (W_NMES>12) THEN GET_MIN_SALARY:=500
                                    ELSE GET_MIN_SALARY:=PARSAL[1,W_NMES]
  END;
}
 FUNCTION GET_MIN_SALARY(Y:Integer;W_NMES:INTEGER):REAL;
  var MinSal:real;
  BEGIN
       if ((y>0) and  (y<100)) then y:=y+1990;
       if (y<=0) then y:=CURRYEAR;
       if (W_NMES<1) or (W_NMES>12) then w_nmes:=NMES;
       MinSal:=SSLimityList.GetMinSal(y,w_nmes);
       GET_MIN_SALARY:=MinSal;
  END;

  function IsPensionerByDate(Curr_Person:Person_Ptr):boolean;
   var PolS,S:string;
       Days,I,AgeY,Years:integer;
       Date01011900,DateBirth,CurrDate:TDateTime;

   begin
        if length(Curr_Person^.NAL_CODE)<>10  then
           begin
                IsPensionerByDate:=false;
                Exit;
           end;
        PolS:=copy(Curr_Person^.NAL_CODE,9,1);
        if not (PolS[1] in ['0'..'9']) then
           begin
                IsPensionerByDate:=false;
                Exit;
           end;
        S:=Copy(Curr_Person^.NAL_CODE,1,5);
        val(S,Days,I);
        if i<>0 then
           begin
                IsPensionerByDate:=false;
                Exit;
           end;
        CurrDate:=EnCodeDate(CurrYear,NMES,1);
        if PolS[1] in ['0','2','4','6','8'] then AgeY:=55
                                            else AgeY:=60;
        Date01011900:=EnCodeDate(1900,1,1);
        DateBirth:=IncDay(Date01011900,Days);
        Years:=trunc(YearSpan(DateBirth,CurrDate));
        if Years>=AgeY then IsPensionerByDate:=true
                       else IsPensionerByDate:=false;
   end;

//******************************************************************************
// Функция для перевода слова, связанного с числительным в соответствующий падеж
function GeniCase(const S : String; C1,C2,C3 : String): String;
var
    Det1,Det2:Integer;
begin
     Det2:=StrToIntDef(Copy(S,Length(S)-1,2),0);
     Det1:=Det2 mod 10;
     if (Det1=1) and not(Det2=11) then
        GeniCase:=C1
     else
         if (Det1>1) and (Det1<5) and not( (Det2>11) and (Det2<15) ) then
            GeniCase:=C2
         else
            GeniCase:=C3;
end;

function NumeralToPhrase(const SVal: real;Mode:integer=0;ShortMode:boolean=false) : String;
const
     DigitsF: array[1..10] of String = (
                                        '',
                                        'одна ',
                                        'две ',
                                        'три ',
                                        'четыре ',
                                        'пять ',
                                        'шесть ',
                                        'семь ',
                                        'восемь ',
                                        'девять '
                                       );
     DigitsFUkr: array[1..10] of String = (
                                        '',
                                        'одна ',
                                        'дві ',
                                        'три ',
                                        'чотири ',
                                        'п''ять ',
                                        'шість ',
                                        'сім ',
                                        'вісім ',
                                        'дев''ять '
                                       );
     DigitsM: array[1..3] of String = (
                                       '',
                                       'один ',
                                       'два '
                                      );
     Teens: array[1..10] of String = (
                                      'десять ',
                                      'одиннадцать ',
                                      'двенадцать ',
                                      'тринадцать ',
                                      'четырнадцать ',
                                      'пятнадцать ',
                                      'шестнадцать ',
                                      'семнадцать ',
                                      'восемнадцать ',
                                      'девятнадцать '
                                     );
     TeensUkr: array[1..10] of String = (
                                      'десять ',
                                      'одинадцять ',
                                      'дванадцять ',
                                      'тринадцять ',
                                      'чотирнадцять ',
                                      'п''ятнадцять ',
                                      'шістнадцять ',
                                      'сімнадцять ',
                                      'вісімнадцять ',
                                      'дев''ятнадцять '
                                     );
     Tens: array[1..10] of String = (
                                     '',
                                     '',
                                     'двадцать ',
                                     'тридцать ',
                                     'сорок ',
                                     'пятьдесят ',
                                     'шестьдесят ',
                                     'семьдесят ',
                                     'восемьдесят ',
                                     'девяносто '
                                    );
     TensUkr: array[1..10] of String = (
                                     '',
                                     '',
                                     'двадцять ',
                                     'тридцять ',
                                     'сорок ',
                                     'п''ятьдесят ',
                                     'шістьдесят ',
                                     'сімдесят ',
                                     'вісімдесят ',
                                     'дев''яносто '
                                    );
     Hundreds: array[1..10] of String = (
                                         '',
                                         'сто ',
                                         'двести ',
                                         'триста ',
                                         'четыреста ',
                                         'пятьсот ',
                                         'шестьсот ',
                                         'семьсот ',
                                         'восемьсот ',
                                         'девятьсот '
                                        );
     HundredsUkr: array[1..10] of String = (
                                         '',
                                         'сто ',
                                         'двісті ',
                                         'триста ',
                                         'чотириста ',
                                         'п''ятьсот ',
                                         'шістьсот ',
                                         'сімсот ',
                                         'вісімсот ',
                                         'дев''ятьсот '
                                        );
var
   I,
   L,
   R,
   V,
   P,
   KOP :Integer;
   C,S : String;
  function GetHundreds(i:Integer):string;
    begin
         if Mode=0 then
            GetHundreds:=Hundreds[i]
         else
            GetHundreds:=HundredsUkr[i];
    end;
  function GetDigitsF(i:Integer):string;
    begin
         if Mode=0 then
            GetDigitsF:=DigitsF[i]
         else
            GetDigitsF:=DigitsFUkr[i];
    end;
  function GetTeens(i:Integer):string;
    begin
         if Mode=0 then
            GetTeens:=Teens[i]
         else
            GetTeens:=TeensUkr[i];
    end;
  function GetTens(i:Integer):string;
    begin
         if Mode=0 then
            GetTens:=Tens[i]
         else
            GetTens:=TensUkr[i];
    end;
  function GetNames(k,i:integer):string;
   begin
        Result:='';
        if Mode=1 then
           case (K) of
             4: Result:= GeniCase( C[I],
                                       'тисяча ',
                                       'тисячі ',
                                       'тисяч ');
             7: Result:= GeniCase( C[I],
                                       'мільон ',
                                       'мільона ',
                                       'міліонів ');
            10: Result:= GeniCase( C[I],
                                       'міліард ',
                                       'міліарда ',
                                       'міліардів ');
            13: Result:= GeniCase( C[I],
                                       'трильон ',
                                       'трильона ',
                                       'трильона ');
            16: Result:= GeniCase( C[I],
                                       'квадрильон ',
                                       'квадрильона ',
                                       'квадрильонів ');
            19: Result:= GeniCase( C[I],
                                       'квінтільон ',
                                       'квінтільона ',
                                       'квінтільонів ');
            22: Result:= GeniCase( C[I],
                                       'секстільон ',
                                       'секстільона ',
                                       'секстільонів ');
            25: Result:= GeniCase( C[I],
                                       'септільон ',
                                       'септільона ',
                                       'септільонів ');
            end
        else
        case (K) of
             4: Result:= GeniCase( C[I],
                                       'тысяча ',
                                       'тысячи ',
                                       'тысяч ');
             7: Result:= GeniCase( C[I],
                                       'миллион ',
                                       'миллиона ',
                                       'миллионов ');
            10: Result:= GeniCase( C[I],
                                       'миллиард ',
                                       'миллиарда ',
                                       'миллиардов ');
            13: Result:= GeniCase( C[I],
                                       'триллион ',
                                       'триллиона ',
                                       'триллионов ');
            16: Result:= GeniCase( C[I],
                                       'квадриллион ',
                                       'квадриллиона ',
                                       'квадриллионов ');
            19: Result:= GeniCase( C[I],
                                       'квинтиллион ',
                                       'квинтиллиона ',
                                       'квинтиллинов ');
            22: Result:= GeniCase( C[I],
                                       'секстиллион ',
                                       'секстиллиона ',
                                       'секстиллионов ');
            25: Result:= GeniCase( C[I],
                                       'септиллион ',
                                       'септиллиона ',
                                       'септиллионов ');
        end;

   end;
begin
     i:=round(Int(SVal));
     S:=trim(IntToStr(I));
     KOP:=round((SVal-Int(SVal))*100);
     C:=S;
     L:=Length(C);
     P:=0;
     Result:='';
     for I:=1 to L do
         begin
              R:=(L - I + 1) mod 3;
              V:=StrToIntDef(Copy(C,I,1),0);
              case R of
                   0:
                     begin
                          Result:=Result + GetHundreds(V+1);
                          if (V>0) then
                             Inc(P);
                     end;
                   1:
                     begin
                          if (V>0) then
                             Inc(P);
                          if (V > 2) then
                             Result := Result + GetDigitsF(V+1)
                          else
                              if ((L - i) = 3) then
                                 Result := Result + GetDigitsF(V+1)
                              else
                                  Result := Result + DigitsM[V+1];
 //                                 Result := Result + GetDigitsF(V+1);
                          if P > 0 then
                             Result := Result + GetNames(L-I+1,I);
                          P:=0;
                     end;
                   2:
                     begin
                          if (V <> 1) then
                             Result:= Result + GetTens(V+1)
                          else
                              begin
                                   Result:= Result +
                                            GetTeens(StrToIntDef(Copy(C,I+1,1),0)+1);
                                   Delete(C,I+1,1);
                                   Insert('0',C,I+1);
                              end;
                          if (V>0) then
                             Inc(P);
                     end;
              end;
         end;
     Result:=Trim(Result);
     if (Result='') then
        Result:='ноль';
     Result:=AnsiUpperCase(Result[1])+Copy(Result,2,Length(Result)-1);
     if not ShortMode then
     if Mode=0 then
        Result:=Trim(Result)+' руб. '+trim(IntToStr(KOP))+' коп.'
     else
        Result:=Trim(Result)+' грн. '+trim(IntToStr(KOP))+' коп.';
end;


function IsSecretTabno(Tabno:integer):boolean;
 begin
      if SecretTabnoList.IsPodrInList(Tabno) then
         Result:=true
      else
         Result:=false;
 end;

function IsSecretPodr(ServNo:integer):boolean;
 var retVal:Boolean;
 begin
      retVal:=False;
      if (ServNo=76) or
         (ServNo=81) or
         (ServNo=98) or
         (ServNo=102) or
         (ServNo=140) or
         (ServNo=157) then
         retVal:=True;
      IsSecretPodr:=retVal;
 end;


function NeedCodePersonLine(Tabno:integer):boolean;
 begin
      Result:=false;
      Exit;           // Пока с 26 11 2014 - не кодировать
      if SecretTabnoList.IsPodrInList(Tabno) then
{
         if not (BuhAccesBayList.IsPodrInList(NSRV) and
                 BuhBayList.IsPodrInList(NSRV)
                 ) then
}
         if not (BuhBayList.IsPodrInList(NSRV) or
                 BuhDopPodrList.IsPodrInList(NSRV)
                 ) then
          if (CurrRight<4) then
            Result := true;
 end;

 procedure DeleteAllFromTmpBolnTables;
  begin
         FIB.pFIBDatabaseSal.Execute('DELETE FROM TMP_BOLN_SUMMY');
         FIB.pFIBDatabaseSal.Execute('DELETE FROM TMP_BOLNA');
         FIB.pFIBDatabaseSal.Execute('DELETE FROM TMP_BOLN_RES');
  end;

 procedure DeleteAllFromTmpPersonTables;
  begin
         FIB.pFIBDatabaseSal.Execute('DELETE FROM tb_tmp_person');
         FIB.pFIBDatabaseSal.Execute('DELETE FROM tb_tmp_fadd');
         FIB.pFIBDatabaseSal.Execute('DELETE FROM tb_tmp_fcn');
         FIB.pFIBDatabaseSal.Execute('DELETE FROM tb_tmp_fud');
         FIB.pFIBDatabaseSal.Execute('DELETE FROM tb_tmp_tabel');
  end;

 procedure DeleteAllFromTmpOtpTables;
  begin
         FIB.pFIBDatabaseSal.Execute('DELETE FROM TMP_OTP_ADD');
         FIB.pFIBDatabaseSal.Execute('DELETE FROM TMP_OTP_SUMMY');
         FIB.pFIBDatabaseSal.Execute('DELETE FROM TMP_OTP_RES');
  end;
  function IsShifrInAddPerson(Curr_Person:Person_Ptr;WantedShifr:integer):boolean;
   var Curr_Add:Add_Ptr;
   begin
        IsShifrInAddPerson:=false;
        Curr_Add:=Curr_Person^.ADD;
        while (Curr_Add<>Nil) do
         begin
              if Curr_add^.Shifr=WantedShifr then
                 begin
                      IsShifrInAddPerson:=true;
                      break;
                 end;
              Curr_Add:=Curr_Add^.NEXT;
         end;
   end;

 function GetGUID(var S:String;var Summa1,Summa2,Summa3:Real):boolean;
  var hour,min,sec,msec:word;
      year,mon,day:word;
      ir:word;
      dt:TDateTime;
      a1,a2,a3 : real;
      i1 :integer absolute a1;
      i2 :integer absolute a2;
      i3 :integer absolute a3;
  begin
        dt:=Now;
        DecodeTime(Dt,Hour,Min,Sec,MSec);
        DecodeDate(Dt,Year,Mon,Day);
        FillChar(S,0,SizeOf(S));
        s[0]:=chr(8);
        s[1]:=chr(byte(MSec));
        s[2]:=chr(byte(sec));
        s[3]:=chr(byte(min));
        s[4]:=chr(byte(hour));
        s[5]:=chr(byte(day));
        s[6]:=chr(byte(mon));
        s[7]:=chr(lo(year));
        s[8]:=chr(hi(year));
        ir:=Random(60000);
        msec:=msec mod 256;
        i2:=msec+sec*256+min*256*256+hour*256*256*256;
        i3:=day+mon*256+year*256*256;
     //   summa2:=a2;
     //   summa3:=a3;
        summa2:=i2;
        summa3:=i3;
        summa1:=ir;
        Result:=true;

  end;
(*
  function  FormatGUID(S:String;Summa1:real):string;
   var RetVal:String;
       ir:word;
   begin
        ir:=round(Summa);
        RetVal:='';
        RetVal:=IntToStr(Ord(s[8])*256+Ord(s[7]))+'-'+
                IntToStr(Ord(s[6]))+'-'+
                IntToStr(Ord(S[5]))+' '+
                IntToStr(Ord(S[4]))+':'+
                IntToStr(Ord(S[3]))+':'+
                IntToStr(Ord(S[2]))+':'+
                IntToStr(Ord(S[1]))+' '+
                IntToStr(Ir);
        Result:=RetVal;
   end;
*)
  function  FormatGUID(S:String;Summa1,Summa2,Summa3:real):string;
   var RetVal:String;
       ir:word;
       a1,a2,a3 : real;
       i1 :integer absolute a1;
       i2 :integer absolute a2;
       i3 :integer absolute a3;
       hour,min,sec,msec:integer;
       year,mon,day:integer;
   begin
        ir:=round(Summa1);
        RetVal:='';
//        a2:=Summa2;
//        a3:=Summa3;
        i2:=round(Summa2);
        i3:=round(Summa3);
        hour:=i2 div (256*256*256);
        min:=i2 div (256*256)-hour*256;
        sec:=i2 div 256-min*(256)-hour*(256*256);
        MSec:=i2 mod 256;
        year:=i3 div (256*256);
        mon:=i3 div 256 - year*256;
        day:=i3 mod 256;
        RetVal:=IntToStr(year)+'-'+
                IntToStr(mon)+'-'+
                IntToStr(day)+' '+
                IntToStr(hour)+':'+
                IntToStr(min)+':'+
                IntToStr(sec)+':'+
                IntToStr(msec)+' '+
                IntToStr(Ir);
        Result:=RetVal;
   end;

  procedure MakeGUID(Curr_Person:Person_Ptr);
   var Curr_Cn:Cn_Ptr;
       S:String[8];
       a1,a2,a3:real;
       i:integer;
       finished:boolean;
   begin
        while true do
          begin
                finished:=true;
                curr_cn:=curr_person^.CN;
                while (curr_cn<>nil) do
                 begin
                      if curr_cn^.shifr=guidshifr+limit_cn_base then
                         begin
                              del_cn(curr_cn,curr_person);
                              finished:=false;
                              break;
                         end;
                      curr_cn:=curr_cn^.Next;   
                 end;
                 if finished then
                    break;
         end;           
        GetGUID(S,A1,a2,a3);
        Make_Cn(Curr_Cn,Curr_Person);
        Curr_Cn^.SHIFR:=GUIDShifr+Limit_CN_Base;;
        Curr_Cn^.Kod:=100;
        Curr_Cn^.SUMMA:=a1;
//        Curr_Cn^.PRIM_1:=S;
        Curr_Cn^.PRIM_1:='Уник';
        Curr_Cn^.FLOW_SUMMA:=a2;
        Curr_Cn^.LIMIT_SUMMA:=a3;
        i:=count_cn(Curr_Person);
   end;
  procedure putGUIDToPerson(Curr_Person:PERSON_PTR;summa1:Real;summa2:Real;summa3:real);
   var Curr_Cn:Cn_Ptr;
       S:String[8];
       a1,a2,a3:real;
       i:integer;
   begin
      REPEAT
      UNTIL NOT DEL_WANTED_CN(GUIDShifr,CURR_PERSON);
      REPEAT
      UNTIL NOT DEL_WANTED_CN(GUIDShifr+LIMIT_CN_BASE,CURR_PERSON);

        a1:=summa1;
        a2:=summa2;
        a3:=summa3;
        Make_Cn(Curr_Cn,Curr_Person);
        Curr_Cn^.SHIFR:=GUIDShifr+Limit_CN_Base;
        Curr_Cn^.Kod:=100;
        Curr_Cn^.SUMMA:=a1;
//        Curr_Cn^.PRIM_1:=S;
        Curr_Cn^.PRIM_1:='Уник';
        Curr_Cn^.FLOW_SUMMA:=a2;
        Curr_Cn^.LIMIT_SUMMA:=a3;
        i:=count_cn(Curr_Person);
   end;
PROCEDURE MAKE_PERSON_STATE(CURR_PERSON:PERSON_PTR);
 VAR I:INTEGER;
     Current_Day:integer;
     Dt:TDateTime;
     Y,M,D:word;
 BEGIN
      dt:=date;
      DecodeDate(dt,y,m,d);
      Current_Day:=d;
      IF CURR_PERSON^.STATE=PERSON_PENSIJA_STATE THEN EXIT;
      IF CURR_PERSON^.STATE=PERSON_UWOLEN_STATE  THEN EXIT;
      IF (CURR_PERSON^.STATE<1)                    OR
         (CURR_PERSON^.STATE>MAX_PERSON)           OR
         (CURR_PERSON^.STATE=PERSON_ILLNESS_STATE) OR
         (CURR_PERSON^.STATE=PERSON_OTPUSK_STATE)  OR
         (CURR_PERSON^.STATE=PERSON_UCHEBN_STATE)  THEN
          CURR_PERSON^.STATE:=PERSON_WORK_STATE;
      CASE CURR_PERSON^.TABEL[CURRENT_DAY] OF
         TARIFN_OTPUSK : CURR_PERSON^.STATE:=PERSON_OTPUSK_STATE;
          ILLNESS      : IF CURR_PERSON^.STATE<>PERSON_DEKRET_BOLN_STATE THEN
                           CURR_PERSON^.STATE:=PERSON_ILLNESS_STATE;
         UCHEBN_OTPUSK :CURR_PERSON^.STATE:=PERSON_UCHEBN_STATE;
         OTP_G_DO_GODA :CURR_PERSON^.STATE:=PERSON_DEKRET_STATE;
         JAWKA         :CURR_PERSON^.STATE:=PERSON_WORK_STATE;
         KOMANDIROWKA  :CURR_PERSON^.STATE:=PERSON_WORK_STATE;
         GOS_OB        :CURR_PERSON^.STATE:=PERSON_WORK_STATE;
         BEREM_OTPUSK  :CURR_PERSON^.STATE:=PERSON_DEKRET_BOLN_STATE;
         NEZAPOLN      :CURR_PERSON^.STATE:=PERSON_UWOLEN_STATE;
      END;
 END;

 function MakeArchivForData(wantedMonth:integer):string;
  var Kz:integer;
      CmdString:string;
      ModeArc:(arj,z7);
      ArchivatorName:string;
      DaDir:string;
      ArcName:String;
      S   : string;
      Ini : TIniFile ;
      ModeArcS : string;
      ApplicationExePath:string;
      CurrentDir:string;
      SavedDir:string;
      SavedDrive:string;
      tmpNMES:integer;
  procedure MakeArcName;
   const mns:array [1..12] of string=('ja','fe','mr','ap','ma','jn','jl','au','se','oc','no','de');
   var i,l:integer;
       y,m,d:word;
       dt:TDateTime;
       fn:string;
       ys,ms,ds,ist,s:string;
       Finded : boolean;
   begin
        finded:=false;
        dt:=Date;
        DecodeDate(dt,y,m,d);
        ds:=IntToStr(d);
        if d<10 then ds:='0'+ds;
        ms:=IntToStr(m);
        if m<10 then ms:='0'+ms;
        ys:=intToStr(y-2000);
        fn:=ds+ms;
        for i:=1 to 999 do
            begin
                 s   := mns[wantedMonth];
                 if i>1 then s:=s[1];
                 ist := IntToStr(I-1);
                 l   := length(ist);
                 fn  := ds+ms+ys+s;
                 if (i>1)  then
                    begin
                        fn  := copy(fn,1,length(fn))+ist;
                    end;
        //         fn  := fn+'.arj';
                 if ModeArc=z7 then fn  := fn+'.zip'
                 else fn  := fn+'.arj';
                 if not FileExists(DaDir+'\'+fn) then
                    begin
                          Finded:=true;
                          break;
                    end;
            end;
        if Finded then ArcName:=fn
                  else ArcName:='';

   end;
  begin
     MakeArchivForData:='';
//     S   := Application.ExeName;
//     ApplicationExePath:=ExtractFilePath(s);
//     S   := copy(S,1,length(s)-3)+'ini';
     s   := getIniFileName;
     Ini := TIniFile.Create(S);
     try
         ModeArcS := Ini.ReadString( 'Parameters', 'ModeArc', 'arj' );
     finally
         Ini.Free;
     end;
    if ModeArcS='7z' then ModeArc:=z7 else ModeArc:=arj;
    ArchivatorName:='arj.exe';
    if ModeArc=z7 then ArchivatorName:='7za.exe';
    ArchivatorName:=ApplicationExePath+ArchivatorName;

    if not FileExists(ArchivatorName) then
       begin
            Error('Отсутствует архиварор '+ArchivatorName);
            MakeArchivForData:='';
            Exit;
       end;
    tmpNMES:=NMES;
    NMES:=wantedMonth;
    MKFLNM;
    DaDir:=ExtractFileDir(FNINF);
    NMES:=tmpNMES;
    MKFLNM;
    MakeArcName;
    if length(trim(ArcName))<6 then
       begin
           ShowMessage('Ошибка создания имени архива ');
           MakeArchivForData:='';
           Exit;
       end;
    getDir(0,SavedDir);
    ChDir(DaDir);
    if ModeArc=arj then
//       CmdString:=ArchivatorName+' a '+DaDir+'\'+ArcName+' '+DaDir+'\*.dat'
       CmdString:=ArchivatorName+' a '+ArcName+' '+'*.dat'
    else
//       CmdString:=ArchivatorName+' a -tzip '+DaDir+'\'+ArcName+' '+DaDir+'\*.dat';
       CmdString:=ArchivatorName+' a -tzip '+ArcName+'*.dat';
    Kz:=WinExecAndWait32(CmdString, 1);
    ChDir(SavedDir);
    MakeArchivForData:=ArcName;
    if (Kz>0) and (KZ<32) then
       begin
          ShowMessage('Ошибка архивирования данных '+IntToStr(Kz));
          MakeArchivForData:='';
       end;
  end;
function CodeReasonILL(SrcCode:integer):integer;
 var RetVal : integer;
 begin
      RetVal:=1;
      case SrcCode of
        1 : RetVal :=  3;
        2 : RetVal :=  5;
        3 : RetVal :=  6;
        4 : RetVal :=  7;
        5 : RetVal :=  8;
        6 : RetVal :=  9;
        7 : RetVal := 10;
        8 : RetVal := 12;  { Несч случай }
      end;
      CodeReasonILL:=RetVal;
 end;

function DeCodeReasonILL(SrcCode:integer):integer;
 var RetVal : integer;
 begin
      RetVal:=1;
      case SrcCode of
        3 : RetVal :=  1+1;
        5 : RetVal :=  2+1;
        6 : RetVal :=  3+1;
        7 : RetVal :=  4+1;
        8 : RetVal :=  5+1;
        9 : RetVal :=  6+1;
       10 : RetVal :=  7+1;
       12 : RetVal :=  8+1;     { Несч случай }
{
       3: RetVal := 2;
       5: RetVal := 3;
       6: RetVal := 4;
       7: RetVal := 5;
       8: RetVal := 6;
       9: RetVal := 7;
      10: RetVal := 8;
}
      end;
      Dec(RetVal);
      DeCodeReasonILL:=RetVal;
 end;

function IsLgotyPN2011(CURR_PERSON:PERSON_PTR):boolean;
  var RetVal:boolean;
      Curr_Cn:Cn_Ptr;
  begin
      RetVal:=false;
{$IFDEF SVDN}
      if (Curr_Person=nil) then
         begin
              IsLgotyPN2011:=false;
              Exit;
         end;
      Curr_Cn:=Curr_Person^.Cn;
      while (Curr_Cn<>Nil) do
       begin
            if Curr_Cn^.Shifr=Limit_Cn_Base+LgotyPn2011Shifr then
            if Curr_Cn^.Kod=100                              then
               begin
                    RetVal:=true;
                    Break;
               end;
            Curr_Cn:=Curr_Cn^.Next;
       end;
{$ENDIF}
      IsLgotyPN2011:=RetVal;
  end;

function IsSciPed(Curr_Person:Person_Ptr):boolean;
 var RetVal:boolean;
     e1,e2,e3:Boolean;
     i1:Integer;
 begin
      RetVal:=false;
      if (Curr_Person^.Tabno=326) and (NSRV=91) then
         Curr_Person^.Tabno:=326;
      i1:=GetOsnKateg(Curr_Person);
      e2:=IsColedgPodr(Nsrv);
      e3:=IS_NotFond5(Curr_Person);
      if ((i1=TEACHER_KATEGORIJA) or (i1=SCIENTIFIC_WORKER_KATEGORIJA)) and
         (not IsColedgPodr(Nsrv)) and {УБРАТЬ ТЕХНИКУМ}
         (not IS_NotFond5(Curr_Person)) then RetVal:=true
                                        else
      if Is_Fond5(Curr_Person) then RetVal:=true;
      IsSciPed:=RetVal;

 end;


 function CalcECB(Curr_Person : Person_Ptr;
                     W_Place     : integer;
                     Start_Month : integer;
                     Start_Year  : integer;
                     ECBNNach   ,
                     ECBNUd     ,
                     ECBNach    ,
                     ECBUd      ,
                     ECBDPNAch  ,
                     ECBDPUd    ,
                     ECBIllNach ,
                     ECBIllUd   ,
                     ECB_Self_Nach ,
                     ECB_Self_Ud   : real):real;
  var RetVal:real;
      LimitForECB:real;
      P:real;
      WantedECBShifr:integer;
      Summa,ECBNalog:Real;
      MaxECBN,MaxECB,MaxECBDP,MaxECBIll:real;
      TmpECB:real;
      a,b,c,d:real;
  procedure SetUpMaxECBs;
   begin
        if ECBNNach>LimitForECB then
           begin
                MaxECBN   := LimitForECB;
                MaxECB    := 0 ;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := LimitForECB-ECBNNach;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach+ECBDPNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := ECBNach;
                MaxECBDP  := LimitForECB-(ECBNNach+ECBNach);
                MaxECBIll := 0 ;
           end
        else
           if ECBNNach+ECBNach+ECBDPNach+ECBIllNach>LimitForECB then
              begin
                   MaxECBN   := ECBNNach;
                   MaxECB    := ECBNach;
                   MaxECBDP  := ECBDPNach;
                   MaxECBIll := LimitForECB-(ECBNNach+ECBNach+ECBDPNach);
              end;
           if WantedECBShifr=143 then
              begin
                   if ECB_Self_Nach > MaxECBN then
                      ECB_Self_Nach := MaxECBN;
              end;
           if WantedECBShifr=142 then
              begin
                   if ECB_Self_Nach > MaxECB then
                      ECB_Self_Nach := MaxECB;
              end;
    end;
  begin
  //     if Curr_Pens_Month<>Start_Month then
  //        if not FILL_PENS(START_MONTH) then
  //          ERROR('Нет данных для ЕСВ по пенсионному налогу за '+IntToStr(Start_Month));

       Summa:=ECB_Self_Nach;
       ECBNalog:=0;
       P:=GetProcECBNalog(CURR_PERSON,Summa,ECBNalog,START_MONTH,START_YEAR,WantedECBShifr);
       RetVal:=0;
       LimitForEcb:=SSLimityList.GetLimitForECB(CURRYEAR,Start_Month);
       MaxECBN   := ECBNNach   ;
       MaxECB    := ECBNach    ;
       MaxECBDP  := ECBDPNach  ;
       MaxECBIll := ECBIllNach ;
       if (ECBNNach+ECBNach+ECBDPNach+ECBIllNach)<=LimitForECB then
          if Dog_Pod_Podrazd(W_Place) then
             RetVal:=Sum(ECB_Self_Nach*0.026)
          else
             RetVal:=Sum(ECB_Self_Nach*P)
       else
          if (ECBNNach+ECBNach+ECBDPNach+ECBIllNach-ECB_Self_Nach)>LimitForECB then
             begin
                  SetUpMaxECBs;
                  TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc+MaxECBDp*ECBDPProc+MaxECBIll*ECBIllProc);
                  if TmpECB<=ECBNUd+ECBUd+ECBDPUd+ECBIllUd+0.005 then
                     if Curr_Person^.Wid_Raboty<>Osn_Wid_Raboty then
                        RetVal:=0
                     else
//                        RetVal:=r10(TmpECB-(ECBNUd+ECBUd+ECBDPUd+ECBIllUd))
                        RetVal:=r10(TmpECB)
                  else
                  if ((TmpECB-(ECBNUd+ECBUd+ECBDPUd+ECBIllUd))>R10(ECB_Self_Nach*p)) then
                     if Curr_Person^.Wid_Raboty=Osn_Wid_Raboty then
                        RetVal:=r10(TmpECB-(ECBNUd+ECBUd+ECBDPUd+ECBIllUd))
                     else
                        RetVal:=R10(ECB_Self_Nach*p)
                  else
                     RetVal:=r10(TmpECB-(ECBNUd+ECBUd+ECBDPUd+ECBIllUd));
             end
          else
             if ((ECBNNach+ECBNach+ECBDPNach+ECBIllNach)>LimitForECB) and
                 ((ECBNNach+ECBNach+ECBDPNach+ECBIllNach-ECB_Self_Nach)<LimitForECB) then
                 begin
                      a:=ECBNNach+ECBNach+ECBDPNach+ECBIllNach;
                      b:=ECB_Self_Nach;
                      c:=a-b;
                      d:=r10(LimitFORECB-c);
                      RetVal:=Sum(d*P);
                      if Curr_Person^.WID_RABOTY=OSN_WID_RABOTY then
                         begin
                              SetUpMaxECBs;
                              if (abs(abs(p)-ECBNProc)>-0.005) then
                                  RetVal:=r10(MaxECBN*p-ECBNUd-ECBUd-ECBDPUd-ECBIllUd)
                              else
                              if (abs(abs(p)-ECBProc)>-0.005) then
                                  RetVal:=r10(MaxECB*p-ECBNUd-ECBUd-ECBDPUd-ECBIllUd);
                         end
                 end;
//       if ((RetVal>0.01) and (ECB_Self_UD>0.01)) then
//          RetVal:=RetVal-Ecb_Self_Ud;
       CalcECB:=RetVal;
  end;
 function CalcECBFull(Curr_Person : Person_Ptr;
                      W_Place     : integer;
                      Start_Month : integer;
                      Start_Year  : integer;
                      ECBNNach   ,
                      ECBNUd     ,
                      ECBNach    ,
                      ECBUd      ,
                      ECBDPNAch  ,
                      ECBDPUd    ,
                      ECBIllNach ,
                      ECBIllUd   ,
                      ECB_Self_Nach ,
                      ECB_Self_Ud   : real):real;
  var RetVal:real;
      LimitForECB:real;
      P:real;
      WantedECBShifr:integer;
      Summa,ECBNalog:Real;
      MaxECBN,MaxECB,MaxECBDP,MaxECBIll:real;
      TmpECB:real;
      a,b,c,d:real;
  procedure SetUpMaxECBs;
   begin
        if ECBNNach>LimitForECB then
           begin
                MaxECBN   := LimitForECB;
                MaxECB    := 0 ;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := LimitForECB-ECBNNach;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach+ECBDPNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := ECBNach;
                MaxECBDP  := LimitForECB-(ECBNNach+ECBNach);
                MaxECBIll := 0 ;
           end
        else
           if ECBNNach+ECBNach+ECBDPNach+ECBIllNach>LimitForECB then
              begin
                   MaxECBN   := ECBNNach;
                   MaxECB    := ECBNach;
                   MaxECBDP  := ECBDPNach;
                   MaxECBIll := LimitForECB-(ECBNNach+ECBNach+ECBDPNach);
              end;
           if WantedECBShifr=143 then
              begin
                   if ECB_Self_Nach > MaxECBN then
                      ECB_Self_Nach := MaxECBN;
              end;
           if WantedECBShifr=142 then
              begin
                   if ECB_Self_Nach > MaxECB then
                      ECB_Self_Nach := MaxECB;
              end;
    end;
  begin
    //   if Curr_Pens_Month<>Start_Month then
    //      if not FILL_PENS(START_MONTH) then
    //        ERROR('Нет данных для ЕСВ по пенсионному налогу за '+IntToStr(Start_Month));
       Summa:=ECBNach;
       ECBNalog:=0;
       P:=GetProcECBNalog(CURR_PERSON,Summa,ECBNalog,START_MONTH,START_YEAR,WantedECBShifr);
       if WantedECBShifr=143 then
          Summa:=ECBNNach;

       RetVal:=0;
       LimitForEcb:=SSLimityList.GetLimitForECB(Start_Year,Start_Month);
       MaxECBN   := ECBNNach   ;
       MaxECB    := ECBNach    ;
       MaxECBDP  := ECBDPNach  ;
       MaxECBIll := ECBIllNach ;
       if (ECBNNach+ECBNach+ECBDPNach+ECBIllNach)<=LimitForECB+0.005 then
          if Dog_Pod_Podrazd(W_Place) then
             RetVal:=Sum(ECB_Self_Nach*0.026)
          else
             RetVal:=Sum(Summa*P)
       else
       if (ECBNNach+ECBNach+ECBDPNach+ECBIllNach-ECB_Self_Nach)>LimitForECB+0.005 then
          begin
               SetUpMaxECBs;
               TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc+MaxECBDp*ECBDPProc+MaxECBIll*ECBIllProc);
          //        RetVal:=TmpECB
               if TmpECB<=ECBNUd+ECBUd+ECBDPUd+ECBIllUd+0.005 then
                  if Curr_Person^.Wid_Raboty<>Osn_Wid_Raboty then
                     RetVal:=r10(TmpECB)
//                     RetVal:=0
                  else
//                     RetVal:=r10(TmpECB-(ECBNUd+ECBUd+ECBDPUd+ECBIllUd))
                     RetVal:=r10(TmpECB)
               else
                  if (r10(TmpECB-(ECBNUd+ECBUd+ECBDPUd+ECBIllUd))>R10(ECB_Self_Nach*p)) then
                     if Curr_Person^.Wid_Raboty=Osn_Wid_Raboty then
                        RetVal:=r10(TmpECB-(ECBNUd+ECBUd+ECBDPUd+ECBIllUd))
                     else
                        RetVal:=R10(ECB_Self_Nach*p)
                  else
                     RetVal:=r10(TmpECB-(ECBNUd+ECBUd+ECBDPUd+ECBIllUd));

          end
       else
          if ((ECBNNach+ECBNach+ECBDPNach+ECBIllNach)>LimitForECB+0.005) and
             ((ECBNNach+ECBNach+ECBDPNach+ECBIllNach-ECB_Self_Nach)<LimitForECB+0.005) then
             begin
                  a:=ECBNNach+ECBNach+ECBDPNach+ECBIllNach;
                  b:=ECB_Self_Nach;
                  c:=a-b;
                  d:=LimitFORECB-c;
                  RetVal:=Sum(d*P);
                  if Curr_Person^.WID_RABOTY=OSN_WID_RABOTY then
                     begin
                          SetUpMaxECBs;
                          if (abs(abs(p)-ECBNProc)<0.0005) then
//                             RetVal:=r10(MaxECBN*p-ECBNUd-ECBUd-ECBDPUd-ECBIllUd)
                             RetVal:=r10(MaxECBN*p)
                          else
                          if (abs(abs(p)-ECBProc)<0.0005) then
//                             RetVal:=r10(MaxECB*p-ECBNUd-ECBUd-ECBDPUd-ECBIllUd);
                             RetVal:=r10(MaxECB*p);
                     end
             end;
//       if ((RetVal>0.01) and (ECB_Self_UD>0.01)) then
//          RetVal:=RetVal-Ecb_Self_Ud;
       CalcECBFull:=RetVal;
  end;
FUNCTION IS_ALL_BLOCKED(CURR_PERSON:PERSON_PTR):BOOLEAN;
 VAR
    CURR_ADD:ADD_PTR;
    CURR_UD:UD_PTR;
    RET_VAL:BOOLEAN;
 FUNCTION IS_ANY_BLOCKED:BOOLEAN;
  VAR
      RET_VAL:BOOLEAN;
  BEGIN
       RET_VAL:=FALSE;
       CURR_ADD:=CURR_PERSON^.ADD;
       WHILE (CURR_ADD<>NIL) AND (NOT RET_VAL) DO
        BEGIN
             IF CURR_ADD^.VYPLACHENO=GET_OUT THEN RET_VAL:=TRUE
                                             ELSE CURR_ADD:=CURR_ADD^.NEXT;
        END;
       IF NOT RET_VAL THEN
          BEGIN
               CURR_UD:=CURR_PERSON^.UD;
               WHILE (CURR_UD<>NIL) AND (NOT RET_VAL) DO
                BEGIN
                   IF CURR_UD^.VYPLACHENO=GET_OUT THEN RET_VAL:=TRUE
                                                  ELSE CURR_UD:=CURR_UD^.NEXT;
                END;
          END;
       IS_ANY_BLOCKED:=RET_VAL;
  END;
 BEGIN
      RET_VAL:=TRUE;
      IF (COUNT_ADD(CURR_PERSON)=0) OR (COUNT_UD(CURR_PERSON)=0) THEN RET_VAL:=FALSE
                                                                  ELSE
         BEGIN
              CURR_ADD:=CURR_PERSON^.ADD;
              WHILE CURR_ADD<>NIL DO
               BEGIN
                    IF CURR_ADD^.VYPLACHENO=NOT_GET_OUT THEN RET_VAL:=FALSE;
                    CURR_ADD:=CURR_ADD^.NEXT;
               END;
{      error('add passed');}
              CURR_UD:=CURR_PERSON^.UD;
              WHILE CURR_UD<>NIL DO
               BEGIN
                    IF (CURR_UD^.VYPLACHENO=NOT_GET_OUT) AND
                       (ABS(CURR_UD^.SUMMA)>0.01) THEN RET_VAL:=FALSE;
                    CURR_UD:=CURR_UD^.NEXT;
               END;
           END;
{       IF RET_VAL=TRUE THEN  ERROR('IS_ALL_BLOCKED=TRUE')
                       ELSE  ERROR('IS_ALL_BLOCKED=FALSE');
}       IS_ALL_BLOCKED:=RET_VAL;
 END;

  function GetGUIDPersonToString(Curr_Person:Person_ptr):string;
  var Curr_Cn:CN_Ptr;
      Finded:boolean;
      GUIDS:string;
  begin
       GUIDS:='';
       Curr_CN:=Curr_Person^.CN;
       Finded:=false;
       while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn^.Shifr=GUIDShifr+Limit_Cn_Base then
                begin
                     Finded:=true;
                     break;
                end;
             Curr_Cn:=Curr_Cn^.Next;
        end;
       if finded then
          GUIDS:=FormatGUID(Curr_Cn^.Prim_1,Curr_Cn^.SUmma,Curr_Cn^.Flow_Summa,Curr_Cn^.Limit_Summa);
       GetGUIDPersonToString:=GUIDS;
  end;


 function GetGUIDPerson(Curr_Person:Person_ptr; var GUIDS:string):boolean;
  var Curr_Cn:CN_Ptr;
      Finded:boolean;
  begin
       GUIDS:='';
       GetGUIDPerson:=false;
       Curr_CN:=Curr_Person^.CN;
       Finded:=false;
       while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn^.Shifr=GUIDShifr+Limit_Cn_Base then
                begin
                     Finded:=true;
                     break;
                end;
             Curr_Cn:=Curr_Cn^.Next;
        end;
       if finded then
          begin
               GUIDS:=FormatGUID(Curr_Cn^.Prim_1,Curr_Cn^.SUmma,Curr_Cn^.Flow_Summa,Curr_Cn^.Limit_Summa);
               GetGUIDPerson:=true;
          end;

  end;


 function CalculateECBNSelf(Curr_Person : Person_Ptr;
                     W_Place     : integer;
                     Start_Month : integer;
                     Start_Year  : integer;
                     ECBNNach   ,
                     ECBNUd     ,
                     ECBNach    ,
                     ECBUd      ,
                     ECBDPNAch  ,
                     ECBDPUd    ,
                     ECBIllNach ,
                     ECBIllUd   ,
                     ECB_Self_Nach ,
                     ECB_Self_Ud   : real):real;
  var RetVal:real;
      LimitForECB:real;
      P:real;
      WantedECBShifr:integer;
      Summa,ECBNalog:Real;
      MaxECBN,MaxECB,MaxECBDP,MaxECBIll:real;
      TmpECB:real;
      a,b,c,d:real;
  procedure SetUpMaxECBs;
   begin
        if ECBNNach>LimitForECB then
           begin
                MaxECBN   := LimitForECB;
                MaxECB    := 0 ;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := LimitForECB-ECBNNach;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach+ECBDPNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := ECBNach;
                MaxECBDP  := LimitForECB-(ECBNNach+ECBNach);
                MaxECBIll := 0 ;
           end
        else
           if ECBNNach+ECBNach+ECBDPNach+ECBIllNach>LimitForECB then
              begin
                   MaxECBN   := ECBNNach;
                   MaxECB    := ECBNach;
                   MaxECBDP  := ECBDPNach;
                   MaxECBIll := LimitForECB-(ECBNNach+ECBNach+ECBDPNach);
              end;
{
           if WantedECBShifr=143 then
              begin
                   if ECB_Self_Nach > MaxECBN then
                      ECB_Self_Nach := MaxECBN;
              end;
           if WantedECBShifr=142 then
              begin
                   if ECB_Self_Nach > MaxECB then
                      ECB_Self_Nach := MaxECB;
              end;
}
    end;
  begin
       if Curr_Pens_Month<>Start_Month then
          if not FILL_PENS(START_MONTH) then
            ERROR('Нет данных для ЕСВ по пенсионному налогу за '+IntToStr(Start_Month));

       Summa:=ECB_Self_Nach;
       ECBNalog:=0;
       P:=GetProcECBNalog(CURR_PERSON,Summa,ECBNalog,START_MONTH,START_YEAR,WantedECBShifr);
       if WantedECBShifr<>ECBNShifr then
          begin
               CalculateECBNSelf:=0;
               Exit;
          end;
       RetVal:=0;
       LimitForEcb:=SSLimityList.GetLimitForECB(Start_Year,Start_Month);
       MaxECBN   := ECBNNach   ;
       MaxECB    := ECBNach    ;
       MaxECBDP  := ECBDPNach  ;
       MaxECBIll := ECBIllNach ;
       if ECBNNach<=LimitForECB then
             RetVal:=Sum(ECB_Self_Nach*P)
       else
           begin
                SetUpMaxECBs;
                a:=Sum(ECB_Self_Nach*P);
                if (a+ECBNud) > r10(MaxECBN*p) then
                   begin
                        b:= R10(MaxECBN*P)-ECBNud;
                        if b>a then
                           RetVal:=a
                        else
                           RetVal:=b;
                   end
                else
                     RetVal:=a;
           end;
       CalculateECBNSelf:=RetVal;
  end;

 function CalculateECBNFull(Curr_Person : Person_Ptr;
                     W_Place     : integer;
                     Start_Month : integer;
                     Start_Year  : integer;
                     ECBNNach   ,
                     ECBNUd     ,
                     ECBNach    ,
                     ECBUd      ,
                     ECBDPNAch  ,
                     ECBDPUd    ,
                     ECBIllNach ,
                     ECBIllUd   ,
                     ECB_Self_Nach ,
                     ECB_Self_Ud   : real;
                     var ECBForNalog:real):real;
  var RetVal:real;
      LimitForECB:real;
      P:real;
      WantedECBShifr:integer;
      Summa,ECBNalog:Real;
      MaxECBN,MaxECB,MaxECBDP,MaxECBIll:real;
      TmpECB:real;
      a,b,c,d:real;
  procedure SetUpMaxECBs;
   begin
        if ECBNNach>LimitForECB then
           begin
                MaxECBN   := LimitForECB;
                MaxECB    := 0 ;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := LimitForECB-ECBNNach;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach+ECBDPNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := ECBNach;
                MaxECBDP  := LimitForECB-(ECBNNach+ECBNach);
                MaxECBIll := 0 ;
           end
        else
           if ECBNNach+ECBNach+ECBDPNach+ECBIllNach>LimitForECB then
              begin
                   MaxECBN   := ECBNNach;
                   MaxECB    := ECBNach;
                   MaxECBDP  := ECBDPNach;
                   MaxECBIll := LimitForECB-(ECBNNach+ECBNach+ECBDPNach);
              end;
           if WantedECBShifr=143 then
              begin
                   if ECB_Self_Nach > MaxECBN then
                      ECB_Self_Nach := MaxECBN;
              end;
           if WantedECBShifr=142 then
              begin
                   if ECB_Self_Nach > MaxECB then
                      ECB_Self_Nach := MaxECB;
              end;
    end;
  begin
       if Curr_Pens_Month<>Start_Month then
          if not FILL_PENS(START_MONTH) then
            ERROR('Нет данных для ЕСВ по пенсионному налогу за '+IntToStr(Start_Month));

       Summa:=ECBNNach;
       ECBNalog:=0;
       P:=GetProcECBNalog(CURR_PERSON,Summa,ECBNalog,START_MONTH,START_YEAR,WantedECBShifr);
       if WantedECBShifr<>ECBNShifr then
          begin
               CalculateECBNFull := 0;
               Exit;
          end;
       RetVal:=0;
       LimitForEcb := SSLimityList.GetLimitForECB(Start_Year,Start_Month);
       MaxECBN     := ECBNNach   ;
       MaxECB      := ECBNach    ;
       MaxECBDP    := ECBDPNach  ;
       MaxECBIll   := ECBIllNach ;
       ECBForNalog := 0;
       if ECBNNach<=LimitForECB then
          begin
             RetVal:=Sum(ECBNNach*P)+ECBILLUD+ECBDPUD+ECBUd; // Потому, что
             EcbForNalog := Sum(ECBNNach*P);
          end
       else
          begin
             RetVal:=r10(LimitForECB*p);
             EcbForNalog := Sum(LimitForECB*P);
          end;
       CalculateECBNFull:=RetVal;
  end;

 function CalculateECBSelf(Curr_Person : Person_Ptr;
                     W_Place     : integer;
                     Start_Month : integer;
                     Start_Year  : integer;
                     ECBNNach   ,
                     ECBNUd     ,
                     ECBNach    ,
                     ECBUd      ,
                     ECBDPNAch  ,
                     ECBDPUd    ,
                     ECBIllNach ,
                     ECBIllUd   ,
                     ECB_Self_Nach ,
                     ECB_Self_Ud   : real):real;
  var RetVal:real;
      LimitForECB:real;
      P:real;
      WantedECBShifr:integer;
      Summa,ECBNalog:Real;
      MaxECBN,MaxECB,MaxECBDP,MaxECBIll:real;
      TmpECB:real;
      a,b,c,d:real;
  procedure SetUpMaxECBs;
   begin
        if ECBNNach>LimitForECB then
           begin
                MaxECBN   := LimitForECB;
                MaxECB    := 0 ;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := LimitForECB-ECBNNach;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach+ECBDPNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := ECBNach;
                MaxECBDP  := LimitForECB-(ECBNNach+ECBNach);
                MaxECBIll := 0 ;
           end
        else
           if ECBNNach+ECBNach+ECBDPNach+ECBIllNach>LimitForECB then
              begin
                   MaxECBN   := ECBNNach;
                   MaxECB    := ECBNach;
                   MaxECBDP  := ECBDPNach;
                   MaxECBIll := LimitForECB-(ECBNNach+ECBNach+ECBDPNach);
              end;
{
           if WantedECBShifr=143 then
              begin
                   if ECB_Self_Nach > MaxECBN then
                      ECB_Self_Nach := MaxECBN;
              end;
           if WantedECBShifr=142 then
              begin
                   if ECB_Self_Nach > MaxECB then
                      ECB_Self_Nach := MaxECB;
              end;
}
    end;
  begin
       if Curr_Pens_Month<>Start_Month then
          if not FILL_PENS(START_MONTH) then
            ERROR('Нет данных для ЕСВ по пенсионному налогу за '+IntToStr(Start_Month));

       Summa:=ECB_Self_Nach;
       ECBNalog:=0;
       P:=GetProcECBNalog(CURR_PERSON,Summa,ECBNalog,START_MONTH,START_YEAR,WantedECBShifr);
       if WantedECBShifr<>ECBShifr then
          begin
               CalculateECBSelf:=0;
               Exit;
          end;
       RetVal:=0;
       LimitForEcb:=SSLimityList.GetLimitForECB(Start_Year,Start_Month);
       MaxECBN   := ECBNNach   ;
       MaxECB    := ECBNach    ;
       MaxECBDP  := ECBDPNach  ;
       MaxECBIll := ECBIllNach ;
       if (ECBNNach+ECBNach)<=LimitForECB then
             RetVal:=Sum(ECB_Self_Nach*P)
       else
       if abs(ECBUd)>abs(r10(LimitForEcb*ECBNProc))-0.005 then
          RetVal:=0
       else
           begin
                SetUpMaxECBs;
                TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc);
                a:=Sum(ECB_Self_Nach*P);
                b:=a+ECBNUd+ECBUd;
                if b > TmpECB then
                   begin
                        b:= TmpECB-ECBNud-ECBUd;
                        if b>a then
                           RetVal:=a
                        else
                           RetVal:=b;
                   end
                else
                     RetVal:=a;
           end;
       CalculateECBSelf:=RetVal;
  end;


 function CalculateECBFull(Curr_Person : Person_Ptr;
                     W_Place     : integer;
                     Start_Month : integer;
                     Start_Year  : integer;
                     ECBNNach   ,
                     ECBNUd     ,
                     ECBNach    ,
                     ECBUd      ,
                     ECBDPNAch  ,
                     ECBDPUd    ,
                     ECBIllNach ,
                     ECBIllUd   ,
                     ECB_Self_Nach ,
                     ECB_Self_Ud   : real;
                     var ECBForNalog:real):real;
  var RetVal:real;
      LimitForECB:real;
      P:real;
      WantedECBShifr:integer;
      Summa,ECBNalog:Real;
      MaxECBN,MaxECB,MaxECBDP,MaxECBIll:real;
      TmpECB:real;
      a,b,c,d:real;
  procedure SetUpMaxECBs;
   begin
        if ECBNNach>LimitForECB then
           begin
                MaxECBN   := LimitForECB;
                MaxECB    := 0 ;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := LimitForECB-ECBNNach;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach+ECBDPNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := ECBNach;
                MaxECBDP  := LimitForECB-(ECBNNach+ECBNach);
                MaxECBIll := 0 ;
           end
        else
           if ECBNNach+ECBNach+ECBDPNach+ECBIllNach>LimitForECB then
              begin
                   MaxECBN   := ECBNNach;
                   MaxECB    := ECBNach;
                   MaxECBDP  := ECBDPNach;
                   MaxECBIll := LimitForECB-(ECBNNach+ECBNach+ECBDPNach);
              end;
           if WantedECBShifr=143 then
              begin
                   if ECB_Self_Nach > MaxECBN then
                      ECB_Self_Nach := MaxECBN;
              end;
           if WantedECBShifr=142 then
              begin
                   if ECB_Self_Nach > MaxECB then
                      ECB_Self_Nach := MaxECB;
              end;
    end;
  begin
       if Curr_Pens_Month<>Start_Month then
          if not FILL_PENS(START_MONTH) then
            ERROR('Нет данных для ЕСВ по пенсионному налогу за '+IntToStr(Start_Month));

       Summa:=ECBNach;
       ECBNalog:=0;
       P:=GetProcECBNalog(CURR_PERSON,Summa,ECBNalog,START_MONTH,START_YEAR,WantedECBShifr);
       if WantedECBShifr<>ECBShifr then
          begin
               CalculateECBFull:=0;
               Exit;
          end;
       RetVal:=0;
       LimitForEcb:=SSLimityList.GetLimitForECB(Start_Year,Start_Month);
       MaxECBN   := ECBNNach   ;
       MaxECB    := ECBNach    ;
       MaxECBDP  := ECBDPNach  ;
       MaxECBIll := ECBIllNach ;
       EcbForNalog := 0;
       if (ECBNNach+ECBNach)<=LimitForECB then
           begin
             RetVal:=Sum(ECBNach*P)+ECBNUD+ECBILLUD+ECBDPUD;  {Помтому, чт о потом отнимается в MAKE_PERSON_PODOH_2011}
             EcbForNalog:=Sum(ECBNach*P);
           end
       else
       if abs(ECBUd)>abs(r10(LimitForECB*ECBNProc))-0.005 then
          RetVal:=0
       else
           begin
                SetUpMaxECBs;
                TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc);
                RetVal := TmpECB;
                EcbForNalog := RetVal;
           end;
       CalculateECBFull:=RetVal;
  end;


 function CalculateECBDPSelf(Curr_Person : Person_Ptr;
                             W_Place     : integer;
                             Start_Month : integer;
                             Start_Year  : integer;
                             ECBNNach   ,
                             ECBNUd     ,
                             ECBNach    ,
                             ECBUd      ,
                             ECBDPNAch  ,
                             ECBDPUd    ,
                             ECBIllNach ,
                             ECBIllUd   ,
                             ECB_Self_Nach ,
                             ECB_Self_Ud   : real):real;
  var RetVal:real;
      LimitForECB:real;
      P:real;
      WantedECBShifr:integer;
      Summa,ECBNalog:Real;
      MaxECBN,MaxECB,MaxECBDP,MaxECBIll:real;
      TmpECB:real;
      a,b,c,d:real;
  procedure SetUpMaxECBs;
   begin
        if ECBNNach>LimitForECB then
           begin
                MaxECBN   := LimitForECB;
                MaxECB    := 0 ;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := LimitForECB-ECBNNach;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach+ECBDPNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := ECBNach;
                MaxECBDP  := LimitForECB-(ECBNNach+ECBNach);
                MaxECBIll := 0 ;
           end
        else
           if ECBNNach+ECBNach+ECBDPNach+ECBIllNach>LimitForECB then
              begin
                   MaxECBN   := ECBNNach;
                   MaxECB    := ECBNach;
                   MaxECBDP  := ECBDPNach;
                   MaxECBIll := LimitForECB-(ECBNNach+ECBNach+ECBDPNach);
              end;
{
           if WantedECBShifr=143 then
              begin
                   if ECB_Self_Nach > MaxECBN then
                      ECB_Self_Nach := MaxECBN;
              end;
           if WantedECBShifr=142 then
              begin
                   if ECB_Self_Nach > MaxECB then
                      ECB_Self_Nach := MaxECB;
              end;
}
    end;
  begin
       if Curr_Pens_Month<>Start_Month then
          if not FILL_PENS(START_MONTH) then
            ERROR('Нет данных для ЕСВ по пенсионному налогу за '+IntToStr(Start_Month));

       Summa:=ECB_Self_Nach;
       ECBNalog:=0;
       P:=ECBDPProc;
       RetVal:=0;
       LimitForEcb:=SSLimityList.GetLimitForECB(Start_Year,Start_Month);
       MaxECBN   := ECBNNach   ;
       MaxECB    := ECBNach    ;
       MaxECBDP  := ECBDPNach  ;
       MaxECBIll := ECBIllNach ;
       SetUpMaxECBs;
       TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc);
       if (ECBNNach+ECBNach+ECBDPNach)<=LimitForECB then
             RetVal:=Sum(ECB_Self_Nach*P)
       else
       if abs(ECBDPUd)>abs(TmpECB)-0.005 then
          RetVal:=0
       else
           begin
                SetUpMaxECBs;
                TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc+MaxECBDp*ECBDPProc);
                a:=Sum(ECB_Self_Nach*P);
                b:=a+ECBNUd+ECBUd+ECBDPUd;
                if b > TmpECB then
                   begin
                        b:= TmpECB-ECBNud-ECBUd-ECBDpUd;
                        if b>a then
                           RetVal:=a
                        else
                           RetVal:=b;
                   end
                else
                     RetVal:=a;
           end;
       CalculateECBDPSelf:=RetVal;
  end;

 function CalculateECBDPFull(Curr_Person : Person_Ptr;
                             W_Place     : integer;
                             Start_Month : integer;
                             Start_Year  : integer;
                             ECBNNach   ,
                             ECBNUd     ,
                             ECBNach    ,
                             ECBUd      ,
                             ECBDPNAch  ,
                             ECBDPUd    ,
                             ECBIllNach ,
                             ECBIllUd   ,
                             ECB_Self_Nach ,
                             ECB_Self_Ud   : real):real;
  var RetVal:real;
      LimitForECB:real;
      P:real;
      WantedECBShifr:integer;
      Summa,ECBNalog:Real;
      MaxECBN,MaxECB,MaxECBDP,MaxECBIll:real;
      TmpECB:real;
      a,b,c,d:real;
  procedure SetUpMaxECBs;
   begin
        if ECBNNach>LimitForECB then
           begin
                MaxECBN   := LimitForECB;
                MaxECB    := 0 ;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := LimitForECB-ECBNNach;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach+ECBDPNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := ECBNach;
                MaxECBDP  := LimitForECB-(ECBNNach+ECBNach);
                MaxECBIll := 0 ;
           end
        else
           if ECBNNach+ECBNach+ECBDPNach+ECBIllNach>LimitForECB then
              begin
                   MaxECBN   := ECBNNach;
                   MaxECB    := ECBNach;
                   MaxECBDP  := ECBDPNach;
                   MaxECBIll := LimitForECB-(ECBNNach+ECBNach+ECBDPNach);
              end;
           if WantedECBShifr=143 then
              begin
                   if ECB_Self_Nach > MaxECBN then
                      ECB_Self_Nach := MaxECBN;
              end;
           if WantedECBShifr=142 then
              begin
                   if ECB_Self_Nach > MaxECB then
                      ECB_Self_Nach := MaxECB;
              end;
    end;
  begin
   //    if Curr_Pens_Month<>Start_Month then
   //       if not FILL_PENS(START_MONTH) then
   //         ERROR('Нет данных для ЕСВ по пенсионному налогу за '+IntToStr(Start_Month));

       Summa:=ECBDPNach;
       ECBNalog:=0;
       P:=ECBDPProc;
       RetVal:=0;
       LimitForEcb:=SSLimityList.GetLimitForECB(Start_Year,Start_Month);
       MaxECBN   := ECBNNach   ;
       MaxECB    := ECBNach    ;
       MaxECBDP  := ECBDPNach  ;
       MaxECBIll := ECBIllNach ;
       SetUpMaxECBs;
       TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc);
       if (ECBNNach+ECBNach+ECBDPNach)<=LimitForECB then
             RetVal:=Sum(ECBDPNach*P)
       else
       if abs(ECBDPUd)>abs(TmpECB)-0.005 then
          RetVal:=0
       else
           begin
                SetUpMaxECBs;
                TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc+MaxECBDp*ECBDPProc);
                a:=Sum(ECBDPNach*P);
                b:=a+ECBNUd+ECBUd+ECBDPUd;
                if b > TmpECB then
                   begin
                        b:= TmpECB-ECBNud-ECBUd-ECBDpUd;
                        if b>a then
                           RetVal:=a
                        else
                           RetVal:=b;
                   end
                else
                     RetVal:=a;
           end;
       CalculateECBDPFull:=RetVal;
  end;


 function CalculateECBIllSelf(Curr_Person : Person_Ptr;
                             W_Place     : integer;
                             Start_Month : integer;
                             Start_Year  : integer;
                             ECBNNach   ,
                             ECBNUd     ,
                             ECBNach    ,
                             ECBUd      ,
                             ECBDPNAch  ,
                             ECBDPUd    ,
                             ECBIllNach ,
                             ECBIllUd   ,
                             ECB_Self_Nach ,
                             ECB_Self_Ud   : real):real;
  var RetVal:real;
      LimitForECB:real;
      P:real;
      WantedECBShifr:integer;
      Summa,ECBNalog:Real;
      MaxECBN,MaxECB,MaxECBDP,MaxECBIll:real;
      TmpECB:real;
      a,b,c,d:real;
  procedure SetUpMaxECBs;
   begin
        if ECBNNach>LimitForECB then
           begin
                MaxECBN   := LimitForECB;
                MaxECB    := 0 ;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := LimitForECB-ECBNNach;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach+ECBDPNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := ECBNach;
                MaxECBDP  := LimitForECB-(ECBNNach+ECBNach);
                MaxECBIll := 0 ;
           end
        else
           if ECBNNach+ECBNach+ECBDPNach+ECBIllNach>LimitForECB then
              begin
                   MaxECBN   := ECBNNach;
                   MaxECB    := ECBNach;
                   MaxECBDP  := ECBDPNach;
                   MaxECBIll := LimitForECB-(ECBNNach+ECBNach+ECBDPNach);
              end;
{
           if WantedECBShifr=143 then
              begin
                   if ECB_Self_Nach > MaxECBN then
                      ECB_Self_Nach := MaxECBN;
              end;
           if WantedECBShifr=142 then
              begin
                   if ECB_Self_Nach > MaxECB then
                      ECB_Self_Nach := MaxECB;
              end;
}
    end;
  begin
    //   if Curr_Pens_Month<>Start_Month then
    //      if not FILL_PENS(START_MONTH) then
    //        ERROR('Нет данных для ЕСВ по пенсионному налогу за '+IntToStr(Start_Month));

       Summa:=ECB_Self_Nach;
       if abs(Summa)<=0.005 then
          begin
               CalculateECBIllSelf:=0;
               Exit;
          end;
       ECBNalog:=0;
       P:=ECBIllProc;
       RetVal:=0;
       LimitForEcb:=SSLimityList.GetLimitForECB(Start_Year,Start_Month);
       MaxECBN   := ECBNNach   ;
       MaxECB    := ECBNach    ;
       MaxECBDP  := ECBDPNach  ;
       MaxECBIll := ECBIllNach ;
       WantedECBShifr:=145;
       SetUpMaxECBs;
       TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc+MaxECBDP*ECBDPProc);
       if (ECBNNach+ECBNach+ECBDPNach+ECBIllNach)<=LimitForECB then
             RetVal:=Sum(ECB_Self_Nach*P)
       else
       if abs(ECBIllUd)>abs(TmpECB)-0.005 then
          RetVal:=0
       else
           begin
                SetUpMaxECBs;
                TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc+MaxECBDp*ECBDPProc+MaxECBIll*ECBIllProc);
                a:=Sum(ECB_Self_Nach*P);
                b:=a+ECBNUd+ECBUd+ECBDPUd+ECBIllUd;
                if b > TmpECB then
                   begin
                        b:= TmpECB-ECBNud-ECBUd-ECBDpUd-ECBIllUd;
                        if b>a then
                           RetVal:=a
                        else
                           RetVal:=b;
                   end
                else
                     RetVal:=a;
           end;
       CalculateECBIllSelf:=RetVal;
  end;

 function CalculateECBIllFull(Curr_Person : Person_Ptr;
                              W_Place     : integer;
                              Start_Month : integer;
                              Start_Year  : integer;
                              ECBNNach   ,
                              ECBNUd     ,
                              ECBNach    ,
                              ECBUd      ,
                              ECBDPNAch  ,
                              ECBDPUd    ,
                              ECBIllNach ,
                              ECBIllUd   ,
                              ECB_Self_Nach ,
                              ECB_Self_Ud   : real):real;
  var RetVal:real;
      LimitForECB:real;
      P:real;
      WantedECBShifr:integer;
      Summa,ECBNalog:Real;
      MaxECBN,MaxECB,MaxECBDP,MaxECBIll:real;
      TmpECB:real;
      a,b,c,d:real;
  procedure SetUpMaxECBs;
   begin
        if ECBNNach>LimitForECB then
           begin
                MaxECBN   := LimitForECB;
                MaxECB    := 0 ;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := LimitForECB-ECBNNach;
                MaxECBDP  := 0 ;
                MaxECBIll := 0 ;
           end
        else
        if ECBNNach+ECBNach+ECBDPNach>LimitForECB then
           begin
                MaxECBN   := ECBNNach;
                MaxECB    := ECBNach;
                MaxECBDP  := LimitForECB-(ECBNNach+ECBNach);
                MaxECBIll := 0 ;
           end
        else
           if ECBNNach+ECBNach+ECBDPNach+ECBIllNach>LimitForECB then
              begin
                   MaxECBN   := ECBNNach;
                   MaxECB    := ECBNach;
                   MaxECBDP  := ECBDPNach;
                   MaxECBIll := LimitForECB-(ECBNNach+ECBNach+ECBDPNach);
              end;
           if WantedECBShifr=143 then
              begin
                   if ECB_Self_Nach > MaxECBN then
                      ECB_Self_Nach := MaxECBN;
              end;
           if WantedECBShifr=142 then
              begin
                   if ECB_Self_Nach > MaxECB then
                      ECB_Self_Nach := MaxECB;
              end;
    end;
  begin
  //     if Curr_Pens_Month<>Start_Month then
  //        if not FILL_PENS(START_MONTH) then
  //          ERROR('Нет данных для ЕСВ по пенсионному налогу за '+IntToStr(Start_Month));

       Summa:=ECBIllNach;
       ECBNalog:=0;
       P:=ECBIllProc;
       RetVal:=0;
       LimitForEcb:=SSLimityList.GetLimitForECB(Start_Year,Start_Month);
       MaxECBN   := ECBNNach   ;
       MaxECB    := ECBNach    ;
       MaxECBDP  := ECBDPNach  ;
       MaxECBIll := ECBIllNach ;
       SetUpMaxECBs;
       TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc+MaxECBDP*ECBDPProc);
       if (ECBNNach+ECBNach+ECBDPNach+ECBIllNach)<=LimitForECB then
             RetVal:=Sum(ECBIllNach*P)
       else
       if abs(ECBIllUd)>abs(TmpECB)-0.005 then
          RetVal:=0
       else
           begin
                SetUpMaxECBs;
                TmpECB := r10(MaxECBN*ECBNProc+MaxECB*ECBProc+MaxECBDp*ECBDPProc+MaxECBIll*ECBIllProc);
                a:=Sum(ECBIllNach*P);
                b:=a+ECBNUd+ECBUd+ECBDPUd+ECBIllUd;
                if b > TmpECB then
                   begin
                        b:= TmpECB-ECBNud-ECBUd-ECBDpUd-ECBIllUd;
                        if b>a then
                           RetVal:=a
                        else
                           RetVal:=b;
                   end
                else
                     RetVal:=a;
           end;
       CalculateECBIllFull:=RetVal;
  end;


  procedure MakeLgotyPNInCN(Curr_Person:Person_Ptr);
     var  BasePtr:Person_Ptr;
          isel:integer;
          savselected:integer;
          Finded:boolean;
          SavNSRV : integer;
     procedure MakeCopyCN(Wanted_Shifr:integer);
      var c_Person      : Person_Ptr;
          Curr_Cn,C_CN  : Cn_Ptr;
          Finded        : boolean;
      begin
           Finded := false;
           c_Person:=BasePtr;
           while (c_person<>nil) do
             begin
                  if (c_Person^.TABNO=Curr_Person^.TABNO) and
                     (c_Person^.wid_raboty=1) then
                     begin
                          Finded:=true;
                          break;
                     end;
                  c_Person:=c_Person^.NEXT;
             end;
           if Finded then
              begin
                   Finded:=false;
                   C_CN:=C_Person^.CN;
                   while (C_CN<>NIl) do
                     begin
                          if C_Cn^.SHIFR=Wanted_Shifr+Limit_Cn_Base then
                             begin
                                  Finded:=true;
                                  Make_CN(Curr_Cn,Curr_Person);
                                  Curr_Cn^.SHIFR:=C_CN^.SHIFR;
                                  Curr_Cn^.KOD:=C_CN^.KOD;
                                  Curr_Cn^.SUMMA:=C_CN^.SUMMA;
                                  Curr_Cn^.PRIM:=C_Cn^.PRIM;
                                  Curr_Cn^.PRIM_1:=C_Cn^.PRIM_1;
                                  break;
                             end;
                          C_CN:=C_CN^.Next;
                     end;
              end
      end;

     begin
          if Curr_Person.Wid_Raboty<>2 then Exit;
          If Curr_Person.MESTO_OSN_RABOTY=NSRV then
             begin
                  BasePtr:=Head_Person;
                  MakeCopyCN(147);
             end
          else
             begin
                  finded:=false;
                  for isel:=1 to MAX_FIELD do
                      begin
                           if not Assigned(HEAD_ARRAY[isel]) then
                              begin
                                   Finded:=true;
                                   break;
                              end;
                      end;
                  if Finded then
                     begin
                          savselected:=selected_field;
                          select(isel);
                          savnsrv:=nsrv;
                          nsrv:=Curr_Person^.MESTO_OSN_RABOTY;
                          mkflnm;
                          getinf(false);
                          BasePtr:=Head_Person;
                          MakeCopyCN(147);
                          EMPTY_ALL_PERSON;
                          select(savselected);
                          nsrv:=savnsrv;
                          mkflnm;
                     end;
             end
     end;

   function CanModify:Boolean;
    begin
         Result:=True;
         if FLOW_MONTH<>NMES then Result:=False;
    end;

function ExistWantedUdShifrInPerson(WantedShifr:integer;
                                    Curr_Person:Person_Ptr;
                                    WantedY:integer;
                                    WantedM:integer):boolean;
 var Y:integer;
     Curr_Ud:Ud_Ptr;
     Finded:boolean;
 begin
      Finded:=false;
      y:=WantedY;
      if Y>1900 then y:=y-1990;
      Curr_Ud:=Curr_Person^.Ud;
      while (Curr_Ud<>Nil) do
       begin
            if Curr_Ud^.Shifr=WantedShifr then
            if Curr_Ud^.Year=Y            then
            if Curr_Ud^.Period=WantedM    then
               begin
                    Finded:=true;
                    Break;
               end;
            Curr_Ud:=Curr_Ud^.Next;
       end;
      ExistWantedudShifrInPerson:=finded;
 end;
function ExistWantedAddShifrInPerson(WantedShifr:integer;
                                    Curr_Person:Person_Ptr;
                                    WantedY:integer;
                                    WantedM:integer):boolean;
 var Y:integer;
     Curr_Add:Add_Ptr;
     Finded:boolean;
 begin
      Finded:=false;
      y:=WantedY;
      if Y>1900 then y:=y-1990;
      Curr_Add:=Curr_Person^.Add;
      while (Curr_Add<>Nil) do
       begin
            if Curr_Add^.Shifr=WantedShifr then
            if Curr_Add^.Year=Y            then
            if Curr_Add^.Period=WantedM    then
               begin
                    Finded:=true;
                    Break;
               end;
            Curr_Add:=Curr_Add^.Next;
       end;
      ExistWantedAddShifrInPerson:=finded;
 end;


function CopyPodr(Action:integer) : boolean;
 var
  i               : Integer;
  Curr_Person     : Person_Ptr;
  Curr_Add        : Add_Ptr;
  Curr_Ud         : Ud_Ptr;
  Curr_Cn         : Cn_Ptr;
  Curr_Sowm       : Sowm_Ptr;
  Curr_Person_N   : Person_Ptr;
  Curr_Add_N      : Add_Ptr;
  Curr_Ud_N       : Ud_Ptr;
  Curr_Cn_N       : Cn_Ptr;
  Curr_Sowm_N     : Sowm_Ptr;
  TmpH            : PERSON_PTR;
  Head_Person_Tmp : PERSON_PTR;
  H_P_SRC,H_P_DST : PERSON_PTR;
 begin
      {
        Action = 0 save
               = 1 restore
      }
      Head_Person_Tmp:=HEAD_PERSON;
      Result:=False;
      if Action=0 then
         begin
              if CurrentPodrReadedByOperator<>NSRV then Exit;
              if not ((CurrentPodrReadedByOperator=SavedPodr) or (SavedPodr=0)) then Exit;
              if COUNT_PERSON<1 then Exit;
              if Assigned(HEAD_PERSON_SAVE) then EmptySavedArea;
              H_P_SRC:=HEAD_PERSON;
              H_P_DST:=HEAD_PERSON_SAVE;
         end
      else
         begin
              H_P_SRC:=HEAD_PERSON_SAVE;
              H_P_DST:=HEAD_PERSON;
              if Assigned(H_P_DST) then EmptyWorkArea;
         end;
      Curr_Person:=H_P_SRC;
      while Assigned(Curr_Person) do
       begin
            TmpH        := H_P_SRC;
            head_Person := H_P_DST;
            MAKE_PERSON(Curr_Person_n);
            H_P_DST:=head_Person;
            i:=COUNT_PERSON;
            H_P_SRC := TmpH;
            Move(Curr_Person^,Curr_Person_n^,SizeOf(Curr_Person^));
            Curr_Person_n^.NEXT := NIL;
            Curr_Person_n^.SOWM := NIL;
            Curr_Person_n^.ADD  := NIL;
            Curr_Person_n^.UD   := NIL;
            Curr_Person_n^.CN   := NIL;
            Curr_Add:=Curr_Person^.ADD;
            while (Curr_Add<>nil) do
              begin
                   Make_Add(Curr_Add_N,Curr_Person_N);
                   Move(Curr_Add^,Curr_Add_N^,SizeOf(Curr_Add^));
                   Curr_Add_N^.NEXT := nil;
                   Curr_Add:=Curr_Add^.NEXT;
              end;
            Curr_Ud:=Curr_Person^.Ud;
            while (Curr_Ud<>nil) do
              begin
                   Make_Ud(Curr_Ud_N,Curr_Person_N);
                   Move(Curr_Ud^,Curr_Ud_N^,SizeOf(Curr_Ud^));
                   Curr_Ud_N^.NEXT := nil;
                   Curr_Ud:=Curr_Ud^.NEXT;
              end;
            Curr_Cn:=Curr_Person^.Cn;
            while (Curr_Cn<>nil) do
              begin
                   Make_Cn(Curr_Cn_N,Curr_Person_N);
                   Move(Curr_Cn^,Curr_Cn_N^,SizeOf(Curr_Cn^));
                   Curr_Cn_N^.NEXT := nil;
                   Curr_Cn:=Curr_Cn^.NEXT;
              end;
            Curr_Sowm:=Curr_Person^.Sowm;
            while (Curr_Sowm<>nil) do
              begin
                   Make_Sowm(Curr_Sowm_N,Curr_Person_N);
                   Move(Curr_Sowm^,Curr_Sowm_N^,SizeOf(Curr_Sowm^));
                   Curr_Sowm_N.NEXT := nil;
                   Curr_Sowm := Curr_Sowm^.NEXT;
              end;
            Curr_Person:=Curr_Person^.Next;
       end;
      Head_Person:=H_P_DST;
      i:=count_Person;
      if Action=0 then
         Head_Person_Save:=H_P_DST;

//      Head_Person:=Head_Person_Tmp;
      SavedPodr:=NSRV;
      Result := true;
 end;

 procedure EmptyPersonArea(Action:integer);
  var Curr_Person:PERSON_PTR;
      H_P_DST:PERSON_PTR;
      HTmp:Person_Ptr;
  begin
       if Action=0 then
          begin
               H_P_DST:=HEAD_PERSON_SAVE;
               SavedPodr:=0;
          end
       else
          H_P_DST:=HEAD_PERSON;
       if not Assigned(H_P_DST) then Exit;
       Curr_Person:=H_P_DST;
       while Assigned(Curr_Person) do
        begin
             while (Assigned(Curr_Person^.Add))  do DEL_ADD(Curr_Person^.Add   , Curr_Person);
             while (Assigned(Curr_Person^.Ud))   do DEL_UD(Curr_Person^.Ud     , Curr_Person);
             while (Assigned(Curr_Person^.CN))   do DEL_CN(Curr_Person^.CN     , Curr_Person);
             while (Assigned(Curr_Person^.SOWM)) do DEL_Sowm(Curr_Person^.SOWM , Curr_Person);
             Curr_Person:=Curr_Person^.NEXT;
        end;
       HTmp:=HEAD_Person;
       Head_Person:=H_P_DST;
       while assigned(H_P_DST) do
          begin
               DEL_PERSON(H_P_DST);
               H_P_DST:=HEAD_PERSON;
          end;
       Head_Person:=HTmp;
       if Action=0 then
          HEAD_PERSON_SAVE:=nil
       else
          HEAD_PERSON:=nil;
  end;
 function SavePodr : boolean;
  begin
       Result:=CopyPodr(0);
  end;
 function RestorePodr : boolean;
  begin
       Result:=CopyPodr(1);
  end;
 procedure EmptySavedArea;
  begin
       EmptyPersonArea(0);
  end;
 procedure EmptyWorkArea;
  begin
       EmptyPersonArea(1);
  end;

  function FillClockForPerson(Tabno:Integer;Curr_Add:Add_Ptr):real;
   var C_Add    : Add_Ptr;
       RetVal   : Integer;
       C_Person : PERSON_PTR;
   begin
       RetVal:=0;
       c_Person:=HEAD_PERSON;
       while (C_Person<>Nil) do
         begin
              if C_Person^.Tabno=TABNO then
                 begin
                      C_Add := C_Person^.ADD;
                      while C_Add<>nil do
                        begin
                             if C_Add^.Shifr=Pochas_Shifr then
                             if C_Add<>Curr_Add then
                                RetVal:=RetVal+round(C_Add^.WORK_CLOCK);
                             C_Add:=C_Add^.NEXT;
                        end;
                 end;
              C_Person:=C_Person^.Next;
         end;
       FillClockForPerson:=RetVal;
   end;

  function FormatSummaForPlt(a:real):string;
   var S:string;
   begin
        S:=Format('%12.2f',[a]);
        s:=ReplChar(S,',',WantedCharForSummaPltFormat);
        s:=ReplChar(S,'.',WantedCharForSummaPltFormat);
        FormatSummaForPlt:=S;
   end;
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
FUNCTION GET_PERSON_CURFIL(CURFIL:INTEGER):PERSON_PTR;
 VAR I:INTEGER;
     CURR_PERSON:PERSON_PTR;
 BEGIN
   //   IF (SELECTED_FIELD=1) AND (FLAG_FILTER) THEN GET_PERSON_CURFIL:=PTR_PERSON_ARRAY[CURFIL]
   //                                           ELSE
      BEGIN
           CURR_PERSON:=INIT_PERSON_ITERATOR;
           I:=1;
           WHILE (I<CURFIL) DO
            BEGIN
                  IF GET_NEXT_PERSON_ITERATOR(CURR_PERSON) THEN;
                  INC(I);
            END;
           GET_PERSON_CURFIL:=CURR_PERSON;
      END;
 END;

 function makeJournalFileName(var escPressed:boolean):string;
  var f:TextFile;
      FName,Ch,S,SY,SM:string;
  begin
       escPressed := False;
       FName:=Trim(CDOC);
       Ch:=Copy(FName,Length(FName),1);
       sy:=IntToStr(CurrYear);
       sm:=IntToStr(Nmes);
       if  (not ((Ch='/') or (Ch='\'))) then FName:=FName+'\';
       FName:=FName+'journals\'+sy+'\'+sm;
       if not ForceDirectories(FName) then
          begin
               ShowMessage('Не удалось создать каталог '+FName);
               FName:='';
               makeJournalFileName:=FName;
               escPressed := True;
               Exit;
          end;
        FName:=FName+'\Journal.txt';
        AssignFile(f,FName);
        if not FileExists(FName) then
           begin
                Rewrite(f);
                writeln(f,'Журнал создан '+DateToStr(date)+' '+TimeToStr(Time));
                CloseFile(f);
           end;
        makeJournalFileName:=FName;

  end;
 function getNameHat:string;
  begin
       if modeIskra then
 //         Result:='НИПКИ ИСКРА'
          Result:=ORG_NAME
       else
          Result:='СХІДНОУКРАЇНСЬКИЙ НАЦІОНАЛЬНИЙ УНІВЕРСИТЕТ ім. В.ДАЛЯ';

  end;
 function convertTabnoToIskraOldStyle(snuTabno:integer):integer;
  var SqlStmnt:string;
      i:variant;
      t:Integer;
      IskraTabno:Integer;
      s:string;
  begin
       IskraTabno:=snuTabno;
       if modeIskra then
          begin
               s:=FIB.pFIBDatabaseSal.DBFileName;
               SQLStmnt:='select first 1 coalesce(nt,0) from tb_i_person where tabno_vnu='+inttostr(snuTabno);
               i:=FIB.pFIBDatabaseSal.QueryValue(SqlStmnt,0);
               try
                   t:=i;
               except
                 else
                   t:=snuTabno;
               end;
               if ((t>0) and (t<15000)) then
                  IskraTabno:=t;
          end;
       convertTabnoToIskraOldStyle:=IskraTabno;   
  end;

 function isParameterIskra:boolean;
   var i:Integer;
       s:string;
   begin
       isParameterIskra:=False;
       i:=ParamCount;
       if i=1 then
          begin
                s:=paramstr(1);
                s:=upper_string(trim(s));
                i:=Pos('SKRA',S);
                if (i>0) then
                   isParameterIskra:=True;
          end;

   end;
   function ConvertDataForDBF(D:TdateTime):string;
    var yw,mw,dw:word;
        yws,mws,dws:string;
    begin
         DecodeDate(D,yw,mw,dw);
         dws:=trim(IntToStr(dw));
         if length(dws)=1 then dws:='0'+dws;
         mws:=trim(IntToStr(mw));
         if length(mws)=1 then mws:='0'+mws;
         yws:=trim(IntToStr(yw));
         result:=dws+mws+yws;
    end;
   function ConvertDataToDDMMYYYY(D:TdateTime):string;
    var yw,mw,dw:word;
        yws,mws,dws:string;
    begin
         DecodeDate(D,yw,mw,dw);
         dws:=trim(IntToStr(dw));
         if length(dws)=1 then dws:='0'+dws;
         mws:=trim(IntToStr(mw));
         if length(mws)=1 then mws:='0'+mws;
         yws:=trim(IntToStr(yw));
         result:=dws+'/'+mws+'/'+yws;
    end;

function IsNumericString(S:String):Boolean;
 var RetVal:Boolean;
     i,l:Integer;
     ss:string;
     s1:string;
     ch:Char;
 begin
      RetVal:=True;
      ss:=Trim(s);
      l:=length(ss);
      if l=0 then
         begin
              IsNumericString:=RetVal;
              Exit;
         end;
      for i:=1 to l do
          begin
               s1:=Copy(ss,i,1);
               ch:=s1[1];
               if not (ch in ['0','1','2','3','4','5','6','7','8','9']) then
                  begin
                       retVal:=false;
                       Break;
                  end;
          end;
      IsNumericString:=RetVal;
 end;

 function SetWorkPlaceKadrySQL(WorkPlace:word;Tabno:integer):boolean;
  var SQLStmnt:string;
  begin
       Result:=true;
       SQLStmnt:='UPDATE KADRY SET SHIFR_POD='+IntToStr(WorkPlace)+' where tabno='+IntToStr(Tabno);
       FIB.pFIBDataBaseSAL.Execute(SQLStmnt)
  end;

 function ZeroWorkPlaceKadrySQL(Tabno:integer):boolean;
  var SQLStmnt:string;
  begin
       Result:=true;
       SQLStmnt:='UPDATE KADRY SET SHIFR_POD=0 where tabno='+IntToStr(Tabno);
       FIB.pFIBDataBaseSAL.Execute(SQLStmnt)
  end;


 function GetMd5ForNSRV:string;
  var Curr_Person : PERSON_PTR;
      Curr_Add    : Add_Ptr;
      Curr_Ud     : UD_PTR;
      Curr_Cn     : Cn_Ptr;
      Curr_Sowm   : Sowm_Ptr;
      personRec   : PERSON;
      addRec      : Add;
      udRec       : Ud;
      cnRec       : Cn;
      sowmRec     : Sowm;
    //  s:string;
  begin
     //  InitCurrContext;
       Curr_Person:=Head_Person;
       while (Curr_Person<>Nil) do
         begin
              FillChar(personrec,SizeOf(PersonRec),0);
              move(Curr_Person^,personrec,SizeOf(personrec));
              FillChar(personRec.FIO,SizeOf(PersonRec.Fio),0);
              Move(curr_Person^.fio,personRec.FIO,Length(Trim(Curr_Person^.fio)));
              FillChar(personRec.Dolg,SizeOf(PersonRec.Dolg),0);
              Move(curr_Person^.Dolg,personRec.Dolg,Length(Trim(Curr_Person^.Dolg)));
              FillChar(personRec.N_Temy,SizeOf(PersonRec.N_Temy),0);
              Move(curr_Person^.N_Temy,personRec.N_Temy,Length(Trim(Curr_Person^.N_Temy)));
              UpdateCurrContext(@personRec,SizeOf(personrec)-SizeOf(Add_ptr)-SizeOf(Ud_Ptr)-SizeOf(Person_Ptr)-SizeOf(Sowm_Ptr));
              Curr_Add:=Curr_Person^.Add;
              while (Curr_Add<>Nil) do
              begin
                   FillChar(addRec,SizeOf(addRec),0);
                   move(Curr_Add^,addRec,SizeOf(addRec));
                   FillChar(addRec.Count,SizeOf(addRec.Count),0);
                   Move(curr_Add^.Count,addRec.Count,Length(Trim(Curr_Add^.Count)));
                   UpdateCurrContext(@addRec,SizeOf(addRec)-SizeOf(Add_ptr));
                   Curr_Add:=Curr_Add.NEXT;
              end;
              Curr_Ud:=Curr_Person^.Ud;
              while (Curr_Ud<>Nil) do
              begin
                   FillChar(udRec,SizeOf(udRec),0);
                   move(Curr_Ud^,udRec,SizeOf(udRec));
                   FillChar(udRec.Count,SizeOf(udRec.Count),0);
                   Move(curr_Ud^.Count,udRec.Count,Length(Trim(Curr_Ud^.Count)));
                   UpdateCurrContext(@udRec,SizeOf(udRec)-SizeOf(Ud_ptr));
                   Curr_Ud:=Curr_Ud.NEXT;
              end;
              Curr_Cn:=Curr_Person^.Cn;
              while (Curr_Cn<>Nil) do
              begin
                   FillChar(cnRec,SizeOf(cnRec),0);
                   move(Curr_Cn^,cnRec,SizeOf(cnRec));
                   FillChar(cnRec.Count,SizeOf(cnRec.Count),0);
                   Move(curr_cn^.Count,cnRec.Count,Length(Trim(Curr_cn^.Count)));
                   FillChar(cnRec.PRim_1,SizeOf(cnRec.Prim_1),0);
                   Move(curr_cn^.Prim_1,cnRec.Prim_1,Length(Trim(Curr_cn^.Prim_1)));
                   UpdateCurrContext(@cnRec,SizeOf(cnRec)-SizeOf(Cn_ptr));
                   Curr_Cn:=Curr_Cn.NEXT;
              end;
              Curr_Sowm:=Curr_Person^.Sowm;
              while (Curr_Sowm<>Nil) do
              begin
                   FillChar(sowmRec,SizeOf(sowmRec),0);
                   move(Curr_Sowm^,sowmRec,SizeOf(sowmRec));
                   UpdateCurrContext(@sowmRec,SizeOf(sowmRec)-SizeOf(Sowm_ptr));
                   Curr_Sowm:=Curr_Sowm.NEXT;
              end;
              Curr_Person:=Curr_Person.NEXT;
         end;
        FinalCurrContext;
        GetMd5ForNSRV:=MD5CurrDigestToStr;


  end;

 function GetFeaturesOfNSRV(var nmbofperson,nmbofadd,nmbofud,nmbofcn,nmbofsowm:integer):boolean;
  var Curr_Person : PERSON_PTR;
      Curr_Add    : Add_Ptr;
      Curr_Ud     : UD_PTR;
      Curr_Cn     : Cn_Ptr;
      Curr_Sowm   : Sowm_Ptr;
      personRec   : PERSON;
      sowmRec     : Sowm;
  begin
       nmbofperson:=0;
       nmbofadd   :=0;
       nmbofud    :=0;
       nmbofcn    :=0;
       nmbofsowm  :=0;
       Curr_Person:=Head_Person;
       while (Curr_Person<>Nil) do
         begin
              Curr_Add:=Curr_Person^.Add;
              while (Curr_Add<>Nil) do
              begin
                   Inc(NmbOfAdd);
                   Curr_Add:=Curr_Add.NEXT;
              end;
              Curr_Ud:=Curr_Person^.Ud;
              while (Curr_Ud<>Nil) do
              begin
                   Inc(NmbOfUd);
                   Curr_Ud:=Curr_Ud.NEXT;
              end;
              Curr_Cn:=Curr_Person^.Cn;
              while (Curr_Cn<>Nil) do
              begin
                   Inc(NmbOfCn);
                   Curr_Cn:=Curr_Cn.NEXT;
              end;
              Curr_Sowm:=Curr_Person^.Sowm;
              while (Curr_Sowm<>Nil) do
              begin
                   Inc(NmbOfSowm);
                   Curr_Sowm:=Curr_Sowm.NEXT;
              end;
              Inc(NmbOfPerson);
              Curr_Person:=Curr_Person.NEXT;
         end;
       GetFeaturesOfNSRV:=True;

  end;
 procedure putNSRVFeaturesToSQL(Op:string);
  var SQLStmnt,MD5:widestring;
      nmbOfPerson,nmbOfAdd,nmbOfUd,nmbOfCN,nmbOfSowm:Integer;
  begin
       MD5:=GetMd5ForNSRV;
       GetFeaturesOfNSRV(nmbOfPerson,nmbOfAdd,nmbOfUd,nmbOfCN,nmbOfSowm);
       SQLStmnt:='insert into tb_io_statistic (NSRV,NMES_THIS, NMES_CURR, YEAR_ZA, YEAR_CURR,NMBOFPERSON, NMBOFADD,  NMBOFUD, NMBOFCN, NMBOFSOWM,OPERATION, MD5,FNINF) values(';
       SQLStmnt:=trim(SQLStmnt)+IntToStr(NSRV)+',';
       SQLStmnt:=trim(SQLStmnt)+IntToStr(NMES)+',';
       SQLStmnt:=trim(SQLStmnt)+IntToStr(FLOW_MONTH)+',';
       SQLStmnt:=trim(SQLStmnt)+IntToStr(CURRYEAR)+',';
       SQLStmnt:=trim(SQLStmnt)+IntToStr(CURRYEAR)+',';
       SQLStmnt:=trim(SQLStmnt)+IntToStr(NMbOfPerson)+',';
       SQLStmnt:=trim(SQLStmnt)+IntToStr(NMbOfAdd)+',';
       SQLStmnt:=trim(SQLStmnt)+IntToStr(NMbOfUd)+',';
       SQLStmnt:=trim(SQLStmnt)+IntToStr(NMbOfCn)+',';
       SQLStmnt:=trim(SQLStmnt)+IntToStr(NMbOfSowm)+',';
       SQLStmnt:=trim(SQLStmnt)+''''+trim(OP)+''',';
       SQLStmnt:=trim(SQLStmnt)+''''+trim(MD5)+''',';
       SQLStmnt:=trim(SQLStmnt)+''''+trim(FNINF)+''')';
       FIB.pFIBDatabaseSal.Execute(SQLStmnt);

  end;


 procedure putNSRVFeaturesToSQLAfterPutInf;
  begin
       putNSRVFeaturesToSQL('PUT');
  end;

 procedure putNSRVFeaturesToSQLAfterGetInf;
  begin
       putNSRVFeaturesToSQL('GET');
  end;

function CompareNSRV(var Mes:string):Boolean;
 var SQLStmnt,MD5Old,MD5New:string;
      nmbOfPersonOld,nmbOfAddOld,nmbOfUdOld,nmbOfCNOld,nmbOfSowmOld:Integer;
      nmbOfPersonNew,nmbOfAddNew,nmbOfUdNew,nmbOfCNNew,nmbOfSowmNew:Integer;
      pv:Variant;
      i:Integer;
      retVal : Boolean;
 begin
      Mes:='';
      nmbofPersonOld := 0;
      nmbofAddOld    := 0;
      nmbofUdOld     := 0;
      nmbofCnOld     := 0;
      nmbofSowmOld   := 0;
      Md5Old         := '';
      nmbofPersonNew := 0;
      nmbofAddNew    := 0;
      nmbofUdNew     := 0;
      nmbofCnNew     := 0;
      nmbofSowmNew   := 0;
      Md5New         := '';
      retVal         := True;
      SQLStmnt:='select count(*) from tb_io_statistic where nsrv='+inttostr(nsrv)+' and nmes_this='+inttostr(nmes);
      pv:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
      i:=pv[0];
      if i=0 then
         begin
              result:=True;
              Exit;
         end;
      SQLStmnt:='select first 1 nmbofperson,nmbofadd,nmbofud,nmbofcn,nmbofsowm,md5 from tb_io_statistic where nsrv='+inttostr(nsrv)+' and nmes_this='+inttostr(nmes)+' order by datewrk desc';
      pv:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
      try
          nmbofPersonOld:= pv[0];
          nmbOfAddOld   := pv[1];
          nmbOfUdOld    := pv[2];
          nmbOfCNOld    := pv[3];
          nmbOfSowmOld  := pv[4];
          MD5Old        := pv[5];
        except
        else
          begin
               nmbOfPersonOld := 0;
               nmbOfAddOld    := 0;
               nmbofUdOld     := 0;
               nmbofCnOld     := 0;
               nmbOfSowmOld   := 0;
               MD5Old         := '';
          end;
      end;
      retVal:=True;
      if nmbOfPersonOld>0 then
        begin
             GetFeaturesOfNSRV(nmbOfPersonNew,nmbOfAddNew,nmbOfUdNew,nmboFCnNew,nmbOfSowmNew);
             MD5New:=getMd5ForNSRV;
             if nmbOfPersonOld<>nmbOfPersonNew          then
                begin
                     Mes:='К-во работников было '+IntToStr(nmbOfPersonOld)+'. Прочитано '+IntToStr(nmbOfPersonNew);
                     retVal:=False;
                end;
             if retVal and (nmbOfAddOld<>nmbOfAddNew)   then
                begin
                     Mes:='К-во начислений было '+IntToStr(nmbOfAddOld)+'. Прочитано '+IntToStr(nmbOfAddNew);
                     retVal:=False;
                end;
             if retVal and (nmbOfUdOld<>nmbOfUdNew)     then
                begin
                     Mes:='К-во удержаний было '+IntToStr(nmbOfUdOld)+'. Прочитано '+IntToStr(nmbOfUdNew);
                     Mes:='К-во удержаний было '+IntToStr(nmbOfUdOld)+'. Прочитано '+IntToStr(nmbOfUdNew);
                     retVal:=False;
                end;
             if retVal and (nmbOfCnOld<>nmbOfCnNew)     then
                begin
                     Mes:='К-во пост.инф было '+IntToStr(nmbOfCNOld)+'. Прочитано '+IntToStr(nmbOfCnNew);
                     retVal:=False;
                end;
             if retVal and (nmbOfSowmOld<>nmbOfSowmNew) then
                begin
                     Mes:='К-во совмещений было '+IntToStr(nmbOfSowmOld)+'. Прочитано '+IntToStr(nmbOfSowmNew);
                     retVal:=False;
                end;
     //        if retVal and (trim(MD5Old)<>Trim(MD5New)) then retVal:=False;
        end;
      CompareNSRV:=retVal;

 end;
function EnCodeDataToPrim1(Dt:TDateTime):String;
 var S,WS:string;
     Y:integer;
  begin
       S:=IntToStr(DayOf(dt));
       if Length(s)=1 then s:='0'+s;
       s:=s+'.';
       WS:=IntToStr(MonthOf(dt));
       if Length(ws)=1 then ws:='0'+ws;
       s:=s+ws+'.';
       y:=YearOf(Dt);
       if ((Y<2000) and (Y>1900)) then
          Y:=Y-1900
       else
       if ((Y>2000) and (Y<2100)) then
          Y:=Y-2000;
       WS:=IntToStr(Y);
       if Length(ws)=1 then ws:='0'+ws;
       s:=s+ws;
       EnCodeDataToPrim1:=S;
  end;

function DecodeDataFromPrim1(S:String):TDateTime;
 type state=(Day,Month,Year);
 var
      DataWrk:TDateTime;
      c:Char;
      M,d,y:word;
      i,l,v,k:Integer;
      ws:string;
      st:state;
      Err:Boolean;
 begin
      FillChar(DataWrk,SizeOf(DataWrk),0);
      y:=0;
      m:=0;
      d:=0;
      i:=0;
      s:=Trim(s);
      l:=Length(s);
      st:=Day;
      ws:='';
      Err:=false;
      if ((l>0) and (l<9)) then
         begin

              while (i<l) do
               begin
                     Inc(i);
                     c:=s[i];
                     if c in ['.','/'] then
                        begin
                             ws:=Trim(ws);
                             if ((Length(ws)>0) and (Length(ws)<3)) then
                                begin
                                      Val(ws,v,k);
                                      if (k=0) then
                                         case st of
                                          Day   : begin
                                                       d := v;
                                                       ws:='';
                                                       st:=Month;
                                                  end;
                                          Month : begin
                                                       m := v;
                                                       ws:='';
                                                       st:=Year;
                                                  end;
                                          else
                                               err:=True;                                     y := v;
                                         end
                                      else
                                         err:=true
                                end
                             else
                                err:=true;
                        end
                     else
                        if (c in ['0'..'9']) then
                           ws:=Trim(ws)+c;
                     if Length(trim(ws))>2 then
                        Err:=true;
                     if Err then Break;
               end;
             if ((not Err) and (st=Year) and (Length(Trim(ws))>0) and (Length(Trim(ws))<3)) then
                begin
                     Val(ws,v,k);
                     if (k=0) then
                        begin
                             y:=v;
                             if y>50 then y:=y+1900
                                     else y:=y+2000;
                        end
                     else
                        err:=True;
                end;
             if not Err then
                DataWrk:=EncodeDate(y,m,d);
         end;
      DecodeDataFromPrim1:=DataWrk;

 end;

function getDataUwPerson(Curr_Person:Person_Ptr):TDateTime;
 var Curr_Cn:CN_PTR;
     Finded:Boolean;
     DataUw:TDateTime;
 begin
      if Curr_Person^.tabno=950 then
         FillChar(DataUw,SizeOf(DataUw),0);

      FillChar(DataUw,SizeOf(DataUw),0);
      curr_cn:=Curr_Person.CN;
      Finded:=False;

      while (Curr_Cn<>Nil) do
       begin
            if Curr_Cn.shifr=DataUwShifr+Limit_Cn_Base then
               begin
                    Finded:=True;
                    Break;
               end;
            Curr_Cn:=Curr_Cn.Next;
       end;
      if Finded then
         DataUw:=DecodeDataFromPrim1(Curr_Cn.Prim_1);

      getDataUwPerson:=DataUw;

 end;
procedure setDataUwPerson(Curr_Person:Person_Ptr;DataUwPerson:TDateTime);
 var Curr_Cn:CN_PTR;
     Finded:Boolean;
     DataUw:TDateTime;
     Y,M,D:Integer;
     DataB,DataE:TDateTime;
     dateS:String;
 begin
      Y:=1950;
      M:=1;
      d:=1;
      DataB:=EnCodedate(Y,M,D);
      Y:=2100;
      DataE:=EnCodedate(Y,M,D);
      If DateBetween(DataUwPerson,DataB,DataE) then
         begin
               dateS:=EnCodeDataToPrim1(DataUwPerson);
               Finded:=False;
               Curr_Cn:=Curr_Person.CN;
               while (Curr_Cn<>Nil) do
                 begin
                      if Curr_Cn.Shifr=DataUwShifr+Limit_Cn_Base then
                      if trim(Curr_Cn.Prim_1)=Trim(dateS) then Finded:=True
                      else
                         begin
                              Curr_Cn.Prim_1:=Trim(dateS);
                              Finded:=True;
                         end;
                      if Finded then Break;
                      Curr_CN:=Curr_Cn.Next;
                 end;
               if not Finded then
                  begin
                       Make_Cn(Curr_Cn,Curr_Person);
                       Curr_Cn.SHIFR := DataUwShifr+Limit_Cn_Base;
                       Curr_Cn.KOD   := 100;
                       Curr_Cn.PRIM_1 := dateS;
                  end;

         end
      else
         begin
               Curr_Cn:=Curr_Person.CN;
               while (Curr_Cn<>Nil) do
                 begin
                      if Curr_Cn.Shifr=DataUwShifr+Limit_Cn_Base then
                         begin
                              DEL_CN(Curr_Cn,Curr_Person);
                              Break;
                         end;
                      Curr_CN:=Curr_Cn.Next;
                 end;

         end
 end;

function getDayOfUwol(Curr_Person:Person_Ptr):Integer;
 var Dt:TDateTime;
     RetVal:Integer;
     DtCurrFirst,DtCurrLast:TDateTime;
 begin
//     if (isSVDN) and (NMES=7) then
//        begin
//             getDayOfUwol:=100;
//             Exit;
//        end;
     RetVal:=0;
     Dt:=getDataUwPerson(Curr_Person);
     DtCurrFirst:=EncodeDate(WORK_YEAR_VAL,FLOW_MONTH,1);
     DtCurrLast:=EndOfTheMonth(DtCurrFirst);
     if DateBetween(Dt,DtCurrFirst,DtCurrLast) then
        RetVal:=DayOf(Dt)
     else
     if DtCurrLast<Dt then RetVal:=100;   //Дата больше расчетной
     if YearOf(Dt)<1990 then RetVal:=100; // Дата отсутствует
     getDayOfUwol:=RetVal;

 end;

function getDayOfUwolFromSQL(Curr_Person:Person_Ptr):Integer;
 var Dt:TDateTime;
     RetVal:Integer;
     DtCurrFirst,DtCurrLast:TDateTime;
 begin
     RetVal:=0;
     Dt:=getDataUwPersonFromSQL(Curr_Person^.tabno);
     DtCurrFirst:=EncodeDate(WORK_YEAR_VAL,FLOW_MONTH,1);
     DtCurrLast:=EndOfTheMonth(DtCurrFirst);
     if DateBetween(Dt,DtCurrFirst,DtCurrLast) then
        RetVal:=DayOf(Dt)
     else
     if DtCurrLast<Dt then RetVal:=100;   //Дата больше расчетной
     if YearOf(Dt)<1990 then RetVal:=100; // Дата отсутствует
     if isSVDN then
     if YearOf(Dt)<2014 then RetVal:=100; // Дата отсутствует
     getDayOfUwolFromSQL:=RetVal;

 end;

 function getDayOfUwolFromSQLForNMES(Curr_Person:Person_Ptr):Integer;
 var Dt:TDateTime;
     RetVal:Integer;
     DtCurrFirst,DtCurrLast:TDateTime;
 begin
     RetVal:=0;
     Dt:=getDataUwPersonFromSQL(Curr_Person^.tabno);
     DtCurrFirst:=EncodeDate(CurrYear,NMES,1);
     DtCurrLast:=EndOfTheMonth(DtCurrFirst);
     if DateBetween(Dt,DtCurrFirst,DtCurrLast) then
        RetVal:=DayOf(Dt)
     else
     if DtCurrLast<Dt then RetVal:=100;   //Дата больше расчетной
     if YearOf(Dt)<1990 then RetVal:=100; // Дата отсутствует
     if isSVDN then
     if YearOf(Dt)<2014 then RetVal:=100; // Дата отсутствует
     getDayOfUwolFromSQLForNMES:=RetVal;

 end;

function getDayOfPriFromSQL(Curr_Person:Person_Ptr):Integer;
 var Dt:TDateTime;
     RetVal:Integer;
     DtCurrFirst,DtCurrLast:TDateTime;
 begin
     RetVal:=0;
     Dt:=getDataPriPersonFromSQL(Curr_Person^.tabno);
     DtCurrFirst:=EncodeDate(WORK_YEAR_VAL,FLOW_MONTH,1);
     DtCurrLast:=EndOfTheMonth(DtCurrFirst);
     if DateBetween(Dt,DtCurrFirst,DtCurrLast) then
        RetVal:=DayOf(Dt)
     else
     if DtCurrLast<Dt then RetVal:=100;   //Дата больше расчетной
     if YearOf(Dt)<1990 then RetVal:=100; // Дата отсутствует
     if isSVDN then
     if YearOf(Dt)<2014 then RetVal:=100; // Дата отсутствует
     getDayOfPriFromSQL:=RetVal;

 end;
function getDayOfPriFromSQLForNMES(Curr_Person:Person_Ptr):Integer;
 var Dt:TDateTime;
     RetVal:Integer;
     DtCurrFirst,DtCurrLast:TDateTime;
 begin
     RetVal:=0;
     Dt:=getDataPriPersonFromSQL(Curr_Person^.tabno);
     DtCurrFirst:=EncodeDate(CURRYEAR,NMES,1);
     DtCurrLast:=EndOfTheMonth(DtCurrFirst);
     if DateBetween(Dt,DtCurrFirst,DtCurrLast) then
        RetVal:=DayOf(Dt)
     else
     if DtCurrLast<Dt then RetVal:=100;   //Дата больше расчетной
     if YearOf(Dt)<1990 then RetVal:=100; // Дата отсутствует
     if isSVDN then
     if YearOf(Dt)<2014 then RetVal:=100; // Дата отсутствует
     getDayOfPriFromSQLForNMES:=RetVal;

 end;

 function isUwolenFromSQL(Curr_Person:Person_Ptr):boolean;
 var DtUw   : TDateTime;
     DtPri  : TDateTime;
     RetVal : boolean;
     DtCurrFirst,DtCurrLast:TDateTime;
     d:Integer;
 begin
     RetVal:=false;
     DtUw  := getDataUwPersonFromSQL(Curr_Person^.tabno);
     DtPri := getDataUwPersonFromSQL(Curr_Person^.tabno);
     DtCurrFirst:=EncodeDate(WORK_YEAR_VAL,FLOW_MONTH,1);
     DtCurrLast:=EndOfTheMonth(DtCurrFirst);
     d:=0;
     if DateBetween(DtUw,DtCurrFirst,DtCurrLast) then
        d:=DayOf(DtUw);
     if (d=0) then
         if YearOf(DtUw)>1990 then
         if DtUw>DtPri then
            d:=10;
     if d>0 then retVal:=True;
     isUwolenFromSQL:=RetVal;

 end;
 function isUwolenFromSQLForNMES(Curr_Person:Person_Ptr):boolean;
 var DtUw   : TDateTime;
     DtPri  : TDateTime;
     RetVal : boolean;
     DtCurrFirst,DtCurrLast:TDateTime;
     d:Integer;
 begin
     RetVal:=false;
     DtUw  := getDataUwPersonFromSQL(Curr_Person^.tabno);
     DtPri := getDataUwPersonFromSQL(Curr_Person^.tabno);
     DtCurrFirst:=EncodeDate(CurrYear,NMES,1);
     DtCurrLast:=EndOfTheMonth(DtCurrFirst);
     d:=0;
     if DateBetween(DtUw,DtCurrFirst,DtCurrLast) then
        d:=DayOf(DtUw);
     if (d=0) then
         if YearOf(DtUw)>1990 then
         if DtUw>DtPri then
            d:=10;
     if d>0 then retVal:=True;
     isUwolenFromSQLForNMES:=RetVal;

 end;

 function isPrinjatFromSQL(Curr_Person:Person_Ptr):boolean;
 var DtUw   : TDateTime;
     DtPri  : TDateTime;
     RetVal : boolean;
     DtCurrFirst,DtCurrLast:TDateTime;
     d:Integer;
 begin
     RetVal:=false;
     DtUw  := getDataUwPersonFromSQL(Curr_Person^.tabno);
     DtPri := getDataPriPersonFromSQL(Curr_Person^.tabno);
     DtCurrFirst:=EncodeDate(WORK_YEAR_VAL,FLOW_MONTH,1);
     DtCurrLast:=EndOfTheMonth(DtCurrFirst);
     d:=0;
     if DateBetween(DtPri,DtCurrFirst,DtCurrLast) then
        d:=DayOf(DtPri);
//     if (d=0) then
//         if YearOf(DtUw)>1990 then
//         if DtUw>DtPri then
//            d:=10;
     if d>0 then retVal:=True;
     isPrinjatFromSQL:=RetVal;

 end;
 function isPrinjatFromSQLForNMES(Curr_Person:Person_Ptr):boolean;
 var DtUw   : TDateTime;
     DtPri  : TDateTime;
     RetVal : boolean;
     DtCurrFirst,DtCurrLast:TDateTime;
     d:Integer;
 begin
     RetVal:=false;
     DtUw  := getDataUwPersonFromSQL(Curr_Person^.tabno);
     DtPri := getDataPriPersonFromSQL(Curr_Person^.tabno);
     DtCurrFirst:=EncodeDate(CURRYEAR,NMES,1);
     DtCurrLast:=EndOfTheMonth(DtCurrFirst);
     d:=0;
     if DateBetween(DtPri,DtCurrFirst,DtCurrLast) then
        d:=DayOf(DtPri);
//     if (d=0) then
//         if YearOf(DtUw)>1990 then
//         if DtUw>DtPri then
//            d:=10;
     if d>0 then retVal:=True;
     isPrinjatFromSQLForNMES:=RetVal;

 end;



procedure CheckTabelForUwol(Curr_Person:Person_Ptr);
 var D,I:Integer;
 PROCEDURE FILL_STANDARD_TABEL;
  VAR I:INTEGER;
  BEGIN
       FOR I:=1 TO 31 DO
           //     CASE DAY_KOD[I] OF
                CASE GetDayCode(I) OF
                     0 : CURR_PERSON^.TABEL[I]:=NEZAPOLN;
                     1 : CURR_PERSON^.TABEL[I]:=JAWKA;
                     2 : IF isFiveDayMode(CURR_PERSON) THEN CURR_PERSON^.TABEL[I]:=VYHODN
                                                       ELSE CURR_PERSON^.TABEL[I]:=JAWKA;
                     3 : CURR_PERSON^.TABEL[I]:=VYHODN;
                     4 : CURR_PERSON^.TABEL[I]:=VYHODN;
                END;
 {      MAKE_OTP_TABEL(CURR_PERSON);}
  END;

 begin
      if Curr_Person.Automatic<>AUTOMATIC_MODE then  Exit;
      if FLOW_MONTH<>NMES         THEN Exit;
      if CurrYear<>WORK_YEAR_VAL  then Exit;
      D:=getDayOfUwol(Curr_Person);
      if ((d<1) or (d>31)) then Exit;
  //    FILL_STANDARD_TABEL;
      MAKE_OTP_TABEL_FROM_SQL(Curr_Person);
      if (d<31) then
        for i:= d+1 to 31 do
            Curr_Person^.TABEL[i]:=NEZAPOLN;
 end;

function getStaNameForSwodFromSQL(WantedShifr:integer):string;
  var retVal,SQLStmnt:string;
      v:Variant;
  begin
      retVal:='';
      SQLStmnt:='select first 1 NameForSwod from shifr where shifr='+IntToStr(wantedShifr);
      v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
      if VarIsStr(v) then
         retVal:=v;
      retVal:=Trim(retVal);
      getStaNameForSwodFromSQL:=retVal;
  end;


function GetMemoryTotalPhys : DWord; 
   var memStatus: TMemoryStatus;
   begin
       memStatus.dwLength := sizeOf ( memStatus );
       GlobalMemoryStatus ( memStatus );
       Result := memStatus.dwTotalPhys;
   end;

function IsBankShifr(Shifr:integer):Boolean;
 var retVal:Boolean;
 begin

      retVal:=false;
      if (Shifr=52) or   // ыплаты черз кассу
         (Shifr=53) or
         (Shifr=67) or
         (Shifr=69) or
         (Shifr=70) or
         (Shifr=72) or
         (Shifr=76) or
         (Shifr=86) or
         (Shifr=87) or
         (Shifr=77) or  // Далее выплаты банка
         (Shifr=91) or
         (Shifr=102) or
         (Shifr=103) or
         (Shifr=104) or
         (Shifr=123) or
         (Shifr=124) or
         (Shifr=125) or
         (Shifr=131) or
         (Shifr=132) or
         (Shifr=133) or
         (Shifr=134) or
         (Shifr=135) or
         (Shifr=136) then
         retVal:=True;

      IsBankShifr:=retVal;
 end;
 function getOkladLastForRazr(wantedRazr:integer):real;
  var retVal:Real;
  begin
       retVal:=0;
       if ((WantedRazr>0) and (WantedRazr<26)) then
          retVal:=OkladyRazr[wantedRazr];
       getOkladLastForRazr:=retVal;
  end;

procedure RestPerson09(Curr_Person:Person_Ptr;fname:string);
 var dev:TextFile;
   //  fName:string;
     s,s1:string;
     iVal,iErr:Integer;
     Finished:Boolean;
     stage:Integer;
     aVal:Real;
     Shifr:Integer;
     Summa:Real;
  procedure AddAdd(Shifr:Integer;Summa:Real);
   var Curr_Add:ADD_PTR;
   begin
        MAKE_ADD(Curr_Add,Curr_Person);
        Curr_Add.SHIFR:=shifr;
        Curr_Add.SUMMA:=summa;
        Curr_Add.FZP:=Summa;
        Curr_Add.YEAR:=2014-1990;
        Curr_Add.PERIOD:=9;
        Curr_Add.VYPLACHENO:=GET_OUT;
        Curr_Add.WHO:=90;
   end;
  procedure AddUd(Shifr:Integer;Summa:Real);
   var Curr_Ud:UD_PTR;
   begin
        MAKE_UD(Curr_Ud,Curr_Person);
        Curr_Ud.SHIFR:=shifr;
        Curr_Ud.SUMMA:=summa;
        Curr_Ud.YEAR:=2014-1990;
        Curr_Ud.PERIOD:=9;
        Curr_Ud.VYPLACHENO:=GET_OUT;
        Curr_Ud.WHO:=90;
   end;
  function TestPerson:Boolean;
   begin
        if COUNT_ADD(Curr_Person)>0 then
           begin
                TestPerson:=False;
                Exit;
           end;
        if COUNT_UD(curr_person)<>1 then
           begin
                TestPerson:=False;
                Exit;
           end;
        TestPerson:=true;
   end;

 function getTabno:Boolean;
  var s,s1:string;
      iVal,iErr:Integer;
      Finded:Boolean;
  begin
       finded:=false;
       while not Eof(dev) do
          begin
               readln(dev,s);
               s:=Trim(s);
               if Pos('ентябрь',s)<1 then Continue;
               readln(dev,s);
               s1:=Copy(s,1,5);
               s1:=Trim(s1);
               if not IsNumericString(s1) then Continue;
               Val(s1,iVal,IErr);
               if iErr<>0 then Continue;
               if (iVal=curr_person^.TABNO) then
                  begin
                       finded:=True;
                       Break;
                  end;
          end;
       getTabno:=Finded;
  end;
  function getAdd:boolean;
   var retVal:Boolean;
        S1:string;
        iVal,iErr:Integer;
        aVal:Real;
   begin
        retVal:=false;
        Shifr:=0;
        summa:=0;
        s1:=Copy(s,1,4);
        s1:=Trim(s1);
        if not IsNumericString(s1) then
           begin
                getAdd:=False;
                Exit;
           end;
        Val(s1,iVal,IErr);
        if iErr<>0 then
           begin
                getAdd:=False;
                Exit;
           end;
        if not ShifrList.IsAdd(iVal) then
           begin
                getAdd:=False;
                Exit;
           end;
        s1:=Copy(s,36,Length(s)-36+1);
        s1:=Trim(s1);
        if Length(s1)<3 then
           begin
                getAdd:=False;
                Exit;
           end;
        s1:=StringReplace(s1,' ','',[rfReplaceAll]);
        s1:=StringReplace(s1,',','.',[rfReplaceAll]);
        Val(s1,aVal,iErr);
        if iErr<>0 then
           begin
                getAdd:=False;
                Exit;
           end;
        if not ((aVal>0) and (aVal<10000)) then
           begin
                getAdd:=False;
                Exit;
           end;

        shifr:=iVal;
        Summa:=aVal;
        getAdd:=true;
   end;
  function getUd:boolean;
   var retVal:Boolean;
        S1:string;
        iVal,iErr:Integer;
        aVal:Real;
   begin
        retVal:=false;
        Shifr:=0;
        summa:=0;
        s1:=Copy(s,5,4);
        s1:=Trim(s1);
        if not IsNumericString(s1) then
           begin
                getUd:=False;
                Exit;
           end;
        Val(s1,iVal,IErr);
        if iErr<>0 then
           begin
                getUd:=False;
                Exit;
           end;
        if ShifrList.IsAdd(iVal) then
           begin
                getUd:=False;
                Exit;
           end;
        s1:=Copy(s,41,Length(s)-41+1);
        s1:=Trim(s1);
        if Length(s1)<3 then
           begin
                getUd:=False;
                Exit;
           end;
        s1:=StringReplace(s1,' ','',[rfReplaceAll]);
        s1:=StringReplace(s1,',','.',[rfReplaceAll]);
        Val(s1,aVal,iErr);
        if iErr<>0 then
           begin
                getUd:=False;
                Exit;
           end;
        if not ((aVal>0) and (aVal<10000)) then
           begin
                getUd:=False;
                Exit;
           end;

        shifr:=iVal;
        Summa:=aVal;
        getUd:=true;
   end;
  function testCorrectPerson:boolean;
    var summa:Real;
        curr_Add:ADD_PTR;
        curr_ud:UD_PTR;
        done:Boolean;
    begin
        summa:=0;
        curr_add:=curr_Person.ADD;
        while (curr_Add<>Nil) do
         begin
              summa:=summa+Curr_add.SUMMA;
              Curr_Add:=curr_Add.NEXT;
         end;
        curr_ud:=curr_Person.uD;
        while (curr_ud<>Nil) do
         begin
              summa:=summa-Curr_ud.SUMMA;
              Curr_ud:=curr_ud.NEXT;
         end;
        if Abs(summa)>0.05 then
           begin
                ShowMessage('Ошибка '+IntToStr(Curr_Person^.tabno)+' '+Curr_Person.fio);
                while (Curr_Person.add<>Nil) do DEL_ADD(Curr_Person.Add,curr_person);
                repeat
                      done:=True;
                      curr_ud:=curr_Person^.UD;
                      while (curr_ud<>nil) do
                       begin
                            if curr_ud^.who=90 then
                               begin
                                    DEL_UD(curr_ud,curr_person);
                                    done:=False;
                                    Break;
                               end;
                            curr_ud:=curr_ud.NEXT;
                       end;
                       if done then Break;
                until false;
           end;
    end;
 begin
      if not TestPerson then Exit;
    //  fName:=cdir+'pps.txt';
    //  fName:=cdir+'uwp.txt';
   //   fName:=cdir+'adm.txt';
      AssignFile(dev,fname);
      Reset(dev);
      if not getTabno then
         begin
             CloseFile(dev);
             Exit;
         end;
      stage:=0;
      while (not Eof(dev)) do
         begin
              readln(dev,s);
              if Pos('*****',s)>0 then
                 Break;
              if Pos('-------------',s)>0 then
                 Break;
              if Pos('тябрь',s)>0 then
                 Break;
              if Pos('ачислено',s)>0 then
                 Break;
              if Pos('выдаче',s)>0 then
                 Break;
              if Pos('дн.',s)>0 then
                 continue;
              if Pos('БЮДЖЕТ',s)>0 then
                 continue;
              if Pos('федра',s)>0 then
                 continue;
              if Pos('держа',s)>0 then
                  begin
                       stage:=2;
                       Continue;
                  end;
              if (stage<=1) then
                  begin
                       if not getAdd then Continue;
                       if stage=0 then stage:=1;
                        AddAdd(Shifr,summa);
                  end
              else
                 if (stage=2) then
                     begin
                          if not getUd then Continue;
                            AddUd(Shifr,summa);
                     end;


         end;
      TestCorrectPerson;
      CloseFile(dev);

 end;
 procedure tryToFind09inAllFiles(Curr_Person:Person_Ptr);
    begin
         RestPerson09(Curr_Person,cdir+'pps.txt');
         if (COUNT_ADD(Curr_Person)=0) then
         RestPerson09(Curr_Person,cdir+'uwp.txt');
         if (COUNT_ADD(Curr_Person)=0) then
         RestPerson09(Curr_Person,cdir+'adm.txt');

    end;

 function getDataUwPersonFromSQL(Tabno:integer):TDateTime;
  var SQLStmnt:string;
      v:variant;
      s:tdatetime;
  begin
      SQLStmnt:='select first 1 data_uw from kadry where tabno='+inttostr(tabno);
      v:=FIB.pFIBDatabaseSAL.QueryValue(SQLStmnt,0);
      if VarIsType(v,varDate) then
         s:=v
      else
         s:=encodedate(1900,1,1);
      getDataUwPersonFromSQL:=s;
  end;
 function getDataPriPersonFromSQL(Tabno:integer):TDateTime;
  var SQLStmnt:string;
      v:variant;
      s:tdatetime;
  begin
      SQLStmnt:='select first 1 data_pri from kadry where tabno='+inttostr(tabno);
      v:=FIB.pFIBDatabaseSAL.QueryValue(SQLStmnt,0);
      if VarIsType(v,varDate) then
         s:=v
      else
         s:=encodedate(1900,1,1);
      getDataPriPersonFromSQL:=s;
  end;

 function getRektorFIO:string;
  var SQLStmnt:string;
      v:variant;
      s:string;
  begin
      SQLStmnt:='select first 1 name from tb_param where codemes=1 order by datefr desc';
      v:=FIB.pFIBDatabaseSAL.QueryValue(SQLStmnt,0);
      if VarIsStr(v) then
         s:=v
      else
         s:='О.Л. Голубенко';
      getRektorFIO:=Trim(s);
  end;

 function getRektorDolg:string;
  var SQLStmnt:string;
      v:variant;
      s:string;
  begin
      SQLStmnt:='select first 1 name from tb_param where codemes=3 order by datefr desc';
      v:=FIB.pFIBDatabaseSAL.QueryValue(SQLStmnt,0);
      if VarIsStr(v) then
         s:=v
      else
         s:='Ректор';
      getRektorDolg:=Trim(s);
  end;
 function getGlBuhFIO:string;
  var SQLStmnt:string;
      v:variant;
      s:string;
  begin
      SQLStmnt:='select first 1 name from tb_param where codemes=2 order by datefr desc';
      v:=FIB.pFIBDatabaseSAL.QueryValue(SQLStmnt,0);
      if VarIsStr(v) then
         s:=v
      else
         s:='Л.І. Бєлоусова';
      getGlBuhFIO:=Trim(s);
  end;
 function getNameUniFromSQL:string;
  var SQLStmnt:string;
      v:variant;
      s:string;
  begin
      SQLStmnt:='select first 1 name from tb_param where codemes=5 order by datefr desc';
      v:=FIB.pFIBDatabaseSAL.QueryValue(SQLStmnt,0);
      if VarIsStr(v) then
         s:=v
      else
         s:='CНУ ім.В.Даля';
      getNameUniFromSQL:=Trim(s);
  end;
 function getGlBuhDolg:string;
  var SQLStmnt:string;
      v:variant;
      s:string;
  begin
      SQLStmnt:='select first 1 name from tb_param where codemes=4 order by datefr desc';
      v:=FIB.pFIBDatabaseSAL.QueryValue(SQLStmnt,0);
      if VarIsStr(v) then
         s:=v
      else
         s:='Головний бухгалтер';
      getGlBuhDolg:=Trim(s);
  end;
 function getRazrOkladByDolg(shifrIdDolg:Integer;var razr:Integer;var oklad:real):boolean;
  var SQLStmnt:string;
      v:variant;
      s:string;
      retVal:boolean;
  begin
      razr:=0;
      oklad:=0;
      retVal:=false;
      if ((shifrIdDolg>=10) and (shifrIdDolg<=1500))
         and (shifrIdDolg<>1455) then
         begin
             SQLStmnt:='select first 1 razr,oklad from tb_dolg where shifrdol='+intToStr(shifrIdDolg);
             v:=FIB.pFIBDatabaseSAL.QueryValues(SQLStmnt);
             if VarIsArray(v) then
                begin
                     RAZR:=0;
                     OKLAD:=0;
                     IF VarIsNumeric(V[0]) THEN
                        razr:=v[0];
                     IF VarIsNumeric(V[1]) THEN
                        oklad:=v[1];
                     if ((razr<1) or (razr>24)) then Razr:=0;
                     if ((oklad<1.00) or (oklad>10000.00)) then Oklad:=0;
                     if razr>0 then
                        retVal:=True;
                end;
         end;
      getRazrOkladByDolg:=retVal;
  end;

function  isDogPodOnlyNach(Curr_Person:Person_Ptr):Boolean;
  var retVal:Boolean;
      Curr_Add:ADD_PTR;
      i:integer;
  begin
       retVal:=true;
       curr_Add:=Curr_Person.ADD;
       i:=0;
       while (Curr_Add<>nil) do
        begin
             inc(i);
             if Curr_Add^.SHIFR<>DogPodShifr then
                begin
                     retVal:=False;
                     Break;
                end;
             Curr_Add:=Curr_Add^.NEXT;
        end;
       if i=0 then retVal:=False;
       isDogPodOnlyNach:=retVal;
  end;
function  isBolnSSOnlyNach(Curr_Person:Person_Ptr):Boolean;
  var retVal:Boolean;
      Curr_Add:ADD_PTR;
      i:integer;
  begin
       retVal:=true;
       curr_Add:=Curr_Person.ADD;
       i:=0;
       while (Curr_Add<>nil) do
        begin
             inc(i);
             if  not (Curr_Add^.SHIFR in [BOL_TEK_SHIFR ,BOL_PROSHL_SHIFR ]) then
                begin
                     retVal:=False;
                     Break;
                end;
             Curr_Add:=Curr_Add^.NEXT;
        end;
       if i=0 then retVal:=False;
       isBolnSSOnlyNach:=retVal;
  end;

 procedure getDifferencesForPersonNalogi(Curr_Person:PERSON_PTR;y:Integer;m:integer);
  begin
       PutSummyToTmpTables(Curr_Person,Y,M);
    //   PR_PERSON_ANALYZE_REC(:TABNO,:Y,:M,:MODE)

  end;


function getShortCurrencyName:string;
 var retVal:string;
 begin
      retVal := 'грн.';
      {$IFNDEF SVDN}
      if (CURRYEAR>2015) or ((CURRYEAR=2015) and (NMES>8)) then
         retVal := 'руб.';
      {$ENDIF}
      getShortCurrencyName := retVal;
 end;

function getSummaAddForPerson(curr_person:PERSON_PTR):Real;
 var retVal:Real;
     curr_add:ADD_PTR;
 begin
      retVal:=0;
      curr_add:=curr_person.ADD;
      while (curr_add<>nil) do
        begin
             retVal:=retVal+curr_add^.SUMMA;
             curr_add:=curr_add.NEXT;
        end;
      getSummaAddForPerson:=retVal;
 end;
function getSummaPremForPerson(curr_person:PERSON_PTR):Real;
 var retVal:Real;
     curr_add:ADD_PTR;
 begin
      retVal:=0;
      curr_add:=curr_person.ADD;
      while (curr_add<>nil) do
        begin
              if curr_Add^.SHIFR in [2,3] then
                 retVal:=retVal+curr_add^.SUMMA;
             curr_add:=curr_add.NEXT;
        end;
      getSummaPremForPerson:=retVal;
 end;
function getSummaAddForThisMonthForPerson(curr_person:PERSON_PTR):Real;
 var retVal:Real;
     curr_add:ADD_PTR;
 begin
      retVal:=0;
      curr_add:=curr_person.ADD;
      while (curr_add<>nil) do
        begin
              if not IsOtherPeriodECBShifr(Curr_Add^.Shifr) then
                retVal:=retVal+curr_add^.SUMMA;
             curr_add:=curr_add.NEXT;
        end;
      getSummaAddForThisMonthForPerson:=retVal;
 end;
function getSummaUdForPerson(curr_person:PERSON_PTR):Real;
 var retVal:Real;
     curr_ud:ud_PTR;
 begin
      retVal:=0;
      curr_ud:=curr_person.ud;
      while (curr_ud<>nil) do
        begin
             retVal:=retVal+curr_ud^.SUMMA;
             curr_ud:=curr_ud.NEXT;
        end;
      getSummaUdForPerson:=retVal;
 end;
function getSummaNalogiPerson(curr_person:PERSON_PTR):Real;
 var retVal:Real;
     curr_ud:ud_PTR;
 begin
      retVal:=0;
      curr_ud:=curr_person.ud;
      while (curr_ud<>nil) do
        begin
             if curr_ud.SHIFR=podoh_shifr then
                retVal:=retVal+curr_ud^.SUMMA;
             curr_ud:=curr_ud.NEXT;
        end;
      getSummaNalogiPerson:=retVal;
 end;
function getSummaAddForPersonW(curr_person:PERSON_PTR;WantedShifr:Integer;wantedPeriod:integer):Real;
 var retVal:Real;
     curr_add:ADD_PTR;
 begin
      retVal:=0;
      curr_add:=curr_person.ADD;
      while (curr_add<>nil) do
        begin
             if curr_add^.shifr=wantedshifr then
             if curr_add^.period=wantedperiod then
             retVal:=retVal+curr_add^.SUMMA;
             curr_add:=curr_add.NEXT;
        end;
      getSummaAddForPersonw:=retVal;
 end;
function getPolRusByNalCode(nalCode:string):string;
 var ch:Char;
     retVal:string;
     s:string;
 begin
      retVal:='м';
      s:=Trim(nalCode);
      if Length(s)=10 then
         begin
              ch:=s[9];
              if ch in ['0','2','4','6','8'] then
                 retVal:='ж';
         end;

      getPolRusByNalCode:=retVal;
 end;
function getPolForF6(nalCode:string):integer;
 var ch:Char;
     retVal:integer;
     s:string;
 begin
      retVal:=1;
      s:=Trim(nalCode);
      if Length(s)=10 then
         begin
              ch:=s[9];
              if ch in ['0','2','4','6','8'] then
                 retVal:=0;
         end;

      getPolForF6:=retVal;
 end;

 function isForbiddenPodrWrite(N_SERV:integer):Boolean;
   var retVal:boolean;
       nameServ:string;
   begin
       retVal:=false;
       nameServ:=Trim(Upper_STRING(Name_Serv(n_serv)));
       if Pos('РЕЗЕРВ',nameServ)>0 then
          retVal:=True;
       isForbiddenPodrWrite:=retVal;
   end;

function GetFullPodrNameFromSQL(nserv:integer):string;
   var I:Integer;
       RetVal,RetVal1,RetVal2:string;
       SQLStmnt:string;
       v:Variant;
       idowner:Integer;
   begin
        RetVal  := '';
        RetVal1 := '';
        RetVal2 := '';
        GetFullPodrNameFromSQL:=RetVal;
        if (nserv<0) or (nserv>300) then Exit;
        SQLStmnt:='select first 1 name,idowner from tb_tree_podr where idpodr='+IntToStr(nserv);
        v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
        if VarIsArray(v) then
           if VarIsNumeric(v[1]) then
              begin
                  idowner  := v[1] ;
                  retVal1  := v[0] ;
                  SQLStmnt := 'select first 1 name from tb_tree_podr where id='+IntToStr(idowner);
                  v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
                  if VarIsStr(v) then
                     begin
                          retVal2:=trim(v);
                     end;
                  retVal:=RetVal1;
                  if Length(Trim(retVal2))>0 then
                     retVal:=trim(retVal2)+' '+trim(retVal1);
              end;
        if (length(trim(RetVal))=0) then
            retVal:=trim(Name_Serv(NSERV));      
        GetFullPodrNameFromSQL:=RetVal;
   end;

function GetHistoryPodrNameFromSQL(nserv:integer;y,m:integer):string;
   var I:Integer;
       RetVal,RetVal1,RetVal2:string;
       SQLStmnt:string;
       v:Variant;
       idowner:Integer;
       DateS:String;
   begin
        RetVal  := '';
        RetVal1 := '';
        RetVal2 := '';
        GetHistoryPodrNameFromSQL:=RetVal;
        if (nserv<0) or (nserv>300) then Exit;
        DateS:=IntToStr(y)+'-'+IntToStr(m)+'-10';
        SQLStmnt:='select first 1 name from podr_sv where shifrpod='+IntToStr(nserv)+' and datefr<'''+DateS+''' order by datefr';
        v:=SQLQueryValue(SQLStmnt);
        if VarIsStr(v) then
           begin
                retVal:=v;
           end
        else
            retVal:=trim(Name_Serv(NSERV));
        retVal:=trim(retVal);
        GetHistoryPodrNameFromSQL:=RetVal;
   end;
function GetHistoryPodrNameFromSQLSalArc(nserv:integer;y,m:integer):string;
   var I:Integer;
       RetVal,RetVal1,RetVal2:string;
       SQLStmnt:string;
       v:Variant;
       idowner:Integer;
       DateS:String;
   begin
        RetVal  := '';
        RetVal1 := '';
        RetVal2 := '';
        GetHistoryPodrNameFromSQLSalArc:=RetVal;
        if (nserv<0) or (nserv>300) then Exit;
        DateS:=IntToStr(y)+'-'+IntToStr(m)+'-10';
        SQLStmnt:='select first 1 name from tb_podr_history where shifrpod='+IntToStr(nserv)+' and dateTo>'''+DateS+''' order by dateTo';
        saveDataBase;
        v:=SQLQueryValue(SQLStmnt);
        if VarIsStr(v) then
           begin
                retVal:=v;
           end
        else
            retVal:=trim(Name_Serv(NSERV));
        restoreDataBase;
        retVal:=trim(retVal);
        GetHistoryPodrNameFromSQLSalArc:=RetVal;
   end;

 function checkNeedDolgTest(shifrDol:integer):boolean;
   const amnt=11;
   const forbiddenCode:array[1..amnt] of integer =(4,5,6,7,8,9,1455,1500,1510,1520,1530);

   var retVal:boolean;
       i:Integer;
   begin
        retVal := True;
        for i:=1 to amnt do
            begin
                 if (shifrDol=forbiddenCode[i]) then
                     begin
                          retVal:=false;
                          break;
                     end;
            end;
        checkNeedDolgTest := retVal;
   end;

function putSVDNFooterRec:Boolean;
 var s,fName:string;
     Dev:TextFile;
     dt:tDateTime;
   procedure putString(comment:string;summa:Real;dt:tDateTime);
    var st,n,sf:string;
    begin
         STR(summa:12:2,Sf);
         st:=Copy(comment+all(' ',25),1,25)+' '+sf+' '+formatDateTime(dt);
         Writeln(dev,st);
    end;

 begin
      s:=cdoc+'22';
      if not DirectoryExists(s) then
         if not CreateDir(s) then
            if not ForceDirectories(s) then
                    raise Exception.Create('Ошибка создания каталога '+s);
      fName:=s+'\footerPar.txt';
      AssignFile(Dev,fName);
      Rewrite(dev);
      putString('Инвалиды',SVDNfooterRec.summa_invalidy,SVDNfooterRec.dtsumma_invalidy);
      putString('Допл.до.мин.з-п',SVDNfooterRec.summa_lt_min_sal,SVDNfooterRec.dtsumma_lt_min_sal);
      putString('Свыше обл.з-п',SVDNfooterRec.summa_gt_max_sal,SVDNfooterRec.dtsumma_gt_max_sal);
      CloseFile(dev);


 end;

function getSVDNFooterRec:Boolean;
 var s,fName:string;
     Dev:TextFile;
     dt:tDateTime;
     comment:string;
   procedure getString(var comment:string;var summa:Real;var dt:tDateTime);
    var st,n,scomment,ssumma,sdata:string;
        i:integer;
        y,m,d:word;
        ys,ms,ds:string;
        h,mi,sec:word;
        hs,mis,secs:string;
    begin
         readln(dev,st);
         scomment:=Copy(st,1,25);
         ssumma:=copy(st,27,12);
         sdata:=Copy(st,40,19);
         summa:=0;
         val(ssumma,summa,i);
         if i<>0 then
            summa:=0;
         ys:=Copy(sdata,1,4);
         ms:=Copy(sdata,6,2);
         ds:=Copy(sdata,9,2);
         Val(ys,y,i);
         Val(ms,m,i);
         Val(ds,d,i);
         hs:=Copy(sdata,12,2);
         mis:=Copy(sdata,15,2);
         secs:=Copy(sdata,18,2);
         Val(hs,h,i);
         Val(mis,mi,i);
         Val(secs,sec,i);
         dt:=EncodeDateTime(y,m,d,h,mi,sec,0);
    end;

 begin
      s:=cdoc+'22';
      fName:=s+'\footerPar.txt';
      if not FileExists(fname) then
         Exit;
      AssignFile(Dev,fName);
      Reset(dev);
      //'Инвалиды'
      getString(comment,SVDNfooterRec.summa_invalidy,SVDNfooterRec.dtsumma_invalidy);
      //'Допл.до.мин.з-п'
      getString(comment,SVDNfooterRec.summa_lt_min_sal,SVDNfooterRec.dtsumma_lt_min_sal);
      //'Свыше обл.з-п'
      getString(comment,SVDNfooterRec.summa_gt_max_sal,SVDNfooterRec.dtsumma_gt_max_sal);
      CloseFile(dev);


 end;

procedure testSVDNRec;
 begin
      SVDNFooterRec.summa_invalidy:=100;
      SVDNFooterRec.dtsumma_invalidy:=Date();
      SVDNFooterRec.summa_lt_min_sal:=200.22;
      SVDNFooterRec.dtsumma_lt_min_sal:=Date();
      SVDNFooterRec.summa_gt_max_sal:=300.33;
      SVDNFooterRec.dtsumma_gt_max_sal:=Date();
      putSVDNFooterRec;
      getSVDNFooterRec;
 end;

 function getPersonBVGN(curr_person:PERSON_PTR):Integer;
   var retVal:Integer;
   begin
        retVal:=1; // Бюджет
        if Curr_Person^.Gruppa in [3,4,16] then
           retVal:=3 // ГН
        else
           retVal:=2; //Вне бюдежет
        getPersonBVGN:=retVal;

   end;

 function mayBeEmptyPodr(shifrPod:integer):boolean;
   var retVal:boolean;
       S:string;
       i:Integer;
   begin
        retVal:=False;
        if NameServList.IS_CANBEEMPTY(shifrPod) then
           retVal:=true;
        if not retVal then
           begin
                s:=Trim(Name_Serv(shifrPod));
                i:=Pos('ПУСТОЕ',Upper_String(s));
                if i=0 then
                   i:=Pos('РЕЗЕРВ',Upper_String(s));
                if i>0 then
                   retVal:=True;

           end;
        mayBeEmptyPodr:=retVal;

   end;
 function getVariantInteger(v:variant):Integer;
   var retVal:Integer;
   begin
        if VarIsNull(v) then retVal:=0
        else
        if VarIsClear(v) then retVal:=0
        else
        if not VarIsNumeric(v) then retVal:=0
        else
           retVal:=v;
        getVariantInteger:=retVal;
   end;
 function getVariantReal(v:variant):Real;
   var retVal:real;
   begin
        if VarIsNull(v) then retVal:=0.0
        else
        if VarIsClear(v) then retVal:=0.0
        else
        if not VarIsFloat(v) then retVal:=0.0
        else
           retVal:=v;
        getVariantReal:=retVal;
   end;
 function getVariantString(v:variant):String;
   var retVal:string;
   begin
        if VarIsNull(v) then retVal:=''
        else
        if VarIsClear(v) then retVal:=''
        else
        if not VarIsStr(v) then retVal:=''
        else
           retVal:=v;
        getVariantString:=retVal;
   end;
 function getVariantDate(v:variant):TDateTime;
   var retVal:TDateTime;
   begin
        FillChar(retVal,SizeOf(retVal),0);
        if VarIsNull(v) then
        else
        if VarIsClear(v) then
        else
        if not VarIsType(v,varDate) then 
        else
           retVal:=v;
        getVariantDate := retVal;
   end;
procedure putSQLStmntToLog(SqlStmnt:string);
  var dev:TextFile;
      fName:string;
  begin
       fName:=CDOC+'log.txt';
       AssignFile(dev,fname);
       Rewrite(dev);
       writeln(dev,SQLStmnt);
       CloseFile(dev);

  end;

function getPersonWPList(Curr_Person:person_ptr):TList;
  var ListWP:TList;
      tmpNSRV:Integer;
      c_sowm:SOWM_PTR;
   procedure AddToList(wp:integer);
    var i:Integer;
        finded:boolean;
       PInt:PInteger;
    begin
         finded:=False;
         if ListWP.Count>0 then
            begin
                 for i:=0 to ListWP.Count-1 do
                     begin
                          if PInteger(ListWP.Items[i])^=wp then
                             begin
                                  finded:=True;
                                  Break;
                             end;
                     end;
            end;
       if not finded then
          begin
               New(PInt);
               PInt^:=wp;
               ListWP.Add(PInt);
          end;
    end;
    procedure BuildListForOsnPerson;
     var c_osn_person:person_ptr;
     begin
          C_Osn_Person:=nil;
          if Curr_Person.WID_RABOTY=osn_wid_raboty then
             C_Osn_Person:=Curr_Person
          else
             begin
               C_Osn_Person:=head_Person ;
               while (C_Osn_Person<>nil) do
                 begin
                      if C_Osn_Person.Tabno=Curr_Person.TABNO then
                      if C_Osn_Person.WID_RABOTY=OSN_WID_Raboty then
                         begin
                              Break;
                         end;
                      C_Osn_Person:=C_Osn_Person^.NEXT;
                 end;
             end;
          if C_Osn_Person<>nil then
             begin
                  c_sowm:=c_osn_person.SOWM;
                  while (c_sowm<>nil) do
                      begin
                           AddToList(c_sowm.Where);
                           C_SOWM:=c_sowm.NEXT;
                      end;
             end;

     end;
  begin
       tmpNSRV:=NSRV;
       ListWP:=TList.Create;
       AddToList(nsrv);
       if Curr_Person^.WID_RABOTY=OSN_WID_RABOTY then
          BuildListForOsnPerson
       else
          begin
               if CURR_Person^.MESTO_OSN_RABOTY<>NSRV then
                  begin
                        SELECT(5);
                        tmpNSRV:=NSRV;
                        NSRV:=CURR_Person^.MESTO_OSN_RABOTY;
                        MKFLNM;
                        GETINF(true);
                        NSRV:=tmpNSRV;
                  end;
               BuildListForOsnPerson;
               if CURR_Person^.MESTO_OSN_RABOTY<>NSRV then
                  begin
                        EMPTY_ALL_PERSON;
                        NSRV:=tmpNSRV;
                        SELECT(1);
                        MKFLNM;
                  end;

          end;
       getPersonWPList:=ListWP;
  end;

  function getNachPremForPerson(Curr_Person:person_ptr):real;
     var list:TList;
         retVal:real;
         i,j:Integer;
         finded:Boolean;
         c_person:PERSON_PTR;
         tmpNSRV:Integer;
     begin
          retVal:=0;
          list:=getPersonWPList(curr_Person);
          if List=nil then
             begin
                  getNachPremForPerson:=retVal;
                  Exit;
             end;
          if List.Count<1 then
             begin
                  getNachPremForPerson:=retVal;
                  Exit;
             end;
          finded:=false;
          for i:=0 to list.Count-1 do
              begin
                   j:=PInteger(List.Items[i])^;
//                   if j in [11,76,102]  then
                   if j <> NSRV  then
                      begin
                           finded:=True;
                           Break;
                      end;

              end;
          if not finded then
             begin
                  List.Free;
                  getNachPremForPerson:=retVal;
                  Exit;
             end;
          for i:=0 to list.Count-1 do
              begin
                   j:=PInteger(List.Items[i])^;
                   if j <> NSRV  then
                      begin
                           tmpNSRV:=NSRV;
                           NSRV:=j;
                           mkflnm;
                           select(5);
                           getinf(true);
                           c_person:=head_person;
                           while (c_person<>nil) do
                             begin
                                  if (c_person^.tabno=curr_person^.tabno) then
                                      if NSRV in [11,76,102] then
                                         retVal:=retVal+getSummaAddForPerson(c_person)
                                      else
                                         retVal:=retVal+getSummaPremForPerson(c_person);

                                  c_person:=c_person^.next;
                             end;
                           EMPTY_ALL_PERSON;
                           select(1);
                           NSRV:=tmpNSRV;
                           mkflnm;
                      end;

              end;
            List.Free;
            getNachPremForPerson:=retVal;
     end;

function getNachPremForPersonInNSRV(Curr_Person:person_ptr):real;
     var
         retVal:real;
         i,j:Integer;
         finded:Boolean;
         c_person:PERSON_PTR;
         tmpNSRV:Integer;
         GUID1 , GUID2 : string;
     begin
          retVal:=0;
          c_person:=head_person;
          GUID1:=GetGUIDPersonToString(Curr_Person);
          while (c_person<>nil) do
            begin
                 if (c_person^.tabno=curr_person^.tabno) then
                    begin
                         GUID2:=GetGUIDPersonToString(c_person);
                         if Trim(GUID1)<>Trim(GUID2) Then
                            retVal:=retVal+getSummaPremForPerson(c_person);
                    end;
                    c_person:=c_person^.next;
            end;
          getNachPremForPersonInNSRV:=retVal;
     end;

  function isPersonAUP_PPS(curr_person:person_ptr):Boolean;
   const l=11;
         li:array[1..l] of Integer=(10,20,30,40,47,1531,1532,70,80,490,1543);
   var retVal:Boolean;
       shifrDol:Integer;
       finded:Boolean;
       i:Integer;
     begin
          retVal:=False;
          if not (curr_person.KATEGORIJA  in [1,2,5,7]) then
             begin
                  isPersonAUP_PPS:=retVal;
                  exit;
             end;
          shifrDol:=GET_DOL_CODE(curr_person);
          finded:=false;
          for i:=1 to l do
             if shifrDol=li[i] then
                begin
                     finded:=True;
                     Break;
                end;
          if finded then
             retval:=True;
          isPersonAUP_PPS:=retVal;
     end;

  function getDepCodeFromSQL(currCode:integer=0):integer;
   var retVal:integer;
   begin
        retVal:=currCode;
        Application.CreateForm(TFormDepartmentSeek,FormDepartmentSeek);
        if (FormDepartmentSeek.ShowModal=mrOK) then
            retVal:=FormDepartmentSeek.selectedCode;
        FormDepartmentSeek.Free;;
        getDepCodeFromSQL:=retVal;
   end;

  function getNameDepPodrFromSQL(shifrDepPodr:integer):String;
    var SQLStmnt:String;
        retVal:String;
    begin
         if shifrDepPodr<1 then
            retVal:=''
         else
            begin
                 SQLStmnt:='select first 1 name from tb_tree_podr where id='+IntToStr(shifrDepPodr);
                 retVal:=SQLQueryValue(SQlStmnt);
            end;
         getNameDepPodrFromSQL:=retVal;
    end;
 function  GetPodrNomerPerson(CURR_PERSON:PERSON_PTR):INTEGER;
   VAR
       CURR_CN:CN_PTR;
       RETVAL:INTEGER;
   BEGIN
       RETVAL:=0;
       {$IFNDEF SVDN}
            CURR_CN:=CURR_PERSON^.CN;
            WHILE (CURR_CN<>NIL) DO
              BEGIN
                 IF ((CURR_CN^.SHIFR=NOMER_PODR_SHIFR) OR (CURR_CN^.SHIFR=NOMER_PODR_SHIFR+LIMIT_CN_BASE)) THEN
                     BEGIN
                         RETVAL:=CURR_CN^.PRIM;
                         BREAK;
                     END;
                 CURR_CN:=CURR_CN^.NEXT;
              END;
       {$ENDIF} ;
      GetPodrNomerPerson:=RetVal;
   END;

 function isProtectedPodr(shifrPod:integer):boolean;
    var retVal:boolean;
        i:integer;
    begin
         retVal:=false;
         for i:=1 to LenProtectedPodr do
             if ProtectedPodrList[i]=shifrPod then
                begin
                     retVal:=true;
                     break;
                end;
         isProtectedPodr:=retVal;
    end;

  procedure fillNamesReservPodr;
    var i:integer;
        PodrRec     : PPodrRec;
        S,SQLStmnt  : string;
        shifrPod    : integer;
        v:variant;
    begin
         for  i:=0 to NameServList.Count-1 do
           begin
                if PPodrRec(NameServList.Items[i]).canbeempty=true then
                   begin
                        PPodrRec(NameServList.Items[i]).canbeempty:=true;
                        s:=PPodrRec(NameServList.Items[i]).name;
                        s:=trim(s);
                        if pos('РЕЗЕРВ',upper_String(s))>0 then
                           begin
                                shifrPod:=PPodrRec(NameServList.Items[i]).Shifr;
                                SQLStmnt:='select first 1 name from PR_GETPODRNAMER('+intToStr(shifrPod)+')';
                                v:=SQLQueryValue(SQLStmnt);
                                if varisstr(v) then
                                   begin
                                       s:=IntToStr(shifrPod)+' '+v;
                                       PPodrRec(NameServList.Items[i]).name:=s;
                                   end;
                           end;
                   end;
           end;
    end;

  function getNameNextData:string;
    var nextNMES,nextYEAR:integer;
        retVal:string;
    begin
         nextNMES := NMES+1;
         nextYEAR := CURRYEAR;
         if nextNMES > 12 then
            begin
                 nextNMES:=1;
                 inc(nextYear);
            end;
         if isSVDN then
            retVal:=getMonthUkr(nextNMES)+' '+intToStr(nextYear)+' р.'
         else
            retVal:=getMonthRus(nextNMES)+' '+intToStr(nextYear)+' г.';
         getNameNextData:=retVal;   
    end;
  procedure getNextMY(var m:integer; var y: integer);
    var nextNMES,nextYEAR:integer;
    begin
         nextNMES := NMES+1;
         nextYEAR := CURRYEAR;
         if nextNMES > 12 then
            begin
                 nextNMES:=1;
                 inc(nextYear);
            end;
         m:=nextNMES;
         y:=nextYEAR;
    end;

  procedure markPKG66(wantedShifrPKG:integer);
   procedure MarkPodrs66;
    var  SQLStmnt:string;
         shifrPod:integer;
    begin
         NameServList.ClearAllSelected;
         SQLStmnt:='select shifrpod,mode from tb_podr_selection_list where shifridowner='+IntToStr(wantedShifrPKG)+' and mode=1';
         FIB.pFibQuery.Transaction.StartTransaction;
         FIB.pFibQuery.SQL.Clear;
         FIB.pFibQuery.SQL.Add(SQLStmnt);
         FIB.pFibQuery.ExecQuery;
         while not FIB.pFibQuery.Eof do
          begin
              ShifrPod:=FIB.pFibQuery.Fields[0].AsInteger;
              NameServList.SetSelected(ShifrPod);
              FIB.pFIBQuery.Next;
          end;
         FIB.pFibQuery.Transaction.COMMIT;

    end;
   procedure MarkKat66;
    var SQLStmnt:string;
        shifrKat:integer;

    begin
         KategList.ClearAllSelected;
         SQLStmnt:='select shifrpod,mode from tb_podr_selection_list where shifridowner='+intToStr(wantedShifrPKG)+' and mode=2';
         FIB.pFibQuery.Transaction.StartTransaction;
         FIB.pFibQuery.SQL.Clear;
         FIB.pFibQuery.SQL.Add(SQLStmnt);
         FIB.pFibQuery.ExecQuery;
         while not FIB.pFibQuery.Eof do
          begin
              ShifrKat:=FIB.pFibQuery.Fields[0].AsInteger;
              KategList.SetSelected(ShifrKat);
              FIB.pFIBQuery.Next;
          end;
         FIB.pFibQuery.Transaction.COMMIT;

    end;
   procedure MarkGru66;
    var SQLStmnt:string;
        shifrGru:integer;

    begin
         GruppyList.ClearAllSelected;
         SQLStmnt:='select shifrpod,mode from tb_podr_selection_list where shifridowner='+intToStr(wantedShifrPKG)+' and mode=3';
         FIB.pFibQuery.Transaction.StartTransaction;
         FIB.pFibQuery.SQL.Clear;
         FIB.pFibQuery.SQL.Add(SQLStmnt);
         FIB.pFibQuery.ExecQuery;
         while not FIB.pFibQuery.Eof do
          begin
              ShifrGru:=FIB.pFibQuery.Fields[0].AsInteger;
              GruppyList.SetSelected(ShifrGru);
              FIB.pFIBQuery.Next;
          end;
         FIB.pFibQuery.Transaction.COMMIT;

    end;
    begin
         MarkPodrs66;
         MarkKat66;
         MarkGru66;
    end;
 function isPrazdn(dt:TDateTime):boolean;
  var retVal:boolean;
      y,m,d,dow:word;
  begin
       decodedate(dt,y,m,d);
       retVal:=false;
       if (m=1) and (d=1) then retVal:=true
       else
       if (m=1) and (d=7) then retVal:=true
       else
       if (isLNR) and (m=2) and (d=23) then retVal:=true
       else
       if (m=3) and (d=8) then retVal:=true
       else
       if (m=5) and (d=1) then retVal:=true
       else
       if (m=5) and (d=9) then retVal:=true
       else
       if (isLNR) and (m=5) and (d=12) then retVal:=true
       else
       if (isSvdn) and (m=6) and (d=28) then retVal:=true
       else
       if (isSvdn) and (m=8) and (d=24) then retVal:=true
       else
       if (isSvdn) and (m=10) and (d=10) then retVal:=true
       else
       if (isLNR) and (m=11) and (d=4) then retVal:=true;
       isPrazdn:=retVal;
  end;
procedure ScrCopyFile( InFile,OutFile: String);
var
  OldFile,NewFile: TFileStream;
begin
  OldFile := TFileStream.Create(inFile, fmOpenRead or fmShareDenyWrite);
    try
      NewFile := TFileStream.Create(OutFile, fmCreate or fmShareDenyRead);
      try
        NewFile.CopyFrom(OldFile, OldFile.Size);
      finally
        FreeAndNil(NewFile);
      end;
    finally
      FreeAndNil(OldFile);
    end;

end;
 procedure makeMonthForYear(Y:integer);
  var FName,FNameColedg:wideString;
      dev:TextFile;
      i,j,l:integer;
      s:string;
      dt,dtw:TDateTime;
      yw,mw,dw,dow:integer;
  begin
      fName:=cdir+'month'+intToStr(Y-2000)+'.txt';
      FNameColedg:=CDIR+'mnthc'+COPY(ALLTRIM(IntToStr(Y)),3,2)+'.TXT';
      if fileexists(FName) then
         begin
              if not yesNo('Файл '+FName+' существует. Сгенерировать его заново?') then
                 exit;
         end;
       AssignFile(dev,fname);
       rewrite(dev);
       for i:=1 to 12 do
         begin
              dt:=encodedate(y,i,1);
              l:=DaysInMonth(dt);
              s:='';
              for j:=1 to 31 do
                  begin
                      if j>l then
                         s:=s+' 0'
                      else
                         begin
                              dtw:=encodedate(y,i,j);
                              dow:=DayOfTheWeek(dtw);
                              if isPrazdn(dtw) then
                                  s:=s+' 4'
                              else
                                  case dow of
                                    6:s:=s+' 2';
                                    7:s:=s+' 3';
                                    else
                                      s:=s+' 1';
                                   end;
                         end;
                  end;
              s:=trim(s);
              writeln(dev,s);
         end;
       closefile(dev);
      if fileexists(fnamecoledg) then
         if not SysUtils.deletefile(fnamecoledg) then
            begin
                 showMessage('Ошибка '+IntToStr(getLastError)+'  удаления файла'+fnamecoledg);
                 exit;
            end;
       ScrCopyFile(fname,fnamecoledg);
//       if not copyfile(PAnsiChar(fname),PAnsiChar(fnamecoledg),true) then
//          begin
//                 showMessage('Ошибка '+IntToStr(getLastError)+' копирования файла '+fname+' в '+fnamecoledg);
//                 exit;
//          end;

       showMessage('Файл '+FName+' создан!');
  end;
function CheckExcelInstalled(AValue: String): boolean;
var
  FCLSID: TCLSID;
  P:PChar;
  n:widestring;
  s:string;

begin
  s:=aValue;
  CheckExcelInstalled:=true;
  //    http://www.vr-online.ru/blog/rabota-s-excel-iz-delphi-chast-1-2552
 // Не работает
 // n:=AValue;
//  P:=PChar(Avlue);
//  Result := (CLSIDFromProgID(PChar(s), FCLSID) = S_OK);
//  Result := (CLSIDFromProgID(@AValue[1], FCLSID) = S_OK);
end;
function getMORForPutInf:integer;
 type PRec=^TRec;
      TRec=record
            shifrPod:integer;
            count:integer;
           end;
 var listMOR:TList;
     Curr_Person:Person_Ptr;
     retVal:integer;
     i:integer;
     procedure addToList(wantedVal:integer);
       var i:integer;
           p:PRec;
           finded:boolean;
       begin
            if listMOR.Count<1 then
               begin
                    p := new(PRec);
                    p^.shifrPod := wantedVal;
                    p^.count    := 1;
                    listMor.Add(p);
                    exit;
               end;
            finded:=false;
            for i:=1 to listMOR.Count do
                begin
                     if (wantedVal=pRec(listMOR.items[i-1])^.shifrPod) then
                        begin
                            inc(pRec(listMOR.items[i-1])^.count);
                             finded:=true;
                             break;
                        end;
                end;
            if not finded then
               begin
                    p := new(PRec);
                    p^.shifrPod := wantedVal;
                    p^.count    := 1;
                    listMor.Add(p);
               end;
       end;
      function compare(p1:pointer;p2:pointer):integer;
        begin
             if pRec(p1)^.count<pRec(p2)^.count then compare:=1
             else
             if pRec(p1)^.count>pRec(p2)^.count then compare:=-1
             else
             compare:=0;
        end;
 begin
      retVal      := 0;
      ListMOR     := TList.Create();
      curr_person := head_person;
      while (curr_person<>nil) do
       begin
            if curr_person.WID_RABOTY=1 then
               begin
                    if (curr_person^.main<>2) then
                       addToList(NSRV)
                    else
                    addToList(Curr_Person^.mesto_osn_raboty);
               end
            else
               addToList(Curr_Person^.from);
            curr_person:=curr_person^.next;
       end;
      retVal:=0;
      if (listMOR.Count>0) then
          begin
               listMOR.sort(@compare);
               retVal:=PRec(listMOR.items[0])^.shifrPod;
               for i:=1 to listMOR.count do
                   dispose(PRec(listMOR.Items[i-1]));
          end;
      FreeAndNil(listMOR);
      getMORForPutInf:=retVal;
 end;
 function getIniFileName:string;
  var retVal:string;
      s,s1,s2,s3:string;

  begin
      s:=Application.ExeName;
      s1:=ChangeFileExt(s,'.ini');
      s2:=getMainDataDrive;
      s3:=s2+copy(s1,3,length(s1)-2);
      getIniFileName:=s3;
  end;
function isCorrectLNRPodoh13Person(curr_person:person_ptr):boolean;
 const procPod=0.13;
 var curr_add:add_ptr;
     curr_ud:ud_ptr;
     summaAdd:real;
     summaPod,summaPodRas:real;
     retVal:boolean;
 begin
      if not isLNR then
         begin
              isCorrectLNRPodoh13Person:=true;
              exit;
         end;
      summaPod:=0;
      summaAdd:=0;
      curr_add:=curr_person^.add;
      while (curr_add<>nil) do
       begin
            if shifrList.IsPodoh(curr_add^.shifr) then
               summaAdd:=summaAdd+curr_add^.SUMMA;
            curr_add:=curr_add^.NEXT;
       end;
      curr_ud:=curr_person^.ud;
      while (curr_ud<>nil) do
       begin
            if curr_ud^.shifr=podoh_shifr then
               summaPod:=summaPod+curr_ud^.SUMMA;
            curr_ud:=curr_ud^.NEXT;
       end;
      summaPodRas:=summaAdd*procPod;
      if abs(summaPod-summaPodRas)>0.02 then
         retVal:=false
      else
         retVal:=true;
      isCorrectLNRPodoh13Person:=retVal;
 end;

 function checkForma5ForVnePerson(curr_person:person_ptr):boolean;
    var SQLStmnt:String;
        retVal:boolean;
        v,v1:variant;
        DateFr,DateTo:TDateTime;
        currDate:TDateTime;
        shifrId:integer;
    begin
        if not isSVDN then
           begin
                checkForma5ForVnePerson:=false;
                exit;
           end;
         retVal:=false;
         shifrId:=GET_IDDOGPODFORSOWM_PERSON(curr_person);
         if shifrId<1 then
            begin
                checkForma5ForVnePerson:=false;
                exit;
            end;
         currDate:=encodedate(curryear,nmes,2);
         SQLStmnt:='select first 1 datefr,dateto from tb_dogovora_gn_det where id='+IntToStr(shifrId);
         v:=SQLQueryRecValues(SQlStmnt);
         if VarIsArray(v) then
            begin
                 try
//                   CheckSqlTimeStamp(v[0]);
//                   CheckSqlTimeStamp(v[1]);
//                   dateFr:=SQLTimeStampToDateTime(v[0]);
//                   dateTo:=SQLTimeStampToDateTime(v[1]);
                   dateFr:=v[0];
                   dateTo:=v[1];
                   if ((CompareDateTime(datefr,currDate)=LessThanValue)
                      and
                      (CompareDateTime(currDate,dateto)=LessThanValue)) then
                      retval:=true;
                 except
                   retVal:=false;
                 end;
            end;

         checkForma5ForVnePerson:=retVal;
    end;

function DeleteFiles(const FileMask: string;var count:integer): integer;
  var  SearchRec: TSearchRec;
       fName:widestring;
       retVal:integer;
       rv:boolean;
       newAttributes,Attributes:word;
  begin
        retVal:=0;
        rv := FindFirst(ExpandFileName(FileMask), faAnyFile, SearchRec) = 0;
        try
            if rv then
               repeat
                     if (SearchRec.Name[1] <> '.') and
                        (SearchRec.Attr and faVolumeID <> faVolumeID) and
                        (SearchRec.Attr and faDirectory <> faDirectory) then
                        begin
                           newAttributes:=SearchRec.Attr;
                           fName:=ExtractFilePath(FileMask) + SearchRec.Name;
                           if SearchRec.Attr and sysUtils.faReadOnly = sysUtils.faReadOnly then
                              begin
//                                  attributes:=not sysUtils.faReadOnly;
                                  newAttributes:=newAttributes and not sysUtils.faReadOnly;
                                  filesetattr(fName,newAttributes);
                                  attributes:= FileGetAttr(fName);
                                  if Attributes and sysUtils.faReadOnly = sysUtils.faReadOnly then
                                     attributes:=newAttributes;
                              end;
//                           rv := SysUtils.DeleteFile(PAnsiChar(AnsiString(fName)));
                           rv := SysUtils.DeleteFile(fName);
                           if not rv then
                              begin
                                    showMessage('Ошибка удаления '+intToStr(GetLastError)+' Файл '+fName+' Атрибуты '+intToStr(FileGetAttr(fName)));
                                    Break
                              end
                           else
                              begin
                                   inc(retVal);
                                   inc(count);
                                   FormWait.setLabels('Удаление вирусов','Удалено - '+IntToStr(count));
                                   Application.processMessages;

                              end
                        end;
               until FindNext(SearchRec) <> 0;
       finally
            SysUtils.FindClose(SearchRec);
       end;
      DeleteFiles:=retVal;
  end;

procedure DeleteViruses;
  const mask1:string='y:\*.exe';
        mask2:string='y:\*.pif';
  var nmb:integer;
      count:Integer;
      tmpLabel1,tmpLabel2:string;
  begin
       if not isLNR then exit;
       tmpLabel1:=FormWait.Label1.Caption;
       tmpLabel2:=FormWait.Label2.Caption;
       FormWait.setLabels('Удаление вирусов','0');
       FormWAit.Show;
       application.ProcessMessages;
       count:=0;
       nmb:=deletefiles(mask1,count);
       nmb:=nmb+deletefiles(mask2,count);
       FormWAit.Hide;
       application.ProcessMessages;
       showMessage('Удалено '+intToStr(nmb)+' вирусов.');
       FormWait.setLabels(tmpLabel1,tmpLabel2);
  end;

  procedure makeServerBDir(var EscPressed:boolean);
   const sd ='salary\bak';
         localDirS='salary';
         cdocDirS='salary\rpt';
   var appDirName,dirName:string;
       appDirNameTmp:string;
       i:Integer;
   begin
         escPressed:=false;
         appDirName:=SysUtils.GetEnvironmentVariable('APPDATA');
         i:=Pos('\',appDirName);
//         if i>0 then
//            dirName:=stringReplace(appDirName,'\','/',[rfReplaceAll])
//         else
         dirName:=appDirName;
         appDirNameTmp:=dirName;
         dirName:=trim(dirName)+'\'+sd;
         if not DirectoryExists(DirName) then
//            if not CreateDir(DirName) then
            if not ForceDirectories(DirName) then
               begin
                    raise Exception.Create('Ошибка создания каталога '+dirName);
                    EscPressed:=True;
               end;
         if not EscPressed then
            begin
                 dirName:=Trim(dirName)+'\'; 
                 BDir:=DirName;
                 local_dir:=appDirNameTmp+'\'+localDirS;
                 CDOC:=appDirNameTmp+'\'+cdocDirS;
                 if not DirectoryExists(CDOC) then
                 if not ForceDirectories(DirName) then
                    begin
                          raise Exception.Create('Ошибка создания каталога '+CDOC);
                          EscPressed:=True;
                    end;
            end;

   end;
  procedure makeServerTmpDir(var EscPressed:boolean);
   const sd ='salary\data';
   var appDirName,dirName:string;
       i:Integer;
   begin
         escPressed:=false;
         appDirName:=SysUtils.GetEnvironmentVariable('APPDATA');
         i:=Pos('\',appDirName);
//         if i>0 then
//            dirName:=stringReplace(appDirName,'\','/',[rfReplaceAll])
//         else
         dirName:=appDirName;
         dirName:=trim(dirName)+'\'+sd;
         if not DirectoryExists(DirName) then
//            if not CreateDir(DirName) then
            if not ForceDirectories(DirName) then
               begin
                    raise Exception.Create('Ошибка создания каталога '+dirName);
                    EscPressed:=True;
               end;
         if not EscPressed then
            begin
                 dirName:=Trim(dirName)+'\';
                 tmpDir:=DirName;
            end;

   end;

  procedure makeServerDataDirs;
   var appDirName:string;
     function makeServerDataDir(needDir:string):string;
      var tmpS,dirName:string;
          i:integer;
      begin
         makeServerDataDir:=needDir;
         i:=Pos('C:',UpperCase(needDir));
         if i<1 then Exit;
         i:=Pos('\',appDirName);
         tmpS:=UpperCase(needDir);
         dirName:=stringReplace(tmpS,'C:',appDirName,[rfReplaceAll, rfIgnoreCase]);
         makeServerDataDir:=dirName;
      end;
   begin
       appDirName:=SysUtils.GetEnvironmentVariable('APPDATA');
       BDIR:=makeServerDataDir(BDIR);
       CDOC:=makeServerDataDir(CDOC);
       IDIR:=makeServerDataDir(IDIR);
       BDIR:=makeServerDataDir(CLAR_DIR);
       WDIR:=makeServerDataDir(WDIR);
       ADIR:=makeServerDataDir(ADIR);
       CUDIR:=makeServerDataDir(CUDIR);
       OTP_DIR:=makeServerDataDir(OTP_DIR);
       POD_DIR:=makeServerDataDir(POD_DIR);
       BANK_DIR:=makeServerDataDir(BANK_DIR);
       CMEM:=makeServerDataDir(CMEM);
       TemplateDIR:=makeServerDataDir(TemplateDIR);

   end;


function getIOSemaphore(kind:Integer=2):boolean;
// 2 - запись
// 1 - чтение
   var SQlStmnt:string;
       v:Variant;
       retVal,rt:boolean;
       i:Integer;
       udt:Longint;
       nowtime:TDateTime;
       gettedtime:TDateTime;
       r:LongInt;
       uTime:LongInt;
       d:TDateTime;
       y,m,dd:Integer;
       h,mm,sec,msec:integer;
       secFloat,secF:Real;
       msecFloat,msecF:real;
       yn,mn,ddn:Integer;
       hn,mmn,secn,msecn:integer;
       r64:Int64;
       gettedKind:Integer;
   begin
        r64:=0; 
        getIOSemaphore:=True;
        if not needUseIOSemaphore then Exit;
        retVal   := false;
        gettedKind := 0;
        udt      := 0;
        i        := -1;
        r        := 0;
        nowTime  := now;
        gettedKind := 0;
        uTime    := DateTimeToUnix(nowTime);
        yn       := YearOf(nowTime);
        mn       := MonthOf(nowTime);
        ddn      := dayOf(nowTime);
        hn       := HourOf(nowTime);
        mmn      := MinuteOf(nowTime);
        secn     := SecondOf(nowTime);
        msecn    := MilliSecondOf(nowTime);
        SQLStmnt := 'select count(*) from TB_IO_SEMAPHORE where SHIFRPOD='+IntToStr(NSRV);
        v:=SQLQueryValue(SQLStmnt);
        if VarIsNumeric(v) then
           i:=v;
        if i<0 then
           begin
                raise Exception.Create('Ошибка доступа к семафору') at @getIOSemaphore;
                getIOSemaphore:=False;
                exit;
           end;
         if i>0 then
            begin
                 SQLStmnt:= 'select first 1 cast(dt as varchar(64))'+
                                 ', extract(YEAR from dt)'+
                                 ', extract(MONTH from dt)'+
                                 ', extract(DAY from dt)'+
                                 ', extract(HOUR from dt)'+
                                 ', extract(MINUTE from dt)'+
                                 ', extract(SECOND from dt)'+
                                 ', extract(MILLISECOND from dt)'+
                                 ', kind '+
                                 ' from TB_IO_SEMAPHORE where SHIFRPOD='+IntToStr(NSRV);
 //                SQLStmnt:='select cdate,ctime from TB_IO_SEMAPHORE where SHIFRPOD='+IntToStr(NSRV);
                 v:=SQLQueryRecValues(SQLStmnt);
                 if VarIsArray(v) then
                 if VarIsNumeric(v[1]) then
                 if VarIsNumeric(v[2]) then
                 if VarIsNumeric(v[3]) then
                 if VarIsNumeric(v[4]) then
                 if VarIsNumeric(v[5]) then
                 if VarIsNumeric(v[6]) then
                 if VarIsNumeric(v[8]) then

//                 if not VarIsNull(v) then
                    begin
                         y     := v[1];
                         m     := v[2];
                         dd    := v[3];
                         h     := v[4];
                         mm    := v[5];
                         secFloat:=v[6];
                         gettedKind:=v[8];
                         secF:=int(secFloat);
                         msecF := Frac(secFloat)*1000;
                         sec   := Round(secF);
                         msec  := Round(msecF);
//                         msecFloat:=v[6];
                         gettedtime:= EncodeDateTime(y,m,dd,h,mm,sec,msec);

                    //     gettedtime:=UnixToDateTime(udt);
                         udt:=DateTimeToUnix(gettedtime);
                         r:=uTime - udt;
                         r64:=MilliSecondsBetween(gettedTime, nowTime);
                         i:=0;
                    end;

            end;
         if r64>limitSemaphoreTime then
            begin
                 SQLStmnt:='delete from TB_IO_SEMAPHORE where SHIFRPOD='+IntToStr(NSRV);
                 SQLExecute(SQLStmnt);
                 gettedKind := 0;
            end;
         if i=0 then
            begin
                 SQLStmnt:='insert into TB_IO_SEMAPHORE (kind,shifrpod) values ('+intToStr(Kind)+','+intToStr(NSRV)+')';
                 SQLExecute(SQLStmnt);
                 retVal:=True;
            end;
         if not retVal then
            begin
                 if kind=1 then
                 if gettedKind=1 then
                    retVal := true;
            end;
         getIOSemaphore:=retVal;
   end;
 procedure freeIOSemaphore;
   var SQLStmnt:string;
   begin
        if not needUseIOSemaphore then Exit;
        SQLStmnt:='delete from TB_IO_SEMAPHORE where SHIFRPOD='+IntToStr(NSRV);
        SQLExecute(SQLStmnt);
   end;

 procedure receiveIOSemaphoreForWrite;
   var dtStart,dtCurrent:TDateTime;
       r64:Int64;
   begin
        if not needUseIOSemaphore then Exit;
        dtStart:=Now;
        while true do
          begin
               if getIOSemaphore(2) then break;
               DelayPascal(10);
               dtCurrent:=Now;
               r64:=MilliSecondsBetween(dtCurrent,dtStart);
               if (r64>limitSemaphoreTime) then
                  Break;
          end;
   end;

procedure receiveIOSemaphoreForRead;
   var dtStart,dtCurrent:TDateTime;
       r64:Int64;
   begin
        if not needUseIOSemaphore then Exit;
        dtStart:=Now;
        while true do
          begin
               if getIOSemaphore(1) then break;
               DelayPascal(10);
               dtCurrent:=Now;
               r64:=MilliSecondsBetween(dtCurrent,dtStart);
               if r64>limitSemaphoreTime then
                  Break;
          end;
   end;
function  getShifrWrForBoln(TABNO:Integer;summa:Real;Y:integer;m:integer):Integer;
 var SQLStmnt        : ansistring;
     v               : variant;
     retVal          : integer;
//     recBolDay       : PRecBolDay;
//     list            : TList;
     finded          : Boolean;
     activated       : Boolean;
     i               : Integer;
     formatSumma     : string;
 begin
      if tabno=11978 then
         retVal:=0;
     if y<1900 then
        y:=y+1990;

     retVal := 1;
     formatSumma := Trim(FormatFloatPoint(summa));
//     list:=TList.Create;
     SQLStmnt:='select coalesce(b.modewr,0) from boln_res br';
     SQLStmnt:=trim(SQLStmnt)+' join boln b on b.shifrid=br.shifridboln';
     SQLStmnt:=trim(SQLStmnt)+' where br.year_za='+intToStr(Y)+' and br.month_za='+intToStr(M);
     SQLStmnt:=trim(SQLStmnt)+' and b.year_vy='+intToStr(currYear)+' and b.month_vy='+intToStr(NMES);
     SQLStmnt:=trim(SQLStmnt)+' and b.shifr_sta in (12,14)';
     SQLStmnt:=trim(SQLStmnt)+' and b.tabno='+intToStr(tabno);
 //    SQLStmnt:=trim(SQLStmnt)+' and coalesce(modewr,0)=2';
     SQLStmnt:=trim(SQLStmnt)+' and abs(abs(coalesce(br.summa_b_bud,0.00)+coalesce(br.summa_b_vne,0.00)+coalesce(br.summa_b_gn,0.00)+coalesce(br.summa_b_nis,0.00))-abs('+FormatSumma+'))<0.01';
     v:=SQLQueryValue(SQLStmnt);
     if VarIsNumeric(v) then
        retVal := v;
     if retVal<>2 then
        retVal:=1;
     getShifrWrForBoln:=retVal;
 end;

function isSciPedForSwod(curr_person:person_ptr):boolean;
 var retVal:boolean;
 begin
      retVal:=isSciPed(curr_person);
      if (curr_person^.tabno=3719) then           // Зеленко
      if (curr_person^.WID_RABOTY=1) then
         retVal:=true;
      if ((curr_person^.WID_RABOTY=2) and
          (curr_person^.MESTO_OSN_RABOTY=82)) then
         retVal:=false;
      if ((curr_person^.tabno =4424)
         or
         (curr_person^.tabno= 11761)) then // Белоусов  и Варченко из бухгальтерии
         retVal:=false;
      if curr_person^.tabno=11626  then // Заика
         retVal:=True;
      isSciPedForSwod:=retVal;
 end;
 function get156MessageFromCn(Curr_Person:Person_ptr;Period:Integer;Summa:Real):string;
   var currCn:CN_PTR;
       Mess:string;
       finded:boolean;
   begin
       Mess:='';
       finded:=false;
       CurrCn:=curr_person^.cn;
       while (currcn<>nil) do
         begin
              if currcn^.SHIFR=cn156_shifr+limit_cn_base then
              if currcn^.PRIM=Period then
              if abs(Abs(currcn^.summa)-abs(summa))<0.01 then
                 begin
                      finded:=True;
                      mess:=trim(currCn^.PRIM_1);
                      Break;
                 end;
              currcn:=currcn^.next;
         end;
      get156MessageFromCn:=Trim(Mess);

   end;
 procedure put156MessageToCn(Curr_Person:Person_ptr;Period:Integer;Summa:Real;Mess:string);
  var CurrCn:CN_PTR;
      finded:boolean;
  begin
       finded:=false;
       CurrCn:=curr_person^.cn;
       while (currcn<>nil) do
         begin
              if currcn^.SHIFR=cn156_shifr+limit_cn_base then
              if currcn^.PRIM=Period then
              if abs(Abs(currcn^.summa)-abs(summa))<0.01 then
                 begin
                      finded:=True;
                      Break;
                 end;
              currcn:=currcn^.next;
         end;
       if finded then
          begin
            if Mess<>currcn^.prim_1 then
               currcn^.PRIM_1:=Trim(mess)
          end
       else
          begin
              MAKE_cn(CurrCn,curr_person);
              currCn^.SHIFR:=cn156_shifr+limit_cn_base;
              currCn^.KOD:=100;
              currCn^.PRIM:=Period;
              currCn^.SUMMA:=Summa; 
              currCn^.PRIM_1:=Trim(mess);
          end;
  end;
 procedure delete156MessageFromCn(Curr_Person:Person_ptr);
  var CurrCn:CN_PTR;
      finded:boolean;
      CurrAdd:ADD_PTR;
      finished:boolean;
  begin
       while True do
         begin
              finished:=True;
              currCn:=curr_person^.cn;
              while (currCn<>nil) do
                begin
                  if currCn^.SHIFR=cn156_shifr+limit_cn_base then
                     begin
                        finded:=false;
                        currAdd:=Curr_Person^.ADD;
                        while (CurrAdd<>Nil) do
                           begin
                              if CurrAdd^.shifr=PerersZaProshlPeriody then
                              if CurrAdd^.PERIOD=CurrCn^.PRIM then
                              if abs(Abs(currAdd^.SUMMA)-Abs(currCn^.summa))<0.01 then
                                 begin
                                      finded:=True;
                                      Break;
                                 end;
                              CurrAdd:=CurrAdd^.NEXT;
                           end;
                        if not finded then
                           begin
                                del_cn(CurrCn,Curr_Person);
                                Finished:=False;
                           end;
                     end;
                  if not finished then
                     Break;
                  currcn:=currcn^.next;
                end;
            if finished then
               Break;
         end;
  end;

end.

