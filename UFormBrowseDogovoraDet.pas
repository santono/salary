unit UFormBrowseDogovoraDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner;

type
  TFormBrowseDogovoraDet = class(TForm)
    dsoDogovoraDet: TDataSource;
    DBNavigator1: TDBNavigator;
    dsDogovoraDet: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsDogovoraDetID: TFIBIntegerField;
    dsDogovoraDetIDDOG: TFIBIntegerField;
    dsDogovoraDetTABNO: TFIBIntegerField;
    dsDogovoraDetFIO: TFIBStringField;
    dsDogovoraDetDATEFR: TFIBDateField;
    dsDogovoraDetDATETO: TFIBDateField;
    dsDogovoraDetNOMER: TFIBStringField;
    dsDogovoraDetGUID: TFIBStringField;
    dsDogovoraDetREASONOK: TFIBStringField;
    dxDBGridDogovoraDet: TdxDBGrid;
    dxDBGridDogovoraDetID: TdxDBGridMaskColumn;
    dxDBGridDogovoraDetIDDOG: TdxDBGridMaskColumn;
    dxDBGridDogovoraDetTABNO: TdxDBGridMaskColumn;
    dxDBGridDogovoraDetFIO: TdxDBGridMaskColumn;
    dxDBGridDogovoraDetDATEFR: TdxDBGridDateColumn;
    dxDBGridDogovoraDetDATETO: TdxDBGridDateColumn;
    dxDBGridDogovoraDetNOMER: TdxDBGridMaskColumn;
    dxDBGridDogovoraDetGUID: TdxDBGridMaskColumn;
    dxDBGridDogovoraDetREASONOK: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    idOwner  : integer;
    dbAction : integer;
    { Private declarations }
    procedure AddRec;
    procedure EditRec;
    
  public
    constructor init(AOwner : TComponent;idOwner : integer);
    { Public declarations }
  end;

var
  FormBrowseDogovoraDet: TFormBrowseDogovoraDet;

implementation
 uses UFormBrowseDogovora, UFormUpdateDogovoraDet;

{$R *.dfm}
  constructor TFormBrowseDogovoraDet.init(AOwner:TComponent;idOwner:integer);
   begin
        self.Create(AOwner);
        self.idOwner:=idOwner;
        Caption:='Совместители договора '+trim(FormBrowseDogovora.dsDogovoraNOMER.Value);
        if dsDogovoraDet.UpdateTransaction.Active then
           dsDogovoradet.UpdateTransaction.Commit;
        if dsDogovoraDet.Transaction.Active then
           dsDogovoraDet.Transaction.Commit;
        dsDogovoraDet.Params[0].Value:=idOwner;
        dsDogovoraDet.Transaction.StartTransaction;
        dsDogovoraDet.Open;

   end;


procedure TFormBrowseDogovoraDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        if dsDogovoraDet.UpdateTransaction.Active then
           dsDogovoradet.UpdateTransaction.Commit;
        if dsDogovoraDet.Transaction.Active then
           dsDogovoraDet.Transaction.Commit;
        dsDogovoraDet.Close;
        Action:=caFree;   
end;

procedure TFormBrowseDogovoraDet.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
     if button=nbEdit	then
        EditRec
     else
     if button=nbInsert	then
        AddRec;

end;
procedure TFormBrowseDogovoraDet.EditRec;
   begin
        FormUpdateDogovoraDet:=TFormUpdateDogovoraDet.init(Self,2);
        FormUpdateDogovoraDet.showModal;
   end;
procedure TFormBrowseDogovoraDet.AddRec;
   begin
        FormUpdateDogovoraDet:=TFormUpdateDogovoraDet.init(Self,1);
        FormUpdateDogovoraDet.showModal;
   end;

end.
