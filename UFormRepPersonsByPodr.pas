unit UFormRepPersonsByPodr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery,SCrDef, DB, DBClient, frxClass, frxDBSet,
  frxExportRTF, frxExportXLS, frxExportPDF;

type
  TFormRepPersonsByPodr = class(TForm)
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    cdsList: TClientDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    BitBtn3: TBitBtn;
    cdsListtabno: TIntegerField;
    cdsListPIB: TStringField;
    cdsListINN: TStringField;
    cdsListPOSADA: TStringField;
    cdsListkatname: TStringField;
    cdsListkoef: TFloatField;
    cdsListOKLAD: TFloatField;
    cdsListVysl: TIntegerField;
    cdsListStepen: TIntegerField;
    cdsListZwan: TIntegerField;
    cdsListSkladnist: TIntegerField;
    cdsListDoplata: TIntegerField;
    cdsListshifrpod: TIntegerField;
    cdsListnamePod: TStringField;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    limitsumma:Real;
    WantedYear:integer;
    WantedMonth:integer;
    WantedMode:integer;       { 1 за ; все остальноен в}
    procedure PrivateSwod;
    procedure addToList(Curr_Person:PERSON_PTR);

  public
    { Public declarations }
  end;

var
  FormRepPersonsByPodr: TFormRepPersonsByPodr;

implementation
 uses UFIBModule,DateUtils,ComObj,ScrUtil,UFormWait,ScrIo,UFormSelPKG,scrLists;

{$R *.dfm}

 type PRec=^TRec;
      TRec=record
             shifrpod     : Integer;
             tabno        : integer;
             INN          : string;
             PIB          : String;
             Posada       : string;
             nameKat      : string;
             Koef         : Real;
             Oklad        : Real;
             Vysluga      : Integer;
             Stepen       : Integer;
             Zwan         : Integer;
             Naprug       : Integer;
             Doplata      : Integer;
           end;
  var list:TList;

procedure TFormRepPersonsByPodr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepPersonsByPodr.addToList(Curr_Person:PERSON_PTR);
 var rec:PRec;
 FUNCTION ZA_VYSL:INTEGER;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
      RETVAL:Integer;
  BEGIN
      RETVAL:=0;
      DONE:=FALSE;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
       begin
            IF (
                (CURR_CN^.SHIFR=VYSLUGA_SHIFR)
                or
                (CURR_CN^.SHIFR=VYSLUGA_SHIFR+LIMIT_CN_BASE)
               )
             THEN
            if Abs(Curr_cn^.SUMMA)>0.01 then
               begin
                    retVal:=Round(Curr_cn^.SUMMA);
                    DONE:=TRUE;
                    Break;
               end;
            CURR_CN:=CURR_CN^.NEXT;
       end;
      ZA_VYSL:=RETVAL;
  END;

 FUNCTION ZA_STEP:INTEGER;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
      RETVAL:Integer;
  BEGIN
      RETVAL:=0;
      DONE:=FALSE;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
       begin
            IF (
                (CURR_CN^.SHIFR=ZA_STEP_SHIFR)
                or
                (CURR_CN^.SHIFR=ZA_STEP_SHIFR+LIMIT_CN_BASE)
               ) then
            if Abs(Curr_cn^.SUMMA)>0.01 then
               begin
                    retVal:=Round(Curr_cn^.SUMMA);
                    DONE:=TRUE;
                    Break;
               end;
            CURR_CN:=CURR_CN^.NEXT;
       end;
      ZA_STEP:=RETVAL;
  END;
 FUNCTION ZA_ZWAN:INTEGER;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
      RETVAL:Integer;
  BEGIN
      RETVAL:=0;
      DONE:=FALSE;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
       begin
            IF (
                (CURR_CN^.SHIFR=ZA_ZWAN_SHIFR)
                or
                (CURR_CN^.SHIFR=ZA_ZWAN_SHIFR+LIMIT_CN_BASE)
               )  then
            if Abs(Curr_cn^.SUMMA)>0.01 then
               begin
                    retVal:=Round(Curr_cn^.SUMMA);
                    DONE:=TRUE;
                    Break;
               end;
            CURR_CN:=CURR_CN^.NEXT;
       end;
      ZA_ZWAN:=RETVAL;
  END;
 FUNCTION GetDopl:INTEGER;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
      RETVAL:Integer;
  BEGIN
      RETVAL:=0;
      DONE:=FALSE;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
       begin
            IF (
                (CURR_CN^.SHIFR=DOPLATA_K_ZARPL_SHIFR)
                or
                (CURR_CN^.SHIFR=DOPLATA_K_ZARPL_SHIFR+LIMIT_CN_BASE)
               )  then
            if Abs(Curr_cn^.SUMMA)>0.01 then
               begin
                    retVal:=Round(Curr_cn^.SUMMA);
                    DONE:=TRUE;
                    Break;
               end;
            CURR_CN:=CURR_CN^.NEXT;
       end;
      getDopl:=RETVAL;
  END;

 FUNCTION GetNadb:INTEGER;
  VAR CURR_CN:CN_PTR;
      DONE:BOOLEAN;
      RETVAL:Integer;
  BEGIN
      RETVAL:=0;
      DONE:=FALSE;
      CURR_CN:=CURR_PERSON^.CN;
      WHILE (CURR_CN<>NIL) AND (NOT DONE) DO
       begin
            IF (
                (CURR_CN^.SHIFR=NADBAWKA_SHIFR)
                or
                (CURR_CN^.SHIFR=NADBAWKA_SHIFR+LIMIT_CN_BASE)
               )  then
            if Abs(Curr_cn^.SUMMA)>0.01 then
               begin
                    retVal:=Round(Curr_cn^.SUMMA);
                    DONE:=TRUE;
                    Break;
               end;
            CURR_CN:=CURR_CN^.NEXT;
       end;
      getNadb:=RETVAL;
  END;


 begin
     New(rec);
     FillChar(rec^,SizeOf(TRec),0);
     rec.shifrpod:=NSRV;
     rec.tabno   := curr_person^.TABNO;
     rec.INN     := Trim(curr_person^.NAL_CODE);
     rec.PIB     := Trim(GetFullUkrFioPerson(curr_person^.tabno));
     rec.Posada  := Trim(curr_person^.DOLG);
     rec.nameKat := GET_kat_name(curr_person.KATEGORIJA);
     rec.Koef    := GET_KOEF_OKLAD_PERSON(curr_person);
     rec.Oklad   := curr_person^.OKLAD;
     rec.Vysluga := ZA_VYSL;
     rec.Stepen  := ZA_STEP;
     rec.Zwan    := ZA_ZWAN;
     rec.Naprug  := GetNadb;
     rec.Doplata := getDopl;
     list.Add(rec);
 end;


