unit UFormMonthForGener;
                            
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, Grids, StdCtrls,
  FIBQuery, pFIBQuery, Buttons, ComCtrls;

const
     l_arr=49;

type
  TFormMonthForGener = class(TForm)
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
    EditWorkClock: TEdit;
    UpDownWorkClock: TUpDown;
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
    constructor CreateUsingDate(AOwner:TComponent;newDate:TDate);
    procedure UpDownWorkClockChanging(Sender: TObject;
      var AllowChange: Boolean);
  private
      l : integer;
      d : array[1..l_arr,1..4] of integer;
      d_db : array[1..31] of integer;      { данные прочитанные из БД }
      ComboBox:TComboBox;
      SelectedRow,SelectedCol:integer;
      workdayu5,workdayu6,dummy,workdayc,workclock:integer;
      procedure MkCombo(ATop,ALeft,AWidth,AHeight:integer);
      procedure GetFromDB;
      procedure PutToDB;
      procedure Filld_db;
      procedure GetFromMonths;
      procedure SaveToMonths;
      function GetWorkDays:integer;
      function GetWorkClocks:integer;
      function findCodeInD(vCol,vRow:integer;var dayNo:integer):integer;
      procedure setDayCodeInD(vCol,vRow,vCode:integer);


    { Private declarations }
  public
     WantedData:TDateTime;
     procedure FillStandart(Mode:integer); {0  из календаря 1 - из БД}
    { Public declarations }
  end;

var
  FormMonthForGener: TFormMonthForGener;

implementation
 uses UFIBModule,ScrUtil,DateUtils,ScrDef;

{$R *.dfm}
constructor TFormMonthForGener.CreateUsingDate(AOwner:TComponent;newDate:TDate);
  var y:integer;
  begin
       Self.Create(AOwner);
       self.WantedData:=newDate;
       FillChar(d_db,SizeOf(d_db),0);
       FillChar(d,SizeOf(d),0);
       GetFromMonths;
       if isSVDN then
          LabelRDay.Caption:=IntToStr(workdayu5)
       else
          LabelRDay.Caption:='5-'+IntToStr(workdayu5)+'. 6-'+IntToStr(workdayu6);

       UpDownWorkClock.Max:=DaysInMonth(wanteddata)*8;
       if (workclock>UpDownWorkClock.Max) then
          workclock:=UpDownWorkClock.Max;
       UpDownWorkClock.Position:=workclock;
       self.FillStandart(1);
       UpDownWorkClock.Position:=workclock;
       y:=yearof(wanteddata)+1;
       bitbtn3.Caption:='Создать month'+inttostr(y-2000)+'.txt';
//       self.GetWorkDays;
//       self.getWorkClocks;
  end;

procedure TFormMonthForGener.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormMonthForGener.FormCreate(Sender: TObject);
begin
     L:=31;
     ComboBox := Nil;
     SelectedRow:=0;
     SelectedCol:=0;
     Caption:='Календарь '+trim(GetMonthRus(MonthOf(WantedData)))+' '+IntToStr(YearOf(WantedData));
 //    LabelRDay.Caption:='0';
end;

procedure TFormMonthForGener.FillStandart(Mode:integer);
 var CurrDate:TDateTime;
     y,m,da:word;
     i,dof,nowe,j,vCode,vDayNo:integer;
     i_row,i_col,i_cell:integer;
     i_start:integer;
     RowCount,CurrRow,CurrDow,valCell:integer;
     finded:boolean;
     strCell:String;
 begin
       FillChar(d,SizeOf(d),0);
       if mode=0 then
          FillChar(d_db,SizeOf(d_db),0);
       StringGridMPr.Cells[0,0]:='Пнд';
       StringGridMPr.Cells[1,0]:='Втр';
       StringGridMPr.Cells[2,0]:='Срд';
       StringGridMPr.Cells[3,0]:='Чтв';
       StringGridMPr.Cells[4,0]:='Птн';
       StringGridMPr.Cells[5,0]:='Сбт';
       StringGridMPr.Cells[6,0]:='Вск';
       l:=LenMonth(WantedData);
       CurrDate:=WantedData;
       DecodeDate(WantedData,y,m,da);
    //   if Mode=1 then GetFromDB;
       i_start  := 1;
       RowCount := 2;
       CurrDow  := 0;
       CurrRow  := 1;
       for i:=1 to l do
           begin
                CurrDate:=EncodeDate(y,m,i);
                dof:=DayOfTheWeek(CurrDate);
                if (currDow>0) then
                   if (dof<currDow) then
                      begin
                           inc(CurrRow);
                           inc(RowCount)
                      end;
                currDow:=dof;
                d[i,1]:=i;
                d[i,2]:=1;
                if dof=6 then d[i,2]:=2;
                if dof=7 then d[i,2]:=3;
                if Mode=1 then   { скорректировать по БД }
                   begin
                         if d_db[i]=2 then d[i,2]:=2
                         else if d_db[i]=3 then d[i,2]:=3
                         else if d_db[i]=4 then d[i,2]:=4
                         else d[i,2]:=d_db[i];
                   end;
                d[i,3]:=currRow;
                d[i,4]:=dof-1;
            end;
       if (mode=1)then
          begin
               UpDownWorkClock.Position:=workclock;
          end;
       StringGridMPr.RowCount:=rowCount;

       for i_row:=1 to StringGridMPr.RowCount-1 do
           for i_col:=0 to 6 do
               begin
                    valCell:=0;
                    strCell:='';
                    finded:=false;
                    vCode:=findCodeinD(i_col,i_row,vDayNo);
                    if vCode>0 then
                       begin
                            finded  := true;
                            valCell := vDayNo;
                            strCell := intToStr(valCell);
                            case vCode of
                                 2:
                                     strCell:=strCell+' сб';
                                 3:
                                     strCell:=strCell+' вс';
                                 4:
                                     strCell:=strCell+' пр';
                                 else
                                     strCell:=strCell+' рб';
                            end
                       end;
                    i_cell:=(i_col-1)*7+i_row+1;
                    if valCell>0 then

                       StringGridMPr.Cells[i_col,i_row]:=strCell;
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
       if mode<>1 then
          GetWorkDays;


 end;


