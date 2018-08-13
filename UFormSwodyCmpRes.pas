{$WARNINGS OFF}
{$HINTS OFF}
unit UFormSwodyCmpRes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBGrid, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxCntner,
  ComCtrls;

type
  TFormSwodyCmpRes = class(TForm)
    DataSourceAdd: TDataSource;
    DataSourceUd: TDataSource;
    pFIBDataSetAdd: TpFIBDataSet;
    pFIBDataSetUd: TpFIBDataSet;
    pFIBTrAddRead: TpFIBTransaction;
    pFIBTUdRead: TpFIBTransaction;
    pFIBDataSetAddSHIFRSTA: TFIBIntegerField;
    pFIBDataSetAddNAMESTA: TFIBStringField;
    pFIBDataSetAddSHIFRPOD: TFIBIntegerField;
    pFIBDataSetAddPERIOD: TFIBIntegerField;
    pFIBDataSetAddNMBOFRECFR: TFIBIntegerField;
    pFIBDataSetAddSUMMAFR: TFIBBCDField;
    pFIBDataSetAddNMBOFRECTO: TFIBIntegerField;
    pFIBDataSetAddSUMMATO: TFIBBCDField;
    pFIBDataSetAddMODE: TFIBSmallIntField;
    pFIBDataSetAddShifrIdCalc: TIntegerField;
    PageControl: TPageControl;
    TabSheetAdd: TTabSheet;
    TabSheetUd: TTabSheet;
    dxDBGridAdd: TdxDBGrid;
    dxDBGridAddSHIFRSTA: TdxDBGridMaskColumn;
    dxDBGridAddNAMESTA: TdxDBGridMaskColumn;
    dxDBGridAddSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridAddPERIOD: TdxDBGridMaskColumn;
    dxDBGridAddNMBOFRECFR: TdxDBGridMaskColumn;
    dxDBGridAddSUMMAFR: TdxDBGridCurrencyColumn;
    dxDBGridAddNMBOFRECTO: TdxDBGridMaskColumn;
    dxDBGridAddSUMMATO: TdxDBGridCurrencyColumn;
    dxDBGridAddMODE: TdxDBGridMaskColumn;
    dxDBGridAddShifrIdCalc: TdxDBGridColumn;
    pFIBDataSetUdSHIFRSTA: TFIBIntegerField;
    pFIBDataSetUdNAMESTA: TFIBStringField;
    pFIBDataSetUdSHIFRPOD: TFIBIntegerField;
    pFIBDataSetUdPERIOD: TFIBIntegerField;
    pFIBDataSetUdNMBOFRECFR: TFIBIntegerField;
    pFIBDataSetUdSUMMAFR: TFIBBCDField;
    pFIBDataSetUdNMBOFRECTO: TFIBIntegerField;
    pFIBDataSetUdSUMMATO: TFIBBCDField;
    pFIBDataSetUdMODE: TFIBSmallIntField;
    pFIBDataSetUdShifrIdCalc: TIntegerField;
    dxDBGridUd: TdxDBGrid;
    dxDBGridUdSHIFRSTA: TdxDBGridMaskColumn;
    dxDBGridUdNAMESTA: TdxDBGridMaskColumn;
    dxDBGridUdSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridUdPERIOD: TdxDBGridMaskColumn;
    dxDBGridUdNMBOFRECFR: TdxDBGridMaskColumn;
    dxDBGridUdSUMMAFR: TdxDBGridCurrencyColumn;
    dxDBGridUdNMBOFRECTO: TdxDBGridMaskColumn;
    dxDBGridUdSUMMATO: TdxDBGridCurrencyColumn;
    dxDBGridUdMODE: TdxDBGridMaskColumn;
    dxDBGridUdShifrIdCalc: TdxDBGridColumn;
    pFIBDataSetAddSTANAME: TStringField;
    dxDBGridAddStaName: TdxDBGridColumn;
    pFIBDataSetUdSTANAME: TStringField;
    dxDBGridUdStaName: TdxDBGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSetAddCalcFields(DataSet: TDataSet);
    procedure pFIBDataSetUdCalcFields(DataSet: TDataSet);
    constructor Create(AOwner: TComponent;ShifrIdFr:Integer;ShifrIdTo:integer);
    procedure FormCreate(Sender: TObject);
  private
    ShifrIdFr:Integer;
    ShifrIdTo:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSwodyCmpRes: TFormSwodyCmpRes;

