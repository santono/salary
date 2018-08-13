unit UFormRptDolgHostel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls,
  DB, DBClient, frxExportTXT, frxExportRTF, frxExportXLS, frxExportPDF;

type
  TFormRptDolgHostel = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    btn1: TButton;
    cdsDolg: TClientDataSet;
    cdsDolgShifrDol: TIntegerField;
    cdsDolgName: TStringField;
    cdsDolgNmbOfStawok: TFloatField;
    cdsDolgSummaOsn: TFloatField;
    cdsDolgSummaB5: TFloatField;
    cdsDolgSummaBSS: TFloatField;
    cdsDolgSummaTot: TFloatField;
    frxReportDolg: TfrxReport;
    frxDBDatasetDolg: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxTXTExport1: TfrxTXTExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure frxReportDolgGetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRptDolgHostel    : TFormRptDolgHostel;
  CntFormRptHostelDS : integer;

implementation
  uses ScrIo , ScrDef , ScrUtil, UFormSelPKG, ScrLists;

  type  PRecDS=^TRecDS;
        TRecDS = record
                 kod          : integer;
                 nameDol      : string;
                 NmbOfStawok  : Real;
                 summaOsn     : real;
                 summaBol5    : real;
                 summaBolSS   : real;
                end;


  var List:TList;
      i_count:integer;
     namePodr    : string;
      
{$R *.dfm}

procedure TFormRptDolgHostel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormRptHostelDS>0 then
         Dec(CntFormRptHostelDS);
end;

procedure TFormRptDolgHostel.FormCreate(Sender: TObject);
begin
      Inc(CntFormRptHostelDS);
end;

function CompareItems(Item1, Item2: Pointer): Integer;
 var RetVal:Integer;
begin
  if PRecDS(Item1)^.kod>PRecDS(Item2)^.kod then RetVal:=-1
  else if PRecDS(Item1)^.kod<PRecDS(Item2)^.kod then RetVal:=1
  else RetVal:=0;
  CompareItems:=RetVal;
end;

procedure TFormRptDolgHostel.Button1Click(Sender: TObject);
 var savnmes,savnsrv:integer;
     i_nsrv      : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_ptr;
     RecDS       : PRecDS;
     Kod,KodOsn  : INTEGER;
     i,j         : Integer;
     SummaOsn,SummaBol5,SummaBolSS   : Real;
 function getOsnKod(Kod:integer;tabno:integer):Integer;
   const lenD=11;
   const fkod:array[1..lenD] of Integer = (1,4,5,6,7,8,9,1455,1500,1510,1520);
   var retVal:Integer;
       c_Person:PERSON_PTR;
       k:integer;
    function isOsnDolg(Kod:integer):Boolean;
       var i:Integer;
           retVal:Boolean;
       begin
            retVal:=True;
            for i:=1 to lenD do
                if Kod=fkod[i] then
                   begin
                        retVal:=false;
                        break;
                   end;
            isOsnDolg:=retVal;
       end;
   begin
        retVal:=0;
        if isOsnDolg(kod) then
           begin
                retVal:=Kod;
                getOsnKod:=retVal;
                Exit;
           end;
        c_person:=HEAD_PERSON;
        while (c_Person<>nil) do
          begin
               if c_Person.Tabno=tabno then
               if is_Osn_Wid_Raboty(c_person) then
                  begin
                       retVal:=GET_DOL_CODE(C_person);
                       Break;
                  end;
               c_person:=c_Person.NEXT;
          end;
        if retVal=0 then
           begin
                c_person:=HEAD_PERSON;
                while (c_Person<>nil) do
                    begin
                         if c_Person.Tabno=tabno then
                         if isOsnDolg(GET_DOL_CODE(C_person)) then
                            begin
                                 retVal:=GET_DOL_CODE(C_person);
                                 Break;
                            end;
                         c_person:=c_Person.NEXT;
                    end;

           end;
        getOsnKod:=retVal;
   end;
 function getRec(Kod:integer):PRecDS;
   var finded:Boolean;
       i : Integer;
       R : PRecDS;
   begin
        R:=nil;
        finded:=False;
        if List.Count>0 then
           for i:=0 to List.Count-1 do
               begin
                    if PRecDS(List.Items[i]).kod=Kod then
                        begin
                             R:=PRecDS(List.Items[i]);
                             Finded:=True;
                             Break;
                        end;
               end;
        if not finded then
            begin
                 New(R);
                 R.kod          := kod;
                 R.namedol      := Name_Dolg_By_Shifr(Kod);
                 R.summaosn     := 0;
                 R.summaBol5    := 0;
                 R.summaBolSS   := 0;
                 R.nmbOfStawok  := 0;
                 List.Add(R);

            end;
        getRec:=r;
   end;
