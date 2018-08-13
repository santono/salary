{$WARNINGS OFF}
{$HINTS OFF}
unit FormAddUdU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,ScrDef, StdCtrls, Buttons, Menus, ImgList, ComCtrls,
  ToolWin, ActnList,UFormWaitMess;

type
  TFormAdd = class(TForm)
    StringAdd: TStringGrid;
    StringUd: TStringGrid;
    StringGridAddTot: TStringGrid;
    StringGridUdTot: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenuAdd: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    PopupMenuUd: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    ImageList1: TImageList;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    ToolBar1: TToolBar;
    ToolAdd: TToolButton;
    ToolDel: TToolButton;
    ToolUpd: TToolButton;
    ToolRecalc: TToolButton;
    ToolMovOtp: TToolButton;
    ToolMovBoln: TToolButton;
    ActionListAddUd: TActionList;
    ActionAddAddUd: TAction;
    ActionDelAddUd: TAction;
    ActionUpdAddUd: TAction;
    ActionRecalcP: TAction;
    ToolSave: TToolButton;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringAddDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringUdDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridUdTotDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridAddTotDrawCell(Sender: TObject; ACol,
      ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure StringAddDblClick(Sender: TObject);
    procedure SetPerson(C_Person:Person_Ptr);
    function Execute(var RetVal:integer): boolean;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure StringUdDblClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure StringAddKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringUdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringAddMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringUdMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringAddKeyPress(Sender: TObject; var Key: Char);
    procedure StringUdKeyPress(Sender: TObject; var Key: Char);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure ActionAddAddUdExecute(Sender: TObject);
    procedure ActionDelAddUdExecute(Sender: TObject);
    procedure ActionUpdAddUdExecute(Sender: TObject);
    procedure ActionRecalcPExecute(Sender: TObject);
    procedure ToolSaveClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
  private
    { Private declarations }
    Curr_Person:Person_Ptr;
    RetCode:integer;
    procedure MakeColorRowAdd(WantedRow:integer);
    procedure MakeColorRowUd(WantedRow:integer);
    procedure MakeGrid;
    procedure MakeGridAdd(U:real);
    procedure MakeGridUd(var U:real);
    procedure DelAllZeroAdd;
    procedure DelAllZeroUd;
    procedure All_Add(Mode_I:integer;CurFil_Add:integer);
    procedure All_Ud(Mode_I:integer;CurFil_Ud:integer);
  public
    { Public declarations }
  end;

var
  FormAdd: TFormAdd;

implementation
  uses ScrLists,ScrExport,ScrUtil, FormUpdAddU,Qt,FormUpdUdU,Salary,UFormUpdAdd,
       UFormUpdUd,ScrNalog,ScrIo,UCRC32{,uSortAdd};

{$R *.dfm}

procedure TFormAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     DelAllZeroAdd;
     DelAllZeroUd;
     Action:=caFree;
end;

procedure TFormAdd.MakeColorRowAdd(WantedRow:integer);
 var I:Integer;
 begin
       for i:=0 to StringAdd.ColCount-1 do
           begin
                if Assigned(StringAdd.Objects[i,WantedRow]) then
                   begin
                         StringAdd.Objects[i,WantedRow].Free;
                         StringAdd.Objects[i,WantedRow]:=Nil;
                   end
                                                             else
                   begin
                        StringAdd.Objects[i,WantedRow]:=TStrColor.Create;
                       (StringAdd.Objects[i,WantedRow] as TStrColor).Color         := clInfoText;
                       (StringAdd.Objects[i,WantedRow] as TStrColor).BackColor     := clInfoBk;
                       (StringAdd.Objects[i,WantedRow] as TStrColor).SelectedColor := clYellow;
                   end;
           end;
 end;

 procedure TFormAdd.MakeColorRowUd(WantedRow:integer);
 var I:Integer;
 begin
       for i:=0 to StringUd.ColCount-1 do
           begin
                if Assigned(StringUd.Objects[i,WantedRow]) then
                   begin
                         StringUd.Objects[i,WantedRow].Free;
                         StringUd.Objects[i,WantedRow]:=Nil;
                   end
                                                             else
                   begin
                        StringUd.Objects[i,WantedRow]:=TStrColor.Create;
                       (StringUd.Objects[i,WantedRow] as TStrColor).Color         := clInfoText;
                       (StringUd.Objects[i,WantedRow] as TStrColor).BackColor     := clInfoBk;
                       (StringUd.Objects[i,WantedRow] as TStrColor).SelectedColor := clYellow;
                   end;
           end;
 end;

procedure TFormAdd.MakeGrid;
 var U:real;
 begin
       Caption:=Alltrim(Curr_Person^.Fio)+' '+AllTrim(Curr_Person^.Dolg)+' '+Get_Kat_Name(Curr_Person^.Kategorija)+' '+Get_Ist_Name(Curr_Person^.Gruppa);
       Caption:=Trim(Caption)+' Pб.'+Trim(IntToStr(Work_Day(1,31,Curr_Person)));

       if ILL_DAY(1,CURR_PERSON)>0 then
          Caption:=Trim(Caption)+' Бл.'+Trim(IntToStr(Ill_Day(1,Curr_Person)));

       if OTPUSK_DAY(1,CURR_PERSON)>0 then
          Caption:=Trim(Caption)+' От.'+Trim(IntToStr(Otpusk_Day(1,Curr_Person)));

       Self.MakeGridUd(U);
       Self.MakeGridAdd(U);
 end;

procedure TFormAdd.MakeGridAdd;
var I_A,I,JJ:Integer;
    Curr_Add:Add_Ptr;
    S:string;
    a:real;
 begin
     I_A:=Count_Add(Curr_Person);
     if i_a<1 then i_a:=1;
     StringAdd.ColCount:=6;
     StringAdd.RowCount:=I_A+1;
     StringAdd.Cells[0,0]   := 'Шифр';
     StringAdd.Cells[1,0]   := 'Название';
     StringAdd.Cells[2,0]   := 'Сумма';
     StringAdd.Cells[3,0]   := 'М-ц';
     StringAdd.Cells[4,0]   := 'Год';
     StringAdd.Cells[5,0]   := 'Фонд';
     StringAdd.ColWidths[0] :=  50;
     StringAdd.ColWidths[1] := 200;
     StringAdd.ColWidths[2] :=  80;
     StringAdd.ColWidths[3] :=  30;
     StringAdd.ColWidths[4] :=  50;
     StringAdd.ColWidths[5] :=  60;
    StringAdd.ColWidths[1]  := StringAdd.Width-
                               StringAdd.ColWidths[0] -
                               StringAdd.ColWidths[2] -
                               StringAdd.ColWidths[3] -
                               StringAdd.ColWidths[4] -
                               StringAdd.ColWidths[5]-10 ;

{
     StringAdd.Width:= StringAdd.ColWidths[0] +
                       StringAdd.ColWidths[1] +
                       StringAdd.ColWidths[2] +
                       StringAdd.ColWidths[3] +
                       StringAdd.ColWidths[4] +
                       StringAdd.ColWidths[5] ;
}
     i:=0;
     a:=0;
     Curr_Add:=Curr_Person^.Add;
     if Curr_Add=Nil then
        begin
             Make_Add(Curr_Add,Curr_Person);
             Curr_Add:=Curr_Person^.Add;
        end;
     while Curr_Add<>Nil do
       begin
            inc(i);
            a:=a+Curr_Add^.Summa;
            StringAdd.Cells[0,i]:=IntToStr(Curr_Add^.Shifr);
//            StringAdd.Cells[1,i]:=ShifrList.GetName(Curr_Add^.Shifr);
            StringAdd.Cells[1,i]:=GetNameShifr(Curr_Add^.Shifr);
            StringAdd.Cells[2,i]:=FloatToStrF(Curr_Add^.Summa,ffFixed,12,2);
            StringAdd.Cells[3,i]:=IntToStr(Curr_Add^.Period);
            StringAdd.Cells[4,i]:=IntToStr(Curr_Add^.Year+1990);
            S:='фзп';
            if abs(Curr_Add^.FMP)>0.001 then S:='фмп';
            if abs(Curr_Add^.OTHER)>0.001 then S:='др';
            StringAdd.Cells[5,i]:=S;
            if Curr_Add^.Vyplacheno=Get_Out then
               begin
                    for jj:=0 to StringAdd.ColCount-1 do
                        begin
                             StringAdd.Objects[jj,i]:=TStrColor.Create;
                             (StringAdd.Objects[jj,i] as TStrColor).Color         := clInfoText;
                             (StringAdd.Objects[jj,i] as TStrColor).BackColor     := clInfoBk;
                             (StringAdd.Objects[jj,i] as TStrColor).SelectedColor := clYellow;
                        end;
               end
            else
                if Assigned(StringAdd.Objects[jj,i]) then
                   begin
                        StringAdd.Objects[jj,i].Free;
                        StringAdd.Objects[jj,i]:=Nil;
                   end;



            Curr_Add:=Curr_Add^.Next;
       end;
     StringGridAddTot.Width:=StringAdd.Width;
     StringGridAddTot.Height:=StringAdd.RowHeightS[0]+StringAdd.RowHeightS[1];
     StringGridAddTot.Left:=StringAdd.Left;
     StringGridAddTot.RowCount:=2;
     StringGridAddTot.ColCount:=StringAdd.ColCount;
     for i:=0 to StringAdd.ColCount-1 do
         StringGridAddTot.ColWidths[i]:=StringAdd.ColWidths[i];
     StringGridAddTot.Cells[1,0]:='Итого начислено';
     StringGridAddTot.Cells[2,0]:=FloatToStrF(A,ffFixed,12,2);
     StringGridAddTot.Cells[1,1]:='К выдаче';
     StringGridAddTot.Cells[2,1]:=FloatToStrF(A-u,ffFixed,12,2);


 end;

procedure TFormAdd.MakeGridUd;
var I_U,I,JJ:Integer;
    Curr_Ud:Ud_Ptr;
    S:string;
begin
     u:=0;
     I_U:=Count_Ud(Curr_Person);
     if i_U<1 then i_u :=1;
     StringUd.ColWidths[0] :=  50;
     StringUd.ColWidths[1] := 180;
     StringUd.ColWidths[2] := 80;
     StringUd.ColWidths[3] := 30;
     StringUd.ColWidths[4] := 60;
     StringUd.ColCount   := 5;
     StringUd.RowCount   := I_U+1;
     StringUd.Cells[0,0] := 'Шифр';
     StringUd.Cells[1,0] := 'Название';
     StringUd.Cells[2,0] := 'Сумма';
     StringUd.Cells[3,0] := 'М-ц';
     StringUd.Cells[4,0] := 'Год';
     StringUd.ColWidths[1] := StringUd.Width-
                              StringUd.ColWidths[0] -
                              StringUd.ColWidths[2] -
                              StringUd.ColWidths[3] -
                              StringUd.ColWidths[4]-10 ;

     Curr_Ud:=Curr_Person^.Ud;
     if Curr_Ud=Nil then
        begin
             Make_Ud(Curr_Ud,Curr_Person);
             Curr_Ud:=Curr_Person^.Ud;
        end;
     i:=0;
     u:=0;
     while Curr_Ud<>Nil do
       begin
            Inc(I);
            u:=u+Curr_Ud^.Summa;
            StringUd.Cells[0,i]:=IntToStr(Curr_Ud^.Shifr);
            StringUd.Cells[1,i]:=ShifrList.GetName(Curr_Ud^.Shifr);
            StringUd.Cells[2,i]:=FloatToStrF(Curr_Ud^.Summa,ffFixed,12,2);
            StringUd.Cells[3,i]:=IntToStr(Curr_Ud^.Period);
            StringUd.Cells[4,i]:=IntToStr(Curr_Ud^.Year+1990);
            if Curr_Ud^.Vyplacheno=Get_Out then
               begin
                    for jj:=0 to StringUd.ColCount-1 do
                        begin
                             StringUd.Objects[jj,i]:=TStrColor.Create;
                             (StringUd.Objects[jj,i] as TStrColor).Color         := clInfoText;
                             (StringUd.Objects[jj,i] as TStrColor).BackColor     := clInfoBk;
                             (StringUd.Objects[jj,i] as TStrColor).SelectedColor := clYellow;
                        end;
               end
            else
                if Assigned(StringUd.Objects[jj,i]) then
                   begin
                        StringUd.Objects[jj,i].Free;
                        StringUd.Objects[jj,i]:=Nil;
                   end;

            Curr_Ud:=Curr_Ud^.Next;
       end;

     StringGridUdTot.Width:=StringUd.Width;
     StringGridUdTot.Left:=StringUd.Left;
     StringGridUdTot.ColCount:=StringUd.ColCount;
     for i:=0 to StringUd.ColCount-1 do
         StringGridUdTot.ColWidths[i]:=StringUd.ColWidths[i];
     StringGridUdTot.Cells[1,0]:='Итого удержано';
     StringGridUdTot.Cells[2,0]:=FloatToStrF(u,ffFixed,12,2);

end;

procedure TFormAdd.StringAddDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var i,k:integer;
    vRow,vCol:integer;
    a:double;
    S:String;
    Shift:integer;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
begin
      i:=1;
      vRow:=aRow;
      vCol:=aCol;
      if vRow<1 then Exit;
      S:=StringAdd.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                if (gdSelected in State) and (Sender = ActiveControl) then
                   begin
                        Brush.Color := clHighlight;
                        If assigned(Objects[vCol,vRow]) then
                           begin
                                 OldFontColor := Font.Color;
                                 OldBrushColor := Brush.Color;
                                 Font.Color := (Objects[vCol,vRow] as TStrColor).SelectedColor;
                           end
                   end
                                         else
                if (gdFixed in State) and (Sender = ActiveControl ) then
                   begin
                        Brush.Color := FixedColor;
                        If assigned(Objects[vCol,vRow]) then
                           begin
                                OldFontColor := Font.Color;
                                OldBrushColor := Brush.Color;
                                Font.Color := (Objects[vCol,vRow] as TStrColor).Color;
                                Brush.Color := (Objects[vCol,vRow] as TStrColor).BackColor;
                           end
                   end
                                         else
                    begin
                         Brush.Color := Color;
                         Font.Color  := clWindowText;
                         if (vRow mod 2 = 1) then Brush.Color:=clInfoBk
                                             else Brush.Color:=cl3dLight;
{
                         If assigned(Objects[vCol,vRow]) then
                            begin
                                 OldFontColor  := Font.Color;
                                 OldBrushColor := Brush.Color;
                                 Font.Color    := (Objects[vCol,vRow] as TStrColor).Color;
                                 Brush.Color   := (Objects[vCol,vRow] as TStrColor).BackColor;
                           end;
}
                    end;
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vCol=0) or (vCol=2) or (vCol=3) or (vCol=4) then
                    begin
                         SetTextAlign(Handle, TA_RIGHT);
                         if vCol>1 then Shift:=10
                                   else Shift:= 8;
                         TextOut(Rect.Right-Shift, Rect.Top+2, S);
                    end
                         else
                    begin
                         SetTextAlign(Handle, TA_LEFT);
                         TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;
        if (vCol=0) and (VRow>0) then
           if Assigned(TStringGrid(Sender).Objects[vCol,vRow]) then
           ImageList1.Draw(TStringGrid(Sender).Canvas,Rect.Left+1,Rect.Top+2,1)
                                           else
           ImageList1.Draw(TStringGrid(Sender).Canvas,Rect.Left+1,Rect.Top+2,0)

