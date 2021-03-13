unit UFormPrikazRekvizity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, dxCntner, dxEditor, StdCtrls,
  Buttons, dxExGrEd, dxExELib, cxGraphics, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DBCtrls, ComCtrls, ExtCtrls, cxCheckBox, cxDBEdit,
  DB, DBClient;

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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dxDBEdit2: TdxDBEdit;
    dxDBEdit3: TdxDBEdit;
    dxDBEdit4: TdxDBEdit;
    dxDBEdit5: TdxDBEdit;
    BitBtnKPOld: TBitBtn;
    Panel1: TPanel;
    cbNeedT5: TcxDBCheckBox;
    dsoZO: TDataSource;
    cdsZO: TClientDataSet;
    cdsZOZO: TIntegerField;
    cdsZOname: TStringField;
    gbT5: TGroupBox;
    Label15: TLabel;
    cbVS: TcxDBCheckBox;
    cbPIR: TcxDBCheckBox;
    cbZO: TcxDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure dxDBExtLookupEdit1Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure BitBtnKPClick(Sender: TObject);
    procedure BitBtnKPOldClick(Sender: TObject);
    procedure cbNeedT5PropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
        SQLAction:Integer; // 1=�������� 2-��������
        procedure ShowPerevodRekvizity;
        procedure HidePerevodRekvizity;
        procedure getClassificator(mode:integer);
  public
      constructor createP(AOwner:TComponent;SQLAction:integer);
    { Public declarations }
  end;

var
  FormPrikazRekvizity: TFormPrikazRekvizity;

implementation
  uses UFibModule,UFormPrikazyBrowse, UFormSearchClassificator,ScrDef;

{$R *.dfm}

constructor TFormPrikazRekvizity.createP(AOwner:TComponent;SQLAction:integer);
 begin
      inherited Create(AOwner);
      Self.SQLAction:=SQLAction;
//      if (FormPrikazyBrowse.dsPrikazySHIFRIDTYP.value=TYP_PRIKAZA_PEREVOD) then
    //      ShowPerevodRekvizity;
//          HidePerevodRekvizity;
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
              FormPrikazyBrowse.dsPrikazyZO.clear;
              FormPrikazyBrowse.dsPrikazyVS.clear;
              FormPrikazyBrowse.dsPrikazyPIR.clear;
         end
      else
         FormPrikazyBrowse.dsoPrikazy.Edit;
      if (FormPrikazyBrowse.dsPrikazySHIFRIDTYP.value=TYP_PRIKAZA_PEREVOD) then
          ShowPerevodRekvizity
      else
          HidePerevodRekvizity;
      BitBtnKPOld.Caption:='�������������'+#13#10+'������'+#13#10+'���������';
      BitBtnKP.Caption:='�������������'+#13#10+'�����'+#13#10+'���������';
      if FormPrikazyBrowse.dsPrikazyNEEDT5.Value=1 then
         gbT5.Show
      else
         gbT5.Hide;
      cdsZO.Append;
      cdsZOZO.Value:=0;
      cdsZOname.Value:='�� �������';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=1;
      cdsZOname.Value:='������ ���������� � �������� �������';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=2;
      cdsZOname.Value:='������ ���������� (��� ������� ������)';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=3;
      cdsZOname.Value:='������� ���';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=4;
      cdsZOname.Value:='�������� �� ������� �i� 3 �� 6 ����';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=5;
      cdsZOname.Value:='�����, ���� ������ �������� �� �������� � �������';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=6;
      cdsZOname.Value:='�������� �� ������� �� 3-� ����';
      cdsZO.Post;



 end;

procedure TFormPrikazRekvizity.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if FormPrikazyBrowse.dsoPrikazy.State in [dsEdit,dsInsert] then
         FormPrikazyBrowse.dsPrikazy.Cancel;
      cdsZO.Close;
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
             if FormPrikazyBrowse.dsPriTypeNEEDT5.Value=1 then
                begin
                   FormPrikazyBrowse.dsPrikazyNEEDT5.Value:=1;
                   FormPrikazyBrowse.dsPrikazyZO.Value:=FormPrikazyBrowse.dsPriTypeZO.Value;
                   FormPrikazyBrowse.dsPrikazyVS.Value:=FormPrikazyBrowse.dsPriTypeVS.Value;
                   FormPrikazyBrowse.dsPrikazyPIR.Value:=FormPrikazyBrowse.dsPriTypePIR.Value;
                end
             else
                begin
                   FormPrikazyBrowse.dsPrikazyNEEDT5.Value:=0;
                   FormPrikazyBrowse.dsPrikazyZO.Value:=0;
                   FormPrikazyBrowse.dsPrikazyVS.Value:=0;
                   FormPrikazyBrowse.dsPrikazyPIR.Value:=0;
                end;
             if FormPrikazyBrowse.dsPrikazyNEEDT5.Value=1 then
                gbT5.Show
             else
                gbT5.Hide;
             Application.ProcessMessages;
        end;
