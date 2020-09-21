unit FormPodrU;
                       
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids;

type
  TFormPodr = class(TForm)
    StringGrid1: TStringGrid;
    Label1: TLabel;
    BitBtnClearFilter: TBitBtn;
    LabelFilter: TLabel;
    BitBtnUp: TBitBtn;
    BitBtnDown: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SetNSRV(I:Integer);
    procedure SetNSRVByFilter;
    procedure SetNSRVByFilterForward;
    procedure SetNSRVByFilterBackward;
    function GetNSRV:Integer;
    function Execute: boolean;
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure BitBtnClearFilterClick(Sender: TObject);
    procedure BitBtnDownClick(Sender: TObject);
    procedure BitBtnUpClick(Sender: TObject);
  private
    Locator:integer;
    LocatorSaved:Integer;
    FilterString:string;
    SelectedPodr:Integer;
    MaxPodrNo:Integer;
    procedure MakeGrid;
    procedure LocatePodr;
    procedure FocusRow;
    function getLineNoByShifrPod(shifrPod:integer):Integer;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPodr: TFormPodr;

implementation
  uses ScrDef,IniFiles,ScrLists,ScrExport,ScrUtil, UFibModule, uFormWait,
  FIBDatabase;
{$R *.dfm}

procedure TFormPodr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormPodr.BitBtn2Click(Sender: TObject);
begin
     ExportPodr;
end;

procedure TFormPodr.StringGrid1DblClick(Sender: TObject);
var S:String;
    i,k:integer;
begin
     S:=StringGrid1.Cells[0,StringGrid1.Row];
     val(S,I,K);
     SelectedPodr:=0;
     if k=0 then SelectedPodr:=I;
     ModalResult:=mrOk;
{     FormClose;      }
end;

procedure TFormPodr.FormShow(Sender: TObject);
begin
      Locator := 0;
      FilterString:='';
      LabelFilter.Caption:=FilterString;
      BitBtnUp.Hide;
      BitBtnDown.Hide;
      BitBtnUp.Enabled:=false;
      BitBtnDown.Enabled:=False;

     Self.MakeGrid;
     StringGrid1.SetFocus;
end;

procedure TFormPodr.SetNSRV(I:Integer);
 begin
       SelectedPodr:=shifr_serv(I);
       if isLNR then
          Caption:='Подразделение '+IntToStr(SelectedPodr)
       else
          Caption:='Пiдроздiл '+IntToStr(SelectedPodr)

 end;
function TFormPodr.GetNSRV:Integer;
 begin
       Result:=SelectedPodr;
{
       if SelectedPodr>0 then
          StringGrid1.Row:=SelectedPodr;
}          
 end;
procedure TFormPodr.SetNSRVByFilter;
 var i:Integer;
 begin
       i := NameServList.findShifrPodByFilter(FilterString);
       if i<1 then
          Caption:=''
       else
          begin
               SelectedPodr:=shifr_serv(I);
     //          Locator:=selectedPodr;
               if isLNR then
                  Caption:='Подразделение '+IntToStr(SelectedPodr)
               else
                  Caption:='Пiдроздiл '+IntToStr(SelectedPodr);
          end;

 end;
procedure TFormPodr.SetNSRVByFilterForward;
 var i:Integer;
 begin
       if SelectedPodr<1 then Exit;
       if length(trim(FilterString))<1 then exit;
       i := NameServList.findShifrPodByFilter(FilterString,SelectedPodr);
       if i<1 then
          Caption:=''
       else
          begin
               SelectedPodr:=shifr_serv(I);
      //         Locator:=SelectedPodr;
               if isLNR then
                  Caption:='Подразделение '+IntToStr(SelectedPodr)
               else
                  Caption:='Пiдроздiл '+IntToStr(SelectedPodr);
          end;

 end;

procedure TFormPodr.SetNSRVByFilterBackward;
 var i:Integer;
 begin
       if SelectedPodr<1 then Exit;
       i := NameServList.findShifrPodByFilter(FilterString,SelectedPodr,1);
       if i<1 then
          Caption:=''
       else
          begin
               SelectedPodr:=shifr_serv(I);
               if isLNR then
                  Caption:='Подразделение '+IntToStr(SelectedPodr)
               else
                  Caption:='Пiдроздiл '+IntToStr(SelectedPodr);
          end;

 end;

function TFormPodr.getLineNoByShifrPod(shifrPod:integer):Integer;
 var Rec,i,iVal,iErr,retVal:Integer;
     s:string;
 begin
      retVal:=shifrPod;
      Rec:=StringGrid1.RowCount-1;
      if Rec>0 then
         for i:=1 to Rec  do
             begin
                   s:=StringGrid1.Cells[0,i];
                   s:=Trim(s);
                   Val(s,iVal,iErr);
                   if iErr=0 then
                      if iVal=shifrPod then
                         begin
                              retVal:=i;
                              Break;
                         end;
             end;
      getLineNoByShifrPod:=retVal;
 end;


function TFormPodr.Execute: boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;

