unit UFormRepRLForBoln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, frxClass, frxDBSet, StdCtrls, Buttons, ExtCtrls,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, frxExportRTF,
  frxExportXLS, frxExportTXT, frxExportText;

type
  TFormRepRLForBoln = class(TForm)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxDBDataset3: TfrxDBDataset;
    frxDBDataset4: TfrxDBDataset;
    frxDBDataset5: TfrxDBDataset;
    frxDBDataset6: TfrxDBDataset;
    cds1: TClientDataSet;
    cds2: TClientDataSet;
    cds3: TClientDataSet;
    cds4: TClientDataSet;
    cds5: TClientDataSet;
    cds6: TClientDataSet;
    rgWr: TRadioGroup;
    rgMark: TRadioGroup;
    BitOk: TBitBtn;
    rgPart: TRadioGroup;
    dsSummy: TpFIBDataSet;
    dsBolnA: TpFIBDataSet;
    dsSummySHIFRID: TFIBIntegerField;
    dsSummySEL: TFIBSmallIntField;
    dsSummyMONTH_ZA: TFIBSmallIntField;
    dsSummyYEAR_ZA: TFIBSmallIntField;
    dsBolnAW_PLACE: TFIBSmallIntField;
    dsBolnAW_R: TFIBSmallIntField;
    dsBolnASHIFRGRU: TFIBSmallIntField;
    dsBolnASHIFRKAT: TFIBSmallIntField;
    dsBolnASHIFRSTA: TFIBSmallIntField;
    dsBolnAMONTH_ZA: TFIBSmallIntField;
    dsBolnAYEAR_ZA: TFIBSmallIntField;
    dsBolnAMONTH_VY: TFIBSmallIntField;
    dsBolnAYEAR_VY: TFIBSmallIntField;
    dsBolnASUMMA: TFIBBCDField;
    dsBolnAVYPL: TFIBSmallIntField;
    dsBolnAMARKED: TFIBSmallIntField;
    trSummy: TpFIBTransaction;
    trBolnA: TpFIBTransaction;
    cds1shifrSta: TIntegerField;
    cds1nameSta: TStringField;
    cds1shifrKat: TIntegerField;
    cds1nameKat: TStringField;
    cds1shifrGru: TIntegerField;
    cds1nameGru: TStringField;
    cds1yearZa: TIntegerField;
    cds1monthZa: TIntegerField;
    cds1yearVy: TIntegerField;
    cds1monthVy: TIntegerField;
    cds1Mark: TIntegerField;
    cds1shifrWr: TIntegerField;
    cds1nameWR: TStringField;
    cds1shifrPod: TIntegerField;
    cds1namePod: TStringField;
    cds1summa: TFloatField;
    cds2shifrSta: TIntegerField;
    cds2nameSta: TStringField;
    cds2shifrKat: TIntegerField;
    cds2nameKat: TStringField;
    cds2shifrGru: TIntegerField;
    cds2nameGru: TStringField;
    cds2yearZa: TIntegerField;
    cds2monthZa: TIntegerField;
    cds2yearVy: TIntegerField;
    cds2monthVy: TIntegerField;
    cds2Mark: TIntegerField;
    cds2shifrWr: TIntegerField;
    cds2nameWR: TStringField;
    cds2shifrPod: TIntegerField;
    cds2namePod: TStringField;
    cds2summa: TFloatField;
    cds3shifrSta: TIntegerField;
    cds3nameSta: TStringField;
    cds3shifrKat: TIntegerField;
    cds3nameKat: TStringField;
    cds3shifrGru: TIntegerField;
    cds3nameGru: TStringField;
    cds3yearZa: TIntegerField;
    cds3monthZa: TIntegerField;
    cds3yearVy: TIntegerField;
    cds3monthVy: TIntegerField;
    cds3Mark: TIntegerField;
    cds3shifrWr: TIntegerField;
    cds3nameWR: TStringField;
    cds3shifrPod: TIntegerField;
    cds3namePod: TStringField;
    cds3summa: TFloatField;
    cds4shifrSta: TIntegerField;
    cds4nameSta: TStringField;
    cds4shifrKat: TIntegerField;
    cds4nameKat: TStringField;
    cds4shifrGru: TIntegerField;
    cds4nameGru: TStringField;
    cds4yearZa: TIntegerField;
    cds4monthZa: TIntegerField;
    cds4yearVy: TIntegerField;
    cds4monthVy: TIntegerField;
    cds4Mark: TIntegerField;
    cds4shifrWr: TIntegerField;
    cds4nameWR: TStringField;
    cds4shifrPod: TIntegerField;
    cds4namePod: TStringField;
    cds4summa: TFloatField;
    cds5shifrSta: TIntegerField;
    cds5nameSta: TStringField;
    cds5shifrKat: TIntegerField;
    cds5nameKat: TStringField;
    cds5shifrGru: TIntegerField;
    cds5nameGru: TStringField;
    cds5yearZa: TIntegerField;
    cds5monthZa: TIntegerField;
    cds5yearVy: TIntegerField;
    cds5monthVy: TIntegerField;
    cds5Mark: TIntegerField;
    cds5shifrWr: TIntegerField;
    cds5nameWR: TStringField;
    cds5shifrPod: TIntegerField;
    cds5namePod: TStringField;
    cds5summa: TFloatField;
    cds6shifrSta: TIntegerField;
    cds6nameSta: TStringField;
    cds6shifrKat: TIntegerField;
    cds6nameKat: TStringField;
    cds6shifrGru: TIntegerField;
    cds6nameGru: TStringField;
    cds6yearZa: TIntegerField;
    cds6monthZa: TIntegerField;
    cds6yearVy: TIntegerField;
    cds6monthVy: TIntegerField;
    cds6Mark: TIntegerField;
    cds6shifrWr: TIntegerField;
    cds6nameWR: TStringField;
    cds6shifrPod: TIntegerField;
    cds6namePod: TStringField;
    cds6summa: TFloatField;
    cds1MrkS: TStringField;
    cds1ZaS: TStringField;
    cds1VyS: TStringField;
    cds2MrkS: TStringField;
    cds2ZaS: TStringField;
    cds2VyS: TStringField;
    cds3MrkS: TStringField;
    cds3ZaS: TStringField;
    cds3VyS: TStringField;
    cds4MrkS: TStringField;
    cds4ZaS: TStringField;
    cds4VyS: TStringField;
    cds5MrkS: TStringField;
    cds5ZaS: TStringField;
    cds5VyS: TStringField;
    cds6MrkS: TStringField;
    cds6ZaS: TStringField;
    cds6VyS: TStringField;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxTXTExport1: TfrxTXTExport;
    procedure BitOkClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    shifrIdBoln : Integer;
    FIO      : string;
    tabno    : Integer;
    modeWr   : Integer;
    modeMark : Integer;
    modePart : Integer;
    dateFr   : TDate;
    dateTo   : TDate;
    dateFrS  : string;
    dateToS  : string;
    nomerB   : string;
    list     : TList;
    month1S,month2S,month3S,month4S,month5S,month6s:string;
    headers:string;
    procedure createReport;
    procedure fillCdsRec(number:Integer;
                         shifrSta:integer;
                         shifrKat:integer;
                         shifrGru:Integer;
                         shifrPod:Integer;
                         summa:Real;
                         MONTH_VY:Integer;
                         year_vy:Integer;
                         month_za:Integer;
                         year_Za:Integer;
                         shifrWr:integer;
                         marked:integer);
  public
    { Public declarations }
    constructor myCreate(AOwner: TComponent;shifrIdBoln:Integer);
  end;

