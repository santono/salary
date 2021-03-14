unit ScrECBService;

interface
//{$IFDEF  SVDN}
    uses ScrECB,ScrDef,classes;
    type pRecAdd=^TRecAdd;
         TRecAdd=record
                   shifr   : Integer;
                   period  : Integer;
                   year    : Integer;
                   summa   : Real;
                   workDay : integer;
                   marked : Boolean;
                 end;
    type TPersonRec6Service=class
          private
           listAdd:TList;
           curr_person:PERSON_PTR;
           procedure deleteRec6CNRecs;
           function fillIllPerson:Boolean;
           function fillOtpPerson:Boolean;
           function fillDPPerson:Boolean;
           function fillPremPerson:Boolean;
           function fillPochasPerson:Boolean;
           function fillOsnPerson:Boolean;
           function fillSowmPerson:Boolean;
           function existsZO(ZO:Integer;payTp:Integer=0;payYear:Integer=0;payMnth:Integer=0):Boolean;
//           function addZO(ZO:Integer;payTp:Integer=0;payYear:Integer=0;payMnth:Integer=0;otk:Integer=1;kdNp:Integer=0):Boolean;
           function addZO(ZO:Integer;payTp:Integer=0;payYear:Integer=0;payMnth:Integer=0;otk:Integer=1;kdNp:Integer=0;Exp:integer=0;nrc:Integer=0; KDPTV:Integer=0):Boolean;
           function countNotMarked:Integer;

          public
           constructor init(newCurrPerson:PERSON_PTR);
           destructor free;
           procedure fillRec6Person;
         end;
//{$ENDIF}
implementation
//{$IFDEF  SVDN}

  uses ScrUtil, SysUtils;
  constructor TPersonRec6Service.init(newCurrPerson:PERSON_PTR);
    var curr_add:ADD_PTR;
        recAdd:pRecAdd;
    begin
         Self.curr_person:=newCurrPerson;
         listAdd:=TList.Create;
         curr_add:=curr_person^.ADD;
         while (curr_add<>nil) do
           begin
                New(recAdd);
                recAdd.shifr   := curr_add^.SHIFR;
                recAdd.period  := curr_add^.PERIOD;
                recAdd.year    := curr_add^.YEAR+1990;
                recAdd.summa   := curr_add^.summa;
                recAdd.workDay := curr_add^.WORK_DAY;
                recAdd.marked  := False;
                listAdd.Add(recAdd);
                curr_add:=curr_add^.NEXT;
           end;
    end;

  destructor TPersonRec6Service.free;
    var i:Integer;
    begin
         if listAdd.Count>0 then
            for i:=0 to listAdd.Count-1 do
              begin
                Dispose(pRecAdd(listAdd.Items[i]));
              end;
         listAdd.Free;
         listAdd:=nil;
    //     inherited free;
    end;

  function TPersonRec6Service.countNotMarked:Integer;
   var
      retVal:Integer;
      i:Integer;
   begin
      retVal:=0;
      if listAdd.Count>0 then
         for i:=0 to listAdd.Count-1 do
             if not pRecAdd(listAdd.Items[i]).marked then
                Inc(retVal);
      countNotMarked:=retVal;
   end;
  procedure TPersonRec6Service.deleteRec6CNRecs;
    var curr_cn : CN_PTR;
        done    : Boolean;
    begin
         while True do
           begin
                done:=True;
                curr_cn:=curr_person^.CN;
                while (curr_cn<>nil) do
                  begin
                       if curr_cn^.shifr=REC6CN_SHIFR+limit_cn_base then
                          begin
                               DEL_CN(curr_cn,curr_person);
                               done:=False;
                               Break;
                          end;
                       curr_cn:=curr_cn^.next;
                  end;
                if done then Break;
           end;
    end;

  function TPersonRec6Service.addZO(ZO:Integer;payTp:Integer=0;payYear:Integer=0;payMnth:Integer=0;otk:Integer=1;kdNp:Integer=0;Exp:integer=0;NRC:Integer=0; KDPTV:Integer=0):Boolean;
    var curr_cn:CN_PTR;
        PersonRec6:TPersonRec6;
    begin
         personRec6:=TPersonRec6.Init;
         personRec6.setZo(ZO);
         personRec6.setPayTp(payTp);
         personRec6.setPayYear(payYear);
         personRec6.setPayMnth(payMnth);
         personRec6.setOtk(otk);
         personRec6.setExp(exp);
         personRec6.setKdNp(kdNp);
         PersonRec6.setNrc(Nrc);
         PersonRec6.setKdPtv(kdptv);
         if ZO in [25,32] then
            personRec6.setExp(1);

         MAKE_CN(curr_cn,curr_person);
         curr_cn^.SHIFR:=REC6CN_SHIFR+LIMIT_CN_BASE;
         curr_cn^.KOD:=100;
         curr_cn^.PRIM_1:=personRec6.packRec6;
    end;
  function TPersonRec6Service.existsZO(ZO:Integer;payTp:Integer=0;payYear:Integer=0;payMnth:Integer=0):Boolean;
        var curr_cn:CN_PTR;
            finded:Boolean;
            PersonRec6:TPersonRec6;
        begin
            finded:=False;
            curr_cn:=curr_person^.CN;
            while (curr_cn<>nil) do
              begin
                   if curr_cn^.shifr=rec6cn_shifr+LIMIT_CN_BASE then
                      begin
                           PersonRec6:=TPersonRec6.CreateFromCN(curr_cn^.PRIM_1);
                           if (PersonRec6.getZo=ZO)
                          and (PersonRec6.getPayTp=payTp)
                          and (PersonRec6.getPayYear=payYear)
                          and (PersonRec6.getPayMnth=payMnth)
                           then
                              begin
                                   finded:=True;
                                   PersonRec6.Free;
                                   Break;
                              end;
                           PersonRec6.Free;
                      end;
                   curr_cn:=curr_cn^.Next;
              end;
            existsZO:=finded;

        end;


  function TPersonRec6Service.fillIllPerson:Boolean;
    var i,shifr,y,m:integer;
        retVal:boolean;
        zo,exp,nrc:Integer;
        shifrWr,otk,kdNp:Integer;
    begin
        retVal:=False;
        exp:=0;
        nrc:=0;
        if countNotMarked<1 then
           begin
                fillIllPerson:=false;
                Exit;
           end;
        if DOG_POD_PODRAZD(NSRV) or
           (NSRV in [82,102,104,105,121]) then
           begin
                fillIllPerson:=false;
                Exit;
           end;
        for i:=0 to listAdd.Count-1 do
           begin
             if pRecAdd(listAdd.Items[i]).marked then continue;
             shifr:=pRecAdd(listAdd.Items[i]).SHIFR;
             y:=pRecAdd(listAdd.Items[i]).year;
             m:=pRecAdd(listAdd.Items[i]).period;
