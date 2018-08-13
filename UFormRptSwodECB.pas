unit UFormRptSwodECB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls,
  frxExportTXT, frxExportXLS, frxExportHTML;

type
  TFormRptSwodECB = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    LabelFIO: TLabel;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxTXTExport1: TfrxTXTExport;
    frxrprtswod1: TfrxReport;
    frxsrdtst1: TfrxUserDataSet;
    frxrprtswod2: TfrxReport;
    frxsrdtst2: TfrxUserDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

    procedure frxsrdtst1GetValue(const VarName: String;
      var Value: Variant);
    procedure frxsrdtst1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxsrdtst1Next(Sender: TObject);
    procedure frxsrdtst1First(Sender: TObject);
    procedure frxrprtswod1GetValue(const VarName: String;
      var Value: Variant);
    procedure frxsrdtst2CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxsrdtst2First(Sender: TObject);
    procedure frxsrdtst2Next(Sender: TObject);
    procedure frxsrdtst2GetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
 
    procedure MakeEcbSwod1;

  public
    { Public declarations }
  end;

var
  FormRptSwodECB   : TFormRptSwodECB;
  CntFormRptTstECB : integer;


implementation
  uses ScrIo , ScrDef , ScrUtil , ScrLists , ComOBJ, uFormMkPensList,
       UFormRptTstEcb ,UFormTstECBAddFromSQL;
  
  type (* PRecECB=^TRecECB;
        TRecECB = record
                 y               : Integer;
                 m               : Integer;
                 tabno           : integer;
                 fio             : string ;
                 SummaNAdd       : real;
                 SummaNMaxAdd    : real;
                 SummaECBN       : real;
                 SummaECBNRas    : real;
                 SummaECBNRazn   : real;
                 SummaAdd        : real;
                 SummaMaxAdd     : real;
                 SummaECB        : real;
                 SummaECBRas     : real;
                 SummaECBRazn    : real;
                 SummaDPAdd      : real;
                 SummaDPMaxAdd   : real;
                 SummaDPECB      : real;
                 SummaDPECBRas   : real;
                 SummaDPECBRazn  : real;
                 SummaIllAdd     : real;
                 SummaIllMaxAdd  : real;
                 SummaIllECB     : real;
                 SummaIllECBRas  : real;
                 SummaIllECBRazn : real;
                end;
   *)
        TEcbRecSwod1=record
                       SummaAddTot  : Real;
                       SummaAddLim  : Real;
                       SummaEcbFakt : Real;
                       SummaEcbRas  : Real;
                     end;
        TEcbRecSwod2=record
                       SummaAddTot  : Real;
                       SummaAddLim  : Real;
                       SummaEcbFakt : Real;
                     end;


  var List:TStringList;
      i_count:integer;
      EcbSwodAlla1:array[1..4] of TEcbRecSwod1;
      EcbSwodAlla2:array[1..4] of TEcbRecSwod2;
{$R *.dfm}

procedure TFormRptSwodECB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormRptTstECB>0 then
         Dec(CntFormRptTstECB);
end;

procedure TFormRptSwodECB.FormCreate(Sender: TObject);
begin
      Inc(CntFormRptTstECB);
end;

