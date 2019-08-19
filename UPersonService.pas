unit UPersonService;

interface
         uses scrdef;
         procedure makePersonEntityFromPerson(curr_person:person_ptr);
         procedure moveAllPersonToList;

implementation
  uses uPersonEntity,uAddEntity,uUdEntity,uCnEntity,Dialogs,SysUtils,math;
  procedure makePersonEntityFromPerson(curr_person:person_ptr);
   var personEntity:TPersonEntity;
       i:integer;
       curr_add:add_ptr;
       curr_ud:ud_ptr;
       curr_cn:cn_ptr;
       curr_sowm:sowm_ptr;
       addEntity:TAddEntity;
       udEntity:TUdEntity;
       cnEntity:TCnEntity;
       sowmEntity:PInteger;
   begin
       personEntity:=TPersonEntity.Create;
       personEntity.tabno:=curr_person^.TABNO;
       personEntity.FIO:=curr_person^.FIO;
       personEntity.shifrGru:=curr_person^.GRUPPA;
       personEntity.shifrKat:=curr_person^.KATEGORIJA;
       personEntity.dolg            := Curr_PERSON^.DOLG;
       personEntity.oklad           := Curr_Person^.OKLAD;
       personEntity.widRaboty       := curr_person^.WID_RABOTY;
       personEntity.nTemy           := curr_person^.N_TEMY;
       personEntity.mestoOsnRaboty  := curr_person^.MESTO_OSN_RABOTY;
       personEntity.widOplaty       := curr_person^.WID_OPLATY;
       personEntity.mode            := curr_person^.MODE;
       personEntity.from            := curr_person^.FROM;
       personEntity.podoh           := curr_person^.PODOH;
       personEntity.malo            := curr_person^.MALO;
       personEntity.profsojuz       := curr_person^.PROFSOJUZ;
       personEntity.day             := curr_person^.DAY;
       personEntity.main            := curr_person^.MAIN;
//       move(curr_person^.TABEL,personEntity.tabel,sizeOf(personEntity.tabel))
//       personEntity.tabel           := curr_person^.TABEL;
       for i:=1 to 31 do
           personEntity.tabel[i]        := curr_person^.tabel[i];
       personEntity.state           := curr_person^.STATE;
       personEntity.automatic       := curr_person^.AUTOMATIC;
       personEntity.startDay        := curr_person^.START_DAY;
       personEntity.pens            := curr_person^.PENS;
       personEntity.bank            := curr_person^.BANK;
       personEntity.nalCode         := curr_person^.NAL_CODE;
       curr_add:=curr_person.add;
       while (curr_add<>nil) do
         begin
              addEntity:=TAddEntity.Create;
              addEntity.shifr:=curr_add^.SHIFR;
              addEntity.period:=curr_add^.PERIOD;
              addEntity.year:=curr_add^.year;
              addEntity.summa:=curr_add^.SUMMA;
              addEntity.FZP:=curr_add^.fzp;
              addEntity.FMP:=curr_add^.fmp;
              addEntity.other:=curr_add^.other;
              addEntity.vyplacheno:=curr_add^.VYPLACHENO;
              addEntity.who:=curr_add^.WHO;
              addEntity.workDay:=curr_add^.WORK_DAY;
              addEntity.workClock:=curr_add^.WORK_CLOCK;
              addEntity.count:=curr_add^.COUNT;
              personEntity.addList.Add(addEntity);
              curr_add:=curr_add^.NEXT;
         end;
       curr_ud:=curr_person.ud;
       while (curr_ud<>nil) do
         begin
              udEntity:=TUdEntity.Create;
              udEntity.shifr:=curr_ud^.SHIFR;
              udEntity.period:=curr_ud^.PERIOD;
              udEntity.year:=curr_ud^.year;
              udEntity.summa:=curr_ud^.SUMMA;
              udEntity.vyplacheno:=curr_ud^.VYPLACHENO;
              udEntity.who:=curr_ud^.WHO;
              udEntity.count:=curr_ud^.COUNT;
              personEntity.udList.Add(udEntity);
              curr_ud:=curr_ud^.NEXT;
         end;
       curr_cn:=curr_person.cn;
       while (curr_cn<>nil) do
         begin
              cnEntity:=TCnEntity.Create;
              cnEntity.shifr:=curr_cn^.SHIFR;
              cnEntity.kod:=curr_cn^.KOD;
              cnEntity.summa:=curr_cn^.SUMMA;
              cnEntity.prim:=curr_cn^.prim;
              cnEntity.prim_1:=curr_cn^.prim_1;
              cnEntity.dejaCounted:=curr_cn^.DEJA_COUNTED;
              cnEntity.limitSumma:=curr_cn^.LIMIT_SUMMA;
              cnEntity.automatic:=curr_cn^.AUTOMATIC;
              cnEntity.id:=curr_cn^.id;
              cnEntity.count:=curr_cn^.COUNT;
              personEntity.cnList.Add(cnEntity);
              curr_cn:=curr_cn^.NEXT;
         end;
       curr_sowm:=curr_person.sowm;
       while (curr_sowm<>nil) do
         begin
              new(sowmEntity);
              sowmEntity^:=curr_sowm^.where;
              personEntity.sowmList.Add(sowmEntity);
              curr_sowm:=curr_sowm^.NEXT;
         end;
       personList.add(personEntity)
   end;
 function getSummaAdd(personEntity:TPersonEntity):real;
  var summa:real;
      i:integer;
  begin
       summa:=0;
       if personEntity.addList.count>0 then
          for i:=0 to personEntity.addList.count-1 do
              begin
                   summa:=roundTo(summa+roundTo(TAddEntity(personEntity.addList.items[i]).summa,-2),-2);
              end;
       getSummaAdd:=summa;
  end;
 function getSummaUd(personEntity:TPersonEntity):real;
  var summa:real;
      i:integer;
  begin
       summa:=0;
       if personEntity.udList.count>0 then
          for i:=0 to personEntity.udList.count-1 do
              begin
                   summa:=roundTo(summa+roundTo(TudEntity(personEntity.udList.items[i]).summa,-2),-2);
              end;
       getSummaUd:=summa;
  end;
 procedure moveAllPersonToList;
  var curr_person:person_ptr;
      i:integer;
  begin
              curr_person:=head_person;
              while (curr_person<>nil) do
                begin
                     makePersonEntityFromPerson(curr_person);
                     curr_person:=curr_person^.next;
                end;
     showMessage('count_person_in list='+intToStr(Personlist.count));
     if personList.count>0 then
        for i:=0 to personList.Count-1 do
            begin
                 showMessage('fio='+TPersonEntity(personList.Items[i]).FIO+' начислено='+floatToStr(getSummaAdd(TPersonEntity(personList.Items[i])))+' удержано='+floatToStr(getSummaUd(TPersonEntity(personList.Items[i]))));
            end;
  end;

end.
