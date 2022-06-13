unit UFormUpdKmnd;

interface                 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, FIBDataSet, pFIBDataSet, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, ComCtrls, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, FIBQuery, pFIBQuery, pFIBStoredProc, ExtCtrls, Grids,
  FIBDatabase, pFIBDatabase, Menus, frxClass, frxDBSet, frxExportRTF,
  frxExportXLS, frxExportPDF,ScrDef;

type
  TFormUpdKmnd = class(TForm)
    LabelFIO: TLabel;
    BitBtn1: TBitBtn;
    DateTimePickerFr: TDateTimePicker;
    DateTimePickerTo: TDateTimePicker;
    LabelBDay: TLabel;
    BitBtn2: TBitBtn;
    DataSourceSummy: TDataSource;
    pFIBDataSetSummy: TpFIBDataSet;
    pFIBDataSetSummyCONNID: TFIBIntegerField;
    pFIBDataSetSummySEL: TFIBSmallIntField;
    pFIBDataSetSummyMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetSummyYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetSummySUMMA_BUD: TFIBBCDField;
    pFIBDataSetSummySUMMA_VNE: TFIBBCDField;
    pFIBDataSetSummySUMMA_GN: TFIBBCDField;
    pFIBDataSetSummySUMMA_NIS: TFIBBCDField;
    pFIBDataSetSummyOKLAD_M: TFIBBCDField;
    pFIBDataSetSummyDAYS: TFIBSmallIntField;
    pFIBDataSetSummyGRAPHIC_DAY: TFIBSmallIntField;
    pFIBDataSetSummyKOEF: TFIBBCDField;
    dxDBGridSum: TdxDBGrid;
    dxDBGridSumCONNID: TdxDBGridMaskColumn;
    dxDBGridSumGRAPHIC_DAY: TdxDBGridMaskColumn;
    dxDBGridSumSEL: TdxDBGridCheckColumn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pFIBDataSetRes: TpFIBDataSet;
    dxDBGridRes: TdxDBGrid;
    DataSourceRes: TDataSource;
    pFIBDataSetResYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetResMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetResSHIFRSTA: TFIBSmallIntField;
    pFIBDataSetResKMD_DAY: TFIBSmallIntField;
    pFIBDataSetResSUMMA_K_BUD: TFIBBCDField;
    pFIBDataSetResSUMMA_B_VNE: TFIBBCDField;
    pFIBDataSetResSUMMA_K_GN: TFIBBCDField;
    pFIBDataSetResSUMMA_K_NIS: TFIBBCDField;
    dxDBGridResYEAR_ZA: TdxDBGridCalcColumn;
    dxDBGridResMONTH_ZA: TdxDBGridCalcColumn;
    dxDBGridResSHIFRSTA: TdxDBGridCalcColumn;
    dxDBGridResB_DAY: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_K_BUD: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_K_VNE: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_K_GN: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_K_NIS: TdxDBGridCalcColumn;
    BitBtn4: TBitBtn;
    dxDBGridSumKOEF: TdxDBGridCalcColumn;
    dxDBGridSumDAYS: TdxDBGridCalcColumn;
    dxDBGridSumSUMMA_BUD: TdxDBGridCalcColumn;
    dxDBGridSumSUMMA_VNE: TdxDBGridCalcColumn;
    dxDBGridSumSUMMA_GN: TdxDBGridCalcColumn;
    dxDBGridSumSUMMA_NIS: TdxDBGridCalcColumn;
    dxDBGridSumOKLAD_M: TdxDBGridCalcColumn;
    dxDBGridSumYEAR_ZA: TdxDBGridCalcColumn;
    dxDBGridSumMONTH_ZA: TdxDBGridCalcColumn;
    pFIBDataSetResSHIFRIDTMP: TFIBSmallIntField;
    dxDBGridResColumn9: TdxDBGridColumn;
    dxDBGridSumColumnButton: TdxDBGridButtonColumn;
    Save: TBitBtn;
    RadioGroupModeZaVy: TRadioGroup;
    TabSheet3: TTabSheet;
    StringGridMean: TStringGrid;
    BitBtnDelNotSel: TBitBtn;
    pFIBDataSetSel: TpFIBDataSet;
    pFIBDataSetSelMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetSelYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetSummySHIFRIDTMP: TFIBSmallIntField;
    pFIBDataSetSummyMANUAL_CALC: TFIBSmallIntField;
    dxDBGridSumManual_calc: TdxDBGridCheckColumn;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBTransactionRead: TpFIBTransaction;
    BitBtn5: TBitBtn;
    RadioGroupModeDC: TRadioGroup;
    ComboBoxBuh: TComboBox;
    pFIBDataSetSummyDAY_KALEND_WORK: TFIBSmallIntField;
    dxDBGridSumDayKalend: TdxDBGridColumn;
    LabelWR: TLabel;
    cbWR: TComboBox;
    pFIBDataSetSummysumma: TFloatField;
    pFIBDataSetSummySummaSel: TFloatField;
    pFIBDataSetSummySummaSelUw: TFloatField;
    TabSheetRas: TTabSheet;
    dxDBGridRas: TdxDBGrid;
    dxDBGridRasCONNID: TdxDBGridMaskColumn;
    dxDBGridRasMONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridRasYEAR_ZA: TdxDBGridMaskColumn;
    dxDBGridRasSUMMA_BUD: TdxDBGridCurrencyColumn;
    dxDBGridRasSUMMA_VNE: TdxDBGridCurrencyColumn;
    dxDBGridRasSUMMA_GN: TdxDBGridCurrencyColumn;
    dxDBGridRasSUMMA_NIS: TdxDBGridCurrencyColumn;
    dxDBGridRasOKLAD_M: TdxDBGridCurrencyColumn;
    dxDBGridRasDAYS: TdxDBGridMaskColumn;
    dxDBGridRasGRAPHIC_DAY: TdxDBGridMaskColumn;
    dxDBGridRasKOEF: TdxDBGridCurrencyColumn;
    dxDBGridRasSHIFRIDTMP: TdxDBGridMaskColumn;
    dxDBGridRasDAY_KALEND_WORK: TdxDBGridMaskColumn;
    dxDBGridRasSumma: TdxDBGridColumn;
    dxDBGridRasSummaSel: TdxDBGridColumn;
    dxDBGridRasSummaSelUw: TdxDBGridColumn;
    dxDBGridRasSEL: TdxDBGridCheckColumn;
    dxDBGridRasMANUAL_CALC: TdxDBGridCheckColumn;
    LabelCalc: TLabel;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    cbRas: TComboBox;
    Label1: TLabel;
    cbShifrSta: TComboBox;
    cbShifrTabel: TComboBox;
    LabelTabel: TLabel;
    BitSinglPerson: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    function Execute: boolean;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure dxDBGridResCustomDrawFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dxDBGridResBeforeCalcSummary(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxDBGridSumColumnButtonButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure SaveClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtnDelNotSelClick(Sender: TObject);
    procedure dxDBGridSumManual_calcChange(Sender: TObject);
    procedure dxDBGridSumSELChange(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RadioGroupModeDCClick(Sender: TObject);
    procedure dxDBGridResB_DAYChange(Sender: TObject);
    procedure ComboBoxBuhChange(Sender: TObject);
    procedure pFIBDataSetSummyCalcFields(DataSet: TDataSet);
    procedure TabSheetRasShow(Sender: TObject);
    procedure dxDBGridRasSummaSelUwSummary(Sender: TObject;
      DataSet: TDataSet; var Value: Extended);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure N1Click(Sender: TObject);
    procedure cbRasChange(Sender: TObject);
    procedure cbShifrStaChange(Sender: TObject);
    procedure cbShifrTabelChange(Sender: TObject);
    procedure BitSinglPersonClick(Sender: TObject);
    procedure cbWRChange(Sender: TObject);

  private
    { Private declarations }
    modeSumma          : Integer; // 1-бюджет 2 вне 3 ГН 4 НИС
    NMBOFDAYS          : integer;
    SUMMA_BUD,
    SUMMA_VNE,
    SUMMA_GN,
    SUMMA_NIS          : REAl;
    function ComplitKomand:boolean;
    procedure GetSummy;
    procedure ShowSummyMean;
    procedure FillTmpTables(ShifrIdKmnd:integer);
    function  GetPassCountKomandForTabno(ShifrIdKmnd:integer):integer;
    function  getCaptionSumma:string;
    procedure getSummaDayTot(var summaSelUwTot : Real; var wDaysTot:Real);
    procedure showCbShifrTabel;
    procedure hideCbShifrTabel;
    procedure showBitSinglPerson;
    procedure hideBitSinglPerson;

  public
    ShifrIdKmnd        : integer;
    WantedTabno        : integer;
    Fio                : String;
    ActionClar         : integer;
    shifrkat           : integer;
    shifrgru           : integer;
    WantedProc         : real;
    WantedShifrSta     : integer;
    wantedCurrperson   : Person_Ptr;
    MEANDAY            : real;
    MEANDAY_BUD        : real;
    MEANDAY_VNE        : real;
    MEANDAY_GN         : real;
    MEANDAY_NIS        : real;
    Kmnd_Day           : integer;
    MODE_V_Z           : integer;
    MODEDC             : integer;
    WantedMode         : integer;
    WantedPodr         : integer;
    WorkYear,WorkMonth : integer; { Просматриваемые год и месяц }
    ModeRecalcClock    : integer; { Режим перерасчета почасового больничного}
    WantedCodeIll      : integer;
    ShifrBuh           : Integer;
    MODEWR             : Integer;
    GUID               : string;
    mode_six_five_day  : Integer;
    wantedShifrTabel   : Integer;

    { Public declarations }
  end;

var
  FormUpdKmnd : TFormUpdKmnd;

implementation
 uses uFrmFindKadryFB,UFibModule,UFormWait,
      DateUtils,FIB,ScrUtil,ScrExport, UFormWaitMess,
      ScrLists,UFormKomandA,Math,USQLUnit;

{$R *.dfm}

procedure TFormUpdKmnd.FormClose(Sender: TObject; var Action: TCloseAction);
begin

       if pFIBDataSetSummy.Active then
          pFIBDataSetSummy.Active:=false;
       if pFIBDataSetRes.Active then
          pFIBDataSetRes.Active:=false;
       if pFIBDataSetSummy.Transaction.Active then
          pFIBDataSetSummy.Transaction.Commit;
       if pFIBDataSetRes.Transaction.Active then
          pFIBDataSetRes.Transaction.Commit;
{      Action:=caFree;}
end;

procedure TFormUpdKmnd.BitBtn1Click(Sender: TObject);
var ks,gs:string;
    v:Variant;
    SQLStmnt:string;
begin
    LabelFio.Caption:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     Self.WantedTabno:=GetTabno;
                     Self.FIO:=GetFio;
        //             Self.SwidSS:=GetSwidSS;
                     LabelFio.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.Fio);
                     SQLStmnt:='SELECT shifrkat,shifrgru,namekat,namegru,w_place FROM getkatgru('+IntToSTr(Self.WantedTabno)+')';
                     try
{
                         FormWait.Show;
                         Application.ProcessMessages;
}                        v:=UFibModule.FIB.pFIBDataBaseSal.QueryValues(SQLStmnt);
{                         FormWait.Hide;}
                         Self.ShifrKat:=v[0];
                         Self.ShifrGru:=v[1];
                         KS:=v[2];
                         GS:=v[3];
                         Self.WantedPodr:=v[4];
                         LabelFio.Caption:=Trim(LabelFio.Caption)+' '+trim(ks)+' '+trim(gs);
                     except
                         MessageDlg('Ошибка getkatgru',mtInformation, [mbOk], 0);
                         Exit;
                     end;
               end;
         finally
{            free;}
         end;
       Self.Repaint;
end;

procedure TFormUpdKmnd.FillTmpTables(ShifrIdKmnd:integer);
 var MsgText:string;
     SQLStmnt:string;
 begin
      if ShifrIdKmnd<1 then Exit;
      SQLStmnt:='EXECUTE PROCEDURE CRTMPKOMAND_01_12_2016 (';
      SQLStmnt:=trim(SQLStmnt)+intToStr(ShifrIdKmnd)+')';
      FormWait.Show;
      Application.ProcessMessages;
      try
         UFibModule.FIB.pFIBDatabaseSal.Execute(SQLStmnt);
         FormWait.Hide;
         Application.ProcessMessages;
      except
            on E:EFIBError do
               begin
                     MsgText := 'Ошибка созвания временных таблиц:' + #10#13        + #10#13 +
                                'SQLCode = '     + IntToStr(E.SQLCode)     + #10#13 +
                                'SQLMessage = '  + E.SQLMessage             + #10#13 +
                                'IBErrorCode = ' + IntToStr(E.IBErrorCode) + #10#13 +
                                'IBMessage: '    + #10#13 + E.IBMessage    + #10#13 +
                                'Message = '     + E.Message;
                    ShowMessage(MsgText);
                    Raise;
               end;
      end;
      if pFIBDataSetSummy.Active then
         pFIBDataSetSummy.Active:=false;
      pFIBDataSetSummy.Active:=true;
      if pFIBDataSetRes.Active then
         pFIBDataSetRes.Active:=false;
      pFIBDataSetRes.Active:=true;

 end;

function TFormUpdKmnd.Execute: boolean;
var ks,gs:string;
    i:Integer;
    v:Variant;
    SQLStmnt:string;
begin
      IF (WorkMonth<>NMES) OR (WorkYear<>CurrYear) THEN
          BEGIN
               BitBtn3.Hide;
             //  BitBtnInitCont.Hide;
               BitBtn4.Hide;
               Save.Hide;
               BitBtnDelNotSel.Hide;
               hideBitSinglPerson;
          END
      ELSE
          BEGIN
               BitBtn3.Show;
            //   BitBtnInitCont.Show;
               BitBtn4.Show;
               Save.Show;
               BitBtnDelNotSel.Show;
               if (MODEWR in [1,2]) and (Length(Trim(guid))>10) and (ShifrIdKmnd>0) then
                  showBitSinglPerson
               else
                  hideBitSinglPerson;

          END;
  if ActionClar=1 then
     begin
          if Mode_V_Z=1 then RadioGroupModeZaVy.ItemIndex:=0
                        else RadioGroupModeZaVy.ItemIndex:=1;
      //    ComboBoxCodeIll.ItemIndex:=0;
     end;
  if (ActionClar>1) or  ((ActionClar=1) and (Self.WantedTabno>0)) then
     begin
          LabelFio.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.Fio);
        //  EditNomer_B.Text:=NomerB;
       //   EditSwidSS.Text:=SwidSS;
          SQLStmnt:='SELECT name FROM kateg where shifr='+IntToSTr(Self.ShifrKat);
          try
             FormWait.Show;
             Application.ProcessMessages;
             v:=SQLQueryValue(SQLStmnt);
             FormWait.Hide;
             ks:=v;
          except
              Ks:=''
          end;

          gs:='';
