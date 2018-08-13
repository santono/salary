unit UFormMoveAwans2017_12;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormMoveAwans2017_12 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSet1TABNO: TFIBIntegerField;
    pFIBDataSet1SHIFRPOD: TFIBSmallIntField;
    pFIBDataSet1DOLG: TFIBStringField;
    pFIBDataSet1SUMMA: TFIBBCDField;
    pFIBDataSet1SHIFRGRU: TFIBSmallIntField;
    pFIBDataSet1SHIFRKAT: TFIBSmallIntField;
    pFIBDataSet1WR: TFIBSmallIntField;
    pFIBDataSet1MOVED: TFIBSmallIntField;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    wantedShifr:integer;
     procedure ExecuteMovePod2012;

  public
    { Public declarations }
  end;

var
  FormMoveAwans2017_12: TFormMoveAwans2017_12;

implementation
  Uses UFibModule,ScrDef,ScrIo,ScrUtil;

{$R *.dfm}


procedure TFormMoveAwans2017_12.BitBtn1Click(Sender: TObject);
begin
     if MessageDlg('Выполнить перенос аванча в 12 2017?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
     ExecuteMovePod2012;
end;

procedure TFormMoveAwans2017_12.ExecuteMovePod2012;
type
     PRec=^TRec;
     TRec=record
           tabno    : Integer;
           summa    : real;
           shifrpod : integer;
           shifrkat : integer;
           shifrgru : integer;
           wr       : integer;
           moved    : integer;
          end;
var NMES_Sav,NSRV_Sav:Integer;
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    Maked:Boolean;
    List:TList;
    I:Integer;
    SQLStmnt:string;
    DEV:TEXTFILE;
    FNAME:STRING;
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
                Rec.Summa     := pFIBDataSet1SUMMA.Value;
                Rec.shifrpod  := pFIBDataSet1shifrpod.Value;
                Rec.shifrkat  := pFIBDataSet1shifrkat.Value;
                Rec.shifrgru  := pFIBDataSet1SHIFRGRU.Value;
                Rec.wr        := pFIBDataSet1WR.Value;
                Rec.moved     := pFIBDataSet1MOVED.Value;
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
       procedure MoveAwaToPerson(SummaAwa:Real);
        const id=49;
        var Curr_Ud:Ud_PTR;
        function isAwans:boolean;
         var retVal:Boolean;
             Curr_Ud:Ud_PTR;
         begin
              retVal:=false;
              Curr_Ud:=Curr_Person^.Ud;
              while (Curr_Ud<>Nil) do
                 begin
                      if Curr_Ud^.SHIFR =103 then
                         begin
                              retVal:=true;
                              break;
                         end;
                      Curr_Ud:=Curr_Ud^.NEXT;
                 end;
              isAwans:=retval;
         end;
        begin
             if isAwans then exit;
             MAKE_Ud(Curr_Ud,Curr_Person);
             Curr_Ud^.SHIFR := 103;
             Curr_Ud^.SUMMA := SummaAwa;
             Curr_Ud^.PERIOD := 12;
             Curr_Ud^.YEAR   := 2017-1990;
             Curr_Ud^.VYPLACHENO:=GET_OUT;
             Curr_Ud^.WHO:=id;
             maked:=true;
        end;
   begin
        if List.Count=0 then Exit;
        finded:=false;
        for i:=0 to List.Count-1 do
            begin
                  if PRec(List.Items[i]).tabno=Curr_Person.TABNO then
                  if PRec(List.Items[i]).shifrpod=nsrv then
                  if PRec(List.Items[i]).shifrkat=curr_person^.KATEGORIJA then
                  if PRec(List.Items[i]).shifrgru=curr_person^.gruppa then
                  if PRec(List.Items[i]).wr=curr_person^.wid_raboty then
                     begin
                          finded:=true;
                          Break;
                     end
            end;
        if not Finded then Exit;
        MoveAwaToPerson(PRec(List.Items[i]).Summa);
        List.Delete(i);
   end;

begin
     wantedShifr:=103;
     NMES_Sav:=NMES;
     NSRV_Sav:=NSRV;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_SERV;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     SC:=0;
     List:=TList.Create;
     InitList;
     ShowMessage('Записей '+IntToStr(List.Count));
     if List.Count>0 then
     for I_NSRV:=1 to COUNT_SERV do
         begin
              Sc:=Sc+1;
              ProgressBar1.Position:=Sc;
              if I_NSRV in [76,81,82,102,121,105,106] then Continue;
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
                    if Curr_person^.tabno=1356 then
                       Curr_person^.tabno:=1356;
                    MovePodToPerson(Curr_Person);
                    Curr_Person:=Curr_Person^.Next;
               end;
              if Maked then PUTINF;
              EMPTY_ALL_PERSON;

         end;
     if List.Count>0 then
        begin
            ShowMessage('Осталось не перенесено '+IntToStr(List.count));
            FNAME:=CDOC+'A.TXT';
            REWRITE(DEV,FNAME);
            for i:=0 to List.Count-1 do
               WRITELN(DEV,PRec(List.Items[i]).TABNO:6,PRec(List.Items[i]).SUMMA:12:2,PRec(List.Items[i]).SHIFRPOD:15);
            CLOSEFILE(DEV);
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
