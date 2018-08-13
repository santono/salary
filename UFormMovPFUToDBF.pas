unit UFormMovPFUToDBF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery;

type
  TFormMovPFUToDBF = class(TForm)
    ProgressBarPFU: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabelUp: TLabel;
    LabelDown: TLabel;
    pFIBQueryPFU: TpFIBQuery;
    pFIBTransactionPFURead: TpFIBTransaction;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    function MakeDBFFile(FNameDBF:String):string;
    procedure FillDBFTable(ModeDBF:integer);


  public
        WantedYear  : integer;
        WantedMonth : integer;
    { Public declarations }
  end;

var
  FormMovPFUToDBF: TFormMovPFUToDBF;

implementation
  uses DBF,UFibModule,IniFiles,ScrUtil;

{$R *.dfm}

procedure TFormMovPFUToDBF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;


function TFormMovPFUToDBF.MakeDBFFile(FNameDBF:String):String;
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
     DBFNameE:=DBFDir+FNameDBF+'E.dbf';
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

procedure TFormMovPFUToDBF.BitBtn1Click(Sender: TObject);
var dBase: TDBF;
    RecordBound, ix : integer ;
    fmsFloatPoint : TFormatSettings;
    iCheckMode    : integer   ;
    FName         : string    ;
    SQLStmnt      : string    ;
    Fam,Nam,Otc   : string    ;
    NumIdent      : string    ;
    Start_Dt      : integer   ;
    End_Dt        : integer   ;
    FNameDBF      : string    ;


begin
     FillDBFTable(5);
     exit;
     FNameDBF := 'p04t05b';
     FName:=MakeDBFFile(FNameDBF);
     FName:=trim(FName);
     if Length(FName)<5 then Exit;
     if pFIBQueryPFU.Open then
        pFIBQueryPFU.Close;
     if pFIBQueryPFU.Transaction.Active then
        pFIBQueryPFU.Transaction.Commit;

     SQLStmnt:='select count(*) from tb_p04t05b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
     pFIBQueryPFU.Transaction.StartTransaction;
     pFIBQueryPFU.SQL.Clear;

     pFIBQueryPFU.SQL.Add(SQLStmnt);
     pFIBQueryPFU.ExecQuery;
     RecordBound:=pFIBQueryPFU.Fields[0].AsInteger;
     if RecordBound<1 then
        begin
             ShowMessage('Нет записей в таблице');
             pFIBQueryPFU.Close;
             pFIBQueryPFU.Transaction.Commit;
             Exit;
        end;

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
     pFIBQueryPFU.Close;

     SQLStmnt:='select numident,fio,nm,ftn,start_dt,end_dt from tb_p04t05b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
     pFIBQueryPFU.SQL.Clear;
     pFIBQueryPFU.SQL.Add(SQLStmnt);
     pFIBQueryPFU.ExecQuery;
     ProgressBarPFU.Min:=0;
     ProgressBarPFU.Max:=RecordBound;
     ProgressBarPFU.Position:=0;
     ix:=0;
     while not pFIBQueryPFU.Eof do
       begin
              dBASE.Append;
              NumIdent:=pFIBQueryPFU.Fields[0].AsString;
              Fam:=pFIBQueryPFU.Fields[1].AsString;
              Nam:=pFIBQueryPFU.Fields[2].AsString;
              Otc:=pFIBQueryPFU.Fields[3].AsString;
         //     Fam:=WinToDos(Fam);
         //     Nam:=WinToDos(Nam);
         //     Otc:=WinToDos(Otc);
              Start_Dt := pFIBQueryPFU.Fields[4].AsInteger;
              End_Dt   := pFIBQueryPFU.Fields[5].AsInteger;
              dBASE.SetFieldData(1 , '0');
              dBASE.SetFieldData(2 , NumIdent);
              dBASE.SetFieldData(3 , Fam);
              dBASE.SetFieldData(4 , Nam);
              dBASE.SetFieldData(5 , Otc);
              dBASE.SetFieldData(6 , IntToStr(Start_Dt));
              dBASE.SetFieldData(7 , IntToStr(End_Dt));
              dBase.Post;
              inc(ix);
              ProgressBarPFU.Position := ix;
              LabelDown.Caption:=IntToStr(ix)+' / '+IntToStr(RecordBound);
              application.ProcessMessages;
              pFIBQueryPFU.Next;
       end;
  //   dBase.Post;
     dBase.Close;
     dBase.Free;
     if pFIBQueryPFU.Open then
        pFIBQueryPFU.Close;
     if pFIBQueryPFU.Transaction.Active then
        pFIBQueryPFU.Transaction.Commit;

