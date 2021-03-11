unit UFormCmpSwodECBDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TFormCmpSwodECBDetail = class(TForm)
    dsSwodECBPerson: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dso1DFECBPerson: TDataSource;
    dsSwodECBPersonTABNO: TFIBIntegerField;
    dsSwodECBPersonFIO: TFIBStringField;
    dsSwodECBPersonSUMMAADDT6: TFIBBCDField;
    dsSwodECBPersonsummarazn: TFloatField;
    DBGrid1DFECBPerson: TDBGrid;
    DBNavigator1: TDBNavigator;
    dsSwodECBPersonSUMMAADDSWOD: TFIBBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dsSwodECBPersonCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    y,m:Integer;
  public
    { Public declarations }
    constructor myCreate(AOwner:TComponent;Y:Integer;m:integer);
  end;

var
  FormCmpSwodECBDetail: TFormCmpSwodECBDetail;

implementation
 USes ScrUtil;
{$R *.dfm}

constructor TFormCmpSwodECBDetail.myCreate(AOwner:TComponent;Y:Integer;m:integer);
 begin
      Self.Create(AOwner);
      Self.y:=y;
      Self.m:=m;
      if dsSwodECBPerson.Active then
         dsSwodECBPerson.Close;
      if dsSwodECBPerson.Transaction.Active then
         dsSwodECBPerson.Transaction.Commit;
      dsSwodECBPerson.Params[0].AsShort:=y;
      dsSwodECBPerson.Params[1].AsShort:=m;
      dsSwodECBPerson.Transaction.StartTransaction;
      dsSwodECBPerson.Open;
 end;

procedure TFormCmpSwodECBDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsSwodECBPerson.Close;
     dsSwodECBPerson.Transaction.Commit;
     action:=caFree;
end;

procedure TFormCmpSwodECBDetail.FormCreate(Sender: TObject);
begin
     caption:=trim(caption)+' за '+GetMonthUkr(m)+' '+intToStr(y);
end;

procedure TFormCmpSwodECBDetail.dsSwodECBPersonCalcFields(DataSet: TDataSet);
begin
     dsSwodECBPersonsummarazn.value:=dsSwodECBPersonSUMMAADDSwod.Value-dsSwodECBPersonSUMMAADDT6.value;
end;

end.
