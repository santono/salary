unit UFormMkEmpList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons,ScrDef, ExtCtrls, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery;

type
  TFormMkEmpList = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditFName: TEdit;
    BitBtn5: TBitBtn;
    OpenDialog1: TOpenDialog;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    Button1: TButton;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    btn1: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    btnMov0416: TButton;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure btnMov0416Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
  private
    function  CalculateEmployeeList:integer;
    procedure CalculatePodr;
    function  ExistsInPersonList(tabno:integer):real;
    function  FillList:boolean;
    procedure CalculateOsnWidRaboty;
    procedure CalculateOsnWRPodr;
    procedure MakePersonListFromFile;
    procedure CalculateKoef1;
    procedure SetBudgetForAll;
    procedure SetProfSojuzForAll;
    procedure ClearProfSojuzForAll;
    procedure DeleteStrah_109;
    procedure TranslateFioInRussian;
    procedure BlockAllPerson;
    procedure DoRecalcOklady;
    procedure RestoreAdd09;
    procedure RestoreAdd09FromFile;
    procedure CorrectFile2015;
    procedure setKopToRubForAll092015;
    procedure translateFIO;
    procedure CorrectTabelUwol;
    procedure Restore092014FromDBFirebird;







    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMkEmpList: TFormMkEmpList;

implementation
  uses ScrUtil,ScrLists,ScrIO,UFibModule,ScrNalog, UFormPovLNR,
  UFormMovRecalc0416, UFormMoveRecalcOtp2016, UFormImportFromKU,
  UFormRepRecalcOtp2015,DateUtils,UFormMovePremFromSQL,
  UFormCalcPrem_11_2017,UFormMoveAwans2017_12,ScrIoSQL;

{$R *.dfm}

  type pPersonRec=^tPersonRec;
       tPersonRec=record
                   tabno : integer;
                   FIO   : string;
                   summa : Real;
                  end;
  var PersonList:TList;

function TFormMkEmpList.FillList:boolean;
  var personRec:pPersonRec;
      SQLStmnt:string;
  begin
       if Assigned(personList) then personList.Free;
       personList:=nil;
       personList:=TList.Create;
       SQLStmnt:='SELECT TABNO,FIO,SUMMA FROM TB_LIST_09 WHERE TABNO IS NOT NULL AND SUMMA IS NOT NULL';
       pFIBQuery1.Sql.Clear;
       pFIBQuery1.Sql.Add(SqlStmnt);
       pFIBQuery1.Transaction.StartTransaction;
       pFibQuery1.ExecQuery;
       while not pFIBQuery1.Eof do
        begin
             if pFIBQuery1.Fields[0].AsInteger>0 then
                begin
                     New(personRec);
                     personRec.tabno     := pFIBQuery1.Fields[0].AsInteger;
                     personRec.Fio       := pFIBQuery1.Fields[1].AsString;
                     personRec.summa     := pFIBQuery1.Fields[2].AsFloat;
                     personList.Add(personRec);
                end;
             pFIBQuery1.Next;
        end;
       pFibQuery1.Close;
       pFIBQuery1.Transaction.Commit;
       if personList.count>0 then FillList:=True
                           else fillList:=False;
  end;

procedure TFormMkEmpList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;




procedure TFormMkEmpList.FormCreate(Sender: TObject);
begin
     Label1.Caption        := '';
     Label2.Caption        := '';
end;


function TFormMkEmpList.ExistsInPersonList(tabno:integer):real;
 var finded:Boolean;
     i:Integer;
     Summa:Real;
 begin
      finded:=False;
      Summa:=0;
      if PersonList.Count>0 then
         for i:=0 to PersonList.Count-1 do
             if pPersonRec(PersonList.Items[i]).tabno=tabno then
                begin
                     finded:=True;
                     Summa:=pPersonRec(PersonList.Items[i]).summa;
                     PersonList.Delete(i);
                     Break;
                end;
      ExistsInPersonList:=summa;
 end;

