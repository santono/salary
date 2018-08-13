{$WARNINGS OFF}
{$HINTS OFF}
unit UFormAnalyzeNalogi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, ComCtrls,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms, ImgList,
  ExtCtrls, StdCtrls,ScrDef, Buttons;

type
  TFormAnalyzeNalogi = class(TForm)
    PageControlNal: TPageControl;
    TabSheetPod: TTabSheet;
    TabSheetECBN: TTabSheet;
    TabSheetECB: TTabSheet;
    TabSheetECBDP: TTabSheet;
    TabSheetIll: TTabSheet;
    pFIBDataSetPod: TpFIBDataSet;
    pFIBTransactionPodR: TpFIBTransaction;
    pFIBDataSetPodSHIFRIDPERSON: TFIBIntegerField;
    pFIBDataSetPodYEARVY: TFIBIntegerField;
    pFIBDataSetPodMONTHVY: TFIBIntegerField;
    pFIBDataSetPodDOLG: TFIBStringField;
    pFIBDataSetPodSHIFRKAT: TFIBIntegerField;
    pFIBDataSetPodKATNAME: TFIBStringField;
    pFIBDataSetPodSHIFRGRU: TFIBIntegerField;
    pFIBDataSetPodGRUNAME: TFIBStringField;
    pFIBDataSetPodKOEF: TFIBBCDField;
    pFIBDataSetPodW_R: TFIBIntegerField;
    pFIBDataSetPodW_R_NAME: TFIBStringField;
    pFIBDataSetPodW_PLACE: TFIBIntegerField;
    pFIBDataSetPodW_P_NAME: TFIBStringField;
    pFIBDataSetPodSUMMAADD: TFIBBCDField;
    pFIBDataSetPodSUMMAADDMAX: TFIBBCDField;
    pFIBDataSetPodSUMMAUD: TFIBBCDField;
    pFIBDataSetPodSUMMAUDR: TFIBBCDField;
    pFIBDataSetPodSUMMAUDN: TFIBBCDField;
    pFIBDataSetPodMODEPRSN: TFIBIntegerField;
    dxDBGridPod: TdxDBGrid;
    DataSourcePod: TDataSource;
    pFIBDataSetPodPERSONFLD: TStringField;
    dxDBGridPodSHIFRIDPERSON: TdxDBGridMaskColumn;
    dxDBGridPodYEARVY: TdxDBGridMaskColumn;
    dxDBGridPodMONTHVY: TdxDBGridMaskColumn;
    dxDBGridPodSUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGridPodSUMMAUD: TdxDBGridCurrencyColumn;
    dxDBGridPodMODEPRSN: TdxDBGridMaskColumn;
    dxDBGridPodPERSONFLD: TdxDBGridColumn;
    DataSourceECBN: TDataSource;
    DataSourceECB: TDataSource;
    DataSourceDP: TDataSource;
    pFIBDataSetECBN: TpFIBDataSet;
    pFIBDataSetECB: TpFIBDataSet;
    pFIBDataSetECBDp: TpFIBDataSet;
    pFIBTransactionECBN: TpFIBTransaction;
    pFIBTransactionECB: TpFIBTransaction;
    pFIBTransactionECBDp: TpFIBTransaction;
    pFIBDataSetECBIll: TpFIBDataSet;
    pFIBTransactionECBIll: TpFIBTransaction;
    DataSourceECBIll: TDataSource;
    pFIBDataSetECBNSHIFRIDPERSON: TFIBIntegerField;
    pFIBDataSetECBNYEARVY: TFIBIntegerField;
    pFIBDataSetECBNMONTHVY: TFIBIntegerField;
    pFIBDataSetECBNDOLG: TFIBStringField;
    pFIBDataSetECBNSHIFRKAT: TFIBIntegerField;
    pFIBDataSetECBNKATNAME: TFIBStringField;
    pFIBDataSetECBNSHIFRGRU: TFIBIntegerField;
    pFIBDataSetECBNGRUNAME: TFIBStringField;
    pFIBDataSetECBNKOEF: TFIBBCDField;
    pFIBDataSetECBNW_R: TFIBIntegerField;
    pFIBDataSetECBNW_R_NAME: TFIBStringField;
    pFIBDataSetECBNW_PLACE: TFIBIntegerField;
    pFIBDataSetECBNW_P_NAME: TFIBStringField;
    pFIBDataSetECBNSUMMAADD: TFIBBCDField;
    pFIBDataSetECBNSUMMAADDMAX: TFIBBCDField;
    pFIBDataSetECBNSUMMAUD: TFIBBCDField;
    pFIBDataSetECBNSUMMAUDR: TFIBBCDField;
    pFIBDataSetECBNSUMMAUDN: TFIBBCDField;
    pFIBDataSetECBNMODEPRSN: TFIBIntegerField;
    pFIBDataSetECBSHIFRIDPERSON: TFIBIntegerField;
    pFIBDataSetECBYEARVY: TFIBIntegerField;
    pFIBDataSetECBMONTHVY: TFIBIntegerField;
    pFIBDataSetECBDOLG: TFIBStringField;
    pFIBDataSetECBSHIFRKAT: TFIBIntegerField;
    pFIBDataSetECBKATNAME: TFIBStringField;
    pFIBDataSetECBSHIFRGRU: TFIBIntegerField;
    pFIBDataSetECBGRUNAME: TFIBStringField;
    pFIBDataSetECBKOEF: TFIBBCDField;
    pFIBDataSetECBW_R: TFIBIntegerField;
    pFIBDataSetECBW_R_NAME: TFIBStringField;
    pFIBDataSetECBW_PLACE: TFIBIntegerField;
    pFIBDataSetECBW_P_NAME: TFIBStringField;
    pFIBDataSetECBSUMMAADD: TFIBBCDField;
    pFIBDataSetECBSUMMAADDMAX: TFIBBCDField;
    pFIBDataSetECBSUMMAUD: TFIBBCDField;
    pFIBDataSetECBSUMMAUDR: TFIBBCDField;
    pFIBDataSetECBSUMMAUDN: TFIBBCDField;
    pFIBDataSetECBMODEPRSN: TFIBIntegerField;
    pFIBDataSetECBDpSHIFRIDPERSON: TFIBIntegerField;
    pFIBDataSetECBDpYEARVY: TFIBIntegerField;
    pFIBDataSetECBDpMONTHVY: TFIBIntegerField;
    pFIBDataSetECBDpDOLG: TFIBStringField;
    pFIBDataSetECBDpSHIFRKAT: TFIBIntegerField;
    pFIBDataSetECBDpKATNAME: TFIBStringField;
    pFIBDataSetECBDpSHIFRGRU: TFIBIntegerField;
    pFIBDataSetECBDpGRUNAME: TFIBStringField;
    pFIBDataSetECBDpKOEF: TFIBBCDField;
    pFIBDataSetECBDpW_R: TFIBIntegerField;
    pFIBDataSetECBDpW_R_NAME: TFIBStringField;
    pFIBDataSetECBDpW_PLACE: TFIBIntegerField;
    pFIBDataSetECBDpW_P_NAME: TFIBStringField;
    pFIBDataSetECBDpSUMMAADD: TFIBBCDField;
    pFIBDataSetECBDpSUMMAADDMAX: TFIBBCDField;
    pFIBDataSetECBDpSUMMAUD: TFIBBCDField;
    pFIBDataSetECBDpSUMMAUDR: TFIBBCDField;
    pFIBDataSetECBDpSUMMAUDN: TFIBBCDField;
    pFIBDataSetECBDpMODEPRSN: TFIBIntegerField;
    pFIBDataSetECBIllSHIFRIDPERSON: TFIBIntegerField;
    pFIBDataSetECBIllYEARVY: TFIBIntegerField;
    pFIBDataSetECBIllMONTHVY: TFIBIntegerField;
    pFIBDataSetECBIllDOLG: TFIBStringField;
    pFIBDataSetECBIllSHIFRKAT: TFIBIntegerField;
    pFIBDataSetECBIllKATNAME: TFIBStringField;
    pFIBDataSetECBIllSHIFRGRU: TFIBIntegerField;
    pFIBDataSetECBIllGRUNAME: TFIBStringField;
    pFIBDataSetECBIllKOEF: TFIBBCDField;
    pFIBDataSetECBIllW_R: TFIBIntegerField;
    pFIBDataSetECBIllW_R_NAME: TFIBStringField;
    pFIBDataSetECBIllW_PLACE: TFIBIntegerField;
    pFIBDataSetECBIllW_P_NAME: TFIBStringField;
    pFIBDataSetECBIllSUMMAADD: TFIBBCDField;
    pFIBDataSetECBIllSUMMAADDMAX: TFIBBCDField;
    pFIBDataSetECBIllSUMMAUD: TFIBBCDField;
    pFIBDataSetECBIllSUMMAUDR: TFIBBCDField;
    pFIBDataSetECBIllSUMMAUDN: TFIBBCDField;
    pFIBDataSetECBIllMODEPRSN: TFIBIntegerField;
    pFIBDataSetECBNPersonFld: TStringField;
    pFIBDataSetECBPersonFld: TStringField;
    pFIBDataSetECBDpPersonFld: TStringField;
    pFIBDataSetECBIllPersonFld: TStringField;
    dxDBGridECBN: TdxDBGrid;
    dxDBGridECBNSHIFRIDPERSON: TdxDBGridMaskColumn;
    dxDBGridECBNYEARVY: TdxDBGridMaskColumn;
    dxDBGridECBNMONTHVY: TdxDBGridMaskColumn;
    dxDBGridECBNSUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGridECBNSUMMAADDMAX: TdxDBGridCurrencyColumn;
    dxDBGridECBNSUMMAUD: TdxDBGridCurrencyColumn;
    dxDBGridECBNSUMMAUDR: TdxDBGridCurrencyColumn;
    dxDBGridECBNSUMMAUDN: TdxDBGridCurrencyColumn;
    dxDBGridECBNMODEPRSN: TdxDBGridMaskColumn;
    dxDBGridECBNPersonFld: TdxDBGridColumn;
    dxDBGridECB: TdxDBGrid;
    dxDBGridECBSHIFRIDPERSON: TdxDBGridMaskColumn;
    dxDBGridECBYEARVY: TdxDBGridMaskColumn;
    dxDBGridECBMONTHVY: TdxDBGridMaskColumn;
    dxDBGridECBSUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGridECBSUMMAUD: TdxDBGridCurrencyColumn;
    dxDBGridECBMODEPRSN: TdxDBGridMaskColumn;
    dxDBGridECBPersonFld: TdxDBGridColumn;
    dxDBGridECBDp: TdxDBGrid;
    dxDBGridECBDpSHIFRIDPERSON: TdxDBGridMaskColumn;
    dxDBGridECBDpYEARVY: TdxDBGridMaskColumn;
    dxDBGridECBDpMONTHVY: TdxDBGridMaskColumn;
    dxDBGridECBDpSUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGridECBDpSUMMAUD: TdxDBGridCurrencyColumn;
    dxDBGridECBDpMODEPRSN: TdxDBGridMaskColumn;
    dxDBGridECBDpPersonFld: TdxDBGridColumn;
    dxDBGridIll: TdxDBGrid;
    dxDBGridIllSHIFRIDPERSON: TdxDBGridMaskColumn;
    dxDBGridIllYEARVY: TdxDBGridMaskColumn;
    dxDBGridIllMONTHVY: TdxDBGridMaskColumn;
    dxDBGridIllSUMMAADD: TdxDBGridCurrencyColumn;
    dxDBGridIllSUMMAUD: TdxDBGridCurrencyColumn;
    dxDBGridIllMODEPRSN: TdxDBGridMaskColumn;
    dxDBGridIllPersonFld: TdxDBGridColumn;
    ImageListAnalyze: TImageList;
    TabSheetPodI: TTabSheet;
    TabSheetECBI: TTabSheet;
    lbl1: TLabel;
    lbSummaAddPod: TLabel;
    lblLgSobstw: TLabel;
    lblLgDop: TLabel;
    lblECB: TLabel;
    lblSummaECB: TLabel;
    lblPodR: TLabel;
    lblSummaPodRas: TLabel;
    lblPF: TLabel;
    lblSummaPodFakt: TLabel;
    lblNN: TLabel;
    lblSummaPodRazn: TLabel;
    lblECBN: TLabel;
    lblECBT: TLabel;
    lblECBDp: TLabel;
    lblECBIll: TLabel;
    lblSummaADDECBN: TLabel;
    lblSummaMaxECBN: TLabel;
    lblSummaUdECBN: TLabel;
    lblSummaECBNRas: TLabel;
    lblSummaECBNRazn: TLabel;
    lblSummaAddECBDp: TLabel;
    lblSummaMaxECBDp: TLabel;
    lblSummaUdECBDp: TLabel;
    lblSummaECBDpRas: TLabel;
    lblSummaECBDpRazn: TLabel;
    lblSummaAddECB: TLabel;
    lblSummaMaxECB: TLabel;
    lblSummaUdECB: TLabel;
    lblSummaECBRas: TLabel;
    lblSummaECBRAZN: TLabel;
    lblSummaAddECBIll: TLabel;
    lblSummaMaxECBIll: TLabel;
    lblSummaECBIllRas: TLabel;
    lblSummaECBIllRazn: TLabel;
    lblSummaUdECBIll: TLabel;
    dtpDataZa: TDateTimePicker;
    btnFill: TBitBtn;
    btnExit: TBitBtn;
    DataSourceWS: TDataSource;
    pFIBDataSetWS: TpFIBDataSet;
    pFIBTransactionWS: TpFIBTransaction;
    pFIBDataSetWSSHIFRIDPERSON: TFIBIntegerField;
    pFIBDataSetWSYEARVY: TFIBIntegerField;
    pFIBDataSetWSMONTHVY: TFIBIntegerField;
    pFIBDataSetWSDOLG: TFIBStringField;
    pFIBDataSetWSSHIFRKAT: TFIBIntegerField;
    pFIBDataSetWSKATNAME: TFIBStringField;
    pFIBDataSetWSSHIFRGRU: TFIBIntegerField;
    pFIBDataSetWSGRUNAME: TFIBStringField;
    pFIBDataSetWSKOEF: TFIBBCDField;
    pFIBDataSetWSW_R: TFIBIntegerField;
    pFIBDataSetWSW_R_NAME: TFIBStringField;
    pFIBDataSetWSW_PLACE: TFIBIntegerField;
    pFIBDataSetWSW_P_NAME: TFIBStringField;
    pFIBDataSetWSSUMMAADD: TFIBBCDField;
    pFIBDataSetWSSUMMAADDMAX: TFIBBCDField;
    pFIBDataSetWSSUMMAUD: TFIBBCDField;
    pFIBDataSetWSSUMMAUDR: TFIBBCDField;
    pFIBDataSetWSSUMMAUDN: TFIBBCDField;
    pFIBDataSetWSMODEPRSN: TFIBIntegerField;

  



    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSetPodCalcFields(DataSet: TDataSet);
    constructor CreateDB(AOwner: TComponent;Tabno:integer;Y:integer;M:integer;Curr_Person:Person_Ptr);
    procedure pFIBDataSetECBNCalcFields(DataSet: TDataSet);
    procedure pFIBDataSetECBCalcFields(DataSet: TDataSet);
    procedure pFIBDataSetECBDpCalcFields(DataSet: TDataSet);
    procedure pFIBDataSetECBIllCalcFields(DataSet: TDataSet);
    procedure dxDBGridPodCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure dxDBGridECBNCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure TabSheetPodEnter(Sender: TObject);
    procedure TabSheetECBNEnter(Sender: TObject);
    procedure TabSheetECBEnter(Sender: TObject);
    procedure TabSheetECBDPEnter(Sender: TObject);
    procedure TabSheetIllEnter(Sender: TObject);
    procedure dxDBGridECBCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure dxDBGridECBDpCustomDrawCell(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxTreeListColumn; ASelected, AFocused,
      ANewItemRow: Boolean; var AText: String; var AColor: TColor;
      AFont: TFont; var AAlignment: TAlignment; var ADone: Boolean);
    procedure dxDBGridIllCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure btnFillClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  //    MonthVy:Integer;
  //    YearVy:Integer;
  //    Tabno:Integer;
  //    Wanted_Person:PERSON_PTR;





    procedure CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean;
  ModePrsnCol:Integer;MonthVyCol:integer);
    procedure CalcPodoh;
    procedure showItogi;



  public
     SummaAdd       , SummaUd        , SummaPodRas   , SummaPodRazn     , P                 ,
     SummaAddECBN   , SummaMaxECBN   , SummaUdECBN   , SummaUdECBNRas   , SummaUdECBNRazn   ,
     SummaAddECB    , SummaMaxECB    , SummaUdECB    , SummaUdECBRas    , SummaUdECBRazn    ,
     SummaAddECBDp  , SummaMaxECBDp  , SummaUdECBDp  , SummaUdECBDpRas  , SummaUdECBDpRazn  ,
     SummaAddECBIll , SummaMaxECBIll , SummaUdECBIll , SummaUdECBIllRas , SummaUdECBIllRazn : Real;
     SummaECB : real;
     IsLgotaPN:Integer;
     KD:Integer;
      MonthVy:Integer;
      YearVy:Integer;
      Tabno:Integer;
      Wanted_Person:PERSON_PTR;
    procedure CalculatePodoh;
    procedure OpenDataSets;


    { Public declarations }
  end;

