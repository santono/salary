unit UFibModule;
                                     
interface                     
                                   
uses
  SysUtils, Classes, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase,
  pFIBErrorHandler,FIB, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet,
  DBClient, pFIBClientDataSet, pFIBSQLLog ;

{     SX_TRENDED   = WM_USER + 102;   }

type
  TFIB = class(TDataModule)
    pFIBDatabaseSal: TpFIBDatabase;
    pFIBTransactionSAL: TpFIBTransaction;
    pFIBQuery: TpFIBQuery;
    FibErrMain: TpFibErrorHandler;
    pFIBStoredProcPick: TpFIBStoredProc;
    pFIBStoredProcCom: TpFIBStoredProc;
    pFIBDatabaseArc: TpFIBDatabase;
    pFIBTransactionArcWrite: TpFIBTransaction;
    pFIBQueryArc: TpFIBQuery;
    pFIBTransactionArc: TpFIBTransaction;
    pFIBStoredProcComArc: TpFIBStoredProc;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBQuerySecond: TpFIBQuery;
    pFIBDataSetDynamic: TpFIBDataSet;
    pFIBClientDataSet1: TpFIBClientDataSet;
    FIBSQLLoggerSal: TFIBSQLLogger;
    FIBSQLLoggerArc: TFIBSQLLogger;
    procedure DataModuleCreate(Sender: TObject);
    procedure FibErrMainFIBErrorEvent(Sender: TObject;
      ErrorValue: EFIBError; KindIBError: TKindIBError;
      var DoRaise: Boolean);
    procedure pFIBDatabaseSalBeforeConnect(Database: TFIBDatabase;
      LoginParams: TStrings; var DoConnect: Boolean);
    procedure pFIBDatabaseSalAfterConnect(Sender: TObject);
    procedure pFIBDatabaseSalBeforeStartTransaction(Sender: TObject);
    procedure pFIBDatabaseSalErrorRestoreConnect(Database: TFIBDatabase;
      E: EFIBError; var Actions: TOnLostConnectActions);
    procedure pFIBDatabaseSalTimeout(Sender: TObject);
    procedure pFIBDatabaseSalLostConnect(Database: TFIBDatabase;
      E: EFIBError; var Actions: TOnLostConnectActions);
    procedure pFIBDatabaseSalAfterDisconnect(Sender: TObject);
    procedure pFIBDatabaseArcAfterConnect(Sender: TObject);
    procedure StatusMessage(S:String);
    procedure pFIBDatabaseArcLostConnect(Database: TFIBDatabase;
      E: EFIBError; var Actions: TOnLostConnectActions);
    procedure pFIBDatabaseSalAfterEndTransaction(EndingTR: TFIBTransaction;
      Action: TTransactionAction; Force: Boolean);
    procedure pFIBDatabaseArcAfterEndTransaction(EndingTR: TFIBTransaction;
      Action: TTransactionAction; Force: Boolean);
    procedure pFIBDatabaseArcAfterStartTransaction(Sender: TObject);
    procedure pFIBDatabaseSalAfterStartTransaction(Sender: TObject);
    procedure changeSALtoSALISKRA;
    procedure changeSALISKRAtoSAL;
  private
    { Private declarations }
    procedure SwitchConnectionStatus(bStatus: byte);
    procedure changeDB(needIskra:boolean);


  public
     function GetShifrWrk:integer;
     function GetFioCurrWrk(ShifrWrk:integer):string;
     function GetShifrRight:integer;
     function GetShifrSecretRight:integer; // Доступ к секретным табельным номерам
     function GetRightForSecretWorker(Tabno:integer):boolean;
    { Public declarations }
  end;

var
  FIB: TFIB;
  function InitFIB:boolean;

implementation
 uses IniFiles,QForms,Dialogs,FORMS,Windows,USMessages,Registry,
      ScrDef{,Salary},USQlUnit, Variants;
{$R *.dfm}
{ ***************************************************** }
{ *                SaveLoginToRegistry                * }
{ ***************************************************** }
procedure SaveLoginToRegistry(Name,Pwd:String);
 var
    Reg         : TRegIniFile;
    NameOfKey   : string;
 begin
       NameOfKey    := 'LoginSal';

       Reg:=TRegIniFile.Create('Salary');
       try
           Reg.RootKey:=HKEY_CURRENT_USER; // Section to look for within the registry
           if Reg.OpenKey(NameofKey,True) then
              begin
                   Reg.WriteString('Parameters','Name',Name);
                   Reg.WriteString('Parameters','Pwd',Pwd);
              end;
       finally
         Reg.Free;
       end;
