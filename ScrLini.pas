unit ScrLini;

interface
           FUNCTION FILL_PODR:BOOLEAN;
           FUNCTION SET_PODR_NAMES_FOR_NMES:BOOLEAN;
           FUNCTION FILL_SHIFR:BOOLEAN;
           FUNCTION FILL_DOLG:BOOLEAN;
           function Fill_DOLG_SQL:boolean;
           FUNCTION FILL_TEMY:BOOLEAN;
           FUNCTION FILL_PENS(START_MONTH:INTEGER):BOOLEAN;
           FUNCTION FILL_BuhAccesBayList:boolean;
           function Fill_BuhBayList:boolean;
           function Fill_SecretTabnoList:boolean;
           function Fill_BuhDopList:boolean;
           function Fill_BuhList:boolean;
           function Fill_SSLimity:Boolean;
           function Fill_Banki_List:Boolean;


implementation
    uses SysUtils,Classes,DB,QDialogs,ScrDef,ScrUtil,ScrLists,UFibModule,
  Variants, FIBQuery;

    procedure Fill_MO_Podr;
     var
        SHIFRPOD   : INTEGER;
        MO_BUD     : INTEGER;
        MO_VNE     : INTEGER;
        MO_KOL_BUD : INTEGER;
        MO_KOL_VNE : INTEGER;
        MO_GN      : INTEGER;
        MO_NIS     : INTEGER;
        MO_MAG_BUD : INTEGER;
        MO_MAG_VNE : INTEGER;
        MO_MP      : INTEGER;
        MO_ISKRA   : INTEGER;
        CANBEEMPTY : Integer;
        ACTIVE     : Integer;
        PodrRec    : PPodrRec;
        I,J        : integer;
     begin
           if not Assigned(NameServList) then Exit;
           if NameServList.Count=0 then Exit;
           FIB.pFIBQuery.SQL.Clear;
           FIB.pFIBQuery.SQL.Add('SELECT SHIFRPOD,MO_BUD,MO_VNE,MO_KOL_BUD,');
           FIB.pFIBQuery.SQL.Add('MO_KOL_VNE,MO_GN,MO_NIS,MO_MAG_BUD,MO_MAG_VNE,MO_MP,MO_ISKRA,CANBEEMPTY,1 ');
           FIB.pFIBQuery.SQL.Add('FROM PODR ORDER BY SHIFRPOD');
           FIB.pFIBTransactionSAL.StartTransaction;
           try
               FIB.pFIBQuery.ExecQuery;
{               FIB.pFIBQuery.First;}
               while not FIB.pFIBQuery.eof do
                begin
                     SHIFRPOD   := FIB.pFIBQuery.Fields[0].AsINTEGER;
                     MO_BUD     := FIB.pFIBQuery.Fields[1].AsINTEGER;
                     MO_VNE     := FIB.pFIBQuery.Fields[2].AsINTEGER;
                     MO_KOL_BUD := FIB.pFIBQuery.Fields[3].AsINTEGER;
                     MO_KOL_VNE := FIB.pFIBQuery.Fields[4].AsINTEGER;
                     MO_GN      := FIB.pFIBQuery.Fields[5].AsINTEGER;
                     MO_NIS     := FIB.pFIBQuery.Fields[6].AsINTEGER;
                     MO_MAG_BUD := FIB.pFIBQuery.Fields[7].AsINTEGER;
                     MO_MAG_VNE := FIB.pFIBQuery.Fields[8].AsINTEGER;
                     MO_MP      := FIB.pFIBQuery.Fields[9].AsINTEGER;
                     MO_ISKRA   := FIB.pFIBQuery.Fields[10].AsINTEGER;
                     CANBEEMPTY := FIB.pFIBQuery.Fields[11].AsINTEGER;
                     ACTIVE     := FIB.pFIBQuery.Fields[12].ASInteger;
                     for i:=1 to NameServList.Count do
                         begin
                              if i>180 then
                                 j:=0;
                              if PPodrRec(NameServList.List[i-1])^.Shifr=ShifrPod then
                                 begin
                                      if MO_BUD=1 then
                                         PPodrRec(NameServList.List[i-1])^.MO_BUD:=true;
                                      if MO_VNE=1 then
                                         PPodrRec(NameServList.List[i-1])^.MO_VNE:=true;
                                      if MO_KOL_BUD=1 then
                                         PPodrRec(NameServList.List[i-1])^.MO_KOL_BUD:=true;
                                      if MO_KOL_VNE=1 then
                                         PPodrRec(NameServList.List[i-1])^.MO_KOL_VNE:=true;
                                      if MO_GN=1 then
                                         PPodrRec(NameServList.List[i-1])^.MO_GN:=true;
                                      if MO_NIS=1 then
                                         PPodrRec(NameServList.List[i-1])^.MO_NIS:=true;
                                      if MO_MAG_BUD=1 then
                                         PPodrRec(NameServList.List[i-1])^.MO_MAG_BUD:=true;
                                      if MO_MAG_VNE=1 then
                                         PPodrRec(NameServList.List[i-1])^.MO_MAG_VNE:=true;
                                      if MO_MP=1 then
                                         PPodrRec(NameServList.List[i-1])^.MO_MP:=true;
                                      if MO_ISKRA=1 then
                                         PPodrRec(NameServList.List[i-1])^.MO_ISKRA:=true;
                                      if CANBEEMPTY=1 then
                                         PPodrRec(NameServList.List[i-1])^.CANBEEMPTY:=true;
                                      if ACTIVE=1 then
                                         PPodrRec(NameServList.List[i-1])^.ACTIVE:=true;
                                      break;
                                 end;
                         end;
                     FIB.pFIBQuery.Next;
                end;

               FIB.pFIBQuery.Close;
           except
             on e:Exception do
                begin
                     MessageDlg('Ошибка FILL_MO_PODR '+e.Message,mtInformation, [mbOk], 0);
                     Exit;
                end;
           end;
           FIB.pFIBTransactionSAL.Commit;
     end;

    FUNCTION FILL_PODR:BOOLEAN;
      VAR
         I,j:integer;
         NAME:STRING;
         S1:string[3];
         FNAME:STRING;
         DEV:TEXT;
         SHIFRPOD:WORD;
         PodrRec:PPodrRec;
      BEGIN
         FILL_PODR:=FALSE;
         FNAME:=CDir+'PODR1.TXT';
         IF NOT FILEEXIST(FNAME) THEN
            BEGIN
                  ShowMessage('Отсутствует файл '+FNAME);
                  FILL_PODR:=FALSE;
                  EXIT;
            END;
        ASSIGN(DEV,FNAME);
        RESET(DEV);
        FILL_PODR  := FALSE;
        NAMESERVLIST:=TServList.Create;
        Length_Serv:=10;
        i:=0;
        while not eof(Dev) do
          begin
               {$i-}
               readln(dev,s1,name);
               {$i+}
               Inc(i);
               if (i>160) then
                  i:=i;
               NAME:=ALLTRIM(NAME);
               if length(name)<1 then continue;
               val(Alltrim(S1),ShifrPod,j);
               NAME:=S1+' '+ALLTRIM(NAME);
               if Length(Name)>Length_Serv then Length_Serv:=Length(Name);
               if j=0 then
                  begin
                       New(Podrrec);
                       PodrRec^.Selected   := false;
                       PodrRec^.Shifr      := SHIFRPOD;
                       PodrRec^.Name       := DosToWin(NAME);
                       PodrRec^.MO_BUD     := false;
                       PodrRec^.MO_VNE     := false;
                       PodrRec^.MO_KOL_BUD := false;
                       PodrRec^.MO_KOL_VNE := false;
                       PodrRec^.MO_GN      := false;
                       PodrRec^.MO_NIS     := false;
                       PodrRec^.MO_MAG_BUD := false;
                       PodrRec^.MO_MAG_VNE := false;
                       PodrRec^.MO_MP      := false;
                       PodrRec^.MO_ISKRA   := false;
                       PodrRec^.CANBEEMPTY := false; 
                       PodrRec^.ACTIVE     := true;
{                       PodrRec^.Name  := NAME;}
                       NameServList.Add(PodrRec);
                  end;
          end;
        close(dev);
        MAX_COUNT_PODRAZD:=NAMESERVLIST.Count;
        Fill_MO_Podr;
        COUNT_SERV:=MAX_COUNT_PODRAZD;
        FILL_PODR:=TRUE;
     END;


    FUNCTION SET_PODR_NAMES_FOR_NMES:BOOLEAN;
      VAR
         I,j:integer;
         NAME:STRING;
         S1:string[3];
         DEV:TEXTfile;
         SHIFRPOD:WORD;
         fName:string;
      BEGIN
         fName:=MKFLPODR_Y;
         if NMES=flow_month then
            FNAME:=CDir+'PODR1.TXT';

         if not FileExists(fName) then Exit;
         SET_PODR_NAMES_FOR_NMES:=FALSE;
         ASSIGNfile(DEV,FNAME);
         RESET(DEV);
         i:=0;
         while not eof(Dev) do
           begin
                {$i-}
                readln(dev,s1,name);
                {$i+}
                Inc(i);
                if (i>160) then
                   i:=i;
                NAME:=ALLTRIM(NAME);
                NAME:=DosToWin(NAME);
                if length(name)<1 then continue;
                val(Alltrim(S1),ShifrPod,j);
                NAME:=S1+' '+ALLTRIM(NAME);
                NameServList.UpdatePodrName(NAME,ShifrPod);
           end;
        closefile(dev);
        SET_PODR_NAMES_FOR_NMES:=TRUE;
     END;


    function Fill_Podr_From_SQL:boolean;
     var
        SHIFRPOD   : INTEGER;
        Name       : String;
        MO_BUD     : INTEGER;
        MO_VNE     : INTEGER;
        MO_KOL_BUD : INTEGER;
        MO_KOL_VNE : INTEGER;
        MO_GN      : INTEGER;
        MO_NIS     : INTEGER;
        MO_MAG_BUD : INTEGER;
        MO_MAG_VNE : INTEGER;
        MO_MP      : INTEGER;
        PodrRec    : PPodrRec;
        I          : integer;
     begin
           Fill_Podr_From_SQL:=false;
           Length_Serv := 10;
           NAMESERVLIST:=TServList.Create;
           FIB.pFIBQuery.SQL.Clear;
           FIB.pFIBQuery.SQL.Add('SELECT SHIFRPOD,NAME,MO_BUD,MO_VNE,MO_KOL_BUD,');
           FIB.pFIBQuery.SQL.Add('MO_KOL_VNE,MO_GN,MO_NIS,MO_MAG_BUD,MO_MAG_VNE,MO_MP ');
           FIB.pFIBQuery.SQL.Add('FROM PODR ORDER BY SHIFRPOD');
           FIB.pFIBTransactionSAL.StartTransaction;
           try
               FIB.pFIBQuery.ExecQuery;
{               FIB.pFIBQuery.First;}
               while not FIB.pFIBQuery.eof do
                begin
                     SHIFRPOD   := FIB.pFIBQuery.Fields[0].AsINTEGER;
                     NAME       := FIB.pFIBQuery.Fields[1].AsString;
                     MO_BUD     := FIB.pFIBQuery.Fields[2].AsINTEGER;
                     MO_VNE     := FIB.pFIBQuery.Fields[3].AsINTEGER;
                     MO_KOL_BUD := FIB.pFIBQuery.Fields[4].AsINTEGER;
                     MO_KOL_VNE := FIB.pFIBQuery.Fields[5].AsINTEGER;
                     MO_GN      := FIB.pFIBQuery.Fields[6].AsINTEGER;
                     MO_NIS     := FIB.pFIBQuery.Fields[7].AsINTEGER;
                     MO_MAG_BUD := FIB.pFIBQuery.Fields[8].AsINTEGER;
                     MO_MAG_VNE := FIB.pFIBQuery.Fields[9].AsINTEGER;
                     MO_MP      := FIB.pFIBQuery.Fields[10].AsINTEGER;
                     if Length(Name)>Length_Serv then
                        Length_Serv:=Length(Name);
                     New(Podrrec);
                     PodrRec^.Selected   := false;
                     PodrRec^.Shifr      := SHIFRPOD;
                     PodrRec^.Name       := NAME;
                     if MO_BUD=1 then PodrRec^.MO_BUD := true
                                 else PodrRec^.MO_BUD := false;
                     if MO_VNE=1 then PodrRec^.MO_VNE := true
                                 else PodrRec^.MO_VNE := false;
                     if MO_KOL_BUD=1 then PodrRec^.MO_KOL_BUD := true
                                     else PodrRec^.MO_KOL_BUD := false;
                     if MO_KOL_VNE=1 then PodrRec^.MO_KOL_VNE := true
                                     else PodrRec^.MO_KOL_VNE := false;
                     if MO_GN=1 then PodrRec^.MO_GN := true
                                else PodrRec^.MO_GN := false;
                     if MO_NIS=1 then PodrRec^.MO_NIS := true
                                 else PodrRec^.MO_NIS := false;
                     if MO_MAG_BUD=1 then PodrRec^.MO_MAG_BUD := true
                                     else PodrRec^.MO_MAG_BUD := false;
                     if MO_MAG_VNE=1 then PodrRec^.MO_MAG_VNE := true
                                     else PodrRec^.MO_MAG_VNE := false;
                     if MO_MP=1      then PodrRec^.MO_MP := true
                                     else PodrRec^.MO_MP := false;
{                       PodrRec^.Name  := NAME;}
                     NameServList.Add(PodrRec);
                     FIB.pFIBQuery.Next;
                end;
               FIB.pFIBQuery.Close;
           except
               MessageDlg('Ошибка Fill_Podr_SQL ',mtInformation, [mbOk], 0);
               Fill_Podr_From_SQL:=false;
               Exit;
           end;
           FIB.pFIBTransactionSAL.Commit;
           Fill_Podr_From_SQL:=true;
     end;
 function Compare(S1:Pointer;S2:pointer):integer;
   begin
        if PShifrRec(S1)^.Shifr>PShifrRec(S2)^.Shifr then
           Compare:=1
        else
        if PShifrRec(S1).Shifr<PShifrRec(S2).Shifr then
           Compare:=-1
        else
           Compare:=0;
   end;

 FUNCTION FILL_SHIFR:BOOLEAN;
   VAR
       SHORT_NAME:STRING[20];
       LONG_NAME:STRING[40];
       SHIFR_SHI:WORD;
       FNAME:STRING;
       Dev:Text;
       ShifrRec:PShifrRec;
       S:String;
