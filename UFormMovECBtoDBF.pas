{$WARNINGS OFF}
{$HINTS OFF}
unit UFormMovECBtoDBF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery;

type
  TFormMovECBtoDBF = class(TForm)
    ProgressBarPFU: TProgressBar;
    BitBtn2: TBitBtn;
    LabelUp: TLabel;
    LabelDown: TLabel;
    pFIBQueryECB: TpFIBQuery;
    pFIBTransactionECBRead: TpFIBTransaction;
    BitBtn6: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
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
  FormMovECBtoDBF: TFormMovECBtoDBF;

implementation
  uses DBF,UFibModule,IniFiles,ScrUtil,ScrDef;

{$R *.dfm}

procedure TFormMovECBtoDBF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;


function TFormMovECBtoDBF.MakeDBFFile(FNameDBF:String):String;
 const FNameINI='DScroll.Ini';
 var
    Ini      : TIniFile ;
    S        : string   ;
    DBFDir   : string   ;
    Ch       : string   ;
    DBFNameE : string   ;
    DBFNameD : string   ;
    fName    : string;
 begin
     fName:=getIniFileName;
     s:=fName;
//     S   := ExtractFilePath(Application.ExeName)+FNameINI;
     Ini := TIniFile.Create(S);
     try
         DBFDir := Ini.ReadString( 'Parameters', 'PFUDir', '' );
     finally
         Ini.Free;
     end;
     DBFDir:=Trim(DBFDir);
     if Length(DBFDir)<5 then
        begin
             ShowMessage('Ќе указан параметр PFUDir в файле DScroll.ini');
             Result:='';
             Exit;
        end;
     if not DirectoryExists(DBFDir) then
     if not CreateDir(DBFDir)       then
        begin
             ShowMessage('ќтсутствует каталог '+DBFDir+' и не возможно создать его');
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
             ShowMessage('ќтсутствует файл '+DBFNameE);
             Result:='';
             Exit;
        end;
     DBFNameD:=DBFDir+FNameDBF+'.dbf';
     if FileExists(DBFNameD)     then
     if not DeleteFile(DBFNameD) then
        begin
             ShowMessage('ќшибка удалени€ файла  '+DBFNameD);
             Result:='';
             Exit;
        end;
     if not CopyFile(PChar(DBFNameE),PChar(DBFNameD),true) then
        begin
             ShowMessage('ќшибка копировани€ файла '+DBFNameE+' в '+ DBFNameD);
             Result:='';
             Exit;
        end;
     Result:=DBFNameD;
 end;

procedure TFormMovECBtoDBF.BitBtn1Click(Sender: TObject);
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
     if pFIBQueryECB.Open then
        pFIBQueryECB.Close;
     if pFIBQueryECB.Transaction.Active then
        pFIBQueryECB.Transaction.Commit;

     SQLStmnt:='select count(*) from tb_p04t05b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
     pFIBQueryECB.Transaction.StartTransaction;
     pFIBQueryECB.SQL.Clear;

     pFIBQueryECB.SQL.Add(SQLStmnt);
     pFIBQueryECB.ExecQuery;
     RecordBound:=pFIBQueryECB.Fields[0].AsInteger;
     if RecordBound<1 then
        begin
             ShowMessage('Ќет записей в таблице');
             pFIBQueryECB.Close;
             pFIBQueryECB.Transaction.Commit;
             Exit;
        end;

     fmsFloatPoint.DecimalSeparator := '.';


     try
        dBase:=TDBF.Create(Self);
     except
       on E: Exception do begin
           messagebox(0,pchar(E.Message),'ќшибка',16);
           dBase.Free;
           Exit;
       end;
     end;
     dBase.TableName:=FName;
