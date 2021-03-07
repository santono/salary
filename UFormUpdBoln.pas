{$WARNINGS OFF}
{$HINTS OFF}

unit UFormUpdBoln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, FIBDataSet, pFIBDataSet, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, ComCtrls, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, FIBQuery, pFIBQuery, pFIBStoredProc, ExtCtrls, Grids,
  FIBDatabase, pFIBDatabase, Menus;

type
  TFormUpdBoln = class(TForm)
    LabelFIO: TLabel;
    BitBtn1: TBitBtn;
    DateTimePickerFr: TDateTimePicker;
    DateTimePickerTo: TDateTimePicker;
    LabelBDay: TLabel;
    ComboBoxShifrSta: TComboBox;
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
    pFIBStoredProcMkSummy: TpFIBStoredProc;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pFIBDataSetRes: TpFIBDataSet;
    dxDBGridRes: TdxDBGrid;
    DataSourceRes: TDataSource;
    pFIBDataSetResYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetResMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetResSHIFRSTA: TFIBSmallIntField;
    pFIBDataSetResB_DAY: TFIBSmallIntField;
    pFIBDataSetResSUMMA_B_BUD: TFIBBCDField;
    pFIBDataSetResSUMMA_B_VNE: TFIBBCDField;
    pFIBDataSetResSUMMA_B_GN: TFIBBCDField;
    pFIBDataSetResSUMMA_B_NIS: TFIBBCDField;
    dxDBGridResYEAR_ZA: TdxDBGridCalcColumn;
    dxDBGridResMONTH_ZA: TdxDBGridCalcColumn;
    dxDBGridResSHIFRSTA: TdxDBGridCalcColumn;
    dxDBGridResB_DAY: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_B_BUD: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_B_VNE: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_B_GN: TdxDBGridCalcColumn;
    dxDBGridResSUMMA_B_NIS: TdxDBGridCalcColumn;
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
    ComboBoxProc: TComboBox;
    dxDBGridSumColumnButton: TdxDBGridButtonColumn;
    pFIBStoredProcCrTmp: TpFIBStoredProc;
    EditNomer_B: TEdit;
    pFIBStoredProcSave: TpFIBStoredProc;
    Save: TBitBtn;
    RadioGroupModeZaVy: TRadioGroup;
    TabSheet3: TTabSheet;
    StringGridMean: TStringGrid;
    BitBtnDelNotSel: TBitBtn;
    pFIBDataSetSel: TpFIBDataSet;
    pFIBDataSetSelMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetSelYEAR_ZA: TFIBSmallIntField;
    BitBtnInitCont: TBitBtn;
    pFIBDataSetSummySHIFRIDTMP: TFIBSmallIntField;
    pFIBDataSetSummyMANUAL_CALC: TFIBSmallIntField;
    dxDBGridSumManual_calc: TdxDBGridCheckColumn;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBQuery: TpFIBQuery;
    pFIBTransactionQ: TpFIBTransaction;
    pFIBTransactionSP: TpFIBTransaction;
    pFIBTransactionRead: TpFIBTransaction;
    BitBtn5: TBitBtn;
    RadioGroupModeDC: TRadioGroup;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    EditSwidSS: TEdit;
    ComboBoxCodeIll: TComboBox;
    ComboBoxBuh: TComboBox;
    pFIBDataSetSummyDAY_KALEND_WORK: TFIBSmallIntField;
    dxDBGridSumDay_Kalend_Work: TdxDBGridColumn;
    rgModeWR: TRadioGroup;
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
    procedure ComboBoxShifrStaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxProcChange(Sender: TObject);
    procedure dxDBGridSumColumnButtonButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure SaveClick(Sender: TObject);
    procedure BitBtnInitContClick(Sender: TObject);
    procedure EditNomer_BChange(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BitBtnDelNotSelClick(Sender: TObject);
    procedure dxDBGridSumManual_calcChange(Sender: TObject);
    procedure dxDBGridSumSELChange(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure RadioGroupModeDCClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure dxDBGridResB_DAYChange(Sender: TObject);
    procedure EditSwidSSChange(Sender: TObject);
    procedure ComboBoxCodeIllChange(Sender: TObject);
    procedure ComboBoxBuhChange(Sender: TObject);
    procedure rgModeWRClick(Sender: TObject);
    procedure RadioGroupModeZaVyClick(Sender: TObject);

  private
    { Private declarations }
    NMBOFDAYS          : integer;
    SUMMA_BUD,
    SUMMA_VNE,
    SUMMA_GN,
    SUMMA_NIS          : REAl;
    IsContinueBoln     : boolean; // Это продолжение больничного
    function ComplitBoln:boolean;
    procedure GetSummy;
    procedure ShowSummyMean;
    procedure FillTmpTables(ShifrIdB:integer);
    function GetPassCountBolnForTabno(ShifrIdB:integer):integer;



  public
    ShifrIdBoln        : integer;
    WantedTabno        : integer;
    Fio                : String;
    ActionClar         : integer;
    shifrkat           : integer;
    shifrgru           : integer;
    WantedProc         : real;
    WantedShifrSta     : integer;
    NomerB             : String;
    SwidSS             : String;
    MEANDAY            : real;
    MEANDAY_BUD        : real;
    MEANDAY_VNE        : real;
    MEANDAY_GN         : real;
    MEANDAY_NIS        : real;
    B_DAY              : integer;
    MODE_V_Z           : integer;
    MODE_ILL_GLO       : integer;
    MODEDC             : integer;
    WantedMode         : integer;
    WantedPodr         : integer;
    WorkYear,WorkMonth : integer; { Просматриваемые год и месяц }
    ShifrIdParentBoln  : integer; { Шифр исходного б листка (в случае продолжения б листа) }
    ModeRecalcClock    : integer; { Режим перерасчета почасового больничного}
    WantedCodeIll      : integer;
    ShifrBuh           : Integer;
    ModeWR             : Integer; {0-все 1 основная 2 совмещение}
    { Public declarations }
  end;

var
  FormUpdBoln: TFormUpdBoln;

implementation
 uses uFrmFindKadryFB,UFibModule,uFormTmpBolna,ScrDef,UFormWait,
      DateUtils,uFormSelParentBoln,{FIB,}ScrUtil,ScrExport, UFormWaitMess,
      ScrLists;

{$R *.dfm}

  

procedure TFormUpdBoln.FormClose(Sender: TObject; var Action: TCloseAction);
begin

       if pFIBDataSetSummy.Active then
          pFIBDataSetSummy.Active:=false;
       if pFIBDataSetRes.Active then
          pFIBDataSetRes.Active:=false;
       if pFIBDataSetSummy.Transaction.Active then
          pFIBDataSetSummy.Transaction.Commit;
       if pFIBDataSetRes.Transaction.Active then
          pFIBDataSetRes.Transaction.Commit;
       if pFIBQuery.Transaction.Active then
          pFIBQuery.Transaction.Commit;
{      Action:=caFree;}
end;

procedure TFormUpdBoln.BitBtn1Click(Sender: TObject);
var ks,gs:string;
begin
    LabelFio.Caption:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     Self.WantedTabno:=GetTabno;
                     Self.FIO:=GetFio;
                     Self.SwidSS:=GetSwidSS;
                     LabelFio.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.Fio);
                     if not pFIBQuery.Transaction.Active then
                        pFIBQuery.Transaction.StartTransaction;
                     pFIBQuery.SQL.Clear;
                     pFIBQuery.SQL.Add('SELECT shifrkat,shifrgru,namekat,namegru,w_place FROM getkatgru('+IntToSTr(Self.WantedTabno)+')');
                     try
{
                         FormWait.Show;
                         Application.ProcessMessages;
}
                         pFIBQuery.ExecQuery;
{                         FormWait.Hide;}
                         Self.ShifrKat:=pFIBQuery.Fields[0].AsInteger;
                         Self.ShifrGru:=pFIBQuery.Fields[1].AsInteger;
                         KS:=pFIBQuery.Fields[2].AsString;
                         GS:=pFIBQuery.Fields[3].AsString;
                         Self.WantedPodr:=pFIBQuery.Fields[4].AsInteger;
                         LabelFio.Caption:=Trim(LabelFio.Caption)+' '+trim(ks)+' '+trim(gs);
                         pFIBQuery.Close;
                     except
                         MessageDlg('Ошибка getkatgru',mtInformation, [mbOk], 0);
                         if pFIBQuery.Transaction.Active then
                            pFIBQuery.Transaction.Commit;
                         Exit;
                     end;
               end;
         finally
{            free;}
         end;
       if pFIBQuery.Transaction.Active then
          pFIBQuery.Transaction.CommitRetaining;
       Self.Repaint;
end;

procedure TFormUpdBoln.FillTmpTables(ShifrIdB:integer);
 var MsgText:string;
     SQLStmnt:string;
 begin
      if ShifrIdB<1 then Exit;
(*
      if not pFIBStoredProcCrTmp.Transaction.Active then
         pFIBStoredProcCrTmp.Transaction.StartTransaction;
      pFIBStoredProcCrTmp.Prepare;
      pFIBStoredProcCrTmp.Params[0].AsInteger := ShifrIdB;
      FormWait.Show;
      Application.ProcessMessages;
      try
      if ((paramcount=1) and (paramstr(1)='1')) then
         ShowMessage('1. Перед созданием временных таблиц ');
      pFIBStoredProcCrTmp.ExecProc;
      if ((paramcount=1) and (paramstr(1)='1')) then
         ShowMessage('2. Временные таблицы созданы');
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
      FormWait.Hide;
      if pFIBStoredProcCrTmp.Transaction.Active then
         pFIBStoredProcCrTmp.Transaction.Commit;
    //  pFIBTransactionSAL.Commit;
    //  pFIBTransactionSAL.StartTransaction;
*)
  //EXECUTE PROCEDURE CRTMPBOLN (?SHIFRID)
      if isLNR then
         SQLStmnt:='EXECUTE PROCEDURE CRTMPBOLN_01_12_2016 ('
      else
         SQLStmnt:='EXECUTE PROCEDURE CRTMPBOLN (';
      SQLStmnt:=trim(SQLStmnt)+intToStr(ShifrIdB)+')';
      FIB.pFIBDatabaseSal.Execute(SQLStmnt);
      if pFIBDataSetSummy.Active then
         pFIBDataSetSummy.Active:=false;
      pFIBDataSetSummy.Active:=true;
      if pFIBDataSetRes.Active then
         pFIBDataSetRes.Active:=false;
      pFIBDataSetRes.Active:=true;

 end;

function TFormUpdBoln.Execute: boolean;
var ks,gs:string;
    i:Integer;
begin
      IF (WorkMonth<>NMES) OR (WorkYear<>CurrYear) THEN
          BEGIN
               BitBtn3.Hide;
               BitBtnInitCont.Hide;
               BitBtn4.Hide;
               Save.Hide;
               BitBtnDelNotSel.Hide;
          END
      ELSE
          BEGIN
               BitBtn3.Show;
               BitBtnInitCont.Show;
               BitBtn4.Show;
               Save.Show;
               BitBtnDelNotSel.Show;
          END;
  if ActionClar=1 then
     begin
          if Mode_V_Z=1 then RadioGroupModeZaVy.ItemIndex:=0
                        else RadioGroupModeZaVy.ItemIndex:=1;
          ComboBoxCodeIll.ItemIndex:=0;
     end;
  if (ActionClar>1) or  ((ActionClar=1) and (Self.WantedTabno>0)) then
     begin
          LabelFio.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.Fio);
          EditNomer_B.Text:=NomerB;
          EditSwidSS.Text:=SwidSS;
          if not pFIBQuery.Transaction.Active then
             pFIBQuery.Transaction.StartTransaction;
          pFIBQuery.SQL.Clear;
          pFIBQuery.SQL.Add('SELECT name FROM kateg where shifr='+IntToSTr(Self.ShifrKat));
          try
             FormWait.Show;
             Application.ProcessMessages;
             pFIBQuery.ExecQuery;
             FormWait.Hide;
             ks:=pFIBQuery.Fields[0].AsString;
          except
              Ks:=''
          end;
          pFIBQuery.Close;
          pFIBQuery.SQL.Clear;
          pFIBQuery.SQL.Add('SELECT name FROM gruppy where shifr='+IntToSTr(Self.ShifrGru));
          try
             pFIBQuery.ExecQuery;
             gs:=pFIBQuery.Fields[0].AsString;
          except
              gs:=''
          end;
          pFIBQuery.Close;
          pFIBQuery.Transaction.Commit;
          LabelFio.Caption:=Trim(LabelFio.Caption)+' '+trim(ks)+' '+trim(gs);
          if Mode_V_Z=1 then RadioGroupModeZaVy.ItemIndex:=0
                        else RadioGroupModeZaVy.ItemIndex:=1;
          if ModeDC=1 then RadioGroupModeDC.ItemIndex:=1
                      else RadioGroupModeDC.ItemIndex:=0;
          ComboBoxCodeIll.ItemIndex:=DecodeReasonIll(WantedCodeIll);
          LabelBDay.Caption:=IntToStr(B_Day);
          IF ShifrIdBoln>0 THEN
             BEGIN
                  FillTmpTables(SHIFRIDBOLN);
{                  pFIBStoredProcCrTmp.Prepare;
                  try
                     pFIBStoredProcCrTmp.Params[0].AsInteger := ShifrIdBoln;
                     FormWait.Show;
                     Application.ProcessMessages;
                     pFIBStoredProcCrTmp.ExecProc;
                     FormWait.Hide;
                  finally
                     pFIBStoredProcCrTmp.Close;
                  end;
                  pFIBTransactionSAL.Commit;
                  pFIBTransactionSAL.StartTransaction;
                  if pFIBDataSetSummy.Active then
                     pFIBDataSetSummy.Active:=false;
                  pFIBDataSetSummy.Active:=true;
                  if pFIBDataSetRes.Active then
                     pFIBDataSetRes.Active:=false;
                  pFIBDataSetRes.Active:=true;
}
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
  Self.Visible:=false;
  if ShowModal = mrOk then result := true
                      else result := false;
