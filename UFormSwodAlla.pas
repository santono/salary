unit UFormSwodAlla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DB, FIBDataSet, FIBDatabase,
  pFIBDatabase, pFIBDataSet, frxClass, frxDBSet, ExtCtrls;

type
  TFormSwodAlla = class(TForm)
    dtFR: TDateTimePicker;
    dtTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btCreate: TBitBtn;
    BitBtn1: TBitBtn;
    dsSwod: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsSwodLINENOADD: TFIBIntegerField;
    dsSwodSHIFRSTAADD: TFIBIntegerField;
    dsSwodNAMEADD: TFIBStringField;
    dsSwodSUMMAADD: TFIBBCDField;
    dsSwodLINENOUD: TFIBIntegerField;
    dsSwodSHIFRSTAUD: TFIBIntegerField;
    dsSwodANMEUD: TFIBStringField;
    dsSwodSUMMAUD: TFIBBCDField;
    dsoSwod: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    rgModeGru: TRadioGroup;
    cbShifrGru: TComboBox;
    cbPeriod: TCheckBox;
    dsSwodAPERIOD: TFIBIntegerField;
    dsSwodBPERIOD: TFIBIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCreateClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure rgModeGruClick(Sender: TObject);
    procedure dtFRChange(Sender: TObject);
    procedure dtToChange(Sender: TObject);
  private
    { Private declarations }
      dateFr:TDateTime;
      dateTo:TDateTime;
      dateFrS:string;
      dateToS:String;
      wantedShifrGru:Integer;
  public
    { Public declarations }
  end;

var
  FormSwodAlla: TFormSwodAlla;

implementation
  uses UFibModule,uFormWait,DateUtils,ScrDef,ScrLists,scrutil;

{$R *.dfm}

procedure TFormSwodAlla.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormSwodAlla.btCreateClick(Sender: TObject);
var needPeriod:Integer;
begin
     dateFr:=EncodeDate(yearof(dtFr.Date),monthof(dtFr.Date),1);
     dateTo:=EncodeDate(yearof(dtTo.Date),monthof(dtTo.Date),1);
     if dateTo<dateFr then
        begin
            ShowMessage('Не верно заданы даты');
            Exit;
        end;
     if rgModeGru.itemIndex=1 then
        wantedShifrGru:=cbShifrGru.ItemIndex+1
     else
        wantedShifrGru:=0;
     needPeriod:=0;
     if (
          (MonthOf(dateFr)=MonthOf(dateTo))
          and
          (yearOf(dateFr)=yearOf(dateTo))
        ) then
     if cbPeriod.Checked then
        needPeriod:=1;
     dsSwod.StartTransaction;
     dsSwod.ParamByName('dFra').AsDate:=dateFr;
     dsSwod.ParamByName('dTOa').AsDate:=dateTo;
     dsSwod.ParamByName('shifrgrua').AsInteger:=wantedShifrGru;
     dsSwod.ParamByName('dFru').AsDate:=dateFr;
     dsSwod.ParamByName('dTOu').AsDate:=dateTo;
     dsSwod.ParamByName('shifrgruu').AsInteger:=wantedShifrGru;
     dsSwod.ParamByName('needperiod').AsInteger:=needPeriod;
     FormWait.Show;
     Application.ProcessMessages;
     dsSwod.Open;
     FormWait.Hide;
     Application.ProcessMessages;
     frxReport1.ShowReport;
     dsSwod.Close;
     dsSwod.Transaction.Commit;

end;

procedure TFormSwodAlla.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(Trim(VarName),'period')=0 then
        Value:='c '+dateToStr(datefr)+' по '+dateToStr(dateto)
     else
     if CompareText(Trim(VarName),'nameGru')=0 then
        begin
             if wantedShifrGru<1 then
                Value:='по всiм рахункам'
             else
                Value:=Trim(GET_IST_NAME(wantedShifrGru));
        end
end;

procedure TFormSwodAlla.FormCreate(Sender: TObject);
var i:Integer;
begin
      wantedShifrGru:=0;
      dtFR.date:=encodeDate(CurrYear,1,1);
      dtTo.date:=encodeDate(CurrYear,NMES,1);
      rgModeGru.ItemIndex:=0;
      cbShifrGru.ItemIndex:=-1;
      cbShifrGru.Hide;
      cbShifrGru.Items.Clear;
      for i:=1 to max_IST_FIN do
          cbShifrGru.Items.Add(GET_IST_NAME(i));
      cbShifrGru.ItemIndex:=0;
      cbPeriod.Checked:=False;
      cbPeriod.Hide;
end;

procedure TFormSwodAlla.rgModeGruClick(Sender: TObject);
begin
     if rgModeGru.ItemIndex=1 then
        cbShifrGru.Show
     else
        begin
             cbShifrGru.Hide;
             wantedShifrGru:=0;
        end;
     Application.ProcessMessages;      
end;

procedure TFormSwodAlla.dtFRChange(Sender: TObject);
begin
     if (
          (MonthOf(dtFr.date)=MonthOf(dtTo.date))
          and
          (yearOf(dtFr.date)=yearOf(dtTo.date))
        ) then
        cbPeriod.Show
     else
        cbPeriod.Hide;
     Application.ProcessMessages;
end;

procedure TFormSwodAlla.dtToChange(Sender: TObject);
begin
     if (
          (MonthOf(dtFr.date)=MonthOf(dtTo.date))
          and
          (yearOf(dtFr.date)=yearOf(dtTo.date))
        ) then
        cbPeriod.Show
     else
        cbPeriod.Hide;
     Application.ProcessMessages;
end;

end.
