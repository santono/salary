unit FormUpdAlimU;

interface                         

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, StdCtrls, Spin,
  ComCtrls, ExtCtrls, Mask, Buttons, dxCntner, dxEditor, dxExEdtr, dxEdLib;
                
type
  TFormUpdAlim = class(TForm)
    pFIBQuery1: TpFIBQuery;
    pFIBTransactionWrite: TpFIBTransaction;
    SpinEditNomer: TSpinEdit;
    Label1: TLabel;
    EditWomen: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    SpinEditTabno: TSpinEdit;
    EditFIO: TEdit;
    Label4: TLabel;
    DateTimePickerFr: TDateTimePicker;
    DateTimePickerTo: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    rgKod: TRadioGroup;
    EditAdres: TEdit;
    Label9: TLabel;
    RadioGroupModePST: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dxCalcEditProcent: TdxCalcEdit;
    dxCalcEditProcPst: TdxCalcEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function Execute: boolean;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    WantedWomen:string[50];
    WantedAdres:string[79];
    WantedDataTo:TDateTime;
    WantedDataFr:TDateTime;
    WantedTabno:integer;
    WantedFioWorker:string[50];
    WantedProcent:real;
    WantedProcentPst:real;
    WantedMode:integer;
    WantedCode:integer;
    WantedKod:integer;
    function TestRecord:boolean;
  public
    { Public declarations }
    ActionClarion:integer;
    WantedNomerAlim:integer;
  end;

var
  FormUpdAlim: TFormUpdAlim;

implementation
 uses UFibModule,uFrmFindKadryFB,ScrUtil,USQLUnit;

{$R *.dfm}

procedure TFormUpdAlim.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormUpdAlim.BitBtn3Click(Sender: TObject);
var s:string;
begin
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     Self.WantedTabno:=GetTabno;
                     SpinEditTabno.Value:=Self.WantedTabno;
                     Self.WantedFIOWorker:=GetFio;
                     EditFIO.Text:=Self.WantedFIOWorker;
                     Self.Repaint;
               end;
         finally
{            free;   }
          end;
end;


procedure TFormUpdAlim.FormShow(Sender: TObject);
begin
     SpinEditNomer.Value      := WantedNomerAlim ;
     EditWomen.Text           := WantedWomen     ;
     EditAdres.Text           := WantedAdres     ;
     SpinEditTabno.Value      := WantedTabno     ;
     EditFIO.Text             := WantedFIOWorker ;
     DateTimePickerFr.Date    := WantedDataFr    ;
     DateTimePickerTo.Date    := WantedDataTo    ;
     dxCalcEditProcent.Text   := FloatToStr(WantedProcent);
     dxCalcEditProcPst.Text   := FloatToStr(WantedProcentPST);
     rgKod.ItemIndex          := WantedKod;
     RadioGroupModePst.ItemIndex := WantedMode;
end;

function TFormUpdAlim.Execute: boolean;
var ks,gs:string;
    v:variant;
    shifrid:integer;
    sqlStmnt:string;
begin
  if ActionClarion=1 then
     begin
          WantedNomerAlim := 0;
          WantedWomen     := '';
          WantedAdres     := '';
          WantedTabno     := 0;
          WantedFIOWorker := '';
          WantedDataFr    := Date();
          WantedDataTo    := Date();
          WantedProcent   := 0;
          WantedProcentPST   := 0;
          WantedKod       := 0;
          WantedMode      := 0;
          WantedCode      := 0;
          SQLStmnt:='SELECT MAX(SHIFR) FROM ALIMENTY';
          v:=SQLQueryValue(SQLStmnt);
          shifrid:=0;
          if VarIsNumeric(v) then
             shifrid:=v;
          WantedNomerAlim:=shifrId;
          Inc(WantedNomerAlim);

     end
  else
  if ActionClarion>1 then
     begin
          SpinEditNomer.ReadOnly:=false;
          SQLStmnt:='SELECT FIO_WOMEN,ADRES' +
                    ',DATAFR,DATATO,TABNO,FIO_WORKER'+
                    ',PROCENT,PROCENTPST,MODE,CODE,KOD'+
                    ' FROM ALIMENTY WHERE SHIFR='+IntToStr(WantedNomerAlim);
          v:=SQLQueryRecValues(SQLStmnt);
          WantedWomen     := v[0];
          WantedAdres     := v[1];
          WantedDataFr    := v[2];
          WantedDataTo    := v[3];
          WantedTabno     := v[4];
          WantedFIOWorker := v[5];
          WantedProcent   := v[6];
          WantedProcentPST:= v[7];
          WantedMode      := v[8]-1;
          WantedCode      := v[9];
          WantedKod       := v[10]-1;
     end;
  if ShowModal = mrOk then result := true
                      else result := false;
