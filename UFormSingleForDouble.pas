unit UFormSingleForDouble;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet;

type
  TFormSingleForDouble = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsoREP: TDataSource;
    pFIBdsRep: TpFIBDataSet;
    pFIBTrRepRead: TpFIBTransaction;
    pFIBdsRepTABNO: TFIBIntegerField;
    pFIBdsRepFIO: TFIBStringField;
    pFIBdsRepW_PLACE: TFIBIntegerField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
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
  FormSingleForDouble: TFormSingleForDouble;

implementation
  uses
      uFIBModule,scRdEF,UFormWaitMess,ScrUtil;

{$R *.dfm}

procedure TFormSingleForDouble.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormSingleForDouble.FormCreate(Sender: TObject);
begin
     Label1.Caption:='';
end;

procedure TFormSingleForDouble.BitBtn1Click(Sender: TObject);
begin
     if YesNo('Отчет создается из БД.'+^M+' Если данные перенесены в БД создавайте отчет. Создать отчет из БД?') then
        begin
             CreateReport;
             Close;
        end;
end;
procedure TFormSingleForDouble.CreateReport;
  begin
       if pFIBdsRep.Active then
          pFIBdsRep.Close;
       if pFIBdsRep.Transaction.Active then
          pFIBdsRep.Transaction.Commit;
       pFIBdsRep.Transaction.StartTransaction;
       pFIBdsRep.Params[0].AsInteger:=CurrYear;
       pFIBdsRep.Params[1].AsInteger:=nmes;
       FormWaitMess.Show;
       pFIBdsRep.Open;
       FormWaitMess.Hide;
       frxReport1.ShowReport;
       pFIBdsRep.Close;
       pFIBdsRep.Transaction.Commit;

  end;

procedure TFormSingleForDouble.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if Trim(VarName)='Year' then
        Value:=IntToStr(CurrYear)
     else
     if Trim(VarName)='Month' then
        Value:=GetMonthRus(Nmes);
end;

end.
