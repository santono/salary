unit UFormVyplLNR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  ExtCtrls, DBCtrls, StdCtrls, Buttons, Menus;

type
  TFormVyplLNR = class(TForm)
    dtZA: TDateTimePicker;
    dsVypl: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsoVypl: TDataSource;
    dsVyplID: TFIBIntegerField;
    dsVyplYZA: TFIBSmallIntField;
    dsVyplMZA: TFIBSmallIntField;
    dsVyplYVY: TFIBSmallIntField;
    dsVyplMVY: TFIBSmallIntField;
    dsVyplPROCENT: TFIBBCDField;
    dsVyplCOMMENT: TFIBStringField;
    dsVyplNOMER: TFIBSmallIntField;
    dsVyplDATAVYPL: TFIBDateField;
    DBNavigator1: TDBNavigator;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1ID: TdxDBGridMaskColumn;
    dxDBGrid1YZA: TdxDBGridMaskColumn;
    dxDBGrid1MZA: TdxDBGridMaskColumn;
    dxDBGrid1YVY: TdxDBGridMaskColumn;
    dxDBGrid1MVY: TdxDBGridMaskColumn;
    dxDBGrid1PROCENT: TdxDBGridCurrencyColumn;
    dxDBGrid1COMMENT: TdxDBGridMaskColumn;
    dxDBGrid1NOMER: TdxDBGridMaskColumn;
    dxDBGrid1DATAVYPL: TdxDBGridDateColumn;
    BitBtn1: TBitBtn;
    dsVyplSUMMA: TFIBBCDField;
    dsVyplSUMMAVYPL: TFIBBCDField;
    dsVyplSUMMANEVYPL: TFIBBCDField;
    dxDBGrid1Summa: TdxDBGridColumn;
    dxDBGrid1SummaVypl: TdxDBGridColumn;
    dxDBGrid1SummaNeVypl: TdxDBGridColumn;
    dsVyplISUNIVER: TFIBSmallIntField;
    dxDBGrid1IsUniv: TdxDBGridCheckColumn;
    dsVyplISDEBET: TFIBSmallIntField;
    dxDBGrid1IsDebet: TdxDBGridCheckColumn;
    pm1: TPopupMenu;
    mniG1: TMenuItem;
    mniExcel1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure mniExcel1Click(Sender: TObject);
  private
    { Private declarations }
       CurrYearVypl  : word;
       CurrMonthVypl : word;
  public
    { Public declarations }
  end;

var
  FormVyplLNR: TFormVyplLNR;

implementation
  uses UFibModule,ScrDef,DateUtils, UFormVyplLNRUpd,
  UFormMoveVyplFromExcel;

{$R *.dfm}

procedure TFormVyplLNR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if dsVypl.Active then
        dsVypl.Close;
     if dsVypl.Transaction.Active then
        dsVypl.Transaction.Commit;
     if dsVypl.UpdateTransaction.Active then
        dsVypl.UpdateTransaction.Commit;
    Action:=caFree;
end;

procedure TFormVyplLNR.FormCreate(Sender: TObject);
begin
     CurrYearVypl:=CURRYEAR;
     CurrMonthVypl:=NMES;
     dtZA.Date:=EncodeDate(CurrYearVypl,CurrMonthVypl,1);
     if dsVypl.Active then
        dsVypl.Close;
     if dsVypl.Transaction.Active then
        dsVypl.Transaction.Commit;
     if dsVypl.UpdateTransaction.Active then
        dsVypl.UpdateTransaction.Commit;
     dsVypl.Transaction.StartTransaction;
     dsVypl.Params[0].Value := CurrYearVypl;
     dsVypl.Params[1].Value := CurrMonthVypl;
     dsVypl.Open;
end;

procedure TFormVyplLNR.BitBtn1Click(Sender: TObject);
begin
     if ((yearOf (dtZA.Date)<>CurrYearVypl) or
         (monthOf(dtZA.Date)<>CurrMonthVypl)) then
       begin
            dsVypl.Close;
            CurrYearVypl  := yearOf (dtZA.Date);
            CurrMonthVypl := monthOf(dtZA.Date);
            dsVypl.Params[0].Value := CurrYearVypl;
            dsVypl.Params[1].Value := CurrMonthVypl;
            dsVypl.Open;
       end

end;

procedure TFormVyplLNR.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
  var SQLAction:Integer;
  begin
     SqlAction:=0;
     case Button of
      nbInsert: SQLAction:=1;
      nbEdit:SQLACtion:=2;
      else
          Exit;
     end;
     if SQLAction=1 then
        begin
             dsVypl.Append;
             dsVyplYZA.Value         := CurrYearVypl;
             dsVyplMza.Value         := CurrMonthVypl;
             dsVyplYVY.Value         := CurrYearVypl;
             dsVyplMVy.Value         := CurrMonthVypl;
             dsVyplISUNIVER.Value    := 1;
             dsVyplPROCENT.Value     := 0;
             dsVyplCOMMENT.Value     := '';
             dsVyplSUMMA.Value       := 0;
             dsVyplSUMMAVYPL.Value   := 0;
             dsVyplSUMMANEVYPL.Value := 0;
             dsVyplDATAVYPL.Value    := EncodeDate(CurrYearVypl,CurrMonthVypl,1);
             dsVyplIsDebet.Value     := 0;
             dsVyplNOMER.Value       := 1; 
        end
     else
        dsVypl.Edit;
     Application.CreateForm(TFormVyplLNRUpd,FormVyplLNRUpd);
     FormVyplLNRUpd.ShowModal;

  end;


procedure TFormVyplLNR.mniExcel1Click(Sender: TObject);
begin
      Application.CreateForm(TFormMoveVyplFromExcel,FormMoveVyplFromExcel);
      FormMoveVyplFromExcel.ShowModal;
end;

end.
