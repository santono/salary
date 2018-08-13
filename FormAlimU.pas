{$WARNINGS OFF}
{$HINTS OFF}
unit FormAlimU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, ExtCtrls, DBCtrls, dxCntner, dxGrClEx, dxLayout,
  FIBDatabase, pFIBDatabase, Menus, StdCtrls, Buttons;

type
  TFormAlim = class(TForm)
    pFIBDataSetAlim: TpFIBDataSet;
    pFIBDataSetAlimSHIFR: TFIBIntegerField;
    pFIBDataSetAlimFIO_WOMEN: TFIBStringField;
    pFIBDataSetAlimADRES: TFIBStringField;
    pFIBDataSetAlimTABNO: TFIBIntegerField;
    pFIBDataSetAlimFIO_WORKER: TFIBStringField;
    pFIBDataSetAlimPROCENT: TFIBBCDField;
    pFIBDataSetAlimPROCENTPST: TFIBBCDField;
    pFIBDataSetAlimDATATO: TFIBDateField;
    pFIBDataSetAlimDATAFR: TFIBDateField;
    DataSourceAlim: TDataSource;
    dxDBGridAlim: TdxDBGrid;
    DBNavigatorAlim: TDBNavigator;
    dxDBGridAlimSHIFR: TdxDBGridMaskColumn;
    dxDBGridAlimFIO_WOMEN: TdxDBGridMaskColumn;
    dxDBGridAlimADRES: TdxDBGridMaskColumn;
    dxDBGridAlimPROCENT: TdxDBGridCurrencyColumn;
    dxDBGridAlimPROCENTPST: TdxDBGridCurrencyColumn;
    dxDBGridAlimDATATO: TdxDBGridDateColumn;
    dxDBGridAlimDATAFR: TdxDBGridDateColumn;
    pFIBTransactionWrite: TpFIBTransaction;
    dxDBGridAlimTABNO: TdxDBGridMaskColumn;
    dxDBGridAlimFIO_WORKER: TdxDBGridMaskColumn;
    dxDBGridAlimSel: TdxDBGridButtonColumn;
    PopupMenu1: TPopupMenu;
    DOS1: TMenuItem;
    N1: TMenuItem;
    BitBtn1: TBitBtn;
    pFIBDataSetAlimMODE: TFIBIntegerField;
    N2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dxDBGridAlimSelButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure DOS1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBNavigatorAlimClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    function Execute: boolean;
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    AllMode:Integer;
    function GetModeAlim(Adres:string):integer;

  public
     ActClarion:integer;
     WantedPSborMode:integer;
     WantedShifrAlim:integer;
    { Public declarations }
  end;

var
  FormAlim: TFormAlim;

implementation
  uses  UFIBModule,uFrmFindKadryFB, uFormWait,Grids,ScrDef,ScrUtil,SCrIO,
        FormUpdAlimU;

{$R *.dfm}

procedure TFormAlim.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetAlim.UpdatesPending then
         begin
              pFIBTransactionWrite.StartTransaction;
              FIB.pFIBDatabaseSal.ApplyUpdates([pFIBDataSetAlim]);
              if pFIBTransactionWrite.Active then
                pFIBTransactionWrite.Commit;
         end;

      if pFIBDataSetAlim.Active then
         pFIBDataSetAlim.Active:=false;
      if pFIBDataSetAlim.Transaction.Active then
         pFIBDataSetAlim.Transaction.Active:=false;
      if pFIBDataSetAlim.UpdateTransaction.Active then
         pFIBDataSetAlim.UpdateTransaction.Active:=false;
      Action:=caFree;
end;

