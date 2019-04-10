unit UFormRepNeSovrRazrOklad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, frxClass, frxDBSet, DB, DBClient, Buttons,
  ComCtrls, frxExportRTF, frxExportXLS, frxExportPDF;

type
  TFormRepNeSovrRazrOklad = class(TForm)
    cdsClocks: TClientDataSet;
    dsoClocks: TDataSource;
    frxReportClocks: TfrxReport;
    frxDBDatasetClocks: TfrxDBDataset;
    cdsClocksclockPPSInner: TFloatField;
    cdsClocksclockOtherInner: TFloatField;
    cdsClocksshifrPod: TIntegerField;
    cdsClocksclockPPSOuter: TFloatField;
    cdsClocksclockOtherOuter: TFloatField;
    cdsClocksnamePod: TStringField;
    BitBtnStart: TBitBtn;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    LabelServ: TLabel;
    cdsClocksclockInner: TFloatField;
    cdsClocksclockOuter: TFloatField;
    cdsClocksclockPPS: TFloatField;
    cdsClocksclockOther: TFloatField;
    cdsClocksclockSum: TFloatField;
    dtDate: TDateTimePicker;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure frxReportClocksGetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtnStartClick(Sender: TObject);
    procedure cdsClocksCalcFields(DataSet: TDataSet);
  private
    wantedYear,wantedMonth:integer;
    { Private declarations }
    procedure createSwod;

  public
    { Public declarations }
  end;

var
  FormRepNeSovrRazrOklad: TFormRepNeSovrRazrOklad;

implementation

{$R *.dfm}
uses scrutil,scrdef,scrio,USqlUnit,dateUtils;
type PRec=^TRec;
     TRec=record
           tabno  : integer;
           fio    : straing;
           razr   : integer;
           dolg   : straing;
           koef   : real;
           okladFakt : real;
           okladRas : real;
           shifrPod : integer;
          end;
var list:TList;
procedure TFormRepNeSovrRazrOklad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormRepNeSovrRazrOklad.FormCreate(Sender: TObject);
 var minDate,maxDate:TDate;
begin
     rgPeriodMode.ItemIndex:=0;
     LabelServ.Caption:='';
     minDate:=encodedate(2015,1,1);
     maxDate:=encodedate(currYear,nmes,1);
     dtDate.MinDate:=minDate;
     dtDate.MaxDate:=maxDate;
     dtDate.Date:=maxDate;
end;

procedure TFormRepNeSovrRazrOklad.frxReportClocksGetValue(const VarName: String;
  var Value: Variant);
begin
     if compareText('namePeriod',varName)=0 then
        begin
             if rgPeriodMode.ItemIndex=0 then
                Value:=getMonthUkr(wantedMonth)+' '+intToStr(wantedYear)+' р.'
             else
             if rgPeriodMode.ItemIndex=1 then
                case wantedMonth of
                 1,2,3 : value:=' перший квартал '+intToStr(wantedYear)+' р.';
                 4,5,6 : value:=' другий квартал '+intToStr(wantedYear)+' р.';
                 7,8,9 : value:=' третій квартал '+intToStr(wantedYear)+' р.';
              10,11,12 : value:=' четвертий квартал '+intToStr(wantedYear)+' р.';
                end
             else
             if rgPeriodMode.ItemIndex=2 then
                value:=intToStr(wantedYear)+' р.';

        end;
end;

procedure TFormRepNeSovrRazrOklad.BitBtnStartClick(Sender: TObject);
begin
     if ((rgPeriodMode.ItemIndex<0) or (rgPeriodMode.ItemIndex>2)) then
        begin
             showMessage('Неверно указан режим расчета');
             exit;
        end;
     createSwod;
end;

procedure TFormRepNeSovrRazrOklad.createSwod;
  var rec     : pRec;
      tmpNSRV : integer;
      i_nsrv,i: integer;
      curr_person : person_ptr;
      kwartal:integer;
      v,f:variant;
      clockPPSInner,
      clockPPSOuter,
      clockOtherInner,
      clockOtherOuter: real;
      SQLStmnt:string;
