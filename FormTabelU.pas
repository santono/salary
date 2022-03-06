unit FormTabelU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,ScrDef, StdCtrls, Buttons, ImgList, Menus;

type
  TFormTabel = class(TForm)
    StringGridT: TStringGrid;
    StringGridS: TStringGrid;
    BitBtn1: TBitBtn;
    BoxTabel: TComboBox;
    BoxDirection: TComboBox;
    ImageList1: TImageList;
    BitBtnExcel: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    bitBtnItogoCLocks: TBitBtn;
    procedure SetCurrPerson(C_Person:Person_Ptr);
    function GetRow:integer;
    procedure FormShow(Sender: TObject);
    function Execute(var RetVal:integer): boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure StringGridTTopLeftChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGridTKeyPress(Sender: TObject; var Key: Char);
    procedure StringGridTSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure BitBtnExcelClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure bitBtnItogoCLocksClick(Sender: TObject);
  private
    { Private declarations }
    RetCode : integer;
    Curr_Person : Person_Ptr;
    CurrDir : integer;
    CurrT   : integer;
    RowForCaption : integer;
    procedure MakeGrid;
    function GetSTabel(CodeT:Byte):String;
    procedure ShowCaption(WantedRow:integer);
    procedure fillStandartTabel(curr_person:person_ptr);
    procedure showGridRow(wantedRow:integer;curr_person:person_ptr);

  public
    { Public declarations }
  end;

var
  FormTabel: TFormTabel;

implementation
  uses ScrUtil,Salary,UFormExportTabelToExcel, UFormTabelItogoClocks,Math;

{$R *.dfm}
const
      MAX_TABEL_KOD=20;
      SHIFR_TABEL:ARRAY[1..MAX_TABEL_KOD] OF STRING[2]=
         ('Я ','ОЖ','К ','Т ','У ','ОТ','А ','ЛЧ','Е ','Ч ','Г ','Р ','Б ','ПР','  ','ЛТ','До','ПК','П ','ТВ');
      LONG_MONTH:ARRAY[1..12] OF INTEGER=
         (31,29,31,30,31,30,31,31,30,31,30,31);
      {$IFDEF SVDN}
      NAME_TABEL:ARRAY[1..MAX_TABEL_KOD] OF STRING[35]=
           ('Явка на роботу                    ',
            'Вiдпуска жiнкам на дитину до року ',
            'Служебовi вiдрядення              ',
            'Неспачувана непрацездатнiсть      ',
            'Вiпустка у звязку з навчанням     ',
            'Щорiчна вiдпустка                 ',
            'Вiпустка без збереження зарплати  ',
            'Зкорочений рабочий день           ',
            'Вихiднi та святковi днi           ',
            'Вiйсково-навчальнi зборы          ',
            'Державнi обов''язки               ',
            'Вiдпуска по вагiтностi та пологам ',
            'Захворювання                      ',
            'Прогул                            ',
            'Пробiл                            ',
            'Легка праця                       ',
            'Донорскi                          ',
            'Подвищення квалiфiкацii           ',
            'Простой                           ',
            'Творча вiдпустка                  ');
      {$ELSE}
      NAME_TABEL:ARRAY[1..MAX_TABEL_KOD] OF STRING[35]=
           ('Явка на работу                    ',
            'Отпуск женщинам на ребенка до года',
            'Служебные командировки            ',
            'Неоплачиваемая нетрудоспособность ',
            'Отпуск в связи с обучением        ',
            'Ежегодные отпуска                 ',
            'Отпуск без сохранения зарплаты    ',
            'Сокращенный рабочий день          ',
            'Выходные и праздничные дни        ',
            'Военно-учебные сборы              ',
            'Государственные обязанности       ',
            'Отпуска по беременности и родам   ',
            'Болезнь                           ',
            'Прогул                            ',
            'Пробел                            ',
            'Легкий труд                       ',
            'Донорские                         ',
            'Повышение квалификации            ',
            'Простой                           ',
            'Творческий отпуск                 ');
      {$ENDIF}
            RIGHT_DIRECTION = 1;
            DOWN_DIRECTION  = 2;
            LEFT_DIRECTION  = 3;
            UP_DIRECTION    = 4;