procedure TFormPodr.FormCreate(Sender: TObject);
begin
{
      Width  := 532;
      Height := 572;
      StringGrid1.Height := 501;
      StringGrid1.Width  := 509;
}
      FilterString:='';
      LabelFilter.Caption:=FilterString;
      BitBtnUp.Hide;
      BitBtnDown.Hide;
      BitBtnUp.Enabled:=false;
      BitBtnDown.Enabled:=False;
end;

procedure TFormPodr.MakeGrid;
 var i,c,c_nsrv  : integer;
     Ini         : TIniFile;
     SQL_Mode    : Integer;
     SQL_ModeS   : String;
     SQLStmnt    : string;
     v           : Variant;
     i_pos       : Integer;
     FIBName     : string;
     fName       : string;
 begin
      fName:=getIniFileName;
//      Ini := TIniFile.Create( ChangeFileExt( Application.ExeName, '.INI' ) );
      Ini := TIniFile.Create(fName);
      try
         SQL_ModeS := Ini.ReadString( 'Parameters', 'SQLPickMode', '0' );
         if SQL_ModeS='SQL' then SQL_Mode:=1
                            else SQL_Mode:=0;
      finally
         Ini.Free;
      end;
      if SQL_Mode=1 then
         begin

//              I:=GetShifrWrk;
              FIBName:=FIB.pFIBDatabaseSal.DBFileName;
              SqlStmnt:='SELECT count(*) FROM PR_GET_BUH_ACC_PODR';
              v:=FIB.pFIBDatabaseSal.QueryValue(SqlStmnt,0);
              if VarIsNumeric(v) then
                 c:=v
              else
                begin
                    ShowMessage('Нет доступа к просмотру подразделений');
                    KZ:=-1;
                    FIB.pFIBTransactionSAL.Commit;
                    Exit;
                end;

              ModalResult := mrCancel;
              StringGrid1.ColCount:=2;
              StringGrid1.RowCount:=C+1;
              StringGrid1.ColWidths[0]:=30;
              StringGrid1.ColWidths[1]:=350;
              StringGrid1.Width:=StringGrid1.ColWidths[0]+StringGrid1.ColWidths[1]+20;
              Width:=StringGrid1.Width+10;
              Height:=StringGrid1.Height+100;
              StringGrid1.Cells[0,0]:='Номер';
              if isLNR then
                 StringGrid1.Cells[1,0]:='Название'
              else
                 StringGrid1.Cells[1,0]:='Назва';

//              I:=GetShifrWrk;
              FIB.pFIBQuery.SQL.Clear;
//              FIB.pFIBQuery.SQL.Add('SELECT ShifrPod FROM TB_BUH_ACCESS WHERE ShifrBuh='+IntToSTr(I)+' ORDER BY SHIFRPOD');
              FIB.pFIBQuery.SQL.Add('SELECT ShifrPod FROM PR_GET_BUH_ACC_PODR');

              FIB.pFIBTransactionSAL.StartTransaction;
              try
                 FIB.pFIBQuery.ExecQuery;
                 c:=0;
                 c_nsrv:=0;
                 MaxPodrNo:=0;
                 while not FIB.pFIBQuery.Eof do
                  begin
                       I:=FIB.pFIBQuery.Fields[0].AsInteger;
                       i_pos:=Pos('РЕЗЕРВ',UPPER_STRING(NAME_SERV(SHIFR_SERV(I))));
                       if i_pos=0 then
                          i_pos:=Pos('ПУСТОЕ',UPPER_STRING(NAME_SERV(SHIFR_SERV(I))));

//                       if isSVDN then
                           if ((isProtectedPodr(i)) and
                               (not canViewProtectedPodr)) then
                              i_pos:=10;

                       if i_pos=0 then
                          begin
                                Inc(C);
                                Inc(c_nsrv);
                                 if SHIFR_SERV(i)>MaxPodrNo then
                                    MaxPodrNo:=SHIFR_SERV(i);
                                StringGrid1.Cells[0,c]:=IntToStr(I);
                                StringGrid1.Cells[1,c]:=NAME_SERV(SHIFR_SERV(I));
                          end;       
                       FIB.pFIBQuery.Next;
                  end;
                 StringGrid1.RowCount:=C_nsrv+1;
                 FormWait.Hide;
                 FIB.pFIBQuery.Close;
              except
                    MessageDlg('Ошибка получения списка подразделений для участка',mtInformation, [mbOk], 0);
                    KZ:=-1;
                    FIB.pFIBTransactionSAL.Commit;
                    Exit;
              end;
              FIB.pFIBTransactionSAL.Commit;
              if C<=0 then
                 ShowMessage('Нет подразделений');
         end                {IF SQL MODE}
      else
         begin
                StringGrid1.RowCount:=NameServList.Count+1;
                StringGrid1.ColWidths[0]:=30;
                StringGrid1.ColWidths[1]:=450;
                c_nsrv:=0;
                MaxPodrNo:=0;
                for i:=1 to NameServList.Count do
                    begin
                         i_pos:=Pos('РЕЗЕРВ',UPPER_STRING(NAME_SERV(SHIFR_SERV(I))));
                         if i_pos=0 then
                            i_pos:=Pos('ПУСТОЕ',UPPER_STRING(NAME_SERV(SHIFR_SERV(I))));
                         if i_pos=0 then
                            begin
                                 Inc(c_nsrv);
                                 if SHIFR_SERV(i)>MaxPodrNo then
                                    MaxPodrNo:=SHIFR_SERV(i);
                               //  StringGrid1.Cells[0,i]:=IntToStr(I);
                                 StringGrid1.Cells[0,i]:=IntToStr(SHIFR_SERV(i));
                                 StringGrid1.Cells[1,i]:=NAME_SERV(SHIFR_SERV(I));
                            end;
                    end;
                 StringGrid1.RowCount:=C_nsrv+1;
                    
         end;

     FocusRow;
 end;

