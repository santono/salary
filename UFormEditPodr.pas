unit UFormEditPodr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, dxCntner, ExtCtrls, DBCtrls, StdCtrls, Buttons,
  FIBDatabase, pFIBDatabase,FIB;

type
  TFormEditPodr = class(TForm)
    pFIBDataSetPodr: TpFIBDataSet;
    DataSourcePodr: TDataSource;
    dxDBGridPodr: TdxDBGrid;
    pFIBDataSetPodrSHIFRPOD: TFIBIntegerField;
    pFIBDataSetPodrNAME: TFIBStringField;
    pFIBDataSetPodrMO_BUD: TFIBIntegerField;
    pFIBDataSetPodrMO_VNE: TFIBIntegerField;
    pFIBDataSetPodrMO_KOL_BUD: TFIBIntegerField;
    pFIBDataSetPodrMO_KOL_VNE: TFIBIntegerField;
    pFIBDataSetPodrMO_GN: TFIBIntegerField;
    pFIBDataSetPodrMO_NIS: TFIBIntegerField;
    pFIBDataSetPodrMO_MAG_BUD: TFIBIntegerField;
    pFIBDataSetPodrMO_MAG_VNE: TFIBIntegerField;
    dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridPodrNAME: TdxDBGridMaskColumn;
    dxDBGridPodrMO_BUD: TdxDBGridCheckColumn;
    dxDBGridPodrMO_VNE: TdxDBGridCheckColumn;
    dxDBGridPodrMO_KOL_BUD: TdxDBGridCheckColumn;
    dxDBGridPodrMO_KOL_VNE: TdxDBGridCheckColumn;
    dxDBGridPodrMO_GN: TdxDBGridCheckColumn;
    dxDBGridPodrMO_NIS: TdxDBGridCheckColumn;
    dxDBGridPodrMO_MAG_BUD: TdxDBGridCheckColumn;
    dxDBGridPodrMO_MAG_VNE: TdxDBGridCheckColumn;
    DBNavigatorPodr: TDBNavigator;
    BitBtn1: TBitBtn;
    pFIBDataSetPodrMO_MP: TFIBIntegerField;
    dxDBGridPodrMO_MP: TdxDBGridCheckColumn;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSetPodrCANBEEMPTY: TFIBSmallIntField;
    dxDBGridPodrEmpty: TdxDBGridCheckColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditPodr: TFormEditPodr;

implementation
  uses UFibModule;

{$R *.dfm}

procedure TFormEditPodr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetPodr.Active then
        pFIBDataSetPodr.Active:=false;
     if pFIBDataSetPodr.Transaction.Active then
        pFIBDataSetPodr.Transaction.Commit;
     Action:=caFree;
end;

procedure TFormEditPodr.FormShow(Sender: TObject);
begin
     if not pFIBDataSetPodr.Active then
        pFIBDataSetPodr.Active:=true;
end;





end.
