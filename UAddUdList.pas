unit UAddUdList;

interface
     uses classes,scrdef;
     type pRec=^TRec;
     tRec=record
              tabno:integer;
              shifrsta:integer;
              shifrkat:integer;
              shifrgru:integer;
              shifrpod:integer;
              summa:real;
              y:integer;
              m:integer;
             end;
      TTestListClass=class
                     private
                      listSwod:TList;
                      dev:Text;
                      fname:string;
                      public
                      constructor init;
                      destructor Done;
                      procedure addAddRec(curr_add:add_ptr;curr_person:person_ptr);
                      function findAddRec(curr_Add:Add_ptr;curr_person:person_ptr):boolean;
                      procedure addUdRec(curr_ud:ud_ptr;curr_person:person_ptr);
                      function findUdRec(curr_ud:ud_ptr;curr_person:person_ptr):boolean;
                      function errLineToSwod(rec:pRec):string;
                      function errLineToMemAdd(curr_Add:add_ptr;curr_person:person_ptr):string;
                      function errLineToMemUd(curr_Ud:ud_ptr;curr_person:person_ptr):string;
                      procedure putAllSwodLinesToLog;
                      function getListCount:integer;
                    end;
    var
      TestListClass:TTestListClass;

implementation
 uses SysUtils,scrUtil;
 constructor TTestListClass.init;
  begin
       listSwod:=TList.Create;
       fname:=cdoc+'cmpSwodMem.log';
       assignFile(dev,fname);
       rewrite(dev);
  end;
 destructor TTestListClass.Done;
  var i:integer;
  begin
       putAllSwodLinesToLog;
       closeFile(dev);
       if not Assigned(listSwod) then exit;
       if listSwod.Count>0 then
          for i:=0 to listSwod.Count-1 do
              dispose(pRec(listSwod.Items[i]));
       listSwod.Free;
       listSwod:=nil;
  end;
 procedure TTestListClass.addAddRec(curr_add:add_ptr;curr_person:person_ptr);
  var rec:pRec;
  begin
       new(rec);
       rec.tabno:=curr_person.TABNO;
       rec.shifrsta:=curr_add.SHIFR;
       rec.shifrkat:=curr_person^.KATEGORIJA;
       rec.shifrgru:=curr_person^.GRUPPA;
       rec.shifrpod:=nsrv;
       rec.summa:=curr_add^.summa;
       rec.y:=curr_add^.YEAR+1990;
       rec.m:=curr_add^.PERIOD;
       listSwod.Add(rec);
  end;
 function TTestListClass.findAddRec(curr_add:add_ptr;curr_person:person_ptr):boolean;
   var rec:pRec;
       finded:boolean;
       i:integer;
  begin
       finded:=false;
       if listSwod.count>0 then
          for i:=0 to listSwod.Count-1 do
              begin
                   rec := pRec(listSwod.Items[i]);
                   if (
                       (rec.tabno=curr_person.TABNO)
                       and (rec.shifrsta=curr_add.SHIFR)
                       and (rec.shifrkat=curr_person^.KATEGORIJA)
                       and (rec.shifrgru=curr_person^.GRUPPA)
                       and (rec.shifrpod=nsrv)
                       and (abs(abs(rec.summa)-abs(curr_add^.summa))<0.011)
                       and (rec.y=(curr_add^.YEAR+1990))
                       and (rec.m=curr_add^.PERIOD)
                      ) then
                      begin
                           listSwod.Remove(rec);
                           finded:=true;
                           break;
                      end;
              end;
       if not finded then
          writeln(dev,errLineToMemAdd(curr_add,curr_person));

       findAddRec:=finded;
  end;
 procedure TTestListClass.addUdRec(curr_Ud:ud_ptr;curr_person:person_ptr);
  var rec:pRec;
  begin
       new(rec);
       rec.tabno:=curr_person.TABNO;
       rec.shifrsta:=curr_ud.SHIFR;
       rec.shifrkat:=curr_person^.KATEGORIJA;
       rec.shifrgru:=curr_person^.GRUPPA;
       rec.shifrpod:=nsrv;
       rec.summa:=curr_ud^.summa;
       rec.y:=curr_ud^.YEAR+1990;
       rec.m:=curr_ud^.PERIOD;
       listSwod.Add(rec);
  end;
 function TTestListClass.findUdRec(curr_ud:ud_ptr;curr_person:person_ptr):boolean;
   var rec:pRec;
       finded:boolean;
       i:integer;
  begin
       finded:=false;
       if listSwod.count>0 then
          for i:=0 to listSwod.Count-1 do
              begin
                   rec := pRec(listSwod.Items[i]);
                   if (
                       (rec.tabno=curr_person.TABNO)
                       and (rec.shifrsta=curr_ud.SHIFR)
                       and (rec.shifrkat=curr_person^.KATEGORIJA)
                       and (rec.shifrgru=curr_person^.GRUPPA)
                       and (rec.shifrpod=nsrv)
                       and (abs(abs(rec.summa)-abs(curr_ud^.summa))<0.011)
                       and (rec.y=(curr_ud^.YEAR+1990))
                       and (rec.m=curr_ud^.PERIOD)
                      ) then
                      begin
                           listSwod.Remove(rec);
                           finded:=true;
                           break;
                      end;
              end;
       if not finded then
          writeln(dev,errLineToMemUd(curr_ud,curr_person));
       findUdRec:=finded;
  end;

function TTestListClass.errLineToSwod(rec:pRec):string;
  var retVal:string;
  begin
       retVal:='Есть в своде ';
       retVal:=retVal+intToStr(rec^.tabno)+' '+trim(GetFullRusFioPerson(rec^.tabno))+' Подразделение '+intToStr(rec^.shifrPod);
       retVal:=retVal+' Статья '+intToStr(rec^.shifrsta)+' Сумма '+trim(FORMAT_K(rec^.summa,12));
       errLineToSwod:=retVal;
  end;

  function TTestListClass.errLineToMemAdd(curr_Add:add_ptr;curr_person:person_ptr):string;
  var retVal:string;
  begin
       retVal:='Есть в ордере ';
       retVal:=retVal+intToStr(curr_person^.tabno)+' '+trim(curr_person^.FIO)+' Подразделение '+intToStr(nsrv);
       retVal:=retVal+' Статья '+intToStr(curr_add^.SHIFR)+' Сумма '+trim(FORMAT_K(curr_add^.summa,12));
       errLineToMemAdd:=retVal;
  end;
  function TTestListClass.errLineToMemUd(curr_Ud:ud_ptr;curr_person:person_ptr):string;
  var retVal:string;
  begin
       retVal:='Есть в ордере ';
       retVal:=retVal+' т.н. '+intToStr(curr_person^.tabno)+' '+trim(curr_person^.FIO)+' Подразделение '+intToStr(nsrv);
       retVal:=retVal+' Статья '+intToStr(curr_ud^.SHIFR)+' Сумма '+trim(FORMAT_K(curr_ud^.summa,12));
       errLineToMemUd:=retVal;
  end;
  procedure TTestListClass.putAllSwodLinesToLog;
    var i:integer;

  begin
       if listSwod.Count>0 then
       for i:=0 to listSwod.Count-1 do
           begin
                writeln(dev,errLineToSwod(pRec(listSwod.items[i])));
           end;
  end;

function TTestListClass.getListCount:integer;
 begin
      getListCount:=listSwod.count;
 end;
end.