procedure TFormPodr.StringGrid1KeyPress(Sender: TObject; var Key: Char);
 var i,j:integer;
begin
      i:=ord(Key);
      if not ((key in ['0'..'9']) or (i=8) or (i=13) or (key in ['А'..'Я']) or (key in ['а'..'я']) or (Key=' ')) then Exit;
      if (i=13) then
         begin
              StringGrid1DblClick(Sender);
              Exit;
         end
      else
     if (i=8) and (Locator>0) then
         begin
              Locator:=Locator div 10;
     {        if Locator<1 then Locator:=0;}
              LocatePodr;
         end
     else
     if (i=8) and (Length(FilterString)>0) then
         begin
              FilterString:=Copy(FilterString,1,Length(FilterString)-1);
              LabelFilter.Caption:=FilterString;
              LocatePodr;
         end
     else
     if (key in ['0'..'9']) then
         begin
              if Locator>MaxPodrNo then Exit;
              if key in ['0'..'9'] then
                 begin
                      FilterString:='';
                      LabelFilter.Caption:=FilterString;
                      val(Key,i,j);
                      Locator := Locator*10 + i;
                      FilterString:=Trim(IntToStr(Locator));
                      LabelFilter.Caption:=FilterString;
                      LocatePodr;
                 end;
         end
     else
     if ((key in ['А'..'Я']) or (key in ['а'..'я']) or (Key=' ')) then
        begin
             if (locator>0) then
                 LocatorSaved:=Locator;
             Locator:=0;
             FilterString:=FilterString+key;
             LabelFilter.Caption:=FilterString;
             LocatePodr;
        end;
     if Length(Trim(FilterString))>0 then
        begin
             BitBtnUp.Show;
             BitBtnDown.Show;
             BitBtnUp.Enabled:=true;
             BitBtnDown.Enabled:=true;
        end
     else
        begin
             BitBtnUp.Hide;
             BitBtnDown.Hide;
             BitBtnUp.Enabled:=false;
             BitBtnDown.Enabled:=False;
        end;

end;

procedure TFormPodr.LocatePodr;
 var lineno:Integer;
begin
      if (Locator>0) and (Locator<=MaxPodrNo)then
         begin
       //       lineno:=getLineNoByShifrPod(locator);
              if Locator=0 then SetNSRV(1)
                           else SetNSRV(Locator);
              FocusRow;
              Application.ProcessMessages;
         end
      else
      if ((Length(Trim(FilterString))>0) and (Locator=0))  then
         begin
              SetNSRVByFilter;
              FocusRow;
              Application.ProcessMessages;
         end;

end;

procedure TFormPodr.FocusRow;
 var i:integer;
 begin
     if SelectedPodr>0 then
        begin
             for i:=1 to StringGrid1.RowCount do
                 begin
                       if AllTrim(StringGrid1.Cells[0,i])=AllTrim(IntToStr(SelectedPodr)) then
                          begin
                               StringGrid1.Row:=I;
                               Exit;
                          end;
                 end;
        end;
 end;

procedure TFormPodr.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
 var i,k:integer;
     S:String;
begin
     S:=StringGrid1.Cells[0,ARow];
     val(S,I,K);
     SetNSRV(I);
end;

procedure TFormPodr.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
     Locator:=0;
end;

procedure TFormPodr.BitBtnClearFilterClick(Sender: TObject);
begin
     FilterString:='';
     LabelFilter.Caption:='';
     Caption:='';
     StringGrid1.SetFocus;
     Application.ProcessMessages;
end;

procedure TFormPodr.BitBtnDownClick(Sender: TObject);
begin
      if (Length(Trim(FilterString))>0)  then
         begin
              SetNSRVByFilterForward;
              FocusRow;
              Application.ProcessMessages;
         end;
      StringGrid1.SetFocus;

end;

procedure TFormPodr.BitBtnUpClick(Sender: TObject);
begin
      if (Length(Trim(FilterString))>0)  then
         begin
              SetNSRVByFilterBackward;
              FocusRow;
              Application.ProcessMessages;
         end;
      StringGrid1.SetFocus;

end;

end.


