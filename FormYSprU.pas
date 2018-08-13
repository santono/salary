unit FormYSprU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxCntner, dxTL, dxDBCtrl,
  dxDBGrid, dxDBTLCl, dxGrClms, Menus, ActnList;

type
  TFormYSpr = class(TForm)
    pFIBDataSetY: TpFIBDataSet;
    pFIBDataSetYSHIFRID: TFIBIntegerField;
    pFIBDataSetYTABNO: TFIBIntegerField;
    pFIBDataSetYFIO: TFIBStringField;
    pFIBDataSetYSUMMATOT: TFIBBCDField;
    pFIBDataSetYSUMMAPODOHTOT: TFIBBCDField;
    pFIBDataSetYF_1: TFIBStringField;
    pFIBDataSetYDATAFR: TFIBDateField;
    dxDBGridY: TdxDBGrid;
    DataSourceY: TDataSource;
    dxDBGridYSHIFRID: TdxDBGridMaskColumn;
    dxDBGridYTABNO: TdxDBGridMaskColumn;
    dxDBGridYFIO: TdxDBGridMaskColumn;
    dxDBGridYSUMMATOT: TdxDBGridCurrencyColumn;
    dxDBGridYSUMMAPODOHTOT: TdxDBGridCurrencyColumn;
    dxDBGridYF_1: TdxDBGridMaskColumn;
    dxDBGridYDATAFR: TdxDBGridDateColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    pFIBDataSetYY: TFIBSmallIntField;
    dxDBGridYY: TdxDBGridColumn;
    pFIBDataSetYMODEZV: TFIBStringField;
    dxDBGridYModeVZ: TdxDBGridColumn;
    pFIBDataSetYSUMMAECBTOT: TFIBBCDField;
    dxDBGridYECBTOT: TdxDBGridCurrencyColumn;
    ActionList1: TActionList;
    actEditList: TAction;
    actCalcItogi: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure actEditListExecute(Sender: TObject);
    procedure actCalcItogiExecute(Sender: TObject);
  private
    { Private declarations }
    procedure PrintSPrY;
  public
    { Public declarations }
  end;

var
  FormYSpr: TFormYSpr;

implementation
 uses uFIBModule,FormGenYU,ComObj,ScrDef,ScrUtil, UFormYSprRec;
 var WB:variant;

{$R *.dfm}

procedure TFormYSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetY.Active then
         pFIBDataSetY.Active:=false;
      if pFIBDataSetY.Transaction.Active then
         pFIBDataSetY.Transaction.Commit;
      if pFIBDataSetY.UpdateTransaction.Active then
         pFIBDataSetY.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormYSpr.FormCreate(Sender: TObject);
begin
      if not pFIBDataSetY.Transaction.Active then
         pFIBDataSetY.Transaction.StartTransaction;
      if not pFIBDataSetY.Active then
         pFIBDataSetY.Active:=true;
end;

procedure TFormYSpr.N1Click(Sender: TObject);
var ShifrIdY:integer;
begin
    ShifrIdY:=0;
    with TFormGenYSpr.Create(nil) do
         try
            if execute then
               ShifrIdY:=ShifrId;
         finally
{            free;}
         end;
{
    Application.CreateForm(TFormGenYSpr, FormGenYSpr);
    FormGenYSpr.ShowModal;
}
    if ShifrIdY>0 then
       begin
            pFIBDataSetY.Close;
            pFIBDataSetY.Open;
            pFIBDataSetY.Locate('ShifrId',ShifrIdY, [loPartialKey]);
       end;

end;

procedure TFormYSpr.PrintSPrY;
 const F='######0.00';

 var
    Y,I : integer;
    FIO : string;
    FName,fs : string;
    ShifrIdYM:integer;
    SummaTot,SummaPodohTot,SummaECBTot:real;
    DataFr : TDateTime;
    yy,m,d:word;
    a,u,e:array[1..12] of real;
    tabno:Integer;
    IdCodeS:string;
    fioB:string;
    SQLStmnt:string;
    strMonth:string;
    mode:Integer;
    function FindAndlnsert(FindText,ReplacementText:string):boolean;
      label 0,1,2;
      begin
           FindAndlnsert:=False;
           WB.StartOfDocument;
           1: WB.EditFind(FindText);
           if WB.EditFindFound then
               begin
                    FindAndlnsert:=True;
                    WB.insert(ReplacementText);
                    goto 1;
               end;
      end;
  begin
     ShifrIdYM:=pFIBDataSetY.FieldByName('ShifrId').AsInteger;
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select first 1 y,fio,summatot,summapodohtot,summaecbtot,datafr,tabno from tb_spr_zarpl where shifrid='+IntToStr(ShifrIdYM));
     FIB.pFIBQuery.ExecQuery;
     Y:=FIB.pFIBQuery.FieldByName('Y').Asinteger;
     FIO:=FIB.pFIBQuery.FieldByName('FIO').AsString;
     SummaTot:=FIB.pFIBQuery.FieldByName('SummaTot').AsFloat;
     SummaPodohTot:=FIB.pFIBQuery.FieldByName('SummaPodohTot').AsFloat;
     SummaECBTot:=FIB.pFIBQuery.FieldByName('SummaECBTot').AsFloat;
     DataFr:=FIB.pFIBQuery.FieldByName('DataFr').AsDateTime;
     tabno:=FIB.pFIBQuery.FieldByName('tabno').AsInteger;
     FIB.pFIBQuery.Close;
     for i:=1 to 12 do
         begin
              a[i]:=0;
              u[i]:=0;
              e[i]:=0;
         end;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select period,summaadd,summapod,summaecb from tb_spr_zarpl_pr where shifridowner='+IntToStr(ShifrIdYM)+' order by 1');
     FIB.pFIBQuery.ExecQuery;
     i:=0;
     while not FIB.pFIBQuery.Eof do
      begin
           inc(i);
           if i>12 then break;
           yy:=FIB.pFIBQuery.FieldByName('period').AsInteger;
           if (yy>0) and (yy<13) then
              begin
                    a[yy]:=FIB.pFIBQuery.FieldByName('summaadd').AsFloat;
                    u[yy]:=FIB.pFIBQuery.FieldByName('summapod').AsFloat;
                    e[yy]:=FIB.pFIBQuery.FieldByName('summaecb').AsFloat;
              end;
           FIB.pFIBQuery.Next;
      end;
     FIB.pFIBQuery.Close;
     FIB.pFIBQuery.Transaction.CommitRetaining;
     SQLStmnt:='select nal_code from kadry where tabno='+IntToStr(tabno);
     idCodeS:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     IdCodeS:=Trim(idCodeS);
     if not (Length(idCodeS)=10) then idCodeS:=''
     else
     if not IsNumericString(idCodeS) then idCodeS:='';
     fiob:=Trim(CurrWrkFio);

