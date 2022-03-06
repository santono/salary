unit UFormOtpBSListAbo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, DBClient, StdCtrls, Buttons;

type
  TFormOtpBSListAbo = class(TForm)
    dsoOtpBS: TDataSource;
    DBNavigator1: TDBNavigator;
    dsOtpBS: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    grOtpBS: TdxDBGrid;
    grOtpBSID: TdxDBGridMaskColumn;
    grOtpBSTABNO: TdxDBGridMaskColumn;
    grOtpBSFIO: TdxDBGridMaskColumn;
    grOtpBSNOMER_PRIK: TdxDBGridMaskColumn;
    grOtpBSDATA_PRIK: TdxDBGridDateColumn;
    grOtpBSDATE_FR: TdxDBGridDateColumn;
    grOtpBSDATE_TO: TdxDBGridDateColumn;
    grOtpBSTABNOButton: TdxDBGridButtonColumn;
    dsOtpBSSHIFRID: TFIBIntegerField;
    dsOtpBSTABNO: TFIBIntegerField;
    dsOtpBSFIO: TFIBStringField;
    dsOtpBSDATEFR: TFIBDateField;
    dsOtpBSDATETO: TFIBDateField;
    dsOtpBSOTPDAY: TFIBIntegerField;
    dsOtpBSNOMER_PRI: TFIBStringField;
    dsOtpBSDATA_PRI: TFIBDateField;
    dsOtpBSY: TFIBIntegerField;
    dsOtpBSM: TFIBIntegerField;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grOtpBSTABNOButtonButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
//    procedure grDekrColumn10GetText(Sender: TObject;
//      ANode: TdxTreeListNode; var AText: String);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dsOtpBSBeforeInsert(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
  private
    wantedTabno:Integer;
    wantedFIO:string;
    { Private declarations }
  public
     constructor createAbo(AOwner: TComponent;wantedTabno:integer);
    { Public declarations }
  end;

var
  FormOtpBSListAbo: TFormOtpBSListAbo;

implementation
 uses uFrmFindKadryFB, UFormOtpBSUpdAbo, scrDef,Scrutil, UFormOtpBsMoveAbo;

{$R *.dfm}
constructor TFormOtpBSListAbo.createAbo(AOwner: TComponent;wantedTabno:integer);
 begin
     inherited Create(AOwner);
     self.wantedtabno:=wantedtabno;
     if isSVDN then
        Self.wantedFIO:=GetFullUkrFioPerson(Self.wantedTabno)
     else
        Self.wantedFIO:=GetFullRusFioPerson(Self.wantedTabno);
     if isSVDN then
        caption:='Перелiк вiдпусток без оплати '+IntToStr(wantedTabno)+' '+trim(Self.wantedFIO)
     else
        caption:='Спиcок отпусков без оплаты '+IntToStr(wantedTabno)+' '+trim(Self.wantedFIO);
     dsOtpBS.Transaction.StartTransaction;
     dsOtpBS.Params[0].Value:=self.wantedTabno;
     dsOtpBS.Open;
 end;
procedure TFormOtpBSListAbo.FormCreate(Sender: TObject);
begin
//      state := dsOtpBS.State;

//      dsOtpBS.Edit;
//      state := dsoOtpBS.DataSet.State;
//      state := dsOtpBS.State;
end;

procedure TFormOtpBSListAbo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsOtpBS.close;
     if dsOtpBS.UpdateTransaction.Active then
        dsOtpBS.UpdateTransaction.Commit;
     dsOtpBS.Transaction.Commit;

end;

procedure TFormOtpBSListAbo.grOtpBSTABNOButtonButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     dsOtpBSTABNO.Value := getTabno;
                     dsOtpBSFIO.Value   := getFio;
               end;
         finally
{            free;}
         end;
       Self.Repaint;

end;

procedure TFormOtpBSListAbo.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
var state: TDataSetState;
begin
//      state := dsOtpBS.State;
//
//      dsoOtpBS.DataSet.edit;
//      state := dsoOtpBS.DataSet.State;
//      state := dsOtpBS.State;
//
     if Button=nbInsert then
        begin
             dsOtpBS.Insert;
//             state := dsOtpBS.State;
             dsOtpBSy.value:=CURRYEAR;
             dsOtpBSm.value:=nmes;
             dsOtpBSTABNO.Value:=wantedTabno;
             dsOtpBSFIO.Value:=Trim(self.wantedFIO);
             Application.CreateForm(TFormOtpBSUpdAbo,FormOtpBSUpdAbo);
             FormOtpBsUpdAbo.ShowModal;
        end
     else
     if Button=nbEdit then
        begin
             dsOtpBs.Edit;
             Application.CreateForm(TFormOtpBSUpdAbo,FormOtpBSUpdAbo);
             FormOtpBsUpdAbo.ShowModal;
        end;
end;

procedure TFormOtpBSListAbo.dsOtpBSBeforeInsert(DataSet: TDataSet);
var i:Integer;
    st:TDataSetState;
begin
     st:=DataSet.State;
     i:=1;
end;

procedure TFormOtpBSListAbo.BitBtn1Click(Sender: TObject);
begin
     FormOtpBsMoveAbo:=TFormOtpBsMoveAbo.createAbo(Self,Self.wantedTabno);
     FormOtpBsMoveAbo.ShowModal;
end;

end.
