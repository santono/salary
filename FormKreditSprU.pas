unit FormKreditSprU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxCntner, dxTL, dxDBCtrl,
  dxDBTL, dxDBTLCl, dxGrClms, dxDBGrid, Menus;

type
  TFormKreditSpr = class(TForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
    procedure PrintSprKredit;

  public
    { Public declarations }
  end;

var
  FormKreditSpr: TFormKreditSpr;

implementation
 uses uFIBModule,FormGenKreditU,ScrUtil,ComObj,ScrDef,FormUpdKreditSprU;
 var WB:variant;


{$R *.dfm}

procedure TFormKreditSpr.FormClose(Sender: TObject;
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

procedure TFormKreditSpr.FormCreate(Sender: TObject);
begin
      if not pFIBDataSetKredit.Transaction.Active then
         pFIBDataSetKredit.Transaction.StartTransaction;
      if not pFIBDataSetKredit.Active then
         pFIBDataSetKredit.Open;
end;

procedure TFormKreditSpr.N1Click(Sender: TObject);
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

procedure TFormKreditSpr.PrintSprKredit;
 const F='######0.00';

 var
    Y,I,Nomer : integer;
    FIO,Dolg,Rukowodit,GlBuh : string;
    FName,fs : string;
    ShifrIdKreditM:integer;
    SummaTot,SummaPodohTot:real;
    DateFr : TDateTime;
    yy,m,d:word;
    a:array[1..6] of real;
    b:array[1..6] of string;
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
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select first 1 nomer,datefr,dolg,fio,y,summatot,rukowodit,glbuh from tb_kredit_spr where shifrid='+IntToStr(ShifrIdKreditM));
     FIB.pFIBQuery.ExecQuery;
     Nomer:=FIB.pFIBQuery.FieldByName('Nomer').Asinteger;
     Y:=FIB.pFIBQuery.FieldByName('Y').Asinteger;
     FIO:=FIB.pFIBQuery.FieldByName('FIO').AsString;
     Dolg:=FIB.pFIBQuery.FieldByName('Dolg').AsString;
     Rukowodit:=FIB.pFIBQuery.FieldByName('Rukowodit').AsString;
     GlBuh:=FIB.pFIBQuery.FieldByName('GlBuh').AsString;
     SummaTot:=FIB.pFIBQuery.FieldByName('SummaTot').AsFloat;
     DateFr:=FIB.pFIBQuery.FieldByName('DateFr').AsDateTime;
     FIB.pFIBQuery.Close;
     for i:=1 to 6 do
         begin
              a[i]:=0;
              b[i]:='';
         end;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select y,m,summa from tb_kredit_spr_pr where shifridowner='+IntToStr(ShifrIdKreditM)+' order by 1 desc,2 desc');
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
                    a[i]:=FIB.pFIBQuery.FieldByName('summa').AsFloat;
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
          FName:=TemplateDIR+'SpravkaKre_S.dot'
     else
          FName:=TemplateDIR+'SpravkaKre.dot';
     if not FileExists(fname) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     WB:=CreateOleObject('Word.Basic');
     WB.FileOpen(FName);
     WB.TableGridlines(false);
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
     for i:=1 to 6 do
      begin
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
      end;
     DecodeDate(DateFr,yy,m,d);
     FindAndlnsert('###ruk&',trim(Rukowodit));
     FindAndlnsert('###buh&',trim(GlBuh));


     WB.AppShow;
  end;

procedure TFormKreditSpr.N2Click(Sender: TObject);
begin
     PrintSprKredit;
end;

procedure TFormKreditSpr.N3Click(Sender: TObject);
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

end.
