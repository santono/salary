unit UFormBrowseNadbPlanoviy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, dxExEdtr,
  ExtCtrls, DBCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  Menus, StdCtrls, frxExportTXT, frxExportText, frxExportRTF, frxExportXLS,
  frxClass, frxExportPDF, frxDBSet;

type
  TFormBrowseNadbPlanoviy = class(TForm)
    dsNadb: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsNadbID: TFIBIntegerField;
    dsNadbNPP: TFIBIntegerField;
    dsNadbFIO: TFIBStringField;
    dsNadbDOLG: TFIBStringField;
    dsNadbPROC: TFIBBCDField;
    dsNadbTABNO: TFIBIntegerField;
    dxDBGrid1: TdxDBGrid;
    DBNavigator1: TDBNavigator;
    dsoNadb: TDataSource;
    dxDBGrid1ID: TdxDBGridMaskColumn;
    dxDBGrid1NPP: TdxDBGridMaskColumn;
    dxDBGrid1FIO: TdxDBGridMaskColumn;
    dxDBGrid1DOLG: TdxDBGridMaskColumn;
    dxDBGrid1PROC: TdxDBGridCurrencyColumn;
    dxDBGrid1TABNO: TdxDBGridMaskColumn;
    dsNadbSHIFRPOD: TFIBIntegerField;
    dsNadbRAZR: TFIBIntegerField;
    dsNadbOKLAD: TFIBBCDField;
    dsNadbSUMMANADB_RAS: TFIBBCDField;
    dsNadbSUMMANADB_FAKT: TFIBBCDField;
    dsNadbWORKDAY: TFIBIntegerField;
    dsNadbNOTNEED: TFIBIntegerField;
    dxDBGrid1SummaNadbRas: TdxDBGridColumn;
    dxDBGrid1SummaNadbFakt: TdxDBGridColumn;
    dxDBGrid1Oklad: TdxDBGridColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    dxDBGrid1WorkDay: TdxDBGridColumn;
    dsNadbPROC_SAL: TFIBBCDField;
    dxDBGrid1ProcSAl: TdxDBGridColumn;
    dsNadbSUMMANADB_RAZN: TFIBBCDField;
    dxDBGrid1SummaNadbRazn: TdxDBGridColumn;
    cbUniv: TCheckBox;
    dsNadbNADBINCN: TFIBIntegerField;
    dsNadbINCN: TStringField;
    dxDBGrid1PROC_SAL_MARK: TdxDBGridColumn;
    dsNadbPROC_SAL_MARK: TStringField;
    dxDBGrid1Calc: TdxDBGridButtonColumn;
    dsNadbGUID: TFIBStringField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    frxTXTExport1: TfrxTXTExport;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure cbUnivClick(Sender: TObject);
    procedure Valueelds(DataSet: TDataSet);
    procedure dxDBGrid1CalcButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dxDBGrid1CustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure N3Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
    MonthZa: integer;
    yearZa: integer;
    procedure fillFromSal;
    procedure fillListFromBD;
    procedure fillDBFromList;
    procedure emptyList;
    procedure CalcNadbPerson(Tabno:Integer;shifrPod:Integer;GUID:String);
    procedure modifyTableStructure;
//    procedure modifyTableStructure;
  public
    { Public declarations }
    constructor CreateZa(AOwner: TComponent; MonthZaPar: integer; yearZaPar: integer);
  end;

var
  FormBrowseNadbPlanoviy: TFormBrowseNadbPlanoviy;

implementation

uses
  ScrUtil, ScrDef,scrnalog, UFibModule, UFormMoveNabdToDB,SCrIo, USQLUnit, FIBQuery,UFormProgress,
  uFormWait,UFormUpdateNadbPlanoviy;

