unit UFormDelAllCN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormDelAllCN = class(TForm)
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure DeleteAllCN(wantedshifr:integer);
  public
    { Public declarations }
  end;

var
  FormDelAllCN: TFormDelAllCN;

implementation
  uses ScrDef,ScrIo,ScrUtil;

{$R *.dfm}

procedure TFormDelAllCN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormDelAllCN.BitBtn1Click(Sender: TObject);
begin
     if not ((NMES=FLOW_MONTH) and
             (CURRYEAR=WORK_YEAR_VAL)) then
        begin
             ShowMessage('”даление возможно только в текущем мес€це');
             Exit;
        end;
     DeleteAllCN(102);
end;
procedure TFormDelAllCN.DeleteAllCN(wantedshifr:integer);
// const WantedShifr=102;
 var NsrvTmp:Integer;
     i_nsrv:Integer;
     Curr_Person:Person_Ptr;
     IsDeleted:Boolean;
     Done:Boolean;
     Curr_Cn:CN_PTR;
     CountRec:Integer;
 begin
      CountRec:=0;
      NsrvTmp:=Nsrv;
      Putinf;
      while (head_person<>nil) do del_person(Head_Person);
      ProgressBar1.Max:=count_serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      for i_nsrv:=1 to count_serv do
        begin
             ProgressBar1.StepIt;
             LabelPodr.Caption:=name_serv(i_nsrv);
             Application.ProcessMessages;
             nsrv:=i_nsrv;
             mkflnm;
             if not FileExists(fninf) then Continue;
             getinf(true);
             curr_Person:=Head_Person;
             IsDeleted:=False;
             while (Curr_Person<>Nil) do
              begin
                   while (true) do
                     begin
                          Done:=True;
                          Curr_Cn:=Curr_Person^.cn;
                          while (Curr_Cn<>nil) do
                           begin
                                if Curr_Cn.Shifr=WantedShifr+Limit_cn_Base then
                                   begin
                                        Del_Cn(Curr_Cn,Curr_Person);
                                        IsDeleted:=True;
                                        Inc(CountRec);
                                        Break;
                                   end;
                                Curr_Cn:=Curr_Cn^.Next;
                           end;
                          if Done then break;
                     end;
                   Curr_Person:=Curr_Person^.Next;
              end;
             if IsDeleted then
                PutInf;
             while (head_person<>nil) do del_person(Head_Person);
        end;
      Nsrv:=NsrvTmp;
      mkflnm;
      GetInf(true);
      if CountRec=0 then
         ShowMessage('Ќе найдено записей дл€ удалени€')
      else
         ShowMessage('”далено '+IntToStr(CountRec)+' записей')

 end;
procedure TFormDelAllCN.BitBtn3Click(Sender: TObject);
begin
     if not ((NMES=FLOW_MONTH) and
             (CURRYEAR=WORK_YEAR_VAL)) then
        begin
             ShowMessage('”даление возможно только в текущем мес€це');
             Exit;
        end;
     if not ((NMES=3) and (CURRYEAR=2015)) then
        begin
             ShowMessage('”далить признак инвалидности из F4 можно только в марте 2015 г.');
             Exit;
        end;
     DeleteAllCN(INVALID_SHIFR);

end;

end.
