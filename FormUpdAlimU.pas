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
    RadioGroupKod: TRadioGroup;
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
 uses UFibModule,uFrmFindKadryFB,ScrUtil;

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
     RadioGroupKod.ItemIndex  := WantedKod;
     RadioGroupModePst.ItemIndex := WantedMode;
end;

function TFormUpdAlim.Execute: boolean;
var ks,gs:string;
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
          if not FIB.pFIBQuery.Transaction.Active then
             FIB.pFIBQuery.Transaction.StartTransaction;
          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('SELECT MAX(SHIFR) FROM ALIMENTY');
          try
             FIB.pFIBQuery.ExecQuery;
             WantedNomerAlim:=FIB.pFIBQuery.Fields[0].AsInteger;
             Inc(WantedNomerAlim);
          except
              WantedNomerAlim:=1;
          end;
          FIB.pFIBQuery.Close;
          if FIB.pFIBQuery.Transaction.Active then
             FIB.pFIBQuery.Transaction.Commit;
         // SpinEditNomer.ReadOnly:=true;

     end
  else
  if ActionClarion>1 then
     begin
          SpinEditNomer.ReadOnly:=false;
          if not FIB.pFIBQuery.Transaction.Active then
             FIB.pFIBQuery.Transaction.StartTransaction;
          FIB.pFIBQuery.SQL.Clear;
          FIB.pFIBQuery.SQL.Add('SELECT FIO_WOMEN,ADRES');
          FIB.pFIBQuery.SQL.Add(',DATAFR,DATATO,TABNO,FIO_WORKER');
          FIB.pFIBQuery.SQL.Add(',PROCENT,PROCENTPST,MODE,CODE,KOD');
          FIB.pFIBQuery.SQL.Add(' FROM ALIMENTY WHERE SHIFR='+IntToStr(WantedNomerAlim));
          try
             FIB.pFIBQuery.ExecQuery;
             WantedWomen  := FIB.pFIBQuery.Fields[0].AsString;
             WantedAdres  := FIB.pFIBQuery.Fields[1].AsString;
             WantedDataFr := FIB.pFIBQuery.Fields[2].AsDateTime;
             WantedDataTo := FIB.pFIBQuery.Fields[3].AsDateTime;
             WantedTabno  := FIB.pFIBQuery.Fields[4].AsInteger;
             WantedFIOWorker := FIB.pFIBQuery.Fields[5].AsString;
             WantedProcent   := FIB.pFIBQuery.Fields[6].AsFloat;
             WantedProcentPST   := FIB.pFIBQuery.Fields[7].AsFloat;
             WantedMode       := FIB.pFIBQuery.Fields[8].AsInteger-1;
             WantedCode       := FIB.pFIBQuery.Fields[9].AsInteger;
             WantedKod        := FIB.pFIBQuery.Fields[10].AsInteger-1;
          except
          end;
          FIB.pFIBQuery.Close;
          if FIB.pFIBQuery.Transaction.Active then
             FIB.pFIBQuery.Transaction.Commit;
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
     WantedKod  := RadioGroupKod.ItemIndex+1;
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
begin
     if not TestRecord then Exit;
     if ActionClarion=1 then
        begin
             if not FIB.pFIBQuery.Transaction.Active then
                FIB.pFIBQuery.Transaction.StartTransaction;
             FIB.pFIBQuery.SQL.Clear;
             SQL:='INSERT INTO ALIMENTY (SHIFR,FIO_WOMEN,ADRES,DATATO,DATAFR,';
             S:=SQL;
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='TABNO,PROCENT,PROCENTPST,FIO_WORKER,MODE,CODE,KOD) VALUES(';
             S:=S+SQL;
             FIB.pFIBQuery.SQL.Add(SQL);
             WantedWomen:=ReplQuot(WantedWomen);
             WantedAdres:=ReplQuot(WantedAdres);
             SQL:=IntToStr(WantedNomerAlim)+','''+Trim(WantedWomen)+''','''+Trim(WantedAdres)+'''';
             S:=S+SQL;
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:=','''+DateToStr(WantedDataTo)+''','''+DateToStr(WantedDataFr)+'''';
             S:=S+SQL;
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:=','+IntToStr(WantedTabno)+','+ReplCommaOnPoint(Trim(FormatFloat(F,WantedProcent)))+','+ReplCommaOnPoint(Trim(FormatFloat(F,WantedProcentPst)));
             S:=S+SQL;
             FIB.pFIBQuery.SQL.Add(SQL);
             WantedFioWorker:=ConvertUkrStrToSql(WantedFioWorker);
             SQL:=','''+Trim(WantedFioWorker)+''','+IntToStr(WantedMode+1);
             S:=S+SQL;
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:=','+IntToStr(WantedCode)+','+IntToStr(WantedKod+1)+')';
             S:=S+SQL;
             FIB.pFIBQuery.SQL.Add(SQL);
             try
                FIB.pFIBQuery.ExecQuery;
             except
                   ShowMessage('Ошибка добавления записи');
             end;
             FIB.pFIBQuery.Close;
             if FIB.pFIBQuery.Transaction.Active then
                FIB.pFIBQuery.Transaction.Commit;

        end
     else
        begin
             if not FIB.pFIBQuery.Transaction.Active then
                FIB.pFIBQuery.Transaction.StartTransaction;
             FIB.pFIBQuery.SQL.Clear;
             WantedWomen:=ReplQuot(WantedWomen);
             WantedAdres:=ReplQuot(WantedAdres);
             sql:='UPDATE ALIMENTY SET ';
             FIB.pFIBQuery.SQL.Add(SQL);
             sql:='FIO_WOMEN='''+Trim(WantedWomen)+''',';
             FIB.pFIBQuery.SQL.Add(SQL);
             sql:='ADRES='''+Trim(WantedAdres)+''',';
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='DATATO='''+DateToStr(WantedDataTo)+''',';
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='DATAFR='''+DateToStr(WantedDataFr)+''',';
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='TABNO='+IntToStr(WantedTabno)+',';
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='PROCENT='+FormatFloatPoint(WantedProcent)+',';
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='PROCENTPST='+FormatFloatPoint(WantedProcentPST)+',';
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='FIO_WORKER='''+Trim(WantedFioWorker)+''',';
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='MODE='+IntToStr(WantedMode)+',';
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='CODE='+IntToStr(WantedCode)+',';
             FIB.pFIBQuery.SQL.Add(SQL);
             SQL:='KOD='+IntToStr(WantedKod)+'WHERE SHIFR='+IntToStr(WantedNomerAlim);
             FIB.pFIBQuery.SQL.Add(SQL);
             try
                FIB.pFIBQuery.ExecQuery;
             except
                   ShowMessage('Ошибка обновления записи записи');
             end;
             FIB.pFIBQuery.Close;
             if FIB.pFIBQuery.Transaction.Active then
                FIB.pFIBQuery.Transaction.Commit;
        end;
end;


end.
