unit uFormSelParentBoln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, FIBDatabase, pFIBDatabase, pFIBDataSet,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  StdCtrls, Buttons;

type
  TFormSelParentBoln = class(TForm)
    pFIBDataSetSelBoln: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetSelBolnSHIFRID: TFIBIntegerField;
    pFIBDataSetSelBolnFIO: TFIBStringField;
    pFIBDataSetSelBolnSUMMA_BOL: TFIBBCDField;
    pFIBDataSetSelBolnF_DATA: TFIBDateField;
    pFIBDataSetSelBolnL_DATA: TFIBDateField;
    pFIBDataSetSelBolnNOMER_B: TFIBStringField;
    DataSource1: TDataSource;
    dxDBGridSelBoln: TdxDBGrid;
    dxDBGridSelBolnSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSelBolnFIO: TdxDBGridMaskColumn;
    dxDBGridSelBolnSUMMA_BOL: TdxDBGridCurrencyColumn;
    dxDBGridSelBolnF_DATA: TdxDBGridDateColumn;
    dxDBGridSelBolnL_DATA: TdxDBGridDateColumn;
    dxDBGridSelBolnNOMER_B: TdxDBGridMaskColumn;
    LabelFio: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function Execute: boolean;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);

  private
    { Private declarations }
  public
     WantadShifrIdParentBoln : integer;
     SelfShifrIdParentBoln   : integer;
     WantedTabnoForBoln      : integer;
     WantedFio               : string;

    { Public declarations }
  end;

var
  FormSelParentBoln: TFormSelParentBoln;

implementation

{$R *.dfm}

procedure TFormSelParentBoln.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if pFIBDataSetSelBoln.Active then
         pFIBDataSetSelBoln.Close;
      if pFIBTransactionRead.Active then
         pFIBTransactionRead.Commit;
      Action:=caFree;
end;

procedure TFormSelParentBoln.FormCreate(Sender: TObject);
begin
     WantadShifrIdParentBoln := 0;
     SelfShifrIdParentBoln   := 0;
     WantedTabnoForBoln      := 0;
     if not pFIBTransactionRead.Active then
        pFIBTransactionRead.StartTransaction;
end;

procedure TFormSelParentBoln.FormShow(Sender: TObject);
begin
      if pFIBDataSetSelBoln.Active then
         pFIBDataSetSelBoln.Close;
      pFIBDataSetSelBoln.Params[0].AsString:=IntToStr(WantedTabnoForBoln);
      pFIBDataSetSelBoln.Params[1].AsString:=IntToStr(SelfShifrIdParentBoln);
      pFIBDataSetSelBoln.Prepare;
      pFIBDataSetSelBoln.Open;
end;

function TFormSelParentBoln.Execute: boolean;
begin
     LabelFio.Caption:='Список б.листков '+IntToStr(Self.WantedTabnoForBoln)+' '+Trim(Self.WantedFio);
     Self.visible:=false;
     if ShowModal = mrOk then result := true
                         else result := false;
end;



procedure TFormSelParentBoln.BitBtn1Click(Sender: TObject);
begin
      WantadShifrIdParentBoln:=pFIBDataSetSelBolnSHIFRID.Value;
      if WantadShifrIdParentBoln<0 then
         WantadShifrIdParentBoln:=0;
      ModalResult:=mrOk;
end;

procedure TFormSelParentBoln.BitBtn2Click(Sender: TObject);
begin
      ModalResult:=mrCancel;
      Self.Close;
end;

end.

