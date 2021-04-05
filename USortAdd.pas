unit USortAdd;

interface
 uses Classes,ScrDef;
  type

       PRecSortAdd=^TRecSortAdd;
       TRecSortAdd=record
                    ShifrId  : Integer;
                    ShifrSta : Integer;
                    Period   : Integer;
                    Year     : Integer;
                    Summa    : Real;
                    InCn     : Boolean;
                    Blocked  : Integer;
                    Who      : Integer;
                   end;

       TSortedAddList=Class
                    List:TList;
                    public
                    constructor Init(Curr_Person:Person_Ptr);
                    procedure RestoreOrderAddList(Curr_Person:PERSON_PTR);
                    destructor Done;
                  end;
  var SortedAddList:TSortedAddList;
implementation
  uses ScrUtil;
  constructor TSortedAddList.Init(Curr_Person:Person_Ptr);
     var Rec:PRecSortAdd;
         Curr_Add:ADD_PTR;
     function isInCn(Curr_Person:PERSON_PTR;Curr_Add:ADD_PTR):Boolean;
      var Curr_Cn:CN_PTR;
          RetVal:Boolean;
      begin
           RetVal:=false;
           Curr_Cn:=Curr_Person^.CN;
           while (Curr_Cn<>Nil) do
            begin
                 if Curr_Cn^.Shifr=Curr_Add^.SHIFR then
                 if Curr_Cn^.AUTOMATIC=AUTOMATIC_MODE then
                    begin
                         RetVal:=True;
                         break;
                    end;
                 Curr_Cn:=Curr_Cn^.Next;
            end;
           isInCN:=RetVal;
      end;
     begin
          Randomize;
          List:=TList.Create;
          Curr_Add:=Curr_Person^.ADD;
          while (Curr_Add<>NIl) do
           begin
                New(Rec);
                Rec.ShifrId  := Random(30000)+1000;
                Rec.ShifrSta := Curr_Add.SHIFR;
                Rec.Period   := Curr_Add^.PERIOD;
                Rec.Blocked  := Curr_Add^.VYPLACHENO;
                Rec.Summa    := Curr_Add^.SUMMA;
                Rec.InCn     := isInCN(Curr_Person,Curr_Add);
                Rec.Who      := Curr_Add^.Who;
                if ((Curr_Add^.WORK_DAY=0) or
                   (Curr_Add^.Shifr in [PRAZDN_SHIFR,NIGHT_Shifr,POCHAS_SHIFR])) then
                   Curr_Add^.WORK_DAY:=Rec.ShifrId
                else if ((Abs(Curr_Add^.WORK_Clock)<0.01)
                         and not(Curr_Add^.Shifr  in [PRAZDN_SHIFR,POCHAS_SHIFR,NIGHT_SHIFR])) then
                   Curr_Add^.WORK_Clock:=Rec.ShifrId;
                List.Add(Rec);
                Curr_Add:=Curr_Add^.Next;
           end;
     end;


  destructor TSortedAddList.Done;
   var i:Integer;
   begin
        if List.Count>0 then
           for i:=0 to List.Count-1 do
               Dispose(PRecSortAdd(List.Items[i]));
        List.Free;
        List:=Nil;
   end;

 procedure TSortedAddList.RestoreOrderAddList(Curr_Person:PERSON_PTR);
   var Tmp_Person:Person_Ptr;
       Curr_Add:Add_Ptr;
       C_Add:Add_Ptr;
       i,i_a:Integer;
       Finded : Boolean;
    function MatchAddRec(Curr_Add:Add_Ptr;Rec:PRecSortAdd):Boolean;
     var RetVal:Boolean;
         tmpInt:Integer;
     begin
          RetVal:=False;
          if Rec.ShifrId>0 then
             begin
                  if (Curr_Add^.WORK_DAY=Rec.ShifrId) then
                      begin
                           RetVal:=True;
                           Curr_Add^.WORK_DAY:=0;
                      end
                  else
                      begin
                           tmpInt:=Round(Curr_Add^.WORK_CLOCK);
                           if (tmpInt=Rec.ShifrId) then
                              begin
                                   RetVal:=True;
                                   Curr_Add^.WORK_CLOCK:=0;
                              end
                      end;
                  if RetVal then
                     if Abs(Abs(Rec.Summa)-abs(Curr_Add^.Summa))>0.01 then
                        RetVal:=false;
             end;
          MatchAddRec:=RetVal;
     end;

   begin
        try
           if not Assigned(List) then Exit;
        except   
        else
            Exit;
        end;
        if List.Count<=0 then Exit;
        if Count_Add(Curr_Person)<>List.Count then Exit;
        Tmp_Person:=new(Person_Ptr);
        Move(Curr_Person^,Tmp_Person^,SizeOf(Curr_Person^));
        Tmp_Person^.ADD:=nil;
        Tmp_Person^.UD:=nil;
        Tmp_Person^.Sowm:=nil;
        Tmp_Person^.CN:=nil;
        Tmp_Person^.Tabno:=100;
        Tmp_Person^.FIO:='Test';
        for i:=0 to List.Count-1 do
            begin
                 Finded:=false;
                 curr_Add:=Curr_Person^.ADD;
                 i_a:=count_Add(Curr_Person);
                 while (Curr_Add<>Nil) do
                   begin
                        if(
                           (MatchAddRec(Curr_Add,PRecSortAdd(List.Items[i])))
                           ) then
                           begin
                                Finded:=True;
                                Break;
                           end;
                        Curr_Add:=Curr_Add^.NEXT;
                   end;
                 if not Finded then
                    begin
                         i_a:=count_Add(Curr_Person);
                         Curr_Add:=Curr_Person^.Add;
                         while (Curr_Add<>Nil) do
                            begin
                                if (
                                    (Curr_Add.Shifr=PRecSortAdd(List.Items[i]).ShifrSta)
                                and (Curr_Add.Period=PRecSortAdd(List.Items[i]).Period)
                                and (Curr_Add.Vyplacheno=PRecSortAdd(List.Items[i]).Blocked)
                                and (
                                     (
                                      (PRecSortAdd(List.Items[i]).InCn) and
                                      (PRecSortAdd(List.Items[i]).Who=Curr_Add^.Who)
                                     ) or
                                     (
                                       (PRecSortAdd(List.Items[i]).InCn=False) and
                                       (Abs(Abs(Curr_Add^.Summa)-
                                           abs(PRecSortAdd(List.Items[i]).Summa))<0.01)
                                      )
                                     ) 
                                   )
                                then
                                    begin
                                         Finded:=True;
                                         Break;
                                    end;
                                Curr_Add:=Curr_Add^.NEXT;
                            end;
                    end;
                 if finded then
                    begin
                         MAKE_ADD(C_Add,Tmp_Person);
                         Move(Curr_Add^,C_Add^,SizeOf(C_Add^));
                         if (C_Add^.SHIFR in [POCHAS_SHIFR,PRAZDN_SHIFR,NIGHT_SHIFR]) then
                            C_Add^.WORK_DAY:=0
                         else
                         if (C_Add^.WORK_DAY>31) then C_Add^.WORK_DAY:=0
                         else
                         if ((C_Add^.WORK_DAY>0) and
                              (C_Add^.WORK_CLOCK>0)) then
                            if C_Add^.WORK_CLOCK>8*30 then
                               C_Add^.WORK_CLOCK:=0
                            else
                         else
                            if C_Add^.WORK_CLOCK>8*30 then
                               C_Add^.WORK_CLOCK:=0;
                         if (
                             (C_Add^.Shifr=Pochas_Shifr) and
                             (C_Add^.Work_Clock>8*30)
                            ) then
                            C_Add^.Work_Clock:=0;

                         C_Add.NEXT:=nil;
                    end;
            end;
        if COUNT_Add(Tmp_Person)=COUNT_ADD(Curr_Person) then
           begin
                while (Curr_Person.Add<>Nil) do
                 DEL_ADD(Curr_Person.Add,Curr_Person);
                Curr_Person.Add:=Tmp_Person.Add;
           end
        else
           while (Tmp_Person.Add<>Nil) do
             DEL_ADD(Tmp_Person.Add,Tmp_Person);
        Dispose(Tmp_Person);

   end;

end.
