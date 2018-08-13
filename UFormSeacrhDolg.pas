unit UFormSeacrhDolg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, ExtCtrls, DBCtrls,
  StdCtrls, Buttons;

type
  TFormSeacrhDolg = class(TForm)
    dsDolg: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsoDolg: TDataSource;
    dsDolgSHIFRDOL: TFIBIntegerField;
    dsDolgNAME: TFIBStringField;
    DBNavigator1: TDBNavigator;
    dxDBGridDolg: TdxDBGrid;
    dxDBGridDolgSHIFRDOL: TdxDBGridMaskColumn;
    dxDBGridDolgNAME: TdxDBGridMaskColumn;
    FilterString: TEdit;
    btnSearch: TBitBtn;
    btnReset: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSeacrhDolg: TFormSeacrhDolg;

implementation
  uses UFibModule;

{$R *.dfm}

procedure TFormSeacrhDolg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsDolg.Close;
     dsDolg.Transaction.Commit;
     Action:=caFree;
end;

procedure TFormSeacrhDolg.FormCreate(Sender: TObject);
begin
     dsDolg.Transaction.StartTransaction;
     dsDolg.Filtered:=False;
     dsDolg.Open;


end;

procedure TFormSeacrhDolg.btnSearchClick(Sender: TObject);
 var s:string;
begin
     s:=Trim(FilterString.Text);
     if Length(s)<1 then
        begin
             ShowMessage('Укажите строку поиска');
             Exit;
        end;
     dsDolg.Filter:='Upper(NAME) containig upper('+s+')';
     dsDolg.Filtered:=true;
     dsDolg.Refresh;
     dxDBGridDolg.Refresh;
     Application.ProcessMessages;
end;

procedure TFormSeacrhDolg.btnResetClick(Sender: TObject);
begin
     dsDolg.Filtered:=False;
     dsDolg.Refresh;
     dxDBGridDolg.Refresh;
     Application.ProcessMessages;
end;

end.
