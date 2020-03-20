unit uUpdFormPens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons;

const YearFr = 2000;
      YearTo = 2020;

type
  TFormPensSpr2006 = class(TForm)
    StringGridS: TStringGrid;
    LabelFIO: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtnLnr2013: TBitBtn;
    BitBtnLNR2015: TBitBtn;
    BitBtnLnr2009: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    function Execute: boolean;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure StringGridSDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridSDblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtnLnr2013Click(Sender: TObject);
    procedure BitBtnLNR2015Click(Sender: TObject);
    procedure BitBtnLnr2009Click(Sender: TObject);
  private
  //   YearFr : integer;
  //   YearTo : integer;
     procedure MakeGrid;
     procedure FillGrid;
     procedure FillArray;
     procedure PrintPensSpr2013_2;
     procedure PrintPensSpr2013_Ola;
     procedure PrintLnr20132015Grn(yStart:integer);
     procedure PrintLnr20152020Rub;



    { Private declarations }
  public
    { Public declarations }
    WantedTabno : integer;
    WantedFio   : string;
    ActClar     : integer;
    WantedId    : integer;
    arr         : array[1..12,1..YearTo-YearFr+1] of real;
    summy       : array[1..YearTo-YearFr+1] of real;
    WantedYear  : integer;
    WantedMonth : integer;
  end;

var
  FormPensSpr2006: TFormPensSpr2006;

implementation
 uses uFIBModule, uFormWait, uFrmFindKadryFB, UFormPensPrPr, IniFiles,ComObj,
      uInitArc,Math;

{$R *.dfm}

procedure TFormPensSpr2006.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormPensSpr2006.MakeGrid;
 var i,j,w:integer;
 begin
     StringGridS.RowCount  := 14 ;
     StringGridS.ColCount  := YearTo-YearFr+2 ;

     for i:=0 to StringGridS.ColCount-1 do
         for j:=0 to StringGridS.RowCount-1 do
             begin
                   StringGridS.Cells[i,j]:='';
                   if Assigned(StringGridS.Objects[i,j]) then
                      begin
                           StringGridS.Objects[i,j].Free;
                           StringGridS.Objects[i,j]:=Nil;
                      end;
             end;
     StringGridS.ColWidths[0] := 80;
     StringGridS.Cells[0,0]   := '';
     for i:=YearFr to YearTo do
         begin
              j:=i-YearFr+1;
              StringGridS.Cells[j,0]:=IntToStr(i);
              StringGridS.ColWidths[j]:=80;
         end;
     StringGridS.Cells[0,1]  := 'Январь';
     StringGridS.Cells[0,2]  := 'Февраль';
     StringGridS.Cells[0,3]  := 'Март';
     StringGridS.Cells[0,4]  := 'Апрель';
     StringGridS.Cells[0,5]  := 'Май';
     StringGridS.Cells[0,6]  := 'Июнь';
     StringGridS.Cells[0,7]  := 'Июль';
     StringGridS.Cells[0,8]  := 'Август';
     StringGridS.Cells[0,9]  := 'Сентябрь';
     StringGridS.Cells[0,10] := 'Октябрь';
     StringGridS.Cells[0,11] := 'Ноябрь';
     StringGridS.Cells[0,12] := 'Декабрь';
     StringGridS.Cells[0,13] := 'И т о г о';
     w:=0;
     for i:=1 to StringGridS.ColCount do w:=w+StringGridS.ColWidths[i-1];
     StringGridS.Width:=w+20;
     w:=0;
     for i:=1 to StringGridS.RowCount do w:=w+StringGridS.RowHeights[i-1];
     StringGridS.Height:=w+20;
     Height:=StringGridS.Height + 150;
     if isLNR then
        Height:=Height+bitBtnLnr2013.height;
     Width:=StringGridS.Width   +  50
 end;
procedure TFormPensSpr2006.FormShow(Sender: TObject);
begin
     MakeGrid;
{     if ActClar<>1 then}
        begin
             FillArray;
             FillGrid;
        end;
     ActiveControl:=StringGridS;
