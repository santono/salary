{$T-}
unit UFormView;
                         
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormViewASCII = class(TForm)
    MemoView: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    FName:String;
    procedure MakeMemo;
  public
    { Public declarations }
  end;

procedure View(FName:String);

var
  FormViewASCII: TFormViewASCII;

implementation
 uses ScrUtil,Printers,ShellApi,TextPrinter,ULPTPrinter;

{$R *.dfm}

procedure TFormViewASCII.MakeMemo;
 var Dev:TextFile;
     S:String;
 begin
      Caption:='Просмотр файла '+FName;
      If not FileExist(FName) then MemoView.Lines.Add('Отсутствует файл '+FName)
                              else
         begin
               assignfile(Dev,FName);
               ReSet(Dev);
               while not eof(DEV) do
                 begin
                       Readln(Dev,S);
{                       MemoView.Lines.Add(dostowin(S));}
                       MemoView.Lines.Add(S);
                 end;
               CloseFile(Dev);
         end;
 end;
procedure TFormViewASCII.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure View(FName:String);
 begin
      if not FileExist(FName) then
         begin
              Error('Отсутствует файл '+FName);
              Exit;
         end;
      Application.CreateForm(TFormViewASCII,FormViewASCII);
      FormViewASCII.FName:=FName;
      FormViewASCII.MakeMemo;
      FormViewASCII.Show;
 end;
procedure TFormViewASCII.BitBtn2Click(Sender: TObject);
var
  Line: Integer;
  PrintText: System.Text;
begin
  AssignPrn(PrintText);
  try
     Rewrite(PrintText);
  except
     on EPrinter do
        begin
          ShowMessage('Принтер не готов');
          Exit;
     end ;
  end;

  Printer.Canvas.Font := MemoView.Font;
  for Line := 0 to MemoView.Lines.Count - 1 do
   Writeln(PrintText, MemoView.Lines[Line]);
  System.Close(PrintText);
end;

procedure TFormViewASCII.BitBtn3Click(Sender: TObject);
var
    h:hwnd;
    S:PChar;
    SS:String;
    zFileName : array[0..79] of Char;
begin
{S:=@FName;}
{
function ExecuteFile(const FileName, Params, DefaultDir: string;
  ShowCmd: Integer): THandle;
var
  zFileName, zParams, zDir: array[0..79] of Char;
begin
  Result := ShellExecute(Application.MainForm.Handle, nil,
    StrPCopy(zFileName, FileName), StrPCopy(zParams, Params),
    StrPCopy(zDir, DefaultDir), ShowCmd);
end;
}
if ShellExecute(h, 'open', StrPCopy(zFileName,FName), nil, nil, SW_SHOW) < 32 then
        begin
                ShowMessage('Немогу выполнить ShellExecute !');
                SS:='Notepad '+FName;
                S:=@SS;
                if WinExec(S, SW_SHOW) < 32 then
                   begin
                       ShowMessage('Немогу выполнить WinExec !')
                   end;
        end;
end;

procedure TFormViewASCII.BitBtn4Click(Sender: TObject);
var LPTHandle:THandle;
    ZapisanoBytes:cardinal;
    s:string;
    dev:TextFile;
    ASCIIPrinter:TTextPrinter;
{    ASCIIPrinter:TLPTPrinter;}

begin
      try
          ASCIIPrinter:=TTextPrinter.Create;
{          ASCIIPrinter:=TLPTPrinter.Create; }
      except
          ShowMessage('Матричный принтер не включен или не подключен к этому компьютеру');
          Exit;
      end;
      AssignFile(Dev,FName);
      ReSet(Dev);
      while not eof(DEV) do
        begin
             Readln(Dev,S);
             try
                ASCIIPrinter.WriteLn(S);
              except
                     if YesNo('Ошибка печати. Завершить печать?') then
                        Break;
              end
        end;
      CloseFile(Dev);
      if Assigned(ASCIIPrinter) then
         ASCIIPrinter.Free

end;

end.
