unit UTFormPOUtility;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFormUtility = class(TForm)
    Panel1: TPanel;
    DateTimePickerSht: TDateTimePicker;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    DateTimePickerOrd: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Panel3: TPanel;
    DateTimePickerPrint: TDateTimePicker;
    RadioGroup2: TRadioGroup;
    BitBtn4: TBitBtn;
    Panel4: TPanel;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePickerFNew: TDateTimePicker;
    DateTimePickerFOld: TDateTimePicker;
    rgMode: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure DateTimePickerShtChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure DateTimePickerOrdChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUtility: TFormUtility;

implementation
 uses DateUtils,UPODataModule,UPOSpr,uFormWait,UFibModule;

{$R *.dfm}

procedure TFormUtility.BitBtn1Click(Sender: TObject);
var Dt,Dtt:TDateTime;
    SQLStmnt:string;
    Y,m,d:word;
    ds:string;
    mode:Integer;
begin
      Dt:=DateTimePickerSht.Date;
      if not (
               (YearOf(Dt)=2014) or
               (YearOf(Dt)=2015) or
               (YearOf(Dt)=2016) or
               (YearOf(Dt)=2017)
             ) then
         begin
              ShowMessage('Год только 2014 или 2015 или 2016 или 2017');
              Exit;
         end;
      if not (MonthOf(Dt) in [1,4,7,8,9,10,12]) then
         begin
              ShowMessage('Месяц только 1,4,7,8,9,10,12');
              Exit;
         end;
      Dtt:=RecodeDay(Dt,1);
      DecodeDate(Dtt,y,m,d);
      ds:=IntToStr(y)+'-'+IntToStr(m)+'-01';
      mode:=rgMode.ItemIndex+1;
      if (mode<>2) then mode:=1;