procedure TFormRptSwodECB.Button1Click(Sender: TObject);
 type PItem=^TItem;
      TItem=record
             y:Integer;
             m:Integer;
            end;
 var savnmes,savnsrv:integer;
     i_nsrv  : integer;
     i_count : integer;
     y,m     : Integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_ptr;
     Curr_Ud     : Ud_ptr;
     RecECB      : PRecECB;
     I,JIndex    : integer;
     Finded      : boolean;
     Dev         : TextFile;
     FName       : string;
     ListYM      : TList;
     SummaAddECBNOth    : real;
     SummaAddECBOth     : Real;
     SummaAddECBDPOth   : Real;
     SummaAddECBIllOth  : Real;
     SummaUdECBNOth     : real;
     SummaUdECBOth      : real;
     SummaUdECBDPOth    : real;
     SummaUdECBIllOth   : real;
     FindedOth          : Boolean;

  procedure AddDataFromSql;
    var FormTstECBAddFromSQL:TFormTstECBAddFromSQL;
    begin
         Application.CreateForm(TFormTstECBAddFromSQL,FormTstECBAddFromSQL);
         FormTstECBAddFromSQL.SetList(List);
         FormTstECBAddFromSQL.Show;
         FormTstECBAddFromSQL.Execute;
    end;



  procedure BuildListYM(CurrPerson:Person_Ptr);
   var Curr_Add : ADD_PTR;
       Curr_Ud  : UD_PTR;
       Finded   : Boolean;
       Y,M,I    : Integer;
       Item     : PItem;
   begin
        ListYM:=TList.Create;
        Curr_Add:=Curr_Person^.ADD;
        while (Curr_Add<>Nil) do
         begin
              if IsOtherPeriodECBShifr(Curr_Add^.SHIFR) then
                 begin
                      y:=Curr_Add^.YEAR+1990;
                      m:=Curr_Add^.PERIOD;
                 end
              else
                 begin
                      y:=CURRYEAR;
                      m:=nmes;
                 end;
              finded:=False;
              if ListYM.Count>0 then
                 for i:=0 to ListYM.Count-1 do
                     if ((PItem(ListYM.Items[i]).y=y) and
                         (PItem(ListYM.Items[i]).m=m)) then
                         begin
                              Finded:=True;
                              Break;
                         end;
                 if not Finded then
                    begin
                         New(Item);
                         Item.y:=y;
                         Item.m:=m;
                         ListYM.Add(Item);
                    end;
              Curr_Add:=Curr_Add^.NEXT;
         end;
        Curr_Ud:=Curr_Person^.UD;
        while (Curr_Ud<>Nil) do
         begin
              if ((Curr_Ud^.SHIFR=ECBShifr) or
                  (Curr_Ud^.SHIFR=ECBNShifr) or
                  (Curr_Ud^.SHIFR=ECBIllShifr) or
                  (Curr_Ud^.SHIFR=ECBDpShifr)) then
                  begin
                       y:=Curr_Ud^.Year+1990;
                       m:=Curr_Ud^.Period;
                       finded:=False;
                       if ListYM.Count>0 then
                          for i:=0 to ListYM.Count-1 do
                              if ((PItem(ListYM.Items[i]).y=y) and
                                  (PItem(ListYM.Items[i]).m=m)) then
                                  begin
                                       Finded:=True;
                                       Break;
                                  end;
                          if not Finded then
                             begin
                                  New(Item);
                                  Item.y:=y;
                                  Item.m:=m;
                                  ListYM.Add(Item);
                             end;
                  end;
              Curr_Ud:=Curr_Ud^.NEXT;
         end;
   end;
  function Test10001:boolean;
   var F:boolean;
       JI:integer;
       a:real;
   begin
        f:=List.Find('10001',JI);
        if not f then
           begin
               result:=false;
               Exit;
           end;
        a:=PRecECB(List.Objects[JIndex]).SummaNAdd;
        if abs(a)>0.001 then
           begin
                Result:=true;
                Exit;
           end;


   end;
  function BuildStrKey(Tabno:Integer;Y:Integer;m:integer):string;
   begin
        BuildStrKey:=IntToStr(Tabno)+' '+IntToStr(Y)+' '+IntToStr(M);
   end;
begin
     savnmes := nmes;
     savnsrv := nsrv;
     putinf;
     while (head_person<>nil) do del_person(Head_person);
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     List:=TStringList.Create;
     List.Sorted:=true;
     List.Capacity:=6000;
     for i_nsrv:=1 to count_serv do
         begin