//  dBase.CodePage:=OEM;
     dBase.Open;
     pFIBQueryECB.Close;

     SQLStmnt:='select numident,fio,nm,ftn,start_dt,end_dt from tb_p04t05b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
     pFIBQueryECB.SQL.Clear;
     pFIBQueryECB.SQL.Add(SQLStmnt);
     pFIBQueryECB.ExecQuery;
     ProgressBarPFU.Min:=0;
     ProgressBarPFU.Max:=RecordBound;
     ProgressBarPFU.Position:=0;
     ix:=0;
     while not pFIBQueryECB.Eof do
       begin
              dBASE.Append;
              NumIdent:=pFIBQueryECB.Fields[0].AsString;
              Fam:=pFIBQueryECB.Fields[1].AsString;
              Nam:=pFIBQueryECB.Fields[2].AsString;
              Otc:=pFIBQueryECB.Fields[3].AsString;
         //     Fam:=WinToDos(Fam);
         //     Nam:=WinToDos(Nam);
         //     Otc:=WinToDos(Otc);
              Start_Dt := pFIBQueryECB.Fields[4].AsInteger;
              End_Dt   := pFIBQueryECB.Fields[5].AsInteger;
              dBASE.SetFieldData(1 , '0');
              dBASE.SetFieldData(2 , NumIdent);
              dBASE.SetFieldData(3 , Fam);
              dBASE.SetFieldData(4 , Nam);
              dBASE.SetFieldData(5 , Otc);
              if Start_Dt>0 then
                 dBASE.SetFieldData(6 , IntToStr(Start_Dt));
              if End_Dt>0 then
                 dBASE.SetFieldData(7 , IntToStr(End_Dt));
              dBase.Post;
              inc(ix);
              ProgressBarPFU.Position := ix;
              LabelDown.Caption:=IntToStr(ix)+' / '+IntToStr(RecordBound);
              application.ProcessMessages;
              pFIBQueryECB.Next;
       end;
  //   dBase.Post;
     dBase.Close;
     dBase.Free;
     if pFIBQueryECB.Open then
        pFIBQueryECB.Close;
     if pFIBQueryECB.Transaction.Active then
        pFIBQueryECB.Transaction.Commit;

end;


procedure TFormMovECBtoDBF.FillDBFTable(ModeDBF:integer);
var dBase: TDBF;
    RecordBound, ix : integer ;
    fmsFloatPoint : TFormatSettings;
    iCheckMode    : integer   ;
    FName         : string    ;
    SQLStmnt      : string    ;
    FNameDBF,FnameTable      : string    ;
    RowNum        : Integer;
function GetName(ModeDBF:integer):string;
 begin
       {$IFDEF SVDN}
       case ModeDbf of
//        5 :  Result:='e04t05i';
//        6 :  Result:='e04t06i';
//        5 :  Result:='j30T405';
//        5 :  Result:='J30401512';
        5 :  Result:='J3040513';
        6 :  Result:='j30T406';
        7 :  Result:='j30T407';
       else
            Result:='';
       end;
       {$ELSE}
       case ModeDbf of
          5 :  Result:='e04t05h';
          6 :  Result:='e04t06h';
          7 :  Result:='e04t07h';
       else
            Result:='';
       end;
       {$ENDIF}
 end;
function GetNameTable(ModeDBF:integer):string;
 begin
       case ModeDbf of
        5 :  Result:='e04t05c';
        6 :  Result:='e04t06c';
        7 :  Result:='e04t07c';
       else
            Result:='';
       end;
 end;

function BuildSQLStmnt(ModeDBF:integer):string;
 begin
       case ModeDBF of