end;


procedure TFormUpdBoln.BitBtn2Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TFormUpdBoln.BitBtn3Click(Sender: TObject);
var Y,M,D    : word;
    ModeVyZa : integer;
    DateFr   : TDate;
    MsgText  : string;
    Mode_Ill_loc : integer;
    Mode_Ill_In :integer;
    SQLStmnt : WideString;
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
             ShowMessage('Не выбран работник для начисления больничных.');
             Exit;
        end;

     DecodeDate(DateTimePickerFr.Date,Y,M,D);
     if (((Y=CurrYear) and (m>NMES)) or (Y>CurrYear)) then
        begin
             if YesNo('Подготовить данные за '+GetMonthRus(NMES)+' '+IntToStr(CurrYear)) then
                putPersonToSqlForCurrMonth(WantedTabno,WantedPodr);
        end;



     IsContinueBoln := false;
     ModeVyZa:=RadioGroupModeZaVy.ItemIndex;
     if ModeVyZa=1 then ModeVyZa:=0      // за
                   else ModeVyZa:=1;     // в

     MODE_V_Z:=ModeVyZa;
     Mode_Ill_loc       :=  0 ;    { Обычный больный }
     IF ComboBoxShifrSta.ItemIndex=1 THEN
         Mode_Ill_loc       :=  1        { Декретный больный }
     ELSE IF ComboBoxShifrSta.ItemIndex=2 THEN
         Mode_Ill_loc       :=  2      { Больный по уходу }
     else if ((ComboBoxShifrSta.ItemIndex=3) and (isLNR)) then
         Mode_Ill_loc       := 3;     { Бактерионоситель }
     ModeDC:=0;
     if RadioGroupModeDC.ItemIndex=1 then
        ModeDC:=1;

     if WantedMode=10 then Mode_Ill_loc:=10; { Командировки }
     Modewr         :=  0 ;    { Расчет и осн и совм}
     if rgModeWR.ItemIndex=1 then modeWr:=1
     else
     if rgModeWR.ItemIndex=2 then modeWr:=2;

     DecodeDate(DateTimePickerFr.Date,Y,M,D);
     FormWait.Show;
     Application.ProcessMessages;
     pFIBStoredProcMkSummy.Close;
   // EXECUTE PROCEDURE MKTMPBOLNSUMMY (?TABNO, ?DATEFR, ?CURRMONTH, ?CURRYEAR, ?MODE_ZA_VY, ?MODE_ILL,?MODEDC)
     if isLNR then
        begin
             if bolnLNRMode2016 then
                SQLStmnt:='EXECUTE PROCEDURE MKTMPBOLNSUMMY_01_12_2016 ('
             else
                SQLStmnt:='EXECUTE PROCEDURE MKTMPBOLNSUMMY_01_01_2018 (';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(wantedTabno)+',';
             SQLStmnt:=Trim(SQLSTmnt)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(NMES)+',';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(currYear)+',';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(ModeVyZa)+',';
             mode_Ill_in:=mode_ill_loc;
             if mode_Ill_loc=4 then mode_ill_in:=1; {Корректировка бактерионосителя }
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(Mode_Ill_In)+',';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(ModeDC);
             if not bolnLNRMode2016 then
                SQLStmnt:=Trim(SQLSTmnt)+','+IntToStr(ModeWR);
             SQLStmnt:=Trim(SQLSTmnt)+')';
        end
     else
        begin