end;
{ ***************************************************** }
{ *                LoadLoginFromRegistry              * }
{ ***************************************************** }
procedure LoadLoginFrRegistery(var Name,Pwd:string);
 var
    Reg         : TRegIniFile;
    I           : integer;
    NameOfKey   : string;
 begin
       Name         := '';
       Pwd          := '';
       NameOfKey    := 'LoginSal';
       Reg          := TRegIniFile.Create('Salary');
       try
           Reg.RootKey:=HKEY_CURRENT_USER;           // Section to look for within the registry
           if Reg.OpenKey(NameOfKey,false) then
              begin
                   Name  := Reg.ReadString('Parameters','Name','');
                   Pwd   := Reg.ReadString('Parameters','Pwd','');
              end;
       finally
         Reg.Free;
       end;
end;

{ ***************************************************** }
{ *                                                   * }
{ ***************************************************** }
function InitFIB:boolean;
var
  Ini: TIniFile;
  Password,UserName,DBName,DBArcName,S,RegistryModeStr:String;
  RegistryMode : boolean;
  I,J : integer;
  FN : string;
  FNameINI : String;
begin
  i:=ParamCount;
  if i=1 then
     begin
          s:=paramstr(1);
          s:=AnsiUpperCase(trim(s));
          i:=Pos('SKRA',S);
          if (i>0) then
              modeIskra:=True;
     end ;

  FNameINI :='DScroll.Ini';
  FN  := ExtractFileName(Application.ExeName);
  FN  := ChangeFileExt(FN,'.INI');
  if not (AnsiUpperCase(FN)='DARCHIV.INI') then
     FNameINI:=FN;
  S   := ExtractFilePath(Application.ExeName)+FNameINI;
  if not FileExists(S) then
     begin
          ShowMessage('Не найден файл инициализации '+S);
          InitFIB:=false;
          Exit;
     end;
  RegistryMode := false;
  Ini := TIniFile.Create(S);
  InitFIB:=true;
  if not FIB.pFIBDatabaseSal.Connected then
     begin
     //     Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
          Ini := TIniFile.Create(S);
          try
             Password  := Ini.ReadString( 'FireBird', 'Password', 'mastrekey' );
             UserName  := Ini.ReadString( 'FireBird', 'UserName', 'SYSDBA' );
             if modeIskra then
                DBName := Ini.ReadString( 'FireBird', 'DBNameISKRA', 'D:\ZARPLATA\VUGU\IB\SAL.FDB' )
             else
                DBName := Ini.ReadString( 'FireBird', 'DBName', 'D:\ZARPLATA\VUGU\IB\SAL.FDB' );
             DBArcName := Ini.ReadString( 'FireBird', 'DBArcName', 'F:\SALDB\SALARC.FDB' );
             RegistryModeStr := Ini.ReadString( 'Parameters', 'Registry', '1' );
          finally
             Ini.Free;
          end;
          val(RegistryModeStr,i,j);
          if j=0 then
             if i=1 then RegistryMode:=true;

          if RegistryMode then
             LoadLoginFrRegistery(UserName,Password);

          if not FIB.pFIBDatabaseArc.Connected then
             begin

                  if not RegistryMode then
                     begin
                          Password:='';
                          UserName:='';
                     end;

                  FIB.pFIBDatabaseSal.ConnectParams.CharSet  := 'WIN1251';
                  FIB.pFIBDatabaseSal.ConnectParams.Password := Password;
                  FIB.pFIBDatabaseSal.ConnectParams.UserName := UserName;
                  FIB.pFIBDatabaseSal.DBName                 := DBName;
                  if (Length(Trim(FIB.pFIBDatabaseSal.ConnectParams.UserName))=0) or
                     (Length(Trim(FIB.pFIBDatabaseSal.ConnectParams.Password))=0) then
                     FIB.pFIBDatabaseSal.UseLoginPrompt         := True
                  else
                     FIB.pFIBDatabaseSal.UseLoginPrompt         := false;

             end
          else
             begin
                  FIB.pFIBDatabaseSal.ConnectParams.CharSet  := 'WIN1251';
                  FIB.pFIBDatabaseSal.ConnectParams.Password := FIB.pFIBDatabaseArc.ConnectParams.Password;
                  FIB.pFIBDatabaseSal.ConnectParams.UserName := FIB.pFIBDatabaseArc.ConnectParams.UserName;
                  FIB.pFIBDatabaseSal.DBName                 := DBArcName;
                  FIB.pFIBDatabaseSal.UseLoginPrompt         := false;
             end;
         try
            FIB.pFIBDatabaseSal.Connected := True;
            UserName := FIB.pFIBDatabaseSal.ConnectParams.UserName;
            Password := FIB.pFIBDatabaseSal.ConnectParams.Password;
            if ((Length(Trim(UserName))>0) and  (Length(Trim(Password))>0)) then
               if RegistryMode then
                  SaveLoginToRegistry(UserName,Password);

         except
            ShowMessage('Ошибка соединения c FireBird');
            InitFIB:=false;
         end;
     end;
  if not (AnsiUpperCase(FN)='PO.INI') THEN   
  if not FIB.pFIBDatabaseArc.Connected then
     begin
