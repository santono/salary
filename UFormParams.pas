unit UFormParams;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, ExtCtrls, DBCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms;

type
  TFormParams = class(TForm)
    dsParams: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    trRead: TpFIBTransaction;
    dsoParams: TDataSource;
    dsParamsSHIFRID: TFIBIntegerField;
    dsParamsNAME: TFIBStringField;
    dsParamsCOMMENT: TFIBStringField;
    dsParamsDATEFR: TFIBDateField;
    dsParamsCODEMES: TFIBSmallIntField;
    dxDBGridParam: TdxDBGrid;
    DBNavigator1: TDBNavigator;
    dxDBGridParamSHIFRID: TdxDBGridMaskColumn;
    dxDBGridParamNAME: TdxDBGridMaskColumn;
    dxDBGridParamCOMMENT: TdxDBGridMaskColumn;
    dxDBGridParamDATEFR: TdxDBGridDateColumn;
    dxDBGridParamCODEMES: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormParams: TFormParams;

implementation
  uses UFibModule;

{$R *.dfm}



procedure TFormParams.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dsParams.Close;
     if dsParams.Transaction.Active then
        dsParams.Transaction.Commit;
     if dsParams.UpdateTransaction.Active then
        dsParams.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormParams.FormCreate(Sender: TObject);
begin
     if not dsParams.Transaction.Active then
        dsParams.Transaction.StartTransaction;
     if dsParams.UpdateTransaction.Active then
        dsParams.UpdateTransaction.Commit;
     dsParams.Open;

end;

end.
