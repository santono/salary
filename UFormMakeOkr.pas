unit UFormMakeOkr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormMakeOkr = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure performOkr;
    { Public declarations }
  end;

var
  FormMakeOkr: TFormMakeOkr;

implementation
 uses scrdef,ScrIo,ScrUtil,Math;

{$R *.dfm}

procedure TFormMakeOkr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMakeOkr.BitBtn1Click(Sender: TObject);
begin
     BitBtn1.Enabled:=False;
     performOkr;
     BitBtn1.Enabled:=true;
     ModalResult:=mrOk;
     Self.Close;
end;

procedure TFormMakeOkr.performOkr;
 var savnmes,savnsrv:Integer;
     i_count:Integer;
     maked:Boolean;
     curr_person:PERSON_PTR;
     okrValue:Real;
     function makeOkrPerson(curr_person:person_ptr):boolean;
      var curr_add : ADD_PTR;
          curr_ud  : UD_PTR;
          retVal   : boolean;
      begin
           retVal:=False;
           curr_add:=curr_person^.ADD;
           while (curr_add<>nil) do
             begin
                  okrValue:=SimpleRoundTo(curr_add^.summa,-2);
                  curr_Add^.SUMMA:=okrValue;
                  okrValue:=SimpleRoundTo(curr_add^.FZP,-2);
                  curr_Add^.FZP:=okrValue;
                  okrValue:=SimpleRoundTo(curr_add^.FMP,-2);
                  curr_Add^.FMP:=okrValue;
                  okrValue:=SimpleRoundTo(curr_add^.Other,-2);
                  curr_Add^.OTHER:=okrValue;
                  retval:=True;
                  curr_add:=curr_add^.NEXT;
             end;
           curr_ud:=curr_person^.UD;
           while (curr_ud<>nil) do
             begin
                  okrValue:=SimpleRoundTo(curr_ud^.summa,-2);
                  curr_Ud^.SUMMA:=okrValue;
                  retval:=True;
                  curr_ud:=curr_ud^.NEXT;
             end;
           makeOkrPerson:=retVal;
      end;

 begin
      if not (
          (NMES = FLOW_MONTH)
          and
          (CURRYEAR=WORK_YEAR_VAL)
          ) then
          begin
               ShowMessage('Запускать можно только в '+GetMonthRus(FLOW_MONTH)+' '+IntToStr(work_year_val));
               Exit;
          end;

      savnsrv:=NSRV;
      savnmes:=nmes;
      putinf;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      ProgressBar1.Step:=1;
      for i_count:=1 to Count_Serv do
          begin
               ProgressBar1.StepIt;
               Label1.Caption:=Name_Serv(i_count);
               Application.ProcessMessages;
               nsrv:=i_count;
               MKFLNM;
               if not FileExists(FNINF) then
                  Continue;
                GETINF(true);
                maked:=false;
                curr_person:=HEAD_PERSON;
                while (curr_person<>nil) do
                  begin
                       maked:=makeOkrPerson(curr_person);
                       curr_person:=curr_person^.NEXT;
                  end;
                if maked then
                   PUTINF;
                EMPTY_ALL_PERSON;
          end;
      nsrv:=savNSRV;
      nmes:=savnmes;
      MKFLNM;
      GETINF(true);
      showMessage('Округление выполнено');
 end;

procedure TFormMakeOkr.FormCreate(Sender: TObject);
begin
     Label1.Caption:='';
end;

end.
