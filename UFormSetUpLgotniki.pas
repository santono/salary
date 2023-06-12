unit UFormSetUpLgotniki;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormSetUpLgotniki = class(TForm)
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure performSQLActions;
    procedure performAllPersons;


  public
    { Public declarations }
  end;

var
  FormSetUpLgotniki: TFormSetUpLgotniki;

implementation

{$R *.dfm}
   Uses ScrDef, ScrUtil, uFormWait, ScrIo, USQLUnit;

procedure TFormSetUpLgotniki.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormSetUpLgotniki.BitBtn1Click(Sender: TObject);
begin
     if not needHideGenerMessages then
     if not YesNo('Выполнить актуализацию данных для расчета налоговых вычетов?') then
        Exit;
     performSQLActions;
     performAllPersons;
end;
procedure TFormSetUpLgotniki.performSQLActions;
var SqlStmnt:string;
    wantedMonth,wantedYear:Integer;
    summaS:string;
begin
     wantedYear:=currentYear;
     wantedMonth:=nmes;
     if (wantedMonth>1) then
        SQLStmnt:='update tb_lgotniki a '+
                  'set summayearlimit=(' +
                  'select sum(summa) from fadd b ' +
                  'where b.tabno=a.tabno ' +
                  'and b.year_vy='+intToStr(wantedYear)+' '+
                  'and b.month_vy<'+intToStr(wantedMonth)+')'
     else
        SQLStmnt:='update tb_lgotniki a '+
                  'set summayearlimit=0.00';
     FormWait.Show;
     Application.ProcessMessages;
     SQLExecute(SQLStmnt);
     SQLStmnt:='update tb_lgotniki set marked=0';
     SQLExecute(SQLStmnt);
     summaS:=FormatFloatPoint(yearLimitForLgoty);
     SQLStmnt:='update tb_lgotniki set enabled=1';
     SQLExecute(SQLStmnt);
     SQLStmnt:='update tb_lgotniki set enabled=0 where coalesce(summayearlimit,0.00)>'+summaS;
     SQLExecute(SQLStmnt);
     FormWait.Hide;
     Application.ProcessMessages;

