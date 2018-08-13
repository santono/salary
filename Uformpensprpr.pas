unit Uformpensprpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBGrid, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, ExtCtrls,
  DBCtrls, dxCntner, StdCtrls, FIBQuery, pFIBQuery, Buttons;

type
  TFormEditPensSprPrPr = class(TForm)
    pFIBDataSet1: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSet1NEED: TFIBSmallIntField;
    pFIBDataSet1SHORTNAME: TFIBStringField;
    pFIBDataSet1SUMMA: TFIBBCDField;
    pFIBDataSet1YEAR_VY: TFIBSmallIntField;
    pFIBDataSet1MONTH_VY: TFIBSmallIntField;
    pFIBDataSet1PODR: TFIBStringField;
    pFIBDataSet1GRUPPA: TFIBStringField;
    pFIBDataSet1KATEG: TFIBStringField;
    pFIBDataSet1DOLGE: TFIBStringField;
    pFIBDataSet1ShifrIdPerson: TFIBIntegerField;
    pFIBDataSet1SHIFRID: TFIBIntegerField;
    DataSource1: TDataSource;
    dxDBGridPPrPr: TdxDBGrid;
    DBNavigator1: TDBNavigator;
    dxDBGridPPrPrSHORTNAME: TdxDBGridMaskColumn;
    dxDBGridPPrPrSUMMA: TdxDBGridCurrencyColumn;
    dxDBGridPPrPrYEAR_VY: TdxDBGridMaskColumn;
    dxDBGridPPrPrMONTH_VY: TdxDBGridMaskColumn;
    dxDBGridPPrPrPodrNAME: TdxDBGridMaskColumn;
    dxDBGridPPrPrGruppa: TdxDBGridMaskColumn;
    dxDBGridPPrPrKateg: TdxDBGridMaskColumn;
    dxDBGridPPrPrDolg: TdxDBGridMaskColumn;
    dxDBGridPPrPrNeed: TdxDBGridCheckColumn;
    pFIBDataSet1SHIFRSTA: TFIBSmallIntField;
    dxDBGridPPrPrShifrSta: TdxDBGridColumn;
    pFIBDataSet1W_PLACE: TFIBSmallIntField;
    dxDBGridPPrPrShifrPod: TdxDBGridColumn;
    LabelHeader: TLabel;
    pFIBDataSet1WidR: TFIBStringField;
    dxDBGridPPrPrWidR: TdxDBGridColumn;
    pFIBQueryRPP: TpFIBQuery;
    pFIBTransactionRPP: TpFIBTransaction;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    function Execute: boolean;
    procedure ShowTable;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure RestoreRecors;

    { Private declarations }
  public
    Year_Za     : integer;
    Month_za    : integer;
    ShifrIdPens : integer;
    WantedTabno : integer;
    WantedFio   : String;
    { Public declarations }
  end;

var
  FormEditPensSprPrPr: TFormEditPensSprPrPr;

implementation
  uses uFIBModule, uFormWait,uUpdFormPens;

{$R *.dfm}

procedure TFormEditPensSprPrPr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if  pFIBDataSet1.Active then pFIBDataSet1.Active:=false;
     if pFIBTransactionRead.InTransaction then pFIBTransactionRead.Commit;
     if pFIBTransactionWrite.InTransaction then pFIBTransactionWrite.Commit;
     Action:=caFree;
end;

procedure TFormEditPensSprPrPr.FormShow(Sender: TObject);
 var s:AnsiString;
     c:string;
     i:integer;
begin
     ShowTable;
     exit;
