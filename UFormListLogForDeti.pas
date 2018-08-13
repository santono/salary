unit UFormListLogForDeti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, StdCtrls, Buttons, ComCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFormListLogForDeti = class(TForm)
    pFIBdsLgoD: TpFIBDataSet;
    pFIBLgoD: TpFIBTransaction;
    dsoLgoD: TDataSource;
    pFIBdsLgoDTABNO: TFIBIntegerField;
    pFIBdsLgoDFIO: TFIBStringField;
    pFIBdsLgoDPRIM: TFIBIntegerField;
    dxDBGridLgoD: TdxDBGrid;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    dxDBGridLgoDTABNO: TdxDBGridMaskColumn;
    dxDBGridLgoDFIO: TdxDBGridMaskColumn;
    dxDBGridLgoDPRIM: TdxDBGridMaskColumn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormListLogForDeti: TFormListLogForDeti;

implementation
 uses UFibModule,ScrDef,dateUtils;

{$R *.dfm}

procedure TFormListLogForDeti.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBdsLgoD.Active then
        pFIBdsLgoD.Close;
     if pFIBdsLgoD.Transaction.Active then
        pFIBdsLgoD.Transaction.Commit;
     Action:=caFree;
end;

procedure TFormListLogForDeti.FormCreate(Sender: TObject);
var y,m,d:Integer;
begin
     if pFIBdsLgoD.Active then
        pFIBdsLgoD.Close;
     if not pFIBdsLgoD.Transaction.Active then
        pFIBdsLgoD.Transaction.StartTransaction;
     pFIBdsLgoD.Prepare;
     m:=nmes;
     d:=1;
     y:=Work_Year_Val;
     Dec(m);
     if m<1 then
        begin
             m:=12;
             Dec(Y);
        end;
     DateTimePicker1.Date:=EncodeDate(y,m,d);
end;

procedure TFormListLogForDeti.BitBtn1Click(Sender: TObject);
begin
     if pFIBdsLgoD.Active then
        pFIBdsLgoD.Close;
     pFIBdsLgoD.Params[0].AsInteger:=YearOf(DateTimePicker1.Date);
     pFIBdsLgoD.Params[1].AsInteger:=MonthOf(DateTimePicker1.Date);
     pFIBdsLgoD.Params[2].AsInteger:=127;
     Caption:='Ћьготы на детей по под.налогу';
     pFIBdsLgoD.Open;
     Application.ProcessMessages;

end;

procedure TFormListLogForDeti.BitBtn2Click(Sender: TObject);
begin
     if pFIBdsLgoD.Active then
        pFIBdsLgoD.Close;
     pFIBdsLgoD.Params[0].AsInteger:=YearOf(DateTimePicker1.Date);
     pFIBdsLgoD.Params[1].AsInteger:=MonthOf(DateTimePicker1.Date);
     pFIBdsLgoD.Params[2].AsInteger:=107;
     Caption:='ѕенсионеры';
     pFIBdsLgoD.Open;
     Application.ProcessMessages;

end;

procedure TFormListLogForDeti.BitBtn3Click(Sender: TObject);
begin
     if pFIBdsLgoD.Active then
        pFIBdsLgoD.Close;
     pFIBdsLgoD.Params[0].AsInteger:=YearOf(DateTimePicker1.Date);
     pFIBdsLgoD.Params[1].AsInteger:=MonthOf(DateTimePicker1.Date);
     pFIBdsLgoD.Params[2].AsInteger:=112;
     Caption:='»нвалиды';
     pFIBdsLgoD.Open;
     Application.ProcessMessages;

end;

end.
