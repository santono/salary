unit uFormSwodSS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, ComCtrls,
  StdCtrls, Buttons;

type
  TFormSwodSS = class(TForm)
    pFIBTransactionQ: TpFIBTransaction;
    pFIBQueryQ: TpFIBQuery;
    ProgressBar: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
      procedure Calc_Swod_S_S;
      procedure Make_Gt_2660_Za_In(var SummaGt2660:real;Period:word);
      procedure Make_Gt_2660_Za;

  public
    { Public declarations }
  end;


var
  FormSwodSS: TFormSwodSS;

implementation
 uses ScrDef,ScrIo,ScrUtil,ScrLists,UFormView;
 CONST SIZEQ=4;

{$R *.dfm}

procedure TFormSwodSS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

PROCEDURE TFormSwodSS.CALC_SWOD_S_S;
 TYPE MATRIX = ARRAY[1..SIZEQ,1..SIZEQ] OF DOUBLE;
      VECTOR = ARRAY[1..SIZEQ] OF DOUBLE;
      PSSItem=^TSSItem;
      TSSItem=record
               ShifrGru  : Integer;
               SummaADD  : Real;
               SummaSS   : Real;
               SummaADD5 : Real;
               SummaSS5  : Real;
               SummaADD1 : Real;
               SummaSS1  : Real;
               Blocked   : Boolean;
              end;

VAR II,I        : INTEGER;
    LONG,BB     : INTEGER;
    C,REC,SC,LD : REAL;
    PROCENT     : REAL;
    NSRV_TEMP   : INTEGER;
    NMES_TEMP   : INTEGER;
    ESCPressed  : boolean;
    WantedShifr : integer;
    WantedMonth : integer;
    SSList      : TList;
    Mode        : (RemoveBoln,TotalCalc);
    I_NSRV      : integer;
 function Compare(Item1, Item2: Pointer): Integer;
  begin
       if PSSItem(Item1)^.ShifrGru>PSSItem(Item2)^.ShifrGru then Result:=1
                                                            else
       if PSSItem(Item1)^.ShifrGru<PSSItem(Item2)^.ShifrGru then Result:=-1
                                                            else Result:=0;
  end;

 FUNCTION SIMQ(VAR A:MATRIX;B:VECTOR;VAR X:VECTOR;N:INTEGER):BOOLEAN;
  VAR F:BOOLEAN;
      I,J,K,IMAX:INTEGER;
      TOL,BIGA,SAVE:DOUBLE;
  BEGIN
      TOL:=1E-20;
      FOR K:=1 TO N DO
          BEGIN
               BIGA:=0;
               IMAX:=0;
               FOR I:=K TO N DO
                   IF (ABS(BIGA)<ABS(A[I,K])) THEN
                      BEGIN
                           BIGA:=A[I,K];
                           IMAX:=I;
                      END;
               IF ABS(BIGA)<TOL THEN
                  BEGIN
                        WRITELN('Система уравнений вырождена');
                        SIMQ:=FALSE;
                        EXIT;
                  END;
               IF IMAX<>K THEN
                BEGIN
                  FOR J:=1 TO N DO
                      BEGIN
                           SAVE:=A[K,J];
                           A[K,J]:=A[IMAX,J];
                           A[IMAX,J]:=SAVE;
                      END;
                  SAVE:=B[K];
                  B[K]:=B[IMAX];
                  B[IMAX]:=SAVE;
                END;
               SAVE:=A[K,K];
               FOR I:=K TO N DO A[K,I]:=A[K,I]/SAVE;
               B[K]:=B[K]/SAVE;
               IF K<N THEN
               FOR I:=K+1 TO N DO
                 BEGIN
                      SAVE:=A[I,K];
                      FOR J:=K TO N DO A[I,J]:=A[I,J]-SAVE*A[K,J];
                      B[I]:=B[I]-SAVE*B[K];
                 END;
          END;  {END LOOP BY K}
     FOR I:=N DOWNTO 1 DO
         BEGIN
               SAVE:=0;
               IF I<N THEN FOR J:=I+1 TO N DO SAVE:=SAVE+A[I,J]*X[J];
               X[I]:=B[I]-SAVE;
         END;
       SIMQ:=TRUE;
   END;

 PROCEDURE CALC_S_S_PERSON(CURR_PERSON:PERSON_PTR);
  VAR CURR_ADD : ADD_PTR;
      CURR_UD  : UD_PTR;
      SUMMA    : REAL;
      SSItem   : PSSItem;
      JIndex   : Integer;
      Finded   : boolean;
      I        : integer;
 BEGIN
     Curr_Ud:=Curr_Person^.Ud;
     while (Curr_Ud<>Nil) do
       begin
            if Curr_Ud^.Shifr=S_S_Shifr      then
{            if Curr_Add^.Period=WantedMonth  then
            if Curr_Add^.Year=2004-1990      then
}
               begin
                     Finded:=false;
                     if SSList.Count>0 then
                        for i:=0 to SSList.Count-1 do
                            if PSSItem(SSList.Items[i])^.SHIFRGRU=Curr_Person^.Gruppa then
                               begin
                                    PSSItem(SSList.Items[i])^.SummaSS:=PSSItem(SSList.Items[i])^.SummaSS+Curr_Ud^.SUMMA;
                                    Finded:=true;
                                    break;
                               end;
                     if not Finded then
                        begin
                             SSItem:=New(PSSItem);
                             FillChar(SSItem^,SizeOf(SSItem^),0);
                             SSItem^.SHIFRGRU:=Curr_Person^.Gruppa;
                             SSItem^.SummaSS:=Curr_Ud^.Summa;
                             SSList.Add(SSItem);
                        end;
               end;
            Curr_Ud:=Curr_Ud^.Next;
       end;