procedure TFormMonthForGener.StringGridMPrDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol     : integer;
    S             : String;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
    Finded        : boolean;
    i,j           : integer;
    Color_My      : TColor;
    vCode,vDayNo  : integer;
begin
//      Exit;
      Color_My:=0;
      vRow := aRow ;
      vCol := aCol ;
      S    := '';
      if vRow=0 then Exit;
 //     if vCol<1 then Exit;
      Finded:=false;
      vCode:=findCodeInD(vCol,vRow,vDayNo);
      if vCode>0 then
         begin
              Finded := true;
              case vCode of
               1: s:='Рб';
               2: begin s:='Сб'; color_my:=clGradientInactiveCaption; end;
               3: begin s:='Вс'; color_my:=clGradientActiveCaption; end;
               4: begin s:='Пр'; color_my:=clYellow; end;
              end;
              s:=trim(IntToStr(vDayNo)+' '+s);
          end
      else
         Exit;
      with Sender as TStringGrid, Canvas do
           begin
//                StringGridMPr.Cells[vCol,vRow]:=s;
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
                if (vCol>=0) then
                    begin
                          SetTextAlign(Handle, TA_LEFT);
{                          TextOut(Rect.Right, Rect.Top+2, S);}
                          TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;

end;

procedure TFormMonthForGener.ComboBoxChange(Sender: TObject);
 var Row,Col,I,J,Code:integer;
     vCode,vDayNo:integer;
begin
     Col:=SelectedCol;
     Row:=SelectedRow;
     Code:=(Sender as TComboBox).ItemIndex+1;
//     StringGridMPr.Cells[Col,Row]:=IntToStr(Code);
     setDayCodeInD(col,row,code);
     GetWorkDays;
     try
        ComboBox.Free;
        ComboBox:=Nil;
        StringGridMPr.Refresh;
        StringGridMPr.Repaint;
        Application.ProcessMessages;
     except
       on EAccessViolation do ShowMessage('Ошибка удаления ComboBox-а');
     end


end;


procedure TFormMonthForGener.MkCombo(ATop,ALeft,AWidth,AHeight:integer);
  var I,J,Row,Col:integer;
       S : String;
       vCode,vDayNo:integer;
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
  //      ComboBox.OnSelect:=Self.ComboBoxChange;
        ComboBox.DropDownCount:=ComboBox.Items.Count;
        ComboBox.Text:=ComboBox.Items[0];
        ComboBox.ItemIndex:=0;
        S:=StringGridMPr.Cells[Col,Row];
        vCode:=findCodeInD(col,row,vDayNo);
        case vCode of
         2:ComboBox.ItemIndex:=1;
         3:ComboBox.ItemIndex:=2;
         4:ComboBox.ItemIndex:=3;
         else
           ComboBox.ItemIndex:=0;
        end;
        ComboBox.Name:='CB';
        ComboBox.Show;

  end;
  
procedure TFormMonthForGener.StringGridMPrDblClick(Sender: TObject);
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

