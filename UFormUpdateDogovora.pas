unit UFormUpdateDogovora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib, cxMemo,
  cxDBEdit, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, Buttons;

type
  TFormUpdateDogovora = class(TForm)
    cxDBDateEditFr: TcxDBDateEdit;
    cxDBDateEditTo: TcxDBDateEdit;
    cxDBTextEditNomer: TcxDBTextEdit;
    cxDBMemoName: TcxDBMemo;
    BitBtnSave: TBitBtn;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure BitBtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    dbAction:integer;
    { Private declarations }
  public
    constructor init(AOwner:TComponent;dbAction:integer);
    { Public declarations }
  end;

var
  FormUpdateDogovora: TFormUpdateDogovora;

implementation
 uses UFormBrowseDogovora,USQLUnit,DB;

{$R *.dfm}
 constructor  TFormUpdateDogovora.init(AOwner:TComponent;dbAction:integer);
  var v:variant;
      id:integer;
      SQLStmnt:string;
  begin
       self.Create(AOwner);
       if (dbAction=1) then
           begin
                id:=0;
                SQLStmnt:='select max(id) from tb_dogovora_gn';
                v:=SQLQueryValue(SQLStmnt);
                if not VarIsNull(v) then
                if VarIsNumeric(v) then
                   id:=v;
                inc(id);
                FormBrowseDogovora.dsDogovora.Insert;
                FormBrowseDogovora.dsDogovoraID.Value:=id;
           end
       else
       if  (dbAction=2) then
          FormBrowseDogovora.dsDogovora.Edit;
  end;

procedure TFormUpdateDogovora.BitBtnSaveClick(Sender: TObject);
begin
     if (FormBrowseDogovora.dsDogovora.State=dsInsert) or
        (FormBrowseDogovora.dsDogovora.State=dsEdit) then
        FormBrowseDogovora.dsDogovora.Post;
     self.Close;

end;

procedure TFormUpdateDogovora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormUpdateDogovora.BitBtn1Click(Sender: TObject);
begin
     if (FormBrowseDogovora.dsDogovora.State<>dsBrowse) then
        FormBrowseDogovora.dsDogovora.Cancel;

end;

end.
