unit UFormEditTemy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, DBCtrls,
  dxDBTLCl, dxGrClms, StdCtrls, Buttons, FIBQuery, pFIBQuery;

type
  TFormEditTemy = class(TForm)
    pFIBDataSetTemy: TpFIBDataSet;
    pFIBTransactionTWrite: TpFIBTransaction;
    pFIBTransactionTRead: TpFIBTransaction;
    DataSourceTemy: TDataSource;
    pFIBDataSetTemySHIFRID: TFIBIntegerField;
    pFIBDataSetTemyNAME: TFIBStringField;
    pFIBDataSetTemyDATEWRK: TFIBDateTimeField;
    pFIBDataSetTemySHIFRWRK: TFIBIntegerField;
    dxDBGridTemy: TdxDBGrid;
    dxDBGridTemySHIFRID: TdxDBGridMaskColumn;
    dxDBGridTemyNAME: TdxDBGridMaskColumn;
    dxDBGridTemyDATEWRK: TdxDBGridDateColumn;
    dxDBGridTemySHIFRWRK: TdxDBGridMaskColumn;
    DBNavigatorTemy: TDBNavigator;
    DataSourceTK: TDataSource;
    DBNavigatorTK: TDBNavigator;
    pFIBDataSetTK: TpFIBDataSet;
    pFIBTransactionTKWrite: TpFIBTransaction;
    pFIBTransactionTKRead: TpFIBTransaction;
    pFIBDataSetPodr: TpFIBDataSet;
    pFIBTransactionPodrRead: TpFIBTransaction;
    pFIBDataSetPodrSHIFRPOD: TFIBIntegerField;
    pFIBDataSetPodrNAME: TFIBStringField;
    pFIBDataSetTKSHIFRKAF: TFIBIntegerField;
    pFIBDataSetTKNAMEKAF: TFIBStringField;
    pFIBDataSetTKShifrID: TIntegerField;
    pFIBDataSetTKNAMEKLOOKUP: TStringField;
    dxDBGridTK: TdxDBGrid;
    dxDBGridTKSHIFRKAF: TdxDBGridCalcColumn;
    dxDBGridTKNAMEKAF: TdxDBGridMaskColumn;
    dxDBGridTKShifrID: TdxDBGridColumn;
    dxDBGridTKNAMEKLOOKUP: TdxDBGridLookupColumn;
    BitBtn1: TBitBtn;
    pFIBQueryT: TpFIBQuery;
    pFIBTransactionQT: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSetTKCalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure AddTemaToSql(ShifrKaf:integer;Name:string);
    procedure ImportTemy;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditTemy : TFormEditTemy;

implementation
 uses ScrDef,ScrUtil,uFIBModule;

{$R *.dfm}

procedure TFormEditTemy.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetTemy.Active then
        pFIBDataSetTemy.Close;
     if pFIBDataSetTK.Active then
        pFIBDataSetTK.Close;
     if pFIBDataSetPodr.Active then
        pFIBDataSetPodr.Close;
     if pFIBDataSetTemy.Transaction.Active then
        pFIBDataSetTemy.Transaction.Commit;
     if pFIBDataSetTemy.UpdateTransaction.Active then
        pFIBDataSetTemy.UpdateTransaction.Commit;
     if pFIBDataSetTK.Transaction.Active then
        pFIBDataSetTK.Transaction.Commit;
     if pFIBDataSetTK.UpdateTransaction.Active then
        pFIBDataSetTK.UpdateTransaction.Commit;
     if pFIBDataSetPodr.Transaction.Active then
        pFIBDataSetPodr.Transaction.Commit;
     if Assigned(pFIBDataSetPodr.UpdateTransaction) then
        if pFIBDataSetPodr.UpdateTransaction.Active then
           pFIBDataSetPodr.UpdateTransaction.Commit;

      Action:=caFree;
end;

procedure TFormEditTemy.FormCreate(Sender: TObject);
begin
     if pFIBDataSetTemy.Active then
        pFIBDataSetTemy.Close;
     if pFIBDataSetTemy.Transaction.Active then
        pFIBDataSetTemy.Transaction.Commit;
     if pFIBDataSetTemy.UpdateTransaction.Active then
        pFIBDataSetTemy.UpdateTransaction.Commit;
     pFIBDataSetTemy.Transaction.StartTransaction;
     pFIBDataSetTemy.Active:=true;

     if pFIBDataSetTK.Active then
        pFIBDataSetTK.Close;
     if pFIBDataSetTK.Transaction.Active then
        pFIBDataSetTK.Transaction.Commit;
     if pFIBDataSetTK.UpdateTransaction.Active then
        pFIBDataSetTK.UpdateTransaction.Commit;
     pFIBDataSetTK.Transaction.StartTransaction;
     pFIBDataSetTK.Active:=true;

     if pFIBDataSetPodr.Active then
        pFIBDataSetPodr.Close;
     if pFIBDataSetPodr.Transaction.Active then
        pFIBDataSetPodr.Transaction.Commit;
     if Assigned(pFIBDataSetPodr.UpdateTransaction) then
        if pFIBDataSetPodr.UpdateTransaction.Active then
           pFIBDataSetPodr.UpdateTransaction.Commit;
     pFIBDataSetPodr.Transaction.StartTransaction;
     pFIBDataSetPodr.Active:=true;

