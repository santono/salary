{$WARNINGS OFF}
{$HINTS OFF}
unit UFormAllAddUdForAbsenBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormAllAddUdForAbsenBank = class(TForm)
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
  FormAllAddUdForAbsenBank: TFormAllAddUdForAbsenBank;

implementation
   uses ScrLists,ScrDef,ScrIO,ScrUtil;

{$R *.dfm}

procedure TFormAllAddUdForAbsenBank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

  procedure WorkOutPodr(WantedPeriod:integer;var CntDeleted:integer;
                        var Maked:boolean);
   var Curr_Person:Person_Ptr;
     IsAdd    : boolean;
     IsUd     : boolean;
     IsBank   : Boolean;
     Done     : boolean;
     Curr_Ud  : Ud_Ptr;
     Curr_Add : Add_Ptr;
   begin
        curr_person:=head_person;
        while (curr_Person<>NIl) do
          begin
               if Curr_Person^.Tabno=10141 then
                  Curr_Person^.Tabno:=10141;
            //   LabelFIO.Caption:=Curr_Person^.Fio;
            //   Application.ProcessMessages;
               IsBank:=false;
               Curr_Ud:=Curr_Person^.Ud;
               while (Curr_Ud<>Nil) do
                begin
                     if (IsBankShifr(Curr_ud^.SHIFR)) then
                        begin
                             IsBank:=true;
                             break;
                        end;
                     Curr_Ud:=Curr_Ud^.NEXT;
                end;
               if not IsBank then
                  begin
                        while (Curr_Person^.UD<>nil) do Del_Ud(Curr_Person^.Ud,Curr_Person);
                        while (Curr_Person^.Add<>nil) do Del_Add(Curr_Person^.Add,Curr_Person);
                        inc(CntDeleted);
                        Maked:=True;
                  end;
               Curr_Person:=Curr_Person^.NEXT;
          end;
     end;




procedure TFormAllAddUdForAbsenBank.BitBtn1Click(Sender: TObject);
 var WantedPeriod : integer;
     S            :  string;
     i            : integer;
     savnsrv      : integer;
     Curr_Person  : Person_ptr;
     Curr_Ud      : ud_ptr;
     done         : boolean;
     i_nsrv       : integer;
     CntDeleted   : integer;
     NeedBlockedPerson : boolean;
     NeedBlockedUd : boolean;
     Maked        : Boolean;
begin
 //..     if not ((NMES=9) and (CURRYEAR=2014)) then
 //        begin
 //             ShowMessage('Только в сентябре 2014');
 //             Exit
 //        end;
     WantedPeriod:=NMES;
     if not YesNo('Удалить начисленияи удержания у сотрудников, у которых не было перечислений на банкомат?') then Exit;
    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    CntDeleted            := 0;
    while (head_person<>nil) do del_person(Head_Person);
    for i_nsrv:=1 to count_serv do
        begin
             nsrv:=i_nsrv;
             mkflnm;
             ProgressBar1.Position := i_nsrv;
             Application.ProcessMessages;
             if not fileexists(fninf) then continue;
             getinf(true);
             maked:=False;
             WorkOutPodr(WantedPeriod,CntDeleted,Maked);
             if Maked then putinf;
             while (head_person<>nil) do del_person(Head_Person);
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
