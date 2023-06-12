unit UFormGener;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFormGener = class(TForm)
    BitBtnStart : TBitBtn;
    BitBtnClose : TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    cbNeedArc: TCheckBox;
    Panel1: TPanel;
    LabelNextMonth: TLabel;
    LabelDC: TLabel;
    cbList: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnStartClick(Sender: TObject);
  private
    wantedShifrPKG:integer;
    procedure moveDAYS;
    procedure moveDataToArchive;
    procedure makeGenerNewMonth;
    procedure makeRecalcNalogi;
    procedure makeSetUpLgotniki;
    procedure makeNextData;
    function makeArchives(M:INTEGER=0):boolean;
    procedure GetFromDay(m:integer;var d5,d6,c:integer);
    procedure SelectLine;
    function getShifrPKGFromComboBox:integer;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGener: TFormGener;

implementation
  uses scrutil,UFormImportDayTxt,UToSQL, UFormRecalcNalCurr,UFormGen,ScrDef,ScrIni,
  UFormMakeOtpTableFromSQL, FormMakeAllChainU,uFormWait,
  UFormClearBolnGenerators, UFibModule, UFormSetUpLgotniki;

{$R *.dfm}

procedure TFormGener.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action := caFree;
end;

procedure TFormGener.GetFromDay(m:integer;var d5,d6,c:integer);
 var i   : integer;
     FName     : string;
     Dev       : TextFile;
     dummy:integer;
 begin
      FName:=CDIR+'DAY.TXT';
      if not FileExists(FName) then
         begin
              ShowMessage('Нет файла рабочих дней '+FName);
              Exit;
         end;
      AssignFile(Dev,FName);
      reset(dev);
      for i:=1 to 12 do
          begin
              if i<>m then
                 begin
                     readln(dev);
                     continue;
                 end;
                 read(dev,d5,d6,dummy,dummy,c);
                 break;
          end;
      CloseFile(dev);

 end;

procedure TFormGener.FormCreate(Sender: TObject);
 var m,y:integer;
     c,d5,d6:integer;
begin
     Caption:='Генерация данных за '+getNameNextData;
     Label11.Caption:='. . . ';
     Label12.Caption:='. . . ';
     Label13.Caption:='. . . ';
     Label14.Caption:='. . . ';
     Label15.Caption:='. . . ';
     cbNeedArc.Checked:=false;
     getnextmy(m,y);
     if isSVDN then
       LabelNextMonth.Caption:='Генерация данных для перехода на '+trim(getMonthUkr(M))+' '+intToStr(y)+' р.'
     else
       LabelNextMonth.Caption:='Генерация данных для перехода на '+trim(getMonthRus(M))+' '+intToStr(y)+' г.';
     GetFromDay(m,d5,d6,c);
     wantedShifrPKG:=66;
     if isSVDN then
        LabelDC.Caption:='Рабочих дней '+IntToStr(d5)+'. Часов '+IntToStr(c)+'.'
     else
        begin
            LabelDC.Caption:='Рабочих дней: пятидневка - '+IntToStr(d5)+', шестидневка - '+intToStr(d6)+'. Часов '+IntToStr(c)+'.' ;
            wantedShifrPKG:=82;
        end;
     SelectLine;
end;

procedure TFormGener.moveDAYS;
  var Date:TDateTime;
      y,m,d:integer;
  begin
    getNextMY(m,y);
    d:=1;
    Application.CreateForm(TFormImportDayTxt,FormImportDayTxt);
    FormImportDayTxt.Show;
    FormImportDayTxt.DateTimePicker1.DateTime:=EncodeDate(y,m,d);
    FormImportDayTxt.BitBtn1Click(Self);
    FormImportDayTxt.Hide;
    FormImportDayTxt.Close;
  end;
procedure TFormGener.moveDataToArchive;
  var Date:TDateTime;
      y,m,d:integer;
  begin
    getNextMY(m,y);
    d:=1;
    Application.CreateForm(TFormToSQL, FormToSQL);
    FormToSql.TransparentColor:=true;
    FormToSql.TransparentColorValue:=clFuchsia;  // clLime;
    FormToSql.AlphaBlend:=true;
    FormToSQl.AlphaBlendValue:=127;
    FormToSQl.Color:=clSkyBlue;
    FormToSql.Show;
    FormToSql.BitBtn1.Hide;
    FormToSql.BitBtn2.Hide;
    FormToSql.BitBtn3.Hide;
    FormToSql.BitBtn4.Hide;
    FormToSql.BitBtn5.Hide;
    FormToSql.BitBtn6.Hide;
    FormToSql.BitBtn7.Hide;
    FormToSql.BitByn7.Hide;
    FormToSql.BitBtn8.Hide;
    FormToSql.BitBtn9.Hide;
    FormToSql.BitBtnGener.Hide;
    FormToSql.DateTimePickerFr.Enabled := false;
    FormToSql.DateTimePickerTo.Enabled := false;
    FormToSql.CheckBoxNeedIb.Enabled   := false;
    FormToSql.CheckBoxArc.Enabled      := false;
    FormToSql.CheckBoxClear.Enabled    := false;

    Application.ProcessMessages;

    FormToSql.BitBtnGenerClick(Self);
    FormToSql.Hide;
    FormToSql.Close;
  end;
