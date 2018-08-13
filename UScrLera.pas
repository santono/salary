unit UScrLera;
interface
        PROCEDURE LERA_MN_SWOD;
implementation
     TYPE
          PITEM=^TITEM;
          TITEM=OBJECT(TOBJECT)
                 SHIFR            : INTEGER;
                 SUMMA_POCHAS_PPS : REAL;
                 SUMMA_PPS        : REAL;
                 SUMMA_UWP        : REAL;
                 SUMMA_AUP        : REAL;
                 SUMMA_AHP        : REAL;
                 SUMMA_NIS        : REAL;
                 SUMMA_OTH        : REAL;
                 SUMMA_DOG        : REAL;
                 CONSTRUCTOR INIT(NEWSHIFR:INTEGER);
                END;

          PList=^TList;
          TList=object(TSortedCollection)
                   function KeyOf(Item:pointer):pointer; virtual;
                   function Compare(Key1,Key2:pointer):integer;virtual;
                  end;
    Type TMode=(Lera,Magis802,Magis811,Dogovora);
         TBolnMode=(Total,WithoutBoln,BolnOnly,KassaOnly);

     TYPE PBITEM=^TBITEM;
          TBITEM=OBJECT(TOBJECT)
                  SHIFRROW : LONGINT;
                  SHIFRCOL : LONGINT;    { Группа }
                  SHIFRSTA : longint;
                  SHIFRINV : LongInt;    { 1 - если инвалид }
                  SUMMA    : REAL;
                 CONSTRUCTOR INIT(NEWSHIFRROW:LONGINT;NEWSHIFRCOL:LONGINT;NEWSHIFRSTA:LONGINT;NEWSHIFRINV:LONGINT);
                END;

          PBList=^TBList;
          TBList=object(TSortedCollection)
                   function KeyOf(Item:pointer):pointer; virtual;
                   function Compare(Key1,Key2:pointer):integer;virtual;
                  end;

    constructor TItem.Init(NewShifr:INTEGER);
     begin
          inherited Init;
          Shifr := NewShifr;
          SUMMA_POCHAS_PPS:=0;
          SUMMA_PPS:=0;
          SUMMA_UWP:=0;
          SUMMA_AUP:=0;
          SUMMA_AHP:=0;
          SUMMA_NIS:=0;
          SUMMA_OTH:=0;
          SUMMA_DOG:=0;
     end;

   function TList.KeyOf(Item:pointer):pointer;
    begin
         KeyOf:=Addr(PItem(Item)^.Shifr);
    end;

   function TList.Compare(Key1,Key2:pointer):integer;
    type PInteger=^Integer;
    begin
        if PInteger(Key1)^=PInteger(Key2)^ then Compare:=0
                                     else
        if PInteger(Key1)^>PInteger(Key2)^ then Compare:=1
                                     else Compare:=-1;
    end;

    constructor TBItem.Init(NEWSHIFRROW:LONGINT;NEWSHIFRCOL:LONGINT;NEWSHIFRSTA:LONGINT;NEWSHIFRINV:LONGINT);
     begin
          inherited Init;
          ShifrRow := NewShifrRow;
          ShifrCol := NewShifrCol;
          ShifrSta := NewShifrSta;
          ShifrInv := NewShifrInv;
     end;

   function TBList.KeyOf(Item:pointer):pointer;
    begin
         KeyOf:=Item;
    end;

   function TBList.Compare(Key1,Key2:pointer):integer;
    Var ShifrRow1,ShifrRow2,ShifrCol1,ShifrCol2,ShifrSta1,ShifrSta2,ShifrInv1,ShifrInv2:LongInt;
    begin
        ShifrRow1:=PBItem(Key1)^.ShifrRow;
        ShifrRow2:=PBItem(Key2)^.ShifrRow;
        ShifrCol1:=PBItem(Key1)^.ShifrCol;
        ShifrCol2:=PBItem(Key2)^.ShifrCol;
        ShifrSta1:=PBItem(Key1)^.ShifrSta;
        ShifrSta2:=PBItem(Key2)^.ShifrSta;
        ShifrInv1:=PBItem(Key1)^.ShifrInv;
        ShifrInv2:=PBItem(Key2)^.ShifrInv;
        if ShifrRow1>ShifrRow2 then Compare:=1
                               else
        if ShifrRow1<ShifrRow2 then Compare:=-1
                               else
        if ShifrCol1>ShifrCol2 then Compare:=1
                               else
        if ShifrCol1<ShifrCol2 then Compare:=-1
                               else
        if ShifrSta1>ShifrSta2 then Compare:=1
                               else
        if ShifrSta1<ShifrSta2 then Compare:=-1
                               else
        if ShifrInv1>ShifrInv2 then Compare:=1
                               else
        if ShifrInv1<ShifrInv2 then Compare:=-1
                               else Compare:=0;
    end;

