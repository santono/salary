unit UFormTestECB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DB, DBClient, frxClass, frxDBSet,
  ExtCtrls;

type
  TECBMode=(ECB,ECBN,ECBIll,ECBDP);

  TFormTestECB = class(TForm)
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    cdsBol: TClientDataSet;
    frxDBDatasetMem: TfrxDBDataset;
    frxReportMem: TfrxReport;
    cdsBolTABNO: TIntegerField;
    cdsBolFIO: TStringField;
    cdsBolSUMMABOL: TFloatField;
    cdsBolSUMMAECB: TFloatField;
    cdsBolSUMMAECBRAS: TFloatField;
    cdsBolSUMMAECBRAZN: TFloatField;
    cdsBolY: TIntegerField;
    cdsBolM: TIntegerField;
    BitBtn2: TBitBtn;
    rgMode: TRadioGroup;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    procedure testECBForIll;
    procedure testECB(ECBMode:TECBMODE);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTestECB: TFormTestECB;

implementation
 uses ScrDef,ScrIo,ScrUtil,UFibModule,ScrLists;

{$R *.dfm}
 type pRec=^trec;
      trec=record
            tabno    : Integer;
            fio      : string;
            summabol : Real;
            summaecb : Real;
            y        : Integer;
            m        : Integer;
           end;


function CompareFio(Item1, Item2: Pointer): Integer;
begin
  Result := CompareText(prec(Item2).fio,pRec(Item1).Fio);
end;

procedure TFormTestECB.testECBForIll;
 var nmesTmp,nsrvTmp:Integer;
     i_nsrv:Integer;
     Curr_Person:PERSON_PTR;
     Curr_Ud:UD_PTR;
     Curr_Add:Add_PTR;
     list:TList;
     i:Integer;
     summaRas,summaRazn:Real;
     procedure AddToList;
       var rec:pRec;
           i:Integer;
           finded:Boolean;
       begin
           finded:=False;
           if list.count>0 then
              for i:=0 to list.Count-1 do
                  if pRec(list.Items[i])^.tabno=curr_person^.TABNO then
                  if pRec(list.Items[i])^.y=curr_add^.YEAR+1990 then
                  if pRec(list.Items[i])^.m=curr_add^.period then
                     begin
                          pRec(list.Items[i])^.summabol:=R10(pRec(list.Items[i])^.summabol+Curr_Add^.SUMMA);
//                          pRec(list.Items[i])^.summarub:=R10(pRec(list.Items[i])^.summarub+Curr_Ud^.SUMMA);
                          finded:=True;
                          Break;
                     end;
           if not finded then
              begin
                   New(Rec);
                   Rec.tabno    := Curr_Person^.TABNO;
                   rec.summabol := curr_add^.SUMMA;
                   rec.summaecb := 0;
                   rec.y        := curr_add^.YEAR+1990;
                   rec.m        := curr_add^.PERIOD;
                   list.add(Rec);
              end;

       end;
     procedure UdToList;
       var rec:pRec;
           i:Integer;
           finded:Boolean;
       begin
           finded:=False;
           if list.count>0 then
              for i:=0 to list.Count-1 do
                  if pRec(list.Items[i])^.tabno=curr_person^.TABNO then
                  if pRec(list.Items[i])^.y=curr_ud^.YEAR+1990 then
                  if pRec(list.Items[i])^.m=curr_ud^.period then
                     begin
//                          pRec(list.Items[i])^.summabol:=R10(pRec(list.Items[i])^.summabol+Curr_Add^.SUMMA);
                            pRec(list.Items[i])^.summaecb:=R10(pRec(list.Items[i])^.summaecb+Curr_Ud^.SUMMA);
                          finded:=True;
                          Break;
                     end;
           if not finded then
              begin
                   New(Rec);
                   Rec.tabno    := Curr_Person^.TABNO;
                   rec.summabol := 0;
                   rec.summaecb := curr_ud^.summa;
                   rec.y        := curr_ud^.YEAR+1990;
                   rec.m        := curr_ud^.PERIOD;
                   list.add(Rec);
              end;

       end;
 begin
      nmesTmp:=nmes;
      nsrvTmp:=NSRV;
  //    MarkPodrInList(uMode);
      putinf;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      list:=TList.Create;
      for i_nsrv:=1 to Count_Serv do
          begin
               ProgressBar1.Position:=i_nsrv;
               Application.ProcessMessages;
