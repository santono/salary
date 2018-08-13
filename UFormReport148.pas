unit UFormReport148;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  frxClass, frxDBSet, StdCtrls, ComCtrls, Buttons, frxExportXLS;

type
  TFormReport148 = class(TForm)
    dsoList: TDataSource;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dsList: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsListTABNO: TFIBIntegerField;
    dsListFIO: TFIBStringField;
    dsListYEAR_ZA: TFIBSmallIntField;
    dsListMONTH_ZA: TFIBSmallIntField;
    dsListYEAR_VY: TFIBSmallIntField;
    dsListMONTH_VY: TFIBSmallIntField;
    dsListSUMMA: TFIBBCDField;
    dtFr: TDateTimePicker;
    dtTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    frxXLSExport1: TfrxXLSExport;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
    wantedShifrSta:Integer;
  public
    { Public declarations }
  end;

var
  FormReport148: TFormReport148;

implementation
 uses UFibModule,uformselpkg,ScrLists,
      DateUtils,UFormWait,ScrUtil;

{$R *.dfm}

procedure TFormReport148.FormCreate(Sender: TObject);
begin
     dtFr.Date:=EncodeDate(2014,9,1);
     dtTo.Date:=date;
     wantedShifrSta:=148;
end;

procedure TFormReport148.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

procedure TFormReport148.Button1Click(Sender: TObject);
var i:integer;
begin
     if ShifrList.CountSelected<>1 then
        begin
             ShowMessage('Не указана статья');
             Exit;
        end;
     wantedShifrSta:=0;
     for i:=1 to ShifrList.Count do
         if ShifrList.IsSelected(i) then
         if Not ShifrList.IsAddByNo(i) then
            begin
          //      WantedShifr:=ShifrList.GetShifrByNo(i);
                WantedShifrSta:=i;
                break;
            end;
     if WantedShifrSta<1 then
        begin
             ShowMessage('Указан неверный код удержания');
             Exit;
        end;
     dtFr.Date:=EncodeDate(yearOf(dtFr.Date),MonthOf(dtFr.Date),1);
     dtTo.Date:=EncodeDate(yearOf(dtTo.Date),MonthOf(dtTo.Date),1);
     if (dtFr.Date>=dtTo.Date) then
        begin
             ShowMessage('Указаны неверные даты');
             Exit;
        end;
     if (yearOf(dtFr.Date)<2014) then
        begin
             ShowMessage('Указаны неверные даты');
             Exit;
        end;
     dsList.ParamByName('datefr').AsDate         := dtFr.Date;
     dsList.ParamByName('dateto').AsDate         := dtTo.Date;
     dsList.ParamByName('wantedshifr').AsInteger := WantedShifrSta;
     FormWait.Show;
     dsList.Transaction.StartTransaction;
     dsList.Open;
     FormWait.Hide;
     frxReport1.ShowReport;
     dsList.Close;
     dsList.Transaction.Commit;
end;

procedure TFormReport148.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'shifrsta')=0 then
        Value:=IntToStr(wantedShifrSta)
     else
     if CompareText(VarName,'datefr')=0 then
        Value:=FormatDate(dtFr.Date)
     else
     if CompareText(VarName,'dateto')=0 then
        Value:=FormatDate(dtTo.Date)
end;

end.