var
  FormAnalyzeNalogi: TFormAnalyzeNalogi;

implementation
 uses ufibmodule,ScrNalog,ScrUtil,ScrExport, uFormWait;

{$R *.dfm}

procedure TFormAnalyzeNalogi.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      ClearTmpFiles(Self.Tabno);
      if pFIBDataSetPod.Active then
         pFIBDataSetPod.Close;
      if pFIBDataSetPod.Transaction.Active then
         pFIBDataSetPod.Transaction.Commit;
      if pFIBDataSetECBN.Active then
         pFIBDataSetECBN.Close;
      if pFIBDataSetECBN.Transaction.Active then
         pFIBDataSetECBN.Transaction.Commit;
      if pFIBDataSetECB.Active then
         pFIBDataSetECB.Close;
      if pFIBDataSetECB.Transaction.Active then
         pFIBDataSetECB.Transaction.Commit;
      if pFIBDataSetECBDP.Active then
         pFIBDataSetECBDP.Close;
      if pFIBDataSetECBDP.Transaction.Active then
         pFIBDataSetECBDP.Transaction.Commit;
      if pFIBDataSetECBIll.Active then
         pFIBDataSetECBIll.Close;
      if pFIBDataSetECBIll.Transaction.Active then
         pFIBDataSetECBIll.Transaction.Commit;
      if pFIBDataSetWS.Active then
         pFIBDataSetWS.Close;
      if pFIBDataSetWS.Transaction.Active then
         pFIBDataSetWS.Transaction.Commit;
      Action:=caFree;
