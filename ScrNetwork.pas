unit scrnetwork;

interface
function isNetworkDriveStarted:boolean;
function isNetworkDrive(Drive:string):boolean;
function getMainDataDrive:string;
function needCopyOriginProgram:boolean;
function copyOriginProgram:boolean;
function checkNetworkDrive(Drive:char):boolean;

implementation
 uses Forms,SysUtils,Windows,ScrDef,DateUtils,Types, Dialogs;

function getDriveFromExeName:string;
 var s:string;
     retVal:string;
 begin
      s:=Application.ExeName;
      retVal:=extractFileDrive(s);
      getDriveFromExeName:=retVal;
 end;

function isNetworkDrive(Drive:string):boolean;
 var retVal:boolean;
        typ:integer;
        dd:string;
 begin
       dd:=Drive+':';
       typ := GetDriveType(PChar(dd));
       retVal:=false;
       if Typ <> 0 then
       case typ of
          DRIVE_REMOVABLE:
             begin
//                  ShowMessage('Drive Removable / Diskette');
             end;
           DRIVE_FIXED:
             begin
//                  ShowMessage('Drive fixed');
             end;
           DRIVE_CDROM:
             begin
//                   ShowMessage('CD ROM Drive');
             end;
           DRIVE_RAMDISK:
             begin
//                  ShowMessage('RAM Drive');
             end;
           DRIVE_REMOTE:
             begin
                  retVal:=true;
//                  ShowMessage('Remote Drive');
             end;
       end;
       isNetworkDrive:=retVal;

  end;
function isNetworkDriveStarted:boolean;
  var drive:string;
      retVal:boolean;
  begin
       drive  := getDriveFromExeName;
       retVal:=false;
       if isNetWorkDrive(drive) then
          retVal:=true;
       isNetworkDriveStarted :=retVal;
  end;

function checkNetWorkEnabled(Drive:string):boolean;
var ch:char;
    s:string;
    rv:integer;
    i,WantedDriveVal:integer;
begin
  s:=upperCase(Drive);
  ch:=s[1];
  i:=Ord(ch)-Ord('A')+1;
  WantedDriveVal:=Ord(s[1])-Ord('A')+1;

  rv:=DiskFree(WantedDriveVal);
  if (DiskFree(Ord(ch)-Ord('A')+1) > -1) then
     begin
         checkNetWorkEnabled := True; {disc is available}
     end
  else
     checkNetWorkEnabled := False; {is not available}
end;
function checkNetWorkEnabled1(Drive:string):boolean;
 var disk:string;
     retVal:boolean;
     FreeAvailable, TotalSpace: Int64;

 begin
      disk:=Drive+':\';
      retVal:=false;
      if SysUtils.GetDiskFreeSpaceEx(PChar(disk), FreeAvailable, TotalSpace, nil) then begin
         retVal:=true;
//    Writeln(TotalSpace div (1024*1024*1024), 'GB total');
//    Writeln(FreeAvailable div (1024*1024*1024), 'GB free');

  end;
     checkNetWorkEnabled1:=retVal;
 end;
function checkDirectory(Drive:string):boolean;
 var disk:string;
     retVal:boolean;
     Path: String;
     CreatedPath:string;
 begin
      retVal:=false;
      Path:=ExtractFileDir(Application.ExeName);
      createdPath:=Drive+copy(path,2,length(path)-1);
      if directoryExists(createdPath) then
         retVal:=true;
      checkDirectory:=retVal;
  end;

function getMainDataDrive:string;
 var retVal:string;
     rv:boolean;
     currDrive:string;
     lnrDrive:string;
     svdnDrive:string;
     localDrive:string;
 begin
       lnrDrive:='J:';
       svdnDRive:='D:';
       localDrive:='C:';
       currDrive:=ExtractFileDrive(Application.exeName);
       if isLNR and (currDrive=localDrive) and checkDirectory('J') then retVal:='J:'
       else
       if isLNR and (currDrive='C:') and DirectoryExists('E:\Projects\Zarplata') then retVal:='E:'
       else
       if isSVDN and (currDrive=localDrive) and checkDirectory('D') then retVal:='D:'
       else
          retVal:=ExtractFileDrive(Application.exeName);
       getMainDataDrive:=retVal;
 end;

