unit UFormRepInvalidNalogi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls;

type
  TFormRepInvalidNalogi = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsoREP: TDataSource;
    pFIBdsRep: TpFIBDataSet;
    pFIBTrRepRead: TpFIBTransaction;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    pFIBdsRepTABNO: TFIBIntegerField;
    pFIBdsRepFIO: TFIBStringField;
    pFIBdsRepSHIFRPOD: TFIBIntegerField;
    pFIBdsRepNAMEPOD: TFIBStringField;
    pFIBdsRepSUMMA: TFIBBCDField;
    dtIn: TDateTimePicker;
    Label2: TLabel;
    rgMode: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
    procedure CreateReport;
  public
    { Public declarations }
  end;

var
  FormRepInvalidNalogi: TFormRepInvalidNalogi;

implementation
  uses
      uFIBModule,scRdEF,UFormWaitMess,ScrUtil,DateUtils;

{$R *.dfm}

procedure TFormRepInvalidNalogi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepInvalidNalogi.FormCreate(Sender: TObject);
begin
    
     rgMode.ItemIndex := 1;
     dtIn.Date        := IncMonth(Date,-1);
end;

procedure TFormRepInvalidNalogi.BitBtn1Click(Sender: TObject);
begin
     if YesNo('Отчет создается из БД.'+^M+' Если данные перенесены в БД создавайте отчет. Создать отчет из БД?') then
        begin
             CreateReport;
             Close;
        end;
end;
procedure TFormRepInvalidNalogi.CreateReport;
  begin
       if pFIBdsRep.Active then
          pFIBdsRep.Close;
       if pFIBdsRep.Transaction.Active then
          pFIBdsRep.Transaction.Commit;
       pFIBdsRep.Transaction.StartTransaction;
       pFIBdsRep.Params[0].AsInteger := YearOf(dtIn.Date);
       pFIBdsRep.Params[1].AsInteger := monthOf(dtIn.Date);
       pFIBdsRep.Params[2].AsInteger := rgMode.ItemIndex + 1;
       FormWaitMess.Show;
       pFIBdsRep.Open;
       FormWaitMess.Hide;
       frxReport1.ShowReport;
       pFIBdsRep.Close;
       pFIBdsRep.Transaction.Commit;

  end;

procedure TFormRepInvalidNalogi.frxReport1GetValue(const VarName: String;
  var Value: Variant);

begin                                
     if Trim(VarName)='Year' then
        Value:=IntToStr(YearOf(dtIn.Date))
     else
     if Trim(VarName)='Month' then
        Value:=GetMonthRus(MonthOf(dtIn.Date))
     else
     if Trim(VarName)='Mode' then
        if rgMode.ItemIndex=1 then
           Value:='инвалиды'
        else
           Value:='пенсионеры';
end;

end.
