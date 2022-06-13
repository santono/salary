{$WARNINGS OFF}
{$HINTS OFF}
unit uFormArc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, dxExEdtr, DB, FIBDataSet,
  pFIBDataSet, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  dxEditor, dxEdLib, FIBDatabase, pFIBDatabase, Menus;

type
  TFormArc = class(TForm)
    Fio: TLabel;
    BitBtn1: TBitBtn;
    DateTimePicker1 : TDateTimePicker;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dxDBGridVy: TdxDBGrid;
    pFIBDataSetVy: TpFIBDataSet;
    DataSourceVy: TDataSource;
    pFIBDataSetVySHIFRSTA: TFIBSmallIntField;
    pFIBDataSetVySHORTNAME: TFIBStringField;
    pFIBDataSetVySUMMA: TFIBBCDField;
    pFIBDataSetVyYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetVyMONTH_ZA: TFIBSmallIntField;
    dxDBGridVySHIFRSTA: TdxDBGridMaskColumn;
    dxDBGridVySHORTNAME: TdxDBGridMaskColumn;
    dxDBGridVySUMMA: TdxDBGridCurrencyColumn;
    dxDBGridVyYEAR_ZA: TdxDBGridMaskColumn;
    dxDBGridVyMONTH_ZA: TdxDBGridMaskColumn;
    pFIBDataSetVySHIFRID: TFIBIntegerField;
    pFIBDataSetVyNAME: TFIBStringField;
    dxDBGridVyPodr: TdxDBGridColumn;
    pFIBDataSetVyW_R: TFIBStringField;
    dxDBGridW_R: TdxDBGridColumn;
    pFIBDataSetVyNAMEKAT: TFIBStringField;
    pFIBDataSetVyNAMEGRU: TFIBStringField;
    dxDBGridVyColumnNameGru: TdxDBGridColumn;
    dxDBGridVyColumnNameKat: TdxDBGridColumn;
    dxDBGridVyCode: TdxDBGridColumn;
    pFIBDataSetVyCODE: TFIBStringField;
    dxDBGridZa: TdxDBGrid;
    pFIBDataSetZa: TpFIBDataSet;
    pFIBDataSetZaSHIFRID: TFIBIntegerField;
    pFIBDataSetZaSHIFRSTA: TFIBSmallIntField;
    pFIBDataSetZaSHORTNAME: TFIBStringField;
    pFIBDataSetZaSUMMA: TFIBBCDField;
    pFIBDataSetZaW_R: TFIBStringField;
    pFIBDataSetZaNAMEKAT: TFIBStringField;
    pFIBDataSetZaNAMEGRU: TFIBStringField;
    pFIBDataSetZaNAME: TFIBStringField;
    pFIBDataSetZaCODE: TFIBStringField;
    DataSourceZa: TDataSource;
    dxDBGridZaSHIFRID: TdxDBGridMaskColumn;
    dxDBGridZaSHIFRSTA: TdxDBGridMaskColumn;
    dxDBGridZaSHORTNAME: TdxDBGridMaskColumn;
    dxDBGridZaSUMMA: TdxDBGridCurrencyColumn;
    dxDBGridZaW_R: TdxDBGridMaskColumn;
    dxDBGridZaNAMEKAT: TdxDBGridMaskColumn;
    dxDBGridZaNAMEGRU: TdxDBGridMaskColumn;
    dxDBGridZaNAME: TdxDBGridMaskColumn;
    dxDBGridZaCODE: TdxDBGridMaskColumn;
    pFIBDataSetZaYEAR_VY: TFIBSmallIntField;
    pFIBDataSetZaMONTH_VY: TFIBSmallIntField;
    dxDBGridZaYearVy: TdxDBGridColumn;
    dxDBGridZaMonth_Vy: TdxDBGridColumn;
    BitBtn2: TBitBtn;
    TabSheet3: TTabSheet;
    pFIBDataSetYearVy: TpFIBDataSet;
    DataSourceYearVy: TDataSource;
    pFIBDataSetYearVyMONTH_VY: TFIBIntegerField;
    pFIBDataSetYearVySUMMAADD: TFIBBCDField;
    pFIBDataSetYearVySUMMAMP: TFIBBCDField;
    pFIBDataSetYearVySUMMAKASSA: TFIBBCDField;
    pFIBDataSetYearVySUMMAPOD: TFIBBCDField;
    pFIBDataSetYearVySUMMAPENS: TFIBBCDField;
    pFIBDataSetYearVySUMMASS: TFIBBCDField;
    pFIBDataSetYearVySUMMAFZ: TFIBBCDField;
    pFIBDataSetYearVySUMMAPROF: TFIBBCDField;
    pFIBDataSetYearVySUMMAKVYD: TFIBBCDField;
    dxDBGridYearVy: TdxDBGrid;
    dxDBGridYearVyMONTH_VY: TdxDBGridMaskColumn;
    dxDBGridYearVySUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGridYearVySUMMAMP: TdxDBGridCurrencyColumn;
    dxDBGridYearVySUMMAKASSA: TdxDBGridCurrencyColumn;
    dxDBGridYearVySUMMAPOD: TdxDBGridCurrencyColumn;
    dxDBGridYearVySUMMAPENS: TdxDBGridCurrencyColumn;
    dxDBGridYearVySUMMASS: TdxDBGridCurrencyColumn;
    dxDBGridYearVySUMMAFZ: TdxDBGridCurrencyColumn;
    dxDBGridYearVySUMMAPROF: TdxDBGridCurrencyColumn;
    dxDBGridYearVySUMMAKVYD: TdxDBGridCurrencyColumn;
    TabSheet4: TTabSheet;
    pFIBDataSetYearZa: TpFIBDataSet;
    pFIBDataSetYearZaMONTH_ZA: TFIBIntegerField;
    pFIBDataSetYearZaSUMMAADD: TFIBBCDField;
    pFIBDataSetYearZaSUMMAMP: TFIBBCDField;
    pFIBDataSetYearZaSUMMAKASSA: TFIBBCDField;
    pFIBDataSetYearZaSUMMAPOD: TFIBBCDField;
    pFIBDataSetYearZaSUMMAPENS: TFIBBCDField;
    pFIBDataSetYearZaSUMMASS: TFIBBCDField;
    pFIBDataSetYearZaSUMMAFZ: TFIBBCDField;
    pFIBDataSetYearZaSUMMAPROF: TFIBBCDField;
    pFIBDataSetYearZaSUMMAKVYD: TFIBBCDField;
    DataSourceYearZa: TDataSource;
    dxDBGridYearZa: TdxDBGrid;
    dxDBGridYearZaMONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridYearZaSUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGridYearZaSUMMAMP: TdxDBGridCurrencyColumn;
    dxDBGridYearZaSUMMAKASSA: TdxDBGridCurrencyColumn;
    dxDBGridYearZaSUMMAPOD: TdxDBGridCurrencyColumn;
    dxDBGridYearZaSUMMAPENS: TdxDBGridCurrencyColumn;
    dxDBGridYearZaSUMMASS: TdxDBGridCurrencyColumn;
    dxDBGridYearZaSUMMAFZ: TdxDBGridCurrencyColumn;
    dxDBGridYearZaSUMMAPROF: TdxDBGridCurrencyColumn;
    dxDBGridYearZaSUMMAKVYD: TdxDBGridCurrencyColumn;
    BitBtn3: TBitBtn;
    pFIBDataSetVySHIFRPOD: TFIBIntegerField;
    pFIBDataSetZaSHIFRPOD: TFIBIntegerField;
    dxDBGridVyShifrPod: TdxDBGridColumn;
    dxDBGridZaShifrPod: TdxDBGridColumn;
    pFIBTransactionVy: TpFIBTransaction;
    pFIBTransactionZa: TpFIBTransaction;
    pFIBTransactionYearVy: TpFIBTransaction;
    pFIBTransactionYearZa: TpFIBTransaction;
    TabSheetVyY11: TTabSheet;
    TabSheetZaY11: TTabSheet;
    pFIBDataSetYearVy11: TpFIBDataSet;
    pFIBDataSetYearZa11: TpFIBDataSet;
    pFIBTransactionYearVy11: TpFIBTransaction;
    pFIBTransactionYearZa11: TpFIBTransaction;
    DataSourceYearVy11: TDataSource;
    DataSourceYearZa11: TDataSource;
    pFIBDataSetYearVy11MONTH_VY: TFIBIntegerField;
    pFIBDataSetYearVy11SUMMAADD: TFIBBCDField;
    pFIBDataSetYearVy11SUMMAMP: TFIBBCDField;
    pFIBDataSetYearVy11SUMMAKASSA: TFIBBCDField;
    pFIBDataSetYearVy11SUMMAPOD: TFIBBCDField;
    pFIBDataSetYearVy11SUMMAECB: TFIBBCDField;
    pFIBDataSetYearVy11SUMMAECBN: TFIBBCDField;
    pFIBDataSetYearVy11SUMMAECBILL: TFIBBCDField;
    pFIBDataSetYearVy11SUMMAECBDP: TFIBBCDField;
    pFIBDataSetYearVy11SUMMAPROF: TFIBBCDField;
    pFIBDataSetYearVy11SUMMAKVYD: TFIBBCDField;
    pFIBDataSetYearZa11MONTH_ZA: TFIBIntegerField;
    pFIBDataSetYearZa11SUMMAADD: TFIBBCDField;
    pFIBDataSetYearZa11SUMMAMP: TFIBBCDField;
    pFIBDataSetYearZa11SUMMAKASSA: TFIBBCDField;
    pFIBDataSetYearZa11SUMMAPOD: TFIBBCDField;
    pFIBDataSetYearZa11SUMMAECB: TFIBBCDField;
    pFIBDataSetYearZa11SUMMAECBN: TFIBBCDField;
    pFIBDataSetYearZa11SUMMAECBILL: TFIBBCDField;
    pFIBDataSetYearZa11SUMMAECBDP: TFIBBCDField;
    pFIBDataSetYearZa11SUMMAPROF: TFIBBCDField;
    pFIBDataSetYearZa11SUMMAKVYD: TFIBBCDField;
    dxDBGridYearVy11: TdxDBGrid;
    dxDBGridYearVy11MONTH_VY: TdxDBGridMaskColumn;
    dxDBGridYearVy11SUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGridYearVy11SUMMAMP: TdxDBGridCurrencyColumn;
    dxDBGridYearVy11SUMMAKASSA: TdxDBGridCurrencyColumn;
    dxDBGridYearVy11SUMMAPOD: TdxDBGridCurrencyColumn;
    dxDBGridYearVy11SUMMAECB: TdxDBGridCurrencyColumn;
    dxDBGridYearVy11SUMMAECBN: TdxDBGridCurrencyColumn;
    dxDBGridYearVy11SUMMAECBILL: TdxDBGridCurrencyColumn;
    dxDBGridYearVy11SUMMAECBDP: TdxDBGridCurrencyColumn;
    dxDBGridYearVy11SUMMAPROF: TdxDBGridCurrencyColumn;
    dxDBGridYearVy11SUMMAKVYD: TdxDBGridCurrencyColumn;
    dxDBGridYearZa11: TdxDBGrid;
    dxDBGridYearZa11MONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridYearZa11SUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGridYearZa11SUMMAMP: TdxDBGridCurrencyColumn;
    dxDBGridYearZa11SUMMAKASSA: TdxDBGridCurrencyColumn;
    dxDBGridYearZa11SUMMAPOD: TdxDBGridCurrencyColumn;
    dxDBGridYearZa11SUMMAECB: TdxDBGridCurrencyColumn;
    dxDBGridYearZa11SUMMAECBN: TdxDBGridCurrencyColumn;
    dxDBGridYearZa11SUMMAECBILL: TdxDBGridCurrencyColumn;
    dxDBGridYearZa11SUMMAECBDP: TdxDBGridCurrencyColumn;
    dxDBGridYearZa11SUMMAPROF: TdxDBGridCurrencyColumn;
    dxDBGridYearZa11SUMMAKVYD: TdxDBGridCurrencyColumn;
    tab20114v: TTabSheet;
    DataSource20114v: TDataSource;
    pFIBDataSetYearVy114: TpFIBDataSet;
    pFIBTransaction20114v: TpFIBTransaction;
    pFIBDataSetYearVy114MONTH_VY: TFIBIntegerField;
    pFIBDataSetYearVy114SUMMAADD: TFIBBCDField;
    pFIBDataSetYearVy114SUMMAMP: TFIBBCDField;
    pFIBDataSetYearVy114SUMMAKASSA: TFIBBCDField;
    pFIBDataSetYearVy114SUMMAPOD: TFIBBCDField;
    pFIBDataSetYearVy114SUMMAECB: TFIBBCDField;
    pFIBDataSetYearVy114SUMMAECBN: TFIBBCDField;
    pFIBDataSetYearVy114SUMMAECBILL: TFIBBCDField;
    pFIBDataSetYearVy114SUMMAECBDP: TFIBBCDField;
    pFIBDataSetYearVy114SUMMAPROF: TFIBBCDField;
    pFIBDataSetYearVy114SUMMAKVYD: TFIBBCDField;
    dxDBGridYearVy20114: TdxDBGrid;
    dxDBGridYearVy20114MONTH_VY: TdxDBGridMaskColumn;
    dxDBGridYearVy20114SUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGridYearVy20114SUMMAMP: TdxDBGridCurrencyColumn;
    dxDBGridYearVy20114SUMMAKASSA: TdxDBGridCurrencyColumn;
    dxDBGridYearVy20114SUMMAPOD: TdxDBGridCurrencyColumn;
    dxDBGridYearVy20114SUMMAECB: TdxDBGridCurrencyColumn;
    dxDBGridYearVy20114SUMMAECBN: TdxDBGridCurrencyColumn;
    dxDBGridYearVy20114SUMMAECBILL: TdxDBGridCurrencyColumn;
    dxDBGridYearVy20114SUMMAECBDP: TdxDBGridCurrencyColumn;
    dxDBGridYearVy20114SUMMAPROF: TdxDBGridCurrencyColumn;
    dxDBGridYearVy20114SUMMAKVYD: TdxDBGridCurrencyColumn;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    pFIBDataSetYearVySUMMAWS: TFIBBCDField;
    dxDBGridYearVyWS: TdxDBGridColumn;
    pFIBDataSetYearZaSUMMAWS: TFIBBCDField;
    dxDBGridYearZaWS: TdxDBGridColumn;
    pFIBDataSetYearVy11SUMMAWS: TFIBBCDField;
    dxDBGridYearVy11WS: TdxDBGridColumn;
    pFIBDataSetYearZa11SUMMAWS: TFIBBCDField;
    dxDBGridYearZa11WS: TdxDBGridColumn;
    pFIBDataSetYearVy114SUMMAWS: TFIBBCDField;
    dxDBGridYearVy20114WS: TdxDBGridColumn;
    N2: TMenuItem;
    BitBtn5: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
    FIOS        : String;
    withoutJunFeb:Boolean;
    procedure ShowDataArc;
    procedure PrintSprArc(pFibDataSet:TpFIBDataSet;ModePrt:Integer);
    procedure PrintSprArcYear(pFibDataSet:TpFIBDataSet;ModePrt:Integer);
    procedure PrintSprArcYear2011(pFibDataSet:TpFIBDataSet;ModePrt:Integer);
    procedure PrintSprArcForProkuratura(pFibDataSet:TpFIBDataSet;ModePrt:Integer);

    procedure Switch2011(Flag:boolean);
  public
    Tabno       : Integer;
    WantedMode  : integer;     { Режим вызова 0 с поиском сотрудника 1 для заданного сотрудника }
    WantedYear  : integer;
    WantedMonth : integer;
    WantedData  : TDateTime;
    { Public declarations }
  end;