type
  pRec = ^TRec;

  TRec = record
    ID: Integer;
    PROC: Real;
    PROC_SAL:Real;
    TABNO: Integer;
    GUID: string;
    SHIFRPOD: Integer;
    RAZR: Integer;
    OKLAD: Real;
    SUMMANADB_RAS: Real;
    SUMMANADB_FAKT: Real;
    SUMMANADB_RAZN: Real;
    WORKDAY: Integer;
    NOTNEED: Integer;
    NADBINCN: Integer;  //0 - нет 1 есть и активна 2 заблокирована
    changed:Boolean;
  end;
 var list:TList;

{$R *.dfm}
constructor TFormBrowseNadbPlanoviy.CreateZa(AOwner: TComponent; MonthZaPar: integer; yearZaPar: integer);
begin
  self.Create(AOwner);
  self.monthZa := MonthZaPar;
  self.yearZa := yearZaPar;
end;

procedure TFormBrowseNadbPlanoviy.FormCreate(Sender: TObject);
begin
  if ((monthZa > 0) and (monthZa < 13)) then
    Caption := 'Надбавки за ' + getMonthRus(monthZa) + ' ' + intToStr(yearZa) + ' г.';
  if dsNadb.Active then
    dsNadb.Close;
  if dsNadb.Transaction.Active then
    dsNadb.Transaction.Commit;
  if dsNadb.UpdateTransaction.Active then
    dsNadb.UpdateTransaction.Commit;
  cbUniv.Checked:=False;
  dsNadb.Transaction.StartTransaction;
  dsNadb.Params[0].Value := self.yearZa;
  dsNadb.Params[1].Value := self.monthZa;
  dsNadb.Open;
  dsNadb.Transaction.StartTransaction;
end;

procedure TFormBrowseNadbPlanoviy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsNadb.Active then
    dsNadb.Close;
  if dsNadb.Transaction.Active then
    dsNadb.Transaction.Commit;
  if dsNadb.UpdateTransaction.Active then
    dsNadb.UpdateTransaction.Commit;
  Action := caFree;
end;

procedure TFormBrowseNadbPlanoviy.N1Click(Sender: TObject);
var
  b: Boolean;
begin
  Application.CreateForm(TFormMoveNabdToDB, FormMoveNabdToDB);
  b := FormMoveNabdToDB.Visible;
  FormMoveNabdToDB.ShowModal;
  dsNadb.Close;
  dsNadb.Open;
  //  FormMoveNabdToDB.setYearMonthZa(currYear,nmes);
end;

