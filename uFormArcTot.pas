unit uFormArcTot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Buttons, Menus, frxClass, frxCross;
const MaxYearArcTot=50;
type
  TFormArcTot = class(TForm)
    StringGridArc: TStringGrid;
    DateTimePickerFr: TDateTimePicker;
    DateTimePickerTo: TDateTimePicker;
    BitBtn1: TBitBtn;
    LabelFio: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    frxCrossObject1: TfrxCrossObject;
    N3: TMenuItem;
    frxReportTT: TfrxReport;
    frxReportT: TfrxReport;
    N4: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure StringGridArcDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure N2Click(Sender: TObject);
    procedure StringGridArcDblClick(Sender: TObject);
    procedure frxReportTBeforePrint(Sender: TfrxReportComponent);
    procedure N3Click(Sender: TObject);
    procedure frxReportTTBeforePrint(Sender: TfrxReportComponent);
    procedure N4Click(Sender: TObject);
  private
     YearFr,YearTo : integer;
     WantedTabno   : integer;
     WantedFio     : string;
     Zarpl         : array[1..MaxYearArcTot,1..12] of real;
     procedure MakeGrid;
     procedure FillGrid;
     procedure FillArrayZa;    { Private declarations }
     procedure FillArrayVy;    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormArcTot: TFormArcTot;

implementation
   uses uFibModule,DateUtils, uFormWait, uFrmFindKadryFB, IniFiles,ComObj,
        uFormArc;

{$R *.dfm}

  procedure TFormArcTot.MakeGrid;
   var i,j:integer;
   begin
         StringGridArc.ColCount :=  2;
         StringGridArc.RowCount := 14;
         StringGridArc.Cells[0,1]  := 'Янв';
         StringGridArc.Cells[0,2]  := 'Фев';
         StringGridArc.Cells[0,3]  := 'Мар';
         StringGridArc.Cells[0,4]  := 'Апр';
         StringGridArc.Cells[0,5]  := 'Май';
         StringGridArc.Cells[0,6]  := 'Июн';
         StringGridArc.Cells[0,7]  := 'Июл';
         StringGridArc.Cells[0,8]  := 'Авг';
         StringGridArc.Cells[0,9]  := 'Сен';
         StringGridArc.Cells[0,10] := 'Окт';
         StringGridArc.Cells[0,11] := 'Ноя';
         StringGridArc.Cells[0,12] := 'Дек';
         StringGridArc.Cells[0,13] := 'Итг';
         if (YearFr>1991) and (YearTo>=YearFr) and (YearTo<2020) then
            begin
                 StringGridArc.ColCount := YearTo - YearFr + 1 +1;
                 for i:=YearFr to YearTo do
                     begin
                          StringGridArc.Cells[i-YearFr+1,0] := IntToStr(i);
                          for j:=1 to 12 do StringGridArc.Cells[i-YearFr+1,j] := '';
                     end;
            end;
         for i:=1 to StringGridArc.ColCount-1 do
             begin
                  StringGridArc.ColWidths[i]:=100;

             end;
   end;

  procedure TFormArcTot.FillGrid;
   var i_col,j_row:integer;
       S : string;
       a : real;
   begin
         for i_col:=YearFr to YearTo do
             begin
                  a:=0;
                  for j_row:=0 to 12 do
                      begin
                           if j_row=0 then StringGridArc.Cells[i_col-YearFr+1,j_row]:=IntToStr(i_col)
                                      else
                              begin
                                   StringGridArc.Cells[i_col-YearFr+1,j_row]:='';
                                   if abs(zarpl[i_col-YearFr+1,j_row])>0.005 then
                                      begin
                                           s:=FloatToStrF(zarpl[i_col-YearFr+1,j_row],ffFixed,15,2);
                                           StringGridArc.Cells[i_col-YearFr+1,j_row]:=s;
                                           a:=a+zarpl[i_col-YearFr+1,j_row];
                                     end;
                              end;
                      end;
                  if abs(a)>0.005 then
                     begin
                          s:=FloatToStrF(a,ffFixed,15,2);
                          StringGridArc.Cells[i_col-YearFr+1,13] := s;
                     end;
             end;
   end;

