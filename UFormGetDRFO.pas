unit UFormGetDRFO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, FIBQuery, pFIBQuery, FIBDatabase,
  pFIBDatabase;

type
  TFormGetDRFO = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBarDRFO: TProgressBar;
    OpenDialogDRFO: TOpenDialog;
    pFIBTransactionDRFO: TpFIBTransaction;
    pFIBQueryDRFO: TpFIBQuery;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    function SelectFile(var FName:String):boolean;
  public
    { Public declarations }
  end;

var
  FormGetDRFO: TFormGetDRFO;

implementation
  uses DBF,UFibModule,ScrUtil;

{$R *.dfm}

procedure TFormGetDRFO.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormGetDRFO.BitBtn1Click(Sender: TObject);
var FName:String;
    ShifrId,ShifrIdSBB:integer;
    dBase: TDBF;
    dBaseRecordBound, ix, cntImportedRecords, cntImportedRecordsVisible: integer;
    fmsFloatPoint : TFormatSettings;
    iCheckMode    : integer;
    SQLText       : string;
    FileName      : string;
    Rec           : integer;
    TIN,FULLN_U,NAME_U,FATH_U,D_ROG,POL:string;
    function StringDBFToDate(const S: string): TDate;
     var
        Year, Month, Day: Word;
     begin
         Year := StrToIntDef(Copy(S, 7, 2), 1)+1900;
         Month:= StrToIntDef(Copy(S, 4, 2), 1);
         Day  := StrToIntDef(Copy(S, 1, 2), 1);
         try
            Result:= EncodeDate(Year, Month, Day);
         except
            Result:= 0;
         end;
    end;
    function StringDBFToString(const S: string): String;
     var
        Year, Month, Day: Word;
     begin
         Year := StrToIntDef(Copy(S, 7, 2), 1)+1900;
         Month:= StrToIntDef(Copy(S, 4, 2), 1);
         Day  := StrToIntDef(Copy(S, 1, 2), 1);
         Result:=IntToStr(Year)+'-'+IntToStr(Month)+'-'+IntToStr(Day);
    end;
begin
     if not SelectFile(FName) then Exit;
     if not FileExists(FName) then Exit;
     FileName := ExtractFileName(FName);
     cntImportedRecords := 0;
     cntImportedRecordsVisible := 0;

     fmsFloatPoint.DecimalSeparator := '.';

     iCheckMode := 0;

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

     Label1.Caption := 'Чистка записей в таблице DRFO FireBird.';
     Application.ProcessMessages;
     if pFIBQueryDRFO.Open then
        pFIBQueryDRFO.Close;
     if not pFIBQueryDRFO.Transaction.Active then
        pFIBQueryDRFO.Transaction.StartTransaction;
     pFIBQueryDRFO.SQL.CLear;
     pFIBQueryDRFO.SQL.Add('delete from tb_drfo');
     pFIBQueryDRFO.ExecQuery;
     Label1.Caption := 'Перенос записей в таблицу TB_DRFO ';
     Application.ProcessMessages;
     dBaseRecordBound   := dBase.RecordCount - 1;
     ProgressBarDRFO.Min := 0;
     ProgressBarDRFO.Max := dBaseRecordBound;
     Rec:=dBaseRecordBound;
     for ix:=0 to Rec do begin
  //       if not dBase.Deleted then begin
            if pFIBQueryDRFO.Open then
               pFIBQueryDRFO.Close;
            pFIBQueryDRFO.SQL.Clear;
            TIN     := dBase.GetFieldData(1);
            FULLN_U := ReplQto2Q(dBase.GetFieldData(2));
            NAME_U  := ReplQto2Q(dBase.GetFieldData(3));
            FATH_U  := ReplQto2Q(dBase.GetFieldData(4));
            D_ROG   := StringDBFToString(dBase.GetFieldData(5));
            POL     := dBase.GetFieldData(6);
            SQLText := 'insert into tb_drfo values(';
            SQLText := trim(SQLText)+''''+TIN+''',';
            SQLText := trim(SQLText)+''''+FULLN_U+''',';
            SQLText := trim(SQLText)+''''+NAME_U+''',';
            SQLText := trim(SQLText)+''''+FATH_U+''',';
            SQLText := trim(SQLText)+''''+D_ROG+''',';
            SQLText := trim(SQLText)+''''+POL+''',NULL)';
            pFIBQueryDRFO.SQL.Add(SQLText);
            pFIBQueryDRFO.ExecQuery;
//StringDBFToDate(dBase.GetFieldData(17));
            ProgressBarDRFO.Position := ix;
            Label1.Caption:=IntToStr(ix)+' / '+IntToStr(dBaseRecordBound);
            application.ProcessMessages;
            dbase.next;
         end;
//     end;
     dBase.Close;
     dBase.Free;
     pFIBQueryDRFO.Close;
     pFIBQueryDRFO.Transaction.Commit;


end;





function TFormGetDRFO.SelectFile(var FName:String):boolean;
 begin
      FName:='';
      OpenDialogDRFO.Title := 'Укажите файл DRFO';
      if not OpenDialogDRFO.Execute then Exit;
      FName:=OpenDialogDRFO.FileName;
      if not FileExists(FName) then
         begin
               ShowMessage('Отсутствует файл '+FName);
               FName:='';
               Result:=false;
               Exit;
         end;
      Result:=true;
 end;
end.
