{$WARNINGS OFF}
{$HINTS OFF}
{$I+}
unit ScrNalog;
                                                                                       
interface
   uses ScrDef;
   type TModeNalog=(PodohNalog,PensNalog,SSNalog,FZNalog,AlimNach,ECBNalog,ECBIllNalog,BolNach,WSNalog);
   
FUNCTION   PODOH(S:REAL;W_NMES:INTEGER;KOL_WO_DETEJ:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
FUNCTION   PODOH_2004(S,BOL_S,S_PENS,S_S,F_Z,ECB_NALOG,ECB_ILL_NALOG:REAL;W_NMES,W_YEAR:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
FUNCTION   PODOH_2004_2011(SS,ECB_NALOG,ECB_ILL_NALOG:REAL;W_NMES,W_YEAR:INTEGER;CURR_PERSON:PERSON_PTR):REAL;OVERLOAD;
FUNCTION   PODOH_2004_2011(SS,ECB_NALOG,ECB_ILL_NALOG:REAL;W_NMES,W_YEAR:INTEGER;isLgotaPN:Integer;kd:integer;p:real):REAL;OVERLOAD;
PROCEDURE  UPDATE_PODOH(VAR CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER;START_YEAR:WORD;MODERECALC:INTEGER=2);
PROCEDURE  UPDATE_PODOH_SQL(VAR CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER;START_YEAR:WORD;MODERECALC:INTEGER);
PROCEDURE  PROF_PERSON(CURR_PERSON:PERSON_PTR);
PROCEDURE  WS_PERSON(CURR_PERSON:PERSON_PTR);
PROCEDURE  KOP_PERSON(CURR_PERSON:PERSON_PTR);
PROCEDURE  PENS_PERSON(CURR_PERSON:PERSON_PTR);
PROCEDURE  FOND_PERSON(CURR_PERSON:PERSON_PTR);
FUNCTION   S_S(S:REAL;WANTED_PERIOD:INTEGER;CURR_PERSON:PERSON_PTR;Wanted_Year:integer):REAL;
FUNCTION   FOND_Z(CURR_PERSON:PERSON_PTR;SUMMA:REAL;PERIOD:INTEGER;START_YEAR:INTEGER):REAL; FORWARD;
//PROCEDURE  PODOH_PERSON(VAR CURR_PERSON:PERSON_PTR;MODERECALC:INTEGER);
PROCEDURE PODOH_PERSON(VAR CURR_PERSON:PERSON_PTR;moderecalc:integer;ModeDelOtherMonth:integer=0);
{ХPROCEDURE  CALC_PODOH;}
{ PROCEDURE PODOH_SOWM_PERSON(CURR_PERSON:PERSON_PTR);}
{ PROCEDURE CALC_PODOH_SOWM;}
PROCEDURE CALC_PROF;
PROCEDURE CALC_PENS;
PROCEDURE CALC_FOND;
PROCEDURE OKLAD_PERSON(CURR_PERSON:PERSON_PTR;LAST_DAY:INTEGER);
PROCEDURE DOPL_DO_MIN_SAL_PERSON(CURR_PERSON:PERSON_PTR;LAST_DAY:INTEGER);
PROCEDURE DIFF_SAL_PERSON(CURR_PERSON:PERSON_PTR;LAST_DAY:INTEGER);
PROCEDURE CALC_UD_FOR_ALL_REST(CURR_PERSON:PERSON_PTR;PERIOD_NEW:INTEGER);
PROCEDURE CALC_NAUD_WORK_WITHOUT_ALL_REST(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER;LAST_DAY:INTEGER);
PROCEDURE CALC_NAUD_FULL;
PROCEDURE CALC_NAUD(CURFIL:INTEGER;LAST_DAY:INTEGER;moderecalc:integer=2);
PROCEDURE CALC_NAUD_PERSON(CURR_PERSON:PERSON_PTR;LAST_DAY:INTEGER;moderecalc:integer=2);
FUNCTION IS_PODOH_IN(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER):BOOLEAN;
PROCEDURE MAKE_PERSON_PODOH(CURR_PERSON:PERSON_PTR;
                            KOL_WO_DETEJ:INTEGER;
                            START_MONTH:INTEGER;
                            START_YEAR:INTEGER;
                            PODOH_NACH,
                            BOL_NACH,
                            PODOH_UD  ,
                            ALIMENTY_NACH   ,
                            ALIMENTY_UD     ,
                            PENS_NACH       ,
                            PENS_UD         ,
                            PENS_SELF_NACH  ,
                            PENS_SELF_UD    ,
                            S_S_NACH        ,
                            S_S_UD          ,
                            S_S_SELF_NACH   ,
                            S_S_SELF_UD     ,
                            F_Z_NACH        ,
                            F_Z_UD          ,
                            F_Z_SELF_NACH   ,
                            F_Z_SELF_UD     ,
                            ECBN_NACH       ,
                            ECBN_UD         ,
                            ECB_NACH        ,
                            ECB_UD          ,
                            ECB_DP_NACH     ,
                            ECB_DP_UD       ,
                            ECB_SELF_NACH   ,
                            ECB_SELF_UD     ,
                            ECB_ILL_NACH    ,
                            ECB_ILL_UD      ,
                            ECB_ILL_SELF_NACH,
                            ECB_ILL_SELF_UD:REAL);
FUNCTION GET_OLD_DOLG(CURR_PERSON:PERSON_PTR):REAL;
PROCEDURE MAKE_POCHTOW_SBOR(CURR_PERSON:PERSON_PTR;CURR_UD:UD_PTR;A_A:real);
FUNCTION NACH_PERSON_EXL(CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR:INTEGER;NMESOLD:INTEGER;NEED_TO_CHAIN:BOOLEAN):REAL;
FUNCTION NACH_BOL_PERSON_EXL(CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR:INTEGER):REAL;
FUNCTION NACH_PERSON_PENS_EXL(CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR:INTEGER):REAL;
FUNCTION NACH_PERSON_S_S_EXL(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
FUNCTION NACH_PERSON_F_Z_EXL(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
FUNCTION NACH_PERSON_ALIMENTY(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
FUNCTION Nach_Person_For_Nalog_Exl(ModeNalog:TModeNalog;CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR,NmesOld:INTEGER;
                                      Need_To_Chain:boolean):REAL;
FUNCTION GET_STIPENDIJA(CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):REAL;
FUNCTION UD_PODOH(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:WORD;NEED_TO_CHAIN:BOOLEAN):REAL;
FUNCTION UD_S_S(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
FUNCTION UD_F_Z(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
FUNCTION UD_ALIMENTY(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
FUNCTION UD_PENS(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
FUNCTION UD_NALOG(ModeNalog:TModeNalog;CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:WORD;NEED_TO_CHAIN:BOOLEAN):REAL;
FUNCTION MUST_ALIMENTY(VAR FLOW:INTEGER;VAR PROC:REAL;CURR_PERSON:PERSON_PTR;VAR PRM:INTEGER;var A_Shifr:integer;var SUMMAABS:Real):BOOLEAN;
FUNCTION PROF(CURR_PERSON:PERSON_PTR;SUMMA:REAL;PERIOD:INTEGER):REAL; FORWARD;
PROCEDURE CALC_NAUD_PERSON_WITHOUT_UD(CURR_PERSON:PERSON_PTR;LAST_DAY:INTEGER);
FUNCTION getWSSumma(Summa:Real):real;
implementation
  Uses SysUtils,Dialogs,ScrUtil,ScrIni,ScrLists,SCRIO,UFIBModule,UFormShow,
       ScrExport,UORecalcAbon,uSortAdd,UDuplTest,Math;

 VAR
    NeedForPodoh2004:boolean;
    SummaNachPremForDoplaty:Real;

    procedure ExcludeShift_Shifr(Curr_Person:Person_Ptr);
     var
        CURR_ADDW : ADD_PTR;
        CURR_UDW  : UD_PTR ;
     begin
          Curr_AddW:=Curr_Person^.ADD;
          while (Curr_AddW<>NIl) do
            begin
                 IF CURR_ADDW^.SHIFR>SHIFT_SHIFR THEN
                    CURR_ADDW^.SHIFR:=CURR_ADDW^.SHIFR-SHIFT_SHIFR;
                    Curr_AddW:=Curr_AddW^.Next;
            end;
            Curr_UdW:=Curr_Person^.Ud;
            while (Curr_UdW<>NIl) do
              begin
                  IF CURR_UdW^.SHIFR>SHIFT_SHIFR THEN
                     CURR_UdW^.SHIFR:=CURR_UdW^.SHIFR-SHIFT_SHIFR;
                  Curr_UdW:=Curr_Udw^.Next;
              end;
     end;

FUNCTION IS_PODOH_IN(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER):BOOLEAN;
 VAR CURR_UD:UD_PTR;
     L:BOOLEAN;
 BEGIN
     L:=FALSE;
     Curr_Ud:=Curr_Person^.UD;
     WHILE (Curr_Ud<>niL) DO
      BEGIN
            IF CURR_UD^.SHIFR=PODOH_SHIFR THEN
            IF CURR_UD^.PERIOD=PERIOD  THEN
               BEGIN
                    L:=TRUE;
                    BREAK;
               END;
            Curr_Ud:=Curr_Ud^.NEXT;
      END;
      IS_PODOH_IN:=L;
 END;
(*
FUNCTION PODOH_2004(S,BOL_S,S_PENS,S_S,F_Z:REAL;W_NMES:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 VAR SUMMA,P,A:REAL;
     KD:INTEGER;
     RASLIMITPODOHLGOTA:real;
 BEGIN
     PODOH_2004:=0;
     KZ:=0;
     if Is_Pensioner(Curr_Person) then
        if (((CurrYear>1990) and (CurrYear<2009)) or
            ((CurrYear<100) and (CurrYear+1990<2009))) then F_Z:=0;

     IF CURR_PODOH_MONTH_2004<>W_NMES THEN INIT_PODOH_2004(W_NMES,CURRYEAR);
     IF KZ<0 THEN
        BEGIN
             ERROR('Нет таблицы подоходного налога за '+ALLTRIM(MONTH[W_NMES]));
             EXIT;
        END;
{     if (S-BOL_S<LIMITPODOHLGOTA) and NOT IS_PRINAT_UWOLEN(Curr_Person) then}
{     if (S-BOL_S<LIMITPODOHLGOTA) and NOT IS_PRINAT_UWOLEN(Curr_Person) then}
{     S:=INT(S);    }
     RASLIMITPODOHLGOTA:=LIMITPODOHLGOTA;
     kd:=GetKwoDetOdMPN2004(Curr_Person);
     if (kd>1) and (kd<10) then RASLIMITPODOHLGOTA:=kd*LIMITPODOHLGOTA;
     if (S<RASLIMITPODOHLGOTA) and
        NOT IS_PRINAT_UWOLEN(Curr_Person) and
        NOT STORONNEE_PODRAZD(Curr_Person^.Mesto_Osn_Raboty) and
        NOT RECENZENT_PODRAZD(Curr_Person^.Mesto_Osn_Raboty) and
        NOT IsNetLgotyPN(Curr_Person)                        then
        begin
             P:=GetLgotyPN2004(Curr_Person);
             P:=PODOHLGOTA*(1+P);
             S:=S-P;
             if S<0 then S:=0;
        end;
  {   SUMMA:=S-S_PENS-S_S-F_Z; }
{     SUMMA:=S-S_PENS;  }
      SUMMA:=S-S_PENS-S_S-F_Z;
{     SUMMA:=INT(SUMMA);}        { Округлять в самом начале }
     IF SUMMA<0.001 THEN SUMMA:=0;
{     SUMMA:=INT(SUMMA);}        { Округлять в самом начале }
     PODOH_2004:=R10(SUMMA*PROCPODOH);
 END;
*)
FUNCTION PODOH_2011(SummaFirst:real;Summa:Real):REAL;
 var RetVal:real;
 begin
      RetVal:=0;
      if Summa>Limit_17_Summa then
 //        RetVal:=AddPodohFor17+(Summa-Limit_17_Summa)*0.17
         RetVal:=AddPodohFor17+(Summa-Limit_17_Summa)*ProcAddPodoh
      else
//         RetVal:=Summa*0.15;
         RetVal:=Summa*PROCPODOH;
      RetVal:=R10(RetVal);
      PODOH_2011:=RetVal;

 end;

FUNCTION PODOH_2004(S,BOL_S,S_PENS,S_S,F_Z,ECB_NALOG,ECB_ILL_NALOG:REAL;W_NMES,W_YEAR:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 VAR SUMMA,P,A:REAL;
     I,III,J,Y,KD:INTEGER;
     DONE,NEED_OGR:BOOLEAN;
     IsLgoty:boolean;
     RasLimitPodohLgota:real;
     DopLgotaForDeti:real;
     OwnLgota : integer;
     SummaFirst : real;
 BEGIN
     KZ:=0;
     SummaFirst:=S;
     IsLgoty:=false;
     if (W_YEAR>0) and (W_YEAR<50) then
         W_YEAR:=W_YEAR+1990;
     IF ((W_YEAR<1990) or (W_YEAR>2100)) then
         W_YEAR:=CurrYear;
     if Is_Pensioner(Curr_Person) then
        if (((W_YEAR>1990) and (W_YEAR<2011)) or
            ((W_YEAR<100) and (W_YEAR+1990<2011))) then F_Z:=0;
     IF CURR_PODOH_MONTH_2004<>W_NMES THEN INIT_PODOH_2004(W_NMES,W_YEAR);
     IF KZ<0 THEN
        BEGIN
             ERROR('Нет таблицы подоходного налога за '+ALLTRIM(MONTH[W_NMES]));
             PODOH_2004:=0;
             EXIT;
        END;
{     if (S-BOL_S<LIMITPODOHLGOTA) and NOT IS_PRINAT_UWOLEN(Curr_Person) then}
{     if (S-BOL_S<LIMITPODOHLGOTA) and NOT IS_PRINAT_UWOLEN(Curr_Person) then}
{     S:=INT(S);    }
     RASLIMITPODOHLGOTA:=LIMITPODOHLGOTA;
     kd:=GetKwoDetOdMPN2004(Curr_Person);
     doplgotafordeti:=0;
     if (kd>0) and (kd<10) then
        begin
             RASLIMITPODOHLGOTA:=kd*LIMITPODOHLGOTA;
             DOPLGOTAFORDETI:=kd*PODOHLGOTA;
        end;
     OwnLgota := 0;
     if (S<RASLIMITPODOHLGOTA)                               then
        begin
             P:=GetLgotyPN2004(Curr_Person);
             if ((STORONNEE_PODRAZD(Curr_Person^.Mesto_Osn_Raboty)) or
                 (RECENZENT_PODRAZD(Curr_Person^.Mesto_Osn_Raboty))) then
                 p:=0;
             if (IsLgotyPN2011(Curr_Person)) then
                OwnLgota:=1;
             if (IsNetLgotyPN(Curr_Person)) then
                OwnLgota:=0;


(*
             if NOT IS_PRINAT_UWOLEN(Curr_Person)                    and
                NOT STORONNEE_PODRAZD(Curr_Person^.Mesto_Osn_Raboty) and
                NOT RECENZENT_PODRAZD(Curr_Person^.Mesto_Osn_Raboty) and
                NOT IsNetLgotyPN(Curr_Person)                        and
                IsLgotyPN2011(Curr_Person)                           then
*)
             if (p>0) then
                begin
                     P:=PODOHLGOTA*(1+P);
                     S:=S-P;
                     if S<0 then S:=0;
                end
             else
                 if (OwnLgota=1) then
                begin
                     P:=PODOHLGOTA;
                     S:=S-P;
                     if S<0 then S:=0;
                end;
             S := S - DOPLGOTAFORDETI ;
             if S<0 then S:=0;
        end;
  {   SUMMA:=S-S_PENS-S_S-F_Z; }
{     SUMMA:=S-S_PENS;  }
      if (((CurrYear>1990) and (CurrYear<2011)) or
          ((CurrYear<100) and (CurrYear+1990<2011))) then
         SUMMA:=S-S_PENS-S_S-F_Z
      else
         SUMMA:=S-ECB_NALOG-ECB_ILL_NALOG;
{     SUMMA:=INT(SUMMA);}        { Округлять в самом начале }
     IF SUMMA<0.001 THEN SUMMA:=0;
{     SUMMA:=INT(SUMMA);}        { Округлять в самом начале }
      if (((CurrYear>1990) and (CurrYear<2011)) or
          ((CurrYear<100) and (CurrYear+1990<2011))) then
          PODOH_2004:=R10(SUMMA*PROCPODOH)
      else
          PODOH_2004:=PODOH_2011(SummaFirst,SUMMA);

 END;

FUNCTION PODOH_2004_2011(SS,ECB_NALOG,ECB_ILL_NALOG:REAL;W_NMES,W_YEAR:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 VAR SUMMA,P,A:REAL;
     I,III,J,Y,KD:INTEGER;
     DONE,NEED_OGR:BOOLEAN;
     IsLgoty:boolean;
     RasLimitPodohLgota:real;
     DopLgotaForDeti:real;
     OwnLgota : integer;
     SummaFirst,S : real;
     ZnakMode:Boolean;
     isMotherSingle:Boolean;
 BEGIN
        if (W_YEAR>0) and (W_YEAR<50) then
         W_YEAR:=W_YEAR+1990;

if isLNR then
   begin
          PODOH_2004_2011:=R10(ss*0.13);
          Exit;
   end;
if (W_YEAR>2015) then    // c 2016 - нет ЕСВ
    begin
         ECB_NALOG:=0;
         ECB_ILL_NALOG:=0;
    end;
     S:=SS;
     ZnakMode:=False;
     if s<-0.05 then
        begin
             ZnakMode:=True;
             s:=-s;
             if ECB_NALOG<-0.005 then ECB_NALOG:=-ECB_NALOG;
        end;
     KZ:=0;
     SummaFirst:=S;
     IsLgoty:=false;
     if (W_YEAR>0) and (W_YEAR<50) then
         W_YEAR:=W_YEAR+1990;
     IF ((W_YEAR<1990) or (W_YEAR>2100)) then
         W_YEAR:=CurrYear;
     IF CURR_PODOH_MONTH_2004<>W_NMES THEN INIT_PODOH_2004(W_NMES,W_YEAR);
     IF KZ<0 THEN
        BEGIN
             ERROR('Нет таблицы подоходного налога за '+ALLTRIM(MONTH[W_NMES]));
             PODOH_2004_2011:=0;
             EXIT;
        END;
     RASLIMITPODOHLGOTA:=LIMITPODOHLGOTA;
     kd:=GetKwoDetOdMPN2004(Curr_Person);
     isMotherSingle:=False;
     if KD>0 then
        isMotherSingle:=getSingleMonherForPN2004(Curr_Person);
     DOPLGOTAFORDETI:=0;
     if (kd>0) and (kd<10) then
        begin
             RASLIMITPODOHLGOTA:=kd*LIMITPODOHLGOTA;    //Лера сказала 12 12 2016 на каждого 150% льгота
             if isMotherSingle then
                DOPLGOTAFORDETI:=kd*PODOHLGOTA*(1.5)
             else
                DOPLGOTAFORDETI:=kd*PODOHLGOTA;

        end;
     OwnLgota := 0;
     if (S<RASLIMITPODOHLGOTA)                               then
        begin
             P:=GetLgotyPN2004(Curr_Person);
             if p>10 then
                p:=P/100.00;
             if (Curr_Person<>Nil) then
             if ((STORONNEE_PODRAZD(Curr_Person^.Mesto_Osn_Raboty)) or
                 (RECENZENT_PODRAZD(Curr_Person^.Mesto_Osn_Raboty))) then
                 p:=0;
             if (Curr_Person<>Nil) then
             if (IsLgotyPN2011(Curr_Person)) then
                OwnLgota:=1;
             if (Curr_Person<>Nil) then
             if (IsNetLgotyPN(Curr_Person)) then
                OwnLgota:=0;
             if (p>0) then
                begin
                     P:=PODOHLGOTA*(1+P);
                     S:=S-P;
                     if S<0 then S:=0;
                end
             else
                 if (OwnLgota=1) then
                begin
                     P:=PODOHLGOTA;
                     S:=S-P;
                     if S<0 then S:=0;
                end;
             S := S - DOPLGOTAFORDETI ;
             if S<0 then S:=0;
        end;
     SUMMA:=S-ECB_NALOG-ECB_ILL_NALOG;
     IF SUMMA<0.001 THEN SUMMA:=0;
     A:=PODOH_2011(SummaFirst,SUMMA);
     if ZnakMode then a:=-a;
     PODOH_2004_2011:=a;

 END;

FUNCTION PODOH_2004_2011(SS,ECB_NALOG,ECB_ILL_NALOG:REAL;W_NMES,W_YEAR:INTEGER;isLgotaPN:Integer;kd:integer;p:real):REAL;
 VAR SUMMA,A:REAL;
     I,III,J,Y:INTEGER;
     DONE,NEED_OGR:BOOLEAN;
     IsLgoty:boolean;
     RasLimitPodohLgota:real;
     DopLgotaForDeti:real;
     SummaFirst,S : real;
     ZnakMode:Boolean;
     OwnLgota:Integer;
 BEGIN
        if (W_YEAR>0) and (W_YEAR<50) then
         W_YEAR:=W_YEAR+1990;

if (isLNR and (W_YEAR>2015)) then
   begin
          PODOH_2004_2011:=R10(ss*0.13);
          Exit;
   end;
if (W_YEAR>2015) then    // c 2016 - нет ЕСВ
    begin
         ECB_NALOG:=0;
         ECB_ILL_NALOG:=0;
    end;
     S:=SS;
     ZnakMode:=False;
     if s<-0.05 then
        begin
             ZnakMode:=True;
             s:=-s;
             if ECB_NALOG<-0.005 then ECB_NALOG:=-ECB_NALOG;
        end;
     KZ:=0;
     SummaFirst:=S;
     IsLgoty:=false;
     if (W_YEAR>0) and (W_YEAR<50) then
         W_YEAR:=W_YEAR+1990;
     IF ((W_YEAR<1990) or (W_YEAR>2100)) then
         W_YEAR:=CurrYear;
     IF CURR_PODOH_MONTH_2004<>W_NMES THEN INIT_PODOH_2004(W_NMES,W_YEAR);
     IF KZ<0 THEN
        BEGIN
             ERROR('Нет таблицы подоходного налога за '+ALLTRIM(MONTH[W_NMES]));
             PODOH_2004_2011:=0;
             EXIT;
        END;
     RASLIMITPODOHLGOTA:=LIMITPODOHLGOTA;
//     kd:=0;
     DopLgotaForDeti:=0;

     if (kd>0) and (kd<10) then
        begin
             RASLIMITPODOHLGOTA:=kd*LIMITPODOHLGOTA;
             DOPLGOTAFORDETI:=kd*PODOHLGOTA;
        end;
     OwnLgota := 0;
     if (S<RASLIMITPODOHLGOTA)                               then
        begin
             if isLgotaPN>0 then
                OwnLgota:=1;
             if (p>0) then
                begin
                     P:=PODOHLGOTA*(1+P);
                     S:=S-P;
                     if S<0 then S:=0;
                end
             else
             if (OwnLgota=1) then
                begin
                     P:=PODOHLGOTA;
                     S:=S-P;
                     if S<0 then S:=0;
                end;
             S := S - DOPLGOTAFORDETI ;
             if S<0 then S:=0;
        end;
     SUMMA:=S-ECB_NALOG-ECB_ILL_NALOG;
     IF SUMMA<0.001 THEN SUMMA:=0;
     A:=PODOH_2011(SummaFirst,SUMMA);
     if ZnakMode then a:=-a;
     PODOH_2004_2011:=a;

 END;



FUNCTION PODOH(S:REAL;W_NMES:INTEGER;KOL_WO_DETEJ:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 BEGIN
       Podoh:=0;
{      PODOH:=PODOH_NEW(S,W_NMES,KOL_WO_DETEJ,CURR_PERSON);}
 END;


FUNCTION PENS(S:REAL;WANTED_PERIOD:INTEGER;WANTED_YEAR:integer;CURR_PERSON:PERSON_PTR):REAL;
 VAR
     P:REAL;
     Summa:real;
     SummaNalog:real;
 BEGIN
     PENS:=0;
     EXIT;
     Summa:=S;
     if Summa>LIMITFORPENS then Summa:=LIMITFORPENS;
{
     P:=0.02;
     IF ABS(S)<150 THEN
        IF IS_PENS_PROC_ZAKON(CURR_PERSON) THEN P:=0.01;
}
     P:=GetProcPensNalog(CURR_PERSON,Summa,SummaNalog,Wanted_Period,Wanted_Year);
     if NeedForPodoh2004=false then
     if (Curr_Person^.Wid_Raboty=sowm_wid_raboty) and (Wanted_Period=Nmes) then
        begin
             P:=0.02;
             SummaNalog:=0;
        end;
     if abs(SummaNalog)>0.005 then Pens:=R10(SummaNalog)
                              else PENS:=R10(Summa*P);

 END;

FUNCTION ECB(S:REAL;WANTED_PERIOD:INTEGER;WANTED_YEAR:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 VAR W_Y,I:INTEGER;
     Y,M,D,DOW:WORD;
     P:REAL;
     Summa:real;
     SummaNalog:real;
     WantedECBShifr:integer;
 BEGIN
     ECB:=0;
     Y:=WANTED_YEAR;
     if Y<100 then Y:=Y+1990;
     if Y<2010 then
        EXIT;
     Summa:=S;
     if Summa>LIMITFORPENS then Summa:=LIMITFORPENS;     
     P:=GetProcECBNalog(CURR_PERSON,Summa,SummaNalog,WANTED_PERIOD,WANTED_YEAR,WantedECBShifr);
     if p>0.001 then
        begin
             ECB := R10(Summa*p)
        end;
 end;

FUNCTION ECBIll(S:REAL;WANTED_PERIOD:INTEGER;WANTED_YEAR:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
 VAR W_Y,I:INTEGER;
     Y,M,D,DOW:WORD;
     P:REAL;
     Summa:real;
     SummaNalog:real;
 BEGIN
     ECBIll:=0;
     Y:=WANTED_YEAR;
     if Y<100 then Y:=Y+1990;
     if Y<2010 then
        EXIT;
     Summa:=S;
     P:=ECBIllProc;
     if p>0.001 then
        begin
             ECBIll := R10(Summa*p)
        end;
 end;

FUNCTION S_S(S:REAL;WANTED_PERIOD:INTEGER;CURR_PERSON:PERSON_PTR;Wanted_Year:integer):REAL;
 VAR W_Y,I     : INTEGER;
     Y,M,D,DOW : WORD;
     P         : REAL;
     Summa     : REAL;
     Lim       : real;
 BEGIN
      if Wanted_Year<2000 then Wanted_Year:=Wanted_Year+1990;{Error('Неверный год при расчете с с '+My_Str_Int(Wanted_Year));}
      if Wanted_Year=2006 then
        if Wanted_Period<4 then Lim:=483
          else Lim:=496     { 2006 }
                          else { 2007 }
        if Wanted_Period<4 then Lim:=525
                           else
        if Wanted_Period<10 then Lim:=561
                            else Lim:=548;

//        Lim:=PARSAL[2,Wanted_Period];      {10035 В 2009}
        Lim:=GET_LIMIT_FOR_PENS(Wanted_Year,Wanted_Period);
        begin
             Summa:=S;
             if Summa>LIMITFORPENS then Summa:=LIMITFORPENS;
             if abs(Summa)<Lim then P:=0.005
                               else P:=0.01;
             S_S:=R10(Summa*P);
        end;
 END;
(*
FUNCTION S_S(S:REAL;WANTED_PERIOD:INTEGER;CURR_PERSON:PERSON_PTR;Wanted_Year:integer):REAL;
 VAR W_Y,I     : INTEGER;
     Y,M,D,DOW : WORD;
     P         : REAL;
     Summa     : REAL;
     Lim       : real;
 BEGIN
      if Wanted_Year<2000 then Wanted_Year:=Wanted_Year+1990;{Error('ЌҐўҐа­л© Ј®¤ ЇаЁ а бзҐвҐ б б '+My_Str_Int(Wanted_Year));}
      if Wanted_Year=2006 then
        if Wanted_Period<4 then Lim:=483
          else Lim:=496     { 2006 }
                          else { 2007 }
        if Wanted_Period<4 then Lim:=525
                           else
        if Wanted_Period<10 then Lim:=561
                            else Lim:=548;

        Lim:=PARSAL[2,Wanted_Period];

        begin
             Summa:=S;
             if Summa>LIMITFORPENS then Summa:=LIMITFORPENS;
             if abs(Summa)<Lim then P:=0.005
                               else P:=0.01;
             S_S:=SUM(Summa*P);
        end;
 END;
*)


  function CompareNalogMode(Shifr:integer;ModeNalog:TModeNalog):boolean;
    var RetVal:boolean;
    begin
         RetVal := false;
         case ModeNalog of
          PodohNalog  : if ShifrList.IsPodoh(Shifr)  then RetVal:=true;
          PensNalog   : if ShifrList.IsPens(Shifr)   then RetVal:=true;
          SSNalog     : if ShifrList.IsS_S(Shifr)    then RetVal:=true;
          FZNalog     : if ShifrList.IsFondZ(Shifr)  then RetVal:=true;
          AlimNach    : if ShifrList.IsPodoh(Shifr)  then RetVal:=true;
          ECBNalog    : if ShifrList.IsECB(Shifr)    then RetVal:=true;
          ECBIllNalog : if ShifrList.IsECBIll(Shifr) then RetVal:=true;
          BOLNach     : if IsBolnShifr(Shifr) then RetVal:=true;
         end;
         CompareNalogMode:=RetVal;
    end;

FUNCTION IsNotBolnOtpShifr(Shifr:integer):boolean;
  var RetVal:boolean;
  begin
       RetVal:=IsOtherPeriodECBShifr(Shifr);
       IsNotBolnOtpShifr:=not RetVal;
  end;

   FUNCTION Nach_Person_For_Nalog_Exl(ModeNalog:TModeNalog;CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR,NmesOld:INTEGER;
                                      Need_To_Chain:boolean):REAL;

    VAR
        I,J,II,N:INTEGER;
        Curr_Add:Add_Ptr;
        Summa:real;
        Found:Boolean;
     function GetStipendia:real;
      var
         Curr_Cn:Cn_Ptr;
         A:real;
      begin
         A:=0;
         Curr_Cn:=Curr_Person^.Cn;
         while (Curr_Cn<>NIL) do
           begin
               if Curr_Cn^.Shifr=STIPENDIJA_SHIFR+LIMIT_CN_BASE then
               if Curr_Cn^.Prim = Dest_Month then A:=A+Curr_Cn^.Summa;
               CURR_CN:=CURR_CN^.NEXT;
           end;;
         GetStipendia:=A;
      end;
     function Distance(Period_Flow,Period_Work,Period_Wanted:integer):integer;
      var I,J,D1,D2:integer;
      begin
           I:=Period_Flow-Period_Work;
           if (I<=0) then I:=I+12;
           if (I<6)  then Distance:=1
                     else Distance:=11;
      end;

    BEGIN
     Summa:=0;
     Curr_Add:=Curr_Person^.Add;
     while (Curr_Add<>Nil) do
      begin
           IF ((Curr_Add^.PERIOD=DEST_MONTH) and
               ((Curr_Add^.YEAR=DEST_YEAR)or
                (Curr_Add^.YEAR+1990=DEST_YEAR)))   or
               ((nmes=dest_month) and
               (IsNotBolnOtpShifr(Curr_Add^.Shifr)))
               THEN
           IF CompareNalogMode(Curr_Add^.Shifr,ModeNalog) then
              begin
                   Summa:=Summa+R10(Curr_Add^.Summa);
              end;
           Curr_Add:=Curr_Add^.NEXT;
      end;
      if ModeNalog=PodohNalog then Summa:=Summa+GetSummaNachForPodohInCn(Curr_Person,Dest_Month)+GetStipendia;
      if ModeNalog=PensNalog  then Summa:=Summa+GetSummaNachForPodohInCn(Curr_Person,Dest_Month);
      if ModeNalog=ECBNalog   then Summa:=Summa+GetSummaNachForPodohInCn(Curr_Person,Dest_Month);
      if ModeNalog=FZNalog then
         begin
              if Is_Pensioner(Curr_Person) then
              if (((Dest_Year>1900) and (Dest_Year<2009)) or
                  ((Dest_Year<100)  and (Dest_Year+1990<2009))) then Summa:=0;
              if DOG_POD_PODRAZD(NSRV) THEN Summa:=0;  { ДЛЯ ДОГОВОРОВ ПОДРЯДА НА СЧИТАТЬ СОЦ.СТРАХ }
         end;
      if ModeNalog=SSNalog then
         if DOG_POD_PODRAZD(NSRV) THEN Summa:=0;  { ДЛЯ ДОГОВОРОВ ПОДРЯДА НА СЧИТАТЬ СОЦ.СТРАХ }


      NACH_PERSON_FOR_NALOG_EXL:=Summa;
 END;


 FUNCTION Nach_Person_For_ECB_OtherMonth_Exl(CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR,NmesOld:INTEGER):REAL;
    VAR
        I,J,II,N:INTEGER;
        Curr_Add:Add_Ptr;
        Summa:real;
        Found:Boolean;
    BEGIN
     Summa:=0;
     Curr_Add:=Curr_Person^.Add;
     while (Curr_Add<>Nil) do
      begin
           IF not ((Curr_Add^.PERIOD = DEST_MONTH) and
               (Curr_Add^.YEAR   = DEST_YEAR)) THEN
           if not ((Curr_Add^.Shifr=HOLIDAY_FLOW_SHIFR)   or
                   (Curr_Add^.Shifr=HOLIDAY_FUTURE_SHIFR) or
                   (Curr_Add^.Shifr=UCH_OTP_SHIFR)) then
           IF ShifrList.IsECB(Curr_Add^.Shifr)then
              Summa:=Summa+R10(Curr_Add^.Summa);
           Curr_Add:=Curr_Add^.NEXT;
      end;
     Nach_Person_For_ECB_OtherMonth_Exl:=Summa;
 END;



   FUNCTION UD_NALOG(ModeNalog:TModeNalog;CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:WORD;NEED_TO_CHAIN:BOOLEAN):REAL;
    VAR
        I,J,II:INTEGER;
        Curr_Ud:Ud_Ptr;
        SUMMA:REAL;
        FOUND:BOOLEAN;
        N:INTEGER;
      function CompareShifr(Shifr:integer;ModeNalog:TModeNalog):boolean;
       var RetVal:boolean;
       begin
             RetVal:=false;
             case ModeNalog of
               PodohNalog : if Shifr=Podoh_Shifr  then RetVal:=true;
               SSNalog    : if Shifr=S_S_Shifr    then RetVal:=true;
               FZNalog    : if Shifr=FOND_Z_SHIFR then RetVal:=true;
               PensNalog  : if Shifr=Pens_Shifr   then RetVal:=true;
               EcbNalog   : if ((Shifr=ECBShifr)  OR
                                (Shifr=ECBNShifr) OR
                                (Shifr=ECBInvShifr)) then RetVal:=true;

             end;
             CompareShifr:=RetVal;
       end;
    BEGIN
        SUMMA:=0.;
        Curr_Ud:=Curr_Person^.Ud;
        while (Curr_Ud<>Nil) do
         begin
              if (CURR_UD^.PERIOD=DEST_MONTH) and
                 (CURR_UD^.YEAR=DEST_YEAR)    and
                 (CompareShifr(Curr_Ud^.Shifr,ModeNalog)) then
                      SUMMA:=SUMMA+R10(CURR_UD^.SUMMA);
              Curr_Ud:=Curr_Ud^.NEXT;
         end;
        if ModeNalog=PodohNalog then Summa:=Summa+GetSummaPodohInCn(Curr_Person,Dest_Month);
        UD_Nalog:=SUMMA;
 END;

   FUNCTION NACH_PERSON_EXL(CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR:INTEGER;NMESOLD:INTEGER;NEED_TO_CHAIN:BOOLEAN):REAL;
    VAR
        CURR_ADD:ADD_PTR;
        SUMMA:REAL;
 FUNCTION GET_STIPENDIJA:REAL;
  VAR
      CURR_CN:CN_PTR;
      A:REAL;
  BEGIN
       A:=0;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) DO
        BEGIN
             IF CURR_CN^.SHIFR=STIPENDIJA_SHIFR+LIMIT_CN_BASE THEN
             IF CURR_CN^.PRIM = DEST_MONTH THEN A:=CURR_CN^.SUMMA;
             CURR_CN:=CURR_CN^.NEXT;
        END;
        GET_STIPENDIJA:=A;
  END;
 FUNCTION DISTANCE(PERIOD_FLOW,PERIOD_WORK,PERIOD_WANTED:INTEGER):INTEGER;
  VAR i:INTEGER;
  BEGIN
       I:=PERIOD_FLOW-PERIOD_WORK;
       IF I<=0 THEN I:=I+12;
       IF I<6 THEN DISTANCE:=1
              ELSE DISTANCE:=11;

  END;
 BEGIN
        SUMMA:=0.;
        Curr_Add:=Curr_Person^.ADD;
        while (Curr_Add<>Nil) DO
          BEGIN
               IF CURR_ADD^.PERIOD=DEST_MONTH THEN
               IF CURR_ADD^.YEAR=DEST_YEAR THEN
               IF ShifrList.IsPodoh(CURR_ADD^.SHIFR) THEN
                  SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
              Curr_Add:=Curr_Add^.Next;
          END;
{        NACH_PERSON_EXL:=SUMMA+GET_STIPENDIJA+GetSummaNachForPodohInCn(Curr_Person,Dest_Month);}
        NACH_PERSON_EXL:=SUMMA+GET_STIPENDIJA;
 END;
   FUNCTION NACH_BOL_PERSON_EXL(CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR:INTEGER):REAL;
    VAR
        CURR_ADD:ADD_PTR;
        SUMMA:REAL;
 BEGIN
        SUMMA:=0.;
        Curr_Add:=Curr_Person^.ADD;
        while (Curr_Add<>Nil) do
          BEGIN
               IF CURR_ADD^.PERIOD=DEST_MONTH THEN
               IF CURR_ADD^.YEAR=DEST_YEAR THEN
               IF ISBOLNSHIFR(CURR_ADD^.SHIFR) THEN SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
               Curr_Add:=Curr_Add^.NEXT;
         END;
        NACH_BOL_PERSON_EXL:=SUMMA;
 END;
   FUNCTION NACH_PERSON_PENS_EXL(CURR_PERSON:PERSON_PTR;DEST_MONTH,DEST_YEAR:INTEGER):REAL;
    VAR
        CURR_ADD:ADD_PTR;
        SUMMA:REAL;
 BEGIN
        SUMMA:=0.;
        Curr_Add:=Curr_Person^.ADD;
        while (Curr_Add<>Nil) DO
           BEGIN
                IF CURR_ADD^.PERIOD=DEST_MONTH THEN
                IF CURR_ADD^.YEAR=DEST_YEAR THEN
                IF ShifrList.ISPENS(CURR_ADD^.SHIFR) THEN SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
                Curr_Add:=Curr_Add^.NEXT;
           END;
{        NACH_PERSON_PENS_EXL:=SUMMA+GetSummaNachForPodohInCn(Curr_Person,Dest_Month);}
        NACH_PERSON_PENS_EXL:=SUMMA;
 END;
 FUNCTION NACH_PERSON_S_S_EXL(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
  VAR
     CURR_ADD:ADD_PTR;
     SUMMA:REAL;
 BEGIN
     NACH_PERSON_S_S_EXL:=0;
     IF  DOG_POD_PODRAZD(NSRV) THEN EXIT;   { ДЛЯ ДОГОВОРОВ ПОДРЯДА НА СЧИТАТЬ СОЦ.СТРАХ }
     SUMMA:=0;
     CURR_ADD:=CURR_PERSON^.ADD;
     WHILE CURR_ADD<>NIL DO
      BEGIN
           IF CURR_ADD^.PERIOD = DEST_MONTH THEN
           IF CURR_ADD^.YEAR   = DEST_YEAR THEN
           IF ShifrList.ISS_S(CURR_ADD^.SHIFR) THEN SUMMA:=SUMMA+r10(CURR_ADD^.SUMMA);
           CURR_ADD:=CURR_ADD^.NEXT;
      END;
    NACH_PERSON_S_s_EXL:=SUMMA;
 END;
   FUNCTION NACH_PERSON_F_Z_EXL(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
    VAR
        CURR_ADD:ADD_PTR;
        SUMMA:REAL;
 BEGIN
     NACH_PERSON_F_Z_EXL:=0;
     if IS_PENSIONER(CURR_PERSON) THEN
        if (((Dest_Year>1900) and (Dest_Year<2009)) or
            ((Dest_Year<100)  and (Dest_Year+1990<2009))) then EXIT;

     IF  DOG_POD_PODRAZD(NSRV) THEN EXIT;   { ДЛЯ ДОГОВОРОВ ПОДРЯДА НА СЧИТАТЬ СОЦ.СТРАХ }
     SUMMA:=0;
     CURR_ADD:=CURR_PERSON^.ADD;
     WHILE CURR_ADD<>NIL DO
      BEGIN
           IF CURR_ADD^.PERIOD = DEST_MONTH THEN
           IF CURR_ADD^.YEAR   = DEST_YEAR THEN
           IF ShifrList.iSFONDz(CURR_ADD^.SHIFR) THEN SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
           CURR_ADD:=CURR_ADD^.NEXT;
      END;
    NACH_PERSON_F_Z_EXL:=SUMMA;
 END;
   FUNCTION NACH_PERSON_ALIMENTY(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
    VAR
        CURR_ADD:ADD_PTR;
        SUMMA:REAL;
 BEGIN
      SUMMA:=0.;
      Curr_Add:=Curr_Person^.ADD;
      while (Curr_Add<>Nil) DO
       BEGIN
            IF CURR_ADD^.PERIOD = DEST_MONTH THEN
            IF CURR_ADD^.YEAR   = DEST_YEAR  THEN
            IF shifrlist.ISPODOH(CURR_ADD^.SHIFR) THEN
                SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
            Curr_Add:=Curr_Add^.NEXT;
       END;
       NACH_PERSON_ALIMENTY:=SUMMA;
 END;
   FUNCTION UD_PODOH(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:WORD;NEED_TO_CHAIN:BOOLEAN):REAL;
    VAR
        CURR_UD:UD_PTR;
        SUMMA:REAL;
    BEGIN
         SUMMA:=0.;
         Curr_Ud:=Curr_Person^.UD;
         while (Curr_Ud<>Nil) DO
           BEGIN
                IF (CURR_UD^.PERIOD=DEST_MONTH) AND
                   (CURR_UD^.YEAR=DEST_YEAR)    AND
                   (CURR_UD^.SHIFR=PODOH_SHIFR) THEN
                    SUMMA:=SUMMA+R10(CURR_UD^.SUMMA);
                Curr_Ud:=Curr_Ud^.Next;
           END;
         UD_PODOH:=SUMMA+GetSummaPodohInCn(Curr_Person,Dest_Month);
 END;
   FUNCTION UD_PENS(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
    VAR
        CURR_UD:UD_PTR;
        SUMMA:REAL;
   BEGIN
        SUMMA:=0.;
        Curr_Ud:=Curr_Person^.UD;
        while (Curr_Ud<>Nil) do
          BEGIN
               IF (CURR_UD^.PERIOD = DEST_MONTH) AND
                  (CURR_UD^.YEAR   = DEST_YEAR) AND
                  (CURR_UD^.SHIFR=PENS_SHIFR) THEN SUMMA:=SUMMA+R10(CURR_UD^.SUMMA);
               Curr_Ud:=Curr_Ud^.NEXT;
          END;
       UD_PENS:=SUMMA+GetSummaPensInCn(Curr_Person,Dest_Month);
 END;
   FUNCTION UD_S_S(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
    VAR
        CURR_UD:UD_PTR;
        SUMMA:REAL;
   BEGIN
        SUMMA:=0.;
        Curr_Ud:=Curr_Person^.UD;
        while (Curr_Ud<>NIl) DO
         BEGIN
              IF (CURR_UD^.PERIOD=DEST_MONTH) AND
                 (CURR_UD^.YEAR=DEST_YEAR)    AND
                 (CURR_UD^.SHIFR=S_S_SHIFR) THEN SUMMA:=SUMMA+R10(CURR_UD^.SUMMA);
              Curr_Ud:=Curr_Ud^.NEXT;
         END;
       UD_S_S:=SUMMA;
   END;
   FUNCTION UD_F_Z(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
    VAR
        CURR_UD:UD_PTR;
        SUMMA:REAL;
   BEGIN
        SUMMA:=0.;
        Curr_Ud:=Curr_Person^.UD;
        while (Curr_Ud<>Nil) do
          BEGIN
               IF (CURR_UD^.PERIOD=DEST_MONTH) AND
                  (CURR_UD^.YEAR=DEST_YEAR) AND
                  (CURR_UD^.SHIFR=FOND_Z_SHIFR) THEN SUMMA:=SUMMA+R10(CURR_UD^.SUMMA);
               Curr_Ud:=Curr_Ud^.NEXT;
          END;
        UD_F_Z:=SUMMA;
   END;
   FUNCTION UD_ALIMENTY(CURR_PERSON:PERSON_PTR;DEST_MONTH:INTEGER;DEST_YEAR:INTEGER):REAL;
    VAR
        CURR_UD:UD_PTR;
        SUMMA:REAL;
    BEGIN
         SUMMA:=0.;
         Curr_Ud:=Curr_Person^.UD;
         while (Curr_Ud<>Nil) do
           BEGIN
                IF (CURR_UD^.PERIOD = DEST_MONTH) AND
                   (CURR_UD^.YEAR   = DEST_YEAR)  AND
                   ((CURR_UD^.SHIFR=ALIMENTY_SHIFR) or
                    (CURR_UD^.SHIFR=PerechPoIspListamShifr)) THEN
                    SUMMA:=SUMMA+R10(CURR_UD^.SUMMA);
                Curr_Ud:=Curr_Ud^.NEXT;
           END;
         UD_ALIMENTY:=SUMMA;
    END;
  PROCEDURE COPY_PERSON(PERSON_FROM:PERSON_PTR;VAR PERSON_TO:PERSON_PTR);
   VAR CURR_S,CURR_SS:SOWM_PTR;
       CURR_A,CURR_AA:ADD_PTR;
       CURR_U,CURR_UU:UD_PTR;
       CURR_C,CURR_CC:CN_PTR;
       NSRV_TMP:Integer;
   BEGIN
        NSRV_TMP:=NSRV;
        MAKE_PERSON(PERSON_TO); {При выбранном втором поле}
        PERSON_TO^:=PERSON_FROM^;
        PERSON_TO^.ADD :=NIL;
        PERSON_TO^.UD  :=NIL;
        PERSON_TO^.SOWM:=NIL;
        PERSON_TO^.CN  :=NIL;
        PERSON_TO^.NEXT:=NIL;
        CURR_S:=PERSON_FROM^.SOWM;
        WHILE CURR_S<>NIL DO
           BEGIN
                MAKE_SOWM(CURR_SS,PERSON_TO);
                CURR_SS^.WHERE:=CURR_S^.WHERE;
                CURR_S:=CURR_S^.NEXT;
           END;
        CURR_A:=PERSON_FROM^.ADD;
        WHILE (CURR_A<>Nil) DO
           BEGIN
                MAKE_ADD(CURR_AA,PERSON_TO);
                CURR_AA^:=CURR_A^;
                CURR_AA^.NEXT:=NIL;
                CURR_A:=CURR_A^.NEXT;
           END;
        CURR_U:=PERSON_FROM^.UD;
        WHILE (CURR_U<>Nil) DO
           BEGIN
                MAKE_UD(CURR_UU,PERSON_TO);
                CURR_UU^:=CURR_U^;
                CURR_UU^.NEXT:=NIL;
                CURR_U:=CURR_U^.NEXT;
           END;
        CURR_C:=PERSON_FROM^.CN;
        WHILE (CURR_C<>Nil) DO
           BEGIN
                MAKE_CN(CURR_CC,PERSON_TO);
                CURR_CC^:=CURR_C^;
                CURR_CC^.NEXT:=NIL;
                CURR_C:=CURR_C^.NEXT;
           END;
        NSRV:=NSRV_TMP;
  END;

Procedure  Calc_Nach_Summy(Curr_Person:Person_Ptr;
                           NmesOld,Start_Month,Start_Year:integer;
                       var Podoh_Nach,Podoh_Ud,
                           Alimenty_Nach,Alimenty_Ud,
                           Pens_Nach,Pens_Ud,
                           S_S_Nach,S_S_Ud,
                           F_Z_Nach,F_Z_Ud,
                           Bol_Nach:Real);
 var A:Real;
 begin
       A:=NACH_PERSON_EXL(Curr_Person,START_MONTH,START_YEAR,NMESOLD,TRUE);
       PODOH_NACH:=PODOH_NACH+A;
       A:=NACH_BOL_PERSON_EXL(Curr_Person,START_MONTH,START_YEAR);
       BOL_NACH:=BOL_NACH+A;
       A:=UD_PODOH(Curr_Person,START_MONTH,START_YEAR,TRUE);
       PODOH_UD:=PODOH_UD+A;
       A:=NACH_PERSON_PENS_EXL(Curr_Person,START_MONTH,START_YEAR);
       PENS_NACH:=PENS_NACH+A;
       A:=UD_PENS(Curr_Person,START_MONTH,START_YEAR);
       PENS_UD:=PENS_UD+A;
       A:=NACH_PERSON_S_S_EXL(Curr_Person,START_MONTH,START_YEAR);
       S_S_NACH:=S_S_NACH+A;
       A:=UD_S_S(Curr_Person,START_MONTH,START_YEAR);
       S_S_UD:=S_S_UD+A;
       A:=NACH_PERSON_F_Z_EXL(Curr_Person,START_MONTH,START_YEAR);
       F_Z_NACH:=F_Z_NACH+A;
       A:=UD_F_Z(Curr_Person,START_MONTH,START_YEAR);
       F_Z_UD:=F_Z_UD+A;
       A:=NACH_PERSON_ALIMENTY(Curr_Person,START_MONTH,START_YEAR);
       ALIMENTY_NACH:=ALIMENTY_NACH+A;
       A:=UD_ALIMENTY(Curr_Person,START_MONTH,START_YEAR);
       ALIMENTY_UD := ALIMENTY_UD + A;
 end;

{ *****************************************}
{ *    Процедура подсчитывает начисления  *}
{ * и подоходный налог для старого места  *}
{ * работы.                               *}
{ *****************************************}
  PROCEDURE ADD_MAIN_FROM(C_PERSON_OSN_2:PERSON_PTR;START_MONTH,START_YEAR,NMESOLD:INTEGER;
                          VAR PODOH_NACH,BOL_NACH,PODOH_UD,
                          ALIMENTY_NACH,ALIMENTY_UD,
                          PENS_NACH,PENS_UD,S_S_NACH,S_S_UD,F_Z_NACH,F_Z_UD:REAL);
   VAR
       C_PERSON:PERSON_PTR;
       SEL:BOOLEAN;
       NSRV_TEMP:INTEGER;
   BEGIN
       IF C_PERSON_OSN_2^.MAIN<2 THEN EXIT;
       SELECT(3);
       NSRV_TEMP:=NSRV;
       NSRV:=Nomer_Serv(C_PERSON_OSN_2^.FROM);
       IF (NSRV<1) OR (NSRV>COUNT_SERV) THEN
          BEGIN
                SELECT(1);
                NSRV:=NSRV_TEMP;
                EXIT;
          END
                                        ELSE
          BEGIN
               MKFLNM;
               IF FILEEXIST(FNINF) THEN
                  BEGIN
                       GETINF(FALSE);
                       SEL:=FALSE;
                       C_Person:=Head_Person;
                       WHILE (C_Person<>Nil) AND (NOT SEL) DO
                        BEGIN
                              IF C_PERSON^.TABNO=C_PERSON_OSN_2^.TABNO THEN
                              IF C_PERSON^.MAIN = 0                    THEN
                                 BEGIN
                                       Calc_Nach_Summy(C_Person,
                                                       NmesOld,Start_Month,Start_Year,
                                                       Podoh_Nach,Podoh_Ud,
                                                       Alimenty_Nach,Alimenty_Ud,
                                                       Pens_Nach,Pens_Ud,
                                                       S_S_Nach,S_S_Ud,
                                                       F_Z_Nach,F_Z_Ud,
                                                       Bol_Nach);

                                 END;
                               C_Person:=C_Person^.NEXT;
                        END; {END OF WHILE }
                       LDEL_PERSON_OLD;
                  END;       {END OF FILEEXIST}
          END;  {BEGIN AFTER ELSE}
       SELECT(1);
       NSRV:=NSRV_TEMP;
   END;
{ *****************************************}
{ *    Процедура подсчитывает начисления  *}
{ * и подоходный налог для всех совмещений*}
{ *****************************************}
 PROCEDURE COUNT_SOWM_FIELD(C_PERSON_OSN_2,CURR_PERSON:PERSON_PTR;START_MONTH,START_YEAR,NSRV_IN_FIELD_1:INTEGER;
                            VAR PODOH_NACH,BOL_NACH,PODOH_UD,
                            ALIMENTY_NACH,ALIMENTY_UD,
                            PENS_NACH,PENS_UD,S_S_NACH,S_S_UD,F_Z_NACH,F_Z_UD:REAL;
                            NSRV_IN_FIELD_2:INTEGER;
                            WORK_MONTH:INTEGER);
  VAR I,W_Y:INTEGER;
      C_PERSON:PERSON_PTR;
      CURR_SOWM:SOWM_PTR;
      DEJA_PTR:INTEGER;
      DEJA_COUNT:ARRAY[1..2,1..MAX_deja] OF INTEGER;
      J:INTEGER;
      NSRV_TEMP:INTEGER;
      IN_FIELD_3:BOOLEAN;
 {============================================================================== }
 {Процедура удаляет из заданного поля всех персон кроме заданной с совмещениями  }
 {============================================================================== }
 PROCEDURE DELETE_ALL_PERSON_EXEPT_SOWM(CURR_PERSON:PERSON_PTR);
  VAR C_PERSON:PERSON_PTR;
      DONE:BOOLEAN;
  BEGIN
       REPEAT
             DONE:=TRUE;
             C_PERSON:=INIT_PERSON_ITERATOR;
             IF C_PERSON<>NIL THEN
             REPEAT
                   IF (C_PERSON^.TABNO<>CURR_PERSON^.TABNO  )  OR
                      (NOT (C_PERSON^.MAIN IN [1,3]))         THEN
                      BEGIN
                            DONE:=FALSE;
                            DEL_PERSON(C_PERSON);
                      END
                                                             ELSE
                      IF GET_NEXT_PERSON_ITERATOR(C_PERSON) THEN;
             UNTIL (C_PERSON=NIL) OR (KZ<0) OR (NOT DONE);
       UNTIL DONE;
  END;
 PROCEDURE COPY_FIELD2_TO_FIELD3(FIELD_NUMBER:INTEGER;C_PERSON_OSN_2:PERSON_PTR);
  VAR
      PERSON_FROM,PERSON_TO:PERSON_PTR;
{ Начало процедуры COPY_FIELD2_TO_FIELD3 }
  BEGIN
       SELECT(FIELD_NUMBER);
       PERSON_FROM:=INIT_PERSON_ITERATOR;
       KZ:=0;
       IF PERSON_FROM=NIL THEN BEGIN KZ:=-1; EXIT;  END;
       SELECT(3);
       LDEL_PERSON_OLD;
       REPEAT
              IF (PERSON_FROM^.TABNO=C_PERSON_OSN_2^.TABNO) THEN
                 BEGIN
                       IF (PERSON_FROM^.WID_RABOTY=SOWM_WID_RABOTY ) THEN
                          COPY_PERSON(PERSON_FROM,PERSON_TO);
                  END;
              IF GET_NEXT_PERSON_ITERATOR(PERSON_FROM) THEN;
       UNTIL (PERSON_FROM=NIL);
  END;
  PROCEDURE IN_DEJA_COUNT(MESTO,NUMBER:INTEGER);
   BEGIN
        DEJA_PTR:=DEJA_PTR+1;
        DEJA_COUNT[1,DEJA_PTR]:=MESTO;
        DEJA_COUNT[2,DEJA_PTR]:=NUMBER;
   END;
  FUNCTION IS_IN_DEJA_COUNT(MESTO,NUMBER:INTEGER):BOOLEAN;
   VAR I:INTEGER;
       FOUND:BOOLEAN;
   BEGIN
        FOUND:=FALSE;
        IF DEJA_PTR>0 THEN
           BEGIN
            I:=0;
            WHILE (NOT FOUND) AND (I<=DEJA_PTR) DO
             BEGIN
                  I:=I+1;
                  IF (DEJA_COUNT[1,I]=MESTO) AND (DEJA_COUNT[2,I]=NUMBER) THEN FOUND:=TRUE;
             END;
           END;
        IF FOUND THEN IS_IN_DEJA_COUNT:=TRUE ELSE IS_IN_DEJA_COUNT:=FALSE;
   END;
   BEGIN
       W_Y:=1996;
       VAL(WORK_YEAR,W_Y,I);
      DEJA_PTR:=1;
      FillChar(DEJA_COUNT,SizeOf(DEJA_COUNT),0);
{ Занести сотрудника как уже подсчитанного }
{      IF CURR_PERSON^.WID_RABOTY=SOWM_WID_RABOTY THEN
      IF WORK_MONTH=NMES                         THEN
        BEGIN
              SELECT(1);
              I_S:=COUNT_PERSON;
              SEL:=FALSE;
              I:=0;
              WHILE (I<I_S) AND (NOT SEL) DO
               BEGIN
                    I:=I+1;
                    IF I=1 THEN C_PERSON:=HEAD_PERSON
                           ELSE C_PERSON:=C_PERSON^.NEXT;
                    IF C_PERSON=CURR_PERSON THEN BEGIN J:=I; SEL:=TRUE; END;
               END;
              IF SEL THEN BEGIN
                                DEJA_PTR:=1;
                                DEJA_COUNT[1,1]:=NSRV_IN_FIELD_1;
                                DEJA_COUNT[2,1]:=J;
                          END;
        END;      }
      NSRV_TEMP:=NSRV;
      SELECT(2);
      IF COUNT_SOWM(C_PERSON_OSN_2)<=0 THEN BEGIN SELECT(1); EXIT; END;
      Curr_Sowm:=C_Person_OSN_2^.SOWM;
      WHILE (Curr_Sowm<>Nil) DO
          BEGIN
                SELECT(3);
                NSRV_TEMP:=NSRV;
                NSRV:=NOMER_SERV(CURR_SOWM^.WHERE);
                IF ((NSRV IN [1..MAX_COUNT_PODRAZD]) and  // материальную помощь не учитывать 11 10 2010
                    (not ((nsrv=105) or (nsrv=106)))) THEN
                   BEGIN
                        MKFLNM;
                        IF (NSRV=NSRV_IN_FIELD_2) AND (WORK_MONTH=NMES) THEN
                           BEGIN
                                COPY_FIELD2_TO_FIELD3(2,C_PERSON_OSN_2);
                                SELECT(3);
                                IN_FIELD_3:=TRUE;
                           END
                                                ELSE
                           BEGIN
                                IF (WORK_MONTH=NMES) AND (NSRV=NSRV_IN_FIELD_1) THEN
                                   BEGIN
                                        COPY_FIELD2_TO_FIELD3(1,C_PERSON_OSN_2);
                                        SELECT(3);
                                        IN_FIELD_3:=TRUE;
                                   END
                                                                                ELSE
                                   BEGIN
                                        IN_FIELD_3:=TRUE;
                                        SELECT(3);
                                        IF FILEEXIST(FNINF) THEN
                                           BEGIN
                                                SET_UP_FOR_PODOH_SOWM_SEARCH(C_PERSON_OSN_2);
                                                GETINF(FALSE);
                                           END
                                                            ELSE IN_FIELD_3:=FALSE;
                                   END;
                           END; {END CASE}
                        IF IN_FIELD_3 THEN
                           BEGIN
                                DELETE_ALL_PERSON_EXEPT_SOWM(C_PERSON_OSN_2);
                                C_PERSON:=HEAD_PERSON;
                                J:=0;
                                WHILE (C_PERSON<>NIL){ AND (NOT SEL)} DO
                                   BEGIN
                                        INC(J);
                                        IF C_PERSON^.TABNO = C_PERSON_OSN_2^.TABNO THEN
                                        IF C_PERSON^.WID_RABOTY = SOWM_WID_RABOTY  THEN
                                        IF NOT IS_IN_DEJA_COUNT(NSRV,J)            THEN
                                           BEGIN
                                                IN_DEJA_COUNT(NSRV,J);

                                                Calc_Nach_Summy(C_Person,
                                                                work_Month,Start_Month,Start_Year,
                                                                Podoh_Nach,Podoh_Ud,
                                                                Alimenty_Nach,Alimenty_Ud,
                                                                Pens_Nach,Pens_Ud,
                                                                S_S_Nach,S_S_Ud,
                                                                F_Z_Nach,F_Z_Ud,
                                                                Bol_Nach);
                                           END;
                                        C_Person:=C_Person^.NEXT;
                                    END;
                                  IF NSRV<>NSRV_IN_FIELD_1 THEN
{                                     IF DEL_FLAG THEN PUTINF;}
                                   LDEL_PERSON_OLD;
                           END;         {IF FILEEXIST}
                   END;      {IF (NSRV>0) AND (NSRV<=COUNT_SERV)}
                Curr_Sowm:=Curr_Sowm^.NEXT;
          END;    {FOR I:=1 TO I_S}
      SELECT(1);
      NSRV:=NSRV_TEMP;
   END;

{ *****************************************}
{ *    Процедура подсчитывает начисления  *}
{ * и подоходный налог для основного места*}
{ * работы.                               *}
{ *****************************************}
 PROCEDURE COUNT_MAIN_FIELD(C_PERSON_OSN_2:PERSON_PTR;START_MONTH,START_YEAR,NMESOLD:INTEGER;
                            VAR PODOH_NACH,BOL_NACH,PODOH_UD,
                                ALIMENTY_NACH,ALIMENTY_UD,
                                PENS_NACH,PENS_UD,S_S_NACH,S_S_UD,F_Z_NACH,F_Z_UD:REAL;
                                VAR KOL_WO_DETEJ:INTEGER);
  VAR I,W_Y:INTEGER;
  BEGIN
       W_Y:=1996;
       VAL(WORK_YEAR,W_Y,I);
       IF I<>0 THEN W_Y:=1996;
       IF NMES=START_MONTH THEN KOL_WO_DETEJ:=C_PERSON_OSN_2^.MALO;
       Calc_Nach_Summy(C_Person_Osn_2,NmesOld,Start_Month,W_Y,
                       Podoh_Nach,Podoh_Ud,
                       Alimenty_Nach,Alimenty_Ud,
                       Pens_Nach,Pens_Ud,
                       S_S_Nach,S_S_Ud,
                       F_Z_Nach,F_Z_Ud,
                       Bol_Nach);

  END;
{ *************************************************************************************************}
{ *    Процедура настраивает поля                                                                 *}
{ *-----------------------------------------------------------------------------------------------*}
{ * FIELD 1 - главное рабочее поле персоны (сюда результата) - REZULT_FIELD                       *}
{ * FIELD 2 - поле для основного места раб (здесь производятся пересчеты) - WORK_FIELD            *}
{ * FIELD 3 - поле для совмещений          (здесь поле других мес. осн.место работы) - OSN_FIELD  *}
{ * FIELD 4 - поле для совмещений          (здесь поле других мес.совм.место работы) - SOWM_FIELD *}
{ *************************************************************************************************}
PROCEDURE  SET_UP_FIELDS_FOR_NALOG(CURR_PERSON:PERSON_PTR;START_MONTH,START_YEAR,NMESOLD:INTEGER;
                                   VAR NSRV_OSN:INTEGER;
                                   VAR C_PERSON_OSN_2:PERSON_PTR);
 PROCEDURE COPY_FIELD1_TO_FIELD2;
  VAR
      PERSON_FROM,PERSON_TO:PERSON_PTR;
{ Начало процедуры COPY_FIELD1_TO_FIELD2 }
  BEGIN
       NSRV_OSN:=NSRV;
       KZ:=0;
       PERSON_FROM:=INIT_PERSON_ITERATOR;
       IF PERSON_FROM=NIL THEN BEGIN KZ:=-1; EXIT;  END;
       SELECT(2);
       REPEAT
             IF (PERSON_FROM^.TABNO =CURR_PERSON^.TABNO)  THEN
             IF (PERSON_FROM^.MAIN IN [1,2,3])                 THEN
                 COPY_PERSON(PERSON_FROM,PERSON_TO);
             IF GET_NEXT_PERSON_ITERATOR(PERSON_FROM) THEN;
       UNTIL {(DONE) OR} (PERSON_FROM=NIL) OR (KZ<0);
       KZ:=0;
       SELECT(1);
  END;
 { ++++++++++++++++++++++++++++++++++++++++++++++++ }
 { + Процедура читает в  FIELD2 основное место    + }
 { + работы сотрудника CURR_PERSON.               + }
 { ++++++++++++++++++++++++++++++++++++++++++++++++ }
 PROCEDURE READ_OSN_MESTO_TO_FIELD2;
  VAR
       NSRV_TEMP:INTEGER;
  BEGIN
       NSRV_OSN:=Nomer_Serv(CURR_PERSON^.MESTO_OSN_RABOTY);
       IF NSRV_OSN IN [1..MAX_COUNT_PODRAZD] THEN
          BEGIN
               NSRV_TEMP:=NSRV;
               SELECT(2);
               NSRV:=NSRV_OSN;
               MKFLNM;
               IF FILEEXIST(FNINF) THEN
                  BEGIN
                        GETINF(FALSE);
                        SELECT(1);
                        NSRV:=NSRV_TEMP;
                        MKFLNM;
                  END
                                   ELSE
                  KZ:=-1;
          END
                                               ELSE
          BEGIN
               KZ:=-1;
          END;
  END;
 { ++++++++++++++++++++++++++++++++++++++++++++++++ }
 { + Процедура находит в FIELD2 основнуго сотруд- + }
 { + ника для пересчета подоходного налога.       + }
 { ++++++++++++++++++++++++++++++++++++++++++++++++ }
  PROCEDURE FIND_OSN_2;
   VAR SEL:BOOLEAN;
   BEGIN
      SELECT(2);
       SEL:=FALSE;
       C_PERSON_OSN_2:=HEAD_PERSON;
       WHILE (C_PERSON_OSN_2<>NIL) AND (NOT SEL) DO
        BEGIN
              IF C_PERSON_OSN_2^.TABNO=CURR_PERSON^.TABNO  THEN
              IF C_PERSON_OSN_2^.WID_RABOTY=OSN_WID_RABOTY THEN
              IF C_PERSON_OSN_2^.MAIN>0                    THEN  SEL:=TRUE;
              IF NOT SEL THEN C_PERSON_OSN_2:=C_PERSON_OSN_2^.NEXT;
        END;
       IF SEL THEN KZ:=0 ELSE
          BEGIN
{
               ERROR('Сотрудник '+ALLTRIM(CURR_PERSON^.FIO)+
                     ', таб. номер - '+MY_STR_INT(CURR_PERSON^.TABNO)+
                     ' в '+ALLTRIM(MONTH[NMES])+
                     ' не найден по основному месту работы в '+ALLTRIM(NAME_SERV(NSRV_OSN)));
}
               KZ:=-1;
          END;
   END;
 {======================================================================================= }
 {Процедура удаляет из заданного поля всех персон кроме заданной с основным местом работы }
 {======================================================================================= }
 PROCEDURE DELETE_ALL_PERSON_EXEPT(CURR_PERSON:PERSON_PTR);
  VAR C_PERSON:PERSON_PTR;
      DONE:BOOLEAN;
  BEGIN
       REPEAT
             DONE:=TRUE;
             C_PERSON:=INIT_PERSON_ITERATOR;
             IF C_PERSON<>NIL THEN
             REPEAT
                   IF NOT ((C_PERSON^.TABNO=CURR_PERSON^.TABNO)  AND
{                      (C_PERSON^.WID_RABOTY<>OSN_WID_RABOTY) OR}
                      (C_PERSON^.MAIN IN [1,2,3]))                    THEN
                      BEGIN
                            DONE:=FALSE;
                            DEL_PERSON(C_PERSON);
                      END
                                                             ELSE
                      IF GET_NEXT_PERSON_ITERATOR(C_PERSON) THEN;
             UNTIL (C_PERSON=NIL) OR (KZ<0) OR (NOT DONE);
       UNTIL DONE;
  END;
 {Начало процедуры SET_UP_FIELDS_FOR_NALOG}
 BEGIN
       IF (((CURR_PERSON^.WID_RABOTY=1) OR
           ((CURR_PERSON^.WID_RABOTY=2) AND (Nomer_Serv(CURR_PERSON^.MESTO_OSN_RABOTY)=NSRV)))
           AND (NMES=NMESOLD)) THEN
            BEGIN
                 COPY_FIELD1_TO_FIELD2;
            END
                               ELSE
            BEGIN
                 READ_OSN_MESTO_TO_FIELD2;
            END;
       IF KZ<0 THEN EXIT;
       SELECT(2);
       DELETE_ALL_PERSON_EXEPT(CURR_PERSON);
       FIND_OSN_2;
       IF KZ<0 THEN
          BEGIN
{              ERROR('При копировании не найден сотрудник');
}              SELECT(2);
               LDEL_PERSON_OLD;
          END;
 END;
 { ************************************************ }
 { * Процедура уничтожает инф-ю в FIELD1 и FIELD2 * }
 { ************************************************ }
 PROCEDURE DELETE_ADDED_FIELD;
  BEGIN
        SELECT(2);
        WHILE (HEAD_PERSON<>NIL) DO DEL_PERSON(HEAD_PERSON);
        SELECT(3);
        WHILE (HEAD_PERSON<>NIL) DO DEL_PERSON(HEAD_PERSON);
        SELECT(1);
  END;
FUNCTION MUST_ALIMENTY(VAR FLOW:INTEGER;VAR PROC:REAL;CURR_PERSON:PERSON_PTR;VAR PRM:INTEGER;var A_SHIFR:Integer;var SUMMAABS:Real):BOOLEAN;
 VAR
     I:INTEGER;
     SEL:BOOLEAN;
     CURR_CN:CN_PTR;
 BEGIN
       SEL      := FALSE;
       I        := 0;
       PROC     := 0;
       SUMMAABS := 0;
       curr_cn  := Curr_person^.cn;
       WHILE (curr_cn<>nil) AND (NOT SEL) DO
        BEGIN
              inc(i);
              IF (I>=FLOW) THEN
              IF (CURR_CN^.SHIFR=ALIMENTY_SHIFR) OR
                 (CURR_CN^.SHIFR=ALIMENTY_SHIFR+SHIFT_SHIFR) OR
                 (CURR_CN^.SHIFR=ALIMENTY_M_U_SHIFR) OR
                 (CURR_CN^.SHIFR=ALIMENTY_M_U_SHIFR+SHIFT_SHIFR) OR
                 (CURR_CN^.SHIFR=PerechPoIspListamShifr) OR
                 (CURR_CN^.SHIFR=PerechPoIspListamShifr+SHIFT_SHIFR) THEN
              IF ((CURR_CN^.KOD = 3) or (CURR_CN^.KOD = 1))          THEN
                 BEGIN
                       SEL      := TRUE;
                       PROC     := 0;
                       SUMMAABS := 0;
                       IF CURR_CN^.KOD  = 3 THEN
                          PROC     := CURR_CN^.SUMMA/100
                       else   {KOD=1}
                          SUMMAABS := CURR_CN^.SUMMA;
                       PRM      := CURR_CN^.PRIM;
                       FLOW     := FLOW+I;
                       A_SHIFR  := CURR_CN^.SHIFR;
                       if A_SHIFR>SHIFT_SHIFR then
                          A_SHIFR:=A_SHIFR-SHIFT_SHIFR;
                       break;
                 END;
              curr_cn:=curr_cn^.next;
        END;
       MUST_ALIMENTY:=SEL;
 END;



(*{$I SCRCUP}*)






PROCEDURE GET_SUMMY_FROM_FB(TABNO,P,Y:INTEGER;
                             VAR PODOH_NACH :REAL;VAR PODOH_UD:REAL;
                             VAR ALIMENTY_NACH :REAL;VAR ALIMENTY_UD:REAL;
                             VAR PENS_NACH :REAL;VAR PENS_UD:REAL;
                             VAR S_S_NACH :REAL;VAR S_S_UD:REAL;
                             VAR F_Z_NACH :REAL;VAR F_Z_UD:REAL);
 BEGIN
{
      PODOH_NACH    := 0;
      PODOH_UD      := 0;
      ALIMENTY_NACH := 0;
      ALIMENTY_UD   := 0;
      PENS_NACH     := 0;
      PENS_UD       := 0;
      S_S_NACH      := 0;
      S_S_UD        := 0;
      F_Z_NACH      := 0;
      F_Z_UD        := 0;
}
      if Y<1000 then Y:=Y+1990;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('SELECT FIRST 1 SUMMAADDPOD,SUMMAUDPOD,'+
                            'SUMMAADDALIM,SUMMAUDALIM,'+
                            'SUMMAADDPENS,SUMMAUDPENS,'+
                            'SUMMAADDSS,SUMMAUDSS,'+
                            'SUMMAADDFZ,SUMMAUDFZ '+
                            'FROM GETSUMMYRASPERSON('+Trim(IntToStr(Tabno))+','+
                             Trim(IntToStr(Y))+','+
                             Trim(IntToStr(P))+')');
      FIB.pFIBTransactionSAL.StartTransaction;
      try
         FIB.pFIBQuery.ExecQuery;
         Podoh_Nach    := Podoh_Nach    + FIB.pFIBQuery.Fields[0].AsFloat;
         Podoh_Ud      := Podoh_Ud      + FIB.pFIBQuery.Fields[1].AsFloat;
         ALIMENTY_Nach := ALIMENTY_Nach + FIB.pFIBQuery.Fields[2].AsFloat;
         ALIMENTY_Ud   := ALIMENTY_Ud   + FIB.pFIBQuery.Fields[3].AsFloat;
         Pens_Nach     := Pens_Nach     + FIB.pFIBQuery.Fields[4].AsFloat;
         Pens_Ud       := Pens_Ud       + FIB.pFIBQuery.Fields[5].AsFloat;
         S_S_Nach      := S_S_Nach      + FIB.pFIBQuery.Fields[6].AsFloat;
         S_S_Ud        := S_S_Ud        + FIB.pFIBQuery.Fields[7].AsFloat;
         F_Z_Nach      := F_Z_Nach      + FIB.pFIBQuery.Fields[8].AsFloat;
         F_Z_Ud        := F_Z_Ud        +  FIB.pFIBQuery.Fields[9].AsFloat;
         FIB.pFIBQuery.Close;
      except
        else 
         FIB.pFIBTransactionSAL.Rollback;
         MessageDlg('Ошибка выборки сумм под.налога',
                    mtInformation, [mbOk], 0);
      end;
      FIB.pFIBTransactionSAL.Commit;
 END;

 PROCEDURE GET_SUMMY_FOR_PODOH(CURR_PERSON:PERSON_PTR;N_SERV:INTEGER;PERIOD:INTEGER;YEAR:INTEGER;
                               VAR PODOH_NACH,PODOH_UD,ALIMENTY_NACH,ALIMENTY_UD,PENS_NACH,PENS_UD,S_S_NACH,S_S_UD,
                               F_Z_NACH,F_Z_UD:REAL);
  BEGIN
        GET_SUMMY_FROM_FB(Curr_Person^.TABNO,PERIOD,YEAR,
                          PODOH_NACH, PODOH_UD,
                          ALIMENTY_NACH,ALIMENTY_UD,
                          PENS_NACH,PENS_UD,
                          S_S_NACH,S_S_UD,
                          F_Z_NACH,F_Z_UD);
  END;
FUNCTION COUNT_SBOR(CURR_PERSON:PERSON_PTR):REAL;
 VAR C_UD:UD_PTR;
     I:INTEGER;
 BEGIN
      I:=0;
      C_UD:=CURR_PERSON^.UD;
      WHILE (C_UD<>NIL) DO
       BEGIN
            IF C_UD^.SHIFR=P_SBOR_V_LUGANSK_SHIFR THEN INC(I);
            C_UD:=C_UD^.NEXT;
       END;
      COUNT_SBOR:=I;
 END;
FUNCTION POCHTOW_SBOR(SUMMA:REAL;MODE:INTEGER):REAL;
 VAR PROCENT_POCHTOW_SBOR:REAL;
     CODE_PROC:REAL;
 BEGIN
       IF ABS(SUMMA)<0.0099 THEN BEGIN POCHTOW_SBOR:=0; EXIT; END;
       CODE_PROC:=0;
       PROCENT_POCHTOW_SBOR:=GET_PROCENT_POCHTOW_SBOR(SUMMA,MODE,CODE_PROC);
       IF ABS(PROCENT_POCHTOW_SBOR)<0.1 THEN  POCHTOW_SBOR:=0.9
          ELSE POCHTOW_SBOR:=R10(SUMMA*PROCENT_POCHTOW_SBOR/100);
 END;
PROCEDURE MAKE_POCHTOW_SBOR(CURR_PERSON:PERSON_PTR;CURR_UD:UD_PTR;A_A:real);
 VAR C_UD:UD_PTR;
     DONE:BOOLEAN;
     WANTED_SHIFR:INTEGER;
     MODE,TEMP_PERIOD,TEMP_WHO:INTEGER;
     SBOR,A:REAL;
     I:integer;
 FUNCTION DEJA_VYPLACHENO_SBOR:REAL;
  VAR SUMMA:REAL;
      C_UD:UD_PTR;
  BEGIN
       SUMMA:=0;
       C_UD:=CURR_PERSON^.UD;
       WHILE (C_UD<>NIL) DO
        BEGIN
             IF C_UD^.SHIFR      = WANTED_SHIFR        THEN
             IF C_UD^.PERIOD     = CURR_UD^.PERIOD     THEN
             IF C_UD^.WHO        = CURR_UD^.WHO        THEN
             IF C_UD^.VYPLACHENO = GET_OUT             THEN
                SUMMA:=SUMMA+C_UD^.SUMMA;
             C_UD:=C_UD^.NEXT;
        END;
       DEJA_VYPLACHENO_SBOR:=SUMMA;
  END;
 BEGIN
     I:=CURR_UD^.WHO;
     MODE:=GET_ALIMENTY_MODE(I);
     DONE:=FALSE;
     IF NOT (MODE IN [1,2]) THEN EXIT;
     IF MODE=1 THEN WANTED_SHIFR:=P_SBOR_V_LUGANSK_SHIFR
               ELSE WANTED_SHIFR:=P_SBOR_VNE_LUGANSKA_SHIFR;
     TEMP_PERIOD := CURR_UD^.PERIOD;
     TEMP_WHO    := CURR_UD^.WHO;
     REPEAT
           DONE:=FALSE;
           C_UD:=CURR_PERSON^.UD;
           WHILE (C_UD<>NIL) AND (NOT(DONE)) DO
            BEGIN
                 IF C_UD^.SHIFR      = WANTED_SHIFR     THEN
                 IF C_UD^.PERIOD     = CURR_UD^.PERIOD  THEN
                 IF C_UD^.WHO        = CURR_UD^.WHO     THEN
                 IF C_UD^.VYPLACHENO = NOT_GET_OUT      THEN
                    BEGIN
                          DEL_UD(C_UD,CURR_PERSON);
                          DONE:=TRUE;
                    END;
                 IF NOT DONE THEN C_UD:=C_UD^.NEXT;
            END;
     UNTIL NOT DONE;
{     SBOR:=POCHTOW_SBOR(CURR_UD^.SUMMA,MODE);}
     SBOR:=POCHTOW_SBOR(A_A,MODE);
     A:=SBOR-DEJA_VYPLACHENO_SBOR;
     IF ABS(A)>0.0099 THEN
        BEGIN
             MAKE_UD(C_UD,CURR_PERSON);
             C_UD^.SHIFR  := WANTED_SHIFR;
             C_UD^.PERIOD := TEMP_PERIOD;
             C_UD^.WHO    := TEMP_WHO;
             C_UD^.SUMMA   := R10(A);
        END;
 END;
PROCEDURE MAKE_PERSON_PODOH(CURR_PERSON:PERSON_PTR;
                            KOL_WO_DETEJ:INTEGER;
                            START_MONTH:INTEGER;
                            START_YEAR:INTEGER;
                            PODOH_NACH      ,
                            BOL_NACH        ,
                            PODOH_UD        ,
                            ALIMENTY_NACH   ,
                            ALIMENTY_UD     ,
                            PENS_NACH       ,
                            PENS_UD         ,
                            PENS_SELF_NACH ,
                            PENS_SELF_UD   ,
                            S_S_NACH       ,
                            S_S_UD         ,
                            S_S_SELF_NACH  ,
                            S_S_SELF_UD    ,
                            F_Z_NACH       ,
                            F_Z_UD         ,
                            F_Z_SELF_NACH  ,
                            F_Z_SELF_UD    ,
                            ECBN_NACH      ,
                            ECBN_UD        ,
                            ECB_NACH       ,
                            ECB_UD         ,
                            ECB_DP_NACH    ,
                            ECB_DP_UD      ,
                            ECB_SELF_NACH  ,
                            ECB_SELF_UD    ,
                            ECB_ILL_NACH   ,
                            ECB_ILL_UD     ,
                            ECB_ILL_SELF_NACH,
                            ECB_ILL_SELF_UD: REAL);

 VAR
     B,A,PODOH_NALOG,ADD_PODOH,ADD_PODOH_I,ADD_MALO,ADD_ALIM,PROC:REAL;
     TOTAL_PODOH,TOTAL_PROC:REAL;
     PENS_NALOG,ADD_PENS:REAL;
     S_S_NALOG,ADD_S_S:REAL;
     ECB_NALOG,ADD_ECB:REAL;
     ECB_ILL_NALOG,ADD_ECB_ILL:REAL;
     ECB_DP_NALOG,ADD_ECB_DP:REAL;
     CURR_ADD : ADD_PTR;
     CURR_UD  : UD_PTR;
     PRIM     : INTEGER;
     PROC_S_S : real;
     P        : Real;
     w_y,i    : integer;
     A_A,U_U  : REAL;
     K        : INTEGER;
     PROC_SOWM:REAL;
     F_Z_NALOG,ADD_F_Z:REAL;
     ECBP     : real;
     WantedECBShifr : integer;
     A_Shifr  : Integer;
     SUMMAABSALIM : REAL;
 FUNCTION GET_SELF_SUMMA:REAL;
  VAR a_a:REAL;
  BEGIN
       A_A:=0;
       CURR_ADD:=CURR_PERSON^.ADD;
       WHILE (CURR_ADD<>NIL) DO
             BEGIN
                  IF CURR_ADD^.PERIOD=START_MONTH THEN
                      A_A:=A_A+CURR_ADD^.SUMMA;
                  CURR_ADD:=CURR_ADD^.NEXT;
             END;
       GET_SELF_SUMMA:=A_A;
  END;
 FUNCTION GET_SELF_SUMMA_FOR_PODOH:REAL;
  VAR a_a:REAL;
  BEGIN
       A_A:=0;
       CURR_ADD:=CURR_PERSON^.ADD;
       WHILE (CURR_ADD<>NIL) DO
             BEGIN

                  IF CURR_ADD^.PERIOD=START_MONTH THEN
                  if CompareNalogMode(CURR_ADD^.SHIFR,PodohNalog) then
                      A_A:=A_A+CURR_ADD^.SUMMA;
                  CURR_ADD:=CURR_ADD^.NEXT;
             END;
       GET_SELF_SUMMA_FOR_PODOH:=A_A;
  END;
 FUNCTION GET_SELF_UD_SUMMA:REAL;
  VAR U_U:REAL;
  BEGIN
       CURR_UD:=CURR_PERSON^.UD;
       U_U:=0;
       WHILE (CURR_UD<>NIL) DO
        BEGIN
             IF CURR_UD^.SHIFR=PODOH_SHIFR  THEN
             IF CURR_UD^.PERIOD=START_MONTH THEN
                U_U:=U_U+CURR_UD^.SUMMA;
             CURR_UD:=CURR_UD^.NEXT;
        END;
      GET_SELF_UD_SUMMA:=u_u;
  END;
 FUNCTION GET_SELF_UD_ECB_ILL_SUMMA:REAL;
  VAR U_U:REAL;
  BEGIN
       CURR_UD:=CURR_PERSON^.UD;
       U_U:=0;
       WHILE (CURR_UD<>NIL) DO
        BEGIN
             IF CURR_UD^.SHIFR=ECBILLSHIFR  THEN
             IF CURR_UD^.PERIOD=START_MONTH THEN
                U_U:=U_U+CURR_UD^.SUMMA;
             CURR_UD:=CURR_UD^.NEXT;
        END;
      GET_SELF_UD_ECB_ILL_SUMMA:=u_u;
  END;
  function GetECBShifr(Curr_Person:Person_Ptr):integer;
   var RetVal:integer;
       NeedTable:boolean;
   begin
       if WantedECBShifr>0 then
          begin
               GetECBShifr := WantedECBShifr;
               Exit;
          end;
       RetVal:=ECBShifr;
       NeedTable:=false;
       if (GetOsnKateg(Curr_Person)=TEACHER_KATEGORIJA) and
          (not IsColedgPodr(Nsrv)) and {УБРАТЬ ТЕХНИКУМ}
          (not IS_NotFond5(Curr_Person)) then NeedTable:=true
                                               else
       if Is_Fond5(Curr_Person) then NeedTable:=true;
       if NeedTable then
          RetVal:=ECBNShifr;
       GetECBShifr := RetVal;
   end;

{
 function GetFZForPodoh(Curr_Person:Person_Ptr;Start_Year,Start_Month:integer;Pens_Nach:real):real;
  var RetVal:Real;
  begin
       RetVal:=0;
       if ((Start_Year+1990=2009) and (Start_Month=1)) then
          if IS_PENSIONER(Curr_Person) then
             RetVal:=R10(Pens_Nach/20*13*0.006)
          else
             RetVal:=R10((Pens_Nach/20*7*0.005) + (Pens_Nach/20*13*0.006))
       else if Start_Year+1990<2009 then
               if Is_Pensioner(Curr_Person) then RetVal:=0
                                         else  RetVal:=R10(Pens_Nach*0.005)
       else
            RetVal:=R10(Pens_Nach*0.006);
       GetFZForPodoh := RetVal;
  end;
}
 BEGIN
      ECB_NALOG      := 0;
      ADD_ECB        := 0;
      ECB_ILL_NALOG  := 0;
      ADD_ECB_ILL    := 0;
      ECB_DP_NALOG   := 0;
      ADD_ECB_DP     := 0;
      WantedECBShifr := 0;
      ECBP           := 0;
      F_Z_NALOG      := 0;
      PROC_SOWM      := 0.15;
      I:=1;
      IF RECENZENT_PODRAZD(Nomer_Serv(CURR_PERSON^.MESTO_OSN_RABOTY))  OR
         RECENZENT_PODRAZD(NSRV)                           THEN
         BEGIN
              {  1. Cоовместители - рецензенты }
                PENS_NALOG :=PENS(PENS_NACH,START_MONTH,START_YEAR,CURR_PERSON);
                ADD_PENS:=PENS_NALOG-PENS_UD;

                S_S_NALOG := S_S(S_S_NACH,START_MONTH,CURR_PERSON,START_YEAR);
                ADD_S_S   := S_S_NALOG - S_S_UD;
                F_Z_NALOG := FOND_Z(CURR_PERSON,F_Z_NACH,START_MONTH,START_YEAR);
                ADD_F_Z   :=  F_Z_NALOG - F_Z_UD;

                ECBP := GetProcECBNalogDirect(CURR_PERSON,START_MONTH,START_YEAR,WantedECBShifr);
                ECB_NALOG := CalcECB(Curr_Person,NSRV,Start_Month,Start_Year,
                                     ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                     ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                     ECB_Self_Ud );
                ADD_ECB   := ECB_NALOG - ECB_SELF_UD;
(*
                IF ABS(ECBP-0.061)<0.001 THEN
                   BEGIN
                        ECB_NALOG := R10(ECB_SELF_NACH*ECBP);
                        ADD_ECB   := ECB_NALOG - ECB_SELF_UD;
                   END
                ELSE
                IF ABS(ECBP-0.036)<0.001 THEN
                   BEGIN
                       ECB_NALOG := R10(ECB_SELF_NACH*ECBP);
                       ADD_ECB   := ECB_NALOG - ECB_SELF_UD;
                   END
                ELSE
                IF dog_pod_podrazd(nsrv)THEN
                   BEGIN
                       ECB_NALOG := R10(ECB_SELF_NACH*ECBdpProc);
                       ADD_ECB   := ECB_NALOG - ECB_SELF_UD;
                   END;
*)
(*
                ECB_NALOG := R10(ECB_Self_NACH*ECBP);
     //           ECB_NALOG := ECB(ECB_NACH,START_MONTH,START_YEAR,CURR_PERSON);
     //           ADD_ECB   := ECB_NALOG - ECB_UD;
                ADD_ECB   := ECB_NALOG - ECB_SELF_UD;
*)
                ECB_ILL_NALOG := ECBIll(ECB_ILL_NACH,START_MONTH,START_YEAR,CURR_PERSON);
                ADD_ECB_ILL   := ECB_ILL_NALOG - ECB_ILL_UD;

                if Start_Year>13 then A_A:=PODOH_NACH-PENS_NALOG
                                 else A_A:=PODOH_NACH;
                if DOG_POD_PODRAZD(NSRV) THEN
                   begin
                        S_S_NALOG := 0;        { ДЛЯ ДОГОВОРОВ ПОДРЯДА СОЦ СТРАХ НЕ СЧИТАЕТСЯ }
                        F_Z_NALOG := 0;
                        ECB_NALOG:=0;
                        ECB_ILL_NALOG := 0;
                        ECB_DP_NALOG := R10(GET_SELF_SUMMA_FOR_PODOH*EcbDpProc);
                        ADD_ECB_DP   := ECB_DP_NALOG-ECB_SELF_UD;
                        A_A:=GET_SELF_SUMMA_FOR_PODOH;
                        U_U:=GET_SELF_UD_SUMMA;
                        ADD_PODOH:=R10(A_A-ECB_DP_NALOG)*0.15-U_U;
                   end
                                ELSE
                   BEGIN
                        PODOH_NALOG:=PODOH_2004(PODOH_NACH,BOL_NACH,PENS_NALOG,S_S_NALOG,F_Z_NALOG,ECB_NALOG,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);
                        ADD_PODOH:=PODOH_NALOG-PODOH_UD;
                   END;
         END
                                                         ELSE
         BEGIN
             IF CURR_PERSON^.WID_RABOTY=SOWM_WID_RABOTY          THEN
             IF STORONNEE_PODRAZD(Nomer_Serv(CURR_PERSON^.MESTO_OSN_RABOTY)) THEN
                BEGIN
                  {  2. Cоовместители со стороны но не рецензенты }
 {               PENS_NALOG:=PENS(PENS_NACH,START_MONTH);}
                     PENS_NALOG :=PENS(PENS_NACH,START_MONTH,START_YEAR,CURR_PERSON);
                     ADD_PENS:=PENS_NALOG-PENS_UD;

                     S_S_NALOG := S_S(S_S_NACH,START_MONTH,CURR_PERSON,Start_Year);
                     ADD_S_S   := S_S_NALOG-S_S_UD;
                     F_Z_NALOG := FOND_Z(CURR_PERSON,F_Z_NACH,START_MONTH,START_YEAR);
                     ADD_F_Z   :=  F_Z_NALOG - F_Z_UD;

{                     F_Z:=PENS_NACH*0.005;}
                     ECBP := GetProcECBNalogDirect(CURR_PERSON,START_MONTH,START_YEAR,WantedECBShifr);
//                     ECB_NALOG := ECB(ECB_NACH,START_MONTH,START_YEAR,CURR_PERSON);
//                     ADD_ECB   := ECB_NALOG - ECB_UD;
//                     ECB_NALOG := R10(ECB_SELF_NACH*ECBP);
//                     ADD_ECB   := ECB_NALOG - ECB_SELF_UD;
                     ECB_NALOG := CalcECB(Curr_Person,NSRV,Start_Month,Start_Year,
                                     ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                     ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                     ECB_Self_Ud );
                     ADD_ECB   := ECB_NALOG - ECB_SELF_UD;

                     ECB_ILL_NALOG := ECBIll(ECB_ILL_NACH,START_MONTH,START_YEAR,CURR_PERSON);;
                     ADD_ECB_ILL   := ECB_ILL_NALOG - ECB_ILL_UD;
                     ECB_DP_NALOG  := 0;

                     if Start_Year>13 then A_A:=PODOH_NACH-PENS_NALOG {-S_S_NALOG-F_Z}
                                      else A_A:=PODOH_NACH;
                     if DOG_POD_PODRAZD(NSRV) THEN   { Договора подряда }
                        begin
                             S_S_NALOG := 0;        { ДЛЯ ДОГОВОРОВ ПОДРЯДА СОЦ СТРАХ НЕ СЧИТАЕТСЯ }
                             F_Z_NALOG := 0;
                             ECB_NALOG     := 0;
                             ADD_ECB       := 0;
                             ECB_ILL_NALOG := 0;
                             ADD_ECB_Ill   := 0;
                             ECB_DP_NALOG  := R10(GET_SELF_SUMMA_FOR_PODOH*EcbDpProc);
                             ADD_ECB_DP    := ECB_DP_NALOG-ECB_SELF_UD;
                             A_A:=GET_SELF_SUMMA_FOR_PODOH;
                             U_U:=GET_SELF_UD_SUMMA;
                             ADD_PODOH:=R10(A_A-ECB_DP_NALOG)*0.15-U_U;

                        end
                                ELSE
                       BEGIN                       { Не договора подряда }
                        //     PODOH_NALOG:=PODOH_2004(PODOH_NACH,BOL_NACH,PENS_NALOG,S_S_NALOG,F_Z_NALOG,ECB_NALOG,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);
                        //     ADD_PODOH:=PODOH_NALOG-PODOH_UD;
                             A_A:=GET_SELF_SUMMA_FOR_PODOH;
                             U_U:=GET_SELF_UD_SUMMA;
                             ADD_PODOH:=R10(A_A-ECB_NALOG-ECB_ILL_NALOG)*0.15-U_U;
                       END;
                END
                                                         ELSE
                BEGIN
                    { Внутренние совместители }
                   IF START_MONTH<>NMES THEN
                       BEGIN
                            PENS_NALOG := PENS(PENS_NACH,START_MONTH,START_YEAR,CURR_PERSON);
                            ADD_PENS   := PENS_NALOG-PENS_UD;

                            S_S_NALOG  := S_S(S_S_Self_NACH,START_MONTH,CURR_PERSON,Start_Year);
                            ADD_S_S    := S_S_NALOG-S_S_SELF_UD;

                            F_Z_NALOG := FOND_Z(CURR_PERSON,F_Z_SELF_NACH,START_MONTH,START_YEAR);
                            ADD_F_Z   :=  F_Z_NALOG - F_Z_SELF_UD;

                            if DOG_POD_PODRAZD(NSRV) THEN ADD_S_S:=0;        { ДЛЯ ДОГОВОРОВ ПОДРЯДА СОЦ СТРАХ НЕ СЧИТАЕТСЯ }
                            if Start_Year>13 then
                               begin
                                    NeedForPodoh2004:=true;
                                    PENS_NALOG  := PENS(PENS_NACH,START_MONTH,START_YEAR,CURR_PERSON);
                                    ADD_PENS:=PENS_NALOG-PENS_UD;
                                    S_S_NALOG := S_S(S_S_NACH,START_MONTH,CURR_PERSON,Start_Year);
                                    ADD_S_S   := S_S_NALOG - S_S_UD;
                                    NeedForPodoh2004:=true;
                                    F_Z_NALOG := FOND_Z(CURR_PERSON,F_Z_NACH,START_MONTH,START_YEAR);
                                    ADD_F_Z   :=  F_Z_NALOG - F_Z_UD;
                                    if Is_Pensioner(Curr_Person) then
                                       if Start_Year+1990<2009 then F_Z_NALOG:=0;
                                    ECBP := GetProcECBNalogDirect(CURR_PERSON,START_MONTH,START_YEAR,WantedECBShifr);
//                                    ECB_NALOG := ECB(ECB_NACH,START_MONTH,START_YEAR,CURR_PERSON);
//                                    ADD_ECB   := ECB_NALOG - ECB_UD;
//                                    ECB_NALOG := R10(ECB_SELF_NACH*ECBP);
//                                    ECB_NALOG := CalcECB(Curr_Person,NSRV,Start_Month,Start_Year,
//                                                         ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
//                                                         ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
//                                                         ECB_Self_Ud );

                                    ECB_NALOG := CalcECBFull(Curr_Person,NSRV,Start_Month,Start_Year,
                                                         ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                                         ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                                         ECB_Self_Ud );

                                    ECB_ILL_NALOG := ECBIll(ECB_ILL_NACH,START_MONTH,START_YEAR,CURR_PERSON);
//                                    ADD_ECB   := ECB_NALOG-ECB_SELF_UD;
                                    if abs(ECBP-0.061)<0.0005 then
                                       ADD_ECB   := ECB_NALOG-ECBN_UD
                                    else
                                       ADD_ECB   := ECB_NALOG-ECB_UD;
                                    ADD_ECB_ILL   := ECB_ILL_NALOG - ECB_ILL_UD;
                                    ECB_DP_NALOG  := 0;

{                            if Is_Pensioner(Curr_Person) then F_Z:=0;}
                                    if DOG_POD_PODRAZD(NSRV) THEN
                                       begin
                                            S_S_NALOG:=0;        { ДЛЯ ДОГОВОРОВ ПОДРЯДА СОЦ СТРАХ НЕ СЧИТАЕТСЯ }
                                            F_Z_NALOG:=0;
                                            S_S_NALOG:=S_S_UD;
                                            F_Z_NALOG:=F_Z_Ud;
                                            ADD_ECB       := 0;
                                            ECB_ILL_NALOG := 0;
                                            ADD_ECB_ILL   := 0;
                                            ECB_DP_NALOG  := R10(GET_SELF_SUMMA_FOR_PODOH*EcbDpProc);
                                            ADD_ECB_DP    := ECB_DP_NALOG-ECB_SELF_UD;
                                            A_A:=GET_SELF_SUMMA_FOR_PODOH;
                                            U_U:=GET_SELF_UD_SUMMA;
                                            ADD_PODOH:=R10(A_A-ECB_DP_NALOG)*0.15-U_U;
                                       end
                                                   ELSE
            //                           PODOH_NALOG:=PODOH_2004(PODOH_NACH,BOL_NACH,PENS_NALOG,S_S_NALOG,F_Z_NALOG,ECB_NALOG+ECB_UD+ECBN_UD+ECB_DP_UD+ECB_ILL_UD,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);
                                       if (Get_DOl_Code(Curr_Person)=1500) then
                                          begin
                                               ADD_ECB       := 0;
                                               A_A:=GET_SELF_SUMMA_FOR_PODOH;
                                               U_U:=GET_SELF_UD_ECB_ILL_SUMMA;
                                               ECB_ILL_NALOG := ECBIll(A_A,START_MONTH,START_YEAR,CURR_PERSON);
                                               ADD_ECB_ILL   := ECB_ILL_NALOG-U_U;
                                               PODOH_NALOG   := PODOH_2004(A_A,BOL_NACH,PENS_NALOG,S_S_NALOG,F_Z_NALOG,0.00,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);
                                               PODOH_UD      := GET_SELF_UD_SUMMA;
                                          end
                                       else
                                           PODOH_NALOG:=PODOH_2004(PODOH_NACH,BOL_NACH,PENS_NALOG,S_S_NALOG,F_Z_NALOG,ECB_NALOG+ECB_DP_UD,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);
                               end
                            else
                               PODOH_NALOG:=PODOH(PODOH_NACH,START_MONTH,KOL_WO_DETEJ,CURR_PERSON)*CURR_PERSON^.PODOH/100;

                            if  not Dog_Pod_Podrazd(NSRV) then
                                Add_Podoh:=Podoh_Nalog-Podoh_Ud;
                       END
                              ELSE
                       BEGIN
                             { Собстевнные совместители текущий месяц }
                             PENS_NALOG:=PENS(PENS_SELF_NACH,START_MONTH,START_YEAR,CURR_PERSON);
                             ADD_PENS:=PENS_NALOG-PENS_SELF_UD;

                             S_S_NALOG := S_S(S_S_Self_NACH,START_MONTH,CURR_PERSON,Start_Year);
                             ADD_S_S   := S_S_NALOG-S_S_SELF_UD;
                             F_Z_NALOG := FOND_Z(CURR_PERSON,F_Z_SELF_NACH,START_MONTH,START_YEAR);
                             ADD_F_Z   :=  F_Z_NALOG - F_Z_SELF_UD;

                             ECBP          := GetProcECBNalogDirect(CURR_PERSON,START_MONTH,START_YEAR,WantedECBShifr);
//                             ECB_NALOG     := ECB(ECB_SELF_NACH,START_MONTH,START_YEAR,CURR_PERSON);
//                             ADD_ECB       := ECB_NALOG - ECB_SELF_UD;
//                             ECB_NALOG     := R10(ECB_SELF_NACH*ECBP);
                             ECB_NALOG := CalcECB(Curr_Person,NSRV,Start_Month,Start_Year,
                                                  ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                                  ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                                  ECB_Self_Ud );

                             ADD_ECB       := ECB_NALOG - ECB_SELF_UD;
                             ECB_ILL_NALOG := ECBIll(ECB_ILL_SELF_NACH,START_MONTH,START_YEAR,CURR_PERSON);;
                             ADD_ECB_ILL   := ECB_ILL_NALOG - ECB_ILL_SELF_UD;
                             ECB_DP_NALOG  := 0;

                             if DOG_POD_PODRAZD(NSRV) THEN
                                begin
                                     S_S_NALOG:=0;        { ДЛЯ ДОГОВОРОВ ПОДРЯДА СОЦ СТРАХ НЕ СЧИТАЕТСЯ }
                                     F_Z_NALOG:=0;
                                     ADD_ECB       := 0;
                                     ECB_ILL_NALOG := 0;
                                     ADD_ECB_ILL   := 0;
                                     ECB_DP_NALOG  := R10(GET_SELF_SUMMA_FOR_PODOH*EcbDpProc);
                                     ADD_ECB_DP    := ECB_DP_NALOG-ECB_SELF_UD;
                                     A_A:=GET_SELF_SUMMA_FOR_PODOH;
                                     U_U:=GET_SELF_UD_SUMMA;
                                     ADD_PODOH:=R10(A_A-ECB_DP_NALOG)*0.15-U_U;

                                end
                                                    ELSE
                                BEGIN
                                     if Start_Year>13 then
                                        begin
                                             A_A:=NACH_PERSON_EXL(CURR_PERSON,START_MONTH,START_YEAR,START_MONTH,FALSE);
                                             PODOH_NACH:=A_A;
                                             if Start_Year<21 then
                                                A_A:=A_A-PENS_NALOG {-S_S_NALOG-F_Z;}
                                             else
                                                A_A:=A_A-ECB_NALOG-Ecb_Ill_Nalog;{-S_S_NALOG-F_Z;}
                                        end
                                     else
                                        begin
                                             A_A:=NACH_PERSON_EXL(CURR_PERSON,START_MONTH,START_YEAR,START_MONTH,FALSE);
                                             PODOH_NACH:=A_A;
                                        end;
                                     PODOH_NALOG:=A_A*PROC_SOWM*CURR_PERSON^.PODOH/100;
                                     PODOH_NALOG:=PODOH_NALOG-UD_PODOH(CURR_PERSON,START_MONTH,START_YEAR,FALSE);
                                     ADD_PODOH:=PODOH_NALOG;
                                END;
                       END;
                END                { Конец совместителей }
                                                         ELSE
                BEGIN
                    PODOH_NALOG := PODOH(PODOH_NACH,START_MONTH,KOL_WO_DETEJ,CURR_PERSON)*CURR_PERSON^.PODOH/100;
                    ADD_PODOH   := PODOH_NALOG-PODOH_UD;
                    PENS_NALOG  := PENS(PENS_NACH,START_MONTH,START_YEAR,CURR_PERSON);
                    ADD_PENS:=PENS_NALOG-PENS_UD-PENS_SELF_UD;

                    S_S_NALOG := S_S(S_S_NACH,START_MONTH,CURR_PERSON,START_YEAR);
                    ADD_S_S   := S_S_NALOG-S_S_UD-S_S_SELF_UD;

                    F_Z_NALOG   := FOND_Z(CURR_PERSON,F_Z_NACH,START_MONTH,START_YEAR);
                    ADD_F_Z     := F_Z_NALOG - F_Z_UD - F_Z_SELF_UD;

                    ECBP := GetProcECBNalogDirect(CURR_PERSON,START_MONTH,START_YEAR,WantedECBShifr);
//                    ECB_NALOG     := ECB(ECB_NACH,START_MONTH,START_YEAR,CURR_PERSON);
//                    ADD_ECB       := ECB_NALOG - ECB_UD-ECB_SELF_UD;
//                    ECB_NALOG     := R10(ECB_SELF_NACH*ECBP);
//                    ADD_ECB       := ECB_NALOG - ECB_SELF_UD;
                    ECB_NALOG := CalcECBFull(Curr_Person,NSRV,Start_Month,Start_Year,
                                     ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                     ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                     ECB_Self_Ud );
                    ADD_ECB   := ECB_NALOG - ECB_UD;
                    ECB_ILL_NALOG := ECBIll(ECB_ILL_NACH,START_MONTH,START_YEAR,CURR_PERSON);;
                    ADD_ECB_ILL   := ECB_ILL_NALOG - ECB_ILL_UD-ECB_ILL_SELF_UD;
                    ECB_DP_NALOG  := 0;

                END;
        END;
       IF (Start_Year>13) and (CURR_PERSON^.WID_RABOTY<>SOWM_WID_RABOTY) THEN
          BEGIN
               NeedForPodoh2004:=true;
               PENS_NALOG  := PENS(PENS_NACH,START_MONTH,START_YEAR,CURR_PERSON);
               NeedForPodoh2004:=false;
               S_S_NALOG := S_S(S_S_NACH,START_MONTH,CURR_PERSON,Start_Year);
               ADD_S_S   := S_S_NALOG - S_S_UD;
               F_Z_NALOG := FOND_Z(CURR_PERSON,F_Z_NACH,START_MONTH,START_YEAR);
               ADD_F_Z   :=  F_Z_NALOG - F_Z_UD;
               if Is_Pensioner(Curr_Person) then
                  if Start_Year+1990<2009 then F_Z_NALOG:=0;
               ECBP := GetProcECBNalogDirect(CURR_PERSON,START_MONTH,START_YEAR,WantedECBShifr);
//               ECB_NALOG     := ECB(ECB_NACH,START_MONTH,START_YEAR,CURR_PERSON);
//               ADD_ECB       := ECB_NALOG - ECB_UD-ECB_SELF_UD;
(*
               if nmes=Start_Month then
                  begin
//                       ECB_NALOG     := R10(ECB_SELF_NACH*ECBP);
//                       ADD_ECB       := ECB_NALOG - ECB_SELF_UD;
                       ECB_NALOG := CalcECB(Curr_Person,NSRV,Start_Month,Start_Year,
                                            ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                            ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                            ECB_Self_Ud );
                       ADD_ECB   := ECB_NALOG - ECB_SELF_UD;
                  end
               else
*)
                  begin
//                       ECB_NALOG := CalcECB(Curr_Person,NSRV,Start_Month,Start_Year,
//                                            ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
//                                            ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
//                                            ECB_Self_Ud );
                       ECB_NALOG := CalcECBFull(Curr_Person,NSRV,Start_Month,Start_Year,
                                            ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                            ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                            ECB_Self_Ud );
  //                     ADD_ECB   := ECB_NALOG - ECB_SELF_UD;
                       if abs(ECBP-0.061)<0.0005 then
                          ADD_ECB   := ECB_NALOG-ECBN_UD
                       else
                          ADD_ECB   := ECB_NALOG-ECB_UD;
(*

                       if ((abs(abs(ECBP)-0.061))<0.00001) then
                          begin
                               ECB_NALOG     := ECB(ECBN_NACH,START_MONTH,START_YEAR,CURR_PERSON);
                               ADD_ECB       := ECB_NALOG - ECBN_UD;
                          end
                       else
                       if ((abs(abs(ECBP)-0.036))<0.00001) then
                          begin
                               ECB_NALOG     := ECB(ECB_NACH,START_MONTH,START_YEAR,CURR_PERSON);
                               ADD_ECB       := ECB_NALOG - ECB_UD;
                          end;
*)
                  end;
(*                  
               if (ECBN_NACH+ECB_NACH+ECB_ILL_NACH+ECB_DP_NACH)>LIMITFORPENS then
                  begin
                       ECB_NALOG     := ECB(ECB_NACH,START_MONTH,START_YEAR,CURR_PERSON);
                       ADD_ECB       := ECB_NALOG - ECB_UD-ECB_SELF_UD;
                  end;
*)
               ECB_ILL_NALOG := ECBIll(ECB_ILL_NACH,START_MONTH,START_YEAR,CURR_PERSON);;
               ADD_ECB_ILL   := ECB_ILL_NALOG - ECB_ILL_UD-ECB_ILL_SELF_UD;
               ECB_DP_NALOG  := 0;

               if DOG_POD_PODRAZD(NSRV) THEN
                  begin
                       S_S_NALOG:=0;        { ДЛЯ ДОГОВОРОВ ПОДРЯДА СОЦ СТРАХ НЕ СЧИТАЕТСЯ }
                       F_Z_NALOG:=0;
                  end;
//               PODOH_NALOG:=PODOH_2004(PODOH_NACH,BOL_NACH,Pens_Nalog,S_S_Nalog,F_Z_NALOG,ECB_NALOG+ECB_UD+ECBN_UD+ECB_DP_UD+ECB_ILL_UD,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);
               PODOH_NALOG:=PODOH_2004(PODOH_NACH,BOL_NACH,Pens_Nalog,S_S_Nalog,F_Z_NALOG,ECB_NALOG+ECB_DP_UD,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);
               ADD_PODOH:=PODOH_NALOG-PODOH_UD;
         END;
       IF (START_YEAR<21) THEN   { pf 2010 в 2001 ситать есв}
       BEGIN
                   NeedForPodoh2004:=true;
                   ECBP := GetProcECBNalogDirect(CURR_PERSON,START_MONTH,START_YEAR,WantedECBShifr);
//                   ECB_NALOG     := ECB(ECB_SELF_NACH,START_MONTH,START_YEAR,CURR_PERSON);
//                   ADD_ECB       := ECB_NALOG - ECB_SELF_UD;
//                   ECB_NALOG     := R10(ECB_SELF_NACH*ECBP);
//                   ADD_ECB       := ECB_NALOG - ECB_SELF_UD;
                   ECB_NALOG := CalcECB(Curr_Person,NSRV,Start_Month,Start_Year,
                                        ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                        ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                        ECB_Self_Ud );
                   ADD_ECB   := ECB_NALOG - ECB_SELF_UD;

                   ECB_ILL_NALOG := ECBIll(ECB_ILL_SELF_NACH,START_MONTH,START_YEAR,CURR_PERSON);;
                   ADD_ECB_ILL   := ECB_ILL_NALOG - ECB_ILL_SELF_UD;
                   ECB_DP_NALOG  := 0;
                   S_S_NALOG  := 0;        { ДЛЯ ДОГОВОРОВ ПОДРЯДА СОЦ СТРАХ НЕ СЧИТАЕТСЯ }
                   F_Z_NALOG  := 0;
                   PENS_NALOG := 0;

                   if DOG_POD_PODRAZD(NSRV) THEN
                      begin
                           S_S_NALOG:=0;        { ДЛЯ ДОГОВОРОВ ПОДРЯДА СОЦ СТРАХ НЕ СЧИТАЕТСЯ }
                           F_Z_NALOG:=0;
                           ECB_NALOG     := 0;
                           ADD_ECB       := 0;
                           ECB_ILL_NALOG := 0;
                           ADD_ECB_ILL   := 0;
                           ECB_DP_NALOG  := R10(GET_SELF_SUMMA_FOR_PODOH*EcbDpProc);
                           ADD_ECB_DP    := ECB_DP_NALOG-ECB_SELF_UD;
                      end;

                   PODOH_NALOG:=R10((GET_SELF_SUMMA_FOR_PODOH-ecb_nalog-ecb_ill_nalog-ECB_DP_NALOG)*0.15);

       END;

       if DOG_POD_PODRAZD(NSRV) THEN
          begin
                ADD_S_S:=0;        { ДЛЯ ДОГОВОРОВ ПОДРЯДА СОЦ СТРАХ НЕ СЧИТАЕТСЯ }
                ADD_F_Z:=0;
          end;
{       if Is_PENSIONER(CURR_PERSON) THEN F_Z:=0;}
       if Is_PENSIONER(CURR_PERSON) THEN
          if Start_Year+1990<2009 then F_Z_NALOG:=0;

       val(work_year,w_y,i);
       if ((start_month<3) and (w_y=2001)) or
          (w_y<2001) then Add_s_s:=0;

       if w_y>2010 then
          begin
               Add_Pens := 0;
               Add_S_S  := 0;
               Add_F_Z  := 0;
          end
       else
          begin
               Add_ECB     := 0;
               Add_ECB_Ill := 0;
               Add_ECB_DP  := 0;
          end;



       IF (ABS(ADD_PODOH)>0.0099) THEN
         BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_PODOH);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := PODOH_SHIFR;
              CURR_UD^.WHO    := 1;
         END;
       IF (ABS(ADD_PENS)>0.0099) THEN
         BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_PENS);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := PENS_SHIFR;
              CURR_UD^.WHO    := 1;
         END;
       IF (ABS(ADD_S_S)>0.0099) THEN
         BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_S_S);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := S_S_SHIFR;
              CURR_UD^.WHO    := 1;
         END;
      IF (ABS(ADD_F_Z)>0.0099) THEN
         BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_F_Z);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := FOND_Z_SHIFR;
              CURR_UD^.WHO    := 1;
         END;

      IF (ABS(ADD_ECB)>0.0099) THEN
          BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_ECB);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := GetECBShifr(Curr_Person);
              CURR_UD^.WHO    := 1;
          END;
      IF (ABS(ADD_ECB_ILL)>0.0099) THEN
          BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_ECB_ILL);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := ECBIllShifr;
              CURR_UD^.WHO    := 1;
          END;
      IF (ABS(ADD_ECB_DP)>0.0099) THEN
          BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_ECB_dp);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := ECBDPShifr;
              CURR_UD^.WHO    := 1;
          END;

      TOTAL_PROC:=0;
      I:=1;
      TOTAL_PROC:=0;
      WHILE MUST_ALIMENTY(I,PROC,CURR_PERSON,PRIM,A_SHIFR,SUMMAABSALIM) DO
       BEGIN
             TOTAL_PROC:=TOTAL_PROC+PROC;
             PROC:=0;
       END;
      I:=1;
      IF TOTAL_PROC>0 THEN
         WHILE MUST_ALIMENTY(I,PROC,CURR_PERSON,PRIM,A_SHIFR,SUMMAABSALIM) DO
               BEGIN
{                    F_Z:=r10(PENS_NACH*0.005);
                    IF IS_PENSIONER(CURR_PERSON) THEN F_Z:=0;
}
                    F_Z_NALOG := FOND_Z(CURR_PERSON,F_Z_NACH,START_MONTH,START_YEAR);

                    IF IS_PENSIONER(CURR_PERSON) THEN
                       if Start_Year+1990<2009 then F_Z_NALOG:=0;

                    if DOG_POD_PODRAZD(NSRV) THEN
                        begin
                             S_S_NALOG:=0;        { ДЛЯ ДОГОВОРОВ ПОДРЯДА СОЦ СТРАХ НЕ СЧИТАЕТСЯ }
                             F_Z_NALOG:=0;
                        end;
                    P:=PODOH_2004(PODOH_NACH,BOL_NACH,Pens_Nalog,S_S_Nalog,F_Z_NALOG,ECB_NALOG,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);

                    if (storonnee_podrazd(Nomer_Serv(CURR_PERSON^.MESTO_OSN_RABOTY))) then
                       begin
                           if Start_Year>13 then A_A:=Podoh_Nach-Pens_Nalog-S_S_Nalog
                                            else A_A:=PODOH_NACH;
                           p:=A_A*PROC_SOWM;
                       end;
                    A_A:=(ALIMENTY_NACH-
                          P-
                          PENS(PENS_NACH,START_MONTH,START_YEAR,CURR_PERSON)-
                          S_S(S_S_NACH,START_MONTH,CURR_PERSON,Start_Year)-
                          FOND_Z(CURR_PERSON,PENS_NACH,START_MONTH,START_YEAR)-
                          PROF(CURR_PERSON,PENS_NACH,START_MONTH)
                          )*PROC;
                    ADD_ALIM:=A_A-(ALIMENTY_UD*PROC/TOTAL_PROC);
                    IF (ABS(ADD_ALIM)>0.099) THEN
                      BEGIN
                           MAKE_UD(CURR_UD,CURR_PERSON);
                           CURR_UD^.SUMMA  := R10(ADD_ALIM);
                           CURR_UD^.PERIOD := START_MONTH;
                           CURR_UD^.YEAR   := START_YEAR;
                           CURR_UD^.SHIFR  := A_SHIFR;
                           CURR_UD^.WHO    := PRIM;
                           MAKE_POCHTOW_SBOR(CURR_PERSON,CURR_UD,A_A);
                     END;
               END;
      if Must_Show_Nalogi then
         begin
           with TFormShowCalc.Create(nil) do
            try
                SetCurrPerson(Curr_Person,
                              Podoh_Nach,Podoh_Nalog,Podoh_Ud,Add_Podoh,
                              Pens_Nach,Pens_Nalog,Pens_Ud,Add_Pens,
                              S_S_Nach,S_S_Nalog,S_S_Ud,Add_S_S,
                              F_Z_Nach,F_Z_NALOG,F_Z_Ud,0);
                if execute then
                   begin
                   end;
            finally
             free;
            end;

         end;
  END;
PROCEDURE MAKE_PERSON_PODOH_2011(CURR_PERSON:PERSON_PTR;
                                 KOL_WO_DETEJ:INTEGER;
                                 START_MONTH:INTEGER;
                                 START_YEAR:INTEGER;
                                 MODECALC : integer; { 0-проц. 1-окончат }
                                 PODOH_NACH        ,
                                 BOL_NACH          ,
                                 PODOH_UD          ,
                                 ALIMENTY_NACH     ,
                                 ALIMENTY_UD       ,
                                 ECBN_NACH         ,
                                 ECBN_UD           ,
                                 ECB_NACH          ,
                                 ECB_UD            ,
                                 ECB_DP_NACH       ,
                                 ECB_DP_UD         ,
                                 ECB_SELF_NACH     ,
                                 ECB_SELF_UD       ,
                                 ECB_ILL_NACH      ,
                                 ECB_ILL_UD        ,
                                 ECB_ILL_SELF_NACH ,
                                 ECB_ILL_SELF_UD: REAL);

 VAR
     B,A,PODOH_NALOG,ADD_PODOH,ADD_PODOH_I,ADD_ALIM,PROC:REAL;
     TOTAL_PODOH,TOTAL_PROC:REAL;
     ECB_NALOG,ADD_ECB:REAL;
     ECB_ILL_NALOG,ADD_ECB_ILL:REAL;
     ECB_DP_NALOG,ADD_ECB_DP:REAL;
     CURR_ADD : ADD_PTR;
     CURR_UD  : UD_PTR;
     PRIM     : INTEGER;
     P        : Real;
     w_y,i    : integer;
     A_A,U_U  : REAL;
     K        : INTEGER;
     PROC_SOWM:REAL;
     ECBP     : real;
     WantedECBShifr : integer;
     ModeRecalcNalogi:integer;
     EcbForNalog:Real;
     A_Shifr : Integer;
     SummaAbsAlim : Real;
 FUNCTION GET_SELF_SUMMA:REAL;
  VAR a_a:REAL;
  BEGIN
       A_A:=0;
       CURR_ADD:=CURR_PERSON^.ADD;
       WHILE (CURR_ADD<>NIL) DO
             BEGIN
                  IF CURR_ADD^.PERIOD=START_MONTH THEN
                      A_A:=A_A+CURR_ADD^.SUMMA;
                  CURR_ADD:=CURR_ADD^.NEXT;
             END;
       GET_SELF_SUMMA:=A_A;
  END;
 FUNCTION GET_SELF_SUMMA_FOR_PODOH:REAL;
  VAR a_a:REAL;
  BEGIN
       A_A:=0;
       CURR_ADD:=CURR_PERSON^.ADD;
       WHILE (CURR_ADD<>NIL) DO
             BEGIN

                  IF (CURR_ADD^.PERIOD=START_MONTH) or
                     (IsNotBolnOtpShifr(Curr_Add^.Shifr))       THEN
                  if CompareNalogMode(CURR_ADD^.SHIFR,PodohNalog) then
                      A_A:=A_A+CURR_ADD^.SUMMA;
                  CURR_ADD:=CURR_ADD^.NEXT;
             END;
       GET_SELF_SUMMA_FOR_PODOH:=A_A;
  END;
 FUNCTION GET_SELF_ECB_ILL_NACH_SUMMA:REAL;
  VAR a_a:REAL;
  BEGIN
       A_A:=0;
       CURR_ADD:=CURR_PERSON^.ADD;
       WHILE (CURR_ADD<>NIL) DO
             BEGIN

                  IF CURR_ADD^.PERIOD=START_MONTH THEN
                  if CompareNalogMode(CURR_ADD^.SHIFR,ECBIllNalog) then
                      A_A:=A_A+CURR_ADD^.SUMMA;
                  CURR_ADD:=CURR_ADD^.NEXT;
             END;
       GET_SELF_ECB_ILL_NACH_SUMMA:=A_A;
  END;
 FUNCTION GET_SELF_UD_SUMMA:REAL;
  VAR U_U:REAL;
  BEGIN
       CURR_UD:=CURR_PERSON^.UD;
       U_U:=0;
       WHILE (CURR_UD<>NIL) DO
        BEGIN
             IF CURR_UD^.SHIFR=PODOH_SHIFR  THEN
             IF CURR_UD^.PERIOD=START_MONTH THEN
                U_U:=U_U+CURR_UD^.SUMMA;
             CURR_UD:=CURR_UD^.NEXT;
        END;
      GET_SELF_UD_SUMMA:=u_u;
  END;
 FUNCTION GET_SELF_UD_ECB_ILL_SUMMA:REAL;
  VAR U_U:REAL;
  BEGIN
       CURR_UD:=CURR_PERSON^.UD;
       U_U:=0;
       WHILE (CURR_UD<>NIL) DO
        BEGIN
             IF CURR_UD^.SHIFR=ECBILLSHIFR  THEN
             IF CURR_UD^.PERIOD=START_MONTH THEN
                U_U:=U_U+CURR_UD^.SUMMA;
             CURR_UD:=CURR_UD^.NEXT;
        END;
      GET_SELF_UD_ECB_ILL_SUMMA:=u_u;
  END;
  function GetECBShifr(Curr_Person:Person_Ptr):integer;
   var RetVal:integer;
       NeedTable:boolean;
   begin
       if WantedECBShifr>0 then
          begin
               GetECBShifr := WantedECBShifr;
               Exit;
          end;
       RetVal:=ECBShifr;
       NeedTable:=false;
       if (GetOsnKateg(Curr_Person)=TEACHER_KATEGORIJA) and
          (not IsColedgPodr(Nsrv)) and {УБРАТЬ ТЕХНИКУМ}
          (not IS_NotFond5(Curr_Person)) then NeedTable:=true
                                               else
       if Is_Fond5(Curr_Person) then NeedTable:=true;
       if NeedTable then
          RetVal:=ECBNShifr;
       GetECBShifr := RetVal;
   end;

 procedure DefineModeReclac;
  var RetVal:integer;
  begin
       RetVal:=1;
       if (Start_Month=Nmes) and
          (Curr_Person^.WID_RABOTY=sowm_wid_raboty) and
          (NOT STORONNEE_PODRAZD(Curr_Person^.Mesto_Osn_Raboty)) and
          (NOT RECENZENT_PODRAZD(Curr_Person^.Mesto_Osn_Raboty)) then
          RetVal:=0;
       ModeReCalcNalogi := RetVal;
  end;

 BEGIN
      ModeRecalcNalogi := ModeCalc;
      if ModeRecalcNalogi=2 then
         DefineModeReclac;
      ECB_NALOG      := 0;
      ADD_ECB        := 0;
      ECB_ILL_NALOG  := 0;
//      ECB_SELF_ILL_UD:= 0;
      ADD_ECB_ILL    := 0;
      ECB_DP_NALOG   := 0;
      ADD_ECB_DP     := 0;
      WantedECBShifr := 0;
      ECBP           := 0;
      PROC_SOWM      := 0.15;
      EcbForNalog    := 0 ;

      I:=1;
      if ModeReCalcNalogi=0 then {Проц от начислений}
         BEGIN
              if NOT DOG_POD_PODRAZD(NSRV) THEN
                 begin
                      ECBP := GetProcECBNalogDirect(CURR_PERSON,START_MONTH,START_YEAR,WantedECBShifr);
                      if (abs(abs(ECBP)-abs(ECBNProc))<0.00001) then
                          ECB_NALOG := CalculateECBNSelf(Curr_Person,NSRV,Start_Month,Start_Year,
                                   ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                   ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                   ECB_Self_Ud )
                      else
                          ECB_NALOG := CalculateECBSelf(Curr_Person,NSRV,Start_Month,Start_Year,
                                   ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                   ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                   ECB_Self_Ud );
                      ADD_ECB   := ECB_NALOG - ECB_SELF_UD;
//                      ECB_SELF_ILL_UD:=GET_SELF_UD_ECB_ILL_SUMMA;
                      A_A:=GET_SELF_ECB_ILL_NACH_SUMMA;
                      U_U:=GET_SELF_UD_ECB_ILL_SUMMA;
                      ECB_ILL_NALOG := CalculateECBIllSelf(Curr_Person,NSRV,Start_Month,Start_Year,
                                   ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                   ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , A_A ,
                                   ECB_Self_Ud );
//                      ADD_ECB_ILL   := ECB_ILL_NALOG - ECB_ILL_SELF_UD;
                      ADD_ECB_ILL   := ECB_ILL_NALOG - U_U;

                      A_A := GET_SELF_SUMMA_FOR_PODOH;
                      U_U:=GET_SELF_UD_SUMMA;
                      PODOH_NALOG:=PODOH_2004_2011(A_A,ECB_NALOG,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);
                      ADD_PODOH:=PODOH_NALOG-U_U;

                 end
              else
                 begin
                       ECB_NALOG     := 0;
                       ECB_ILL_NALOG := 0;
//                       ECB_DP_NALOG  := R10(GET_SELF_SUMMA_FOR_PODOH*EcbDpProc);
                       ECB_DP_NALOG := CalculateECBDPSelf(Curr_Person,NSRV,Start_Month,Start_Year,
                                   ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                   ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                   ECB_Self_Ud );
                       ADD_ECB_DP    := ECB_DP_NALOG-ECB_SELF_UD;
                       A_A:=GET_SELF_SUMMA_FOR_PODOH;
                       U_U:=GET_SELF_UD_SUMMA;
                       ADD_PODOH:=R10(A_A)*0.15-U_U;
                 end
         END
                                                         ELSE
         BEGIN    { Полный перерасчет }
               if not DOG_POD_PODRAZD(NSRV) THEN
                  begin
                      ECBP := GetProcECBNalogDirect(CURR_PERSON,START_MONTH,START_YEAR,WantedECBShifr);
                      if (abs(abs(ECBP)-abs(ECBNProc))<0.00001) then
                         begin
                              ECB_NALOG := CalculateECBNFull(Curr_Person,NSRV,Start_Month,Start_Year,
                                   ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                   ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                   ECB_Self_Ud ,EcbForNalog);
                                   ADD_ECB   := ECB_NALOG-ECBN_UD-ECB_UD-ECB_ILL_UD-ECB_DP_UD
                         end
                      else
                         begin
                              ECB_NALOG := CalculateECBFull(Curr_Person,NSRV,Start_Month,Start_Year,
                                   ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                   ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                   ECB_Self_Ud , EcbForNalog);
                              ADD_ECB   := ECB_NALOG-ECB_UD-ECBN_UD-ECB_ILL_UD-ECB_DP_UD;
                            //  if  NMES<>START_MONTH then
                                  EcbForNalog:=ECB_NALOG;
                         end ;
                      ECB_ILL_NALOG := CalculateECBIllFull(Curr_Person,NSRV,Start_Month,Start_Year,
                                   ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                   ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                   ECB_Self_Ud );
                      ADD_ECB_ILL   := ECB_ILL_NALOG - ECB_ILL_UD;
                      ECB_DP_NALOG  := 0;
                  //  PODOH_NALOG:=PODOH_2004_2011(PODOH_NACH,ECB_NALOG+ECB_DP_UD,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);
                      PODOH_NALOG:=PODOH_2004_2011(PODOH_NACH,ECBForNalog+ECB_DP_UD,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);
                      ADD_PODOH:=PODOH_NALOG-PODOH_UD;
                  end
               else
                  begin
                       ECB_NALOG     := 0;
                       ADD_ECB       := 0;
                       ECB_ILL_NALOG := 0;
                       ADD_ECB_ILL   := 0;
                       ECB_DP_NALOG := CalculateECBDPFull(Curr_Person,NSRV,Start_Month,Start_Year,
                                   ECBN_Nach , ECBN_Ud , ECB_Nach , ECB_Ud  , ECB_DP_NAch  ,
                                   ECB_DP_Ud  , ECB_Ill_Nach , ECB_Ill_Ud  , ECB_Self_Nach ,
                                   ECB_Self_Ud );
                       ADD_ECB_DP    := ECB_DP_NALOG-ECB_SELF_UD;
                       A_A:=GET_SELF_SUMMA_FOR_PODOH;
                       U_U:=GET_SELF_UD_SUMMA;
                       ADD_PODOH:=R10(A_A)*0.15-U_U;
                  end;
         END;

       IF (ABS(ADD_PODOH)>0.0099) THEN
         BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_PODOH);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := PODOH_SHIFR;
              CURR_UD^.WHO    := 1;
         END;

      IF (ABS(ADD_ECB)>0.0099) THEN
          BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_ECB);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := GetECBShifr(Curr_Person);
              CURR_UD^.WHO    := 1;
          END;
      IF (ABS(ADD_ECB_ILL)>0.0099) THEN
          BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_ECB_ILL);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := ECBIllShifr;
              CURR_UD^.WHO    := 1;
          END;
      IF (ABS(ADD_ECB_DP)>0.0099) THEN
          BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              CURR_UD^.SUMMA  := R10(ADD_ECB_dp);
              CURR_UD^.PERIOD := START_MONTH;
              CURR_UD^.YEAR   := START_YEAR;
              CURR_UD^.SHIFR  := ECBDPShifr;
              CURR_UD^.WHO    := 1;
          END;

      TOTAL_PROC:=0;
      I:=1;
      TOTAL_PROC:=0;
      WHILE MUST_ALIMENTY(I,PROC,CURR_PERSON,PRIM,A_SHIFR,SummaAbsAlim) DO
       BEGIN
             TOTAL_PROC:=TOTAL_PROC+PROC;
             PROC:=0;
       END;
      I:=1;
      IF TOTAL_PROC>0 THEN
         WHILE MUST_ALIMENTY(I,PROC,CURR_PERSON,PRIM,A_SHIFR,SummaAbsAlim) DO
               BEGIN
                    P:=PODOH_2004_2011(PODOH_NACH,ECB_NALOG,ECB_ILL_NALOG,START_MONTH,START_YEAR,CURR_PERSON);

                    if (storonnee_podrazd(Nomer_Serv(CURR_PERSON^.MESTO_OSN_RABOTY))) then
                       begin
                           if Start_Year>13 then A_A:=Podoh_Nach-ECB_NALOG
                                            else A_A:=PODOH_NACH;
                           p:=A_A*PROC_SOWM;
                       end;
                    A_A:=(ALIMENTY_NACH-
                          P-ECB_NALOG-ECB_ILL_NALOG-
                          PROF(CURR_PERSON,PODOH_NACH,START_MONTH)
                          )*PROC;
                    ADD_ALIM:=A_A-(ALIMENTY_UD*PROC/TOTAL_PROC);
                    IF (ABS(ADD_ALIM)>0.099) THEN
                      BEGIN
                           MAKE_UD(CURR_UD,CURR_PERSON);
                           CURR_UD^.SUMMA  := R10(ADD_ALIM);
                           CURR_UD^.PERIOD := START_MONTH;
                           CURR_UD^.YEAR   := START_YEAR;
                           CURR_UD^.SHIFR  := ALIMENTY_SHIFR;
                           CURR_UD^.WHO    := PRIM;
                        //   MAKE_POCHTOW_SBOR(CURR_PERSON,CURR_UD,A_A);
                           MAKE_POCHTOW_SBOR(CURR_PERSON,CURR_UD,ADD_ALIM);
                     END;
               END;
      if Must_Show_Nalogi then
         begin
           with TFormShowCalc.Create(nil) do
            try
                SetCurrPerson(Curr_Person,
                              Podoh_Nach,Podoh_Nalog,Podoh_Ud,Add_Podoh,
                              0.0,0.0,0.0,0.0,
                              0.0,0.0,0.0,0.0,
                              0.0,0.0,0.0,0);
                if execute then
                   begin
                   end;
            finally
             free;
            end;

         end;
  END;
 FUNCTION GET_STIPENDIJA(CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER):REAL;
  VAR
      CURR_CN:CN_PTR;
      A:REAL;
      DONE:BOOLEAN;
  BEGIN
       A:=0;
       CURR_CN:=CURR_PERSON^.CN;
       DONE:=FALSE;
       WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
        BEGIN
             IF CURR_CN^.SHIFR=STIPENDIJA_SHIFR+LIMIT_CN_BASE THEN
             IF CURR_CN^.PRIM=START_MONTH THEN
                BEGIN
                      A:=CURR_CN^.SUMMA;
                      DONE:=TRUE;
                END;
             IF NOT DONE THEN CURR_CN:=CURR_CN^.NEXT;
        END;
        GET_STIPENDIJA:=A;
  END;

procedure Calc_Podoh_For_Mat_Help(CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER;START_YEAR:WORD);
  var Curr_Add:Add_Ptr;
      Curr_Ud:Ud_Ptr;
      SummaAdd,SummaUd : real;
  begin

       SummaAdd:=0;
       Curr_Add:=Curr_Person^.Add;
       while (Curr_Add<>Nil) do
             begin
                  if Curr_Add^.Shifr  = MatHelpOblShifr then
                  if Curr_Add^.Period = Start_Month     then
                  if Curr_Add^.Year   = Start_Year      then
                     SummaAdd := SummaAdd + Curr_Add^.Summa;
                  Curr_Add:=Curr_Add^.Next;
             end;
       SummaUd := 0;
       Curr_Ud:=Curr_Person^.Ud;
       while (Curr_Ud<>Nil) do
             begin
                  if Curr_Ud^.Shifr  = Podoh_Shifr then
                  if Curr_Ud^.Period = Start_Month then
                  if Curr_Ud^.Year   = Start_Year  then
                     SummaUd := SummaUd + Curr_Ud^.Summa;
                  Curr_Ud:=Curr_Ud^.Next;
             end;

       SummaAdd := (SummaAdd*0.15) - SummaUd;

       if abs(SummaAdd)>0.01 then
          begin
               Make_Ud(Curr_Ud,Curr_Person);
               Curr_Ud^.Shifr  := Podoh_Shifr;
               Curr_Ud^.Period := Start_Month;
               Curr_Ud^.Year   := Start_Year;
               Curr_Ud^.Summa  := r10(SummaAdd);
               Curr_Ud^.WHo    := 1;

          end;

  end;

PROCEDURE UPDATE_PODOH(VAR CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER;START_YEAR:WORD;MODERECALC:INTEGER);
  VAR I,ii,iii,J,K:INTEGER;
      CURR_UD:UD_PTR;
      CURR_A :ADD_PTR;
      CURR_CN:CN_PTR;
      INF:TEXT;
      NMESOLD,NSRVOLD,PRIM  : INTEGER;
      SUMMA,ADD_PODOH,ADD_PODOH_I,ADD_MALO,ADD_ALIM,PROC,NACH,UD:REAL;
      SEL,FOUND:BOOLEAN;
      CURR_PERSON_WORK,C_PERSON,C_PERSON_OSN_2:PERSON_PTR;
      FROM:INTEGER;
      NMESTEMP:INTEGER;
      NSRV_IN_FIELD1:INTEGER;
      P,PPP:POINTER;
      PODOH_NACH,BOL_NACH,PODOH_UD : REAL;
      PENS_NACH,PENS_UD   : REAL;
      PENS_SELF_NACH,PENS_SELF_UD   : REAL;
      S_S_NACH,S_S_UD   : REAL;
      S_S_SELF_NACH,S_S_SELF_UD   : REAL;
      F_Z_NACH,F_Z_UD   : REAL;
      F_Z_SELF_NACH,F_Z_SELF_UD   : REAL;
      ALIMENTY_NACH,ALIMENTY_UD   : REAL;
      ECBN_NACH,ECBN_UD,
      ECB_NACH,ECB_UD,
      ECB_DP_NACH,ECB_DP_UD,
      ECB_SELF_NACH,ECB_SELF_UD,
      ECB_ILL_NACH,ECB_ILL_UD,
      ECB_ILL_SELF_NACH,ECB_ILL_SELF_UD:real;
      NSRV_OSN:INTEGER;
      REC,LD,C,SC:REAL;
      BB:INTEGER;
      L:BOOLEAN;
      A,B:REAL;
      PODOH_NALOG:REAL;
      WORK_MONTH:INTEGER;
      PODOH_POINTER:POINTER; {Указатель для отметки кучи перед расчетом налога и возврата ее в исходное состояние}
      OLD_MEMAVAIL,OLD_MAXAVAIL:LONGINT;
      MARKED_I,MARKED_NSRV:INTEGER;
      KOL_WO_DETEJ:INTEGER;
      Y:INTEGER;
      DEPTH_LIMIT:INTEGER;
  BEGIN
      UPDATE_PODOH_SQL(CURR_PERSON,START_MONTH,START_YEAR,MODERECALC);
      Exit;
      KOL_WO_DETEJ:=0;
      IF (START_MONTH<1) OR (START_MONTH>12)        THEN EXIT;
      IF (START_MONTH<>NMES) AND (NOT FLAG_NAUD_FOR_OTHER_MONTH) THEN EXIT;
{
      UPDATE_PODOH_TOT(CURR_PERSON,START_MONTH,START_YEAR);
      EXIT;
}
      NMESOLD:=NMES;
      NSRVOLD:=NSRV;
      WORK_MONTH:=NMES;
      NSRV_IN_FIELD1:=NSRV;
      IF (HEAD_ARRAY[2]<>NIL) OR (HEAD_ARRAY[3]<>NIL) THEN
         BEGIN
{
               if Head_Array[2]<>NIl then
                  while Head_Array[2]<>Nil do Del_Person(Head_Array[2]);
               if Head_Array[3]<>NIl then
                  while Head_Array[3]<>Nil do Del_Person(Head_Array[3]);
}

               ERROR('Системная ошибка распределения памяти для расчета подоходного налога');
               ERROR('С О В Е Т : Перегрузите ситему расчета заработной платы');
               EXIT;

         END;
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(PODOH_SHIFR, CURR_PERSON, START_MONTH));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(ALIMENTY_SHIFR,CURR_PERSON,START_MONTH));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(ALIMENTY_SHIFR+SHIFT_SHIFR,CURR_PERSON,START_MONTH));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(PerechPoIspListamShifr,CURR_PERSON,START_MONTH));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(PerechPoIspListamShifr+SHIFT_SHIFR,CURR_PERSON,START_MONTH));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(PENS_SHIFR+SHIFT_SHIFR,CURR_PERSON,START_MONTH));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(PENS_SHIFR,CURR_PERSON,START_MONTH));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(S_S_SHIFR+SHIFT_SHIFR,CURR_PERSON,START_MONTH));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(S_S_SHIFR,CURR_PERSON,START_MONTH));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(FOND_Z_SHIFR+SHIFT_SHIFR,CURR_PERSON,START_MONTH));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD(FOND_Z_SHIFR,CURR_PERSON,START_MONTH));

