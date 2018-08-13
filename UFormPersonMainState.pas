{$WARNINGS OFF}
{$HINTS OFF}
unit UFormPersonMainState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,ScrDef;

type
  TFormPersonMainState = class(TForm)
    rgMain: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    constructor CreateP(aOwner:TComponent;Person:Person_Ptr);
    procedure BitBtn1Click(Sender: TObject);
  private
      MyPerson:person_Ptr;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPersonMainState: TFormPersonMainState;

implementation

{$R *.dfm}
constructor TFormPersonMainState.CreateP(aOwner:TComponent;Person:Person_Ptr);
  begin
        inherited Create(aOwner);
        MyPerson:=Person;
        if (MyPerson^.Main<0) or (MyPerson^.Main>4) then
            MyPerson^.Main:=4;
        rgMain.ItemIndex:=MyPerson^.Main;
        Label1.Caption:=Trim(MyPerson^.FIO)+' '+trim(MyPerson^.DOLG);
  end;
procedure TFormPersonMainState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormPersonMainState.BitBtn1Click(Sender: TObject);
begin
     MyPerson^.MAIN:=rgMain.ItemIndex;
     Close;
end;

end.