(*
        5:
    //                        0      1   2  3    4         5       6      7   8        9
           result:='select inn,fam,nam,otc,dayn,reason from tb_06_2014_uwol';
 *)
 (*
        5:
    //                      0   1   2   3    4      5       6      7   8        9
           result:='select inn,fam,nam,otc,day_uw,reason from tb_08_2015_uwol';
*)

        5:
    //                        0      1   2  3    4         5       6      7   8        9
           if isLNR then
              result:='select numident,fio,nm,ftn,start_dt,end_dt,ukr_gromad,zo,dog_cph,pid_zv from tb_e04t05c where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth)
           else                                                                             // 10   11   12  13  14  15 16
              result:='select numident,fio,nm,ftn,start_dt,end_dt,ukr_gromad,zo,dog_cph,pid_zv,pnr,zkpp,prof,pos,pid,vs,pir from tb_e04t05c where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);

        6:
     {                        0      1   2  3   4  5            6      7     8   9    10     11       12       13       14  15    16      17    18  19    20        21      22}
           result:='select numident,fio,nm,ftn,zo,sum_total,sum_max,sum_ins,otk,exp,pay_tp,pay_mnth,pay_year,ukr_gromad,st,kd_np,kd_nzp,kd_ptv,nrm,kd_vp,sum_diff,sum_narah,nrc from tb_e04t06c where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
        7:
     {                        0      1   2  3   4     5      6      7        8     9         10  }
           result:='select numident,fio,nm,ftn,c_pid,days,start_dt,end_dt,seazon,ukr_gromad,norma from tb_e04t07c where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
        else
           result:='';
       end;
 end;

 function FillDBFRecord(ModeDBF:integer;RowNum:Integer):boolean;
  var
     Fam,Nam,Otc,PIB: shortstring    ;
     NumIdent       : string    ;
     Start_Dt       : integer   ;
     End_Dt         : integer   ;
     zo,otk,exp,Dog_Cph              : integer   ;
     pay_mnth,pay_year,pay_tp        : integer   ;
     Sum_Total,Sum_Max,Sum_Ins       : real      ;
     Sum_diff,Sum_Narah              : Real      ;
     Sum_TotalS,Sum_MaxS,Sum_InsS    : string    ;
     Sum_diffS,Sum_NarahS            : string    ;
     pid_zv                          : string    ;
     days,season,ukr_gromad,st,norma : integer   ;
     c_pid                           : string    ;
     kd_np,kd_nzp,kd_ptv,kd_vp,nrm   : Integer   ;
     nrc                             : Integer   ;
     kodkp,kodzkpp,prof,pos,pid      : string    ;
     vs,pir:Integer;
 begin
       case ModeDBF of
        5:begin

              NumIdent:=pFIBQueryECB.Fields[0].AsString;
              Fam:=pFIBQueryECB.Fields[1].AsString;
              Nam:=pFIBQueryECB.Fields[2].AsString;
              Otc:=pFIBQueryECB.Fields[3].AsString;
  //            Fam:=WinToDos(Fam);
  //            Nam:=WinToDos(Nam);
  //            Otc:=WinToDos(Otc);
              Start_Dt := pFIBQueryECB.Fields[4].AsInteger;
              End_Dt   := pFIBQueryECB.Fields[5].AsInteger;
              Ukr_Gromad := pFIBQueryECB.Fields[6].AsInteger;
              zo   := pFIBQueryECB.Fields[7].AsInteger;
              Dog_Cph   := pFIBQueryECB.Fields[8].AsInteger;
              pid_zv    := pFIBQueryECB.Fields[9].AsString;
              pid_zv    := Trim(pid_zv);
              if isSVDN then
                 begin
                     prof    := trim(pFIBQueryECB.Fields[10].AsString);
                     kodzkpp := trim(pFIBQueryECB.Fields[11].AsString);
                     kodkp   := trim(pFIBQueryECB.Fields[12].AsString);
                     pos     := trim(pFIBQueryECB.Fields[13].AsString);
                     pid     := trim(pFIBQueryECB.Fields[14].AsString);        ;
                     vs      := pFIBQueryECB.Fields[15].AsInteger;
                     pir     := pFIBQueryECB.Fields[16].AsInteger;

                     dBASE.SetFieldData(1 , IntToStr(WantedMonth));
                     dBASE.SetFieldData(2 , IntToStr(WantedYear));
