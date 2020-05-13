unit UFormPrikazRekvizityTot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, dxCntner, dxEditor, StdCtrls,
  Buttons, dxExGrEd, dxExELib, cxGraphics, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DBCtrls, ComCtrls, ExtCtrls;

type
  TFormPrikazRekvizityTot = class(TForm)
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
    Label7  : TLabel;
    Label8  : TLabel;
    dxDBSpinEditY: TdxDBSpinEdit;
    dxDBSpinEditM: TdxDBSpinEdit;
    Label9  : TLabel;
    Label10 : TLabel;
    LabelKodKP: TLabel;
    LabelKodZKPPTR: TLabel;
    LabelProf: TLabel;
    LabelDolg: TLabel;
    dxDBEditDolg: TdxDBEdit;
    BitBtnKP: TBitBtn;
    dxDBEditProf: TdxDBEdit;
    dxDBEditKodKP: TdxDBEdit;
    dxDBEditKodZKPPTR: TdxDBEdit;
    BitBtnFIO: TBitBtn;
    LabelFIO: TLabel;
    PageControl1: TPageControl;
    tbDolg: TTabSheet;
    tbDolgOld: TTabSheet;
    Label1KodKpOld: TLabel;
    Label1ZKPOld: TLabel;
    Label1DolgOld: TLabel;
    LabelProfOld: TLabel;
    dsEditKodKpOld: TdxDBEdit;
    dxEditZkpOld: TdxDBEdit;
    dxDBEdit2: TdxDBEdit;
    dxDBEditProfOld: TdxDBEdit;
    BitBtnKPOld: TBitBtn;
    Panel1: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure dxDBExtLookupEdit1Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure BitBtnKPClick(Sender: TObject);
    procedure BitBtnKPOldClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnFIOClick(Sender: TObject);
  private
    { Private declarations }
//        SQLAction:Integer; // 1=добавить 2-обновить
        procedure ShowPerevodRekvizity;
        procedure HidePerevodRekvizity;
        procedure getClassificator(mode:integer);


  public
//      constructor createP(AOwner:TComponent;SQLAction:integer);
    { Public declarations }
  end;

var
  FormPrikazRekvizityTot: TFormPrikazRekvizityTot;

implementation
  uses UFibModule,UFormPrikazyBrowseTot,DB, UFormSearchClassificator,ScrDef, uFrmFindKadryFB, scrUtil;

{$R *.dfm}

(*
constructor TFormPrikazRekvizityTot.createP(AOwner:TComponent;SQLAction:integer);
 begin
      inherited Create(AOwner);
      Self.SQLAction:=SQLAction;
//      if (FormPrikazyBrowse.dsPrikazySHIFRIDTYP.value=TYP_PRIKAZA_PEREVOD) then
          ShowPerevodRekvizity;
//      else
//          HidePerevodRekvizity;
      if Self.SQLAction=1 then
         begin
              FormPrikazyBrowseTot.dsoPrikazy.DataSet.Append;
              FormPrikazyBrowseTot.dsPrikazyTABNO.Value      := FormPrikazyBrowseTot.getTabno;
              FormPrikazyBrowseTot.dsPrikazyDATAPRIK.Value   := Date;
              FormPrikazyBrowseTot.dsPrikazyDATABEG.Value    := Date;
              FormPrikazyBrowseTot.dsPrikazySHIFRIDTYP.value := 1;
              FormPrikazyBrowseTot.dsPrikazyDATAEND.Clear;
              FormPrikazyBrowseTot.dsPrikazyY.value:=curryear;
              FormPrikazyBrowseTot.dsPrikazyM.value:=NMES;
              FormPrikazyBrowseTot.dsPrikazyKODKP.clear;
              FormPrikazyBrowseTot.dsPrikazyKODZKPPTR.clear;
              FormPrikazyBrowseTot.dsPrikazyNAMEDOL.clear;
              FormPrikazyBrowseTot.dsPrikazyNAMEPROF.clear;
              FormPrikazyBrowseTot.dsPrikazyIDCLASSIFICATOR.clear;
         end
      else
         FormPrikazyBrowseTot.dsoPrikazy.Edit;

 end;
*)
procedure TFormPrikazRekvizityTot.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if FormPrikazyBrowseTot.dsoPrikazy.State in [dsEdit,dsInsert] then
         FormPrikazyBrowseTot.dsPrikazy.Cancel;
      Action:=caFree;
