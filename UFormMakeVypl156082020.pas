unit UFormMakeVypl156082020;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TFormMakeVypl156082020 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
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
  FormMakeVypl156082020: TFormMakeVypl156082020;

implementation
  uses ScrDef,ScrIo,ScrUtil, UFibModule, ScrLists, UFormSelPKG, scrnalog;
  type pRec=^TRec;
       TRec=record
             tabno:Integer;
             guid:string;
             summa:Real;
             moved:Boolean;
            end;

{$R *.dfm}
  var  list156:TList;

procedure TFormMakeVypl156082020.BitBtn1Click(Sender: TObject);
var savnsrv,savnmes,i_nsrv,i : integer;
    Curr_Person : Person_Ptr;
    Finded  : boolean;
    need:boolean;
    SUMMA_TOT:REAL;
  procedure fill_person(var need:boolean;var summaTot:Real);
   var curr_add:add_ptr;
       summa_add:real;
       finded:Boolean;
       rec:pRec;
       i:Integer;
       guid:string;
   begin
        finded := False;
        guid:=GetGUIDPersonToString(curr_person);
        if list156.count>0 then
           for i:=0 to list156.count-1 do
               begin
                    rec:=pRec(list156.Items[i]);
                    if rec^.tabno=curr_person^.TABNO then
                    if (Trim(rec^.guid)=Trim(guid)) then
                    if not rec^.moved then
                       begin
                            finded:=True;
                            Break;
                       end;

               end;
        if not finded then Exit;
        MAKE_ADD(curr_add,curr_person);
        curr_add^.shifr:=156;
        curr_add^.PERIOD:=9;
        curr_add^.YEAR:=2020-1990;
        curr_add^.SUMMA:=rec^.summa;
        curr_add^.who:=77;
        curr_add^.FZP:=curr_add^.SUMMA;
        CALC_NAUD_PERSON(Curr_Person,31);
        summaTot:=summaTot+rec^.summa;
        rec^.moved:=True;
        need:=True;
   end;
  procedure filllist156;
   var guid:string;
       curr_person:PERSON_PTR;
       curr_add:ADD_PTR;
       rec:pRec;
       finded:Boolean;
   begin
        curr_person:=HEAD_PERSON;
        while (curr_person<>nil) do
         begin
              if (curr_person^.tabno =9054) or                ( curr_person^.tabno =1606) then
                 begin
                      curr_person:=curr_person^.NEXT;
                      continue;
                 end;
              if (curr_person^.gruppa<>1)
                 or
                 (curr_person^.KATEGORIJA<>1) then
                 begin
                      curr_person:=curr_person^.NEXT;
                      continue;
                 end;
              guid:=GetGUIDPersonToString(curr_person);
              finded:=False;
              curr_add:=curr_person.ADD;
              while (curr_add<>nil) do
               begin
                     if curr_add^.shifr=156 then
                     if curr_add^.period=8 then
                     if curr_add^.summa<-0.01 then
             //        if curr_person^.oklad>0.01 then
                        begin
                             finded:=True;
                             Break;
                        end;
                     curr_add:=curr_add^.NEXT;
               end;
              if finded then
                 begin
                   new(Rec);
                   rec^.tabno:=curr_person^.TABNO;
                   rec^.guid:=guid;
                   rec^.summa:=-curr_add^.SUMMA;
                   rec^.moved:=False;
                   list156.Add(Rec);
                end;
              curr_person:=curr_person.NEXT;
         end;
   end;

begin
    BitBtn1.Enabled:=false;
    if not isLNR then Exit;
    if not( (NMES=9) and (CURRYEAR=2020)) then
       begin
            ShowMessage('Можно запустить только в сентябре 2020 г.');
            Exit;
       end;
    if not YesNo('Выполнить перенос 156-й статьи из августа 2020 в сентябрь 2020?'+#13+#10+'(Если не знаете , что это. Лучше выйти.)') then
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
    savnmes               := nmes;
    putinf;
    empty_all_person;
    SUMMA_TOT:=0;
    list156:=TList.Create;
    for i_nsrv:=1 to count_serv do
        begin
             label1.caption:=Trim(name_serv(i_nsrv));
             application.ProcessMessages;
             nmes:=savnmes;
             nmes:=nmes - 1;
             nsrv:=i_nsrv;
             ProgressBar1.Position := i_nsrv;
             Application.ProcessMessages;
             if not NameServList.IsSelected(NSRV) then
               begin
                   continue;
               end;
             mkflnm;
             if not fileexists(fninf) then
               begin
                   continue;
               end;
             getinf(false);
             fillList156;
             EMPTY_ALL_PERSON;
             NMES:=savnmes;
         //    if not isAssigned(list156) then Continue;
             if list156.count<1 then
               begin
                   continue;
               end;
             MKFLNM;
             if not FileExists(fninf) then
               begin
                   continue;
               end;
             GETINF(true);
             need:=false;
             curr_Person:=head_Person;
             while (curr_person<>nil) do
              begin
                   label2.caption:=trim(curr_person^.fio);
                   application.ProcessMessages;
                   fill_person(need,SUMMA_TOT);
                   Curr_Person:=Curr_Person^.Next;
              end;
             if need then
                putinf;
             EMPTY_ALL_PERSON;
             list156.Clear;

        end;
    list156.Free;
    nsrv:=savnsrv;
    nmes:=savnmes;
    mkflnm;
    getinf(true);
    ShowMessage('Суммы выплат откорректированы. ИТОГО '+FloatToStr(SUMMA_TOT));
    BitBtn1.Enabled:=true;

end;

procedure TFormMakeVypl156082020.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormMakeVypl156082020.FormCreate(Sender: TObject);
begin
     wantedSta:=102;
  //  cbGetOut.Checked:=false;
end;

end.