//               if not NameServList.IsSelected(i_nsrv) then
//                  Continue;
               nsrv:=i_nsrv;
               MKFLNM;
               if not FileExists(fninf) then
                  Continue;
               getinf(false);
               Curr_person:=HEAD_PERSON;
               while (Curr_Person<>Nil) do
                  begin
                       curr_add:=curr_person.add;
                       while (Curr_add<>nil) do
                          begin
//                               if (IsBolnShifrForECB(Curr_Add^.SHIFR)) then
                               if (IsBolnShifr(Curr_Add^.SHIFR)) then
                                  AddToList;
                               Curr_Add:=Curr_Add.NEXT;
                          end;
                       curr_ud:=curr_person.UD;
                       while (Curr_Ud<>nil) do
                          begin
                               if (Curr_Ud^.SHIFR=ECBIllShifr) then
                                  UdToList;
                               Curr_Ud:=Curr_Ud.NEXT;
                          end;
                       Curr_Person:=Curr_Person.NEXT;
                  end;
               EMPTY_ALL_PERSON;
          end;
      if list.Count=0 then
         ShowMessage('Нет больничных и есв с больничных')
      else
      if list.Count>0 then
         begin
              for i:=0 to list.Count-1 do
                  prec(list.Items[i]).fio:=GetFullRusFioPerson(prec(list.Items[i]).tabno);
              list.Sort(@CompareFio);
              cdsBol.Open;
              cdsBol.EmptyDataSet;
              for i:=0 to list.Count-1 do
                  begin
                       summaRas:=r10(prec(list.Items[i]).summabol*ECBIllProc);
                       summaRazn:=r10(r10(summaRas)-r10(prec(list.Items[i]).summaecb));
                       if not (
                           (rgMode.ItemIndex=0)
                           or
                           ((rgMode.ItemIndex=1)and (Abs(summaRazn)>0.01))
                          ) then
                            Continue;

                       cdsBol.Insert;
                       cdsBolTABNO.Value         := prec(list.Items[i]).tabno;
                       cdsBolY.Value             := prec(list.Items[i]).y;
                       cdsBolM.Value             := prec(list.Items[i]).M;
                       cdsBolFIO.Value           := prec(list.Items[i]).fio;
                       cdsBolSUMMABOL.Value      := prec(list.Items[i]).summabol;
                       cdsBolSUMMAECB.Value      := prec(list.Items[i]).summaecb;
                       cdsBolSUMMAECBRAS.Value   := r10(summaRas);
                       cdsBolSUMMAECBRAZN.Value  := r10(summaRazn);
                       cdsBol.Post;
                  end;
              cdsBol.First;
              while (not cdsBol.Eof) do
               begin
                     i:=cdsBolY.Value;
                     cdsBol.Next;
               end;
              frxReportMem.ShowReport;
         end;
      if list.count>0 then
         for i:=0 to list.count-1 do
             Dispose(pRec(list.Items[i]));
      list.Free;
      nmes:=nmesTmp;
      NSRV:=nsrvTmp;
      MKFLNM;
      getinf(true);


 end;

procedure TFormTestECB.testECB(ECBMode:TECBMODE);
 var nmesTmp,nsrvTmp:Integer;
     i_nsrv:Integer;
     Curr_Person:PERSON_PTR;
     Curr_Ud:UD_PTR;
     Curr_Add:Add_PTR;
     list:TList;
     i:Integer;
     s:string;
     summaRas,summaRazn:Real;
     ECBCurrShifr:Integer;
     ECBCurrProc:Real;

     procedure AddToList;
       var rec:pRec;
           i:Integer;
           finded:Boolean;
           y,m:Integer;

       begin
           finded:=False;
           if not IsOtherPeriodECBShifr(Curr_add^.shifr) then
              begin
                   y:=curryear;
                   m:=nmes;
              end
           else
              begin
                   y:=curr_add^.YEAR+1990;
                   m:=curr_add^.PERIOD;
              end;



           if list.count>0 then
              for i:=0 to list.Count-1 do
                  if pRec(list.Items[i])^.tabno=curr_person^.TABNO then
                  if pRec(list.Items[i])^.y=y then
                  if pRec(list.Items[i])^.m=m then
                     begin
                          pRec(list.Items[i])^.summabol:=R10(pRec(list.Items[i])^.summabol+Curr_Add^.SUMMA);
