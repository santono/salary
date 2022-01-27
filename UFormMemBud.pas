unit UFormMemBud;
                                
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExcelXP, OleServer, Gauges;

type
  TFormMemBud = class(TForm)
    BitBtn1: TBitBtn;
    GaugeMem: TGauge;
    LabelPodr: TLabel;
    LabelFio: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    CheckBoxBol: TCheckBox;
    BitBtn11: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
     procedure MakeOrder;
  public
    { Public declarations }
  end;
type
    PExcelRec=^TExcelRec;
    TExcelRec=record
                ShifrCol : integer;
                ShifrRow : integer;
                Summa    : real;
                Invalid  : boolean;
              end;
    TExcelList=class(TList)
                procedure AddItem(Row,Col:integer;Summa:real;Inv:boolean);
               end;
var
  FormMemBud : TFormMemBud;
  memmode    : (memBudMode,memLeramode,memColBudMode,memColVneMode,memMag802Mode,memMag811Mode,memGNMode,memNISMode,memMatHelpMode,memIskraMode);

implementation
uses ComObj,ScrDef,ScrIo,ScrLists,ScrUtil,IniFiles,uFormMkPensList,
     ScrSwod,uFormWait,USQLUnit,UAddUdList;
  var    SQLSwodClass:TSQLSwodClass;

procedure InsertIntoSQL(Shifr:integer;Summa:real;Tabno:integer;NSRV:integer;ShifrGru:integer;ShifrKat:integer;ShifrRow:integer;ShifrCol:integer);
 var S:String;
 begin
    //   Exit;
       S:='insert into test_addm (SHIFR,SUMMA,TABNO,NSRV,SHIFRGRU,SHIFRKAT,ShifrRow,ShifrCol)';
       S:=S+' values ('+IntToStr(Shifr)+',';
       S:=S+FormatFloatPoint(Summa)+',';
       S:=S+IntToStr(Tabno)+',';
       S:=S+IntToStr(Nsrv)+',';
       S:=S+IntToStr(ShifrGru)+',';
       S:=S+IntToStr(ShifrKat)+',';
       S:=S+IntToStr(ShifrRow)+',';
       S:=S+IntToStr(ShifrCol)+')';
       SQLExecute(S);
 end;

 procedure EmptyInSQL;
 var S:String;
 begin
  //     Exit;
       S:='delete from test_addm';
       SQLExecute(S);
 end;

procedure TExcelList.AddItem(Row,Col:integer;Summa:real;Inv:boolean);
 var Finded:boolean;
     i:integer;
     ExcelRec:PExcelRec;
     S:String;
 begin
       if ((Row=0) or (Col=0)) then
          begin
                ShowMessage('Row='+IntToStr(Row)+' Col='+IntToStr(Col)+' Summa='+FloatToStr(Summa));
          end;
       Finded:=false;
       if Self.Count>0 then
          for i:=1 to Self.Count do
              begin
                    if (PExcelRec(Items[i-1])^.ShifrRow=Row) and
                       (PExcelRec(Items[i-1])^.ShifrCol=Col) and
                       (PExcelRec(Items[i-1])^.Invalid =Inv) then
                       begin
                            PExcelRec(Items[i-1])^.Summa:=PExcelRec(Items[i-1])^.Summa+Summa;
                            Finded:=true;
                            break;
                       end
              end;
       if not Finded then
          begin
                New(ExcelRec);
                ExcelRec^.ShifrRow := Row;
                ExcelRec^.ShifrCol := Col;
                ExcelRec^.Summa    := Summa;
                ExcelRec^.Invalid  := Inv;
                Self.Add(ExcelRec);
          end;


 end;
{$R *.dfm}

procedure TFormMemBud.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormMemBud.BitBtn1Click(Sender: TObject);
begin
     if modeIskra then
        begin
             ShowMessage('В режиме ИСКРЫ сформировать этот ордер нельзя');
             Exit;
        end;

     MemMode:=MemBudMode;
     MakeOrder;
end;

procedure TFormMemBud.MakeOrder;
 const n:array[1..12] of string=('Junuary','February','March','APRIL','MAY',
 'June','July','August','September','October','November','December');
 var
   V           : Variant;
   S,FP,FO     : String;
   FR,I,J,K    : Integer;
   P           : PChar;
   W           : Word;
   ODS         : Char;
   FName       : String;
   NSRVT       : Integer;
   ShifrRow,
   ShifrCol    : Integer;
   Curr_Person : Person_Ptr;
   Curr_Add    : Add_Ptr;
   Curr_Ud     : Ud_Ptr;
   ExcelList   : TExcelList;
   Ini         : TIniFile;
   NeedBoln    : boolean;
   NameSwod,
   NameSQL      : string;
   l:integer;
   finished     : boolean;
   shifrDol     : integer;
   fIniFileName : string;

