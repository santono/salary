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
    Label8: TLabel;
    cbZO6: TComboBox;
    cbPayTP: TComboBox;
    Label9: TLabel;
    cbOTK: TCheckBox;
    cbNRC: TCheckBox;
    cbCodePriz: TComboBox;
    LabelCodePriz: TLabel;
    Edit156: TEdit;
    Label156: TLabel;
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
    procedure cbZO6Change(Sender: TObject);
    procedure cbPayTPChange(Sender: TObject);
    procedure cbCodePrizChange(Sender: TObject);
    procedure cbOTKClick(Sender: TObject);
    procedure cbNRCClick(Sender: TObject);
    procedure Edit156Change(Sender: TObject);

  private
    { Private declarations }
    TotalAmntOfClockExptCurrent:Integer;
    procedure PrepareNightPrazdn;
    procedure CalcNightPrazdn;
    procedure FillTotLineForPochas;
    procedure FillLabelClockPrice;
    procedure showZO;
    procedure hideZO;
    procedure show156;
    procedure hide156;
    procedure fill156;
    function getWhoFor156:Integer;



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
    ZO         : integer;
    OTK        : integer;
    NRC        : integer;
    PAY_TP     : integer;
    Code_priz_1DF : integer;
    Comment156 : string;
    WHO        : Word;
    WantedTabno : Integer;
//    wantedCurrAdd : Add_Ptr;
    wantedCurrPerson  : PERSON_PTR;
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
    SavZO         : integer;
    SavOTK        : integer;
    SavNRC        : integer;
    SavPAY_TP     : integer;
    SavCode_priz_1DF : integer;

  end;

var
  FormUpdAdd: TFormUpdAdd;

implementation
uses ScrLists,FormSelShifrU,ScrUtil,DateUtils,UGetCurrSummmaTot,
 ScrECB, Math ;
{$R *.dfm}
const F='######0.00';

procedure TFormUpdAdd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     cbZO6.Items.Clear;
     cbPayTP.Items.Clear;
     Action:=caFree;
end;

procedure TFormUpdAdd.FormCreate(Sender: TObject);
 var Dt:TDateTime;
     Y,M,D:word;
     i:Integer;
begin
      Summa      := 0 ;
      Fond       := 0 ;
      ShifrSta   := 1 ;
      BitBtn1.Show;
      BitBtn1.Enabled:=true;
      if DOG_POD_PODRAZD(NSRV) then
         begin
              ShifrSta:=DogPodShifr;
              if isSVDN then
                 begin
                      BitBtn1.Hide;
                      BitBtn1.Enabled:=false;
                 end;
         end;
      Days       := 0 ;
      WorkClock  := 0;
      MonthClock := 0;
      Oklad      := 0;
      MonthZa    := 0 ;
      YearZa     := CurrYear;
      ZO         := 0;
      OTK        := 0;
      NRC        := 0;
      PAY_TP     := 0;
      Code_priz_1DF := 0;
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
              Edit156.Enabled          := False;
              cbCodePriz.Enabled       := False;
              cbNRC.Enabled            := False;
              cbOTK.Enabled            := False;
              cbPayTP.Enabled          := False;
              cbZO6.Enabled            := False;

         end;
      TotalAmntOfClockExptCurrent:=0;
      InitialWorkClock:=-1;
      Label2.Caption:=getShortCurrencyName;
//{$IFDEF  SVDN}
      cbZO6.Items.Clear;
      cbZO6.ItemIndex := 0;
      cbZO6.Items.Add('0 - не указано');
      for i:=1 to lenZO6 do
          cbZO6.Items.Add(zo6ShortItems[i]);
      cbPayTp.Items.Clear;
      cbPayTp.ItemIndex := 0;
      for i:=1 to lenPayTp do
          cbPayTP.Items.Add(PayTpShortItems[i]);
      cbCodePriz.Items.Clear;
      cbCodePriz.ItemIndex := 0;
      for i:=1 to lenPayTp do
          cbCodePriz.Items.Add(codePriz1DFShortItems[i]);
      cbOTK.Checked := false;
      cbNRC.Checked := false;
      hide156;
      if isSVDN then
         showZO
      else
         hideZO;
//{$ENDIF}

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
     i:Integer;
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
     if isLNR then
       if ShifrSta=PerersZaProshlPeriody then
          begin
               show156;
               Edit156.Text:=Comment156;
          end
       else
          hide156;   
     y:=YearZa;
     m:=MonthZa;
     Dt:=EnCodeDate(y,m,1);
     DateTimePickerZa.Date:=Dt;
//{$IFDEF  SVDN}
     cbZO6.ItemIndex := 0;
     for i:=1 to lenZO6 do
         if zo=zo6ItemsNo[i] then
            cbZO6.ItemIndex := i;
     cbPayTp.ItemIndex := 0;
     for i:=1 to lenPayTp do
         if pay_Tp=PayTpNo[i] then
            cbPayTP.ItemIndex:=i-1;
     cbCodePriz.ItemIndex := 0;
     for i:=1 to lenCodePriz1DF do
         if Code_priz_1DF=codePriz1DFNo[i] then
            cbCodePriz.ItemIndex:=i-1;
     cbOTK.Checked:=false;
     if OTK > 0 then
        cbOTK.Checked:=True;
     cbNRC.Checked:=false;
     if nrc > 0 then
        cbNRC.Checked:=True;
