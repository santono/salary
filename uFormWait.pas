unit uFormWait;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormWait = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CreateParams(var Params: TCreateParams); override;
  end;

var
  FormWait: TFormWait;

implementation

{$R *.dfm}
procedure TFormWait.CreateParams(var Params: TCreateParams);
begin
      inherited CreateParams(Params);
      with Params do
           Style := (Style OR WS_POPUP) AND NOT WS_DLGFRAME;
       end;
procedure TFormWait.FormCreate(Sender: TObject);
begin
{
      Brush.Style := bsClear;
      BorderStyle := bsNone
}      
end;

procedure TFormWait.FormShow(Sender: TObject);
begin
      Update;
end;

end.
 