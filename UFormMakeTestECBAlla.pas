unit UFormMakeTestECBAlla;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFormMakeTestECBAlla = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeTestECBAlla: TFormMakeTestECBAlla;

implementation
  uses ScrDef,ScrIo,ScrUtil,ScrLists;
  type pECBPersonRec = ^tECBPersonRec;
       tECBPersonRec = record
                        tabno       : integer ;
                        fio         : string  ;
                        SummaAdd    : real    ;
                        SummaAddLim : real    ;
                       end;
  var                     
  ListPrsn  : TList;
  ListDP    : TList;
  ListIll   : TList;

{$R *.dfm}
procedure MakeSummaECB(Curr_Person:Person_Ptr;Curr_Add:Add_Ptr;List:TList);forward;

procedure TFormMakeTestECBAlla.BitBtn1Click(Sender: TObject);
var savnsrv,i_nsrv,i : integer;
    Curr_Person : Person_Ptr;
    Finded   : boolean;
    Curr_Add : Add_Ptr;
begin
    if not YesNo('Внести корректировки в табель за март 2011 ?'+#13+#10+'(Если не знаете , что это. Лучше выйти.)') then Exit;
    if nmes<>3 then
       begin
            ShowMessage('Внести корректировки можно только в марте');
            Exit;
       end;
    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    while (head_person<>nil) do del_person(Head_Person);
    ListPrsn := TList.Create;
    ListDP   := TList.Create;
    ListIll  := TList.Create;
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
                   Curr_Add:=Curr_Person^.Add;
                   while (Curr_Add<>Nil) do
                         begin
                               if ShifrList.IsECB(Curr_Add^.Shifr) then
                                  MakeSummaECB(Curr_Person,Curr_Add,ListPrsn)
                               else if ShifrList.IsECBIll(Curr_Add^.Shifr) then
                                  MakeSummaECB(Curr_Person,Curr_Add,ListIll);
                               Curr_Add:=Curr_Add^.Next;
                         end;
                   Curr_Person:=Curr_Person^.NEXT;
              end;
             putinf;
             while (head_person<>nil) do del_person(Head_Person);
        end;
    if ListPrsn.Count>0 then
       for i:=0 to ListPrsn.Count-1 do
           if PECBPersonRec(ListPrsn.Items[i])^.SummaAdd>LimitForPens then
              PECBPersonRec(ListPrsn.Items[i])^.SummaAddLim:=LimitForPens
           else
              PECBPersonRec(ListPrsn.Items[i])^.SummaAddLim:=PECBPersonRec(ListPrsn.Items[i])^.SummaAdd;
    ListPrsn.Free;
    ListIll.Free;
    ListDP.Free;
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);
end;
 procedure MakeSummaECB(Curr_Person:Person_Ptr;Curr_Add:Add_Ptr;List:TList);
   var Rec:PECBPersonRec;
       i:integer;
       Finded:boolean;
   begin
        Finded:=false;
        if List.Count>0 then
           begin
                for i:=0 to List.Count-1 do
                    if PECBPersonRec(List.Items[i])^.Tabno = Curr_Person^.Tabno then
                       begin
                            PECBPersonRec(List.Items[i])^.SummaAdd:=PECBPersonRec(List.Items[i])^.SummaAdd+Curr_Add^.SUMMA;
                            Finded:=true;
                            break;
                       end;
           end;
        if not Finded then
           begin
                New(Rec);
                Rec^.tabno:=Curr_Person^.TABNO;
                Rec^.fio:=Curr_Person^.FIO;
                Rec^.SummaAdd:=Curr_Add^.SUMMA;
                Rec^.SummaAddLim:=0;
                List.Add(Rec);
           end;
   end;
end.