//          SQLStmnt:='SELECT name FROM kateg where shifr='+IntToSTr(Self.ShifrKat);
//          try
//             v:=SQLQueryValue(SQLStmnt);
//             gs:=v;
//          except
//              gs:=''
//          end;

          LabelFio.Caption:=Trim(LabelFio.Caption)+' '+trim(ks)+' '+trim(gs);
          if Mode_V_Z=1 then RadioGroupModeZaVy.ItemIndex:=0
                        else RadioGroupModeZaVy.ItemIndex:=1;
          if ModeDC=1 then RadioGroupModeDC.ItemIndex:=1
                      else RadioGroupModeDC.ItemIndex:=0;
    //      ComboBoxCodeIll.ItemIndex:=DecodeReasonIll(WantedCodeIll);
          LabelBDay.Caption:=IntToStr(Kmnd_Day);
          IF ShifrIdKmnd>0 THEN
             BEGIN
                  FillTmpTables(SHIFRIDKmnd);
             END;
          if ShifrBuh>0 then
             if BuhList.Count>0 then
                for i:=0 to BuhList.Count-1 do
                    begin
                         ComboBoxBuh.Items.Add(IntToStr(PTemyRec(buhlist.items[i])^.Shifr)+' '+
                                        PTemyRec(buhlist.items[i])^.Name);
                         if (PTemyRec(buhlist.items[i])^.Shifr=ShifrBuh) then
                             ComboBoxBuh.ItemIndex:=i;

                    end;


     end;
     if isLNR then
        begin
             LabelWR.Show;
             cbWR.Show;
             if MODEWR=1 then
                cbWR.ItemIndex:=1
             else
             if MODEWR=2 then
                cbWR.ItemIndex:=2
             else
                cbWR.ItemIndex:=0;
            if isLNR then
               begin
           (*
            if WantedShifrSta=gosob_shifr then
               begin
                    cbShifrSta.ItemIndex:=1;
                    showCbShifrTabel;
                    cbShifrTabel.ItemIndex:=0;
                    LabelTabel.Show;
                    if wantedShifrTabel=Mobili_Tabel then
                       cbShifrTabel.ItemIndex:=1
                    else
                       cbShifrTabel.ItemIndex:=0;
               end
            else
               begin
                    cbShifrSta.ItemIndex:=0;
                    wantedShifrSta:=Komandirowki_Shifr;
                    wantedShifrTabel:=KOMANDIROWKA; // командировки
                    hideCbShifrTabel;
               end
               *)
               end;

        end
     else
        begin
             LabelWR.Hide;
             cbWR.Hide;
        end;
     
  Self.Visible:=false;
  if ShowModal = mrOk then result := true
                      else result := false;
