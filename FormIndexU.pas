unit FormIndexU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Gauges, ExtCtrls, FIBQuery,
  pFIBQuery, FIBDatabase, pFIBDatabase, Spin, Menus;

type
  TFormIndex = class(TForm)
    DateTimePickerDateZa: TDateTimePicker;
    Label1: TLabel;
    EditProcInd: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    EditLimitSumma: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    GaugePodr: TGauge;
    GaugePerson: TGauge;
    LabelPodr: TLabel;
    LabelPerson: TLabel;
    LabelTimer: TLabel;
    Timer1: TTimer;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    pFIBQuery: TpFIBQuery;
    pFIBTransaction: TpFIBTransaction;
    BitBtn6: TBitBtn;
    CheckBox1: TCheckBox;
    Label7: TLabel;
    RazrFrEdit: TSpinEdit;
    RazrToEdit: TSpinEdit;
    Label8: TLabel;
    Label9: TLabel;
    PopupMenu1: TPopupMenu;
    N11: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn7: TBitBtn;
    Button1: TButton;
    CheckBoxUdIndOtherRazr: TCheckBox;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    N3: TMenuItem;
    N20121: TMenuItem;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    n20140104: TMenuItem;
    N20151: TMenuItem;
    N20152: TMenuItem;
    N1220151: TMenuItem;
    N122015N1: TMenuItem;
    F41: TMenuItem;
    procedure EditProcIndChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EditLimitSummaChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure EditProcIndExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N2012071Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N20121Click(Sender: TObject);
    procedure n20140104Click(Sender: TObject);
    procedure N20151Click(Sender: TObject);
    procedure N20152Click(Sender: TObject);
    procedure N1220151Click(Sender: TObject);
    procedure N122015N1Click(Sender: TObject);
    procedure F41Click(Sender: TObject);
  private
    { Private declarations }
    ProcInd:real;
    LimitSumma:real;
    TimeStart:TDateTime;
    TimePassed:TDateTime;
    procedure CreateListOfDoubleWorker;
    procedure MoveInd201207;
    procedure MoveIndToCnFor20140401;
    procedure MoveIndFr5To6WithMinus;
    procedure mkindex112015;
    procedure mkPrem112015;
    procedure MoveRclc122015;
    procedure FormIndAfterRclc122015;
    procedure FormIndFromCNIn122015;
    procedure delConstIndFromCN;
    procedure MakeInd_10_2017;




  public
    { Public declarations }
  end;


var
  FormIndex: TFormIndex;

implementation

uses UFibModule,ScrDef,Uformselpod,ScrUtil,uFormWait, ScrIo,ScrLists,DateUtils,Math,
  UFormSelPKG,UFormIndProc, UFormSetBaseData, UFormBrowseInd,ScrNalog,USQLUnit;

const RecalcInd_Id=112;

{$R *.dfm}

procedure TFormIndex.EditProcIndChange(Sender: TObject);
var S:String;
    A:Real;
    I:Integer;
begin
     Exit;
     S:=AllTrim(EditProcInd.Text);
     if length(S)=0 then
        begin
             ShowMessage('Не задан процент индексации');
             Exit;
        end;
     val(S,A,I);
     if (i<>0) then
        begin
             ShowMessage('Не верно задан процент индексации');
             Exit;
        end;
     if A<0.001 then
        begin
             ShowMessage('Не верно задан процент индексации');
             Exit;
        end;
     if a>100 then
        begin
             ShowMessage('Не верно задан процент индексации');
             Exit;
        end;
     if a>1 then a:=a/100;
     ProcInd:=a;
end;

procedure TFormIndex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormIndex.FormCreate(Sender: TObject);
begin
     ProcInd:=0;
     LimitSumma:=0;
     DateTimePickerDateZa.Date:=Date();
     RazrFrEdit.Value:=1;
     RazrToEdit.Value:=25;
     CheckBox1.Checked:=false;
     CheckBoxUdIndOtherRazr.Checked:=True;
     if isSVDN then
        BitBtn1.Caption:='Индексация с 10 2017';
end;

procedure TFormIndex.EditLimitSummaChange(Sender: TObject);
var S:String;
    A:Real;
    I:Integer;
begin
     S:=AllTrim(EditLimitSumma.Text);
     if length(S)=0 then
        begin
             ShowMessage('Не задана максимальная индексируемая сумма');
             Exit;
        end;
     val(S,A,I);
     if (i<>0) then
        begin
             ShowMessage('Не верно задана максимальная индексируемая сумма');
             Exit;
        end;
     if A<1 then
        begin
             ShowMessage('Не верно задана максимальная индексируемая сумма');
             Exit;
        end;
     LimitSumma:=a;
end;

procedure TFormIndex.BitBtn2Click(Sender: TObject);
begin
{
    Application.CreateForm(TFormSelPodr, FormSelPodr);
    FormSelPodr.ShowModal;
}
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormIndex.BitBtn1Click(Sender: TObject);
var DataZa:TDateTime;
    NSRVT,NMES_T:Integer;
    S:String;
    SummaInd:Real;
    Curr_Person:Person_Ptr;
    I,J:Integer;
    Razr,RazrFr,RazrTo : integer;
    NeedBlocked   : boolean;

    procedure DeleteIndPerson(Curr_Person:PERSON_PTR;Y:Integer;M:integer);
     var Finished:Boolean;
         yy:Integer;
         Curr_Add:Add_Ptr;
     begin
         yy:=y;
         if yy<1990 then
            yy:=yy-1990;
         while true do
           begin
                Finished:=true;
                Curr_Add:=Curr_Person^.Add;
                While (Curr_Add<>Nil) do
                  begin
                       if Curr_Add^.Who=RecalcInd_Id then
                       if Curr_Add^.Year=YY then
                       if Curr_Add^.Period=M then
                          begin
                               Del_Add(Curr_Add,Curr_Person);
                               Finished:=false;
                               break;
                          end;
                       Curr_Add:=Curr_Add^.NEXT;
                  end;
                if Finished then break;
           end;


     end;

  procedure DeleteRecalcResult;
     var Curr_Person:Person_Ptr;
     begin
          curr_person:=Head_Person;
          while (Curr_Person<>Nil) do
            begin
                 DeleteIndPerson(Curr_Person,YearOf(DataZa),MonthOf(DataZa));
                 Curr_Person:=Curr_Person^.NEXT;
            end;
     end;


    procedure AddToPerson(Summa:Real);
     var Curr_Add:Add_Ptr;
     begin
           Make_Add(Curr_Add,Curr_Person);
           Curr_Add^.Shifr    := Index_Shifr;
           Curr_Add^.Period   := MonthOf(DataZa);
           Curr_Add^.Year     := YearOf(DataZa)-1990;
           Curr_Add^.Summa    := Summa;
           Curr_Add^.FZP      := Curr_Add^.Summa;
           Curr_Add^.Who      := RecalcInd_Id;
           Curr_Add^.Vyplacheno:=get_out;
     end;

begin
     MakeInd_10_2017;
     exit;
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

     if (ProcInd<0.001) or (ProcInd>1) then
        begin
             ShowMessage('Не вверно задан процент индексации');
             Exit;
        end;
     if (LimitSumma<100) or (LimitSumma>10000) then
        begin
             ShowMessage('Не вверно задана максимальная сумма, подлежащапя индексации');
             Exit;
        end;
     RazrTo:=RazrToEdit.Value;
     RazrFr:=RazrFrEdit.Value;
     if (RazrTo<1) or (RazrTo>25) then
        begin
             ShowMessage('Не вверно задан разряд -по-');
             Exit;
        end;
     if (RazrFr<1) or (RazrFr>25) then
        begin
             ShowMessage('Не вверно задан разряд -с-');
             Exit;
        end;
     if (RazrFr>RazrTo) then
        begin
             ShowMessage('Не вверно заданы разряды');
             Exit;
        end;
     if CheckBoxUdIndOtherRazr.Checked then
        begin
             if not YesNo('Индексация другим разрядам будет удалена. Согласны?') Then
                Exit;
        end
     else
        begin
             if not YesNo('Индексация другим разрядам будет оставлена, если была. Согласны?') Then
                Exit;
        end;

     NeedBlocked:=CheckBox1.Checked;
     DataZa:=DateTimePickerDateZa.Date;
     TimeStart   := Time;
     LabelTimer.Show;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     GaugePerson.MinValue :=  0;
     GaugePerson.MaxValue := 12;
     GaugePerson.Progress :=  1;

     NSRVT := NSRV;
     LDEL_PERSON;
     nmes_t := nmes;

{     Установить параметры расчета индексации в FireBird}
     S:='delete from tb_par_index where MonthZa='+IntToStr(MonthOf(DataZa))+' and YearZA='+IntToStr(YearOf(DataZa));
     FIB.pFIBDatabaseSal.Execute(S);
     pFIBQuery.Transaction.StartTransaction;
     S:='insert into tb_par_index (monthza,yearza,procind,limitsumma,razrfr,razrto,needblocked) values(';
     S:=S+IntToStr(MonthOf(DataZa))+',';
     S:=S+IntToStr(YearOf(DataZa))+',';
     S:=S+FormatFloatPointL(ProcInd,4)+',';
     S:=S+FormatFloatPoint(LimitSumma)+',';
     S:=S+IntToStr(RazrFr)+',';
     S:=S+IntToStr(RazrTo)+',';
     if NeedBlocked then
        S:=S+'1)'
     else
        S:=S+'0)';
     FIB.pFIBDatabaseSal.Execute(S);

     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              NSRV:=I;
              GaugePodr.Progress:=i;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              GaugePodr.Progress:=i;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              LabelPodr.ReFresh;
              LabelPodr.RePaint;
              GaugePerson.MinValue :=  0;
              GaugePerson.MaxValue := COUNT_PERSON;
              GaugePerson.Progress :=  1;
              if CheckBoxUdIndOtherRazr.Checked then
                 DeleteRecalcResult;
              Curr_Person:=Head_Person;
              J:=0;
              while (Curr_Person<>Nil) do
               begin
                    Inc(J);
                    if Curr_Person^.tabno=8758 then
                       j:=j;
                    GaugePerson.Progress:=J;
                    LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                    LabelPerson.ReFresh;
                    LabelPerson.RePaint;
                    Razr:=GetRazrjadPerson(Curr_Person);
                    if GruppyList.IsSelected(Curr_Person^.Gruppa) then
