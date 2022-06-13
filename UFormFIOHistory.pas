unit UFormFIOHistory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,UFibModule, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormFIOHistory = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    dsFioHistory: TpFIBDataSet;
    dsoFIOHistory: TDataSource;
    trFioHistory: TpFIBTransaction;
    dsFioHistoryFIO: TFIBStringField;
    dsFioHistoryF: TFIBStringField;
    dsFioHistoryT: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    wantedTabno:Integer;
    currentFio:string;
  public
    { Public declarations }
    constructor CreateByTabno(AOwner: TComponent;tabno:Integer;fio:string);
  end;

var
  FormFIOHistory: TFormFIOHistory;

implementation
 uses USQLUnit,uFormWait;

{$R *.dfm}

constructor TFormFIOHistory.CreateByTabno(AOwner: TComponent;tabno:Integer;fio:string);
  begin
       inherited Create(AOwner);
       wantedTabno:=tabno;
       currentFio:=fio;
       Caption:='История изменения фамилий для т.н. '+intToStr(wantedTabno)+' '+trim(fio);
       memo1.Lines.Clear;
  end;
procedure TFormFIOHistory.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormFIOHistory.BitBtn1Click(Sender: TObject);
var SQLStmnt:string;
    line:string;
begin
    dsFioHistory.Params[0].Value:=wantedTabno;
    dsFioHistory.Transaction.StartTransaction;
    FormWait.show;
    Application.ProcessMessages;
    dsFioHistory.Open;
    FormWait.hide;
    Application.ProcessMessages;
    while not dsFioHistory.Eof do
      begin
           line:=Trim(dsFioHistoryFIO.AsString);
           line:=line+' '+Trim(dsFioHistoryF.AsString);
           line:=line+' '+Trim(dsFioHistoryT.AsString);
           Memo1.Lines.Add(Line);
           dsFioHistory.Next;
      end;
    dsFioHistory.close;
    dsFioHistory.Transaction.Commit;
    Application.ProcessMessages;
end;

end.
