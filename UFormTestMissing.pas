unit UFormTestMissing;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, frxClass, frxDBSet, DB, DBClient;

type
  TFormTestMissing = class(TForm)
    pb1: TProgressBar;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dsTest: TClientDataSet;
    dsTestshifrPod: TIntegerField;
    dsTesttabno: TIntegerField;
    dsTestfio: TStringField;
    frxrprt1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure frxrprt1GetValue(const VarName: String; var Value: Variant);
  private
    { Private declarations }
      isErr: Boolean;
      procedure makeTesting;
      procedure testPodr;
  public
    { Public declarations }
  end;

var
  FormTestMissing: TFormTestMissing;

implementation
  uses ScrDef,ScrUtil,scrio,UFibModule, FIBDatabase;

{$R *.dfm}

procedure TFormTestMissing.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormTestMissing.testPodr;
 var
    curr_Person:PERSON_PTR;
    curr_ud:UD_PTR;
    summa:real;
    cnt,cntBD:Integer;
    SqlStmnt:string;
    v:Variant;
    yp,mp:Integer;
begin
     yp := curryear ;
     mp := nmes      ;
     mp := mp - 1;
     if mp=0 then
        begin
             mp:=12;
             yp:=yp-1;
        end;
     curr_person:=HEAD_PERSON;
     cnt:=0;
     while (Curr_Person<>Nil) do
        begin
             summa:=getSummaUdForPerson(curr_person);
             if Abs(summa)>1 then
                Inc(cnt);
             curr_person:=curr_Person.NEXT;
        end;
     SqlStmnt:='select count(*) from (';
     SQLStmnt:=Trim(SQLStmnt)+'select sum(u.summa) s from fud u';
     SQLStmnt:=Trim(SQLStmnt)+' where u.w_place='+IntToStr(nsrv)+' and u.year_vy='+IntToStr(YP)+' and u.month_vy='+IntToStr(mp);
     SQLStmnt:=Trim(SQLStmnt)+' group by u.tabno  )';
     v:=FIB.pFIBDatabaseSal.QueryValue(SqlStmnt,0);
     cntBd:=0;
     if (VarIsNumeric(v)) then
        cntBd:=v;
     if (cntBD>0) and (cnt=0) then
        begin
            ShowMessage('Проверьте '+name_SERV(nsrv));
            isErr:=True;
        end;


end;

procedure TFormTestMissing.makeTesting;
  var tmpNMES , tmpNSRV,i_nsrv : Integer;
      Curr_Person : PERSON_PTR;
      Curr_Cn     : cn_Ptr;
      Count       : Integer;


  begin
       tmpNMES := NMES;
       tmpNSRV := NSRV;
       putinf;
       while HEAD_PERSON<>nil do DEL_PERSON(head_person);
       pb1.Max      := Count_Serv;
       pb1.Min      := 0;
       pb1.Position := 0;
       COUNT        := 0;
       IsErr        := False;
   //    dsTest.Open;
       for i_nsrv:=1 to Count_Serv do
           begin
                pb1.Position := i_nsrv ;
                lbl1.Caption := Name_Serv(i_nsrv);
                Application.ProcessMessages ;
                nsrv:=i_nsrv;
                mkflnm;
                if not FileExists(fninf) then
                   begin
                        if not mayBeEmptyPodr(nsrv) then
                           begin
                               ShowMessage('Проверьте '+name_SERV(nsrv));
                               isErr:=True;
                           end;       
                        Continue;
                   end;
                getinf(false);
                testPodr;
                EMPTY_ALL_PERSON;

           end;
         if not IsErr  then
            ShowMessage('Несоответсвия не найдено');
  //     if Count>0 then
  //        frxrprt1.ShowReport
        //  ShowMessage('Найдено '+intToStr(Count)+' несоответствий')
   //    else
  //        ShowMessage('Не найдено ошибок ');
  //    dsTest.Close;
       NMES := tmpNMES;
       NSRV := tmpNSRV;
       mkflnm;
       getInf(true);

  end;


procedure TFormTestMissing.btn1Click(Sender: TObject);
begin
     makeTesting;
     Close;
end;

procedure TFormTestMissing.frxrprt1GetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthRus(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          Value:=IntToStr(CURRYEAR)+' г.';
end;

end.
