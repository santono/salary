unit ScrLists;

interface
  uses Classes;

 { Константы для ShifrRec }
    const fsPodoh  = $0001;
          fsPens   = $0002;
          fsProf   = $0004;
          fsFondZ  = $0008;
          fsOtpusk = $0010;
          fsBoln   = $0020;
          fsAlim   = $0040;
          fsS_s    = $0080;
          fsECB    = $0100;
          fsECBN   = $0200;
          fsECBINV = $0400;
          fsECBILL = $0800;
          fsWS     = $1000;

//          fsGruBud = $0003; { Бюджет    }
//          fsGruVne = $0005; { Внебюджет }
//          fsGruGN  = $0006; { Г Н       }
//          fsGruNIS = $0007; { Н И С     }
  type

    PSSLimityRec=^TSSLimityRec;
    TSSLimityRec=record
                   m           : Integer;
                   y           : Integer;
                   MinSal      : Real;
                   ProgMin     : Real;
                   LimitForECB : Real;
                 end;

    PItemRec=^TItemRec;
    TItemRec=record
               Month : integer;
               Year  : integer;
             end;

    PPodrRec=^TPodrRec;
    TPodrRec=record
              Shifr      : integer;
              Selected   : boolean;
              Name       : string;
              MO_BUD     : boolean;
              MO_VNE     : boolean;
              MO_KOL_BUD : boolean;
              MO_KOL_VNE : boolean;
              MO_GN      : boolean;
              MO_NIS     : boolean;
              MO_MAG_BUD : boolean;
              MO_MAG_VNE : boolean;
              MO_MP      : boolean;
              MO_ISKRA   : boolean;
              CANBEEMPTY : boolean;
              SHIFRGRUM  : integer; { Бюджет, ВнеБюджет, НИС, ГН - для счетов и }
                                    { для переноса больничных и отпускных       }
              ACTIVE     : boolean;                      
             end;

    PShifrRec=^TShifrRec;
    TShifrRec=record
               Shifr       : integer;
               Add         : boolean;
               Long_Name   : string;
               Short_Name  : string;
               Attrib      : word;
               Selected    : boolean;
              end;

    PKoledgRec=^TKoledgRec;
    TKoledgRec=record
              Shifr : integer;
              Name  : string;
             end;

    PDolgRec=^TDolgRec;
    TDolgRec=record
              Shifr : integer;
              Name  : string;
              Razr  : word;
              Oklad : real;
             end;

    PTemyRec=^TTemyRec;
    TTemyRec=record
              Shifr : integer;
              Name  : string;
             end;

    PPensRec = ^TPensRec;
    TPensRec = record
                Add     : real;
                Low     : real;
                Upper   : real;
                Procent : real;
               end;

    TShifrList        = class(TList)
                         procedure ClearAllSelected;
                         function CountSelected:integer;
                         procedure SetSelected(WS:integer);
                         procedure ClearSelected(WS:integer);
                         function IsSelected(WS:integer)    : boolean;
                         function GetName(Shifr:Word):string;
                         function GetNameFromFirstChar(Shifr:Word):string;
                         function GetNameCN(Shifr:Word):string;
                         function GetNameByNo(Shifr:Word):string;
                         function GetShifrByNo(Shifr:Word):integer;
                         function IsAddByNo(Shifr:Word):boolean;
                         function IsAdd(Shifr:Word):boolean;
                         function IsPodoh(Shifr:word):boolean;
                         function IsPens(Shifr:word):boolean;
                         function IsProf(Shifr:word):boolean;
                         function IsFondZ(Shifr:word):boolean;
                         function IsOtpusk(Shifr:word):boolean;
                         function IsBoln(Shifr:word):boolean;
                         function IsAlim(Shifr:word):boolean;
                         function IsS_s(Shifr:word):boolean;
                         function IsECB(Shifr:word):boolean;
                         function IsECBIll(Shifr:word):boolean;
                         function IsWS(Shifr:word):boolean;