{     if (NSRV=PENSIJA_PODRAZD) and (Mode=RemoveBoln) then exit;}
     IF DOG_POD_PODRAZD(NSRV) and (Mode=RemoveBoln)  THEN exit;

     Curr_Add:=Curr_Person^.Add;
     while (Curr_Add<>Nil) do
       begin
            if (ShifrList.ISS_S(CURR_ADD^.SHIFR) and (Mode=RemoveBoln)) or (Mode=TotalCalc) then
{            if Curr_Add^.Period=WantedMonth  then
            if Curr_Add^.Year=2004-1990      then}
               begin
                     if SSList.Count>0 then
                        for i:=0 to SSList.Count-1 do
                            if PSSItem(SSList.Items[i])^.SHIFRGRU=Curr_Person^.Gruppa then
                               begin
                                    PSSItem(SSList.Items[i])^.SummaAdd:=PSSItem(SSList.Items[i])^.SummaAdd+Curr_Add^.SUMMA;
                                    Finded:=true;
                                    break;
                               end;
                     if not Finded then
                        begin
                             SSItem:=New(PSSItem);
                             FillChar(SSItem^,SizeOf(SSItem^),0);
                             SSItem^.SHIFRGRU:=Curr_Person^.Gruppa;
                             SSItem^.SummaAdd:=Curr_Add^.Summa;
                        end;
               end;
            Curr_Add:=Curr_Add^.Next;
       end;
 END;



