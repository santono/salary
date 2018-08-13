unit UFormUnivBrowse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, ExtCtrls, DBCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  DB, FIBDataSet, pFIBDataSet, Menus  , ActnList,UDBFilter, ToolWin,
  ComCtrls, ImgList;
type
  Tkind=(UpdateByFields,UpdateByRecord,ChoiceRecord,ReadOnly,CallChildBrowse);
  TCloseMode=(cmAutomaticClose,cmManualClose);
  TChildBrowse = procedure;

  TFormUnivBrowse = class(TForm)
    dxDBGrid: TdxDBGrid;
    DBNavigator: TDBNavigator;
    PopupMenu: TPopupMenu;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actUpdate: TAction;
    actInsert: TAction;
    actDelRecord: TAction;
    actSearch: TAction;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    ActRefresh: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxDBGridDblClick(Sender: TObject);
    procedure dxDBGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actUpdateExecute(Sender: TObject);
    procedure actDelRecordExecute(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure ActRefreshExecute(Sender: TObject);
  private
    { Private declarations }
    Kind:TKind;
    IOpen:Boolean;
    UpdateForm:TForm;
    ChildBrowse:TChildBrowse;
    CloseMode:TCloseMode;
    DBFilter:TDBFilter;
    NeedToolBar:Boolean;
    procedure UpdateRecord;
    procedure DoChoiceRecord;
    procedure ExecuteFilter;
  public
    constructor Make(AOwner: TComponent;NewDataSource:TDataSource;NewKeyField:string;NewCaption:String;NewKind:TKind;NewCloseMode:TCloseMode;NewNeedToolBar:boolean=False);
    procedure AddPopUpItemAction(Action:TAction);
    procedure SetUpdateForm(F:TForm);
    procedure SetChildBrowse(p:TChildBrowse);
    procedure SetVisibleFieldList(S:TStringList);
    procedure SetFilter(NewFilter:TDBFilter);
    { Public declarations }
  end;

var
  FormUnivBrowse: TFormUnivBrowse;

implementation
uses fib, UPODataModule,SCrUtil;

{$R *.dfm}
constructor TFormUnivBrowse.Make(AOwner:TComponent;NewDataSource:TDataSource;NewKeyField:string;NewCaption:String;NewKind:TKind;NewCloseMode:TCloseMode;NewNeedToolBar:Boolean=false);
 var i,j:Integer;
     FieldType:TFieldType;
     s:string;
 begin
      inherited Create(AOwner);
      Kind:=NewKind;
      CloseMode:=NewCloseMode;
      IOpen:=False;
      UpdateForm:=nil;
      DBFilter:=nil;
      ChildBrowse:=nil;
      NeedToolBar:=NewNeedToolBar;
      if NeedToolBar then
         begin
              dxDBGrid.Top    := dxDBGrid.Top    + (ToolBar1.Height+1);
              dxDBGrid.Height := dxDBGrid.Height - (ToolBar1.Height+1);
              btn1.Enabled     := true;
              btn2.Enabled     := true;
              btn3.Enabled     := true;
              btn4.Enabled     := true;
              btn5.Enabled     := true;
              ToolBar1.Enabled := true;
              ToolBar1.Show;
  //            DBNavigator.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbRefresh];
              DBNavigator.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbRefresh,nbInsert,nbDelete,nbEdit,nbPost,nbCancel];
         end
      else
         begin
              btn1.Enabled:=False;
              btn2.Enabled:=False;
              btn3.Enabled:=False;
              btn4.Enabled:=False;
              btn5.Enabled:=False;
              ToolBar1.Enabled:=False;
              ToolBar1.Hide;
              DBNavigator.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbRefresh];
