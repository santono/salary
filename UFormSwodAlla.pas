unit UFormSwodAlla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DB, FIBDataSet, FIBDatabase,
  pFIBDatabase, pFIBDataSet, frxClass, frxDBSet, ExtCtrls;

type
  TFormSwodAlla = class(TForm)
    dtFR: TDateTimePicker;
    dtTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    btCreate: TBitBtn;
    BitBtn1: TBitBtn;
    dsSwod: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsSwodLINENOADD: TFIBIntegerField;
    dsSwodSHIFRSTAADD: TFIBIntegerField;
    dsSwodNAMEADD: TFIBStringField;
    dsSwodSUMMAADD: TFIBBCDField;
    dsSwodLINENOUD: TFIBIntegerField;
    dsSwodSHIFRSTAUD: TFIBIntegerField;
    dsSwodANMEUD: TFIBStringField;
    dsSwodSUMMAUD: TFIBBCDField;
    dsoSwod: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    rgModeGru: TRadioGroup;
    cbShifrGru: TComboBox;
    cbPeriod: TCheckBox;
    dsSwodAPERIOD: TFIBIntegerField;
    dsSwodBPERIOD: TFIBIntegerField;
    btSwodKRU: TButton;
    btSelPKG: TButton;
    dsKRU: TpFIBDataSet;
    dsKRUSHIFRSTA: TFIBIntegerField;
    dsKRUNAMESTA: TFIBStringField;
    dsKRUSUMMA01: TFIBBCDField;
    dsKRUSUMMA02: TFIBBCDField;
    dsKRUSUMMA03: TFIBBCDField;
    dsKRUSUMMA04: TFIBBCDField;
    dsKRUSUMMA05: TFIBBCDField;
    dsKRUSUMMA06: TFIBBCDField;
    dsKRUSUMMA07: TFIBBCDField;
    dsKRUSUMMA08: TFIBBCDField;
    dsKRUSUMMA09: TFIBBCDField;
    dsKRUSUMMA10: TFIBBCDField;
    dsKRUSUMMA11: TFIBBCDField;
    dsKRUSUMMA12: TFIBBCDField;
    dsKRUSUMMATOT: TFIBBCDField;
    dsKRUISADD: TFIBIntegerField;
    PageControl1: TPageControl;
    TabSheetAlla: TTabSheet;
    TabSheetKRU: TTabSheet;
    dtYearZa: TDateTimePicker;
    Label3: TLabel;
    TabSheet1: TTabSheet;
    dtListZa: TDateTimePicker;
    Label4: TLabel;
    btSelPKGL: TButton;
    btnMakeList: TBitBtn;
    dsPersonList: TpFIBDataSet;
    trReadList: TpFIBTransaction;
    dsPersonListTABNO: TFIBIntegerField;
    dsPersonListSHIFRGRU: TFIBIntegerField;
    dsPersonListNAMEGRU: TFIBStringField;
    dsPersonListFIO: TFIBStringField;
    dsPersonListSHIFRPOD: TFIBIntegerField;
    dsPersonListNAMEPOD: TFIBStringField;
    dsPersonListDOLG: TFIBStringField;
    dsPersonListOKLAD: TFIBBCDField;
    dsPersonListSUMMAADD: TFIBBCDField;
    dsPersonListKOEF: TFIBBCDField;
    dsPersonListGUID: TFIBStringField;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btCreateClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure rgModeGruClick(Sender: TObject);
    procedure dtFRChange(Sender: TObject);
    procedure dtToChange(Sender: TObject);
    procedure btSwodKRUClick(Sender: TObject);
    procedure btSelPKGClick(Sender: TObject);
    procedure btnMakeListClick(Sender: TObject);
    procedure btSelPKGLClick(Sender: TObject);
  private
    { Private declarations }
      dateFr:TDateTime;
      dateTo:TDateTime;
      dateFrS:string;
      dateToS:String;
      wantedShifrGru:Integer;
      procedure saveParams;

  public
    { Public declarations }
  end;

var
  FormSwodAlla: TFormSwodAlla;

implementation
  uses UFibModule,uFormWait,DateUtils,ScrDef,ScrLists,scrutil,UFormSelPKG
       ,USQLUnit,ComObj;

{$R *.dfm}

