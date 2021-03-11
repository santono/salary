unit ScrECB;

interface
{$IFDEF  SVDN}
  uses ScrDef;
  type
   TPersonRec6=class
          ukrGromad : integer;
          st       : integer;   // 1- муж 0 жен 1
          zo       : integer;   //  1- обычныий
                                //  2 - инвалид - обычный
                                // 25 - научный стаж
                                // 32 - научный больничный
                                // 26 - договора подряда

                                // 29 - больничный
                                // 36 - больничный инвалид
                                // 42 - декретный
                                // 43 - декретныый - инвалидов
          payTp    : integer;   //  0 - зарплата (PayTP - не указывается)
                                // 10 - отпускные  (zo=1 или 25 или инвалиды)
                                // 13 - разница между мин зп и зп работника
                                //      nbg 13 относится к начисления в текущем месяце в том числе за прошлые периоды
          payMnth  : integer;
          payYear  : integer;
          otk      : integer;    // Трудова книжка 1 - у работодателя
          exp      : integer;    // 1 наличие спецстажа
          kdNp     : integer;    // Дней нетрудоспособности
          kdNzp    : integer;    // Отпуск без сохранения з п
          kdPtv    : integer;    // Дней продолжения трудовых отношений
          nrm      : integer;
          kdVp     : integer;    // Дней декретных
          nrc      : integer;    // Неполное рабочее время
       public
          constructor Init;
          constructor CreateFromCN(S:string);
          function getUkrGromad: Integer;
          function getst       : integer;   // 1- муж 0 жен 1
          function getZo       : integer;   //  1- обычныий
          function getPayTp    : integer;   //  0 - зарплата (PayTP - не указывается)
                                // 10 - отпускные  (zo=1 или 25 или инвалиды)
                                // 13 - разница между мин зп и зп работника
                                //      nbg 13 относится к начисления в текущем месяце в том числе за прошлые периоды
          function getPayMnth  : integer;
          function getPayYear  : integer;
          function getOtk      : integer;    // Трудова книжка 1 - у работодателя
          function getExp      : integer;    // 1 наличие спецстажа
          function getKdNp     : integer;    // Дней нетрудоспособности
          function getKdNzp    : integer;    // Отпуск без сохранения з п
          function getKdPtv    : integer;    // Дней продолжения трудовых отношений
          function getNrm      : integer;
          function getKdVp     : integer;    // Дней декретных
          function getNrc      : integer;    // Неполное рабочее время
          procedure setUkrGromad(newUkrGromad:integer);
          procedure setst(newSt: integer);
          procedure setZo(newZo: integer);
          procedure setPayTp(newPayTp: integer);
          procedure setPayMnth(newPayMnth : integer);
          procedure setPayYear(newPayYear :integer);
          procedure setOtk(newOtk     : integer);
          procedure setExp(newExp     : integer);
          procedure setKdNp(newKdNp   : integer);
          procedure setKdNzp(newKdNzp : integer);
          procedure setKdPtv(newKdPtv : integer);
          procedure setNrm(newNrm     : integer);
          procedure setKdVp(newKdVp   : integer);
          procedure setNrc(newNrc     : integer);
          function packRec6:string;
          procedure unPackRec6(s:string);
          function getShortNameForCn:string;
     end;

(*
                // Таблица ZO для таблицы 5
                // 1 – наймані працівники з трудовою книжкою;
                // 2 – наймані працівники (без трудової книжки);
                // 3 – особи, які виконують роботи за договорами цивільно-правового характеру;
                // 4 – особи, яким надано відпустку по догляду за дитиною від трирічного віку до досягнення нею шестирічного віку;
                // 5 – особи, яким надано відпустку по вагітності і пологах;
                // 6 – особи, яким надано відпустку по догляду за дитиною до досягнення нею трирічного віку.

*)
 const lenZO6=9;
 const lenPayTp=3;
 const zo6Items:array[1..lenZO6] of string=(
  ' 1 - звичайний','2 - iнвалiд - звичайний',
  '25 - науковець','26 - договора пiдряда',
  '29 - лiкарняний','32 - iнвалiд науковець',
  '36 - лiкарняний iнвалiд','42 - декрет',
  '43 - декрет - iнвалiд');
 const zo6ShortItems:array[1..lenZO6] of string=(
  ' 1 - звичайний','2 - iнвалiд',
  '25 - науковець','26 - дог.пiдр.',
  '29 - лiкарнян.','32 - iнв.наук',
  '36 - iнв.лiкарн.','42 - декрет',
  '43 - iнв.декрет');
 const zo6ItemsNo:array[1..lenZO6] of integer=(
  1,2,25,26,29,32,36,42,43);
 const PayTpItems:array[1..lenPayTp] of string=(
  ' 0 - зарплата (PayTP - не указывается)',
  '10 - отпускные',
  '13 - разница между мин зп и зп работника'
 );
 const PayTpNo:array[1..lenPayTp] of integer=(
  0,10,13);