var
  FormArc: TFormArc;

implementation

uses uFrmFindKadryFB,UFibModule,uFormWait,ScrUtil,ScrDef,UFormView,UFormFIOHistory;

{$R *.dfm}


procedure TFormArc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetVy.Active then
        pFIBDataSetVy.CLose;
     if pFIBDataSetVy.Transaction.Active then
        pFIBDataSetVy.Transaction.Commit;
     if pFIBDataSetZa.Active then
        pFIBDataSetZa.CLose;
     if pFIBDataSetZa.Transaction.Active then
        pFIBDataSetZa.Transaction.Commit;
     if pFIBDataSetYearVy.Active then
        pFIBDataSetYearVy.CLose;
     if pFIBDataSetYearVy.Transaction.Active then
        pFIBDataSetYearVy.Transaction.Commit;
     if pFIBDataSetYearVy.UpdateTransaction.Active then
        pFIBDataSetYearVy.UpdateTransaction.Commit;
     if pFIBDataSetYearZa.Active then
        pFIBDataSetYearZa.CLose;
     if pFIBDataSetYearZa.Transaction.Active then
        pFIBDataSetYearZa.Transaction.Commit;
     if pFIBDataSetYearZa.UpdateTransaction.Active then
        pFIBDataSetYearZa.UpdateTransaction.Commit;
     if pFIBDataSetYearZa11.Active then
        pFIBDataSetYearZa11.CLose;
     if pFIBDataSetYearZa11.Transaction.Active then
        pFIBDataSetYearZa11.Transaction.Commit;
     if pFIBDataSetYearZa11.UpdateTransaction.Active then
        pFIBDataSetYearZa11.UpdateTransaction.Commit;
     if pFIBDataSetYearVy11.Active then
        pFIBDataSetYearVy11.CLose;
     if pFIBDataSetYearVy11.Transaction.Active then
        pFIBDataSetYearVy11.Transaction.Commit;
     if pFIBDataSetYearVy11.UpdateTransaction.Active then
        pFIBDataSetYearVy11.UpdateTransaction.Commit;
     if pFIBDataSetYearVy114.Active then
        pFIBDataSetYearVy114.CLose;
     if pFIBDataSetYearVy114.Transaction.Active then
        pFIBDataSetYearVy114.Transaction.Commit;
     if pFIBDataSetYearVy114.UpdateTransaction.Active then
        pFIBDataSetYearVy114.UpdateTransaction.Commit;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     Action:=caFree;
