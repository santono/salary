unit UFormSelPKGSave;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery;

type
  TFormSelPKGSave = class(TForm)
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
    BitBtn3: TBitBtn;
    pFIBQuerySave: TpFIBQuery;
    pFIBTransactionSave: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure MarkPodr ;
    procedure MarkKat  ;
    procedure MarkGru  ;
    procedure MarkSta  ;
    procedure SaveSelectionsList(NameS:string);


  public
    ShifrIdMainOld:integer; 
    procedure MarkPKG(ShifrId : integer);
    { Public declarations }
  end;

var
  FormSelPKGSave: TFormSelPKGSave;
  CntFormSelPKGSave : integer=0;

implementation
  uses uFibModule,ScrLists, uFormWait;

{$R *.dfm}

procedure TFormSelPKGSave.FormClose(Sender: TObject; var Action: TCloseAction);
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

     if CntFormSelPKGSave>0 then
        Dec(CntFormSelPKGSave);
end;


procedure TFormSelPKGSave.MarkPodr;
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

procedure TFormSelPKGSave.MarkKat;
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

procedure TFormSelPKGSave.MarkGru;
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

procedure TFormSelPKGSave.MarkSta;
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



procedure TFormSelPKGSave.dxDBGridPodrClick(Sender: TObject);
begin
      LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
      Application.ProcessMessages;
end;

procedure TFormSelPKGSave.dxDBGridPodrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      dxDBGridPodrClick(Sender);
end;

procedure TFormSelPKGSave.dxDBGridPodrKeyPress(Sender: TObject;
  var Key: Char);
begin
      dxDBGridPodrClick(Sender);
end;

procedure TFormSelPKGSave.BitBtn1Click(Sender: TObject);
begin
      MarkPodr;
      MarkKat;
      MarkGru;
      MarkSta;
      ModalResult:=mrOk;
end;

procedure TFormSelPKGSave.BitBtn2Click(Sender: TObject);
begin
     NameServList.ClearAllSelected;
     KategList.ClearAllSelected;
     GruppyList.ClearAllSelected;
     ShifrList.ClearAllSelected;
end;

procedure TFormSelPKGSave.dxDBGridKatClick(Sender: TObject);
begin
      LabelKat.Caption:='Отмечено '+IntToStr(dxDBGridKat.SelectedCount)+' категорий';
      Application.ProcessMessages;
end;

procedure TFormSelPKGSave.dxDBGridGRUClick(Sender: TObject);
begin
      LabelGru.Caption:='Отмечено '+IntToStr(dxDBGridGru.SelectedCount)+' счетов';
      Application.ProcessMessages;
end;



procedure TFormSelPKGSave.dxDBGridKatKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     dxDBGridKatClick(Sender);
end;

procedure TFormSelPKGSave.dxDBGridKatKeyPress(Sender: TObject; var Key: Char);
begin
     dxDBGridKatClick(Sender);
end;

procedure TFormSelPKGSave.dxDBGridGRUKeyPress(Sender: TObject; var Key: Char);
begin
     dxDBGridGRUClick(Sender);
end;

procedure TFormSelPKGSave.dxDBGridGRUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     dxDBGridGRUClick(Sender);
end;

procedure TFormSelPKGSave.dxDBGridStaClick(Sender: TObject);
begin
      LabelSta.Caption:='Отмечено '+IntToStr(dxDBGridSta.SelectedCount)+' статей';
      Application.ProcessMessages;
end;



procedure TFormSelPKGSave.dxDBGridStaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     dxDBGridStaClick(Sender);
end;

procedure TFormSelPKGSave.dxDBGridStaKeyPress(Sender: TObject; var Key: Char);
begin
     dxDBGridStaClick(Sender);
end;

procedure TFormSelPKGSave.BitBtn3Click(Sender: TObject);
var S:String;
    J:integer;
begin
     MarkPodr;
     MarkKat;
     MarkGru;
     MarkSta;

     J:=NameServList.CountSelected;
     if (NameServList.CountSelected=0)    then
        begin
              ShowMessage('Не указаны подразделения для сохранения');
              Exit;
        end;
     if (GruppyList.CountSelected=0)  then
        begin
              ShowMessage('Не указаны счета для сохранения');
              Exit;
        end;
     if (KategList.CountSelected=0)    then
        begin
              ShowMessage('Не указаны категории для сохранения');
              Exit;
        end;
     S:='';
     if Self.ShifrIdMainOld<=0 then
        begin
              s:=InputBox('Запрос названия','Введите название настройки','');
              s:=trim(s);
              if length(s)<2 then
                 begin
                      ShowMessage('Неверно указано имя настройки');
                      Exit;
                 end;
        end;
     Self.SaveSelectionsList(S);

