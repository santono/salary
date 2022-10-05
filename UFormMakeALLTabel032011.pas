unit UFormMakeALLTabel032011;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TFormMakeALLTabel032011 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn3: TBitBtn;
    cxSpinEditAmntOfDay: TcxSpinEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    amntOfDay:integer;
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
       if (Curr_Person^.Tabel[27]=JAWKA) Then
//          (Curr_Person^.Tabel[10]=JAWKA) and
//          (Curr_Person^.Tabel[11]=VYHODN) then
          begin
//               Curr_Person^.Tabel[8]:=JAWKA;
               Curr_Person^.Tabel[27]:=VYHODN;
//               Curr_Person^.Tabel[11]:=JAWKA;
               need:=true;
          end;
//       else
//       if (Curr_Person^.Tabel[8]=VYHODN) and
//          (Curr_Person^.Tabel[10]=JAWKA) and
//          (Curr_Person^.Tabel[11]=VYHODN) then
//          begin
//               Curr_Person^.Tabel[8]:=JAWKA;
//               Curr_Person^.Tabel[10]:=VYHODN;
//               need:=true;
//          end;
(*
       or (Curr_Person^.Tabel[30]=JAWKA)
       or (Curr_Person^.Tabel[29]=JAWKA)) then exit;
       if Curr_Person^.Tabel[31]=Jawka  then
          begin
               Curr_Person^.Tabel[31]:=PROGUL;
               need:=true;
          end;
       if Curr_Person^.Tabel[30]=JAWKA  then
          begin
               Curr_Person^.Tabel[30]:=PROGUL;
               need:=true;
          end;
       if Curr_Person^.Tabel[29]=JAWKA  then
          begin
               Curr_Person^.Tabel[29]:=PROGUL;
               need:=true;
          end;
*)          
  end;
 procedure Fill_Tabel_For_Amnt_Of_Day(var need:boolean);
  var i:integer;
      finded:boolean;
  begin
       finded:=false;
       for i:=31 downto 31-amntOfDay+1 do
       if (Curr_Person^.Tabel[31]=NEZAPOLN) then
       if (Curr_Person^.Tabel[30]=TARIFN_OTPUSK) then
          begin
                Curr_Person^.Tabel[31]:=TARIFN_OTPUSK;
                finded := true;
                need   := true;
          end
       ELSE
       if (Curr_Person^.Tabel[30]=ILLNESS) then
          begin
                Curr_Person^.Tabel[31]:=ILLNESS;
                finded := true;
                need   := true;
          end
       ELSE
       if (Curr_Person^.Tabel[30]<>NEZAPOLN) then
            begin
                Curr_Person^.Tabel[31]:=VYHODN;
                finded := true;
                need   := true;
           end;
  end;
begin
    if not isLNR then exit;
    BitBtn1.Enabled:=false;
    if not YesNo('Внести корректировки в табель университета в сентябре 2022?'+#13+#10+'(Если не знаете , что это. Лучше выйти.)') then
       begin
            BitBtn1.Enabled:=true;
            Exit;
       end;
    IF not ((CurrYear=2022) and (nmes=09)) THEN
       begin
            ShowMessage('Внести корректировки можно только в сентябре 2022');
            BitBtn1.Enabled:=true;
            Exit;
       end;

//    if NameServList.CountSelected<=0 then
//       begin
//            BitBtn1.Enabled:=true;
//            ShowMessage('Не выбраны подразделения');
//            Exit;
//       end;
//    if GruppyList.CountSelected<=0 then
//       begin
//            BitBtn1.Enabled:=true;
//            ShowMessage('Не выбраны счета');
//            Exit;
//       end;
//    if KategList.CountSelected<=0 then
//       begin
//            BitBtn1.Enabled:=true;
//            ShowMessage('Не выбраны категории сотрудников');
//            Exit;
//       end;
    self.amntOfDay:=cxSpinEditAmntOfDay.Value;
//    if ((amntOfDay<1) or (amntOfDay>31)) then
//       begin
//            ShowMessage('Неверно указано количество дней.');
//            BitBtn1.Enabled:=true;
//            exit;
//       end;
    BitBtn1.Enabled:=false;
    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    empty_all_person;
    for i_nsrv:=1 to count_serv do
        begin
             nsrv:=i_nsrv;
             ProgressBar1.Position := i_nsrv;
             Application.ProcessMessages;
//             if not NameServList.IsSelected(NSRV) then continue;
             mkflnm;
             if not fileexists(fninf) then continue;
             getinf(true);
             need:=false;
             curr_Person:=head_Person;
             while (curr_person<>nil) do
              begin
//                   if GruppyList.IsSelected(curr_person^.GRUPPA) then
//                   if KategList.IsSelected(curr_person^.KATEGORIJA) then
                      Fill_Tabel(need);
//                      Fill_Tabel_For_Amnt_Of_Day(need);
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
    BitBtn1.Enabled:=true;

end;

procedure TFormMakeALLTabel032011.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormMakeALLTabel032011.FormCreate(Sender: TObject);
begin
     self.amntOfDay:=3;
     cxSpinEditAmntOfDay.Value:=self.amntOfDay;
     cxSpinEditAmntOfDay.Hide;
end;

end.
