unit UFormMakeRusPersForMonthYear;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFormMakeRusPersForMonthYear = class(TForm)
    ProgressBar1: TProgressBar;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    LabelPodr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure MakeRusPersForMonthYear(y:integer;m:integer);
    function checkExistsRusPersForMonthYear(y:integer;m:integer):boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeRusPersForMonthYear: TFormMakeRusPersForMonthYear;

implementation

{$R *.dfm}
 USes DateUtils,ScrDef,scrio,ScrUtil,USQLUnit,uFormWait,
      uFormEditRusPersHat;
 type PRec=^TRec;
      TRec=record
            tabno:Integer;
            summa:Real;
           end;
 var list:TList;

procedure TFormMakeRusPersForMonthYear.MakeRusPersForMonthYear(y:integer;m:integer);
 var savNSRV:Integer;
     savNMES:Integer;
     i_nsrv:integer;
     curr_person:PERSON_PTR;
     shifrIdHat:Integer;
     shifrIdDet:Integer;
  procedure ExportToDb;
   var
      SQLStmnt:WideString;
      v:Variant;
      i:Integer;
      tabno:Integer;
      SNILS,inn,fam,Nam,otc,summaS,fio:shortstring;
      summa:Double;
   begin
      FormWait.Show;
      Application.ProcessMessages;
      SQLStmnt:='select MAX(shifrid) from  tb_rus_pers_hat';
      v:=SQLQueryValue(SQLStmnt);
      if VarIsNull(v) then
         shifrIdhat:=0
      else
         shifridHat:=v;
      Inc(shifrIdHat);
      SQLStmnt:='insert into tb_rus_pers_hat(shifrid,y,m) values ('+IntToStr(shifridHat)+','+IntToStr(y)+' ,'+IntToStr(m)+')';
      SQLExecute(SQLStmnt);
      SQLStmnt:='select MAX(shifrid) from  tb_rus_pers_det';
      v:=SQLQueryValue(SQLStmnt);
      if VarIsNull(v) then
         shifrIddet:=0
      else
         shifridDet:=v;
      ProgressBar1.Min:=0;
      ProgressBar1.Max:=list.Count;
      ProgressBar1.Position:=0;
      Application.ProcessMessages;
      for i:=0 to list.Count-1 do
          begin
               tabno := PRec(list.Items[i])^.tabno;
               summa := PRec(list.Items[i])^.summa;
               SQLStmnt:='select first 1 fam,nam,otc,snils,inn  from tb_1c_kadry where tabno='+IntToStr(tabno);
               v:=SQLQueryRecValues(SQLStmnt);
               if varisnull(v) then
                  Continue;
               if not VarIsArray(v) then
                  Continue;
               if VarIsNull(v[0]) then
                  fam:=' '
               else
                  fam:=v[0];
               if VarIsNull(v[1]) then
                  nam:=' '
               else
                  nam:=v[1];
               if VarIsNull(v[2]) then
                  otc:=' '
               else
                  otc:=v[2];
               if VarIsNull(v[3]) then
                  snils:=' '
               else
                 SNILS:=v[3];
               if VarIsNull(v[4]) then
                  inn:=' '
               else
                  inn:=v[4];
               fio:=GetFullRusFioPerson(tabno);
               if fam=' ' then
                  begin
                       SplitFIO(fio,fam,Nam,otc);
                       fam:=AnsiUpperCase(fam);
                       nam:=AnsiUpperCase(nam);
                       otc:=AnsiUpperCase(otc);
                  end;
               LabelPodr.Caption:=fio;
               ProgressBar1.StepIt;
               Application.ProcessMessages;
               inc(shifrIdDet);
               summas:=FormatFloatPoint(summa);
               SQlSTmnt:='insert into tb_rus_pers_det (SHIFRID,SHIFRIDOWNER,TABNO,SUMMA,FAM,NAM,OTC,INN,SNILS,FIO,PRIZNAK_ANULLIR) '+
                         ' values('+IntToStr(shifriddet)+','+inttostr(shifridhat)+','+IntToStr(tabno)+','+summaS+
                         ','''+fam+''','''+nam+''','''+otc+''','''+inn+''','''+snils+''','''+fio+''',0)';
               SQLExecute(SQLStmnt);
          end;
      SQLStmnt:='select sum(summa),count(*) from tb_rus_pers_det where shifridowner='+intToStr(shifrIdHat);
      v:=SQLQueryRecValues(SQLStmnt);
      if VarIsArray(v) then
         begin
              summa:=v[0];
              i:=v[1];
              summas:=FormatFloatPoint(summa);
              SQLStmnt:='Update tb_rus_pers_hat set summa='+summaS+', nmbofrec='+IntToStr(i);
              SQLExecute(SQLStmnt);
         end;
      FormWait.Hide;
      FormEditRusPersHat.dsRusPersHat.Close;
      FormEditRusPersHat.dsRusPersHat.Open;
      Application.ProcessMessages;

   end;
  function getSummaAdd(curr_person:Person_ptr):Real;
    var summa:Real;
        curr_add:ADD_PTR;
    begin
         summa := 0;
         curr_add:=curr_person^.ADD;
         while (curr_add<>nil) do
          begin
               if Abs(curr_add^.SUMMA)>0.01 then
                  summa:=summa+curr_add^.SUMMA;
               curr_add:=curr_add^.NEXT;
          end;
         getSummaAdd:=summa;
    end;
  procedure addPersonToList(curr_person:person_Ptr);
   var i:Integer;
       finded:boolean;
       PInt:PInteger;
       rec:PRec;
       summa:Real;
    begin
         summa:=getSummaAdd(curr_person);
         if Abs(summa)<0.01 then Exit;
         finded:=False;
         if List.Count>0 then
            begin
                 for i:=0 to List.Count-1 do
                     begin
                          if PRec(List.Items[i])^.tabno=curr_person^.tabno then
                             begin
                                  PRec(List.Items[i])^.summa:=PRec(List.Items[i])^.summa+summa;
                                  finded:=True;
                                  Break;
                             end;
                     end;
            end;
       if not finded then
          begin
             New(Rec);
             Rec^.tabno:=curr_person^.tabno;
             Rec^.summa:=summa;
             List.Add(Rec);
          end;
    end;

 begin
      savNSRV:=NSRV;
      savNMES:=NMES;
      EMPTY_ALL_PERSON;
      list:=TList.Create;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      ProgressBar1.Step:=1;
      for i_NSRV:=1 to Count_Serv do
        begin
             ProgressBar1.StepIt;
             LabelPodr.Caption:=Name_Serv(i_NSRV);
             Application.ProcessMessages;
             NSRV:=i_NSRV;
             mkflnm;

             if not FileExists(fninf) then
                Continue;
             GETINF(false);
             curr_person:=HEAD_PERSON;
             while (curr_person<>nil) do
               begin
                    addPersonToList(curr_person);
                    curr_person:=curr_person^.NEXT;
               end;
             EMPTY_ALL_PERSON;
        end;
      if list.count>0 then
         exportToDB
      else
         ShowMessage('Нет сотрудников для формирования NO_PERSSVFL');
      list.Free;
      list:=nil;
      NSRV:=savNSRV;
      NMES:=savNMES;
      MKFLNM;
      GETINF(true);

 end;
procedure TFormMakeRusPersForMonthYear.BitBtn1Click(Sender: TObject);
var
  y:Integer;
  m:Integer;
begin
     y:=YEAROF(DateTimePicker1.Date);
     m:=MonthOf(DateTimePicker1.Date);
     if not checkExistsRusPersForMonthYear(y,m) then
        Exit;
     BitBtn1.Enabled:=False;
     Application.ProcessMessages;
     MakeRusPersForMonthYear(y,m);
     Self.Close;
end;

procedure TFormMakeRusPersForMonthYear.FormCreate(Sender: TObject);
begin
     DateTimePicker1.Date:=EncodeDate(CURRYEAR,NMES,1);
     DateTimePicker1.MinDate:=EncodeDate(CURRYEAR,1,1);
     DateTimePicker1.MaxDate:=EncodeDate(CURRYEAR,nmes,1);
end;

function TFormMakeRusPersForMonthYear.checkExistsRusPersForMonthYear(y:integer;m:integer):boolean;
 var retval:Boolean;
     SQLStmnt:string;
     v:Variant;
     shifrId:Integer;
 begin
      retVal:=True;
      SQLStmnt:='select first 1 shifrid from tb_rus_pers_hat where y='+intToStr(y)+' and m='+IntToStr(m);
      v:=SQLQueryValue(SQLStmnt);
      if not VarIsNull(v) then
      if VarIsNumeric(v) then
         begin
              shifrId:=v;
              if shifrId>0 then
                 begin
                      if YesNo('Удалить старые данные?') then
                         begin
                              SQLStmnt:='DELETE FROM TB_RUS_PERS_HAT WHERE Y='+IntToStr(y)+' and m='+intToSTr(m);
                              SQLExecute(SQLStmnt);
                         end
                      else
                          retVal:=False;   
                 end;
         end;
      checkExistsRusPersForMonthYear:=retVal;
 end;



procedure TFormMakeRusPersForMonthYear.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

end.
