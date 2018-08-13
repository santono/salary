unit ScrLera;
interface                       
        Type TLeraSwodMode=(Lera,Magis802,Magis811,Dogovora);
        Type TBolnMode=(Total,WithoutBoln,BolnOnly,KassaOnly);
//        PROCEDURE LERA_SWOD(Mode:TLeraSwodMode;BolnMode:TBolnMode;Debug_Mode:boolean);
        PROCEDURE LERA_SWOD(Mode:TLeraSwodMode;BolnMode:TBolnMode;Debug_Mode:boolean;NeedBoln:boolean);
implementation
 USES Forms,CLASSES,Dialogs,SysUtils,ScrUtil,ScrDef,ScrIo,UFormView,UFormWait,UFIBModule;
     TYPE TMODE=(Pochas,PPS,UWP,AUP,AHP,NIS,OTH,DOG,DOG_140);
     TYPE
          PRECITEM=^TRECITEM;
          TRECITEM=RECORD
                     SHIFR            : INTEGER;
                     SUMMA_POCHAS_PPS : REAL;
                     SUMMA_PPS        : REAL;
                     SUMMA_UWP        : REAL;
                     SUMMA_AUP        : REAL;
                     SUMMA_AHP        : REAL;
                     SUMMA_NIS        : REAL;
                     SUMMA_OTH        : REAL;
                     SUMMA_DOG        : REAL;
                     SUMMA_DOG_140    : REAL;
                  END;

          TItemList = class(TList)
                        procedure AddItem(Shifr:integer;Mode:TMode;Summa:Real);
                      end;

     TYPE
          PBRECItem=^TBRECItem;
          TBRECItem=RECORD
                  SHIFRROW : LONGINT;
                  SHIFRCOL : LONGINT;    { Группа }
                  SHIFRSTA : longint;
                  SHIFRINV : LongInt;    { 1 - если инвалид }
                  SUMMA    : REAL;
{                 CONSTRUCTOR INIT(NEWSHIFRROW:LONGINT;NEWSHIFRCOL:LONGINT;NEWSHIFRSTA:LONGINT;NEWSHIFRINV:LONGINT);}
               END;

          TBList=class(TList)
                    function AddBList(ShifrRow,ShifrCol,ShifrSta,ShifrInv:LongInt;Summa:real):boolean;
                  end;


{ ********************************************************** }
{ * Свод по счетам                             за 07.1997  * }
{ ********************************************************** }

function TBList.AddBList(ShifrRow,ShifrCol,ShifrSta,ShifrInv:LongInt;Summa:real):boolean;
 var I:Integer;
     Finded:boolean;
     BRec:PBRECItem;
 begin
      Result:=false;
      Finded:=false;
      if Self.Count>0 then
      for i:=1 to Self.Count do
          begin
               if PBRECItem(Self.Items[i-1])^.ShifrRow =ShifrRow then
               if PBRecItem(Self.Items[i-1])^.ShifrCol=ShifrCol then
               if PBRecItem(Self.Items[i-1])^.ShifrSta=ShifrSta then
               if PBRecItem(Self.Items[i-1])^.ShifrInv=ShifrInv then
                  begin
                        PBRecItem(Self.Items[i-1])^.Summa:=PBRecItem(Self.Items[i-1])^.Summa+Summa;
                        Result:=true;
                        Finded:=true;
                        break;
                  end;
          end;
      if not Finded then
         begin
              New(BRec);
              BRec^.SHIFRROW := ShifrRow;
              BRec^.SHIFRCol := ShifrCol;
              BRec^.SHIFRSta := ShifrSta;
              BRec^.SHIFRINV := ShifrInv;
              BRec^.Summa    := Summa;
              Self.Add(BRec);
         end;
 end;

