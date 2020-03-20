unit FormGenYU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons, ExtCtrls;

type
  TFormGenYSpr = class(TForm)
    BitBtn1: TBitBtn;
    LabelFIO: TLabel;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroupZaV: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    function Execute: boolean;
  private
    { Private declarations }
    Y:integer;
    tabno:integer;
    fio:string;
    Mode_Za : integer; {1 за 2 - в}
  public
    ShifrId:integer;
    { Public declarations }
  end;

var
  FormGenYSpr: TFormGenYSpr;

implementation
 uses scrdef,uFIBModule,uFrmFindKadryFB,UFormWait;

{$R *.dfm}

procedure TFormGenYSpr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action := caFree;
end;

procedure TFormGenYSpr.FormCreate(Sender: TObject);
begin
      Tabno   := 0;
      Fio     := '';
      Y       := CurrYear;
      Mode_Za := 1; {За }
end;

procedure TFormGenYSpr.FormShow(Sender: TObject);
begin
     SpinEdit1.Value  := Y;
     LabelFIO.Caption := 'Укажите сотрудника';
     if y>2010 then
        RadioGroupZaV.ItemIndex:=1
     else
        RadioGroupZaV.ItemIndex:=0;
end;

procedure TFormGenYSpr.BitBtn1Click(Sender: TObject);
begin
    LabelFio.Caption:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     Self.Tabno:=GetTabno;
                     Self.FIO:=GetFio;
                     LabelFio.Caption:=IntToStr(Self.Tabno)+' '+Trim(Self.Fio);
               end;
         finally
{            free;}
         end;
    Application.ProcessMessages;
    Self.Repaint;

end;

procedure TFormGenYSpr.BitBtn2Click(Sender: TObject);
begin
      ShifrId:=0;
      y:=SpinEdit1.Value;
      if (Y<1991) or (y>hugeWrongYear) then
         begin
              ShowMessage('Не указан год');
              Exit;
         end;
      if Tabno<1 then
         begin
              ShowMessage('Не указан сотрудник');
              Exit;
         end;
      Mode_Za:=1;
      if RadioGroupZaV.ItemIndex=1 then Mode_Za:=2;
      if not FIB.pFIBQuery.Transaction.Active then
         FIB.pFIBQuery.Transaction.StartTransaction;
      if FIB.pFIBQuery.Open then
         FIB.pFIBQuery.Close;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('select first 1 shifrid from PR_GEN_Y_SPR('+IntToStr(Tabno)+','+IntToStr(Y)+','+IntToStr(Mode_Za)+')');
      try
          FormWait.Show;
          Application.ProcessMessages;
          FIB.pFIBQuery.ExecQuery;
          FormWait.Hide;
          shifrid:=FIB.pFIBQuery.Fields[0].AsInteger;
      except
          ShowMessage('Ошибка генерации справки');
          ShifrId:=0;
      end;
      if FIB.pFIBQuery.Open then
         FIB.pFIBQuery.Close;
      FIB.pFIBQuery.Transaction.Commit;
      ModalResult:=mrOk;

end;

function TFormGenYSpr.Execute: boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then result := true
                      else result := false;
end;

end.
