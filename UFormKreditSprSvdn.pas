unit UFormKreditSprSvdn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxCntner, dxTL, dxDBCtrl,
  dxDBTL, dxDBTLCl, dxGrClms, dxDBGrid, Menus, ExtCtrls, DBCtrls, ComCtrls,
  ToolWin, ActnList, ImgList;

type
  TFormKreditSprSvdn = class(TForm)
    pFIBDataSetKredit: TpFIBDataSet;
    pFIBDataSetKreditSHIFRID: TFIBIntegerField;
    pFIBDataSetKreditTABNO: TFIBIntegerField;
    pFIBDataSetKreditFIO: TFIBStringField;
    pFIBDataSetKreditSUMMATOT: TFIBBCDField;
    pFIBDataSetKreditF_1: TFIBStringField;
    pFIBDataSetKreditDATEFR: TFIBDateField;
    pFIBDataSetKreditY: TFIBSmallIntField;
    DataSourceKredit: TDataSource;
    dxDBGridKredit: TdxDBGrid;
    dxDBGridKreditSHIFRID: TdxDBGridMaskColumn;
    dxDBGridKreditTABNO: TdxDBGridMaskColumn;
    dxDBGridKreditFIO: TdxDBGridMaskColumn;
    dxDBGridKreditSUMMATOT: TdxDBGridCurrencyColumn;
    dxDBGridKreditDATEFR: TdxDBGridDateColumn;
    dxDBGridKreditF_1: TdxDBGridMaskColumn;
    dxDBGridKreditY: TdxDBGridMaskColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    pFIBDataSetKreditDOLG: TFIBStringField;
    dxDBGridKreditDolg: TdxDBGridColumn;
    N3: TMenuItem;
    pFIBDataSetKreditSUMMAPOD: TFIBBCDField;
    pFIBDataSetKreditSUMMAWS: TFIBBCDField;
    pFIBDataSetKreditSUMMAONHAND: TFIBBCDField;
    dxDBGridKreditSummaPod: TdxDBGridMaskColumn;
    dxDBGridKreditSummaWS: TdxDBGridMaskColumn;
    dxDBGridKreditSummaOnHand: TdxDBGridMaskColumn;
    il1: TImageList;
    ActionList1: TActionList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    DBNavigator1: TDBNavigator;
    ActionGenNewKre: TAction;
    ActionUpdKre: TAction;
    ActionPrintKre: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ActionGenNewKreExecute(Sender: TObject);
    procedure ActionUpdKreExecute(Sender: TObject);
    procedure ActionPrintKreExecute(Sender: TObject);
  private
    { Private declarations }
    procedure PrintSprKredit;

  public
    { Public declarations }
  end;

var
  FormKreditSprSvdn: TFormKreditSprSvdn;

implementation
 uses uFIBModule,FormGenKreditU,ScrUtil,ComObj,ScrDef,FormUpdKreditSprU,USQLUnit;
 var WB,WA:variant;
     

{$R *.dfm}

procedure TFormKreditSprSvdn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if pFIBDataSetKredit.Active then
         pFIBDataSetKredit.Close;
      if pFIBDataSetKredit.Transaction.Active then
         pFIBDataSetKredit.Transaction.Commit;
      if pFIBDataSetKredit.UpdateTransaction.Active then
         pFIBDataSetKredit.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormKreditSprSvdn.FormCreate(Sender: TObject);
begin
      if not pFIBDataSetKredit.Transaction.Active then
         pFIBDataSetKredit.Transaction.StartTransaction;
      if not pFIBDataSetKredit.Active then
         pFIBDataSetKredit.Open;
end;

