unit UFormPivotTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  cxClasses, cxGraphics, cxCustomData, cxStyles, cxCustomPivotGrid,
  cxDBPivotGrid, cxControls, StdCtrls, Buttons;

type
  TFormPivotDolg = class(TForm)
    pFIBDataSetPivotDolg: TpFIBDataSet;
    pFIBTransactionPivot: TpFIBTransaction;
    pFIBDataSetPivotDolgPRIM: TFIBIntegerField;
    pFIBDataSetPivotDolgNAMEDOL: TFIBStringField;
    pFIBDataSetPivotDolgSHIFRPOD: TFIBIntegerField;
    pFIBDataSetPivotDolgNAMEPOD: TFIBStringField;
    pFIBDataSetPivotDolgSHIFRGRU: TFIBSmallIntField;
    pFIBDataSetPivotDolgNAMECOU: TFIBStringField;
    pFIBDataSetPivotDolgCOUNT: TFIBIntegerField;
    pFIBDataSetPivotDolgSUMMAKOE: TFIBBCDField;
    pFIBDataSetPivotDolgSUMMAOKL: TFIBBCDField;
    DataSourcePivotTable: TDataSource;
    cxDBPivotGridPivotDolg: TcxDBPivotGrid;
    cxDBPivotGridPivotDolgFieldDolg: TcxDBPivotGridField;
    cxDBPivotGridPivotDolgFieldPodr: TcxDBPivotGridField;
    cxDBPivotGridPivotDolgFieldGru: TcxDBPivotGridField;
    cxDBPivotGridPivotDolgFieldKwo: TcxDBPivotGridField;
    cxDBPivotGridPivotDolgFieldKoe: TcxDBPivotGridField;
    cxDBPivotGridPivotDolgFieldOkl: TcxDBPivotGridField;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
         WantedYear:integer;
         WantedMonth:integer;
  public
    { Public declarations }
  end;

var
  FormPivotDolg: TFormPivotDolg;

implementation
 uses UFibModule,ScrDef;

{$R *.dfm}

procedure TFormPivotDolg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetPivotDolg.Active then
        pFIBDataSetPivotDolg.Close;
     if pFIBDataSetPivotDolg.Transaction.Active then
        pFIBDataSetPivotDolg.Transaction.Commit;
      Action:=caFree;
end;

procedure TFormPivotDolg.FormCreate(Sender: TObject);
begin
     if pFIBDataSetPivotDolg.Transaction.Active then
        pFIBDataSetPivotDolg.Transaction.Commit;
     if pFIBDataSetPivotDolg.Active then
        pFIBDataSetPivotDolg.Close;
     Self.WantedYear:=CurrYear;
     Self.WantedMonth:=NMES;
     pFIBDataSetPivotDolg.Transaction.StartTransaction;
     pFIBDataSetPivotDolg.Params[0].AsInteger:=Self.WantedYear;
     pFIBDataSetPivotDolg.Params[1].AsInteger:=Self.WantedMonth;
     pFIBDataSetPivotDolg.Open;

end;

end.