procedure TFormArcTot.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormArcTot.FormCreate(Sender: TObject);
begin
      DateTimePickerFr.MinDate := EncodeDateTime(1992, 1, 1, 0, 0, 0,0);
      DateTimePickerFr.MaxDate := Date;
      DateTimePickerTo.MinDate := DateTimePickerFr.MinDate;
      DateTimePickerTo.MaxDate := Date;
      DateTimePickerFr.Date    := Date;
      DateTimePickerFr.Date    := DateTimePickerFr.MinDate;
      DateTimePickerTo.Date    := Date;
      YearFr:=YearOf(DateTimePickerFr.Date);
      YearTo:=YearOf(DateTimePickerTo.Date);
      LabelFio.Caption:=IntToStr(YearTo);
      MakeGrid;
end;

procedure TFormArcTot.BitBtn1Click(Sender: TObject);
var WT:Integer;
    WFio:string;
begin
    LabelFio.Caption:='';
{    if WantedTabno=0 then}
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     WT:=GetTabno;
                     WFio:=GetFio;
                     if FIB.GetRightForSecretWorker(WT) then
                        begin
                             Self.WantedFIO   := WFio;
                             Self.WantedTabno := WT;
                             LabelFio.Caption := IntToStr(Self.WantedTabno)+' '+Trim(Self.WantedFio);
                        end
                     else
                        begin
                             ShowMessage('Нет прав на доступ с данным этот сострудника');
                        end;
               end;
         finally
{            free; }
         end;
       Self.Repaint;

end;

procedure TFormArcTot.FillArrayZa;
 var y : integer;
     s : string;
     i : integer;
 begin
     if WantedTabno<=0 then
        begin
             ShowMessage('Не указан работник');
             Exit;
        end;
     FillChar(Zarpl,Sizeof(Zarpl),0);
     if not Fib.pFIBQueryArc.Transaction.InTransaction then
        Fib.pFIBQueryArc.Transaction.StartTransaction;
     for y:=YearFr to YearTo do
      begin
           FIB.pFIBQueryArc.SQL.Clear;
           s:='select first 1 jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dece from pr_get_year_person('+IntToStr(WantedTabno)+','+IntToStr(Y)+')';
           FIB.pFIBQueryArc.SQL.Add(S);
           try
              FormWait.Show;
              Application.ProcessMessages;
              FIB.pFIBQueryArc.ExecQuery;
              FormWait.Hide;
              for i:=1 to 12 do
                  zarpl[y-YearFr+1,i]:=FIB.pFIBQueryArc.Fields[i-1].AsFloat;
          except
              ShowMessage('Ошибка получения данных архива');
          end;
          FIB.pFIBQueryArc.Close;
          FIB.pFIBQueryArc.SQL.Clear;
      end;
     if Fib.pFIBQueryArc.Transaction.InTransaction then
        Fib.pFIBQueryArc.Transaction.Commit;
 end;

procedure TFormArcTot.FillArrayVy;
 var y : integer;
     s : string;
     i : integer;
 begin
     if WantedTabno<=0 then
        begin
             ShowMessage('Не указан работник');
             Exit;
        end;
     FillChar(Zarpl,Sizeof(Zarpl),0);
     if not Fib.pFIBQueryArc.Transaction.InTransaction then
        Fib.pFIBQueryArc.Transaction.StartTransaction;
     for y:=YearFr to YearTo do
      begin
           FIB.pFIBQueryArc.SQL.Clear;
           s:='select first 1 jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dece from pr_get_year_vy_person('+IntToStr(WantedTabno)+','+IntToStr(Y)+')';
           FIB.pFIBQueryArc.SQL.Add(S);
           try
              FormWait.Show;
              Application.ProcessMessages;
              FIB.pFIBQueryArc.ExecQuery;
              FormWait.Hide;
              for i:=1 to 12 do
                  zarpl[y-YearFr+1,i]:=FIB.pFIBQueryArc.Fields[i-1].AsFloat;
          except
              ShowMessage('Ошибка получения данных архива');
          end;
          FIB.pFIBQueryArc.Close;
          FIB.pFIBQueryArc.SQL.Clear;
      end;
     if Fib.pFIBQueryArc.Transaction.InTransaction then
        Fib.pFIBQueryArc.Transaction.Commit;
 end;