//       IsAdd:boolean;

function FindShifrInShifrList(I:Integer;var JIndex:Integer):boolean;
 var ii:integer;
 begin
      FindShifrInShifrList:=false;
      JIndex:=-1;
      if ShifrList.Count>0 then
         for ii:=1 to ShifrList.Count do
             if PShifrRec(ShifrList.Items[II-1])^.Shifr=i then
                begin
                     FindShifrInShifrList:=true;
                     JIndex:=ii-1;
                     break;
                end;

 end;
PROCEDURE INI_EXL;
 type TEXL_MODE=(Podoh_Mode,Pens_Mode,Prof_Mode,FondZ_Mode,Otpusk_Mode,Boln_Mode,S_S_Mode,ECB_Mode,ECBIll_Mode,WS_Mode);
 VAR I:INTEGER;
     FN:STRING;
 PROCEDURE INI_FEXL(MODE:TEXL_MODE);
  VAR J:INTEGER;
      DEVF:TEXT;
      S,S1:STRING;
      JIndex:integer;
  BEGIN
       fn:='no.txt';
       CASE MODE of
           Podoh_Mode  : FN:='_Podoh.txt';
           Pens_Mode   : FN:='_Pens.txt';
           Prof_Mode   : FN:='_Prof.txt';
           FondZ_Mode  : FN:='_Fond.txt';
           Otpusk_Mode : FN:='_Otp.txt';
           S_S_Mode    : FN:='_S_S.txt';
           Boln_Mode   : FN:='_Bol.txt';
           ECB_Mode    : FN:='_Ecb.txt';
           ECBIll_Mode : FN:='_Bollist.txt';
           WS_Mode     : FN:='_WS.txt';
       end;
       IF NOT FILEEXIST(CDIR+FN) THEN
          BEGIN
               ShowMessage('Отсутствует файл '+FN);
               EXIT;
          END;
       ASSIGN(DEVF,CDIR+FN);
       RESET(DEVF);
       REPEAT
          IF NOT EOF(DEVF) THEN
             BEGIN
                  READLN(DEVF,S);
                  IF (COPY(S,1,2)<>'\\') AND (COPY(S,1,2)<>'\*') THEN
                     BEGIN
                           S1:=ALLTRIM(COPY(S,1,3));
                           VAL(S1,I,J);
                           IF J=0 THEN
                              BEGIN
                                   if FindShifrInShifrList(I,JIndex) then
                                      begin
                                            case Mode of
                                             Podoh_Mode:
                                              begin
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsPodoh;
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsAlim;
                                              end;
                                             Pens_Mode:
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsPens;
                                             Prof_Mode:
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsProf;
                                             FondZ_Mode:
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsFondZ;
                                             Otpusk_Mode:
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsOtpusk;
                                             Boln_Mode:
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsBoln;
                                             S_s_Mode:
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                               PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsS_S;
                                             ECB_Mode:
                                               begin
                                                    PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                                    PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsECB;
                                               end;
                                             ECBIll_Mode:
                                               begin
                                                    PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                                    PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsECBIll;
                                               end;
                                             WS_Mode:
                                               begin
                                                    PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib :=
                                                    PShifrRec(SHIFRLIST.Items[JIndex])^.Attrib and not fsWS;
                                               end;
                                          end;
                                      end;
                              END;
                     END;
             END;
       UNTIL (S1='\*') OR EOF(DEVF);
       CLOSE(DEVF);
  END;
 BEGIN
      KZ:=0;
      INI_FEXL(Podoh_Mode);
      Ini_FExl(Pens_Mode);
      Ini_FExl(Prof_Mode);
      Ini_FExl(FondZ_Mode);
      Ini_FExl(Otpusk_Mode);
      Ini_FExl(Boln_Mode);
      Ini_FExl(S_S_Mode);
      Ini_FExl(ECB_Mode);
      Ini_FExl(ECBIll_Mode);
      {$IFDEF SVDN}
      Ini_FExl(WS_Mode);
      {$ENDIF}
      ShifrList.ReverseECBIll;

 END;

 FUNCTION Fill_Shifr_Ud:BOOLEAN;
   VAR
       I          : LONGINT;
       SHORT_NAME : STRING;
       LONG_NAME  : STRING;
       SHIFR_SHI  : WORD;
       FNAME      : STRING;
       IsAdd      : boolean;
       J,J_Count  : integer;
 BEGIN
        KZ:=0;
        FILL_SHIFR_UD:=TRUE;
        FNAME:=CDIR+'SHIFRUD.TXT';
        IF NOT FILEEXIST(FNAME) THEN
           BEGIN
                 ERROR('Отсутствует файл '+FNAME);
                 FILL_SHIFR_UD:=FALSE;
                 KZ:=-1;
                 EXIT;
           END;
        AssignFile(DEV,FNAME);
        Reset(DEV);
        ShifrUdList := TShifrList.Create;
        WHILE NOT EOF(DEV) DO
                BEGIN
                    {$I-}
                    READLN(DEV,SHIFR_SHI);
                    if Shifr_Shi>155 then
                       Shifr_Shi:=SHIFR_SHI;
                    if IoResult<>0 then
                       begin
                            Error('Ошибка чтения файла '+FName);
                            FILL_SHIFR_UD:=FALSE;
                            KZ:=-1;
                            Exit;
                       end;
                    READLN(DEV,long_name);
                    if IoResult<>0 then
                       begin
                            Error('Ошибка чтения файла '+FName);
                            FILL_SHIFR_UD:=FALSE;
                            KZ:=-1;
                            Exit;
                       end;
                    READLN(DEV,Short_Name);
                    if IoResult<>0 then
                       begin
                            Error('Ошибка чтения файла '+FName);
                            FILL_SHIFR_UD:=FALSE;
                            KZ:=-1;
                            Exit;
                       end;
                    {$I+}
                    Short_Name:=DosToWin(Short_Name);
                    Long_Name:=DosToWin(Long_Name);
                    if ((Upper_String(AllTrim(Short_Name))='ВСЕГО УДЕРЖАНО')
                       or
                       (Upper_String(AllTrim(Short_Name))='ВСЬОГО УТРИМАНО'))
                     then M_Shifr:=Shifr_Shi;
                    New(ShifrRec);
                    if Shifr_Shi=53 then
                       Shifr_Shi:=53;
                    ShifrRec^.Shifr      := Shifr_Shi;
                    ShifrRec^.Short_Name := Short_Name;
                    ShifrRec^.Long_Name  := Long_Name;
