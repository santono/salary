unit UFormMovePod12Recalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormMovePod12Recalc = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSet1TABNO: TFIBIntegerField;
    pFIBDataSet1SUMMAREZ1: TFIBBCDField;
    pFIBDataSet1SUMMAREZ2: TFIBBCDField;
    pFIBDataSet1SUMMAREZ3: TFIBBCDField;
    pFIBDataSet1SUMMAREZ4: TFIBBCDField;
    pFIBDataSet1SUMMAREZ5: TFIBBCDField;
    pFIBDataSet1SUMMAREZ6: TFIBBCDField;
    pFIBDataSet1SUMMAREZ7: TFIBBCDField;
    pFIBDataSet1SUMMAREZ8: TFIBBCDField;
    pFIBDataSet1SUMMAREZ9: TFIBBCDField;
    pFIBDataSet1SUMMAREZ10: TFIBBCDField;
    pFIBDataSet1SUMMAREZ11: TFIBBCDField;
    pFIBDataSet1SUMMAREZ12: TFIBBCDField;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
     procedure ExecuteMovePod2012;

  public
    { Public declarations }
  end;

var
  FormMovePod12Recalc: TFormMovePod12Recalc;

implementation
  Uses UFibModule,ScrDef,ScrIo,ScrUtil;

{$R *.dfm}

procedure TFormMovePod12Recalc.BitBtn1Click(Sender: TObject);
begin
     if MessageDlg('Выполнить перенос данных перерасчета под.налога за 2012 г?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
     ExecuteMovePod2012;
end;

procedure TFormMovePod12Recalc.ExecuteMovePod2012;
type
     PRec=^TRec;
     TRec=record
           tabno   : Integer;
           Summa   : array[1..12] of Real;
          end;
var NMES_Sav,NSRV_Sav:Integer;
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    Maked:Boolean;
    List:TList;
    I:Integer;
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
                Rec.Summa[1]  := pFIBDataSet1SummaRez1.Value;
                Rec.Summa[2]  := pFIBDataSet1SummaRez2.Value;
                Rec.Summa[3]  := pFIBDataSet1SummaRez3.Value;
                Rec.Summa[4]  := pFIBDataSet1SummaRez4.Value;
                Rec.Summa[5]  := pFIBDataSet1SummaRez5.Value;
                Rec.Summa[6]  := pFIBDataSet1SummaRez6.Value;
                Rec.Summa[7]  := pFIBDataSet1SummaRez7.Value;
                Rec.Summa[8]  := pFIBDataSet1SummaRez8.Value;
                Rec.Summa[9]  := pFIBDataSet1SummaRez9.Value;
                Rec.Summa[10] := pFIBDataSet1SummaRez10.Value;
                Rec.Summa[11] := pFIBDataSet1SummaRez11.Value;
                Rec.Summa[12] := pFIBDataSet1SummaRez12.Value;
                List.Add(Rec);
                pFIBDataSet1.Next;
           end;
         pFIBDataSet1.Close;
         pFIBDataSet1.Transaction.Commit;
    end;
  procedure MovePodToPerson(Curr_Person:Person_Ptr);
   var Curr_Add:Add_Ptr;
       Rec:PRec;
       Finded:Boolean;
       i,j:Integer;
       procedure MovePodToPerson(Summa:Real;Period:integer);
        const id=49;
        var Curr_Ud:UD_PTR;
        procedure Delete_Ud_Pod;
         var Finished:Boolean;
             Curr_Ud:UD_PTR;
         begin
              while True do
               begin
                     Finished:=True;
                     Curr_Ud:=Curr_Person^.UD;
                     while (Curr_Ud<>Nil) do
                       begin
                            if Curr_Ud^.SHIFR  = Podoh_shifr then
                            if Curr_Ud^.Period = Period      then
                            if Curr_Ud^.YEAR   = 2012-1990   then
                            if Curr_Ud^.WHO    = Id          then
                               begin
                                    DEL_UD(Curr_Ud,Curr_Person);
                                    Finished:=False;
                               end;
                            Curr_Ud:=Curr_Ud^.NEXT;
                       end;
                     if Finished then Break;
               end;
         end;
        begin
             if Abs(Summa)<0.01 then Exit;
             Delete_Ud_Pod;
             MAKE_UD(Curr_Ud,Curr_Person);
             Curr_Ud^.SHIFR:=PODOH_SHIFR;
             Curr_Ud^.SUMMA:=Summa;
             Curr_Ud^.PERIOD:=Period;
             Curr_Ud^.YEAR:=2012-1990;
             Curr_Ud^.VYPLACHENO:=GET_OUT;
             Curr_Ud^.WHO:=id;
             Maked:=True;

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
        for j:=1 to 12 do
            MovePodToPerson(PRec(List.Items[i]).Summa[j],j);
        List.Delete(i);
   end;

begin
     NMES_Sav:=NMES;
     NSRV_Sav:=NSRV;
     while (Head_Person<>Nil) do Del_Person(Head_Person);
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
                    MovePodToPerson(Curr_Person);
                    Curr_Person:=Curr_Person^.Next;
               end;
              if Maked then PUTINF;
              while (Head_Person<>Nil) do Del_Person(Head_Person);

         end;
     if List.Count>0 then
        for i:=0 to List.Count-1 do
            Dispose(PRec(List.Items[i]));
     List.Free;
     NMES:=NMES_Sav;
     NSRV:=NSRV_Sav;
     MKFLNM;
     GETINF(TRUE);

end;

end.
