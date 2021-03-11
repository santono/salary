unit UFormCMP1DFECBDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TFormCMP1DFECBDetail = class(TForm)
    ds1DFECBPerson: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dso1DFECBPerson: TDataSource;
    ds1DFECBPersonTABNO: TFIBIntegerField;
    ds1DFECBPersonFIO: TFIBStringField;
    ds1DFECBPersonSUMMAADD1DF: TFIBBCDField;
    ds1DFECBPersonSUMMAADDT6: TFIBBCDField;
    ds1DFECBPersonsummarazn: TFloatField;
    DBGrid1DFECBPerson: TDBGrid;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ds1DFECBPersonCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    y,m:Integer;
  public
    { Public declarations }
    constructor myCreate(AOwner:TComponent;Y:Integer;m:integer);
  end;

var
  FormCMP1DFECBDetail: TFormCMP1DFECBDetail;

implementation
 USes ScrUtil;
{$R *.dfm}

constructor TFormCMP1DFECBDetail.myCreate(AOwner:TComponent;Y:Integer;m:integer);
 begin
      Self.Create(AOwner);
      Self.y:=y;
      Self.m:=m;
      if ds1DFECBPerson.Active then
         ds1DFECBPerson.Close;
      if ds1DFECBPerson.Transaction.Active then
         ds1DFECBPerson.Transaction.Commit;
      ds1DFECBPerson.Params[0].AsShort:=y;
      ds1DFECBPerson.Params[1].AsShort:=m;
      ds1DFECBPerson.Transaction.StartTransaction;
      ds1DFECBPerson.Open;
 end;

procedure TFormCMP1DFECBDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ds1DFECBPerson.Close;
     ds1DFECBPerson.Transaction.Commit;
     action:=caFree;
end;

procedure TFormCMP1DFECBDetail.FormCreate(Sender: TObject);
begin
     caption:=trim(caption)+' за '+GetMonthUkr(m)+' '+intToStr(y);
end;

procedure TFormCMP1DFECBDetail.ds1DFECBPersonCalcFields(DataSet: TDataSet);
begin
     ds1DFECBPersonsummarazn.value:=ds1DFECBPersonSUMMAADD1DF.Value-ds1DFECBPersonSUMMAADDT6.value;
end;

end.
