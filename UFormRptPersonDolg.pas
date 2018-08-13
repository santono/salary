unit UFormRptPersonDolg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls,
  DB, DBClient, frxExportTXT, frxExportRTF, frxExportXLS, frxExportPDF,
  ExtCtrls;

type
  TFormRptPersonDolg = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    btn1: TButton;
    cdsDolg: TClientDataSet;
    frxReportDolg: TfrxReport;
    frxDBDatasetDolg: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxTXTExport1: TfrxTXTExport;
    cdsDolgShifrPod: TIntegerField;
    cdsDolgtabno: TIntegerField;
    cdsDolgFIO: TStringField;
    cdsDolgDolg: TStringField;
    cdsDolgnamePod: TStringField;
    rgMode: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure frxReportDolgGetValue(const VarName: String;
      var Value: Variant);
    procedure cdsDolgCalcFields(DataSet: TDataSet);
  private
     mode : Integer;
     function getNameMode:string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRptPersonDolg    : TFormRptPersonDolg;
  CntFormRptPersonDolgDS : integer;

implementation
  uses ScrIo , ScrDef , ScrUtil, UFormSelPKG, ScrLists;

  type  PRecDS=^TRecDS;
        TRecDS = record
                 shifrPod     : integer;
                 tabno        : integer;
                 FIO          : string;
                 dolg         : string;
                 isOsn        : integer;
                end;


  var List    : TList;
      i_count : integer;
      namePodr    : string;

{$R *.dfm}

procedure TFormRptPersonDolg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormRptPersonDolgDS>0 then
         Dec(CntFormRptPersonDolgDS);
end;

procedure TFormRptPersonDolg.FormCreate(Sender: TObject);
begin
      Inc(CntFormRptPersonDolgDS);
      mode:=0;
      rgMode.ItemIndex:=mode;
end;

function CompareItems(Item1, Item2: Pointer): Integer;
 var RetVal:Integer;
begin
  if PRecDS(Item1)^.shifrPod>PRecDS(Item2)^.shifrPod then RetVal:=-1
  else if PRecDS(Item1)^.shifrPod<PRecDS(Item2)^.shifrPod then RetVal:=1
  else if PRecDS(Item1)^.FIO>PRecDS(Item2)^.FIO then RetVal:=-1
  else if PRecDS(Item1)^.FIO<PRecDS(Item2)^.FIO then RetVal:=1
  else RetVal:=0;
  CompareItems:=RetVal;
end;

procedure TFormRptPersonDolg.Button1Click(Sender: TObject);
 var savnmes,savnsrv:integer;
     i_nsrv      : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_ptr;
     RecDS       : PRecDS;
     i,j         : Integer;
 function insertIntoList(Curr_Person:Person_Ptr):Integer;
   var retVal:Integer;
       k:integer;
       i:Integer;
       finded:Boolean;
       R : PRecDS;

   begin
        R:=nil;
        finded:=False;
        insertIntoList:=0;
        if List.Count>0 then
           for i:=0 to List.Count-1 do
               begin
                    if PRecDS(List.Items[i]).tabno=Curr_Person.tabno then
                        begin
                             R:=PRecDS(List.Items[i]);
                             Finded:=True;
                             Break;
                        end;
               end;
        if not finded then
            begin
                 New(R);
                 R.shifrpod     := nsrv;
                 R.tabno        := Curr_Person.Tabno;
                 R.FIO          := Curr_Person.FIO;
                 R.dolg         := Curr_Person.Dolg;
                 List.Add(R);
                 Exit;
            end;
        if is_Osn_Wid_Raboty(curr_person) then
        if Length(Trim(curr_person.dolg))>3 then
           begin
                r.dolg:=curr_person.dolg;
                if  not ((nsrv=140) or (nsrv=98) or (nsrv=102)) then
                 r.shifrPod:=NSRV;
           end;
        if  ((r.shifrpod=140) or (r.shifrpod=98) or (r.shifrpod=102)) then
        if not ((nsrv=98) or (NSRV=102) or (NSRV=140)) then
           r.shifrPod:=NSRV;



   end;
   function filter(Curr_Person:Person_Ptr):Boolean;
    var retVal:Boolean;
    begin
         retVal:=True;
         if mode=1 then
            if not STORONNEE_PODRAZD(Curr_Person.MESTO_OSN_RABOTY) then
                retVal:=False;
         if mode=2 then
            if not (
                 (IS_KAND_NAUK(Curr_Person) and (IS_DOCENT(CURR_PERSON) or IS_PROFESSOR(CURR_PERSON)))
                 OR
                 (IS_DOKTOR_NAUK(Curr_Person) and (IS_DOCENT(CURR_PERSON) or IS_PROFESSOR(CURR_PERSON)))
               ) then
                retVal:=False;

         filter:=retVal;
    end;