//   SummaPodrInv : Real;
//   devDebug     : TextFile;
//   FNameDebug  : string;

 procedure HideZeroColumnExcel;
  var   StartCol,EndCol : integer;
        HideRow         : integer;
        HideModeRow     : integer;
        I,J,M           : Integer;
  begin
        if MemMode=MemBudMode then
           begin
                if isSVDN then
                   begin
                        HideRow     :=  16;
                        StartCol    :=  16;
                        EndCol      := 121; {117}
                        HideModeRow :=   5;
                   end
                else
                   begin
                        HideRow     :=  16;
                        StartCol    :=  18;
                        EndCol      := 116;
                        HideModeRow :=   5;
                   end;
           end
        else
        if MemMode=MemLeraMode then
           begin
                if isSVDN then
                   begin
                        HideRow     := 31; {30;} {29;} {32;} {29;}
                        HideModeRow :=  5;
                        StartCol    := 20;
                        EndCol      := 127; {123}{118}{74;}
                   end
                else
                   begin
                        HideRow     := 33; {29;} {32;} {29;}
                        HideModeRow :=  5;
                        StartCol    := 20;
                        EndCol      := 120;{74;}
                   end

           end
        else
        if MemMode=memColBudMode then
           if isSVDN then
              begin
                HideRow     := 27;
                StartCol    := 16;
                EndCol      := 116;
                HideModeRow := 5;
              end
           else
              begin
                HideRow     := 27;
                StartCol    := 17;
                EndCol      := 116;
                HideModeRow := 5;
              end
        else
        if MemMode=memColVneMode then
           if isSVDN then
              begin
                HideRow     := 28;
                StartCol    := 17;
                EndCol      := 116;
                HideModeRow := 5;
              end
           else
              begin
                HideRow     := 32;
                StartCol    := 21;
                EndCol      := 119;
                HideModeRow := 5;
              end

        else
        if MemMode=memMag802Mode then
           begin
                HideRow     := 13;
                HideModeRow :=  5;
                StartCol    := 17;
                EndCol      := 114;
           end
        else
        if MemMode=memMag811Mode then
           begin
                HideRow     := 13;
                HideModeRow :=  5;
                StartCol    := 17;
                EndCol      := 114;
           end
        else
        if MemMode=memGNMode then
           begin
                HideRow  := 15;
                StartCol := 9;
                EndCol   := 106;
                HideModeRow := 5;
           end
        else
        if MemMode=memNISMode then
           begin
                if isSVDN then
                   begin
                        HideRow  := 15;
                        StartCol := 19;
                        EndCol   := 116;
                        HideModeRow := 5;
                   end
                else
                   begin
                        HideRow  := 32;
                        StartCol := 21;
                        EndCol   := 120;
                        HideModeRow := 5;
                   end
           end
        else
        { Материальная помощь }
        if MemMode=memMatHelpMode then
           begin
                HideRow     := 13;
                HideModeRow :=  5;
                StartCol    := 11;
                EndCol      := 108;
           end
        else
        { НИПКИ Искра }
        if MemMode=memIskraMode then
           begin
                HideRow     := 13;
                HideModeRow :=  5;
                StartCol    := 11;
                EndCol      := 116;
           end;

        for i:=StartCol to EndCOl do
            begin
                 if (i=33) then
                    begin
                        j:=V.WorkBooks[1].WorkSheets[N[NMES]].Cells[HideRow,i];
                    end;
                 j:=V.WorkBooks[1].WorkSheets[N[NMES]].Cells[HideRow,i];
                 m:=V.WorkBooks[1].WorkSheets[N[NMES]].Cells[HideModeRow,i];
                 if (j=0) or (m=1) then
                    V.WorkBooks[1].WorkSheets[N[NMES]].Columns[i].Hidden:=true;
            end;
  end;

 procedure HideZeroRowsExcel(ColStart:Integer;ColFinish:integer;RowStart:Integer;RowFinish:integer);
  var   StartCol,EndCol : integer;
        HideRow         : integer;
        HideModeRow     : integer;
        I,J,M           : Integer;
        needHide        : Boolean;
  function mustHideRow(row:Integer;StartCol:Integer;finishCol:integer):Boolean;
   var i,j,m:Integer;
       retVal:Boolean;
       a:real;
   begin
       retVal:=true;
       for i:=startCol to finishCol do
           begin
                a:=V.WorkBooks[1].WorkSheets[N[NMES]].Cells[row,i];
                if Abs(a)>0.005 then
                   begin
                        retVal:=False;
                        Break;
                   end;
           end;
       mustHideRow:=retVal;
   end;
  begin
        for i:=rowStart to rowFinish do
            begin
                 needHide:= mustHideRow(I,ColStart,ColFinish);
                 if needHide then
                    V.WorkBooks[1].WorkSheets[N[NMES]].Rows[i].Hidden:=true;
            end;
  end;

 procedure FillExcelCell(ShifrRow:integer;ShifrCol:integer;Summa:real;Invalid:boolean);
  var   StartCol,EndCol:integer;
        StartRow,EndRow:integer;
        StartRowInv,EndRowInv:integer;
        HeaderRow:integer;
        HeaderCol:integer;
        RowEx,ColEx:Integer;
        i,j:integer;
        A:real;
        HideModeRow:integer;
  begin
        if MemMode=MemBudMode then
           begin
                 if isSVDN then
                    begin
                         StartCol     :=  4;
                         EndCol       :=121; {117}
                         HeaderRow    :=  4;
                         HideModeRow  :=  5;
                         StartRow     := 11;
                         EndRow       := 16;
                         StartRowInv  := 18;
                         EndRowInv    := 23;
                         HeaderCol    :=  1;
                    end
                else
                    begin
                         StartCol     :=  4;
                         EndCol       :=116;
                         HeaderRow    :=  4;
                         HideModeRow  :=  5;
                         StartRow     := 11;
                         EndRow       := 16;
                         StartRowInv  := 18;
                         EndRowInv    := 23;
                         HeaderCol    :=  1;
                    end;
           end
        else
        if MemMode=MemLeraMode then
           begin
                if isSVDN then
                   begin
                        StartCol    :=  4;
                        EndCol      := 127 ; {123} {118} {74}
                        HeaderRow   :=  4;
                        HideModeRow :=  5;
                        StartRow    := 11;
                        EndRow      := 31; {30;} {29;} {32;} {29;}
                        StartRowInv := 34; {33;} {35;} {32;}
                        EndRowInv   := 54; {51;}{48;}
                        HeaderCol   :=  1;
                   end
                else
                   begin
                        StartCol    :=  4;
                        EndCol      := 120; {74}
                        HeaderRow   :=  4;
                        HideModeRow :=  5;
                        StartRow    := 11;
                        EndRow      := 32; {29;} {32;} {29;}
                        StartRowInv := 36; {35;} {32;}
                        EndRowInv   := 56; {48;}
                        HeaderCol   :=  1;
                   end

           end
        else
        if MemMode=memColBudMode then
           if isSVDN then
              begin
                   StartCol  :=  4;
                   EndCol    := 116;
                   HeaderRow :=  4;
                   StartRow  := 11;
                   EndRow    := 26;
                   StartRowInv  := 30;
                   EndRowInv := 45;
                   HeaderCol :=  3;
              end
           else
              begin
                   StartCol  :=  4;
                   EndCol    := 116;
                   HeaderRow :=  4;
                   StartRow  := 11;
                   EndRow    := 26;
                   StartRowInv  := 30;
                   EndRowInv := 45;
                   HeaderCol :=  3;
              end

        else
        if MemMode=memColVneMode then
           if isSVDN then
              begin
                StartCol  :=  4;
                EndCol    := 113;
                HeaderRow :=  4;
                StartRow  := 11;
                EndRow    := 26;
                StartRowInv  := 30;
                EndRowInv := 45;
                HeaderCol :=  3;
              end
           else
              begin
                StartCol  :=  4;
                EndCol    := 116;
                HeaderRow :=  4;
                StartRow  := 11;
                EndRow    := 27;
                StartRowInv  := 31;
                EndRowInv := 46;
                HeaderCol :=  3;
              end

        else
        if MemMode=memMag802Mode then
           begin
                StartCol  :=  4;
                EndCol    := 114;
                HideModeRow :=  5;
                HeaderRow :=  4;
                StartRow  := 11;
                EndRow    := 11;
                StartRowInv  := 16;
                EndRowInv := 16;
                HeaderCol :=  1;
           end
        else
        if MemMode=memMag811Mode then
           begin
                StartCol  :=  4;
                EndCol    := 114;
                HeaderRow :=  4;
                HideModeRow :=  5;
                StartRow  := 11;
                EndRow    := 11;
                StartRowInv  := 16;
                EndRowInv := 16;
                HeaderCol :=  1;
           end
        else
        if MemMode=memGNMode then
           begin
                StartCol  :=  4;
                EndCol    := 106;
                HeaderRow :=  4;
                StartRow  := 11;
                EndRow    := 14;
                StartRowInv  := 19;
                EndRowInv := 22;
                HeaderCol :=  1;
           end
        else
        if MemMode=memNISMode then
           begin
                if isSVDN then
                   begin
                        StartCol  :=  4;
                        EndCol    := 116;
                        HeaderRow :=  4;
                        StartRow  := 11;
                        HideModeRow :=  5;
                        EndRow    := 12;
                        StartRowInv  := 19;
                        EndRowInv := 20;
                        HeaderCol :=  1;
                   end
                else
                   begin
                        StartCol  :=  4;
                        EndCol    := 120;
                        HeaderRow :=  4;
                        StartRow  := 11;
                        EndRow    := 32;
                        HideModeRow :=  5;
                        StartRowInv  := 35;
                        EndRowInv := 55;
                        HeaderCol :=  1;
                   end

           end
        else
        if MemMode=memMatHelpMode then
           begin
                StartCol    :=  4;
                EndCol      := 108;
                HideModeRow :=  5;
                HeaderRow   :=  4;
                StartRow    := 11;
                EndRow      := 12;
                StartRowInv  := 16;
                EndRowInv   := 16;
                HeaderCol   :=  1;
           end
        else
        if MemMode=memIskraMode then
           begin
                StartCol    :=  4;
                EndCol      := 116;
                HideModeRow :=  5;
                HeaderRow   :=  4;
                StartRow    := 11;
                EndRow      := 11;
                StartRowInv  := 16;
                EndRowInv   := 16;
                HeaderCol   :=  1;
           end;

        RowEx     :=  0;
        ColEx     :=  0;
        for i:=StartCol to EndCol do
            begin
                 j:=V.WorkBooks[1].WorkSheets[N[NMES]].Cells[HeaderRow,i];
                 if j=ShifrCol then
                    begin
                         ColEx:=i;
                         break;
                    end;
            end;
        if Not Invalid then
           for i:=StartRow to EndRow do
               begin
                    j:=V.WorkBooks[1].WorkSheets[N[NMES]].Cells[i,HeaderCol];
                    if j=ShifrRow then
                       begin
                            RowEx:=i;
                            break;
                       end;
                end
        else
           for i:=StartRowInv to EndRowInv do
               begin
                    j:=V.WorkBooks[1].WorkSheets[N[NMES]].Cells[i,HeaderCol];
                    if j=ShifrRow then
                       begin
                            RowEx:=i;
                            break;
                       end;
                end;
        if (RowEx>0) and (ColEx>0) then
           begin
                 A:=V.WorkBooks[1].WorkSheets[N[NMES]].Cells[RowEx,ColEx];
                 A:=A+Summa;
                 V.WorkBooks[1].WorkSheets[N[NMES]].Cells[RowEx,ColEx]:=A;
           end
        else
           ShowMessage('RowEx='+IntToStr(RowEx)+' ColEx='+IntToStr(ColEx)+' ShifrRow='+IntToStr(ShifrRow)+' ShifrCol='+IntToStr(ShifrCol)+' Summa='+FloatToStr(Summa));
  end;

 procedure FillExcelFromList;
  var i:integer;
  begin
       if ExcelList.Count=0 then Exit;
       GaugeMem.MinValue:=1;
       GaugeMem.MaxValue:=ExcelList.Count;
       GaugeMem.Progress:=1;
       LabelPodr.Caption:='Перенос в Excel';
       LabelFio.Caption:='';
       for i:=1 to ExcelList.Count do
           begin
                 GaugeMem.Progress:=i;
                 Application.ProcessMessages;
                 FillExcelCell(PExcelRec(ExcelList.Items[i-1])^.ShifrRow,
                               PExcelRec(ExcelList.Items[i-1])^.ShifrCol,
                               PExcelRec(ExcelList.Items[i-1])^.Summa,
                               PExcelRec(ExcelList.Items[i-1])^.Invalid);
           end;
  end;

 procedure DefineRowColAddMemBud;
  begin
        case  Curr_Person^.Kategorija of
             1:ShifrRow:=1101;   { ППС  }
             2:ShifrRow:=1105;   { УВП }
           4,6:ShifrRow:=1104;   { АДМ ХОЗ }
           5,7:ShifrRow:=1103;   { АУП }
          else
               ShifrRow:=1101;
        end;
        if Curr_add^.Shifr=Pochas_Shifr then ShifrRow:=1102; {Почасовка }
        if (Nsrv=98) { or (Nsrv=128)}   then ShifrRow:=1102; {Почасовка }
        if (Curr_Add^.Shifr=BOL_5_SHIFR) then
            ShifrCol:=12
        else if IsBolnShifr(Curr_Add^.Shifr) THEN
                ShifrCol:=14
        else if (Curr_Add^.Shifr=KASSA_SHIFR) then
                ShifrCol:=44
        else if (Curr_Add^.Shifr=9) then  { Помощь на оздоровление }
                ShifrCol:=1109
        else if (Curr_Add^.Shifr=23) then  { Выходное пособие      }
                ShifrCol:=1123
        else
            case  Curr_Person^.Kategorija of
                1:ShifrCol:=1101;   { ППС  }
                2:ShifrCol:=1105;   { УВП }
              4,6:ShifrCol:=1104;   { АДМ ХОЗ }
              5,7:ShifrCol:=1103;   { АУП }
            else
                ShifrCol:=1101;
            end;

  end;
 procedure DefineRowColAddMemBudLnr;
  begin
        case  Curr_Person^.Kategorija of
             1:ShifrRow:=1101;   { ППС  }
             2:ShifrRow:=1105;   { УВП }
           4,6:ShifrRow:=1104;   { АДМ ХОЗ }
           5,7:ShifrRow:=1103;   { АУП }
          else
               ShifrRow:=1101;
        end;
        if Curr_add^.Shifr=Pochas_Shifr then ShifrRow:=1102; {Почасовка }
        if (Nsrv=98) { or (Nsrv=128)}   then ShifrRow:=1102; {Почасовка }
        if ((Curr_Add.Shifr=DogPodShifr) or (DOG_POD_PODRAZD(nsrv))) then
           ShifrCol:=11062
        else if (Curr_Add^.Shifr=BOL_5_SHIFR) then
            ShifrCol:=12
        else if IsBolnShifr(Curr_Add^.Shifr) THEN
              if Curr_Add^.shifr=dekret_shifr then
                 ShifrCol:=32
              else
                ShifrCol:=14
        else if (Curr_Add^.Shifr=KASSA_SHIFR) then
                ShifrCol:=44
        else if (Curr_Add^.Shifr=9) then  { Помощь на оздоровление }
                ShifrCol:=1109
        else if (Curr_Add^.Shifr=23) then  { Выходное пособие      }
                ShifrCol:=1123
        else
            case  Curr_Person^.Kategorija of
                1:ShifrCol:=1101;   { ППС  }
                2:ShifrCol:=1105;   { УВП }
              4,6:ShifrCol:=1104;   { АДМ ХОЗ }
              5,7:ShifrCol:=1103;   { АУП }
            else
                ShifrCol:=1101;
            end;
  end;

 procedure DefineRowColAddMemLera;
  begin
        ShifrRow:=Curr_Person^.Gruppa;
        if isSVDN then
           if NSRV=106 then ShifrRow:=43;
        if (Curr_Add^.Shifr=BOL_5_SHIFR) then
            ShifrCol:=12
        else if IsBolnShifr(Curr_Add^.Shifr)  THEN
                ShifrCol:=14
        else if (Curr_Add^.Shifr=KASSA_SHIFR) then
                ShifrCol:=44
        else if (nsrv=81) then
                ShifrCol:=11062    {Договора подряда}
        else if (nsrv=140) then
                ShifrCol:=11063    {Договора подряда 140}
        else if (Curr_Add^.Shifr=9) then  { Помощь на оздоровление }
                ShifrCol:=1109
