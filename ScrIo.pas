{$H-}
unit ScrIo;                    
                     
interface                          
   PROCEDURE GETINF(NEED_NET:BOOLEAN);
   PROCEDURE PUTINF;
implementation
     Uses SysUtils,QDialogs,ScrDef,ScrUtil,UCrc32,UDuplTest,
          ScrIOSQL,scrLists,Windows,UIOMonitor,uPersonService;
CONST LOW_IO_BUF_PTR = 2;
      PERSON_SIZE    = SIZEOF(PERSON);
//type TBufClass=class
//                  lenBuf:Integer;
//                  buf :pByteArray;
//               end;
const versionSignature:array[1..8]of char=('V','e','r','s','i','o','n',' ');
TYPE tVersionRec=record
                  fraza:array[1..8] of char;
                  versionNo:array[1..2] of char;
                  crc32:cardinal;
                  nmbOfPerson:integer;
                  month:integer;
                  year:integer;
                  shifrpod:integer;
                  fname:array[1..32] of char;
                 end;
VAR  IO_BUF_PTR,IO_BUF_PTR_OLD:INTEGER;
     VERSION      : CHAR;
     INF          : FILE;
     IO_BUF_LEN   : WORD;
     RESULTIO     : INTEGER;
     versionRec   : tVersionRec;

function getVersion:string;
 var   resultV:integer;
       s:char;
       fraza:string;
       st:string;
   begin
        reset(inf,1);
        blockRead(inf,versionRec,sizeOf(versionRec),resultV);
        if resultV<>sizeOf(versionRec) then
           begin
                getVersion:='A';
                exit;
           end;
       if (CompareMem( @versionRec.fraza[1], @versionSignature[ 1 ], 8 )) then
       if ((versionRec.versionNo[1] in [' ','A'..'Z'])
          and
          (versionRec.versionNo[2] in [' ','A'..'Z'])) then
//       if versionRec.fraza='Version ' then
          begin
               st[0]:=chr(2);
               st[1]:=versionRec.versionNo[1];
               st[2]:=versionRec.versionNo[2];
               st:=trim(st);
               getVersion:=st;
               exit;
          end;
       reset(inf,1);
       blockRead(inf,s,1,resultV);
       if resultV<>1 then
          begin
               getVersion:='';
               exit;
          end;
       if not (s in ['B','C','D','E']) then
          s:='A';
       getVersion:=s;
   end;

PROCEDURE BLOCKWRITE_NET(VAR F:FILE ;VAR BUF;COUNT:INTEGER;VAR RESULTIO:INTEGER);FORWARD;
PROCEDURE RENAME_NET(VAR F:FILE;FNINF_BAK:STRING);FORWARD;
PROCEDURE ERASE_NET(VAR F:FILE;FNINF_BAK:STRING);FORWARD;
function RenameFile_NET(OldFileName:string;NewFileName:string):boolean;forward;
function DeleteFile_NET(FileNameA:string):boolean;forward;
function CopyFile(FileNameSrc:string;FileNameDst:string):Boolean;forward;
function getFileSize(fileName:string):longword;forward;
function copyFileByWindows(AFileName, ANewFileName: string):Boolean;forward;