// Таблица 5
  type
   TPersonRec5=class
          ukrGromad : integer;
          shifrid   : Integer;
          periodY   : INTEGER;
          periodM   : INTEGER;
          STARTDT   : Integer;
          ENDDT     : Integer;
          ZO        : INTEGER;
          PIDZV     : string; //150 Підстава припинення трудових відносин
          NRMDT     :  TDATETime;
          DOGCPH    : Integer; //Договір ЦПХ за основним місцем роботи або
                               // за сумісництвом (1 – так, 0 – ні)
          PNR       : string;  //Професійна назва роботи
          ZKPP      : string;  // 5 Код классификатора профессий
          PROF      : string; //8  Код класифікатора професій
          POS       : string; //250
          PID       : string; //250
          VZV       : string; //250
          VS        : Integer; //Внутрішній сумісник
                               //(числове значення: 1 - так, 0 - ні)
          PIR       : Integer; //Переведено, признач. на ін. посаду або
                               //роботу, переміщ. до інш. підрозд.
                               //(числове значення: 1 - так, 0 - ні)
          curr_cn   : cn_ptr;
        public
          constructor createFromCN(curr_cn:cn_ptr);
          procedure packToCn;
          procedure unPackFromCn;

    end;
(*
    Коды ЗО lkz nf,kbws 5
    1 – наймані працівники з трудовою книжкою;
    2 – наймані працівники (без трудової книжки);
    3 – особи, які виконують роботи за договорами цивільно-правового характеру;
    4 – особи, яким надано відпустку по догляду за дитиною від трирічного віку до досягнення нею шестирічного віку;
    5 – особи, яким надано відпустку по вагітності і пологах;
    6 – особи, яким надано відпустку по догляду за дитиною до досягнення нею трирічного віку.

*)