//                    ShifrRec^.Add        := IsAdd;
                    ShifrRec^.Add        := false;
                    if (ShifrRec^.Shifr=53) then
                       J:=ShifrList.Count;
                    ShifrList.Add(ShifrRec);
                    ShifrUdList.Add(ShifrRec);
                    if ShifrList.IsSelected(SHIFR_SHI) then
                       Shifr_Shi:=SHIFR_SHI;;

                    if ((Pos('ВСЕГО',Upper_String(AllTrim(Short_NAme)))=1) or
                        (Pos('ВСЬОГО',Upper_String(AllTrim(Short_NAme)))=1)) then
                       Total_Ud_Shifr:=Shifr_Shi;
               END;
        CloseFile(DEV);
        COUNT_SHIFR    := SHIFRLIST.COUNT;
        COUNT_SHIFR_UD := SHIFRUDLIST.COUNT;
 END;

 FUNCTION Fill_Shifr_Add:BOOLEAN;
   VAR
       I          : LONGINT;
       SHORT_NAME : STRING;
       LONG_NAME  : STRING;
       SHIFR_SHI  : WORD;
       FNAME      : STRING;
       IsAdd      : boolean;
   begin
        Fill_Shifr_ADD := true;
        kz:=0;
        FNAME:=CDIR+'SHIFRADD.TXT';
        IF NOT FILEEXIST(FNAME) THEN
           BEGIN
                 ERROR('Отсутствует файл '+FNAME);
                 Fill_Shifr_Add:=false;
                 exit;
           END;
        AssignFile(Dev,FName);
        Reset(Dev);
        ShifrList    := TShifrList.Create;
        ShifrAddList := TShifrList.Create;
{       LENGTH_SERV:=10; }
        while NOT eof(DEV) do
          begin
              {$I-}
              READLN(DEV,SHIFR_SHI);
              if IoResult<>0 then
                 begin
                      Error('Ошибка чтения файла '+FName);
                            Fill_Shifr_Add:=FALSE;
                            KZ:=-1;
                            Exit;
                       end;
                    Readln(Dev,Long_name);
                    if IoResult<>0 then
                       begin
                            Error('Ошибка чтения файла '+FName);
                            Fill_Shifr_Add:=FALSE;
                            KZ:=-1;
                            Exit;
                       end;
                    Readln(Dev,Short_Name);
                    if IoResult<>0 then
                       begin
                            Error('Ошибка чтения файла '+FName);
                            Fill_Shifr_Add:=FALSE;
                            KZ:=-1;
                            Exit;
                       end;
                    {$I+}
                    Short_Name:=trim(DosToWin(Short_Name));
                    Long_Name:=trim(DosToWin(Long_Name));
               //     sysUtils.AnsiCompareText(shortName,'Всього нараховано');
