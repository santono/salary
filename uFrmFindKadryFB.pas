unit uFrmFindKadryFB;

interface
                    
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls, Buttons, DB, FIBDataSet, pFIBDataSet,
  DBGrids, ExtCtrls, DBCtrls, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  FIBDatabase, pFIBDatabase;

type
  TFormFindKadryFB = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    pFIBDataSet1: TpFIBDataSet;
    pFIBDataSet1TABNO: TFIBIntegerField;
    pFIBDataSet1FIO: TFIBStringField;
    pFIBDataSet1NAL_CODE: TFIBStringField;
    pFIBDataSet1SHIFR_POD: TFIBIntegerField;
    DBNavigator1: TDBNavigator;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1TABNO: TdxDBGridMaskColumn;
    dxDBGrid1FIO: TdxDBGridMaskColumn;
    dxDBGrid1NAL_CODE: TdxDBGridMaskColumn;
    dxDBGrid1NAME: TdxDBGridMaskColumn;
    dxDBGrid1SHIFR_POD: TdxDBGridMaskColumn;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSet1CASE: TFIBStringField;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSet1SWID_SS_SER: TFIBStringField;
    pFIBDataSet1SWID_SS_NOM: TFIBStringField;
    pFIBDataSet1BANK_COUNT: TFIBStringField;
    pFIBDataSet1PIB: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxDBGrid1ColumnClick(Sender: TObject;
      Column: TdxDBTreeListColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function GetTabno:Integer;
    function GetFio:String;
    function GetSwidSS:String;
    function GetShifrPod:integer;
    function GetNalCode:String;
    function GetBankCount:String;
    function Execute: boolean;
    procedure dxDBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pFIBDataSet1BeforeStartTransaction(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
      Tabno:Integer;
      Fio:String;
      SwidSS:String;
      ShifrPod:Integer;
      NalCode:string;
      bankCount:string;
  end;

var
  FormFindKadryFB: TFormFindKadryFB;

implementation
 uses UFibModule,DBTables;

{$R *.dfm}

procedure TFormFindKadryFB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSet1.Active then pFIBDataSet1.Active:=false;
      if pFIBDataSet1.Transaction.Active then
         pFIBDataSet1.Transaction.Commit;
      if pFIBDataSet1.UpdateTransaction.Active then
         pFIBDataSet1.UpdateTransaction.Commit;
      Action:=caFree;
end;

procedure TFormFindKadryFB.dxDBGrid1ColumnClick(Sender: TObject;
  Column: TdxDBTreeListColumn);
var
  ID, i: Integer;
  SQLOrderSt: String;
  OldSorted: TdxTreeListColumnSort;
  function GetFieldName(AColumn : TdxDBTreeListColumn) : String;
  begin
    with TdxDBGrid(Sender).DataSource.DataSet.FieldByName(AColumn.FieldName) do
    begin
      Result := FieldName;
      if FieldKind = fkLookup then Result := KeyFields;
    end;
  end;

begin
{
  with TdxDBGrid(Sender) do
  begin
    OldSorted := Column.Sorted;
    if (GetAsyncKeyState(VK_SHIFT) = 0) then
      TdxDBGrid(Sender).ClearColumnsSorted;

    if OldSorted = csUp then
      Column.Sorted := csDown
    else
      Column.Sorted := csUp;

    with pFIBDataSet1 do
    begin
      ID := FieldByName('TABNO').AsInteger;
      DisableControls;
      try
        Close;
        SQLOrderSt := '';
        for i := 0 to SortedColumnCount - 1 do
        begin
          if SQLOrderSt <> '' then
            SQLOrderSt := SQLOrderSt + ', ';
          SQLOrderSt := SQLOrderSt + GetFieldName(SortedColumns[i]);
          if SortedColumns[i].Sorted = csDown then
            SQLOrderSt := SQLOrderSt + ' DESC';
        end;
        if SQLOrderSt <> '' then
          SQLOrderSt := 'ORDER BY ' + SQLOrderSt;
        SelectSQL.Strings[SelectSQL.Count - 1] := SQLOrderSt;
        Open;
        Locate('TABNO', ID, []);
      finally
        EnableControls;
      end;
    end;
  end;
}
end;

procedure TFormFindKadryFB.BitBtn1Click(Sender: TObject);
 var Ser,Nom:String;
begin
     Tabno := pFIBDataSet1.FieldByName('TABNO').AsInteger;
     {$IFDEF SVDN}
        Fio   := pFIBDataSet1.FieldByName('FIO').AsString;
     {$ELSE}
        Fio   := pFIBDataSet1.FieldByName('PIB').AsString;
        if Length(Trim(fio))=0 then
           Fio   := pFIBDataSet1.FieldByName('FIO').AsString;
     {$ENDIF}
     Ser   := pFIBDataSet1.FieldByName('SWID_SS_SER').AsString;
     Nom   := pFIBDataSet1.FieldByName('SWID_SS_NOM').AsString;
     Ser   := trim(Ser);
     Nom   := trim(Nom);
     if (length(Ser)+Length(Nom))>0 then
         SwidSS :=Ser+' ¹'+Nom
     else
         SwidSs := '';
     ShifrPod := pFIBDataSet1.FieldByName('SHIFR_POD').AsInteger;
     NalCode  := pFIBDataSet1.FieldByName('NAL_CODE').AsString;
     bankCount  := pFIBDataSet1.FieldByName('BANK_COUNT').AsString;
     ModalResult:=mrOk;
end;

procedure TFormFindKadryFB.FormCreate(Sender: TObject);
begin
    Tabno:=0;
    Fio:='';
    if not pFIBDataSet1.Transaction.Active then
       pFIBDataSet1.Transaction.StartTransaction;
    if not pFIBDataSet1.Active then pFIBDataSet1.Active:=true;

end;

function TFormFindKadryFB.Execute: boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then result := true
                      else result := false;
end;

function TFormFindKadryFB.GetTabno:Integer;
 begin
      GetTabno:=Tabno;
 end;
function TFormFindKadryFB.GetFio:String;
 begin
      GetFio:=Fio;
 end;

function TFormFindKadryFB.GetSwidSS:String;
 begin
      GetSwidSS:=SwidSS;
 end;

function TFormFindKadryFB.GetNalCode:String;
 begin
      GetNalCode:=NalCode;
 end;
function TFormFindKadryFB.GetBankCount:String;
 begin
      GetBankCount:=bankCount;
 end;

function TFormFindKadryFB.GetShifrPod:integer;
 begin
      GetShifrPod:=ShifrPod;
 end;

procedure TFormFindKadryFB.dxDBGrid1DblClick(Sender: TObject);
begin
     self.BitBtn1Click(Sender);
end;

procedure TFormFindKadryFB.FormShow(Sender: TObject);
begin
    if not pFIBDataSet1.Transaction.Active then
       pFIBDataSet1.Transaction.StartTransaction;
    if not pFIBDataSet1.Active then pFIBDataSet1.Active:=true;
end;


procedure TFormFindKadryFB.pFIBDataSet1BeforeStartTransaction(
  Sender: TObject);
  var I:integer;
begin
      i:=1;
end;

end.
