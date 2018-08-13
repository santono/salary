unit UFormSecretSotr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, dxCntner, ExtCtrls, DBCtrls, dxGrClEx, FIBDatabase,
  pFIBDatabase;

type
  TFormTabnoSecret = class(TForm)
    pFIBDataSetT: TpFIBDataSet;
    DataSource1: TDataSource;
    DBNavigator1: TDBNavigator;
    pFIBTransaction1: TpFIBTransaction;
    pFIBTransaction2: TpFIBTransaction;
    pFIBDataSetTTABNO: TFIBIntegerField;
    pFIBDataSetTFIO: TFIBStringField;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1TABNO: TdxDBGridMaskColumn;
    dxDBGrid1FIO: TdxDBGridMaskColumn;
    dxDBGrid1Column3: TdxDBGridButtonColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxDBGrid1Column3ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTabnoSecret: TFormTabnoSecret;

implementation
  uses UFibModule,uFrmFindKadryFB;

{$R *.dfm}

procedure TFormTabnoSecret.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if pFIBDataSetT.Active then pFIBDataSetT.Active:=false;
      Action:=caFree;
end;


procedure TFormTabnoSecret.FormCreate(Sender: TObject);
begin

     if not pFIBDataSetT.Active then
        pFIBDataSetT.Active:=true;
end;

procedure TFormTabnoSecret.FormShow(Sender: TObject);
 var i:integer;
begin
     if not pFIBDataSetT.Active then
        i:=1
     else
        i:=2;
end;

procedure TFormTabnoSecret.dxDBGrid1Column3ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
    if pFIBDataSetT.State=dsBrowse then pFIBDataSetT.Edit;
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     if pFIBDataSetT.State in [dsEdit,dsInsert] then
                        begin
                             pFIBDataSetT.FieldByName('TABNO').AsInteger := GetTabno;
                             pFIBDataSetT.Post;
                        end;
               end;
         finally
{            free; }
         end;
       Self.Repaint;

end;

end.
