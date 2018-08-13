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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeOtpTableFromSQL: TFormMakeOtpTableFromSQL;

implementation
   uses ScrLists,ScrDef,ScrIO,ScrUtil,uFibModule,DateUtils;

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
begin
     if not needHideGenerMessages then
        if not YesNo('Установить табель из SQL?'+#10+#13+'(Можно испортить данные, подумайте)?') then Exit;

    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    empty_all_person;
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
                   MAKE_OTP_TABEL_FROM_SQL(CURR_PERSON);
                   MAKE_OG_TABEL_FROM_SQL(CURR_PERSON);
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
    while (head_person<>nil) do del_person(Head_Person);
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
                           v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
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
             while (head_person<>nil) do del_person(Head_Person);
       end;
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);


end;


procedure TFormMakeOtpTableFromSQL.FormCreate(Sender: TObject);
begin
     if not ((NMES=7) and (CURRYEAR=2015)) then
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
     MoveCompensIn071025;
end;

end.
