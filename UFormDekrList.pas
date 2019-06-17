unit UFormDekrList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, DBClient;

type
  TFormDekrList = class(TForm)
    dsoDekr: TDataSource;
    DBNavigator1: TDBNavigator;
    dsDekr: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsDekrID: TFIBIntegerField;
    dsDekrTABNO: TFIBIntegerField;
    dsDekrINN: TFIBStringField;
    dsDekrFIO: TFIBStringField;
    dsDekrNOMER_PRIK: TFIBStringField;
    dsDekrDATA_PRIK: TFIBDateField;
    dsDekrDATE_FR: TFIBDateField;
    dsDekrDATE_TO: TFIBDateField;
    grDekr: TdxDBGrid;
    grDekrID: TdxDBGridMaskColumn;
    grDekrTABNO: TdxDBGridMaskColumn;
    grDekrINN: TdxDBGridMaskColumn;
    grDekrFIO: TdxDBGridMaskColumn;
    grDekrNOMER_PRIK: TdxDBGridMaskColumn;
    grDekrDATA_PRIK: TdxDBGridDateColumn;
    grDekrDATE_FR: TdxDBGridDateColumn;
    grDekrDATE_TO: TdxDBGridDateColumn;
    grDekrTABNOButton: TdxDBGridButtonColumn;
    dsDekrKIND: TFIBSmallIntField;
    cdsKind: TClientDataSet;
    cdsKindid: TIntegerField;
    cdsKindname: TStringField;
    dsDekrnameKind: TStringField;
    dsDekrnameK: TStringField;
    grDekrNameD: TdxDBGridColumn;
    dsoKind: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grDekrTABNOButtonButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure grDekrColumn10GetText(Sender: TObject;
      ANode: TdxTreeListNode; var AText: String);
    procedure dsDekrCalcFields(DataSet: TDataSet);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDekrList: TFormDekrList;

implementation
 uses uFrmFindKadryFB, UFormDekrUpd;

{$R *.dfm}

procedure TFormDekrList.FormCreate(Sender: TObject);
begin
     dsDekr.Transaction.StartTransaction;
     dsDekr.Open;
     cdsKind.Open;
     cdsKind.EmptyDataSet;
     cdsKind.Append;
     cdsKindid.Value:=4;
     cdsKindname.Value:='до 3 років';
     cdsKind.Post;
     cdsKind.Append;
     cdsKindid.Value:=5;
     cdsKindname.Value:='пологи';
     cdsKind.Post;
     cdsKind.Append;
     cdsKindid.Value:=6;
     cdsKindname.Value:='від 3 до 6 років';
     cdsKind.Post;
end;

procedure TFormDekrList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsDekr.close;
     if dsDekr.UpdateTransaction.Active then
        dsDekr.UpdateTransaction.Commit;
     dsDekr.Transaction.Commit;
     cdsKind.Close;

end;

procedure TFormDekrList.grDekrTABNOButtonButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     dsDekrTABNO.Value := getTabno;
                     dsDekrFIO.Value   := getFio;
                     dsDekrINN.Value   := GetNalCode;
               end;
         finally
{            free;}
         end;
       Self.Repaint;

end;

procedure TFormDekrList.grDekrColumn10GetText(Sender: TObject;
  ANode: TdxTreeListNode; var AText: String);
begin
     if ANode.Values[0]=5 then
        AText:='пологи'
     else
     if ANode.Values[0]=6 then
        AText:='від 3 до 6'
     else
        AText:='До 3'    
end;

procedure TFormDekrList.dsDekrCalcFields(DataSet: TDataSet);
var retVal:string;
begin
     if dsDekrKIND.value=5 then
        retVal:='пологи'
     else
     if dsDekrKIND.value=6 then
        retVal:='від 3 до 6 років'
     else
        retVal:='до 3 років';

     dsDekrnameK.Value:=retVal;
end;

procedure TFormDekrList.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
     if Button=nbInsert then
        begin
             dsDekr.Append;
             Application.CreateForm(TFormDekrUpd,FormDekrUpd);
             FormDekrUpd.ShowModal;
        end
     else
     if Button=nbEdit then
        begin
             dsDekr.Edit;
             Application.CreateForm(TFormDekrUpd,FormDekrUpd);
             FormDekrUpd.ShowModal;
        end;
end;

end.
