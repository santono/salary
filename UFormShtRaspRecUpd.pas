unit UFormShtRaspRecUpd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxCntner, dxEditor, dxExEdtr, dxDBEdtr, dxDBELib,
  dxEdLib, DBCtrls, ExtCtrls, Buttons, ComCtrls, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalc, cxDBEdit, cxControls, cxContainer, cxEdit,
  cxCheckBox;

type
  TFormShtRaspRecUpd = class(TForm)
    Label1: TLabel;
    dxDBButtonEditTabno: TdxDBButtonEdit;
    dxDBEditFIO: TdxDBEdit;
    dxDBCalcEditKoefB: TdxDBCalcEdit;
    dxDBCalcEditKoefv: TdxDBCalcEdit;
    Label2: TLabel;
    DBLookupComboBoxDol: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    DBRadioGroupWR: TDBRadioGroup;
    DBLookupComboBoxUS: TDBLookupComboBox;
    DBLookupComboBoxUZ: TDBLookupComboBox;
    DBLookupComboBoxZasl: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dxDBCalcPStag: TdxDBCalcEdit;
    dxDBCalcEditProcNUS: TdxDBCalcEdit;
    dxDBCalcEditSummaNUSB: TdxDBCalcEdit;
    dxDBCalcEditSummaNUSV: TdxDBCalcEdit;
    dxDBCalcEditProcNUZ: TdxDBCalcEdit;
    dxDBCalcEditSummaNUZB: TdxDBCalcEdit;
    dxDBCalcEditSUmmaNUZV: TdxDBCalcEdit;
    dxDBCalcProcNZasl: TdxDBCalcEdit;
    dxDBCalcEditSUmmaNZalB: TdxDBCalcEdit;
    dxDBCalcEditSummaNZaslV: TdxDBCalcEdit;
    Label9: TLabel;
    Label10: TLabel;
    dxDBCalcEditProcNPSTAG: TdxDBCalcEdit;
    dxDBCalcEditSummaNPStagB: TdxDBCalcEdit;
    dxDBCalcEditNPStagV: TdxDBCalcEdit;
    dxDBCalcEditOkladRazr: TdxDBCalcEdit;
    dxDBCalcEditOkaldB: TdxDBCalcEdit;
    dxDBCalcEditOkladV: TdxDBCalcEdit;
    dxDBSpinEditRazr: TdxDBSpinEdit;
    Label11: TLabel;
    Label12: TLabel;
    dxDBCalcEditSummaPovBud: TdxDBCalcEdit;
    dxDBCalcEditSummaPovVne: TdxDBCalcEdit;
    dxDBCalcEditProcNadbZawKaf: TdxDBCalcEdit;
    dxDBCalcEditSummaNadbZawKafBud: TdxDBCalcEdit;
    dxDBCalcEditSummaNadbZawKafVne: TdxDBCalcEdit;
    ComboBoxOnOtherStawka: TComboBox;
    Label14: TLabel;
    dxDBCheckEditIsZawKaf: TdxDBCheckEdit;
    BitBtnSave: TBitBtn;
    BitBtn1: TBitBtn;
    dxDBEditDolgCalcName: TdxDBEdit;
    dxDBCheckEdit1: TdxDBCheckEdit;
    BitBtn2: TBitBtn;
    PageControl1: TPageControl;
    tsTabSht: TTabSheet;
    tsTabText: TTabSheet;
    dxDBMemo: TdxDBMemo;
    dxDBCheckEdit2: TdxDBCheckEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    dxDBCheckEdit3: TdxDBCheckEdit;
    TabSheet1: TTabSheet;
    cxDBCheckBoxIsDekan: TcxDBCheckBox;
    cxDBCheckBoxIsZamDekana: TcxDBCheckBox;
    cxDBCalcEditProcZamDec: TcxDBCalcEdit;
    cxDBCalcEditBud: TcxDBCalcEdit;
    cxDBCalcEditVne: TcxDBCalcEdit;
    cxDBCalcEditTot: TcxDBCalcEdit;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    btCalc: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxDBLookupEdit1Change(Sender: TObject);
    procedure dxDBButtonEditTabnoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure dxDBCheckEditIsZawKafChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure btCalcClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetUpNadbZawKaf(Val:integer);
    function  ReplQto2Q(S:WideString):WideString;

  public
    { Public declarations }
  end;

