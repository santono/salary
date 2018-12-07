unit UFormUpdateDogovoraDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxMemo, cxDBEdit, cxCalendar, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc, Buttons;

type
  TFormUpdateDogovoraDet = class(TForm)
    cxDBCalcEditTabno: TcxDBCalcEdit;
    cxDBTextEditFIO: TcxDBTextEdit;
    cxDBDateEditDateFr: TcxDBDateEdit;
    cxDBDateEditDateTo: TcxDBDateEdit;
    cxDBMemoReasonOk: TcxDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtnSave: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtnFindKadry: TBitBtn;
    cxDBTextEditNomer: TcxDBTextEdit;
    Label6: TLabel;
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnFindKadryClick(Sender: TObject);
  private
    { Private declarations }
  public
    constructor init(AOwner:TComponent;dbAction:integer);
    { Public declarations }
  end;

var
  FormUpdateDogovoraDet: TFormUpdateDogovoraDet;

implementation
{$R *.dfm}

uses DB,
     uFrmFindKadryFB,
     UFormBrowseDogovoraDet,USQLUnit, UFormBrowseDogovora;

 constructor  TFormUpdateDogovoraDet.init(AOwner:TComponent;dbAction:integer);
  var v:variant;
      id:integer;
      SQLStmnt:string;
  begin
       self.Create(AOwner);
       if (dbAction=1) then
           begin
                id:=0;
                SQLStmnt:='select max(id) from tb_dogovora_gn_det';
                v:=SQLQueryValue(SQLStmnt);
                if not VarIsNull(v) then
                if VarIsNumeric(v) then
                   id:=v;
                inc(id);
                FormBrowseDogovoraDet.dsDogovoraDet.Insert;
                FormBrowseDogovoraDet.dsDogovoraDetID.Value:=id;
                FormBrowseDogovoraDet.dsDogovoraDetIDDOG.Value:=FormBrowseDogovora.dsDogovoraID.value;
                FormBrowseDogovoraDet.dsDogovoraDetNOMER.Value:=FormBrowseDogovora.dsDogovoraNOMER.value;
           end
       else
       if  (dbAction=2) then
          FormBrowseDogovoraDet.dsDogovoraDet.Edit;
       cxDBCalcEditTabno.Enabled:=false;
       cxDBTextEditFIO.Enabled:=false;
       Caption:='Реквизиты совместителя по договору'+trim(FormBrowseDogovora.dsDogovoraNOMER.value);
  end;


procedure TFormUpdateDogovoraDet.BitBtnSaveClick(Sender: TObject);
begin
     if (FormBrowseDogovoraDet.dsDogovoraDet.State=dsInsert) or
        (FormBrowseDogovoraDet.dsDogovoraDet.State=dsEdit) then
        FormBrowseDogovoraDet.dsDogovoraDet.Post;
     self.Close;

end;

procedure TFormUpdateDogovoraDet.BitBtn2Click(Sender: TObject);
begin
     if (FormBrowseDogovoraDet.dsDogovoraDet.State<>dsBrowse) then
        FormBrowseDogovoraDet.dsDogovoraDet.Cancel;

end;

procedure TFormUpdateDogovoraDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormUpdateDogovoraDet.BitBtnFindKadryClick(Sender: TObject);
var ks,gs:string;
begin
    FormBrowseDogovoraDet.dsDogovoraDetFIO.Value:='';
    FormBrowseDogovoraDet.dsDogovoraDetTABNO.Value:=0;
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     FormBrowseDogovoraDet.dsDogovoraDetTABNO.Value:=GetTabno;
                     FormBrowseDogovoraDet.dsDogovoraDetFIO.Value:=GetFio;
               end;
         finally
{            free;}
         end;
       Self.Repaint;

end;

end.
