unit UFormIndexUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  dxEditor, dxExEdtr, dxEdLib, dxDBELib, dxCntner, Buttons, ComCtrls, dxTL,
  dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms;

type
  TFormIndexUpdate = class(TForm)
    dsI: TDataSource;
    pFIBdsI: TpFIBDataSet;
    pFIBTrIWrite: TpFIBTransaction;
    pFIBTrIRead: TpFIBTransaction;
    pFIBdsISHIFRID: TFIBIntegerField;
    pFIBdsITABNO: TFIBIntegerField;
    pFIBdsIFIO: TFIBStringField;
    pFIBdsIYEARZA: TFIBSmallIntField;
    pFIBdsIMONTHZA: TFIBSmallIntField;
    pFIBdsIDATAZA: TFIBDateField;
    pFIBdsISHIFRPOD: TFIBSmallIntField;
    pFIBdsIDOLG: TFIBStringField;
    pFIBdsIDATABASEIND: TFIBDateField;
    pFIBdsIRAZRB: TFIBSmallIntField;
    pFIBdsIKOEFB: TFIBBCDField;
    pFIBdsIRAZRA: TFIBSmallIntField;
    pFIBdsIKOEFA: TFIBBCDField;
    pFIBdsIKOEFBUD: TFIBBCDField;
    pFIBdsIKOEFVNE: TFIBBCDField;
    pFIBdsIPROCIND: TFIBBCDField;
    pFIBdsISUMMAB: TFIBBCDField;
    pFIBdsISUMMABF: TFIBBCDField;
    pFIBdsIWORKDAYB: TFIBSmallIntField;
    pFIBdsIKALENDDAYB: TFIBSmallIntField;
    pFIBdsISUMMAA: TFIBBCDField;
    pFIBdsISUMMAAF: TFIBBCDField;
    pFIBdsIWORKDAYA: TFIBSmallIntField;
    pFIBdsIKALENDDAYA: TFIBSmallIntField;
    pFIBdsISUMMAINDBF: TFIBBCDField;
    pFIBdsISUMMAUW: TFIBBCDField;
    pFIBdsISUMMAINDCALC: TFIBBCDField;
    pFIBdsISUMMAPOSTIND: TFIBBCDField;
    pFIBdsISUMMAINDBUD: TFIBBCDField;
    pFIBdsISUMMAINDVNE: TFIBBCDField;
    pFIBdsINEEDIND: TFIBSmallIntField;
    pFIBdsICOMMENT: TFIBStringField;
    pFIBdsIISPOVRAZR: TFIBSmallIntField;
    pFIBdsIMOVEDBUD: TFIBSmallIntField;
    pFIBdsIMOVEDVNE: TFIBSmallIntField;
    pFIBdsISUMMAINDWDAY: TFIBBCDField;
    pFIBdsIKOEFOSN: TFIBBCDField;
    pFIBdsIKOEFOSNBUD: TFIBBCDField;
    pFIBdsIKOEFOSNVNE: TFIBBCDField;
    pFIBdsISUMMAFIXPREV: TFIBBCDField;
    GroupBoxPrev: TGroupBox;
    GroupBoxCurr: TGroupBox;
    dxDBEdit1: TdxDBEdit;
    dxDBEdit2: TdxDBEdit;
    dxDBCalcEdit1: TdxDBCalcEdit;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    dxDBCalcEdit3: TdxDBCalcEdit;
    dxDBCalcEdit5: TdxDBCalcEdit;
    Label8: TLabel;
    dxDBCalcEdit6: TdxDBCalcEdit;
    Label9: TLabel;
    dxDBDateEdit1: TdxDBDateEdit;
    dxDBCalcEdit7: TdxDBCalcEdit;
    dxDBCalcEdit8: TdxDBCalcEdit;
    dxDBCalcEdit10: TdxDBCalcEdit;
    dxdbclcdtSUMMABF: TdxDBCalcEdit;
    dxdbclcdtKALENDDAYB: TdxDBCalcEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    dxDBCalcEdit13: TdxDBCalcEdit;
    dxDBCalcEdit14: TdxDBCalcEdit;
    Label20: TLabel;
    dxdbclcdtSUMMAPOSTIND: TdxDBCalcEdit;
    dxDBCalcEdit16: TdxDBCalcEdit;
    dxDBCalcEdit17: TdxDBCalcEdit;
    dxDBCalcEdit18: TdxDBCalcEdit;
    Label21: TLabel;
    Label22: TLabel;
    dxDBCalcEdit9: TdxDBCalcEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    pFIBdsFaktNach: TpFIBDataSet;
    GroupBoxRes: TGroupBox;
    Label6: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    SummaFBud: TdxDBMaskEdit;
    dsFaktNach: TDataSource;
    pFIBdsFaktNachSUMMABUD: TFIBBCDField;
    pFIBdsFaktNachSUMMAVNE: TFIBBCDField;
    SummaFVne: TdxDBEdit;
    SummaBudR: TEdit;
    SummaVneR: TEdit;
    SummaKBud: TEdit;
    SummaKVne: TEdit;
    PageControl1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    Label27: TLabel;
    dxdbclcdtPROCIND: TdxDBCalcEdit;
    dxdbclcdtSUMMAUW: TdxDBCalcEdit;
    dxDBCalcEdit12: TdxDBCalcEdit;
    dxDBCalcEdit15: TdxDBCalcEdit;
    dxDBCalcEdit19: TdxDBCalcEdit;
    Label32: TLabel;
    Label33: TLabel;
    dxDBMemo1: TdxDBMemo;
    Label2: TLabel;
    TabSheet1: TTabSheet;
    dsAll: TDataSource;
    pFIBdsAll: TpFIBDataSet;
    pFIBdsAllSHIFRID: TFIBIntegerField;
    pFIBdsAllSHIFRPOD: TFIBSmallIntField;
    pFIBdsAllDOLG: TFIBStringField;
    pFIBdsAllDATABASEIND: TFIBDateField;
    pFIBdsAllKOEFA: TFIBBCDField;
    pFIBdsAllSUMMABF: TFIBBCDField;
    pFIBdsAllSUMMAAF: TFIBBCDField;
    pFIBdsAllWORKDAYA: TFIBSmallIntField;
    pFIBdsAllSUMMAINDCALC: TFIBBCDField;
    pFIBdsAllSUMMAPOSTIND: TFIBBCDField;
    pFIBdsAllSUMMAINDBUD: TFIBBCDField;
    pFIBdsAllSUMMAINDVNE: TFIBBCDField;
    pFIBdsAllSUMMAINDWDAY: TFIBBCDField;
    dxDBGridAll: TdxDBGrid;
    pFIBdsAllYEARZA: TFIBSmallIntField;
    pFIBdsAllMONTHZA: TFIBSmallIntField;
    dxDBGridAllSHIFRID: TdxDBGridMaskColumn;
    dxDBGridAllSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridAllDOLG: TdxDBGridMaskColumn;
    dxDBGridAllDATABASEIND: TdxDBGridDateColumn;
    dxDBGridAllKOEFA: TdxDBGridCurrencyColumn;
    dxDBGridAllSUMMABF: TdxDBGridCurrencyColumn;
    dxDBGridAllSUMMAAF: TdxDBGridCurrencyColumn;
    dxDBGridAllWORKDAYA: TdxDBGridMaskColumn;
    dxDBGridAllSUMMAINDCALC: TdxDBGridCurrencyColumn;
    dxDBGridAllSUMMAPOSTIND: TdxDBGridCurrencyColumn;
    dxDBGridAllSUMMAINDBUD: TdxDBGridCurrencyColumn;
    dxDBGridAllSUMMAINDVNE: TdxDBGridCurrencyColumn;
    dxDBGridAllSUMMAINDWDAY: TdxDBGridCurrencyColumn;
    dxDBGridAllYEARZA: TdxDBGridMaskColumn;
    dxDBGridAllMONTHZA: TdxDBGridMaskColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Tabno:Integer;
    Y  : Integer;
    M  : Integer;
    YP : Integer;
    MP : Integer;
    Curr_Person : Pointer;
    { Private declarations }
    procedure OpenDs;
  public
    constructor CreateIndWnd(AOwner: TComponent;Tabno:Integer;Y:Integer;M:Integer;Curr_Person:Pointer=Nil);
    { Public declarations }
  end;