//                         function IsBudget(Shifr:word):boolean;
//                         function IsVneBudget(Shifr:word):boolean;
//                         function IsGN(Shifr:word):boolean;
//                         function IsNIS(Shifr:word):boolean;
                         procedure ReverseECBIll;
                         private
                          function IsNeed(Shifr:word;flag:word):boolean;
                        end;


    TServList=class(TList)
               procedure ClearAllSelected;
               function CountSelected:integer;
               procedure SetSelected(WS:integer);
               procedure ClearSelected(WS:integer);
               procedure UpdatePodrName(NAME:string;ShifrPod:integer);
               function findShifrPodByName(name:String):Integer;
               function IsSelected(WS:integer)    : boolean;
               function IsCorrectNsrv(WS:integer) : boolean;
               function IS_MO_BUD(WS:integer)     : boolean;
               function IS_MO_VNE(WS:integer)     : boolean;
               function IS_MO_KOL_BUD(WS:integer) : boolean;
               function IS_MO_KOL_VNE(WS:integer) : boolean;
               function IS_MO_GN(WS:integer)      : boolean;
               function IS_MO_NIS(WS:integer)     : boolean;
               function IS_MO_MAG_BUD(WS:integer) : boolean;
               function IS_MO_MAG_VNE(WS:integer) : boolean;
               function IS_MO_MP(WS:integer)      : boolean;
               function IS_MO_ISKRA(WS:integer)   : boolean;
               function IS_CANBEEMPTY(WS:integer) : boolean;
               function IS_ACTIVE(WS:INTEGER)     : Boolean;
               function getCodeByLinenoForActiveOnly(lineno:integer):Integer;
               function getCodeByLineno(lineno:integer):Integer;
               function getLinenoByCodeForActiveOnly(code:integer):Integer;
               function getLinenoByCode(code:integer):Integer;
               function getActiveNames:TStringList;

              end;

    TDolgList        = class(TList)
                         function GetName(Shifr:Word):string;
                         function GetNameByNo(Shifr:Word):string;
                         function GetRazr(Shifr:Word):word;
                         function GetRazrByNo(Shifr:Word):word;
                         function GetOklad(Shifr:Word):real;
                         function GetOkladByNo(Shifr:Word):real;
                         function GetShifrByNo(Shifr:Word):integer;
                         function GetNomerByShifr(Shifr:Word):integer;
                        end;

    TTemyList        = class(TList)
                         procedure GetName(ShifrKaf:integer;S:TStringList);
                       end;
    TPensList        = class(TList)
                         function Procent(Summa:real):real;
                         function Low(Summa:real):real;
                         function AddS(Summa:real):real;
                       end;
    TItemList        = class(TList)
                         function IsMonthYear(Month:integer;Year:integer):boolean;
                       end;


    TGruppyList      = class(TServList)
                             function GetShifrGruM(WS:integer) : integer;
                       end;


    TBuhAccesBayList = class(TList)
                             function IsPodrInList(WantedShifrPodr:integer):boolean;
                       end;

    TSSLimityList = class(TList)
                         function GetMinSal(Y:Integer;M:Integer):Real;
                         function GetProgMin(Y:Integer;M:Integer):Real;
                         function GetLimitForECB(Y:Integer;M:Integer):Real;
                    end;

    TBankiList = class(TList)
                      function getBankName(wantedI:integer):string;
                      function getBankNameByNo(wantedI:integer):string;
                      function getBankDir(wantedI:integer):string;
                      function getBankShifrSta(wantedI:integer):integer;
                      function getBankShifr(wantedI:integer):integer;
                      function getBankShifrByName(wantedName:string):integer;
                      function getBankItemNoByShifr(wantedShifr:integer):integer;
                      function getBankShifrByItemNo(wantedItemNo:integer):integer;

                 end;

  var
    NameServList      : TServList;
    KoledgShifrList   : TList;
    ShifrList         : TShifrList;
    ShifrAddList      : TShifrList;
    ShifrUdList       : TShifrList;
    NameDolgList      : TDolgList;
    TemyList          : TTemyList;
    PensList          : TPensList;
    GruppyList        : TGruppyList;
    KategList         : TServList;
    BuhAccesBayList   : TBuhAccesBayList;
    BuhBayList        : TBuhAccesBayList;
    BuhDopPodrList    : TBuhAccesBayList;
    SecretTabnoList   : TBuhAccesBayList;
    BuhList           : TTemyList;
    SSLimityList      : TSSLimityList;
    BankiList         : TBankiList;

