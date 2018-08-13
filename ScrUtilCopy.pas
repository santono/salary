unit ScrUtilCopy;

interface
   USES SCRDEF;
   PROCEDURE MKFLNM;
   FUNCTION ALLTRIM(T:STRING):STRING;
   Function FormatFloatPoint(A:Real):String;
   Function ReplSToDQuote(S:String):String;
   FUNCTION FILEEXIST(FILENAME:STRIng):BOOLEAN;
   FUNCTION NOMER_SERV(WN:INTEGER):INTEGER;
   FUNCTION SHIFR_SERV(WN:INTEGER):INTEGER;
   function Name_Serv(WN:integer):String;
   function GetMonthRus(N:Integer):string;
   FUNCTION SHORT_FIO(FFIO:STRING):STRING;       
   FUNCTION GET_kat_name(n_kat:INTEGER):string;
   FUNCTION GET_IST_NAME(N_IST:INTEGER):STRING;
   FUNCTION WORK_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):integer;
   FUNCTION WORK_CLOCK(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION ILL_DAY(START_DAY:INTEGER;CURR_PERSON:PERSON_PTR):integer;
   FUNCTION OTPUSK_DAY(START_DAY:INTEGER;CURR_PERSON:PERSON_PTR):integer;
   FUNCTION NADBAWKA_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION THIS_PERSON(CURR_PERSON:PERSON_PTR):BOOLEAN;
   function OK_FREE_MEM(Len:Integer):boolean;
   function WinToDos(s:string):string;
   function DosToWin(s:string):string;
   procedure Error(S:String);
   function YesNo(S:String):boolean;
   function GetClarionDate(var y,m,d:integer;dcC:LongInt):boolean;
   FUNCTION  UPPER_STRING(S:STRING):STRING;
   FUNCTION GET_CURRENT_DISK:string;
   FUNCTION ALL(C:CHAR;L:INTEGER):STRING;
   FUNCTION SPACE(L:INTEGER):STRING;
   FUNCTION GetNameShifr(I:Integer):String;
   FUNCTION GetNameShifrByNo(I:Integer):String;
   PROCEDURE SortPerson(Mode:Integer);
   PROCEDURE SortAdd(Curr_Person:Person_Ptr);
   PROCEDURE SortUd(Curr_Person:Person_Ptr);
   FUNCTION GET_KOEF_OKLAD_PERSON(CURR_PERSON:PERSON_PTR):REAL;
   PROCEDURE MAKE_KOEF_OKLAD_PERSON(CURR_PERSON:PERSON_PTR;A:REAL);
   FUNCTION GET_PERSON_OKLAD(CURR_PERSON:PERSON_PTR):REAL;
   FUNCTION GET_DOL_CODE(CURR_PERSON:PERSON_PTR):INTEGER;
   FUNCTION GET_DOL_NAME(CURR_PERSON:PERSON_PTR):STRING;
   PROCEDURE MAKE_DOL_PERSON(CURR_PERSON:PERSON_PTR;A:INTEGER);
   FUNCTION NAME_DOLG(WANTED_DOLG:INTEGER):STRING;
   FUNCTION NAME_DOLG_BY_SHIFR(WANTED_DOLG:INTEGER):STRING;
   FUNCTION NOMER_DOLG(WANTED_DOLG:INTEGER):INTEGER;
   FUNCTION SHIFR_DOLG(WANTED_DOLG:INTEGER):INTEGER;
   FUNCTION GET_WR_NAME(WANTED_WR:Integer):String;
   FUNCTION GET_SWM_NAME(WANTED_SWM:Integer):String;
   FUNCTION GET_SWM_MODE_PERSON(CURR_PERSON:PERSON_PTR):integer;
   PROCEDURE PUT_SWM_MODE_TO_PERSON(CURR_PERSON:PERSON_PTR;WANTED_SWM:Integer);




           PROCEDURE MAKE_PERSON(VAR CURR_PERSON:PERSON_PTR);
           PROCEDURE MAKE_ADD(VAR CURR_ADD:ADD_PTR;CURR_PERSON:PERSON_PTR);
           PROCEDURE MAKE_SOWM(VAR CURR_SOWM:SOWM_PTR;CURR_PERSON:PERSON_PTR);
           PROCEDURE MAKE_UD(VAR CURR_UD:UD_PTR;CURR_PERSON:PERSON_PTR);
           PROCEDURE MAKE_CN(VAR CURR_CN:CN_PTR;CURR_PERSON:PERSON_PTR);
           PROCEDURE DEL_ADD(VAR CURR_ADD:ADD_PTR;CURR_PERSON:PERSON_PTR);
           PROCEDURE DEL_SOWM(VAR CURR_SOWM:SOWM_PTR;CURR_PERSON:PERSON_PTR);
           PROCEDURE DEL_UD(VAR CURR_UD:UD_PTR;CURR_PERSON:PERSON_PTR);
           PROCEDURE DEL_CN(VAR CURR_CN:CN_PTR;CURR_PERSON:PERSON_PTR);
           PROCEDURE DEL_PERSON(VAR CURR_PERSON:PERSON_PTR);
           PROCEDURE DELETE_PERSON(VAR CURR_PERSON:PERSON_PTR);
           PROCEDURE LDEL_PERSON_OLD;
           PROCEDURE LDEL_PERSON;
           PROCEDURE LDEL_PERSON_ZERO;
           PROCEDURE LDEL_ADD_ZERO(CURR_PERSON:PERSON_PTR);
           PROCEDURE LDEL_UD_ZERO(CURR_PERSON:PERSON_PTR);
           PROCEDURE LDEL_CN_ZERO(CURR_PERSON:PERSON_PTR);
           PROCEDURE LDEL_SOWM_ZERO(CURR_PERSON:PERSON_PTR);

           FUNCTION COUNT_PERSON:INTEGER;
           FUNCTION COUNT_ADD(CURR_PERSON:PERSON_PTR):INTEGER;
           FUNCTION COUNT_SOWM(CURR_PERSON:PERSON_PTR):INTEGER;
           FUNCTION COUNT_UD(CURR_PERSON:PERSON_PTR):INTEGER;
           FUNCTION COUNT_CN(CURR_PERSON:PERSON_PTR):INTEGER;

           FUNCTION TEST_PERSON(CURR_PERSON:PERSON_PTR;VAR KOD:INTEGER;VAR VALUE:REAL):BOOLEAN;
           FUNCTION INIT_PERSON_ITERATOR:PERSON_PTR;
           FUNCTION GET_NEXT_PERSON_ITERATOR(VAR CURR_PERSON:PERSON_PTR):BOOLEAN;
           FUNCTION INIT_PERSON_ITERATOR_ABSOLUTE:PERSON_PTR;
           FUNCTION GET_NEXT_PERSON_ITERATOR_ABSOLUTE(VAR CURR_PERSON:PERSON_PTR):BOOLEAN;
           FUNCTION OK_PERSON_ITERATOR(CURR_PERSON:PERSON_PTR):BOOLEAN;
           FUNCTION COUNT_PERSON_WITH_FILTER:INTEGER;
           FUNCTION DEL_WANTED_CN(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR):BOOLEAN;
           FUNCTION DEL_WANTED_UD(WANTED_SHIFR:INTEGER;
                                  CURR_PERSON:PERSON_PTR;
                                  START_MONTH:INTEGER):BOOLEAN;
           FUNCTION DEL_WANTED_ADD(WANTED_SHIFR:INTEGER;
                                   CURR_PERSON:PERSON_PTR;
                                   START_MONTH:INTEGER):BOOLEAN;
  PROCEDURE REWRITE_NET(VAR F;RECSIZE:WORD;FNAME:STRING);
  PROCEDURE RESET_NET(VAR F:FILE;RECSIZE:WORD;FNAME:STRING);
  FUNCTION IS_PENSIONER(CURR_PERSON:PERSON_PTR):BOOLEAN;
  PROCEDURE SELECT(I:INTEGER);
  procedure Delay(R:Integer);
  FUNCTION IS_PRINAT_UWOLEN(CURR_PERSON:PERSON_PTR):BOOLEAN;
  function STORONNEE_PODRAZD(wanted_serv:integer):boolean;
  function RECENZENT_PODRAZD(wanted_serv:integer):boolean;
  FUNCTION GetLgotyPN2004(CURR_PERSON:PERSON_PTR):REAL;
  FUNCTION GetProcPensNalog(CURR_PERSON:PERSON_PTR;Summa:Real;var PensNalog:real):REAL;
  Function IsColedgPodr(nserv:integer):boolean;
  FUNCTION IS_FOND5(CURR_PERSON:PERSON_PTR):BOOLEAN;
  PROCEDURE  MAKE_FOND5(CURR_PERSON:PERSON_PTR);
  FUNCTION IS_NOTFOND5(CURR_PERSON:PERSON_PTR):BOOLEAN;
  PROCEDURE  MAKE_NOTFOND5(CURR_PERSON:PERSON_PTR);
  FUNCTION IS_PENS_PROC_ZAKON(CURR_PERSON:PERSON_PTR):BOOLEAN;
  function GetSummaNachForPodohInCn(Curr_Person:Person_Ptr;WantedPeriod:word):real;
  function GetSummaPodohInCn(Curr_Person:Person_Ptr;WantedPeriod:word):real;
  function GetSummaPensInCn(Curr_Person:Person_Ptr;WantedPeriod:word):real;
  function IsBolnShifr(I:Integer):boolean;
  FUNCTION SUM(SUMMA:REAL):REAL;
  PROCEDURE SET_UP_FOR_PODOH_SOWM_SEARCH(CURR_PERSON:PERSON_PTR);
  FUNCTION FIND_CN_BASE(CURR_PERSON:PERSON_PTR;
                        WANTED_SHIFR:INTEGER;
                        WANTED_MONTH:INTEGER):CN_PTR;
  function GET_PROCENT_POCHTOW_SBOR(SUMMA:REAL;MODE:INTEGER;VAR CODE_PROC:REAL):REAL;
  FUNCTION GET_ALIMENTY_MODE(ALABEL:INTEGER):BYTE;
  FUNCTION IS_TEST_DEKRET(CURR_PERSON:PERSON_PTR):BOOLEAN;
  FUNCTION SUM_VYPLACHENO_UD(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):REAL;
  FUNCTION SUM_VYPLACHENO_ADD(WANTED_SHIFR:INTEGER;CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):REAL;






implementation
   uses SysUtils,QDialogs,DateUtils,QControls,ScrLists,ScrIo;
   const doss:array[1..66] of byte = ($80,$81,$82,$83,$84,$85,$F0,$86,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F,$90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F,$A0,$A1,$A2,$A3,$A4,$A5,$F1,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF);
   const wins:array[1..66] of byte = ($C0,$C1,$C2,$C3,$C4,$C5,$A8,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$B8,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$FF);

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
        IF (NMES<>FLOW_MONTH) THEN
           FNINF:=GET_CURRENT_DISK+COPY(ALLTRIM(DDIR),3,LENGTH(ALLTRIM(DDIR))-2)+A_MONTH[NMES]+'\F'+P+S+D+'.DAT'
                    ELSE FNINF:=DDIR+A_MONTH[NMES]+'\F'+P+S+D+'.DAT';


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

Function FormatFloatPoint(A:Real):String;
  const F='######0.00';
     var S:String;
  begin
       S:=FormatFloat(F,A);
       FormatFloatPoint:=ReplChar(S,',','.')
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
       if ord(c)<$80 then Exit;
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
   var RetVal:boolean;
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
                                  else Shifr_Serv:=WN;

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
         W_serv:=Shifr_Serv(WN);
         finded:=false;
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
   begin
         GetNameShifr:=ShifrList.GetName(I);
   end;

  procedure Error(S:String);
   begin
        ShowMessage(S);
   end;

 FUNCTION UPPER(Ch:char):char;
  const lc='абвгдеёжзийклмнопрстуфхцчшщьъыэюя';
        uc='АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЪЫЭЮЯ';
  var i:integer;
  begin
       Upper:=Ch;
       i:=pos(Ch,Lc);
       if i>0 then Upper:=uc[i];
  end;
 FUNCTION UPPER_STRING(S:STRING):STRING;
  VAR CS:STRING[2];
      I,L:INTEGER;
      S1:STRING;
  BEGIN
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

 FUNCTION ALL(C:CHAR;L:INTEGER):STRING;
   var RetVal:string;
       i:integer;
   begin
        RetVal:='';
        if (L>0) and (L<500) then for i:=1 to L do RetVal:=RetVal+C;
        All:=RetVal;
   end;
   FUNCTION SPACE(L:INTEGER):STRING;
    begin
         SPACE:=All(' ',L);
    end;


 FUNCTION SHORT_FIO(FFIO:STRING):STRING;
 VAR BLANK:CHAR;
     FLSTR:STRING;
     I,J,K,LIMIT:INTEGER;
     FOU:BOOLEAN;
 BEGIN
     I:=1;
     LIMIT:=38;
     BLANK:=' ';
     FLSTR:=COPY(FFIO+'                    ',1,20);
     FOU:=FALSE;
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


  FUNCTION GET_IST_NAME(N_Ist:INTEGER):STRING;
   BEGIN
         if (n_IST<1) or (n_IST>max_IST_FIN) then get_IST_name:='ош.номер'
            else get_IST_name:=IST_FIN_name[n_IST];
   END;

  FUNCTION GET_kat_name(n_kat:INTEGER):string;
  begin
    if (n_kat<1) or (n_kat>max_katEGORIJA) then get_kat_name:='ош.номер'
      else get_kat_name:=kat_name[n_kat];
  end;


FUNCTION WORK_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):integer;
 VAR I,J:INTEGER;
 BEGIN
      J:=0;
      FOR I:=START_DAY TO LAST_DAY DO IF ((CURR_PERSON^.TABEL[I]=RABOTA)       OR
                           (CURR_PERSON^.TABEL[I]=KOMANDIROWKA) OR
                           (CURR_PERSON^.TABEL[I]=LEGK_TRUD)    OR
                           (CURR_PERSON^.TABEL[I]=GOS_OB))       THEN
                           J:=J+1;
      WORK_DAY:=J;
 END;

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

