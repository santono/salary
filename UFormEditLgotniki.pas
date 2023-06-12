unit UFormEditLgotniki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  ActnList, ImgList, ExtCtrls, DBCtrls, ComCtrls, ToolWin;

type
  TFormEditLgotniki = class(TForm)
    dsLgotniki: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsLgotnikiID: TFIBIntegerField;
    dsLgotnikiTABNO: TFIBIntegerField;
    dsLgotnikiDATAFR: TFIBDateField;
    dsLgotnikiSUMMAVY: TFIBBCDField;
    dsLgotnikiFIO: TFIBStringField;
    dsLgotnikiSUMMAYEARLIMIT: TFIBBCDField;
    dsLgotnikiSHIFRLG: TFIBIntegerField;
    dsLgotnikiCOMMENT: TFIBStringField;
    dsLgotnikiDATAEND: TFIBDateField;
    dsLgotnikiGUID: TFIBStringField;
    dsLgotnikiENABLED: TFIBIntegerField;
    dxGridLgotniki: TdxDBGrid;
    dsoLgotniki: TDataSource;
    dxGridLgotnikiID: TdxDBGridMaskColumn;
    dxGridLgotnikiTABNO: TdxDBGridMaskColumn;
    dxGridLgotnikiDATAFR: TdxDBGridDateColumn;
    dxGridLgotnikiSUMMAVY: TdxDBGridCurrencyColumn;
    dxGridLgotnikiFIO: TdxDBGridMaskColumn;
    dxGridLgotnikiSUMMAYEARLIMIT: TdxDBGridCurrencyColumn;
    dxGridLgotnikiSHIFRLG: TdxDBGridMaskColumn;
    dxGridLgotnikiCOMMENT: TdxDBGridMaskColumn;
    dxGridLgotnikiDATAEND: TdxDBGridDateColumn;
    dxGridLgotnikiGUID: TdxDBGridMaskColumn;
    dxGridLgotnikiENABLED: TdxDBGridMaskColumn;
    il1: TImageList;
    ActionList1: TActionList;
    ActionSelectLgot: TAction;
    ActionDelLgo: TAction;
    ActionInsLgo: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    DBNavigator1: TDBNavigator;
    ActionExportToExcel: TAction;
    ToolButton4: TToolButton;
    ActionCalculateTot: TAction;
    ToolButton5: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionSelectLgotExecute(Sender: TObject);
    procedure ActionDelLgoExecute(Sender: TObject);
    procedure ActionInsLgoExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxGridLgotnikiCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure ActionExportToExcelExecute(Sender: TObject);
    procedure ActionCalculateTotExecute(Sender: TObject);
  private
    { Private declarations }
    procedure seeLgotnik(ActionClarion:integer);
    procedure exportToExcel;
    procedure SetUpLgotniki;

  public
    { Public declarations }
  end;

var
  FormEditLgotniki: TFormEditLgotniki;

implementation
 uses UFibModule,ScrDef,ScrUtil,UFormUpdateLgotnik,ComObj,DateUtils,USQLUnit
      , uFormWait, UFormSetUpLgotniki;

{$R *.dfm}

procedure TFormEditLgotniki.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsLgotniki.Close;
     dsLgotniki.Transaction.Commit;
     Action:=caFree;
end;

procedure TFormEditLgotniki.ActionSelectLgotExecute(Sender: TObject);
begin
     SeeLgotnik(2);
end;

procedure TFormEditLgotniki.ActionDelLgoExecute(Sender: TObject);
begin
     SeeLgotnik(3);
end;

procedure TFormEditLgotniki.ActionInsLgoExecute(Sender: TObject);
begin
     SeeLgotnik(1);
end;
procedure TFormEditLgotniki.seeLgotnik(ActionClarion:integer);

begin
     if ActionClarion=3 then
        begin
             if YesNo('Удалить запись?') then
                dsoLgotniki.DataSet.Delete;
             Exit;
        end;
      FormUpdateLgotnik:=TFormUpdateLgotnik.myCreate(ActionClarion);
      FormUpdateLgotnik.ShowModal;
end;

procedure TFormEditLgotniki.FormCreate(Sender: TObject);
begin
     dsLgotniki.Transaction.StartTransaction;
     dsLgotniki.Open;
end;

procedure TFormEditLgotniki.dxGridLgotnikiCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  Value: Variant;
  i:integer;
  colIndex:Integer;