procedure TItemList.AddItem(Shifr:integer;Mode:TMode;Summa:Real);
 var I:Integer;
     Finded:boolean;
     Rec:PRECITEM;
 begin
      Finded:=false;
      if Self.Count>0 then
      for i:=1 to Self.Count do
          begin
               if PRECITEM(Self.Items[i-1])^.Shifr =Shifr then
                  begin
                  case Mode of
                         POCHAS:PRECITEM(Self.Items[i-1])^.SUMMA_POCHAS_PPS :=
                                PRECITEM(Self.Items[i-1])^.SUMMA_POCHAS_PPS+Summa;
                            PPS:PRECITEM(Self.Items[i-1])^.SUMMA_PPS :=
                                PRECITEM(Self.Items[i-1])^.SUMMA_PPS+Summa;
                            UWP:PRECITEM(Self.Items[i-1])^.SUMMA_UWP :=
                                PRECITEM(Self.Items[i-1])^.SUMMA_UWP+Summa;
                            AUP:PRECITEM(Self.Items[i-1])^.SUMMA_AUP :=
                                PRECITEM(Self.Items[i-1])^.SUMMA_AUP+Summa;
                            AHP:PRECITEM(Self.Items[i-1])^.SUMMA_AHP :=
                                PRECITEM(Self.Items[i-1])^.SUMMA_AHP+Summa;
                            NIS:PRECITEM(Self.Items[i-1])^.SUMMA_NIS :=
                                PRECITEM(Self.Items[i-1])^.SUMMA_NIS+Summa;
                            OTH:PRECITEM(Self.Items[i-1])^.SUMMA_OTH :=
                                PRECITEM(Self.Items[i-1])^.SUMMA_OTH+Summa;
                            DOG:PRECITEM(Self.Items[i-1])^.SUMMA_DOG :=
                                PRECITEM(Self.Items[i-1])^.SUMMA_DOG+Summa;
                        DOG_140:PRECITEM(Self.Items[i-1])^.SUMMA_DOG_140 :=
                                PRECITEM(Self.Items[i-1])^.SUMMA_DOG_140+Summa;
                  end;
                  Finded:=true;
                  break;
                  end;
          end;
      if not Finded then
         begin
              New(Rec);
              FillChar(Rec^,SizeOf(Rec^),0);
              Rec^.SHIFR:=Shifr;
              case Mode of
                       POCHAS:Rec^.SUMMA_POCHAS_PPS :=
                              Rec^.SUMMA_POCHAS_PPS+Summa;
                          PPS:Rec^.SUMMA_PPS :=
                              Rec^.SUMMA_PPS+Summa;
                          UWP:Rec^.SUMMA_UWP :=
                              Rec^.SUMMA_UWP+Summa;
                          AUP:Rec^.SUMMA_AUP :=
                              Rec^.SUMMA_AUP+Summa;
                          AHP:Rec^.SUMMA_AHP :=
                              Rec^.SUMMA_AHP+Summa;
                          NIS:Rec^.SUMMA_NIS :=
                              Rec^.SUMMA_NIS+Summa;
                          OTH:Rec^.SUMMA_OTH :=
                              Rec^.SUMMA_OTH+Summa;
                          DOG:Rec^.SUMMA_DOG :=
                              Rec^.SUMMA_DOG+Summa;
                      DOG_140:Rec^.SUMMA_DOG_140 :=
                              Rec^.SUMMA_DOG_140+Summa;
                  end;
              Self.Add(Rec);
         end;

 end;

PROCEDURE LERA_SWOD(Mode:TLeraSwodMode;BolnMode:TBolnMode;Debug_Mode:boolean;NeedBoln:boolean);
VAR II:INTEGER;
    LONG,BB:INTEGER;
    NSRV_TEMP:INTEGER;
    NMES_TEMP:INTEGER;
    DEV:TEXT;
    DEVP:TEXT;
    List:TItemList;
    WANTED_SHIFR:INTEGER;
    SUMMA_POCHAS_PPS:REAL;
    SUMMA_PPS : REAL;
    SUMMA_AUP : REAL;
    SUMMA_AHP : REAL;
    SUMMA_UWP : REAL;
    SUMMA_NIS : REAL;
    SUMMA_OTH : REAL;
    SUMMA_DOG : REAL;
    SUMMA_DOG_140 : REAL;
    FNAME     : STRING;
    SummaPoch : real;
    SwodMode  : word;   { Свод по балансовым счетам }
    Summa11Tot:real;
    I_COUNT:Integer;
    BList:TBList;
    I_NSRV:Integer;
    I:Integer;
 PROCEDURE PRINTLINE(Rec:TRecItem);FAR;
  BEGIN
       WRITELN(DEV,':',COPY(GET_IST_NAME(REC.SHIFR)+SPACE(10),1,10)+':',
                    Rec.SUMMA_POCHAS_PPS:10:2,':',
                    Rec.SUMMA_PPS:10:2,':',
                    Rec.SUMMA_UWP:10:2,':',
                    Rec.SUMMA_AUP:10:2,':',
                    Rec.SUMMA_AHP:10:2,':',
                    Rec.SUMMA_NIS:10:2,':',
                    Rec.SUMMA_DOG:10:2,':',
                    Rec.SUMMA_DOG_140:10:2,':',
                    Rec.SUMMA_OTH:10:2,':',
                    Rec.SUMMA_POCHAS_PPS+
                    Rec.SUMMA_PPS+
                    Rec.SUMMA_UWP+
                    Rec.SUMMA_AUP+
                    Rec.SUMMA_AHP+
                    Rec.SUMMA_NIS+
                    Rec.SUMMA_DOG+
                    Rec.SUMMA_DOG_140+
                    Rec.SUMMA_OTH:10:2);
       SUMMA_POCHAS_PPS:=SUMMA_POCHAS_PPS+Rec.SUMMA_POCHAS_PPS;
       SUMMA_PPS:=SUMMA_PPS+Rec.SUMMA_PPS;
       SUMMA_UWP:=SUMMA_UWP+Rec.SUMMA_UWP;
       SUMMA_AUP:=SUMMA_AUP+Rec.SUMMA_AUP;
       SUMMA_AHP:=SUMMA_AHP+Rec.SUMMA_AHP;
       SUMMA_NIS:=SUMMA_NIS+Rec.SUMMA_NIS;
       SUMMA_OTH:=SUMMA_OTH+Rec.SUMMA_OTH;
       SUMMA_DOG:=SUMMA_DOG+Rec.SUMMA_DOG;
       SUMMA_DOG_140:=SUMMA_DOG_140+Rec.SUMMA_DOG_140;
  END;
