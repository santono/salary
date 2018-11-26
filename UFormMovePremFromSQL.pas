unit UFormMovePremFromSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormMovePremFromSQL = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    BitBtn3: TBitBtn;
    LabelPodr: TLabel;
    pFIBDataSet1PODR: TFIBStringField;
    pFIBDataSet1NPP: TFIBStringField;
    pFIBDataSet1TABNO: TFIBIntegerField;
    pFIBDataSet1FIO: TFIBStringField;
    pFIBDataSet1DOLG: TFIBStringField;
    pFIBDataSet1KOEF: TFIBBCDField;
    pFIBDataSet1OKLAD: TFIBBCDField;
    pFIBDataSet1PROC: TFIBBCDField;
    pFIBDataSet1GUID_BUD: TFIBStringField;
    pFIBDataSet1SUMMA: TFIBBCDField;
    pFIBDataSet1FIOF: TFIBStringField;
    pFIBDataSet1MOVED: TFIBIntegerField;
    pFIBDataSet1SHIFRPOD: TFIBIntegerField;
    pFIBDataSet1TABNOS: TFIBStringField;
    pFIBDataSet1KOEF_VNE: TFIBBCDField;
    pFIBDataSet1OKLAD_VNE: TFIBBCDField;
    pFIBDataSet1SUMMA_VNE: TFIBBCDField;
    pFIBDataSet1GUID_VNE: TFIBStringField;
    pFIBDataSet1MOVED_VNE: TFIBIntegerField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
     procedure ExecuteMovePrem10_2018;

  public
    { Public declarations }
  end;

var
  FormMovePremFromSQL: TFormMovePremFromSQL;

implementation
  Uses UFibModule,ScrDef,ScrIo,ScrUtil,UFormSelPKG,ScrLists;

{$R *.dfm}