procedure TFormAlim.FormShow(Sender: TObject);
begin
      if not pFIBDataSetAlim.Active then
         begin
              pFIBDataSetAlim.Params[0].AsInteger:=AllMode;
              pFIBDataSetAlim.Prepare;
              pFIBDataSetAlim.Active:=true;
         end;
      if ActClarion=4 then
         begin
              DBNavigatorAlim.VisibleButtons:= [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh];
              BitBtn1.Visible:=true;
         end
      else
         begin
              DBNavigatorAlim.VisibleButtons:=[nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
              BitBtn1.Visible:=false;
        end

end;




procedure TFormAlim.dxDBGridAlimSelButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var I:Integer;
    t1,t2:INTEGER;
begin
    T2:=Self.pFIBDataSetAlim.FieldByName('TABNO').AsInteger;
    with TFormFindKadryFB.Create(nil) do
         try
            if T2>0 then
               begin
                     FormWait.Show;
                     Application.ProcessMessages;
                     pFIBDataSet1.First;
                     while not pFIBDataSet1.eof do
                     begin
                          T1:=pFIBDataSet1.FieldByName('Tabno').AsInteger;
                          if T1=T2 then
                             break;
                          pFIBDataSet1.Next;
                     end;
                     FormWait.Hide;
               end;
            if execute then
               begin
                     if t2<>GetTabno then
                        begin
                             if Self.pFIBDataSetAlim.State<>dsEdit then Self.pFIBDataSetAlim.Edit;
                             Self.pFIBDataSetAlim.FieldByName('TABNO').AsInteger:=GetTabno;
                             Self.pFIBDataSetAlim.FieldByName('FIO_WORKER').AsString:=GetFIO;
                             Self.pFIBDataSetAlim.Post;
                        end;
(*
                     FIB.pFIBQuery.SQL.Clear;
                     FIB.pFIBQuery.SQL.Add('SELECT shifrkat,shifrgru,namekat,namegru FROM getkatgru('+IntToSTr(Self.WantedTabno)+')');
                     try
{
                         FormWait.Show;
                         Application.ProcessMessages;
}
                         FIB.pFIBQuery.ExecQuery;
{                         FormWait.Hide;}
                         Self.ShifrKat:=FIB.pFIBQuery.Fields[0].AsInteger;
                         Self.ShifrGru:=FIB.pFIBQuery.Fields[1].AsInteger;
                         KS:=FIB.pFIBQuery.Fields[2].AsString;
                         GS:=FIB.pFIBQuery.Fields[3].AsString;
                         LabelFio.Caption:=Trim(LabelFio.Caption)+' '+trim(ks)+' '+trim(gs);
                         FIB.pFIBQuery.Close;
                     except
                         MessageDlg('Ошибка getkatgru',mtInformation, [mbOk], 0);
                         Exit;
                     end;
*)
               end;
         finally
            free;
         end;

end;


procedure TFormAlim.DOS1Click(Sender: TObject);
var FNAme:String;
    DEV:TextFile;
    S,S1,S2,S3,SSS:String;
    I,J:integer;
    Mode:integer;
    SS:AnsiString;
    SQLStmnt:String;
begin
     FName:=CDIR+'ALIMENTY.TXT';
     if not FileExists(FName) then
        begin
              ShowMessage('Отсутствует файл '+FName);
              Exit;
        end;
     Mode:=Self.GetModeAlim(S2);
     AssignFile(Dev,FName);
     Reset(Dev);
     while not eof(Dev) do
      begin
           readln(Dev,S);
           if length(AllTrim(S))<60 then continue;
           S:=DosToWin(S);
           S1:=AllTrim(copy(S,1,3));
           val(S1,I,J);
           if J<>0 then continue;
           if i=37 then
              i:=37;
           S2:=copy(S,4,50);
           S3:=copy(S,55,length(s));
           Mode:=Self.GetModeAlim(S3);
           FIB.pFIBQuery.SQL.Clear;
           FIB.pFIBQuery.SQL.Add('SELECT count(*) FROM ALIMENTY WHERE SHIFR='+IntToStr(I));
           FIB.pFIBTransactionSAL.StartTransaction;
           try
              FIB.pFIBQuery.ExecQuery;
              J:=FIB.pFIBQuery.Fields[0].AsInteger;
              FIB.pFIBQuery.Close;
           except
              j:=0;
           end;
           FIB.pFIBTransactionSAL.Commit;
           if j=1 then
              begin
                   S2:=trim(S2);
                   S3:=trim(S3);
                   S2:=ReplQto2Q(S2);
                   S3:=ReplQto2Q(S3);
                   FIB.pFIBQuery.SQL.Clear;
                   SQLStmnt:='UPDATE ALIMENTY SET';
                   SQLStmnt:=SQLStmnt+' FIO_WOMEN='''+S2+''',';
                   SQLStmnt:=SQLStmnt+' ADRES='''+S3+''',';
                   SQLStmnt:=SQLStmnt+' MODE='+IntToStr(Mode);
                   SQLStmnt:=SQLStmnt+' WHERE SHIFR='+IntToStr(I);
                   FIB.pFIBQuery.SQL.Add(SQLStmnt);

                   FIB.pFIBTransactionSAL.StartTransaction;
                   try
                       FIB.pFIBQuery.ExecQuery;
                       FIB.pFIBQuery.Close;
                   except
                   end;
                   FIB.pFIBTransactionSAL.Commit;
              end
                  else
              begin
                   S2:=trim(S2);
                   S3:=trim(S3);
                   S2:=ReplQto2Q(S2);
                   S3:=ReplQto2Q(S3);
                   FIB.pFIBQuery.SQL.Clear;
                   SSS:='INSERT INTO ALIMENTY (SHIFR,FIO_WOMEN,ADRES,MODE,DATAFR,DATATO) VALUES(';
                   SS:=SSS;
                   FIB.pFIBQuery.SQL.Add(SSS);
                   SSS:=IntToStr(I)+',''';
                   SS:=SS+SSS;
                   FIB.pFIBQuery.SQL.Add(SSS);
                   SSS:=alltrim(S2)+''',''';
                   SS:=SS+SSS;
                   FIB.pFIBQuery.SQL.Add(SSS);
                   SSS:=alltrim(S3)+''',';
                   SS:=SS+SSS;
                   FIB.pFIBQuery.SQL.Add(SSS);
                   SSS:=IntToStr(Mode)+',';
                   SS:=SS+SSS;
                   FIB.pFIBQuery.SQL.Add(SSS);
                   SSS:='''1991-01-01'',''2000-01-01'')';
                   SS:=SS+SSS;
                   FIB.pFIBQuery.SQL.Add(SSS);
                   FIB.pFIBTransactionSAL.StartTransaction;
                   try
                       FIB.pFIBQuery.ExecQuery;
                       FIB.pFIBQuery.Close;
                   except
                   end;
                   FIB.pFIBTransactionSAL.Commit;
              end;


      end;
     CloseFile(Dev);
     pFIBDataSetAlim.Refresh;
     ShowMessage('Файл обработан');
