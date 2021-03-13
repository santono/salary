{$WARNINGS OFF}
{$HINTS OFF}
unit UFormBrowsePrikazyTyp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFormBrowsePrikazyTyp = class(TForm)
    dsoPriType: TDataSource;
    DBNavigator1: TDBNavigator;
    dsPriType: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsPriTypeID: TFIBIntegerField;
    dsPriTypeNAME: TFIBStringField;
    dsPriTypeCONTENT: TFIBStringField;
    dxDBGridPriType: TdxDBGrid;
    dxDBGridPriTypeID: TdxDBGridMaskColumn;
    dxDBGridPriTypeNAME: TdxDBGridMaskColumn;
    dxDBGridPriTypeCONTENT: TdxDBGridMaskColumn;
    dsPriTypeNEEDT5: TFIBIntegerField;
    dsPriTypeZO: TFIBIntegerField;
    dsPriTypeVS: TFIBIntegerField;
    dsPriTypePIR: TFIBIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBrowsePrikazyTyp: TFormBrowsePrikazyTyp;

implementation
 uses UFibModule, UFormUpdPriType;

{$R *.dfm}

procedure TFormBrowsePrikazyTyp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if dsPriType.Active then
        dsPriType.Close;
     if dsPriType.Transaction.Active then
        dsPriType.Transaction.Commit;
     if dsPriType.UpdateTransaction.Active then
        dsPriType.UpdateTransaction.Commit;

     Action:=caFree;
end;

procedure TFormBrowsePrikazyTyp.FormCreate(Sender: TObject);
begin
     if dsPriType.Active then
        dsPriType.Close;
     if dsPriType.Transaction.Active then
        dsPriType.Transaction.Commit;
     if dsPriType.UpdateTransaction.Active then
        dsPriType.UpdateTransaction.Commit;
     dsPriType.Transaction.StartTransaction;
     dsPriType.Open;
end;

procedure TFormBrowsePrikazyTyp.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
     case Button of
      nbInsert : dsPriType.Insert;
      nbEdit   : dsPriType.Edit;
     end;
     if ((Button=nbInsert) or (Button=nbEdit)) then
        begin
             Application.CreateForm(TFormUpdPriType,FormUpdPriType);
             FormUpdPriType.ShowModal;
        end;
end;

end.