procedure TFormSwodAlla.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormSwodAlla.btCreateClick(Sender: TObject);
var needPeriod:Integer;
begin
     dateFr:=EncodeDate(yearof(dtFr.Date),monthof(dtFr.Date),1);
     dateTo:=EncodeDate(yearof(dtTo.Date),monthof(dtTo.Date),1);
     if dateTo<dateFr then
        begin
            ShowMessage('Не верно заданы даты');
            Exit;
        end;
     btCreate.Enabled:=False;
     btSwodKRU.Enabled:=False;
     Application.ProcessMessages;
     if rgModeGru.itemIndex=1 then
        wantedShifrGru:=cbShifrGru.ItemIndex+1
     else
        wantedShifrGru:=0;
     needPeriod:=0;
     if (
          (MonthOf(dateFr)=MonthOf(dateTo))
          and
          (yearOf(dateFr)=yearOf(dateTo))
        ) then
     if cbPeriod.Checked then
        needPeriod:=1;
     dsSwod.StartTransaction;
     dsSwod.ParamByName('dFra').AsDate:=dateFr;
     dsSwod.ParamByName('dTOa').AsDate:=dateTo;
     dsSwod.ParamByName('shifrgrua').AsInteger:=wantedShifrGru;
     dsSwod.ParamByName('dFru').AsDate:=dateFr;
     dsSwod.ParamByName('dTOu').AsDate:=dateTo;
     dsSwod.ParamByName('shifrgruu').AsInteger:=wantedShifrGru;
     dsSwod.ParamByName('needperiod').AsInteger:=needPeriod;
     FormWait.Show;
     Application.ProcessMessages;
     dsSwod.Open;
     FormWait.Hide;
     Application.ProcessMessages;
     frxReport1.ShowReport;
     dsSwod.Close;
     dsSwod.Transaction.Commit;
     btCreate.Enabled:=True;
     btSwodKRU.Enabled:=true;
     Application.ProcessMessages;


end;

procedure TFormSwodAlla.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(Trim(VarName),'period')=0 then
        Value:='c '+dateToStr(datefr)+' по '+dateToStr(dateto)
     else
     if CompareText(Trim(VarName),'nameGru')=0 then
        begin
             if wantedShifrGru<1 then
                if isSVDN then
                   Value:='по всiм рахункам'
                else
                   Value:='по всем счетам'   
             else
                Value:=Trim(GET_IST_NAME(wantedShifrGru));
        end
end;

procedure TFormSwodAlla.FormCreate(Sender: TObject);
var i:Integer;
begin
      Label5.Caption:='';
      dtListZa.Date:=EncodeDate(2022,12,1);
      dtListZa.MinDate:=EncodeDate(2022,1,1);
      dtListZa.MaxDate:=EncodeDate(2023,4,30);
      wantedShifrGru:=0;
      dtFR.date:=encodeDate(CurrYear,1,1);
      dtTo.date:=encodeDate(CurrYear,NMES,1);
      rgModeGru.ItemIndex:=0;
      cbShifrGru.ItemIndex:=-1;
      cbShifrGru.Hide;
      cbShifrGru.Items.Clear;
      for i:=1 to max_IST_FIN do
          cbShifrGru.Items.Add(GET_IST_NAME(i));
      cbShifrGru.ItemIndex:=0;
      cbPeriod.Checked:=False;
      cbPeriod.Hide;
      dtYearZa.Date:=Date;
end;

procedure TFormSwodAlla.rgModeGruClick(Sender: TObject);
begin
     if rgModeGru.ItemIndex=1 then
        cbShifrGru.Show
     else
        begin
             cbShifrGru.Hide;
             wantedShifrGru:=0;
        end;
     Application.ProcessMessages;      
end;

procedure TFormSwodAlla.dtFRChange(Sender: TObject);
begin
     if (
          (MonthOf(dtFr.date)=MonthOf(dtTo.date))
          and
          (yearOf(dtFr.date)=yearOf(dtTo.date))
        ) then
        cbPeriod.Show
     else
        cbPeriod.Hide;
     Application.ProcessMessages;
end;

procedure TFormSwodAlla.dtToChange(Sender: TObject);
begin
     if (
          (MonthOf(dtFr.date)=MonthOf(dtTo.date))
          and
          (yearOf(dtFr.date)=yearOf(dtTo.date))
        ) then
        cbPeriod.Show
     else
        cbPeriod.Hide;
     Application.ProcessMessages;