procedure TFormGener.makeGenerNewMonth;
  var SQLSTmnt:string;
  begin
       markPKG66(wantedShifrPKG);
       Application.CreateForm(TFormGen, FormGen);
       FormGen.TransparentColor:=true;
       FormGen.TransparentColorValue:=clFuchsia;  // clLime;
       FormGen.AlphaBlend:=true;
       FormGen.AlphaBlendValue:=127;
       FormGen.Color:=clSkyBlue;
       FormGen.Show;
       FormGen.BitBtn1.Hide;
       FormGen.BitBtn2.Hide;
       FormGen.BitBtn3.Hide;
       FormGen.Button1.Hide;
       FormGen.Button2.Hide;
       FormGen.Label1.Hide;
       FormGen.DateTimePicker1.Hide;
       FormGen.Label3.Hide;
       FormGen.Label4.Hide;
       FormGen.ProgressBar2.Hide;
       FormGen.ProgressBar3.Hide;
       Application.ProcessMessages;
       FormGen.BitBtn1Click(Self);
//       FormGen.Button2Click(Self);
       Application.CreateForm(TFormMakeOtpTableFromSQL, FormMakeOtpTableFromSQL);
       FormMakeOtpTableFromSQL.TransparentColor:=true;
       FormMakeOtpTableFromSQL.TransparentColorValue:=clFuchsia;  // clLime;
       FormMakeOtpTableFromSQL.AlphaBlend:=true;
       FormMakeOtpTableFromSQL.AlphaBlendValue:=127;
       FormMakeOtpTableFromSQL.Color:=clSkyBlue;
       FormMakeOtpTableFromSQL.Show;
       FormMakeOtpTableFromSQL.BitBtn1.Hide;
       FormMakeOtpTableFromSQL.BitBtn2.Hide;
       Application.ProcessMessages;
       FormMakeOtpTableFromSQL.BitBtn1Click(Self);
       if (FormMakeOtpTableFromSQL<>nil) then
       if assigned(FormMakeOtpTableFromSQL) then
          begin
               FormMakeOtpTableFromSQL.Hide;
               FormMakeOtpTableFromSQL.Close;
          end;
       FormGen.Hide;
       FormGen.Close;
       Application.CreateForm(TFormMakeAllChain, FormMakeAllChain);
       FormMakeAllChain.TransparentColor:=true;
       FormMakeAllChain.TransparentColorValue:=clFuchsia;  // clLime;
       FormMakeAllChain.AlphaBlend:=true;
       FormMakeAllChain.AlphaBlendValue:=127;
       FormMakeAllChain.Color:=clSkyBlue;
       FormMakeAllChain.Show;
       FormMakeAllChain.BitBtn1.Hide;
       FormMakeAllChain.BitBtn2.Hide;
       FormMakeAllChain.BitBtn1Click(Self);
       FormMakeAllChain.Hide;
       FormMakeAllChain.Close;
       Application.CreateForm(TFormClearBolnGenerators, FormClearBolnGenerators);
       FormClearBolnGenerators.TransparentColor:=true;
       FormClearBolnGenerators.TransparentColorValue:=clFuchsia;  // clLime;
       FormClearBolnGenerators.AlphaBlend:=true;
       FormClearBolnGenerators.AlphaBlendValue:=127;
       FormClearBolnGenerators.Color:=clSkyBlue;
       FormClearBolnGenerators.Show;
       FormClearBolnGenerators.BitBtn1.Hide;
       FormClearBolnGenerators.BitBtn2.Hide;
       FormClearBolnGenerators.BitBtn1Click(Self);
       FormClearBolnGenerators.Hide;
       FormClearBolnGenerators.Close;
       FormWait.Show;
       SQLStmnt:='delete from TB_C_PERSON where yearvy<>'+intToStr(WORK_YEAR_VAL)+' or monthvy<>'+intToStr(NMES);
       FIB.pFIBDatabaseSal.Execute(SQLStmnt);
       SQLStmnt:='delete from TB_TMP_PERSON where yearvy<>'+intToStr(WORK_YEAR_VAL)+' or monthvy<>'+intToStr(NMES);
       FIB.pFIBDatabaseSal.Execute(SQLStmnt);
       DeleteAllFromTmpBolnTables;
       DeleteAllFromTmpPersonTables;
       DeleteAllFromTmpOtpTables;
       FormWait.Hide;



  end;