end;
function TFormAlim.GetModeAlim(Adres:string):integer;
 begin
      IF IS_LUGANSK(ADRES) THEN
         begin
              Result:=1;
              exit;        { Луганск     }
         end
      else if is_kassa(ADRES) then
              begin
                   Result:=3;
                   exit;   { Касса     }
              end
      else if (IS_PRAVEKSBANK(ADRES) or IS_PRIVATBANK(ADRES))then
              begin
                   Result:=4;
                   exit;   { Луганск     }
              end
      else
          Result:=2;
 end;



procedure TFormAlim.N1Click(Sender: TObject);
var NMESTemp,NSRVTemp:integer;
    Curr_Person:Person_Ptr;
    Curr_Cn:Cn_Ptr;
    Shifr:integer;
    I,Proc,Mode:Integer;
 procedure PutPerson(Shifr,Tabno,Prim,Proc,Mode:integer);
  begin
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('UPDATE ALIMENTY SET TABNO='+IntToStr(Tabno));
       FIB.pFIBQuery.SQL.Add(', CODE='+IntToStr(Prim));
       FIB.pFIBQuery.SQL.Add(', PROCENT='+IntToStr(Proc));
       FIB.pFIBQuery.SQL.Add(', DATAFR=''1991-08-01''');
       FIB.pFIBQuery.SQL.Add(', DATATO=''2010-01-01'' WHERE SHIFR='+IntToStr(Shifr));
       FIB.pFIBTransactionSAL.StartTransaction;
       try
          FIB.pFIBQuery.ExecQuery;
          FIB.pFIBQuery.Close;
       except
       end;
       FIB.pFIBTransactionSAL.Commit;
  end;
begin
     NSRVTemp:=NSRV;
     PUTINF;
     while head_Person<>Nil do Del_Person(Head_Person);
     FOR I:=1 to Count_Serv do
         begin
              NSRV:=i;
              MKFLNM;
              if not FileExist(FNINF) then continue;
              GETINF(TRUE);
              curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
               begin
                    Curr_Cn:=Curr_Person^.CN;
                    while Curr_Cn<>Nil do
                     begin
                          if (Curr_Cn^.Shifr=Alimenty_Shifr+Limit_cn_base) or
                             (Curr_Cn^.Shifr=Alimenty_Shifr)  then
                             begin
                                  Shifr:=Get_Alimenty_Prim(Curr_Cn^.Prim);
                                  Proc:=round(Curr_Cn^.Summa);
                                  Mode:=GET_ALIMENTY_MODE(Curr_Cn^.Prim);
                                  PutPerson(Shifr,Curr_Person^.Tabno,Curr_Cn^.Prim,Proc,Mode);
                             end;
                          Curr_Cn:=Curr_Cn^.Next;
                     end;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              while head_Person<>Nil do Del_Person(Head_Person);
         end;
     NSRV:=NSRVTemp;
     MKFLNM;
     GETINF(TRUE);
