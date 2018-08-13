unit UFormSaveSelPodr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, StdCtrls,
  Buttons;

type
  TFormSaveSelPodr = class(TForm)
    pFIBQuerySave: TpFIBQuery;
    pFIBTransactionSave: TpFIBTransaction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditName: TEdit;
    LabelName: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure SavePodrList;
  public
     PodrList:TList;
     WantedMode:integer; {1 список подразделений 2 список счетов}
    { Public declarations }
  end;

var
  FormSaveSelPodr: TFormSaveSelPodr;

implementation

{$R *.dfm}
   uses UFibModule,ScrLists,UFormWait;

procedure TFormSaveSelPodr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     PodrList.Free;
     Action:=caFree;
end;

procedure TFormSaveSelPodr.BitBtn1Click(Sender: TObject);
var NameRec:String;
begin
     NameRec:=trim(EditName.Text);
     if Length(NameRec)=0 then
        begin
              ShowMessage('Введите название списка');
              Exit;
        end;
     if (Assigned(PodrList)) and (PodrList.Count>0) then
        SavePodrList;
end;


procedure TFormSaveSelPodr.SavePodrList;
 var ShifrIdMain,ShifrIdPodr,I,I_C,ShifrPod:integer;
     NameRec:String;
 begin
        NameRec:=trim(EditName.Text);

        FormWait.Show;
        Application.ProcessMessages;

       { 1. Подучить код заголовка }
        if not pFIBQuerySave.Transaction.Active then
           pFIBQuerySave.Transaction.StartTransaction;
        if pFIBQuerySave.Open then
           pFIBQuerySave.Close;
        pFIBQuerySave.SQL.Clear;
        pFIBQuerySave.SQL.Add('select count(*) from tb_name_podr_selection_det');
        pFIBQuerySave.ExecQuery;
        ShifrIdMain:=pFIBQuerySave.Fields[0].AsInteger;
        pFIBQuerySave.Close;
        if ShifrIdMain>0 then
           begin
                pFIBQuerySave.SQL.Clear;
                pFIBQuerySave.SQL.Add('select max(shifrid) from tb_name_podr_selection_det');
                pFIBQuerySave.ExecQuery;
                ShifrIdMain:=pFIBQuerySave.Fields[0].AsInteger;
                pFIBQuerySave.Close;
           end;
       { 2. Подучить код подразделения }
        pFIBQuerySave.SQL.Clear;
        pFIBQuerySave.SQL.Add('select count(*) from tb_podr_selection_list');
        pFIBQuerySave.ExecQuery;
        ShifrIdPodr:=pFIBQuerySave.Fields[0].AsInteger;
        pFIBQuerySave.Close;
        if ShifrIdMain>0 then
           begin
                pFIBQuerySave.SQL.Clear;
                pFIBQuerySave.SQL.Add('select max(shifrid) from tb_podr_selection_list');
                pFIBQuerySave.ExecQuery;
                ShifrIdPodr:=pFIBQuerySave.Fields[0].AsInteger;
                pFIBQuerySave.Close;
           end;
       { 3. Сохранить заголовок }
       Inc(ShifrIdMain);
       pFIBQuerySave.SQL.Clear;
       pFIBQuerySave.SQL.Add('insert into tb_name_podr_selection_det (shifrid,shifridowner,name) values('+IntToStr(ShifrIdMain)+','+IntToStr(Self.WantedMode)+','''+trim(namerec)+''')');
       pFIBQuerySave.ExecQuery;
       pFIBQuerySave.Close;
       { 4. Сохранить список подразделений }
       I_C:=Self.PodrList.Count-1;
       for I:=0 to I_C do
           begin
                 ShifrPod:=PItemRec(Self.PodrList.Items[i])^.Month;
                 Inc(ShifrIdPodr);
                 pFIBQuerySave.SQL.Clear;
                 pFIBQuerySave.SQL.Add('insert into tb_podr_selection_list (shifrid,shifridowner,shifrpod) values('+IntToStr(ShifrIdPodr)+','+IntToStr(ShifrIdMain)+','+IntToStr(ShifrPod)+')');
                 pFIBQuerySave.ExecQuery;
                 pFIBQuerySave.Close;
           end;
       pFIBQuerySave.Transaction.Commit;
       FormWait.Hide;
       Application.ProcessMessages;

 end;

procedure TFormSaveSelPodr.FormCreate(Sender: TObject);
begin
      PodrList:=TList.Create;
      WantedMode:=1;   { Подразделения }
end;

procedure TFormSaveSelPodr.FormShow(Sender: TObject);
begin
      if WantedMode=2 then Self.Caption:='Сохранение списка счетов'
                      else Self.Caption:='Сохранение списка подразделений';
      Application.ProcessMessages;
end;

end.