end;

procedure TFormArc.BitBtn1Click(Sender: TObject);
var WT:integer;
    WF:String; 
begin
{    Tabno:=0;}
    FIOS:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     WT:=GetTabno;
                     WF:=GetFio;
                  {   if FIB.GetRightForSecretWorker(WT) then}
                     if true then
                        begin
                             Self.Tabno := WT;
                             Self.FIOS  := WF;
                             Self.Fio.Caption:=IntToStr(Self.Tabno)+' '+Trim(Fios);
                             Self.Repaint;
                             if pFIBDataSetVy.Active then
                                pFIBDataSetVy.Active:=false;
                             if pFIBDataSetZa.Active then
                                pFIBDataSetZa.Active:=false;
                             if pFIBDataSetYearVy.Active then
                                pFIBDataSetYearVy.Active:=false;
                             if pFIBDataSetYearZa.Active then
                                pFIBDataSetYearZa.Active:=false;
                        end
                     else
                        begin
                             ShowMessage('Нет прав на доступ к аданным этого сотрудника');
                        end;
               end;
         finally
{
            try
               free;
            finally
            end;
}            
          end;

end;

procedure TFormArc.FormCreate(Sender: TObject);
var Year,Month,Day:word;
    i,j:Integer;
    S:String;
    SA:AnsiString;
    SS:Array[1..9] of String;
    maxDate:TDate;