procedure TFormBrowseNadbPlanoviy.fillFromSal;
var
  nmes_sav, nsrv_sav: Integer;
  i_nsrv: Integer;
  curr_person: PERSON_PTR;
  procedure zeroSummaNadbFakt;
   var i:Integer;
   begin
        if list=nil then Exit;
        if list.count<1 then Exit;
        for i:=0 to list.count-1 do
            begin
                 pRec(list.Items[i]).GUID:='';
                 pRec(list.Items[i]).PROC_SAL:=0;
                 pRec(list.Items[i]).OKLAD:=0;
                 pRec(list.Items[i]).SHIFRPOD:=0;
                 pRec(list.Items[i]).RAZR:=0;
                 pRec(list.Items[i]).WORKDAY:=0;
                 pRec(list.Items[i]).WORKDAY:=0;
                 pRec(list.Items[i]).SUMMANADB_RAS:=0;
                 pRec(list.Items[i]).SUMMANADB_FAKT:=0;
                 pRec(list.Items[i]).SUMMANADB_RAZN:=0;
                 pRec(list.Items[i]).NADBINCN:=0;

            end;
   end;
  function findInList(tabno:integer):pRec;
   var i:Integer;
       retVal:pRec;
       finded:Boolean;
   begin
        retVal:=nil;
        finded:=False;
        if list<>nil then
        if list.count>0 then
           for i:=0 to list.count-1 do
               if pRec(list.Items[i]).TABNO=tabno then
                begin
                     finded:=true;
                     retVal:=pRec(list.Items[i]);
                     Break;
                end;
        findInList:=retVal;
   end;
  procedure checkperson(curr_person: person_ptr);
  var rec:pRec;
      curr_add:ADD_PTR;
      curr_cn:cn_ptr;
      summa:Real;
      finded:Boolean;
      automatic:Integer;
  begin
       if  curr_person^.oklad<10 then Exit;
       if curr_person^.WID_RABOTY<>1 then Exit;
       rec:=findInList(curr_person^.tabno);
       if rec=nil then Exit;
       if rec.changed then
          begin
               summa:=0;
               curr_add:=curr_person^.ADD;
               while (curr_add<>nil) do
                 begin
                      if curr_add^.shifr=nadbawka_k_z_shifr then
                         summa:=summa+curr_add^.SUMMA;
                      curr_add:=curr_add^.NEXT;
                 end;
               rec.SUMMANADB_FAKT:=rec.SUMMANADB_FAKT+summa;
               rec.SUMMANADB_RAS:=rec.oklad*rec.PROC/100.00;
               rec.SUMMANADB_RAZN:=rec.SUMMANADB_RAS-rec.SUMMANADB_FAKT;
               Exit;
          end;
       automatic:=0;
       rec.changed:=True;
       rec.GUID:=GetGUIDPersonToString(Curr_person);
       rec.OKLAD:=curr_person^.OKLAD;
       rec.SHIFRPOD:=NSRV;
       summa:=0;
       curr_add:=curr_person^.ADD;
       while (curr_add<>nil) do
         begin
              if curr_add^.shifr=nadbawka_k_z_shifr then
                 summa:=summa+curr_add^.SUMMA;
              curr_add:=curr_add^.NEXT;
         end;
       rec.SUMMANADB_FAKT:=rec.SUMMANADB_FAKT+summa;
       rec.SUMMANADB_RAS:=rec.oklad*rec.PROC/100.00;
       rec.SUMMANADB_RAZN:=rec.SUMMANADB_RAS-rec.SUMMANADB_FAKT;
       rec.RAZR:=GetRazrjadPerson(curr_person);

       rec.WORKDAY:=WORK_DAY(1,31,curr_person);
       curr_cn:=curr_person^.CN;
       summa:=0;
       finded:=false;
       while (curr_cn<>nil) do
         begin
              if (curr_cn^.shifr=nadbawka_k_z_shifr+Limit_cn_base)
                  or
                 (curr_cn^.shifr=nadbawka_k_z_shifr)
              then
                 begin
                       summa:=summa+curr_cn^.SUMMA;
                       automatic:=2;
                       if curr_cn^.AUTOMATIC=AUTOMATIC_MODE then
                          automatic:=1;
                       finded:=True;
                       Break;
                 end;
              curr_cn:=curr_cn^.NEXT;
         end;
       if finded then
          begin
               rec.PROC_SAL:=summa;
               rec.NADBINCN:=automatic;
          end;
  end;