procedure TFormArcTot.N1Click(Sender: TObject);
begin
     YearFr:=YearOf(DateTimePickerFr.Date);
     YearTo:=YearOf(DateTimePickerTo.Date);
     if ((WantedTabno<=0) or (WantedTabno>15000)) then
        begin
             ShowMessage('Не указан работник');
             Exit;
        end;
     if not ((YearFr>1991) and (YearTo>=YearFr) and (YearTo<2020)) then
        begin
             ShowMessage('Неверно указаны даты');
             Exit;
        end;
     FillArrayZa;
     MakeGrid;
     FillGrid;
     Application.ProcessMessages;
end;

procedure TFormArcTot.StringGridArcDrawCell(Sender: TObject; ACol,
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
      S    := StringGridArc.Cells[vCol,vRow];
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
                          if vCol>1 then Shift:=2
                                    else Shift:=2;
                          TextOut(Rect.Right-Shift, Rect.Top+2, S);
                      end;
                  Font.Color  := OldFontColor;
                  Brush.Color := OldBrushColor;
           end;
end;


procedure TFormArcTot.N2Click(Sender: TObject);
const FNameIni='dscroll.ini';
      StartRow=14;
      StartCol=2;
var FName,S:string;
    ColEx,RowEx,I,J:integer;
    Ini         : TIniFile;
    V           : Variant;
    a           : real;
    b           : real;
    b_tot       : real;
begin
      WantedFio:=Trim(WantedFio);
      if Length(WantedFio)<=1 then
         begin
              ShowMessage('Нужно указать работника для печати');
              Exit;
         end;
{
      YearFr:=YearOf(DateTimePickerFr.Date);
      YearTo:=YearOf(DateTimePickerTo.Date);
}
      if ((WantedTabno<=0) or (WantedTabno>15000)) then
         begin
              ShowMessage('Не указан работник');
              Exit;
         end;
      if not ((YearFr>1991) and (YearTo>=YearFr) and (YearTo<2020)) then
         begin
              ShowMessage('Неверно указаны даты');
              Exit;
         end;

      FName:='';
      S   := ExtractFilePath(Application.ExeName)+FNameINI;
      Ini := TIniFile.Create(S);
      try
          FName := Ini.ReadString( 'Parameters', 'ARCTOTFULL', '' )
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
         if Length(Trim(WantedFio))>30 then WantedFio:=copy(WantedFio,1,30);
         V.WorkBooks[1].WorkSheets['Shbl (2)'].Name:=WantedFio;
         V.WorkBooks[1].WorkSheets[WantedFio].Cells[6,5]:=WantedFio;
         b_tot:=0;
         for i:=YearFr to YearTo do
             begin
                  ColEx := StartCol + I-YearFr;
                  RowEx := StartRow - 1;
//                  ColEx := StartCol - 1;
//                  RowEx := StartRow + (i-YearFr);
                  V.WorkBooks[1].WorkSheets[WantedFio].Cells[RowEx,ColEx]:=i;
                  b:=0;
                  for j:=1 to 12 do
                      begin
                           RowEx := StartRow + J - 1;
//                           ColEx := ColEx +1 ;
                           a:=zarpl[i-YearFr+1,j];
                           if abs(a)>0.005 then
                              begin
                                   V.WorkBooks[1].WorkSheets[WantedFio].Cells[RowEx,ColEx]:=a;
                                   b:=b+a;
                              end;
                      end;
                  if abs(b)>0.005 then
                     begin
                          b_tot:=b_tot+b;;
                          RowEx := StartRow + 13 - 1;
                          V.WorkBooks[1].WorkSheets[WantedFio].Cells[RowEx,ColEx]:=b;
                     end;
             end;
         if abs(b_tot)>0.005 then
            begin
                RowEx := 9;
                ColEx := 8;
                V.WorkBooks[1].WorkSheets[WantedFio].Cells[RowEx,ColEx]:=b_tot;
            end;

      except
          on E:Exception do begin
             ShowMessage(E.Message);
      end;
 end;

end;

procedure TFormArcTot.StringGridArcDblClick(Sender: TObject);
var WRow,WCol:integer;
begin
    WRow := StringGridArc.Row;
    WCol := StringGridArc.Col;
    if not ((WCol>0) and (WCol<13)) then Exit;
    if ((WRow + YearFr -1<YearFr) or (WRow + YearFr -1>YearTo)) then Exit;
    if abs(Zarpl[WRow,WCol])<0.01 then Exit;
    Application.CreateForm(TFormArc, FormArc);
    FormArc.Tabno:=WantedTabno;
    FormArc.WantedMode:=1;
    FormArc.WantedYear  := WRow + YearFr -1;
    FormArc.WantedMonth := WCol;
    FormArc.WantedData:=EnCodeDate(FormArc.WantedYear,FormArc.WantedMonth,10);
    FormArc.DateTimePicker1.Date := FormArc.WantedData;
    FormArc.ShowModal;
end;

procedure TFormArcTot.frxReportTBeforePrint(Sender: TfrxReportComponent);
const mn:array[1..12] of string =('Январь','Февраль','Март','Апрель','Май','Июнь','Июль','Август','Сентябрь','Октябрь','Ноябрь','Декабрь');
var
  Cross: TfrxCrossView;
  i, j: Integer;
  a:real;
  s,sn:string;
begin
  S:=Sender.Name;
  if Sender is TfrxCrossView then
  begin
    Cross := TfrxCrossView(Sender);
    for i:=YearFr to YearTo do
        begin
             for j:=1 to 12 do
                 begin
                       a:=zarpl[i-YearFr+1,j];
                       sn:=mn[j];
                       if abs(a)>0.005 then
                          Cross.AddValue([sn], [i], [a]);
                  end;
        end;
  end;
end;


procedure TFormArcTot.N3Click(Sender: TObject);
const F='######0.00';
var S         : String;
    b_tot,b,a : real;
    i,j       : integer;
begin
     b_tot:=0;
     for i:=YearFr to YearTo do
       begin
             b:=0;
             for j:=1 to 12 do
                 begin
                      a:=zarpl[i-YearFr+1,j];
                      if abs(a)>0.005 then
                         b:=b+a;
                 end;
             if abs(b)>0.005 then
                 b_tot:=b_tot+b;;
       end;
 S:=FormatFloat(F,b_Tot);
 frxReportT.Variables['SummaTot']:=''''+trim(S)+'''';
 frxReportT.Variables['FIO']:=''''+trim(WantedFio)+'''';
 frxReportT.ShowReport;
{ frxReportTT.ShowReport;}

end;

procedure TFormArcTot.frxReportTTBeforePrint(Sender: TfrxReportComponent);
var
  Cross: TfrxCrossView;
  i, j: Integer;
  a:real;
  s:string;
begin
  S:=Sender.Name;
  if Sender is TfrxCrossView then
  begin
    Cross := TfrxCrossView(Sender);
    for i:=YearFr to YearTo do
        begin
             for j:=1 to 12 do
                 begin
                       a:=zarpl[i-YearFr+1,j];
                       if abs(a)>0.005 then
                          Cross.AddValue([j], [i], [a]);
                  end;
        end;
  end;
end;

procedure TFormArcTot.N4Click(Sender: TObject);
begin
     YearFr:=YearOf(DateTimePickerFr.Date);
     YearTo:=YearOf(DateTimePickerTo.Date);
     if ((WantedTabno<=0) or (WantedTabno>15000)) then
        begin
             ShowMessage('Не указан работник');
             Exit;
        end;
     if not ((YearFr>1991) and (YearTo>=YearFr) and (YearTo<2020)) then
        begin
             ShowMessage('Неверно указаны даты');
             Exit;
        end;
     FillArrayVy;
     MakeGrid;
     FillGrid;
     Application.ProcessMessages;

end;

end.
