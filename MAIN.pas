unit MAIN;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,
  ActnList, ToolWin, ImgList;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FileOpenItem: TMenuItem;
    Help1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    HelpAboutItem: TMenuItem;
    OpenDialog: TOpenDialog;
    Edit1: TMenuItem;
    CutItem: TMenuItem;
    CopyItem: TMenuItem;
    PasteItem: TMenuItem;
    StatusBar: TStatusBar;
    ActionList1: TActionList;
    FileExit1: TAction;
    FileOpen1: TAction;
    HelpAbout1: TAction;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ImageList1: TImageList;
    actSprWUS: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    actSprWN: TAction;
    N4: TMenuItem;
    actSprWUZ: TAction;
    N5: TMenuItem;
    actSprWUSPr: TAction;
    N6: TMenuItem;
    actKadryEdit: TAction;
    N7: TMenuItem;
    actSprPodr: TAction;
    actSprPodr1: TMenuItem;
    actShtatRaspPedBrowse: TAction;
    N9: TMenuItem;
    N10: TMenuItem;
    actOrderBrowse: TAction;
    actStartConvertToWord: TAction;
    actCvtDatP: TAction;
    N8: TMenuItem;
    actSprWidyZasl: TAction;
    N11: TMenuItem;
    actUtility: TAction;
    N12: TMenuItem;
    N13: TMenuItem;
    actCmpSht: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    actFindKoefGt1: TAction;
    N16: TMenuItem;
    actExl: TAction;
    N17: TMenuItem;
    ActMoveStagFromExcel: TAction;
    Excel1: TMenuItem;
    ActSprFacList: TAction;
    N18: TMenuItem;
    actZamDec: TAction;
    N19: TMenuItem;
    actMakeRodDatPadegh: TAction;
    N20: TMenuItem;
    procedure FileNew1Execute(Sender: TObject);
    procedure FileOpen1Execute(Sender: TObject);
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FileExit1Execute(Sender: TObject);
    procedure actSprWUSExecute(Sender: TObject);
    procedure actSprWNExecute(Sender: TObject);
    procedure actSprWUZExecute(Sender: TObject);
    procedure actSprWUSPrExecute(Sender: TObject);
    procedure actKadryEditExecute(Sender: TObject);
    procedure actSprPodrExecute(Sender: TObject);
    procedure actShtatRaspPedBrowseExecute(Sender: TObject);
    procedure actOrderBrowseExecute(Sender: TObject);
    procedure actCvtDatPExecute(Sender: TObject);
    procedure actSprWidyZaslExecute(Sender: TObject);
    procedure actUtilityExecute(Sender: TObject);
    procedure actCmpShtExecute(Sender: TObject);
    procedure actFindKoefGt1Execute(Sender: TObject);
    procedure actExlExecute(Sender: TObject);
    procedure ActMoveStagFromExcelExecute(Sender: TObject);
    procedure ActSprFacListExecute(Sender: TObject);
    procedure actZamDecExecute(Sender: TObject);
    procedure actMakeRodDatPadeghExecute(Sender: TObject);
  private
    { Private declarations }
    procedure CreateMDIChild(const Name: string);
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
 
{$R *.dfm}

uses CHILDWIN, about, UPoSpr, UFormKKadry,UDBFilter, UFormCvtDatP,
  UTFormPOUtility,UFormCmp, UFormShtTst, UFormPOMoveStagFromExcel,
  UFormRodDatPadeg;

procedure TMainForm.CreateMDIChild(const Name: string);
var
  Child: TMDIChild;
begin
  { create a new MDI child window }
  Child := TMDIChild.Create(Application);
  Child.Caption := Name;
  if FileExists(Name) then Child.Memo1.Lines.LoadFromFile(Name);
end;

procedure TMainForm.FileNew1Execute(Sender: TObject);
begin
  CreateMDIChild('NONAME' + IntToStr(MDIChildCount + 1));
end;

procedure TMainForm.FileOpen1Execute(Sender: TObject);
begin
  if OpenDialog.Execute then
    CreateMDIChild(OpenDialog.FileName);
end;

procedure TMainForm.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.FileExit1Execute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.actSprWUSExecute(Sender: TObject);
begin
     SprEditor.StartWUSSpr;
end;

procedure TMainForm.actSprWNExecute(Sender: TObject);
begin
     SprEditor.StartWNSpr;
end;

procedure TMainForm.actSprWUZExecute(Sender: TObject);
begin
     SprEditor.StartWUZSpr;
end;

procedure TMainForm.actSprWUSPrExecute(Sender: TObject);
begin
     SprEditor.StartWUSPrSpr;
end;

procedure TMainForm.actKadryEditExecute(Sender: TObject);
  var DBPodrFilter : TDBPodrFilter;
begin
     Application.CreateForm(TFormKKadry,FormKKadry);
     DBPodrFilter:=TDBPodrFilter.Create;
     FormKKadry.SetFilter(DBPodrFilter);
     FormKKadry.ShowModal;
     DBPodrFilter.Free;
end;

procedure TMainForm.actSprPodrExecute(Sender: TObject);
begin
     SprEditor.StartPodrSpr;
end;

procedure TMainForm.actShtatRaspPedBrowseExecute(Sender: TObject);
begin
     SprEditor.StartShtatRaspPed;
end;

procedure TMainForm.actOrderBrowseExecute(Sender: TObject);
begin
     SprEditor.StartOrderBrowse;
end;

procedure TMainForm.actCvtDatPExecute(Sender: TObject);
begin
     Application.CreateForm(TFormCvtDatP,FormCvtDatP);
     FormCvtDatP.SHowModal;

end;

procedure TMainForm.actSprWidyZaslExecute(Sender: TObject);
begin
     SprEditor.StartWidyZasl;
end;

procedure TMainForm.actUtilityExecute(Sender: TObject);
begin
     Application.CreateForm(TFormUtility,FormUtility);
     FormUtility.ShowModal;

end;

procedure TMainForm.actCmpShtExecute(Sender: TObject);
begin
     Application.CreateForm(TFormCmp,FormCmp);
     FormCmp.Showmodal;
end;

procedure TMainForm.actFindKoefGt1Execute(Sender: TObject);
begin
     Application.CreateForm(TFormShtTst,FormShtTst);
     FormShtTst.Showmodal;
end;

procedure TMainForm.actExlExecute(Sender: TObject);
begin
     SprEditor.StartExlSpr;
end;

procedure TMainForm.ActMoveStagFromExcelExecute(Sender: TObject);
begin
     Application.CreateForm(TFormPOMoveStagFromExcel,FormPOMoveStagFromExcel);
     FormPOMoveStagFromExcel.ShowModal;
end;

procedure TMainForm.ActSprFacListExecute(Sender: TObject);
begin
     SprEditor.StartFacSpr;
end;

procedure TMainForm.actZamDecExecute(Sender: TObject);
begin
     SprEditor.StartZamDecSpr;
end;

procedure TMainForm.actMakeRodDatPadeghExecute(Sender: TObject);
begin
     Application.CreateForm(TFormRodDatPadeg,FormRodDatPadeg);
     FormRodDatPadeg.Showmodal;

end;

end.
