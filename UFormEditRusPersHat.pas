unit UFormEditRusPersHat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, dxExEdtr, ExtCtrls, DBCtrls, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ToolWin, ComCtrls, dxDBTLCl, dxGrClms, ActnList;

type
  TFormEditRusPersHat = class(TForm)
    IL1: TImageList;
    ToolBar1: TToolBar;
    dsRusPersHat: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dxDBGridRusPersHat: TdxDBGrid;
    DBNavigator1: TDBNavigator;
    dsoRusPersHat: TDataSource;
    dsRusPersHatSHIFRID: TFIBIntegerField;
    dsRusPersHatY: TFIBIntegerField;
    dsRusPersHatM: TFIBIntegerField;
    dsRusPersHatNMBOFREC: TFIBIntegerField;
    dsRusPersHatSUMMA: TFIBBCDField;
    dxDBGridRusPersHatSHIFRID: TdxDBGridMaskColumn;
    dxDBGridRusPersHatY: TdxDBGridMaskColumn;
    dxDBGridRusPersHatM: TdxDBGridMaskColumn;
    dxDBGridRusPersHatNMBOFREC: TdxDBGridMaskColumn;
    dxDBGridRusPersHatSUMMA: TdxDBGridCurrencyColumn;
    ActionList1: TActionList;
    ActionNewList: TAction;
    ActionBrowseDet: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionNewListExecute(Sender: TObject);
    procedure ActionBrowseDetExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormEditRusPersHat: TFormEditRusPersHat;

implementation

uses UFormMakeRusPersForMonthYear,UFormBrowseRusPersDet,uFibModule;

{$R *.dfm}

procedure TFormEditRusPersHat.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsRusPersHat.Close;
     dsRusPersHat.Transaction.Commit;
     Action:=caFree;
end;


procedure TFormEditRusPersHat.ActionNewListExecute(Sender: TObject);
begin
     Application.CreateForm(TFormMakeRusPersForMonthYear,FormMakeRusPersForMonthYear);
     FormMakeRusPersForMonthYear.showModal;
end;

procedure TFormEditRusPersHat.ActionBrowseDetExecute(Sender: TObject);
var y,m,shifridowner:Integer;
begin
     shifridowner:=dsRusPersHatSHIFRID.Value;
     y:=dsRusPersHatY.Value;
     m:=dsRusPersHatm.Value;
     if not ((y>2020) and (m>0) and (shifridowner>0)) then
        begin
             ShowMessage('Укажите отчет');
             Exit;
        end;
     FormBrowseRusPersDet:=TFormBrowseRusPersDet.myCreate(Self,shifridowner,y,m);
     FormBrowseRusPersDet.ShowModal;
end;

procedure TFormEditRusPersHat.FormCreate(Sender: TObject);
begin
     dsRusPersHat.Transaction.StartTransaction;
     dsRusPersHat.Open;

end;




end.
