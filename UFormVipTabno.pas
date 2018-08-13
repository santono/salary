unit UFormVipTabno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ExtCtrls, DBCtrls, dxDBTLCl,
  dxGrClms;

type
  TFormVipTabno = class(TForm)
    dsVipTabno: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dxVipTabno: TdxDBGrid;
    dsoVipTabno: TDataSource;
    dsVipTabnoTABNO: TFIBIntegerField;
    dsVipTabnoFIO: TFIBStringField;
    DBNavigator1: TDBNavigator;
    dxVipTabnoTABNO: TdxDBGridMaskColumn;
    dxVipTabnoFIO: TdxDBGridMaskColumn;
    dxVipTabnoButton: TdxDBGridButtonColumn;
    dsVipTabnoKIND: TFIBSmallIntField;
    dxVipTabnoKind: TdxDBGridSpinColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dxVipTabnoButtonButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormVipTabno: TFormVipTabno;

implementation
 uses UFibModule,UFrmFindKadryFB;

{$R *.dfm}

procedure TFormVipTabno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if dsVipTabno.Active then
        dsVipTabno.Close;
     if dsVipTabno.Transaction.Active then
        dsVipTabno.Transaction.Commit;
     if dsVipTabno.UpdateTransaction.Active then
        dsVipTabno.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormVipTabno.FormCreate(Sender: TObject);
begin
     if dsVipTabno.Active then
        dsVipTabno.Close;
     if dsVipTabno.Transaction.Active then
        dsVipTabno.Transaction.Commit;
     if dsVipTabno.UpdateTransaction.Active then
        dsVipTabno.UpdateTransaction.Commit;
     dsVipTabno.Transaction.StartTransaction;
     dsVipTabno.Open;

end;

procedure TFormVipTabno.dxVipTabnoButtonButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var ks,gs,s:string;
    tabno : Integer;
    fio   : string;
begin
    tabno:=0;
    fio:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     Tabno := GetTabno;
                     FIO   := GetFio;
                     dsVipTabnoTABNO.Value:=tabno;
                     dsVipTabnoFio.value:=fio;
                     dxVipTabnoTABNO.Field.Value:=tabno;
                     dxVipTabnoFIO.Field.Value:=fio;
               end;
         finally
{            free;   }
          end;
end;

end.