{
     if WB=NIl then
        begin
             ShowMessage('WORD не установлен');
             Exit;
        end;
}
     if isSVDN then
        FName:=TemplateDIR+'SpravkaYP_S.dot'
     else
  //      FName:=TemplateDIR+'SpravkaYP.dot';
        FName:=TemplateDIR+'SpravkaYP_L_2017.dot';
   // Создаем новый документ по шаблону
     WB:=CreateOleObject('Word.Basic');
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон справки '+FName);
             Exit;
        end;
     WB.FileOpen(FName);
     WB.TableGridlines(false);
     // Подставляем текст.
     if not FindAndlnsert('###year&',IntToStr(Y)) then
        begin
             ShowMessage('Испорченный шаблон '+FName+^M+' !!!Замените его!!!');

             Exit;
        end;
     FindAndlnsert('###fio&',trim(FIO));
     FindAndlnsert('###AddT&',trim(FormatFloat(F,SummaTot)));
     FindAndlnsert('###PodT&',trim(FormatFloat(F,SummaPodohTot)));
     FindAndlnsert('###ECBT&',trim(FormatFloat(F,SummaECBTot)));
     FindAndlnsert('###idkod&',trim(idCodeS));
     FindAndlnsert('###fiob&',trim(fiob));
     for i:=1 to 12 do
      begin
            fs:='###Add'+Trim(IntToStr(I))+'&';
            if (abs(a[i])>0.005) then
               FindAndlnsert(fs,trim(FormatFloat(F,a[i])))
                                else
               FindAndlnsert(fs,' ');
            fs:='###Pod'+Trim(IntToStr(I))+'&';
            if (abs(u[i])>0.005) then
               FindAndlnsert(fs,trim(FormatFloat(F,u[i])))
                                else
               FindAndlnsert(fs,' ');
            fs:='###ECB'+Trim(IntToStr(I))+'&';
            if (abs(e[i])>0.005) then
               FindAndlnsert(fs,trim(FormatFloat(F,e[i])))
                                else
               FindAndlnsert(fs,' ');
      end;
     DecodeDate(DataFr,yy,m,d);
     FindAndlnsert('###d&',trim(IntToStr(d)));
     strMonth:=trim(GetMonthUkr(M));
     mode:=1;
     if isLNR then
        begin
           strMonth:=trim(GetMonthRus(M));
           mode:=0;
        end;

     FindAndlnsert('###mon&',trim(strMonth)+' '+trim(IntToStr(Yy)));
     FindAndlnsert('###prop&',trim(NumeralToPhrase(SummaTot,mode)));


     WB.AppShow;
  end;
procedure TFormYSpr.N2Click(Sender: TObject);
begin
    PrintSPrY;
end;

procedure TFormYSpr.actEditListExecute(Sender: TObject);
var Id : Integer;
begin
     Id:=pFIBDataSetYSHIFRID.Value;
     FormYSprRec := TFormYSprRec.MyCreate(Owner,id);
     FormYSprRec.ShowModal;
end;

procedure TFormYSpr.actCalcItogiExecute(Sender: TObject);
var Id : Integer;
    SQLStmnt : string;
    v  : Variant;
    summaAdd,summaPod,summaECB:Real;
begin
     Id:=pFIBDataSetYSHIFRID.Value;
     SQLStmnt := 'select sum(summaAdd)  from tb_spr_zarpl_pr where shifridowner='+intToStr(id);
     v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     SummaAdd:=v;
     SQLStmnt := 'select sum(summapod)  from tb_spr_zarpl_pr where shifridowner='+intToStr(id);
     v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     SummaPod:=v;
     SQLStmnt := 'select sum(summaecb)  from tb_spr_zarpl_pr where shifridowner='+intToStr(id);
     v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     Summaecb:=v;
     pFIBDataSetY.Edit;
     pFIBDataSetYSUMMATOT.Value:=summaAdd;
     pFIBDataSetYSUMMAPODOHTOT.Value:=summaPod;
     pFIBDataSetYSUMMAECBTOT.Value:=summaECB;
     pFIBDataSetY.Post;
     pFIBDataSetY.Refresh;

end;

end.