procedure TFormRepPersonsByPodr.BitBtn1Click(Sender: TObject);
var E,WC:Variant;
    FName:String;
    ExRow,ExCol:integer;
    LineNo:integer;
begin
     WantedMode  := RadioGroup1.ItemIndex;
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
     if (WantedMode<0) or (WantedMode>2) then
        WantedMode:=2;
     PrivateSwod;
end;
 function Compare(Item1, Item2: Pointer): Integer;
  begin
       if PRec(Item1)^.shifrpod>PRec(Item2)^.shifrpod then Result:=1
                                                else
       if PRec(Item1)^.shifrpod<PRec(Item2)^.shifrpod then Result:=-1
                                                else
       if PRec(Item1)^.PIB>PRec(Item2)^.PIB then Result:=1
                                                else
       if PRec(Item1)^.PIB<PRec(Item2)^.PIB then Result:=-1
                                                else Result:=0;
  end;


procedure TFormRepPersonsByPodr.PrivateSwod;
 var NMESTemp,NSRVTemp,I,I_NSRV:integer;
     Curr_Person:Person_ptr;
     Rec:PRec;
     Done,Finded:boolean;
     FIO,Nal_Code:string;
     ExRow:integer;
     E,WC:variant;
     FName:string;
     SQLStmnt:string;
     v:Variant;
     summaPrevTot:Real;
     dt:TDateTime;
     testEmpty:Boolean;
     shifrDol:Integer;
 begin
      NMESTemp:=NMES;
      NSRVTemp:=NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Visible:=true;
      Application.ProcessMessages;
      ProgressBar1.Min:=1;
      ProgressBar1.Max:=COUNT_SERV;
      List:=TList.Create;
      list.Clear;
      i_nsrv:=list.Count;
      summaPrevTot:=0;
      for i_nsrv:=1 to COUNT_SERV do
          begin
               ProgressBar1.Position:=ProgressBar1.Position+1;
               Application.ProcessMessages;
               NSRV:=I_NSRV;
              if not NameServList.IsSelected(NSRV) then continue;
               MKFLNM;
               if not FileExists(FNINF) then continue;
               GetInf(true);
               Curr_Person:=Head_Person;
               while (Curr_Person<>Nil) do
                    begin
                         shifrDol:=GET_DOL_CODE(curr_person);
                         if not ( (shifrdol<10)
                            or ((shifrDol>=1500) and (shifrDol<1540))
                            or (shifrDol=1455)
                            ) then
                         if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                         if KategList.IsSelected(Curr_Person^.Gruppa)  then
                         if ((WantedMode=2)
                             or (
                                 (WantedMode=0)
                                 and (IS_OSN_WID_RABOTY(curr_person))
                                )
                             or (
                                 (WantedMode=1)
                                 and (not IS_OSN_WID_RABOTY(curr_person))
                                ) 

                            ) then
                            begin
                              addToList(curr_person);
                            end;
                        Curr_Person:=Curr_Person^.Next;
                    end;
               EMPTY_ALL_PERSON;
          end;


      if List.Count>0 then
         begin
              list.Sort(@Compare);
              cdsList.Open;
              i:=0;
              testEmpty:=not cdsList.IsEmpty;
              while  testEmpty do
                begin
                     cdsList.First;
                     cdsList.Delete;
           //          cdsList.Post;
                     testEmpty:=not cdsList.IsEmpty;
                     Inc(i);
                     if (i>100000)  then
                        begin
                             ShowMessage('Не удалось очистить ClientDataSet');
                             Break;

                        end;
                end;
              for i:=0 to list.Count-1 do
                  begin
                       cdsList.Append;
                       cdsListshifrpod.Value:= pRec(list.Items[i]).shifrpod;
                       cdsListnamePod.Value:=Trim(Name_Serv(pRec(list.Items[i]).shifrpod));
                       cdsListtabno.Value:=pRec(list.Items[i]).tabno;
                       cdsListINN.Value:=Trim(pRec(list.Items[i]).INN);
                       cdsListPIB.Value:=Trim(GetFullUkrFioPerson(pRec(list.Items[i]).tabno));
                       cdsListPOSADA.Value:=Trim(pRec(list.Items[i]).Posada);
                       cdsListkatname.Value:=Trim(pRec(list.Items[i]).nameKat);
                       cdsListkoef.Value:=pRec(list.Items[i]).koef;
                       cdsListOKLAD.Value:=pRec(list.Items[i]).Oklad;
                       cdsListVysl.Value:=pRec(list.Items[i]).Vysluga;
                       cdsListStepen.Value:=pRec(list.Items[i]).Stepen;
                       cdsListZwan.Value:=pRec(list.Items[i]).Zwan;
                       cdsListSkladnist.Value:=pRec(list.Items[i]).Naprug;
                       cdsListDoplata.Value:=pRec(list.Items[i]).Doplata;
                       cdsList.Post;
                  end;
              frxReport1.ShowReport();
              cdsList.Close;
         end
      else
         begin
               ShowMessage('Нет сотрудников');
         end;