end;

procedure TFormAdd.StringUdDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var i,k:integer;
    vRow,vCol:integer;
    a:double;
    S:String;
    Shift:integer;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
begin
      i:=1;
      vRow:=aRow;
      vCol:=aCol;
      if vRow<1 then Exit;
      S:=StringUd.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                OldFontColor  := Font.Color;
                OldBrushColor := Brush.Color;
                if (gdSelected in State) and (Sender = ActiveControl ) then
                   begin
                        Brush.Color := clHighlight;
                        If assigned(Objects[vCol,vRow]) then
                           begin
                                 OldFontColor := Font.Color;
                                 OldBrushColor := Brush.Color;
                                 Font.Color := (Objects[vCol,vRow] as TStrColor).SelectedColor;
                           end
                   end
                                         else
                if (gdFixed in State) and (Sender = ActiveControl ) then
                   begin
                        Brush.Color := FixedColor;
                        If assigned(Objects[vCol,vRow]) then
                           begin
                                OldFontColor := Font.Color;
                                OldBrushColor := Brush.Color;
                                Font.Color := (Objects[vCol,vRow] as TStrColor).Color;
                                Brush.Color := (Objects[vCol,vRow] as TStrColor).BackColor;
                           end
                   end
                                         else
                    begin
                         Brush.Color := Color;
                         Font.Color  := clWindowText;
                         if (vRow mod 2 = 1) then Brush.Color:=clInfoBk
                                             else Brush.Color:=cl3dLight;
{
                         If assigned(Objects[vCol,vRow]) then
                            begin
                                 OldFontColor := Font.Color;
                                 OldBrushColor := Brush.Color;
                                 Font.Color := (Objects[vCol,vRow] as TStrColor).Color;
                                 Brush.Color := (Objects[vCol,vRow] as TStrColor).BackColor;
                           end
}                           
                    end;
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vCol=0) or (vCol=2) or (vCol=3) or (vCol=4) then
                    begin
                         SetTextAlign(Handle, TA_RIGHT);
                         if vCol>1 then Shift:=10
                                   else Shift:= 8;
                         TextOut(Rect.Right-Shift, Rect.Top+2, S);
                    end
                         else
                    begin
                         SetTextAlign(Handle, TA_LEFT);
                         TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;
        if (vCol=0) and (VRow>0) then
           if Assigned(TStringGrid(Sender).Objects[vCol,vRow]) then
           ImageList1.Draw(TStringGrid(Sender).Canvas,Rect.Left+1,Rect.Top+2,1)
                                           else
           ImageList1.Draw(TStringGrid(Sender).Canvas,Rect.Left+1,Rect.Top+2,0)
