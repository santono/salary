unit UPODataModule;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  FIBQuery, pFIBQuery;

type
  TdmPO = class(TDataModule)
    pFIBdsWUS: TpFIBDataSet;
    pFIBTrWUS: TpFIBTransaction;
    pFIBTrWUSRead: TpFIBTransaction;
    dsWUS: TDataSource;
    pFIBdsWUSSHIFRID: TFIBSmallIntField;
    pFIBdsWUSNAME: TFIBStringField;
    pFIBdsWN: TpFIBDataSet;
    pFIBTrWN: TpFIBTransaction;
    pFIBTrWNRead: TpFIBTransaction;
    dsWN: TDataSource;
    pFIBdsWNSHIFRID: TFIBIntegerField;
    pFIBdsWNNAME: TFIBStringField;
    pFIBdsWNSOKRNAME: TFIBStringField;
    pFIBdsWNDATEFR: TFIBDateField;
    pFIBdsWNDATETO: TFIBDateField;
    pFIBdsWNPRIORITY: TFIBSmallIntField;
    dsWNS: TDataSource;
    pFIBdsWNS: TpFIBDataSet;
    pFIBTrWNS: TpFIBTransaction;
    pFIBTrWNSRead: TpFIBTransaction;
    pFIBdsWNSSHIFRID: TFIBIntegerField;
    pFIBdsWNSSHIFRIDOWNER: TFIBIntegerField;
    pFIBdsWNSDATEFR: TFIBDateField;
    pFIBdsWNSSUMMA: TFIBBCDField;
    pFIBdsWNSKIND: TFIBSmallIntField;
    pFIBdsWUZ: TpFIBDataSet;
    pFIBTrWUZ: TpFIBTransaction;
    pFIBTrWUZRead: TpFIBTransaction;
    dsWUZ: TDataSource;
    pFIBdsWUZSHIFRID: TFIBIntegerField;
    pFIBdsWUZNAMEFULL: TFIBStringField;
    pFIBdsWUZNAMESOKR: TFIBStringField;
    dsWUSPr: TDataSource;
    pFIBdsWUSPr: TpFIBDataSet;
    pFIBTrWUSPr: TpFIBTransaction;
    pFIBTrWUSPrRead: TpFIBTransaction;
    pFIBdsWUSPrSHIFRID: TFIBSmallIntField;
    pFIBdsWUSPrNAME: TFIBStringField;
    pFIBdsWUSPrSHORTNAME: TFIBStringField;
    pFIBdsWUSPrSHIFRWIDUCHST: TFIBSmallIntField;
    dsKadry: TDataSource;
    dsKadryPr: TDataSource;
    pFIBdsKadry: TpFIBDataSet;
    pFIBdsKadryPr: TpFIBDataSet;
    pFIBTrKadry: TpFIBTransaction;
    pFIBTrKadryRead: TpFIBTransaction;
    pFIBTrKadryPr: TpFIBTransaction;
    pFIBTrKadryPrRead: TpFIBTransaction;
    pFIBdsKadrySHIFRID: TFIBIntegerField;
    pFIBdsKadryTABNO: TFIBIntegerField;
    pFIBdsKadryFIO: TFIBStringField;
    pFIBdsKadryNAL_CODE: TFIBStringField;
    pFIBdsKadrySHIFR_POD: TFIBSmallIntField;
    pFIBdsKadryPIB: TFIBStringField;
    pFIBdsKadryPIB_ROD_PAD: TFIBStringField;
    pFIBdsKadryPIB_DAT_PAD: TFIBStringField;
    pFIBdsKadryDATA_PRI: TFIBDateField;
    pFIBdsKadryDATA_UW: TFIBDateField;
    pFIBdsKadryDATA_BIRTH: TFIBDateField;
    pFIBdsKadrySTAG_DO_Y: TFIBSmallIntField;
    pFIBdsKadrySTAG_DO_M: TFIBSmallIntField;
    pFIBdsKadrySTAG_P_DO_Y: TFIBSmallIntField;
    pFIBdsKadrySTAG_P_DO_M: TFIBSmallIntField;
    pFIBdsKadryDATE_STAG_P: TFIBDateField;
    pFIBdsKadryPASP_SER: TFIBStringField;
    pFIBdsKadryPASP_N: TFIBStringField;
    pFIBdsKadryPASP_DATA: TFIBDateField;
    pFIBdsKadryPASP_VYD: TFIBStringField;
    pFIBdsKadrySHIFR_POL: TFIBSmallIntField;
    pFIBdsKadryPROF: TFIBSmallIntField;
    pFIBdsKadryADRES: TFIBStringField;
    pFIBdsKadryMESTO_R: TFIBStringField;
    pFIBdsKadryCOMMENT: TFIBStringField;
    pFIBdsKadrySWID_SS_SER: TFIBStringField;
    pFIBdsKadrySWID_SS_NOM: TFIBStringField;
    pFIBdsKadryPrSHIFRID: TFIBIntegerField;
    pFIBdsKadryPrSHIFRIDOWNER: TFIBIntegerField;
    pFIBdsKadryPrCODETYPE: TFIBSmallIntField;
    pFIBdsKadryPrSHIFRUSZ: TFIBSmallIntField;
    pFIBdsKadryPrDATEFR: TFIBDateField;
    pFIBdsKadryPrDATETO: TFIBDateField;
    pFIBdsKadryPrNAME: TFIBStringField;
    pFIBdsWidNSpr: TpFIBDataSet;
    pFIBTrWidNSprRead: TpFIBTransaction;
    dsWidNSpr: TDataSource;
    dsPodr: TDataSource;
    pFIBdsPodr: TpFIBDataSet;
    pFIBTrPodr: TpFIBTransaction;
    pFIBTrPodrRead: TpFIBTransaction;
    pFIBdsPodrSHIFRPOD: TFIBIntegerField;
    pFIBdsPodrNAME: TFIBStringField;
    pFIBdsPodrNAME_K: TFIBStringField;
    dsShtatRaspPed: TDataSource;
    pFIBdsShtatRasPed: TpFIBDataSet;
    pFIBTrShtatRaspPed: TpFIBTransaction;
    pFIBTrShtatRaspPedRead: TpFIBTransaction;
    pFIBdsShtatRasPedSHIFRID: TFIBIntegerField;
    pFIBdsShtatRasPedSHIFRPOD: TFIBIntegerField;
    pFIBdsShtatRasPedDATEFR: TFIBDateField;
    pFIBdsShtatRasPedDATETO: TFIBDateField;
    pFIBdsShtatRaspPedRec: TpFIBDataSet;
    pFIBTrShtatRaspPedRec: TpFIBTransaction;
    pFIBTrShtatRaspPedRecRead: TpFIBTransaction;
    dsShtatRaspPedRec: TDataSource;
    pFIBdsShtatRaspPedRecSHIFRID: TFIBIntegerField;
    pFIBdsShtatRaspPedRecSHIFRIDOWN: TFIBIntegerField;
    pFIBdsShtatRaspPedRecLINENO: TFIBIntegerField;
    pFIBdsShtatRaspPedRecSHIFRIDK: TFIBIntegerField;
    pFIBdsShtatRaspPedRecTABNO: TFIBIntegerField;
    pFIBdsShtatRaspPedRecFIO: TFIBStringField;
    pFIBdsShtatRaspPedRecSHIFRUS: TFIBIntegerField;
    pFIBdsShtatRaspPedRecSHIFRUZ: TFIBIntegerField;
    pFIBdsShtatRaspPedRecSHIFRDOL: TFIBIntegerField;
    pFIBdsShtatRaspPedRecKOEFBUD: TFIBBCDField;
    pFIBdsShtatRaspPedRecKOEFVNE: TFIBBCDField;
    pFIBdsShtatRaspPedRecSHIFRPODOSN: TFIBIntegerField;
    pFIBdsShtatRaspPedRecSHIFRWR: TFIBSmallIntField;
    pFIBdsShtatRaspPedRecDATEFR: TFIBDateField;
    pFIBdsShtatRaspPedRecDATETO: TFIBDateField;
    pFIBdsShtatRaspPedRecFIOSpr: TFIBStringField;
    pFIBdsShtatRaspPedRecUZName: TStringField;
    pFIBdsShtatRaspPedRecUSName: TStringField;
    pFIBdsShtatRaspPedRecOsnPodrName: TStringField;
    dsDolg: TDataSource;
    pFIBDsDolg: TpFIBDataSet;
    pFIBTrDolgRead: TpFIBTransaction;
    pFIBDsDolgSHIFRDOL: TFIBIntegerField;
    pFIBDsDolgNAME: TFIBStringField;
    pFIBDsDolgRAZR: TFIBIntegerField;
    pFIBDsDolgOKLAD: TFIBBCDField;
    pFIBDsDolgNEED_STAG: TFIBSmallIntField;
    pFIBdsShtatRaspPedRecDolgName: TStringField;
    dsOrder: TDataSource;
    pFIBdsOrder: TpFIBDataSet;
    pFIBTrOrderRead: TpFIBTransaction;
    pFIBdsOrderSHIFRID: TFIBIntegerField;
    pFIBdsOrderNOMERORD: TFIBIntegerField;
    pFIBdsOrderDATEORD: TFIBDateField;
    pFIBdsOrderNAMEORD: TFIBStringField;
    pFIBQueryR: TpFIBQuery;
    pFIBTrQueryRRead: TpFIBTransaction;
    pFIBQueryRIn: TpFIBQuery;
    pFIBTrQueryRInRead: TpFIBTransaction;
    pFIBdsKadryPEDSTAGISPRIBLISIT: TFIBSmallIntField;
    pFIBdsKadryPEDSTAGY: TFIBBCDField;
    pFIBQueryW: TpFIBQuery;
    pFIBtrQueryW: TpFIBTransaction;
    pFIBdsKadryIS_PED: TFIBSmallIntField;
    dsWidyZasl: TDataSource;
    pFIBdsWidyZ: TpFIBDataSet;
    pFIBTrWidyZ: TpFIBTransaction;
    pFIBTrWidyZRead: TpFIBTransaction;
    pFIBdsWidyZSHIFRID: TFIBIntegerField;
    pFIBdsWidyZNAME: TFIBStringField;
    pFIBdsWidyZSHORTNAME: TFIBStringField;
    pFIBdsWidyZSHIFRNADB: TFIBIntegerField;
    pFIBdsWidNSprF_1: TFIBIntegerField;
    pFIBdsWidNSprF_2: TFIBIntegerField;
    pFIBdsWidNSprF_3: TFIBStringField;
    pFIBdsShtatRaspPedRecSHIFRZASL: TFIBSmallIntField;
    pFIBdsShtatRaspPedRecSTAGP: TFIBBCDField;
    pFIBdsKadryVERIFIED: TFIBSmallIntField;
    pFIBdsKadryDATEVER: TFIBDateTimeField;
    pFIBdsShtatRaspPedRecDolCalcName: TStringField;
    pFIBdsShtatRaspPedRecuzscalcname: TStringField;
    pFIBdsShtatRaspPedRecWRCalcName: TStringField;
    pFIBdsShtatRaspPedRecISZAWKAF: TFIBSmallIntField;
    pFIBdsShtatRaspPedRecISDEKAN: TFIBSmallIntField;
    pFIBdsShtatRaspPedRecISZAMDEKANA: TFIBSmallIntField;
    pFIBdsShtatRaspPedRecISDOCONOTHERSTAWKA: TFIBSmallIntField;
    pFIBdsShtatRaspPedRecPROCNUZ: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMANUZV: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMANUZB: TFIBBCDField;
    pFIBdsShtatRaspPedRecPROCNUS: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMANUSV: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMANUSB: TFIBBCDField;
    pFIBdsShtatRaspPedRecPROCNZASL: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMANZASLV: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMANZASLB: TFIBBCDField;
    pFIBdsShtatRaspPedRecPROCNPSTAG: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMANPSTAGB: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMANPSTAGV: TFIBBCDField;
    pFIBdsShtatRaspPedRecRAZR: TFIBSmallIntField;
    pFIBdsShtatRaspPedRecOKLADRAZR: TFIBBCDField;
    pFIBdsShtatRaspPedRecOKLADB: TFIBBCDField;
    pFIBdsShtatRaspPedRecOKLADV: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMAPOV: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMAPOVBUD: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMAPOVVNE: TFIBBCDField;
    pFIBdsShtatRaspPedRecPROCNADBZAWKAF: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMANADBZAWKAFBUD: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMANADBZAWKAFVNE: TFIBBCDField;
    pFIBdsShtatRaspPedRecFIXED: TFIBSmallIntField;
    pFIBdsKadryPrDATEPODTV: TFIBDateField;
    dsOrderRec: TDataSource;
    pFIBdsOrderRec: TpFIBDataSet;
    pFIBtrOrderRecRead: TpFIBTransaction;
    pFIBtrOrderReadWrite: TpFIBTransaction;
    pFIBdsOrderRecSHIFRID: TFIBIntegerField;
    pFIBdsOrderRecSHIFRIDOWNER: TFIBIntegerField;
    pFIBdsOrderRecSHIFRPOD: TFIBIntegerField;
    pFIBdsOrderRecLINENO: TFIBIntegerField;
    pFIBdsOrderRecTABNO: TFIBIntegerField;
    pFIBdsOrderRecFIO: TFIBStringField;
    pFIBdsOrderRecTEXT: TFIBStringField;
    pFIBdsOrderRecFIXED: TFIBSmallIntField;
    pFIBdsOrderRecSHIFRIDSHTRASPREC: TFIBIntegerField;
    pFIBdsShtatRaspPedRecNOTPRINT: TFIBSmallIntField;
    pFIBtrShtCmpRead: TpFIBTransaction;
    pFIBdsShtCmp: TpFIBDataSet;
    pFIBdsShtCmpTABNO: TFIBIntegerField;
    pFIBdsShtCmpFIO: TFIBStringField;
    pFIBdsShtCmpMES: TFIBStringField;
    dsShtCmp: TDataSource;
    dsExl: TDataSource;
    pFIBdsExl: TpFIBDataSet;
    pFIBtrExl: TpFIBTransaction;
    pFIBtrExlRead: TpFIBTransaction;
    pFIBdsExlSHIFRID: TFIBIntegerField;
    pFIBdsExlTABNO: TFIBIntegerField;
    pFIBdsExlSHIFRUNI: TFIBIntegerField;
    pFIBdsExlCOMMENT: TFIBStringField;
    pFIBdsExlDATEFR: TFIBDateField;
    pFIBdsFacList: TpFIBDataSet;
    pFIBtrFacList: TpFIBTransaction;
    pFIBtrFacListRead: TpFIBTransaction;
    dsFacList: TDataSource;
    pFIBdsFacListSHIFRID: TFIBIntegerField;
    pFIBdsFacListNAME: TFIBStringField;
    pFIBdsFacListDATECLOSE: TFIBDateField;
    pFIBdsFacListNAME_S: TFIBStringField;
    pFIBdsFacListNAME_K: TFIBStringField;
    pFIBdsZamDec: TpFIBDataSet;
    pFIBtrZamDec: TpFIBTransaction;
    pFIBtrZamDecRead: TpFIBTransaction;
    dsZamDec: TDataSource;
    pFIBdsZamDecSHIFRID: TFIBIntegerField;
    pFIBdsZamDecSHIFRIDKADRY: TFIBIntegerField;
    pFIBdsZamDecSHIFRFAC: TFIBIntegerField;
    pFIBdsZamDecDATEFR: TFIBDateField;
    pFIBdsZamDecDATETO: TFIBDateField;
    pFIBdsZamDecCODEDOLG: TFIBSmallIntField;
    pFIBdsZamDecnamedolg: TStringField;
    pFIBdsZamDecNameFac: TStringField;
    pFIBdsZamDecFIO: TStringField;
    pFIBdsZamDecPROCZAMDEC: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMAZAMDECBUD: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMAZAMDECVNE: TFIBBCDField;
    pFIBdsShtatRaspPedRecSUMMAZAMDECTOT: TFIBBCDField;
    pFIBdsShtatRaspPedRecPROCZAMDEC: TFIBBCDField;
    pFIBdsShtatRasPedSHIFRFAC: TFIBIntegerField;
    pFIBdsShtatRasPednamepod: TStringField;
    procedure pFIBdsPodrNAME_KChange(Sender: TField);
    procedure pFIBdsPodrBeforePost(DataSet: TDataSet);
    procedure pFIBdsKadryPEDSTAGYChange(Sender: TField);
    procedure dsKadryDataChange(Sender: TObject; Field: TField);
    procedure pFIBdsShtatRaspPedRecCalcFields(DataSet: TDataSet);
    procedure pFIBdsZamDecCalcFields(DataSet: TDataSet);
    procedure pFIBdsShtatRasPedCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPO: TdmPO;