//              if i_nsrv<>87 then continue;
              ProgressBar1.Position:=i_nsrv;
              nsrv:=i_nsrv;
              mkflnm;
              if not FileExists(fninf) then continue;
              if nsrv=106 then continue; // с материальной помощи есв не берется
              LabelPodr.Caption:=Name_Serv(NSRV);
              getinf(true);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                     if Curr_Person^.Tabno=1038  then
                        Finded:=false;
                     if ((nsrv=87) and (Curr_Person^.Tabno=10338)) then
                        Finded:=false;
            //         if not (Curr_Person^.tabno=277) then
            //            begin
            //                 Curr_Person:=Curr_Person^.NEXT;
            //                 continue;
            //            end;
                     BuildListYM(Curr_Person);
                     if not Assigned(ListYM) then
                        begin
                             Curr_Person:=Curr_Person^.NEXT;
                             Continue;
                        end;
                     if ListYM.Count<1 then
                        begin
                             Curr_Person:=Curr_Person^.NEXT;
                             Continue;
                        end;
                     for i_count:=0 to ListYM.Count-1 do
                         begin
                               y:=PItem(ListYM.Items[i_count]).y;
                               m:=PItem(ListYM.Items[i_count]).m;
                               Finded:=false;
                               LabelFIO.Caption:=IntToStr(Curr_Person^.Tabno)+' '+Curr_Person^.Fio;
                               Application.ProcessMessages;
                               if List.Find(BuildStrKey(Curr_Person^.Tabno,y,m),JIndex,) then Finded:=true;
                               if not Finded  then
                                  begin
                                       New(RecECB);
                                       FillChar(RecECB^,SizeOf(RecECB^),0);
                                       RecECB^.Y   := Y;
                                       RecECB^.M   := M;
                                       RecECB^.tabno   := Curr_Person^.TABNO;
                                       RecECB^.fio     := Curr_Person^.FIO;
                                       RecECB^.SummaNAdd      := 0;
                                       RecECB^.SummaNMaxAdd   := 0;
                                       RecECB^.SummaECBN      := 0;
                                       RecECB^.SummaAdd       := 0;
                                       RecECB^.SummaMaxAdd    := 0;
                                       RecECB^.SummaECB       := 0;
                                       RecECB^.SummaDPAdd     := 0;
                                       RecECB^.SummaDPMaxAdd  := 0;
                                       RecECB^.SummaDPECB     := 0;
                                       RecECB^.SummaIllAdd    := 0;
                                       RecECB^.SummaIllMaxAdd := 0;
                                       RecECB^.SummaIllECB    := 0;
                                       List.AddObject(BuildStrKey(Curr_Person^.Tabno,y,m),TObject(RecECB));
                                  end;
                               Finded:=List.Find(BuildStrKey(Curr_Person^.Tabno,y,m),JIndex);
                               Curr_Add:=Curr_Person^.Add;
                               while (Curr_Add<>Nil) do
                                     begin
                                          if (ShifrList.IsECB(Curr_Add^.Shifr) or ShifrList.IsECBIll(Curr_Add^.Shifr)) then
                                          if (((y=CURRYEAR) and (m=NMES) and ((not IsOtherPeriodECBShifr(Curr_Add^.Shifr)))
                                               or ((Curr_Add^.Period=m) and (Curr_Add^.YEAR+1990=y))) or
                                              ((not((y=CURRYEAR) and (m=NMES)))            and
                                                IsOtherPeriodECBShifr(Curr_Add^.Shifr) and
                                                (Curr_Add^.Period=m)                   and
                                                (Curr_Add^.YEAR+1990=y))) then
                                             begin
                                                  if Dog_Pod_Podrazd(NSRV) then
                                                     PRecECB(List.Objects[JIndex]).SummaDPAdd:=
                                                     PRecECB(List.Objects[JIndex]).SummaDPAdd+Curr_Add^.Summa
                                                  else
                                                  if ShifrList.IsECB(Curr_Add^.Shifr)then
                                                     if IsSciPed(Curr_Person) then
                                                        PRecECB(List.Objects[JIndex]).SummaNAdd:=
                                                          PRecECB(List.Objects[JIndex]).SummaNAdd+Curr_Add^.Summa
                                                     else
                                                        PRecECB(List.Objects[JIndex]).SummaAdd:=
                                                           PRecECB(List.Objects[JIndex]).SummaAdd+Curr_Add^.Summa
                                                  else
                                                  if ShifrList.IsECBIll(Curr_Add^.Shifr)then
                                                     PRecECB(List.Objects[JIndex]).SummaIllAdd:=
                                                         PRecECB(List.Objects[JIndex]).SummaIllAdd+Curr_Add^.Summa;
                                             end;
                                          Curr_Add:=Curr_Add^.NEXT;
                                     end;
                               Curr_Ud:=Curr_Person^.Ud;
                               while (Curr_Ud<>Nil) do
                                     begin
                                          if ((Curr_Ud^.Period=m) and (Curr_Ud^.Year+1990=Y)) then
                                             begin
                                                  if Curr_Ud^.Shifr=142 then
                                                     PRecECB(List.Objects[JIndex]).SummaECB :=
                                                         PRecECB(List.Objects[JIndex]).SummaECB+Curr_Ud^.Summa
                                                  else
                                                  if Curr_Ud^.Shifr=143 then
                                                     PRecECB(List.Objects[JIndex]).SummaECBN :=
                                                         PRecECB(List.Objects[JIndex]).SummaECBN+Curr_Ud^.Summa
                                                  else
                                                  if Curr_Ud^.Shifr=146 then
                                                     PRecECB(List.Objects[JIndex]).SummaDPECB :=
                                                         PRecECB(List.Objects[JIndex]).SummaDPECB+Curr_Ud^.Summa
                                                  else
                                                  if Curr_Ud^.Shifr=145 then
                                                     PRecECB(List.Objects[JIndex]).SummaIllECB :=
                                                         PRecECB(List.Objects[JIndex]).SummaIllECB+Curr_Ud^.Summa;
                                             end;
                                          Curr_Ud:=Curr_Ud^.NEXT;
                                     end;
                         end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              while (head_person<>nil) do del_person(Head_person);
         end;
     if Assigned(ListYM) then
        begin
             if ListYM.Count>0 then
                for i:=0 to ListYM.Count-1 do
                    Dispose(PItem(ListYM.Items[i]));
             ListYM.Free;
        end;
     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);

     if Test10001 then
        Finded:=true;

     AddDataFromSql;

     if List.Count>0 then
        begin
             ShowMessage('К-во='+IntToStr(List.Count));
             for i:=0 to List.Count-1 do
                 begin
                      SummaAddECBNOth    := 0.00 ;
                      SummaAddECBOth     := 0.00 ;
                      SummaAddECBDPOth   := 0.00 ;
                      SummaAddECBIllOth  := 0.00 ;
                      SummaUdECBNOth     := 0.00 ;
                      SummaUdECBOth      := 0.00 ;
                      SummaUdECBDPOth    := 0.00 ;
                      SummaUdECBIllOth   := 0.00 ;

                   //---
                      FindedOth:=UFormRptTstEcb.ListOth.Find(BuildStrKey(PRecECB(List.Objects[i]).Tabno,
                                                     PRecECB(List.Objects[i]).Y,
                                                     PRecECB(List.Objects[i]).M),JIndex);

                      if FindedOth then
                          begin
                               SummaAddECBNOth    := PRecECB(UFormRptTstEcb.ListOth.Objects[JIndex]).SummaNAdd;
                               SummaAddECBOth     := PRecECB(UFormRptTstEcb.ListOth.Objects[JIndex]).SummaAdd;
                               SummaAddECBDPOth   := PRecECB(UFormRptTstEcb.ListOth.Objects[JIndex]).SummaDPAdd;
                               SummaAddECBIllOth  := PRecECB(UFormRptTstEcb.ListOth.Objects[JIndex]).SummaIllAdd;
                               SummaUdECBNOth     := PRecECB(UFormRptTstEcb.ListOth.Objects[JIndex]).SummaECBN;
                               SummaUdECBOth      := PRecECB(UFormRptTstEcb.ListOth.Objects[JIndex]).SummaECB;
                               SummaUdECBDPOth    := PRecECB(UFormRptTstEcb.ListOth.Objects[JIndex]).SummaDPECB;
                               SummaUdECBIllOth   := PRecECB(UFormRptTstEcb.ListOth.Objects[JIndex]).SummaIllECB;
                          end;
                       if SummaAddECBNOth>LIMITFORPENS then
                          begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := 0.00 ;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := 0.00 ;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := 0.00 ;
                               PRecECB(List.Objects[i]).SummaILLMaxAdd  := 0.00 ;
                          end
                       else
                   //---
                       if PRecECB(List.Objects[i]).SummaNAdd+SummaAddECBNOth>LimitForPens then
                          begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := LimitForPens - SummaAddECBNOth;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := 0;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := 0;
                               PRecECB(List.Objects[i]).SummaILLMaxAdd  := 0;
                          end
                       else
                       if ( SummaAddECBNOth                    +
                            PRecECB(List.Objects[i]).SummaNAdd +
                            SummaAddECBOth )>LIMITFORPENS then
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := SummaAddECBNOth + PRecECB(List.Objects[i]).SummaNAdd;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := 0;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := 0;
                           end
                       else
                       if ( SummaAddECBNOth                    +
                            PRecECB(List.Objects[i]).SummaNAdd +
                            SummaAddECBOth                     +
                            PRecECB(List.Objects[i]).SummaAdd)>LIMITFORPENS then
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := SummaAddECBNOth + PRecECB(List.Objects[i]).SummaNAdd;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd-SummaAddECBOth;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := 0;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := 0;
                           end


                   //    if (PRecECB(List.Objects[i]).SummaNAdd+PRecECB(List.Objects[i]).SummaAdd)>LimitForPens then
                   //       begin
                   //            PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd;
                   //            PRecECB(List.Objects[i]).SummaMaxAdd     := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd;
                   //            PRecECB(List.Objects[i]).SummaDPMaxAdd   := 0;
                   //            PRecECB(List.Objects[i]).SummaIllMaxAdd  := 0;
                   //        end
                       else
           //            if (PRecECB(List.Objects[i]).SummaNAdd +
                       if ( SummaAddECBNOth                    +
                            PRecECB(List.Objects[i]).SummaNAdd +
                            SummaAddECBOth                     +
                            PRecECB(List.Objects[i]).SummaAdd  +
                            SummaAddECBDPOth
                           )>LIMITFORPENS then
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd + SummaAddECBNOth;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := PRecECB(List.Objects[i]).SummaAdd  + SummaAddECBOth;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd-PRecECB(List.Objects[i]).SummaMaxAdd;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := 0;
                           end


                   //    if (PRecECB(List.Objects[i]).SummaNAdd+PRecECB(List.Objects[i]).SummaAdd+PRecECB(List.Objects[i]).SummaDPAdd)>LimitForPens then
                   //        begin
                   //            PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd;
                   //            PRecECB(List.Objects[i]).SummaMaxAdd     := PRecECB(List.Objects[i]).SummaAdd;
                   //            PRecECB(List.Objects[i]).SummaDPMaxAdd   := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd-PRecECB(List.Objects[i]).SummaMaxAdd;
                   //            PRecECB(List.Objects[i]).SummaIllMaxAdd  := 0;
                   //        end
                       else
                       if ( SummaAddECBNOth                    +
                            PRecECB(List.Objects[i]).SummaNAdd +
                            SummaAddECBOth                     +
                            PRecECB(List.Objects[i]).SummaAdd  +
                            SummaAddECBDPOth                   +
                            PRecECB(List.Objects[i]).SummaDPAdd
                           )>LIMITFORPENS then
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd + SummaAddECBNOth;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := PRecECB(List.Objects[i]).SummaAdd  + SummaAddECBOth;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd-PRecECB(List.Objects[i]).SummaMaxAdd - SummaAddECBDPOth;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := 0;
                           end
              //         if (PRecECB(List.Objects[i]).SummaNAdd+PRecECB(List.Objects[i]).SummaAdd+PRecECB(List.Objects[i]).SummaDPAdd+PRecECB(List.Objects[i]).SummaIllAdd)>LimitForPens then
              //             begin
              //                 PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd;
              //                 PRecECB(List.Objects[i]).SummaMaxAdd     := PRecECB(List.Objects[i]).SummaAdd;
              //                 PRecECB(List.Objects[i]).SummaDPMaxAdd   := PRecECB(List.Objects[i]).SummaDPAdd;
              //                 PRecECB(List.Objects[i]).SummaIllMaxAdd  := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd
              //                                                                         -PRecECB(List.Objects[i]).SummaMaxAdd
              //                                                                         -PRecECB(List.Objects[i]).SummaDPMaxAdd;
              //             end

            //---
                       else
                       if ( SummaAddECBNOth                     +
                            PRecECB(List.Objects[i]).SummaNAdd  +
                            SummaAddECBOth                      +
                            PRecECB(List.Objects[i]).SummaAdd   +
                            SummaAddECBDPOth                    +
                            PRecECB(List.Objects[i]).SummaDPAdd +
                            SummaAddECBIllOth
                           )>LIMITFORPENS then
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd   + SummaAddECBNOth;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := PRecECB(List.Objects[i]).SummaAdd    + SummaAddECBOth;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := PRecECB(List.Objects[i]).SummaDPAdd  + SummaAddECBDPOth;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd-
                                                                                        PRecECB(List.Objects[i]).SummaMaxAdd -
                                                                                        PRecECB(List.Objects[i]).SummaDPMaxAdd;
                           end
                       else
                       if ( SummaAddECBNOth                      +
                            PRecECB(List.Objects[i]).SummaNAdd   +
                            SummaAddECBOth                       +
                            PRecECB(List.Objects[i]).SummaAdd    +
                            SummaAddECBDPOth                     +
                            PRecECB(List.Objects[i]).SummaDPAdd  +
                            SummaAddECBIllOth                    +
                            PRecECB(List.Objects[i]).SummaIllAdd 
                           )>LIMITFORPENS then
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd   + SummaAddECBNOth;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := PRecECB(List.Objects[i]).SummaAdd    + SummaAddECBOth;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := PRecECB(List.Objects[i]).SummaDPAdd  + SummaAddECBDPOth;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd-
                                                                                        PRecECB(List.Objects[i]).SummaMaxAdd -
                                                                                        PRecECB(List.Objects[i]).SummaDPMaxAdd -
                                                                                        SummaAddECBIllOth;
                           end



            //---
                       else
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := PRecECB(List.Objects[i]).SummaAdd;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := PRecECB(List.Objects[i]).SummaDPAdd;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := PRecECB(List.Objects[i]).SummaIllAdd;
                           end;
                       PRecECB(List.Objects[i]).SummaECBNRas    := r10(PRecECB(List.Objects[i]).SummaNMaxAdd*ECBNProc);
                       PRecECB(List.Objects[i]).SummaECBNRazn   := PRecECB(List.Objects[i]).SummaECBNRas-PRecECB(List.Objects[i]).SummaECBN;
                       PRecECB(List.Objects[i]).SummaECBRas     := r10(PRecECB(List.Objects[i]).SummaMaxAdd*ECBProc);
                       PRecECB(List.Objects[i]).SummaECBRazn    := PRecECB(List.Objects[i]).SummaECBRas-PRecECB(List.Objects[i]).SummaECB;
                       PRecECB(List.Objects[i]).SummaDPECBRas   := r10(PRecECB(List.Objects[i]).SummaDPMaxAdd*ECBDPProc);
                       PRecECB(List.Objects[i]).SummaDPECBRazn  := PRecECB(List.Objects[i]).SummaDPECBRas-PRecECB(List.Objects[i]).SummaDPECB;;
                       PRecECB(List.Objects[i]).SummaIllECBRas  := r10(PRecECB(List.Objects[i]).SummaIllMaxAdd*ECBIllProc);;
                       PRecECB(List.Objects[i]).SummaIllECBRazn := PRecECB(List.Objects[i]).SummaIllECBRas-PRecECB(List.Objects[i]).SummaIllECB;
                 end;

             MakeEcbSwod1;
 (*
             repeat
                 Finded:=false;
                 if List.Count=0 then break;
                 for i:=0 to List.Count-1 do
                     begin
                          if abs(abs(r10(PRecECB(List.Objects[i]).SummaNMaxAdd*0.061))-abs(r10(PRecECB(List.Objects[i]).SummaECBN)))>0.05 then Continue;
                          if abs(abs(r10(PRecECB(List.Objects[i]).SummaMaxAdd*0.036))-abs(r10(PRecECB(List.Objects[i]).SummaECB)))>0.05 then Continue;
                          if abs(abs(r10(PRecECB(List.Objects[i]).SummaDPMaxAdd*0.026))-abs(r10(PRecECB(List.Objects[i]).SummaDPECB)))>0.05 then Continue;
                          if abs(abs(r10(PRecECB(List.Objects[i]).SummaIllMaxAdd*0.02))-abs(r10(PRecECB(List.Objects[i]).SummaIllECB)))>0.05 then Continue;
                          Finded:=true;
                          List.Delete(i);
                          break;
                     end;
             until not Finded;
*)
   //  ShowMessage('К-во after ='+IntToStr(List.Count));
  //   if Test10001 then
        Finded:=true;


        end;
     List.Free;
     if Assigned(UFormRptTstEcb.ListOth) then
        begin
             UFormRptTstEcb.ListOth.Free;
             UFormRptTstEcb.ListOth:=nil;
        end;
     while (head_person<>nil) do del_person(Head_person);
     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);
     Self.Close;