end;


function TFormUpdAlim.TestRecord:boolean;
 var A      : real;
     i      : integer;
     RetVal : boolean;
 begin
     RetVal:=true;
     if ActionClarion=1 then
        WantedNomerAlim := SpinEditNomer.Value;
     WantedWomen := Trim(EditWomen.Text);
     WantedAdres := Trim(EditAdres.Text);
     WantedTabno := SpinEditTabno.Value;
     WantedFIOWorker := Trim(EditFIO.Text);
     WantedDataFr    := DateTimePickerFr.Date;
     WantedDataTo    := DateTimePickerTo.Date;
     dxCalcEditProcent.Text:=ReplCommaOnPoint(dxCalcEditProcent.Text);
     dxCalcEditProcPst.Text:=ReplCommaOnPoint(dxCalcEditProcPst.Text);
     val(trim(dxCalcEditProcent.Text),A,I);
     if i<>0 then
        begin
             retval:=false;
             ShowMessage('Неверно введен процент или сумма алиментов');
             Result:=false;
             Exit;
        end
             else WantedProcent:=A;
     val(trim(dxCalcEditProcPst.Text),A,I);
     if i<>0 then
        begin
             retval:=false;
             ShowMessage('Неверно введен процент почтового сбора');
             Result:=false;
             Exit;
        end
             else WantedProcentPst:=A;
{
     val(trim(MaskEditProcent.Text),A,I);
     if i<>0 then retval:=false
             else WantedProcent:=A;
     val(trim(MaskEditProcPST.Text),A,I);
     if i<>0 then retval:=false
             else WantedProcentPST:=A;
}             
     WantedKod  := rgKod.ItemIndex+1;
     WantedMode := RadioGroupModePst.ItemIndex+1;
     if Length(Trim(WantedWomen))<1 then
        begin
             ShowMessage('Не указана фамилия получателя алиментов');
             Result:=false;
             Exit;
        end;
     if Length(Trim(WantedAdres))<1 then
        begin
             ShowMessage('Не указан адрес получателя алиментов');
             Result:=false;
             Exit;
        end;

     if (not RetVal) or (Length(Trim(WantedWomen))<1) or (Length(Trim(WantedAdres))<1) then
{        (WantedTabno<1) or (Length(Trim(WantedFIOWorker))<1) then}
        begin
             ShowMessage('Неверно заполнены данные алиментов');
             Result:=false;
        end
     else
        Result:=true;
 end;

procedure TFormUpdAlim.BitBtn1Click(Sender: TObject);
 const F='######0.00';

var SQL:String;
    S:String;
    SQLStmnt:string;
begin
     if not TestRecord then Exit;
     if ActionClarion=1 then
        begin
//             if not FIB.pFIBQuery.Transaction.Active then
//                FIB.pFIBQuery.Transaction.StartTransaction;
//             FIB.pFIBQuery.SQL.Clear;
             SQL:='INSERT INTO ALIMENTY (SHIFR,FIO_WOMEN,ADRES,DATATO,DATAFR,';
             S:=SQL;
//             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='TABNO,PROCENT,PROCENTPST,FIO_WORKER,MODE,CODE,KOD) VALUES(';
             S:=S+SQL;