//           S:= ChangeFileExt( Application.ExeName, '.INI');
//          Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
//          Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
          Ini := TIniFile.Create(S);
          try
              Password  := Ini.ReadString( 'FireBird', 'Password', 'mastrekey' );
              UserName  := Ini.ReadString( 'FireBird', 'UserName', 'SYSDBA' );
              DBArcName := Ini.ReadString( 'FireBird', 'DBArcName', 'F:\SALDB\SALARC.FDB' );
          finally
              Ini.Free;
          end;
          Password:='';
          UserName:='';
          FIB.pFIBDatabaseArc.ConnectParams.CharSet  := 'WIN1251';
          FIB.pFIBDatabaseArc.ConnectParams.Password := FIB.pFIBDatabaseSal.ConnectParams.Password;
          FIB.pFIBDatabaseArc.ConnectParams.UserName := FIB.pFIBDatabaseSal.ConnectParams.UserName;
          FIB.pFIBDatabaseArc.DBName                 := DBArcName;
          FIB.pFIBDatabaseArc.UseLoginPrompt         := false;
          try
             FIB.pFIBDatabaseArc.Connected := True;
          except
             ShowMessage('Ошибка соединения c FireBird (архив)');
             InitFIB:=false;
          end;
     end;
end;

procedure TFIB.DataModuleCreate(Sender: TObject);
begin

      if pFIBDatabaseSal.Connected then
         pFIBDatabaseSal.Connected:=false;
{
      if pFIBDatabaseArc.Connected then
         pFIBDatabaseArc.Connected:=false;
}         
      InitFIB;
end;

procedure TFIB.FibErrMainFIBErrorEvent(Sender: TObject;
  ErrorValue: EFIBError; KindIBError: TKindIBError; var DoRaise: Boolean);
var Lasterror: string;
    FKindIBError: string;
    MSGText:String;
