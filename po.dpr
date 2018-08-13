program po;

uses
  Forms,
  MAIN in 'MAIN.pas' {MainForm},
  CHILDWIN in 'CHILDWIN.PAS' {MDIChild},
  about in 'about.pas' {AboutBox},
  UFibModule in 'UFibModule.pas' {FIB: TDataModule},
  UFormUnivBrowse in 'UFormUnivBrowse.pas' {FormUnivBrowse},
  UPODataModule in 'UPODataModule.pas' {dmPO: TDataModule},
  UPoSpr in 'UPoSpr.pas',
  UFormKKadry in 'UFormKKadry.pas' {FormKKadry},
  UFormSeekWidNadb in 'UFormSeekWidNadb.pas' {FormSeekWidNadb},
  UFormKadryUpd in 'UFormKadryUpd.pas' {FormKadryUpd},
  UFormMakeOrderToWord in 'UFormMakeOrderToWord.pas' {FormMakeOrderToWord},
  UFormShtRaspRecUpd in 'UFormShtRaspRecUpd.pas' {FormShtRaspRecUpd},
  UDBFilter in 'UDBFilter.pas',
  UFormCvtDatP in 'UFormCvtDatP.pas' {FormCvtDatP},
  UTFormPOUtility in 'UTFormPOUtility.pas' {FormUtility},
  uFormWait in 'uFormWait.pas' {FormWait},
  UFormShtRaspRpt in 'UFormShtRaspRpt.pas' {FormShtRaspRpt},
  UFormAskData in 'UFormAskData.pas' {FormAskData},
  UFormShtTst in 'UFormShtTst.pas' {FormShtTst},
  UFormCmp in 'UFormCmp.pas' {FormCmp},
  UFormPOMoveStagFromExcel in 'UFormPOMoveStagFromExcel.pas' {FormPOMoveStagFromExcel},
  UFormUpdFac in 'UFormUpdFac.pas' {FormUpdFac},
  UFormUpdZamDec in 'UFormUpdZamDec.pas' {FormUpdZamDec},
  UPadegDLL in 'UPadegDLL.pas',
  UFormRodDatPadeg in 'UFormRodDatPadeg.pas' {FormRodDatPadeg};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.CreateForm(TFIB, FIB);
  Application.CreateForm(TdmPO, dmPO);
  Application.CreateForm(TFormWait, FormWait);
  SprEditor:=TSprEditor.Create;
  Application.Run;
  SprEditor.Free;
end.