begin
 // i := TdxDBGrid(Sender).ColumnByFieldName('SUMMAYEARLIMIT').Index;
  colIndex:=AColumn.Index;
  if not (colIndex in [2,4,10]) then Exit;
  if ANode.HasChildren then
    Exit;
  //if not ASelected and (AColumn = dxDBGrid2PaymentAmount) then
  if not ASelected then
  begin
     if colIndex=10 then
        begin
          i := TdxDBGrid(Sender).ColumnByFieldName('GUID').Index;
          Value := ANode.Values[i];
          if not VarIsNull(Value) then
             begin
               if Length(Value)>10 then
                  AColor := clYellow;
//             else if Value=2 then
//                AColor := clInactiveCaptionText;
             end;
        end
     else
     if (colIndex=2) then
        begin
          i := TdxDBGrid(Sender).ColumnByFieldName('ENABLED').Index;
          Value := ANode.Values[i];
          if not VarIsNull(Value) then
          if VarIsNumeric(Value) then
             begin
                if Value<>1 then
                   AColor := clYellow
                else
                   AColor := clLime;
//                AColor := clInactiveCaptionText;
             end;
        end
     else
     if (colIndex=4) then
        begin
          i := TdxDBGrid(Sender).ColumnByFieldName('SUMMAYEARLIMIT').Index;
          Value := ANode.Values[i];
          if not VarIsNull(Value) then
          if VarIsNumeric(Value) then
             begin
                if Value>yearLimitForLgoty then
                   AColor := clRed;
//                AColor := clInactiveCaptionText;
             end;
        end
  end;
end;
procedure TFormEditLgotniki.exportToExcel;
       var E,WC:Variant;
           sc,i:Integer;
           rec,currrow,currcol:Integer;
       begin //----------------------
           try
              E:=CreateOleObject('Excel.Application');
           except
              ShowMessage('Ошибка запуска Excel');
              Exit;
           end;

           sc:=0;
           CurrRow:=1;
           E.WorkBooks.Add;
           E.Visible:=true;
           dsLgotniki.First;
           while not dsLgotniki.Eof do
              begin
                    sc:=sc+1;
                    Inc(CurrRow);
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=dsLgotnikiTABNO.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=dsLgotnikiFIO.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=dsLgotnikiSUMMAVY.Value;
                    if dsLgotnikiSUMMAYEARLIMIT.value>1.00 then
                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:=dsLgotnikiSUMMAYEARLIMIT.value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=dsLgotnikiDATAFR.value;
                    if YearOf(dsLgotnikiDATAEnd.value)>2000 then
                       E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=dsLgotnikiDATAEND.value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7]:=dsLgotnikiCOMMENT.value;
                    dsLgotniki.Next;
              end;


       end;  //-----------------------


procedure TFormEditLgotniki.ActionExportToExcelExecute(Sender: TObject);
begin
     ToolButton4.Enabled:=False;
     Application.ProcessMessages;
     exportToExcel;
     ToolButton4.Enabled:=True;
     Application.ProcessMessages;
end;

procedure TFormEditLgotniki.SetUpLgotniki;
 begin
      Application.CreateForm(TFormSetUpLgotniki,FormSetUpLgotniki);
      FormSetUpLgotniki.ShowModal;
 end;

procedure TFormEditLgotniki.ActionCalculateTotExecute(Sender: TObject);
var SqlStmnt:string;
    wantedMonth,wantedYear:Integer;
begin
     SetUpLgotniki;
     Exit;
     wantedYear:=WORK_YEAR_VAL;
     wantedMonth:=FLOW_MONTH;
     if not yesNo('Заполнить суммы дохода на начало месяца?') then
        Exit;
     if (wantedMonth>1) then
        SQLStmnt:='update tb_lgotniki a '+
                  'set summayearlimit=(' +
                  'select sum(summa) from fadd b ' +
                  'where b.tabno=a.tabno ' +
                  'and b.year_vy='+intToStr(wantedYear)+' '+
                  'and b.month_vy<'+intToStr(wantedMonth)+')'
     else
        SQLStmnt:='update tb_lgotniki a '+
                  'set summayearlimit=0.00';
     FormWait.Show;
     Application.ProcessMessages;
     SQLExecute(SQLStmnt);
     FormWait.Hide;
     dsLgotniki.Refresh;
     dxGridLgotniki.Refresh;
     Application.ProcessMessages;

end;

end.
