unit UFormCMP1DFECB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, FIBQuery, pFIBQuery, FIBDatabase,
  pFIBDatabase, Grids, DBGrids, StdCtrls, Buttons;

type
  TFormCMP1DFECB = class(TForm)
    ds1dfECB: TpFIBDataSet;
    ds1dfECBMNTH: TFIBIntegerField;
    ds1dfECBSUMMAADD1DF: TFIBBCDField;
    ds1dfECBSUMMAADDT6: TFIBBCDField;
    ds1dfECBmnthname: TStringField;
    trRead: TpFIBTransaction;
    DBGrid1DFECB: TDBGrid;
    dso1DFECB: TDataSource;
    ds1dfECBSUMMARAZN: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ds1dfECBCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DFECBEditButtonClick(Sender: TObject);
  private
    { Private declarations }
    y:Integer;
    m:Integer;
  public
    constructor myCreate(AOwner:TComponent;y:Integer;m:integer);
    { Public declarations }
  end;

var
  FormCMP1DFECB: TFormCMP1DFECB;

implementation
 uses scrutil,UFormcmp,UFormCMP1DFECBDetail;
{$R *.dfm}

constructor TFormCMP1DFECB.myCreate(AOwner:TComponent;y:Integer;m:integer);
 begin
      Self.Create(AOwner);
      Self.y:=y;
      Self.m:=m;
 end;

procedure TFormCMP1DFECB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if ds1dfECB.Active then
        ds1dfECB.Close;
     if ds1dfECB.Transaction.Active then
        ds1dfECB.Transaction.Commit;
     Action:=caFree;
end;

procedure TFormCMP1DFECB.ds1dfECBCalcFields(DataSet: TDataSet);
begin
     if (ds1dfECBMNTH.value>0) and (ds1dfECBMNTH.value<13) then
        ds1dfECBmnthname.value:=getMonthUkr(ds1dfECBMNTH.value)
     else
        ds1dfECBmnthname.value:='не вказано';
     ds1dfECBSUMMARAZN.value:=ds1dfECBSUMMAADD1DF.value - ds1dfECBSUMMAADDT6.value;
end;

procedure TFormCMP1DFECB.FormCreate(Sender: TObject);
begin
     if ds1dfECB.Active then
        ds1dfECB.Close;
     if ds1dfECB.Transaction.Active then
        ds1dfECB.Transaction.Commit;
     ds1dfECB.Params[0].Value:=y;
     ds1dfECB.Params[1].Value:=m;
     ds1dfECB.Transaction.StartTransaction;
     ds1dfECB.Open;
end;

procedure TFormCMP1DFECB.DBGrid1DFECBEditButtonClick(Sender: TObject);
 var y,m:Integer;
begin
     y:=Self.y;
     m:=ds1dfECBMNTH.Value;
     if (m<1) or (m>12) then Exit;
     FormCMP1DFECBDetail:=TFormCMP1DFECBDetail.myCreate(Self,y,m);
     FormCMP1DFECBDetail.showmodal;
end;

end.