(*
    pFIBDataSet1.SelectSQL.Clear;
    with pFIBDataSet1.SelectSQL do
         begin
              Add('select a.need,b.shortname,a.summa,a.year_vy,a.month_vy,c.name,g.name,k.name,');
              Add('case when exists (select first 1 a1.w_r from fadd a1 ');
              Add('join person p on a1.shifridperson=p.shifrid ');
              Add('where a1.shifrid=a.shifridadd) ');
              Add('then (select first 1 p.dolg from fadd a1 ');
              Add('join person p on a1.shifridperson=p.shifrid ');
              Add('where a1.shifrid=a.shifridadd)');
              Add(' else '''' end,');
              Add('case when exists (select first 1 a1.w_r from fadd a1 ');
              Add('join person p on a1.shifridperson=p.shifrid ');
              Add('where a1.shifrid=a.shifridadd) ');
              Add('then (select first 1 a1.shifridperson from fadd a1 ');
              Add('join person p on a1.shifridperson=p.shifrid ');
              Add('where a1.shifrid=a.shifridadd) ');
              Add('else 1 end,a.SHIFRID,a.SHIFRSTA,a.W_PLACE,');
              Add('CASE WHEN (P.w_r=1 or EXISTS (SELECT * FROM FCN CN WHERE CN.shifridperson=P.shifrid AND CN.shifrsta IN (82,82+500))) THEN ''осн'' ELSE ''свм'' END ');
              Add(' from tb_pensspr_2007_pr_pr a ');
              Add(' join shifr b on a.shifrsta=b.shifr ');
              Add(' join podr c on a.w_place=c.shifrpod ');
              Add(' join gruppy g on a.shifrgru=g.shifr ');
              Add(' join kateg k on k.shifr=a.shifrkat ');
              Add(' join tb_pensspr_2007_pr ps on ps.shifrid=a.shifridpensspr ');
              Add(' join fadd a1 on a1.shifrid=a.shifridadd ');
              Add(' join person p on p.shifrid=a1.shifridperson ');
              Add(' where ps.shifridown='+IntToStr(ShifrIdPens)+' and ');
              Add(' a.year_za='+IntToStr(year_za)+' and ');
              Add(' a.month_za='+IntToStr(month_za));
              Add(' order by c.shifrpod,10,a.shifrsta');
         end;
    pFIBDataSet1.UpdateSQL.Clear;
    with pFIBDataSet1.UpdateSQL do
         begin
              Add('update tb_pensspr_2007_pr_pr');
              Add(' set need=:need ');
              Add(' where shifrid=:OLD_SHIFRID');
         end;
    pFIBDataSet1.RefreshSQL.Clear;
    with pFIBDataSet1.RefreshSQL do
         begin
              Add('select a.need,b.shortname,a.summa,a.year_vy,a.month_vy,c.name,g.name,k.name,');
              Add('case when exists (select first 1 a1.w_r from fadd a1 ');
              Add('join person p on a1.shifridperson=p.shifrid ');
              Add('where a1.shifrid=a.shifridadd) ');
              Add('then (select first 1 p.dolg from fadd a1 ');
              Add('join person p on a1.shifridperson=p.shifrid ');
              Add('where a1.shifrid=a.shifridadd)');
              Add(' else '''' end,');
              Add('case when exists (select first 1 a1.w_r from fadd a1 ');
              Add('join person p on a1.shifridperson=p.shifrid ');
              Add('where a1.shifrid=a.shifridadd) ');
              Add('then (select first 1 a1.shifridperson from fadd a1 ');
              Add('join person p on a1.shifridperson=p.shifrid ');
              Add('where a1.shifrid=a.shifridadd) ');
              Add('else 1 end,a.SHIFRID,A.SHIFRSTA,a.w_place,');
              Add('CASE WHEN (P.w_r=1 or EXISTS (SELECT * FROM FCN CN WHERE CN.shifridperson=P.shifrid AND CN.shifrsta IN (82,82+500))) THEN ''осн'' ELSE ''свм'' END');
              Add(' from tb_pensspr_2007_pr_pr a ');
              Add(' join shifr b on a.shifrsta=b.shifr ');
              Add(' join podr c on a.w_place=c.shifrpod ');
              Add(' join gruppy g on a.shifrgru=g.shifr ');
              Add(' join kateg k on k.shifr=a.shifrkat ');
              Add(' join tb_pensspr_2007_pr ps on ps.shifrid=a.shifridpensspr ');
              Add(' join fadd a1 on a1.shifrid=a.shifridadd ');
              Add(' join person p on p.shifrid=a1.shifridperson ');
              Add(' where ps.shifridown='+IntToStr(ShifrIdPens)+' and ');
              Add(' a.year_za='+IntToStr(year_za)+' and ');
              Add(' a.month_za='+IntToStr(month_za)+' and ');
              Add(' a.SHIFRID=:OLD_SHIFRID ');
              Add(' order by c.shifrpod,10,a.shifrsta');
         end;
    if  pFIBDataSet1.Active then pFIBDataSet1.Active:=false;
    pFIBDataSet1.Active:=true;
      if pFIBDataSet1.Prepared then
         i:=1
          else
         i:=0;
      i:=pFIBDataSet1.SelectSql.Count;
      for i:=0 to pFIBDataSet1.SelectSql.Count-1 do
          begin
                c:=pFIBDataSet1.SelectSql[i];
                S:=s+c;
          end;
      i:=pFIBDataSet1.SelectSql.Count;

      pFIBDataSet1.ReFresh;

{
select a.need,b.shortname,a.summa,a.year_vy,a.month_vy,c.name,g.name,k.name,
       case when exists (select first 1 a1.w_r from fadd a1
                                join person p on a1.shifridperson=p.shifrid
                                where a1.shifrid=a.shifridadd)
        then (select first 1 p.dolg from fadd a1
                                join person p on a1.shifridperson=p.shifrid
                                where a1.shifrid=a.shifridadd)
        else '' end,
       case when exists (select first 1 a1.w_r from fadd a1
                                join person p on a1.shifridperson=p.shifrid
                                where a1.shifrid=a.shifridadd)
        then (select first 1 a1.shifridperson from fadd a1
                                join person p on a1.shifridperson=p.shifrid
                                where a1.shifrid=a.shifridadd)
        else 1 end
from tb_pensspr_2007_pr_pr a
     join shifr b on a.shifrsta=b.shifr
     join podr c on a.w_place=c.shifrpod
     join gruppy g on a.shifrgru=g.shifr
     join kateg k on k.shifr=a.shifrkat
where a.shifridpensspr=:shifridpensspr and
      a.year_za=:year_za and
      a.month_za=:month_za
order by c.shifrpod,10,a.shifrsta
}
*)
end;