begin
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

     savnmes := nmes;
     savnsrv := nsrv;
     putinf;
     while (head_person<>nil) do del_person(Head_person);
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     List:=TList.Create;
     for i_nsrv:=1 to count_serv do
         begin
              ProgressBar1.Position:=i_nsrv;
              nsrv:=i_nsrv;
              if not NameServList.IsSelected(NSRV) then continue;
              mkflnm;
              if not FileExists(fninf) then continue;
              getinf(true);
              namePodr:=Name_Serv(NSRV);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                    if Curr_Person.Tabno=11326 then
                       Curr_Person.Tabno:=11326;
                    if not (Curr_Kategorija[Curr_Person^.Kategorija] and
                            Curr_Gruppa[Curr_Person^.Gruppa]) then
                       begin
                             Curr_Person:=Curr_Person^.NEXT;
                             Continue;
                       end;

                     SummaOsn   := 0 ;
                     SummaBol5  := 0 ;
                     SummaBolSS := 0 ;
                     Curr_Add:=Curr_Person^.Add;
                     while (Curr_Add<>Nil) do
                       begin
                            if Curr_Add.Shifr=BOL_5_SHIFR then
                               summaBol5 := summaBol5 + Curr_Add.Summa
                            else
                            if Curr_Add.SHIFR in [BOL_TEK_SHIFR,BOL_PROSHL_SHIFR,BOL_FUTURE_SHIFR] then
                               SummaBolSS:=SummaBolSS+Curr_Add.SUMMA
                            else
                               SummaOsn:=SummaOsn+Curr_Add.SUMMA;
                            Curr_Add:=Curr_Add^.Next;
                       end;
                     if (Abs(SummaOsn)<0.001)   and
                        (Abs(SummaBol5)<0.001)  and
                        (Abs(SummaBolSS)<0.001) 
                      then
                        begin
                             Curr_Person:=Curr_Person^.Next;
                             continue;
                        end;
                     kod:=GET_DOL_CODE(Curr_Person);
                     kodOsn:=getOsnKod(Kod,Curr_person.Tabno);
                     RecDS:=getRec(kodOsn);
                     RecDS.summaOsn   := RecDS.summaOsn   + SummaOsn;
                     RecDS.summaBol5  := RecDS.summaBol5  + SummaBol5;
                     RecDS.summaBolSS := RecDS.summaBolSS + SummaBolSS;
                     if SummaOsn>0.01 then
                        RecDS.NmbOfStawok:=RecDS.NmbOfStawok+GET_KOEF_OKLAD_PERSON(curr_PERSON);
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
                      cdsDolgShifrDol.Value    := PRecDS(List.Items[i]).kod;
                      cdsDolgName.Value        := PRecDS(List.Items[i]).nameDol;
                      cdsDolgNmbOfStawok.Value := PRecDS(List.Items[i]).NmbOfStawok;
                      cdsDolgSummaOsn.Value    := PRecDS(List.Items[i]).summaOsn;
                      cdsDolgSummaB5.Value     := PRecDS(List.Items[i]).summaBol5;
                      cdsDolgSummaBSS.Value    := PRecDS(List.Items[i]).summaBolSS;
                      cdsDolgSummaTot.Value    := cdsDolgSummaOsn.Value +
                                                  cdsDolgSummaB5.Value  +
                                                  cdsDolgSummaBSS.Value;
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









procedure TFormRptDolgHostel.btn1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;
procedure TFormRptDolgHostel.frxReportDolgGetValue(const VarName: String;
  var Value: Variant);
  var s : string;
begin
     if CompareText(Varname,'namePodr')=0 then
        Value:=namePodr
     else
     if CompareText(Varname,'Namedata')=0 then
        begin
             s:=GetMonthRus(NMES)+' '+IntToStr(CURRYEAR)+' г';
             Value:=s;
        end;

end;


begin
  CntFormRptHostelDS:=0;


end.