procedure TFormTabel.MakeGrid;
 const F='######0.00';
var I_C,I,J,JJ:Integer;
    Curr_P:Person_Ptr;
    CurrRow:Integer;
    JJClock:real;
    s:string;
 begin
     Caption:='Табель '+Trim(Month[NMES])+' '+IntToStr(CurrYear)+' г. '+NAME_SERV(NSRV);
     I_C:=Count_Person;
     if i_c<1 then i_c:=1;
     StringGridT.ColCount := LONG_MONTH[NMES]+1;
     StringGridT.RowCount:=I_C+1;
     StringGridT.Cells[0,0]   := 'Сотрудник';
     for i:=1 to StringGridT.ColCount do StringGridT.Cells[i,0]:=IntToStr(I);
     StringGridT.ColWidths[0] := 200;
     for i:=1 to StringGridT.ColCount-1 do
         StringGridT.ColWidths[i]:=25;
     StringGridT.Width := StringGridT.ColWidths[1]*27+175+20;

     StringGridS.Top        := StringGridT.Top;
     StringGridS.Height     := StringGridT.Height;
     StringGridS.Left       := StringGridT.Left + StringGridT.width+1;
     StringGridS.RowCount   := StringGridT.RowCount;
     if isSvdn then
        StringGridS.ColCount   := 6
     else
        StringGridS.ColCount   := 3;
     StringGridS.Cells[0,0] :='Раб';
     StringGridS.Cells[1,0] :='Бол';
     StringGridS.Cells[2,0] :='Отп';
     if isSvdn then
        begin
             StringGridS.Cells[3,0] :='Про';
             StringGridS.Cells[4,0] :='ТвО';
             StringGridS.Cells[5,0] :='Год';
        end;

     for i:=0 to StringGridS.ColCount-1 do StringGridS.ColWidths[i]:=25;
     if isSVDN then
        StringGridS.ColWidths[StringGridS.ColCount-1]:=50;
     StringGridS.Width := 0;
     for i:=0 to StringGridS.ColCount-1 do
         StringGridS.Width := StringGridS.Width + StringGridS.ColWidths[i];;
     StringGridS.Width := StringGridS.Width + 30;
     for I:=1 to StringGridS.RowCount-1 do
         begin
              StringGridS.Cells[0,i]:=IntToStr(1);
              StringGridS.Cells[1,i]:=IntToStr(15);
              StringGridS.Cells[2,i]:=IntToStr(10);
              if isSVDN then
                 begin
                      StringGridS.Cells[3,i]:=IntToStr(19);
                      StringGridS.Cells[4,i]:=IntToStr(20);
                      StringGridS.Cells[5,i]:=' ';
                 end;
         end;

     Curr_P:=Head_Person;
     I:=0;
     CurrRow:=1;
     while Curr_P<>Nil do
       begin
            Inc(I);
            if Assigned(Curr_Person) then
               if Curr_P=Curr_Person then CurrRow:=I;
            StringGridT.Cells[0,i]:=IntToStr(Curr_P^.Tabno)+' '+Trim(Curr_P^.Fio)+' '+FormatFloat(F,GET_KOEF_OKLAD_PERSON(Curr_P));
            for j:=1 to StringGridT.ColCount-1 do
                StringGridT.Cells[j,i]:=Self.GetSTabel(Curr_P^.Tabel[j]);
            JJ:=Work_Day(1,31,Curr_P);
            if JJ>0 then StringGridS.Cells[0,i]:=IntToStr(JJ)
                    else StringGridS.Cells[0,i]:='';
            JJ:=Ill_Day(1,Curr_P);
            if JJ>0 then StringGridS.Cells[1,i]:=IntToStr(JJ)
                    else StringGridS.Cells[1,i]:='';
            JJ:=Otpusk_Day(1,Curr_P);
            if JJ>0 then StringGridS.Cells[2,i]:=IntToStr(JJ)
                    else StringGridS.Cells[2,i]:='';
            if isSVDN then
               begin
                    JJ:=Prostoy_Day(1,31,Curr_P);
                    if JJ>0 then StringGridS.Cells[3,i]:=IntToStr(JJ)
                            else StringGridS.Cells[3,i]:='';
                    JJ:=TvOtp_Day(1,31,Curr_P);
                    if JJ>0 then StringGridS.Cells[4,i]:=IntToStr(JJ)
                            else StringGridS.Cells[4,i]:='';
                    JJClock:=WORK_CLOCK_LERA(1,31,Curr_P);
                    if (JJClock>0.01) then
                       begin
                            str(roundto(JJClock,-1):15:1,s);
                            s:=trim(s);
                            StringGridS.Cells[5,i]:=s;
                       end
                    else
                       StringGridS.Cells[5,i]:='';
               end;
            if Curr_P^.Automatic=1 then
               begin
                    for jj:=0 to StringGridT.ColCount-1 do
                        begin
                             StringGridT.Objects[jj,i]:= TStrColor.Create;
                             (StringGridT.Objects[jj,i] as TStrColor).Color         := clInfoText;
                             (StringGridT.Objects[jj,i] as TStrColor).BackColor     := clInfoBk;
                             (StringGridT.Objects[jj,i] as TStrColor).SelectedColor := clYellow;
                        end;
               end
            else
              for jj:=0 to StringGridT.ColCount-1 do
                if Assigned(StringGridT.Objects[jj,i]) then
                   begin
                        StringGridT.Objects[jj,i].Free;
                        StringGridT.Objects[jj,i] := Nil;
                   end;
            Curr_P:=Curr_P^.Next;
       end;
     StringGridT.Row:=CurrRow;
     RowForCaption:=0;;
     ShowCaption(CurrRow);
 end;


