unit UDuplTest;

interface
  uses ScrDef;
  function IsPersonDup(Curr_Person:Person_Ptr;Action:boolean;Comment:string):Boolean;
  procedure TestDuplPodr(Comment:string);
implementation
  uses Classes,ScrUtil,SysUtils,Dialogs;
type
     PRec=^TRec;
     TRec=record
           shifrsta   : Integer;
           period     : Integer;
           Vyplacheno : Integer;
           Summa      : Real;
           NmbOfRec   : Integer;
          end;
  
  function IsPersonDup(Curr_Person:Person_Ptr;Action:boolean;Comment:string):boolean;
   var Curr_Add : Add_Ptr;
       List     : TList;
       Rec      : PRec;
       Finded   : Boolean;
       i        : Integer;
       RetVal   : boolean;
       f        : TextFile;
       s        : string;
       fJournalName : string;
       escPressed : Boolean;
       procedure DeleteDuplicates(I:integer;cntInCN:integer);
        var Shifr:Integer;
            Period:Integer;
            Curr_Add:ADD_PTR;
            Finished:Boolean;
            Cnt,j:integer;
        begin
             if (Work_Year_Val<>CurrYear) THEN Exit;
             if NMES<>FLOW_MONTH then Exit;
             if Curr_Person^.Automatic=manual_Mode then Exit;
             Shifr  := PRec(List.Items[i]).shifrsta;
             Period := PRec(List.Items[i]).Period;
             Cnt    := PRec(List.Items[i]).NmbOfRec;
             if  PRec(List.Items[i]).Vyplacheno=GET_OUT then  Exit;
             if Cnt<=cntInCN then Exit;
             while true do
               begin
                    Finished:=True;
                    Curr_Add:=Curr_Person^.ADD;
                    while (Curr_Add<>Nil) do
                      begin
                           if Curr_Add^.VYPLACHENO=NOT_GET_OUT then
                           if Curr_Add^.SHIFR=Shifr then
                              begin
                                   Cnt:=Cnt-1;
                                   Finished:=false;
                                   Del_Add(Curr_Add,Curr_Person);
                                   Break;
                              end;
                           Curr_Add:=Curr_Add^.next;
                      end;
                    if (Finished) or (Cnt<=cntInCn) then Break;
               end;
        end;
       function countInCN(shifrSta:integer;Curr_Person:Person_Ptr):Integer;
         var Curr_Cn : Cn_Ptr;
             RetVal  : Integer;
         begin
             RetVal := 0;
             Curr_Cn:=Curr_Person^.Cn;
             while (Curr_Cn<>Nil) do
               begin
                    if Curr_Cn^.Shifr     = shifrSta then
                    if Curr_Cn^.AUTOMATIC = AUTOMATIC_MODE then
                    if Curr_Cn^.KOD in [1..6] then
                       RetVal:=RetVal + 1;
                    Curr_Cn:=Curr_Cn^.Next;
               end;
             countInCN:=RetVal;
         end;

       function isInCN(Curr_Add:Add_Ptr;Curr_Person:Person_Ptr):Boolean;
         var Curr_Cn:Cn_Ptr;
             RetVal : Boolean;
         begin
             RetVal := False;
             Curr_Cn:=Curr_Person^.Cn;
             while (Curr_Cn<>Nil) do
               begin
                    if Curr_Cn^.Shifr=Curr_Add^.Shifr then
                    if Curr_Cn^.AUTOMATIC=AUTOMATIC_MODE then
                    if Curr_Cn^.KOD in [1..6] then
                       begin
                            RetVal:=True;
                            Break;
                       end;
                    Curr_Cn:=Curr_Cn^.Next;
               end;
             isInCN:=RetVal;
         end;
   begin
        RetVal   := False;
        List     := TList.Create;
        Curr_Add := Curr_Person^.Add;
        while (Curr_Add<>Nil) do
          begin
               if IsInCN(Curr_Add,Curr_Person) then
                  begin
                       Finded:=false;
                       if List.Count>0 then
                          for i:=0 to List.Count-1 do
                              begin
                                   if (
                                       (Curr_Add^.Shifr     = PRec(List.Items[i]).Shifrsta) and
                                       (Curr_Add^.Period    = PRec(List.Items[i]).Period) and
                                       (Curr_Add^.Vyplacheno = PRec(List.Items[i]).Vyplacheno) and
                                       (abs(Curr_Add^.Summa-PRec(List.Items[i]).Summa)<0.01)
                                      ) then
                                    begin
                                         Finded:=True;
                                         Inc(PRec(List.Items[i]).NmbOfRec);
                                         Break;
                                    end;
                              end;

                       if (not Finded) then
                          begin
                               Rec:=new(PRec);
                               Rec.shifrsta   := Curr_Add^.Shifr;
                               Rec.Period     := Curr_Add^.Period;
                               Rec.Vyplacheno := Curr_Add^.Vyplacheno;
                               Rec.Summa      := Curr_Add^.Summa;
                               Rec.NmbOfRec   := 1;
                               List.Add(Rec);
                          end;
                  end;
               Curr_Add:=Curr_Add^.Next;
          end;
        for i:=0 to List.Count-1 do
            begin
                 if PRec(List.Items[i]).NmbOfRec>1 then
                 if PRec(List.Items[i]).NmbOfRec<>countInCN(PRec(List.Items[i]).ShifrSta,Curr_Person) then
                    begin
      //                   ShowMessage('Подр.='+IntToStr(NSRV)+'. ФИО='+Trim(Curr_Person^.FIO)+'. Должн.='+trim(Curr_Person^.Dolg));
                         escPressed := False;
                         fJournalName:=makeJournalFileName(escPressed);
                         if Action then
                            DeleteDuplicates(i,countInCN(PRec(List.Items[i]).shifrsta,Curr_Person));
                         if not escPressed then
                            begin
                                 AssignFile(f,fJournalName);
                                 Append(f);
                                 s:=' Задвоение начислений '+DateToStr(date)+' '+TimeToStr(Time)+' '+Trim(CurrWrkFio)+' nmes='+intToStr(nmes);
                                 if not Action then
                                    s:=Trim(s)+' '+Comment;
                                 s:=Trim(S)+' Подр.='+IntToStr(NSRV)+'. ФИО='+Trim(Curr_Person^.FIO)+'. Должн.='+trim(Curr_Person^.Dolg)+' Статья = '+IntToStr(PRec(List.Items[i]).shifrsta);
                                 if Action then
                                    S:=Trim(S)+' '+'Исправлено '+trim(comment)+'.';
                                 Writeln(f,s);
                                 CloseFile(f);
                            end;
                         RetVal:=True;
              //           Break;
                    end;

            end;
        if List.Count>0 then
           for i:=0 to List.Count-1 do
               Dispose(PRec(List.Items[i]));
        List.Free;
        IsPersonDup:=RetVal;
   end;

  procedure TestDuplPodr(Comment:string);
   var Curr_Person:Person_Ptr;
    begin
         if not NeedTestAddDuplicates then Exit;
         Curr_Person:=HEAD_PERSON;
         while (Curr_Person<>Nil) do
          begin
               if Curr_Person^.tabno=7413 then
                  Curr_Person^.tabno:=Curr_Person^.tabno;
               IsPersonDup(Curr_Person,NeedRepairFindedAddDuplicates,Comment);
               Curr_Person:=Curr_Person^.Next;
          end;
    end;

end.