procedure TFormMovePremFromSQL.BitBtn1Click(Sender: TObject);
begin
     if not ((nmes=10) and (CURRYEAR=2018)) then
        begin
             ShowMessage('Перенос возможен только в октябре 2018 г.');
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

     if MessageDlg('Выполнить перенос премии в октябре 2018 г.?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
        begin
             ExecuteMovePrem10_2018;
             showMessage('Перенос закончен');
        end;
end;

procedure TFormMovePremFromSQL.ExecuteMovePrem10_2018;
const wantedShifr=46;
      id=37;
      wantedPeriod=10;
var NMES_Sav,NSRV_Sav:Integer;
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    Maked:Boolean;
    I:Integer;
    shifrDol:integer;
        procedure Delete_Prem_Person(Curr_person:person_ptr);
         var Finished:Boolean;
             Curr_Add:Add_PTR;
         begin
              while True do
               begin
                     Finished:=True;
                     Curr_Add:=Curr_Person^.Add;
                     while (Curr_Add<>Nil) do
                       begin
                            if Curr_Add^.SHIFR  = WantedShifr then
                            if Curr_Add^.Period = wantedPeriod      then
                            if Curr_Add^.YEAR   = 2018-1990   then
                            if Curr_Add^.WHO    = Id          then
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

   function fillPerson:boolean;
     var Curr_Person:Person_Ptr;
         tabno     : integer;
         retVal    : boolean;
         shifrDol  : integer;
         summa     : real;
         summa_vne : real;
         curr_add  : add_ptr;
         moved     : integer;
         moved_vne : integer;
         shifrwr   : integer;
         shifrpod  : integer;
         guid_bud  : string;
         guid_vne  : string;
         amnt      : integer;
         amntofmoved:integer;
         guid      : string;
     begin
         retVal:=false;
         tabno:=0;
         if not pFIBDataSet1Tabno.IsNull then
            tabno:=pFIBDataSet1TABNO.Value;
         summa:=0.00;
         summa_vne:=0.00;
         if not pFIBDataSet1SUMMA.IsNull then
            summa:=pFIBDataSet1Summa.Value;
         if not pFIBDataSet1SUMMA_VNE.IsNull then
            summa_vne:=pFIBDataSet1SUMMA_VNE.Value;
         moved:=0;
         moved_vne:=0;
         if not pFIBDataSet1MOVED.IsNull then
            moved:=pFIBDataSet1MOVED.Value;
         if not pFIBDataSet1MOVED_VNE.IsNull then
            moved_vne:=pFIBDataSet1MOVED_VNE.Value;
         shifrpod:=pFIBDataSet1SHIFRPOD.Value;
         guid_bud:='';
         guid_vne:='';
         if not pFIBDataSet1GUID_BUD.IsNull then
            guid_bud:=pFIBDataSet1GUID_BUD.Value;
         if not pFIBDataSet1GUID_VNE.IsNull then
            guid_vne:=pFIBDataSet1GUID_vne.Value;
         shifrwr:=1;
         if shifrPod<0 then
            shifrwr:=2;
         if ((tabno=0) or ((abs(summa)<0.01) and (abs(summa_vne)<0.01))
                        ) then
            begin
                 fillPerson:=false;
                 exit;
            end;
         amntofmoved:=0;
         amnt:=0;
         if ((summa>1.00) and (moved<1)) then
            inc(amnt);
         if ((summa_vne>1.00) and (moved_vne<1)) then
            inc(amnt);
         if amnt<1 then
            begin
                 fillPerson:=false;
                 exit;
            end;
         Curr_Person:=Head_Person;
         while (Curr_Person<>NIl) do
               begin
                    if (curr_person^.tabno=tabno) then
//                    if shifrwr=2 then
//                       shifrDol:=1;
//                    shifrDol:=get_dol_code(curr_person);
                    guid:=GetGUIDPersonToString(Curr_Person);
                    if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                    if KategList.IsSelected(Curr_Person^.KATEGORIJA) then
                    if  (
                         ((shifrwr=1) and IS_OSN_WID_RABOTY(Curr_Person))
                         or
                         ((shifrwr=2) and NOT IS_OSN_WID_RABOTY(Curr_Person))
                        )
                         then
//                    if checkNeedDolgTest(shifrdol) then
                    if (curr_person.tabno=tabno) then
                    if is_osn_wid_raboty(curr_person) then
                       begin
                            Make_add(Curr_add,curr_person);
                            curr_ADD^.SHIFR  := wantedShifr;
                            curr_add^.period := wantedPeriod;
                            curr_add^.year   := 2018-1990;
                            if curr_person^.gruppa=1 then
                               begin
                                    curr_add^.summa  := summa;
                                    curr_add^.fzp    := summa;
                                    moved:=1;
                                    inc(amntofmoved);
                               end
                            else
                               begin
                                    curr_add^.summa  := summa_vne;
                                    curr_add^.fzp    := summa_vne;
                                    moved_vne:=1;
                                    inc(amntofmoved);
                               end;
                            curr_add^.who    := id;
                            retVal           := true;
                            maked            := true;
                            if amnt<=amntofmoved then
                               begin
                                    pFIBDataSet1.Edit;
                                    pFIBDataSet1MOVED.Value     := moved;
                                    pFIBDataSet1MOVED_VNE.Value := moved_VNE;
                                    pFIBDataSet1.Post;
                                    break;
                               end
                       end;
                    Curr_Person:=Curr_Person^.Next;
               end;
          fillPerson:=retVal;
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
              pFIBDataSet1.Params[0].Value:=nsrv;
              pFIBDataSet1.Open;
              while (not pFIBDataSet1.Eof) do
                begin
                     if fillPerson then
                        begin
//                             pFIBDataSet1.Edit;
//                             pFIBDataSet1MOVED.Value     := moved;
//                             pFIBDataSet1MOVED_VNE.Value := moved_VNE;
//                             pFIBDataSet1.Post;
                        end;
                     pFIBDataSet1.next;
                end;
              pFIBDataSet1.Close;

              if Maked then PUTINF;
              EMPTY_ALL_PERSON;

         end;
     pFIBDataSet1.Transaction.Commit;
     if pFIBDataSet1.UpdateTransaction.Active then
        pFIBDataSet1.UpdateTransaction.Commit;
     NMES:=NMES_Sav;
     NSRV:=NSRV_Sav;
     MKFLNM;
     GETINF(TRUE);

end;

procedure TFormMovePremFromSQL.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

end.