(*
        else if (Curr_Add^.Shifr=23) then  { Выходное пособие      }
                ShifrCol:=1123
*)
        else
            case  Curr_Person^.Kategorija of
                1:ShifrCol:=1101;   { ППС  }
                2:ShifrCol:=1105;   { УВП }
                3: begin
                        ShifrCol:=11061;   { НАУЧНІЕ СОТРУДНИКИ }

                   end;
              4,6:ShifrCol:=1104;   { АДМ ХОЗ }
              5,7:ShifrCol:=1103;   { АУП }
            else
                ShifrCol:=1107;
            end;
        if (Curr_add^.Shifr=Pochas_Shifr) and
           (Curr_Person^.Kategorija=1)    then ShifrCol:=1102; {Почасовка }
        if (Nsrv=98)  or (Nsrv=128)     and
           (Curr_Person^.Kategorija=1)    then ShifrCol:=1102; {Почасовка }
  end;

 procedure DefineRowColAddColMemBud;     { Коледж - бюджет}
  begin
        ShifrRow:=NSRV;
        if (Curr_Add^.Shifr=BOL_5_SHIFR) then
            ShifrCol:=BOL_5_SHIFR
        else if IsBolnShifr(Curr_Add^.Shifr)  THEN
              IF ((curr_add^.shifr=dekret_shifr) and isLNR) then
                 ShifrCol:=32
              else
                ShifrCol:=14
        else if (Curr_Add^.Shifr=KASSA_SHIFR) then
                ShifrCol:=KASSA_SHIFR
        else if (Curr_Add^.Shifr=9) then  { Помощь на оздоровление }
                ShifrCol:=1109
