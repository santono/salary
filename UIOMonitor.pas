unit UIOMonitor;

interface
    function GetIPAddress:string;
    function GetLocalIPAddress: String;
    function GetMACAdress: string;
    function Get_MACAddress: string;
    function waitForFreeFile(NSERV:integer):Boolean;
    function unLockServFile(NSERV:integer):Boolean;
    function lockServFile(NSERV:integer):Boolean;
    function isIOFileFree(NSERV:integer):Boolean;
    function unLockAllMy:Boolean;

implementation
uses
  WinSock,NB30,SysUtils,UFibModule, Variants,ScrUtil,ScrDef;

function GetIPAddress:string;
var
  WSAData: TWSAData;
  p: PHostEnt;
  name: array [0..255] of AnsiChar;
begin
  Result:='';
  Exit;
  WSAStartup($0101, WSAData);
  gethostname(name, 256);
  p := gethostbyname(name);
  result := inet_ntoa(PInAddr(P.H_ADDR_LIST^)^);
  WSACleanup;
end;


function GetLocalIPAddress: String;
const WSVer = $101;
var
  wsaData: TWSAData;
  P: PHostEnt;
  Buf: array [0..127] of Char;
begin
  Result := '';
  Exit;
  if WSAStartup(WSVer, wsaData) = 0 then begin
    if GetHostName(@Buf, 128) = 0 then begin
      P := GetHostByName(@Buf);
      if P <> nil then Result := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
    end;
    WSACleanup;
  end;
end;

function GetMACAdress: string;
 var
   NCB: PNCB;
   Adapter: PAdapterStatus;

   URetCode: PChar;
   RetCode: char;
   I: integer;
   Lenum: PlanaEnum;
   _SystemID: string;
   TMPSTR: string;
 begin
   Result    := '';
   _SystemID := '';
   Getmem(NCB, SizeOf(TNCB));
   Fillchar(NCB^, SizeOf(TNCB), 0);

   Getmem(Lenum, SizeOf(TLanaEnum));
   Fillchar(Lenum^, SizeOf(TLanaEnum), 0);

   Getmem(Adapter, SizeOf(TAdapterStatus));
   Fillchar(Adapter^, SizeOf(TAdapterStatus), 0);

   Lenum.Length    := chr(0);
   NCB.ncb_command := chr(NCBENUM);
   NCB.ncb_buffer  := Pointer(Lenum);
   NCB.ncb_length  := SizeOf(Lenum);
   RetCode         := Netbios(NCB);

   i := 0;
   repeat
     Fillchar(NCB^, SizeOf(TNCB), 0);
     Ncb.ncb_command  := chr(NCBRESET);
     Ncb.ncb_lana_num := lenum.lana[I];
     RetCode          := Netbios(Ncb);

     Fillchar(NCB^, SizeOf(TNCB), 0);
     Ncb.ncb_command  := chr(NCBASTAT);
     Ncb.ncb_lana_num := lenum.lana[I];
     // Must be 16 
    Ncb.ncb_callname := '*               ';

     Ncb.ncb_buffer := Pointer(Adapter);

     Ncb.ncb_length := SizeOf(TAdapterStatus);
     RetCode        := Netbios(Ncb);
     //---- calc _systemId from mac-address[2-5] XOR mac-address[1]... 
    if (RetCode = chr(0)) or (RetCode = chr(6)) then
     begin
         _SystemId := IntToHex(Ord(Adapter.adapter_address[0]), 2) + '-' +
         IntToHex(Ord(Adapter.adapter_address[1]), 2) + '-' +
         IntToHex(Ord(Adapter.adapter_address[2]), 2) + '-' +
         IntToHex(Ord(Adapter.adapter_address[3]), 2) + '-' +
         IntToHex(Ord(Adapter.adapter_address[4]), 2) + '-' +
         IntToHex(Ord(Adapter.adapter_address[5]), 2);
     end;
     Inc(i);
   until (I >= Ord(Lenum.Length)) or (_SystemID <> '00-00-00-00-00-00');
   FreeMem(NCB);
   FreeMem(Adapter);
   FreeMem(Lenum);
   GetMacAdress := _SystemID;
 end;
function CoCreateGuid(var guid: TGUID): HResult; stdcall; far external 'ole32.dll';
function Get_MACAddress: string;
var
  g: TGUID;
  i: Byte;
begin
  Result := '';
  CoCreateGUID(g);
  for i := 2 to 7 do
    Result := Result + IntToHex(g.D4[i], 2);
end;

function isIOFileFree(NSERV:integer):Boolean;
 var v:Variant;
     retVal:Integer;
     rv:boolean;
     SQLStmnt:string;
 begin
     if UseIOSQLMonitorLevel<1 then
        begin
             isIOFileFree:=true;
             Exit;
        end;

     SQLStmnt:='select first 1 retval from pr_io_isfree('+IntToStr(NSERV)+')';
     v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     if  VarIsNumeric(v) then
         retval:=v
     else
         retval:=0;
     if retVal=1 then
        rv:=True
     else
        rv:=false;
     isIOFileFree:=rv;


 end;

function lockServFile(NSERV:integer):Boolean;
 var v:Variant;
     retVal:Integer;
     rv:boolean;
     SQLStmnt:string;
     ip:string;
     mac:string;
 begin
     if UseIOSQLMonitorLevel<1 then
        begin
             lockServFile:=true;
             Exit;
        end;

     ip:=GetLocalIPAddress;
     mac:=GetMACAdress;
     SQLStmnt:='select first 1 retval from pr_io_lock('+IntToStr(NSERV)+','''+ip+''','''+mac+''')';
     v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     if  VarIsNumeric(v) then
         retval:=v
     else
         retval:=0;
     if retVal=1 then
        rv:=True
     else
        rv:=false;
     lockServFile:=rv;


 end;
function unLockServFile(NSERV:integer):Boolean;
 var v:Variant;
     retVal:Integer;
     rv:boolean;
     SQLStmnt:string;
     ip:string;
     mac:string;
 begin
     if UseIOSQLMonitorLevel<1 then
        begin
             unLockServFile:=true;
             Exit;
        end;

     ip:=GetLocalIPAddress;
     mac:=GetMACAdress;
     SQLStmnt:='select first 1 retval from pr_io_unlock('+IntToStr(NSERV)+','''+ip+''','''+mac+''')';
     v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     if  VarIsNumeric(v) then
         retval:=v
     else
         retval:=0;
     if retVal=1 then
        rv:=True
     else
        rv:=false;
     unLockServFile:=rv;


 end;

 function waitForFreeFile(NSERV:integer):Boolean;
 const l=500;
 var free:Boolean;
     i:Integer;
 begin
     if UseIOSQLMonitorLevel<1 then
        begin
             waitForFreeFile:=true;
             Exit;
        end;

      i:=0;
      free:=false;
      while True do
        begin
             if isIOFileFree(NSERV) then
                begin
                     free:=True;
                     break;
                end;
             delay(1000);
             inc(i);
             if (i>l) then
                Break;
        end;
     waitForFreeFile:=free;
 end;

function unLockAllMy:Boolean;
 var v:Variant;
     SQLStmnt:string;
     ip:string;
     mac:string;
 begin
     if UseIOSQLMonitorLevel<1 then
        begin
             unLockAllMy:=true;
             Exit;
        end;

     ip:=GetLocalIPAddress;
     mac:=GetMACAdress;
     SQLStmnt:='select first 1 retval from pr_io_unlock_all_my('''+ip+''','''+mac+''')';
     v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     unLockAllMy:=True;

 end;

end.
