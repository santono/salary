unit UFormDelUdForWantedMonth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormDelUdForWantedMonth = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    chkDelBlo: TCheckBox;
    chkDelBloUd: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDelUdForWantedMonth: TFormDelUdForWantedMonth;

implementation
   uses ScrLists,ScrDef,ScrIO,ScrUtil;

{$R *.dfm}

procedure TFormDelUdForWantedMonth.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

  procedure WorkOutPodr(WantedPeriod:integer;var CntDeleted:integer;
                        var Maked:boolean;
                        NeedBlockedPerson:boolean;
                        NeedBlockedUd:boolean);
   var Curr_Person:Person_Ptr;
     IsAdd    : boolean;
     IsUd     : boolean;
     Done     : boolean;
     Curr_Ud  : Ud_Ptr;
     Curr_Add : Add_Ptr;
   begin
        curr_person:=head_person;
        while (curr_Person<>NIl) do
          begin
               if Curr_Person^.AUTOMATIC<>AUTOMATIC_MODE then
               if not NeedBlockedPerson then
                  begin
                       Curr_Person:=Curr_Person^.NEXT;
                       continue;
                  end;
               if Curr_Person^.Tabno=10141 then
                  Curr_Person^.Tabno:=10141;
            //   LabelFIO.Caption:=Curr_Person^.Fio;
            //   Application.ProcessMessages;
               IsUd:=false;
               Curr_Ud:=Curr_Person^.Ud;
               while (Curr_Ud<>Nil) do
                begin
                     if ((Curr_ud^.VYPLACHENO=not_GET_OUT) or
                        ((Curr_ud^.VYPLACHENO=GET_OUT) and (NeedBlockedUd))) then
                     if Curr_Ud^.Period=WantedPeriod then
                        begin
                             IsUd:=true;
                             break;
                        end;
                     Curr_Ud:=Curr_Ud^.NEXT;
                end;
               IsAdd:=false;
               Curr_Add:=Curr_Person^.Add;
               while (Curr_Add<>Nil) do
                 begin
                      if (Curr_Add^.Period=WantedPeriod) then
                         begin
                              IsAdd:=true;
                              break;
                         end;
                      Curr_Add:=Curr_Add^.NEXT;
                  end;
               if IsUd and not IsAdd then
                  begin
                        Repeat
                              Done:=true;
                              Curr_Ud:=Curr_Person^.UD;
                              while (Curr_Ud<>Nil) do
                               begin
                                    if Curr_Ud^.Period=WantedPeriod then
                                    if ((Curr_Ud^.VYPLACHENO=NOT_GET_OUT) or
                                    ((Curr_Ud^.VYPLACHENO=GET_OUT) and (NeedBlockedUd))) then
                                       begin
                                            Del_Ud(Curr_Ud,Curr_Person);
                                            inc(CntDeleted);
                                            Maked:=True;
                                            Done:=false;
                                            break;
                                       end;
                                    Curr_Ud:=Curr_Ud^.NEXT;
                               end;
                        until done;
                  end;
               Curr_Person:=Curr_Person^.NEXT;
          end;
     end;




procedure TFormDelUdForWantedMonth.BitBtn1Click(Sender: TObject);
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
     if not YesNo('”далить удержаний за мес. при отсутствуии начислений '+#10+#13+'(ћес€ц будет предлжено выбрать на след шаге)?') then Exit;
     S := InputBox('ћес€ц ≈—¬','¬ведите номер мес€ца','0');
     val(s,WantedPeriod,I);
     if (i<>0) then
        begin
             ShowMessage('Ќеверный номер мес€ца');
             Exit;
        end;
     if (WantedPeriod<1) or (WantedPeriod>12) or (WantedPeriod=NMES) then
        begin
             ShowMessage('Ќеверный номер мес€ца.');
             Exit;
        end;
    NeedBlockedPerson := chkDelBlo.Checked;
    NeedBlockedUd     := chkDelBloUd.Checked;
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
             maked:=False;
             WorkOutPodr(WantedPeriod,CntDeleted,Maked,NeedBlockedPerson,NeedBlockedUd);
             if Maked then putinf;
             EMPTY_ALL_PERSON;
        end;
    if CntDeleted>0 then
       ShowMessage('”далено '+IntToStr(CntDeleted)+' строк')
    else
       ShowMessage('—трок с указанным шифром не найдено');
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);


end;

procedure TFormDelUdForWantedMonth.FormCreate(Sender: TObject);
begin
     chkDelBlo.Checked   := False;
     chkDelBloUd.Checked := False;
end;

end.