(*
        else if (Curr_Add^.Shifr=23) then  { Выходное пособие      }
                ShifrCol:=1123
*)
        else
            case  Curr_Person^.Kategorija of
                1:ShifrCol:=1101;   { ППС  }
                2:ShifrCol:=1105;   { УВП }
              4,6:ShifrCol:=1104;   { АДМ ХОЗ }
              5,7:ShifrCol:=1103;   { АУП }
            else
                ShifrCol:=1101;
            end;
  end;
 procedure DefineRowColAddColMemVne;     { Коледж - внебюджет}
  begin
       DefineRowColAddColMemBud;
  end;

 procedure DefineRowColAddMag802;
  begin
        ShifrRow:=Curr_Person^.Gruppa;
        if (Curr_Add^.Shifr=BOL_5_SHIFR) then
            ShifrCol:=12
        else if IsBolnShifr(Curr_Add^.Shifr) THEN
                ShifrCol:=14
        else if (Curr_Add^.Shifr=KASSA_SHIFR) then
                ShifrCol:=44
        else if (nsrv=81) then
                ShifrCol:=11062
(*        else if (Curr_Add^.Shifr=9) then  { Помощь на оздоровление }
                ShifrCol:=1109

        else if (Curr_Add^.Shifr=23) then  { Выходное пособие      }
                ShifrCol:=1123
*)
        else
            case  Curr_Person^.Kategorija of
                1:ShifrCol :=  1101;   { ППС  }
                2:ShifrCol :=  1105;   { УВП }
                3:ShifrCol := 11061;   { НАУЧНІЕ СОТРУДНИКИ }
              4,6:ShifrCol :=  1104;   { АДМ ХОЗ }
              5,7:ShifrCol :=  1103;   { АУП }
            else
                ShifrCol := 1107;
            end;
        if Curr_add^.Shifr=Pochas_Shifr then ShifrCol:=1102; {Почасовка }
        if (Nsrv=98) { or (Nsrv=128)}   then ShifrCol:=1102; {Почасовка }
  end;

 procedure DefineRowColAddMag811;
  begin
       DefineRowColAddMag802;
  end;

 procedure DefineRowColAddGN;
  begin
        if NSRV=81 then ShifrRow:=81 { Договора подряда }
                   else
        if (Curr_Person^.Gruppa=5) or  { А У П }
           (Curr_Person^.Gruppa=7) then ShifrRow:=333
                                   else
        if (Curr_Person^.Gruppa=3) then
           if STORONNEE_PODRAZD(Curr_Person^.Mesto_Osn_Raboty) then ShifrRow:=82
                                                               else ShifrRow:=444
                                   else ShifrRow:=444;
        if (Curr_Add^.Shifr=BOL_5_SHIFR) then
            ShifrCol:=12
        else if IsBolnShifr(Curr_Add^.Shifr) THEN
                ShifrCol:=14
        else if (Curr_Add^.Shifr=KASSA_SHIFR) then
                ShifrCol:=44
        else if (nsrv=81) then
                ShifrCol:=11062
(*        else if (Curr_Add^.Shifr=9) then  { Помощь на оздоровление }
                ShifrCol:=1109

        else if (Curr_Add^.Shifr=23) then  { Выходное пособие      }
                ShifrCol:=1123
*)
        else
            case  Curr_Person^.Kategorija of
                1:ShifrCol:=1101;   { ППС  }
                2:ShifrCol:=1105;   { УВП }
                3:ShifrCol:=11061;   { НАУЧНІЕ СОТРУДНИКИ }
              4,6:ShifrCol:=1104;   { АДМ ХОЗ }
              5,7:ShifrCol:=1103;   { АУП }
            else
                ShifrCol:=1107;
            end;
        if Curr_add^.Shifr=Pochas_Shifr then ShifrCol:=1102; {Почасовка }
        if (Nsrv=98) { or (Nsrv=128)}   then ShifrCol:=1102; {Почасовка }
        if ShifrRow=81 then ShifrCol:=11062;
  end;

 procedure DefineRowColAddGNDerev;
  begin
        ShifrRow:=0;
        if NSRV=81 then ShifrRow:=81 { Договора подряда }
                   else
        if (Curr_Person^.KATEGORIJA =5) or  { А У П }
           (Curr_Person^.KATEGORIJA=7) then ShifrRow:=333
                                       else
        if STORONNEE_PODRAZD(Curr_Person^.Mesto_Osn_Raboty) then ShifrRow:=222  {Сумісники}
                                   else ShifrRow:=444;
        if ShifrRow=0 then ShifrRow:=444;
        ShifrCol:=0;
        if (Curr_Add^.Shifr=BOL_5_SHIFR) then
            ShifrCol:=1107
        else if IsBolnShifr(Curr_Add^.Shifr) THEN
                ShifrCol:=14
        else
            ShifrCol:=1101;
        if ShifrCol=0 then ShifrCol:=1101;
  end;

 procedure DefineRowColAddNIS;
  begin
        if (Curr_Person^.Gruppa=2) then ShifrRow:=444
                                   else ShifrRow:=333;
        if (Curr_Add^.Shifr=BOL_5_SHIFR) then
            ShifrCol:=12
        else if IsBolnShifr(Curr_Add^.Shifr) THEN
                ShifrCol:=14
        else if (Curr_Add^.Shifr=KASSA_SHIFR) then
                ShifrCol:=44
        else if (nsrv=81) then
                ShifrCol:=11062