end;


procedure TFormUpdKmnd.BitBtn2Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TFormUpdKmnd.BitBtn3Click(Sender: TObject);
var Y,M,D    : word;
    ModeVyZa : integer;
    DateFr   : TDate;
    MsgText  : string;
    SqlStmnt : string;
begin
     if ((WorkYear<>CurrYear) OR (WorkMonth<>Flow_Month)) THEN
        begin
              ShowMessage('Инициализация только за текущий месяц');
              Exit;
        end;
     if DateTimePickerFr.Date>=DateTimePickerTo.Date then
        begin
              ShowMessage('Неверно заполнены даты');
              Exit;
        end;
     if ((WantedTabno<1) or (WantedTabno>20000)) then
        begin
             ShowMessage('Не выбран работник для расчета командировочных.');
             Exit;
        end;

     DecodeDate(DateTimePickerFr.Date,Y,M,D);
     if (((Y=CurrYear) and (m>NMES)) or (Y>CurrYear)) then
        begin
             if YesNo('Подготовить данные за '+GetMonthRus(NMES)+' '+IntToStr(CurrYear)) then
                putPersonToSqlForCurrMonth(WantedTabno,WantedPodr);
        end;



     ModeVyZa:=RadioGroupModeZaVy.ItemIndex;
     if ModeVyZa=1 then ModeVyZa:=0      // за
                   else ModeVyZa:=1;     // в

     MODE_V_Z:=ModeVyZa;
     ModeDC:=0;
     if RadioGroupModeDC.ItemIndex=1 then
        ModeDC:=1;
     if cbWR.itemindex=1 then MODEWR:=1 else
     if cbWR.itemindex=2 then MODEWR:=2 else
     modewr:=0;
     DecodeDate(DateTimePickerFr.Date,Y,M,D);
     SQLStmnt:='EXECUTE PROCEDURE MKTMPKOMANDSUMMY_01_12_2016 (';
     SQLStmnt:=Trim(SQLSTmnt)+IntToStr(wantedTabno)+',';
     SQLStmnt:=Trim(SQLSTmnt)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
     SQLStmnt:=Trim(SQLSTmnt)+IntToStr(ModeVyZa)+','+IntToStr(ModeWR);
     IF isLNR then
        SQLStmnt:=Trim(SQLSTmnt)+','''+Trim(guid)+'''';
     SQLStmnt:=Trim(SQLSTmnt)+')';
     FormWait.Show;
     Application.ProcessMessages;
     try
     SQLExecute(SQLStmnt);
     FormWait.Hide;
     Application.ProcessMessages;
     except
            on E:EFIBError do
               begin
                     MsgText := 'Ошибка инициализации командировочного:'   + #10#13        + #10#13 +
                                'SQLCode = '     + IntToStr(E.SQLCode)     + #10#13 +
                                'SQLMessage = '  + E.SQLMessage            + #10#13 +
                                'IBErrorCode = ' + IntToStr(E.IBErrorCode) + #10#13 +
                                'IBMessage: '    + #10#13 + E.IBMessage    + #10#13 +
                                'Message = '     + E.Message;
                    ShowMessage(MsgText);
                    Raise;
               end
     end;

     if pFIBDataSetSummy.Active then
        pFIBDataSetSummy.Active:=false;
     pFIBDataSetSummy.Active:=true;
     BitBtn4Click(Sender);
end;

procedure TFormUpdKmnd.BitBtn4Click(Sender: TObject);
var
    YFR,MFR,DFR,YTO,MTO,DTO:word;
    DF,DT:String;
    SQLStmnt : string;
    v:Variant;
begin
     IF ((WorkYear<>CurrYear) OR (WorkMonth<>Nmes)) THEN
        BEGIN
              ShowMessage('Расчет только за текущий месяц');
              Exit;
        END;
     if DateTimePickerFr.Date>=DateTimePickerTo.Date then
        begin
              ShowMessage('Неверно заполнены даты');
              Exit;
        end;
     if ((WantedTabno<1) or (WantedTabno>20000)) then
        begin
             ShowMessage('Не выбран работник для расчета командировочных.');
             Exit;
        end;

     Mode_V_Z:=RadioGroupModeZaVy.ItemIndex;
     if Mode_V_Z=1 then Mode_V_Z:=0      // за
                   else Mode_V_Z:=1;     // в
     ModeDC:=0;
     if RadioGroupModeDC.ItemIndex=1 then
        ModeDC:=1;
     if ((ModeDC<>1) and (ModeRecalcClock=1)) then
        begin
             ShowMessage('Это не почасовой командировочный');
             Exit;
        end;

     DecodeDate(DateTimePickerFr.Date,YFR,MFR,DFR);
     DecodeDate(DateTimePickerTo.Date,YTo,MTo,DTo);
     DF:=IntToStr(YFR)+'-'+IntToStr(MFR)+'-'+IntToStr(DFR);
     DT:=IntToStr(YTO)+'-'+IntToStr(MTO)+'-'+IntToStr(DTO);
     if length(Trim(GUID))=0 then
        GUID:=GetGUIDPersonToString(wantedCurrperson);
     if not (mode_six_five_day in [5,6]) then
        mode_six_five_day:=5;   
     if isLNR then
        SQLStmnt := 'SELECT MeanDay,MeanDay_Bud,MeanDay_VNE,MeanDay_GN,MeanDay_Nis,coalesce(KOMAND_DAY,0) FROM CALCKOMAND_01_12_2016('''+DF+''','''+DT+''','+IntToStr(WantedShifrSta)+','+IntToStr(Mode_V_Z)+','''+Trim(GUID)+''','+IntToStr(MODE_SIX_FIVE_DAY)+')'
     else
        SQLStmnt := 'SELECT MeanDay,MeanDay_Bud,MeanDay_VNE,MeanDay_GN,MeanDay_Nis,coalesce(KOMAND_DAY,0) FROM CALCKOMAND_01_12_2016('''+DF+''','''+DT+''','+IntToStr(WantedShifrSta)+','+IntToStr(Mode_V_Z)+')';


     try
        FormWait.Show;
        Application.ProcessMessages;
        v:=SQLQueryRecValues(SQLStmnt);
        MEANDAY      := v[0];
        MEANDAY_BUD  := v[1];
        MEANDAY_VNE  := v[2];
        MEANDAY_GN   := v[3];
        MEANDAY_NIS  := v[4];
        Kmnd_DAY     := v[5];
        FormWait.Hide;
        LabelBDay.Caption:=IntToStr(Kmnd_Day);
        Application.ProcessMessages;
     except
     end;

     if pFIBDataSetRes.Active then
        pFIBDataSetRes.Active:=false;
     if pFIBDataSetSummy.Active then
        pFIBDataSetSummy.Active:=false;
     pFIBDataSetSummy.Active := true;
     pFIBDataSetRes.Active   := true;
     ShowSummyMean;

end;

procedure   TFormUpdKmnd.ShowSummyMean;
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

procedure TFormUpdKmnd.GetSummy;
var
    YFR,MFR,DFR,YTO,MTO,DTO:word;
    DF,DT:String;
    SQLStmnt:string;
    v:Variant;
begin
     SQLStmnt:='SELECT COALESCE(SUM(SUMMA_BUD),0),COALESCE(SUM(SUMMA_VNE),0),COALESCE(SUM(SUMMA_GN),0),COALESCE(SUM(SUMMA_NIS),0),COALESCE(SUM(DAY_KALEND_WORK),0),COALESCE(SUM(GRAPHIC_DAY),0) FROM TMP_KOMAND_SUMMY WHERE CONNID=CURRENT_CONNECTION AND (SEL>0)';  // AND SUMMA_BUD+SUMMA_VNE+SUMMA_GN+SUMMA_NIS>0)')

     try
        FormWait.Show;
        Application.ProcessMessages;
        v:=UFibModule.FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
        FormWait.Hide;
        Application.ProcessMessages;
        SUMMA_BUD    := v[0];
        SUMMA_VNE    := v[1];
        SUMMA_GN     := v[2];
        SUMMA_NIS    := v[3];
        NMBOFDAYS    := v[4];

     except
     end;
end;

procedure TFormUpdKmnd.dxDBGridResCustomDrawFooter(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; var AText: String; var AColor: TColor;
  AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
var
  s : string;
  I:Integer;
  SQLStmnt:string;
  v:Variant;
begin
  eXIT;
  if not assigned(AColumn) then Exit;
  if AColumn.Index = 3 then   {B_DAY}
  begin
       SQLStmnt:='SELECT SUM(KMD_DAY) FROM TMP_KOMAND_RES WHERE CONNID=CURRENT_CONNECTION';
       try
          FormWait.Show;
          Application.ProcessMessages;
          v:=UFibModule.FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
          FormWait.Hide;
          I:=v;;
       except
           I:=0
       end;
       S:=IntToStr(I);
       AColor := clWhite;
       AAlignment := taRightJustify;
       AText := s;
  end;
end;

procedure TFormUpdKmnd.dxDBGridResBeforeCalcSummary(Sender: TObject);
begin
{     I:=0;}
end;





procedure TFormUpdKmnd.FormCreate(Sender: TObject);
var D,M,Y:word;
    Da:TDate;
    i:Integer;
begin
     modeSumma:=1; //Бюджет
     dxDBGridRasSumma.Caption:=getCaptionSumma;
     cbRas.ItemIndex:=modeSumma-1;
     cbShifrSta.ItemIndex:=0;
     ModeRecalcClock := 0; {Обычныый перерасчет больничного}
//     WantedShifrSta := OplataKomandirovokShifr;
     WantedShifrSta := Komandirowki_Shifr;
     WantedProc     := 100;
     ShifrIdKmnd    :=   0;
//     NomerB         :=  '';
//     SwidSS         :=  '';
     MEANDAY        :=   0;
     MEANDAY_BUD    :=   0;
     MEANDAY_VNE    :=   0;
     MEANDAY_GN     :=   0;
     MEANDAY_NIS    :=   0;
     Kmnd_Day       :=   0;
     M  := NMES;
     Y  := CurrYear;
     D  := 1;
     Da := EnCodeDate(y,m,d);
     DateTimePickerFr.Date := Da;
     DateTimePickerFr.MaxDate:=IncYear(Da,10);
     DateTimePickerFr.MinDate:=IncYear(Da,-30);
     DateTimePickerTo.Date := Da;
     DateTimePickerTo.MaxDate:=IncYear(Da,10);
     DateTimePickerTo.MinDate:=IncYear(Da,-30);
     dxDBGridSum.Height := TabSheet1.Height-50;
     RadioGroupModeZaVy.ItemIndex:=0;
     RadioGroupModeDC.ItemIndex:=0;
     Mode_V_Z := 1;               // стартовая в
     ModeDC   := 0;
     GUID     := '';
     WantedShifrSta := Komandirowki_Shifr;
     wantedShifrTabel:=KOMANDIROWKA;
     StringGridMean.ColCount:=4;
     StringGridMean.RowCount:=5;
     StringGridMean.Cells[0,1]:='Бюджет';
     StringGridMean.Cells[0,2]:='ВнеБюджет';
     StringGridMean.Cells[0,3]:='Г Н';
     StringGridMean.Cells[0,4]:='Н И С';
     StringGridMean.Cells[1,0]:='Итого';
     StringGridMean.Cells[2,0]:='Дней';
     StringGridMean.Cells[3,0]:='Ср.дн.';
     PageControl1.ActivePageIndex:=0;
     WantedCodeIll := 1;
     ShifrBuh:=CurrWrk;
     if BuhList.Count>0 then
     for i:=0 to BuhList.Count-1 do
         begin
              ComboBoxBuh.Items.Add(IntToStr(PTemyRec(buhlist.items[i])^.Shifr)+' '+
                                        PTemyRec(buhlist.items[i])^.Name);
              if (PTemyRec(buhlist.items[i])^.Shifr=ShifrBuh) then
                 ComboBoxBuh.ItemIndex:=i;
         end;


end;

procedure TFormUpdKmnd.FormShow(Sender: TObject);
begin

      ShowSummyMean;
end;





procedure TFormUpdKmnd.dxDBGridSumColumnButtonButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
VAR Y,M:Integer;
begin
     Y := pFIBDataSetSummy.FieldByName('YEAR_ZA').AsInteger;
     M := pFIBDataSetSummy.FieldByName('MONTH_ZA').AsInteger;
     with TFormKomandA.Create(nil) do
            try
                WantedYear     := Y;
                WantedMonth    := M;
                WantedMode_V_Z := Mode_V_Z;
                if execute then
                   begin
                   end;
            finally
             free;
            end;

end;

function TFormUpdKmnd.ComplitKomand:boolean;
 begin
      Result:=false;
      if WorkYear<>CurrYear then Exit;
      if WorkMonth<>NMES then Exit;
      if WantedTabno=0 then Exit;
      if  ((WantedProc<50) or (WantedProc>100)) then Exit;
      if  WantedShifrSta<1 then Exit;
      if abs(MEANDAY)<0.01 then Exit;
      if Kmnd_Day<1 then Exit;
      Result:=true;
 end;
procedure TFormUpdKmnd.SaveClick(Sender: TObject);
var DataVY  : TDate      ;
    SQLStmnt : WideString ;
begin
     IF ((WorkYear<>CurrYear) OR (WorkMonth<>Nmes)) THEN
        BEGIN
              ShowMessage('Сохранить данные можно только за текущий месяц');
              Exit;
        END;
     IF ((WorkYear<>CurrYear) OR (Flow_Month<>Nmes)) THEN
        BEGIN
              ShowMessage('Сохранить данные можно только за текущий месяц');
              Exit;
        END;
     if not ComplitKomand then
        begin
             ShowMessage('Данные для расчета командировочных не заполнены');
             Exit;
        end;
     Mode_V_Z:=RadioGroupModeZaVy.ItemIndex;
     if Mode_V_Z=1 then Mode_V_Z:=0      // за
                   else Mode_V_Z:=1;     // в
     ModeWR:=cbWR.ItemIndex;
     if ((MODEWR<0) or (MODEWR>2)) then
        modeWR:=0;

   //  pFIBTransactionSAL.StartTransaction ;
     DataVy:=EnCodeDate(CurrYear,NMES,1);
(*
     if pFIBDataSetRes.UpdateTransaction.Active then
        pFIBDataSetRes.UpdateTransaction.Commit;

     if not pFIBStoredProcSave.Transaction.Active then
        pFIBStoredProcSave.Transaction.StartTransaction;
     pFIBStoredProcSave.Prepare;
     try
        pFIBStoredProcSave.Params[0].AsInteger  := ShifrIdKmnd;
        pFIBStoredProcSave.Params[1].AsInteger  := WantedTabno;
        pFIBStoredProcSave.Params[2].AsString   := NomerB;
        pFIBStoredProcSave.Params[3].AsString   := DateToStr(DateTimePickerFr.Date);
        pFIBStoredProcSave.Params[4].AsString   := DateToStr(DateTimePickerTo.Date);
        pFIBStoredProcSave.Params[5].AsString   := DateToStr(DataVy);
        pFIBStoredProcSave.Params[6].AsFloat    := WantedProc;
        pFIBStoredProcSave.Params[7].AsInteger  := WantedShifrSta;
        pFIBStoredProcSave.Params[8].AsInteger  := B_DAY;
        pFIBStoredProcSave.Params[9].AsFloat    := MEANDAY;
        pFIBStoredProcSave.Params[10].AsFloat   := MEANDAY_BUD;
        pFIBStoredProcSave.Params[11].AsFloat   := MEANDAY_VNE;
        pFIBStoredProcSave.Params[12].AsFloat   := MEANDAY_GN;
        pFIBStoredProcSave.Params[13].AsFloat   := MEANDAY_NIS;
        pFIBStoredProcSave.Params[14].AsInteger := MODE_V_Z;
        pFIBStoredProcSave.Params[15].AsInteger := MODE_ILL;
        pFIBStoredProcSave.Params[16].AsInteger := MODEDC;
        pFIBStoredProcSave.Params[17].AsString  := SWIDSS;
        pFIBStoredProcSave.Params[18].AsInteger := WantedCodeIll;
        pFIBStoredProcSave.Params[19].AsInteger := ShifrBuh;
        FormWait.Show;
        Application.ProcessMessages;
        pFIBStoredProcSave.ExecProc;
        FormWait.Hide;
     except
       ShowMessage('Ошибка сохранения комардировки')
     end;
     pFIBStoredProcSave.Close;
     Close;

//     pFIBTransactionSAL.Commit;
     pFIBStoredProcSave.Transaction.Commit;
 *)



     SQLStmnt:='EXECUTE PROCEDURE PUTKOMAND_01_12_2016(';
     SQLStmnt:=Trim(SQLStmnt)+intToStr(shifrIdKmnd)+',';
     SQLStmnt:=Trim(SQLStmnt)+intToStr(wantedTabno)+',';
     SQLStmnt:=Trim(SQLStmnt)+''''+trim(DateToStr(DateTimePickerFr.Date))+''',';
     SQLStmnt:=Trim(SQLStmnt)+''''+trim(DateToStr(DateTimePickerTo.Date))+''',';
     SQLStmnt:=Trim(SQLStmnt)+''''+trim(DateToStr(DataVy))+''',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(wantedShifrSta))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(Kmnd_DAY))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(MEANDAY))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(MEANDAY_BUD))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(MEANDAY_VNE))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(MEANDAY_GN))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(MEANDAY_NIS))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(MODE_V_Z))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(ShifrBuh))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(modeWR));
     if isLNR then
        begin
            if Length(trim(GUID))<5 then
               GUID:=GetGUIDPersonToString(wantedCurrperson);
            if not (mode_six_five_day in [5,6]) then
               mode_six_five_day:=5;    
            SQLStmnt:=Trim(SQLStmnt)+','''+trim(GUID)+''',';
            SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(mode_SIX_FIVE_DAY))+',';
            SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(wantedShifrtabel));
        end;


     SQLStmnt:=Trim(SQLStmnt)+')';

     UFibModule.FIB.pFIBDatabaseSal.Execute(SQLStmnt);

     Self.Close;


end;



procedure TFormUpdKmnd.TabSheet1Show(Sender: TObject);
begin
      IF (WorkMonth=NMES) OR (WorkYear=CurrYear) THEN
         begin
              BitBtnDelNotSel.Show;
              BitBtnDelNotSel.Enabled:=true;
         end;
end;

procedure TFormUpdKmnd.TabSheet2Show(Sender: TObject);
begin
      BitBtnDelNotSel.Hide;
      BitBtnDelNotSel.Enabled:=false;
end;

procedure TFormUpdKmnd.TabSheet3Show(Sender: TObject);
begin

      BitBtnDelNotSel.Hide;
      BitBtnDelNotSel.Enabled:=false;
end;

procedure TFormUpdKmnd.BitBtnDelNotSelClick(Sender: TObject);
var YearZa,MonthZa:integer;
    SQLStmt:string;
begin
      if ((WorkYear<>CurrYear) OR (WorkMonth<>Flow_Month)) THEN
         begin
               ShowMessage('Изменение командировки возможно только за текущий месяц');
               Exit;
         end;

      FormWait.Show;
      Application.ProcessMessages;
      pFIBDataSetSel.Active:=true;
      pFIBDataSetSel.First;
      while not pFIBDataSetSel.Eof do
        begin
             YearZa:=pFIBDataSetSel.FieldByName('YEAR_ZA').AsInteger;
             MonthZa:=pFIBDataSetSel.FieldByName('MONTH_ZA').AsInteger;
             if Mode_V_Z=1 then        // 1 - в 0 - за
                SQLStmt:='delete from tmp_komand_add where year_vy='+IntToStr(YearZa)+' and month_vy='+IntToStr(MonthZa)+' and ConnId=CURRENT_CONNECTION'
             else
                SQLStmt:='delete from tmp_komand_add where year_za='+IntToStr(YearZa)+' and month_za='+IntToStr(MonthZa)+' and ConnId=CURRENT_CONNECTION';
             UFibModule.FIB.pFIBdataBaseSal.Execute(SqlStmt);
             pFIBDataSetSel.Next;
        end;
      pFIBDataSetSel.Active:=false;
      SQLStmt:='delete from tmp_komand_summy where ConnId=CURRENT_CONNECTION and SEL=0';
      UFibModule.FIB.pFIBDataBaseSal.Execute(SQLStmt);
      pFIBDataSetSummy.Active:=false;
      pFIBDataSetSummy.Active:=true;
      FormWait.Hide;
end;

function TFormUpdKmnd.GetPassCountKomandForTabno(ShifrIdKmnd:integer):integer;
 var SQLStmnt:string;
     RetVal:integer;
     I_Start:boolean;
     v:Variant;
 begin
      RetVal:=0;
      GetPassCountKomandForTabno:=RetVal;
      if WantedTabno<1 then Exit;
      I_Start:=false;
      SQLStmnt:='select count(*) from tb_komand'+
                ' where tabno='+IntToStr(WantedTabno)+' and ShifrId<>'+IntToStr(ShifrIdKmnd);
      FormWait.Show;
      Application.ProcessMessages;
      v:=UFibModule.FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
      FormWait.Hide;
      RetVal:=v;
      GetPassCountKomandForTabno:=RetVal;
 end;




procedure TFormUpdKmnd.dxDBGridSumManual_calcChange(Sender: TObject);
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

procedure TFormUpdKmnd.dxDBGridSumSELChange(Sender: TObject);
begin
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
{     CalcSummyFot;      }
end;

procedure TFormUpdKmnd.BitBtn5Click(Sender: TObject);
begin
     if ((WorkYear<>CurrYear) OR (WorkMonth<>Flow_Month)) THEN
        begin
              ShowMessage('Инициализация только за текущий месяц');
              Exit;
        end;
     if ((WantedTabno<1) or (WantedTabno>20000)) then
        begin
             ShowMessage('Не выбран работник для расчета командировачных.');
             Exit;
        end;
     if YesNo('Подготовить данные за '+GetMonthRus(NMES)+' '+IntToStr(CurrYear)) then
        begin
             putPersonToSqlForCurrMonth(WantedTabno,WantedPodr);
             FormWaitMess.SetMessage('Данные добавлены');
             FormWaitMess.Show;
             repeat
                   Application.ProcessMessages;
             until FormWaitMess.Timer1.Enabled=false;
             FormWaitMess.Hide;

        end;


end;

procedure TFormUpdKmnd.RadioGroupModeDCClick(Sender: TObject);
begin
     ModeDC:=0;
     if RadioGroupModeDC.ItemIndex=1 then
        ModeDC:=1;
     if ModeDC=1 then
        begin
             StringGridMean.Cells[2,0]:='Часов';
             StringGridMean.Cells[3,0]:='Ср.час.';
             dxDBGridSumDAYS.Caption  :='Час.';
             dxDBGridSumGRAPHIC_DAY.Caption  :='Гр.ч.';
             dxDBGridResB_DAY.Caption := 'Час.';
        end
     else
        begin
             StringGridMean.Cells[2,0]:='Дней';
             StringGridMean.Cells[3,0]:='Ср.дн.';
             dxDBGridSumDAYS.Caption  :='Дн.';
             dxDBGridSumGRAPHIC_DAY.Caption  :='Гр.дн.';
             dxDBGridResB_DAY.Caption := 'Дн.';
        end;
     Application.ProcessMessages;
end;


procedure TFormUpdKmnd.dxDBGridResB_DAYChange(Sender: TObject);
begin
     { ShowMessage('Enter');}
end;



procedure TFormUpdKmnd.ComboBoxBuhChange(Sender: TObject);
 var i,j:Integer;
begin
     i:=ComboBoxBuh.ItemIndex;
     if ((i>=0) and (i<BuhList.Count)) then
        begin
             j:=PTemyRec(BuhList.Items[i])^.Shifr;
             ShifrBuh:=j;
        end;

end;

procedure TFormUpdKmnd.pFIBDataSetSummyCalcFields(DataSet: TDataSet);
var
    koefUw:Real;
begin
      case modeSumma of
        2:pFIBDataSetSummysumma.Value:=pFIBDataSetSummySUMMA_VNE.Value;
        3:pFIBDataSetSummysumma.Value:=pFIBDataSetSummySUMMA_GN.Value;
        4:pFIBDataSetSummysumma.Value:=pFIBDataSetSummySUMMA_NIS.Value;
       else
        pFIBDataSetSummysumma.Value:=pFIBDataSetSummySUMMA_BUD.Value;
      end;
      if pFIBDataSetSummySEL.Value>0 then
         pFIBDataSetSummySummaSel.Value := pFIBDataSetSummysumma.Value;
      koefUw:=pFIBDataSetSummyKOEF.Value;
      if (koefUw<1.0) or (koefUw>3.0) then
         koefUw:=1.0;
      pFIBDataSetSummySummaSelUw.Value := pFIBDataSetSummysummaSel.Value * KOEFUw;

end;

procedure TFormUpdKmnd.TabSheetRasShow(Sender: TObject);
 var MeanDay:Real;
     summaSelUwTot:real;
     wDaysTot:Real;

begin
     Self.getSummaDayTot(summaSelUwTot,wDaysTot);
     meanDay:=RoundTo(summaSelUwTot / wDaysTot,-2);
     LabelCalc.Caption:='Среднедневная ='+FormatFloatPoint(summaSelUwTot)+' / '+FormatFloatPoint(wDaysTot)+' = '+FormatFloatPoint(meanDay)+' руб.';
end;

procedure TFormUpdKmnd.dxDBGridRasSummaSelUwSummary(Sender: TObject;
  DataSet: TDataSet; var Value: Extended);
var v:Real;
begin
     v:=Value;
end;


procedure TFormUpdKmnd.getSummaDayTot(var summaSelUwTot : Real; var wDaysTot:Real);
 var bm:TBookmark;
 begin
      summaSelUwTot:=0;
      wDaysTot:=0;
      bm:=pFIBDataSetSummy.GetBookmark;
      pFIBDataSetSummy.First;
      while not pFIBDataSetSummy.Eof do
        begin
             summaSelUwTot:=summaSelUwTot+pFIBDataSetSummySummaSelUw.Value;
             if pFIBDataSetSummySEL.Value=1 then
                wDaysTot:=wDaysTot+pFIBDataSetSummyDAYS.Value;
             pFIBDataSetSummy.Next;
        end;
      pFIBDataSetSummy.GotoBookmark(bm);
      pFIBDataSetSummy.FreeBookmark(bm);
 end;
procedure TFormUpdKmnd.frxReport1GetValue(const VarName: String;
  var Value: Variant);
  var s,modeS:string;
      summaTot:Real;
      wDays:Integer;
      meanDay:real;
      wDaysTot1:real;
      summaSelUwTot1:real;
begin
    case modeSumma of
     2:modeS:='внебюджет';
     3:modeS:='ГН';
     4:modeS:='НИС';
     else
       modeS:='бюджет';
    end;
    if CompareText(VarName,'Header')=0 then
       begin
            s:=Trim(Self.Fio)+' c '+FormatDate(DateTimePickerFr.date)+' по '+FormatDate(DateTimePickerTo.date)+' '+modeS;
            Value := Trim(s);
       end
    else
    if CompareText(VarName,'Meanday')=0 then
       begin
            getSummaDayTot(summaSelUwTot1,wDaysTot1);
            wDays    := Round(wDaysTot1);
            summaTot := summaSelUwTot1;
            meanDay  := 0.00;
            if Abs(wDaysTot1)>0.01 then
               meanDay:=RoundTo(summaSelUwTot1 / wDaysTot1,-4);
            s:=FormatFloatPoint(summaSelUwTot1)+' / '+intToStr(WDays)+' = '+formatFloatPoint(meanDay);
            Value := Trim(s);
       end;
end;

procedure TFormUpdKmnd.N1Click(Sender: TObject);
begin
     frxReport1.ShowReport();
end;

function TFormUpdKmnd.getCaptionSumma:string;
 var retVal:string;
 begin
      case modeSumma of
       2: retVal:='Внебюджет';
       3: retVal:='Сумма ГН';
       4: retVal:='Сумма НИС';
       else
          retVal:='Сумма бюджет';
      end;
      getCaptionSumma:=retVal;
 end;
procedure TFormUpdKmnd.cbRasChange(Sender: TObject);
begin
     modeSumma:=cbRas.ItemIndex+1;
     dxDBGridRasSumma.Caption:=getCaptionSumma;
//     dxDBGridRasSumma.
     pFIBDataSetSummy.Close;
     pFIBDataSetSummy.Open;
     Application.ProcessMessages;
end;

procedure TFormUpdKmnd.showCbShifrTabel;
 begin
      cbShifrTabel.Show;
      cbShifrTabel.Enabled:=True;
      LabelTabel.Show;
      Application.ProcessMessages;
 end;
procedure TFormUpdKmnd.hideCbShifrTabel;
 begin
      cbShifrTabel.hide;
      cbShifrTabel.Enabled:=false;
      LabelTabel.hide;
      Application.ProcessMessages;
 end;

procedure TFormUpdKmnd.showBitSinglPerson;
 begin
      if (self.ShifrIdKmnd>0) and (Length(Trim(Self.GUID))>10)then
      IF ((WorkYear=CurrYear) and (WorkMonth=Nmes)) THEN
//        BEGIN
//              ShowMessage('Расчет только за текущий месяц');
//              Exit;
//        END;
         begin
               BitSinglPerson.Show;
               BitSinglPerson.Enabled:=True;
               Application.ProcessMessages;
         end;
 end;
procedure TFormUpdKmnd.hideBitSinglPerson;
 begin
      BitSinglPerson.Hide;
      BitSinglPerson.Enabled:=false;
      Application.ProcessMessages;
 end;
procedure TFormUpdKmnd.cbShifrStaChange(Sender: TObject);
begin
{$IFDEF SVDN}
 System.Exit;
{$ELSE}
      if cbShifrSta.ItemIndex=1 then
         wantedShifrSta:= gosob_shifr     // гос обязанности
      else
         WantedShifrSta := Komandirowki_Shifr;//OplataKomandirovokShifr ;      {Обычный бошьничный}
     if WantedShifrSta=komandirowki_shifr then
        begin
             hideCbShifrTabel;
             wantedShifrTabel:=KOMANDIROWKA;
        end
     else
        begin
            showCbShifrTabel;
            wantedShifrTabel:=Mobili_Tabel;
            cbShifrTabel.ItemIndex:=1;
        end;
{$ENDIF}
        
end;



procedure TFormUpdKmnd.cbShifrTabelChange(Sender: TObject);
begin
    if cbShifrTabel.itemIndex=1 then
       wantedShifrTabel:=Mobili_Tabel
    else
       wantedShifrTabel:=GOS_OB;   
end;

procedure TFormUpdKmnd.BitSinglPersonClick(Sender: TObject);
 var SQLStmnt:string;
begin
     if Length(Trim(GUID))<10 then Exit;
     if not (MODEWR in [1,2]) then Exit;
     if ShifrIdKmnd>0         THEN Exit;
     IF ((WorkYear<>CurrYear) OR (WorkMonth<>Nmes)) THEN
        BEGIN
              ShowMessage('Расчет только за текущий месяц');
              Exit;
        END;

     FormWait.Show;
     Application.ProcessMessages;
     BitSinglPerson.Enabled:=False;
     Application.ProcessMessages;
     SQLStmnt:='update tmp_komand_add a set a.marked=0 where a.connid=current_connection';
     SQLExecute(SQLStmnt);
     SQLStmnt:='update tmp_komand_add a set a.marked=1 where a.connid=current_connection and (coalesce((select coalesce(GUID,''1'') from tb_komand b where b.shifrid=a.shifridkomand),''1'')='''+trim(GUID)+''')';
     SQLExecute(SQLStmnt);

//     SQLStmnt:='update tmp_otp_add a set a.sel=1 where a.connid=current_connection and coalesce((select coalesce(GUID,'1') from tb_komand b where b.shifrid=a.shifridkomand),'1')='''+trim(GUID)+'')';

     BitSinglPerson.Enabled:=True;
     Application.ProcessMessages;
     FormWait.Hide;
     Application.ProcessMessages;
     BitBtn4Click(Self);
end;

procedure TFormUpdKmnd.cbWRChange(Sender: TObject);
begin
     if cbWR.ItemIndex in [1,2] then
         showBitSinglPerson
     else
         hideBitSinglPerson;

end;

end.
