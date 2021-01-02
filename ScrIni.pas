                   
unit ScrIni;

interface
//PROCEDURE INIT_DIR_NAME;
PROCEDURE INIT_DIR_NAME(wantedMainDir:string='');
PROCEDURE INIT_KAT_IST;
PROCEDURE INIT_LABEL;
PROCEDURE GET_FLOW_MONTH;
procedure InitMain;
PROCEDURE SAVE_PCK(WantedRow:integer);
PROCEDURE LOAD_PCK(VAR WantedTabno,WantedWR:INTEGER);
PROCEDURE INIT_PODOH_2004(DEST_MONTH:INTEGER;DEST_YEAR:INTEGER);
PROCEDURE INI_W_DAY;
PROCEDURE INIT_DAY_KOD;
procedure Save_Pck_To_Register(WantedRow:integer);
procedure Load_Pck_Fr_Register(VAR WantedServ,WantedTabno,WantedWR:INTEGER;var Dolg:string);
procedure Delete_Pck_From_Register;
procedure Delete_LoginSal_From_Register;
//procedure INIT_MIN_SALARY;
PROCEDURE INIT_ECB_2011;
procedure SetFormatSummaPltCharacter;
procedure SetTmpSaveFileMode;
PROCEDURE InitInitialParamentersFromIniFile;

function Fill_Oklady_Razr_From_SQL:boolean;




implementation
  Uses SysUtils,QDialogs,ScrDef,ScrUtil,IniFiles,UFibModule,FORMS,SCrLists,
       Registry,Windows,ScrNetwork;

