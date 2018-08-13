unit uFormOtp;
                     
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, FIBDataSet, pFIBDataSet, dxExEdtr, ExtCtrls,
  DBCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms;

type
  TFormOtp = class(TForm)
    DateTimePicker1: TDateTimePicker;
    pFIBDataSetOtp: TpFIBDataSet;
    DataSourceOtp: TDataSource;
    dxDBGridOtp: TdxDBGrid;
    pFIBDataSetOtpTABNO: TFIBSmallIntField;
    pFIBDataSetOtpFIO: TFIBStringField;
    pFIBDataSetOtpF_DATA: TFIBDateField;
    pFIBDataSetOtpL_DATA: TFIBDateField;
    pFIBDataSetOtpSHIFRID: TFIBIntegerField;
    pFIBDataSetOtpSHIFRKAT: TFIBSmallIntField;
    pFIBDataSetOtpSHIFRGRU: TFIBSmallIntField;
    DBNavigator1: TDBNavigator;
    dxDBGridOtpSHIFRID: TdxDBGridMaskColumn;
    dxDBGridOtpSHIFRKAT: TdxDBGridMaskColumn;
    dxDBGridOtpSHIFRGRU: TdxDBGridMaskColumn;
    dxDBGridOtpTABNO: TdxDBGridColumn;
    dxDBGridOtpFIO: TdxDBGridColumn;
    dxDBGridOtpF_DATA: TdxDBGridColumn;
    dxDBGridOtpL_DATA: TdxDBGridColumn;
    pFIBDataSetOtpDOLG: TFIBStringField;
    pFIBDataSetOtpITOGO_O: TFIBBCDField;
    dxDBGridOtpColumnDolg: TdxDBGridColumn;
    dxDBGridOtpColumnSumma: TdxDBGridColumn;
    pFIBDataSetOtpRAZRIJAD: TFIBSmallIntField;
    pFIBDataSetOtpITOGO_O_DAY: TFIBSmallIntField;
    pFIBDataSetOtpITOGO_O1: TFIBBCDField;
    pFIBDataSetOtpSHIFRID1: TFIBIntegerField;
    pFIBDataSetOtpSHIFRKAT1: TFIBSmallIntField;
    pFIBDataSetOtpSHIFRGRU1: TFIBSmallIntField;
    pFIBDataSetOtpRAZRIJAD1: TFIBSmallIntField;
    pFIBDataSetOtpDATA_PERE: TFIBDateTimeField;
    pFIBDataSetOtpMEAN_DAY_BUD: TFIBBCDField;
    pFIBDataSetOtpMEAN_DAY_VNE: TFIBBCDField;
    pFIBDataSetOtpMEAN_DAY_GN: TFIBBCDField;
    pFIBDataSetOtpMEAN_DAY_NIS: TFIBBCDField;
    pFIBDataSetOtpSHIFRSTA: TFIBSmallIntField;
    dxDBGridOtpColumnSta: TdxDBGridColumn;
    dxDBGridOtpDataPere: TdxDBGridDateColumn;
    pFIBDataSetOtpMODE: TFIBSmallIntField;
    dxDBGridOtpMode: TdxDBGridColumn;
    pFIBDataSetOtpMARKED: TFIBSmallIntField;
    dxDBGridOtpMarked: TdxDBGridCheckColumn;
    pFIBDataSetOtpMODE_DAY_CLOCK: TFIBSmallIntField;
    pFIBDataSetOtpKIND_OTP: TFIBSmallIntField;
    pFIBDataSetOtpNAMEKINDOTP: TFIBStringField;
    pFIBDataSetOtpNOMER_PRI: TFIBStringField;
    pFIBDataSetOtpDATA_PRI: TFIBDateField;
    pFIBDataSetOtpPERIOD_PRI: TFIBStringField;
    pFIBDataSetOtpMODEWR: TFIBIntegerField;
    pFIBDataSetOtpNAMEWR: TStringField;
    dxDBGridOtpNameWR: TdxDBGridColumn;
    pFIBDataSetOtpGUID: TFIBStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure SetUpNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSetOtpAfterDelete(DataSet: TDataSet);
    procedure dxDBGridOtpDeletion(Sender: TObject; Node: TdxTreeListNode);
    procedure pFIBDataSetOtpBeforeDelete(DataSet: TDataSet);
    procedure dxDBGridOtpCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure dxDBGridOtpDataPereCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dxDBGridOtpKeyPress(Sender: TObject; var Key: Char);
    procedure dxDBGridOtpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pFIBDataSetOtpCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
     procedure ShowTable;
  public
    { Public declarations }
    WantedMonth:integer;
    WantedYear:integer;
  end;

