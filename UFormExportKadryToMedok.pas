unit UFormExportKadryToMedok;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc;

type
  TFormExportKadryToMedok = class(TForm)
    ProgressBar1: TProgressBar;
    LabelFIO: TLabel;
    BitBtnExport: TBitBtn;
    BitBtn1: TBitBtn;
    dsKadry: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsKadryNAL_CODE: TFIBStringField;
    dsKadryFIO: TFIBStringField;
    ceValue: TcxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnExportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     startCode:integer;
     procedure MoveKadryToDBFMedok;
     function  MakeDBFFile:String;
     procedure getOldList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormExportKadryToMedok: TFormExportKadryToMedok;


implementation
  uses UFibModule,scrdef,dbf,scrutil,iniFiles,uFormWait;

type prec=^trec;
     trec=record
           code:integer;
           inn:string;
           fio:string;
          end;
var
   list:TList;

{$R *.dfm}

procedure TFormExportKadryToMedok.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormExportKadryToMedok.BitBtnExportClick(Sender: TObject);
var i:integer;
begin
     list      := TList.Create;
     startCode := 0;
     getOldList;
     MoveKadryToDBFMedok;
//     if list.count>0 then
//     for i:=1 to list.count do
//         disposeStr(pRec(list.Items[i-1])^)
     list.Free;
end;
procedure TFormExportKadryToMedok.MoveKadryToDBFMedok;
 var Rec:integer;
     SqlStmnt:String;
     v:Variant;
     sc:Integer;
     fname:string;
     dBase: TDBF;
     fam,nam,otc:shortstring;
     nal_code:string;
     pib:string;
//     startcode:Integer;
     ch:Char;
    function existsInList(nal_code:string):boolean;
     var i:integer;
         retVal:boolean;
     begin
          retVal:=false;
          if list.count<1 then
             begin
                  result:=retVal;
                  exit;
             end;
          if length(trim(nal_code))<>10 then
             begin
                  result:=retVal;
                  exit;
             end;
          for i:=1 to list.Count do
             begin
                  if trim(pRec(list.Items[i-1])^.inn)=trim(nal_code) then
                     begin
                          retVal:=true;
                          break;
                     end;

             end;
          result:=retVal;   
     end;
begin
     FName:=MakeDBFFile;
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
     dBase.Open;

 //    SqlStmnt:='select count(*)  from kadry where nal_code not in (select num from tb_medok_person) and fio is not null and nal_code is not null and exists (select * from fadd where fadd.year_vy=2014 and fadd.tabno=kadry.tabno)';
     SqlStmnt:='select count(*)  from kadry where fio is not null and nal_code is not null and exists (select * from fadd where fadd.year_vy>=2014 and fadd.tabno=kadry.tabno)';
     FormWait.Show;
     Application.ProcessMessages;
     v:=FIB.pFIBDatabaseSal.QueryValue(SqlStmnt,0);
     if VarIsNumeric(v) then
        rec:=v
     else
        begin
             FormWait.Hide;
             Application.ProcessMessages;
             ShowMessage('Ошибка запроса числа записей');
             Exit;
        end;
     dsKadry.Transaction.StartTransaction;
     dsKadry.Active:=true;
     FormWait.Hide;
     Application.ProcessMessages;
     ProgressBar1.Min:=0;
     ProgressBar1.Max:=rec;
     ProgressBar1.Position:=0;
     sc:=0;
//     startcode:=Round(ceValue.value);
     while not dsKadry.Eof do
      begin
           sc:=sc+1;
           ProgressBar1.Position:=sc;
           LabelFIO.Caption:=dsKadryFIO.Value;
           Application.ProcessMessages;
           pib:=dsKadryFIO.Value;
           pib:=Trim(pib);
           pib:=UPPER_STRING(PIB);
           SplitFIO(pib,fam,nam,otc);
           nal_code:=dsKadryNAL_CODE.Value;
           nal_code:=Trim(nal_code);
           if not existsInList(nal_code) then
           if Length(pib)>3 then
           if Length(nal_code)=10 then
           if IsNumericString(nal_code) then
              begin
                   Inc(startcode);
                   dBase.Append;
                   dBase.ClearFields;
                   dBASE.SetFieldData(1 , IntToStr(startCode));
                   dBASE.SetFieldData(2 , Nal_code);
