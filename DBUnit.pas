unit DBUnit;

interface

uses
  SysUtils, Classes,  DB, 
  DBTables,DBLogDlg;

type
  TDataModule1 = class(TDataModule)
    dbSalary: TDatabase;
    tblShifr: TTable;
    tblPodr: TTable;
    tblPerson: TTable;
    tblCN: TTable;
    tblADD: TTable;
    tblSowm: TTable;
    tblUD: TTable;
    tblTabel: TTable;
    tblCKADRY: TTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
