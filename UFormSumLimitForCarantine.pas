unit UFormSumLimitForCarantine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  StdCtrls, ComCtrls, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  dxDBTLCl, dxGrClms, Buttons, DBClient,MidasLib, frxClass, frxDBSet,
  frxExportRTF, frxExportXLS, frxExportPDF;

type
  tModeSQL=(ModeVy,ModeZA,Mode2011);

  TFormSumLimitForCarantine = class(TForm)
    Button1: TButton;
    CDS2011: TClientDataSet;
    dsoCDS2011: TDataSource;
    CDS2011Tabno: TIntegerField;
    CDS2011FIO: TStringField;
    CDS2011Summa: TFloatField;
    dxDBGridCDS2011: TdxDBGrid;
    dxDBGridCDS2011Tabno: TdxDBGridMaskColumn;
    dxDBGridCDS2011FIO: TdxDBGridMaskColumn;
    dxDBGridCDS2011Summa: TdxDBGridMaskColumn;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    cbWR: TComboBox;
    dxDBGridCDS2011SummaOsn: TdxDBGridMaskColumn;
    dxDBGridCDS2011SummaSowm: TdxDBGridMaskColumn;
    dxDBGridCDS2011SummaPochas: TdxDBGridMaskColumn;
    CDS2011SummaOsn: TFloatField;
    CDS2011SummaSowm: TFloatField;
    CDS2011SummaPochas: TFloatField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbWRChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);

  private
    summaLimit:real;
    procedure MakeCurrentSummy(WantedY:Integer;WantedM:Integer);
    function  FindRecInList(tabno:integer):pointer;
    function GetLimitSummaForCarantine:real;
    procedure BuildList;
    procedure makeCaption;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSumLimitForCarantine: TFormSumLimitForCarantine;

implementation
  uses DateUtils,ScrDef,ScrUtil,ScrIo,UFormprogress,
       uFormWait,IniFiles,USQLUnit; // ,UCDSFactory,

  type pPersonSummyRec = ^tPersonSummyRec;
       tPersonSummyRec = record
                          tabno           : Integer;
                          fio             : string;
                          summaza         : Real;
                          summavy         : Real;
                          summa2011       : Real;
                          summazaOsn      : Real;
                          summavyOsn      : Real;
                          summa2011Osn    : Real;
                          summazaSowm     : Real;
                          summavySowm     : Real;
                          summa2011Sowm   : Real;
                          summazaPochas   : Real;
                          summavyPochas   : Real;
                          summa2011Pochas : Real;
                         end;

   var PersonSummyList : TList;
{$R *.dfm}

procedure TFormSumLimitForCarantine.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if CDS2011.Active then
        CDS2011.Close;
     Action:=caFree;
end;

procedure TFormSumLimitForCarantine.Button1Click(Sender: TObject);
 var S:string;

begin
      BitBtn1.Enabled := False;
      Button1.Enabled := False;
      Application.ProcessMessages;
      BuildList;
      BitBtn2.Enabled := True;
      BitBtn2.Show;
      BitBtn1.Enabled := true;
      Button1.Enabled := true;
      Application.ProcessMessages;
end;

procedure TFormSumLimitForCarantine.FormCreate(Sender: TObject);
var s:string;
begin
     checkBox1.Checked:=false;
     cbWR.ItemIndex:=0;
     summaLimit:=GetLimitSummaForCarantine;
     makeCaption;
     BitBtn2.Enabled:=False;
     BitBtn2.Hide;
end;

procedure TFormSumLimitForCarantine.makeCaption;
var s:string;
 begin
     S:='';
     if cbWR.ItemIndex=1 then S:='��������'
     else
     if cbWR.ItemIndex=2 then S:='����������';
//     Caption:='����� = '+FormatSummaForPlt(summaLimit)+' � '+getMonthRus(NMES)+' '+intToStr(CurrYear)+' '+S;
     Caption:='����� = '+FormatSummaForPlt(summaLimit)+' � '+getMonthRus(NMES)+' '+intToStr(CurrYear);
 end;
