unit UFormMakeALLTabel032011;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFormMakeALLTabel032011 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeALLTabel032011: TFormMakeALLTabel032011;

implementation
  uses ScrDef,ScrIo,ScrUtil, UFibModule, ScrLists, UFormSelPKG;

{$R *.dfm}

procedure TFormMakeALLTabel032011.BitBtn1Click(Sender: TObject);
var savnsrv,i_nsrv : integer;
    Curr_Person : Person_Ptr;
    Finded  : boolean;
    need:boolean;
 procedure Make_Otp_Tabel(Curr_Person:Person_ptr);
  var s:string;
      y,m:integer;
      i,l:integer;
      f:boolean;
  begin
       m:=nmes;
       y:=CurrYear;
   
       if FIB.pFIBQuery.Open then
          FIB.pFIBQuery.Close;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       FIB.pFIBQuery.SQL.CLear;
       FIB.pFIBQuery.Transaction.StartTransaction;
       FIB.pFIBQuery.SQL.Add('select first 1 s from pr_bld_otp_tabel('+IntToStr(Curr_Person^.Tabno)+','+IntToStr(Y)+','+IntToStr(m)+')');
       FIB.pFIBQuery.ExecQuery;
       S:=FIB.pFIBQuery.Fields[0].AsString;
       if FIB.pFIBQuery.Open then
          FIB.pFIBQuery.Close;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       l:=length(trim(s));
       if l>31 then l:=31;


       FOR I:=1 TO l DO
           begin

                f:=false;
                if s[i]='1' then f:=true;
                if not f then continue;
     //           if day_kod[i]=4 then continue; { праздничные не менять }
                if GetDayCode(i)=4 then continue; { праздничные не менять }

                CURR_PERSON^.TABEL[I]:=TARIFN_OTPUSK;
           end;
     end;

 procedure Fill_Tabel(var need:boolean);
  begin

       if Curr_Person^.Tabel[25]=Jawka  then
          begin
               Curr_Person^.Tabel[25]:=VYHODN;
               need:=true;
          end;
       if Curr_Person^.Tabel[19]=VYHODN  then
          begin
              Curr_Person^.Tabel[19]:=Jawka;
               need:=true;
          end;
  end;
begin
    if not isSVDN then exit;
    if not YesNo('Внести корректировки в табель всего университета за август 2017?'+#13+#10+'(Если не знаете , что это. Лучше выйти.)') then Exit;
    IF not ((CurrYear=2017) and (nmes=08)) THEN
       begin
            ShowMessage('Внести корректировки можно только в октябре 2015');
            Exit;
       end;
    if NameServList.CountSelected<=0 then
       begin
            ShowMessage('Не выбраны подразделения');
            Exit;
       end;

    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    while (head_person<>nil) do del_person(Head_Person);
    for i_nsrv:=1 to count_serv do
        begin
             nsrv:=i_nsrv;
             if not NameServList.IsSelected(NSRV) then continue;
             mkflnm;
             ProgressBar1.Position := i_nsrv;
             Application.ProcessMessages;
             if not fileexists(fninf) then continue;
             getinf(true);
             need:=false;
             curr_Person:=head_Person;
             while (curr_person<>nil) do
              begin
                   Fill_Tabel(need);
                   if Curr_Person^.Tabno=1356 then
                      Curr_Person^.Tabno:=1356;

                //   MAKE_OTP_TABEL(Curr_Person);
{
                   if Curr_Person^.TABEL[7]=JAWKA then
                      Curr_Person^.TABEL[7]:=VYHODN;
                   if Curr_Person^.TABEL[12]=VYHODN then
                      Curr_Person^.TABEL[12]:=JAWKA;
}
                   Curr_Person:=Curr_Person^.Next;

              end;
             if need then
                putinf;
             EMPTY_ALL_PERSON;

        end;
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);
    ShowMessage('Табель откорректирован');
end;

procedure TFormMakeALLTabel032011.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

end.
