unit UFormSSNomera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, ExtCtrls, DBCtrls, dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  TFormSSNomera = class(TForm)
    pFIBDataSetSS: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSetSSTABNO: TFIBIntegerField;
    pFIBDataSetSSFIO: TFIBStringField;
    pFIBDataSetSSNAL_CODE: TFIBStringField;
    pFIBDataSetSSSWID_SS_SER: TFIBStringField;
    pFIBDataSetSSSWID_SS_NOM: TFIBStringField;
    DataSourceSS: TDataSource;
    dxDBGridSS: TdxDBGrid;
    dxDBGridSSTABNO: TdxDBGridMaskColumn;
    dxDBGridSSFIO: TdxDBGridMaskColumn;
    dxDBGridSSNAL_CODE: TdxDBGridMaskColumn;
    dxDBGridSSSWID_SS_SER: TdxDBGridMaskColumn;
    dxDBGridSSSWID_SS_NOM: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSSNomera: TFormSSNomera;

implementation
   uses UFIBModule;

{$R *.dfm}

procedure TFormSSNomera.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
     pFIBDataSetSS.Close;
     if pFIBDataSetSS.Transaction.Active then
        pFIBDataSetSS.Transaction.Commit;
end;

procedure TFormSSNomera.FormCreate(Sender: TObject);
begin
     if pFIBDataSetSS.Transaction.Active then
        pFIBDataSetSS.Transaction.Commit;
     pFIBDataSetSS.Transaction.StartTransaction;
     pFIBDataSetSS.Open;
end;

end.
