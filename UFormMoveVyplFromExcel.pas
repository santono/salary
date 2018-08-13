unit UFormMoveVyplFromExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc;

type
  TFormMoveVyplFromExcel = class(TForm)
    EditFileName: TEdit;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    cxCalcEditFrom: TcxCalcEdit;
    cxCalcEditTo: TcxCalcEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    pb1: TProgressBar;
    btn1: TBitBtn;
    btn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    fileName:string;
    firstLine:Integer;
    lastLine:Integer;
    procedure MoveFromExcel;

  public
    { Public declarations }
  end;

var
  FormMoveVyplFromExcel: TFormMoveVyplFromExcel;

implementation
  uses ComObj,UFormVyplLNR,uFibModule;

{$R *.dfm}

procedure TFormMoveVyplFromExcel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMoveVyplFromExcel.BitBtn1Click(Sender: TObject);
begin
      if OpenDialog1.Execute then
         begin
              EditFileName.Text:=OpenDialog1.FileName;
              fileName:=OpenDialog1.FileName;
         end     
      else
          Exit;
end;

procedure TFormMoveVyplFromExcel.FormCreate(Sender: TObject);
begin
     fileName:='';
     firstLine:=37;
     lastLine:=1270;
     cxCalcEditFrom.Text:=IntToStr(firstLine);
     cxCalcEditTo.Text:=IntToStr(LastLine);
     EditFilename.Text:=fileName;
end;

procedure TFormMoveVyplFromExcel.btn1Click(Sender: TObject);
 var iVal,iErr:Integer;
begin

     fileName:=Trim(fileName);
     if Length(Trim(fileName))<3 then
        begin
             ShowMessage('Не указан исходный файл');
             Exit;
        end;
     if not FileExists(fileName) then
        begin
             ShowMessage('Не верно указан исходный файл');
             Exit;
        end;
     Val(trim(cxCalcEditFrom.Text),iVal,iErr);
     if iErr<>0 then
        begin
             ShowMessage('Неверно указана начальная строка');
             Exit;
        end;
     firstLine:=iVal;
     Val(trim(cxCalcEditTo.Text),iVal,iErr);
     if iErr<>0 then
        begin
             ShowMessage('Неверно указана последняя строка');
             Exit;
        end;
     lastLine:=iVal;
     if ((firstLine<1) or (firstLine>100)) then
        begin
             ShowMessage('Неверно указана первая строка');
             Exit;
        end;
     if ((lastLine<firstLine) or ((lastLine-firstLine)>2000)) then
        begin
             ShowMessage('Неверно указана последняя строка');
             Exit;
        end;
      MoveFromExcel;

end;
procedure TFormMoveVyplFromExcel.MoveFromExcel;
 var e:Variant;
     iRow:Integer;
     tabno:Integer;
     SummaGrn,SummaRub:Real;
     SummaGrnTot,SummaRubTot:Real;
     SummaGrnS,SummaRubS:string;
     Fio,s:string;
     aVal:Real;
     iVal,iErr:Integer;
     SqlStmnt:string;
 begin
      try
         e:=CreateOleObject('Excel.Application');
      except
         else
          ShowMessage('Ошибка открытия файла Excel');;
      end;
      E.Visible:=false;
      E.WorkBooks.Open(fileName);
      SqlStmnt:='delete from TB_VYPL_LNR_DET where shifridowner='+IntToStr(FormVyplLNR.dsVyplID.Value);
      FIB.pFIBDatabaseSal.Execute(SqlStmnt);
      pb1.Min := 0;
      pb1.Max := lastLine - firstLine + 1;
      pb1.Position := 0;
      SummaGrnTot  := 0;
      SummaRubTot  := 0;
      for iRow:=firstLine to lastLine do
          begin
               pb1.Position:=iRow-firstLine+1;
               Application.ProcessMessages;
               fio      := '';
               SummaRub := 0;
               SummaGrn := 0;
               tabno    := 0;
               s:=E.WorkBooks[1].WorkSheets[1].Cells[iRow,10].Text;
               s:=Trim(s);
               s:=StringReplace(s,',','.',[rfReplaceAll]);
               Val(s,iVal,iErr);
               if (iErr=0) then
               if ((iVal>0) and (iVal<13000))then
                  Tabno:=iVal;
               s   := E.WorkBooks[1].WorkSheets[1].Cells[iRow,22].Text;
               s   := Trim(s);
               fio := Trim(s);
               s:=E.WorkBooks[1].WorkSheets[1].Cells[iRow,58].Text;
               s:=Trim(s);
               s:=StringReplace(s,',','.',[rfReplaceAll]);
               Val(s,aVal,iErr);
               if (iErr=0) then
               if ((aVal>0) and (aVal<25000))then
                  SummaRub:=aVal;
               s:=E.WorkBooks[1].WorkSheets[1].Cells[iRow,84].Text;
               s:=Trim(s);
               s:=StringReplace(s,',','.',[rfReplaceAll]);
               Val(s,aVal,iErr);
               if (iErr=0) then
               if ((aVal>0) and (aVal<25000))then
                  SummaGrn:=aVal;
               if ((tabno>0) and
                   (Length(Trim(fio))>2) and
                   (SummaRub>1) and
                   (SummaGrn>1)
                   ) then
                  begin
                       SummaGrnTot:=SummaGrnTot+SummaGrn;
                       SummaRubTot:=SummaRubTot+SummaRub;
                       SummaRubS:=Format('%12.2f',[SummaRub]);
                       SummaRubS:=StringReplace(SummaRubS,',','.',[rfReplaceAll]);
                       SummaGrnS:=Format('%12.2f',[SummaGrn]);
                       SummaGrnS:=StringReplace(SummaGrnS,',','.',[rfReplaceAll]);

                       SqlStmnt:='insert into TB_VYPL_LNR_DET (TABNO,FIO,SUMMARUB,SUMMAGRN,SHIFRIDOWNER,ISRECEIVED) VALUES (';
                       SqlStmnt:=Trim(SQLStmnt)+intToStr(Tabno)+','''+trim(fio)+''','+SummaRubS+','+SummaGrnS+','+IntToStr(FormVyplLNR.dsVyplID.Value)+',1)';
                       FIB.pFIBDatabaseSal.Execute(SqlStmnt);

                  end;
          end;
      E.WorkBooks.Close;
      E:=null;
      SummaGrnS:=Format('%12.2f',[SummaGrnTot]);
      SummaGrnS:=StringReplace(SummaGrnS,',','.',[rfReplaceAll]);
      SqlStmnt:='UPDATE TB_VYPLATY_LNR SET SUMMA='+SummaGrnS+' ,SUMMAVYPL='+SummaGrnS+' ,SUMMANEVYPL=0.0 where ID='+IntToStr(FormVyplLNR.dsVyplID.Value);
      FIB.pFIBDatabaseSal.Execute(SqlStmnt);

      ShowMessage('Перенос закончен');


 end;


end.
