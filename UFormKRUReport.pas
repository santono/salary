unit UFormKRUReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormKRUReport = class(TForm)
    rgGruppy: TRadioGroup;
    rgKoledg: TRadioGroup;
    ButtonStart: TButton;
    BitBtn1: TBitBtn;
    dsKRU: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsKRUY: TFIBIntegerField;
    dsKRUM: TFIBIntegerField;
    dsKRUSHIFRSTA: TFIBBCDField;
    dsKRUNAME: TFIBStringField;
    dsKRUMODE: TFIBIntegerField;
    dsKRUISKOLEDG: TFIBIntegerField;
    dsKRUSUMMA: TFIBBCDField;
    cbGenerate: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ButtonStartClick(Sender: TObject);
  private
    procedure makeKRUReport;
    function getCol(shifrSta:integer):integer;
    function getRow(y:integer;m:integer):integer;
    procedure hideZeroColumns;
    procedure generateInDB;
    procedure addToList(y:integer;m:integer;shifrsta:integer;summa:real);


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormKRUReport: TFormKRUReport;

implementation
  uses comobj,UFibModule,ScrDef,uFormWait,ExcelXP;

{$R *.dfm}

 type pRec=^tRec;
      tRec=record
             shifrSta:integer;
             y:integer;
             m:integer;
             mode:integer;
             isKoledg:integer;
             summa:real;
           end;
  const startcol =  2;
        endcol   = 62;
        summaRow = 46;
        shifrRow =  4;

 var v:Variant;
     list:TList;
procedure TFormKRUReport.FormCreate(Sender: TObject);
begin
    rgGruppy.ItemIndex:=0;
    rgKoledg.ItemIndex:=0;
end;

procedure TFormKRUReport.ButtonStartClick(Sender: TObject);
begin
      makeKRUReport;
end;

 procedure TFormKRUReport.hideZeroColumns;
  var i:integer;

  function needHideCol(col:Integer):Boolean;
   var retVal:Boolean;
       a:real;
   begin
       retVal:=true;
       a:=V.WorkBooks[1].WorkSheets[1].Cells[summaRow,col];
       if Abs(a)>0.005 then
          retVal:=False;
       needHideCol:=retVal;
   end;

  begin
        for i:=StartCol to EndCol do
            if needHideCol(i) then
               V.WorkBooks[1].WorkSheets[1].Columns[i].Hidden:=true;
  end;
procedure TFormKRUReport.addToList(y:integer;m:integer;shifrsta:integer;summa:real);
  var rec    : pRec;
      finded : boolean ;
      i      : integer ;
  begin
       finded := false;
       if list.count>0 then
          for i:=0 to list.count-1 do
              if ((pRec(list.Items[i]).y=y)
                  and
                  (pRec(list.Items[i]).m=m)
                  and
                  (pRec(list.Items[i]).shifrSta=shifrSta)) then
                 begin
                      finded:=true;
                      pRec(list.Items[i]).summa:=pRec(list.Items[i]).summa + summa;
                      break;
                 end;
       if not finded then
          begin
               new(rec);
               Rec.y:=y;
               Rec.m:=m;
               Rec.shifrsta:=shifrsta;
               Rec.summa:=summa;
               list.Add(Rec);
          end;
  end;
function TFormKRUReport.getCol(shifrSta:integer):integer;
  var retVal:integer;
      i:integer;
      va:integer;
  begin
       retVal:=0;
       for i:=startcol to endcol do
           begin
                 va:=v.WorkBooks[1].WorkSheets[1].cells[shifrRow,i];
                 if va=shifrSta then
                    begin
                         retval:=i;
                         break;
                    end;
           end;
       getCol:=retVal;
  end;
function TFormKRUReport.getRow(y:integer;m:integer):integer;
  const rowbase=-5;
  var retVal:integer;
      i:integer;
      yy:integer;
  begin
       retVal:=0;
       yy:=y-2016;
       if ((yy<0) or (yy>3)) then
          begin
               getRow:=retVal;
               exit;
          end;
       retval:=rowbase+(13*yy)+m;
       if ((retval<6) or (retval>44)) then
          begin
               getRow:=0;
               exit;
          end;
       getRow:=retVal;
  end;
