unit uFormUpdOtp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FIBQuery, pFIBQuery, pFIBStoredProc, dxExEdtr,
  dxDBGrid, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, DB, FIBDataSet, dxCntner,
  pFIBDataSet, ComCtrls, Buttons, Spin, FIBDatabase, pFIBDatabase, Grids,
  ExtCtrls, dxEditor, dxEdLib, Menus;

type
  TFormUpdOtp = class(TForm)
    LabelFio: TLabel;
    pFIBStoredProcCrTmp: TpFIBStoredProc;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pFIBDataSetSummy: TpFIBDataSet;
    pFIBDataSetRes: TpFIBDataSet;
    DataSourceSummy: TDataSource;
    DataSourceRes: TDataSource;
    dxDBGridSummy: TdxDBGrid;
    pFIBDataSetSummyCONNID: TFIBIntegerField;
    pFIBDataSetSummySHIFRID: TFIBIntegerField;
    pFIBDataSetSummySHIFRIDOTP: TFIBIntegerField;
    pFIBDataSetSummySEL: TFIBSmallIntField;
    pFIBDataSetSummyMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetSummyYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetSummySUMMA_BUD: TFIBBCDField;
    pFIBDataSetSummySUMMA_VNE: TFIBBCDField;
    pFIBDataSetSummySUMMA_GN: TFIBBCDField;
    pFIBDataSetSummySUMMA_NIS: TFIBBCDField;
    pFIBDataSetSummyOKLAD_M: TFIBBCDField;
    pFIBDataSetSummyDAY_WORK: TFIBSmallIntField;
    pFIBDataSetSummyKOEF: TFIBBCDField;
    pFIBDataSetSummyDAY_KALEND: TFIBSmallIntField;
    dxDBGridSummyCONNID: TdxDBGridMaskColumn;
    dxDBGridSummySHIFRID: TdxDBGridMaskColumn;
    dxDBGridSummySHIFRIDOTP: TdxDBGridMaskColumn;
    dxDBGridSummySEL: TdxDBGridCheckColumn;
    dxDBGridSummyMONTH_ZA: TdxDBGridColumn;
    dxDBGridSummyYEAR_ZA: TdxDBGridColumn;
    pFIBDataSetSummySHIFRIDTMP: TFIBIntegerField;
    DateTimePickerFr: TDateTimePicker;
    DateTimePickerTo: TDateTimePicker;
    dxDBGridRes: TdxDBGrid;
    pFIBDataSetResCONNID: TFIBIntegerField;
    pFIBDataSetResSHIFRID: TFIBIntegerField;
    pFIBDataSetResSHIFRIDOTP: TFIBIntegerField;
    pFIBDataSetResSHIFRSTA: TFIBSmallIntField;
    pFIBDataSetResO_DAY: TFIBSmallIntField;
    pFIBDataSetResMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetResYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetResSUMMA_O_BUD: TFIBBCDField;
    pFIBDataSetResSUMMA_O_VNE: TFIBBCDField;
    pFIBDataSetResSUMMA_O_GN: TFIBBCDField;
    pFIBDataSetResSUMMA_O_NIS: TFIBBCDField;
    pFIBDataSetResSHIFRIDTMP: TFIBIntegerField;
    dxDBGridResCONNID: TdxDBGridMaskColumn;
    dxDBGridResSHIFRID: TdxDBGridMaskColumn;
    dxDBGridResSHIFRIDOTP: TdxDBGridMaskColumn;
    dxDBGridResSHIFRSTA: TdxDBGridMaskColumn;
    dxDBGridResO_DAY: TdxDBGridCalcColumn;
    dxDBGridResMONTH_ZA: TdxDBGridCalcColumn;
    dxDBGridResYEAR_ZA: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_O_BUD: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_O_VNE: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_O_GN: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_O_NIS: TdxDBGridCalcColumn;
    dxDBGridResSHIFRIDTMP: TdxDBGridMaskColumn;
    dxDBGridSummyButton: TdxDBGridButtonColumn;
    BitBtn1: TBitBtn;
    SpinEditRazr: TSpinEdit;
    BitBtn2: TBitBtn;
    pFIBStoredProcMkSummy: TpFIBStoredProc;
    BitBtn3: TBitBtn;
    LabelODay: TLabel;
    BitBtn4: TBitBtn;
    pFIBStoredProcSave: TpFIBStoredProc;
    pFIBTransactionWrite: TpFIBTransaction;
    Label1: TLabel;
    TabSheet3: TTabSheet;
    StringGridMean: TStringGrid;
    StringGridFot: TStringGrid;
    StringGridIRas: TStringGrid;
    pFIBDataSetSummyMANUAL_CALC: TFIBSmallIntField;
    dxDBGridSummyMC: TdxDBGridCheckColumn;
    dxDBGridSummySUMMA_BUD: TdxDBGridCalcColumn;
    dxDBGridSummySUMMA_VNE: TdxDBGridCalcColumn;
    dxDBGridSummySUMMA_GN: TdxDBGridCalcColumn;
    dxDBGridSummySUMMA_NIS: TdxDBGridCalcColumn;
    dxDBGridSummyOKLAD_M: TdxDBGridCalcColumn;
    dxDBGridSummyDAY_WORK: TdxDBGridCalcColumn;
    dxDBGridSummyKOEF: TdxDBGridCalcColumn;
    dxDBGridSummyDAY_KALEND: TdxDBGridCalcColumn;
    ComboBoxMode: TComboBox;
    dxCalcEditODay: TdxCalcEdit;
    LabelODCap: TLabel;
    pFIBDataSetPereRes: TpFIBDataSet;
    TabSheet4: TTabSheet;
    dxDBGridPereRas: TdxDBGrid;
    pFIBDataSetPereResCONNID: TFIBIntegerField;
    pFIBDataSetPereResSHIFRID: TFIBIntegerField;
    pFIBDataSetPereResSHIFRIDOTP: TFIBIntegerField;
    pFIBDataSetPereResSHIFRSTA: TFIBSmallIntField;
    pFIBDataSetPereResO_DAY: TFIBSmallIntField;
    pFIBDataSetPereResMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetPereResYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetPereResNEED_PERE_BUD: TFIBSmallIntField;
    pFIBDataSetPereResNEED_PERE_VNE: TFIBSmallIntField;
    pFIBDataSetPereResNEED_PERE_GN: TFIBSmallIntField;
    pFIBDataSetPereResNEED_PERE_NIS: TFIBSmallIntField;
    pFIBDataSetPereResDATA_PERE_BUD: TFIBDateField;
    pFIBDataSetPereResDATA_PERE_VNE: TFIBDateField;
    pFIBDataSetPereResDATA_PERE_GN: TFIBDateField;
    pFIBDataSetPereResDATA_PERE_NIS: TFIBDateField;
    pFIBDataSetPereResSHIFRIDTMP: TFIBIntegerField;
    DataSourcePereRas: TDataSource;
    dxDBGridPereRasSHIFRIDOTP: TdxDBGridMaskColumn;
    dxDBGridPereRasSHIFRSTA: TdxDBGridMaskColumn;
    dxDBGridPereRasO_DAY: TdxDBGridMaskColumn;
    dxDBGridPereRasMONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridPereRasYEAR_ZA: TdxDBGridMaskColumn;
    dxDBGridPereRasNEED_PERE_BUD: TdxDBGridCheckColumn;
    dxDBGridPereRasNEED_PERE_VNE: TdxDBGridCheckColumn;
    dxDBGridPereRasNEED_PERE_GN: TdxDBGridCheckColumn;
    dxDBGridPereRasNEED_PERE_NIS: TdxDBGridCheckColumn;
    dxDBGridPereRasDATA_PERE_BUD: TdxDBGridDateColumn;
    dxDBGridPereRasDATA_PERE_VNE: TdxDBGridDateColumn;
    dxDBGridPereRasDATA_PERE_GN: TdxDBGridDateColumn;
    dxDBGridPereRasDATA_PERE_NIS: TdxDBGridDateColumn;
    dxDBGridPereRasSHIFRIDTMP: TdxDBGridMaskColumn;
    ComboBoxModeDC: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    comboboxKindsOtp: TComboBox;
    pFIBTransactionPereWrite: TpFIBTransaction;
    pFIBDataSetPereResSUMMA_O_BUD: TFIBBCDField;
    pFIBDataSetPereResSUMMA_O_VNE: TFIBBCDField;
    pFIBDataSetPereResSUMMA_O_NIS: TFIBBCDField;
    pFIBDataSetPereResSUMMA_O_GN: TFIBBCDField;
    dxDBGridPereRasSumma_Bud: TdxDBGridColumn;
    dxDBGridPereRasSumma_Vne: TdxDBGridColumn;
    dxDBGridPereRasSumma_GN: TdxDBGridColumn;
    dxDBGridPereRasSumma_NIS: TdxDBGridColumn;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    DateTimePickerData_Pri: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EditNomerPri: TEdit;
    EditPeriodPri: TEdit;
    pFIBDataSetSummyDAY_KALEND_WORK: TFIBSmallIntField;
    dxDBGridSummyDay_Calend_Work: TdxDBGridColumn;
    rgMode_25_07_2016: TRadioGroup;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    ComboBoxModeWR: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function Execute: boolean;
    procedure dxDBGridSummyButtonButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpinEditRazrChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxDBGridSummyChangedColumnsWidth(Sender: TObject);
    procedure StringGridFotDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure dxDBGridSummySELChange(Sender: TObject);
    procedure dxDBGridSummyMCChange(Sender: TObject);
    procedure ComboBoxModeChange(Sender: TObject);
    procedure dxCalcEditODayChange(Sender: TObject);
    procedure ComboBoxModeDCChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure comboboxKindsOtpChange(Sender: TObject);
    procedure dxDBGridPereRasNEED_PERE_BUDChange(Sender: TObject);
    procedure dxDBGridPereRasNEED_PERE_NISChange(Sender: TObject);
    procedure dxDBGridPereRasNEED_PERE_GNChange(Sender: TObject);
    procedure dxDBGridPereRasNEED_PERE_VNEChange(Sender: TObject);
    procedure TabSheet4Enter(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure ComboBoxModeWRChange(Sender: TObject);
  private
    { Private declarations }
    function  ComplitOtp:boolean;
    procedure ShowSummyMean;
    procedure GetSummy;
    procedure SynchronizeStringGrid;
    procedure CalcSummyFot;
    procedure SetUpModeShow;
    procedure ResetDates(code:integer);

  public
    WantedTabno:integer;
    Razrjad:integer;
    Fio:String;
    ActionClar:integer;
    shifrkat:integer;
    shifrgru:integer;
    WantedShifrSta:integer;
    ShifrIdOtp:INTEGER;
    MEANDAY:real;
    MEANDAY_BUD:real;
    MEANDAY_VNE:real;
    MEANDAY_GN:real;
    MEANDAY_NIS:real;
    O_DAY:INTEGER;
    Summa_Bud,Summa_Vne,Summa_Nis,Summa_Gn:real;
    NmbOfDays:integer;
    WorkYear,WorkMonth:INTEGER; { Просматриваемые год и месяц }
    CallMode : integer; {0 - из общей таблицы 1 - из данных по сотруднику}
    WantedPodr:integer;
    Mode : integer;
    ModeDC : integer;
    Mode_25_07_2016:Integer; { Режим расчета для Луганска с 25 07 2016}
    KindOfOtp  : Integer   ; { 0-тарифный 1 учебный 2 чернобыльский 3 дополнительный на 2-х детей до 15 - лет}
    Nomer_Pri  : string    ; { Номер приказа об отпуске }
    Period_Pri : string    ; { Номер приказа об отпуске }
    Data_Pri   : TDateTime ;
    modeWR : integer;        { 0 - осн и совм 1 - осн 2 - совм}
    GUID : String
    { Public declarations }
  end;

var
  FormUpdOtp: TFormUpdOtp;

implementation
uses uFrmFindKadryFB,UFibModule,ScrDef,uFormTmpOtpA,uFormWait,
     DateUtils,ScrUtil,ScrExport,UFormWaitMess,USQLUnit;

{$R *.dfm}

procedure TFormUpdOtp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetRes.Active then
         pFIBDataSetRes.Close;
      if pFIBDataSetPereRes.Active then
         pFIBDataSetPereRes.Close;
      if pFIBDataSetSummy.Active then
         pFIBDataSetSummy.Close;
      if pFIBDataSetRes.Transaction.Active then
         pFIBDataSetRes.Transaction.CommitRetaining;
      if pFIBDataSetSummy.Transaction.Active then
         pFIBDataSetSummy.Transaction.CommitRetaining;
      if pFIBDataSetPereRes.Transaction.Active then
         pFIBDataSetPereRes.Transaction.CommitRetaining;
      if pFIBDataSetPereRes.UpdateTransaction.Active then
         pFIBDataSetPereRes.UpdateTransaction.CommitRetaining;

      Action:=caFree;
end;

function TFormUpdOtp.Execute: boolean;
var ks,gs:string;
    IStarted:boolean;
    SQLStmnt:string;
begin
{
      IF (WorkMonth<>NMES) OR (WorkYear<>CurrYear) THEN
          BEGIN
               BitBtn3.Hide;
               BitBtn4.Hide;
          END
      ELSE
          BEGIN
               BitBtn3.Show;
               BitBtn4.Show;
          END;
}
  DateTimePickerData_Pri.Date:=Data_Pri;
  EditNomerPri.Text  := Nomer_Pri;
  EditPeriodPri.Text := Period_Pri;

  if ModeDC = 1 then
     ComboBoxModeDC.ItemIndex:=1
  else
     ComboBoxModeDC.ItemIndex:=0;

  if Mode = 1 then
     ComboBoxMode.ItemIndex:=1
  else if Mode = 2 then
     ComboBoxMode.ItemIndex:=2
  else
     ComboBoxMode.ItemIndex:=0;

  comboboxKindsOtp.ItemIndex := KindOfOtp;
  ComboBoxModeWR.ItemIndex   := modeWr;

  SetUpModeShow;
  if CallMode=1 then
     begin
          BitBtn1.Hide;
          LabelODay.Caption:='0 дней';
          if Self.WantedTabno>0 then
             LabelFio.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.Fio);
          if (Self.Razrjad>0) and (Self.Razrjad<26) then
             Self.SpinEditRazr.Value:=Razrjad
          else
             Self.SpinEditRazr.Value:=0;
     end
                else BitBtn1.Show;
  dxCalcEditODay.Text:='';
  if ActionClar>1 then
     begin
          LabelODay.Caption:=IntToStr(Self.O_Day)+' дней';
          dxCalcEditODay.Text:=IntToStr(Self.O_Day);
          LabelFio.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.Fio);
          if (Self.Razrjad>0) and (Self.Razrjad<26) then
             Self.SpinEditRazr.Value:=Razrjad
          else
             Self.SpinEditRazr.Value:=0;
          IStarted:=false;
          if not FIB.pFIBQuery.Transaction.Active then
             begin
                  IStarted:=true;
                  FIB.pFIBQuery.Transaction.StartTransaction;
             end;

          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('SELECT name FROM kateg where shifr='+IntToSTr(Self.ShifrKat));
          try
             FIB.pFIBQuery.ExecQuery;
             ks:=FIB.pFIBQuery.Fields[0].AsString;
          except
              Ks:=''
          end;
          FIB.pFIBQuery.Close;
          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('SELECT name FROM gruppy where shifr='+IntToSTr(Self.ShifrGru));
          try
             FormWait.Show;
             Application.ProcessMessages;
             FIB.pFIBQuery.ExecQuery;
             FormWait.Hide;
             gs:=FIB.pFIBQuery.Fields[0].AsString;
          except
              gs:=''
          end;
          FIB.pFIBQuery.Close;
          if IStarted then
             begin
                  IStarted:=false;
                  FIB.pFIBQuery.Transaction.Commit;
             end;
          LabelFio.Caption:=Trim(LabelFio.Caption)+' '+trim(ks)+' '+trim(gs);
          IF SHIFRIDOTP>0 THEN
             BEGIN
