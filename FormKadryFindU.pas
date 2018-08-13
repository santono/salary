unit FormKadryFindU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormFindKadry = class(TForm)
    EditPar:  TEdit;
    ButFind:  TBitBtn;
    BitBtn2:  TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure ButFindClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function  Execute(var RetVal:integer): boolean;
    procedure GetPar(var S:string;var Col:integer);
  private
         FindText:String;
         FindCol:integer;
         RetCode:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFindKadry: TFormFindKadry;

implementation
uses
    FormKadryClU,ScrUtil;
{$R *.dfm}

procedure TFormFindKadry.BitBtn2Click(Sender: TObject);
begin
{    Action:=caFree;}
end;

procedure TFormFindKadry.ButFindClick(Sender: TObject);
var S : String;
    I,J,Col:Integer;
begin

     if Length(Trim(EditPar.Text))=0 then
        begin
             ShowMessage('Не заполнена информация');
             Exit;
        end;
     S := Trim(EditPar.Text);
     val(S,I,J);
     if (j=0) then
        begin
             if (I < 12000)   then Col := 0
                              else
             if (I>800000000) then Col := 3
                              else
                begin
                      ShowMessage('Не верное число.');
                      Exit;
                end;
        end
              else
        Col:=2;
     FindText := Trim(S);
     FindCol  := Col;
     ModalResult := mrOk;

end;

procedure TFormFindKadry.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //    Action:=caFree;
end;

function TFormFindKadry.Execute(var RetVal:integer): boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    RetVal:=RetCode;
    Result:=true;
  end else begin
    result := false;
    RetVal:=RetCode;
  end;
end;

procedure TFormFindKadry.GetPar(var S:string;var Col:integer);
 begin
       S      := Self.FindText;
       Col    := Self.FindCol;
 end;

end.