//      if pFIBTransactionQ.Active then
//         pFIBTransactionQ.Commit;

      if List.Count>0 then

         for i:=0 to List.Count-1 do
            begin
                 Rec:=List.Items[i];
                 Dispose(Rec);
            end;
      List.Free;
      ProgressBar1.Visible:=false;
      Application.ProcessMessages;
      NMES:=NMESTemp;
      NSRV:=NSRVTemp;
      MKFLNM;
      GETINF(TRUE);
 end;


procedure TFormRepPersonsByPodr.FormCreate(Sender: TObject);
begin
      ProgressBar1.Visible:=false;
//      RadioGroup1.Hide;
      
end;

procedure TFormRepPersonsByPodr.frxReport1GetValue(const VarName: String;
  var Value: Variant);
  var s:string;
begin
     if CompareText(varName,'NAMEPODR')=0 then
        begin
             s:=Name_Serv(nsrv);
             value:=Trim(s);
        end
     else
     if CompareText(varName,'CURRENTDATA')=0 then
        begin
             if isSVDN then
                s:='Перелік співробітників за '+getMonthUkr(wantedMonth)+' '+IntToStr(wantedYear)+' р.'
             else
                s:='Список сотрудников за '+getMonthRus(wantedMonth)+' '+IntToStr(wantedYear)+' г.';
//             S:=getMonthUkr(wantedMonth)+' '+IntToStr(wantedYear)+' р.';
             value:=Trim(s);
        end
end;

procedure TFormRepPersonsByPodr.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

end.
