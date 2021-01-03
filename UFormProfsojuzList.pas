unit UFormProfsojuzList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, frxClass, frxDBSet, DB, DBClient,
  frxExportRTF, frxExportXLS;

type
  TFormProfsojuzList = class(TForm)
    pb1: TProgressBar;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dsTest: TClientDataSet;
    dsTestshifrPod: TIntegerField;
    dsTesttabno: TIntegerField;
    frxrprtProf: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dsTestsumma: TFloatField;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    dsTestfio: TStringField;
    dsTestsummaMax: TFloatField;
    dsTestsumma22: TFloatField;
    dsTestsumma22Cor: TFloatField;
    dsTestsumma22Res: TFloatField;
    dsTestisInvalid: TBooleanField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure frxrprtProfGetValue(const VarName: String; var Value: Variant);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
      procedure makeList;
  public
    { Public declarations }
  end;

var
  FormProfsojuzList: TFormProfsojuzList;

implementation
  uses ScrDef,ScrUtil,scrio, UFibModule,UFormLessMinSal,Math;
  
  type prec=^trec;
       trec=record
            tabno     : Integer;
            fio       : string;
            summa     : Real;
            summaMax  : Real;
            summa22   : Real;
            summa22cor :Real;
            summa22Res : real;
            isInvalid :Boolean;
           end;
  var List : TList;

  procedure AddPersonToList(Curr_Person:PERSON_PTR);
    var finded : Boolean;
        rec    : prec;
        i      : Integer;
    begin
          finded:=False;
          if List.count>0 then
             for i:=0 to List.Count-1 do
                 begin
                      if prec(List.Items[i]).tabno=Curr_Person.TABNO then
                         begin
                              finded:=True;
                              break
                         end;
                 end;
          if not finded then
             begin
                  New(rec);
                  rec.tabno    := curr_person.tabno;
                  if isLNR then
                     rec.fio      := Trim(GetFullRusFioPerson(curr_person.tabno))
                  else
                     rec.fio      := Trim(GetFullUkrFioPerson(curr_person.tabno));
                  rec.summa       := 0.00;
                  rec.summaMax    := 0.00;
                  rec.summa22     := 0.00;
                  rec.summa22cor  := 0.00;
                  rec.summa22Res  := 0.00;
                  rec.isInvalid:=false;
                  list.Add(rec);
             end;
    end;

{$R *.dfm}

procedure TFormProfsojuzList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;
function compare(item1:Pointer;item2:pointer):Integer;
 var retVal:Integer;
     rec:prec;
 begin
      retVal:=0;
      if UPPER_STRING(prec(item1).fio)>UPPER_STRING(prec(item2).fio) then retVal:=1
      else
      if UPPER_STRING(prec(item1).fio)<UPPER_STRING(prec(item2).fio) then retVal:=-1;
      compare:=retVal;
 end;

procedure TFormProfsojuzList.makeList;
  var tmpNMES , tmpNSRV , i_nsrv , i ,j: Integer;
      Curr_Person : PERSON_PTR;
      Curr_Add    : Add_Ptr;
      Count       : Integer;
      fio         : string;
      v           : Variant;
      SQLStmnt    : string;
      summa,summa22,summaTot,summaTot22:Real;
      summaMax,summaMaxTot,limit:Real;
  begin

       tmpNMES := NMES;
       tmpNSRV := NSRV;
       putinf;
       EMPTY_ALL_PERSON;
       pb1.Max      := Count_Serv;
       pb1.Min      := 0;
       pb1.Position := 0;
       COUNT        := 0;
       list         := TList.Create;
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
                       if Curr_Person^.PROFSOJUZ=1 then
                       if getSummaAddForPerson(Curr_Person)>0.01 then
                          AddPersonToList(Curr_Person);
                       Curr_Person:=Curr_Person.NEXT;
                  end;
                EMPTY_ALL_PERSON;

           end;
       if List.Count>0 then
          begin
              dsTest.Open;
              List.Sort(@Compare);
              for i:=0 to list.count-1 do
                  begin
                       summa:=prec(List.Items[i]).summa;
//                       if (Abs(summa)>0.01) then
                          begin
                               dstest.Append;
                   //            dsTestshifrPod.Value:=prec(List.Items[i]).shifrpod;
                               dsTesttabno.Value      := prec(List.Items[i]).tabno;
                               dsTestsumma.Value      := 0;
                               dsTestsummaMax.Value   := 0;
                               dsTestsumma22.Value    := 0;
                               dsTestsumma22cor.Value := 0;
                               dsTestsumma22res.Value := 0;
                               dsTestfio.Value:=prec(List.Items[i]).fio;
                               dstest.Post;
                          end
                  end;
              for i:=0 to List.Count-1 do
                  Dispose(pRec(List.Items[i]));
              List.Free;
              frxrprtProf.ShowReport;
              dsTest.Close;
          end
        //  ShowMessage('Найдено '+intToStr(Count)+' несоответствий')
       else
          ShowMessage('Не найдено сотрудников ');
       NMES := tmpNMES;
       NSRV := tmpNSRV;
       mkflnm;
       getInf(true);

  end;


procedure TFormProfsojuzList.btn1Click(Sender: TObject);
begin
     makeList;
     Close;
end;

procedure TFormProfsojuzList.frxrprtProfGetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
         if isLNR then
            Value:=GetMonthRus(NMES)
          else
            Value:=GetMonthUkr(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
         if isLNR then
            Value:=IntToStr(CURRYEAR)+' г.'
         else
            Value:=IntToStr(CURRYEAR)+' р.'
      else


end;

procedure TFormProfsojuzList.FormCreate(Sender: TObject);
begin

      lbl1.Caption:='';


end;


  





end.