//                    if Curr_Person^.Wid_Raboty=Osn_Wid_Raboty then
                    if IS_OSN_WID_RABOTY(Curr_Person) then
                    if ((Razr>=RazrFr) and (Razr<=RazrTo)) then
                    if (((Curr_person^.Automatic=Manual_Mode) and NeedBlocked) or
                         (Curr_person^.Automatic=Automatic_Mode)) then
                    if Pos('ПОВЫШ',UPPER_STRING(Curr_Person^.Dolg))=0 then
                 //   if not ExistDataIndInCn(Curr_Person) then
                       begin
                            DeleteIndPerson(Curr_Person,YearOf(DataZa),MonthOf(DataZa));
                            pFIBQuery.Transaction.StartTransaction;
                            S:='select RetVal from makeind(';
                            S:=S+IntToStr(Curr_Person^.Tabno)+',';
                            S:=S+IntToStr(MonthOf(DataZa))+',';
                            S:=S+IntToStr(YearOf(DataZa))+',';
                            S:=S+IntToStr(Curr_Person^.Gruppa)+',';
                            S:=S+IntToStr(NSRV)+')';
                            pFIBQuery.SQL.Clear;
                            pFIBQuery.SQL.Add(S);
                            try
                               FormWait.Show;
                               Application.ProcessMessages;
                               pFIBQuery.ExecQuery;
                               FormWait.Hide;
                               while not pFIBQuery.Eof do
                                     begin
                                           SummaInd  := pFIBQuery.Fields[0].AsFloat;
                                           if abs(SummaInd)>0.01 then
                                              AddToPerson(SummaInd);
                                           break;
                                           pFIBQuery.Next;
                                     end;
                            EXCEPT
                                   ShowMessage('Ошибка переасчета налогов для '+Curr_Person^.Fio);
                            end;
                            pFIBQuery.Transaction.Commit;

                       end;
                    Curr_Person:=Curr_Person^.Next;
                    Application.ProcessMessages;
               end;
              PutInf;
              while Head_Person<>Nil do Del_Person(Head_Person);
         END;
     LabelTimer.Hide;
     nsrv:=Nsrvt;
     mkflnm;
     GetInf(True);

end;

procedure TFormIndex.EditProcIndExit(Sender: TObject);
var S:String;
    A:Real;
    I:Integer;
begin
     S:=AllTrim(EditProcInd.Text);
     if length(S)=0 then
        begin
             ShowMessage('Не задан процент индексации');
             Exit;
        end;
     val(S,A,I);
     if (i<>0) then
        begin
             ShowMessage('Не верно задан процент индексации');
             Exit;
        end;
     if A<0.001 then
        begin
             ShowMessage('Не верно задан процент индексации');
             Exit;
        end;
     if a>100 then
        begin
             ShowMessage('Не верно задан процент индексации');
             Exit;
        end;
     if a>1 then a:=a/100;
     ProcInd:=a;
end;

procedure TFormIndex.BitBtn4Click(Sender: TObject);
var Razr:integer;
    okl:real;
    Curr_Person:Person_Ptr;
    NSRVT,NMES_t,i,j:integer;
    S:string;
    dev:textfile;
    procedure AddToPerson;
     var koef:real;
     begin
          if (razr<1) or (razr>25) then exit;
          Koef:=Get_Koef_Oklad_Person(Curr_Person);
          if (Koef<0.01) or (koef>1.001) then koef:=1;
          if Curr_Person^.Kategorija=1 then
             okl:=round(okl*1.15);
          if koef<0.999 then okl:=RoundTo(okl*koef,-2);
          Curr_Person^.Oklad:=okl;
          SetRazrjadPerson(CURR_PERSON,RAZR);
     end;

begin
     Exit;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     TimeStart   := Time;
     LabelTimer.Show;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     GaugePerson.MinValue :=  0;
     GaugePerson.MaxValue := 12;
     GaugePerson.Progress :=  1;

     NSRVT := NSRV;
     WHILE HEAD_PERSON<>NIL DO DEL_PERSON(HEAD_PERSON);
     nmes_t := nmes;