var
  FormIndexUpdate: TFormIndexUpdate;

implementation
 uses UFibModule,ScrDef,ScrUtil;

{$R *.dfm}
constructor TFormIndexUpdate.CreateIndWnd(AOwner: TComponent;Tabno:Integer;Y:Integer;M:Integer;Curr_Person:Pointer=Nil);
 begin
      inherited Create(AOwner);
      Self.Tabno := Tabno;
      Self.Y     := Y;
      Self.M     := M;
      Self.YP    := Y;
      Self.MP    := M-1;
      Self.Curr_Person:=nil;
      BitBtn1.Enabled:=False;
      BitBtn1.Hide;
      if Assigned(Curr_Person) then
         begin
              Self.Curr_Person:=Curr_Person;
              if nmes=FLOW_MONTH then
                 begin
                      BitBtn1.Enabled:=True;
                      BitBtn1.Show;
                 end;
         end;
      if (M<1) then
         begin
              Dec(YP);
              MP:=12;
         end;
      OpenDs;
 end;
procedure TFormIndexUpdate.OpenDs;
 begin
     GroupBoxPrev.Caption:=GetMonthRus(MP) + ' ' + IntToStr(YP)+' г.';
     GroupBoxCurr.Caption:=GetMonthRus(M)  + ' ' + IntToStr(Y)+' г.';
     if pFIBdsI.Active then
        pFIBdsI.Close;
     if pFIBdsAll.Active then
        pFIBdsAll.Close;
     if pFIBdsFaktNach.Active then
        pFIBdsFaktNach.Close;
     if pFIBdsI.Transaction.Active then
        pFIBdsI.Transaction.Commit;
     if pFIBdsI.UpdateTransaction.Active then
        pFIBdsI.UpdateTransaction.Commit;
     pFIBdsI.Params[0].AsInteger:=Tabno;
     pFIBdsI.Params[1].AsInteger:=Y;
     pFIBdsI.Params[2].AsInteger:=M;
     pFIBdsFaktNach.Params[0].AsInteger:=Tabno;
     pFIBdsFaktNach.Params[1].AsInteger:=Y;
     pFIBdsFaktNach.Params[2].AsInteger:=M;
     pFIBdsFaktNach.Params[3].AsInteger:=Tabno;
     pFIBdsFaktNach.Params[4].AsInteger:=Y;
     pFIBdsFaktNach.Params[5].AsInteger:=M;
     pFIBdsAll.Params[0].AsInteger:=Tabno;
     pFIBdsI.Transaction.StartTransaction;
     pFIBdsI.Open;
     pFIBdsFaktNach.Open;
     pFIBdsAll.Open;
     SummaBudR.Text:=dxDBCalcEdit16.Text;
     SummaVneR.Text:=dxDBCalcEdit18.Text;
     SummaFBud.Text:=Format('%8.2f',[pFIBdsFaktNachSUMMABUD.AsFloat]);
     SummaFVne.Text:=Format('%8.2f',[pFIBdsFaktNachSUMMAVNE.AsFloat]);
     SummaKBud.Text:=Format('%8.2f',[pFIBdsFaktNachSUMMABUD.AsFloat-pFIBdsISUMMAINDBUD.AsFloat]);
     SummaKVne.Text:=Format('%8.2f',[pFIBdsFaktNachSUMMAVNE.AsFloat-pFIBdsISUMMAINDVNE.AsFloat]);
     if (Abs(Abs(pFIBdsFaktNachSUMMABUD.AsFloat)-abs(pFIBdsISUMMAINDBUD.AsFloat))<0.01) and
        (Abs(Abs(pFIBdsFaktNachSUMMAVNE.AsFloat)-abs(pFIBdsISUMMAINDVNE.AsFloat))<0.01)
        then
       begin
            BitBtn1.Enabled:=False;
            BitBtn1.Hide;
       end;

 end;

