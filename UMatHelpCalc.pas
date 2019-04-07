unit UMatHelpCalc;

interface
 uses ScrDef;
 procedure calculatePodAndWSForMatHelp(curr_person:person_ptr;m:integer;y:integer);
implementation
 uses scrnalog,scrutil,Usqlunit, Variants,sysutils;
 procedure calculatePodAndWSForMatHelp(curr_person:person_ptr;m:integer;y:integer);
  var summaAdd,summaUd,summaUdWs,summaUdRas,summaUdRazn,summaUdWsRas,summaUdWsRazn:real;
      curr_add:add_ptr;
      curr_ud:ud_ptr;
      SQLStmnt:string;
      v:variant;
  begin
       if nsrv<>106 then exit;
       REPEAT
       UNTIL NOT (DEL_WANTED_UD(PODOH_SHIFR, CURR_PERSON, m));
       REPEAT
       UNTIL NOT (DEL_WANTED_UD(war_sbor_SHIFR, CURR_PERSON, M));

       summaAdd:=0;
       curr_add:=curr_person^.add;
       while (curr_add<>nil) do
         begin
              summaAdd:=summaAdd+curr_add^.summa;
              curr_add:=curr_add^.next;
         end;
       summaUd:=0;
       summaUdWs:=0;
       curr_ud:=curr_person^.ud;
       while (curr_ud<>nil) do
         begin
              if curr_ud^.year+1990=y then
              if curr_ud^.shifr=podoh_shifr then
                 summaUd:=summaUd+curr_Ud^.summa
              else
              if curr_ud^.shifr=war_sbor_shifr then
                 summaUdWs:=summaUdWs+curr_Ud^.summa;
              curr_Ud:=curr_Ud^.next;
         end;
       SQLStmnt:='select summa from fadd where tabno='+intToStr(Curr_Person^.tabno)+' and year_vy='+intToStr(y)+' and w_place=106 and month_vy<'+intToStr(m);
       v:=SQLQueryValue(SQLStmnt);
       if VarIsNumeric(v) then
          summaAdd:=summaAdd+v;
       SQLStmnt:='select summa from fud where shifrsta='+intToStr(Podoh_SHIFR)+' and tabno='+intToStr(Curr_Person^.tabno)+' and year_vy='+intToStr(y)+' and w_place=106 and month_vy<'+intToStr(m);
       v:=SQLQueryValue(SQLStmnt);
       if VarIsNumeric(v) then
          summaUd:=summaUd+v;
       SQLStmnt:='select summa from fud where shifrsta='+intToStr(WAR_SBOR_SHIFR)+' and tabno='+intToStr(Curr_Person^.tabno)+' and year_vy='+intToStr(y)+' and w_place=106 and month_vy<'+intToStr(m);
       v:=SQLQueryValue(SQLStmnt);
       if VarIsNumeric(v) then
          summaUdWS:=summaUdWS+v;
       summaUdRas:=getPodForMatHelpSumma(SummaAdd,M,Y,Curr_Person);
       summaUdWsRas:=getWsForMatHelpSumma(SummaAdd,M,Y,Curr_Person);
       summaUdRazn:=summaUdRas-summaUd;
       summaUdWsRazn:=summaUdWsRas-summaUdWs;
       if abs(summaUdRazn)>0.01 then
          begin
               make_ud(curr_ud,curr_person);
               curr_ud^.SHIFR:=podoh_shifr;
               curr_ud^.SUMMA:=r10(summaUdRazn);
               curr_ud^.PERIOD:=m;
               curr_ud^.YEAR:=y-1990;
          end;
       if abs(summaUdWsRazn)>0.01 then
          begin
               make_ud(curr_ud,curr_person);
               curr_ud^.SHIFR:=war_sbor_shifr;
               curr_ud^.SUMMA:=r10(summaUdWsRazn);
               curr_ud^.PERIOD:=m;
               curr_ud^.YEAR:=y-1990;
          end;
  end;

end.
