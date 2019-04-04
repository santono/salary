unit scrnetwork;

interface
function isNetworkDriveStarted:boolean;
function isNetworkDrive(Drive:string):boolean;
function getMainDataDrive:string;
function needCopyOriginProgram:boolean;

implementation
 uses Forms,SysUtils,Windows,ScrDef;

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
 begin
     retVal:=false;
     nameLocal:=Application.ExeName;
     ageLocal:=FileAge(nameLocal);
     s:=getMainDataDrive;
     nameNetwork:=s+copy(nameLocal,2,length(nameLocal)-1);
     ageNetwork:=FileAge(nameNetwork);
     if ageNetwork>ageLocal then
        retVal:=true;
     needCopyOriginProgram:=retVal;
 end;

end.
 