PROCEDURE CALC_S_S_ALL_PERSON;
 VAR CURR_PERSON:PERSON_PTR;
 BEGIN
      CURR_PERSON:=HEAD_PERSON;
      WHILE (CURR_PERSON<>NIL) DO
       BEGIN
            CALC_S_S_PERSON(CURR_PERSON);
            CURR_PERSON:=CURR_PERSON^.NEXT;
       END;
 END;

 procedure Calc_Swod_S_S;
  const h:string=(':   Счет   :  Начислено :  Удержано  :  Нач(0.5%) :  Уд.(0.5%) :  Нач(1%)   :  Уд.(1%)   :');
  var FName:String;
      Dev:TextFile;
      Add,ss,Add5,ss5,Add1,SS1,R,M,AddMax,Koef:real;
      ShifrGruM:integer;
      SSItem:PSSItem;
      JIndex,I:Integer;
      SummaTot,SummaGt2660,KoefGt2660,sgT2660:real;
  procedure RecalcSS(Item:Pointer);
   var U,L,A,B:Real;
   begin
        U:=PSSItem(Item)^.SummaAdd*0.01  ;
        L:=PSSItem(Item)^.SummaAdd*0.005 ;
        if (PSSItem(Item)^.SummaSS>U) then
           begin
                A:=PSSItem(Item)^.SummaSS;
                b:=PSSItem(Item)^.SummaAdd*Koef;
                PSSItem(Item)^.SummaSS:=r10(b);
                b:=r10(b);
                a:=r10(a);
                AddMax:=AddMax+A-B;
           end;
   end;
  procedure RecalcSSByKoef(Item:Pointer);
   begin
                PSSItem(Item)^.SummaSS:=r10(PSSItem(Item)^.SummaAdd*koef);
{
                b:=PSSItem(Item)^.SummaAdd*Koef;
                PSSItem(Item)^.SummaSS:=r10(b);
                b:=r10(b);
                a:=r10(a);
                AddMax:=AddMax+A-B;
}
   end;
  procedure CalcEQUSS(Item:Pointer);
   var a   : matrix;
       b   : vector;
       x   : vector;
       i,j : integer;
       U,L : Real;
   begin
        FillChar(a,SizeOf(A),0);
        FillChar(b,SizeOf(b),0);
        FillChar(x,SizeOf(x),0);
        b[1]:=PSSItem(Item)^.SummaADD;
        b[2]:=PSSItem(Item)^.SummaSS;
        a[1,1]:=1;
        a[1,2]:=1;
        a[2,3]:=1;
        a[2,4]:=1;
        a[3,1]:=-0.005;
        a[3,3]:=1;
        a[4,2]:=-0.01;
        a[4,4]:=1;
        if SimQ(a,b,x,4) then
           begin
                 PSSItem(Item)^.SummaADD5 := x[1];
                 PSSItem(Item)^.SummaADD1 := x[2];
                 PSSItem(Item)^.SummaSS5  := x[3];
                 PSSItem(Item)^.SummaSS1  := x[4];
                 U:=PSSItem(Item)^.SummaAdd*0.01;
                 L:=PSSItem(Item)^.SummaAdd*0.005;
                 if (U-PSSItem(Item)^.SummaSS>M) then
                    begin
                         m         := U-PSSItem(Item)^.SummaSS;
                         ShifrGruM := PSSItem(Item)^.ShifrGru;
                         Koef:=PSSItem(Item)^.SummaSS/PSSItem(Item)^.SummaAdd;
                    end;
                if (PSSItem(Item)^.SummaSS>U) then R:=R+PSSItem(Item)^.SummaSS-U;
           end;
   end;
  procedure PrintLine(Item:Pointer);
   begin
        write(dev,':',copy(GET_IST_NAME(PSSItem(Item)^.ShifrGru)+space(10),1,10));
        write(dev,':',PSSItem(Item)^.SummaAdd:12:2);
        write(dev,':',PSSItem(Item)^.SummaSS:12:2);
        write(dev,':',PSSItem(Item)^.SummaAdd5:12:2);
        write(dev,':',PSSItem(Item)^.SummaSS5:12:2);
        write(dev,':',PSSItem(Item)^.SummaAdd1:12:2);
        writeln(dev,':',PSSItem(Item)^.SummaSS1:12:2,':');
        Add  := Add+PSSItem(Item)^.SummaAdd;
        Add5 := Add5+PSSItem(Item)^.SummaAdd5;
        Add1 := Add1+PSSItem(Item)^.SummaAdd1;
        SS   := SS+PSSItem(Item)^.SummaSS;
        SS5  := SS5+PSSItem(Item)^.SummaSS5;
        SS1  := SS1+PSSItem(Item)^.SummaSS1;
   end;
  procedure CalcSumma(Item:Pointer);
   begin
        SummaTot:=SummaTot+PSSItem(Item)^.SummaAdd;
   end;
  procedure CalcSummaWithOutBlocked(Item:Pointer);
   begin
        if PSSItem(Item)^.Blocked then Exit;
        SummaTot:=SummaTot+PSSItem(Item)^.SummaAdd;
   end;
  procedure RecalcGt2660(Item:Pointer);
   begin
        if PSSItem(Item)^.Blocked then Exit;
        PSSItem(Item)^.SummaAdd:=PSSItem(Item)^.SummaAdd * (1-KoefGt2660);
   end;
  procedure PrintFoot;
   var S:String;
   begin
        writeln(Dev,Replicate('-',length(h)));
        write(dev,':',copy(' И т о г о'+space(10),1,10));
        write(dev,':',Add:12:2);
        write(dev,':',SS:12:2);
        write(dev,':',Add5:12:2);
        write(dev,':',SS5:12:2);
        write(dev,':',Add1:12:2);
        writeln(dev,':',SS1:12:2,':');
{        writeln(dev,'R=',R:12:2,' M=',M:12:2,' ShifrGru=',ShifrGruM);}
   end;
  begin
       add  := 0;
       ss   := 0;
       add5 := 0;
       ss5  := 0;
       add1 := 0;
       ss1  := 0;
       M    := 0;
       ShifrGruM := 1;
       Koef:=1;
       AddMax:=0;
       if SSList.Count>0 then for i:=0 to SSList.Count-1 do CalcEQUSS(SSList.Items[i]);
       FName:=cdoc+'S_S.txt';
       AssignFile(Dev,FName);
       ReWrite(Dev);
       { Печать исходного варианта }
       writeln(Dev,'Свод по соц.страху (исходный) за '+Month[NMES]);
       writeln(Dev,Replicate('-',length(h)));
       writeln(Dev,H);
       writeln(Dev,Replicate('-',length(h)));
       if SSList.Count>0 then for i:=0 to SSList.Count-1 do PrintLine(SSList.Items[i]);
       PrintFoot;
       writeln(Dev,Replicate('-',length(h)));

       {Учесть 2660}
       SUMMAGT2660:=0;
       SGT2660:=0;
       MAKE_GT_2660_ZA_IN(SUMMAGT2660,Nmes);
       SGT2660:=SGT2660+SUMMAGT2660;
       MAKE_GT_2660_ZA_IN(SUMMAGT2660,Nmes+1);
       SGT2660:=SGT2660+SUMMAGT2660;
       MAKE_GT_2660_ZA_IN(SUMMAGT2660,Nmes+2);
       SGT2660:=SGT2660+SUMMAGT2660;
       MAKE_GT_2660_ZA_IN(SUMMAGT2660,0);
       SUMMAGT2660:=SGT2660;
       {Уменьшить на эту сумму все счета}
       SummaTot:=0;
       if SSList.Count>0 then for i:=0 to SSList.Count-1 do CalcSummaWithoutBlocked(SSList.Items[i]);
       if (SummaTot>0.01) and (SUMMAGT2660>0) then
          begin
              KoefGt2660:= SUMMAGT2660 / SummaTot;
              if SSList.Count>0 then for i:=0 to SSList.Count-1 do RecalcGt2660(SSList.Items[i]);
          end;
       { Печать после 2660 }
       add  := 0;
       ss   := 0;
       add5 := 0;
       ss5  := 0;
       add1 := 0;
       ss1  := 0;
       writeln(Dev,'Свод по соц.страху (после учета сумм > '+FloatToStr(LIMITFORPENS)+') за '+GetMOnthRus(NMES));
       writeln(Dev,Replicate('-',length(h)));
       writeln(Dev,H);
       writeln(Dev,Replicate('-',length(h)));
       if SSList.Count>0 then for i:=0 to SSList.Count-1 do PrintLine(SSList.Items[i]);
       PrintFoot;
       writeln(Dev,Replicate('-',length(h)));

       { Перерасчет итогов }



       Koef:=SS/Add;
       if SSList.Count>0 then for i:=0 to SSList.Count-1 do RecalcSSByKoef(SSList.Items[i]);
{
       SSList^.Search(Addr(ShifrGruM),JIndex);
       SSItem:=PSSItem(SSList^.At(JIndex));
       SSItem^.SummaSS:=SSItem^.SummaSS+AddMax;
}
       if SSList.Count>0 then for i:=0 to SSList.Count-1 do CalcEQUSS(SSList.Items[i]);

       { Печать откорректированного варианта }
       add  := 0;
       ss   := 0;
       add5 := 0;
       ss5  := 0;
       add1 := 0;
       ss1  := 0;
       writeln(Dev);
       writeln(Dev);
       writeln(Dev);
       writeln(Dev,'Свод по соц.страху (скорректированный) за '+Month[NMES]);
       writeln(Dev,Replicate('-',length(h)));
       writeln(Dev,H);
       writeln(Dev,Replicate('-',length(h)));
       if SSList.Count>0 then for i:=0 to SSList.Count-1 do PrintLine(SSList.Items[i]);
       PrintFoot;

       writeln(Dev,Replicate('-',length(h)));
       CloseFile(Dev);
       view(FName);
  end;