implementation
  uses UFibModule;

{$R *.dfm}
constructor TFormSwodyCmpRes.Create(AOwner: TComponent;ShifrIdFr:Integer;ShifrIdTo:integer);
  begin
       inherited Create(AOwner);
       Self.ShifrIdFr:=ShifrIdFr;
       Self.ShifrIdTo:=ShifrIdTo;
  end;

procedure TFormSwodyCmpRes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetAdd.Active then
        pFIBDataSetAdd.Close;
     if pFIBDataSetAdd.Transaction.Active then
        pFIBDataSetAdd.Transaction.Commit;
     if pFIBDataSetAdd.UpdateTransaction.Active then
        pFIBDataSetAdd.UpdateTransaction.Commit;
     if pFIBDataSetUd.Active then
        pFIBDataSetUd.Close;
     if pFIBDataSetUd.Transaction.Active then
        pFIBDataSetUd.Transaction.Commit;
     if pFIBDataSetUd.UpdateTransaction.Active then
        pFIBDataSetUd.UpdateTransaction.Commit;

     Action:=caFree;
end;

procedure TFormSwodyCmpRes.pFIBDataSetAddCalcFields(DataSet: TDataSet);
begin
     pFIBDataSetAddShifrIdCalc.Value := pFIBDataSetAddSHIFRPOD.Value +
                                      (pFIBDataSetAddSHIFRSTA.Value +
                                       pFIBDataSetAddPERIOD.Value   * 1000) * 1000;
     pFIBDataSetAddStaName.Value      := IntToStr(pFIBDataSetAddSHIFRSTA.Value) + ' '+
                                         trim(pFIBDataSetAddNameSta.Value);
end;

procedure TFormSwodyCmpRes.pFIBDataSetUdCalcFields(DataSet: TDataSet);
begin
     pFIBDataSetUdShifrIdCalc.Value := pFIBDataSetUdSHIFRPOD.Value +
                                      (pFIBDataSetUdSHIFRSTA.Value +
                                       pFIBDataSetUdPERIOD.Value   * 1000) * 1000;
     pFIBDataSetUdStaName.Value     := IntToStr(pFIBDataSetUdSHIFRSTA.Value) + ' '+
                                         trim(pFIBDataSetUdNameSta.Value);

end;

procedure TFormSwodyCmpRes.FormCreate(Sender: TObject);
begin
     if pFIBDataSetAdd.Active then
        pFIBDataSetAdd.Close;
     if pFIBDataSetAdd.Transaction.Active then
        pFIBDataSetAdd.Transaction.Commit;
     if pFIBDataSetAdd.UpdateTransaction.Active then
        pFIBDataSetAdd.UpdateTransaction.Commit;
     pFIBDataSetAdd.Transaction.StartTransaction;
     pFIBDataSetAdd.Params[0].AsInteger:=ShifrIdFr;
     pFIBDataSetAdd.Params[1].AsInteger:=ShifrIdTo;
     pFIBDataSetAdd.Prepare;
     pFIBDataSetAdd.Open;
     if pFIBDataSetUd.Active then
        pFIBDataSetUd.Close;
     if pFIBDataSetUd.Transaction.Active then
        pFIBDataSetUd.Transaction.Commit;
     if pFIBDataSetUd.UpdateTransaction.Active then
        pFIBDataSetUd.UpdateTransaction.Commit;
     pFIBDataSetUd.Transaction.StartTransaction;
     pFIBDataSetUd.Params[0].AsInteger:=ShifrIdFr;
     pFIBDataSetUd.Params[1].AsInteger:=ShifrIdTo;
     pFIBDataSetUd.Prepare;
     pFIBDataSetUd.Open;
end;

end.