function SortPersonRec(Item1, Item2  : Pointer): Integer;
 var personSummyRec1,personSummyRec2 : pPersonSummyRec;
     retVal:Integer;
 begin
      if pPersonSummyRec(Item1).tabno>pPersonSummyRec(Item2).tabno then
         retVal:=1
      else if pPersonSummyRec(Item1).tabno<pPersonSummyRec(Item2).tabno then
         retVal:=-1
      else
         retVal:=0;
      sortPersonRec:=retVal;
 end;

 function  TFormSumLimitForCarantine.FindRecInList(tabno:integer):pointer;
  var retVal:Pointer;
      i : Integer;
  begin
       retVal := nil;
       if PersonSummyList.Count>0 then
          for i:=0 to PersonSummyList.Count-1 do
              begin
                   if pPersonSummyRec(PersonSummyList.Items[i]).tabno=tabno then
                      begin
                           retVal:=pPersonSummyRec(PersonSummyList.Items[i]);
                           Break;
                      end;
              end;
       FindRecInList:=retVal;
  end;


procedure TFormSumLimitForCarantine.MakeCurrentSummy(WantedY:Integer;WantedM:Integer);
 var personSummyRec  : pPersonSummyRec;
     NSRVtmp,NMEStmp : Integer;
     I_NSRV      : Integer;
     curr_Person : PERSON_PTR;
     curr_add : ADD_PTR;
     isFirst  : Boolean;
     isSumma  : Real;
 begin
     NSRVtmp := NSRV;
     NMEStmp := NMES;
     putinf;
     LDEL_PERSON;
     Application.CreateForm(TFormProgress,FormProgress);
     FormProgress.Caption:='������������ ������';
     FormProgress.Gauge.MinValue := 0;
     FormProgress.Gauge.MaxValue := Count_Serv;
     FormProgress.Gauge.Progress := 0;
     FormProgress.Show;
     PersonSummyList:=TList.Create;
     for I_NSRV:=1 to Count_Serv do
       begin
            NSRV := I_NSRV;
            MKFLNM;
            FormProgress.Gauge.Progress:=I_NSRV;
            FormProgress.LabelHeader.Caption:=name_serv(I_NSRV);
            FormProgress.Repaint;
            Formprogress.Refresh;
            Application.ProcessMessages;
            if not FileExists(fninf) then continue;
            GetInf(false);
            Curr_Person:=Head_Person;
            while (Curr_Person<>nil) do
              begin
                   FormProgress.LabelFooter.Caption:=Curr_Person.Fio+' ' +Curr_Person.Dolg;
                   Application.ProcessMessages;
                   if not(
                        (cbWR.itemIndex=0)
                         or
                        ((cbWR.itemIndex=1) and (IS_OSN_WID_RABOTY(curr_person)))
                         or
                        ((cbWR.itemIndex=2) and (IS_OSN_WID_RABOTY(curr_person)=false))
                      ) then
                    begin
                         curr_Person:=curr_Person.NEXT;
                         Continue;
                    end;

                   isFirst:=true;
                   curr_add:=curr_Person.ADD;
                   while (Curr_Add<>nil) do
                    begin
                         isSumma := 0;
                         if (WantedM=NMES) and
                            (WantedY=CurrYear) then
                            isSumma:=Curr_Add^.SUMMA;
                         if (curr_add.period=WantedM) and
                            (curr_add.year+1990=WantedY) then
                            isSumma:=Curr_Add^.SUMMA;
                         if Abs(isSumma)<0.01 then
                            begin
                                 Curr_Add:=curr_add.NEXT;
                                 Continue;
                            end;