{ ********************************************************** }
{ * Свод по счетам                             за 07.1997  * }
{ ********************************************************** }
PROCEDURE LERA_SWOD(Mode:TMode);
VAR II:INTEGER;
    LONG,BB:INTEGER;
    C,REC,SC,LD:REAL;
    NSRV_TEMP:INTEGER;
    NMES_TEMP:INTEGER;
    DEV:TEXT;
    DEVP:TEXT;
    List:PSortedCollection;
    WANTED_SHIFR:INTEGER;
    SUMMA_POCHAS_PPS:REAL;
    SUMMA_PPS : REAL;
    SUMMA_AUP : REAL;
    SUMMA_AHP : REAL;
    SUMMA_UWP : REAL;
    SUMMA_NIS : REAL;
    SUMMA_OTH : REAL;
    SUMMA_DOG : REAL;
    FNAME     : STRING;
    BolnMode  : TBolnMode;
    SummaPoch : real;
    BList     : PBList;
    SwodMode  : word;   { Свод по балансовым счетам }
    Summa11Tot:real;
 PROCEDURE PRINTLINE(ITEM:POINTER);FAR;
  BEGIN
       WRITELN(DEV,':',COPY(GET_IST_NAME(PITEM(ITEM)^.SHIFR)+SPACE(10),1,10)+':',
                    PITEM(ITEM)^.SUMMA_POCHAS_PPS:9:2,':',
                    PITEM(ITEM)^.SUMMA_PPS:9:2,':',
                    PITEM(ITEM)^.SUMMA_UWP:9:2,':',
                    PITEM(ITEM)^.SUMMA_AUP:9:2,':',
                    PITEM(ITEM)^.SUMMA_AHP:9:2,':',
                    PITEM(ITEM)^.SUMMA_NIS:9:2,':',
                    PITEM(ITEM)^.SUMMA_DOG:9:2,':',
                    PITEM(ITEM)^.SUMMA_OTH:9:2,':',
                    PITEM(ITEM)^.SUMMA_POCHAS_PPS+
                    PITEM(ITEM)^.SUMMA_PPS+
                    PITEM(ITEM)^.SUMMA_UWP+
                    PITEM(ITEM)^.SUMMA_AUP+
                    PITEM(ITEM)^.SUMMA_AHP+
                    PITEM(ITEM)^.SUMMA_NIS+
                    PITEM(ITEM)^.SUMMA_DOG+
                    PITEM(ITEM)^.SUMMA_OTH:9:2);
       SUMMA_POCHAS_PPS:=SUMMA_POCHAS_PPS+PITEM(ITEM)^.SUMMA_POCHAS_PPS;
       SUMMA_PPS:=SUMMA_PPS+PITEM(ITEM)^.SUMMA_PPS;
       SUMMA_UWP:=SUMMA_UWP+PITEM(ITEM)^.SUMMA_UWP;
       SUMMA_AUP:=SUMMA_AUP+PITEM(ITEM)^.SUMMA_AUP;
       SUMMA_AHP:=SUMMA_AHP+PITEM(ITEM)^.SUMMA_AHP;
       SUMMA_NIS:=SUMMA_NIS+PITEM(ITEM)^.SUMMA_NIS;
       SUMMA_OTH:=SUMMA_OTH+PITEM(ITEM)^.SUMMA_OTH;
       SUMMA_DOG:=SUMMA_DOG+PITEM(ITEM)^.SUMMA_DOG;
  END;