procedure TFormGener.makeSetUpLgotniki;
  begin
       if not isLNR then Exit;
       Application.CreateForm(TFormSetUpLgotniki, FormSetUpLgotniki);
       FormSetUpLgotniki.TransparentColor:=true;
       FormSetUpLgotniki.TransparentColorValue:=clFuchsia;  // clLime;
       FormSetUpLgotniki.AlphaBlend:=true;
       FormSetUpLgotniki.AlphaBlendValue:=127;
       FormSetUpLgotniki.Color:=clSkyBlue;
       FormSetUpLgotniki.Show;
       FormSetUpLgotniki.BitBtn1.Hide;
       FormSetUpLgotniki.BitBtn2.Hide;
       Application.ProcessMessages;
       FormSetUpLgotniki.BitBtn1Click(Self);
       FormSetUpLgotniki.Hide;
       FormSetUpLgotniki.Close;
  end;

procedure TFormGener.makeRecalcNalogi;
  begin
       Application.CreateForm(TFormRecalcNalCurr, FormRecalcNalCurr);
       FormRecalcNalCurr.TransparentColor:=true;
       FormRecalcNalCurr.TransparentColorValue:=clFuchsia;  // clLime;
       FormRecalcNalCurr.AlphaBlend:=true;
       FormRecalcNalCurr.AlphaBlendValue:=127;
       FormRecalcNalCurr.Color:=clSkyBlue;
       FormRecalcNalCurr.Show;
       FormRecalcNalCurr.BitBtn1.Hide;
       FormRecalcNalCurr.BitBtn2.Hide;
       FormRecalcNalCurr.BitBtn3.Hide;
       FormRecalcNalCurr.BitBtn4.Hide;
       FormRecalcNalCurr.CheckBoxTN.Hide;
       FormRecalcNalCurr.RadioGroupMode.Enabled:=false;
       Application.ProcessMessages;
       FormRecalcNalCurr.setWantedPKG(wantedShifrPKG);
       FormRecalcNalCurr.BitBtn4Click(Self);
       FormRecalcNalCurr.Hide;
       FormRecalcNalCurr.Close;
       //Корректировка данных для расчета налоговых вычетов
       //по состоянию на чало месяца
  end;
function TFormGener.makeArchives(M:integer=0):boolean;
  var ArcName:string;
      wantedMonth:integer;
  begin
       if (m>0) then
          begin
              arcName:=MakeArchivForData(M);
              if (length(arcName)>6) then
                  ShowMessage('Имя файла архива за '+getMonthRus(M)+' - '+arcName)
              else
                 begin
                    makeArchives:=false;
                    exit;
                 end;
          end
       else
          begin
              arcName:=MakeArchivForData(NMES);
              if (length(arcName)>6) then
                  ShowMessage('Имя файла архива за '+getMonthRus(NMES)+' - '+arcName)
              else
                 begin
                    makeArchives:=false;
                    exit;
                 end;
              wantedMonth:=NMES;
              inc(wantedMonth);
              if wantedMonth>12 then
                 wantedMonth:=1;
              arcName:=MakeArchivForData(wantedMonth);
              if (length(arcName)>6) then
                 ShowMessage('Имя файла архива за '+getMonthRus(wantedMonth)+' - '+arcName)
              else
                 begin
                      makeArchives:=false;
                      exit;
                 end;
          end;
       makeArchives:=true;
  end;