{
   +++   Проверить материальную помощь изменение от 11 10 2010 +++

}

      if ((NSRV=105) or (NSRV=106)) then
         begin
              Calc_Podoh_For_Mat_Help(CURR_PERSON,START_MONTH,START_YEAR);
              Exit;
         end;
{+++    конец изменений +++}


      KZ                  := 0;
      PODOH_NACH          := 0;
      BOL_NACH            := 0;
      PODOH_UD            := 0;
      ALIMENTY_NACH       := 0;
      ALIMENTY_UD         := 0;
      PENS_NACH           := 0;
      PENS_UD             := 0;
      PENS_SELF_NACH      := 0;
      PENS_SELF_UD        := 0;
      ECB_NACH            := 0;
      ECB_UD              := 0;
      ECBN_NACH           := 0;
      ECBN_UD             := 0;
      ECB_DP_NACH         := 0;
      ECB_DP_UD           := 0;
      ECB_ILL_NACH         := 0;
      ECB_Ill_UD           := 0;
      S_S_NACH            := 0;
      S_S_UD              := 0;
      S_S_SELF_NACH       := 0;
      S_S_SELF_UD         := 0;
      F_Z_NACH            := 0;
      F_Z_UD              := 0;
      F_Z_SELF_NACH       := 0;
      F_Z_SELF_UD         := 0;

      IF (START_MONTH=NMES) AND (NOT FLAG_NAUD_FOR_OTHER_MONTH) THEN
         BEGIN
              SET_UP_FIELDS_FOR_NALOG(CURR_PERSON,START_MONTH,START_YEAR,NMESOLD,
                                      NSRV_OSN,C_PERSON_OSN_2);
              IF KZ=0 THEN
                 BEGIN
                      NSRV:=NSRV_OSN;
                      IF CURR_PERSON^.WID_RABOTY=2 THEN
                         COUNT_MAIN_FIELD(C_PERSON_OSN_2 ,
                                          START_MONTH    , START_YEAR  ,
                                          NMESOLD        , PODOH_NACH  ,
                                          BOL_NACH       , PODOH_UD    ,
                                          ALIMENTY_NACH  , ALIMENTY_UD ,
                                          PENS_NACH      , PENS_UD     ,
                                          S_S_NACH       , S_S_UD      ,
                                          F_Z_NACH       , F_Z_UD      ,
                                          KOL_WO_DETEJ);
                      COUNT_SOWM_FIELD(C_PERSON_OSN_2 , CURR_PERSON    ,
                                       START_MONTH    , START_YEAR     ,
                                       NSRV_IN_FIELD1 , PODOH_NACH     ,
                                       BOL_NACH       , PODOH_UD       ,
                                       ALIMENTY_NACH  , ALIMENTY_UD    ,
                                       PENS_NACH      , PENS_UD        ,
                                       S_S_NACH       , S_S_UD         ,
                                       F_Z_NACH       , F_Z_UD         ,
                                       NSRV_OSN       , WORK_MONTH);
                      IF C_PERSON_OSN_2^.MAIN=2 THEN
                         ADD_MAIN_FROM(C_PERSON_OSN_2 ,
                                       START_MONTH    , START_YEAR     ,
                                       NMESOLD        , PODOH_NACH     ,
                                       BOL_NACH       , PODOH_UD       ,
                                       ALIMENTY_NACH  , ALIMENTY_UD    ,
                                       PENS_NACH      , PENS_UD        ,
                                       S_S_NACH       , S_S_UD         ,
                                       F_Z_NACH       , F_Z_UD );
                 END;
              DELETE_ADDED_FIELD;
              GET_SUMMY_FOR_PODOH(Curr_Person,
                                NSRV,
                                Start_Month,
                                Start_Year,
                                PODOH_NACH,PODOH_UD,
                                ALIMENTY_NACH,ALIMENTY_UD,
                                PENS_NACH,PENS_UD,
                                S_S_NACH,S_S_UD,
                                F_Z_NACH,F_Z_UD);
         END
                          ELSE
         BEGIN
              if Length(AllTrim(WORK_YEAR))>3 then
                 begin
                       VAL(WORK_YEAR,Y,I);
                       IF I<>0 THEN
                          BEGIN
                               ERROR('Не преобразовывается год '+WORK_YEAR+' г.');
                               KZ:=-1;
                               EXIT;
                          END
                 end
              else
                  Y:=CurrYear;
              IF (START_MONTH>NMES) AND (ABS(START_MONTH-NMES)>6) THEN Y:=Y-1;
             GET_SUMMY_FOR_PODOH(CURR_PERSON,NSRV,START_MONTH,Y,
                                  PODOH_NACH,PODOH_UD,
                                  ALIMENTY_NACH,ALIMENTY_UD,
                                  PENS_NACH,PENS_UD,
                                  S_S_NACH,S_S_UD,
                                  F_Z_NACH,F_Z_UD);
         END;
      NMES:=NMESOLD;
      NSRV:=NSRVOLD;
      SELECT(1);
      MKFLNM;
      FOUND:=FALSE;
      IF (CURR_PERSON^.WID_RABOTY=OSN_WID_RABOTY) OR
         ((CURR_PERSON^.WID_RABOTY=SOWM_WID_RABOTY) AND (RECENZENT_PODRAZD(Nomer_Serv(CURR_PERSON^.MESTO_OSN_RABOTY)))) THEN
         BEGIN

               PODOH_NACH       := PODOH_NACH     + NACH_PERSON_EXL(CURR_PERSON,START_MONTH,START_YEAR,Start_Month,TRUE);
               BOL_NACH         := BOL_NACH       + NACH_BOL_PERSON_EXL(CURR_PERSON,START_MONTH,START_YEAR);
               PENS_NACH        := PENS_NACH      + NACH_PERSON_PENS_EXL(CURR_PERSON,START_MONTH,START_YEAR);
               S_S_NACH         := S_S_NACH       + NACH_PERSON_S_S_EXL(CURR_PERSON,START_MONTH,START_YEAR);
               F_Z_NACH         := F_Z_NACH       + NACH_PERSON_F_Z_EXL(CURR_PERSON,START_MONTH,START_YEAR);
               ALIMENTY_NACH    := ALIMENTY_NACH  + NACH_PERSON_ALIMENTY(CURR_PERSON,START_MONTH,START_YEAR);
               KOL_WO_DETEJ     := CURR_PERSON^.MALO;
         END;
    { Собственыый пенс налог }
      PENS_SELF_NACH   := PENS_SELF_NACH      + NACH_PERSON_PENS_EXL(CURR_PERSON,START_MONTH,START_YEAR);
      S_S_SELF_NACH    := S_S_SELF_NACH       + NACH_PERSON_S_S_EXL(CURR_PERSON,START_MONTH,START_YEAR);
      F_Z_SELF_NACH    := F_Z_SELF_NACH       + NACH_PERSON_F_Z_EXL(CURR_PERSON,START_MONTH,START_YEAR);
      J:=COUNT_UD(CURR_PERSON);
{
      IF GET_STIPENDIJA(CURR_PERSON,START_MONTH)>0.01 THEN
         PODOH_UD:=PODOH_UD+PODOH(GET_STIPENDIJA(CURR_PERSON,START_MONTH),START_MONTH,KOL_WO_DETEJ,CURR_PERSON)*
                   CURR_PERSON^.PODOH/100;
}
      IF CURR_PERSON^.WID_RABOTY=OSN_WID_RABOTY THEN
         begin
              Curr_Ud:=Curr_Person^.Ud;
              WHILE (Curr_Ud<>NIL) DO
                BEGIN
                     IF (CURR_UD^.SHIFR      = PODOH_SHIFR) OR
                        (CURR_UD^.SHIFR      = PODOH_SHIFR+SHIFT_SHIFR) THEN
                     IF CURR_UD^.PERIOD     = START_MONTH THEN
                     IF CURR_UD^.VYPLACHENO = GET_OUT     THEN
                        PODOH_UD:=R10(PODOH_UD)+R10(CURR_UD^.SUMMA);
                     IF (CURR_UD^.SHIFR      = ALIMENTY_SHIFR) OR
                        (CURR_UD^.SHIFR      = ALIMENTY_SHIFR+SHIFT_SHIFR) THEN
                     IF CURR_UD^.PERIOD     = START_MONTH THEN
                     IF CURR_UD^.VYPLACHENO = GET_OUT     THEN
                        ALIMENTY_UD := R10(ALIMENTY_UD)+R10(CURR_UD^.SUMMA);
                    { Собственыый пенс налог }
                     IF (CURR_UD^.SHIFR      = PENS_SHIFR) OR
                        (CURR_UD^.SHIFR      = PENS_SHIFR+SHIFT_SHIFR) THEN
                     IF CURR_UD^.PERIOD     = START_MONTH THEN
                     IF CURR_UD^.VYPLACHENO = GET_OUT     THEN
                        PENS_SELF_UD       := R10(PENS_SELF_UD)+R10(CURR_UD^.SUMMA);
                   { Собственыый пенс налог }
                     IF (CURR_UD^.SHIFR      = S_S_SHIFR) OR
                        (CURR_UD^.SHIFR      = S_S_SHIFR+SHIFT_SHIFR) THEN
                     IF CURR_UD^.PERIOD     = START_MONTH THEN
                     IF CURR_UD^.VYPLACHENO = GET_OUT     THEN
                        S_S_SELF_UD       := R10(S_S_SELF_UD)+R10(CURR_UD^.SUMMA);
                     Curr_Ud:=Curr_Ud^.NEXT;
                END;
              Pens_Ud:=Pens_Ud+GetSummaPensInCn(Curr_Person,Start_Month);
         end;

     MAKE_PERSON_PODOH(CURR_PERSON      , KOL_WO_DETEJ     ,
                       START_MONTH      , START_YEAR       ,
                       PODOH_NACH       , BOL_NACH         ,
                       PODOH_UD         , ALIMENTY_NACH    ,
                       ALIMENTY_UD      , PENS_NACH        ,
                       PENS_UD          , PENS_SELF_NACH   ,
                       PENS_SELF_UD     , s_S_NACH         ,
                       s_s_UD           , s_s_SELF_NACH    ,
                       s_s_SELF_UD      , f_z_NACH         ,
                       f_z_UD           , f_z_SELF_NACH    ,
                       f_z_SELF_UD      , ECBN_NACH        ,
                       ECBN_UD          , ECB_NACH         ,
                       ECB_UD           , ECB_DP_NACH      ,
                       ECB_DP_UD        , ECB_SELF_NACH    ,
                       ECB_SELF_UD      , ECB_ILL_NACH     ,
                       ECB_ILL_UD       , ECB_ILL_SELF_NACH,
                       ECB_ILL_SELF_UD   );
  END;

