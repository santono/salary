{$WARNINGS OFF}
{$HINTS OFF}
unit UFormTestNadbPresent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormTestNadbPresent = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExecuteTestNadbAbsent;
  public
    { Public declarations }
  end;

var
  FormTestNadbPresent: TFormTestNadbPresent;

implementation
  uses ScrDef,ScrUtil,ScrIo;

{$R *.dfm}

procedure TFormTestNadbPresent.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormTestNadbPresent.BitBtn1Click(Sender: TObject);
begin
     ExecuteTestNadbAbsent;
end;

procedure TFormTestNadbPresent.ExecuteTestNadbAbsent;
var NMES_Sav,NSRV_Sav:Integer;
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    cntRec : Integer;
    wd     : Integer;
  procedure TestPersonNadbAbsent(Curr_Person:Person_Ptr);

       function testNadb(Shifr:integer):Boolean;
         var Curr_Cn:CN_PTR;
             RetVal:Boolean;
             findedCn,findedAdd:Boolean;
             Curr_Add:Add_Ptr;
         begin
              retVal    := false;
              findedCn  := false;
              findedAdd := False;
              curr_cn:=Curr_Person.CN;
              while Assigned(Curr_Cn) do
                begin
                     if Curr_cn^.AUTOMATIC=Automatic_Mode then
                     if Curr_cn^.SHIFR=Shifr then
                        begin
                              findedCn:=True;
                              Break;
                        end;
                     Curr_Cn:=Curr_Cn^.Next;
                end;
              if findedCn then
                 begin
                      curr_Add:=Curr_Person.Add;
                      while Assigned(Curr_Add) do
                        begin
                             if Curr_Add^.Shifr=Shifr then
                             if Curr_Add^.SHIFR=Shifr then
                                begin
                                     findedAdd:=True;
                                     Break;
                                end;
                             Curr_Add:=Curr_Add^.Next;
                        end;

                 end;
              if findedCn and not findedAdd then
                 retVal:=True;
              testNadb:=RetVal;
         end;

   begin
        if Curr_Person.AUTOMATIC=manual_mode then Exit;
        wd:=work_day(1,31,curr_Person);
        if wd<1 then Exit;
        if Abs(Curr_Person.OKLAD)<0.01 then Exit;
        if testNadb(ZA_ZW_ZASL_SHIFR) then
           begin
                ShowMessage(name_Serv(nsrv)+' '+IntToStr(Curr_Person^.tabno)+' '+trim(curr_Person.fio));
                Inc(cntRec);
                Exit;
           end;
        if testNadb(ZA_STEP_SHIFR) then
           begin
                ShowMessage(name_Serv(nsrv)+' '+IntToStr(Curr_Person^.tabno)+' '+trim(curr_Person.fio));
                Inc(cntRec);
                Exit;
           end;
        if testNadb(ZA_ZWAN_SHIFR) then
           begin
                ShowMessage(name_Serv(nsrv)+' '+IntToStr(Curr_Person^.tabno)+' '+trim(curr_Person.fio));
                Inc(cntRec);
                Exit;
           end;
   end;

begin
     NMES_Sav:=NMES;
     NSRV_Sav:=NSRV;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_SERV;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     SC:=0;
     cntRec:=0;
     for I_NSRV:=1 to COUNT_SERV do
         begin
              Sc:=Sc+1;
              ProgressBar1.Position:=Sc;
              NSRV:=I_NSRV;
              mkflnm;
              Label1.Caption:=Name_Serv(NSRV);
              Application.ProcessMessages;
              if not FileExists(fninf) then Continue;
              GetInf(False);
              Curr_Person:=Head_Person;
              while (Curr_Person<>NIl) do
               begin
                    TestPersonNadbAbsent(Curr_Person);
                    Curr_Person:=Curr_Person^.Next;
               end;
              EMPTY_ALL_PERSON;

         end;
     if cntRec=0 then
        begin
             Label1.Caption:='Не найдено отсутствующих надбавок';
             Application.ProcessMessages;
        end;
     NMES:=NMES_Sav;
     NSRV:=NSRV_Sav;
     MKFLNM;
     GETINF(TRUE);

end;

end.
