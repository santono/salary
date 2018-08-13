unit UFormUpdFac;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxDBEdit, StdCtrls,
  Buttons, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFormUpdFac = class(TForm)
    cxDBTextEdit1: TcxDBTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    Label5: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdFac: TFormUpdFac;

implementation
  uses UPODataModule,DB;

{$R *.dfm}

procedure TFormUpdFac.BitBtn1Click(Sender: TObject);
begin
     if dmPO.pFIBdsFacList.State=dsBrowse then
        dmPO.pFIBdsFacList.Edit;
     dmPO.pFIBdsFacList.Post;
     dmPO.pFIBdsFacList.Close;
     dmPO.pFIBdsFacList.Open;
     Close;
end;

end.
