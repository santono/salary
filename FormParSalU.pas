unit FormParSalU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc, cxSpinEdit;

type
  TFormParSal = class(TForm)
    CheckBoxPodoh: TCheckBox;
    BitBtn1: TBitBtn;
    GroupBoxNalogi: TGroupBox;
    CheckBox1: TCheckBox;
    GroupBoxReCalc: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBoxBoln: TGroupBox;
    CheckBox5: TCheckBox;
    CheckBoxModeRecalcPerson: TCheckBox;
    CheckBoxNeedLogForRecalcNalogiPerson: TCheckBox;
    CheckBoxNeedDelOtherMonthNalogi: TCheckBox;
    Label1: TLabel;
    rgIOSQLMonitor: TRadioGroup;
    BitBtnChangeNMES: TBitBtn;
    BtnProtectedPodr: TBitBtn;
    cbRoundNalogi: TCheckBox;
    cxSpinEdit1: TcxSpinEdit;
    cbCheckMem: TCheckBox;
    PanelRepECB: TPanel;
    ButtonRepECB: TButton;
    cbneedSwodSQLLogByPerson: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnChangeNMESClick(Sender: TObject);
    procedure BtnProtectedPodrClick(Sender: TObject);
    procedure cxSpinEdit1PropertiesChange(Sender: TObject);
    procedure cbRoundNalogiClick(Sender: TObject);
    procedure ButtonRepECBClick(Sender: TObject);
  private
    procedure SetMultiLineButton(AParent: TWinControl) ;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormParSal : TFormParSal;

implementation
 uses scrdef, UFibModule, UFormChangeNMES,UFormECBMonthMenu;

{$R *.dfm}

procedure TFormParSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Must_Show_Podoh:=false;
     if CheckBoxPodoh.Checked then
        Must_Show_Podoh:=true;
     needTestMem:=false;
     if cbCheckMem.Checked then
        needTestMem:=true;
     needSwodSQLLogByPerson:=false;
     if cbneedSwodSQLLogByPerson.Checked then
        needSwodSQLLogByPerson:=true;
     if CheckBox5.Checked then
        NeedFileBolnMode:=true
     else
        NeedFileBolnMode:=false;
      if CheckBoxNeedLogForRecalcNalogiPerson.Checked then
         NeedLogForRecalculateNalogiPerson:=True
      else
         NeedLogForRecalculateNalogiPerson:=false;
      if CheckBoxModeRecalcPerson.Checked then
         ProgramForRecalcNalogi:=1
      else
         ProgramForRecalcNalogi:=0;
      if CheckBoxNeedDelOtherMonthNalogi.Checked then
         NeedDelOtherMonthNalogi:=True
      else
         NeedDelOtherMonthNalogi:=False;
      if rgIOSQLMonitor.ItemIndex=1 then
         UseIOSQLMonitorLevel:=1
      else
      if rgIOSQLMonitor.ItemIndex=2 then
         UseIOSQLMonitorLevel:=2
      else
         UseIOSQLMonitorLevel:=0;
     Action:=caFree;
end;

procedure TFormParSal.FormCreate(Sender: TObject);
begin
      CheckBoxPodoh.Checked:=false;
      if Must_Show_Podoh then
         CheckBoxPodoh.Checked:=true;
      if NeedFileBolnMode then
         CheckBox5.Checked:=true
      else
         CheckBox5.Checked:=false;
      if ProgramForRecalcNalogi=1 then
         CheckBoxModeRecalcPerson.Checked:=True
      else
         CheckBoxModeRecalcPerson.Checked:=False;
      if NeedLogForRecalculateNalogiPerson then
         CheckBoxNeedLogForRecalcNalogiPerson.Checked:=True
      else
         CheckBoxNeedLogForRecalcNalogiPerson.Checked:=False;
      if NeedDelOtherMonthNalogi then
         CheckBoxNeedDelOtherMonthNalogi.Checked:=True
      else
         CheckBoxNeedDelOtherMonthNalogi.Checked:=False;
      rgIOSQLMonitor.ItemIndex:=UseIOSQLMonitorLevel;

