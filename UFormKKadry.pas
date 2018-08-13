unit UFormKKadry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  ExtCtrls, DBCtrls, UDBFilter, ActnList, ImgList, ToolWin, ComCtrls;

type
  TFormKKadry = class(TForm)
    dxDBGridKadry: TdxDBGrid;
    dxDBGridKadryTabno: TdxDBGridColumn;
    dxDBGridKadryIdCode: TdxDBGridColumn;
    dxDBGridKadryFIO: TdxDBGridColumn;
    dxDBGridKadryPr: TdxDBGrid;
    dxDBGridKadryPrDateFr: TdxDBGridDateColumn;
    dxDBGridKadryPrDateTo: TdxDBGridDateColumn;
    dxDBGridKadryPrName: TdxDBGridButtonColumn;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    ActionList1: TActionList;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ActEdit: TAction;
    actSelPodr: TAction;
    btn1: TToolButton;
    ToolButton1: TToolButton;
    dxDBGridKadryVerified: TdxDBGridCheckColumn;
    dxDBGridKadryPrDatePodtv: TdxDBGridDateColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dxDBGridKadryPrNameButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dxDBGridKadryDblClick(Sender: TObject);
    procedure SetFilter(NewFilter:TDBFilter);
    procedure dxDBGridKadryKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActEditExecute(Sender: TObject);
    procedure actSelPodrExecute(Sender: TObject);
    procedure dxDBGridKadryTabnoCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
  private
    DBFilter:TDBFilter;
    procedure StartUpdKKadryRec;
    procedure ExecuteFilter;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormKKadry: TFormKKadry;
  CurrentPStagDate:TDateTime;
implementation
 uses UPODataModule, UFormSeekWidNadb, UFormKadryUpd;

{$R *.dfm}

procedure TFormKKadry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if dmPO.pFIBdsKadry.Active then
        dmPO.pFIBdsKadry.Close;
     if dmPO.pFIBdsKadry.Transaction.Active then
        dmPO.pFIBdsKadry.Transaction.Commit;
     if dmPO.pFIBdsKadry.UpdateTransaction.Active then
        dmPO.pFIBdsKadry.UpdateTransaction.Commit;
     if dmPO.pFIBdsKadryPr.Active then
        dmPO.pFIBdsKadryPr.Close;
     if dmPO.pFIBdsKadryPr.Transaction.Active then
        dmPO.pFIBdsKadryPr.Transaction.Commit;
     if dmPO.pFIBdsKadryPr.UpdateTransaction.Active then
        dmPO.pFIBdsKadryPr.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormKKadry.FormCreate(Sender: TObject);
begin
     if dmPO.pFIBdsKadry.Active then
        dmPO.pFIBdsKadry.Close;
     if dmPO.pFIBdsKadry.Transaction.Active then
        dmPO.pFIBdsKadry.Transaction.Commit;
     if dmPO.pFIBdsKadry.UpdateTransaction.Active then
        dmPO.pFIBdsKadry.UpdateTransaction.Commit;
     dmPO.pFIBdsKadry.Transaction.StartTransaction;
     dmPO.pFIBdsKadry.Open;
     if dmPO.pFIBdsKadryPr.Active then
        dmPO.pFIBdsKadryPr.Close;
     if dmPO.pFIBdsKadryPr.Transaction.Active then
        dmPO.pFIBdsKadryPr.Transaction.Commit;
     if dmPO.pFIBdsKadryPr.UpdateTransaction.Active then
        dmPO.pFIBdsKadryPr.UpdateTransaction.Commit;
     dmPO.pFIBdsKadryPr.Transaction.StartTransaction;
     dmPO.pFIBdsKadryPr.Open;

end;

procedure TFormKKadry.dxDBGridKadryPrNameButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
 var ShifrKat : integer;
     ShifrId  : integer;
     Name     : string;
     CodeType,I : Integer;
begin
     Application.CreateForm(TFormSeekWidNadb,FormSeekWidNadb);
     i:=FormSeekWidNadb.ShowModal;
     if i=mrOk then
        begin
             ShifrKat := FormSeekWidNadb.ShifrKat;
             ShifrId  := FormSeekWidNadb.ShifrId;
             Name     := FormSeekWidNadb.Name;
             if ((ShifrKat>0) and
                 (ShifrId>0) and
                 (length(Trim(Name))>0)) then
                begin
                     case ShifrKat of
                       1: CodeType:=3;
                       2: CodeType:=2;
                       3: CodeType:=1;
                       else CodeType:=0;
                     end;
                     if CodeType>0 then
                        begin
                             dmPO.pFIBdsKadryPrCODETYPE.Value := CodeType;
                             dmPO.pFIBdsKadryPrSHIFRUSZ.Value := ShifrId;
                             dmPO.pFIBdsKadryPrName.Value     := Name;
                             dxDBGridKadryPr.Refresh;
         //                    dmPO.pFIBdsKadryPr.Refresh;
                        end;
                end;
        end;
     FormSeekWidNadb.Free;
end;

procedure TFormKKadry.dxDBGridKadryDblClick(Sender: TObject);
begin
     StartUpdKKadryRec;
end;
procedure TFormKKadry.StartUpdKKadryRec;
 begin
      Application.CreateForm(TFormKadryUpd,FormKadryUpd);
      dmPO.dsKadry.Edit;
      FormKadryUpd.ShowModal;
 end;

procedure TFormKKadry.SetFilter(NewFilter:TDBFilter);
 begin
       Self.DBFilter:=NewFilter;
       Self.DBFilter.DataSet:=dxDBGridKadry.DataSource.DataSet;
 end;
procedure TFormKKadry.ExecuteFilter;
 begin
      if not Assigned(DBFilter) then Exit;
      if TDBPodrFilter(DBFilter).Execute(Self) then
         begin
              dxDBGridKadry.Datasource.Dataset.Close;
              dxDBGridKadryPr.Datasource.Dataset.Close;
              dxDBGridKadry.Datasource.Dataset.Open;
              dxDBGridKadryPr.Datasource.Dataset.Open;
         end
 end;


procedure TFormKKadry.dxDBGridKadryKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_F3 then
        ExecuteFilter
     else if Key=VK_RETURN then
         StartUpdKKadryRec;

end;

procedure TFormKKadry.ActEditExecute(Sender: TObject);
begin
      StartUpdKKadryRec;
end;

procedure TFormKKadry.actSelPodrExecute(Sender: TObject);
begin
     ExecuteFilter;
end;


procedure TFormKKadry.dxDBGridKadryTabnoCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
     if not (ASelected or AFocused or ANewItemRow) then
        if ANode.Values[3]=1 then
            AColor:=clLime;

end;

initialization
  CurrentPStagDate:=Date;
end.
