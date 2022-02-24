unit UFormGen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormGen = class(TForm)
    ProgressBar1: TProgressBar;
    LabelHdr1: TLabel;
    LabelFtr1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    LabelHdr2: TLabel;
    LabelFtr2: TLabel;
    LabelHdr3: TLabel;
    LabelFtr3: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    PROCEDURE GET_INF;
    PROCEDURE MAKE_NEW_MONTH;
    procedure Make_CN_Back;
    function GetMonAndYearForCnBack(var Mn,Y:word):integer;
    procedure RecalcAllPodr;



  public
    { Public declarations }
  end;

var
  FormGen: TFormGen;

implementation
  uses scrDef,ScrIo,ScrUtil,ScrNalog,uFIBModule,uFormWait,uFormSelPKG,ScrLists,
  UFormMakeOtpTableFromSQL,DateUtils,USQLUnit;

{$R *.dfm}

procedure TFormGen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;


PROCEDURE TFormGen.GET_INF;
 VAR I,J,KOD,NMESOLD:INTEGER;
     SLL,SEL:BOOLEAN;
     CURR_PERSON:PERSON_PTR;
     I_NSRV:INTEGER;
     V:Variant;
{ ***************************************************** }
{ * Процедура модификации информации на основе табеля * }
{ ***************************************************** }
PROCEDURE MODI_INF;
 VAR I,J,K,III,ii:INTEGER;
     CURR_PERSON : PERSON_PTR;
     CURR_ADD    : ADD_PTR;
     CURR_UD     : UD_PTR;
     CURR_CN     : CN_PTR;
     REZ_COUNT   : INTEGER;
     DEVDISC     : TEXTFile;
     SEL         : BOOLEAN;
     SUMMA_DOLGA : REAL;
     SAVE_NMES   : INTEGER;
     PERIOD_KOP  : INTEGER;
     SUMMA_KOP   : REAL;
     DELETED     : BOOLEAN;
     Wanted_Shifr: integer;
     Finded      : boolean;
 procedure Make_Otp_Tabel(Curr_Person:Person_ptr);
  var s:string;
      y,m:integer;
      i,l:integer;
      f:boolean;
      v:variant;
      SQLStmnt:string;
  begin
       if isLNR then
          Exit;
       m := nmes;
       y := CurrYear;
       SQLStmnt := 'select first 1 s from pr_bld_otp_tabel('+IntToStr(Curr_Person^.Tabno)+','+IntToStr(Y)+','+IntToStr(m)+')';
       v := SQLQueryValue(SQLStmnt);
       s := v;
       l := length(trim(s));
       if l>31 then l:=31;
       FOR I:=1 TO l DO
           begin
                f:=false;
                if s[i]='1' then f:=true;
                if not f then continue;
      //          if day_kod[i]=4 then continue; { праздничные не менять }
                if GetDayCode(i)=4 then continue; { праздничные не менять }
                CURR_PERSON^.TABEL[I]:=TARIFN_OTPUSK;
           end;
  end;
 PROCEDURE FILL_TABEL_UW(CURR_PERSON:PERSON_PTR);
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

 PROCEDURE FILL_STANDARD_TABEL(CURR_PERSON:PERSON_PTR);
  VAR I:INTEGER;
  BEGIN
       IF CURR_PERSON^.MAIN<=0 THEN EXIT;
       FOR I:=1 TO 31 DO
          //      CASE MONTH_DAY[2,NMES,I] OF
                CASE GetDayCode(i) OF
                     0 : CURR_PERSON^.TABEL[I]:=NEZAPOLN;
                     1 : CURR_PERSON^.TABEL[I]:=JAWKA;
                     2 : IF isFiveDayMode(CURR_PERSON) THEN CURR_PERSON^.TABEL[I]:=VYHODN
                                                       ELSE CURR_PERSON^.TABEL[I]:=JAWKA;
                     3 : CURR_PERSON^.TABEL[I]:=VYHODN;
                     4 : CURR_PERSON^.TABEL[I]:=VYHODN;
                END;
     MAKE_OTP_TABEL(CURR_PERSON);
     FILL_TABEL_UW(CURR_PERSON);
  END;

    FUNCTION FIND_OLD_DOLG(CURR_PERSON:PERSON_PTR;CURR_UD:UD_PTR):CN_PTR;
    VAR C_CN   : CN_PTR;
        I,I_CN : INTEGER;
        FOU    : BOOLEAN;
    BEGIN
        I_CN:=COUNT_CN(CURR_PERSON);
        I   := 0;
        FOU := FALSE;
        Curr_Cn:=Curr_Person^.CN;
        while (Curr_Cn<>Nil) do
          begin
               IF Curr_CN^.SHIFR=DOLG_ZA_RABOCHIM_SHIFR+LIMIT_CN_BASE THEN
               IF Curr_CN^.PRIM=CURR_UD^.PERIOD THEN
                  begin
                       FOU:=TRUE;
                       break;
                  end;
               Curr_Cn:=Curr_Cn^.Next;
          end;
        IF FOU THEN FIND_OLD_DOLG:=Curr_CN
               ELSE FIND_OLD_DOLG:=NIL;
    END;


 BEGIN
      Wanted_Shifr := 10;
      Curr_Person  := Head_Person;
      while (Curr_Person<>Nil) DO
       begin
              //IF CURR_PERSON^.WID_OPLATY=POCHAS_WID_OPLATY  THEN CURR_PERSON^.DAY:=W_DAY[NMES,1]*8;
              IF IS_TEST_DEKRET(CURR_PERSON) THEN CURR_PERSON^.DAY:=0;
              IF (CURR_PERSON^.WID_RABOTY>2) AND (CURR_PERSON^.GRUPPA>1) THEN CURR_PERSON^.DAY:=0;
              IF CURR_PERSON^.MAIN>1 THEN CURR_PERSON^.MAIN:=1;
              SUMMA_DOLGA:=0;
              Curr_add:=Curr_person^.add;
              WHILE CURR_ADD<>Nil DO
                begin
                     SUMMA_DOLGA:=SUMMA_DOLGA+SUM(CURR_ADD^.SUMMA);
                     Curr_Add:=Curr_Add^.Next;
                end;
               while true do
                 begin
                      Deleted:=false;
                      Curr_add:=Curr_person^.add;
                      if Curr_add=Nil then break;
                      DEL_ADD(CURR_ADD,CURR_PERSON);
                 end;
               PERIOD_KOP:=0;
               Curr_Ud:=Curr_Person^.Ud;
               WHILE (Curr_Ud<>Nil) DO
                 BEGIN
                      SUMMA_DOLGA:=SUMMA_DOLGA-SUM(CURR_UD^.SUMMA);
                      IF CURR_UD^.SHIFR=DOLG_ZA_RABOCHIM_SHIFR THEN
                         BEGIN
                              CURR_CN:=FIND_OLD_DOLG(CURR_PERSON,CURR_UD);
                              IF CURR_CN<>NIL                   THEN
                                 BEGIN
                                     IF CURR_CN^.PRIM=CURR_UD^.PERIOD  THEN
                                        BEGIN
                                            IF CURR_UD^.SUMMA>=CURR_CN^.SUMMA THEN
                                               DEL_CN(CURR_CN,CURR_PERSON)
                                            ELSE CURR_CN^.SUMMA:=SUM(CURR_CN^.SUMMA)-SUM(CURR_UD^.SUMMA);
                                        END;
                                 END;
                         END;
                      IF CURR_UD^.SHIFR=FUTURE_KOP_SHIFR THEN
                         BEGIN
                              SUMMA_KOP:=CURR_UD^.SUMMA;
                              PERIOD_KOP:=CURR_UD^.PERIOD;
                         END;
                        Curr_Ud:=Curr_Ud^.Next;;
                 END;
               while true do
                 begin
                      Deleted:=false;
                      Curr_ud:=Curr_person^.ud;
                      if Curr_Ud=Nil then break;
                      Del_Ud(CURR_Ud,CURR_PERSON);
                 end;
               IF ((NMES=FLOW_MONTH-1) OR (NMES-FLOW_MONTH=11)) AND
                   (SUMMA_DOLGA<-0.009) THEN
                    BEGIN
                         MAKE_UD(CURR_UD,CURR_PERSON);
                         CURR_UD^.SHIFR      :=  DOLG_ZA_RABOCHIM_SHIFR;
                         CURR_UD^.SUMMA      := -SUMMA_DOLGA;
                         CURR_UD^.PERIOD     :=  NMES;
                         CURR_UD^.VYPLACHENO :=  NOT_GET_OUT;
                         CURR_UD^.WHO        :=  0;
                     END;
               {$IFNDEF SVDN}
               if not isGKH then
               IF ((NMES=FLOW_MONTH-1) OR (NMES-FLOW_MONTH=11)) AND
                   (Abs(SUMMA_DOLGA)>=0.01) THEN
                    BEGIN
                         MAKE_UD(CURR_UD,CURR_PERSON);
                         CURR_UD^.SHIFR      :=  SALDO_SHIFR;
                         CURR_UD^.SUMMA      := -SUMMA_DOLGA;
                         CURR_UD^.PERIOD     :=  NMES;
                         CURR_UD^.VYPLACHENO :=  NOT_GET_OUT;
                         CURR_UD^.WHO        :=  0;
                     END;
               {$ENDIF}
               IF ((PERIOD_KOP=FLOW_MONTH-1) OR
                   (PERIOD_KOP-FLOW_MONTH=11)) THEN
                    BEGIN
                         MAKE_UD(CURR_UD,CURR_PERSON);
                         CURR_UD^.SHIFR      :=  PROSHL_KOP_SHIFR;
                         CURR_UD^.SUMMA      :=  SUMMA_KOP;
                         CURR_UD^.PERIOD     :=  PERIOD_KOP;
                         CURR_UD^.VYPLACHENO :=  GET_OUT;
                         CURR_UD^.WHO        :=  0;
                    END;
               Curr_Cn:=Curr_Person^.Cn;
               while (Curr_Cn<>Nil) do
                   BEGIN
                         IF CURR_CN^.SHIFR=AWANS_SHIFR THEN
                         IF CURR_CN^.PRIM_1='Выплачен' THEN CURR_CN^.PRIM_1:='        ';
                         Curr_CN:=Curr_Cn^.Next;
                   END;
             { Цикл удаления постоянной информации для которой истек срок хранения }
             { (FLOW_MONTH=сроку; NMES - месяц,из которого копируется информация)        }
               REPEAT
                     Finded  := false;
                     SEL     := FALSE;
                     K       := COUNT_CN(CURR_PERSON);
                     Curr_Cn := Curr_Person^.CN;
                     while (Curr_Cn<>Nil) DO
                       BEGIN
                            Finded:=false;
                            for i:=1 to LenBlSta do
                                if Curr_Cn^.Shifr=BlSta[i]+Limit_Cn_Base then
                                   begin
                                        Finded:=true;
                                        break;
                                   end;
                            IF CURR_CN^.SHIFR>LIMIT_CN_BASE THEN
                            IF CURR_CN^.PRIM <> FLOW_MONTH  THEN
                            if (
                               (not finded)
                               or (CURR_CN^.SHIFR=cn156_shifr+limit_cn_base)
                               ) then
                    //        IF CURR_CN^.Prim<>Wanted_Shifr  then
                                BEGIN
                                     DEL_CN(CURR_CN,CURR_PERSON);
                                     SEL:=TRUE;
                                     break;
                                END;
                            Curr_Cn:=Curr_Cn^.Next;
                       END;
               UNTIL (NOT SEL);
               Curr_Cn:=Curr_Person^.Cn;
               while (Curr_Cn<>Nil) do
                 begin
                      IF ((CURR_CN^.SHIFR=STIPENDIJA_SHIFR+LIMIT_CN_BASE) AND
                         ((CURR_CN^.PRIM=FLOW_MONTH-1) OR (CURR_CN^.PRIM-FLOW_MONTH=11))) THEN
                           CURR_CN^.PRIM:=FLOW_MONTH;
                      Curr_Cn:=Curr_Cn^.Next;
                 end;
               SAVE_NMES   := NMES;
               NMES        := FLOW_MONTH;
               FILL_STANDARD_TABEL(CURR_PERSON);
               NMES        := SAVE_NMES;
               Curr_Person := Curr_Person^.Next;
       END;

 END;
 { *********************************************** }
 { *    Процедура создания новых файлов для       * }
 { *    всех подразделений                       * }
 { *********************************************** }
 PROCEDURE MAKE_ALL_DIVISIONS;
  VAR I,J,NSRVOLD,NMESOLD,KOD,II:INTEGER;
      SEL,SLL:BOOLEAN;
      CURR_PERSON:PERSON_PTR;
      I_NSRV:INTEGER;
  BEGIN

       NSRVOLD:=NSRV;
       NMESOLD:=NMES;
       ProgressBar1.Max:=COUNT_SERV;
       ProgressBar1.Min:=0;
       ProgressBar1.Position:=0;
       LabelHdr1.Caption:='Генерация данных для указанного месяца';
       LabelFtr1.Caption:='';
       Application.ProcessMessages;
       FOR i_NSRV:=1 TO COUNT_SERV DO
           BEGIN
                ProgressBar1.Position:=i_NSRV;
                NSRV:=I_NSRV;;
                LabelFtr1.Caption:=Name_Serv(NSRV);
                Application.ProcessMessages;
                if (isLNR and isGKH) then
                if not IsGKHPodr(i_NSRV) then continue;
                NMES:=NMESOLD;
                NSRV:=I_NSRV;
                MKFLNM;
                IF FILEEXIST(FNINF) THEN continue;
                WHILE TRUE DO
                 BEGIN
                     NMES:=NMES-1;
                     IF NMES=0 THEN NMES:=12;
                     IF NMES=NMESOLD THEN
                        BEGIN
                             if ((not needHideGenerMessages)
                                 or
                                (needHideGenerMessages and (NSRV<>MAX_COUNT_PODRAZD) and (NSRV<>183))) then
                             ShowMessage('ЗАРПЛАТА НЕ НАЧИСЛЯЛАСЬ ДЛЯ '+NAME_SERV(NSRV));
                             Break;
                        END;
                     MKFLNM;
                     IF FILEEXIST(FNINF) THEN
                        BEGIN
                             EMPTY_ALL_PERSON;
                             GETINF(TRUE);
                             SEL:=false;
                             REPEAT
                                   Curr_Person:=Head_Person;
                                   SEL:=FALSE;
                                   while (Curr_Person<>Nil) do
                                     begin
                                          IF CURR_PERSON^.MAIN=0 THEN
                                             BEGIN
                                                  DEL_PERSON(CURR_PERSON);
                                                  SEL:=TRUE;
                                                  break;
                                             END;
                                          Curr_Person:=Curr_Person^.Next;
                                      END;
                             UNTIL NOT SEL;
                             Curr_Person:=Head_Person;
                             while (Curr_Person<>Nil) do
                              begin
                                   Curr_Person^.FROM:=shifr_serv(NSRV);
                                   Curr_Person:=Curr_Person^.Next;
                              end;
                             MODI_INF; {ИНИЦИАЛИЗИРОВАТЬ ИНФОРМАЦИЮ В ФАЙЛЕ}
                             NMES:=NMESOLD;
                             MKFLNM;
                             PUTINF;
                             Break;
                        END;         {IF KOD=0}
                 END; {END WHILE}
           END;  {END OF FOR NSRV:=1 TO COUNT_NSRV}
       LabelHdr1.Caption:='Выполнено';
       LabelFtr1.Caption:='';
       Application.ProcessMessages;
       NSRV:=NSRVOLD;
       NMES:=NMESOLD;
  END;
  PROCEDURE UPDATE_ALL_PERSON_STATE;
   VAR CURR_PERSON:PERSON_PTR;
   BEGIN
       CURR_PERSON:=HEAD_PERSON;
       while (Curr_Person<>Nil) do
         begin
              MAKE_PERSON_STATE(CURR_PERSON);
              Curr_Person:=Curr_Person^.NEXT;
         end;
   END;
  BEGIN
        EMPTY_ALL_PERSON;
        MKFLNM;
        IF NOT FILEEXIST(FNINF) THEN
           MAKE_ALL_DIVISIONS;
        MKFLNM;
        IF FILEEXIST(FNINF) THEN
           BEGIN
                 GETINF(TRUE);
                 UPDATE_ALL_PERSON_STATE;
           END;
      END;  {КОНЕЦ ПРОЦЕДУРЫ GET_INF_NEW}
