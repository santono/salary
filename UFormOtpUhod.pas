unit UFormOtpUhod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, DBCtrls,
  dxDBTLCl, dxGrClms;

type
  TFormOtpUhod = class(TForm)
    dsOtpUhod: TDataSource;
    pFIBDataSetOtpUhod: TpFIBDataSet;
    pFIBTrOtpUhod: TpFIBTransaction;
    pFIBTrOtpUhodRead: TpFIBTransaction;
    pFIBDataSetOtpUhodSHIFRID: TFIBIntegerField;
    pFIBDataSetOtpUhodTABNO: TFIBIntegerField;
    pFIBDataSetOtpUhodFIO: TFIBStringField;
    pFIBDataSetOtpUhodDATEFR: TFIBDateField;
    pFIBDataSetOtpUhodDATETO: TFIBDateField;
    dxDBOtpUhod: TdxDBGrid;
    DBNavigator1: TDBNavigator;
    dxDBOtpUhodSHIFRID: TdxDBGridMaskColumn;
    dxDBOtpUhodFIO: TdxDBGridMaskColumn;
    dxDBOtpUhodDATEFR: TdxDBGridDateColumn;
    dxDBOtpUhodDATETO: TdxDBGridDateColumn;
    dxDBOtpUhodTABNO: TdxDBGridButtonColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dxDBOtpUhodTABNOChange(Sender: TObject);
    procedure dxDBOtpUhodTABNOButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOtpUhod: TFormOtpUhod;

implementation
 uses UFibModule,uFrmFindKadryFB;

{$R *.dfm}

procedure TFormOtpUhod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetOtpUhod.Active then
        pFIBDataSetOtpUhod.Close;
     if pFIBDataSetOtpUhod.Transaction.Active then
        pFIBDataSetOtpUhod.Transaction.Commit;
     if pFIBDataSetOtpUhod.UpdateTransaction.Active then
        pFIBDataSetOtpUhod.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormOtpUhod.FormCreate(Sender: TObject);
begin
     if pFIBDataSetOtpUhod.Active then
        pFIBDataSetOtpUhod.Close;
     if pFIBDataSetOtpUhod.Transaction.Active then
        pFIBDataSetOtpUhod.Transaction.Commit;
     if pFIBDataSetOtpUhod.UpdateTransaction.Active then
        pFIBDataSetOtpUhod.UpdateTransaction.Commit;
     pFIBDataSetOtpUhod.Transaction.StartTransaction;
     pFIBDataSetOtpUhod.Open;

end;

procedure TFormOtpUhod.dxDBOtpUhodTABNOChange(Sender: TObject);
var SQLStmnt,S:string;
begin
     SQLStmnt:='select fio from kadry where tabno='+IntToStr(dxDBOtpUhodTABNO.Field.AsInteger);
     S:=FIB.pFIBDatabaseSal.QueryValueAsStr(SQLStmnt,0);
     dxDBOtpUhodFIO.Field.AsString:=s;
end;

procedure TFormOtpUhod.dxDBOtpUhodTABNOButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
     with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     dxDBOtpUhodTABNO.Field.AsInteger := GetTabno;
                     dxDBOtpUhodFIO.Field.AsString    := GetFio;
               end;
         finally
{            free;}
         end;

end;

end.