//                         if (curr_add^.shifr=POCHAS_SHIFR) then
//                            begin
//                                 Curr_Add:=curr_add.NEXT;
//                                 Continue;
//                            end;
                         if (isFirst) then
                            begin
                                 PersonSummyRec:=pPersonSummyRec(FindRecInList(Curr_Person.tabno));
                                 if PersonSummyRec = nil then
                                    begin
                                         personSummyRec           := new(pPersonSummyRec) ;
                                         FillChar(personSummyRec^, SizeOf(personSummyRec^), 0);
                                         personSummyRec.Tabno     := curr_person.TABNO    ;
                                         personSummyRec.FIO       := curr_person.FIO      ;
                                         PersonSummyList.Add(personSummyRec);
                                    end;
                                 isFirst:=false;
                            end;
                         if (WantedM=NMES) and (WantedY=CurrYear) then
                            begin
                                 personSummyRec.SummaVy   := personSummyRec.SummaVy + curr_add.summa;
                                 if curr_add^.SHIFR=pochas_shifr then
                                    personSummyRec.summavyPochas   := personSummyRec.SummaVyPochas + curr_add.summa
                                 else
                                 if IS_OSN_WID_RABOTY(Curr_person) then
                                    personSummyRec.summavyOsn   := personSummyRec.SummaVyOsn + curr_add.summa
                                 else
                                    personSummyRec.summavySowm  := personSummyRec.SummaVySowm + curr_add.summa
                            end ;
                         if (curr_add.period=WantedM) and
                            (curr_add.year+1990=WantedY) then
                            begin
                                 personSummyRec.SummaZa   := personSummyRec.SummaZa + curr_add.summa;
                                 if curr_add^.SHIFR=pochas_shifr then
                                    personSummyRec.summaZaPochas   := personSummyRec.SummaZaPochas + curr_add.summa
                                 else
                                 if IS_OSN_WID_RABOTY(Curr_person) then
                                    personSummyRec.summaZaOsn   := personSummyRec.SummaZaOsn + curr_add.summa
                                 else
                                    personSummyRec.summaZaSowm  := personSummyRec.SummaZaSowm + curr_add.summa
                            end;
                         if not isOtherPeriodECBShifr(Curr_Add.shifr) then
                            if (nmes=WantedM) and
                               (curryear=WantedY) then
                               begin
                                    personSummyRec.Summa2011 := personSummyRec.Summa2011 + curr_add.summa;
                                    if curr_add^.SHIFR=pochas_shifr then
                                       personSummyRec.summa2011Pochas:= personSummyRec.Summa2011Pochas + curr_add.summa
                                    else
                                    if IS_OSN_WID_RABOTY(Curr_person) then
                                       personSummyRec.summa2011Osn   := personSummyRec.Summa2011Osn + curr_add.summa
                                    else
                                       personSummyRec.summa2011Sowm  := personSummyRec.Summa2011Sowm + curr_add.summa
                               end
                            else
                         else
                            if (curr_add.period=WantedM) and
                               (curr_add.year+1990=WantedY) then
                               begin
                                    personSummyRec.Summa2011 := personSummyRec.Summa2011 + curr_add.summa;
                                    if curr_add^.SHIFR=pochas_shifr then
                                       personSummyRec.summa2011Pochas:= personSummyRec.Summa2011Pochas + curr_add.summa
                                    else
                                    if IS_OSN_WID_RABOTY(Curr_person) then
                                       personSummyRec.summa2011Osn   := personSummyRec.Summa2011Osn + curr_add.summa
                                    else
                                       personSummyRec.summa2011Sowm  := personSummyRec.Summa2011Sowm + curr_add.summa
                               end;
                         curr_add:=curr_add.NEXT;
                    end;
                   curr_Person:=curr_Person.NEXT;
              end;
       end;
     FormProgress.Hide;
     FormProgress.Free;
     PersonSummyList.Sort(@SortPersonRec);
  //   ShowMessage(IntToStr(PersonSummyList.Count));
     NSRV := NSRVtmp;
     NMES := NMEStmp;
     MKFLNM;

     getinf(true);


 end;

function TFormSumLimitForCarantine.GetLimitSummaForCarantine:real;
 var Ini         : TIniFile;
     ValS        : string;
     iVal,iErr   : Integer;
     fName       : string;
     aVal        : real;
     SQLStmnt    : string;
     V           : Variant;
  BEGIN
      SQLStmnt := 'SELECT FIRST 1 COALESCE(limitmax,0) FROM SSLIMITY ORDER BY DATEFR DESC';
      v:=SQLQueryValue(SQLStmnt);
      if VarIsNumeric(v) then
         Result:=v
      else
         Result:=0;
(*
      fName:=getIniFileName;
      Ini := TIniFile.Create( fName );
      try
         ValS := Ini.ReadString('Parameters','SummaLimitForCarantine','47230');
         if Length(Trim(ValS))<2 then ValS:='47230';
         val(Vals,aVal,iErr);
         if iErr>0 then aVal:=47230.00;
      finally
         Ini.Free;
      end;
      Result:=aVal;
*)
  end;

procedure TFormSumLimitForCarantine.BuildList;
var //S,SCurr:string;
    y,m:Integer;
    SummaLimitTot:Real;
    SQLStmnt:string;
    i:Integer;
    Finished:Boolean;
