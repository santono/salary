unit UFormUpdZamDec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCalendar, cxDBEdit, cxGroupBox, cxRadioGroup,
  StdCtrls, Buttons, cxCalc;

type
  TFormUpdZamDec = class(TForm)
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBRadioGroup1: TcxDBRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    lbl1: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxDBCalcEdit1: TcxDBCalcEdit;
    Label4: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdZamDec: TFormUpdZamDec;

implementation
 uses UPODataModule,DB;

{$R *.dfm}

procedure TFormUpdZamDec.BitBtn1Click(Sender: TObject);
  var Proc:Real;
begin
      proc:=cxDBCalcEdit1.Value;
      if dmPO.pFIBdsZAMDec.State=dsBrowse then
         dmPO.pFIBdsZAMDec.Edit;
      dmPO.pFIBdsZAMDec.Post;
      dmPO.pFIBdsZamDec.Refresh;
      Close;

end;

end.