PROCEDURE UPDATE_PODOH_SQL(VAR CURR_PERSON:PERSON_PTR;START_MONTH:INTEGER;START_YEAR:WORD;MODERECALC:INTEGER);
  VAR
      Wanted_Year:integer;
      PODOH_NACH,BOL_NACH,PODOH_UD : REAL;
      ALIMENTY_NACH,ALIMENTY_UD   : REAL;
      ECB_NACH,ECB_UD   : REAL;
      ECB_SELF_NACH,ECB_SELF_UD   : REAL;
      ECBN_NACH,ECBN_UD   : REAL;
      ECBN_SELF_NACH,ECBN_SELF_UD   : REAL;
      ECB_ILL_NACH,ECB_ILL_UD   : REAL;
      ECB_ILL_SELF_NACH,ECB_ILL_SELF_UD   : REAL;
      ECB_DP_NACH,ECB_DP_UD   : REAL;
      ECB_DP_SELF_NACH,ECB_DP_SELF_UD   : REAL;

      NSRV_OSN:INTEGER;
      PODOH_NALOG:REAL;
      KOL_WO_DETEJ:INTEGER;
      NMESOLD : INTEGER;
      NSRVOLD : INTEGER;
      ModeCalcPerson:TModeCalcPerson;
  BEGIN
      if ProgramForRecalcNalogi=1 then
         begin
              Wanted_Year:=Start_Year;
              if Wanted_Year<1000 then
                 Wanted_Year:=Wanted_Year+1990;
              if ModeRecalc=1 then
                 ModeCalcPerson:=OnlyThisLine
               else if ModeReCalc=0 then
                 ModeCalcPerson:=TotalPersonRecalc
               else
                 ModeCalcPerson:=TryAutomatic;
              CreateTestPerson(Wanted_Year,Start_Month,Curr_Person,ModeCalcPerson);
              Exit;
         end;


      KOL_WO_DETEJ:=0;
      IF (START_MONTH<1) OR (START_MONTH>12)        THEN EXIT;
      IF (START_MONTH<>NMES) AND (NOT FLAG_NAUD_FOR_OTHER_MONTH) THEN EXIT;
      if CURR_PERSON.AUTOMATIC<>AUTOMATIC_MODE then Exit;
      NMESOLD    := NMES;
      NSRVOLD    := NSRV;
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(PODOH_SHIFR, CURR_PERSON, START_MONTH,Start_YEAR));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ALIMENTY_SHIFR,CURR_PERSON,START_MONTH,START_YEAR));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ALIMENTY_SHIFR+SHIFT_SHIFR,CURR_PERSON,START_MONTH,START_YEAR));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ECBSHIFR+SHIFT_SHIFR,CURR_PERSON,START_MONTH,START_YEAR));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ECBSHIFR,CURR_PERSON,START_MONTH,START_YEAR));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ECBNSHIFR+SHIFT_SHIFR,CURR_PERSON,START_MONTH,START_YEAR));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ECBNSHIFR,CURR_PERSON,START_MONTH,START_YEAR));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ECBIllSHIFR+SHIFT_SHIFR,CURR_PERSON,START_MONTH,START_YEAR));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ECBIllSHIFR,CURR_PERSON,START_MONTH,START_YEAR));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ECBDpSHIFR+SHIFT_SHIFR,CURR_PERSON,START_MONTH,START_YEAR));
      REPEAT
      UNTIL NOT (DEL_WANTED_UD_YEAR(ECBDpSHIFR,CURR_PERSON,START_MONTH,START_YEAR));

      if Start_Year<1900 then Wanted_Year:=Start_Year+1990
                         else Wanted_Year:=Start_Year;
      KZ                  := 0;
      PODOH_NACH          := 0;
      BOL_NACH            := 0;
      PODOH_UD            := 0;
      ALIMENTY_NACH       := 0;
      ALIMENTY_UD         := 0;
      ECB_NACH            := 0;
      ECB_UD              := 0;
      ECB_SELF_NACH       := 0;
      ECB_SELF_UD         := 0;
      ECBN_NACH           := 0;
      ECBN_UD             := 0;
      ECBN_SELF_NACH      := 0;
      ECBN_SELF_UD        := 0;
      ECB_ILL_NACH        := 0;
      ECB_ILL_UD          := 0;
      ECB_ILL_SELF_NACH   := 0;
      ECB_ILL_SELF_UD     := 0;
      ECB_DP_NACH         := 0;
      ECB_DP_UD           := 0;
      ECB_DP_SELF_NACH    := 0;
      ECB_DP_SELF_UD      := 0;
      if not Get_Summy_From_Sql_2011(Curr_Person,Wanted_Year,Start_Month,
          Podoh_Nach,Podoh_Ud,
          Alimenty_Nach,Alimenty_Ud,
          ECB_Nach,ECB_Ud,ECBN_Nach,ECBN_Ud,
          ECB_Ill_Nach,ECB_Ill_Ud,
          ECB_Dp_Nach,ECB_Dp_Ud) then
         Exit;
      NMES:=NMESOLD;
      NSRV:=NSRVOLD;
    { Собственыый пенс налог }
      ECB_SELF_NACH     := ECB_SELF_NACH      + NACH_PERSON_FOR_NALOG_EXL(ECBNalog,CURR_PERSON,START_MONTH,START_YEAR,START_MONTH,false);
      ECB_ILL_SELF_NACH := ECB_ILL_SELF_NACH  + NACH_PERSON_FOR_NALOG_EXL(ECBIllNalog,CURR_PERSON,START_MONTH,START_YEAR,START_MONTH,false);

     MAKE_PERSON_PODOH_2011(CURR_PERSON      , KOL_WO_DETEJ     ,
                       START_MONTH      , START_YEAR       ,
                       MODERECALC       ,
                       PODOH_NACH       , BOL_NACH         ,
                       PODOH_UD         , ALIMENTY_NACH    ,
                       ALIMENTY_UD      , ECBN_NACH        ,
                       ECBN_UD          , ECB_NACH         ,
                       ECB_UD           , ECB_DP_NACH      ,
                       ECB_DP_UD        , ECB_SELF_NACH    ,
                       ECB_SELF_UD      , ECB_ILL_NACH     ,
                       ECB_ILL_UD       , ECB_ILL_SELF_NACH,
                       ECB_ILL_SELF_UD   );
  END;