procedure TFormIndexUpdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBdsI.Active then
        pFIBdsI.Close;
     if pFIBdsFaktNach.Active then
        pFIBdsFaktNach.Close;
     if pFIBdsAll.Active then
        pFIBdsAll.Close;
     if pFIBdsI.Transaction.Active then
        pFIBdsI.Transaction.Commit;
     if pFIBdsI.UpdateTransaction.Active then
        pFIBdsI.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormIndexUpdate.BitBtn4Click(Sender: TObject);
begin
     if (((m=7) and (y=2012)) or (y<2012)) then
        begin
             ShowMessage('Нельзя до июля 2012 ');
             Exit;
        end;
     m:=MP;
     y:=yp;
     Dec(MP);
     if (MP<1) then
        begin
          mp:=12;
          Dec(yp);
        end;
     OpenDs;

end;

procedure TFormIndexUpdate.BitBtn5Click(Sender: TObject);
begin
     if ((m=nmes) and (y=curryear)) then
        begin
             ShowMessage('Нельзя после текущего месяца');
             Exit;
        end;
     MP:=m;
     yp:=y;
     Inc(M);
     if (M>12) then
        begin
          m:=1;
          Inc(y);
        end;
     OpenDs;

end;

procedure TFormIndexUpdate.BitBtn1Click(Sender: TObject);
 var CurrPerson:PERSON_PTR;
     SummaKBudVal,SummaKVneVal,a:Real;
     i:Integer;
 procedure AddIndex(Summa:real);
 const RecalcInd_Id=112;
  var
     Curr_Add:ADD_PTR;
  begin
       repeat
       until DEL_WANTED_ADD(INDEX_SHIFR,CurrPerson,M);
       MAKE_ADD(Curr_Add,CurrPerson);
       Curr_Add^.SHIFR  := INDEX_SHIFR;
       Curr_Add^.PERIOD := M;
       Curr_Add^.YEAR   := Y-1990;
       Curr_Add^.SUMMA  := Summa;
       Curr_Add^.FZP    := Curr_Add^.SUMMA;
       Curr_Add^.WHO    := RecalcInd_Id;

  end;