procedure TFormGener.makeNextData;
  var fName,s:string;
      dev:textfile;
      y,m,d:integer;
      WORK_Y:WORD;
      c_name:string;
      ms:string;

  begin
      fname:=cdir+'year.txt';
      getNextMY(m,y);
      WORK_Y:=y;
      FLOW_YEAR:=intToStr(work_y);
      WORK_YEAR:=FLOW_YEAR;
      curryear:=work_y;
      WORK_YEAR_VAL:=CURRYEAR;
      C_NAME:=getMonthRus(m);
      C_NAME:=ansiUpperCase(C_NAME);
      C_FLOW_MONTH:=getMonthRus(m);
      C_FLOW_MONTH[1]:=C_NAME[1];
      FLOW_MONTH:=m;
      NMES:=FLOW_MONTH;
      AssignFile(DEV,Fname);
      rewrite(DEV);
      writeln(DEV,FLOW_YEAR);
      writeln(DEV,WinToDos(C_FLOW_MONTH));
      ms:=IntToStr(m);
      if (m<10) then
         ms:='0'+ms;
      writeln(dev,ms);
      closefile(dev);
      INI_W_DAY;
      INIT_DAY_KOD;
      
  end;
procedure TFormGener.BitBtnStartClick(Sender: TObject);
var  s:string;
     ny,nm:Integer;
begin
     if not YesNo('Начать генерация данных за '+getNameNextData) then
        exit;
     if not yesNo('Архивы за '+getMonthRus(NMES)+' сделаны?') then
        exit;
     nm:=NMES;
     ny:=CURRYEAR;
     getNextMY(nm,ny);
     s:=IntToStr(ny-2000);
     if not yesNo('Файлы DAY.TXT, MONTH'+s+'.TXT и MNTHС'+s+'.TXT подготовлены?') then
        exit;
     if cbNeedArc.Checked  then
        if not makeArchives then Exit;
     wantedShifrPKG:=getShifrPKGFromComboBox;
     if wantedShifrPKG<1 then
        begin
             showMessage('Неверно указана строка для выбора списки подразделений генерации.');
             exit;
        end;
     needHideGenerMessages:=true;
     moveDAYS;
     Label11.Caption:='Готово!';
     Application.ProcessMessages;
     moveDataToArchive;
     Label12.Caption:='Готово!';
     Application.ProcessMessages;
     makeNextData;
     EMPTY_ALL_PERSON;
     Label13.Caption:='Готово!';
     Application.ProcessMessages;
     makeGenerNewMonth;
     Label14.Caption:='Готово!';
     Application.ProcessMessages;
     if isLNR then
        makeSetUpLgotniki;
     makeRecalcNalogi;
     Label15.Caption:='Готово!';
     Application.ProcessMessages;
     needHideGenerMessages:=true;
     if cbNeedArc.Checked  then
        if not makeArchives(NMES) then
           begin
                ShowMessage('Ошшибка создания архива со сгенерированными данными!');
           end;

     ShowMessage('Генерация закончена!.'+^M+' Перегрузите программу!'+^M+' ВНИМАНИЕ!. Текущие данные не сохраняйте!');
     System.Halt;
end;
procedure TFormGener.SelectLine;
var Shifr    : Integer;
    SQLStmnt : string;
    Name     : String;


begin
      SqlStmnt:='SELECT SHIFRID,NAME FROM TB_NAME_PODR_SELECTION_DET WHERE SHIFRIDOWNER=5 ORDER BY shifrid';
      cbList.Clear;
      FIB.pFibQuery.Transaction.StartTransaction;
      FIB.pFibQuery.SQL.Clear;
      FIB.pFibQuery.SQL.Add(SQLStmnt);
      FIB.pFibQuery.ExecQuery;
      while not FIB.pFibQuery.Eof do
       begin
           Shifr := FIB.pFibQuery.Fields[0].AsInteger;
           name  := FIB.pFibQuery.Fields[1].AsString;
           cbList.Items.Add(IntToStr(shifr)+' '+trim(name));
           if (shifr=wantedShifrPKG) then
               cbList.Itemindex:=cbList.Items.Count-1;
           FIB.pFibQuery.Next;
       end;
     FIB.pFibQuery.Close;
     FIB.pFibQuery.Transaction.Commit;
     Application.ProcessMessages;
end;
function TFormGener.getShifrPKGFromComboBox:integer;
    var retVal:integer;
        s,ss:string;
        iVal,i,j,iErr:integer;
    begin
          retVal:=0;
         if (cbList.ItemIndex>=0) then
            begin
                 s:=trim(cbList.Items[cbList.ItemIndex]);
                 ss:='';
                 i:=0;
                 iVal:=0;
                 while (true) do
                  begin
                       if i>=length(s) then
                          begin
                               retVal:=iVal;
                               break;
                          end;
                       inc(i);
                       ss:=ss+s[i];
                       val(ss,j,iErr);
                       if (iErr=0) then
                          begin
                              iVal:=j;
                              retVal:=iVal;
                          end
                       else
                           break;
                  end;
            end;
         getShifrPKGFromComboBox:=retVal;
    end;

end.