//                          pRec(list.Items[i])^.summarub:=R10(pRec(list.Items[i])^.summarub+Curr_Ud^.SUMMA);
                          finded:=True;
                          Break;
                     end;
           if not finded then
              begin
                   New(Rec);
                   Rec.tabno    := Curr_Person^.TABNO;
                   rec.fio      := Curr_Person^.FIO;
                   rec.summabol := curr_add^.SUMMA;
                   rec.summaecb := 0;
                   rec.y        := y;
                   rec.m        := m;
                   list.add(Rec);
              end;

       end;
     procedure UdToList;
       var rec:pRec;
           i:Integer;
           finded:Boolean;
       begin
           finded:=False;
           if list.count>0 then
              for i:=0 to list.Count-1 do
                  if pRec(list.Items[i])^.tabno=curr_person^.TABNO then
                  if pRec(list.Items[i])^.y=curr_ud^.YEAR+1990 then
                  if pRec(list.Items[i])^.m=curr_ud^.period then
                     begin
//                          pRec(list.Items[i])^.summabol:=R10(pRec(list.Items[i])^.summabol+Curr_Add^.SUMMA);
                            pRec(list.Items[i])^.summaecb:=R10(pRec(list.Items[i])^.summaecb+Curr_Ud^.SUMMA);
                          finded:=True;
                          Break;
                     end;
           if not finded then
              begin
                   New(Rec);
                   Rec.tabno    := Curr_Person^.TABNO;
                   rec.fio      := Curr_Person^.FIO;
                   rec.summabol := 0;
                   rec.summaecb := curr_ud^.summa;
                   rec.y        := curr_ud^.YEAR+1990;
                   rec.m        := curr_ud^.PERIOD;
                   list.add(Rec);
              end;

       end;
 begin
      nmesTmp:=nmes;
      nsrvTmp:=NSRV;
  //    MarkPodrInList(uMode);
      putinf;
      EMPTY_ALL_PERSON;
      if (ECBMode =ECBN) then
         begin
              ECBCurrShifr:=ECBNShifr;
              ECBCurrProc:=ECBNProc;
         end
      else
      if (ECBMode =ECB) then
         begin
              ECBCurrShifr:=ECBShifr;
              ECBCurrProc:=ECBProc;
         end
      else
      if (ECBMode =ECBDP) then
         begin
              ECBCurrShifr:=ECBDPShifr;
              ECBCurrProc:=ECBDPProc;
         end
      else
         begin
              ShowMessage('Неверный режим проверки');
              Exit;
         end;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      list:=TList.Create;
      for i_nsrv:=1 to Count_Serv do
          begin
               ProgressBar1.Position:=i_nsrv;
               Application.ProcessMessages;