PROCEDURE CALC_PROF_PERSON(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER;YEAR:INTEGER);
 VAR INF:TEXT;
     I,J,II:INTEGER;
     CURR_ADD:ADD_PTR;
     CURR_UD,CURR_UDW :UD_PTR;
     CURR_CN :CN_PTR;
     SUMMA,PRF_PERSON:REAL;
     FOUND:BOOLEAN;
     L:BOOLEAN;
     PRF_UD:REAL;
 BEGIN
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
//     {$IFDEF SVDN}
//     Exit; // Отключен
//     {$ENDIF}
     L:=DEL_WANTED_UD(PROF_SHIFR,CURR_PERSON,PERIOD);
     IF IS_TEST_DEKRET(CURR_PERSON) THEN EXIT;
     PRF_PERSON:=0;
     IF CURR_PERSON=NIL THEN PRF_PERSON:=0.
                            ELSE
                BEGIN
                     J:=COUNT_CN(CURR_PERSON);
                     FOUND:=FALSE;
                     IF CURR_PERSON^.PROFSOJUZ<>1 THEN EXIT;
                     J:=COUNT_ADD(CURR_PERSON);
                     IF J<=0 THEN PRF_PERSON:=0.
                             ELSE
                        BEGIN
                             SUMMA:=0.;
                             FOR I:=1 TO J DO
                                 BEGIN
                                      IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                                             ELSE CURR_ADD:=CURR_ADD^.NEXT;
                                      IF CURR_ADD^.PERIOD = PERIOD THEN
                                      IF CURR_ADD^.YEAR   = YEAR   THEN
                                      IF ShifrList.ISPROF(CURR_ADD^.SHIFR) THEN SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
                                 END;
                             PRF_PERSON:=R10(SUMMA*0.01);
                        END;
                END;
        PRF_UD:=0;
        PRF_UD:=PRF_UD+SUM_VYPLACHENO_UD(PROF_SHIFR,CURR_PERSON,PERIOD);
        MAKE_UD(CURR_UDW,CURR_PERSON);
        CURR_UDW^.SUMMA     := R10(PRF_PERSON-PRF_UD);
        CURR_UDW^.PERIOD    := PERIOD;
        CURR_UDW^.YEAR      := YEAR;
        CURR_UDW^.SHIFR     := PROF_SHIFR;
        CURR_UDW^.WHO       := 1;
        IF ABS(CURR_UDW^.SUMMA)<0.01 THEN DEL_UD(CURR_UDW,CURR_PERSON);
 END;
