unit UFormPlanSwod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, frxClass, frxDBSet, FIBQuery,
  pFIBQuery, frxExportRTF, frxExportXLS, frxExportPDF;

type
  TFormPlanSwod = class(TForm)
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    Bi: TBitBtn;
    BitBtn1: TBitBtn;
    pFIBDataSetGrid: TpFIBDataSet;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDataSetGridSUMMAFR: TFIBBCDField;
    pFIBDataSetGridSUMMATO: TFIBBCDField;
    pFIBDataSetGridNMBOFPRSN: TFIBIntegerField;
    pFIBDataSetGridNMBOFWMN: TFIBIntegerField;
    frxDBDatasetGrid: TfrxDBDataset;
    pFIBQueryFondy: TpFIBQuery;
    frxReportFondy: TfrxReport;
    frxReportGrid: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BiClick(Sender: TObject);
    procedure frxReportGridGetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtn1Click(Sender: TObject);
    procedure frxReportFondyManualBuild(Page: TfrxPage);
  private
    { Private declarations }
    CurrKw:integer;
    Y:integer;
    M:integer;
    Mode:integer; {1-univ 2-coledg}
    SummaOsnTotMon , SummaOsnWmnMon , SummaSwmTotMon , SummaSwmWmnMon : real;
    NmbOsnTotMon   , NmbOsnWmnMon   , NmbSwmTotMon   , NmbSwmWmnMon   : integer;
    SummaOsnTotKwa , SummaOsnWmnKwa , SummaSwmTotKwa , SummaSwmWmnKwa : real;
    NmbOsnTotKwa   , NmbOsnWmnKwa   , NmbSwmTotKwa   , NmbSwmWmnKwa   : integer;
    SummaOsnTotYea , SummaOsnWmnYea , SummaSwmTotYea , SummaSwmWmnYea : real;
    NmbOsnTotYea   , NmbOsnWmnYea   , NmbSwmTotYea   , NmbSwmWmnYea   : integer;

    function Swod_To_FR:boolean;

  public
    { Public declarations }
  end;

var
  FormPlanSwod: TFormPlanSwod;

implementation
    uses ScrDef,ScrUtil, uFormWait;

{$R *.dfm}

procedure TFormPlanSwod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormPlanSwod.FormCreate(Sender: TObject);
var DT:TDateTime;
    yw,mw:word;
begin
     y := CurrYear;
     m := nmes;
     case m of
      1,2,3 : CurrKw:=1;
      4,5,6 : CurrKw:=2;
      7,8,9 : CurrKw:=3;
      else  CurrKw:=4;
     end;
     yw:=y;
     mw:=m;
     Dt:=EnCodeDate(yw,mw,1);
     DateTimePicker1.Date:=Dt;
     Mode:=1;
     RadioGroup1.ItemIndex:=0;
end;

procedure TFormPlanSwod.BiClick(Sender: TObject);
var Dt:TDateTime;
    yw,mw,dw:word;
    SQLStmnt:string;
begin
     Dt:=DateTimePicker1.Date;
     DecodeDate(dt,yw,mw,dw);
     y := yw;
     m := mw;
     case m of
      1,2,3 : CurrKw:=1;
      4,5,6 : CurrKw:=2;
      7,8,9 : CurrKw:=3;
      else  CurrKw:=4;
     end;
     Mode:=RadioGroup1.ItemIndex+1;
     if ((Mode>2) or (Mode<1)) then Mode:=1;
     pFIBDataSetGrid.Params[0].AsInteger:=y;
     pFIBDataSetGrid.Params[1].AsInteger:=m;
     pFIBDataSetGrid.Params[2].AsInteger:=mode;
     pFIBDataSetGrid.Transaction.StartTransaction;
     FormWait.Show;
     Application.ProcessMessages;
     pFIBDataSetGrid.Open;
     FormWait.Hide;
     Application.ProcessMessages;
     frxReportGrid.ShowReport;
     pFIBDataSetGrid.Close;
     pFIBDataSetGrid.Transaction.Commit;

end;

