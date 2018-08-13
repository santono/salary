unit UFormMonthsPr;
                            
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Grids, StdCtrls,
  FIBQuery, pFIBQuery, Buttons;

const
     l_arr=49;

type
  TFormMonthPr = class(TForm)
    DataSource1        : TDataSource;
    pFIBDataSetMPr     : TpFIBDataSet;
    pFIBTransactionMPr : TpFIBTransaction;
    StringGridMPr      : TStringGrid;
    pFIBDataSetMPrDATEFR: TFIBDateField;
    pFIBDataSetMPrNB_DAY: TFIBSmallIntField;
    pFIBDataSetMPrCODE: TFIBSmallIntField;
    pFIBQueryMPr: TpFIBQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    LabelRDay: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure StringGridMPrDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridMPrDblClick(Sender: TObject);
    procedure StringGridMPrSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBoxChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
      l : integer;
      d : array[1..l_arr,1..4] of integer;
      d_db : array[1..31] of integer;      { данные прочитанные из БД }
      ComboBox:TComboBox;
      SelectedRow,SelectedCol:integer;
      procedure MkCombo(ATop,ALeft,AWidth,AHeight:integer);
      procedure GetFromDB;
      procedure PutToDB;
      procedure Filld_db;
      procedure GetFromMonths;
      function GetWorkDays:integer;

    { Private declarations }
  public
     WantedData:TDateTime;
     procedure FillStandart(Mode:integer); {0  из календаря 1 - из БД}
    { Public declarations }
  end;

var
  FormMonthPr: TFormMonthPr;

implementation
 uses UFIBModule,ScrUtil,DateUtils,ScrDef;

{$R *.dfm}

procedure TFormMonthPr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormMonthPr.FormCreate(Sender: TObject);
begin
     L:=31;
     FillChar(d,SizeOf(d),0);
     ComboBox := Nil;
     SelectedRow:=0;
     SelectedCol:=0;
     FillChar(d_db,SizeOf(d_db),0);
     Caption:='Календарь '+trim(GetMonthRus(MonthOf(WantedData)))+' '+IntToStr(YearOf(WantedData));
     LabelRDay.Caption:='0';
end;

procedure TFormMonthPr.FillStandart(Mode:integer);
 var CurrDate:TDateTime;
     y,m,da:word;
     i,dof,nowe:integer;
     i_row,i_col,i_cell:integer;
     i_start:integer;
 begin
       FillChar(d,SizeOf(d),0);
       FillChar(d_db,SizeOf(d_db),0);
       StringGridMPr.Cells[0,0]:='Понедельник';
       StringGridMPr.Cells[0,1]:='Вторник';
       StringGridMPr.Cells[0,2]:='Среда';
       StringGridMPr.Cells[0,3]:='Четрверг';
       StringGridMPr.Cells[0,4]:='Пятница';
       StringGridMPr.Cells[0,5]:='Суббота';
       StringGridMPr.Cells[0,6]:='Воскресенье';
       l:=LenMonth(WantedData);
       CurrDate:=WantedData;
       DecodeDate(WantedData,y,m,da);
       if Mode=1 then GetFromDB;
       i_start:=1;
       for i:=1 to l do
           begin
                CurrDate:=EncodeDate(y,m,i);
                dof:=DayOfTheWeek(CurrDate);
                nowe:=((i_start-1) div 7) + 1;
                if (dof=1) and (i>1) then Inc(nowe);
                if i=1 then i_start:=((nowe-1)*7)+dof
                       else Inc(i_start);
                d[i_start,1]:=i;
                d[i_start,2]:=1;
                if dof=6 then d[i_start,2]:=2;
                if dof=7 then d[i_start,2]:=3;
                if Mode=1 then   { скорректировать по БД }
                   begin
                         if d_db[i]=2 then d[i_start,2]:=2
                         else if d_db[i]=3 then d[i_start,2]:=3
                         else if d_db[i]=4 then d[i_start,2]:=4;
                   end;
                d[i_start,3]:=dof-1;
                d[i_start,4]:=nowe;
            end;
       for i_row:=0 to 6 do
           for i_col:=1 to 6 do
               begin

                    i_cell:=(i_col-1)*7+i_row+1;
                    if d[i_cell,2]>0 then
                       StringGridMPr.Cells[i_col,i_row]:=IntToStr(d[i_cell,2]);
{
                    Finded:=false;
                    StringGridMPr[i_col,i_row]:='';
                    for i:=1 to 31 do
                        if ((d[i,3]:=i_row) and (d[i,4]:=i_col)) then
                           begin
                                Finded:=true;
                                break;
                           end;
                    if Finded then
                       StringGridMPr[i_col,i_row]:=d[i,2];
}
               end;
       GetWorkDays();;


 end;