//             shifrWr:= getShifrWrForBoln(curr_person^.TABNO,curr_add^.summa,curr_add^.YEAR,curr_add^.period);

             if (shifr in [BOL_5_SHIFR,BOL_TEK_SHIFR,BOL_PROSHL_SHIFR]) then
                begin
                     zo:=29;   // Больничный
                     if isSciPedForSwod(curr_Person) then
                        if IS_OSN_WID_RABOTY(curr_Person) then
                           zo:=32; //Научный больничный
                     if IS_INVALID(curr_person) then
                        zo:=36;  //Больничный инвалида;
                     if zo=32 then
                        Exp:=1;
                     if not existsZO(zo,10,y,m) then
                        begin
                            otk:=1;
                            shifrWr := getShifrWrForBoln(curr_person^.TABNO,pRecAdd(listAdd.Items[i]).summa,y-1990,m);
                            if shifrWr=2 then
                               begin
                                    otk:=0;
                                    nrc:=1;
                               end;
                            kdNp:=0;
                            if ((pRecAdd(listAdd.Items[i]).workDay>0) and (pRecAdd(listAdd.Items[i]).workDay<32)) then
                              kdNp:=pRecAdd(listAdd.Items[i]).workDay;
//                            addZO(ZO,10,y,m,otk,kdNp);
                           //       PayTp PayYear PayMnth otk   kdNp    Exp  NRC, KDPTV
                            addZO(ZO, 0  ,   y   ,   m   ,otk,  kdNp  , exp, nrc,  0  );

                        end;
                     pRecAdd(listAdd.Items[i]).marked:=True;
                end;
           end;
        if countNotMarked>0 then
           retVal:=True;
        fillIllPerson:=retVal;

    end;
  function TPersonRec6Service.fillOtpPerson:Boolean;
    var i,shifr,y,m:integer;
        retVal:boolean;
        zo,exp:Integer;
        shifrWr,otk,kdNp,nrc:Integer;
    function getZOForOtp:integer;
      var retVal:integer;
      begin
           retVal:=1;
           exp:=0;
           if isSciPedForSwod(curr_Person) then
              if IS_OSN_WID_RABOTY(curr_Person) then
                 retVal:=25;