{     Установить параметры расчета индексации в FireBird}
     pFIBQuery.Transaction.StartTransaction;
     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              NSRV:=I;
              GaugePodr.Progress:=i;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              GaugePodr.Progress:=i;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              LabelPodr.ReFresh;
              LabelPodr.RePaint;
              GaugePerson.MinValue :=  0;
              GaugePerson.MaxValue := COUNT_PERSON;
              GaugePerson.Progress :=  1;
              Curr_Person:=Head_Person;
              J:=0;
              while (Curr_Person<>Nil) do
               begin
                    Inc(J);
                    GaugePerson.Progress:=J;
                    LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                    LabelPerson.ReFresh;
                    LabelPerson.RePaint;
                    if (pos('ПОВЫШ',Upper_String(Trim(Curr_Person^.Dolg)))=0) and
                       (pos('ПРЕМ',Upper_String(Trim(Curr_Person^.Dolg)))=0)  and
                       (pos('НАДБ',Upper_String(Trim(Curr_Person^.Dolg)))=0)  then
                       begin
                            S:='select first 1 razrdol,oklad from pr_get_razr where ';
                            S:=S+'tabno='+IntToStr(Curr_Person^.Tabno)+' and ';
                            S:=S+'w_place='+IntToStr(NSRV)+' and ';
                            S:=S+'shifr_kat='+IntToStr(CURR_PERSON^.kategorija)+' and ';
                            S:=S+'shifr_gru='+IntToStr(CURR_PERSON^.gruppa)+' and ';
                            S:=S+'w_r='+IntToStr(CURR_PERSON^.wid_raboty)+' and ';
                            S:=S+'dolg='''+trim(CURR_PERSON^.DOLG)+'''';
{
                            assignfile(dev,'t.txt');
                            rewrite(dev);
                            writeln(dev,s);
                            closefile(dev);
}
                            if pFIBQuery.Open then
                               pFIBQuery.Close;

                            pFIBQuery.SQL.Clear;
                            pFIBQuery.SQL.Add(S);
                            try
                               FormWait.Show;
                               Application.ProcessMessages;
                               pFIBQuery.ExecQuery;
                               FormWait.Hide;
                               while not pFIBQuery.Eof do
                                     begin
                                           Razr  := pFIBQuery.Fields[0].AsInteger;
                                           Okl   := pFIBQuery.Fields[1].AsFloat;
                                           if abs(Okl)>0.01 then
                                              AddToPerson;
                                           break;
                                          { FIB.pFIBQuery.Next;}
                                     end;
                            EXCEPT
                                   ShowMessage('Ошибка переасчета повышения для '+Curr_Person^.Fio);
                            end;

                       end;
                    Curr_Person:=Curr_Person^.Next;
                    Application.ProcessMessages;
               end;
              PutInf;
              while Head_Person<>Nil do Del_Person(Head_Person);
         END;
     if pFIBQuery.Transaction.Active then
        pFIBQuery.Transaction.Commit;
     LabelTimer.Hide;
     nsrv:=Nsrvt;
     mkflnm;
     GetInf(True);

end;

procedure TFormIndex.CreateListOfDoubleWorker;
(* Создание списка работников с разделенной основной работой*)
type PRec=^TRec;
     TRec=record
           tabno     : integer;
           fio       : string;
           wplace    : integer;
           shifrgru  : integer;
           koef      : real;
           dolg      : string;
           wplace1   : integer;
           shifrgru1 : integer;
           koef1     : real;
           dolg1     : string;
          end;

var rec:PRec;
    List:TList;
    NmesSave,NSRVSave:integer;
    i,j:integer;
    Curr_Person:Person_Ptr;
    Finded:boolean;
    FName:string;
    Dev:TextFile;
    SQLStmnt:string;
    KoefS,Koef1S:string;
begin
    nmessave:=nmes;
    nsrvsave:=nsrv;
    putinf;
    while (head_person<>nil) do del_person(head_person);
    List:=TList.Create;
    GaugePodr.MinValue   := 0;
    GaugePodr.MaxValue   := Count_Serv;
    GaugePodr.Progress   :=  0;
    Application.ProcessMessages;
    for i:=1 to count_serv do
        begin
             GaugePodr.Progress   :=  i;
             Application.ProcessMessages;
             nsrv:=i;
             mkflnm;
             if not fileexists(fninf) then continue;
             getinf(true);
             Curr_Person:=Head_Person;
             while (Curr_Person<>Nil) do
               begin
                    if Is_Osn_Wid_Raboty(Curr_Person)          then
                    if GetRazrjadPerson(Curr_Person)>0         then
                    if Curr_Person^.Oklad>0.01                 then
                    if GET_KOEF_OKLAD_PERSON(Curr_Person)<0.99 then
                    if GET_DOL_CODE(Curr_Person)<>4            then  // Плвышение не считать
                    if Curr_Person^.AUTOMATIC=AUTOMATIC_MODE   then
                       begin
                             finded:=false;
                             if List.Count>0 then
                                for j:=0 to List.Count-1 do
                                    if PRec(List.Items[j])^.tabno=Curr_Person^.TABNO then
                                       begin
                                            if Curr_Person^.Tabno=458 then
                                               Curr_Person^.Tabno:=458;
                                            if PRec(List.Items[j])^.wplace1>0 then
                                               Curr_Person^.Tabno:=Curr_Person^.Tabno;
                                            finded:=true;
                                            PRec(List.Items[j])^.wplace1   := nsrv;
                                            PRec(List.Items[j])^.shifrgru1 := Curr_Person^.GRUPPA;
                                            PRec(List.Items[j])^.koef1     := GET_KOEF_OKLAD_PERSON(Curr_Person);
                                            PRec(List.Items[j])^.Dolg1     := Curr_Person^.DOLG;
                                            break;
                                       end;
                             if not finded then
                                begin
                                      New(Rec);
                                      with Rec^ do
                                        begin
                                              tabno     := Curr_Person^.Tabno;
                                              Fio       := Curr_Person^.Fio;
                                              wplace    := NSRV;
                                              shifrgru  := Curr_Person^.Gruppa;
                                              koef      := GET_KOEF_OKLAD_PERSON(Curr_Person);
                                              Dolg      := Curr_Person^.DOLG;
                                              wplace1   := 0;
                                              shifrgru1 := 0;
                                              koef1     := 0;
                                              Dolg1     := '';

                                        end;
                                      List.Add(Rec);
                                end;
                       end;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
             while (head_person<>nil) do del_person(head_person);
        end;
    if List.Count>0 then
       begin
            Finded:=true;
            while Finded do
              begin
                    Finded:=false;
                    if List.Count>0 then
                       for j:=0 to List.Count-1 do
                           begin
                                 if PRec(List.Items[j])^.wplace1=0 then
                                    begin
                                         Finded:=true;
                                         List.Delete(j);
                                         break;
                                    end;
                           end
                    else break;
              end;
       end;
    if List.Count>0 then
       begin
             if pFIBQuery.Transaction.Active then
                pFIBQuery.Transaction.Commit;
             pFIBQuery.Transaction.StartTransaction;
             if pFIBQuery.Open then
                pFIBQuery.Close;
             SQLStmnt:='delete from TB_DBL_FOR_INDEX';
             pFIBQuery.SQL.Add(SQLStmnt);
             pFIBQuery.ExecQuery;
             pFIBQuery.Close;
             FName:=CDOC+'Dbl.txt';
             AssignFile(Dev,FName);
             Rewrite(Dev);
             for j:=0 to List.Count-1 do
                 begin
                       Rec:=PRec(List.Items[j]);
                       writeln(dev,Rec^.Tabno:6,Rec^.wplace:4,Rec^.shifrgru:4,Rec^.Koef:12:2,Rec^.wplace1:4,Rec^.shifrgru1:4,Rec^.Koef1:12:2);
                       Rec^.fio   := ReplQto2Q(Rec.Fio);
                       Rec^.Dolg  := ReplQto2Q(Rec.Dolg);
                       Rec^.Dolg1 := ReplQto2Q(Rec.Dolg1);
                       KoefS  := format('%12.2f',[Rec^.koef]);
                       KoefS  := ReplChar(KoefS,',','.');
                       Koef1S := format('%12.2f',[Rec^.koef1]);
                       Koef1S := ReplChar(Koef1S,',','.');
                       if length(rec^.dolg)=0  then Rec^.dolg  := ' ';
                       if length(rec^.dolg1)=0 then Rec^.dolg1 := ' ';
                       SQLStmnt:='insert into TB_DBL_FOR_INDEX values(';
                       SQLStmnt:=Trim(SQLSTmnt)+IntToStr(Rec^.Tabno)+',';
                       SQLStmnt:=Trim(SQLSTmnt)+''''+trim(Rec^.Fio)+''',';
                       SQLStmnt:=Trim(SQLSTmnt)+IntToStr(Rec^.wplace)+',';
                       SQLStmnt:=Trim(SQLSTmnt)+IntToStr(Rec^.shifrgru)+',';
                       SQLStmnt:=Trim(SQLSTmnt)+trim(KoefS)+',';
                       SQLStmnt:=Trim(SQLSTmnt)+''''+trim(Rec^.Dolg)+''',';
                       SQLStmnt:=Trim(SQLSTmnt)+IntToStr(Rec^.wplace1)+',';
                       SQLStmnt:=Trim(SQLSTmnt)+IntToStr(Rec^.shifrgru1)+',';
                       SQLStmnt:=Trim(SQLSTmnt)+trim(Koef1S)+',';
                       SQLStmnt:=Trim(SQLSTmnt)+''''+trim(Rec^.Dolg1)+''')';
                       pFIBQuery.SQL.Clear;
                       pFIBQuery.SQL.Add(SQLStmnt);
                       pFIBQuery.ExecQuery;
                       pFIBQuery.Close;
                 end;
             CloseFile(Dev);
             if pFIBQuery.Open then
                pFIBQuery.Close;
             if pFIBQuery.Transaction.Active then
                pFIBQuery.Transaction.Commit;

       end;

    GaugePodr.MinValue   := 0;
    GaugePodr.MaxValue   := Count_Serv;
    GaugePodr.Progress   :=  0;
    Application.ProcessMessages;
    nmes := nmessave;
    nsrv := nsrvsave;
    mkflnm;
    List.Free;
    getinf(true);
end;

procedure TFormIndex.BitBtn5Click(Sender: TObject);
begin
     CreateListOfDoubleWorker;
end;

procedure TFormIndex.BitBtn6Click(Sender: TObject);
begin
    Application.CreateForm(TFormIndProc, FormIndProc);
    FormIndProc.ShowModal;
end;

procedure TFormIndex.N2Click(Sender: TObject);
 var DataMax,DataBas:TDate;
     nmesSave,nsrvSave:integer;
     m,y,i:integer;
     yw,mw,dw:word;
     Curr_Person:Person_Ptr;
     Curr_Add:Add_Ptr;
     Maked:boolean;
     NmbOfDelete:integer;
begin
     if not YesNo('Проверить и удалить индексацию у тех, у кого базовая дата больше максимальной?') then
        exit;
     if pFIBQuery.Open then
        pFIBQuery.Close;
     if not pFIBQuery.Transaction.Active then
        pFIBQuery.Transaction.StartTransaction;
     pFIBQuery.SQL.Clear;
     pFIBQuery.SQL.Add('select max(datab) from tb_proc_ind_koe');
     pFIBQuery.ExecQuery;
     DataMax:=pFIBQuery.Fields[0].AsDate;
     pFIBQuery.Close;
     pFIBQuery.Transaction.Commit;
     nmessave:=nmes;
     nsrvsave:=nsrv;
     putinf;
     while (head_person<>nil) do del_person(head_person);
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  0;
     Application.ProcessMessages;
     NmbOfDelete:=0;
     for i:=1 to count_serv do
         begin
             GaugePodr.Progress   :=  i;
             Application.ProcessMessages;
             nsrv:=i;
             mkflnm;
             if not fileexists(fninf) then continue;
             getinf(true);
             Curr_Person:=Head_Person;
             Maked:=false;
             while (Curr_Person<>Nil) do
               begin
                    if GetBaseMonthYearPerson(Curr_Person, m , y) then
                       begin
                            yw:=y;
                            mw:=m;
                            dw:=1;
                            DataBas:=EnCodeDate(yw,mw,dw);
                            if (DataBas>DataMax) then
                               begin
                                     Curr_Add:=Curr_Person^.ADD;
                                     while (Curr_Add<>Nil) do
                                       begin
                                            if (Curr_Add^.Shifr=Index_Shifr) and
                                               (Curr_Add^.Period=NMES) then
                                               begin
                                                    if YesNo(IntToStr(Curr_Person^.Tabno)+' '+
                                                       Trim(Curr_Person^.fio)+' '+DateToStr(DataBas)+' '+
                                                       FloatToStr(Curr_Add^.Summa)+'. Удалить?') then
                                                       begin
                                                            Del_Add(Curr_Add,Curr_Person);
                                                            Maked:=true;
                                                            inc(NmbOfDelete);
                                                       end;
                                                    Break;
                                               end;
                                            Curr_Add:=Curr_Add^.NEXT;
                                       end;
                               end;    {DataMax}
                       end; {GetBaseData}
                    Curr_Person:=Curr_Person^.NEXT;
               end;
             if Maked then PutInf;
             while (head_person<>nil) do del_person(head_person);
         end;

    GaugePodr.MinValue   := 0;
    GaugePodr.MaxValue   := Count_Serv;
    GaugePodr.Progress   :=  0;
    Application.ProcessMessages;
    ShowMessage('Удалено '+IntToStr(NmbOfDelete)+' записей.');
    nmes := nmessave;
    nsrv := nsrvsave;
    mkflnm;
    getinf(true);



end;

procedure TFormIndex.N1Click(Sender: TObject);
 var DataMax,DataBas:TDate;
     nmesSave,nsrvSave:integer;
     m,y,i:integer;
     yw,mw,dw:word;
     Curr_Person:Person_Ptr;
     Curr_Add:Add_Ptr;
     Maked:boolean;
     NmbOfDelete:integer;
     DateZa:TDateTime;

