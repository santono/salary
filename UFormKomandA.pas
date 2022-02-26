{$WARNINGS OFF}
{$HINTS OFF}
unit UFormKomandA;
                                 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, dxCntner, StdCtrls, Buttons, FIBDatabase,
  pFIBDatabase, ExtCtrls, DBCtrls;

type
  TFormKomandA = class(TForm)
    DataSourceKomandA: TDataSource;
    pFIBDataSetKomandA: TpFIBDataSet;
    dxDBGridKomandA: TdxDBGrid;
    pFIBDataSetKomandAW_PLACE: TFIBSmallIntField;
    pFIBDataSetKomandANAME: TFIBStringField;
    pFIBDataSetKomandAW_R: TFIBSmallIntField;
    pFIBDataSetKomandASHIFRGRU: TFIBSmallIntField;
    pFIBDataSetKomandANAME1: TFIBStringField;
    pFIBDataSetKomandASHIFRKAT: TFIBSmallIntField;
    pFIBDataSetKomandANAME2: TFIBStringField;
    pFIBDataSetKomandASHIFRSTA: TFIBSmallIntField;
    pFIBDataSetKomandANAME3: TFIBStringField;
    pFIBDataSetKomandAMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetKomandAYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetKomandAMONTH_VY: TFIBSmallIntField;
    pFIBDataSetKomandAYEAR_VY: TFIBSmallIntField;
    pFIBDataSetKomandASUMMA: TFIBBCDField;
    pFIBDataSetKomandAVYPL: TFIBSmallIntField;
    pFIBDataSetKomandAMARKED: TFIBSmallIntField;
    pFIBDataSetKomandAID_CLAR: TFIBIntegerField;
    pFIBDataSetKomandASHIFRIDTMP: TFIBIntegerField;
    pFIBDataSetKomandAWRN: TFIBStringField;
    dxDBGridKomandANAME: TdxDBGridMaskColumn;
    dxDBGridKomandANAME1: TdxDBGridMaskColumn;
    dxDBGridKomandANAME2: TdxDBGridMaskColumn;
    dxDBGridKomandASHIFRSTA: TdxDBGridMaskColumn;
    dxDBGridKomandANAMESta: TdxDBGridMaskColumn;
    dxDBGridKomandAMONTH_VY: TdxDBGridMaskColumn;
    dxDBGridKomandAYEAR_VY: TdxDBGridMaskColumn;
    dxDBGridKomandASUMMA: TdxDBGridCurrencyColumn;
    dxDBGridKomandAVYPL: TdxDBGridMaskColumn;
    dxDBGridKomandASHIFRIDTMP: TdxDBGridMaskColumn;
    dxDBGridKomandAWRN: TdxDBGridMaskColumn;
    dxDBGridKomandAMARKED: TdxDBGridCheckColumn;
    BitBtn1: TBitBtn;
    dxDBGridKomandAMONTH_ZA: TdxDBGridMaskColumn;
    dxDBGridKomandAYEAR_ZA: TdxDBGridMaskColumn;
    BitBtn2: TBitBtn;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    DBNavigator1: TDBNavigator;
    LabelSumma: TLabel;
    LabelSummaSel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function Execute: boolean;
    procedure ShowTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSetKomandAMARKEDChange(Sender: TField);
    procedure dxDBGridKomandAMARKEDToggleClick(Sender: TObject;
      const Text: String; State: TdxCheckBoxState);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dxDBGridKomandAMARKEDChange(Sender: TObject);
  private
    { Private declarations }
    procedure ShowSumSelected;
  public
    { Public declarations }
    WantedYear     : INTEGER;
    WantedMonth    : INTEGER;
    WantedMode_V_Z : integer;
  end;

var
  FormKomandA: TFormKomandA;

implementation
USES UFibModule,ScrUtil,scrdef;

{$R *.dfm}

procedure TFormKomandA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetKomandA.Active then
         pFIBDataSetKomandA.Close;
      if pFIBDataSetKomandA.Transaction.Active then
         pFIBDataSetKomandA.Transaction.Commit;
      if pFIBDataSetKomandA.UpdateTransaction.Active then
         pFIBDataSetKomandA.UpdateTransaction.Commit;

      Action:=caFree;
end;

procedure TFormKomandA.ShowTable;
var ds:string;
begin
      if pFIBDataSetKomandA.Active then
         pFIBDataSetKomandA.Active:=false;
      pFIBDataSetKomandA.Params[0].AsString:=IntToStr(WantedMode_V_Z);
      pFIBDataSetKomandA.Params[1].AsString:=IntToStr(Self.WantedYear);
      pFIBDataSetKomandA.Params[2].AsString:=IntToStr(WantedMonth);
      pFIBDataSetKomandA.Prepare;
      pFIBDataSetKomandA.Open;
     ShowSumSelected;   
      if isSVDN then
         begin
              ds:=getMonthUkr(wantedMonth)+' '+IntToStr(wantedYear);
              Caption:='Перелiк нарахуваннь для вiдряджень '+ds;
         end
      else
         begin
              ds:=getMonthRus(wantedMonth)+' '+IntToStr(wantedYear);
              Caption:='Список начислений для командировочных '+ds;
         end