implementation
   uses uFIBModule,ComObj,DateUtils, Variants;
{$R *.dfm}

procedure TdmPO.pFIBdsPodrNAME_KChange(Sender: TField);
 var S:string;
begin
     S:=pFIBdsPodrNAME_K.Value;
     s:=s;
end;

procedure TdmPO.pFIBdsPodrBeforePost(DataSet: TDataSet);
 var S:string;
begin
     S:=pFIBdsPodrNAME_K.Value;
     s:=s;
end;

procedure TdmPO.pFIBdsKadryPEDSTAGYChange(Sender: TField);
begin
 //  pFIBdsKadrySTAG_P_DO_Y.value:=Round(int(pFIBdsKadryPEDSTAGY.value));
 //  pFIBdsKadrySTAG_P_DO_M.value:=round(frac(pFIBdsKadryPEDSTAGY.value)*12.00);

end;

procedure TdmPO.dsKadryDataChange(Sender: TObject; Field: TField);
 //var i:Integer;
 //    s:string;
begin
  //   i:=1;
  //   if Field.Name='Verified' then
  //      if Field.Value.AsInteger=1 then
  //         i:=2;
  //   if Sender is TDBCheckBox then
  //      TDBCheckBox(Sender).Caption:='Проверено '+Вфеу

end;