//{$ENDIF}

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
      if not isSVDN then
         if ShifrSta=PerersZaProshlPeriody then
            begin
                 show156;
                 WHO:=getWhoFor156;
            end
         else
            hide156;
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
 const Fo='######0.00';
 var proc:double;
 begin
      if  (NIGHT_PROC>1) then
          proc := ScrUtil.sum(NIGHT_PROC / 100.00)
      else
          proc := NIGHT_PROC;
      if MonthClock>0.01 then
         begin
              if ShifrSta=Prazdn_Shifr then
                 Summa := ScrUtil.sum(Oklad / MonthClock * WorkClock *2.00)
              else if ShifrSta=Night_Shifr then
                 Summa := ScrUtil.sum(Oklad / MonthClock * WorkClock *proc);
              dxCalcEditSumm.Text      := FormatFloat(Fo,Summa);
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
    SavZO         := ZO;
    SavOTK        := OTK;
    SavNRC        := OTK;
    SavPAY_TP     := PAY_TP;
    SavCode_priz_1DF := Code_priz_1DF;
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
          RetVal:=true
       else if SavZO<>ZO then
          RetVal:=true
       else if SavOTK<>OTK then
          RetVal:=true
       else if SavNRC<>NRC then
          RetVal:=true
       else if SavPAY_TP<>PAY_TP then
          RetVal:=true
       else if SavCode_priz_1DF<>Code_priz_1DF then
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

procedure TFormUpdAdd.showZO;
 begin
      cbZO6.Show;
      cbOTK.Show;
      cbNRC.Show;
      cbPayTP.Show;
      cbCodePriz.Show;
      Label8.Show;
      Label9.Show;
      LabelCodePriz.Show;
  //    Self.Height:=320;
      Application.ProcessMessages;
 end;
procedure TFormUpdAdd.hideZO;
 begin
      cbZO6.Hide;
      cbOTK.Hide;
      cbNRC.Hide;
      cbPayTP.Hide;
      cbCodePriz.Hide;
      Label8.Hide;
      Label9.Hide;
      LabelCodePriz.Hide;
//      Self.Height:=250;
      Self.Height:=Self.Height - cbZO6.Height-cbPayTP.Height-(*cbCodePriz.height-*)10;
      Application.ProcessMessages;

 end;
procedure TFormUpdAdd.hide156;
 begin
      Label156.Hide;
      Edit156.Hide;
      Application.ProcessMessages;
 end;
procedure TFormUpdAdd.Fill156;
 begin
//      Label156.Show;
//      Edit156.Show;
//      Application.ProcessMessages;
 end;
procedure TFormUpdAdd.show156;
 begin
      Label156.Show;
      Edit156.Show;
      Application.ProcessMessages;
 end;


procedure TFormUpdAdd.cbZO6Change(Sender: TObject);
begin
     Self.ZO:=0;
     if cbZO6.ItemIndex>0 then
        Self.ZO:=zo6ItemsNo[cbZO6.ItemIndex];
end;

procedure TFormUpdAdd.cbPayTPChange(Sender: TObject);
begin
     Self.PAY_TP:=0;
     if cbPayTP.ItemIndex>=0 then
        Self.PAY_TP:=PayTpNo[cbPayTP.ItemIndex+1];

end;
procedure TFormUpdAdd.cbCodePrizChange(Sender: TObject);
begin
     Self.Code_priz_1df:=0;
     if cbCodePriz.ItemIndex>=0 then
        Self.Code_priz_1df:=codePriz1DFNo[cbCodePriz.ItemIndex+1];

end;


procedure TFormUpdAdd.cbOTKClick(Sender: TObject);
begin
     if cbOTK.checked then
        otk:=1
     else
        otk:=0;
end;

procedure TFormUpdAdd.cbNRCClick(Sender: TObject);
begin
     if cbNRC.checked then
        NRC:=1
     else
        NRC:=0;

end;

procedure TFormUpdAdd.Edit156Change(Sender: TObject);
var curr_cn:CN_PTR;
    l:integer;
begin
     l:=SizeOf(Curr_cn.Prim_1)-1;
  //   Edit156.Text:=Trim(Edit156.Text);
     if Length(Edit156.Text)>l then
        Edit156.Text:=Copy(Edit156.Text,1,l);
     Comment156:=Trim(Edit156.Text);
end;

function TFormUpdAdd.getWhoFor156:Integer;
 var retVal:Integer;
     i:Integer;
 function checkWho(v:integer):Boolean;
  var retVal:Boolean;
      c_add:ADD_PTR;
  begin
       retVal:=True;
       c_add:=wantedCurrPerson^.ADD;
       while (c_add<>nil) do
         begin
              if c_add^.SHIFR=PerersZaProshlPeriody then
              if c_add^.WHO=v then
                 begin
                      retVal:=False;
                      Break;
                 end;
              c_add:=c_add^.NEXT;   
         end;
       checkWho:=retVal;
  end;
 begin
       retVal:=0;
       i:=0;
       while i<10 do
         begin
              if checkWho(retVal) then
                 begin
                      Break;
                 end
              else
                begin
                      retVal:=RandomRange(0,100);
                      Inc(i);
                end
         end;
        getWhoFor156:=retVal;
 end;


end.