PROCEDURE MAKE_FOND_FOR_ALL;
 VAR CURR_PERSON  : PERSON_PTR;
     CURR_ADD     : ADD_PTR;
     Curr_Ud      : Ud_Ptr;
     SUMMA        : REAL;
     Summa_Pochas : Real;
     ITEM         : PITEM;
     JINDEX       : INTEGER;
     Need         : Boolean;
     BITEM        : PBITEM;
     ShifrRow     : word;
     ShifrCol     : word;
     ShifrSta     : word;
     SHIFRINV     : LONGINT;
     SummaPPSTemp,SummaPPSTemp1:real;
     Printed      : boolean;
     S            : String;
  BEGIN
      CURR_PERSON:=HEAD_PERSON;
      WHILE (CURR_PERSON<>NIL) DO
       BEGIN
            if ((SWOD_MODE=INVALID_SWOD) AND is_invalid(Curr_Person)) OR
               ((SWOD_MODE=PENS_SWOD) AND is_pensioner(Curr_Person)) OR
               (SWOD_MODE=COMMON_SWOD) then
               BEGIN
            Need:=false;
            ShifrRow:=Curr_Person^.Kategorija;
            SHIFRINV:=0;
            if IS_INVALID(CURR_PERSON) THEN SHIFRINV:=1;
            if (Mode=Lera) then
               if pos('811',Get_Ist_Name(curr_person^.gruppa))>0 then Need:=true
                                                                 else
                         else
            if Mode=Magis802 then
               if pos('801МГ',Get_Ist_Name(curr_person^.gruppa))>0 then Need:=true
                                                                else
                             else
            if Mode=Magis811 then
               if pos('811/4МГ',Get_Ist_Name(curr_person^.gruppa))>0 then Need:=true
                                                                else
                          else
            if Mode=Dogovora then Need:=true;
            s:=Get_Ist_Name(curr_person^.gruppa);
            if S='811/13' then
               s:=s;
            if (Curr_person^.Gruppa>0) and (Curr_person^.Gruppa<=max_gruppa) then
            if not Curr_Gruppa[Curr_person^.Gruppa] then Need:=false;
            if Need then
               begin
                     if Curr_Person^.Tabno=1652 then
                     if NSRV=98 then
                        s:=s;
                     SUMMA:=0;
                     Summa_Pochas:=0;
                     CURR_Add:=CURR_PERSON^.ADD;
                     SummaPPSTemp  := 0 ;
                     SummaPPSTemp1 := 0 ;
                     WHILE CURR_ADD<>NIL DO
                           BEGIN

                           if Curr_Person^.Gruppa=11 then
                              begin
                                   Summa11Tot:=Summa11Tot+Curr_Add^.Summa;
                              end;



                     {   Добавление в свод  для мемориальных ордеров}

                     ShifrRow:=Curr_Person^.Gruppa;
                     case  Curr_Person^.Kategorija of
                      1:
                          ShifrCol:=1101;   { ППС  }
                      2:
                          ShifrCol:=1105;   { УВП }
                      3:
                          ShifrCol:=11061;  { Н С }
                      4,6:
                          ShifrCol:=1104;   { АДМ ХОЗ }
                      5,7:
                          ShifrCol:=1103;   { АУП }
                      else
                          ShifrCol:=1101;
                     end;
                     if Curr_Add^.Shifr=Pochas_Shifr then ShifrCol:=1102;
                     if (nsrv=98) {OR (nsrv=128)} then
                     if Curr_Person^.Kategorija=Teacher_Kategorija then ShifrCol:=1102;
                     IF CURR_ADD^.SHIFR=BOL_5_SHIFR THEN SHIFRCOL:=BOL_5_SHIFR
                                                    ELSE
                     IF ISBOLNSHIFR(CURR_ADD^.SHIFR) THEN SHIFRCOL:=BOL_TEK_SHIFR
                                                     ELSE
                     IF CURR_ADD^.SHIFR=KASSA_SHIFR  THEN SHIFRCOL:=KASSA_SHIFR;
                     if NSRV=81 then ShifrCol:=11062; { Договора подряда }
                     ShifrSta:=Curr_Add^.Shifr;
                     BITEM:=NEW(PBITEM,INIT(SHIFRROW,SHIFRCOL,ShifrSta,ShifrINV));
                     IF BList^.Search(BITEM,JINDEX) THEN Dispose(BItem,Done)
                                                    ELSE
                        BEGIN
                              Dispose(BItem,Done);
                              BList^.Insert(New(PBItem,Init(ShifrRow,ShifrCol,ShifrSta,ShifrINV)));
                        END;
                     BITEM:=NEW(PBITEM,INIT(SHIFRROW,SHIFRCOL,ShifrSta,ShifrINV));
                     IF BList^.Search(BITEM,JINDEX) THEN
                        BEGIN
                             Dispose(BItem,Done);
                             BItem:=PBItem(BList^.At(JIndex));
                             BItem^.Summa:=BItem^.Summa+Curr_Add^.Summa;
                             if ShifrRow=11 then SummaPPSTemp:=SummaPPSTemp+Curr_Add^.Summa;
                        END
                     else
                        error('Неверный BITEM');

                         { Начало свода Леры }

                                if (BolnMode=Total)  or
                                   ((BolnMode=WithOutBoln) and (not IsBolnShifrLera(Curr_Add^.Shifr)) and
                                    (not IsKassaShifr(Curr_Add^.Shifr)) ) or
                                   ((BolnMode=BolnOnly) and (IsBolnShifrLera(Curr_Add^.Shifr))) OR
                                   ((BolnMode=KassaOnly) and (IsKassaShifr(Curr_Add^.Shifr))) then
                                   if Curr_add^.Shifr=Pochas_shifr then Summa_Pochas:=Summa_Pochas+Curr_Add^.Summa
                                                                   else SUMMA:=SUMMA+SUM(CURR_ADD^.SUMMA);
                                CURR_ADD:=CURR_ADD^.NEXT;
                           END;
                     IF (ABS(SUMMA)>0.001) OR (ABS(SUMMA_POCHAS)>0.001) THEN
                        BEGIN
                             IF LIST^.SEARCH(ADDR(CURR_PERSON^.GRUPPA),JINDEX) THEN
                                ITEM:=PITEM(LIST^.AT(JINDEX))
                                                                               ELSE
                                BEGIN
                                      ITEM:=NEW(PITEM,INIT(CURR_PERSON^.GRUPPA));
                                      LIST^.INSERT(ITEM);
                                END;
                             if (Abs(Summa_Pochas)>0.001) and (CURR_PERSON^.KATEGORIJA<>TEACHER_KATEGORIJA) then
                                begin
                                     Error('Почасовик не преподаватель 1 '+My_Str_Int(Nsrv)+' '+
                                           My_Str_Int(Curr_Person^.Tabno));
                                end
                                                                                                            else
                             if (nsrv=98) {OR (nsrv=128)}                       then
                             if (CURR_PERSON^.KATEGORIJA<>TEACHER_KATEGORIJA) then
                                begin
                                     Error('Почасовик не преподаватель 2 '+My_Str_Int(Nsrv)+' '+
                                           My_Str_Int(Curr_Person^.Tabno));
                                end;

                             if Curr_Person^.Gruppa=11 then
                                SummaPPSTemp1:=SummaPPSTemp1+summa;

                             IF (NSRV=81) and (Mode<>Dogovora) THEN ITEM^.SUMMA_DOG:=ITEM^.SUMMA_DOG+Summa
                                        ELSE
                             CASE CURR_PERSON^.KATEGORIJA OF
                                 TEACHER_KATEGORIJA:                   { 98 и 119 это почасовка }
                                                    BEGIN
                                              ITEM^.SUMMA_POCHAS_PPS:=ITEM^.SUMMA_POCHAS_PPS+Summa_Pochas;
                                                     if (nsrv=98) {OR (nsrv=128)} then
                                                        begin
                                              ITEM^.SUMMA_POCHAS_PPS:=ITEM^.SUMMA_POCHAS_PPS+summa;
                                                        end
                                                                         else
                                                        begin
                                                              ITEM^.SUMMA_PPS:=ITEM^.SUMMA_PPS+summa;
                                                        end;
                                                    END;
                                 UCH_WCPOM_KATEGORIJA:
                                              ITEM^.SUMMA_UWP:=ITEM^.SUMMA_UWP+summa+Summa_Pochas;
                                 AUP_BJUDGET_KATEGORIJA,
                                 AUP_NIS_KATEGORIJA:
                                              ITEM^.SUMMA_AUP:=ITEM^.SUMMA_AUP+summa+Summa_Pochas;
                                 ADM_HOZ_BJUDGET_KATEGORIJA,
                                 ADM_HOZ_NIS_KATEGORIJA:
                                              ITEM^.SUMMA_AHP:=ITEM^.SUMMA_AHP+summa+Summa_Pochas;
                                SCIENTIFIC_WORKER_KATEGORIJA:
                                              ITEM^.SUMMA_NIS:=ITEM^.SUMMA_NIS+summa+Summa_Pochas;
                                    ELSE
                                              ITEM^.SUMMA_OTH:=ITEM^.SUMMA_OTH+summa+Summa_Pochas;
                             END;

                             Printed:=false;

                             if ShifrRow=11 then
                                if abs(abs(SummaPPSTemp)-abs(SummaPPSTemp1))>0.01 then
                                   begin
                                        error('1 NSRV='+My_Str_Int(NSRV)+' TABNO='+My_Str_int(Curr_Person^.Tabno)+
                                              ' 1='+My_Str_Real(SummaPPSTemp,2)+' 2='+My_Str_Real(SummaPPSTemp1,2));

                                        Printed:=true;
                                   end;
{
                             if Not Printed then
                                if abs(abs(SummaPPSTemp)-abs(SummaPPSTemp1))>0.01 then
                                   begin
                                        error('2 NSRV='+My_Str_Int(NSRV)+' TABNO='+My_Str_int(Curr_Person^.Tabno)+
                                              ' 1='+My_Str_Real(SummaPPSTemp,2)+' 2='+My_Str_Real(SummaPPSTemp1,2));
                                        Printed:=true;
                                   end;
}

                        END;

                { Удержания }

                CURR_UD:=CURR_PERSON^.UD;
                WHILE CURR_UD<>NIL DO
                 BEGIN
                      ShifrRow:=Curr_Person^.Gruppa;
                      IF (IS_ALIMENTY_SHIFR(CURR_UD^.SHIFR))        or
                         (Curr_Ud^.Shifr=P_SBOR_VNE_LUGANSKA_SHIFR) or
                         (Curr_Ud^.Shifr=P_SBOR_V_LUGANSK_SHIFR)    THEN SHIFRCOL:=ALIMENTY_SHIFR
                                                                    ELSE SHIFRCOL:=CURR_UD^.SHIFR;
                      if (Curr_Ud^.Shifr=90) then ShifrCol:=81;    { Квартплата пересылается на коммунальные услуги }
                      ShifrSta:=Curr_Ud^.Shifr;
                      BITEM:=NEW(PBITEM,INIT(SHIFRROW,SHIFRCOL,ShifrSta,ShifrINV));
                      IF BList^.Search(BITEM,JINDEX) THEN Dispose(BItem,Done)
                                                     ELSE
                         BEGIN
                              Dispose(BItem,Done);
                              BList^.Insert(New(PBItem,Init(ShifrRow,ShifrCol,ShifrSta,ShifrINV)));
                         END;
                      BITEM:=NEW(PBITEM,INIT(SHIFRROW,SHIFRCOL,ShifrSta,ShifrINV));
                      IF BList^.Search(BITEM,JINDEX) THEN
                         BEGIN
                              Dispose(BItem,Done);
                              BItem:=PBItem(BList^.At(JIndex));
                              BItem^.Summa:=BItem^.Summa+Curr_Ud^.Summa;
                         END;
                      CURR_UD:=CURR_UD^.NEXT;
                 END;
               end;
              END;
            CURR_PERSON:=CURR_PERSON^.NEXT;
       END;
 END;