end;

procedure TFormAlim.DBNavigatorAlimClick(Sender: TObject;
  Button: TNavigateBtn);
var
  Act:integer;
  SavId:integer;
begin
  SavId := 0 ;
  Act   := 0 ;
  case Button of
    nbInsert : Act:=1;
    nbDelete : Act:=3;
    nbEdit   : Act:=2;
  end;
  if Act>0 then
     begin
          if Act<>3 then
          with TFormUpdAlim.Create(nil) do
            begin
               try
                  ActionClarion   := Act ;
                  WantedNomerAlim := 0   ;
                  if Act<>1 then
                     begin
                          WantedNomerAlim     := Self.pFIBDataSetAlim.FieldByName('SHIFR').AsInteger;
                          SavId       := WantedNomerAlim;
                     end;
                  if execute then
                     begin
                          if Act=1 then
                             if WantedNomerAlim>0 then
                                SavId:=WantedNomerAlim;
                     end;
               finally
                free;
               end;
           end;
          if not pFIBDataSetAlim.Transaction.Active then
             pFIBDataSetAlim.Transaction.StartTransaction;
          pFIBDataSetAlim.Close;
          pFIBDataSetAlim.Params[0].AsInteger:=AllMode;
          pFIBDataSetAlim.Prepare;
          pFIBDataSetAlim.Open;
          FormShow(Sender);
          if SavId>0 then
             begin
{                 SELF.pFIBDataSetBoln.FieldByName('SHIFRID').AsInteger:=ShifrIdBoln;}
                  pFIBDataSetAlim.Locate('Shifr',SavId,[loPartialKey]);
             end;
     end;


end;

procedure TFormAlim.FormCreate(Sender: TObject);
begin
     ActClarion:=0;
     AllMode:=0;    // только действующи записи =0
                    // 1 все записи
end;

procedure TFormAlim.BitBtn1Click(Sender: TObject);
begin
     WantedShifrAlim  := pFIBDataSetAlim.FieldByName('SHIFR').AsInteger;
     WantedPSborMode  := pFIBDataSetAlim.FieldByName('MODE').AsInteger;
     ModalResult:=mrOk;
end;

function TFormAlim.Execute: boolean;
begin
  if ShowModal = mrOk then result := true
end;

procedure TFormAlim.N2Click(Sender: TObject);
var FNAme:String;
    DEV:TextFile;
    S,S1,S2,S3,SSS:String;
    I,J:integer;
    Mode:integer;
    SS:AnsiString;

begin
     FName:=CDIR+'ALIMENTY.TXT';
     if not YesNo('Файл '+FName+'будет создан заново'+^M+'т.е. старый файл будет перетерт. Вы уверены?') then Exit;
     if FIB.pFIBQuery.Open then
        FIB.pFIBQuery.Close;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('SELECT count(*) FROM ALIMENTY');
     FIB.pFIBTransactionSAL.StartTransaction;
     try
        FIB.pFIBQuery.ExecQuery;
        J:=FIB.pFIBQuery.Fields[0].AsInteger;
        FIB.pFIBQuery.Close;
     except
        else
        j:=0;
     end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBTransactionSAL.Commit;
     if j=0 then
        begin
             ShowMessage('Нет данных по алиментам');
             Exit;
        end;

     AssignFile(Dev,FName);
     ReWrite(Dev);
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('SELECT SHIFR,FIO_WOMEN,ADRES FROM ALIMENTY ORDER BY SHIFR');
     FIB.pFIBTransactionSAL.StartTransaction;
     try
        FIB.pFIBQuery.ExecQuery;
        while not FIB.pFIBQuery.Eof do
          begin
               j:=FIB.pFIBQuery.Fields[0].AsInteger;
               S1:=FIB.pFIBQuery.Fields[1].AsString;
               S2:=FIB.pFIBQuery.Fields[2].AsString;
               s1:=Copy(WinToDos(s1)+all(' ',51),1,51);
               s2:=Trim(WinToDos(s2));
               Writeln(dev,j:3,' ',s1,s2);
               FIB.pFIBQuery.Next;
          end;
        FIB.pFIBQuery.Close;
     except
       else
           begin
                ShowMessage('Ошибка чтения данных по алиментам');
                FIB.pFIBQuery.Close;
           end;
     end;
     FIB.pFIBTransactionSAL.Commit;
     CloseFile(Dev);
     ShowMessage('Данные записаны в файл '+FName);
end;


end.