end;

procedure TFormAdd.StringGridUdTotDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var i,k:integer;
    vRow,vCol:integer;
    a:double;
    S:String;
    Shift:integer;
begin
      i:=1;
      vRow:=aRow;
      vCol:=aCol;
      S:=StringGridUdTot.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                Brush.Color := clGreen;
                Font.Color := clWhite;

                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vCol=0) or (vCol=2) or (vCol=3) or (vCol=4) then
                    begin
                         SetTextAlign(Handle, TA_RIGHT);
                         if vCol>1 then Shift:=10
                                   else Shift:= 8;
                         TextOut(Rect.Right-Shift, Rect.Top+2, S);
                    end
                         else
                    begin
                         SetTextAlign(Handle, TA_LEFT);
                         TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;

           end;
end;

procedure TFormAdd.StringGridAddTotDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var i,k:integer;
    vRow,vCol:integer;
    a:double;
    S:String;
    Shift:integer;
begin
      i:=1;
      vRow:=aRow;
      vCol:=aCol;
      S:=StringGridAddTot.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                Brush.Color := clGreen;
                Font.Color := clWhite;

                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vCol=0) or (vCol=2) or (vCol=3) or (vCol=4) then
                    begin
                         SetTextAlign(Handle, TA_RIGHT);
                         if vCol>1 then Shift:=10
                                   else Shift:= 8;
                         TextOut(Rect.Right-Shift, Rect.Top+2, S);
                    end
                         else
                    begin
                         SetTextAlign(Handle, TA_LEFT);
                         TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;

           end;

end;

procedure TFormAdd.StringAddDblClick(Sender: TObject);
var RetVal:integer;
    Curr_Add:Add_Ptr;
    i:integer;
    Summa,FZP,FMP,Other:Real;