PROCEDURE PROF_PERSON(CURR_PERSON:PERSON_PTR);
 VAR I:Integer;
     SUMMA:REAL;
     CURR_ADD:ADD_PTR;
     CURR_Ud:Ud_PTR;
     ItemList    : TItemList;
     Month,Year  : integer;
     ItemRec     : PItemRec;
 PROCEDURE DEL_PROF(PERIOD:INTEGER;YEAR:INTEGER);
  VAR CURR_UD : UD_PTR;
      I,I_U   : INTEGER;
      SEL     : BOOLEAN;
  BEGIN
       REPEAT
             I:=0;
             Curr_Ud:=Curr_Person^.UD;
             SEL:=FALSE;
             WHILE (Curr_Ud<>Nil) DO
              BEGIN
                   IF CURR_UD^.SHIFR  = PROF_SHIFR    THEN
                   IF CURR_UD^.PERIOD = PERIOD        THEN
                   IF CURR_UD^.YEAR   = YEAR          THEN
                   IF CURR_UD^.VYPLACHENO=NOT_GET_OUT THEN
                      BEGIN
                           DEL_UD(CURR_UD,CURR_PERSON);
                           Sel:=true;
                           Break;
                      END;
                   Curr_Ud:=Curr_Ud^.NEXT;
              END;
       UNTIL (NOT SEL);
  END;
 BEGIN
      SUMMA:=0.;
      COUNT_ADD(CURR_PERSON);
      ItemList:=TItemList.Create;
      IF COUNT_ADD(CURR_PERSON)>0 THEN
         BEGIN
              Curr_Add:=Curr_Person^.ADD;
              while (Curr_Add<>Nil) DO
                  BEGIN
                       Month:=Curr_Add^.Period;
                       Year:=Curr_Add^.Year;
                       if not ItemList.IsMonthYear(Month,Year) then
                          begin
                               New(ItemRec);
                               ItemRec^.Month:=Month;
                               ItemRec^.Year:=Year;
                               ItemList.Add(ItemRec);
                          end;
                       Curr_Add:=Curr_Add^.NEXT;
                  END;
         end;
      IF COUNT_UD(CURR_PERSON)>0 THEN
         BEGIN
              Curr_Ud:=Curr_Person^.Ud;
              while (Curr_Ud<>Nil) DO
                  BEGIN
                       Month := Curr_Ud^.Period;
                       Year  := Curr_Ud^.Year;
                       if not ItemList.IsMonthYear(Month,Year) then
                          begin
                               New(ItemRec);
                               ItemRec^.Month:=Month;
                               ItemRec^.Year:=Year;
                               ItemList.Add(ItemRec);
                          end;
                       Curr_Ud:=Curr_Ud^.NEXT;
                  END;
         end;
      if ItemList.Count>0 then
         for i:=1 to ItemList.Count do
             begin
                  Month:=PItemRec(ItemList.Items[i-1])^.Month;
                  Year:=PItemRec(ItemList.Items[i-1])^.Year;
                  CALC_PROF_PERSON(CURR_PERSON,Month,Year);
             end;
     ItemList.Free;
 END;


PROCEDURE WS_PERSON(CURR_PERSON:PERSON_PTR);
 VAR I:Integer;
     SUMMA:REAL;
     CURR_ADD:ADD_PTR;
     CURR_Ud:Ud_PTR;
     SummaAdd,SummaUD:Real;
 PROCEDURE DEL_WS(PERIOD:INTEGER;YEAR:INTEGER);
  VAR CURR_UD : UD_PTR;
      I,I_U   : INTEGER;
      SEL     : BOOLEAN;
  BEGIN
       REPEAT
             I:=0;
             Curr_Ud:=Curr_Person^.UD;
             SEL:=FALSE;
             WHILE (Curr_Ud<>Nil) DO
              BEGIN
                   IF CURR_UD^.SHIFR  = WAR_SBOR_SHIFR THEN
                   IF CURR_UD^.PERIOD = PERIOD         THEN
                   IF CURR_UD^.YEAR   = YEAR           THEN
                   IF CURR_UD^.VYPLACHENO=NOT_GET_OUT  THEN
                      BEGIN
                           DEL_UD(CURR_UD,CURR_PERSON);
                           Sel:=true;
                           Break;
                      END;
                   Curr_Ud:=Curr_Ud^.NEXT;
              END;
       UNTIL (NOT SEL);
  END;
 BEGIN
      if not isSVDN then
        Exit;
      if (NMES<>FLOW_MONTH) then Exit;
      if Curr_Person^.AUTOMATIC<>AUTOMATIC_MODE then Exit;
      if is_All_Blocked(Curr_Person) then Exit;
      DEL_WS(NMES,CurrYear-1990);
      SummaAdd:=0;
      Curr_Add:=Curr_Person.ADD;
      while (CURR_ADD<>Nil) do
        begin
              if ShifrList.IsWS(Curr_Add.Shifr) then
                 SummaAdd:=SummaAdd+Curr_Add.Summa;
              Curr_Add:=CURR_ADD.NEXT;
        end;
      SummaUd:=0;
      Curr_Ud:=Curr_Person.Ud;
      while (Curr_Ud<>Nil) do
        begin
             if CURR_Ud.Shifr  = WAR_SBOR_Shifr then
             if CURR_Ud.PERIOD = NMES then
                SummaUd:=SummaUd+Curr_Ud.Summa;
             Curr_Ud:=CURR_Ud.NEXT;
        end;
      Summa:=R10(getWSSumma(SummaAdd))-r10(SummaUd);
      if Abs(SUMMA)>0.01 then
         begin
              MAKE_UD(Curr_Ud,Curr_Person);
              CURR_Ud.SHIFR:=WAR_SBOR_SHIFR;
              CURR_Ud.SUMMA:=R10(Summa);
              CURR_Ud.PERIOD:=NMES;
              CURR_Ud.YEAR:=CurrYear-1990;
         end;
 END;




 PROCEDURE CALC_PENS_PERSON(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER);
 CONST PROCENT:ARRAY[1..12] OF REAL=(0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02);
 VAR INF:TEXT;
     I,J,II:INTEGER;
     CURR_ADD:ADD_PTR;
     CURR_UD,CURR_UDW :UD_PTR;
     CURR_CN :CN_PTR;
     SUMMA,PRF_PERSON:REAL;
     FOUND:BOOLEAN;
     PRF_UD:REAL;
 BEGIN
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
     REPEAT
     UNTIL NOT DEL_WANTED_UD(PENS_SHIFR,CURR_PERSON,PERIOD);
     PRF_PERSON:=0;
     IF CURR_PERSON=NIL THEN PRF_PERSON:=0.
                             ELSE
                BEGIN
                     J:=COUNT_ADD(CURR_PERSON);
                     IF J<=0 THEN PRF_PERSON:=0.
                             ELSE
                        BEGIN
                             SUMMA:=0.;
                             FOR I:=1 TO J DO
                                 BEGIN
                                      IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                                             ELSE CURR_ADD:=CURR_ADD^.NEXT;
                                      IF CURR_ADD^.PERIOD=PERIOD          THEN
                  {                    IF CURR_ADD^.VYPLACHENO=NOT_GET_OUT THEN      }
                                      IF ShifrList.ISPENS(CURR_ADD^.SHIFR)         THEN SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
                                 END;
{                             CURR_CN:=FIND_CN_BASE(CURR_PERSON,LIMIT_SHIFR,PERIOD);
                             IF CURR_CN<>NIL THEN SUMMA:=SUMMA+CURR_CN^.SUMMA;
}                             IF PERIOD IN [1..12] THEN PRF_PERSON:=R10(SUMMA*PROCENT[PERIOD])
                                                  ELSE PRF_PERSON:=0;
                        END;
                END;
     PRF_UD:=0;
     PRF_UD:=PRF_UD+SUM_VYPLACHENO_UD(PENS_SHIFR,CURR_PERSON,PERIOD);
     SUMMA:=PRF_PERSON-PRF_UD;
     IF (ABS(SUMMA)>0.009999) THEN
        BEGIN
             MAKE_UD(CURR_UDW,CURR_PERSON);
             CURR_UDW^.SUMMA     := R10(SUMMA);
             CURR_UDW^.PERIOD    := PERIOD;
             CURR_UDW^.SHIFR     := PENS_SHIFR;
             CURR_UDW^.WHO       := 1;
             IF ABS(CURR_UDW^.SUMMA)<0.01 THEN DEL_UD(CURR_UDW,CURR_PERSON);
        END;
 END;
PROCEDURE PENS_PERSON(CURR_PERSON:PERSON_PTR);
 VAR I,II,I_A:INTEGER;
     MO:ARRAY[1..12] OF BOOLEAN;
     SUMMA:REAL;
     CURR_ADD:ADD_PTR;
 PROCEDURE DEL_PENS(PERIOD:INTEGER);
  VAR CURR_UD:UD_PTR;
      SEL:BOOLEAN;
  BEGIN
       REPEAT
             SEL:=FALSE;
             Curr_Ud:=Curr_Person^.UD;
             WHILE (Curr_Ud<>Nil) DO
              BEGIN
                   IF CURR_UD^.SHIFR    = PENS_SHIFR  THEN
                   IF CURR_UD^.PERIOD   = PERIOD      THEN
                   IF CURR_UD^.VYPLACHENO=NOT_GET_OUT THEN
                      BEGIN
                           DEL_UD(CURR_UD,CURR_PERSON);
                           SEL:=TRUE;
                           Break;
                      END;
                   Curr_Ud:=Curr_Ud^.NEXT;
              END;
       UNTIL (NOT SEL);
  END;
 BEGIN

       EXIT;

      SUMMA:=0.;
      FOR I:=1 TO 12 DO MO[I]:=FALSE;
      I_A:=COUNT_ADD(CURR_PERSON);
      IF I_A>0 THEN
      FOR I:=1 TO I_A DO
          BEGIN
               IF I=1 THEN CURR_ADD := CURR_PERSON^.ADD
                      ELSE CURR_ADD := CURR_ADD^.NEXT;
               MO[CURR_ADD^.PERIOD]  := TRUE;
          END;
      FOR I:=1 TO 12 DO IF MO[I] THEN
          BEGIN
{               IF CURR_PERSON^.TABNO=48 THEN
                  BEGIN
               GOTOXY(1,25);
               CLREOL;
               WRITE('I=',I);
               II:=INKEY;
               GOTOXY(1,25);
               CLREOL;
                  END;                       }
               CALC_PENS_PERSON(CURR_PERSON,I);
          END
                                 ELSE DEL_PENS(I);
 END;
