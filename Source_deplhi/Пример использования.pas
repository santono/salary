unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB,  ADODB, StdCtrls, Grids, DBGrids, DBCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Open1: TMenuItem;
    Open2: TMenuItem;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    qRusTitle: TADOQuery;
    ADOTable2: TADOTable;
    N1: TMenuItem;
    City1: TMenuItem;
    mspr1: TMenuItem;
    DataSource2: TDataSource;
    ADOTable2shifrcit: TIntegerField;
    ADOTable2namecit: TStringField;
    ADOTable3: TADOTable;
    ADOTable3shifrstr: TIntegerField;
    ADOTable3shifrcit: TIntegerField;
    ADOTable3name: TStringField;
    ADOTable3type: TStringField;
    ADOTable3shifrraj: TIntegerField;
    DataSource3: TDataSource;
    Street1: TMenuItem;
    ADOQuery1: TADOQuery;
    DataSource4: TDataSource;
    N2: TMenuItem;
    ADOTable3CitiName: TStringField;
    ADOTable3NameRajon: TStringField;
    ADOTable1shifrid: TIntegerField;
    ADOTable1shifrspr: TIntegerField;
    ADOTable1shifrob: TIntegerField;
    ADOTable1name: TStringField;
    ADOTable1shifrowner: TIntegerField;
    ADOTable1intvalue: TIntegerField;
    ADOTable1realvalue: TFloatField;
    ADOTable1shifrwrk: TIntegerField;
    ADOTable1datewrk: TDateField;
    ADOTable1timewrk: TTimeField;
    Button1: TButton;
    procedure Open2Click(Sender: TObject);
    procedure City1Click(Sender: TObject);
    procedure mspr1Click(Sender: TObject);
    procedure Street1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure GetRusTitle(ds:TDataSource;TableName:String);
  end;
var
  Form1: TForm1;

implementation

{$R *.dfm}
uses DBReferenceViewTemplate,DBReferenceEditTemplate;
procedure TForm1.GetRusTitle(ds: TDataSource; TableName: String);
var
i:Integer;
begin
 qRusTitle.Connection:= TADOTable(ds.DataSet).Connection;

 qRusTitle.Close;
 qRusTitle.Parameters.ParamByName('TableName').Value:=TADOTable(ds.DataSet).TableName;
//   ADOQuery1.Parameters.ParamByName('FieldName').Value:=ds.DataSet.Fields[i].FieldName;
//c.relname=:TableName and a.attname=:FieldName
 qRusTitle.Open;

 for i:=0 to ds.DataSet.FieldCount-1 do
 begin
   if qRusTitle.Locate('attname',ds.DataSet.Fields[i].FieldName,[loCaseInsensitive]) then
     ds.DataSet.Fields[i].DisplayLabel:=qRusTitle.FieldByName('Description').AsString;

 end;
 qRusTitle.Close;
end;

procedure TForm1.Open2Click(Sender: TObject);
begin
 DataSource1.DataSet.Open;
// GetRusTitle(DataSource1,'m_spr');
 TDBReferenceViewTemplate.CreateEx(self,'Пример',DataSource1);
end;

procedure TForm1.City1Click(Sender: TObject);
begin
  DataSource2.DataSet.Open;
  TDBReferenceViewTemplate.CreateEx(self,'Справочник - "Города"',DataSource2);
end;

procedure TForm1.mspr1Click(Sender: TObject);
begin
  DataSource1.DataSet.Open;
  TDBReferenceViewTemplate.CreateEx(self,'Пример',DataSource1);
end;

procedure TForm1.Street1Click(Sender: TObject);
begin
  DataSource3.DataSet.Open;
  TDBReferenceViewTemplate.CreateEx(self,'Улицы',DataSource3);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  DataSource4.DataSet.Open;
  TDBReferenceViewTemplate.CreateEx(self,'Районы',DataSource4);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
 i:Integer;
begin
 for i:=0 to ADOTable1.FieldCount-1 do
 begin

  if ADOTable1.Fields[i].DataType in [ftDate,ftDateTime] then  ShowMessage(  ADOTable1.Fields[i].FullName);
  if ADOTable1.Fields[i].DataType in [ftBCD] then  ShowMessage(  ADOTable1.Fields[i].FullName);
 end;

end;

end.