begin
{
     FormUpdateAdd:=TFormUpdateAdd.Create(Self);
     if FormUpdateAdd.ShowModal=mrOk then;
}
{
     IF ((WORK_YEAR_VAL<>CurrYear) OR (Flow_Month<>Nmes)) THEN
        begin
             ShowMessage('Изменения можно вносить только в текущий месяц');
             Exit;
        end;
}
     Curr_Add:=Curr_Person^.Add;
     i:=0;
     while (Curr_Add<>Nil) do
      begin
           inc(i);
           if I=StringAdd.Row then break;
              Curr_Add:=Curr_Add^.Next;
      end;

     if Curr_Add^.VYPLACHENO=Get_Out then
     IF ((WORK_YEAR_VAL=CurrYear) and (Flow_Month=Nmes)) THEN
        begin
             ShowMessage('Зажелченные записи изменять нельзя');
             Exit;
        end;

     with TFormUpdAdd.Create(nil) do
         try
             ShifrSta := Curr_Add^.Shifr;
             Summa    := Curr_Add^.Summa;
             MonthZa  := Curr_Add^.Period;
             YearZa   := Curr_Add^.Year+1990;
             if (MonthZa<1) or (MonthZa>12) then MonthZa:=NMES;
             if (YearZa<1991) or (YearZa>CurrYear+1) then YearZa:=CurrYear;
             Days     := Curr_Add^.Work_Day;
             WorkClock := Curr_Add^.Work_Clock;
   //          MonthClock := CLOCKS[NMES];
             MonthClock := GetWorkClockForYearMonth(YearZa,MonthZa);
             Oklad    := Curr_Person^.Oklad;
             Fond     := 0;
             if abs(Curr_Add^.FMP)>0.001   then Fond:=1
                                           else
             if abs(Curr_Add^.Other)>0.001 then Fond:=2;
             WantedTabno:=Curr_Person^.Tabno;
             if Curr_Add<>nil then
                 CurrAdd:=Curr_Add
             else
                 CurrAdd:=Nil;
             SaveRecord;
             if execute(RetVal) then
                begin
                     Curr_Add^.SUMMA := Summa;
                     Curr_Add^.FZP   := 0;
                     Curr_Add^.FMP   := 0;
                     Curr_Add^.OTHER := 0;
                     if Fond=1 then Curr_Add^.FMP:=Curr_Add^.SUMMA
                     else if Fond=2 then Curr_Add^.Other:=Curr_Add^.SUMMA
                     else Curr_Add^.FZP:=Curr_Add^.SUMMA;
                     Curr_Add^.SHIFR:=ShifrSta;
                     Curr_Add^.WORK_DAY:=Days;
                     Curr_Add^.Work_Clock := WorkClock;
                     Curr_Add^.PERIOD:=MonthZa;
                     Curr_Add^.YEAR:=YearZa-1990;
                     if Curr_Person.AUTOMATIC=AUTOMATIC_MODE then
                     if NotEqualOldAndNewRecords then
//                        if Curr_Add^.PERIOD=NMES then
                        begin
                         //    SortedAddList:=TSortedAddList.Init(Curr_Person);
                             if ((Curr_Add^.PERIOD=NMES) or
                                 (not IsOtherPeriodECBShifr(Curr_Add^.Shifr))) then
                                  Calc_Naud_Person(Curr_Person,31)
                             else
                               begin
                                    FLAG_NAUD_FOR_OTHER_MONTH:=true;
                                    Update_Podoh(Curr_Person,Curr_Add^.PERIOD,Curr_Add^.Year);
                                    Prof_Person(Curr_Person);
                                    WS_PERSON(Curr_Person);
                                    FLAG_NAUD_FOR_OTHER_MONTH:=false;
                               end;
                         //    SortedAddList.RestoreOrderAddList(Curr_Person);
                         //    SortedAddList.Done;
                         //    SortedAddList:=Nil;
                        end;
                end;
         finally
   {          free;}
         end;

      Self.MakeGrid;

end;

function TFormAdd.Execute(var RetVal:integer): boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    RetVal:=RetCode;
    result := true;
  end else begin
    result := false;
    RetVal:=RetCode;
  end;
end;

procedure TFormAdd.SetPerson(C_Person:Person_Ptr);
 begin
      Self.Curr_Person:=C_Person;
 end;


procedure TFormAdd.FormShow(Sender: TObject);
begin
      Self.MakeGrid;
      if (NMES=Flow_Month) and (WORK_YEAR_VAL=CURRYEAR) THEN
         ToolSave.Enabled:=true
      else
         ToolSave.Enabled:=false;


end;

procedure TFormAdd.BitBtn1Click(Sender: TObject);
begin
     ModalResult:=mrOk;
     RetCode:=11;
end;

procedure TFormAdd.BitBtn2Click(Sender: TObject);
begin
     ModalResult:=mrOk;
     RetCode:=12;
end;

procedure TFormAdd.FormCreate(Sender: TObject);
begin
     RetCode:=0;
end;

procedure TFormAdd.N1Click(Sender: TObject);
var Curr_Add:Add_Ptr;
    RetVal:Integer;
    Summa,FZP,FMP,Other:real;
begin
     if ((WORK_YEAR_VAL<>CurrYear)or (NMES<>Flow_Month)) then
        begin
             ShowMessage('Изменения можно вносить только в текущий месяц');
             Exit;
        end;

     Make_Add(Curr_Add,Curr_Person);
     Curr_add^.SHIFR  := DefaultAddShifr;
     Curr_Add^.PERIOD := NMES;
     Curr_Add^.Year   := CurrYear-1990;
     with TFormUpdAdd.Create(nil) do
         try
             ShifrSta := Curr_Add^.Shifr;
             if DOG_POD_PODRAZD(NSRV) then
                ShifrSta:=DogPodShifr;
             Summa    := Curr_Add^.Summa;
             MonthZa  := Curr_Add^.Period;
             YearZa   := Curr_Add^.Year+1990;
             if (MonthZa<1) or (MonthZa>12) then MonthZa:=NMES;
             if (YearZa<1991) or (YearZa>CurrYear+1) then YearZa:=CurrYear;
             Days     := Curr_Add^.Work_Day;
             WorkClock  := Curr_Add^.Work_Clock;
