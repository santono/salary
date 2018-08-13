unit FormPersPrU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet,UFibModule, dxExEdtr, dxTL,
  dxDBCtrl, dxDBGrid, dxCntner, StdCtrls, Buttons, dxEdLib, dxDBELib,
  dxEditor;

type
  TFormPersPr = class(TForm)
    pFIBDataSetIndBody: TpFIBDataSet;
    DataSourceIndBody: TDataSource;
    pFIBDataSetIndBodyPERIOD: TFIBSmallIntField;
    pFIBDataSetIndBodySZ: TFIBFloatField;
    pFIBDataSetIndBodySZP: TFIBFloatField;
    pFIBDataSetIndBodySL: TFIBFloatField;
    pFIBDataSetIndBodySPD: TFIBFloatField;
    pFIBDataSetIndBodyKD: TFIBIntegerField;
    dxDBGrid1: TdxDBGrid;
    pFIBDataSetIndBodySHIFRID: TFIBIntegerField;
    dxDBGrid1PERIOD: TdxDBGridMaskColumn;
    dxDBGrid1SZ: TdxDBGridMaskColumn;
    dxDBGrid1SZP: TdxDBGridMaskColumn;
    dxDBGrid1SL: TdxDBGridMaskColumn;
    dxDBGrid1SPD: TdxDBGridMaskColumn;
    dxDBGrid1KD: TdxDBGridMaskColumn;
    dxDBGrid1SHIFRID: TdxDBGridMaskColumn;
    pFIBDataSetInd: TpFIBDataSet;
    pFIBDataSetIndSHIFRID: TFIBIntegerField;
    pFIBDataSetIndSVR: TFIBBCDField;
    pFIBDataSetIndSVZ: TFIBBCDField;
    pFIBDataSetIndSZ: TFIBBCDField;
    pFIBDataSetIndSZP: TFIBBCDField;
    pFIBDataSetIndSL: TFIBBCDField;
    pFIBDataSetIndSP: TFIBBCDField;
    pFIBDataSetIndKD: TFIBIntegerField;
    pFIBDataSetIndDPR: TFIBDateField;
    pFIBDataSetIndDZR: TFIBDateField;
    pFIBDataSetIndKPM: TFIBIntegerField;
    pFIBDataSetIndKPD: TFIBIntegerField;
    pFIBDataSetIndISPENSIONER: TFIBSmallIntField;
    pFIBDataSetIndISINVALID: TFIBSmallIntField;
    dxDBDateEditPri: TdxDBDateEdit;
    DataSourceInd: TDataSource;
    Label1: TLabel;
    dxDBDateEditUw: TdxDBDateEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dxDBCalcEditKPM: TdxDBCalcEdit;
    dxDBCalcEditKPD: TdxDBCalcEdit;
    dxDBMaskEditSZ: TdxDBMaskEdit;
    dxDBMaskEditSZP: TdxDBMaskEdit;
    dxDBMaskEditSL: TdxDBMaskEdit;
    dxDBMaskEditKD: TdxDBMaskEdit;
    dxDBMaskEditSP: TdxDBMaskEdit;
    BitBtn1: TBitBtn;
    dxDBCheckEditPensioner: TdxDBCheckEdit;
    dxDBCheckEditInvalid: TdxDBCheckEdit;
    dxDBMaskEditSVR: TdxDBMaskEdit;
    pFIBDataSetSS: TpFIBDataSet;
    DataSourceSS: TDataSource;
    pFIBDataSetSSSHIFRID: TFIBIntegerField;
    pFIBDataSetSSKPLG: TFIBStringField;
    pFIBDataSetSSKMZ: TFIBIntegerField;
    pFIBDataSetSSKSL: TFIBStringField;
    pFIBDataSetSSSSM: TFIBIntegerField;
    pFIBDataSetSSNSL: TFIBFloatField;
    dxDBGridSS: TdxDBGrid;
    dxDBGridSSSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSSKPLG: TdxDBGridMaskColumn;
    dxDBGridSSKMZ: TdxDBGridMaskColumn;
    dxDBGridSSKSL: TdxDBGridMaskColumn;
    dxDBGridSSSSM: TdxDBGridMaskColumn;
    dxDBGridSSNSL: TdxDBGridMaskColumn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
     procedure ShowTable;
  public
     WantedTabno:integer;
     WantedFio:string;
     ShifrIdAnk:integer;
     ShifrIdInd:integer;
    { Public declarations }
  end;

var
  FormPersPr: TFormPersPr;

implementation
 uses uFormWait;

{$R *.dfm}

procedure TFormPersPr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetIndBody.Active then
        pFIBDataSetIndBody.Active:=false;
     if pFIBDataSetSS.Active then
        pFIBDataSetSS.Active:=false;
     if pFIBDataSetInd.Active then
        pFIBDataSetInd.Active:=false;
{
     if pFIBDataSetIndBody.Transaction.Active then
        pFIBDataSetIndBody.Transaction.Commit;
}
     if pFIBDataSetIndBody.UpdateTransaction.Active then
        pFIBDataSetIndBody.UpdateTransaction.Commit;

     Action:=caFree;
end;
procedure TFormPersPr.ShowTable;
begin
      FormWait.Show;
      Application.ProcessMessages;
      if pFIBDataSetInd.Active then
         pFIBDataSetInd.Active:=false;
      pFIBDataSetInd.Params[0].AsInteger:=Self.ShifrIdAnk;
      pFIBDataSetInd.Prepare;
      pFIBDataSetInd.Open;
      ShifrIdInd:=pFIBDataSetInd.FieldByName('SHIFRID').AsInteger;
      if pFIBDataSetIndBody.Active then
         pFIBDataSetIndBody.Active:=false;
      pFIBDataSetIndBody.Params[0].AsInteger:=Self.ShifrIdAnk;
      pFIBDataSetIndBody.Prepare;
      pFIBDataSetIndBody.Open;
      if pFIBDataSetSS.Active then
         pFIBDataSetSS.Active:=false;
      pFIBDataSetSS.Params[0].AsInteger:=Self.ShifrIdInd;
      pFIBDataSetSS.Prepare;
      pFIBDataSetSS.Open;
      FormWait.Hide;
end;
procedure TFormPersPr.FormShow(Sender: TObject);
begin
      Caption:=IntToStr(WantedTabno)+' '+WantedFio;
      ShowTable;
end;

procedure TFormPersPr.BitBtn2Click(Sender: TObject);
begin
     pFIBDataSetInd.Edit;
     pFIBDataSetInd.Post;
end;

end.
