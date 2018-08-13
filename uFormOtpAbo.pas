unit uFormOtpAbo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, dxDBTLCl, dxGrClms,ScrDef, ToolWin, ComCtrls, ActnList,
  StdCtrls, Buttons, ImgList, ExtCtrls, DBCtrls;

type
  TFormOtpAbo = class(TForm)
    pFIBDataSetOA: TpFIBDataSet;
    pFIBDataSetOAYEAR_VY: TFIBSmallIntField;
    pFIBDataSetOAMONTH_VY: TFIBSmallIntField;
    pFIBDataSetOAF_DATA: TFIBDateField;
    pFIBDataSetOAL_DATA: TFIBDateField;
    pFIBDataSetOAITOGO_O_DAY: TFIBSmallIntField;
    pFIBDataSetOASHIFRID: TFIBIntegerField;
    pFIBDataSetOASHIFRKAT: TFIBSmallIntField;
    pFIBDataSetOASHIFRGRU: TFIBSmallIntField;
    DataSourceOA: TDataSource;
    dxDBGridOA: TdxDBGrid;
    pFIBDataSetOAITOGO_O: TFIBBCDField;
    dxDBGridOAYEAR_VY: TdxDBGridMaskColumn;
    dxDBGridOAMONTH_VY: TdxDBGridMaskColumn;
    dxDBGridOAF_DATA: TdxDBGridDateColumn;
    dxDBGridOAL_DATA: TdxDBGridDateColumn;
    dxDBGridOAITOGO_O_DAY: TdxDBGridMaskColumn;
    dxDBGridOAITOGO_O: TdxDBGridCurrencyColumn;
    ActionList1: TActionList;
    ToolBar1: TToolBar;
    ActionSelectOtp: TAction;
    ActionDelOtp: TAction;
    ActionInsOtp: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    pFIBDataSetOARAZRIJAD: TFIBSmallIntField;
    pFIBDataSetOADATA_PERE: TFIBDateTimeField;
    pFIBDataSetOAMEAN_DAY_BUD: TFIBBCDField;
    pFIBDataSetOAMEAN_DAY_VNE: TFIBBCDField;
    pFIBDataSetOAMEAN_DAY_GN: TFIBBCDField;
    pFIBDataSetOAMEAN_DAY_NIS: TFIBBCDField;
    pFIBDataSetOASHIFRSTA: TFIBSmallIntField;
    dxDBGridOAShifrSta: TdxDBGridDateColumn;
    pFIBDataSetOAMODE: TFIBSmallIntField;
    dxDBGridOAMode: TdxDBGridColumn;
    pFIBDataSetOAMODE_DAY_CLOCK: TFIBSmallIntField;
    pFIBDataSetOACANMOVE: TFIBIntegerField;
    pFIBDataSetOAKIND_OTP: TFIBSmallIntField;
    pFIBDataSetOANAMEKINDOTP: TFIBStringField;
    pFIBDataSetOANOMER_PRI: TFIBStringField;
    pFIBDataSetOADATA_PRI: TFIBDateField;
    pFIBDataSetOAPERIOD_PRI: TFIBStringField;
    il1: TImageList;
    ToolButton4: TToolButton;
    DBNavigator1: TDBNavigator;
    pFIBDataSetOAMODEWR: TFIBIntegerField;
    pFIBDataSetOAnamewr: TStringField;
    dxDBGridOANameWR: TdxDBGridColumn;
    pFIBDataSetOAGUID: TFIBStringField;
    ActionPrintOtp: TAction;
    ToolButtonPrintOtp: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ActionSelectOtpExecute(Sender: TObject);
    procedure ActionDelOtpExecute(Sender: TObject);
    procedure ActionInsOtpExecute(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dxDBGridOACustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure ToolButton4Click(Sender: TObject);
    procedure pFIBDataSetOACalcFields(DataSet: TDataSet);
    procedure ActionPrintOtpExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ShowTable;
    procedure SeeOtp(Act:integer);
    procedure MoveOtp;

  public
    { Public declarations }
     WantedTabno:integer;
     WantedFio:string;
     WantedRazrijad:integer;
     ShifrKat:integer;
     ShifrGru:integer;
     WantedCurrPerson:Person_Ptr;

  end;

var
  FormOtpAbo: TFormOtpAbo;

implementation
uses  uFIBModule, uFormWait, ScrUtil, uFormUpdOtp, uFormMovOtp,
      dateUtils,comObj,scrLists;

{$R *.dfm}

procedure TFormOtpAbo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetOA.Transaction.Active then
        pFIBDataSetOA.Transaction.Commit;
     if pFIBDataSetOA.UpdateTransaction.Active then
        pFIBDataSetOA.UpdateTransaction.Commit;

     if pFIBDataSetOA.Active then
        pFIBDataSetOA.Active:=false;
     Action:=caFree;

end;

procedure TFormOtpAbo.FormCreate(Sender: TObject);
var selectSQL:string;
    insertSQL:string;
    updateSQL:string;
    deleteSQL:String;
begin
     WantedTabno    := 0;
     WantedFio      := '';
     WantedRazrijad := 0;
     if isLNR then
         begin
              selectSQL:='select Year_Vy,Month_Vy,f_data,l_data,itogo_o_day,itogo_o,ShifrId,ShifrKat,ShifrGru,Razrijad,DATA_PERE,mean_day_bud,mean_day_vne,mean_day_gn,mean_day_nis,ShifrSta,Mode,Mode_Day_Clock,'+
                          '(select first 1 retval from pr_canmoveotp(otpuska.shifrid)) as canmove,'+
                          'kind_otp,'+
                          '(select first 1 name from tb_kindsotp where tb_kindsotp.shifrkind=kind_otp) as namekindotp,'+
                          'nomer_pri,data_pri,period_pri,modewr,guid'+
                          ' from otpuska'+
                          ' where Tabno=:Tabno'+
                          ' order by F_data desc';
              dxDBGridOANameWR.Visible:=true;
         end
     else
         begin
              selectSQL:='select Year_Vy,Month_Vy,f_data,l_data,itogo_o_day,itogo_o,ShifrId,ShifrKat,ShifrGru,Razrijad,DATA_PERE,mean_day_bud,mean_day_vne,mean_day_gn,mean_day_nis,ShifrSta,Mode,Mode_Day_Clock,'+
                          '(select first 1 retval from pr_canmoveotp(otpuska.shifrid)) as canmove,'+
                          'kind_otp,'+
                          '(select first 1 name from tb_kindsotp where tb_kindsotp.shifrkind=kind_otp) as namekindotp,'+
                          'nomer_pri,data_pri,period_pri,0 as modewr,'''' as GUID'+
                          ' from otpuska'+
                          ' where Tabno=:Tabno'+
                          ' order by F_data desc';

              dxDBGridOANameWR.Visible:=false;
         end;
     pFIBDataSetOA.SQLs.SelectSQL.Clear;
     pFIBDataSetOA.SQLs.selectSQL.add(selectSQL);
     if isLNR then
        begin
             ToolButtonPrintOtp.Visible:=false;
             ToolButtonPrintOtp.Enabled:=false;
        end;

end;

procedure TFormOtpAbo.FormShow(Sender: TObject);
begin
      Caption:=IntToStr(WAntedTabno)+' '+WantedFio;
      ShowTable;
end;

procedure TFormOtpAbo.ShowTable;
begin

      FormWait.Show;
      Application.ProcessMessages;
      if pFIBDataSetOA.Active then
         pFIBDataSetOA.Active:=false;
      pFIBDataSetOA.Params[0].AsInteger:=Self.WantedTabno;
      pFIBDataSetOA.Prepare;
      pFIBDataSetOA.Open;
      FormWait.Hide;
end;

procedure TFormOtpAbo.SeeOtp(Act:integer);
var
  BtnName: string;
  ShifrIdO:integer;
  S : string;
  v:Variant;
  SQLStmnt:string;
begin
  if (FLOW_MONTH<>Nmes) then Exit;
  WantedRazrijad:=Self.pFIBDataSetOA.FieldByName('Razrijad').AsInteger;
  if (WantedRazrijad<1) or (WantedRazrijad>25) then WantedRazrijad:=0;
  IF (ACT=3) AND (SELF.pFIBDataSetOA.RecordCount=0) then Exit;
  if (Act=3) then
     if YesNo('Удалить запись отпускных?') then
        begin
              ShifrIdO:=SELF.pFIBDataSetOA.FieldByName('SHIFRID').AsInteger;
              if ShifrIdO>0 then
                 begin
                      SQLStmnt:='DELETE FROM OTPUSKA WHERE SHIFRID='+IntToSTr(ShifrIdO);
                      FIB.pFIBDatabaseSal.Execute(SQLStmnt);
//                      FIB.pFIBQuery.SQL.Clear;
//                      FIB.pFIBQuery.SQL.Add('DELETE FROM OTPUSKA WHERE SHIFRID='+IntToSTr(ShifrIdO));
//                      FIB.pFIBTransactionSAL.StartTransaction;
//                      try
//                         FIB.pFIBQuery.ExecQuery;
//                         FIB.pFIBQuery.Close;
//                      except
//                         MessageDlg('Ошибка удаления записи отпускных',mtInformation, [mbOk], 0);
//                      end;
//                      FIB.pFIBTransactionSAL.Commit;
                      ShowTable;
                 end;
             Exit
        end
                                          else Exit;
  if Act=1 then
     begin
//          if not FIB.pFIBQuery.Transaction.Active then
//             FIB.pFIBQuery.Transaction.StartTransaction;
//          FIB.pFIBQuery.SQL.Clear;
//          s:='select first 1 razrijad from pr_get_razr_person('+IntToStr(WantedTabno)+')';
//          FIB.pFIBQuery.SQL.Add(s);
//          try
//              FIB.pFIBQuery.ExecQuery;
//              WantedRazrijad:=FIB.pFIBQuery.Fields[0].AsInteger;
//              FIB.pFIBQuery.Close;
//          except
//              ShowMessage('Ошибка получения разряда');
//              Exit;
//          end;
          s:='select first 1 razrijad from pr_get_razr_person('+IntToStr(WantedTabno)+')';
          v:=FIB.pFIBDatabaseSal.QueryValue(s,0);
          if VarIsNumeric(v) then
             begin
                  WantedRazrijad:=v;
                  if ((WantedRazrijad<1) or (WantedRazrijad>25)) then
                      WantedRazrijad:=0;
             end;
          if WantedRazrijad=0 then
          if Assigned(WantedCurrPerson) then
          if WantedCurrPerson^.Mesto_Osn_Raboty=82 then
             WantedRazrijad:=GetRazrjadPerson(WantedCurrPerson);

          s:='select first 1 razrijad from pr_get_razr_person('+IntToStr(WantedTabno)+')';
          FIB.pFIBDatabaseSal.Execute(s);
//
//          FIB.pFIBQuery.SQL.Clear;
//          s:='EXECUTE PROCEDURE PR_DELETE_ALL_FROM_TMP_OTP';
//          FIB.pFIBQuery.SQL.Add(s);
//          try
//              FIB.pFIBQuery.ExecQuery;
//{              WantedRazrijad:=FIB.pFIBQuery.Fields[0].AsInteger;}
//              FIB.pFIBQuery.Close;
//          except
//{
//              on E: EFIBClientEror do
//                 begin
//                      ShowMessage('Ошибка чистки временных таблиц отпускных. '+E.Message);
//                      Exit;
//                 end
//}
//              else
//                  begin
//                       ShowMessage('Ошибка чистки временных таблиц отпускных');
//                       Exit;
//                  end
//          end;
//          if FIB.pFIBQuery.Transaction.Active then
//             FIB.pFIBQuery.Transaction.Commit;
          SQLStmnt:='EXECUTE PROCEDURE PR_DELETE_ALL_FROM_TMP_OTP';
          try
              FIB.pFIBDatabaseSal.Execute(SQLStmnt);
          except
            else
               ShowMessage('Ошибка чистки временных таблиц для начисления отпускных '); 
          end


     end;
  if Act>0 then
     begin
          with TFormUpdOtp.Create(nil) do
            begin
               try
                  CallMode    := 1; { Вызов из сотрудника }
                  ActionClar  := Act;
                  WantedTabno := 0;
                  Fio         := '';
                  WorkYear    := CurrYear;
                  WorkMonth   := NMES;
                  ShifrIdOtp  := 0;
                  WantedTabno := SELF.WantedTabno;
                  Fio         := SELF.WantedFIO;
                  ShifrKat    := SELF.ShifrKat;
                  ShifrGru    := SELF.ShifrGru;
                  Razrjad     := Self.WantedRazrijad;
                  WantedPodr  := NSRV;
                  WantedShifrSta := 5;
                  Mode        := 0;
                  ModeDC      := 0;
                  KindOfOtp   := 0;
                  modeWr      := 0;
                  if isLNR then
                     if not IS_OSN_WID_RABOTY(self.WantedCurrPerson) then
                        modewr:=2;
                  GUID:=GetGUIDPersonToString(Self.WantedCurrPerson);

                  Nomer_pri   := '';
           //       Data_Pri    := IncDay(Date,-5);
                  Data_Pri    := Data_Pri_Mem;
                  Period_Pri  := '';
                  Mode_25_07_2016 := 0;
                  if isLNR then
                     begin
                         Mode_25_07_2016 := 1;
                         rgMode_25_07_2016.ItemIndex:=1;

                     end;
                  if Act<>1 then
                     begin
                          WantedTabno := SELF.WantedTabno;
                          Fio         := SELF.WantedFIO;
                          Razrjad     := Self.WantedRazrijad;
                          ShifrKat    := SELF.pFIBDataSetOA.FieldByName('SHIFRKAT').AsInteger;
                          ShifrGru    := SELF.pFIBDataSetOA.FieldByName('SHIFRGRU').AsInteger;
                          ShifrIdOtp  := SELF.pFIBDataSetOA.FieldByName('SHIFRID').AsInteger;
                          DateTimePickerFr.Date:=SELF.pFIBDataSetOA.FieldByName('F_DATA').AsDateTime;
                          DateTimePickerTo.Date:=SELF.pFIBDataSetOA.FieldByName('L_DATA').AsDateTime;
                          WorkYear  := SELF.pFIBDataSetOA.FieldByName('YEAR_VY').AsInteger;
                          WorkMonth := SELF.pFIBDataSetOA.FieldByName('MONTH_VY').AsInteger;
                          O_Day     := SELF.pFIBDataSetOA.FieldByName('ITOGO_O_DAY').AsInteger;
                          MeanDay_Bud := SELF.pFIBDataSetOA.FieldByName('MEAN_DAY_BUD').AsFloat;
                          MeanDay_NIS := SELF.pFIBDataSetOA.FieldByName('MEAN_DAY_NIS').AsFloat;
                          MeanDay_GN  := SELF.pFIBDataSetOA.FieldByName('MEAN_DAY_GN').AsFloat;
                          MeanDay_VNE := SELF.pFIBDataSetOA.FieldByName('MEAN_DAY_VNE').AsFloat;
                          MeanDay     := (MeanDay_Bud+MeanDay_Nis+MeanDay_Vne+MeanDay_Gn) / 4;
                          WantedShifrSta := SELF.pFIBDataSetOA.FieldByName('SHIFRSTA').AsInteger;
                          Mode        := SELF.pFIBDataSetOA.FieldByName('MODE').AsInteger;
                          ModeDC      := SELF.pFIBDataSetOA.FieldByName('MODE_DAY_CLOCK').AsInteger;
                          if ((ModeDC<0) or (ModeDC>1)) then
                             ModeDC:=0;
                          KindOfOtp   := SELF.pFIBDataSetOA.FieldByName('KIND_OTP').AsInteger;
                          modeWR      := SELF.pFIBDataSetOA.FieldByName('MODEWR').AsInteger;
                          GUID        := SELF.pFIBDataSetOA.FieldByName('GUID').AsString;
                          Nomer_Pri   := SELF.pFIBDataSetOA.FieldByName('NOMER_PRI').AsString;
                          Data_Pri    := SELF.pFIBDataSetOA.FieldByName('DATA_PRI').AsDateTime;
                          Period_Pri  := SELF.pFIBDataSetOA.FieldByName('PERIOD_PRI').AsString;
                          if ((yearOf(Data_Pri))<(yearOf(DateTimePickerFr.Date)-2)) then
                             Data_Pri:=IncDay(DateTimePickerFr.Date,-10);

                          Mode_25_07_2016 := 0;
                          rgMode_25_07_2016.ItemIndex:=0;
                          if isLNR then
                             begin
                                  Mode_25_07_2016 := 1;
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
                  ShifrIdO:=ShifrIdOtp;
                  if execute then
                     begin
                     end;
                  ShifrIdO:=ShifrIdOtp;
              finally
                free;
              end;
            ShowTable;
            if ShifrIdO>0 then
               begin
{                    ShifrIdB:=ShifrIdBoln;}
{                   SELF.pFIBDataSetBoln.FieldByName('SHIFRID').AsInteger:=ShifrIdBoln;}
                    SELF.pFIBDataSetOA.Locate('ShifrId',ShifrIdO,[loPartialKey]);
               end;
           end;
     end;

end;


procedure TFormOtpAbo.ActionSelectOtpExecute(Sender: TObject);
begin
     SeeOtp(2);
end;

procedure TFormOtpAbo.ActionDelOtpExecute(Sender: TObject);
begin
     if FLOW_MONTH<>Nmes then Exit;
     SeeOtp(3);
end;

procedure TFormOtpAbo.ActionInsOtpExecute(Sender: TObject);
begin
     if FLOW_MONTH<>Nmes then Exit;
     SeeOtp(1);
end;

procedure TFormOtpAbo.BitBtn1Click(Sender: TObject);
var ShifrIDB:integer;
    DT:TDateTime;
    Y,M,D:Word;
    Year_VY,Month_Vy:integer;
    Save_Place : TBookmark;
    CanMove : Integer;
begin
  IF SELF.pFIBDataSetOA.RecordCount=0 then Exit;
  Year_Vy  := pFIBDataSetOA.FieldByName('YEAR_VY').AsInteger;
  Month_Vy := pFIBDataSetOA.FieldByName('MONTH_VY').AsInteger;
  if not ((Year_Vy=2012) and (Month_Vy>5) and (Month_Vy<10)) then
  if ((Year_Vy>1995) and (Year_Vy<>CurrYear)) or ((Month_Vy>0) and (Month_Vy<>NMES)) then
     begin
          ShowMessage('Этот отпускной начислен не в текущем месяце');
          Exit;
     end;
  ShifrIdB:=SELF.pFIBDataSetOA.FieldByName('SHIFRID').AsInteger;

//  Dt:=SELF.pFIBDataSetOA.FieldByName('Data_Pere').AsDateTime;
//  DeCodeDate(DT,Y,M,D);
    CanMove:=SELF.pFIBDataSetOA.FieldByName('canmove').AsInteger;
//  DeCodeDate(DT,Y,M,D);
  if (CanMove<>1) then
     begin
          ShowMessage('Отпускной уже перенесен');
          Exit;
     end;
  if not YesNo('Перенести отпускной?') then Exit;
  MoveOtp;
  if not SELF.pFIBDataSetOA.Transaction.Active then
     begin
          SELF.pFIBDataSetOA.Transaction.StartTransaction;
     end;
  Save_Place:=SELF.pFIBDataSetOA.GetBookmark;
  ShowTable;
  SELF.pFIBDataSetOA.GotoBookmark(Save_Place);

end;

procedure TFormOtpAbo.MoveOtp;
 var ShifrIdO:integer;
     Month_Vy,Year_Vy : Integer;
     DataP     : TDate;
     C_Person  : Person_Ptr;
     S         : String;
     Sav_Person_Rec,Curr_Person_Rec:Person;
     Finded,Eq : boolean;
     Sav,Curr  : array[1..L_Person_Data] of byte;
     J         : integer;
 begin
      ShifrIdO   := pFIBDataSetOA.FieldByName('ShifrId').AsInteger;
      MONTH_VY   := pFIBDataSetOA.FieldByName('MONTH_VY').AsInteger;
      YEAR_VY    := pFIBDataSetOA.FieldByName('YEAR_VY').AsInteger;
//      if (MONTH_VY<>NMES) OR (YEAR_VY<>CURRYEAR) then
      if not ((Year_Vy=2012) and (Month_Vy>5) and (Month_Vy<10)) then
      if ((Year_Vy>1995) and (Year_Vy<>CurrYear)) or ((Month_Vy>0) and (Month_Vy<>NMES)) then
         begin
              ShowMessage('Можно перенести только начисленные в этом месяце отпускной');
              Exit;
         end;
      if ShifrIdO=0 then Exit;
      Application.CreateForm(TFormMovOtp, FormMovOtp);
      FormMovOtp.WantedTabno := WantedTabno;
      FormMovOtp.Curr_Person := WantedCurrPerson;
      FormMovOtp.ShifrIdOtp  := ShifrIdO;
      FormMovOtp.PrepareHints;
      Sav_Person_Rec:=WantedCurrPerson^;
      move(WantedCurrPerson^,Sav,L_Person_Data);
      FormMovOtp.ShowModal;
      c_Person:=Head_Person;
      Finded:=false;
      while (C_Person<>Nil) do
       begin
            Curr_Person_Rec:=C_Person^;
            move(C_Person^,Curr,L_Person_Data);
            Eq:=true;
            for j:=1 to L_Person_Data do
                if j<=L_Person_Data then
                if Sav[j]<>Curr[j] then
                   begin
                        Eq:=false;
                        break;
                   end;
            if Eq then
               begin
                     Finded:=true;
                     break;
               end;
            C_Person:=C_Person^.Next;
       end;
      if Finded then
         WantedCurrPerson:=C_Person;


 end;


procedure TFormOtpAbo.dxDBGridOACustomDrawCell(Sender: TObject;
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
  end;
end;

procedure TFormOtpAbo.ToolButton4Click(Sender: TObject);

var ShifrIDB:integer;
    DT:TDateTime;
    Y,M,D:Word;
    Year_VY,Month_Vy:integer;
    Save_Place : TBookmark;
    CanMove : Integer;
begin
  IF SELF.pFIBDataSetOA.RecordCount=0 then Exit;
  Year_Vy  := pFIBDataSetOA.FieldByName('YEAR_VY').AsInteger;
  Month_Vy := pFIBDataSetOA.FieldByName('MONTH_VY').AsInteger;
  if not ((Year_Vy=2012) and (Month_Vy>5) and (Month_Vy<10)) then
  if ((Year_Vy>1995) and (Year_Vy<>CurrYear)) or ((Month_Vy>0) and (Month_Vy<>NMES)) then
     begin
          ShowMessage('Этот отпускной начислен не в текущем месяце');
          Exit;
     end;
  ShifrIdB:=SELF.pFIBDataSetOA.FieldByName('SHIFRID').AsInteger;

//  Dt:=SELF.pFIBDataSetOA.FieldByName('Data_Pere').AsDateTime;
//  DeCodeDate(DT,Y,M,D);
    CanMove:=SELF.pFIBDataSetOA.FieldByName('canmove').AsInteger;
//  DeCodeDate(DT,Y,M,D);
  if (CanMove<>1) then
     begin
          ShowMessage('Отпускной уже перенесен');
          Exit;
     end;
  if not YesNo('Перенести отпускной?') then Exit;
  MoveOtp;
  if not SELF.pFIBDataSetOA.Transaction.Active then
     begin
          SELF.pFIBDataSetOA.Transaction.StartTransaction;
     end;
  Save_Place:=SELF.pFIBDataSetOA.GetBookmark;
  ShowTable;
  SELF.pFIBDataSetOA.GotoBookmark(Save_Place);

end;

procedure TFormOtpAbo.pFIBDataSetOACalcFields(DataSet: TDataSet);
 var retVal:string;
begin
     if pFIBDataSetOAMODEWR.Value=1 then retVal:='Осн'
     else
     if pFIBDataSetOAMODEWR.Value=2 then retVal:='Свм'
     else
        retVal:='ОиС';
     pFIBDataSetOAnamewr.Value:=retVal;
end;

procedure PrintOtpM(ShifrIdOtp:integer);
 const F2='######0.00';
 const F4='######0.0000';

var E,WB,XLS,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    Tabno : integer;
    Cnt,CntMonth:integer;
    WantedMonth,WantedYear:integer;
    Procent,Mean_Day : real;
    ShifrSta:integer;
    I_Count:integer;
    Mode_Otp : integer;
    limitMonth : integer;
    SQLStmnt:string;
    v:Variant;
    shifrKat,shifrGru:Integer;
    dolg:string;
    oklad:Real;
    shifrPod:integer;
    Inn:String;
    DatePri:TDate;
    DatePriS,ms,ds,s1:string;
    days:integer;
    baseCol:integer;
    SummaTotBud,SummaTotVne,SummaTotGN,SummaTotNis:real;
    SummaTotKoefBud,SummaTotKoefVne,SummaTotKoefGN,SummaTotKoefNis:real;
    MeanDayTot,MeanDayBud,MeanDayVne,MeanDayGN,MeanDayNis:real;
    DayTot:integer;
begin
     limitMonth:=12;
     if ShifrIdOtp<1 then
        begin
             ShowMessage('Неверно указан отпускной');
             Exit;
        end;
         //                       0    1    2      3       4           5      6        7         8        9          10          11       12       13       14     15
     SQLStmnt:=' select first 1 tabno,fio,f_data,l_data,itogo_o_day,itogo_o,ShifrId,ShifrKat,Nomer_Pri,data_pri,MEAN_DAY_BUD,PERIOD_PRI,SHIFRSTA,YEAR_VY,MONTH_VY,MODE from otpuska';
     SQLStmnt:=trim(SQLSTmnt)+' where ShifrId='+IntToStr(ShifrIdOtp);
     v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
     if not VarIsArray(v) then
        begin
             ShowMessage('Не найдена запись отпускного в БД');
             Exit;
        end;

     FName:=TemplateDIR+'OtpuskM_SV.xlt';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     Tabno:=v[0];
     inn:= GetNal_CodePerson(Tabno);
     DatePri:=v[9];
     DatePriS:='';
     if yearOf(DatePri)>2000 then
        begin
             ds:=intToStr(dayOf(DatePri));
             if dayOf(DatePri)<10 then
                ds:='0'+ds;
             ms:=intToStr(monthOf(DatePri));
             if monthOf(DatePri)<10 then
                ms:='0'+ms;
             DatePriS:=ds+'.'+ms+'.'+intToStr(yearOf(DatePri));
        end;
     ExRow:=16;
     s:='Номер наказу '+trim(getVariantString(v[8])); //'Приказ';
     if length(trim(DatePriS))>6 then
        s:=s+' від '+DatePriS;
     ds:=v[11];
     if length(trim(ds))>2 then
        s:=s+' період '+ds;
     E.WorkBooks[1].WorkSheets[1].Cells[2,1]:=s; //'Приказ';
     s:='Співробітник '+trim(getVariantString(v[1]))+
                   '     т.н.'+trim(IntToStr(tabno))+
                   '     ідентіф.код'+trim(inn);
     E.WorkBooks[1].WorkSheets[1].Cells[3,1]:=s;
     s:='Відпустка з '+DateToStr(getVariantDate(v[2])) +
                   ' по ' + DateToStr(getVariantDate(v[3])) +
                   '      тривалість '+trim(IntToStr(getVariantInteger(v[4])))+' днів';
     E.WorkBooks[1].WorkSheets[1].Cells[4,1]:=s;
     Mean_Day    := getVariantReal(v[10]);
     ShifrSta    := getVariantInteger(v[12]);
     WantedMonth := getVariantInteger(v[14]);
     WantedYear  := getVariantInteger(v[13]);
     Mode_Otp    := getVariantInteger(v[15]);
     SummaTotBud := 0;
     SummaTotVne := 0;
     SummaTotGN  := 0;
     SummaTotNis := 0;
     SummaTotKoefBud := 0;
     SummaTotKoefVne := 0;
     SummaTotKoefGN  := 0;
     SummaTotKoefNis := 0;
     MeanDayBud := 0;
     MeanDayVne := 0;
     MeanDayGN  := 0;
     MeanDayNis := 0;
     DayTot := 0;


                              //    0      1       2     3
        SQLStmnt:='select first 1 oklad,shifrkat,dolg,w_place from person a';
        SQLStmnt:=trim(SQLStmnt)+' where a.tabno='+IntToStr(Tabno)+' and';
        SQLStmnt:=trim(SQLStmnt)+' a.yearvy*12+a.monthvy <= '+IntToStr(WantedYear*12+WantedMonth)+' and';
        SQLStmnt:=trim(SQLStmnt)+' a.w_r=1';
        SQLStmnt:=trim(SQLStmnt)+' order by a.yearvy desc, a.monthvy desc';
        v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
        if not VarIsArray(v) then
           begin
                ShowMessage('Ошибка запроса оклада и категории работника');
           end
        else
           begin
                if VarIsNull(v[1]) then shifrKat:=0
                else shifrKat:=v[1];
                if VarIsNull(v[2]) then dolg:=''
                else dolg:=v[2];
                if VarIsNull(v[0]) then oklad:=0
                else oklad:=v[0];
                if VarIsNull(v[3]) then shifrPod:=0
                else shifrPod:=v[3];
                E.WorkBooks[1].WorkSheets[1].Cells[5,1]:='Процент '+FloatToStr(Procent)+'%.      Категорія '+trim(GET_KAT_NAME(shifrKat))+
                          '     Посада '+dolg;
                E.WorkBooks[1].WorkSheets[1].Cells[6,1]:='Стаття '+IntToStr(ShifrSta)+' '+trim(ShifrList.GetName(ShifrSta))+
                          '     Оклад '+FormatFloat(F2,oklad)+getShortCurrencyName;
                E.WorkBooks[1].WorkSheets[1].Cells[7,1]:='Середня денна з/п '+FormatFloat(F4,Mean_Day)+getShortCurrencyName+
                           '    Підрозділ '+Name_Serv(shifrPod);

           end;

        if not FIB.pFIBQuerySecond.Transaction.Active  then
           FIB.pFIBQuerySecond.Transaction.StartTransaction;
        FIB.pFIBQuerySecond.Close;
        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(' select MONTH_ZA,O_DAY,SUMMA_O_BUD,SUMMA_O_VNE,SUMMA_O_GN,SUMMA_O_NIS,SHIFRSTA from OTP_RES');
      //  FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDOTP='+IntToStr(ShifrIdOTP));
        FIB.pFIBQuerySecond.SQL.Add(' order by YEAR_ZA,MONTH_ZA');
        try
           ExRow := 9;
           baseCol := 8;
           FIB.pFIBQuerySecond.ExecQuery;
           I_Count:=0;
           while not FIB.pFIBQuerySecond.Eof do
             begin
                  inc(i_Count);
                  if i_Count>limitMonth then break;
                  inc(ExRow);
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,basecol+0]:=Trim(GetMonthShortUkr(FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger));
//                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger;
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,basecol+1]:=FIB.pFIBQuerySecond.FieldByName('O_DAY').AsInteger;
                  if abs(FIB.pFIBQuerySecond.Fields[2].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,basecol+2]  := FIB.pFIBQuerySecond.Fields[2].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[3].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,basecol+3] := FIB.pFIBQuerySecond.Fields[3].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[4].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,basecol+4] := FIB.pFIBQuerySecond.Fields[4].AsFloat;
                  if abs(FIB.pFIBQuerySecond.Fields[5].AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,basecol+5] := FIB.pFIBQuerySecond.Fields[5].AsFloat;

                  FIB.pFIBQuerySecond.Next;
             end;
           if FIB.pFIBQuerySecond.Open then
           FIB.pFIBQuerySecond.Close;
        except
           ShowMessage('Ошибка выполнения запроса параметров больничного листка');
           exit;
        end;






        FIB.pFIBQuerySecond.SQL.Clear;
        FIB.pFIBQuerySecond.SQL.Add(' select MONTH_ZA,DAY_WORK,SUMMA_BUD,SUMMA_VNE,SUMMA_GN,SUMMA_NIS,SEL,DAY_KALEND,KOEF from OTP_SUMMY');
//        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDBOLN='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
        FIB.pFIBQuerySecond.SQL.Add(' where SHIFRIDOTP='+IntToStr(ShifrIdOtp));
        FIB.pFIBQuerySecond.SQL.Add(' and SEL>0');
        FIB.pFIBQuerySecond.SQL.Add(' order by YEAR_ZA DESC,MONTH_ZA DESC');
        try
           ExRow   := 9;
           baseCol := 1;
           FIB.pFIBQuerySecond.ExecQuery;
           I_Count:=0;

           while not FIB.pFIBQuerySecond.Eof do
             begin
                  Inc(i_Count);
                  if i_Count>limitMonth then break;
                  days:=FIB.pFIBQuerySecond.FieldByName('DAY_KALEND').AsInteger;
                  Inc(ExRow);
 //                 if FIB.pFIBQuerySecond.FieldByName('SEL').AsInteger>0 then
 //                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:='+';
                  E.WorkBooks[1].WorkSheets[1].Cells[ExRow,baseCol+0]:=Trim(GetMonthShortUkr(FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsINTEGER));
 //                 E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=FIB.pFIBQuerySecond.FieldByName('MONTH_ZA').AsInteger;
                  if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_BUD').AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,baseCol+1]:=FIB.pFIBQuerySecond.FieldByName('Summa_Bud').AsFloat;
                  if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_VNE').AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,baseCol+2]:=FIB.pFIBQuerySecond.FieldByName('Summa_Vne').AsFloat;
                  if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_GN').AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,baseCol+3]:=FIB.pFIBQuerySecond.FieldByName('Summa_GN').AsFloat;
                  if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_NIS').AsFloat)>0.005 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,baseCol+4]:=FIB.pFIBQuerySecond.FieldByName('Summa_NIS').AsFloat;
                  if FIB.pFIBQuerySecond.FieldByName('KOEF').AsFloat>0 then
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,baseCol+5]:=FIB.pFIBQuerySecond.FieldByName('KOEF').AsFloat;
//                  if Mode_Otp=1 then  // Декретныее
                     if FIB.pFIBQuerySecond.FieldByName('DAY_KALEND').AsINTEGER>0 then
                        E.WorkBooks[1].WorkSheets[1].Cells[ExRow,baseCol+6]:=FIB.pFIBQuerySecond.FieldByName('DAY_KALEND').AsInteger
                     else
                        E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=0;
                  // Конец SVDN
                  // Подсчет сумм
                  if FIB.pFIBQuerySecond.FieldByName('SEL').AsInteger>0 then
                     begin
                         if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_BUD').AsFloat)>0.005 then
                            SummaTotBud := r10(SummaTotBud+FIB.pFIBQuerySecond.FieldByName('SUMMA_BUD').AsFloat);
                         if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_VNE').AsFloat)>0.005 then
                            SummaTotVne := r10(SummaTotVne+FIB.pFIBQuerySecond.FieldByName('SUMMA_VNE').AsFloat);
                         if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_GN').AsFloat)>0.005 then
                            SummaTotGN := r10(SummaTotGN+FIB.pFIBQuerySecond.FieldByName('SUMMA_GN').AsFloat);
                         if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_NIS').AsFloat)>0.005 then
                            SummaTotNis := r10(SummaTotNis+FIB.pFIBQuerySecond.FieldByName('SUMMA_NIS').AsFloat);
                         if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_BUD').AsFloat)>0.005 then
                            SummaTotKoefBud := r10(SummaTotKoefBud+FIB.pFIBQuerySecond.FieldByName('SUMMA_BUD').AsFloat*FIB.pFIBQuerySecond.FieldByName('KOEF').AsFloat);
                         if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_VNE').AsFloat)>0.005 then
                            SummaTotKoefVne := r10(SummaTotKoefVne+FIB.pFIBQuerySecond.FieldByName('SUMMA_VNE').AsFloat*FIB.pFIBQuerySecond.FieldByName('KOEF').AsFloat);
                         if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_GN').AsFloat)>0.005 then
                            SummaTotKoefGN := r10(SummaTotKoefGN+FIB.pFIBQuerySecond.FieldByName('SUMMA_GN').AsFloat*FIB.pFIBQuerySecond.FieldByName('KOEF').AsFloat);
                         if abs(FIB.pFIBQuerySecond.FieldByName('SUMMA_NIS').AsFloat)>0.005 then
                            SummaTotKoefNis := r10(SummaTotKoefNis+FIB.pFIBQuerySecond.FieldByName('SUMMA_NIS').AsFloat*FIB.pFIBQuerySecond.FieldByName('KOEF').AsFloat);
                         if FIB.pFIBQuerySecond.FieldByName('DAY_KALEND').AsINTEGER>0 then
                            DayTot:=DayTot+FIB.pFIBQuerySecond.FieldByName('DAY_KALEND').AsINTEGER;
                     end;


                  FIB.pFIBQuerySecond.Next;
             end;
           if FIB.pFIBQuerySecond.Open then
              FIB.pFIBQuerySecond.Close;
        except
              ShowMessage('Ошибка выполнения запроса исходных данных отпускного');
              exit;
        end;
   //  except
   //     ShowMessage('Ошибка выполнения запроса параметров отпускного');
   //  end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     if FIB.pFIBQuerySecond.Transaction.Active then
        FIB.pFIBQuerySecond.Transaction.Commit;
     if DayTot>0 then
        begin
             MeanDayBud :=SummaTotKoefBud / DayTot;
             MeanDayVne :=SummaTotKoefVne / DayTot;
             MeanDayGN  :=SummaTotKoefGN  / DayTot;
             MeanDayNIS :=SummaTotKoefNIS / DayTot;
        end;
     if SummaTotBud>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[23,2]:=SummaTotBud;
     if SummaTotVne>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[23,3]:=SummaTotVne;
     if SummaTotGN>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[23,4]:=SummaTotGN;
     if SummaTotNIS>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[23,5]:=SummaTotNIS;
     if SummaTotKoefBud>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[24,2]:=SummaTotKoefBud;
     if SummaTotKoefVne>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[24,3]:=SummaTotKoefVNE;
     if SummaTotKoefGN>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[24,4]:=SummaTotKoefGN;
     if SummaTotKoefNIS>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[24,5]:=SummaTotKoefNIS;
     if MeanDayBud>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[25,2]:=MeanDayBud;
     if MeanDayVne>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[25,3]:=MeanDayVne;
     if MeanDayGN>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[25,4]:=MeanDayGN;
     if MeanDayNis>0.005 then
        E.WorkBooks[1].WorkSheets[1].Cells[25,5]:=MeanDayNis;
     if DayTot>0 then
        E.WorkBooks[1].WorkSheets[1].Cells[23,7]:=DayTot;
     MeanDayTot:=MeanDayBud+MeanDayVNE+MeanDayGN+MeanDayNIS;
     E.WorkBooks[1].WorkSheets[1].Cells[7,1]:='Середня денна з/п '+FormatFloat(F4,MeanDayTot)+getShortCurrencyName+
                   '    Підрозділ '+Name_Serv(shifrPod);

        {
     if FIB.pFIBTransactionSecond.Active then
        FIB.pFIBTransactionSecond.Commit;
}

end;




procedure TFormOtpAbo.ActionPrintOtpExecute(Sender: TObject);
 var shifrIdOtp:integer;
begin
     ShifrIdOtp:=SELF.pFIBDataSetOA.FieldByName('SHIFRID').AsInteger;
     PrintOtpM(ShifrIdOtp);
     ShowTable;
     if ShifrIdOtp>0 then
        SELF.pFIBDataSetOA.Locate('ShifrId',ShifrIdOtp,[loPartialKey]);

end;

end.