//               if not NameServList.IsSelected(i_nsrv) then
//                  Continue;
               nsrv:=i_nsrv;
               if  (ECBMode in [ECB,ECBN]) then
               if DOG_POD_PODRAZD(nsrv) then Continue;
               if  (ECBMode = ECBDP) then
               if not DOG_POD_PODRAZD(nsrv) then Continue;
               MKFLNM;
               if not FileExists(fninf) then
                  Continue;
               getinf(false);
               Curr_person:=HEAD_PERSON;
               while (Curr_Person<>Nil) do
                  begin
                       if  (
                               ((ECBMode=ECB) and not IsSciPed(Curr_Person))
                               or
                               ((ECBMode=ECBN) and IsSciPed(Curr_Person))
                               or
                               (ECBMode=ECBDp)
                              ) then

                          begin
                              curr_add:=curr_person.add;
                              while (Curr_add<>nil) do
                               begin
                                  if (not IsBolnShifr(Curr_Add^.SHIFR)) then
                                  if ShifrList.IsECB(Curr_Add^.shifr) then
                                     AddToList;
                                   Curr_Add:=Curr_Add.NEXT;
                               end;
                          end;
                       curr_ud:=curr_person.UD;
                       while (Curr_Ud<>nil) do
                          begin
                               if (Curr_Ud^.SHIFR=ECBCurrShifr) then
                                  UdToList;
                               Curr_Ud:=Curr_Ud.NEXT;
                          end;
                       Curr_Person:=Curr_Person.NEXT;
                  end;
               EMPTY_ALL_PERSON;
          end;
      if list.Count=0 then
         ShowMessage('Нет начислений 3,6%и есв с них')
      else
      if list.Count>0 then
         begin
              for i:=0 to list.Count-1 do
                  begin
                       s:=GetFullRusFioPerson(prec(list.Items[i]).tabno);
                       if Length(Trim(s))>0 then
                          prec(list.Items[i]).fio:=GetFullRusFioPerson(prec(list.Items[i]).tabno);
                       if prec(list.Items[i]).summabol>SSLimityList.GetLimitForECB(prec(list.Items[i]).y,prec(list.Items[i]).m) then
                          prec(list.Items[i]).summabol:=SSLimityList.GetLimitForECB(prec(list.Items[i]).y,prec(list.Items[i]).m);
                  end;
              list.Sort(@CompareFio);
              cdsBol.Open;
              cdsBol.EmptyDataSet;
              for i:=0 to list.Count-1 do
                  begin
                       summaRas:=r10(prec(list.Items[i]).summabol*ECBCurrProc);
                       summaRazn:=r10(R10(summaRas)-r10(prec(list.Items[i]).summaecb));
                       if not (
                           (rgMode.ItemIndex=0)
                           or
                           ((rgMode.ItemIndex=1)and (Abs(summaRazn)>0.01))
                          ) then
                            Continue;
                       cdsBol.Insert;
                       cdsBolTABNO.Value         := prec(list.Items[i]).tabno;
                       cdsBolY.Value             := prec(list.Items[i]).y;
                       cdsBolM.Value             := prec(list.Items[i]).M;
                       cdsBolFIO.Value           := prec(list.Items[i]).fio;
                       cdsBolSUMMABOL.Value      := prec(list.Items[i]).summabol;
                       cdsBolSUMMAECB.Value      := prec(list.Items[i]).summaecb;
                       cdsBolSUMMAECBRAS.Value   := r10(summaRas);
                       cdsBolSUMMAECBRAZN.Value  := r10(summaRazn);
                       cdsBol.Post;
                  end;
              cdsBol.First;
              while (not cdsBol.Eof) do
               begin
                     i:=cdsBolY.Value;
                     cdsBol.Next;
               end;
              frxReportMem.ShowReport;
         end;
      if list.count>0 then
         for i:=0 to list.count-1 do
             Dispose(pRec(list.Items[i]));
      list.Free;
      nmes:=nmesTmp;
      NSRV:=nsrvTmp;
      MKFLNM;
      getinf(true);


 end;

procedure TFormTestECB.BitBtn1Click(Sender: TObject);
begin
      Caption:='Проверка расчета ЕСВ c больничных';
      Application.ProcessMessages;

      testECBForIll;
end;

procedure TFormTestECB.BitBtn2Click(Sender: TObject);
begin
     Caption:='Проверка расчета ЕСВ 3,6%';
     Application.ProcessMessages;
     testECB(ECB);
end;

procedure TFormTestECB.FormCreate(Sender: TObject);
begin
     Caption:='Проверка расчета ЕСВ всех видов';
     rgMode.ItemIndex:=0;
end;

procedure TFormTestECB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormTestECB.BitBtn3Click(Sender: TObject);
begin
     Caption:='Проверка расчета ЕСВ 6,1%';
     Application.ProcessMessages;
     testECB(ECBN);

end;

procedure TFormTestECB.BitBtn4Click(Sender: TObject);
begin
     Caption:='Проверка расчета ЕСВ с договоров подряда';
     Application.ProcessMessages;
     testECB(ECBDP);

end;

end.
