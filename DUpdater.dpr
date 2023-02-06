program DUpdater;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  IniFiles,
  Classes,
  ShellAPI,
  Windows,
  DateUtils,
  types,
  Console in 'Console.pas';

type
ECopyException=class(Exception);

var iniFileName:string;
    iniFile:TIniFile;
    srcName,dstName,bakDir,bakName,tmpName:string;
    currDirName:string;
    AWnd: HWND;
    srcDt,dstDt:TDateTime;
    sizeBefore:LongInt;
    sizeAfter:longInt;
    nmbOfAtmp:Integer;

 function getFileSize(fName:string):longInt;
  var retVal:LongInt;
      f: file of Byte;
  begin
       retVal:=0;
       if FileExists(fName) then
          begin
               AssignFile(f, fName);
               Reset(f);
               try
                  retVal:=FileSize(f);
               finally
                  CloseFile(f);
               end;
          end;
       getFileSize:=retVal;
  end;
  function selfCopyFile(srcFName,dstFName:string):Boolean;
   var retVal:Boolean;
       i:integer;
       sizeResult:LongInt;
       sizeStart:longInt;
   begin
        sizeStart:=sizeBefore;
        retval:=false;
        i:=0;
        while (i<nmbOfAtmp) do
          begin
               inc(i);
               if not CopyFile(PChar(srcFName), PChar(dstFName), false) then
                  Continue;
               sizeResult:=getFileSize(dstFName);
               if sizeResult=sizeStart then
                  begin
                       retVal:=true;
                       Break;
                  end;
          end;
        selfCopyFile:=retVal;
   end;
procedure pressAnyKey;
  var h:cardinal;
      c:TInputRecord;
      i:DWord;
 begin
      h := GetStdHandle(STD_INPUT_HANDLE);
      if h <> INVALID_HANDLE_VALUE then
         begin
//WriteDebugMsg("Press any key...");
              Writeln('Press any key...');
              SetConsoleMode( h, 0);
              ReadConsole( h, @c, 1, i, nil);
              CloseHandle(h);
         end;
 end;

begin
  nmbOfAtmp:=5;
  iniFileName:='DUpdater.ini';
  currDirName:=GetCurrentDir;
  iniFileName:=currDirName+'\'+iniFileName;
  iniFile:=TIniFile.Create(iniFileName);
  writeln('iniFileName='+iniFile.FIleName);
  srcName:=iniFile.ReadString('Parameters','srcname','Not found');
  dstName:=iniFile.ReadString('Parameters','dstname','Not found');
  bakdir:=iniFile.ReadString('Parameters','bakdir','Not found');
  tmpName:=ChangeFileExt(dstName,'.tmp');
  bakName:=ChangeFileExt(dstName,'.bak');
  iniFile.Free;
  if FileExists(bakName) then
     DeleteFile(PChar(bakName));
  if FileExists(tmpName) then
     DeleteFile(PChar(tmpName));
  sizeBefore:=getFileSize(srcName);
//  pressAnyKey;
//  Console.WaitAnyKeyPressed('Press any key to continue ...');
//  WriteLn;
//  Writeln('Pressed');
  if FileExists(srcName) then
     begin
          srcDt:=FileDateToDateTime(FileAge(srcName));
          dstDt:=FileDateToDateTime(FileAge(dstName));
          if CompareDateTime(srcDt, dstDt)=GreaterThanValue then
             try
                 Writeln('copying new application');
//                 if CopyFile(PChar(srcName), PChar(tmpName), false) then
//                 raise ECopyException.Create('Testing ');
                 if not selfCopyFile(srcName, tmpName) then
                    raise ECopyException.Create('Error copying file from '+srcName+' to '+tmpName);
                 if not MoveFile(PChar(dstName), PChar(bakName)) then
                    raise ECopyException.Create('Error renaming file from '+dstName+' to '+bakName);
                 if not MoveFile(PChar(tmpName), PChar(dstName)) then
                    raise ECopyException.Create('Error renaming file from '+tmpName+' to '+dstName);
                 if not DeleteFile(PChar(bakName)) then
                    raise ECopyException.Create('Error when deleting file '+bakName);
                 writeln('Program has been updates succesfully.');
                 pressAnyKey;
             except on e:ECopyException do
                 begin
                      Writeln(e.message);
                      pressAnyKey;
                 end
             end;
(*
          if CompareDateTime(srcDt, dstDt)=GreaterThanValue then
             begin
                 Writeln('copying new application');
//                 if CopyFile(PChar(srcName), PChar(tmpName), false) then
                 if selfCopyFile(srcName, tmpName) then
                    begin
                        sizeAfter:=getFileSize(tmpName);
                        if sizeBefore=sizeAfter then
                           if MoveFile(PChar(dstName), PChar(bakName)) then
                              if MoveFile(PChar(tmpName), PChar(dstName)) then
                                 if DeleteFile(PChar(bakName)) then
                                    Writeln('finished copying')
                                 else
                                    begin
                                        Writeln('Error when deleting file '+bakName);
//                                      MoveFile(PChar(bakName), PChar(dstName)) then
                                    end
                              else
                                Writeln('Error renaming file from '+tmpName+' to '+dstName)
                           else
                             Writeln('Error renaming file from '+dstName+' to '+bakName)
                        else
                           Writeln('Error copying file from '+srcName+' to '+tmpName+' Wrong fileSize');
                    end
                 else
                    Writeln('Error copying file from '+srcName+' to '+tmpName);
//                 CopyFile(PChar(srcName), PChar(dstName), false);
             end;
*)
     end;
  if FileExists(dstName) then
     begin
        AWnd:=GetActiveWindow();
        ShellExecute(AWnd,'open',PChar(dstName),nil, nil, SW_SHOWNORMAL);
     end
 //  ShellExecute(Self.Handle, 'open', PChar(OpenDialog1.FileName), nil, nil, SW_SHOWNORMAL

 // writeln('srcName='+srcname);
 // writeln('dstName='+dstname);
 // writeln('bakName='+bakdir);
 // writeln(iniFileName);
 // Readln;
  { TODO -oUser -cConsole Main : Insert code here }

end.
 