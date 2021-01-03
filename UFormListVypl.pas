unit UFormListVypl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormListVypl = class(TForm)
    DateTimePickerFr: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePickerTo: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure Print_List_Person_Ud;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormListVypl: TFormListVypl;

implementation
 uses UFormSelPKG, ScrLists, UFibModule, uFormWait, ComObj,
      ScrDef,      ScrUtil,  ScrIo,      uFormView, UFormProgress;

{$R *.dfm}

procedure TFormListVypl.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormListVypl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormListVypl.BitBtn4Click(Sender: TObject);
var DataFr,DataTo,Da     : TDate;
    DataFrS,DataToS      : String;
    YearFr,YearTo,MonthFr,MonthTo:integer;
    Y,M,D,YT             : word;
    Tabno,YearVy,MonthVy : integer;
    FIO,Dolg,Gruppa,S    : String;
    Summa                : real;
    V                    : Variant;
    CurrRow,i,j          : integer;
begin
     CurrRow := 0;
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
     if ShifrList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны статьи');
             Exit;
        end;
     Da:=Date;
     DecodeDate(Da,Yt,M,D);
     DataFr:=DateTimePickerFr.Date;
     DataTo:=DateTimePickerTo.Date;
     DecodeDate(DataFr,Y,M,D);
     if (Y<1991) or (Y>Yt) then
        begin
             ShowMessage('Не верна первая дата');
             Exit;
        end;
     D:=1;
     DataFr:=EncodeDate(Y,M,D);
     DataFrS:=IntToStr(Y)+'-'+IntToStr(M)+'-01';
     DecodeDate(DataTo,Y,M,D);
     if (Y<1991) or (Y>YT) then
        begin
             ShowMessage('Не верна вторая дата');
             Exit;
        end;
     D:=1;
     DataTo:=EncodeDate(Y,M,D);
     DataToS:=IntToStr(Y)+'-'+IntToStr(M)+'-01';
     if DataFr>DataTo then
        begin
             ShowMessage('Не верно указаны даты');
             Exit;
        end;


