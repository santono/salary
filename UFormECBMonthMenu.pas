unit UFormECBMonthMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery;

type
  TFormECBMonthMenu = class(TForm)
    LabelD: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    btnExportExcel: TBitBtn;
    Button1: TButton;
    BitBtn7: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure btnExportExcelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
      WantedMonth : integer;
      WantedYear  : integer;
      WantedDate  : TDateTime;
  public
    { Public declarations }
  end;

var
  FormECBMonthMenu: TFormECBMonthMenu;
  needMakeRepECBOldStyle:Boolean;

implementation
  uses ScrDef,ScrUtil,UFormGetDRFO,UFormMovECBToDBF, uFormWait, DateUtils,
  UFormTestE4, UFormMovECBtoExcel, UFormRepF4,
  UFormCmpSwodECBDetail;

{$R *.dfm}

procedure TFormECBMonthMenu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormECBMonthMenu.FormCreate(Sender: TObject);
 var Y,M,D:word;
begin
      WantedMonth := NMES;
      WantedYear  := CurrYear;
      Y           := CurrYear;
      M           := NMES;
      D           := 10;
      WantedDate  := EnCodeDate(Y,M,D);
      DateTimePicker1.Date := WantedDate;
      LabelD.Caption := GetMonthRus(WantedMonth)+' '+IntToStr(WantedYear)+' �.';
      if isLNR then
         begin
              btnExportExcel.Show();
              btnExportExcel.Enabled:=true;
              Button1.Hide;
              button1.Enabled:=false;
         end
      else
         begin
              btnExportExcel.Hide();
              btnExportExcel.Enabled:=false;
              button1.Show;
              button1.Enabled:=true;
              if not needMakeRepECBOldStyle then
                 BitBtn2.Enabled:=False;
         end;

end;

procedure TFormECBMonthMenu.BitBtn2Click(Sender: TObject);
 var Y,M : integer;

begin
     Y:=YearOf(DateTimePicker1.Date);
     M:=MonthOf(DateTimePicker1.Date);
     if not YesNo('������������ ������ �� ��� '+#10#13+
                  ' �� '+GetMonthRus(M)+' '+IntToStr(Y)+' �.') then Exit;
     if not pFIBQuery1.Transaction.Active then
        pFIBQuery1.Transaction.StartTransaction;
     FormWait.Show;
     Application.ProcessMessages;
     if pFIBQuery1.Open then
        pFIBQuery1.Close;
     pFIBQuery1.SQL.Clear;
     pFIBQuery1.SQL.Add('EXECUTE PROCEDURE PR_MK_E4_ALL ('+IntToStr(Y)+','+IntToStr(M)+')');
     pFIBQuery1.ExecQuery;
     pFIBQuery1.Close;
     if pFIBQuery1.Transaction.Active then
        pFIBQuery1.Transaction.Commit;
     FormWait.Hide;
     Application.ProcessMessages;
end;


procedure TFormECBMonthMenu.BitBtn4Click(Sender: TObject);
begin
     Application.CreateForm(TFormGetDRFO, FormGetDRFO);
     FormGetDRFO.ShowModal;
end;

procedure TFormECBMonthMenu.BitBtn3Click(Sender: TObject);
begin
     Application.CreateForm(TFormMovECBToDBF, FormMovECBToDBF);
     FormMovECBToDBF:=TFormMovECBToDBF.myCreate(Self,WantedYear,WantedMonth);
     FormMovECBToDBF.ShowModal;

end;

procedure TFormECBMonthMenu.DateTimePicker1Change(Sender: TObject);
 var Y,M,D:word;
begin
      WantedDate:=DateTimePicker1.Date;
      DeCodeDate(WantedDate,Y,M,D);
      WantedYear     := Y;
      WantedMonth    := M;
      LabelD.Caption := GetMonthRus(WantedMonth)+' '+IntToStr(WantedYear)+' �.';
      Application.ProcessMessages;
end;


procedure TFormECBMonthMenu.BitBtn5Click(Sender: TObject);
begin
     Application.CreateForm(TFormTestE4, FormTestE4);
     FormTestE4.Y:=YearOf(DateTimePicker1.Date);
     FormTestE4.M:=MonthOf(DateTimePicker1.Date);
     FormTestE4.Caption:=Trim(FormTestE4.Caption)+' '+IntToStr(FormTestE4.M)+' '+IntToStr(FormTestE4.Y);

     FormTestE4.ShowModal;

end;
procedure TFormECBMonthMenu.BitBtn7Click(Sender: TObject);
begin
     FormCmpSwodECBDetail:=TFormCmpSwodECBDetail.myCreate(Self,wantedYear,wantedMonth);
     FormCmpSwodECBDetail.ShowModal;

end;

procedure TFormECBMonthMenu.btnExportExcelClick(Sender: TObject);
begin
     if not isLNR then Exit;
     Application.CreateForm(TFormMovECBToExcel, FormMovECBToExcel);
     FormMovECBToExcel.WantedYear  := Self.WantedYear;
     FormMovECBToExcel.WantedMonth := Self.WantedMonth;
     FormMovECBToExcel.ShowModal;

end;

procedure TFormECBMonthMenu.Button1Click(Sender: TObject);
begin
     if not isSVDN then exit;
     if not yesNo('������, ���������� ������ ����������� �������� ������?') then Exit;
     Application.CreateForm(TFormRepF4,FormRepF4);
     FormRepF4.wantedYear:=Self.WantedYear;
     FormRepF4.wantedMonth:=Self.WantedMonth;
     FormRepF4.Caption:='���� � ��� �� '+GetMonthUkr(Self.WantedMonth)+' '+IntToStr(self.WantedYear)+'�.';
     FormRepF4.showModal;
end;


begin
  needMakeRepECBOldStyle:=false;
end.
