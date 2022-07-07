{$WARNINGS OFF}
{$HINTS OFF}
unit UFormUpdateCn;
                            
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, StdCtrls, Buttons, Mask,
  ComCtrls;

type
  TFormUpdateCn = class(TForm)
    Label1: TLabel;
    ShifrText: TLabel;
    BitBtn1: TBitBtn;
    CheckBox1: TCheckBox;
    ComboBoxKodAdd: TComboBox;
    Label2: TLabel;
    dxCalcEditSumm: TdxCalcEdit;
    Label3: TLabel;
    Label4: TLabel;
    dxCalcEditPrim: TdxCalcEdit;
    LabelPrim: TLabel;
    MaskEdit1: TMaskEdit;
    LabelPrim1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabelAlim: TLabel;
    LabelPSbor: TLabel;
    LabelAdres: TLabel;
    BitBtn4: TBitBtn;
    ComboBoxKodUd: TComboBox;
    ComboBoxKodBlock: TComboBox;
    dtpDataUw: TDateTimePicker;
    dtpDataPri: TDateTimePicker;
    btnPodr: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dxCalcEditSummChange(Sender: TObject);
    function Execute(var RetVal:integer): boolean;
    procedure dxCalcEditPrimChange(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ComboBoxKodAddSelect(Sender: TObject);
    procedure ComboBoxKodUdChange(Sender: TObject);
    procedure ComboBoxKodAddChange(Sender: TObject);
    procedure ComboBoxKodBlockChange(Sender: TObject);
    procedure ComboBoxKodBlockSelect(Sender: TObject);
    procedure ComboBoxKodUdSelect(Sender: TObject);
    procedure dtpDataUwChange(Sender: TObject);
    procedure dtpDataPriChange(Sender: TObject);
    procedure btnPodrClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    ShifrSta : integer;
    Blocked  : boolean;
    Kod      : Integer;
    Summa    : Real;
    Prim     : integer;
    Prim_1   : string;
    RetCode  : integer;
    Function IsShifrStaKod100(Shifr:Integer):boolean;
    procedure SetUpComboBoxKod(ModeKod:integer);
  end;

var
  FormUpdateCn: TFormUpdateCn;

implementation
 uses ScrDef,ScrLists,FormSelShifrU,ScrUtil,FormCNU,
      UFibModule,FormAlimU,DateUtils;


{$R *.dfm}

Function TFormUpdateCn.IsShifrStaKod100(Shifr:Integer):boolean;
 var i:integer;
 begin
     IsShifrStaKod100:=False;
     for i:= 1 to LenBlSta do
         if ((Shifr=BlSta[i]) or (Shifr-Limit_Cn_Base=BlSta[i])) then
            begin
                 IsShifrStaKod100:=True;
                 Break;
            end;
 end;


procedure TFormUpdateCn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormUpdateCn.BitBtn1Click(Sender: TObject);
 var A:TShowShifrMode;
     ShifrStaW:integer;
begin
      with TFormSelShifr.Create(nil) do
         try
             if ShifrSta>Limit_Cn_Base then
                ShifrSta:=ShifrSta-Limit_Cn_Base;
             SetShifr(ShifrSta,AllMode);
             if execute then
                begin
                      A                 := AllMode;
                      ShifrSta          := GetShifr(A);
                      if ShifrSta=GUIDShifr then
                         begin
                              ShowMessage('Уникальный код вводить нельзя');
                              ShifrSta:=0;
                         end;
                      if IsShifrStaKod100(ShifrSta) then ShifrSta:=ShifrSta+Limit_Cn_Base;
                      ShifrText.Caption := IntToStr(ShifrSta)+' '+Trim(ShifrList.GetName(ShifrSta));
                      SetUpComboBoxKod(0);
                      if Is_Alimenty_Shifr(ShifrSta) then
                         begin
                               BitBtn4.Show;
                               BitBtn4.Enabled:=true;
                         end;
                      if (ShifrSta=DataUwShifr) or
                         (ShifrSta=DataUwShifr+Limit_Cn_Base) then
                         begin
                               dtpDataUw.Show;
                               dtpDataUw.Enabled:=True;
                         end
                      else
                         begin
                               dtpDataUw.Hide;
                               dtpDataUw.Enabled:=False;
                         end;
                      if (ShifrSta=DataPriShifr) or
                         (ShifrSta=DataPriShifr+Limit_Cn_Base) then
                         begin
                               dtpDataPri.Show;
                               dtpDataPri.Enabled:=True;
                         end
                      else
                         begin
                               dtpDataPri.Hide;
                               dtpDataPri.Enabled:=False;
                         end;
                      {$IFNDEF SVDN}
                      if (ShifrSta=NOMER_PODR_SHIFR+Limit_Cn_Base) then
                         begin
                              btnPodr.Show;
                              btnPodr.Enabled:=true;
                              if (Prim>0) and (Self.ShifrSta<>(PerersZaProshlPeriody+LIMIT_CN_BASE)) then
                                 LabelAlim.Caption:=getNameDepPodrFromSQL(Prim);
                         end
                      else
                         begin
                              btnPodr.Hide;
                              btnPodr.Enabled:=false;
                         end;
                      {$ENDIF}

                end;
         finally
             free;
         end;
      RePaint;
      AppLication.ProcessMessages;

end;

procedure TFormUpdateCn.FormShow(Sender: TObject);
const F='######0.00';
var   ShifrAlim,ModePSbor:integer;
      WPrim:word;
      ProcentPST:real;
      D,m,Y:Word;
      S,S1:String;
      j:Integer;
begin
     LabelAlim.Caption     := '';
     LabelPSbor.Caption    := '';
     LabelAdres.Caption    := '';
     ShifrText.Caption     := IntToStr(ShifrSta)+' '+Trim(ShifrList.GetName(ShifrSta));
     dxCalcEditSumm.Text   := FormatFloat(F,Summa);
     dxCalcEditPrim.Text   := IntToStr(Prim);
     MaskEdit1.Text        := Prim_1;
     SetUpComboBoxKod(1);
     btnPodr.Hide;
     btnPodr.Enabled:=false;

     if not Is_Alimenty_Shifr(ShifrSta) then
        begin
             BitBtn4.Hide;
             BitBtn4.Enabled:=false
        end
     else
        begin
             WPrim:=Prim;
             ModePSbor:=GET_ALIMENTY_MODE(WPrim);
             ShifrAlim:=Get_ALIMENTY_PRIM(WPrim);
             if not FIB.pFIBQuery.Transaction.Active then
                FIB.pFIBQuery.Transaction.StartTransaction;
             FIB.pFIBQuery.SQL.Clear;
             FIB.pFIBQuery.SQL.Add('SELECT FIRST 1 FIO_WOMEN,ADRES,ProcentPST FROM ALIMENTY WHERE SHIFR='+IntToStr(ShifrAlim));
             try
                FIB.pFIBQuery.ExecQuery;
                LabelAlim.Caption := FIB.pFIBQuery.Fields[0].AsString;
                if Length(Trim(LabelAlim.Caption))=0 then LabelAlim.Caption;
                LabelAdres.Caption:= FIB.pFIBQuery.Fields[1].AsString;
                if Length(Trim(LabelAdres.Caption))=0 then LabelAdres.Caption;
                ProcentPST:= FIB.pFIBQuery.Fields[2].AsFloat;
             except
                   ShowMessage('Ошибка получения фамилии получателя алиментов');
             end;
             FIB.pFIBQuery.Close;
             if FIB.pFIBQuery.Transaction.Active then
                FIB.pFIBQuery.Transaction.Commit;
             if ModePSbor>0 then
                LabelPSbor.Caption:=GetNamePSbor(ModePSbor)+' Процент '+FloatToStr(ProcentPST);
        end;
     if (ShifrSta=DataUwShifr+Limit_Cn_Base) then
        begin
              dtpDataUw.Show;
              dtpDataUw.Enabled:=true;
              s:=Trim(Prim_1);
              if Length(s)=8 then
                 begin
                 {
                      s1:=Copy(s,1,2);
                      Val(S1,d,j);
                      if j<>0 then d:=DayOf(now);
                      s1:=Copy(s,4,2);
                      Val(S1,m,j);
                      if j<>0 then m:=MonthOf(now);
                      if ((m<1) or (m>12)) then m:=MonthOf(now);
                      s1:=Copy(s,7,2);
                      Val(S1,m,j);
                      if j<>0 then y:=YearOf(now)
                              else y:=y+2000;
                      if ((y<2011) or (y>hugeWrongYear)) then Y:=YearOf(now);
                      dtpDataUw.Date:=EncodeDate(y,m,d);
                  }
                      dtpDataUw.Date:=DecodeDataFromPrim1(s);
                 end;
        end;
     if (ShifrSta=DataPriShifr+Limit_Cn_Base) then
        begin
              dtpDataPri.Show;
              dtpDataPri.Enabled:=true;
              s:=Trim(Prim_1);
              if Length(s)=8 then
                 begin
                      s1:=Copy(s,1,2);
                      Val(S1,d,j);
                      if j<>0 then d:=DayOf(now);
                      s1:=Copy(s,4,2);
                      Val(S1,m,j);
                      if j<>0 then m:=MonthOf(now);
                      if ((m<1) or (m>12)) then m:=MonthOf(now);
                      s1:=Copy(s,7,2);
                      Val(S1,m,j);
                      if j<>0 then y:=YearOf(now)
                              else y:=y+2000;
                      if ((y<2011) or (y>hugeWrongYear)) then Y:=YearOf(now);
                      dtpDataPri.Date:=EncodeDate(y,m,d);
                 end;
        end;
     {$IFNDEF SVDN}
     if (ShifrSta=Nomer_Podr_SHIFR+Limit_Cn_Base) then
        begin
              btnPodr.Show;
              btnPodr.Enabled:=true;
              if Prim>0 then
                 LabelAlim.Caption:=getNameDepPodrFromSQL(Prim);
        end;
     {$ENDIF}   
end;


procedure TFormUpdateCn.SetUpComboBoxKod(ModeKod:integer);
 {
  0 - установить новый код
  1 - оставить существуущий код
 }
 var i:Integer;
 begin
      if (IsShifrStaKod100(ShifrSta)) or (ShifrSta>Limit_Cn_Base) then
         begin
              ComboBoxKodAdd.Visible   := false;
              ComboBoxKodAdd.Enabled   := false;
              ComboBoxKodUd.Visible    := false;
              ComboBoxKodUd.Enabled    := false;
              ComboBoxKodBlock.Visible := true;
              ComboBoxKodBlock.Enabled := true;
              Kod:=100;
              ComboBoxKodBlock.ItemIndex:=0;
         end
      else if ShifrList.IsAdd(ShifrSta) then
         begin
              ComboBoxKodAdd.Visible:=true;
              ComboBoxKodAdd.Enabled:=true;
              ComboBoxKodUd.Visible:=false;
              ComboBoxKodUd.Enabled:=false;
              ComboBoxKodBlock.Visible:=false;
              ComboBoxKodBlock.Enabled:=false;
              if ModeKod=0 then Kod:=2;
              ComboBoxKodAdd.ItemIndex:=Kod-1;
         end
      else
         begin
              ComboBoxKodAdd.Visible := false;
              ComboBoxKodAdd.Enabled := false;
              ComboBoxKodUd.Visible  := true;
              ComboBoxKodUd.Enabled  := true;
              ComboBoxKodBlock.Visible:=false;
              ComboBoxKodBlock.Enabled:=false;
              if ModeKod=0 then Kod:=1;
              ComboBoxKodUd.ItemIndex:=Kod-1;
         end;
      if ComboBoxKodAdd.Visible then ComboBoxKodAdd.RePaint;
      if ComboBoxKodUd.Visible then ComboBoxKodUd.RePaint;
      if ComboBoxKodBlock.Visible then ComboBoxKodBlock.RePaint;
 end;
procedure TFormUpdateCn.dxCalcEditSummChange(Sender: TObject);
var A : Real;
    I : Integer;
    S : String;
    Flags:TReplaceFlags;
begin
     Flags:=[rfReplaceAll,rfIgnoreCase];
     S:=StringReplace(dxCalcEditSumm.Text,',','.',Flags);
     val(S,A,I);
     if i=0 then Summa:=A;
end;

function TFormUpdateCn.Execute(var RetVal:integer): boolean;
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


procedure TFormUpdateCn.dxCalcEditPrimChange(Sender: TObject);
var
    I,A : Integer;
    S : String;
begin
     S:=dxCalcEditPrim.Text;
     val(S,A,I);
     if i=0 then Prim:=A;
end;

procedure TFormUpdateCn.MaskEdit1Change(Sender: TObject);
begin
      Prim_1:=copy(MaskEdit1.Text+Space(8),1,8)
end;

procedure TFormUpdateCn.FormCreate(Sender: TObject);
begin
     LabelAlim.Caption  := '';
     LabelPSbor.Caption := '';
     ComboBoxKodAdd.Items.Add('Абс.сумма (ФЗП)');
     ComboBoxKodAdd.Items.Add('% оклада (ФЗП)');
     ComboBoxKodAdd.Items.Add('Абс.сумма (ФMП)');
     ComboBoxKodAdd.Items.Add('% оклада (ФMП)');
     ComboBoxKodAdd.Items.Add('Абс.сумма (ПР)');
     ComboBoxKodAdd.Items.Add('% оклада (ПР)');

     
     ComboBoxKodUd.Items.Add(' абс.сумма ');
     ComboBoxKodUd.Items.Add(' % оклада ');
     ComboBoxKodUd.Items.Add(' % нач суммы ');

     ComboBoxKodBlock.Items.Add('Блок (100)');

     ComboBoxKodUd.Top       := ComboBoxKodAdd.Top;
     ComboBoxKodUd.Left      := ComboBoxKodAdd.Left;
     ComboBoxKodUd.Height    := ComboBoxKodAdd.Height;
     ComboBoxKodUd.Width     := ComboBoxKodAdd.Width;

     ComboBoxKodBlock.Top    := ComboBoxKodAdd.Top;
     ComboBoxKodBlock.Left   := ComboBoxKodAdd.Left;
     ComboBoxKodBlock.Height := ComboBoxKodAdd.Height;
     ComboBoxKodBlock.Width  := ComboBoxKodAdd.Width;
     dtpDataUw.Hide;
     dtpDataUw.Enabled:=False;
     dtpDataPri.Hide;
     dtpDataPri.Enabled:=False;
     if (NMES<>FLOW_MONTH) or (WORK_YEAR_VAL<>CurrYear) then
        begin
             BitBtn1.Enabled          := False;
             BitBtn2.Enabled          := False;
             BitBtn3.Enabled          := False;
             BitBtn4.Enabled          := False;
             CheckBox1.Enabled        := False;
             ComboBoxKodAdd.Enabled   := false;
             ComboBoxKodBlock.Enabled := false;
             ComboBoxKodUd.Enabled    := false;
             dtpDataUw.Enabled        := False;
             dtpDataPri.Enabled       := False;
             dxCalcEditPrim.Enabled   := False;
             dxCalcEditSumm.Enabled   := False;
             MaskEdit1.Enabled        := False;

        end;

     if isLNR then
         Label4.Caption:='руб.';




end;

procedure TFormUpdateCn.BitBtn4Click(Sender: TObject);
begin
    with TFormAlim.Create(nil) do
         try
            ActClarion:=4;
            if execute then
               begin
                     Prim:=CODE_ALIMENTY_PRIM(WantedShifrAlim,WantedPSborMode);
                     Self.FormShow(Sender);
                     Self.Repaint;
               end;
         finally
{            free;   }
          end;

end;

procedure TFormUpdateCn.BitBtn2Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TFormUpdateCn.ComboBoxKodAddSelect(Sender: TObject);
begin
     Kod:=ComboBoxKodAdd.ItemIndex+1;
end;

procedure TFormUpdateCn.ComboBoxKodUdChange(Sender: TObject);
begin
     Kod:=ComboBoxKodUd.ItemIndex+1;
end;

procedure TFormUpdateCn.ComboBoxKodAddChange(Sender: TObject);
begin
     Kod:=ComboBoxKodAdd.ItemIndex+1;

end;

procedure TFormUpdateCn.ComboBoxKodBlockChange(Sender: TObject);
begin
     Kod:=100;
end;

procedure TFormUpdateCn.ComboBoxKodBlockSelect(Sender: TObject);
begin
     Kod:=100;
end;

procedure TFormUpdateCn.ComboBoxKodUdSelect(Sender: TObject);
begin
     Kod:=ComboBoxKodUd.ItemIndex+1;
end;

procedure TFormUpdateCn.dtpDataUwChange(Sender: TObject);
 var dt:TDateTime;
     y,m,d:word;
     sd,sm,sy:string;
begin
     dt:=dtpDataUw.Date;
     DecodeDate(dt,y,m,d);
     sd:=Trim(IntToStr(d));
     if Length(sd)=1 then Sd:='0'+Sd;
     sm:=Trim(IntToStr(m));
     if Length(sm)=1 then Sm:='0'+Sm;
     if y>=2000 then y:=y-2000
                else y:=y-1900;
     sy:=Trim(IntToStr(y));
     if Length(sy)=1 then Sy:='0'+Sy;
     Prim_1:=sd+'.'+sm+'.'+sy;
     MaskEdit1.Text:=Prim_1;
     Application.ProcessMessages;
end;
procedure TFormUpdateCn.dtpDataPriChange(Sender: TObject);
 var dt:TDateTime;
     y,m,d:word;
     sd,sm,sy:string;
begin
     dt:=dtpDataPri.Date;
     DecodeDate(dt,y,m,d);
     sd:=Trim(IntToStr(d));
     if Length(sd)=1 then Sd:='0'+Sd;
     sm:=Trim(IntToStr(m));
     if Length(sm)=1 then Sm:='0'+Sm;
     if y>=2000 then y:=y-2000
                else y:=y-1900;
     sy:=Trim(IntToStr(y));
     if Length(sy)=1 then Sy:='0'+Sy;
     Prim_1:=sd+'.'+sm+'.'+sy;
     MaskEdit1.Text:=Prim_1;
     Application.ProcessMessages;
end;

procedure TFormUpdateCn.btnPodrClick(Sender: TObject);
 var retVal:integer;
     oldRetVal:integer;
begin
     oldRetVal:=Prim;
     retVal:=getDepCodeFromSQL(Prim);
     if ((retVal>0) and (retVal<>oldRetVal)) then
        begin
             prim:=retVal;
             LabelAlim.Caption:=getNameDepPodrFromSQL(retVal);
             dxCalcEditPrim.Text   := IntToStr(Prim);
             Application.ProcessMessages;
        end;

end;

end.