//      if ((isSVDN) and (not canViewProtectedPodr)) then
      if (not canViewProtectedPodr) then
         begin
              BtnProtectedPodr.Show;
              BtnProtectedPodr.Enabled:=true;
         end
      else
         begin
              BtnProtectedPodr.Hide;
              BtnProtectedPodr.Enabled:=false;
         end;

      Label1.Caption:='Количество транзакций SAL - '+IntToStr(FIB.pFIBDatabaseSal.ActiveTransactionCount)+'  SALARC-'+IntToStr(FIB.pFIBDatabaseArc.ActiveTransactionCount);
      if length(trim(passwordForChangeMonth))>0 then
         begin
              BitBtnChangeNMES.Show;
              BitBtnChangeNMES.Enabled:=true;
         end
      else
         begin
              BitBtnChangeNMES.hide;
              BitBtnChangeNMES.Enabled:=false;
         end;
      cxSpinEdit1.Value:=wantedRoundNalogiValue;
      cbRoundNalogi.Checked:=needRoundNalogiCalculation;
      if not needRoundNalogiCalculation then
         begin
              cxSpinEdit1.Hide;
              cxSpinEdit1.Enabled:=false;
         end;

     if needTestMem then
        cbCheckMem.Checked:=true
     else
        cbCheckMem.Checked:=false;
     if needSwodSQLLogByPerson then
        cbneedSwodSQLLogByPerson.Checked:=True
     else
        cbneedSwodSQLLogByPerson.Checked:=False;
     if isSVDN then
        begin
            PanelRepECB.Show;
            ButtonRepECB.Show;
            SetMultiLineButton(PanelRepECB);
        end
     else
        begin
            PanelRepECB.Hide;
            ButtonRepECB.Hide;
        end;


end;

procedure TFormParSal.FormShow(Sender: TObject);
begin
      CheckBoxPodoh.Checked:=false;
      if Must_Show_Podoh then
         CheckBoxPodoh.Checked:=true;
      if NeedFileBolnMode then
         CheckBox5.Checked:=true
      else
         CheckBox5.Checked:=false;
end;
procedure TFormParSal.BitBtnChangeNMESClick(Sender: TObject);
var s:string;
begin
     if length(trim(passwordForChangeMonth))<1 then exit;
     s:=inputBox('Авторизация доступа','Введите пароль','');
     if length(trim(s))<1 then exit;
     if trim(s)<>trim(passwordForChangeMonth) then Exit;
     Application.CreateForm(TFormChangeNMES,FormChangeNMES);
     FormChangeNMES.ShowModal;

end;

procedure TFormParSal.BtnProtectedPodrClick(Sender: TObject);
var s:string;
    pwd:string;
begin
     pwd:='280817';
     s:=inputBox('Авторизация доступа','Введите пароль','');
     if length(trim(s))<1  then exit;
     if trim(s)<>trim(pwd) then Exit;
     canViewProtectedPodr:=true;

end;

procedure TFormParSal.cxSpinEdit1PropertiesChange(Sender: TObject);
begin
     if not VarIsNumeric(cxSpinEdit1.Value) then exit;
     if ((cxSpinEdit1.Value<-2) or (cxSpinEdit1.Value>2)) then  exit;

     if cxSpinEdit1.Value<-2 then
        begin
             cxSpinEdit1.Value:=-2;
             wantedRoundNalogiValue:=-2;
        end
     else
     if cxSpinEdit1.Value>2 then
        begin
             cxSpinEdit1.Value:=2;
             wantedRoundNalogiValue:=2;
        end
     else
        begin
             wantedRoundNalogiValue:=cxSpinEdit1.Value;
        end;
end;

procedure TFormParSal.cbRoundNalogiClick(Sender: TObject);
begin
     if cbRoundNalogi.Checked then
        begin
             cxSpinEdit1.Show;
             cxSpinEdit1.Enabled:=true;
             needRoundNalogiCalculation:=true;
        end
     else
        begin
             cxSpinEdit1.Hide;
             cxSpinEdit1.Enabled:=false;
             needRoundNalogiCalculation:=false;
        end

end;

procedure TFormParSal.SetMultiLineButton(AParent: TWinControl);
var j : integer;
ah : THandle;
begin
     for j := 0 to AParent.ControlCount - 1 do
         if (AParent.Controls[j] is TButton) then
            begin
              ah := (AParent.Controls[j] as TButton).Handle;
              SetWindowLong(ah, GWL_STYLE,
              GetWindowLong(ah, GWL_STYLE) OR
              BS_MULTILINE) ;
            end;
end;

procedure TFormParSal.ButtonRepECBClick(Sender: TObject);
begin
     needMakeRepECBOldStyle:=True;
     ButtonRepECB.Enabled:=False;

end;

end.
