unit UFormDepartmentSeek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxTL, dxDBCtrl, dxCntner, dxDBTL, ExtCtrls, DBCtrls, StdCtrls,
  Buttons;

type
  TFormDepartmentSeek = class(TForm)
    dsDep: TpFIBDataSet;
    trDepRead: TpFIBTransaction;
    dsoDep: TDataSource;
    trDepWrte: TpFIBTransaction;
    dsDepID: TFIBIntegerField;
    dsDepIDOWNER: TFIBIntegerField;
    dsDepNAME: TFIBStringField;
    dsDepIDPODR: TFIBIntegerField;
    dxDBTreeList1: TdxDBTreeList;
    dxDBTreeList1ID: TdxDBTreeListMaskColumn;
    dxDBTreeList1IDOWNER: TdxDBTreeListMaskColumn;
    dxDBTreeList1NAME: TdxDBTreeListMaskColumn;
    dxDBTreeList1IDPODR: TdxDBTreeListMaskColumn;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     selectedCode:integer;
    { Public declarations }
  end;

var
  FormDepartmentSeek: TFormDepartmentSeek;

implementation
  uses UFibModule, UFormDepUpdate, UFormSubDepUpdate;

{$R *.dfm}

procedure TFormDepartmentSeek.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsDep.Active:=false;
     dsDep.Transaction.Commit;

 //    Action := caFree;
end;

procedure TFormDepartmentSeek.FormCreate(Sender: TObject);
begin
     dsDep.Transaction.StartTransaction;
     dsDep.Active:=True;
     selectedCode:=0;

end;

procedure TFormDepartmentSeek.DBNavigator1Click(Sender: TObject;
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




procedure TFormDepartmentSeek.BitBtn1Click(Sender: TObject);
 var retVal:integer;
begin
     retVal:=0;
     retVal:=dxDBTreeList1ID.Field.Value;
     if retVal>0 then
        begin
//             ShowMessage('retVal='+IntToStr(retVal));
             selectedCode:=retVal;
             modalResult:=mrOk;
        end;
end;

end.
