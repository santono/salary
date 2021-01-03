{$WARNINGS OFF}
{$HINTS OFF}
unit UFormListPerepl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls, StdCtrls, Buttons;

type
  TFormListPerepl = class(TForm)
    StringGridPerepl: TStringGrid;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormListPerepl: TFormListPerepl;

implementation
  uses ScrDef,ScrUtil,ScrIO;
  type
      PRecPerepl=^TRecPerepl;
      TRecPerepl=record
                  tabno       : integer;
                  shifrpod    : integer;
                  FIO         : string;
                  DolgName    : string;
                  SummaPerepl : real;
                 end;
    var ListPere:TList;

{$R *.dfm}

procedure TFormListPerepl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormListPerepl.BitBtn1Click(Sender: TObject);
 var NsrvSav,NmesSav : integer;
     i_Nsrv,I    : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_Ptr;
     Curr_Ud     : Ud_Ptr;
     SummaPerepl : real;
     RecPerepl   : PRecPerepl;
begin
     NsrvSav  := NSRV;
     NmesSav  := NMES;
     ListPere := TList.Create;
     putinf;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     for i_nsrv:=1 to Count_Serv do
         begin
              nsrv:=i_nsrv;
              mkflnm;
              ProgressBar1.Position:=i_nsrv;
              Application.ProcessMessages;
              if not FileExists(FnInf) then continue;
              getinf(true);
              curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
                begin
                     SummaPerepl:=0;
                     Curr_Add:=Curr_Person^.ADD;
                     while (Curr_Add<>Nil) do
                       begin
                            SummaPerepl:=SummaPerepl+Sum(Curr_Add^.SUMMA);
                            Curr_Add:=Curr_Add^.NEXT;
                       end;
                     Curr_Ud:=Curr_Person^.UD;
                     while (Curr_Ud<>Nil) do
                       begin
                            SummaPerepl:=SummaPerepl-Sum(Curr_Ud^.SUMMA);
                            Curr_Ud:=Curr_Ud^.NEXT;
                       end;
                     if SummaPerepl<-0.01 then
                        begin
                             new(RecPerepl);
                             RecPerepl^.tabno := Curr_Person^.TABNO;
                             RecPerepl^.FIO   := Curr_Person^.Fio;
                             RecPerepl^.shifrpod := NSRV;
                             RecPerepl^.DolgName := Curr_Person^.Dolg;
                             RecPerepl^.SummaPerepl := SummaPerepl;
                             ListPere.Add(RecPerepl);
                        end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;

              EMPTY_ALL_PERSON;
         end;
     if ListPere.Count>0 then
        begin
             StringGridPerepl.ColCount:=6;
             StringGridPerepl.RowCount:=ListPere.Count+1;
             StringGridPerepl.Cells[0,0]:='№';
             StringGridPerepl.Cells[1,0]:='Пдр';
             StringGridPerepl.Cells[2,0]:='Т.н.';
             StringGridPerepl.Cells[3,0]:='ФИО';
             StringGridPerepl.Cells[4,0]:='Должность';
             StringGridPerepl.Cells[5,0]:='Сумма';
             for i:=0 to ListPere.Count-1 do
                 begin
                      StringGridPerepl.Cells[0,i+1]:=IntToStr(i+1);
                      StringGridPerepl.Cells[1,i+1]:=IntToStr(PRecPerepl(ListPere.Items[i])^.ShifrPod);
                      StringGridPerepl.Cells[2,i+1]:=IntToStr(PRecPerepl(ListPere.Items[i])^.Tabno);
                      StringGridPerepl.Cells[3,i+1]:=PRecPerepl(ListPere.Items[i])^.FIO;
                      StringGridPerepl.Cells[4,i+1]:=PRecPerepl(ListPere.Items[i])^.DolgName;
                      StringGridPerepl.Cells[5,i+1]:=Format('%15.2f',[PRecPerepl(ListPere.Items[i])^.SummaPerepl]);
                 end;

        end
     else
        ShowMessage('Нет переплат');
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     ListPere.Free;
     NSRV:=NsrvSav;
     Nmes:=NmesSav;
     mkflnm;
     getinf(true);
end;

end.