end;

function TFormKomandA.Execute: boolean;
begin
  ShowTable;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;


procedure TFormKomandA.BitBtn1Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TFormKomandA.BitBtn2Click(Sender: TObject);
begin
     BitBtn2.Enabled:=false;
     if pFIBDataSetKomandA.State=dsEdit then
        pFIBDataSetKomandA.Post;
     Self.Close;   
end;

procedure TFormKomandA.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetKomandA.Transaction.Active then
        pFIBDataSetKomandA.Transaction.StartTransaction;
        
end;

procedure TFormKomandA.pFIBDataSetKomandAMARKEDChange(Sender: TField);
//var ds:string;
begin
{
     if pFIBDataSetKomandA.State=dsEdit then
        begin
             if not pFIBDataSetKomandA.UpdateTransaction.Active then
                pFIBDataSetKomandA.UpdateTransaction.StartTransaction;
             pFIBDataSetKomandA.Post;
             if pFIBDataSetKomandA.UpdateTransaction.Active then
                pFIBDataSetKomandA.UpdateTransaction.Commit;
             pFIBDataSetKomandA.Edit;
        end;
}
{
      if isSVDN then
         begin
              ds:=getMonthUkr(wantedMonth)+' '+IntToStr(wantedYear);
              Caption:='Перелiк нарахуваннь для вiдряджень '+ds;
         end
      else
         begin
              ds:=getMonthRus(wantedMonth)+' '+IntToStr(wantedYear);
              Caption:='Список начислений для командировочных '+ds;
         end
}
end;

procedure TFormKomandA.ShowSumSelected;
 var summa:Real;
     SavePlace: TBookmark;
     v,v0:Variant;
     Node:TdxTreeListNode;
   begin
        summa:=0;
//        TdxDBGridCheckColumn(dxDBGridKomandA.Columns[0])
        Node:=dxDBGridKomandA.TopNode;
        while Node<>nil do
          begin
               v0:=Node.Values[0];
               if VarIsNumeric(v0) then
               if v0=1 then
                  begin
                       v:=Node.Values[3];
                       if VarIsNumeric(v) then
                          summa:=summa+v;
                  end;
               node:=Node.GetNext;
          end;

        LabelSummaSel.Caption:=FORMAT_S(summa,12);
        Application.ProcessMessages;
   end;


procedure TFormKomandA.dxDBGridKomandAMARKEDToggleClick(Sender: TObject;
  const Text: String; State: TdxCheckBoxState);
var bVal:boolean;
    dbVal:Integer;
    dsState:TDataSetState;
    shifrId : Integer;
begin
     ShowSumSelected;
     Application.ProcessMessages;
//     dbVal:=pFIBDataSetKomandAMARKED.Value;
//     shifrId:=pFIBDataSetKomandASHIFRIDTMP.Value;
//     if State=cbsChecked then
//        bval:=True
//     else
//        bVal:=false;
//     dsState:=pFIBDataSetKomandA.State;
//     if dsState=dsEdit then
//        begin
//             if bVal then
//                pFIBDataSetKomandAMARKED.Value:=1
//             else
//                pFIBDataSetKomandAMARKED.Value:=0;
//             pFIBDataSetKomandA.Post;
//             pFIBDataSetKomandA.Edit;
//        end;


//     DBNavigator1.BtnClick(nbPost);
end;

procedure TFormKomandA.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
//     if Button=nbPost then
//        begin
//             ShowSumSelected;
//        end;

end;

procedure TFormKomandA.dxDBGridKomandAMARKEDChange(Sender: TObject);
var bVal:boolean;
    dbVal:Integer;
    dsState:TDataSetState;
    v,v0:Variant;
    vInt:Integer;
    Node:TdxTreeListNode;
begin
 //    ShowSumSelected;
 //    Application.ProcessMessages;
     dbVal:=pFIBDataSetKomandAMARKED.Value;
 //    if State=cbsChecked then
 //       bval:=True
 //    else
 //       bVal:=false;

//     DBNavigator1.BtnClick(nbPost);
        Node:=dxDBGridKomandA.FocusedNode;
        v0:=Node.Values[0];
        if VarIsNumeric(v0) then
           begin
               vInt:=v0;
           end;
     dsState:=pFIBDataSetKomandA.State;

end;


end.
