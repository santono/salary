unit FormSwodAlimU;

interface                 

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, FIBQuery, pFIBQuery;

type
  TFormSwodAlim = class(TForm)
    DateTimePickerZa: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
         WantedData  :TDateTime;
         WantedYear  : integer;
         WantedMonth : integer;
         TempNMES    : integer;
         TempYear    : integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSwodAlim: TFormSwodAlim;

implementation
 uses ScrDef,ScrUtil,ScrIO,UFormSelPKG,ScrLists,UFibModule,ComOBJ;
 type PAlimRec=^TAlimRec;
      TAlimRec=record
               NomerAlim : integer;
               FIOIstca  : string[100];
               Adres     : string[100];
               Tabno     : integer;
               FIOWorker : string[100];
               Mode      : integer;
               Summa     : real;
               SummaSbor : real;
              end;

{$R *.dfm}

procedure TFormSwodAlim.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if (CurrYear<>TempYear) or (NMES<>TempNMES) then
         begin
              CurrYear := TempYear;
              NMES     := TempNmes;
              MKFLNM;
              while (Head_Person<>NIL) do Del_Person(Head_Person);
              GETINF(TRUE);
         end
      else
         begin
              CurrYear := TempYear;
              NMES     := TempNmes;
         end;
      Action   := caFree;
end;

procedure TFormSwodAlim.FormCreate(Sender: TObject);
var Y,M:word;
begin
     WantedYear  := CurrYear;
     WantedMonth := NMES;
     TempNmes    := NMES;
     TempYear    := CurrYear;
     Y           := TempYear;
     M           := TempNMES;
     WantedData  := EncodeDate(Y,M,10);

end;

