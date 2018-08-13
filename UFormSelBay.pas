unit UFormSelBay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFibModule, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib, StdCtrls,
  Buttons, dxDBGrid, dxTL, dxDBCtrl;

type
  TFormSelBay = class(TForm)
    pFIBDataSetBay: TpFIBDataSet;
    DataSourceBay: TDataSource;
    pFIBTransactionBay: TpFIBTransaction;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dxDBGridBay: TdxDBGrid;
    pFIBDataSetBayFIOOP: TFIBStringField;
    pFIBDataSetBaySHIFRWRK: TFIBIntegerField;
    dxDBGridBayFIOOP: TdxDBGridMaskColumn;
    dxDBGridBaySHIFRWRK: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSetBayCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelBay: TFormSelBay;

implementation
{$R *.dfm}
   uses UFormBoln;

procedure TFormSelBay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetBay.Active then
         pFIBDataSetBay.Close;
      if pFIBDataSetBay.Transaction.Active then
         pFIBDataSetBay.Transaction.Commit;
     Action := caFree;
end;

procedure TFormSelBay.pFIBDataSetBayCalcFields(DataSet: TDataSet);
begin
    { pFIBDataSetBaySHIFRID.AsInteger:=pFIBDataSetBaySHIFRBUH.AsInteger*10000+pFIBDataSetBaySHIFRPOD.AsInteger;}
end;

procedure TFormSelBay.FormCreate(Sender: TObject);
begin
      if not pFIBDataSetBay.Transaction.Active then
         pFIBDataSetBay.Transaction.StartTransaction;
      if pFIBDataSetBay.Active then
         pFIBDataSetBay.Close;
      pFIBDataSetBay.Active:=true;
end;

procedure TFormSelBay.BitBtn1Click(Sender: TObject);
 var ShifrBay:integer;
begin
     ShifrBay:=pFIBDataSetBaySHIFRWRK.AsInteger;
     if ShifrBay<1 then
        ShowMessage('Не выбран участок')
     else
        FormBoln.PrintReestrBoln(ShifrBay);
end;

end.