begin
     kwartal:=0;
     if rgPeriodMode.ItemIndex=1 then
        begin
             if wantedMonth<4 then kwartal:=1
             else
             if ((wantedMonth>3) and (wantedMonth<7)) then kwartal:=2
             else
             if ((wantedMonth>6) and (wantedMonth<10)) then kwartal:=3
             else  kwartal:=4;
        end;
     tmpNSRV:=NSRV;
     NSRV:=tmpNSRV;
     EMPTY_ALL_PERSON;
     wantedYear  := yearOf(dtDate.date);
     wantedMonth := monthOf(dtDate.date);
     ProgressBar1.Max:=count_serv;
     progressbar1.min:=0;
     progressBar1.step:=1;
     list:=TList.Create;
     for i_nsrv:=1 to count_serv do
         begin
              progressBar1.StepIt;
              labelserv.Caption:=name_serv(i_nsrv);
              Application.ProcessMessages;
              if DOG_POD_PODRAZD(i_nsrv) then continue;
              if i_nsrv=82 then continue;
              nsrv:=i_nsrv;
              mkflnm;
              if not fileexists(fninf) then continue;
              getinf(false);
              if count_person<1 then continue;
              new(Rec);
              fillChar(rec^,sizeOf(rec^),0);
              rec^.shifrPod:=nsrv;
              if ((wantedMonth=nmes) and (wantedYear=currYear)) then
                 begin
                      curr_person:=head_person;
                      while (curr_person<>nil) do
                        begin
                             if curr_person^.oklad<1 then
                                begin
                                     curr_person:=curr_person^.NEXT;
                                     continue;
                                end;
                             if curr_person^.MESTO_OSN_RABOTY=82 then
                                if curr_person^.KATEGORIJA=1 then
                                   rec^.clockPPSOuter:=rec^.clockPPSOuter+work_clock_lera(1,31,curr_person)
                                else
                                   rec^.clockOtherOuter:=rec^.clockOtherOuter+work_clock_lera(1,31,curr_person)
                             else
                               if curr_person^.KATEGORIJA=1 then
                                  rec^.clockPPSInner:=rec^.clockPPSInner+work_clock_lera(1,31,curr_person)
                               else
                                  rec^.clockOtherInner:=rec^.clockOtherInner+work_clock_lera(1,31,curr_person);

                             curr_person:=curr_person^.NEXT;
                        end;
                end;
              EMPTY_ALL_PERSON;
              if (not ((wantedMonth=FLOW_MONTH) and (WORK_YEAR_VAL=wantedYear)))
                  or
                  (rgPeriodMode.ItemIndex>0) then
               begin

                   clockPPSInner   := 0;
                   clockPPSOuter   := 0;
                   clockOtherInner := 0;
                   clockOtherOuter := 0;
                   SQLStmnt:='select first 1 clocksppsinner,clocksotherinner,clocksppsouter,clocksotherouter';
                   SQLStmnt:=trim(SQlStmnt)+' from PR_GET_REP_CLOCKS(';
                   SQLStmnt:=trim(SQlStmnt)+intToStr(wantedYear)+',';
                   SQLStmnt:=trim(SQlStmnt)+intToStr(wantedMonth)+',';
                   SQLStmnt:=trim(SQlStmnt)+intToStr(rgPeriodMode.ItemIndex+1)+',';
                   SQLStmnt:=trim(SQlStmnt)+intToStr(kwartal)+',';
                   SQLStmnt:=trim(SQlStmnt)+intToStr(nsrv)+',';
                   SQLStmnt:=trim(SQlStmnt)+intToStr(CurrYear)+',';
                   SQLStmnt:=trim(SQlStmnt)+intToStr(NMES);
                   SQLStmnt:=trim(SQlStmnt)+')';
                   v:=SQLQueryRecValues(SQLStmnt);
                   f:=v[0];
                   if VarIsNumeric(f) then
                      clockPPSInner:=f;
                   f:=v[1];
                   if VarIsNumeric(f) then
                      clockOtherInner:=f;
                   f:=v[2];
                   if VarIsNumeric(f) then
                      clockPPSOuter:=f;
                   f:=v[3];
                   if VarIsNumeric(f) then
                      clockOtherOuter:=f;
                   if clockPPSInner>0.1 then
                      rec^.clockPPSInner:=rec^.clockPPSInner+clockPPSInner;
                   if clockOtherInner>0.1 then
                      rec^.clockOtherInner:=rec^.clockOtherInner+clockOtherInner;
                   if clockPPSOuter>0.1 then
                      rec^.clockPPSOuter:=rec^.clockPPSOuter+clockPPSOuter;
                   if clockOtherOuter>0.1 then
                      rec^.clockOtherOuter:=rec^.clockOtherOuter+clockOtherOuter;
               end;
              list.Add(Rec);

         end;
     if list.count>0 then
        begin
             cdsClocks.Open;
             cdsClocks.EmptyDataSet;
             for i:=0 to list.count-1 do
                 begin
                      cdsClocks.Append;
                      rec:=pRec(list.Items[i]);
                      cdsClocksclockPPSInner.Value   := rec^.clockPPSInner;
                      cdsClocksclockOtherInner.Value := rec^.clockOtherInner;
                      cdsClocksclockPPSOuter.Value   := rec^.clockPPSOuter;
                      cdsClocksclockOtherOuter.Value := rec^.clockOtherOuter;
                      cdsClocksshifrPod.Value := rec^.shifrPod;
                      cdsClocksnamePod.Value := name_serv(rec^.shifrPod);
                      cdsClocks.Insert;
                 end;
                 frxReportClocks.ShowReport;
                 cdsClocks.Close;
        end;

     if list.count>0 then
        for i:=0 to list.count-1 do
            begin
//                 rec:=;
                 dispose(list.Items[i]);
            end;
     list.Free;
     nsrv:=tmpNSRV;
     mkflnm;
     getinf(true)

end;

procedure TFormRepNeSovrRazrOklad.cdsClocksCalcFields(DataSet: TDataSet);
begin
      cdsClocksclockInner.Value:=cdsClocksclockPPSInner.Value   + cdsClocksclockOtherInner.Value;
      cdsClocksclockOuter.Value:=cdsClocksclockPPSOuter.Value   + cdsClocksclockOtherOuter.Value;
      cdsClocksclockPPS.Value  :=cdsClocksclockPPSInner.Value   + cdsClocksclockPPSOuter.Value;
      cdsClocksclockOther.Value:=cdsClocksclockOtherInner.Value + cdsClocksclockOtherOuter.Value;
      cdsClocksclockSum.Value  :=cdsClocksclockPPS.Value + cdsClocksclockOther.Value;
end;

end.
