unit UFormSwodSwmMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormSwodSwmMode = class(TForm)
    rgmode: TRadioGroup;
    btn1: TBitBtn;
    btn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    constructor MyCreate(Owner:TComponent;SowmMode:Integer);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSwodSwmMode: TFormSwodSwmMode;

implementation
 uses USelSwodMode;

{$R *.dfm}

constructor TFormSwodSwmMode.MyCreate(Owner:TComponent;SowmMode:Integer);
  begin
       inherited Create(Owner);
       rgmode.ItemIndex:=SowmMode;
  end;

procedure TFormSwodSwmMode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormSwodSwmMode.btn1Click(Sender: TObject);
 var i:Integer;
begin
     i:=rgmode.ItemIndex;
     FormSwodMode.SetSwodSowmMode(i);
     Close;
end;

end.
