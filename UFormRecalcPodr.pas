unit UFormRecalcPodr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormRecalcPodr = class(TForm)
    ProgressBar1: TProgressBar;
    LabelFIO: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRecalcPodr: TFormRecalcPodr;

implementation
 uses ScrDef,ScrUtil,ScrNalog;

{$R *.dfm}

procedure TFormRecalcPodr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormRecalcPodr.FormCreate(Sender: TObject);
begin
     Caption:='Перерасчет '+NAME_SERV(NSRV);
end;

procedure TFormRecalcPodr.BitBtn1Click(Sender: TObject);
 var Curr_Person:Person_Ptr;
     i:integer;
begin
     ProgressBar1.Min:=0;
     ProgressBar1.Max:=Count_Person;
     ProgressBar1.Position:=0;
     i:=0;
     Curr_Person:=Head_Person;
     while (Curr_Person<>Nil) do
       begin
            inc(i);
            ProgressBar1.Position := i;
            LabelFio.Caption      := Curr_Person^.FIO;
            Application.ProcessMessages;

            Calc_Naud(I,31);
            Curr_Person:=Curr_Person^.Next;
       end;
//     ModalResult:=mrOk;
     Close;
end;

end.
