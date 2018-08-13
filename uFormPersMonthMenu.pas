unit uFormPersMonthMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery;

type
  TFormPersMonthMenu = class(TForm)
    DateTimePicker1: TDateTimePicker;
    LabelD: TLabel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
  public
     WantedMonth : integer;
     WantedYear  : integer;
     WantedDate  : TDate;
    { Public declarations }
  end;

var
  FormPersMonthMenu: TFormPersMonthMenu;

implementation
  uses ScrDef,ScrUtil,UFormMovPFUToDBF,uFormGetDRFO,
       uFIBModule,UFormWait,UFormTestP4, DateUtils;

{$R *.dfm}

procedure TFormPersMonthMenu.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormPersMonthMenu.FormCreate(Sender: TObject);
 var Y,M,D:word;
begin
      WantedMonth := NMES;
      WantedYear  := CurrYear;
      Y           := CurrYear;
      M           := NMES;
      D           := 10;
      WantedDate  := EnCodeDate(Y,M,D);
      DateTimePicker1.Date := WantedDate;
      LabelD.Caption := GetMonthRus(WantedMonth)+' '+IntToStr(WantedYear)+' г.';
end;

procedure TFormPersMonthMenu.DateTimePicker1Change(Sender: TObject);
 var Y,M,D:word;
begin
      WantedDate:=DateTimePicker1.Date;
      DeCodeDate(WantedDate,Y,M,D);
      WantedYear  := Y;
      WantedMonth := M;
      LabelD.Caption := GetMonthRus(WantedMonth)+' '+IntToStr(WantedYear)+' г.';
      Application.ProcessMessages;
end;

procedure TFormPersMonthMenu.BitBtn6Click(Sender: TObject);
begin
     Application.CreateForm(TFormMovPFUToDBF, FormMovPFUToDBF);
     FormMovPFUToDBF.WantedYear  := Self.WantedYear;
     FormMovPFUToDBF.WantedMonth := Self.WantedMonth;
     FormMovPFUToDBF.ShowModal;

end;

procedure TFormPersMonthMenu.BitBtn8Click(Sender: TObject);
begin
     Application.CreateForm(TFormGetDRFO, FormGetDRFO);
     FormGetDRFO.ShowModal;
end;

procedure TFormPersMonthMenu.BitBtn5Click(Sender: TObject);
 var Y,M : integer;

begin
     Y:=YearOf(DateTimePicker1.Date);
     M:=MonthOf(DateTimePicker1.Date);
     if not YesNo('Генерировать данные по персонофикации '+#10#13+
                  ' за '+GetMonthRus(M)+' '+IntToStr(Y)+' г.') then Exit;
     if not pFIBQuery1.Transaction.Active then
        pFIBQuery1.Transaction.StartTransaction;
     FormWait.Show;
     Application.ProcessMessages;
     if pFIBQuery1.Open then
        pFIBQuery1.Close;
     pFIBQuery1.SQL.Clear;
     pFIBQuery1.SQL.Add('EXECUTE PROCEDURE PR_CR_TB_PREP_UWP_PERS ('+IntToStr(Y)+','+IntToStr(M)+')');
     pFIBQuery1.ExecQuery;
     pFIBQuery1.Close;
     pFIBQuery1.SQL.Clear;
     pFIBQuery1.SQL.Add('EXECUTE PROCEDURE PR_MK_P4_ALL ('+IntToStr(Y)+','+IntToStr(M)+')');
     pFIBQuery1.ExecQuery;
     pFIBQuery1.Close;
     if pFIBQuery1.Transaction.Active then
        pFIBQuery1.Transaction.Commit;
     FormWait.Hide;
     Application.ProcessMessages;
end;

procedure TFormPersMonthMenu.BitBtn4Click(Sender: TObject);
begin
     Application.CreateForm(TFormTestP4, FormTestP4);
     FormTestP4.Y:=YearOf(DateTimePicker1.Date);
     FormTestP4.M:=MonthOf(DateTimePicker1.Date);
     FormTestP4.Caption:=Trim(FormTestP4.Caption)+' '+IntToStr(FormTestP4.M)+' '+IntToStr(FormTestP4.Y);

     FormTestP4.ShowModal;
end;

end.
