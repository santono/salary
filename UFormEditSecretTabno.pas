unit UFormEditSecretTabno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, ExtCtrls, DBCtrls,
  dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  TFormEditSecretTabno = class(TForm)
    DataSourceST: TDataSource;
    pFIBDataSetST: TpFIBDataSet;
    pFIBDataSetKadry: TpFIBDataSet;
    pFIBDataSetKadryTABNO: TFIBIntegerField;
    pFIBDataSetKadryFIO: TFIBStringField;
    pFIBDataSetSTTABNO: TFIBIntegerField;
    pFIBDataSetSTFIO: TStringField;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1TABNO: TdxDBGridMaskColumn;
    dxDBGrid1FIO: TdxDBGridLookupColumn;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditSecretTabno: TFormEditSecretTabno;

implementation
  uses UFibModule;

{$R *.dfm}

procedure TFormEditSecretTabno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      pFIBDataSetST.Close;
      pFIBDataSetKadry.Close;
      pFIBDataSetST.Transaction.Commit;

      Action:=caFree;
end;

procedure TFormEditSecretTabno.FormCreate(Sender: TObject);
begin
      if pFIBDataSetST.Active then
         pFIBDataSetST.Close;
      if pFIBDataSetKadry.Active then
         pFIBDataSetKadry.Close;
      if not pFIBDataSetST.Transaction.Active then
         pFIBDataSetST.Transaction.StartTransaction;
      pFIBDataSetST.Open;
      pFIBDataSetKadry.Open;
end;

end.
