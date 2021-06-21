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
    srcName,dstName,bakDir,bakName:string;
    currDirName:string;
    AWnd: HWND;
    srcDt,dstDt:TDateTime;
begin
  iniFileName:='DUpdater.ini';
  currDirName:=GetCurrentDir;
  iniFileName:=currDirName+'\'+iniFileName;
  iniFile:=TIniFile.Create(iniFileName);
  writeln('iniFileName='+iniFile.FIleName);
  srcName:=iniFile.ReadString('Parameters','srcname','Not found');
  dstName:=iniFile.ReadString('Parameters','dstname','Not found');
  bakdir:=iniFile.ReadString('Parameters','bakdir','Not found');
  iniFile.Free;
  if FileExists(srcName) then
     begin
          srcDt:=FileDateToDateTime(FileAge(srcName));
          dstDt:=FileDateToDateTime(FileAge(dstName));
          if CompareDateTime(srcDt, dstDt)=GreaterThanValue then
             begin
                 Writeln('copying new application');
                 CopyFile(PChar(srcName), PChar(dstName), false);
                 Writeln('finished copying');
             end;
     end;
  AWnd:=GetActiveWindow();
  ShellExecute(AWnd,'open',PChar(dstName),nil, nil, SW_SHOWNORMAL);
 //  ShellExecute(Self.Handle, 'open', PChar(OpenDialog1.FileName), nil, nil, SW_SHOWNORMAL

 // writeln('srcName='+srcname);
 // writeln('dstName='+dstname);
 // writeln('bakName='+bakdir);
 // writeln(iniFileName);
 // Readln;
  { TODO -oUser -cConsole Main : Insert code here }

end.
 