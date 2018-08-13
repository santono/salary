unit UFormUpdPriType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxExEdtr, dxEdLib, dxDBELib, dxCntner,
  dxEditor;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdPriType: TFormUpdPriType;

implementation
  uses UFibModule,UFormBrowsePrikazyTyp,DB;

{$R *.dfm}

procedure TFormUpdPriType.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormUpdPriType.BitBtn1Click(Sender: TObject);
begin
     if FormBrowsePrikazyTyp.dsPriType.State in [dsEdit,dsInsert] then
        FormBrowsePrikazyTyp.dsPriType.Post;
end;

end.