(*        else if (Curr_Add^.Shifr=9) then  { Помощь на оздоровление }
                ShifrCol:=1109

        else if (Curr_Add^.Shifr=23) then  { Выходное пособие      }
                ShifrCol:=1123
*)
        else
            case  Curr_Person^.Kategorija of
                1:ShifrCol:=1101;   { ППС  }
                2:ShifrCol:=1105;   { УВП }
                3:ShifrCol:=11061;   { НАУЧНІЕ СОТРУДНИКИ }
              4,6:ShifrCol:=1104;   { АДМ ХОЗ }
              5,7:ShifrCol:=1103;   { АУП }
            else
                ShifrCol:=1107;
            end;
        if Curr_add^.Shifr=Pochas_Shifr then ShifrCol:=1102; {Почасовка }
        if (Nsrv=98) { or (Nsrv=128)}   then ShifrCol:=1102; {Почасовка }
  end;

 procedure DefineRowColAddMatHelp;
  begin
        ShifrRow:=105;                                      {Облагаемая помощь}
        if Curr_Add^.Shifr=Oklad_shifr then ShifrRow:=106;  {Необлагаемая МП}

        if NSRV=105 then ShifrCol:=1343
        else
            case  Curr_Person^.Kategorija of
                1:ShifrCol:=1101;   { ППС  }
                2:ShifrCol:=1105;   { УВП }
    {            3:ShifrCol:=11061; }  { НАУЧНІЕ СОТРУДНИКИ }
              4,6:ShifrCol:=1104;   { АДМ ХОЗ }
              5,7:ShifrCol:=1103;   { АУП }
            else
                ShifrCol:=1101;
            end;
  end;

 procedure DefineRowColAddIskra;
  begin
            shifrrow:=nsrv;
            case  Curr_Person^.Kategorija of
            //    1:ShifrCol:=1101;   { ППС  }
                2:ShifrCol:=1105;   { УВП }
                3:ShifrCol:=11061;   { НАУЧНІЕ СОТРУДНИКИ }
              4,6:ShifrCol:=1104;   { АДМ ХОЗ }
              5,7:ShifrCol:=1103;   { АУП }
            else
                ShifrCol:=1107;
            end;
  end;


 begin
{      FNAME:='D:\ZARPLATA\VUGU\MEM\MEMBUD.XLS';}
//      FNameDebug := CDOC+'MemInv.txt';
//      Rewrite(devDebug,FNameDebug);
      NeedBoln    := CheckBoxBol.Checked;;
      EmptyInSQL;
      FNAME:='';
      fIniFileName:=getIniFileName;
      Ini := TIniFile.Create( fIniFileName  );
      nameSwod:='Мемориальный ордер';
      try
         if MemMode=MemBudMode then
            begin
                FName := Ini.ReadString( 'Parameters', 'MEMBUDNAME', '' );
                nameSQL:='Бюджет университет';
            end
         else if MemMode=MemLeraMode then
            begin
                FName := Ini.ReadString( 'Parameters', 'MEMLERANAME', '' );
                nameSQL:='Внебюджет университет';
            end
         else if MemMode=memColBudMode then
            begin
                FName   := Ini.ReadString( 'Parameters', 'MEMCOLBUDNAME', '' );
                nameSQL := 'Бюджет колледж';
            end
         else if MemMode=memColVneMode then
            begin
                FName   := Ini.ReadString( 'Parameters', 'MEMCOLVNENAME', '' );
                nameSQL := 'Внебюджет колледж';
            end
         else if MemMode=memMag802Mode then
            begin
                FName   := Ini.ReadString( 'Parameters', 'MEMMAG802NAME', '' );
                nameSQL := 'Магистратура бюджет';
            end
         else if MemMode=memMag811Mode then
            begin
                FName   := Ini.ReadString( 'Parameters', 'MEMMAG811NAME', '' );
                nameSQL := 'Магистратура внебюджет';
            end
         else if MemMode=memGNMode then
            begin
                FName   := Ini.ReadString( 'Parameters', 'MEMGNNAME', '' );
                nameSQL := 'Г Н';
            end
         else if MemMode=memNISMode then
            begin
                if isSVDN then
                   FName := Ini.ReadString( 'Parameters', 'MEMNISNAME', '' )
                else
                   FName := Ini.ReadString( 'Parameters', 'MEMLERANAME', '' );

                nameSQL := 'Н И С';
            end
         else if MemMode=memMatHelpMode then
            begin
                FName   := Ini.ReadString( 'Parameters', 'MEMMPNAME', '' );
                nameSQL := 'Материальная помощь';
            end
         else if MemMode=memIskraMode then
            begin
                FName := Ini.ReadString( 'Parameters', 'MEMISKRANAME', '' );
                nameSQL := 'Искра';
            end
      finally
         Ini.Free;
      end;
      if not FileExists(FName) then
         begin
               ShowMessage('В Ini файле неверно указано имя мемориального ордера бюджет университета');
               Kz:=-1;
               Exit;
         end;
         NSRVT:=NSRV;
         MAKEPENSLIST(2);
//         showMessage(intToStr(TestListClass.getListCount));
         PutInf;
         EMPTY_ALL_PERSON;;
         GaugeMem.MinValue:=1;
         GaugeMem.MaxValue:=NameServList.Count;
         GaugeMem.Progress:=1;
         ExcelList:=TExcelList.Create;
         SQLSwodClass:=TSQLSwodClass.Init(Work_Year_Val,NMES);
         for i:=1 to NameServList.Count do
             begin
                   GaugeMem.Progress:=i;
                   Application.ProcessMessages;
                   NSRV:=I;
                   if (i=105) or (i=106) then
                      nsrv:=nsrv;
                   MKFLNM;
                   if ((NameServList.IS_MO_BUD(NSRV))     and (MemMode=MemBudMode))     or
                      ((NameServList.IS_MO_VNE(NSRV))     and (MemMode=MemLeraMode))    or
                      ((NameServList.IS_MO_KOL_BUD(NSRV)) and (MemMode=memColBudMode))  or
                      ((NameServList.IS_MO_KOL_VNE(NSRV)) and (MemMode=memColVneMode))  or
                      ((NameServList.IS_MO_MAG_BUD(NSRV)) and (MemMode=memMag802Mode))  or
                      ((NameServList.IS_MO_MAG_VNE(NSRV)) and (MemMode=memMag811Mode))  or
                      ((NameServList.IS_MO_GN(NSRV))      and (MemMode=memGNMode))      or
                      ((NameServList.IS_MO_NIS(NSRV))     and (MemMode=memNISMode))     or
                      ((NameServList.IS_MO_MP(NSRV))      and (MemMode=memMatHelpMode)) or
                      ((NameServList.IS_MO_ISKRA(NSRV))   and (MemMode=memIskraMode)) then
                   if FileExists(FNINF) THEN
                      begin
                            GetInf(True);
                            LabelPodr.Caption:=NAME_SERV(NSRV);
                            Curr_Person  := Head_Person;
//                            SummaPodrInv := 0;
                            while (Curr_Person<>Nil) do
                                  begin
                                        ShifrRow:=0;
                                        LabelFio.Caption:=Curr_Person^.FIO;
                                        Application.ProcessMessages;
                                        shifrDol:=Get_Dol_Code(Curr_Person);
                                        if ((shifrDol=1500) and (not NeedBoln)) then { Больничные - не включать с 03 04 2011 }
