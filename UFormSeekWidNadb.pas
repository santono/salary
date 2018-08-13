unit UFormSeekWidNadb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, ExtCtrls, DBCtrls;

type
  TFormSeekWidNadb = class(TForm)
    dxDBGridSeek: TdxDBGrid;
    dxDBGridSeekF_1: TdxDBGridMaskColumn;
    dxDBGridSeekF_2: TdxDBGridMaskColumn;
    dxDBGridSeekF_3: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dxDBGridSeekDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure MakeSelection;
  public
    ShifrKat : Integer;
    ShifrId  : Integer;
    Name     : String;
    { Public declarations }
  end;

var
  FormSeekWidNadb: TFormSeekWidNadb;

implementation
  uses UPODataModule;

{$R *.dfm}

procedure TFormSeekWidNadb.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if dmPO.pFIBdsWidNSpr.Active then
        dmPO.pFIBdsWidNSpr.Close;
     if dmPO.pFIBdsWidNSpr.Transaction.Active then
        dmPO.pFIBdsWidNSpr.Transaction.Commit;
   //  Action:=caFree;
end;

procedure TFormSeekWidNadb.FormCreate(Sender: TObject);
begin
     if dmPO.pFIBdsWidNSpr.Active then
        dmPO.pFIBdsWidNSpr.Close;
     if dmPO.pFIBdsWidNSpr.Transaction.Active then
        dmPO.pFIBdsWidNSpr.Transaction.Commit;
     dmPO.pFIBdsWidNSpr.Transaction.StartTransaction;
     dmPO.pFIBdsWidNSpr.Open;
  (*

  select 2,b.shifrid,b.namesokr from tb_k_usz b
union
select 3,a.shifrid,a.shortname  from tb_k_uch_st_spr a
union
select 4,c.shifrid,c.shortname  from tb_k_widyzasl c
     if dmPO.pFIBdsWidUSZ.Active then
        dmPO.pFIBdsWidNSpr.Close;
     if dmPO.pFIBdsWidNSpr.Transaction.Active then
        dmPO.pFIBdsWidNSpr.Transaction.Commit;
     *)
     dmPO.pFIBdsWidNSpr.Transaction.StartTransaction;
     dmPO.pFIBdsWidNSpr.Open;
     ShifrKat := 0;
     ShifrId  := 0;
     Name     := '';
end;

procedure TFormSeekWidNadb.dxDBGridSeekDblClick(Sender: TObject);
begin
     MakeSelection;
end;
procedure TFormSeekWidNadb.MakeSelection;
begin
     ShifrKat := dxDBGridSeekF_1.Field.AsInteger;
     ShifrId  := dxDBGridSeekF_2.Field.AsInteger;
     Name     := dxDBGridSeekF_3.Field.AsString;
     ModalResult:=mrOk;
end;

end.
