unit UFormEditSelPodrList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFormEditSelPodrList = class(TForm)
    pFIBDataSetSelWidPodr: TpFIBDataSet;
    pFIBTransactionSelWidPodr: TpFIBTransaction;
    DataSourceSelWidPodr: TDataSource;
    dxDBGridSelWidPodr: TdxDBGrid;
    pFIBDataSetSelWidPodrSHIFRID: TFIBIntegerField;
    pFIBDataSetSelWidPodrNAME: TFIBStringField;
    dxDBGridSelWidPodrSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSelWidPodrNAME: TdxDBGridMaskColumn;
    pFIBDataSetSelPodrName: TpFIBDataSet;
    pFIBTransactionSelPodrName: TpFIBTransaction;
    DataSourceSelPodrName: TDataSource;
    pFIBDataSetSelPodrNameSHIFRID: TFIBIntegerField;
    pFIBDataSetSelPodrNameNAME: TFIBStringField;
    dxDBGridSelNameHat: TdxDBGrid;
    dxDBGridSelNameHatSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSelNameHatNAME: TdxDBGridMaskColumn;
    dxDBGridSelPodr: TdxDBGrid;
    pFIBDataSetSelPodr: TpFIBDataSet;
    pFIBTransactionSelPodr: TpFIBTransaction;
    DataSource1: TDataSource;
    pFIBDataSetSelPodrSHIFRID: TFIBIntegerField;
    pFIBDataSetSelPodrSHIFRPOD: TFIBIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditSelPodrList: TFormEditSelPodrList;

implementation
  uses UFibModule;

{$R *.dfm}

procedure TFormEditSelPodrList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

end.
