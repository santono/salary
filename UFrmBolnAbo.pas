unit UFrmBolnAbo;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSetBACalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ShowTable;

  private
    { Private declarations }
  public
    WantedTabno:integer;
    WantedFio:String
    { Public declarations }
  end;

var
  FormBolnAbo: TFormBolnAbo;

implementation
uses UFibModule,UFormWait;

{$R *.dfm}

procedure TFormBolnAbo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormBolnAbo.pFIBDataSetBACalcFields(DataSet: TDataSet);
var DT:TDateTime;
    Y,M,D:Word;
begin
     Dt:=DataSet.FieldByName('Data_P_Bud').AsDateTime;
     DeCodeDate(DT,Y,M,D);
     if Y<1995 then
        pFIBDataSetBADATA_P.Value:=''
               else
        pFIBDataSetBADATA_P.Value:=IntToStr(D)+'.'+IntToStr(M)+'.'+IntToStr(Y);
end;

procedure TFormBolnAbo.ShowTable;
begin
      FormWait.Show;
      Application.ProcessMessages;
      if pFIBDataSetBA.Active then
         pFIBDataSetBA.Active:=false;
      pFIBDataSetBA.Params[0].AsInteger:=Self.WantedTabno;
      pFIBDataSetBA.Prepare;
      pFIBDataSetBA.Open;
      FormWait.Hide;
end;

procedure TFormBolnAbo.FormShow(Sender: TObject);
 begin
       Caption:='Больничные '+WantedFio;
       Self.ShowTable;
 end;

procedure TFormBolnAbo.FormCreate(Sender: TObject);
 begin
      WantedTabno:=0;
      WantedFio:='';
 end;


END.
