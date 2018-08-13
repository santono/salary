unit ScrUril;

interface
   PROCEDURE MKFLNM;
   FUNCTION ALLTRIM(T:STRING):STRING;
   FUNCTION FILEEXIST(FILENAME:STRIng):BOOLEAN;
implementation
   uses SysUtils,QDialogs,DateUtils,QControls,ScrDef;

   PROCEDURE MKFLNM;
    VAR S,D,P:STRING;
        I:INTEGER;
        RealNsrv:Integer;
    BEGIN
        FNINF:='d:\vugu\data\august\f0108057.dat';
{
        IF NMES>9 THEN STR(NMES:2,S)
                  ELSE BEGIN STR(NMES:1,S); S:='0'+S END;
        RealNsrv:=Shifr_Serv(Nsrv);
        IF (RealNSRV>9) AND (RealNsrv<100) THEN BEGIN STR(RealNSRV:2,D); D:='0'+D; END;
        IF (RealNSRV>99) THEN STR(RealNSRV:3,D);
        IF RealNSRV<10   THEN BEGIN STR(RealNSRV:1,D); D:='00'+D END;
        IF NPDR>9 THEN STR(NPDR:2,P)
                  ELSE BEGIN STR(NPDR:1,P); P:='0'+P END;
        IF (NET_MODE) AND (NMES<>FLOW_MONTH) THEN
           FNINF:=GET_CURRENT_DISK+COPY(ALLTRIM(DDIR),3,LENGTH(ALLTRIM(DDIR))-2)+A_MONTH[NMES]+'\F'+P+S+D+'.DAT'
                    ELSE FNINF:=DDIR+A_MONTH[NMES]+'\F'+P+S+D+'.DAT';
}

    END;

FUNCTION ALLTRIM(T:STRING):STRING;
 VAR S:STRING[1];
     I,J,K:INTEGER;
     SS,SSS:STRING;
 BEGIN
      I:=LENGTH(T);
      IF I>0 THEN
         BEGIN
              J:=0;
              REPEAT
                    J:=J+1;
                    S:=COPY(T,J,1);
              UNTIL (J=I) OR (ORD(S[1])<>ORD(' '));
              SS:=COPY(T,J,I-J+1);
              SSS:=SS;
              I:=LENGTH(SS);
              IF I>0 THEN
                 BEGIN
                       J:=I+1;
                       K:=0;
                       REPEAT
                             J:=J-1;
                             S:=COPY(SS,J,1);
                       UNTIL (J=1)  OR  (S[1]<>' ');
                       SSS:=COPY(SS,1,J);
                 END;
         ALLTRIM:=SSS;
         END
             ELSE
         ALLTRIM:=T;
 END;


  FUNCTION FILEEXIST(FILENAME:STRIng):BOOLEAN;
    var
       f: file;
       KOD:INTEGER;
       TEMP_FILEMODE:BYTE;
       DONE:BOOLEAN;
       LIMIT,COUNT:REAL;
       DS,DC:TDATETIME;
       Otr:integer;
    begin
        TEMP_FILEMODE:=FILEMODE;
        FILEMODE:=$40;
        Assign(f, FileName);
        DONE:=FALSE;
        DS:=TIME;
        WHILE NOT DONE DO
         BEGIN
          {$I-}
          RESET(F);
          CLOSE(F);
          {$I+}
          KOD:=IORESULT;
          IF (KOD<5) OR (KOD=103) THEN DONE:=TRUE
                   ELSE
             BEGIN
                  DC:=Time;
                  otr:=SecondsBetween(DC,DS);
                  IF OTR>LIMIT_NET_TIME THEN
                     BEGIN
                          ShowMessage('При проверке сетевого файла '+ALLTRIM(FNINF)+
                                ' превышен лимит ожидания в '+IntToStr(LIMIT_NET_TIME)+' сек');
                          IF MessageDlg('Сделать еще одну попытку проверки ?',
                             mtConfirmation, [mbYes, mbNo], 0, mbYes)= mrYes THEN
                                  DS:=TIME
                                                                          ELSE
                             HALT(5);
                      END;{
                                             ELSE
                      DELAY(DELAY_NET);}
             END;
        END;
    IF (KOD=0) AND (FILENAME<>'') THEN FILEEXIST:=TRUE
                                  ELSE FILEEXIST:=FALSE;
{    IF KOD<>0 THEN ERROR('В FILEEXIST ДЛЯ '+ALLTRIM(FILENAME)+' КОД='+MY_STR_INT(KOD));
}    FILEMODE:=TEMP_FILEMODE;
  end;  { FileExist }


end.
 