PROCEDURE CALC_S_S_PERSON(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER);
 CONST PROCENT:ARRAY[1..12] OF REAL=(0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005);
 VAR INF:TEXT;
     I,J,II:INTEGER;
     CURR_ADD:ADD_PTR;
     CURR_UD,CURR_UDW :UD_PTR;
     CURR_CN :CN_PTR;
     SUMMA,PRF_PERSON:REAL;
     FOUND:BOOLEAN;
     PRF_UD:REAL;
 BEGIN
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
     REPEAT
     UNTIL NOT DEL_WANTED_UD(PENS_SHIFR,CURR_PERSON,PERIOD);
{     IF IS_TEST_DEKRET(CURR_PERSON) THEN EXIT;                   }
     PRF_PERSON:=0;
     IF CURR_PERSON=NIL THEN PRF_PERSON:=0.
                             ELSE
                BEGIN
                     J:=COUNT_ADD(CURR_PERSON);
                     IF J<=0 THEN PRF_PERSON:=0.
                             ELSE
                        BEGIN
                             SUMMA:=0.;
                             FOR I:=1 TO J DO
                                 BEGIN
                                      IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                                             ELSE CURR_ADD:=CURR_ADD^.NEXT;
                                      IF CURR_ADD^.PERIOD=PERIOD          THEN
                  {                    IF CURR_ADD^.VYPLACHENO=NOT_GET_OUT THEN      }
                                      IF ShifrList.IsPens(CURR_ADD^.SHIFR)         THEN SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
                                 END;
{                             CURR_CN:=FIND_CN_BASE(CURR_PERSON,LIMIT_SHIFR,PERIOD);
                             IF CURR_CN<>NIL THEN SUMMA:=SUMMA+CURR_CN^.SUMMA;
}                             IF PERIOD IN [1..12] THEN PRF_PERSON:=R10(SUMMA*PROCENT[PERIOD])
                                                  ELSE PRF_PERSON:=0;
                        END;
                END;
     PRF_UD:=0;
  {   CURR_CN:=FIND_CN_BASE(CURR_PERSON,PENS_SHIFR,PERIOD);
     IF CURR_CN<>NIL THEN PRF_UD:=PRF_UD+CURR_CN^.SUMMA;
}     PRF_UD:=PRF_UD+SUM_VYPLACHENO_UD(PENS_SHIFR,CURR_PERSON,PERIOD);
     SUMMA:=PRF_PERSON-PRF_UD;
     IF (ABS(SUMMA)>0.009999) THEN
        BEGIN
             MAKE_UD(CURR_UDW,CURR_PERSON);
             CURR_UDW^.SUMMA     := R10(SUMMA);
             CURR_UDW^.PERIOD    := PERIOD;
             CURR_UDW^.SHIFR     := PENS_SHIFR;
             CURR_UDW^.WHO       := 1;
             IF ABS(CURR_UDW^.SUMMA)<0.01 THEN DEL_UD(CURR_UDW,CURR_PERSON);
        END;
 END;

  { Возвращает проф. взносы для для расчета алиментов }

FUNCTION PROF(CURR_PERSON:PERSON_PTR;SUMMA:REAL;PERIOD:INTEGER):REAL;
 BEGIN
     PROF:=0;
     IF CURR_PERSON^.PROFSOJUZ=1 then
        PROF:=R10(SUMMA*0.01);
 END;
  { Возвращает фонд занятости для расчета алиментов }


FUNCTION FOND_Z(CURR_PERSON:PERSON_PTR;SUMMA:REAL;PERIOD:INTEGER;START_YEAR:INTEGER):REAL;
 CONST PROCENT:ARRAY[1..12] OF REAL=(0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006);
 VAR PRCNT : REAL;
     Y     : integer;
     Lim   : real;
 BEGIN
     FOND_Z:=R10(SUMMA*PROCENT[PERIOD]);
     Y:=Start_Year;
     if Y<100 then Y:=Y+1990;
     if ((Period<1) or (Period>12)) then Period:=1;
   //  Lim:=PARSAL[3,Period];
     Lim:=GET_LIMIT_FOR_PENS(Y,Period);
     if (Y>=2009) then       {c 2009 года установлен лимит суммы }
        if summa>Lim then summa:=lim;
     IF (Y=2009) AND (PERIOD=1) THEN
        BEGIN
             IF IS_PENSIONER(CURR_PERSON) THEN
                FOND_Z:=R10(SUMMA/20*14*0.006)
             ELSE
                FOND_Z:=R10((SUMMA/20*6*0.005) + (SUMMA/20*14*0.006))
        END
     ELSE
        BEGIN
             IF (Y<2009) THEN PRCNT:=0.005
                         ELSE PRCNT:=PROCENT[PERIOD];
             FOND_Z:=R10(SUMMA*PRCNT)
        END
 END;

PROCEDURE CALC_FOND_PERSON(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER;YEAR:INTEGER);
 CONST PROCENT:ARRAY[1..12] OF REAL=(0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006,0.006);
 VAR INF:TEXT;
     W_Y,I,J,II:INTEGER;
     CURR_ADD:ADD_PTR;
     CURR_UD,CURR_UDW :UD_PTR;
     CURR_CN :CN_PTR;
     SUMMA,PRF_PERSON:REAL;
     FOUND:BOOLEAN;
     PRF_UD:REAL;
     PRCNT : REAL;
 BEGIN
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
     REPEAT
     UNTIL NOT DEL_WANTED_UD(FOND_Z_SHIFR,CURR_PERSON,PERIOD);
     W_Y:=1996;
     VAL(WORK_YEAR,W_Y,I);
     IF (W_Y<=1997) AND (PERIOD<7) THEN EXIT;
     if IS_PENSIONER(CURR_PERSON) THEN
        IF W_Y<2009 THEN EXIT;
{     IF IS_TEST_DEKRET(CURR_PERSON) THEN EXIT;                   }
     PRF_PERSON:=0;
     IF CURR_PERSON=NIL THEN PRF_PERSON:=0.
                             ELSE
                BEGIN
                     SUMMA:=0;
                     J:=COUNT_ADD(CURR_PERSON);
                     IF J<=0 THEN PRF_PERSON:=0.
                             ELSE
                        BEGIN
                             SUMMA:=0.;
                             FOR I:=1 TO J DO
                                 BEGIN
                                      IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                                             ELSE CURR_ADD:=CURR_ADD^.NEXT;
                                      IF CURR_ADD^.PERIOD = PERIOD          THEN
                                      IF CURR_ADD^.YEAR   = YEAR            THEN
//                                      IF ISFOND(CURR_ADD^.SHIFR)         THEN SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
                                      IF SHIFRLIST.ISFONDZ(CURR_ADD^.SHIFR)         THEN SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
                                 END;
                        END;
                     IF (W_Y=1997) AND (((PERIOD=9) AND (NMES=9)) OR
                                        ((PERIOD=10) AND (NMES=10))) THEN
                        BEGIN
                             CURR_CN:=FIND_CN_BASE(CURR_PERSON,TOTAL_ADD_SHIFR,PERIOD);
                             IF CURR_CN<>NIL THEN SUMMA:=SUMMA+CURR_CN^.SUMMA;
                        END;
                     IF (W_Y=2009) AND (PERIOD=1) THEN
                        BEGIN
                             IF IS_PENSIONER(CURR_PERSON) THEN
                                PRF_PERSON:=R10((SUMMA/20*13*0.006))
                             ELSE
                                PRF_PERSON:=R10((SUMMA/20*7*0.005) + (SUMMA/20*13*0.006))
                        END
                     ELSE
                        BEGIN
                             IF (W_Y<2009) THEN PRCNT:=0.005
                                           ELSE PRCNT:=PROCENT[PERIOD];
                             PRF_PERSON:=R10(SUMMA*PRCNT)
                        END
{
                     IF PERIOD IN [1..12] THEN PRF_PERSON:=R10(SUMMA*PROCENT[PERIOD])
                                          ELSE PRF_PERSON:=0;
}
                END;
     PRF_UD:=0;
     PRF_UD:=PRF_UD+SUM_VYPLACHENO_UD(FOND_Z_SHIFR,CURR_PERSON,PERIOD);
     SUMMA:=PRF_PERSON-PRF_UD;
     IF (ABS(SUMMA)>0.009999) THEN
        BEGIN
             MAKE_UD(CURR_UDW,CURR_PERSON);
             CURR_UDW^.SUMMA     := R10(SUMMA);
             CURR_UDW^.PERIOD    := PERIOD;
             CURR_UDW^.YEAR      := YEAR;
             CURR_UDW^.SHIFR     := FOND_Z_SHIFR;
             CURR_UDW^.WHO       := 1;
             IF ABS(CURR_UDW^.SUMMA)<0.01 THEN DEL_UD(CURR_UDW,CURR_PERSON);
        END;
 END;

(*
PROCEDURE CALC_FOND_PERSON(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER;YEAR:INTEGER);
 CONST PROCENT:ARRAY[1..12] OF REAL=(0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005,0.005);
 VAR INF:TEXT;
     W_Y,I,J,II:INTEGER;
     CURR_ADD:ADD_PTR;
     CURR_UD,CURR_UDW :UD_PTR;
     CURR_CN :CN_PTR;
     SUMMA,PRF_PERSON:REAL;
     FOUND:BOOLEAN;
     PRF_UD:REAL;
 BEGIN
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
     REPEAT
     UNTIL NOT DEL_WANTED_UD(FOND_Z_SHIFR,CURR_PERSON,PERIOD);
     W_Y:=1996;
     VAL(WORK_YEAR,W_Y,I);
     IF (W_Y<=1997) AND (PERIOD<7) THEN EXIT;
     if IS_PENSIONER(CURR_PERSON) THEN EXIT;
{     IF IS_TEST_DEKRET(CURR_PERSON) THEN EXIT;                   }
     PRF_PERSON:=0;
     IF CURR_PERSON=NIL THEN PRF_PERSON:=0.
                             ELSE
                BEGIN
                     SUMMA:=0;
                     J:=COUNT_ADD(CURR_PERSON);
                     IF J<=0 THEN PRF_PERSON:=0.
                             ELSE
                        BEGIN
                             SUMMA:=0.;
                             FOR I:=1 TO J DO
                                 BEGIN
                                      IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                                             ELSE CURR_ADD:=CURR_ADD^.NEXT;
                                      IF CURR_ADD^.PERIOD = PERIOD          THEN
                                      IF CURR_ADD^.YEAR   = YEAR            THEN
                                      IF SHIFRLIST.ISFONDZ(CURR_ADD^.SHIFR)         THEN SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
                                 END;
                        END;
                     IF (W_Y=1997) AND (((PERIOD=9) AND (NMES=9)) OR
                                        ((PERIOD=10) AND (NMES=10))) THEN
                        BEGIN
                             CURR_CN:=FIND_CN_BASE(CURR_PERSON,LIMIT_SHIFR,PERIOD);
                             IF CURR_CN<>NIL THEN SUMMA:=SUMMA+CURR_CN^.SUMMA;
                        END;
                     IF PERIOD IN [1..12] THEN PRF_PERSON:=R10(SUMMA*PROCENT[PERIOD])
                                          ELSE PRF_PERSON:=0;
                END;
     PRF_UD:=0;
     PRF_UD:=PRF_UD+SUM_VYPLACHENO_UD(FOND_Z_SHIFR,CURR_PERSON,PERIOD);
     SUMMA:=PRF_PERSON-PRF_UD;
     IF (ABS(SUMMA)>0.009999) THEN
        BEGIN
             MAKE_UD(CURR_UDW,CURR_PERSON);
             CURR_UDW^.SUMMA     := R10(SUMMA);
             CURR_UDW^.PERIOD    := PERIOD;
             CURR_UDW^.YEAR      := YEAR;
             CURR_UDW^.SHIFR     := FOND_Z_SHIFR;
             CURR_UDW^.WHO       := 1;
             IF ABS(CURR_UDW^.SUMMA)<0.01 THEN DEL_UD(CURR_UDW,CURR_PERSON);
        END;
 END;
 *)
PROCEDURE FOND_PERSON(CURR_PERSON:PERSON_PTR);
 VAR I:INTEGER;
     CURR_ADD:ADD_PTR;
     ItemList    : TItemList;
     ItemRec     : PItemRec;
     Period,Y    : Integer;
 PROCEDURE DEL_FOND(PERIOD:INTEGER;YEAR:INTEGER);
  VAR CURR_UD:UD_PTR;
      SEL:BOOLEAN;
  BEGIN
       REPEAT
             SEL:=FALSE;
             Curr_Ud:=Curr_Person^.UD;
             WHILE (Curr_Ud<>Nil) DO
              BEGIN
                   IF CURR_UD^.SHIFR    = FOND_Z_SHIFR  THEN
                   IF CURR_UD^.PERIOD   = PERIOD      THEN
                   IF CURR_UD^.YEAR     = YEAR        THEN
                   IF CURR_UD^.VYPLACHENO=NOT_GET_OUT THEN
                      BEGIN
                           DEL_UD(CURR_UD,CURR_PERSON);
                           SEL:=TRUE;
                           break;
                      END;
                   Curr_Ud:=Curr_Ud^.NEXT;
              END;
       UNTIL (NOT SEL);
  END;
 BEGIN
      EXIT;

      IF DOG_POD_PODRAZD(NSRV) THEN EXIT;   { ДЛЯ ДОГОВОРОВ ПОДРЯДА НА СЧИТАТЬ СОЦ.СТРАХ }
      ItemList:=TItemList.Create;
      IF COUNT_ADD(CURR_PERSON)>0 THEN
         BEGIN
              Curr_Add:=Curr_Person^.ADD;
              while (Curr_Add<>Nil) DO
                  BEGIN
                       Period := Curr_Add^.PERIOD;
                       Y      := Curr_Add^.Year;
                       if not ItemList.IsMonthYear(Period,Y) then
                          begin
                                New(ItemRec);
                                ItemRec^.Month := Period;
                                ItemRec^.Year  := Y;
                                ItemList.Add(ItemRec);
                          end;
                       Curr_Add:=Curr_Add^.NEXT;
                  END;
              if ItemList.Count>0 then
                 for i:=1 to ItemList.Count do
                     begin
                          Period := PItemRec(ItemList.Items[i-1])^.MONTH;
                          Y      := PItemRec(ItemList.Items[i-1])^.Year;
                          DEL_FOND(PERIOD,Y);
                          CALC_FOND_PERSON(CURR_PERSON,Period,Y);
                     end;
         END;
      ItemList.Free;
 END;

PROCEDURE PODOH_PERSON(VAR CURR_PERSON:PERSON_PTR;moderecalc:integer;ModeDelOtherMonth:integer=0);
 VAR INF:TEXT;
     I,J,II,III:INTEGER;
     CURR_ADD:ADD_PTR;
     CURR_UD :UD_PTR;
     SUMMA,POD_PERSON,P:REAL;
     FOUND:BOOLEAN;
     ItemList    : TItemList;
     ItemRec     : PItemRec;
     Period,Y    : integer;
     Done        : boolean;

 PROCEDURE DEL_PODOH(PERIOD:INTEGER;YEAR:INTEGER);
  VAR CURR_UD:UD_PTR;
      SEL:BOOLEAN;
  BEGIN
       REPEAT
             SEL:=FALSE;
             Curr_Ud:=Curr_Person^.UD;
             WHILE (Curr_Ud<>Nil) DO
              BEGIN
                   IF CURR_UD^.SHIFR=PODOH_SHIFR   THEN
                   IF CURR_UD^.PERIOD = PERIOD     THEN
                   IF CURR_UD^.YEAR   = YEAR       THEN
{                   IF CURR_UD^.WHO<>RECALC_PODOH   THEN}
                   IF CURR_UD^.VYPLACHENO<>GET_OUT THEN
                      BEGIN
                           DEL_UD(CURR_UD,CURR_PERSON);
                           SEL:=TRUE;
                           break;
                      END;
                   Curr_Ud:=Curr_Ud^.NEXT;
              END;
       UNTIL (NOT SEL);
  END;
 BEGIN
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
     SUMMA:=0.;
     ItemList:=TItemList.Create;
     Curr_Add:=Curr_Person^.ADD;
     while (Curr_Add<>Nil) do
      BEGIN
           Period:=Curr_Add^.PERIOD;
           Y:=Curr_Add^.Year;
           if not IsOtherPeriodECBShifr(Curr_Add^.Shifr) then
              begin
                   Period:=NMES;
                   Y:=CurrYear-1990;
              end;
           if not ItemList.IsMonthYear(Period,Y) then
              begin
                    New(ItemRec);
                    ItemRec^.Month := Period;
                    ItemRec^.Year  := Y;
                    ItemList.Add(ItemRec);
              end;
           Curr_Add:=Curr_Add^.NEXT;
      end;

  if ((ModeDelOtherMonth=1) and NeedDelOtherMonthNalogi) then
     while true do
       begin
             Done:=true;
             Curr_Ud:=Curr_Person^.Ud;
             while (Curr_Ud<>Nil) do
               BEGIN
                    Period:=Curr_Ud^.PERIOD;
                    Y:=Curr_Ud^.Year;
                    IF CURR_UD^.VYPLACHENO<>GET_OUT THEN
                    if (Curr_Ud^.Shifr=podoh_Shifr) or
                       (Curr_Ud^.Shifr=pens_Shifr)  or
                       (Curr_Ud^.Shifr=s_s_Shifr)   or
                       (Curr_Ud^.Shifr=ECBShifr)    or
                       (Curr_Ud^.Shifr=ECBNShifr)   or
                       (Curr_Ud^.Shifr=ECBIllShifr)   or
                       (Curr_Ud^.Shifr=ECBDPShifr)   then
                    if not ItemList.IsMonthYear(Period,Y) then
                       begin
                             Del_Ud(Curr_Ud,Curr_Person);
                             done:=false;
                             break;
                       end;
                    Curr_Ud:=Curr_Ud^.NEXT;
               end;
               if Done then break;
       end;

     if ItemList.Count>0 then
        for i:=1 to ItemList.Count do
            begin
                 Period := PItemRec(ItemList.Items[i-1])^.Month;
                 Y      := PItemRec(ItemList.Items[i-1])^.Year;
                 UPDATE_PODOH(CURR_PERSON,Period,Y,MODERECALC);
            end;
     ItemList.Free;
 END;
{
 PROCEDURE CALC_PODOH;
  VAR CURR_PERSON:PERSON_PTR;
  BEGIN
      Curr_Person:=Head_Person;
      while Curr_Person<>Nil DO
       BEGIN
            PODOH_PERSON(CURR_PERSON);
            PROF_PERSON(CURR_PERSON);
      //      PENS_PERSON(CURR_PERSON);
            CURR_PERSON:=CURR_PERSON^.NEXT;
       END;
  END;
}  
PROCEDURE CALC_PODOH_SOWM_PERSON(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER);
 VAR
     I,J,II:INTEGER;
     CURR_ADD:ADD_PTR;
     CURR_UD :UD_PTR;
     SUMMA,M_PERSON:REAL;
     FOUND:BOOLEAN;
     PROC_SOWM:REAL;
 BEGIN
     PROC_SOWM:=0.13;
     if CURRYEAR<2004 THEN PROC_SOWM:=0.20;
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE  THEN EXIT;
     IF CURR_PERSON^.WID_RABOTY<>SOWM_WID_RABOTY THEN EXIT;
     REPEAT
     UNTIL NOT (DEL_WANTED_UD(PODOH_SHIFR,CURR_PERSON,PERIOD));
     J:=COUNT_ADD(CURR_PERSON);
     IF J<=0 THEN M_PERSON:=0.
            ELSE
                 BEGIN
                      SUMMA:=0.;
                      FOR I:=1 TO J DO
                         BEGIN
                              IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                                      ELSE CURR_ADD:=CURR_ADD^.NEXT;
                              IF CURR_ADD^.PERIOD=PERIOD  THEN
                              IF ShifrList.ISPODOH(CURR_ADD^.SHIFR) THEN SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
                         END;
                      M_PERSON:=SUMMA*PROC_SOWM*CURR_PERSON^.PODOH/100.
                  END;
     MAKE_UD(CURR_UD,CURR_PERSON);
     CURR_UD^.SUMMA     := R10(M_PERSON-SUM_VYPLACHENO_UD(PODOH_SHIFR,CURR_PERSON,PERIOD));
     CURR_UD^.PERIOD    := PERIOD;
     CURR_UD^.SHIFR     := PODOH_SHIFR;
     CURR_UD^.WHO       := 1;
     IF ABS(CURR_UD^.SUMMA)<0.01 THEN DEL_UD(CURR_UD,CURR_PERSON);
 END;
(* PROCEDURE PODOH_SOWM_PERSON(CURR_PERSON:PERSON_PTR);
  VAR I,I_A:INTEGER;
      MO:ARRAY[1..12] OF BOOLEAN;
      SUMMA:REAL;
      CURR_ADD:ADD_PTR;
  BEGIN
       SUMMA:=0.;
       IF CURR_PERSON^.WID_RABOTY<>SOWM_WID_RABOTY THEN EXIT;
       FOR I:=1 TO 12 DO MO[I]:=FALSE;
       I_A:=COUNT_ADD(CURR_PERSON);
       IF I_A>0 THEN
       FOR I:=1 TO I_A DO
           BEGIN
                IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                       ELSE CURR_ADD := CURR_ADD^.NEXT;
                MO[CURR_ADD^.PERIOD]  := TRUE;
           END;
       FOR I:=1 TO 12 DO IF MO[I] THEN CALC_PODOH_SOWM_PERSON(CURR_PERSON,I);
  END;*)
(* PROCEDURE CALC_PODOH_SOWM;
  VAR I,ii,J,K:INTEGER;
      CURR_PERSON:PERSON_PTR;
  BEGIN
       I:=COUNT_PERSON;
       IF I>0 THEN
          FOR J:=1 TO I DO
             BEGIN
                  IF J=1 THEN CURR_PERSON:=HEAD_PERSON
                         ELSE CURR_PERSON:=CURR_PERSON^.NEXT;
                  PODOH_SOWM_PERSON(CURR_PERSON);
             END;
  END;*)
 PROCEDURE CALC_PROF;
  VAR I,ii,J,K:INTEGER;
      CURR_PERSON:PERSON_PTR;
  BEGIN
       I:=COUNT_PERSON;
       IF I>0 THEN
          FOR J:=1 TO I DO
             BEGIN
                  IF J=1 THEN CURR_PERSON:=HEAD_PERSON
                         ELSE CURR_PERSON:=CURR_PERSON^.NEXT;
                  PROF_PERSON(CURR_PERSON);
             END;
  END;
 PROCEDURE CALC_PENS;
  VAR I,ii,J,K:INTEGER;
      CURR_PERSON:PERSON_PTR;
  BEGIN
       I:=COUNT_PERSON;
       IF I>0 THEN
          FOR J:=1 TO I DO
             BEGIN
                  IF J=1 THEN CURR_PERSON:=HEAD_PERSON
                         ELSE CURR_PERSON:=CURR_PERSON^.NEXT;
                  PENS_PERSON(CURR_PERSON);
             END;
  END;
 PROCEDURE CALC_FOND;
  VAR I,ii,J,K:INTEGER;
      CURR_PERSON:PERSON_PTR;
  BEGIN
       I:=COUNT_PERSON;
       IF I>0 THEN
          FOR J:=1 TO I DO
             BEGIN
                  IF J=1 THEN CURR_PERSON:=HEAD_PERSON
                         ELSE CURR_PERSON:=CURR_PERSON^.NEXT;
                  FOND_PERSON(CURR_PERSON);
             END;
  END;
PROCEDURE OKLAD_PERSON(CURR_PERSON:PERSON_PTR;LAST_DAY:INTEGER);
 VAR
     C_ADD:INTEGER;
     I,J,II:INTEGER;
     CURR_ADD:ADD_PTR;
     SUMMA,O_PERSON:REAL;
     FOUND:BOOLEAN;
     OO:REAL;
     DEJA_SUMMA:REAL;
     WANTED_SHIFR:INTEGER;
     CURR_CNC:CN_PTR;
     CLOCK:REAL;
     DAY:INTEGER;
     workDayPerson:real;
 BEGIN

     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
     DAY:=0;
     CLOCK:=0;
     WANTED_SHIFR:=OKLAD_SHIFR;
     IF CURR_PERSON^.WID_OPLATY=POCHAS_WID_OPLATY THEN WANTED_SHIFR:=POCHAS_SHIFR;
     if DOG_POD_PODRAZD(NSRV) then Wanted_Shifr:=DogPodShifr;
     if (modeIskra and (NSRV=iskraPodr) and (GET_DOL_CODE(curr_person)=6)) then
        Wanted_Shifr:=DogPodShifr;
     C_ADD:=COUNT_ADD(CURR_PERSON);
     J:=0;
     FOUND:=FALSE;
     IF C_ADD>0 THEN
         WHILE (J<C_ADD) AND (NOT FOUND) DO
          BEGIN
           J:=J+1;
           IF J=1 THEN CURR_ADD := CURR_PERSON^.ADD
                  ELSE CURR_ADD := CURR_ADD^.NEXT;
           IF CURR_ADD^.SHIFR  =  WANTED_SHIFR   THEN
           IF CURR_ADD^.VYPLACHENO = NOT_GET_OUT THEN
           IF CURR_ADD^.PERIOD =  NMES           THEN FOUND:=TRUE;
          END;
     IF NOT FOUND THEN BEGIN
                            MAKE_ADD(CURR_ADD,CURR_PERSON);
                            CURR_ADD^.PERIOD:=NMES;
                       END;
     WorkDayPerson:=WORK_DAY(1{CURR_PERSON^.START_DAY},LAST_DAY,CURR_PERSON,round(GetWDay(NMES,curr_person)));
     IF ((CURR_PERSON^.OKLAD<=0) OR (WorkDayPerson<=0)) THEN O_PERSON:=0.
            ELSE
                BEGIN
                IF CURR_PERSON^.WID_OPLATY=POCHAS_WID_OPLATY THEN {Почасовка}
                   BEGIN
                    O_PERSON:=CURR_PERSON^.OKLAD*WORK_CLOCK(CURR_PERSON^.START_DAY,LAST_DAY,CURR_PERSON);
                    CLOCK:=WORK_CLOCK(CURR_PERSON^.START_DAY,LAST_DAY,CURR_PERSON);
                    DAY:=0;
                   END
                                              ELSE
                    BEGIN
//                         IF isFiveDayMode(CURR_PERSON) THEN OO:=GetWDay(NMES,curr_person)//OO:=W_DAY[NMES]
//                                              ELSE OO:=GetWDay(NMES,curr_person);//OO:=W_DAY[NMES];
                         OO:=GetWDay(NMES,curr_person);//OO:=W_DAY[NMES];
                         if Abs(oo)<0.9 then
                            begin
                                 if NMES=FLOW_MONTH then
                                    ShowMessage('Не заполнен календарь за '+getMonthRus(NMES));
                                 O_PERSON:=0
                            end
                         else
                            begin
//                                 WorkDayPerson:=WORK_DAY(1{CURR_PERSON^.START_DAY},LAST_DAY,CURR_PERSON,round(oo));
                                 if WorkDayPerson>oo then
                                    WorkDayPerson:=oo;
                                 O_PERSON:=GET_PERSON_OKLAD(CURR_PERSON)/OO*WORKDAYperson;
                            end;
                    CLOCK:=0;
                    DAY:=round(WorkDayPerson);
                    END;
                END;
     IF ((O_PERSON>0) OR (CURR_PERSON^.OKLAD>0.005)) THEN
        BEGIN
             DEJA_SUMMA:=SUM_VYPLACHENO_ADD(WANTED_SHIFR,CURR_PERSON,NMES);
             CURR_CNC:=FIND_CN_BASE(CURR_PERSON,WANTED_SHIFR,NMES);
             CURR_ADD^.SUMMA:=R10(O_PERSON-DEJA_SUMMA);
             IF CURR_CNC<>NIL THEN CURR_ADD^.SUMMA:=CURR_ADD^.SUMMA-CURR_CNC^.SUMMA;
             CURR_ADD^.PERIOD := NMES;
             CURR_ADD^.SHIFR  := WANTED_SHIFR;
             CURR_ADD^.FZP    := CURR_ADD^.SUMMA;
             CURR_ADD^.FMP    := 0;
             CURR_ADD^.OTHER  := 0;
             CURR_ADD^.WHO    := 1;
             CURR_ADD^.WORK_DAY:=DAY;
             CURR_ADD^.WORK_CLOCK:=CLOCK;
             IF ABS(CURR_ADD^.SUMMA)<0.01 THEN DEL_ADD(CURR_ADD,CURR_PERSON);
        END
                   ELSE
        DEL_ADD(CURR_ADD,CURR_PERSON);
 END;


PROCEDURE DOPL_DO_MIN_SAL_PERSON(CURR_PERSON:PERSON_PTR;LAST_DAY:INTEGER);
 VAR
     C_ADD:INTEGER;
     I,J,II:INTEGER;
     CURR_ADD:ADD_PTR;
     SUMMA,O_PERSON:REAL;
     FOUND:BOOLEAN;
     OO,o_day:REAL;
     DEJA_SUMMA:REAL;
     WANTED_SHIFR:INTEGER;
     CURR_CNC:CN_PTR;
     CLOCK:REAL;
     DAY:INTEGER;
     Razr:Integer;
     koef:real;
     summaDoplFull,summaDoplRas:Real;
     shifrDol:Integer;
     existsDopl:Boolean;
     CurrentMinSal:real;
 BEGIN
     if not isSVDN then
        Exit;
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
     shifrDol:=getDolPerson(Curr_Person);
     if (shifrDol<1) or (shifrDol>2000) then
        Exit;
     if not checkNeedDolgTest(shifrDol) then
        Exit;
     DAY   := 0;
     CLOCK := 0;
     WANTED_SHIFR:=DOPL_DO_MIN_SHIFR;
     Razr:=GetRazrjadPerson(Curr_Person);
     koef:=GET_KOEF_OKLAD_PERSON(Curr_Person);
     if (koef>1) then koef:=1;
     if not ((Razr>0) and (Razr<12)) then
        Exit;
     if (CURRYEAR<2016) then
        Exit;
     if (CURR_PERSON^.OKLAD<=0.01) then
        Exit;
     OO:=GetWDay(NMES,CURR_PERSON);
     o_day:=WORK_DAY(1,LAST_DAY,CURR_PERSON,round(oo));
     if O_day<1 then
        Exit;
     repeat
     until not DEL_WANTED_ADD(WANTED_SHIFR,CURR_PERSON,nmes);
     SummaNachPremForDoplaty:=getNachPremForPerson(curr_person);
     SummaNachPremForDoplaty:=SummaNachPremForDoplaty+getNachPremForPersonInNSRV(curr_person);

     if SummaNachPremForDoplaty>0.01 then
        begin
             Exit;
        end;
     existsDopl:=false;
     Curr_ADD:=CURR_PERSON.ADD;
     Found:=False;
     Summa:=0;
     CURR_ADD:=curr_person.ADD;
     while (CURR_ADD<>nil) do
       begin
            if curr_add^.PERIOD=NMES then
            if curr_add^.YEAR+1990=CURRYEAR then
            if not IsBolnShifr(curr_add^.shifr) then
            if not IsOtpShifr(curr_add^.shifr) then
            if not (curr_add^.shifr=DIFFER_SHIFR) then
            if not (curr_add^.shifr=NOT_USE_HOLIDAY_SHIFR) then
            if not (curr_add^.shifr=NIGHT_SHIFR) then
            if not (curr_add^.shifr=MAT_POOSHR_SHIFR) then
               begin
                    summa:=summa+curr_add^.SUMMA;
                    if curr_add^.SHIFR=WANTED_SHIFR then
                       existsDopl:=True;
               end;
            curr_add:=curr_add^.NEXT;
       end;
     CurrentMinSal:=GET_MIN_SALARY(CurrYear,nmes);
     if (CurrentMinSal<3200) then
         CurrentMinSal:=3200.00;
     SummaDoplFull:=currentMinSal*koef;
     if summaDoplFull<0.01 then
        Exit;
     if SUMMA>SummaDoplFull then
        exit;
     OO:=GetWDay(NMES,CURR_PERSON);
     summaDoplRas:=R10(summaDoplFull/OO*o_day);
     o_person:=summaDoplRas-summa;
     DAY:=ROUND(O_day);
     if O_PERSON<-0.01 then
     if not existsDopl then
        Exit;
     IF (Abs(O_PERSON)>0.01) THEN
        BEGIN
             MAKE_ADD(CURR_ADD,Curr_person);
             CURR_ADD^.SHIFR  := WANTED_SHIFR;
             CURR_ADD^.SUMMA  := o_person;
             CURR_ADD^.PERIOD := NMES;
             CURR_ADD^.SHIFR  := WANTED_SHIFR;
             CURR_ADD^.FZP    := CURR_ADD^.SUMMA;
             CURR_ADD^.FMP    := 0;
             CURR_ADD^.OTHER  := 0;
             CURR_ADD^.WHO    := 1;
             CURR_ADD^.WORK_DAY:=DAY;
             CURR_ADD^.WORK_CLOCK:=CLOCK;
             IF ABS(CURR_ADD^.SUMMA)<0.01 THEN DEL_ADD(CURR_ADD,CURR_PERSON);
        END
 END;