var
  FormOtp: TFormOtp;

implementation
uses uFrmFindKadryFB,UFibModule,ScrDef,UFormUpdOtp,DateUtils;

{$R *.dfm}

procedure TFormOtp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetOtp.Transaction.Active then
         pFIBDataSetOtp.Transaction.Commit;
      if pFIBDataSetOtp.UpdateTransaction.Active then
         pFIBDataSetOtp.UpdateTransaction.Commit;
      if pFIBDataSetOtp.Active then
         pFIBDataSetOtp.Close;
      Action:=caFree;
end;

procedure TFormOtp.DateTimePicker1Change(Sender: TObject);
var Year,Month,Day:word;
begin
     DecodeDate(DateTimePicker1.Date, Year, Month, Day);
     WantedYear  := Year;
     WantedMonth := Month;
     ShowTable;
     SetUpNavigator;

end;
procedure TFormOtp.ShowTable;
begin
      if pFIBDataSetOtp.Active then
         pFIBDataSetOtp.Active:=false;
      pFIBDataSetOtp.Params[0].AsString:=IntToStr(Self.WantedYear);
      pFIBDataSetOtp.Params[1].AsString:=IntToStr(Self.WantedMonth);
      pFIBDataSetOtp.Prepare;
      pFIBDataSetOtp.Open;
end;

procedure TFormOtp.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
var
  Act:integer;
  SavId:integer;
  s:string;
  v:Variant;
begin
  SavId:=0;
  Act:=0;
  case Button of
    nbInsert : Act:=1;
    nbDelete : Act:=3;
    nbEdit   : Act:=2;
  end;
  if ACT=3 then Exit;
  IF ((ACT=1) OR (ACT=3)) AND ((Flow_Month<>NMES) OR (WantedYear<>CurrYear)) THEN EXIT;
  if (ACT=2) and (SELF.pFIBDataSetOtp.FieldByName('TABNO').AsInteger<1) then Exit;
  if Act>0 then
     begin
          with TFormUpdOtp.Create(nil) do
            begin
               try
                  ActionClar:=Act;
                  WantedTabno:=0;
                  Fio:='';
                  WorkYear   := WantedYear;
                  WorkMonth  := WantedMonth;
                  ShifrIdOtp := 0;
                  Mode       := 0;
                  KindOfOtp  := 0;
                  modeWR     := 0;
                  GUID       := '';
                  Nomer_Pri  := '';
                  Data_Pri   := IncDay(Date,-5);
                  Period_Pri := '';
                  if Act=1 then
                     begin
//                          if not FIB.pFIBQuery.Transaction.Active then
//                             FIB.pFIBQuery.Transaction.StartTransaction;
//                          FIB.pFIBQuery.SQL.Clear;
                          s:='EXECUTE PROCEDURE PR_DELETE_ALL_FROM_TMP_OTP';
                          FIB.pFIBDatabaseSal.Execute(s);