end;

procedure TFormPrikazRekvizityTot.btn1Click(Sender: TObject);
begin
     if FormPrikazyBrowseTot.dsoPrikazy.State in [dsEdit,dsInsert] then
        FormPrikazyBrowseTot.dsoPrikazy.DataSet.Post;
  //   FormPrikazyBrowse.dsoPrikazy.Browse;
     Close;
end;

procedure TFormPrikazRekvizityTot.dxDBExtLookupEdit1Change(Sender: TObject);
begin
     if FormPrikazyBrowseTot.dsoPrikazy.state=dsInsert then
        begin
             FormPrikazyBrowseTot.dsPrikazyCONTENT.Value :=
                FormPrikazyBrowseTot.dsPriTypeCONTENT.Value;
             Application.ProcessMessages;
        end;
end;

procedure TFormPrikazRekvizityTot.DBLookupComboBox1Click(Sender: TObject);
begin
     FormPrikazyBrowseTot.dsPrikazyCONTENT.Value:=FormPrikazyBrowseTot.dsPriTypeCONTENT.Value;
     if  (FormPrikazyBrowseTot.dsPrikazySHIFRIDTYP.Value=TYP_PRIKAZA_PEREVOD) then
         ShowPerevodRekvizity
     else
         HidePerevodRekvizity;

     Application.ProcessMessages;
end;

procedure TFormPrikazRekvizityTot.BitBtnKPClick(Sender: TObject);
begin
     self.getClassificator(1);
(*
     Application.CreateForm(TFormSearchClassificator,FormSearchClassificator);
     if (FormPrikazyBrowseTot.dsPrikazyIDCLASSIFICATOR.Value>0) then
        begin
             FormSearchClassificator.dsClassificator.Locate('ID',FormPrikazyBrowseTot.dsPrikazyIDCLASSIFICATOR.Value,[]);
        end;
     if ( FormSearchClassificator.ShowModal() = mrOK ) then
        begin
             id        := FormSearchClassificator.dsClassificatorID.value;
             kodKp     := FormSearchClassificator.dsClassificatorKodKP.value;
             kodZKPPTR := FormSearchClassificator.dsClassificatorkodZKPPTR.value;
             nameProf  := FormSearchClassificator.dsClassificatorname.value;
             FormPrikazyBrowseTot.dsPrikazyIDCLASSIFICATOR.Value:=id;
             FormPrikazyBrowseTot.dsPrikazyKODKP.Value     := kodKp;
             FormPrikazyBrowseTot.dsPrikazyKODZKPPTR.Value := kodZKPPTR;
             FormPrikazyBrowseTot.dsPrikazyNAMEPROF.Value  := nameProf;
        end;
     FormSearchClassificator.dsClassificator.Transaction.Commit;
     FormSearchClassificator.dsClassificator.Close;
     FormSearchClassificator.Free;
*)

end;

procedure TFormPrikazRekvizityTot.BitBtnKPOldClick(Sender: TObject);
begin
     self.getClassificator(2);

end;

procedure TFormPrikazRekvizityTot.getClassificator(mode:integer);
var id:integer;
    kodKP,kodZKPPTR:string;
    nameProf:string;
    valueId:integer;
