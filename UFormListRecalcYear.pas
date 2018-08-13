{$H+}
unit UFormListRecalcYear;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, frxClass, frxDBSet, DB, DBClient,
  frxExportRTF, frxExportXLS,scrdef, frxExportPDF, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, dxExEdtr, ExtCtrls, DBCtrls,
  dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner, FIBSQLMonitor;

type
  TFormListRecalcYear = class(TForm)
    pb1: TProgressBar;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dsTest: TClientDataSet;
    dsTestshifrPod: TIntegerField;
    dsTesttabno: TIntegerField;
    frxDBDataset1: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxReport2: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    dsTestfio: TStringField;
    dsTestsummaJan: TFloatField;
    dsTestsummaFeb: TFloatField;
    dsTestsummaMar: TFloatField;
    dsTestsummaApr: TFloatField;
    dsTestsummaMay: TFloatField;
    dsTestsummaJun: TFloatField;
    dsTestsummaJul: TFloatField;
    dsTestsummaAug: TFloatField;
    dsTestsummaSep: TFloatField;
    dsTestsummaOct: TFloatField;
    dsTestsummaNov: TFloatField;
    dsTestsummaDec: TFloatField;
    rgShifrSta: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure frxrprt1GetValue(const VarName: String; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure frxReport2GetValue(const VarName: String;
      var Value: Variant);

  private
    { Private declarations }
      wantedMonth:Integer;
      wantedYear:Integer;
      wantedShifr : Integer;
      procedure makeTesting;
      procedure AddSummaFromUd(List:TList;Curr_Person:PERSON_PTR;Curr_Ud:UD_PTR);

  public
    { Public declarations }
  end;

var
  FormListRecalcYear: TFormListRecalcYear;
  type prec=^trec;
       trec=record
            tabno      : Integer;
            shifrpod   : Integer;
            summaJan   : Real;
            summaFeb   : Real;
            summaMar   : Real;
            summaApr   : Real;
            summaMay   : Real;
            summaJun   : Real;
            summaJul   : Real;
            summaAug   : Real;
            summaSep   : Real;
            summaOct   : Real;
            summaNov   : Real;
            summaDec   : Real;
           end;

   var dev:TextFile;        

implementation
  uses ScrUtil,scrio, UFibModule,UFormProgress,dateutils,UFormMinZP,
       uFormMkPensList,ScrLists;
  var List : TList;

  procedure TFormListRecalcYear.AddSummaFromUd(List:TList;Curr_Person:PERSON_PTR;Curr_Ud:UD_PTR);
    var finded : Boolean;
        rec    : prec;
        i      : Integer;
        y,m    : Integer;
    begin
          finded:=False;

          if List.count>0 then
             for i:=0 to List.Count-1 do
                 begin
                      if prec(List.Items[i]).tabno=Curr_Person.TABNO then
                      if prec(List.Items[i]).shifrpod = nsrv then
                         begin
                              case curr_ud^.PERIOD of
                               1 : prec(List.Items[i]).summaJan := prec(List.Items[i]).summaJan+curr_ud.SUMMA;
                               2 : prec(List.Items[i]).summaFeb := prec(List.Items[i]).summaFeb+curr_ud.SUMMA;
                               3 : prec(List.Items[i]).summaMar := prec(List.Items[i]).summaMar+curr_ud.SUMMA;
                               4 : prec(List.Items[i]).summaApr := prec(List.Items[i]).summaApr+curr_ud.SUMMA;
                               5 : prec(List.Items[i]).summaMay := prec(List.Items[i]).summaMay+curr_ud.SUMMA;
                               6 : prec(List.Items[i]).summaJun := prec(List.Items[i]).summaJun+curr_ud.SUMMA;
                               7 : prec(List.Items[i]).summaJul := prec(List.Items[i]).summaJul+curr_ud.SUMMA;
                               8 : prec(List.Items[i]).summaAug := prec(List.Items[i]).summaAug+curr_ud.SUMMA;
                               9 : prec(List.Items[i]).summaSep := prec(List.Items[i]).summaSep+curr_ud.SUMMA;
                              10 : prec(List.Items[i]).summaOct := prec(List.Items[i]).summaOct+curr_ud.SUMMA;
                              11 : prec(List.Items[i]).summaNov := prec(List.Items[i]).summaNov+curr_ud.SUMMA;
                              12 : prec(List.Items[i]).summaDec := prec(List.Items[i]).summaDec+curr_ud.SUMMA;
                              end;
                              finded := True;
                              break
                         end;
                 end;
          if not finded then
             begin
                  New(rec);
                  rec.tabno      := curr_person.tabno;
                  rec.summaJan   := 0;
                  rec.summaFeb   := 0;
                  rec.summaMar   := 0;
                  rec.summaApr   := 0;
                  rec.summaMay   := 0;
                  rec.summaJun   := 0;
                  rec.summaJul   := 0;
                  rec.summaAug   := 0;
                  rec.summaSep   := 0;
                  rec.summaOct   := 0;
                  rec.summaNov   := 0;
                  rec.summaDec   := 0;
                  case curr_ud^.PERIOD of
                   1 : rec.summaJan := curr_ud.SUMMA;
                   2 : rec.summaFeb := curr_ud.SUMMA;
                   3 : rec.summaMar := curr_ud.SUMMA;
                   4 : rec.summaApr := curr_ud.SUMMA;
                   5 : rec.summaMay := curr_ud.SUMMA;
                   6 : rec.summaJun := curr_ud.SUMMA;
                   7 : rec.summaJul := curr_ud.SUMMA;
                   8 : rec.summaAug := curr_ud.SUMMA;
                   9 : rec.summaSep := curr_ud.SUMMA;
                  10 : rec.summaOct := curr_ud.SUMMA;
                  11 : rec.summaNov := curr_ud.SUMMA;
                  12 : rec.summaDec := curr_ud.SUMMA;
                  end;
                  rec.shifrpod   := NSRV;
                  list.Add(rec);
             end;
    end;

 {$R *.dfm}

procedure TFormListRecalcYear.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormListRecalcYear.makeTesting;
  var tmpNMES , tmpNSRV , i_nsrv , i : Integer;
      Curr_Person : PERSON_PTR;
      Curr_Ud     : UD_PTR;
      Count       : Integer;
      fio         : string;
      v           : Variant;
      SQLStmnt    : string;
      summa       : Real;
  begin
       if isSVDN then
          if rgShifrSta.itemIndex=1 then
             wantedShifr:=WAR_SBOR_SHIFR
          else
             wantedShifr:=PODOH_SHIFR;

       tmpNMES := NMES;
       tmpNSRV := NSRV;
       putinf;
       EMPTY_ALL_PERSON;
       pb1.Max      := Count_Serv;
       pb1.Min      := 0;
       pb1.Position := 0;
       COUNT        := 0;
       list   := TList.Create;
       for i_nsrv:=1 to Count_Serv do
           begin
                pb1.Position := i_nsrv ;
                lbl1.Caption := Name_Serv(i_nsrv);
                Application.ProcessMessages ;
                nsrv:=i_nsrv;
                mkflnm;
                if not FileExists(fninf) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (Curr_Person<>Nil) do
                  begin
                       curr_Ud:=curr_person.Ud;
                       while (Curr_Ud<>Nil) do
                         begin
                              if (Curr_Ud^.SHIFR=wantedshifr)
                                 and (curr_ud^.Period<nmes) then
                              if ((Curr_ud^.YEAR+1990)=CURRYEAR) then   
                              AddSummaFromUd(List,Curr_Person,Curr_Ud);
                              Curr_Ud:=Curr_Ud.Next;
                         end;
                       Curr_Person:=Curr_Person.NEXT;
                  end;
                EMPTY_ALL_PERSON;

           end;
       if List.Count>0 then
          begin
              dsTest.Open;
              for i:=0 to list.count-1 do
                  begin
                      dstest.Append;
                      dsTestshifrPod.Value:=prec(List.Items[i]).shifrpod;
                      dsTesttabno.Value:=prec(List.Items[i]).tabno;
                      dsTestsummaJan.Value:=prec(List.Items[i]).summaJan;
                      dsTestsummaFeb.Value:=prec(List.Items[i]).summaFeb;
                      dsTestsummaMar.Value:=prec(List.Items[i]).summaMar;
                      dsTestsummaApr.Value:=prec(List.Items[i]).summaApr;
                      dsTestsummaMay.Value:=prec(List.Items[i]).summaMay;
                      dsTestsummaJun.Value:=prec(List.Items[i]).summaJun;
                      dsTestsummaJul.Value:=prec(List.Items[i]).summaJul;
                      dsTestsummaAug.Value:=prec(List.Items[i]).summaAug;
                      dsTestsummaSep.Value:=prec(List.Items[i]).summaSep;
                      dsTestsummaOct.Value:=prec(List.Items[i]).summaOct;
                      dsTestsummaNov.Value:=prec(List.Items[i]).summaNov;
                      dsTestsummaDec.Value:=prec(List.Items[i]).summaDec;
                      dsTestfio.Value:=GetFullUkrFioPerson(dsTesttabno.Value);
                      dstest.Post;
                  end;
               for i:=0 to List.Count-1 do
                  Dispose(pRec(List.Items[i]));
               frxreport2.ShowReport;
               dsTest.Close;
          end
        //  ShowMessage('Найдено '+intToStr(Count)+' несоответствий')
       else
          ShowMessage('Не найдено сотрудников ');
       List.Free;
       NMES := tmpNMES;
       NSRV := tmpNSRV;
       mkflnm;
       getInf(true);

  end;


procedure TFormListRecalcYear.btn1Click(Sender: TObject);
begin
     makeTesting;
     Close;
end;

procedure TFormListRecalcYear.frxrprt1GetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthRus(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          Value:=IntToStr(CURRYEAR)+' г.';
end;

procedure TFormListRecalcYear.FormCreate(Sender: TObject);
begin
      wantedYear:=CURRYEAR;
      wantedMonth:=NMES;
      lbl1.Caption:='';
      wantedShifr:=PODOH_SHIFR;
      rgShifrSta.ItemIndex:=0;
end;




procedure TFormListRecalcYear.frxReport2GetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthUkr(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='NAMESTA') then
          Value:=trim(ShifrList.GetName(wantedShifr))
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          if isSVDN then
             Value:=IntToStr(CURRYEAR)+' р.'
          else
             Value:=IntToStr(CURRYEAR)+' г.';
end;






end.