function TFormEditPensSprPrPr.Execute: boolean;
 begin
      LabelHeader.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.WantedFio)+' '+IntToStr(Self.Year_Za)+' '+IntToStr(Self.Month_Za);
      Self.visible:=false;
      if ShowModal = mrOk then result := true
                          else result := false;
end;

procedure TFormEditPensSprPrPr.ShowTable;
var S:AnsiString;
    c:string;
    i:integer;
begin
      FormWait.Show;
      Application.ProcessMessages;
      if pFIBDataSet1.Active then
         pFIBDataSet1.Active:=false;
      pFIBDataSet1.Params[0].AsInteger:=Self.ShifrIdPens;
      pFIBDataSet1.Params[1].AsInteger:=Self.Year_Za;
      pFIBDataSet1.Params[2].AsInteger:=Self.Month_Za;
{      pFIBDataSet1.Prepare;   }
      if pFIBDataSet1.Prepared then
         i:=1
      else
         i:=0;
      i:=pFIBDataSet1.SelectSql.Count;
      for i:=0 to pFIBDataSet1.SelectSql.Count-1 do
          begin
                c:=pFIBDataSet1.SelectSql[i];
                S:=s+c;
          end;
      pFIBDataSet1.Open;
      FormWait.Hide;
end;

procedure TFormEditPensSprPrPr.FormCreate(Sender: TObject);
begin
{
     Self.ShifrIdPens := FormPensSpr2006.WantedId;
     Self.Year_Za     := FormPensSpr2006.WantedYear;
     Self.Month_Za    := FormPensSpr2006.WantedMonth;
     ShowTable;
}
end;

procedure TFormEditPensSprPrPr.BitBtn1Click(Sender: TObject);
begin
     if MessageDlg('Текущие данные по месяцу будут уничтожены и созданы новые. Продолжить?',mtConfirmation, [mbYes, mbNo],  0) = mrYes then
        RestoreRecors;
end;

procedure TFormEditPensSprPrPr.RestoreRecors;
 var SQL       : String;
     Need_Mode : integer;
 begin
     Need_Mode:=2;
     if MessageDlg('Отмечать только основную работу?',mtConfirmation, [mbYes, mbNo],  0) = mrYes then Need_Mode:=1;

     SQL:='Execute procedure PR_RESTORE_PR_PR ( '+IntToStr(WantedTabno)+','
     +IntToStr(Year_Za)+','+IntToStr(Month_Za)+','+IntToStr(ShifrIdPens)+','+IntToStr(Need_Mode)+')';
     pFIBQueryRPP.SQL.Clear;
     pFIBQueryRPP.SQL.Add(Sql);
     if not pFIBQueryRPP.Transaction.Active then
        pFIBQueryRPP.Transaction.StartTransaction;
     FormWait.Show;
     Application.ProcessMessages;
     pFIBQueryRPP.ExecQuery;
     FormWait.Hide;
     pFIBQueryRPP.Close;
     pFIBQueryRPP.Transaction.COMMIT;
     ShowTable;
 end;

end.