end;

procedure TFormAnalyzeNalogi.pFIBDataSetPodCalcFields(DataSet: TDataSet);
 var a:real;
begin
     a:=pFIBDataSetPodKOEF.Value;
     pFIBDataSetPodPERSONFLD.Value:='    '+Trim(IntToStr(pFIBDataSetPodW_Place.Value))+
                                   ' '+
                                   Trim(pFIBDataSetPodDOLG.Value)+
                                   ' '+
                                   Trim(format('%12.2f',[a]))+
                                   ' '+
                                   Trim(pFIBDataSetPodGRUNAME.value)+
                                   ' '+
                                   Trim(pFIBDataSetPodKATNAME.value);
end;
constructor TFormAnalyzeNalogi.CreateDB(AOwner: TComponent;Tabno:integer;Y:integer;M:integer;Curr_Person:Person_Ptr);
 var i:integer;
     dt:TDateTime;
 begin
      inherited Create(AOwner);
      Wanted_Person := Curr_Person;
      Self.Tabno := Tabno;
      YearVy     := y;
      MonthVy    := m;
      dt:=EncodeDate(y,m,10);
      dtpDataZa.Date:=dt;

 end;

procedure TFormAnalyzeNalogi.pFIBDataSetECBNCalcFields(DataSet: TDataSet);
 var a:real;
begin
     a:=pFIBDataSetECBNKOEF.Value;
     pFIBDataSetECBNPERSONFLD.Value:='    '+Trim(IntToStr(pFIBDataSetECBNW_Place.Value))+
                                   ' '+
                                   Trim(pFIBDataSetECBNDOLG.Value)+
                                   ' '+
                                   Trim(format('%12.2f',[a]))+
                                   ' '+
                                   Trim(pFIBDataSetECBNGRUNAME.value)+
                                   ' '+
                                   Trim(pFIBDataSetECBNKATNAME.value);

end;

procedure TFormAnalyzeNalogi.pFIBDataSetECBCalcFields(DataSet: TDataSet);
var a:real;
begin
     a:=pFIBDataSetECBKOEF.Value;
     pFIBDataSetECBPERSONFLD.Value:='    '+Trim(IntToStr(pFIBDataSetECBW_Place.Value))+
                                   ' '+
                                   Trim(pFIBDataSetECBDOLG.Value)+
                                   ' '+
                                   Trim(format('%12.2f',[a]))+
                                   ' '+
                                   Trim(pFIBDataSetECBGRUNAME.value)+
                                   ' '+
                                   Trim(pFIBDataSetECBKATNAME.value);


end;

procedure TFormAnalyzeNalogi.pFIBDataSetECBDpCalcFields(DataSet: TDataSet);
 var a:real;
begin
     a:=pFIBDataSetECBDPKOEF.Value;
     pFIBDataSetECBDPPERSONFLD.Value:='    '+Trim(IntToStr(pFIBDataSetECBDPW_Place.Value))+
                                   ' '+
                                   Trim(pFIBDataSetECBDPDOLG.Value)+
                                   ' '+
                                   Trim(format('%12.2f',[a]))+
                                   ' '+
                                   Trim(pFIBDataSetECBDPGRUNAME.value)+
                                   ' '+
                                   Trim(pFIBDataSetECBDPKATNAME.value);



end;

procedure TFormAnalyzeNalogi.pFIBDataSetECBIllCalcFields(
  DataSet: TDataSet);
 var a:real;
begin
     a:=pFIBDataSetECBIllKOEF.Value;
     pFIBDataSetECBIllPERSONFLD.Value:='    '+Trim(IntToStr(pFIBDataSetECBIllW_Place.Value))+
                                   ' '+
                                   Trim(pFIBDataSetECBIllDOLG.Value)+
                                   ' '+
                                   Trim(IntToStr(pFIBDataSetECBIllW_Place.Value))+
                                   ' '+
                                   Trim(format('%12.2f',[a]))+
                                   ' '+
                                   Trim(pFIBDataSetECBIllGRUNAME.value)+
                                   ' '+
                                   Trim(pFIBDataSetECBIllKATNAME.value);
end;

procedure TFormAnalyzeNalogi.dxDBGridPodCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
 var Id,I,ModeAutomatic,m:integer;
     SaveColor:TColor;
     MyRect : TRect;
     S : String;
 begin

      CustomDrawCell(Sender,ACanvas,ARect,ANode,
      AColumn,ASelected, AFocused, ANewItemRow,
      AText, AColor, AFont,
      AAlignment, ADone,6,2);
      Exit;

 {
     i:=AColumn.Index;
     if i=1 then
        begin
              s:=ANode.Values[6];
              val(s,id,i);
              if (i<>0) then Exit;
              MyRect:=ARect;
              ModeAutomatic:=id;
              AFont.Color:=clBlack;
              ACanvas.Brush.Color:=clWhite;//clWindow;
              if AFocused OR ASelected then
                 begin
                      AFont.Color:=clWhite;
                      ACanvas.Brush.Color:=clMenuHighLight;
                 end;
              ACanvas.FillRect(MyRect);
              SetBkMode(Handle, TRANSPARENT);
              SetTextAlign(Handle, TA_LEFT);
              S := AText;
              ACanvas.TextRect(MyRect, MyRect.Left+5, MyRect.Top, S);
              if ModeAutomatic=AUTOMATIC_MODE then
                 ImageListAnalyze.Draw(ACanvas,MyRect.Left+1,MyRect.Top+2,1)
                                              else
                 ImageListAnalyze.Draw(ACanvas,MyRect.Left+1,MyRect.Top+2,0);
              ADone := true;
        end
     else
     if (i=3) then  // Др месяц
        begin
              s:=ANode.Values[3];
              val(s,id,i);
              if ((id<1) or (id>12)) then Exit;
              if id=nmes then Exit;
              MyRect:=ARect;
              AFont.Color:=clBlack;
              ACanvas.Brush.Color:=clInfoBk; //cl3Dlight;
              if AFocused OR ASelected then
                 begin
             //         AFont.Color:=clWhite;
                      ACanvas.Brush.Color:=clInactiveCaptionText;
                 end;
              ACanvas.FillRect(MyRect);
              SetTextAlign(Handle, TA_RIGHT);
              S := AText;
              ACanvas.TextRect(MyRect, MyRect.Right-10, MyRect.Top, S);
              ADone:=true;
        end
}
end;





procedure TFormAnalyzeNalogi.dxDBGridECBNCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
      CustomDrawCell(Sender,ACanvas,ARect,ANode,
      AColumn,ASelected, AFocused, ANewItemRow,
      AText, AColor, AFont,
      AAlignment, ADone,9,2);
