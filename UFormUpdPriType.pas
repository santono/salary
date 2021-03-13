unit UFormUpdPriType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxExEdtr, dxEdLib, dxDBELib, dxCntner,
  dxEditor, DB, DBClient, cxGraphics, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxControls, cxContainer, cxEdit, cxCheckBox, cxDBEdit;

type
  TFormUpdPriType = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dxDBEdit1: TdxDBEdit;
    dxDBEdit2: TdxDBEdit;
    dxDBMemo1: TdxDBMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cdsZO: TClientDataSet;
    cdsZOZO: TIntegerField;
    cdsZOname: TStringField;
    dsoZO: TDataSource;
    cbNeedT5: TcxDBCheckBox;
    gbT5: TGroupBox;
    Label15: TLabel;
    cbVS: TcxDBCheckBox;
    cbPIR: TcxDBCheckBox;
    cbZO: TcxDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure cbNeedT5PropertiesEditValueChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdPriType: TFormUpdPriType;

implementation
  uses UFibModule,
   UFormBrowsePrikazyTyp;

{$R *.dfm}

procedure TFormUpdPriType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     cdsZO.Close;
     Action:=caFree;
end;

procedure TFormUpdPriType.BitBtn1Click(Sender: TObject);
begin
     if FormBrowsePrikazyTyp.dsPriType.State in [dsEdit,dsInsert] then
        FormBrowsePrikazyTyp.dsPriType.Post;
end;

procedure TFormUpdPriType.cbNeedT5PropertiesEditValueChanged(
  Sender: TObject);
begin
     if cbNeedT5.Checked then
        gbT5.Show
     else
        gbT5.Hide;
     Application.ProcessMessages;

end;

procedure TFormUpdPriType.FormCreate(Sender: TObject);
begin
      if FormBrowsePrikazyTyp.dsPriTypeNEEDT5.Value=1 then
         gbT5.Show
      else
         gbT5.Hide;
      cdsZO.Append;
      cdsZOZO.Value:=0;
      cdsZOname.Value:='Не вказано';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=1;
      cdsZOname.Value:='Наймані працівники з трудовою книжкою';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=2;
      cdsZOname.Value:='наймані працівники (без трудової книжки)';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=3;
      cdsZOname.Value:='Договор ЦПХ';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=4;
      cdsZOname.Value:='відпустка за дитиною вiд 3 до 6 років';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=5;
      cdsZOname.Value:='особи, яким надано відпустку по вагітності і пологах';
      cdsZO.Post;
      cdsZO.Append;
      cdsZOZO.Value:=6;
      cdsZOname.Value:='відпустка за дитиною до 3-х років';
      cdsZO.Post;

end;

end.