begin
  nmes_sav := NMES;
  nsrv_sav := NSRV;
  EMPTY_ALL_PERSON;
  FormProgress:=TFormProgress.Create(nil);
  FormProgress.Caption:='Сравнение с базой данных';
  FormProgress.LabelHeader.Caption:='Поиск данных по надбавкам в зарплате';
  FormProgress.LabelFooter.Caption:='Заполнениее коллекции в памяти';
  FormProgress.Gauge.MinValue:=0;
  FormProgress.Gauge.MaxValue:=Count_Serv;
  FormProgress.Gauge.Progress:=FormProgress.Gauge.MinValue;
  FormProgress.Show;
  Application.ProcessMessages;

  fillListFromBD;
  zeroSummaNadbFakt;
  for i_nsrv := 1 to Count_Serv do
  begin
       FormProgress.Gauge.Progress:=i_nsrv;
       FormProgress.LabelFooter.Caption:=Name_Serv(I_NSRV);
       Application.ProcessMessages;

    if i_nsrv in [74,76,79,81,82,85,86,87,89,91,98,105,106,121,128,140,161,180,181,182,189,191]  then continue;
    nsrv := i_nsrv;
    mkflnm;
    if not FileExists(fninf) then
      Continue;
    GetInf(False);
    curr_person := HEAD_PERSON;
    while (curr_person <> nil) do
    begin
      FormProgress.LabelFooter.Caption:=Name_Serv(I_NSRV)+' '+intToStr(curr_person^.tabno)+' '+Trim(curr_person^.fio);
      Application.ProcessMessages;
      checkPerson(curr_person);
      curr_person := curr_person^.NEXT;
    end;
    EMPTY_ALL_PERSON;
  end;
  fillDBFromList;
  emptyList;
  FormProgress.Hide;
  Application.ProcessMessages;
  FormProgress.Free;
  NMES := nmes_sav;
  NSRV := nsrv_sav;
  MKFLNM;
  Getinf(true);

end;

procedure TFormBrowseNadbPlanoviy.fillListFromBD;
 var SQLStmnt:string;
     rec:pRec;
 begin
       list:=TList.Create;
       SQLStmnt :=  ' select ID,PROC,TABNO,GUID,SHIFRPOD,RAZR,OKLAD,SUMMANADB_RAS,SUMMANADB_FAKT,WORKDAY,NOTNEED,PROC_SAL,SUMMANADB_RAZN,NADBINCN  from TB_NADB_PLANOVIY';
       SQLStmnt := SQLStmnt+' where yearza='+IntToStr(Self.yearZa)+' and monthza='+IntToStr(Self.MonthZa)+' and coalesce(notneed,0)<>1';
       SQLGetQuery.SQL.Clear;
       SQLGetQuery.SQL.Add(SQLStmnt);
       if not SQLGetQuery.Transaction.Active then
          SQLGetQuery.Transaction.StartTransaction;
       SQLGetQuery.ExecQuery;
       while not SQLGetQuery.Eof do
          begin
               New(Rec);
               FillChar(Rec^,SizeOf(rec^),0);
               rec.ID:=SQLGetQuery.Fields[0].AsInteger;
               rec.PROC:=SQLGetQuery.Fields[1].AsFloat;
               rec.TABNO:= SQLGetQuery.Fields[2].AsInteger;
               rec.GUID:= SQLGetQuery.Fields[3].AsString;
               rec.ShifrPod:= SQLGetQuery.Fields[4].AsInteger;
               rec.Razr:= SQLGetQuery.Fields[5].AsInteger;
               rec.OKLAD:=SQLGetQuery.Fields[6].AsFloat;
               rec.SUMMANADB_RAS:=SQLGetQuery.Fields[7].AsFloat;
               rec.SUMMANADB_FAKT:=SQLGetQuery.Fields[8].AsFloat;
               rec.WORKDAY:= SQLGetQuery.Fields[9].AsInteger;
               rec.NOTNEED:= SQLGetQuery.Fields[10].AsInteger;
               rec.PROC_SAL:=SQLGetQuery.Fields[11].AsFloat;
               rec.SUMMANADB_RAZN:=SQLGetQuery.Fields[12].AsFloat;
               rec.NADBINCN:=SQLGetQuery.Fields[13].AsInteger;
               rec.changed:=False;
               list.Add(rec);
               SQLGetQuery.Next;
          end;
       SQLGetQuery.Close;
       SQLGetQuery.Transaction.COMMIT;


 end;
procedure TFormBrowseNadbPlanoviy.fillDBFromList;
 var SQLStmnt:string;
     rec:pRec;
     i:Integer;
     first:Boolean;
 begin
       if list=nil then Exit;
       if list.count<1 then Exit;
       for i:=0 to list.Count-1 do
          begin
               if not pRec(list.Items[i]).changed then Continue;
               rec:=pRec(list.Items[i]);
               first:=True;
               SQLStmnt :=  ' update TB_NADB_PLANOVIY set';
