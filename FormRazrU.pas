unit FormRazrU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms, dxTL, dxCntner, FIBDatabase, pFIBDatabase, dxEditor,
  dxEdLib, dxDBELib, StdCtrls, Menus, ExtCtrls, DBCtrls;

type
  TFormRazr = class(TForm)
    pFIBDataSetR: TpFIBDataSet;
    pFIBDataSetRRAZR: TFIBIntegerField;
    pFIBDataSetRPROC: TFIBBCDField;
    pFIBDataSetROKLAD: TFIBBCDField;
    pFIBDataSetRDATEFR: TFIBDateField;
    pFIBDataSetRKOEF_BOLN: TFIBBCDField;
    pFIBDataSetRKOEF_OTP: TFIBBCDField;
    pFIBDataSetRSHIFRID: TFIBIntegerField;
    DataSourceR: TDataSource;
    pFIBTransactionRRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    dxDBGridR: TdxDBGrid;
    dxDBGridRRAZR: TdxDBGridSpinColumn;
    dxDBGridRDATEFR: TdxDBGridDateColumn;
    dxDBGridRSHIFRID: TdxDBGridColumn;
    dxDBGridROKLAD: TdxDBGridCalcColumn;
    dxDBGridRPROC: TdxDBGridCalcColumn;
    dxDBGridRKOEF_BOLN: TdxDBGridCalcColumn;
    dxDBGridRKOEF_OTP: TdxDBGridCalcColumn;
    pFIBDataSetData: TpFIBDataSet;
    pFIBDataSetDataDATEFR: TFIBDateField;
    DataSourceData: TDataSource;
    ComboBoxData: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    DBNavigator1: TDBNavigator;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxDataSelect(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    CurrentDate : TDateTime;
    procedure FillComboBox;
    procedure OpenDataSetR;
    procedure MakeRazrForData;
    procedure CalcKoefOtp;

  public
    { Public declarations }
  end;

var
  FormRazr: TFormRazr;

implementation
  uses UFibModule,UFormEditChangeRazrGrid,DateUtils,ScrUtil, UFormWaitMess;

{$R *.dfm}

procedure TFormRazr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetR.Active then
        pFIBDataSetR.Active:=false;
     if pFIBDataSetData.Active then
        pFIBDataSetData.Active:=false;
     if pFIBDataSetR.Transaction.Active then
        pFIBDataSetR.Transaction.COMMIT;
     if pFIBDataSetR.UpdateTransaction.Active then
        pFIBDataSetR.UpdateTransaction.COMMIT;
     Action:=caFree;
end;

procedure TFormRazr.FillComboBox;
 var S : string;
     i : integer;
     cDate:TDateTime;
 begin
      ComboBoxData.Items.Clear;
      pFIBDataSetData.First;
      i := 0;
      currentDate:=encodedate(2000,1,1);
      while not pFIBDataSetData.Eof do
        begin
             Inc(I);
             cdate:=pFIBDataSetData.Fields[0].AsDateTime;
             S:=DateTimeToStr(cdate);
             if cDate>currentDate then
                currentDate:=cDate;
//             if i=1 then
//                ComboBoxData.Text := Trim(S);
             ComboBoxData.Items.Add(Trim(S));
             pFIBDataSetData.Next;
        end;
      if ComboBoxData.Items.Count>0 then
         begin
              CurrentDate:=StrToDate(ComboBoxData.Items[ComboBoxData.Items.Count-1]);
              ComboBoxData.ItemIndex:=ComboBoxData.Items.Count-1;
         end
      else
         CurrentDate:=Now;

 end;

procedure TFormRazr.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetR.Transaction.Active then
        pFIBDataSetR.Transaction.StartTransaction;
     if not pFIBDataSetData.Active then
        pFIBDataSetData.Active:=true;

     FillComboBox;
     OpenDataSetR;
end;

procedure TFormRazr.OpenDataSetR;
 begin
     if pFIBDataSetR.Active then
        pFIBDataSetR.Active:=false;
     pFIBDataSetR.ParamByName('DATEFR').AsDate:=CurrentDate;
     pFIBDataSetR.Prepare;
     if not pFIBDataSetR.Active then
        pFIBDataSetR.Active:=true;
 end;

procedure TFormRazr.ComboBoxDataSelect(Sender: TObject);
 var S:String;
begin
     if ComboBoxData.ItemIndex>=0 then
        begin
             S := ComboBoxData.Items[ComboBoxData.ItemIndex];
             CurrentDate := StrToDate(S);
             OpenDataSetR;
        end;
end;

procedure TFormRazr.N1Click(Sender: TObject);
begin
   Application.CreateForm(TFormEditChangeRazrGrid, FormEditChangeRazrGrid);
   FormEditChangeRazrGrid.ShowModal;
end;

procedure TFormRazr.MakeRazrForData;
 var i:integer;
     d,m,y:word;
     d1,m1,y1:word;
     id,im,iy:word;
     wd:tdatetime;
     NeedDate:TDateTime;
     NeedDateS:String;
     SQLStmnt,YS:string;
 begin
       NeedDateS := InputBox('Ввод даты для генерации ставок разрядов', 'Введите дату (строго в указанном формате ГГГГ.ММ.ДД)', '2009.07.01');
       NeedDateS := trim(NeedDateS);
       if Length(NeedDateS)<>10 then
          begin
               ShowMessage('Неверно указана дата (длина ровно 10 символов');
               Exit;
          end;
       YS:=copy(NeedDateS,1,4);
       val(YS,IY,I);
       if (I<>0) then
          begin
               ShowMessage('Неверно указан год '+YS);
               Exit;
          end;
       YS:=copy(NeedDateS,6,2);
       val(YS,IM,I);
       if (I<>0) then
          begin
               ShowMessage('Неверно указан месяц '+YS);
               Exit;
          end;
       if not ((IM>0) and (IM<13)) then
          begin
               ShowMessage('Неверно указан месяц '+IntToStr(IM));
               Exit;
          end;
       YS:=copy(NeedDateS,9,2);
       val(YS,ID,I);
       if (I<>0) then
          begin
               ShowMessage('Неверно указан день '+YS);
               Exit;
          end;
       if not ((ID>0) and (ID<31)) then
          begin
               ShowMessage('Неверно указан день '+IntToStr(ID));
               Exit;
          end;
       NeedDate:=EnCodeDate(IY,IM,ID);
       if FIB.pFIBQuery.Open then
          FIB.pFIBQuery.Close;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       if FIB.pFIBQuerySecond.Open then
          FIB.pFIBQuerySecond.Close;
       if FIB.pFIBQuerySecond.Transaction.Active then
          FIB.pFIBQuerySecond.Transaction.Commit;
       DeCodeDate(NeedDate,y,m,d);
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('select count(*) from TB_RAZR_PROC where DATEFR='''+IntToStr(y)+'-'+IntToStr(m)+'-'+IntToStr(d)+'''');
       FIB.pFIBQuery.Transaction.StartTransaction;
       FIB.pFIBQuery.ExecQuery;
       i:=FIB.pFIBQuery.Fields[0].AsInteger;
       if i>0 then
          begin
               FIB.pFIBQuery.Close;
               FIB.pFIBQuery.Transaction.Commit;
               ShowMessage('За '+DateToStr(NeedDate)+' Данные по изменению разрядов уже введены');
               Exit;
          end;
       FIB.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('select first 1 datefr from TB_RAZR_PROC where DATEFR<'''+IntToStr(y)+'-'+IntToStr(m)+'-'+IntToStr(d)+''' group by 1 order by 1 desc');
       FIB.pFIBQuery.ExecQuery;
       WD:=FIB.pFIBQuery.Fields[0].AsDate;
       if YearOf(WD)<2000 then
          begin
               FIB.pFIBQuery.Close;
               FIB.pFIBQuery.Transaction.Commit;
               ShowMessage('Нет данных по дате меньшей чем '+DateToStr(NeedDate));
               Exit;
          end;

       DeCodeDate(WD,y1,m1,d1);

       FIB.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('select RAZR,PROC,OKLAD,DATEFR,KOEF_BOLN,KOEF_OTP from TB_RAZR_PROC where DATEFR='''+IntToStr(y1)+'-'+IntToStr(m1)+'-'+IntToStr(d1)+'''');
       if not FIB.pFIBQuerySecond.Transaction.Active then
          FIB.pFIBQuerySecond.Transaction.StartTransaction;
       FIB.pFIBQuery.ExecQuery;
       while not FIB.pFIBQuery.Eof do
         begin
              if FIB.pFIBQuerySecond.Open then
                 FIB.pFIBQuerySecond.Close;
              FIB.pFIBQuerySecond.SQL.Clear;
              SQLStmnt:='INSERT INTO TB_RAZR_PROC (RAZR,PROC,OKLAD,DATEFR,KOEF_BOLN,KOEF_OTP) VALUES(';
              SQLStmnt:=SQLStmnt+IntToStr(FIB.pFIBQuery.Fields[0].AsInteger)+',';
              SQLStmnt:=SQLStmnt+FormatFloatPoint(FIB.pFIBQuery.Fields[1].AsFloat)+',';
              SQLStmnt:=SQLStmnt+FormatFloatPoint(FIB.pFIBQuery.Fields[2].AsFloat)+',';
              SQLStmnt:=SQLStmnt+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
              SQLStmnt:=SQLStmnt+FormatFloatPoint(FIB.pFIBQuery.Fields[4].AsFloat)+',';
              SQLStmnt:=SQLStmnt+FormatFloatPoint(FIB.pFIBQuery.Fields[5].AsFloat)+')';
              FIB.pFIBQuerySecond.SQL.Add(SQLStmnt);
              FIB.pFIBQuerySecond.ExecQuery;
              FIB.pFIBQuery.Next;
         end;
       if FIB.pFIBQuerySecond.Open then
          FIB.pFIBQuerySecond.Close;
       if FIB.pFIBQuery.Open then
          FIB.pFIBQuery.Close;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       if FIB.pFIBQuerySecond.Transaction.Active then
          FIB.pFIBQuerySecond.Transaction.Commit;
       ShowMessage('Данные сгенерированы. Закройте и вновь откройте справочник разрядов. Задйте дату изменения окладов и пересчитайте коэффициенты отпускных.');


 end;



procedure TFormRazr.N2Click(Sender: TObject);
begin
     MakeRazrForData;
end;

procedure TFormRazr.CalcKoefOtp;
 var i:integer;
     d,m,y:word;
     wd:tdatetime;
     SQLStmnt,ds:string;
 begin
       wd:=pFIBDataSetRDATEFR.Value;
       if YearOf(wd)<2011 then
          begin
               ShowMessage('Неверная дата');
               Exit;
          end;
       if FIB.pFIBQuery.Open then
          FIB.pFIBQuery.Close;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       FIB.pFIBQuery.SQL.Clear;
       DecodeDate(wd,y,m,d);
       ds:=IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
       FIB.pFIBQuery.SQL.Add('EXECUTE PROCEDURE PR_CALCKOEFOTP '''+ds+'''');
       FIB.pFIBQuery.Transaction.StartTransaction;
       FIB.pFIBQuery.ExecQuery;
       FIB.pFIBQuery.Close;
       FIB.pFIBQuery.Transaction.Commit;
       FormWaitMess.SetMessage('Коэффициенты отпускных рассчитаны');
       FormWaitMess.Show;
       repeat
             Application.ProcessMessages;
       until FormWaitMess.Timer1.Enabled=false;
       FormWaitMess.Hide;

 end;

procedure TFormRazr.N3Click(Sender: TObject);
begin
     CalcKoefOtp;
     pFIBDataSetR.Refresh;
end;

end.
