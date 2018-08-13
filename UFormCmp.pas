unit UFormCmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons, dxExEdtr, DBCtrls,
  dxCntner, dxTL, dxDBCtrl, dxDBGrid;

type
  TFormCmp = class(TForm)
    DateTimePickerFr: TDateTimePicker;
    DateTimePickerTo: TDateTimePicker;
    RadioGroupWR: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCmp: TFormCmp;

implementation
 uses UPODataModule,ComObj,DateUtils;

{$R *.dfm}

procedure TFormCmp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormCmp.BitBtn1Click(Sender: TObject);
 var DateFr,DateTo:TDateTime;
     ShifrWr:Integer;
     E:Variant;
     Row:Integer;
begin
     DateFr:=StartOfTheMonth(DateTimePickerFr.Date);
     DateTo:=StartOfTheMonth(DateTimePickerTo.Date);
 
     ShifrWr:=RadioGroupWR.ItemIndex;
     if ShifrWr=1 then
        ShifrWr:=2
     else
        ShifrWr:=1;
     E:=CreateOleObject('Excel.Application');
     E.Visible:=True;
     E.WorkBooks.Add;  
     dmPO.pFIBdsShtCmp.Params[0].AsDateTime := DateFr  ;
     dmPO.pFIBdsShtCmp.Params[1].AsDateTime := DateTo  ;
     dmPO.pFIBdsShtCmp.Params[2].AsInteger  := ShifrWr ;
     dmPO.pFIBdsShtCmp.Transaction.StartTransaction;
     dmPO.pFIBdsShtCmp.Open;
     Row:=1;
     while not dmPO.pFIBdsShtCmp.Eof do
       begin
            Inc(Row);
            E.ActiveSheet.Cells[Row,1].Value:=dmPO.pFIBdsShtCmpTabno.Value;
            E.ActiveSheet.Cells[Row,2].Value:=dmPO.pFIBdsShtCmpFIO.Value;
            E.ActiveSheet.Cells[Row,3].Value:=dmPO.pFIBdsShtCmpMes.Value;
            dmPO.pFIBdsShtCmp.Next;
       end;
     dmPO.pFIBdsShtCmp.Close;
     dmPO.pFIBdsShtCmp.Transaction.Commit;

end;

end.
