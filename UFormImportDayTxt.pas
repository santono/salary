unit UFormImportDayTxt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormImportDayTxt = class(TForm)
    DateTimePicker1 : TDateTimePicker;
    Label1  : TLabel;
    BitBtn1 : TBitBtn;
    BitBtn2 : TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    dataZA:TDate;

  public
    { Public declarations }
  end;

var
  FormImportDayTxt: TFormImportDayTxt;

implementation
  uses USQLUnit,ScrDef,DateUtils;

{$R *.dfm}

procedure TFormImportDayTxt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormImportDayTxt.FormCreate(Sender: TObject);
begin
     DataZa               := Date;
     DateTimePicker1.Date := dataZa;
end;

procedure TFormImportDayTxt.BitBtn1Click(Sender: TObject);
var SQLStmnt : string;
    d,d1,d2,d3,d4,clock  : Integer;
    dev      : TextFile;
    fname    : string;
    i,k      : Integer;
    d5,d6    : integer;
begin
     fname:=cdir+'day.txt';
     AssignFile(dev,fname);
     Reset(dev);
     dataZA:=DateTimePicker1.Date;
     for i:=1 to monthof(dataza) do
         begin
              Readln(dev,d1,d2,d3,d4,clock);
              d5:=d1;
              d6:=d2;
         end;
     CloseFile(dev);
     SQLStmnt:='delete from TB_MONTHS_HEA where extract(month from datefr)='+intToStr(monthOf(dataZa))+' and extract(year from datefr)='+intToStr(yearOf(dataZa));
     SQLExecute(SQLStmnt);
     SQLStmnt:='delete from TB_MONTHS_PR where extract(month from datefr)='+intToStr(monthOf(dataZa))+' and extract(year from datefr)='+intToStr(yearOf(dataZa));
     SQLExecute(SQLStmnt);
     SQLStmnt:='insert into TB_MONTHS_HEA (datefr,WORK_DAY_5, WORK_DAY_6, WORK_CLOCK_5, WORK_CLOCK_6) values ('''+intToStr(yearOf(dataZa))+'-'+intToStr(monthOf(dataZa))+'-01'','+
               intToStr(d5)+','+intToStr(d6)+','+intToStr(clock)+','+intToStr(clock)+')';
     SQLExecute(SQLStmnt);
     for i:=1 to 31 do
         begin
              k:=month_day[2,monthOf(dataza),i];
              SQLStmnt:='insert into TB_MONTHS_pr (datefr,nb_day,code) values ('''+intToStr(yearOf(dataZa))+'-'+intToStr(monthOf(dataZa))+'-01'','+
                    intToStr(i)+','+inttostr(k)+')';
              SQLExecute(SQLStmnt);
         end;
     SQLStmnt:='delete from TB_DAYS where yearza='+intToStr(yearOf(dataZa))+' and monthza='+intToStr(monthOf(dataZa));
     SQLExecute(SQLStmnt);
     if isLNR then
     SQLStmnt:='insert into TB_DAYS (YEARZA,MONTHZA,WDAYS,CLOCKS,WDAYSCOLEDG,WCLOCKSCOLEDG,WDAYS_6) values ('
               + intToStr(yearOf(dataZa))  + ','
               + intToStr(monthOf(dataZa)) + ','
               + intToStr(d5)    + ','
               + intToStr(clock) + ','
               + intToStr(d5)    + ','
               + intToStr(clock) + ','
               + intToStr(d6) + ')'
     else
     SQLStmnt:='insert into TB_DAYS (YEARZA,MONTHZA,WDAYS,CLOCKS,WDAYSCOLEDG,WCLOCKSCOLEDG) values ('
               + intToStr(yearOf(dataZa))  + ','
               + intToStr(monthOf(dataZa)) + ','
               + intToStr(d5)    + ','
               + intToStr(clock) + ','
               + intToStr(d5)    + ','
               + intToStr(clock) + ')';
     SQLExecute(SQLStmnt);
     if not needHideGenerMessages then
        ShowMessage('Данные перенесены. Перезагрузите программу.');
end;

end.
