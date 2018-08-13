unit UFormSwodyCmp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  ComCtrls, Menus;

type
  TFormSwodyCmp = class(TForm)
    pFIBdsSwodyCmp: TpFIBDataSet;
    dsSwodyCmp: TDataSource;
    pFIBTrSwodyRead: TpFIBTransaction;
    pFIBTrSwodyWrite: TpFIBTransaction;
    pFIBdsSwodyCmpSHIFRID: TFIBIntegerField;
    pFIBdsSwodyCmpNAME: TFIBStringField;
    pFIBdsSwodyCmpYEARVY: TFIBIntegerField;
    pFIBdsSwodyCmpMONTHVY: TFIBIntegerField;
    pFIBdsSwodyCmpSHIFRWRK: TFIBIntegerField;
    pFIBdsSwodyCmpDATEWRK: TFIBDateTimeField;
    pFIBdsSwodyCmpNAMEDET: TFIBStringField;
    dxDBGridSwody: TdxDBGrid;
    dxDBGridSwodySHIFRID: TdxDBGridMaskColumn;
    dxDBGridSwodyNAME: TdxDBGridMaskColumn;
    dxDBGridSwodyYEARVY: TdxDBGridMaskColumn;
    dxDBGridSwodyMONTHVY: TdxDBGridMaskColumn;
    dxDBGridSwodySHIFRWRK: TdxDBGridMaskColumn;
    dxDBGridSwodyDATEWRK: TdxDBGridDateColumn;
    dxDBGridSwodyNAMEDET: TdxDBGridMemoColumn;
    DateTimePicker: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    pFIBdsSwodyCmpSEL: TFIBSmallIntField;
    dxDBGridSwodyCheck: TdxDBGridCheckColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePickerChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure dxDBGridSwodyDblClick(Sender: TObject);
  private
    y:Integer;
    m:integer;
    MarkCount : Integer;
    procedure ExecuteComparison;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSwodyCmp: TFormSwodyCmp;

implementation
  uses scrdef,ScrUtil,uFormSwodyCmpRes,UFibModule;

{$R *.dfm}

procedure TFormSwodyCmp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBdsSwodyCmp.Active then
        pFIBdsSwodyCmp.Close;
     if pFIBdsSwodyCmp.Transaction.Active then
        pFIBdsSwodyCmp.Transaction.Commit;
     if pFIBdsSwodyCmp.UpdateTransaction.Active then
        pFIBdsSwodyCmp.UpdateTransaction.Commit;

     Action:=caFree;
end;

procedure TFormSwodyCmp.FormCreate(Sender: TObject);
var SQLStmnt:string;
begin
     if pFIBdsSwodyCmp.Active then
        pFIBdsSwodyCmp.Close;
     if pFIBdsSwodyCmp.Transaction.Active then
        pFIBdsSwodyCmp.Transaction.Commit;
     if pFIBdsSwodyCmp.UpdateTransaction.Active then
        pFIBdsSwodyCmp.UpdateTransaction.Commit;
     SQLStmnt:='update tb_swody_hat set sel=0';
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     FIB.pFIBQuery.Transaction.StartTransaction;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add(SQLStmnt);
     FIB.pFIBQuery.ExecQuery;
     FIB.pFIBQuery.Close;
     FIB.pFIBQuery.Transaction.Commit;
     pFIBdsSwodyCmp.Transaction.StartTransaction;
     y:=CurrentYear;
     m:=nmes;
     pFIBdsSwodyCmp.Params[0].AsInteger:=y;
     pFIBdsSwodyCmp.Params[1].AsInteger:=m;
     pFIBdsSwodyCmp.Prepare;
     pFIBdsSwodyCmp.Open;
     Caption:='Своды за '+trim(Month[m])+' '+IntToStr(y)+' г.';
     DateTimePicker.Date:=EncodeDate(CURRYEAR,NMES,1);
     MarkCount:=0;
end;

procedure TFormSwodyCmp.DateTimePickerChange(Sender: TObject);
 var y,m,d:Word;
begin
     DecodeDate(DateTimePicker.Date,y,m,d);
     pFIBdsSwodyCmp.Close;
     pFIBdsSwodyCmp.Params[0].AsInteger:=y;
     pFIBdsSwodyCmp.Params[1].AsInteger:=m;
     pFIBdsSwodyCmp.Prepare;
     pFIBdsSwodyCmp.Open;

end;

procedure TFormSwodyCmp.N1Click(Sender: TObject);
begin
     ExecuteComparison;
end;
procedure TFormSwodyCmp.ExecuteComparison;
 var ShifrIdFr,ShifrIdTo : Integer;
     i,j,k,i_count : Integer;
     s : string;
     ist,isc      : Integer;
 begin
      ShifrIdFr:=0;
      ShifrIdTo:=0;
      pFIBdsSwodyCmp.First;
      while not pFIBdsSwodyCmp.Eof do
         begin
              if pFIBdsSwodyCmpSEL.Value=1 then
                 if ShifrIdFr=0 then
                    ShifrIdFr:=pFIBdsSwodyCmpSHIFRID.Value
                 else
                    begin
                          ShifrIdTo:=pFIBdsSwodyCmpSHIFRID.Value;
                          break;
                    end;
              pFIBdsSwodyCmp.Next;
         end;
      if ((ShifrIdFr=0) or (ShifrIdTo=0)) then
         begin
              ShowMessage('Ножно указать два свода: старый - базовый и новый - для сравнения');
              Exit;
         end;
      FormSwodyCmpRes:=TFormSwodyCmpRes.Create(Self,ShifrIdFr,ShifrIdTo);
      FormSwodyCmpRes.ShowModal;
 end;

procedure TFormSwodyCmp.dxDBGridSwodyDblClick(Sender: TObject);
begin
     pFIBdsSwodyCmp.Edit;
     if pFIBdsSwodyCmpSEL.Value<>1 then
        begin
             if MarkCount=2 then
                begin
                     ShowMessage('Можно отметить только две строки');
                     Exit;
                end;
             pFIBdsSwodyCmpSEL.Value:=1;
             Inc(MarkCount);
        end
     else
        begin
             pFIBdsSwodyCmpSEL.Value:=0;
             if MarkCount>0 then
                Dec(MarkCount);
        end;
     pFIBdsSwodyCmp.Post;
     pFIBdsSwodyCmp.Refresh;

end;

end.
