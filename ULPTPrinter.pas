unit ULPTPrinter;

interface

uses
    Windows, Controls, Forms, Dialogs;

type
  TLPTPrinter = class(TObject)
private
  FNumberOfBytesWritten: Cardinal;
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

 var   DEV:TextFile;

{TTextPrinter}

constructor TLPTPrinter.Create;
 const FName='LPT1';
 begin
      AssignFile(Dev,FName);
      {$I-}
      ReWrite(Dev);
      {$I+}
      if IOResult<>0 then
      begin
           SetErrorString;
           raise Exception.Create(FErrorString);
      end
   else
      FPrinterOpen := True;
 end;

procedure TLPTPrinter.SetErrorString;
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

procedure TLPTPrinter.Write(const Str: string);
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
         Str1:=OEMStr^;
         {$I-}
         System.Write(dev,Str1);
         {$I+}
         if (IOResult<>0) then
            begin
                 SetErrorString;
                 raise Exception.Create(FErrorString);
            end;
      finally
        LocalFree(Integer(OEMStr));
      end;
end;

procedure TLPTPrinter.WriteLn(const Str: string);
 begin
     Self.Write(Str);
     Self.Write(#10);
 end;

destructor TLPTPrinter.Destroy;
 begin
    CloseFile(Dev);
    if FErrorString <> nil then
       LocalFree(Integer(FErrorString));
 end;

Function TLPTPrinter.ReplChar(S:String;CFR:String;CTO:String):String;
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