var
  FormRepRLForBoln: TFormRepRLForBoln;

implementation
  uses USQLUnit,DateUtils,UFibModule,ScrUtil,uFormWait;
  type pRecSummy=^TRecSummy;
       trecSummy=record
                 shifridBolnSummy:Integer;
                 shifrMon:integer;
                 year:Integer;

                end;
{$R *.dfm}

constructor TFormRepRLForBoln.myCreate(AOwner: TComponent;shifrIdBoln:Integer);
  var SQLStmnt:string;
      v : Variant;
      shifrIdBolnSummy:Integer;
      recSummy:pRecSummy;
      j:Integer;
  begin
       inherited Create(AOwner);
       self.shifrIdBoln:=shifrIdBoln;
       modeMark:=0;
       modeWr  :=0;
       modePart:=0;
       SQLStmnt := 'select first 1 coalesce(fio,''Íå óêàçàíà''),coalesce(tabno,0),coalesce(modeWR,1),f_data,l_data,coalesce(nomer_b,'' '') from boln where shifrid='+IntToStr(Self.shifridBoln);
       v:=SQLQueryRecValues(SQLStmnt);
       Self.FIO:=Trim(v[0]);
       Self.tabno:=v[1];
       Self.modeWr:=v[2];
       if Self.Tabno>0 then
          Self.FIO:=Trim(GetFullRusFioPerson(self.tabno));
       case Self.modeWr of
            1: Self.modeWr := 0;
            2: Self.modeWr := 1;
           else
               Self.modeWr:=2;
       end;
       rgWr.ItemIndex:=Self.modeWr;
       rgMark.ItemIndex:=modeMark;
       rgPart.ItemIndex:=modePart;
       dateFr:=v[3];
       dateTo:=v[4];
       nomerB:=v[5];
       nomerB:=trim(nomerB);
       dateFrS:=IntToStr(DayOf(dateFr))+'.'+IntToStr(monthOf(dateFr))+'.'+IntToStr(yearOf(dateFr));
       dateToS:=IntToStr(DayOf(dateTo))+'.'+IntToStr(monthOf(dateTo))+'.'+IntToStr(yearOf(dateTo));
       self.caption:='Áîëüíè÷íûé '+Trim(nomerB)+' '+Trim(fio)+' c '+dateFrS+' ïî '+dateToS;
       list:=TList.Create;
       dsSummy.Transaction.StartTransaction;
       dsSummy.Params[0].Value:=Self.shifrIdBoln;
       dsSummy.Open;
       j:=0;
       month1S:='';
       month2S:='';
       month3S:='';
       month4S:='';
       month5S:='';
       month6S:='';
       headers:=self.Caption;
       while not dsSummy.Eof do
         begin
              New(recSummy);
              recSummy^.shifrIdBolnSummy:=dsSummySHIFRID.Value;
              recSummy^.shifrMon:=dsSummyMONTH_ZA.Value;
              recSummy^.year:=dsSummyYEAR_ZA.Value;
              list.add(recSummy);
              inc(j);
              case j of
               1: month1S:=GetMonthRus(recSummy^.shifrMon)+' '+IntToStr(recSummy^.year);
               2: month2S:=GetMonthRus(recSummy^.shifrMon)+' '+IntToStr(recSummy^.year);
               3: month3S:=GetMonthRus(recSummy^.shifrMon)+' '+IntToStr(recSummy^.year);
               4: month4S:=GetMonthRus(recSummy^.shifrMon)+' '+IntToStr(recSummy^.year);
               5: month5S:=GetMonthRus(recSummy^.shifrMon)+' '+IntToStr(recSummy^.year);
               6: month6S:=GetMonthRus(recSummy^.shifrMon)+' '+IntToStr(recSummy^.year);
              end;
              dsSummy.Next;
         end;
       dsSummy.Close;
       dsSummy.Transaction.Commit;

  end;

