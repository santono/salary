{$WARNINGS OFF}
{$HINTS OFF}
unit UFormPochasSwod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, ComCtrls, Buttons, frxClass, frxDBSet,
  ExtCtrls, FIBDataSet, pFIBDataSet, DBCtrls, FIBDatabase, pFIBDatabase,
  cxGraphics, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  FIBQuery, pFIBQuery;

type
  TFormPochasSwod = class(TForm)
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    LabelFio: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    cdsPochas: TClientDataSet;
    cdsPochasTabno: TIntegerField;
    cdsPochasFIO: TStringField;
    cdsPochasDolg: TStringField;
    cdsPochasY: TIntegerField;
    cdsPochasM: TIntegerField;
    cdsPochasClock: TFloatField;
    cdsPochasClockTot: TFloatField;
    cdsPochasSumma: TFloatField;
    cdsPochasPodr: TIntegerField;
    cdsPochasPodrName: TStringField;
    PageControl1: TPageControl;
    TabSheetSwod: TTabSheet;
    TabSheetPar: TTabSheet;
    RadioGroupUch: TRadioGroup;
    pFIBDataSetUch: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetUchNOMEROP: TFIBSmallIntField;
    pFIBDataSetUchOP: TFIBStringField;
    pFIBDataSetUchSHIFRWRK: TFIBIntegerField;
    DataSourceUch: TDataSource;
    ComboBoxUch: TComboBox;
    pFIBQueryUch: TpFIBQuery;
    pFIBTransactionReadQ: TpFIBTransaction;
    RadioGroupSort: TRadioGroup;
    BitBtn3: TBitBtn;
    cdsPochasShifrGru: TIntegerField;
    cdsPochasGruppaName: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure DBComboBoxUchChange(Sender: TObject);
    procedure RadioGroupUchClick(Sender: TObject);
    procedure ComboBoxUchChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
      modeSwodUch  : Boolean;
      WantedUch    : Integer;
      WantedUchFIO : string;
      List         : TList;
      SortPochasMode : (ByPodr,ByTabno,ByFio);
      procedure SetAllPodrSelected;
      procedure SetWantedUchPodrSelected;
      procedure EraseListPochas;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPochasSwod: TFormPochasSwod;

implementation
  uses ScrDef,ScrIo,ScrUtil,UFibModule,ScrLists,UGetCurrSummmaTot,
  UFormSelPKG;
  type PPochasItem=^TPochasItem;
       TPochasItem=record
                    Tabno    : Integer;
                    Fio      : string;
                    Dolg     : string;
                    Y        : Integer;
                    M        : Integer;
                    Clock    : Real;
                    ClockTot : Real;
                    Summa    : Real;
                    Podr     : Integer;
                    ShifrGru : Integer;
                    GruppaName : String;
                   end;
       PTabnoItem=^TTabnoItem;
       TTabnoItem=record
                    Tabno    : Integer;
                    Count    : Real;
                   end;
   var ListPochas:TList;
       ListTabno:TList;


{$R *.dfm}

procedure TFormPochasSwod.FormClose(Sender: TObject;
  var Action: TCloseAction);
  var I:Integer;
begin
     Action:=caFree;
     if pFIBDataSetUch.Active then
        pFIBDataSetUch.Close;
     if pFIBDataSetUch.Transaction.Active then
        pFIBDataSetUch.Transaction.Commit;
     if List.Count>0 then
        for i:=0 to List.Count-1 do
            Dispose(PInteger(List.Items[i]));
     List.Free;
     EraseListPochas;
end;

procedure TFormPochasSwod.EraseListPochas;
 var i:Integer;
 begin
      if Assigned(ListPochas) then
         begin
              if ListPochas.Count>0 then
                 for i:=0 to ListPochas.Count-1 do
                     Dispose(PPochasItem(ListPochas.Items[i]));
              ListPochas.Free;
              ListPochas:=nil;
         end;
 end;