procedure TFormMonthForGener.StringGridMPrSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
      if (StringGridMPr.Cells[ACol,ARow]='') then
         begin
              CanSelect:=false;
              if Assigned(ComboBox) then
                 try
                    ComboBox.Free;
                    ComboBox:=Nil;
                 except
                    on EAccessViolation do ShowMessage('Ошибка удаления ComboBox-а');
                 end
         end
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

procedure TFormMonthForGener.GetFromDB;
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

procedure TFormMonthForGener.PutToDB;
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

procedure TFormMonthForGener.Filld_db;
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


procedure TFormMonthForGener.BitBtn1Click(Sender: TObject);
begin
//     Filld_db;
//     PutToDB;
     SaveToMonths;
     ShowMessage('Данные сохранены');
end;

procedure TFormMonthForGener.BitBtn3Click(Sender: TObject);
 var y:integer;
 begin
     y:=yearOf(wanteddata);
     inc(y);
     makeMonthForYear(y);
//     GetFromMonths;
 end;

procedure TFormMonthForGener.GetFromMonths;
 var y,m,i,j   : integer;
     FName     : string;
     Dev       : TextFile;
     yy,mm,dd  : word;
     SaveWDate : TDateTime;
     DateFrS   : string;
     SQLStmt   : string;
     yw,mw,dw  : word;
     finished  : boolean;
 begin
      SaveWDate := WantedData;
      DeCodeDate(WantedData,yw,mw,dw);
      finished:=false;
      for y:=2000 to 2021 do
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
                         if i<>mw then
                            begin
                                 readln(dev);
                                 continue;
                            end;
                         FillChar(d_db,SizeOf(d_db),0);
                         for j:=1 to 31 do
                             read(dev,d_db[j]);
                         readln(dev);
                         finished:=true;
                         break;

//                         yy := y;
//                         mm := i;
//                         dd := 10;
//                         WantedData := EnCodeDate(yy,mm,dd);
//                         DateFrS:=IntToStr(yy)+'-'+IntToStr(mm)+'-'+IntToStr(10);
//                         SQLStmt:='delete from tb_months_hea where datefr='''+DateFrS+'''';
//                         SQLExecute(SQLStmt);
//                         SQLStmt:='insert into tb_months_hea values ('''+DateFrS+''',0,0,0,0)';
//                         SQLExecute(SQLStmt);
//                         PutToDB;
//                         SQLStmt='update tb_months_hea a set a.work_day_5=(select count(*) from tb_months_pr b where a.datefr=b.datefr and b.code=1) where a.datefr='''+DateFrS+'''';
//                         SQLExecute(SQLStmt);
//                         SQLStmt='update tb_months_hea set work_clock_5=work_day_5*8';
//                         SQLExecute(SQLStmt);

                   end;
               CloseFile(dev);
               if finished then break;
          end;
      FName:=CDIR+'DAY.TXT';
      if not FileExists(FName) then
         begin
              ShowMessage('Нет файла рабочих дней '+FName);
         end
      else
         begin
               AssignFile(Dev,FName);
               reset(dev);
               for i:=1 to 12 do
                   begin
                         if i<>mw then
                         begin
                              readln(dev);
                              continue;
                         end;
                         read(dev,workdayu5,workdayu6,workdayc,dummy,workclock);
                         break;
                   end;
               CloseFile(dev);
         end;
      WantedData := SaveWDate;
//      ShowMessage('Данные сформированы');

 end;


