unit UFormRepNeSovpRazrOklad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, frxClass, frxDBSet, DB, DBClient, Buttons,
  ComCtrls, frxExportRTF, frxExportXLS, frxExportPDF, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery;

type
  TFormRepNeSovpRazrOklad = class(TForm)
    cdsClocks: TClientDataSet;
    dsoClocks: TDataSource;
    frxReportNeSovp: TfrxReport;
    frxDBDatasetClocks: TfrxDBDataset;
    BitBtnStart: TBitBtn;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    LabelServ: TLabel;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    cdsClockstabno: TIntegerField;
    cdsClocksFio: TStringField;
    cdsClocksshifrPod: TIntegerField;
    cdsClocksdolg: TStringField;
    cdsClocksnamePod: TStringField;
    cdsClockskoef: TFloatField;
    cdsClocksokladFakt: TFloatField;
    cdsClocksokladRas: TFloatField;
    cdsClocksrazr: TIntegerField;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    cdsClocksrazrRas: TIntegerField;
    cdsClocksshifrDol: TIntegerField;
    cdsClocksnameDol: TStringField;
    frxReportRazrDol: TfrxReport;
    BitBtn2: TBitBtn;
    frxReportKoefs: TfrxReport;
    BitBtn3: TBitBtn;
    BitBtnStartOsnSown: TBitBtn;
    frxReportOsnSowm: TfrxReport;
    cdsClocksprocStep: TStringField;
    cdsClocksprocZwan: TStringField;
    cdsClocksprocStag: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure frxReportNeSovpGetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtnStartClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtnStartOsnSownClick(Sender: TObject);
//    procedure BitBtnStartOsnSown(Sender: TObject);

  private
    wantedYear,wantedMonth:integer;
    R_O:array[1..25] of real;

    { Private declarations }
    procedure createSwod;
    procedure createSwodForDolgRazr;
    procedure createSwodForPersonPositions;
    procedure createSwodForOsnSowmNadbawki;

    function FillOkladyForRazr:boolean;
    function FillDolgList:boolean;
    function getDolgRazr(shifrDol:integer):integer;


  public
    { Public declarations }
  end;

var
  FormRepNeSovpRazrOklad: TFormRepNeSovpRazrOklad;

implementation

{$R *.dfm}
uses scrutil,scrdef,scrio,USqlUnit,dateUtils,math;
type PRec=^TRec;
     TRec=record
           tabno  : integer;
           fio    : string;
           razr   : integer;
           dolg   : string;
           koef   : real;
           okladFakt : real;
           okladRas : real;
           shifrPod : integer;
           razrRas : integer;
           shifrDol:integer;
          end;
     pDolgREc=^TDolgRec;
     TDolgRec=record
               shifrDol:integer;
               Razr:integer;
              end;
     pPersonRec=^tPersonRec;
     tPersonRec=record
              tabno:integer;
              fio:string;
              positionList:TList;
             end;
     pPositionRec=^TPositionRec;
     tPositionRec=record
                shifrDol:integer;
                koef:real;
                shifrPod:integer;
                w_r:integer;
                dolg:string;
                procStep : real;
                procZwan : real;
                procStag : real;
               end;

var list:TList;
    listDolg:TList;
    personList:TList;
procedure TFormRepNeSovpRazrOklad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormRepNeSovpRazrOklad.FormCreate(Sender: TObject);
begin
     LabelServ.Caption:='';
end;

procedure TFormRepNeSovpRazrOklad.frxReportNeSovpGetValue(const VarName: String;
  var Value: Variant);
begin
     if compareText('namePeriod',varName)=0 then
     if isSVDN then
        Value:=getMonthUkr(wantedMonth)+' '+intToStr(wantedYear)+' р.'
     else
        Value:=getMonthRus(wantedMonth)+' '+intToStr(wantedYear)+' г.'

end;

procedure TFormRepNeSovpRazrOklad.BitBtnStartClick(Sender: TObject);
begin
     createSwod;
end;

procedure TFormRepNeSovpRazrOklad.createSwod;
  var rec     : pRec;
      tmpNSRV : integer;
      tmpNMES : integer;
      i_nsrv,i: integer;
      curr_person : person_ptr;
      razr : integer;
      koef : real;
      okladFakt:real;
      okladRas:real;
