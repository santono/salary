{$WARNINGS OFF}
{$HINTS OFF}
unit UFormMakeAwansLNR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  ComCtrls, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, ExtCtrls,scrDef;

type
  TFormMakeAwansLNR = class(TForm)
    LabelProcNeed: TLabel;
    dxCalcEditProc: TdxCalcEdit;
    dxCalcEditOkrugl: TdxCalcEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    pFIBQueryBBB: TpFIBQuery;
    pFIBTransactionBBB: TpFIBTransaction;
    CheckBoxIllSS: TCheckBox;
    rgProcSummaMode: TRadioGroup;
    LabelSummaNeed: TLabel;
    dxCalcEditSummaNeed: TdxCalcEdit;
    cbKassa: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgProcSummaModeClick(Sender: TObject);
  private
    { Private declarations }
    NeedOkrugl : real;
    NeedProc   : real;
    NeedSumma  : Real;
    WantedShifr: integer;
    WantedBank : integer;     // Приват банк
    WantedShifrBBB : integer; // Статья для БББ
    WantedBankBBB : integer;  // Код для БББ
    WantedModeILLSS : boolean;
    modeCalc:Integer;   // 0 - процент 1 - сумма
    procedure MakeWantedShifrBBB;
    function getProc:Real;
    function isNeedPerson(curr_Person:PERSON_PTR):Boolean;


  public
    { Public declarations }
  end;

var
  FormMakeAwansLNR: TFormMakeAwansLNR;

implementation
 uses UFormSelPKG,ScrLists,ScrIo,ScrUtil,UFibModule;

{$R *.dfm}

procedure TFormMakeAwansLNR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMakeAwansLNR.MakeWantedShifrBBB;
 var SQLStmnt : string;
 begin
       if pFIBQueryBBB.Open then
          pFIBQueryBBB.Close;
       if pFIBQueryBBB.Transaction.Active then
          pFIBQueryBBB.Transaction.Commit;
       SQLStmnt:='SELECT FIRST 1 SHIFRSTABBB FROM TB_BANK_STA WHERE SHIFRSTA='+IntToStr(WantedShifr);
       pFIBQueryBBB.SQL.Clear;
       pFIBQueryBBB.SQL.Add(SQLStmnt);
       pFIBQueryBBB.Transaction.StartTransaction;
       pFIBQueryBBB.ExecQuery;
       WantedShifrBBB:=pFIBQueryBBB.Fields[0].AsInteger;
       if pFIBQueryBBB.Transaction.Active then
          pFIBQueryBBB.Transaction.Commit;

 end;

procedure TFormMakeAwansLNR.BitBtn2Click(Sender: TObject);
 var i : integer;
     Save_NSRV,Save_NMES : integer;
     Curr_Person : Person_Ptr;
     ChangedPodr : boolean;
 procedure Make_Awans_For_Person(Curr_Person:Person_Ptr);
  var Curr_Add:Add_Ptr;
      Curr_Ud: Ud_Ptr;
      SummaAdd:real;
      SummaUd:real;
      SummaAwa:real;
      summaPrem:Real;
      SummaAwaInt:integer;
      W_Sta : integer;
      function GetWSta:integer;
       var RetVal : integer;
       begin
           RetVal := WantedShifr;