procedure InsertIntoSQL(Shifr:integer;Summa:real;Tabno:integer;NSRV:integer;ShifrGru:integer;ShifrKat:integer;ShifrRow:integer;ShifrCol:integer);
 var S:String;
 begin
  //     Exit;
       S:='insert into test_add (SHIFR,SUMMA,TABNO,NSRV,SHIFRGRU,SHIFRKAT,ShifrRow,ShifrCol)';
       S:=S+' values ('+IntToStr(Shifr)+',';
       S:=S+FormatFloatPoint(Summa)+',';
       S:=S+IntToStr(Tabno)+',';
       S:=S+IntToStr(Nsrv)+',';
       S:=S+IntToStr(ShifrGru)+',';
       S:=S+IntToStr(ShifrKat)+',';
       S:=S+IntToStr(ShifrRow)+',';
       S:=S+IntToStr(ShifrCol)+')';
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add(S);
       FIB.pFIBTransactionSAL.StartTransAction;
       try
          FIB.pFIBQuery.ExecQuery;
       except
          ShowMessage('Ошибка вставки записи в FireBird');
       end;
       FIB.pFIBTransactionSAL.Commit;
 end;
procedure DeleteInSQL;
 var S:String;
 begin
     //  Exit;
       S:='delete from test_add';
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add(S);
       FIB.pFIBTransactionSAL.StartTransAction;
       try
          FIB.pFIBQuery.ExecQuery;
       except
          ShowMessage('Ошибка вставки записи в FireBird');
       end;
       FIB.pFIBTransactionSAL.Commit;
 end;