end;






procedure TFormRptSwodECB.MakeEcbSwod1;
 var I,iii : Integer;
     Dev   : TextFile;
     S     : string;
     FName : string;
     Summa1, Summa2, Summa3, Summa4 :Real;
 begin
    //  FName:=CDOC+'Ftst.txt';
    //  AssignFile(Dev,FName);
    //  Rewrite(Dev);
      MAKEPENSLIST(2);
      Summa1 := 0.00;
      Summa2 := 0.00;
      Summa3 := 0.00;
      Summa4 := 0.00;
      for i:=1 to 4 do
          begin
               EcbSwodAlla1[i].SummaAddTot  := 0;
               EcbSwodAlla1[i].SummaAddLim  := 0;
               EcbSwodAlla1[i].SummaEcbFakt := 0;
               EcbSwodAlla1[i].SummaEcbRas  := 0;
               EcbSwodAlla2[i].SummaAddTot  := 0;
               EcbSwodAlla2[i].SummaAddLim  := 0;
               EcbSwodAlla2[i].SummaEcbFakt := 0;
          end;
      if List.Count>0 then
         begin
            for i:=0 to List.Count-1 do
                begin
(*
                     if (
                         (abs(PRecECB(List.Objects[i]).SummaDpAdd)>0.01) or
                         (abs(PRecECB(List.Objects[i]).SummaDpMaxAdd)>0.01) or
                         (abs(PRecECB(List.Objects[i]).SummaDpECB)>0.01) or
                         (abs(PRecECB(List.Objects[i]).SummaDpECBRas)>0.01)
                        ) then
                          begin
                        writeln(Dev,PRecECB(List.Objects[i]).Tabno:5 ,
                                    PRecECB(List.Objects[i]).Y:5     ,
                                    PRecECB(List.Objects[i]).M:3     ,
                                    Copy(PRecECB(List.Objects[i]).FIO+space(25),1,25)   ,
                                    PRecECB(List.Objects[i]).SummaDpAdd :12:2,
                                    PRecECB(List.Objects[i]).SummaDpMaxAdd :12:2 ,
                                    PRecECB(List.Objects[i]).SummaDPECB :12:2 ,
                                    PRecECB(List.Objects[i]).SummaDPECBRAS :12:2
                        );
                         Summa1 := Summa1 + PRecECB(List.Objects[i]).SummaDpAdd;
                         Summa2 := Summa2 + PRecECB(List.Objects[i]).SummaDpMaxAdd;
                         Summa3 := Summa3 + PRecECB(List.Objects[i]).SummaDpECB;
                         Summa4 := Summa4 + PRecECB(List.Objects[i]).SummaDpECBRas;

                         end;
*)
                     EcbSwodAlla1[1].SummaAddTot  := EcbSwodAlla1[1].SummaAddTot  + PRecECB(List.Objects[i]).SummaNAdd;
                     EcbSwodAlla1[1].SummaAddLim  := EcbSwodAlla1[1].SummaAddLim  + PRecECB(List.Objects[i]).SummaNMaxAdd;
                     EcbSwodAlla1[1].SummaEcbFakt := EcbSwodAlla1[1].SummaEcbFakt + PRecECB(List.Objects[i]).SummaECBN;
                     EcbSwodAlla1[1].SummaEcbRas  := EcbSwodAlla1[1].SummaEcbRas  + PRecECB(List.Objects[i]).SummaECBNRas;
                     EcbSwodAlla1[2].SummaAddTot  := EcbSwodAlla1[2].SummaAddTot  + PRecECB(List.Objects[i]).SummaAdd;
                     EcbSwodAlla1[2].SummaAddLim  := EcbSwodAlla1[2].SummaAddLim  + PRecECB(List.Objects[i]).SummaMaxAdd;
                     EcbSwodAlla1[2].SummaEcbFakt := EcbSwodAlla1[2].SummaEcbFakt + PRecECB(List.Objects[i]).SummaECB;
                     EcbSwodAlla1[2].SummaEcbRas  := EcbSwodAlla1[2].SummaEcbRas  + PRecECB(List.Objects[i]).SummaECBRas;
                     EcbSwodAlla1[3].SummaAddTot  := EcbSwodAlla1[3].SummaAddTot  + PRecECB(List.Objects[i]).SummaDpAdd;
                     EcbSwodAlla1[3].SummaAddLim  := EcbSwodAlla1[3].SummaAddLim  + PRecECB(List.Objects[i]).SummaDpMaxAdd;
                     EcbSwodAlla1[3].SummaEcbFakt := EcbSwodAlla1[3].SummaEcbFakt + PRecECB(List.Objects[i]).SummaDpECB;
                     EcbSwodAlla1[3].SummaEcbRas  := EcbSwodAlla1[3].SummaEcbRas  + PRecECB(List.Objects[i]).SummaDpECBRas;
                     EcbSwodAlla1[4].SummaAddTot  := EcbSwodAlla1[4].SummaAddTot  + PRecECB(List.Objects[i]).SummaIllAdd;
                     EcbSwodAlla1[4].SummaAddLim  := EcbSwodAlla1[4].SummaAddLim  + PRecECB(List.Objects[i]).SummaIllMaxAdd;
                     EcbSwodAlla1[4].SummaEcbFakt := EcbSwodAlla1[4].SummaEcbFakt + PRecECB(List.Objects[i]).SummaIllECB;
                     EcbSwodAlla1[4].SummaEcbRas  := EcbSwodAlla1[4].SummaEcbRas  + PRecECB(List.Objects[i]).SummaIllECBRas;

                     EcbSwodAlla2[2].SummaAddTot  := EcbSwodAlla2[2].SummaAddTot  + PRecECB(List.Objects[i]).SummaDpAdd;
                     EcbSwodAlla2[2].SummaAddLim  := EcbSwodAlla2[2].SummaAddLim  + PRecECB(List.Objects[i]).SummaDpMaxAdd;
                     EcbSwodAlla2[2].SummaEcbFakt := EcbSwodAlla2[2].SummaEcbFakt + PRecECB(List.Objects[i]).SummaDpEcb;
                     if PensionerList.IsPensioner(PRecECB(List.Objects[i]).tabno) then
                        begin
                             EcbSwodAlla2[4].SummaAddTot  := EcbSwodAlla2[4].SummaAddTot  + PRecECB(List.Objects[i]).SummaNAdd
                                                                                          + PRecECB(List.Objects[i]).SummaAdd
                                                                                          + PRecECB(List.Objects[i]).SummaIllAdd;
                             EcbSwodAlla2[4].SummaAddLim  := EcbSwodAlla2[4].SummaAddLim  + PRecECB(List.Objects[i]).SummaNMaxAdd
                                                                                          + PRecECB(List.Objects[i]).SummaMaxAdd
                                                                                          + PRecECB(List.Objects[i]).SummaIllMaxAdd;
                             EcbSwodAlla2[4].SummaEcbFakt := EcbSwodAlla2[4].SummaEcbFakt + PRecECB(List.Objects[i]).SummaEcbN
                                                                                          + PRecECB(List.Objects[i]).SummaEcb
                                                                                          + PRecECB(List.Objects[i]).SummaIllEcb;
                        end
                     else
                        begin
                             EcbSwodAlla2[1].SummaAddTot  := EcbSwodAlla2[1].SummaAddTot  + PRecECB(List.Objects[i]).SummaNAdd    + PRecECB(List.Objects[i]).SummaAdd;
                             EcbSwodAlla2[1].SummaAddLim  := EcbSwodAlla2[1].SummaAddLim  + PRecECB(List.Objects[i]).SummaNMaxAdd + PRecECB(List.Objects[i]).SummaMaxAdd;
                             EcbSwodAlla2[1].SummaEcbFakt := EcbSwodAlla2[1].SummaEcbFakt + PRecECB(List.Objects[i]).SummaEcbN    + PRecECB(List.Objects[i]).SummaEcb; ;
                             EcbSwodAlla2[3].SummaAddTot  := EcbSwodAlla2[3].SummaAddTot  + PRecECB(List.Objects[i]).SummaIllAdd;
                             EcbSwodAlla2[3].SummaAddLim  := EcbSwodAlla2[3].SummaAddLim  + PRecECB(List.Objects[i]).SummaIllMaxAdd;
                             EcbSwodAlla2[3].SummaEcbFakt := EcbSwodAlla2[3].SummaEcbFakt + PRecECB(List.Objects[i]).SummaIllEcb;
                        end;


                 end;
             frxsrdtst1.RangeEndCount := 4;
             frxrprtswod1.ShowReport;
             frxsrdtst2.RangeEndCount := 4;
             frxrprtswod2.ShowReport;
         end;
      for iii:=0 to PensionerList.Count-1 do
          Dispose(PPensionerRec(PensionerList.Items[iii]));
      PensionerList.Free;
   (*
      writeln(Dev,All(' ',5) ,
                  All(' ',5) ,
                  All(' ',3) ,
                  All(' ',25) ,
                  Summa1 :12:2,
                  Summa2 :12:2 ,
                  Summa3 :12:2 ,
                  Summa4 :12:2
       );

      CloseFile(Dev);
   *)
 end;