PROCEDURE TFormGen.MAKE_NEW_MONTH;
  VAR I:INTEGER;
  PROCEDURE RENAME_ALL_FILES;
   VAR I : INTEGER;
       NSRV_TEMP:INTEGER;
       FNameTmp : string;
   BEGIN
       NSRV_TEMP:=NSRV;
       LabelHdr1.Caption     := 'Сохранение старых данных';
       LabelFtr1.Caption     := '';
       ProgressBar1.Max      := Count_Serv;
       ProgressBar1.Min      := 0;
       ProgressBar1.Position := 0;
//       MakeArchivForData;
       Application.ProcessMessages;
       FOR I:=1 TO COUNT_SERV DO
           BEGIN
                NSRV:=I;
                ProgressBar1.Position:=i;
                LabelFtr1.Caption:=Name_Serv(NSRV);
                Application.ProcessMessages;
                MKFLNM;
                IF FILEEXISTS(FNINF) THEN
                   DeleteFile(FNINF);
           END;
       NSRV:=NSRV_TEMP;
   END;
 BEGIN
    if not needHideGenerMessages   then
    if not YesNo('Сгенерировать данные для нового месяца') then
       exit;
    RENAME_ALL_FILES;
    GET_INF;
 END;



procedure TFormGen.BitBtn1Click(Sender: TObject);
begin
     if not needHideGenerMessages then
        if not YesNo('Сгенерировать данные для '+GetMonthRus(NMES)+' '+IntToStr(CURRYEAR)+'г. ?') then
            Exit;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

     MAKE_NEW_MONTH;
  //   Make_CN_Back;
   //  RecalcAllPodr;