procedure TdmPO.pFIBdsShtatRaspPedRecCalcFields(DataSet: TDataSet);
 var s:string;
begin
     case  pFIBdsShtatRaspPedRecSHIFRDOL.Value of
       90,100 : s:='зав.каф.';
       110 : s:='проф.';
       150 : s:='доц.';
       190 : s:='преп.';
       200 : s:='ст.преп.';
       220 : s:='асс.';
       240 : s:='пр.стаж.';
       else  s:='не изв.'
     end;
     if pFIBdsShtatRaspPedRecISZAWKAF.Value=1 then
        s:='зав.каф.';
     if pFIBdsShtatRaspPedRecISDEKAN.Value=1 then
        s:='декан';
     if pFIBdsShtatRaspPedRecISZAMDEKANA.Value=1 then
        s:='зам.декана';
     pFIBdsShtatRaspPedRecDolCalcName.Value:=s;
     s:=trim(pFIBdsShtatRaspPedRecUZName.Value);
     if Length(s)>1 then s:=s+',';
     s:=s+trim(pFIBdsShtatRaspPedRecUSName.Value);
     pFIBdsShtatRaspPedRecUZSCalcName.Value:=trim(s);
     s:='';
     if pFIBdsShtatRaspPedRecSHIFRWR.Value=2 then
        s:='Свм';
     pFIBdsShtatRaspPedRecWRCalcName.Value:=trim(s);
