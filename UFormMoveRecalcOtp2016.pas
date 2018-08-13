unit UFormMoveRecalcOtp2016;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormMoveRecalcOtp2016 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSet1TABNO: TFIBIntegerField;
    pFIBDataSet1FIO: TFIBStringField;
    pFIBDataSet1SUMMAOTP: TFIBBCDField;
    pFIBDataSet1SUMMAECB: TFIBBCDField;
    pFIBDataSet1SUMMAPOD: TFIBBCDField;
    pFIBDataSet1ISSCIPED: TFIBIntegerField;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    wantedShifr:integer;
     procedure ExecuteMovePod2012;

  public
    { Public declarations }
  end;

var
  FormMoveRecalcOtp2016: TFormMoveRecalcOtp2016;

implementation
  Uses UFibModule,ScrDef,ScrIo,ScrUtil;

{$R *.dfm}


procedure TFormMoveRecalcOtp2016.BitBtn1Click(Sender: TObject);
begin
     if MessageDlg('Выполнить перенос данных перерасчета отпускных после 25 07 2016 г?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
     ExecuteMovePod2012;
end;

procedure TFormMoveRecalcOtp2016.ExecuteMovePod2012;
type
     PRec=^TRec;
     TRec=record
           tabno    : Integer;
           SummaOtp : Real;
           SummaEcb : Real;
           SummaPod : Real;
           ShifrECB : integer;
          end;
var NMES_Sav,NSRV_Sav:Integer;
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    Maked:Boolean;
    List:TList;
    I:Integer;
    SQLStmnt:string;
  procedure InitList;
    var Rec:PRec;
    begin
         pFIBDataSet1.Transaction.StartTransaction;
         pFIBDataSet1.Open;
         List:=TList.Create;
         while not pFIBDataSet1.Eof do
           begin
                New(Rec);
                Rec.tabno     := pFIBDataSet1TABNO.Value;
                Rec.SummaOtp  := pFIBDataSet1SUMMAOTP.Value;
                Rec.SummaECB  := pFIBDataSet1SUMMAECB.Value;
                Rec.SummaPod  := pFIBDataSet1SUMMAPod.Value;
                if (pFIBDataSet1ISSCIPED.Value=1) then
                   Rec.ShifrECB  := ECBNShifr
                else
                   Rec.ShifrECB  := ECBShifr;
                List.Add(Rec);
                pFIBDataSet1.Next;
           end;
         pFIBDataSet1.Close;
         pFIBDataSet1.Transaction.Commit;
    end;
  procedure MovePodToPerson(Curr_Person:Person_Ptr);
   var Curr_Add:Add_Ptr;
       Curr_Ud:UD_PTR;
       Rec:PRec;
       Finded:Boolean;
       i,j:Integer;
       procedure MovePodToPerson(SummaOtp:Real;
                                 SummaEcb:Real;
                                 SummaPod:Real;
                                 ShifrECB:Integer;
                                 Period:integer);
        const id=49;
        var Curr_Add:Add_PTR;
        procedure Delete_Add_Ud_Otp;
         var Finished:Boolean;
             Curr_Add:Add_PTR;
             Curr_Ud:Ud_PTR;
         begin
              while True do
               begin
                     Finished:=True;
                     Curr_Add:=Curr_Person^.Add;
                     while (Curr_Add<>Nil) do
                       begin
                            if Curr_Add^.SHIFR  = Wantedshifr then
                            if Curr_Add^.Period = Period      then
                            if Curr_Add^.YEAR   = 2015-1990   then
                            if Curr_Add^.WHO    = Id          then
                               begin
                                    DEL_Add(Curr_Add,Curr_Person);
                                    Finished:=False;
                                    Break;
                               end;
                            Curr_Add:=Curr_Add^.NEXT;
                       end;
                     if Finished then Break;
               end;
              while True do
               begin
                     Finished:=True;
                     Curr_Ud:=Curr_Person^.Ud;
                     while (Curr_Ud<>Nil) do
                       begin
                            if Curr_Ud^.SHIFR in [ECBShifr,ECBNShifr,PODOH_SHIFR] then
                            if Curr_Ud^.Period = Period      then
                            if Curr_Ud^.YEAR   = 2015-1990   then
                            if Curr_Ud^.WHO    = Id          then
                               begin
                                    DEL_Ud(Curr_Ud,Curr_Person);
                                    Finished:=False;
                                    Break;
                               end;
                            Curr_Ud:=Curr_Ud^.NEXT;
                       end;
                     if Finished then Break;
               end;
         end;
        begin
             Delete_Add_UD_Otp;
             if Abs(SummaOtp)>4.99 then
                begin
                     MAKE_Add(Curr_Add,Curr_Person);
                     Curr_Add^.SHIFR := wantedShifr;
                     Curr_Add^.SUMMA := SummaOtp;
                     Curr_Add^.FZP   := Curr_Add^.SUMMA;
                     Curr_Add^.PERIOD := Period;
                     Curr_Add^.YEAR   := 2015-1990;
                     Curr_Add^.VYPLACHENO:=GET_OUT;
                     Curr_Add^.WHO:=id;
                end;
             if Abs(SummaEcb)>0.01 then
                begin
                     MAKE_Ud(Curr_Ud,Curr_Person);
                     Curr_Ud^.SHIFR  := ShifrECB;
                     Curr_Ud^.SUMMA  := SummaEcb;
                     Curr_Ud^.PERIOD := Period;
                     Curr_Ud^.YEAR   := 2015-1990;
                     Curr_Ud^.VYPLACHENO:=GET_OUT;
                     Curr_Ud^.WHO:=id;
                     Maked:=True;
                end;
             if Abs(SummaPod)>0.01 then
                begin
                     MAKE_Ud(Curr_Ud,Curr_Person);
                     Curr_Ud^.SHIFR  := Podoh_Shifr;
                     Curr_Ud^.SUMMA  := SummaPod;
                     Curr_Ud^.PERIOD := Period;
                     Curr_Ud^.YEAR   := 2015-1990;
                     Curr_Ud^.VYPLACHENO:=GET_OUT;
                     Curr_Ud^.WHO:=id;
                     Maked:=True;
                end;
        end;
   begin
        if Curr_Person^.Wid_Raboty<>Osn_Wid_Raboty then Exit;
        Curr_Add:=Curr_Person^.Add;
        if List.Count=0 then Exit;
        finded:=false;
        for i:=0 to List.Count-1 do
            begin
                  if PRec(List.Items[i]).tabno=Curr_Person.TABNO then
                     begin
                          finded:=true;
                          Break;
                     end
            end;
        if not Finded then Exit;
        MovePodToPerson(PRec(List.Items[i]).SummaOtp
                       ,PRec(List.Items[i]).SummaEcb
                       ,PRec(List.Items[i]).SummaPod
                       ,PRec(List.Items[i]).ShifrECb
                       ,12);
        List.Delete(i);
   end;

begin
     wantedShifr:=169;
     NMES_Sav:=NMES;
     NSRV_Sav:=NSRV;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_SERV;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     SC:=0;
     List:=TList.Create;
     InitList;
     if List.Count>0 then
     for I_NSRV:=1 to COUNT_SERV do
         begin
              Sc:=Sc+1;
              ProgressBar1.Position:=Sc;
              if I_NSRV in [76,81,82,102,121,105,106,140] then Continue;
              NSRV:=I_NSRV;
              mkflnm;
              Label1.Caption:=Name_Serv(NSRV);
              Application.ProcessMessages;
              if not FileExists(fninf) then Continue;
              GetInf(False);
              Curr_Person:=Head_Person;
              Maked:=false;
              while (Curr_Person<>NIl) do
               begin
                    if Curr_person^.tabno=1189 then
                       Curr_person^.tabno:=1189;
                    MovePodToPerson(Curr_Person);
                    Curr_Person:=Curr_Person^.Next;
               end;
              if Maked then PUTINF;
              EMPTY_ALL_PERSON;

         end;
     if List.Count>0 then
        begin
            for i:=0 to List.Count-1 do
                begin
                     i_nsrv:=pRec(List.Items[i]).tabno;
                     if ((i_nsrv>0) and (i_nsrv<20000)) then
                        begin
                             SQLStmnt:='update tb_rclc_otp_07_16 set moved=1 where tabno='+intToStr(i_nsrv);
                             FIB.pFIBDatabaseSal.Execute(SQLStmnt);
                        end
                end;
            for i:=0 to List.Count-1 do
               Dispose(PRec(List.Items[i]));
        end;
     List.Free;
     NMES:=NMES_Sav;
     NSRV:=NSRV_Sav;
     MKFLNM;
     GETINF(TRUE);
     ShowMessage('Перенос закончен');

end;

end.