//             SQLStmnt:='EXECUTE PROCEDURE MKTMPBOLNSUMMY (';
             SQLStmnt:='EXECUTE PROCEDURE MKTMPBOLNSUMMY_10_05_2018 (';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(wantedTabno)+',';
             SQLStmnt:=Trim(SQLSTmnt)+''''+IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D)+''',';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(NMES)+',';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(currYear)+',';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(ModeVyZa)+',';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(Mode_Ill_Loc)+',';
             SQLStmnt:=Trim(SQLSTmnt)+IntToStr(ModeDC);
             SQLStmnt:=Trim(SQLSTmnt)+','+IntToStr(ModeWR);
             SQLStmnt:=Trim(SQLSTmnt)+')';

        end;
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);

     if pFIBDataSetSummy.Active then
        pFIBDataSetSummy.Active:=false;
     pFIBDataSetSummy.Active:=true;
     FormWait.Hide;
     Application.ProcessMessages;
     
     BitBtn4Click(Sender);
end;

procedure TFormUpdBoln.BitBtn4Click(Sender: TObject);
var
    YFR,MFR,DFR,YTO,MTO,DTO:word;
    DF,DT:String;
    ContBoln : integer;
    SQLStmnt : string;
    mode_ill_in:integer;
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
             ShowMessage('Не выбран работник для начисления больничных.');
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
             ShowMessage('Это не почасовой больничный');
             Exit;
        end;
     ContBoln:=0;
     if IsContinueBoln then ContBoln:=1;

     Mode_Ill_GLO       :=  0 ;    { Обычный больный }
     IF ComboBoxShifrSta.ItemIndex=1 THEN
        begin
             WantedShifrSta := DEKRET_SHIFR ;
             Mode_Ill_GLO       :=  1 ;       { Декретный больный }
        end
     ELSE IF ComboBoxShifrSta.ItemIndex=2 THEN
          begin
               WantedShifrSta := BOL_TEK_SHIFR ;
               Mode_Ill_GLO       :=  2 ;     { Больный по уходу }
          end
     ELSE IF ((ComboBoxShifrSta.ItemIndex=3) and (isLNR)) THEN
          begin
               WantedShifrSta := bol_tek_shifr ;
               Mode_Ill_GLO       :=  3 ;     { Бактероноситель }
          end;

     if WantedMode=10 then  { Командировки }
        begin
             WantedShifrSta:=Komandirowki_Shifr;
             Mode_Ill_Glo:=10;
        end;

     DecodeDate(DateTimePickerFr.Date,YFR,MFR,DFR);
     DecodeDate(DateTimePickerTo.Date,YTo,MTo,DTo);
     DF:=IntToStr(YFR)+'-'+IntToStr(MFR)+'-'+IntToStr(DFR);
     DT:=IntToStr(YTO)+'-'+IntToStr(MTO)+'-'+IntToStr(DTO);
     if pFIBQuery.Transaction.Active then
        pFIBQuery.Transaction.Commit;
     pFIBQuery.SQL.Clear;
     if isLNR then
        begin
             mode_ill_in:=mode_ill_Glo;
             if mode_ill_Glo=3 then mode_ill_in:=1;  // Бактрионоситель
        SQLStmnt := 'SELECT MeanDay,MeanDay_Bud,MeanDay_VNE,MeanDay_GN,MeanDay_Nis,B_DAY FROM CALCBOLN_01_12_2016('''+DF+''','''+DT+''','+IntToStr(WantedShifrSta)+','+FloatToStr(WantedProc)+','+IntToStr(Mode_V_Z)+','+IntToStr(ContBoln)+','+IntToStr(Mode_Ill_In)+','+IntToStr(ModeDC)+','+IntToStr(ModeRecalcClock)+')'
        end
     else
        SQLStmnt := 'SELECT MeanDay,MeanDay_Bud,MeanDay_VNE,MeanDay_GN,MeanDay_Nis,B_DAY FROM CALCBOLN('''+DF+''','''+DT+''','+IntToStr(WantedShifrSta)+','+FloatToStr(WantedProc)+','+IntToStr(Mode_V_Z)+','+IntToStr(ContBoln)+','+IntToStr(Mode_Ill_Glo)+','+IntToStr(ModeDC)+','+IntToStr(ModeRecalcClock)+')';

     pFIBQuery.SQL.Add(SQLStmnt);
     if not pFIBQuery.Transaction.Active then
        pFIBQuery.Transaction.StartTransaction;
     try
        FormWait.Show;
        Application.ProcessMessages;
        pFIBQuery.ExecQuery;
        FormWait.Hide;
        MEANDAY      := pFIBQuery.FldByName['MeanDay'].AsFloat;
        MEANDAY_BUD  := pFIBQuery.FldByName['MeanDay_Bud'].AsFloat;
        MEANDAY_VNE  := pFIBQuery.FldByName['MeanDay_Vne'].AsFloat;
        MEANDAY_GN   := pFIBQuery.FldByName['MeanDay_Gn'].AsFloat;
        MEANDAY_NIS  := pFIBQuery.FldByName['MeanDay_Nis'].AsFloat;
        B_DAY        := pFIBQuery.FldByName['B_Day'].AsInteger;
        LabelBDay.Caption:=IntToStr(B_Day);
     except
     end;
     pFIBQuery.Close;
     if pFIBQuery.Transaction.Active then
        pFIBQuery.Transaction.Commit;

     if pFIBDataSetRes.Active then
        pFIBDataSetRes.Active:=false;
     if pFIBDataSetSummy.Active then
        pFIBDataSetSummy.Active:=false;
     pFIBDataSetSummy.Active := true;
     pFIBDataSetRes.Active   := true;
     ShowSummyMean;

end;

procedure   TFormUpdBoln.ShowSummyMean;
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

procedure TFormUpdBoln.GetSummy;
var
    YFR,MFR,DFR,YTO,MTO,DTO:word;
    DF,DT:String;
begin
     if not pFIBQuery.Transaction.Active then
        pFIBQuery.Transaction.StartTransaction;
     pFIBQuery.SQL.Clear;
  {   FIB.pFIBQuery.SQL.Add('SELECT SUM(SUMMA_BUD*KOEF),SUM(SUMMA_VNE*KOEF),SUM(SUMMA_GN*KOEF),SUM(SUMMA_NIS*KOEF),SUM(DAYS) FROM TMP_BOLN_SUMMY WHERE CONNID=CURRENT_CONNECTION AND (SEL>0 AND SUMMA_BUD+SUMMA_VNE+SUMMA_GN+SUMMA_NIS>0)');}
     if isLNR then
        pFIBQuery.SQL.Add('SELECT SUM(SUMMA_BUD),SUM(SUMMA_VNE),SUM(SUMMA_GN),SUM(SUMMA_NIS),SUM(DAY_KALEND_WORK),SUM(GRAPHIC_DAY) FROM TMP_BOLN_SUMMY WHERE CONNID=CURRENT_CONNECTION AND (SEL>0)')  // AND SUMMA_BUD+SUMMA_VNE+SUMMA_GN+SUMMA_NIS>0)')
     else
        pFIBQuery.SQL.Add('SELECT SUM(SUMMA_BUD),SUM(SUMMA_VNE),SUM(SUMMA_GN),SUM(SUMMA_NIS),SUM(DAYS),SUM(GRAPHIC_DAY) FROM TMP_BOLN_SUMMY WHERE CONNID=CURRENT_CONNECTION AND (SEL>0)');// AND SUMMA_BUD+SUMMA_VNE+SUMMA_GN+SUMMA_NIS>0)');
     try
        FormWait.Show;
        Application.ProcessMessages;
        pFIBQuery.ExecQuery;
        FormWait.Hide;
        SUMMA_BUD    := pFIBQuery.Fields[0].AsFloat;
        SUMMA_VNE    := pFIBQuery.Fields[1].AsFloat;
        SUMMA_GN     := pFIBQuery.Fields[2].AsFloat;
        SUMMA_NIS    := pFIBQuery.Fields[3].AsFloat;
        NMBOFDAYS    := pFIBQuery.Fields[4].AsInteger;
        if isSVDN and (MODE_ILL_GLO<>10) then    // Для коммандировок - рабочие дни
           NMBOFDAYS    := pFIBQuery.Fields[5].AsInteger
        else
           NMBOFDAYS    := pFIBQuery.Fields[4].AsInteger;
       if MODE_ILL_GLO = 1 then      
          NMBOFDAYS    := pFIBQuery.Fields[5].AsInteger;

     except
     end;
     pFIBQuery.Close;
     pFIBQuery.Transaction.Commit;
{
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
}
end;

procedure TFormUpdBoln.dxDBGridResCustomDrawFooter(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; var AText: String; var AColor: TColor;
  AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
var
  s : string;
  I:Integer;
begin
  eXIT;
  if not assigned(AColumn) then Exit;
  if AColumn.Index = 3 then   {B_DAY}
  begin
       pFIBQuery.SQL.Clear;
       pFIBQuery.SQL.Add('SELECT SUM(B_DAY) FROM TMP_BOLN_RES WHERE CONNID=CURRENT_CONNECTION');
       try
          FormWait.Show;
          Application.ProcessMessages;
          pFIBQuery.ExecQuery;
          FormWait.Hide;
          I:=pFIBQuery.Fields[0].AsInteger;
       except
           I:=0
       end;
       pFIBQuery.Close;
       S:=IntToStr(I);
       AColor := clWhite;
       AAlignment := taRightJustify;
       AText := s;
  end;
end;

procedure TFormUpdBoln.dxDBGridResBeforeCalcSummary(Sender: TObject);
begin
{     I:=0;}
end;



procedure TFormUpdBoln.ComboBoxShifrStaChange(Sender: TObject);
begin
      WantedShifrSta := bol_tek_shifr ;      {Обычный бошьничный}
      Mode_Ill_GLO    :=  0 ;
      IF ComboBoxShifrSta.ItemIndex=1 THEN
         begin
              WantedShifrSta := DEKRET_SHIFR ;     { Декретный больничный }
              Mode_Ill_GLO       :=  1 ;
         end
      ELSE IF ComboBoxShifrSta.ItemIndex=2 THEN
           begin
                WantedShifrSta := bol_tek_shifr ;     { Больничный по уходу }
                Mode_Ill_GLO       :=  2 ;
           end
      ELSE IF ((ComboBoxShifrSta.ItemIndex=3) and (isLNR)) THEN
           begin
                WantedShifrSta := bol_tek_shifr ;     { Бактерионоситель }
                Mode_Ill_GLO       :=  3 ;
           end;

      if WantedMode=10 then
         begin
               WantedShifrSta := Komandirowki_Shifr;
                Mode_Ill_GLO      :=  10 ;
         end;
end;

procedure TFormUpdBoln.FormCreate(Sender: TObject);
var D,M,Y:word;
    Da:TDate;
    i:Integer;
    SQLStmnt:string;
    UpdateSQLStmnt:widestring;
begin
     ModeRecalcClock := 0; {Обычныый перерасчет больничного}
     IsContinueBoln := false;
     WantedShifrSta :=  bol_tek_shifr;
     WantedProc     := 100;
     ShifrIdBoln    :=   0;
     NomerB         :=  '';
     SwidSS         :=  '';
     MEANDAY        :=   0;
     MEANDAY_BUD    :=   0;
     MEANDAY_VNE    :=   0;
     MEANDAY_GN     :=   0;
     MEANDAY_NIS    :=   0;
     B_Day          :=   0;
     WantedMode     :=   0;  {10 для командировок }
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
     ComboBoxCodeIll.ItemIndex:=0;
     Mode_V_Z := 1;               // стартовая в
     ModeDC   := 0;
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
      ComboBoxProc.Items.Clear;
     if isSVDN then
        begin
             ComboBoxProc.Items.Add('100');
             ComboBoxProc.Items.Add('70');
             ComboBoxProc.Items.Add('60');
             ComboBoxProc.Items.Add('50');
             ComboBoxProc.ItemIndex:=1;
             SQLStmnt:='SELECT CONNID,SEL,MONTH_ZA,YEAR_ZA,SUMMA_BUD,SUMMA_VNE,SUMMA_GN,SUMMA_NIS,OKLAD_M,DAYS,GRAPHIC_DAY,KOEF,ShifrIdTMP,Manual_Calc,0 day_kalend_work FROM TMP_BOLN_SUMMY where CONNID=CURRENT_CONNECTION order by year_za desc,month_za desc';
             UpdateSQLStmnt:='UPDATE TMP_BOLN_SUMMY SET SEL = :SEL, MONTH_ZA = :MONTH_ZA, YEAR_ZA = :YEAR_ZA, SUMMA_BUD = :SUMMA_BUD, SUMMA_VNE = :SUMMA_VNE, SUMMA_GN = :SUMMA_GN, SUMMA_NIS = :SUMMA_NIS, OKLAD_M = :OKLAD_M,'+'DAYS = :DAYS, GRAPHIC_DAY = :GRAPHIC_DAY, KOEF = :KOEF, MANUAL_CALC=:MANUAL_CALC WHERE CONNID = :OLD_CONNID and MONTH_ZA = :OLD_MONTH_ZA and YEAR_ZA = :OLD_YEAR_ZA';
             dxDBGridSumDay_Kalend_Work.Visible:=False;
        end
     else
        begin
             ComboBoxProc.Items.Add('100');
             ComboBoxProc.Items.Add('80');
             ComboBoxProc.Items.Add('60');
             ComboBoxProc.ItemIndex:=1;
             SQLStmnt:='SELECT CONNID,SEL,MONTH_ZA,YEAR_ZA,SUMMA_BUD,SUMMA_VNE,SUMMA_GN,SUMMA_NIS,OKLAD_M,DAYS,GRAPHIC_DAY,KOEF,ShifrIdTMP,Manual_Calc,day_kalend_work FROM TMP_BOLN_SUMMY where CONNID=CURRENT_CONNECTION order by year_za desc,month_za desc';
             UpdateSQLStmnt:='UPDATE TMP_BOLN_SUMMY SET SEL = :SEL, MONTH_ZA = :MONTH_ZA, YEAR_ZA = :YEAR_ZA, SUMMA_BUD = :SUMMA_BUD, SUMMA_VNE = :SUMMA_VNE, SUMMA_GN = :SUMMA_GN, SUMMA_NIS = :SUMMA_NIS, OKLAD_M = :OKLAD_M,'+' DAYS = :DAYS, GRAPHIC_DAY = :GRAPHIC_DAY, KOEF = :KOEF, MANUAL_CALC=:MANUAL_CALC, DAY_KALEND_WORK=:DAY_KALEND_WORK WHERE CONNID = :OLD_CONNID and MONTH_ZA = :OLD_MONTH_ZA and YEAR_ZA = :OLD_YEAR_ZA';
             dxDBGridSumDay_Kalend_Work.Visible:=true;
        end;
     pFIBDataSetSummy.SelectSQL.Clear;
     pFIBDataSetSummy.SelectSQL.Add(SQLStmnt);
     pFIBDataSetSummy.UpdateSQL.Clear;
     pFIBDataSetSummy.UpdateSQL.Add(UpdateSQLStmnt);
     modeWR:=0;
     comboBoxShifrSta.Items.Clear;
     comboBoxShifrSta.ItemIndex:=0;
     if isLNR then
       begin
            comboBoxShifrSta.Items.Add('Больничный');
            comboBoxShifrSta.Items.Add('Декретный');
            comboBoxShifrSta.Items.Add('Уход за ребенком');
            comboBoxShifrSta.Items.Add('Бактерионоситель');
       end
     else
       begin
            comboBoxShifrSta.Items.Add('Лiкарняний');
            comboBoxShifrSta.Items.Add('Вагiтнiсть');
            comboBoxShifrSta.Items.Add('Догляд за дитиною');
       end;
     comboBoxShifrSta.DropDownCount:=comboBoxShifrSta.Items.Count;
{
     if isLNR then
        begin
             rgModeWR.Visible:=true;
             rgModeWR.Enabled:=true;
        end
     else
        begin
             rgModeWR.Visible:=false;
             rgModeWR.Enabled:=false;
        end
 }


end;

procedure TFormUpdBoln.FormShow(Sender: TObject);
begin
      ComboBoxShifrSta.ItemIndex := 0;

      if Mode_Ill_GLO = 1      then ComboBoxShifrSta.ItemIndex:=1
      else if Mode_Ill_GLO = 2 then ComboBoxShifrSta.ItemIndex:=2;
      if isLnr then    // Бактерионоситель
         if mode_ill_GLO=3 then ComboBoxShifrSta.ItemIndex:=3;
      if isSVDN then
         begin
              IF WantedProc=50     THEN ComboBoxProc.ItemIndex:=3
                           ELSE
              IF WantedProc=60     THEN ComboBoxProc.ItemIndex:=2
                           ELSE
              IF WantedProc=70     THEN ComboBoxProc.ItemIndex:=1
                           ELSE ComboBoxProc.ItemIndex:=0;
         end
      else
         begin
              IF WantedProc=60     THEN ComboBoxProc.ItemIndex:=2
                           ELSE
              IF WantedProc=80     THEN ComboBoxProc.ItemIndex:=1
                           ELSE ComboBoxProc.ItemIndex:=0;
         end ;
      if modeWR=1 then
         rgModeWr.ItemIndex:=1
      else
      if modeWR=2 then
         rgModeWr.ItemIndex:=2
      else
         rgModeWr.ItemIndex:=0;

      if WantedMode=10  then
         begin
              Caption:='Командировочные';
              ComboBoxShifrSta.Hide;
              ComboBoxProc.Hide;
              EditNomer_b.Hide;
              EditSwidSS.Hide;
              ComboBoxCodeIll.Hide;
         end
                        else Caption:='Больничные';
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
      ShowSummyMean;
end;

procedure TFormUpdBoln.ComboBoxProcChange(Sender: TObject);
begin
      if isSVDN then
         begin
              IF ComboBoxProc.ItemIndex=1 THEN WantedProc:=70
                                   ELSE
              IF ComboBoxProc.ItemIndex=2 THEN WantedProc:=60
                                   ELSE
              IF ComboBoxProc.ItemIndex=3 THEN WantedProc:=50
                                   ELSE WantedProc:=100;
         end
      else
         begin
              IF ComboBoxProc.ItemIndex=1 THEN WantedProc:=80
                                  ELSE
              IF ComboBoxProc.ItemIndex=2 THEN WantedProc:=60
                                  ELSE WantedProc:=100;
         end;
end;



procedure TFormUpdBoln.dxDBGridSumColumnButtonButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
VAR Y,M:Integer;
begin
     Y := pFIBDataSetSummy.FieldByName('YEAR_ZA').AsInteger;
     M := pFIBDataSetSummy.FieldByName('MONTH_ZA').AsInteger;
     with TFormBolnA.Create(nil) do
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

function TFormUpdBoln.ComplitBoln:boolean;
 begin
      Result:=false;
      if WorkYear<>CurrYear then Exit;
      if WorkMonth<>NMES then Exit;
      if WantedTabno=0 then Exit;
      if  ((WantedProc<50) or (WantedProc>100)) then Exit;
      if  WantedShifrSta<1 then Exit;
      if abs(MEANDAY)<0.01 then Exit;
      if B_Day<1 then Exit;
      Result:=true;
 end;
procedure TFormUpdBoln.SaveClick(Sender: TObject);
var DataVY:TDate;
    SQLStmnt:string;
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
     if not ComplitBoln then
        begin
             ShowMessage('Данные больничного листа не заполнены');
             Exit;
        end;
     Mode_V_Z:=RadioGroupModeZaVy.ItemIndex;
     if Mode_V_Z=1 then Mode_V_Z:=0      // за
                   else Mode_V_Z:=1;     // в

   //  pFIBTransactionSAL.StartTransaction ;
     DataVy:=EnCodeDate(CurrYear,NMES,1);
//EXECUTE PROCEDURE PUTBOLN (?SHIFRID, ?TABNO, ?NOMER_B, ?F_DATA, ?L_DATA, ?DATAVY, ?PROCENT, ?SHIFRSTA, ?B_DAY, ?MEANDAY, ?MEANDAY_BUD, ?MEANDAY_VNE, ?MEANDAY_GN, ?MEANDAY_NIS, ?MODE_V_Z, ?MODE_ILL,?MODEDC,?SWIDSS,?CODE_REASON_ILL,?SHIFRBUH)
     if isLNR then
         if bolnLNRMode2016 then
            SQLStmnt:='EXECUTE PROCEDURE PUTBOLN_01_12_2016('
         else
            SQLStmnt:='EXECUTE PROCEDURE PUTBOLN_01_01_2018('
     else
//        SQLStmnt:='EXECUTE PROCEDURE PUTBOLN(';
        SQLStmnt:='EXECUTE PROCEDURE PUTBOLN_10_05_2018(';
     SQLStmnt:=Trim(SQLStmnt)+intToStr(shifrIdBoln)+',';
     SQLStmnt:=Trim(SQLStmnt)+intToStr(wantedTabno)+',';
     SQLStmnt:=Trim(SQLStmnt)+''''+trim(Copy(NomerB+space(10),1,10))+''',';
     SQLStmnt:=Trim(SQLStmnt)+''''+trim(DateToStr(DateTimePickerFr.Date))+''',';
     SQLStmnt:=Trim(SQLStmnt)+''''+trim(DateToStr(DateTimePickerTo.Date))+''',';
     SQLStmnt:=Trim(SQLStmnt)+''''+trim(DateToStr(DataVy))+''',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(WantedProc))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(wantedShifrSta))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(B_DAY))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(MEANDAY))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(MEANDAY_BUD))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(MEANDAY_VNE))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(MEANDAY_GN))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(FormatFloatPoint(MEANDAY_NIS))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(MODE_V_Z))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(MODE_ILL_GLO))+',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(MODEDC))+',';
     SQLStmnt:=Trim(SQLStmnt)+''''+trim(SWIDSS)+''',';
     SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(WantedCodeIll))+',';
     if isLNR then
        begin
             SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(ShifrBuh));
             if not bolnLNRMode2016 then
                SQLStmnt:=Trim(SQLStmnt)+','+trim(IntToStr(ModeWR));
             SQLStmnt:=trim(SQLStmnt)+')';
        end
     else
        begin
