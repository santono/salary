unit UFormPovLNR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFormPovLNR = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    LabelFio: TLabel;
    LabelPodr: TLabel;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure performSettings;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FormPovLNR: TFormPovLNR;

implementation
  uses ScrDef,ScrIo,ScrUtil, UFormSelPKG,SCRLISTS;

{$R *.dfm}

procedure TFormPovLNR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormPovLNR.BitBtn1Click(Sender: TObject);
begin
     if not ((CurrYear=2015) and (nmes=11)) then
        begin
             ShowMessage('Запускается только в ноябре 2015');
             Exit;
        end;

      if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
        
     if not yesNo('Установить разряды и оклады в 11 2015?') THEN
        Exit;
     performSettings;
end;

procedure TFormPovLNR.performSettings;
 var nmesTmp,nsrvTmp,i_nsrv:Integer;
     needPut:boolean;
     curr_person:person_ptr;
     DEVO:TextFile;

     function decodePerson:boolean;
      var retVal:boolean;
          Razr:Integer;
          Oklad,koef:Real;
          ShifrIdDolg:Integer;
      begin
           if CURR_PERSON^.TABNO=5636 then
              retVal:=True;
           retVal:=False;
           shifrIdDolg:=getDolPerson(curr_Person);
           if shifrIdDolg>0 then
           if getRazrOkladByDolg(shifrIdDolg,razr,oklad) then
              begin
                   SetRazrjadPerson(Curr_person,Razr);
                   koef:=GET_KOEF_OKLAD_PERSON(Curr_Person);
                   Curr_person^.Oklad:=r10(Oklad*koef);
                   needPut:=True;
              end
           ELSE
               WRITELN(DEVO,NSRV,' ',CURR_PERSON^.TABNO,' ',CURR_PERSON^.FIO,' ',CURR_PERSON^.DOLG,' ',SHIFRIDDOLG,' ',RAZR,' ',OKLAD:12:2)
           ELSE
               WRITELN(DEVO,NSRV,' ',CURR_PERSON^.TABNO,' ',CURR_PERSON^.FIO,' ',CURR_PERSON^.DOLG,' ',SHIFRIDDOLG);

           decodePerson:=retVal;
      end;
 begin
     nmesTmp:=nmes;
     nsrvTmp:=NSRV;
     putinF;
     LDEL_PERSON;
     ProgressBar1.Min:=0;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Position:=0;
     ReWRITE(DEVO,'D:\PROTPOV.TXT');
     for i_nsrv:=1 to Count_Serv do
      begin
           ProgressBar1.Position:=i_nsrv;
           LabelPodr.Caption:=Name_Serv(i_nsrv);
           Application.ProcessMessages;
           if not NameServList.isSelected(i_NSRV) then
              Continue;
           nsrv:=i_nsrv;
           MKFLNM;
           if not FILEEXIST(FNINF) then Continue;
           needPut:=false;
           GETINF(true);
           curr_Person:=head_person;
           while (curr_person<>nil) do
             begin
                  LabelFio.Caption:=IntToStr(Curr_person^.tabno)+' '+trim(Curr_Person^.fio);
                  Application.ProcessMessages;
                  if DeCodePerson then needPut:=true;
                  Curr_person:=Curr_Person^.NEXT;
             end;
           if needPut then
              PUTINF;
           LDEL_PERSON;

      end;
     CloseFile(DEVO);
     nmes:=nmesTmp;
     NSRV:=nsrvTmp;
     mkflnm;
     GETINF(true);



 end;


procedure TFormPovLNR.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

end.
