{$WARNINGS OFF}
{$HINTS OFF}
unit UFormBolnAbo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBGrid, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxCntner;

type
  TFormBolnAbo = class(TForm)
    pFIBDataSetBA: TpFIBDataSet;
    DataSourceBA: TDataSource;
    pFIBDataSetBAYEAR_VY: TFIBSmallIntField;
    pFIBDataSetBAMONTH_VY: TFIBSmallIntField;
    pFIBDataSetBAF_DATA: TFIBDateField;
    pFIBDataSetBAL_DATA: TFIBDateField;
    pFIBDataSetBAK_WO_DAY: TFIBSmallIntField;
    pFIBDataSetBASUMMA_BOL: TFIBBCDField;
    pFIBDataSetBASHIFRID: TFIBIntegerField;
    pFIBDataSetBANOMER_B: TFIBStringField;
    pFIBDataSetBADATA_P_BUD: TFIBDateField;
    pFIBDataSetBAdata_p: TStringField;
    dxDBGridBA: TdxDBGrid;
    dxDBGridBAYEAR_VY: TdxDBGridMaskColumn;
    dxDBGridBAMONTH_VY: TdxDBGridMaskColumn;
    dxDBGridBAF_DATA: TdxDBGridDateColumn;
    dxDBGridBAL_DATA: TdxDBGridDateColumn;
    dxDBGridBAK_WO_DAY: TdxDBGridMaskColumn;
    dxDBGridBASUMMA_BOL: TdxDBGridCurrencyColumn;
    dxDBGridBANOMER_B: TdxDBGridMaskColumn;
    dxDBGridBAdata_p: TdxDBGridColumn;
    pFIBDataSetBACODE_REASON_ILL: TFIBIntegerField;
  private
    { Private declarations }
  public
    WantedTabno:integer;
    WantedFio:String;
    { Public declarations }
  end;

var
 FormBolnAbo :TFormBolnAbo;

IMPLEMENTATION
{$R *.dfm}


INITIALIZATION
END.
