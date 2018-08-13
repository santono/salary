unit UFormSelPKG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, Menus;

type
  TFormSelPKG = class(TForm)
    pFIBDataSetPodr: TpFIBDataSet;
    pFIBDataSetPodrSHIFRPOD: TFIBIntegerField;
    pFIBDataSetPodrNAME: TFIBStringField;
    DataSourcePodr: TDataSource;
    dxDBGridPodr: TdxDBGrid;
    dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridPodrNAME: TdxDBGridMaskColumn;
    LabelCnt: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pFIBDataSetKat: TpFIBDataSet;
    DataSourceKat: TDataSource;
    pFIBDataSetKatSHIFR: TFIBIntegerField;
    pFIBDataSetKatNAME: TFIBStringField;
    dxDBGridKat: TdxDBGrid;
    dxDBGridKatSHIFR: TdxDBGridMaskColumn;
    dxDBGridKatNAME: TdxDBGridMaskColumn;
    dxDBGridGRU: TdxDBGrid;
    pFIBDataSetGru: TpFIBDataSet;
    DataSourceGru: TDataSource;
    pFIBDataSetGruSHIFR: TFIBIntegerField;
    pFIBDataSetGruNAME: TFIBStringField;
    dxDBGridGRUSHIFR: TdxDBGridMaskColumn;
    dxDBGridGRUNAME: TdxDBGridMaskColumn;
    LabelKat: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    LabelGru: TLabel;
    pFIBDataSetShifrAdd: TpFIBDataSet;
    pFIBDataSetShifrAddSHIFR: TFIBIntegerField;
    pFIBDataSetShifrAddNAME: TFIBStringField;
    DataSourceShifrAdd: TDataSource;
    dxDBGridSta: TdxDBGrid;
    dxDBGridStaSHIFR: TdxDBGridMaskColumn;
    dxDBGridStaNAME: TdxDBGridMaskColumn;
    LabelSta: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dxDBGridPodrClick(Sender: TObject);
    procedure dxDBGridPodrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBGridPodrKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dxDBGridKatClick(Sender: TObject);
    procedure dxDBGridGRUClick(Sender: TObject);
    procedure dxDBGridKatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBGridKatKeyPress(Sender: TObject; var Key: Char);
    procedure dxDBGridGRUKeyPress(Sender: TObject; var Key: Char);
    procedure dxDBGridGRUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBGridStaClick(Sender: TObject);
    procedure dxDBGridStaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBGridStaKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure MarkPodr ;
    procedure MarkKat  ;
    procedure MarkGru  ;
    procedure MarkSta  ;
    procedure SaveSelections;

  public
    { Public declarations }
  end;

var
  FormSelPKG: TFormSelPKG;

implementation
  uses uFibModule,ScrLists, uFormWait,ScrDef, UFormWaitMess,
  UFormSelSelection;

{$R *.dfm}

procedure TFormSelPKG.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if PFibDataSetPodr.Transaction.Active then
        PFibDataSetPodr.Transaction.Commit;
     if PFibDataSetKat.Transaction.Active then
        PFibDataSetKat.Transaction.Commit;
     if PFibDataSetGru.Transaction.Active then
        PFibDataSetGru.Transaction.Commit;
     if PFibDataSetShifrAdd.Transaction.Active then
        PFibDataSetShifrAdd.Transaction.Commit;
     IF pFIBDataSetPodr.Active THEN
        pFIBDataSetPodr.Active:=FALSE;
     IF pFIBDataSetKat.Active THEN
        pFIBDataSetKat.Active:=FALSE;
     IF pFIBDataSetGru.Active THEN
        pFIBDataSetGru.Active:=FALSE;
     IF pFIBDataSetShifrAdd.Active THEN
        pFIBDataSetShifrAdd.Active:=FALSE;

      Action:=caFree;
end;