FUNCTION WORK_CLOCK(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 VAR I,J:INTEGER;
     A,OO:REAL;
 FUNCTION TEST_SUBBOTA(I:INTEGER):BOOLEAN;
  VAR
     L:BOOLEAN;
  BEGIN
     L:=FALSE;
     IF CURR_PERSON^.TABEL[I+1]=VYHODN THEN L:=TRUE
                                       ELSE
              IF (((DAY_KOD[I+1]=0) OR (I=31)) AND (CURR_PERSON^.TABEL[I-6]=VYHODN))
                                                 THEN  L:=TRUE
                                       ELSE
              IF (NMES=4) AND (I=30) THEN L:=TRUE;
     TEST_SUBBOTA:=L;
  END;
 BEGIN
      A:=0;
      IF CURR_PERSON^.MODE=FIVE_DAY THEN
         BEGIN
              FOR I:=1 TO 31 DO IF DAY_KOD[I]=1 THEN
                                IF DAY_KOD[I+1]=4 THEN A:=A+6
                                                  ELSE A:=A+7
                                                ELSE
                             IF DAY_KOD[I]=2 THEN A:=A+6;
              OO:=WORK_DAY(START_DAY,LAST_DAY,CURR_PERSON);
              A:=A/W_DAY[NMES]*OO;
         END
                                    ELSE
         FOR I:=START_DAY TO LAST_DAY DO IF ((CURR_PERSON^.TABEL[I]=RABOTA)       OR
                              (CURR_PERSON^.TABEL[I]=KOMANDIROWKA) OR
                              (CURR_PERSON^.TABEL[I]=GOS_OB))       THEN
                              IF TEST_SUBBOTA(I) THEN  A:=A+6
                                                 ELSE  A:=A+7;
      CURR_PERSON^.DAY:=A;
      WORK_CLOCK:=A;
 END;

FUNCTION NADBAWKA_DAY(START_DAY:INTEGER;LAST_DAY:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 VAR I,J:INTEGER;
     T:byte;
 FUNCTION TEST_SUBBOTA(I:INTEGER):BOOLEAN;
  VAR
     L:BOOLEAN;
     J:INTEGER;
     Y,M,D,DOW:WORD;
     DateWrk:TDateTime;
  BEGIN
     VAL(WORK_YEAR,Y,J);
     IF J<>0 THEN BEGIN TEST_SUBBOTA:=FALSE; EXIT; END;
     M:=NMES;
     D:=I;
     RecodeYear(DateWrk,Y);
     RecodeMonth(DateWrk,M);
     RecodeDay(DateWrk,D);
     Dow:=DayOfWeek(DateWrk);
     IF DOW=6 THEN TEST_SUBBOTA:=TRUE ELSE TEST_SUBBOTA:=FALSE;
     EXIT;
  END;

{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
FUNCTION THIS_PERSON(CURR_PERSON:PERSON_PTR):BOOLEAN;
 VAR L:BOOLEAN;
 BEGIN
       L:=FALSE;
(*
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
*)
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






  PROCEDURE MAKE_PERSON(VAR CURR_PERSON:PERSON_PTR);
   VAR I,J:INTEGER;
       CURR:PERSON_PTR;
   PROCEDURE ZERO_HOLIDAY;
    VAR I,J,K:INTEGER;
    BEGIN
        FOR I:=1 TO 4 DO FOR J:=1 TO 2 DO FOR K:=1 TO 3 DO
            CURR_PERSON^.HOLIDAY[I,J,K]:=0;
    END;
 PROCEDURE FILL_STANDARD_TABEL;
  VAR I:INTEGER;
  BEGIN
       FOR I:=1 TO 31 DO
                CASE DAY_KOD[I] OF
                     0 : CURR_PERSON^.TABEL[I]:=NEZAPOLN;
                     1 : CURR_PERSON^.TABEL[I]:=JAWKA;
                     2 : IF CURR_PERSON^.MODE=FIVE_DAY THEN CURR_PERSON^.TABEL[I]:=VYHODN
                                                       ELSE CURR_PERSON^.TABEL[I]:=JAWKA;
                     3 : CURR_PERSON^.TABEL[I]:=VYHODN;
                     4 : CURR_PERSON^.TABEL[I]:=VYHODN;
                END;
 {      MAKE_OTP_TABEL(CURR_PERSON);}
  END;
   BEGIN
{       IF HEAD_PERSON<>NIL THEN     }
{       IF NOT OK_FREE_MEM(SIZEOF(HEAD_PERSON^)) THEN EXIT;}
       NEW(CURR_PERSON);
(*       IF OLD_FILE THEN
          BEGIN
          J:=COUNT_PERSON;
          IF J>0 THEN BEGIN FOR I:=1 TO J DO
{                                IF I=1 THEN CURR:=HEAD_PERSON_OLD
                                       ELSE CURR:=CURR^.NEXT;       }
                                IF I=1 THEN CURR:=HEAD_PERSON
                                       ELSE CURR:=CURR^.NEXT;
                                CURR^.NEXT:=CURR_PERSON;
                       END
                 ELSE
{                        HEAD_PERSON_OLD:=CURR_PERSON;}
                         HEAD_PERSON:=CURR_PERSON;
          END
                   ELSE *)
          BEGIN
          J:=COUNT_PERSON;
          IF J>0 THEN BEGIN FOR I:=1 TO J DO
                                IF I=1 THEN CURR:=HEAD_PERSON
                                       ELSE CURR:=CURR^.NEXT;
                            CURR^.NEXT:=CURR_PERSON;
                       END
                 ELSE
                        HEAD_PERSON:=CURR_PERSON;
          END;
       WITH CURR_PERSON^ DO
            BEGIN
                TABNO:=0;
                FIO  :='                    ';
                GRUPPA:=1;             {BUJDGET}
                KATEGORIJA:=1;          {PREPOD}
                DOLG :='          ';
                WID_RABOTY:=1;         {OSN}
                N_TEMY:='          ';
                MESTO_OSN_RABOTY:=SHIFR_SERV(NSRV);
                WID_OPLATY:=1;         {STAWKA}
                MODE :=FIVE_DAY;       {Пятидневка}
                OKLAD:=0.;
                FROM:=0;               {OTKUDA PRIBYL}
                MALO :=0;
                PODOH:=100;
                PROFSOJUZ:=1;
                DAY :=0;
                MAIN:=3;
{               RECALC:=0;}
                BANK:=0;
                FOR I:=1 TO 8 DO RESERVED[I]:=0;
                STATE:=PERSON_WORK_STATE;
                AUTOMATIC:=AUTOMATIC_MODE;
                NAL_CODE:='';
                START_DAY:=1;
                PENS:=100;
                NEXT:=NIL;
                SOWM:=NIL;
                ADD:=NIL;
                UD:=NIL;
                CN:=NIL;
            END;
       FILL_STANDARD_TABEL;
       ZERO_HOLIDAY;
   END;
  PROCEDURE MAKE_ADD(VAR CURR_ADD:ADD_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR:ADD_PTR;
   BEGIN
   {    IF CURR_PERSON^.ADD<>NIL THEN}
{       IF NOT OK_FREE_MEM(SIZEOF(CURR_PERSON^.ADD^)) THEN EXIT;}
       NEW(CURR_ADD);
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
                NEXT:=NIL;
            END;
       IF CURR_PERSON^.ADD=NIL THEN CURR_PERSON^.ADD:=CURR_ADD
                               ELSE BEGIN
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
       WITH CURR_SOWM^ DO
            BEGIN
                WHERE:=1;
                NEXT:=NIL;
            END;
       IF CURR_PERSON^.SOWM=NIL THEN CURR_PERSON^.SOWM:=CURR_SOWM
                               ELSE BEGIN
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
       IF CURR_PERSON^.UD=NIL THEN CURR_PERSON^.UD:=CURR_UD
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
               L:=FALSE;
               IF I_C>0 THEN FOR I:=1 TO I_C DO
                  BEGIN
                       IF I=1 THEN CURR_CN:=CURR_PERSON^.CN
                              ELSE CURR_CN:=CURR_CN^.NEXT;
                       IF CURR_CN^.ID=R THEN L:=TRUE;
                  END;
         UNTIL NOT L;
         MAKE_NEW_ID_CN:=R;
    END;
   BEGIN
       IF CURR_PERSON^.CN<>NIL THEN
       IF NOT OK_FREE_MEM(SIZEOF(CURR_PERSON^.CN^)) THEN EXIT;
       NEW(CURR_CN);
       WITH CURR_CN^ DO
            BEGIN
                SHIFR:=0;
                KOD:=0;
                SUMMA:=0.;
                PRIM:=0;
                PRIM_1:='        ';
                DEJA_COUNTED := NOT_DEJA_COUNTED;
                FLOW_SUMMA   := 0;
                LIMIT_SUMMA  := 0;
                AUTOMATIC    := AUTOMATIC_MODE;
                ID           := MAKE_NEW_ID_CN;
                COUNT        := GET_IST_NAME(CURR_PERSON^.GRUPPA);
                NEXT:=NIL;
            END;
       IF CURR_PERSON^.CN=NIL THEN CURR_PERSON^.CN:=CURR_CN
                               ELSE BEGIN
                       CURR:=CURR_PERSON^.CN;
                       WHILE CURR^.NEXT<>NIL DO CURR:=CURR^.NEXT;
                       CURR^.NEXT:=CURR_CN
                                    END;
   END;
  PROCEDURE DEL_ADD(VAR CURR_ADD:ADD_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR,DELETED_ADD:ADD_PTR;
   BEGIN
        DELETED_ADD:=CURR_ADD;
        IF CURR_PERSON^.ADD=CURR_ADD THEN CURR_PERSON^.ADD:=CURR_ADD^.NEXT
                                   ELSE BEGIN
                                         CURR:=CURR_PERSON^.ADD;
                                     WHILE CURR^.NEXT<>CURR_ADD DO CURR:=CURR^.NEXT;
                                     CURR^.NEXT:=CURR_ADD^.NEXT
                                        END;
       DISPOSE(DELETED_ADD);
   END;
  PROCEDURE DEL_SOWM(VAR CURR_SOWM:SOWM_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR,DELETED_SOWM:SOWM_PTR;
   BEGIN
        DELETED_SOWM:=CURR_SOWM;
        IF CURR_PERSON^.SOWM=CURR_SOWM THEN CURR_PERSON^.SOWM:=CURR_SOWM^.NEXT
                                   ELSE BEGIN
                                         CURR:=CURR_PERSON^.SOWM;
                                     WHILE CURR^.NEXT<>CURR_SOWM DO CURR:=CURR^.NEXT;
                                     CURR^.NEXT:=CURR_SOWM^.NEXT
                                        END;
       DISPOSE(DELETED_SOWM);
   END;
  PROCEDURE DEL_UD(VAR CURR_UD:UD_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR,DELETED_UD:UD_PTR;
   BEGIN
        DELETED_UD:=CURR_UD;
        IF CURR_PERSON^.UD=CURR_UD THEN CURR_PERSON^.UD:=CURR_UD^.NEXT
                                   ELSE BEGIN
                                         CURR:=CURR_PERSON^.UD;
                                     WHILE CURR^.NEXT<>CURR_UD DO CURR:=CURR^.NEXT;
                                     CURR^.NEXT:=CURR_UD^.NEXT
                                        END;
       DISPOSE(DELETED_UD);
   END;
  PROCEDURE DEL_CN(VAR CURR_CN:CN_PTR;CURR_PERSON:PERSON_PTR);
   VAR CURR,DELETED_CN:CN_PTR;
   BEGIN
        DELETED_CN:=CURR_CN;
        IF CURR_PERSON^.CN=CURR_CN THEN CURR_PERSON^.CN:=CURR_CN^.NEXT
                                   ELSE BEGIN
                                         CURR:=CURR_PERSON^.CN;
                                     WHILE CURR^.NEXT<>CURR_CN DO CURR:=CURR^.NEXT;
                                     CURR^.NEXT:=CURR_CN^.NEXT
                                        END;
       DISPOSE(DELETED_CN);
   END;
  PROCEDURE DEL_PERSON(VAR CURR_PERSON:PERSON_PTR);
   VAR
       CURR,DELETED_PERSON   :PERSON_PTR;
     BEGIN
       DELETED_PERSON:=CURR_PERSON;
       WHILE CURR_PERSON^.SOWM<>NIL DO DEL_SOWM(CURR_PERSON^.SOWM,CURR_PERSON);
       WHILE CURR_PERSON^.ADD<>NIL DO DEL_ADD(CURR_PERSON^.ADD,CURR_PERSON);
       WHILE CURR_PERSON^.UD<>NIL DO DEL_UD(CURR_PERSON^.UD,CURR_PERSON);
       WHILE CURR_PERSON^.CN<>NIL DO DEL_CN(CURR_PERSON^.CN,CURR_PERSON);
       IF HEAD_PERSON=CURR_PERSON THEN HEAD_PERSON:=CURR_PERSON^.NEXT
                                  ELSE BEGIN
                                           CURR:=HEAD_PERSON;
                                           WHILE CURR^.NEXT<>CURR_PERSON DO CURR:=CURR^.NEXT;
                                           CURR^.NEXT:=CURR_PERSON^.NEXT
                                       END;
       DISPOSE(DELETED_PERSON);
   END;
 PROCEDURE DELETE_PERSON(VAR CURR_PERSON:PERSON_PTR);
  BEGIN
       WHILE CURR_PERSON^.SOWM<>NIL DO DEL_SOWM(CURR_PERSON^.SOWM,CURR_PERSON);
       WHILE CURR_PERSON^.ADD<>NIL DO DEL_ADD(CURR_PERSON^.ADD,CURR_PERSON);
       WHILE CURR_PERSON^.UD<>NIL DO DEL_UD(CURR_PERSON^.UD,CURR_PERSON);
       WHILE CURR_PERSON^.CN<>NIL DO DEL_CN(CURR_PERSON^.CN,CURR_PERSON);
       DISPOSE(CURR_PERSON);
  END;
  PROCEDURE LDEL_PERSON_OLD;
   BEGIN
      IF SELECTED_FIELD=1 THEN BEGIN
         ShowMessage('IN LDEL_PERSON_OLD ENTERED WITH SELECTED_FIELD=1');
         EXIT;
                               END;
      WHILE (HEAD_PERSON<>NIL) DO DEL_PERSON(HEAD_PERSON);
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
 
  end.