function CompareTabno(Item1,Item2:Pointer):Integer;
 begin
      if PPochasItem(Item1).Tabno>PPochasItem(Item2).Tabno then Result:=1
      else if PPochasItem(Item1).Tabno<PPochasItem(Item2).Tabno then Result:=-1
      else Result:=0;
 end;
function CompareFio(Item1,Item2:Pointer):Integer;
 begin
      if PPochasItem(Item1).Fio>PPochasItem(Item2).Fio then Result:=1
      else if PPochasItem(Item1).Fio<PPochasItem(Item2).Fio then Result:=-1
      else Result:=0;
 end;

procedure TFormPochasSwod.BitBtn1Click(Sender: TObject);
var nmestmp,nsrvtmp,i_nsrv,i:Integer;
    Curr_Person:PERSON_PTR;
    Curr_Add:ADD_PTR;
    PochasItem:PPochasItem;
    TabnoItem : PTabnoItem;
    CountTot  : Real;
    Finded    : Boolean;
  function GetClockTot(C_Person:Person_Ptr):Real;
   var RetVal   : Real;
       Curr_Add : ADD_PTR;
   begin
        RetVal:=0;
        Curr_Add:=C_Person^.ADD;
        while (Curr_Add<>Nil) do
          begin
               if Curr_Add^.SHIFR=Pochas_Shifr then
                  RetVal:=RetVal + Curr_Add^.Work_Clock;
               Curr_Add:=Curr_Add^.NEXT;
          end;
        GetClockTot:=RetVal;
   end;