end;

procedure TFormPensSpr2006.FillArray;
 var y:integer;
     s:string;
     i:integer;
 begin
     FillChar(Arr,Sizeof(Arr),0);
     FillChar(Summy,Sizeof(Summy),0);
     if not Fib.pFIBQueryArc.Transaction.InTransaction then
        Fib.pFIBQueryArc.Transaction.StartTransaction;
     for y:=YearFr to YearTo do
      begin
           FIB.pFIBQueryArc.SQL.Clear;
           s:='select first 1 s1,s2,s3,s4,s5,s6,s7,s8,s9,s10,s11,s12 from pr_get_pensspr('+IntToStr(WantedId)+','+IntToStr(Y)+')';
           FIB.pFIBQueryArc.SQL.Add(S);
           try
              FormWait.Show;
              Application.ProcessMessages;
              FIB.pFIBQueryArc.ExecQuery;
              FormWait.Hide;
              for i:=1 to 12 do
                  arr[i,y-YearFr+1]:=FIB.pFIBQueryArc.Fields[i-1].AsFloat;
          except
              ShowMessage('Ошибка получения данных пенсионной справки');
          end;
          FIB.pFIBQueryArc.Close;
          FIB.pFIBQueryArc.SQL.Clear;
      end;
     if Fib.pFIBQueryArc.Transaction.InTransaction then
        Fib.pFIBQueryArc.Transaction.Commit;
     for y:=YearFr to YearTo do
         for i:=1 to 12 do
              summy[y-YearFr+1]:=summy[y-YearFr+1] + arr[i,y-YearFr+1];
 end;

procedure TFormPensSpr2006.FillGrid;
 var i,j : integer;
     s   : string;
 begin
     for i:=1 to StringGridS.ColCount-1 do
         for j:=1 to StringGridS.RowCount-2 do
             begin
                   StringGridS.Cells[i,j]:='';
                   if abs(arr[j,i])>0.005 then
                      begin
                           s:=FloatToStrF(Arr[j,i],ffFixed,15,2);
                           StringGridS.Cells[i,j]:=s;
                      end;
             end;
     for j:=YearFr to YearTo do
         if abs(summy[j-YearFr+1])>0.005 then
            begin
                 s:=FloatToStrF(summy[j-YearFr+1],ffFixed,15,2);
                 StringGridS.Cells[j-YearFr+1,StringGridS.RowCount-1]:=S;
            end;
    StringGridS.Row:=1;
    StringGridS.Col:=StringGridS.ColCount-1;

 end;

function TFormPensSpr2006.Execute: boolean;
begin
  if (ActClar<>1) then BitBtn2.Hide;
  if (ActClar>1) or  ((ActClar=1) and (Self.WantedTabno>0)) then
     begin
          LabelFio.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.WantedFio);
          if WantedId>0 then
             begin
{
                   FillArray;
                   FillGrid;
                   StringGridS.Refresh;
                   StringGridS.Repaint;
                   Application.ProcessMessages;
}
             end;
          if ((WantedTabno>0) and (length(trim(WantedFio))>0)) then
              BitBtn1.Hide;

     end;
  Self.visible:=false;
  ActiveControl:=StringGridS;
  if ShowModal = mrOk then result := true
                      else result := false;
end;

procedure TFormPensSpr2006.FormCreate(Sender: TObject);
begin
     FillChar(Arr,Sizeof(Arr),0);
//     YearFr:=2000;
//     YearTo:=2009;
     if isLNR then
        begin
             BitBtnLnr2009.Visible:=true;
             bitBtnLnr2009.enabled:=true;
             BitBtnLnr2013.Visible:=true;
             bitBtnLnr2013.enabled:=true;
             BitBtnLnr2015.Visible:=true;
             bitBtnLnr2015.enabled:=true;
        end
      else
        begin
             BitBtnLnr2009.Visible:=false;
             bitBtnLnr2009.enabled:=false;
             BitBtnLnr2013.Visible:=false;
             bitBtnLnr2013.enabled:=false;
             BitBtnLnr2015.Visible:=false;
             bitBtnLnr2015.enabled:=false;
        end;

   //  MakeGrid;
