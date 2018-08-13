unit SQlConnectU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormSQLConnect = class(TForm)
    BitBtn1: TBitBtn;
    EditDBName: TEdit;
    Label1: TLabel;
    EditUser: TEdit;
    EditPassword: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Password,UserName,DBName:string;
  public
    { Public declarations }
  end;

var
  FormSQLConnect: TFormSQLConnect;

implementation
 uses
      UFIBModule;

{$R *.dfm}

procedure TFormSQLConnect.BitBtn1Click(Sender: TObject);
begin
  Password:=EditPassword.Text;
  UserName:=EditUser.Text;
  DBName:=EditDBName.Text;
  if Length(Trim(Password))=0 then
     begin
          ShowMessage('Пароль нужно заполнить');
          Exit;
     end;
  if Length(Trim(UserName))=0 then
     begin
          ShowMessage('Пользователя нужно заполнить');
          Exit;
     end;
  if Length(Trim(DBName))=0 then
     begin
          ShowMessage('Путь к базе данных нужно заполнить');
          Exit;
     end;

  FIB.pFIBDatabaseSal.ConnectParams.CharSet  := 'WIN1251';
  FIB.pFIBDatabaseSal.ConnectParams.Password := Password;
  FIB.pFIBDatabaseSal.ConnectParams.UserName := UserName;
  FIB.pFIBDatabaseSal.DBName                 := DBName;
  FIB.pFIBDatabaseSal.UseLoginPrompt         := False;
  try
     FIB.pFIBDatabaseSal.Connected := True;
  except
     ShowMessage('Ошибка соединения');
  end;
  if FIB.pFIBDatabaseSal.Connected then
     ShowMessage('Соединение успешно');

end;

procedure TFormSQLConnect.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormSQLConnect.FormCreate(Sender: TObject);
begin
     Password := 'masterkey';
     UserName := 'SYSDBA';
     DBName   := 'D:\ZARPLATA\VUGU\IB\SAL.FDB';
     EditPassword.Text := Password;
     EditUser.Text     := UserName;
     EditDBName.Text   := DBName;

end;

end.
