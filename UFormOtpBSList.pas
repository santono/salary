unit UFormOtpBSList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, DBClient, ComCtrls;

type
  TFormOtpBSList = class(TForm)
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
    dpDT: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grOtpBSTABNOButtonButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
//    procedure grDekrColumn10GetText(Sender: TObject;
//      ANode: TdxTreeListNode; var AText: String);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dsOtpBSBeforeInsert(DataSet: TDataSet);
    procedure dpDTChange(Sender: TObject);
  private
    y,m:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOtpBSList: TFormOtpBSList;

implementation
 uses uFrmFindKadryFB, UFormOtpBSUpd, scrDef,dateUtils;

{$R *.dfm}

procedure TFormOtpBSList.FormCreate(Sender: TObject);
var state: TDataSetState;
    dt:TDateTime;
begin
     dsOtpBS.Transaction.StartTransaction;
     dt:=EncodeDate(CURRYEAR,NMES,1);
     dpDT.date:=dt;
     y:=yearOf(dt);
     m:=monthOf(dt);
     dpDT.MaxDate:=incYear(dt);
     dpDT.MinDate:=incYear(dt,-10);
     dsOtpBS.Params[0].Value:=CURRYEAR;
     dsOtpBS.Params[1].Value:=NMES;
     dsOtpBS.Prepare;
     dsOtpBS.Open;
//      state := dsOtpBS.State;

//      dsOtpBS.Edit;
//      state := dsoOtpBS.DataSet.State;
//      state := dsOtpBS.State;

end;

procedure TFormOtpBSList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsOtpBS.close;
     if dsOtpBS.UpdateTransaction.Active then
        dsOtpBS.UpdateTransaction.Commit;
     dsOtpBS.Transaction.Commit;
end;

procedure TFormOtpBSList.grOtpBSTABNOButtonButtonClick(Sender: TObject;
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

procedure TFormOtpBSList.DBNavigator1Click(Sender: TObject;
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
             Application.CreateForm(TFormOtpBSUpd,FormOtpBSUpd);
             FormOtpBsUpd.ShowModal;
        end
     else
     if Button=nbEdit then
        begin
             dsOtpBs.Edit;
             Application.CreateForm(TFormOtpBSUpd,FormOtpBSUpd);
             FormOtpBsUpd.ShowModal;
        end;
end;

procedure TFormOtpBSList.dsOtpBSBeforeInsert(DataSet: TDataSet);
var i:Integer;
    st:TDataSetState;
begin
     st:=DataSet.State;
     i:=1;
end;

procedure TFormOtpBSList.dpDTChange(Sender: TObject);
var y1,m1:Integer;
begin
     y1:=YearOf(dpDT.Date);
     m1:=MonthOf(dpDT.date);
     if ((y1=y) and (m1=m)) then Exit;
     y:=y1;
     m:=m1;
     dsOtpBS.Close;
     dsOtpBS.Params[0].Value:=y;
     dsOtpBS.Params[1].Value:=m;
     dsOtpBS.Prepare;
     dsOtpBS.Open;
end;

end.