procedure TFormMonthForGener.SaveToMonths;
 var i,j   : integer;
     FName     : string;
     FNameColedg : string;
     Dev       : TextFile;
     FNameO    : string;
     FNameBAK  : string;
     DevO      : TextFile;
     yw,mw,dw  : word;
     s:string;
 begin
      DeCodeDate(WantedData,yw,mw,dw);
      FName:=CDIR+'month'+COPY(ALLTRIM(IntToStr(Yw)),3,2)+'.TXT';
      FNameColedg:=CDIR+'mnthc'+COPY(ALLTRIM(IntToStr(Yw)),3,2)+'.TXT';
      FNameBAK:=CDIR+'month'+COPY(ALLTRIM(IntToStr(Yw)),3,2)+'.BAK';
      if not FileExists(FName) then
         begin
              ShowMessage('Нет календаря для '+IntToStr(Yw)+' года.');
              Exit;
         end;
      FNameO:=CDIR+'MONTHw.txt';
      AssignFile(Dev,FName);
      reset(dev);
      AssignFile(DevO,FNameO);
      rewrite(devO);
      for i:=1 to 12 do
           begin
                readln(dev,s);
                if i<>mw then
                   begin
                       writeln(devo,s);
                       continue;
                   end;
                s:='';
                for j:=1 to 31 do
                    s:=s+' '+intToStr(d[j,2]);
                s:=trim(s);
                writeln(devo,s);

           end;
      CloseFile(dev);
      CloseFile(devo);
      if fileexists(fnamebak) then
      if not deletefile(fnamebak) then
         begin
              showMessage('Ошибка удаления файла '+fnamebak);
              exit;
         end;
      if not renamefile(fname,fnamebak) then
         begin
              showMessage('Ошибка переименования файла '+fname+' в '+fnamebak);
              exit;
         end;
      if not renamefile(fnameo,fname) then
         begin
              showMessage('Ошибка переименования файла '+fnameo+' в '+fname);
              exit;
         end;
      if fileexists(fnamecoledg) then
         if not deletefile(fnamecoledg) then
            begin
                 showMessage('Ошибка удаления файла'+fnamecoledg);
                 exit;
            end;
       if not copyfile(PChar(fname),PChar(fnamecoledg),true) then
          begin
                 showMessage('Ошибка копирования файла '+fname+' в '+fnamecoledg);
                 exit;
          end;

      FName  := CDIR+'DAY.TXT';
      FNameO := CDIR+'DAYW.TXT';
      FNameBAK:=CDIR+'DAY.BAK';
      if not FileExists(FName) then
         begin
              ShowMessage('Нет файла рабочих дней '+FName);
         end
      else
         begin
               workdayc:=workdayu5;
               workclock:=UpDownWorkClock.position;
               AssignFile(Dev,FName);
               reset(dev);
               AssignFile(DevO,FNameO);
               rewrite(devO);
               for i:=1 to 12 do
                   begin
                         readln(dev,s);
                         if i<>mw then
                         begin
                              writeln(devO,s);
                              continue;
                         end;
                         writeln(devO,workdayu5,' ',workdayu6,' ',workdayc,' ',workdayc,' ',workclock);
                   end;
               CloseFile(dev);
               CloseFile(devo);
               if fileexists(fnamebak) then
                  if not deletefile(fnamebak) then
                     begin
                          showMessage('Ошибка удаления файла'+fnamebak);
                          exit;
                     end;
               if not renamefile(fname,fnamebak) then
                  begin
                       showMessage('Ошибка переименования файла '+fname+' в '+fnamebak);
                       exit;
                  end;
               if not renamefile(fnameo,fname) then
                  begin
                       showMessage('Ошибка переименования файла '+fnameo+' в '+fname);
                       exit;
                  end;

         end;

 end;


procedure TFormMonthForGener.FormShow(Sender: TObject);
begin
     Caption:='Календарь '+trim(GetMonthRus(MonthOf(WantedData)))+' '+IntToStr(YearOf(WantedData));
end;

function TFormMonthForGener.GetWorkDays:integer;
 var i,r:integer;
 begin
      r:=0;
      for i:=1 to l_arr do
          if d[i,2]=1 then Inc(R);
      workdayu5:=r;
      r:=0;
      for i:=1 to l_arr do
          if ((d[i,2]=1) or (d[i,2]=2)) then Inc(R);
      workdayu6:=r;
      if isSVDN then
         LabelRDay.Caption:=IntToStr(workdayu5)
      else
         LabelRDay.Caption:='5-'+IntToStr(workdayu5)+'. 6-'+IntToStr(workdayu6);
      getWorkClocks;
      Application.ProcessMessages;
 end;
function TFormMonthForGener.GetWorkClocks;
 var i,r:integer;
     rc:integer;
 begin
      r  := 0;
      rc := 0;
      for i:=1 to l_arr-1 do
          if (d[i,2]=1) then
           if (d[i+1,2]=4) then Rc:=rc+7
                           else rc:=rc+8;
      UpDownWorkClock.Position:=rc;
      workclock:=UpDownWorkClock.Position;
      Application.ProcessMessages;
 end;

function TFormMonthForGener.findCodeInD(vCol,vRow:integer;var dayNo:integer):integer;
 var j,retVal,l:integer;
 begin
      retVal:=0;
      dayNo:=0;
      if vRow>0 then
      for j:=1 to l_arr do
        if (d[j,4]=vCol) and
           (d[j,3]=vRow) then
           begin
                retVal := d[j,2];
                dayNo  := d[j,1];
                break;
           end;
      findCodeInD:=retVal;

 end;
procedure TFormMonthForGener.setDayCodeInD(vCol,vRow,vCode:integer);
 var j:integer;
 begin
      if vRow>0 then
      for j:=1 to l_arr do
        if (d[j,4]=vCol) and
           (d[j,3]=vRow) then
           begin
                d[j,2]:=vCode;
                break;
           end;

 end;

procedure TFormMonthForGener.UpDownWorkClockChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
     EditWorkClock.Text:=IntToStr(UpDownWorkClock.Position);
     workclock:=UpDownWorkClock.Position;
end;

end.