var
  FormShtRaspRecUpd: TFormShtRaspRecUpd;

implementation
 uses UPODataModule,UFormUnivBrowse, DB,DateUtils, Math,UFibModule;

{$R *.dfm}

procedure TFormShtRaspRecUpd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//     Action:=caFree;
(*
     if dmPO.pFIBdsOrderRec.Active=True then
        dmPO.pFIBdsOrderRec.Active:=False;
     if dmPO.pFIBdsOrderRec.Transaction.Active then
        dmPO.pFIBdsOrderRec.Transaction.Commit;
     if dmPO.pFIBdsOrderRec.UpdateTransaction.Active then
        dmPO.pFIBdsOrderRec.UpdateTransaction.Commit;
*)
end;

procedure TFormShtRaspRecUpd.dxDBLookupEdit1Change(Sender: TObject);
begin
     dmPO.pFIBdsShtatRaspPedRecFIO.Value:=dmPO.pFIBdsKadryFIO.Value;
end;

procedure TFormShtRaspRecUpd.dxDBButtonEditTabnoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
  var FUB:TFormUnivBrowse;
  SL:TStringList;
begin
      FUB:=TFormUnivBrowse.Make(nil,dmPO.dsKadry,'ShifrId','Укажите работника',ChoiceRecord,cmManualClose);
      SL:=TStringList.Create;
      SL.Add('TABNO');
      SL.Add('FIO');
      FUB.SetVisibleFieldList(SL);
      SL.Free;
      dmPO.pFIBdsKadry.Locate('Tabno',dmPO.pFIBdsShtatRaspPedRecTabno.Value,[loCaseInsensitive]);
      if FUB.ShowModal=mrOK then
         begin
            //  dmPO.pFIBdsShtatRaspPedRec.Edit;
              dmPO.pFIBdsShtatRaspPedRecFIO.Value      := dmPO.pFIBdsKadryFIO.Value;
              dmPO.pFIBdsShtatRaspPedRecTabno.Value    := dmPO.pFIBdsKadryTabno.Value;
              dmPO.pFIBdsShtatRaspPedRecSHIFRIDK.Value := dmPO.pFIBdsKadryShifrId.Value;
         //     dmPO.pFIBdsShtatRaspPedRec .Value := dmPO.pFIBdsKadryShifrId.Value;
            //  dmPO.pFIBdsShtatRaspPedRec.Post;
              dmPO.pFIBdsKadry.Close;
              dmPO.pFIBdsKadry.Transaction.Commit;
         end;
      FUB.Free;
      Refresh;

end;

procedure TFormShtRaspRecUpd.FormCreate(Sender: TObject);
 var val:Integer;
     i:integer;
begin
     if dmPO.pFIBdsOrderRec.Active=True then
        dmPO.pFIBdsOrderRec.Active:=False;
     if dmPO.pFIBdsOrderRec.Transaction.Active then
        dmPO.pFIBdsOrderRec.Transaction.Commit;
     if dmPO.pFIBdsOrderRec.UpdateTransaction.Active then
        dmPO.pFIBdsOrderRec.UpdateTransaction.Commit;
     dmPO.pFIBdsOrderRec.Transaction.StartTransaction;
     dmPO.pFIBdsOrderRec.Active:=True;
     dmPO.pFIBdsOrderRec.Refresh;
     if dmPO.pFIBdsShtatRaspPedRecISDOCONOTHERSTAWKA.Value=1 then
        ComboBoxOnOtherStawka.ItemIndex:=1
     else
     if dmPO.pFIBdsShtatRaspPedRecISDOCONOTHERSTAWKA.Value=2 then
        ComboBoxOnOtherStawka.ItemIndex:=2
     else
        ComboBoxOnOtherStawka.ItemIndex:=0;
     if dmPO.pFIBdsShtatRaspPedRecISZawKAf.Value=1 then val:=1
     else val:=0;
     SetUpNadbZawKaf(val);

