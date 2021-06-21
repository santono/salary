unit uFormTmpOtpA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, FIBDataSet, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  pFIBDataSet, dxDBTLCl, dxGrClms, StdCtrls, Buttons, FIBSQLMonitor,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, Menus, ExtCtrls, DBCtrls;

type
  TFormOtpA = class(TForm)
    pFIBDataSetOtpA: TpFIBDataSet;
    DataSourceOtpA: TDataSource;
    dxDBGridOtpA: TdxDBGrid;
    pFIBDataSetOtpAW_PLACE: TFIBSmallIntField;
    pFIBDataSetOtpANAME: TFIBStringField;
    pFIBDataSetOtpAW_R: TFIBSmallIntField;
    pFIBDataSetOtpAWRN: TFIBStringField;
    pFIBDataSetOtpASHIFRGRU: TFIBSmallIntField;
    pFIBDataSetOtpANAME1: TFIBStringField;
    pFIBDataSetOtpASHIFRKAT: TFIBSmallIntField;
    pFIBDataSetOtpANAME2: TFIBStringField;
    pFIBDataSetOtpASHIFRSTA: TFIBSmallIntField;
    pFIBDataSetOtpANAME3: TFIBStringField;
    pFIBDataSetOtpAMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetOtpAYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetOtpAMONTH_VY: TFIBSmallIntField;
    pFIBDataSetOtpAYEAR_VY: TFIBSmallIntField;
    pFIBDataSetOtpASUMMA: TFIBBCDField;
    pFIBDataSetOtpAVYPL: TFIBSmallIntField;
    pFIBDataSetOtpASEL: TFIBSmallIntField;
    pFIBDataSetOtpAID_CLAR: TFIBIntegerField;
    pFIBDataSetOtpASHIFRIDTMP: TFIBIntegerField;
    dxDBGridOtpAW_PLACE: TdxDBGridMaskColumn;
    dxDBGridOtpANAME: TdxDBGridColumn;
    dxDBGridOtpAW_R: TdxDBGridMaskColumn;
    dxDBGridOtpAWRN: TdxDBGridColumn;
    dxDBGridOtpASHIFRGRU: TdxDBGridMaskColumn;
    dxDBGridOtpANAME1: TdxDBGridColumn;
    dxDBGridOtpASHIFRKAT: TdxDBGridMaskColumn;
    dxDBGridOtpANAME2: TdxDBGridColumn;
    dxDBGridOtpASHIFRSTA: TdxDBGridColumn;
    dxDBGridOtpANAME3: TdxDBGridColumn;
    dxDBGridOtpAMONTH_ZA: TdxDBGridColumn;
    dxDBGridOtpAYEAR_ZA: TdxDBGridColumn;
    dxDBGridOtpAMONTH_VY: TdxDBGridColumn;
    dxDBGridOtpAYEAR_VY: TdxDBGridColumn;
    dxDBGridOtpASUMMA: TdxDBGridColumn;
    dxDBGridOtpAVYPL: TdxDBGridColumn;
    dxDBGridOtpAID_CLAR: TdxDBGridMaskColumn;
    dxDBGridOtpASHIFRIDTMP: TdxDBGridMaskColumn;
    dxDBGridOtpASEL: TdxDBGridCheckColumn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    pFIBQueryMark: TpFIBQuery;
    pFIBTransactionMark: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBTransactionRead: TpFIBTransaction;
    Label1: TLabel;
    LabelSumma: TLabel;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function Execute: boolean;
    procedure ShowTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure pFIBDataSetOtpASELChange(Sender: TField);
    procedure dxDBGridOtpASELChange(Sender: TObject);
    procedure dxDBGridOtpASELToggleClick(Sender: TObject;
      const Text: String; State: TdxCheckBoxState);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
    procedure ShowSumSelected;

  public
    { Public declarations }
       WantedYear  : INTEGER;
       WantedMonth : INTEGER;
  end;

var
  FormOtpA: TFormOtpA;

implementation
USES UFibModule,ScrUtil,USelLists,UFormMakeOtpChoice;
{$R *.dfm}
                
procedure TFormOtpA.FormClose(Sender: TObject; var Action: TCloseAction);
begin


      if pFIBDataSetOtpA.Active then
         pFIBDataSetOtpA.Close;
      if pFIBDataSetOtpA.Transaction.Active then
         pFIBDataSetOtpA.Transaction.CommitRetaining;
      if pFIBDataSetOtpA.UpdateTransaction.Active then
         pFIBDataSetOtpA.UpdateTransaction.Commit;
      Action:=caFree;
end;

procedure TFormOtpA.ShowTable;
begin
      if pFIBDataSetOtpA.Active then
         pFIBDataSetOtpA.Active:=false;
      pFIBDataSetOtpA.Params[0].AsString:=IntToStr(Self.WantedYear);
      pFIBDataSetOtpA.Params[1].AsString:=IntToStr(WantedMonth);
      pFIBDataSetOtpA.Prepare;
      pFIBDataSetOtpA.Open;
      ShowSumSelected;
      Caption:='Расшифровка начислений за '+GetMonthRus(WantedMonth)+' '+IntToStr(WantedYear)+' г.';
end;

function TFormOtpA.Execute: boolean;
begin
  ShowTable;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;


procedure TFormOtpA.BitBtn1Click(Sender: TObject);
begin
     pFIBDataSetOtpA.Post;
     ModalResult:=mrOk;
end;