{$ENDIF}
implementation
{$IFDEF  SVDN}
   uses SysUtils,ScrUtil;
   constructor TPersonRec6.Init;
     begin
          ukrGromad :=1;
          st       := 1;   
          zo       := 1;
          payTp    := 0;
          payMnth  := 0;
          payYear  := 0;
          otk      := 1;
          exp      := 0;
          kdNp     := 0;
          kdNzp    := 0;
          kdPtv    := 0;
          nrm      := 0;
          kdVp     := 0;
          nrc      := 0;
     end;
   constructor TPersonRec6.CreateFromCN(S:string);
     begin
          self.unPackRec6(s);
     end;
   function TPersonRec6.getUkrGromad: Integer;
     begin
          getUkrGromad:=self.ukrGromad;
     end;
   function TPersonRec6.getSt       : integer;   // 1- муж 0 жен 1
     begin
          getSt:=self.st;
     end;
   function TPersonRec6.getZo       : integer;   //  1- обычныий
     begin
          getZo:=self.zo;
     end;
   function TPersonRec6.getPayTp    : integer;   //  0 - зарплата (PayTP - не указывается)
     begin
          getPayTp:=self.payTp;
     end;
   function TPersonRec6.getPayMnth  : integer;
     begin
          getPayMnth:=self.payMnth;
     end;
   function TPersonRec6.getPayYear  : integer;
     begin
          getPayYear:=self.payYear;
     end;
   function TPersonRec6.getOtk      : integer;    // Трудова книжка 1 - у работодателя
     begin
          getOtk:=self.otk;
     end;
   function TPersonRec6.getExp      : integer;    // 1 наличие спецстажа
     begin
          getExp:=self.exp;
     end;
   function TPersonRec6.getKdNp     : integer;    // Дней нетрудоспособности
     begin
          getKdNp:=self.kdNp;
     end;
   function TPersonRec6.getKdNzp    : integer;    // Отпуск без сохранения з п
     begin
          getKdNzp:=self.kdNzp;
     end;
   function TPersonRec6.getKdPtv    : integer;    // Дней продолжения трудовых отношений
     begin
          getKdPtv:=self.kdPtv;
     end;
   function TPersonRec6.getNrm      : integer;
     begin
          getNrm:=self.nrm;
     end;
   function TPersonRec6.getKdVp     : integer;    // Дней декретных
     begin
          getKdVp:=self.kdVp;
     end;
   function TPersonRec6.getNrc      : integer;    // Неполное рабочее время
     begin
          getNrc:=self.nrc;
     end;
   procedure TPersonRec6.setUkrGromad(newUkrGromad:integer);
     begin
          self.ukrGromad:=newUkrGromad;
     end;
   procedure TPersonRec6.setSt(newSt: integer);
     begin
          self.st:=newSt;
     end;
   procedure TPersonRec6.setZo(newZo: integer);
     begin
          self.zo:=newZo;
     end;
   procedure TPersonRec6.setPayTp(newPayTp: integer);
     begin
          self.payTp:=newPayTp;
     end;
   procedure TPersonRec6.setPayMnth(newPayMnth : integer);
     begin
          self.payMnth:=newPayMnth;
     end;
   procedure TPersonRec6.setPayYear(newPayYear : integer);
     begin
          self.payYear:=newPayYear;
     end;
   procedure TPersonRec6.setOtk(newOtk     : integer);
     begin
          self.otk:=newOtk;
     end;
   procedure TPersonRec6.setExp(newExp     : integer);
     begin
          self.exp:=newExp;
     end;
   procedure TPersonRec6.setKdNp(newKdNp   : integer);
     begin
          self.kdNp:=newKdNp;
     end;
   procedure TPersonRec6.setKdNzp(newKdNzp : integer);
     begin
          self.kdNzp:=newKdNzp;
     end;
   procedure TPersonRec6.setKdPtv(newKdPtv : integer);
     begin
          self.kdPtv:=newKdPtv;
     end;
   procedure TPersonRec6.setNrm(newNrm     : integer);
     begin
          self.nrm:=newNrm;
     end;
   procedure TPersonRec6.setKdVp(newKdVp   : integer);
     begin
          self.kdVp:=newKdVp;
     end;
   procedure TPersonRec6.setNrc(newNrc     : integer);
     begin
          self.nrc:=newNrc;
     end;

   function TPersonRec6.packRec6:string;
     var s:string;
         ukrGromadS , stS      , zoS      ,
         payTpS     , payMnthS , payYearS ,
         otkS       , expS     , kdNpS    ,
         kdNzpS     , kdPtvS   , nrmS     ,
         kdVpS      , nrcS     : String ;
     begin
          Str(ukrGromad:1,ukrGromadS);
          Str(st:1,stS);
          Str(zo:2,zoS);
          Str(payTp:2,payTpS);
          Str(payMnth:2,payMnthS);
          Str(payYear:4,payYearS);
          Str(otk:1, otkS);
          Str(exp:1, expS);
          Str(kdNp:2, kdNpS);
          Str(kdNzp:2, kdNzpS);
          Str(kdPtv:2, kdPtvS);
          Str(nrm:2,nrmS);
          Str(kdVp:2, kdVpS);
          Str(nrc:1, nrcS);
          s:= ukrGromadS + stS      + zoS      +
              payTpS     + payMnthS + payYearS +
              otkS       + expS     + kdNpS    +
              kdNzpS     + kdPtvS   + nrmS     +
              kdVpS      + nrcS;
           packRec6:=s;
     end;

procedure TPersonRec6.unPackRec6(s:string);
     var
         ukrGromadS , stS      , zoS      ,
         payTpS     , payMnthS , payYearS ,
         otkS       , expS     , kdNpS    ,
         kdNzpS     , kdPtvS   , nrmS     ,
         kdVpS      , nrcS     : String ;
         b,iErr:Integer;
    begin
         b:=1;
         ukrGromadS:=Copy(s,b,1);
         b:=b+1;
         stS       :=Copy(s,b,1);
         b:=b+1;
         zoS:=Copy(s,b,2);
         b:=b+2;
         payTpS:=copy(s,b,2);
         b:=b+2;
         payMnthS:=Copy(s,b,2);
         b:=b+2;
         payYearS:=Copy(S,b,4);
         b:=b+4;
         otkS:=Copy(s,b,1);
         b:=b+1;
         expS:=Copy(s,b,1);
         b:=b+1;
         kdNpS:=Copy(s,b,2);
         b:=b+2;
         kdNzpS:=Copy(s,b,2);
         b:=b+2;
         kdPtvS:=Copy(s,b,2);
         b:=b+2;
         nrmS:=Copy(s,b,2);
         b:=b+2;
         kdVpS:=Copy(s,b,2);
         b:=b+2;
         nrcS:=Copy(s,b,1);
         Val(ukrGromadS,ukrGromad,iErr);
         Val(stS,st,iErr);
         Val(zoS,zo,iErr);
         Val(payTpS,payTp,iErr);
         Val(payMnthS,payMnth,iErr);
         Val(payYearS,payYear,iErr);
         Val(otkS,otk,iErr);
         Val(expS, exp,iErr);
         Val(kdNpS, kdNp,iErr );
         Val(kdNzpS, kdNzp,iErr);
         Val(kdPtvS, kdPtv,iErr);
         Val(nrmS,nrm,iErr);
         Val(kdVpS,kdVp,iErr);
         Val(nrcS,nrc,iErr);

    end;