end;

procedure TFormEditTemy.pFIBDataSetTKCalcFields(DataSet: TDataSet);
begin
      pFIBDataSetTKShifrID.Value:=pFIBDataSetTKSHIFRKAF.Value+pFIBDataSetTemySHIFRID.Value*1000;
end;

procedure TFormEditTemy.BitBtn1Click(Sender: TObject);
begin
     ImportTemy;
end;

procedure TFormEditTemy.ImportTemy;
var Dev      : TextFile;
    FName    : string;
    Name     : string;
    ShifrKaf : integer;
    S,S1     : string;
    I,J      : integer;
begin
     FName:=CDIR+'Temy.txt';
     if not fileexists(FName) then
        begin
              ShowMessage('Отсутствует файл '+FName);
              Exit;
        end;
     AssignFile(Dev,FName);
     Reset(Dev);
     while not eof(dev) do
       begin
             readln(dev,s);
         //    s:=trim(s);
             if Length(s)<5  then continue;
             if Length(s)>20 then continue;
             s1:=copy(s,1,3);
             val(s1,i,j);
             if j<>0 then continue;
             ShifrKaf:=i;
             Name:=copy(s,5,length(s)-4);
             Name:=trim(Name);
             if length(Name)<2 then continue;
             if ShifrKaf<1 then continue;
             Name:=DosToWin(Name);
             AddTemaToSql(ShifrKaf,Name);
       end;
     CloseFile(Dev);
     ShowMessage('Темы перенесены. Пожалуйста закройте и снова откройте окно со списком тем');
end;

procedure TFormEditTemy.AddTemaToSql(ShifrKaf:integer;Name:string);
 var shifrid,i:integer;
     SQLStmnt:string;
     NameKaf:string;
 begin
      { 1. Проверить наличие темы в основном спровочнике TB_QUERY}
      Name:=ReplQto2Q(Name);
      if pFIBQueryT.Open then
         pFIBQueryT.Close;
      if pFIBQueryT.Transaction.Active then
         pFIBQueryT.Transaction.Commit;
      pFIBQueryT.SQL.Clear;
      pFIBQueryT.SQL.Add('select count(*) from tb_temy where name='''+trim(Name)+'''');
      pFIBQueryT.Transaction.StartTransaction;
      pFIBQueryT.ExecQuery;
      i:=pFIBQueryT.Fields[0].AsInteger;
      pFIBQueryT.Close;

      if i=0 then   // Добавить в основной справочник
         begin
              pFIBQueryT.SQL.Clear;
              pFIBQueryT.SQL.Add('select max(shifrid) from tb_temy');
              pFIBQueryT.ExecQuery;
              ShifrId:=pFIBQueryT.Fields[0].AsInteger;
              pFIBQueryT.Close;
              Inc(ShifrId);
              pFIBQueryT.SQL.Clear;
              pFIBQueryT.SQL.Add('insert into tb_temy (shifrid,name) values ('+IntToStr(ShifrId)+','''+trim(Name)+''')');
              pFIBQueryT.ExecQuery;
              pFIBQueryT.Close;
         end
      else
         begin      // Извлечь код темы
              pFIBQueryT.SQL.Clear;
              pFIBQueryT.SQL.Add('select shifrid from tb_temy where name='''+trim(Name)+'''');
              pFIBQueryT.ExecQuery;
              ShifrId:=pFIBQueryT.Fields[0].AsInteger;
              pFIBQueryT.Close;
         end;

   {2. Проверит наличие связки в TB_TEMY_KAF }
      pFIBQueryT.SQL.Clear;
      pFIBQueryT.SQL.Add('select count(*) from tb_temy_kaf where shifridtemy='+inttostr(ShifrId)+' and shifrkaf='+IntToStr(ShifrKaf));
      pFIBQueryT.ExecQuery;
      i:=pFIBQueryT.Fields[0].AsInteger;
      pFIBQueryT.Close;
      if i=0 then  // Добавить связку
         begin
              NameKaf:=trim(Name_Serv(ShifrKaf));
              NameKaf:=ReplQto2Q(NameKaf);
              SQLStmnt:='insert into tb_temy_kaf (shifridtemy,shifrkaf,nametemy,namekaf) values(';
              SQLStmnt:=SQLStmnt+inttostr(ShifrId)+','+IntToStr(ShifrKaf);
              SQLStmnt:=SQLStmnt+','''+trim(Name)+'''';
              SQLStmnt:=SQLStmnt+','''+trim(NameKaf)+''')';
              pFIBQueryT.SQL.Clear;
              pFIBQueryT.SQL.Add(SQLStmnt);
              pFIBQueryT.ExecQuery;
              pFIBQueryT.Close;
         end;
      pFIBQueryT.Transaction.Commit;

 end;


end.