//                    if ((Upper_String(DosToWin(AllTrim(Short_Name)))='ВСЕГО НАЧИСЛЕНО') OR
//                        (Upper_String(DosToWin(AllTrim(Short_Name)))='ВСЬОГО НАРАХОВАНО')) then L_Shifr:=Shifr_Shi;
                    if ((sysUtils.AnsiCompareText(short_Name,'ВСЕГО НАЧИСЛЕНО')=0) OR
                        (sysUtils.AnsiCompareText(short_Name,'Всього нараховано')=0)) then L_Shifr:=Shifr_Shi;
                    New(ShifrRec);
                    ShifrRec^.Shifr      := Shifr_Shi;
                    ShifrRec^.Short_Name := Short_Name;
                    ShifrRec^.Long_Name  := Long_Name;
//                    ShifrRec^.Add        := IsAdd;
                    ShifrRec^.Add        := True;
//                    If ShifrRec^.Shifr=L_Shifr then IsAdd:=false;
                    ShifrRec^.Attrib     := ShifrRec^.Attrib   OR
                                                      fsPodoh  OR
                                                      fsPens   OR
                                                      fsProf   OR
                                                      fsFondZ  OR
                                                      fsOtpusk OR
                                                      fsBoln   OR
                                                      fsAlim   OR
                                                      fsS_s    OR
                                                      fsECB    OR
                                                      fsECBIll OR
                                                      fsWS ;
                    ShifrList.Add(ShifrRec);
                    ShifrAddList.Add(ShifrRec);
                    if ((Pos('ВСЕГО',Upper_String(AllTrim(Short_NAme)))=1)
                       or
                       (Pos('ВСЬОГО',Upper_String(AllTrim(Short_NAme)))=1))
                       then
                       Total_Add_Shifr:=Shifr_Shi;
               END;
        CloseFile(Dev);
        Count_Shifr     := ShifrList.COUNT;
        Count_Shifr_Add := Count_Shifr;
        if Count_Shifr>0 then Ini_Exl;
   end;


 function FillColedg:boolean;
  var FName:string;
      Dev:text;
      Shifr:integer;
      Name:string;
      KoledgRec : PKoledgRec;
  begin
        FillColedg:=true;
        FNAME:=CDIR+'Coledg.TXT';
        IF NOT FILEEXIST(FNAME) THEN
           BEGIN
                 ShowMessage('Отсутствует файл '+FNAME);
                 FillColedg:=FALSE;
                 EXIT;
           END;
        AssignFile(DEV,FNAME);
        RESET(DEV);
        KoledgShifrList:=TList.Create;
        WHILE NOT EOF(DEV) DO
                BEGIN
                    {$I-}
                    READLN(DEV,Shifr,Name);
                    if IoResult<>0 then
                       begin
                            ShowMessage('Ошибка чтения файла '+FName);
                            FillColedg:=FALSE;
                            Exit;
                       end;
                    {$I+}
                    New(KoledgRec);
                    KoledgRec^.Shifr := Shifr;
                    KoledgRec^.Name  := DosToWin(Name);
                    KoledgShifrList.Add(KoledgRec);
               END;
        CloseFile(DEV);
  end;

  function Fill_Shifr_Old:boolean;
    var FName : string;
        DEV   : text;
        Shifr_Shi : integer;
        Long_Name,Short_Name:string;
        IsAdd:boolean;
        i_count,i:integer;
   BEGIN
        FILL_SHIFR_Old  := FALSE;
        if Not FillColedg then Exit;
        FName:=CDIR+'SHIFR.TXT';
        IF NOT FileExist(FName) THEN
           BEGIN
                 ShowMessage('Отсутствует файл '+FNAME);
                 Fill_Shifr_Old:=FALSE;
                 Exit;
           END;
        Assign(Dev,FName);
        Reset(Dev);
        ShifrList:=TShifrList.Create;
        IsAdd:=true;
        l_Shifr:=-1;
        i_count:=0;
        WHILE NOT EOF(DEV) DO
                BEGIN
                    {$I-}
                    READLN(DEV,SHIFR_SHI);
                    if IoResult<>0 then
                       begin
                            Error('Ошибка чтения файла '+FName);
                            Exit;
                       end;
                    READLN(DEV,long_name);
                    if IoResult<>0 then
                       begin
                            Error('Ошибка чтения файла '+FName);
                            Exit;
                       end;
                    READLN(DEV,Short_Name);
                    if IoResult<>0 then
                       begin
                            Error('Ошибка чтения файла '+FName);
                            Exit;
                       end;
                    {$I+}
                    s:=Upper_String(AllTrim(DosToWin(Short_Name)));
                    if ((S='ВСЕГО НАЧИСЛЕНО')
                        or
                       (S='ВСЬОГО НАРАХОВАНО'))  then
                       begin
                             L_Shifr:=Shifr_Shi;
                             Total_Add_Shifr:=Shifr_Shi;
                       end
                    else
                    if ((S='ВСЕГО УДЕРЖАНО') or
                        (S='ВСЬОГО УТРИМАНО'))
                     then
                       begin
                            M_Shifr:=Shifr_Shi;
                            Total_Ud_Shifr:=Shifr_Shi;
                       end;
                    New(ShifrRec);
                    ShifrRec^.Shifr      := Shifr_Shi;
                    ShifrRec^.Short_Name := DosToWin(Short_Name);
                    ShifrRec^.Long_Name  := DosToWin(Long_Name);
                    ShifrRec^.Add        := IsAdd;
                    If ShifrRec^.Shifr=L_Shifr then IsAdd:=false;
                    ShifrRec^.Attrib     := ShifrRec^.Attrib   OR
                                                      fsPodoh  OR
                                                      fsPens   OR
                                                      fsProf   OR
                                                      fsFondZ  OR
                                                      fsOtpusk OR
                                                      fsBoln   OR
                                                      fsAlim   OR
                                                      fsS_s;
                    i:=ShifrRec^.Shifr;
                    if i=102 then
                       i:=i; 
                    i_count:=i_count+1;
                    SHIFRLIST.Add(ShifrRec);
               END;
        CLOSE(DEV);
        COUNT_SHIFR:=SHIFRLIST.COUNT;
        if COUNT_SHIFR>0 then Ini_Exl;

        FILL_SHIFR_old:=TRUE;
     END;
{   Fill Shifr  }
   BEGIN
        KZ:=0;
        FILL_SHIFR  := TRUE;
        if Not FillColedg then Exit;
        FNAME:=CDIR+'SHIFRADD.TXT';
        IF NOT (FILEEXIST(CDIR+'SHIFRADD.TXT') AND FILEEXIST(CDIR+'SHIFRUD.TXT')) THEN
           BEGIN
                 if not Fill_Shifr_Old then
                 FILL_SHIFR:=FALSE;
                 KZ:=-1;
                 EXIT;
           END
        ELSE
           BEGIN
                 if not Fill_Shifr_Add then
                    begin
                         FILL_SHIFR:=FALSE;
                         KZ:=-1;
                         exit;
                    end;
                ShifrList.Sort(@Compare);
                if ShifrList.IsSelected(53) then
                   kz:=0;
                 if not Fill_Shifr_Ud then
                    begin
                         FILL_SHIFR:=FALSE;
                         kz:=-1;
                         exit;
                    end;
                ShifrList.Sort(@Compare);
                if ShifrList.IsSelected(53) then
                   kz:=0;
           END;
        FILL_SHIFR:=TRUE;
     END;


