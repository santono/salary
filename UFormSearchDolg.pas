unit UFormSearchDolg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, ExtCtrls, DBCtrls,
  StdCtrls, Buttons;

type
  TFormSearchDolg = class(TForm)
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
    procedure dsDolgFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure dxDBGridDolgDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSearchDolg: TFormSearchDolg;

implementation
  uses UFibModule,scrDef;

{$R *.dfm}

procedure TFormSearchDolg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsDolg.Close;
     dsDolg.Transaction.Commit;
     Action:=caFree;
end;

procedure TFormSearchDolg.FormCreate(Sender: TObject);
begin
     dsDolg.Transaction.StartTransaction;
     dsDolg.Filtered:=False;
     FilterString.Text:='';
     dsDolg.Open;


end;

procedure TFormSearchDolg.btnSearchClick(Sender: TObject);
 var s,f:string;
begin
     s:=Trim(FilterString.Text);
     if Length(s)<1 then
        begin
             ShowMessage('Укажите строку поиска');
             Exit;
        end;
     f:='(Upper(NAME) containig upper('''+s+'''))';
  //   dsDolg.Filter:=Trim(f);
     dsDolg.Filtered:=true;
 //    dsDolg.Refresh;
 //    dxDBGridDolg.Refresh;
     Application.ProcessMessages;
end;

procedure TFormSearchDolg.btnResetClick(Sender: TObject);
begin
     dsDolg.Filtered:=False;
//     dsDolg.Refresh;
   //  dxDBGridDolg.Refresh;
     Application.ProcessMessages;
end;

procedure TFormSearchDolg.dsDolgFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
  var retval:Boolean;
      s,f:string;
      i:Integer;
begin
      retVal:=false;
      f:=trim(AnsiUpperCase(DataSet['NAME']));
      s:=AnsiUpperCase(Trim(FilterString.Text));
      i:=Pos(s,f);
      if i>0 then
         retVal:=True;
      Accept:=retVal;   
end;

procedure TFormSearchDolg.dxDBGridDolgDblClick(Sender: TObject);
begin
     selectedInteger:=dsDolgSHIFRDOL.Value;
     ModalResult:=mrOk;
end;

end.