//                                        if ((Get_Dol_Code(Curr_Person)=1500) and (not NeedBoln)) then
                                        if isLNR then
                                           begin
                                                Curr_Person:=curr_Person^.NEXT;
                                                Continue;
                                           end;
                                        if (isGKH and (curr_person^.Gruppa<>1)) then
                                           shifrRow:=0;

                                       if NSRV=106 then
                                          if gruppyList.IS_MO_VNE(Curr_Person^.Gruppa) then
                                                       NSRV:=106;


                                        if ((MemMode=MemBudMode)     and (GruppyList.IS_MO_BUD(Curr_Person^.Gruppa)))     or
                                           ((MemMode=MemLeraMode)    and (GruppyList.IS_MO_VNE(Curr_Person^.Gruppa)))     or
                                           ((MemMode=memColBudMode)  and (GruppyList.IS_MO_KOL_BUD(Curr_Person^.Gruppa))) or
                                           ((MemMode=memColVneMode)  and (GruppyList.IS_MO_KOL_VNE(Curr_Person^.Gruppa))) or
                                           ((MemMode=memMag802Mode)  and (GruppyList.IS_MO_MAG_BUD(Curr_Person^.Gruppa))) or
                                           ((MemMode=memMag811Mode)  and (GruppyList.IS_MO_MAG_VNE(Curr_Person^.Gruppa))) or
                                           ((MemMode=memGNMode)      and (GruppyList.IS_MO_GN(Curr_Person^.Gruppa)))      or
                                           ((MemMode=memNISMode)     and (GruppyList.IS_MO_NIS(Curr_Person^.Gruppa)))     or
                                           ((MemMode=memMatHelpMode) and (GruppyList.IS_MO_MP(Curr_Person^.Gruppa)))      or
                                           ((MemMode=memIskraMode)   and (GruppyList.IS_MO_ISKRA(Curr_Person^.Gruppa)))   then
                                           begin
                                                Curr_Add:=Curr_Person^.Add;
                                                while (Curr_Add<>Nil) do
                                                  begin
                                                       if NSRV=106 then
                                                          NSRV:=106;
                                                       if MemMode=MemBudMode then
                                                          if GruppyList.IS_MO_BUD(Curr_Person^.Gruppa) then
                                                             if isSVDN then
                                                                DefineRowColAddMemBud
                                                             else
                                                                DefineRowColAddMemBudLnr;
                                                       if MemMode=MemLeraMode then
                                                          if GruppyList.IS_MO_VNE(Curr_Person^.Gruppa) then
                                                             DefineRowColAddMemLera;
                                                       if MemMode=memColBudMode then
                                                          if GruppyList.IS_MO_KOL_BUD(Curr_Person^.Gruppa) then
                                                             DefineRowColAddColMemBud;
                                                       if MemMode=memColVneMode then
                                                          if GruppyList.IS_MO_KOL_VNE(Curr_Person^.Gruppa) then
                                                             DefineRowColAddColMemVne;
                                                       if MemMode=memMag802Mode then
                                                          if GruppyList.IS_MO_MAG_BUD(Curr_Person^.Gruppa) then
                                                             DefineRowColAddMag802;
                                                       if MemMode=memMag811Mode then
                                                          if GruppyList.IS_MO_MAG_VNE(Curr_Person^.Gruppa) then
                                                             DefineRowColAddMag811;
                                                       if MemMode=memGNMode then
                                                          if GruppyList.IS_MO_GN(Curr_Person^.Gruppa) then
{                                                             DefineRowColAddGN;     }
                                                             DefineRowColAddGNDerev;
                                                       if MemMode=memNISMode then
                                                          if GruppyList.IS_MO_NIS(Curr_Person^.Gruppa) then
                                                             DefineRowColAddNIS;
                                                       if MemMode=memMatHelpMode then
                                                          if GruppyList.IS_MO_MP(Curr_Person^.Gruppa) then
                                                             DefineRowColAddMatHelp;
                                                       if MemMode=memIskraMode then
                                                          if GruppyList.IS_MO_Iskra(Curr_Person^.Gruppa) then
                                                             DefineRowColAddIskra;
                                                       if (ShifrRow>0) and (ShifrCol>0) then
                                                           begin
                                                              SQLSwodClass.AddItemAdd(Curr_Person,CURR_ADD,NSRV);

                                                              if needTestMem then
                                                                 TestListClass.findAddRec(curr_add,curr_person);



                                                              InsertIntoSQL(Curr_Add^.Shifr,
                                                                            Curr_Add^.Summa,
                                                                            Curr_Person^.Tabno,
                                                                            NSRV,
                                                                            Curr_Person^.Gruppa,
                                                                            Curr_Person^.Kategorija,
                                                                            ShifrRow,ShifrCol);
                                                              if ShifrRow=0 then
                                                                 ShifrRow:=0;
//                                                              if ShifrRow=7 then
//                                                                 begin
//                                                                      ShowMessage('shifrRow=7 '+IntToStr(curr_person^.tabno)+' nsrv='+IntToStr(nsrv));
//                                                                 end;
                                                              ExcelList.AddItem(ShifrRow,ShifrCol,Curr_Add^.Summa,false);
                                                          //    if Is_Invalid(Curr_Person) then
                                                              if PensionerList.IsPensioner(Curr_Person^.Tabno) then
                                                                 begin
                                                                  ExcelList.AddItem(ShifrRow,ShifrCol,Curr_Add^.Summa,true);
                                    //                              SummaPodrInv:=SummaPodrInv+Curr_Add^.Summa;
                                                                 end;
                                                              // Добавить АУП ППС
                                                              if isLNR then
                                                                 if Curr_Person.KATEGORIJA in [1,2,5,7] then
                                                                 if isPersonAUP_PPS(curr_person) then
                                                                 if (memmode=memBudMode)
                                                                    or
                                                                    (memmode=memLeraMode)
                                                                    or
                                                                    (memmode=memNISMode)
                                                                 then
                                                                    begin
                                                                     //    if ShifrCol=1103 then
                                                                     //       begin
                                                                                 ShifrCol:=11032;
                                                                                 ExcelList.AddItem(ShifrRow,ShifrCol,Curr_Add^.Summa,false);
                                                                     //       end;
                                                                    end;
                                                           end;
                                                       Curr_Add:=Curr_Add^.Next;
                                                   end;



                                                Curr_Ud:=Curr_Person^.Ud;
                                                while (Curr_Ud<>Nil) do
                                                 begin
                                                      if MemMode=MemBudMode then ShifrRow:=1106;
                                                      // с больничный в свод по бюджету не включать
                                                      // ничего с 26 09 2017
                                                      if isLNR then
                                                      if MemMode=MemBudMode then
                                                      if shifrDol=1500 then
                                                         begin
                                                              curr_ud:=curr_ud^.NEXT;
                                                              continue;
                                                         end;
                                                      if ShifrRow=0 then
                                                         case MemMode of
                                                           MemBudMode:ShifrRow:=1106;
                                                            (*
                                                            case  Curr_Person^.Kategorija of
                                                               1:ShifrRow:=1101;   { ППС  }
                                                               2:ShifrRow:=1105;   { УВП }
                                                             4,6:ShifrRow:=1104;   { АДМ ХОЗ }
                                                             5,7:ShifrRow:=1103;   { АУП }
                                                            else
                                                              ShifrRow:=1101;
                                                            end;
                                                             *)
                                                           memLeraMode:
                                                              ShifrRow:=Curr_Person^.Gruppa;
                                                           memColBudMode:
                                                              ShifrRow:=Nsrv;
                                                           memColVneMode:
                                                              ShifrRow:=Nsrv;
                                                           memMag802Mode:
                                                              ShifrRow:=Curr_Person^.Gruppa;
                                                           memMag811Mode:
                                                              ShifrRow:=Curr_Person^.Gruppa;
                                                           memGNMode:
                                                              ShifrRow:=444;
                                                           memNISMode:
                                                              ShifrRow:=444;
                                                           else
                                                              ShifrRow:=Nsrv;
                                                         end;
                                                         ShifrCol:=Curr_Ud^.Shifr;
                                                         IF IS_ALIMENTY_SHIFR(Curr_Ud^.Shifr) THEN
                                                         if (MemMode<>MemBudMode)    and
                                                            (MemMode<>MemLeraMode)   and
                                                            (MemMode<>memMag802Mode) and
                                                            (MemMode<>memMag811Mode) then
                                                            ShifrCol:=55;
                                                         if ((ShifrRow>0) and (ShifrCol>0)) then
                                                            begin
                                                                 SQLSwodClass.AddItemUd(CURR_Ud,NSRV,CURR_PERSON);

                                                                 if needTestMem then
                                                                    TestListClass.findUdRec(curr_ud,curr_person);

                                                                 ExcelList.AddItem(ShifrRow,ShifrCol,Curr_Ud^.Summa,false);
                                                                 if Is_Invalid(Curr_Person) then
                                                                    ExcelList.AddItem(ShifrRow,ShifrCol,Curr_Ud^.Summa,true);
                                                            end;
                                                         Curr_Ud:=Curr_Ud^.Next;
                                                 end;
                                           end; {фильтр соответствия группы работника и вида мемориального ордера }
                                        Curr_Person:=Curr_Person^.Next;
                                  end;