end;
procedure TFormSelPKGSave.SaveSelectionsList(NameS:string);
 var ShifrIdMain,ShifrIdPodr,I,I_C,ShifrPod:integer;
     NameRec:String;
 begin
        NameRec:=trim(NameS);

        FormWait.Show;
        Application.ProcessMessages;

       { 1. Подучить код заголовка }
        if not pFIBQuerySave.Transaction.Active then
           pFIBQuerySave.Transaction.StartTransaction;
        if pFIBQuerySave.Open then
           pFIBQuerySave.Close;

        if Self.ShifrIdMainOld>0 then
           ShifrIdMain:=Self.ShifrIdMainOld
        else
           begin
                pFIBQuerySave.SQL.Clear;
                pFIBQuerySave.SQL.Add('select count(*) from tb_name_podr_selection_det');
                pFIBQuerySave.ExecQuery;
                ShifrIdMain:=pFIBQuerySave.Fields[0].AsInteger;
                pFIBQuerySave.Close;
                if ShifrIdMain>0 then
                   begin
                        pFIBQuerySave.SQL.Clear;
                        pFIBQuerySave.SQL.Add('select max(shifrid) from tb_name_podr_selection_det');
                        pFIBQuerySave.ExecQuery;
                        ShifrIdMain:=pFIBQuerySave.Fields[0].AsInteger;
                        pFIBQuerySave.Close;
                   end;
           end;
       { 2. Подучить код подразделения }
        pFIBQuerySave.SQL.Clear;
        pFIBQuerySave.SQL.Add('select count(*) from tb_podr_selection_list');
        pFIBQuerySave.ExecQuery;
        ShifrIdPodr:=pFIBQuerySave.Fields[0].AsInteger;
        pFIBQuerySave.Close;
        if ShifrIdMain>0 then
           begin
                pFIBQuerySave.SQL.Clear;
                pFIBQuerySave.SQL.Add('select max(shifrid) from tb_podr_selection_list');
                pFIBQuerySave.ExecQuery;
                ShifrIdPodr:=pFIBQuerySave.Fields[0].AsInteger;
                pFIBQuerySave.Close;
           end;
       { 3. Сохранить заголовок }
       if Self.ShifrIdMainOld<=0 then
          begin
               Inc(ShifrIdMain);
               pFIBQuerySave.SQL.Clear;
               pFIBQuerySave.SQL.Add('insert into tb_name_podr_selection_det (shifrid,shifridowner,name) values('+IntToStr(ShifrIdMain)+',3,'''+trim(namerec)+''')');
               pFIBQuerySave.ExecQuery;
               pFIBQuerySave.Close;
          end;
       pFIBQuerySave.SQL.Clear;
       pFIBQuerySave.SQL.Add('delete from tb_podr_selection_list where shifridowner='+IntToStr(ShifrIdMain));
       pFIBQuerySave.ExecQuery;
       pFIBQuerySave.Close;

       { 4. Сохранить список подразделений }
       if NameServList.CountSelected>0 then
       for ShifrPod:=1 to NameServList.Count do
          begin
               if not NameServList.IsSelected(ShifrPod) then continue;
               Inc(ShifrIdPodr);
               pFIBQuerySave.SQL.Clear;
               pFIBQuerySave.SQL.Add('insert into tb_podr_selection_list (shifrid,shifridowner,shifrpod,mode) values('+IntToStr(ShifrIdPodr)+','+IntToStr(ShifrIdMain)+','+IntToStr(ShifrPod)+',1)');
               pFIBQuerySave.ExecQuery;
               pFIBQuerySave.Close;
          end;
       { 5. Сохранить список счетов }
       if GruppyList.CountSelected>0 then
       for ShifrPod:=1 to GruppyList.Count do
          begin
               if not GruppyList.IsSelected(ShifrPod) then continue;
               Inc(ShifrIdPodr);
               pFIBQuerySave.SQL.Clear;
               pFIBQuerySave.SQL.Add('insert into tb_podr_selection_list (shifrid,shifridowner,shifrpod,mode) values('+IntToStr(ShifrIdPodr)+','+IntToStr(ShifrIdMain)+','+IntToStr(ShifrPod)+',2)');
               pFIBQuerySave.ExecQuery;
               pFIBQuerySave.Close;
          end;
       { 6. Сохранить список категорий }
       if KategList.CountSelected>0 then
       for ShifrPod:=1 to KategList.Count do
          begin
               if not KategList.IsSelected(ShifrPod) then continue;
               Inc(ShifrIdPodr);
               pFIBQuerySave.SQL.Clear;
               pFIBQuerySave.SQL.Add('insert into tb_podr_selection_list (shifrid,shifridowner,shifrpod,mode) values('+IntToStr(ShifrIdPodr)+','+IntToStr(ShifrIdMain)+','+IntToStr(ShifrPod)+',3)');
               pFIBQuerySave.ExecQuery;
               pFIBQuerySave.Close;
          end;
       pFIBQuerySave.Transaction.Commit;
       FormWait.Hide;
       Application.ProcessMessages;
       Close;
 end;

procedure TFormSelPKGSave.FormCreate(Sender: TObject);
begin
     Inc(CntFormSelPKGSave);
     ShifrIdMainOld:=0;
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
procedure TFormSelPKGSave.MarkPKG(ShifrId : integer);
  var ShifrIdMain,ShifrPod,i:integer;
      Mode : integer;
 procedure MarkSelPodr(ShifrPod:Integer);
  var I,j,k:integer;
      Finded:boolean;
  begin
       for i:=0 to dxDBGridPodr.Count-1 do
           begin
                val(dxDBGridPodr.Items[i].Strings[0],j,k);
                if k=0 then
                   if j=ShifrPod then
                      begin
                           dxDBGridPodr.Items[i].Focused:=true;
                           dxDBGridPodr.Items[i].Selected:=true;
                           Break;
                      end;
            end;

  end;
 procedure MarkSelGru(ShifrGru:Integer);
  var I,j,k:integer;
      Finded:boolean;
  begin
       for i:=0 to dxDBGridGru.Count-1 do
           begin
                val(dxDBGridGru.Items[i].Strings[0],j,k);
                if k=0 then
                   if j=ShifrGru then
                      begin
                           dxDBGridGru.Items[i].Focused:=true;
                           dxDBGridGru.Items[i].Selected:=true;
                           Break;
                      end;
            end;

  end;
 procedure MarkSelKat(ShifrKat:Integer);
  var I,j,k:integer;
      Finded:boolean;
  begin
       for i:=0 to dxDBGridKat.Count-1 do
           begin
                val(dxDBGridKat.Items[i].Strings[0],j,k);
                if k=0 then
                   if j=ShifrPod then
                      begin
                           dxDBGridKat.Items[i].Focused:=true;
                           dxDBGridKat.Items[i].Selected:=true;
                           Break;
                      end;
            end;

  end;
begin
     Self.ShifrIdMainOld:=ShifrId;

     NameServList.ClearAllSelected;
     dxDBGridPodr.ClearSelection;
     GruppyList.ClearAllSelected;
     dxDBGridGru.ClearSelection;
     KategList.ClearAllSelected;
     dxDBGridKat.ClearSelection;

     pFibQuerySave.Transaction.StartTransaction;
     pFibQuerySave.SQL.Clear;
     pFibQuerySave.SQL.Add('select shifrpod,mode from tb_podr_selection_list where shifridowner='+IntToSTr(ShifrId));
     pFibQuerySave.ExecQuery;
     while not pFibQuerySave.Eof do
      begin
           ShifrPod:=pFibQuerySave.Fields[0].AsInteger;
           Mode:=pFibQuerySave.Fields[1].AsInteger;
           if Mode=1 then
              MarkSelPodr(ShifrPod)
           else if Mode=2 then
              MarkSelGru(ShifrPod)
           else if Mode=3 then
              MarkSelKat(ShifrPod);

           pFibQuerySave.Next;
      end;
     LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
     LabelCnt.Repaint;
     LabelGru.Caption:='Отмечено '+IntToStr(dxDBGridGru.SelectedCount)+' счетов';
     LabelGru.Repaint;
     LabelKat.Caption:='Отмечено '+IntToStr(dxDBGridGru.SelectedCount)+' категорий';
     LabelKat.Repaint;
     Application.ProcessMessages;

     pFibQuerySave.Transaction.Commit;

end;



end.