PROCEDURE DIFF_SAL_PERSON(CURR_PERSON:PERSON_PTR;LAST_DAY:INTEGER);
 VAR
     C_ADD:INTEGER;
     I,J,II:INTEGER;
     CURR_ADD:ADD_PTR;
     SUMMA,O_PERSON:REAL;
     FOUND:BOOLEAN;
     OO,o_day:REAL;
     DEJA_SUMMA:REAL;
     WANTED_SHIFR:INTEGER;
     CURR_CNC:CN_PTR;
     CLOCK:REAL;
     DAY:INTEGER;
     Razr:Integer;
     koef:real;
     summaDiffFull,summaDiffRas,summaDiffVypl:Real;
     shifrDol:Integer;
     existsDopl:Boolean;
 BEGIN
     Exit;  // Отменили 21 01 2019
     if not isSVDN then
        Exit;
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
     shifrDol:=getDolPerson(Curr_Person);
     if (shifrDol<1) or (shifrDol>2000) then
        Exit;
     if not checkNeedDolgTest(shifrDol) then
        Exit;
     DAY   := 0;
     CLOCK := 0;
     WANTED_SHIFR:=DIFFER_SHIFR;
     Razr:=GetRazrjadPerson(Curr_Person);
     koef:=GET_KOEF_OKLAD_PERSON(Curr_Person);
     if (koef>1) then koef:=1;
     if not ((Razr>2) and (Razr<12)) then
        Exit;
     if (CURRYEAR<2016) then
        Exit;
     if (CURR_PERSON^.OKLAD<=0.01) then
        Exit;
     OO:=GetWDay(NMES,CURR_PERSON);
     o_day:=WORK_DAY(1,LAST_DAY,CURR_PERSON,round(oo));
     if O_day<1 then
        Exit;
     repeat
     until not DEL_WANTED_ADD(WANTED_SHIFR,CURR_PERSON,nmes);

//     if SummaNachPremForDoplaty>0.01 then
//        begin
//             Exit;
//        end;

     existsDopl:=false;


     Found:=False;
     Summa:=0;
     summaDiffVypl:=0;
     CURR_ADD:=curr_person.ADD;
     while (CURR_ADD<>nil) do
       begin
            if curr_add^.PERIOD=NMES then
            if curr_add^.YEAR+1990=CURRYEAR then
               begin
                    if curr_add^.shifr=oklad_shifr then
                       summa:=summa+curr_add^.SUMMA
                    else
                    if curr_add^.shifr=differ_shifr then
                       summaDiffVypl:=summaDiffVypl+curr_add^.SUMMA
                    else
                    if curr_add^.shifr=DOPL_DO_MIN_SHIFR then
                       existsDopl:=true;
               end;
            curr_add:=curr_add^.NEXT;
       end;
     if not existsDopl then Exit;  
     SummaDiffFull:=r10(summa*procDiffSal/100.00);
     summaDiffRas:=R10(summaDiffFull-SummaDiffVypl);
     OO:=GetWDay(NMES,CURR_PERSON);
     o_day:=WORK_DAY(1,LAST_DAY,CURR_PERSON,round(oo));
//     OO:=GetWDay(NMES,CURR_PERSON);
     if abs(o_day-oo)<0.1 then
     if abs(summaDiffVypl)<0.1 then
        summaDiffRas:=roundTo(summaDiffRas,0);
     IF (Abs(O_PERSON)>0.01) THEN
        BEGIN
             MAKE_ADD(CURR_ADD,Curr_person);
             CURR_ADD^.SHIFR  := WANTED_SHIFR;
             CURR_ADD^.SUMMA  := summaDiffRas;
             CURR_ADD^.PERIOD := NMES;
             CURR_ADD^.SHIFR  := WANTED_SHIFR;
             CURR_ADD^.FZP    := CURR_ADD^.SUMMA;
             CURR_ADD^.FMP    := 0;
             CURR_ADD^.OTHER  := 0;
             CURR_ADD^.WHO    := 1;
             CURR_ADD^.WORK_DAY:=DAY;
             CURR_ADD^.WORK_CLOCK:=CLOCK;
             IF ABS(CURR_ADD^.SUMMA)<0.01 THEN DEL_ADD(CURR_ADD,CURR_PERSON);
        END
 END;

(* PROCEDURE CALC_OKLAD;
  VAR I,ii,J,K:INTEGER;
      CURR_PERSON:PERSON_PTR;
      LAST_DAY:INTEGER;
  BEGIN
       I:=COUNT_PERSON;
       IF I>0 THEN
          FOR J:=1 TO I DO
             BEGIN
                  IF J=1 THEN CURR_PERSON:=HEAD_PERSON
                         ELSE CURR_PERSON:=CURR_PERSON^.NEXT;
                  OKLAD_PERSON(CURR_PERSON,LAST_DAY);
             END;
  END; *)
(*{$I SCRNALO1}*)
FUNCTION AWANS_SUMMA(SUMMA:REAL):REAL;
 VAR A:REAL;
 BEGIN
      IF SUMMA>10000 THEN A:=ROUND(SUMMA/10000)*10000
                     ELSE A:=SUMMA;
      AWANS_SUMMA:=A;
 END;
FUNCTION IS_GET_OUT_AWANS(CURR_PERSON:PERSON_PTR;PERIOD_NEW:INTEGER):BOOLEAN;
   VAR CURR_UD:UD_PTR;
       I_U,I:INTEGER;
       FOUND:BOOLEAN;
   BEGIN
        FOUND:=FALSE;
        CURR_UD:=CURR_person^.UD;
        while (curr_ud<>nil) do
          begin
               IF (CURR_UD^.SHIFR=AWANS_SHIFR)  THEN
               IF (CURR_UD^.PERIOD=PERIOD_NEW)  THEN
               IF (CURR_UD^.VYPLACHENO=GET_OUT) THEN
                  begin
                       FOUND:=TRUE;
                       break;
                  end;
               curr_ud:=curr_UD^.NEXT;;
          end;
//        I_U:=COUNT_UD(CURR_PERSON);
//        IF I_U>0 THEN
//           BEGIN
//                 I:=0;
//                 FOUND:=FALSE;
//                 WHILE (I<I_U) AND (NOT FOUND) DO
//                       BEGIN
//                             I:=I+1;
//                             IF I=1 THEN CURR_UD:=CURR_PERSON^.UD
//                                    ELSE CURR_UD:=CURR_UD^.NEXT;
//                             IF (CURR_UD^.SHIFR=AWANS_SHIFR)  THEN
//                             IF (CURR_UD^.PERIOD=PERIOD_NEW)  THEN
//                             IF (CURR_UD^.VYPLACHENO=GET_OUT) THEN
//                                FOUND:=TRUE;
//                       END;
//           END;
        IS_GET_OUT_AWANS:=FOUND;
   END;
 FUNCTION MUST_MAKE_AWANS(CURR_PERSON:PERSON_PTR;PERIOD_NEW:INTEGER):BOOLEAN;
  VAR L:BOOLEAN;
      I:INTEGER;
      FLOW_DAY:INTEGER;
  PROCEDURE DELETE_NOT_OUT_AWANS;
   VAR
       I,I_U:INTEGER;
       CURR_UD:UD_PTR;
       L:BOOLEAN;
   BEGIN
       REPEAT
             L:=FALSE;
             I_U:=COUNT_UD(CURR_PERSON);
             IF I_U<=0 THEN EXIT;
             I:=0;
             WHILE (I<I_U) AND (NOT L) DO
              BEGIN
                   I:=I+1;
                   IF I=1 THEN CURR_UD:=CURR_PERSON^.UD
                          ELSE CURR_UD:=CURR_UD^.NEXT;
                   IF CURR_UD^.SHIFR      = AWANS_SHIFR THEN
                   IF CURR_UD^.VYPLACHENO = NOT_GET_OUT THEN
                   IF CURR_UD^.PERIOD     = PERIOD_NEW  THEN
                      BEGIN
                           L:=TRUE;
                           DEL_UD(CURR_UD,CURR_PERSON);
                      END;
              END;
       UNTIL NOT L;
   END;
  BEGIN
       L:=TRUE;
       IF CURR_PERSON^.TABEL[AWANS_DAY]<>VYHODN THEN
          BEGIN
                IF CURR_PERSON^.TABEL[AWANS_DAY] IN [TARIFN_OTPUSK,OTP_G_DO_GODA,
                       OTPUSK_BEZ_OPLATY,BEREM_OTPUSK,PROGUL,NEZAPOLN] THEN L:=FALSE;
          END
                                                  ELSE
          BEGIN
                FLOW_DAY:=AWANS_DAY;
                WHILE (CURR_PERSON^.TABEL[FLOW_DAY]<>VYHODN) AND (FLOW_DAY>0)  DO
                      FLOW_DAY:=FLOW_DAY-1;
                IF CURR_PERSON^.TABEL[FLOW_DAY] IN [TARIFN_OTPUSK,OTP_G_DO_GODA,
                       OTPUSK_BEZ_OPLATY,BEREM_OTPUSK,PROGUL,NEZAPOLN] THEN L:=FALSE;
          END;
       IF FLOW_DAY>AWANS_DAY THEN
          BEGIN
                L:=FALSE;
                DELETE_NOT_OUT_AWANS;
          END;
       MUST_MAKE_AWANS:=L;
  END;
{ ********************************************************** }
{ * Если не было начислений программа переносит долг из UD * }
{ * в CN, если были начисления, то просматривается CN и    * }
{ * если там обнаружен старый долг, он переносится в UD    * }
{ ********************************************************** }
    FUNCTION FIND_OLD_DOLG(CURR_PERSON:PERSON_PTR):CN_PTR;
    VAR C_CN:CN_PTR;
        I,I_CN:INTEGER;
        FOU:BOOLEAN;
    BEGIN
        I_CN:=COUNT_CN(CURR_PERSON);
        I   := 0;
        FOU := FALSE;
        IF I_CN>0 THEN
           WHILE (I<I_CN) AND (NOT FOU) DO
            BEGIN
                 I:=I+1;
                 IF I=1 THEN C_CN:=CURR_PERSON^.CN
                        ELSE C_CN:=C_CN^.NEXT;
                 IF C_CN^.SHIFR=DOLG_ZA_RABOCHIM_SHIFR+LIMIT_CN_BASE THEN FOU:=TRUE;
            END;
        IF FOU THEN FIND_OLD_DOLG:=C_CN
               ELSE FIND_OLD_DOLG:=NIL;
    END;
  FUNCTION GET_OLD_DOLG(CURR_PERSON:PERSON_PTR):REAL;
   VAR  CURR_CN:CN_PTR;
   BEGIN
        CURR_CN:=FIND_OLD_DOLG(CURR_PERSON);
        IF CURR_CN=NIL THEN GET_OLD_DOLG:=0
                       ELSE GET_OLD_DOLG:=CURR_CN^.SUMMA;
   END;
PROCEDURE WORK_OUT_DOLG(CURR_PERSON:PERSON_PTR);
  VAR  A,B:REAL;
       CURR_CN:CN_PTR;
  FUNCTION SUMMA_ADD_UD(CURR_PERSON:PERSON_PTR):REAL;
   VAR CURR_ADD: ADD_PTR;
       CURR_UD : UD_PTR;
       I,I_A,I_U:INTEGER;
       SUMMA:REAL;
   BEGIN
        SUMMA:=0;
        I_A:=COUNT_ADD(CURR_PERSON);
        IF I_A>0 THEN FOR I:=1 TO I_A DO
           BEGIN
                IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                       ELSE CURR_ADD:=CURR_ADD^.NEXT;
                {IF CURR_ADD^.SHIFR IN [1..LIMIT_SHIFR-1] THEN} SUMMA:=R10(SUMMA)+R10(CURR_ADD^.SUMMA);
           END;
        I_U:=COUNT_UD(CURR_PERSON);
        IF I_U>0 THEN FOR I:=1 TO I_U DO
           BEGIN
                IF I=1 THEN CURR_UD:=CURR_PERSON^.UD
                       ELSE CURR_UD:=CURR_UD^.NEXT;
                {IF CURR_UD^.SHIFR IN [LIMIT_SHIFR+1..MAXSHIFR] THEN} SUMMA:=R10(SUMMA)-R10(CURR_UD^.SUMMA);
           END;
        SUMMA_ADD_UD:=R10(SUMMA);
   END;
  FUNCTION SUMMA_ADD(CURR_PERSON:PERSON_PTR):REAL;
   VAR CURR_ADD: ADD_PTR;
       I,I_A:INTEGER;
       SUMMA:REAL;
   BEGIN
        SUMMA:=0;
        I_A:=COUNT_ADD(CURR_PERSON);
        IF I_A>0 THEN FOR I:=1 TO I_A DO
           BEGIN
                IF I=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                       ELSE CURR_ADD:=CURR_ADD^.NEXT;
                {IF CURR_ADD^.SHIFR IN [1..LIMIT_SHIFR-1] THEN} SUMMA:=R10(SUMMA)+R10(CURR_ADD^.SUMMA);
           END;
        SUMMA_ADD:=R10(SUMMA);
   END;
  PROCEDURE DELETE_DOLG(CURR_PERSON:PERSON_PTR);
   VAR CURR_CN:CN_PTR;
   BEGIN
        CURR_CN:=FIND_OLD_DOLG(CURR_PERSON);
        IF CURR_CN<>NIL THEN DEL_CN(CURR_CN,CURR_PERSON);
   END;
  PROCEDURE CREATE_DOLG(CURR_PERSON:PERSON_PTR;A:REAL);
   VAR CURR_UD:UD_PTR;
       CURR_CN:CN_PTR;
   BEGIN
        CURR_CN:=FIND_OLD_DOLG(CURR_PERSON);
        IF CURR_CN<>NIL THEN
           BEGIN
                 REPEAT
                 UNTIL NOT (DEL_WANTED_UD(DOLG_ZA_RABOCHIM_SHIFR,CURR_PERSON,CURR_CN^.PRIM));
                 MAKE_UD(CURR_UD,CURR_PERSON);
                 CURR_UD^.SUMMA  := A;
                 CURR_UD^.PERIOD := CURR_CN^.PRIM;
                 CURR_UD^.SHIFR  := DOLG_ZA_RABOCHIM_SHIFR;
                 CURR_UD^.WHO    := 1;
           END;
   END;
  PROCEDURE UPDATE_DOLG(CURR_PERSON:PERSON_PTR;A:REAL);
   VAR CURR_CN:CN_PTR;
       I:INTEGER;
   BEGIN
         CURR_CN:=FIND_OLD_DOLG(CURR_PERSON);
{         IF CURR_CN<>NIL THEN
            BEGIN
                 CURR_CN^.SUMMA:=A;
                 UPDATE:=TRUE;
                 GOTOXY(1,25);
                 CLREOL;
                 WRITE(' A=',A:7:2);
                 I:=INKEY;
                 GOTOXY(1,25);
                 CLREOL;
            END;
}   END;
{ Начало программы MOVE_DOLG_FORM_UD_TO_CN }
  PROCEDURE MOVE_DOLG_FROM_UD_TO_CN(CURR_PERSON:PERSON_PTR);
   VAR CURR_CN:CN_PTR;
       CURR_UD:UD_PTR;
       I_U,I_CN,I,J,P:INTEGER;
       FOU:BOOLEAN;
       A:REAL;
   FUNCTION FIND_DOLG(CURR_PERSON:PERSON_PTR):UD_PTR;
    VAR C_UD:UD_PTR;
        I,I_U:INTEGER;
        FOU:BOOLEAN;
    BEGIN
        I_U:=COUNT_UD(CURR_PERSON);
        I   := 0;
        FOU := FALSE;
        IF I_U>0 THEN
           WHILE (I<I_U) AND (NOT FOU) DO
            BEGIN
                 I:=I+1;
                 IF I=1 THEN C_UD:=CURR_PERSON^.UD
                        ELSE C_UD:=C_UD^.NEXT;
                 IF C_UD^.SHIFR=DOLG_ZA_RABOCHIM_SHIFR THEN FOU:=TRUE;
            END;
        IF FOU THEN FIND_DOLG:=C_UD
               ELSE FIND_DOLG:=NIL;
    END;
   BEGIN
       CURR_UD:=FIND_DOLG(CURR_PERSON);
       IF CURR_UD<>NIL THEN
          BEGIN
                A:=CURR_UD^.SUMMA;
                P:=CURR_UD^.PERIOD;
                IF A>0 THEN
                   BEGIN
                         DEL_UD(CURR_UD,CURR_PERSON);
                         CURR_CN:=FIND_CN_BASE(CURR_PERSON,DOLG_ZA_RABOCHIM_SHIFR,P);
                         IF CURR_CN<>NIL THEN CURR_CN^.SUMMA:=CURR_CN^.SUMMA+A
                                         ELSE
                            BEGIN
                                  MAKE_CN(CURR_CN,CURR_PERSON);
                                  CURR_CN^.SHIFR := DOLG_ZA_RABOCHIM_SHIFR+LIMIT_CN_BASE;
                                  CURR_CN^.KOD   := 100;
                                  CURR_CN^.SUMMA := A;
                                  CURR_CN^.PRIM  := P;
                            END;
                   END;
          END;
   END;
{ Конец программы MOVE_DOLG_FORM_UD_TO_CN }
  BEGIN
       B:=SUMMA_ADD(CURR_PERSON);
       IF B>0 THEN
          BEGIN
               A:=GET_OLD_DOLG(CURR_PERSON);
               CURR_CN:=FIND_OLD_DOLG(CURR_PERSON);
               IF CURR_CN<>NIL THEN
                  REPEAT
                  UNTIL NOT (DEL_WANTED_UD(DOLG_ZA_RABOCHIM_SHIFR,CURR_PERSON,CURR_CN^.PRIM));
               B:=SUMMA_ADD_UD(CURR_PERSON);
{              GOTOXY(1,25);
               CLREOL;
               WRITE(' T=',B:7:4);
               IF INKEY=0 THEN;
               GOTOXY(1,25);
               CLREOL;
}               IF A>0 THEN
               IF B>0 THEN
                  BEGIN
{                        DELETE_DOLG(CURR_PERSON);  }
                        CREATE_DOLG(CURR_PERSON,A);
                        UPDATE:=TRUE;
                  END
                                           ELSE
                  BEGIN
{                        CREATE_DOLG(CURR_PERSON,B);}
{                        UPDATE_DOLG(CURR_PERSON,A-B);}
                        UPDATE:=TRUE;
                  END
          END
              ELSE
          BEGIN
               MOVE_DOLG_FROM_UD_TO_CN(CURR_PERSON);
               UPDATE:=TRUE;
          END;
  END;
 PROCEDURE CALC_UD_FOR_ALL_REST(CURR_PERSON:PERSON_PTR;PERIOD_NEW:INTEGER);
  VAR I,II,J,K,L,C_CN,C_ADD,C_UD:INTEGER;
      CURR_CN,REST_PTR :CN_PTR;
      CURR_ADD : ADD_PTR;
      CURR_UD  : UD_PTR;
      SL:BOOLEAN;
      SUMMA,T_SUMMA:REAL;
      O_PERSON,OO:REAL;
      FOUND:BOOLEAN;
  BEGIN
      C_CN  := COUNT_CN  (CURR_PERSON);
      C_ADD := COUNT_ADD(CURR_PERSON);
      I:=0;
      FOUND:=FALSE;
      if (C_CN>0) and (C_ADD>0) and
         (Curr_Person^.AUTOMATIC=AUTOMATIC_MODE) then
         begin
              curr_cn:=curr_Person^.CN;
              while (CURR_CN<>NIl) do
                begin
                     IF ShifrList.IsAdd(CURR_CN^.SHIFR)      THEN
                     IF (CURR_CN^.KOD=4) OR (CURR_CN^.KOD=5) THEN
                     IF CURR_CN^.AUTOMATIC=AUTOMATIC_MODE    THEN
                        begin
                             FOUND:=TRUE;
                             Break;
                        end;
                     curr_cn:=curr_cn^.Next;
                end;
              if found then
                 begin
                      IF ((CURR_CN^.SHIFR=AWANS_SHIFR) AND (CURR_CN^.PRIM_1='Выплачен'))                  THEN FOUND:=FALSE;
                      IF ((CURR_CN^.SHIFR=AWANS_SHIFR) AND (IS_GET_OUT_AWANS(CURR_PERSON,PERIOD_NEW)))    THEN FOUND:=FALSE;
                      IF ((CURR_CN^.SHIFR=AWANS_SHIFR) AND (NOT MUST_MAKE_AWANS(CURR_PERSON,PERIOD_NEW))) THEN FOUND:=FALSE;
                 end;
         end;
      IF (CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE) or
         (C_CN<=0)  or
         (C_ADD<=0) or
         (not found) THEN
         BEGIN
              ExcludeShift_Shifr(Curr_Person);
              EXIT;
         END;

(*      IF WORK_DAY(CURR_PERSON^.START_DAY,LAST_DAY,CURR_PERSON)<=0 THEN
      IF NOT IS_TEST_DEKRET(CURR_PERSON) THEN
      IF NOT IS_TEST_UWOLNE(CURR_PERSON) THEN
         BEGIN
{              WHILE CURR_PERSON^.ADD<>NIL DO DEL_ADD(CURR_PERSON^.ADD,CURR_PERSON);
              WHILE CURR_PERSON^.UD<>NIL DO DEL_UD(CURR_PERSON^.UD,CURR_PERSON);
              EXIT;  }
         END;   *)
     { КАЛЬКУЛЯЦИЯ УДЕРЖАНИЙ }
      T_SUMMA:=0;
      Curr_Add:=Curr_Person^.ADD;
      while (CURR_ADD<>Nil) do
        begin
              IF Curr_Add^.Vyplacheno=NOT_GET_OUT THEN
                 T_SUMMA:=T_SUMMA+R10(Curr_Add^.Summa);
              Curr_Add:=Curr_Add^.NEXT;
        end;
      REPEAT
            SL:=FALSE;
            curr_Ud:=Curr_Person^.UD;
            while (CURR_UD<>Nil) do
             begin
                   IF (CURR_UD^.SHIFR=CURR_CN^.SHIFR) OR
                      (CURR_UD^.SHIFR=CURR_CN^.SHIFR+SHIFT_SHIFR) THEN
                   IF CURR_UD^.VYPLACHENO=NOT_GET_OUT    THEN
                      begin
                           DEL_UD(CURR_UD,CURR_PERSON);
                           SL:=TRUE;
                           break;
                      end;
                   Curr_Ud:=Curr_Ud^.NEXT;
             end;
      until not sl;;
      curr_Ud:=curr_Person^.ud;
      while (Curr_Ud<>Nil) do
        begin
             T_SUMMA:=T_SUMMA-R10(CURR_UD^.SUMMA);
             Curr_Ud:=Curr_Ud^.NEXT;
        end;
      IF T_SUMMA>0 THEN
         BEGIN
              MAKE_UD(CURR_UD,CURR_PERSON);
              WITH CURR_UD^ DO
                   BEGIN
                        SHIFR  := CURR_CN^.SHIFR;
                        PERIOD := PERIOD_NEW;
                        WHO    := CURR_CN^.ID;
                        IF CURR_CN^.KOD=4 THEN SUMMA:=T_SUMMA
                                          ELSE SUMMA:=T_SUMMA*CURR_CN^.SUMMA/100;
                   END;
             IF CURR_UD^.SHIFR=AWANS_SHIFR THEN CURR_UD^.SUMMA:=AWANS_SUMMA(CURR_UD^.SUMMA);
             IF ABS(CURR_UD^.SUMMA)<0.01 THEN DEL_UD(CURR_UD,CURR_PERSON);
         END;
      ExcludeShift_Shifr(Curr_Person);

  END; {КОНЕЦ ПРОЦЕДУРЫ ВЫЧИСЛЕНИЯ ВСЕГО ОСТАВШЕГОСЯ УДЕРЖАНИЯ }

 PROCEDURE CALC_NAUD_WORK_WITHOUT_ALL_REST(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER;LAST_DAY:INTEGER);
  VAR I,II,JJ,J,K,L,C_CN,C_ADD,C_UD:INTEGER;
      CURR_CN,CURR_CNC,CUR_CN :CN_PTR;
      CURR_ADD,CURR_ADDW:ADD_PTR;
      CURR_UD,CURR_UDW :UD_PTR;
      SL:BOOLEAN;
      SUMMA,T_SUMMA,NADB_DAY:REAL;
      O_PERSON,OO:REAL;
      FOUND:BOOLEAN;
    procedure Delete_Add_For_Cn;
     var Curr_Cn:Cn_Ptr;
     begin
          Curr_Cn:=Curr_Person^.Cn;
          while (Curr_Cn<>Nil) do
           begin
                if Curr_Cn^.Shifr<Limit_Cn_Base then
                if Curr_Cn^.AUTOMATIC=AUTOMATIC_MODE then
                IF ShifrList.IsAdd(CURR_CN^.SHIFR)        THEN
                   DEL_WANTED_ADD(Curr_Cn^.SHIFR,CURR_PERSON,PERIOD);
                Curr_Cn:=Curr_cn^.Next;
           end;


     end;

  BEGIN
      Delete_Add_For_Cn;
      C_CN:=COUNT_CN(CURR_PERSON);
      IF C_CN=0 THEN EXIT;
      FOR I:=1 TO C_CN DO
          BEGIN
               IF I=1 THEN CURR_CN:=CURR_PERSON^.CN
                      ELSE CURR_CN:=CURR_CN^.NEXT;
               IF CURR_CN^.SHIFR<LIMIT_CN_BASE      THEN
               IF ShifrList.IsAdd(CURR_CN^.SHIFR)        THEN
               IF CURR_CN^.AUTOMATIC=AUTOMATIC_MODE THEN
                  BEGIN
                   C_ADD:=COUNT_ADD(CURR_PERSON);
                   J:=0;
                   FOUND:=FALSE;
                   IF C_ADD>0 THEN
                       WHILE (J<C_ADD) AND (NOT FOUND) DO
                        BEGIN
                         J:=J+1;
                         IF J=1 THEN CURR_ADDW := CURR_PERSON^.ADD
                                ELSE CURR_ADDW := CURR_ADDW^.NEXT;
                         IF CURR_ADDW^.SHIFR  =  CURR_CN^.SHIFR THEN
                         IF CURR_ADDW^.VYPLACHENO = NOT_GET_OUT THEN
                         IF CURR_ADDW^.PERIOD =  PERIOD         THEN FOUND:=TRUE;
                        END;
               //    repeat
               //    until not (DEL_WANTED_ADD(CURR_CN^.SHIFR,CURR_PERSON,PERIOD));
                   FOUND:=False;
                   IF NOT FOUND THEN
                      BEGIN
                           MAKE_ADD(CURR_ADDW,CURR_PERSON);
                           CURR_ADDW^.PERIOD:=PERIOD;
                      END;
                   CASE CURR_CN^.KOD OF
                        3:  BEGIN
                                CURR_ADDW^.SHIFR  := CURR_CN^.SHIFR;
                                CURR_ADDW^.PERIOD := PERIOD;
                                CURR_ADDW^.WHO    := CURR_CN^.ID;
                                IF (CURR_PERSON^.WID_OPLATY=STAWKA_WID_OPLATY) AND
                                    (CURR_CN^.SHIFR  IN [NADBAWKA_SHIFR    ,
                                                         NADBAWKA_SHIFR_N   ,
                                                         NADBAWKA_SHIFR_GN  ,
                                                         DOPLATA_K_ZARPL_SHIFR,
                                                         SOWMESTIT_SHIFR   ,
//                                                         ZAMESTIT_SHIFR    ,
                                                         ZA_ZW_ZASL_SHIFR  ,
                                                         ZAW_KAFEDROJ_SHIFR,
                                                         BRIGADIR_SHIFR,
                                                         ZA_ZAM_DEKANA_SHIFR,
                                                         VYSLUGA_SHIFR,
                                                         ZA_ZWAN_SHIFR,
                                                         ZA_STEP_SHIFR,
                                                   //      ZA_ZASL_PROF_SHIFR,
                                                         CycleComisShifr,
                                                         ZawKabinetShifr,
                                                         ProverkaTetradejShifr,
                                                         KlassnoeRukowodstwoShifr]) THEN
                                   BEGIN
//                                         IF isFiveDayMode(CURR_PERSON) THEN OO:=GetWDay(NMES,CURR_PERSON)//OO:=W_DAY[NMES]
//                                                                          ELSE OO:=GetWDay(NMES,CURR_PERSON);//OO:=W_DAY[NMES];
                                         OO:=GetWDay(NMES,CURR_PERSON);//OO:=W_DAY[NMES];
                                         if Abs(oo)<0.9 then
                                         if NMES=FLOW_MONTH then
                                            ShowMessage('Не указан календарь за '+getMonthRus(nmes));


                                         IF CURR_CN^.SHIFR IN[NADBAWKA_SHIFR,
                                                              NADBAWKA_SHIFR_N,
                                                              NADBAWKA_SHIFR_GN,
                                                              VYSLUGA_SHIFR,
                                                     //         ZA_ZASL_PROF_SHIFR,
                                                              ZA_ZWAN_SHIFR,
                                                              ZA_STEP_SHIFR] THEN
                                            BEGIN
                                              CURR_ADDW^.SUMMA := R10(CURR_CN^.SUMMA/OO*
                                              NADBAWKA_DAY(1,{CURR_PERSON^.START_DAY,}LAST_DAY,CURR_PERSON)-
                                              SUM_VYPLACHENO_ADD(CURR_CN^.SHIFR,CURR_PERSON,PERIOD));
{                                              ERROR('_DAY='+MY_STR_REAL(NADBAWKA_DAY(1,31,CURR_PERSON),2));
}                                            END
                                                                         ELSE
                                            CURR_ADDW^.SUMMA := R10(CURR_CN^.SUMMA/OO*
                                              WORK_DAY(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON,round(oo))-
                                              SUM_VYPLACHENO_ADD_ID(CURR_CN^.SHIFR,CURR_PERSON,PERIOD,CURR_ADDW^.WHO));
                                         CURR_ADDW^.FMP   := CURR_ADDW^.SUMMA;
                                         CURR_ADDW^.FZP   := 0;
                                         CURR_ADDW^.OTHER := 0;
                                   END
                                                                 ELSE
                                   BEGIN
                                          CURR_ADDW^.SUMMA := R10(CURR_CN^.SUMMA-SUM_VYPLACHENO_ADD(CURR_CN^.SHIFR,
                                                                   CURR_PERSON,PERIOD));
                                          CURR_ADDW^.FMP   := CURR_ADDW^.SUMMA;
                                          CURR_ADDW^.FZP   := 0;
                                          CURR_ADDW^.OTHER := 0;
                                   END;
                          END;
                        4:BEGIN CURR_ADDW^.SHIFR  := CURR_CN^.SHIFR;
                                CURR_ADDW^.PERIOD := PERIOD;
                                CURR_ADDW^.WHO    := CURR_CN^.ID;
//                                IF isFiveDayMode(CURR_PERSON) THEN OO:=GetWDay(NMES,CURR_PERSON)//OO := W_DAY[NMES]
//                                                              ELSE OO:=GetWDay(NMES,CURR_PERSON);//OO := W_DAY[NMES];
                                OO:=GetWDay(NMES,CURR_PERSON);//OO := W_DAY[NMES];
                                if Abs(oo)<0.9 then
                                if NMES=FLOW_MONTH then
                                   ShowMessage('Не указан календарь за '+getMonthRus(nmes));

                                IF CURR_PERSON^.WID_OPLATY=POCHAS_WID_OPLATY THEN
      O_PERSON := CURR_PERSON^.OKLAD*WORK_CLOCK(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON)
                                                                              ELSE
                                if Abs(oo)<0.9 then
                                  o_person:=0
                                else                                                
      O_PERSON:=GET_PERSON_OKLAD(CURR_PERSON)/OO*WORK_DAY(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON,round(OO));
                                CURR_ADDW^.SUMMA:=R10(O_PERSON*CURR_CN^.SUMMA/100-
                                      SUM_VYPLACHENO_ADD_ID(CURR_CN^.SHIFR,CURR_PERSON,PERIOD,CURR_ADDW^.WHO));
                                CURR_ADDW^.FMP  :=CURR_ADDW^.SUMMA;
                                CURR_ADDW^.FZP  :=0;
                                CURR_ADDW^.OTHER:=0;
                          END;
                        1:  BEGIN
                                CURR_ADDW^.SHIFR  := CURR_CN^.SHIFR;
                                CURR_ADDW^.PERIOD := PERIOD;
                                CURR_ADDW^.WHO    := CURR_CN^.ID;
                                IF (CURR_PERSON^.WID_OPLATY=STAWKA_WID_OPLATY) AND
                                    (CURR_CN^.SHIFR  IN [NADBAWKA_SHIFR    ,
                                                         NADBAWKA_SHIFR_N   ,
                                                         NADBAWKA_SHIFR_GN  ,
                                                         NADBAWKA_K_Z_SHIFR,
                                                         SOWMESTIT_SHIFR   ,
//                                                         ZAMESTIT_SHIFR    ,
                                                         ZA_ZW_ZASL_SHIFR  ,
                                                         DOPLATA_K_ZARPL_SHIFR,
                                                         ZAW_KAFEDROJ_SHIFR,
                                                         BRIGADIR_SHIFR,
                                                         ZA_ZAM_DEKANA_SHIFR,
                                                         VYSLUGA_SHIFR,
                                        //                 ZA_ZASL_PROF_SHIFR,
                                                         ZA_STEP_SHIFR,
                                                         ZA_ZWAN_SHIFR,
                                                         CycleComisShifr,
                                                         ZawKabinetShifr,
                                                         ProverkaTetradejShifr,
                                                         KlassnoeRukowodstwoShifr]) THEN
                                   BEGIN
