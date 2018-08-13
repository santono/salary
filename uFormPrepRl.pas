unit uFormPrepRl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFormPrepRl = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    DateTimePicker1: TDateTimePicker;
    LabelFio: TLabel;
    LabelPodr: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    DevRl:text;
    procedure Make_Person_Rl(TABNO:integer;Dt:TDateTime);
  public
    { Public declarations }
  end;

var
  FormPrepRl: TFormPrepRl;

implementation
 uses ScrDef,ScrIO,ScrUtil,uFIBModule, uFormWait,DateUtils;

{$R *.dfm}

procedure TFormPrepRl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormPrepRl.FormCreate(Sender: TObject);
 var Dt : TDateTime;
     y,m,d : word;
begin
     y:=CurrYear;
     m:=nmes;
     d:=1;
     dec(m);
     if (m<1) then
        begin
             m:=12  ;
             y:=y-1 ;
        end;
     Dt:=EnCodeDate(y,m,d);
     DateTimePicker1.Date:=Dt;
     LabelPodr.Caption := '';
     LabelFio.Caption  := '';
end;

procedure TFormPrepRl.Make_Person_Rl(TABNO:integer;Dt:TDateTime);
 var Y,M,D:word;
      S:string;
 begin
     DecodeDate(Dt,Y,M,D);

     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('SELECT RETVAL FROM R_LIST('+IntToStr(Tabno)+','''+IntToStr(Y)+'-'+IntToStr(M)+'-10'')');
     FIB.pFIBTransactionSAL.StartTransaction;
     try
         FormWait.Show;
         Application.ProcessMessages;
         FIB.pFIBQuery.ExecQuery;
         FormWait.Hide;
         writeln(devrl,all('*',30));
         while not FIB.pFIBQuery.eof do
               begin
                    S:=FIB.pFIBQuery.Fields[0].AsString;
                    s:=wintodos(S);
                    writeln(devrl,S);
                    FIB.pFIBQuery.next;
               end;
         FIB.pFIBQuery.Close;
         FIB.pFIBTransactionSAL.Commit;
     except
         MessageDlg('Ошибка выполнения процедуры R_List',mtInformation, [mbOk], 0);
         FIB.pFIBTransactionSAL.Commit;
         Exit;
     end;
 end;


procedure TFormPrepRl.BitBtn1Click(Sender: TObject);
var I_Nsrv:integer;
    SavNmes:integer;
    SavNSRV:integer;
    Curr_Person:Person_Ptr;
    Dt:TDateTime;
    RasDir     : string;
    FName,I_S  : string;
begin
     RasDir:=MainDir+'\Ras_List\';
     if Not DirectoryExists(RasDir) then
        begin
             ShowMessage('Oтсутствует каталог '+RasDir);
             Exit;
        end;
     Dt:=DateTimePicker1.Date;
     SavNmes:=NMES;
     SavNSRV:=NSRV;
     PutInf;
     while (Head_Person<>Nil) do Del_Person(Head_Person);
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Str(YearOf(Dt),I_S);
     RasDir:=RasDir+I_S+'\';
     if Not DirectoryExists(RasDir) then
        CreateDir(RasDir);
     Str(MonthOf(Dt),I_S);
     if (MonthOf(Dt)<10) then
        I_S:='0'+I_S;
     RasDir:=RasDir+I_S+'\';
     if Not DirectoryExists(RasDir) then
        CreateDir(RasDir);

     for I_NSRV:=1 to Count_Serv do
       begin
            NSRV:=I_NSRV;
            mkflnm;
            ProgressBar1.Position:=I_NSRV;
            Application.ProcessMessages;
            LabelPodr.Caption := Name_Serv(NSRV);
            if not FileExists(FnInf) then continue;
            Str(NSRV,I_S);
            while (length(trim(I_S))<3) do
                  I_S:='0'+trim(I_S);
            FName:='Rl'+I_S+'.txt';
            FName:=RasDir+FName;
            if FileExists(FName) then
               DeleteFile(FName);
            AssignFile(DevRL,FName);
            ReWrite(DevRl);
            GetInf(true);
            Curr_Person:=Head_Person;
            while (Curr_Person<>Nil) do
              begin
                   if Curr_Person^.WID_RABOTY=OSN_WID_RABOTY then
                      begin
                           LabelFio.Caption  := IntToStr(Curr_Person^.Tabno)+' '+trim(Curr_Person^.FIO);
                           Application.ProcessMessages;
                           Make_Person_Rl(Curr_Person^.TABNO,Dt);
                      end;
                   Curr_Person:=Curr_Person^.NEXT;
              end;
            while (Head_Person<>Nil) do Del_Person(Head_Person);
            CloseFile(DevRL);
       end;
     NMES:=SavNmes;
     NSRV:=SavNSRV;
     mkflnm;
     GetInf(true);


end;

end.
