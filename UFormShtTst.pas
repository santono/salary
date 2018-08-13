unit UFormShtTst;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons;

type
  TFormShtTst = class(TForm)
    DateTimePickerFr: TDateTimePicker;
    Label1: TLabel;
    RadioGroupWr: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Button1: TButton;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormShtTst: TFormShtTst;

implementation
  uses UPODataModule,DateUtils,ComObj;

{$R *.dfm}

procedure TFormShtTst.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormShtTst.BitBtn1Click(Sender: TObject);
 var SQLStmnt : string;
     DateFr   : TDateTime;
     ShifrWr  : Integer;
     DateS    : string;
     E        : Variant;
     row      : Integer;
begin
     DateFr:=StartOfTheMonth(DateTimePickerFr.Date);
     if RadioGroupWR.ItemIndex=1 then ShifrWr:=1
     else ShifrWr:=1;
     DateS:=IntToStr(YearOf(DateFr))+'-'+IntToStr(MonthOf(DateFr))+'-01';

     SQLStmnt:='select a.tabno,a.fio,b.shifrpod,(coalesce(a.koefbud,0)+coalesce(a.koefvne,0)) from tb_k_shtrasppedrec a';
     SQLStmnt:=Trim(SQLStmnt)+' join tb_k_shtraspped b on b.shifrid=a.shifridown';
     SQLStmnt:=Trim(SQLStmnt)+' where b.datefr='''+DateS+'''';
     SQLStmnt:=Trim(SQLStmnt)+' and (coalesce(a.koefbud,0)+coalesce(a.koefvne,0))>1';
     dmPO.pFIBQueryR.SQL.Clear;
     dmPO.pFIBQueryR.SQL.Add(SQLStmnt);
     dmPO.pFIBQueryR.Transaction.StartTransaction;
     dmPO.pFIBQueryR.ExecQuery;
     E:=CreateOleObject('Excel.Application');
     E.Visible:=True;
     E.WorkBooks.Add;
     Row:=1;
     while not dmPO.pFIBQueryR.Eof do
      begin
            Inc(Row);
            E.ActiveSheet.Cells[Row,1].Value:=dmPO.pFIBQueryR.Fields[0].AsInteger;
            E.ActiveSheet.Cells[Row,2].Value:=dmPO.pFIBQueryR.Fields[1].AsString;
            E.ActiveSheet.Cells[Row,3].Value:=dmPO.pFIBQueryR.Fields[2].AsInteger;
            E.ActiveSheet.Cells[Row,4].Value:=dmPO.pFIBQueryR.Fields[3].AsFloat;
            dmPO.pFIBQueryR.Next;
      end;
 //    E.WorkBooks.Close;
     dmPO.pFIBQueryR.Transaction.Commit;
     if row=1 then
        ShowMessage('Нет сотрудников со ставкой >1');

end;

procedure TFormShtTst.FormCreate(Sender: TObject);
begin
     RadioGroupWR.ItemIndex:=0;
end;

procedure TFormShtTst.BitBtn2Click(Sender: TObject);
 var SQLStmnt : string;
     DateFr   : TDateTime;
     ShifrWr  : Integer;
     DateS    : string;
     E        : Variant;
     row      : Integer;
begin
     DateFr:=StartOfTheMonth(DateTimePickerFr.Date);
     if RadioGroupWR.ItemIndex=1 then ShifrWr:=2
     else ShifrWr:=1;
     DateS:=IntToStr(YearOf(DateFr))+'-'+IntToStr(MonthOf(DateFr))+'-01';

     SQLStmnt:='select tabno,fio,mes from PR_K_CMPSTAGSHTRASPWITHSAL('''+ DateS+''','+IntToStr(ShifrWr)+')';
     dmPO.pFIBQueryR.SQL.Clear;
     dmPO.pFIBQueryR.SQL.Add(SQLStmnt);
     dmPO.pFIBQueryR.Transaction.StartTransaction;
     dmPO.pFIBQueryR.ExecQuery;
     E:=CreateOleObject('Excel.Application');
     E.Visible:=True;
     E.WorkBooks.Add;
     Row:=1;
     while not dmPO.pFIBQueryR.Eof do
      begin
            Inc(Row);
            E.ActiveSheet.Cells[Row,1].Value:=dmPO.pFIBQueryR.Fields[0].AsInteger;
            E.ActiveSheet.Cells[Row,2].Value:=dmPO.pFIBQueryR.Fields[1].AsString;
            E.ActiveSheet.Cells[Row,3].Value:=dmPO.pFIBQueryR.Fields[2].AsString;
            dmPO.pFIBQueryR.Next;
      end;
 //    E.WorkBooks.Close;
     dmPO.pFIBQueryR.Transaction.Commit;
     if row=1 then
        ShowMessage('Нет не совпадений в шт. расписаниях');

end;

procedure TFormShtTst.Button1Click(Sender: TObject);
 var SQLStmnt : string;
     DateFr   : TDateTime;
     ShifrWr  : Integer;
     DateS    : string;
     E        : Variant;
     row      : Integer;
begin
     SQLStmnt:='select a.tabno,a.fio from tb_k_kadry a';
     SQLStmnt:=Trim(SQLStmnt)+' where exists(select * from tb_k_kadrypr b';
     SQLStmnt:=Trim(SQLStmnt)+' where b.codetype=8 and a.shifrid=b.shifridowner)';
     dmPO.pFIBQueryR.SQL.Clear;
     dmPO.pFIBQueryR.SQL.Add(SQLStmnt);
     dmPO.pFIBQueryR.Transaction.StartTransaction;
     dmPO.pFIBQueryR.ExecQuery;
     E:=CreateOleObject('Excel.Application');
     E.Visible:=True;
     E.WorkBooks.Add;
     Row:=1;
     while not dmPO.pFIBQueryR.Eof do
      begin
            Inc(Row);
            E.ActiveSheet.Cells[Row,1].Value:=dmPO.pFIBQueryR.Fields[0].AsInteger;
            E.ActiveSheet.Cells[Row,2].Value:=dmPO.pFIBQueryR.Fields[1].AsString;
   //         E.ActiveSheet.Cells[Row,3].Value:=dmPO.pFIBQueryR.Fields[2].AsString;
            dmPO.pFIBQueryR.Next;
      end;
 //    E.WorkBooks.Close;
     dmPO.pFIBQueryR.Transaction.Commit;
     if row=1 then
        ShowMessage('Нет доцентов или проффесоров на др. ставке');

end;

procedure TFormShtTst.BitBtn4Click(Sender: TObject);
 var SQLStmnt : string;
     DateFr   : TDateTime;
     ShifrWr  : Integer;
     DateS    : string;
     E        : Variant;
     row      : Integer;
begin
     DateFr:=StartOfTheMonth(DateTimePickerFr.Date);
     DateS:=IntToStr(YearOf(DateFr))+'-'+IntToStr(MonthOf(DateFr))+'-01';
     SQLStmnt:='select b.shifrwr, b.tabno,b.fio,a.shifrpod,count(*) from tb_k_shtraspped a';
     SQLStmnt:=Trim(SQLStmnt)+' join tb_k_shtrasppedrec b on b.shifridown=a.shifrid';
     SQLStmnt:=Trim(SQLStmnt)+' where a.datefr='''+DateS+'''';
     SQLStmnt:=Trim(SQLStmnt)+' group by 1,2,3,4';
     SQLStmnt:=Trim(SQLStmnt)+' having count(*)>1';
     dmPO.pFIBQueryR.SQL.Clear;
     dmPO.pFIBQueryR.SQL.Add(SQLStmnt);
     dmPO.pFIBQueryR.Transaction.StartTransaction;
     dmPO.pFIBQueryR.ExecQuery;
     E:=CreateOleObject('Excel.Application');
     E.Visible:=True;
     E.WorkBooks.Add;
     Row:=1;
     while not dmPO.pFIBQueryR.Eof do
      begin
            Inc(Row);
            E.ActiveSheet.Cells[Row,1].Value:=dmPO.pFIBQueryR.Fields[0].AsInteger;
            E.ActiveSheet.Cells[Row,2].Value:=dmPO.pFIBQueryR.Fields[1].AsString;
            E.ActiveSheet.Cells[Row,3].Value:=dmPO.pFIBQueryR.Fields[2].AsString;
            E.ActiveSheet.Cells[Row,4].Value:=dmPO.pFIBQueryR.Fields[3].AsString;
            E.ActiveSheet.Cells[Row,5].Value:=dmPO.pFIBQueryR.Fields[4].AsString;
            dmPO.pFIBQueryR.Next;
      end;
 //    E.WorkBooks.Close;
     dmPO.pFIBQueryR.Transaction.Commit;
     if row=1 then
        ShowMessage('Нет сотрудников, у которых количество строк с одним видом работы >1');


end;

procedure TFormShtTst.BitBtn5Click(Sender: TObject);
 var SQLStmnt : string;
     DateFr   : TDateTime;
     ShifrWr  : Integer;
     DateS    : string;
     E        : Variant;
     row      : Integer;
begin
     DateFr:=StartOfTheMonth(DateTimePickerFr.Date);
     DateS:=IntToStr(YearOf(DateFr))+'-'+IntToStr(MonthOf(DateFr))+'-01';
     SQLStmnt:='select b.tabno,b.fio, a.shifrpod from tb_k_shtraspped a';
     SQLStmnt:=Trim(SQLStmnt)+' join tb_k_shtrasppedrec b on a.shifrid=b.shifridown';
     SQLStmnt:=Trim(SQLStmnt)+' where a.datefr='''+DateS+''' and';
     SQLStmnt:=Trim(SQLStmnt)+' b.fixed=1';
     dmPO.pFIBQueryR.SQL.Clear;
     dmPO.pFIBQueryR.SQL.Add(SQLStmnt);
     dmPO.pFIBQueryR.Transaction.StartTransaction;
     dmPO.pFIBQueryR.ExecQuery;
     E:=CreateOleObject('Excel.Application');
     E.Visible:=True;
     E.WorkBooks.Add;
     Row:=1;
     while not dmPO.pFIBQueryR.Eof do
      begin
            Inc(Row);
            E.ActiveSheet.Cells[Row,1].Value:=dmPO.pFIBQueryR.Fields[0].AsInteger;
            E.ActiveSheet.Cells[Row,2].Value:=dmPO.pFIBQueryR.Fields[1].AsString;
            E.ActiveSheet.Cells[Row,3].Value:=dmPO.pFIBQueryR.Fields[2].AsString;
            dmPO.pFIBQueryR.Next;
      end;
 //    E.WorkBooks.Close;
     dmPO.pFIBQueryR.Transaction.Commit;
     if row=1 then
        ShowMessage('Нет сотрудников, у которых фиксирована запись в шт.расписании');
end;

end.
