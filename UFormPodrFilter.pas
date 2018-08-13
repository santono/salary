unit UFormPodrFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFormPodrFilter = class(TForm)
    dxDBGrid: TdxDBGrid;
    dxDBGridSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridNAME: TdxDBGridMaskColumn;
    dxDBGridNAME_K: TdxDBGridMaskColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    IOpen:Boolean;
  public
    { Public declarations }
  end;

var
  FormPodrFilter: TFormPodrFilter;

implementation
  uses UPODataModule;

{$R *.dfm}

procedure TFormPodrFilter.FormCreate(Sender: TObject);
begin
      IOpen:=False;
      if dmPO.pFIBdsPodr.Active then Exit;
      dmPO.pFIBdsPodr.Transaction.StartTransaction;
      dmPO.pFIBdsPodr.Open;
      IOpen:=True;

end;


procedure TFormPodrFilter.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if not IOpen then Exit;
     dmPO.pFIBdsPodr.Close;
     dmPO.pFIBdsPodr.Transaction.Commit;
     Action:=caFree;
end;

end.
