unit UFormCheckMovedOtpFromSQL ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormCheckMovedOtpFromSQL = class(TForm)
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure performChecking;

  public
    { Public declarations }
  end;

var
  FormCheckMovedOtpFromSQL: TFormCheckMovedOtpFromSQL;

implementation

{$R *.dfm}
  USeS scrdef,ScrUtil,ScrIo;

procedure TFormCheckMovedOtpFromSQL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormCheckMovedOtpFromSQL.FormCreate(Sender: TObject);
begin
     Caption:='Проверка переноса дат отпуска в табели в '+GetMonthRus(nmes)+' '+IntToStr(currYear)+' г.';
     labelPodr.Caption:='';
     
end;

procedure TFormCheckMovedOtpFromSQL.BitBtn1Click(Sender: TObject);
begin
     BitBtn1.Enabled:=False;
     performChecking;
     BitBtn1.Enabled:=true;
end;
procedure TFormCheckMovedOtpFromSQL.performChecking;
 var savNMES,savNSRV,i_NSRV:Integer;
     nmbOfFinded:Integer;
 procedure checkAllPerson;
  var curr_Person:PERSON_PTR;
      shifrdol:Integer;
      summaAdd:Real;
  begin
       curr_person:=head_person;
       while (curr_PERSON<>nil) do
         begin
              summaAdd:=getSummaAddForPerson(curr_person);
              shifrDol:=GET_DOL_CODE(curr_person);
              if (shifrDol>8)  and
                 (shifrDol<>1500) then
              if curr_person^.oklad>10.00 then
              if summaAdd>1.00 then
              if curr_person.Automatic=automatic_mode then
                 if not CHECK_OTP_TABEL_AGAINST_SQL(curr_person) then
                    begin
                         ShowMessage('Подразделение - '+IntToStr(nsrv)+' т.н. '+IntToStr(curr_person^.tabno)+' '+Trim(curr_person^.fio));
                         Inc(nmbOfFinded);
                    end;


              curr_person:=curr_person^.next;
         end;
  end;
 begin
      savNMES:=NMES;
      savNSRV:=NSRV;
      if ((nmes=FLOW_MONTH) and (CURRYEAR=WORK_YEAR_VAL)) then
         PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Min      := 0;
      ProgressBar1.Max      := Count_Serv;
      ProgressBar1.Position := 0;
      ProgressBar1.Step     := 1;
      Application.ProcessMessages;
      nmbOfFinded:=0;
      for i_nsrv:=1 to count_serv do
        begin
             ProgressBar1.StepIt;
             LabelPodr.Caption:=trim(Name_Serv(i_nsrv));
             Application.ProcessMessages;
             nsrv:=i_NSRV;
             MKFLNM;
             if not FileExists(fninf) then Continue;
             GETINF(False);
             checkAllPerson;
             EMPTY_ALL_PERSON;
        end;
      if nmbOfFinded=0 then
         ShowMessage('Не найдено неперенесенных в табель дат отпускных ')
      else
         ShowMessage('Найдено '+intToStr(nmbOfFinded)+' строк неперенесенных в табель дат отпускных !');
      NMES:=savNMES;
      NSRV:=savNSRV;
      MKFLNM;
      if ((nmes=FLOW_MONTH) and (CURRYEAR=WORK_YEAR_VAL)) then
         GETINF(True)
      else
         GETINF(false);


 end;

end.
