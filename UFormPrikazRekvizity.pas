unit UFormPrikazRekvizity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, dxCntner, dxEditor, StdCtrls,
  Buttons, dxExGrEd, dxExELib, cxGraphics, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DBCtrls;

type
  TFormPrikazRekvizity = class(TForm)
    dxDBDateEdit1: TdxDBDateEdit;
    dxDBEdit1: TdxDBEdit;
    dxDBDateEdit2: TdxDBDateEdit;
    dxDBDateEdit3: TdxDBDateEdit;
    dxDBMemo1: TdxDBMemo;
    btn1    : TBitBtn;
    BitBtn1 : TBitBtn;
    Label1  : TLabel;
    Label2  : TLabel;
    Label3  : TLabel;
    Label4  : TLabel;
    Label5  : TLabel;
    Label6  : TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    Label8: TLabel;
    dxDBSpinEditY: TdxDBSpinEdit;
    dxDBSpinEditM: TdxDBSpinEdit;
    Label9: TLabel;
    Label10: TLabel;
    LabelKodKP: TLabel;
    LabelKodZKPPTR: TLabel;
    LabelProf: TLabel;
    LabelDolg: TLabel;
    dxDBEditDolg: TdxDBEdit;
    BitBtnKP: TBitBtn;
    dxDBEditProf: TdxDBEdit;
    dxDBEditKodKP: TdxDBEdit;
    dxDBEditKodZKPPTR: TdxDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure dxDBExtLookupEdit1Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure BitBtnKPClick(Sender: TObject);
  private
    { Private declarations }
        SQLAction:Integer; // 1=добавить 2-обновить
        procedure ShowPerevodRekvizity;
        procedure HidePerevodRekvizity;

  public
      constructor createP(AOwner:TComponent;SQLAction:integer);
    { Public declarations }
  end;

var
  FormPrikazRekvizity: TFormPrikazRekvizity;

implementation
  uses UFibModule,UFormPrikazyBrowse,DB, UFormSearchClassificator,ScrDef;

{$R *.dfm}

constructor TFormPrikazRekvizity.createP(AOwner:TComponent;SQLAction:integer);
 begin
      inherited Create(AOwner);
      Self.SQLAction:=SQLAction;
//      if (FormPrikazyBrowse.dsPrikazySHIFRIDTYP.value=7) then
          ShowPerevodRekvizity;
//      else
//          HidePerevodRekvizity;
      if Self.SQLAction=1 then
         begin
              FormPrikazyBrowse.dsoPrikazy.DataSet.Append;
              FormPrikazyBrowse.dsPrikazyTABNO.Value      := FormPrikazyBrowse.getTabno;
              FormPrikazyBrowse.dsPrikazyDATAPRIK.Value   := Date;
              FormPrikazyBrowse.dsPrikazyDATABEG.Value    := Date;
              FormPrikazyBrowse.dsPrikazySHIFRIDTYP.value := 1;
              FormPrikazyBrowse.dsPrikazyDATAEND.Clear;
              FormPrikazyBrowse.dsPrikazyY.value:=curryear;
              FormPrikazyBrowse.dsPrikazyM.value:=NMES;
              FormPrikazyBrowse.dsPrikazyKODKP.clear;
              FormPrikazyBrowse.dsPrikazyKODZKPPTR.clear;
              FormPrikazyBrowse.dsPrikazyNAMEDOL.clear;
              FormPrikazyBrowse.dsPrikazyNAMEPROF.clear;
              FormPrikazyBrowse.dsPrikazyIDCLASSIFICATOR.clear;
         end
      else
         FormPrikazyBrowse.dsoPrikazy.Edit;

 end;

procedure TFormPrikazRekvizity.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormPrikazRekvizity.btn1Click(Sender: TObject);
begin
     if FormPrikazyBrowse.dsoPrikazy.State in [dsEdit,dsInsert] then
        FormPrikazyBrowse.dsoPrikazy.DataSet.Post;
  //   FormPrikazyBrowse.dsoPrikazy.Browse;
     Close;
