{$WARNINGS OFF}
{$HINTS OFF}
unit UFormEkonom;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormEkonom = class(TForm)
    ProgressBarPodr: TProgressBar;
    ProgressBarFio: TProgressBar;
    LabelPodr: TLabel;
    LabelFIO: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBoxBlock: TCheckBox;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);

  private
    procedure CreateSwod;
    procedure CreateSwodAprInMay;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEkonom: TFormEkonom;

implementation
    uses ScrDef,ScrIo,ScrUtil,ScrNalog,UFormView, UFormSelPKG, ScrLists;
{$R *.dfm}


procedure TFormEkonom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

function ExistsOtp(Curr_Person:Person_Ptr):boolean;
 var I:Integer;
 begin
      Result:=False;
      for i:= 1 to 31 do
           if Curr_Person^.Tabel[i]=OTPUSK_BEZ_OPLATY then
              begin
                    Result:=True;
                    Break;
              end
 end;

 function GetNmbOfDayOtp(Curr_Person:Person_Ptr):integer;
 var I,J:Integer;
 begin
      J:=0;
      for i:=1 to 31 do
           if Curr_Person^.Tabel[i]=OTPUSK_BEZ_OPLATY then
              begin
                    J:=J+1;
                  //  Break;
              end;
      GetNmbOfDayOtp:=j;
 end;

 function GetSummaPerson(Curr_Person:Person_Ptr):real;
 var I:Integer;
     a:Real;
     Curr_add:Add_Ptr;
 begin
      A:=0;
      Curr_Add:=Curr_Person^.ADD;
      while (Curr_Add<>nil) do
         begin
             if Curr_Add^.Period=nmes then A:=A+Curr_Add^.SUMMA;
             Curr_Add:=Curr_Add^.NEXT;
         end;
      GetSummaPerson:=A;
 end;

 procedure MakeFullTabel(Curr_Person:Person_Ptr);
 var I:Integer;
 begin
      for i:=1 to 31 do
           if Curr_Person^.Tabel[i]=OTPUSK_BEZ_OPLATY then
              Curr_Person^.Tabel[i]:=JAWKA;

 end;


procedure TFormEkonom.CreateSwod;
 var nmestmp,nsrvtmp:Integer;
     i_nsrv:Integer;
     Curr_Person:PERSON_PTR;
     SummaPersonTot,SummaPersonOtp,
     SummaTot,SummaOtp:Real;
     SummaEk:Real;
     NmbOfDayOtp:Integer;
     Dev:TextFile;
     Fname:String;
     LineNo:Integer;
     I_Person:Integer;
     procedure PrintLine;
      var S,S1:String;
      begin
            Inc(LineNo);
            Str(LineNo:4,s1);
            S:=S1+' ';
            Str(NSRV:3,s1);
            S:=S+S1+' '+copy(GET_IST_NAME(Curr_Person^.Gruppa)+Space(10),1,10);
            Str(Curr_Person^.Tabno:5,s1);
            S:=S+S1+' '+Copy(Curr_Person^.FIO+space(30),1,20)+Copy(Curr_Person^.DOLG+space(10),1,10);
            Str(GET_KOEF_OKLAD_PERSON(Curr_Person):5:2,s1);
            S:=S+S1+' ';
            Str(NmbOfDayOtp:3,s1);
            S:=S+S1+' ';
            Str(SummaPersonOtp:12:2,s1);
            S:=S+S1+' ';
            Str(SummaPersonTot:12:2,s1);
            S:=S+S1+' ';
            Str(SummaPersonTot-SummaPersonOtp:12:2,s1);
            S:=S+S1;
            Writeln(Dev,S);
            SummaTot:=SummaTot + SummaPersonTot;
            SummaOtp:=SummaOtp + SummaPersonOtp;



      end;
 begin
      nmestmp:=NMES;
      nsrvtmp:=NSRV;
      PUTINF;
      progressbarPodr.Max:=Count_Serv;
      ProgressBarPodr.Min:=0;
      ProgressBarPodr.Position:=0;
      progressbarFio.Max:=Count_Serv;
      ProgressBarFio.Min:=0;
      ProgressBarFio.Position:=0;
      while (HEAD_PERSON<>NIl) do DEL_PERSON(Head_Person);
      SummaTot := 0 ;
      SummaOtp := 0 ;
      SummaEK  := 0;
      FName    := CDOC+'Ekonom.txt';
      AssignFile(Dev,Fname);
      Rewrite(Dev);
      LineNo:=0;
      for i_nsrv:=1 to count_serv do
          begin
               nsrv:=i_nsrv;
               ProgressBarPodr.Position:=i_nsrv;
               Application.ProcessMessages;
               MKFLNM;
               if not FileExists(fninf)then Continue;
               LabelPodr.Caption:=Name_Serv(i_nsrv);
               GETINF(false);
               Curr_Person:=HEAD_PERSON;
               progressbarFio.Max:=Count_Person;
               ProgressBarFio.Min:=0;
               ProgressBarFio.Position:=0;
               I_person:=0;
               while (Curr_Person<>Nil) do
                 begin
                       i_person:=I_Person+1;
                       ProgressBarFio.Position:=i_Person;
                       LabelFio.Caption:=Curr_Person^.FIO;
                       Application.ProcessMessages;
                       if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                       if ExistsOtp(Curr_Person) then
                         begin
                              if NSRV=169 then
                              if Curr_Person^.tabno=1356 then
                                 nsrv:=NSRV;
                              NmbOfDayOtp:=GetNmbOfDayOtp(Curr_Person);
                              SummaPersonOtp:=GetSummaPerson(Curr_Person);
                              if Curr_Person^.AUTOMATIC=manual_mode then
                                 begin
                                      if CheckBoxBlock.Checked then
                                         Curr_Person^.AUTOMATIC:=AUTOMATIC_MODE;
                                 end;
                              MakeFullTabel(Curr_Person);
                              CALC_NAUD_PERSON_WITHOUT_UD(CURR_PERSON,31);
                              SummaPersonTot:=GetSummaPerson(Curr_Person);
                              if SummaPersonOtp<SummaPersonTot then
                              if Abs(SummaPersonOtp)>0.01 then
                                 PrintLine;
                         end;
                      Curr_Person:=Curr_Person^.NEXT;
                 end;
               while (HEAD_PERSON<>NIl) do DEL_PERSON(Head_Person);
          end;
