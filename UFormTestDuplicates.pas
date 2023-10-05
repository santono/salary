unit UFormTestDuplicates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormTestDuplicates = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ExecuteTestNadbDoublicates;
  public
    { Public declarations }
  end;

var
  FormTestDuplicates: TFormTestDuplicates;

implementation
  uses ScrDef,ScrUtil,ScrIo;

{$R *.dfm}

procedure TFormTestDuplicates.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormTestDuplicates.BitBtn1Click(Sender: TObject);
begin
     BitBtn1.Enabled:=False;
     ExecuteTestNadbDoublicates;
     BitBtn1.Enabled:=true;
end;

procedure TFormTestDuplicates.ExecuteTestNadbDoublicates;
type
     PRec=^TRec;
     TRec=record
           shifrsta   : Integer;
           period     : Integer;
           Vyplacheno : Integer;
           Summa      : Real;
           NmbOfRec   : Integer;
          end;
var NMES_Sav,NSRV_Sav:Integer;
    I_NSRV,SC:Integer;
    Curr_Person:Person_Ptr;
    cntRec : Integer;
  procedure TestPersonDup(Curr_Person:Person_Ptr);
   var Curr_Add:Add_Ptr;
       List:TList;
       Rec:PRec;
       Finded:Boolean;
       i:Integer;
       function countInCN(shifrSta:integer;Curr_Person:Person_Ptr):Integer;
         var Curr_Cn:Cn_Ptr;
             RetVal : Integer;
         begin
             RetVal := 0;
             Curr_Cn:=Curr_Person^.Cn;
             while (Curr_Cn<>Nil) do
               begin
                    if Curr_Cn^.Shifr     = shifrSta then
                    if Curr_Cn^.AUTOMATIC = AUTOMATIC_MODE then
                    if Curr_Cn^.KOD in [1..6] then
                       RetVal:=RetVal + 1;
                    Curr_Cn:=Curr_Cn^.Next;
               end;
             countInCN:=RetVal;
         end;

       function isInCN(Curr_Add:Add_Ptr;Curr_Person:Person_Ptr):Boolean;
         var Curr_Cn:Cn_Ptr;
             RetVal : Boolean;
         begin
             RetVal := False;
             Curr_Cn:=Curr_Person^.Cn;
             while (Curr_Cn<>Nil) do
               begin
                    if Curr_Cn^.Shifr=Curr_Add^.Shifr then
                    if Curr_Cn^.AUTOMATIC=AUTOMATIC_MODE then
                    if Curr_Cn^.KOD in [1..6] then
                       begin
                            RetVal:=True;
                            Break;
                       end;
                    Curr_Cn:=Curr_Cn^.Next;
               end;
             isInCN:=RetVal;
         end;
   begin
        List:=TList.Create;
        Curr_Add:=Curr_Person^.Add;
        while (Curr_Add<>Nil) do
          begin
               if not IsInCN(Curr_Add,Curr_Person) then
                  begin
                       Finded:=false;
                       if List.Count>0 then
                          for i:=0 to List.Count-1 do
                              begin
                                   if (
                                       (Curr_Add^.Shifr     = PRec(List.Items[i]).Shifrsta) and
                                       (Curr_Add^.Period    = PRec(List.Items[i]).Period) and
                                       (not (Curr_Add^.shifr in [5,13]))
//                                       and
//                                       (Curr_Add^.Vyplacheno = PRec(List.Items[i]).Vyplacheno) and
//                                       (abs(Curr_Add^.Summa-PRec(List.Items[i]).Summa)<0.01)
                                      ) then
                                    begin
                                         Finded:=True;
                                         Inc(PRec(List.Items[i]).NmbOfRec);
                                         Break;
                                    end;
                              end;

                       if (not Finded) then
                          begin
                               Rec:=new(PRec);
                               Rec.shifrsta   := Curr_Add^.Shifr;
                               Rec.Period     := Curr_Add^.Period;
                               Rec.Vyplacheno := Curr_Add^.Vyplacheno;
                               Rec.Summa      := Curr_Add^.Summa;
                               Rec.NmbOfRec   := 1;
                               List.Add(Rec);
                          end;
                  end;
               Curr_Add:=Curr_Add^.Next;
          end;
        for i:=0 to List.Count-1 do
            begin
                 if PRec(List.Items[i]).NmbOfRec>1 then
                 if PRec(List.Items[i]).NmbOfRec<>countInCN(PRec(List.Items[i]).ShifrSta,Curr_Person) then
                    begin
                         cntRec:=cntRec + 1;
                         ShowMessage('Подр.='+IntToStr(NSRV)+'. ФИО='+Trim(Curr_Person^.FIO)+'. Должн.='+trim(Curr_Person^.Dolg));
                         Break;
                    end;

            end;
        if List.Count>0 then
           for i:=0 to List.Count-1 do
               Dispose(PRec(List.Items[i]));
        List.Free;
   end;

begin
     NMES_Sav:=NMES;
     NSRV_Sav:=NSRV;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_SERV;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     SC:=0;
     cntRec:=0;
     for I_NSRV:=1 to COUNT_SERV do
         begin
              Sc:=Sc+1;
              ProgressBar1.Position:=Sc;
              NSRV:=I_NSRV;
              mkflnm;
              Label1.Caption:=Name_Serv(NSRV);
              Application.ProcessMessages;
              if not FileExists(fninf) then Continue;
            //  if I_NSRV<>124 then Continue;
              GetInf(False);
              Curr_Person:=Head_Person;
              while (Curr_Person<>NIl) do
               begin
                    TestPersonDup(Curr_Person);
                    Curr_Person:=Curr_Person^.Next;
               end;
              EMPTY_ALL_PERSON;

         end;
     if cntRec=0 then
        begin
             Label1.Caption:='Не найдено задвоений начислений';
             Application.ProcessMessages;
        end;
     NMES:=NMES_Sav;
     NSRV:=NSRV_Sav;
     MKFLNM;
     GETINF(TRUE);

end;

end.
