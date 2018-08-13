{$WARNINGS OFF}
{$HINTS OFF}
unit UFormBrowseKadryFB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, ExtCtrls, DBCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms, ImgList, ActnList, ComCtrls, ToolWin, pFIBSQLLog;

type
  TFormBrowseKadryFB = class(TForm)
    pFIBDataSetKadry: TpFIBDataSet;
    pfbtrnsctnWrite: TpFIBTransaction;
    pfbtrnsctnRead: TpFIBTransaction;
    DataSourceKadry: TDataSource;
    pFIBDataSetKadryTABNO: TFIBIntegerField;
    pFIBDataSetKadryFIO: TFIBStringField;
    pFIBDataSetKadryNAL_CODE: TFIBStringField;
    pFIBDataSetKadrySHIFR_POD: TFIBIntegerField;
    pFIBDataSetKadryDATA_PRI: TFIBDateField;
    pFIBDataSetKadryDATA_UW: TFIBDateField;
    pFIBDataSetKadryDATA_BIRTH: TFIBDateField;
    pFIBDataSetKadryNAME_POD: TFIBStringField;
    dxDBGridKadry: TdxDBGrid;
    DBNavigator2: TDBNavigator;
    dxDBGridKadryTABNO: TdxDBGridMaskColumn;
    dxDBGridKadryFIO: TdxDBGridMaskColumn;
    dxDBGridKadryNAL_CODE: TdxDBGridMaskColumn;
    dxDBGridKadrySHIFR_POD: TdxDBGridMaskColumn;
    dxDBGridKadryDATA_PRI: TdxDBGridDateColumn;
    dxDBGridKadryDATA_UW: TdxDBGridDateColumn;
    dxDBGridKadryDATA_BIRTH: TdxDBGridDateColumn;
    dxDBGridKadryNAME_POD: TdxDBGridMaskColumn;
    il1: TImageList;
    ActionList1: TActionList;
    actInsert: TAction;
    actUpdate: TAction;
    actDelete: TAction;
    ToolBar1: TToolBar;
    btnAdd: TToolButton;
    btnUpdate: TToolButton;
    btnDelete: TToolButton;
    actRefresh: TAction;
    btnRefresh: TToolButton;
    pFIBDataSetKadryADRES: TFIBStringField;
    pFIBDataSetKadryCOMMENT: TFIBStringField;
    pFIBDataSetKadrySHIFR_POL: TFIBSmallIntField;
    pFIBDataSetKadrySWID_SS_SER: TFIBStringField;
    pFIBDataSetKadryPIB: TFIBStringField;
    pFIBDataSetKadryISPENSIONER: TFIBSmallIntField;
    pFIBDataSetKadrySWID_SS_NOM: TFIBStringField;
    FIBSQLLogger1: TFIBSQLLogger;
    pFIBDataSetKadryPASP_SER: TFIBStringField;
    pFIBDataSetKadryPASP_N: TFIBStringField;
    pFIBDataSetKadryPASP_DATA: TFIBDateField;
    pFIBDataSetKadryPASP_VYD: TFIBStringField;
    pFIBDataSetKadryCODE_UWOL: TFIBSmallIntField;
    pFIBDataSetKadryDESCR_UWOL: TFIBStringField;
    pFIBDataSetKadryBANK_COUNT: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator2Click(Sender: TObject; Button: TNavigateBtn);
    procedure actInsertExecute(Sender: TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure dxDBGridKadryDblClick(Sender: TObject);
  private
    { Private declarations }
    procedure ExecuteCRUD(Tabno:Integer;DBAction:Integer);
  public
    procedure RefreshDataset(Data: TDataSet; UseBookMark :boolean=true);

    { Public declarations }
  end;

var
  FormBrowseKadryFB: TFormBrowseKadryFB;

implementation
 uses UFormUpdateKadry, UFibModule;

{$R *.dfm}

procedure TFormBrowseKadryFB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // FIB.FIBSQLLoggerSal.ActiveStatistics := False;
   //FIB.FIBSQLLoggerSal.ActiveLogging := False;
//  FIB.FIBSQLLoggerSal.SaveStatisticsToDB(1);
  //FIB.FIBSQLLoggerSal.SaveStatisticsToFile('Sal.Log');
     if pFIBDataSetKadry.Active then
        pFIBDataSetKadry.Close;
     if pFIBDataSetKadry.Transaction.Active then
        pFIBDataSetKadry.Transaction.Commit;
     if pFIBDataSetKadry.UpdateTransaction.Active then
        pFIBDataSetKadry.UpdateTransaction.Commit;
      Action:=caFree;
end;

procedure TFormBrowseKadryFB.FormCreate(Sender: TObject);
begin
     if pFIBDataSetKadry.Transaction.Active then
        pFIBDataSetKadry.Transaction.Commit;
     if pFIBDataSetKadry.UpdateTransaction.Active then
        pFIBDataSetKadry.UpdateTransaction.Commit;
     pFIBDataSetKadry.Transaction.StartTransaction;
     pFIBDataSetKadry.Open;
 // FIB.FIBSQLLoggerSal.ActiveStatistics := True;
  //FIB.FIBSQLLoggerSal.ActiveLogging := True;
end;

procedure TFormBrowseKadryFB.DBNavigator2Click(Sender: TObject;
  Button: TNavigateBtn);
  var FormUpdateKadryFB:TFormUpdateKadryFB;
      Tabno    : Integer;
      DBAction : Integer;
begin
  case Button of
    nbInsert : begin
                     Tabno    := 0;
                     DBAction := 1;
               end;
    nbDelete : begin
                     Tabno    := 0;
                     DBAction := 3;
               end;
    nbEdit   : begin
                     Tabno    := pFIBDataSetKadryTABNO.Value;
                     DBAction := 2;
               end;
    else
         Exit;
  end;
  FormUpdateKadryFB:=TFormUpdateKadryFB.CreateUpdKadry(Self,DBAction,Tabno);
  FormUpdateKadryFB.ShowModal;
  pFIBDataSetKadry.Refresh;
end;

procedure TFormBrowseKadryFB.actInsertExecute(Sender: TObject);
begin
     ExecuteCRUD(0,1);
end;

procedure TFormBrowseKadryFB.ExecuteCRUD(Tabno:Integer;DBAction:Integer);
  var FormUpdateKadryFB:TFormUpdateKadryFB;
begin
  FormUpdateKadryFB:=TFormUpdateKadryFB.CreateUpdKadry(Self,DBAction,Tabno);
  FormUpdateKadryFB.ShowModal;
end;

procedure TFormBrowseKadryFB.actUpdateExecute(Sender: TObject);
begin
     ExecuteCRUD(pFIBDataSetKadryTABNO.Value,2);

end;

procedure TFormBrowseKadryFB.actDeleteExecute(Sender: TObject);
var Tabno:Integer;
begin
       Tabno:=pFIBDataSetKadryTABNO.Value;
       if Tabno<0 then
          begin
               ShowMessage('Установите курсор на запись подлежащую удалению и повторите операцию удаления');
               Exit;
          end
       else                    
       ExecuteCRUD(Tabno,3);
end;

procedure TFormBrowseKadryFB.actRefreshExecute(Sender: TObject);
begin
      pFIBDataSetKadry.Refresh;
      dxDBGridKadry.Refresh;
   //   RefreshDataset(pFIBDataSetKadry);
    //  pFIBDataSetKadry.Close;
    //  pFIBDataSetKadry.Open;
   //   dxDBGridKadry.Refresh;
end;
procedure TFormBrowseKadryFB.RefreshDataset(Data: TDataSet; UseBookMark :boolean=true);
var
 Bm :TBookmark;
begin
  Bm:=nil;
  Data.DisableControls;
  try
   if UseBookmark then Bm:=Data.GetBookmark;
   Data.Active:=false;
   Data.Active:=true;
   if UseBookmark and (Bm<>nil) then begin
    if Data.BookmarkValid(Bm) then Data.GotoBookmark(Bm)
    else Data.Last;
    Data.FreeBookmark(Bm);
   end;
  finally
   Data.EnableControls;
  end;
end;

procedure TFormBrowseKadryFB.dxDBGridKadryDblClick(Sender: TObject);
begin
     actUpdateExecute(Self);
end;

end.