procedure TFormTabel.ShowCaption(WantedRow:integer);
 const F='######0.00';
 var C_Person : Person_Ptr;
     r : integer;
     S : String;
     a : real;
 begin
     if RowForCaption = WantedRow then Exit;
     c_Person:=Head_Person;
     r:=1;
     while (r<WantedRow) do
           begin
                C_Person:=C_Person^.Next;
                inc(r);
           end;
     RowForCaption := WantedRow;

     if Assigned(C_Person) then
        begin
             a:=GET_KOEF_OKLAD_PERSON(C_PERSON);
             S:=' '+trim(C_Person^.Dolg)+' '+trim(FormatFloat(F,a))+' '
        end
     else
        S:=' ';
     Caption:=Trim(Month[NMES])+' '+IntToStr(CurrYear)+' г.'+S+Trim(NAME_SERV(NSRV));
     Application.ProcessMessages;
 end;

function TFormTabel.Execute(var RetVal:integer): boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    RetVal := RetCode;
    result := true;
  end else begin
    result := false;
    RetVal:=RetCode;
  end;
end;

procedure TFormTabel.SetCurrPerson(C_Person:Person_ptr);
 begin
      Curr_Person:=C_Person;
 end;

function TFormTabel.GetRow:integer;
 begin
       Result:=StringGridT.Row;
 end;

function TFormTabel.GetSTabel(CodeT:Byte):String;
 begin
      Result:=' ';
      if ((CodeT>0) and (CodeT<=MAX_TABEL_KOD)) then
         Result:=Trim(SHIFR_TABEL[CodeT]);
 end;

procedure TFormTabel.FormShow(Sender: TObject);
var I:Integer;
begin
      Self.MakeGrid;
      for i:=1 to MAX_TABEL_KOD do
          BoxTabel.AddItem(NAME_TABEL[I],TObject(Nil));
      BoxTabel.ItemIndex:=0;
      BoxDirection.AddItem('Вниз',TObject(Nil));
      BoxDirection.AddItem('Вправо',TObject(Nil));
      BoxDirection.AddItem('Вверх',TObject(Nil));
      BoxDirection.AddItem('Влево',TObject(Nil));
      BoxDirection.ItemIndex:=0;
end;

procedure TFormTabel.BitBtn1Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TFormTabel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{     Action:=caFree;}
end;

procedure TFormTabel.StringGridTTopLeftChanged(Sender: TObject);
begin
      StringGridS.TopRow:=StringGridT.TopRow;
end;