begin
      i:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
      j:=FIB.pFIBDatabaseArc.ActiveTransactionCount;

      WantedMode  :=    0;
      Self.Tabno  :=  277;
      WantedYear  := 2011;
      WantedMonth :=    4;
      FIOS        :=   '';
      WantedData  :=  Now;
      DecodeDate(WantedData, Year, Month, Day);
      WantedYear  := Year;
      WantedMonth := Month-1;
      if WantedMonth<1 then
         begin
              WantedMonth := 12;
              WantedYear  := Year-1;
         end;
      WantedData := EncodeDate(WantedYear, WantedMonth, 1);
      DateTimePicker1.Date := WantedData;
      dxDBGridVyCode.GroupIndex:=0;
      dxDBGridZaCode.GroupIndex:=0;
      if WantedYear>=2011 then Switch2011(true);
      withoutJunFeb:=false;
      if isSVDN then
         begin
               pFIBDataSetYearVySUMMAWS.Visible    := True;
               pFIBDataSetYearVy11SUMMAWS.Visible  := True;
               pFIBDataSetYearZaSUMMAWS.Visible    := True;
               pFIBDataSetYearZa11SUMMAWS.Visible  := True;
               pFIBDataSetYearVy114SUMMAWS.Visible := True;

               dxDBGridYearVyWS.Visible      := True;
               dxDBGridYearZaWS.Visible      := True;
               dxDBGridYearVy11WS.Visible    := True;
               dxDBGridYearZa11WS.Visible    := True;
               dxDBGridYearVy20114WS.Visible := True;
         end
      else
         begin
               pFIBDataSetYearVySUMMAWS.Visible    := False;
               pFIBDataSetYearVy11SUMMAWS.Visible  := False;
               pFIBDataSetYearZaSUMMAWS.Visible    := False;
               pFIBDataSetYearZa11SUMMAWS.Visible  := False;
               pFIBDataSetYearVy114SUMMAWS.Visible := False;

               dxDBGridYearVyWS.Visible      := False;
               dxDBGridYearZaWS.Visible      := False;
               dxDBGridYearVy11WS.Visible    := False;
               dxDBGridYearZa11WS.Visible    := False;
               dxDBGridYearVy20114WS.Visible := False;
         end;
     maxDate:=EncodeDate(WORK_YEAR_VAL,NMES,1);
     maxDate:=EncodeDate(WORK_YEAR_VAL,NMES,LenMonth(maxDate));
     DateTimePicker1.MaxDate:=MaxDate;


end;

procedure TFormArc.DateTimePicker1Change(Sender: TObject);
var Year,Month,Day:word;
begin
     DecodeDate(DateTimePicker1.Date, Year, Month, Day);
     WantedYear  := Year;
     WantedMonth := Month;
     if pFIBDataSetVy.Active then
        pFIBDataSetVy.Active:=false;
     if pFIBDataSetZa.Active then
        pFIBDataSetZa.Active:=false;
     if pFIBDataSetYearVy.Active then
        pFIBDataSetYearVy.Active:=false;
     if pFIBDataSetYearZa.Active then
        pFIBDataSetYearZa.Active:=false;
     if pFIBDataSetYearVy11.Active then
        pFIBDataSetYearVy11.Active:=false;
     if pFIBDataSetYearVy114.Active then
        pFIBDataSetYearVy114.Active:=false;
     if pFIBDataSetYearZa11.Active then
        pFIBDataSetYearZa11.Active:=false;
     if WantedYear<2011 then
        Switch2011(false)
     else
        Switch2011(true);
end;

procedure TFormArc.Switch2011(Flag:boolean);
 begin
      if Flag then
         begin
              // PageControl1.TabIndex
               TabSheet3.Visible        := false;
               TabSheet3.TabVisible     := false;
               TabSheet3.Enabled        := false;
               TabSheet4.Visible        := false;
               TabSheet4.TabVisible     := false;
               TabSheet4.Enabled        := false;
               TabSheetVyY11.Visible    := true;
               TabSheetVyY11.TabVisible := true;
               TabSheetVyY11.Enabled    := true;
               TabSheetZaY11.Visible    := true;
               TabSheetZaY11.TabVisible := true;
               TabSheetZaY11.Enabled    := true;
               Tab20114v.Visible        := true;
               Tab20114v.TabVisible     := true;
               Tab20114v.Enabled        := true;
         end
      else
         begin
               TabSheet3.Visible        := true;
               TabSheet3.TabVisible     := true;
               TabSheet3.Enabled        := true;
               TabSheet4.Visible        := true;
               TabSheet4.TabVisible     := true;
               TabSheet4.Enabled        := true;
               TabSheetVyY11.Visible    := false;
               TabSheetVyY11.TabVisible := false;
               TabSheetVyY11.Enabled    := false;
               TabSheetZaY11.Visible    := false;
               TabSheetZaY11.TabVisible := false;
               TabSheetZaY11.Enabled    := false;
               Tab20114v.Visible        := false;
               Tab20114v.TabVisible     := false;
               Tab20114v.Enabled        := false;
         end;
      Application.ProcessMessages;
 end;

procedure TFormArc.ShowDataArc;
 var i,j:integer;
begin
      i:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
      j:=FIB.pFIBDatabaseArc.ActiveTransactionCount;
      if not pFIBDataSetVy.Transaction.Active then
         pFIBDataSetVy.Transaction.StartTransaction;
      if pFIBDataSetVy.Active then
         pFIBDataSetVy.Close;
      i:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
      j:=FIB.pFIBDatabaseArc.ActiveTransactionCount;
      pFIBDataSetVy.Params[0].AsString:=IntToStr(Self.Tabno);
      pFIBDataSetVy.Params[1].AsString:=IntToStr(WantedYear);
      pFIBDataSetVy.Params[2].AsString:=IntToStr(WantedMonth);
      i:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
      j:=FIB.pFIBDatabaseArc.ActiveTransactionCount;
  {    pFIBDataSetVy.Prepare;}
      i:=FIB.pFIBDatabaseSal.ActiveTransactionCount;
      j:=FIB.pFIBDatabaseArc.ActiveTransactionCount;
      pFIBDataSetVy.Open;

      if pFIBDataSetZa.Active then
         pFIBDataSetZa.Active:=false;
      pFIBDataSetZa.Params[0].AsString:=IntToStr(Self.Tabno);
      pFIBDataSetZa.Params[1].AsString:=IntToStr(WantedYear);
      pFIBDataSetZa.Params[2].AsString:=IntToStr(WantedMonth);
{      pFIBDataSetZa.Prepare;    }
      pFIBDataSetZa.Open;


      if pFIBDataSetYearVy.Active then
         pFIBDataSetYearVy.Active:=false;
      pFIBDataSetYearVy.Params[0].AsString:=IntToStr(Self.Tabno);
      pFIBDataSetYearVy.Params[1].AsString:=IntToStr(WantedYear);
{      pFIBDataSetYearVy.Prepare;  }
      pFIBDataSetYearVy.Open;

      if pFIBDataSetYearZa.Active then
         pFIBDataSetYearZa.Active:=false;
      pFIBDataSetYearZa.Params[0].AsString:=IntToStr(Self.Tabno);
      pFIBDataSetYearZa.Params[1].AsString:=IntToStr(WantedYear);
{      pFIBDataSetYearZa.Prepare;   }
      pFIBDataSetYearZa.Open;

      if not pFIBDataSetYearVy11.Transaction.Active then
         pFIBDataSetYearVy11.Transaction.StartTransaction;

      if pFIBDataSetYearVy11.Active then
         pFIBDataSetYearVy11.Active:=false;
      pFIBDataSetYearVy11.Params[0].AsString:=IntToStr(Self.Tabno);
      pFIBDataSetYearVy11.Params[1].AsString:=IntToStr(WantedYear);
      pFIBDataSetYearVy11.Open;

      if not pFIBDataSetYearZa11.Transaction.Active then
         pFIBDataSetYearZa11.Transaction.StartTransaction;

      if pFIBDataSetYearZa11.Active then
         pFIBDataSetYearZa11.Active:=false;
      pFIBDataSetYearZa11.Params[0].AsString:=IntToStr(Self.Tabno);
      pFIBDataSetYearZa11.Params[1].AsString:=IntToStr(WantedYear);
      pFIBDataSetYearZa11.Open;

      if not pFIBDataSetYearVy114.Transaction.Active then
         pFIBDataSetYearVy114.Transaction.StartTransaction;

      if pFIBDataSetYearVy114.Active then
         pFIBDataSetYearVy114.Active:=false;
      pFIBDataSetYearVy114.Params[0].AsString:=IntToStr(Self.Tabno);
      pFIBDataSetYearVy114.Params[1].AsString:=IntToStr(WantedYear);
      pFIBDataSetYearVy114.Open;
    //  i:=pFIBDataSetYearVy114.RecordCount;