(*
First	nbFirst	Go to the first record
Prior	nbPrior	Go to the previous record
Next	nbNext	Go to the next record
Last	nbLast	Go to the last record
Insert	nbInsert	Insert a blank record
Delete	nbDelete	Delete the current record
Edit	nbEdit	Permit users to edit the current record
Post	nbPost	Post the current record
Cancel	nbCancel	Cancel the current edit
Refresh	nbRefresh	Refresh the data in the dataset
*)
         end;
      if Kind in [ChoiceRecord,ReadOnly] then
         begin
              if NeedToolBar then
                 begin
                      btn1.Enabled:=False;
                      btn2.Enabled:=False;
                      btn3.Enabled:=False;
        //            btn4.Enabled:=False;
        //            btn5.Enabled:=False;
        //            ToolBar1.Enabled:=False;
        //            ToolBar1.Hide;
                 end;
         end
      else
         begin
              DBNavigator.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbRefresh,nbInsert,nbDelete,nbEdit,nbPost,nbCancel];
         end;

      with dxDBGrid do
        begin
             BeginUpdate;
             DestroyColumns;
             KeyField := '';
             Datasource := NewDatasource;
             CreateDefaultColumns(Datasource.Dataset, Self);
             if (dxDBGrid.ColumnCount>0) then
                for i:=0 to dxDBGrid.ColumnCount-1 do
                    dxDBGrid.Columns[i].HeaderAlignment:=taCenter;
{
             j:=DataSource.DataSet.Fields.Count;
             i:=j;
             if (DataSource.DataSet.Fields.Count>0) then
                for i:=0 to DataSource.DataSet.Fields.Count-1 do
                    begin
                         S:=DataSource.DataSet.Fields[i].ClassName;
                         j:=Integer(DataSource.DataSet.Fields[i].DataType);
                         if (j=2) then
                            j:=5;
                         FieldType:=DataSource.DataSet.Fields[i].DataType;
                         if FieldType in [ftSmallint] then
                            j:=7;

                         if FieldType=FieldType then
                            j:=9;
                         if FieldType=ftSmallint then
                            j:=6
                         else
                            j:=7;
                         if (Trim(s)='TFIBSmallIntField') or
                            (Trim(s)='TFIBIntegerField')  or
                            (Trim(s)='TFIBWordField')     or
                            (Trim(s)='TFIBFloatField') then
                            j:=1
                         else if (Trim(s)='TFIBDateField') then
                            j:=2;
                         j:=2;
                         if j=2 then
                            j:=3;
                         if DataSource.DataSet.Fields[i] is TFIBSmallIntField then
                            j:=10;
                         case FieldType of
                             ftSmallint,
                             ftInteger,
                             ftWord,
                             ftFloat :
                                      j:=1;
                             ftDate :
                                      j:=2;
                         end;
                         if j=1 then
                            FieldType:=ftFloat;
                    end;
}
             KeyField := NewKeyField; // Specifies the key field of a new dataset
             if (Kind = UpdateByFields) then
                OptionsView:=OptionsView - [edgoRowSelect]
             else
                OptionsView:=OptionsView + [edgoRowSelect];
             EndUpdate;
        end;
      Self.Caption:=NewCaption;
      DBNavigator.DataSource:=dxDBGrid.DataSource;
      if not dxDBGrid.DataSource.DataSet.Active then
         begin
              IOpen:=True;
              if TpFIBDataset(dxDBGrid.DataSource.DataSet).Transaction.Active then
                 TpFIBDataset(dxDBGrid.DataSource.DataSet).Transaction.StartTransaction;
              dxDBGrid.DataSource.DataSet.Open;
         end;

 end;

procedure TFormUnivBrowse.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if CloseMode=cmAutomaticClose then
        begin
             Action:=caFree;
             if IOpen then
                begin
                     dxDBGrid.DataSource.DataSet.Close;
                     TpFIBDataset(dxDBGrid.DataSource.DataSet).Transaction.Commit;
                     if TpFIBDataset(dxDBGrid.DataSource.DataSet).UpdateTransaction.Active then
                        TpFIBDataset(dxDBGrid.DataSource.DataSet).UpdateTransaction.Commit;
                end;
        end;

end;

procedure TFormUnivBrowse.AddPopUpItemAction(Action:TAction);
 var mi:TMenuItem;
  begin
        mi:=TMenuItem.Create(Self.PopupMenu);
        mi.Action:=Action;
        mi.Tag := GetTickCount;
        PopupMenu.Items.Add(mi);
  end;

procedure TFormUnivBrowse.SetChildBrowse(p:TChildBrowse);
 begin
      ChildBrowse:=p;
 end;

procedure TFormUnivBrowse.SetUpdateForm(F:TForm);
  begin
        UpdateForm:=F;
  end;


procedure TFormUnivBrowse.UpdateRecord;
  begin
        if Kind = ChoiceRecord then
           DoChoiceRecord
        else
        if Kind = UpdateByRecord then
           begin
               if Assigned(UpdateForm) then
               if UpdateForm is TForm then
                  begin
                       if dxDBGrid.DataSource.DataSet.State=dsBrowse then
                          dxDBGrid.DataSource.DataSet.Edit;
                       if UpdateForm.ShowModal=mrOK then
                          dxDBGrid.DataSource.DataSet.Post
                       else
                          dxDBGrid.DataSource.DataSet.Cancel;
                       dxDBGrid.DataSource.DataSet.Refresh;
                  end;
           end
        else
        if Kind = CallChildBrowse then
           begin
               if Assigned(ChildBrowse) then
             //  if ChildBrowse is TChildBrowse then
                  begin
                       ChildBrowse;
                       dxDBGrid.DataSource.DataSet.Refresh;
                  end;
           end
  end;

