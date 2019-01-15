unit UFormRepPomKOtp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  scrDef, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit;

type
  TFormRepPomKOtp = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    cxSpinEditWantedYear: TcxSpinEdit;
    dsPomKOtp: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsoPomKOtp: TDataSource;
    dsPomKOtpSHIFRKAT: TFIBSmallIntField;
    dsPomKOtpNAME: TFIBStringField;
    dsPomKOtpCNT: TFIBIntegerField;
    dsPomKOtpSUMMA: TFIBBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    wantedYear:integer;
    procedure CreateReport;

  public
    { Public declarations }
  end;

var
  FormRepPomKOtp: TFormRepPomKOtp;

implementation
  uses
      uFIBModule,UFormWait,ScrUtil,DateUtils,ComObj,ScrIO,
      scrLists;

  var list:TList;
      modeSort:Integer;
{$R *.dfm}

procedure TFormRepPomKOtp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepPomKOtp.FormCreate(Sender: TObject);
begin
     wantedYear:=currYear;
     cxSpinEditWantedYear.Value:=wantedYear;
     cxSpinEditWantedYear.Properties.MaxValue:=wantedYear+10;
     cxSpinEditWantedYear.Properties.MinValue:=wantedYear-10;
end;

procedure TFormRepPomKOtp.BitBtn1Click(Sender: TObject);
begin
     CreateReport;
end;

procedure TFormRepPomKOtp.CreateReport;
  var E:variant;
      exRow:integer;
      needExcel:boolean;
  begin
       if dsPomKOtp.Active then
          dsPomKOtp.Close;
       if dsPomKOtp.Transaction.Active then
          dsPomKOtp.Transaction.Commit;
       wantedYear:=cxSpinEditWantedYear.Value;
       dsPomKOtp.Params[0].Value:=wantedYear;
       dsPomKOtp.Transaction.StartTransaction;
       FormWait.Show;
       Application.ProcessMessages;
       dsPomKOtp.Open;
       FormWait.Hide;
       Application.ProcessMessages;
       needExcel:=false;
       if not dsPomKOtp.Eof then
          begin
               needExcel:=true;
               try
                  E:=CreateOleObject('Excel.Application');
               except
                  on e:Exception do
                 begin
                      ShowMessage('Ошибка запуска Excel '+E.Message);
                      Exit;
                 end;
               end;
               E.WorkBooks.add;
               E.Visible:=true;
               exRow:=5;
               E.WorkBooks[1].WorkSheets[1].Cells[ExRow-2,1]:='Свод по помощи к отпуску за '+intToStr(wantedYear)+' г.';
               while not dsPomkOtp.Eof do
                 begin
                     Inc(exRow);
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,1]:=dsPomKOtpSHIFRKAT.Value;
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,2]:=dsPomKOtpNAME.Value;
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,3]:=dsPomKOtpCNT.Value;
                     E.WorkBooks[1].WorkSheets[1].Cells[ExRow,4]:=dsPomKOtpSUMMA.Value;
                     dsPomKOtp.Next;
                 end;
          end
       else
          showMessage('Начисления отсутствуют');
       dsPomKOtp.Close;
       dsPomKOtp.Transaction.Commit;
  end;

end.
