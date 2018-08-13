unit uFormTmpOtpA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, FIBDataSet, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  pFIBDataSet, dxDBTLCl, dxGrClms, StdCtrls, Buttons, FIBSQLMonitor,
  FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, Menus;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function Execute: boolean;
    procedure ShowTable;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
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

end.