procedure TFormUnivBrowse.DoChoiceRecord;
  begin
        if Kind = ChoiceRecord then
           ModalResult:=mrOk;
  end;

procedure TFormUnivBrowse.dxDBGridDblClick(Sender: TObject);
begin
     UpdateRecord;
end;

procedure TFormUnivBrowse.dxDBGridKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key=VK_RETURN then
        UpdateRecord
     else if Key=VK_F3 then
         ExecuteFilter;
        
end;

procedure TFormUnivBrowse.SetVisibleFieldList(S:TStringList);
 var i,j:Integer;
     fn:string;
     Finded:Boolean;
begin
     if dxDBGrid.ColumnCount>0 then
        for i:=0 to dxDBGrid.ColumnCount-1 do
            begin
                 fn:=dxDBGrid.Columns[i].FieldName;
                 finded:=false;
                 if s.Count>0 then
                    for j:=0 to s.Count-1 do
                        if (UPPER_STRING(s.strings[j])=UPPER_STRING(fn)) then
                            begin
                                 Finded:=True;
                                 Break;
                            end;
                 if Finded then
                    dxDBGrid.Columns[i].Visible:=True
                 else
                    dxDBGrid.Columns[i].Visible:=False;
            end
end;
procedure TFormUnivBrowse.SetFilter(NewFilter:TDBFilter);
 begin
       Self.DBFilter:=NewFilter;
 end;
procedure TFormUnivBrowse.ExecuteFilter;
 begin
      if not Assigned(DBFilter) then Exit;
      if DBFilter.Execute(Self) then
         begin
              dxDBGrid.Datasource.Dataset.Close;
              dxDBGrid.Datasource.Dataset.Open;
         end;


 end;
procedure TFormUnivBrowse.actUpdateExecute(Sender: TObject);
begin
     if Kind = UpdateByRecord then
        begin
             if Assigned(UpdateForm) then
             if UpdateForm is TForm then
                begin
                     if dxDBGrid.DataSource.DataSet.State=dsBrowse then
                        dxDBGrid.DataSource.DataSet.Edit;
                     if UpdateForm.ShowModal=mrOK then
                        if dxDBGrid.DataSource.DataSet.State in [dsEdit,dsInsert] then
                           dxDBGrid.DataSource.DataSet.Post
                        else   
                     else
                        dxDBGrid.DataSource.DataSet.Cancel;
                     dxDBGrid.DataSource.DataSet.Refresh;
                  //   dxDBGrid.Datasource.Dataset.Close;
                  //   dxDBGrid.Datasource.Dataset.Open;

                end;
        end

end;

procedure TFormUnivBrowse.actDelRecordExecute(Sender: TObject);
var need:boolean;
begin
     if Kind = UpdateByRecord then
        begin
             need:=false;
             if (Application.MessageBox('Удалить запись,', 'Удаление', MB_YESNOCANCEL)=IDYES) then
                begin
                     Need:=true;
                     if dxDBGrid.DataSource.Name='dsShtatRaspPedRec' then
                     if dmPO.pFIBdsShtatRaspPedRecFIXED.Value=1      then
                     if (Application.MessageBox('Запись - зафиксирована. Все равно удалить?', 'Удаление', MB_YESNOCANCEL)<>IDYES) then
                        need:=False;
                end;
             if need then
                dxDBGrid.DataSource.DataSet.Delete;
        end;
end;

procedure TFormUnivBrowse.actInsertExecute(Sender: TObject);
begin
     if Kind = UpdateByRecord then
        begin
             if Assigned(UpdateForm) then
             if UpdateForm is TForm then
                begin
                     if dxDBGrid.DataSource.DataSet.State=dsBrowse then
                        dxDBGrid.DataSource.DataSet.Insert;
                     if UpdateForm.ShowModal=mrOK then
                        dxDBGrid.DataSource.DataSet.Post
                     else
                        dxDBGrid.DataSource.DataSet.Cancel;
                end;
        end

end;

procedure TFormUnivBrowse.actSearchExecute(Sender: TObject);
begin
     ExecuteFilter;
end;

procedure TFormUnivBrowse.ActRefreshExecute(Sender: TObject);
begin
     dxDBGrid.DataSource.DataSet.Refresh;
end;

end.
