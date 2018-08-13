unit uFormEditGruGru;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery;

type
  TFormEditGruGru = class(TForm)
    pFIBQuery1: TpFIBQuery;
    pFIBQuery2: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    pFIBTransaction2: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
      procedure ModifyGruGru;

  public
    { Public declarations }
  end;

var
  FormEditGruGru: TFormEditGruGru;

implementation

{$R *.dfm}

procedure TFormEditGruGru.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action := caFree;
end;


procedure TFormEditGruGru.ModifyGruGru;
 var SQLStmnt:string;
 begin
{
      if pFIBQuery1.Open then
         pFibQueryClose;
      SQLStmnt:= 'select'
}
 end;


end.