end;

procedure TFormAnalyzeNalogi.TabSheetPodEnter(Sender: TObject);
var i:Integer;
begin
     i:=1;
     TabSheetPod.Refresh;
end;


procedure TFormAnalyzeNalogi.CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean;
  ModePrsnCol:Integer;MonthVyCol:integer);
 var Id,I,ModeAutomatic,m:integer;
     SaveColor:TColor;
     MyRect : TRect;
     S : String;
 begin
     i:=AColumn.Index;
 //    if i=1 then
     if false then
        begin
              s:=ANode.Values[ModePrsnCol];
              val(s,id,i);
              if (i<>0) then Exit;
              MyRect:=ARect;
              ModeAutomatic:=id;
              AFont.Color:=clBlack;
              ACanvas.Brush.Style:=bsSolid;
              ACanvas.Brush.Color:=clWhite;//clWindow;
              if AFocused OR ASelected then
                 begin
                      AFont.Color:=clWhite;
                      ACanvas.Brush.Color:=clMenuHighLight;
                 end;
              ACanvas.FillRect(MyRect);
              SetBkMode(Handle, TRANSPARENT);
              SetTextAlign(Handle, TA_LEFT);
              S := AText;
              ACanvas.TextRect(MyRect, MyRect.Left+5, MyRect.Top, S);
              if ModeAutomatic=AUTOMATIC_MODE then
                 ImageListAnalyze.Draw(ACanvas,MyRect.Left+1,MyRect.Top+2,1)
                                              else
                 ImageListAnalyze.Draw(ACanvas,MyRect.Left+1,MyRect.Top+2,0);
              ADone := true;
        end
     else
     if false then  // Др месяц
 //    if (i=2) then  // Др месяц
        begin
              s:=ANode.Values[MonthVyCol];
              val(s,id,i);
              if ((id<1) or (id>12)) then Exit;
              if id=nmes then Exit;
              MyRect:=ARect;
              AFont.Color:=clBlack;
              ACanvas.Brush.Color:=clInfoBk; //cl3Dlight;
              if AFocused OR ASelected then
                 begin
             //         AFont.Color:=clWhite;
                      ACanvas.Brush.Color:=clInactiveCaptionText;
                 end;
              ACanvas.FillRect(MyRect);
              SetTextAlign(Handle, TA_RIGHT);
              S := AText;
              ACanvas.TextRect(MyRect, MyRect.Right-10, MyRect.Top, S);
              ADone:=true;
        end
end;


procedure TFormAnalyzeNalogi.TabSheetECBNEnter(Sender: TObject);
begin
     TabSheetECBN.Refresh;
end;

procedure TFormAnalyzeNalogi.TabSheetECBEnter(Sender: TObject);
begin
      TabSheetECB.Refresh;
end;

procedure TFormAnalyzeNalogi.TabSheetECBDPEnter(Sender: TObject);
begin
     TabSheetECBDP.Refresh;
end;

procedure TFormAnalyzeNalogi.TabSheetIllEnter(Sender: TObject);
begin
     TabSheetIll.Refresh;
end;

procedure TFormAnalyzeNalogi.dxDBGridECBCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
      CustomDrawCell(Sender,ACanvas,ARect,ANode,
      AColumn,ASelected, AFocused, ANewItemRow,
      AText, AColor, AFont,
      AAlignment, ADone,6,3);

end;

procedure TFormAnalyzeNalogi.dxDBGridECBDpCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
      CustomDrawCell(Sender,ACanvas,ARect,ANode,
      AColumn,ASelected, AFocused, ANewItemRow,
      AText, AColor, AFont,
      AAlignment, ADone,6,3);

end;

procedure TFormAnalyzeNalogi.dxDBGridIllCustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
      CustomDrawCell(Sender,ACanvas,ARect,ANode,
      AColumn,ASelected, AFocused, ANewItemRow,
      AText, AColor, AFont,
      AAlignment, ADone,6,3);
end;