//              dBASE.SetFieldData(3 , IntToStr(RowNum));
                    dBASE.SetFieldData(3 , IntToStr(Ukr_Gromad));
                    dBASE.SetFieldData(4 , IntToStr(ZO));
                    dBASE.SetFieldData(5 , IntToStr(DOG_CPH));
                    dBASE.SetFieldData(6 , NumIdent);
                    dBASE.SetFieldData(7 , Fam);
                    dBASE.SetFieldData(8 , Nam);
                    dBASE.SetFieldData(9 , Otc);
                    if Start_Dt>0 then
                       dBASE.SetFieldData(10 , IntToStr(Start_Dt));
                    if End_Dt>0 then
                       dBASE.SetFieldData(11 , IntToStr(End_Dt));
                    dBASE.SetFieldData(12 , SPACE(8));  //NRM_DT дата створенн€ робочого м≥сц€ всегда пустое
                    if Length(pid_zv)>0  then
                      dBase.SetFieldData(13, Copy(pid_zv+space(150),1,150))
                    else
                      dBase.SetFieldData(13 , space(150));
                    if length(prof)>0 then
                      dBase.SetFieldData(14, Copy(prof+space(250),1,250))
                    else
                      dBase.SetFieldData(14 , space(250));

                    if length(kodzkpp)>0 then
                      dBase.SetFieldData(15, Copy(kodzkpp+space(5),1,5))
                    else
                      dBase.SetFieldData(15, space(5));

                    if length(kodkp)>0 then
                      dBase.SetFieldData(16, Copy(kodkp+space(6),1,6))
                    else
                      dBase.SetFieldData(16, space(6));

                    if length(pos)>0 then
                      dBase.SetFieldData(17, Copy(pos+space(250),1,250))
                    else
                      dBase.SetFieldData(17, space(250));
                    if length(pid)>0 then
                      dBase.SetFieldData(18, Copy(pid+space(250),1,250))
                    else
                      dBase.SetFieldData(18, space(250));
                    if ((vs>=0) and (vs<=1)) then
                       dBASE.SetFieldData(20 , IntToStr(vs))
                    else
                       dBASE.SetFieldData(20 , '0');
                    if ((pir>=0) and (pir<=1)) then
                       dBASE.SetFieldData(21 , IntToStr(pir))
                    else
                       dBASE.SetFieldData(21 , '0');


                 end
              else
                 begin
                    dBASE.SetFieldData(3 , IntToStr(RowNum));
                    dBASE.SetFieldData(4 , IntToStr(Ukr_Gromad));
                    dBASE.SetFieldData(5 , IntToStr(ZO));
                    dBASE.SetFieldData(6 , IntToStr(DOG_CPH));
                    dBASE.SetFieldData(7 , NumIdent);
                    dBASE.SetFieldData(8 , Fam);
                    dBASE.SetFieldData(9 , Nam);
                    dBASE.SetFieldData(10 , Otc);
                    if Start_Dt>0 then
                       dBASE.SetFieldData(11 , IntToStr(Start_Dt));
                    if End_Dt>0 then
                       dBASE.SetFieldData(12 , IntToStr(End_Dt));
                    dBASE.SetFieldData(13 , SPACE(8));  //NRM_DT дата створенн€ робочого м≥сц€ всегда пустое
                    if Length(pid_zv)>0  then
                      dBase.SetFieldData(14 , Copy(pid_zv+space(150),1,150))
                    else
                      dBase.SetFieldData(14 , space(150));
                 end;
              result:=true;