//             FIB.pFIBQuery.SQL.Add(SQL);
             WantedWomen:=ReplQuot(WantedWomen);
             WantedAdres:=ReplQuot(WantedAdres);
             SQL:=IntToStr(WantedNomerAlim)+','''+Trim(WantedWomen)+''','''+Trim(WantedAdres)+'''';
             S:=S+SQL;
//             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:=','''+DateToStr(WantedDataTo)+''','''+DateToStr(WantedDataFr)+'''';
             S:=S+SQL;
//             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:=','+IntToStr(WantedTabno)+','+ReplCommaOnPoint(Trim(FormatFloat(F,WantedProcent)))+','+ReplCommaOnPoint(Trim(FormatFloat(F,WantedProcentPst)));
             S:=S+SQL;
//             FIB.pFIBQuery.SQL.Add(SQL);
             WantedFioWorker:=ConvertUkrStrToSql(WantedFioWorker);
             SQL:=','''+Trim(WantedFioWorker)+''','+IntToStr(WantedMode+1);
             S:=S+SQL;
//             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:=','+IntToStr(WantedCode)+','+IntToStr(WantedKod+1)+')';
             S:=S+SQL;
//             FIB.pFIBQuery.SQL.Add(SQL);
//             try
//                FIB.pFIBQuery.ExecQuery;
//             except
//                   ShowMessage('Ошибка добавления записи');
//             end;
//             FIB.pFIBQuery.Close;
//             if FIB.pFIBQuery.Transaction.Active then
//                FIB.pFIBQuery.Transaction.Commit;

             SQL:='INSERT INTO ALIMENTY (SHIFR,FIO_WOMEN,ADRES,DATATO,DATAFR,';
             S:=SQL;
             SQL:='TABNO,PROCENT,PROCENTPST,FIO_WORKER,MODE,CODE,KOD) VALUES(';
             S:=S+SQL;
             WantedWomen:=ReplQuot(WantedWomen);
             WantedAdres:=ReplQuot(WantedAdres);
             SQL:=IntToStr(WantedNomerAlim)+','''+Trim(WantedWomen)+''','''+Trim(WantedAdres)+'''';
             S:=S+SQL;
             SQL:=','''+DateToStr(WantedDataTo)+''','''+DateToStr(WantedDataFr)+'''';
             S:=S+SQL;
             SQL:=','+IntToStr(WantedTabno)+','+ReplCommaOnPoint(Trim(FormatFloat(F,WantedProcent)))+','+ReplCommaOnPoint(Trim(FormatFloat(F,WantedProcentPst)));
             S:=S+SQL;
             WantedFioWorker:=ConvertUkrStrToSql(WantedFioWorker);
             SQL:=','''+Trim(WantedFioWorker)+''','+IntToStr(WantedMode+1);
             S:=S+SQL;
             SQL:=','+IntToStr(WantedCode)+','+IntToStr(WantedKod+1)+')';
             S:=S+SQL;
             SQLStmnt:=s;
             SQLExecute(SQLStmnt);

        end
     else
        begin
//             if not FIB.pFIBQuery.Transaction.Active then
//                FIB.pFIBQuery.Transaction.StartTransaction;
//             FIB.pFIBQuery.SQL.Clear;
//             WantedWomen:=ReplQuot(WantedWomen);
//             WantedAdres:=ReplQuot(WantedAdres);
//             sql:='UPDATE ALIMENTY SET ';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             sql:='FIO_WOMEN='''+Trim(WantedWomen)+''',';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             sql:='ADRES='''+Trim(WantedAdres)+''',';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             SQL:='DATATO='''+DateToStr(WantedDataTo)+''',';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             SQL:='DATAFR='''+DateToStr(WantedDataFr)+''',';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             SQL:='TABNO='+IntToStr(WantedTabno)+',';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             SQL:='PROCENT='+FormatFloatPoint(WantedProcent)+',';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             SQL:='PROCENTPST='+FormatFloatPoint(WantedProcentPST)+',';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             SQL:='FIO_WORKER='''+Trim(WantedFioWorker)+''',';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             SQL:='MODE='+IntToStr(WantedMode)+',';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             SQL:='CODE='+IntToStr(WantedCode)+',';
//             FIB.pFIBQuery.SQL.Add(SQL);
//             SQL:='KOD='+IntToStr(WantedKod)+'WHERE SHIFR='+IntToStr(WantedNomerAlim);
//             FIB.pFIBQuery.SQL.Add(SQL);
//             try
//                FIB.pFIBQuery.ExecQuery;
//             except
//                   ShowMessage('Ошибка обновления записи записи');
//             end;
//             FIB.pFIBQuery.Close;
//             if FIB.pFIBQuery.Transaction.Active then
//                FIB.pFIBQuery.Transaction.Commit;



             WantedWomen:=ReplQuot(WantedWomen);
             WantedAdres:=ReplQuot(WantedAdres);
             sql:='UPDATE ALIMENTY SET ';
             SQLStmnt:=SQL;
             sql:='FIO_WOMEN='''+Trim(WantedWomen)+''',';
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;
             sql:='ADRES='''+Trim(WantedAdres)+''',';
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;
             SQL:='DATATO='''+DateToStr(WantedDataTo)+''',';
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;
             SQL:='DATAFR='''+DateToStr(WantedDataFr)+''',';
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;
             SQL:='TABNO='+IntToStr(WantedTabno)+',';
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;
             SQL:='PROCENT='+FormatFloatPoint(WantedProcent)+',';
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;
             SQL:='PROCENTPST='+FormatFloatPoint(WantedProcentPST)+',';
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;
             SQL:='FIO_WORKER='''+Trim(WantedFioWorker)+''',';
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;
             SQL:='MODE='+IntToStr(WantedMode)+',';
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;
             SQL:='CODE='+IntToStr(WantedCode)+',';
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;
             SQL:='KOD='+IntToStr(WantedKod)+'WHERE SHIFR='+IntToStr(WantedNomerAlim);
             SQLStmnt:=trim(SQLStmnt)+' '+SQL;

             SQLExecute(SQLStmnt);
        end;
end;


end.