//                                         IF isFiveDayMode(CURR_PERSON) THEN OO:=GetWDay(NMES,CURR_PERSON)//OO:=W_DAY[NMES]
//                                                                       ELSE OO:=GetWDay(NMES,CURR_PERSON);//OO:=W_DAY[NMES];
                                         OO:=GetWDay(NMES,CURR_PERSON);//OO:=W_DAY[NMES];
                                         if Abs(oo)<0.9 then
                                         if NMES=FLOW_MONTH then
                                            ShowMessage('Не указан календарь за '+getMonthRus(nmes));
                                         IF CURR_CN^.SHIFR IN[NADBAWKA_SHIFR,
                                                              NADBAWKA_SHIFR_N,
                                                              DOPLATA_K_ZARPL_SHIFR,
                                                              NADBAWKA_SHIFR_GN,
                                                              NADBAWKA_K_Z_SHIFR,
                                                              VYSLUGA_SHIFR,
                                                  //            ZA_ZASL_PROF_SHIFR,
                                                              ZA_STEP_SHIFR,
                                                              ZA_ZWAN_SHIFR] THEN
                                            BEGIN
                                              NADB_DAY:=NADBAWKA_DAY(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON);
                                              CURR_ADDW^.SUMMA := R10(CURR_CN^.SUMMA/OO*
                                              NADB_DAY -
                                              SUM_VYPLACHENO_ADD_ID(CURR_CN^.SHIFR,CURR_PERSON,PERIOD,CURR_ADDW^.WHO));
{                                              ERROR('_DAY='+MY_STR_REAL(NADBAWKA_DAY(1,31,CURR_PERSON),2));
}                                            END
                                                                         ELSE
                                            CURR_ADDW^.SUMMA := R10(CURR_CN^.SUMMA/OO*
                                              WORK_DAY(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON,ROUND(OO))-
                                              SUM_VYPLACHENO_ADD_ID(CURR_CN^.SHIFR,CURR_PERSON,PERIOD,CURR_ADDW^.WHO));
                                         CURR_ADDW^.FZP   := CURR_ADDW^.SUMMA;
                                         CURR_ADDW^.FMP   := 0;
                                         CURR_ADDW^.OTHER := 0;
                                   END
                                                                 ELSE
                                   BEGIN
                                          CURR_ADDW^.SUMMA := R10(CURR_CN^.SUMMA-
                                              SUM_VYPLACHENO_ADD_ID(CURR_CN^.SHIFR,CURR_PERSON,PERIOD,CURR_ADDW^.WHO));
                                          CURR_ADDW^.FZP   := CURR_ADDW^.SUMMA;
                                          CURR_ADDW^.FMP   := 0;
                                          CURR_ADDW^.OTHER := 0;
                                   END;
                          END;
                        2:BEGIN CURR_ADDW^.SHIFR  := CURR_CN^.SHIFR;
                                CURR_ADDW^.PERIOD := PERIOD;
                                CURR_ADDW^.WHO    := CURR_CN^.ID;
//                                IF isFiveDayMode(CURR_PERSON) THEN OO:=GetWDay(NMES,CURR_PERSON)//OO := W_DAY[NMES]
//                                                              ELSE OO:=GetWDay(NMES,CURR_PERSON);//OO := W_DAY[NMES];
                                OO:=GetWDay(NMES,CURR_PERSON);//OO := W_DAY[NMES];
                                if Abs(oo)<0.9 then
                                if NMES=FLOW_MONTH then
                                   ShowMessage('Не указан календарь за '+getMonthRus(nmes));
                                IF CURR_PERSON^.WID_OPLATY=POCHAS_WID_OPLATY THEN
    O_PERSON := CURR_PERSON^.OKLAD*WORK_CLOCK(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON)
                                                                              ELSE
                                if Abs(oo)<0.99 then
                                   O_PERSON:=0
                                else                                                 
    O_PERSON:=GET_PERSON_OKLAD(CURR_PERSON)/OO*WORK_DAY(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON,ROUND(OO));
                                if O_PERSON<0.1 then O_PERSON:=0;
                                CURR_ADDW^.SUMMA:=R10(O_PERSON*CURR_CN^.SUMMA/100-
                                      SUM_VYPLACHENO_ADD_ID(CURR_CN^.SHIFR,CURR_PERSON,PERIOD,CURR_ADDW^.WHO));
                                CURR_ADDW^.FZP  :=CURR_ADDW^.SUMMA;
                                CURR_ADDW^.FMP  :=0;
                                CURR_ADDW^.OTHER:=0;
                          END;
                        5:  BEGIN
                                CURR_ADDW^.SHIFR  := CURR_CN^.SHIFR;
                                CURR_ADDW^.PERIOD := PERIOD;
                                CURR_ADDW^.WHO    := CURR_CN^.ID;
                                IF (CURR_PERSON^.WID_OPLATY=STAWKA_WID_OPLATY) AND
                                    (CURR_CN^.SHIFR  IN [NADBAWKA_SHIFR    ,
                                                         NADBAWKA_SHIFR_N   ,
                                                         NADBAWKA_SHIFR_GN  ,
                                                         SOWMESTIT_SHIFR   ,
                                                         NADBAWKA_K_Z_SHIFR,
                                                         DOPLATA_K_ZARPL_SHIFR,
//                                                         ZAMESTIT_SHIFR    ,
                                                         ZA_ZW_ZASL_SHIFR  ,
                                                         ZAW_KAFEDROJ_SHIFR,
                                                         BRIGADIR_SHIFR,
                                                         ZA_ZAM_DEKANA_SHIFR,
                                                         VYSLUGA_SHIFR,
                                  //                       ZA_ZASL_PROF_SHIFR,
                                                         ZA_STEP_SHIFR,
                                                         ZA_ZWAN_SHIFR,
                                                         CycleComisShifr,
                                                         ZawKabinetShifr,
                                                         ProverkaTetradejShifr,
                                                         KlassnoeRukowodstwoShifr ]) THEN
                                   BEGIN
//                                         IF isFiveDayMode(CURR_PERSON) THEN OO:=GetWDay(NMES,CURR_PERSON)//OO:=W_DAY[NMES]
//                                                                       ELSE OO:=GetWDay(NMES,CURR_PERSON);//OO:=W_DAY[NMES];
                                         OO:=GetWDay(NMES,CURR_PERSON);//OO:=W_DAY[NMES];
                                         if Abs(oo)<0.9 then
                                         if NMES=FLOW_MONTH then
                                            ShowMessage('Не указан календарь за '+getMonthRus(nmes));
                                         IF CURR_CN^.SHIFR IN[NADBAWKA_SHIFR,
                                                              NADBAWKA_SHIFR_N,
                                                              DOPLATA_K_ZARPL_SHIFR,
                                                              NADBAWKA_SHIFR_GN,
                                                              VYSLUGA_SHIFR,
                                           //                   ZA_ZASL_PROF_SHIFR,
                                                              ZA_STEP_SHIFR,
                                                              ZA_ZWAN_SHIFR] THEN
                                            BEGIN
                                              CURR_ADDW^.SUMMA := R10(CURR_CN^.SUMMA/OO*
                                              NADBAWKA_DAY(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON)-
                                              SUM_VYPLACHENO_ADD_ID(CURR_CN^.SHIFR,CURR_PERSON,PERIOD,CURR_ADDW^.WHO));
                                            END
                                                                         ELSE
                                            CURR_ADDW^.SUMMA := R10(CURR_CN^.SUMMA/OO*
                                              WORK_DAY(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON,ROUND(OO))-
                                              SUM_VYPLACHENO_ADD_ID(CURR_CN^.SHIFR,CURR_PERSON,PERIOD,CURR_ADDW^.WHO));
                                         CURR_ADDW^.OTHER   := CURR_ADDW^.SUMMA;
                                         CURR_ADDW^.FMP   := 0;
                                         CURR_ADDW^.FZP   := 0;
                                   END
                                                                 ELSE
                                   BEGIN
                                          CURR_ADDW^.SUMMA := R10(CURR_CN^.SUMMA-SUM_VYPLACHENO_ADD_ID(CURR_CN^.SHIFR,
                                                                   CURR_PERSON,PERIOD,CURR_ADDW^.WHO));
                                          CURR_ADDW^.OTHER := CURR_ADDW^.SUMMA;
                                          CURR_ADDW^.FMP   := 0;
                                          CURR_ADDW^.FZP   := 0;
                                   END;
                          END;
                        6:BEGIN CURR_ADDW^.SHIFR  := CURR_CN^.SHIFR;
                                CURR_ADDW^.PERIOD := PERIOD;
                                CURR_ADDW^.WHO    := CURR_CN^.ID;
//                                IF isFiveDayMode(CURR_PERSON) THEN OO:=GetWDay(NMES,CURR_PERSON)//OO := W_DAY[NMES]
//                                                              ELSE OO:=GetWDay(NMES,CURR_PERSON);//OO := W_DAY[NMES];
                                OO:=GetWDay(NMES,CURR_PERSON);//OO := W_DAY[NMES];
                                if Abs(oo)<0.9 then
                                if NMES=FLOW_MONTH then
                                   ShowMessage('Не указан календарь за '+getMonthRus(nmes));
                                IF CURR_PERSON^.WID_OPLATY=POCHAS_WID_OPLATY THEN
   O_PERSON := CURR_PERSON^.OKLAD*WORK_CLOCK(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON)
                                                                              ELSE
                                if Abs(oo)<0.9 then
                                   o_person:=0
                                else                                                 
   O_PERSON:=GET_PERSON_OKLAD(CURR_PERSON)/OO*WORK_DAY(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON,ROUND(OO));
                                CURR_ADDW^.SUMMA:=R10(O_PERSON*CURR_CN^.SUMMA/100-
                                      SUM_VYPLACHENO_ADD_ID(CURR_CN^.SHIFR,CURR_PERSON,PERIOD,CURR_ADDW^.WHO));
                                CURR_ADDW^.OTHER :=CURR_ADDW^.SUMMA;
                                CURR_ADDW^.FMP  :=0;
                                CURR_ADDW^.FZP  :=0;
                          END;
                   END; {END CASE}
                   IF ABS(CURR_ADDW^.SUMMA)<0.01 THEN DEL_ADD(CURR_ADDW,CURR_PERSON)
                                                 ELSE CURR_ADDW^.SHIFR:=CURR_ADDW^.SHIFR+SHIFT_SHIFR;
                 END;   {END OF TEST НАЧИСЛЕНИЯ}
          END; {END FOR}
     { КАЛЬКУЛЯЦИЯ УДЕРЖАНИЙ }
      FOR I:=1 TO C_CN DO
          BEGIN
               IF I=1 THEN CURR_CN:=CURR_PERSON^.CN
                      ELSE CURR_CN:=CURR_CN^.NEXT;
               IF CURR_CN^.SHIFR<LIMIT_CN_BASE      THEN
               IF not ShifrList.IsAdd(CURR_CN^.SHIFR)         THEN
               IF CURR_CN^.AUTOMATIC=AUTOMATIC_MODE THEN
               IF ((CURR_CN^.SHIFR<>AWANS_SHIFR)    OR
                 ((CURR_CN^.SHIFR=AWANS_SHIFR) AND (CURR_CN^.PRIM_1<>'Выплачен')) OR
                 ((CURR_CN^.SHIFR=AWANS_SHIFR) AND (NOT IS_GET_OUT_AWANS(CURR_PERSON,PERIOD)))) OR
                 ((CURR_CN^.SHIFR=AWANS_SHIFR) AND (MUST_MAKE_AWANS(CURR_PERSON,PERIOD))) THEN
                  BEGIN
                   C_UD:=COUNT_UD(CURR_PERSON);
                   FOUND:=FALSE;
                   J:=0;
                   IF C_UD>0 THEN
                       WHILE (J<C_UD) AND (NOT FOUND) DO
                        BEGIN
                         J:=J+1;
                         IF J=1 THEN CURR_UDW:=CURR_PERSON^.UD
                                ELSE CURR_UDW:=CURR_UDW^.NEXT;
                         IF (CURR_UDW^.SHIFR=CURR_CN^.SHIFR)   THEN
                         IF (CURR_UDW^.PERIOD=PERIOD)          THEN
                         IF (CURR_UDW^.VYPLACHENO=NOT_GET_OUT) THEN  FOUND:=TRUE;
                        END;
                   IF NOT FOUND THEN BEGIN
                                          MAKE_UD(CURR_UDW,CURR_PERSON);
                                          CURR_UDW^.PERIOD:=PERIOD;
                                     END;
                   IF CURR_UDW^.VYPLACHENO=NOT_GET_OUT THEN
                   CASE CURR_CN^.KOD OF
                        1:  BEGIN
                            IF ((CURR_CN^.SHIFR=AWANS_SHIFR)  AND
                             ((CURR_CN^.PRIM_1='Выплачен')           OR
                              (IS_GET_OUT_AWANS(CURR_PERSON,PERIOD)) OR
                              (NOT MUST_MAKE_AWANS(CURR_PERSON,PERIOD))))  THEN
                                                                                    ELSE
                          BEGIN
                               VAL(FLOW_YEAR,II,JJ);
                               II:=II-1900;
                               IF (CURR_CN^.SHIFR IN [AWANS_SHIFR,KREDIT_SHIFR,SSUDA_SBRK_SHIFR,SSUDA_FROM_FR_SHIFR,
{                                                      SSUDA_UKRAINA_SHIFR,PROCENT_SSUDY_SHIFR,KWARTPLATA_SHIFR,}
                                                      SSUDA_UKRAINA_SHIFR,KWARTPLATA_SHIFR,PERECH_PRIVATBANK_SHIFR,
                                                      MED_STRAH_SHIFR,OPLATA_ZA_OBUCH_SHIFR,
                                         GOSSTRAH1_SHIFR..GOSSTRAH4_SHIFR,GOSSTRAH5_SHIFR..GOSSTRAH7_SHIFR,S_S_R_SHIFR]) THEN
                                           BEGIN
                                                 CURR_UDW^.SHIFR:=CURR_CN^.SHIFR;
                                                 CURR_UDW^.PERIOD:=PERIOD;
                                                 CURR_UDW^.SUMMA:=R10(CURR_CN^.SUMMA-
                                                        SUM_VYPLACHENO_UD(CURR_CN^.SHIFR,CURR_PERSON,PERIOD));
                                                 CUR_CN:=FIND_CN_BASE(CURR_PERSON,CURR_CN^.SHIFR,PERIOD);
                                                 IF CUR_CN<>NIL THEN CURR_UDW^.SUMMA:=CURR_UDW^.SUMMA-CUR_CN^.SUMMA;
                                                 CURR_UDW^.WHO := CURR_CN^.PRIM;
                                           END;
                          END;
                          END;
                        2:IF ((CURR_CN^.SHIFR=AWANS_SHIFR)  AND
                             ((CURR_CN^.PRIM_1='Выплачен')          OR
                              (IS_GET_OUT_AWANS(CURR_PERSON,PERIOD)) OR
                              (NOT MUST_MAKE_AWANS(CURR_PERSON,PERIOD))))  THEN
                                                                           ELSE
                          BEGIN
                                CURR_UDW^.SHIFR:=CURR_CN^.SHIFR;
                                CURR_UDW^.PERIOD:=PERIOD;
                                CURR_UDW^.WHO   :=CURR_CN^.PRIM;
//                             IF isFiveDayMode(CURR_PERSON) THEN OO:=GetWDay(NMES,CURR_PERSON)//OO:=W_DAY[NMES]
//                                                           ELSE OO:=GetWDay(NMES,CURR_PERSON);//OO:=W_DAY[NMES];
                                OO:=GetWDay(NMES,CURR_PERSON);//OO:=W_DAY[NMES];
                             if Abs(oo)<0.9 then
                             if NMES=FLOW_MONTH then
                                ShowMessage('Не указан календарь за '+getMonthRus(nmes));
                             if Abs(oo)<0.9 then
                                o_person:=0
                             else
     O_PERSON:=GET_PERSON_OKLAD(CURR_PERSON)/OO*WORK_DAY(1,{CURR_PERSON^.START_DAY}LAST_DAY,CURR_PERSON,round(OO));
                                CURR_UDW^.SUMMA:=R10(O_PERSON*CURR_CN^.SUMMA/100-
                                            SUM_VYPLACHENO_UD(CURR_CN^.SHIFR,CURR_PERSON,PERIOD));
                                IF CURR_UDW^.SHIFR=AWANS_SHIFR THEN CURR_UDW^.SUMMA:=AWANS_SUMMA(CURR_UDW^.SUMMA);
                          END;
                        3:IF ((CURR_CN^.SHIFR=AWANS_SHIFR)  AND
                             ((CURR_CN^.PRIM_1='Выплачен')          OR
                              (IS_GET_OUT_AWANS(CURR_PERSON,PERIOD)) OR
                              (NOT MUST_MAKE_AWANS(CURR_PERSON,PERIOD))))  OR
                              (CURR_CN^.SHIFR=ALIMENTY_SHIFR) THEN
                                                                                    ELSE
                          BEGIN
                                CURR_UDW^.SHIFR  := CURR_CN^.SHIFR;
                                CURR_UDW^.PERIOD := PERIOD;
                                CURR_UDW^.WHO    := CURR_CN^.PRIM;
                                SUMMA:=0;
                                C_ADD:=COUNT_ADD(CURR_PERSON);
                                IF C_ADD>0 THEN
                                   FOR J:=1 TO C_ADD DO
                                    BEGIN
                                     IF J=1 THEN CURR_ADD:=CURR_PERSON^.ADD
                                            ELSE CURR_ADD:=CURR_ADD^.NEXT;
                                     IF CURR_ADD^.PERIOD=PERIOD THEN
                                     SUMMA:=SUMMA+R10(CURR_ADD^.SUMMA);
                                    END;
                                CURR_UDW^.SUMMA:=R10(SUMMA*CURR_CN^.SUMMA/100-
                                            SUM_VYPLACHENO_UD(CURR_CN^.SHIFR,CURR_PERSON,PERIOD));
                                IF CURR_UDW^.SHIFR=AWANS_SHIFR THEN CURR_UDW^.SUMMA:=AWANS_SUMMA(CURR_UDW^.SUMMA);
                          END;
                   END; {END CASE}
                   IF ABS(CURR_UDW^.SUMMA)<0.01 THEN DEL_UD(CURR_UDW,CURR_PERSON)
                                                ELSE CURR_UDW^.SHIFR:=CURR_UDW^.SHIFR+SHIFT_SHIFR;
                 END; {END OF TEST УДЕРЖАНИЯ}
          END; {END FOR}
  END; {КОНЕЦ ПРОЦЕДУРЫ ВЫЧИСЛЕНИЯ НАЧИСЛЕНИЙ И УДЕРЖАНИЙ }


PROCEDURE CALC_NALOG_S_O_K_PERSON(CURR_PERSON:PERSON_PTR;PERIOD:INTEGER;YEAR:INTEGER;NACH_SHIFR:WORD;UD_SHIFR:WORD);
 CONST PROCENT=0.13;
 VAR INF:TEXT;
     W_Y,I,J,II:INTEGER;
     CURR_UD,CURR_UDW :UD_PTR;
     CURR_CN :CN_PTR;
     SUMMA,PRF_PERSON:REAL;
     FOUND:BOOLEAN;
     PRF_UD:REAL;
 BEGIN
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
     REPEAT
     UNTIL NOT DEL_WANTED_UD(UD_SHIFR,CURR_PERSON,PERIOD);
     W_Y:=2004;
     VAL(WORK_YEAR,W_Y,I);
     IF (W_Y<2004) THEN EXIT;
     PRF_PERSON:=0;
     IF CURR_PERSON=NIL THEN
        PRF_PERSON:=0.
                        ELSE
        BEGIN
             SUMMA      := 0;
             PRF_PERSON := 0;
             CURR_CN    := CURR_PERSON^.CN;
             while curr_cn<>Nil do
              BEGIN
                   IF CURR_CN^.SHIFR = NACH_SHIFR+Limit_Cn_Base THEN
                   IF CURR_CN^.PRIM = PERIOD THEN SUMMA:=SUMMA+R10(CURR_CN^.SUMMA);
                   Curr_Cn:=Curr_Cn^.Next;
              END;
             IF PERIOD IN [1..12] THEN PRF_PERSON:=R10(SUMMA*PROCENT);
        END;
     PRF_UD:=0;
     PRF_UD:=PRF_UD+SUM_VYPLACHENO_UD(UD_Shifr,CURR_PERSON,PERIOD);
     SUMMA:=PRF_PERSON-PRF_UD;
     IF (ABS(SUMMA)>0.009999) THEN
        BEGIN
             MAKE_UD(CURR_UDW,CURR_PERSON);
             CURR_UDW^.SUMMA     := R10(SUMMA);
             CURR_UDW^.PERIOD    := PERIOD;
             CURR_UDW^.YEAR      := YEAR;
             CURR_UDW^.SHIFR     := Ud_Shifr;
             CURR_UDW^.WHO       := 1;
             IF ABS(CURR_UDW^.SUMMA)<0.01 THEN DEL_UD(CURR_UDW,CURR_PERSON);
        END;
 END;
PROCEDURE NALOG_S_O_K_PERSON(CURR_PERSON:PERSON_PTR;NACH_SHIFR:WORD;UD_SHIFR:WORD);
 VAR I,II,I_A,W_Y:INTEGER;
     SUMMA       : REAL;
     CURR_CN     : CN_PTR;
     ItemList    : TItemList;
     Period,Y    : integer;
     ItemRec     : PItemRec;
 PROCEDURE DEL_NALOG_S_O_K(PERIOD:INTEGER;YEAR:INTEGER;UD_Shifr:Word);
  VAR CURR_UD:UD_PTR;
      SEL:BOOLEAN;
  BEGIN
       REPEAT
             SEL:=FALSE;
             Curr_Ud:=Curr_Person^.UD;
             WHILE (Curr_Ud<>Nil) AND (NOT SEL) DO
              BEGIN
                   IF CURR_UD^.SHIFR    = Ud_Shifr    THEN
                   IF CURR_UD^.PERIOD   = PERIOD      THEN
                   IF CURR_UD^.YEAR     = YEAR        THEN
                   IF CURR_UD^.VYPLACHENO=NOT_GET_OUT THEN
                      BEGIN
                           DEL_UD(CURR_UD,CURR_PERSON);
                           SEL:=TRUE;
                           break;
                      END;
                   Curr_Ud:=Curr_Ud^.NEXT;
              END;
       UNTIL (NOT SEL);
  END;
 BEGIN
      Y:=2004-1990;
      SUMMA:=0.;
      CURR_CN:=CURR_PERSON^.CN;
      ItemList:=TItemList.Create;;
      WHILE (CURR_CN<>NIL) DO
       BEGIN
            IF CURR_CN^.SHIFR = NAch_Shifr+Limit_Cn_Base THEN
            IF (CURR_CN^.PRIM>0) AND (CURR_CN^.PRIM<13) THEN
               begin
                    Period:=CURR_CN^.PRIM;
                    if not ItemList.IsMonthYear(Period,Y) then
                       begin
                            New(ItemRec);
                            ItemRec^.Month:=Period;
                            ItemRec^.Year:=Y;
                            ItemList.Add(ItemRec);
                       end;
               END;
            CURR_CN:=CURR_CN^.NEXT;
       END;
     if ItemList.Count>0 then
        for i:=1 to ItemList.Count do
            begin
                  Period := PItemRec(ItemList.Items[i-1])^.Month;
                  Y      := PItemRec(ItemList.Items[i-1])^.Year;
                  DEL_NALOG_S_O_k(PERIOD,Y,NACH_Shifr);
                  CALC_NALOG_S_O_K_PERSON(CURR_PERSON,Period,Y,NACH_SHIFR,UD_Shifr);
            end;
     ItemList.Free;
 END;
  PROCEDURE NALOG_S_OBUCH_PERSON(CURR_PERSON:PERSON_PTR);
    begin
          NALOG_S_O_K_PERSON(CURR_PERSON,OplataObuchShifr,NalogSOplObuchShifr);
          NALOG_S_O_K_PERSON(CURR_PERSON,OplataKomandirovokShifr,NalogSKomandirovokShifr);
    end;



PROCEDURE CALC_NAUD_FULL;
 TYPE SCR=ARRAY[1..4000] OF BYTE;
 VAR I,C_PERSON:INTEGER;
     CURR_PERSON:PERSON_PTR;
     II:INTEGER;
     LAST_DAY:INTEGER;
     BB,LD,REC:INTEGER;
     SAFE_SCREEN:SCR;
     NSRV_TMP:Integer;
BEGIN
     IF NMES<>FLOW_MONTH THEN EXIT;

     LAST_DAY:=31;
     C_PERSON:=COUNT_PERSON;
     REC:=C_PERSON;
     IF C_PERSON=0 THEN EXIT;
     NSRV_TMP:=NSRV;

     Curr_Person:=Head_Person;
     while (Curr_Person<>Nil)  DO
         BEGIN
              IF NOT IS_ALL_BLOCKED(CURR_PERSON)       THEN
              if getDayOfUwol(Curr_Person)>0           THEN
              IF CURR_PERSON^.AUTOMATIC=AUTOMATIC_MODE THEN
                 BEGIN
                      CheckTabelForUwol(Curr_Person);
                      OKLAD_PERSON(CURR_PERSON,LAST_DAY);
                      CALC_NAUD_WORK_WITHOUT_ALL_REST(CURR_PERSON,NMES,LAST_DAY);
                      DOPL_DO_MIN_SAL_PERSON(CURR_PERSON,LAST_DAY);
//                      DIFF_SAL_PERSON(CURR_PERSON,LAST_DAY);
                      PODOH_PERSON(CURR_PERSON,2,1);
                      PROF_PERSON(CURR_PERSON);
                      WS_PERSON(Curr_Person);
//                      PENS_PERSON(CURR_PERSON);
               //       FOND_PERSON(CURR_PERSON);
                      KOP_PERSON(CURR_PERSON);
                      NALOG_S_OBUCH_PERSON(CURR_PERSON);
                      WORK_OUT_DOLG(CURR_PERSON);
                      ExcludeShift_Shifr(Curr_Person);
                 END;
              Curr_Person:=Curr_Person^.NEXT;
         END;
     Curr_Person:=Head_Person;
     while (Curr_Person<>Nil)  DO
         begin
              IF CURR_PERSON^.AUTOMATIC=AUTOMATIC_MODE THEN CALC_UD_FOR_ALL_REST(CURR_PERSON,NMES);
              Curr_Person:=Curr_Person^.NEXT;
         END;
     NSRV:=NSRV_TMP;
 END;
PROCEDURE CALC_NAUD(CURFIL:INTEGER;LAST_DAY:INTEGER;moderecalc:integer);
 VAR CURR_PERSON:PERSON_PTR;
     I:INTEGER;
     S:string;
     NSRV_TMP:Integer;
BEGIN {НАЧАЛО ГЛАВНОЙ ПРОГРАММЫ CALC_NAUD(CURR_PERSON)}
    IF NMES<>FLOW_MONTH THEN EXIT;
    NSRV_TMP:=NSRV;
    try
       FOR I:=1 TO CURFIL DO
           IF I=1 THEN CURR_PERSON:=HEAD_PERSON
                  ELSE CURR_PERSON:=CURR_PERSON^.NEXT;
       IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
       IF IS_ALL_BLOCKED(CURR_PERSON)  THEN EXIT;
       if getDayOfUwol(Curr_Person)<=0 THEN Exit;

       SortedAddList:=TSortedAddList.Init(Curr_Person);
       CheckTabelForUwol(Curr_Person);
       try
           OKLAD_PERSON(CURR_PERSON,LAST_DAY);
       except
         else
           Error('Ошибка расчета оклада 1');
       end;
       try
          CALC_NAUD_WORK_WITHOUT_ALL_REST(CURR_PERSON,NMES,LAST_DAY);
       except
          else
           Error('Ошибка расчета прочих начислений 1');
       end;
       ExcludeShift_Shifr(Curr_Person);
{            IF CURR_PERSON^.WID_RABOTY=SOWM_WID_RABOTY THEN PODOH_SOWM_PERSON(CURR_PERSON)
                                               ELSE}
       try
           DOPL_DO_MIN_SAL_PERSON(CURR_PERSON,LAST_DAY);
       except
         else
           Error('Ошибка расчета доплаты до мини.з.п.');
       end;
//       try
//           DIFF_SAL_PERSON(CURR_PERSON,LAST_DAY);
//       except
//           else
//           Error('Ошибка расчета дифееренциацииз.п.');
//       end;

       if NeedTestAddDuplicates then
          IsPersonDup(Curr_Person,NeedRepairFindedAddDuplicates,' при перерасчете Calc_Naud');
       try
           PODOH_PERSON(CURR_PERSON,moderecalc,1);
       except
//         else
          on E: Exception do
             begin
                  Error('Ошибка расчета налога с дохода 1 '+E.Message);
                  SystemCrash:=True;
             end;          
       end;
       PROF_PERSON(CURR_PERSON);
       WS_PERSON(Curr_Person);

//    PENS_PERSON(CURR_PERSON);
//    FOND_PERSON(CURR_PERSON);
       NALOG_S_OBUCH_PERSON(CURR_PERSON);
       KOP_PERSON(CURR_PERSON);
       try
           CALC_UD_FOR_ALL_REST(CURR_PERSON,NMES);
       except
         else
             Error('Ошибка расчета прочих удержаний 1');
       end;
       WORK_OUT_DOLG(CURR_PERSON);
       ExcludeShift_Shifr(Curr_Person);
       SortedAddList.RestoreOrderAddList(Curr_Person);
       SortedAddList.Done;
       SortedAddList:=Nil;
    except
      on E:Exception do
          begin
               S:='Ошибка перерасчета 1 '+trim(E.Message);
               if (Assigned(Curr_Person) and (CURR_PERSON<>Nil)) then
                  S:=S+' '+trim(Curr_Person^.FIO);
               Error(S);
               SystemCrash:=True;
          end;
    end;
    NSRV:=NSRV_TMP;

END;
PROCEDURE CALC_NAUD_PERSON(CURR_PERSON:PERSON_PTR;LAST_DAY:INTEGER;moderecalc:integer);
var l:integer;
    S:string;
    NSRV_TMP:Integer;
BEGIN {НАЧАЛО ГЛАВНОЙ ПРОГРАММЫ CALC_NAUD(CURR_PERSON)}
    IF NMES<>FLOW_MONTH THEN EXIT;
{    ERROR('CURR_PERSON');}
    IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
    IF IS_ALL_BLOCKED(CURR_PERSON) THEN EXIT;
    if getDayOfUwol(Curr_Person)<=0 THEN Exit;
    NSRV_TMP:=NSRV;;
    CheckTabelForUwol(Curr_Person);
    try
       SortedAddList:=TSortedAddList.Init(Curr_Person);
       l:=count_add(curr_person);
       try
          OKLAD_PERSON(CURR_PERSON,LAST_DAY);
       except
         else
             begin
                  Error('Ошибка расчета оклада');
             end;
       end;
       l:=count_add(curr_person);
       try
          CALC_NAUD_WORK_WITHOUT_ALL_REST(CURR_PERSON,NMES,LAST_DAY);
       except
         else
             begin
                  Error('Ошибка расчета прочих начислений');
             end;
       end;
       DOPL_DO_MIN_SAL_PERSON(CURR_PERSON,LAST_DAY);
//       DIFF_SAL_PERSON(CURR_PERSON,LAST_DAY);
{    IF CURR_PERSON^.WID_RABOTY=SOWM_WID_RABOTY THEN PODOH_SOWM_PERSON(CURR_PERSON)
                                               ELSE PODOH_PERSON(CURR_PERSON);}
       if NeedTestAddDuplicates then
          IsPersonDup(Curr_Person,NeedRepairFindedAddDuplicates,' при перерасчете Calc_Naud_Person');

       try
          PODOH_PERSON(CURR_PERSON,MODERECALC,1);
       except
         else
             begin
                  Error('Ошибка расчета налога с дохода');
             end;
       end;
       PROF_PERSON(CURR_PERSON);
       WS_PERSON(Curr_Person);
 //   PENS_PERSON(CURR_PERSON);
//    FOND_PERSON(CURR_PERSON);
       NALOG_S_OBUCH_PERSON(CURR_PERSON);
       KOP_PERSON(CURR_PERSON);
       try
          CALC_UD_FOR_ALL_REST(CURR_PERSON,NMES);
       except
         else
             begin
                  Error('Ошибка расчета прочих удержаний');
             end;
       end;
       WORK_OUT_DOLG(CURR_PERSON);
       ExcludeShift_Shifr(Curr_Person);
       SortedAddList.RestoreOrderAddList(Curr_Person);
       SortedAddList.Done;
       SortedAddList:=Nil;
    except
      on e:Exception do
        begin
             S:='Ошибка перерасчета '+trim(E.Message);
             if Assigned(Curr_Person)and (CURR_PERSON<>Nil) then
                S:=S+' '+trim(Curr_Person^.FIO);
             Error(S);
        end
    end;
    NSRV:=NSRV_TMP;    
END;

PROCEDURE CALC_NAUD_PERSON_WITHOUT_UD(CURR_PERSON:PERSON_PTR;LAST_DAY:INTEGER);
var l:integer;
BEGIN {НАЧАЛО ГЛАВНОЙ ПРОГРАММЫ CALC_NAUD(CURR_PERSON)}
    IF NMES<>FLOW_MONTH THEN EXIT;
{    ERROR('CURR_PERSON');}
    IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
  //  IF IS_ALL_BLOCKED(CURR_PERSON) THEN EXIT;
    l:=count_add(curr_person);
    OKLAD_PERSON(CURR_PERSON,LAST_DAY);
    l:=count_add(curr_person);
    CALC_NAUD_WORK_WITHOUT_ALL_REST(CURR_PERSON,NMES,LAST_DAY);
    DOPL_DO_MIN_SAL_PERSON(CURR_PERSON,LAST_DAY);
//    DIFF_SAL_PERSON(CURR_PERSON,LAST_DAY);
    ExcludeShift_Shifr(Curr_Person);
{    IF CURR_PERSON^.WID_RABOTY=SOWM_WID_RABOTY THEN PODOH_SOWM_PERSON(CURR_PERSON)
                                               ELSE PODOH_PERSON(CURR_PERSON);}
(*
   PODOH_PERSON(CURR_PERSON,MODERECALC,1);
    PROF_PERSON(CURR_PERSON);
 //   PENS_PERSON(CURR_PERSON);
//    FOND_PERSON(CURR_PERSON);
    NALOG_S_OBUCH_PERSON(CURR_PERSON);
    KOP_PERSON(CURR_PERSON);
    CALC_UD_FOR_ALL_REST(CURR_PERSON,NMES);
    WORK_OUT_DOLG(CURR_PERSON);
 *)
END;

PROCEDURE KOP_PERSON(CURR_PERSON:PERSON_PTR);
 VAR INF:TEXT;
     I,J,II:INTEGER;
     CURR_ADD:ADD_PTR;
     CURR_UD,CURR_UDW :UD_PTR;
     SUMMA,KOP:REAL;
     FOUND:BOOLEAN;
     L:BOOLEAN;
 BEGIN
     IF CURR_PERSON^.AUTOMATIC<>AUTOMATIC_MODE THEN EXIT;
     L:=DEL_WANTED_UD(FUTURE_KOP_SHIFR,CURR_PERSON,NMES);
 END;

FUNCTION getWSSumma(Summa:Real):real;
   begin
        Result:=r10(Summa*procWS/100);

   end;


end.
