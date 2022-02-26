unit UFormClearBolnGenerators;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormClearBolnGenerators = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormClearBolnGenerators: TFormClearBolnGenerators;

implementation
   uses UFibModule,uFormWait,ScrDef;

{$R *.dfm}

procedure TFormClearBolnGenerators.BitBtn1Click(Sender: TObject);
var SQLStmnt:string;
begin
     FormWait.Show;
     SQLStmnt:='ALTER SEQUENCE GBOLNTMPSUMMY RESTART WITH 1';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     SQLStmnt:='ALTER SEQUENCE GBOLNATMP RESTART WITH 1';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     SQLStmnt:='ALTER SEQUENCE GBOLNTMPRES RESTART WITH 1';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     SQLStmnt:='ALTER SEQUENCE GOTP_SUMMY_TMP RESTART WITH 1';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     SQLStmnt:='ALTER SEQUENCE GOTP_ADD_TMP RESTART WITH 1';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     SQLStmnt:='ALTER SEQUENCE GOTP_RES_TMP RESTART WITH 1';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     SQLStmnt:='ALTER SEQUENCE gkomandtmpsummy RESTART WITH 1';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     SQLStmnt:='ALTER SEQUENCE gkomandaddtmp RESTART WITH 1';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     SQLStmnt:='ALTER SEQUENCE gkomandrestmp RESTART WITH 1';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
     FormWait.Hide;
     if not needHideGenerMessages then
        ShowMessage('Готово!.'+^M+'Не забудьте очистить временные таблицы для предотвращения возможности дублирования их первичных ключей.');
end;

end.