end;

procedure TFormPrikazRekvizity.DBLookupComboBox1Click(Sender: TObject);
begin
     FormPrikazyBrowse.dsPrikazyCONTENT.Value:=FormPrikazyBrowse.dsPriTypeCONTENT.Value;
     if  (FormPrikazyBrowse.dsPrikazySHIFRIDTYP.Value=TYP_PRIKAZA_PEREVOD) then
         ShowPerevodRekvizity
     else
         HidePerevodRekvizity;
     if FormPrikazyBrowse.dsPriTypeNEEDT5.Value=1 then
        begin
             FormPrikazyBrowse.dsPrikazyNEEDT5.Value:=1;
             FormPrikazyBrowse.dsPrikazyZO.Value:=FormPrikazyBrowse.dsPriTypeZO.Value;
             FormPrikazyBrowse.dsPrikazyVS.Value:=FormPrikazyBrowse.dsPriTypeVS.Value;
             FormPrikazyBrowse.dsPrikazyPIR.Value:=FormPrikazyBrowse.dsPriTypePIR.Value;
        end
     else
        begin
             FormPrikazyBrowse.dsPrikazyNEEDT5.Value:=0;
             FormPrikazyBrowse.dsPrikazyZO.Value:=0;
             FormPrikazyBrowse.dsPrikazyVS.Value:=0;
             FormPrikazyBrowse.dsPrikazyPIR.Value:=0;
        end;
      if FormPrikazyBrowse.dsPrikazyNEEDT5.Value=1 then
         gbT5.Show
      else
         gbT5.Hide;


     Application.ProcessMessages;
end;

procedure TFormPrikazRekvizity.BitBtnKPClick(Sender: TObject);
begin
     Self.getClassificator(1);
(*
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
*)

end;
procedure TFormPrikazRekvizity.BitBtnKPOldClick(Sender: TObject);
begin
     Self.getClassificator(2);

end;
procedure TFormPrikazRekvizity.getClassificator(mode:integer);
var id:integer;
    kodKP,kodZKPPTR:string;
    nameProf:string;
    valueId:integer;
begin
     if mode = 2 then   //  2- old dolg
        valueId := FormPrikazyBrowse.dsPrikazyIDCLASSIFICATOR_OLD.Value
     else
        valueId := FormPrikazyBrowse.dsPrikazyIDCLASSIFICATOR.Value;
     Application.CreateForm(TFormSearchClassificator,FormSearchClassificator);
     if (valueId>0) then
        FormSearchClassificator.dsClassificator.Locate('ID',valueId,[]);
     if ( FormSearchClassificator.ShowModal() = mrOK ) then
        begin
             id        := FormSearchClassificator.dsClassificatorID.value;
             kodKp     := FormSearchClassificator.dsClassificatorKodKP.value;
             kodZKPPTR := FormSearchClassificator.dsClassificatorkodZKPPTR.value;
             nameProf  := FormSearchClassificator.dsClassificatorname.value;
             if mode = 2 then
                begin
                      FormPrikazyBrowse.dsPrikazyIDCLASSIFICATOR_OLD.Value:=id;
                      FormPrikazyBrowse.dsPrikazyKODKP_OLD.Value     := kodKp;
                      FormPrikazyBrowse.dsPrikazyKODZKPPTR_OLD.Value := kodZKPPTR;
                      FormPrikazyBrowse.dsPrikazyNAMEPROF_OLD.Value  := nameProf;
                end
             else
                begin
                      FormPrikazyBrowse.dsPrikazyIDCLASSIFICATOR.Value:=id;
                      FormPrikazyBrowse.dsPrikazyKODKP.Value     := kodKp;
                      FormPrikazyBrowse.dsPrikazyKODZKPPTR.Value := kodZKPPTR;
                      FormPrikazyBrowse.dsPrikazyNAMEPROF.Value  := nameProf;
                end;
        end;
     FormSearchClassificator.dsClassificator.Transaction.Commit;
     FormSearchClassificator.dsClassificator.Close;
     FormSearchClassificator.Free;

end;

procedure TFormPrikazRekvizity.HidePerevodRekvizity;
  begin
       PageControl1.Pages[1].TabVisible:=false;
(*
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
*)
  end;
procedure TFormPrikazRekvizity.ShowPerevodRekvizity;
  begin
       PageControl1.Pages[1].TabVisible:=true;
(*
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
*)       
  end;


procedure TFormPrikazRekvizity.cbNeedT5PropertiesEditValueChanged(
  Sender: TObject);
begin
     if cbNeedT5.Checked then
        gbT5.Show
     else
        gbT5.Hide;
     Application.ProcessMessages;   

end;

end.

