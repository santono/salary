unit UFormMonthsHea;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxCntner, dxDBGrid, Menus;

type
  TFormMonthsHea = class(TForm)
    pFIBDataSetMHea: TpFIBDataSet;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetMHeaDATEFR: TFIBDateField;
    pFIBDataSetMHeaWORK_DAY_5: TFIBSmallIntField;
    pFIBDataSetMHeaWORK_DAY_6: TFIBSmallIntField;
    dxDBGridMHea: TdxDBGrid;
    DataSourceMHea: TDataSource;
    dxDBGridMHeaDATEFR: TdxDBGridDateColumn;
    dxDBGridMHeaWORK_DAY_5: TdxDBGridCalcColumn;
    dxDBGridMHeaWORK_DAY_6: TdxDBGridCalcColumn;
    pFIBDataSetMHeaWORK_CLOCK_5: TFIBSmallIntField;
    pFIBDataSetMHeaWORK_CLOCK_6: TFIBSmallIntField;
    dxDBGridMHeaWORK_CLOCK_5: TdxDBGridCalcColumn;
    dxDBGridMHeaWORK_CLOCK_6: TdxDBGridCalcColumn;
    dxDBGridMHeaColumnPr: TdxDBGridButtonColumn;
    PopupMenu1: TPopupMenu;
    Daytxt1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dxDBGridMHeaColumnPrButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure Daytxt1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMonthsHea: TFormMonthsHea;

implementation
 uses uFIBModule,UFormMonthsPr, UFormImportDayTxt;

{$R *.dfm}

procedure TFormMonthsHea.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetMHea.Active then
        pFIBDataSetMHea.Active := false;
     if pFIBDataSetMHea.Transaction.Active then
        pFIBDataSetMHea.Transaction.COMMIT;
     if pFIBDataSetMHea.UpdateTransaction.Active then
        pFIBDataSetMHea.UpdateTransaction.COMMIT;
     Action:=caFree;
end;

procedure TFormMonthsHea.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetMHea.Transaction.Active then
        pFIBDataSetMHea.Transaction.StartTransaction;
     if not pFIBDataSetMHea.Active then
        pFIBDataSetMHea.Active:=true;
end;

procedure TFormMonthsHea.dxDBGridMHeaColumnPrButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
  var DateFr:TDate;
begin
    Application.CreateForm(TFormMonthPr, FormMonthPr);
    DateFr := pFIBDataSetMHea.FieldByName('DateFr').AsDateTime;
    FormMonthPr.WantedData := DateFr;
    FormMonthPr.FillStandart(1);
    FormMonthPr.ShowModal;
end;

procedure TFormMonthsHea.Daytxt1Click(Sender: TObject);
begin
       Application.CreateForm(TFormImportDayTxt,FormImportDayTxt);
       FormImportDayTxt.ShowModal;
end;

end.