//             MonthClock := CLOCKS[NMES];
             MonthClock := GetWorkClockForYearMonth(YearZa,MonthZa);

             Oklad    := Curr_Person^.Oklad;
             Fond     := 0;
             if abs(Curr_Add^.FMP)>0.001   then Fond:=1
                                           else
             if abs(Curr_Add^.Other)>0.001 then Fond:=2;
             WantedTabno:=Curr_Person^.Tabno;
             if Curr_Add<>nil then
                 CurrAdd:=Curr_Add
             else
                 CurrAdd:=Nil;

             if execute(RetVal) then
                begin
                     Curr_Add^.SUMMA := Summa;
                     Curr_Add^.FZP:=0;
                     Curr_Add^.FMP:=0;
                     Curr_Add^.OTHER:=0;
                     if Fond=1 then Curr_Add^.FMP:=Curr_Add^.SUMMA
                     else if Fond=2 then Curr_Add^.Other:=Curr_Add^.SUMMA
                     else Curr_Add^.FZP:=Curr_Add^.SUMMA;
                     Curr_Add^.SHIFR:=ShifrSta;
                     Curr_Add^.WORK_DAY:=Days;
                     Curr_Add^.WORK_CLOCK:=WorkClock;
                     Curr_Add^.PERIOD:=MonthZa;
                     Curr_Add^.YEAR:=YearZa-1990;
                 //    SortedAddList:=TSortedAddList.Init(Curr_Person);
                     if ((Curr_Add^.PERIOD=NMES) or
                         (not IsOtherPeriodECBShifr(Curr_Add^.Shifr))) then
                        Calc_Naud_Person(Curr_Person,31)
                     else
                         begin
                             FLAG_NAUD_FOR_OTHER_MONTH:=true;
                             Update_Podoh(Curr_Person,Curr_Add^.PERIOD,Curr_Add^.Year);
                             PROF_PERSON(Curr_Person);
                             FLAG_NAUD_FOR_OTHER_MONTH:=false;
                         end;
                 //    SortedAddList.RestoreOrderAddList(Curr_Person);
                 //    SortedAddList.Done;
                 //    SortedAddList:=Nil;

                end;
         finally
{             free;        }
         end;
{

     Self.MakeGrid;
     with TFormUpdateAdd.Create(nil) do
        try
            SetPar(Curr_Add^.Shifr,
                   Curr_Add^.Summa,
                   Curr_Add^.FZP,
                   Curr_Add^.FMP,
                   Curr_Add^.Other,
                   Curr_Add^.Period,
                   Curr_Add^.Year);
            if execute(RetVal) then
              begin
                   GetPar(Curr_Add^.Shifr,
                          Summa,FZP,FMP,Other,
                          Curr_Add^.Period,
                          Curr_Add^.Year);
                   Curr_Add^.SUMMA := Summa;
                   Curr_Add^.FZP   := FZP;
                   Curr_Add^.FMP   := FMP;
                   Curr_Add^.Other := Other;
              end
        finally
        free;
      end;
}
      DelAllZeroAdd;
   //   StringAdd.Row:=StringAdd.RowCount-1;
      Self.MakeGrid;
      StringAdd.Row:=StringAdd.RowCount-1;

end;

procedure TFormAdd.N2Click(Sender: TObject);
{ Удаление начислений }

 var Curr_Add : Add_Ptr;
     i,p,y,i_a : Integer;
     ShifrTmp:integer;
begin
     if StringAdd.Row<1 then Exit;
     if ((WORK_YEAR_VAL<>CurrYear)or (NMES<>Flow_Month)) then
        begin
             ShowMessage('Изменения можно вносить только в текущий месяц');
             Exit;
        end;
     if not YesNo('Удалить запись?') then Exit;
     Curr_Add:=Curr_Person^.Add;
     i:=0;
     while (Curr_Add<>Nil) do
      begin
           inc(i);
           if I=StringAdd.Row then break;
              Curr_Add:=Curr_Add^.Next;
      end;
     if (Curr_Add<>Nil) then
        if Curr_Add^.VYPLACHENO=Get_Out then
           begin
                ShowMessage('Зажелченные записи изменять нельзя');
                Exit;
           end;


     if i>0 then
        begin
             p:=Curr_Add^.PERIOD;
             y:=Curr_Add^.Year;
             ShifrTmp:=Curr_Add^.Shifr;
             Del_Add(Curr_Add,Curr_Person);
             i_a:=count_add(curr_person);
         //    SortedAddList:=TSortedAddList.Init(Curr_Person);
             if ((p=NMES) or
                 (not IsOtherPeriodECBShifr(ShifrTmp))) then
                Calc_Naud_Person(Curr_Person,31)
             else
                 begin
                      FLAG_NAUD_FOR_OTHER_MONTH:=true;
                      Update_Podoh(Curr_Person,p,y);
                      PROF_PERSON(Curr_Person);
                      FLAG_NAUD_FOR_OTHER_MONTH:=false;
                 end;
         //    SortedAddList.RestoreOrderAddList(Curr_Person);
         //    SortedAddList.Done;
         //    SortedAddList:=Nil;
        end;
     Self.MakeGrid;
end;

procedure TFormAdd.DelAllZeroAdd;
 begin
      Ldel_Add_Zero(Curr_Person);
 end;
procedure TFormAdd.DelAllZeroUd;
 begin
      Ldel_Ud_Zero(Curr_Person);
 end;

procedure TFormAdd.N3Click(Sender: TObject);
var Curr_Ud:Ud_Ptr;
    RetVal:Integer;
    Summa:real;
begin
     if ((WORK_YEAR_VAL<>CurrYear) or (NMES<>Flow_Month)) then
         begin
              ShowMessage('Изменения можно вносить только в текущий месяц');
              Exit;
         end;
     Make_Ud(Curr_Ud,Curr_Person);
     Curr_Ud^.SHIFR:=Podoh_Shifr;
     Curr_Ud^.PERIOD:=NMES;
     Curr_Ud^.Year:=CurrYear-1990;
      with TFormUpdUd.Create(nil) do
         try
             ShifrSta := Curr_Ud^.Shifr;
             Summa    := Curr_Ud^.Summa;
             MonthZa  := Curr_Ud^.Period;
             YearZa   := Curr_Ud^.Year+1990;
             if (MonthZa<1) or (MonthZa>12) then MonthZa:=NMES;
             if (YearZa<1991) or (YearZa>CurrYear+1) then YearZa:=CurrYear;
             if execute(RetVal) then
                begin
                     Curr_Ud^.SUMMA  := Summa;
                     Curr_Ud^.SHIFR  := ShifrSta;
                     Curr_Ud^.PERIOD := MonthZa;
                     Curr_Ud^.YEAR   := YearZa-1990;
                end;
         finally
             free;
         end;
      Self.MakeGrid;

{
     with TFormUpdateUd.Create(nil) do
        try
            SetPar(Curr_Ud^.Shifr,
                   Curr_Ud^.Summa,
                   Curr_Ud^.Period,
                   Curr_Ud^.Year);
            if execute(RetVal) then
              begin
                   GetPar(Curr_Ud^.Shifr,
                          Summa,
                          Curr_Ud^.Period,
                          Curr_Ud^.Year);
                   Curr_Ud^.SUMMA := Summa;
              end
        finally
        free;
      end;
}
      DelAllZeroUd;
      StringUd.Row:=StringUd.RowCount-1;
      Self.MakeGrid;