PROCEDURE MAKE_FOND_FOR_ALL;
 VAR CURR_PERSON  : PERSON_PTR;
     CURR_ADD     : ADD_PTR;
     Curr_Ud      : Ud_Ptr;
     SUMMA        : REAL;
     Summa_Pochas : Real;
     Rec          : PRecItem;
     JINDEX       : INTEGER;
     Need         : Boolean;
     BRec         : PBRecItem;
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
            if Curr_Person^.Gruppa=ChernobSchet then
               begin
                    Curr_Person:=Curr_Person^.NEXT;
                    Continue;
               end;

            if ((not NeedBoln) and (Get_Dol_Code(Curr_Person)=1500)) then
               begin
                    Curr_Person:=Curr_Person^.NEXT;
                    cONTINUE;
               end;
            if ((SWOD_MODE=INVALID_SWOD) AND is_invalid(Curr_Person)) OR
               ((SWOD_MODE=PENS_SWOD) AND is_pensioner(Curr_Person)) OR
               (SWOD_MODE=COMMON_SWOD) then
               BEGIN
            Need:=false;
            ShifrRow:=Curr_Person^.Kategorija;
            SHIFRINV:=0;
            if IS_INVALID(CURR_PERSON) THEN SHIFRINV:=1;
            if (Mode=Lera) then
                begin
                     if (pos('811',Get_Ist_Name(curr_person^.gruppa))>0) or
                         (pos('240',Get_Ist_Name(curr_person^.gruppa))>0) or
                         (pos('801МГ',Get_Ist_Name(curr_person^.gruppa))>0) 
                      then Need:=true
                end
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
                     if (Curr_Person^.tabno=1357) and
                        (NSRV=128) then
                     SummaPPSTemp  := 0 ;

                     WHILE CURR_ADD<>NIL DO
                           BEGIN
                               if Curr_Person^.Gruppa=11 then
                                  Summa11Tot:=Summa11Tot+Curr_Add^.Summa;
                               {   Добавление в свод  для мемориальных ордеров}
                               ShifrRow:=Curr_Person^.Gruppa;
                               case  Curr_Person^.Kategorija of
                                 1:ShifrCol:=1101;   { ППС  }
                                 2:ShifrCol:=1105;   { УВП }
                                 3:ShifrCol:=11061;  { Н С }
                               4,6:ShifrCol:=1104;   { АДМ ХОЗ }
                               5,7:ShifrCol:=1103;   { АУП }
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
                               if NSRV=140 then ShifrCol:=11063; { Договора подряда }
                               ShifrSta:=Curr_Add^.Shifr;
                               BList.AddBList(SHIFRROW,SHIFRCOL,ShifrSta,ShifrINV,Curr_Add^.Summa);
                               if ShifrRow=11 then SummaPPSTemp:=SummaPPSTemp+Curr_Add^.Summa;
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
                             if (Abs(Summa_Pochas)>0.001) and (CURR_PERSON^.KATEGORIJA<>TEACHER_KATEGORIJA) then
                                begin
                                     if Debug_Mode then
                                        ShowMessage('Почасовик не преподаватель 1 '+IntToStr(Nsrv)+' '+
                                                 IntToStr(Curr_Person^.Tabno))
                                end
                                                                                                            else
                             if (nsrv=98) OR (nsrv=128)                       then
                             if (CURR_PERSON^.KATEGORIJA<>TEACHER_KATEGORIJA) then
                                begin
                                     if Debug_Mode then
                                        ShowMessage('Почасовик не преподаватель 2 '+IntToStr(Nsrv)+' '+
                                              IntToStr(Curr_Person^.Tabno));
                                end;

                             if Curr_Person^.Gruppa=11 then
                                SummaPPSTemp1:=SummaPPSTemp1+summa;

                             IF (NSRV=81) and (Mode<>Dogovora) THEN
                                 begin
                                 List.AddItem(Curr_Person^.GRUPPA,DOG,Summa);
                                                        InsertIntoSQL(0,
                                                                      Summa,
                                                                      Curr_Person^.TABNO,
                                                                      NSRV,
                                                                      Curr_Person^.GRUPPA,
                                                                      Curr_Person^.Kategorija,
                                                                      0,0);
                                 end
                                        ELSE
                             IF (NSRV=140) and (Mode<>Dogovora) THEN
                                 begin
                                      List.AddItem(Curr_Person^.GRUPPA,DOG_140,Summa);
                                                        InsertIntoSQL(0,
                                                                      Summa,
                                                                      Curr_Person^.TABNO,
                                                                      NSRV,
                                                                      Curr_Person^.GRUPPA,
                                                                      Curr_Person^.Kategorija,
                                                                      0,0);
                                 end
                                        ELSE
                             CASE CURR_PERSON^.KATEGORIJA OF
                                 TEACHER_KATEGORIJA:                   { 98 и 119 это почасовка }
                                                    BEGIN
                                                        List.AddItem(Curr_Person^.GRUPPA,Pochas,Summa_Pochas);
                                                        InsertIntoSQL(0,
                                                                      Summa_Pochas,
                                                                      Curr_Person^.TABNO,
                                                                      NSRV,
                                                                      Curr_Person^.GRUPPA,
                                                                      Curr_Person^.Kategorija,
                                                                      0,0);

                                                     if (nsrv=98) {OR (nsrv=128)} then
                                                        begin
                                                        List.AddItem(Curr_Person^.GRUPPA,Pochas,Summa_Pochas);
                                                             InsertIntoSQL(0,
                                                                      Summa_Pochas,
                                                                      Curr_Person^.TABNO,
                                                                      NSRV,
                                                                      Curr_Person^.GRUPPA,
                                                                      Curr_Person^.Kategorija,
                                                                      0,0);
                                                        end
                                                                         else
                                                        begin
                                                        List.AddItem(Curr_Person^.GRUPPA,PPS,Summa);
                                                        InsertIntoSQL(0,
                                                                      Summa,
                                                                      Curr_Person^.TABNO,
                                                                      NSRV,
                                                                      Curr_Person^.GRUPPA,
                                                                      Curr_Person^.Kategorija,
                                                                      0,0);

                                                        end
                                                    END;
                                 UCH_WCPOM_KATEGORIJA:
                                              begin
                                              List.AddItem(Curr_Person^.GRUPPA,UWP,Summa);
                                              List.AddItem(Curr_Person^.GRUPPA,UWP,Summa_Pochas);
                                                        InsertIntoSQL(0,
                                                                      Summa+Summa_Pochas,                                                                      Curr_Person^.TABNO,
                                                                      NSRV,
                                                                      Curr_Person^.GRUPPA,
                                                                      Curr_Person^.Kategorija,
                                                                      0,0);
                                              end;
                                 AUP_BJUDGET_KATEGORIJA,
                                 AUP_NIS_KATEGORIJA:
                                               begin
                                              List.AddItem(Curr_Person^.GRUPPA,AUP,summa+Summa_Pochas);
                                                        InsertIntoSQL(0,
                                                                      Summa+Summa_Pochas,
                                                                      Curr_Person^.TABNO,
                                                                      NSRV,
                                                                      Curr_Person^.GRUPPA,
                                                                      Curr_Person^.Kategorija,
                                                                      0,0);
                                               end;
                                 ADM_HOZ_BJUDGET_KATEGORIJA,
                                 ADM_HOZ_NIS_KATEGORIJA:
                                               begin
                                              List.AddItem(Curr_Person^.GRUPPA,AHP,summa+Summa_Pochas);
                                                        InsertIntoSQL(0,
                                                                      Summa+Summa_Pochas,
                                                                      Curr_Person^.TABNO,
                                                                      NSRV,
                                                                      Curr_Person^.GRUPPA,
                                                                      Curr_Person^.Kategorija,
                                                                      0,0);
                                               end;
                                SCIENTIFIC_WORKER_KATEGORIJA:
                                               begin
                                              List.AddItem(Curr_Person^.GRUPPA,NIS,summa+Summa_Pochas);
                                                        InsertIntoSQL(0,
                                                                      Summa+Summa_Pochas,
                                                                      Curr_Person^.TABNO,
                                                                      NSRV,
                                                                      Curr_Person^.GRUPPA,
                                                                      Curr_Person^.Kategorija,
                                                                      0,0);
                                               end
                                    ELSE
                                              begin
                                              List.AddItem(Curr_Person^.GRUPPA,OTH,summa+Summa_Pochas);
                                                        InsertIntoSQL(0,
                                                                      Summa+Summa_Pochas,
                                                                      Curr_Person^.TABNO,
                                                                      NSRV,
                                                                      Curr_Person^.GRUPPA,
                                                                      Curr_Person^.Kategorija,
                                                                      0,0);
                                              end
                             END;

                             Printed:=false;

                             if ShifrRow=11 then
                                if abs(abs(SummaPPSTemp)-abs(SummaPPSTemp1))>0.01 then
                                   begin
                                        if Debug_Mode then
                                           ShowMessage('1 NSRV='+IntToStr(NSRV)+' TABNO='+inttostr(Curr_Person^.Tabno)+
                                                       ' 1='+FloatToStr(SummaPPSTemp)+' 2='+FloatToStr(SummaPPSTemp1));

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
                      BList.AddBList(SHIFRROW,SHIFRCOL,ShifrSta,ShifrINV,Curr_Ud^.Summa);
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
{
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
}
      I:=1;
      IF I=1 THEN BolnMode:=Total;
      IF I=2 THEN BolnMode:=WithOutBoln;
      IF I=3 THEN BolnMode:=BolnOnly;
      IF I=4 THEN BolnMode:=KassaOnly;
      Get_Boln_Mode:=true;
