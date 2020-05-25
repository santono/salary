unit UFormUpdateNadbPlanoviy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, StdCtrls,
  Buttons, cxMaskEdit, cxDropDownEdit, cxCalc;

type
  TFormUpdateNadbPlanoviy = class(TForm)
    Label1: TLabel;
    cxDBTextEditFIO: TcxDBTextEdit;
    cxDBTextEditTabno: TcxDBTextEdit;
    cxDBCalcEditProc: TcxDBCalcEdit;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabelFioSal: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdateNadbPlanoviy: TFormUpdateNadbPlanoviy;

implementation
  USes UFormBrowseNadbPlanoviy,ScrUtil,uFrmFindKadryFB,DB;

{$R *.dfm}

procedure TFormUpdateNadbPlanoviy.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if FormBrowseNadbPlanoviy.dsNadb.State<>dsBrowse then
        FormBrowseNadbPlanoviy.dsNadb.Cancel;
     Action:=caFree;
end;

procedure TFormUpdateNadbPlanoviy.FormCreate(Sender: TObject);
begin
     LabelFioSal.Caption:='';
     if FormBrowseNadbPlanoviy.dsNadbTABNO.AsInteger>0 then
        LabelFioSal.Caption:=GetFullRusFioPerson(FormBrowseNadbPlanoviy.dsNadbTABNO.AsInteger);
     FormBrowseNadbPlanoviy.dsNadb.Edit;
end;

procedure TFormUpdateNadbPlanoviy.BitBtn1Click(Sender: TObject);
begin
     if FormBrowseNadbPlanoviy.dsNadb.State=dsEdit then
        FormBrowseNadbPlanoviy.dsNadb.Post;
     self.Close;
end;

procedure TFormUpdateNadbPlanoviy.BitBtn3Click(Sender: TObject);
var ks,gs:string;
begin
 //   LabelFio.Caption:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     FormBrowseNadbPlanoviy.dsNadbTabno.AsInteger:=GetTabno;
                     LabelFioSal.Caption:=GetFio;
               end;
         finally
{            free;}
         end;
       Self.Repaint;
end;

end.
