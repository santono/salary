unit UFormProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls;

type
  TFormProgress = class(TForm)
    Gauge: TGauge;
    LabelHeader: TLabel;
    LabelFooter: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    StringHeader:string;
    StringFooter:string;
  public
    { Public declarations }
  end;

var
  FormProgress: TFormProgress;

implementation

{$R *.dfm}

procedure TFormProgress.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormProgress.FormCreate(Sender: TObject);
begin
     LabelHeader.Caption:='';
     LabelFooter.Caption:='';
     Caption:='';
end;

end.