procedure TFormMonthPr.StringGridMPrDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol     : integer;
    S             : String;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
    Finded        : boolean;
    i,j           : integer;
    Color_My      : TColor;
begin
  //    Exit;
      Color_My:=0;
      vRow := aRow ;
      vCol := aCol ;
      S    := '';
      if vCol=0 then Exit;
      Finded:=false;
      for i:=1 to l_arr do
          begin
                j:=d[i,2];
                if j>0 then
                   j:=j;
                if ((d[i,3]=vRow) and (d[i,4]=vCol) and (d[i,2]>0)) then
                   begin
                        Finded := true;
                        case d[i,2] of
                          1: s:='Рб';
                          2: begin s:='Сб'; color_my:=clGradientInactiveCaption; end;
                          3: begin s:='Вс'; color_my:=clGradientActiveCaption; end;
                          4: begin s:='Пр'; s:='Вс'; color_my:=clYellow; end;
                        end;
                        s:=trim(IntToStr(d[i,1]))+' '+s;
                        break;
                   end;
          end;
      if not Finded then Exit;
      with Sender as TStringGrid, Canvas do
           begin
                OldFontColor  := Font.Color;
                OldBrushColor := Brush.Color;
                if (gdSelected in State) then
                   Brush.Color := clHighlight
                                         else
                if (gdFixed in State) then
                                      else
                   Brush.Color := Color;
                if color_my<>0 then Brush.Color:=color_my;    
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vCol>0) then
                    begin
                          SetTextAlign(Handle, TA_LEFT);
{                          TextOut(Rect.Right, Rect.Top+2, S);}
                          TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;

end;

procedure TFormMonthPr.ComboBoxChange(Sender: TObject);
 var Row,Col,I,J,Code:integer;
     Finded : boolean;
begin
{
     Col:=StringGridMPr.Col;
     Row:=StringGridMPr.Row;
}
     Col:=SelectedCol;
     Row:=SelectedRow;
     Code:=(Sender as TComboBox).ItemIndex+1;
     StringGridMPr.Cells[Col,Row]:=IntToStr(Code);
     for i:=1 to l_arr do
         begin
               j:=d[i,2];
               if j>0 then
                  j:=j;
               if ((d[i,3]=Row) and (d[i,4]=Col) and (d[i,2]>0)) then
                   begin
                        Finded := true;
                        d[i,2]:=Code;
                        GetWorkDays;
                        break;
                   end;
          end;

end;


procedure TFormMonthPr.MkCombo(ATop,ALeft,AWidth,AHeight:integer);
  var I,J,Row,Col:integer;
       S : String;
  begin
        Col:=StringGridMPr.Col;
        Row:=StringGridMPr.Row;
        try
            ComboBox := TComboBox.Create(Owner);
        except
            on EAccessViolation do ShowMessage('Ошибка создания ComboBox-а');
        end;
        ComboBox.Parent := StringGridMPr;
        ComboBox.Style  := csDropDownList;
        ComboBox.Top    := ATop;
        ComboBox.Left   := ALeft;
        ComboBox.Width  := AWidth;
        ComboBox.Height := AHeight+100;
        ComboBox.AddItem('Рб',Nil);
        ComboBox.AddItem('Сб',Nil);
        ComboBox.AddItem('Вс',Nil);
        ComboBox.AddItem('Пр',Nil);
        ComboBox.OnChange:=Self.ComboBoxChange;
        ComboBox.OnSelect:=Self.ComboBoxChange;
        ComboBox.DropDownCount:=ComboBox.Items.Count;
        ComboBox.Text:=ComboBox.Items[0];
        ComboBox.ItemIndex:=0;
        S:=StringGridMPr.Cells[Col,Row];
        if pos('2',S)>0 then ComboBox.ItemIndex:=1
        else if pos('3',S)>0 then ComboBox.ItemIndex:=2
        else if pos('4',S)>0 then ComboBox.ItemIndex:=3;
        ComboBox.Name:='CB';
        ComboBox.Show;

  end;
  
