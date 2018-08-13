unit UFormReeBoln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  ExtCtrls, DBCtrls, Menus, FIBQuery, pFIBQuery, frxClass, frxDBSet,
  frxExportRTF, frxExportXLS, frxExportTXT;

type
  TFormReeBoln = class(TForm)
    pFIBDataSetRB: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    DataSourceRB: TDataSource;
    dxDBGridRB: TdxDBGrid;
    pFIBDataSetRBSHIFRID: TFIBIntegerField;
    pFIBDataSetRBNOMER: TFIBStringField;
    pFIBDataSetRBDATEFORM: TFIBDateField;
    pFIBDataSetRBDATEREE: TFIBDateField;
    pFIBDataSetRBDATERCV: TFIBDateField;
    pFIBDataSetRBNMBOFBLN: TFIBSmallIntField;
    pFIBDataSetRBSUMMA: TFIBBCDField;
    dxDBGridRBSHIFRID: TdxDBGridMaskColumn;
    dxDBGridRBNOMER: TdxDBGridMaskColumn;
    dxDBGridRBDATEFORM: TdxDBGridDateColumn;
    dxDBGridRBDATEREE: TdxDBGridDateColumn;
    dxDBGridRBDATERCV: TdxDBGridDateColumn;
    dxDBGridRBNMBOFBLN: TdxDBGridMaskColumn;
    dxDBGridRBSUMMA: TdxDBGridCurrencyColumn;
    DBNavigator1: TDBNavigator;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    pFIBQueryB: TpFIBQuery;
    pFIBTransactionQ: TpFIBTransaction;
    pFIBDataSetRR: TpFIBDataSet;
    pFIBTransactionRR: TpFIBTransaction;
    pFIBDataSetRRFIO: TFIBStringField;
    pFIBDataSetRRSWIDSS: TFIBStringField;
    pFIBDataSetRRNOMER_B: TFIBStringField;
    pFIBDataSetRRCODEILL: TFIBIntegerField;
    pFIBDataSetRRPERIODILL: TFIBStringField;
    pFIBDataSetRRDAYTOT: TFIBIntegerField;
    pFIBDataSetRRDAYSS: TFIBIntegerField;
    pFIBDataSetRRSUMMATOT: TFIBBCDField;
    pFIBDataSetRRSUMMASS: TFIBBCDField;
    frxDBDatasetRR: TfrxDBDataset;
    N3: TMenuItem;
    frxTXTExport1: TfrxTXTExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxReportRR: TfrxReport;
    pFIBDataSetRR062012: TpFIBDataSet;
    pFIBDataSetRR062012FIO: TFIBStringField;
    pFIBDataSetRR062012SWIDSS: TFIBStringField;
    pFIBDataSetRR062012NOMER_B: TFIBStringField;
    pFIBDataSetRR062012CODEILL: TFIBIntegerField;
    pFIBDataSetRR062012DATAFR: TFIBStringField;
    pFIBDataSetRR062012DATATO: TFIBStringField;
    pFIBDataSetRR062012DAYTOT: TFIBIntegerField;
    pFIBDataSetRR062012DAYSS: TFIBIntegerField;
    pFIBDataSetRR062012SUMMATOT: TFIBBCDField;
    pFIBDataSetRR062012SUMMASS: TFIBBCDField;
    pFIBTransactionRR062012: TpFIBTransaction;
    N4: TMenuItem;
    Ecxelc0620121: TMenuItem;
    N5: TMenuItem;
    dsRRLnr: TpFIBDataSet;
    pfbtrnsctnRRLnr: TpFIBTransaction;
    dsRRLnrFIO: TFIBStringField;
    dsRRLnrSWIDSS: TFIBStringField;
    dsRRLnrNOMER_B: TFIBStringField;
    dsRRLnrCODEILL: TFIBIntegerField;
    dsRRLnrDATAFR: TFIBStringField;
    dsRRLnrDATATO: TFIBStringField;
    dsRRLnrDAYTOT: TFIBIntegerField;
    dsRRLnrDAYSS: TFIBIntegerField;
    dsRRLnrSUMMATOT: TFIBBCDField;
    dsRRLnrSUMMASS: TFIBBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    procedure ReeToExcel;
    procedure ReeToExcelLNR;

  public
    { Public declarations }
  end;

