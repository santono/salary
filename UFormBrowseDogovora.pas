unit UFormBrowseDogovora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls,
  DBCtrls, dxCntner;

type
  TFormBrowseDogovora = class(TForm)
    dsoDogovora: TDataSource;
    dsDogovora: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsDogovoraID: TFIBIntegerField;
    dsDogovoraDATEFR: TFIBDateField;
    dsDogovoraDATETO: TFIBDateField;
    dsDogovoraNAME: TFIBStringField;
    dsDogovoraNOMER: TFIBStringField;
    dsDogovoraREASONOK: TFIBStringField;
    dxDBGridDogovora: TdxDBGrid;
    DBNavigator1: TDBNavigator;
    dxDBGridDogovoraID: TdxDBGridMaskColumn;
    dxDBGridDogovoraDATEFR: TdxDBGridDateColumn;
    dxDBGridDogovoraDATETO: TdxDBGridDateColumn;
    dxDBGridDogovoraNAME: TdxDBGridMaskColumn;
    dxDBGridDogovoraNOMER: TdxDBGridMaskColumn;
    dxDBGridDogovoraREASONOK: TdxDBGridMaskColumn;
    dxDBGridDogovoraButton: TdxDBGridButtonColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dxDBGridDogovoraButtonButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    procedure AddRec;
    procedure EditRec;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBrowseDogovora: TFormBrowseDogovora;

implementation
  uses uFIBModule,UFormUpdateDogovora{,
       UFormBrowseDogovoraDet}, UFormBrowseDogovoraDet;

{$R *.dfm}

procedure TFormBrowseDogovora.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsDogovora.Close;
     if dsDogovora.UpdateTransaction.Active then
        dsDogovora.UpdateTransaction.Commit;
     if dsDogovora.Transaction.Active then
        dsDogovora.Transaction.Commit;

     Action:=caFree;
end;

procedure TFormBrowseDogovora.FormCreate(Sender: TObject);
begin
     if dsDogovora.UpdateTransaction.Active then
        dsDogovora.UpdateTransaction.Commit;
     if dsDogovora.Transaction.Active then
        dsDogovora.Transaction.Commit;
     dsDogovora.Transaction.StartTransaction;
     dsDogovora.Open;
end;

procedure TFormBrowseDogovora.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
     if button=nbEdit	then
        EditRec
     else
     if button=nbInsert	then
        AddRec;
end;
procedure TFormBrowseDogovora.EditRec;
   begin
        FormUpdateDogovora:=TFormUpdateDogovora.init(Self,2);
        FormUpdateDogovora.showModal;
   end;
procedure TFormBrowseDogovora.AddRec;
   begin
        FormUpdateDogovora:=TFormUpdateDogovora.init(Self,1);
        FormUpdateDogovora.showModal;
   end;
procedure TFormBrowseDogovora.dxDBGridDogovoraButtonButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);

 var IdOwner:integer;
begin

     idOwner:=dsDogovoraID.Value;
     FormBrowseDogovoraDet:=TFormBrowseDogovoraDet.Init(Self,idOwner);
     FormBrowseDogovoraDet.ShowModal;
end;

end.
