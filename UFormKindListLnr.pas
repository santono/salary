unit UFormKindListLnr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ComCtrls,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, StdCtrls, ExtCtrls, DBCtrls;

type
  TFormKindListLnr = class(TForm)
    dsAUP: TpFIBDataSet;
    trAUPWrite: TpFIBTransaction;
    trAUPRead: TpFIBTransaction;
    dsAUPTABNO: TFIBIntegerField;
    dsAUPDOLG: TFIBStringField;
    dsAUPKIND: TFIBIntegerField;
    dsAUPFIO: TFIBStringField;
    RadioGroup1: TRadioGroup;
    dxDBGrid1: TdxDBGrid;
    dsoAUP: TDataSource;
    dxDBGrid1TABNO: TdxDBGridMaskColumn;
    dxDBGrid1DOLG: TdxDBGridMaskColumn;
    dxDBGrid1KIND: TdxDBGridMaskColumn;
    dxDBGrid1FIO: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormKindListLnr: TFormKindListLnr;

implementation
  uses UFibModule;

{$R *.dfm}

procedure TFormKindListLnr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      dsAUP.Close;
      dsAUP.Transaction.Commit;
      Action:=caFree;

end;

procedure TFormKindListLnr.RadioGroup1Click(Sender: TObject);
begin
     dsAUP.Close;
     dsAUP.Params[0].AsInteger:=RadioGroup1.ItemIndex+1;
     dsAUP.Prepare;
     dsAUP.Open;

end;

procedure TFormKindListLnr.FormCreate(Sender: TObject);
begin
      RadioGroup1.ItemIndex:=1;
      dsAUP.Transaction.StartTransaction;
      dsAUP.Params[0].AsInteger:=2;
      dsAUP.Open;
end;

end.