function Get_Boln_Mode:boolean;
CONST    MAX=5;
VAR A:ARRAY[1..MAX] OF STRING[40];
    I,J:INTEGER;
BEGIN
      GET_BOLN_MODE:=false;
      MY_TEXT_COLOR(YELLOW);
      MY_TEXT_BACKGROUND(BLUE);
      SAVE_SCREEN_SAFE;
      FOR I:=1 TO MAX DO A[I]:=ITEM^[I];
      ITEM^[1]:='Полный (все начисления)            ';
      ITEM^[2]:='Начисления без больничных и кассы  ';
      ITEM^[3]:='Только больничные                  ';
      ITEM^[4]:='Внесено в кассу                    ';
      ITEM^[5]:='Выход                              ';
      FOR I:=1 TO MAX DO MESSAGE[I]:='Q';
      FOR I:=1 TO MAX DO XK[I]:=23;
      YK[1]:=10;
      FOR I:=2 TO MAX DO YK[I]:=YK[I-1]+2;
      WINDOW(21,YK[1]-2,59,YK[MAX]+2);
      CLRSCR;
      WINDOW(1,1,80,25);
      TOUGHT(YK[1]-2,21,YK[MAX]+2,59);
      I:=COLOR_MENU(XK,YK,ITEM^,MESSAGE,MAX,25,BLUE,CYAN,YELLOW,BLUE,WHITE);
      FOR J:=1 TO MAX DO ITEM^[J]:=A[J];
      REST_SCREEN_SAFE;
      IF (I<1) OR (I>=MAX) THEN EXIT;
      IF I=1 THEN BolnMode:=Total;
      IF I=2 THEN BolnMode:=WithOutBoln;
      IF I=3 THEN BolnMode:=BolnOnly;
      IF I=4 THEN BolnMode:=KassaOnly;
      Get_Boln_Mode:=true;