procedure TFormRepRLForBoln.BitOkClick(Sender: TObject);
begin
     CreateReport;
end;

procedure TFormRepRLForBoln.createReport;
 var i,j,startI:Integer;
     recSummy:pRecSummy;
     m,y:Integer;
 begin
      startI:=0;
      modePart:=rgPart.ItemIndex;
      if modePart=1 then
         startI:=6;
      modeMark:=rgMark.ItemIndex;
      modeWr:=rgWr.itemIndex;
      j:=0;
      cds1.EmptyDataSet;
      cds2.EmptyDataSet;
      cds3.EmptyDataSet;
      cds4.EmptyDataSet;
      cds5.EmptyDataSet;
      cds6.EmptyDataSet;
      cds1.Open;
      cds2.Open;
      cds3.Open;
      cds4.Open;
      cds5.Open;
      cds6.Open;
      formWait.Show;
      Application.ProcessMessages;
      dsBolnA.Transaction.StartTransaction;
      for i:=0 to list.Count-1 do
        begin
          if i>=startI then
             begin
                  inc(j);
                  if j>6 then Break;
                  m:=pRecSummy(list.items[i]).shifrMon;
                  y:=pRecSummy(list.items[i]).year;
                  case j of
                   1: month1S:=GetMonthRus(m)+' '+IntToStr(y);
                   2: month2S:=GetMonthRus(m)+' '+IntToStr(y);
                   3: month3S:=GetMonthRus(m)+' '+IntToStr(y);
                   4: month4S:=GetMonthRus(m)+' '+IntToStr(y);
                   5: month5S:=GetMonthRus(m)+' '+IntToStr(y);
                   6: month6S:=GetMonthRus(m)+' '+IntToStr(y);
                  end;

                  dsBolnA.Params[0].Value:=pRecSummy(list.items[i]).shifridBolnSummy;
                  dsBolnA.Open;
                  while not dsBolnA.Eof do
                   begin
                        if ((modeMark=0) and (dsBolnAMARKED.Value=1)) or
                           ((modeMark=1) and (dsBolnAMARKED.Value<>1)) or
                            (modeMark=2) then
                        if ((modeWR=0) and (dsBolnAW_R.Value=1)) or
                           ((modeWR=1) and (dsBolnAMARKED.Value=2)) or
                            (modeWR=2) then
                           begin
                                fillCdsRec(j,
                                  dsBolnASHIFRSTA.Value,
                                  dsBolnASHIFRKAT.Value,
                                  dsBolnASHIFRGRU.Value,
                                  dsBolnAW_PLACE.Value,
                                  dsBolnASUMMA.Value,
                                  dsBolnAMONTH_VY.Value,
                                  dsBolnAYEAR_VY.Value,
                                  dsBolnAMONTH_ZA.Value,
                                  dsBolnAYEAR_ZA.Value,
                                  dsBolnAW_R.Value,
                                  dsBolnAMarked.Value
                                );
                           end;
                        dsBolnA.Next;
                   end;
                  dsBolnA.Close;
             end;
        end;
      dsBolnA.Transaction.Commit;
      formWait.Hide;
      Application.ProcessMessages;
      frxReport1.ShowReport;
 end;

