unit UFormRepFondySVDN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef;

type
  TFormRepFondySVDN = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dtIn: TDateTimePicker;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    dsFondy: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsFondyRAZR: TFIBIntegerField;
    dsFondyNMBOFPERS: TFIBBCDField;
    dsFondySUMMAFOP: TFIBBCDField;
    dsFondySUMMAOKL: TFIBBCDField;
    dsFondySUMMADOPLO: TFIBBCDField;
    dsFondySUMMADOPLN: TFIBBCDField;
    dsFondySUMMADOMIN: TFIBBCDField;
    dsFondySUMMAPREM: TFIBBCDField;
    dsFondySUMMAOTH: TFIBBCDField;
    dsFondySUMMAPREM102: TFIBBCDField;
    dsFondyNMBOFPERS1: TFIBBCDField;
    dsFondySUMMAFOP1: TFIBBCDField;
    dsFondySUMMAOKL1: TFIBBCDField;
    dsFondySUMMADOPLO1: TFIBBCDField;
    dsFondySUMMADOPLN1: TFIBBCDField;
    dsFondySUMMADOMIN1: TFIBBCDField;
    dsFondySUMMAOTH1: TFIBBCDField;
    dsFondySUMMAPREM1021: TFIBBCDField;
    dsFondySUMMAPREM1: TFIBBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure CreateReport;
//    procedure moveToExcel;
    procedure SwodToExcel;
//    function initListPlanRecs:boolean;

  public
    { Public declarations }
  end;

var
  FormRepFondySVDN: TFormRepFondySVDN;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists;


{$R *.dfm}

procedure TFormRepFondySVDN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepFondySVDN.FormCreate(Sender: TObject);
begin
     dtIn.Date        := IncMonth(Date,-1);

end;

procedure TFormRepFondySVDN.BitBtn1Click(Sender: TObject);
begin
     CreateReport;
end;

procedure TFormRepFondySVDN.CreateReport;
  var savNMES,savNSRV:integer;
      iNSRV,i:Integer;
      curr_person:PERSON_PTR;
  begin
       FormWait.Show;
       Application.ProcessMessages;
       dsFondy.Transaction.StartTransaction;
       dsFondy.Open;
       swodToExcel;
       FormWait.Hide;
       Application.ProcessMessages;
       dsFondy.Close;
       dsFondy.Transaction.commit;
  end;

procedure TFormRepFondySVDN.SwodToExcel;
var E,WC:Variant;
    FName,S:String;
    k,i:integer;
    exRow:integer;
    h:string;
    j:integer;
    razr:integer;
    finded:boolean;
    summaFop,summaFop1:real;
begin
//     FName:=TemplateDIR+'WorkersPlan.xlt';
     FName:=TemplateDIR+'FOP_2019.xlt';
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
     exRow:=11;
     for i:=1 to 25 do
         begin
               summaFop:=dsFondySUMMAOKL.Value
                        +dsFondySUMMADOPLO.Value
                        +dsFondySUMMADOPLN.Value
                        +dsFondySUMMADOMIN.Value
                        +dsFondySUMMAPREM.Value
                        +dsFondySUMMAOTH.Value
                        +dsFondySUMMAPREM102.Value;
               summaFop1:=dsFondySUMMAOKL1.Value
                        +dsFondySUMMADOPLO1.Value
                        +dsFondySUMMADOPLN1.Value
                        +dsFondySUMMADOMIN1.Value
                        +dsFondySUMMAPREM1.Value
                        +dsFondySUMMAOTH1.Value
                        +dsFondySUMMAPREM1021.Value;

               inc(exRow);
               razr:=dsFondyRAZR.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]  := dsFondyNMBOFPERS.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,5]  := dsFondyNMBOFPERS1.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,6]  := summaFOP;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,7]  := summaFOP1;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,8]  := dsFondySUMMAOKL.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,9]  := dsFondySUMMAOKL1.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,10] := dsFondySUMMADOPLO.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,11] := dsFondySUMMADOPLO1.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,12] := dsFondySUMMADOPLN.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,13] := dsFondySUMMADOPLN1.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,14] := dsFondySUMMADOMIN.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,15] := dsFondySUMMADOMIN1.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,16] := dsFondySUMMAPREM.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,17] := dsFondySUMMAPREM1.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,18] := dsFondySUMMAOTH.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,19] := dsFondySUMMAOTH1.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,20] := dsFondySUMMAPREM102.Value;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow,21] := dsFondySUMMAPREM1021.Value;
               dsFondy.Next;
         end;


end;

end.