procedure TFormAnalyzeNalogi.CalcPodoh;
 var
 //    SummaAdd,SummaUd,SummaPodRas,SummaPodRazn,P:Real;
 //    SummaAddECBN   , SummaMaxECBN   , SummaUdECBN   , SummaUdECBNRas   , SummaUdECBNRazn   : Real;
 //    SummaAddECB    , SummaMaxECB    , SummaUdECB    , SummaUdECBRas    , SummaUdECBRazn    : Real;
 //    SummaAddECBDp  , SummaMaxECBDp  , SummaUdECBDp  , SummaUdECBDpRas  , SummaUdECBDpRazn  : Real;
 //    SummaAddECBIll , SummaMaxECBIll , SummaUdECBIll , SummaUdECBIllRas , SummaUdECBIllRazn : Real;
 //    SummaECB : real;
     CurrPerson:PERSON_PTR;
 //    IsLgotaPN,KD:Integer;
     s : string;
     Podoh_Person:PERSON_PTR;
  procedure SetPersonForPodoh;
   var SQLStmnt : string;
       finded  : Integer;
       lgotypn : real;
       islgoty : Integer;
       kwod    : Integer;
       Curr_Cn : CN_PTR;
   begin
        if ((CURRYEAR=YearVy) and (MonthVy=FLOW_MONTH)) then
        if (Wanted_Person<>nil) then
       //    (CURRYEAR<YearVy)or
       //    ((CURRYEAR=YearVy) and (MonthVy>FLOW_MONTH)) then
           begin
                Podoh_Person:=Wanted_Person;
                Exit;
           end;

        New(Podoh_Person);
        FillChar(Podoh_Person^,SizeOf(Podoh_Person),0);
        Podoh_Person^.NEXT := nil;
        Podoh_Person^.Add  := nil;
        Podoh_Person^.Ud   := nil;
        Podoh_Person^.Cn   := nil;
        Podoh_Person^.SOWM := nil;
        finded  := 0;
        lgotypn := 0;
        islgoty := 0;
        kwod    := 0;
        if FIB.pFIBQuery.Open then
           FIB.pFIBQuery.Close;
        if FIB.pFIBQuery.Transaction.Active then
           FIB.pFIBQuery.Transaction.Commit;
        FIB.pFIBQuery.SQL.Clear;
        SQLStmnt := ' select first 1 LGOTYPN,ISLGOTY,KWOD,FINDED from PR_GETLGCNPN2011('+IntToStr(Self.Tabno)+','+IntToStr(YearVy)+','+IntToStr(MonthVy)+')';
        FIB.pFIBQuery.SQL.Add(SQLStmnt);
        FIB.pFIBQuery.Transaction.StartTransaction;
        FIB.pFIBQuery.ExecQuery;
        lgotypn := FIB.pFIBQuery.Fields[0].AsFloat;
        islgoty := FIB.pFIBQuery.Fields[1].AsInteger;
        kwod    := FIB.pFIBQuery.Fields[2].AsInteger;;
        finded  := FIB.pFIBQuery.Fields[3].AsInteger;;
        if finded=1 then
           begin
                if Abs(Lgotypn)>0.005 then
                   begin
                        MAKE_CN(Curr_Cn,Podoh_Person);
                        Curr_Cn^.SUMMA := lgotypn;
                        Curr_Cn^.Shifr := LgotyPN2004Shifr+Limit_Cn_Base;
                        Curr_Cn^.KOD   := 100;
                   end;
                if IsLgoty=1 then
                   begin
                        MAKE_CN(Curr_Cn,Podoh_Person);
                        Curr_Cn^.Shifr := LgotyPN2011Shifr+Limit_Cn_Base;
                        Curr_Cn^.KOD   := 100;
                   end;
                if kwod>0 then
                   begin
                        MAKE_CN(Curr_Cn,Podoh_Person);
                        Curr_Cn^.Prim  := Kwod;
                        Curr_Cn^.Shifr := KwoDetejOdMateriShifr+Limit_Cn_Base;
                        Curr_Cn^.KOD   := 100;
                   end;
           end;
        FIB.pFIBQuery.Close;
        FIB.pFIBQuery.Transaction.Commit;
   end;
  procedure SetUpMaxECBs;
   var LimitForECB:Real;
   begin
        LimitForECB:=GET_LIMIT_FOR_PENS(YearVy,MonthVy);
        if SummaAddECBN>LimitForECB then
           begin
                SummaMaxECBN   := LimitForECB;
                SummaMaxECB    := 0 ;
                SummaMaxECBDP  := 0 ;
                SummaMaxECBIll := 0 ;
           end
        else
        if SummaAddECBN+SummaAddECB>LimitForECB then
           begin
                SummaMaxECBN   := SummaAddECBN;
                SummaMaxECB    := LimitForECB-SummaAddECBN;
                SummaMaxECBDP  := 0 ;
                SummaMaxECBIll := 0 ;
           end
        else
        if SummaAddECBN+SummaAddECB+SummaAddECBDP>LimitForECB then
           begin
                SummaMaxECBN   := SummaAddECBN;
                SummaMaxECB    := SummaAddECB;
                SummaMaxECBDP  := LimitForECB-(SummaAddECBN+SummaAddECB);
                SummaMaxECBIll := 0 ;
           end
        else
           if SummaAddECBN+SummaAddECB+SummaAddECBDP+SummaAddECBIll>LimitForECB then
              begin
                   SummaMaxECBN   := SummaAddECBN;
                   SummaMaxECB    := SummaAddECB;
                   SummaMaxECBDP  := SummaAddECBDP;
                   SummaMaxECBIll := LimitForECB-(SummaAddECBN+SummaAddECB+SummaAddECBDP);
              end
        else
              begin
                   SummaMaxECBN   := SummaAddECBN;
                   SummaMaxECB    := SummaAddECB;
                   SummaMaxECBDP  := SummaAddECBDP;
                   SummaMaxECBIll := SummaAddECBIll;

              end;
    end;

 begin
      CalculatePodoh;
      showItogi;
      Exit;
      SummaAdd           := 0;
      SummaUd            := 0;
      SummaAddECBN       := 0;
      SummaUdECBN        := 0;
      SummaUdECBNRas     := 0;
      SummaUdECBNRazn    := 0;
      SummaAddECB        := 0;
      SummaUdECB         := 0;
      SummaUdECBRas      := 0;
      SummaUdECBRazn     := 0;
      SummaAddECBDp      := 0;
      SummaUdECBDp       := 0;
      SummaUdECBDpRas    := 0;
      SummaUdECBDpRazn   := 0;
      SummaAddECBIll     := 0;
      SummaUdECBIll      := 0;
      SummaUdECBIllRas   := 0;
      SummaUdECBIllRazn  := 0;
      SummaPodRas        := 0;
      SummaPodRazn       := 0;
      pFIBDataSetPod.First;
      while not pFIBDataSetPod.Eof do
       begin
            SummaAdd := SummaAdd + pFIBDataSetPodSummaAdd.Value;
            SummaUd  := SummaUd  + pFIBDataSetPodSummaUd.Value;
            pFIBDataSetPod.Next;
       end;
      pFIBDataSetECBN.First;
      while not pFIBDataSetECBN.Eof do
       begin
            SummaAddECBN  := SummaAddECBN  + pFIBDataSetECBNSummaAdd.Value;
            SummaUdECBN   := SummaUdECBN   + pFIBDataSetECBNSummaUd.Value;
            pFIBDataSetECBN.Next;
       end;
      pFIBDataSetECB.First;
      while not pFIBDataSetECB.Eof do
       begin
            SummaAddECB  := SummaAddECB  + pFIBDataSetECBSummaAdd.Value;
            SummaUdECB   := SummaUdECB   + pFIBDataSetECBSummaUd.Value;
            pFIBDataSetECB.Next;
       end;

      pFIBDataSetECBDp.First;
      while not pFIBDataSetECBDp.Eof do
       begin
            SummaAddECBDp  := SummaAddECBDp  + pFIBDataSetECBDpSummaAdd.Value;
            SummaUdECBDp   := SummaUdECBDp   + pFIBDataSetECBDpSummaUd.Value;
            pFIBDataSetECBDp.Next;
       end;

      pFIBDataSetECBIll.First;
      while not pFIBDataSetECBIll.Eof do
       begin
            SummaAddECBIll := SummaAddECBIll + pFIBDataSetECBIllSummaAdd.Value;
            SummaUdECBIll  := SummaUdECBIll  + pFIBDataSetECBIllSummaUd.Value;
            pFIBDataSetECBIll.Next;
       end;
      pFIBDataSetPod.First;
      pFIBDataSetECBN.First;
      pFIBDataSetECB.First;
      pFIBDataSetECBDP.First;
      pFIBDataSetECBIll.First;
      s:=trim(Format('%12.2f',[SummaAddECBN]));
      lblSummaAddECBN.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBN]));
      lblSummaUdECBN.Caption:=s;
      s:=trim(Format('%12.2f',[SummaAddECB]));
      lblSummaAddECB.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECB]));
      lblSummaUdECB.Caption:=s;
      s:=trim(Format('%12.2f',[SummaAddECBDp]));
      lblSummaAddECBDp.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBDp]));
      lblSummaUdECBDp.Caption:=s;
      s:=trim(Format('%12.2f',[SummaAddECBIll]));
      lblSummaAddECBIll.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBIll]));
      lblSummaUdECBIll.Caption:=s;
      SetUpMaxECBs;
      SummaUdECBNRas     :=r10 (SummaMaxECBN   * ECBNProc   );
      SummaUdECBRas      :=r10 (SummaMaxECB    * ECBProc    );
      SummaUdECBDpRas    :=r10 (SummaMaxECBDP  * ECBDpProc  );
      SummaUdECBIllRas   :=r10 (SummaMaxECBIll * ECBIllProc );
      SummaUdECBNRazn    := SummaUdECBNRas   - SummaUdECBN   ;
      SummaUdECBRazn     := SummaUdECBRas    - SummaUdECB    ;
      SummaUdECBDpRazn   := SummaUdECBDpRas  - SummaUdECBDp  ;
      SummaUdECBIllRazn  := SummaUdECBIllRas - SummaUdECBIll ;
      s:=trim(Format('%12.2f',[SummaMaxECBN]));
      lblSummaMaxECBN.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBNRas]));
      lblSummaECBNRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBNRazn]));
      lblSummaECBNRazn.Caption:=s;
      s:=trim(Format('%12.2f',[SummaMaxECB]));
      lblSummaMaxECB.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBRas]));
      lblSummaECBRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBRazn]));
      lblSummaECBRazn.Caption:=s;
      s:=trim(Format('%12.2f',[SummaMaxECBDp]));
      lblSummaMaxECBDp.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBDpRas]));
      lblSummaECBDpRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBDpRazn]));
      lblSummaECBDpRazn.Caption:=s;
      s:=trim(Format('%12.2f',[SummaMaxECBIll]));
      lblSummaMaxECBIll.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBIllRas]));
      lblSummaECBIllRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBIllRazn]));
      lblSummaECBIllRazn.Caption:=s;

      { Налог с дохода }

      SummaECB:=SummaUdECBNRas+SummaUdECBRas+SummaUdECBIllRas;

//      SummaPodRas:=PODOH_2004_2011(SummaAdd,SummaECB,0,MonthVy,YearVy,Wanted_PERSON);
      SetPersonForPodoh;
      SummaPodRas:=PODOH_2004_2011(SummaAdd,SummaECB,0,MonthVy,YearVy,Podoh_PERSON);
//FUNCTION PODOH_2004_2011(S,ECB_NALOG,ECB_ILL_NALOG:REAL;W_NMES,W_YEAR:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
      SummaPodRazn:=SummaPodRas-SummaUd;
      IsLgotaPN:=0;
      P:=GetLgotyPN2004(Podoh_Person);
      if p>0.005 then IsLgotaPN:=1;
      if IsLgotaPN=0 then
         if IsLgotyPN2011(Podoh_Person) then
            IsLgotaPN:=1;
      kd:=GetKwoDetOdMPN2004(Podoh_Person);
      // Отключить льготы для ЛНР
      if isLNR then
         begin
              p         := 0;
              isLgotaPN := 0;
              kd        := 0;
         end;


      if Wanted_Person<>Podoh_Person then
         begin
              while Assigned(Podoh_Person^.Cn) do DEL_CN(Podoh_Person^.Cn,Podoh_Person);
              Dispose(Podoh_Person);
         end;
      lbSummaAddPod.Caption   := Trim(Format('%15.2f',[SummaAdd]));
      lblSummaPodFakt.Caption := Trim(Format('%15.2f',[SummaUd]));
      lblSummaECB.Caption     := Trim(Format('%15.2f',[SummaECB]));
      lblSummaPodRas.Caption  := Trim(Format('%15.2f',[SummaPodRas]));
      lblSummaPodRazn.Caption := Trim(Format('%15.2f',[SummaPodRazn]));
      if IsLgotaPN=0 then
         lblLgSobstw.Caption:='Собственная льгота - нет'
      else
         lblLgSobstw.Caption:='Собственная льгота - есть';
      if (p>0.005) then
         if (kd>0) then
            lblLgDop.Caption:='Дополнительные льготы - '+trim(Format('%7.2f',[p]))+' + льгота на '+IntToStr(kd)+' детей.'
         else
            lblLgDop.Caption:='Дополнительные льготы - '+trim(Format('%7.2f',[p]))
      else
         if (kd>0) then
            lblLgDop.Caption:='Дополнительные льготы - льгота на '+IntToStr(kd)+' детей.'
         else
            lblLgDop.Caption:='Дополнительные льготы - нет';


 end;
