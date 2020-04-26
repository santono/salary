unit UArc;

interface
function GETFLOWMONTH:string;
procedure Error(mes:string;mode:integer=0);
procedure makeArcDir;
function MakeArchivForData:string;


implementation
 uses Forms,SysUtils,Windows,dateUtils,
      Messages, Variants,  ShellAPI;

 const
      a_month:array[1..12] of string=('JUNUARY','FEBRUARY','MARCH','APRIL','MAY','JUNE','JULY','AUGUST','SEPTEMBE','OCTOBER','NOVEMBER','DECEMBER');
      r_month:array[1..12] of string=('ЯНВАРЬ','ФЕВРАЛЬ','МАРТ','АПРЕЛЬ','МАЙ','ИЮНЬ','ИЮЛЬ','АВГУСТ','СЕНТЯБРЬ','ОКТЯБРЬ','НОЯБРЬ','ДЕКАБРЬ');
      u_month:array[1..12] of string=('СІЧЕНЬ','ЛЮТИЙ','БЕРЕЗЕНЬ','КВІТЕНЬ','ТРАВЕНЬ','ЧЕРВЕНЬ','ЛИПЕНЬ','СЕРПЕНЬ','ВЕРЕСЕНЬ','ЖОВТЕНЬ','ЛИСТОПАД','ГРУДЕНЬ');
      doss:array[1..72] of byte = ($49,$69,$80,$81,$82,$83,$84,$85,$F0,$F2,$F3,$F4,$F5,$86,$87,$88,$89,$8A,$8B,$8C,$8D,$8E,$8F,$90,$91,$92,$93,$94,$95,$96,$97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F,$A0,$A1,$A2,$A3,$A4,$A5,$F1,$A6,$A7,$A8,$A9,$AA,$AB,$AC,$AD,$AE,$AF,$E0,$E1,$E2,$E3,$E4,$E5,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF);
      wins:array[1..72] of byte = ($B2,$B3,$C0,$C1,$C2,$C3,$C4,$C5,$A8,$AA,$BA,$AF,$BF,$C6,$C7,$C8,$C9,$CA,$CB,$CC,$CD,$CE,$CF,$D0,$D1,$D2,$D3,$D4,$D5,$D6,$D7,$D8,$D9,$DA,$DB,$DC,$DD,$DE,$DF,$E0,$E1,$E2,$E3,$E4,$E5,$B8,$E6,$E7,$E8,$E9,$EA,$EB,$EC,$ED,$EE,$EF,$F0,$F1,$F2,$F3,$F4,$F5,$F6,$F7,$F8,$F9,$FA,$FB,$FC,$FD,$FE,$FF);
      isLNR=true;
 var
     Y,M,D,DOW,H,Se,Sec100 : word;
     C,S,T : string;
     CDir,dataDir,MainDir,ArcDir,fileArcName : string;
     ApplicationExePath:string;
     FName,DName,Disk : string;
     nmes : integer;
     curryear : integer;
     needPause:boolean;

 function cdw(c:char):char;
  var i,j:integer;
      ch:char;
  begin
       cdw:=c;
       j:=ord(c);
       if ((ord(c)<$80) and (c<>'I') and (c<>'i')) then Exit;
       for i:=1 to length(doss) do
           if doss[i]=j then
              begin
                   ch:=chr(wins[i]);
                   cdw:=ch;
                   exit;
              end;
  end;
 function cwd(c:char):char;
  var i:integer;
  begin
       cwd:=c;
       if ord(c)<$80 then Exit;
       for i:=1 to length(wins) do
           if wins[i]=ord(c) then
              begin
                   cwd:=chr(doss[i]);
                   exit;
              end;
  end;

  function DosToWin(s:string):string;
   var RetVal:string;
       i:integer;
       c:char;
   begin
{
        DosToWin:=S;
        Exit;
}
        if length(s)=0 then
           begin
                DosToWin:='';
                Exit;
           end;
        RetVal:='';
        for i:=1 to length(s) do
            begin
                 c:=s[i];
                 RetVal:=RetVal+cdw(c);
            end;
        DosToWin:=RetVal;

   end;


  function WinToDos(s:string):string;
   var RetVal:string;
       i:integer;
       c:char;
   begin
        if length(s)=0 then
           begin
                WinToDos:='';
                Exit;
           end;
        RetVal:='';
        for i:=1 to length(s) do
            begin
                 c:=s[i];
                 RetVal:=RetVal+cwd(c);
            end;
        WinToDos:=RetVal;
   end;


