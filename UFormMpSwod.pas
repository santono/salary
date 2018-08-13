unit UFormMpSwod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, FIBQuery, pFIBQuery,
  FIBDatabase, pFIBDatabase;

type
  TFormMPSwod = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBQueryMkMP: TpFIBQuery;
    RadioGroup2: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
     WantedData:TDate;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMPSwod: TFormMPSwod;

implementation
 uses uFIBModule,ScrDef,UFormWait,ComObj,ScrUtil;

{$R *.dfm}

procedure TFormMPSwod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormMPSwod.FormCreate(Sender: TObject);
var y,m,d:word;
begin
     y:=CURRYEAR;
     M:=nmes;
     d:=10;
     WantedData:=EnCodeDate(y,m,d);;
     DateTimePicker1.Date:=WantedData;
     RadioGroup1.ItemIndex:=0;
     RadioGroup2.ItemIndex:=0;
end;

procedure TFormMPSwod.BitBtn1Click(Sender: TObject);
var y,m,d:word;
    Mode,PodrMode:integer;
    SummaMPBud , SummaMPVne,
    SummaOzdBud , SummaOzdVne,
    SummaPoBud , SummaPoVne :real;
    FName,S:String;
    E:Variant;
    StartRow:integer;
    ExRow,ExCol,I_Mode,LineNo:integer;
    NameDolg:STring;
begin
      FName:=TemplateDIR+'MP_OZD_CL.xls';
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
      E.WorkBooks.Open(FName);


      WantedData := DateTimePicker1.Date;
      DeCodeDate(WantedData,y,m,d);
      Mode:=RadioGroup1.ItemIndex;
      if Mode=1 then m:=0;
      PodrMode:=RadioGroup2.ItemIndex+1;
      if ((PodrMode<1) or (PodrMode>2)) then
         PodrMode:=1;
      S:=IntToStr(Y);
      if m=0 then S:='За весь '+S+' год'
             else
         begin
              S:='За '+trim(GetMonthRus(M))+' '+S+' года';
         end;
      if (PodrMode=2) then S:=trim(S)+' '+trim(' - коледж')
                      else S:=trim(S)+' '+trim(' - университет без коледжа');
      ExRow:=2;
      ExCol:=3;
      E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=S;
      StartRow := 5;
      for I_Mode:=1 to 3 do
          begin
               if pFIBQueryMkMP.Open then
                  pFIBQueryMkMP.Close;
               pFIBQueryMkMP.SQL.Clear;
               pFIBQueryMkMP.SQL.Add('select shifrdol,');
               pFIBQueryMkMP.SQL.Add('                (select first 1 tb_dolg.name from tb_dolg where tb_dolg.shifrdol=pr_mk_swod_mathelp.shifrdol),');
               pFIBQueryMkMP.SQL.Add('                sum(SUMMA_MP_BUD),');
               pFIBQueryMkMP.SQL.Add('                sum(SUMMA_MP_VNE),');
               pFIBQueryMkMP.SQL.Add('                sum(SUMMA_OZD_BUD),');
               pFIBQueryMkMP.SQL.Add('                sum(SUMMA_OZD_VNE),');
               pFIBQueryMkMP.SQL.Add('                sum(SUMMA_POCH_BUD),');
               pFIBQueryMkMP.SQL.Add('                sum(SUMMA_POCH_VNE)');
               pFIBQueryMkMP.SQL.Add('from pr_mk_swod_mathelp('+IntToStr(y)+','+IntToStr(m)+','+IntToStr(I_Mode)+','+IntToStr(PodrMode)+')');
               pFIBQueryMkMP.SQL.Add('where abs(SUMMA_MP_BUD)>0.01 or');
               pFIBQueryMkMP.SQL.Add('      abs(SUMMA_MP_VNE)>0.01 or');
               pFIBQueryMkMP.SQL.Add('      abs(SUMMA_OZD_BUD)>0.01 or');
               pFIBQueryMkMP.SQL.Add('      abs(SUMMA_OZD_VNE)>0.01 or');
               pFIBQueryMkMP.SQL.Add('      abs(SUMMA_POCH_BUD)>0.01 or');
               pFIBQueryMkMP.SQL.Add('      abs(SUMMA_POCH_VNE)>0.01');
               pFIBQueryMkMP.SQL.Add('group by 1');
               if not pFIBQueryMkMP.Transaction.Active then
                  pFIBQueryMkMP.Transaction.StartTransaction;
               FormWait.Show;
               Application.ProcessMessages;
               pFIBQueryMkMP.ExecQuery;
               FormWait.Hide;
               SummaMpBud  := 0;
               SummaMpVne  := 0;
               SummaOzdBud := 0;
               SummaOzdVne := 0;
               SummaPoBud  := 0;
               SummaPoVne  := 0;
               ExRow       := StartRow;
               LineNo      := 0;
               while not pFIBQueryMkMP.Eof do
                     begin
                           NameDolg    := pFIBQueryMkMP.Fields[1].AsString;
                           SummaMpBud  := pFIBQueryMkMP.Fields[2].AsFloat;
                           SummaMpVne  := pFIBQueryMkMP.Fields[3].AsFloat;
                           SummaOzdBud := pFIBQueryMkMP.Fields[4].AsFloat;
                           SummaOzdVne := pFIBQueryMkMP.Fields[5].AsFloat;
                           SummaPoBud  := pFIBQueryMkMP.Fields[6].AsFloat;
                           SummaPoVne  := pFIBQueryMkMP.Fields[7].AsFloat;
                           Inc(ExRow);
                           Inc(LineNo);
                           ExCol:=1;
                           if LineNo=1 then
                              case i_mode of
                               1  :
                                   E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:='Преподаватели';
                               2  :
                                   E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:='Специалисты';
                               3  :
                                   E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:='Работники';
                              end;
                           ExCol:=2;
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=NameDolg;
                           Inc(ExCol);
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=SummaMpBud;
                           Inc(ExCol);
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=SummaMpVne;
                           Inc(ExCol);
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=SummaOzdBud;
                           Inc(ExCol);
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=SummaOzdVne;
                           Inc(ExCol);
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=SummaPoBud;
                           Inc(ExCol);
                           E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol]:=SummaPoVne;
                           pFIBQueryMkMP.Next;
                     end;
               pFIBQueryMkMP.Transaction.Commit;
               if pFIBQueryMkMP.Open then
                  pFIBQueryMkMP.Close;
               Inc(StartRow);
               ExCol:=3;
               Inc(ExRow);
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:='Итого';
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol].Formula:='=SUM(C'+IntToStr(StartRow)+':C'+IntToStr(ExRow-1)+')';
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol+1].Formula:='=SUM(D'+IntToStr(StartRow)+':D'+IntToStr(ExRow-1)+')';
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol+2].Formula:='=SUM(E'+IntToStr(StartRow)+':E'+IntToStr(ExRow-1)+')';
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol+3].Formula:='=SUM(F'+IntToStr(StartRow)+':F'+IntToStr(ExRow-1)+')';
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol+4].Formula:='=SUM(G'+IntToStr(StartRow)+':G'+IntToStr(ExRow-1)+')';
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,ExCol+5].Formula:='=SUM(H'+IntToStr(StartRow)+':H'+IntToStr(ExRow-1)+')';
               StartRow := ExRow;
          end;
      E.Visible:=True;
          
end;

end.