//         SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(ShifrBuh))+')';
             SQLStmnt:=Trim(SQLStmnt)+trim(IntToStr(ShifrBuh));
             SQLStmnt:=Trim(SQLStmnt)+','+trim(IntToStr(ModeWR));
             SQLStmnt:=trim(SQLStmnt)+')';
        end;
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);

     Self.Close;
end;

procedure TFormUpdBoln.BitBtnInitContClick(Sender: TObject);
 var NeedFill:boolean;
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
             ShowMessage('Не выбран работник для начисления больничных.');
             Exit;
        end;
    if GetPassCountBolnForTabno(Self.ShifrIdBoln)<1 then
       begin
            ShowMessage('У этого работника нет больничных листков в базе данных');
            Exit;
       end;
{
    if FormWait.Visible then FormWait.Hide
                        else FormWait.Show;
}
    IsContinueBoln := true;

    NeedFill:=false;
    with TFormSelParentBoln.Create(nil) do
         try
            WantedTabnoForBoln:=Self.WantedTabno;
            SelfShifrIdParentBoln:=Self.ShifrIdBoln;
            WantedFio:=Fio;
            if execute then
               begin
                    Self.ShifrIdParentBoln:=WantadShifrIdParentBoln;
                    NeedFill:=true;
               end
         finally
{            free;}
         end;
         if NeedFill then
            if ShifrIdParentBoln>0 then
               begin
                     FillTmpTables(ShifrIdParentBoln);
                     BitBtn4Click(Sender);
               end;


     //  Self.Repaint;
{
    if FormWait.Visible then FormWait.Hide
                          else FormWait.Show;
}
end;