procedure TFormSelPKG.FormShow(Sender: TObject);
begin
     IF NOT pFIBDataSetPodr.Active THEN
        pFIBDataSetPodr.Active:=TRUE;
     IF NOT pFIBDataSetKat.Active THEN
        pFIBDataSetKat.Active:=TRUE;
     IF NOT pFIBDataSetGru.Active THEN
        pFIBDataSetGru.Active:=TRUE;
     IF NOT pFIBDataSetShifrAdd.Active THEN
        pFIBDataSetShifrAdd.Active:=TRUE;
     NameServList.ClearAllSelected;
     KategList.ClearAllSelected;
     GruppyList.ClearAllSelected;
     ShifrList.ClearAllSelected;
     LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
     LabelKat.Caption:='Отмечено '+IntToStr(dxDBGridKat.SelectedCount)+' категорий';
     LabelGru.Caption:='Отмечено '+IntToStr(dxDBGridGru.SelectedCount)+' счетов';
     LabelSta.Caption:='Отмечено '+IntToStr(dxDBGridGru.SelectedCount)+' статей';
     Application.ProcessMessages;

end;

procedure TFormSelPKG.MarkPodr;
var
  i, j, k: Integer;
begin
  if dxDBGridPodr.SelectedCount>0 then
    with dxDBGridPodr.DataSource.DataSet do
      for i:=0 to dxDBGridPodr.SelectedCount-1 do
      begin
{           GotoBookmark(pointer(dxDBGridPodr.SelectedRows.Items[i]));}
{           j:=Fields[0].AsInteger;}
           val(dxDBGridPodr.SelectedNodes[i].Strings[0],j,k);
           if k=0 then
               if j>0 then
                  NameServList.SetSelected(j);
      end;
end;

procedure TFormSelPKG.MarkKat;
var
  i, j, k: Integer;
begin
  if dxDBGridKat.SelectedCount>0 then
    with dxDBGridKat.DataSource.DataSet do
      for i:=0 to dxDBGridKat.SelectedCount-1 do
      begin
{           GotoBookmark(pointer(dxDBGridPodr.SelectedRows.Items[i]));}
{           j:=Fields[0].AsInteger;}
           val(dxDBGridKat.SelectedNodes[i].Strings[0],j,k);
           if k=0 then
               if j>0 then
                  KategList.SetSelected(j);
      end;
end;

procedure TFormSelPKG.MarkGru;
var
  i, j, k: Integer;
begin
  if dxDBGridGru.SelectedCount>0 then
    with dxDBGridGru.DataSource.DataSet do
      for i:=0 to dxDBGridGru.SelectedCount-1 do
      begin
{           GotoBookmark(pointer(dxDBGridPodr.SelectedRows.Items[i]));}
{           j:=Fields[0].AsInteger;}
           val(dxDBGridGru.SelectedNodes[i].Strings[0],j,k);
           if k=0 then
               if j>0 then
                  GruppyList.SetSelected(j);
      end;
end;

procedure TFormSelPKG.MarkSta;
var
  i, j, k: Integer;
begin
  if dxDBGridSta.SelectedCount>0 then
    with dxDBGridSta.DataSource.DataSet do
      for i:=0 to dxDBGridSta.SelectedCount-1 do
      begin
{           GotoBookmark(pointer(dxDBGridPodr.SelectedRows.Items[i]));}
{           j:=Fields[0].AsInteger;}
           val(dxDBGridSta.SelectedNodes[i].Strings[0],j,k);
           if k=0 then
               if j>0 then
                  ShifrList.SetSelected(j);
      end;
end;



procedure TFormSelPKG.dxDBGridPodrClick(Sender: TObject);
begin
      LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
      Application.ProcessMessages;
end;

procedure TFormSelPKG.dxDBGridPodrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      dxDBGridPodrClick(Sender);
end;

procedure TFormSelPKG.dxDBGridPodrKeyPress(Sender: TObject;
  var Key: Char);
begin
      dxDBGridPodrClick(Sender);
end;

procedure TFormSelPKG.BitBtn1Click(Sender: TObject);
begin
      MarkPodr;
      MarkKat;
      MarkGru;
      MarkSta;
      ModalResult:=mrOk;
end;