function SortPersonRecBySummaDesc(Item1, Item2  : Pointer): Integer;
 var personSummyRec1,personSummyRec2 : pPersonSummyRec;
     retVal:Integer;
 begin
      if pPersonSummyRec(Item1).summa2011>pPersonSummyRec(Item2).Summa2011 then
         retVal:=-1
      else if pPersonSummyRec(Item1).Summa2011<pPersonSummyRec(Item2).Summa2011 then
         retVal:=1
      else
         retVal:=0;
      SortPersonRecBySummaDesc:=retVal;
 end;    
begin
     MakeCurrentSummy(CurrYear,NMES);
  //   S:=IntToStr(CurrYear)+'-'+IntToStr(NMES);
    // SCurr:=IntToStr(WORK_YEAR_VAL)+'-'+IntToStr(NMES)+'-01';
     y:=CurrYear;
     m:=NMES;
     FormWait.Show;
     repeat
           Finished:=True;
           if not checkBox1.checked then
           for i:=0 to PersonSummyList.Count-1 do
               begin
                    if (pPersonSummyRec(PersonSummyList.Items[i]).summaza<SummaLimit) and
                       (pPersonSummyRec(PersonSummyList.Items[i]).summavy<SummaLimit) and
                       (pPersonSummyRec(PersonSummyList.Items[i]).summa2011<SummaLimit) then
                      begin
                           Dispose(pPersonSummyRec(PersonSummyList.Items[i]));
                           PersonSummyList.Delete(i);
                           Finished:=False;
                           Break;
                      end
               end
            else   
            if (PersonSummyList.Count>100) then
               begin
                    PersonSummyList.sort(@SortPersonRecBySummaDesc);
                    while (PersonSummyList.Count>100) do
                       begin
                            Dispose(pPersonSummyRec(PersonSummyList.Items[100]));
                            PersonSummyList.Delete(100);
                       end;
                    finished:=true;
               end;
     until Finished;
     FormWait.Hide;
     if PersonSummyList.Count=0 then
        begin
             ShowMessage('��� ���������� ����� '+FloatToStr(SummaLimit)+' '+getShortCurrencyName);;
        end
     else
        begin
           if CDS2011.Active then
              CDS2011.Close;
           CDS2011.Open;
           CDS2011.EmptyDataSet;

           for i:=0 to PersonSummyList.Count-1 do
               begin
                    if ((pPersonSummyRec(PersonSummyList.Items[i]).summa2011>SummaLimit) and (not CheckBox1.checked))
                       or (CheckBox1.Checked) then
                      begin
                           CDS2011.Append;
                           CDS2011Tabno.Value:=pPersonSummyRec(PersonSummyList.Items[i]).Tabno;
                           CDS2011FIO.Value:=pPersonSummyRec(PersonSummyList.Items[i]).FIO;
                           CDS2011Summa.Value:=pPersonSummyRec(PersonSummyList.Items[i]).Summa2011;
                           CDS2011SummaOsn.Value:=pPersonSummyRec(PersonSummyList.Items[i]).Summa2011Osn;
                           CDS2011SummaSowm.Value:=pPersonSummyRec(PersonSummyList.Items[i]).Summa2011Sowm;
                           CDS2011SummaPochas.Value:=pPersonSummyRec(PersonSummyList.Items[i]).Summa2011Pochas;
                           CDS2011.Post;
                      end
               end;
           for i:=0 to PersonSummyList.Count-1 do
               Dispose(pPersonSummyRec(PersonSummyList.Items[i]));

        end;
     PersonSummyList.Free;

end;

procedure TFormSumLimitForCarantine.cbWRChange(Sender: TObject);
begin
     makeCaption;
end;

procedure TFormSumLimitForCarantine.BitBtn2Click(Sender: TObject);
begin
     frxReport1.ShowReport;
end;

procedure TFormSumLimitForCarantine.frxReport1GetValue(
  const VarName: String; var Value: Variant);
var s:string;
begin
     if CompareText(VarName,'M')=0 then
        begin
             s:=GetMonthRus(nmes)+' '+IntToStr(CURRYEAR);
             value:=s;
        end
     else
     if CompareText(VarName,'SummaLim')=0 then
        begin
             s:=FormatSummaForPlt(summaLimit);
             value:=s;
        end;
end;

end.