procedure TFormUpdBoln.EditNomer_BChange(Sender: TObject);
begin
     NomerB:=trim(EditNomer_B.Text);
end;

procedure TFormUpdBoln.TabSheet1Show(Sender: TObject);
begin
      IF (WorkMonth=NMES) OR (WorkYear=CurrYear) THEN
         begin
              BitBtnDelNotSel.Show;
              BitBtnDelNotSel.Enabled:=true;
         end;
end;

procedure TFormUpdBoln.TabSheet2Show(Sender: TObject);
begin
      BitBtnDelNotSel.Hide;
      BitBtnDelNotSel.Enabled:=false;
end;

procedure TFormUpdBoln.TabSheet3Show(Sender: TObject);
begin

      BitBtnDelNotSel.Hide;
      BitBtnDelNotSel.Enabled:=false;
end;

procedure TFormUpdBoln.BitBtnDelNotSelClick(Sender: TObject);
var YearZa,MonthZa:integer;
    SQLStmt:string;
begin
      if ((WorkYear<>CurrYear) OR (WorkMonth<>Flow_Month)) THEN
         begin
               ShowMessage('Изменение больничного возможно только за текущий месяц');
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
                SQLStmt:='delete from tmp_bolna where year_vy='+IntToStr(YearZa)+' and month_vy='+IntToStr(MonthZa)+' and ConnId=CURRENT_CONNECTION'
             else
                SQLStmt:='delete from tmp_bolna where year_za='+IntToStr(YearZa)+' and month_za='+IntToStr(MonthZa)+' and ConnId=CURRENT_CONNECTION';
             if pFIBQuery.Open then
                pFIBQuery.Close;
             pFIBQuery.SQL.Clear;
             pFIBQuery.SQL.Add(SQLStmt);
             pFIBQuery.ExecQuery;
             pFIBQuery.Close;
             pFIBDataSetSel.Next;
        end;
      pFIBDataSetSel.Active:=false;
      SQLStmt:='delete from tmp_boln_summy where ConnId=CURRENT_CONNECTION and SEL=0';
      if not pFIBQuery.Transaction.Active then
         pFIBQuery.Transaction.StartTransaction;
      if pFIBQuery.Open then
         pFIBQuery.Close;
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add(SQLStmt);
      pFIBQuery.ExecQuery;
      pFIBQuery.Close;
      pFIBQuery.Transaction.CommitRetaining;
      if pFIBDataSetSummy.Active then
         begin
               pFIBDataSetSummy.Active:=false;
               pFIBDataSetSummy.Active:=true;
               Application.ProcessMessages;
         end;
      FormWait.Hide;
