unit UFormRepPensionery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepPensionery = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtIn: TDateTimePicker;
    Label2: TLabel;
    rgKateg: TRadioGroup;
    dsoPens: TDataSource;
    dsPens: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsPensTABNO: TFIBIntegerField;
    dsPensNAL_CODE: TFIBStringField;
    dsPensFIO: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateReport;

  public
    { Public declarations }
  end;

var
  FormRepPensionery: TFormRepPensionery;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj;
{$R *.dfm}

procedure TFormRepPensionery.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepPensionery.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);
     rgKateg.ItemIndex:=0;

end;

procedure TFormRepPensionery.BitBtn1Click(Sender: TObject);
begin
     CreateReport;
end;

procedure TFormRepPensionery.CreateReport;
  var
      i:Integer;
      shifr:integer;
      exRow:integer;
      E,WC:Variant;
      s:string;
  begin
       FormWait.Show;
       Application.ProcessMessages;
       dsPens.Params[0].Value:=yearOf(dtIn.Date);
       dsPens.Params[1].Value:=monthOf(dtIn.Date);
       if rgKateg.ItemIndex=1 then
          shifr:=invalid_shifr+500
       else
          shifr:=pensioner_shifr+500;
       dsPens.Params[2].Value:=shifr;
       dsPens.Transaction.StartTransaction;
       dsPens.Open;
       i:=0;
       while not dsPens.Eof do
        begin
             inc(i);
             if i=1 then
                begin
                     try
                       E:=CreateOleObject('Excel.Application');
                     except
                       ShowMessage('Ошибка запуска Excel');
                       Exit;
                     end;
                     E.WorkBooks.add;
                     E.Visible:=True;
                     exRow:=1;
                     if rgKateg.ItemIndex=1 then
                        s:='Список инвалидов за'
                     else
                        s:='Список пенсионеров за';
                     s:=s+' '+getMonthRus(monthOf(dtIn.Date))+' '+intToStr(yearOf(dtIn.Date))+' г.';

                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1] := s;

                end;
             inc(exRow);
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1] := i;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2] := trim(dsPensFIO.Value);
             dsPens.Next;
        end;
       dsPens.Close;
       dsPens.Transaction.Commit;
       formWait.Hide;
       Application.ProcessMessages;
       if i<1 then
          showMessage('Не найдено результатов');
  end;


end.
