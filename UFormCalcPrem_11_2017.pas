unit UFormCalcPrem_11_2017;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc;

type
  TFormCalcPrem_11_2017 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    BitBtn3: TBitBtn;
    LabelPodr: TLabel;
    pFIBDataSet1NPP: TFIBIntegerField;
    pFIBDataSet1TABNO: TFIBSmallIntField;
    pFIBDataSet1FIO: TFIBStringField;
    pFIBDataSet1DOLG: TFIBStringField;
    pFIBDataSet1PROC: TFIBBCDField;
    pFIBDataSet1SUMMA: TFIBBCDField;
    pFIBDataSet1FIOS: TFIBStringField;
    pFIBDataSet1MOVED: TFIBSmallIntField;
    pFIBDataSet1SHIFRPOD: TFIBSmallIntField;
    cxCalcEdit1: TcxCalcEdit;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
     wantedProc:real;
     wantedShifr:integer;
    { Private declarations }
     procedure ExecuteCalcPrem11_2017;

  public
    { Public declarations }
  end;

var
  FormCalcPrem_11_2017: TFormCalcPrem_11_2017;

implementation
  Uses UFibModule,ScrDef,ScrIo,ScrUtil,UFormSelPKG,ScrLists,Math;

{$R *.dfm}

procedure TFormCalcPrem_11_2017.BitBtn1Click(Sender: TObject);
var iErr:integer;
    i:integer;
begin
     if not ((nmes=11) and (CURRYEAR=2017)) then
        begin
             ShowMessage('Расчет возможен только в ноябре 2017 г.');
             exit;
        end;
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

     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не выбрана статья премии');
             Exit;
        end;

     if (length(trim(cxCalcEdit1.Text))=0) then
        begin
             ShowMessage('Не указан процент премии');
             Exit;
        end;
     val(trim(cxCalcEdit1.Text),wantedProc,iErr);
     if iErr<>0 then
        begin
             ShowMessage('Не указан процент премии');
             Exit;
        end;

     if (wantedProc<1.0) or (wantedProc>100.00) then
        begin
             ShowMessage('Неверно указан процент премии');
             Exit;
        end;
     wantedProc:=wantedProc / 100.00;
     wantedShifr:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.isSelected(i) then
            begin
                 wantedShifr:=i;
                 break;
            end;

     if (wantedShifr=0) then
        begin
             ShowMessage('Неверно указана статья начислений - удержаний');
             exit;
        end;

     if MessageDlg('Выполнить расчет премии в ноябре 2017 г.?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
        begin
             ExecuteCalcPrem11_2017;
             showMessage('Рассчет закончен');
        end;
end;

procedure TFormCalcPrem_11_2017.ExecuteCalcPrem11_2017;
const
      id=37;
      wantedPeriod=11;
var NMES_Sav,NSRV_Sav:Integer;
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    Maked:Boolean;
    I:Integer;
    shifrDol:integer;
    shifrWR:integer;
        procedure Delete_Prem_Person(Curr_person:person_ptr);
         var Finished:Boolean;
             Curr_Add:Add_PTR;
         begin
              while True do
               begin
                     Finished:=True;
                     Curr_Add:=Curr_Person^.Add;
                     if KategList.IsSelected(curr_person.KATEGORIJA) then
                     if gruppyList.IsSelected(curr_person.Gruppa) then
                     while (Curr_Add<>Nil) do
                       begin
                            if Curr_Add^.SHIFR  = WantedShifr   then
                            if Curr_Add^.Period = wantedPeriod  then
                            if Curr_Add^.YEAR   = 2017-1990     then
                            if Curr_Add^.WHO    = Id            then
                               begin
                                    DEL_Add(Curr_Add,Curr_Person);
                                    Finished:=False;
                                    break;
                               end;
                            Curr_Add:=Curr_Add^.NEXT;
                       end;
                     if Finished then Break;
               end;
         end;
        procedure Delete_Prem_Pod;
         var Curr_Person:Person_Ptr;
         begin
              curr_person:=head_person;
              while (curr_person<>nil) do
                begin
                     Delete_Prem_person(curr_person);
                     curr_person:=curr_person^.NEXT;
                end;
         end;

   function fillPersonPrem(curr_person:person_ptr):boolean;
     var
         tabno    : integer;
         retVal   : boolean;
         summa    : real;
         curr_add : add_ptr;
         moved    : integer;
         shifrwr  : integer;
         shifrpod : integer;
         Oklad    : real;
     begin
         retVal:=false;
         oklad:=curr_person^.OKLAD;
         if oklad<1.00 then exit;
         summa:=roundTo(oklad*wantedProc,0);
         Make_add(Curr_add,curr_person);
         curr_ADD^.SHIFR:=wantedShifr;
         curr_add^.period:=wantedPeriod;
         curr_add^.year:=2017-1990;
         curr_add^.summa:=summa;
         curr_add^.fzp:=summa;
         curr_add^.who:=id;
         retVal := true;
         maked  := true;
         fillPersonPrem:=retVal;
     end;

begin
     NMES_Sav  := NMES;
     NSRV_Sav  := NSRV;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max := Count_SERV;
     ProgressBar1.Min := 0;
     ProgressBar1.Position := 0;
     SC:=0;
     pFIBDataSet1.Transaction.StartTransaction;
     for I_NSRV:=1 to COUNT_SERV do
         begin
              Sc:=Sc+1;
              ProgressBar1.Position:=Sc;
              NSRV:=I_NSRV;
              if not NameServList.IsSelected(NSRV) then continue;
              mkflnm;
              LabelPodr.Caption:=Name_Serv(NSRV);
              Application.ProcessMessages;
              if not FileExists(fninf) then Continue;
              GetInf(False);
              Maked:=false;
              Delete_Prem_Pod;
              curr_person:=head_person;
              while (curr_person<>nil) do
                begin
                     shifrDol:=get_dol_code(curr_person);
                     shifrWR:=0;
                     if IS_OSN_WID_RABOTY(curr_person) then
                        shifrwr:=1;
                     if checkNeedDolgTest(shifrDol) then
                     if shifrWR=1 then
                     if KategList.IsSelected(curr_person^.KATEGORIJA) then
                     if GruppyList.IsSelected(curr_person^.GRUPPA) then
                        FillPersonPrem(curr_person);
                     curr_person:=curr_person^.NEXT;
                end;

              if Maked then PUTINF;
              EMPTY_ALL_PERSON;

         end;
     NMES:=NMES_Sav;
     NSRV:=NSRV_Sav;
     MKFLNM;
     GETINF(TRUE);

end;

procedure TFormCalcPrem_11_2017.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

end.