end;

procedure TFormShtRaspRecUpd.SetUpNadbZawKaf(Val:integer);
 begin
     if Val<>1 then
        begin
             dxDBCalcEditSummaNadbZawKafBud.Enabled:=False;
             dxDBCalcEditSummaNadbZawKafBud.Hide;
             dxDBCalcEditSummaNadbZawKafVne.Enabled:=False;
             dxDBCalcEditSummaNadbZawKafVne.Hide;
             dxDBCalcEditProcNadbZawKaf.Enabled:=False;
             dxDBCalcEditProcNadbZawKaf.Hide;
        end
     else
        begin
             dxDBCalcEditSummaNadbZawKafBud.Enabled:=true;
             dxDBCalcEditSummaNadbZawKafBud.Show;
             dxDBCalcEditSummaNadbZawKafVne.Enabled:=true;
             dxDBCalcEditSummaNadbZawKafVne.Show;
             dxDBCalcEditProcNadbZawKaf.Enabled:=true;
             dxDBCalcEditProcNadbZawKaf.Show;
        end
 end;

procedure TFormShtRaspRecUpd.dxDBCheckEditIsZawKafChange(Sender: TObject);
var val:Integer;
begin
     val:=0;
     if dxDBCheckEditIsZawKaf.Checked then val:=1;
     SetUpNadbZawKaf(Val);
end;

procedure TFormShtRaspRecUpd.FormShow(Sender: TObject);
var val:Integer;
begin
     if dmPO.pFIBdsShtatraspPedRec.State=dsInsert then
        begin
             dxDBButtonEditTabno.Enabled:=True;
             dxDBEditFIO.Enabled:=True;
        end;

     if dmPO.pFIBdsShtatRaspPedRecISDOCONOTHERSTAWKA.Value=1 then
        ComboBoxOnOtherStawka.ItemIndex:=1
     else
     if dmPO.pFIBdsShtatRaspPedRecISDOCONOTHERSTAWKA.Value=2 then
        ComboBoxOnOtherStawka.ItemIndex:=2
     else
        ComboBoxOnOtherStawka.ItemIndex:=0;
     if dmPO.pFIBdsShtatRaspPedRecISZawKAf.Value=1 then val:=1
     else val:=0;
     SetUpNadbZawKaf(val);

end;

procedure TFormShtRaspRecUpd.BitBtnSaveClick(Sender: TObject);
begin
  //   if dmPO.pFIBdsShtatRaspPedRec.State<>dsEdit then
  //      dmPO.pFIBdsShtatRaspPedRec.Edit;
     if dmPO.pFIBdsShtatRaspPedRec.State=dsInsert then
        dmPO.pFIBdsShtatRaspPedRecSHIFRIDOWN.Value:=dmPO.pFIBdsShtatRasPedSHIFRID.Value;
     if ComboBoxOnOtherStawka.ItemIndex=2 then
        dmPO.pFIBdsShtatRaspPedRecISDOCONOTHERSTAWKA.Value:=2
     else
     if ComboBoxOnOtherStawka.ItemIndex=1 then
        dmPO.pFIBdsShtatRaspPedRecISDOCONOTHERSTAWKA.Value:=1
     else
        dmPO.pFIBdsShtatRaspPedRecISDOCONOTHERSTAWKA.Value:=0;
     ModalResult:=mrOk;
   //  Close;
   //  dmPO.pFIBdsShtatRaspPedRec.Post;

end;

procedure TFormShtRaspRecUpd.BitBtn2Click(Sender: TObject);
var RetVal:Boolean;
    FUB:TFormUnivBrowse;
    ShifrPod,k:Integer;
    ShifrIdRec:Integer;
    SQLStmnt:string;
    State:TdataSetState;