//               if Length(Trim(rec.GUID))>0  then
                  begin
                      if not first then
                      if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                         SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' GUID='''+Trim(rec.GUID)+'''';
                      first:=false;
                  end;
//               if rec.SHIFRPOD>0  then
                  begin
                      if not first then
                      if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                         SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' shifrpod='+intToStr(rec.shifrPod);
                      first:=false;
                  end;
//               if rec.SUMMANADB_FAKT>0.01  then
                  begin
                      if not first then
                      if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                         SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' SUMMANADB_FAKT='+FormatFloatPoint(rec.SUMMANADB_FAKT);
                      first:=false;
                  end;
//               if rec.OKLAD>0.01  then
                  begin
                      if not first then
                      if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                         SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' OKLAD='+FormatFloatPoint(rec.OKLAD);
                      first:=false;
                  end;
//               if rec.WORKDAY>0.01  then
                  begin
                      if not first then
                      if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                         SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' WORKDAY='+intToStr(rec.WORKDAY);
                      first:=false;
                  end;
//               if rec.RAZR>0.01  then
                  begin
                      if not first then
                      if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                         SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' RAZR='+intToStr(rec.RAZR);
                      first:=false;
                  end;
//               if rec.NADBINCN>0.01  then
                  begin
                      if not first then
                      if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                         SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' NADBINCN='+intToStr(rec.NADBINCN);
                      first:=false;
                  end;
//               if rec.PROC_SAL>0.01  then
                  begin
                      if not first then
                      if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                         SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' PROC_SAL='+FormatFloatPoint(rec.PROC_SAL);
                      first:=false;
                  end;
//               if rec.SUMMANADB_RAZN>-0.01  then
                  begin
                      if not first then
                      if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                         SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' SUMMANADB_RAZN='+FormatFloatPoint(rec.SUMMANADB_RAZN);
                      first:=false;
                  end;
//               if rec.SUMMANADB_RAS>0.01  then
                  begin
                      if not first then
                      if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                         SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' SUMMANADB_RAS='+FormatFloatPoint(rec.SUMMANADB_RAS);
                      first:=false;
                  end;

               SQLStmnt := SQLSTmnt+' where id='+IntToStr(rec^.id);
               SQLExecute(SQLStmnt);
          end;


 end;
procedure TFormBrowseNadbPlanoviy.emptyList;
 var rec:pRec;
     i:Integer;
     done:Boolean;
 begin
      if list=nil then Exit;
      repeat
            done:=True;
            if list.count>0 then
               for i:=0 to list.Count-1 do
                  Dispose(prec(list.Items[i]));

      until done;
      list.Free;
      list:=nil;
 end;
procedure TFormBrowseNadbPlanoviy.N2Click(Sender: TObject);
begin
     fillFromSal;
     dsNadb.close;
     dsNadb.Open;
end;


procedure TFormBrowseNadbPlanoviy.cbUnivClick(Sender: TObject);
var filter:string;
begin
      if cbUniv.checked then
         begin
              filter:='notneed=0';
              dsNadb.Filter:=filter;
              dsNadb.Filtered:=True;
         end
      else
         begin
              filter:='';
              dsNadb.Filter:=filter;
              dsNadb.Filtered:=false;
         end
end;



procedure TFormBrowseNadbPlanoviy.Valueelds(DataSet: TDataSet);
var ch:string;
    SVal:string;
begin
     ch:='';
     SVal:='';
     if dsNadbNOTNEED.value=0 then
     if dsNadbTABNO.value>0 then
        begin
            if dsNadbNADBINCN.Value=0 then
               ch:='-'
            else
            if dsNadbNADBINCN.Value=1 then
               ch:='+'
            else
            if dsNadbNADBINCN.Value=2 then
               ch:='#';
            sVal:=Trim(dsNadbPROC_SAL.AsString)+' '+ch;
        end;

     dsNadbPROC_SAL_MARK.AsString:=SVal;


end;


procedure TFormBrowseNadbPlanoviy.dxDBGrid1CalcButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
  var tabno,shifrpod:Integer;
      guid:string;
begin
    tabno:=dsNadbTabno.asInteger;
    shifrPod:=dsNadbSHIFRPOD.AsInteger;
    guid:=dsNadbguid.asString;
    CalcNadbPerson(Tabno,shifrPod,GUID);
end;
procedure TFormBrowseNadbPlanoviy.CalcNadbPerson(Tabno:Integer;shifrPod:Integer;GUID:String);
 var nsrv_tmp , nmes_tmp:integer;
     curr_person : PERSON_PTR;
     GUIDCurr:string;
     maked:Boolean;
 procedure unBlockNadbInCn(curr_person:person_ptr);
  var curr_cn:CN_PTR;
  begin
       curr_cn := curr_person^.CN;
       while (curr_cn<>nil) do
         begin
              if curr_cn^.shifr=nadbawka_k_z_shifr then
              if curr_cn^.AUTOMATIC=manual_mode then
                 begin
                      curr_cn^.AUTOMATIC:=AUTOMATIC_MODE;
                      break;
                 end;
              curr_cn:=curr_cn^.next;
         end;
  end;
function existsCnNadb(curr_person:person_ptr):boolean;
  var curr_cn:CN_PTR;
      finded:boolean;
  begin
       finded:=false;
       curr_cn := curr_person^.CN;
       while (curr_cn<>nil) do
         begin
              if curr_cn^.shifr=nadbawka_k_z_shifr then
              if curr_cn^.AUTOMATIC=manual_mode then
                 begin
                      finded:=True;
                      Break;
                 end;
              curr_cn:=curr_cn^.next;
         end;
       existsCnNadb:=finded;
  end;
 procedure fillDsNadbRec(curr_person:PERSON_PTR);
  var curr_add:ADD_PTR;
      summa:Real;
      SUMMANADB_FAKT,SUMMANADB_RAZN:Real;
      id:Integer;
      SQLStmnt:string;
      first : Boolean;
  begin
       id:=dsNadbID.AsInteger;
       summa:=0;
       curr_add:=curr_person^.ADD;
       while (curr_add<>nil) do
         begin
              if curr_add^.shifr=nadbawka_k_z_shifr then
                 summa:=summa+curr_add^.SUMMA;
              curr_add:=curr_add^.NEXT;
         end;
       SUMMANADB_FAKT:=summa;
       SUMMANADB_RAZN:=dsNadbSUMMANADB_RAS.AsFloat-SUMMANADB_FAKT;
       SQLStmnt :=  ' update TB_NADB_PLANOVIY set';
       first:=True;
//     if rec.SUMMANADB_FAKT>0.01  then
          begin
              if not first then
                 if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                    SQLStmnt:=Trim(SQLStmnt)+',';
                 SQLStmnt := SQLSTmnt+' SUMMANADB_FAKT='+FormatFloatPoint(SUMMANADB_FAKT);
                 first:=false;
          end;
//     if rec.NADBINCN>0.01  then
          begin
               if not first then
               if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                  SQLStmnt:=Trim(SQLStmnt)+',';
                      SQLStmnt := SQLSTmnt+' NADBINCN=1';
                      first:=false;
          end;
       if SUMMANADB_RAZN>-0.01  then
          begin
              if not first then
              if Copy(SQLStmnt,Length(SQLStmnt),1)<>',' then
                 SQLStmnt:=Trim(SQLStmnt)+',';
              SQLStmnt := SQLSTmnt+' SUMMANADB_RAZN='+FormatFloatPoint(SUMMANADB_RAZN);
              first:=false;
          end;
       SQLStmnt := SQLSTmnt+' where id='+IntToStr(id);
       SQLExecute(SQLStmnt);
//       dsNadbSUMMANADB_FAKT.AsFloat:=SUMMANADB_FAKT;
//       dsNadbSUMMANADB_RAZN.AsFloat:=SUMMANADB_RAZN;
       dsNadb.Refresh;
//       dxDBGrid
       dxDBGrid1.Refresh;
       dxDBGrid1.Repaint;
  end;
 begin
      dxDBGrid1Calc.Buttons[0].Visible:=False;
      FormWait.Show;
      Application.ProcessMessages;
      NSRV_TMP:=NSRV;
      if shifrPod<>NSRV then
         begin
              EMPTY_ALL_PERSON;
              NSRV_tmp:=NSRV;
              NSRV:=shifrPod;
              MKFLNM;
              GETINF(true);
         end;
      curr_person:=HEAD_PERSON;
      maked:=false;
      while (curr_person<>nil) do
        begin
             GUIDCurr:= Trim(GetGUIDPersonToString(Curr_person));
             if  curr_person^.oklad>10 then
             if curr_person^.WID_RABOTY=1 then
             if (curr_person.AUTOMATIC=automatic_mode) then
             if (curr_person^.TABNO=Tabno) then
             if ((Length(GUIDCurr)>10) and
                (Trim(GUID)=Trim(GUIDCurr)))
                or (
                     (Length(GUIDCurr)<2)
                     and
                     (existsCnNadb(curr_Person))
                ) then
                begin
                     unBlockNadbInCn(curr_person);
                     Calc_Naud_person(Curr_Person,31);
                     maked:=True;
                     filldsNadbRec(curr_person);
                     Break;
                end;
             curr_person:=curr_person^.NEXT;
        end;
      if maked then
         PUTINF;
      if shifrPod<>NSRV_tmp then
         begin
              EMPTY_ALL_PERSON;
              NSRV:=NSRV_tmp;
              MKFLNM;
              GETINF(TRUE);
         end;
      dxDBGrid1Calc.Buttons[0].Visible:=true;
      FormWait.Hide;
      Application.ProcessMessages;

  //    dxDBGrid1Oklad.
 end;



procedure TFormBrowseNadbPlanoviy.dxDBGrid1CustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  Value: Variant;
begin
  if ANode.HasChildren then
    Exit;
  if not ASelected and (AColumn = dxDBGrid1SummaNadbRazn) then
     begin
           Value := ANode.Values[AColumn.Index];
           if not VarIsNull(Value) then
              begin
                   if abs(Value) > 1.00 then
                      AColor := clRed; //clLime;
//                   else
//                   if Value < 300 then
//                      AColor := clYellow
//                   else
//                      begin // > 300
//                           AColor := clRed;
//                           AFont.Color := clWhite;
//                      end;
              end;
     end;
(*
  // customers are in bold color
  if ANode.Values[dxDBGrid2Customer.Index] = dxDBGrid2Customer.ValueChecked then
  begin
    AFont.Style := AFont.Style + [fsBold];
    if ASelected then
      AFont.Color := clWhite
    else
      AFont.Color := clNavy;
  end;
*)
end;


procedure TFormBrowseNadbPlanoviy.N3Click(Sender: TObject);
begin
     frxReport1.ShowReport;
end;
procedure TFormBrowseNadbPlanoviy.modifyTableStructure;
 var SQLStmnt:string;
 begin
 //     SQlStmnt:='ALTER TABLE TB_NADB_PLANOVIY ADD NADBINCN INTEGER';
 //     SQLExecute(SQLStmnt);
 end;


procedure TFormBrowseNadbPlanoviy.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
     if Button=nbEdit then
        begin
             Application.CreateForm(TFormUpdateNadbPlanoviy,FormUpdateNadbPlanoviy);
             FormUpdateNadbPlanoviy.ShowModal;
        end;
end;
begin
    list:=nil;

end.

