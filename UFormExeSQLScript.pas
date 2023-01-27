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
       separator = '=^=';
 var fName:string;
     SQLStmnt:AnsiString;
     s:string;
     dev:TextFile;
     SQLStmnts:TArrOfAnsiString;
     L,i:Integer;
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
      SQLStmnts:=AnsiSplit(SQLStmnt,separator);
      l:=Length(SQLStmnts);
      if l>0 then
         for i:=1 to l do
           begin
                try
                   SQLStmnt:=SQLStmnts[i-1];
                   SQLExecute(SQLStmnt);
                   if i=l then
                      ShowMessage('Скрипт выполнен успешно');
                except
                 else
                    begin
                        ShowMessage('Ошибка выполнения скрипта. Выполненно '+intToStr(i)+' предложений.');
                        Break;
                    end;
                end;
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