(*

              NumIdent:=pFIBQueryECB.Fields[0].AsString;
              FAM:=Trim(pFIBQueryECB.Fields[1].AsString);
              NAM:=Trim(pFIBQueryECB.Fields[2].AsString);
              OTC:=Trim(pFIBQueryECB.Fields[3].AsString);
       //       if not SplitFIO(PIB,FAM,NAM,OTC) then Exit;
  //            Fam:=WinToDos(Fam);
  //            Nam:=WinToDos(Nam);
  //            Otc:=WinToDos(Otc);
              Start_Dt := 0;
              End_Dt   := pFIBQueryECB.Fields[4].AsInteger;
              pid_zv:=Trim(pFIBQueryECB.Fields[5].AsString);

              Ukr_Gromad := 1;
              zo   := 1;
              Dog_Cph   := 0;
              dBASE.SetFieldData(3 , IntToStr(RowNum));
              dBASE.SetFieldData(4 , IntToStr(Ukr_Gromad));
              dBASE.SetFieldData(5 , IntToStr(ZO));
              dBASE.SetFieldData(6 , IntToStr(DOG_CPH));
              dBASE.SetFieldData(7 , NumIdent);
              dBASE.SetFieldData(8 , Fam);
              dBASE.SetFieldData(9 , Nam);
              dBASE.SetFieldData(10 , Otc);
           //   pid_zv:='ст.36 п.6  «пѕ”';
              if Start_Dt>0 then
                 dBASE.SetFieldData(11 , IntToStr(Start_Dt));
              if End_Dt>0 then
                 dBASE.SetFieldData(12 , IntToStr(End_Dt));
              dBASE.SetFieldData(13 , SPACE(8));  //NRM_DT дата створенн€ робочого м≥сц€ всегда пустое
              if Length(pid_zv)>0  then
                 dBase.SetFieldData(14 , Copy(pid_zv+space(150),1,150))
              else
                 dBase.SetFieldData(14 , space(150));

              result:=true;
*)
          end ;

        6:begin
              NumIdent:=pFIBQueryECB.Fields[0].AsString;
              Fam:=pFIBQueryECB.Fields[1].AsString;
              Nam:=pFIBQueryECB.Fields[2].AsString;
              Otc:=pFIBQueryECB.Fields[3].AsString;
   //           Fam:=WinToDos(Fam);
   //           Nam:=WinToDos(Nam);
   //           Otc:=WinToDos(Otc);
              zo  := pFIBQueryECB.Fields[4].AsInteger;

              sum_total := pFIBQueryECB.Fields[5].AsFloat;
              sum_max   := pFIBQueryECB.Fields[6].AsFloat;
              sum_ins   := pFIBQueryECB.Fields[7].AsFloat;

        {
              sum_total := 0.00;
              sum_max   := 0.00;
              sum_ins   := 0.00;
        }
              otk := pFIBQueryECB.Fields[8].AsInteger;
              exp := pFIBQueryECB.Fields[9].AsInteger;
              Pay_Tp := pFIBQueryECB.Fields[10].AsInteger;
              Pay_Mnth := pFIBQueryECB.Fields[11].AsInteger;
              Pay_Year := pFIBQueryECB.Fields[12].AsInteger;
              Ukr_Gromad := pFIBQueryECB.Fields[13].AsInteger;
              St         := pFIBQueryECB.Fields[14].AsInteger;
              kd_np      := pFIBQueryECB.Fields[15].AsInteger;
              kd_nzp     := pFIBQueryECB.Fields[16].AsInteger;
              kd_ptv     := pFIBQueryECB.Fields[17].AsInteger;
              nrm        := pFIBQueryECB.Fields[18].AsInteger;
              kd_vp      := pFIBQueryECB.Fields[19].AsInteger;

              sum_diff   := pFIBQueryECB.Fields[20].AsFloat;
              sum_narah  := pFIBQueryECB.Fields[21].AsFloat;
              nrc        := pFIBQueryECB.Fields[22].AsInteger;

              sum_totals := format('%16.2f',[sum_total]);
              sum_maxs   := format('%16.2f',[sum_max]);
              sum_inss   := format('%16.2f',[sum_ins]);
              sum_diffs  := format('%16.2f',[sum_diff]);
              sum_narahs := format('%16.2f',[sum_narah]);
              sum_totals := ReplChar(sum_totals,',','.');
              sum_maxs   := ReplChar(sum_maxs,',','.');
              sum_inss   := ReplChar(sum_inss,',','.');

              if isSVDN then
                 begin
              dBASE.SetFieldData(1 , IntToStr(WantedMonth));
              dBASE.SetFieldData(2 , IntToStr(WantedYear));
              dBASE.SetFieldData(3 , IntToStr(Ukr_Gromad));
              dBASE.SetFieldData(4 , IntToStr(St));
              dBASE.SetFieldData(5 , NumIdent);
              dBASE.SetFieldData(6 , Fam);
              dBASE.SetFieldData(7 , Nam);
              dBASE.SetFieldData(8 , Otc);
              dBASE.SetFieldData(9 , IntToStr(zo));
              if Pay_Tp>0 then
                 dBASE.SetFieldData(10 , IntToStr(Pay_TP));
              if Pay_Mnth>0 then
                 dBASE.SetFieldData(11 , IntToStr(Pay_Mnth));
              if Pay_Year>0 then
                 dBASE.SetFieldData(12 , IntToStr(Pay_Year));
              dBASE.SetFieldData(13 , IntToStr(kd_np));
              dBASE.SetFieldData(14 , IntToStr(kd_nzp));
              dBASE.SetFieldData(15 , IntToStr(kd_ptv));
              dBASE.SetFieldData(16 , IntToStr(kd_vp));
              dBASE.SetFieldData(17 , sum_totals);
              dBASE.SetFieldData(18 , sum_maxs);
              dBASE.SetFieldData(19 , sum_diffs);
              dBASE.SetFieldData(20 , sum_inss);
              dBASE.SetFieldData(21 , sum_narahs);
              dBASE.SetFieldData(22 , IntToStr(otk));
              dBASE.SetFieldData(23 , IntToStr(exp));
              dBASE.SetFieldData(24 , IntToStr(nrc));
              dBASE.SetFieldData(25 , IntToStr(nrm));

                 end
              else
                 begin
              dBASE.SetFieldData(3 , IntToStr(RowNum));
              dBASE.SetFieldData(4 , IntToStr(Ukr_Gromad));
              dBASE.SetFieldData(5 , IntToStr(St));
              dBASE.SetFieldData(6 , NumIdent);
              dBASE.SetFieldData(7 , Fam);
              dBASE.SetFieldData(8 , Nam);
              dBASE.SetFieldData(9 , Otc);
              dBASE.SetFieldData(10 , IntToStr(zo));
              if Pay_Tp>0 then
                 dBASE.SetFieldData(11 , IntToStr(Pay_TP));
              if Pay_Mnth>0 then
                 dBASE.SetFieldData(12 , IntToStr(Pay_Mnth));
              if Pay_Year>0 then
                 dBASE.SetFieldData(13 , IntToStr(Pay_Year));
              {$IFDEF SVDN}
              dBASE.SetFieldData(14 , IntToStr(kd_np));
              dBASE.SetFieldData(15 , IntToStr(kd_nzp));
              dBASE.SetFieldData(16 , IntToStr(kd_ptv));
              dBASE.SetFieldData(17 , IntToStr(kd_vp));
              dBASE.SetFieldData(18 , sum_totals);
              dBASE.SetFieldData(19 , sum_maxs);
              dBASE.SetFieldData(20 , sum_diffs);
              dBASE.SetFieldData(21 , sum_inss);
              dBASE.SetFieldData(22 , sum_narahs);
              dBASE.SetFieldData(23 , IntToStr(otk));
              dBASE.SetFieldData(24 , IntToStr(exp));
              dBASE.SetFieldData(25 , IntToStr(nrc));
              dBASE.SetFieldData(26 , IntToStr(nrm));
              {$ELSE}
              dBASE.SetFieldData(14 , IntToStr(kd_np));
              dBASE.SetFieldData(15 , IntToStr(kd_nzp));
              dBASE.SetFieldData(16 , IntToStr(kd_ptv));
              dBASE.SetFieldData(17 , IntToStr(kd_vp));
              dBASE.SetFieldData(18 , sum_totals);
              dBASE.SetFieldData(19 , sum_maxs);
 //             dBASE.SetFieldData(20 , sum_diffs);
              dBASE.SetFieldData(20 , sum_inss);
 //             dBASE.SetFieldData(22 , sum_narahs);
              dBASE.SetFieldData(21 , IntToStr(otk));
              dBASE.SetFieldData(22 , IntToStr(exp));
 //             dBASE.SetFieldData(25 , IntToStr(nrc));
              dBASE.SetFieldData(23 , IntToStr(nrm));
              {$ENDIF}
              end;
          end;
        7:begin
{
PERIOD_M	N	2	0
PERIOD_Y	N	4	0
UKR_GROMAD	N	1	0    3
NUMIDENT	C	10	0    4
LN	C	100	0          5
NM	C	100	0          6
FTN	C	100	0          7
C_PID	C	9	0          8
START_DT	N	2	0      9
STOP_DT	N	2	0       10
DAYS	N	3	0         11
HH	N	3	0           12
MM	N	2	0           13
NORMA_1	N	5	0       14
NORMA_2	N	5	0       15
NORMA_3	N	5	0       16
NUM_NAK	C	8	0       17
DT_NAK	N	7	0       18
SEAZON	N	1	0       19
}

              NumIdent:=pFIBQueryECB.Fields[0].AsString;
              Fam:=pFIBQueryECB.Fields[1].AsString;
              Nam:=pFIBQueryECB.Fields[2].AsString;
              Otc:=pFIBQueryECB.Fields[3].AsString;
              c_pid:=pFIBQueryECB.Fields[4].AsString;
    //          Fam:=WinToDos(Fam);
    //          Nam:=WinToDos(Nam);
    //          Otc:=WinToDos(Otc);
    //          c_pid:=WinToDos(c_pid);
              days     := pFIBQueryECB.Fields[5].AsInteger;
              start_dt := pFIBQueryECB.Fields[6].AsInteger;
              end_dt   := pFIBQueryECB.Fields[7].AsInteger;
              season   := pFIBQueryECB.Fields[8].AsInteger;
              Ukr_Gromad := pFIBQueryECB.Fields[9].AsInteger;
              Norma    := pFIBQueryECB.Fields[10].AsInteger;
              if isSVDN then
                 begin
   //                dBASE.SetFieldData(3 , IntToStr(RowNum));
                   dBASE.SetFieldData(3 , IntToStr(Ukr_Gromad));
                   dBASE.SetFieldData(4 , NumIdent);
                   dBASE.SetFieldData(5 , Fam);
                   dBASE.SetFieldData(6 , Nam);
                   dBASE.SetFieldData(7 , Otc);
                   dBASE.SetFieldData(8 , c_pid);
                   dBASE.SetFieldData(9 , IntToStr(start_dt));
                   dBASE.SetFieldData(10 , IntToStr(end_dt));
                   dBASE.SetFieldData(11 , IntToStr(days));
                   dBASE.SetFieldData(14 , IntToStr(Norma));
                 end
              else
                 begin
                   dBASE.SetFieldData(3 , IntToStr(RowNum));
                   dBASE.SetFieldData(4 , IntToStr(Ukr_Gromad));
                   dBASE.SetFieldData(5 , NumIdent);
                   dBASE.SetFieldData(6 , Fam);
                   dBASE.SetFieldData(7 , Nam);
                   dBASE.SetFieldData(8 , Otc);
                   dBASE.SetFieldData(9 , c_pid);
                   dBASE.SetFieldData(10 , IntToStr(start_dt));
                   dBASE.SetFieldData(11 , IntToStr(end_dt));
                   dBASE.SetFieldData(12 , IntToStr(days));
                   dBASE.SetFieldData(16 , IntToStr(Norma));
                 end
          end;

        else
           result:=false;
       end;
 end;