//           if Curr_Person^.BANK=2 then RetVal:=WantedShifrBBB;
           if Curr_Person^.BANK>1 then RetVal:=BankiList.getBankShifrSta(Curr_Person^.BANK);
           if RetVal=0 then retVal:=WantedShifr;
           GetWSta := RetVal;
       end;
  begin
       W_Sta:=GetWSta;
       if W_Sta<1 then Exit;
       Del_Wanted_Ud(W_Sta,Curr_Person,NMES);
       SummaAdd := 0;
       SummaUd  := 0;
       Curr_Add:=Curr_Person^.Add;
       summaPrem:=0;
       while (Curr_Add<>Nil) do
         begin
               SummaAdd:=Sum(SummaAdd) + Sum(Curr_Add^.Summa);
               if ((NMES=12) and (CURRYEAR=2022)) then
                  if curr_Add^.shifr=46 then
                     summaPrem:=curr_add^.SUMMA;
               Curr_Add:=Curr_Add^.Next;
         end;
       Curr_Ud:=Curr_Person^.Ud;
       while (Curr_Ud<>Nil) do
         begin
               SummaUd:=Sum(SummaUd) + Sum(Curr_Ud^.Summa);
               Curr_Ud:=Curr_Ud^.Next;
         end;
       if ((NMES=12) and (CURRYEAR=2022)) then
          SummaAwa:=summaPrem+Sum((SummaAdd-summaPrem-SummaUd)*NeedProc/100)
       else
          SummaAwa:=Sum((SummaAdd-SummaUd)*NeedProc/100);
       if SummaAwa<0.009 then Exit;
       if NeedOkrugl>0.01 then
          begin
               SummaAwaInt := round(Int(SummaAwa));
               SummaAwaInt := (SummaAwaInt div round(NeedOkrugl)) * round(NeedOkrugl);
               SummaAwa    := SummaAwaInt;
          end;
       if SummaAwa>0.005 then
          begin
                Make_Ud(Curr_Ud,Curr_Person);
                Curr_Ud^.Shifr := W_Sta;
                Curr_Ud^.Summa := SummaAwa;
                Curr_Ud^.Period := NMES;
                Curr_Ud^.YEAR   := CurrYear-1990;
                ChangedPodr:=true;
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
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья аванса');
             Exit;
        end;
     modeCalc:=rgProcSummaMode.ItemIndex;
     if modeCalc<0 then ModeCalc:=0;
     if modeCalc>1 then ModeCalc:=1;
     if modeCalc=0 then
        begin
             val(dxCalcEditProc.Text,NeedProc,i);
             if i<>0 then
                begin
                      ShowMessage('Неверно указан % удержания статьи');
                      Exit;
                end;
             if not ((NeedProc>0) and (NeedProc<100.01)) then
                begin
                      ShowMessage('Неверно указан % удержания статьи');
                      Exit;
                end;
        end;
     if modeCalc=1 then
        begin
             val(dxCalcEditSummaNeed.Text,NeedSumma,i);
             if i<>0 then
                begin
                      ShowMessage('Неверно указана требуемая сумма');
                      Exit;
                end;
             if not ((NeedSumma>0) and (NeedSumma<1000000000.01)) then
                begin
                      ShowMessage('Неверно указана требуемая сумма');
                      Exit;
                end;
        end;
     val(dxCalcEditOkrugl.Text,NeedOkrugl,i);
     if i<>0 then
        begin
             ShowMessage('Неверно указан режим округления');
             Exit;
        end;
     if not ((NeedOkrugl>0-0.01) and (NeedOkrugl<1001)) then
        begin
             ShowMessage('Неверно указан режим округления');
             Exit;
        end;
     WantedShifr:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                WantedShifr:=i;
                break;
            end;
     if WantedShifr<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;
     WantedModeIllSS   := false;
     if CheckBoxIllSS.Checked then
        WantedModeIllSS   := true;
     WantedShifrBBB :=WantedShifr; // Статья для БББ
     MakeWantedShifrBBB;
     for i:=1 to max_gruppa     do curr_gruppa[i]     := false;
     for i:=1 to max_kategorija do curr_kategorija[i] := false;
     for i:=1 to KategList.Count do
         if KategList.IsSelected(i) then
            curr_kategorija[i]:=true;
     for i:=1 to GruppyList.Count do
         if GruppyList.IsSelected(i) then
            curr_gruppa[i]:=true;


     if modeCalc=1 then
        begin
             needProc:=getProc;
             ShowMessage('Вычисленный процент = '+FloatToStr(needProc));
             if not ((NeedProc>0.000001) and (NeedProc<100.01)) then
                begin
                    ShowMessage('Невенрно вычисленный процент');
                    Exit;
                end
        end;

     EMPTY_ALL_PERSON;
     ProgressBar1.Max      := COUNT_SERV;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     BitBtn2.Enabled:=False;
     SAVE_NSRV := NSRV;
     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              NSRV:=I;
              ProgressBar1.Position := I;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              Application.ProcessMessages;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              ChangedPodr:=false;
              Curr_Person:=Head_Person;
              while (Curr_Person<>nil) do
                     begin
                           if Curr_Kategorija[Curr_Person^.Kategorija] then
                           if Curr_Gruppa[Curr_Person^.Gruppa] then
                           if (not WantedModeILLSS) or
                              (WantedModeILLSS and ((Get_Dol_Code(Curr_Person))=1500)) then
                           if isNeedPerson(Curr_Person) then
                              Make_Awans_For_Person(Curr_Person);
                           Curr_Person:=Curr_Person^.NEXT;
                     end;
              if ChangedPodr then PutInf;
              EMPTY_ALL_PERSON;
         end;
     BitBtn2.Enabled:=tRUE;
     NSRV := SAVE_NSRV;
     MKFLNM;
     GetInf(TRUE);
     ShowMessage('Расчет аванса выполнен!');
     Self.Close;


end;