end;

procedure TFormSwodAlla.saveParams;
  var SQLStmnt:string;
      i:Integer;
  begin
     SQLStmnt:='delete from test_add';
     SQLExecute(SQLStmnt);
     for i:=0 to NameServList.Count-1 do
         if NameServList.IsSelected(i+1) then
            begin
                 SQLStmnt:='insert into test_add(shifr,nsrv) values (1,'+IntToStr(i+1)+')';
                 SQLExecute(SQLStmnt);
            end;
     for i:=0 to GruppyList.Count-1 do
         if GruppyList.IsSelected(i+1) then
            begin
                 SQLStmnt:='insert into test_add(shifr,shifrgru) values (2,'+IntToStr(i+1)+')';
                 SQLExecute(SQLStmnt);
            end;
     for i:=0 to KategList.Count-1 do
         if KategList.IsSelected(i+1) then
            begin
                 SQLStmnt:='insert into test_add(shifr,shifrkat) values (3,'+IntToStr(i+1)+')';
                 SQLExecute(SQLStmnt);
            end;

  end;

procedure TFormSwodAlla.btSwodKRUClick(Sender: TObject);
 var SQLStmnt:string;
     v:Variant;
     E,WC:Variant;
     sc,i:Integer;
     rec,currrow,currcol:Integer;
     wantedYear:Integer;
     startRow,endRow:Integer;
     formula:String;
     currAddMode:Integer; // 0 - ud 1 - add
 procedure printAddFooter;
  var i:Integer;
  begin
     endRow:=currrow;
     inc(currrow);
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:='Итого';
     for i:=1 to 12 do
         begin
              formula:='=SUM(R'+intToStr(startRow)+'C'+intToStr(2+i)+':R'+intToStr(endRow)+'C'+intToStr(2+i)+')';
              E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,i+2].formula:=formula;
              E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,i+2].NumberFormat:=AnsiString('0,00');
              E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,i+2].Font.Bold := true;
         end;
  end;
begin
     if NameServList.CountSelected<=0 then
       begin
            ShowMessage('Не выбраны подразделения');
            Exit;
       end;
     if GruppyList.CountSelected<=0 then
       begin
            ShowMessage('Не выбраны счета');
            Exit;
       end;
     saveParams;
     wantedYear:=yearOf(dtYearZa.Date);
     btCreate.Enabled  := false;
     btSwodKRU.Enabled := false;
     btSelPKG.Enabled  := false;
     Application.ProcessMessages;
     dsKRU.Params[0].Value:=wantedYear;
     dsKRU.Transaction.StartTransaction;
     FormWait.Show;
     Application.ProcessMessages;
     dsKRU.Open;
     dsKRU.First;
     FormWait.Hide;
     Application.ProcessMessages;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.WorkBooks.Add;
     E.Visible:=true;
     CurrRow:=1;
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:='Свод за '+IntToStr(wantedYear);
     CurrRow:=2;
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:='Шифр';
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:='Название';
     for i:=1 to 12 do
         E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,i+2]:=GetMonthRus(i);
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,15]:='Итого';
     startRow := currRow+1;
     currAddMode:=1;
     while not dsKRU.Eof do
       begin
            if (currAddMode=1) and (dsKRUISADD.value<>1) then
               begin
                    currAddMode:=0;
                    PrintAddFooter;
                    currrow:=currRow+5;
                    startRow:=currrow;
               end;
            Inc(currRow);
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=dsKRUSHIFRSTA.Value;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=dsKRUNAMESTA.Value;

            if Abs(dsKRUSUMMA01.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=dsKRUSUMMA01.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA02.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:=dsKRUSUMMA02.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA03.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=dsKRUSUMMA03.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA04.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=dsKRUSUMMA04.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA05.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7]:=dsKRUSUMMA05.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA06.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,8]:=dsKRUSUMMA06.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,8].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA07.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,9]:=dsKRUSUMMA07.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,9].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA08.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,10]:=dsKRUSUMMA08.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,10].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA09.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,11]:=dsKRUSUMMA09.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,11].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA10.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,12]:=dsKRUSUMMA10.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,12].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA11.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,13]:=dsKRUSUMMA11.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,13].NumberFormat:=AnsiString('0,00');
               end;
            if Abs(dsKRUSUMMA12.Value)>0.01 then
               begin
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,14]:=dsKRUSUMMA12.Value;
                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,14].NumberFormat:=AnsiString('0,00');
               end;