END;


PROCEDURE PRINTSWOD;
 VAR DEV:TEXT;
     FNAME:STRING;
 PROCEDURE PrintItem(Item:Pointer);FAR;
  BEGIN
        WRITELN(DEV,PBItem(Item)^.ShifrRow:5,
                    PBItem(Item)^.ShifrCol:7,
                    PBItem(Item)^.ShifrSta:7,
                    PBItem(Item)^.Summa:12:2,
                    PBItem(Item)^.ShifrInv:5,
                    0:5);
  END;
 BEGIN
      FName:=CDOC+'COUBALL.TXT';
      if Mode=Magis802 then FName:=CDOC+'COUBALM2.TXT';
      if Mode=Magis811 then FName:=CDOC+'COUBALM4.TXT';
      if Mode=Dogovora then FName:=CDOC+'COUBALD.TXT';
      ASSIGN(DEV,FNAME);
      REWRITE(DEV);
      IF BList^.Count>0 THEN BList^.ForEach(@PrintItem);
      Close(Dev);
 END;


BEGIN
    if not Get_Boln_Mode then Exit;
    WINDOW(1,4,80,25);
    CLRSCR;
    WINDOW(1,1,80,25);
    if Mode=Magis802 then SwodMode:=5
                     else
    if Mode=Magis811 then SwodMode:=6
                     else
    if Mode=Dogovora then SwodMode:=7
                     else SwodMode:=4;
    if not get_Mem_par(SwodMode) then Exit;