function Fill_DOLG_SQL:boolean;
     var
        SHIFRDOL   : INTEGER;
        Name       : STRING;
        RAZR       : INTEGER;
        OKLAD      : REAL;
        DolgRec    : PDolgRec;
        I,J        : integer;

     begin
           FILL_DOLG_SQL:=FALSE;

           NAMEDOLGLIST:=TDOLGLIST.CREATE;
           FIB.pFIBQuery.SQL.Clear;
           FIB.pFIBQuery.SQL.Add('SELECT SHIFRDOL,NAME,RAZR,OKLAD,');
//           FIB.pFIBQuery.SQL.Add('coalesce(NEED_STAG,0) need_stag ');
           FIB.pFIBQuery.SQL.Add('trim(substring(a.name from 6 for 45)) as ename');
           FIB.pFIBQuery.SQL.Add('FROM TB_DOLG a ORDER BY SHIFRDOL');
           FIB.pFIBTransactionSAL.StartTransaction;
           try
               FIB.pFIBQuery.ExecQuery;
{               FIB.pFIBQuery.First;}
               while not FIB.pFIBQuery.eof do
                begin
                     SHIFRDOL   := FIB.pFIBQuery.Fields[0].AsINTEGER;
                     RAZR       := FIB.pFIBQuery.Fields[2].AsINTEGER;
                     OKLAD      := FIB.pFIBQuery.Fields[3].AsFloat;
                     Name       := FIB.pFIBQuery.Fields[4].AsString;
                     new(DolgRec);
                     DolgRec^.Shifr := ShifrDol;
                     DolgRec^.Razr  := Razr;
                     DolgRec^.Oklad := Oklad;
                     DolgRec^.Name  := NAME;
                     NameDolgList.Add(DolgRec);
                     FIB.pFIBQuery.Next;
                end;

               FIB.pFIBQuery.Close;
           except
             on e:Exception do
                begin
                     MessageDlg('Ошибка FILL_DOLG_SQL '+e.Message,mtInformation, [mbOk], 0);
                     Exit;
                end;
           end;
           FIB.pFIBTransactionSAL.Commit;
        MAX_COUNT_Dolg:=NAMEDolgLIST.Count;
        COUNT_Dolg:=MAX_COUNT_DOLG;
        FILL_DOLG_SQL:=TRUE;
     end;

 FUNCTION FILL_DOLG:BOOLEAN;
   VAR
       j,j1:integer;
       NAME:STRING[33];
       S1:string[5];
       RAZRS:STRING[2];
       OKLADS:STRING[15];
       FNAME:STRING;
       DEV:TEXT;
       SHIFRDOL:WORD;
       DolgRec:PDolgRec;
       RAZR:INTEGER;
       OKLAD:REAL;
   BEGIN
        FILL_DOLG:=FALSE;
        FNAME:=CDir+'DOLG.TXT';
        IF NOT FILEEXIST(FNAME) THEN
           BEGIN
                 ShowMessage('Отсутствует файл '+FNAME);
                 FILL_DOLG:=FALSE;
                 EXIT;
           END;
        ASSIGN(DEV,FNAME);
        RESET(DEV);
        FILL_DOLG  := FALSE;
        NAMEDOLGLIST:=TDOLGLIST.CREATE;
        Length_Dolg:=10;
        while not eof(Dev) do
          begin
               {$i-}
               readln(dev,s1,name,RAZRS,OKLADS);
               {$i+}
               NAME:=ALLTRIM(NAME);
               if length(name)<1 then continue;
               val(Alltrim(S1),ShifrDol,j);
               NAME:=S1+' '+ALLTRIM(NAME);
               if Length(Name)>Length_Dolg then Length_Dolg:=Length(Name);
               RAZR:=0;
               OKLAD:=0;
               IF LENGTH(ALLTRIM(RAZRS))>0 THEN
                  BEGIN
                       VAL(RAZRS,RAZR,J1);
                       IF J1<>0 THEN RAZR:=0;
                  END;
               IF LENGTH(ALLTRIM(OKLADS))>0 THEN
                  BEGIN
                       VAL(OKLADS,OKLAD,J1);
                       IF J1<>0 THEN OKLAD:=0;
                  END;
               if j=0 then
                  begin
                       new(DolgRec);
                       DolgRec^.Shifr := ShifrDol;
                       DolgRec^.Razr  := Razr;
                       DolgRec^.Oklad := Oklad;
                       DolgRec^.Name  := DosToWin(NAME);
                       NameDolgList.Add(DolgRec);
                  end;
          end;
        close(dev);
        MAX_COUNT_Dolg:=NAMEDolgLIST.Count;
        COUNT_Dolg:=MAX_COUNT_DOLG;
        FILL_DOLG:=TRUE;
     END;

 FUNCTION FILL_TEMY:BOOLEAN;
   VAR
       j:integer;
       NAME:STRING;
       S1:string[4];
       FNAME:STRING;
       DEV:TEXT;
       SHIFRKAF:WORD;
       TemyRec:PTemyRec;
   BEGIN
        FILL_TEMY:=FALSE;
        FNAME:=CDir+'TEMY.TXT';
        IF NOT FILEEXIST(FNAME) THEN
           BEGIN
                 ShowMessage('Отсутствует файл '+FNAME);
                 FILL_TEMY:=FALSE;
                 EXIT;
           END;
        ASSIGN(DEV,FNAME);
        RESET(DEV);
        FILL_TEMY  := FALSE;
        TEMYLIST:=TTemyLIST.CREATE;
        while not eof(Dev) do
          begin
               {$i-}
               readln(dev,S1,name);
               {$i+}
               NAME:=ALLTRIM(NAME);
               if length(name)<1 then continue;
               val(Alltrim(S1),ShifrKaf,j);
               NAME:=ALLTRIM(NAME);
               if j=0 then
                  begin
                       new(TemyRec);
                       TemyRec^.Shifr := ShifrKaf;
                       TemyRec^.Name  := DosToWin(NAME);
                       TemyList.Add(TemyRec);
                  end;
          end;
        close(dev);
        FILL_TEMY:=TRUE;
     END;
