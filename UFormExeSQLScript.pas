unit UFormExeSQLScript;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FIBQuery, pFIBQuery, FIBDatabase,
  pFIBDatabase, ComCtrls, pFIBSQLLog;

type
  TFormExeSQLScript = class(TForm)
    BitBtn1: TBitBtn;
    trExec: TpFIBTransaction;
    qExec: TpFIBQuery;
    ProgressBar1: TProgressBar;
    Memo1: TMemo;
    FIBSQLLogger1: TFIBSQLLogger;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExeSQLScript: TFormExeSQLScript;

implementation

  uses uFibModule,ScrUtil,USQLUnit,scrdef;

{$R *.dfm}

procedure TFormExeSQLScript.BitBtn1Click(Sender: TObject);
 const
       CRLF = #$D#$A;
       separator = '=^=';
 var fName:string;
     SQLStmnt:AnsiString;
     s:string;
     dev:TextFile;
     SQLStmnts:TArrOfAnsiString;
     L,i:Integer;
     userName:string;
begin
      username:=FIB.pFIBDatabaseSAL.ConnectParams.UserName;
      userName:=UpperCase(userName);
      if userName<>'SYSDBA' then
         begin
              ShowMessage('Выполнить скрипт можно только с правами администратора');
              Exit;
         end;
      ProgressBar1.Hide;
      BitBtn1.Enabled:=False;
      fName:=CDIR+'script.sql';
      if not FileExists(fName) then
         begin
              ShowMessage('Отсутствует файл '+fname);
              Exit;
         end;
      SQLStmnt:='';
      Memo1.Lines.Clear;
      Memo1.Lines.Add('Обработка файла script.com');
      Application.ProcessMessages;

      AssignFile(dev,fname);
      Reset(dev);
      while not Eof(dev) do
        begin
             Readln(dev,s);
             SQLStmnt:=SQLStmnt+CRLF+S;
        end;
      CloseFile(dev);
      SQLStmnts:=AnsiSplit(SQLStmnt,separator);
      l:=Length(SQLStmnts);
      if l>0 then
         begin
            if l>1 then
               begin
                 ProgressBar1.Show;
                 ProgressBar1.Step:=1;
                 ProgressBar1.Max:=l;
                 ProgressBar1.Min:=0;
               end;
//            qExec.Database.SQLLogger.ActiveLogging:=True;
//            FIB.FIBSQLLoggerSal.ForceSaveLog:=TRUE;
            qExec.Transaction.StartTransaction;
            for i:=1 to l do
              begin
                if l>1 then
                   begin
                        ProgressBar1.StepIt;
                        Application.ProcessMessages;
                   end;
                try
                   SQLStmnt:=SQLStmnts[i-1];
                   SQLStmnt:=trim(SQLStmnt);
                   if length(SQLStmnt)<5 then continue;
//                   if Pos('COMMIT',UpperCase(SQLStmnt))>0 then Continue;
                   if Pos('COMMIT',UpperCase(SQLStmnt))>0 then
                      begin
                           qExec.Transaction.Commit;
                           qExec.Transaction.StartTransaction;
                           Continue;
                      end;
                   Memo1.Lines.Clear;
                   Memo1.Lines.Add(SQLStmnt);
                   Application.ProcessMessages;
                   qExec.SQL.Add(SQLStmnt);
                   qExec.Prepare;
                   qExec.ExecQuery;
                   qExec.SQL.Clear;
//                   qExec.Transaction.CommitRetaining;
                   qExec.Close;
//                   SQLExecute(SQLStmnt);
                   if i=l then
                      begin
                           if qExec.Transaction.Active then
                              qExec.Transaction.Commit;
//                           FIB.FIBSQLLoggerSal.SaveLog;
                           ShowMessage('Скрипт выполнен успешно');
                      end
                except
                 else
                    begin
                         if qExec.Transaction.Active then
                            qExec.Transaction.Rollback;
//                        FIB.FIBSQLLoggerSal.SaveLog;
//                        FIB.FIBSQLLoggerSal.ForceSaveLog:=FALSE;
//                        qExec.Database.SQLLogger.ActiveLogging:=False;
                        ShowMessage('Ошибка выполнения скрипта. Выполненно '+intToStr(i)+' предложений.');
                        Break;
                    end;
                end;
              end;
         end;
      if qExec.Transaction.Active then
         qExec.Transaction.Commit;
      if qExec.Database.SQLLogger.ActiveLogging then
         begin
              FIB.FIBSQLLoggerSal.SaveLog;
              FIB.FIBSQLLoggerSal.ForceSaveLog:=FALSE;
              qExec.Database.SQLLogger.ActiveLogging:=False;
         end;
//      BitBtn1.Enabled:=True;
      Self.Close;
end;

procedure TFormExeSQLScript.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormExeSQLScript.FormCreate(Sender: TObject);
var userName:string;
begin
     ProgressBar1.Hide;
     username:=FIB.pFIBDatabaseSAL.ConnectParams.UserName;
     userName:=UpperCase(userName);
     if userName<>'SYSDBA' then
        begin
             caption:='Выполнение SQL скрипта запрещено (у пользователя нет прав администратора)';
             BitBtn1.Enabled:=False;
        end;

end;

end.
