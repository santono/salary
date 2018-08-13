unit UFormSelSelection;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, DB, FIBDataSet,
  FIBDatabase, pFIBDatabase, pFIBDataSet;

type
  TFormSelSelection = class(TForm)
    pFIBDataSetSelSel: TpFIBDataSet;
    pFIBTransactionSelSel: TpFIBTransaction;
    DataSourceSelSel: TDataSource;
    pFIBDataSetSelSelSHIFRID: TFIBIntegerField;
    pFIBDataSetSelSelNAME: TFIBStringField;
    dxDBGridSelSel: TdxDBGrid;
    dxDBGridSelSelSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSelSelNAME: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dxDBGridSelSelDblClick(Sender: TObject);
    function Execute:integer;
  private
    { Private declarations }
  public
    RetVal:integer;
    WantedMode:integer; {1 Список подразделений 2 список счетов }
    { Public declarations }
  end;

var
  FormSelSelection: TFormSelSelection;

implementation

{$R *.dfm}

  uses UFIBModule;

procedure TFormSelSelection.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if pFIBDataSetSelSel.Active then
         pFIBDataSetSelSel.Close;
     if pFIBDataSetSelSel.Transaction.Active then
        pFIBDataSetSelSel.Transaction.Commit;
     Action:=caFree;
end;

procedure TFormSelSelection.FormCreate(Sender: TObject);
begin
     RetVal:=0;
     if pFIBDataSetSelSel.Active then
        pFIBDataSetSelSel.Close;
     if not pFIBDataSetSelSel.Transaction.Active then
        pFIBDataSetSelSel.Transaction.StartTransaction;
     WantedMode:=1;
end;


procedure TFormSelSelection.dxDBGridSelSelDblClick(Sender: TObject);
begin
     RetVal:=pFIBDataSetSelSelSHIFRID.AsInteger;
     ModalResult:=mrOk
{     Close;}
end;

function TFormSelSelection.Execute:integer;
 begin
      if WantedMode=2 then Self.Caption:='Выбор списка счетов'
                      else Self.Caption:='Выбор списка подразделений';
      Application.ProcessMessages;
      pFIBDataSetSelSel.Params[0].AsInteger:=WantedMode; { Код списка подразделений }
      pFIBDataSetSelSel.Prepare;
      pFIBDataSetSelSel.Open;
      Self.Visible:=false;
      if ShowModal=mrOk then Result:=RetVal
                        else Result:=0;
 end;


end.