procedure Error(mes:string;mode:integer=0);
 var s:string;
 begin
     writeln(wintodos(mes));
     if ((mode>0) and (needPause)) then
        begin
            writeln(winToDos('Нажмите Enter'));
            readln(s);
        end;    
 end;

function GETFLOWMONTH:string;
 VAR DEV:TEXT;
     I:INTEGER;
     iErr:integer;
FUNCTION CONV_MONTH(R_MON:STRING):INTEGER;
 VAR I,L:INTEGER;
     S,S1:STRING;
 BEGIN
     L:=LENGTH(R_MON);
     S:='';
     FOR I:=1 TO L DO
         CASE R_MON[I] OF
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
           ELSE S:=S+R_MON[I];
         END;
     CONV_MONTH:=1;
     I:=0;
     S1:=DosToWIn(S);
     S:=AnsiUpperCase(s);
     S1:=AnsiUpperCase(s1);
     WHILE I<12 DO
       BEGIN
           INC(I);
{
           ERROR(' S='+S+' MONTH[I]='+MONTH[I]);
}
           IF (S=R_MONTH[I]) or (s1=R_MONTH[I])
              OR
              (S1=U_MONTH[I]) or (S1=U_MONTH[I])
           THEN
              BEGIN
                   CONV_MONTH:=I;
                   EXIT;
              END;
       END;
     ERROR('Не верно указан месяц '+TRIM(S)+' в файле YEAR.TXT');
{     MAKE_WORK_MONTH;      }
     CONV_MONTH:=0;
  END;
  procedure buildDirs;
   var s:string;
       lastChar,currChar:string;
       i:integer;
   begin
     s:=ExtractFilePath(Application.ExeName);
     s:=trim(s);
     ApplicationExePath:=s;
     lastChar:=copy(s,length(s),1);
     cdir:='';
     dataDir:='';
     for i:=length(s)-1 downto 1 do
         begin
              currChar:=copy(s,i,1);
              if currChar=lastChar then
                 begin
                      cDir:=copy(s,1,i)+'const'+lastChar;
                      dataDir:=copy(s,1,i)+'data'+lastChar;
                      if isLNR then
                          arcDir:=copy(s,1,i)+'data'+lastChar+'arc'+lastChar
                      else
                          arcDir:=copy(s,1,i)+'arc'+lastChar;
                      break;
                 end;
         end;
     if dataDir='' then
        begin
          cdir:=s;
          dataDir:=s;
          arcDir:=s;
        end;
    error('arcdir='+arcdir,1);
    error('datadir='+datadir,1);
    error('cdir='+cdir,1);
    error('applicationExePathr='+applicationExePath,1);

   end;

 BEGIN
     buildDirs;
     error('buildDirs passed',1);
     ASSIGN(DEV,CDIR+'YEAR.TXT');
     {$I-}
     RESET(DEV);
     {$I+}
     if ioresult<>0 then
        begin
              error('Ошибка чтения файла YEAR.TXT в каталоге '+cdir,1);
              Halt(0);
        end;
     READLN(DEV,S);
     val(s,currYear,iErr);
     if iErr<>0 then
        begin
             error('Неверно задан год в файле YEAR.TXT',1);
             halt(0);
        end;

     READLN(DEV,S);
     close(dev);
     i:=Conv_Month(S);
     nmes:=i;
     if i<1 then Halt(0);
     if i>12 then Halt(0);
     GetFlowMonth:=Trim(A_Month[i]);
 END;
 procedure makeArcDir;
  var s : string;
      lastChar : string;
      dt : TdateTime;
      d : word;
      ds:string;
      y,m,hour,min,sec,miliosec:word;
      t:TDateTime;
  begin
       t:=getTime;
       decodeDateTime(t,y,m,d,hour,min,sec,miliosec);
       dt := Today;
       d  := dayOf(dt);
       ds := intToStr(d);
       if d<10 then ds:='0'+ds;
       s:=copy(arcDir,1,length(arcDir));
       lastChar:=copy(arcDir,length(arcDir),1);
       if not DirectoryExists(s) then
           if not CreateDir(s) then
              begin
                    error('Не могу создать каталог '+s,1);
                    halt(0);
              end;
       s:=arcDir+intToStr(currYear);
       if not DirectoryExists(s) then
           if not CreateDir(s) then
              begin
                    error('Не могу создать каталог '+s,1);
                    halt(0);
              end;
       s:=arcDir+intToStr(currYear)+lastChar+a_month[nmes];
       if not DirectoryExists(s) then
           if not CreateDir(s) then
              begin
                    error('Не могу создать каталог '+s,1);
                    halt(0);
              end;
       s:=arcDir+intToStr(currYear)+lastChar+a_month[nmes]+lastChar+ds;
       if not DirectoryExists(s) then
           if not CreateDir(s) then
              begin
                    error('Не могу создать каталог '+s,1);
                    halt(0);
              end;
       arcDir:=s;
       fileArcName:=arcDir+lastChar+intToStr(hour)+'_'+intToStr(min)+'_'+intToStr(sec);


  end;
 function MakeArchivForData:string;
  var Kz:integer;
      CmdString:string;
      ModeArc:(arj,z7);
      ArchivatorName:string;
      DaDir:string;
      ArcName:String;
      S   : string;
      CurrentDir:string;
      SavedDir:string;
      SavedDrive:string;
      tmpNMES:integer;
      currDataDir:string;
      lastChar:string;
      ErrorExecution:integer;

 procedure execAndWait;
 var
      SI:TStartupinfo;
      PI:TProcessInformation;
      CMD : string;
      PC1 : PChar;
      IsStart:boolean;
      ExitCode:Cardinal;
  begin
      CMD:=CmdString;
      FillChar(SI, SizeOf(TStartUpInfo), 0);
      SI.cb          := SizeOf(TStartUpInfo);
      SI.dwFlags     := STARTF_USESHOWWINDOW{ or STARTF_FORCEONFEEDBACK};
      SI.wShowWindow := SW_HIDE;  // SI.wShowWindow := SW_SHOWNORMAL;
      PC1            := PChar(CMD);
      IsStart        := CreateProcess(Nil,PChar(CMD),Nil,Nil,False,NORMAL_PRIORITY_CLASS,Nil,Nil,SI,PI);
      if IsStart then begin
         WaitForInputIdle(PI.hProcess, INFINITE);    // ждем завершения инициализации
         WaitforSingleObject(PI.hProcess, INFINITE); // ждем завершения процесса
         GetExitCodeProcess(PI.hProcess, ExitCode);  // получаем код завершения
         CloseHandle(PI.hThread);                    // закрываем дескриптор потока
         CloseHandle(PI.hProcess);                   // закрываем дескриптор процесса

      end
      else ErrorExecution := GetLastError;

  end;
{
  procedure MakeArcName;
   const mns:array [1..12] of string=('ja','fe','mr','ap','ma','jn','jl','au','se','oc','no','de');
   var i,l:integer;
       y,m,d:word;
       dt:TDateTime;
       fn:string;
       ys,ms,ds,ist,s:string;
       Finded : boolean;
   begin
        finded:=false;
        dt:=Date;
        DecodeDate(dt,y,m,d);
        ds:=IntToStr(d);
        if d<10 then ds:='0'+ds;
        ms:=IntToStr(m);
        if m<10 then ms:='0'+ms;
        ys:=intToStr(y-2000);
        fn:=ds+ms;
        for i:=1 to 999 do
            begin
                 s   := mns[wantedMonth];
                 if i>1 then s:=s[1];
                 ist := IntToStr(I-1);
                 l   := length(ist);
                 fn  := ds+ms+ys+s;
                 if (i>1)  then
                    begin
                        fn  := copy(fn,1,length(fn))+ist;
                    end;
        //         fn  := fn+'.arj';
                 if ModeArc=z7 then fn  := fn+'.zip'
                 else fn  := fn+'.arj';
                 if not FileExists(DaDir+'\'+fn) then
                    begin
                          Finded:=true;
                          break;
                    end;
            end;
        if Finded then ArcName:=fn
                  else ArcName:='';

   end;
}
  begin
     MakeArchivForData:='';
     ModeArc:=z7;
     ArchivatorName:='7za.exe';
     ArchivatorName:=ApplicationExePath+ArchivatorName;

     if not FileExists(ArchivatorName) then
        begin
             error('Отсутствует архиварор '+ArchivatorName,1);
             MakeArchivForData:='';
             Exit;
        end;

    getDir(0,SavedDir);
    lastChar:=copy(dataDir,length(dataDir),1);
    currDataDir:=dataDir+a_month[nmes]+lastChar;
    ChDir(currDataDir);
    CmdString:=ArchivatorName+' a -tzip '+fileArcName+'.zip *.dat';
    error(cmdString);
//    Kz:=WinExecAndWait32(CmdString, 1);
    execandwait;
    ChDir(SavedDir);
    MakeArchivForData:=fileArcName;
    if (Kz>0) and (KZ<32) then
       begin
          error('Ошибка архивирования данных '+IntToStr(Kz),1);
          MakeArchivForData:='';
       end;
  end;

begin
     if paramCount>0 then
        needPause := true
     else
        needPause := false;
end.