procedure TFormPlanSwod.frxReportGridGetValue(const VarName: String;
  var Value: Variant);
 var s:string;
begin
     if trim(VarName)='d' then
        begin
             if Mode=2 then S:='коледж'
             else S:='университет';
             s:=s+' '+GetMonthRus(m);
             s:=s+' '+IntToStr(Y)+' г.';
             value:=s;
        end;
end;

procedure TFormPlanSwod.BitBtn1Click(Sender: TObject);
var SQLStmnt:string;
    Dt:TDateTime;
    yw,mw,dw:word;

begin

     Dt:=DateTimePicker1.Date;
     DecodeDate(dt,yw,mw,dw);
     y := yw;
     m := mw;
     case m of
      1,2,3 : CurrKw:=1;
      4,5,6 : CurrKw:=2;
      7,8,9 : CurrKw:=3;
      else  CurrKw:=4;
     end;
     Mode:=RadioGroup1.ItemIndex+1;
     if ((Mode>2) or (Mode<1)) then Mode:=1;


    FormWait.Show;
    Application.ProcessMessages;
    SQLStmnt:='select nmbosntot,summaosntot,nmbosnwmn,summaosnwmn,nmbswmtot,summaswmtot,nmbswmwmn,summaswmwmn from PR_PLAN_FOND_MK('+IntToStr(Y)+','+IntToStr(M)+','+IntToStr(Mode)+',1)';
    pFIBQueryFondy.SQL.Add(SQLStmnt);
    pFIBQueryFondy.Transaction.StartTransaction;
    pFIBQueryFondy.ExecQuery;
    NmbOsnTotMon   := pFIBQueryFondy.Fields[0].AsInteger;
    SummaOsnTotMon := pFIBQueryFondy.Fields[1].AsFloat;
    NmbOsnWmnMon   := pFIBQueryFondy.Fields[2].AsInteger;
    SummaOsnWmnMon := pFIBQueryFondy.Fields[3].AsFloat;
    NmbSwmTotMon   := pFIBQueryFondy.Fields[4].AsInteger;
    SummaSwmTotMon := pFIBQueryFondy.Fields[5].AsFloat;
    NmbSwmWmnMon   := pFIBQueryFondy.Fields[6].AsInteger;
    SummaSwmWmnMon := pFIBQueryFondy.Fields[7].AsFloat;
    pFIBQueryFondy.Close;
    pFIBQueryFondy.SQL.Clear;
    SQLStmnt:='select nmbosntot,summaosntot,nmbosnwmn,summaosnwmn,nmbswmtot,summaswmtot,nmbswmwmn,summaswmwmn from PR_PLAN_FOND_MK('+IntToStr(Y)+','+IntToStr(m)+','+IntToStr(Mode)+',2)';
    pFIBQueryFondy.SQL.Add(SQLStmnt);
    pFIBQueryFondy.Transaction.StartTransaction;
    pFIBQueryFondy.ExecQuery;
    NmbOsnTotKwa   := pFIBQueryFondy.Fields[0].AsInteger;
    SummaOsnTotKwa := pFIBQueryFondy.Fields[1].AsFloat;
    NmbOsnWmnKwa   := pFIBQueryFondy.Fields[2].AsInteger;
    SummaOsnWmnKwa := pFIBQueryFondy.Fields[3].AsFloat;
    NmbSwmTotKwa   := pFIBQueryFondy.Fields[4].AsInteger;
    SummaSwmTotKwa := pFIBQueryFondy.Fields[5].AsFloat;
    NmbSwmWmnKwa   := pFIBQueryFondy.Fields[6].AsInteger;
    SummaSwmWmnKwa := pFIBQueryFondy.Fields[7].AsFloat;
    pFIBQueryFondy.Close;
    pFIBQueryFondy.SQL.Clear;
    SQLStmnt:='select nmbosntot,summaosntot,nmbosnwmn,summaosnwmn,nmbswmtot,summaswmtot,nmbswmwmn,summaswmwmn from PR_PLAN_FOND_MK('+IntToStr(Y)+','+IntToStr(m)+','+IntToStr(Mode)+',3)';
    pFIBQueryFondy.SQL.Add(SQLStmnt);
    pFIBQueryFondy.Transaction.StartTransaction;
    pFIBQueryFondy.ExecQuery;
    NmbOsnTotYea   := pFIBQueryFondy.Fields[0].AsInteger;
    SummaOsnTotYea := pFIBQueryFondy.Fields[1].AsFloat;
    NmbOsnWmnYea   := pFIBQueryFondy.Fields[2].AsInteger;
    SummaOsnWmnYea := pFIBQueryFondy.Fields[3].AsFloat;
    NmbSwmTotYea   := pFIBQueryFondy.Fields[4].AsInteger;
    SummaSwmTotYea := pFIBQueryFondy.Fields[5].AsFloat;
    NmbSwmWmnYea   := pFIBQueryFondy.Fields[6].AsInteger;
    SummaSwmWmnYea := pFIBQueryFondy.Fields[7].AsFloat;
    pFIBQueryFondy.Close;
    pFIBQueryFondy.Transaction.Commit;
    FormWait.Hide;
    Application.ProcessMessages;
    frxReportFondy.ShowReport;