end;


procedure TFormArc.BitBtn2Click(Sender: TObject);
begin
      FormWait.Show;
      Application.ProcessMessages;
      ShowDataArc;
      FormWait.Hide;
end;

procedure TFormArc.PrintSprArc(pFibDataSet:TpFIBDataSet;ModePrt:Integer);
const H:array[1..3] of string=(
'------------------------------------------------------------------------------------------',
':Шфр:   Наименование     :  Сумма   :В-р:Мц:Год :Категор.:Группа:Пдр:   Подразделение    :',
':---:--------------------:----------:---:--:----:--------:------:---:--------------------:');
var Dev:TextFile;
    FName:String;
    SummaAdd:Real;
    S:String;
    i:integer;
begin
      if not pFibDataSet.Active then Exit;
      FName:=CDOC+IntToStr(Tabno)+'.txt';
      AssignFile(Dev,FName);
      {$i-}
      ReWrite(Dev);
      {$i+}
      if ioresult<>0 then
         begin
              ShowMessage('Ошибка '+IntToStr(ioresult)+' при работе с файлом '+FName);
              Exit;
         end;
      if ModePrt=0 then
         S:='Заработная плата '+IntToStr(Tabno)+' '+Trim(FioS)+' в '+IntToStr(WantedMonth)+' '+IntToSTr(WantedYear)+' г.'
                   else
         S:='Заработная плата '+IntToStr(Tabno)+' '+Trim(FioS)+' за '+IntToStr(WantedMonth)+' '+IntToSTr(WantedYear)+' г.';
      writeln(dev,S);
      for i:=1 to 3 do  writeln(dev,h[i]);
      pFIBDataSet.First;
      SummaAdd:=0;
      if not pFIBDataSet.Eof then
         repeat
            if pFIBDataSet.FieldByName('Code').AsString='Начислено' then
               begin
                    S:=':'+Format('%3d',[pFIBDataSet.FieldByName('ShifrSta').AsInteger])+':';
                    S:=S+Format('%-20.20s',[pFIBDataSet.FieldByName('ShortName').AsString])+':';
                    S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('Summa').AsFloat])+':';
                    S:=S+Format('%-3.3s',[pFIBDataSet.FieldByName('W_R').AsString])+':';
                    if ModePrt=0 then
                       begin
                            S:=S+Format('%2d',[pFIBDataSet.FieldByName('MONTH_ZA').AsInteger])+':';
                            S:=S+Format('%4d',[pFIBDataSet.FieldByName('YEAR_ZA').AsInteger])+':';
                       end
                                 else
                       begin
                            S:=S+Format('%2d',[pFIBDataSet.FieldByName('MONTH_VY').AsInteger])+':';
                            S:=S+Format('%4d',[pFIBDataSet.FieldByName('YEAR_VY').AsInteger])+':';
                       end;
                    S:=S+Format('%-8.8s',[pFIBDataSet.FieldByName('NameKat').AsString])+':';
                    S:=S+Format('%-6.6s',[pFIBDataSet.FieldByName('NameGru').AsString])+':';
                    S:=S+Format('%-3d',[pFIBDataSet.FieldByName('ShifrPod').AsInteger])+':';
                    S:=S+Format('%-20.20s',[copy(pFIBDataSet.FieldByName('Name').AsString+space(20),1,20)])+':';
                    SummaAdd:=SummaAdd+pFIBDataSet.FieldByName('Summa').AsFloat;
                    writeln(Dev,S);
               end;
            pFIBDataSet.Next;
         until pFIBDataSet.eof;
      writeln(Dev,h[3]);
      S:=':   :  Итого начислено   :'+Format('%10.2f',[SummaAdd])+':';
      S:=trim(S)+'   :  :    :        :      :                    :';
      writeln(Dev,S);
      writeln(Dev,h[3]);

      pFIBDataSet.First;
      SummaAdd:=0;
      if not pFIBDataSet.Eof then
         repeat
            if pFIBDataSet.FieldByName('Code').AsString<>'Начислено' then
               begin
                    S:=':'+Format('%3d',[pFIBDataSet.FieldByName('ShifrSta').AsInteger])+':';
                    S:=S+Format('%-20.20s',[pFIBDataSet.FieldByName('ShortName').AsString])+':';
                    S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('Summa').AsFloat])+':';
                    S:=S+Format('%-3.3s',[pFIBDataSet.FieldByName('W_R').AsString])+':';
                    if ModePrt=0 then
                       begin
                            S:=S+Format('%2d',[pFIBDataSet.FieldByName('MONTH_ZA').AsInteger])+':';
                            S:=S+Format('%4d',[pFIBDataSet.FieldByName('YEAR_ZA').AsInteger])+':';
                       end
                                 else
                       begin
                            S:=S+Format('%2d',[pFIBDataSet.FieldByName('MONTH_VY').AsInteger])+':';
                            S:=S+Format('%4d',[pFIBDataSet.FieldByName('YEAR_VY').AsInteger])+':';
                       end;
                    S:=S+Format('%-8.8s',[pFIBDataSet.FieldByName('NameKat').AsString])+':';
                    S:=S+Format('%-6.6s',[pFIBDataSet.FieldByName('NameGru').AsString])+':';
                    S:=S+Format('%-20.20s',[copy(pFIBDataSet.FieldByName('Name').AsString+space(20),1,20)])+':';
                    SummaAdd:=SummaAdd+pFIBDataSet.FieldByName('Summa').AsFloat;
                    writeln(Dev,S);
               end;
            pFIBDataSet.Next;
         until pFIBDataSet.eof;
      writeln(Dev,h[3]);
      S:=':   :  Итого удержано    :'+Format('%10.2f',[SummaAdd])+':';
      S:=trim(S)+'   :  :    :        :      :                    :';
      writeln(Dev,S);
      writeln(Dev,h[1]);
      CloseFile(Dev);
      View(FName);
