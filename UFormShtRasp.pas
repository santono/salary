unit UFormShtRasp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, ExtCtrls;

type
  TFormShtRasp = class(TForm)
    dtFr: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    dtTo: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsRep: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsRepTABNO: TFIBIntegerField;
    dsRepFIO: TFIBStringField;
    dsRepDOLG: TFIBStringField;
    dsRepOKLAD: TFIBBCDField;
    dsRepCOMMENT: TFIBStringField;
    dsRepSUMMAOPL: TFIBBCDField;
    dsRepSUMMAOKL: TFIBBCDField;
    dsRepSUMMAST: TFIBBCDField;
    dsRepSUMMAZW: TFIBBCDField;
    dsRepSUMMAVYSL: TFIBBCDField;
    dsRepPROCST: TFIBBCDField;
    dsRepPROCZW: TFIBBCDField;
    dsRepPROCVYSL: TFIBBCDField;
    rgKat: TRadioGroup;
    dsByKaf: TpFIBDataSet;
    dsByKafTABNO: TFIBIntegerField;
    dsByKafFIO: TFIBStringField;
    dsByKafDOLG: TFIBStringField;
    dsByKafOKLAD: TFIBBCDField;
    dsByKafCOMMENT: TFIBStringField;
    dsByKafSUMMAOPL: TFIBBCDField;
    dsByKafSUMMAOKL: TFIBBCDField;
    dsByKafSUMMAST: TFIBBCDField;
    dsByKafSUMMAZW: TFIBBCDField;
    dsByKafSUMMAVYSL: TFIBBCDField;
    dsByKafPROCST: TFIBBCDField;
    dsByKafPROCZW: TFIBBCDField;
    dsByKafPROCVYSL: TFIBBCDField;
    dsByKafSHIFRKAF: TFIBIntegerField;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure ReportToExcel(shifrkat:integer);
    procedure ReportToExcelByKaf(shifrkat:integer);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormShtRasp: TFormShtRasp;

implementation
 uses UFibModule,ScrDef,scrUtil,comObj,uFormWait, dateUtils;

{$R *.dfm}

procedure TFormShtRasp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormShtRasp.FormCreate(Sender: TObject);
begin
     rgKat.ItemIndex:=1;
     dtFr.Date:=Date;
     dtTo.Date:=Date;
end;

procedure TFormShtRasp.BitBtn1Click(Sender: TObject);
var shifrkat:Integer;
    dsFr,dsTo:string;
begin
     if dtFr.date>dtTo.date then
        begin
             ShowMessage('Неверно указаны даты');
             Exit;
        end;
     shifrkat:=rgKat.ItemIndex+1;
     if ((ShifrKat<1) or (shifrkat>5)) then
        begin
             ShowMessage('Неверно указана категория');
             Exit;
        end;
     dsRep.Transaction.StartTransaction;
     dsFr:=IntToStr(YearOf(dtFr.Date))+'-'+IntToStr(MonthOf(dtFr.Date))+'-01';
     dsTo:=IntToStr(YearOf(dtTo.Date))+'-'+IntToStr(MonthOf(dtTo.Date))+'-28';
     dsRep.Params[0].AsString:=dsFr;
     dsRep.Params[1].AsString:=dsTo;
 //    dsRep.Params[0].AsDate:=dtFr.Date;
 //    dsRep.Params[1].AsDate:=dtTo.Date;
     dsRep.Params[2].AsInteger:=shifrkat;
     FormWait.Show;
     Application.ProcessMessages;
     dsRep.Open;
     FormWait.Hide;
     Application.ProcessMessages;
     ReportToExcel(shifrkat);
     dsRep.Close;
     dsRep.Transaction.Commit;

end;

