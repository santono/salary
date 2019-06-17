unit UFormDekrUpd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, dxCntner, dxEditor, dxExEdtr, dxDBEdtr, dxDBELib,
  cxCalendar, StdCtrls, Buttons;

type
  TFormDekrUpd = class(TForm)
    cxDBMaskEditTabno: TcxDBMaskEdit;
    cxDBTextEditFIO: TcxDBTextEdit;
    cxDBTextEditINN: TcxDBTextEdit;
    dxDBLookupEditKind: TdxDBLookupEdit;
    cxDBTextEditNomerPrik: TcxDBTextEdit;
    cxDBDateEditDatePrik: TcxDBDateEdit;
    cxDBDateEditDateFR: TcxDBDateEdit;
    cxDBDateEditDateTo: TcxDBDateEdit;
    BitBtnSave: TBitBtn;
    BitBtnExit: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
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
  FormDekrUpd: TFormDekrUpd;

implementation
  uses UFormDekrList,uFrmFindKadryFB,DB;

{$R *.dfm}

procedure TFormDekrUpd.ButtonFindClick(Sender: TObject);
begin
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     FormDekrList.dsDekrTABNO.Value := getTabno;
                     FormDekrList.dsDekrFIO.Value   := getFio;
                     FormDekrList.dsDekrINN.Value   := GetNalCode;
               end;
         finally
{            free;}
         end;
       Self.Repaint;

end;

procedure TFormDekrUpd.BitBtnSaveClick(Sender: TObject);
begin
     if FormDekrList.dsDekr.State in [dsEdit,dsInsert] then
        FormDekrList.dsDekr.Post;
     Close;
end;

procedure TFormDekrUpd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if FormDekrList.dsDekr.State in [dsEdit,dsInsert] then
        FormDekrList.dsDekr.Cancel;

     Action:=caFree;
end;

end.
