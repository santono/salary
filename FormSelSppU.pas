unit FormSelSppU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner;

type
  TFormSelSPP = class(TForm)
    pFIBDataSetSPP: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetSPPSHIFRID: TFIBSmallIntField;
    pFIBDataSetSPPNAME: TFIBStringField;
    pFIBDataSetSPPUK: TFIBStringField;
    pFIBDataSetSPPPRIM: TFIBStringField;
    DataSourceSBB: TDataSource;
    dxDBGridSBB: TdxDBGrid;
    dxDBGridSBBSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSBBNAME: TdxDBGridMaskColumn;
    dxDBGridSBBUK: TdxDBGridMaskColumn;
    dxDBGridSBBPRIM: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function Execute:integer;
    procedure dxDBGridSBBDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    RetVal:integer;
    { Public declarations }
  end;

var
  FormSelSPP: TFormSelSPP;

implementation

   uses UFibModule;
{$R *.dfm}

procedure TFormSelSPP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetSPP.Active then
        pFIBDataSetSPP.Active:=false;
     if pFIBDataSetSPP.Transaction.Active then
        pFIBDataSetSPP.Transaction.Commit;
      Action:=caFree;
end;

procedure TFormSelSPP.FormCreate(Sender: TObject);
begin
     if pFIBDataSetSPP.Active then
        pFIBDataSetSPP.Active:=false;
     if pFIBDataSetSPP.Transaction.Active then
        pFIBDataSetSPP.Transaction.Commit;
     pFIBDataSetSPP.Transaction.StartTransaction;
     pFIBDataSetSPP.Active:=true;
end;
function TFormSelSPP.Execute:integer;
 begin
      Application.ProcessMessages;
      Self.Visible:=false;
      if ShowModal=mrOk then Result:=RetVal
                        else Result:=0;
 end;

procedure TFormSelSPP.dxDBGridSBBDblClick(Sender: TObject);
begin
     RetVal:=pFIBDataSetSPPSHIFRID.AsInteger;
     ModalResult:=mrOk
end;

end.