begin

     if not YesNo('Удалить индексацию?') then
        exit;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     DateZa:=DateTimePickerDateZa.Date;
     nmessave:=nmes;
     nsrvsave:=nsrv;
     putinf;
     while (head_person<>nil) do del_person(head_person);
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  0;
     Application.ProcessMessages;
     NmbOfDelete:=0;
     for i:=1 to count_serv do
         begin
             GaugePodr.Progress   :=  i;
             Application.ProcessMessages;
             nsrv:=i;
             if not NameServList.IsSelected(NSRV) then continue;
             mkflnm;
             if not fileexists(fninf) then continue;
             getinf(true);
             Curr_Person:=Head_Person;
             Maked:=false;
             while (Curr_Person<>Nil) do
               begin
                    Curr_Add:=Curr_Person^.ADD;
                    while (Curr_Add<>Nil) do
                      begin
                           if (Curr_Add^.Shifr=Index_Shifr) and
                              (Curr_Add^.Period=MonthOf(DateZa)) then
                              begin
                                   Del_Add(Curr_Add,Curr_Person);
                                   Maked:=true;
                                   inc(NmbOfDelete);
                                   Break;
                               end;
                           Curr_Add:=Curr_Add^.NEXT;
                       end; {GetBaseData}
                    Curr_Person:=Curr_Person^.NEXT;
               end;
             if Maked then PutInf;
             while (head_person<>nil) do del_person(head_person);
         end;

    GaugePodr.MinValue   := 0;
    GaugePodr.MaxValue   := Count_Serv;
    GaugePodr.Progress   :=  0;
    Application.ProcessMessages;
    ShowMessage('Удалено '+IntToStr(NmbOfDelete)+' записей.');
    nmes := nmessave;
    nsrv := nsrvsave;
    mkflnm;
    getinf(true);

end;

procedure TFormIndex.BitBtn7Click(Sender: TObject);
begin
    Application.CreateForm(TFormSetBaseData, FormSetBaseData);
    FormSetBaseData.ShowModal;
end;

procedure TFormIndex.Button1Click(Sender: TObject);
var finished:boolean;
RazrTo,RazrFr,Razr:integer;
NSRVT,NMES_T,I,J:integer;
Curr_Person:Person_Ptr;
Curr_Add:Add_Ptr;
DataZa:TDateTime;

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

     RazrTo:=RazrToEdit.Value;
     RazrFr:=RazrFrEdit.Value;
     if (RazrTo<1) or (RazrTo>25) then
        begin
             ShowMessage('Не вверно задан разряд -по-');
             Exit;
        end;
     if (RazrFr<1) or (RazrFr>25) then
        begin
             ShowMessage('Не вверно задан разряд -с-');
             Exit;
        end;
     if (RazrFr>RazrTo) then
        begin
             ShowMessage('Не вверно заданы разряды');
             Exit;
        end;
     DataZa:=DateTimePickerDateZa.Date;

     TimeStart   := Time;
     LabelTimer.Show;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     GaugePerson.MinValue :=  0;
     GaugePerson.MaxValue := 12;
     GaugePerson.Progress :=  1;

     NSRVT := NSRV;
     WHILE HEAD_PERSON<>NIL DO DEL_PERSON(HEAD_PERSON);
     nmes_t := nmes;

{     Установить параметры расчета индексации в FireBird}

     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              NSRV:=I;
              GaugePodr.Progress:=i;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              GaugePodr.Progress:=i;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              LabelPodr.ReFresh;
              LabelPodr.RePaint;
              GaugePerson.MinValue :=  0;
              GaugePerson.MaxValue := COUNT_PERSON;
              GaugePerson.Progress :=  1;
              Curr_Person:=Head_Person;
              J:=0;
              while (Curr_Person<>Nil) do
               begin
                    Inc(J);
                    GaugePerson.Progress:=J;
                    LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                    LabelPerson.ReFresh;
                    LabelPerson.RePaint;
                    Razr:=GetRazrjadPerson(Curr_Person);
                    if GruppyList.IsSelected(Curr_Person^.Gruppa) then
//                    if Curr_Person^.Wid_Raboty=Osn_Wid_Raboty then
           //         if IS_OSN_WID_RABOTY(Curr_Person) then
                    if ((Razr>=RazrFr) and (Razr<=RazrTo)) then
                       begin
                            while true do
                                  begin
                                       Finished:=true;
                                       Curr_Add:=Curr_Person^.Add;
                                       While (Curr_Add<>Nil) do
                                        begin
                                             if Curr_Add^.Shifr=28 then
                                             if Curr_Add^.Year=YearOf(DataZa)-1990 then
                                             if Curr_Add^.Period=MonthOf(DataZa) then
                                                begin
                                                    Del_Add(Curr_Add,Curr_Person);
                                                    Finished:=false;
                                                    break;
                                                end;
                                            Curr_Add:=Curr_Add^.NEXT;
                                       end;
                           if Finished then break;
                    end;
                       end;
                    Curr_Person:=Curr_Person^.Next;
                    Application.ProcessMessages;
               end;
              PutInf;
              while Head_Person<>Nil do Del_Person(Head_Person);
         END;
     LabelTimer.Hide;
     nsrv:=Nsrvt;
     mkflnm;
     GetInf(True);

end;

procedure TFormIndex.MoveInd201207;
  var finished:boolean;
      RazrTo,RazrFr,Razr:integer;
      NSRVT,NMES_T,I,J:integer;
      Curr_Person:Person_Ptr;
      Curr_Add:Add_Ptr;
      DataZa:TDateTime;
      DataBase:TDateTime;
      SQLStmnt,SQLStmnt1:string;
      SummaInd:real;
      ShifrId:Integer;
      y,M:Integer;
      BaseY,BaseM:Integer;
      SummaFix:Real;
     procedure SetFixSumma(Curr_Person:PERSON_PTR;Summa:Real);
      var curr_cn:CN_PTR;
          Done:Boolean;
      begin
           while True do
            begin
                 Curr_cn:=curr_person.CN;
                 done:=true;
                 while (curr_cn<>nil)  do
                  begin
                       if curr_cn^.shifr=FIXSUMMAIND_SHIFR+LIMIT_CN_BASE then
                           begin
                                DEL_CN(curr_cn,curr_person);
                                done:=False;
                                break
                           end;
                       Curr_cn:=curr_cn^.Next;
                  end;
                  if done then break;
            end;
           MAKE_CN(curr_cn,curr_person);
           curr_cn^.SHIFR := FIXSUMMAIND_SHIFR+LIMIT_CN_BASE;
           curr_cn^.kod   := 100;
           curr_cn^.SUMMA := Summa;


      end;

 begin
     if not YesNo('Перенести данные индексации с 2012 07 ?') then Exit;
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

     RazrTo:=RazrToEdit.Value;
     RazrFr:=RazrFrEdit.Value;
     if (RazrTo<1) or (RazrTo>25) then
        begin
             ShowMessage('Не вверно задан разряд -по-');
             Exit;
        end;
     if (RazrFr<1) or (RazrFr>25) then
        begin
             ShowMessage('Не вверно задан разряд -с-');
             Exit;
        end;
     if (RazrFr>RazrTo) then
        begin
             ShowMessage('Не вверно заданы разряды');
             Exit;
        end;
     DataZa:=DateTimePickerDateZa.Date;
     DataZa:=StartOfTheMonth(DataZa);
     TimeStart   := Time;
     LabelTimer.Show;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     GaugePerson.MinValue :=  0;
     GaugePerson.MaxValue := 12;
     GaugePerson.Progress :=  1;

     NSRVT := NSRV;
     LDEL_PERSON;
     nmes_t := nmes;

{     Установить параметры расчета индексации в FireBird}

     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              NSRV:=I;
              GaugePodr.Progress:=i;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              if DOG_POD_PODRAZD(nsrv) then Continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              GaugePodr.Progress:=i;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              LabelPodr.ReFresh;
              LabelPodr.RePaint;
              GaugePerson.MinValue :=  0;
              GaugePerson.MaxValue := COUNT_PERSON;
              GaugePerson.Progress :=  1;
              Curr_Person:=Head_Person;
              J:=0;
              while (Curr_Person<>Nil) do
               begin
                    Inc(J);
                    GaugePerson.Progress:=J;
                    LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                    LabelPerson.ReFresh;
                    LabelPerson.RePaint;
                    Razr:=GetRazrjadPerson(Curr_Person);
                    if not GetBaseMonthYearPerson(Curr_Person,BaseM,BaseY) then
                    begin
                         BaseY:=CURRYEAR;
                         BaseM:=NMES;
                    end;
                    if (((BaseM<1) or (BaseM>12)) or
                         ((BaseY<2000) or (BaseY>hugeWrongYear))) then
                        begin
                             BaseY:=CURRYEAR;
                             BaseM:=NMES;
                        end;
                    DataBase:=EncodeDate(Word(BaseY),Word(BaseM),1);
                    if ( BaseY > 2012 ) then
                    if GruppyList.IsSelected(Curr_Person^.Gruppa) then
