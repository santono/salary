unit UFormChangeNMES;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormChangeNMES = class(TForm)
    dtNMES: TDateTimePicker;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private }
    procedure setData;

  public
    { Public declarations }
  end;

var
  FormChangeNMES: TFormChangeNMES;

implementation
  uses scrdef,dateutils,scrutil;

{$R *.dfm}

procedure TFormChangeNMES.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormChangeNMES.FormActivate(Sender: TObject);
begin
     dtNMES.Date:=encodeDate(curryear,nmes,1);
end;

procedure TFormChangeNMES.BitBtn1Click(Sender: TObject);
begin
     setData;
end;
procedure TFormChangeNMES.setData;
 var y,m:integer;
     dev:TEXTfile;
     fname:string;
     ms:string;
 begin
     fname:=cdir+'YEAR.TXT';
     m:=monthof(dtNMES.date);
     y:=yearof(dtNMES.date);
 //    ms:=getMonthRus(m);
     ms:=month[m];
     ms:=winToDos(ms);
     AssignFile(dev,fname);
     rewrite(dev);
     writeln(dev,y:4);
     writeln(dev,ms);
     writeln(dev,m:2);
     closefile(dev);
     showmessage('“екуща€ рабоча€ дата уставновлена в '+getMonthRus(m)+' '+IntToStr(y)+' г.');
     showMessage('—ейчас программа будет завершена!'+^M+'ƒл€ активации нового установненного мес€ца требуетс€ ее вновь стартовать.');
     halt(0);

 end;
end.
