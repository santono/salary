unit UFormOtpBSUpd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, dxCntner, dxEditor, dxExEdtr, dxDBEdtr, dxDBELib,
  cxCalendar, StdCtrls, Buttons;

type
  TFormOtpBSUpd = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOtpBSUpd: TFormOtpBSUpd;

implementation
  uses UFormOtpBSList,uFrmFindKadryFB,DB;

{$R *.dfm}

procedure TFormOtpBSUpd.ButtonFindClick(Sender: TObject);
var state: TDataSetState;
begin
    state := FormOtpBsList.dsOtpBS.State;
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     state := FormOtpBsList.dsOtpBS.State;
                     FormOtpBsList.dsOtpBSTABNO.Value := getTabno;
                     FormOtpBSList.dsOtpBSFIO.Value   := getFio;
               end;
         finally
{            free;}
         end;
       Self.Repaint;

end;

procedure TFormOtpBSUpd.BitBtnSaveClick(Sender: TObject);
begin
     if FormOtpBSList.dsOtpBS.State in [dsEdit,dsInsert] then
        FormOtpBSList.dsOtpBS.Post;
     Close;
end;

procedure TFormOtpBSUpd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if FormOtpBSList.dsOtpBS.State in [dsEdit,dsInsert] then
        FormOtpBSList.dsOtpBS.Cancel;

     Action:=caFree;
end;

end.
