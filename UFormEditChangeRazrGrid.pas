unit UFormEditChangeRazrGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, ExtCtrls, DBCtrls, dxTL, dxDBCtrl, dxDBTLCl, dxGrClms,
  dxCntner, dxDBGrid;

type
  TFormEditChangeRazrGrid = class(TForm)
    pFIBDataSetCRD: TpFIBDataSet;
    pFIBTransactionCRDWrite: TpFIBTransaction;
    pFIBTransactionCRDRead: TpFIBTransaction;
    pFIBDataSetCRDDATEFR: TFIBDateField;
    DataSourceCRD: TDataSource;
    dxDBGridCRD: TdxDBGrid;
    dxDBGridCRDDATEFR: TdxDBGridDateColumn;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditChangeRazrGrid: TFormEditChangeRazrGrid;

implementation
  uses UFibModule;

{$R *.dfm}

procedure TFormEditChangeRazrGrid.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if pFIBDataSetCRD.Active then
         pFIBDataSetCRD.Active:=false;
      if pFIBDataSetCRD.Transaction.Active then
         pFIBDataSetCRD.Transaction.Commit;
      if pFIBDataSetCRD.UpdateTransaction.Active then
         pFIBDataSetCRD.UpdateTransaction.Commit;
      Action:=caFree;
end;

procedure TFormEditChangeRazrGrid.FormCreate(Sender: TObject);
begin
      if pFIBDataSetCRD.Active then
         pFIBDataSetCRD.Active:=false;
      if pFIBDataSetCRD.Transaction.Active then
         pFIBDataSetCRD.Transaction.Commit;
      if pFIBDataSetCRD.UpdateTransaction.Active then
         pFIBDataSetCRD.UpdateTransaction.Commit;
      pFIBDataSetCRD.Transaction.StartTransaction;
      pFIBDataSetCRD.Active:=true;
end;

end.