end;

procedure TFormMovPFUToDBF.BitBtn3Click(Sender: TObject);
begin
     FillDBFTable(6);
end;

procedure TFormMovPFUToDBF.FillDBFTable(ModeDBF:integer);
var dBase: TDBF;
    RecordBound, ix : integer ;
    fmsFloatPoint   : TFormatSettings;
    iCheckMode      : integer   ;
    FName           : string    ;
    SQLStmnt        : string    ;
    FNameDBF        : string    ;

function GetName(ModeDBF:integer):string;
 begin
       case ModeDbf of
        5 :  Result:='p04t05b';
        6 :  Result:='p04t06b';
        7 :  Result:='p04t07b';
        8 :  Result:='p04t08b';
       else
            Result:='';
       end;
 end;

function BuildSQLStmnt(ModeDBF:integer):string;
 begin
       case ModeDBF of
        5:
           result:='select numident,fio,nm,ftn,start_dt,end_dt from tb_p04t05b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
        6:
           result:='select numident,fio,nm,ftn,zo,zic,sum_total,sum_max,sum_ins,otk,exp from tb_p04t06b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
        7:
           result:='select numident,fio,nm,ftn,zo,zic,pay_mnth,pay_year,pay_tp,sum_total,sum_max,sum_ins,otk,exp from tb_p04t07b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
        8:
           result:='select numident,fio,nm,ftn,c_pid,days,start_dt,end_dt,season from tb_p04t08b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
        else
           result:='';
       end;
 end;

 function FillDBFRecord(ModeDBF:integer):boolean;
  var
     Fam,Nam,Otc    : string    ;
     NumIdent       : string    ;
     Start_Dt       : integer   ;
     End_Dt         : integer   ;
     zo,zic,otk,exp : integer   ;
     pay_mnth,pay_year,pay_tp     : integer   ;
     Sum_Total,Sum_Max,Sum_Ins    : real;
     Sum_TotalS,Sum_MaxS,Sum_InsS : string;
     days,season                  : integer;
     c_pid                        : string;
 begin
       case ModeDBF of
        5:begin
              NumIdent:=pFIBQueryPFU.Fields[0].AsString;
              Fam:=pFIBQueryPFU.Fields[1].AsString;
              Nam:=pFIBQueryPFU.Fields[2].AsString;
              Otc:=pFIBQueryPFU.Fields[3].AsString;
  //            Fam:=WinToDos(Fam);
  //            Nam:=WinToDos(Nam);
  //            Otc:=WinToDos(Otc);
              Start_Dt := pFIBQueryPFU.Fields[4].AsInteger;
              End_Dt   := pFIBQueryPFU.Fields[5].AsInteger;
              dBASE.SetFieldData(1 , '0');
              dBASE.SetFieldData(2 , NumIdent);
              dBASE.SetFieldData(3 , Fam);
              dBASE.SetFieldData(4 , Nam);
              dBASE.SetFieldData(5 , Otc);
              dBASE.SetFieldData(6 , IntToStr(Start_Dt));
              dBASE.SetFieldData(7 , IntToStr(End_Dt));
              result:=true;
          end ;
        6:begin
              NumIdent:=pFIBQueryPFU.Fields[0].AsString;
              Fam:=pFIBQueryPFU.Fields[1].AsString;
              Nam:=pFIBQueryPFU.Fields[2].AsString;
              Otc:=pFIBQueryPFU.Fields[3].AsString;
   //           Fam:=WinToDos(Fam);
   //           Nam:=WinToDos(Nam);
   //           Otc:=WinToDos(Otc);
              zo  := pFIBQueryPFU.Fields[4].AsInteger;
              zic := pFIBQueryPFU.Fields[5].AsInteger;
              sum_total := pFIBQueryPFU.Fields[6].AsFloat;
              sum_max := pFIBQueryPFU.Fields[7].AsFloat;
              sum_ins := pFIBQueryPFU.Fields[8].AsFloat;
              otk := pFIBQueryPFU.Fields[9].AsInteger;
              exp := pFIBQueryPFU.Fields[10].AsInteger;
              sum_totals := format('%10.2f',[sum_total]);
              sum_maxs   := format('%10.2f',[sum_max]);
              sum_inss   := format('%10.2f',[sum_ins]);
              sum_totals := ReplChar(sum_totals,',','.');
              sum_maxs   := ReplChar(sum_maxs,',','.');
              sum_inss   := ReplChar(sum_inss,',','.');
              dBASE.SetFieldData(1 , '0');
              dBASE.SetFieldData(2 , NumIdent);
              dBASE.SetFieldData(3 , Fam);
              dBASE.SetFieldData(4 , Nam);
              dBASE.SetFieldData(5 , Otc);
              dBASE.SetFieldData(6 , IntToStr(zo));
              dBASE.SetFieldData(7 , IntToStr(zic));
              dBASE.SetFieldData(8 , sum_totals);
              dBASE.SetFieldData(9 , sum_maxs);
              dBASE.SetFieldData(10 , sum_inss);
              dBASE.SetFieldData(11 , IntToStr(otk));
              dBASE.SetFieldData(12 , IntToStr(exp));
          end;
        7:begin
              NumIdent:=pFIBQueryPFU.Fields[0].AsString;
              Fam:=pFIBQueryPFU.Fields[1].AsString;
              Nam:=pFIBQueryPFU.Fields[2].AsString;
              Otc:=pFIBQueryPFU.Fields[3].AsString;
    //          Fam:=WinToDos(Fam);
    //          Nam:=WinToDos(Nam);
   //           Otc:=WinToDos(Otc);
              zo  := pFIBQueryPFU.Fields[4].AsInteger;
              zic := pFIBQueryPFU.Fields[5].AsInteger;
              pay_mnth := pFIBQueryPFU.Fields[6].AsInteger;
              pay_year := pFIBQueryPFU.Fields[7].AsInteger;
              pay_tp := pFIBQueryPFU.Fields[8].AsInteger;
              sum_total := pFIBQueryPFU.Fields[9].AsFloat;
              sum_max := pFIBQueryPFU.Fields[10].AsFloat;
              sum_ins := pFIBQueryPFU.Fields[11].AsFloat;
              otk := pFIBQueryPFU.Fields[12].AsInteger;
              exp := pFIBQueryPFU.Fields[13].AsInteger;
              sum_totals := format('%10.2f',[sum_total]);
              sum_maxs   := format('%10.2f',[sum_max]);
              sum_inss   := format('%10.2f',[sum_ins]);
              sum_totals := ReplChar(sum_totals,',','.');
              sum_maxs   := ReplChar(sum_maxs,',','.');
              sum_inss   := ReplChar(sum_inss,',','.');
              dBASE.SetFieldData(1 , '0');
              dBASE.SetFieldData(2 , NumIdent);
              dBASE.SetFieldData(3 , Fam);
              dBASE.SetFieldData(4 , Nam);
              dBASE.SetFieldData(5 , Otc);
              dBASE.SetFieldData(6 , IntToStr(zo));
              dBASE.SetFieldData(7 , IntToStr(zic));
              dBASE.SetFieldData(8 , IntToStr(pay_mnth));
              dBASE.SetFieldData(9 , IntToStr(pay_year));
              dBASE.SetFieldData(10 , IntToStr(pay_tp));
              dBASE.SetFieldData(11 , sum_totals);
              dBASE.SetFieldData(12 , sum_maxs);
              dBASE.SetFieldData(13 , sum_inss);
              dBASE.SetFieldData(14 , IntToStr(otk));
              dBASE.SetFieldData(15 , IntToStr(exp));
          end;
        8:begin
              NumIdent:=pFIBQueryPFU.Fields[0].AsString;
              Fam:=pFIBQueryPFU.Fields[1].AsString;
              Nam:=pFIBQueryPFU.Fields[2].AsString;
              Otc:=pFIBQueryPFU.Fields[3].AsString;
              c_pid:=pFIBQueryPFU.Fields[4].AsString;
    //          Fam:=WinToDos(Fam);
    //          Nam:=WinToDos(Nam);
    //          Otc:=WinToDos(Otc);
    //          c_pid:=WinToDos(c_pid);
              days     := pFIBQueryPFU.Fields[5].AsInteger;
              start_dt := pFIBQueryPFU.Fields[6].AsInteger;
              end_dt   := pFIBQueryPFU.Fields[7].AsInteger;
              season   := pFIBQueryPFU.Fields[8].AsInteger;
              dBASE.SetFieldData(1 , '0');
              dBASE.SetFieldData(2 , NumIdent);
              dBASE.SetFieldData(3 , Fam);
              dBASE.SetFieldData(4 , Nam);
              dBASE.SetFieldData(5 , Otc);
              dBASE.SetFieldData(6 , c_pid);
              dBASE.SetFieldData(7 , IntToStr(days));
              dBASE.SetFieldData(8 , IntToStr(start_dt));
              dBASE.SetFieldData(9 , IntToStr(end_dt));
              dBASE.SetFieldData(13, IntToStr(season));
          end;

        else
           result:=false;
       end;
 end;