begin
     nmestmp:=nmes;
     nsrvtmp:=nsrv;
     PutInf;
     while (Head_Person<>Nil) do DEL_PERSON(Head_Person);
     if not modeSwodUch then
        SetAllPodrSelected
     else
        SetWantedUchPodrSelected;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Ќе выбраны счета');
             Exit;
        end;

     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     cdsPochas.EmptyDataSet;
     if Assigned(ListPochas) then
        EraseListPochas;
     ListPochas:=TList.Create;
     ListTabno:=TList.Create;
     for i_nsrv:=1 to Count_Serv do
         begin
              nsrv:=i_nsrv;
              MKFLNM;
              ProgressBar1.Position:=i_nsrv;
              LabelPodr.Caption:=Name_Serv(NSRV);
              Application.ProcessMessages;
              if not fileexist(fninf) then Continue;
              if not NameServList.IsSelected(NSRV) then Continue;
              GETINF(false);
              Curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
                begin
                     LabelFio.Caption:=trim(Curr_Person^.FIO)+' '+trim(Curr_Person^.DOLG);
                     Application.ProcessMessages;
                     Curr_Add:=Curr_Person^.ADD;
                     if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                     while (Curr_Add<>Nil) do
                       begin
                            if Curr_Add^.SHIFR=pochas_shifr then
                               begin
                                    Finded:=false;
                                    if ListTabno.Count>0 then
                                       for i:=0 to ListTabno.Count-1 do
                                           if PTabnoItem(ListTabno.Items[i]).Tabno=Curr_Person^.Tabno then
                                              begin
                                                   Finded:=True;
                                                   CountTot:=PTabnoItem(ListTabno.Items[i]).Count;
                                                   Break;
                                              end;
                                    if not Finded then
                                       begin
                                            CountTot:=GetPochasClockTot(Curr_Person^.Tabno)+GetPochasClockFromDB(Curr_Person^.Tabno);
                                            New(TabnoItem);
                                            TabnoItem.Tabno:=Curr_Person^.TABNO;
                                            TabnoItem.Count:=CountTot;
                                            ListTabno.Add(TabnoItem);
                                       end;
                                    cdsPochas.Append;
                                    cdsPochasTabno.Value      := Curr_Person^.TABNO;
                                    cdsPochasFIO.Value        := Trim(Curr_Person^.Fio);
                                    cdsPochasDolg.Value       := Trim(Curr_Person^.Dolg);
                                    cdsPochasY.Value          := Curr_Add^.YEAR+1990;
                                    cdsPochasM.Value          := Curr_Add^.Period;
                                    cdsPochasClock.Value      := Curr_Add^.Work_Clock;
                                    cdsPochasClockTot.Value   := CountTot;
                                    cdsPochasSumma.Value      := Curr_Add^.Summa;
                                    cdsPochasPodr.Value       := NSRV;
                                    cdsPochasShifrGru.Value   := Curr_Person^.GRUPPA;
                                    cdsPochasGruppaName.Value := GET_IST_NAME(Curr_Person^.GRUPPA);
                                    cdsPochas.Post;
                                    New(PochasItem);
                                    PochasItem.Tabno    := Curr_Person^.TABNO;
                                    PochasItem.Fio      := Trim(Curr_Person^.Fio);
                                    PochasItem.Dolg     := Trim(Curr_Person^.Dolg);
                                    PochasItem.Y        := Curr_Add^.YEAR+1990;
                                    PochasItem.M        := Curr_Add^.Period;
                                    PochasItem.Clock    := Curr_Add^.Work_Clock;
                                    PochasItem.ClockTot := CountTot;
                                    PochasItem.Summa    := Curr_Add^.Summa;
                                    PochasItem.Podr     := NSRV;
                                    PochasItem.ShifrGru := Curr_Person^.Gruppa;
                                    PochasItem.GruppaName := GET_IST_NAME(Curr_Person^.GRUPPA);
                                    ListPochas.Add(PochasItem);
                               end;
                            Curr_Add:=Curr_Add^.NEXT;
                       end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              while (Head_Person<>Nil) do DEL_PERSON(Head_Person);
         end;
     case RadioGroupSort.ItemIndex of
      1 :  begin
               SortPochasMode:=ByTabno;
               ListPochas.Sort(@CompareTabno);
           end;
      2 :  begin
               SortPochasMode:=ByFio;
               ListPochas.Sort(@CompareFio);
           end;
     end;
     if ((SortPochasMode = ByFio) or (SortPochasMode = ByTabno)) then
        begin
             cdsPochas.EmptyDataSet;
             for i:=0 to ListPochas.Count-1 do
                 begin
                      cdsPochas.Append;
                      cdsPochasTabno.Value        := PPochasItem(ListPochas.Items[i]).Tabno;
                      cdsPochasFIO.Value          := PPochasItem(ListPochas.Items[i]).Fio;
                      cdsPochasDolg.Value         := PPochasItem(ListPochas.Items[i]).Dolg;
                      cdsPochasY.Value            := PPochasItem(ListPochas.Items[i]).Y;
                      cdsPochasM.Value            := PPochasItem(ListPochas.Items[i]).M;
                      cdsPochasClock.Value        := PPochasItem(ListPochas.Items[i]).Clock;
                      cdsPochasClockTot.Value     := PPochasItem(ListPochas.Items[i]).ClockTot;
                      cdsPochasSumma.Value        := PPochasItem(ListPochas.Items[i]).Summa;
                      cdsPochasPodr.Value         := PPochasItem(ListPochas.Items[i]).Podr;
                      cdsPochasShifrGru.Value     := PPochasItem(ListPochas.Items[i]).ShifrGru;
                      cdsPochasGruppaName.Value   := PPochasItem(ListPochas.Items[i]).GruppaName;
                      cdsPochas.Post;
                 end;


        end;
     if ListTabno.Count>0 then
        for i:=0 to ListTabno.Count-1 do
            Dispose(PTabnoItem(ListTabno.Items[i]));
     ListTabno.Free;
     ListTabno:=Nil;
     frxReport1.ShowReport;
     nmes:=nmestmp;
     nsrv:=nsrvtmp;
     mkflnm;
     GetInf(True);