PROCEDURE INIT_DIR_NAME(wantedMainDir:string='');
 VAR DEV:TEXT;
     DIR:STRING;
     I,J:INTEGER;
     KOD:WORD;
     DONE:BOOLEAN;
     D:BYTE;
     CURR_DIR:STRING;
     DRIVE:CHAR;
     CURR_DRIVE:BYTE;
     SavPath,S,SS:string;
     neededDrive:string;
 BEGIN
       neededDrive:=getMainDataDrive;
       s:=getIniFileName;
       kz:=0;
       if isParameterIskra then
          modeIskra:=true;
       GETDIR(0,CURR_DIR);
       I:=Length(Curr_Dir);
       SS:=COPY(CURR_DIR,4,I);
       for j:=length(SS) downto 1 do
           if sS[j]='\' then break;
       if j>1 then SS:=copy(SS,1,j-1);
{
       j:=pos('\',S);
       if j>0 then Delete(S,j,i);
}
       MainDir:=neededDrive+'\'+SS;
  {     MAINDIR  := COPY(CURR_DIR,3,I-6);}
       if Length(Trim(wantedMainDir))>0 then
          if DirectoryExists(wantedMainDir) then
             MainDir:=wantedMainDir;
       CDIR     := MAINDIR+'\CONST\';
       if modeIskra then DDIR     := MAINDIR+'\DATAISKR\'
       else
           DDIR     := MAINDIR+'\DATA\';
       BDIR     := MAINDIR+'\BAK\';
       CDOC     := MAINDIR+'\RPT\';
       IDIR     := MAINDIR+'\ILL\';
       CLAR_DIR := MAINDIR+'\CLARION\';
       WDIR     := 'C:\WORK\';
       ADIR     := MAINDIR+'\AWANS\';
       CUDIR    := MAINDIR+'\CUPONY\';
       OTP_DIR  := MAINDIR+'\OTP_ARC\';
       POD_DIR  := MAINDIR+'\PODOH\';
       BANK_DIR := MAINDIR+'\BANK\';
       CMEM     := CDIR+'MEMORY\';
       TemplateDIR := MAINDIR+'\TEMPLATE\';
       tmpDir   := ddir;
       Local_Dir:= CDIR;
       NET_DIR := DDIR;
       GETDIR(0,CURR_DIR);
       if Length(Trim(wantedMainDir))<1 then
          begin
       IF FILEEXIST(MainDir+'\EXE\DIRECT.TXT') THEN
          BEGIN
               ASSIGN(DEV,MainDir+'\EXE\DIRECT.TXT');
               RESET(DEV);
               I:=0;
               DONE:=FALSE;
               WHILE (NOT EOF(DEV)) AND (NOT DONE) DO
                BEGIN
                     INC(I);
                     IF I>16 THEN DONE:=TRUE
                             ELSE
                        BEGIN
                             {$I-}
                             READLN(DEV,DIR);
                             KOD:=IORESULT;
                             {$I+}
                             IF KOD<>0 THEN
                                BEGIN
                                     ShowMessage('Ошибка при чтение из файла DIRECT.TXT. Код ошибки '+INTtostr(KOD)+'.');
                                     DONE:=TRUE
                                END
                                       ELSE
                                BEGIN
                                     DIR:=ALLTRIM(COPY(DIR,1,38));
                                     IF COPY(DIR,2,1)<>':' THEN
                                        BEGIN
                                             ShowMessage('Неверно задан путь к данным в файле DIRECT.TXT в строке '+IntToStr(I)+'-');
                                             HALT;
                                        END;
                                     IF (ORD(UPCASE(DIR[1]))<ORD('A')) OR
                                        (ORD(UPCASE(DIR[1]))>ORD('Z')) THEN
                                        BEGIN
                                             ShowMessage('Неверно задан дисковод в файле DIRECT.TXT в строке '+INTTOSTR(I)+'-');
                                             HALT;
                                        END;
                            //         if (Ord(UPCASE(DIR[1]))=ORD('I')) then
                            //            begin
                            //                 ShowMessage('Воспользуйстесь программой с нового сервера...');
                            //                 Halt;
                            //            end;
                                     CASE I OF
                                      1: CDIR     := ALLTRIM(DIR)+'\';
                                      2: BEGIN
                                              DDIR       := ALLTRIM(DIR)+'\';
                                              if modeIskra then
                                                 DDIR:=StringReplace(DDIR,'DATA','DATAISKR',[rfIgnoreCase]);
                                              DRIVE      := UPCASE(DIR[1]);
                                              GetDir(0,SavPath);
                                              {$I-}
                                              ChDir(DRIVE+':');
                                              {$I+}
                                              if IoResult<>0 then
                                                 begin
                                                      ShowMessage('Сервер не отвечает. ');
                                                      ShowMessage('Запустите сеть или перейдите в однопользовательский режим');
                                                      HALT;
                                                 end;
                                              NET_DRIVE  := ORD(DRIVE)-ORD('A')+1;
                                         END;
                                      3: BDIR     := ALLTRIM(DIR)+'\';
                                      4: CDOC     := ALLTRIM(DIR)+'\';
                                      5: CLAR_DIR := ALLTRIM(DIR)+'\';
                                      6: IDIR     := ALLTRIM(DIR)+'\';
                                      7: ADIR     := ALLTRIM(DIR)+'\';
                                      8: WDIR     := ALLTRIM(DIR)+'\';
                                      9: CUDIR    := ALLTRIM(DIR)+'\';
                                     10: OTP_DIR  := ALLTRIM(DIR)+'\';
                                     11: POD_DIR  := ALLTRIM(DIR)+'\';
                                     12: NET_DIR  := ALLTRIM(DIR)+'\';
                                     13: FLAG_DIR := ALLTRIM(DIR)+'\';
                                     14: BANK_DIR := ALLTRIM(DIR)+'\';
                                     15: LOCAL_DIR := ALLTRIM(DIR)+'\';
                                     16: Templatedir := ALLTRIM(DIR)+'\';
                                     ELSE
                                       BEGIN
                                            ShowMessage('Слишком много строк в файле DIRECT.TXT');
                                            HALT;
                                       END;
                                     END;
{                                     GETDIR(D,CURR_DIR);}
                                     {$I-}
{                                     if DirectoryExists(Dir); }
{                                     CHDIR(ALLTRIM(DIR));}
                                     {$i+}
{                                     IF IORESULT<>0 THEN }
                                     IF not DirectoryExists(Dir) THEN
                                         BEGIN
                                             ShowMessage('Неверный путь ->'+alltrim(dir));
                                             {$I-}
                                             MKDIR(ALLTRIM(DIR));
                                             {$i+}
                                             IF IORESULT<>0 THEN
                                                BEGIN
                                                     ShowMessage('Ошибка задания пути '+ALLTRIM(DIR)+'. В файле DIRECT.TXT');
                                                     CHDIR(CURR_DIR);
                                                     HALT;
                                                END;
                                        END;
                                        CHDIR(CURR_DIR);
                                END;
                        END

                END;
               CLOSE(DEV);
               tmpDir:=DDIR;
          END
                                  ELSE
          BEGIN
               ShowMessage('Отсутствует файл DIRECT.TXT в каталоге '+MainDir+'\EXE');
               HALT;
          END;
      end;    
 END;


{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }

    function Fill_Gruppy_From_SQL:boolean;
     var
        SHIFR      : INTEGER;
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
        MO_ISKRA   : Integer;
        ShifrGruM  : Integer;
        PodrRec    : PPodrRec;
        I,KK       : integer;
        ACTIVE     : integer;
     begin
           Fill_Gruppy_From_SQL:=false;
           KK:=0;
           GruppyList:=TGruppyList.Create;
           FIB.pFIBQuery.SQL.Clear;
           FIB.pFIBQuery.SQL.Add('SELECT SHIFR,NAME,MO_BUD,MO_VNE,MO_KOL_BUD,');
           FIB.pFIBQuery.SQL.Add('MO_KOL_VNE,MO_GN,MO_NIS,MO_MAG_BUD,MO_MAG_VNE,MO_MP,MO_ISKRA,SHIFRGRUM,ACTIVE ');
           FIB.pFIBQuery.SQL.Add('FROM GRUPPY ORDER BY SHIFR');
           FIB.pFIBTransactionSAL.StartTransaction;
           try
               FIB.pFIBQuery.ExecQuery;
               while not FIB.pFIBQuery.eof do
                begin
                     SHIFR      := FIB.pFIBQuery.Fields[0].AsINTEGER;
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
                     MO_ISKRA   := FIB.pFIBQuery.Fields[11].AsINTEGER;
                     SHIFRGRUM  := FIB.pFIBQuery.Fields[12].AsINTEGER;
                     ACTIVE     := FIB.pFIBQuery.Fields[13].AsINTEGER;
                     New(Podrrec);
                     PodrRec^.Selected   := false;
                     PodrRec^.Shifr      := SHIFR;
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
                     if MO_ISKRA=1   then PodrRec^.MO_ISKRA := true
                                     else PodrRec^.MO_ISKRA := false;
                     if ACTIVE=1     then PodrRec^.ACTIVE := true
                                     else PodrRec^.ACTIVE := false;
                     PodrRec^.ShifrGruM := ShifrGrum;
{                       PodrRec^.Name  := NAME;}
                     GruppyList.Add(PodrRec);
                     Inc(KK);
                     ist_fin_name[kk]:=name;
                     FIB.pFIBQuery.Next;
                end;
               FIB.pFIBQuery.Close;
           except
             on E:Exception do
                begin
                     MessageDlg('Ошибка Fill_Gruppy_SQL ',mtInformation, [mbOk], 0);
                     Fill_Gruppy_From_SQL:=false;
                     Kz:=-1;
                     Exit;
                end;
           end;
           FIB.pFIBTransactionSAL.Commit;
           Fill_Gruppy_From_SQL:=true;
           max_ist_fin:=kk;
           if GruppyList.Count>MAX_GRUPPa then
              begin
                   ShowMessage(' Счетов должно быть не более '+intToStr(max_gruppa));
              end;
     end;


    function Fill_Kateg_From_SQL:boolean;
     var
        SHIFR      : INTEGER;
        Name       : String;
        ShortName  : String;
        PodrRec    : PPodrRec;
        I,KK       : integer;
     begin
           Fill_Kateg_From_SQL:=false;
           KK:=0;
           KategList:=TServList.Create;
           FIB.pFIBQuery.SQL.Clear;
           FIB.pFIBQuery.SQL.Add('SELECT SHIFR,NAME,SHORTNAME ');
           FIB.pFIBQuery.SQL.Add('FROM KATEG ORDER BY SHIFR');
           FIB.pFIBTransactionSAL.StartTransaction;
           try
               FIB.pFIBQuery.ExecQuery;
               while not FIB.pFIBQuery.eof do
                begin
                     SHIFR      := FIB.pFIBQuery.Fields[0].AsINTEGER;
                     NAME       := FIB.pFIBQuery.Fields[1].AsString;
                     SHORTNAME  := FIB.pFIBQuery.Fields[2].AsString;
                     New(Podrrec);
                     PodrRec^.Selected   := false;
                     PodrRec^.Shifr      := SHIFR;
                     PodrRec^.Name       := NAME;
                     PodrRec^.MO_BUD     := false;
                     PodrRec^.MO_VNE     := false;
                     PodrRec^.MO_KOL_BUD := false;
                     PodrRec^.MO_KOL_VNE := false;
                     PodrRec^.MO_GN      := false;
                     PodrRec^.MO_NIS     := false;
                     PodrRec^.MO_MAG_BUD := false;
                     PodrRec^.MO_MAG_VNE := false;
                     PodrRec^.MO_MP      := false;
                     KategList.Add(PodrRec);
                     Inc(KK);
                     kat_name[kk]:=name;
                     kat_short_name[kk]:=ShortName;
                     FIB.pFIBQuery.Next;
                end;
               FIB.pFIBQuery.Close;
           except
               MessageDlg('Ошибка Fill_Podr_SQL ',mtInformation, [mbOk], 0);
               Fill_Kateg_From_SQL:=false;
               Kz:=-1;
               Exit;
           end;
           FIB.pFIBTransactionSAL.Commit;
           Fill_Kateg_From_SQL:=true;
           max_kategorija:=kk;
     end;

    function Fill_Oklady_Razr_From_SQL:boolean;
     var
        Razr       : INTEGER;
        Oklad      : Real;
        SQLStmnt   : string;
     begin
           Fill_Oklady_Razr_From_SQL:=false;
           SQLStmnt:='select a.razr, a.oklad from tb_razr_proc a';
           SQLStmnt:=trim(SQLStmnt)+' where a.datefr=(select max(b.datefr) from tb_razr_proc b)';
           SQLStmnt:=trim(SQLStmnt)+' and a.razr between 1 and 25';
           SQLStmnt:=trim(SQLStmnt)+' order by a.razr';
           FIB.pFIBQuery.SQL.Clear;
           FIB.pFIBQuery.SQL.Add(SQLStmnt);
           FIB.pFIBTransactionSAL.StartTransaction;
           try
               FIB.pFIBQuery.ExecQuery;
               while not FIB.pFIBQuery.eof do
                begin
                     Razr      := FIB.pFIBQuery.Fields[0].AsINTEGER;
                     Oklad     := FIB.pFIBQuery.Fields[1].AsFloat;
                     OkladyRazr[Razr]:=Oklad;
                     FIB.pFIBQuery.Next;
                end;
               FIB.pFIBQuery.Close;
           except
               MessageDlg('Ошибка Fill_Oklady_Razr_SQL ',mtInformation, [mbOk], 0);
               Fill_Oklady_Razr_From_SQL:=false;
               Kz:=-1;
               Exit;
           end;
           FIB.pFIBTransactionSAL.Commit;
           Fill_Oklady_Razr_From_SQL:=true;
     end;


PROCEDURE INIT_KAT_IST;
var DEV:text;
   ii,kk,i:integer;
   c:char;
   s,s1:string;
   FNAME:STRING;
begin
  KZ:=0;
  if not Fill_Kateg_From_SQL then
     begin
          Kz:=-1;
          Exit;
     end;
  if Kz<0 then Exit;
  if not Fill_Gruppy_From_SQL then
     begin
          Kz:=-1;
          Exit;
     end;
  if Kz<0 then Exit;
  Exit;
  FNAME:=CDIR+'KAT_IST.TXT';
  IF NOT FILEEXIST(FNAME) THEN
     BEGIN
          Scrutil.ERROR('Отсутствует файл KAT_IST.TXT');
          KZ:=-1;
     END;
  assign(DEV,FNAME);
  reset(DEV);
  READLN(DEV,ORG_NAME);
  readln(DEV,GL_BUH_DOLG_NAME);
  GL_BUH_DOLG_NAME:=DosToWin(GL_BUH_DOLG_NAME);
  readln(DEV,DIREKTOR_DOLG_NAME);
  DIREKTOR_DOLG_NAME:=DosToWin(DIREKTOR_DOLG_NAME);
  readln(DEV,NAME_PODR[1]);
  readln(DEV,KADRYNAme);
  readln(Dev,STORONNEE_PODR);
  ii:=Nomer_Serv(Storonnee_Podr);
  if (ii<1) or (ii>count_serv) then
     begin
           ScrUtil.error('В KAT_IST.TXT.-Неверный номер стороннего подразделения '+IntToStr(Storonnee_Podr));
           close(dev);
           Halt(0);
     end;
  ii:=0;kk:=0;
  while not eof(DEV) do begin
    read(DEV,c);
    case c of
    '1': begin
              INC(II);
              readln(DEV,kat_name[ii]);
              kat_name[ii]:=DosToWin(kat_name[ii]);
         end;
    '2','3': begin
               INC(KK);
               readln(DEV,S);
               s:=DosToWin(S);
               s:=AllTrim(S);
               i:=pos(' ',S);
               if (i>1) and (i<length(s)) then
                 begin
                      S1:=AllTrim(copy(s,i+1,100));
                      if length(S1)=0 then
                         begin
                              Str(kk,S1);
                              S1:=AllTrim(S1);
                         end;
                      s:=AllTrim(copy(s,1,i-1));
                 end;
               ist_fin_name[kk]:=S;
               S1:=ALLTRIM(S1);
               S1:=UPPER_STRING(S1);
               I:=POS('.TXT',S1);
               IF I>0 THEN DELETE(S1,I,4);
               ist_fin_plt_name[kk]:=s1;
{               ERROR(ist_fin_plt_name[kk]);}
               if c='2' then home_tema:=kk{+1};
             end;
    else halt(1);
    end;
  end;
  max_kategorija:=ii;
  max_ist_fin:=kk;
  close(DEV)
END;

PROCEDURE INIT_LABEL;
var DEV:textfile;
   FNAME:STRING;
begin
  KZ:=0;
  FNAME:=CDIR+'LABEL.TXT';
  IF modeIskra then
     FName:=CDIR+'LABEL_I.TXT';

  IF NOT FILEEXIST(FNAME) THEN
     BEGIN
          Scrutil.ERROR('Отсутствует файл '+FNAME);
          KZ:=-1;
     END;
  assignfile(DEV,FNAME);
  try
     reset(DEV);
  except
     else
        begin
             Scrutil.Error('Ошибка открытия файла '+TRIM(FNAME));
             KZ:=-1;
             Exit;
        end;
  end;
  try
     READLN(DEV,ORG_NAME);
     readln(DEV,DIREKTOR_DOLG_NAME);
     readln(DEV,GL_BUH_DOLG_NAME);
  except
    else
        begin
             ScrUtil.Error('Ошибка чтения файла '+TRIM(FNAME));
             KZ:=-1;
             Exit;
        end;
  end;
  CloseFile(DEV);
  ORG_NAME:=DosToWin(ORG_NAME);
  GL_BUH_DOLG_NAME:=DosToWin(GL_BUH_DOLG_NAME);
  DIREKTOR_DOLG_NAME:=DosToWin(DIREKTOR_DOLG_NAME);
END;


{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
PROCEDURE GET_FLOW_MONTH;
 VAR DEV:TEXT;
     I:INTEGER;
     R:STRING;
     WORK_Y:WORD;
FUNCTION CONV_MONTH(R_MONTH:STRING):INTEGER;
 VAR I,L:INTEGER;
     S:STRING;
 BEGIN
     L:=LENGTH(R_MONTH);
     S:='';
     FOR I:=1 TO L DO
         CASE R_MONTH[I] OF
          'p' : S:=S+'р';
          'P' : S:=S+'Р';
          'C' : S:=S+'С';
          'c' : S:=S+'с';
          'A' : S:=S+'А';
          'a' : S:=S+'а';
          'K' : S:=S+'К';
          'k' : S:=S+'к';
          'E' : S:=S+'Е';
          'e' : S:=S+'е';
           ELSE S:=S+R_MONTH[I];
         END;
     CONV_MONTH:=1;
     I:=0;
     WHILE I<12 DO
       BEGIN
           INC(I);
{
           ERROR(' S='+S+' MONTH[I]='+MONTH[I]);
}
           IF (S=MONTH[I]) or (DosToWIn(S)=MONTH[I]) THEN
              BEGIN
                   CONV_MONTH:=I;
                   EXIT;
              END;
       END;
     ScrUtil.ERROR('Не верно указан месяц '+ALLTRIM(S)+' в файле YEAR.TXT');
{     MAKE_WORK_MONTH;      }
     CONV_MONTH:=NMES;
  END;
 BEGIN
     ASSIGN(DEV,CDIR+'YEAR.TXT');
     IF NOT FILEEXIST(CDIR+'YEAR.TXT') THEN
         BEGIN
               ScrUtil.ERROR('ОТСУТСТВУЕТ ТЕКУЩАЯ ДАТА');
               FLOW_MONTH:=1;
               FLOW_YEAR:='1993';
         END
                    ELSE
         BEGIN
               RESET(DEV);
               READLN(DEV,FLOW_YEAR);
               WORK_YEAR:=FLOW_YEAR;
               VAL(FLOW_YEAR,WORK_Y,I);
               IF I<>0 THEN ScrUtil.ERROR('Неправильно задан год в файле ..\CONST\YEAR.TXT');
               CURRYEAR:=WORK_Y;
               WORK_YEAR_VAL:=CURRYEAR;
               READLN(DEV,R);
    //           R:=DosToWin(R);
               C_FLOW_MONTH:=ALLTRIM(R);
               FLOW_MONTH:=CONV_MONTH(C_FLOW_MONTH);
               NMES:=FLOW_MONTH;
               CLOSE(DEV);
         END;
 END;
{ ***************************************************** }
{ *                LOAD_PCK                           * }
{ ***************************************************** }
procedure LOAD_PCK_SQL(VAR WantedTabno,WantedWR:INTEGER);
 var I:Integer;
 begin
       WantedTabno:=0;
       WantedWR:=0;
       i:=GetShifrWrk;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('SELECT shifrpod,tabno,w_r FROM pr_getpick('+IntToSTr(I)+')');
       FIB.pFIBTransactionSAL.StartTransaction;
       try
          FIB.pFIBQuery.ExecQuery;
          NSRV        := FIB.pFIBQuery.Fields[0].AsInteger;
          WantedTabno := FIB.pFIBQuery.Fields[1].AsInteger;
          WantedWR    := FIB.pFIBQuery.Fields[2].AsInteger;
       except
{
           ShowMessage('Нет доступа к просмотру подразделений');
           KZ:=-1;
           FIB.pFIBTransactionSAL.Commit;
           Exit;
}
       end;
       FIB.pFIBTransactionSAL.Commit;
       if (NSRV<1) or (NSRV>MAX_COUNT_PODRAZD) then
           NSRV:=1;
       if (WantedTabno<1) or (WantedTabno>12000) then WantedTabno:=0;
       if (WantedWR<1) or (WantedWR>2) then WantedWR:=0;
 end;


PROCEDURE LOAD_PCK(VAR WantedTabno,WantedWR:INTEGER);
 VAR CURFIL,I,I_C:INTEGER;
     CURR_PERSON:PERSON_PTR;
     DEV:TEXT;
     L:BOOLEAN;
     TABNO,WID_RABOTY:INTEGER;
     Ini         : TIniFile;
     SQL_Mode    : Integer;
     SQL_ModeS   : String;
     fName:String;
  BEGIN
      if modeIskra then
         nsrv:=179;
      fName:=getIniFileName;
//      Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
      Ini := TIniFile.Create(fNAme);
      try
         SQL_ModeS := Ini.ReadString( 'Parameters', 'SQLPickMode', '0' );
         if SQL_ModeS='SQL' then SQL_Mode:=1
                            else SQL_Mode:=0;
      finally
         Ini.Free;
      end;
      if SQL_Mode=1 then
         begin
              LOAD_PCK_SQL(WantedTabno,WantedWR);
              Exit;
         end;
       WantedTabno := 0;
       WantedWR    := 0;
       IF FILEEXIST(LOCAL_DIR+'SCROLL.PCK') THEN
          BEGIN
                ASSIGN(DEV,LOCAL_DIR+'SCROLL.PCK');
                RESET(DEV)  ;
                try
                    READLN(DEV,NSRV);
                    READLN(DEV,TABNO);
                    READLN(DEV,WID_RABOTY);
                    CLOSE(DEV)  ;
                except
                      CLOSE(DEV)  ;
                      exit;
                end;
                if (NSRV<1) or (NSRV>MAX_COUNT_PODRAZD) then
                   NSRV:=1;
                if modeIskra then
                   NSRV:=179;
                WantedTabno:=Tabno;
                WantedWR:=WID_RABOTY;
                if (WantedTabno<1) or (WantedTabno>15000) then WantedTabno:=0;
                if (WantedWR<1) or (WantedWR>2) then WantedWR:=0;
          end;
  END;
{ ***************************************************** }
{ *                LOAD_PCK                           * }
{ ***************************************************** }
PROCEDURE SAVE_PCK_SQL(WantedRow:Integer);
 var I,Tabno,W_R : Integer;
     Curr_Person : Person_Ptr;
 begin
       Tabno := 0;
       W_R   := 0;
       IF (WantedRow>0) AND (WantedRow<COUNT_PERSON+1) THEN
          begin
               Curr_Person:=Head_Person;
               i:=0;
               while (Curr_Person<>Nil) do
                begin
                     i:=i+1;
                     if i=WantedRow then
                        begin
                             Tabno:=CURR_PERSON^.TABNO;
                             W_R:=CURR_PERSON^.WID_RABOTY;
                             Break;
                        end;
                     Curr_Person:=Curr_Person^.Next;
                end;
           end;
       I:=GetShifrWrk;
       FIB.pFIBTransactionSAL.StartTransaction;
       FIB.pFIBStoredProcPick.Params[0].AsInteger := I;
       FIB.pFIBStoredProcPick.Params[1].AsInteger := NSRV;
       FIB.pFIBStoredProcPick.Params[2].AsInteger := TABNO;
       FIB.pFIBStoredProcPick.Params[3].AsInteger := W_R;
       FIB.pFIBStoredProcPick.Prepare;
       try
          FIB.pFIBStoredProcPick.ExecProc;
       except
       end;
       FIB.pFIBTransactionSAL.Commit;

 end;

PROCEDURE SAVE_PCK(WantedRow:INTEGER);
 VAR DEV         : TEXT;
     I           : INTEGER;
     CURR_PERSON : PERSON_PTR;
     Ini         : TIniFile;
     SQL_Mode    : Integer;
     SQL_ModeS   : String;
     fNAme       : string;
 BEGIN
      fName:=getIniFileName;
//      Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
      Ini := TIniFile.Create(fNAme);
      try
         SQL_ModeS := Ini.ReadString( 'Parameters', 'SQLPickMode', '0' );
         if SQL_ModeS='SQL' then SQL_Mode:=1
                            else SQL_Mode:=0;
      finally
         Ini.Free;
      end;
      if SQL_Mode=1 then
         begin
              SAVE_PCK_SQL(WantedRow);
              Exit;
         end;
      ASSIGN(DEV,LOCAL_DIR+'SCROLL.PCK');
      IF NSRV IN [1..MAX_COUNT_PODRAZD] THEN
         BEGIN
              REWRITE(DEV);
              WRITELN(DEV,NSRV);
              IF (WantedRow>0) AND (WantedRow<COUNT_PERSON+1) THEN
                 begin
                       Curr_Person:=Head_Person;
                       i:=0;
                       while (Curr_Person<>Nil) do
                             begin
                                   i:=i+1;
                                   if i=WantedRow then
                                      begin
                                           WRITELN(DEV,CURR_PERSON^.TABNO);
                                           WRITELN(DEV,CURR_PERSON^.WID_RABOTY);
                                           Break;
                                      end;
                                   Curr_Person:=Curr_Person^.Next;
                             end

                 end
              else
                    BEGIN
                          WRITELN(DEV,0);
                          WRITELN(DEV,0);
                    END;
              CLOSE(DEV);
         END
                                       ELSE
         ERASE(DEV);
      Save_Pck_To_Register(WantedRow);
 END;


{ ***************************************************** }
{ *                SavePckReg                         * }
{ ***************************************************** }
procedure Save_Pck_To_Register(WantedRow:integer);
 var
    Reg         : TRegIniFile;
    Curr_Person : Person_Ptr;
    I,Tabno,W_R : integer;
    Dolg        : string[10];
    NameOfKey   : string;
 begin
       if modeIskra then Exit;
       NameofKey    := 'Pick';
       Tabno        := 0;
       W_R          := 0;
       Dolg         := '';
       IF (WantedRow>0) AND (WantedRow<COUNT_PERSON+1) THEN
           begin
                Curr_Person:=Head_Person;
                i:=0;
                while (Curr_Person<>Nil) do
                 begin
                      i:=i+1;
                      if i=WantedRow then
                         begin
                              Tabno := Curr_Person^.Tabno;
                              W_R   := Curr_Person^.Wid_Raboty;
                              Dolg  := Curr_Person^.Dolg;
                              Break;
                         end;
                      Curr_Person:=Curr_Person^.Next;
                 end
           end;


       Reg:=TRegIniFile.Create('Salary');
       try
           Reg.RootKey:=HKEY_CURRENT_USER; // Section to look for within the registry
           if Reg.OpenKey(NameofKey,True) then
              begin
                   Reg.WriteInteger('Parameters','NSRV',NSRV);
                   Reg.WriteInteger('Parameters','TABNO',TABNO);
                   Reg.WriteInteger('Parameters','W_R',W_R);
                   Reg.WriteString('Parameters','Dolg',Dolg);
              end;
       finally
         Reg.Free;
       end;
end;
{ ***************************************************** }
{ *                LoadPckReg                         * }
{ ***************************************************** }
procedure Load_Pck_Fr_Register(VAR WantedServ,WantedTabno,WantedWR:INTEGER;var Dolg:string);
 var
    Reg         : TRegIniFile;
    Curr_Person : Person_Ptr;
    I           : integer;
    NameOfKey   : string;
 begin
       if modeIskra then
          begin
                WantedServ   := 179;
                WantedTabno  := 0;
                WantedWR     := 0;
                Dolg         := '';
                Exit;
          end;
       NameofKey    := 'Pick';
       WantedTabno  := 0;
       WantedServ   := 0;
       WantedWR     := 0;
       Dolg         := '';
       Reg:=TRegIniFile.Create('Salary');
       try
           Reg.RootKey:=HKEY_CURRENT_USER; // Section to look for within the registry
           if Reg.OpenKey(NameofKey,false) then
              begin
                   WantedServ  := Reg.ReadInteger('Parameters','NSRV',0);
                   WantedTabno := Reg.ReadInteger('Parameters','TABNO',0);
                   WantedWR    := Reg.ReadInteger('Parameters','W_R',0);
                   Dolg        := Reg.ReadString('Parameters','Dolg','');
              end;
       finally
         Reg.Free;
       end;
       if isSVDN then
          if wantedServ>0 then
          if isProtectedPodr(wantedServ) then
             begin
                  WantedTabno  := 0;
                  WantedServ   := 0;
                  WantedWR     := 0;
                  Dolg         := '';
             end;

end;

{ ***************************************************** }
{ *                DeleteRegistry                     * }
{ ***************************************************** }
procedure Delete_Pck_From_Register;
 var
    Reg         : TRegIniFile;
    Curr_Person : Person_Ptr;
    I,Tabno,W_R : integer;
    Dolg        : string[10];
    NameOfKey   : string;
 begin
       if modeIskra then Exit;
       NameofKey    := 'Pick';

       Reg:=TRegIniFile.Create('Salary');
       try
           Reg.RootKey:=HKEY_CURRENT_USER; // Section to look for within the registry
           Reg.EraseSection(NameofKey);
       finally
         Reg.Free;
       end;
end;


{ ***************************************************** }
{ *                DeleteRegistry                     * }
{ ***************************************************** }
procedure Delete_LoginSal_From_Register;
 var
    Reg         : TRegIniFile;
    NameOfKey   : string;
 begin
       if modeIskra then Exit;
       NameofKey    := 'LoginSal';

       Reg:=TRegIniFile.Create('Salary');
       try
           Reg.RootKey:=HKEY_CURRENT_USER; // Section to look for within the registry
           Reg.EraseSection(NameofKey);
       finally
         Reg.Free;
       end;
end;


{ ***************************************************** }
{ *                InitMain                           * }
{ ***************************************************** }
 procedure InitMain;
  begin
       FillChar(MainScreen,SizeOf(MainScreen),0);
       MainScreen[1].Shifr := Oklad_Shifr;
       MainScreen[1].Add   := true;
       if isSVDN then
          begin
               MainScreen[2].Shifr := DOPL_DO_MIN_SHIFR;
               MainScreen[2].Add   := true;
           //    MainScreen[3].Shifr := DIFFER_SHIFR;
               MainScreen[3].Shifr := BOL_TEK_SHIFR;
               MainScreen[3].Add   := true;
               MainScreen[4].Shifr := L_Shifr;
               MainScreen[4].Add   := true;
               MainScreen[5].Shifr := podoh_Shifr;;
               MainScreen[5].Add   := false;
               MainScreen[6].Shifr := WAR_SBOR_SHIFR;
               MainScreen[6].Add   := false;
            //   MainForm.
          end
       else
          begin
               MainScreen[2].Shifr := ZA_STEP_SHIFR;
               MainScreen[2].Add   := true;
               MainScreen[3].Shifr := ZA_ZWAN_SHIFR;
               MainScreen[3].Add   := true;
               MainScreen[4].Shifr := VYSLUGA_SHIFR;
               MainScreen[4].Add   := true;
               MainScreen[5].Shifr := l_shifr;
               MainScreen[5].Add   := true;
               MainScreen[6].Shifr := podoh_shifr;
               MainScreen[6].Add   := false;
          end;
    //   MainScreen[6].Shifr := ECBDpShifr;
       MainScreen[Nmb_Of_Col_Main_Screen-1].Shifr := M_SHIFR;
       MainScreen[Nmb_Of_Col_Main_Screen-1].Add   := false;
       MainScreen[Nmb_Of_Col_Main_Screen].Shifr := M_SHIFR+1;
       MainScreen[Nmb_Of_Col_Main_Screen].Add   := false;

  end;

{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
 PROCEDURE INIT_PODOH_2004_SQL(DEST_MONTH:INTEGER;DEST_YEAR:INTEGER);
  VAR I,J,COUNT:INTEGER;
      MIN_SALARY_FILE_NAME:STRING;
      A:REAL;
      SQLStmnt,DateS:string;
      Y:integer;
      RetV:Variant;
  BEGIN
       Limit_17_summa:=0;
       Y:=DEST_YEAR;
       if y<2000 then y:=y+1990;
       DateS:=IntToStr(y)+'-'+IntToStr(Dest_Month)+'-01';
       SQLStmnt:='select first 1 SUMMALGOTY,LIMITLGOTY,PROC,LIMITFORSEC,ADDPODOH,PROCADD from podohtbl where datefr<='''+DateS+''' order by datefr desc ';
       RetV:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
       PodohLgota      := RetV[0];
       LimitPodohLgota := RetV[1];
       PROCPODOH       := RetV[2];
       Limit_17_Summa  := RetV[3];
       AddPodohFor17   := RetV[4];
       ProcAddPodoh    := RetV[5];
       if abs(LImit_17_summa)<100 then
          begin
               ShowMessage('Не заполнена таблица подоходного налога в Firebird за '+DateS);
               kz:=-1;
               Exit;
          end;
       KZ:=0;
  END;
 PROCEDURE INIT_PODOH_2004(DEST_MONTH:INTEGER;DEST_YEAR:INTEGER);
  VAR I,J,COUNT:INTEGER;
      DEVF:TEXT;
      PODOH_FILE_NAME:STRING;
      MIN_SALARY_FILE_NAME:STRING;
      S,S1:STRING;
      A:REAL;
      FName:String;
  BEGIN
       INIT_PODOH_2004_SQL(DEST_MONTH,DEST_YEAR);
       Exit;
       KZ:=0;
       STR(DEST_MONTH:2,S);
       IF COPY(S,1,1)=' ' THEN S:='0'+COPY(S,2,1);
       STR(DEST_YEAR,S1);
       FNAME:=CDIR+'PODOH04\'+ALLTRIM(S1)+'\p'+S+'.txt';
       if not FileExist(FName) then
          begin
               ScrUtil.Error('Нет таблицы подоходного налога за '+Month[Dest_Month]+' '+IntToStr(Dest_Year));
               Kz:=-1;
               Exit;
          end;
       CURR_PODOH_MONTH_2004 := DEST_MONTH;
       CURR_PODOH_YEAR  := DEST_YEAR;
       ASSIGN(DEVF,FName);
       RESET(DEVF);
       I:=0;
       WHILE NOT EOF(DeVF) DO
         BEGIN
               READLN(DEVF,S);
               IF LENGTH(S)<20 THEN CONTINUE;
               S:=COPY(S,1,15);
               S:=AllTrim(S);
               If Length(S)=0 then Continue;
               VAL(S,A,J);
               IF J<>0 THEN CONTINUE;
               INC(I);
               IF I=1 THEN PODOHLGOTA:=A
                      ELSE
               IF I=2 THEN LIMITPODOHLGOTA:=A
                      ELSE PROCPODOH:=A;
               IF I>2 THEN BREAK;
         END;
       CLOSE(DEVF);
       IF I<>3 THEN
          BEGIN
               ScrUtil.ERROR('НЕВЕРНАЯ СТРУКТУРА ФАЙЛА '+FNAME);
               KZ:=-1;
               EXIT;
          END;
       KZ:=0;
  END;
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
PROCEDURE INI_W_DAY_SQL;
VAR I:INTEGER;
    day,dayc,day_6:integer;
    clck,clckc:real;
    y,m,yc,mc:Integer;
    Stmnt:string;
    IStartTransaction:boolean;
    IsNMESFill:boolean;
BEGIN
    IsNMESFill:=false;
    y:=CURRYEAR;
    KZ:=0;
    IStartTransaction:=false;
    if isSVDN then
       Stmnt:='select monthza,wdays,clocks,wdayscoledg,wclockscoledg from tb_days where  yearza='+IntToStr(y)+' order by monthza'
    else
       Stmnt:='select monthza,wdays,clocks,wdayscoledg,wclockscoledg,wdays_6 from tb_days where  yearza='+IntToStr(y)+' order by monthza';
    if FIB.pFIBQuery.Open then
       FIB.pFIBQuery.Close;
    FIB.pFIBQuery.SQL.Clear;
    FIB.pFIBQuery.SQL.Add(Stmnt);
    if not FIB.pFIBQuery.Transaction.Active then
       begin
            FIB.pFIBTransactionSAL.StartTransaction;
            IStartTransaction:=true;
       end;
     try
        FIB.pFIBQuery.ExecQuery;
        i:=0;
        while (not FIB.pFIBQuery.Eof) and (i<12) do
           begin
                Inc(i);
                mc    := FIB.pFIBQuery.Fields[0].AsInteger;
                day   := FIB.pFIBQuery.Fields[1].AsInteger;
                clck  := FIB.pFIBQuery.Fields[2].AsFloat;
                dayc  := FIB.pFIBQuery.Fields[3].AsInteger;
                clckc := FIB.pFIBQuery.Fields[4].AsFloat;
                if isLNR then
                   day_6 := FIB.pFIBQuery.Fields[5].AsInteger;
                if mc<>I then
                   begin
                        ScrUtil.Error('Отсутствуют нормочасы за '+IntToStr(I)+'-'+IntToStr(Y));
                        kz:=-1;
                        Break;
                   end
                else
                 begin
                      if mc=NMES then IsNMESFill:=True;
                      W_DAY_5[i]     := day;
                      if isLNR then
                         W_DAY_6[i]  := day_6
                      else
                         W_DAY_6[i]  := day;

                      CLOCKS[i]      := clck;
                      W_DayColedg[i] := W_DAY_5[i];;
                      ClocksColedg[i]:= CLOCKS[i];
                      if dayc>1 then
                         W_DayColedg[i] := dayc;
                      if clckc>1.0 then
                         ClocksColedg[i] := clckc;
                 end;
                FIB.pFIBQuery.Next;
           end;
        FIB.pFIBQuery.Close;
     except
       else
           MessageDlg('Ошибка GetWorkClock ',mtInformation, [mbOk], 0);
           Kz:=-1;
     end;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     if IStartTransaction then
        FIB.pFIBTransactionSAL.Commit;
     if not IsNMESFill then
        ShowMessage('Не заполнена норма рабочих дней за '+getMonthRus(NMES));
END;
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
PROCEDURE INI_W_DAY;
VAR I:INTEGER;
    R:ARRAY[1..4] OF INTEGER;
    INF:Text;
BEGIN
    KZ:=0;
    INI_W_DAY_SQL;
    if kz<0 then Exit;
   {
    IF NOT FILEEXIST(CDIR+'DAY.TXT') THEN BEGIN
       ScrUtil.ERROR(' ОТСУТСТВУЕТ ФАЙЛ КОЛИЧЕСТВА РАБОЧИХ ДНЕЙ ПО МЕСЯЦАМ "DAY.TXT"');
       KZ:=-1;
       EXIT;
                        END;
    ASSIGN(INF,CDIR+'DAY.TXT');
    RESET(INF);
    FOR I:=1 TO 12 DO
       READLN(INF,W_DAY1[I],a,b,c,CLOCKS[I]);
    CLOSE(INF);
 }
  { Инициализация глубины перерачета подоходного налога }

    KZ:=0;
    IF NOT FILEEXIST(CDIR+'depth.TXT') THEN
                                       ELSE
       BEGIN
            ASSIGN(INF,CDIR+'Depth.TXT');
            RESET(INF);
            READLN(INF,I);
            IF (I>0) AND (I<12) THEN
                DEPTH_NALOG_RECALCULAYTING:=I;
            CLOSE(INF);
       END;
END;
procedure FillDayCodesCol(Y:Integer;JIndex:integer);
 VAR DEV:TEXTFILE;
     B,C,S:STRING;
     j,I:INTEGER;
 begin
      kz:=0;
      s:=IntToStr(y-2000);
      if length(s)=1 then S:='0'+s;
      B:=CDIR+'MNTHC'+S+'.TXT';
      IF NOT FILEEXIST(B) THEN
         BEGIN
              KZ:=-1;
              ShowMessage('Нет календаря коледжа для '+IntToStr(y)+' года.');
              Exit;
         END;
      ASSIGNFILE(DEV,B);
      RESET(DEV);
      FOR I:=1 TO 12 DO
          FOR J:=1 TO 31 DO
              READ(DEV,MONTH_DAY_Coledge[JIndex,I,J]);
      CLOSEFILE(DEV);
      if JIndex=2 then
         for i:=1 to 31 do
             day_kod_coledge[i]:=month_day_Coledge[JIndex,nmes,i];


 end;

procedure FillDayCodes(Y:Integer;JIndex:integer);
 VAR DEV:TEXTFILE;
     B,C,S:STRING;
     j,I:INTEGER;
 begin
      kz:=0;
      s:=IntToStr(y-2000);
      if length(s)=1 then S:='0'+s;
      B:=CDIR+'MONTH'+S+'.TXT';
      IF NOT FILEEXIST(B) THEN
         BEGIN
              KZ:=-1;
              ShowMessage('Нет календаря для '+IntToStr(CurrYear)+' года.');
              Exit;
         END;
      ASSIGNFILE(DEV,B);
      RESET(DEV);
      FOR I:=1 TO 12 DO
          FOR J:=1 TO 31 DO
              READ(DEV,MONTH_DAY[JIndex,I,J]);
      CLOSEFILE(DEV);
      if JIndex=2 then
         for i:=1 to 31 do
             day_kod[i]:=month_day[JIndex,nmes,i];
      FillDayCodesCol(y,JIndex);

 end;
PROCEDURE INIT_DAY_KOD;
 VAR Y:INTEGER;
 BEGIN
       FillChar(MONTH_DAY,SizeOf(MONTH_DAY),0);
       FillChar(MONTH_DAY_Coledge,SizeOf(MONTH_DAY_Coledge),0);
       Y:=CURRYEAR;
       FillDayCodes(Y,2);
       if kz<0 then Exit;
       y:=y+1;
       FillDayCodes(Y,3);
       if kz<0 then Exit;
       y:=y-2;
       FillDayCodes(Y,1);
       if kz<0 then Exit;
  END;
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
(*
PROCEDURE INIT_MIN_SALARY;
  VAR I,J:INTEGER;
      FL:TEXTfile;
  BEGIN
      ASSIGN(FL,CDIR+'MIN_SAL.TXT');
      IF NOT FILEEXIST(CDIR+'MIN_SAL.TXT') THEN
         BEGIN
               ShowMessage('ОТСУТСТВУЕТ СПРАВОЧНИК МИНИМАЛЬНЫХ ЗАРПЛАТ '+CDIR+'MIN_SAL.TXT');
               KZ:=-1;
               EXIT
         END;
      I:=0;
      RESET(FL);
      WHILE (NOT EOF(FL)) DO
        BEGIN
              I:=I+1;
              IF I=1 THEN
                 BEGIN
                      READLN(FL);
                      CONTINUE;
                 END;
              IF (I>13) THEN BREAK;
{              READLN(FL,MIN_SAL[I]);}
              READLN(FL,PARSAL1[1,I-1],PARSAL1[2,I-1],PARSAL1[3,I-1]);
        END;
     IF I<12 THEN
        BEGIN
             ShowMessage('В ФАЙЛЕ MIN_SAL.TXT ДОЛЖНО БЫТЬ 13 СТРОК');
             CLOSEfile(FL);
             KZ:=-1;
             EXIT;
        END;
     KZ:=0;
     CLOSEfile(FL);
  END;
*)
{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
 PROCEDURE INIT_ECB_2011;
  VAR I,J,COUNT,K:INTEGER;
      DEVF:TEXT;
      S,S1,C:STRIng;
      A:REAL;
      FName:String;
  BEGIN
       KZ:=0;
       FNAME:=CDIR+'ECB.txt';
       if not FileExists(FName) then
          begin
               ShowMessage('Нет таблицы единого социального налога '+FNAME);
               Kz:=-1;
               Exit;
          end;
       ASSIGNFILE(DEVF,FName);
       RESET(DEVF);
       I:=0;
       WHILE NOT EOF(DeVF) DO
         BEGIN
               READLN(DEVF,S);
               IF LENGTH(S)<20 THEN CONTINUE;
               C:=COPY(S,1,3);
               C:=AllTrim(C);
               If Length(C)=0 then Continue;
               VAL(C,K,J);
               IF J<>0 THEN CONTINUE;
               if (K=ECBShifr)    or
                  (K=ECBNShifr)   or
                  (K=ECBInvShifr) or
                  (K=ECBIllShifr) or
                  (K=ECBDpShifr) then
                  begin
                       c:=copy(S,9,5);
                       C:=AllTrim(C);
                       If Length(C)=0 then Continue;
                       VAL(C,A,J);
                       IF J<>0 THEN CONTINUE;
                       if a>1 then a:=a/100;
                       if (K=ECBShifr) then
                           ECBProc:=a;
                       if (K=ECBNShifr) then
                           ECBNProc:=a;
                       if (K=ECBInvShifr) then
                           ECBInvProc:=a;
                       if (K=ECBIllShifr) then
                           ECBIllProc:=a;
                       if (K=ECBDpShifr) then
                           ECBDpProc:=a;
                  end;
         END;
       CLOSEFILE(DEVF);
       KZ:=0;
       if ECBProc<0 then
          begin
               ShowMessage('В файле '+FName+' не указан % ECB');
               kz:=1;
          end;
       if ECBNProc<0 then
          begin
               ShowMessage('В файле '+FName+' не указан % ECB для науч рабтн');
               kz:=1;
          end;
       if ECBInvProc<0 then
          begin
               ShowMessage('В файле '+FName+' не указан % ECB для инвалидов');
               kz:=1;
          end;
       if ECBIllProc<0 then
          begin
               ShowMessage('В файле '+FName+' не указан % ECB для больничного');
               kz:=1;
          end;
       if ECBDpProc<0 then
          begin
               ShowMessage('В файле '+FName+' не указан % ECB для договоров подряда');
               kz:=1;
          end;
  END;

 procedure SetFormatSummaPltCharacter;
   var
     Ini         : TIniFile;
     S           : String;
     fName       : String;
   begin
      fName:=getIniFileName;
//      Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
      Ini := TIniFile.Create(fName);
      try
         S := Ini.ReadString( 'Parameters', 'SummaPltFormatSeparator', 'Defis' );
         S := Upper_String(S);
         s := Trim(S);
         if (S='POINT') or (S='DOT') then WantedCharForSummaPltFormat:='.'
         else if S='COMA' then WantedCharForSummaPltFormat:=','
         else WantedCharForSummaPltFormat:='-';
      finally
         Ini.Free;
      end;

   end;

 procedure SetTmpSaveFileMode;
   var
     Ini : TIniFile;
     S   : String;
     FName:string;
   begin
      TmpFirstMode:=True;
      fName:=getIniFileName;
//      Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
      Ini := TIniFile.Create(fName );
      try
         S := Ini.ReadString( 'Parameters', 'TmpFirstMode', 'New' );
         S := Upper_String(S);
         s := Trim(S);
         if (S='OLD') then TmpFirstMode:=False;
      finally
         Ini.Free;
      end;

   end;


PROCEDURE InitInitialParamentersFromIniFile;
 var Ini         : TIniFile;
     ValS        : string;
     iVal,iErr   : Integer;
     fName       : string;
  BEGIN
      fName:=getIniFileName;
      Ini := TIniFile.Create( fName );
      try
         ValS := Ini.ReadString('Parameters','NeedTestAddDuplicates','No');
         if Length(Trim(ValS))<2 then ValS:='No';
         if UPPER_STRING(Trim(ValS))='YES' then NeedTestAddDuplicates:=True;
         ValS := Ini.ReadString('Parameters','NeedRepairFindedAddDuplicates','No');
         if Length(Trim(ValS))<2 then ValS:='No';
         if UPPER_STRING(Trim(ValS))='YES' then NeedRepairFindedAddDuplicates:=True;
         ValS := Ini.ReadString('Parameters','KadryClarionMode','No');
         if Length(Trim(ValS))<2 then ValS:='No';
         if UPPER_STRING(Trim(ValS))='YES' then modeKadrySQL:=False
         else modeKadrySQL:=true;
         ValS := Ini.ReadString('Parameters','Block_Program','No');
         if Length(Trim(ValS))<2 then ValS:='No';
         if UPPER_STRING(Trim(ValS))='YES' then Block_Program:=true
         else Block_Program:=false;
         ValS := Ini.ReadString('Parameters','NeedTestGetPutInf','No');
         if Length(Trim(ValS))<2 then ValS:='No';
         if UPPER_STRING(Trim(ValS))='YES' then NeedTestGetPutInf:=true
         else NeedTestGetPutInf:=false;
         ValS := Ini.ReadString('Parameters','DebugMemoryCorruption','No');
         if Length(Trim(ValS))<2 then ValS:='No';
         if UPPER_STRING(Trim(ValS))='YES' then DebugMemoryCorruption:=true
         else DebugMemoryCorruption:=false;
         ValS := Ini.ReadString('Parameters','IOSQL','No');
         if Length(Trim(ValS))<2 then ValS:='No';
         if UPPER_STRING(Trim(ValS))='YES' then needIOSQL:=true
         else needIOSQL:=false;
         ValS := Ini.ReadString('Parameters','UseIOSQLMonitorLevel','0');
         if Length(Trim(ValS))>1 then ValS:='0';
         if UPPER_STRING(Trim(ValS))='1' then UseIOSQLMonitorLevel:=1
         else
         if UPPER_STRING(Trim(ValS))='2' then UseIOSQLMonitorLevel:=2
         else UseIOSQLMonitorLevel:=0;
         ValS := Ini.ReadString('Parameters','WantedMainDir','');
         if Length(Trim(ValS))>1 then
            INIT_DIR_NAME(Vals);

         if isLNR then
            begin
                 ValS := Ini.ReadString('Parameters','GKHEnvironment','0');
                 if Length(Trim(ValS))>0 then
                    begin
                         Val(ValS,iVal,iErr);
                         if iErr=0 then
                         if iVal=1 then isGKH:=True;
                    end;
                 ValS := Ini.ReadString('Parameters','bolnLNRMode2016','0');
                 if Length(Trim(ValS))>0 then
                    begin
                         Val(ValS,iVal,iErr);
                         if iErr=0 then
                         if iVal=1 then bolnLNRMode2016:=True;
                    end;
                 ValS := Ini.ReadString('Parameters','needServerAppData','0');
                 if Length(Trim(ValS))>0 then
                    begin
                         Val(ValS,iVal,iErr);
                         if iErr=0 then
                         if iVal=1 then needServerAppData:=True;
                    end;
                 ValS := Ini.ReadString('Parameters','needUseIOSemaphore','0');
                 if Length(Trim(ValS))>0 then
                    begin
                         Val(ValS,iVal,iErr);
                         if iErr=0 then
                         if iVal=1 then needUseIOSemaphore:=True;
                    end;


            end;
         if isSVDN then
            begin
                 ValS := Ini.ReadString('Parameters','NeedAllPodr','0');
                 if Length(Trim(ValS))>0 then
                    begin
                         Val(ValS,iVal,iErr);
                         if iErr=0 then
                         if iVal=1 then needAllPodr:=True;
                    end;
            end;
         ValS := Ini.ReadString('Parameters','pwdForNMES','');
         if Length(Trim(ValS))>1 then
            begin
                 passwordForChangeMonth:=trim(valS);
            end;

      finally
         Ini.Free;
      end;
  end;

end.