procedure TFormRptSwodECB.frxsrdtst1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'name')=0 then
        case i_count of
          1 : Value:='6.1%';
          2 : Value:='3.6%';
          3 : Value:='2.6%';
          4 : Value:='2.0%';
        end
     else if CompareText(VarName,'summaadd')=0 then
             Value:=EcbSwodAlla1[i_count].SummaAddTot
     else if CompareText(VarName,'summaaddlim')=0 then
             Value:=EcbSwodAlla1[i_count].SummaAddLim
     else if CompareText(VarName,'summaecb')=0 then
             Value:=EcbSwodAlla1[i_count].SummaEcbFakt
     else if CompareText(VarName,'summaecbras')=0 then
             Value:=EcbSwodAlla1[i_count].SummaEcbRas;


end;




procedure TFormRptSwodECB.frxsrdtst1CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=5 then Eof:=true
      else Eof:=false;
end;

procedure TFormRptSwodECB.frxsrdtst1Next(Sender: TObject);
begin
     Inc(i_count);
end;

procedure TFormRptSwodECB.frxsrdtst1First(Sender: TObject);
begin
     i_count:=1;
end;

procedure TFormRptSwodECB.frxrprtswod1GetValue(const VarName: String;
  var Value: Variant);
  var i:Integer;
begin
     i:=1;