procedure TFormKreditSprSvdn.N1Click(Sender: TObject);
var ShifrIdKredit:integer;
begin
    ShifrIdKredit:=0;
    with TFormGenKredit.Create(nil) do
         try
            if execute then
               ShifrIdKredit:=ShifrId;
         finally
{            free;}
         end;
{
    Application.CreateForm(TFormGenYSpr, FormGenYSpr);
    FormGenYSpr.ShowModal;
}
    if ShifrIdKredit>0 then
       begin
            pFIBDataSetKredit.Close;
            pFIBDataSetKredit.Open;
            pFIBDataSetKredit.Locate('ShifrId',ShifrIdKredit, [loPartialKey]);
       end;


end;

procedure TFormKreditSprSvdn.PrintSprKredit;
 const F='######0.00';

 var
    Y,I,Nomer : integer;
    FIO,Dolg,Rukowodit,GlBuh,Isp : string;
    FName,fs : string;
    ShifrIdKreditM:integer;
    SummaTot,SummaPodTot,SummaWsTot,SummaOnHandTot,SummaPodohTot:real;
    DateFr : TDateTime;
    yy,m,d:word;
    summaAdd:array[1..6] of real;
    summaPod:array[1..6] of real;
    summaWs:array[1..6] of real;
    summaOnHand:array[1..6] of real;
    b:array[1..6] of string;
    table:Variant;
    currRow:Integer;
    SQLStmnt:string;
    v:Variant;
    res:string;
    function FindAndlnsert(FindText,ReplacementText:string):boolean;
      label 0,1,2;
      begin
           WB.StartOfDocument;
           1: WB.EditFind(FindText);
           if WB.EditFindFound then
               begin
                    WB.insert(ReplacementText);
                    goto 1;
               end;
      end;
  begin
     ShifrIdKreditM:=pFIBDataSetKredit.FieldByName('ShifrId').AsInteger;
