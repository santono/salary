unit UFormYSprRec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  StdCtrls, Buttons;

type
  TFormYSprRec = class(TForm)
    pFIBTransaction1: TpFIBTransaction;
    dxDBGrid1: TdxDBGrid;
    dsYRec: TDataSource;
    pFIBdsYRec: TpFIBDataSet;
    pFIBdsYRecSHIFRID: TFIBIntegerField;
    pFIBdsYRecSHIFRIDOWNER: TFIBIntegerField;
    pFIBdsYRecPERIOD: TFIBSmallIntField;
    pFIBdsYRecSUMMAADD: TFIBBCDField;
    pFIBdsYRecSUMMAPOD: TFIBBCDField;
    pFIBdsYRecSUMMAECB: TFIBBCDField;
    dxDBGrid1SHIFRID: TdxDBGridMaskColumn;
    dxDBGrid1SHIFRIDOWNER: TdxDBGridMaskColumn;
    dxDBGrid1PERIOD: TdxDBGridMaskColumn;
    dxDBGrid1SUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGrid1SUMMAPOD: TdxDBGridCurrencyColumn;
    dxDBGrid1SUMMAECB: TdxDBGridCurrencyColumn;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    constructor MyCreate(AOwner : TComponent;wantedId:integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormYSprRec: TFormYSprRec;

implementation
  uses UFibModule;

{$R *.dfm}

constructor TFormYSprRec.MyCreate(AOwner : TComponent;wantedId:integer);
   begin
        inherited Create(AOwner);
        pFIBdsYRec.Params[0].AsInteger:=wantedId;
        pFIBdsYRec.Transaction.StartTransaction;
        pFIBdsYRec.Open;

   end;

procedure TFormYSprRec.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     pFIBdsYRec.Close;
     pFIBdsYRec.Transaction.Commit;
     Action := caFree;
end;

end.
