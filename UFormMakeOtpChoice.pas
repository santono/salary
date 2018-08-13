unit UFormMakeOtpChoice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery;

type
  TFormMakeOtpChoice = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    pFIBQueryOtpA: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    function ExecAction(Actn:integer):Boolean;

  public
    { Public declarations }
  end;

var
  FormMakeOtpChoice: TFormMakeOtpChoice;

implementation
  uses USelLists,UFibModule, uFormWait, UFormWaitMess,
  UFormMarkPGKForOtp;

{$R *.dfm}

procedure TFormMakeOtpChoice.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMakeOtpChoice.BitBtn2Click(Sender: TObject);
begin
     if not ExecAction(1) then Exit;
     FormWaitMess.SetMessage('Отметки установлены');
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;
end;

function TFormMakeOtpChoice.ExecAction(Actn:integer):boolean;
 var SQLStmnt:string;
     ShifrId,i:integer;
     Name,S:string;
     FirstItem:boolean;
begin
     Result:=True;
     if PodrSelOtpList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения.');
             Result:=false;
             Exit;
        end;
     if KategSelOtpList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны категории.');
             Exit;
        end;
     if GruppySelOtpList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны источники финансирования.');
             Exit;
        end;
     if Actn=1 then // установить
        SQLStmnt:='update tmp_otp_add SET SEL = 1 where connid=CURRENT_CONNECTION'
               else // сбросить
        SQLStmnt:='update tmp_otp_add SET SEL = 0 where connid=CURRENT_CONNECTION';
     if PodrSelOtpList.CountSelected>0 then
        begin
              s:=' and w_place in (';
              FirstItem:=true;
              for i:=0 to PodrSelOtpList.Count-1 do
                  if PodrSelOtpList.IsSelected(i) then
                      begin
                            PodrSelOtpList.GetItem(I,ShifrId,Name);
                            if not FirstItem then
                               s:=trim(s)+',';
                            s:=trim(s)+IntToStr(ShifrId);
                            FirstItem:=false;
                      end;
              s:=trim(s)+')';
              SQLStmnt:=trim(SQLStmnt)+' '+s;
        end;
     if KategSelOtpList.CountSelected>0 then
        begin
              s:=' and shifrkat in (';
              FirstItem:=true;
              for i:=0 to KategSelOtpList.Count-1 do
                  if KategSelOtpList.IsSelected(i) then
                      begin
                            KategSelOtpList.GetItem(I,ShifrId,Name);
                            if not FirstItem then
                               s:=trim(s)+',';
                            s:=trim(s)+IntToStr(ShifrId);
                            FirstItem:=false;
                      end;
              s:=trim(s)+')';
              SQLStmnt:=trim(SQLStmnt)+' '+s;
        end;
     if GruppySelOtpList.CountSelected>0 then
        begin
              s:=' and shifrgru in (';
              FirstItem:=true;
              for i:=0 to GruppySelOtpList.Count-1 do
                  if GruppySelOtpList.IsSelected(i) then
                      begin
                            GruppySelOtpList.GetItem(I,ShifrId,Name);
                            if not FirstItem then
                               s:=trim(s)+',';
                            s:=trim(s)+IntToStr(ShifrId);
                            FirstItem:=false;
                      end;
              s:=trim(s)+')';
              SQLStmnt:=trim(SQLStmnt)+' '+s;
        end;
     pFIBQueryOtpA.SQL.Clear;
     pFIBQueryOtpA.SQL.ADD(SQLStmnt);
     pFIBQueryOtpA.Transaction.StartTransaction;
     FormWait.Show;
     Application.ProcessMessages;
     pFIBQueryOtpA.ExecQuery;
     FormWait.Hide;
     Application.ProcessMessages;
     pFIBQueryOtpA.Close;
     pFIBQueryOtpA.Transaction.COMMIT;
end;

procedure TFormMakeOtpChoice.BitBtn3Click(Sender: TObject);
begin
     if not ExecAction(2) then Exit;
     FormWaitMess.SetMessage('Отметки сброшены');
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;

end;

procedure TFormMakeOtpChoice.BitBtn1Click(Sender: TObject);
begin
     Application.CreateForm(TFormMarkPGKForOtp,FormMarkPGKForOtp);
     FormMarkPGKForOtp.ShowModal;

end;

end.
