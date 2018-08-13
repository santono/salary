unit UFormGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  ExtCtrls, DBCtrls;

type
  TFormGrid = class(TForm)
    pFIBDataSetGrid: TpFIBDataSet;
    pFIBDataSetGridSHIFRID: TFIBIntegerField;
    pFIBDataSetGridDATAFR: TFIBDateField;
    pFIBDataSetGridSUMMAFR: TFIBBCDField;
    pFIBDataSetGridSUMMATO: TFIBBCDField;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBTransactionRead: TpFIBTransaction;
    DataSourceGrid: TDataSource;
    dxDBGridGrid: TdxDBGrid;
    dxDBGridGridSHIFRID: TdxDBGridMaskColumn;
    dxDBGridGridDATAFR: TdxDBGridDateColumn;
    DBNavigatorGrid: TDBNavigator;
    dxDBGridGridSUMMATO: TdxDBGridCalcColumn;
    dxDBGridGridSUMMAFR: TdxDBGridCalcColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGrid: TFormGrid;

implementation

{$R *.dfm}

procedure TFormGrid.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetGrid.Active then
        pFIBDataSetGrid.Close;
     if pFIBDataSetGrid.Transaction.Active then
        pFIBDataSetGrid.Transaction.Commit;
     if pFIBDataSetGrid.UpdateTransaction.Active then
        pFIBDataSetGrid.UpdateTransaction.Commit;
      Action:=caFree;
end;

procedure TFormGrid.FormCreate(Sender: TObject);
begin
     if pFIBDataSetGrid.Active then
        pFIBDataSetGrid.Close;
     if pFIBDataSetGrid.Transaction.Active then
        pFIBDataSetGrid.Transaction.Commit;
     if pFIBDataSetGrid.UpdateTransaction.Active then
        pFIBDataSetGrid.UpdateTransaction.Commit;
     pFIBDataSetGrid.Transaction.StartTransaction;
     pFIBDataSetGrid.Open;
end;

end.
