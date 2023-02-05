program DUpdater;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  IniFiles,
  Classes,
  ShellAPI,
  Windows,
  DateUtils,
  types;

var iniFileName:string;
    iniFile:TIniFile;
    srcName,dstName,bakDir,bakName,tmpName:string;
    currDirName:string;
    AWnd: HWND;
    srcDt,dstDt:TDateTime;
    sizeBefore:LongInt;
    sizeAfter:longInt;

 function getFileSize(fName:string):longInt;
  var retVal:LongInt;
      retValS:string;
      Rec: LongRec;
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

begin
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
  if FileExists(srcName) then
     begin
          srcDt:=FileDateToDateTime(FileAge(srcName));
          dstDt:=FileDateToDateTime(FileAge(dstName));
          if CompareDateTime(srcDt, dstDt)=GreaterThanValue then
             begin
                 Writeln('copying new application');
                 if CopyFile(PChar(srcName), PChar(tmpName), false) then
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
 