(*
 FUNCTION FILL_PENS:BOOLEAN;
   const L=10;
   VAR
       I,j:integer;
       S,S1,S2,S3,s4:STRING[80];
       SHIFR_POD:WORD;
       FNAME:STRING;
       DEV:TEXT;
       Add,LOW,UPPER,PROC:REAL;
       LineNo:Integer;
       PensRec:PPensRec;
   BEGIN
        Exit;
        FNAME:=CDir+'PENSPROC.TXT';
        IF NOT FILEEXIST(FNAME) THEN
           BEGIN
                 Error('Отсутствует файл '+FNAME);
                 FILL_PENS:=FALSE;
                 EXIT;
           END;
        ASSIGN(DEV,FNAME);
        RESET(DEV);
        FILL_PENS  := FALSE;
        PensLIST:=TPensLIST.CREATE;
        LineNo:=0;
        while not eof(Dev) do
          begin
               {$i-}
               readln(dev,s);
               {$i+}
               if pos('Лимит',S)>0 then
                  begin
                        S1:=copy(s,1,L);
                        val(S1,Proc,I);
                        if i=0 then
                           if Proc>1500 then
                              if Proc < 10000 then
                                 LIMITFORPENS:=Proc;
                  end
                                   else
                  begin
                       if length(s)<l*4 then continue;
                       s1:=copy(s,1,L);
                       s2:=copy(s,L+1,L);
                       s3:=copy(s,2*L+1,L);
                       s4:=copy(s,3*L+1,L);
                       val(S1,Add,I);
                       if i<>0         then continue;
                       val(S2,Low,I);
                       if i<>0         then continue;
                       val(S3,Upper,I);
                       if i<>0         then continue;
                       val(S4,Proc,I);
                       if i<>0         then continue;
                       if Upper<Low    then continue;
                       if (proc<0.01) or (proc>100.01) then continue;
                       if Low<-0.001   then continue;
                       if Upper<-0.001 then continue;
                       if Low>1e8      then continue;
                       if Upper>1e8    then continue;
                       new(PensRec);
                       PensRec^.Add      := Add;
                       PensRec^.Low      := Low;
                       PensRec^.Upper    := Upper;
                       PensRec^.Procent  := Proc;
                       PensList.Add(PensRec);
                  end;
          end;
        close(dev);
        FILL_PENS:=TRUE;
     END;
*)