begin
  //   State:=dmPO.pFIBdsShtatRaspPedRec.State ;
     FUB:=TFormUnivBrowse.Make(nil,dmPO.dsPodr,'ShifrPod','Укажите подразделение',ChoiceRecord,cmManualClose);
     if FUB.ShowModal=mrOk then
        begin
             ShifrPod:=dmPO.pFIBdsPodrSHIFRPOD.Value;
             FUB.Free;
        end
     else
        begin
             FUB.Free;
             Exit;
        end;
     State:=dmPO.pFIBdsShtatRaspPedRec.State ;
     ShifrIdRec:=dmPO.pFIBdsShtatRaspPedRecSHIFRID.Value;
     if ShifrIdRec<1 then Exit;
     if ShifrPod<1   then Exit;
   //  State:=dmPO.pFIBdsShtatRaspPedRec.State ;
     SQLStmnt:='select first 1 k from PR_K_SHTRMOVEPODRREC('+IntToStr(ShifrIDRec)+','+IntToStr(ShifrPod)+')';
     dmPO.pFIBQueryW.SQL.Clear;
     dmPO.pFIBQueryW.SQL.Add(SQLStmnt);
     dmPO.pFIBQueryW.Transaction.StartTransaction;
     dmPO.pFIBQueryW.ExecQuery;
     k:=dmPO.pFIBQueryW.Fields[0].AsInteger;
     if k>0 then
        begin
             ShowMessage('Запись перенесена')
        end
     else
        ShowMessage('Ошибка переноса записи');
     dmPO.pFIBQueryW.Close;
     dmPO.pFIBQueryW.Transaction.Commit;
   //  State:=dmPO.pFIBdsShtatRaspPedRec.State ;
     dmPO.pFIBdsShtatRaspPedRec.Refresh;
     dmPO.pFIBdsShtatRaspPedRec.Close;
     dmPO.pFIBdsShtatRaspPedRec.Open;
     ModalResult:=mrCancel;

end;

procedure TFormShtRaspRecUpd.BitBtn3Click(Sender: TObject);
var RetVal:Boolean;
    Fixed:Integer;
    ShifrIdRec:Integer;
    SQLStmnt:string;
    Text:WideString;
