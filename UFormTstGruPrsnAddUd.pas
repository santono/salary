{$WARNINGS OFF}
{$HINTS OFF}
unit UFormTstGruPrsnAddUd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ComCtrls;

type
  TFormTstGruPrsnAddUd = class(TForm)
    Button1: TButton;
    ProgressBar1: TProgressBar;
    StringGridL: TStringGrid;
    CheckBoxC: TCheckBox;
    LabelPodr: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
     NeedCorrect:boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTstGruPrsnAddUd: TFormTstGruPrsnAddUd;

implementation
  uses ScrDef,ScrIo,ScrUtil;

  type
      PRecTst=^TRecTst;
      TRecTst=record
                  tabno       : integer;
                  shifrpod    : integer;
                  FIO         : string;
                  DolgName    : string;
                  CountP      : string;
                  ShifrSta    : integer;
                  NameSta     : string;
                  Summa       : real;
                  CountAU     : string;
                 end;
    var ListTst:TList;



{$R *.dfm}

procedure TFormTstGruPrsnAddUd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormTstGruPrsnAddUd.FormCreate(Sender: TObject);
begin
     NeedCorrect:=true;
end;

procedure TFormTstGruPrsnAddUd.Button1Click(Sender: TObject);
 var NsrvSav,NmesSav : integer;
     i_Nsrv,I    : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_Ptr;
     Curr_Ud     : Ud_Ptr;
     N           : integer;
     RecTst      : PRecTst;
     k,l         : integer;
     s,t,ss      : string;
     NeedPut     : boolean;
     NeedP       : boolean;
   procedure AddRecAdd;
    begin
         new(RecTst);
         RecTst^.tabno     := Curr_Person^.TABNO;
         RecTst^.FIO       := Curr_Person^.Fio;
         RecTst^.shifrpod  := NSRV;
         RecTst^.DolgName  := Curr_Person^.Dolg;
         RecTst^.CountP    := s;//GET_IST_NAME(CURR_Person^.Gruppa);
         RecTst^.ShifrSta  := Curr_Add^.SHIFR;
         RecTst^.NameSta   := GetNameShifr(Curr_Add^.Shifr);
         RecTst^.Summa     := Curr_Add^.Summa;
         RecTst^.CountAU   := t;//Curr_Add^.Count;
         ListTst.Add(RecTst);
    end;
   procedure AddRecUd;
    begin
         new(RecTst);
         RecTst^.tabno     := Curr_Person^.TABNO;
         RecTst^.FIO       := Curr_Person^.Fio;
         RecTst^.shifrpod  := NSRV;
         RecTst^.DolgName  := Curr_Person^.Dolg;
         RecTst^.CountP    := s;//GET_IST_NAME(CURR_Person^.Gruppa);
         RecTst^.ShifrSta  := Curr_Ud^.SHIFR;
         RecTst^.NameSta   := GetNameShifr(Curr_Ud^.Shifr);
         RecTst^.Summa     := Curr_Ud^.Summa;
         RecTst^.CountAU   := t;//Curr_Ud^.Count;
         ListTst.Add(RecTst);
    end;
begin
     NeedCorrect:=CheckBoxC.Checked;
     NsrvSav  := NSRV;
     NmesSav  := NMES;
     ListTst  := TList.Create;
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
              LabelPodr.Caption:=Name_Serv(NSRV);
              Application.ProcessMessages;
              if not FileExists(FnInf) then continue;
              LabelPodr.Caption:=Name_Serv(NSRV);
              getinf(true);
              NeedPut := false;
              curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
                begin
                     NeedP := false;
                     n:=0;
                     ss:=GET_IST_NAME(Curr_Person^.Gruppa);
                     ss:=trim(ss);
                     Curr_Add:=Curr_Person^.Add;
                     while (Curr_Add<>Nil) do
                       begin
                            s:=ss;
                            t:=Curr_Add^.COUNT;
                            t:=trim(t);
                            if (length(s)>length(t)) and (length(t)>1) then
                               s:=copy(s,1,length(t));
                            if s<>t then
                               begin
                                    NeedP:=true;
                                    AddRecAdd;
                                    if NeedCorrect then
                                       begin
                                            NeedPut:=true;
                                            Curr_Add^.Count:=s;
                                       end;
                               end;
                            Curr_Add:=Curr_Add^.NEXT;
                       end;
                     Curr_Ud:=Curr_Person^.UD;
                     while (Curr_Ud<>Nil) do
                       begin
                            s:=ss;
                            t:=Curr_Ud^.COUNT;
                            t:=trim(t);
                            if (length(s)>length(t)) and (length(t)>1) then
                               s:=copy(s,1,length(t));
                            if s<>t then
                               begin
                                    NeedP:=true;
                                    AddRecUd;
                                    if NeedCorrect then
                                       begin
                                            NeedPut:=True;
                                            Curr_Ud^.Count:=s;
                                       end;
                               end;
                            Curr_Ud:=Curr_Ud^.NEXT;
                       end;
                     {
                     if NeedP then
                        begin
                             new(RecTst);
                             RecTst^.tabno     := Curr_Person^.TABNO;
                             RecTst^.FIO       := Curr_Person^.Fio;
                             RecTst^.shifrpod  := NSRV;
                             RecTst^.DolgName  := Curr_Person^.Dolg;
                             ListTst.Add(RecTst);
                        end;
                      }
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              if NeedPut then putinf;
              EMPTY_ALL_PERSON;
         end;
     if ListTst.Count>0 then
        begin
             StringGridL.ColCount:=10;
             StringGridL.RowCount:=ListTst.Count+1;
             StringGridl.Cells[0,0]:='№';
             StringGridl.Cells[1,0]:='Пдр';
             StringGridl.Cells[2,0]:='Т.н.';
             StringGridl.Cells[3,0]:='ФИО';
             StringGridl.Cells[4,0]:='Должность';
             StringGridl.Cells[5,0]:='Счет';
             StringGridl.Cells[6,0]:='Шифр';
             StringGridl.Cells[7,0]:='Название';
             StringGridl.Cells[8,0]:='Сумма';
             StringGridl.Cells[9,0]:='Сч.статьи';
             for i:=0 to ListTst.Count-1 do
                 begin
                      StringGridl.Cells[0,i+1]:=IntToStr(i+1);
                      StringGridl.Cells[1,i+1]:=IntToStr(PRecTst(ListTst.Items[i])^.ShifrPod);
                      StringGridl.Cells[2,i+1]:=IntToStr(PRecTst(ListTst.Items[i])^.Tabno);
                      StringGridl.Cells[3,i+1]:=PRecTst(ListTst.Items[i])^.FIO;
                      StringGridl.Cells[4,i+1]:=PRecTst(ListTst.Items[i])^.DolgName;
                      StringGridl.Cells[5,i+1]:=PRecTst(ListTst.Items[i])^.CountP;
                      StringGridl.Cells[6,i+1]:=IntToStr(PRecTst(ListTst.Items[i])^.ShifrSta);
                      StringGridl.Cells[7,i+1]:=PRecTst(ListTst.Items[i])^.NameSta;
                      StringGridl.Cells[8,i+1]:=Format('%12.2f',[PRecTst(ListTst.Items[i])^.Summa]);
                      StringGridl.Cells[9,i+1]:=PRecTst(ListTst.Items[i])^.CountAU;
                 end;
        end
     else
        ShowMessage('Нет несоответствий');
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     ListTst.Free;
     NSRV:=NsrvSav;
     Nmes:=NmesSav;
     mkflnm;
     getinf(true);
end;

end.
