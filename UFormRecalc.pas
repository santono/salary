unit UFormRecalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, StdCtrls, Buttons, dxDBTLCl, dxGrClms;

type
  TFormRecalc = class(TForm)
    DateTimePicker1: TDateTimePicker;
    PageRec: TPageControl;
    TabPod: TTabSheet;
    TabPens: TTabSheet;
    TabSS: TTabSheet;
    TabFZ: TTabSheet;
    pFIBDataSetRecalc: TpFIBDataSet;
    DataSourceRecac: TDataSource;
    dxDBGridPod: TdxDBGrid;
    dxDBGridPodMonthZa: TdxDBGridColumn;
    pFIBDataSetRecalcMONTHZA: TFIBIntegerField;
    pFIBDataSetRecalcSUMMAPODADD: TFIBBCDField;
    pFIBDataSetRecalcSUMMAPODUD: TFIBBCDField;
    pFIBDataSetRecalcSUMMAPODRAS: TFIBBCDField;
    pFIBDataSetRecalcSUMMAPODRAZN: TFIBBCDField;
    pFIBDataSetRecalcSUMMAPENSADD: TFIBBCDField;
    pFIBDataSetRecalcSUMMAPENSUD: TFIBBCDField;
    pFIBDataSetRecalcSUMMAPENSRAS: TFIBBCDField;
    pFIBDataSetRecalcSUMMAPENSRAZN: TFIBBCDField;
    pFIBDataSetRecalcSUMMASSADD: TFIBBCDField;
    pFIBDataSetRecalcSUMMASSUD: TFIBBCDField;
    pFIBDataSetRecalcSUMMASSRAS: TFIBBCDField;
    pFIBDataSetRecalcSUMMASSRAZN: TFIBBCDField;
    pFIBDataSetRecalcSUMMAFZADD: TFIBBCDField;
    pFIBDataSetRecalcSUMMAFZUD: TFIBBCDField;
    pFIBDataSetRecalcSUMMAFZRAS: TFIBBCDField;
    pFIBDataSetRecalcSUMMAFZRAZN: TFIBBCDField;
    dxDBGridPodNach: TdxDBGridColumn;
    dxDBGridPodFakt: TdxDBGridColumn;
    dxDBGridPodRas: TdxDBGridColumn;
    dxDBGridPodRazn: TdxDBGridColumn;
    BitBtn1: TBitBtn;
    dxDBGridPens: TdxDBGrid;
    dxDBGridPensMONTHZA: TdxDBGridMaskColumn;
    dxDBGridPensSUMMAPENSADD: TdxDBGridCurrencyColumn;
    dxDBGridPensSUMMAPENSUD: TdxDBGridCurrencyColumn;
    dxDBGridPensSUMMAPENSRAS: TdxDBGridCurrencyColumn;
    dxDBGridPensSUMMAPENSRAZN: TdxDBGridCurrencyColumn;
    dxDBGridSS: TdxDBGrid;
    dxDBGridSSMONTHZA: TdxDBGridMaskColumn;
    dxDBGridSSSUMMASSADD: TdxDBGridCurrencyColumn;
    dxDBGridSSSUMMASSUD: TdxDBGridCurrencyColumn;
    dxDBGridSSSUMMASSRAS: TdxDBGridCurrencyColumn;
    dxDBGridSSSUMMASSRAZN: TdxDBGridCurrencyColumn;
    dxDBGridFZ: TdxDBGrid;
    dxDBGridFZMONTHZA: TdxDBGridMaskColumn;
    dxDBGridFZSUMMAFZADD: TdxDBGridCurrencyColumn;
    dxDBGridFZSUMMAFZUD: TdxDBGridCurrencyColumn;
    dxDBGridFZSUMMAFZRAS: TdxDBGridCurrencyColumn;
    dxDBGridFZSUMMAFZRAZN: TdxDBGridCurrencyColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
     procedure ShowDataRecalc;
  public
     Tabno:integer;
     WantedMonth:integer;
     WantedYear:integer;
     WantedData:TDate;
    { Public declarations }
  end;

var
  FormRecalc: TFormRecalc;

implementation
uses UFibModule, uFormWait;

{$R *.dfm}

procedure TFormRecalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormRecalc.DateTimePicker1Change(Sender: TObject);
var Year,Month,Day:word;
begin
     DecodeDate(DateTimePicker1.Date, Year, Month, Day);
     WantedYear  := Year;
     WantedMonth := Month;
     if pFIBDataSetRecalc.Active then
        pFIBDataSetRecalc.Active:=false;
end;

procedure TFormRecalc.FormCreate(Sender: TObject);
var Year,Month,Day:word;
    i:Integer;
    S:String;
    SA:AnsiString;
    SS:Array[1..9] of String;
begin
      Self.Tabno:=277;
      WantedYear:=2005;
      WantedMonth:=4;
      WantedData  :=  Now;
      DecodeDate(WantedData, Year, Month, Day);
      WantedYear  := Year;
      WantedMonth := Month-1;
      if WantedMonth<1 then
         begin
              WantedMonth := 12;
              WantedYear  := Year-1;
         end;
      WantedData := EncodeDate(WantedYear, WantedMonth, 1);
      DateTimePicker1.Date := WantedData;
end;

procedure TFormRecalc.BitBtn1Click(Sender: TObject);
begin
      FormWait.Show;
      Application.ProcessMessages;
      ShowDataRecalc;
      FormWait.Hide;

end;

procedure TFormRecalc.ShowDataRecalc;
begin
      if pFIBDataSetRecalc.Active then
         pFIBDataSetRecalc.Active:=false;
      pFIBDataSetRecalc.Params[0].AsString:=IntToStr(Self.Tabno);
      pFIBDataSetRecalc.Params[1].AsString:=IntToStr(WantedYear);
      pFIBDataSetRecalc.Prepare;
      pFIBDataSetRecalc.Open;

end;




end.