//------------------------------
procedure TFormAnalyzeNalogi.CalculatePodoh;
 var
     CurrPerson:PERSON_PTR;
     s : string;
     Podoh_Person:PERSON_PTR;
  procedure SetPersonForPodoh;
   var SQLStmnt : string;
       finded  : Integer;
       lgotypn : real;
       islgoty : Integer;
       kwod    : Integer;
       Curr_Cn : CN_PTR;
   begin
        if ((CURRYEAR=YearVy) and (MonthVy=FLOW_MONTH)) then
       //    (CURRYEAR<YearVy)or
       //    ((CURRYEAR=YearVy) and (MonthVy>FLOW_MONTH)) then
           begin
                Podoh_Person:=Wanted_Person;
                Exit;
           end;

        New(Podoh_Person);
        FillChar(Podoh_Person^,SizeOf(Podoh_Person),0);
        Podoh_Person^.NEXT := nil;
        Podoh_Person^.Add  := nil;
        Podoh_Person^.Ud   := nil;
        Podoh_Person^.Cn   := nil;
        Podoh_Person^.SOWM := nil;
        finded  := 0;
        lgotypn := 0;
        islgoty := 0;
        kwod    := 0;
        if FIB.pFIBQuery.Open then
           FIB.pFIBQuery.Close;
        if FIB.pFIBQuery.Transaction.Active then
           FIB.pFIBQuery.Transaction.Commit;
        FIB.pFIBQuery.SQL.Clear;
        SQLStmnt := ' select first 1 LGOTYPN,ISLGOTY,KWOD,FINDED from PR_GETLGCNPN2011('+IntToStr(Self.Tabno)+','+IntToStr(YearVy)+','+IntToStr(MonthVy)+')';
        FIB.pFIBQuery.SQL.Add(SQLStmnt);
        FIB.pFIBQuery.Transaction.StartTransaction;
        FIB.pFIBQuery.ExecQuery;
        lgotypn := FIB.pFIBQuery.Fields[0].AsFloat;
        islgoty := FIB.pFIBQuery.Fields[1].AsInteger;
        kwod    := FIB.pFIBQuery.Fields[2].AsInteger;;
        finded  := FIB.pFIBQuery.Fields[3].AsInteger;;
        if finded=1 then
           begin
                if Abs(Lgotypn)>0.005 then
                   begin
                        MAKE_CN(Curr_Cn,Podoh_Person);
                        Curr_Cn^.SUMMA := lgotypn;
                        Curr_Cn^.Shifr := LgotyPN2004Shifr+Limit_Cn_Base;
                        Curr_Cn^.KOD   := 100;
                   end;
                if IsLgoty=1 then
                   begin
                        MAKE_CN(Curr_Cn,Podoh_Person);
                        Curr_Cn^.Shifr := LgotyPN2011Shifr+Limit_Cn_Base;
                        Curr_Cn^.KOD   := 100;
                   end;
                if kwod>0 then
                   begin
                        MAKE_CN(Curr_Cn,Podoh_Person);
                        Curr_Cn^.Prim  := Kwod;
                        Curr_Cn^.Shifr := KwoDetejOdMateriShifr+Limit_Cn_Base;
                        Curr_Cn^.KOD   := 100;
                   end;
           end;
        FIB.pFIBQuery.Close;
        FIB.pFIBQuery.Transaction.Commit;
   end;
  procedure SetUpMaxECBs;
   var LimitForECB:Real;
   begin
        LimitForECB:=GET_LIMIT_FOR_PENS(YearVy,MonthVy);
        if SummaAddECBN>LimitForECB then
           begin
                SummaMaxECBN   := LimitForECB;
                SummaMaxECB    := 0 ;
                SummaMaxECBDP  := 0 ;
                SummaMaxECBIll := 0 ;
           end
        else
        if SummaAddECBN+SummaAddECB>LimitForECB then
           begin
                SummaMaxECBN   := SummaAddECBN;
                SummaMaxECB    := LimitForECB-SummaAddECBN;
                SummaMaxECBDP  := 0 ;
                SummaMaxECBIll := 0 ;
           end
        else
        if SummaAddECBN+SummaAddECB+SummaAddECBDP>LimitForECB then
           begin
                SummaMaxECBN   := SummaAddECBN;
                SummaMaxECB    := SummaAddECB;
                SummaMaxECBDP  := LimitForECB-(SummaAddECBN+SummaAddECB);
                SummaMaxECBIll := 0 ;
           end
        else
           if SummaAddECBN+SummaAddECB+SummaAddECBDP+SummaAddECBIll>LimitForECB then
              begin
                   SummaMaxECBN   := SummaAddECBN;
                   SummaMaxECB    := SummaAddECB;
                   SummaMaxECBDP  := SummaAddECBDP;
                   SummaMaxECBIll := LimitForECB-(SummaAddECBN+SummaAddECB+SummaAddECBDP);
              end
        else
              begin
                   SummaMaxECBN   := SummaAddECBN;
                   SummaMaxECB    := SummaAddECB;
                   SummaMaxECBDP  := SummaAddECBDP;
                   SummaMaxECBIll := SummaAddECBIll;

              end;
    end;

 begin
      SummaAdd           := 0;
      SummaUd            := 0;
      SummaAddECBN       := 0;
      SummaUdECBN        := 0;
      SummaUdECBNRas     := 0;
      SummaUdECBNRazn    := 0;
      SummaAddECB        := 0;
      SummaUdECB         := 0;
      SummaUdECBRas      := 0;
      SummaUdECBRazn     := 0;
      SummaAddECBDp      := 0;
      SummaUdECBDp       := 0;
      SummaUdECBDpRas    := 0;
      SummaUdECBDpRazn   := 0;
      SummaAddECBIll     := 0;
      SummaUdECBIll      := 0;
      SummaUdECBIllRas   := 0;
      SummaUdECBIllRazn  := 0;
      SummaPodRas        := 0;
      SummaPodRazn       := 0;
      IsLgotaPN          := 0;
      KD                 := 0;

      pFIBDataSetPod.First;
      while not pFIBDataSetPod.Eof do
       begin
            SummaAdd := SummaAdd + pFIBDataSetPodSummaAdd.Value;
            SummaUd  := SummaUd  + pFIBDataSetPodSummaUd.Value;
            pFIBDataSetPod.Next;
       end;
      pFIBDataSetECBN.First;
      while not pFIBDataSetECBN.Eof do
       begin
            SummaAddECBN  := SummaAddECBN  + pFIBDataSetECBNSummaAdd.Value;
            SummaUdECBN   := SummaUdECBN   + pFIBDataSetECBNSummaUd.Value;
            pFIBDataSetECBN.Next;
       end;
      pFIBDataSetECB.First;
      while not pFIBDataSetECB.Eof do
       begin
            SummaAddECB  := SummaAddECB  + pFIBDataSetECBSummaAdd.Value;
            SummaUdECB   := SummaUdECB   + pFIBDataSetECBSummaUd.Value;
            pFIBDataSetECB.Next;
       end;

      pFIBDataSetECBDp.First;
      while not pFIBDataSetECBDp.Eof do
       begin
            SummaAddECBDp  := SummaAddECBDp  + pFIBDataSetECBDpSummaAdd.Value;
            SummaUdECBDp   := SummaUdECBDp   + pFIBDataSetECBDpSummaUd.Value;
            pFIBDataSetECBDp.Next;
       end;

      pFIBDataSetECBIll.First;
      while not pFIBDataSetECBIll.Eof do
       begin
            SummaAddECBIll := SummaAddECBIll + pFIBDataSetECBIllSummaAdd.Value;
            SummaUdECBIll  := SummaUdECBIll  + pFIBDataSetECBIllSummaUd.Value;
            pFIBDataSetECBIll.Next;
       end;
      pFIBDataSetECBN.First;
      pFIBDataSetECB.First;
      pFIBDataSetECBDP.First;
      pFIBDataSetECBIll.First;
      pFIBDataSetPod.First;
{
      s:=trim(Format('%12.2f',[SummaAddECBN]));
      lblSummaAddECBN.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBN]));
      lblSummaUdECBN.Caption:=s;
      s:=trim(Format('%12.2f',[SummaAddECB]));
      lblSummaAddECB.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECB]));
      lblSummaUdECB.Caption:=s;
      s:=trim(Format('%12.2f',[SummaAddECBDp]));
      lblSummaAddECBDp.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBDp]));
      lblSummaUdECBDp.Caption:=s;
      s:=trim(Format('%12.2f',[SummaAddECBIll]));
      lblSummaAddECBIll.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBIll]));
      lblSummaUdECBIll.Caption:=s;
}
      SetUpMaxECBs;
      SummaUdECBNRas     :=r10 (SummaMaxECBN   * ECBNProc   );
      SummaUdECBRas      :=r10 (SummaMaxECB    * ECBProc    );
      SummaUdECBDpRas    :=r10 (SummaMaxECBDP  * ECBDpProc  );
      SummaUdECBIllRas   :=r10 (SummaMaxECBIll * ECBIllProc );
      SummaUdECBNRazn    := SummaUdECBNRas   - SummaUdECBN   ;
      SummaUdECBRazn     := SummaUdECBRas    - SummaUdECB    ;
      SummaUdECBDpRazn   := SummaUdECBDpRas  - SummaUdECBDp  ;
      SummaUdECBIllRazn  := SummaUdECBIllRas - SummaUdECBIll ;
{
      s:=trim(Format('%12.2f',[SummaMaxECBN]));
      lblSummaMaxECBN.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBNRas]));
      lblSummaECBNRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBNRazn]));
      lblSummaECBNRazn.Caption:=s;
      s:=trim(Format('%12.2f',[SummaMaxECB]));
      lblSummaMaxECB.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBRas]));
      lblSummaECBRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBRazn]));
      lblSummaECBRazn.Caption:=s;
      s:=trim(Format('%12.2f',[SummaMaxECBDp]));
      lblSummaMaxECBDp.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBDpRas]));
      lblSummaECBDpRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBDpRazn]));
      lblSummaECBDpRazn.Caption:=s;
      s:=trim(Format('%12.2f',[SummaMaxECBIll]));
      lblSummaMaxECBIll.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBIllRas]));
      lblSummaECBIllRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBIllRazn]));
      lblSummaECBIllRazn.Caption:=s;
 }
      { Налог с дохода }

      SummaECB:=SummaUdECBNRas+SummaUdECBRas+SummaUdECBIllRas;

