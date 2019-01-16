unit UFormReeBolPr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, DB, FIBDataSet, FIBDatabase, pFIBDatabase, pFIBDataSet,
  ExtCtrls, DBCtrls, Menus, frxClass, frxDBSet, FIBQuery, pFIBQuery;

type
  TFormReeBolPr = class(TForm)
    DataSourceRBPr: TDataSource;
    DBNavigator1: TDBNavigator;
    pFIBDataSetRBPr: TpFIBDataSet;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSetRBPrSHIFRID: TFIBIntegerField;
    pFIBDataSetRBPrNOMER_B: TFIBStringField;
    pFIBDataSetRBPrFIO: TFIBStringField;
    pFIBDataSetRBPrF_DATA: TFIBDateField;
    pFIBDataSetRBPrL_DATA: TFIBDateField;
    pFIBDataSetRBPrSUMMA_B: TFIBBCDField;
    pFIBDataSetRBPrSUMMA_P: TFIBBCDField;
    pFIBDataSetRBPrSUMMA_E: TFIBBCDField;
    pFIBDataSetRBPrSUMMA_BA: TFIBBCDField;
    dxDBGridRB: TdxDBGrid;
    dxDBGridRBSHIFRID: TdxDBGridMaskColumn;
    dxDBGridRBNOMER_B: TdxDBGridMaskColumn;
    dxDBGridRBFIO: TdxDBGridMaskColumn;
    dxDBGridRBF_DATA: TdxDBGridDateColumn;
    dxDBGridRBL_DATA: TdxDBGridDateColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    dxDBGridRBSUMMA_B: TdxDBGridCalcColumn;
    dxDBGridRBSUMMA_P: TdxDBGridCalcColumn;
    dxDBGridRBSUMMA_E: TdxDBGridCalcColumn;
    dxDBGridRBSUMMA_BA: TdxDBGridCalcColumn;
    pFIBDataSetRBPrSHORFIO: TStringField;
    pFIBDataSetRBPrTABNO: TFIBSmallIntField;
    pFIBDataSetRBPrsummab: TStringField;
    frxDBDatasetPlt: TfrxDBDataset;
    N2: TMenuItem;
    frxReportPlt: TfrxReport;
    pFIBDataSetRBPrINN: TFIBStringField;
    N3: TMenuItem;
    pFIBDataSetBuh: TpFIBDataSet;
    pFIBTransactionBuh: TpFIBTransaction;
    DataSourceBuh: TDataSource;
    pFIBDataSetBuhSHIFRWRK: TFIBIntegerField;
    pFIBDataSetBuhFIOOP: TFIBStringField;
    pFIBDataSetRBPrSHIFRBUH: TFIBSmallIntField;
    pFIBDataSetRBPrNAMEBUH: TStringField;
    dxDBGridRBColumn10: TdxDBGridLookupColumn;
    frxReportBay: TfrxReport;
    N4: TMenuItem;
    pFIBQueryB: TpFIBQuery;
    pFIBTransactionQ: TpFIBTransaction;
    pFIBDataSetRBPrSHIFRIDBOLN: TFIBIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    constructor CreateRB(ShifrId:integer;AOwner: TComponent);
    procedure N1Click(Sender: TObject);
    procedure pFIBDataSetRBPrCalcFields(DataSet: TDataSet);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pFIBDataSetRBPrBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    function MakeDBFFile(FNameDBF:String):String;
    procedure FillDBFTable;


  public
    WantedShifrIdRee:integer;
    { Public declarations }
  end;

var
  FormReeBolPr: TFormReeBolPr;

implementation
 uses ufibmodule, UFormReeBolFill,ScrUtil,DBF,IniFiles;

{$R *.dfm}



constructor TFormReeBolPr.CreateRB(ShifrId:integer;AOwner: TComponent);

 begin
      inherited Create(AOwner);
      WantedShifrIdRee:=Shifrid;
      pFIBDataSetRBPr.Params[0].AsInteger:=ShifrId;
      pFIBDataSetRBPr.Transaction.StartTransaction;
      pFIBDataSetRBPr.Open;
 end;

procedure TFormReeBolPr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      pFIBDataSetRBPr.Close;
      pFIBDataSetRBPr.Transaction.Commit;
      if pFIBDataSetRBPr.UpdateTransaction.Active then
         pFIBDataSetRBPr.UpdateTransaction.Commit;
      pFIBDataSetBuh.Close;
      pFIBDataSetBuh.Transaction.Commit;


end;



procedure TFormReeBolPr.N1Click(Sender: TObject);
begin
     FormReeBolPrFill:=TFormReeBolPrFill.CreateRB(WantedShifrIdRee,Self);
     FormReeBolPrFill.ShowModal;
     pFIBDataSetRBPr.Close;
     pFIBDataSetRBPr.Open;
end;

procedure TFormReeBolPr.pFIBDataSetRBPrCalcFields(DataSet: TDataSet);
var s:string;
    a:real;
begin
     pFIBDataSetRBPrSHORFIO.Value:=short_fio(pFIBDataSetRBPrFIO.Value);
     a:=pFIBDataSetRBPrSUMMA_BA.Value;
     s:=format('%12.2f',[a]);
     s:=replchar(s,'.','-');
     s:=replchar(s,',','-');
     pFIBDataSetRBPrsummab.Value:=s;
end;

procedure TFormReeBolPr.N2Click(Sender: TObject);
begin
     frxReportPlt.ShowReport;
end;


procedure TFormReeBolPr.FillDBFTable;
var dBase: TDBF;
    RecordBound, ix : integer ;
    fmsFloatPoint : TFormatSettings;
    iCheckMode    : integer   ;
    FName         : string    ;
    FNameDBF      : string    ;