procedure TFormMonthPr.StringGridMPrDblClick(Sender: TObject);
 var TR : TRect;
     Col,Row : integer;
begin
     Col := StringGridMPr.Col;
     Row := StringGridMPr.Row;
     if Col<>SelectedCol then Exit;
     if Row<>SelectedRow then Exit;
     if ((StringGridMPr.Cells[Col,Row]<>'') and (not Assigned(ComboBox))) then
        begin
              TR:=StringGridMPr.CellRect(StringGridMPr.Col, StringGridMPr.Row);
              MkCombo(TR.Top,TR.Left,TR.Right-TR.Left+1,TR.Bottom-TR.Top);
        end;

end;

procedure TFormMonthPr.StringGridMPrSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
      if (StringGridMPr.Cells[ACol,ARow]='') then CanSelect:=false
      else
          begin
                CanSelect:=true;
                if Assigned(ComboBox) then
                   Self.ComboBoxChange(ComboBox);
                SelectedRow:=ARow;
                SelectedCol:=ACol;
                if Assigned(ComboBox) then
                   try
                       ComboBox.Free;
                       ComboBox:=Nil;
                   except
                        on EAccessViolation do ShowMessage('Ошибка удаления ComboBox-а');
                   end
          end;
end;

procedure TFormMonthPr.GetFromDB;
 var DateFrS : string;
     Y,M,D   : word;
     Len_Mon : integer;
 begin
      if YearOf(WantedData)<1991 then Exit;
      Len_Mon:=LenMonth(WantedData);
      DeCodeDate(WantedData,y,m,d);
      DateFrS:=IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
      PFIBDataSetMPr.Params[0].AsString:=DateFrs;
      pFIBDataSetMpR.Prepare;
      if not PFIBDataSetMPr.Transaction.Active then
         PFIBDataSetMPr.Transaction.StartTransaction;
      pFIBDataSetMPr.Open;
      pFIBDataSetMPr.First;
      while not pFIBDataSetMPr.Eof do
            begin
                 if (pFIBDataSetMPr.FieldByName('NB_DAY').AsInteger>Len_Mon) then break;
                 if pFIBDataSetMPr.FieldByName('NB_DAY').AsInteger>0 then
                    d_db[pFIBDataSetMPr.FieldByName('NB_DAY').AsInteger]:=pFIBDataSetMPr.FieldByName('Code').AsInteger;
                 pFIBDataSetMPr.Next;
            end;
      pFIBDataSetMPr.Close;
      if PFIBDataSetMPr.Transaction.Active then
         PFIBDataSetMPr.Transaction.Commit;
 end;