end;

procedure TFormRptSwodECB.frxsrdtst2CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=5 then Eof:=true
      else Eof:=false;
end;
procedure TFormRptSwodECB.frxsrdtst2First(Sender: TObject);
begin
      i_count:=1;
end;
procedure TFormRptSwodECB.frxsrdtst2Next(Sender: TObject);
begin
      Inc(i_count);
end;
procedure TFormRptSwodECB.frxsrdtst2GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'name')=0 then
        case i_count of
          1 : Value:='Для 36,3% (все остальные)';
          2 : Value:='Для 34,7% (договора подряда)';
          3 : Value:='Для 33,2% (больничные)';
          4 : Value:='Для  8,41%(инвалиды)';
        end
     else if CompareText(VarName,'summaadd')=0 then
             Value:=EcbSwodAlla2[i_count].SummaAddTot
     else if CompareText(VarName,'summalim')=0 then
             Value:=EcbSwodAlla2[i_count].SummaAddLim
     else if CompareText(VarName,'summaecb')=0 then
             case i_count of
              1: Value:=R10(EcbSwodAlla2[i_count].SummaAddLim*0.363);
              2: Value:=R10(EcbSwodAlla2[i_count].SummaAddLim*0.347);
              3: Value:=R10(EcbSwodAlla2[i_count].SummaAddLim*0.332);
              4: Value:=R10(EcbSwodAlla2[i_count].SummaAddLim*0.0841);
             end;

end;


begin
  CntFormRptTstECB:=0;





end.