begin
     tmpNSRV:=NSRV;
     tmpNMES:=NMES;
     NSRV:=tmpNSRV;
     EMPTY_ALL_PERSON;
     wantedMonth:=nmes;
     wantedYear:=currYear;
     ProgressBar1.Max:=count_serv;
     progressbar1.min:=0;
     progressBar1.step:=1;
     list:=TList.Create;
     FillOkladyForRazr;
     for i_nsrv:=1 to count_serv do
         begin
              progressBar1.StepIt;
              labelserv.Caption:=name_serv(i_nsrv);
              Application.ProcessMessages;
              if DOG_POD_PODRAZD(i_nsrv) then continue;
              if i_nsrv=82  then continue;
              if i_nsrv=81  then continue;
              if i_nsrv=82  then continue;
              if i_nsrv=140 then continue;
              if ((i_nsrv>150) and (i_nsrv<169)) then continue;
              nsrv:=i_nsrv;
              mkflnm;
              if not fileexists(fninf) then continue;
              getinf(false);
              if count_person<1 then continue;
              curr_person:=head_person;
              while (curr_person<>nil) do
                 begin
                      razr:=GetRazrjadPerson(curr_person);
                      koef:=GET_KOEF_OKLAD_PERSON(curr_person);
                      if ((razr>0) and (razr<26)) then
                         okladras  := roundTo(R_O[RAZR]*koef,-5)
                      else
                         okladras  := 0;
                      okladfakt := curr_person^.oklad;
                      if abs(okladras-okladfakt)>1 then
                         begin
                              new(Rec);
                              fillChar(rec^,sizeOf(rec^),0);
                              rec^.tabno:=curr_person^.TABNO;
                              rec^.fio:=curr_person^.fio;
                              rec^.dolg:=curr_person^.dolg;
                              rec^.razr:=razr;
                              rec^.koef:=koef;
                              rec^.okladFakt:=curr_person^.OKLAD;
                              rec^.okladRas:=okladras;
                              rec^.shifrPod:=nsrv;
                              list.add(rec);
                         end;
                      curr_person:=curr_person^.NEXT;
                 end;
              EMPTY_ALL_PERSON;
         end;
     if list.count>0 then
        begin
             cdsClocks.Open;
             cdsClocks.EmptyDataSet;
             for i:=0 to list.count-1 do
                 begin
                      cdsClocks.Append;
                      rec:=pRec(list.Items[i]);
                      cdsClockstabno.Value   := rec^.tabno;
                      cdsClocksfio.Value := rec^.fio;
                      cdsClocksdolg.Value := rec^.dolg;
                      cdsClockskoef.Value := rec^.koef;
                      cdsClocksrazr.Value := rec^.razr;
                      cdsClocksshifrPod.value := rec^.shifrpod;
                      cdsClocksnamePod.Value := name_serv(rec^.shifrPod);
                      cdsClocksokladFakt.Value   := rec^.okladFakt;
                      cdsClocksOkladRas.Value   := rec^.okladRas;
                      cdsClocks.Insert;
                 end;
                 frxReportNeSovp.ShowReport;
                 cdsClocks.Close;
        end;

     if list.count>0 then
        for i:=0 to list.count-1 do
            begin
//                 rec:=;
                 dispose(list.Items[i]);
            end;
     list.Free;
     nsrv:=tmpNSRV;
     nmes:=tmpNMES;
     mkflnm;
     getinf(true)

end;
procedure TFormRepNeSovpRazrOklad.createSwodForDolgRazr;
  var rec     : pRec;
      tmpNSRV : integer;
      tmpNMES : integer;
      i_nsrv,i: integer;
      curr_person : person_ptr;
      razr,razrRas : integer;
      koef : real;
      okladFakt:real;
      okladRas:real;
      shifrDol:integer;
      SQLStmnt:STring;
      v:variant;