procedure TFormRepRLForBoln.fillCdsRec(number:Integer;
                                  shifrSta:integer;
                                  shifrKat:integer;
                                  shifrGru:Integer;
                                  shifrPod:Integer;
                                  summa:Real;
                                  MONTH_VY:Integer;
                                  year_vy:Integer;
                                  month_za:Integer;
                                  year_Za:Integer;
                                  shifrWR:integer;
                                  marked : Integer
                                  );
  begin
     if number in [1,7] then
        begin
            cds1.Append;
            cds1ShifrSta.Value:= shifrSta;
            cds1NameSta.Value := GetNameShifr(shifrSta);
            cds1ShifrKat.Value:= shifrKat;
            cds1NameKat.Value := GET_kat_name(shifrKat);
            cds1ShifrGru.Value:= shifrGru;
            cds1nameGru.Value := GET_IST_NAME(shifrGru);
            cds1ShifrPod.Value:= shifrPod;
            cds1namePod.Value := Name_Serv(shifrPod);
            cds1Summa.Value   := summa;
            cds1monthVy.Value := MONTH_VY;
            cds1yearVy.Value  := year_vy;
            cds1monthZa.Value := MONTH_za;
            cds1yearZa.Value  := year_za;
            cds1ShifrWr.Value := shifrWr;
            if shifrWr=1 then
               cds1nameWR.Value:='Îñí'
            else
               cds1nameWR.Value:='Ñâì';
            cds1Mark.Value    := MARKED;
            cds1MrkS.Value    := ' ';
            if marked=1 then
               cds1MrkS.Value    := '*';
            cds1ZaS.Value := IntToStr(Month_za)+' '+IntToStr(year_Za);           
            cds1VyS.Value := IntToStr(Month_Vy)+' '+IntToStr(year_Vy);
            cds1.Post;
        end;
     if number in [2,8] then
        begin
            cds2.Append;
            cds2ShifrSta.Value:= shifrSta;
            cds2NameSta.Value := GetNameShifr(shifrSta);
            cds2ShifrKat.Value:= shifrKat;
            cds2NameKat.Value := GET_kat_name(shifrKat);
            cds2ShifrGru.Value:= shifrGru;
            cds2nameGru.Value := GET_IST_NAME(shifrGru);
            cds2ShifrPod.Value:= shifrPod;
            cds2namePod.Value := Name_Serv(shifrPod);
            cds2Summa.Value   := summa;
            cds2monthVy.Value := MONTH_VY;
            cds2yearVy.Value  := year_vy;
            cds2monthZa.Value := MONTH_za;
            cds2yearZa.Value  := year_za;
            cds2ShifrWr.Value := shifrWr;
            if shifrWr=1 then
               cds2nameWR.Value:='Îñí'
            else
               cds2nameWR.Value:='Ñâì';
            cds2Mark.Value    := MARKED;
            cds2MrkS.Value    := ' ';
            if marked=1 then
               cds2MrkS.Value    := '*';
            cds2ZaS.Value := IntToStr(Month_za)+' '+IntToStr(year_Za);
            cds2VyS.Value := IntToStr(Month_Vy)+' '+IntToStr(year_Vy);
            cds2.Post;
        end;
     if number in [3,9] then
        begin
            cds3.Append;
            cds3ShifrSta.Value:= shifrSta;
            cds3NameSta.Value := GetNameShifr(shifrSta);
            cds3ShifrKat.Value:= shifrKat;
            cds3NameKat.Value := GET_kat_name(shifrKat);
            cds3ShifrGru.Value:= shifrGru;
            cds3nameGru.Value := GET_IST_NAME(shifrGru);
            cds3ShifrPod.Value:= shifrPod;
            cds3namePod.Value := Name_Serv(shifrPod);
            cds3Summa.Value   := summa;
            cds3monthVy.Value := MONTH_VY;
            cds3yearVy.Value  := year_vy;
            cds3monthZa.Value := MONTH_za;
            cds3yearZa.Value  := year_za;
            cds3ShifrWr.Value := shifrWr;
            if shifrWr=1 then
               cds3nameWR.Value:='Îñí'
            else
               cds3nameWR.Value:='Ñâì';
            cds3Mark.Value    := MARKED;
            cds3MrkS.Value    := ' ';
            if marked=1 then
               cds3MrkS.Value    := '*';
            cds3ZaS.Value := IntToStr(Month_za)+' '+IntToStr(year_Za);
            cds3VyS.Value := IntToStr(Month_Vy)+' '+IntToStr(year_Vy);
            cds3.Post;
        end;
     if number in [4,10] then
        begin
            cds4.Append;
            cds4ShifrSta.Value:= shifrSta;
            cds4NameSta.Value := GetNameShifr(shifrSta);
            cds4ShifrKat.Value:= shifrKat;
            cds4NameKat.Value := GET_kat_name(shifrKat);
            cds4ShifrGru.Value:= shifrGru;
            cds4nameGru.Value := GET_IST_NAME(shifrGru);
            cds4ShifrPod.Value:= shifrPod;
            cds4namePod.Value := Name_Serv(shifrPod);
            cds4Summa.Value   := summa;
            cds4monthVy.Value := MONTH_VY;
            cds4yearVy.Value  := year_vy;
            cds4monthZa.Value := MONTH_za;
            cds4yearZa.Value  := year_za;
            cds4ShifrWr.Value := shifrWr;
            if shifrWr=1 then
               cds4nameWR.Value:='Îñí'
            else
               cds4nameWR.Value:='Ñâì';
            cds4Mark.Value    := MARKED;
            cds4MrkS.Value    := ' ';
            if marked=1 then
               cds4MrkS.Value    := '*';
            cds4ZaS.Value := IntToStr(Month_za)+' '+IntToStr(year_Za);
            cds4VyS.Value := IntToStr(Month_Vy)+' '+IntToStr(year_Vy);
            cds4.Post;
        end;
     if number in [5,11] then
        begin
            cds5.Append;
            cds5ShifrSta.Value:= shifrSta;
            cds5NameSta.Value := GetNameShifr(shifrSta);
            cds5ShifrKat.Value:= shifrKat;
            cds5NameKat.Value := GET_kat_name(shifrKat);
            cds5ShifrGru.Value:= shifrGru;
            cds5nameGru.Value := GET_IST_NAME(shifrGru);
            cds5ShifrPod.Value:= shifrPod;
            cds5namePod.Value := Name_Serv(shifrPod);
            cds5Summa.Value   := summa;
            cds5monthVy.Value := MONTH_VY;
            cds5yearVy.Value  := year_vy;
            cds5monthZa.Value := MONTH_za;
            cds5yearZa.Value  := year_za;
            cds5ShifrWr.Value := shifrWr;
            if shifrWr=1 then
               cds5nameWR.Value:='Îñí'
            else
               cds5nameWR.Value:='Ñâì';
            cds5Mark.Value    := MARKED;
            cds5MrkS.Value    := ' ';
            if marked=1 then
               cds5MrkS.Value    := '*';
            cds5ZaS.Value := IntToStr(Month_za)+' '+IntToStr(year_Za);
            cds5VyS.Value := IntToStr(Month_Vy)+' '+IntToStr(year_Vy);
            cds5.Post;
        end;
     if number in [6,12] then
        begin
            cds6.Append;
            cds6ShifrSta.Value:= shifrSta;
            cds6NameSta.Value := GetNameShifr(shifrSta);
            cds6ShifrKat.Value:= shifrKat;
            cds6NameKat.Value := GET_kat_name(shifrKat);
            cds6ShifrGru.Value:= shifrGru;
            cds6nameGru.Value := GET_IST_NAME(shifrGru);
            cds6ShifrPod.Value:= shifrPod;
            cds6namePod.Value := Name_Serv(shifrPod);
            cds6Summa.Value   := summa;
            cds6monthVy.Value := MONTH_VY;
            cds6yearVy.Value  := year_vy;
            cds6monthZa.Value := MONTH_za;
            cds6yearZa.Value  := year_za;
            cds6ShifrWr.Value := shifrWr;
            if shifrWr=1 then
               cds6nameWR.Value:='Îñí'
            else
               cds6nameWR.Value:='Ñâì';
            cds6Mark.Value    := MARKED;
            cds6MrkS.Value    := ' ';
            if marked=1 then
               cds6MrkS.Value    := '*';
            cds6ZaS.Value := IntToStr(Month_za)+' '+IntToStr(year_Za);
            cds6VyS.Value := IntToStr(Month_Vy)+' '+IntToStr(year_Vy);
            cds6.Post;
        end;
  end;

procedure TFormRepRLForBoln.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'Header')=0 then
        value:=self.headers
     else
     if CompareText(VarName,'Month1')=0 then
        Value:=Self.month1S
     else
     if CompareText(VarName,'Month2')=0 then
        Value:=Self.month2S
     else
     if CompareText(VarName,'Month3')=0 then
        Value:=Self.month3S
     else
     if CompareText(VarName,'Month4')=0 then
        Value:=Self.month4S
     else
     if CompareText(VarName,'Month5')=0 then
        Value:=Self.month5S
     else
     if CompareText(VarName,'Month6')=0 then
        Value:=Self.month6S;

end;

procedure TFormRepRLForBoln.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
     list.Clear;
     list.Free;
     if cds1.Active then
        cds1.Close;
     if cds2.Active then
        cds2.Close;
     if cds3.Active then
        cds3.Close;
     if cds4.Active then
        cds4.Close;
     if cds5.Active then
        cds5.Close;
     if cds6.Active then
        cds6.Close;
     Action:=caFree;   
end;

end.