end;

procedure TdmPO.pFIBdsZamDecCalcFields(DataSet: TDataSet);
begin
     case pFIBdsZamDecCodedolg.Value of
       1 :
          pFIBdsZamDecnamedolg.Value:='Декан';
       2 :
          pFIBdsZamDecnamedolg.Value:='Зам.декана';
       3 :
          pFIBdsZamDecnamedolg.Value:='Директор';
       4 :
          pFIBdsZamDecnamedolg.Value:='Зам.директора';
       else
          pFIBdsZamDecnamedolg.Value:='неверно';
     end;

end;

procedure TdmPO.pFIBdsShtatRasPedCalcFields(DataSet: TDataSet);
 var SQLStmnt,S:string;
     v:variant;
begin
     SQLStmnt:='';
     if pFIBdsShtatRasPedSHIFRPOD.Value>0 then
        SQLStmnt:='select first 1 name from tb_k_podr where shifrpod='+IntToStr(pFIBdsShtatRasPedSHIFRPOD.Value)
     else
     if pFIBdsShtatRasPedSHIFRFAC.Value>0 then
        SQLStmnt:='select first 1 name from tb_k_facultety where shifrid='+IntToStr(pFIBdsShtatRasPedSHIFRFAC.Value);

     if Length(Trim(SQLStmnt))>0 then
        begin
             v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
             if VarIsStr(v) then
                pFIBdsShtatRasPedNamePod.Value:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0)
             else
                pFIBdsShtatRasPedNamePod.Value:='Не найден подр='+intToStr(pFIBdsShtatRasPedSHIFRPOD.Value);
        end
     else
        pFIBdsShtatRasPedNamePod.Value:='';
end;

end.
