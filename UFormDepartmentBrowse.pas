unit UFormDepartmentBrowse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxTL, dxDBCtrl, dxCntner, dxDBTL, ExtCtrls, DBCtrls;

type
  TFormDepartmentBrowse = class(TForm)
    dsDep: TpFIBDataSet;
    trDepRead: TpFIBTransaction;
    dsPodr: TpFIBDataSet;
    trPodrRead: TpFIBTransaction;
    dsoDep: TDataSource;
    dsoPodr: TDataSource;
    trDepWrte: TpFIBTransaction;
    dsDepID: TFIBIntegerField;
    dsDepIDOWNER: TFIBIntegerField;
    dsDepNAME: TFIBStringField;
    dsDepIDPODR: TFIBIntegerField;
    dsPodrSHIFRPOD: TFIBIntegerField;
    dsPodrNAME: TFIBStringField;
    dxDBTreeList1: TdxDBTreeList;
    dxDBTreeList1ID: TdxDBTreeListMaskColumn;
    dxDBTreeList1IDOWNER: TdxDBTreeListMaskColumn;
    dxDBTreeList1NAME: TdxDBTreeListMaskColumn;
    dxDBTreeList1IDPODR: TdxDBTreeListMaskColumn;
    DBNavigator1: TDBNavigator;
    dsDepnameBuh: TFIBStringField;
    dsoDepSearch: TDataSource;
    dsDepSearch: TpFIBDataSet;
    trDetSearchRead: TpFIBTransaction;
    dsDepSearchID: TFIBIntegerField;
    dsDepSearchNAME: TFIBStringField;
    dsDepSearchNSEARCH: TFIBStringField;
    dsPodrPODSEARCH: TFIBStringField;
    dsDepnameowner: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDepartmentBrowse: TFormDepartmentBrowse;

implementation
  uses UFibModule, UFormDepUpdate, UFormSubDepUpdate;

{$R *.dfm}

procedure TFormDepartmentBrowse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsPodr.Active:=false;
     if dsPodr.Transaction.Active then
        dsPodr.Transaction.Commit;
     dsDep.Active:=false;
     if dsDep.Transaction.Active then
        dsDep.Transaction.Commit;
     if dsDep.UpdateTransaction.Active then
        dsDep.UpdateTransaction.Commit;

     Action := caFree;
end;

procedure TFormDepartmentBrowse.FormCreate(Sender: TObject);
begin
     dsPodr.Transaction.StartTransaction;
     dsPodr.Active:=True;
     dsDep.Transaction.StartTransaction;
     dsDep.UpdateTransaction.StartTransaction;
     dsDep.Active:=True;

end;

procedure TFormDepartmentBrowse.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
     if Button=nbEdit then
     if dsDepIDOWNER.IsNull then
        begin
             Application.CreateForm(TFormDepUpdate,FormDepUpdate);
             FormDepUpdate.ShowModal;
        end
     else
        begin
             Application.CreateForm(TFormSubDepUpdate,FormSubDepUpdate);
             FormSubDepUpdate.ShowModal;
        end
     else
     if Button=nbInsert then
        begin
             Application.CreateForm(TFormSubDepUpdate,FormSubDepUpdate);
             FormSubDepUpdate.ShowModal;
        end;

end;



end.
