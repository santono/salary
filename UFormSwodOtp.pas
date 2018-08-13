unit UFormSwodOtp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxExportRTF, frxExportXLS, frxClass,
  frxExportPDF, frxDBSet;

type
  TFormSwodOtp = class(TForm)
    dtFr: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dtTo: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsSwodOtp: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsSwodOtpYEAR_ZA: TFIBSmallIntField;
    dsSwodOtpMONTH_ZA: TFIBSmallIntField;
    dsSwodOtpSUMTOT: TFIBBCDField;
    dsSwodOtpSUMPERENES: TFIBBCDField;
    dsSwodOtpSUMNEPERENES: TFIBBCDField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    dsByPerson: TpFIBDataSet;
    dsByPersonYEAR_ZA: TFIBSmallIntField;
    dsByPersonMONTH_ZA: TFIBSmallIntField;
    dsByPersonSUMMA_O_BUD: TFIBBCDField;
    dsByPersonTABNO: TFIBSmallIntField;
    dsByPersonFIO: TFIBStringField;
    dsByPersonW_PLACE: TFIBSmallIntField;
    dsByPersonNAME_POD: TFIBStringField;
    frxDBDataset2: TfrxDBDataset;
    frxReport2: TfrxReport;
    BitBtn3: TBitBtn;
    dsSwodOtpSHIFRUNI: TFIBIntegerField;
    dsSwodOtpNAMEUNI: TFIBStringField;
    cbProcMode: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure frxReport2GetValue(const VarName: String;
      var Value: Variant);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtn3Click(Sender: TObject);
  private
    dateFrS,dateToS : String;

    { Private declarations }
    procedure calculateData;
    procedure calculateDataByPerson;

  public
    { Public declarations }
  end;

var
  FormSwodOtp: TFormSwodOtp;

implementation
   uses uFIBModule,DateUtils, uFormWait,SCrUtil;

{$R *.dfm}

procedure TFormSwodOtp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if dsSwodOtp.Active then
        dsSwodOtp.Close;
     if dsByPerson.Active then
        dsByPerson.Close;
     if dsSwodOtp.Transaction.Active then
        dsSwodOtp.Transaction.Commit;

     Action := caFree;
end;

procedure TFormSwodOtp.FormCreate(Sender: TObject);
begin
     dtFr.Date := IncMonth(Date,-2) ;
     dtTo.Date := Date;
     cbProcMode.Checked:=True;
     
end;

procedure TFormSwodOtp.calculateData;
  var dateFr,dateTo   : TDate;
      progMode        : Integer;
begin
     progMode:=0;
     if cbProcMode.Checked then
        progMode:=1;
     dateFr:=dtFr.Date;
     dateFr:=EncodeDate(yearOf(dateFr),monthOf(dateFr),1);
     dateFrS:=IntToStr(YearOf(DateFr))+'-'+IntToStr(MonthOf(DateFr))+'-'+IntToStr(DayOf(DateFr));
     dateTo:=dtTo.Date;
     dateTo:=EncodeDate(yearOf(dateTo),monthOf(dateTo),1);
     if dsSwodOtp.Active then
        dsSwodOtp.Close;
     if dsSwodOtp.Transaction.Active then
        dsSwodOtp.Transaction.Commit;
     if dsSwodOtp.Transaction.Active then
        dsSwodOtp.Transaction.StartTransaction;
     dateToS:=IntToStr(YearOf(DateTo))+'-'+IntToStr(MonthOf(DateTo))+'-'+IntToStr(DayOf(DateTo));
     dsSwodOtp.Params[0].AsDate:=dateFr;
     dsSwodOtp.Params[1].AsDate:=dateTo;
   //  dsSwodOtp.Params[0].AsString:=dateFrS;
   //  dsSwodOtp.Params[1].AsString:=dateToS;
     dsSwodOtp.Params[2].AsInteger:=progMode;
     formWait.Show;
     dsSwodOtp.Open;
     formWait.Hide;
     frxReport1.ShowReport();
end;
procedure TFormSwodOtp.BitBtn1Click(Sender: TObject);
begin
      calculateData;
end;
procedure TFormSwodOtp.calculateDataByPerson;
  var dateFr,dateTo   : TDate;

begin
     dateFr:=dtFr.Date;
     dateFr:=EncodeDate(yearOf(dateFr),monthOf(dateFr),1);
     dateFrS:=IntToStr(DayOf(DateFr))+'-'+IntToStr(MonthOf(DateFr))+'-'+IntToStr(YearOf(DateFr));
     dateTo:=dtTo.Date;
     dateTo:=EncodeDate(yearOf(dateTo),monthOf(dateTo),1);
     if dsByPerson.Active then
        dsByPerson.Close;
     if dsByPerson.Transaction.Active then
        dsByPerson.Transaction.Commit;
     if dsByPerson.Transaction.Active then
        dsByPerson.Transaction.StartTransaction;
     dateToS:=IntToStr(DayOf(DateTo))+'-'+IntToStr(MonthOf(DateTo))+'-'+IntToStr(YearOf(DateTo));
     dsByPerson.Params[0].AsDate:=dateFr;
     dsByPerson.Params[1].AsDate:=dateTo;
     dsByPerson.Open;
     frxReport2.ShowReport();
end;


procedure TFormSwodOtp.frxReport2GetValue(const VarName: String;
  var Value: Variant);
begin
     if UPPER_STRING(Trim(varName))='DATEFRS' then
        Value:=dateFrS
     else
     if UPPER_STRING(Trim(varName))='DATETOS' then
        Value:=dateToS
end;

procedure TFormSwodOtp.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if UPPER_STRING(Trim(varName))='DATEFRS' then
        Value:=dateFrS
     else
     if UPPER_STRING(Trim(varName))='DATETOS' then
        Value:=dateToS

end;

procedure TFormSwodOtp.BitBtn3Click(Sender: TObject);
begin
     calculateDataByPerson;
end;

end.
