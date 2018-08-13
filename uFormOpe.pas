unit uFormOpe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TFormBay = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormBay: TFormBay;

implementation

{$R *.dfm}

procedure TFormBay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

end.
