unit UVersionAPP;

interface

implementation
uses ShellApi,SysUtils,WIndows;

type
  TFileVersionInfo = record 
    FileType, 
    CompanyName, 
    FileDescription, 
    FileVersion, 
    InternalName, 
    LegalCopyRight, 
    LegalTradeMarks, 
    OriginalFileName, 
    ProductName, 
    ProductVersion, 
    Comments, 
    SpecialBuildStr, 
    PrivateBuildStr, 
    FileFunction : string; 
    DebugBuild, 
    PreRelease, 
    SpecialBuild, 
    PrivateBuild, 
    Patched, 
    InfoInferred : Boolean; 
  end; 

function FileVersionInfo(const sAppNamePath: TFileName): TFileVersionInfo; 
var 
  rSHFI: TSHFileInfo; 
  iRet: Integer; 
  VerSize: Integer; 
  VerBuf: PChar; 
  VerBufValue: Pointer; 
  VerHandle: Cardinal; 
  VerBufLen: Cardinal; 
  VerKey: string; 
  FixedFileInfo: PVSFixedFileInfo; 

  // dwFileType, dwFileSubtype 
  function GetFileSubType(FixedFileInfo: PVSFixedFileInfo) : string; 
  begin 
    case FixedFileInfo.dwFileType of 

      VFT_UNKNOWN: Result := 'Unknown'; 
      VFT_APP: Result := 'Application'; 
      VFT_DLL: Result := 'DLL'; 
      VFT_STATIC_LIB: Result := 'Static-link Library'; 

      VFT_DRV: 
        case 
          FixedFileInfo.dwFileSubtype of 
          VFT2_UNKNOWN: Result := 'Unknown Driver'; 
          VFT2_DRV_COMM: Result := 'Communications Driver'; 
          VFT2_DRV_PRINTER: Result := 'Printer Driver'; 
          VFT2_DRV_KEYBOARD: Result := 'Keyboard Driver'; 
          VFT2_DRV_LANGUAGE: Result := 'Language Driver'; 
          VFT2_DRV_DISPLAY: Result := 'Display Driver'; 
          VFT2_DRV_MOUSE: Result := 'Mouse Driver'; 
          VFT2_DRV_NETWORK: Result := 'Network Driver'; 
          VFT2_DRV_SYSTEM: Result := 'System Driver'; 
          VFT2_DRV_INSTALLABLE: Result := 'InstallableDriver'; 
          VFT2_DRV_SOUND: Result := 'Sound Driver'; 
        end; 
      VFT_FONT: 
         case FixedFileInfo.dwFileSubtype of 
          VFT2_UNKNOWN: Result := 'Unknown Font'; 
          VFT2_FONT_RASTER: Result := 'Raster Font'; 
          VFT2_FONT_VECTOR: Result := 'Vector Font'; 
          VFT2_FONT_TRUETYPE: Result :='Truetype Font'; 
          else; 
        end; 
      VFT_VXD: Result :='Virtual Defice Identifier = ' + 
          IntToHex(FixedFileInfo.dwFileSubtype, 8); 
    end; 
  end; 


  function HasdwFileFlags(FixedFileInfo: PVSFixedFileInfo;
  Flag : Word) : Boolean;
  begin 
    Result := (FixedFileInfo.dwFileFlagsMask and 
              FixedFileInfo.dwFileFlags and 
              Flag) = Flag; 
  end; 

  function GetFixedFileInfo: PVSFixedFileInfo; 
  begin 
    if not VerQueryValue(VerBuf, '', Pointer(Result), VerBufLen) then 
      Result := nil 
  end; 

  function GetInfo(const aKey: string): string; 
  begin 
    Result := ''; 
    VerKey := Format('\StringFileInfo\%.4x%.4x\%s', 
              [LoWord(Integer(VerBufValue^)), 
               HiWord(Integer(VerBufValue^)), aKey]); 
    if VerQueryValue(VerBuf, PChar(VerKey),VerBufValue,VerBufLen) then 
      Result := StrPas(VerBufValue); 
  end; 

  function QueryValue(const aValue: string): string; 
  begin 
    Result := ''; 
    // obtain version information about the specified file 
    if GetFileVersionInfo(PChar(sAppNamePath), VerHandle,
    VerSize, VerBuf) and
       // return selected version information 
       VerQueryValue(VerBuf, '\VarFileInfo\Translation',
       VerBufValue, VerBufLen) then
         Result := GetInfo(aValue); 
  end; 


