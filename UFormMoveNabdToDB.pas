unit UFormMoveNabdToDB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormMoveNabdToDB = class(TForm)
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    cbCmpPassMonth: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    WordFileName:string;
    YearVy:integer;
    MonthVy:integer;
    YearZa:integer;
    MonthZa:integer;
    genId:integer;
    { Private declarations }
    procedure ParseWordTable;
    procedure cmpWithPassMonth;

  public
    { Public declarations }
  end;

var
  FormMoveNabdToDB: TFormMoveNabdToDB;

implementation
   uses comobj,uSQLUnit,dateutils,scrdef, scrUtil,uFormWait;
{$R *.dfm}
procedure TFormMoveNabdToDB.ParseWordTable;
var
  MSWord, Table: OLEVariant;
  iRows, iCols, iGridRows, jGridCols, iNumTables, iTableChosen: Integer;
  CellText: string;
  InputString: string;
  Stmnt:String;
  FIO,Dolg,ProcStr,FDolg:string;
  Proc:integer;
  iErr:integer;
  lineno:integer;
  notneed:integer;
begin
  try
    MSWord := CreateOleObject('Word.Application');
  except
    // Error....
    else
    ShowMessage('Ошибка создания объекта Word');
    Exit;
  end;

  try
    MSWord.Visible := False;
    MSWord.Documents.Open(WordFileName);

    // Get number of tables in document
    iNumTables := MSWord.ActiveDocument.Tables.Count;

 //   InputString := InputBox(IntToStr(iNumTables) +
//      ' Tables in Word Document', 'Please Enter Table Number', '1');
    // Todo: Validate string for integer, range...
