{$H-}
unit KadKprClU;
interface
 uses ClarUnit,Classes;
 type
     PKadryKprRec=^TKadryKprRec;
     TKadryKprRec=record
                   Tabno     : integer;
                   dp        : Integer;
                   mp        : Integer;
                   yp        : Integer;
                   du        : Integer;
                   mu        : Integer;
                   yu        : Integer;
                  end;
      TKadryKprClarion=class(TClarion)
                     constructor Create(FName:String);
                     procedure FillKadryKprList;
                   end;
 var  KadryKprList:TList;
implementation
 uses ScrDef,ScrUtil,SysUtils;

  function GetClarionDate(var y,m,d:word;dcC:Integer):boolean;
   var RetVal:boolean;
       i:word;
       n:array[1..12] of word;
       DC:integer;
       yi,mi,di:Integer;
   begin
        y:=0;
        m:=0;
        d:=0;
        yi:=0;
        mi:=0;
        di:=0;
        DC:=DCC;
        n[1]:=31;
        n[2]:=28;
        n[3]:=31;
        n[4]:=30;
        n[5]:=31;
        n[6]:=30;
        n[7]:=31;
        n[8]:=31;
        n[9]:=30;
        n[10]:=31;
        n[11]:=30;
        n[12]:=31;
        if (dc <= 3) OR (dc > 109211) THEN
           begin
                GetClarionDate:=false;
                exit;
           end;
	      IF dc > 36527 THEN dc := dc - 3
                      ELSE dc := dc - 4;
       	yi := (1801 + (4* (dc div 1461)));
      	dc := dc mod 1461;
      	IF dc <> 1460 THEN
           begin
            		yi := yi + (dc div 365);
            		di := dc mod 365;
           end
       ELSE
           begin
             		yi := yi + 3;
            		di := 365;
      	   end;
     	 IF yi < 100 THEN yi := yi + 1900;
       IF (yi mod 4 = 0) AND (yi <> 1900) THEN n[2] := 29
                                          ELSE n[2] := 28;
       for i := 1 TO 12 do
           begin
            		 di := di - n[i];
              	 IF di < 0 THEN
                    begin
	                 		  di := di + n[i]+1;
                        BREAK;
              	    end;
           end;
       mi := i;
       y:=yi;
       m:=mi;
       d:=di;
       GetClarionDate:=true;
   end;


 function CompareTabno(Item1,Item2:Pointer):integer;
  var f1,f2:PKadryKprRec;
  begin
       f1:=Item1;
       f2:=Item2;
       IF f1^.Tabno<f2^.Tabno then Result:=-1
                              else
       IF f1^.Tabno>f2^.Tabno then Result:=1
                              else Result:=0;
  end;



 constructor TKadryKprClarion.Create(FName:String);
  var Succes:boolean;
      S:String;
  begin
        S:=Clar_Dir+FName;
        inherited create(S,Succes);
  end;

procedure TKadryKprClarion.FillKadryKprList;

  var I,j:integer;
      KadryKprRec:PKadryKprRec;
      S:String;
      P:Pointer;
      DatePriInt:Integer;
      DateUwInt:Integer;
      y,m,d:word;
  begin
       KadryKprList:=TList.Create;
       for i:=1 to Self.Header.RecCount do
        begin
             Self.Go(i);
             if Self.Deleted then continue;
             P:=Self.GetField(1);
             new(KadryKprRec);
             FillChar(KadryKprRec^,SizeOf(KadryKprRec^),0);
             KadryKprRec^.Tabno:=PWord(P)^;
             if KadryKprRec^.Tabno<1 then continue;
             DatePriInt:=PInteger(Self.GetField(4))^;
             if DatePriInt<>0 then
             if GetClarionDate(y,m,d,DatePriInt) then
                begin
//                     KadryKprRec^.DataUw:=EnCodeDate(y,m,d);
                     KadryKprRec^.dp:=d;
                     KadryKprRec^.mp:=m;
                     KadryKprRec^.yp:=y;
                end;

             DateUwInt:=PInteger(Self.GetField(5))^;
             if DateUwInt<>0 then
             if GetClarionDate(y,m,d,DateUwInt) then
                begin
//                     KadryKprRec^.DataUw:=EnCodeDate(y,m,d);
                     KadryKprRec^.du:=d;
                     KadryKprRec^.mu:=m;
                     KadryKprRec^.yu:=y;
                end;
             if ((DatePriInt=0) and (DateUwInt=0)) then continue;
             KadryKprList.Add(KadryKprRec);
             j:=KadryKprList.Count;
        end;
 //      KadryKprList.Sort(@CompareTabno);
  end;

end.