end;

procedure TFormArc.PrintSprArcForProkuratura(pFibDataSet:TpFIBDataSet;ModePrt:Integer);
const H:array[1..3] of string=(
'-------------------------------------------------------------',
':Шфр:   Найменування     :   Сума   :Мц:Рік :Категор.:Група :',
':---:--------------------:----------:--:----:--------:------:');
type PItemAdd=^TItemAdd;
     TItemAdd=record
                ShifrId   : Integer;
                ShifrSta  : Integer;
                ShortName : string;
                Summa     : Real;
                NameKat   : string;
                NameGru   : string;
                Year_Vy   : Integer;
                Month_Vy  : Integer;
              end;
var Dev:TextFile;
    FName:String;
    SummaAdd:Real;
    S:String;
    i:integer;
    ListAdd  : TList;
    ListUd   : TList;
    procedure FillListAdd(Mode:integer=0);    {0-Начисления 1-удержания}
      var WantedWord : string;
          Finished   : boolean;
          I          : Integer;
          SummaMinus : real;
          NameGru    : string;
          ShifrSta   : Integer;
          PListItem  : PItemAdd;
          NomerRec   : Integer;
      begin
           ListAdd:=TList.Create;
           pFIBDataSet.First;
           if not pFIBDataSet.Eof then
              repeat
                  if (
                     ((Mode=0) and (pFIBDataSet.FieldByName('Code').AsString='Начислено')) or
                     ((Mode=1) and (pFIBDataSet.FieldByName('Code').AsString<>'Начислено'))
                     ) then
                     begin
                          New(PListItem);
                          ShifrSta := pFIBDataSet.FieldByName('ShifrSta').AsInteger;
                          NameGru  := pFIBDataSet.FieldByName('NameGru').AsString;
                          if ShifrSta = 2 then
                             if Trim('NameGru')<>'811/4' then
                                NameGru:='811/4';
                          PListItem.ShifrId   := pFIBDataSet.FieldByName('ShifrId').AsInteger;
                          PListItem.ShifrSta  := ShifrSta;
                          PListItem.ShortName := pFIBDataSet.FieldByName('ShortName').AsString;
                          PListItem.Summa     := pFIBDataSet.FieldByName('Summa').AsFloat;
                          PListItem.NameGru   := NameGru;
                          PListItem.NameKat   := pFIBDataSet.FieldByName('NameKat').AsString;
                         if ModePrt=0 then
                            begin
                                 PListItem.Year_Vy:=pFIBDataSet.FieldByName('YEAR_ZA').AsInteger;
                                 PListItem.Month_Vy:=pFIBDataSet.FieldByName('MONTH_ZA').AsInteger;
                            end
                                      else
                            begin
                                 PListItem.Year_Vy:=pFIBDataSet.FieldByName('YEAR_VY').AsInteger;
                                 PListItem.Month_Vy:=pFIBDataSet.FieldByName('MONTH_VY').AsInteger;
                            end;

                          ListAdd.Add(PListItem);
                     end;

                   pFIBDataSet.Next;
              until pFIBDataSet.eof;
           // Корректирование минусов
           if ListAdd.Count=0 then Exit;
           while True do
            begin
                 finished:=True;
                 ShifrSta:=0;
                 NomerRec:=-1;
                 for i:=0 to ListAdd.Count-1 do
                     begin
                          if PItemAdd(ListAdd.Items[i]).Summa<-0.01 then
                             begin
                                  SummaMinus := PItemAdd(ListAdd.Items[i]).Summa;
                                  ShifrSta   := PItemAdd(ListAdd.Items[i]).ShifrSta;
                                  NomerRec   := i;
                                  Break;
                             end;
                     end;
                 if NomerRec>=0 then
                    if ListAdd.Count>1 then
                       for i:=0 to ListAdd.Count-1 do
                           if PItemAdd(ListAdd.Items[i]).ShifrSta=ShifrSta then
                              if PItemAdd(ListAdd.Items[i]).Summa>=Abs(SummaMinus) then
                                 begin
                                      PItemAdd(ListAdd.Items[i]).Summa:=PItemAdd(ListAdd.Items[i]).Summa+SummaMinus;
                                      Finished:=False;
                                      ListAdd.Delete(NomerRec);
                                      break;
                                 end;
                 if Finished then Break;
            end;
           if ListAdd.Count=0 then Exit;
           while True do
            begin
                 finished:=True;
                 if ListAdd.Count>0 then 
                 for i:=0 to ListAdd.Count-1 do
                     begin
                          if abs(PItemAdd(ListAdd.Items[i]).Summa)<0.01 then
                             begin
                                  NomerRec   := i;
                                  ListAdd.Delete(NomerRec);
                                  Finished:=False;
                                  Break;
                             end;
                     end;
                 if Finished then Break;
            end;


      end;
begin  { Начало печати для прокуратуры }
      if not pFibDataSet.Active then Exit;
      FName:=CDOC+IntToStr(Tabno)+'.txt';
      AssignFile(Dev,FName);
      {$i-}
      ReWrite(Dev);
      {$i+}
      if ioresult<>0 then
         begin
              ShowMessage('Ошибка '+IntToStr(ioresult)+' при работе с файлом '+FName);
              Exit;
         end;
      if ModePrt=0 then
         S:='Зарабітна плата '+IntToStr(Tabno)+' '+Trim(FioS)+' в '+GetMonthUkr(WantedMonth)+' '+IntToSTr(WantedYear)+' р.'
                   else
         S:='Зарабітна плата '+IntToStr(Tabno)+' '+Trim(FioS)+' за '+GetMonthUkr(WantedMonth)+' '+IntToSTr(WantedYear)+' р.';
      writeln(dev,S);
      for i:=1 to 3 do  writeln(dev,h[i]);
      FillListAdd(0);
      SummaAdd:=0;
      if ListAdd.Count>0 then
         for i:=0 to ListAdd.Count-1 do
             begin
                    S:=':'+Format('%3d',[pItemAdd(ListAdd.Items[i]).ShifrSta])+':';
                    S:=S+Format('%-20.20s',[pItemAdd(ListAdd.Items[i]).ShortName])+':';
                    S:=S+Format('%10.2f',[pItemAdd(ListAdd.Items[i]).Summa])+':';
                    S:=S+Format('%2d',[pItemAdd(ListAdd.Items[i]).Month_Vy])+':';
                    S:=S+Format('%4d',[pItemAdd(ListAdd.Items[i]).Year_Vy])+':';
                    S:=S+Format('%-8.8s',[pItemAdd(ListAdd.Items[i]).NameKat])+':';
                    S:=S+Format('%-6.6s',[pItemAdd(ListAdd.Items[i]).NameGru])+':';
                    SummaAdd:=SummaAdd+pItemAdd(ListAdd.Items[i]).Summa;
                    writeln(Dev,S);
             end;
      if ListAdd.Count>0 then
         for i:=0 to ListAdd.Count-1 do
             Dispose(PItemAdd(ListAdd.Items[i]));
      ListAdd.Free;
      ListAdd:=nil;
      writeln(Dev,h[3]);
      S:=':   :  Усьго нараховано  :'+Format('%10.2f',[SummaAdd])+':';
      S:=trim(S)+'  :    :        :      :';
      writeln(Dev,S);
      writeln(Dev,h[3]);

      FillListAdd(1);
      SummaAdd:=0;
      if ListAdd.Count>0 then
         for i:=0 to ListAdd.Count-1 do
             begin
                    S:=':'+Format('%3d',[pItemAdd(ListAdd.Items[i]).ShifrSta])+':';
                    S:=S+Format('%-20.20s',[pItemAdd(ListAdd.Items[i]).ShortName])+':';
                    S:=S+Format('%10.2f',[pItemAdd(ListAdd.Items[i]).Summa])+':';
                    S:=S+Format('%2d',[pItemAdd(ListAdd.Items[i]).Month_Vy])+':';
                    S:=S+Format('%4d',[pItemAdd(ListAdd.Items[i]).Year_Vy])+':';
                    S:=S+Format('%-8.8s',[pItemAdd(ListAdd.Items[i]).NameKat])+':';
                    S:=S+Format('%-6.6s',[pItemAdd(ListAdd.Items[i]).NameGru])+':';
                    SummaAdd:=SummaAdd+pItemAdd(ListAdd.Items[i]).Summa;
                    writeln(Dev,S);
             end;
      if ListAdd.Count>0 then
         for i:=0 to ListAdd.Count-1 do
             Dispose(PItemAdd(ListAdd.Items[i]));
      ListAdd.Free;
      ListAdd:=nil;
      writeln(Dev,h[3]);
      S:=':   :  Усього утримано   :'+Format('%10.2f',[SummaAdd])+':';
      S:=trim(S)+'  :    :        :      :';
      writeln(Dev,S);
      writeln(Dev,h[1]);
      CloseFile(Dev);
      View(FName);