//                    if Curr_Person^.Wid_Raboty=Osn_Wid_Raboty then
                    if IS_OSN_WID_RABOTY(Curr_Person) then
             //       if Curr_Person^.AUTOMATIC=Automatic_Mode then
                    if ((Razr>=RazrFr) and (Razr<=RazrTo)) then
                    if (
                        (getSummaAddForPerson(Curr_Person)>0.001)
                        or
                         (NSRV in [5,9,31,42,43,59,72,122,124])
                        ) then
                //    if getSummaAddForPersonW(Curr_Person,Index_shifr,MonthOf(DataZa))<0.001 then
                       begin
                            if Curr_Person^.Tabno=3127 then
                               Curr_Person^.Tabno:=Curr_Person^.Tabno;
                            if Curr_Person^.gruppa<>1 then
                               Curr_Person^.Tabno:=Curr_Person^.Tabno;

                            while true do
                                  begin
                                       Finished:=true;
                                       Curr_Add:=Curr_Person^.Add;
                                       While (Curr_Add<>Nil) do
                                        begin
                                             if Curr_Add^.Shifr=Index_Shifr then
                                             if Curr_Add^.Year=YearOf(DataZa)-1990 then
                                             if (Curr_Add^.Period=MonthOf(DataZa)) then
                                             if (Curr_Add^.who=RecalcInd_Id) then
                                          //       (Curr_Add^.Period=MonthOf(DataZa)+1)) then
                                                begin
                                                    Del_Add(Curr_Add,Curr_Person);
                                                    Finished:=false;
                                                    break;
                                                end;
                                            Curr_Add:=Curr_Add^.NEXT;
                                        end;
                                       if Finished then break;
                                  end;
                            if Curr_Person^.Gruppa=1 then
                               SQLStmnt:='select ShifrId,summaindbud,yearza,monthza,summapostind from tb_ind_calc_12_7 where tabno='+IntToStr(Curr_Person^.Tabno)+' and ((movedbud<>1) or (movedbud is null)) and monthza='+IntToStr(MonthOf(DataZa))
                            else
                               SQLStmnt:='select ShifrId,summaindvne,yearza,monthza,summapostind from tb_ind_calc_12_7 where tabno='+IntToStr(Curr_Person^.Tabno)+' and ((movedvne<>1) or (movedvne is null)) and monthza='+IntToStr(MonthOf(DataZa));
                            pFIBQuery1.Transaction.StartTransaction;
                            pFIBQuery.SQL.Clear;
                            pFIBQuery.SQL.Add(SQLStmnt);
                            pFIBQuery.Transaction.StartTransaction;
                            pFIBQuery.ExecQuery;
                            while not pFIBQuery.Eof do
                              begin
                                   SummaInd := 0;
                                   ShifrId  := 0;
                                   ShifrId  := pFIBQuery.Fields[0].AsInteger;
                                   SummaInd := pFIBQuery.Fields[1].AsFloat;
                                   y        := pFIBQuery.Fields[2].AsInteger;
                                   m        := pFIBQuery.Fields[3].AsInteger;
                                   SummaFix := pFIBQuery.Fields[4].AsFloat;
                                   if ((ShifrId>0)     and
                                       (SummaInd>1.00) and
                                       (y=YearOf(DataZa)) and
//                                       ((m=7) or (m=8))) then
                                       (m=MonthOf(DataZa))) then
                                      begin
                                           Make_Add(Curr_Add,Curr_Person);
                                           Curr_Add^.SHIFR  := Index_Shifr;
                                           Curr_Add^.SUMMA  := SummaInd;
                                           Curr_Add^.FZP    := SummaInd;
                                           Curr_Add^.PERIOD := M;
                                           Curr_Add^.YEAR   := Y-1990;
                                           Curr_Add^.VYPLACHENO := GET_OUT;
                                           Curr_Add^.WHO    := RecalcInd_Id;

                                           if SummaFix>0.05 then
                                           if m=9 then
                                           if NMES=11 then
                                              SetFixSumma(Curr_Person,SummaFix);
                                      end;
                                     if Curr_Person^.GRUPPA=1 then
                                       FIB.pFIBDatabaseSal.Execute('update tb_ind_calc_12_7 set movedbud=1 where shifrid='+IntToStr(ShifrId))
                                     else
                                        FIB.pFIBDatabaseSal.Execute('update tb_ind_calc_12_7 set movedvne=1 where shifrid='+IntToStr(ShifrId));
                                     pFIBQuery.Next;
                              end;
                            pFIBQuery.Close;
                            pFIBQuery.Transaction.Commit;
                            if pFIBQuery1.Open then
                               begin
                                    pFIBQuery1.Close;
                                    pFIBQuery1.Transaction.Commit;
                               end;
                       end;
                    Curr_Person:=Curr_Person^.Next;
                    Application.ProcessMessages;
               end;
              PutInf;
              EMPTY_ALL_PERSON
         END;
     LabelTimer.Hide;
     nsrv:=Nsrvt;
     mkflnm;
     GetInf(True);


 end;

procedure TFormIndex.N2012071Click(Sender: TObject);
begin
     MoveInd201207;
end;

procedure TFormIndex.N3Click(Sender: TObject);
begin
     MoveInd201207;
end;

procedure TFormIndex.N20121Click(Sender: TObject);
begin
     FormBrowseInd:=TFormBrowseInd.CreateIndWnd(Self,CurrYear,NMES);
     FormBrowseInd.ShowModal;
end;

procedure TFormIndex.MoveIndToCnFor20140401;
  var finished:boolean;
      NSRVT,NMES_T,I,J:integer;
      Curr_Person:Person_Ptr;
      Curr_Cn:Cn_Ptr;
      DataZa:TDateTime;
      DataBase:TDateTime;
      SQLStmnt,SQLStmnt1:string;
      SummaInd:real;
      ShifrId:Integer;
      y,M:Integer;
      BaseY,BaseM:Integer;
      v : Variant;
 begin
     if NMES<>4 then
        begin
             ShowMessage('Перенести можно только в апреле 2014.');
             Exit;
        end;
     if not YesNo('Перенести индексацию на 01 04 2014 в F4 ?') then Exit;
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

     TimeStart   := Time;
     LabelTimer.Show;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     GaugePerson.MinValue :=  0;
     GaugePerson.MaxValue := 12;
     GaugePerson.Progress :=  1;

     NSRVT := NSRV;
     LDEL_PERSON;
     nmes_t := nmes;

{     Установить параметры расчета индексации в FireBird}

     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              NSRV:=I;
              GaugePodr.Progress:=i;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              GaugePodr.Progress:=i;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              LabelPodr.ReFresh;
              LabelPodr.RePaint;
              GaugePerson.MinValue :=  0;
              GaugePerson.MaxValue := COUNT_PERSON;
              GaugePerson.Progress :=  1;
              Curr_Person:=Head_Person;
              J:=0;
              while (Curr_Person<>Nil) do
               begin
                    Inc(J);
                    GaugePerson.Progress:=J;
                    LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                    LabelPerson.ReFresh;
                    LabelPerson.RePaint;
                    if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                    if IS_OSN_WID_RABOTY(Curr_Person) then
                    if Curr_Person^.AUTOMATIC=Automatic_Mode then
                       begin
                            if Curr_Person^.Tabno=1098 then
                               Curr_Person^.Tabno:=Curr_Person^.Tabno;
                            while true do
                                  begin
                                       Finished:=true;
                                       Curr_Cn:=Curr_Person^.Cn;
                                       While (Curr_Cn<>Nil) do
                                        begin
                                             if Curr_CN^.Shifr=FIXSUMMAIND_SHIFR+LIMIT_CN_BASE then
                                                begin
                                                    Del_CN(Curr_Cn,Curr_Person);
                                                    Finished:=false;
                                                    break;
                                                end;
                                            Curr_Cn:=Curr_Cn^.NEXT;
                                        end;
                                       if Finished then break;
                                  end;
                            if Curr_Person^.Gruppa=1 then
                               SQLStmnt:='select first 1 summabud from tb_i_03_2014 where tn='+IntToStr(Curr_Person^.Tabno)
                            else
                               SQLStmnt:='select first 1 summavne from tb_i_03_2014 where tn='+IntToStr(Curr_Person^.Tabno);
                            v := FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
                            if VarIsNumeric(v) then
                              SummaInd:=v;
                            if SummaInd>0.01 then
                              begin
                                   Make_CN(Curr_Cn,Curr_Person);
                                   Curr_Cn^.SHIFR  := FIXSUMMAIND_SHIFR+LIMIT_CN_BASE; ;
                                   Curr_Cn^.SUMMA  := SummaInd;
                                   Curr_Cn^.KOD    := 100;
                              end;
                       end;
                    Curr_Person:=Curr_Person^.Next;
                    Application.ProcessMessages;
               end;
              PutInf;
              Ldel_Person;
         END;
     LabelTimer.Hide;
     nsrv:=Nsrvt;
     mkflnm;
     GetInf(True);


 end;



procedure TFormIndex.n20140104Click(Sender: TObject);
begin
  //   MoveIndToCnFor20140401;
     MoveIndFr5To6WithMinus;
end;


procedure TFormIndex.MoveIndFr5To6WithMinus;
  const Ind56Id=78;
  var finished:boolean;
      NSRVT,NMES_T,I,J:integer;
      Curr_Person:Person_Ptr;
      Curr_Add:Add_Ptr;
      DataZa:TDateTime;
      DataBase:TDateTime;
      SQLStmnt,GUID:string;
      SummaInd:real;
      y,M:Integer;
      v : Variant;
 begin
     if NMES<>6 then
        begin
             ShowMessage('Перенести можно только в июне 2014.');
             Exit;
        end;
     if not YesNo('Перенести индексацию за май с минусом в июнь ?') then Exit;
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

     TimeStart   := Time;
     LabelTimer.Show;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     GaugePerson.MinValue :=  0;
     GaugePerson.MaxValue := 12;
     GaugePerson.Progress :=  1;

     NSRVT := NSRV;
     LDEL_PERSON;
     nmes_t := nmes;