//                    SQLStmnt:='EXECUTE PROCEDURE CRTMPOTP (?SHIFRID)';
                    if isLNR and (Mode_25_07_2016=1) then
                       SQLStmnt:='EXECUTE PROCEDURE CRTMPOTP_25_07_2016 ('+intToStr(shifrIdOtp)+')'
//                       SQLStmnt:='EXECUTE PROCEDURE CRTMPOTP ('+intToStr(shifrIdOtp)+')'
                    else
                       SQLStmnt:='EXECUTE PROCEDURE CRTMPOTP ('+intToStr(shifrIdOtp)+')';
                    FIB.pFIBDatabaseSal.Execute(SQLStmnt);   
       //           Nomer_Pri  := FIB.pFIBDatabaseSal.QueryValue('select nomer_pri from otpuska where id='+IntToStr(SHIFRIDOTP),0);
       //           Data_Pri   := FIB.pFIBDatabaseSal.QueryValue('select data_pri from otpuska where id='+IntToStr(SHIFRIDOTP),0);
       //           Period_Pri := FIB.pFIBDatabaseSal.QueryValue('select period_pri from otpuska where id='+IntToStr(SHIFRIDOTP),0);
(*
                  if not pFIBStoredProcCrTmp.Transaction.Active then
                     begin
                           IStarted:=true;
                           pFIBStoredProcCrTmp.Transaction.StartTransaction;
                     end;
                  pFIBStoredProcCrTmp.Prepare;
                  try
                     pFIBStoredProcCrTmp.Params[0].AsInteger := ShifrIdOtp;
                     FormWait.Show;
                     Application.ProcessMessages;
                     pFIBStoredProcCrTmp.ExecProc;
                     FormWait.Hide;
                  finally
                     pFIBStoredProcCrTmp.Close;
                  end;
                  if IStarted then
                     begin
                          IStarted:=false;
                          FIB.pFIBTransactionSAL.Commit;
                     end;
*)
                  if not pFIBDataSetSummy.Transaction.Active then
                     pFIBDataSetSummy.Transaction.StartTransaction;
                  if pFIBDataSetSummy.Active then
                     pFIBDataSetSummy.Active:=false;
                  pFIBDataSetSummy.Active:=true;
                  if pFIBDataSetRes.Active then
                     pFIBDataSetRes.Active:=false;
                  pFIBDataSetRes.Active:=true;
                  if pFIBDataSetPereRes.Active then
                     pFIBDataSetPereRes.Active:=false;
                  pFIBDataSetPereRes.Active:=true;
             END;
     end;
  Self.visible:=false;
  if ShowModal = mrOk then result := true
                      else result := false;
end;



