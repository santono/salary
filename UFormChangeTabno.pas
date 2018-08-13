unit UFormChangeTabno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc;

type
  TFormChangeTabno = class(TForm)
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    LabelNmes: TLabel;
    LabelPodr: TLabel;
    cxCalcEditOld: TcxCalcEdit;
    cxCalcEditNew: TcxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
       tabnoOld:integer;
       tabnoNew:integer;
       procedure moveInFiles;
  public
    { Public declarations }
  end;

var
  FormChangeTabno: TFormChangeTabno;

implementation
 uses ScrDef,ScrIo,ScrUtil,uSQLUnit,uFormWait;

{$R *.dfm}

procedure TFormChangeTabno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormChangeTabno.FormCreate(Sender: TObject);
begin
     LabelNmes.Caption:='';
     LabelPodr.Caption:='';
end;

procedure TFormChangeTabno.BitBtn1Click(Sender: TObject);
 var iErr,iVal:integer;
begin
     Val(cxCalcEditOld.Text,iVal,iErr);
     if iErr>0 then
        begin
             showMessage('Неверно указан исходный табльный номер. '+cxCalcEditOld.Text);
             exit;
        end;
     if not ((iVal>0) and (iVal<30000)) then
        begin
             showMessage('Неверно указан исходный табльный номер. '+IntToStr(iVal));
             exit;
        end;
     tabnoOld:=iVal;
     Val(cxCalcEditNew.Text,iVal,iErr);
     if iErr>0 then
        begin
             showMessage('Неверно указан новый табльный номер. '+cxCalcEditOld.Text);
             exit;
        end;
     if not ((iVal>0) and (iVal<30000)) then
        begin
             showMessage('Неверно указан новый табльный номер. '+IntToStr(iVal));
             exit;
        end;
     tabnoNew:=iVal;
     moveInFiles;
end;

procedure TFormChangeTabno.moveInFiles;
 var nmesTemp,nsrvTemp,flowMonthTemp:integer;
     i_nsrv,i_nmes:integer;
     iCount:integer;
     needPut:boolean;
     Curr_person:Person_ptr;
     SQLStmnt:String;
 begin
      nmesTemp:=NMES;
      nsrvTemp:=NSRV;
      flowMonthTemp:=FLOW_MONTH;
      EMPTY_ALL_PERSON;
      ProgressBar1.Min:=0;
      ProgressBar1.Max:=12;
      ProgressBar1.Step:=1;
      iCount:=0;
      for i_nmes:=1 to 12 do
          begin
               ProgressBar2.Min:=0;
               ProgressBar2.Max:=count_serv;
               ProgressBar2.Position:=0;
               ProgressBar2.Step:=1;
               labelNmes.Caption:=getMonthRus(i_nmes);
               ProgressBar1.StepIt;
               Application.ProcessMessages;
               nmes:=i_nmes;
               FLOW_MONTH:=NMES;
               for i_nsrv:=1 to count_serv do
                   begin
                        LabelPodr.Caption:=name_serv(i_nsrv);
                        ProgressBar2.StepIt;
                        Application.ProcessMessages;
                        nsrv:=i_nsrv;
                        mkflnm;
                        if not fileexists(fninf) then continue;
                        getinf(true);
                        needPut:=false;
                        curr_person:=head_person;
                        while (curr_person<>nil) do
                           begin
                                if (curr_person^.Tabno=tabnoOld) then
                                   begin
                                        inc(iCount);
                                        needPut:=true;
                                        curr_Person^.tabno:=tabnoNew;
                                   end;
                                curr_person:=curr_person^.next;
                           end;
                        if needPut then
                           putInf;
                        empty_all_person;
                   end;

          end;
      if iCount>0 then
         ShowMessage('Изменено '+intToStr(iCount)+' записей.')
      else
         ShowMessage('Не найдено записей с табельным номером '+intToStr(tabnoOld));
      FormWait.Show;
      Application.ProcessMessages;
      SQLStmnt:='update fcn set tabno='+intToStr(tabnoNew)+' where tabno='+intToStr(tabnoOld);
      SQLExecute(SQLStmnt);
      SQLStmnt:='update fud set tabno='+intToStr(tabnoNew)+' where tabno='+intToStr(tabnoOld);
      SQLExecute(SQLStmnt);
      SQLStmnt:='update fadd set tabno='+intToStr(tabnoNew)+' where tabno='+intToStr(tabnoOld);
      SQLExecute(SQLStmnt);
      SQLStmnt:='update person set tabno='+intToStr(tabnoNew)+' where tabno='+intToStr(tabnoOld);
      SQLExecute(SQLStmnt);
      setArc;
      SQLStmnt:='update fcn set tabno='+intToStr(tabnoNew)+' where tabno='+intToStr(tabnoOld);
      SQLExecute(SQLStmnt);
      SQLStmnt:='update fud set tabno='+intToStr(tabnoNew)+' where tabno='+intToStr(tabnoOld);
      SQLExecute(SQLStmnt);
      SQLStmnt:='update fadd set tabno='+intToStr(tabnoNew)+' where tabno='+intToStr(tabnoOld);
      SQLExecute(SQLStmnt);
      SQLStmnt:='update person set tabno='+intToStr(tabnoNew)+' where tabno='+intToStr(tabnoOld);
      SQLExecute(SQLStmnt);
      setSal;
      FormWait.Hide;
      Application.ProcessMessages;
      FLOW_MONTH:=flowMonthTemp;
      nmes:=nmesTemp;
      nsrv:=nsrvTemp;
      mkflnm;
      getinf(true);

 end;
end.
