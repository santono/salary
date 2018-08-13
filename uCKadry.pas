unit uCKadry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, StdCtrls, Buttons;

type
  TfrmKadry = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    tblCKADRYdbf: TTable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKadry: TfrmKadry;

implementation
 uses DbUnit,ScrUtil;

{$R *.dfm}

procedure TfrmKadry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     action:=caFree;
end;

procedure TfrmKadry.BitBtn2Click(Sender: TObject);
begin
     tblCKADRYdbf.Open;
     Datamodule1.tblCKadry.Open;
     tblCKADRYdbf.First;
     while not tblCKADRYdbf.Eof do
      begin
           Datamodule1.tblCKadry.Insert;
           Datamodule1.tblCKadry.FieldByName('TABNO').AsInteger:=tblCKADRYdbf.FieldByName('Tabno').ASInteger;
           Datamodule1.tblCKadry.FieldByName('FIO').AsString:=dostowin(tblCKADRYdbf.FieldByName('FIO').ASString);
           Datamodule1.tblCKadry.FieldByName('W_PLACE').AsInteger:=tblCKADRYdbf.FieldByName('WORK_PLACE').ASInteger;
           Datamodule1.tblCKadry.FieldByName('NAL_CODE').AsString:=tblCKADRYdbf.FieldByName('NAL_CODE').ASString;
           Datamodule1.tblCKadry.Post;
           tblCKADRYdbf.Next;
      end;
     tblCKADRYdbf.Close;
     Datamodule1.tblCKadry.Close;
end;

end.