// Для ЛНР в мемориальный ордер по бюджету включить в начислении больничные соц.страх а подоходный и прочие удержания - не включать
                                  if (isLNR and ((memmode=memBudMode)
                                              or (memmode=memColBudMode)
                                              ) and not NeedBoln) then
                                     begin
                                          curr_person:=HEAD_PERSON;
                                          while (Curr_Person<>nil) do
                                           begin
//                                                if GruppyList.IS_MO_BUD(Curr_Person^.Gruppa) then
                                                if GET_DOL_CODE(curr_person)=1500 then
                                                   begin
                                                        Curr_Add:=Curr_Person^.Add;
                                                        while (Curr_Add<>Nil) do
                                                          begin
                                                               if memmode=membudmode then
                                                                  DefineRowColAddMemBudLnr
                                                               else
                                                               if memmode=memcolbudmode then
                                                                  DefineRowColAddColMemBud;

                                                               if (ShifrRow>0) and (ShifrCol>0) then
                                                                  begin
                                                                        InsertIntoSQL(Curr_Add^.Shifr,
                                                                                      Curr_Add^.Summa,
                                                                                      Curr_Person^.Tabno,
                                                                                      NSRV,
                                                                                      Curr_Person^.Gruppa,
                                                                                      Curr_Person^.Kategorija,
                                                                                      ShifrRow,ShifrCol);
                                                                        if ShifrRow=0 then
                                                                           ShifrRow:=0;
                                                                        ExcelList.AddItem(ShifrRow,ShifrCol,Curr_Add^.Summa,false);
                                                          //    if Is_Invalid(Curr_Person) then
                                                                        if PensionerList.IsPensioner(Curr_Person^.Tabno) then
                                                                           begin
                                                                                ExcelList.AddItem(ShifrRow,ShifrCol,Curr_Add^.Summa,true);
                                    //                                          SummaPodrInv:=SummaPodrInv+Curr_Add^.Summa;
                                                                           end
                                                                  end;
                                                               Curr_Add:=Curr_Add^.NEXT;

                                                          end;
                                                   end;
                                                Curr_Person:=Curr_Person^.NEXT;
                                           end;
                                     end;
// Конец бюджета ЛНР


                            EMPTY_ALL_PERSON;
//                            if abs(SummaPodrInv)>0.01 then
//                            Writeln(devDebug,nsrv:3,' ',SummaPodrInv:12:2);
                      end;
             end;

 //        V.ScreenUpdating := true;
//         CloseFile(devDebug);
      DisposePensList;
      NSRV:=NSRVT;
      MKFLNM;
      GETINF(TRUE);
      if needTestMem then
        if assigned(TestListClass) then
           TestListClass.Done;
      try
         if ExcelList.Count=0 then
            begin
                 ShowMessage('Не было начислений и удержаний по данному виду мемориального ордера');
            end
         else
            begin
              try
               V:=CreateOleObject('Excel.Application');
              except
                on e:Exception do
                   begin
                        ShowMessage('Ошибка запуска Excel '+E.Message);
                        ExcelList.Free;
                        Exit;
                   end;
              end;
        //     showMessage('Ole создан');

              V.Visible:=false;
              V.DisplayAlerts:=False;
              V.WorkBooks.Open(FName);
        //     showMessage('Книга открыта');
              I:=V.WorkBooks[1].WorkSheets.Count;
        //     showMessage('Количство листов в книге '+intToStr(i));
             l:=length(V.WorkBooks[1].WorkSheets[1].Name);
       //      showMessage('Длина названия '+intToStr(l));
       //      showMessage('Тест названия '+V.WorkBooks[1].WorkSheets[1].Name);
//         V.ScreenUpdating := true;
             if i>1 then
             for i:=1 to V.WorkBooks[1].WorkSheets.Count do
                 begin
         //             showMessage('i='+IntToStr(i)+' '+V.WorkBooks[1].WorkSheets[i].Name);
                if V.WorkBooks[1].WorkSheets[i].Name=N[NMES] then
                   BEGIN
                        V.WorkBooks[1].WorkSheets[i].Delete;
                        BREAK;
                   END;
                 end;
      //      showMessage('Удаление листа пройдено');
             while true do
                 begin
                      finished:=true;
                      for i:=1 to V.WorkBooks[1].WorkSheets.Count do
                         if Pos('Shablon',Trim(V.WorkBooks[1].WorkSheets[i].Name))>0 then
                         if (Length(Trim(V.WorkBooks[1].WorkSheets[i].Name))>length('Shablon')) then
                            BEGIN
                                  V.WorkBooks[1].WorkSheets[i].Delete;
                                  finished:=false;
                                  break;
                            END;
                      if finished then break;
                 end;

        //    showMessage('Удаление шаблонов пройдено');
//         V.Visible:=true;
              V.WorkBooks[1].WorkSheets['Shablon'].Copy(After:=V.WorkBooks[1].WorkSheets['Shablon']);
              try
                 V.WorkBooks[1].WorkSheets['Shablon (2)'].Name:=N[NMES];
              except
                 on e:exception do
                    begin
                        ShowMessage('Ошибка переименования листа '+N[NMES]+'. Описание '+E.Message);
                        ExcelList.Free;

                        Exit;
                    end;
              end;
{             V.ScreenUpdating := false;}
      //      showMessage('Переименование закончено');
              FillExcelFromList;
      //      showMessage('Заполнение  закончено');
//         SQLSwodClass.PutToSQL(NameSwod,NameSQL,Select_key,Select_Bay_Mode,SelectedBay,NeedDogPod,TotalMode,ModeIllSS,SwodSowmMode,ChernobMode);
              SQLSwodClass.PutToSQL(NameSwod,NameSQL,0,0,0,true,true,0,0,0);
              SQLSwodClass.Done;
      //   SQLSwodClass.Free;
              FormWait.Show;
              Application.ProcessMessages;
              HideZeroColumnExcel;
              if isLNR then
                 if memMode in [memLeraMode,memNISMode] then
                    HideZeroRowsExcel(4,120,11,32);
              FormWait.Hide;
              V.Visible:=true;
            end;
         Application.ProcessMessages;
         ExcelList.Free;