//                   PIB:=WinToDos(pib);
//                   fam:=WinToDos(fam);
//                   nam:=WinToDos(nam);
//                   otc:=WinToDos(otc);
                   dBASE.SetFieldData(3 , pib);
                   ch:=nal_code[9];
                   if ch in ['0','2','4','6','8'] then
                      dBASE.SetFieldData(4 , '1')
                   else
                      dBASE.SetFieldData(4 , '0');
                   dBASE.SetFieldData(29 , Fam);
                   dBASE.SetFieldData(30 , Nam);
                   dBASE.SetFieldData(31 , Otc);
                   dBASE.SetFieldData(32 , '1');
                   dBase.Post;

              end;


           dsKadry.Next;
      end;
     dBase.Close;
     dBase.Free;
     dsKadry.Active:=false;
     dsKadry.Transaction.commit;
     ShowMessage('Формирование закончено');

end;
function TFormExportKadryToMedok.MakeDBFFile:String;
 const FNameINI='DScroll.Ini';
 var
    Ini      : TIniFile ;
    S        : string   ;
    DBFDir   : string   ;
    Ch       : string   ;
    DBFNameE : string   ;
    DBFNameD : string   ;
 begin
     S   := ExtractFilePath(Application.ExeName)+FNameINI;
     Ini := TIniFile.Create(S);
     try
         DBFDir := Ini.ReadString( 'Parameters', 'PFUDir', '' );
     finally
         Ini.Free;
     end;
     DBFDir:=Trim(DBFDir);
     if Length(DBFDir)<5 then
        begin
             ShowMessage('Не указан параметр PFUDir в файле DScroll.ini');
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
     DBFNameE:=DBFDir+'personse.dbf';
     if not FileExists(DBFNameE) then
        begin
             ShowMessage('Отсутствует файл '+DBFNameE);
             Result:='';
             Exit;
        end;
     DBFNameD:=DBFDir+'persons.dbf';
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

procedure TFormExportKadryToMedok.FormCreate(Sender: TObject);
begin
    //  ceValue.Value:=107234;
      ceValue.Value:=109800;
end;

procedure TFormExportKadryToMedok.getOldList;
   var fName : string;
       dBase : TDBF;
       rec   : pRec;
       codeS : String;
       FIO   : String;
       Inn   : String;
       code  : integer;
       iErr,iVal:integer;
      function MakeDBFFile:String;
        const FNameINI='DScroll.Ini';
        var
           Ini      : TIniFile ;
           S        : string   ;
           DBFDir   : string   ;
           Ch       : string   ;
           DBFName  : string   ;
        begin
            S   := ExtractFilePath(Application.ExeName)+FNameINI;
            Ini := TIniFile.Create(S);
            try
               DBFDir := Ini.ReadString( 'Parameters', 'PFUDir', '' );
            finally
               Ini.Free;
            end;
            DBFDir:=Trim(DBFDir);
            if Length(DBFDir)<5 then
               begin
                    ShowMessage('Не указан параметр PFUDir в файле DScroll.ini');
                    Result:='';
                    Exit;
               end;
            if not DirectoryExists(DBFDir) then
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
            DBFName:=DBFDir+'personsold.dbf';
            if not FileExists(DBFName) then
               begin
                    ShowMessage('Отсутствует файл '+DBFName);
                    Result:='';
                    Exit;
               end;
            Result:=DBFName;
        end;
 begin
      fname:=MakeDBFFile;
      if length(trim(fname))<5 then exit;
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
     dBase.Open;
     dBase.First;
     while not dBase.Eof do
        begin
             codeS:=dBase.GetFieldData(1);
             val(codeS,iVal,iErr);
             if (iErr=0) then
                begin
                     code := iVal;
                     if code>startCode then
                        startCode:=code;
                     inn  := dBase.GetFieldData(2);
                     fio  := dBase.GetFieldData(3);
                     if ( (code>0)
                           and
                           (length(trim(inn))=10)
                           and
                           (length(trim(fio))>5)
                        ) then
                        begin
                            rec:=new(pRec);
                            rec^.code := code ;
                            rec^.inn  := inn  ;
                            rec^.fio  := fio  ;
                            list.Add(rec);
                        end;
                end;
             dBase.Next;
        end;
     dBase.Close;
     dBase.Free;
      
 end;

end.