procedure TFormSwodAlim.BitBtn1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormSwodAlim.BitBtn2Click(Sender: TObject);
 type PSwodRec=^TSwodRec;
      TSwodRec=record
                 Mode:integer;
                 Row :integer;
               end;
 var i_nsrv , TempNSRV : integer;
     ListAlim    : TList;
     AlimRec     : PAlimRec;
     V           : Variant;
     CurrRow,i,j : integer;
     FName       : string;
     SwodRec     : PSwodRec;
     ListSwod    : TList;
     Mode        : integer;
     Finded      : boolean;
     ExRow,ExCol : integer;
     SheetName   : string;
 procedure Make_Alim_For_All;
  var Curr_Person : Person_Ptr;
      Curr_Ud     : Ud_Ptr;
  procedure Add_Summa_Alim(Curr_Ud:Ud_Ptr;Kod:integer);
   var Finded:boolean;
       Nomer_Alim,i:integer;
       Curr_Cn:Cn_Ptr;
   begin
         Finded:=false;
         if Curr_Person^.Tabno=3222 then
            Finded:=false;
         if Curr_Ud^.WHO=0 then
            begin
                 Curr_Cn:=Curr_Person^.CN;
                 while (Curr_cn<>Nil) do
                   begin
                        if (is_Alimenty_Shifr(Curr_Cn^.Shifr)) then
                            begin
                                 Curr_Ud^.WHO:=Curr_Cn^.PRIM;
                                 break;
                            end;
                        Curr_Cn:=Curr_Cn^.Next;
                   end;
            end;
         Nomer_Alim:=GET_ALIMENTY_PRIM(Curr_Ud^.WHO);
         if ListAlim.Count>0 then
            for i:=1 to ListAlim.Count do
                begin
                      if PAlimRec(ListAlim.Items[i-1])^.NomerAlim=Nomer_Alim then
                         begin
                              if Kod=1 then
                                 PAlimRec(ListAlim.Items[i-1])^.Summa:=PAlimRec(ListAlim.Items[i-1])^.Summa+Curr_Ud^.SUMMA
                              else
                                 PAlimRec(ListAlim.Items[i-1])^.SummaSbor:=PAlimRec(ListAlim.Items[i-1])^.SummaSbor+Curr_Ud^.SUMMA;
                              finded:=true;
                              break;
                         end;
                end;
         if not Finded then
            begin
                  New(AlimRec);
                  AlimRec^.NomerAlim := Nomer_Alim;
                  AlimRec^.FIOIstca  := '';
                  AlimRec^.Adres     := '';
                  AlimRec^.Tabno     := Curr_Person^.TABNO;
                  AlimRec^.FIOWorker := '';
                  if Kod=1 then
                     begin
                          AlimRec^.Summa     := Curr_Ud^.SUMMA;
                          AlimRec^.SummaSbor := 0;
                     end
                  else
                     begin
                          AlimRec^.Summa     := 0;
                          AlimRec^.SummaSbor := Curr_Ud^.SUMMA;
                     end;
                  ListAlim.Add(AlimRec);
            end;
   end;
  begin
       Curr_Person:=Head_Person;
       while (Curr_Person<>Nil) do
        begin
             Curr_Ud:=Curr_Person^.UD;
             while (Curr_Ud<>Nil) do
               begin
                    if IS_ALIMENTY_SHIFR(Curr_Ud^.Shifr) then
                       Add_Summa_Alim(Curr_Ud,1)
                    else if (Curr_Ud^.Shifr=P_SBOR_VNE_LUGANSKA_SHIFR) or
                            (Curr_Ud^.Shifr=P_SBOR_V_LUGANSK_SHIFR) then
                            Add_Summa_Alim(Curr_Ud,2);
                    Curr_Ud:=Curr_Ud^.NEXT;
               end;
             Curr_Person:=Curr_Person^.NEXT;
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
     TempYear:=CurrYear;
     TempNMES:=NMES;
     TempNSRV:=NSRV;
     while (Head_Person<>nil) do del_person(Head_Person);
     listAlim:=TList.Create;
     ProgressBar1.Min:=0;
     ProgressBar1.Max:=NameServList.Count;
     ProgressBar1.Position:=0;
     for i_nsrv:=1 TO NameServList.Count DO
        BEGIN
             nsrv:=I_NSRV;
             ProgressBar1.Position:=I_NSRV;
             Application.ProcessMessages;
             IF NameServList.IsSelected(NSRV) THEN
                BEGIN
                     MKFLNM;
                     IF FILEEXIST(FNINF) THEN
                        BEGIN
                             GETINF(TRUE);
                             MAKE_ALIM_FOR_ALL;
                             WHILE HEAD_PERSON<>NIL DO DEL_PERSON(HEAD_PERSON);
                        END;
                END
        END; {Конец цикла по NSRV}
     FName:=TemplateDIR+'RepAlim.xls';
     if ListAlim.Count>0 then
        if not FileExists(FName) then
           ShowMessage('Отсутствует файл '+FName)
        else
            begin
                  ListSwod:=TList.Create;
                  try
                     V:=CreateOleObject('Excel.Application');
                  except
                     ShowMessage('Ошибка запуска Excel');
                  end;
                  V.Visible:=True;
                  V.WorkBooks.Open(FName);
                  for i:=1 to ListAlim.Count do
                      begin
                            if not FIB.pFIBQuery.Transaction.Active then
                               FIB.pFIBQuery.Transaction.StartTransaction;
                            FIB.pFIBQuery.SQL.Clear;
                            FIB.pFIBQuery.SQL.Add('SELECT FIRST 1 FIO_WOMEN,ADRES,TABNO,FIO_WORKER,MODE FROM ALIMENTY WHERE SHIFR='+IntToStr(PAlimRec(ListAlim.Items[i-1])^.NomerAlim));
                            try
                                FIB.pFIBQuery.ExecQuery;
                                Mode:=FIB.pFIBQuery.Fields[4].AsInteger;
                            except
                                 ShowMessage('Ошибка запроса данных алиментщика');
                            end;
                            FIB.pFIBQuery.Close;
                            if FIB.pFIBQuery.Transaction.Active then
                                FIB.pFIBQuery.Transaction.Commit;
                            finded:=false;
                            if ListSwod.Count>0 then
                               for j:=1 to ListSwod.Count do
                                   if PSwodRec(ListSwod.Items[j-1])^.Mode=Mode then
                                      begin
                                           Inc(PSwodRec(ListSwod.Items[j-1])^.Row);
                                           ExRow:=PSwodRec(ListSwod.Items[j-1])^.Row;
                                           Finded:=true;
                                           break;
                                      end;
                            if not Finded then
                               begin
                                    New(SwodRec);
                                    SwodRec^.Mode := Mode;
                                    SwodRec^.Row  := 6;
                                    ListSwod.Add(SwodRec);
                                    ExRow:=6;
                               end;
                            case Mode of
                             1 : SheetName:='Lugansk';
                             2 : SheetName:='VneLuganska';
                             3 : SheetName:='Kassa';
                             4 : SheetName:='Privat';
                             5 : SheetName:='Pravex';
                             else  SheetName:='Other';
                            end;
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,5]:=PAlimRec(ListAlim.Items[i-1])^.Summa;
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,6]:=PAlimRec(ListAlim.Items[i-1])^.SummaSbor;
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,1]:=PAlimRec(ListAlim.Items[i-1])^.Tabno;
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,2]:=FIB.pFIBQuery.Fields[3].AsString;
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,3]:=FIB.pFIBQuery.Fields[0].AsString;
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,4]:=FIB.pFIBQuery.Fields[1].AsString;
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,7].Formula:='=E'+IntToStr(ExRow)+'+F'+IntToStr(ExRow);
                      end;
                  if ListSwod.Count>0 then
                     for i:=1 to ListSwod.Count do
                         begin
                              Mode  := PSwodRec(ListSwod.Items[i-1])^.Mode ;
                              ExRow := PSwodRec(ListSwod.Items[i-1])^.Row  ;
                              case Mode of
                                 1 : SheetName:='Lugansk';
                                 2 : SheetName:='VneLuganska';
                                 3 : SheetName:='Kassa';
                                 4 : SheetName:='Privat';
                                 5 : SheetName:='Pravex';
                                else  SheetName:='Other';
                              end;
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[3,1].Value:='Список сотрудников для перечисления алиментов за '+Trim(GetMonthRus(NMES))+' '+IntToStr(CurrYear)+' г.';
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow+1,3].Value:='И Т О Г О';
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow+1,5].Formula:='=SUM(E6:E'+IntToStr(ExRow)+')';
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow+1,6].Formula:='=SUM(F6:F'+IntToStr(ExRow)+')';
                            V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow+1,7].Formula:='=E'+IntToStr(ExRow+1)+'+F'+IntToStr(ExRow+1);
                         end;
                  ListSwod.Free;
           end
     else
        ShowMessage('Нет перечисления алиментов');
     ListAlim.Free;
     NMES := TempNMES;
     NSRV := TempNSRV;
     MKFLNM;
     GETINF(TRUE);

end;

end.