//              else
//             if not isSciPedOsnInList(curr_person^.tabno) then
//                 retVal:=1;
           getZOForOtp:=retVal;
      end;

    begin
        retVal:=False;
        nrc:=0;
        if countNotMarked<1 then
           begin
                fillOtpPerson:=false;
                Exit;
           end;
        if DOG_POD_PODRAZD(NSRV) or
           (NSRV in [82,102,104,105,121]) then
           begin
                fillOtpPerson:=false;
                Exit;
           end;

        for i:=0 to listAdd.Count-1 do
           begin
             if pRecAdd(listAdd.Items[i]).marked then continue;
             shifr:=pRecAdd(listAdd.Items[i]).SHIFR;
             y:=pRecAdd(listAdd.Items[i]).year;
             m:=pRecAdd(listAdd.Items[i]).period;
             if IsOtpShifr(SHIFR) then
                begin
                     zo:=getZOForOtp;
                     if zo=25 then
                        exp:=1;
                     if not existsZO(zo,10,y,m) then
                        begin
                            otk:=1;
//                            shifrWr := getShifrWrForBoln(curr_person^.TABNO,pRecAdd(listAdd.Items[i]).summa,y-1990,m);
                            if IS_OSN_WID_RABOTY(curr_person) then
                               shifrwr:=1
                            else
                               shifrwr:=2;
                            if shifrWr=2 then
                               begin
                                    otk:=0;
                                    nrc:=1;
                               end;
                            kdNp:=0;
//                            if ((pRecAdd(listAdd.Items[i]).workDay>0) and (pRecAdd(listAdd.Items[i]).workDay<32)) then
//                              kdNp:=pRecAdd(listAdd.Items[i]).workDay;
//                            addZO(ZO,10,y,m,otk,kdNp);
                           //       PayTp PayYear PayMnth otk  kbNp  Exp  NRC KDPtv
                            addZO(ZO, 10  ,   y   ,   m   ,otk,  0  , 0,   0,   0);
                        end;
                     pRecAdd(listAdd.Items[i]).marked:=True;
                end;
           end;
        if countNotMarked>0 then
           retVal:=True;
        fillOtpPerson:=retVal;

    end;

  function TPersonRec6Service.fillDPPerson:Boolean;
    var i,shifr:integer;
        retVal:boolean;
        zo:Integer;
        otk:Integer;
    begin
        retVal:=False;
        if countNotMarked=0 then
           begin
                fillDPPerson:=false;
                Exit;
           end;
        if not DOG_POD_PODRAZD(NSRV) then Exit;   
        for i:=0 to listAdd.Count-1 do
           begin
             if pRecAdd(listAdd.Items[i]).marked then continue;
             shifr:=pRecAdd(listAdd.Items[i]).SHIFR;
         //    if not (shifr in [BOL_5_SHIFR,BOL_TEK_SHIFR,BOL_PROSHL_SHIFR]) then
             if not (IsBolnShifrLera(shifr)
                      or
                      IsOtpShifr(shifr)
                      or
                      (shifr=KASSA_SHIFR)
                      or
                      (shifr=31)  // Мат помощь облагаемая
                      or
                      (shifr=dekret_shifr)
                      or
                      (shifr=141) // Мат помощь не облагаемая
                    )
                then

                begin
                     zo:=26;   // Договор подряда
                     if not existsZO(zo) then
                        begin
                            otk:=1;
                            if curr_Person.mesto_osn_raboty in [82,121] then
                               otk:=0;
