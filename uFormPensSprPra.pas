unit uFormPensSprPra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBTLCl, dxGrClms,
  dxDBCtrl, dxDBGrid, dxTL, dxCntner;

type
  TFormPensSprPra = class(TForm)
    pFIBDataSetPensSprSpra1: TpFIBDataSet;
    pFIBDataSetLook: TpFIBDataSet;
    pFIBDataSetPensSprSpra1shifrsta: TFIBIntegerField;
    pFIBDataSetPensSprSpra1WIDRABOTY: TFIBIntegerField;
    pFIBDataSetPensSprSpra1NAMESTA: TFIBStringField;
    dxDBGrid1: TdxDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    dxDBGrid1shifrsta: TdxDBGridLookupColumn;
    dxDBGrid1NAMESTA: TdxDBGridMaskColumn;
    dxDBGrid1WIDRABOTY: TdxDBGridCheckColumn;
    pFIBDataSetLookSHIFR: TFIBIntegerField;
    pFIBDataSetLookSHORTNAME: TFIBStringField;
    pFIBDataSetPensSprSpra1SHIFRSTA2: TFIBIntegerField;
    pFIBDataSetPensSprSpra1ShifrIdCalc: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dxDBGrid1shifrstaChange(Sender: TObject);
    procedure pFIBDataSetLookCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPensSprPra: TFormPensSprPra;

implementation
 uses uFibModule;

{$R *.dfm}

procedure TFormPensSprPra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if  pFIBDataSetPensSprSpra1.Active then
          pFIBDataSetPensSprSpra1.Active:=false;
      if  pFIBDataSetLook.Active then
          pFIBDataSetLook.Active:=false;
       if pFIBDataSetLook.Transaction.InTransaction then
          pFIBDataSetLook.Transaction.Commit;
      Action:=caFree;
end;

procedure TFormPensSprPra.FormCreate(Sender: TObject);
begin
      if  not pFIBDataSetPensSprSpra1.Active then
          pFIBDataSetPensSprSpra1.Active:=true;
      if  not pFIBDataSetLook.Active then
          pFIBDataSetLook.Active:=true;

end;

procedure TFormPensSprPra.dxDBGrid1shifrstaChange(Sender: TObject);
VAR I:INTEGER;
begin
{
      I:=pFIBDataSetPensSprSpra1.FieldByName[3].AsInteger;
      fib.pFIBQueryArc.SQL.Clear;
      fib.pFIBQueryArc.SQL.ADD('select FIRST 1 SHORTNAME FROM SHIFR WHERE SHIFR='+INTTOSTR(I));
      TRY
         fib.pFIBQueryArc.Exec
      EXCEPT
      END;
}

end;

procedure TFormPensSprPra.pFIBDataSetLookCalcFields(DataSet: TDataSet);
begin
      pFIBDataSetPensSprSpra1ShifrIdCalc.Value:=
          pFIBDataSetPensSprSpra1shifrsta.Value+
          pFIBDataSetPensSprSpra1WIDRABOTY.Value*10000;

end;

end.