END;


PROCEDURE PRINTSWOD;
 VAR DEV:TEXT;
     FNAME:STRING;
     I:Integer;
     BRec:PBRECItem;
 PROCEDURE PrintItem;
  BEGIN
        WRITELN(DEV,BRec^.ShifrRow:5,
                    BRec^.ShifrCol:7,
                    BRec^.ShifrSta:7,
                    BRec^.Summa:12:2,
                    BRec^.ShifrInv:5,
                    0:5);
  END;
 BEGIN
      FName:=CDOC+'COUBALL.TXT';
      if Mode=Magis802 then FName:=CDOC+'COUBALM2.TXT';
      if Mode=Magis811 then FName:=CDOC+'COUBALM4.TXT';
      if Mode=Dogovora then FName:=CDOC+'COUBALD.TXT';
      ASSIGN(DEV,FNAME);
      REWRITE(DEV);
      if BList.Count>0 then
      for i:=1 to BList.Count do
          begin
               BRec:=PBRECItem(BList.Items[i-1]);
               PrintItem;
          end;
      Close(Dev);
 END;

function CompareGruppy(Item1, Item2: Pointer): Integer;
begin
  if PRECITEM(Item1)^.Shifr>PRECITEM(Item2)^.Shifr then result:=1
  else
  if PRECITEM(Item1)^.Shifr<PRECITEM(Item2)^.Shifr then result:=-1
  else result:=0;