BEGIN
    if YesNo('Исключать больничные и др.?') then Mode:=RemoveBoln
                                            else Mode:=TotalCalc;
    WantedShifr:=S_S_Shifr;
    WantedMonth:=NMES;
    KZ:=0;
    NSRV_TEMP:=NSRV;
    NMES_TEMP:=NMES;
    PUTINF;
    SSList := TList.Create;
    ProgressBar.Min := 1;
    ProgressBar.Max := COUNT_SERV;
    ProgressBar.Position := 0;
    FOR I_NSRV:=1 TO COUNT_SERV DO
        BEGIN
             ProgressBar.Position := ProgressBar.Position + 1;
             Application.ProcessMessages;
             NSRV:=I_NSRV;
             MKFLNM;
             IF FILEEXIST(FNINF) THEN
                BEGIN
                     GETINF(TRUE);
                     CALC_S_S_ALL_PERSON;
                     WHILE HEAD_PERSON<>NIL DO DEL_PERSON(HEAD_PERSON);
                END; {IF FILEEXIST}
        END; {Конец цикла по NSRV}
    Nmes:=Nmes_Temp;
    NSRV_TEMP:=NSRV;
    MKFLNM;
    GETINF(TRUE);
    SSList.Sort(@Compare);
    Calc_Swod_S_S;
    if SSList.Count>0 then
       for i:=0 to SSList.Count-1 do Dispose(SSList.Items[i]);
    SSList.Free;
    NSRV:=NSRV_TEMP;
    NMES:=NMES_TEMP;
    MKFLNM;
    GETINF(NEED_NET_FOR_GETINF);
