unit TextPrinter;

interface

uses
    Windows, Controls, Forms, Dialogs;

type
  TTextPrinter = class(TObject)
private
  FNumberOfBytesWritten: Cardinal;
  FHandle: THandle;
  FPrinterOpen: Boolean;
  FErrorString: PChar;
  procedure SetErrorString;
  function ReplChar(S:String;CFR:String;CTO:String):String;

public
  constructor Create;
  procedure Write(const Str: string);
  procedure WriteLn(const Str: string);
  destructor Destroy; override;
published
  property NumberOfBytesWritten: Cardinal read FNumberOfBytesWritten;
end;

implementation
 uses SysUtils;

{TTextPrinter}

constructor TTextPrinter.Create;
 begin
   FHandle := CreateFile('LPT1', GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ
     or FILE_SHARE_WRITE, nil, OPEN_EXISTING, 0, 0);
   if FHandle = INVALID_HANDLE_VALUE then
      begin
           SetErrorString;
           raise Exception.Create(FErrorString);
      end
   else
      FPrinterOpen := True;
 end;

procedure TTextPrinter.SetErrorString;
 begin
      if FErrorString <> nil then
         LocalFree(Integer(FErrorString));
         FormatMessage(FORMAT_MESSAGE_ALLOCATE_BUFFER or FORMAT_MESSAGE_FROM_SYSTEM,
                       nil,
                       GetLastError(),
                       LANG_USER_DEFAULT,
                       @FErrorString,
                       0,
                       nil);
 end;

procedure TTextPrinter.Write(const Str: string);
 var
   OEMStr: PChar;
   NumberOfBytesToWrite: Integer;
   P:Pointer;
   S:AnsiString;
   Str1:string;
   i:integer;
{   NumberOfBytesWritten: cardinal;}
 begin
      if not FPrinterOpen then Exit;
      NumberOfBytesToWrite := Length(Str);
      OEMStr := PChar(LocalAlloc(LMEM_FIXED, NumberOfBytesToWrite + 1));
      try
         Str1:=Str;
         Str1:=Self.ReplChar(str1,'³','i');
         Str1:=Self.ReplChar(str1,'²','I');
         s:=str1;
{         p:=@Str;}
         CharToOem(PChar(s), OEMStr);
{         OEMStr:=PChar(Str);}
         if not WriteFile(FHandle, OEMStr^, NumberOfBytesToWrite, FNumberOfBytesWritten, nil) then
            begin
                 SetErrorString;
                 raise Exception.Create(FErrorString);
            end;
      finally
        LocalFree(Integer(OEMStr));
      end;
end;

procedure TTextPrinter.WriteLn(const Str: string);
 begin
     Self.Write(Str);
     Self.Write(#10);
 end;

destructor TTextPrinter.Destroy;
 begin
    CloseHandle(FHandle);
    if FErrorString <> nil then
       LocalFree(Integer(FErrorString));
 end;

Function TTextPrinter.ReplChar(S:String;CFR:String;CTO:String):String;
 var REtVal:String;
     i,k:integer;
 begin
      RetVal:=S;
      if Length(S)>0 then
         begin
               RetVal:='';
               k:=Length(S);
               for i:=1 to k do
                   if s[i]=CFR then RetVal:=RetVal+CTO
                                else RetVal:=RetVal+s[i];
         end;
      ReplChar:=RetVal;
 end;
end.