function TPersonRec6.getShortNameForCn:string;
  var retVal:string;
      finded:Boolean;
      i:Integer;
  begin
       retVal:='';
       finded:=false;
       for i:=1 to lenZO6 do
           if Self.zo=zo6ItemsNo[i] then
              begin
                   finded:=true;
                   Break;
              end;
       if finded then
          retVal:=trim(zo6ShortItems[i]);
       if payTp=10 then
          retVal:=retVal+' вiдпустка'
       else
       if payTp=13 then
          retVal:=retVal+' lдопл.до мiн';

       getShortNameForCn:=retVal;
  end;

// Таблица 5
 constructor TPersonRec5.createFromCN(curr_cn:cn_ptr);
  begin
       Self.Create;
       Self.curr_cn:=curr_cn;
       Self.shifrid:=curr_cn^.PRIM;

  end;
 procedure TPersonRec5.packToCn;
  var s:string;
      ukrGromadS , zoS      , SHIFRIDs ,
      periodYS   , periodMS , startDtS ,
      endDtS     , dogCPHS  , ZKPPS    ,
      PROFS      , vsS      ,
      pirs       : String ;
  begin
      Str(ukrGromad:1,ukrGromadS);
      Str(zo:1,zoS);
      Str(shifrid:10,shifrIdS);
      Str(periodY:4,periodYS);
      Str(periodM:4,periodMS);
      Str(startDt:2,startDtS);
      Str(endDt:2,endDtS);
      Str(dogCPH:1,dogCPHS);
      Str(vs:1, vss);
      Str(PIR:1, pirS);
      ZKPPS:=Copy(ZKPP+space(10),1,5);
      PROFS:=Copy(PROF+space(10),1,8);
      s:= ukrGromadS + zoS      + shifrIdS +
          periodYS   + periodMS + startDtS +
          endDtS     + dogCPHS  + vss      +    
          pirs       + ZKPPS    + PROFS;
      curr_cn^.prim_1:=S;

  end;
 procedure TPersonRec5.unPackFromCn;
  var s:string;
      b:Integer;
      ukrGromadS , zoS      , SHIFRIDs ,
      periodYS   , periodMS , startDtS ,
      endDtS     , dogCPHS  , ZKPPS    ,
      PROFS      , vsS      ,
      pirs       : String ;
      iVal,iErr:Integer;
  begin
      s:=Curr_cn^.PRIM_1;
      b:=1;
      ukrGromads:=Copy(s,b,1);
      b:=b+1;
      zoS:=Copy(s,b,1);
      b:=b+1;
      shifrIdS:=Copy(s,b,10);
      b:=b+10;
      periodYS:=Copy(s,b,4);
      b:=b+4;
      periodMS:=Copy(s,b,4);
      b:=b+4;
      startDtS:=Copy(s,b,2);
      b:=b+2;
      endDtS:=Copy(s,b,2);
      b:=b+2;
      dogCPHS:=Copy(s,b,1);
      b:=b+1;
      vss:=Copy(s,b,1);
      b:=b+1;
      pirs:=Copy(s,b,1);
      b:=b+1;
      ZKPPS:=Copy(s,b,5);
      b:=b+5;
      PROFS:=Copy(s,b,8);
      Val(ukrGromads,Ival,iErr);
      if iErr=0 then
         ukrGromad:=iVal;
      Val(zoS,Ival,iErr);
      if iErr=0 then
         zo:=iVal;
      Val(periodYS,Ival,iErr);
      if iErr=0 then
         periodY:=iVal;
      Val(periodMS,Ival,iErr);
      if iErr=0 then
         periodM:=iVal;
      Val(startdtS,Ival,iErr);
      if iErr=0 then
         startdt:=iVal;
      Val(enddtS,Ival,iErr);
      if iErr=0 then
         enddt:=iVal;
      Val(dogCPHS,Ival,iErr);
      if iErr=0 then
         dogCPH:=iVal;
      Val(vss,Ival,iErr);
      if iErr=0 then
         vs:=iVal;
      Val(pirs,Ival,iErr);
      if iErr=0 then
         pir:=Ival;
      zkpp:=Trim(zkpps);
      prof:=Trim(profs);

  end;

{$ENDIF}

end.