END;

procedure TFormSwodSS.Make_Gt_2660_Za_In(var SummaGt2660:real;Period:word);
 type
      PItemGt2660=^TItemGt2660;
      TItemGt2660=record
                   Tabno    : integer;
                   SummaTot : real;
                   SummaBud : real;
                   SummaGn  : real;
                   SummaVne : real;
                  end;

VAR II,I                      : integer;
    NSRV_TEMP                 : integer;
    NMES_TEMP                 : integer;
    ESCPressed                : boolean;
    WantedShifr               : integer;
    WantedMonth               : integer;
    FName                     : String;
    Dev                       : TextFile;
    ListSumma                 : TList;
    ListGt2660                : TList;
    LineNo                    : integer;
    SummaTot                  : real;
    TabnoLo,TabnoHi           : Integer;
    SummaBud,SummaGn,SummaVne : real;
    I_NSRV                    : integer;
PROCEDURE ADD_PERSON(CURR_PERSON:PERSON_PTR);
 VAR
     ItemGt2660 : PItemGt2660;
     I          : Integer;
     J          : Integer;
     Curr_Add   : Add_Ptr;
     Finded     : boolean;
 BEGIN
     J:=Curr_Person^.Tabno;
     Finded:=false;
     if ListSumma.Count>0 then
        for i:=0 to ListSumma.Count-1 do
            if PItemGt2660(ListSumma.Items[i])^.Tabno=J then
                    begin
                         ItemGt2660:=PItemGt2660(ListSumma.Items[i]);
                         Finded:=true;
                         Break;
                    end;
     if Not Finded then
        begin
             ItemGt2660:=New(PItemGt2660);
{             FillChar(ItemGt2660^,SizeOf(ItemGt2660^),0);}
             ItemGt2660^.Tabno    := J;
             ItemGt2660^.SummaTot := 0;
             ItemGt2660^.SummaBud := 0;
             ItemGt2660^.SummaGn  := 0;
             ItemGt2660^.SummaVne := 0;
             ListSumma.Add(ItemGt2660);
        end;
     Curr_Add:=Curr_Person^.Add;
     while Curr_Add<>Nil do
      begin
           if (Period=0) or (Curr_add^.Period=Period) then
              begin
                   case Curr_person^.Gruppa of
                    1 : ItemGt2660^.SummaBud  := ItemGt2660^.SummaBud+Curr_Add^.Summa;
                  3,5 : ItemGt2660^.SummaGn := ItemGt2660^.SummaGn+Curr_Add^.Summa;
                   else
                        ItemGt2660^.SummaVne:=ItemGt2660^.SummaVne+Curr_Add^.Summa;
                   end;
                   ItemGt2660^.SummaTot:=ItemGt2660^.SummaTot+Curr_Add^.Summa;
                   if ItemGt2660^.SummaTot>40000.00 then
                      J:=J;
              end;
           Curr_Add:=Curr_Add^.Next;
      end;
 END;

