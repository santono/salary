unit UFormDepUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc;

type
  TFormDepUpdate = class(TForm)
    cxDBCalcEditId: TcxDBCalcEdit;
    cxDBTextEditName: TcxDBTextEdit;
    Rjl: TLabel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDepUpdate: TFormDepUpdate;

implementation
 uses UFormDepartmentBrowse,DB;

{$R *.dfm}

procedure TFormDepUpdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if FormDepartmentBrowse.dsDep.State in [dsEdit,dsInsert] then
         FormDepartmentBrowse.dsDep.Cancel;
      Action:=caFree;
end;

procedure TFormDepUpdate.BitBtn1Click(Sender: TObject);
begin
     FormDepartmentBrowse.dsDepIDOWNER.Clear;
     FormDepartmentBrowse.dsDepIDPODR.Clear;
     FormDepartmentBrowse.dsDep.Post;
     FormDepartmentBrowse.dsDep.Refresh;
     Close;
end;

end.
