unit UFormSavedAwans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls,
  DBCtrls, ToolWin, ComCtrls, dxCntner, ImgList;

type
  TFormSavedAwans = class(TForm)
    dsoAwans: TDataSource;
    dsAwans: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsAwansSHIFRID: TFIBIntegerField;
    dsAwansNAME: TFIBStringField;
    dsAwansYEARVY: TFIBIntegerField;
    dsAwansMONTHVY: TFIBIntegerField;
    dsAwansDATESA: TFIBDateField;
    dsAwansSHIFRWRK: TFIBIntegerField;
    dsAwansDATEWRK: TFIBDateField;
    dxDBGridAwans: TdxDBGrid;
    ToolBar1: TToolBar;
    DBNavigator1: TDBNavigator;
    dxDBGridAwansSHIFRID: TdxDBGridMaskColumn;
    dxDBGridAwansNAME: TdxDBGridMaskColumn;
    dxDBGridAwansYEARVY: TdxDBGridMaskColumn;
    dxDBGridAwansMONTHVY: TdxDBGridMaskColumn;
    dxDBGridAwansDATESA: TdxDBGridDateColumn;
    dxDBGridAwansSHIFRWRK: TdxDBGridMaskColumn;
    dxDBGridAwansDATEWRK: TdxDBGridDateColumn;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSavedAwans: TFormSavedAwans;

implementation
 uses UFibModule,ScrDef,ScrUtil, UFormSaveAwans, UFormAwansSwod,
  UFormAwansVerification;

{$R *.dfm}

procedure TFormSavedAwans.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if dsAwans.Active then
        dsAwans.Close;
     if dsAwans.Transaction.Active then
        dsAwans.Transaction.Commit;
     if dsAwans.UpdateTransaction.Active then
        dsAwans.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormSavedAwans.FormCreate(Sender: TObject);
begin
     if dsAwans.Active then
        dsAwans.Close;
     if dsAwans.Transaction.Active then
        dsAwans.Transaction.Commit;
     if dsAwans.UpdateTransaction.Active then
        dsAwans.UpdateTransaction.Commit;
     dsAwans.Params[0].Value:=CURRYEAR;
     dsAwans.Params[1].Value:=nmes;
     dsAwans.Transaction.StartTransaction;
     dsAwans.Open;
end;

procedure TFormSavedAwans.ToolButton1Click(Sender: TObject);
begin
     Application.CreateForm(TFormSaveAwans,FormSaveAwans);
     FormSaveAwans.showModal;
     dsAwans.Close;
     dsAwans.Open;
end;

procedure TFormSavedAwans.ToolButton3Click(Sender: TObject);
begin
     if (dsAwansSHIFRID.value>0 ) then
        begin
             FormAwansSwod:=TFormAwansSwod.Init(Self,dsAwansSHIFRID.value);
             FormAwansSwod.createSwod;
             FormAwansSwod.ShowModal;
        end;

end;

procedure TFormSavedAwans.ToolButton2Click(Sender: TObject);
begin
     FormAwansVerification:=TFormAwansVerification.init(self,dsAwansSHIFRID.value);
     FormAwansVerification.show;
     FormAwansVerification.createValidationSwod;
//     FormAwansVerification.showModal;
end;

end.
