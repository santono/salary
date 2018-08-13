unit UFormRestorePodr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TFormRestorePodr = class(TForm)
    LabelCurrPodr: TLabel;
    PanelCurr: TPanel;
    Label1: TLabel;
    LabelCurrNmb: TLabel;
    PanelSaved: TPanel;
    Label2: TLabel;
    LabelSavedPodr: TLabel;
    LabelSavedNmb: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRestorePodr: TFormRestorePodr;

implementation

{$R *.dfm}
  uses ScrDef,ScrUtil;

procedure TFormRestorePodr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormRestorePodr.FormCreate(Sender: TObject);
 var HTmp:PERSON_PTR;
begin
     LabelCurrPodr.Caption:=NAME_SERV(NSRV);
     LabelCurrNMB.Caption:='Число строк '+IntToStr(Count_Person);
     if SavedPodr=0 then
        begin
             LabelSavedPodr.Caption:='Данные по подразделению не сохранялись';
             LabelSavedNmb.Caption:='';
             BitBtn1.Enabled:=false;
             BitBtn1.Hide;
        end
     else
        begin
             LabelSavedPodr.Caption:=NAME_SERV(SavedPodr);
             Htmp:=HEAD_PERSON;
             HEAD_PERSON:=HEAD_PERSON_SAVE;
             LabelSavedNMB.Caption:='Число строк '+IntToStr(Count_Person);
             HEAD_PERSON:=Htmp;
             BitBtn1.Enabled:=true;
             BitBtn1.Show;
        end;
end;

procedure TFormRestorePodr.BitBtn1Click(Sender: TObject);
begin
     if SavedPodr<1 then Exit;
     RestorePodr;
     Self.Close;
end;

end.