begin
{
  Memo1.Lines.Add(#13#10 + '========= ErrorHandler FIBErrorEvent =========');
  Memo1.Lines.Add('ConstraintName = ' +
    ErrorHandler1.ConstraintName);
  Memo1.Lines.Add('ExceptionNumber = ' +
    IntToStr(ErrorHandler1.ExceptionNumber));
  case ErrorHandler1.LastError of
    keNoError: Lasterror := 'keNoError';
    keException: Lasterror := 'keException';
    keForeignKey: Lasterror := 'keForeignKey';
    keSecurity: Lasterror := 'keSecurity';
    keLostConnect: Lasterror := 'keLostConnect';
    keCheck: Lasterror := 'keCheck';
    keUniqueViolation: Lasterror := 'keUniqueViolation';
    keOther: Lasterror := 'keOther';
  else
    Lasterror := 'Undefined';
  end;
  Memo1.Lines.Add('Lasterror = ' + Lasterror);
  Memo1.Lines.Add('SQLCode = ' + IntToStr(ErrorValue.SQLCode));
  Memo1.Lines.Add('IBErrorCode = ' + IntToStr(ErrorValue.IBErrorCode));
  Memo1.Lines.Add('Message = ' + ErrorValue.Message);
  Memo1.Lines.Add('IBMessage = ' + ErrorValue.IBMessage);
  Memo1.Lines.Add('SQLMessage = ' + ErrorValue.SQLMessage);
  case KindIBError of
    keNoError: FKindIBError := 'keNoError';
    keException: FKindIBError := 'keException';
    keForeignKey: FKindIBError := 'keForeignKey';
    keSecurity: FKindIBError := 'keSecurity';
    keLostConnect: Lasterror := 'keLostConnect';
    keCheck: FKindIBError := 'keCheck';
    keUniqueViolation: FKindIBError := 'keUniqueViolation';
    keOther: FKindIBError := 'keOther';
  else
    FKindIBError := 'Undefined';
  end;
  Memo1.Lines.Add('KindIBError = ' + FKindIBError);
}
 if (ErrorValue.SQLCode=-902) and (ErrorValue.IBErrorCode=335544472) then
    begin
          ShowMessage('Неверное имя или пароль');
          Halt;{Application.Terminate;}
    end
 else
 if (ErrorValue.SQLCode=-902) and (ErrorValue.IBErrorCode=335544344) then
    begin
         ShowMessage('Не найден файл базы данных');
         Halt; {Application.Terminate;}
    end
 else
 if (ErrorValue.SQLCode=-904) and (ErrorValue.IBErrorCode=335544375) then
    begin
         ShowMessage('Запустите FireBird');
         Halt; {Application.Terminate;}
    end
 else
    begin
         MsgText := 'Ошибка соединения с базой данных:' + #10#13        + #10#13 +
                    'SQLCode = '     + IntToStr(ErrorValue.SQLCode)     + #10#13 +
                    'SQLMessage = ' + ErrorValue.SQLMessage             + #10#13 +
                    'IBErrorCode = ' + IntToStr(ErrorValue.IBErrorCode) + #10#13 +
                    'IBMessage: '    + #10#13 + ErrorValue.IBMessage    + #10#13 +
                    'Message = ' + ErrorValue.Message;

{  Application.MessageBox(PChar(MsgText), 'Error', MB_OK + MB_ICONSTOP);}
         ShowMessage(MsgText);
    end;
{ DoRaise := False;         }
{ Halt;}
{ Application.Terminate;}

end;

function TFIB.GetShifrWrk:integer;
 var RetVal:integer;
 begin
      RetVal:=0;
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add('SELECT FIRST 1 SHIFRWRK FROM CURRSHIFRWRK');
      pFIBTransactionSAL.StartTransaction;
      try
         pFIBQuery.ExecQuery;
         RetVal:=FIB.pFIBQuery.Fields[0].AsInteger;
         FIB.pFIBQuery.Close;
      except
            MessageDlg('Ошибка GetShifrWrk',mtInformation, [mbOk], 0);
            Exit;
      end;
      pFIBTransactionSAL.Commit;
      GetShifrWrk:=RetVal;
 end;
function TFIB.GetShifrRight:integer;
 var RetVal:integer;
     v:variant;
 begin
      RetVal:=0;
      V:=SQLQueryValue('SELECT FIRST 1 SHIFRPRA FROM CURRSHIFRRIGHT');
      if (VarIsNumeric(v)) then
         retVal:=v;
{
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add('SELECT FIRST 1 SHIFRPRA FROM CURRSHIFRRIGHT');
      pFIBTransactionSAL.StartTransaction;
      try
         pFIBQuery.ExecQuery;
         RetVal:=FIB.pFIBQuery.Fields[0].AsInteger;
         FIB.pFIBQuery.Close;
      except
            MessageDlg('Ошибка GetShifrWrk',mtInformation, [mbOk], 0);
            Exit;
      end;
      pFIBTransactionSAL.Commit;
}
      GetShifrRight:=RetVal;
 end;
function TFIB.GetShifrSecretRight:integer;
 var RetVal:integer;
     v:variant;
 begin
      RetVal:=0;
      V:=SQLQueryValue('SELECT FIRST 1 SHIFRSP FROM CURRSHIFRRIGHTST');
      if (VarIsNumeric(v)) then
         retVal:=v;
{
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add('SELECT FIRST 1 SHIFRSP FROM CURRSHIFRRIGHTST');
      pFIBTransactionSAL.StartTransaction;
      try
         pFIBQuery.ExecQuery;
         RetVal:=FIB.pFIBQuery.Fields[0].AsInteger;
         FIB.pFIBQuery.Close;
      except
            MessageDlg('Ошибка GetShifrSecretRight',mtInformation, [mbOk], 0);
            Exit;
      end;
      pFIBTransactionSAL.Commit;
}
      GetShifrSecretRight:=RetVal;
 end;
function TFIB.GetRightForSecretWorker(Tabno:integer):boolean;
 var RetVal:boolean;
     v:variant;
     SQLStmnt:String;
 begin
      RetVal:=false;
      SqlStmnt:='SELECT FIRST 1 RETVAL FROM PR_TESTSECRETWORKER('+IntToStr(Tabno)+')';
      V:=SQLQueryValue(SQLStmnt);
      if (VarIsNumeric(v)) then
          if v=1 then
             retVal:=true;
{
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add('SELECT FIRST 1 RETVAL FROM PR_TESTSECRETWORKER('+IntToStr(Tabno)+')');
      pFIBTransactionSAL.StartTransaction;
      try
         pFIBQuery.ExecQuery;
         if FIB.pFIBQuery.Fields[0].AsInteger=1 then RetVal:=true;
         FIB.pFIBQuery.Close;
      except
            MessageDlg('Ошибка GetRightForSecretWorker',mtInformation, [mbOk], 0);
            Exit;
      end;
      pFIBTransactionSAL.Commit;
}
      GetRightForSecretWorker:=RetVal;
 end;
function TFIB.GetFioCurrWrk(ShifrWrk:integer):string;
 var RetVal:String;
 begin
      RetVal:='Не найден';
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add('SELECT FIRST 1 FIOOP FROM OperatORY WHERE shifrwrk='+inttostr(ShifrWrk));
      pFIBTransactionSAL.StartTransaction;
      try
         pFIBQuery.ExecQuery;
         RetVal:=FIB.pFIBQuery.Fields[0].AsString;
         FIB.pFIBQuery.Close;
      except
            MessageDlg('Ошибка GetFioCurrWrk',mtInformation, [mbOk], 0);
            Exit;
      end;
      pFIBTransactionSAL.Commit;
      GetFioCurrWrk:=RetVal;
 end;

procedure TFIB.SwitchConnectionStatus(bStatus: byte);
begin
{     MainForm.SwitchConnectionStatus(bStatus);}
end;


procedure TFIB.pFIBDatabaseSalBeforeConnect(Database: TFIBDatabase;
  LoginParams: TStrings; var DoConnect: Boolean);
begin
     pFIBDatabaseSal.Timeout := 20000;
end;

procedure TFIB.pFIBDatabaseSalAfterConnect(Sender: TObject);
begin
  if pFIBDatabaseSal.Connected then begin
     pFIBDatabaseSal.Timeout := 0;
  end else begin
      ShowMessage('Не удалось подключиться к серверу');
  end;

end;

procedure TFIB.pFIBDatabaseSalBeforeStartTransaction(Sender: TObject);
begin
  if not pFIBDatabaseSal.Connected then begin
    pFIBDatabaseSal.RestoreConnect(sender);
    pFIBDatabaseSal.WaitRestoreConnect;
  end;

end;

procedure TFIB.pFIBDatabaseSalErrorRestoreConnect(Database: TFIBDatabase;
  E: EFIBError; var Actions: TOnLostConnectActions);
begin
      ShowMessage('Не удается восстановить подключение к FireBird');
end;

procedure TFIB.pFIBDatabaseSalTimeout(Sender: TObject);
begin
     ShowMessage('Сервер не отвечает. Повторите попытку подключения');
end;

procedure TFIB.pFIBDatabaseSalLostConnect(Database: TFIBDatabase;
  E: EFIBError; var Actions: TOnLostConnectActions);
begin
     StatusMessage('Произошел разрыв подключения.');
   {  ConnectToDatabase;}
     InitFIB;
end;
procedure TFIB.StatusMessage(S:String);
 begin
{       MainForm.StatusMessage(S);}
 end;

procedure TFIB.pFIBDatabaseSalAfterDisconnect(Sender: TObject);
begin
{      MainForm.SwitchConnectionStatus(0); }   {Зеленый}
end;



procedure TFIB.pFIBDatabaseArcAfterConnect(Sender: TObject);
begin
  if pFIBDatabaseArc.Connected then begin
     pFIBDatabaseArc.Timeout := 0;
  end else begin
      ShowMessage('Не удалось подключиться к серверу архива');
  end;
end;

procedure TFIB.pFIBDatabaseArcLostConnect(Database: TFIBDatabase;
  E: EFIBError; var Actions: TOnLostConnectActions);
begin
     StatusMessage('Произошел разрыв подключения (архив).');
     InitFIB;
end;

     
procedure TFIB.pFIBDatabaseSalAfterEndTransaction(
  EndingTR: TFIBTransaction; Action: TTransactionAction; Force: Boolean);
begin
      if Assigned(Application.MainForm) then
         begin
              SendMessage(Application.MainForm.Handle,SX_TRSTARTED,1,2);
              Application.ProcessMessages;
         end
end;

procedure TFIB.pFIBDatabaseArcAfterEndTransaction(
  EndingTR: TFIBTransaction; Action: TTransactionAction; Force: Boolean);
begin
      if Assigned(Application.MainForm) then
         begin
              SendMessage(Application.MainForm.Handle,SX_TRSTARTED,2,2);
              Application.ProcessMessages;
         end
end;

procedure TFIB.pFIBDatabaseArcAfterStartTransaction(Sender: TObject);
begin
      if Assigned(Application.MainForm) then
         begin
              SendMessage(Application.MainForm.Handle,SX_TRSTARTED,2,1);
              Application.ProcessMessages;
         end

end;


procedure TFIB.pFIBDatabaseSalAfterStartTransaction(Sender: TObject);
begin
      if Assigned(Application.MainForm) then
         begin
              SendMessage(Application.MainForm.Handle,SX_TRSTARTED,1,1);
              Application.ProcessMessages;
         end
end;

procedure TFIB.changeSalToSalIskra;
begin
     changeDB(True);
end;
procedure TFIB.changeSalIskraToSal;
begin
     changeDB(false);
end;
procedure TFIB.changeDB(needIskra:boolean);
var
  Ini: TIniFile;
  Password,UserName,DBName,DBArcName,S,RegistryModeStr:String;
  I,J : integer;
  FN : string;
  FNameINI : String;
begin
  if modeIskra then Exit;
  i:=ParamCount;

  FNameINI :='DScroll.Ini';
  FN  := ExtractFileName(Application.ExeName);
  FN  := ChangeFileExt(FN,'.INI');
  if not (AnsiUpperCase(FN)='DARCHIV.INI') then
     FNameINI:=FN;
  S   := ExtractFilePath(Application.ExeName)+FNameINI;
  if not FileExists(S) then
     begin
          ShowMessage('Не найден файл инициализации '+S);
          Exit;
     end;
  Ini := TIniFile.Create(S);
  if FIB.pFIBDatabaseSal.Connected then
     begin
          i:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
          if i>0 then
             for j:=0 to i-1 do
                 begin
                      if FIB.pFIBDatabaseSal.Transactions[j].Active then
                         FIB.pFIBDatabaseSal.Transactions[j].Commit;
                 end;
          FIB.pFIBDatabaseSal.Close;
     end;
  if not FIB.pFIBDatabaseSal.Connected then
     begin
     //     Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
          Ini := TIniFile.Create(S);
          try
             Password  := Ini.ReadString( 'FireBird', 'Password', 'mastrekey' );
             UserName  := Ini.ReadString( 'FireBird', 'UserName', 'SYSDBA' );
             if needIskra then
                DBName := Ini.ReadString( 'FireBird', 'DBNameISKRA', 'D:\ZARPLATA\VUGU\IB\SAL.FDB' )
             else
                DBName := Ini.ReadString( 'FireBird', 'DBName', 'D:\ZARPLATA\VUGU\IB\SAL.FDB' );
          finally
             Ini.Free;
          end;

          FIB.pFIBDatabaseSal.ConnectParams.CharSet  := 'WIN1251';
          FIB.pFIBDatabaseSal.ConnectParams.Password := Password;
          FIB.pFIBDatabaseSal.ConnectParams.UserName := UserName;
          FIB.pFIBDatabaseSal.DBName                 := DBName;
          FIB.pFIBDatabaseSal.UseLoginPrompt         := false;
          try
            FIB.pFIBDatabaseSal.Connected := True;
          except
           else
            ShowMessage('Ошибка соединения c FireBird');
          end;
     end;
end;

end.
