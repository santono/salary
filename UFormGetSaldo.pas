unit UFormGetSaldo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFormGetSaldo = class(TForm)
    ProgressBarPrsn: TProgressBar;
    ProgressBarPdr: TProgressBar;
    LabelFio: TLabel;
    LabelCnt: TLabel;
    LabelPdr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dtWanted: TDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    WantedDate:tDateTime;
    WantedY,WantedM:Integer;
    procedure ImportPodr(var needPut: boolean);
  public
    { Public declarations }
  end;

var
  FormGetSaldo: TFormGetSaldo;

implementation
   uses UFormSelPKG,ScrIO,ScrDEF,ScrNalog,ScrLists,ScrUtil,uFIBModule,
        uFormWait,dateUtils;
{$R *.dfm}




procedure TFormGetSaldo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormGetSaldo.FormCreate(Sender: TObject);
begin
      LabelFio.Caption:='';
      LabelCnt.Caption:='';
      LabelPdr.Caption:='';
      Caption:='Импорт сальдо с прошлого периода';
      WantedY:=CurrYear;
      WantedM:=nmes-1;
      if WantedM<1 then
        begin
             WantedM:=12;
             Dec(WantedY);
        end;
      WantedDate:=EncodeDate(WantedY,WantedM,1);
      dtWanted.Date:=WantedDate;
end;

procedure TFormGetSaldo.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;


procedure TFormGetSaldo.BitBtn1Click(Sender: TObject);
 var
    nsrvSav,nmesSav:integer;
    i,j:integer;
    needPut:Boolean;
begin
     if (NMES<>Flow_Month) then
        begin
             ShowMessage('Импорт возмжен только в текущем месяце.');
             Exit;
        end;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

     nsrvSav:=NSRV;
     nmesSav:=NMES;
     wantedDate:=dtWanted.Date;
     WantedY:=yearOf(wantedDate);
     WantedM:=monthOf(wantedDate);
     if (WantedY<2014)  then
        begin
             ShowMessage('Импорт возможет только с 2014 года');
             Exit;
        end;

     putinf;
     while (head_person<>nil) do del_Person(head_person);

   //  DeleteCurrDataFromSQl;
     ProgressBarPdr.Min       :=  0;
     ProgressBarPdr.Max       :=  Count_Serv;
     ProgressBarPdr.Position  :=  0;
     ProgressBarPrsn.Max      := 10;
     ProgressBarPrsn.Min      :=  0;
     ProgressBarPrsn.Position :=  0;
     Application.ProcessMessages;
     for i:=1 to Count_Serv do
         begin
              ProgressBarPdr.Position  :=  i;
              nsrv:=i;
              LabelPdr.Caption:=NAME_SERV(NSRV);
              Application.ProcessMessages;
              if not NameServList.IsSelected(NSRV) then continue;
              mkflnm;
              if not Fileexists(fninf) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              needPut:=False;
              ImportPodr(needPut);
              if needPut then
                 Putinf;
              while (head_person<>nil) do del_Person(head_person);
         end;
     nmes:=nmesSav;
     nsrv:=nsrvSav;
     mkflnm;
     getinf(true);
end;

procedure TFormGetSaldo.ImportPodr(var needPut:boolean);
 const SQL_WHO = 43;
 var
     Curr_Person:person_ptr;
     i,i_person:integer;
     SQLStmnt:WideString;
     v:Variant;
     SaldoSumma:Real;
     Curr_Ud:UD_PTR;
     GUID:string;
 begin
     if Count_Person<1 then Exit;
     ProgressBarPrsn.Min:=0;
     ProgressBarPrsn.Max:=Count_Person;
     ProgressBarPrsn.Position:=0;
     i:=0;
     i_person:=0;
     Curr_Person:=Head_Person;
     while (Curr_Person<>Nil) do
       begin
            inc(i_person);
            ProgressBarPrsn.Position := i_person;
            LabelFio.Caption      := Curr_Person^.FIO;
            Application.ProcessMessages;
            if Curr_Person^.AUTOMATIC=AUTOMATIC_MODE then
               begin
                    Application.ProcessMessages;
                    GUID:=GetGUIDPersonToString(Curr_Person);
                    GUID:=Trim(GUID);
                    if Length(GUID)>2 then
                       begin
    //                       SQLStmnt:='select k.tabno,k.fio,';
                           SQLStmnt:='select ';
                           SQLStmnt:=Trim(SQLStmnt)+'(';
                           SQLStmnt:=trim(SQLStmnt)+'(select sum(a.summa) from fadd a where a.shifridperson=k.shifrid) -';
                           SQLStmnt:=trim(SQLStmnt)+'(select sum(u.summa) from fud u where u.shifridperson=k.shifrid)';
                           SQLStmnt:=trim(SQLStmnt)+') saldo';
                           SQLStmnt:=trim(SQLStmnt)+' from person k';
                           SQLStmnt:=trim(SQLStmnt)+' where k.yearvy='+IntToStr(WantedY)+' and k.monthvy='+intToStr(WantedM);
                           SQLStmnt:=trim(SQLStmnt)+' and ((select trim(coalesce(guid,''0''))  from pr_getguid(k.shifrid,0))='''+trim(GUID)+''')';
                           SQLStmnt:=trim(SQLStmnt)+' and k.tabno='+IntToStr(curr_Person^.TABNO);
                           v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
                           if VarIsNumeric(v) then
                              begin
                                   SaldoSumma:=v;
                                   DEL_WANTED_UD(SALDO_SHIFR,Curr_Person,WantedM);
                                   if not Exists_WANTED_Ud(SALDO_SHIFR,Curr_Person,WantedM) then
                                      begin
                                           needPut:=True;
                                           MAKE_UD(Curr_ud,Curr_Person);
                                           curr_ud^.Shifr:=SALDO_SHIFR;
                                           curr_ud^.SUMMA:=-SALDOSumma;
                                           Curr_Ud^.YEAR:=WantedY-1990;
                                           Curr_Ud^.PERIOD:=WantedM;
                                           Curr_Ud^.WHO:=SQL_WHO;
                                      end;
                              end;
                       end
               end;
            Curr_Person:=Curr_Person^.Next;
       end;
end;



end.
