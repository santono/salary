unit UFormMakeOtpTableFromSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormMakeOtpTableFromSQL = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure MoveCompensIn071025;
    procedure CorrectKompTabelSVDN122020;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeOtpTableFromSQL: TFormMakeOtpTableFromSQL;

implementation
   uses ScrLists,ScrDef,ScrIO,ScrUtil,uFibModule,DateUtils,USQLUnit,ScrNalog;

{$R *.dfm}

procedure TFormMakeOtpTableFromSQL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMakeOtpTableFromSQL.BitBtn1Click(Sender: TObject);
 var WantedShifr : integer;
     S           :  string;
     i           : integer;
     savnsrv     : integer;
     Curr_Person : Person_ptr;
     done        : boolean;
     i_nsrv      : integer;
     shifrDol    : Integer;
begin
     if not needHideGenerMessages then
        if not YesNo('Установить табель из SQL?'+#10+#13+'(Можно испортить данные, подумайте)?') then Exit;

    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    empty_all_person;
    for i_nsrv:=1 to Count_Serv do
        begin
             nsrv:=i_nsrv;
             mkflnm;
             ProgressBar1.Position := i_nsrv;
             Application.ProcessMessages;
             if isLNR then
             if NSRV in [81,82,121,128,140,156,157,158,164,165,179,180,181,182,189] then
                Continue;
             if not fileexists(fninf) then continue;
             getinf(true);
             curr_Person:=head_Person;
             while (curr_person<>nil) do
              begin
                   shifrDol:=GET_DOL_CODE(curr_person);
                   if (shifrDol>0)  and
                       (shifrDol<>1500) then
                   if curr_person^.oklad>0 then
//                   if curr_person^.TABNO=11802 then
                      begin
                         MAKE_OTP_TABEL_FROM_SQL(CURR_PERSON);
                         MAKE_OG_TABEL_FROM_SQL(CURR_PERSON);
                         MAKE_OBO_TABEL_FROM_SQL(CURR_PERSON);
                      end;
                   Curr_Person:=Curr_Person^.Next;
              end;
             putinf;
             EMPTY_ALL_PERSON;;
       end;
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);
    if not needHideGenerMessages then
       ShowMessage('Табель по данным отпускных откорректирован.');
    Self.Close;

end;

procedure TFormMakeOtpTableFromSQL.MoveCompensIn071025;
 var WantedShifr : integer;
     S           :  string;
     i           : integer;
     savnsrv     : integer;
     Curr_Person : Person_ptr;
     done        : boolean;
     i_nsrv      : integer;
     SQLStmnt    : string;
     v           : Variant;
     dt          : TDateTime;
     dty,dtm,dtd : Word;
begin

     if not YesNo('Отметить уволенных, получивших компенсацию?'+#10+#13+'(Можно испортить данные, подумайте)?') then Exit;

    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    EMPTY_ALL_PERSON;
    for i_nsrv:=1 to count_serv do
        begin
             nsrv:=i_nsrv;
             mkflnm;
             ProgressBar1.Position := i_nsrv;
             Application.ProcessMessages;
             if not fileexists(fninf) then continue;
             getinf(true);
             curr_Person:=head_Person;
             while (curr_person<>nil) do
              begin
                   if Curr_Person^.Automatic=automatic_mode then
                      begin
                           SQLStmnt:='select a.f_data from otpuska a';
                           SQLStmnt:=trim(SQLStmnt)+' where year_vy=2015';
                           SQLStmnt:=trim(SQLStmnt)+'  and tabno='+IntToStr(Curr_Person^.tabno);
                           SQLStmnt:=trim(SQLStmnt)+'  and month_vy=6';
                           SQLStmnt:=trim(SQLStmnt)+'  and shifrsta=13';
                           SQLStmnt:=trim(SQLStmnt)+'  and not exists (';
                           SQLStmnt:=trim(SQLStmnt)+'select * from otpuska b where';
                           SQLStmnt:=trim(SQLStmnt)+'      b.tabno=a.tabno';
                           SQLStmnt:=trim(SQLStmnt)+'  and b.year_vy=2015';
                           SQLStmnt:=trim(SQLStmnt)+'  and b.month_vy=6';
                           SQLStmnt:=trim(SQLStmnt)+'  and b.shifrsta<>13';
                           SQLStmnt:=trim(SQLStmnt)+'  )';
                           v:=SQLQueryValue(SQLStmnt);
                           if not VarIsNull(v) then
                              begin
                                   dty:=0;
                                   dtm:=0;
                                   dtd:=0;
                                   dt:=v;
                                   dty:=yearof(dt);
                                   dtm:=monthof(dt);
                                   dtd:=dayof(dt);
                                   Curr_Person.AUTOMATIC:=MANUAL_MODE;
                                   while (Curr_Person.add<>Nil) do DEL_ADD(Curr_Person.add,Curr_Person);
                                   while (Curr_Person.ud<>Nil) do DEL_ud(Curr_Person.ud,Curr_Person);
                                   for i:=1 to 31 do Curr_Person.Tabel[i]:=nezapoln;
                                   setDataUwPerson(Curr_Person,dt);
                                   Curr_Person.STATE:=PERSON_UWOLEN_STATE;
                              end;
                    //       MAKE_OTP_TABEL_FROM_SQL(CURR_PERSON);
                      end;
                   Curr_Person:=Curr_Person^.Next;
              end;
             putinf;
             EMPTY_ALL_PERSON;
       end;
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);