//                            addZO(ZO);
                           //       PayTp PayYear PayMnth otk kbNp  Exp  NRC KDPTV
                            addZO(ZO, 0  ,   0   ,   0   ,otk,  0  , 0,   0, 0);
                        end;
                     pRecAdd(listAdd.Items[i]).marked:=True;
                end;
           end;
        if countNotMarked>0 then
           retVal:=True;
        fillDPPerson:=retVal;

    end;

  function TPersonRec6Service.fillPochasPerson:Boolean;
    var i,shifr:integer;
        retVal:boolean;
        zo:Integer;
        otk:Integer;
    begin
        retVal:=False;
        if countNotMarked=0 then
           begin
                fillPochasPerson:=false;
                Exit;
           end;
        if DOG_POD_PODRAZD(NSRV) or
           (NSRV in [81,82,102,104,105,121])  then
           begin
                fillPochasPerson:=false;
                Exit;
           end;

        for i:=0 to listAdd.Count-1 do
           begin
             if pRecAdd(listAdd.Items[i]).marked then continue;
             shifr:=pRecAdd(listAdd.Items[i]).SHIFR;
         //    if not (shifr in [BOL_5_SHIFR,BOL_TEK_SHIFR,BOL_PROSHL_SHIFR]) then
             if shifr=pochas_shifr then
                begin
                     zo:=26;   // Договор подряда
                     if not existsZO(zo) then
                        begin
                            otk:=1;
                            if curr_Person.mesto_osn_raboty=82 then
                               otk:=0;
//                            addZO(ZO);
                           //       PayTp PayYear PayMnth otk kbNp  Exp  NRC KDPTV
                            addZO(ZO, 0  ,   0   ,   0   ,otk,  0  , 0,   0,   0);
                        end;
                     pRecAdd(listAdd.Items[i]).marked:=True;
                end;
           end;
        if countNotMarked>0 then
           retVal:=True;
        fillPochasPerson:=retVal;

    end;


  function TPersonRec6Service.fillPremPerson:Boolean;
    var i,shifr:integer;
        retVal:boolean;
        zo:Integer;
        otk,exp:Integer;
    begin
        retVal:=False;
        otk:=0;
        Exp:=0;
        if countNotMarked=0 then
           begin
                fillPremPerson:=false;
                Exit;
           end;
        if DOG_POD_PODRAZD(NSRV) OR
           (NSRV in [82,105,104,121]) then
           begin
                fillPremPerson:=false;
                Exit;
           end;
        if not nsrv in [11,102] then
           begin
                fillPremPerson:=false;
                Exit;
           end;
        for i:=0 to listAdd.Count-1 do
           begin
             if pRecAdd(listAdd.Items[i]).marked then continue;
             shifr:=pRecAdd(listAdd.Items[i]).SHIFR;
             if not (IsBolnShifrLera(shifr)
                      or
                      IsOtpShifr(shifr)
                      or
                      (shifr=KASSA_SHIFR)
                      or
                      (shifr=31)  // Мат помощь облагаемая
                      or
                      (shifr=dekret_shifr)
                      or
                      (shifr=141) // Мат помощь не облагаемая
                    )
                then
                begin
                     zo:=1;
                     if isSciPedForSwod(curr_Person) then
                        if IS_OSN_WID_RABOTY(curr_Person) then
                           zo:=25; //Научный больничный
                     if zo=25 then
                        Exp:=1;
                     if not existsZO(zo) then
                        begin
                            otk:=1;
                            if curr_Person.mesto_osn_raboty in [82,121] then
                               otk:=0;
             //               addZO(ZO);
                           //       PayTp PayYear PayMnth otk kbNp  Exp  NRC KDPTV
                            addZO(ZO, 0  ,   0   ,   0   ,otk,  0  , Exp, 0, 0);

                        end;
                     pRecAdd(listAdd.Items[i]).marked:=True;
                end;
           end;
        if countNotMarked>0 then
           retVal:=True;
        fillPremPerson:=retVal;

    end;

  function TPersonRec6Service.fillOsnPerson:Boolean;
    var i,shifr:integer;
        retVal:boolean;
        zo:Integer;
        otk:Integer;
        exp:Integer;
        kdPtv:Integer;
        dt:TDateTime;
    begin
        dt:=encodeDate(CURRYEAR,NMES,1);
        kdPtv:=LenMonth(dt);
        retVal := False;
        otk    := 0;
        Exp    := 0;
        if countNotMarked=0 then
           begin
                fillOsnPerson:=false;
                Exit;
           end;
        if DOG_POD_PODRAZD(NSRV) or
           (NSRV in [82,102,104,105,121]) then
           begin
                fillOsnPerson:=false;
                Exit;
           end;
        if not IS_OSN_WID_RABOTY(Curr_Person) then Exit;
        for i:=0 to listAdd.Count-1 do
           begin
             if pRecAdd(listAdd.Items[i]).marked then continue;
             shifr:=pRecAdd(listAdd.Items[i]).SHIFR;
             if not (IsBolnShifrLera(shifr)
                      or
                      IsOtpShifr(shifr)
                      or
                      (shifr=KASSA_SHIFR)
                      or
                      (shifr=31)  // Мат помощь облагаемая
                      or
                      (shifr=dekret_shifr)
                      or
                      (shifr=141) // Мат помощь не облагаемая
                      or
                      (shifr=pochas_shifr)
                      or
                      (shifr=dogPodShifr)
                    )
                then
                begin
                     zo:=1;
                     if isSciPedForSwod(curr_Person) then
                        if IS_OSN_WID_RABOTY(curr_Person) then
                           zo:=25; //Научный
                     if zo=25 then
                        Exp:=1;
                     if not existsZO(zo) then
                        begin
                            otk:=1;
                            if curr_Person.mesto_osn_raboty=82 then
                               otk:=0;
                  //          addZO(ZO:Integer;payTp:Integer=0;payYear:Integer=0;payMnth:Integer=0;otk:Integer=1;kdNp:Integer=0;Exp:integer=0):Boolean;
                             //       PayTp PayYear PayMnth otk kbNp  Exp  NRC  KDPTV
                              addZO(ZO, 0  ,   0   ,   0   ,otk,  0  , Exp, 0,  KDPTV);

                  //          addZO(ZO);
                        end;
                     pRecAdd(listAdd.Items[i]).marked:=True;
                end;
           end;
        if countNotMarked>0 then
           retVal:=True;
        fillOsnPerson:=retVal;

    end;
  function TPersonRec6Service.fillSowmPerson:Boolean;
    var i,shifr:integer;
        retVal:boolean;
        zo:Integer;
        otk:Integer;
    begin
        retVal:=False;
        if countNotMarked=0 then
           begin
                fillSowmPerson:=false;
                Exit;
           end;
        if DOG_POD_PODRAZD(NSRV) or
           (NSRV in [82,102,104,105,121]) then
           begin
                fillSowmPerson:=false;
                Exit;
           end;
        if IS_OSN_WID_RABOTY(Curr_Person) then Exit;
        for i:=0 to listAdd.Count-1 do
           begin
             if pRecAdd(listAdd.Items[i]).marked then continue;
             shifr:=pRecAdd(listAdd.Items[i]).SHIFR;
             if not (IsBolnShifrLera(shifr)
                      or
                      IsOtpShifr(shifr)
                      or
                      (shifr=KASSA_SHIFR)
                      or
                      (shifr=31)  // Мат помощь облагаемая
                      or
                      (shifr=dekret_shifr)
                      or
                      (shifr=141) // Мат помощь не облагаемая
                      or
                      (shifr=pochas_shifr)
                      or
                      (shifr=dogPodShifr)
                    )
                then
                begin
                     zo:=1;