end;

procedure TFormPensSpr2006.BitBtn1Click(Sender: TObject);
begin
    LabelFio.Caption:='';
    if WantedTabno=0 then
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     Self.WantedTabno := GetTabno;
                     Self.WantedFIO   := GetFio;
                     LabelFio.Caption := IntToStr(Self.WantedTabno)+' '+Trim(Self.WantedFio);
               end;
         finally
            free;
         end;
       Self.Repaint;
end;

procedure TFormPensSpr2006.BitBtn2Click(Sender: TObject);
var S:String;
    Need_Mode:integer;
    WFio   : string  ;
   function ReplQuot(C:String):String;
    var i      : integer ;
        RetVal : string  ;
    begin
         FillChar(RetVal,SizeOf(RetVal),0);
         if length(Trim(C))=0 then RetVal:=c
                                 else
            begin
                 for i:=1 to length(C) do
                     begin
                           if ord(c[i])<ord(' ') then continue;
                           if not ((c[i]='''') or (c[i]='"')) then RetVal:=RetVal+c[i]
                                         else
                              begin
                                   RetVal:=RetVal+'''';
                                   RetVal:=RetVal+'''';
                              end;
                     end;
            end;
        ReplQuot:=RetVal;
    end;

begin
     if ActClar<>1 then Exit;
     if WantedTabno<1 then Exit;
     if length(trim(WantedFio))<1 then Exit;
     WFio:=ReplQuot(WantedFio);
     Need_Mode:=2;
     if MessageDlg('Отмечать только основную работу?',mtConfirmation, [mbYes, mbNo],  0) = mrYes then Need_Mode:=1;
     if not Fib.pFIBQueryArc.Transaction.InTransaction then
        Fib.pFIBQueryArc.Transaction.StartTransaction;

     FIB.pFIBQueryArc.SQL.Clear;
     s:='SELECT FIRST 1 SHIFRID FROM PR_GEN_NEW_PENS_SPR('+IntToStr(WantedTabno)+','''+trim(WFIO)+''','+IntToStr(Need_Mode)+')';
     FIB.pFIBQueryArc.SQL.Add(S);
     try
        FormWait.Show;
        Application.ProcessMessages;
        FIB.pFIBQueryArc.ExecQuery;
        WantedId:=FIB.pFIBQueryArc.Fields[0].AsInteger;
        FormWait.Hide;
     except
        ShowMessage('Ошибка генерации новой пенсионной справки');
     end;
     FIB.pFIBQueryArc.Close;
     FIB.pFIBQueryArc.SQL.Clear;
     if Fib.pFIBQueryArc.Transaction.InTransaction then
        Fib.pFIBQueryArc.Transaction.Commit;
     if WantedId>0 then BitBtn3Click(Nil)
                   else
        begin
              BitBtn2.Hide;
              ShowMessage('Этому сотруднику данные уже генерировались сегодня');
        end;
end;

procedure TFormPensSpr2006.StringGridSDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol     : integer;
    S             : String;
    Shift         : integer;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
begin
      vRow := aRow ;
      vCol := aCol ;
      if vCol=0 then Exit;
      if vRow=0 then Exit;
      S    := StringGridS.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                  OldFontColor  := Font.Color;
                  OldBrushColor := Brush.Color;
                  if (gdSelected in State) then
                      Brush.Color := clHighlight
                                           else
                  if (gdFixed in State)    then
                      Brush.Color := FixedColor
                                           else
                      begin
                           OldFontColor := Font.Color;
                           OldBrushColor := Brush.Color;
                           Brush.Color := Color;
                           if (vRow mod 2 = 0) then Brush.Color:=clInfoBk
                                               else Brush.Color:=cl3dLight;
                      end;
                  FillRect(Rect);
                  SetBkMode(Handle, TRANSPARENT);
                  if (vRow>0) and (vCol>0) then
                      begin
                          SetTextAlign(Handle, TA_RIGHT);
                          if vCol>1 then Shift:=10
                                    else Shift:= 8;
                          TextOut(Rect.Right-Shift, Rect.Top+2, S);
                      end;
{                                            else
                       begin
                           SetTextAlign(Handle, TA_LEFT);
                           TextRect(Rect, Rect.Left+5, Rect.Top, S);
                       end;
}
                  Font.Color  := OldFontColor;
                  Brush.Color := OldBrushColor;
           end;
end;

procedure TFormPensSpr2006.StringGridSDblClick(Sender: TObject);
var
    
    M_Za,Y_Za:integer;
begin
     if ((StringGridS.Row<1) or (StringGridS.Row>12))then Exit;
     if (StringGridS.Col<1)then Exit;
  //   if abs(arr[StringGridS.Row,StringGridS.Col])<0.01 then Exit;
     m_za := StringGridS.Row;
     y_za := StringGridS.Col+1999;
     WantedYear  := y_za;
     WantedMonth := m_za;
     with TFormEditPensSprPrPr.Create(nil) do
          begin
               try
                  WantedTabno := SELF.WantedTabno;
                  WantedFio   := SELF.WantedFio;
                  ShifrIdPens := SELF.WantedId;
                  Year_Za     := Y_Za;
                  Month_Za    := M_Za;
                  if execute then
                     begin
                     end;
               finally
                     free;
               end
          end;


end;

procedure TFormPensSpr2006.BitBtn3Click(Sender: TObject);
 var y,m:integer;
     s:string;
   
 begin
     FillChar(Arr,Sizeof(Arr),0);
     FormWait.Show;
     if not Fib.pFIBQueryArc.Transaction.InTransaction then
        Fib.pFIBQueryArc.Transaction.StartTransaction;
     for y:=YearFr to YearTo do
     for m:=1 to 12 do
      begin
           FIB.pFIBQueryArc.SQL.Clear;
           s:='execute procedure pr_calc_pensspr_pr '+IntToStr(WantedId)+','+IntToStr(y)+','+IntToStr(m);
           FIB.pFIBQueryArc.SQL.Add(S);
           try
              Application.ProcessMessages;
              FIB.pFIBQueryArc.ExecQuery;
          except
              ShowMessage('Ошибка получения данных пенсионной справки');
          end;
      end;
     FIB.pFIBQueryArc.Close;
     FIB.pFIBQueryArc.SQL.Clear;
     if Fib.pFIBQueryArc.Transaction.InTransaction then
        Fib.pFIBQueryArc.Transaction.Commit;
     FormWait.Hide;
     FormShow(Nil);
 end;

procedure TFormPensSpr2006.BitBtn4Click(Sender: TObject);
const FNameIni='dscroll.ini';
      StartRow=14;
      StartCol=2;
var FName,S:string;
    ColEx,RowEx,I,J:integer;
    Ini         : TIniFile;
    V           : Variant;
    a           : real;
begin
      FName:='';
//      Ini := TIniFile.Create( ChangeFileExt( FNameIni, '.INI' ) );
      S   := ExtractFilePath(Application.ExeName)+FNameINI;
      Ini := TIniFile.Create(S);
//      Ini := TIniFile.Create(FNameIni);
      try
          FName := Ini.ReadString( 'Parameters', 'PENSSPR', '' )
      finally
         Ini.Free;
      end;
      if not FileExists(FName) then            
         begin
               ShowMessage('В Ini файле неверно указано имя шаблона справки');
               Exit;
         end;
      try
         V:=CreateOleObject('Excel.Application');
         V.Visible:=True;
         V.WorkBooks.Open(FName);
         V.WorkBooks[1].WorkSheets['Shbl'].Copy(After:=V.WorkBooks[1].WorkSheets['Shbl']);
         V.WorkBooks[1].WorkSheets['Shbl (2)'].Name:='1';
         V.WorkBooks[1].WorkSheets['1'].Cells[6,5]:=WantedFio;
         for i:=YearFr to YearTo do
         for j:=1 to 12 do
             begin
                  RowEx:=StartRow+J-1;
                  ColEx:=StartCol+I-YearFr;
                  a:=arr[j,i-YearFr+1];
                  if abs(a)>0.005 then
                     V.WorkBooks[1].WorkSheets['1'].Cells[RowEx,ColEx]:=a;
             end;

      except
          on E:Exception do begin
             ShowMessage(E.Message);
      end;
 end;

end;

procedure TFormPensSpr2006.PrintPensSpr2013_2;
const FNameIni='dscroll.ini';
      StartCol=2;
      LimitYear=2010;
var FName,S:string;
    ColEx,RowEx,I,J:integer;
    Ini         : TIniFile;
    V           : Variant;
    a           : real;
    Yf,Yt,Y     : Integer;
    StartRowWork : Integer;
    iIndex      : Integer;
    startRow,startRow_2,FioRow:Integer;
begin
  if isSVDN then
     begin
          StartRow   := 20;
          StartRow_2 := 35;
          FioRow     := 12;
     end
   else
     begin
      StartRow   := 14;
      StartRow_2 := 29;
      FioRow     :=  6;
     end;
      FName:='';
//      Ini := TIniFile.Create( ChangeFileExt( FNameIni, '.INI' ) );
      S   := ExtractFilePath(Application.ExeName)+FNameINI;
      Ini := TIniFile.Create(S);
//      Ini := TIniFile.Create(FNameIni);
      try
          FName := Ini.ReadString( 'Parameters', 'PENSSPR2013', '' )
      finally
         Ini.Free;
      end;
      if not FileExists(FName) then
         begin
               ShowMessage('В Ini файле неверно указано имя шаблона справки');
               Exit;
         end;
      try
         V:=CreateOleObject('Excel.Application');
         V.Visible:=True;
         V.WorkBooks.Open(FName);
         V.WorkBooks[1].WorkSheets['Shbl'].Copy(After:=V.WorkBooks[1].WorkSheets['Shbl']);
         V.WorkBooks[1].WorkSheets['Shbl (2)'].Name:='1';
         V.WorkBooks[1].WorkSheets['1'].Cells[FioRow,5]:=WantedFio;
         for y:=1 to 2 do
             begin
                   if y=1 then begin yf:=YearFr; yt:=2009; startrowwork:=StartRow; end
                          else begin yf:=2010;   yt:=YearTo; startrowwork:=StartRow_2; end;
                   for i:=YF to YT do
                       for j:=1 to 12 do
                           begin
                                RowEx:=StartRowWork+J-1;
                                ColEx:=StartCol+I-YF;
                                iIndex:=i-YF+(YF-YearFr)+1;
                                a:=arr[j,iIndex];
                                if abs(a)>0.005 then
                                   V.WorkBooks[1].WorkSheets['1'].Cells[RowEx,ColEx]:=a;
                           end;
             end;

      except
          on E:Exception do begin
             ShowMessage(E.Message);
      end;
 end;

end;

procedure TFormPensSpr2006.PrintPensSpr2013_Ola;
const FNameIni='dscroll.ini';
      Years:array[1..4,1..2] of Integer=((2000,2004),(2005,2009),(2010,2015),(2016,2020));
var FName,S:string;
    Ini          : TIniFile;
    V            : Variant;
    startRow,startCol:Integer;
    procedure FillPage(PageNo:integer);
     var PageNoS:string;
         YF,YT:Integer;
         i,j:Integer;
         rowEx,colEx:Integer;
         iIndex : Integer;
         a:Real;
     begin
         PageNoS:=trim(IntToStr(PageNo));
         if isSVDN then
            begin
                 RowEx:=4;
                 ColEx:=3;
            end
          else
            begin
                RowEx:=6;
                ColEx:=5;
            end;
         V.WorkBooks[1].WorkSheets[PageNoS].Cells[RowEx,ColEx]:=WantedFio;
         YF:=Years[PageNo,1];
         YT:=Years[PageNo,2];
         for i:=YF to YT do
         for j:=1 to 12 do
             begin
                  RowEx:=StartRow+J- 1;
                  ColEx:=StartCol+I-YF;
                  iIndex:=i-Years[1,1]+1;

                  a:=arr[j,iIndex];
                  if abs(a)>0.005 then
                     V.WorkBooks[1].WorkSheets[PageNoS].Cells[RowEx,ColEx]:=a;
             end;

     end;
begin
      FName:='';
      if isSVDN then
         begin
              StartRow := 12;
              StartCol :=  2;
         end
      else
         begin
              StartRow := 14;
              StartCol :=  2;
         End;
      S   := ExtractFilePath(Application.ExeName)+FNameINI;
      Ini := TIniFile.Create(S);
      try
          FName := Ini.ReadString( 'Parameters', 'PENSSPR2013OLA', '' )
      finally
         Ini.Free;
      end;
      if not FileExists(FName) then
         begin
               ShowMessage('В Ini файле неверно указано имя шаблона справки');
               Exit;
         end;
      try
         V:=CreateOleObject('Excel.Application');
         V.Visible:=True;
         V.WorkBooks.Open(FName);
         FillPage(1);
         FillPage(2);
         FillPage(3);
      except
          on E:Exception do begin
             ShowMessage(E.Message);
      end;

       end;

end;

procedure TFormPensSpr2006.PrintLnr20132015Grn(yStart:integer);
const FNameIni='dscroll.ini';
   //   Years:array[1..3] of Integer=(2013,2014,2015);
var FName,S:string;
    Years:array[1..50] of Integer;
    Ini          : TIniFile;
    V            : Variant;
    startRow,startCol:Integer;
    procedure FillPage;
    // 1 гривны
    // 2
     var YF,YT:Integer;
         i,j,l:Integer;
         rowEx,colEx:Integer;
         iIndex : Integer;
         a,summaTot:Real;
     begin
         FillChar(Years,SizeOf(Years),0);
         l:=2015-yStart+1;
         for i:=yStart to 2015 do
             Years[i-yStart+1]:=i;
         RowEx := 6 ;
         if yStart=2009 then
            begin
                 colEx    :=  6 ;
                 startCol :=  3 ;
            end
         else
              begin
                   ColEx    :=  5 ;
                   startCol :=  5 ;
              end;
         V.WorkBooks[1].WorkSheets[1].Cells[RowEx,ColEx] := WantedFio;
         YF := Years [1];
         YT := Years [L];
         startRow := 14 ;
         summaTot :=  0 ;
         for i:=YF to YT do
         for j:=1 to 12 do
             begin
                  RowEx:=StartRow+J- 1;
                  ColEx:=StartCol+I-YF;
//                  iIndex:=i-Years[1]+1;
                  iIndex:=i-YF+(YF-YearFr)+1;

                  if (i=2015) and (j>8) then break;
                  a:=arr[j,iIndex];
                  if abs(a)>0.005 then
                     begin
                          summaTot:=RoundTo(summaTot,-2)+roundTo(a,-2);
                          V.WorkBooks[1].WorkSheets[1].Cells[RowEx,ColEx]:=a;
                     end;
             end;
         s:=NumeralToPhrase(summaTot,0);
         s:=stringReplace(s,'руб','грн',[rfReplaceAll]);
         if yStart=2009 then
            begin
             RowEx:=10;
             ColEx:=7;
            end
         else
            begin
             RowEx:=11;
             ColEx:=5;
            end;
         V.WorkBooks[1].WorkSheets[1].Cells[rowEx,ColEx]:=s;

     end;
begin
      if yStart=2009 then
         FName:='PENS_LNR_2009_2015_GRN'
      else
         FName:='PENS_LNR_2013_2015_GRN';
      S   := ExtractFilePath(Application.ExeName)+FNameINI;
      Ini := TIniFile.Create(S);
      try
          FName := Ini.ReadString( 'Parameters', fName, '' )
      finally
         Ini.Free;
      end;
      if not FileExists(FName) then
         begin
               ShowMessage('В Ini файле неверно указано имя шаблона справки');
               Exit;
         end;
      try
         V         := CreateOleObject('Excel.Application');
         V.Visible := True;
         V.WorkBooks.Open(FName,,true);
         FillPage;
      except
          on E:Exception do
             begin
                  ShowMessage(E.Message);
             end;
      end

end;

procedure TFormPensSpr2006.PrintLnr20152020Rub;
const FNameIni='dscroll.ini';
      amntOfYear=6;
      Years:array[1..amntOfYear] of Integer=(2015,2016,2017,2018,2019,2020);
var FName,S:string;
    Ini          : TIniFile;
    V            : Variant;
    startRow,startCol:Integer;
    procedure FillPage;
     var YF,YT:Integer;
         i,j:Integer;
         rowEx,colEx:Integer;
         iIndex : Integer;
         a,summaTot:Real;
     begin
         RowEx := 6 ;
         ColEx := 4 ;
         V.WorkBooks[1].WorkSheets[1].Cells[RowEx,ColEx] := WantedFio;
         YF := Years [1];
         YT := Years [amntOfYear];
         startRow := 14 ;
         startCol :=  3 ;
         summaTot :=  0 ;
         for i:=YF to YT do
         for j:=1 to 12 do
             begin
                  if (i=2015) and (j<9) then Continue;
                  RowEx:=StartRow+J- 1;
                  ColEx:=StartCol+I-YF;
//                  ColEx:=StartCol+I-1;
//                  iIndex:=i-Years[1]+1;
                  iIndex:=i-YF+(YF-YearFr)+1;

                  a:=arr[j,iIndex];
                  if abs(a)>0.005 then
                     begin
                          summaTot:=RoundTo(summaTot,-2)+roundTo(a,-2);
                          V.WorkBooks[1].WorkSheets[1].Cells[RowEx,ColEx]:=a;
                     end;
             end;
         s:=NumeralToPhrase(summaTot,0);
         RowEx := 11;
         ColEx :=  6;
         V.WorkBooks[1].WorkSheets[1].Cells[rowEx,ColEx]:=s;

     end;
begin
      FName:='';
      S   := ExtractFilePath(Application.ExeName)+FNameINI;
      Ini := TIniFile.Create(S);
      try
          FName := Ini.ReadString( 'Parameters', 'PENS_LNR_2015_2020_RUB', '' )
      finally
         Ini.Free;
      end;
      if not FileExists(FName) then
         begin
               ShowMessage('В Ini файле неверно указано имя шаблона справки');
               Exit;
         end;
      try
         V         := CreateOleObject('Excel.Application');
         V.Visible := True;
         V.WorkBooks.Open(FName,,true);
         FillPage;
      except
          on E:Exception do
             begin
                  ShowMessage(E.Message);
             end;
      end

end;


procedure TFormPensSpr2006.FormDestroy(Sender: TObject);
begin
     FormPensSpr2006 := Nil;
end;

procedure TFormPensSpr2006.BitBtn5Click(Sender: TObject);
begin
     PrintPensSpr2013_2;
end;

procedure TFormPensSpr2006.BitBtn6Click(Sender: TObject);
begin
     PrintPensSpr2013_Ola;
end;

procedure TFormPensSpr2006.BitBtnLnr2013Click(Sender: TObject);
begin
     if isLNR then
        PrintLnr20132015Grn(2013);
end;

procedure TFormPensSpr2006.BitBtnLNR2015Click(Sender: TObject);
begin
     if isLNR then
        PrintLnr20152020Rub;
end;

procedure TFormPensSpr2006.BitBtnLnr2009Click(Sender: TObject);
begin
     if isLNR then
        PrintLnr20132015Grn(2009);

end;

end.