procedure TFormTabel.FormCreate(Sender: TObject);
begin
      CurrDir:=1;
      n1.Enabled:=false;
      n1.Visible:=false;
      if nmes=flow_month then
      if curryear=work_year_val then
         begin
              n1.Enabled:=true;
              n1.Visible:=true;
         end;
      if isSVDN then
         begin
           bitBtnItogoCLocks.Show;
           bitBtnItogoCLocks.Enabled:=true;
         end
      else
         begin
           bitBtnItogoCLocks.Hide;
           bitBtnItogoCLocks.Enabled:=false;
         end

end;

procedure TFormTabel.StringGridTKeyPress(Sender: TObject; var Key: Char);
var   C,R,jj:integer;
     C_Person:Person_ptr;
     jjClock:Real;
     S:string;
begin
     if Key=chr(13) then
        begin
             if (Nmes<>Flow_Month) then
                 begin
                       ShowMessage('Изменения можно вносить только в текущий месяц');
                       Exit;
                 end;

             c_Person:=Head_Person;
             r:=1;
             while (r<StringGridT.Row) do begin C_Person:=C_Person^.Next; inc(r); end;
             Self.CurrDir:=BoxDirection.ItemIndex+1;
             Self.CurrT:=BoxTabel.ItemIndex+1;
             StringGridT.Cells[StringGridT.Col,StringGridT.Row]:=Shifr_Tabel[Self.CurrT];
             C_person^.Tabel[StringGridT.Col]:=Self.CurrT;
             JJ:=Work_Day(1,31,C_Person);
             if JJ>0 then StringGridS.Cells[0,StringGridT.Row]:=IntToStr(JJ)
                     else StringGridS.Cells[0,StringGridT.Row]:='';
             JJ:=Ill_Day(1,C_Person);
             if JJ>0 then StringGridS.Cells[1,StringGridT.Row]:=IntToStr(JJ)
                     else StringGridS.Cells[1,StringGridT.Row]:='';
             JJ:=Otpusk_Day(1,C_Person);
             if JJ>0 then StringGridS.Cells[2,StringGridT.Row]:=IntToStr(JJ)
                     else StringGridS.Cells[2,StringGridT.Row]:='';
             if isSVDN then
               begin
                    JJ:=Prostoy_Day(1,31,C_Person);
                    if JJ>0 then StringGridS.Cells[3,StringGridT.Row]:=IntToStr(JJ)
                            else StringGridS.Cells[3,StringGridT.Row]:='';
                    JJ:=TvOtp_Day(1,31,C_Person);
                    if JJ>0 then StringGridS.Cells[4,StringGridT.Row]:=IntToStr(JJ)
                            else StringGridS.Cells[4,StringGridT.Row]:='';
                    JJClock:=WORK_CLOCK_LERA(1,31,C_Person);
                    if (JJClock>0.01) then
                       begin
                            str(roundto(JJClock,-1):15:1,s);
                            s:=trim(s);
                            StringGridS.Cells[5,StringGridT.Row]:=s;
                       end
                    else
                       StringGridS.Cells[5,StringGridT.Row]:='';
               end;

             c:=0;
             r:=0;
             case Self.CurrDir of
                  1 : if StringGridT.Row<Count_Person then r:=1;
                  2 : if StringGridT.Col<LONG_MONTH[nmes] then C:=1;
                  3 : if StringGridT.Row>1 then r:=-1;
                  4 : if StringGridT.Col>1 then c:=-1;
             end;
             StringGridT.Row:=StringGridT.Row+R;
             StringGridT.Col:=StringGridT.Col+C;
        end;
end;

procedure TFormTabel.StringGridTSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
 var i:integer;
begin
      i:=1;
      if ARow<>RowForCaption then
         ShowCaption(ARow);
end;

procedure TFormTabel.BitBtnExcelClick(Sender: TObject);
begin
     Application.CreateForm(TFormExportTabelToExcel,FormExportTabelToExcel);
     FormExportTabelToExcel.ShowModal;
end;

procedure TFormTabel.N1Click(Sender: TObject);
var c_person:person_ptr;
    r:integer;