begin
     ShifrIdRec:=dmPO.pFIBdsOrderRecSHIFRID.Value;
     if ShifrIdRec<1 then Exit;
     Fixed:=dmPO.pFIBdsOrderRecFixed.Value;
     Text:=dmPO.pFIBdsOrderRecText.Value;
     Text:=ReplQto2Q(Text);
     Text:=Trim(Text);
     SQLStmnt:='update tb_k_orderrectext set text='''+text+''', fixed='+IntToStr(Fixed)+' where shifrid='+IntToStr(ShifrIdRec);
     dmPO.pFIBQueryW.SQL.Clear;
     dmPO.pFIBQueryW.SQL.Add(SQLStmnt);
     dmPO.pFIBQueryW.Transaction.StartTransaction;
     dmPO.pFIBQueryW.ExecQuery;
  //   ShowMessage('Запись перенесена');
     dmPO.pFIBQueryW.Close;
     dmPO.pFIBQueryW.Transaction.Commit;
     dmPO.pFIBdsOrderRec.Refresh;
end;

Function  TFormShtRaspRecUpd.ReplQto2Q(S:WideString):WideString;
// заменяет кавычку на две
 var RetVal:WideString;
     i,k:integer;
 begin
      RetVal:=S;
      if Length(S)>0 then
         begin
               RetVal:='';
               k:=Length(S);
               for i:=1 to k do
                   begin
                        RetVal:=RetVal+s[i];
                        if s[i]='''' then RetVal:=RetVal+'''';
                   end;
         end;
      ReplQto2Q:=RetVal;
 end;


procedure TFormShtRaspRecUpd.BitBtn4Click(Sender: TObject);
 var ShifrIdRec:Integer;
     Fixed:Integer;
     Text,textNew:WideString;
     DateS:String;
     DateD:TDateTime;
     SQLStmnt:string;
     State: TDataSetState;
     v:Variant;
begin
     if Application.MessageBox('Создать новую фразу?'+^M+'(Старая будет утеряна , если была)','Предупреждение',MB_YESNOCANCEL)<>IDYES then
        Exit;
     ShifrIdRec := dmPO.pFIBdsShtatRaspPedRecSHIFRID.Value;
     DateD      := dmPO.pFIBdsShtatRasPedDATEFR.Value;
     DateS:=IntToStr(YearOf(DateD))+'-'+IntToStr(MonthOf(DateD))+'-01';
     if ShifrIdRec<1 then Exit;
     State:=dmPO.pFIBdsOrderRec.State;
     if ((State=dsEdit) or (State=dsInsert)) then
         begin
              if (State=dsEdit) then
                 begin
                      dmPO.pFIBdsOrderRec.Post;
                      if dmPO.pFIBdsOrderRec.UpdateTransaction.Active then
                         dmPO.pFIBdsOrderRec.UpdateTransaction.Commit;
                 end
              else
                 begin
                      dmPO.pFIBdsOrderRec.Cancel;
                      if dmPO.pFIBdsOrderRec.UpdateTransaction.Active then
                         dmPO.pFIBdsOrderRec.UpdateTransaction.RollBack;
                 end;

         end;
     Fixed:=dmPO.pFIBdsOrderRecFixed.Value;
     Text:=dmPO.pFIBdsOrderRecText.Value;
     Text:=ReplQto2Q(Text);
     Text:=Trim(Text);
     SQLStmnt:='select k from PR_K_CREATEONERECORDFORORDER('+IntToStr(ShifrIdRec)+')';
//     dmPO.pFIBQueryW.SQL.Clear;
//     dmPO.pFIBQueryW.SQL.Add(SQLStmnt);
//     dmPO.pFIBQueryW.Transaction.StartTransaction;
//     dmPO.pFIBQueryW.ExecQuery;
    // dmPO.pFIBdsOrderRecTEXT.Value:=dmPO.pFIBQueryW.Fields[0].AsString;
//     dmPO.pFIBdsOrderRec.Refresh;
    // ShowMessage('Запись перенесена');
//     dmPO.pFIBQueryW.Close;
//     dmPO.pFIBQueryW.Transaction.Commit;
     v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);

     dmPO.pFIBdsOrderRec.Close;
     dmPO.pFIBdsOrderRec.Open;

     textNew:=dmPO.pFIBdsOrderRecTEXT.Value;
     dxDBMemo.Update;
     Application.ProcessMessages;
     if (State=dsEdit) then
        dmPO.pFIBdsOrderRec.Edit
      else if (State=dsInsert) then
        dmPO.pFIBdsOrderRec.Insert;

end;

procedure TFormShtRaspRecUpd.btCalcClick(Sender: TObject);
var tmpState : TDataSetState;
begin
     tmpState:=dmPO.pFIBdsShtatRaspPedRec.State;
     if dmPO.pFIBdsShtatRaspPedRec.State<>dsEdit then
        dmPO.pFIBdsShtatRaspPedRec.Edit;
     if dmPO.pFIBdsShtatRaspPedRecKOEFBUD.IsNull then
        begin
             dmPO.pFIBdsShtatRaspPedRecOKLADB.Value       := 0.00;
             dmPO.pFIBdsShtatRaspPedRecSUMMANUSB.Value    := 0.00;
             dmPO.pFIBdsShtatRaspPedRecSUMMANUZB.Value    := 0.00;
             dmPO.pFIBdsShtatRaspPedRecSUMMANZASLB.Value  := 0.00;
             dmPO.pFIBdsShtatRaspPedRecSUMMANPSTAGB.Value := 0.00;
        end
     else
        begin
             dmPO.pFIBdsShtatRaspPedRecOKLADB.Value := roundTo(dmPO.pFIBdsShtatRaspPedRecOKLADRAZR.Value *
                                                       dmPO.pFIBdsShtatRaspPedRecKOEFBUD.Value
                                                      ,-2);
             dmPO.pFIBdsShtatRaspPedRecSUMMANUSB.Value := roundTo(dmPO.pFIBdsShtatRaspPedRecOKLADB.Value *
                                                          dmPO.pFIBdsShtatRaspPedRecPROCNUS.Value / 100.00
                                                      ,-2);
             dmPO.pFIBdsShtatRaspPedRecSUMMANUZB.Value := roundTo(dmPO.pFIBdsShtatRaspPedRecOKLADB.Value *
                                                          dmPO.pFIBdsShtatRaspPedRecPROCNUZ.Value / 100.00
                                                      ,-2);
             dmPO.pFIBdsShtatRaspPedRecSUMMANZASLB.Value := roundTo(dmPO.pFIBdsShtatRaspPedRecOKLADB.Value *
                                                          dmPO.pFIBdsShtatRaspPedRecPROCNZASL.Value / 100.00
                                                      ,-2);
             dmPO.pFIBdsShtatRaspPedRecSUMMANPSTAGB.Value := roundTo(dmPO.pFIBdsShtatRaspPedRecOKLADB.Value *
                                                          dmPO.pFIBdsShtatRaspPedRecPROCNPSTAG.Value / 100.00
                                                      ,-2);
        end;
     if dmPO.pFIBdsShtatRaspPedRecKOEFVNE.IsNull then
        begin
             dmPO.pFIBdsShtatRaspPedRecOKLADV.Value       := 0.00;
             dmPO.pFIBdsShtatRaspPedRecSUMMANUSV.Value    := 0.00;
             dmPO.pFIBdsShtatRaspPedRecSUMMANUZV.Value    := 0.00;
             dmPO.pFIBdsShtatRaspPedRecSUMMANZASLV.Value  := 0.00;
             dmPO.pFIBdsShtatRaspPedRecSUMMANPSTAGV.Value := 0.00;
        end
     else
        begin
             dmPO.pFIBdsShtatRaspPedRecOKLADV.Value := roundTo(dmPO.pFIBdsShtatRaspPedRecOKLADRAZR.Value *
                                                       dmPO.pFIBdsShtatRaspPedRecKOEFVNE.value
                                                      ,-2);
             dmPO.pFIBdsShtatRaspPedRecSUMMANUSV.Value := roundTo(dmPO.pFIBdsShtatRaspPedRecOKLADV.Value *
                                                          dmPO.pFIBdsShtatRaspPedRecPROCNUS.Value / 100.00
                                                      ,-2);
             dmPO.pFIBdsShtatRaspPedRecSUMMANUZV.Value := roundTo(dmPO.pFIBdsShtatRaspPedRecOKLADV.Value *
                                                          dmPO.pFIBdsShtatRaspPedRecPROCNUZ.Value / 100.00
                                                      ,-2);
             dmPO.pFIBdsShtatRaspPedRecSUMMANZASLV.Value := roundTo(dmPO.pFIBdsShtatRaspPedRecOKLADV.Value *
                                                          dmPO.pFIBdsShtatRaspPedRecPROCNZASL.Value / 100.00
                                                      ,-2);
             dmPO.pFIBdsShtatRaspPedRecSUMMANPSTAGV.Value := roundTo(dmPO.pFIBdsShtatRaspPedRecOKLADV.Value *
                                                          dmPO.pFIBdsShtatRaspPedRecPROCNPSTAG.Value / 100.00
                                                      ,-2);
        end;
     dmPO.pFIBdsShtatRaspPedRec.Post;
     if tmpState<>dmPO.pFIBdsShtatRaspPedRec.State then
        begin
             if tmpState=dsEdit then
                dmPO.pFIBdsShtatRaspPedRec.Edit
             else
             if tmpState=dsInsert then
                dmPO.pFIBdsShtatRaspPedRec.Insert;
        end;
      Application.ProcessMessages;


end;

end.