//            if Abs(dsKRUSUMMATOT.Value)>0.01 then
//               begin
//                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,15]:=dsKRUSUMMATOT.Value;
//                    E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,15].NumberFormat:=AnsiString('0,00');
//               end;
            formula:='=SUM(R'+intToStr(currRow)+'C3:R'+intToStr(currRow)+'C14)';
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,15].formula:=formula;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,15].NumberFormat:=AnsiString('0,00');
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,15].Font.Bold := true;
            dsKRU.Next;
       end;
     printAddFooter;
//     endRow:=currrow;
//     inc(currrow);
//     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:='Итого';
//     for i:=1 to 12 do
//         begin
//              formula:='=SUM(R'+intToStr(startRow)+'C'+intToStr(2+i)+':R'+intToStr(endRow)+'C'+intToStr(2+i)+')';
//              E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,i+2].formula:=formula;
//              E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,i+2].NumberFormat:=AnsiString('0,00');
//              E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,i+2].Font.Bold := true;
//         end;
     dsKRU.Close;
     dsKRU.Transaction.Commit;
     btCreate.Enabled  := True;
     btSwodKRU.Enabled := true;
     btSelPKG.Enabled  := true;
     Application.ProcessMessages;

end;

procedure TFormSwodAlla.btSelPKGClick(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormSwodAlla.btnMakeListClick(Sender: TObject);
var y,m:Integer;
    e:Variant;
    lineno,currRow:Integer;
begin
     Label5.Caption:='';
     Application.ProcessMessages;
     if NameServList.CountSelected<=0 then
       begin
            ShowMessage('Не выбраны подразделения');
            Exit;
       end;
     if GruppyList.CountSelected<=0 then
       begin
            ShowMessage('Не выбраны счета');
            Exit;
       end;
     if KategList.CountSelected<=0 then
       begin
            ShowMessage('Не выбраны категории');
            Exit;
       end;
     saveParams;
     btnMakeList.Enabled:=false;
     btSelPKGL.Enabled:=False;
     y:=YearOf(dtListZa.date);
     m:=MonthOf(dtListZa.Date);
     FormWait.Show;
     Application.ProcessMessages;

     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.WorkBooks.Add;
     E.Visible:=true;
     lineno:=0;
     currRow:=6;
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow-1,1]:=GetMonthRus(m)+' '+IntToStr(y)+' г.';
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:='№ п.п.';
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:='Т.н.';
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:='Счет';
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:='ФИО';
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:='Подр';
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:='Должность';
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7]:='Оклад';
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,8]:='Начислено';
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,8].NumberFormat:=AnsiString('0,00');
     E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,9]:='Доля ставки';
     dsPersonList.Params[0].Value:=y;
     dsPersonList.Params[1].Value:=m;
     dsPersonList.Transaction.StartTransaction;
     dsPersonList.Open;
     dsPersonList.First;
     FormWait.Hide;
     Application.ProcessMessages;

     while not dsPersonList.Eof do
       begin
            inc(lineno);
            inc(currRow);
            Label5.Caption:=intToStr(linenO);
            Application.ProcessMessages;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=lineno;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=dsPersonListTABNO.Value;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=dsPersonListNAMEGRU.Value;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:=dsPersonListFIO.Value;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=dsPersonListNAMEPOD.Value;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=dsPersonListDOLG.Value;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7]:=dsPersonListOKLAD.Value;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7].NumberFormat:=AnsiString('0,00');
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,8]:=dsPersonListSUMMAADD.Value;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,8].NumberFormat:=AnsiString('0,00');
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,9]:=dsPersonListKOEF.Value;
            E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,9].NumberFormat:=AnsiString('0,0000');
            dsPersonList.Next;
       end;
     dsPersonList.close;
     dsPersonList.Transaction.Commit;

     btSelPKGL.Enabled:=True;
     btnMakeList.Enabled:=True;

end;

procedure TFormSwodAlla.btSelPKGLClick(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

end.
