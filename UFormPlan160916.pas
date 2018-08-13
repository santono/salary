unit UFormPlan160916;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, frxClass, frxDBSet, DB, DBClient,
  frxExportRTF, frxExportXLS;

type
  TFormPlan160916 = class(TForm)
    pb1: TProgressBar;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dsTest: TClientDataSet;
    dsTestshifrPod: TIntegerField;
    dsTesttabno: TIntegerField;
    frxrprt1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dsTestsumma: TFloatField;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    dsTestsummaOtp: TFloatField;
    dsTestfio: TStringField;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure frxrprt1GetValue(const VarName: String; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
      NmbTot,
      NmbLt2978,
      NmbFr2979To5000,
      NmbFr5000To6000,
      NmbFr6000To7000,
      NmbFr7000To8000,
      NmbGt8000:Integer;

      procedure makeTesting;
  public
    { Public declarations }
  end;

var
  FormPlan160916: TFormPlan160916;
  type prec=^trec;
       trec=record
            tabno     : Integer;
            summa     : Real;
            summaOtp  : Real;
            shifrpod  : Integer;
            isKompens : Boolean;
           end;

implementation
  uses ScrDef,ScrUtil,scrio, UFibModule,UFormProgress,ScrNalog,
  FIBDatabase,uFormWait,UFormSelPKG,ScrLists;
  var List : TList;


  procedure AddPersonToList(tabno:Integer;summa:Real);
    var finded : Boolean;
        rec    : prec;
        i      : Integer;
    begin
          finded:=False;
          if List.count>0 then
             for i:=0 to List.Count-1 do
                 begin
                      if prec(List.Items[i]).tabno=TABNO then
                         begin
                              prec(List.Items[i]).summa:=prec(List.Items[i]).summa+SUMMA;
                              finded:=True;
                              break
                         end;
                 end;
          if not finded then
             begin
                  New(rec);
                  rec.tabno    := tabno;
                  rec.summa    := SUMMA;
                  rec.shifrpod := NSRV;
                  rec.summaOtp := 0;
                  rec.isKompens := false;
                  list.Add(rec);
             end;
    end;

 {$R *.dfm}

procedure TFormPlan160916.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormPlan160916.makeTesting;
  var tmpNMES , tmpNSRV , i_nsrv , i : Integer;
      Curr_Person : PERSON_PTR;
      Curr_Add    : Add_Ptr;
      Count       : Integer;
      fio         : string;
      v           : Variant;
      SQLStmnt    : WideString;
      S  : string;
      summa,minsalsumma,summaOtp:Real;
      oo:real;
  begin
       if isSVDN then
          Exit;
       if NameServList.CountSelected<1 then
          begin
               ShowMessage('Не выбраны подразделения');
               Exit;
          end;
       tmpNMES := NMES;
       tmpNSRV := NSRV;
       putinf;
       while HEAD_PERSON<>nil do DEL_PERSON(head_person);
       pb1.Max      := Count_Serv;
       pb1.Min      := 0;
       pb1.Position := 0;
       COUNT        := 0;
       list   := TList.Create;
       for i_nsrv:=1 to Count_Serv do
           begin
                pb1.Position := i_nsrv ;
                lbl1.Caption := Name_Serv(i_nsrv);
                Application.ProcessMessages ;
                nsrv:=i_nsrv;
                if not NameServList.IsSelected(i_nsrv) then
                   Continue;

    //            IF NSRV IN [121,105,105,140] THEN CONTINUE;
    //            IF (NSRV>150) AND (NSRV<169) then CONTINUE;
                mkflnm;
                if not FileExists(fninf) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (Curr_Person<>Nil) do
                  begin
                       if Curr_person^.tabno=5636 then
                          oo:=22;
                       FILL_STANDARD_TABEL_PERSON(Curr_Person);
                       oo:=work_day(1,31,curr_person);
                       if oo<>22 then
                          oo:=22;
                       while (curr_person^.ADD<>nil) do DEL_ADD(curr_person^.add,curr_person);
                       CALC_NAUD_PERSON_WITHOUT_UD(curr_person,31);
                       summa:=getSummaAddForPerson(Curr_person);
                       AddPersonToList(Curr_Person^.TABNO,summa);
                       Curr_Person:=Curr_Person.NEXT;
                  end;
                while HEAD_PERSON<>nil do DEL_PERSON(head_person);

           end;
       if List.Count>0 then
          begin
              FormWait.Show;
              Application.ProcessMessages;

              SQLStmnt:='delete from TB_PLAN_16_09_2016';
              fib.pFIBDatabaseSal.Execute(SQLStmnt);
              for i:=0 to list.count-1 do
                  begin
                       Summa:= prec(List.Items[i]).summa;
                       S:=Format('%12.2f',[summa]);
                       s:=ReplChar(s,',','.');
                       SQLStmnt:='insert into TB_PLAN_16_09_2016 (TABNO,SUMMA,shifrpod) VALUES('+intToSTr( prec(List.Items[i]).tabno)+','+s+','+inttoStr(prec(List.Items[i]).shifrpod)+')';
                       fib.pFIBDatabaseSal.Execute(SQLStmnt);
                  end;
              for i:=0 to List.Count-1 do
                  Dispose(pRec(List.Items[i]));
              List.Free;
              SQLStmnt:='DELETE FROM tb_plan_16_09_2016 WHERE SUMMA < 0.1';
              FIB.pFIBDatabaseSal.Execute(SQLStmnt);
              SQLStmnt:='select COUNT(*),';
              SQLStmnt:=Trim(SQLStmnt)+'SUM(CASE WHEN SUMMA BETWEEN 0 AND 2978.99 THEN 1 ELSE 0 END),';
              SQLStmnt:=Trim(SQLStmnt)+'SUM(CASE WHEN SUMMA BETWEEN 2979 AND 4999.99 THEN 1 ELSE 0 END),';
              SQLStmnt:=Trim(SQLStmnt)+'SUM(CASE WHEN SUMMA BETWEEN 5000 AND 5999.99 THEN 1 ELSE 0 END),';
              SQLStmnt:=Trim(SQLStmnt)+'SUM(CASE WHEN SUMMA BETWEEN 6000 AND 6999.99 THEN 1 ELSE 0 END),';
              SQLStmnt:=Trim(SQLStmnt)+'SUM(CASE WHEN SUMMA BETWEEN 7000 AND 7999.99 THEN 1 ELSE 0 END),';
              SQLStmnt:=Trim(SQLStmnt)+'SUM(CASE WHEN SUMMA BETWEEN 8000 AND 10000000.99 THEN 1 ELSE 0 END)';
              SQLStmnt:=Trim(SQLStmnt)+' from tb_plan_16_09_2016 a';
              v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
              NmbTot:=0;
              NmbLt2978:=0;
              NmbFr2979To5000:=0;
              NmbFr5000To6000:=0;
              NmbFr6000To7000:=0;
              NmbFr7000To8000:=0;
              NmbGt8000:=0;

              if VarIsArray(v) then
                 begin
                     if VarIsNumeric(v[0]) then
                        NmbTot:=v[0];
                     if VarIsNumeric(v[1]) then
                        NmbLt2978:=v[1];
                     if VarIsNumeric(v[2]) then
                        NmbFr2979To5000:=v[2];
                     if VarIsNumeric(v[3]) then
                        NmbFr5000To6000:=v[3];
                     if VarIsNumeric(v[4]) then
                        NmbFr6000To7000:=v[4];
                     if VarIsNumeric(v[5]) then
                        NmbFr7000To8000:=v[5];
                     if VarIsNumeric(v[6]) then
                        NmbGt8000:=v[6];
                 end;
              FormWait.Hide;
              Application.ProcessMessages;

              frxrprt1.ShowReport;
          end
        //  ShowMessage('Найдено '+intToStr(Count)+' несоответствий')
       else
          ShowMessage('Не найдено сотрудников ');
       NMES := tmpNMES;
       NSRV := tmpNSRV;
       mkflnm;
       getInf(true);

  end;


procedure TFormPlan160916.btn1Click(Sender: TObject);
begin
     makeTesting;
     Close;
end;

procedure TFormPlan160916.frxrprt1GetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthRus(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          Value:=IntToStr(CURRYEAR)+' г.'
      else
      if (Trim(UPPER_STRING(VarName))='NMBTOT') then
          Value:=IntToStr(NmbTot)
      else
      if (Trim(UPPER_STRING(VarName))='NMBBEF2978') then
          Value:=IntToStr(NmbLt2978)
      else
      if (Trim(UPPER_STRING(VarName))='NMBFR2979TO5000') then
          Value:=IntToStr(NmbFr2979To5000)
      else
      if (Trim(UPPER_STRING(VarName))='NMBFR5000TO6000') then
          Value:=IntToStr(NmbFr5000To6000)
      else
      if (Trim(UPPER_STRING(VarName))='NMBFR6000TO7000') then
          Value:=IntToStr(NmbFr6000To7000)
      else
      if (Trim(UPPER_STRING(VarName))='NMBFR7000TO8000') then
          Value:=IntToStr(NmbFr7000To8000)
      else
      if (Trim(UPPER_STRING(VarName))='NMBGT8000') then
          Value:=IntToStr(NmbGt8000);
end;

procedure TFormPlan160916.FormCreate(Sender: TObject);
begin
      lbl1.Caption:='';
      if isLNR then
         begin
              btn1.Show;
              btn1.Enabled:=True;
         end
      else
         begin
              btn1.Hide;
              btn1.Enabled:=false;
         end;


end;



  





procedure TFormPlan160916.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

end.