end;

function TFormUpdBoln.GetPassCountBolnForTabno(ShifrIdB:integer):integer;
 var SQLStmnt:string;
     RetVal:integer;
     I_Start:boolean;
 begin
      RetVal:=0;
      GetPassCountBolnForTabno:=RetVal;
      if WantedTabno<1 then Exit;
      I_Start:=false;
      if not pFIBQuery.Transaction.Active then
         begin
              pFIBQuery.Transaction.StartTransaction;
              I_Start:=true;
         end;
      SQLStmnt:='select count(*) from boln'+
                ' where tabno='+IntToStr(WantedTabno)+' and ShifrId<>'+IntToStr(ShifrIdB);
      FormWait.Show;
      Application.ProcessMessages;
      if pFIBQuery.Open then
         pFIBQuery.Close;
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add(SQLStmnt);
      pFIBQuery.ExecQuery;
      FormWait.Hide;
      RetVal:=pFIBQuery.Fields[0].AsInteger;
      pFIBQuery.Close;
      if I_Start then
         pFIBQuery.Transaction.Commit
      else
         pFIBQuery.Transaction.CommitRetaining;
      GetPassCountBolnForTabno:=RetVal;
 end;




procedure TFormUpdBoln.dxDBGridSumManual_calcChange(Sender: TObject);
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