procedure TFormMkEmpList.CalculatePodr;

  var
      Curr_Person:PERSON_PTR;
      Done:boolean;
      Curr_Ud:UD_PTR;
      Summa:Real;
  begin
            Curr_Person:=HEAD_PERSON;
            while (Curr_Person<>Nil) do
                 begin
                      Label2.Caption:=Curr_Person^.FIO;
                      while Curr_Person.Add<>Nil do DEL_ADD(Curr_Person.Add,Curr_Person);
                      while Curr_Person.Ud<>Nil  do DEL_UD(Curr_Person.Ud,Curr_Person);
                      FILL_STANDARD_TABEL_PERSON(Curr_Person);
                      Curr_Person.Automatic:=manual_mode;
                      Summa:=ExistsInPersonList(Curr_Person.TABNO);
                      if abs(Summa)>0.01 then
                         begin
                              FILL_STANDARD_TABEL_PERSON(Curr_Person);
                              MAKE_UD(Curr_Ud,Curr_Person);
                              Curr_Ud.SHIFR     := 102;
                              Curr_Ud.Summa     := Summa;
                              Curr_Ud.Year      := 2014-1990;
                              Curr_Ud.PERIOD    := 9;
                              Curr_Ud.Vyplacheno := get_out;
                         end;
                      Application.ProcessMessages;
                      Curr_Person:=Curr_Person^.Next;
                 end;
  end;