//                     if isSciPedForSwod(curr_Person) then
//                        if IS_OSN_WID_RABOTY(curr_Person) then
//                           zo:=25; //Научный
                     if not existsZO(zo) then
                        begin
//                            otk:=1;
//                            if curr_Person.mesto_osn_raboty=82 then
                            otk:=0;
                  //          addZO(ZO);
                           //       PayTp PayYear PayMnth otk kbNp  Exp  NRC KDPTV
                            addZO(ZO, 0  ,   0   ,   0   ,otk,  0  , 0,   1,   0);
                        end;
                     pRecAdd(listAdd.Items[i]).marked:=True;
                end;
           end;
        if countNotMarked>0 then
           retVal:=True;
        fillSowmPerson:=retVal;

    end;


  procedure TPersonRec6Service.fillRec6Person;
    begin
         if curr_person^.add=nil then Exit;
         deleteRec6CNRecs;
         if NSRV in [82,121] then Exit;
         if DOG_POD_PODRAZD(nsrv) then
            fillDPPerson
         else
         if nsrv in [11,102] then
            fillPremPerson
         else
           begin
            if fillIllPerson then
            if fillOtpPerson then
            if fillPochasPerson then
            if fillOsnPerson then
               fillSowmPerson;

           end;
    end;
//{$ENDIF}
end.