procedure TFormShtRasp.ReportToExcel(shifrkat:integer);
var E,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    LineNo:Integer;
    SKat:string;
 begin
     FName:=TemplateDIR+'SwodSht.xlt';
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
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     case shifrkat of
      1 : SKat:='АУП';
      2 : SKat:='ППС';
      3 : SKat:='УВП';
      4 : SKat:='АХЧ';
      5 : SKat:='Н.С.';
      else
          SKat:='Не указано';
     end;
     E.WorkBooks[1].WorkSheets[1].Cells[2,2] := 'Свод за период с '+DateToStr(dtFr.Date)+' по '+DateToStr(dtTo.Date);
     E.WorkBooks[1].WorkSheets[1].Cells[3,2] := SKat;
     LineNo:=0;
     ExRow:=6;
     while (not dsRep.Eof) do
       begin
     //       ExCol:=11;
            inc(LineNo);
            Inc(ExRow);
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=Lineno;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=Trim(dsRepFIO.Value);
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=Trim(dsRepDOLG.Value);
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=Trim(dsRepCOMMENT.Value);
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=dsRepSUMMAOPL.Value;
            dsRep.Next;
       end;
  //   e.Free;
 end;

procedure TFormShtRasp.BitBtn3Click(Sender: TObject);
var shifrkat:Integer;
    dsFr,dsTo:string;
begin
     if dtFr.date>dtTo.date then
        begin
             ShowMessage('Неверно указаны даты');
             Exit;
        end;
     shifrkat:=rgKat.ItemIndex+1;
     if ((ShifrKat<1) or (shifrkat>5)) then
        begin
             ShowMessage('Неверно указана категория');
             Exit;
        end;
     dsByKaf.Transaction.StartTransaction;
     dsFr:=IntToStr(YearOf(dtFr.Date))+'-'+IntToStr(MonthOf(dtFr.Date))+'-01';
     dsTo:=IntToStr(YearOf(dtTo.Date))+'-'+IntToStr(MonthOf(dtTo.Date))+'-28';
     dsByKaf.Params[0].AsString:=dsFr;
     dsByKaf.Params[1].AsString:=dsTo;
 //    dsRep.Params[0].AsDate:=dtFr.Date;
 //    dsRep.Params[1].AsDate:=dtTo.Date;
     dsByKaf.Params[2].AsInteger:=shifrkat;
     FormWait.Show;
     Application.ProcessMessages;
     dsByKaf.Open;
     FormWait.Hide;
     Application.ProcessMessages;
     ReportToExcelByKaf(shifrkat);
     dsByKaf.Close;
     dsByKaf.Transaction.Commit;

end;
procedure TFormShtRasp.ReportToExcelByKaf(shifrkat:integer);
var E,WC:Variant;
    FName,S:String;
    ExRow,ExCol:integer;
    LineNo:Integer;
    SKat:string;
    CurrPodr:Integer;
 begin
     FName:=TemplateDIR+'SwodSht.xlt';
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
     E.Visible:=True;
     E.WorkBooks.Open(FName);
     case shifrkat of
      1 : SKat:='АУП';
      2 : SKat:='ППС';
      3 : SKat:='УВП';
      4 : SKat:='АХЧ';
      5 : SKat:='Н.С.';
      else
          SKat:='Не указано';
     end;
     E.WorkBooks[1].WorkSheets[1].Cells[2,2] := 'Свод за период с '+DateToStr(dtFr.Date)+' по '+DateToStr(dtTo.Date);
     E.WorkBooks[1].WorkSheets[1].Cells[3,2] := SKat;
     LineNo:=0;
     ExRow:=6;
     CurrPodr:=0;
     while (not dsByKaf.Eof) do
       begin
     //       ExCol:=11;
            inc(LineNo);
            Inc(ExRow);
            if CurrPodr<>dsByKafSHIFRKAF.Value then
               begin
                    LineNo:=1;
                    CurrPodr:=dsByKafSHIFRKAF.Value;
                    SKat:=Name_Serv(CurrPodr);
                    E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=SKat;
                    inc(ExRow);
               end;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=Lineno;
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=Trim(dsByKafFIO.Value);
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=Trim(dsByKafDOLG.Value);
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=Trim(dsByKafCOMMENT.Value);
            E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]:=dsByKafSUMMAOPL.Value;
            dsByKaf.Next;
       end;
  //   e.Free;
 end;

end.