begin
     if not Assigned(Self.Curr_Person) then
        Exit;
     if NMES<>FLOW_MONTH then
        begin
             ShowMessage('Переносить только можно в рабочий месяц, а не а архивный');
             Exit;
        end;
     SummaKBudVal:=0;
     SummaKVneVal:=0;

     Val(Trim(ReplChar(SummaKBud.Text,',','.')),A,i);
     if (i<>0) then
        begin
             ShowMessage('Нельзя преобразовать строку '+Trim(SummaKBud.Text)+' в число');
             Exit;
        end;
     SummaKBudVal:=A;
     Val(Trim(ReplChar(SummaKVne.Text,',','.')),A,i);
     if (i<>0) then
        begin
             ShowMessage('Нельзя преобразовать строку '+Trim(SummaKVne.Text)+' в число');
             Exit;
        end;
     SummaKVneVal:=A;
     CurrPerson:=Person_Ptr(Self.Curr_Person);
     if (CurrPerson.AUTOMATIC<>Automatic_Mode) then
        begin
             ShowMessage('Строка заблокирована. Перенос невозможен');
             Exit;
        end;
     if ((CurrPerson^.Gruppa=1) and (Abs(SummaKBudVal)>0.009)) then
        begin
             AddIndex(SummaKBudVal);
             if (Abs(SummaKVneVal)>0.009) then
                ShowMessage('Проверьте еще перенос внебюджетной суммы');
             ShowMessage('Бюджетная часть перенесена. НЕ забудьте сохранить подразделение');

        end
     else
     if ((CurrPerson^.Gruppa<>1) and
         (Abs(SummaKVneVal)>0.009)) then
        begin
             AddIndex(SummaKVneVal);
             if (Abs(SummaKBudVal)>0.009) then
                ShowMessage('Проверьте еще перенос бюджетной суммы');
             ShowMessage('Внебюджетная часть перенесена. НЕ забудьте сохранить подразделение');

        end;
end;

end.