(*
    if Mode=Lera then  {,Magis,Dogovora)}
       begin
            SwodMode:=4;
       end
                 else
       begin
            for i:=1 to max_gruppa do Curr_Gruppa[i]:=true;
            SELECT_SERV;
            IF KZ<0 THEN EXIT;
       end;
*)
    NSRV_TEMP:=NSRV;
    PUTINF;
    WINDOW(1,5,80,25);
    CLRSCR;
    WINDOW(1,1,80,25);
    MY_TEXT_BACKGROUND(CYAN);
    WINDOW(19,11,63,14);
    CLRSCR;
    WINDOW(1,1,80,25);
    D_DOUBLE(11,19,14,64);
    GOTOXY(21,12);
    if (Mode=Magis802) or
       (Mode=Magis811) then WRITE(' Создание свода по магистратуре. Ждите. ')
                     else WRITE(' Создание свода по 811 счету   . Ждите. ');
    GOTOXY(21,13); FOR I:=21 TO 62 DO WRITE(CHR(HASH));
    LD        := 62-21+1;
    REC       := COUNT_SERV;
    SC        := 0;
    NMES_TEMP := NMES;
    LIST:=NEW(PLIST,INIT(10,3));
    SUMMA_POCHAS_PPS := 0;
    SUMMA_PPS        := 0;
    SUMMA_AUP        := 0;
    SUMMA_AHP        := 0;
    SUMMA_UWP        := 0;
    SUMMA_NIS        := 0;
    SUMMA_OTH        := 0;
    SUMMA_DOG        := 0;
    SUMMA11TOT       := 0;
{
    assign(devp,'_pochas.txt');
    Rewrite(devp);
    SummaPoch:=0;
}
    BLIST:=NEW(PBLIST,INIT(100,10));

    FOR NSRV:=1 TO COUNT_SERV DO
        BEGIN
             SC:=SC+1;
             C:=SC*LD/REC;
             BB:=ROUND(C);
             GOTOXY(21,13);
             MY_TEXT_COLOR(BROWN);
             IF BB>0 THEN FOR II:=1 TO BB DO WRITE(CHR(FILL));
             IF IS_SELECTED[NSRV] THEN
{             IF TRUE THEN              }
                BEGIN
                     MY_TEXT_COLOR(WHITE);
                     MKFLNM;
                     IF FILEEXIST(FNINF) THEN
                        BEGIN
                             GETINF(TRUE);
                             MAKE_FOND_FOR_ALL;
                             WHILE HEAD_PERSON<>NIL DO DEL_PERSON(HEAD_PERSON);
                        END
                                         else
                        BEGIN
                             NSRV:=NSRV;
                        END;
                END
                                  ELSE
                BEGIN
                             NSRV:=NSRV;
                END;

        END; {Конец цикла по NSRV}
        error(My_Str_Real(Summa11Tot,2));
{
        writeln(devp,' Итого ',SummaPoch:12:2);
        close(devp);
}
        PRINTSWOD;
        DISPOSE(BList,Done);
        IF LIST^.COUNT>0 THEN
           BEGIN
                FNAME:=CDOC+'811.TXT';
                ASSIGN(DEV,FNAME);
                REWRITE(DEV);
                WRITELN(DEV,'Расшифровка начислений зарплаты');
                if Mode=Magis802 then WRITELN(DEV,'по магистратуре (802МГ) за '+Month[nmes]+' '+Work_Year+' года')
                              else
                if Mode=Magis811 then WRITELN(DEV,'по магистратуре (811/4МГ) за '+Month[nmes]+' '+Work_Year+' года')
                              else
                if Mode=Dogovora then WRITELN(DEV,'по договорам подряда за '+Month[nmes]+' '+Work_Year+' года')
                              else WRITELN(DEV,'по внебюджетным средствам за '+Month[nmes]+' '+Work_Year+' года');
                IF BolnMode=Total then WriteLn(Dev,' все начисления ')
                                  else
                IF BolnMode=WithOutBoln then WriteLn(Dev,' начисления за исключением больничных')
                                  else
                IF BolnMode=BolnOnly then WriteLn(Dev,' только больничные (включаяя декретный)');
                IF (swod_mode=INVALID_SWOD) THEN WRITELN(DEV,' Инвалиды ');
                IF (swod_mode=pens_SWOD) THEN WRITELN(DEV,' Пенсионеры ');

      WRITELN(DEV,':-----------------------------------------------------------------------------------------------------');
      WRITELN(DEV,':   Счет   :почасовка:   ППС   :   УВП   :   АУП   :   АХП   :Науч.сотр:Дог.подр.:Прочие   :  Всего  :');
      WRITELN(DEV,':          :  1102   :   1101  :   1105  :   1103  :   1104  :   1106  :   1106  :   1107  :         :');
      WRITELN(DEV,':----------:---------:---------:---------:---------:---------:---------:---------:---------:---------:');
                LIST^.FOREACH(@PRINTLINE);
                WRITELN(DEV,':----------:---------:---------:---------:---------:---------:---------:---------:---------:');
                WRITELN(DEV,': Итого    :',SUMMA_POCHAS_PPS:9:2,':',SUMMA_PPS:9:2,':',SUMMA_UWP:9:2,
                            ':',SUMMA_AUP:9:2,':',SUMMA_AHP:9:2,':',SUMMA_NIS:9:2,':',SUMMA_DOG:9:2,':',SUMMA_OTH:9:2,':',
                            SUMMA_POCHAS_PPS+SUMMA_PPS+SUMMA_UWP+SUMMA_AUP+SUMMA_AHP+SUMMA_NIS+SUMMA_DOG+SUMMA_OTH:9:2);
                WRITELN(DEV,':-------------------------------------------------------------------------------------------');
                CLOSE(DEV);
                VIEW(FNAME);
           END;
        DISPOSE(LIST,DONE);
        NSRV:=NSRV_TEMP;
        NMES:=NMES_TEMP;
        MKFLNM;
        GETINF(NEED_NET_FOR_GETINF);
        MY_TEXT_COLOR(BWHITE);
        MY_TEXT_BACKGROUND(BBLACK);
        WINDOW(1,5,80,25);
        CLRSCR;
        WINDOW(1,1,80,25);
  END;

end.