PROCEDURE GETINF_BLOCK(NEED_NET:BOOLEAN);
 VAR BLOCK_COUNT_PERSON,TOTAL_BLOCK_COUNT_PERSON:INTEGER;
     S           : CHAR;
     S1          : STRING;
     KOD         : INTEGER;
     SHOW_FLAG   : BOOLEAN;
     NEED_EXIT   : BOOLEAN;
     FIRST,DONE  : BOOLEAN;
     NEED_UNLOCK : BOOLEAN;
     SErr        : String;
     ResultG     : Integer;
     CRC32ReadedFromFile:cardinal;
  PROCEDURE GET_FROM_BUF(VAR P;SIZE:WORD);
   VAR PP:ARRAY[1..PERSON_SIZE] OF BYTE ABSOLUTE P;
       PPP:ARRAY[1..PERSON_SIZE] OF BYTE;
       I:WORD;
       LONG_IO_BUF_PTR:LONGINT;
   BEGIN
       KZ:=0;
       IF SIZE<=0 THEN EXIT;
       IO_BUF_PTR_OLD:=IO_BUF_PTR;
       IF IO_BUF_PTR+SIZE>IO_BUF_LEN THEN
          BEGIN
               ShowMessage('Запрос из буфера превысил размер прочитанной информации');
               KZ:=-1;
               EXIT;
          END;
       FOR I:=1 TO SIZE DO
           BEGIN
                INC(IO_BUF_PTR);
                PP[I]:=IO_BUF^[WORD(IO_BUF_PTR)];
           END;
   END;

  FUNCTION GET_BUF_FROM_FILE:BOOLEAN;
   VAR L       : BOOLEAN ;
       RESULTG : INTEGER  ;
       KOD     : INTEGER ;
       S       : STRING  ;
       DONE    : BOOLEAN ;
       LL      : LongInt ;
       LLW     : Word    ;
       DestOff : LongInt ;
   BEGIN
        KZ:=0;
        L:=FALSE;
        IO_BUF_PTR:=LOW_IO_BUF_PTR;
        BLOCK_COUNT_PERSON:=0;
{        BLOCKREAD_NET(INF,IO_BUF_LEN,2,RESULTG);}
        BLOCKREAD(INF,IO_BUF_LEN,2,RESULTG);
        IF RESULTG=2 THEN
        IF (IO_BUF_LEN>0) AND (IO_BUF_LEN<SIZE_OF_IO_BUF) THEN
            BEGIN
{                 BLOCKREAD_NET(INF,IO_BUF^,IO_BUF_LEN,RESULTG);}
                 BLOCKREAD(INF,IO_BUF^,IO_BUF_LEN,RESULTG);
                 IF RESULTG=IO_BUF_LEN                    THEN
                    BEGIN
                         BLOCK_COUNT_PERSON:=IO_BUF^[1]+IO_BUF^[2]*256;
                         IF (BLOCK_COUNT_PERSON>=1) and (BLOCK_COUNT_PERSON<=MAX_PERSON) THEN L:=TRUE;
                    END;
            END
                                                          ELSE
        IF IO_BUF_LEN<>0 THEN
                 ShowMessage('По данным файла '+FNINF+' требуется буфер размером '+IntToStr(Io_Buf_Len)+' байт.'+
                             'В программе зарезервирован буфер размером '+IntToStr(SIZE_OF_IO_BUF)+' байт.');
        TOTAL_BLOCK_COUNT_PERSON:=TOTAL_BLOCK_COUNT_PERSON+BLOCK_COUNT_PERSON;
        GET_BUF_FROM_FILE:=L;
   END;
  PROCEDURE UNPACK_PERSON(NUMBER:INTEGER);
    TYPE
       PERSON_A    = RECORD
                       TABNO            : WORD;
                       FIO              : STRING[20];
                       GRUPPA           : WORD; {NIS BJDGET,GN,FR}
                       KATEGORIJA       : WORD; {NIS,UWP,PREPOD}
                       DOLG             : STRING[10];
                       OKLAD            : REAL48;
                       WID_RABOTY       : WORD; {SOWM,OSN}
                       N_TEMY           : STRING[10];
                       MESTO_OSN_RABOTY : WORD;
                       WID_OPLATY       : WORD; {STAWKA,SDELNO,POCHASOWO}
                       MODE             : WORD; {5-,6- DAY}
                       FROM             : WORD; {OTKUDA PRIBYL}
                       PODOH            : BYTE;
                       MALO             : BYTE;
                       PROFSOJUZ        : BYTE;
                       DAY              : REAL;
                       MAIN             : WORD; {1 - ДЛЯ НАСТОЯЩЕГО ОСНОВНОГО МЕСТА РАБОТЫ}
                                                   {0 - ДЛЯ ПРОШЛОГО ОСНОВНОГО МНСТА РАБОТЫ}
                       TABEL            : TABEL_TYPE;
                       HOLIDAY          : HOLIDAY_TYPE;
                       STATE            : BYTE;             {Работа отпуск декрет}
                       AUTOMATIC        : BYTE;              {Считать или не считать}
                       START_DAY        : BYTE;              {С этого дня начинать считать табель}
                       PENS             : BYTE;
                       NEXT             : PERSON_PTR;
                       SOWM             : SOWM_PTR;
                       ADD              : ADD_PTR;
                       UD               : UD_PTR;
                       CN               : CN_PTR;
                  END;
       PERSON_B    = RECORD
                       TABNO            : WORD;
                       FIO              : STRING[20];
                       GRUPPA           : WORD; {NIS BJDGET,GN,FR}
                       KATEGORIJA       : WORD; {NIS,UWP,PREPOD}
                       DOLG             : STRING[10];
                       OKLAD            : REAL48;
                       WID_RABOTY       : WORD; {SOWM,OSN}
                       N_TEMY           : STRING[10];
                       MESTO_OSN_RABOTY : WORD;
                       WID_OPLATY       : WORD; {STAWKA,SDELNO,POCHASOWO}
                       MODE             : WORD; {5-,6- DAY}
                       FROM             : WORD; {OTKUDA PRIBYL}
                       PODOH            : BYTE;
                       MALO             : BYTE;
                       PROFSOJUZ        : BYTE;
                       DAY              : REAL48;
                       MAIN             : WORD; {1 - ДЛЯ НАСТОЯЩЕГО ОСНОВНОГО МЕСТА РАБОТЫ}
                                                   {0 - ДЛЯ ПРОШЛОГО ОСНОВНОГО МНСТА РАБОТЫ}
                       TABEL            : TABEL_TYPE;
                       HOLIDAY          : HOLIDAY_TYPE;
                       STATE            : BYTE;             {Работа отпуск декрет}
                       AUTOMATIC        : BYTE;              {Считать или не считать}
                       START_DAY        : BYTE;              {С этого дня начинать считать табель}
                       PENS             : BYTE;
                       NEXT             : PERSON_PTR;
                       SOWM             : SOWM_PTR;
                       ADD              : ADD_PTR;
                       UD               : UD_PTR;
                       CN               : CN_PTR;
                  END;

       PERSON_C   = RECORD
                       TABNO            : WORD;
                       FIO              : STRING[20];
                       GRUPPA           : WORD; {NIS BJDGET,GN,FR}
                       KATEGORIJA       : WORD; {NIS,UWP,PREPOD}
                       DOLG             : STRING[10];
                       OKLAD            : REAL48;
                       WID_RABOTY       : WORD; {SOWM,OSN}
                       N_TEMY           : STRING[10];
                       MESTO_OSN_RABOTY : WORD;
                       WID_OPLATY       : WORD; {STAWKA,SDELNO,POCHASOWO}
                       MODE             : WORD; {5-,6- DAY}
                       FROM             : WORD; {OTKUDA PRIBYL}
                       PODOH            : BYTE;
                       MALO             : BYTE;
                       PROFSOJUZ        : BYTE;
                       DAY              : REAL48;
                       MAIN             : WORD; {1 - ДЛЯ НАСТОЯЩЕГО ОСНОВНОГО МЕСТА РАБОТЫ}
                                                   {0 - ДЛЯ ПРОШЛОГО ОСНОВНОГО МНСТА РАБОТЫ}
                       TABEL            : TABEL_TYPE;
                       HOLIDAY          : HOLIDAY_TYPE;
                       STATE            : BYTE;             {Работа отпуск декрет}
                       AUTOMATIC        : BYTE;              {Считать или не считать}
                       START_DAY        : BYTE;              {С этого дня начинать считать табель}
                       PENS             : BYTE;
                       RECALC           : BYTE;
                       RESERVED         : ARRAY[1..8] OF BYTE;
                       NEXT             : PERSON_PTR;
                       SOWM             : SOWM_PTR;
                       ADD              : ADD_PTR;
                       UD               : UD_PTR;
                       CN               : CN_PTR;
                  END;
       PERSON_E    = RECORD
                       TABNO            : WORD;
                       FIO              : STRING[20];
                       GRUPPA           : word; {NIS BJDGET,GN,FR}
                       KATEGORIJA       : WORD; {NIS,UWP,PREPOD}
                       DOLG             : STRING[10];
                       OKLAD            : REAL48;
                       WID_RABOTY       : word; {SOWM,OSN}
                       N_TEMY           : STRING[10];
                       MESTO_OSN_RABOTY : WORD;
                       WID_OPLATY       : WORD; {STAWKA,SDELNO,POCHASOWO}
                       MODE             : WORD; {5-,6- DAY}
                       FROM             : WORD; {OTKUDA PRIBYL}
                       PODOH            : BYTE;
                       MALO             : BYTE;
                       PROFSOJUZ        : BYTE;
                       DAY              : REAL48;
                       MAIN             : WORD; {1 - ДЛЯ НАСТОЯЩЕГО ОСНОВНОГО МЕСТА РАБОТЫ}
                                                   {0 - ДЛЯ ПРОШЛОГО ОСНОВНОГО МНСТА РАБОТЫ}
                       TABEL            : TABEL_TYPE;
                       HOLIDAY          : HOLIDAY_TYPE;
                       STATE            : BYTE;             {Работа отпуск декрет}
                       AUTOMATIC        : BYTE;              {Считать или не считать}
                       START_DAY        : BYTE;              {С этого дня начинать считать табель}
                       PENS             : BYTE;
                       BANK             : BYTE;
                       ID               : LongWord;
                       Reserved         : LongWord;
          //             RESERVED         : ARRAY[1..8] OF BYTE;
                       NAL_CODE         : STRING[10];

                       NEXT             : PERSON_PTR;
                       SOWM             : SOWM_PTR;
                       ADD              : ADD_PTR;
                       UD               : UD_PTR;
                       CN               : CN_PTR;

                  END;


       ADD_C     =RECORD
                       SHIFR      : WORD;
                       PERIOD     : BYTE   ;
                       YEAR       : BYTE   ;
                       SUMMA      : REAL48   ;
                       FMP        : REAL48   ;
                       FZP        : REAL48   ;
                       OTHER      : REAL48   ;
                       VYPLACHENO : WORD;
                       WHO        : WORD;    {Получена автоматически или вручную}
                       NEXT       : ADD_PTR;
                  END;
       ADD_D     =RECORD
                       SHIFR      : WORD;
                       PERIOD     : BYTE   ;
                       YEAR       : BYTE   ;
                       SUMMA      : REAL48   ;
                       FMP        : REAL48   ;
                       FZP        : REAL48   ;
                       OTHER      : REAL48   ;
                       VYPLACHENO : WORD;
                       WHO        : WORD;    {Получена автоматически или вручную}
                       COUNT      : STRING[8];
                       NEXT       : ADD_PTR;
                  END;
       Add_E      =RECORD
                       SHIFR      : WORD   ;
                       PERIOD     : BYTE   ;
                       YEAR       : BYTE   ;   {1991 - 1 и т д}
                       SUMMA      : REAL48   ;
                       FMP        : REAL48   ;
                       FZP        : REAL48   ;
                       OTHER      : REAL48   ;
                       VYPLACHENO : WORD   ;
                       WHO        : WORD   ;    {Получена автоматически или вручную}
                       WORK_DAY   : WORD   ;
                       WORK_CLOCK : REAL48   ;
                       SHIFR_KAT  : BYTE   ;
                       SHIFR_GRU  : BYTE   ;
                       COUNT      : STRING[8];
                       NEXT       : ADD_PTR;
                  END;


       UD_C      =RECORD
                       SHIFR      : WORD;
                       PERIOD     : BYTE   ;
                       YEAR       : BYTE   ;
                       SUMMA      : REAL48;
                       VYPLACHENO : WORD;
                       WHO        : WORD;   {Получена автоматически или вручную}
                       NEXT       : UD_PTR;
                  END;
       UD_E      =RECORD
                       SHIFR      : WORD   ;
                       PERIOD     : BYTE   ;
                       YEAR       : BYTE   ;   {1991 - 1 и т д}
                       SUMMA      : REAL48 ;
                       VYPLACHENO : WORD   ;
                       WHO        : WORD   ;   {Получена автоматически или вручную}
                       COUNT      : STRING[8];
                       NEXT       : UD_PTR;
                  END;


       CN_C      =RECORD
                       SHIFR        : WORD;
                       KOD          : WORD;
                       SUMMA        : REAL48;
                       PRIM         : WORD;
                       PRIM_1       : STRING [8];
                       DEJA_COUNTED : BYTE;       {Флаг "Уже прибавлена сумма для кредита}
                       FLOW_SUMMA   : REAL48;       {Текущая выплаченная сумма кредита}
                       LIMIT_SUMMA  : REAL48;       {Требуемая сумма кредита }
                       AUTOMATIC    : BYTE;
                       ID           : WORD;
                       NEXT         : CN_PTR;
                  END;
      CN_E       =RECORD
                       SHIFR        : WORD;
                       KOD          : WORD;
                       SUMMA        : REAL48;
                       PRIM         : word;
                       PRIM_1       : STRING [8];
                       DEJA_COUNTED : BYTE;       {Флаг "Уже прибавлена сумма для кредита}
                       FLOW_SUMMA   : REAL48;       {Текущая выплаченная сумма кредита}
                       LIMIT_SUMMA  : REAL48;       {Требуемая сумма кредита }
                       AUTOMATIC    : BYTE;
                       ID           : WORD;
                       COUNT        : STRING[8];
                       Next         : CN_PTR;
                  END;



    VAR WORK_PERSON : PERSON;
        www         : array[1..sizeof(Work_Person)] of byte absolute Work_person;
{        wwwf        : array[1..sizeof(Work_Person.Fio)] of byte absolute Work_person.Fio;}
        WORK_PERSON_B : PERSON_B;
        WORK_PERSON_C : PERSON_C;
        WORK_PERSON_E : PERSON_E;
        WORK_SOWM   : SOWM;
        WORK_ADD    : ADD;
        WORK_UD     : UD;
        WORK_CN     : CN;
        WORK_ADD_C  : ADD_C;
        WORK_ADD_D  : ADD_D;
        WORK_ADD_E  : ADD_E;
        WORK_UD_C   : UD_C;
        WORK_UD_E   : UD_E;
        WORK_CN_C   : CN_C;
        WORK_CN_E   : CN_E;
        P:ARRAY[1..PERSON_SIZE] OF BYTE ABSOLUTE WORK_PERSON;
        I,IIII,I_C   : INTEGER;
        CURR_PERSON  : PERSON_PTR;
        CURR_ADD     : ADD_PTR;
        CURR_UD      : UD_PTR;
        CURR_CN      : CN_PTR;
        CURR_SOWM    : SOWM_PTR;
        NEED_PERSON  : BOOLEAN;
        NEED_UNLOCK  : BOOLEAN;
        calc_l       : INTEGER;
 PROCEDURE TEST_PERSON(var WORK_PERSON:PERSON;NUMBER:INTEGER;VERS:STRING);
  VAR I,l  : INTEGER;
      CH : STRING[1];
      tf : array[1..sizeOf(work_person.fio)+5] of byte;
      ssss      : STRING;
      gggg,kkkk : word;
      testfio,testdolg : string;
  BEGIN
        IF NUMBER=14 then
           gggg:=1;
        IF (WORK_PERSON.TABNO<1) OR (WORK_PERSON.TABNO>25000) THEN
           BEGIN
                ShowMessage('Неверный табельный номер у работника номер '+INTtoStr(NUMBER)+'. Версия '+VERS);
                ShowMessage('Ошибка с адреса '+IntToStr(IO_BUF_PTR_OLD));
{                PRINT_BUF_HEX(WORK_PERSON,SIZEOF(WORK_PERSON));}
                EXIT;
           END;
        IIII:=SIZEOF(WORK_PERSON.FIO);
        ssss:=DOSTOWIN(WORK_PERSON.FIO);
        for i:=1 to SizeOf(Work_Person.FIO) do
            tf[i]:=ord(Work_person.Fio[i-1]);
        tf:=tf;
        gggg:=work_person.gruppa;
        kkkk:=work_person.kategorija;
        i:=gggg;
        i:=kkkk;
        testfio:=DOSTOWIN(WORK_PERSON.FIO);
        I:=0;
        l:=ORD(WORK_PERSON.FIO[0]);
        if ((l<0) or (l>20)) then l:=20;
        calc_l:=ord(WORK_PERSON.FIO[0]);
        if (calc_l>sizeOf(WORK_PERSON.FIO)) then
            calc_l:=sizeOf(WORK_PERSON.FIO);
        WHILE (I<calc_l) DO
         BEGIN
              INC(I);
              CH:=DOSTOWIN(WORK_PERSON.FIO[I]);
              IF NOT (CH[1] IN ['A'..'z','А'..'я',' ','.','-','Ї','ї','Є','є','''','`','І','і','"','ё','Ё']) THEN
                 BEGIN
                      ShowMessage('Не верная фамилия у работника номер '+INTTOSTR(NUMBER)+' '+trim(dostowin(WORK_PERSON.FIO))+'. Версия '+VERSion);
                      ShowMessage('Ошибка с адреса '+INTTOSTR(IO_BUF_PTR_OLD));
{                      PRINT_BUF_HEX(WORK_PERSON,SIZEOF(WORK_PERSON)-20);}
                      EXIT
                 END;
         END;
        I:=0;
        testdolg:=DOSTOWIN(WORK_PERSON.dolg);
        calc_l:=ord(WORK_PERSON.dolg[0]);
        if (calc_l>sizeOf(WORK_PERSON.dolg)) then
            calc_l:=sizeOf(WORK_PERSON.dolg);
        WHILE (I<calc_l) DO
         BEGIN
              INC(I);
              CH:=DOSTOWIN(WORK_PERSON.DOLG[I]);
              IF NOT (CH[1] IN ['A'..'z','А'..'я',' ','.','-','0'..'9','(',')',',','/','\',';',':','>','<','Ї','ї','Є','є','''','`','І','і','ё','Ё']) THEN
                 BEGIN
                 ShowMessage('Не верная должность у работника номер '+INTTOSTR(NUMBER)+'. Версия '+VERSion);
                 ShowMessage('Ошибка с адреса '+INTTOSTR(IO_BUF_PTR_OLD));
{                 PRINT_BUF_HEX(WORK_PERSON,SIZEOF(WORK_PERSON)-20);}
                 EXIT
                 END;
         END;
        I:=0;
        calc_l:=ord(WORK_PERSON.NAL_CODE[0]);
        if (calc_l>sizeOf(WORK_PERSON.NAL_CODE)) then
            calc_l:=sizeOf(WORK_PERSON.NAL_CODE);
        WHILE (I<calc_l) DO
         BEGIN
              INC(I);
              CH:=DOSTOWIN(WORK_PERSON.NAL_CODE[I]);
              IF NOT (CH[1] IN ['0'..'9',' ']) THEN
                 BEGIN
                       FillChar(WORK_PERSON.NAL_CODE,SizeOf(WORK_PERSON.NAL_CODE),0);
                       break
                 END;
         END;
        IF (WORK_PERSON.GRUPPA<1) OR (WORK_PERSON.GRUPPA>MAX_GRUPPA) THEN
           BEGIN
                ShowMessage('Неверная группа у работника номер '+INTTOSTR(NUMBER)+'. Версия '+VERSION);
                ShowMessage('Ошибка с адреса '+INTTOSTR(IO_BUF_PTR_OLD));
{                PRINT_BUF_HEX(WORK_PERSON,SIZEOF(WORK_PERSON));}
                EXIT;
           END;
        IF (WORK_PERSON.KATEGORIJA<1) OR (WORK_PERSON.KATEGORIJA>MAX_KAT) THEN
           BEGIN
                ShowMessage('Неверная категория у работника номер '+INTTOSTR(NUMBER)+'. Версия '+VERSION);
                ShowMessage('Ошибка с адреса '+INTTOSTR(IO_BUF_PTR_OLD));
{                PRINT_BUF_HEX(WORK_PERSON,SIZEOF(WORK_PERSON));}
                EXIT;
           END;
        IF (WORK_PERSON.WID_RABOTY<1) OR (WORK_PERSON.WID_RABOTY>2) THEN
           BEGIN
                ShowMessage('Неверный вид работы у работника номер '+INTTOSTR(NUMBER)+'. Версия '+VERSION);
                ShowMessage('Ошибка с адреса '+INTTOSTR(IO_BUF_PTR_OLD));
{                PRINT_BUF_HEX(WORK_PERSON,SIZEOF(WORK_PERSON));}
                EXIT;
           END;
{
        if work_person.mesto_osn_raboty=125 then
           work_person.mesto_osn_raboty:=151;
}
{
        if work_person.mesto_osn_raboty=131 then
           work_person.mesto_osn_raboty:=155;
}
        I:=NOMER_SERV(WORK_PERSON.MESTO_OSN_RABOTY);
        IF (WORK_PERSON.MESTO_OSN_RABOTY<0) OR
           (I>MAX_COUNT_PODRAZD) THEN
           BEGIN
                ShowMessage('Неверное место основной работы у работника номер '+INTTOSTR(NUMBER)+'. Версия '+VERSION+' Место осн работы='+intToStr(I));
                ShowMessage('Ошибка с адреса '+INTTOSTR(IO_BUF_PTR_OLD));
{               PRINT_BUF_HEX(WORK_PERSON,SIZEOF(WORK_PERSON));}
                EXIT;
           END;

{       work_person.from:=work_person.mesto_osn_raboty;}
{        work_person.from:=Shifr_Serv(nsrv);}

{
        IF (WORK_PERSON.FROM<0) OR
           (NOMER_SERV(WORK_PERSON.FROM)>MAX_COUNT_PODRAZD) THEN
           BEGIN
                ERROR('Неверное место основной работы у работника номер '+MY_STR_INT(NUMBER)+'. Версия '+VERSION);
                ERROR('Ошибка с адреса '+MY_STR_INT_HEX(IO_BUF_PTR_OLD));
                PRINT_BUF_HEX(WORK_PERSON,SIZEOF(WORK_PERSON));
                EXIT;
           END;
}
  END;

 PROCEDURE TEST_CN(var WORK_CN:CN);
  VAR I  : INTEGER;
      CH : STRING[1];
  BEGIN
        I:=0;
        WHILE (I<SizeOf(Work_Cn.PRIM_1)-1) DO
         BEGIN
              INC(I);
              CH:=WORK_CN.PRIM_1[I];
              IF NOT (CH[1] IN ['A'..'z','А'..'п','р'..'я',' ','.','-','0'..'9']) THEN
                 BEGIN
                      FillChar(WORK_CN.PRIM_1,SizeOf(WORK_CN.PRIM_1),0);
                      EXIT
                 END;
         END;
        i:=0;
        WHILE (I<SizeOf(Work_Cn.Count)-1) DO
         BEGIN
              INC(I);
              CH:=WORK_CN.Count[I];
              IF NOT (CH[1] IN ['A'..'z','А'..'п','р'..'я',' ','.','-','0'..'9']) THEN
                 BEGIN
                      FillChar(WORK_CN.Count,SizeOf(WORK_CN.Count),0);
                      EXIT
                 END;
         END;
        if (Work_CN.LIMIT_SUMMA>10e10) or (Work_CN.LIMIT_SUMMA<-1.00) then
            Work_CN.LIMIT_SUMMA:=0;
        if (Work_CN.Flow_SUMMA>10e10) or (Work_CN.Flow_SUMMA<-1.00) then
            Work_CN.Flow_SUMMA:=0;   
  END;
 PROCEDURE MAKE_PERSON_FROM_PERSON_B(VAR WORK_PERSON:PERSON;WORK_PERSON_B:PERSON_B);
  VAR I:INTEGER;
  BEGIN
            WORK_PERSON.TABNO           := WORK_PERSON_B.TABNO;
            WORK_PERSON.FIO             := WORK_PERSON_B.FIO;
            WORK_PERSON.GRUPPA          := WORK_PERSON_B.GRUPPA;
            WORK_PERSON.KATEGORIJA      := WORK_PERSON_B.KATEGORIJA;
            WORK_PERSON.DOLG            := WORK_PERSON_B.DOLG;
            WORK_PERSON.OKLAD           := WORK_PERSON_B.OKLAD;
            WORK_PERSON.WID_RABOTY      := WORK_PERSON_B.WID_RABOTY;
            WORK_PERSON.N_TEMY          := WORK_PERSON_B.N_TEMY;
            WORK_PERSON.MESTO_OSN_RABOTY:= WORK_PERSON_B.MESTO_OSN_RABOTY;
            WORK_PERSON.WID_OPLATY      := WORK_PERSON_B.WID_OPLATY;
            WORK_PERSON.MODE            := WORK_PERSON_B.MODE;
            WORK_PERSON.FROM            := WORK_PERSON_B.FROM;
            WORK_PERSON.PODOH           := WORK_PERSON_B.PODOH;
            WORK_PERSON.MALO            := WORK_PERSON_B.MALO;
            WORK_PERSON.PROFSOJUZ       := WORK_PERSON_B.PROFSOJUZ;
            WORK_PERSON.DAY             := WORK_PERSON_B.DAY;
            WORK_PERSON.MAIN            := WORK_PERSON_B.MAIN;
            WORK_PERSON.TABEL           := WORK_PERSON_B.TABEL;
            WORK_PERSON.HOLIDAY         := WORK_PERSON_B.HOLIDAY;
            WORK_PERSON.STATE           := WORK_PERSON_B.STATE;
            WORK_PERSON.AUTOMATIC       := WORK_PERSON_B.AUTOMATIC;
            WORK_PERSON.START_DAY       := WORK_PERSON_B.START_DAY;
            WORK_PERSON.PENS            := WORK_PERSON_B.PENS;
{           WORK_PERSON.RECALC          := 0;}
            WORK_PERSON.BANK            := 0;
            WORK_PERSON.ID              := 0;
            WORK_PERSON.Reserved        := 0;
        //    FOR I:=1 TO 8 DO WORK_PERSON.RESERVED[I]:=0;
  END;

 PROCEDURE MAKE_PERSON_FROM_PERSON_C(VAR WORK_PERSON:PERSON;WORK_PERSON_B:PERSON_C);
  VAR I:INTEGER;
  BEGIN
            FillChar(work_person,sizeOf(work_person),0);
            WORK_PERSON.TABNO           := WORK_PERSON_B.TABNO;
            WORK_PERSON.FIO             := WORK_PERSON_B.FIO;
            WORK_PERSON.GRUPPA          := WORK_PERSON_B.GRUPPA;
            WORK_PERSON.KATEGORIJA      := WORK_PERSON_B.KATEGORIJA;
            WORK_PERSON.DOLG            := WORK_PERSON_B.DOLG;
            WORK_PERSON.OKLAD           := WORK_PERSON_B.OKLAD;
            WORK_PERSON.WID_RABOTY      := WORK_PERSON_B.WID_RABOTY;
            WORK_PERSON.N_TEMY          := WORK_PERSON_B.N_TEMY;
            WORK_PERSON.MESTO_OSN_RABOTY:= WORK_PERSON_B.MESTO_OSN_RABOTY;
            WORK_PERSON.WID_OPLATY      := WORK_PERSON_B.WID_OPLATY;
            WORK_PERSON.MODE            := WORK_PERSON_B.MODE;
            WORK_PERSON.FROM            := WORK_PERSON_B.FROM;
            WORK_PERSON.PODOH           := WORK_PERSON_B.PODOH;
            WORK_PERSON.MALO            := WORK_PERSON_B.MALO;
            WORK_PERSON.PROFSOJUZ       := WORK_PERSON_B.PROFSOJUZ;
            WORK_PERSON.DAY             := WORK_PERSON_B.DAY;
            WORK_PERSON.MAIN            := WORK_PERSON_B.MAIN;
            WORK_PERSON.TABEL           := WORK_PERSON_B.TABEL;
            WORK_PERSON.HOLIDAY         := WORK_PERSON_B.HOLIDAY;
            WORK_PERSON.STATE           := WORK_PERSON_B.STATE;
            WORK_PERSON.AUTOMATIC       := WORK_PERSON_B.AUTOMATIC;
            WORK_PERSON.START_DAY       := WORK_PERSON_B.START_DAY;
            WORK_PERSON.PENS            := WORK_PERSON_B.PENS;
{            WORK_PERSON.RECALC          := 0;}
            WORK_PERSON.BANK            := 0;
            WORK_PERSON.NAL_CODE        := '';
            WORK_PERSON.ID              := 0;
            WORK_PERSON.Reserved        := 0;

//            FOR I:=1 TO 8 DO WORK_PERSON.RESERVED[I]:=0;
  END;

 PROCEDURE MAKE_PERSON_FROM_PERSON_E(VAR WORK_PERSON:PERSON;WORK_PERSON_E:PERSON_E);
  VAR I:INTEGER;
  BEGIN
            FillChar(work_person,sizeOf(work_person),0);
            WORK_PERSON.TABNO           := WORK_PERSON_E.TABNO;
            WORK_PERSON.FIO             := WORK_PERSON_E.FIO;
            WORK_PERSON.GRUPPA          := WORK_PERSON_E.GRUPPA;
            WORK_PERSON.KATEGORIJA      := WORK_PERSON_E.KATEGORIJA;
            WORK_PERSON.DOLG            := WORK_PERSON_E.DOLG;
            WORK_PERSON.OKLAD           := WORK_PERSON_E.OKLAD;
            WORK_PERSON.WID_RABOTY      := WORK_PERSON_E.WID_RABOTY;
            WORK_PERSON.N_TEMY          := WORK_PERSON_E.N_TEMY;
            WORK_PERSON.MESTO_OSN_RABOTY:= WORK_PERSON_E.MESTO_OSN_RABOTY;
            WORK_PERSON.WID_OPLATY      := WORK_PERSON_E.WID_OPLATY;
            WORK_PERSON.MODE            := WORK_PERSON_E.MODE;
            WORK_PERSON.FROM            := WORK_PERSON_E.FROM;
            WORK_PERSON.PODOH           := WORK_PERSON_E.PODOH;
            WORK_PERSON.MALO            := WORK_PERSON_E.MALO;
            WORK_PERSON.PROFSOJUZ       := WORK_PERSON_E.PROFSOJUZ;
            WORK_PERSON.DAY             := WORK_PERSON_E.DAY;
            WORK_PERSON.MAIN            := WORK_PERSON_E.MAIN;
            WORK_PERSON.TABEL           := WORK_PERSON_E.TABEL;
            WORK_PERSON.HOLIDAY         := WORK_PERSON_E.HOLIDAY;
            WORK_PERSON.STATE           := WORK_PERSON_E.STATE;
            WORK_PERSON.AUTOMATIC       := WORK_PERSON_E.AUTOMATIC;
            WORK_PERSON.START_DAY       := WORK_PERSON_E.START_DAY;
            WORK_PERSON.PENS            := WORK_PERSON_E.PENS;
{            WORK_PERSON.RECALC          := 0;}
            WORK_PERSON.BANK            := WORK_PERSON_E.BANK;
            WORK_PERSON.NAL_CODE        := WORK_PERSON_E.NAL_CODE;
            WORK_PERSON.ID              := WORK_PERSON_E.ID;
            WORK_PERSON.Reserved        := WORK_PERSON_E.Reserved;

//            FOR I:=1 TO 8 DO WORK_PERSON.RESERVED[I]:=0;
  END;


  PROCEDURE MAKE_CN_FROM_CN_C(VAR WORK_CN:CN;WORK_CN_C:CN_C;CURR_PERSON:PERSON_PTR);
     BEGIN
          WORK_CN.SHIFR        := WORK_CN_C.SHIFR;
          WORK_CN.KOD          := WORK_CN_C.KOD;
          WORK_CN.SUMMA        := WORK_CN_C.SUMMA;
          WORK_CN.PRIM         := WORK_CN_C.PRIM;
          WORK_CN.PRIM_1       := WORK_CN_C.PRIM_1;
          WORK_CN.DEJA_COUNTED := WORK_CN_C.DEJA_COUNTED;
          WORK_CN.FLOW_SUMMA   := WORK_CN_C.FLOW_SUMMA;
          WORK_CN.LIMIT_SUMMA  := WORK_CN_C.LIMIT_SUMMA;
          WORK_CN.AUTOMATIC    := WORK_CN_C.AUTOMATIC;
          WORK_CN.ID           := WORK_CN_C.ID;
          WORK_CN.COUNT        := GET_IST_NAME(CURR_PERSON^.GRUPPA);
     END;
  PROCEDURE MAKE_CN_FROM_CN_E(VAR WORK_CN:CN;WORK_CN_E:CN_E;CURR_PERSON:PERSON_PTR);
     BEGIN
          WORK_CN.SHIFR        := WORK_CN_E.SHIFR;
          WORK_CN.KOD          := WORK_CN_E.KOD;
          WORK_CN.SUMMA        := WORK_CN_E.SUMMA;
          WORK_CN.PRIM         := WORK_CN_E.PRIM;
          WORK_CN.PRIM_1       := WORK_CN_E.PRIM_1;
          WORK_CN.DEJA_COUNTED := WORK_CN_E.DEJA_COUNTED;
          WORK_CN.FLOW_SUMMA   := WORK_CN_E.FLOW_SUMMA;
          WORK_CN.LIMIT_SUMMA  := WORK_CN_E.LIMIT_SUMMA;
          WORK_CN.AUTOMATIC    := WORK_CN_E.AUTOMATIC;
          WORK_CN.ID           := WORK_CN_E.ID;
          WORK_CN.COUNT        := WORK_CN_E.COUNT;
     END;

  PROCEDURE MAKE_ADD_FROM_ADD_C(VAR WORK_ADD:ADD;WORK_ADD_C:ADD_C;CURR_PERSON:PERSON_PTR);
   BEGIN
         WORK_ADD.SHIFR      := WORK_ADD_C.SHIFR      ;
         WORK_ADD.PERIOD     := WORK_ADD_C.PERIOD     ;
         WORK_ADD.YEAR       := WORK_ADD_C.YEAR       ;
         WORK_ADD.SUMMA      := WORK_ADD_C.SUMMA      ;
         WORK_ADD.FMP        := WORK_ADD_C.FMP        ;
         WORK_ADD.FZP        := WORK_ADD_C.FZP        ;
         WORK_ADD.OTHER      := WORK_ADD_C.OTHER      ;
         WORK_ADD.VYPLACHENO := WORK_ADD_C.VYPLACHENO ;
         WORK_ADD.WHO        := WORK_ADD_C.WHO        ;
         WORK_ADD.COUNT      := GET_IST_NAME(CURR_PERSON^.GRUPPA);
   END;
  PROCEDURE MAKE_UD_FROM_UD_C(VAR WORK_UD:UD;WORK_UD_C:UD_C;CURR_PERSON:PERSON_PTR);
   BEGIN
        WORK_UD.SHIFR      := WORK_UD_C.SHIFR;
        WORK_UD.PERIOD     := WORK_UD_C.PERIOD;
        WORK_UD.YEAR       := WORK_UD_C.YEAR;
        WORK_UD.SUMMA      := WORK_UD_C.SUMMA;
        WORK_UD.VYPLACHENO := WORK_UD_C.VYPLACHENO;
        WORK_UD.WHO        := WORK_UD_C.WHO;
        WORK_UD.COUNT      := GET_IST_NAME(CURR_PERSON^.GRUPPA);
   END;
  PROCEDURE MAKE_UD_FROM_UD_E(VAR WORK_UD:UD;WORK_UD_E:UD_E;CURR_PERSON:PERSON_PTR);
   BEGIN
        WORK_UD.SHIFR      := WORK_UD_E.SHIFR;
        WORK_UD.PERIOD     := WORK_UD_E.PERIOD;
        WORK_UD.YEAR       := WORK_UD_E.YEAR;
        WORK_UD.SUMMA      := WORK_UD_E.SUMMA;
        WORK_UD.VYPLACHENO := WORK_UD_E.VYPLACHENO;
        WORK_UD.WHO        := WORK_UD_E.WHO;
        WORK_UD.COUNT      := WORK_UD_E.COUNT;
   END;

  PROCEDURE MAKE_ADD_FROM_ADD_D(VAR WORK_ADD:ADD;WORK_ADD_D:ADD_D;CURR_PERSON:PERSON_PTR);
   BEGIN
         WORK_ADD.SHIFR      := WORK_ADD_D.SHIFR      ;
         WORK_ADD.PERIOD     := WORK_ADD_D.PERIOD     ;
         WORK_ADD.YEAR       := WORK_ADD_D.YEAR       ;
         WORK_ADD.SUMMA      := WORK_ADD_D.SUMMA      ;
         WORK_ADD.FMP        := WORK_ADD_D.FMP        ;
         WORK_ADD.FZP        := WORK_ADD_D.FZP        ;
         WORK_ADD.OTHER      := WORK_ADD_D.OTHER      ;
         WORK_ADD.VYPLACHENO := WORK_ADD_D.VYPLACHENO ;
         WORK_ADD.WHO        := WORK_ADD_D.WHO        ;
         WORK_ADD.WORK_DAY   := ROUND(WORK_DAY(1,31,CURR_PERSON));
         WORK_ADD.WORK_CLOCK := 0;
         WORK_ADD.SHIFR_KAT  := CURR_PERSON^.KATEGORIJA;
         WORK_ADD.SHIFR_GRU  := CURR_PERSON^.GRUPPA   ;
         WORK_ADD.COUNT      := GET_IST_NAME(CURR_PERSON^.GRUPPA);
   END;
  PROCEDURE MAKE_ADD_FROM_ADD_E(VAR WORK_ADD:ADD;WORK_ADD_E:ADD_E;CURR_PERSON:PERSON_PTR);
   BEGIN
         
         WORK_ADD.SHIFR      := WORK_ADD_E.SHIFR      ;
         WORK_ADD.PERIOD     := WORK_ADD_E.PERIOD     ;
         WORK_ADD.YEAR       := WORK_ADD_E.YEAR       ;
         WORK_ADD.SUMMA      := WORK_ADD_E.SUMMA      ;
         WORK_ADD.FMP        := WORK_ADD_E.FMP        ;
         WORK_ADD.FZP        := WORK_ADD_E.FZP        ;
         WORK_ADD.OTHER      := WORK_ADD_E.OTHER      ;
         WORK_ADD.VYPLACHENO := WORK_ADD_E.VYPLACHENO ;
         WORK_ADD.WHO        := WORK_ADD_E.WHO        ;
         WORK_ADD.WORK_DAY   := ROUND(WORK_DAY(1,31,CURR_PERSON));
         WORK_ADD.WORK_CLOCK := WORK_ADD_E.WORK_CLOCK;
         WORK_ADD.SHIFR_KAT  := WORK_ADD_E.SHIFR_KAT;
         WORK_ADD.SHIFR_GRU  := WORK_ADD_E.SHIFR_GRU;
         WORK_ADD.COUNT      := WORK_ADD_E.COUNT;
   END;


     BEGIN
        NEED_EXIT:=FALSE;
        NEED_PERSON:=FALSE;
        CASE VERSION OF
         'B':BEGIN
                  GET_FROM_BUF(WORK_PERSON_B,SIZEOF(WORK_PERSON_B)-5*sizeOf(work_person_b.NEXT));
                  IF KZ<0 THEN
                     BEGIN
                           ShowMessage(' При чтении PERSON_B номер '+INTTOSTR(NUMBER));
                           EXIT;
                     END;
                  MAKE_PERSON_FROM_PERSON_B(WORK_PERSON,WORK_PERSON_B);
                  TEST_PERSON(WORK_PERSON,NUMBER,'B');
             END;
        'A','C':BEGIN
                  GET_FROM_BUF(WORK_PERSON_C,SIZEOF(WORK_PERSON_C)-5*sizeof(work_person_c.NEXT));
                  IF KZ<0 THEN
                     BEGIN
                           ShowMessage(' При чтении PERSON_B номер '+INTTOSTR(NUMBER));
                           EXIT;
                     END;
                  MAKE_PERSON_FROM_PERSON_C(WORK_PERSON,WORK_PERSON_C);
                  TEST_PERSON(WORK_PERSON,NUMBER,'C');
             END;
        'D','E':BEGIN
                  GET_FROM_BUF(WORK_PERSON_E,SIZEOF(WORK_PERSON_E)-5*sizeOf(work_person_e.NEXT));
                  IF KZ<0 THEN
                     BEGIN
                           ShowMessage(' При чтении PERSON_E номер '+INTTOSTR(NUMBER));
                           EXIT;
                     END;
                  MAKE_PERSON_FROM_PERSON_E(WORK_PERSON,WORK_PERSON_E);
                  TEST_PERSON(WORK_PERSON,NUMBER,'E');
                END;
         ELSE
             BEGIN
                 GET_FROM_BUF(WORK_PERSON,SIZEOF(WORK_PERSON)-5*sizeOf(work_person.NEXT));
                 www:=www;

                 IF KZ<0 THEN
                    BEGIN
                          ShowMessage('При чтении PERSON номер '+INTTOSTR(NUMBER));
                          EXIT;
                    END;
                 TEST_PERSON(WORK_PERSON,NUMBER,'F');
             END;
        END;
        IF ((MUST_FIND_PERSON) AND THIS_PERSON(@WORK_PERSON)) OR
            (NOT MUST_FIND_PERSON) THEN
           BEGIN
                IF SEARCH_ONLY_ONE_PERSON THEN NEED_EXIT:=TRUE;
                Work_Person.Fio:=DosToWin(Work_Person.Fio);
                Work_Person.Dolg:=DosToWin(Work_Person.Dolg);
                Work_Person.N_TEMY:=DosToWin(Work_Person.N_TEMY);
                SEARCH_ONLY_ONE_PERSON:=FALSE;
                NEED_PERSON:=TRUE;
                MAKE_PERSON(CURR_PERSON);
                CURR_PERSON^:=WORK_PERSON;
                IF (CURR_PERSON^.FIO<>WORK_PERSON.FIO) THEN
                   BEGIN
                        ShowMessage('При чтении документа не правильно создался работник '+ALLTRIM(WORK_PERSON.FIO));
                   END;
                if Curr_Person^.From=0 then Curr_Person^.From:=NSRV;
                WITH CURR_PERSON^ DO
                 BEGIN
                      NEXT:=NIL;
                      SOWM:=NIL;
                      ADD:=NIL;
                      UD:=NIL;
                      CN:=NIL;
                 END;
           END;
        GET_FROM_BUF(I_C,2);
        IF KZ<0 THEN
           BEGIN
                ShowMessage('При чтении к-ва совмещений для '+ALLTRIM(CURR_PERSON^.FIO));
                EXIT;
           END;
        IF (I_C<0) OR (I_C>35) THEN
           BEGIN
                ShowMessage('Неверное число совмещений '+INTTOSTR(I_C)+'. У '+ALLTRIM(CURR_PERSON^.FIO));
                exit;
           END;
        IF I_C>0 THEN FOR I:=1 TO I_C DO
           BEGIN
                GET_FROM_BUF(WORK_SOWM,SIZEOF(WORK_SOWM)-sizeOf(work_sowm.next));
                    IF KZ<0 THEN
                       BEGIN
                            ShowMessage('При чтении '+INTTOSTR(I)+'-го совмещения для '+ALLTRIM(CURR_PERSON^.FIO));
                            EXIT;
                       END;
                IF NEED_PERSON THEN
                   BEGIN
                        MAKE_SOWM(CURR_SOWM,CURR_PERSON);
                        CURR_SOWM^:=WORK_SOWM;
                        CURR_SOWM^.NEXT:=NIL;
                   END;
           END;
        GET_FROM_BUF(I_C,2);
        IF KZ<0 THEN
           BEGIN
                ShowMessage('При чтении к-ва начислений для '+ALLTRIM(CURR_PERSON^.FIO));
                EXIT;
           END;
        IF (I_C<0) OR (I_C>75) THEN
           BEGIN
                ShowMessage('Неверное число начислений '+INTTOSTR(I_C)+'. У '+ALLTRIM(CURR_PERSON^.FIO));
           END;
        IF I_C>0 THEN FOR I:=1 TO I_C DO
           BEGIN
        CASE VERSION OF
         'A'..'B':BEGIN
                GET_FROM_BUF(WORK_ADD_C,SIZEOF(WORK_ADD_C)-sizeOf(work_add_c.next));
                IF KZ<0 THEN
                   BEGIN
                         ShowMessage('При чтении '+INTTOSTR(I)+'-го начисления для '+ALLTRIM(CURR_PERSON^.FIO));
                         EXIT;
                   END;
                  MAKE_ADD_FROM_ADD_C(WORK_ADD,WORK_ADD_C,@WORK_PERSON);
             END;
         'C'..'D':BEGIN
                GET_FROM_BUF(WORK_ADD_D,SIZEOF(WORK_ADD_D)-sizeOf(work_add_d.next));
                IF KZ<0 THEN
                   BEGIN
                         ShowMessage('При чтении '+INTTOSTR(I)+'-го начисления для '+ALLTRIM(CURR_PERSON^.FIO));
                         EXIT;
                   END;
                  MAKE_ADD_FROM_ADD_D(WORK_ADD,WORK_ADD_D,@WORK_PERSON);
             END;
         'E':BEGIN
                GET_FROM_BUF(WORK_ADD_E,SIZEOF(WORK_ADD_E)-sizeOf(work_add_e.NEXT));
                IF KZ<0 THEN
                   BEGIN
                         ShowMessage('При чтении '+INTTOSTR(I)+'-го начисления для '+ALLTRIM(CURR_PERSON^.FIO));
                         EXIT;
                   END;
                  MAKE_ADD_FROM_ADD_E(WORK_ADD,WORK_ADD_E,@WORK_PERSON);
             END;
         ELSE
             BEGIN
                GET_FROM_BUF(WORK_ADD,SIZEOF(WORK_ADD)-sizeOf(work_add.next));
                IF KZ<0 THEN
                   BEGIN
                         ShowMessage('При чтении '+INTTOSTR(I)+'-го начисления для '+ALLTRIM(CURR_PERSON^.FIO));
                         EXIT;
                   END;
             END;
        END;
                IF NEED_PERSON THEN
                   BEGIN
                        MAKE_ADD(CURR_ADD,CURR_PERSON);
                        Work_Add.Count:=DosToWin(Work_Add.Count);
                        if work_add.shifr<>Pochas_Shifr then
                           Work_ADD.WORK_CLOCK:=0;
                        CURR_ADD^:=WORK_ADD;
                        CURR_ADD^.NEXT:=NIL;
                   END;
           END;
        GET_FROM_BUF(I_C,2);
        IF KZ<0 THEN
           BEGIN
                ShowMessage('При чтении к-ва удержаний для '+ALLTRIM(CURR_PERSON^.FIO));
                EXIT;
           END;
        IF (I_C<0) OR (I_C>105) THEN
           BEGIN
                ShowMessage('Неверное число удержаний '+INTTOSTR(I_C)+'. У '+ALLTRIM(CURR_PERSON^.FIO));
           END;
        IF I_C>0 THEN FOR I:=1 TO I_C DO
           BEGIN
        CASE VERSION OF
         'A'..'B': BEGIN
                GET_FROM_BUF(WORK_UD_C,SIZEOF(WORK_UD_C)-sizeof(work_ud_c.next));
                IF KZ<0 THEN
                   BEGIN
                         ShowMessage('При чтении '+INTTOSTR(I)+'-го удержания для '+ALLTRIM(CURR_PERSON^.FIO));
                         EXIT;
                   END;
                  MAKE_UD_FROM_UD_C(WORK_UD,WORK_UD_C,CURR_PERSON);
             END;
         'C'..'E': BEGIN
                GET_FROM_BUF(WORK_UD_E,SIZEOF(WORK_UD_E)-sizeof(work_ud_e.NEXT));
                IF KZ<0 THEN
                   BEGIN
                         ShowMessage('При чтении '+INTTOSTR(I)+'-го удержания для '+ALLTRIM(CURR_PERSON^.FIO));
                         EXIT;
                   END;
                  MAKE_UD_FROM_UD_E(WORK_UD,WORK_UD_E,CURR_PERSON);
             END;
         ELSE
             BEGIN
                GET_FROM_BUF(WORK_UD,SIZEOF(WORK_UD)-sizeOf(work_ud.NEXT));
                IF KZ<0 THEN
                   BEGIN
                         ShowMessage('При чтении '+INTTOSTR(I)+'-го удержания для '+ALLTRIM(CURR_PERSON^.FIO));
                         EXIT;
                   END;
             END;
        END;
                IF NEED_PERSON THEN
                   BEGIN
                        MAKE_UD(CURR_UD,CURR_PERSON);
                        Work_Ud.Count:=DosToWin(Work_Ud.Count);
                        CURR_UD^:=WORK_UD;
                        CURR_UD^.NEXT:=NIL;
                   END;
           END;
        GET_FROM_BUF(I_C,2);
        IF KZ<0 THEN
           BEGIN
                ShowMessage('При чтении к-ва CN для '+ALLTRIM(CURR_PERSON^.FIO));
                EXIT;
           END;
        IF (I_C<0) OR (I_C>25) THEN
           BEGIN
                ShowMessage('Неверное число строк постоянной информации '+INTTOSTR(I_C)+'. У '+ALLTRIM(CURR_PERSON^.FIO));
           END;
        IF I_C>0 THEN FOR I:=1 TO I_C DO
           BEGIN
        CASE VERSION OF
         'A'..'B':BEGIN
                GET_FROM_BUF(WORK_CN_C,SIZEOF(WORK_CN_C)-sizeOf(work_cn_c.NEXT));
                IF KZ<0 THEN
                   BEGIN
                         ShowMessage('При чтении '+INTTOSTR(I)+'-го CN для '+ALLTRIM(CURR_PERSON^.FIO));
                         EXIT;
                   END;
                  MAKE_CN_FROM_CN_C(WORK_CN,WORK_CN_C,CURR_PERSON);
             END;
         'C'..'E':BEGIN
                GET_FROM_BUF(WORK_CN_E,SIZEOF(WORK_CN_E)-sizeOf(work_cn_e.Next));
                IF KZ<0 THEN
                   BEGIN
                         ShowMessage('При чтении '+INTTOSTR(I)+'-го CN для '+ALLTRIM(CURR_PERSON^.FIO));
                         EXIT;
                   END;
                  MAKE_CN_FROM_CN_E(WORK_CN,WORK_CN_E,CURR_PERSON);
             END;
         ELSE
             BEGIN
                GET_FROM_BUF(WORK_CN,SIZEOF(WORK_CN)-sizeOf(work_cn.Next));
                IF KZ<0 THEN
                   BEGIN
                         ShowMessage('При чтении '+INTTOSTR(I)+'-го CN для '+ALLTRIM(CURR_PERSON^.FIO));
                         EXIT;
                   END;
                WORK_CN.Prim_1:=DosToWin(WORK_CN.Prim_1);
                WORK_CN.Count:=DosToWin(WORK_CN.Count);
                TEST_CN(Work_Cn);
             END;
        END;
                IF NEED_PERSON THEN
                   BEGIN
                        MAKE_CN(CURR_CN,CURR_PERSON);
                        CURR_CN^:=WORK_CN;
                        Curr_Cn^.PRIM_1:=dostowin(Curr_Cn^.Prim_1);
                        CURR_CN^.NEXT:=NIL;
                   END;
           END;
   END;
 PROCEDURE UNPACK_ALL_PERSON;
  VAR I,I_C,II,III:INTEGER;
      SC,LD,REC,C:REAL;
      BB:INTEGER;
  BEGIN
      WHILE GET_BUF_FROM_FILE DO
       BEGIN
            FOR I:=1 TO BLOCK_COUNT_PERSON DO
                BEGIN
                     KZ:=0;
                     UNPACK_PERSON(I);
                     iii:=count_person;
                     IF KZ<0 THEN
                        BEGIN
                             WHILE HEAD_PERSON<>NIL DO DEL_PERSON(HEAD_PERSON);
                             EXIT;
                        END;
                     IF NEED_EXIT THEN EXIT;
                END;
       END; { END OF WHILE }
  END;
 BEGIN
     KZ:=0;
     HEAD_PERSON:=NIL;
     TAIL_PERSON:=NIL;
{
     LOCK_NET_CORE;
     UNLOCK_NET_CORE;
     IF NEED_NET THEN LOCK_NET_CORE;
}

     AssignFile(INF,FNINF);
{     IF NOT NET_MODE  THEN}
        BEGIN
             FileMode:=fmShareDenyWrite;;
             {$I-}
             RESET(INF,1);
             {$I+}
             FileMode:= fmOpenReadWrite;   // По умолчанию
             KOD:=IORESULT;
             KZ:=0;
             IF KOD<>0 THEN
                BEGIN
                    CASE KOD OF
                     1 : SERR:='ФАЙЛ НЕ НАЙДЕН.';
                     3 : SERR:='МАРШРУТ НЕ НАЙДЕН';
                     4 : SERR:='МНОГО ОТКРЫТЫХ ФАЙЛОВ';
                     5 : SERR:='ЗАПРЕТ ДОСТУПА К ФАЙЛУ';
                     6 : SERR:='НЕКОРРЕКТНЫЙ КОД ДОСТУПА К ФАЙЛА';
                    ELSE
                     SERR:='CМОТРИТЕ РУКОВОДСТВО.KОД='+IntToStr(Kod);
                   END;
                   ShowMessage('ОШИБКА ЧТЕНИЯ ФАЙЛА='+FNINF+' '+SErr);
                   KZ:=-1;
                EXIT
               END
        END;
(*
               ELSE
   { Сетевая обработка }
        BEGIN
             NEED_UNLOCK:=FALSE;
             IF LOCK_FLAG(TRUE,DEV_FLAG) THEN NEED_UNLOCK:=TRUE;
             RESET_NET(INF,1,FNINF);
             IF KZ<0 THEN
                BEGIN
                     IF NEED_UNLOCK THEN UNLOCK_FLAG(DEV_FLAG);
                     EXIT;
                END;
        END;
*)
     TOTAL_BLOCK_COUNT_PERSON:=0;
{     BLOCKREAD_NET(INF,S,1,RESULT); }
{
     BLOCKREAD(INF,S,1,RESULTG);
     IF S='B' THEN VERSION:='B'
              ELSE
     IF S='C' THEN VERSION:='C'
              ELSE
     IF S='D' THEN VERSION:='D'
              ELSE
     IF S='E' THEN VERSION:='E'
              ELSE VERSION:='A';
}
     version:=getVersion[1];
     UNPACK_ALL_PERSON;
     IF (TOTAL_BLOCK_COUNT_PERSON<>COUNT_PERSON) AND (NOT MUST_FIND_PERSON) THEN
        BEGIN
             ShowMessage('В '+ALLTRIM(MONTH[NMES])+' в '+ALLTRIM(NAME_SERV(NSRV))+' на диске было '+
                        IntToStr(TOTAL_BLOCK_COUNT_PERSON)+' сотрудников, сгенерировано '+
                        IntToStr(COUNT_PERSON));
        END;
     if (version>'E') then
        begin
            if count_person<>versionRec.nmbOfPerson then
               raise Exception.Create('Corrupted data file '+trim(fninf)+'. Must be '+intToStr(versionRec.nmbOfPerson)+'. But realy readed '+intToStr(count_person)+' records');
            CRC32ReadedFromFile:=podrcrc32;
//            if CRC32ReadedFromFile<>versionRec.crc32 then
//               raise Exception.Create('Corrupted data file '+trim(fninf)+'. Wrong checksum');
        end;


     MUST_FIND_PERSON       :=FALSE;
     SEARCH_ONLY_ONE_PERSON :=FALSE;
     TOTAL_BLOCK_COUNT_PERSON:=Count_Person;
  //   moveAllPersonToList;

{
     IF (BUH^.SHIFR<0) OR (BUH^.SHIFR>15) THEN
         BEGIN
              ERROR('Неверный номер бухгалтера в GETINF перед MARK_GETINF '+MY_STR_INT(BUH^.SHIFR)+'++');
              HALT;
         END;
}
     CloseFile(INF);
{     IF NEED_UNLOCK THEN UNLOCK_FLAG(DEV_FLAG);}
{     IF NEED_NET THEN MARK_GETINF; }
 END;


     PROCEDURE GETINF(NEED_NET:BOOLEAN);
      VAR F   : FILE;
          I   : ARRAY[1..3] OF BYTE;
          J   : INTEGER;
          KOD : INTEGER;
          S   : STRING;
          NEED_UNLOCK : BOOLEAN;
          Mes :string;
          Count_Person_In_Sql,Cnt_Person:Integer;
      BEGIN
          KZ:=0;

//          if DirectoryExists('E:\Projects\ZARPLATA\VUGU\GKH\ROOT\DATA\DECEMBER') then
//             kz:=1;

//          FNINF:='E:\Projects\ZARPLATA\VUGU\GKH\ROOT\DATA\DECEMBER\F0112001.dat';
          IF NOT FILEEXISTS(FNINF) THEN
             BEGIN
                  ShowMessage('Отсутствует файл '+FNINF);
                  KZ:=-1;
                  EXIT;
             END;
          if (NMES=FLOW_MONTH) and (UseIOSQLMonitorLevel>1) then
             begin
                 if not waitForFreeFile(NSRV) then
                    begin
                         ShowMessage('Не удается прочитать файл подразделения '+IntToStr(NSRV)+'. Файл заблокирован другим процессом');
                         if YesNo('Завершить работу программы?') then
                            Halt;
                    end;
                 lockServFile(NSRV);
             end;
          GETINF_BLOCK(NEED_NET);
          if (NMES=FLOW_MONTH)  and (UseIOSQLMonitorLevel>1)then
             unLockServFile(NSRV);
          if NMES=FLOW_MONTH then
          if not NameServList.IS_CANBEEMPTY(NSRV) then
          if COUNT_PERSON=0 then
             begin
                  ShowMessage('Пустое подразделение '+IntToStr(NSRV)+', а не должно быть пустым');
             end;
          MUST_FIND_PERSON        := FALSE;  {СБРОСИТЬ   ФЛАГ ДЛЯ ПРОГРАММЫ GETINF}
          SEARCH_ONLY_ONE_PERSON  := FALSE;  {НЕ НАДО ИСКАТЬ ОДНОГО РАБОТНИКА ПО УСЛОВИЮ}
          TestDuplPodr('при чтении');   // Проверка задвоенных начислений
          if NMES=FLOW_MONTH then
             CRC32Ori:=PodrCRC32
          else
             CRC32Ori:=0;
          putNSRVFeaturesToSQLAfterGetInf;

          if NeedTestGetPutInf then
          if not CompareNSRV(Mes) then
             begin
                  if YesNo('Файл '+trim(name_serv(nsrv))+' за '+GetMonthRus(Nmes)+' '+IntToStr(CURRYEAR)+' не соотвествует раннее записанному.'+^M+trim(Mes)+^M+' Прекратить работу?') then
                     Halt;
             end;
          cnt_Person:=Count_Person;

          // Сверить с SQL базой

          if needIOSQL then
          if NMES=FLOW_MONTH then
          if CURRYEAR=WORK_YEAR_VAL then
          if (Cnt_Person=0) then
             begin
                  Count_Person_In_Sql:=getCountPersonInSqlCurr(NMES,CURRYEAR);
                  if Count_Person_In_Sql>0 then
                     begin
                          LDEL_PERSON;
                          getInfSqlCurr(NMES,CURRYEAR);
                     end;
             end;
      END;











{ ============================================== }
{ Блок программ проверки корректности информации }
{ ============================================== }
   PROCEDURE TEST_AND_DEL_SOWM(CURR_PERSON:PERSON_PTR);
    VAR DONE:BOOLEAN;
        CURR_SOWM:SOWM_PTR;
   BEGIN
        REPEAT
              DONE:=TRUE;
              CURR_SOWM:=CURR_PERSON^.SOWM;
              WHILE (CURR_SOWM<>NIL) AND (DONE) DO
               IF (CURR_SOWM^.WHERE<1) OR (CURR_SOWM^.WHERE>SHIFR_SERV(MAX_COUNT_PODRAZD)) OR
                     (CURR_PERSON^.WID_RABOTY<>OSN_WID_RABOTY) THEN
                     BEGIN
                          DEL_SOWM(CURR_SOWM,CURR_PERSON);
                          DONE:=FALSE;
                     END
                                                              ELSE
                     CURR_SOWM:=CURR_SOWM^.NEXT;
        UNTIL DONE;
   END;
   PROCEDURE TEST_AND_DEL_ADD(CURR_PERSON:PERSON_PTR);
    VAR DONE:BOOLEAN;
        CURR_ADD:ADD_PTR;
   BEGIN
        REPEAT
              DONE:=TRUE;
              CURR_ADD:=CURR_PERSON^.ADD;
              WHILE (CURR_ADD<>NIL) AND (DONE) DO
               IF NOT ((CURR_ADD^.SHIFR>0) and (CURR_ADD^.Shifr<=TOTAL_UD_SHIFR)) OR
                  NOT (CURR_ADD^.PERIOD IN [1..12])            OR
                  NOT (CURR_ADD^.YEAR   IN [0..30])            OR
                      (ABS (CURR_ADD^.SUMMA)>1E17)         THEN
                     BEGIN
                          DEL_ADD(CURR_ADD,CURR_PERSON);
                          DONE:=FALSE;
                     END
                                                              ELSE
                     CURR_ADD:=CURR_ADD^.NEXT;
        UNTIL DONE;
   END;
   PROCEDURE TEST_AND_DEL_UD(CURR_PERSON:PERSON_PTR);
    VAR DONE:BOOLEAN;
        CURR_UD:UD_PTR;
   BEGIN
        REPEAT
              DONE:=TRUE;
              CURR_UD:=CURR_PERSON^.UD;
              WHILE (CURR_UD<>NIL) AND (DONE) DO
               IF NOT ((CURR_UD^.SHIFR>0) AND (CURR_UD^.SHIFR<=MAXSHIFR)) OR
                  NOT (CURR_UD^.PERIOD IN [1..12])          OR
                  NOT (CURR_UD^.YEAR IN [0..30])            OR
                      (ABS (CURR_UD^.SUMMA)>1E17)         THEN
                     BEGIN
                          DEL_UD(CURR_UD,CURR_PERSON);
                          DONE:=FALSE;
                     END
                                                              ELSE
                     CURR_UD:=CURR_UD^.NEXT;
        UNTIL DONE;
   END;
   PROCEDURE TEST_AND_DEL_CN(CURR_PERSON:PERSON_PTR);
    VAR DONE:BOOLEAN;
        CURR_CN:CN_PTR;
   BEGIN
        REPEAT
              DONE:=TRUE;
              CURR_CN:=CURR_PERSON^.CN;
              WHILE (CURR_CN<>NIL) AND (DONE) DO
               IF (CURR_CN^.SHIFR<=0) THEN
                     BEGIN
                          DEL_CN(CURR_CN,CURR_PERSON);
                          DONE:=FALSE;
                     END
                                                              ELSE
                     CURR_CN:=CURR_CN^.NEXT;
        UNTIL DONE;
   END;


PROCEDURE PUTINF;
 VAR BLOCK_COUNT_PERSON:INTEGER;
     S:CHAR;
     S1:STRING;
     FNINF_BAK : STRING;
     FLAG_SHOW,DONE : BOOLEAN;
     KOD:WORD;
     INF_BAK:FILE;
     FileSize_Old,FileSize_New : integer;
     InfByte : File of byte;
     EscPressed   : Boolean;
     TmpFirstModeCurr : Boolean;
     NmbOfAttemptCurr : Integer;
     FNINFSAV     : string;
     Finished     : Boolean;
     i_attempt    : Integer;
     FNameTmp     : string;
     RewriteExecuted:boolean;
     Zero         : Word;
     testedMOR    : integer;

  procedure FirstRewrite;
   procedure fillPrefix;
    var i:integer;
        fn:string;
    begin
         move(versionSignature,versionRec.fraza,sizeOf(versionRec.fraza));
         versionRec.versionNo[1]:='F';
         versionRec.versionNo[2]:=' ';
         versionRec.crc32:=PodrCRC32;
         versionRec.nmbOfPerson:=count_person;
         versionRec.month:=nmes;
         versionRec.year:=CURRYEAR;
         versionRec.shifrpod:=nsrv;
         fillChar(versionRec.fname,ord(' '),sizeOf(versionRec.fname));
         fn:=ExtractFileName(fninf);
         for i:=1 to length(fn) do
             versionRec.fname[i]:=fn[i];
    end;
   begin
        ReWriteExecuted:=True;
        {$I-}
        REWRITE_NET(INF,1,FNINF);
        {$I+}
        KZ:=0;
        IF IORESULT<>0 THEN
           BEGIN
                KZ:=IORESULT;
                ShowMessage('ОШИБКА ЗАПИСИ ФАЙЛА='+FNINF+' КОД='+IntToStr(KZ));
                KZ:=-1;
                EXIT
           END;
//        S:='E';
//        BLOCKWRITE_NET(INF,S,1,RESULTIO);
        fillPrefix;
        BLOCKWRITE_NET(INF,versionRec,sizeOf(versionRec),RESULTIO);
        if resultio<>sizeOf(versionRec) then
           raise Exception.Create('Error during writing prefix to file '+fninf)

   end;
  PROCEDURE PUT_TO_BUF(VAR P;SIZE:INTEGER);
   VAR PP:ARRAY[1..PERSON_SIZE] OF BYTE ABSOLUTE P;
       I:INTEGER;
   BEGIN
       IF SIZE<=0 THEN EXIT;
       FOR I:=1 TO SIZE DO
           BEGIN
                INC(IO_BUF_PTR);
                IO_BUF^[IO_BUF_PTR]:=PP[I];
           END;
   END;
  PROCEDURE INIT_IO_BUF;
   BEGIN
        IO_BUF_PTR:=LOW_IO_BUF_PTR;
        BLOCK_COUNT_PERSON:=0;
   END;
  PROCEDURE PUT_BUF_TO_FILE;
   VAR I:INTEGER;
       DONE:BOOLEAN;
       KOD:WORD;
   BEGIN
        try
            if not RewriteExecuted then
               begin
                    FirstRewrite;
                    if kz<0 then Exit;
               end;
            BLOCKWRITE_NET(INF,IO_BUF_PTR,2,RESULTIO);
            IO_BUF^[1]:=LO(BLOCK_COUNT_PERSON);
            IO_BUF^[2]:=HI(BLOCK_COUNT_PERSON);
            BLOCKWRITE_NET(INF,IO_BUF^,IO_BUF_PTR,RESULTIO);
            INIT_IO_BUF;
        except
//         else
        on E: Exception do
            begin
                 if DebugMemoryCorruption then
                    begin
                         if YesNo('Ошибка записи блока в файл '+FNINF+' Сообщение '+E.Message+^M+'. Выйти из программы?') then
                            Halt;
                    end;

            end;
        end;
   END;
  PROCEDURE PUT_REST_BUF;
   VAR I:INTEGER;
       DONE:BOOLEAN;
       KOD:WORD;
   BEGIN
        try
            IF IO_BUF_PTR>LOW_IO_BUF_PTR THEN
               begin
                    PUT_BUF_TO_FILE;
                    I:=0;
                    BLOCKWRITE_NET(INF,I,2,RESULTIO);
               end;
        except
        on E: Exception do
            begin
                 if DebugMemoryCorruption then
                    begin
                         if YesNo('Ошибка записи последнего блока в файл '+FNINF+' Сообщение '+E.Message+^M+'. Выйти из программы?') then
                            Halt;
                    end;

            end;
        end;

   END;
{
  PROCEDURE TEST_MAY_BE_PUT(PUTTED_SIZE_PERSON:WORD);
    BEGIN
         IF (IO_BUF_PTR+PUTTED_SIZE_PERSON)>UP_IO_BUF_PTR THEN PUT_BUF_TO_FILE;
    END;
}
  PROCEDURE TEST_MAY_BE_PUT;
    BEGIN
         IF IO_BUF_PTR>UP_IO_BUF_PTR THEN PUT_BUF_TO_FILE;
    END;

  FUNCTION GET_SIZE_PERSON(CURR_PERSON:PERSON_PTR):WORD;
    VAR
        I,I_C     : INTEGER;
        CURR_ADD  : ADD_PTR;
        CURR_UD   : UD_PTR;
        CURR_CN   : CN_PTR;
        CURR_SOWM : SOWM_PTR;
        RETVAL    : WORD;
  BEGIN
        RetVal := 0;
        RetVal := RetVal+SIZEOF(CURR_PERSON^)-5*sizeOf(curr_person^.NEXT);
        RetVal := RetVal+2;
        I_C:=COUNT_SOWM(CURR_PERSON);
        IF I_C<=0 THEN I_C:=0;
        RetVal:=RetVal+2;
        CURR_SOWM:=CURR_PERSON^.SOWM;
        WHILE CURR_SOWM<>NIL DO
           BEGIN
                 RetVal:=RetVal+SIZEOF(CURR_SOWM^)-sizeOf(curr_sowm^.NEXT);
                 CURR_SOWM:=CURR_SOWM^.NEXT;
           END;
        TEST_AND_DEL_ADD(CURR_PERSON);
        I_C:=COUNT_ADD(CURR_PERSON);
        IF I_C<=0 THEN I_C:=0;
        RetVal:=RetVal+2;
        CURR_ADD:=CURR_PERSON^.ADD;
        WHILE CURR_ADD<>NIL DO
           BEGIN
                RetVal:=RetVal+SIZEOF(CURR_ADD^)-sizeOf(curr_add^.NEXT);
                CURR_ADD:=CURR_ADD^.NEXT;
           END;
        TEST_AND_DEL_UD(CURR_PERSON);
        I_C:=COUNT_UD(CURR_PERSON);
        IF I_C<=0 THEN I_C:=0;
        RetVal:=RetVal+2;
        CURR_UD:=CURR_PERSON^.UD;
        WHILE CURR_UD<>NIL DO
           BEGIN
                RetVal:=RetVal+SIZEOF(CURR_UD^)-sizeOf(curr_ud^.next);
                CURR_UD:=CURR_UD^.NEXT;
           END;
        TEST_AND_DEL_CN(CURR_PERSON);
        I_C:=COUNT_CN(CURR_PERSON);
        IF I_C<=0 THEN I_C:=0;
        RetVal:=RetVal+2;
        CURR_CN:=CURR_PERSON^.CN;
        WHILE CURR_CN<>NIL DO
           BEGIN
                RetVal:=RetVal+SIZEOF(CURR_CN^)-sizeOf(curr_cn^.next);
                CURR_CN:=CURR_CN^.NEXT;
           END;
        GET_SIZE_PERSON:=RETVAL;
   END;
  PROCEDURE PACK_PERSON(CURR_PERSON:PERSON_PTR);
    VAR
        I,I_C,L:INTEGER;
        CURR_ADD:ADD_PTR;
        CURR_UD :UD_PTR;
        CURR_CN :CN_PTR;
        CURR_SOWM:SOWM_PTR;
  BEGIN
        PUT_TO_BUF(CURR_PERSON^,SIZEOF(CURR_PERSON^)-5*sizeOf(curr_person^.NEXT));
        TEST_AND_DEL_SOWM(CURR_PERSON);
        I_C:=COUNT_SOWM(CURR_PERSON);
        IF I_C<=0 THEN I_C:=0;
        PUT_TO_BUF(I_C,2);
        CURR_SOWM:=CURR_PERSON^.SOWM;
        WHILE CURR_SOWM<>NIL DO
           BEGIN
                 PUT_TO_BUF(CURR_SOWM^,SIZEOF(CURR_SOWM^)-sizeOf(curr_sowm^.next));
                 CURR_SOWM:=CURR_SOWM^.NEXT;
           END;
        TEST_AND_DEL_ADD(CURR_PERSON);
        I_C:=COUNT_ADD(CURR_PERSON);
        IF I_C<=0 THEN I_C:=0;
        PUT_TO_BUF(I_C,2);
        CURR_ADD:=CURR_PERSON^.ADD;
        WHILE CURR_ADD<>NIL DO
           BEGIN
                L:=ord(Curr_Add^.Count[0]);
                if ((L<0) or (L>SizeOf(Curr_Add^.Count)-1)) then L:=SizeOf(Curr_Add^.Count)-1;
                if L<SizeOf(Curr_Add^.Count)-1 then for i:=L+1 to SizeOf(Curr_Add^.Count)-1 do Curr_add^.Count[i]:=' ';
                Curr_Add^.Count:=WinToDos(Curr_Add^.Count);
                PUT_TO_BUF(CURR_ADD^,SIZEOF(CURR_ADD^)-sizeOf(curr_add^.next));
                Curr_Add^.Count:=DosToWin(Curr_Add^.Count);
                CURR_ADD:=CURR_ADD^.NEXT;
           END;
        TEST_AND_DEL_UD(CURR_PERSON);
        I_C:=COUNT_UD(CURR_PERSON);
        IF I_C<=0 THEN I_C:=0;
        PUT_TO_BUF(I_C,2);
        CURR_UD:=CURR_PERSON^.UD;
        WHILE CURR_UD<>NIL DO
           BEGIN
                L:=ord(Curr_Ud^.Count[0]);
                if ((L<0) or (L>SizeOf(Curr_Ud^.Count)-1)) then L:=SizeOf(Curr_Ud^.Count)-1;
                if L<SizeOf(Curr_Ud^.Count)-1 then for i:=L+1 to SizeOf(Curr_Ud^.Count)-1 do Curr_Ud^.Count[i]:=' ';
                Curr_Ud^.Count:=WinToDos(Curr_Ud^.Count);
                PUT_TO_BUF(CURR_UD^,SIZEOF(CURR_UD^)-sizeOf(curr_ud^.next));
                Curr_Ud^.Count:=DosToWin(Curr_Ud^.Count);
                CURR_UD:=CURR_UD^.NEXT;
           END;
        TEST_AND_DEL_CN(CURR_PERSON);
        I_C:=COUNT_CN(CURR_PERSON);
        IF I_C<=0 THEN I_C:=0;
        PUT_TO_BUF(I_C,2);
        CURR_CN:=CURR_PERSON^.CN;
        WHILE CURR_CN<>NIL DO
           BEGIN
                L:=ord(Curr_Cn^.PRIM_1[0]);
                if ((L<0) or (L>SizeOf(Curr_Cn^.PRIM_1)-1)) then L:=SizeOf(Curr_Cn^.PRIM_1)-1;
                if L<SizeOf(Curr_CN^.Prim_1)-1 then for i:=L+1 to SizeOf(Curr_CN^.PRIM_1)-1 do Curr_Cn^.PRIM_1[i]:=' ';
                Curr_cn^.PRIM_1:=WinToDos(Curr_cn^.PRIM_1);
                PUT_TO_BUF(CURR_CN^,SIZEOF(CURR_CN^)-sizeof(curr_cn^.next));
                Curr_cn^.PRIM_1:=DosToWin(Curr_cn^.PRIM_1);
                CURR_CN:=CURR_CN^.NEXT;
           END;
   END;
 PROCEDURE PACK_ALL_PERSON;
  VAR
      CURR_PERSON:PERSON_PTR;
      SC,LD,REC,C:REAL;
      BB:INTEGER;
      II,L,I:INTEGER;
      CH:string[1];
  BEGIN
      INIT_IO_BUF;
      CURR_PERSON:=HEAD_PERSON;
      WHILE (CURR_PERSON<>NIL) DO
         BEGIN
              IF CURR_PERSON^.TABNO>0 THEN
                 BEGIN
                      Curr_Person^.FIO    := wintodos(Curr_Person^.FIO);
                      Curr_Person^.Dolg   := wintodos(Curr_Person^.Dolg);
                      Curr_Person^.N_Temy := wintodos(Curr_Person^.N_Temy);
                      I:=0;
                      L:=ord(Curr_PERSON^.FIO[0]);
                      if ((L<0) or (L>SizeOf(Curr_PERSON^.FIO[0])-1)) then L:=SizeOf(Curr_PERSON^.FIO[0])-1;
                      if L<SizeOf(Curr_PERSON^.FIO[0])-1 then for i:=L+1 to SizeOf(Curr_PERSON^.FIO[0])-1 do Curr_Person^.FIO[i]:=' ';
                      L:=ord(Curr_PERSON^.DOLG[0]);
                      if ((L<0) or (L>SizeOf(Curr_PERSON^.DOLG)-1)) then L:=SizeOf(Curr_PERSON^.DOLG)-1;
                      if L<SizeOf(Curr_PERSON^.DOLG)-1 then for i:=L+1 to SizeOf(Curr_PERSON^.DOLG)-1 do Curr_Person^.Dolg[i]:=' ';
                      L:=ord(Curr_PERSON^.N_Temy[0]);
                      if ((L<0) or (L>SizeOf(Curr_PERSON^.N_Temy)-1)) then L:=SizeOf(Curr_PERSON^.N_Temy)-1;
                      if L<SizeOf(Curr_PERSON^.N_TEMY)-1 then for i:=L+1 to SizeOf(Curr_PERSON^.N_Temy)-1 do Curr_Person^.N_Temy[i]:=' ';
                      L:=ord(Curr_PERSON^.Fio[0]);
                      if (l>sizeOf(Curr_PERSON^.FIO)) then
                         l:=sizeOf(Curr_PERSON^.FIO);

                      i:=0;
                      WHILE (I<l) DO
                       BEGIN
                            INC(I);
                            CH:=DOSTOWIN(Curr_Person^.FIO[I]);
                            IF NOT (CH[1] IN ['A'..'z','А'..'я',' ','.','-','Ї','ї','Є','є','''','`','І','і','ё','Ё']) THEN
                               BEGIN
                                    ShowMessage('PUTINF Не верная фамилия у работника . Версия '+VERSion+' FIO='+DosToWin(Curr_Person^.FIO));
                                    ShowMessage('Ошибка с адреса '+INTTOSTR(IO_BUF_PTR_OLD));
             {                      PRINT_BUF_HEX(WORK_PERSON,SIZEOF(WORK_PERSON)-20);}
             {                      EXIT}
                               END;
                       END;

                      INC(BLOCK_COUNT_PERSON);
                      PACK_PERSON(CURR_PERSON);
                      Curr_Person^.FIO    := DosToWin(Curr_Person^.FIO);
                      Curr_Person^.Dolg   := DosToWin(Curr_Person^.Dolg);
                      Curr_Person^.N_Temy := DosToWin(Curr_Person^.N_Temy);

                     TEST_MAY_BE_PUT;
                 END;
              CURR_PERSON:=CURR_PERSON^.NEXT;
         END;
      PUT_REST_BUF;
  END;
 BEGIN
     IF NMES<>FLOW_MONTH THEN
        begin
{           error('Изменения можно вносить только за текущий месяц');}
            exit;
        end;

     IF WORK_YEAR_VAL<>CURRYEAR THEN
        BEGIN
             Exit;
        END;
     if SystemCrash then
        begin
             if not YesNo('Произошла ошибка в работе программы'+^M+'Вы уверены в необходимости сохранения возможно некорректных данных подразделения?') then
                Exit;
        end;
     if not testFninf then
        begin
             Exit;
        end;
     testedMOR:=getMORForPutInf;
//     showMessage('MOR='+IntToStr(testedMOR));
     if (testedMOR>0) then
     if (testedMOR<>NSRV) then
     if not YesNo('Произошла ошибка в работе программы'+^M
        +'Попытка сохранить подразделение '+intToStr(testedMOR)+' в подразделение '+intToStr(NSRV)+^M
        +'Вы уверены в необходимости сохранения возможно некорректных данных подразделения?') then
        Exit;

{


     IF (NOT BUH^.MAY_BE_PUT(NSRV)) AND (NOT MAY_ALL_CORRECT) THEN
        BEGIN
             ERROR('Вам разрешен для '+ALLTRIM(NAME_SERV(NSRV))+' только просмотр');
             WHILE(HEAD_PERSON<>NIL) DO DEL_PERSON(HEAD_PERSON);
             EXIT;
        END;
}
     if isSVDN then
     if isForbiddenPodrWrite(NSRV) then
        Exit;
     // записать в SQL БД
     manualSave:=False;
     if needIOSQL then
        putInfSqlCurr;


     if NeedTestAddDuplicates then
        TestDuplPodr('при записи');

     if ((UseIOSQLMonitorLevel=1) or (UseIOSQLMonitorLevel=2)) then   
     if ((COUNT_PERSON=0)and (not (NameServList.IS_CANBEEMPTY(NSRV)))) then
        begin
             ShowMessage('Файл для '+TRIM(Name_Serv(NSRV))+' не может быть пустым. А если может то установить  пометку в справочник подразделений');
             Exit;
        end;

     TmpFirstModeCurr:=TmpFirstMode;
     KZ:=0;
     FileSize_Old:=0;
     FileSize_New:=0;
     RewriteExecuted:=False;
     FNINFSAV:=FNINF;
     if NSRV=118 then
        FileSize_New:=0;
     if TmpFirstModeCurr then
        begin
             FNINFSAV:=FNINF;
             FNameTmp:=MKFLNM_TMP_SAVE(EscPressed);
             if not EscPressed then
                begin
                     TmpFirstModeCurr:=True;
                     FNINF:=FNameTmp;
                end
             else
                TmpFirstModeCurr:=False;
        end;



     IF FNINF<>'TEMP.TMP' THEN
     IF FILEEXIST(FNINFSAV)  THEN
        BEGIN
          MKFLNM_BAK_FOR_WRITE(FNINF_BAK);
          IF FILEEXIST(FNINF_BAK) THEN
             BEGIN
                  ASSIGN(INF_BAK,FNINF_BAK);
                  ERASE_NET(INF_BAK,FNINF_BAK);
             END;
          AssignFile(InfByte,FNINFSAV);
          FileMode:=fmShareDenyWrite;
          Reset(InfByte);
          FileMode:=fmOpenReadWrite;
          FileSize_Old:=FileSize(InfByte);
          CloseFile(InfByte);
          if TmpFirstModeCurr then
             CopyFileByWindows(FNINFSAV,FNINF_BAK)
          else
              begin
                   AssignFile(Inf,FNINFSAV);
                   RENAME_NET(INF,FNINF_BAK);
              end;
        END;

{     IF HIMEMFLAG THEN NEW(IO_BUF);}
{     LOCK_NET_CORE;      }
(*
     IF NOT START_MARK_PUTINF THEN
        BEGIN
              UNLOCK_NET_CORE;
{              IF HIMEMFLAG THEN DISPOSE(IO_BUF);}
              EXIT
                  ASSIGN(INF_BAK,FNINF_BAK);
                  ERASE_NET(INF_BAK,FNINF_BAK);
             END;
     //     IF SAFE THEN
             BEGIN
                  AssignFile(InfByte,FNINF);
                  Reset(InfByte);
                  FileSize_Old:=FileSize(InfByte);
                  CloseFile(InfByte);
                  AssignFile(Inf,FNINF);
                  RENAME_NET(INF,FNINF_BAK);
        END;
*)


     NmbOfAttemptCurr:=1;
     if TmpFirstModeCurr then
        NmbOfAttemptCurr:=NmbOfAttempt;
     finished:=false;
     ReWriteExecuted:=False;
     for i_attempt:=1 to NmbOfAttemptCurr do
         begin
              try
              ASSIGN(INF,FNINF);
(*
              {$I-}
              REWRITE_NET(INF,1,FNINF);
              {$I+}
              KZ:=0;
              IF IORESULT<>0 THEN
                 BEGIN
                      KZ:=IORESULT;
                      ShowMessage('ОШИБКА ЗАПИСИ ФАЙЛА='+FNINF+' КОД='+IntToStr(KZ));
                      KZ:=-1;
                      EXIT
                 END;
              S:='E';
              BLOCKWRITE_NET(INF,S,1,RESULTIO);
*)
              PACK_ALL_PERSON;
              DONE:=FALSE;
              if not RewriteExecuted then
                 begin
                      FirstRewrite;
                      if kz<0 then
                         Exit;
                      // Записать к-во сотр - 0
                      Zero:=0;
                      BLOCKWRITE_NET(INF,Zero,2,RESULTIO);

                 end;
              {$I+}
              CloseFile(INF);
              {$I-}
              if IOResult<>0 then
                 begin
                      ShowMessage('Ошибка '+IntToStr(IOResult)+' файл '+fninf);
                 end;
              except
                on E:Exception do
                 if DebugMemoryCorruption then
                    begin
    //                     if YesNo('Ошибка записи в файл '+FNINF+' Сообщение '+E.Message+^M+' Выйти из программы?') then
                         ShowMessage('Ошибка записи в файл '+FNINF+' Сообщение '+E.Message+' Программа будет завершена.');
                            Halt;
                    end;
              end;
          (*
              AssignFile(InfByte,FNINF);
              Reset(InfByte);
              FileSize_New:=FileSize(InfByte);
              CloseFile(InfByte);
          *)
              FileSize_New:=getFileSize(FNINF);
              if (((FileSize_New>10) and (COUNT_PERSON>0))
                  or (COUNT_PERSON=0) and NameServList.is_canbeempty(NSRV)) then
                 begin
                      Finished:=True;
                      Break;
                 end;

         end;
       if TmpFirstModeCurr then
          begin
               if Finished then
                  begin
                         if  (UseIOSQLMonitorLevel>0) then
                             begin
                                  waitForFreeFile(NSRV);
                                  lockServFile(NSRV);
                             end;
              //         IF FILEEXIST(FNINFSAV) THEN
              //            BEGIN
              //                 DeleteFile_NET(FNINFSAV);
              //            END;
              //         RenameFile_NET(FNINF,FNINFSAV);
                       if not CopyFileByWindows(FNINF,FNINFSAV) then
                          begin
                               ShowMessage('Ошибка копирования файла '+fninf+' в файл '+fninfsav);
                               Halt;
                          end;

                       FNINF:=FNINFSAV;
                       if getFileSize(FNINF)<4 then
                       if (NameServList.IS_CANBEEMPTY(NSRV)=false) then
                          begin
                               ShowMessage('Обнулился файл '+fninf);
                               unLockServFile(NSRV);
                               Halt;
                          end;
                       if  (UseIOSQLMonitorLevel>0) then
                           unLockServFile(NSRV);
                       IF NOT SAFE_PUTINF THEN
                          WHILE(HEAD_PERSON<>NIL) DO DEL_PERSON(HEAD_PERSON);
                  end
               else
                   ShowMessage('Ошибка записи. Данные не сохранены.');
           end
       else
           begin
                AssignFile(InfByte,FNINF);
                FileMode:=fmShareDenyWrite;
                Reset(InfByte);
                FileMode:=fmOpenReadWrite;
                FileSize_New:=FileSize(InfByte);
                CloseFile(InfByte);
// Восстановить если запись не удалась
                if (FileSize_Old>10) and (FileSize_New<10) then
                   begin
                        if YesNo('Файл данных '+trim(FNINF)+' потерян. Восстановить его?') then
                           begin
                                ASSIGN(INF,FNINF);
                                ERASE_NET(INF,FNINF);
                                AssignFile(Inf,FNINF_BAK);
                                RENAME_NET(INF,FNINF);
                           end;
                   end;
           end;
      putNSRVFeaturesToSQLAfterPutInf;


 END;

PROCEDURE BLOCKWRITE_NET(VAR F:FILE ;VAR BUF;COUNT:INTEGER;VAR RESULTIO:INTEGER);
 VAR
     KOD:WORD;
     DONE:BOOLEAN;
     ist,ic:TDateTime;
     jst,jc:TTimeStamp;
     Otr,StartTime,CurrTime:integer;

 BEGIN
        DONE:=FALSE;
        ist:=time;
        jst:=DateTimeToTimeStamp(ist);
        StartTime:=jst.time;

        WHILE NOT DONE DO
         BEGIN
              {$I-}
              try
                 BLOCKWRITE(F,BUF,COUNT,RESULTIO);
                 KOD:=IORESULT;
              except
                 else
                   begin
                        if DebugMemoryCorruption then
                           begin
                                showMessage('Ошибка записи блока.');
                           end;
                   end;
              end;
              {$I+}
              KOD:=0;
              IF (KOD=0) and (COUNT=RESULTIO) THEN
                 DONE:=TRUE
              ELSE
                 BEGIN
                       ic:=time;
                       jc:=DateTimeToTimeStamp(ic);
                       CurrTime:=jc.time;
                       OTR:=CURRTIME-STARTTIME;
                       IF OTR>LIMIT_NET_TIME*100 THEN
                          BEGIN
                               ShowMessage('При записи сетевого файла '+ALLTRIM(FNINF)+
                                     ' превышен лимит ожидания в '+INTTOSTR(LIMIT_NET_TIME)+' сек');
                               IF YESNO('Сделать еще одну попытку записи ?') THEN
                                  BEGIN
                                       ist:=time;
                                       jst:=DateTimeToTimeStamp(ist);
                                       StartTime:=jst.time;
                                  END
                                                                             ELSE
                                  HALT(5);
                          END
                       ELSE
                          DELAY(DELAY_NET);
                 END;
        END;
 END;

 function DeleteFile_NET(FileNameA:string):boolean;
 VAR
     KOD:WORD;
     DONE:BOOLEAN;
     ist,ic:TDateTime;
     jst,jc:TTimeStamp;
     Otr,StartTime,CurrTime:integer;
 BEGIN
        DONE:=FALSE;
        ist:=time;
        jst:=DateTimeToTimeStamp(ist);
        StartTime:=jst.time;
        WHILE NOT DONE DO
         BEGIN
              Kod:=0;
              if not DeleteFile_Net(FileNameA) then KOD:=1;
              IF KOD=0 THEN DONE:=TRUE
              ELSE
                 BEGIN
                       ic:=time;
                       jc:=DateTimeToTimeStamp(ic);
                       CurrTime:=jc.time;
                       OTR:=CURRTIME-STARTTIME;
                       IF OTR>LIMIT_NET_TIME*100 THEN
                          BEGIN
                               ShowMessage('При уничтожении сетевого файла '+ALLTRIM(FIleNameA)+
                                     ' превышен лимит ожидания в '+INTTOSTR(LIMIT_NET_TIME)+' сек');
                               IF YESNO('Сделать еще одну попытку удаления ?') THEN
                                  BEGIN
                                       ist:=time;
                                       jst:=DateTimeToTimeStamp(ist);
                                       StartTime:=jst.time;
                                  END
                               else
                                  HALT(5);
                          END
                       ELSE
                          DELAY(DELAY_NET);
                 END;
        END;
 END;

PROCEDURE ERASE_NET(VAR F:FILE;FNINF_BAK:STRING);
 VAR
     KOD:WORD;
     DONE:BOOLEAN;
     FNAME:STRING;
     ist,ic:TDateTime;
     jst,jc:TTimeStamp;
     Otr,StartTime,CurrTime:integer;

 BEGIN
        DONE:=FALSE;
        ist:=time;
        jst:=DateTimeToTimeStamp(ist);
        StartTime:=jst.time;
        WHILE NOT DONE DO
         BEGIN
              {$I-}
              ERASE(F);
              KOD:=IORESULT;
              {$I+}
              IF KOD=0 THEN DONE:=TRUE
                       ELSE
                 BEGIN
                       ic:=time;
                       jc:=DateTimeToTimeStamp(ic);
                       CurrTime:=jc.time;
                       OTR:=CURRTIME-STARTTIME;
                       IF OTR>LIMIT_NET_TIME*100 THEN
                          BEGIN
                               ShowMessage('При уничтожении сетевого файла '+ALLTRIM(FNINF_BAK)+
                                     ' превышен лимит ожидания в '+INTTOSTR(LIMIT_NET_TIME)+' сек');
                               IF YESNO('Сделать еще одну попытку удаления ?') THEN
                                  BEGIN
                                       ist:=time;
                                       jst:=DateTimeToTimeStamp(ist);
                                       StartTime:=jst.time;
                                  END else
                                  HALT(5);
                          END
                                                 ELSE
                          DELAY(DELAY_NET);
                 END;
        END;
 END;

function RenameFile_NET(OldFileName:string;NewFileName:string):boolean;
 VAR
     KOD:WORD;
     FNAME:STRING;
     ist,ic:TDateTime;
     jst,jc:TTimeStamp;
     Otr,StartTime,CurrTime:integer;
     Done : boolean;
 BEGIN
        DONE:=FALSE;
        ist:=time;
        jst:=DateTimeToTimeStamp(ist);
        StartTime:=jst.time;
        WHILE NOT DONE DO
         BEGIN
              Kod:=0;
              if not RENAMEFile(OldFileName,NewFileName) then Kod:=1;
              IF KOD=0 THEN DONE:=TRUE
                       ELSE
                 BEGIN
                       ic:=time;
                       jc:=DateTimeToTimeStamp(ic);
                       CurrTime:=jc.time;
                       OTR:=CURRTIME-STARTTIME;
                       IF OTR>LIMIT_NET_TIME*100 THEN
                          BEGIN
                               ShowMessage('При переименовании сетевого файла '+ALLTRIM(OldFileName)+' в '+ALLTRIM(NewFileName)+
                                     ' превышен лимит ожидания в '+IntToStr(LIMIT_NET_TIME)+' сек');
                               IF YESNO('Сделать еще одну попытку переименования ?') THEN
                                  BEGIN
                                       ist:=time;
                                       jst:=DateTimeToTimeStamp(ist);
                                       StartTime:=jst.time;
                                  END
                                                                             ELSE
                                  HALT(5);
                          END
                                               ELSE
                          DELAY(DELAY_NET);
                 END;
        END;
 END;

PROCEDURE RENAME_NET(VAR F:FILE;FNINF_BAK:STRING);
 VAR
     KOD:WORD;
     FNAME:STRING;
     ist,ic:TDateTime;
     jst,jc:TTimeStamp;
     Otr,StartTime,CurrTime:integer;
     Done : boolean;
 BEGIN
        DONE:=FALSE;
        ist:=time;
        jst:=DateTimeToTimeStamp(ist);
        StartTime:=jst.time;
        WHILE NOT DONE DO
         BEGIN
              {$I-}
              RENAME(F,FNINF_BAK);
              KOD:=IORESULT;
              {$I+}
              IF KOD=0 THEN DONE:=TRUE
                       ELSE
                 BEGIN
                       ic:=time;
                       jc:=DateTimeToTimeStamp(ic);
                       CurrTime:=jc.time;
                       OTR:=CURRTIME-STARTTIME;
                       IF OTR>LIMIT_NET_TIME*100 THEN
                          BEGIN
                               ShowMessage('При переименовании сетевого файла '+ALLTRIM(FNINF)+' в '+ALLTRIM(FNINF_BAK)+
                                     ' превышен лимит ожидания в '+IntToStr(LIMIT_NET_TIME)+' сек');
                               IF YESNO('Сделать еще одну попытку переименования ?') THEN
                                  BEGIN
                                       ist:=time;
                                       jst:=DateTimeToTimeStamp(ist);
                                       StartTime:=jst.time;
                                  END
                                                                             ELSE
                                  HALT(5);
                          END
                                               ELSE
                          DELAY(DELAY_NET);
                 END;
        END;
 END;

 function CopyFile(FileNameSrc:string;FileNameDst:string):Boolean;
  var
     FileHandleSrc:Integer;
     FileHandleDst:Integer;
     Buffer:PChar;
     i:Integer;
     iFileLength : integer;
     iBytesRead  : Integer;
     iBytesWrite : Integer;
begin
     CopyFile:=True;
     if FileExists(FileNameDst) then
        if not DeleteFile(PAnsiChar(AnsiString(FileNameDst))) then
           begin
                CopyFile:=false;
                Exit;
           end;
     FileHandleDst := FileCreate(FileNameDst);

     if FileHandleDst=0 then
        begin
             CopyFile:=false;
             Exit;
        end;
     FileHandleSrc := FileOpen(FileNameSrc, fmOpenRead or fmShareDenyNone);
     if FileHandleSrc=0 then
        begin
             FileClose(FileHandleDst);
             CopyFile:=false;
             Exit;
        end;
     iBytesWrite:=0;
     iFileLength := FileSeek(FileHandleSrc,0,2);
     FileSeek(FileHandleSrc,0,0);
     try
        Buffer := PChar(AllocMem(iFileLength + 1));
        iBytesRead  := FileRead(FileHandleSrc, Buffer^, iFileLength);
        if (iBytesRead=iFileLength) then
           iBytesWrite :=FileWrite(FileHandleDst,Buffer^,iBytesRead);
        if ((iBytesRead<>iFileLength) or
           (iBytesRead<>iBytesWrite)) then
           CopyFile:=False;
     finally
        FreeMem(Buffer);
     end;
     FileClose(FileHandleSrc);
     FileClose(FileHandleDst);
 end;


 function getFileSize(fileName:string):longword;
   var FileSize_new:Longword;
       infByte:File of byte;
   begin
        FileSize_new:=0;
        try
          begin
            AssignFile(InfByte,FNINF);
            FileMode:=fmShareDenyWrite;
            Reset(InfByte);
            FileMode:=fmOpenReadWrite;
            FileSize_New:=FileSize(InfByte);
            CloseFile(InfByte);
          end  
        except
             else
                 FileSize_new:=0;
        end;
        getFileSize:=FileSize_New;
   end;

function RenameFileByWindows(AFileName, ANewFileName: string):Boolean;
 var retVal:Boolean;
 begin
      retVal:=True;
      if MoveFileEx(PAnsiChar(AnsiString(AFileName)), PAnsiChar(AnsiString(ANewFileName)), MOVEFILE_REPLACE_EXISTING or MOVEFILE_COPY_ALLOWED) then //ShowMessage('Успешно')
      else
          begin
               retVal:=False;
               RaiseLastOSError;
          end;
      RenameFileByWindows:=retVal;
 end;
 //      http://fk-uran.com.ua/rabota-s-fajlami-po-seti-delphi/
function copyFileByWindows(AFileName, ANewFileName: string):Boolean;
  var retVal:boolean;
   begin
        retVal:=True;
       if CopyFileEx(PAnsiChar(AnsiString(AFileName)), PAnsiChar(AnsiString(ANewFileName)), nil, nil, 0, 0) then //ShowMessage(‘Успешно’)
       else
          begin
               retval:=false;
               RaiseLastOSError;
          end;
       copyFileByWindows:=retVal;
   end;
end.
