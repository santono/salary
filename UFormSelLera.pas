unit UFormSelLera;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormSelLeraSwodMode = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBoxDebug: TCheckBox;
    CheckBoxBol: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    NeedBoln:boolean;
  public
    { Public declarations }
  end;

var
  FormSelLeraSwodMode : TFormSelLeraSwodMode;

implementation
  Uses ScrLera;

{$R *.dfm}

procedure TFormSelLeraSwodMode.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormSelLeraSwodMode.BitBtn1Click(Sender: TObject);
var SwodMode   : TLeraSwodMode;
    BolnMode   : TBolnMode;
    Debug_Mode : boolean;
begin
     NeedBoln:= CheckBoxBol.Checked;
     if ComboBox1.ItemIndex=0 then SwodMode:=Lera
                              else
     if ComboBox1.ItemIndex=1 then SwodMode:=Magis802
                              else
     if ComboBox1.ItemIndex=2 then SwodMode:=Magis811
                              else
     if ComboBox1.ItemIndex=3 then SwodMode:=Dogovora
                              else SwodMode:=Lera;
     if ComboBox2.ItemIndex=0 then BolnMode:=Total
                              else
     if ComboBox2.ItemIndex=1 then BolnMode:=WithoutBoln
                              else
     if ComboBox2.ItemIndex=2 then BolnMode:=BolnOnly
                              else
     if ComboBox2.ItemIndex=3 then BolnMode:=KassaOnly
                              else BolnMode:=Total;
     Debug_Mode:=false;
     if CheckBoxDebug.Checked then Debug_Mode:=true;
     LERA_SWOD(SwodMode,BolnMode,Debug_Mode,NeedBoln);

end;

procedure TFormSelLeraSwodMode.FormCreate(Sender: TObject);
begin
    NeedBoln:=false;
    CheckBoxBol.Checked:=false;

end;

end.