function GetName:string;
 begin
      Result:='bank';
 end;


  function FillDBFRecord:boolean;
  var
     tabno          : integer   ;
     TabnoS         : string    ;
     FIO,INN        : string    ;
     Summa          : real      ;
     SummaS         : string    ;
 begin
       tabno := pFIBDataSetRBPrTABNO.Value;
       FIO   := pFIBDataSetRBPrFIO.Value;
       INN   := pFIBDataSetRBPrINN.Value;
       Summa := pFIBDataSetRBPrSumma_Ba.Value;
       FIO   := WinToDos(FIO);
       dBASE.SetFieldData(1 , IntToStr(Tabno));
       dBASE.SetFieldData(2 , FIO);
       dBASE.SetFieldData(4 , INN);
       summas := format('%12.2f',[summa]);
       summas := ReplChar(summas,',','.');
       dBASE.SetFieldData(3 , summas);
       result:=true;
 end;

begin
     FNameDBF := GetName;
     if Length(Trim(FNameDBF))<4 then Exit;
     Application.ProcessMessages;
     FName:=MakeDBFFile(FNameDBF);
     FName:=trim(FName);
     if Length(FName)<5 then Exit;

     fmsFloatPoint.DecimalSeparator := '.';


     try
        dBase:=TDBF.Create(Self);
     except
       on E: Exception do begin
           messagebox(0,pchar(E.Message),'Ошибка',16);
           dBase.Free;
           Exit;
       end;
     end;
     dBase.TableName:=FName;
//  dBase.CodePage:=OEM;
     dBase.Open;
//     SQLStmnt:='select numident,fio,nm,ftn,start_dt,end_dt from tb_p04t05b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
     pFIBDataSetRBPr.First;
     ix:=0;
     while not pFIBDataSetRBPr.Eof do
       begin
              dBASE.Append;
              FillDBFRecord;
              dBase.Post;
              inc(ix);
              pFIBDataSetRBPr.Next;
       end;
     dBase.Close;
     dBase.Free;

end;

function TFormReeBolPr.MakeDBFFile(FNameDBF:String):String;
 const FNameINI='DScroll.Ini';
 var
    Ini      : TIniFile ;
    S        : string   ;
    DBFDir   : string   ;
    Ch       : string   ;
    DBFNameE : string   ;
    DBFNameD : string   ;
    fName    : string   ;

 begin
     fName:=getIniFileName;
     s:=fName;
//     S   := ExtractFilePath(Application.ExeName)+FNameINI;
     Ini := TIniFile.Create(S);
     try
         DBFDir := Ini.ReadString( 'Parameters', 'IllRDir', '' );
     finally
         Ini.Free;
     end;
     DBFDir:=Trim(DBFDir);
     if Length(DBFDir)<5 then
        begin
             ShowMessage('Не указан параметр IllRDir в файле DScroll.ini');
             Result:='';
             Exit;
        end;
     if not DirectoryExists(DBFDir) then
     if not CreateDir(DBFDir)       then
        begin
             ShowMessage('Отсутствует каталог '+DBFDir+' и не возможно создать его');
             Result:='';
             Exit;
        end;
     Ch:=copy(DBFDir,Length(DBFDir),1);
     if (not (Ch[1]  in ['\','/'])) then
        begin
              if pos('\',DBFDir)>0 then DBFDir:=DBFDir+'\'
              else
              if pos('/',DBFDir)>0 then DBFDir:=DBFDir+'/';
        end;
     DBFNameE:=DBFDir+'BankE.dbf';
     if not FileExists(DBFNameE) then
        begin
             ShowMessage('Отсутствует файл '+DBFNameE);
             Result:='';
             Exit;
        end;
     DBFNameD:=DBFDir+FNameDBF+'.dbf';
     if FileExists(DBFNameD)     then
     if not DeleteFile(DBFNameD) then
        begin
             ShowMessage('Ошибка удаления файла  '+DBFNameD);
             Result:='';
             Exit;
        end;
     if not CopyFile(PChar(DBFNameE),PChar(DBFNameD),true) then
        begin
             ShowMessage('Ошибка копирования файла '+DBFNameE+' в '+ DBFNameD);
             Result:='';
             Exit;
        end;
     Result:=DBFNameD;
 end;

procedure TFormReeBolPr.N3Click(Sender: TObject);
begin
     FillDBFTable;
end;

procedure TFormReeBolPr.N4Click(Sender: TObject);
begin
      frxReportBay.ShowReport;
end;

procedure TFormReeBolPr.FormCreate(Sender: TObject);
begin
      pFIBDataSetBuh.Transaction.StartTransaction;
      pFIBDataSetBuh.Open;

end;

procedure TFormReeBolPr.pFIBDataSetRBPrBeforeDelete(DataSet: TDataSet);
 var SQLStmnt:String;
     Id : integer;
begin
     if pFIBQueryB.Transaction.Active then
        pFIBQueryB.Transaction.Commit;
     if pFIBQueryB.Open then
        pFIBQueryB.Close;
     if pFIBDataSetRBPrSHIFRIDBOLN.IsNull then Exit;
     Id:=pFIBDataSetRBPrSHIFRIDBOLN.Value;
     SQLStmnt:='update boln set shifridreb = 0 where shifrid='+IntToStr(Id);
     pFIBQueryB.SQL.Clear;
     pFIBQueryB.SQL.Add(SQLStmnt);
     pFIBQueryB.Transaction.StartTransaction;
     try
             pFIBQueryB.ExecQuery;
     except
     end;
     pFIBQueryB.Close;
     pFIBQueryB.Transaction.Commit;

end;

end.
