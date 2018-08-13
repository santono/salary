unit UFormDelWantedUd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormDelWantedUd = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDelWantedUd: TFormDelWantedUd;

implementation
   uses ScrLists,ScrDef,ScrIO,ScrUtil;

{$R *.dfm}

procedure TFormDelWantedUd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormDelWantedUd.BitBtn1Click(Sender: TObject);
 var WantedShifr : integer;
     S           :  string;
     i           : integer;
     savnsrv     : integer;
     Curr_Person : Person_ptr;
     Curr_Ud     : ud_ptr;
     Curr_Add    : ADD_PTR;
     done        : boolean;
     i_nsrv      : integer;
     CntDeleted  : integer;
     needAdd     : Boolean;
begin
     if not YesNo('Удалить выбранную Вами статью начислений/удержаний'+#10+#13+'(Номер статьи будет предлжено выбрать на след шаге)?') then Exit;
     S := InputBox('Ввод шифра статьи начислений/удержаний','Введите номер стать начисления/удержания','0');
     val(s,WantedShifr,I);
     if (i<>0) then
        begin
             ShowMessage('Неверный номер статьи');
             Exit;
        end;
     if ShifrList.IsAdd(WantedShifr) then
        needAdd:=True
     else
        needAdd:=false;
//     if ShifrList.IsAdd(WantedShifr) then
//        begin
//             ShowMessage('Неверный номер статьи. Указано начисление');
//             Exit;
//        end;

    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    CntDeleted            := 0;
    EMPTY_ALL_PERSON;
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
                   repeat
                         Done := true;
                         if not needAdd  then
                            begin
                                Curr_Ud:=Curr_Person^.Ud;
                                while (Curr_Ud<>Nil) do
                                  begin
                                      if Curr_Ud^.Shifr=WantedShifr then
                                         begin
                                              Del_Ud(Curr_Ud,Curr_Person);
                                              inc(CntDeleted);
                                              Done:=false;
                                              break;
                                         end;
                                      Curr_Ud:=Curr_Ud^.Next;
                                  end;
                            end
                         else
                            begin
                                 Curr_Add:=Curr_Person^.Add;
                                 while (Curr_Add<>Nil) do
                                   begin
                                        if Curr_Add^.Shifr=WantedShifr then
                                           begin
                                                Del_Add(Curr_Add,Curr_Person);
                                                inc(CntDeleted);
                                                Done:=false;
                                                break;
                                           end;
                                         Curr_Add:=Curr_Add^.Next;
                                   end;
                            end
                   until Done;
                   Curr_Person:=Curr_Person^.Next;
              end;
             putinf;
             EMPTY_ALL_PERSON;
       end;
    if CntDeleted>0 then
       ShowMessage('Удалено '+IntToStr(CntDeleted)+' строк')
    else
       ShowMessage('Строк с указанным шифром не найдено');
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);


end;

end.
