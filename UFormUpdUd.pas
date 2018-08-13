unit UFormUpdUd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxExEdtr, dxEdLib, dxCntner, dxEditor,
  ComCtrls;

type
  TFormUpdUd = class(TForm)
    Label1: TLabel;
    ShifrText: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    dxCalcEditSumm: TdxCalcEdit;
    Label4: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DateTimePickerZa: TDateTimePicker;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function Execute(var RetVal:integer): boolean;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dxCalcEditSummChange(Sender: TObject);
    procedure DateTimePickerZaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ShifrSta   : Integer;
    Summa   : Real;
    MonthZa : word;
    YearZa  : word;
    RetCode : integer;
  end;

var
  FormUpdUd: TFormUpdUd;

implementation
 uses ScrDef,ScrLists,FormSelShifrU,ScrUtil,DateUtils;

{$R *.dfm}

procedure TFormUpdUd.BitBtn1Click(Sender: TObject);
 var A:TShowShifrMode;
begin
      with TFormSelShifr.Create(nil) do
         try
             SetShifr(ShifrSta,UdMode);
             if execute then
                begin
                      A                 := UdMode;
                      ShifrSta          := GetShifr(A);
                      ShifrText.Caption := IntToStr(ShifrSta)+' '+Trim(ShifrList.GetName(ShifrSta));
                end;
         finally
             free;
         end;
      RePaint;

end;

procedure TFormUpdUd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormUpdUd.FormCreate(Sender: TObject);
 var y : word;
begin
      Summa := 0 ;
      ShifrSta := Podoh_Shifr ;
      DateTimePickerZa.MinDate:=EnCodeDate(1991,1,1);
      y:=CurrYear+2;
      DateTimePickerZa.MaxDate:=EnCodeDate(y,12,1);
      if (NMES<>FLOW_MONTH) or (WORK_YEAR_VAL<>CurrYear) then
         begin
              BitBtn1.Enabled          := False;
              BitBtn2.Enabled          := False;
              BitBtn3.Enabled          := False;
              DateTimePickerZa.Enabled := False;
              dxCalcEditSumm.Enabled   := false;
         end;
      Label3.Caption:=getShortCurrencyName;
end;

function TFormUpdUd.Execute(var RetVal:integer): boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    RetVal := RetCode;
    Result := true;
  end else begin
    result := false;
    RetVal := RetCode;
  end;
end;


procedure TFormUpdUd.FormShow(Sender: TObject);
const F='######0.00';
  var Dt : TDateTime;
      y,m,d : word;
begin
     ShifrText.Caption           := IntToStr(ShifrSta)+' '+Trim(ShifrList.GetName(ShifrSta));
     dxCalcEditSumm.Text         := FormatFloat(F,Summa);
     y                           := YearZa;
     m                           := MonthZa;
     Dt                          := EnCodeDate(y,m,1);
     DateTimePickerZa.Date       := Dt; 


end;

procedure TFormUpdUd.BitBtn2Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TFormUpdUd.dxCalcEditSummChange(Sender: TObject);
var A : Real;
    I : Integer;
    S : String;
    Flags:TReplaceFlags;
begin
     Flags:=[rfReplaceAll,rfIgnoreCase];
     S:=StringReplace(dxCalcEditSumm.Text,',','.',Flags);
     val(S,A,I);
     if i=0 then Summa:=R10(A);
end;





procedure TFormUpdUd.DateTimePickerZaChange(Sender: TObject);
 var Dt:TDateTime;
     y,m,d : word;
begin
     Dt:=DateTimePickerZa.Date;
     MonthZa := MonthOf(Dt);
     YearZa  := YearOf(Dt);
end;

end.