end;

procedure TFormAdd.StringUdDblClick(Sender: TObject);
var RetVal:integer;
    Curr_Ud:Ud_Ptr;
    i:integer;
    Summa:Real;
begin
  {
     if ((WORK_YEAR_VAL<>CurrYear) or (NMES<>Flow_Month)) then
         begin
              ShowMessage('Изменения можно вносить только в текущий месяц');
              Exit;
         end;
  }
     Curr_Ud:=Curr_Person^.Ud;
     i:=0;
     while (Curr_Ud<>Nil) do
      begin
           inc(i);
           if I=StringUd.Row then break;
              Curr_Ud:=Curr_Ud^.Next;
      end;

     if Curr_Ud^.VYPLACHENO=Get_Out then
     if ((WORK_YEAR_VAL=CurrYear) and (NMES=Flow_Month)) then
        begin
             ShowMessage('Зажелченные записи изменять нельзя');
             Exit;
        end;

      with TFormUpdUd.Create(nil) do
         try
             ShifrSta := Curr_Ud^.Shifr;
             Summa    := Curr_Ud^.Summa;
             MonthZa  := Curr_Ud^.Period;
             YearZa   := Curr_Ud^.Year+1990;
             if (MonthZa<1) or (MonthZa>12) then MonthZa:=NMES;
             if (YearZa<1991) or (YearZa>CurrYear+1) then YearZa:=CurrYear;
             if execute(RetVal) then
                begin
                     Curr_Ud^.SUMMA  := Summa;
                     Curr_Ud^.SHIFR  := ShifrSta;
                     Curr_Ud^.PERIOD := MonthZa;
                     Curr_Ud^.YEAR   := YearZa-1990;
                end;
         finally
             free;
         end;
      Self.MakeGrid;
{
     with TFormUpdateUd.Create(nil) do
        try
            SetPar(Curr_Ud^.Shifr,
                   Curr_Ud^.Summa,
                   Curr_Ud^.Period,
                   Curr_Ud^.Year);
            if execute(RetVal) then
              begin
                   GetPar(Curr_Ud^.Shifr,
                          Summa,
                          Curr_Ud^.Period,
                          Curr_Ud^.Year);
                   Curr_Ud^.SUMMA := Summa;
              end
        finally
        free;
      end;
      Self.MakeGrid;
}

end;

procedure TFormAdd.N4Click(Sender: TObject);
 var Curr_Ud : Ud_Ptr;
     i : Integer;
begin
     if ((WORK_YEAR_VAL<>CurrYear) or (NMES<>Flow_Month)) then
         begin
              ShowMessage('Изменения можно вносить только в текущий месяц');
              Exit;
         end;

     if StringUd.Row<1 then Exit;
     if not YesNo('Удалить запись?') then Exit;
     Curr_Ud:=Curr_Person^.Ud;
     i:=0;
     while (Curr_Ud<>Nil) do
      begin
           inc(i);
           if I=StringUd.Row then break;
              Curr_Ud:=Curr_Ud^.Next;
      end;
     if i>0 then
        if (Curr_Ud<>Nil) then
        if Curr_Ud^.VYPLACHENO=Get_Out then
           begin
                ShowMessage('Зажелченные записи изменять нельзя');
                Exit;
           end;

     if i>0 then Del_Ud(Curr_Ud,Curr_Person);
     Self.MakeGrid;

end;

procedure TFormAdd.StringAddKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if (Key=119) then self.N2Click(Sender)  {F8 - удалить }
               else
     if (key=85) then Self.ActionRecalcPExecute(Sender)   {U - перерасчет }
               else
//     if (Key=46) or (key=85) then self.N2Click(Sender)
     if Key=45 then self.N1Click(Sender);

end;

procedure TFormAdd.StringUdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if Key=46 then self.N4Click(Sender)
               else
     if Key=45 then self.N3Click(Sender);

end;

procedure TFormAdd.StringAddMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row : Longint;
begin
      StringAdd.MouseToCell(X, Y, Column, Row);
      if (Row=0) and (Column=0) then
         begin
              SortAdd(Curr_Person);
              Self.MakeGrid;
         end;

end;

procedure TFormAdd.StringUdMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Column, Row : Longint;
begin
      StringUd.MouseToCell(X, Y, Column, Row);
      if (Row=0) and (Column=0) then
         begin
              SortUd(Curr_Person);
              Self.MakeGrid;
         end;

end;

procedure TFormAdd.StringAddKeyPress(Sender: TObject; var Key: Char);
var Curr_Add : Add_Ptr;
    i,j:integer;
begin

      if (Key='O') or (Key='o') or (Key='щ') or (Key ='Щ') then
         begin
               if (NMES<>Flow_Month) then
                   begin
                        ShowMessage('Изменения можно вносить только в текущий месяц');
                        Exit;
                   end;
               J:=Count_Add(Curr_Person);
               if StringAdd.Row<=j then
                  begin
                        i:=0;
                        Curr_Add:=Curr_Person^.Add;
                        while (Curr_Add<>Nil) do
                              begin
                                   inc(i);
                                   if (i=StringAdd.Row) then
                                      begin
                                           Curr_Add^.VYPLACHENO:=1-Curr_Add^.VYPLACHENO;
                                           MakeColorRowAdd(StringAdd.Row);
                                           break;
                                      end;
                                   Curr_Add:=Curr_Add^.NEXT;
                              end;
                  end;
               StringAdd.Refresh;
         end;

end;

procedure TFormAdd.StringUdKeyPress(Sender: TObject; var Key: Char);
var Curr_Ud : Ud_Ptr;
    i,j:integer;
begin
      if (Key='O') or (Key='o') or (Key='щ') or (Key ='Щ') then
         begin
               J:=Count_Ud(Curr_Person);
               if StringUd.Row<=j then
                  begin
                        i:=0;
                        Curr_Ud:=Curr_Person^.Ud;
                        while (Curr_Ud<>Nil) do
                              begin
                                   inc(i);
                                   if (i=StringUd.Row) then
                                      begin
                                           Curr_Ud^.VYPLACHENO:=1-Curr_Ud^.VYPLACHENO;
                                           MakeColorRowUd(StringUd.Row);
                                           break;
                                      end;
                                   Curr_Ud:=Curr_Ud^.NEXT;
                              end;
                  end;
               StringUd.Refresh;
         end;
end;

procedure TFormAdd.N5Click(Sender: TObject);
begin
{     self.N2Click(Sender);    }
     Self.ActionRecalcPExecute(Sender);
end;