procedure TFormMakeAwansLNR.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormMakeAwansLNR.FormCreate(Sender: TObject);
begin
    WantedBank    := 1;     // Приват банк
    WantedBankBBB := 2;     // Код для БББ
    WantedModeIllSS := false;
    CheckBoxIllSS.Checked:=false;
    rgProcSummaMode.ItemIndex:=0;
    LabelSummaNeed.Hide;
    dxCalcEditSummaNeed.Hide;
    LabelProcNeed.Show;
    dxCalcEditProc.Show;
    modeCalc:=0; // 0 - процент 1 - сумма   1738002,75
    cbKassa.Checked:=True;
end;

procedure TFormMakeAwansLNR.rgProcSummaModeClick(Sender: TObject);
begin
     if rgProcSummaMode.ItemIndex=0 then
        begin
              LabelSummaNeed.Hide;
              dxCalcEditSummaNeed.Hide;
              LabelProcNeed.Show;
              dxCalcEditProc.Show;
        end
     else
     if rgProcSummaMode.ItemIndex=1 then
        begin
              LabelSummaNeed.Show;
              dxCalcEditSummaNeed.Show;
              LabelProcNeed.Hide;
              dxCalcEditProc.Hide;
        end;

end;
function TFormMakeAwansLNR.getProc:Real;
 var summaKVypl,summaKVyplPerson,wantedProc:real;
     save_nsrv,i:Integer;
     Curr_Person:PERSON_PTR;
   function getSummaKVyplPerson(Curr_Person:person_Ptr):real;
     var summaAdd,summaUd,summaAwa:Real;
         Curr_Add:Add_Ptr;
         Curr_Ud:UD_PTR;
     begin
       SummaAdd := 0;
       SummaUd  := 0;
       Curr_Add:=Curr_Person^.Add;
       while (Curr_Add<>Nil) do
         begin
               SummaAdd:=Sum(SummaAdd) + Sum(Curr_Add^.Summa);
               Curr_Add:=Curr_Add^.Next;
         end;
       Curr_Ud:=Curr_Person^.Ud;
       while (Curr_Ud<>Nil) do
         begin
               SummaUd:=Sum(SummaUd) + Sum(Curr_Ud^.Summa);
               Curr_Ud:=Curr_Ud^.Next;
         end;
       SummaAwa:=Sum(SummaAdd-SummaUd);
       if summaAwa<0.0001 then summaAwa:=0;
       getSummaKVyplPerson:=summaAwa;
     end;
begin
     summaKVypl:=0;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max      := COUNT_SERV;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;

     SAVE_NSRV := NSRV;
     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              NSRV:=I;
              ProgressBar1.Position := I;
              LabelPodr.Caption:=NAME_SERV(NSRV);
              Application.ProcessMessages;
              if not NameServList.IsSelected(NSRV) then continue;
              MKFLNM;
              if not FileExists(FNINF) then continue;
         //     NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              Curr_Person:=Head_Person;
              while (Curr_Person<>nil) do
                     begin
                           if Curr_Kategorija[Curr_Person^.Kategorija] then
                           if Curr_Gruppa[Curr_Person^.Gruppa] then
                           if (not WantedModeILLSS) or
                              (WantedModeILLSS and ((Get_Dol_Code(Curr_Person))=1500)) then
                           if isNeedPerson(Curr_Person) then
                               begin
                                   summaKVyplPerson:=getSummaKVyplPerson(Curr_Person);
                                   if summaKVyplPerson>0.01 then
                                      summaKVypl:=r10(summaKVypl)+r10(summaKVyplPerson);
                               end;
                           Curr_Person:=Curr_Person^.NEXT;
                     end;
              EMPTY_ALL_PERSON;
         end;
     NSRV := SAVE_NSRV;
     MKFLNM;
     GetInf(TRUE);
     if summaKVypl>0.01 then
       wantedProc:=needSumma/summaKVypl*100.00;
     getProc:=wantedProc;

end;

function TFormMakeAwansLNR.isNeedPerson(curr_Person:PERSON_PTR):Boolean;
 var RetVal:Boolean;
     Curr_Ud:UD_PTR;
 begin
      RetVal:=True;
      if cbKassa.Checked then
      if IsKassaPerson(Curr_Person) then
         retVal:=False;
//      curr_Ud:=curr_Person^.ud;
//      while (Curr_Ud<>nil) do
//        begin
//             if (curr_ud^.shifr=53) or
//                (curr_ud^.shifr=67) or
//                (curr_ud^.shifr=69) or
//                (curr_ud^.shifr=80) then
//                begin
//                     retVal:=False;
//                     break;
//                end;
//             curr_ud:=Curr_Ud.NEXT;
//        end;
      isNeedPerson:=retVal;
 end;

end.