begin
     if nmes<>flow_month     then exit;
     if curryear<>WORK_YEAR_VAL  then exit;
     c_Person:=Head_Person;
     r:=1;
     while (r<StringGridT.Row) do
           begin
                C_Person:=C_Person^.Next;
                inc(r);
           end;
     if c_person<>nil then
        begin
             if curr_person^.AUTOMATIC=AUTOMATIC_MODE then
                begin
                     fillStandartTabel(c_person);
                     showGridRow(r,c_person);
                end;
        end;
end;
procedure TFormTabel.fillStandartTabel(curr_person:person_ptr);
 begin
      FILL_STANDARD_TABEL_PERSON(curr_person);
      MAKE_OTP_TABEL_FROM_SQL(CURR_PERSON);
      MAKE_OG_TABEL_FROM_SQL(CURR_PERSON);
      MAKE_OBO_TABEL_FROM_SQL(CURR_PERSON);
      FILL_TABEL_UW_person(CURR_PERSON);

 end;
procedure TFormTabel.showGridRow(wantedRow:integer;curr_person:person_ptr);
 var j,jj:integer;
     JJClock:real;
     s:string;
 begin
//      StringGridT.Cells[0,wantedRow]:=IntToStr(Curr_Person^.Tabno)+' '+Trim(Curr_Person^.Fio)+' '+FormatFloat(F,GET_KOEF_OKLAD_PERSON(Curr_Person));
            for j:=1 to StringGridT.ColCount-1 do
                StringGridT.Cells[j,wantedRow]:=Self.GetSTabel(Curr_Person^.Tabel[j]);
            JJ:=Work_Day(1,31,Curr_Person);
            if JJ>0 then StringGridS.Cells[0,wantedRow]:=IntToStr(JJ)
                    else StringGridS.Cells[0,wantedRow]:='';
            JJ:=Ill_Day(1,Curr_Person);
            if JJ>0 then StringGridS.Cells[1,wantedRow]:=IntToStr(JJ)
                    else StringGridS.Cells[1,wantedRow]:='';
            JJ:=Otpusk_Day(1,Curr_Person);
            if JJ>0 then StringGridS.Cells[2,wantedRow]:=IntToStr(JJ)
                    else StringGridS.Cells[2,wantedRow]:='';
            if isSVDN then
               begin
                     JJ:=Prostoy_Day(1,31,Curr_Person);
                     if JJ>0 then StringGridS.Cells[3,wantedRow]:=IntToStr(JJ)
                             else StringGridS.Cells[3,wantedRow]:='';
                     JJ:=TvOtp_Day(1,31,Curr_Person);
                     if JJ>0 then StringGridS.Cells[4,wantedRow]:=IntToStr(JJ)
                             else StringGridS.Cells[4,wantedRow]:='';
                     JJClock:=work_clock_lera(1,31,curr_person);
                     Str(JJClock:12:1,s);
                     s:=trim(s);
                     if JJClock>0.1 then StringGridS.Cells[5,wantedRow]:=s
                                    else StringGridS.Cells[5,wantedRow]:='';
               end;
            if Curr_Person^.Automatic=1 then
               begin
                    for jj:=0 to StringGridT.ColCount-1 do
                        begin
                             StringGridT.Objects[jj,wantedRow]:= TStrColor.Create;
                             (StringGridT.Objects[jj,wantedRow] as TStrColor).Color         := clInfoText;
                             (StringGridT.Objects[jj,wantedRow] as TStrColor).BackColor     := clInfoBk;
                             (StringGridT.Objects[jj,wantedRow] as TStrColor).SelectedColor := clYellow;
                        end;
               end
            else
              for jj:=0 to StringGridT.ColCount-1 do
                if Assigned(StringGridT.Objects[jj,wantedRow]) then
                   begin
                        StringGridT.Objects[jj,wantedRow].Free;
                        StringGridT.Objects[jj,wantedRow]:=Nil;
                   end;

 end;
procedure TFormTabel.bitBtnItogoCLocksClick(Sender: TObject);
begin
      Application.CreateForm(TFormTabelItogoClocks,FormTabelItogoClocks);
      FormTabelItogoClocks.ShowModal;
end;

end.
