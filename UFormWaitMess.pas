unit UFormWaitMess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormWaitMess = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SetMessage(Mes:string);
    { Public declarations }
  end;

var
  FormWaitMess: TFormWaitMess;

implementation
  uses uFormWait;
{$R *.dfm}

procedure TFormWaitMess.FormShow(Sender: TObject);
begin
      Update;
      Timer1.Enabled:=true;
end;

procedure TFormWaitMess.FormCreate(Sender: TObject);
begin
{
      Brush.Style := bsClear;
      BorderStyle := bsNone
}
end;

procedure TFormWaitMess.SetMessage(Mes:String);
begin
      Label1.Caption := Mes;
{
      Brush.Style := bsClear;
      BorderStyle := bsNone
}
end;

procedure TFormWaitMess.FormClick(Sender: TObject);
begin
      Hide;
end;

procedure TFormWaitMess.FormDblClick(Sender: TObject);
begin
     Hide;
end;

procedure TFormWaitMess.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      Hide;
end;

procedure TFormWaitMess.FormKeyPress(Sender: TObject; var Key: Char);
begin
      Hide;
end;

procedure TFormWaitMess.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
      Hide;
end;

procedure TFormWaitMess.FormMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
      Hide;
end;

procedure TFormWaitMess.Timer1Timer(Sender: TObject);
begin
     Timer1.Enabled := False;
end;

procedure TFormWaitMess.FormHide(Sender: TObject);
begin
      Timer1.Enabled:=false;
end;

end.