end;



procedure TFormArc.BitBtn3Click(Sender: TObject);
begin
     if Tabno=0 or Length(Trim(FioS)) then Exit;
{     if PageControl1.TabIndex mod 2 = 0 then     }
     case PageControl1.TabIndex of
      0:PrintSprArc(pFIBDataSetVy,0);
      1:PrintSprArc(pFIBDataSetZa,1);
      2:if WantedYear>2010 then
           PrintSprArcYear2011(pFIBDataSetYearVy11,0)
        else
           PrintSprArcYear(pFIBDataSetYearVy,0);
      3:if WantedYear>2010 then
           PrintSprArcYear2011(pFIBDataSetYearZa11,1)
        else
           PrintSprArcYear(pFIBDataSetYearZa,1);
      4:PrintSprArcYear(pFIBDataSetYearVy114,0);
     end;


end;

procedure TFormArc.FormShow(Sender: TObject);
{var FIOS:String;   }
begin
     if ((WantedMode>0) and (Tabno>0)) then
        begin
              BitBtn1.Hide;
              FIB.pFIBQuery.SQL.Clear;
              FIB.pFIBQuery.SQL.Add('SELECT FIO FROM KADRY WHERE TABNO='+IntToSTr(Self.Tabno));
              FIB.pFIBTransactionSal.StartTransaction;
              try
{
                         FormWait.Show;
                         Application.ProcessMessages;
}
                 FIB.pFIBQuery.ExecQuery;
                 FIOS:=FIB.pFIBQuery.Fields[0].AsString;
{                         FormWait.Hide;}
                 FIB.pFIBQuery.Close;
              except
                    MessageDlg('Ошибка getFIO from ckadry',mtInformation, [mbOk], 0);
                    Exit;
              end;
              FIB.pFIBTransactionSal.Commit;
              Self.Fio.Caption:=IntToStr(Self.Tabno)+' '+Trim(Fios);
              BitBtn2Click(Sender);
        end
     else
        BitBtn1.Show;
end;

procedure TFormArc.BitBtn4Click(Sender: TObject);
begin
     if Tabno=0 or Length(Trim(FioS)) then Exit;
{     if PageControl1.TabIndex mod 2 = 0 then     }
     case PageControl1.TabIndex of
      0:PrintSprArcForProkuratura(pFIBDataSetVy,0);
      1:PrintSprArcForProkuratura(pFIBDataSetZa,1);
      2:if (WantedYear>2010) then
           PrintSprArcYear2011(pFIBDataSetYearVy11,0)
        else
           PrintSprArcYear(pFIBDataSetYearVy,0);
      3:if (WantedYear>2010) then
           PrintSprArcYear(pFIBDataSetYearZa11,1)
        else
           PrintSprArcYear(pFIBDataSetYearZa,1);
      4: if (WantedYear>2010) then
            PrintSprArcYear(pFIBDataSetYearVy114,0);
     end;

end;
procedure TFormArc.PrintSprArcYear(pFibDataSet:TpFIBDataSet;ModePrt:Integer);
const H:array[1..3] of string=(
'--------------------------------------------------------------------------------------------------------',
':М-ц:Сумма нач.:Сумма М П :Сумма касс:Под.налог :Пенс.налог:Соц.страх.:Фонд.заня.:Профсоюзн.: К выдаче :',
':---:----------:----------:----------:----------:----------:----------:----------:----------:----------:');
var Dev      : TextFile;
    FName    : String;
  //  SummaAdd : Real;
    S        : String;
    i        : integer;
    i_month  : integer;
    SummaAdd   : real;
    SummaMP    : real;
    SummaKassa : real;
    SummaPod   : real;
    SummaPens  : real;
    SummaSS    : real;
    SummaFZ    : real;
    SummaProf  : real;
    SummaKVyd  : Real;
begin
      if not pFibDataSet.Active then Exit;
      if WantedYear>2010 then
         begin
              PrintSprArcYear2011(pFibDataSet,ModePrt);
              Exit;

         end;
      FName:=CDOC+IntToStr(Tabno)+'y.txt';
      AssignFile(Dev,FName);
      ReWrite(Dev);
      if ModePrt=0 then
         S:='Заработная плата '+IntToStr(Tabno)+' '+Trim(FioS)+' в ' +IntToSTr(WantedYear)+' г.'
                   else
         S:='Заработная плата '+IntToStr(Tabno)+' '+Trim(FioS)+' за '+IntToStr(WantedYear)+' г.';
      writeln(dev,S);
      for i:=1 to 3 do  writeln(dev,h[i]);
      i_month:=0;
      pFIBDataSet.First;
      SummaAdd:=0;
      if not pFIBDataSet.Eof then
         repeat
               inc(I_Month);
               if ModePrt=0 then
                  S:=':'+Format('%3d',[pFIBDataSet.FieldByName('MONTH_VY').AsInteger])+':'
                            else
                  S:=':'+Format('%3d',[pFIBDataSet.FieldByName('MONTH_ZA').AsInteger])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaAdd').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaMP').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaKassa').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaPOD').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaPens').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaSS').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaFZ').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaPROF').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaKVYD').AsFloat])+':';
               writeln(Dev,S);
                pFIBDataSet.Next;
         until pFIBDataSet.eof;
      writeln(Dev,h[3]);
      CloseFile(Dev);
      View(FName);