end;

procedure TFormPlanSwod.frxReportFondyManualBuild(Page: TfrxPage);
begin
     Swod_To_FR;
end;

function TFormPlanSwod.Swod_To_FR:boolean;
 var
    s:string;

 begin

       s:=GetMonthRus(m)+' '+IntToStr(Y)+' г.';
       frxReportFondy.Variables['d']:=''''+s+'''';
       s:=FORMAT('%6d',[NmbOsnTotMon]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbOsnTotMon']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaOsnTotMon]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['t']:=''''+s+'''';
       frxReportFondy.Variables['SummaOsnTotMon']:=''''+s+'''';
       s:=FORMAT('%6d',[NmbOsnWmnMon]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbOsnWmnMon']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaOsnWmnMon]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaOsnWmnMon']:=''''+s+'''';


       s:=FORMAT('%6d',[NmbSwmTotMon]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbSwmTotMon']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaSwmTotMon]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaSwmTotMon']:=''''+s+'''';
       s:=FORMAT('%6d',[NmbSwmWmnMon]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbSwmWmnMon']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaSwmWmnMon]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaSwmWmnMon']:=''''+s+'''';



       s:=FORMAT('%6d',[NmbOsnTotKwa]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbOsnTotKwa']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaOsnTotKwa]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaOsnTotKwa']:=''''+s+'''';
       s:=FORMAT('%6d',[NmbOsnWmnKwa]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbOsnWmnKwa']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaOsnWmnKwa]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaOsnWmnKwa']:=''''+s+'''';


       s:=FORMAT('%6d',[NmbSwmTotKwa]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbSwmTotKwa']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaSwmTotKwa]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaSwmTotKwa']:=''''+s+'''';
       s:=FORMAT('%6d',[NmbSwmWmnKwa]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbSwmWmnKwa']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaSwmWmnKwa]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaSwmWmnKwa']:=''''+s+'''';


       s:=FORMAT('%6d',[NmbOsnTotYea]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbOsnTotYea']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaOsnTotYea]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaOsnTotYea']:=''''+s+'''';
       s:=FORMAT('%6d',[NmbOsnWmnYea]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbOsnWmnYea']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaOsnWmnYea]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaOsnWmnYea']:=''''+s+'''';


       s:=FORMAT('%6d',[NmbSwmTotYea]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbSwmTotYea']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaSwmTotYea]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaSwmTotYea']:=''''+s+'''';
       s:=FORMAT('%6d',[NmbSwmWmnYea]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['NmbSwmWmnYea']:=''''+s+'''';
       s:=FORMAT('%15.2f',[SummaSwmWmnYea]);
       s:=ReplChar(S,',','-');
       frxReportFondy.Variables['SummaSwmWmnYea']:=''''+s+'''';
       frxReportFondy.Engine.ShowBand(frxReportFondy.FindObject('MasterData1') as TfrxMasterData);
 end;
end.