procedure TFormKRUReport.generateInDB;
 var SQLStmnt:string;
 begin
      SQLStmnt:='execute procedure pr_kru_filltable '+intToStr(rgGruppy.ItemIndex);
      FormWait.Show;
      Application.ProcessMessages;
      fib.pFIBDatabaseSal.Execute(SQLStmnt);
      FormWait.Hide;
      Application.ProcessMessages;
 end;
procedure TFormKRUReport.makeKRUReport;
 type trec=record
               y:integer;
               m:integer;
               summa:real;
               shifrsta:integer;
               mode:integer;
          end;
 var FName:string;
     filterString:string;
     rec:trec;
     currCol:integer;
     currRow:integer;
     i:integer;
begin
     if cbGenerate.Checked then
        generateInDB;
     fName:=TemplateDIR+'KRU_2019.xlt';

     if not fileexists(fName) then
        begin
             showMessage('Отсутствует файл '+fName);
             exit;
        end;
     dsKRU.Transaction.StartTransaction;
     filterString:='';
     if rgKoledg.ItemIndex=1 then
        filterString:='ISKOLEDG=1'
     else
        filterString:='ISKOLEDG=0';
     dsKRU.Filter   := filterString;
     dsKRU.Filtered := true;
     dsKRU.Open;
     try
        V:=CreateOleObject('Excel.Application');
     except
        on e:Exception do
           begin
                ShowMessage('Ошибка запуска Excel '+E.Message);
                Exit;
           end;
     end;
        //     showMessage('Ole создан');


     V.WorkBooks.Open(FName);
     V.Visible:=false;
//     V.Workbooks[1].WorkSheets[1].EnableCalculation:=0;
//     V.DisplayAlerts:=False;
//     V.Calculation:=xlManual;
//     V.ScreenUpdating := false;

     FormWait.Show;
     Application.ProcessMessages;
     list:=TList.Create;
     while not dsKRU.Eof do
       begin
            rec.y:=dsKRUY.Value;
            rec.m:=dsKRUM.Value;
            rec.summa:=dsKRUSUMMA.Value;
            rec.shifrsta:=dsKRUSHIFRSTA.Value;
            rec.mode:=dsKRUMODE.Value;
            if (rec.mode=21) then
               begin
                    rec.shifrsta:=201;
                    addToList(rec.y,rec.m,201,rec.summa);
               end
            else
            if (rec.mode=22) then
               begin
                    rec.shifrsta:=202;
                    addToList(rec.y,rec.m,202,rec.summa);
               end
            else
               begin
                 currCol:=getCol(rec.shifrsta);
                 if currCol>0 then
                    begin
                        currRow:=getRow(rec.y,rec.m);
                        if currRow>0 then
                           v.WorkBooks[1].WorkSheets[1].cells[currRow,currCol]:=rec.summa;
                    end;
               end;
            dsKRU.Next;
       end;
     if list.count>0 then
        begin
             for i:=0 to list.Count-1 do
                 begin
                      rec.shifrsta := pRec(list.Items[i]).shifrSta;
                      rec.y := pRec(list.Items[i]).y;
                      rec.m := pRec(list.Items[i]).m;
                      rec.summa :=  pRec(list.Items[i]).summa;
                      currCol:=getCol(rec.shifrsta);
                      if currCol>0 then
                         begin
                             currRow:=getRow(rec.y,rec.m);
                             if currRow>0 then
                           v.WorkBooks[1].WorkSheets[1].cells[currRow,currCol]:=rec.summa;
                         end;
                 end;
             for i:=0 to list.Count-1 do
                      dispose(pRec(list.Items[i]));
        end;
     list.Free;   
     hideZeroColumns;
     FormWait.Hide;
     Application.ProcessMessages;
     dsKRU.Close;
     dsKRU.Transaction.Commit;
     V.Visible:=true;
//     V.Workbooks[1].WorkSheets[1].EnableCalculation:=1;
//     V.DisplayAlerts:=True;
//     V.Calculation:=xlAutomatic;
//     V.ScreenUpdating := true;


end;


end.