end;

procedure TFormArc.PrintSprArcYear2011(pFibDataSet:TpFIBDataSet;ModePrt:Integer);
const H:array[1..3] of string=(
{$IFDEF SVDN}
'------------------------------------------------------------------------------------------------------------------------------',
':М-ц:Сумма нач.:Сумма М П :Сумма касс:Налог с д.:  ЕСВ Н   :  ЕСВ     : ЕСВ(бол) :  ЕСВ(ДП) :Профсоюзн.:  В.сбор  : К выдаче :',
':---:----------:----------:----------:----------:----------:----------:----------:----------:----------:----------:----------:');
{$ELSE}
'-------------------------------------------------------------------------------------------------------------------',
':М-ц:Сумма нач.:Сумма М П :Сумма касс:Налог с д.:  ЕСВ Н   :  ЕСВ     : ЕСВ(бол) :  ЕСВ(ДП) :Профсоюзн.: К выдаче :',
':---:----------:----------:----------:----------:----------:----------:----------:----------:----------:----------:');
{$ENDIF}
var Dev      : TextFile;
    FName    : String;
  //  SummaAdd : Real;
    S        : String;
    i        : integer;
    i_month  : integer;
    SummaAdd   : real;
    SummaMP    : real;
    SummaKassa : real;
    SummaPod   : real;
    SummaECBN  : real;
    SummaECB   : real;
    SummaECBILL: real;
    SummaECBDP : real;
    SummaProf  : real;
    SummaKVyd  : Real;
    SummaWS    : Real;
begin
      if not pFibDataSet.Active then Exit;
      FName:=CDOC+IntToStr(Tabno)+'y.txt';
      AssignFile(Dev,FName);
      ReWrite(Dev);
      if ModePrt=0 then
         S:='Заработная плата '+IntToStr(Tabno)+' '+Trim(FioS)+' в ' +IntToSTr(WantedYear)+' г.'
                   else
         S:='Заработная плата '+IntToStr(Tabno)+' '+Trim(FioS)+' за '+IntToStr(WantedYear)+' г.';
      SummaAdd   := 0 ;
      SummaMP    := 0 ;
      SummaKassa := 0 ;
      SummaPod   := 0 ;
      SummaECBN  := 0 ;
      SummaECB   := 0 ;
      SummaECBILL:= 0 ;
      SummaECBDP := 0 ;
      SummaProf  := 0 ;
      SummaKVyd  := 0 ;
      SummaWS    := 0 ;
      writeln(dev,S);
      for i:=1 to 3 do  writeln(dev,h[i]);
      i_month:=0;
      pFIBDataSet.First;
      SummaAdd:=0;
      if not pFIBDataSet.Eof then
         repeat
               inc(I_Month);
               if withoutJunFeb then
               if i_month in [1,2] then
                  begin
                       pFIBDataSet.Next;
                       Continue;
                  end;
               if ModePrt=0 then

                  S:=':'+Format('%3d',[pFIBDataSet.FieldByName('MONTH_VY').AsInteger])+':'
                            else
                  S:=':'+Format('%3d',[pFIBDataSet.FieldByName('MONTH_ZA').AsInteger])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaAdd').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaMP').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaKassa').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaPOD').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaECBN').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaECB').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaECBIll').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaECBDP').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaPROF').AsFloat])+':';
               if isSVDN then
                  S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaWS').AsFloat])+':';
               S:=S+Format('%10.2f',[pFIBDataSet.FieldByName('SummaKVYD').AsFloat])+':';

               writeln(Dev,S);
               SummaAdd   := SummaAdd    + pFIBDataSet.FieldByName('SummaAdd').AsFloat;
               SummaMP    := SummaMP     + pFIBDataSet.FieldByName('SummaMP').AsFloat;
               SummaKassa := SummaKassa  + pFIBDataSet.FieldByName('SummaKassa').AsFloat;
               SummaPod   := SummaPod    + pFIBDataSet.FieldByName('SummaPOD').AsFloat;
               SummaECBN  := SummaECBN   + pFIBDataSet.FieldByName('SummaECBN').AsFloat;
               SummaECB   := SummaECB    + pFIBDataSet.FieldByName('SummaECB').AsFloat;
               SummaECBILL:= SummaECBILL + pFIBDataSet.FieldByName('SummaECBIll').AsFloat;
               SummaECBDP := SummaECBDP  + pFIBDataSet.FieldByName('SummaECBDp').AsFloat;
               SummaProf  := SummaProf   + pFIBDataSet.FieldByName('SummaProf').AsFloat;
               SummaKVyd  := SummaKVyd   + pFIBDataSet.FieldByName('SummaKVyd').AsFloat;
               if isSVDN then
                  SummaWS  := SummaWS   + pFIBDataSet.FieldByName('SummaWS').AsFloat;

               pFIBDataSet.Next;
         until pFIBDataSet.eof;
      writeln(Dev,h[3]);
      S:=':Итг:';
      S:=S+Format('%10.2f',[SummaAdd])   + ':';
      S:=S+Format('%10.2f',[SummaMP])    + ':';
      S:=S+Format('%10.2f',[SummaKassa]) + ':';
      S:=S+Format('%10.2f',[SummaPOD])   + ':';
      S:=S+Format('%10.2f',[SummaECBN])  + ':';
      S:=S+Format('%10.2f',[SummaECB])   + ':';
      S:=S+Format('%10.2f',[SummaECBIll])+ ':';
      S:=S+Format('%10.2f',[SummaECBDP]) + ':';
      S:=S+Format('%10.2f',[SummaPROF])  + ':';
      if isSVDN then
         S:=S+Format('%10.2f',[SummaWS])  + ':';
      S:=S+Format('%10.2f',[SummaKVYD])  + ':';
      writeln(Dev,S);
      writeln(Dev,h[3]);
      CloseFile(Dev);
      View(FName);
end;


procedure TFormArc.N1Click(Sender: TObject);
begin
    withoutJunFeb:=true;
    BitBtn3Click(Nil);
    withoutJunFeb:=false;

end;

procedure TFormArc.N2Click(Sender: TObject);

begin
      FormFIOHistory:=TFormFIOHistory.CreateByTabno(Self,tabno,fios);
      FormFIOHistory.showModal;
end;

procedure TFormArc.BitBtn5Click(Sender: TObject);
begin
      FormFIOHistory:=TFormFIOHistory.CreateByTabno(Self,tabno,fios);
      FormFIOHistory.showModal;

end;

end.