//      SummaPodRas:=PODOH_2004_2011(SummaAdd,SummaECB,0,MonthVy,YearVy,Wanted_PERSON);
      SetPersonForPodoh;
      SummaPodRas:=PODOH_2004_2011(SummaAdd,SummaECB,0,MonthVy,YearVy,Podoh_PERSON);

//FUNCTION PODOH_2004_2011(S,ECB_NALOG,ECB_ILL_NALOG:REAL;W_NMES,W_YEAR:INTEGER;CURR_PERSON:PERSON_PTR):REAL;
      SummaPodRazn:=SummaPodRas-SummaUd;
      P:=GetLgotyPN2004(Podoh_Person);
      if p>0.005 then IsLgotaPN:=1;
      if IsLgotaPN=0 then
         if IsLgotyPN2011(Podoh_Person) then
            IsLgotaPN:=1;
      kd:=GetKwoDetOdMPN2004(Podoh_Person);
      if isLNR then
         begin
              isLgotaPN := 0;
              p         := 0;
              kd        := 0;
         end;

      if Wanted_Person<>Podoh_Person then
         begin
              while Assigned(Podoh_Person^.Cn) do DEL_CN(Podoh_Person^.Cn,Podoh_Person);
              Dispose(Podoh_Person);
         end;
{
      lbSummaAddPod.Caption   := Trim(Format('%15.2f',[SummaAdd]));
      lblSummaPodFakt.Caption := Trim(Format('%15.2f',[SummaUd]));
      lblSummaECB.Caption     := Trim(Format('%15.2f',[SummaECB]));
      lblSummaPodRas.Caption  := Trim(Format('%15.2f',[SummaPodRas]));
      lblSummaPodRazn.Caption := Trim(Format('%15.2f',[SummaPodRazn]));
      if IsLgotaPN=0 then
         lblLgSobstw.Caption:='Собственная льгота - нет'
      else
         lblLgSobstw.Caption:='Собственная льгота - есть';
      if (p>0.005) then
         if (kd>0) then
            lblLgDop.Caption:='Дополнительные льготы - '+trim(Format('%7.2f',[p]))+' + льгота на '+IntToStr(kd)+' детей.'
         else
            lblLgDop.Caption:='Дополнительные льготы - '+trim(Format('%7.2f',[p]))
      else
         if (kd>0) then
            lblLgDop.Caption:='Дополнительные льготы - льгота на '+IntToStr(kd)+' детей.'
         else
            lblLgDop.Caption:='Дополнительные льготы - нет';
}

 end;
procedure TFormAnalyzeNalogi.showItogi;
 var s:string;
 begin

      s:=trim(Format('%12.2f',[SummaAddECBN]));
      lblSummaAddECBN.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBN]));
      lblSummaUdECBN.Caption:=s;
      s:=trim(Format('%12.2f',[SummaAddECB]));
      lblSummaAddECB.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECB]));
      lblSummaUdECB.Caption:=s;
      s:=trim(Format('%12.2f',[SummaAddECBDp]));
      lblSummaAddECBDp.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBDp]));
      lblSummaUdECBDp.Caption:=s;
      s:=trim(Format('%12.2f',[SummaAddECBIll]));
      lblSummaAddECBIll.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBIll]));
      lblSummaUdECBIll.Caption:=s;

      s:=trim(Format('%12.2f',[SummaMaxECBN]));
      lblSummaMaxECBN.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBNRas]));
      lblSummaECBNRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBNRazn]));
      lblSummaECBNRazn.Caption:=s;
      s:=trim(Format('%12.2f',[SummaMaxECB]));
      lblSummaMaxECB.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBRas]));
      lblSummaECBRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBRazn]));
      lblSummaECBRazn.Caption:=s;
      s:=trim(Format('%12.2f',[SummaMaxECBDp]));
      lblSummaMaxECBDp.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBDpRas]));
      lblSummaECBDpRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBDpRazn]));
      lblSummaECBDpRazn.Caption:=s;
      s:=trim(Format('%12.2f',[SummaMaxECBIll]));
      lblSummaMaxECBIll.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBIllRas]));
      lblSummaECBIllRas.Caption:=s;
      s:=trim(Format('%12.2f',[SummaUdECBIllRazn]));
      lblSummaECBIllRazn.Caption:=s;
//      if ((YearVy<2016) and isSVDN) then
//         lblSummaECB.Caption     := Trim(Format('%15.2f',[SummaECB]))
//      else
         lblSummaECB.Caption:='';

      lbSummaAddPod.Caption   := Trim(Format('%15.2f',[SummaAdd]));
      lblSummaPodFakt.Caption := Trim(Format('%15.2f',[SummaUd]));
      lblSummaPodRas.Caption  := Trim(Format('%15.2f',[SummaPodRas]));
      lblSummaPodRazn.Caption := Trim(Format('%15.2f',[SummaPodRazn]));
      if (IsLgotaPN=0 )then
         lblLgSobstw.Caption:='Собственная льгота - нет'
      else
         lblLgSobstw.Caption:='Собственная льгота - есть';
      if (p>0.005) then
         if (kd>0) then
            lblLgDop.Caption:='Дополнительные льготы - '+trim(Format('%7.2f',[p]))+' + льгота на '+IntToStr(kd)+' детей.'
         else
            lblLgDop.Caption:='Дополнительные льготы - '+trim(Format('%7.2f',[p]))
      else
         if (kd>0) then
            lblLgDop.Caption:='Дополнительные льготы - льгота на '+IntToStr(kd)+' детей.'
         else
            lblLgDop.Caption:='Дополнительные льготы - нет';



 end;



//------------------------------


procedure TFormAnalyzeNalogi.btnFillClick(Sender: TObject);
 var Dt:TDateTime;
     Y,M,D:Word;