function needCopyOriginProgram:boolean;
 var retVal:boolean;
     ageLocal,ageNetwork:integer;
     nameLocal,nameNetwork:string;
     s:string;
     dtNetwork,dtLocal:TDateTime;
 begin
     retVal      := false;
     nameLocal   := Application.ExeName;
     ageLocal    := FileAge(nameLocal);
     s           := getMainDataDrive;
     nameNetwork := s+copy(nameLocal,3,length(nameLocal)-2);
     if FileExists(nameNetwork) then
        begin
            ageNetwork  := FileAge(nameNetwork);
            dtNetwork   := FileDateToDateTime(ageNetwork);
            dtLocal     := FileDateToDateTime(ageLocal);
//     if ageNetwork>ageLocal then
            if CompareDateTime(dtNetwork,dtLocal)=GreaterThanValue then
               retVal := true;
        end;
     needCopyOriginProgram := retVal;
 end;

 function copyOriginProgram:boolean;
  var localName, serverName, bakName:string;
      fileName,templateName:string;
      localDir,bakDir,nameNetwork:string;
      yearS:string;
      sr         : TSearchRec;
      FileAttrs  : Integer;
      CurrVersio : Integer;
      Template   : string;
      S,ss       : string;
      i,j        : Integer;
      retVal     : Boolean;

  begin
      retVal        := True;
      localName     := Application.ExeName;
      fileName      := ExtractFileName(localName);
      templateName  := StringReplace(fileName,'.exe','_????.exe',[rfReplaceAll,rfIgnoreCase]);
      localDir      := ExtractFilePath(localName);
      bakDir        := localDir+'\bak';
      if not DirectoryExists(bakDir)  then
         if not CreateDir(bakDir) then
            begin
                 retVal:=false;
                 copyOriginProgram:=retVal;
                 Exit;
            end;
      yearS:=IntToStr(YearOf(date));
      bakDir:=localDir+'\bak\'+yearS;
      if not DirectoryExists(bakDir)  then
         if not CreateDir(bakDir) then
            begin
                 retVal:=false;
                 copyOriginProgram:=retVal;
                 Exit;
            end;
      template:=bakDir+'\'+templateName;
      CurrVersio:=0;
      FileAttrs := 0;
      FileAttrs := FileAttrs + faAnyFile;
      if FindFirst(Template, FileAttrs, sr) = 0 then
         repeat
               S:=Trim(sr.Name);
               s:=Copy(S,length(S)-7,4);
               Val(s,i,j);
               if j=0 then
                  if i>CurrVersio then
                     CurrVersio:=i;
         until FindNext(sr) <> 0;
      SysUtils.FindClose(sr);
      Inc(CurrVersio);
      s:=Trim(IntToStr(CurrVersio));
      while (Length(s)<4) do s:='0'+s;
      ss:=StringReplace(Template,'????',s,[rfReplaceAll, rfIgnoreCase]);
      if not RenameFile(localName,ss) then
         begin
              showMessage('Ошибка переименования '+localName+' в '+template);
              retVal:=False;
         end;
      s           := getMainDataDrive;
      nameNetwork := s+copy(localName,3,length(localName)-2);
     // copyFile

      if not CopyFile(PAnsiChar(nameNetwork) , PAnsiChar(localName),false) then
         begin
              showMessage('Ошибка Копирования '+nameNetwork+' в '+localName+' Код ошибки='+IntToStr(GetLastError) );
              retVal:=False;
         end;

      copyOriginProgram:=retVal;
  end;

function checkNetworkDrive(Drive:char):boolean;
var
  PathStr: array[0..MAX_PATH] of Char;
  LPathStr: DWord;
  retVal:Boolean;
begin
  retVal:=false;
  LPathStr:=MAX_PATH;
  if WNetGetConnection(
        PChar(''+Drive+':'),
        PathStr,
        LPathStr)=NO_ERROR then retVal:=true;
  checkNetworkDrive:=retVal;
end;

end.
 