unit UFormSubDepUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxCalc, StdCtrls, Buttons;

type
  TFormSubDepUpdate = class(TForm)
    cxDBCalcEdit1: TcxDBCalcEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure cxDBLookupComboBox2PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSubDepUpdate: TFormSubDepUpdate;

implementation
 uses UFormDepartmentBrowse,DB;

{$R *.dfm}

procedure TFormSubDepUpdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if FormDepartmentBrowse.dsDep.State in [dsEdit,dsInsert] then
         FormDepartmentBrowse.dsDep.Cancel;
      Action:=caFree;
end;

procedure TFormSubDepUpdate.BitBtn1Click(Sender: TObject);
begin
     FormDepartmentBrowse.dsDep.Post;
     FormDepartmentBrowse.dsDep.Refresh;
     Close;
end;

procedure TFormSubDepUpdate.BitBtn3Click(Sender: TObject);
begin
     FormDepartmentBrowse.dsDepIDOWNER.Clear;
     cxDBLookupComboBox1.Hide;
     cxDBLookupComboBox1.Enabled:=False;
     FormDepartmentBrowse.dsDepIDPODR.Clear;
     Application.ProcessMessages;
end;

procedure TFormSubDepUpdate.cxDBLookupComboBox2PropertiesChange(
  Sender: TObject);
begin
     if not FormDepartmentBrowse.dsDepIDOWNER.IsNull then
     if FormDepartmentBrowse.dsDepIDOWNER.Value>0 then
        begin
             if (cxDBLookupComboBox1.Visible=False) or
                (cxDBLookupComboBox1.Enabled=False) then
                begin
                     cxDBLookupComboBox1.Show;
                     cxDBLookupComboBox1.Enabled:=true;
                end;
        end;
end;

end.
