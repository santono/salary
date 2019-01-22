unit UFormAwansSwod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls, ImgList, ToolWin;

type
  TFormAwansSwod = class(TForm)
    cdsoAwans: TDataSource;
    cdsAwans: TClientDataSet;
    qAwans: TpFIBQuery;
    trRead: TpFIBTransaction;
    dxDBGridSwodAwans: TdxDBGrid;
    cdsAwansshifrsta: TIntegerField;
    cdsAwansshifrgru: TIntegerField;
    cdsAwanssumma: TFloatField;
    cdsAwansnamegru: TStringField;
    dxDBGridSwodAwansshifrsta: TdxDBGridMaskColumn;
    dxDBGridSwodAwansshifrgru: TdxDBGridMaskColumn;
    dxDBGridSwodAwanssumma: TdxDBGridMaskColumn;
    dxDBGridSwodAwansnamegru: TdxDBGridMaskColumn;
    cdsAwansid: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    wantedOwnerId : integer;
  public
    constructor Init(AOwner:TComponent;wantedId:integer);
    procedure createSwod;
    { Public declarations }
  end;

var
  FormAwansSwod: TFormAwansSwod;

implementation
  uses uSQLUnit,scrutil, UFormAwansVerification;
{$R *.dfm}
  type pRec=^tRec;
       tRec=record
             shifrsta : integer;
             shifrgru : integer;
             summa    : real;
            end;
  var list:TList;
constructor TFormAwansSwod.Init(AOwner:TComponent;wantedId:integer);
 begin
      Self.Create(AOwner);
      wantedOwnerId:=wantedId;
//      CreateSwod;
 end;
procedure TFormAwansSwod.createSwod;
 var SQLStmnt:string;
     rec:pRec;
     i:integer;
 begin
      list:=TList.Create;
      SQLStmnt:='select a.shifrgru,a.shifrsta,sum(a.summa) from tb_saved_awans_det a';
      SQLStmnt:=SQLStmnt+' where a.shifridowner='+intToStr(wantedOwnerId);
      SQLStmnt:=SQLStmnt+' group by 1,2';
      qAwans.SQL.Clear;
      qAwans.SQL.Add(SQLStmnt);
      qAwans.Transaction.StartTransaction;
      qAwans.ExecQuery;
      while (not qAwans.Eof) do
        begin
             rec := new(pRec);
             rec^.shifrgru := qAwans.Fields[0].Value;
             rec^.shifrsta := qAwans.Fields[1].Value;
             rec^.summa    := qAwans.Fields[2].Value;
             list.Add(rec);
             qAwans.Next;
        end;
      qAwans.Close;
      qAwans.Transaction.commit;
      cdsAwans.Open;
      if list.count>0 then
         for i:=1 to list.count do
             begin
                  cdsAwans.Append;
                  cdsAwansshifrsta.value:=pRec(list.items[i-1])^.shifrsta;
                  cdsAwansshifrgru.value:=pRec(list.items[i-1])^.shifrgru;
                  cdsAwanssumma.value:=pRec(list.items[i-1])^.summa;
                  cdsAwansnamegru.value:=GET_IST_NAME(pRec(list.items[i-1])^.shifrgru);
                  cdsAwansid.value:=i;
                  cdsAwans.Post;
             end;
      FreeAndNil(list);

 end;

procedure TFormAwansSwod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//     cdsAwans.Close;
//     FreeAndNil(cdsAwans);
     Action:=caFree;
end;


end.