begin
     FormWait.Show;
     ClearTmpFiles(Self.Tabno);
     Dt      := dtpDataZa.Date;
     DecodeDate(Dt,y,m,d);
     MonthVy := M;
     YearVy  := y;
     if (YearVy>2015) then
        begin
              TabSheetECB.Hide;
              TabSheetECBN.Hide;
              TabSheetECBDP.Hide;
              TabSheetIll.Hide;
              TabSheetECBI.Hide;

              TabSheetECB.TabVisible   := False;
              TabSheetECBN.TabVisible  := False;
              TabSheetECBDP.TabVisible := False;
              TabSheetIll.TabVisible   := False;
              TabSheetECBI.TabVisible  := False;

              TabSheetECB.Enabled   := false;
              TabSheetECBN.Enabled  := false;
              TabSheetECBDP.Enabled := false;
              TabSheetIll.Enabled   := false;
              TabSheetECBI.Enabled  := false;
              lblECB.Hide;

        end
     else
        begin
              TabSheetECB.Show;
              TabSheetECBN.Show;
              TabSheetECBDP.Show;
              TabSheetIll.Show;
              TabSheetECBI.Show;

              TabSheetECB.TabVisible   := true;
              TabSheetECBN.TabVisible  := true;
              TabSheetECBDP.TabVisible := true;
              TabSheetIll.TabVisible   := true;
              TabSheetECBI.TabVisible  := true;

              TabSheetECB.Enabled      := true;
              TabSheetECBN.Enabled     := true;
              TabSheetECBDP.Enabled    := true;
              TabSheetIll.Enabled      := true;
              TabSheetECBI.Enabled     := true;
              lblECB.Show;

        end;
//     if ((YearVy=curryear) and
//         (nmes>=flow_month)) then
     PutSummyToTmpTables(Wanted_Person,YearVy,MonthVy);
//     FIB.pFIBDatabaseSal.Commit;
//    Error(IntToStr(FIB.pFIBDatabaseSal.ActiveTransactionCount));
//    Halt;
     OpenDataSets;
     CalcPodoh;
     FormWait.Hide;
end;

procedure TFormAnalyzeNalogi.OpenDataSets;
 var i:Integer;
 begin
      if pFIBDataSetPod.Active then
         pFIBDataSetPod.Close;
      if pFIBDataSetPod.Transaction.Active then
         pFIBDataSetPod.Transaction.Commit;
      pFIBDataSetPod.Transaction.StartTransaction;
      pFIBDataSetPod.ParamByName('TABNO').Value := tabno;
      pFIBDataSetPod.ParamByName('Y').Value     := YearVy;
      pFIBDataSetPod.ParamByName('M').Value     := MonthVy;
      pFIBDataSetPod.ParamByName('MODE').Value  := 0;
      pFIBDataSetPod.Open;

      if pFIBDataSetECBN.Active then
         pFIBDataSetECBN.Close;
      if pFIBDataSetECBN.Transaction.Active then
         pFIBDataSetECBN.Transaction.Commit;
      pFIBDataSetECBN.Transaction.StartTransaction;
      pFIBDataSetECBN.ParamByName('TABNO').Value := tabno;
      pFIBDataSetECBN.ParamByName('Y').Value     := YearVy;
      pFIBDataSetECBN.ParamByName('M').Value     := MonthVy;
      pFIBDataSetECBN.ParamByName('MODE').Value  := 5;
      pFIBDataSetECBN.Open;
      i:=pFIBDataSetECBN.RecordCountFromSrv;
      i:=pFIBDataSetPod.RecordCountFromSrv;

      if pFIBDataSetECB.Active then
         pFIBDataSetECB.Close;
      if pFIBDataSetECB.Transaction.Active then
         pFIBDataSetECB.Transaction.Commit;
      pFIBDataSetECB.Transaction.StartTransaction;
      pFIBDataSetECB.ParamByName('TABNO').Value := tabno;
      pFIBDataSetECB.ParamByName('Y').Value     := YearVy;
      pFIBDataSetECB.ParamByName('M').Value     := MonthVy;
      pFIBDataSetECB.ParamByName('MODE').Value  := 4;
      pFIBDataSetECB.Open;

      if pFIBDataSetECBDP.Active then
         pFIBDataSetECBDP.Close;
      if pFIBDataSetECBDP.Transaction.Active then
         pFIBDataSetECBDP.Transaction.Commit;
      pFIBDataSetECBDP.Transaction.StartTransaction;
      pFIBDataSetECBDP.ParamByName('TABNO').Value := tabno;
      pFIBDataSetECBDP.ParamByName('Y').Value     := YearVy;
      pFIBDataSetECBDP.ParamByName('M').Value     := MonthVy;
      pFIBDataSetECBDP.ParamByName('MODE').Value  := 6;
      pFIBDataSetECBDP.Open;

      if pFIBDataSetECBIll.Active then
         pFIBDataSetECBIll.Close;
      if pFIBDataSetECBIll.Transaction.Active then
         pFIBDataSetECBIll.Transaction.Commit;
      pFIBDataSetECBIll.Transaction.StartTransaction;
      pFIBDataSetECBIll.ParamByName('TABNO').Value := tabno;
      pFIBDataSetECBIll.ParamByName('Y').Value     := YearVy;
      pFIBDataSetECBIll.ParamByName('M').Value     := MonthVy;
      pFIBDataSetECBIll.ParamByName('MODE').Value  := 7;
      pFIBDataSetECBIll.Open;

      if pFIBDataSetWS.Active then
         pFIBDataSetWS.Close;
      if pFIBDataSetWS.Transaction.Active then
         pFIBDataSetWS.Transaction.Commit;
      pFIBDataSetWS.Transaction.StartTransaction;
      pFIBDataSetWS.ParamByName('TABNO').Value := tabno;
      pFIBDataSetWS.ParamByName('Y').Value     := YearVy;
      pFIBDataSetWS.ParamByName('M').Value     := MonthVy;
      pFIBDataSetWS.ParamByName('MODE').Value  := 8;
      pFIBDataSetWS.Open;

    //  CalcPodoh;

 end;

procedure TFormAnalyzeNalogi.FormDestroy(Sender: TObject);
begin
      ClearTmpFiles(Self.Tabno);
      if pFIBDataSetPod.Active then
         pFIBDataSetPod.Close;

      if pFIBDataSetPod.Transaction.Active then
         pFIBDataSetPod.Transaction.Commit;
      if pFIBDataSetECBN.Active then
         pFIBDataSetECBN.Close;
      if pFIBDataSetECBN.Transaction.Active then
         pFIBDataSetECBN.Transaction.Commit;
      if pFIBDataSetECB.Active then
         pFIBDataSetECB.Close;
      if pFIBDataSetECB.Transaction.Active then
         pFIBDataSetECB.Transaction.Commit;
      if pFIBDataSetECBDP.Active then
         pFIBDataSetECBDP.Close;
      if pFIBDataSetECBDP.Transaction.Active then
         pFIBDataSetECBDP.Transaction.Commit;
      if pFIBDataSetECBIll.Active then
         pFIBDataSetECBIll.Close;
      if pFIBDataSetECBIll.Transaction.Active then
         pFIBDataSetECBIll.Transaction.Commit;
      if pFIBDataSetWS.Active then
         pFIBDataSetWS.Close;
      if pFIBDataSetWS.Transaction.Active then
         pFIBDataSetWS.Transaction.Commit;


end;

procedure TFormAnalyzeNalogi.FormCreate(Sender: TObject);
begin

 //    if isLNR then
     if true then
        begin
              TabSheetECB.Hide;
              TabSheetECBN.Hide;
              TabSheetECBDP.Hide;
              TabSheetIll.Hide;
              TabSheetECBI.Hide;

              TabSheetECB.TabVisible   := False;
              TabSheetECBN.TabVisible  := False;
              TabSheetECBDP.TabVisible := False;
              TabSheetIll.TabVisible   := False;
              TabSheetECBI.TabVisible  := False;

              TabSheetECB.Enabled   := false;
              TabSheetECBN.Enabled  := false;
              TabSheetECBDP.Enabled := false;
              TabSheetIll.Enabled   := false;
              TabSheetECBI.Enabled  := false;
              lblECB.Hide;
        end
     else
        begin
              TabSheetECB.Show;
              TabSheetECBN.Show;
              TabSheetECBDP.Show;
              TabSheetIll.Show;
              TabSheetECBI.Show;

              TabSheetECB.TabVisible   := true;
              TabSheetECBN.TabVisible  := true;
              TabSheetECBDP.TabVisible := true;
              TabSheetIll.TabVisible   := true;
              TabSheetECBI.TabVisible  := true;

              TabSheetECB.Enabled      := true;
              TabSheetECBN.Enabled     := true;
              TabSheetECBDP.Enabled    := true;
              TabSheetIll.Enabled      := true;
              TabSheetECBI.Enabled     := true;
              lblECB.Show;

        end;

end;

end.