implementation
 uses SysUtils,ScrDef,ScrUtil;
   function TShifrList.GetName(Shifr:Word):string;
     var i:integer;
     begin
           if Shifr>Limit_Cn_Base then Shifr:=Shifr-Limit_Cn_Base;
           GetName:='Не найден';
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if PShifrRec(Self.Items[i-1])^.Shifr=Shifr then
                     begin
                          GetName:=PShifrRec(Self.Items[i-1])^.Short_Name;
                          break;
                     end;
     end;

   function TShifrList.GetNameFromFirstChar(Shifr:Word):string;
     var i,l:integer;
         S:string;
         Finded:Boolean;
         RetVal:string;
         Ch:Char;
         s1:string[1];
         State:Boolean;
     begin
           if Shifr>Limit_Cn_Base then Shifr:=Shifr-Limit_Cn_Base;
           S:=getStaNameForSwodFromSQL(Shifr);
           if Length(Trim(S))>0 then
              begin
                   GetNameFromFirstChar:=Trim(S);
                   Exit;
              end;
           S:='Не найден';
           RetVal:=s;
           Finded:=false;
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if PShifrRec(Self.Items[i-1])^.Shifr=Shifr then
                     begin
                          S:=PShifrRec(Self.Items[i-1])^.Short_Name;
                          Finded:=True;
                          break;
                     end;
              if Finded then
                 begin
                      S:=trim(S);
                      l:=Length(s);
                      State:=True;
                      RetVal:='';
                      for i:=1 to l do
                        begin
                             S1:=Copy(s,i,1);
                             ch:=s1[1];
                             if State then
                                begin
                                     if not (Ch  in [' ','.',',']) then
                                        RetVal:=RetVal+s1;
                                     State:=False;
                                end
                             else
                                begin
                                     if Ch in [' ','.',','] then
                                        State:=True;
                                end;
                        end;

                 end;
           GetNameFromFirstChar:=RetVal;      
     end;

   function TShifrList.GetNameCN(Shifr:Word):string;
     var i,jj:integer;
     begin
           GetNameCN:='Не найден';
           jj:=Shifr;
           if jj>Limit_Cn_Base then jj:=jj-Limit_Cn_Base;
           GetNameCN:=GetName(jj);
     end;

   function TShifrList.GetNameByNo(Shifr:Word):string;
     var i:integer;
     begin
           GetNameByNo:='Не найден';
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if i=Shifr then
                     begin
                          GetNameByNo:=PShifrRec(Self.Items[i-1])^.Short_Name;
                          break;
                     end;
     end;
   function TShifrList.GetShifrByNo(Shifr:Word):integer;
     var i:integer;
     begin
           GetShifrByNo:=0;
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if i=Shifr then
                     begin
                          GetShifrByNo:=PShifrRec(Self.Items[i-1])^.Shifr;
                          break;
                     end;
     end;

   function TShifrList.IsAddByNo(Shifr:Word):boolean;
     var i:integer;
     begin
           IsAddByNo:=false;
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if i=Shifr then
                     begin
                          IsAddByNo:=PShifrRec(Self.Items[i-1])^.Add;
                          break;
                     end;
     end;

   function TShifrList.IsAdd(Shifr:Word):boolean;
     var i:integer;
     begin
           IsAdd:=false;
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if PShifrRec(Self.Items[i-1])^.Shifr=Shifr then
                     begin
                          IsAdd:=PShifrRec(Self.Items[i-1])^.Add;
                          break;
                     end;
     end;

   function TShifrList.IsPodoh(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsPodoh:=Self.IsNeed(Shifr,fsPodoh);
    end;
   function TShifrList.IsPens(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsPens:=Self.IsNeed(Shifr,fsPens);
    end;
   function TShifrList.IsProf(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsProf:=Self.IsNeed(Shifr,fsProf);
    end;
   function TShifrList.IsFondZ(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsFondZ:=Self.IsNeed(Shifr,fsFondZ);
    end;
   function TShifrList.IsOtpusk(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsOtpusk:=Self.IsNeed(Shifr,fsOtpusk);
    end;
   function TShifrList.IsBoln(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsBoln:=Self.IsNeed(Shifr,fsBoln);
    end;
   function TShifrList.IsS_S(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsS_S:=Self.IsNeed(Shifr,fsS_S);
    end;
   function TShifrList.IsWS(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsWS:=Self.IsNeed(Shifr,fsWS);
    end;
   function TShifrList.IsECB(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsECB:=Self.IsNeed(Shifr,fsECB);
    end;
   function TShifrList.IsECBIll(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsECBIll:=Self.IsNeed(Shifr,fsECBIll);
    end;

   function TShifrList.IsAlim(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsAlim := Self.IsNeed(Shifr,fsAlim);
    end;
{
   function TShifrList.IsBudget(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsBudget := Self.IsNeed(Shifr,fsGruBud);
    end;

   function TShifrList.IsVneBudget(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsVneBudget := Self.IsNeed(Shifr,fsGruVne);
    end;

   function TShifrList.IsGN(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsGN := Self.IsNeed(Shifr,fsGruGN);
    end;

   function TShifrList.IsNIS(Shifr:word):boolean;
    begin
         if Shifr>1000 then Shifr:=Shifr-1000;
         IsNIS := Self.IsNeed(Shifr,fsGruNIS);
    end;
}

   function TShifrList.IsNeed(Shifr:word;Flag:word):boolean;
    var
        Attrib,I : word;
        Finded   : boolean;
        j        : integer;
    begin
         IsNeed:=false;
         Finded:=false;
         if Self.Count=0 then Exit;
         for j:=1 to Self.Count do
             if PShifrRec(Self.Items[j-1])^.Shifr=Shifr then
                begin
                     Finded:=true;
                     break;
                end;

         if Finded then
            begin
                  Attrib:=PShifrRec(Self.Items[J-1])^.Attrib;
                  I:=Attrib and Flag;
                  if I <> 0 then
                     IsNeed:=true;
            end;
    end;

 procedure TShifrList.ClearAllSelected;
  var i:Integer;
  begin
        if Self.Count>0 then
           for i:=1 to Self.Count do
               PShifrRec(Self.Items[i-1])^.Selected:=false;
  end;

 procedure TShifrList.SetSelected(WS:integer);
  var i:integer;
  begin
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PShifrRec(Self.Items[i-1])^.Shifr=WS then
                     begin
                          PShifrRec(Self.Items[i-1])^.Selected:=true;
                          break;
                     end;
  end;

 procedure TShifrList.ClearSelected(WS:integer);
  var i:integer;
  begin
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PShifrRec(Self.Items[i-1])^.Shifr=WS then
                     begin
                          PShifrRec(Self.Items[i-1])^.Selected:=false;
                          break;
                     end;
  end;

 function TShifrList.CountSelected:integer;
  var i,r:integer;
  begin
        r:=0;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PShifrRec(Self.Items[i-1])^.Selected then
                  Inc(R);
        Result:=R;
  end;
 function TShifrList.IsSelected(WS:integer):boolean;
  var i:integer;
      r:boolean;
  begin
        r:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PShifrRec(Self.Items[i-1])^.Shifr=WS then
                  begin
                       if PShifrRec(Self.Items[i-1])^.Selected then R:=true;
                       break;
                  end;
        Result:=R;
  end;


 procedure TShifrList.ReverseECBIll;
    var I:integer;
    begin
         if Self.Count>0 then
         for i:=0 to Self.Count-1 do
             begin
                  if PShifrRec(Self.Items[i])^.Add then
                     begin
                          if (PShifrRec(Self.Items[i])^.Attrib and fsECBIll) > 0 then
                             PShifrRec(Self.Items[i])^.Attrib := PShifrRec(Self.Items[i])^.Attrib and not fsECBIll
                          else
                             PShifrRec(Self.Items[i])^.Attrib := PShifrRec(Self.Items[i])^.Attrib or fsECBIll
                     end;
             end;
    end;

{ Список подразделений }
 function TServList.IsCorrectNsrv(WS:integer):boolean;
  var i:Integer;
  begin
        IsCorrectNsrv:=true;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS then
                     begin
                          IsCorrectNsrv:=true;
                          break;
                     end;

  end;

 procedure TServList.UpdatePodrName(NAME:string;ShifrPod:integer);
  var i:Integer;
  begin
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=ShifrPod then
                     begin
                          PPodrRec(Self.Items[i-1])^.name:=name;
                          break;
                     end;
  end;

 function TServList.findShifrPodByName(name:String):Integer;
  var retVal:Integer;
      i:Integer;
  begin
       retVal:=0;
       if Self.Count>0 then
       for i:=0 to Self.Count-1 do
           if UPPER_STRING(Trim(name)) = UPPER_STRING(Trim(PPodrRec(Self.Items[i])^.Name)) then
              begin
                   retVal:=PPodrRec(Self.Items[i])^.Shifr;
                   Break;
              end;
       findShifrPodByName:=retVal;
  end;

 function TServList.getCodeByLinenoForActiveOnly(lineno:integer):Integer;
  var retVal:Integer;
      i,j:Integer;
  begin
       retVal:=0;
       j:=0;
       if Self.Count>0 then
       for i:=0 to Self.Count-1 do
           if pPodrRec(Self.Items[i]).Active then
              begin
                   inc(j);
                   if j=lineno then
                      begin
                           retVal:=PPodrRec(Self.Items[i])^.Shifr;
                           Break;
                      end;
              end;
       getCodeByLinenoForActiveOnly:=retVal;
  end;
function TServList.getLinenoByCodeForActiveOnly(code:integer):Integer;
  var retVal:Integer;
      i,currLineNo:Integer;
  begin
       retVal:=0;
       currLineNo:=0;
       if Self.Count>0 then
       for i:=0 to Self.Count-1 do
           if pPodrRec(Self.Items[i]).Active then
              begin
                   inc(currLineNo);
                   if PPodrRec(Self.Items[i])^.Shifr=code then
                      begin
                           retVal:=currLineNo;
                           Break;
                      end;
              end;
       getLinenoByCodeForActiveOnly:=retVal;
  end;
function TServList.getActiveNames:TStringList;
  var retVal:Integer;
      i,currLineNo:Integer;
      strings:TStringList;
  begin
       strings:=TStringList.Create;
       retVal:=0;
       currLineNo:=0;
       if Self.Count>0 then
       for i:=0 to Self.Count-1 do
           if pPodrRec(Self.Items[i]).Active then
              begin
                   strings.Append(PPodrRec(Self.Items[i])^.name);
                   inc(currLineNo);
              end;
       getActiveNames:=strings;
  end;

 function TServList.getCodeByLineno(lineno:integer):Integer;
  var retVal:Integer;
      i,j:Integer;
  begin
       retVal:=0;
       j:=0;
       if Self.Count>0 then
       for i:=0 to Self.Count-1 do
              begin
                   inc(j);
                   if j=lineno then
                      begin
                           retVal:=PPodrRec(Self.Items[i])^.Shifr;
                           Break;
                      end;
              end;
       getCodeByLineno:=retVal;
  end;

function TServList.getLinenoByCode(code:integer):Integer;
  var retVal:Integer;
      i,currLineNo:Integer;
  begin
       retVal:=0;
       currLineNo:=0;
       if Self.Count>0 then
       for i:=0 to Self.Count-1 do
            begin
                inc(currLineNo);
                if PPodrRec(Self.Items[i])^.Shifr=code then
                   begin
                        retVal:=currLineNo;
                        Break;
                   end;
            end;
       getLinenoByCode:=retVal;
  end;



 function TServList.IS_MO_BUD(WS:integer):boolean;
  var i:Integer;
  begin
        IS_MO_BUD:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS then
               if PPodrRec(Self.Items[i-1])^.MO_BUD then
                     begin
                          IS_MO_BUD:=true;
                          break;
                     end;
  end;

 function TServList.IS_MO_VNE(WS:integer)     : boolean;
  var i:Integer;
  begin
        IS_MO_VNE:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if PPodrRec(Self.Items[i-1])^.MO_VNE then
                     begin
                          IS_MO_VNE:=true;
                          break;
                     end;
  end;

 function TServList.IS_MO_KOL_BUD(WS:integer) : boolean;
  var i:Integer;
  begin
        IS_MO_KOL_BUD:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if PPodrRec(Self.Items[i-1])^.MO_KOL_BUD then
                     begin
                          IS_MO_KOL_BUD:=true;
                          break;
                     end;
  end;

 function TServList.IS_MO_KOL_VNE(WS:integer) : boolean;
  var i:Integer;
  begin
        IS_MO_KOL_VNE:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if PPodrRec(Self.Items[i-1])^.MO_KOL_VNE then
                     begin
                          IS_MO_KOL_VNE:=true;
                          break;
                     end;
  end;

 function TServList.IS_MO_GN(WS:integer)      : boolean;
  var i:Integer;
  begin
        IS_MO_GN:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if PPodrRec(Self.Items[i-1])^.MO_GN then
                     begin
                          IS_MO_GN:=true;
                          break;
                     end;
  end;

 function TServList.IS_MO_NIS(WS:integer)     : boolean;
  var i:Integer;
  begin
        IS_MO_NIS:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if PPodrRec(Self.Items[i-1])^.MO_NIS then
                     begin
                          IS_MO_NIS:=true;
                          break;
                     end;
  end;

 function TServList.IS_MO_MAG_BUD(WS:integer) : boolean;
  var i:Integer;
  begin
        IS_MO_MAG_BUD:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if PPodrRec(Self.Items[i-1])^.MO_MAG_BUD then
                     begin
                          IS_MO_MAG_BUD:=true;
                          break;
                     end;
  end;

 function TServList.IS_MO_MAG_VNE(WS:integer) : boolean;
  var i:Integer;
  begin
        IS_MO_MAG_VNE:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if PPodrRec(Self.Items[i-1])^.MO_MAG_VNE then
                     begin
                          IS_MO_MAG_VNE:=true;
                          break;
                     end;
  end;

 function TServList.IS_MO_MP(WS:integer) : boolean;
  var i:Integer;
  begin
        IS_MO_MP:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if PPodrRec(Self.Items[i-1])^.MO_MP     then
                     begin
                          IS_MO_MP:=true;
                          break;
                     end;
  end;

 function TServList.IS_MO_ISKRA(WS:integer) : boolean;
  var i:Integer;
  begin
        IS_MO_ISKRA:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if PPodrRec(Self.Items[i-1])^.MO_ISKRA  then
                     begin
                          IS_MO_ISKRA:=true;
                          break;
                     end;
  end;
 function TServList.IS_ACTIVE(WS:integer) : boolean;
  var i:Integer;
  begin
        IS_ACTIVE:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if PPodrRec(Self.Items[i-1])^.ACTIVE  then
                     begin
                          IS_ACTIVE:=true;
                          break;
                     end;
  end;

 function TServList.IS_CANBEEMPTY(WS:integer) : boolean;
  var i:Integer;
  begin
        IS_CANBEEMPTY:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS    then
               if PPodrRec(Self.Items[i-1])^.CANBEEMPTY  then
                     begin
                          IS_CANBEEMPTY:=true;
                          break;
                     end;
  end;

 procedure TServList.ClearAllSelected;
  var i:Integer;
  begin
        if Self.Count>0 then
           for i:=1 to Self.Count do
               PPodrRec(Self.Items[i-1])^.Selected:=false;
  end;

 procedure TServList.SetSelected(WS:integer);
  var i:integer;
  begin
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS then
                     begin
                          PPodrRec(Self.Items[i-1])^.Selected:=true;
                          break;
                     end;
  end;

 procedure TServList.ClearSelected(WS:integer);
  var i:integer;
  begin
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS then
                     begin
                          PPodrRec(Self.Items[i-1])^.Selected:=false;
                          break;
                     end;
  end;

 function TServList.CountSelected:integer;
  var i,r:integer;
  begin
        r:=0;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Selected then
                  Inc(R);
        Result:=R;
  end;


 function TServList.IsSelected(WS:integer):boolean;
  var i:integer;
      r:boolean;
  begin
        r:=false;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS then
                  begin
                       if PPodrRec(Self.Items[i-1])^.Selected then R:=true;
                       break;
                  end;
        Result:=R;
  end;

 { Источники финансирования }

 function TGruppyList.GetShifrGruM(WS:integer)      : integer;
  var i      : integer;
      RetVal : integer;
  begin
        RetVal := 2;
        if Self.Count>0 then
           for i:=1 to Self.Count do
               if PPodrRec(Self.Items[i-1])^.Shifr=WS  then
               if ((PPodrRec(Self.Items[i-1])^.ShifrGruM>=1) and
                   (PPodrRec(Self.Items[i-1])^.ShifrGruM<=4)) then
                   begin
                        RetVal := PPodrRec(Self.Items[i-1])^.ShifrGruM ;
                        break;
                   end;
        GetShifrGruM:=RetVal;
  end;



   function TDolgList.GetName(Shifr:Word):string;
     var i:integer;
     begin
           GetName:=IntToStr(Shifr)+' Не найден';
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if PDolgRec(Self.Items[i-1])^.Shifr=Shifr then
                     begin
                          GetName:=PDolgRec(Self.Items[i-1])^.Name;
                          break;
                     end;
     end;



   function TDolgList.GetNameByNo(Shifr:Word):string;
     var i:integer;
     begin
           GetNameByNo:=IntToStr(Shifr)+' Не найден';
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if i=Shifr then
                     begin
                          GetNameByNo:=PDolgRec(Self.Items[i-1])^.Name;
                          break;
                     end;
     end;

   function TDolgList.GetRazr(Shifr:Word):word;
     var i:integer;
     begin
           GetRazr:=0;
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if PDolgRec(Self.Items[i-1])^.Shifr=Shifr then
                     begin
                          GetRazr:=PDolgRec(Self.Items[i-1])^.Razr;
                          break;
                     end;
     end;

   function TDolgList.GetRazrByNo(Shifr:Word):word;
     var i:integer;
     begin
           GetRazrByNo:=0;
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if i=Shifr then
                     begin
                          GetRazrByNo:=PDolgRec(Self.Items[i-1])^.Razr;
                          break;
                     end;
     end;

   function TDolgList.GetOklad(Shifr:Word):real;
     var i:integer;
     begin
           GetOklad:=0;
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if PDolgRec(Self.Items[i-1])^.Shifr=Shifr then
                     begin
                          GetOklad:=PDolgRec(Self.Items[i-1])^.Oklad;
                          break;
                     end;
     end;

   function TDolgList.GetOkladByNo(Shifr:Word):real;
     var i:integer;
     begin
           GetOkladByNo:=0;
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if i=Shifr then
                     begin
                          GetOkladByNo:=PDolgRec(Self.Items[i-1])^.Oklad;
                          break;
                     end;
     end;

   function TDolgList.GetShifrByNo(Shifr:Word):integer;
     var i:integer;
     begin
           GetShifrByNo:=0;
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if i=Shifr then
                     begin
                          GetShifrByNo:=PDolgRec(Self.Items[i-1])^.Shifr;
                          break;
                     end;
     end;
   function TDolgList.GetNomerByShifr(Shifr:Word):integer;
     var i:integer;
     begin
           GetNomerByShifr:=0;
           if Self.Count>0 then
              for i:=1 to Self.Count do
                  if PDolgRec(Self.Items[i-1])^.Shifr=Shifr then
                     begin
                          GetNomerByShifr:=i;
                          break;
                     end;
     end;

procedure TTemyList.GetName(ShifrKaf:integer;S:TStringList);
 var i:integer;
 begin
      if Self.Count>0 then
         for i:=1 to Self.Count do
             if PTemyRec(Self.Items[i-1])^.Shifr=ShifrKaf then
                S.Add(PTemyRec(Self.Items[i-1])^.Name);

 end;
function TPensList.Procent(Summa:real):real;
 var i:integer;
     p:real;
 begin
      procent:=0;
      if Self.Count>0 then
         for i:=1 to Self.Count do
            if (PPensRec(Self.Items[i-1])^.Low<Summa) and (PPensRec(Items[i-1])^.Upper>=Summa) then
               begin
                    P:=PPensRec(Self.Items[i-1])^.Procent;
                    if p>0.99 then p:=p/100;
                    Procent:=P;
                    Break;
               end;
 end;
function TPensList.Low(Summa:real):real;
 var i:integer;
 begin
      Low:=0;
      if Self.Count>0 then
         for i:=1 to Self.Count do
            if (PPensRec(Self.Items[i-1])^.Low<Summa) and (PPensRec(Items[i-1])^.Upper>=Summa) then
               begin
                    Low:=PPensRec(Self.Items[i-1])^.Low;
                    Break;
               end;
 end;
function TPensList.AddS(Summa:real):real;
 var i:integer;
 begin
      AddS:=0;
      if Self.Count>0 then
         for i:=1 to Self.Count do
            if (PPensRec(Self.Items[i-1])^.Low<Summa) and (PPensRec(Items[i-1])^.Upper>=Summa) then
               begin
                    AddS:=PPensRec(Self.Items[i-1])^.Add;
                    Break;
               end;
 end;

function TItemList.IsMonthYear(Month:integer;Year:integer):boolean;
 var i:integer;
 begin
      IsMonthYear:=false;
      if Self.Count>0 then
         for i:=1 to Self.Count do
            if (PItemRec(Self.Items[i-1])^.Month=Month) and (PItemRec(Items[i-1])^.Year>=Year) then
               begin
                    IsMonthYear:=true;
                    Break;
               end;
 end;

 function TBuhAccesBayList.IsPodrInList(WantedShifrPodr:integer):boolean;
  var i:integer;
  begin
       if Self.Count<1 then
          begin
               Result:=false;
               Exit;
          end;
       for i:=0 to Self.Count-1 do
           begin
                 if PItemRec(Self.Items[i])^.Month=WantedShifrPodr then
                    begin
                          Result:=true;
                          Exit;
                    end;
           end;
       Result:=false;
  end;

  function TSSLimityList.GetMinSal(Y:Integer;M:Integer):Real;
   var i:Integer;
       RetVal:real;
   begin
        RetVal:=0;
        if Self.Count>0 then
           for i:=0 to Self.Count-1 do
               if (PSSLimityRec(Self.Items[i]).y=y) and
                  (PSSLimityRec(Self.Items[i]).m=m) then
                   begin
                        RetVal:=PSSLimityRec(Self.Items[i]).MinSal;
                        Break;
                   end;
        GetMinSal:=RetVal;
   end;
  function TSSLimityList.GetProgMin(Y:Integer;M:Integer):Real;
   var i:Integer;
       RetVal:real;
   begin
        RetVal:=0;
        if Self.Count>0 then
           for i:=0 to Self.Count-1 do
               if (PSSLimityRec(Self.Items[i]).y=y) and
                  (PSSLimityRec(Self.Items[i]).m=m) then
                   begin
                        RetVal:=PSSLimityRec(Self.Items[i]).ProgMin;
                        Break;
                   end;
        GetProgMin:=RetVal;
   end;

  function TSSLimityList.GetLimitForECB(Y:Integer;M:Integer):Real;
   var i:Integer;
       RetVal:real;
   begin
        RetVal:=0;
        if Self.Count>0 then
           for i:=0 to Self.Count-1 do
               if (PSSLimityRec(Self.Items[i]).y=y) and
                  (PSSLimityRec(Self.Items[i]).m=m) then
                   begin
                        RetVal:=PSSLimityRec(Self.Items[i]).LimitForECB;
                        Break;
                   end;
        GetLimitForECB:=RetVal;
   end;

  function TBankiList.getBankName(wantedI:integer):string;
    var i      : Integer;
        retVal : string;
    begin
         retVal:='Касса';
         for i:=0 to Self.Count-1 do
             begin
                  if PShifrRec(Self.Items[i]).Shifr=wantedI then
                     begin
                          retVal := PShifrRec(Self.Items[i]).Long_Name;
                          break;
                     end;
             end;
         getBankName:=retVal;
    end;
  function TBankiList.getBankNameByNo(wantedI:integer):string;
    var i      : Integer;
        retVal : string;
    begin
         retVal:='Касса';
         for i:=0 to Self.Count-1 do
             begin
                  if (i=wantedI-1) then
                     begin
                          retVal := PShifrRec(Self.Items[i]).Long_Name;
                          break;
                     end;
             end;
         getBankNameByNo:=retVal;
    end;
  function TBankiList.getBankDir(wantedI:integer):string;
    var i      : Integer;
        retVal : string;
    begin
         retVal:='Kassa';
         for i:=0 to Self.Count-1 do
             begin
                  if PShifrRec(Self.Items[i]).Shifr=wantedI then
                     begin
                          retVal := PShifrRec(Self.Items[i]).Short_Name;
                          break;
                     end;
             end;
         getBankDir:=retVal;
    end;

 function TBankiList.getBankShifrSta(wantedI:integer):integer;
    var i      : Integer;
        retVal : integer;
    begin
         retVal:=0;
         for i:=0 to Self.Count-1 do
             begin
                  if PShifrRec(Self.Items[i]).Shifr=wantedI then
                     begin
                          retVal := PShifrRec(Self.Items[i]).Attrib;
                          break;
                     end;
             end;
         getBankShifrSta:=retVal;
    end;


  function TBankiList.getBankShifr(wantedI:integer):integer;
    var i      : Integer;
        retVal : integer;
    begin
         retVal:=0;
         for i:=0 to Self.Count-1 do
             begin
                  if PShifrRec(Self.Items[i]).Shifr=wantedI then
                     begin
                          retVal := PShifrRec(Self.Items[i]).Shifr;
                          break;
                     end;
             end;
         getBankShifr:=retVal;
    end;
  function TBankiList.getBankShifrByName(wantedName:string):integer;
    var i      : Integer;
        retVal : integer;
        s      : string;
    begin
         retVal:=0;
         s:=Upper_String(trim(wantedName));
         for i:=0 to Self.Count-1 do
             begin
                  if Upper_String(trim(PShifrRec(Self.Items[i]).Long_Name))=S then
                     begin
                          retVal := PShifrRec(Self.Items[i]).Shifr;
                          break;
                     end;
             end;
         getBankShifrByName:=retVal;
    end;
  function TBankiList.getBankItemNoByShifr(wantedShifr:integer):integer;
    var i      : Integer;
        retVal : integer;
        j      : integer;
    begin
         retVal:=Self.Count;
         j:=wantedShifr;
         if (j>0) and (j<100) then
         for i:=0 to Self.Count-1 do
             begin
                  if PShifrRec(Self.Items[i]).Shifr=j then
                     begin
                          retVal := i;
                          break;
                     end;
             end;
         getBankItemNoByShifr:=retVal;
    end;
  function TBankiList.getBankShifrByItemNo(wantedItemNo:integer):integer;
    var i      : Integer;
        retVal : integer;
        j      : integer;
    begin
         retVal:=0;
         j:=wantedItemNo;
         if (j>=0) and (j<Self.Count) then
         for i:=0 to Self.Count-1 do
             begin
                  if i=j then
                     begin
                          retVal := PShifrRec(Self.Items[i]).Shifr;
                          break;
                     end;
             end;
         getBankShifrByItemNo:=retVal;
    end;




end.