begin
{
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if KategList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны категории');
             Exit;
        end;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны счета');
             Exit;
        end;
     for i:=1 to max_gruppa     do curr_gruppa[i]     := false;
     for i:=1 to max_kategorija do curr_kategorija[i] := false;
     for i:=1 to KategList.Count do
         if KategList.IsSelected(i) then
            curr_kategorija[i]:=true;
     for i:=1 to GruppyList.Count do
         if GruppyList.IsSelected(i) then
            curr_gruppa[i]:=true;
}

     savnmes := nmes;
     savnsrv := nsrv;
     putinf;
     while (head_person<>nil) do del_person(Head_person);
     mode:=rgMode.ItemIndex;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     List:=TList.Create;
     for i_nsrv:=1 to count_serv do
         begin
              ProgressBar1.Position:=i_nsrv;
              nsrv:=i_nsrv;
          //    if not NameServList.IsSelected(NSRV) then continue;
              mkflnm;
              if not FileExists(fninf) then continue;
              getinf(true);
              namePodr:=Name_Serv(NSRV);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                    if Curr_Person.Tabno=1356 then
                       Curr_Person.Tabno:=1356;
             //       if not (Curr_Kategorija[Curr_Person^.Kategorija] and
             //               Curr_Gruppa[Curr_Person^.Gruppa]) then
             //          begin
             //                Curr_Person:=Curr_Person^.NEXT;
             //                Continue;
             //          end;
                     if (COUNT_ADD(Curr_Person)>0) then
                     if filter(Curr_Person) then
                        insertIntoList(Curr_Person);
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              while (head_person<>nil) do del_person(Head_person);
         end;
     if List.Count>0 then
        begin
               cdsDolg.Open;
               List.Sort(@CompareItems);
               for i:=0 to List.Count-1 do
                 begin
                      cdsDolg.Insert;
                      cdsDolgShifrPod.Value    := PRecDS(List.Items[i]).ShifrPod;
                      cdsDolgTabno.Value       := PRecDS(List.Items[i]).Tabno;
                      cdsDolgFIO.Value         := PRecDS(List.Items[i]).Fio;
                      cdsDolgDolg.Value        := PRecDS(List.Items[i]).Dolg;
                      cdsDolg.Post;
                 end;
               frxReportDolg.ShowReport;
           //    cdsDolg.
               cdsDolg.Close;
               for i:=0 to List.Count-1 do
                   Dispose(PRecDS(List.Items[i]));
        end;
     List.Free;
     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);
     Self.Close;
end;









procedure TFormRptPersonDolg.btn1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;
procedure TFormRptPersonDolg.frxReportDolgGetValue(const VarName: String;
  var Value: Variant);
  var s : string;
begin
     if CompareText(Varname,'nameMode')=0 then
        Value:=getNameMode
     else
     if CompareText(Varname,'Namedata')=0 then
        begin
             s:=GetMonthRus(NMES)+' '+IntToStr(CURRYEAR)+' г';
             Value:=s;
        end;

end;
procedure TFormRptPersonDolg.cdsDolgCalcFields(DataSet: TDataSet);
begin
     cdsDolgnamePod.Value:=trim(Name_Serv(cdsDolgshifrPod.Value));
end;


function TFormRptPersonDolg.getNameMode:string;
 var retVal:string;
 begin
      retVal:='Все работники';
      if (mode=1) then
         retVal:='Внешние совместители'
      else
      if (mode=2) then
         retVal:='Д.н., проф.(доц.) и к.т.н., доц.(проф.)';
      getNameMode:=retVal;


 end;


begin
  CntFormRptPersonDolgDS:=0;



end.