begin
     if mode = 2 then   //  2- old dolg
        valueId := FormPrikazyBrowseTot.dsPrikazyIDCLASSIFICATOR_OLD.Value
     else
        valueId := FormPrikazyBrowseTot.dsPrikazyIDCLASSIFICATOR.Value;
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
                      FormPrikazyBrowseTot.dsPrikazyIDCLASSIFICATOR_OLD.Value:=id;
                      FormPrikazyBrowseTot.dsPrikazyKODKP_OLD.Value     := kodKp;
                      FormPrikazyBrowseTot.dsPrikazyKODZKPPTR_OLD.Value := kodZKPPTR;
                      FormPrikazyBrowseTot.dsPrikazyNAMEPROF_OLD.Value  := nameProf;
                end
             else
                begin
                      FormPrikazyBrowseTot.dsPrikazyIDCLASSIFICATOR.Value:=id;
                      FormPrikazyBrowseTot.dsPrikazyKODKP.Value     := kodKp;
                      FormPrikazyBrowseTot.dsPrikazyKODZKPPTR.Value := kodZKPPTR;
                      FormPrikazyBrowseTot.dsPrikazyNAMEPROF.Value  := nameProf;
                end;
        end;
     FormSearchClassificator.dsClassificator.Transaction.Commit;
     FormSearchClassificator.dsClassificator.Close;
     FormSearchClassificator.Free;

end;


procedure TFormPrikazRekvizityTot.HidePerevodRekvizity;
  begin
       PageControl1.Pages[1].TabVisible:=False;
   //    PageControl1.Pages[1].Name  TabVisible:=False;
       Application.ProcessMessages;

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
procedure TFormPrikazRekvizityTot.ShowPerevodRekvizity;
  begin
       PageControl1.Pages[1].TabVisible:=true;
       Application.ProcessMessages;
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


procedure TFormPrikazRekvizityTot.FormCreate(Sender: TObject);
begin
      LabelFio.Caption:='Укажите сотрудника';
      if FormPrikazyBrowseTot.dsoPrikazy.State=dsInsert then
         begin
              FormPrikazyBrowseTot.dsPrikazyDATAPRIK.Value   := Date;
              FormPrikazyBrowseTot.dsPrikazyDATABEG.Value    := Date;
              FormPrikazyBrowseTot.dsPrikazyY.Value          := curryear;
              FormPrikazyBrowseTot.dsPrikazyM.Value          := nmes;
         end
      else
      if FormPrikazyBrowseTot.dsoPrikazy.State=dsEdit then
         begin
              if FormPrikazyBrowseTot.dsPrikazyTabno.Value  >0 then
                 if isLNR then
                    labelFio.Caption:=intToSTr(FormPrikazyBrowseTot.dsPrikazyTabno.Value)+' '+GetFullRusFioPerson(FormPrikazyBrowseTot.dsPrikazyTabno.Value)
                 else
                    labelFio.Caption:=intToSTr(FormPrikazyBrowseTot.dsPrikazyTabno.Value)+' '+GetFullUkrFioPerson(FormPrikazyBrowseTot.dsPrikazyTabno.Value);
         end;
      if (FormPrikazyBrowseTot.dsPrikazySHIFRIDTYP.value=TYP_PRIKAZA_PEREVOD) then
          ShowPerevodRekvizity
      else
          HidePerevodRekvizity;
      BitBtnKPOld.Caption:='Классификатор'+#13#10+'старой'+#13#10+'должности';
      BitBtnKP.Caption:='Классификатор'+#13#10+'новой'+#13#10+'должности';

end;

procedure TFormPrikazRekvizityTot.BitBtnFIOClick(Sender: TObject);
var ks,gs:string;
begin
 //   LabelFio.Caption:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     FormPrikazyBrowseTot.dsPrikazyTABNO.Value:=GetTabno;
                     LabelFio.Caption:=IntToStr(GetTabno)+' '+Trim(getFio);
               end;
         finally
{            free;}
         end;
       Self.Repaint;
end;


end.