begin
     FNameDBF := GetName(ModeDBF);
     FNameTable := GetNameTable(ModeDBF);
     if Length(Trim(FNameDBF))<5 then Exit;
     LabelUp.Caption:='ѕеренос таблицы '+FNameDBF;;
     Application.ProcessMessages;
     FName:=MakeDBFFile(FNameDBF);
     FName:=trim(FName);
     if Length(FName)<5 then Exit;

     if pFIBQueryECB.Open then
        pFIBQueryECB.Close;
     if pFIBQueryECB.Transaction.Active then
        pFIBQueryECB.Transaction.Commit;
     SQLStmnt:='select count(*) from tb_'+FNameTable+' where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
 //    SQLStmnt:='select count(*) from tb_08_2015_uwol';
     pFIBQueryECB.Transaction.StartTransaction;
     pFIBQueryECB.SQL.Clear;

     pFIBQueryECB.SQL.Add(SQLStmnt);
     pFIBQueryECB.ExecQuery;
     RecordBound:=pFIBQueryECB.Fields[0].AsInteger;
    if RecordBound<1 then
        begin
             ShowMessage('Ќет записей в таблице '+FNameTable+' за '+IntToStr(WantedYear)+' '+IntToStr(WantedMOnth));
             pFIBQueryECB.Close;
             pFIBQueryECB.Transaction.Commit;
             Exit;
        end;

     fmsFloatPoint.DecimalSeparator := '.';


     try
        dBase:=TDBF.Create(Self);
     except
       on E: Exception do begin
           messagebox(0,pchar(E.Message),'ќшибка',16);
           dBase.Free;
           Exit;
       end;
     end;
     dBase.TableName:=FName;
