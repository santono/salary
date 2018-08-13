unit UFormMakeAllGuid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFormMakeALLGuid = class(TForm)
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
  FormMakeALLGuid: TFormMakeALLGuid;

implementation
  uses ScrDef,ScrIo,ScrUtil;

{$R *.dfm}

procedure TFormMakeALLGuid.BitBtn1Click(Sender: TObject);
var savnsrv,i_nsrv : integer;
    Curr_Person    : Person_Ptr;
    Curr_Cn        : Cn_Ptr;
    Finded         : boolean;
    MakedCnt       : Integer;
    S              : string;
begin
    if not YesNo('Установить уникальные коды?'+#13+#10+'(Если не знаете , что это. Лучше выйти.)') then Exit;
    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    MakedCnt := 0;
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
                   Curr_Cn:=Curr_Person^.Cn;
                   Finded:=false;
                   while (Curr_CN<>Nil) do
                    begin
                         if Curr_Cn^.Shifr=GUIDShifr+Limit_Cn_Base then
                            begin
                                 Finded:=true;
                                 break;
                            end;
                         Curr_Cn:=Curr_Cn^.Next;
                    end;
                   if not Finded then
                      begin
                           MakeGUID(Curr_Person);
                           inc(MakedCnt);
                      end;
                   Curr_Person:=Curr_Person^.Next;
              end;
             putinf;
             while (head_person<>nil) do del_person(Head_Person);

        end;
    S:='Установлено '+IntToStr(MakedCnt)+' уникальных значений';
    if MakedCnt=0 then
       S:='Не найдено ни одной записи без уникальных ключей';
    ShowMessage(s);
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);
end;

end.