procedure TFormMonthPr.PutToDB;
 var DateFrS:string;
     Y,M,D : word;
     Len_Mon,i:integer;
 begin
      if YearOf(WantedData)<1991 then Exit;
      Len_Mon:=LenMonth(WantedData);
      DeCodeDate(WantedData,y,m,d);
      DateFrS:=IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
      if not PFIBDataSetMPr.Transaction.Active then
         PFIBDataSetMPr.Transaction.StartTransaction;
      pFIBQueryMPr.SQL.Clear;
      pFIBQueryMPr.SQL.Add('delete from tb_months_pr where datefr='''+DateFrS+'''');
      PFIBQueryMPr.ExecQuery;
      PFIBQueryMPr.Close;
      pFIBDataSetMPr.Open;
      for i:=1 to Len_Mon do
          begin
               pFIBDataSetMPr.Insert;
               pFIBDataSetMPr.FieldByName('NB_DAY').AsInteger:=i;
               pFIBDataSetMPr.FieldByName('CODE').AsInteger:=d_db[i];
               pFIBDataSetMPr.FieldByName('DATEFR').AsDateTime:=WantedData;
               pFIBDataSetMPr.Post;
          end;
      pFIBDataSetMPr.Close;
      if PFIBDataSetMPr.Transaction.Active then
         PFIBDataSetMPr.Transaction.Commit;
 end;

procedure TFormMonthPr.Filld_db;
  var i,j,i_start,len_mon:integer;
  begin
       len_mon:=LenMonth(WantedData);
       i_start:=0;
       j:=0;
       for j:=1 to l_arr do
           if d[j,1]>0 then
              begin
                   i_start:=j;
                   break;
              end;
       j:=0;
       FillChar(d_db,SizeOf(d_db),0);
       if i_start>0 then
          for i:=i_start to len_mon do
              begin
                   inc(j);
                   d_db[j]:=d[i,2];
              end;

  end;


procedure TFormMonthPr.BitBtn1Click(Sender: TObject);
begin
     Filld_db;
     PutToDB;
     ShowMessage('Данные сохранены');
end;

procedure TFormMonthPr.BitBtn3Click(Sender: TObject);
 begin
     GetFromMonths;
 end;

procedure TFormMonthPr.GetFromMonths;
 var y,m,i,j   : integer;
     FName     : string;
     Dev       : TextFile;
     yy,mm,dd  : word;
     SaveWDate : TDateTime;
     DateFrS   : string;
     SQL       : string;
     yw,mw,dw  : word;
 begin
      SaveWDate := WantedData;
      DeCodeDate(WantedData,yw,mw,dw);
      for y:=2000 to 2010 do
          begin
               if y<>yw then continue;
               FName:=CDIR+'MONTH'+COPY(ALLTRIM(IntToStr(Y)),3,2)+'.TXT';
               if not FileExists(FName) then
                  begin
                       ShowMessage('Нет календаря для '+IntToStr(Y)+' года.');
                       continue;
                  end;
               AssignFile(Dev,FName);
               reset(dev);
               for i:=1 to 12 do
                   begin
                         FillChar(d_db,SizeOf(d_db),0);
                         for j:=1 to 31 do
                             read(dev,d_db[j]);
                         readln(dev);
                         if i<>mw then continue;
                         yy := y;
                         mm := i;
                         dd := 10;
                         WantedData := EnCodeDate(yy,mm,dd);
                         DateFrS:=IntToStr(yy)+'-'+IntToStr(mm)+'-'+IntToStr(10);

                         if not PFIBDataSetMPr.Transaction.Active then
                            PFIBDataSetMPr.Transaction.StartTransaction;
                         pFIBQueryMPr.SQL.Clear;
                         pFIBQueryMPr.SQL.Add('delete from tb_months_hea where datefr='''+DateFrS+'''');
                         PFIBQueryMPr.ExecQuery;
                         PFIBQueryMPr.Close;
                         pFIBQueryMPr.SQL.Clear;
                         SQL :='insert into tb_months_hea values ('''+DateFrS+''',0,0,0,0)';
                         pFIBQueryMPr.SQL.Add(SQL);
                         PFIBQueryMPr.ExecQuery;
                         PFIBQueryMPr.Close;
                         if PFIBDataSetMPr.Transaction.Active then
                            PFIBDataSetMPr.Transaction.Commit;
//                         Filld_db;
                         PutToDB;
                         if not PFIBDataSetMPr.Transaction.Active then
                            PFIBDataSetMPr.Transaction.StartTransaction;
                         pFIBQueryMPr.SQL.Clear;
                         SQL:='update tb_months_hea a set a.work_day_5=(select count(*) from tb_months_pr b where a.datefr=b.datefr and b.code=1) where a.datefr='''+DateFrS+'''';
                         pFIBQueryMPr.SQL.Add(SQL);
                         PFIBQueryMPr.ExecQuery;
                         PFIBQueryMPr.Close;
                         pFIBQueryMPr.SQL.Clear;
                         SQL:='update tb_months_hea set work_clock_5=work_day_5*8';
                         pFIBQueryMPr.SQL.Add(SQL);
                         PFIBQueryMPr.ExecQuery;
                         PFIBQueryMPr.Close;
                         if PFIBDataSetMPr.Transaction.Active then
                            PFIBDataSetMPr.Transaction.Commit;

                   end;
               CloseFile(dev);
          end;
      WantedData := SaveWDate;
      ShowMessage('Данные сформированы');

 end;


procedure TFormMonthPr.FormShow(Sender: TObject);
begin
     Caption:='Календарь '+trim(GetMonthRus(MonthOf(WantedData)))+' '+IntToStr(YearOf(WantedData));
end;

function TFormMonthPr.GetWorkDays:integer;
 var i,r:integer;
 begin
      r:=0;
      for i:=1 to l_arr do
          if d[i,2]=1 then Inc(R);
      LabelRDay.Caption:=IntToStr(r);
      Application.ProcessMessages;
 end;



end.