procedure TFormAdd.All_Add(Mode_I:integer;CurFil_Add:integer);
 var I        : integer;
     Curr_Add : Add_ptr;
     Mode     : integer;
  procedure Block_For_All(Mode:integer);
{ MODE=1 - всем блокировать    }
{     =2 - всем разблокировать }
    var I        : integer;
        C_Person : Person_ptr;
   procedure Block_Wanted_Add;
    var I  : integer;
        C_Add  : Add_Ptr;
    begin
         I     := 0;
         C_Add := C_Person^.ADD;
         while C_Add<>Nil do
          begin
               Inc(I);
               if C_Add^.Shifr  = Curr_Add^.Shifr  then
               if C_Add^.Period = Curr_Add^.Period then
               if Mode = 1 then C_Add^.Vyplacheno:=GET_OUT
                           else C_Add^.Vyplacheno:=NOT_GET_OUT;
               C_Add:=C_Add^.NEXT;
          end;
    end;
   begin
       if not Mode in [1,2] then Exit;
       C_Person := Head_Person;
       while (C_Person<>Nil) do
         begin
             Block_Wanted_Add;
             C_Person:=C_Person^.Next;
         end;
   end;
  procedure Add_To_All;
   var
       C_Add:Add_Ptr;
       C_Person:Person_Ptr;
       Nxt : Pointer;
   begin
       C_Person:=Head_Person;
       while (C_Person<>Nil) do
        begin
             if C_Person<>Curr_Person then
                begin
                     Make_Add(C_Add,C_Person);
                     Nxt         := C_Add^.NEXT;
                     C_Add^      := Curr_Add^;
                     C_Add^.Next := Nxt;
                END;
             C_Person:=C_Person^.NEXT;
        end;
   end;
  procedure Del_From_All;
   var J,I,I_C      : integer;
       C_Person     : Person_Ptr;
       Period,Shifr : integer;
   begin
       Period := Curr_Add^.Period;
       Shifr  := Curr_Add^.Shifr;
       if Curr_Add^.Vyplacheno=Get_Out then
          begin
                ShowMessage('Удалять заблокированную запись нельзя');
                Exit;
          end;
       C_Person:=Head_Person;
       while (C_Person<>NIl) do
         begin
              repeat
              until not (Del_Wanted_Add(Shifr,C_Person,Period));
              if C_Person=Curr_Person then
                 begin
                      if Curr_Person^.Add=Nil then Make_Add(Curr_Add,Curr_Person)
                                              else
                        begin
                             if (NMES<>Curr_Add^.Period)and
                                IsOtherPeriodECBShifr(Curr_Add^.Shifr) then
                              Flag_Naud_For_Other_Month:=TRUE;
                             Update_Podoh(Curr_Person,Curr_Add^.Period,Curr_Add^.Year);
{                             Pens_Person(Curr_Person);}
                             Prof_Person(Curr_Person);
{                             Fond_Person(Curr_Person);  }
                             Flag_Naud_For_Other_Month:=FALSE;
                             Calc_Naud_Person(Curr_Person,31)

                        end;
                end;
              C_Person:=C_Person^.Next;
         end;
   end;
 begin
      if ((WORK_YEAR_VAL<>CurrYear) or (NMES<>Flow_Month)) then
         begin
               ShowMessage('Изменения можно вносить только в текущий месяц');
               Exit;
         end;
      i:=0;
      Curr_Add:=Curr_Person^.Add;
      while (Curr_Add<>Nil) do
       begin
            inc(i);
            if CurFil_Add=i then break;
            Curr_Add:=Curr_Add^.NEXT;
       end;
      if Curr_Add^.Shifr<=0       then Exit;
      if Curr_Add^.Shifr>MAXSHIFR then Exit;
      if Mode_I<1                 then Exit;
      if Mode_I>4                 then Exit;
       if (Mode_I=1) and (Curr_Add^.Shifr<1) then Exit;
 //     ITEM^[1]:='ОТМЕЧЕННУЮ СТАТЬЮ ЗАНЕСТИ ВСЕМ         ';
 //     ITEM^[2]:='ОТМЕЧЕННУЮ СТАТЬЮ УБРАТЬ У ВСЕХ        ';
 //     ITEM^[3]:='ОТМЕЧЕННУЮ СТАТЬЮ ЗАБЛОКИРОВАТЬ ВСЕМ   ';
 //     ITEM^[4]:='ОТМЕЧЕННУЮ СТАТЬЮ РАЗБЛОКИРОВАТЬ У ВСЕХ';
 //     ITEM^[5]:='В Ы Х О Д                              ';
      case Mode_I of
        1 : Add_To_All;
        2 : Del_From_All;
        3 : Block_For_All(1);
        4 : Block_For_All(2);
      end;
end;

