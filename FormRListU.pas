unit FormRListU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormRList = class(TForm)
    DateTimePickerRList: TDateTimePicker;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    cbDopPodr: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SetParam(Tabno:integer;FIO:String);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    function Execute: boolean;
  private
    { Private declarations }
    Tabno:integer;
    RetCode:integer;
  public
    { Public declarations }
  end;

var
  FormRList: TFormRList;

implementation
uses UFibModule,UFormView,ScrUtil, uFormWait,ScrDef;

{$R *.dfm}

procedure TFormRList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      ModalResult:=mrOk;
end;

procedure TFormRList.SetParam(Tabno:integer;FIO:String);
 begin
       Self.Tabno:=Tabno;
       Label2.Caption:=FIO;
 end;

procedure TFormRList.BitBtn1Click(Sender: TObject);
 var Year,Month,Day:word;
     FName,S:string;
     Dev:TextFile;
     iVal:Integer;
begin
     iVal:=0;
     if isSVDN then
        if not cbDopPodr.Checked then
           iVal:=1;    // Не включать
     if Not DirectoryExists(CDOC+'RS') then
        begin
             ShowMessage('Oтсутствует каталог '+CDOC+'RS');
             Exit;
        end;
     FNAME:=CDOC+'RS\'+IntToStr(Tabno)+'.TXT';
     DecodeDate(Self.DateTimePickerRList.Date,Year,Month,Day);
     if (Month>NMES) and (Year>=CurrYear) then
         begin
              ShowMessage('Неверный период');
         end;

     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('SELECT RETVAL FROM R_LIST('+IntToStr(Tabno)+','''+IntToStr(Year)+'-'+IntToStr(Month)+'-10'','+IntToStr(iVal)+')');
     FIB.pFIBTransactionSAL.StartTransaction;
     try
         FormWait.Show;
         Application.ProcessMessages;
         FIB.pFIBQuery.ExecQuery;
         FormWait.Hide;
         AssignFile(Dev,FName);
         ReWrite(Dev);
         while not FIB.pFIBQuery.eof do
               begin
                    S:=FIB.pFIBQuery.Fields[0].AsString;
{                    writeln(dev,wintodos(S));}
                    writeln(dev,S);
                    FIB.pFIBQuery.next;
               end;
         FIB.pFIBQuery.Close;
         CloseFile(Dev);
         VIEW(FNAME);
         FIB.pFIBTransactionSAL.Commit;
     except
         MessageDlg('Ошибка выполнения процедуры R_List',mtInformation, [mbOk], 0);
         FIB.pFIBTransactionSAL.Commit;
         Exit;
     end;

end;

function TFormRList.Execute: boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;

procedure TFormRList.FormCreate(Sender: TObject);
var Y,M,D:word;
    dtMax:Tdate;
begin
     RetCode:=0;
     y:=CurrYear;
     m:=NMES;
     d:=10;
     dtMax:=EncodeDate(y,m,d);
     Dec(m);
     if (M<1) then
        begin
             m:=12;
             dec(Y);
        end;
     DateTimePickerRList.MaxDate:=dtMax;
     DateTimePickerRList.Date:=EnCodeDate(y,m,d);
     {$IFDEF SVDN}
       cbDopPodr.Checked:=False;
       cbDopPodr.Enabled:=True;
       cbDopPodr.Show;
     {$ELSE}
       cbDopPodr.Checked:=True;
       cbDopPodr.Enabled:=false;
       cbDopPodr.Hide;
     {$ENDIF}

end;

end.