FUNCTION FILL_PENS(START_MONTH:INTEGER):BOOLEAN;
   const L=10;
   VAR
       I,j:integer;
       S,S1,S2,S3,s4:STRING[80];
       SHIFR_POD:WORD;
       FNAME:STRING;
       DEV:TEXTFILE;
       Add,LOW,UPPER,PROC:REAL;
       LineNo  : Integer;
       PensRec : PPensRec;
   BEGIN
        Exit;
        STR(Start_Month,S);
        S:=AllTrim(S);
        if Start_month<10 then S:='0'+S;
        FName:=CDir+'PENSPR'+S+'.TXT';
        IF NOT FileExist(FName) THEN
           BEGIN
                 Error('Отсутствует файл '+FName);
                 Fill_Pens:=FALSE;
                 Exit;
           END;
        Assign(Dev,FName);
        Reset(Dev);
        Fill_Pens := false;
        if Assigned(PensList) then PensList.Free;
        PensList:=TPensList.Create;
        Curr_Pens_Month:=Start_Month;
        LineNo:=0;
        while not eof(Dev) do
          begin
               {$i-}
               readln(dev,s);
               {$i+}
               if pos('Лимит',DosToWin(S))>0 then
                  begin
                        S1:=copy(s,1,L);
                        val(S1,Proc,I);
                        if i=0 then
                           if Proc>1500 then
                              if Proc < 100000 then
                                 LimitForPens:=Proc;
                  end
                                   else
                  begin
                       if length(s)<l*4 then continue;
                       s1:=copy(s,1,L);
                       s2:=copy(s,L+1,L);
                       s3:=copy(s,2*L+1,L);
                       s4:=copy(s,3*L+1,L);
                       val(S1,Add,I);
                       if i<>0 then continue;
                       val(S2,Low,I);
                       if i<>0 then continue;
                       val(S3,Upper,I);
                       if i<>0 then continue;
                       val(S4,Proc,I);
                       if i<>0 then continue;
                       if Upper<Low then continue;
                       if (proc<0.01) or (proc>100.01) then continue;
                       if Low<-0.001 then continue;
                       if Upper<-0.001 then continue;
                       if Low>1e8 then continue;
                       if Upper>1e8 then continue;
                       new(PensRec);
                       PensRec^.Add      := Add;
                       PensRec^.Low      := Low;
                       PensRec^.Upper    := Upper;
                       PensRec^.Procent  := Proc;
                       PensList.Add(PensRec);
                  end;
          end;
        CloseFile(dev);
        Fill_Pens:=TRUE;
     END;



FUNCTION FILL_BuhAccesBayList:boolean;
 var ShifrPod : integer;
     ItemRec : PItemRec;
 begin
      Result := false;
      if Assigned(BuhAccesBayList) then
         BuhAccesBayList.Free;
      BuhAccesBayList:=TBuhAccesBayList.Create;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('SELECT ShifrPod FROM PR_GET_BUH_ACC_PODR');
      FIB.pFIBQuery.Transaction.StartTransaction;
      try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.eof do
           begin
                ShifrPod   := FIB.pFIBQuery.Fields[0].AsINTEGER;
                New(ItemRec);
                ItemRec^.Month := ShifrPod;
                ItemRec^.Year  := 0;
                BuhAccesBayList.Add(ItemRec);
                FIB.pFIBQuery.Next;
           end;
         Result:=true;
      except
       on EDatabaseError do
          begin
               ShowMessage('Ошибка создания списка подразделений для доступа бухгалтера ');
               Result:=false;
          end
      end;
      FIB.pFIBQuery.Transaction.Commit;
      FIB.pFIBQuery.Close;
{      ShifrPod:=BuhAccesBayList.Count;}
 end;

function Fill_BuhBayList:boolean;
 var ShifrPod : integer;
     ItemRec : PItemRec;
 begin
      Result := false;
      if Assigned(BuhBayList) then
         BuhBayList.Free;
      BuhBayList:=TBuhAccesBayList.Create;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('SELECT ShifrPod FROM PR_GET_BUH_BAY_PODR_LIST');
      FIB.pFIBQuery.Transaction.StartTransaction;
      try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.eof do
           begin
                ShifrPod   := FIB.pFIBQuery.Fields[0].AsINTEGER;
                New(ItemRec);
                ItemRec^.Month := ShifrPod;
                ItemRec^.Year  := 0;
                BuhBayList.Add(ItemRec);
                FIB.pFIBQuery.Next;
           end;
         Result:=true;
      except
       on EDatabaseError do
          begin
               ShowMessage('Ошибка создания списка подразделений для бухгалтера ');
               Result:=false;
          end;
      end;
      FIB.pFIBQuery.Transaction.Commit;
      FIB.pFIBQuery.Close;
      ShifrPod:=BuhBayList.Count;
 end;

 function Fill_BuhDopList:boolean;
 var ShifrPod : integer;
     ItemRec : PItemRec;
 begin
      Result := false;
      if Assigned(BuhDopPodrList) then
         BuhDopPodrList.Free;
      BuhDopPodrList:=TBuhAccesBayList.Create;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('SELECT ShifrPod FROM PR_GET_BUH_DOP_PODR_LIST');
      FIB.pFIBQuery.Transaction.StartTransaction;
      try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.eof do
           begin
                ShifrPod   := FIB.pFIBQuery.Fields[0].AsINTEGER;
                New(ItemRec);
                ItemRec^.Month := ShifrPod;
                ItemRec^.Year  := 0;
                BuhDopPodrList.Add(ItemRec);
                FIB.pFIBQuery.Next;
           end;
         Result:=true;
      except
       on EDatabaseError do
          begin
               ShowMessage('Ошибка создания списка дополнительных подразделений для бухгалтера ');
               Result:=false;
          end;
      end;
      FIB.pFIBQuery.Transaction.Commit;
      FIB.pFIBQuery.Close;
      ShifrPod:=BuhDopPodrList.Count;
 end;

