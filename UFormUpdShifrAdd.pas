unit UFormUpdShifrAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, dxEditor, dxCntner, StdCtrls,
  Buttons;

type
  TFormUpdShifrAdd = class(TForm)
    dxDBEdit1: TdxDBEdit;
    dxDBCalcEdit1: TdxDBCalcEdit;
    dxDBEdit2: TdxDBEdit;
    dxDBEdit3: TdxDBEdit;
    dxDBCheckEdit1: TdxDBCheckEdit;
    dxDBCheckEdit2: TdxDBCheckEdit;
    dxDBCheckEdit3: TdxDBCheckEdit;
    BitBtnSave: TBitBtn;
    BitBtnClose: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dxDBCheckEdit4: TdxDBCheckEdit;
    dxDBCheckEdit5: TdxDBCheckEdit;
    dxDBCheckEdit6: TdxDBCheckEdit;
    dxDBCheckEdit7: TdxDBCheckEdit;
    dxDBCheckEdit8: TdxDBCheckEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    dxDBCheckEdit9: TdxDBCheckEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdShifrAdd: TFormUpdShifrAdd;

implementation
  uses UFormEditShifr,UFibModule,DB;

{$R *.dfm}

procedure TFormUpdShifrAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormUpdShifrAdd.BitBtnSaveClick(Sender: TObject);
begin
     if FormEditShifr.pFIBDataSetAdd.State in [dsEdit,dsInsert] then
        FormEditShifr.pFIBDataSetAdd.Post;
     Close;   
end;

end.
