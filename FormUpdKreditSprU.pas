unit FormUpdKreditSprU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, FIBDataSet, pFIBDataSet;

type
  TFormUpdKreditSpr = class(TForm)
    LabelDolg: TLabel;
    EditDolg: TEdit;
    LabelRuk: TLabel;
    LabelGlBuh: TLabel;
    EditRuk: TEdit;
    EditBuh: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditIsp: TEdit;
    LabelIsp: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Dolg      : string;
    Rukowodit : string;
    glbuh     : string;
    isp       : string;
    procedure GetPar;
    procedure PutPar;
  public
      ShifrId:integer;
      function Execute: boolean;
    { Public declarations }
  end;

var
  FormUpdKreditSpr: TFormUpdKreditSpr;

implementation
  uses uFIBModule,ScrUtil,USQLUnit,scrdef;

{$R *.dfm}

procedure TFormUpdKreditSpr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

function TFormUpdKreditSpr.Execute: boolean;
begin
  GetPar;
  Self.visible:=false;
  if ShowModal = mrOk then result := true
                      else result := false;
end;


procedure TFormUpdKreditSpr.GetPar;
var SQLStmnt:string;
    v:Variant;
begin
     Dolg      := '';
     Rukowodit := '';
     glbuh     := '';
     isp       := '';
     if ShifrId<1 then Exit;
     if isSVDN then
        SQLStmnt:='select first 1 dolg,rukowodit,glbuh,isp from tb_kredit_spr where shifrid='+IntToStr(ShifrId)
     else
        SQLStmnt:='select first 1 dolg,rukowodit,glbuh from tb_kredit_spr where shifrid='+IntToStr(ShifrId);
     v:=SQLQueryRecValues(SQLStmnt);
     if (
         (VarIsNull(v)) or
         (VarIsEmpty(v)) or
         (not VarIsArray(v))
        ) then
        begin
             showMessage('Ошибка получения записи');
             Exit;
        end;
     Dolg      := v[0];
     Rukowodit := v[1];
     glbuh     := v[2];
     if isSVDN then
     if not varIsNull(v[3]) then
     if not varIsEmpty(v[3]) then
        isp := v[3];

(*
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select first 1 dolg,rukowodit,glbuh from tb_kredit_spr where shifrid='+IntToStr(ShifrId));
     try
        FIB.pFIBQuery.ExecQuery;
        Dolg      := FIB.pFIBQuery.FieldByName('dolg').AsString;
        Rukowodit := FIB.pFIBQuery.FieldByName('rukowodit').AsString;
        glbuh     := FIB.pFIBQuery.FieldByName('glbuh').AsString;
     except
        ShowMessage('Ошибка получения записи');
        Dolg      := '';
        Rukowodit := '';
        glbuh     := '';
     end;
     FIB.pFIBQuery.Close;
     FIB.pFIBQuery.Transaction.COMMIT;
*)
     EditRuk.Text  := Rukowodit;
     EditBuh.Text  := GlBuh;
     EditDolg.Text := Dolg;
     EditIsp.Text  := isp;
end;

procedure TFormUpdKreditSpr.PutPar;
var SQLStmnt:string;
begin
     if ShifrId<1 then Exit;
     Dolg      := trim(EditDolg.Text);
     Rukowodit := trim(EditRuk.Text);
     glbuh     := trim(EditBuh.Text);
     Dolg      := ReplSToDQuote(Dolg);
     Rukowodit := ReplSToDQuote(Rukowodit);
     glbuh     := ReplSToDQuote(glbuh);
     if isSVDN then
        begin
             isp := ReplSToDQuote(isp);
             SQLStmnt  := 'update tb_kredit_spr set '+
                          'dolg='''+Trim(Dolg)+''',' +
                          'rukowodit='''+Trim(Rukowodit)+''',' +
                          'glbuh='''+Trim(glbuh)+''',' +
                          'isp='''+Trim(isp)+'''' +
                          ' where shifrid='+IntToStr(ShifrId);
        end
     else
        begin
             SQLStmnt  := 'update tb_kredit_spr set '+
                          'dolg='''+Trim(Dolg)+''',' +
                          'rukowodit='''+Trim(Rukowodit)+''',' +
                          'glbuh='''+Trim(glbuh)+'''' +
                          ' where shifrid='+IntToStr(ShifrId);
        end;
     SQLExecute(SQLStmnt);
(*
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('update tb_kredit_spr set ');
     FIB.pFIBQuery.SQL.Add('dolg='''+Trim(Dolg)+''',');
     FIB.pFIBQuery.SQL.Add('rukowodit='''+Trim(Rukowodit)+''',');
     FIB.pFIBQuery.SQL.Add('glbuh='''+Trim(glbuh)+'''');
     FIB.pFIBQuery.SQL.Add(' where shifrid='+IntToStr(ShifrId));
     try
        FIB.pFIBQuery.ExecQuery;
     except
        ShowMessage('Ошибка сохранения изменений');
     end;
     FIB.pFIBQuery.Close;
     FIB.pFIBQuery.Transaction.COMMIT;
*)     
end;

procedure TFormUpdKreditSpr.FormShow(Sender: TObject);
begin
      if isSVDN then
         begin
              LabelDolg.Caption  := 'Посада';
              LabelRuk.Caption   := 'Керiвник';
              LabelGlBuh.Caption := 'Заст.гол.бух';
              LabelIsp.Caption   := 'Виконавець';
         end
      else
         begin
              LabelIsp.Hide;
              EditIsp.Hide;
         end;
      GetPar;
      Application.ProcessMessages;
end;

procedure TFormUpdKreditSpr.BitBtn1Click(Sender: TObject);
begin
      PutPar;
      ModalResult:=mrOk;
end;

end.
