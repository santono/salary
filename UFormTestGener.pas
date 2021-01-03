unit UFormTestGener;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, frxClass, frxDBSet, DB, DBClient;

type
  TFormTestGener = class(TForm)
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
      procedure makeTesting;
  public
    { Public declarations }
  end;

var
  FormTestGener: TFormTestGener;

implementation
  uses ScrDef,ScrUtil,scrio;

{$R *.dfm}

procedure TFormTestGener.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormTestGener.makeTesting;
  var tmpNMES , tmpNSRV,i_nsrv : Integer;
      Curr_Person : PERSON_PTR;
      Curr_Cn     : cn_Ptr;
      Count       : Integer;
  begin
       tmpNMES := NMES;
       tmpNSRV := NSRV;
       putinf;
       EMPTY_ALL_PERSON;
       pb1.Max      := Count_Serv;
       pb1.Min      := 0;
       pb1.Position := 0;
       COUNT        := 0;
       dsTest.Open;
       for i_nsrv:=1 to Count_Serv do
           begin
                pb1.Position := i_nsrv ;
                lbl1.Caption := Name_Serv(i_nsrv);
                Application.ProcessMessages ;
                nsrv:=i_nsrv;
                mkflnm;
                if not FileExists(fninf) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (Curr_Person<>Nil) do
                  begin
                       curr_cn:=curr_person.CN;
                       while (Curr_Cn<>Nil) do
                         begin
                              if Curr_Cn.PRIM=NMES then
                              if Abs(Curr_Cn.SUMMA)>0.01 then
                                 begin
                                      dsTest.Append;
                                      dsTestshifrPod.Value:=nsrv;
                                      dsTesttabno.Value:=Curr_person.TABNO;
                                      dsTestfio.Value:=Curr_Person.FIO;
                                      dsTest.Post;
                                    //  ShowMessage('Проверьте '+Curr_Person^.FIO);
                                      Count:=Count+1;
                                 end;
                              if (Curr_Cn.SHIFR<=limit_cn_base) then
                              if ((Curr_Cn.Kod=2) or
                                  (Curr_Cn.Kod=4) or
                                  (Curr_Cn.Kod=6)) then
                              if (Curr_Cn.SUMMA>100)  then
                                 begin
                                      dsTest.Append;
                                      dsTestshifrPod.Value:=nsrv;
                                      dsTesttabno.Value:=Curr_person.TABNO;
                                      dsTestfio.Value:='%'+trim(Curr_Person.FIO);
                                      dsTest.Post;
                                    //  ShowMessage('Проверьте '+Curr_Person^.FIO);
                                      Count:=Count+1;
                                 end;


                              Curr_Cn:=Curr_Cn.Next;
                         end;
                       Curr_Person:=Curr_Person.NEXT;
                  end;
                EMPTY_ALL_PERSON;

           end;
       if Count>0 then
          frxrprt1.ShowReport
        //  ShowMessage('Найдено '+intToStr(Count)+' несоответствий')
       else
          ShowMessage('Не найдено ошибок ');
       dsTest.Close;
       NMES := tmpNMES;
       NSRV := tmpNSRV;
       mkflnm;
       getInf(true);

  end;


procedure TFormTestGener.btn1Click(Sender: TObject);
begin
     makeTesting;
     Close;
end;

procedure TFormTestGener.frxrprt1GetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthRus(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          Value:=IntToStr(CURRYEAR)+' г.';
end;

end.