end;

procedure TFormPochasSwod.FormCreate(Sender: TObject);
 var i:Integer;
     S:string;
     Item:PInteger;
begin
     LabelPodr.Caption := '';
     LabelFio.Caption  := '';
     ModeSwodUch  := False;
     RadioGroupUch.ItemIndex:=0;
     WantedUch    := 0;
     WantedUchFIO := '';
     List:=TList.Create;
     if pFIBDataSetUch.Active then
        pFIBDataSetUch.Close;
     if pFIBDataSetUch.Transaction.Active then
        pFIBDataSetUch.Transaction.Commit;
     pFIBDataSetUch.Transaction.StartTransaction;
     pFIBDataSetUch.Open;
     while not pFIBDataSetUch.EOF do
       begin
            S:=IntToStr(pFIBDataSetUchNOMEROP.Value)+' '+
               Trim(pFIBDataSetUchOp.Value);
            ComboBoxUch.Items.Add(S);
            new(Item);
            Item^:=pFIBDataSetUchShifrWrk.Value;
            List.Add(Item);
            pFIBDataSetUch.Next;
       end;
     ComboBoxUch.ItemIndex:=0;
     if not ModeSwodUch then
        ComboBoxUch.Hide;
     RadioGroupSort.ItemIndex:=0;
     SortPochasMode:=ByPodr;
end;

procedure TFormPochasSwod.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if Trim(VarName)='YM' then
        Value := Trim(GetMonthRus(NMES))+' '+IntToStr(CURRYEAR)+' г.'
     else if Trim(VarName)='ModeName' then
             if modeSwodUch then
                Value := 'участок '+Trim(WantedUchFIO)
             else
                Value := 'по университету';


end;

procedure TFormPochasSwod.DBComboBoxUchChange(Sender: TObject);
begin
     WantedUch    := pFIBDataSetUchSHIFRWRK.Value;
     WantedUchFIO := pFIBDataSetUchOP.Value;
end;

procedure TFormPochasSwod.RadioGroupUchClick(Sender: TObject);
begin
     if RadioGroupUch.ItemIndex=1 then
        modeSwodUch:=True
     else
        modeSwodUch:=False;
     if modeSwodUch then
        begin
              ComboBoxUch.Show;
        end
     else
        begin
             ComboBoxUch.Hide;
             WantedUch:=0;
        end;

end;

procedure TFormPochasSwod.ComboBoxUchChange(Sender: TObject);
 var Item:PInteger;
     I,J:Integer;
begin
     I:=ComboBoxUch.ItemIndex;
     if ((i>=0) and (i<List.Count)) then
        begin
             J:=PInteger(List.Items[I])^;
             WantedUch:=J;
             WantedUchFIO:=ComboBoxUch.Items[I];
        end;
end;

procedure TFormPochasSwod.SetAllPodrSelected;
 var I:Integer;
 begin
      for i:=1 to Count_Serv do
          NameServList.SetSelected(I);
 end;

procedure TFormPochasSwod.SetWantedUchPodrSelected;
 var I:Integer;
 begin
      NameServList.ClearAllSelected;
      if pFIBQueryUch.Open then
         pFIBQueryUch.Close;
      if pFIBQueryUch.Transaction.Active then
         pFIBQueryUch.Transaction.Commit;
      pFIBQueryUch.Transaction.StartTransaction;
      pFIBQueryUch.Params[0].AsInteger:=WantedUch;
      pFIBQueryUch.ExecQuery;
      while not pFIBQueryUch.Eof do
        begin
             i:=pFIBQueryUch.Fields[0].AsInteger;
             if ((i>0) and (i<=Count_Serv)) then
                NameServList.SetSelected(I);
             pFIBQueryUch.Next;
        end;
      pFIBQueryUch.Close;
      pFIBQueryUch.Transaction.Commit;
 end;


procedure TFormPochasSwod.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

end.