procedure TFormUpdBoln.dxDBGridSumSELChange(Sender: TObject);
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

procedure TFormUpdBoln.BitBtn5Click(Sender: TObject);
begin
     if ((WorkYear<>CurrYear) OR (WorkMonth<>Flow_Month)) THEN
        begin
              ShowMessage('Инициализация только за текущий месяц');
              Exit;
        end;
     if ((WantedTabno<1) or (WantedTabno>20000)) then
        begin
             ShowMessage('Не выбран работник для начисления больничных.');
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

procedure TFormUpdBoln.RadioGroupModeDCClick(Sender: TObject);
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

procedure TFormUpdBoln.N1Click(Sender: TObject);
var b_day,st:integer;
begin
     if ModeDC<>1 then
        begin
             ShowMessage('Это не почасовой больничный');
             Exit;
        end;
     if pFIBDataSetRes.UpdateTransaction.Active then
        pFIBDataSetRes.UpdateTransaction.Commit;
     b_day:=pFIBDataSetResB_DAY.Value;
     if ((pFIBDataSetRes.State=dsEdit) or (pFIBDataSetRes.State=dsInsert)) then
        pFIBDataSetRes.Post;;
     ModeRecalcClock:=1; {Оставить часы подставленные оператором}

     BitBtn4Click(Sender);
     ModeRecalcClock:=0; {Вернуть режим перерасчета - на обычный}
