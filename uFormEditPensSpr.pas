unit uFormEditPensSpr;

interface                                 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, ExtCtrls, DBCtrls, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, DB, FIBDataSet, FIBDatabase, pFIBDatabase,
  pFIBDataSet, FIBQuery, pFIBQuery;

type
  TFormEditPensSpr = class(TForm)
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    DataSource1: TDataSource;
    pFIBDataSet1TABNO: TFIBIntegerField;
    pFIBDataSet1FIO: TFIBStringField;
    pFIBDataSet1DATAVY: TFIBDateTimeField;
    pFIBDataSet1FIOOP: TFIBStringField;
    dxDBGridPensSpr: TdxDBGrid;
    dxDBGridPensSprTABNO: TdxDBGridMaskColumn;
    dxDBGridPensSprFIO: TdxDBGridMaskColumn;
    dxDBGridPensSprDATAVY: TdxDBGridDateColumn;
    dxDBGridPensSprFIOOP: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    pFIBDataSet1SHIFRID: TFIBIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditPensSpr: TFormEditPensSpr;

implementation
 uses uFIBModule,uUpdFormPens;

{$R *.dfm}

procedure TFormEditPensSpr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataset1.Active then
        pFIBDataset1.Active:=false;
     if pFIBDataset1.Transaction.InTransaction then
        pFIBDataset1.Transaction.Commit;
     if pFIBDataset1.UpdateTransaction.InTransaction then
        pFIBDataset1.UpdateTransaction.Commit;
     if pFIBTransactionRead.InTransaction then
        pFIBTransactionRead.Commit;
     if pFIBTransactionWrite.InTransaction then
        pFIBTransactionWrite.Commit;
     Action:=caFree;
end;

procedure TFormEditPensSpr.FormCreate(Sender: TObject);
begin
     if not pFIBDataSet1.Active then
        pFIBDataSet1.Active:=true;
end;

procedure TFormEditPensSpr.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
 var Act:integer;
     ShifrIdB:integer;
begin
{
  case Button of
    nbFirst  : BtnName := 'nbFirst';
    nbPrior  : BtnName := 'nbPrior';
    nbNext   : BtnName := 'nbNext';
    nbLast   : BtnName := 'nbLast';
    nbInsert : BtnName := 'nbInsert';
    nbDelete : BtnName := 'nbDelete';
    nbEdit   : BtnName := 'nbEdit';
    nbPost   : BtnName := 'nbPost';
    nbCancel : BtnName := 'nbCancel';
    nbRefresh: BtnName := 'nbRefresh';
  end;
}
  Act:=0;
  case Button of
    nbInsert : Act:=1;
    nbDelete : Act:=3;
    nbEdit   : Act:=2;
  end;
  if not ((Act=1) or (act=2)) then Exit;
  with TFormPensSpr2006.Create(nil) do
   begin
        try
           ActClar     := Act;
           WantedTabno := 0;
           WantedFio   := '';
           WantedId    := 0;
           if Act<>1 then
              begin
                    WantedTabno:=SELF.pFIBDataSet1.FieldByName('TABNO').AsInteger;
                    WantedFio:=SELF.pFIBDataSet1.FieldByName('FIO').AsString;
                    WantedId:=SELF.pFIBDataSet1.FieldByName('SHIFRID').AsInteger;
              end;
           ShifrIdB:=WantedId;
           if execute then
              begin
              end;
           ShifrIdB:=WantedId;
        finally
          IF Assigned(FormPensSpr2006) then
             free;
        end;
{        ShowTable;  }
{    }
           begin
                if SELF.pFIBDataSet1.Active then
                   SELF.pFIBDataSet1.Active:=false;
                SELF.pFIBDataSet1.Active:=true;
                SELF.dxDBGridPensSpr.Refresh;
                SELF.pFIBDataSet1.Locate('ShifrId',ShifrIdB,[loPartialKey]);
           end;
   end;

end;

end.