function TFormMkEmpList.CalculateEmployeeList:integer;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     NMEST:Integer;
begin
     if not ((NMES=09) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в сентябре 2014');
             Exit;
        end;
     if not YesNo('Сформировать список сотрудников ?') then Exit;
     if not FillList then
        begin
             ShowMessage('Не сформирован исходный список работников');
             Exit;
        end;
     RetVal  := 0;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              NMES:=10;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              NMES:=9;
              MKFLNM;
              CalculatePodr;
              PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     CalculateEmployeeList:=RetVal;
end;

procedure TFormMkEmpList.BitBtn4Click(Sender: TObject);
 var RetVal : Integer;
     WantedShifr:Integer;
begin
     if not ((NMES=9) and (WORK_YEAR_VAL=2014)) then
        begin
             ShowMessage('Можно запустить только в сентябре 2014 г.');
             Exit;
        end;
     RetVal:=CalculateEmployeeList;
  //   if RetVal>0 then
  //      ShowMessage('Насчитано '+IntToStr(RetVal)+' отпускных.');
     Close;

end;





procedure TFormMkEmpList.BitBtn1Click(Sender: TObject);
begin
     if not ((NMES=10) and (WORK_YEAR_VAL=2014)) then
        begin
             ShowMessage('Можно запустить только в октябре 2014 г. после формирования нового списка');
             Exit;
        end;
     CalculateOsnWidRaboty;

end;

procedure TFormMkEmpList.CalculateOsnWidRaboty;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
begin
     if not ((NMES=10) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в октябре 2014');
             Exit;
        end;
     if not YesNo('Сформировать только основное место работы ?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              CalculateOsnWRPodr;
              PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
end;


procedure TFormMkEmpList.CalculateOsnWRPodr;
   var
      Curr_Person:PERSON_PTR;
      Done:boolean;
      Curr_Add:Add_Ptr;
      Curr_Ud:Ud_Ptr;
      koef : Real;
  begin
       repeat
            done:=true;
            Curr_Person:=HEAD_PERSON;
            while (Curr_Person<>Nil) do
                 begin
                      Label2.Caption:=Curr_Person^.FIO;
                      if Curr_Person.WID_RABOTY<>OSN_WID_RABOTY then
                         begin
                              Del_Person(Curr_Person);
                              done:=False;
                              Break;
                         end;
                      Application.ProcessMessages;
                      Curr_Person:=Curr_Person^.Next;
                 end;
       until Done;
       Curr_Person:=HEAD_PERSON;
       while (Curr_Person<>Nil) do
           begin
                Label2.Caption:=Curr_Person^.FIO;
                koef := GET_KOEF_OKLAD_PERSON(Curr_Person);
                Curr_Person.GRUPPA:=1;
                Curr_Person.AUTOMATIC:=AUTOMATIC_MODE;
                while (Curr_Person.Add<>Nil) do DEL_ADD(Curr_Person.Add,Curr_Person);
                while (Curr_Person.Ud<>Nil)  do DEL_UD(Curr_Person.Ud,Curr_Person);
                if koef<1.00 then
                if koef>0.01 then
                Curr_Person^.OKLAD:=R10(Curr_Person.OKLAD/koef);
                MAKE_KOEF_OKLAD_PERSON(Curr_Person,koef);
                Curr_Person:=Curr_Person^.Next;
           end;
  end;


procedure TFormMkEmpList.BitBtn5Click(Sender: TObject);
begin
     if OpenDialog1.Execute then
        begin
             EditFName.Text:=OpenDialog1.FileName;
             Application.ProcessMessages;
        end;
end;

procedure TFormMkEmpList.MakePersonListFromFile;
 var fName      : string;
     dev        : TextFile;
     s,s1,s2,s3 : string;
     i,l        : Integer;
     iVal,iCode : Integer;
     SQLStmnt   : string;
     tabno      : Integer;
     FIO        : string;
 begin
      fName:=EditFName.Text;
      if not FileExists(fName) then
         begin
              ShowMessage('Отсутствует файл '+fName);
              Exit;
         end;


      AssignFile(dev,fName);
      Reset(dev);
      while not Eof(dev) do
         begin
              Readln(dev,s);
              if (Length(s)<7) then Continue;
              s1:=Copy(s,1,5);
              s2:=Copy(s,7,100);
              Val(s1,iVal,iCode);
              if (iCode<>0) then
                 begin
                      Continue;
                 end;
              Tabno:=iVal;
              Fio:=trim(s2);
{
              s1 := '';
              i  := 0;
              l  := Length(s);
              while (true) do
                begin
                     Inc(i);
                     if (i>l) then Break;
                     s2:=Copy(s,i,1);
                     s3:=s1;
                     s1:=s1 + s2;
                     val(s1,iVal,iCode);
                     if (iCode<>0) then Break;
                end;
              val(s3,iVal,iCode);
              if iCode<>0 then Continue;
              tabno:=iVal;
}
     //         FIO:=dostoWin(FIO);
              FIO:=StringReplace(FIO,'''','\''',[rfReplaceAll]);
              SQLStmnt:='insert into TB_LNR(TABNO,FIO) VALUES('+IntToStr(tabno)+',''Коледж'')';
              FIB.pFIBDatabaseSal.Execute(SQLStmnt);
         end;
 end;

procedure TFormMkEmpList.BitBtn2Click(Sender: TObject);
begin
      MakePersonListFromFile;
end;

procedure TFormMkEmpList.CalculateKoef1;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     Curr_Person:PERSON_PTR;
begin
     if not ((NMES=10) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в октябре 2014');
             Exit;
        end;
     if not YesNo('Сформировать коэффициент 1 ?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
               begin
                    MAKE_KOEF_OKLAD_PERSON(Curr_Person,1.0);
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if COUNT_PERSON>0 then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
end;

procedure TFormMkEmpList.SetBudgetForAll;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     Curr_Person:PERSON_PTR;
begin
     if not ((NMES=10) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в октябре 2014');
             Exit;
        end;
     if not YesNo('Сформировать бюджет всем ?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
               begin
                    Curr_Person.GRUPPA:=1;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if COUNT_PERSON>0 then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
end;


procedure TFormMkEmpList.SetProfSojuzForAll;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     Curr_Person:PERSON_PTR;
begin
     if not ((NMES=07) and (CURRYEAR=2015)) then
        begin
             ShowMessage('Можно запустить только в июле 2015');
             Exit;
        end;
     if not YesNo('Сформировать профсоюз всем ?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
               begin
                    Curr_Person.PROFSOJUZ:=1;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if COUNT_PERSON>0 then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Сформировано');
end;

procedure TFormMkEmpList.ClearProfSojuzForAll;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     Curr_Person:PERSON_PTR;
begin
     if not ((NMES=09) and (CURRYEAR=2015)) then
        begin
             ShowMessage('Можно запустить только в сентябре 2015');
             Exit;
        end;
     if not YesNo('Убрать признак профсоюза у всех сотрудников ?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
               begin
                    Curr_Person.PROFSOJUZ:=0;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if COUNT_PERSON>0 then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Профсоюз убран - пересчитйте налоги или запустите утилиты удаления статьи удержаний');
end;



procedure TFormMkEmpList.DeleteStrah_109;
 const wantedShifr = 62;
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     Curr_Ud : UD_PTR;
     Curr_Cn : CN_PTR;
     Finded  : Boolean;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
begin

     AmountOfPerson:=0;
     if not ((NMES=10) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в октябре 2014');
             Exit;
        end;
     if not YesNo('Удалить 109-й шифр у всех?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    Curr_Person.PROFSOJUZ:=0;
                    Curr_Person.GRUPPA:=1;
                    repeat
                          finded:=False;
                          Curr_ud:=Curr_Person.Ud;
                          while (Curr_Ud<>Nil) do
                            begin
                                 if (Curr_Ud.Shifr=wantedShifr) then
                                    begin
                                         NeedPut:=True;
                                         DEL_Ud(Curr_Ud,Curr_Person);
                                         Finded:=True;
                                         Break;
                                    end;
                                 Curr_Ud:=Curr_Ud.Next;
                            end;
                    until not Finded;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Статья 109 удалена у '+intToStr(AmountOfPerson)+' сотрудников');
end;


procedure TFormMkEmpList.TranslateFioInRussian;
 const UkrChrs: array[1..7] of char=('і','І','ї','Ї','є','Є','''');
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     Finded  : Boolean;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
     SQLStmnt : string;
     Fio,S:string;
     v:Variant;
   function hasUkrChar(s:string):Boolean;
    var retVal:Boolean;
        i:Integer;
    begin
         retVal:=False;
         for i:=1 to 7 do
            if Pos(UkrChrs[i],s)>0 then
               begin
                    retVal:=True;
                    Break;
               end;
         hasUkrChar:=retVal;
    end;
   function hasDigit(s:string):Boolean;
    var retVal:Boolean;
        i:Integer;
    begin
         retVal:=False;
         for i:=0 to 9 do
            if Pos(IntToStr(i),s)>0 then
               begin
                    retVal:=True;
                    Break;
               end;
         hasDigit:=retVal;
    end;
begin

     AmountOfPerson:=0;
     if not ((NMES=11) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в ноябре 2014');
             Exit;
        end;
     if not YesNo('Перевести фамилии на русский язык') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    SQLStmnt:='select first 1 fio from kadry where tabno='+intToStr(curr_Person.tabno);
                    v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
                    if VarIsStr(v) then
                       begin
                           s:=v;
                           fio:=s;
                           fio:=trim(fio);
                           if Length(fio)>0 then
                           if not hasUkrChar(fio) then
                           if not hasDigit(fio) then
                              begin
                                  Curr_Person.FIO:=SHORT_FIO(fio);
                                  needput:=True;
                              end
                           else
                              begin
                                   ShowMessage('Проверьте в кадрах фамилию '+fio);
                              end;
                       end;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Статья 109 удалена у '+intToStr(AmountOfPerson)+' сотрудников');
end;

procedure TFormMkEmpList.BlockAllPerson;
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     Finded  : Boolean;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
     Fio,S:string;
begin

     AmountOfPerson:=0;
     if not ((NMES=12) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в декабре 2014');
             Exit;
        end;
     if not YesNo('Пожелтить всех?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    Curr_Person.AUTOMATIC:=MANUAL_MODE;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              PutInf;
              LDEL_PERSON;
         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Пожелчено');
end;



procedure TFormMkEmpList.BitBtn6Click(Sender: TObject);
begin
     CalculateKoef1;
end;

procedure TFormMkEmpList.BitBtn7Click(Sender: TObject);
begin
      SetBudgetForAll;
end;

procedure TFormMkEmpList.BitBtn8Click(Sender: TObject);
begin
     DeleteStrah_109;
end;

procedure TFormMkEmpList.BitBtn9Click(Sender: TObject);
begin
     TranslateFIOInRussian;
end;

procedure TFormMkEmpList.Button1Click(Sender: TObject);
begin
     BlockAllPerson;
end;

procedure TFormMkEmpList.BitBtn10Click(Sender: TObject);
begin
     DoRecalcOklady;
end;

procedure TFormMkEmpList.DoRecalcOklady;
 const UkrChrs: array[1..7] of char=('і','І','ї','Ї','є','Є','''');
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     Finded  : Boolean;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
     Razr:Integer;
 procedure RecalcOklPerson(Curr_Person:PERSON_PTR;WantedM:Integer;var NeedPut:boolean);
   var
     SQLStmnt : string;
     v:Variant;
     GUID:string;
     summa:Real;
     Curr_Add:ADD_PTR;
   begin
       GUID:=GetGUIDPersonToString(Curr_Person);
       if (Length(Trim(guid))<4) then Exit;
       SQLStmnt:= 'select summa from pr_get_rclc_okl(';
       SQLStmnt:=Trim(SQLSTmnt)+intToStr(Curr_Person^.tabno)+',2014,';
       SQLStmnt:=Trim(SQLSTmnt)+intToStr(WantedM)+','''+guid+''')';
       v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
       if VarIsNumeric(v) then
          begin
               Summa:=v;
               if (summa>0.10) then
                  begin
                       needput:=True;
                       DEL_WANTED_ADD(Oklad_Shifr,Curr_Person,wantedm);
                       MAKE_ADD(Curr_Add,Curr_Person);
                       Curr_Add.SHIFR:=OKLAD_SHIFR;
                       Curr_Add.SUMMA:=summa;
                       Curr_Add.FZP:=Curr_add.SUMMA;
                       Curr_Add.PERIOD:=WantedM;
                       Curr_Add.year:=2014-1990;
                       Curr_Add.WHO:=41;
                       Curr_Add.Vyplacheno:=get_out;
                  end;
          end;

   end;

begin

     AmountOfPerson:=0;
     if not ((NMES=12) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в декабре 2014');
             Exit;
        end;
     if not YesNo('Перевести перерасчеты окдада за 10-11 с 1 по 6 разр.') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    Razr:=GetRazrjadPerson(Curr_Person);
                    if ((Razr>0) and (Razr<7)) then
                       begin
                          RecalcOklPerson(Curr_Person,10,NeedPut);
                          RecalcOklPerson(Curr_Person,11,NeedPut);
                       end;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Перерасчте законсен');
end;

procedure TFormMkEmpList.RestoreAdd09;
 type pRec=^TRec;
      tRec=record
            shifr:Integer;
            summa:Real;
           end;
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     Finded  : Boolean;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
     S       : String;
     aVal    : Real;
     i       : Integer;
     ListAdd : TList;
     ListUd  : TList;
 procedure InitLists;
  var rec:pRec;
  begin
{  3914.90
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=2914;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=8;
       rec.summa:=874.20;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=18;
       rec.summa:=437.10;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=22;
       rec.summa:=728.50;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=28;
       rec.summa:=13.40;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=50;
       rec.summa:=699.63;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=62;
       rec.summa:=49.67;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=143;
       rec.summa:=303.0;
       ListUd.Add(rec);
}
 {// 3685.23
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=2914;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=8;
       rec.summa:=582.80;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=18;
       rec.summa:=437.10;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=22;
       rec.summa:=728.50;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=28;
       rec.summa:=13.40;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=50;
       rec.summa:=658.59;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=62;
       rec.summa:=46.76;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=143;
       rec.summa:=285.22;
       ListUd.Add(rec);
}
{ // 2629.43
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=2556;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=8;
       rec.summa:=766.80;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=18;
       rec.summa:=437.10;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=28;
       rec.summa:=13.40;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=50;
       rec.summa:=469.90;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=62;
       rec.summa:=33.36;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=143;
       rec.summa:=203.51;
       ListUd.Add(rec);
}
 // 2427.97
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=2556;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=8;
       rec.summa:=511.20;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=28;
       rec.summa:=13.40;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=50;
       rec.summa:=433.90;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=62;
       rec.summa:=30.81;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=143;
       rec.summa:=187.92;
       ListUd.Add(rec);




{ // 2071.34
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=2377;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=8;
       rec.summa:=237.71;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=28;
       rec.summa:=13.40;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=50;
       rec.summa:=370.17;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=62;
       rec.summa:=26.28;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=143;
       rec.summa:=160.31;
       ListUd.Add(rec);
}
{ // 2071.34
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=2377;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=8;
       rec.summa:=237.71;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=28;
       rec.summa:=13.40;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=50;
       rec.summa:=370.17;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=62;
       rec.summa:=26.28;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=143;
       rec.summa:=160.31;
       ListUd.Add(rec);
}

{// 1089.38
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=1218;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=62;
       rec.summa:=84.77;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=142;
       rec.summa:=43.85;
       ListUd.Add(rec);
}
{// 1209.43
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=1218;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=40;
       rec.summa:=163.37;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=50;
       rec.summa:=108.40;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=62;
       rec.summa:=13.81;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=142;
       rec.summa:=49.73;
       ListUd.Add(rec);
}
{// 1205.30
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=1218;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=40;
       rec.summa:=158.27;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=50;
       rec.summa:=107.66;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=62;
       rec.summa:=13.76;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=142;
       rec.summa:=49.55;
       ListUd.Add(rec);
}
{// 1192.90
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=1218;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=40;
       rec.summa:=142.95;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=50;
       rec.summa:=105.44;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=62;
       rec.summa:=13.61;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=142;
       rec.summa:=48.99;
       ListUd.Add(rec);
}
{// 1209.43
       ListAdd:=TList.Create;
       New(Rec);
       rec.shifr:=1;
       rec.summa:=1218;
       ListAdd.Add(rec);
       New(Rec);
       rec.shifr:=40;
       rec.summa:=163.37;
       ListAdd.Add(rec);

       ListUd:=TList.Create;
       New(Rec);
       rec.shifr:=50;
       rec.summa:=108.40;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=62;
       rec.summa:=13.81;
       ListUd.Add(rec);
       New(Rec);
       rec.shifr:=142;
       rec.summa:=49.73;
       ListUd.Add(rec);
}

  end;
 procedure RestoreAddPerson(Curr_Person:PERSON_PTR;var NeedPut:boolean);
   var
     summa:Real;
     Curr_Add:ADD_PTR;
     Curr_Ud:UD_PTR;
     i:Integer;
   begin
       summa:=0;
       Curr_Add:=Curr_Person.ADD;
       while (Curr_Add<>Nil) do
        begin
             Summa:=Summa+Curr_Add.SUMMA;
             Curr_Add:=Curr_Add.NEXT;
        end;
       if Abs(Summa)>1 then Exit;
       Curr_Ud:=Curr_Person.Ud;
       while (Curr_Ud<>Nil) do
        begin
             Summa:=Summa-Curr_Ud.SUMMA;
             Curr_Ud:=Curr_Ud.NEXT;
        end;
        if (Abs(Abs(summa)-abs(aVal))>0.01) then Exit;
        needPut:=True;
        Inc(AmountOfPerson);
        for i:=0 to ListAdd.Count-1 do
           begin
                MAKE_ADD(Curr_Add,Curr_Person);
                Curr_Add.Shifr:=pRec(ListAdd.Items[i])^.shifr ;
                Curr_Add.summa:=pRec(ListAdd.Items[i])^.SUMMA ;
                Curr_Add.fzp:=Curr_Add.summa;
                Curr_Add.Vyplacheno:=get_out;
                Curr_Add.Year:=2014-1990;
                Curr_Add.Period:=9;
                Curr_Add.Who:=91;
           end;
        for i:=0 to ListUd.Count-1 do
           begin
                MAKE_UD(Curr_Ud,Curr_Person);
                Curr_Ud.Shifr:=pRec(ListUd.Items[i])^.Shifr;
                Curr_Ud.summa:=pRec(ListUd.Items[i])^.summa ;
                Curr_Ud.Vyplacheno:=get_out;
                Curr_Ud.Year:=2014-1990;
                Curr_Ud.Period:=9;
                Curr_Ud.Who:=91;
           end;
   end;

begin

     AmountOfPerson:=0;
     if not ((NMES=09) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в сентябре 2014');
             Exit;
        end;
     if not YesNo('Восстановить начисления и удержанийя?') then Exit;
     S:=InputBox('Сумма на руки','Укажите сумму наруки','3914.00');
     Val(s,aVal,i);
     if (i<>0) then
        begin
             ShowMessage('Неврно указана сумма на руки');
        end;
     InitLists;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    RestoreAddPerson(Curr_Person,NeedPut);
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Восстановлено '+IntToStr(AmountOfPerson)+' сотрудников.');
end;

procedure TFormMkEmpList.RestoreAdd09FromFile;
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     Finded  : Boolean;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
     S       : String;
     aVal    : Real;
     i       : Integer;
 procedure RestoreAddPerson(Curr_Person:PERSON_PTR;var NeedPut:boolean);
   begin
    //   RestPerson09(Curr_Person);
       tryToFind09inAllFiles(Curr_Person);
       if COUNT_ADD(Curr_Person)>0 then
          begin
               needPut:=True;
               Inc(AmountOfPerson);
          end;
   end;

begin

     AmountOfPerson:=0;
     if not ((NMES=09) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в сентябре 2014');
             Exit;
        end;
     if not YesNo('Восстановить начисления из файла?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    if ((COUNT_ADD(curr_person)=0) and
                       (COUNT_UD(curr_Person)=1)) then
                    RestoreAddPerson(Curr_Person,NeedPut);
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Восстановлено '+IntToStr(AmountOfPerson)+' сотрудников.');
end;

procedure TFormMkEmpList.Restore092014FromDBFirebird;
 const wantedMonth=9;
       wantedYear=2014;
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     S       : String;
     aVal    : Real;
     i       : Integer;


begin

     if not ((NMES=09) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в сентябре 2014');
             Exit;
        end;
     if not YesNo('Восстановить начисления из БД?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=82 to 82 do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              LDEL_PERSON;
              getInfSqlArc(WantedMonth,WantedYear);
              i:=count_person;
              putinf;
              LDEL_PERSON;
         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Восстановлено ');
end;

procedure TFormMkEmpList.CorrectFile2015;
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     Finded  : Boolean;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
     S       : String;
     aVal    : Real;
     i       : Integer;
 procedure RestoreCnPerson(Curr_Person:PERSON_PTR;var NeedPut:boolean);
   var curr_cn:CN_PTR;
       l:integer;
       finished:Boolean;
   begin
    //   RestPerson09(Curr_Person);
       l:=COUNT_CN(curr_person);
       if l>0 then
       while True do
          begin
               finished:=True;
               Curr_cn:=curr_person.CN;
               while (curr_cn<>nil) do
                 begin
                      if curr_cn.kod=100 then
                      if curr_cn.PRIM=1 then
                      if ((curr_cn.SHIFR=18+LIMIT_CN_BASE) or
                         (curr_cn.shifr=8+LIMIT_CN_BASE) or
                         (curr_cn.shifr=22+LIMIT_CN_BASE) or
                         (curr_cn.shifr=49+LIMIT_CN_BASE)) then
                         begin
                              DEL_CN(curr_cn,curr_person);
                              needput  := True;
                              finished := False;
                              Break;
                         end;
                      curr_cn:=curr_cn.Next;

                  end;
                 if finished then
                    Break;
               Inc(AmountOfPerson);
          end;
   end;

begin

     AmountOfPerson:=0;
     if not ((NMES=01) and (CURRYEAR=2015)) then
        begin
             ShowMessage('Можно запустить только в январе 2015');
             Exit;
        end;
     if not YesNo('Восстановить CN?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    RestoreCNPerson(Curr_Person,NeedPut);
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Восстановлено '+IntToStr(AmountOfPerson)+' сотрудников.');
end;

procedure TFormMkEmpList.CorrectTabelUwol;
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     Finded  : Boolean;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
     S       : String;
     aVal    : Real;
     i       : Integer;
 PROCEDURE FILL_TABEL_UW(CURR_PERSON:PERSON_PTR;var needPut:boolean);
  VAR I   : INTEGER;
      Dt  : TDateTime;
      D   : Integer;
      y,m : integer;
  BEGIN
       if CURR_PERSON^.TABNO=11899 then
          y:=1;
       Dt := getDataUwPerson(Curr_person);
       y  := yearof(dt);
       m  := monthof(dt);
       d  := dayof(dt);
       if YearOf(Dt)  <> Work_Year_Val then Exit;
       if MonthOf(Dt) <> NMES          then Exit;
       D:=DayOf(Dt);
       IF CURR_PERSON^.MAIN<=0 THEN EXIT;
       FOR I:=1 TO 31 DO
          //      CASE MONTH_DAY[2,NMES,I] OF
       if i=D then
       if CURR_PERSON^.TABEL[I]=NEZAPOLN then
          begin
               CURR_PERSON^.TABEL[I] := JAWKA;
               Inc(AmountOfPerson);
               needPut:=True;
          end
  END;


begin

     AmountOfPerson:=0;
     if not ((NMES=06) and (CURRYEAR=2017)) then
        begin
             ShowMessage('Можно запустить только в июне 2017');
             Exit;
        end;
     if not YesNo('Откорректировать табель для увольняемых с 30.06.2017?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    FILL_TABEL_UW(CURR_PERSON,needPut);
                    FILL_TABEL_UW(CURR_PERSON,needPut);
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              EMPTY_ALL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Откорректировано '+IntToStr(AmountOfPerson)+' сотрудников.');
end;

procedure TFormMkEmpList.BitBtn11Click(Sender: TObject);
begin
      RestoreAdd09;
end;

procedure TFormMkEmpList.BitBtn12Click(Sender: TObject);
begin
//     RestoreAdd09FromFile;
     Restore092014FromDBFirebird;
end;

procedure TFormMkEmpList.BitBtn13Click(Sender: TObject);
begin
   //  CorrectFile2015;
     CorrectTabelUwol;
end;

procedure TFormMkEmpList.BitBtn14Click(Sender: TObject);
begin
     SetProfSojuzForAll;
end;

procedure TFormMkEmpList.btn1Click(Sender: TObject);
begin
     setKopToRubForAll092015;
end;
procedure TFormMkEmpList.setKopToRubForAll092015;
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     Finded  : Boolean;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
     S       : String;
     aVal    : Real;
     i       : Integer;
 procedure ConvertKopToRubPerson(Curr_Person:PERSON_PTR;var NeedPut:boolean);
   var curr_ud:UD_PTR;
       l:integer;
       finished:Boolean;
   begin
    //   RestPerson09(Curr_Person);
       Curr_Ud:=Curr_Person.UD;
       while (curr_ud<>nil) do
        begin
             if curr_ud.shifr=SALDO_SHIFR then
                begin
                     curr_ud.SUMMA:=R10(curr_ud.SUMMA*2);
                     needput:=True;
                end;
             curr_ud:=curr_ud.NEXT;
        end;
   end;

begin

     AmountOfPerson:=0;
     if not ((NMES=09) and (CURRYEAR=2015)) then
        begin
             ShowMessage('Можно запустить только в сентябре 2015');
             Exit;
        end;
     if not YesNo('Превратить копейки прошлого месяца в рубли?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    ConvertKopToRubPerson(Curr_Person,NeedPut);
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Выполнено ');
end;


procedure TFormMkEmpList.BitBtn15Click(Sender: TObject);
begin
      ClearProfSojuzForAll;
end;

procedure TFormMkEmpList.BitBtn16Click(Sender: TObject);
begin
//     Application.CreateForm(TFormPovLNR,FormPovLNR);
//     FormPovLNR.ShowModal;
     Application.CreateForm(TFormMovePremFromSQL,FormMovePremFromSQL);
     FormMovePremFromSQL.ShowModal;
//     Application.CreateForm(TFormCalcPrem_11_2017,FormCalcPrem_11_2017);
//     FormCalcPrem_11_2017.showModal;

end;

procedure TFormMkEmpList.translateFIO;
 var I_Podr,Cnt : Integer;
     NSRVTmp,NMESTmp : Integer;
     RetVal : Integer;
     Curr_Person : PERSON_PTR;
     Finded  : Boolean;
     NeedPut : Boolean;
     AmountOfPerson:Integer;
     S       : String;
     aVal    : Real;
     i       : Integer;
     fio,fFIO:string;
begin

     AmountOfPerson:=0;
     if not ((NMES=1) and (CURRYEAR=2016)) then
        begin
             ShowMessage('Можно запустить только в январе 2016');
             Exit;
        end;
     if not YesNo('Перевести Фамилия ИО на рус язык в файлах подразделений?') then Exit;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              Curr_Person:=HEAD_PERSON;
              needput:=False;
              while (Curr_Person<>Nil) do
               begin
                    fio:='';
                    fFIO:=GetFullRusFioPerson(Curr_Person^.tabno);
                    fFio:=trim(fFIO);
                    if length(fFIO)>1 then
                       begin
                            fio:=short_fio(fFIO);
                            fio:=trim(fio);
                       end;
                    if Length(fio)>2 then
                       begin
                           Curr_Person^.FIO:=FIO;
                           needput:=true;
                       end;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     ShowMessage('Выполнено ');
end;

procedure TFormMkEmpList.BitBtn17Click(Sender: TObject);
begin
     translateFIO;
end;

procedure TFormMkEmpList.btnMov0416Click(Sender: TObject);
 
begin
      Application.CreateForm(TFormMovRecalc0416,FormMovRecalc0416);
      FormMovRecalc0416.ShowModal;
end;

procedure TFormMkEmpList.BitBtn18Click(Sender: TObject);
begin
     if isLNR then
        begin
//              Application.CreateForm(TFormMoveRecalcOtp2016,FormMoveRecalcOtp2016);
//              FormMoveRecalcOtp2016.ShowModal;
//              Application.CreateForm(TFormMoveAwans2017_12,FormMoveAwans2017_12);
//              FormMoveAwans2017_12.ShowModal;
              Application.CreateForm(TFormMoveRecalcOtp2016,FormMoveRecalcOtp2016);
              FormMoveRecalcOtp2016.ShowModal;
        end;


end;

procedure TFormMkEmpList.BitBtn19Click(Sender: TObject);
begin
     Application.CreateForm(TFormImportFromKU,FormImportFromKU);
     FormImportFromKU.ShowModal;

end;

procedure TFormMkEmpList.BitBtn20Click(Sender: TObject);
begin
     Application.CreateForm(TFormRepRecalcOtp2015,FormRepRecalcOtp2015);
     FormRepRecalcOtp2015.ShowModal;

end;

end.
