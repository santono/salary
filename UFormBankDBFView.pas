{$WARNINGS OFF}
{$HINTS OFF}
unit UFormBankDBFView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, DB, DBTables, ImgList, ToolWin, ComCtrls, ActnList, StdCtrls;

type
  TFormBankDBFView = class(TForm)
    Table1: TTable;
    DataSource1: TDataSource;
    Table1LINENO: TFloatField;
    Table1TABNO: TFloatField;
    Table1FIO: TStringField;
    Table1SUMMA: TFloatField;
    Table1ID: TStringField;
    Table1GRU_NAME: TStringField;
    Table1NAME_WP: TStringField;
    Table1DATA: TDateField;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1LINENO: TdxDBGridMaskColumn;
    dxDBGrid1TABNO: TdxDBGridMaskColumn;
    dxDBGrid1FIO: TdxDBGridMaskColumn;
    dxDBGrid1SUMMA: TdxDBGridMaskColumn;
    dxDBGrid1ID: TdxDBGridMaskColumn;
    dxDBGrid1GRU_NAME: TdxDBGridMaskColumn;
    dxDBGrid1NAME_WP: TdxDBGridMaskColumn;
    dxDBGrid1DATA: TdxDBGridDateColumn;
    Table1FIOWIN: TStringField;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actOpenDBF: TAction;
    actCopyToFlash: TAction;
    btnOpenDBF: TToolButton;
    btnCopyToFlash: TToolButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Table1FIOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure actOpenDBFExecute(Sender: TObject);
    procedure actCopyToFlashExecute(Sender: TObject);
    procedure Table1NAME_WPGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBankDBFView: TFormBankDBFView;

implementation
 uses ScrUtil,ScrDef;

{$R *.dfm}

procedure TFormBankDBFView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if Table1.Active=true then
        Table1.Close;
     Action:=caFree;
end;

procedure TFormBankDBFView.Table1FIOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
var S:String;
    SS:String;
begin
     s:=Text;
     ss:=Sender.AsString;
     s:=DosToWin(ss);
     Text:=s;
end;

procedure TFormBankDBFView.FormCreate(Sender: TObject);
begin
  {
     if Table1.Active then
        Table1.Active:=False;
     Table1.TableName:='d:\zarplata\vugu\BANK\PRIVAT\2013\20130806\_bud.dbf';
     Table1.TableType:=ttDBase;
     Table1.Active:=True;
}
     Label1.Caption:='';
end;

procedure TFormBankDBFView.actOpenDBFExecute(Sender: TObject);
var FName:string;
begin
     OpenDialog1.InitialDir:=Bank_dir;
     if OpenDialog1.Execute then            { Display Open dialog box }
        begin
             FName:=OpenDialog1.FileName;
             if Table1.Active then
                Table1.Close;
             Table1.TableName:=Fname;
             Table1.Active:=True;
             Table1.First;
             Label1.Caption:=SPACE(5)+Table1DATA.AsString+' '+DosToWin(Table1GRU_NAME.AsString);
             
        end;

end;

procedure TFormBankDBFView.actCopyToFlashExecute(Sender: TObject);
begin
    // SaveDialog1.Execute
end;

procedure TFormBankDBFView.Table1NAME_WPGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
  var s,ss:string;
begin
     s:=Text;
     ss:=Sender.AsString;
     s:=DosToWin(ss);
     Text:=s;
end;

end.
