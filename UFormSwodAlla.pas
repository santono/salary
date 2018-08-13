unit UFormSwodAlla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DB, FIBDataSet, FIBDatabase,
  pFIBDatabase, pFIBDataSet, frxClass, frxDBSet;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCreateClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
      dateFr:TDateTime;
      dateTo:TDateTime;
      dateFrS:string;
      dateToS:String;
  public
    { Public declarations }
  end;

var
  FormSwodAlla: TFormSwodAlla;

implementation
  uses UFibModule,uFormWait,DateUtils;

{$R *.dfm}

procedure TFormSwodAlla.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormSwodAlla.btCreateClick(Sender: TObject);
begin
     dateFr:=EncodeDate(yearof(dtFr.Date),monthof(dtFr.Date),1);
     dateTo:=EncodeDate(yearof(dtTo.Date),monthof(dtTo.Date),1);
     if dateTo<dateFr then
        begin
            ShowMessage('Не верно заданы даты');
            Exit;
        end;
     dsSwod.StartTransaction;
     dsSwod.ParamByName('dFra').AsDate:=dateFr;
     dsSwod.ParamByName('dTOa').AsDate:=dateTo;
     dsSwod.ParamByName('dFru').AsDate:=dateFr;
     dsSwod.ParamByName('dTOu').AsDate:=dateTo;
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
        Value:='c '+dateToStr(datefr)+' по '+dateToStr(dateto);
end;

end.