begin
     tmpNSRV:=NSRV;
     tmpNMES:=NMES;
     NSRV:=tmpNSRV;
     EMPTY_ALL_PERSON;
     wantedMonth:=nmes;
     wantedYear:=currYear;
     ProgressBar1.Max:=count_serv;
     progressbar1.min:=0;
     progressBar1.step:=1;
     list:=TList.Create;
     listDolg:=TList.Create;
     FillDolgList;
     for i_nsrv:=1 to count_serv do
         begin
              progressBar1.StepIt;
              labelserv.Caption:=name_serv(i_nsrv);
              Application.ProcessMessages;
              if DOG_POD_PODRAZD(i_nsrv) then continue;
              if i_nsrv=82  then continue;
              if i_nsrv=81  then continue;
              if i_nsrv=82  then continue;
              if i_nsrv=140 then continue;
              if ((i_nsrv>150) and (i_nsrv<169)) then continue;
              nsrv:=i_nsrv;
              mkflnm;
              if not fileexists(fninf) then continue;
              getinf(false);
              if count_person<1 then continue;
              curr_person:=head_person;
              while (curr_person<>nil) do
                 begin
                      razr:=GetRazrjadPerson(curr_person);
                      koef:=GET_KOEF_OKLAD_PERSON(curr_person);
                      shifrDol:= GET_DOL_CODE(curr_person);
                      razrRas:=0;
                      if shifrDol>0 then
                         razrRas:=getDolgRazr(shifrDol);
                      if (razr<>razrRas) then
                         begin
                              new(Rec);
                              fillChar(rec^,sizeOf(rec^),0);

                              rec^.tabno:=curr_person^.TABNO;
                              rec^.fio:=curr_person^.fio;
                              rec^.dolg:=curr_person^.dolg;
                              rec^.razr:=razr;
                              rec^.koef:=koef;
                              rec^.okladFakt:=curr_person^.OKLAD;
                              rec^.okladRas:=okladras;
                              rec^.shifrPod:=nsrv;
                              rec^.razrRas:=razrRas;
                              rec^.shifrDol:=shifrDol;
                              list.add(rec);
                         end;
                      curr_person:=curr_person^.NEXT;
                 end;
              EMPTY_ALL_PERSON;
         end;
     if list.count>0 then
        begin
             cdsClocks.Open;
             cdsClocks.EmptyDataSet;
             for i:=0 to list.count-1 do
                 begin
                      cdsClocks.Append;
                      rec:=pRec(list.Items[i]);
                      cdsClockstabno.Value   := rec^.tabno;
                      cdsClocksfio.Value := rec^.fio;
                      cdsClocksdolg.Value := rec^.dolg;
                      cdsClockskoef.Value := rec^.koef;
                      cdsClocksrazr.Value := rec^.razr;
                      cdsClocksshifrPod.value := rec^.shifrpod;
                      cdsClocksnamePod.Value := name_serv(rec^.shifrPod);
                      cdsClocksokladFakt.Value   := rec^.okladFakt;
                      cdsClocksOkladRas.Value   := rec^.okladRas;
                      cdsClocksrazrRas.Value := rec^.razrRas;
                      cdsClocksshifrDol.Value := rec^.shifrDol;
                      cdsClocksnameDOl.Value:='';
                      SQLStmnt:='select first 1 name from tb_dolg where shifrdol='+intToStr(rec^.ShifrDol);
                      v:=SQLQueryValue(SQLStmnt);
                      if VarIsStr(v) then
                         cdsClocksnameDOl.Value:=v;
                      cdsClocks.Insert;
                 end;
                 frxReportRazrDol.ShowReport;
                 cdsClocks.Close;
        end;

     if list.count>0 then
        for i:=0 to list.count-1 do
            begin
//                 rec:=;
                 dispose(list.Items[i]);
            end;
     list.Free;
     if listDolg.count>0 then
        for i:=0 to listDolg.count-1 do
            begin
//                 rec:=;
                 dispose(listDolg.Items[i]);
            end;
     listDolg.Free;
     nsrv:=tmpNSRV;
     nmes:=tmpNMES;
     mkflnm;
     getinf(true)

end;

