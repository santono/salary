unit ScrESV;

interface
{$IFDEF  SVDN}
  type
   TPersonRec6=class
          ukrGromad : integer;
          st       : integer;   // 1- муж 0 жен 1
          zo       : integer;   //  1- обычныий
                                //  2 - инвалид - обычный
                                // 25 - научный стаж
                                // 32 - научный больничный
                                // 26 - договора подр€да

                                // 29 - больничный
                                // 36 - больничный инвалид
                                // 42 - декретный
                                // 43 - декретныый - инвалидов
          payTp    : integer;   //  0 - зарплата (PayTP - не указываетс€)
                                // 10 - отпускные  (zo=1 или 25 или инвалиды)
                                // 13 - разница между мин зп и зп работника
                                //      nbg 13 относитс€ к начислени€ в текущем мес€це в том числе за прошлые периоды
          payMnth  : integer;
          payYear  : integer;
          otk      : integer;    // “рудова книжка 1 - у работодател€
          exp      : integer;    // 1 наличие спецстажа
          kdNp     : integer;    // ƒней нетрудоспособности
          kdNzp    : integer;    // ќтпуск без сохранени€ з п
          kdPtv    : integer;    // ƒней продолжени€ трудовых отношений
          nrm      : integer;
          kdVp     : integer;    // ƒней декретных
          nrc      : integer;    // Ќеполное рабочее врем€
       public
          constructor Init;
          constructor CreateFromCN(S:string);
          function getUkrGromad: Integer;
          function getst       : integer;   // 1- муж 0 жен 1
          function getZo       : integer;   //  1- обычныий
          function getPayTp    : integer;   //  0 - зарплата (PayTP - не указываетс€)
                                // 10 - отпускные  (zo=1 или 25 или инвалиды)
                                // 13 - разница между мин зп и зп работника
                                //      nbg 13 относитс€ к начислени€ в текущем мес€це в том числе за прошлые периоды
          function getPayMnth  : integer;
          function getPayYear  : integer;
          function getOtk      : integer;    // “рудова книжка 1 - у работодател€
          function getExp      : integer;    // 1 наличие спецстажа
          function getKdNp     : integer;    // ƒней нетрудоспособности
          function getKdNzp    : integer;    // ќтпуск без сохранени€ з п
          function getKdPtv    : integer;    // ƒней продолжени€ трудовых отношений
          function getNrm      : integer;
          function getKdVp     : integer;    // ƒней декретных
          function getNrc      : integer;    // Ќеполное рабочее врем€
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

     end;
(*
                // “аблица ZO дл€ таблицы 5
                // 1 Ц найман≥ прац≥вники з трудовою книжкою;
                // 2 Ц найман≥ прац≥вники (без трудовоњ книжки);
                // 3 Ц особи, €к≥ виконують роботи за договорами цив≥льно-правового характеру;
                // 4 Ц особи, €ким надано в≥дпустку по догл€ду за дитиною в≥д трир≥чного в≥ку до дос€гненн€ нею шестир≥чного в≥ку;
                // 5 Ц особи, €ким надано в≥дпустку по ваг≥тност≥ ≥ пологах;
                // 6 Ц особи, €ким надано в≥дпустку по догл€ду за дитиною до дос€гненн€ нею трир≥чного в≥ку.

*)
{$ENDIF}
implementation
{$IFDEF  SVDN}
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
   function TPersonRec6.getPayTp    : integer;   //  0 - зарплата (PayTP - не указываетс€)
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
   function TPersonRec6.getOtk      : integer;    // “рудова книжка 1 - у работодател€
     begin
          getOtk:=self.otk;
     end;
   function TPersonRec6.getExp      : integer;    // 1 наличие спецстажа
     begin
          getExp:=self.exp;
     end;
   function TPersonRec6.getKdNp     : integer;    // ƒней нетрудоспособности
     begin
          getKdNp:=self.kdNp;
     end;
   function TPersonRec6.getKdNzp    : integer;    // ќтпуск без сохранени€ з п
     begin
          getKdNzp:=self.kdNzp;
     end;
   function TPersonRec6.getKdPtv    : integer;    // ƒней продолжени€ трудовых отношений
     begin
          getKdPtv:=self.kdPtv;
     end;
   function TPersonRec6.getNrm      : integer;
     begin
          getNrm:=self.nrm;
     end;
   function TPersonRec6.getKdVp     : integer;    // ƒней декретных
     begin
          getKdVp:=self.kdVp;
     end;
   function TPersonRec6.getNrc      : integer;    // Ќеполное рабочее врем€
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


{$ENDIF}

end.