{     Установить параметры расчета индексации в FireBird}
     FIB.pFIBTransactionSal.StartTransaction;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
     S:='select person.tabno, person.fio,person.dolg,fadd.summa,person.yearvy,person.monthvy,gruppy.name from person join fadd on person.shifrid=fadd.shifridperson';
     S:=S+' join gruppy on person.shifrgru=gruppy.shifr ';
     FIB.pFIBQuery.SQL.Add(S);
     S:=' where cast(person.yearvy||''-''||person.monthvy||''-01''as date) between '''+DataFrS+''' and '''+DataToS+'''';
     FIB.pFIBQuery.SQL.Add(S);
     S:=' and fadd.ShifrSta in (';
     j:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
            begin
                inc(j);
                if j>1 then S:=S+',';
                S:=S+IntToStr(i);
            end;
     S:=S+')';
{     S:=' and fadd.shifrsta in (2,3)';}
     FIB.pFIBQuery.SQL.Add(S);
     S:=' and person.ShifrKat in (';
     j:=0;
     for i:=1 to KategList.Count do
         if KategList.IsSelected(i) then
            begin
                inc(J);
                if j>1 then S:=S+',';
                S:=S+IntToStr(i);
            end;
     S:=S+')';
     FIB.pFIBQuery.SQL.Add(S);
     S:=' and person.ShifrGru in (';
     j:=0;
     for i:=1 to GruppyList.Count do
         if GruppyList.IsSelected(i) then
            begin
                inc(j);
                if j>1 then S:=S+',';
                S:=S+IntToStr(i);
            end;
     S:=S+')';
     FIB.pFIBQuery.SQL.Add(S);
     S:=' and person.w_place in (';
     j:=0;
     for i:=1 to NameServList.Count do
         if NameServList.IsSelected(i) then
            begin
                if Length(S)>200 then
                   begin
                        FIB.pFIBQuery.SQL.Add(S);
                        S:='';
                   end;
                inc(J);
                if j>1 then S:=S+',';
                S:=S+IntToStr(i);
            end;
     S:=S+')';
     FIB.pFIBQuery.SQL.Add(S);
     S:=' order by person.shifrgru';
     FIB.pFIBQuery.SQL.Add(S);
     try
        FormWait.Show;
        Application.ProcessMessages;
        FIB.pFIBQuery.ExecQuery;
        FormWait.Hide;

        V:=CreateOleObject('Excel.Application');
        V.Visible:=True;
        V.WorkBooks.Add;
        while not FIB.pFIBQuery.Eof do
          begin
               Tabno   := FIB.pFIBQuery.Fields[0].AsInteger;
               Fio     := FIB.pFIBQuery.Fields[1].AsString;
               Dolg    := FIB.pFIBQuery.Fields[2].AsString;
               Summa   := FIB.pFIBQuery.Fields[3].AsFloat;
               YearVy  := FIB.pFIBQuery.Fields[4].AsInteger;
               MonthVy := FIB.pFIBQuery.Fields[5].AsInteger;
               Gruppa  := FIB.pFIBQuery.Fields[6].AsString;
               Inc(CurrRow);
               if CurrRow=1 then
                  begin
                       V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:='Таб.ном.';
                       V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:='ФИО';
                       V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:='Должность';
                       V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:='Сумма';
                       V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:='Год';
                       V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:='Месяц';
                       V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7]:='Счет';
                       Inc(CurrRow);
                  end;
               V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=Tabno;
               V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=Fio;
               V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,3]:=Dolg;
               V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,4]:=Summa;
               V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,5]:=YearVy;
               V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,6]:=MonthVy;
               V.WorkBooks[1].WorkSheets[1].Cells[CurrRow,7]:=Gruppa;
               FIB.pFIBQuery.Next;
          end;
     EXCEPT
        ShowMessage('Ошибка получения списка сотрудников ');
     end;
     FIB.pFIBTransactionSal.Commit;
     if not V.WorkBooks[1].Saved then
        begin
{             if not SaveDialog1.Execute then exit;
               V.WorkBooks[1].SaveAs(SaveDialog1.FileName);
}
        end;
{     V.WorkBooks[1].Close;      }

end;

{---------------------------------------------}
procedure TFormListVypl.Print_List_Person_Ud;
 type PRecItem=^TRecItem;
      TRecItem=record
                Tabno    : integer;
                Name     : String;
                Summa    : real;
                NomerDog : String;
               end;
 var RecItem      : PRecItem;
     List         : TList;
     I            : INTEGER;
     NSRV_TEMP    : INTEGER;
     NMES_TEMP    : INTEGER;
     DEV          : TextFile;
     Wanted_Shifr : integer;
     SummaTot     : real;
     LineNo       : word;
     ModePrint    : word;
     FName        : String;
     I_Nsrv       : integer;
 function CompareItems(Item1, Item2: Pointer): Integer;
  begin
       if Trim(Upper_String(PRecItem(Item1)^.NAME))>Trim(Upper_String(PRecItem(Item2)^.Name))      then Result:=1
       else if Trim(Upper_String(PRecItem(Item1)^.Name))<Trim(Upper_String(PRecItem(Item2)^.Name)) then Result:=-1
                                                         else Result:=0;

  end;

 FUNCTION FIND_STAT_PERSON(CURR_PERSON:PERSON_PTR;VAR SUMMA:REAL):BOOLEAN;
   VAR CURR_UD : UD_PTR;
       FINDED  : BOOLEAN;
       C       : Integer;
   BEGIN
       FINDED:=FALSE;
       CURR_UD:=CURR_PERSON^.UD;
       C:=0;
       SUMMA:=0;
       WHILE CURR_UD<>NIL DO
        BEGIN
             IF (CURR_UD^.SHIFR=Wanted_Shifr) THEN
                BEGIN
                     SUMMA:=SUMMA+SUM(CURR_UD^.SUMMA);
                     FINDED:=TRUE;
                END;
             CURR_UD:=CURR_UD^.NEXT;
        END;
       FIND_STAT_PERSON:=FINDED;
   END;
 PROCEDURE MAKE_FOND_FOR_ALL;
   VAR CURR_PERSON:PERSON_PTR;
       SUMMA:REAL;
       PS      : String;
       JIndex  : INTEGER;
       NomerDog : LongInt;
       Finded   : boolean;
       i:integer;
 BEGIN
      CURR_PERSON:=HEAD_PERSON;
      WHILE (CURR_PERSON<>NIL) DO
       BEGIN
            if ((Wanted_Shifr=Kredit_Shifr) and GruppyList.IsSelected(Curr_Person^.Gruppa)) or
               (Wanted_Shifr<>Kredit_Shifr) then
            if Find_Stat_Person(Curr_Person,Summa) then
               begin
                     Finded:=false;
                     if List.Count>0 then
                     for i:=0 to List.Count-1 do
                         begin
                              RecItem:=PRecItem(List.Items[i]);
                              if RecItem.Tabno=Curr_Person^.Tabno then
                                 begin
                                      Finded:=true;
                                      RecItem.Summa:=RecItem.Summa+Summa;
                                      Break;
                                 end
                         end;
                     if not Finded then
                        begin
                             New(RecItem);
                             RecItem.Tabno    := Curr_Person^.Tabno;
                             RecItem.Name     := Curr_Person^.Fio;
                             RecItem.Summa    := Summa;
                             RecItem.NomerDog := IntToStr(GetKreditNomerDog(Curr_Person));
                             List.Add(RecItem);
                        end;
               END;
            CURR_PERSON:=CURR_PERSON^.NEXT;
       END;
 END;
procedure PrintHat;
 var S : String;
     I : Integer;
 begin
       S:=ALLTRIM(MONTH[NMES])+' '+FLOW_YEAR+' г.';
       writeln(dev,'Список '+AllTrim(ShifrList.GetName(WANTED_SHIFR))+' за ',s);
       if Wanted_Shifr<>Kredit_Shifr then
         begin
              writeln(dev,'-------------------------------------------');
              writeln(dev,':  N :Т.н.:  Фамилия И.О.      :  Сумма   :');
              writeln(dev,':----:----:--------------------:----------:');
         end
       else
         begin
              write(dev,'       Источники финансирования - ');
                   for i:=0 to GruppyList.Count-1 do
                       if GruppyList.IsSelected(i+1) then
                          write(dev,' ',Get_Ist_Name(i+1),' ');
              writeln(dev);
              writeln(dev,'---------------------------------------------------');
              writeln(dev,':  N :Т.н.:Договор:  Фамилия И.О.      :  Сумма   :');
              writeln(dev,':----:----:-------:--------------------:----------:');
         end;
       SummaTot:=0;
       LineNo:=0;
 end;
procedure PrintFooter;
 begin
       if Wanted_Shifr=Kredit_Shifr then
          begin
               writeln(dev,':----:----:-------:--------------------:----------:');
               writeln(dev,':                  И т о г о           :',SummaTot:10:2,':');
               writeln(dev,'---------------------------------------------------');
               writeln(dev);
               writeln(dev,DIREKTOR_DOLG_NAME);
               writeln(dev);
               writeln(dev,GL_BUH_DOLG_NAME);
          end
       else
          begin
       writeln(dev,':----:----:--------------------:----------:');
       writeln(dev,':          И т о г о           :',SummaTot:10:2,':');
       writeln(dev,'-------------------------------------------');
          end;
 end;
procedure PrintItem(RecItem:PRecItem);
 begin
      Inc(LineNo);
      if Wanted_Shifr=Kredit_Shifr then
      writeln(dev,':',LineNo:4,':',RecItem^.Tabno:4,':',copy(' '+RecItem^.NomerDog+space(7),1,7),
                  ':',copy(RecItem^.Name+space(20),1,20),
                  ':',RecItem^.Summa:10:2,':')
      else
      writeln(dev,':',LineNo:4,':',RecItem^.Tabno:4,':',copy(RecItem^.Name+space(20),1,20),':',
                  RecItem^.Summa:10:2,':');
      SummaTot:=SummaTot+RecItem^.Summa;
 end;
BEGIN
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не выбраны статьи');
             Exit;
        end;
    for i:=0 to ShifrList.Count-1 do
        begin
              if ShifrList.IsSelected(I+1) then
                 begin
                      Wanted_Shifr:=ShifrList.GetShifrByNo(i+1);
                      if ShifrList.IsAdd(Wanted_Shifr) then
                         begin
                              ShowMessage('Нужно выбрать статью удержаний а не начислений');
                              Exit;
                         end;
                      break;
                 end;
        end;
    if Wanted_Shifr=Kredit_Shifr then
       begin
            if GruppyList.CountSelected<=0 then
               begin
                    ShowMessage('Не выбраны счета');
                    Exit;
               end;
       end;
    List:=TList.Create;
    Nsrv_Temp:=NSRV;
    PutInf;
    Nmes_Temp:=NMES;
    Application.CreateForm(TFormProgress, FormProgress);
    FormProgress.Gauge.MinValue:=0;
    FormProgress.Gauge.MaxValue:=COUNT_SERV;
    FormProgress.Gauge.Progress:=0;
    FormProgress.LabelHeader.Caption:='';
    FormProgress.LabelFooter.Caption:='';
    FormProgress.Caption:='Создание свода';
    FormProgress.Show;

    FOR I_NSRV:=1 TO COUNT_SERV DO
        BEGIN
             FormProgress.Gauge.Progress:=I_NSRV;
             FormProgress.LabelHeader.Caption:=NAME_SERV(NSRV);
             FormProgress.LabelFooter.Caption:=NAME_SERV(NSRV);
             FormProgress.RePaint;
             Application.ProcessMessages;
             Nsrv:=I_Nsrv;
             IF NameServList.IsSelected(NSRV) THEN
                 BEGIN
                      MKFLNM;
                      IF FileExist(FNINF) THEN
                         BEGIN
                              GETINF(TRUE);
                              MAKE_FOND_FOR_ALL;
                              EMPTY_ALL_PERSON;
                         END;
                 END; { END OF IS_SELECTED [NSRV]}
        END; {Конец цикла по NSRV}
    FormProgress.Free;

    if List.Count>0 then
       begin
            if Wanted_Shifr=Kredit_Shifr then
               FName:=CDOC+'Kredit.TXT'
            else
               FName:=CDOC+'STRAH.TXT';
            AssignFile(Dev,FName);
            REWRITE(DEV);
            PrintHat;
            List.Sort(@CompareItems);
            for i:=0 to List.Count-1 do
                begin
                     RecItem:=PRecItem(List.Items[i]);
                     PrintItem(RecItem);
                end;
            PrintFooter;
            CloseFile(DEV);
{            if Wanted_Shifr=Kredit_Shifr then  }
               View(FName);
       end;
    for i:=0 to List.Count-1 do
        begin
             RecItem:=PRecItem(List.Items[i]);
             Dispose(RecItem);
        end;
    List.Free;
    NSRV:=NSRV_TEMP;
    NMES:=NMES_TEMP;
    MKFLNM;
    GetInf(Need_Net_For_GETINF);
  end;

procedure TFormListVypl.BitBtn3Click(Sender: TObject);
begin
     Print_List_Person_Ud;
end;

end.