end;

procedure TFormMakeOtpTableFromSQL.CorrectKompTabelSVDN122020;
 var WantedShifr : integer;
     S           :  string;
     i           : integer;
     savnsrv     : integer;
     Curr_Person : Person_ptr;
     done        : boolean;
     i_nsrv      : integer;
     SQLStmnt    : string;
     v           : Variant;
     dt          : TDateTime;
     dty,dtm,dtd : Word;
     dtFr, dtTo  : TDate;
     dtCurrS     : String;
     dtFrS, dtToS: String;
     dtCurr      : TDate;
     maked       : boolean;
     maked_person : Boolean;
   function isOtpInTabel(curr_person:person_ptr):Boolean;
    var retVal:Boolean;
        i:Integer;
    begin
         retVal:=False;
         for i:=1 to 31 do
             if curr_person^.TABEL[i] = TARIFN_OTPUSK then
                begin
                     retVal:=True;
                     Break;
                end;
         isOtpInTabel:=retVal;
    end;
begin
     if not isSVDN then Exit;
     if not YesNo('Выполнить корректировку табеля в связи с неправильной компенсацией в 12 2020?'+#10+#13+'(Можно испортить данные, подумайте)?') then Exit;

    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    EMPTY_ALL_PERSON;
    for i_nsrv:=1 to count_serv do
        begin
             nsrv:=i_nsrv;
             mkflnm;
             ProgressBar1.Position := i_nsrv;
             Application.ProcessMessages;
             if not fileexists(fninf) then continue;
             maked := false;
             getinf(true);
             curr_Person:=head_Person;
             while (curr_person<>nil) do
              begin

                   if Curr_Person^.Automatic=automatic_mode then
                   if  isOtpInTabel(curr_person) then
                      begin
                           SQLStmnt:='select first 1 a.l_data,a.f_data from otpuska a';
                           SQLStmnt:=trim(SQLStmnt)+' where year_vy=2020';
                           SQLStmnt:=trim(SQLStmnt)+'  and tabno='+IntToStr(Curr_Person^.tabno);
                           SQLStmnt:=trim(SQLStmnt)+'  and month_vy>=10';
                           SQLStmnt:=trim(SQLStmnt)+'  and shifrsta=13';
                           v:=SQLQueryRecValues(SQLStmnt);
                           if not VarIsNull(v) then
                           if not VarIsNull(v[0]) then
                           if not VarIsNull(v[1]) then
//                           if varis
                              begin
                                   dty:=0;
                                   dtm:=0;
                                   dtd:=0;
//                                   dt:=v;
                                   dtFr:=v[1];
                                   dtTo:=v[0];
                                   dtFrS:=IntToStr(DayOf(dtFr))+'-'+IntToStr(monthOf(dtFr))+'-'+IntToStr(yearOf(dtFr));
                                   dtToS:=IntToStr(DayOf(dtTo))+'-'+IntToStr(monthOf(dtTo))+'-'+IntToStr(yearOf(dtTo));
                                   maked_person:=false;
                                   for i:=1 to 31 do
                                       begin
                                            dtCurr:=EncodeDate(CURRYEAR,NMES,i);
                                           dtCurrS:=IntToStr(DayOf(dtCurr))+'-'+IntToStr(monthOf(dtCurr))+'-'+IntToStr(yearOf(dtCurr));

                                            if curr_person^.TABEL[i] in [TARIFN_OTPUSK] then
                                            if DateBetween(dtCurr, dtFr, dtTo) then
                                               begin
                                                    maked:=True;
                                                    maked_person:=True;
                                                    if MONTH_DAY[2,NMES,i]=1 then
                                                      curr_person^.TABEL[i] := jawka
                                                    else
                                                    if MONTH_DAY[2,NMES,i]=2 then
                                                      curr_person^.TABEL[i] := VYHODN
                                                    else
                                                    if MONTH_DAY[2,NMES,i]=3 then
                                                      curr_person^.TABEL[i] := VYHODN
                                                    else
                                                    if MONTH_DAY[2,NMES,i]=4 then
                                                      curr_person^.TABEL[i] := VYHODN;
//                                                    curr_person^.TABEL[i] := MONTH_DAY[2,NMES,i];
                                               end;

   //                                         Curr_Person.Tabel[i]:=nezapoln;
                                       end;
                                   if maked_person then
                                      CALC_NAUD_PERSON(Curr_person,31);
                              end;
                    //       MAKE_OTP_TABEL_FROM_SQL(CURR_PERSON);
                      end;
                   Curr_Person:=Curr_Person^.Next;
              end;
             if MAKEd then putinf;
             EMPTY_ALL_PERSON;
       end;
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);
    Self.Close;

end;



procedure TFormMakeOtpTableFromSQL.FormCreate(Sender: TObject);
begin
     if not ((NMES=12) and (CURRYEAR=2020) and isSVDN) then
        begin
              BitBtn3.Enabled:=False;
              BitBtn3.Hide;
        end
     else
        begin
              BitBtn3.Enabled:=true;
              BitBtn3.Show;
        end
end;

procedure TFormMakeOtpTableFromSQL.BitBtn3Click(Sender: TObject);
begin
//     MoveCompensIn071025;
     CorrectKompTabelSVDN122020;
end;

end.