end;

procedure TFormUpdBoln.dxDBGridResB_DAYChange(Sender: TObject);
begin
     { ShowMessage('Enter');}
end;

procedure TFormUpdBoln.EditSwidSSChange(Sender: TObject);
begin
     SwidSS:=trim(EditSwidSS.Text);

end;

procedure TFormUpdBoln.ComboBoxCodeIllChange(Sender: TObject);
begin
      WantedCodeIll := CodeReasonILL(ComboBoxCodeIll.ItemIndex);
end;

procedure TFormUpdBoln.ComboBoxBuhChange(Sender: TObject);
 var i,j:Integer;
begin
     i:=ComboBoxBuh.ItemIndex;
     if ((i>=0) and (i<BuhList.Count)) then
        begin
             j:=PTemyRec(BuhList.Items[i])^.Shifr;
             ShifrBuh:=j;
        end;

end;

procedure TFormUpdBoln.rgModeWRClick(Sender: TObject);
begin
     if rgModeWR.ItemIndex=1 then modeWr:=1
     else
     if rgModeWR.ItemIndex=2 then modeWr:=2
     else modeWR:=0;

end;

procedure TFormUpdBoln.RadioGroupModeZaVyClick(Sender: TObject);
begin
     if RadioGroupModeZaVy.ItemIndex=0 then
        MODE_V_Z:=1  //В
     else
        MODE_V_Z:=0;

end;

end.
