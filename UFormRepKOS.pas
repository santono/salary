unit UFormRepKOS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, DBClient, frxClass, frxDBSet;

type
  TFormRepKOS = class(TForm)
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    LabelFio: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ClientDataSetSverka: TClientDataSet;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    ClientDataSetSverkaShifrPod: TIntegerField;
    ClientDataSetSverkaTabno: TIntegerField;
    ClientDataSetSverkaFIO: TStringField;
    ClientDataSetSverkaDolg: TStringField;
    ClientDataSetSverkaRazr: TIntegerField;
    ClientDataSetSverkaKoef: TFloatField;
    ClientDataSetSverkaOklad: TFloatField;
    ClientDataSetSverkaOkladCalc: TFloatField;
    ClientDataSetSverkaOkladRazr: TFloatField;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
     procedure ExecuteSverka;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRepKOS: TFormRepKOS;
  List : TList;
implementation
   uses ScrUtil,ScrDef,ScrIo,UFIBModule,ScrLists,UFormSelPKG;
{$R *.dfm}

procedure TFormRepKOS.BitBtn1Click(Sender: TObject);
begin
     ExecuteSverka;
end;
procedure TFormRepKOS.ExecuteSverka;
 var NSRV_TMP    : Integer;
     I_NSRV      : Integer;
     Curr_Person : Person_Ptr;
     Cnt         : Integer;
     procedure InitRazrOklad;
      var i : integer;
          P : Real;
          SQLStmnt : string;
          dataS : string;
          PReal : ^Real;
      begin
           dataS:=IntToStr(CURRYEAR)+'-'+IntToStr(nmes)+'-01';
           for I:=1 to 25 do
             begin
                  SQLStmnt:='select first 1 oklad from tb_razr_proc where datefr<='''+datas+''' and razr='+IntToStr(i)+' order By DateFr Desc';
                  p:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
                  New(PReal);
                  PReal^:=P;
                  List.Add(PReal);
                  Inc(Cnt);
             end
      end;
     procedure Test_Person(Curr_Person:Person_Ptr);
      type PReal=^Real;
      var Koef,Oklad,OkladCalc,Oklad_Razr:Real;
          Razr:Integer;
      begin
           Koef:=GET_KOEF_OKLAD_PERSON(Curr_Person);
           Razr:=GetRazrjadPerson(Curr_Person);
           if (Razr<1) or (Razr>25) then Exit;
           Oklad:=Curr_Person^.OKLAD;
           Oklad_Razr:=PReal(List.Items[Razr-1])^;
           OkladCalc:=Oklad_razr*Koef;
           if Abs(abs(OkladCalc)-abs(Oklad))>0.01 then
              begin
                   with ClientDataSetSverka do
                      begin
                            Insert;
                            FieldByName('ShifrPod').AsInteger:=nsrv;
                            FieldByName('Tabno').AsInteger   :=Curr_Person^.Tabno;
                            FieldByName('FIO').AsString      :=Curr_Person^.Fio;
                            FieldByName('Dolg').AsString     :=Curr_Person^.DOLG;
                            FieldByName('Razr').AsInteger    :=razr;
                            FieldByName('Koef').AsFloat      :=koef;
                            FieldByName('Oklad').AsFloat     :=oklad;
                            FieldByName('OkladCalc').AsFloat :=okladCalc;
                            FieldByName('OkladRazr').AsFloat := Oklad_Razr;
                            Post;
                            Inc(Cnt);
                      end;
              end;
      end;
 begin
      if NameServList.CountSelected<=0 then
         begin
              ShowMessage('Не выбраны подразделения');
              Exit;
         end;
      if KategList.CountSelected<=0 then
         begin
              ShowMessage('Не выбраны категории');
              Exit;
         end;
      if GruppyList.CountSelected<=0 then
         begin
              ShowMessage('Не выбраны счета');
              Exit;
         end;

      NSRV_TMP:=NSRV;
      PUTINF;
      while (HEAD_PERSON<>nil) do DEL_PERSON(Head_Person);
      ProgressBar1.Max      := Count_Serv ;
      ProgressBar1.Min      := 0 ;
      ProgressBar1.Step     := 1 ;
      ProgressBar1.Position := 0 ;
      ClientDataSetSverka.Open;
      List:=TList.Create;
      InitRazrOklad;
      Cnt:=0;
      for i_nsrv:=1 to count_serv do
          begin
               ProgressBar1.StepIt;
               LabelPodr.Caption:=Name_Serv(i_nsrv);
               Application.ProcessMessages;
               nsrv:=I_NSRV;
               if not NameServList.IsSelected(NSRV) then continue;
               if STORONNEE_PODRAZD(nsrv) then continue;
               if RECENZENT_PODRAZD(nsrv) then continue;
               if DOG_POD_PODRAZD(nsrv) then continue;

               MKFLNM;
               if not FILEEXIST(fninf) then Continue;
               GetInf(false);
               Curr_Person:=HEAD_PERSON;
               while (Curr_Person<>Nil) do
                 begin
                      LabelFio.Caption:=Curr_Person.FIO;
                      Application.ProcessMessages;
                      if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                      if KategList.IsSelected(Curr_Person^.Kategorija) then
                         TEST_PERSON(Curr_Person);

                      Curr_Person:=Curr_Person^.NEXT;
                 end;
               while (HEAD_PERSON<>nil) do DEL_PERSON(Head_Person);

          end;
      if Cnt>0 then
         frxReport1.ShowReport
      else
         ShowMessage('Is');
      ClientDataSetSverka.Close;
      List.Free;
      NSRV:=NSRV_TMP;
      MKFLNM;
      GetInf(true);

 end;
procedure TFormRepKOS.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

end.