procedure TFormUpdOtp.dxDBGridSummyButtonButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
VAR Y,M:Integer;
begin
     Y:=pFIBDataSetSummy.FieldByName('YEAR_ZA').AsInteger;
     M:=pFIBDataSetSummy.FieldByName('MONTH_ZA').AsInteger;
     with TFormOtpA.Create(nil) do
            try
                WantedYear:=Y;
                WantedMonth:=M;
                if execute then
                   begin
                   end;
            finally
             free;
            end;

end;

procedure TFormUpdOtp.BitBtn1Click(Sender: TObject);
var ks,gs,s:string;
begin
     IF ((WorkYear<>CurrYear) OR (WorkMonth<>Nmes)) THEN
        BEGIN
              ShowMessage('Выбрать работника можно только в текущем месяце');
              Exit;
        END;

    LabelFio.Caption:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     Self.WantedTabno:=GetTabno;
                     Self.FIO:=GetFio;
                     LabelFio.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.Fio);
                     if not FIB.pFIBQuery.Transaction.Active then
                        FIB.pFIBQuery.Transaction.StartTransaction;
                     FIB.pFIBQuery.SQL.Clear;
                     FIB.pFIBQuery.SQL.Add('SELECT shifrkat,shifrgru,namekat,namegru,w_place FROM getkatgru('+IntToSTr(Self.WantedTabno)+')');
                     try
                         FIB.pFIBQuery.ExecQuery;
                         Self.ShifrKat:=FIB.pFIBQuery.Fields[0].AsInteger;
                         Self.ShifrGru:=FIB.pFIBQuery.Fields[1].AsInteger;
                         KS:=FIB.pFIBQuery.Fields[2].AsString;
                         GS:=FIB.pFIBQuery.Fields[3].AsString;
                         Self.WantedPodr:=FIB.pFIBQuery.Fields[4].AsInteger;
                         LabelFio.Caption:=Trim(LabelFio.Caption)+' '+trim(ks)+' '+trim(gs);
                         FIB.pFIBQuery.Close;
                     except
                         MessageDlg('Ошибка getkatgru',mtInformation, [mbOk], 0);
                         Exit;
                     end;
                     if not FIB.pFIBQuery.Transaction.Active then
                        FIB.pFIBQuery.Transaction.StartTransaction;
                     FIB.pFIBQuery.SQL.Clear;
                     s:='select first 1 razrijad from pr_get_razr_person('+IntToStr(WantedTabno)+')';
                     FIB.pFIBQuery.SQL.Add(s);
                     try
                        FIB.pFIBQuery.ExecQuery;
                        Razrjad:=FIB.pFIBQuery.Fields[0].AsInteger;
                        FIB.pFIBQuery.Close;
                     except
                        ShowMessage('Ошибка получения разряда');
                        Razrjad:=0;
                     end;
                     Self.SpinEditRazr.Value:=Razrjad;
                     FIB.pFIBQuery.Close;
                     if not FIB.pFIBQuery.Transaction.Active then
                        FIB.pFIBQuery.Transaction.CommitRetaining;
                     Self.Repaint;
               end;
         finally
{            free;   }
          end;
end;

procedure TFormUpdOtp.FormCreate(Sender: TObject);
 var Df,dt:tdateTime;
     Y,M,D,i:word;
     JStarted:Boolean;
     S:String;
begin
      CallMode:=0; { по умолчанию вызов из общей таблицы }
      GUID:='';
      Mode :=0;
      ComboBoxMode.ItemIndex:=0;
      ModeDC :=0;
      ComboBoxModeDC.ItemIndex:=0;
      DecodeDate(Date,Y,M,D);
      df:=EnCodeDate(Y,M,D);
      for i:=1 to 56 do
          begin
                Inc(D);
                if d>DaysInAMonth(Y,M) then
                   begin
                        D:=1;
                        Inc(M);
                        if M>12 then
                           begin
                                M:=1;
                                inc(Y);
                           end;
                   end;
          end;
      dt:=EnCodeDate(Y,M,D);
      DateTimePickerFr.Date   := Df;
      DateTimePickerTo.Date   := Dt;
      Self.SpinEditRazr.Value := 0;

      StringGridMean.ColCount:=4;
      StringGridMean.RowCount:=5;
      StringGridMean.Cells[0,1]:='Бюджет';
      StringGridMean.Cells[0,2]:='ВнеБюджет';
      StringGridMean.Cells[0,3]:='Г Н';
      StringGridMean.Cells[0,4]:='Н И С';
      StringGridMean.Cells[1,0]:='Итого';
      StringGridMean.Cells[2,0]:='Дней';
      StringGridMean.Cells[3,0]:='Ср.дн.';
      if ModeDC=1 then
         begin
              StringGridMean.Cells[2,0]:='Часов';
              StringGridMean.Cells[3,0]:='Ср.час.';
         end;

      PageControl1.ActivePageIndex:=0;
      StringGridFot.ColCount:=7;
      StringGridFot.RowCount:=3;
      SynchronizeStringGrid;
      StringGridFot.Cells[0,0]:='Только отмеченные';
      StringGridFot.Cells[0,1]:='С учетом коэф-тов';
      StringGridFot.Cells[0,2]:='Среднедневные';
      if ModeDC=1 then
         StringGridFot.Cells[0,2]:='Среднечасовые';

      StringGridIRas.RowCount:=4;
      StringGridIRas.ColCount:=6;
      StringGridIRas.ColWidths[0]:=200;
      StringGridIRas.ColWidths[1]:=90;
      StringGridIRas.ColWidths[2]:=90;
      StringGridIRas.ColWidths[3]:=90;
      StringGridIRas.ColWidths[4]:=90;
      StringGridIRas.ColWidths[5]:=90;
      StringGridIRas.Width:=StringGridIRas.ColWidths[0] +
                            StringGridIRas.ColWidths[1] +
                            StringGridIRas.ColWidths[2] +
                            StringGridIRas.ColWidths[3] +
                            StringGridIRas.ColWidths[4] +
                            StringGridIRas.ColWidths[5]+10;

      StringGridIRas.Cells[0,1] := 'Только отмеченные';
      StringGridIRas.Cells[0,2] := 'С учетом коэффицентов';
      StringGridIRas.Cells[0,3] := 'Среднедневные';
      StringGridIRas.Cells[1,0] := 'Бюджет';
      StringGridIRas.Cells[2,0] := 'ВнеБюджет';
      StringGridIRas.Cells[3,0] := '  Г.Н.   ';
      StringGridIRas.Cells[4,0] := '  Н.И.С. ';
      StringGridIRas.Cells[5,0] := '  Дней   ';
      if ModeDC=1 then
         begin
               StringGridIRas.Cells[5,0] := '  Часов  ';
               StringGridIRas.Cells[0,3] := 'Среднечасовые';
         end;


      if not pFIBDataSetSummy.Transaction.Active then
         pFIBDataSetSummy.Transaction.StartTransaction;
      if not pFIBDataSetSummy.Active then
         pFIBDataSetSummy.Open;
      if not pFIBDataSetRes.Transaction.Active then
         pFIBDataSetRes.Transaction.StartTransaction;
      if not pFIBDataSetRes.Active then
         pFIBDataSetRes.Open;
      if not pFIBDataSetPereRes.Transaction.Active then
         pFIBDataSetPereRes.Transaction.StartTransaction;
      if not pFIBDataSetPereRes.Active then
         pFIBDataSetPereRes.Open;


      SetUpModeShow;
      JStarted:=False;
      if not FIB.pFIBQuery.Transaction.Active then
             begin
                  JStarted:=true;
                  FIB.pFIBQuery.Transaction.StartTransaction;
             end;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('SELECT NAME FROM TB_KINDSOTP ORDER BY SHIFRKIND');
      try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.EOF do
               begin
                    s:=FIB.pFIBQuery.Fields[0].AsString;
                    comboboxKindsOtp.Items.Add(s);
                    FIB.pFIBQuery.Next;
               end;
      except
         s:=''
      end;
      FIB.pFIBQuery.Close;
      if JStarted then
         FIB.pFIBQuery.Transaction.Commit;

      if isSVDN then
        dxDBGridSummyDay_Calend_Work.Visible:=False;
      Mode_25_07_2016:=0;
      if isLNR then
         begin
              rgMode_25_07_2016.Enabled:=True;
              rgMode_25_07_2016.Visible:=True;
              rgMode_25_07_2016.ItemIndex:=Mode_25_07_2016;
              comboboxModeWr.Enabled:=true;
              comboboxModeWr.Visible:=true;

         end
      else
         begin
              rgMode_25_07_2016.Enabled:=False;
              rgMode_25_07_2016.Visible:=false;
              comboboxModeWr.Enabled:=false;
              comboboxModeWr.Visible:=false;
         end;

end;

procedure TFormUpdOtp.BitBtn2Click(Sender: TObject);
var Y,M,D:word;
    SQLStmnt:string;
    DataS:string;
