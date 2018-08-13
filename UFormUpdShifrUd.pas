unit UFormUpdShifrUd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, dxEditor, dxCntner, StdCtrls,
  Buttons;

type
  TFormUpdShifrUd = class(TForm)
    dxDBEdit1: TdxDBEdit;
    dxDBCalcEdit1: TdxDBCalcEdit;
    dxDBEdit2: TdxDBEdit;
    dxDBEdit3: TdxDBEdit;
    BitBtnSave: TBitBtn;
    BitBtnClose: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdShifrUd: TFormUpdShifrUd;

implementation
  uses UFormEditShifr,UFibModule,DB;

{$R *.dfm}

procedure TFormUpdShifrUd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormUpdShifrUd.BitBtnSaveClick(Sender: TObject);
begin
     if FormEditShifr.pFIBDataSetAdd.State in [dsEdit,dsInsert] then
        FormEditShifr.pFIBDataSetAdd.Post;
     Close;   
end;

end.