procedure TFormAdd.All_Ud(Mode_I:integer;CurFil_Ud:integer);
 var I        : integer;
     Curr_Ud  : Ud_ptr;
     Mode     : integer;
  procedure Block_For_All(Mode:integer);
{ MODE=1 - всем блокировать    }
{     =2 - всем разблокировать }
    var I        : integer;
        C_Person : Person_ptr;
   procedure Block_Wanted_Ud;
    var I  : integer;
        C_Ud  : Ud_Ptr;
    begin
         I     := 0;
         C_Ud := C_Person^.Ud;
         while C_Ud<>Nil do
          begin
               Inc(I);
               if C_Ud^.Shifr  = Curr_Ud^.Shifr  then
               if C_Ud^.Period = Curr_Ud^.Period then
               if Mode = 1 then C_Ud^.Vyplacheno:=GET_OUT
                           else C_Ud^.Vyplacheno:=NOT_GET_OUT;
               C_Ud:=C_Ud^.NEXT;
          end;
    end;
   begin
       if not Mode in [1,2] then Exit;
       C_Person := Head_Person;
       while (C_Person<>Nil) do
         begin
             Block_Wanted_Ud;
             C_Person:=C_Person^.Next;
         end;
   end;
  procedure Add_To_All;
   var
       C_Ud:Ud_Ptr;
       C_Person:Person_Ptr;
       Nxt : Pointer;
   begin
       C_Person:=Head_Person;
       while (C_Person<>Nil) do
        begin
             if C_Person<>Curr_Person then
                begin
                     Make_Ud(C_Ud,C_Person);
                     Nxt         := C_Ud^.NEXT;
                     C_Ud^      := Curr_Ud^;
                     C_Ud^.Next := Nxt;
                END;
             C_Person:=C_Person^.NEXT;
        end;
   end;
  procedure Del_From_All;
   var J,I,I_C      : integer;
       C_Person     : Person_Ptr;
       Period,Shifr : integer;
   begin
       Period := Curr_Ud^.Period;
       Shifr  := Curr_Ud^.Shifr;
       if Curr_Ud^.Vyplacheno=Get_Out then
          begin
                ShowMessage('Удалять заблокированную запись нельзя');
                Exit;
          end;
       C_Person:=Head_Person;
       while (C_Person<>NIl) do
         begin
              repeat
              until not (Del_Wanted_Ud(Shifr,C_Person,Period));
              if C_Person=Curr_Person then
                 begin
                      if Curr_Person^.Add=Nil then Make_Ud(Curr_Ud,Curr_Person)
                                              else
                        begin
                             Calc_Naud_Person(Curr_Person,31)
                        end;
                end;
              C_Person:=C_Person^.Next;
         end;
   end;
 begin
      if ((WORK_YEAR_VAL<>CurrYear) or (NMES<>Flow_Month)) then
         begin
               ShowMessage('Изменения можно вносить только в текущий месяц');
               Exit;
         end;
      i:=0;
      Curr_Ud:=Curr_Person^.Ud;
      while (Curr_Ud<>Nil) do
       begin
            inc(i);
            if CurFil_Ud=i then break;
            Curr_Ud:=Curr_Ud^.NEXT;
       end;
      if Curr_Ud^.Shifr<=0        then Exit;
      if Curr_Ud^.Shifr>MAXSHIFR  then Exit;
      if Mode_I<1                 then Exit;
      if Mode_I>4                 then Exit;
       if (Mode_I=1) and (Curr_Ud^.Shifr<1) then Exit;
 //     ITEM^[1]:='ОТМЕЧЕННУЮ СТАТЬЮ ЗАНЕСТИ ВСЕМ         ';
 //     ITEM^[2]:='ОТМЕЧЕННУЮ СТАТЬЮ УБРАТЬ У ВСЕХ        ';
 //     ITEM^[3]:='ОТМЕЧЕННУЮ СТАТЬЮ ЗАБЛОКИРОВАТЬ ВСЕМ   ';
 //     ITEM^[4]:='ОТМЕЧЕННУЮ СТАТЬЮ РАЗБЛОКИРОВАТЬ У ВСЕХ';
 //     ITEM^[5]:='В Ы Х О Д                              ';
      case Mode_I of
        1 : Add_To_All;
        2 : Del_From_All;
        3 : Block_For_All(1);
        4 : Block_For_All(2);
      end;
end;

procedure TFormAdd.N7Click(Sender: TObject);
begin
     All_Add(1,StringAdd.Row);
     Application.ProcessMessages;
end;

procedure TFormAdd.N8Click(Sender: TObject);
begin
     All_Add(2,StringAdd.Row);
     Application.ProcessMessages;

end;

procedure TFormAdd.N9Click(Sender: TObject);
begin
     All_Add(3,StringAdd.Row);
     Application.ProcessMessages;
end;

procedure TFormAdd.N10Click(Sender: TObject);
begin
     All_Add(4,StringAdd.Row);
     Application.ProcessMessages;
end;

procedure TFormAdd.ActionAddAddUdExecute(Sender: TObject);
begin
     if StringAdd.Focused then  N1Click(Sender)
     else if StringUd.Focused then  N3Click(Sender);
{       N2Click(Self)  }

end;

procedure TFormAdd.ActionDelAddUdExecute(Sender: TObject);
begin
     if StringAdd.Focused then  N2Click(Sender)
     else if StringUd.Focused then  N4Click(Sender);
end;

procedure TFormAdd.ActionUpdAddUdExecute(Sender: TObject);
begin
     if StringAdd.Focused then  StringAddDblClick(Sender)
     else if StringUd.Focused then  StringUdDblClick(Sender);
end;

procedure TFormAdd.ActionRecalcPExecute(Sender: TObject);
 var Curr_Add:Add_Ptr;
     i:integer;
begin
     if ((WORK_YEAR_VAL<>CurrYear) or (NMES<>Flow_Month)) then
        begin
             ShowMessage('Перерасчет возможен только в текущем месяце');
             Exit;
        end;
     if not StringAdd.Focused then
        begin
             ShowMessage('Установите курсор на строку начислений с нужнім периодом перерасчета');
             Exit;
        end;
     if CalculationPersonInProgress then Exit;
     CalculationPersonInProgress:=True;
     Curr_Add:=Curr_Person^.Add;
     i:=0;
     while (Curr_Add<>Nil) do
      begin
           inc(i);
           if I=StringAdd.Row then break;
              Curr_Add:=Curr_Add^.Next;
      end;
      if i<1 then
         begin
              CalculationPersonInProgress:=false;
              Exit;
         end;
      if i>Count_Add(Curr_Person) then
         begin
              CalculationPersonInProgress:=false;
              Exit;
         end;
//      SortedAddList:=TSortedAddList.Init(Curr_Person);
      if ((Curr_Add^.PERIOD=NMES) or
          (not IsOtherPeriodECBShifr(Curr_Add^.Shifr))) then
         Calc_Naud_Person(Curr_Person,31)
      else
          begin
               FLAG_NAUD_FOR_OTHER_MONTH:=true;
               Update_Podoh(Curr_Person,Curr_Add^.PERIOD,Curr_Add^.Year);
               FLAG_NAUD_FOR_OTHER_MONTH:=false;
               Calc_Naud_Person(Curr_Person,31)
          end;
 //     SortedAddList.RestoreOrderAddList(Curr_Person);
 //     SortedAddList.Done;
 //     SortedAddList:=Nil;
      CalculationPersonInProgress:=false;

      Self.MakeGrid;

end;

procedure TFormAdd.ToolSaveClick(Sender: TObject);
 var Save_Safe_PutInf:boolean;
begin
     if ((WORK_YEAR_VAL<>CurrYear) or (NMES<>Flow_Month)) then
        begin
            error('Сохранять данные можно только в текущем месяце');
            exit;
        end;

     IF WORK_YEAR_VAL<>CURRYEAR THEN
        BEGIN
             error('Сохранять данные можно только в текущем месяце');
             Exit;
        END;
     CRC32Ori:=PodrCRC32;
     Save_Safe_PutInf:=Safe_PutInf;
     PutInf;
     FormWaitMess.SetMessage('Данные сохранены');
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;
     Safe_PutInf:=Save_Safe_PutInf;
end;


procedure TFormAdd.N12Click(Sender: TObject);
begin
     All_Ud(2,StringUd.Row);
     Application.ProcessMessages;
end;

procedure TFormAdd.N13Click(Sender: TObject);
begin
     All_Ud(1,StringUd.Row);
     Application.ProcessMessages;

end;

procedure TFormAdd.N14Click(Sender: TObject);
begin
     All_Ud(3,StringUd.Row);
     Application.ProcessMessages;

end;

procedure TFormAdd.N15Click(Sender: TObject);
begin
     All_Ud(4,StringUd.Row);
     Application.ProcessMessages;

end;

end.