function TFormRepNeSovpRazrOklad.FillOkladyForRazr:boolean;
 var SQLStmnt:string;
     i:integer;
 begin
       for i:=1 to 25 do R_O[i]:=0;
       if pFIBQuery1.Transaction.Active then
          pFIBQuery1.Transaction.Commit;
       pFIBQuery1.Transaction.StartTransaction;
       if pFIBQuery1.Open then
          pFIBQuery1.Close;
       pFIBQuery1.SQL.Clear;
       SQLStmnt:='select a.razr, a.oklad from tb_razr_proc a';
       SQLStmnt:=SQLStmnt+' where a.datefr = (select max(b.datefr) from tb_razr_proc b)';
       SQLStmnt:=SQLStmnt+' order by 1';
       pFIBQuery1.SQL.Add(SQLStmnt);
       pFIBQuery1.ExecQuery;
       i:=0;
       while (not pFIBQuery1.Eof) and (i<25) do
         begin
              if ((pFIBQuery1.Fields[0].AsInteger>0) and
                  (pFIBQuery1.Fields[0].AsInteger<26)) then
                 begin
                      R_O[pFIBQuery1.Fields[0].AsInteger]:=pFIBQuery1.Fields[1].AsFloat;
                 end;
              pFIBQuery1.Next;
         end;
       pFIBQuery1.Close;
       pFIBQuery1.Transaction.Commit;
       Result:=true;
 end;
function TFormRepNeSovpRazrOklad.FillDolgList:boolean;
 var SQLStmnt:string;
     i:integer;
     DolgRec:PDolgRec;
 begin
       if ListDolg.count>0 then
          ListDolg.Clear;
       if pFIBQuery1.Transaction.Active then
          pFIBQuery1.Transaction.Commit;
       pFIBQuery1.Transaction.StartTransaction;
       if pFIBQuery1.Open then
          pFIBQuery1.Close;
       pFIBQuery1.SQL.Clear;
       SQLStmnt:='select a.shifrdol, a.razr from tb_dolg a order by shifrdol';
       pFIBQuery1.SQL.Add(SQLStmnt);
       pFIBQuery1.ExecQuery;
       i:=0;
       while (not pFIBQuery1.Eof) and (i<25) do
         begin
              if ((pFIBQuery1.Fields[0].AsInteger>0) and
                  (pFIBQuery1.Fields[0].AsInteger<20000)) then
                 begin
                      new(DolgRec);
                      dolgRec^.shifrDol:=pFIBQuery1.Fields[0].AsInteger;
                      dolgRec^.Razr:=pFIBQuery1.Fields[1].AsInteger;
                      listDolg.Add(dolgRec);
                 end;
              pFIBQuery1.Next;
         end;
       pFIBQuery1.Close;
       pFIBQuery1.Transaction.Commit;
       Result:=true;
 end;
function TFormRepNeSovpRazrOklad.getDolgRazr(shifrDol:integer):integer;
 var
     i:integer;
     DolgRec:PDolgRec;
     retVal:integer;
 begin
     retVal:=0;
     if listDolg.count>0 then
        for i:=0 to listDolg.Count-1 do
           if pDolgRec(listDolg.items[i]).shifrDol=shifrdol then
              begin
                   retVal:=pDolgRec(listDolg.items[i]).razr;
                   break;
              end;
       getDolgRazr:=retVal;
 end;


procedure TFormRepNeSovpRazrOklad.BitBtn2Click(Sender: TObject);
begin
     createSwodForDolgRazr;
end;
procedure TFormRepNeSovpRazrOklad.createSwodForPersonPositions;
  var
      tmpNSRV : integer;
      tmpNMES : integer;
      i_nsrv,i,j: integer;
      curr_person : person_ptr;
      shifrWR : integer;
      koef : real;
      shifrDol:integer;
      SQLStmnt:STring;
      v:variant;
      personRec:pPersonRec;
   procedure addRecToList;
     var i:integer;
     procedure addPositionRec;
      var positionRec:pPositionRec;
      begin
          new(positionRec);
          fillChar(positionRec^,sizeOf(positionRec^),0);
          positionRec^.shifrDol:=shifrDol;
          positionRec^.koef:=koef;
          positionRec^.shifrPod:=nsrv;
          positionRec^.w_r:=shifrWR;
          positionRec^.dolg:=curr_person^.DOLG;
          personRec^.positionList.Add(positionRec);

      end;
     begin
          personRec:=nil;
          if personList.count>0 then
             for i:=0 to personList.Count-1 do
                 if pPersonRec(personList.Items[i])^.tabno=curr_person^.TABNO then
                    begin
                         personRec:=pPersonRec(personList.Items[i]);
                         break;
                    end;
          if (personRec=nil) then
             begin
                  new(personRec);
                  fillChar(personRec^,sizeOf(personRec^),0);
                  personRec^.tabno := curr_person^.TABNO;
                  personRec^.fio   := curr_person^.fio;
                  personRec^.positionList:=TList.Create;
                  addPositionRec;
                  personList.Add(personRec);
             end
          else
             addPositionRec;

     end;