end;


BEGIN
{    if not Get_Boln_Mode then Exit;    }
    if Mode=Magis802 then SwodMode:=5
                     else
    if Mode=Magis811 then SwodMode:=6
                     else
    if Mode=Dogovora then SwodMode:=7
                     else SwodMode:=4;
    if not get_Mem_par(SwodMode) then Exit;
    DeleteInSQL;
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
    while (HEAD_PERSON<>Nil) do DEL_PERSON(Head_Person);
    NMES_TEMP := NMES;
    LIST:=TItemLIST.Create;
    SUMMA_POCHAS_PPS := 0;
    SUMMA_PPS        := 0;
    SUMMA_AUP        := 0;
    SUMMA_AHP        := 0;
    SUMMA_UWP        := 0;
    SUMMA_NIS        := 0;
    SUMMA_OTH        := 0;
    SUMMA_DOG        := 0;
    SUMMA_DOG_140    := 0;
    SUMMA11TOT       := 0;
{
    assign(devp,'_pochas.txt');
    Rewrite(devp);
    SummaPoch:=0;
}
    BLIST:=TBLIST.Create;
    FormWait.Show;
    Application.ProcessMessages;

    FOR I_NSRV:=1 TO COUNT_SERV DO
        BEGIN
             NSRV:=I_NSRV;
             if NSRV>175 then
                NSRV:=I_NSRV;

             IF IS_SELECTED[NSRV] THEN
                BEGIN
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
        ShowMessage(FloatToStr(Summa11Tot));
        PRINTSWOD;
        BList.Free;
        FormWait.Hide;
        IF LIST.COUNT>0 THEN
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

      WRITELN(DEV,':-------------------------------------------------------------------------------------------------------------------------');
      WRITELN(DEV,':   Счет   :почасовка :   ППС    :   УВП    :   АУП    :   АХП    :Науч.сотр :Дог.подр. :Дог.подр. :Прочие    :  Всего   :');
      WRITELN(DEV,':          :  1102    :   1101   :   1105   :   1103   :   1104   :   1106   :   1106   :   1406   :   1107   :          :');
      WRITELN(DEV,':----------:----------:----------:----------:----------:----------:----------:----------:----------:----------:----------:');
                List.Sort(@CompareGruppy);
                for I:=1 to List.Count do
                    PrintLine(PRecItem(List.Items[i-1])^);
{                LIST^.FOREACH(@PRINTLINE);}
                 WRITELN(DEV,':----------:----------:----------:----------:----------:----------:----------:----------:----------:----------:');
                WRITELN(DEV,': Итого    :',SUMMA_POCHAS_PPS:10:2,':',SUMMA_PPS:10:2,':',SUMMA_UWP:10:2,
                            ':',SUMMA_AUP:10:2,':',SUMMA_AHP:10:2,':',SUMMA_NIS:10:2,':',SUMMA_DOG:10:2,':',SUMMA_DOG_140:10:2,':',SUMMA_OTH:10:2,':',
                            SUMMA_POCHAS_PPS+SUMMA_PPS+SUMMA_UWP+SUMMA_AUP+SUMMA_AHP+SUMMA_NIS+SUMMA_DOG+SUMMA_DOG_140+SUMMA_OTH:9:2);
                 WRITELN(DEV,':--------------------------------------------------------------------------------------------------------------');
                CLOSE(DEV);
                VIEW(FNAME);
           END;
        LIST.Free;
        NSRV:=NSRV_TEMP;
        NMES:=NMES_TEMP;
        MKFLNM;
        GETINF(NEED_NET_FOR_GETINF);
  END;

end.