end;
{ ****************************************************** }
{ *   Перенос постоянной информации из CN              * }
{ *   из прошлого месяца в текущий                     * }
{ ****************************************************** }

procedure TFormGen.Make_Cn_Back;
 VAR I,J,K:INTEGER;
     C,REC,LD,SC:REAL;
     BB,II:INTEGER;
     NSRV_TEMP,NMES_TEMP,YEAR_TEMP:INTEGER;
     NMES_SRC:INTEGER;
     N_MOnths,S_Month,I_NMES,I_NSRV,I_Step:integer;
     Mn,Y:word;
   FUNCTION MAKE_CN_IN_1:BOOLEAN;
     VAR
       CURR_PERSON_FIELD_1,CURR_PERSON_FIELD_2:PERSON_PTR;
       CURR_ADD   : ADD_PTR;
       CURR_CN    : CN_PTR;
       I,J,K,I_C_2,I_A:INTEGER;
       L,L_PERSON:BOOLEAN;
       A:REAL;
     FUNCTION FIND_PERSON_IN_1(CURR_PERSON:PERSON_PTR):PERSON_PTR;
       VAR CURR_PERSON_1:PERSON_PTR;
           I_C,I:INTEGER;
           LL:BOOLEAN;
       BEGIN
            LL:=FALSE;
            SELECT(1);
            Curr_Person_1:=Head_Person;
            while (Curr_Person_1<>Nil) do
              begin
                   IF CURR_PERSON_1^.TABNO = CURR_PERSON^.TABNO THEN
                   IF CURR_PERSON_1^.KATEGORIJA = CURR_PERSON^.KATEGORIJA THEN
                   IF CURR_PERSON_1^.GRUPPA     = CURR_PERSON^.GRUPPA     THEN
                   IF CURR_PERSON_1^.WID_RABOTY = CURR_PERSON^.WID_RABOTY THEN
                   IF CURR_PERSON_1^.DOLG       = CURR_PERSON^.DOLG THEN
                   IF CURR_PERSON_1^.N_TEMY     = CURR_PERSON^.N_TEMY THEN
                      begin
                           LL:=TRUE;
                           break;
                      end;
                   Curr_Person_1:=Curr_Person_1^.NEXT;
              end;
            IF LL THEN FIND_PERSON_IN_1:=CURR_PERSON_1
                  ELSE FIND_PERSON_IN_1:=NIL;
       END;
   PROCEDURE BUILD_NACH;
    VAR I,I_A,J,K:INTEGER;
        CURR_ADD:ADD_PTR;
        SUMMA:REAL;
    BEGIN
         SUMMA:=0;
         Curr_Add:=CURR_PERSON_FIELD_2^.ADD;
         while (Curr_Add<>NIl) do
          begin
               IF CURR_ADD^.PERIOD=NMES_TEMP THEN
                  SUMMA:=SUMMA+SUM(CURR_ADD^.SUMMA);
               Curr_Add:=Curr_Add^.NEXT;
          end;
         IF ABS(SUMMA)>0.009 THEN
            BEGIN
                 CURR_PERSON_FIELD_1:=FIND_PERSON_IN_1(CURR_PERSON_FIELD_2);
                 IF CURR_PERSON_FIELD_1<>NIL THEN
                    BEGIN
                         CURR_CN:=FIND_CN_BASE(CURR_PERSON_FIELD_1,TOTAL_ADD_SHIFR,NMES_TEMP);
                         IF CURR_CN=NIL THEN MAKE_CN(CURR_CN,CURR_PERSON_FIELD_1);
                         CURR_CN^.SHIFR := TOTAL_ADD_SHIFR+LIMIT_CN_BASE;
                         CURR_CN^.KOD   := 100;
                         CURR_CN^.SUMMA := CURR_CN^.SUMMA+SUMMA;
                         CURR_CN^.PRIM  := NMES_TEMP;
                         L:=TRUE;
                         L_PERSON:=TRUE;
                    END;
            END;
    END;
   PROCEDURE BUILD_UD_PODOH;
    VAR I,I_U,J,K:INTEGER;
        CURR_UD:UD_PTR;
        SUMMA_PO,SUMMA_MA:REAL;
        SUMMA_PR,SUMMA_PE:REAL;
        SUMMA_SS,SUMMA_FO:REAL;
    BEGIN
         SUMMA_PO:=0;
         SUMMA_MA:=0;
         SUMMA_PR:=0;
         SUMMA_PE:=0;
         SUMMA_SS:=0;
         SUMMA_FO:=0;
         Curr_Ud:=Curr_Person_Field_2^.Ud;
         while (Curr_Ud<>NIl) do
          begin
               IF CURR_UD^.SHIFR  = PODOH_SHIFR THEN
               IF CURR_UD^.PERIOD = NMES_TEMP   THEN
               IF CURR_UD^.YEAR   = YEAR_TEMP   THEN
                  SUMMA_PO:=SUMMA_PO+SUM(CURR_UD^.SUMMA);
               IF CURR_UD^.SHIFR  = MALO_SHIFR  THEN
               IF CURR_UD^.PERIOD = NMES_TEMP   THEN
               IF CURR_UD^.YEAR   = YEAR_TEMP   THEN
                  SUMMA_MA:=SUMMA_MA+SUM(CURR_UD^.SUMMA);
               IF CURR_UD^.SHIFR  = PROF_SHIFR  THEN
               IF CURR_UD^.PERIOD = NMES_TEMP   THEN
               IF CURR_UD^.YEAR   = YEAR_TEMP   THEN
                  SUMMA_PR:=SUMMA_PR+SUM(CURR_UD^.SUMMA);
               IF CURR_UD^.SHIFR  = PENS_SHIFR  THEN
               IF CURR_UD^.PERIOD = NMES_TEMP   THEN
               IF CURR_UD^.YEAR   = YEAR_TEMP   THEN
                  SUMMA_PE:=SUMMA_PE+SUM(CURR_UD^.SUMMA);
               IF CURR_UD^.SHIFR  = S_S_SHIFR  THEN
               IF CURR_UD^.PERIOD = NMES_TEMP   THEN
               IF CURR_UD^.YEAR   = YEAR_TEMP   THEN
                  SUMMA_SS:=SUMMA_SS+SUM(CURR_UD^.SUMMA);
               IF CURR_UD^.SHIFR  = FOND_Z_SHIFR  THEN
               IF CURR_UD^.PERIOD = NMES_TEMP   THEN
               IF CURR_UD^.YEAR   = YEAR_TEMP   THEN
                  SUMMA_FO:=SUMMA_FO+SUM(CURR_UD^.SUMMA);
               Curr_Ud:=Curr_Ud^.NEXT;
          end;
         IF (ABS(SUMMA_PO)>0.009) OR
            (ABS(SUMMA_PR)>0.009) or
            (ABS(SUMMA_PE)>0.009) or
            (ABS(SUMMA_SS)>0.009) or
            (ABS(SUMMA_FO)>0.009) or
            (ABS(SUMMA_MA)>0.009) THEN
            BEGIN
                 CURR_PERSON_FIELD_1:=FIND_PERSON_IN_1(CURR_PERSON_FIELD_2);
                 IF CURR_PERSON_FIELD_1<>NIL THEN
                    BEGIN
                          IF ABS(SUMMA_PO)>0.009 THEN
                             BEGIN
                                  CURR_CN:=FIND_CN_BASE(CURR_PERSON_FIELD_1,PODOH_SHIFR,NMES_TEMP);
                                  IF CURR_CN=NIL THEN MAKE_CN(CURR_CN,CURR_PERSON_FIELD_1);
                                  CURR_CN^.SHIFR := PODOH_SHIFR+LIMIT_CN_BASE;
                                  CURR_CN^.KOD   := 100;
                                  CURR_CN^.SUMMA := CURR_CN^.SUMMA+SUMMA_PO;
                                  CURR_CN^.PRIM  := NMES_TEMP;
                                  L:=TRUE;
                                  L_PERSON:=TRUE;
                             END;
                          IF ABS(SUMMA_MA)>0.009 THEN
                             BEGIN
                                  CURR_CN:=FIND_CN_BASE(CURR_PERSON_FIELD_1,MALO_SHIFR,NMES_TEMP);
                                  IF CURR_CN=NIL THEN MAKE_CN(CURR_CN,CURR_PERSON_FIELD_1);
                                  CURR_CN^.SHIFR := MALO_SHIFR+LIMIT_CN_BASE;
                                  CURR_CN^.KOD   := 100;
                                  CURR_CN^.SUMMA := CURR_CN^.SUMMA+SUMMA_MA;
                                  CURR_CN^.PRIM  := NMES_TEMP;
                                  L:=TRUE;
                                  L_PERSON:=TRUE;
                             END;
                          IF ABS(SUMMA_PR)>0.009 THEN
                             BEGIN
                                  CURR_CN:=FIND_CN_BASE(CURR_PERSON_FIELD_1,PROF_SHIFR,NMES_TEMP);
                                  IF CURR_CN=NIL THEN MAKE_CN(CURR_CN,CURR_PERSON_FIELD_1);
                                  CURR_CN^.SHIFR := PROF_SHIFR+LIMIT_CN_BASE;
                                  CURR_CN^.KOD   := 100;
                                  CURR_CN^.SUMMA := CURR_CN^.SUMMA+SUMMA_PR;
                                  CURR_CN^.PRIM  := NMES_TEMP;
                                  L:=TRUE;
                                  L_PERSON:=TRUE;
                             END;
                          IF ABS(SUMMA_PE)>0.009 THEN
                             BEGIN
                                  CURR_CN:=FIND_CN_BASE(CURR_PERSON_FIELD_1,PENS_SHIFR,NMES_TEMP);
                                  IF CURR_CN=NIL THEN MAKE_CN(CURR_CN,CURR_PERSON_FIELD_1);
                                  CURR_CN^.SHIFR := PENS_SHIFR+LIMIT_CN_BASE;
                                  CURR_CN^.KOD   := 100;
                                  CURR_CN^.SUMMA := CURR_CN^.SUMMA+SUMMA_PE;
                                  CURR_CN^.PRIM  := NMES_TEMP;
                                  L:=TRUE;
                                  L_PERSON:=TRUE;
                             END;
                          IF ABS(SUMMA_SS)>0.009 THEN
                             BEGIN
                                  CURR_CN:=FIND_CN_BASE(CURR_PERSON_FIELD_1,S_S_SHIFR,NMES_TEMP);
                                  IF CURR_CN=NIL THEN MAKE_CN(CURR_CN,CURR_PERSON_FIELD_1);
                                  CURR_CN^.SHIFR := S_S_SHIFR+LIMIT_CN_BASE;
                                  CURR_CN^.KOD   := 100;
                                  CURR_CN^.SUMMA := CURR_CN^.SUMMA+SUMMA_SS;
                                  CURR_CN^.PRIM  := NMES_TEMP;
                                  L:=TRUE;
                                  L_PERSON:=TRUE;
                             END;
                          IF ABS(SUMMA_FO)>0.009 THEN
                             BEGIN
                                  CURR_CN:=FIND_CN_BASE(CURR_PERSON_FIELD_1,FOND_Z_SHIFR,NMES_TEMP);
                                  IF CURR_CN=NIL THEN MAKE_CN(CURR_CN,CURR_PERSON_FIELD_1);
                                  CURR_CN^.SHIFR := FOND_Z_SHIFR+LIMIT_CN_BASE;
                                  CURR_CN^.KOD   := 100;
                                  CURR_CN^.SUMMA := CURR_CN^.SUMMA+SUMMA_FO;
                                  CURR_CN^.PRIM  := NMES_TEMP;
                                  L:=TRUE;
                                  L_PERSON:=TRUE;
                             END;

                    END;
            END;
    END;
   PROCEDURE BUILD_CN_UD;
    VAR I,I_CN,J,K : INTEGER;
        CURR_UD    : UD_PTR;
        C_CN       : CN_PTR;
    FUNCTION FIND_UD(SHIFR,PERIOD:INTEGER):UD_PTR;
     VAR  CURR_UD:UD_PTR;
          FOU:BOOLEAN;
     BEGIN
          FOU:=FALSE;
          Curr_Ud:=Curr_Person_Field_2^.Ud;
          while (Curr_Ud<>Nil) do
           begin
                IF CURR_UD^.SHIFR  = SHIFR  THEN
                IF CURR_UD^.PERIOD = PERIOD THEN
                   begin
                       FOU:=TRUE;
                       break;
                   end;
                Curr_Ud:=Curr_Ud^.NEXT;
            end;
          IF FOU THEN FIND_UD:=CURR_UD
                 ELSE FIND_UD:=NIL;
     END;
    BEGIN
         CURR_PERSON_FIELD_1:=FIND_PERSON_IN_1(CURR_PERSON_FIELD_2);
         IF CURR_PERSON_FIELD_1<>NIL THEN
            BEGIN
                 Curr_Cn:=Curr_Person_Field_1^.Cn;
                 while (Curr_Cn<>NIl) do
                  begin
                       CURR_UD:=FIND_UD(CURR_CN^.SHIFR,NMES_TEMP);
                       IF CURR_UD<>NIL THEN
                          BEGIN
                               C_CN:=FIND_CN_BASE(CURR_PERSON_FIELD_1,CURR_CN^.SHIFR,NMES_TEMP);
                               IF C_CN=NIL THEN MAKE_CN(C_CN,CURR_PERSON_FIELD_1);
                               C_CN^.SHIFR := CURR_CN^.SHIFR+LIMIT_CN_BASE;
                               C_CN^.KOD   := 100;
                               C_CN^.SUMMA := CURR_UD^.SUMMA;
                               C_CN^.PRIM  := NMES_TEMP;
                               L:=TRUE;
                               L_PERSON:=TRUE;
                          END;
                       Curr_Cn:=Curr_CN^.Next;
                  end;
            END;
    END;
   BEGIN
       L:=FALSE;
       SELECT(2); {Откуда брать сведения}
       CURR_PERSON_FIELD_2:=HEAD_PERSON;
       while CURR_PERSON_FIELD_2<>NIL do
             BEGIN
                  CURR_ADD:=CURR_PERSON_FIELD_2^.ADD;
                  WHILE CURR_ADD<>NIL DO
                     BEGIN
                          L_PERSON:=FALSE;
{                          IF CURR_ADD^.SHIFR IN [VYSLUGA_SHIFR,PROC_15_SHIFR,OKLAD_SHIFR] THEN}
                          IF CURR_ADD^.SHIFR IN [VYSLUGA_SHIFR,ZA_ZWAN_SHIFR,ZA_STEP_SHIFR,PROC_15_SHIFR,
                                                 OKLAD_SHIFR,ZA_ZW_ZASL_SHIFR,NADBAWKA_K_Z_SHIFR] THEN

                          IF CURR_ADD^.PERIOD = NMES_TEMP       THEN
                             BEGIN
                                   CURR_PERSON_FIELD_1:=FIND_PERSON_IN_1(CURR_PERSON_FIELD_2);
                                   IF CURR_PERSON_FIELD_1<>NIL THEN
                                      BEGIN
                                           CURR_CN:=FIND_CN_BASE(CURR_PERSON_FIELD_1,CURR_ADD^.SHIFR,CURR_ADD^.PERIOD);
                                           IF CURR_CN<>NIL THEN CURR_CN^.SUMMA:=CURR_CN^.SUMMA+CURR_ADD^.SUMMA
                                                           ELSE
                                              begin
                                                   MAKE_CN(CURR_CN,CURR_PERSON_FIELD_1);
                                                   CURR_CN^.SHIFR := CURR_ADD^.SHIFR+LIMIT_CN_BASE;
                                                   CURR_CN^.KOD   := 100;
                                                   CURR_CN^.SUMMA := CURR_ADD^.SUMMA;
                                                   CURR_CN^.PRIM  := CURR_ADD^.PERIOD;
                                              end;
                                           L:=TRUE;
                                           L_PERSON:=TRUE;
                                      END;
                             END;
                          CURR_ADD:=CURR_ADD^.NEXT;
                     END;
                  BUILD_NACH;
                  BUILD_UD_PODOH;
                  BUILD_CN_UD;
                  CURR_PERSON_FIELD_2:=CURR_PERSON_FIELD_2^.NEXT;
             END;
       MAKE_CN_IN_1:=L;
  END;
  BEGIN
        n_Months:=GetMonAndYearForCnBack(Mn,Y);
