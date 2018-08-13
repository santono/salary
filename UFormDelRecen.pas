unit UFormDelRecen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons, ComCtrls;

type
  TFormDelRecen = class(TForm)
    SpinEditYFr: TSpinEdit;
    Label1: TLabel;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDelRecen: TFormDelRecen;

implementation
    uses ScrDef,ScrUtil,UFibModule;
{$R *.dfm}

procedure TFormDelRecen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormDelRecen.BitBtn1Click(Sender: TObject);
var YFr,YTo:Integer;
    SQLStmnt:string;
    Curr_Person:PERSON_PTR;
    RetVal:Variant;
    RetValI:Integer;
    Cnt:Integer;
    Finished:boolean;
begin
     if NSRV<>121 then
        begin
             ShowMessage('Процедура только для рецензентов. Перейдите в 121 подр');
             Exit;
        end;
     if (WORK_YEAR_VAL<>CurrYear) or (FLOW_MONTH<>NMES) then
        begin
             ShowMessage('Процедура только для рецензентов текущего периода.');
             Exit;
        end;
     YFr:=SpinEditYFr.Value;
     Curr_Person:=Head_Person;
     ProgressBar1.Min:=0;
     ProgressBar1.Max:=COUNT_PERSON;
     ProgressBar1.Position:=0;
     ProgressBar1.Step:=1;
     cnt:=0;
     while (Curr_Person<>nil) do
       begin
            Label3.Caption:=Curr_Person^.FIO;
            ProgressBar1.StepIt;
            Application.ProcessMessages;
            retVal:=0;
            SQLStmnt:='select case when exists (select * from fadd where w_place=121 and year_vy>='+IntToStr(YFr)+' and tabno='+IntToStr(Curr_Person^.tabno)+') then 0 else 1 end from rdb$database';
            RetValI:=0;
            try
                RetVal:=FIB.pFIBDatabaseArc.QueryValue(SQLStmnt,0);
                RetValI:=RetVal;
            except
                on e:EVariantTypeCastError do
//                on e:Exception do
                   RetValI:=0;
            end;
            if RetValI=1 then
               begin
                    Curr_Person^.DOLG:='-------';
                    Inc(Cnt);
               end;
            Curr_Person:=Curr_Person^.Next;
       end;
     if Cnt>0 then
     if MessageDlg('Найдено '+IntToStr(Cnt)+' рецензентов без начислений. Удалять?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
        begin
             while (true) do
              begin
                   finished:=True;
                   Curr_Person:=HEAD_PERSON;
                   while (Curr_Person<>Nil) do
                     begin
                          if ((Trim(Curr_Person^.Dolg)='-------') and
                              (Length(Trim(Curr_Person^.Dolg))>0)) then
                             begin
                                  DEL_PERSON(Curr_Person);
                                  Finished:=false;
                                  Break;
                             end;
                          Curr_Person:=Curr_Person^.next;
                     end;
                   if Finished then Break;
              end;
             ShowMessage('Удалено '+IntToStr(Cnt)+' резензентов. Не забудьте сохранить подразделение рецензентов на диске');

        end
     else
        ShowMessage('Нет работников без начислений в указанный период.');
end;

end.
