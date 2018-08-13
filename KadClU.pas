{$H-}
unit KadClU;

interface
 uses ClarUnit,Classes;
 type
     PKadryRec=^TKadryRec;
     TKadryRec=record
                Tabno     : integer;
                FIO       : String;
                WorkPlace : integer;
                NalCode   : string;
                RecNo     : integer;
               end;
      TKadryClarion=class(TClarion)
                     constructor Create(FName:String);
                     procedure FillKadryList;
                     procedure PutWorkPlace(WorkPlace:word;RecNo:integer);
                     procedure EmptyWorkPlace(Tabno:integer);
                   end;
 function CompareFio(Item1,Item2:Pointer):integer;
 function CompareTabno(Item1,Item2:Pointer):integer;
 function CompareWorkPlace(Item1,Item2:Pointer):integer;
 function CompareNalCode(Item1,Item2:Pointer):integer;
 function SetWorkPlace(WorkPlace:word;RecNo:integer):boolean;
 function SetWorkPlaceForTabno(WorkPlace:word;Tabno:integer):boolean;
 function ZeroWorkPlace(Tabno:integer):boolean;
 var  KadryList:TList;
implementation
 uses ScrDef,ScrUtil,uFIBModule,uFrmFindKadryFB,SysUtils;
 function CompareFio(Item1,Item2:Pointer):integer;
  var f1,f2:PKadryRec;
  begin
       f1:=Item1;
       f2:=Item2;
       Result:=CompareUkrText(f1^.fio,f2^.fio);
{
       IF f1^.fio<f2^.fio then Result:=-1
                          else
       IF f1^.fio>f2^.fio then Result:=1
                          else Result:=0;
}                          
  end;
 function CompareTabno(Item1,Item2:Pointer):integer;
  var f1,f2:PKadryRec;
  begin
       f1:=Item1;
       f2:=Item2;
       IF f1^.Tabno<f2^.Tabno then Result:=-1
                              else
       IF f1^.Tabno>f2^.Tabno then Result:=1
                              else Result:=0;
  end;
 function CompareWorkPlace(Item1,Item2:Pointer):integer;
  var f1,f2:PKadryRec;
  begin
       f1:=Item1;
       f2:=Item2;
       IF f1^.WorkPlace<f2^.WorkPlace then Result:=-1
                                      else
       IF f1^.WorkPlace>f2^.WorkPlace then Result:=1
                                      else Result:=0;
  end;
 function CompareNalCode(Item1,Item2:Pointer):integer;
  var f1,f2:PKadryRec;
  begin
       f1:=Item1;
       f2:=Item2;
       IF f1^.NalCode<f2^.NalCode then Result:=-1
                              else
       IF f1^.NalCode>f2^.NalCode then Result:=1
                              else Result:=0;
  end;

 function SetWorkPlace(WorkPlace:word;RecNo:integer):boolean;
  var KadryClarion:TKadryClarion;
  begin
       KadryClarion:=TKadryClarion.Create('CKADRY.DAT');
       if Assigned(KadryClarion) then
          begin
               KadryClarion.PutWorkPlace(WorkPlace,RecNo);
               KadryClarion.Destroy;
          end;

  end;


 function SetWorkPlaceForTabno(WorkPlace:word;Tabno:integer):boolean;
  var KadryClarion:TKadryClarion;
      I,j:integer;
      KadryRec:PKadryRec;
      P:Pointer;
      Finded:Boolean;
      RecNo,CurrTabno:Integer;
  begin
       Finded:=False;
       KadryClarion:=TKadryClarion.Create('CKADRY.DAT');
       for i:=1 to KadryClarion.Header.RecCount do
        begin
             KadryClarion.Go(i);
             if KadryClarion.Deleted then continue;
             P:=KadryClarion.GetField(1);
             RecNo:=I;
             CurrTabno:=PWord(P)^;
             if CurrTabno=Tabno then
                begin
                     Finded:=True;
                     Break;
                end;
        end;
       if Assigned(KadryClarion) then
          begin
               KadryClarion.PutWorkPlace(WorkPlace,RecNo);
               KadryClarion.Destroy;
          end;

  end;

 function ZeroWorkPlace(Tabno:integer):boolean;
   var KadryClarion:TKadryClarion;
       i:integer;
   begin
        KadryClarion:=TKadryClarion.Create('CKADRY.DAT');
        if Assigned(KadryClarion) then
           begin
                KadryClarion.EmptyWorkPlace(Tabno);
                KadryClarion.Free;
           end;
   end;


 constructor TKadryClarion.Create(FName:String);
  var Succes:boolean;
      S:String;
  begin
        S:=Clar_Dir+FName;
        inherited create(S,Succes);
  end;

procedure TKadryClarion.FillKadryList;
  type TFIOT=array[1..51] of char;
       PFioT=^TFioT;
       TNC=array[1..11] of char;
       PNC=^TNC;
       PWord=^Word;
    pa=^ta;
         ta=Array[1..77] of byte;

  var I,j:integer;
      KadryRec:PKadryRec;
      FIOT:TFioT;
      NC:TNC;
      S:String;
      P:Pointer;
      b:ta;
  begin
       KadryList:=TList.Create;
       for i:=1 to Self.Header.RecCount do
        begin
             Self.Go(i);
             if Self.Deleted then continue;
             P:=Self.GetField(1);
             b:=pa(P)^;
             new(KadryRec);
             KadryRec^.RecNo:=I;
             KadryRec^.Tabno:=PWord(P)^;
             if KadryRec^.Tabno<1 then continue;
             KadryRec^.WorkPlace:=PWord(Self.GetField(2))^;
             FioT:=PFioT(Self.GetField(3))^;
             NC:=PNC(Self.GetField(4))^;
             FillChar(S,SizeOf(S),0);
             for j:=1 to SizeOf(FioT) do
                      if ord(fiot[j])>31 then
                         begin
                              S[j]:=Fiot[j];
                              s[0]:=chr(j);
                         end
                                         else break;
             s:=DosToWin(AllTrim(S));
             if Length(AllTrim(s))<2 then Continue;
             KadryRec^.FIO:=S;
             FillChar(S,SizeOf(S),0);
             for j:=1 to SizeOf(NC) do
                      if ord(NC[j])>31 then
                         begin
                              S[j] := NC[j];
                              s[0] := chr(j);
                         end
                                         else break;
             KadryRec^.NalCode:=AllTrim(S);
             KadryList.Add(KadryRec);
        end;
       KadryList.Sort(CompareFio);
  end;
procedure TKadryClarion.PutWorkPlace(WorkPlace:word;RecNo:integer);
 type
     pa = ^ta;
     ta = Array[1..71] of byte;
 var b : pa;
     PP:Pointer;
     a,a1 : ta;
 begin
      Self.Go(RecNo);
      b:=PBuffer;
      a:=pa(PBuffer)^;
      b^[8]:=Lo(WorkPlace);
      b^[9]:=Hi(WorkPlace);
      PP:=PBuffer;
      a1:=pa(PP)^;
      Self.WriteNo(PP,RecNo);
 end;

procedure TKadryClarion.EmptyWorkPlace(Tabno:integer);
 var i:integer;
     T_N:Word;
     P:Pointer;
 begin
       for i:=1 to Self.Header.RecCount do
        begin
             Self.Go(i);
             if Self.Deleted then continue;
             P:=Self.GetField(1);
             T_N:=PWord(P)^;
             if T_N=Tabno then
                begin
                     PutWorkPlace(0,i);
                     break;
                end;
        end;

 end;


end.
