unit DBReferenceEditTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ExtCtrls,DB, ComCtrls, MyDBCtrls;

type
  TDBReferenceEditTemplate = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    FocusControl:TWinControl;

  end;
  procedure ShowEditForm(DataSet:TDataSet);

implementation

{$R *.dfm}

procedure ShowEditForm(DataSet: TDataSet);
var

 i,line:Integer;
 lName:TLabel;
 DBEdit:TDBEdit;
 DBDateTimePicker :TDBDateTimePicker;
 DBEditModified: TDBEditModified;
 DBLookupComboBox:TDBLookupComboBox;
 DateTimePicker: TDateTimePicker;
 DataSource:TDataSource;
 DBReferenceEdit:TDBReferenceEditTemplate;
begin

  DataSource:=TDataSource.Create(nil);
  DataSource.DataSet:=DataSet;
//  if DBReferenceEdit=nil then
//  begin
    DBReferenceEdit:=TDBReferenceEditTemplate.Create(nil{Owner});
    line:=0;
    for  i:=0 to DataSet.FieldCount-1 do
    begin
     if DataSet.fields[i].Visible=false then Continue;
     inc(line);
     lName:=TLabel.Create(DBReferenceEdit);
     lName.Parent:=DBReferenceEdit;
     lName.Caption:=DataSet.Fields[i].DisplayLabel;
     lname.Left:=25;
     lname.Top:=line*30+30;
     lname.Width:=150;
     lname.Visible:=true;
 //fkData, fkCalculated, fkLookup, fkInternalCalc, fkAggregate
     if DataSet.Fields[i].FieldKind=fkLookup then
     begin
       DBLookupComboBox:=TDBLookupComboBox.Create(DBReferenceEdit);
       DBLookupComboBox.Parent:=DBReferenceEdit;
       DBLookupComboBox.Left:=150;
       DBLookupComboBox.Top:=line*30+30;

       DBLookupComboBox.DataField:=DataSet.Fields[i].FieldName;
       DBLookupComboBox.DataSource:=DataSource;
       DBLookupComboBox.TabOrder:=line;
//       FDS.DataSet.Fields[i].LookupList
//    DBLookupComboBox.ListSource:=FDS.DataSet.Fields[i].LookupDataSet.DataSource;
//    DBLookupComboBox.KeyField := FDS.DataSet.Fields[i].LookupKeyFields;
//    DBLookupComboBox.ListField := FDS.DataSet.Fields[i].LookupResultField;
//    DBLookupComboBox.ListSource = DataSource2
       if line=1 then DBReferenceEdit.FocusControl:=DBLookupComboBox;
     end;
     if DataSet.Fields[i].FieldKind=fkData then
     begin
       if DataSet.Fields[i].DataType in [ftDate, ftTime, ftDateTime] then
       begin
         DBDateTimePicker:=TDBDateTimePicker.Create(DBReferenceEdit);
         DBDateTimePicker.Parent:=DBReferenceEdit;
         DBDateTimePicker.Left:=150;
         DBDateTimePicker.Top:=line*30+30;
         DBDateTimePicker.DataField:=DataSet.Fields[i].FieldName;
         DBDateTimePicker.DataSource:=DataSource;
         DBDateTimePicker.TabOrder:=line;
         if line=1 then DBReferenceEdit.FocusControl:=DBDateTimePicker;
         Continue;
       end;
       if DataSet.Fields[i].DataType in [ftFloat, ftCurrency, ftBCD] then
       begin
         DBEditModified:=TDBEditModified.Create(DBReferenceEdit);
         DBEditModified.Parent:=DBReferenceEdit;
         DBEditModified.Left:=150;
         DBEditModified.Top:=line*30+30;
         DBEditModified.DataField:=DataSet.Fields[i].FieldName;
         DBEditModified.DataSource:=DataSource;
         DBEditModified.TabOrder:=line;
         if line=1 then DBReferenceEdit.FocusControl:=DBEditModified;
         Continue;
       end
       else
       begin
         DBEdit:=TDBEdit.Create(DBReferenceEdit);
         DBEdit.Parent:=DBReferenceEdit;
         DBEdit.Left:=150;
         DBEdit.Top:=line*30+30;
         DBEdit.DataField:=DataSet.Fields[i].FieldName;
         DBEdit.DataSource:=DataSource;
         DBEdit.TabOrder:=line;
         if line=1 then DBReferenceEdit.FocusControl:=DBEdit;
       end;
     end;

    end;
    DBReferenceEdit.Panel1.Top:=line*30+50;
//  end;
  if DataSet.State=dsEdit   then  DBReferenceEdit.Caption:='Редактирование записи';
  if DataSet.State=dsInsert then  DBReferenceEdit.Caption:='Добавление записи';

  if DBReferenceEdit.ShowModal=mrOK then
  begin
    DataSet.Post;
  end
  else
  begin
    DataSet.Cancel;
  end;
end;

procedure TDBReferenceEditTemplate.FormShow(Sender: TObject);
begin
  FocusControl.SetFocus;
end;

procedure TDBReferenceEditTemplate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Sender.Free;
end;



end.
