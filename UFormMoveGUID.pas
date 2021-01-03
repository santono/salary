{$WARNINGS OFF}
{$HINTS OFF}
unit UFormMoveGUID;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery;

type
  TFormMoveGUID = class(TForm)
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    LabelFIO: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pFIBQueryGUID: TpFIBQuery;
    pFIBTransactionGUID: TpFIBTransaction;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMoveGUID: TFormMoveGUID;

implementation
 uses ufibmodule,scrio,scrutil,scrdef;

{$R *.dfm}

procedure TFormMoveGUID.BitBtn1Click(Sender: TObject);
 var WantedShifr : integer;
     S           :  string;
     i           : integer;
     savnsrv     : integer;
     Curr_Person : Person_ptr;
     Curr_Cn     : Cn_ptr;
     SQLStmnt    : string;
     i_nsrv      : integer;
     CntDeleted  : integer;
     GUIDS       : string;
     yv,mv       : integer;
begin
    yv:=Work_Year_Val;
    mv:=nmes;
    if not YesNo('Перенести индентификаторы за '+GetMonthRus(mv)+' '+IntToStr(yv)+'?') then exit;
    ProgressBar1.Min      := 0;
    ProgressBar1.Max      := Count_Serv;
    ProgressBar1.Position := 0;
    savnsrv               := nsrv;
    putinf;
    CntDeleted            := 0;
    pFIBQueryGUID.Transaction.StartTransaction;
    EMPTY_ALL_PERSON;
    for i_nsrv:=1 to count_serv do
        begin
             nsrv:=i_nsrv;
             mkflnm;
             ProgressBar1.Position := i_nsrv;
             LabelPodr.Caption:=name_serv(nsrv);
             Application.ProcessMessages;
             if not fileexists(fninf) then continue;
             getinf(true);
             curr_Person:=head_Person;
             while (curr_person<>nil) do
              begin
                   LabelFio.Caption:=Curr_Person^.Fio;
                   Curr_Cn:=Curr_Person^.CN;
                   while (Curr_Cn<>Nil) do
                    begin
                         if Curr_Cn^.Shifr=GUIDShifr+Limit_Cn_Base then
                            begin
                                 inc(CntDeleted);
                                 GuidS:=FormatGUID(Curr_Cn^.Prim_1,Curr_Cn^.SUmma,Curr_Cn^.Flow_Summa,Curr_Cn^.Limit_Summa);
                                 SQLStmnt:='update fcn set prim_1='''+GUIDS+''' where tabno='+inttostr(Curr_Person^.tabno)+' and summa='+FormatFloatPoint(Curr_Cn^.Summa)+
                                           ' and year_vy='+inttostr(yv)+' and month_vy='+inttostr(mv);
                                 if pFIBQueryGUID.Open then
                                    pFIBQueryGUID.Close;
                                 pFIBQueryGUID.SQL.Clear;
                                 pFIBQueryGUID.SQL.Add(SQLStmnt);
                                 pFIBQueryGUID.ExecQuery;
                                 pFIBQueryGUID.Close;
                            end;
                         Curr_Cn:=Curr_Cn^.Next;
                    end;
                   Curr_Person:=Curr_Person^.Next;
              end;
   //          putinf;
             EMPTY_ALL_PERSON;
       end;
    pFIBQueryGUID.Transaction.Commit;
    if CntDeleted>0 then
       ShowMessage('Перенесено '+IntToStr(CntDeleted)+' строк')
    else
       ShowMessage('Строк с указанным шифром не найдено');
    nsrv:=savnsrv;
    mkflnm;
    getinf(true);

end;

end.