procedure TFormSelPKG.BitBtn2Click(Sender: TObject);
begin
     NameServList.ClearAllSelected;
     KategList.ClearAllSelected;
     GruppyList.ClearAllSelected;
     ShifrList.ClearAllSelected;
end;

procedure TFormSelPKG.dxDBGridKatClick(Sender: TObject);
begin
      LabelKat.Caption:='Отмечено '+IntToStr(dxDBGridKat.SelectedCount)+' категорий';
      Application.ProcessMessages;
end;

procedure TFormSelPKG.dxDBGridGRUClick(Sender: TObject);
begin
      LabelGru.Caption:='Отмечено '+IntToStr(dxDBGridGru.SelectedCount)+' счетов';
      Application.ProcessMessages;
end;



procedure TFormSelPKG.dxDBGridKatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     dxDBGridKatClick(Sender);
end;

procedure TFormSelPKG.dxDBGridKatKeyPress(Sender: TObject; var Key: Char);
begin
     dxDBGridKatClick(Sender);
end;

procedure TFormSelPKG.dxDBGridGRUKeyPress(Sender: TObject; var Key: Char);
begin
     dxDBGridGRUClick(Sender);
end;

procedure TFormSelPKG.dxDBGridGRUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     dxDBGridGRUClick(Sender);
end;

procedure TFormSelPKG.dxDBGridStaClick(Sender: TObject);
begin
      LabelSta.Caption:='Отмечено '+IntToStr(dxDBGridSta.SelectedCount)+' статей';
      Application.ProcessMessages;
end;



procedure TFormSelPKG.dxDBGridStaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     dxDBGridStaClick(Sender);
end;

procedure TFormSelPKG.dxDBGridStaKeyPress(Sender: TObject; var Key: Char);
begin
     dxDBGridStaClick(Sender);
end;

procedure TFormSelPKG.N1Click(Sender: TObject);
begin
     SaveSelections;
end;
procedure TFormSelPKG.SaveSelections;
 var HeaderMsg:string;
     SQLStmnt : string;
     ShifrId  : Integer;
     ShifrIdDet  : Integer;
     WantedMode  : Integer;
     i           : Integer;
     ShifrPod    : Integer;