PROCEDURE FIll_Person;
 VAR CURR_PERSON:PERSON_PTR;
     J,JIndex:Integer;
 BEGIN
      CURR_PERSON:=HEAD_PERSON;
      WHILE (CURR_PERSON<>NIL) DO
       BEGIN
            ADD_PERSON(CURR_PERSON);
            CURR_PERSON:=CURR_PERSON^.NEXT;
       END;
 END;

procedure AddToGt2660(Item:Pointer);
 var ItemGt2660:PItemGt2660;
 begin
      if PItemGt2660(Item)^.SummaTot>LimitForPens then
         begin
              ItemGt2660 := new(PItemGt2660);
              ItemGt2660^.Tabno    := PItemGt2660(Item)^.Tabno;
              ItemGt2660^.SummaBud := PItemGt2660(Item)^.SummaBud;
              ItemGt2660^.SummaGn  := PItemGt2660(Item)^.SummaGn;
              ItemGt2660^.SummaVne := PItemGt2660(Item)^.SummaVne;
              ItemGt2660^.SummaTot := PItemGt2660(Item)^.SummaTot;
              ListGt2660.Add(ItemGt2660);
         end;
 end;
procedure PrintLine(Item:Pointer);
 var a:real;
     FIO,NAL_CODE:string;
 begin
      if pFIBQueryQ.Open then pFIBQueryQ.Close;
      pFIBQueryQ.SQL.Clear;
      pFIBQueryQ.SQL.Add('select first 1 FIO,NAL_CODE from kadry');
      pFIBQueryQ.SQL.Add(' where tabno='+IntToStr(PItemGt2660(Item)^.Tabno));
      try
         pFIBQueryQ.ExecQuery;
         FIO:=pFIBQueryQ.Fields[0].AsString;
         NAL_CODE:=pFIBQueryQ.Fields[1].AsString;
      except
         FIO:='Не нйден';
         NAL_CODE:='';
      end;

      LineNo:=LineNo+1;
      a:=PItemGt2660(Item)^.SummaTot-LimitForPens;
      writeln(dev,':',LineNo:3,' :',PItemGt2660(Item)^.Tabno:4,':',
                   copy(FIO+space(40),1,40)        ,':',
                   copy(Nal_Code+space(10),1,10)   ,':',
                   PItemGt2660(Item)^.SummaTot:12:2,':',
                   PItemGt2660(Item)^.SummaBud:12:2,':',
                   PItemGt2660(Item)^.SummaGn:12:2 ,':',
                   PItemGt2660(Item)^.SummaVne:12:2,':',
                   A:12:2,':');
      SummaTot      := SummaTot    + PItemGt2660(Item)^.SummaTot;
      SummaBud      := SummaBud    + PItemGt2660(Item)^.SummaBud;
      SummaGn       := SummaGn     + PItemGt2660(Item)^.SummaGn;
      SummaVne      := SummaVne    + PItemGt2660(Item)^.SummaVne;
      SummaGt2660   := SummaGt2660 + A;
 end;

procedure PrintFooter;
 begin
      writeln(dev,':    :    :',
                   copy('И т о г о'+space(40),1,40),':',
                   copy('Ид.код'+space(10),1,10),':',
                   SummaTot:12:2,':',
                   SummaBud:12:2,':',
                   SummaGn:12:2, ':',
                   SummaVne:12:2,':',
                   SummaGt2660:12:2,':');
 end;