var
  FormReeBoln: TFormReeBoln;

implementation
  uses uFIBModule, UFormReeBolPr, uFormWait,ScrDef,ComObj;

{$R *.dfm}

procedure TFormReeBoln.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      pFIBDataSetRB.Close;
      pFIBDataSetRB.Transaction.Commit;
      if pFIBDataSetRB.UpdateTransaction.Active then
         pFIBDataSetRB.UpdateTransaction.Commit;

      Action:=caFree;
end;

procedure TFormReeBoln.N1Click(Sender: TObject);
var I:Integer;
begin
     i:=pFIBDataSetRBSHIFRID.Value;
      if i>0 then
         begin
              FormReeBolPr:=TFormReeBolPr.CreateRB(I,Self);
              FormReeBolPr.ShowModal;
         end;
end;

procedure TFormReeBoln.FormCreate(Sender: TObject);
begin
      pFIBDataSetRB.Transaction.StartTransaction;
      pFIBDataSetRB.Open;
end;

procedure TFormReeBoln.N2Click(Sender: TObject);
 var SQLStmnt:string;
     I:integer;
begin
      i:=pFIBDataSetRBSHIFRID.Value;
      if i<=0 then Exit;

      pFIBQueryB.Transaction.StartTransaction;
      pFIBQueryB.SQL.Clear;
      SQLStmnt := 'select retval from PR_FILL_REEB_SUM('+IntToStr(I)+')';
      pFIBQueryB.SQL.Add(SQLStmnt);
      FormWait.Show;
      pFIBQueryB.ExecQuery;
      FormWait.Hide;
      pFIBQueryB.Close;
      pFIBQueryB.Transaction.Commit;
      pFIBDataSetRB.RefResh;
end;

procedure TFormReeBoln.N3Click(Sender: TObject);
var i:integer;
begin
      i:=pFIBDataSetRBSHIFRID.Value;
      if i<=0 then Exit;
      pFIBDataSetRR.Transaction.StartTransaction;
      pFIBDataSetRR.Params[0].AsInteger:=i;
      pFIBDataSetRR.Open;
      frxReportRR.ShowReport;
      pFIBDataSetRR.Close;
      pFIBDataSetRR.Transaction.Commit;

end;

procedure TFormReeBoln.N5Click(Sender: TObject);
var i:integer;
begin
      i:=pFIBDataSetRBSHIFRID.Value;
      if i<=0 then Exit;
      pFIBDataSetRR.Transaction.StartTransaction;
      pFIBDataSetRR.Params[0].AsInteger:=i;
      pFIBDataSetRR.Open;
      frxReportRR.ShowReport;
      pFIBDataSetRR.Close;
      pFIBDataSetRR.Transaction.Commit;

end;

procedure TFormReeBoln.N4Click(Sender: TObject);
begin
     {$IFDEF SVDN}
     ReeToExcel;
     {$ELSE}
     ReeToExcelLNR;
     {$ENDIF}
end;


procedure TFormReeBoln.ReeToExcel;
var E:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    LineNo,I:Integer;
    FirstLine,LastLine:Integer;
    FormulaS:string;
