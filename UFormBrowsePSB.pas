unit UFormBrowsePSB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, ExtCtrls, DBCtrls, dxTL, dxDBCtrl, dxDBGrid, dxCntner, ToolWin,
  ComCtrls, ImgList, ActnList;

type
  TFormBrowsePSB = class(TForm)
    dsPSB: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsoPSB: TDataSource;
    dsPSBNOMER_SCHETA: TFIBStringField;
    dsPSBFAM: TFIBStringField;
    dsPSBNAM: TFIBStringField;
    dsPSBOTC: TFIBStringField;
    dsPSBREZIDENT: TFIBStringField;
    dsPSBPASSPORT: TFIBStringField;
    dsPSBTABNO: TFIBIntegerField;
    dsPSBSNILS: TFIBStringField;
    dsPSBINN: TFIBStringField;
    dsPSBID: TFIBIntegerField;
    dxGridPSB: TdxDBGrid;
    dxGridPSBNOMER_SCHETA: TdxDBGridMaskColumn;
    dxGridPSBFAM: TdxDBGridMaskColumn;
    dxGridPSBNAM: TdxDBGridMaskColumn;
    dxGridPSBOTC: TdxDBGridMaskColumn;
    dxGridPSBREZIDENT: TdxDBGridMaskColumn;
    dxGridPSBPASSPORT: TdxDBGridMaskColumn;
    dxGridPSBTABNO: TdxDBGridMaskColumn;
    dxGridPSBSNILS: TdxDBGridMaskColumn;
    dxGridPSBINN: TdxDBGridMaskColumn;
    dxGridPSBID: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    ToolBar1: TToolBar;
    il1: TImageList;
    ActionList1: TActionList;
    ActionAddRecord: TAction;
    ActionUpdateRecord: TAction;
    ActionDeleteRecord: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionAbsentToExcel: TAction;
    ToolButton4: TToolButton;
    procedure ActionAddRecordExecute(Sender: TObject);
    procedure ActionDeleteRecordExecute(Sender: TObject);
    procedure ActionUpdateRecordExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsPSBSNILSSetText(Sender: TField; const Text: String);
    procedure ActionAbsentToExcelExecute(Sender: TObject);
  private
    { Private declarations }
    procedure seePSBRecord(ActionClarion:integer);

  public
    { Public declarations }
  end;

var
  FormBrowsePSB: TFormBrowsePSB;

implementation

uses UFormUpdatePSB,ScrUtil, UFormRepAbsentPSB;

{$R *.dfm}
procedure TFormBrowsePSB.seePSBRecord(ActionClarion:integer);
begin
     if ActionClarion=3 then
        begin
             if YesNo('Удалить запись?') then
                dsoPSB.DataSet.Delete;
             Exit;
        end;
      FormUpdatePSB:=TFormUpdatePSB.myCreate(ActionClarion);
      FormUpdatePSB.ShowModal;
end;



procedure TFormBrowsePSB.ActionAddRecordExecute(Sender: TObject);
begin
     seePSBRecord(1);
end;

procedure TFormBrowsePSB.ActionDeleteRecordExecute(Sender: TObject);
begin
     seePSBRecord(3);
end;

procedure TFormBrowsePSB.ActionUpdateRecordExecute(Sender: TObject);
begin
     seePSBRecord(2);
end;

procedure TFormBrowsePSB.FormCreate(Sender: TObject);
begin
     dsPSB.Transaction.StartTransaction;
     dsPSB.Open;

end;

procedure TFormBrowsePSB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsPSB.Close;
     dsPSB.Transaction.Commit;
     Action:=caFree;

end;

procedure TFormBrowsePSB.dsPSBSNILSSetText(Sender: TField;
  const Text: String);
begin
      if Trim(Text) = '-   -' then
         Sender.AsString := ''
      else
//     if not (maskutils.FormatMaskText(Sender.EditMask, '') = Text) then
        Sender.AsString := Text;
end;

procedure TFormBrowsePSB.ActionAbsentToExcelExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRepAbsentPSB,FormRepAbsentPSB);
     FormRepAbsentPSB.showModal;
end;

end.
