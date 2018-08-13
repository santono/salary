unit UFormRecalcNight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormRecalcNight = class(TForm)
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
  FormRecalcNight: TFormRecalcNight;

implementation
   uses ScrDef,scrio,USQLUnit,scrutil;

{$R *.dfm}

procedure TFormRecalcNight.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ACtion:=caFree;
end;

procedure TFormRecalcNight.BitBtn1Click(Sender: TObject);
 const id=33;
 var Curr_Person:Person_ptr;
     Curr_Add:ADD_PTR;
     summa:Real;
     SQLStmnt:string;
     i:Integer;
begin
     if not isSVDN then Exit;
     if not (NSRV=10) then
        begin
             Error('Нужно находиться в 10-м подразделении');
             Exit;
        end;
     if (not (nmes=6) and (curryear=2017)) then
        begin
             Error('Перерасчитать можно только в июне 2017 ');
             Exit;
        end;
     curr_person:=HEAD_PERSON;
     while (Curr_Person<>nil) do
       begin
            label1.Caption:=curr_person^.FIO;
            Application.ProcessMessages;
            for i:=1 to 5 do
                begin
                    SQLStmnt:='select first 1 summa from fadd where shifrsta=40 and year_vy=2017 and month_vy='+IntToStr(i)+' and tabno='+intToStr(curr_person^.tabno);
                    summa:=SQLQueryValue(SQLStmnt);
                    if Abs(summa)>0.01 then
                       begin
                            MAKE_ADD(Curr_Add,curr_person);
                            curr_add^.shifr:=DOPL_DO_MIN_SHIFR;
                            curr_add^.SUMMA:=R10(summa);
                            curr_add^.FZP:=curr_add^.SUMMA;
                            curr_add^.PERIOD:=i;
                            curr_add^.WHO:=id
                       end;
                end;
            curr_person:=curr_person^.NEXT;
       end;
     Error('Перерасчет закончен. Посмотрите результаты у каждого сотрудника.');  
end;

end.