begin
     if WantedTabno=0 then
        begin
              ShowMessage('Не указан сотрудник');
              Exit;
        end;
     Razrjad:=SpinEditRazr.Value;
     IF ((WorkYear<>CurrYear) OR (WorkMonth<>Nmes)) THEN
        begin
              ShowMessage('Инициализация только за текущий месяц');
              Exit;
        end;
     DecodeDate(DateTimePickerFr.Date,Y,M,D);
     if (((Y=CurrYear) and (m>NMES)) or (Y>CurrYear)) then
     if isSVDN then
        begin
             if YesNo('Подготовить данные за '+GetMonthRus(NMES)+' '+IntToStr(CurrYear)) then
                putPersonToSqlForCurrMonth(WantedTabno,WantedPodr);
        end;

     Mode:=0;
     if ComboBoxMode.ItemIndex=1 then
        Mode:=1
     else if ComboBoxMode.ItemIndex=2 then
        Mode:=2;
     ModeDC:=0;
     if ComboBoxModeDC.ItemIndex=1 then
        ModeDC:=1;
     DataS:=IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
 //    SQLStmnt:='EXECUTE PROCEDURE MKTMPOTPSUMMY (?TABNO, ?DATEFR, ?CURRMONTH, ?CURRYEAR, ?RAZRIJAD, ?MODE,?MODEDC,?KIND_OTP)';
     SQLStmnt:='EXECUTE PROCEDURE MKTMPOTPSUMMY ('+intToStr(WantedTabno)+','''+DataS+''','+IntToStr(NMES)+','+IntToStr(currYear)+','+intToStr(Razrjad)+','+intToStr(Mode)+','+intToStr(ModeDC)+','+intToStr(kindOfOtp)+')';
     if (isLNR and (rgMode_25_07_2016.ItemIndex=1)) then
         if bolnLNRMode2016 then
            SQLStmnt:='EXECUTE PROCEDURE MKTMPOTPSUMMY_25_07_2016('+intToStr(WantedTabno)+','''+DataS+''','+IntToStr(NMES)+','+IntToStr(currYear)+','+intToStr(Razrjad)+','+intToStr(Mode)+','+intToStr(ModeDC)+','+intToStr(kindOfOtp)+')'
         else
            SQLStmnt:='EXECUTE PROCEDURE MKTMPOTPSUMMY_01_01_2018('+intToStr(WantedTabno)+','''+DataS+''','+IntToStr(NMES)+','+IntToStr(currYear)+','+intToStr(Razrjad)+','+intToStr(Mode)+','+intToStr(ModeDC)+','+intToStr(kindOfOtp)+','+intToStr(modeWr)+','''+trim(GUID)+''''+')';

//        SQLStmnt:='EXECUTE PROCEDURE MKTMPOTPSUMMY('+intToStr(WantedTabno)+','''+DataS+''','+IntToStr(NMES)+','+IntToStr(currYear)+','+intToStr(Razrjad)+','+intToStr(Mode)+','+intToStr(ModeDC)+','+intToStr(kindOfOtp)+')';


     FIB.pFIBDatabaseSal.Execute(SQLStmnt);

(*
     if not pFIBStoredProcMkSummy.Transaction.Active then
        pFIBStoredProcMkSummy.Transaction.StartTransaction;
     pFIBStoredProcMkSummy.Prepare;
     try
        pFIBStoredProcMkSummy.Params[0].AsInteger := WantedTabno;
        pFIBStoredProcMkSummy.Params[1].AsString  := IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
        pFIBStoredProcMkSummy.Params[2].AsInteger := NMES;
        pFIBStoredProcMkSummy.Params[3].AsInteger := CurrYear;
        pFIBStoredProcMkSummy.Params[4].AsInteger := Razrjad;
        pFIBStoredProcMkSummy.Params[5].AsInteger := Mode;
        pFIBStoredProcMkSummy.Params[6].AsInteger := ModeDC;
        pFIBStoredProcMkSummy.Params[7].AsInteger := KindOfOtp;
        FormWait.Show;
        Application.ProcessMessages;
        if not pFIBStoredProcMkSummy.Transaction.Active then
               pFIBStoredProcMkSummy.Transaction.StartTransaction;
        pFIBStoredProcMkSummy.ExecProc;
        FormWait.Hide;
     finally
        pFIBStoredProcMkSummy.Close;
     end;
    { pFIBStoredProcMkSummy.Transaction.CommitRetaining;}
     if pFIBStoredProcMkSummy.Transaction.Active then
        pFIBStoredProcMkSummy.Transaction.Commit;
*)        
     if pFIBDataSetSummy.Active then
        pFIBDataSetSummy.Active:=false;
     pFIBDataSetSummy.Active:=true;
     CalcSummyFot;
{     BitBtn3Click(Sender);   }
end;

procedure TFormUpdOtp.SpinEditRazrChange(Sender: TObject);
begin
     Razrjad:=SpinEditRazr.Value;
end;

procedure TFormUpdOtp.BitBtn3Click(Sender: TObject);
var
    YFR,MFR,DFR,YTO,MTO,DTO:word;
    DF,DT:String;
 //   WantedShifrSta:integer;
    IStarted:boolean;
    SQLStmnt:string;
begin
     if WantedTabno=0 then
        begin
              ShowMessage('Не указан сотрудник');
              Exit;
        end;
     IF ((WorkYear<>CurrYear) OR (WorkMonth<>Nmes)) THEN
        BEGIN
              ShowMessage('Расчет отпускных только за текущий месяц');
              Exit;
        END;
     IStarted:=false;
     if not FIB.pFIBQuery.Transaction.Active then
        begin
             FIB.pFIBQuery.Transaction.StartTransaction ;
             IStarted:=true;
        end;
     WantedShifrSta:=5;

     DecodeDate(DateTimePickerFr.Date,YFR,MFR,DFR);
     DecodeDate(DateTimePickerTo.Date,YTo,MTo,DTo);
     ModeDC:=0;
     if ComboBoxModeDC.ItemIndex=1 then
        ModeDC:=1;
     if ComboBoxMode.ItemIndex=1 then
        begin
             WantedShifrSta:=NOT_USE_HOLIDAY_SHIFR ;     // Компенсация за неиспользованный отпуск
             YFR:=CurrYear;
             MFR:=NMES;
             DFR:=10;
             ModeDC:=0;
        end;
     DF:=IntToStr(YFR)+'-'+IntToStr(MFR)+'-'+IntToStr(DFR);
     DT:=IntToStr(YTO)+'-'+IntToStr(MTO)+'-'+IntToStr(DTO);
     FIB.pFIBQuery.SQL.Clear;
 //    FIB.pFIBQuery.SQL.Add('SELECT MeanDay,MeanDay_Bud,MeanDay_VNE,MeanDay_GN,MeanDay_Nis,O_DAY FROM CALCOTP('''+DF+''','''+DT+''','+IntToStr(WantedShifrSta)+','+IntToStr(Mode)+')');
     if isLNR and (rgMode_25_07_2016.ItemIndex=1) then
        SQLStmnt:='SELECT MeanDay,MeanDay_Bud,MeanDay_VNE,MeanDay_GN,MeanDay_Nis,O_DAY FROM CALCOTP_25_07_2016('+intToStr(WantedTabno)+','''+DF+''','''+DT+''','+IntToStr(WantedShifrSta)+','+IntToStr(O_Day)+','+IntToStr(ModeDC)+','+IntToStr(KindOfOtp)+')'
     else
        SQLStmnt:='SELECT MeanDay,MeanDay_Bud,MeanDay_VNE,MeanDay_GN,MeanDay_Nis,O_DAY FROM CALCOTP('''+DF+''','''+DT+''','+IntToStr(WantedShifrSta)+','+IntToStr(O_Day)+','+IntToStr(ModeDC)+','+IntToStr(KindOfOtp)+')';
 //    FIB.pFIBQuery.SQL.Add('SELECT MeanDay,MeanDay_Bud,MeanDay_VNE,MeanDay_GN,MeanDay_Nis,O_DAY FROM CALCOTP('''+DF+''','''+DT+''','+IntToStr(WantedShifrSta)+','+IntToStr(O_Day)+','+IntToStr(ModeDC)+','+IntToStr(KindOfOtp)+')');
     FIB.pFIBQuery.SQL.Add(SQLStmnt);
     try
        FormWait.Show;
        Application.ProcessMessages;
        FIB.pFIBQuery.ExecQuery;
        FormWait.Hide;
        MEANDAY      := FIB.pFIBQuery.FldByName['MeanDay'].AsFloat;
        MEANDAY_BUD  := FIB.pFIBQuery.FldByName['MeanDay_Bud'].AsFloat;
        MEANDAY_VNE  := FIB.pFIBQuery.FldByName['MeanDay_Vne'].AsFloat;
        MEANDAY_GN   := FIB.pFIBQuery.FldByName['MeanDay_Gn'].AsFloat;
        MEANDAY_NIS  := FIB.pFIBQuery.FldByName['MeanDay_Nis'].AsFloat;
        O_DAY        := FIB.pFIBQuery.FldByName['O_Day'].AsInteger;
        LabelODay.Caption:=IntToStr(O_Day)+' дней';
     except
     end;
     FIB.pFIBQuery.Close;
     if IStarted then
        begin
             FIB.pFIBQuery.Transaction.Commit ;
             IStarted:=false;
        end
                 else
        FIB.pFIBQuery.Transaction.CommitRetaining;

     if pFIBDataSetRes.Active then
        pFIBDataSetRes.Active:=false;
     if pFIBDataSetPereRes.Active then
        pFIBDataSetPereRes.Active:=false;
     if pFIBDataSetSummy.Active then
        pFIBDataSetSummy.Active:=false;
     pFIBDataSetRes.Active:=true;
     pFIBDataSetPereRes.Active:=true;
     pFIBDataSetSummy.Active:=true;
     ShowSummyMean;
     CalcSummyFot;


end;


function TFormUpdOtp.ComplitOtp:boolean;
 begin
      Result:=false;
      if WorkYear<>CurrYear             then Exit;
  //    if WorkMonth<>NMES                then Exit;
      if WantedTabno=0                  then Exit;
      if  ((Razrjad<0) or (Razrjad>25)) then Exit;
      if abs(MEANDAY)<0.01              then Exit;
      if O_Day<1                        then Exit;
      Result:=true;
 end;

procedure TFormUpdOtp.BitBtn4Click(Sender: TObject);
var DataVY   : TDate;
    IStarted : boolean;
    SQLStmnt : string;
    DateFrS  : string;
    DateToS  : string;
    DateVyS  : string;
    DatePriS : string;

begin
     if ((WorkYear<>CurrYear) or (Flow_Month<>NMES)) then
        begin
             ShowMessage('Данные можно сохранить только в текущем месяце');
             Exit;
        end;

     if WantedShifrSta<>NOT_USE_HOLIDAY_SHIFR  then
        WantedShifrSta:=5;
     if not ComplitOtp then
        begin
             ShowMessage('Данные отпускного листа не заполнены');
             Exit;
        end;
     IStarted:=false;
     if not FIB.pFIBTransactionSal.Active then
        begin
             FIB.pFIBTransactionSal.StartTransaction ;
             IStarted:=true;
        end;
     DataVy:=EnCodeDate(CurrYear,NMES,1);
     Data_Pri   := DateTimePickerData_Pri.Date;
     Data_Pri_Mem := Data_Pri;
     Nomer_Pri  := EditNomerPri.Text;
     Period_Pri := Trim(Copy(EditPeriodPri.Text+space(30),1,30));
     Mode_25_07_2016:=rgMode_25_07_2016.ItemIndex;
     if Mode_25_07_2016<>1 then
       Mode_25_07_2016:=0;
     DateFrS:=IntToStr(YearOf(DateTimePickerFr.Date))+'-'+IntToStr(MonthOf(DateTimePickerFr.Date))+'-'+IntToStr(DayOf(DateTimePickerFr.Date));
     DateToS:=IntToStr(YearOf(DateTimePickerTo.Date))+'-'+IntToStr(MonthOf(DateTimePickerTo.Date))+'-'+IntToStr(DayOf(DateTimePickerTo.Date));
     DateVyS:=IntToStr(YearOf(DataVy))+'-'+IntToStr(MonthOf(DataVy))+'-'+IntToStr(DayOf(DataVy));
     DatePriS:=IntToStr(YearOf(Data_Pri))+'-'+IntToStr(MonthOf(Data_Pri))+'-'+IntToStr(DayOf(Data_Pri));
//     SQLStmnt:=EXECUTE PROCEDURE PUTOTP (?SHIFRID, ?TABNO, ?F_DATA, ?L_DATA, ?DATAVY, ?SHIFRSTA, ?O_DAY, ?MEANDAY_BUD, ?MEANDAY_VNE, ?MEANDAY_GN, ?MEANDAY_NIS, ?RAZRIJAD, ?MODE, ?MODEDC, ?KIND_OTP, ?NOMER_PRI, ?DATA_PRI, ?PERIOD_PRI, ?MODE_25_07_2016)
     if isLNR and (Mode_25_07_2016=1) then
        if bolnLNRMode2016 then
           SQLStmnt:='EXECUTE PROCEDURE PUTOTP_25_07_2016 ('+IntToStr(ShifrIdOtp)+','+IntToStr(WantedTabno)+','''+DateFrS+''','''+DateToS+''','''+DateVyS+''','+intToStr(WantedShifrSta)+','+intToStr(O_DAY)+','+ FormatFloatPoint(MEANDAY_BUD)+','+FormatFloatPoint(MEANDAY_VNE)+','+FormatFloatPoint(MEANDAY_GN)+','+FormatFloatPoint(MEANDAY_NIS)+','+intToStr(Razrjad)+','+intToStr(MODE)+','+intToStr(MODEDC)+','+intToStr(KINDOFOTP)+','''+trim(ReplSToDQuote(Nomer_Pri))+''','''+DatePriS+''','''+Trim(ReplSToDQuote(Period_Pri))+''','+intToStr(MODE_25_07_2016)+')'
        else
           SQLStmnt:='EXECUTE PROCEDURE PUTOTP_01_01_2018 ('+IntToStr(ShifrIdOtp)+','+IntToStr(WantedTabno)+','''+DateFrS+''','''+DateToS+''','''+DateVyS+''','+intToStr(WantedShifrSta)+','+intToStr(O_DAY)+','+ FormatFloatPoint(MEANDAY_BUD)+','+FormatFloatPoint(MEANDAY_VNE)+','+FormatFloatPoint(MEANDAY_GN)+','+FormatFloatPoint(MEANDAY_NIS)+','+intToStr(Razrjad)+','+intToStr(MODE)+','+intToStr(MODEDC)+','+intToStr(KINDOFOTP)+','''+trim(ReplSToDQuote(Nomer_Pri))+''','''+DatePriS+''','''+Trim(ReplSToDQuote(Period_Pri))+''','+intToStr(MODE_25_07_2016)+','+IntToStr(modeWr)+','''+trim(GUID)+''')'

     else
        SQLStmnt:='EXECUTE PROCEDURE PUTOTP ('+IntToStr(ShifrIdOtp)+','+IntToStr(WantedTabno)+','''+DateFrS+''','''+DateToS+''','''+DateVyS+''','+intToStr(WantedShifrSta)+','+intToStr(O_DAY)+','+ FormatFloatPoint(MEANDAY_BUD)+','+FormatFloatPoint(MEANDAY_VNE)+','+FormatFloatPoint(MEANDAY_GN)+','+FormatFloatPoint(MEANDAY_NIS)+','+intToStr(RAZRJAD)+','+intToStr(MODE)+','+intToStr(MODEDC)+','+intToStr(KINDOFOTP)+','''+trim(ReplSToDQuote(Nomer_Pri))+''','''+DatePriS+''','''+Trim(ReplSToDQuote(Period_Pri))+''','+intToStr(MODE_25_07_2016)+')';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
(*
     pFIBStoredProcSave.Prepare;
     try
        pFIBStoredProcSave.Params[0].AsInteger  := ShifrIdOtp;
        pFIBStoredProcSave.Params[1].AsInteger  := WantedTabno;
        pFIBStoredProcSave.Params[2].AsString   := DateToStr(DateTimePickerFr.Date);
        pFIBStoredProcSave.Params[3].AsString   := DateToStr(DateTimePickerTo.Date);
        pFIBStoredProcSave.Params[4].AsString   := DateToStr(DataVy);
        pFIBStoredProcSave.Params[5].AsInteger  := WantedShifrSta;
        pFIBStoredProcSave.Params[6].AsInteger  := O_DAY;
        pFIBStoredProcSave.Params[7].AsFloat    := MEANDAY_BUD;
        pFIBStoredProcSave.Params[8].AsFloat    := MEANDAY_VNE;
        pFIBStoredProcSave.Params[9].AsFloat    := MEANDAY_GN;
        pFIBStoredProcSave.Params[10].AsFloat   := MEANDAY_NIS;
        pFIBStoredProcSave.Params[11].AsInteger := Razrjad;
        pFIBStoredProcSave.Params[12].AsInteger := Mode;
        pFIBStoredProcSave.Params[13].AsInteger := ModeDC;
        pFIBStoredProcSave.Params[14].AsInteger := KindOfOtp;
        pFIBStoredProcSave.Params[15].AsString  := Trim(eplSToDQuote(Nomer_Pri));
        pFIBStoredProcSave.Params[16].AsString  := DateToStr(Data_Pri);
        pFIBStoredProcSave.Params[17].AsString  := Trim(ReplSToDQuote(Period_Pri));
        pFIBStoredProcSave.Params[18].AsInteger := Mode_25_07_2016;
        FormWait.Show;
        Application.ProcessMessages;
        pFIBStoredProcSave.ExecProc;
        FormWait.Hide;
     except
       ShowMessage('Ошибка сохранения отпускного')
     end;
     pFIBStoredProcSave.Close;
     if IStarted then
        begin
             FIB.pFIBTransactionSal.Commit;
             IStarted:=false;
        end
                 else
        FIB.pFIBTransactionSal.CommitRetaining;
*)
     Close;


end;

procedure   TFormUpdOtp.ShowSummyMean;
 const F='######0.00';
 var   S : String;
begin
      if MeanDay_Bud>0 then
         StringGridMean.Cells[3,1]:=FloatToStr(MeanDay_Bud);
      if MeanDay_Vne>0 then
         StringGridMean.Cells[3,2]:=FloatToStr(MeanDay_Vne);
      if MeanDay_GN>0 then
         StringGridMean.Cells[3,3]:=FloatToStr(MeanDay_GN);
      if MeanDay_NIS>0 then
         StringGridMean.Cells[3,4]:=FloatToStr(MeanDay_NIS);
      GetSummy;
      if Summa_Bud>0 then
         begin
              S:=FormatFloat(F,Summa_Bud);
              StringGridMean.Cells[1,1]:=S;
              StringGridMean.Cells[2,1]:=IntToStr(NmbOfDays);
         end;
      if Summa_Vne>0 then
         begin
              S:=FormatFloat(F,Summa_Vne);
              StringGridMean.Cells[1,2]:=S;
              StringGridMean.Cells[2,2]:=IntToStr(NmbOfDays);
         end;
      if Summa_GN>0 then
         begin
              S:=FormatFloat(F,Summa_Gn);
              StringGridMean.Cells[1,3]:=S;
              StringGridMean.Cells[2,3]:=IntToStr(NmbOfDays);
         end;
      if Summa_NIS>0 then
         begin
             S:=FormatFloat(F,Summa_NIS);
             StringGridMean.Cells[1,4]:=S;
             StringGridMean.Cells[2,4]:=IntToStr(NmbOfDays);
         end;


end;

procedure TFormUpdOtp.GetSummy;
var
    YFR,MFR,DFR,YTO,MTO,DTO:word;
    DF,DT:String;
    SQLSTmnt:string;
    v:variant;
begin
     SUMMA_BUD    := 0;
     SUMMA_VNE    := 0;
     SUMMA_GN     := 0;
     SUMMA_NIS    := 0;
     NMBOFDAYS    := 0;
  {   FIB.pFIBQuery.SQL.Add('SELECT SUM(SUMMA_BUD*KOEF),SUM(SUMMA_VNE*KOEF),SUM(SUMMA_GN*KOEF),SUM(SUMMA_NIS*KOEF),SUM(DAYS) FROM TMP_BOLN_SUMMY WHERE CONNID=CURRENT_CONNECTION AND (SEL>0 AND SUMMA_BUD+SUMMA_VNE+SUMMA_GN+SUMMA_NIS>0)');}
     if isLNR then
        SQLStmnt:= 'SELECT SUM(SUMMA_BUD),SUM(SUMMA_VNE),SUM(SUMMA_GN),SUM(SUMMA_NIS),SUM(DAY_KALEND_WORK) FROM TMP_OTP_SUMMY WHERE CONNID=CURRENT_CONNECTION AND (SEL>0 AND SUMMA_BUD+SUMMA_VNE+SUMMA_GN+SUMMA_NIS>0)'
     else
        SQLStmnt:= 'SELECT SUM(SUMMA_BUD),SUM(SUMMA_VNE),SUM(SUMMA_GN),SUM(SUMMA_NIS),SUM(DAY_KALEND) FROM TMP_OTP_SUMMY WHERE CONNID=CURRENT_CONNECTION AND (SEL>0 AND SUMMA_BUD+SUMMA_VNE+SUMMA_GN+SUMMA_NIS>0)';
     v:=SQLQueryRecValues(SQLStmnt);
     if VarIsNull(v) then Exit;
     if not VarIsArray(v) then Exit;
     if VarIsNull(v[0]) then exit;
     if not VarIsNumeric(v[0]) then exit;
     if VarIsNull(v[1]) then exit;
     if not VarIsNumeric(v[1]) then exit;
     if VarIsNull(v[2]) then exit;
     if not VarIsNumeric(v[2]) then exit;
     if VarIsNull(v[3]) then exit;
     if not VarIsNumeric(v[3]) then exit;
     if VarIsNull(v[4]) then exit;
     if not VarIsNumeric(v[4]) then exit;
     SUMMA_BUD    := v[0];
     SUMMA_VNE    := v[1];
     SUMMA_GN     := v[2];
     SUMMA_NIS    := v[3];
     NMBOFDAYS    := v[4];

end;

procedure TFormUpdOtp.FormShow(Sender: TObject);
begin
      ShowSummyMean;
      CalcSummyFot;
{      dxDBGridSummy.Columns[1].Width:=0}
end;

procedure TFormUpdOtp.dxDBGridSummyChangedColumnsWidth(Sender: TObject);
begin
      SynchronizeStringGrid;
end;

procedure TFormUpdOtp.SynchronizeStringGrid;
 var i:integer;
 begin
      StringGridFot.Width := dxDBGridSummy.Width;
      StringGridFot.Left  := dxDBGridSummy.Left;
      StringGridFot.ColWidths[0]:=dxDBGridSummySel.Width      +
                                  dxDBGridSummyMonth_Za.Width +
                                  dxDBGridSummyYear_Za.Width;
      StringGridFot.ColWidths[1]:=dxDBGridSummySumma_Bud.Width;
      StringGridFot.ColWidths[2]:=dxDBGridSummySumma_Vne.Width;
      StringGridFot.ColWidths[3]:=dxDBGridSummySumma_Gn.Width;
      StringGridFot.ColWidths[4]:=dxDBGridSummySumma_Nis.Width;
      StringGridFot.ColWidths[5]:=dxDBGridSummyOklad_M.Width  +
                                  dxDBGridSummyDay_Work.Width +
                                  dxDBGridSummyKoef.Width;
      StringGridFot.ColWidths[6]:=dxDBGridSummyDay_Kalend.Width;
//      StringGridFot.ColWidths[7]:=dxDBGridSummy.Columns[11].Width;
 end;

procedure TFormUpdOtp.CalcSummyFot;
 var i:integer;
     SummaBud , SummaVne , SummaGn , SummaNis  : real;
     SummaBudK, SummaVneK, SummaGnK, SummaNisK : real;
     MeanBudK , MeanVneK , MeanGnK , MeanNisK  : real;
     SummaDay  : integer;
     SummaDayKalendWork:integer;
     Koef      : real;
     SavePlace: TBookmark;
     nmbOfFullKalendMonth:Integer;
     kalendDay,kalendWorkDay:Integer;
     dnkm,r:Real;
   function GetF(A:real;R:integer):string;
     var S:String;
     begin
           if abs(a)<0.005 then S:=''
                           else
              S:=FloatToStrF(A,ffFixed,8,R);
           if length(S)<10 then S:=space(10-length(S))+S;
           GetF:=S;
     end;

 begin
      SavePlace:=pFIBDataSetSummy.GetBookMark;
      SummaBud  := 0;
      SummaVne  := 0;
      SummaGn   := 0;
      SummaNis  := 0;
      SummaBudK := 0;
      SummaVneK := 0;
      SummaGnK  := 0;
      SummaNisK := 0;
      MeanBudK  := 0;
      MeanBudK  := 0;
      MeanVneK  := 0;
      MeanGnK   := 0;
      MeanNisK  := 0;
      dnkm      := 0;
      nmbOfFullKalendMonth:=0;
      pFIBDataSetSummy.First;
      while not pFIBDataSetSummy.Eof do
            begin
                  if pFIBDataSetSummy.FieldByName('SEL').AsInteger=1 then
                     begin
                          SummaBud  := SummaBud  + pFIBDataSetSummy.FieldByName('Summa_Bud').AsFloat;
                          SummaVne  := SummaVne  + pFIBDataSetSummy.FieldByName('Summa_Vne').AsFloat;
                          SummaGn   := SummaGn   + pFIBDataSetSummy.FieldByName('Summa_Gn').AsFloat;
                          SummaNis  := SummaNis  + pFIBDataSetSummy.FieldByName('Summa_Nis').AsFloat;
                          kalendDay :=  pFIBDataSetSummy.FieldByName('DAY_KALEND').AsInteger;
                          kalendWorkDay :=  pFIBDataSetSummy.FieldByName('DAY_KALEND_WORK').AsInteger;
                          if  kalendDay>0 then
                          if  kalendDay=kalendWorkDay then
                              Inc(nmbOfFullKalendMonth)
                          else
                              begin
                                   dnkm:=dnkm + 29.4/kalendDay*kalendWorkDay;
                              end;
                          if isLNR then
                             SummaDay  := SummaDay  + kalendWorkDay
                          else
                             SummaDay  := SummaDay  + kalendDay;
                          Koef      := pFIBDataSetSummy.FieldByName('Koef').AsFloat;
                          SummaBudK := SummaBudK + pFIBDataSetSummy.FieldByName('Summa_Bud').AsFloat * Koef;
                          SummaVneK := SummaVneK + pFIBDataSetSummy.FieldByName('Summa_Vne').AsFloat * Koef;
                          SummaGnK  := SummaGnK  + pFIBDataSetSummy.FieldByName('Summa_Gn').AsFloat  * Koef;
                          SummaNisK := SummaNisK + pFIBDataSetSummy.FieldByName('Summa_Nis').AsFloat * Koef;
                     end;
                pFIBDataSetSummy.Next;
            end;
      pFIBDataSetSummy.GotoBookmark(SavePlace);
      pFIBDataSetSummy.FreeBookmark(SavePlace);
      if SummaDay>0 then
         begin
              if ((rgMode_25_07_2016.ItemIndex=1) and (isLNR)) then
                 begin
                       r:=29.4*nmbOfFullKalendMonth + dnkm;
                      if r>0.01 then
                        begin
                             if SummaBudK>0.1 then MeanBudK := SummaBudK / r ;
                             if SummaVneK>0.1 then MeanVneK := SummaVneK / r ;
                             if SummaVneK>0.1 then MeanVneK := SummaVneK / r ;
                             if SummaGnK>0.1  then MeanGnK  := SummaGnK  / r ;
                             if SummaNisK>0.1 then MeanNisK := SummaNisK / r ;
                        end;
                 end
              else
                 begin
                      if SummaBudK>0.1 then MeanBudK := SummaBudK / SummaDay ;
                      if SummaVneK>0.1 then MeanVneK := SummaVneK / SummaDay ;
                      if SummaVneK>0.1 then MeanVneK := SummaVneK / SummaDay ;
                      if SummaGnK>0.1  then MeanGnK  := SummaGnK  / SummaDay ;
                      if SummaNisK>0.1 then MeanNisK := SummaNisK / SummaDay ;
                 end;
         end;

      StringGridFot.Cells[1,0]:=GetF(SummaBud,2);
      StringGridFot.Cells[2,0]:=GetF(SummaVne,2);
      StringGridFot.Cells[3,0]:=GetF(SummaGn,2);
      StringGridFot.Cells[4,0]:=GetF(SummaNis,2);
      StringGridFot.Cells[6,0]:=IntToStr(SummaDay);
      StringGridFot.Cells[1,1]:=GetF(SummaBudK,2);
      StringGridFot.Cells[2,1]:=GetF(SummaVneK,2);
      StringGridFot.Cells[3,1]:=GetF(SummaGnK,2);
      StringGridFot.Cells[4,1]:=GetF(SummaNisK,2);
      StringGridFot.Cells[1,2]:=GetF(MeanBudK,4);
      StringGridFot.Cells[2,2]:=GetF(MeanVneK,4);
      StringGridFot.Cells[3,2]:=GetF(MeanGnK,4);
      StringGridFot.Cells[4,2]:=GetF(MeanNisK,4);



      StringGridIRas.Cells[1,1]:=GetF(SummaBud,2);
      StringGridIRas.Cells[2,1]:=GetF(SummaVne,2);
      StringGridIRas.Cells[3,1]:=GetF(SummaGn,2);
      StringGridIRas.Cells[4,1]:=GetF(SummaNis,2);
      StringGridIRas.Cells[5,1]:=IntToStr(SummaDay);
      StringGridIRas.Cells[1,2]:=GetF(SummaBudK,2);
      StringGridIRas.Cells[2,2]:=GetF(SummaVneK,2);
      StringGridIRas.Cells[3,2]:=GetF(SummaGnK,2);
      StringGridIRas.Cells[4,2]:=GetF(SummaNisK,2);
      StringGridIRas.Cells[1,3]:=GetF(MeanBudK,4);
      StringGridIRas.Cells[2,3]:=GetF(MeanVneK,4);
      StringGridIRas.Cells[3,3]:=GetF(MeanGnK,4);
      StringGridIRas.Cells[4,3]:=GetF(MeanNisK,4);
 end;


procedure TFormUpdOtp.StringGridFotDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var i:integer;
    vRow,vCol:integer;
    S:String;
    Shift:integer;
begin
      i:=1;
      vRow:=aRow;
      vCol:=aCol;
      S:=StringGridFot.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                Brush.Color := FixedColor;
                Font.Color := clBlack;
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vCol<>0) then
                    begin
                         SetTextAlign(Handle, TA_RIGHT);
                         Shift:=5;
                         TextOut(Rect.Right-Shift, Rect.Top+2, S);
                    end
                         else
                    begin
                         SetTextAlign(Handle, TA_LEFT);
                         TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;
           end;
end;

procedure TFormUpdOtp.dxDBGridSummySELChange(Sender: TObject);
 var I,J:integer;
begin
{     pFIBDataSetSummy.Prior;
     pFIBDataSetSummy.Next;
}
     pFIBDataSetSummy.Edit;
//     val(dxDBGridSummySEL.ValueChecked,i,j);
//     if ((dxDBGridSummySEL.Value) and (i=1)) then pFIBDataSetSummySEL.Value:=1
//                          else pFIBDataSetSummySEL.Value:=0;
      if pFIBDataSetSummySEL.Value=0 then
         pFIBDataSetSummySEL.Value:=1
      else
         pFIBDataSetSummySEL.Value:=0;
     pFIBDataSetSummy.Post;
//     pFIBDataSetSummy.UpdateTransaction.CommitRetaining;
     CalcSummyFot;
end;

procedure TFormUpdOtp.dxDBGridSummyMCChange(Sender: TObject);
begin
     pFIBDataSetSummy.Edit;
      if pFIBDataSetSummyManual_Calc.Value=0 then
         pFIBDataSetSummyManual_Calc.Value:=1
      else
         pFIBDataSetSummyManual_Calc.Value:=0;
     pFIBDataSetSummy.Post;
//     pFIBDataSetSummy.UpdateTransaction.CommitRetaining;
 //    CalcSummyFot;
end;

procedure TFormUpdOtp.ComboBoxModeChange(Sender: TObject);
begin
     Mode:=0;
     if ComboBoxMode.ItemIndex=1 then
        Mode:=1
     else if ComboBoxMode.ItemIndex=2 then
        Mode:=2;
     SetUpModeShow;
end;

procedure TFormUpdOtp.SetUpModeShow;
  begin
      if ComboBoxMode.ItemIndex=1 then
         begin
              DateTimePickerFr.Hide;
              DateTimePickerTo.Hide;
              ComboBoxModeDC.Hide;
              ComboBoxModeDC.Enabled:=false;
              ModeDC:=0;
              dxCalcEditODay.Show;
              LabelODCap.Show;
         end
      else
         begin
              DateTimePickerFr.Show;
              DateTimePickerTo.Show;
              ComboBoxModeDC.Show;
              ComboBoxModeDC.Enabled:=true;
              dxCalcEditODay.Hide;
              LabelODCap.Hide;
         end;
      Application.ProcessMessages;
  end;


procedure TFormUpdOtp.dxCalcEditODayChange(Sender: TObject);
var I,J : Integer;
    S : String;
begin

     S:=Trim(dxCalcEditODay.Text);
     val(S,J,I);
     if i=0 then
        begin
              O_Day:=J;
        end;
end;


procedure TFormUpdOtp.ComboBoxModeDCChange(Sender: TObject);
begin
     ModeDC:=0;
     if ComboBoxModeDC.ItemIndex=1 then
        ModeDC:=1;
     if ModeDc=0 then
        begin
             dxDBGridSummyDAY_KALEND.Caption:='К.дн.';
             dxDBGridSummyDAY_WORK.Caption:='Р.дн.';
             StringGridMean.Cells[2,0]:='Дней';
             StringGridMean.Cells[3,0]:='Ср.дн.';
             StringGridFot.Cells[0,2]:='Среднедневные';
             StringGridIRas.Cells[5,0] := '  Дней   ';
             StringGridIRas.Cells[0,3] := 'Среднедневные';
        end
     else
        begin
             dxDBGridSummyDAY_KALEND.Caption:='К.час.';
             dxDBGridSummyDAY_WORK.Caption:='Р.час.';
             StringGridMean.Cells[2,0]:='Часов';
             StringGridMean.Cells[3,0]:='Ср.час.';
             StringGridFot.Cells[0,2]:='Среднечасовые';
             StringGridIRas.Cells[5,0] := '  Часов  ';
             StringGridIRas.Cells[0,3] := 'Среднечасовые';
        end;
     Application.ProcessMessages;
end;

procedure TFormUpdOtp.N1Click(Sender: TObject);
begin
     if ((WorkYear<>CurrYear) OR (WorkMonth<>Nmes)) THEN
        begin
              ShowMessage('Режим работает только в текущем месяце.');
              Exit;
        end;

     if (WantedTabno>0) and (WantedPodr>0) then
     if YesNo('Подготовить данные за '+GetMonthRus(NMES)+' '+IntToStr(CurrYear)) then
        putPersonToSqlForCurrMonth(WantedTabno,WantedPodr);

end;

procedure TFormUpdOtp.comboboxKindsOtpChange(Sender: TObject);
begin
      KindOfOtp:=ComboBoxKindsOtp.ItemIndex;
end;

procedure TFormUpdOtp.dxDBGridPereRasNEED_PERE_BUDChange(Sender: TObject);
begin
     pFIBDataSetPereRes.Edit;
     if pFIBDataSetPereResNEED_PERE_BUD.Value=0 then
        pFIBDataSetPereResNEED_PERE_BUD.Value:=1
     else pFIBDataSetPereResNEED_PERE_BUD.Value:=0;
     pFIBDataSetPereRes.Post;
   //  dxDBGridPereRas.Refresh;
   //  ShowMessage(IntToStr(pFIBDataSetPereResNEED_PERE_BUD.Value));
end;

procedure TFormUpdOtp.dxDBGridPereRasNEED_PERE_NISChange(Sender: TObject);
begin
     pFIBDataSetPereRes.Edit;
     if pFIBDataSetPereResNEED_PERE_NIS.Value=0 then
        pFIBDataSetPereResNEED_PERE_NIS.Value:=1
     else pFIBDataSetPereResNEED_PERE_NIS.Value:=0;
     pFIBDataSetPereRes.Post;

end;

procedure TFormUpdOtp.dxDBGridPereRasNEED_PERE_GNChange(Sender: TObject);
begin
     pFIBDataSetPereRes.Edit;
     if pFIBDataSetPereResNEED_PERE_GN.Value=0 then
        pFIBDataSetPereResNEED_PERE_GN.Value:=1
     else pFIBDataSetPereResNEED_PERE_GN.Value:=0;
     pFIBDataSetPereRes.Post;

end;

procedure TFormUpdOtp.dxDBGridPereRasNEED_PERE_VNEChange(Sender: TObject);
begin
     pFIBDataSetPereRes.Edit;
     if pFIBDataSetPereResNEED_PERE_VNE.Value=0 then
        pFIBDataSetPereResNEED_PERE_VNE.Value:=1
     else pFIBDataSetPereResNEED_PERE_VNE.Value:=0;
     pFIBDataSetPereRes.Post;

end;

procedure TFormUpdOtp.TabSheet4Enter(Sender: TObject);
 var isBud,isVne,isGN,isNIS:Boolean;
begin
     isBud := False;
     isVne := False;
     isGN  := false;
     isNIS := false;
     pFIBDataSetPereRes.First;
     while not pFIBDataSetPereRes.Eof do
       begin
            if abs(pFIBDataSetPereResSUMMA_O_BUD.Value)>0.01 then
               IsBud:=True;
            if abs(pFIBDataSetPereResSUMMA_O_VNE.Value)>0.01 then
               IsVne:=True;
            if abs(pFIBDataSetPereResSUMMA_O_GN.Value)>0.01 then
               IsGn:=True;
            if abs(pFIBDataSetPereResSUMMA_O_NIS.Value)>0.01 then
               IsNis:=True;
            pFIBDataSetPereRes.Next;
       end;
     if not isBud then
        begin
             dxDBGridPereRasNEED_PERE_BUD.Visible:=False;
             dxDBGridPereRasData_PERE_BUD.Visible:=False;
             dxDBGridPereRasSumma_BUD.Visible:=false;
        end
     else
        begin
             dxDBGridPereRasNEED_PERE_BUD.Visible:=true;
             dxDBGridPereRasData_PERE_BUD.Visible:=true;
             dxDBGridPereRasSumma_BUD.Visible:=true;
        end;
     if not isVne then
        begin
             dxDBGridPereRasNEED_PERE_Vne.Visible:=False;
             dxDBGridPereRasData_PERE_Vne.Visible:=False;
             dxDBGridPereRasSumma_Vne.Visible:=false;
        end
     else
        begin
             dxDBGridPereRasNEED_PERE_Vne.Visible:=true;
             dxDBGridPereRasData_PERE_Vne.Visible:=true;
             dxDBGridPereRasSumma_Vne.Visible:=true;
        end;
     if not isGN then
        begin
             dxDBGridPereRasNEED_PERE_GN.Visible:=False;
             dxDBGridPereRasData_PERE_GN.Visible:=False;
             dxDBGridPereRasSumma_GN.Visible:=false;
        end
     else
        begin
             dxDBGridPereRasNEED_PERE_GN.Visible:=true;
             dxDBGridPereRasData_PERE_GN.Visible:=true;
             dxDBGridPereRasSumma_GN.Visible:=true;
        end;
     if not isNIS then
        begin
             dxDBGridPereRasNEED_PERE_NIS.Visible:=False;
             dxDBGridPereRasData_PERE_NIS.Visible:=False;
             dxDBGridPereRasSumma_NIS.Visible:=false;
        end
     else
        begin
             dxDBGridPereRasNEED_PERE_NIS.Visible:=true;
             dxDBGridPereRasData_PERE_NIS.Visible:=true;
             dxDBGridPereRasSumma_NIS.Visible:=true;

        end

end;

procedure TFormUpdOtp.PageControl1Change(Sender: TObject);
 var isBud,isVne,isGN,isNIS:Boolean;
begin
     if PageControl1.TabIndex=3 then
        begin
            isBud := False;
            isVne := False;
            isGN  := false;
            isNIS := false;
            pFIBDataSetPereRes.First;
            while not pFIBDataSetPereRes.Eof do
                  begin
                      if abs(pFIBDataSetPereResSUMMA_O_BUD.Value)>0.01 then
                         IsBud:=True;
                      if abs(pFIBDataSetPereResSUMMA_O_VNE.Value)>0.01 then
                         IsVne:=True;
                      if abs(pFIBDataSetPereResSUMMA_O_GN.Value)>0.01 then
                         IsGn:=True;
                      if abs(pFIBDataSetPereResSUMMA_O_NIS.Value)>0.01 then
                         IsNis:=True;
                      pFIBDataSetPereRes.Next;
                  end;
            if not isBud then
              begin
                   dxDBGridPereRasNEED_PERE_BUD.Visible:=False;
                   dxDBGridPereRasData_PERE_BUD.Visible:=False;
                   dxDBGridPereRasSumma_Bud.Visible:=False;
              end
            else
              begin
                   dxDBGridPereRasNEED_PERE_BUD.Visible:=true;
                   dxDBGridPereRasData_PERE_BUD.Visible:=true;
                   dxDBGridPereRasSumma_Bud.Visible:=True;
              end;
            if not isVne then
               begin
                    dxDBGridPereRasNEED_PERE_Vne.Visible:=False;
                    dxDBGridPereRasData_PERE_Vne.Visible:=False;
                    dxDBGridPereRasSumma_Vne.Visible:=false;
               end
            else
               begin
                    dxDBGridPereRasNEED_PERE_Vne.Visible:=true;
                    dxDBGridPereRasData_PERE_Vne.Visible:=true;
                    dxDBGridPereRasSumma_Vne.Visible:=True;
               end;
            if not isGN then
               begin
                    dxDBGridPereRasNEED_PERE_GN.Visible:=False;
                    dxDBGridPereRasData_PERE_GN.Visible:=False;
                    dxDBGridPereRasSumma_GN.Visible:=false;
               end
            else
               begin
                    dxDBGridPereRasNEED_PERE_GN.Visible:=true;
                    dxDBGridPereRasData_PERE_GN.Visible:=true;
                    dxDBGridPereRasSumma_GN.Visible:=true;
               end;
            if not isNIS then
               begin
                    dxDBGridPereRasNEED_PERE_NIS.Visible:=False;
                    dxDBGridPereRasData_PERE_NIS.Visible:=False;
                    dxDBGridPereRasSumma_NIS.Visible:=false;
               end
            else
               begin
                    dxDBGridPereRasNEED_PERE_NIS.Visible:=true;
                    dxDBGridPereRasData_PERE_NIS.Visible:=true;
                    dxDBGridPereRasSumma_NIS.Visible:=true;
               end
        end;
end;

procedure TFormUpdOtp.N2Click(Sender: TObject);
 var iStarted:Boolean;
     ks:Integer;
begin
          IStarted:=false;
          if not FIB.pFIBQuery.Transaction.Active then
             begin
                  IStarted:=true;
                  FIB.pFIBQuery.Transaction.StartTransaction;
             end;

          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('select first 1 retval from pr_markmoall');
          try
             FIB.pFIBQuery.ExecQuery;
          except
              Ks:=1;
          end;
          FIB.pFIBQuery.Close;
          if IStarted then
             begin
                  IStarted:=false;
                  FIB.pFIBQuery.Transaction.Commit;
             end;
          FormWaitMess.SetMessage('Отметки установлены');
          FormWaitMess.Show;
          repeat
                Application.ProcessMessages;
          until FormWaitMess.Timer1.Enabled=false;
          FormWaitMess.Hide;
          pFIBDataSetPereRes.Close;
          pFIBDataSetPereRes.Open;

          dxDBGridPereRas.Refresh;
end;

procedure TFormUpdOtp.ResetDates(code:integer);
 var iStarted:Boolean;
     ks:Integer;
begin
          IStarted:=false;
          if not FIB.pFIBQuery.Transaction.Active then
             begin
                  IStarted:=true;
                  FIB.pFIBQuery.Transaction.StartTransaction;
             end;

          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('select first 1 retval from PR_RESETDOTPMOV('+intToStr(Code)+')');
          try
             FIB.pFIBQuery.ExecQuery;
          except
              Ks:=1;
          end;
          FIB.pFIBQuery.Close;
          if IStarted then
             begin
                  IStarted:=false;
                  FIB.pFIBQuery.Transaction.Commit;
             end;
          FormWaitMess.SetMessage('Даты сброшены');
          FormWaitMess.Show;
          repeat
                Application.ProcessMessages;
          until FormWaitMess.Timer1.Enabled=false;
          FormWaitMess.Hide;
          pFIBDataSetPereRes.Close;
          pFIBDataSetPereRes.Open;

          dxDBGridPereRas.Refresh;
end;


procedure TFormUpdOtp.N4Click(Sender: TObject);
begin
     ResetDates(1);
end;

procedure TFormUpdOtp.N5Click(Sender: TObject);
begin
     ResetDates(0);
end;

procedure TFormUpdOtp.N7Click(Sender: TObject);
 var SQLStmnt:string;
begin
     SQLStmnt:='execute procedure PR_MARK_ADD_FOR_OTP(1)';
     FormWait.Show;
     Application.ProcessMessages;
     SQLExecute(SQLStmnt);
     FormWait.Hide;
     Application.ProcessMessages;
end;

procedure TFormUpdOtp.N8Click(Sender: TObject);
 var SQLStmnt:string;
begin
     SQLStmnt:='execute procedure PR_MARK_ADD_FOR_OTP(2)';
     FormWait.Show;
     Application.ProcessMessages;
     SQLExecute(SQLStmnt);
     FormWait.Hide;
     Application.ProcessMessages;

end;

procedure TFormUpdOtp.N10Click(Sender: TObject);
 var SQLStmnt:string;
begin
     SQLStmnt:='execute procedure PR_MARK_ADD_FOR_OTP(1)';
     FormWait.Show;
     Application.ProcessMessages;
     SQLExecute(SQLStmnt);
     FormWait.Hide;
     Application.ProcessMessages;
end;

procedure TFormUpdOtp.N11Click(Sender: TObject);
 var SQLStmnt:string;
begin
     SQLStmnt:='execute procedure PR_MARK_ADD_FOR_OTP(2)';
     FormWait.Show;
     Application.ProcessMessages;
     SQLExecute(SQLStmnt);
     FormWait.Hide;
     Application.ProcessMessages;

end;

procedure TFormUpdOtp.ComboBoxModeWRChange(Sender: TObject);
begin
     modeWR:=ComboBoxModeWr.ItemIndex;

end;

end.