end;
function validateIdInDb(oldId:Integer;curr_person:person_ptr;curr_cn:cn_ptr):integer;
 var retVal:Integer;
     v,vt:Variant;
     SQLStmnt:string;
     tabno:Integer;
     id:Integer;
     currentId:Integer;
 begin
     if curr_person^.TABNO=13617 then
        id:=0;
     currentId:=oldId;
     retVal:=0;
     validateIdInDb:=retVal;
     SQLStmnt:='select count(*) from tb_lgotniki where id='+intToStr(oldId);
     v:=SQLQueryValue(SQLStmnt);
     if v<>1 then
        begin
             SQLStmnt:='select first 1 coalesce(id,0) from tb_lgotniki where tabno='+intToStr(curr_person^.tabno);
             v:=SQLQueryValue(SQLStmnt);
             if VarIsNull(v) then Exit;
             if not VarIsNumeric(v) then Exit;
             if v<1 then Exit;
             currentId:=v;
             curr_cn^.PRIM:=currentId;
        end;
     SQLStmnt:='select first 1 coalesce(summavy,0.00),coalesce(summayearlimit,0.00),coalesce(enabled,0),coalesce(guid,''''),coalesce(marked,0),coalesce(tabno,0) from tb_lgotniki where id='+intToStr(currentId);
     v:=SQLQueryRecValues(SQLStmnt);
     if VarIsNull(v) then Exit;
     if not VarIsArray(v) then Exit;
     id:=VarArrayHighBound(v,1);
     if VarArrayHighBound(v,1)<5 then Exit;
     if varisnull(v[5]) then
        exit;
     tabno:=v[5];
     if tabno=curr_person^.tabno then
        begin
            validateIdInDb:=currentId;
            Exit;
        end;
     SQLStmnt:='select first 1 coalesce(id,0) from tb_lgotniki where tabno='+intToStr(curr_person^.tabno);
     vt:=SQLQueryValue(SQLStmnt);
     if VarIsNull(vt) then Exit;
     if not VarIsNumeric(vt) then Exit;
     if vt<1 then Exit;
     id:=vt;
     curr_cn^.PRIM:=id;
     retVal:=id;

     validateIdInDb:=retVal;
 end;
procedure TFormSetUpLgotniki.performAllPersons;
 var savnmes,savnsrv:Integer;
     i_nsrv:Integer;
     curr_person:PERSON_PTR;
     maked:Boolean;
  procedure correctLgoPerson(curr_person:person_ptr);
    var Curr_cn:CN_PTR;
        finded:Boolean;
        id,h:Integer;
        SQLStmnt:string;
        v:Variant;
        guidS:string;
    begin
         finded:=false;
         Curr_Cn:=Curr_Person^.Cn;
         while (Curr_Cn<>Nil) do
           begin
                if Curr_Cn^.Shifr=Limit_Cn_Base+LgotyPn2011Shifr then
                if Curr_Cn^.Kod=100                              then
                   begin
                        if curr_person^.tabno=3708 then
                           h:=0;
                        if curr_cn^.PRIM>0 then
                           begin
                                id:=curr_cn^.PRIM;
                           end
                        else
                           begin
                                guidS:=GetGUIDPersonToString(curr_person);
                                SQLStmnt:='select first 1 id from tb_lgotniki where trim(guid)='''+guidS+'''';
                                v:=SQLQueryValue(SQLStmnt);
                                if VarIsNumeric(v) then
                                   begin
                                        id:=v;
                                        Curr_cn^.PRIM:=id;
                                   end
                                else
                                   begin
//                                        ShowMessage('Не найден id для '+intToStr(curr_person^.tabno)+' '+Trim(curr_person^.fio)+' Подразделение='+IntToStr(nsrv));
                                        SQLStmnt:='select first 1 id from tb_lgotniki where tabno='+intToStr(curr_person^.tabno);
                                        v:=SQLQueryValue(SQLStmnt);
                                        if VarIsNumeric(v) then
                                           begin
                                              id:=v; 
                                              Curr_cn^.PRIM:=id;
                                           end
                                        else
                                           begin
                                             curr_cn:=curr_cn^.Next;
                                             Continue;
                                           end;
                                   end;
                           end;
                        id:=validateIdInDb(id,curr_person,curr_cn);
                        if id<1 then
                           begin
                               curr_cn:=curr_cn^.Next;
                               Continue;
                           end;
                        SQLStmnt:='select first 1 coalesce(summavy,0.00),coalesce(summayearlimit,0.00),coalesce(enabled,0),coalesce(guid,''''),coalesce(marked,0),tabno from tb_lgotniki where id='+intToStr(id);
                        v:=SQLQueryRecValues(SQLStmnt);
                        if VarIsArray(v) then
                           begin
            //                 h:=High(v);
            //                 if h=4 then
                             if VarIsNumeric(v[0]) then
                                curr_cn^.SUMMA:=v[0];
                             if VarIsNumeric(v[1]) then
                                curr_cn^.LIMIT_SUMMA:=v[1];
                             if VarIsNumeric(v[2]) then
                             if v[2]<>1 then
                                Curr_cn^.PRIM_1:='Заблокирована'
                             else
                                Curr_cn^.PRIM_1:='Активна';
                             finded:=True;
                             maked:=true;
                             SQLStmnt:='update tb_lgotniki set marked=1 where id='+intToStr(id);
                             SQLExecute(SQLStmnt);
                             Break;
                           end
                        else
                          begin
                             if not needHideGenerMessages then
                                ShowMessage('Не найдена льгота в TB_LGOTNIKI для '+intToStr(curr_person^.tabno)+' '+Trim(curr_person^.fio)+' Подразделение='+IntToStr(nsrv));
                          end;
                   end;
                 Curr_Cn:=Curr_Cn^.Next;
           end;

    end;
  procedure setUwolenie;
   //Корректировка уволенных
   var SQLStmnt:string;
       wantedMonth,wantedYear:Integer;
       v:Variant;
   begin
     wantedYear:=currentYear;
     wantedMonth:=nmes;
     SQLStmnt:='select first 1 retval from PR_LGOTNIKI_CORRECT('+intToStr(wantedYear)+','+intToStr(wantedMonth)+')';
     v:=SQLQueryValue(SQLStmnt);
   end;
 begin
      savnmes:=NMES;
      savnsrv:=NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Step:=1;
      for i_nsrv:=1 to Count_Serv do
        begin
             ProgressBar1.StepIt;
             LabelPodr.Caption:=Name_Serv(i_nsrv);
             Application.ProcessMessages;
             nsrv:=i_nsrv;
             MKFLNM;
             if not FileExists(fninf) then
                Continue;
             GETINF(true);
             maked:=False;
             curr_person:=HEAD_PERSON;
             while (curr_person<>nil) do
              begin
                   correctLgoPerson(curr_person);
                   curr_person:=curr_person^.NEXT;
              end;
             if MAKED  then
                PUTINF;
             EMPTY_ALL_PERSON;
        end;
      setUwolenie;
      nmes:=savNMES;
      nsrv:=savNSRV;
      MKFLNM;
      GETINF(true);
 end;

procedure TFormSetUpLgotniki.FormCreate(Sender: TObject);
begin
     LabelPodr.Caption:='';
     Caption:='Актуализация данных по налоговым вычетам за '+GetMonthRus(nmes)+' '+IntToStr(currYear)+' г.';
end;

end.