//         NSRV:=NSRVT;
//         MKFLNM;
//         GETINF(TRUE);
         try
{            D.First;
            for I:=1 to D.RecordCount do
                begin

                     V.Cells[I+FR,1]:=D.FieldByName('Fam').AsString;
                     V.Cells[I+FR,2]:=D.FieldByName('Name').AsString;
                     V.Cells[I+FR,3]:=D.FieldByName('MidName').AsString;
                     V.Cells[I+FR,4]:=D.FieldByName('DB').AsString;
                     V.Cells[I+FR,5]:=D.FieldByName('PaspS').AsString;
                     V.Cells[I+FR,6]:=D.FieldByName('PaspN').AsString;
                     V.Cells[I+FR,7]:=D.FieldByName('ID').AsString;
                     if D.FieldByName('F1').AsInteger=0
                        then V.Cells[I+FR,8]:=' '
                        else V.Cells[I+FR,8]:='Контракт';
                     D.Next;
               end;
}
         finally
         end
      except
          on E:Exception do begin
             ShowMessage(E.Message);
             if nsrv<>nsrvt then
                begin
                     nsrv:=nsrvt;
                     mkflnm;
                     getinf(true);
                end;
          end;
      end;
 end;
procedure TFormMemBud.BitBtn2Click(Sender: TObject);
begin
     if modeIskra then
        begin
             ShowMessage('В режиме ИСКРЫ сформировать этот ордер нельзя');
             Exit;
        end;
     MemMode:=MemLeraMode;
     MakeOrder;
end;

procedure TFormMemBud.BitBtn3Click(Sender: TObject);
begin
     if modeIskra then
        begin
             ShowMessage('В режиме ИСКРЫ сформировать этот ордер нельзя');
             Exit;
        end;
     MemMode:=memColBudMode;
     MakeOrder;
end;

procedure TFormMemBud.BitBtn4Click(Sender: TObject);
begin
     if modeIskra then
        begin
             ShowMessage('В режиме ИСКРЫ сформировать этот ордер нельзя');
             Exit;
        end;
     MemMode:=memColVneMode;
     MakeOrder;
end;

procedure TFormMemBud.BitBtn5Click(Sender: TObject);
begin
     if modeIskra then
        begin
             ShowMessage('В режиме ИСКРЫ сформировать этот ордер нельзя');
             Exit;
        end;
     MemMode:=memMag802Mode;
     MakeOrder;
end;

procedure TFormMemBud.BitBtn6Click(Sender: TObject);
begin
     if modeIskra then
        begin
             ShowMessage('В режиме ИСКРЫ сформировать этот ордер нельзя');
             Exit;
        end;
     MemMode:=memMag811Mode;
     MakeOrder;
end;

procedure TFormMemBud.BitBtn7Click(Sender: TObject);
begin
     if modeIskra then
        begin
             ShowMessage('В режиме ИСКРЫ сформировать этот ордер нельзя');
             Exit;
        end;
     MemMode:=memGNMode;
     MakeOrder;
end;

procedure TFormMemBud.BitBtn8Click(Sender: TObject);
begin
     if modeIskra then
        begin
             ShowMessage('В режиме ИСКРЫ сформировать этот ордер нельзя');
             Exit;
        end;
     MemMode:=memNISMode;
     MakeOrder;
end;

procedure TFormMemBud.BitBtn10Click(Sender: TObject);
begin
     if modeIskra then
        begin
             ShowMessage('В режиме ИСКРЫ сформировать этот ордер нельзя');
             Exit;
        end;
     MemMode:=memMatHelpMode;
     MakeOrder;

end;

procedure TFormMemBud.FormCreate(Sender: TObject);
begin
     CheckBoxBol.Checked:=FALSE;
     if not modeIskra then
        begin
             BitBtn1.Enabled  := true;
             BitBtn2.Enabled  := true;
             BitBtn3.Enabled  := true;
             BitBtn4.Enabled  := true;
             BitBtn5.Enabled  := true;
             BitBtn6.Enabled  := true;
             BitBtn7.Enabled  := true;
             BitBtn8.Enabled  := true;
             BitBtn10.Enabled := true;
             BitBtn11.Enabled := false;
             if isLNR and isGKH then
                begin
                     BitBtn3.Enabled  := false;
                     BitBtn3.Hide;
                     BitBtn4.Enabled  := false;
                     BitBtn4.Visible  := false;
                     BitBtn5.Enabled  := false;
                     BitBtn5.Visible  := false;
                     BitBtn6.Enabled  := false;
                     BitBtn6.Visible  := false;
                     BitBtn7.Enabled  := false;
                     BitBtn7.Visible  := false;
                     BitBtn8.Enabled  := false;
                     BitBtn8.Visible  := false;
                     BitBtn10.Enabled := false;
                     BitBtn10.Visible := false;
                     BitBtn11.Enabled := false;
                     BitBtn11.Visible := false;
                     BitBtn1.Caption  := 'Бюджет';
                     BitBtn2.Caption  := 'Спецфонд';
                end;

        end
     else
        begin
             BitBtn11.Enabled:=True;
             BitBtn1.Enabled  := false;
             BitBtn2.Enabled  := false;
             BitBtn3.Enabled  := false;
             BitBtn4.Enabled  := false;
             BitBtn5.Enabled  := false;
             BitBtn6.Enabled  := false;
             BitBtn7.Enabled  := false;
             BitBtn8.Enabled  := false;
             BitBtn10.Enabled := false;
        end;

end;

procedure TFormMemBud.BitBtn11Click(Sender: TObject);
begin
     if not modeIskra then
        begin
             ShowMessage('Только для ИСКРЫ');
             Exit;
        end;
     MemMode:=memIskraMode;
     MakeOrder;

end;

procedure TFormMemBud.FormShow(Sender: TObject);
begin
     if not modeIskra then
        begin
             BitBtn1.Show;
             BitBtn2.Show;
             BitBtn3.Show;
             BitBtn4.Show;
             BitBtn5.Show;
             BitBtn6.Show;
             BitBtn7.Show;
             BitBtn8.Show;
             BitBtn10.Show;
             BitBtn11.Hide;
             if isLNR and isGKH then
                begin
                     BitBtn3.Hide;
                     BitBtn4.Hide;
                     BitBtn5.Hide;
                     BitBtn6.Hide;
                     BitBtn7.Hide;
                     BitBtn8.Hide;
                     BitBtn10.Hide;
                     BitBtn11.Hide;
                     BitBtn1.Caption  := 'Бюджет';
                     BitBtn2.Caption  := 'Спецфонд';
                end;


        end
     else
        begin
             BitBtn11.Show;
             BitBtn1.Hide;
             BitBtn2.Hide;
             BitBtn3.Hide;
             BitBtn4.Hide;
             BitBtn5.Hide;
             BitBtn6.Hide;
             BitBtn7.Hide;
             BitBtn8.Hide;
             BitBtn10.Hide;
        end;

end;

end.
