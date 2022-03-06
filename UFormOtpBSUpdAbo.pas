unit UFormOtpBSUpdAbo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, dxCntner, dxEditor, dxExEdtr, dxDBEdtr, dxDBELib,
  cxCalendar, StdCtrls, Buttons;

type
  TFormOtpBSUpdAbo = class(TForm)
    cxDBMaskEditTabno: TcxDBMaskEdit;
    cxDBTextEditFIO: TcxDBTextEdit;
    cxDBTextEditNomerPrik: TcxDBTextEdit;
    cxDBDateEditDatePrik: TcxDBDateEdit;
    cxDBDateEditDateFR: TcxDBDateEdit;
    cxDBDateEditDateTo: TcxDBDateEdit;
    BitBtnSave: TBitBtn;
    BitBtnExit: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ButtonFind: TButton;
    procedure ButtonFindClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOtpBSUpdAbo: TFormOtpBSUpdAbo;

implementation
  uses UFormOtpBSListAbo,uFrmFindKadryFB,DB;

{$R *.dfm}

procedure TFormOtpBSUpdAbo.ButtonFindClick(Sender: TObject);
var state: TDataSetState;
begin
    state := FormOtpBsListAbo.dsOtpBS.State;
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     state := FormOtpBsListAbo.dsOtpBS.State;
                     FormOtpBsListAbo.dsOtpBSTABNO.Value := getTabno;
                     FormOtpBSListAbo.dsOtpBSFIO.Value   := getFio;
               end;
         finally
{            free;}
         end;
       Self.Repaint;

end;

procedure TFormOtpBSUpdAbo.BitBtnSaveClick(Sender: TObject);
begin
     if FormOtpBSListAbo.dsOtpBS.State in [dsEdit,dsInsert] then
        FormOtpBSListAbo.dsOtpBS.Post;
     Close;
end;

procedure TFormOtpBSUpdAbo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if FormOtpBSListAbo.dsOtpBS.State in [dsEdit,dsInsert] then
        FormOtpBSListAbo.dsOtpBS.Cancel;

     Action:=caFree;
end;

procedure TFormOtpBSUpdAbo.FormCreate(Sender: TObject);
begin
     Caption:='Реквизиты отпуска без оплаты '+IntToStr(FormOtpBsListAbo.dsOtpBSTABNO.value)+' '+Trim(FormOtpBsListAbo.dsOtpBSFIO.Value);
end;

end.