//                          FIB.pFIBQuery.SQL.Add(s);
//                          try
//                               FIB.pFIBQuery.ExecQuery;
//                               FIB.pFIBQuery.Close;
//                          except
//                               else
//                                    begin
//                                         ShowMessage('Ошибка чистки временных таблиц отпускных');
//                                         Exit;
//                                    end
//                          end;
//                          if FIB.pFIBQuery.Transaction.Active then
//                             FIB.pFIBQuery.Transaction.Commit;
                     end;
                  WantedShifrSta:=5;
                  if Act<>1 then
                     begin
                          Razrjad     := Self.pFIBDataSetOtp.FieldByName('RAZRIJAD').AsInteger;
                          WantedTabno := SELF.pFIBDataSetOtp.FieldByName('TABNO').AsInteger;
                          Fio         := SELF.pFIBDataSetOtp.FieldByName('FIO').AsString;
                          ShifrKat    := SELF.pFIBDataSetOtp.FieldByName('SHIFRKAT').AsInteger;
                          ShifrGru    := SELF.pFIBDataSetOtp.FieldByName('SHIFRGRU').AsInteger;
                          ShifrIdOtp  := SELF.pFIBDataSetOtp.FieldByName('SHIFRID').AsInteger;
                          O_Day       := SELF.pFIBDataSetOtp.FieldByName('ITOGO_O_DAY').AsInteger;
                          SavId       := ShifrIdOtp;
                          DateTimePickerFr.Date:=SELF.pFIBDataSetOtp.FieldByName('F_DATA').AsDateTime;
                          DateTimePickerTo.Date:=SELF.pFIBDataSetOtp.FieldByName('L_DATA').AsDateTime;
                          MeanDay_Bud := SELF.pFIBDataSetOtp.FieldByName('MEAN_DAY_BUD').AsFloat;
                          MeanDay_NIS := SELF.pFIBDataSetOtp.FieldByName('MEAN_DAY_NIS').AsFloat;
                          MeanDay_GN  := SELF.pFIBDataSetOtp.FieldByName('MEAN_DAY_GN').AsFloat;
                          MeanDay_VNE := SELF.pFIBDataSetOtp.FieldByName('MEAN_DAY_VNE').AsFloat;
                          MeanDay     := (MeanDay_Bud+MeanDay_Nis+MeanDay_Vne+MeanDay_Gn) / 4;
                          WantedShifrSta := SELF.pFIBDataSetOtp.FieldByName('SHIFRSTA').AsInteger;
                          Mode        := SELF.pFIBDataSetOtp.FieldByName('MODE').AsInteger;
                          ModeDC      := SELF.pFIBDataSetOtp.FieldByName('MODE_DAY_CLOCK').AsInteger;
                          if ((ModeDC<0) or (ModeDC>1)) then
                             ModeDC:=0;
                          KindOfOtp   := SELF.pFIBDataSetOtp.FieldByName('KIND_OTP').AsInteger;
                          modeWR      := SELF.pFIBDataSetOtp.FieldByName('MODEWR').AsInteger;
                          GUID        := SELF.pFIBDataSetOtp.FieldByName('GUID').AsString;
                          Nomer_Pri   := SELF.pFIBDataSetOtp.FieldByName('NOMER_PRI').AsString;
                          Data_Pri    := SELF.pFIBDataSetOtp.FieldByName('DATA_PRI').AsDateTime;
                          Period_Pri  := SELF.pFIBDataSetOtp.FieldByName('PERIOD_PRI').AsString;
                          if ((yearOf(Data_Pri))<(yearOf(DateTimePickerFr.Date)-2)) then
                             Data_Pri:=IncDay(DateTimePickerFr.Date,-10);
                          Mode_25_07_2016 := 0;
                          if isLNR then
                             begin
                                  Mode_25_07_2016:=1;
                                  rgMode_25_07_2016.ItemIndex:=1;
                                  if ShifrIdOtp>0 then
                                     begin
                                         s:='select first 1 mode_25_07_2016 from otpuska where shifrid='+intToStr(ShifrIdOtp);
                                         v:=FIB.pFIBDatabaseSal.QueryValue(s,0);
                                         if VarIsNumeric(v) then
                                            begin
                                                 Mode_25_07_2016:=v;
                                                 if Mode_25_07_2016<>1 then
                                                    begin
                                                         Mode_25_07_2016:=0;
                                                         rgMode_25_07_2016.ItemIndex:=0;
                                                    end
                                                 else
                                                    rgMode_25_07_2016.ItemIndex:=1;

                                            end;
                                     end;
                             end;

                     end;
                  if execute then
                     begin
                     end;
              finally
                free;
                if pFIBDataSetOtp.UpdateTransaction.Active then
                   pFIBDataSetOtp.UpdateTransaction.Commit;
              end;

            ShowTable;
            SetUpNavigator;
            if SavId>0 then
               begin
{                   SELF.pFIBDataSetBoln.FieldByName('SHIFRID').AsInteger:=ShifrIdBoln;}
                    SELF.pFIBDataSetOtp.Locate('ShifrId',SavId,[loPartialKey]);
               end;
           end;
     end;


