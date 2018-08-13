unit UFormNotUkr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, ExtCtrls, DBCtrls, dxDBGrid, dxTL, dxDBCtrl, dxCntner,
  dxDBTLCl, dxGrClms;

type
  TFormNotUkr = class(TForm)
    pFIBDataSetNU: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    DataSourceNU: TDataSource;
    pFIBDataSetNUTABNO: TFIBIntegerField;
    pFIBDataSetNUFIO: TFIBStringField;
    dxDBGridNU: TdxDBGrid;
    dxDBGridNUTABNO: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    dxDBGridNUFIO: TdxDBGridPickColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
      
    procedure dxDBGridNUFIOEditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormNotUkr: TFormNotUkr;

implementation
  uses UFibModule,uFrmFindKadryFB;
{$R *.dfm}

procedure TFormNotUkr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      pFIBDataSetNu.Active:=false;
      pFIBDataSetNU.Transaction.Commit;
      Action:=caFree;
end;

procedure TFormNotUkr.FormCreate(Sender: TObject);
begin
      pFIBDataSetNU.Transaction.StartTransaction;
      pFIBDataSetNu.Active:=true;

end;


procedure TFormNotUkr.dxDBGridNUFIOEditButtonClick(Sender: TObject);
  var WT:integer;
      WF:string;
begin
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     WT:=GetTabno;
                     WF:=GetFio;
                     if true then
                        begin
                             if pFIBDataSetNU.State=dsBrowse then
                                pFIBDataSetNU.Edit;
                             pFIBDataSetNUTABNO.Value := WT;
                             pFIBDataSetNUFIO.Value  := WF;
                             if pFIBDataSetNU.State=dsEdit then
                                pFIBDataSetNU.Post;
                             Self.Repaint;
                             Application.ProcessMessages;
                        end;
               end;
         finally
          end;

end;

end.