begin
     FName:=TemplateDIR+'BolnRee.xlt';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     i:=pFIBDataSetRBSHIFRID.Value;
     if i<=0 then Exit;
     pFIBDataSetRR062012.Transaction.StartTransaction;
     pFIBDataSetRR062012.Params[0].AsInteger:=i;
     pFIBDataSetRR062012.Open;
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     LineNo:=0;
     ExRow:=10;
     ExCol:=1;
     FirstLine:=ExRow+1;
     while not pFIBDataSetRR062012.Eof do
       begin
             Inc(LineNo);
             Inc(ExRow);
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=LineNo;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=pFIBDataSetRR062012FIO.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=pFIBDataSetRR062012SWIDSS.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=pFIBDataSetRR062012NOMER_B.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=pFIBDataSetRR062012CODEILL.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=pFIBDataSetRR062012datafr.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=pFIBDataSetRR062012datato.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=pFIBDataSetRR062012DAYTOT.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]:=pFIBDataSetRR062012DAYSS.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10]:=pFIBDataSetRR062012SUMMATOT.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11]:=pFIBDataSetRR062012SUMMASS.Value;
             pFIBDataSetRR062012.Next;
       end;
      pFIBDataSetRR062012.Close;
      pFIBDataSetRR062012.Transaction.Commit;
      LastLine:=ExRow;
      if LastLine>FirstLine then
         begin
              FormulaS:='=SUM(H'+IntToStr(FirstLine)+':H'+IntToStr(LastLine)+')';
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,8].Formula:=FormulaS;
              FormulaS:='=SUM(I'+IntToStr(FirstLine)+':I'+IntToStr(LastLine)+')';
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,9].Formula:=FormulaS;
              FormulaS:='=SUM(J'+IntToStr(FirstLine)+':J'+IntToStr(LastLine)+')';
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,10].Formula:=FormulaS;
              FormulaS:='=SUM(K'+IntToStr(FirstLine)+':K'+IntToStr(LastLine)+')';
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,11].Formula:=FormulaS;
         end;

end;

procedure TFormReeBoln.ReeToExcelLNR;
var E:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    LineNo,I:Integer;
    FirstLine,LastLine:Integer;
    FormulaS:string;
begin
     FName:=TemplateDIR+'BolnRee_LNR.xlt';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует шаблон '+FName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     i:=pFIBDataSetRBSHIFRID.Value;
     if i<=0 then Exit;
     dsRRLnr.Transaction.StartTransaction;
     dsRRLnr.Params[0].AsInteger:=i;
     dsRRLnr.Open;
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     LineNo:=0;
     ExRow:=11;
     ExCol:=1;
     FirstLine:=ExRow+1;
     while not dsRRLnr.Eof do
       begin
             Inc(LineNo);
             Inc(ExRow);
             E.WorkBooks[1].WorkSheets[1].Rows[ExRow].Insert;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=LineNo;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=dsRRLnrFIO.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=dsRRLnrSWIDSS.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=dsRRLnrNOMER_B.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=dsRRLnrCODEILL.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]:=dsRRLnrdatafr.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]:=dsRRLnrdatato.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]:=dsRRLnrDAYTOT.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]:=dsRRLnrDAYSS.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10]:=dsRRLnrSUMMATOT.Value;
             E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11]:=dsRRLnrSUMMASS.Value;
             dsRRLnr.Next;
       end;
      dsRRLnr.Close;
      dsRRLnr.Transaction.Commit;
      LastLine:=ExRow;
      if LastLine>FirstLine then
         begin
              FormulaS:='=SUM(H'+IntToStr(FirstLine)+':H'+IntToStr(LastLine)+')';
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,8].Formula:=FormulaS;
              FormulaS:='=SUM(I'+IntToStr(FirstLine)+':I'+IntToStr(LastLine)+')';
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,9].Formula:=FormulaS;
              FormulaS:='=SUM(J'+IntToStr(FirstLine)+':J'+IntToStr(LastLine)+')';
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,10].Formula:=FormulaS;
              FormulaS:='=SUM(K'+IntToStr(FirstLine)+':K'+IntToStr(LastLine)+')';
              E.WorkBooks[1].WorkSheets[1].Cells[ExRow+1,11].Formula:=FormulaS;
         end;
end;


end.
