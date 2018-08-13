unit FormGenKreditU;        

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormGenKredit = class(TForm)
    BitBtn1: TBitBtn;
    LabelFio: TLabel;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function Execute: boolean;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    tabno:integer;
    fio:string;

  public
     ShifrId:integer;
     Dolg:string;
    { Public declarations }
  end;

var
  FormGenKredit: TFormGenKredit;

implementation
 uses uFIBModule,uFrmFindKadryFB,UFormWait,ScrUtil;

{$R *.dfm}

procedure TFormGenKredit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormGenKredit.FormCreate(Sender: TObject);
begin
      Tabno:=0;
      Fio:='';
      Dolg:='';
      ShifrId:=0;
      LabelFio.Caption:='Выберите сотрудника';
      Edit1.Text:='Введите должность для печати в справке';
end;

procedure TFormGenKredit.BitBtn1Click(Sender: TObject);
var Need:boolean;
    d:string;
    i,l:integer;
begin
    LabelFio.Caption:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     Self.Tabno:=GetTabno;
                     Self.FIO:=GetFio;
                     LabelFio.Caption:=IntToStr(Self.Tabno)+' '+Trim(Self.Fio);
                     if not FIB.pFIBQuery.Transaction.Active then
                        FIB.pFIBQuery.Transaction.StartTransaction;
                     if FIB.pFIBQuery.Open then
                        FIB.pFIBQuery.Close;
                     FIB.pFIBQuery.SQL.Clear;
                     FIB.pFIBQuery.SQL.Add('select first 1 dolg from PR_GET_DOLG_PERSON('+IntToStr(Tabno)+')');
                     try
                        FIB.pFIBQuery.ExecQuery;
                        Dolg:=FIB.pFIBQuery.Fields[0].AsString;
                        Dolg:=trim(Dolg);
                        if length(Dolg)>0 then
                           begin
                                i:=0;
                                D:='';
                                Need:=false;
                                l:=length(Dolg);
                                while (i< l) do
                                  begin
                                       Inc(i);
                                       if (Need) or
                                          (not (dolg[i] in ['0'..'9'])) then
                                          begin
                                                Need:=true;
                                                d:=d+copy(dolg,i,1);
                                          end
                                  end;
                                Dolg:=Trim(d);
                           end
                        else
                           Dolg:='Не найдена';
                     except
                        ShowMessage('Ошибка получения должности');
                        Dolg:='Не найдена';
                     end;
                     FIB.pFIBQuery.Transaction.Commit;
                     Edit1.Text:=Dolg;
               end;
         finally
{            free;}
         end;
    Application.ProcessMessages;
    Self.Repaint;

end;

function TFormGenKredit.Execute: boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then result := true
                      else result := false;
end;



procedure TFormGenKredit.BitBtn2Click(Sender: TObject);
begin
      ShifrId:=0;
      if Tabno<1 then
         begin
              ShowMessage('Не указан сотрудник');
              Exit;
         end;
      Dolg:=trim(Edit1.Text);
      Dolg:=ReplSToDQuote(Dolg);
      if not FIB.pFIBQuery.Transaction.Active then
         FIB.pFIBQuery.Transaction.StartTransaction;
      if FIB.pFIBQuery.Open then
         FIB.pFIBQuery.Close;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('select first 1 shifrid from PR_GEN_KREDIT_SPR('+IntToStr(Tabno)+','''+Trim(Dolg)+''')');
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
      FIB.pFIBQuery.Transaction.Commit;
      ModalResult:=mrOk;

end;

end.
