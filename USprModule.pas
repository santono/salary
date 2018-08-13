{$WARNINGS OFF}
{$HINTS OFF}
unit USprModule;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, pFIBDataSet;

type
  TDataModuleSPR = class(TDataModule)
    pFIBDataSetSSLimity: TpFIBDataSet;
    pFIBDataSetSSLimityDATEFR: TFIBDateField;
    pFIBDataSetSSLimityLIMPROC: TFIBBCDField;
    pFIBDataSetSSLimityLIMITMAX: TFIBBCDField;
    pFIBDataSetSSLimityPROCSSDOLIM: TFIBBCDField;
    pFIBDataSetSSLimityPROCSSAFTERLIM: TFIBBCDField;
    pFIBDataSetSSLimityMINSAL: TFIBBCDField;
    pFIBDataSetSSLimityPROGMIN: TFIBBCDField;
    DataSourceSSLimity: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleSPR: TDataModuleSPR;

implementation
  uses UFibModule;

{$R *.dfm}

end.
