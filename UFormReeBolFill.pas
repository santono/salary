unit UFormReeBolFill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, DB, FIBDataSet, FIBDatabase, pFIBDatabase, pFIBDataSet,
  ExtCtrls, DBCtrls, Menus, ComCtrls, StdCtrls, Buttons, FIBQuery,
  pFIBQuery;

type
  TFormReeBolPrFill = class(TForm)
    DataSourceRBPr: TDataSource;
    DBNavigator1: TDBNavigator;
    pFIBDataSetRBPr: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSetRBPrSHIFRID: TFIBIntegerField;
    pFIBDataSetRBPrNOMER_B: TFIBStringField;
    pFIBDataSetRBPrFIO: TFIBStringField;
    pFIBDataSetRBPrF_DATA: TFIBDateField;
    pFIBDataSetRBPrL_DATA: TFIBDateField;
    pFIBDataSetRBPrSUMMA_B: TFIBBCDField;
    pFIBDataSetRBPrSUMMA_P: TFIBBCDField;
    pFIBDataSetRBPrSUMMA_E: TFIBBCDField;
    pFIBDataSetRBPrSUMMA_BA: TFIBBCDField;
    dxDBGridRB: TdxDBGrid;
    dxDBGridRBSHIFRID: TdxDBGridMaskColumn;
    dxDBGridRBNOMER_B: TdxDBGridMaskColumn;
    dxDBGridRBFIO: TdxDBGridMaskColumn;
    dxDBGridRBF_DATA: TdxDBGridDateColumn;
    dxDBGridRBL_DATA: TdxDBGridDateColumn;
    dxDBGridRBSUMMA_B: TdxDBGridCurrencyColumn;
    dxDBGridRBSUMMA_P: TdxDBGridCurrencyColumn;
    dxDBGridRBSUMMA_E: TdxDBGridCurrencyColumn;
    dxDBGridRBSUMMA_BA: TdxDBGridCurrencyColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DateTimePickerRBPr: TDateTimePicker;
    BitBtn1: TBitBtn;
    pFIBQueryPutB: TpFIBQuery;
    pFIBTransactionQ: TpFIBTransaction;
    RadioGroupM: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    constructor CreateRB(ShifrId:integer;AOwner: TComponent);
    procedure DateTimePickerRBPrChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroupMClick(Sender: TObject);
  private
    { Private declarations }
    WantedYear:integer;
    WantedMonth:integer;
    procedure MarkBoln(ShifrIdBoln:integer);

  public
    WantedShifrIdRee:integer;
    WantedMode:integer;
    { Public declarations }
  end;

var
  FormReeBolPrFill: TFormReeBolPrFill;

implementation
 uses ufibmodule,ScrDef;

{$R *.dfm}



constructor TFormReeBolPrFill.CreateRB(ShifrId:integer;AOwner: TComponent);
 var Y,M,Da:word;
     D:TDateTime;
 begin
      inherited Create(AOwner);
      WantedShifrIdRee:=Shifrid;
      WantedYear:=CurrYear;
      WantedMonth:=Nmes;
      y:=WantedYear;
      m:=WantedMonth;
      d:=EnCodeDate(y,m,10);
      DateTimePickerRBPr.Date:=d;
      RadioGroupM.ItemIndex:=0;
      WantedMode:=0;

      pFIBDataSetRBPr.Transaction.StartTransaction;
      pFIBDataSetRBPr.Params[0].AsInteger:=WantedMode;
      pFIBDataSetRBPr.Params[1].AsInteger:=WantedMode;
      pFIBDataSetRBPr.Params[2].AsInteger:=WantedYear;
      pFIBDataSetRBPr.Params[3].AsInteger:=WantedMonth;

      pFIBDataSetRBPr.Open;
 end;

procedure TFormReeBolPrFill.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      pFIBDataSetRBPr.Close;
      pFIBDataSetRBPr.Transaction.Commit;
      if pFIBDataSetRBPr.UpdateTransaction.Active then
         pFIBDataSetRBPr.UpdateTransaction.Commit;

end;



procedure TFormReeBolPrFill.DateTimePickerRBPrChange(Sender: TObject);
 var d:TDateTime;
     y,m,da:word;
begin
     d:=dateTimePickerRBPr.Date;
     Decodedate(d,y,m,da);
     if (WantedYear<>y) or
        (WantedMonth<>m) then
        begin
             WantedYear:=y;
             WantedMonth:=m;
             pFIBDataSetRBPr.Close;
             pFIBDataSetRBPr.Params[0].AsInteger:=WantedMode;
             pFIBDataSetRBPr.Params[1].AsInteger:=WantedMode;
             pFIBDataSetRBPr.Params[2].AsInteger:=WantedYear;
             pFIBDataSetRBPr.Params[3].AsInteger:=WantedMonth;
             pFIBDataSetRBPr.Open;
        end;
end;

procedure TFormReeBolPrFill.BitBtn1Click(Sender: TObject);
var
  i, j, k: Integer;
begin
    if dxDBGridRb.SelectedCount<=0 then  Exit;
    pFIBQueryPutB.Transaction.StartTransaction;
    with dxDBGridRB.DataSource.DataSet do
      for i:=0 to dxDBGridRB.SelectedCount-1 do
      begin
           val(dxDBGridRB.SelectedNodes[i].Strings[0],j,k);
           if k=0 then
               if j>0 then
                  MarkBoln(j);
      end;
    pFIBQueryPutB.Transaction.Commit;
    Close;

end;

procedure TFormReeBolPrFill.MarkBoln(ShifrIdBoln:integer);
 var SQLStmnt:string;
 begin
      pFIBQueryPutB.SQL.Clear;
   //   SQLStmnt := 'update boln set shifridreb='+IntToStr(WantedShifrIdRee)+' where ShifrId='+IntToStr(ShifrIdBoln);
      SQLStmnt := 'select retval from PR_ADD_BOLN_TO_REE('+IntToStr(WantedShifrIdRee)+','+IntToStr(ShifrIdBoln)+')';
      pFIBQueryPutB.SQL.Add(SQLStmnt);
      pFIBQueryPutB.ExecQuery;
      pFIBQueryPutB.Close;


 end;


procedure TFormReeBolPrFill.RadioGroupMClick(Sender: TObject);
begin
      WantedMode:=RadioGroupM.ItemIndex;
      pFIBDataSetRBPr.Close;
      pFIBDataSetRBPr.Params[0].AsInteger:=WantedMode;
      pFIBDataSetRBPr.Params[1].AsInteger:=WantedMode;
      pFIBDataSetRBPr.Params[2].AsInteger:=WantedYear;
      pFIBDataSetRBPr.Params[3].AsInteger:=WantedMonth;
      pFIBDataSetRBPr.Open;
end;

end.