begin
     FNameDBF := GetName(ModeDBF);
     if Length(Trim(FNameDBF))<5 then Exit;
     LabelUp.Caption:='Перенос таблицы '+FNameDBF;;
     Application.ProcessMessages;
     FName:=MakeDBFFile(FNameDBF);
     FName:=trim(FName);
     if Length(FName)<5 then Exit;
     if pFIBQueryPFU.Open then
        pFIBQueryPFU.Close;
     if pFIBQueryPFU.Transaction.Active then
        pFIBQueryPFU.Transaction.Commit;
     SQLStmnt:='select count(*) from tb_'+FNameDBF+' where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
     pFIBQueryPFU.Transaction.StartTransaction;
     pFIBQueryPFU.SQL.Clear;

     pFIBQueryPFU.SQL.Add(SQLStmnt);
     pFIBQueryPFU.ExecQuery;
     RecordBound:=pFIBQueryPFU.Fields[0].AsInteger;
     if RecordBound<1 then
        begin
             ShowMessage('Нет записей в таблице');
             pFIBQueryPFU.Close;
             pFIBQueryPFU.Transaction.Commit;
             Exit;
        end;

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
     pFIBQueryPFU.Close;
//     SQLStmnt:='select numident,fio,nm,ftn,start_dt,end_dt from tb_p04t05b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
     SQLStmnt:=BuildSQLStmnt(ModeDBF);
     pFIBQueryPFU.SQL.Clear;
     pFIBQueryPFU.SQL.Add(SQLStmnt);
     pFIBQueryPFU.ExecQuery;
     ProgressBarPFU.Min:=0;
     ProgressBarPFU.Max:=RecordBound;
     ProgressBarPFU.Position:=0;
     ix:=0;
     while not pFIBQueryPFU.Eof do
       begin
              dBASE.Append;
              FillDBFRecord(ModeDBF);
              dBase.Post;
              inc(ix);
              ProgressBarPFU.Position := ix;
              LabelDown.Caption:=IntToStr(ix)+' / '+IntToStr(RecordBound);
              application.ProcessMessages;
              pFIBQueryPFU.Next;
       end;
     dBase.Close;
     dBase.Free;
     if pFIBQueryPFU.Open then
        pFIBQueryPFU.Close;
     if pFIBQueryPFU.Transaction.Active then
        pFIBQueryPFU.Transaction.Commit;

end;



procedure TFormMovPFUToDBF.BitBtn4Click(Sender: TObject);
begin
     FillDBFTable(7);
end;

procedure TFormMovPFUToDBF.BitBtn5Click(Sender: TObject);
begin
     FillDBFTable(8);
end;

procedure TFormMovPFUToDBF.BitBtn6Click(Sender: TObject);
begin
     FillDBFTable(5);
     FillDBFTable(6);
     FillDBFTable(7);
     FillDBFTable(8);
end;

end.
