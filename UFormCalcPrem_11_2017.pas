unit UFormCalcPrem_11_2017;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc, ExtCtrls;

type
  TFormCalcPrem_11_2017 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabelPodr: TLabel;
    cxCalcEdit1: TcxCalcEdit;
    Label2: TLabel;
    Label3: TLabel;
    rgModeRead: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     wantedProc:real;
     wantedShifr:integer;
    { Private declarations }
     procedure ExecuteCalcPrem03_2023;

  public
    { Public declarations }
  end;

var
  FormCalcPrem_11_2017: TFormCalcPrem_11_2017;

implementation
  Uses UFibModule,ScrDef,ScrIo,ScrUtil,UFormSelPKG,ScrLists,Math;

{$R *.dfm}

  var tabnoList:TList;
procedure TFormCalcPrem_11_2017.BitBtn1Click(Sender: TObject);
var iErr:integer;
    i:integer;
begin
     if not ((nmes=03) and (CURRYEAR=2023)) then
        begin
             ShowMessage('Расчет возможен только в марте 2023 г.');
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

     if MessageDlg('Выполнить расчет премии в марте 2023 г.?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
        begin
             ExecuteCalcPrem03_2023;
             showMessage('Рассчет закончен');
        end;
end;

procedure TFormCalcPrem_11_2017.ExecuteCalcPrem03_2023;
const
      id=37;
      wantedPeriod=03;
      wantedYear=2023;
var NMES_Sav,NSRV_Sav:Integer;
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    Maked:Boolean;
    I:Integer;
    shifrDol:integer;
    shifrWR:integer;
    summaPreTot:real;
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
                            if Curr_Add^.YEAR   = wantedYear-1990     then
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
   function findTabnoInList(tabno:integer):Boolean;
     var i:Integer;
         retVal:boolean;
         finded:Boolean;
         PInt:PInteger;
     begin
          retVal:=false;
          finded:=false;
          if tabnoList.count>0 then
             for i:=0 to tabnoList.count-1 do
                 begin
                      if PInteger(tabnoList.Items[i])^=tabno then
                         begin
                              finded:=True;
                              Break;
                         end;
                 end;
          if not finded then
             begin
                  New(PInt);
                  PInt^:=tabno;
                  tabnoList.add(PInt);
             end;
          findTabnoInList:=finded;
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
         curr_ADD^.SHIFR  := wantedShifr;
         curr_add^.period := wantedPeriod;
         curr_add^.year   := wantedYear-1990;
         curr_add^.summa  := summa;
         curr_add^.fzp    := summa;
         curr_add^.who    := id;
         retVal := true;
         maked  := true;
         summaPreTot:=roundTo(summaPreTot,0)+roundTo(summa,0);
         fillPersonPrem:=retVal;
     end;
  function existsDoplDoMinZp(curr_person:person_ptr):boolean;
    var retVal:Boolean;
        curr_add:ADD_PTR;
    begin
         retval:=False;
         curr_add:=curr_person^.ADD;
         while (curr_add<>nil) do
          begin
               if curr_add^.shifr=DOPL_DO_MIN_SHIFR then
                  begin
                       retval:=True;
                       Break;
                  end;
               curr_add:=curr_add^.NEXT;
          end;
         existsDoplDoMinZp:=retVal;
    end;

begin
     NMES_Sav  := NMES;
     NSRV_Sav  := NSRV;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max := Count_SERV;
     ProgressBar1.Min := 0;
     ProgressBar1.Position := 0;
     SC:=0;
     tabnoList:=TList.Create;
     summaPreTot:=0;
     Label3.Show;
     Label3.Caption:=FormatFloatPoint(SummaPreTot);
     Application.ProcessMessages;
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
                     if not existsDoplDoMinZp(curr_person) then
                     if not findTabnoInList(curr_person^.tabno) then
                     if curr_person^.Oklad>10 then
                        begin
                             FillPersonPrem(curr_person);
                             Label3.Caption:=FormatFloatPoint(SummaPreTot);
                             Application.ProcessMessages;
                        end;
                     curr_person:=curr_person^.NEXT;
                end;
              if rgModeRead.ItemIndex=1 then
                 if Maked then PUTINF;
                    EMPTY_ALL_PERSON;

         end;
     tabnoList.Clear;
     tabnoList.Free;
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

procedure TFormCalcPrem_11_2017.FormCreate(Sender: TObject);
begin
     if not ((NMES=3) and (CURRYEAR=2023)) then
        begin
 //            ShowMessage('Рассчитать премию можно тольков марте 2023 г.');
             raise Exception.Create('Рассчитать премию можно только в марте 2023 г.');

        end;
     Label3.Hide   
end;

end.
