unit UFormUpdAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxEdLib, dxCntner, dxEditor, StdCtrls, Buttons,
  ExtCtrls, ComCtrls,ScrDef;

type
  TFormUpdAdd = class(TForm)
    Label1: TLabel;
    ShifrText: TLabel;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    dxCalcEditSumm: TdxCalcEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    dxSpinEditDay: TdxSpinEdit;
    Label5: TLabel;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    PanelNP: TPanel;
    LabelWC: TLabel;
    dxCalcEditWClock: TdxCalcEdit;
    dxCalcEditMClock: TdxCalcEdit;
    LabelMClock: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    LabelOklad: TLabel;
    BitBtn4: TBitBtn;
    DateTimePickerZa: TDateTimePicker;
    PanelToTClock: TPanel;
    LabelPClock: TLabel;
    dxCalcEditPClock: TdxCalcEdit;
    LabelTotClockForPochas: TLabel;
    LabelClockPrice: TLabel;
    LabelTotForTest: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function Execute(var RetVal:integer): boolean;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dxCalcEditSummChange(Sender: TObject);
    procedure dxSpinEditDayChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SaveRecord;
    function NotEqualOldAndNewRecords:boolean;
    procedure dxCalcEditWClockChange(Sender: TObject);
    procedure dxCalcEditMClockChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DateTimePickerZaChange(Sender: TObject);
    procedure dxCalcEditPClockChange(Sender: TObject);

  private
    { Private declarations }
    TotalAmntOfClockExptCurrent:Integer;
    procedure PrepareNightPrazdn;
    procedure CalcNightPrazdn;
    procedure FillTotLineForPochas;
    procedure FillLabelClockPrice;



  public
    { Public declarations }
    ShifrSta   : Integer;
    Summa      : Real;
    Days       : integer;
    WorkClock  : real;
    MonthClock : real;
    Oklad      : real;
    Fond       : integer;
    MonthZa    : word;
    YearZa     : word;
    WantedTabno : Integer;
    CurrAdd    : Add_Ptr;
    InitialWorkClock: Real;

    RetCode    : integer;
    SavShifrSta : integer;
    SavSumma    : real;
    SavDays     : integer;
    SavWorkClock  : real;
    SavMonthClock : real;
    SavOklad      : real;
    SavFond     : integer;
    SavMonthZa  : integer;
    SavYearZa   : integer;
  end;

var
  FormUpdAdd: TFormUpdAdd;

implementation
uses ScrLists,FormSelShifrU,ScrUtil,DateUtils,UGetCurrSummmaTot;
{$R *.dfm}
const F='######0.00';

procedure TFormUpdAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormUpdAdd.FormCreate(Sender: TObject);
 var Dt:TDateTime;
     Y,M,D:word;
begin
      Summa      := 0 ;
      Fond       := 0 ;
      ShifrSta   := 1 ;
      BitBtn1.Show;
      BitBtn1.Enabled:=true;
      if DOG_POD_PODRAZD(NSRV) then
         begin
              ShifrSta:=DogPodShifr;
              BitBtn1.Hide;
              BitBtn1.Enabled:=false;
         end;
      Days       := 0 ;
      WorkClock  := 0;
      MonthClock := 0;
      Oklad      := 0;
      MonthZa    := 0 ;
      YearZa     := CurrYear;
      PanelNP.Hide;
      PanelTotClock.Hide;
      if ShifrSta=NOT_USE_HOLIDAY_SHIFR  then
         dxSpinEditDay.MaxValue:=730;
      y:=CurrYear;
      m:=nmes;
      Dt:=EnCodeDate(y,m,1);
      DateTimePickerZa.Date:=Dt;
      DateTimePickerZa.MinDate:=EnCodeDate(1991,1,1);
      DateTimePickerZa.MaxDate:=EnCodeDate(CurrYear+2,12,1);
      if (NMES<>FLOW_MONTH) or (WORK_YEAR_VAL<>CurrYear) then
         begin
              BitBtn1.Enabled          := false;
              BitBtn2.Enabled          := false;
              BitBtn3.Enabled          := false;
              DateTimePickerZa.Enabled := False;
              dxCalcEditSumm.Enabled   := False;
              dxSpinEditDay.Enabled    := False;
              BitBtn4.Enabled          := False;
              dxCalcEditMClock.Enabled := False;
              dxCalcEditWClock.Enabled := False;
              dxCalcEditPClock.Enabled := False;
              RadioGroup1.Enabled      := false;
         end;
      TotalAmntOfClockExptCurrent:=0;
      InitialWorkClock:=-1;
      Label2.Caption:=getShortCurrencyName;
end;