//        IF NMES=NMES_SRC THEN EXIT;
      //  SELECT_SERV;
        LabelHDR2.Caption:='Перенос постонных из пр.мес за текущий';
        LabelFtr2.Caption:='';
        ProgressBar2.Max:=Count_Serv*N_Months;
        ProgressBar2.Min:=0;
        ProgressBar2.Position:=0;
        NSRV_TEMP:=NSRV;
        NMES_TEMP:=NMES;
        YEAR_TEMP:=CURRYEAR-1990;
        PUTINF;
        SC:=0;
        S_MONTH:=NMES-1;
        I_Step:=0;
        if S_MONTH=0 then S_Month:=12;
        FOR I_NMES:= 1 to N_MOnths do
            begin
                 nmes_src:=S_Month;
                 FOR I_NSRV:=1 TO COUNT_SERV DO
                     BEGIN
                          I_Step:=I_Step+1;
                          ProgressBar2.Position:=I_Step;
                          Application.ProcessMessages;
                          NSRV:=I_NSRV;
                          if not NameServList.IsSelected(NSRV) then continue;
                          LabelFtr2.Caption:=NAME_SERV(NSRV)+' '+GetMonthRus(nmes_src);
                          Application.ProcessMessages;
                          NMES:=NMES_TEMP;
                          MKFLNM;
                          IF not FILEEXISTS(FNINF) THEN continue;
                          SELECT(1);
                          GETINF(TRUE);
                          NMES:=NMES_SRC;
                          MKFLNM;
                          IF not FILEEXISTS(FNINF) THEN continue;
                          SELECT(2);
                          GETINF(FALSE);
                          IF MAKE_CN_IN_1 THEN
                             BEGIN
                                  SELECT(2);
                                  LDEL_PERSON_OLD;
                                  SELECT(1);
                                  NMES:=NMES_TEMP;
                             //     CALC_NAUD_FULL;
                                  MKFLNM;
                                  PUTINF;
                             END
                          ELSE
                             BEGIN
                                  SELECT(2);
                                  LDEL_PERSON_OLD;
                                  SELECT(1);
                                  EMPTY_ALL_PERSON;
                                  HEAD_ARRAY[1]:=NIL;
                             END;
                          SELECT(1);
                          EMPTY_ALL_PERSON;
                          HEAD_ARRAY[1]:=NIL;
                     END;       {FOR NSRV:=1 TO COUNT_SERV}
                 S_Month:=S_Month-1;
                 if S_Month<1 then S_Month:=12;
            end;  {Цикл по месяцам}
        LabelHdr2.Caption:='Выполнено';
        LabelFtr2.Caption:='';
        Application.ProcessMessages;
        NSRV:=NSRV_TEMP;
        NMES:=NMES_TEMP;
        MKFLNM;
        GETINF(NEED_NET_FOR_GETINF);
  END;

 function TFormGen.GetMonAndYearForCnBack(var Mn,Y:word):integer;
  var l:integer;
      ma,ya,mu,yu:word;
      da,du:TDateTime;
      SQLStmnt:string;
      DataS:String;
      ch:string;
      v:Variant;
  begin
       FormWait.Show;
       Application.ProcessMessages;
       SQLStmnt:='select first 1 month_vy,year_vy from fadd where month_za='+IntToStr(NMES)+' and year_za='+IntToStr(CurrYear)+' and month_vy<>'+IntToStr(NMES)+' order by year_vy||''-''||month_vy||''-01''';
       v:=SQLQueryRecValues(SQLStmnt);
       ma:=v[0];
       if ((ma<1) or (ma>12)) then ma:=nmes;
       ya:=v[1];
       if ((ya<2000) or (ya>2500)) then ya:=CurrYear;
       da:=EncodeDate(ya,ma,1);
       SQLStmnt:='select first 1 month_vy,year_vy from fud where month_za='+IntToStr(NMES)+' and year_za='+IntToStr(CurrYear)+' and month_vy<>'+IntToStr(NMES)+' order by year_vy||''-''||month_vy||''-01''';
       v:=SQLQueryRecValues(SQLStmnt);
       if not (VarIsNull(v) or varisEmpty(v)) then
          begin
               mu:=v[0];
               if mu=0 then mu:=nmes;
               yu:=v[1];
               if yu<2000 then yu:=CURRYEAR;
               du:=EncodeDate(yu,mu,1);
               if du<da then
                  begin
                       ma:=mu;
                       ya:=yu;
                  end;
          end
       else
          begin
               ma:=nmes-1;
               ya:=CURRYEAR;
               if ma=0 then
                  begin
                       ma:=12;
                       dec(ya);
                  end;
          end;
       l:=NMES-ma;
       if L<1 then l:=l+12;
       if ((L<1) or (L>12)) then l:=6;
       mn := ma;
       y  := ya;
       FormWait.Hide;
       Application.ProcessMessages;
       result:=l;
  end;