//      Str(SummaTot-SummaOtp:12:2,s1);
      Writeln(Dev,'Сумма экономии ',SummaTot-SummaOtp:12:2);
      CloseFile(Dev);
      View(FName);
      nsrv:=nsrvtmp;
      nmes:=nmestmp;
      MKFLNM;
      GETINF(true);
 end;

 function GetSummaPerson04(Curr_Person:Person_Ptr):real;
  var RetVal:real;
      Curr_Add:ADD_PTR;
  begin
       RetVal:=0;
       Curr_Add:=Curr_Person^.ADD;
       while (Curr_Add<>Nil) do
         begin
              if Curr_Add^.PERIOD=4    then
              if Curr_Add^.SUMMA<-0.01 then
                 RetVal:=RetVal+Curr_Add^.SUMMA;
              Curr_Add:=Curr_Add^.NEXT;
         end;
        GetSummaPerson04:=RetVal;

  end;

procedure TFormEkonom.CreateSwodAprInMay;
 var nmestmp,nsrvtmp:Integer;
     i_nsrv:Integer;
     Curr_Person:PERSON_PTR;
     SummaPersonTot,SummaPersonOtp,
     SummaTot,SummaOtp:Real;
     SummaEk:Real;
     NmbOfDayOtp:Integer;
     Dev:TextFile;
     Fname:String;
     LineNo:Integer;
     I_Person:Integer;
     procedure PrintLine;
      var S,S1:String;
      begin
            Inc(LineNo);
            Str(LineNo:4,s1);
            S:=S1+' ';
            Str(NSRV:3,s1);
            S:=S+S1+' '+copy(GET_IST_NAME(Curr_Person^.Gruppa)+Space(10),1,10);
            Str(Curr_Person^.Tabno:5,s1);
            S:=S+S1+' '+Copy(Curr_Person^.FIO+space(30),1,20)+Copy(Curr_Person^.DOLG+space(10),1,10);
            Str(SummaPersonOtp:12:2,s1);
            S:=S+S1;
            Writeln(Dev,S);
            SummaOtp:=SummaOtp + SummaPersonOtp;



      end;
 begin
      nmestmp:=NMES;
      nsrvtmp:=NSRV;
      PUTINF;
      progressbarPodr.Max:=Count_Serv;
      ProgressBarPodr.Min:=0;
      ProgressBarPodr.Position:=0;
      progressbarFio.Max:=Count_Serv;
      ProgressBarFio.Min:=0;
      ProgressBarFio.Position:=0;
      while (HEAD_PERSON<>NIl) do DEL_PERSON(Head_Person);
      SummaTot := 0 ;
      SummaOtp := 0 ;
      SummaEK  := 0;
      FName    := CDOC+'Ekonom.txt';
      AssignFile(Dev,Fname);
      Rewrite(Dev);
      LineNo:=0;
      for i_nsrv:=1 to count_serv do
          begin
               nsrv:=i_nsrv;
               ProgressBarPodr.Position:=i_nsrv;
               Application.ProcessMessages;
               MKFLNM;
               if not FileExists(fninf)then Continue;
               LabelPodr.Caption:=Name_Serv(i_nsrv);
               GETINF(false);
               Curr_Person:=HEAD_PERSON;
               progressbarFio.Max:=Count_Person;
               ProgressBarFio.Min:=0;
               ProgressBarFio.Position:=0;
               I_person:=0;
               while (Curr_Person<>Nil) do
                 begin
                       i_person:=I_Person+1;
                       ProgressBarFio.Position:=i_Person;
                       LabelFio.Caption:=Curr_Person^.FIO;
                       Application.ProcessMessages;
                       SummaPersonOtp:=0;
                       if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                          SummaPersonOtp:=GetSummaPerson04(Curr_Person);
                       if Abs(SummaPersonOtp)>0.01 then
                         begin
                              if NSRV=169 then
                              if Curr_Person^.tabno=1356 then
                                 nsrv:=NSRV;
                              PrintLine;
                         end;
                      Curr_Person:=Curr_Person^.NEXT;
                 end;
               while (HEAD_PERSON<>NIl) do DEL_PERSON(Head_Person);
          end;
//      Str(SummaTot-SummaOtp:12:2,s1);
      Writeln(Dev,'Сумма экономии ',SummaTot-SummaOtp:12:2);
      CloseFile(Dev);
      View(FName);
      nsrv:=nsrvtmp;
      nmes:=nmestmp;
      MKFLNM;
      GETINF(true);
 end;

procedure TFormEkonom.BitBtn1Click(Sender: TObject);
begin
     if NMES<>FLOW_MONTH then
        begin
             ShowMessage('Можно использовать только в текущем месяце');
             Exit;
        end;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны счета');
             Exit;
        end;

      CreateSwod;
end;

procedure TFormEkonom.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

procedure TFormEkonom.BitBtn4Click(Sender: TObject);
begin
     if (NMES<>5) or (CURRYEAR<>2012) then
        begin
             ShowMessage('Расчет только в мае 2012');
             Exit;
        end;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны счета');
             Exit;
        end;
     CreateSwodAprInMay;
end;

end.