function TFormUpdAdd.Execute(var RetVal:integer): boolean;
begin
  Self.visible:=false;
  if ShifrSta=NOT_USE_HOLIDAY_SHIFR  then
     dxSpinEditDay.MaxValue:=730;
  if ShowModal = mrOk then begin
    RetVal := RetCode;
    Result := true;
  end else begin
    result := false;
    RetVal := RetCode;
  end;
end;

procedure TFormUpdAdd.FormShow(Sender: TObject);
 var Dt:TDateTime;
     y,m,d:word;
begin
     RadioGroup1.ItemIndex    := Fond;
     ShifrText.Caption        := IntToStr(ShifrSta)+' '+Trim(ShifrList.GetName(ShifrSta));
     dxCalcEditSumm.Text      := FormatFloat(F,Summa);
     dxCalcEditWClock.Text    := FormatFloat(F,WorkClock);
     dxCalcEditMClock.Text    := FormatFloat(F,MonthClock);
     dxCalcEditPClock.Text    := FormatFloat(F,WorkClock);
     LabelOklad.Caption       := 'Оклад '+trim(FormatFloat(F,Oklad))+' '+getShortCurrencyName;
   {  dxDateEditZa.Date        := EnCodeDate(YearZa,MonthZa,1);}
     dxSpinEditDay.Value      := Days;
     if ((ShifrSta = prazdn_shifr) or (ShifrSta=night_shifr)) then
             PanelNP.Show
     else if (ShifrSta = Pochas_shifr) then
        begin
             FillTotLineForPochas;
             FillLabelClockPrice;
             PanelTotClock.Show;
        end
     else
        begin
             PanelNP.Hide;
             PanelTotClock.Hide;
        end;
     y:=YearZa;
     m:=MonthZa;
     Dt:=EnCodeDate(y,m,1);
     DateTimePickerZa.Date:=Dt;

end;

procedure TFormUpdAdd.BitBtn1Click(Sender: TObject);
 var a:TShowShifrMode;
begin
      with TFormSelShifr.Create(nil) do
         try
             SetShifr(ShifrSta,AddMode);
             if execute then
                begin
                      A                 := AddMode;
                      ShifrSta          := GetShifr(A);
                      ShifrText.Caption := IntToStr(ShifrSta)+' '+Trim(ShifrList.GetName(ShifrSta));
                end;
         finally
             free;
         end;
      if ShifrSta<>DogPodShifr then   
         DefaultAddShifr:=ShifrSta;
      if ((ShifrSta = Prazdn_Shifr) or (ShifrSta = Night_Shifr)) then
         PanelNP.Show
      else if ShifrSta = Pochas_Shifr then
           begin
                FillTotLineForPochas;
                FillLabelClockPrice;
                PanelTotClock.Show;
           end
      else
         begin
              PanelNP.Hide;
              PanelToTClock.Hide;
         end;     
      if ShifrSta=NOT_USE_HOLIDAY_SHIFR  then
         dxSpinEditDay.MaxValue:=730;

      RePaint;
end;

procedure TFormUpdAdd.PrepareNightPrazdn;
 begin
 end;


procedure TFormUpdAdd.dxCalcEditSummChange(Sender: TObject);
var A : Real;
    I : Integer;
    S : String;
    Flags:TReplaceFlags;
begin
     Flags:=[rfReplaceAll,rfIgnoreCase];
     S:=StringReplace(dxCalcEditSumm.Text,',','.',Flags);
     val(S,A,I);
     if i=0 then Summa:=R10(A);
     if ShifrSta=Pochas_Shifr then
        FillLabelClockPrice;
end;



procedure TFormUpdAdd.dxSpinEditDayChange(Sender: TObject);
begin
     DayS:= round(dxSpinEditDay.Value);
end;
procedure TFormUpdAdd.RadioGroup1Click(Sender: TObject);
begin
     Fond:=RadioGroup1.ItemIndex;
end;

procedure TFormUpdAdd.BitBtn2Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;



procedure TFormUpdAdd.CalcNightPrazdn;
 const F='######0.00';
 begin
      if MonthClock>0.01 then
         begin
              if ShifrSta=Prazdn_Shifr then
                 Summa := sum(Oklad / MonthClock * WorkClock *2)
              else if ShifrSta=Night_Shifr then
                 Summa := sum(Oklad / MonthClock * WorkClock *0.35);
              dxCalcEditSumm.Text      := FormatFloat(F,Summa);
              Application.ProcessMessages;
         end;
 end;

procedure TFormUpdAdd.SaveRecord;
 begin
    SavShifrSta   := ShifrSta;
    SavSumma      := Summa;
    SavDays       := Days;
    SavFond       := Fond;
    SavMonthZa    := MonthZa;
    SavYearZa     := YearZa;
    SavWorkClock  := WorkClock;
    SavOklad      := Oklad;
 end;