//      SQLStmnt:='select k from pr_k_createshraspall('''+ds+''','+IntToStr(Mode)+')';
      SQLStmnt:='select k from pr_k_createshraspall('''+ds+''')';
      dmPO.pFIBQueryW.SQL.Clear;
      dmPO.pFIBQueryW.SQL.Add(SQLStmnt);
      dmPO.pFIBQueryW.Transaction.StartTransaction;
      FormWait.Show;
      Application.ProcessMessages;
      dmPO.pFIBQueryW.ExecQuery;
      FormWait.Hide;
      dmPO.pFIBQueryW.Close;
      dmPO.pFIBQueryW.Transaction.Commit;
      ShowMessage('Штатное расписание на '+ds+' создано');

end;

procedure TFormUtility.DateTimePickerShtChange(Sender: TObject);
begin
      DateTimePickerOrd.Date:=DateTimePickerSht.Date;
      DateTimePickerPrint.Date:=DateTimePickerSht.Date;
      DateTimePickerFNew.Date:=DateTimePickerSht.Date;
      DateTimePickerFOld.Date:=DateTimePickerSht.Date;
end;

procedure TFormUtility.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormUtility.BitBtn2Click(Sender: TObject);
var Dt,Dtt:TDateTime;
    SQLStmnt:string;
    Y,m,d:word;
    ds:string;
    ShifrWr:Integer;
    mode:Integer;
 procedure ExecuteQ;
  begin
      dmPO.pFIBQueryW.SQL.Clear;
      dmPO.pFIBQueryW.SQL.Add(SQLStmnt);
      dmPO.pFIBQueryW.Transaction.StartTransaction;
      FormWait.Show;
      Application.ProcessMessages;
      dmPO.pFIBQueryW.ExecQuery;
      FormWait.Hide;
      dmPO.pFIBQueryW.Close;
      dmPO.pFIBQueryW.Transaction.Commit;

  end;
begin
      Dt:=DateTimePickerOrd.Date;
      if not((YearOf(Dt)=2014) or (YearOf(Dt)=2015) or (YearOf(Dt)=2016) or (YearOf(Dt)=2017)) then
         begin
              ShowMessage('Год только 2014 или 2015 или 2016 или 2017');
              Exit;
         end;
      if not (MonthOf(Dt) in [1,4,7,8,9,10,12]) then
         begin
              ShowMessage('Месяц только 1,4,7,8,9,10,12');
              Exit;
         end;
      Dtt:=RecodeDay(Dt,1);
      DecodeDate(Dtt,y,m,d);
      ds:=IntToStr(y)+'-'+IntToStr(m)+'-01';
      if RadioGroup1.ItemIndex=1 then
         ShifrWr:=2
      else
         ShifrWr:=1;
      mode:=rgMode.ItemIndex;
      mode:=mode+1;
      if (mode<>2) then mode:=1;
      SQLStmnt:='select k from PR_K_CREATEFULLTEXTORDER('''+ds+''','+IntToStr(ShifrWr)+','+intToStr(Mode)+')';
      ExecuteQ;
      if (mode=2) then // еще раз вызвать замдеканов
         begin
              SQLStmnt:='select k from PR_K_CREATEFULLTEXTORDER('''+ds+''','+IntToStr(ShifrWr)+',3)';
              ExecuteQ;
         end;
      ShowMessage('Текст приказа создан на '+ds+' создан');

end;

procedure TFormUtility.DateTimePickerOrdChange(Sender: TObject);
begin
      DateTimePickerPrint.Date:=DateTimePickerSht.Date;
end;

procedure TFormUtility.RadioGroup1Click(Sender: TObject);
begin
      RadioGroup2.ItemIndex:=RadioGroup1.ItemIndex;
end;

procedure TFormUtility.BitBtn4Click(Sender: TObject);
var Dt,Dtt:TDateTime;
    SQLStmnt:string;
    Y,m,d:word;
    ds:string;
    ShifrId:Integer;
    ShifrWr:Integer;
    v:Variant;
begin
      Dt:=DateTimePickerPrint.Date;
      if not ((YearOf(Dt)=2014) or (YearOf(Dt)=2015) or (YearOf(Dt)=2016) or (YearOf(Dt)=2017)) then
         begin
              ShowMessage('Год только 2014 или 2015 или 2016 или 2017');
              Exit;
         end;
      if not (MonthOf(Dt) in [1,4,7,8,9,10,12]) then
         begin
              ShowMessage('Месяц только 1,4,7,8,9,10,12');
              Exit;
         end;
      Dtt:=RecodeDay(Dt,1);
      DecodeDate(Dtt,y,m,d);
      ds:=IntToStr(y)+'-'+IntToStr(m)+'-01';
      if RadioGroup1.ItemIndex=1 then
         ShifrWr:=2
      else
         ShifrWr:=1;
      ShifrId:=0;
      SQLStmnt:='select shifrid from pr_k_getorderid('''+ds+''','+IntToStr(ShifrWr)+')';
//      dmPO.pFIBQueryR.SQL.Clear;
//      dmPO.pFIBQueryR.SQL.Add(SQLStmnt);
//      dmPO.pFIBQueryR.Transaction.StartTransaction;
//      dmPO.pFIBQueryR.ExecQuery;
//      shifrid:=dmPO.pFIBQueryR.Fields[0].AsInteger;
//      dmPO.pFIBQueryR.Close;
//      dmPO.pFIBQueryR.Transaction.Commit;
      v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
      if VarIsNumeric(v) then
         shifrId:=v
      else
         ShifrId:=0;   
      if ShifrId=0 then
         begin
              ShowMessage('Приказ не найден');
              Exit;
         end;
      if dmPO.pFIBdsOrder.Active=False then
         begin
              dmPO.pFIBdsOrder.Transaction.StartTransaction;
              dmPO.pFIBdsOrder.Open;
         end;
      if dmPO.pFIBdsOrder.Locate('ShifrId',ShifrID,[]) then
         SprEditor.StartConvertOrderToWord(Nil)
      else
         ShowMessage('Locate не сработал');
      dmPO.pFIBdsOrder.Close;
      dmPO.pFIBdsOrder.Transaction.Commit;


end;

procedure TFormUtility.Button1Click(Sender: TObject);
var Dt,Dtt:TDateTime;
    DtNew,DtOld:TDateTime;
    DtNewS,DtOldS:string;
    SQLStmnt:string;
    Y,m,d:word;
    ds:string;
    Amnt:Integer;
begin
      DtNew:=DateTimePickerFNew.Date;
      if not((YearOf(DtNew)=2014) or (YearOf(DtNew)=2015) or (YearOf(DtNew)=2016) or (YearOf(DtNew)=2017)) then
         begin
              ShowMessage('Год только 2014 или 2015 или 2016 или 2017');
              Exit;
         end;
      if not (MonthOf(DtNew) in [1,4,7,9,10,12]) then
         begin
              ShowMessage('Месяц только 1,4,7,9,10,12');
              Exit;
         end;
      DtNew:=RecodeDay(DtNew,1);
      DecodeDate(DtNew,y,m,d);
      dtNewS:=IntToStr(y)+'-'+IntToStr(m)+'-01';
      DtOld:=DateTimePickerFOld.Date;
      DecodeDate(DtOld,y,m,d);
      if not ((YearOf(DtOld)=2014) or (YearOf(DtOld)=2015) or (YearOf(DtOld)=2016) or (YearOf(DtOld)=2017)) then
         begin
              ShowMessage('Год только 2012 или 2013 или 2014 или 2015 или 2016 или 2017');
              Exit;
         end;
      if not (MonthOf(DtOld) in [1,4,7,9,10,12]) then
         begin
              ShowMessage('Месяц только 1,4,7,9,10,12');
              Exit;
         end;
      DtOld:=RecodeDay(DtOld,1);
      DecodeDate(DtOld,y,m,d);
      dtOldS:=IntToStr(y)+'-'+IntToStr(m)+'-01';
      SQLStmnt:='select finded,maked from PR_K_MOVEFIXTOSHT('''+dtnews+''','''+dtolds+''')';
      dmPO.pFIBQueryW.SQL.Clear;
      dmPO.pFIBQueryW.SQL.Add(SQLStmnt);
      dmPO.pFIBQueryW.Transaction.StartTransaction;
      FormWait.Show;
      Application.ProcessMessages;
      dmPO.pFIBQueryW.ExecQuery;
      amnt:= dmPO.pFIBQueryW.Fields[1].AsInteger;
      FormWait.Hide;
      dmPO.pFIBQueryW.Close;
      dmPO.pFIBQueryW.Transaction.Commit;
      ShowMessage('На штатное расписание на '+dtnews+' накачены фиксы из шт.расписания '+dtolds+' Всего '+IntToStr(Amnt)+' строк');

end;

end.