begin
     MarkPodr;
     MarkKat;
     MarkGru;
     MarkSta;
     if NameServList.CountSelected<1 then
        begin
             ShowMessage('Не выбраны подразделения. Нечего сохранять');
             Exit;
        end;
     HeaderMsg:=InputBox('Сохранение выбора','Укажите название списка','');
     HeaderMsg:=Trim(HeaderMsg);
     if Length(HeaderMsg)=0 then
        begin
             ShowMessage('Не указан заголовок списка');
             Exit;
        end;
        FormWait.Show;
        Application.ProcessMessages;
     WantedMode:=5; {Cписок подразделений счетов и категорий }

     { 1. Подучить код заголовка }
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
     SQLStmnt:='select count(*) from tb_name_podr_selection_det';
     FIB.pFIBQuery.SQL.Add(SQLStmnt);
     FIB.pFIBQuery.ExecQuery;
     ShifrId:=FIB.pFIBQuery.Fields[0].AsInteger;
     FIB.pFIBQuery.Close;
     if ShifrId>0 then
        begin
             FIB.pFIBQuery.SQL.Clear;
             FIB.pFIBQuery.SQL.Add('select max(shifrid) from tb_name_podr_selection_det');
             FIB.pFIBQuery.ExecQuery;
             ShifrId:=FIB.pFIBQuery.Fields[0].AsInteger;
             FIB.pFIBQuery.Close;
        end;
       { 2. Подучить код подразделения }
     FIB.pFIBQuery.SQL.Clear;
     SQLStmnt:='select count(*) from tb_podr_selection_list';
     FIB.pFIBQuery.SQL.Add(SQLStmnt);
     FIB.pFIBQuery.ExecQuery;
     ShifrIdDet:=FIB.pFIBQuery.Fields[0].AsInteger;
     FIB.pFIBQuery.Close;
     if ShifrIdDet>0 then
        begin
             FIB.pFIBQuery.SQL.Clear;
             SQLStmnt:='select max(shifrid) from tb_podr_selection_list';
             FIB.pFIBQuery.SQL.Add(SQLStmnt);
             FIB.pFIBQuery.ExecQuery;
             ShifrIdDet:=FIB.pFIBQuery.Fields[0].AsInteger;
             FIB.pFIBQuery.Close;
        end;
       { 3. Сохранить заголовок }
       Inc(ShifrId);
       FIB.pFIBQuery.SQL.Clear;
       SQLStmnt:='insert into tb_name_podr_selection_det (shifrid,shifridowner,name) values('+IntToStr(ShifrId)+','+IntToStr(WantedMode)+','''+trim(HeaderMsg)+''')';
       FIB.pFIBQuery.SQL.Add(SQLStmnt);
       FIB.pFIBQuery.ExecQuery;
       FIB.pFIBQuery.Close;
       { 4. Сохранить список подразделений }
       for i:=1 to Count_Serv do
           begin
                 if not NameServList.IsSelected(i) then continue;
                 ShifrPod:=PPodrRec(NameServList.Items[i-1]).Shifr;
                 Inc(ShifrIdDet);
                 SQLStmnt:='insert into tb_podr_selection_list (shifrid,shifridowner,shifrpod,mode) values('+IntToStr(ShifrIdDet)+','+IntToStr(ShifrId)+','+IntToStr(ShifrPod)+',1)';
                 FIB.pFIBQuery.SQL.Clear;
                 FIB.pFIBQuery.SQL.Add(SQLStmnt);
                 FIB.pFIBQuery.ExecQuery;
                 FIB.pFIBQuery.Close;
           end;
       { 5. Сохранить список счетов }
       for i:=1 to GruppyList.Count do
           begin
                 if not GruppyList.IsSelected(i) then continue;
                 ShifrPod:=PPodrRec(GruppyList.Items[i-1]).Shifr;
                 Inc(ShifrIdDet);
                 SQLStmnt:='insert into tb_podr_selection_list (shifrid,shifridowner,shifrpod,mode) values('+IntToStr(ShifrIdDet)+','+IntToStr(ShifrId)+','+IntToStr(ShifrPod)+',2)';
                 FIB.pFIBQuery.SQL.Clear;
                 FIB.pFIBQuery.SQL.Add(SQLStmnt);
                 FIB.pFIBQuery.ExecQuery;
                 FIB.pFIBQuery.Close;
           end;
       { 6. Сохранить список категорий }
       for i:=1 to KategList.Count do
           begin
                 if not kategList.IsSelected(i) then continue;
                 ShifrPod:=PPodrRec(KategList.Items[i-1]).Shifr;
                 Inc(ShifrIdDet);
                 SQLStmnt:='insert into tb_podr_selection_list (shifrid,shifridowner,shifrpod,mode) values('+IntToStr(ShifrIdDet)+','+IntToStr(ShifrId)+','+IntToStr(ShifrPod)+',3)';
                 FIB.pFIBQuery.SQL.Clear;
                 FIB.pFIBQuery.SQL.Add(SQLStmnt);
                 FIB.pFIBQuery.ExecQuery;
                 FIB.pFIBQuery.Close;
           end;
       { 7. Сохранить список статей }
       for i:=1 to ShifrList.Count do
           begin
                 if not ShifrList.IsSelected(i) then continue;
                 ShifrPod:=PShifrRec(ShifrList.Items[i-1])^.Shifr;
                 Inc(ShifrIdDet);
                 SQLStmnt:='insert into tb_podr_selection_list (shifrid,shifridowner,shifrpod,mode) values('+IntToStr(ShifrIdDet)+','+IntToStr(ShifrId)+','+IntToStr(ShifrPod)+',4)';
                 FIB.pFIBQuery.SQL.Clear;
                 FIB.pFIBQuery.SQL.Add(SQLStmnt);
                 FIB.pFIBQuery.ExecQuery;
                 FIB.pFIBQuery.Close;
           end;
       FIB.pFIBQuery.Transaction.Commit;
       FormWait.Hide;
       FormWaitMess.SetMessage('Данные по выбора подразделений, счетов, катергорий и статей сохранены');
       FormWaitMess.Show;
       repeat
              Application.ProcessMessages;
       until FormWaitMess.Timer1.Enabled=false;
       FormWaitMess.Hide;

       Application.ProcessMessages;

 end;

procedure TFormSelPKG.N2Click(Sender: TObject);
var ShifrIdMain,ShifrPod:Integer;
    SQLStmnt:string;
    Mode : Integer;
 procedure MarkSelPodr(ShifrPod:Integer;dxDBGrid:TdxDbGrid);
  var I,j,k:integer;
      Finded:boolean;
  begin
       for i:=0 to dxDBGrid.Count-1 do
           begin
                val(dxDBGrid.Items[i].Strings[0],j,k);
                if k=0 then
                   if j=ShifrPod then
                      begin
                           dxDBGrid.Items[i].Focused:=true;
                           dxDBGrid.Items[i].Selected:=true;
                           Break;
                      end;
            end;

  end;

begin
     Application.CreateForm(TFormSelSelection, FormSelSelection);
     FormSelSelection.WantedMode:=5;  { Подразделения }
     ShifrIdMain:=FormSelSelection.Execute;
     if ShifrIdMain<1 then Exit;
     NameServList.ClearAllSelected;
     GruppyList.ClearAllSelected;
     KategList.ClearAllSelected;
     ShifrList.ClearAllSelected;
     dxDBGridPodr.ClearSelection;
     dxDBGridKat.ClearSelection;
     dxDBGridGru.ClearSelection;
 {
     for i:=0 to dxDBGridPodr.Count-1 do
         dxDBGridPodr.Items[0].Selected:=false;
 }
     FIB.pFibQuery.Transaction.StartTransaction;
     FIB.pFibQuery.SQL.Clear;
     SQLStmnt:='select shifrpod,mode from tb_podr_selection_list where shifridowner='+IntToSTr(ShifrIdMain);
     FIB.pFibQuery.SQL.Add(SQLStmnt);
     FIB.pFibQuery.ExecQuery;
     while not FIB.pFibQuery.Eof do
      begin
           ShifrPod:=FIB.pFibQuery.Fields[0].AsInteger;
           Mode:=FIB.pFibQuery.Fields[1].AsInteger;
           case Mode of
            2: MarkSelPodr(ShifrPod,dxDBGridGRU);
            3: MarkSelPodr(ShifrPod,dxDBGridKat);
            4: MarkSelPodr(ShifrPod,dxDBGridSta);
           else
                MarkSelPodr(ShifrPod,dxDBGridPodr);
           end;
           FIB.pFibQuery.Next;
      end;
     FIB.pFibQuery.Close;
     FIB.pFibQuery.Transaction.Commit;
     LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
     LabelCnt.Repaint;
     LabelGRU.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' счетов';
     LabelGRU.Repaint;
     LabelKAT.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' категорий';
     LabelKAT.Repaint;
     LabelSta.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' статей';
     LabelSta.Repaint;

     Application.ProcessMessages;
end;

procedure TFormSelPKG.FormCreate(Sender: TObject);
var selectSQL:String;
begin
     if isSVDN then
       if needAllPodr then
          begin
                pFIBDataSetPodr.SelectSQL.Clear;
                selectSQL:='SELECT POD.SHIFRPOD,POD.NAME from PODR POD ORDER BY SHIFRPOD';
                selectSQL:=' SELECT POD.SHIFRPOD,'+
                           ' case '+
                           ' when (POSITION(''РЕЗЕРВ'',UPPER(POD.NAME))>0) OR '+
                           ' (POSITION(''ПУСТОЕ'',UPPER(POD.NAME))>0) then '+
                           ' (select first 1 name from pr_getpodrnamer(pod.shifrpod)) '+
                           ' else POD.NAME '+
                           ' end  name '+
                           ' from PODR POD ORDER BY pod.SHIFRPOD ';
                pFIBDataSetPodr.SelectSQL.add(selectSQL);
          end
end;

end.