begin 
  // Initialize the Result 
  with Result do 
  begin 
    FileType := ''; 
    CompanyName := ''; 
    FileDescription := ''; 
    FileVersion := ''; 
    InternalName := ''; 
    LegalCopyRight := ''; 
    LegalTradeMarks := ''; 
    OriginalFileName := ''; 
    ProductName := ''; 
    ProductVersion := ''; 
    Comments := ''; 
    SpecialBuildStr:= ''; 
    PrivateBuildStr := ''; 
    FileFunction := ''; 
    DebugBuild := False; 
    Patched := False; 
    PreRelease:= False; 
    SpecialBuild:= False; 
    PrivateBuild:= False; 
    InfoInferred := False; 
  end; 

  // Get the file type 
  if SHGetFileInfo(PChar(sAppNamePath), 0, rSHFI, SizeOf(rSHFI), 
    SHGFI_TYPENAME) <> 0 then 
  begin 
    Result.FileType := rSHFI.szTypeName; 
  end; 

  iRet := SHGetFileInfo(PChar(sAppNamePath), 0, rSHFI,
  SizeOf(rSHFI), SHGFI_EXETYPE); 
  if iRet <> 0 then 
  begin 
    // determine whether the OS can obtain version information 
    VerSize := GetFileVersionInfoSize(PChar(sAppNamePath), VerHandle); 
    if VerSize > 0 then 
    begin 
      VerBuf := AllocMem(VerSize); 
      try 
        with Result do 
        begin 
          CompanyName      := QueryValue('CompanyName'); 
          FileDescription  := QueryValue('FileDescription'); 
          FileVersion      := QueryValue('FileVersion'); 
          InternalName     := QueryValue('InternalName'); 
          LegalCopyRight   := QueryValue('LegalCopyRight'); 
          LegalTradeMarks  := QueryValue('LegalTradeMarks'); 
          OriginalFileName := QueryValue('OriginalFileName'); 
          ProductName      := QueryValue('ProductName'); 
          ProductVersion   := QueryValue('ProductVersion'); 
          Comments         := QueryValue('Comments'); 
          SpecialBuildStr  := QueryValue('SpecialBuild'); 
          PrivateBuildStr  := QueryValue('PrivateBuild'); 
          // Fill the  VS_FIXEDFILEINFO structure 
          FixedFileInfo    := GetFixedFileInfo; 
          DebugBuild       := HasdwFileFlags(FixedFileInfo,VS_FF_DEBUG); 
          PreRelease       := HasdwFileFlags(FixedFileInfo,VS_FF_PRERELEASE); 
          PrivateBuild     := HasdwFileFlags(FixedFileInfo,VS_FF_PRIVATEBUILD); 
          SpecialBuild     := HasdwFileFlags(FixedFileInfo,VS_FF_SPECIALBUILD); 
          Patched          := HasdwFileFlags(FixedFileInfo,VS_FF_PATCHED); 
          InfoInferred     := HasdwFileFlags(FixedFileInfo,VS_FF_INFOINFERRED); 
          FileFunction     := GetFileSubType(FixedFileInfo); 
        end; 
      finally 
        FreeMem(VerBuf, VerSize); 
      end 
    end; 
  end 
end; 

// Test it: 

//procedure TForm.Button1Click(Sender: TObject);
procedure TestIt;
(*
var
  FvI: TFileVersionInfo;
const
  Tabulator: array[0..0] of Integer = (70);
  BoolValues: array[Boolean] of string = ('No', 'Yes');
begin
  FvI := FileVersionInfo('C:\FileName.exe');
  ListBox1.TabWidth := 1;
  SendMessage(ListBox1.Handle, LB_SETTABSTOPS, 1, Longint(@Tabulator));
  with FvI, ListBox1.Items do
  begin
    Add('FileType:'#9 + FileType);
    Add('CompanyName:'#9 + CompanyName);
    Add('CompanyName:'#9 + FileDescription);
    Add('FileVersion:'#9 + FileVersion);
    Add('InternalName:'#9 + InternalName);
    Add('LegalCopyRight:'#9 + LegalCopyRight);
    Add('LegalTradeMarks:'#9 + LegalTradeMarks);
    Add('OriginalFileName:'#9 + OriginalFileName);
    Add('ProductName:'#9 + ProductName);
    Add('ProductVersion:'#9 + ProductVersion);
    Add('SpecialBuildStr:'#9 + SpecialBuildStr);
    Add('PrivateBuildStr:'#9 + PrivateBuildStr);
    Add('FileFunction:'#9 + FileFunction);
    Add('DebugBuild:'#9 + BoolValues[DebugBuild]);
    Add('PreRelease:'#9 + BoolValues[PreRelease]);
    Add('PrivateBuild:'#9 + BoolValues[PrivateBuild]);
    Add('SpecialBuild:'#9 + BoolValues[SpecialBuild]);
  end;
end;
*)
begin
end;




end.