begin
     tmpNSRV:=NSRV;
     tmpNMES:=NMES;
     NSRV:=tmpNSRV;
     EMPTY_ALL_PERSON;
     wantedMonth:=nmes;
     wantedYear:=currYear;
     ProgressBar1.Max:=count_serv;
     progressbar1.min:=0;
     progressBar1.step:=1;
     personList:=TList.Create;
     for i_nsrv:=1 to count_serv do
         begin
              progressBar1.StepIt;
              labelserv.Caption:=name_serv(i_nsrv);
              Application.ProcessMessages;
              if DOG_POD_PODRAZD(i_nsrv) then continue;
              if i_nsrv=82  then continue;
              if i_nsrv=81  then continue;
              if i_nsrv=82  then continue;
              if i_nsrv=140 then continue;
              if ((i_nsrv>150) and (i_nsrv<169)) then continue;
              nsrv:=i_nsrv;
              mkflnm;
              if not fileexists(fninf) then continue;
              getinf(false);
              if count_person<1 then continue;
              curr_person:=head_person;
              while (curr_person<>nil) do
                 begin
                      if curr_person^.oklad>1.00 then
                         begin
                          koef     := GET_KOEF_OKLAD_PERSON(curr_person);
                          shifrDol := GET_DOL_CODE(curr_person);
                          shifrWR  := curr_person^.wid_raboty;
                          addRecToList;
                         end;
                      curr_person:=curr_person^.NEXT;
                 end;
              EMPTY_ALL_PERSON;
         end;

     if personList.count>0 then
        begin
             for i:=0 to personList.count-1 do
                 begin
                      koef:=0;
                      if pPersonRec(personList.Items[i]).positionList.count>0 then
                         for j:=0 to pPersonRec(personList.Items[i]).positionList.count-1 do
                         begin
                              koef:=koef+pPositionRec(pPersonRec(personList.Items[i]).positionList.items[j])^.koef;
                         end;
                 end;
        end;
     if personList.count>0 then
        begin
             cdsClocks.Open;
             cdsClocks.EmptyDataSet;
             for i:=0 to personList.count-1 do
                 begin
                      cdsClocks.Append;
                      koef:=0;
                      if pPersonRec(personList.Items[i]).positionList.count>0 then
                         for j:=0 to pPersonRec(personList.Items[i]).positionList.count-1 do
                         begin
                              koef:=koef+pPositionRec(pPersonRec(personList.Items[i]).positionList.items[j])^.koef;
                         end;
                      personRec:=pPersonRec(personList.Items[i]);
                      cdsClockstabno.Value   := personRec^.tabno;
                      cdsClocksfio.Value := personRec^.fio;
                      cdsClockskoef.Value := koef;
                      if koef>1.50001 then
                         cdsClocksDolg.Value := '#####'
                      else
                         cdsClocksDolg.Value := '';

                      cdsClocks.Insert;
                 end;
                 frxReportKoefs.ShowReport;
                 cdsClocks.Close;
        end;

     if personList.count>0 then
        for i:=0 to personList.count-1 do
            begin
                 if pPersonRec(personList.Items[i]).positionList.Count>0 then
                    begin
                       for j:=0 to pPersonRec(personList.Items[i]).positionList.Count-1 do
                             dispose(pPersonRec(personList.Items[i]).positionList.Items[j]);
                       pPersonRec(personList.Items[i]).positionList.Free;
                    end;
                 dispose(personList.Items[i]);
            end;
     personList.Free;
     nsrv:=tmpNSRV;
     nmes:=tmpNMES;
     mkflnm;
     getinf(true)