procedure TFormGen.FormCreate(Sender: TObject);
 var Dt:TDateTime;
     m:integer;
     Mn,Y:word;
begin
     m  := GetMonAndYearForCnBack(Mn,Y);
     Dt := EncodeDate(Y,mn,10);
     DateTimePicker1.Date:=Dt;
     LabelFtr1.Caption:='';
     LabelFtr2.Caption:='';
     LabelFtr3.Caption:='';
     LabelHdr1.Caption:='';
     LabelHdr2.Caption:='';
     LabelHdr3.Caption:='';
     Caption:='Генерация данных за '+GetMonthRus(NMES)+' '+IntToStr(CurrYear)+' г.';
end;

procedure TFormGen.Button1Click(Sender: TObject);
 var Dt:TDateTime;
     m:integer;
     Mn,Y:word;
begin
     m:=GetMonAndYearForCnBack(Mn,Y);
     Dt:=EncodeDate(Y,mn,10);
     DateTimePicker1.Date:=Dt;
     Application.ProcessMessages;
end;

procedure TFormGen.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormGen.RecalcAllPodr;
 var i,i_nsrv    : integer;
     SavNSRV     : integer;
     Curr_Person : Person_Ptr;
 begin
     i:=0;
     ProgressBar3.Max      := COUNT_SERV;
     ProgressBar3.Min      := 0;
     ProgressBar3.Position := 0;
     SavNSRV               := NSRV;
     PutInf;
     empty_all_person;
     FOR I_NSRV:=1 TO COUNT_SERV DO
         BEGIN
             ProgressBar3.Position:=I_Nsrv;
             LabelHdr3.Caption:='Перерасчет начислений-удержаний '+NAME_Serv(NSRV);
             LabelFtr3.Caption:='';
             Application.ProcessMessages;
             NSRV:=I_NSRV;
             if not NameServList.IsSelected(NSRV) then continue;
             MKFLNM;
             if not FileExists(FNINF) then continue;
             GetInf(true);
             Curr_Person:=Head_Person;
             i:=0;
             while (Curr_Person<>Nil) do
               begin
                    i:=i+1;
                    LabelFtr3.Caption := Curr_Person^.FIO;
                    Application.ProcessMessages;
                    Calc_Naud(I,31);
                    Curr_Person:=Curr_Person^.Next;
               end;
             putinf;
             empty_all_person;
       end;
     LabelHdr3.Caption:='Выполнено';
     LabelFtr3.Caption:='';
     Application.ProcessMessages;
     NSRV:=SavNSRV;
     MKFLNM;
     GetInf(true);
 end;


procedure TFormGen.Button2Click(Sender: TObject);

begin
    if not ((CURRYEAR=WORK_YEAR_VAL) and (NMES=FLOW_MONTH)) then
       begin
            ShowMessage('Действие возможно только в текущем месяце');
            Exit;
       end
    else
       begin
            Application.CreateForm(TFormMakeOtpTableFromSQL, FormMakeOtpTableFromSQL);
            FormMakeOtpTableFromSQL.ShowModal;
       end;
end;

end.
