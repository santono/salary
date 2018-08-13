unit DBReferenceViewTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ToolWin, ComCtrls, Grids, DBGrids,
  ADODB,Mask, DBCtrls,DBReferenceEditTemplate, ImgList;

type
  TDBReferenceViewTemplate = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ImageList1: TImageList;
    ToolButton4: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Fds:TDataSource;
    //DBReferenceEdit:TDBReferenceEditTemplate;
  public
    { Public declarations }
    constructor CreateEx(AOwner: TComponent;Title:String;var ds:TDataSource);

    procedure DataEdit(DataSet:TDataSet);
  end;


implementation

{$R *.dfm}

//uses Unit3;





constructor TDBReferenceViewTemplate.CreateEx(AOwner: TComponent; Title: String;
  var ds: TDataSource);
begin
 inherited Create(AOwner);
// DBReferenceEdit:=nil;
 self.Caption:=Title;
 Fds:=ds;
 DBGrid1.DataSource:=ds;
 Fds.DataSet.AfterEdit  :=DataEdit;
 Fds.DataSet.AfterInsert:=DataEdit;

end;
procedure TDBReferenceViewTemplate.DataEdit(DataSet: TDataSet);
begin
   ShowEditForm(DataSet);
end;
procedure TDBReferenceViewTemplate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Fds.DataSet.Close;
  free;
end;

end.
