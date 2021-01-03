unit FormMakeAllChainU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormMakeAllChain = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
      procedure ProcessAllChain;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeAllChain: TFormMakeAllChain;

implementation
 uses FIBDatabase,uFormWait,ScrDef,ScrIo, UFibModule, ScrUtil;

{$R *.dfm}

procedure TFormMakeAllChain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMakeAllChain.ProcessAllChain;
 var SavMonth,I_NSRV,SavPodr:integer;
     Sc,Rec:integer;
     MN,SQL:string;
     Curr_Person:Person_Ptr;
     Curr_Sowm:Sowm_Ptr;
  procedure Delete_All_Sowm(Curr_Person:person_ptr);
   begin
        while Curr_Person^.sowm<>nil do del_sowm(Curr_Person^.sowm,Curr_Person);
   end;

 begin
      SavMonth := NMES;
      SavPodr  := NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv*2;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      Sc:=0;
      SQL:='delete from TB_CHAIN where YEARVY='+IntToStr(CurrYear)+' and MonthVy='+IntToStr(NMES);
      FormWait.Show;
      Application.ProcessMessages;
      FIB.pFIBDatabaseSal.Execute(SQL);
      FormWait.Hide;

      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Label1.Caption:=NAME_SERV(I_NSRV);
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                Curr_Person:=Head_Person;
                while (Curr_Person<>Nil) do
                   begin
                   //      if Curr_Person^.TABNO<>29 then
                   //         begin
                   //              Curr_Person:=Curr_Person^.NEXT;
                   //              continue;
                   //         end;
                         SQL:='EXECUTE PROCEDURE PR_ADD_TO_CHAIN('+IntToStr(Curr_Person^.tabno)+',';
                         SQL:=SQL+IntToStr(CurrYear)+',';
                         SQL:=SQL+IntToStr(NMES)+',';
                         SQL:=SQL+IntToStr(NSRV)+',';
                         SQL:=SQL+IntToStr(Curr_Person^.Wid_Raboty)+')';
                         FIB.pFIBDatabaseSal.Execute(SQL);
                         Curr_Person:=Curr_Person^.Next;
                   end;
                EMPTY_ALL_PERSON;
          end;
      if not FIB.pFIBQuery.Transaction.Active then
             FIB.pFIBQuery.Transaction.StartTransaction;
      if FIB.pFIBQuery.Open then
         FIB.pFIBQuery.Close;
      FIB.pFIBQuery.SQL.Clear;
      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Label1.Caption:=NAME_SERV(I_NSRV);
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                Curr_Person:=Head_Person;
                while (Curr_Person<>Nil) do
                   begin
                         if (Curr_Person^.WID_RABOTY=osn_wid_raboty) then
                            begin
                                 Delete_All_Sowm(Curr_Person);
                                 if (Curr_Person^.Main=1) or (Curr_Person^.Main=3) then
                                    begin
                                         FIB.pFIBQuery.Close;
                                         FIB.pFIBQuery.SQL.Clear;
                                         SQL:='select w_place from tb_chain where tabno='+IntToStr(Curr_Person^.tabno)+' and yearvy='+IntToStr(CurrYear)+' and monthvy='+IntToStr(NMES)+' and (w_r=2 or w_place in (11,102,81,140))';
                                         FIB.pFIBQuery.SQL.Add(SQL);
                                         try
                                             FIB.pFIBQuery.ExecQuery;
                                         except
                                             ShowMessage('Ошибка SQL '+SQL);
                                             break;
                                         end;
                                         while not FIB.pFIBQuery.EOF do
                                           begin
                                                Make_Sowm(Curr_Sowm,Curr_Person);
                                                Curr_Sowm^.WHERE:=FIB.pFIBQuery.Fields[0].AsInteger;
                                                FIB.pFIBQuery.Next;
                                           end;
                                    end;
                            end;
                         Curr_Person:=Curr_Person^.Next;
                   end;
                putinf;
                EMPTY_ALL_PERSON;
          end;
      if FIB.pFIBQuery.Open then
         FIB.pFIBQuery.Close;
      if FIB.pFIBQuery.Transaction.Active then
         FIB.pFIBQuery.Transaction.Commit;
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);
 end;


procedure TFormMakeAllChain.BitBtn1Click(Sender: TObject);
begin
     ProcessAllChain;
     ShowMessage('Формирование цепочек закончено!');
     Self.Close;
end;

procedure TFormMakeAllChain.FormCreate(Sender: TObject);
begin
     Caption:='Формирование цепочек в БД за '+getMonthRus(NMES);
end;

end.