end;

procedure TFormPrikazRekvizity.dxDBExtLookupEdit1Change(Sender: TObject);
begin
     if SQLAction=1 then
        begin
             FormPrikazyBrowse.dsPrikazyCONTENT.Value :=
                FormPrikazyBrowse.dsPriTypeCONTENT.Value;
             Application.ProcessMessages;   
        end;
end;

procedure TFormPrikazRekvizity.DBLookupComboBox1Click(Sender: TObject);
begin
//     FormPrikazyBrowse.dsPrikazyCONTENT.Value:=FormPrikazyBrowse.dsPriTypeCONTENT.Value;
//     if  (FormPrikazyBrowse.dsPrikazySHIFRIDTYP.Value=7) then
//         ShowPerevodRekvizity
//     else
//         HidePerevodRekvizity;

     Application.ProcessMessages;
end;

procedure TFormPrikazRekvizity.BitBtnKPClick(Sender: TObject);
var id:integer;
    kodKP,kodZKPPTR:string;
    nameProf:string;
begin
     Application.CreateForm(TFormSearchClassificator,FormSearchClassificator);
     if (FormPrikazyBrowse.dsPrikazyIDCLASSIFICATOR.Value>0) then
        begin
             FormSearchClassificator.dsClassificator.Locate('ID',FormPrikazyBrowse.dsPrikazyIDCLASSIFICATOR.Value,[]);
        end;
     if ( FormSearchClassificator.ShowModal() = mrOK ) then
        begin
             id        := FormSearchClassificator.dsClassificatorID.value;
             kodKp     := FormSearchClassificator.dsClassificatorKodKP.value;
             kodZKPPTR := FormSearchClassificator.dsClassificatorkodZKPPTR.value;
             nameProf  := FormSearchClassificator.dsClassificatorname.value;
             FormPrikazyBrowse.dsPrikazyIDCLASSIFICATOR.Value:=id;
             FormPrikazyBrowse.dsPrikazyKODKP.Value     := kodKp;
             FormPrikazyBrowse.dsPrikazyKODZKPPTR.Value := kodZKPPTR;
             FormPrikazyBrowse.dsPrikazyNAMEPROF.Value  := nameProf;
        end;
     FormSearchClassificator.dsClassificator.Transaction.Commit;
     FormSearchClassificator.dsClassificator.Close;
     FormSearchClassificator.Free;

end;
procedure TFormPrikazRekvizity.HidePerevodRekvizity;
  begin
       LabelKodKP.Hide;
       LabelKodKP.Enabled:=false;
       LabelKodZKPPTR.Hide;
       LabelKodZKPPTR.Enabled:=false;
       LabelProf.Hide;
       LabelProf.Enabled:=false;
       LabelDolg.Hide;
       LabelDolg.Enabled:=false;
       BitBtnKP.hide;
       BitBtnKP.Enabled:=false;
       dxDBEditProf.Hide;
       dxDBEditProf.Enabled:=false;
       dxDBEditDolg.Hide;
       dxDBEditDolg.Enabled:=false;
       dxDBEditKodKP.Hide;
       dxDBEditKodKP.Enabled:=false;
       dxDBEditKodZKPPTR.Hide;
       dxDBEditKodZKPPTR.Enabled:=false;
  end;
procedure TFormPrikazRekvizity.ShowPerevodRekvizity;
  begin
       LabelKodKP.Show;
       LabelKodZKPPTR.Show;
       LabelProf.Show;
       LabelDolg.Show;
       LabelDolg.Enabled:=true;
       BitBtnKP.Show;
       BitBtnKP.Enabled:=true;
       dxDBEditProf.Show;
       dxDBEditDolg.Show;
       dxDBEditDolg.Enabled:=true;
       dxDBEditKodKP.Show;
       dxDBEditKodZKPPTR.Show;
  end;


end.