//    iTableChosen := StrToInt(InputString);
    iTableChosen := 1;

    // access table
    Table := MSWord.ActiveDocument.Tables.Item(iTableChosen);
    // get dimensions of table
    iRows := Table.Rows.Count;
    iCols := Table.Columns.Count;
    // adjust stringgrid columns
  //  StringGrid1.RowCount := iCols;
  //  StringGrid1.ColCount := iRows + 1;

    // loop through cells
    ProgressBar1.Min:=0;
    ProgressBar1.MAX:=iRows;
    ProgressBar1.Position:=0;
    lineno:=0;
    for iGridRows := 2 to iRows do
      begin
           dolg:='';
           fio:='';
           for jGridCols := 1 to iCols do
             begin
               ProgressBar1.Position:=iGridRows;
               Application.ProcessMessages;
               CellText := Table.Cell( iGridRows,jGridCols).Range.FormattedText;
               if not VarisEmpty(CellText) then
                 begin
          // Remove Tabs
                   CellText := StringReplace(CellText, #$D,'', [rfReplaceAll]);
          // Remove linebreaks
                   CellText := StringReplace(CellText, #$7,'', [rfReplaceAll]);
                   if jGridCols=2 then
                      begin
                          Fio:=trim(CellText);
                          label3.Caption:= IntToStr(LineNo+1)+' '+Fio;
                          Application.ProcessMessages;
                      end
                   else
                   if jGridCols=3 then
                      begin
                           Dolg:=trim(CellText);
                           label4.Caption:= Dolg;
                           Application.ProcessMessages;
                      end
                   else
                   if jGridCols=4 then
                      begin
                           ProcStr:=trim(CellText);
                           val(ProcStr,Proc,iErr);
                           if (ierr>0) then
                              proc:=0;
                           label3.Caption:= IntToStr(LineNo+1)+' '+Fio+' '+ProcStr;
                           Application.ProcessMessages;
                      end;

          // fill Stringgrid
   //       Stringgrid1.Cells[iGridRows, jGridCols] := CellText;
                 end;
             end;
          inc(genId);
          inc(lineno);
          notneed:=0;
          FDolg:=UPPER_STRING(Dolg);
          if Pos('СТАХ',FDOLG)>0 then
             notneed:=1
          else
          if Pos('КРАС',FDOLG)>0 then
             notneed:=1
          else
          if Pos('ЖКХ',FDOLG)>0 then
             notneed:=1
          else
          if Pos('АНТР',FDOLG)>0 then
             notneed:=1;
          Stmnt:='insert into TB_NADB_PLANOVIY (ID,YEARVY,MONTHVY,YEARZA,MONTHZA,NPP,FIO,DOLG,PROC,PROCSTR,NOTNEED) VALUES (';
          stmnt:=stmnt+intToStr(genId)+','+intToStr(yearVy)+','+intToStr(monthVy)+','+intToStr(yearZa)+','+intToStr(monthZa)+',';
          stmnt:=stmnt+intToStr(lineno)+','''+trim(fio)+''','''+trim(dolg)+''','+intToStr(Proc)+','''+ProcStr+''','+intToStr(notneed)+')';
          SQLExecute(stmnt);
      end;
    //..
//  except
//    else
//        begin
//             ShowMessage('Ошибка работы с файлом '+WordFileName);
//        end;
  finally
    MSWord.Quit;
  end;
end;
procedure TFormMoveNabdToDB.BitBtn1Click(Sender: TObject);
begin
     if OpenDialog1.Execute then
        begin
             wordFileName:=OpenDialog1.FileName;
             Label1.Caption:=wordFileName;
             BitBtn2.Enabled:=true;
             Application.ProcessMessages;

        end;

end;

procedure TFormMoveNabdToDB.FormCreate(Sender: TObject);
begin
     Label1.Caption := '';
     Label3.Caption:='';
     Label4.Caption:='';
     WordFileName   := '';
     BitBtn2.Enabled:=false;
     YearZa  := currYear;
     MonthZa := nmes;
     Caption := 'Перенос приказа о надбавках за '+Trim(GetMonthRus(MonthZa))+' '+IntToStr(YearZa)+' г.';
     cbCmpPassMonth.Checked:=True;
end;

procedure TFormMoveNabdToDB.BitBtn2Click(Sender: TObject);
var Stmnt:string;
    v:variant;
    cnt:integer;
    yp,mp:integer;
    Save_Cursor:TCursor;
begin
     yearVy:=currYear;
     monthVy:=Nmes;
//     YearZa:=yearOf(DateTimePicker1.Date);
//     MonthZa:=monthOf(DateTimePicker1.Date);
     if YearZa<2020 then
        begin
             showMessage('Неверно задана дата надбавки');
             exit;
        end;
     if not FileExists(WordFileName) then
        begin
             showMessage('Неверно указано имя файла Word.');
             exit;
        end;
     BitBtn2.Enabled:=false;
     FormWait.Show;
     Save_Cursor   := Screen.Cursor;
     Screen.Cursor := crHourGlass;
     stmnt:='delete from TB_NADB_PLANOVIY where yearza='+intToStr(yearza)+' and monthza='+intToStr(monthza);
     SQLExecute(stmnt);
     stmnt:='select count(*) from TB_NADB_PLANOVIY';
     v:=SQLQueryValue(stmnt);
     cnt:=v;
     if cnt>0 then
        begin
             stmnt:='select max(id) from TB_NADB_PLANOVIY';
             v:=SQLQueryValue(stmnt);
             cnt:=v;
        end;
     genId:=cnt;
     ParseWordTable;
     if cbCmpPassMonth.Checked then
        begin
              yp:=yearza;
              mp:=monthza-1;
              if mp<1 then
                 begin
                      mp:=12;
                      yp:=yp-1;
                 end;
             Stmnt:='select retval from PR_GET_NADB_PLAN_PREV_PERIOD('+IntToStr(yearZa)+','+IntToStr(monthZa)+','+IntToStr(yp)+','+IntToStr(mp)+')';
             v:=SQLQueryValue(Stmnt);
        end;
     FormWait.Hide;
     Screen.Cursor:=Save_Cursor;
     BitBtn2.Enabled:=true;

     ShowMessage('Импорт закончен');
end;

procedure TFormMoveNabdToDB.cmpWithPassMonth;
  begin

  end;

procedure TFormMoveNabdToDB.BitBtn4Click(Sender: TObject);
begin
//     YearZa:=yearOf(DateTimePicker1.Date);
//     MonthZa:=monthOf(DateTimePicker1.Date);
//     FormBrowseNadbPlanoviy:=TFormBrowseNadbPlanoviy.createZa(Self,monthZa,YearZa);
//     FormBrowseNadbPlanoviy.showModal;
end;

 
end.