end;

procedure TFormOtp.SetUpNavigator;
var I_Count:Integer;
begin
     I_Count:=pFIBDataSetOtp.RecordCount;
     DBNavigator1.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast];
     if ((Flow_Month=NMES) and (WantedYear=CurrYear)) then
        begin
             DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons +
                   [nbInsert,nbPost,nbCancel];
             if I_Count>0 then
                DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons + [nbDelete];
        end;
     if I_Count>0 then
        DBNavigator1.VisibleButtons := DBNavigator1.VisibleButtons + [nbEdit,nbRefresh];

end;
procedure TFormOtp.FormShow(Sender: TObject);
begin
      ShowTable;
      SetUpNavigator;
end;

procedure TFormOtp.FormCreate(Sender: TObject);
 var selectSQL:string;
     insertSQL:string;
     updateSQL:string;
     deleteSQL:string;
     refreshSQL:string;
begin
      WantedMonth := Nmes;
      WantedYear  := CurrYear;
      DateTimePicker1.Date:=EnCodeDate(WantedYear,WantedMonth,10);
{
      dxDBGridOtp.Height:=Self.Height-Screen.PixelsPerInch*23 div 25;
      dxDBGridOtp.Width:=Self.Width-Screen.PixelsPerInch*5 div 25;
}
      if isLNR then
         begin
              selectSQL:='select tabno,fio,dolg,f_data,l_data,itogo_o,ShifrId,ShifrKat,ShifrGru,Razrijad,ITOGO_O_DAY,itogo_o,ShifrId,ShifrKat,ShifrGru,Razrijad,DATA_PERE,mean_day_bud,mean_day_vne,mean_day_gn,mean_day_nis,ShifrSta,Mode,Marked,Mode_Day_CLock,'+
                         'kind_otp, '+
                         '(select first 1 name from tb_kindsotp where tb_kindsotp.shifrkind=kind_otp) as namekindotp, '+
                         ' nomer_pri,data_pri,period_pri,modeWR,GUID '+
                         ' from otpuska '+
                         ' where Year_Vy=:WantedYear and Month_Vy=:WantedMonth'+
                         ' order by fio';
              insertSQL:='INSERT INTO OTPUSKA('+
                         'TABNO,'+
                         'FIO,'+
                         'DOLG,'+
                         'F_DATA,'+
                         'L_DATA,'+
                         'ITOGO_O,'+
                         'SHIFRID,'+
                         'SHIFRKAT,'+
                         'SHIFRGRU,'+
                         'MARKED'+
                         ')'+
                         ' VALUES('+
                         ':TABNO,'+
                         ':FIO,'+
                         ':DOLG,'+
                         ':F_DATA,'+
                         ':L_DATA,'+
                         ':ITOGO_O,'+
                         ':SHIFRID,'+
                         ':SHIFRKAT,'+
                         ':SHIFRGRU,'+
                         ':MARKED'+
                         ')';
              updateSQL:='UPDATE OTPUSKA'+
                         ' SET '+
                         ' TABNO    = :TABNO,'+
                         ' FIO      = :FIO,'+
                         ' DOLG     = :DOLG,'+
                         ' F_DATA   = :F_DATA,'+
                         ' L_DATA   = :L_DATA,'+
                         ' ITOGO_O  = :ITOGO_O,'+
                         ' SHIFRID  = :SHIFRID,'+
                         ' SHIFRKAT = :SHIFRKAT,'+
                         ' SHIFRGRU = :SHIFRGRU,'+
                         ' MARKED   = :MARKED'+
                         ' WHERE'+
                         ' SHIFRID = :OLD_SHIFRID';

              deleteSQL := 'DELETE FROM'+
                          ' OTPUSKA '+
                          ' WHERE '+
                          ' SHIFRID = :OLD_SHIFRID';

             refreshSQL := 'select tabno,fio,dolg,f_data,l_data,itogo_o,ShifrId,ShifrKat,ShifrGru,MARKED from otpuska'+
                          ' where(  Year_Vy=:WantedYear and Month_Vy=:WantedMonth'+
                          ') and (     OTPUSKA.SHIFRID = :OLD_SHIFRID'+
                          ')';
             dxDBGridOtpNameWR.Visible:=true;

         end
      else
         begin
              selectSQL:='select tabno,fio,dolg,f_data,l_data,itogo_o,ShifrId,ShifrKat,ShifrGru,Razrijad,ITOGO_O_DAY,itogo_o,ShifrId,ShifrKat,ShifrGru,Razrijad,DATA_PERE,mean_day_bud,mean_day_vne,mean_day_gn,mean_day_nis,ShifrSta,Mode,Marked,Mode_Day_CLock,'+
                         'kind_otp, '+
                         '(select first 1 name from tb_kindsotp where tb_kindsotp.shifrkind=kind_otp) as namekindotp, '+
                         ' nomer_pri,data_pri,period_pri,0 as modeWR,'''' as GUID '+
                         ' from otpuska '+
                         ' where Year_Vy=:WantedYear and Month_Vy=:WantedMonth'+
                         ' order by fio';
              insertSQL:='INSERT INTO OTPUSKA('+
                         'TABNO,'+
                         'FIO,'+
                         'DOLG,'+
                         'F_DATA,'+
                         'L_DATA,'+
                         'ITOGO_O,'+
                         'SHIFRID,'+
                         'SHIFRKAT,'+
                         'SHIFRGRU,'+
                         'MARKED'+
                         ')'+
                         ' VALUES('+
                         ':TABNO,'+
                         ':FIO,'+
                         ':DOLG,'+
                         ':F_DATA,'+
                         ':L_DATA,'+
                         ':ITOGO_O,'+
                         ':SHIFRID,'+
                         ':SHIFRKAT,'+
                         ':SHIFRGRU,'+
                         ':MARKED'+
                         ')';
              updateSQL:='UPDATE OTPUSKA'+
                         ' SET '+
                         ' TABNO    = :TABNO,'+
                         ' FIO      = :FIO,'+
                         ' DOLG     = :DOLG,'+
                         ' F_DATA   = :F_DATA,'+
                         ' L_DATA   = :L_DATA,'+
                         ' ITOGO_O  = :ITOGO_O,'+
                         ' SHIFRID  = :SHIFRID,'+
                         ' SHIFRKAT = :SHIFRKAT,'+
                         ' SHIFRGRU = :SHIFRGRU,'+
                         ' MARKED   = :MARKED'+
                         ' WHERE'+
                         ' SHIFRID = :OLD_SHIFRID';

              deleteSQL := 'DELETE FROM'+
                          ' OTPUSKA '+
                          ' WHERE '+
                          ' SHIFRID = :OLD_SHIFRID';

             refreshSQL := 'select tabno,fio,dolg,f_data,l_data,itogo_o,ShifrId,ShifrKat,ShifrGru,MARKED from otpuska'+
                          ' where(  Year_Vy=:WantedYear and Month_Vy=:WantedMonth'+
                          ') and (     OTPUSKA.SHIFRID = :OLD_SHIFRID'+
                          ')';

             dxDBGridOtpNameWR.Visible:=false;

         end;
      pFIBDataSetOtp.SQLs.SelectSQL.Clear;
      pFIBDataSetOtp.SQLs.SelectSQL.add(selectSQL);

      pFIBDataSetOtp.SQLs.InsertSQL.Clear;
      pFIBDataSetOtp.SQLs.InsertSQL.add(insertSQL);

      pFIBDataSetOtp.SQLs.UpdateSQL.Clear;
      pFIBDataSetOtp.SQLs.UpdateSQL.add(UpdateSQL);

      pFIBDataSetOtp.SQLs.DeleteSQL.Clear;
      pFIBDataSetOtp.SQLs.DeleteSQL.add(DeleteSQL);

      pFIBDataSetOtp.SQLs.RefreshSQL.Clear;
      pFIBDataSetOtp.SQLs.RefreshSQL.add(RefreshSQL);


      if not pFIBDataSetOtp.Transaction.Active then
         pFIBDataSetOtp.Transaction.StartTransaction;
      if not pFIBDataSetOtp.Active then
         pFIBDataSetOtp.Open;
end;

procedure TFormOtp.pFIBDataSetOtpAfterDelete(DataSet: TDataSet);
begin
     if pFIBDataSetOtp.UpdateTransaction.Active then
        pFIBDataSetOtp.UpdateTransaction.Commit;
     SetUpNavigator;
end;

procedure TFormOtp.dxDBGridOtpDeletion(Sender: TObject;
  Node: TdxTreeListNode);
begin
    { ShowMessage('---');}
end;

procedure TFormOtp.pFIBDataSetOtpBeforeDelete(DataSet: TDataSet);
begin
     if not pFIBDataSetOtp.UpdateTransaction.Active then
        pFIBDataSetOtp.UpdateTransaction.StartTransaction;
{     ShowMessage('BefDelete');}
end;

procedure TFormOtp.dxDBGridOtpCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  Value: Variant;
  i:integer;
begin
  if ANode.HasChildren then
    Exit;
  //if not ASelected and (AColumn = dxDBGrid2PaymentAmount) then
  if not ASelected then
  begin
     i := TdxDBGrid(Sender).ColumnByFieldName('MODE').Index;
     Value := ANode.Values[i];
     if not VarIsNull(Value) then
        begin
             if Value=1 then
                AColor := clYellow
             else if Value=2 then
                AColor := clInactiveCaptionText;
        end;
(*
  // customers are in bold color
  if ANode.Values[dxDBGrid2Customer.Index] = dxDBGrid2Customer.ValueChecked then
  begin
    AFont.Style := AFont.Style + [fsBold];
    if ASelected then
      AFont.Color := clWhite
    else
      AFont.Color := clNavy;
  end;
*)
    end;

end;

procedure TFormOtp.dxDBGridOtpDataPereCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  Value: Variant;
  i:integer;
  Y,M,D:word;
  S:string;
begin
   //  i := TdxDBGrid(Sender).ColumnByFieldName('DATA_PERE').Index;
     i:=AColumn.Index;
     Value := ANode.Values[i];
     if not VarIsNull(Value) then
        begin
             DeCodeDate(Value,y,m,d);
             if Y<1995 then AText:=''
                       else
                AText := IntToStr(d)+'.'+IntToStr(m)+'.'+IntToStr(y);
        end;
end;

procedure TFormOtp.dxDBGridOtpKeyPress(Sender: TObject; var Key: Char);
var i:integer;
begin
     i:=ord(key);
     if key in ['o','O','щ','Щ'] then
        begin
             pFIBDataSetOtp.Edit;
             if pFIBDataSetOtpMARKED.Value=1 then
                pFIBDataSetOtpMARKED.Value:=0
             else
                pFIBDataSetOtpMARKED.Value:=1;
             pFIBDataSetOtp.Post;
        end
end;

procedure TFormOtp.dxDBGridOtpKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var i:integer;
begin
    i:=key;

end;

procedure TFormOtp.pFIBDataSetOtpCalcFields(DataSet: TDataSet);
 var retVal:string;
begin
     if pFIBDataSetOtpMODEWR.Value=1 then  retVal:='Осн'
     else
     if pFIBDataSetOtpMODEWR.Value=2 then  retVal:='Свм'
     else
        retVal:='ОиС';
     pFIBDataSetOtpNameWR.Value:=retVal;
end;

end.