end;

procedure TFormRepNeSovpRazrOklad.BitBtn3Click(Sender: TObject);
begin
    createSwodForPersonPositions;
end;


procedure TFormRepNeSovpRazrOklad.createSwodForOsnSowmNadbawki;
  var
      tmpNSRV : integer;
      tmpNMES : integer;
      i_nsrv,i,j: integer;
      curr_person : person_ptr;
      shifrWR : integer;
      koef : real;
      shifrDol:integer;
      SQLStmnt:STring;
      v:variant;
      personRec:pPersonRec;
      procStep : real;
      procZwan : real;
      procStag : real;
   procedure addRecToList;
     var i:integer;
     procedure addPositionRec;
      var positionRec:pPositionRec;
      begin
          new(positionRec);
          fillChar(positionRec^,sizeOf(positionRec^),0);
          positionRec^.shifrDol := shifrDol;
          positionRec^.koef     := koef;
          positionRec^.shifrPod := nsrv;
          positionRec^.w_r      := shifrWR;
          positionRec^.dolg     := curr_person^.DOLG;
          positionRec^.procStep := procStep;
          positionRec^.procZwan := procZwan;
          positionRec^.procStag := procStag;
          personRec^.positionList.Add(positionRec);

      end;
     begin
          personRec:=nil;
          if personList.count>0 then
             for i:=0 to personList.Count-1 do
                 if pPersonRec(personList.Items[i])^.tabno=curr_person^.TABNO then
                    begin
                         personRec:=pPersonRec(personList.Items[i]);
                         break;
                    end;
          if (personRec=nil) then
             begin
                  new(personRec);
                  fillChar(personRec^,sizeOf(personRec^),0);
                  personRec^.tabno := curr_person^.TABNO;
                  personRec^.fio   := curr_person^.fio;
                  personRec^.positionList:=TList.Create;
                  addPositionRec;
                  personList.Add(personRec);
             end
          else
             addPositionRec;

     end;
    procedure fillProcenty;
     var curr_cn:cn_ptr;
     begin
          procStep:=0;
          procZwan:=0;
          procStag:=0;
          curr_cn:=curr_person^.cn;
          while (curr_cn<>nil) do
            begin
                 if curr_cn^.shifr=ZA_STEP_SHIFR THEN
                 if Abs(Curr_cn^.SUMMA)>0.01 then
                    procStep := Curr_cn^.SUMMA
                 else
                 else
                 if curr_cn^.shifr=ZA_ZWAN_SHIFR THEN
                 if Abs(Curr_cn^.SUMMA)>0.01 then
                    procZwan := Curr_cn^.SUMMA
                 else
                 else
                 if curr_cn^.shifr=VYSLUGA_SHIFR  THEN
                 if Abs(Curr_cn^.SUMMA)>0.01 then
                    procStag := Curr_cn^.SUMMA;

                 curr_cn:=curr_cn^.next;
            end;
     end;