function TFormUpdAdd.NotEqualOldAndNewRecords:boolean;
 var RetVal:boolean;
 begin
       RetVal:=false;
       if abs(abs(Summa)-abs(SavSumma))>0.005 then
          RetVal:=true
       else if SavMonthZa<>MonthZa then
          RetVal:=true
       else if SavYearZa<>YearZa then
          RetVal:=true;
       NotEqualOldAndNewRecords:=RetVal;
 end;

procedure TFormUpdAdd.dxCalcEditWClockChange(Sender: TObject);
var A : Real;
    I : Integer;
    S : String;
    Flags:TReplaceFlags;
begin
     Flags:=[rfReplaceAll,rfIgnoreCase];
     S:=StringReplace(dxCalcEditWClock.Text,',','.',Flags);
     val(S,A,I);
     if i=0 then
        begin
              WorkClock:=A;
//              CalcNightPrazdn;
        end;
end;


procedure TFormUpdAdd.dxCalcEditMClockChange(Sender: TObject);
var A : Real;
    I : Integer;
    S : String;
    Flags:TReplaceFlags;
begin
     Flags:=[rfReplaceAll,rfIgnoreCase];
     S:=StringReplace(dxCalcEditMClock.Text,',','.',Flags);
     val(S,A,I);
     if i=0 then
        begin
              MonthClock:=A;
//              CalcNightPrazdn;
        end;

end;

procedure TFormUpdAdd.BitBtn4Click(Sender: TObject);
begin
     CalcNightPrazdn;
end;

procedure TFormUpdAdd.DateTimePickerZaChange(Sender: TObject);
 var Dt : TDateTime;
begin
     Dt := DateTimePickerZa.DateTime;
     MonthZa := MonthOf(Dt);
//     YearZa  := YearOf(Dt)-1990;
     YearZa  := YearOf(Dt);
end;

procedure TFormUpdAdd.FillTotLineForPochas;
 var I : Integer;
 begin
//      I := Round(FillClockForPerson(WantedTabno,CurrAdd));
      if InitialWorkClock<-0.001 then
         begin
              I := Round(GetPochasClockTot(WantedTabno)+GetPochasClockFromDB(WantedTabno));
              InitialWorkClock:=i-round(WorkClock);
         end
      else
         i:=Round(InitialWorkClock);

//      i := i-Round(WorkClock);
      LabelTotClockForPochas.Caption:='Итого '+IntToStr(I)+'+'+IntToStr(Round(WorkClock))+'='+IntToStr(i+round(WorkClock))+' часов.';
      TotalAmntOfClockExptCurrent:=I;
 end;

procedure TFormUpdAdd.FillLabelClockPrice;
 var I           : Integer;
     SummaAdd    : Real;
     NmbOfClock  : Real;
     SummaAddS   : string;
     NmbOfClockS : string;
     S           : string;
     Flags       : TReplaceFlags;
     PriceOfClock : Real;
begin
      Flags:=[rfReplaceAll,rfIgnoreCase];
      S:=StringReplace(dxCalcEditSumm.Text,',','.',Flags);
      SummaAddS   := S;
      S:=StringReplace(dxCalcEditPClock.Text,',','.',Flags);
      NmbOfClockS := S;
      Val(SummaAddS,SummaAdd,I);
      if i<>0 then
         begin
              LabelClockPrice.Caption:='Нельзя вычислить';
              Exit;
         end;
      Val(NmbOfClockS,NmbOfClock,I);
      if i<>0 then
         begin
              LabelClockPrice.Caption:='Нельзя вычислить';
              Exit;
         end;
      if NmbOfClock>0.01 then
         PriceOfClock:=R10(SummaAdd / NmbOfClock)
      else
         PriceOfClock:=0;
      LabelClockPrice.Caption:='Стоимость часа - '+Trim(format('%12.2f',[PriceOfClock]))+' '+getShortCurrencyName;
      i:=Round(NmbOfClock);
      if (TotalAmntOfClockExptCurrent+NmbOfClock>240) then
         S:='Превышение '+IntToStr(TotalAmntOfClockExptCurrent+I-240)
      else if (TotalAmntOfClockExptCurrent+NmbOfClock<240) then
         S:='Резерв '+IntToStr(240-(TotalAmntOfClockExptCurrent+I))
      else
         S:='Норма выполнена - 240';
      S:=S+' часов';   
      LabelTotForTest.Caption:=S;
 end;



procedure TFormUpdAdd.dxCalcEditPClockChange(Sender: TObject);
var A : Real;
    I : Integer;
    S : String;
    Flags:TReplaceFlags;
begin
     Flags:=[rfReplaceAll,rfIgnoreCase];
     S:=StringReplace(dxCalcEditPClock.Text,',','.',Flags);
     val(S,A,I);
     if i=0 then
        begin
              WorkClock:=A;
              FillTotLineForPochas;
              FillLabelClockPrice;
//              CalcNightPrazdn;
        end;
end;

end.
