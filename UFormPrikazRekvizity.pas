unit UFormPrikazRekvizity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxDBELib, dxCntner, dxEditor, StdCtrls,
  Buttons, dxExGrEd, dxExELib, cxGraphics, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, DBCtrls;

type
  TFormPrikazRekvizity = class(TForm)
    dxDBDateEdit1: TdxDBDateEdit;
    dxDBEdit1: TdxDBEdit;
    dxDBDateEdit2: TdxDBDateEdit;
    dxDBDateEdit3: TdxDBDateEdit;
    dxDBMemo1: TdxDBMemo;
    btn1    : TBitBtn;
    BitBtn1 : TBitBtn;
    Label1  : TLabel;
    Label2  : TLabel;
    Label3  : TLabel;
    Label4  : TLabel;
    Label5  : TLabel;
    Label6  : TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure dxDBExtLookupEdit1Change(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
        SQLAction:Integer; // 1=добавить 2-обновить
  public
      constructor createP(AOwner:TComponent;SQLAction:integer);
    { Public declarations }
  end;

var
  FormPrikazRekvizity: TFormPrikazRekvizity;

implementation
  uses UFibModule,UFormPrikazyBrowse,DB;

{$R *.dfm}

constructor TFormPrikazRekvizity.createP(AOwner:TComponent;SQLAction:integer);
 begin
      inherited Create(AOwner);
      Self.SQLAction:=SQLAction;
      if Self.SQLAction=1 then
         begin
              FormPrikazyBrowse.dsoPrikazy.DataSet.Append;
              FormPrikazyBrowse.dsPrikazyTABNO.Value      := FormPrikazyBrowse.getTabno;
              FormPrikazyBrowse.dsPrikazyDATAPRIK.Value   := Date;
              FormPrikazyBrowse.dsPrikazyDATABEG.Value    := Date;
              FormPrikazyBrowse.dsPrikazySHIFRIDTYP.value := 1;
              FormPrikazyBrowse.dsPrikazyDATAEND.Clear;
         end
      else
         FormPrikazyBrowse.dsoPrikazy.Edit;

 end;

procedure TFormPrikazRekvizity.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormPrikazRekvizity.btn1Click(Sender: TObject);
begin
     if FormPrikazyBrowse.dsoPrikazy.State in [dsEdit,dsInsert] then
        FormPrikazyBrowse.dsoPrikazy.DataSet.Post;
  //   FormPrikazyBrowse.dsoPrikazy.Browse;
     Close;
end;

procedure TFormPrikazRekvizity.dxDBExtLookupEdit1Change(Sender: TObject);
begin
     if SQLAction=1 then
        begin
             FormPrikazyBrowse.dsPrikazyCONTENT.Value :=
                FormPrikazyBrowse.dsPriTypeCONTENT.Value;
             Application.ProcessMessages;   
        end;
end;

procedure TFormPrikazRekvizity.DBLookupComboBox1Click(Sender: TObject);
begin
     FormPrikazyBrowse.dsPrikazyCONTENT.Value:=FormPrikazyBrowse.dsPriTypeCONTENT.Value;
     Application.ProcessMessages;
end;

end.