{     Установить параметры расчета индексации в FireBird}

     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              NSRV:=I;
              GaugePodr.Progress:=i;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              GaugePodr.Progress:=i;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              LabelPodr.ReFresh;
              LabelPodr.RePaint;
              GaugePerson.MinValue :=  0;
              GaugePerson.MaxValue := COUNT_PERSON;
              GaugePerson.Progress :=  1;
              Curr_Person:=Head_Person;
              J:=0;
              while (Curr_Person<>Nil) do
               begin
                    Inc(J);
                    GaugePerson.Progress:=J;
                    LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                    LabelPerson.ReFresh;
                    LabelPerson.RePaint;
                    if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                    if IS_OSN_WID_RABOTY(Curr_Person) then
                //   if Curr_Person^.AUTOMATIC=Automatic_Mode then
                       begin
                            if Curr_Person^.Tabno=1098 then
                               Curr_Person^.Tabno:=Curr_Person^.Tabno;
                            GUID:=Trim(GetGUIDPersonToString(Curr_Person));
                            if Length(GUID)>0 then
                               begin
                                    SummaInd:=0;
                                    SQLStmnt:='select a.summa  from fadd a';
                                    SQLSTmnt:=Trim(SQLStmnt)+' join person b on a.shifridperson=b.shifrid';
                                    SQLSTmnt:=Trim(SQLStmnt)+' where ';
                                    SQLSTmnt:=Trim(SQLStmnt)+' (select guid from pr_getguid(b.shifrid, 0))='''+GUID+'''';
                                    SQLSTmnt:=Trim(SQLStmnt)+'   and a.month_vy=5';
                                    SQLSTmnt:=Trim(SQLStmnt)+'   and a.year_vy=2014';
                                    SQLSTmnt:=Trim(SQLStmnt)+'   and a.month_za=5';
                                    SQLSTmnt:=Trim(SQLStmnt)+'   and a.year_za=2014';
                                    SQLSTmnt:=Trim(SQLStmnt)+'   and a.shifrsta=28';
                                    v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
                                    if VarIsNumeric(v) then
                                       begin
                                            SummaInd:=v;
                                            if SummaInd>0.01 then
                                               begin
                                                    Make_Add(Curr_Add,Curr_Person);
                                                    Curr_Add^.SHIFR  := INDEX_SHIFR;
                                                    Curr_Add^.SUMMA  := -SummaInd;
                                                    Curr_Add^.PERIOD := 5;
                                                    Curr_Add^.Year   := 2014-1990;
                                                    Curr_Add^.Who    := Ind56Id;
                                                    Curr_Add^.VYPLACHENO := GET_OUT;
                                               end;
                                       end;
                               end;
                       end;
                    Curr_Person:=Curr_Person^.Next;
                    Application.ProcessMessages;
               end;
              PutInf;
              Ldel_Person;
         END;
     LabelTimer.Hide;
     nsrv:=Nsrvt;
     mkflnm;
     GetInf(True);


 end;




procedure TFormIndex.N20151Click(Sender: TObject);
begin
      mkindex112015;
end;

procedure TFormIndex.mkindex112015;
 var nmestmp:integer;
     nsrvtmp:Integer;
     i_nsrv,i_person:integer;
     curr_person:PERSON_PTR;
     needPut:Boolean;
    procedure DeCodePerson;
     var curr_cn:cn_ptr;
         curr_add:ADD_PTR;
         summa:Real;
     begin
          curr_cn:=curr_person.cn;
          while (curr_cn<>nil) do
           begin
                if curr_cn^.SHIFR=FIXSUMMAIND_SHIFR+limit_cn_base then
                   begin
                        summa:=R10(CURR_cn^.SUMMA*work_day(1,31,curr_person)/w_day_5[11]);
                        if getSummaAddForPersonW(curr_person,INDEX_SHIFR,11)<0.01 then
                        if (summa>0.01) then
                           begin
                                MAKE_ADD(curr_add,Curr_person);
                                curr_add^.shifr:=index_shifr;
                                curr_add^.Period:=11;
                                curr_add^.Year:=2015-1990;
                                curr_add^.summa:=R10(summa);
                                curr_add^.fzp:=curr_add^.summa;
                                curr_add^.who:=91;
                                PODOH_PERSON(CURR_PERSON,2,1);
                                needPut:=True;
                           end;
                        Break;
                   end;
                curr_cn:=Curr_cn^.Next;
           end;
     end;
 begin

     if not ((CurrYear=2015) and (nmes=11)) then
        begin
             ShowMessage('Запускается только в ноябре 2015');
             Exit;
        end;

     if not yesNo('Выполнить индексацию в 11 2015?') THEN
        Exit;

     nmesTmp:=nmes;
     nsrvTmp:=NSRV;
     putinF;
     LDEL_PERSON;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     for i_nsrv:=1 to Count_Serv do
      begin
           GaugePodr.Progress:=i_nsrv;
           LabelPodr.Caption:=Name_Serv(i_nsrv);
           Application.ProcessMessages;
           nsrv:=i_nsrv;
           MKFLNM;
           if not FILEEXIST(FNINF) then Continue;
           needPut:=false;
           GETINF(true);
           GaugePerson.MinValue :=  0;
           GaugePerson.MaxValue := count_person;
           GaugePerson.Progress :=  1;
           i_person:=0;
           curr_Person:=head_person;
           while (curr_person<>nil) do
             begin
                  inc(i_person);
                  GaugePerson.Progress :=  i_person;
                  LabelPerson.Caption:=IntToStr(Curr_person^.tabno)+' '+trim(Curr_Person^.fio);
                  Application.ProcessMessages;
                  DeCodePerson;
                  Curr_person:=Curr_Person^.NEXT;
             end;
           if needPut then
              PUTINF;
           LDEL_PERSON;

      end;
     nmes:=nmesTmp;
     NSRV:=nsrvTmp;
     mkflnm;
     GETINF(true);


 end;

procedure TFormIndex.mkPrem112015;
 var nmestmp:integer;
     nsrvtmp:Integer;
     i_nsrv,i_person:integer;
     curr_person:PERSON_PTR;
     needPut:Boolean;
    procedure DeCodePerson;
     var curr_cn:cn_ptr;
         curr_add:ADD_PTR;
         summa:Real;
     begin
          if getSummaAddForPerson(curr_person)<0.01 then Exit;
          if curr_person^.AUTOMATIC=manual_mode then Exit;
          if not IS_OSN_WID_RABOTY(Curr_Person) then Exit;
          if Curr_Person^.oklad<1 then Exit;
          MAKE_ADD(curr_add,Curr_person);
          curr_add^.shifr:=2;
          curr_add^.Period:=11;
          curr_add^.Year:=2015-1990;
          curr_add^.summa:=R10(Curr_Person^.oklad);
          curr_add^.fzp:=curr_add^.summa;
          curr_add^.who:=91;
          CALC_NAUD_PERSON(CURR_PERSON,31);
          needPut:=True;
     end;
 begin

     if not ((CurrYear=2015) and (nmes=11)) then
        begin
             ShowMessage('Запускается только в ноябре 2015');
             Exit;
        end;
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

  //   if not yesNo('Выполнить индексацию в 11 2015?') THEN
  //      Exit;

     nmesTmp:=nmes;
     nsrvTmp:=NSRV;
     putinF;
     LDEL_PERSON;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   := 1;
     for i_nsrv:=1 to Count_Serv do
      begin
           GaugePodr.Progress:=i_nsrv;
           LabelPodr.Caption:=Name_Serv(i_nsrv);
           Application.ProcessMessages;
           nsrv:=i_nsrv;
           if not NameServList.IsSelected(NSRV) then continue;
           if STORONNEE_PODRAZD(nsrv) then continue;
           if RECENZENT_PODRAZD(nsrv) then continue;
           NameServList.ClearSelected(NSRV);
           MKFLNM;
           if not FILEEXIST(FNINF) then Continue;
           needPut:=false;
           GETINF(true);
           GaugePerson.MinValue :=  0;
           GaugePerson.MaxValue := count_person;
           GaugePerson.Progress :=  1;
           i_person:=0;
           curr_Person:=head_person;
           while (curr_person<>nil) do
             begin
                  inc(i_person);
                  GaugePerson.Progress :=  i_person;
                  LabelPerson.Caption:=IntToStr(Curr_person^.tabno)+' '+trim(Curr_Person^.fio);
                  Application.ProcessMessages;
                  if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                     DeCodePerson;
                  Curr_person:=Curr_Person^.NEXT;
             end;
           if needPut then
              PUTINF;
           LDEL_PERSON;

      end;
     nmes:=nmesTmp;
     NSRV:=nsrvTmp;
     mkflnm;
     GETINF(true);


 end;

procedure TFormIndex.N20152Click(Sender: TObject);
begin
//     if YesNo('Начислить всем премию в размере оклада?') then
     if YesNo('Перенести перерасчет в 12 2015?') then
//        mkPrem112015;
        MoveRclc122015 ;
end;


procedure TFormIndex.MoveRclc122015;
  var finished:boolean;
      RazrTo,RazrFr,Razr:integer;
      NSRVT,NMES_T,I,J:integer;
      Curr_Person:Person_Ptr;
      Curr_Add:Add_Ptr;
      DataZa:TDateTime;
      DataBase:TDateTime;
      SQLStmnt,SQLStmnt1:string;
      SummaInd:real;
      ShifrId:Integer;
      y,M:Integer;
      BaseY,BaseM:Integer;
      SummaFix:Real;
      v:Variant;
      needput:Boolean;
 begin
     if not YesNo('Перенести снятие повышения в 12 2015 ?') then Exit;
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

     TimeStart   := Time;
     LabelTimer.Show;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     GaugePerson.MinValue :=  0;
     GaugePerson.MaxValue := 12;
     GaugePerson.Progress :=  1;

     NSRVT := NSRV;
     LDEL_PERSON;
     nmes_t := nmes;

{     Установить параметры расчета индексации в FireBird}

     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              needput:=false;
              NSRV:=I;
              GaugePodr.Progress:=i;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              if DOG_POD_PODRAZD(nsrv) then Continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              GaugePodr.Progress:=i;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              LabelPodr.ReFresh;
              LabelPodr.RePaint;
              GaugePerson.MinValue :=  0;
              GaugePerson.MaxValue := COUNT_PERSON;
              GaugePerson.Progress :=  1;
              Curr_Person:=Head_Person;
              J:=0;
              while (Curr_Person<>Nil) do
               begin
                    Inc(J);
                    GaugePerson.Progress:=J;
                    LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                    LabelPerson.ReFresh;
                    LabelPerson.RePaint;
                //    if getSummaAddForPersonW(Curr_Person,Index_shifr,MonthOf(DataZa))<0.001 then
                       begin
                            if Curr_Person^.Tabno=3127 then
                               Curr_Person^.Tabno:=Curr_Person^.Tabno;
                            if Curr_Person^.gruppa<>1 then
                               Curr_Person^.Tabno:=Curr_Person^.Tabno;

                            SQLStmnt:='select a.razn from tb_new_okl_12_2015 a where a.tabno='+intToStr(Curr_person^.TABNO)+' and trim(a.guid)=trim('''+GetGUIDPersonToString(Curr_Person)+''') and coalesce(prem,0)>coalesce(razn,0)';
                            v:=FIB.pFIBDatabaseSal.QueryValue(SqlStmnt,0);
                            if  VarIsNumeric(v) then
                                begin
                                     SummaInd:=v;
                                     if SummaInd>1 then
                                        begin
                                           Make_Add(Curr_Add,Curr_Person);
                                           Curr_Add^.SHIFR  := PerersZaProshlPeriody;
                                           Curr_Add^.SUMMA  := -SummaInd;
                                           Curr_Add^.FZP    := -SummaInd;
                                           Curr_Add^.PERIOD := 11;
                                           Curr_Add^.YEAR   := 2015-1990;
                                           Curr_Add^.VYPLACHENO := GET_OUT;
                                           needput:=True;
                                        end;
                                end;
                       end;
                    Curr_Person:=Curr_Person^.Next;
                    Application.ProcessMessages;
               end;
              if needput then PutInf;
              while Head_Person<>Nil do Del_Person(Head_Person);
         END;
     LabelTimer.Hide;
     nsrv:=Nsrvt;
     mkflnm;
     GetInf(True);


 end;

procedure TFormIndex.FormIndAfterRclc122015;
  var finished:boolean;
      RazrTo,RazrFr,Razr:integer;
      NSRVT,NMES_T,I,J:integer;
      Curr_Person:Person_Ptr;
      Curr_Add:Add_Ptr;
      DataZa:TDateTime;
      DataBase:TDateTime;
      SQLStmnt,SQLStmnt1:string;
      SummaInd:real;
      ShifrId:Integer;
      y,M:Integer;
      BaseY,BaseM:Integer;
      SummaFix:Real;
      v:Variant;
      needput:Boolean;
      newSummaRazn:Boolean;
      SummaRazn:Real;
   function isInd:real;
    var retVal:REaL;
        Curr_Cn:CN_PTR;
    begin
         retVal:=-1;
         Curr_cn:=Curr_Person^.CN;
         while (Curr_Cn<>nil) do
           begin
                if curr_cn^.shifr=FIXSUMMAIND_SHIFR+limit_cn_base then
                   begin
                        retVal:=Curr_cn^.SUMMA;
                        Break;
                   end;
                Curr_cn:=curr_cn^.Next;
           end;
         isInd:=retVal;
    end;
   function setInd(Summa:real):real;
    var retVal:REaL;
        Curr_Cn:CN_PTR;
    begin
         retVal:=-1;
         Curr_cn:=Curr_Person^.CN;
         while (Curr_Cn<>nil) do
           begin
                if curr_cn^.shifr=FIXSUMMAIND_SHIFR+limit_cn_base then
                   begin
                        Curr_cn^.SUMMA:=Summa;;
                        Break;
                   end;
                Curr_cn:=curr_cn^.Next;
           end;
        setInd:=retVal;
    end;
   function DeleteInd:boolean;
    var retVal:boolean;
        Curr_Cn:CN_PTR;
    begin
         retVal:=False;
         Curr_cn:=Curr_Person^.CN;
         while (Curr_Cn<>nil) do
           begin
                if curr_cn^.shifr=FIXSUMMAIND_SHIFR+limit_cn_base then
                   begin
                        DEL_CN(Curr_Cn,Curr_Person);
                        retVal:=True;
                        Break;
                   end;
                Curr_cn:=curr_cn^.Next;
           end;
         DeleteInd:=retVal;
    end;
   function getSummaPere:real;
    var retVal:REaL;
        Curr_Add:Add_PTR;
    begin
         retVal:=-1;
         Curr_Add:=Curr_Person^.Add;
         while (Curr_Add<>nil) do
           begin
                if curr_Add^.shifr=PerersZaProshlPeriody then
                if Curr_Add^.period=11 then
                   begin
                        retVal:=-Curr_Add^.SUMMA;
                        Break;
                   end;
                Curr_Add:=curr_Add^.Next;
           end;
         getSummaPere:=retVal;
    end;
 begin
     if not YesNo('Подготовить инд в 12 2015 ?') then Exit;
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

     TimeStart   := Time;
     LabelTimer.Show;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     GaugePerson.MinValue :=  0;
     GaugePerson.MaxValue := 12;
     GaugePerson.Progress :=  1;

     NSRVT := NSRV;
     LDEL_PERSON;
     nmes_t := nmes;

{     Установить параметры расчета индексации в FireBird}

     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              needput:=false;
              NSRV:=I;
              GaugePodr.Progress:=i;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              if DOG_POD_PODRAZD(nsrv) then Continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              GaugePodr.Progress:=i;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              LabelPodr.ReFresh;
              LabelPodr.RePaint;
              GaugePerson.MinValue :=  0;
              GaugePerson.MaxValue := COUNT_PERSON;
              GaugePerson.Progress :=  1;
              Curr_Person:=Head_Person;
              J:=0;
              while (Curr_Person<>Nil) do
               begin
                    Inc(J);
                    GaugePerson.Progress:=J;
                    LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                    LabelPerson.ReFresh;
                    LabelPerson.RePaint;
                    newSummaRazn:=False;
                    SummaInd:=isInd;
                    if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                    if Curr_Person.Automatic=Automatic_Mode then
                    if (SummaInd>1.0) then
                //    if getSummaAddForPersonW(Curr_Person,Index_shifr,MonthOf(DataZa))<0.001 then
                       begin
                            if Curr_Person^.Tabno=3127 then
                               Curr_Person^.Tabno:=Curr_Person^.Tabno;
                            if Curr_Person^.gruppa<>1 then
                               Curr_Person^.Tabno:=Curr_Person^.Tabno;
                            SummaRazn:=getSummaPere;
                            if SummaRazn<-0.05 then
                               begin
                                    SQLStmnt:='select a.razn from tb_new_okl_12_2015 a where a.tabno='+intToStr(Curr_person^.TABNO)+' and trim(a.guid)=trim('''+GetGUIDPersonToString(Curr_Person)+''') and coalesce(prem,0)>coalesce(razn,0)';
                                    v:=FIB.pFIBDatabaseSal.QueryValue(SqlStmnt,0);
                                    if  VarIsNumeric(v) then
                                        begin
                                             SummaRazn:=v;
                                             newSummaRazn:=True;
                                        end;
                               end;
                            if SummaRazn>0.01 then
                               begin
                                    needput:=True;
                                    SummaInd:=SummaInd-SummaRazn;
                                    if SummaInd<1 then
                                       DeleteInd
                                    else
                                       setInd(SummaInd);
                                     if ((SummaRazn>0.05) and (newSummaRazn)) then
                                        begin
                                           Make_Add(Curr_Add,Curr_Person);
                                           Curr_Add^.SHIFR  := PerersZaProshlPeriody;
                                           Curr_Add^.SUMMA  := -SummaRazn;
                                           Curr_Add^.FZP    := -SummaRazn;
                                           Curr_Add^.PERIOD := 11;
                                           Curr_Add^.YEAR   := 2015-1990;
                                           Curr_Add^.VYPLACHENO := GET_OUT;
                                        end;
                                        end;
                       end;
                    Curr_Person:=Curr_Person^.Next;
                    Application.ProcessMessages;
               end;
              if needput then PutInf;
              while Head_Person<>Nil do Del_Person(Head_Person);
         END;
     LabelTimer.Hide;
     nsrv:=Nsrvt;
     mkflnm;
     GetInf(True);


 end;

procedure TFormIndex.FormIndFromCNIn122015;
  var finished:boolean;
      RazrTo,RazrFr,Razr:integer;
      NSRVT,NMES_T,I,J:integer;
      Curr_Person:Person_Ptr;
      Curr_Add:Add_Ptr;
      DataZa:TDateTime;
      DataBase:TDateTime;
      SQLStmnt,SQLStmnt1:string;
      SummaInd:real;
      ShifrId:Integer;
      y,M:Integer;
      BaseY,BaseM:Integer;
      SummaFix:Real;
      v:Variant;
      needput:Boolean;
      newSummaRazn:Boolean;
      SummaRazn:Real;
      workD:Real;
      calendDay:Real;
   function isInd:real;
    var retVal:REaL;
        Curr_Cn:CN_PTR;
    begin
         retVal:=-1;
         Curr_cn:=Curr_Person^.CN;
         while (Curr_Cn<>nil) do
           begin
                if curr_cn^.shifr=FIXSUMMAIND_SHIFR+limit_cn_base then
                   begin
                        retVal:=Curr_cn^.SUMMA;
                        Break;
                   end;
                Curr_cn:=curr_cn^.Next;
           end;
         isInd:=retVal;
    end;
 begin
     if not YesNo('Перенести инд в 12 2015 ?') then Exit;
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

     TimeStart   := Time;
     LabelTimer.Show;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     GaugePerson.MinValue :=  0;
     GaugePerson.MaxValue := 12;
     GaugePerson.Progress :=  1;

     NSRVT := NSRV;
     LDEL_PERSON;
     nmes_t := nmes;
     calendDay:=23.00;
{     Установить параметры расчета индексации в FireBird}

     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              needput:=false;
              NSRV:=I;
              GaugePodr.Progress:=i;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              if DOG_POD_PODRAZD(nsrv) then Continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              GaugePodr.Progress:=i;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              LabelPodr.ReFresh;
              LabelPodr.RePaint;
              GaugePerson.MinValue :=  0;
              GaugePerson.MaxValue := COUNT_PERSON;
              GaugePerson.Progress :=  1;
              Curr_Person:=Head_Person;
              J:=0;
              while (Curr_Person<>Nil) do
               begin
                    Inc(J);
                    GaugePerson.Progress:=J;
                    LabelPerson.Caption:=IntToStr(Curr_Person^.Tabno)+' '+
                                         AllTrim(Curr_Person^.FIO)   +' '+
                                         AllTrim(Curr_Person^.Dolg);
                    LabelPerson.ReFresh;
                    LabelPerson.RePaint;
                    newSummaRazn:=False;
                    SummaInd:=isInd;
                    if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                    if Curr_Person.Automatic=Automatic_Mode then
                    if (SummaInd>1.0) then
                       begin
                //    if getSummaAddForPersonW(Curr_Person,Index_shifr,MonthOf(DataZa))<0.001 then
                            if Curr_Person^.Tabno=3127 then
                               Curr_Person^.Tabno:=Curr_Person^.Tabno;
                            if Curr_Person^.gruppa<>1 then
                               Curr_Person^.Tabno:=Curr_Person^.Tabno;
                            workD:=WORK_DAY(1,31,curr_person);
                            if workD>calendDay then WorkD:=calendDay;
                            SummaRazn:=R10(SummaInd*WorkD/calendDay);
                            if SummaRazn>0.05 then
                               begin
                                    needput:=True;
                                    Make_Add(Curr_Add,Curr_Person);
                                    Curr_Add^.SHIFR  := INDEX_SHIFR;
                                    Curr_Add^.SUMMA  := SummaRazn;
                                    Curr_Add^.FZP    := SummaRazn;
                                    Curr_Add^.PERIOD := 12;
                                    Curr_Add^.YEAR   := 2015-1990;
                                    Curr_Add^.VYPLACHENO := GET_OUT;
                                    Curr_Add^.WHO:=51;
                               end;
                       end;       
                    Curr_Person:=Curr_Person^.Next;
                    Application.ProcessMessages;
               end;
              if needput then PutInf;
              while Head_Person<>Nil do Del_Person(Head_Person);
         END;
     LabelTimer.Hide;
     nsrv:=Nsrvt;
     mkflnm;
     GetInf(True);


 end;

procedure TFormIndex.N1220151Click(Sender: TObject);
begin
     FormIndAfterRclc122015;
end;

procedure TFormIndex.N122015N1Click(Sender: TObject);
begin
     FormIndFromCNIn122015;
end;

procedure TFormIndex.delConstIndFromCN;
 var nmestmp:integer;
     nsrvtmp:Integer;
     i_nsrv,i_person:integer;
     curr_person:PERSON_PTR;
     needPut:Boolean;
    procedure DeCodePerson;
     var curr_cn:cn_ptr;
         summa:Real;
         Finded:boolean;
     begin
          curr_cn:=curr_person.cn;
          finded:=False;
          while (curr_cn<>nil) do
           begin
                if curr_cn^.SHIFR=FIXSUMMAIND_SHIFR+limit_cn_base then
                   begin
                        finded:=True;
                        DEL_CN(curr_cn,curr_person);
                        needput:=True;
                        break;
                   end;
                curr_cn:=Curr_cn^.Next;
           end;
     end;
 begin

     if not ((CurrYear=2016) and (nmes=02)) then
        begin
             ShowMessage('Запускается только в феврале 2016');
             Exit;
        end;

     if not yesNo('Удалить фиксированные суммы индексации из F4?') THEN
        Exit;

     nmesTmp:=nmes;
     nsrvTmp:=NSRV;
     putinF;
     LDEL_PERSON;
     GaugePodr.MinValue   := 0;
     GaugePodr.MaxValue   := Count_Serv;
     GaugePodr.Progress   :=  1;
     for i_nsrv:=1 to Count_Serv do
      begin
           GaugePodr.Progress:=i_nsrv;
           LabelPodr.Caption:=Name_Serv(i_nsrv);
           Application.ProcessMessages;
           nsrv:=i_nsrv;
           MKFLNM;
           if not FILEEXIST(FNINF) then Continue;
           needPut:=false;
           GETINF(true);
           GaugePerson.MinValue :=  0;
           GaugePerson.MaxValue := count_person;
           GaugePerson.Progress :=  1;
           i_person:=0;
           curr_Person:=head_person;
           while (curr_person<>nil) do
             begin
                  inc(i_person);
                  GaugePerson.Progress :=  i_person;
                  LabelPerson.Caption:=IntToStr(Curr_person^.tabno)+' '+trim(Curr_Person^.fio);
                  Application.ProcessMessages;
                  DeCodePerson;
                  Curr_person:=Curr_Person^.NEXT;
             end;
           if needPut then
              PUTINF;
           LDEL_PERSON;

      end;
     nmes:=nmesTmp;
     NSRV:=nsrvTmp;
     mkflnm;
     GETINF(true);


 end;


procedure TFormIndex.F41Click(Sender: TObject);
begin
     delConstIndFromCN;
end;


procedure TFormIndex.MakeInd_10_2017;
var DataZa:TDateTime;
    NSRVT,NMES_T:Integer;
    S,dates:String;
    SummaInd:Real;
    Curr_Person:Person_Ptr;
    I,J,k:Integer;
    Razr,RazrFr,RazrTo : integer;
    NeedBlocked   : boolean;

begin


     if (ProcInd<0.001) or (ProcInd>1) then
        begin
             ShowMessage('Не вверно задан процент индексации');
             Exit;
        end;
     RazrTo:=1;
     RazrFr:=24;
     if not YesNo('Текущие данные ро зарплате перенесы в БД?') then
        exit;

     NeedBlocked:=CheckBox1.Checked;
     DataZa:=DateTimePickerDateZa.Date;


{     Установить параметры расчета индексации в FireBird}
     FormWait.Show;
     Application.processMessages;
     dates:=intToStr(yearOf(DataZa))+'-'+intToStr(monthOf(dataZa))+'-01';
     s:='delete from tb_ind_calc_12_7 where yearza='+intToStr(yearOf(dataZa))+' and monthza='+intToStr(monthof(dataZa));
     SQLExecute(S);
     S:='select max(shifrid) from tb_ind_calc_12_7';
     i:=SQLQueryValue(S);
     s:='ALTER SEQUENCE G_I_2012 RESTART WITH '+intToStr(i+1);
     SQLExecute(S);
     S:='select first 1 progmin from sslimity where datefr<='''+dates+''' order by datefr desc';
     LimitSumma:=SQLQueryValue(S);
     S:='delete from tb_par_index where MonthZa='+IntToStr(MonthOf(DataZa))+' and YearZA='+IntToStr(YearOf(DataZa));
     SQLExecute(S);
     S:='insert into tb_par_index (monthza,yearza,procind,limitsumma,razrfr,razrto,needblocked) values(';
     S:=S+IntToStr(MonthOf(DataZa))+',';
     S:=S+IntToStr(YearOf(DataZa))+',';
     S:=S+FormatFloatPointL(ProcInd,4)+',';
     S:=S+FormatFloatPoint(limitsumma)+',';
     S:=S+IntToStr(RazrFr)+',';
     S:=S+IntToStr(RazrTo)+',';
     if NeedBlocked then
        S:=S+'1)'
     else
        S:=S+'0)';
     SQLExecute(S);
     S:='select first 1 k from PR_MK_IND_201706_ALL('+intToStr(yearOf(dataza))+','+intToStr(monthof(dataZa))+')';
     k:=SQLQueryValue(S);
     S:='select count(*) from tb_ind_calc_12_7 a where a.yearza='+intToStr(yearOf(Dataza))+' and a.monthza='+intToStr(monthOf(dataZa))+' and (coalesce(summaindbud,0)+coalesce(summaindvne,0))>1.0';
     k:=SQLQueryValue(S);

     FormWait.hide;
     Application.processMessages;
     if k>0 then
        showMessage('Индексация начислена '+intToStr(k)+' сотрудникам.'+^M+' Выполните перенос сумм индексации!')
     else
        showMessage('Индексация не начислена.');

end;

end.
