unit UFormExeSQLScript;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormExeSQLScript = class(TForm)
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
 var fName:string;
     SQLStmnt:WideString;
     s:string;
     dev:TextFile;

begin
      BitBtn1.Enabled:=False;
      fName:=CDIR+'script.sql';
      if not FileExists(fName) then
         begin
              ShowMessage('Отсутствует файл '+fname);
              Exit;
         end;
      SQLStmnt:='';
      AssignFile(dev,fname);
      Reset(dev);
      while not Eof(dev) do
        begin
             Readln(dev,s);
             SQLStmnt:=SQLStmnt+CRLF+S;
        end;
      CloseFile(dev);
      try
         SQLExecute(SQLStmnt);
         ShowMessage('Скрипт выполнен успешно');
      except
           else
            ShowMessage('Ошибка выполнения скрипта');
      end;
//      BitBtn1.Enabled:=True;
      Self.Close;
end;

procedure TFormExeSQLScript.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

end.
