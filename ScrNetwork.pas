unit scrnetwork;

interface
function isNetworkDriveStarted:boolean;
function isNetworkDrive(Drive:string):boolean;
function getMainDataDrive:string;

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
 begin
       typ := GetDriveType(PChar(drive));
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
begin
  s:=upperCase(Drive);
  ch:=s[1];
  if (DiskFree(Ord(ch)-Ord('A')+1) > -1) then
     begin
         checkNetWorkEnabled := True; {disc is available}
     end
  else
     checkNetWorkEnabled := False; {is not available}
end;

function getMainDataDrive:string;
 var retVal:string;
 begin
       if isLNR and isNetworkDrive('J') then retVal:='J:'
       else
       if isSVDN and isNetworkDrive('D') then retVal:='D:'
       else
//          retVal:=ExtractFileDrive(Application.exeName);
       retVal:='E:';   
       getMainDataDrive:=retVal;
 end;

end.
 