procedure PrintHeader;
 var s:string;
 begin
      str(LimitForPens:12:2,S);
      S:=AllTrim(S);
      if ((Period>0) and (Period<13)) then writeln(dev,' за ',month[period]);
      writeln(dev,': N  :Т.н.:',
                   copy('Фамилия И О'+space(40),1,40),':',
                   copy('Ид.код'+space(10),1,10),':',
                   copy('Всего'+space(12),1,12),':',
                   copy('Бюджет'+space(12),1,12),':',
                   copy('Г.Н.'+space(12),1,12),':',
                   copy('Внебюджет'+space(12),1,12),':',
                   copy(' >'+S+' '+space(12),1,12),':');
 end;

function CompareGt(Item1 , Item2 : pointer):integer;
 begin
      if PItemGt2660(Item1)^.SummaTot>PItemGt2660(Item2)^.SummaTot then Result := -1
                                                                else
      if PItemGt2660(Item1)^.SummaTot<PItemGt2660(Item2)^.SummaTot then Result := 1
                                                                else Result := 0; 
 end;
BEGIN
    NSRV_TEMP := NSRV;
    NMES_TEMP := NMES;
    PUTINF;
    ListGt2660 := TList.Create;
    ListSumma  := TList.Create;
    ProgressBar.Min:=1;
    ProgressBar.Max:=COUNT_SERV;
    ProgressBar.Position:=1;
    FOR I_NSRV:=1 TO COUNT_SERV DO
        BEGIN
             ProgressBar.Position := ProgressBar.Position + 1;
             Application.ProcessMessages;
             NSRV:=I_NSRV;
             MKFLNM;
             IF FILEEXIST(FNINF) THEN
                BEGIN
                     GetInf(TRUE);
                     Fill_Person;
                     WHILE HEAD_PERSON<>NIL DO DEL_PERSON(HEAD_PERSON);
                END; {IF FILEEXIST}
        END; {Конец цикла по NSRV}
    for i:=0 to ListSumma.Count-1 do AddToGt2660(ListSumma.Items[i]);
    if ListSumma.Count>0 then
       for i:=0 to ListSumma.Count-1 do Dispose(ListSumma.Items[i]);
    ListSumma.Free;
    Nmes:=Nmes_Temp;
    FLOW_MONTH:=NMES;
{    RecalcSumma;}
    if ListGt2660.Count>0 then
       begin
            ListGt2660.Sort(@CompareGt);
            if not pFIBTransactionQ.Active then
               pFIBTransactionQ.StartTransaction;
            LineNo        :=0;
            SummaTot      :=0;
            SummaBud      :=0;
            SummaGn       :=0;
            SummaVne      :=0;
            SummaGt2660   :=0;
            str(NMes,FName);
            FName:=AllTrim(FName);
            FName:=CDOC+'Gt2660.TXT';
            AssignFile(dev,fname);
            rewrite(Dev);
            writeln(dev,'Список > '+FloatToStr(LimitForPens)+' в '+GetMonthRus(nmes));
            PrintHeader;
            for i:=0 to ListGt2660.Count-1 do PrintLine(ListGt2660.Items[I]);
            PrintFooter;
            CloseFile(Dev);
            pFIBQueryQ.Close;
            if pFIBTransactionQ.Active then
               pFIBTransactionQ.Commit;
            View(FName);
       end;
    if ListGt2660.Count>0 then
       for i:=0 to ListGt2660.Count-1 do Dispose(ListGt2660.Items[i]);
    ListGt2660.Free;
    NSRV:=NSRV_TEMP;
    NMES:=NMES_TEMP;
    MKFLNM;
    GETINF(NEED_NET_FOR_GETINF);
 END;

PROCEDURE TFormSwodSS.MAKE_GT_2660_ZA;
 var SUMMAGT2660:real;
 begin
      SUMMAGT2660:=0;
      MAKE_GT_2660_ZA_IN(SUMMAGT2660,0);
 end;


procedure TFormSwodSS.BitBtn1Click(Sender: TObject);
begin
     CALC_SWOD_S_S;
end;

end.