//  dBase.CodePage:=OEM;
     dBase.Open;
     pFIBQueryECB.Close;
//     SQLStmnt:='select numident,fio,nm,ftn,start_dt,end_dt from tb_p04t05b where yearvy='+IntToStr(WantedYear)+' and monthvy='+IntToStr(WantedMonth);
     SQLStmnt:=BuildSQLStmnt(ModeDBF);
     pFIBQueryECB.SQL.Clear;
     pFIBQueryECB.SQL.Add(SQLStmnt);
     pFIBQueryECB.ExecQuery;
     ProgressBarPFU.Min:=0;
     ProgressBarPFU.Max:=RecordBound;
     ProgressBarPFU.Position:=0;
     ix:=0;
     RowNum:=0;
     while not pFIBQueryECB.Eof do
       begin
              dBASE.Append;
              Inc(RowNum);
              FillDBFRecord(ModeDBF,RowNum);
              dBase.Post;
              inc(ix);
              ProgressBarPFU.Position := ix;
              LabelDown.Caption:=IntToStr(ix)+' / '+IntToStr(RecordBound);
              application.ProcessMessages;
              pFIBQueryECB.Next;
       end;
     dBase.Close;
     dBase.Free;
     if pFIBQueryECB.Open then
        pFIBQueryECB.Close;
     if pFIBQueryECB.Transaction.Active then
        pFIBQueryECB.Transaction.Commit;

end;




procedure TFormMovECBtoDBF.BitBtn6Click(Sender: TObject);
begin
     FillDBFTable(5);
     FillDBFTable(6);
     FillDBFTable(7);
end;

end.
