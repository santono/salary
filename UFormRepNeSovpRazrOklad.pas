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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure frxReportNeSovpGetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtnStartClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    wantedYear,wantedMonth:integer;
    R_O:array[1..25] of real;

    { Private declarations }
    procedure createSwod;
    procedure createSwodForDolgRazr;

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
var list:TList;
    listDolg:TList;
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
        Value:=getMonthUkr(wantedMonth)+' '+intToStr(wantedYear)+' ð.'
     else
        Value:=getMonthRus(wantedMonth)+' '+intToStr(wantedYear)+' ã.'

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

end.