procedure TFormOtpA.FormCreate(Sender: TObject);
begin
   if not pFIBDataSetOtpA.Transaction.Active then
         pFIBDataSetOtpA.StartTransaction;
      if pFIBDataSetOtpA.Active then
         pFIBDataSetOtpA.Close;
      pFIBDataSetOtpA.Open;

end;





procedure TFormOtpA.BitBtn2Click(Sender: TObject);
begin
     pFIBDataSetOtpA.Next;
     pFIBDataSetOtpA.Prior;
     ModalResult:=mrOk;
end;

procedure TFormOtpA.N1Click(Sender: TObject);
var SQLStmnt:string;
begin
     if Assigned(PodrSelOtpList) then
        PodrSelOtpList.Free;
     if Assigned(KategSelOtpList) then
        KategSelOtpList.Free;
     if Assigned(GruppySelOtpList) then
        GruppySelOtpList.Free;
     PodrSelOtpList:=TItemSelList.Create;
     KategSelOtpList:=TItemSelList.Create;
     GruppySelOtpList:=TItemSelList.Create;
     SQLStmnt:='select w_place,(select first 1 name from podr where shifrpod=w_place) from tmp_otp_add where connid=CURRENT_CONNECTION GROUP by 1,2';
     pFIBQueryMark.SQL.Clear;
     pFIBQueryMark.SQL.ADD(SQLStmnt);
     pFIBQueryMark.Transaction.StartTransaction;
     pFIBQueryMark.ExecQuery;
     while not pFIBQueryMark.Eof do
       begin
            PodrSelOtpList.AddItem(pFIBQueryMark.Fields[0].AsInteger,
                                   pFIBQueryMark.Fields[1].AsString);
            pFIBQueryMark.Next;
       end;
     pFIBQueryMark.Close;
     SQLStmnt:='select shifrkat,(select first 1 name from kateg where shifr=tmp_otp_add.shifrkat) from tmp_otp_add where connid=CURRENT_CONNECTION GROUP by 1,2';
     pFIBQueryMark.SQL.Clear;
     pFIBQueryMark.SQL.ADD(SQLStmnt);
     pFIBQueryMark.Transaction.StartTransaction;
     pFIBQueryMark.ExecQuery;
     while not pFIBQueryMark.Eof do
       begin
            KategSelOtpList.AddItem(pFIBQueryMark.Fields[0].AsInteger,
                                   pFIBQueryMark.Fields[1].AsString);
            pFIBQueryMark.Next;
       end;
     pFIBQueryMark.Close;
     SQLStmnt:='select shifrgru,(select first 1 name from gruppy where shifr=shifrgru) from tmp_otp_add where connid=CURRENT_CONNECTION GROUP by 1,2';
     pFIBQueryMark.SQL.Clear;
     pFIBQueryMark.SQL.ADD(SQLStmnt);
     pFIBQueryMark.Transaction.StartTransaction;
     pFIBQueryMark.ExecQuery;
     while not pFIBQueryMark.Eof do
       begin
            GruppySelOtpList.AddItem(pFIBQueryMark.Fields[0].AsInteger,
                                   pFIBQueryMark.Fields[1].AsString);
            pFIBQueryMark.Next;
       end;
     pFIBQueryMark.Close;
     pFIBQueryMark.Transaction.Commit;

     Application.CreateForm(TFormMakeOtpChoice,FormMakeOtpChoice);
     FormMakeOtpChoice.ShowModal;

     ShowTable;
end;

procedure TFormOtpA.ShowSumSelected;
 var summa:Real;
     SavePlace: TBookmark;
     v,v0:Variant;
     Node:TdxTreeListNode;
   begin
        summa:=0;
        Node:=dxDBGridOtpA.TopNode;
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
//        SavePlace:=pFIBDataSetOtpA.GetBookmark;
//        summa:=0;
//        pFIBDataSetOtpA.First;
//        while not pFIBDataSetOtpA.Eof do
//         begin
//              if pFIBDataSetOtpASEL.Value=1 then
//                 summa:=summa+pFIBDataSetOtpASUMMA.Value;
//              pFIBDataSetOtpA.Next;
//         end;
//        pFIBDataSetOtpA.FreeBookmark(SavePlace);
        LabelSumma.Caption:=FORMAT_S(summa,12);
   end;

procedure TFormOtpA.pFIBDataSetOtpASELChange(Sender: TField);
begin
//    ShowSumSelected;
//     Application.ProcessMessages;
end;

procedure TFormOtpA.dxDBGridOtpASELChange(Sender: TObject);
begin
//     Application.ProcessMessages;
//     dxDBGridOtpA.Refresh;
//     ShowSumSelected;
//     Application.ProcessMessages;

end;

procedure TFormOtpA.dxDBGridOtpASELToggleClick(Sender: TObject;
  const Text: String; State: TdxCheckBoxState);
var i:Integer;
begin
     dxDBGridOtpA.Refresh;
//     if State=cbsChecked then
//        dxDBGridOtpA.FocusedNode.Values[0]:=1
//     else
//        dxDBGridOtpA.FocusedNode.Values[0]:=0;
//     if pFIBDataSetOtpA.State=dsEdit then
//        pFIBDataSetOtpA.Post;
//     DBNavigator1Click(Sender,nbPost);
     ShowSumSelected;
     Application.ProcessMessages;

end;

procedure TFormOtpA.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
     if Button=nbPost then
        begin
             ShowSumSelected;
             Application.ProcessMessages;
        end;

end;

end.