begin
     tmpNSRV:=NSRV;
     tmpNMES:=NMES;
     NSRV:=tmpNSRV;
     EMPTY_ALL_PERSON;
     wantedMonth:=nmes;
     wantedYear:=currYear;
     ProgressBar1.Max:=count_serv;
     progressbar1.min:=0;
     progressBar1.step:=1;
     personList:=TList.Create;
     for i_nsrv:=1 to count_serv do
         begin
              progressBar1.StepIt;
              labelserv.Caption:=name_serv(i_nsrv);
              Application.ProcessMessages;
              if DOG_POD_PODRAZD(i_nsrv) then continue;
              if i_nsrv=82  then continue;
              if i_nsrv=81  then continue;
              if i_nsrv=82  then continue;
              if i_nsrv=140 then continue;
              if ((i_nsrv>150) and (i_nsrv<169)) then continue;
              nsrv:=i_nsrv;
              mkflnm;
              if not fileexists(fninf) then continue;
              getinf(false);
              if count_person<1 then continue;
              curr_person:=head_person;
              while (curr_person<>nil) do
                 begin
                      if curr_person^.oklad>1.00 then
                         begin
                          koef     := GET_KOEF_OKLAD_PERSON(curr_person);
                          shifrDol := GET_DOL_CODE(curr_person);
                          shifrWR  := curr_person^.wid_raboty;
                          fillProcenty;
                          addRecToList;
                         end;
                      curr_person:=curr_person^.NEXT;
                 end;
              EMPTY_ALL_PERSON;
         end;

     if personList.count>0 then
        begin
             for i:=0 to personList.count-1 do
                 begin
                      koef:=0;
                      if pPersonRec(personList.Items[i]).positionList.count>0 then
                         for j:=0 to pPersonRec(personList.Items[i]).positionList.count-1 do
                         begin
                              koef:=koef+pPositionRec(pPersonRec(personList.Items[i]).positionList.items[j])^.koef;
                         end;
                 end;
        end;
     koef:=0;
     if personList.count>0 then
        begin
             cdsClocks.Open;
             cdsClocks.EmptyDataSet;
             for i:=0 to personList.count-1 do
                 begin
                      procStep := 0;
                      procZwan := 0;
                      procStag := 0;
                      if pPersonRec(personList.Items[i]).positionList.count>0 then
                         for j:=0 to pPersonRec(personList.Items[i]).positionList.count-1 do
                             if j=0 then
                                begin
                                     procStep:=pPositionRec(pPersonRec(personList.Items[i]).positionList.items[j])^.procStep;
                                     procZwan:=pPositionRec(pPersonRec(personList.Items[i]).positionList.items[j])^.procZwan;
                                     procStag:=pPositionRec(pPersonRec(personList.Items[i]).positionList.items[j])^.procStag;
                                end
                             else
                                begin
                                     if procStep>-0.1 then
                                     if abs(abs(procStep)-abs(pPositionRec(pPersonRec(personList.Items[i]).positionList.items[j])^.procStep))>0.1 then
                                        procStep:=-5.0;
                                     if procZwan>-0.1 then
                                     if abs(abs(procZwan)-abs(pPositionRec(pPersonRec(personList.Items[i]).positionList.items[j])^.procZwan))>0.1 then
                                        procZwan:=-5.0;
                                     if procStag>-0.1 then
                                     if abs(abs(procStag)-abs(pPositionRec(pPersonRec(personList.Items[i]).positionList.items[j])^.procStag))>0.1 then
                                        procStag:=-5.0;
                                end;
                      if (procStep<-0.5) or (procZwan<-0.5) or (procStag<-0.5) then
                         begin
                            koef:=10;
                            cdsClocks.Append;
                            personRec:=pPersonRec(personList.Items[i]);
                            cdsClockstabno.Value   := personRec^.tabno;
                            cdsClocksfio.Value := personRec^.fio;
                            cdsClockskoef.Value := koef;
                            if procStep < -0.5 then
                               cdsClocksProcStep.Value := '#####'
                            else
                               cdsClocksProcStep.Value := '';
                            if procZwan < -0.5 then
                               cdsClocksProcZwan.Value := '#####'
                            else
                               cdsClocksProcZwan.Value := '';
                            if procStag < -0.5 then
                               cdsClocksProcStag.Value := '#####'
                            else
                              cdsClocksProcStag.Value := '';
                           cdsClocks.Insert;
                         end;
                 end;
                 if koef>5 then
                    frxReportOsnSowm.ShowReport
                 else
                    showMessage('Не нейдено несоотвествий');
                 cdsClocks.Close;
        end;

     if personList.count>0 then
        for i:=0 to personList.count-1 do
            begin
                 if pPersonRec(personList.Items[i]).positionList.Count>0 then
                    begin
                       for j:=0 to pPersonRec(personList.Items[i]).positionList.Count-1 do
                           dispose(pPersonRec(personList.Items[i]).positionList.Items[j]);
                       pPersonRec(personList.Items[i]).positionList.Free;
                    end;
                 dispose(personList.Items[i]);
            end;
     personList.Free;
     nsrv:=tmpNSRV;
     nmes:=tmpNMES;
     mkflnm;
     getinf(true)

end;


procedure TFormRepNeSovpRazrOklad.BitBtnStartOsnSownClick(Sender: TObject);
begin
     createSwodForOsnSowmNadbawki
end;

end.
