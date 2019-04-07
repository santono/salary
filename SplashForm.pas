{$WARNINGS OFF}
{$HINTS OFF}
unit SplashForm;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ActnList;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    OKButton: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    ActionList1: TActionList;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.Timer1Timer(Sender: TObject);
begin
    Timer1.Enabled := False;
end;

procedure TAboutBox.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
     CanClose := Not Timer1.Enabled;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
{
  SetWindowLong (Main.Handle,GWL_STYLE,
  GetWindowLong(Main.Handle, GWL_STYLE) AND NOT
  WS_CAPTION OR WS_SIZEBOX);
}
  {$IFDEF SVDN}
   Label1.Caption:='Автоматизована система';
   ProductName.Caption:='розрахунку заробітної платні';
  {$ENDIF}
end;

procedure TAboutBox.OKButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TAboutBox.FormPaint(Sender: TObject);
begin
     Canvas.Brush.Style := bsClear;
     Canvas.Rectangle(0, 0, Width, Height);
end;

end.

