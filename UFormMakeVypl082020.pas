unit UFormMakeVypl082020;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TFormMakeVypl082020 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn3: TBitBtn;
    cbGetOut: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    wantedSta:integer;
    { Private declarations }
  public
    { Public declarations }
  end;
const WANTED_SHIFR=156;
var
  FormMakeVypl082020: TFormMakeVypl082020;

implementation
  uses ScrDef,ScrIo,ScrUtil, UFibModule, ScrLists, UFormSelPKG;

{$R *.dfm}

procedure TFormMakeVypl082020.BitBtn1Click(Sender: TObject);
var savnsrv,i_nsrv,i : integer;
    Curr_Person : Person_Ptr;
    Finded  : boolean;
    need:boolean;
    SUMMA_TOT:REAL;
  procedure make_corrections(var need:boolean;var summaTot:Real);
   var curr_add:add_ptr;
       curr_ud:ud_ptr;
       summa_add:real;
       summa_ud:real;
       summa_razn:real;
       finded:Boolean;
       W_DAY:Integer;
   begin
        if curr_person^.WID_RABOTY<>1 then Exit;
        if curr_person^.tabno=1356 then
           w_day:=0;
        W_DAY:=WORK_DAY(1,31,CURR_PERSON);
        IF W_DAY> 7 THEN Exit;
        finded:=false;
        curr_add:=curr_person^.ADD;
        while (curr_add<>nil) do
          begin
               if curr_add^.shifr=wanted_shifr then
                  begin
                       finded:=True;
                       break;
                  end;
               curr_add:=curr_add^.NEXT;
          end;
        IF finded then Exit;
        finded:=false;
        curr_ud:=curr_person^.ud;
        while (curr_ud<>nil) do
          begin
               if curr_ud^.shifr=102 then
                  begin
                       DEL_UD(curr_ud,curr_person);
                       finded:=True;
                       Break;
                  end;
               curr_ud:=curr_ud^.NEXT;
          end;
        IF not finded then Exit;
        summa_add := r10(getSummaAddForPerson(curr_person));
        if summa_add<100 then Exit;
        summa_ud  := r10(getSummaUdForPerson(curr_person));
        if summa_ud<100 then Exit;
        summa_razn:=r10(r10(summa_add));//-r10(summa_ud));
        if summa_razn>0.1 then
          begin
               MAKE_ADD(curr_add,Curr_Person);
               curr_add^.shifr:=wanted_shifr;
               curr_add^.SUMMA:=-summa_razn;
               curr_add^.FZP:=-summa_razn;
               curr_add^.pEriod:=8;
               curr_add^.YEAR:=2020-1990;
               summaTot:=summaTot+sUmma_Razn;
               need:=true;
          end;
   end;

begin
    BitBtn1.Enabled:=false;
    if not YesNo('Выполнить корректировку отрицательных выплат?'+#13+#10+'(Если не знаете , что это. Лучше выйти.)') then
       begin
            BitBtn1.Enabled:=true;
            Exit;
       end;

    if NameServList.CountSelected<=0 then
       begin
            BitBtn1.Enabled:=true;
            ShowMessage('Не выбраны подразделения');
            Exit;
       end;
    if GruppyList.CountSelected<=0 then
       begin
            BitBtn1.Enabled:=true;
            ShowMessage('Не выбраны счета');
            Exit;
       end;
    if kategList.CountSelected<=0 then
       begin
            BitBtn1.Enabled:=true;
            ShowMessage('Не выбраны категории');
            Exit;
       end;

    BitBtn1.Enabled       := false;
    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    empty_all_person;
    SUMMA_TOT:=0;
    for i_nsrv:=1 to count_serv do
        begin
             nsrv:=i_nsrv;
             ProgressBar1.Position := i_nsrv;
             Application.ProcessMessages;
             if not NameServList.IsSelected(NSRV) then continue;
             mkflnm;
             if not fileexists(fninf) then continue;
             getinf(true);
             need:=false;
             curr_Person:=head_Person;
             while (curr_person<>nil) do
              begin
                   if curr_person^.AUTOMATIC=automatic_mode then
                   if GruppyList.IsSelected(curr_person^.GRUPPA) then
                   if KategList.IsSelected(curr_person^.KATEGORIJA) then
//                   if isOtpAfter23082020(curr_person) then
                      begin
                           MAKE_CORRECTIONS(need,SUMMA_TOT);
                      end;
                   Curr_Person:=Curr_Person^.Next;

              end;
             if need then
                putinf;
             EMPTY_ALL_PERSON;

        end;
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);
    ShowMessage('Суммы выплат откорректированы. ИТОГО '+FloatToStr(SUMMA_TOT));
    BitBtn1.Enabled:=true;

end;

procedure TFormMakeVypl082020.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormMakeVypl082020.FormCreate(Sender: TObject);
begin
     wantedSta:=102;
     cbGetOut.Checked:=false;
end;

end.