function Fill_SecretTabnoList:boolean;
 var ShifrPod : integer;
     ItemRec : PItemRec;
 begin
      Result := false;
      if Assigned(SecretTabnoList) then
         SecretTabnoList.Free;
      SecretTabnoList:=TBuhAccesBayList.Create;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('SELECT tabno FROM PR_GET_SECRETWORKER_LIST');
      FIB.pFIBQuery.Transaction.StartTransaction;
      try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.eof do
           begin
                ShifrPod   := FIB.pFIBQuery.Fields[0].AsINTEGER;
                New(ItemRec);
                ItemRec^.Month := ShifrPod;
                ItemRec^.Year  := 0;
                SecretTabnoList.Add(ItemRec);
                FIB.pFIBQuery.Next;
           end;
         Result:=true;
      except
       on EDatabaseError do
          begin
               ShowMessage('Ошибка создания списка секретных таб.номеров ');
               Result:=false;
          end;
      end;
      FIB.pFIBQuery.Transaction.Commit;
      FIB.pFIBQuery.Close;
      ShifrPod:=SecretTabnoList.Count;
 end;

 function Fill_BuhList:boolean;
 var ShifrBuh : integer;
     FIO      : string;
     ItemRec : PTemyRec;
 begin
      Result := false;
      if Assigned(BuhList) then
         BuhList.Free;
      BuhList:=TTemyList.Create;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('SELECT ShifrWrk,FIOOP FROM OPERATORY WHERE SHIFRPRA=2 and shifrwrk not in (12,15)');
      FIB.pFIBQuery.Transaction.StartTransaction;
      try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.eof do
           begin
                ShifrBuh   := FIB.pFIBQuery.Fields[0].AsINTEGER;
                FIO        := FIB.pFIBQuery.Fields[1].AsString;
                New(ItemRec);
                ItemRec^.Shifr := ShifrBuh;
                ItemRec^.Name  := FIO;
                BuhList.Add(ItemRec);
                FIB.pFIBQuery.Next;
           end;
         Result:=true;
      except
       on EDatabaseError do
          begin
               ShowMessage('Ошибка создания списка участков ');
               Result:=false;
          end;
      end;
      FIB.pFIBQuery.Transaction.Commit;
      FIB.pFIBQuery.Close;
      ShifrBuh:=BuhList.Count;
 end;

function Fill_SSLimity:Boolean;
 var y,m:Integer;
     SQLStmnt,S:string;
     MinSal,ProgMin,LimitECB:Real;
     SSLimityRec:PSSLimityRec;
 begin
      SSLimityList:=TSSLimityList.Create;
      for y:=CURRYEAR-1 to CURRYEAR+1 do
          for m:=1 to 12 do
              begin
                   s:=IntToStr(y)+'-'+IntToStr(m)+'-01';
                   SQLStmnt:='SELECT first 1 a.minsal,a.progmin,a.limitmax FROM sslimity  a';
                   SQLStmnt:=trim(SQLStmnt)+' where cast(extract(year from a.datefr)||''-''||extract(month from a.datefr)||''-1'' as date)<=cast('''+s+''' as date)';
                   SQLStmnt:=trim(SQLStmnt)+' order by a.datefr desc';
                   FIB.pFIBQuery.SQL.Clear;
                   FIB.pFIBQuery.SQL.Add(SQLStmnt);
                   FIB.pFIBQuery.Transaction.StartTransaction;
                   FIB.pFIBQuery.ExecQuery;
                   MinSal   := FIB.pFIBQuery.Fields[0].AsFloat;
                   ProgMin  := FIB.pFIBQuery.Fields[1].AsFloat;
                   LimitECB := FIB.pFIBQuery.Fields[2].AsFloat;
                   FIB.pFIBQuery.Close;
                   FIB.pFIBQuery.Transaction.Commit;
                   New(SSLimityRec);
                   SSLimityRec.m:=m;
                   SSLimityRec.y:=y;
                   SSLimityRec.MinSal  := MinSal;
                   SSLimityRec.ProgMin := ProgMin;
                   SSLimityRec.LimitForECB := LimitECB;
                   SSLimityList.Add(SSLimityRec);
              end;

 end;


function compareBanki(p1,p2:Pointer):Integer;
 var retVal:integer;
 begin
      if pShifrRec(p1).Shifr>pShifrRec(p2).Shifr then retVal:=1
      else
      if pShifrRec(p1).Shifr<pShifrRec(p2).Shifr then retVal:=-1
      else retVal:=0;
      compareBanki:=retVal;

 end;
function Fill_Banki_List:boolean;
 var
    SHIFRBAN   : INTEGER;
    Name       : String;
    Dirbank    : string;
    ShifrSta   : Integer;
    BankRec    : PShifrRec;
    I          : integer;
 begin
      Fill_Banki_List:=false;
      BankiList:=TBankiList.Create;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('SELECT id,NAME,bankdir,shifrsta FROM tb_BANKI ORDER BY id');
      FIB.pFIBTransactionSAL.StartTransaction;
      try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.eof do
            begin
                 SHIFRBAN  := FIB.pFIBQuery.Fields[0].AsINTEGER;
                 NAME      := FIB.pFIBQuery.Fields[1].AsString;
                 DirBank   := FIB.pFIBQuery.Fields[2].AsString;
                 ShifrSta  := FIB.pFIBQuery.Fields[3].AsInteger;
                 New(BankRec);
                 BankRec^.Shifr      := shifrban;
                 BankRec^.Long_Name  := Name;
                 BankRec^.Short_Name := DirBank;
                 BankRec^.Attrib     := ShifrSta;
                 BankiList.Add(BankRec);
                 FIB.pFIBQuery.Next;
            end;
         FIB.pFIBQuery.Close;
      except
           MessageDlg('Ошибка Fill_Banki_List ',mtInformation, [mbOk], 0);
           FIB.pFIBQuery.Close;
           FIB.pFIBQuery.Transaction.Commit;
           kz:=-1;
           Exit;
      end;
      if FIB.pFIBQuery.Open then
         FIB.pFIBQuery.Close;
      if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
      BankiList.Sort(@CompareBanki);
      Fill_Banki_List:=true;
 end;


 end.