//     SQLStmnt := SQLStmnt('select first 1 nomer,datefr,dolg,fio,y,summatot,summapod,summaws,summaonhand,rukowodit,glbuh,isp from tb_kredit_spr where shifrid='+IntToStr(ShifrIdKreditM));
//     v:=SQLQueryRecValues(SQLStmnt);

     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select first 1 nomer,datefr,dolg,fio,y,summatot,coalesce(summapod,0) spod,coalesce(summaws,0) sws,coalesce(summaonhand,0) sonhand,rukowodit,glbuh,coalesce(isp,'''') sisp from tb_kredit_spr where shifrid='+IntToStr(ShifrIdKreditM));
     FIB.pFIBQuery.ExecQuery;
     Nomer:=FIB.pFIBQuery.FieldByName('Nomer').Asinteger;
     Y:=FIB.pFIBQuery.FieldByName('Y').Asinteger;
     FIO:=FIB.pFIBQuery.FieldByName('FIO').AsString;
     Dolg:=FIB.pFIBQuery.FieldByName('Dolg').AsString;
     Rukowodit:=FIB.pFIBQuery.FieldByName('Rukowodit').AsString;
     GlBuh:=FIB.pFIBQuery.FieldByName('GlBuh').AsString;
     SummaTot:=FIB.pFIBQuery.FieldByName('SummaTot').AsFloat;
     SummaPodTot:=FIB.pFIBQuery.FieldByName('SPod').AsFloat;
     SummaWsTot:=FIB.pFIBQuery.FieldByName('SWs').AsFloat;
     SummaOnHandTot:=FIB.pFIBQuery.FieldByName('SOnHand').AsFloat;
     DateFr:=FIB.pFIBQuery.FieldByName('DateFr').AsDateTime;
     Isp:=FIB.pFIBQuery.FieldByName('SIsp').AsString;
     FIB.pFIBQuery.Close;
(*
     Nomer:=FIB.pFIBQuery.FieldByName('Nomer').Asinteger;
     Y:=FIB.pFIBQuery.FieldByName('Y').Asinteger;
     FIO:=FIB.pFIBQuery.FieldByName('FIO').AsString;
     Dolg:=FIB.pFIBQuery.FieldByName('Dolg').AsString;
     Rukowodit:=FIB.pFIBQuery.FieldByName('Rukowodit').AsString;
     GlBuh:=FIB.pFIBQuery.FieldByName('GlBuh').AsString;
     SummaTot:=FIB.pFIBQuery.FieldByName('SummaTot').AsFloat;
     DateFr:=FIB.pFIBQuery.FieldByName('DateFr').AsDateTime;
*)
     for i:=1 to 6 do
         begin
              summaAdd[i]:=0;
              summaPod[i]:=0;
              summaWs[i]:=0;
              summaOnHand[i]:=0;
              b[i]:='';
         end;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select y,m,coalesce(summa,0) s,coalesce(summapod,0) spod,coalesce(summaws,0) sws ,coalesce(summaonhand,0) sonhand from tb_kredit_spr_pr where shifridowner='+IntToStr(ShifrIdKreditM)+' order by 1 desc,2 desc');
     FIB.pFIBQuery.ExecQuery;
     i:=0;
     while not FIB.pFIBQuery.Eof do
      begin
           inc(i);
           if i>6 then break;
           yy:=FIB.pFIBQuery.FieldByName('y').AsInteger;
           m:=FIB.pFIBQuery.FieldByName('m').AsInteger;
           if (yy>0) and (yy<2100) and (m>0) and (m<13) then
              begin
                    summaAdd[i]:=FIB.pFIBQuery.FieldByName('s').AsFloat;
                    summaPod[i]:=FIB.pFIBQuery.FieldByName('spod').AsFloat;
                    summaWS[i]:=FIB.pFIBQuery.FieldByName('sws').AsFloat;
                    summaOnHand[i]:=FIB.pFIBQuery.FieldByName('sonhand').AsFloat;
                    b[i]:=GetMonthUkr(m)+' '+IntToStr(YY);
              end;
           FIB.pFIBQuery.Next;
      end;
     FIB.pFIBQuery.Close;
     FIB.pFIBQuery.Transaction.CommitRetaining;


   // Создаем новый документ по шаблону
{
     if WB=NIl then
        begin
             ShowMessage('WORD не установлен');
             Exit;
        end;
}
     if isSVDN then
          FName:=TemplateDIR+'SpravkaKre2022_S.dot'
     else
          FName:=TemplateDIR+'SpravkaKre.dot';
     if not FileExists(fname) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     WA:=CreateOleObject('Word.Application');
     res:=WA.Application.Version;
     WB:=WA.WordBasic;
     WB.FileOpen(FName);
     WB.TableGridlines(false);
     table:=WA.ActiveDocument.Tables.item(1);
     // Подставляем текст.
     DecodeDate(DateFr,yy,m,d);
     FindAndlnsert('###nom&',IntToStr(Nomer));
     FindAndlnsert('###day&',IntToStr(d));
     FindAndlnsert('###month&',trim(GetMonthUkr(m))+' '+IntToStr(yy));
     FindAndlnsert('###year&',IntToStr(y));
     FindAndlnsert('###fio&',trim(FIO));
     FindAndlnsert('###dolg&',trim(Dolg));
     FindAndlnsert('###prop&',trim(NumeralToPhrase(SummaTot,1)));
     FindAndlnsert('###PodT&',trim(FormatFloat(F,SummaPodohTot)));
     FindAndlnsert('###SummaT&',trim(FormatFloat(F,SummaTot)));
     currRow:=1;
     for i:=1 to 6 do
      begin
(*
            fs:='###summa'+Trim(IntToStr(I))+'&';
            if (abs(a[i])>0.005) then
               FindAndlnsert(fs,trim(FormatFloat(F,a[i])))
                                else
               FindAndlnsert(fs,' ');
            fs:='###per'+Trim(IntToStr(I))+'&';
            if (length(trim(b[i]))>0) then
               FindAndlnsert(fs,trim(b[i]))
                                else
               FindAndlnsert(fs,' ');
*)
            Inc(currRow);
            // месяц
            if (length(trim(b[i]))>0) then
            table.Cell(currRow, 1).Range.Text:=trim(b[i]);
            // Начислено
            if (abs(summaAdd[i])>0.005) then
               table.Cell(currRow, 2).Range.Text:=trim(FormatFloat(F,summaAdd[i]));
            // Подоходный
            if (abs(summaPod[i])>0.005) then
               table.Cell(currRow, 3).Range.Text:=trim(FormatFloat(F,summaPod[i]));
            // В.сбор
            if (abs(summaWS[i])>0.005) then
               table.Cell(currRow, 4).Range.Text:=trim(FormatFloat(F,summaWS[i]));
            // На руки
            if (abs(summaOnHand[i])>0.005) then
               table.Cell(currRow, 5).Range.Text:=trim(FormatFloat(F,summaOnHand[i]));
      end;
     // Начислено
     if (abs(summaTot)>0.005) then
        table.Cell(8, 2).Range.Text:=trim(FormatFloat(F,summaTot));
     // Подоходный
     if (abs(summaPodTot)>0.005) then
        table.Cell(8, 3).Range.Text:=trim(FormatFloat(F,summaPodTot));
     // В.сбор
     if (abs(summaWSTot)>0.005) then
        table.Cell(8, 4).Range.Text:=trim(FormatFloat(F,summaWSTot));
     // На руки
     if (abs(summaOnHandTot)>0.005) then
        table.Cell(8, 5).Range.Text:=trim(FormatFloat(F,summaOnHandTot));
     DecodeDate(DateFr,yy,m,d);
     FindAndlnsert('###ruk&',trim(Rukowodit));
     FindAndlnsert('###buh&',trim(GlBuh));
     if Length(Trim(isp))=0 then
        isp:=' ';
     FindAndlnsert('###isp&',Isp);


     WB.AppShow;
  end;

procedure TFormKreditSprSvdn.N2Click(Sender: TObject);
begin
     PrintSprKredit;
end;

procedure TFormKreditSprSvdn.N3Click(Sender: TObject);
var ShifrIdKredit:integer;
begin
    ShifrIdKredit:=pFIBDataSetKredit.FieldByName('ShifrId').AsInteger;;
    if ShifrIdKredit<=0 then Exit;
    with TFormUpdKreditSpr.Create(nil) do
         try
            ShifrId:=ShifrIdKredit;
            if execute then ;
         finally
         end;

    pFIBDataSetKredit.Close;
    pFIBDataSetKredit.Open;
    pFIBDataSetKredit.Locate('ShifrId',ShifrIdKredit, [loPartialKey]);
end;

procedure TFormKreditSprSvdn.ActionGenNewKreExecute(Sender: TObject);
var ShifrIdKredit:integer;
begin
    ShifrIdKredit:=0;
    with TFormGenKredit.Create(nil) do
         try
            if execute then
               ShifrIdKredit:=ShifrId;
         finally
{            free;}
         end;
{
    Application.CreateForm(TFormGenYSpr, FormGenYSpr);
    FormGenYSpr.ShowModal;
}
    if ShifrIdKredit>0 then
       begin
            pFIBDataSetKredit.Close;
            pFIBDataSetKredit.Open;
            pFIBDataSetKredit.Locate('ShifrId',ShifrIdKredit, [loPartialKey]);
       end;

end;

procedure TFormKreditSprSvdn.ActionUpdKreExecute(Sender: TObject);
var ShifrIdKredit:integer;
begin
    ShifrIdKredit:=pFIBDataSetKredit.FieldByName('ShifrId').AsInteger;;
    if ShifrIdKredit<=0 then Exit;
    with TFormUpdKreditSpr.Create(nil) do
         try
            ShifrId:=ShifrIdKredit;
            if execute then ;
         finally
         end;

    pFIBDataSetKredit.Close;
    pFIBDataSetKredit.Open;
    pFIBDataSetKredit.Locate('ShifrId',ShifrIdKredit, [loPartialKey]);

end;

procedure TFormKreditSprSvdn.ActionPrintKreExecute(Sender: TObject);
begin
     PrintSprKredit;
end;

end.
