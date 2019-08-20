unit UFormMakeCorrectNagativeVypl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TFormMakeCorrectNagativeVypl = class(TForm)
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

var
  FormMakeCorrectNagativeVypl: TFormMakeCorrectNagativeVypl;

implementation
  uses ScrDef,ScrIo,ScrUtil, UFibModule, ScrLists, UFormSelPKG;

{$R *.dfm}

procedure TFormMakeCorrectNagativeVypl.BitBtn1Click(Sender: TObject);
var savnsrv,i_nsrv,i : integer;
    Curr_Person : Person_Ptr;
    Finded  : boolean;
    need:boolean;
  procedure make_corrections(var need:boolean);
   var curr_ud:ud_ptr;
       curr_add:add_ptr;
       curr_sta:ud_ptr;
       summa_add:real;
       summa_ud:real;
       summa_razn:real;
   begin
        curr_sta:=nil;
        curr_ud:=curr_person^.UD;
        while (curr_ud<>nil) do
          begin
               if ((curr_ud^.VYPLACHENO=not_get_out)
                   or cbGetOut.Checked) then
               if curr_ud^.shifr=wantedSta then
                  begin
                       curr_sta:=curr_ud;
                       break;
                  end;
               curr_ud:=curr_ud^.NEXT;
          end;
        if curr_sta=nil then exit;
        if curr_sta^.summa<1.0 then exit;
        summa_add := r10(getSummaAddForPerson(curr_person));
        summa_ud  := r10(getSummaUdForPerson(curr_person));
        summa_razn:=r10(r10(summa_ud)-r10(summa_add));
        if summa_razn>0.1 then
        if (summa_razn<r10(curr_sta^.summa)+1.0) then
          begin
               curr_sta^.SUMMA:=r10(r10(curr_sta^.summa)-r10(summa_razn));
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
    if shifrList.CountSelected<>1 then
       begin
            BitBtn1.Enabled:=true;
            ShowMessage('Не указана статья для корректировки.');
            Exit;
       end;
    wantedSta:=0;
    for i:=1 to shifrList.Count do
        if shifrList.IsSelected(i) then
        if not shifrList.IsAdd(i) then
           begin
                wantedSta:=shifrList.GetShifrByNo(i);
                break;
           end;
    if wantedSta<1 then
       begin
            BitBtn1.Enabled:=true;
            ShowMessage('Не указана статья для корректировки.');
            Exit;
       end;

    BitBtn1.Enabled       := false;
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
                      begin
                           MAKE_CORRECTIONS(need);
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
    ShowMessage('Суммы выплату откорректированы.');
    BitBtn1.Enabled:=true;

end;

procedure TFormMakeCorrectNagativeVypl.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormMakeCorrectNagativeVypl.FormCreate(Sender: TObject);
begin
     wantedSta:=102;
     cbGetOut.Checked:=false;
end;

end.
