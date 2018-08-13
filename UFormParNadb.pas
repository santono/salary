unit UFormParNadb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc, ExtCtrls;

type
  TFormParNadb = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    rgStep: TRadioGroup;
    rgZwan: TRadioGroup;
    rgStag: TRadioGroup;
    procedure cxCalcStagProcPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     StepValue : Integer;
     ZwanValue : Integer;
     StagValue : Integer;
    { Public declarations }
  end;

var
  FormParNadb: TFormParNadb;

implementation

{$R *.dfm}

procedure TFormParNadb.cxCalcStagProcPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
var a:Integer;
begin
     if not VarIsNumeric(DisplayValue) then
        begin
             Error:=True;
             ErrorText:='Неверное значение';
             Exit;
        end;
     a:=DisplayValue;
     
end;

procedure TFormParNadb.FormCreate(Sender: TObject);
begin
    rgStep.ItemIndex := 1;
    rgZwan.ItemIndex := 1;
    rgStag.ItemIndex := 3;
    StepValue := 1;
    ZwanValue := 1;
    StagValue := 3;
end;

procedure TFormParNadb.BitBtn1Click(Sender: TObject);
begin
     StepValue := rgStep.ItemIndex;
     ZwanValue := rgZwan.ItemIndex;
     StagValue := rgStag.ItemIndex;
     ModalResult:=mrOk;
end;

end.
