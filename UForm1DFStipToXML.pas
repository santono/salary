{$WARNINGS OFF}
{$HINTS OFF}
unit UForm1DFStipToXML;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalc;

type
  TForm1DFStipToXML = class(TForm)
    OpenDialog1: TOpenDialog;
    FNameEdit: TEdit;
    BitBtn1: TBitBtn;
    rgKwartal: TRadioGroup;
    cxYear: TcxCalcEdit;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    FNameDBF:string;
    procedure FillXMLDocumentJ0500105;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1DFStipToXML: TForm1DFStipToXML;

implementation
  uses DBF, UFormProgress,IniFiles,ScrUtil,ScrDef,DateUtils;
  var dBase: TDBF;


{$R *.dfm}

procedure TForm1DFStipToXML.BitBtn1Click(Sender: TObject);
begin
     if not OpenDialog1.Execute then Exit;
     FNameEdit.Text:=OpenDialog1.FileName;
end;
procedure TForm1DFStipToXML.FillXMLDocumentJ0500105;
type pRec=^tRec;
     tRec=record
                nal_code     : string;
                rownum       : Integer;
                summaadd     : Real;
                summapod     : Real;
                code_priz    : integer;
                ozn_pilg     : integer;
                datapri      : TDate;
                datauw       : TDate;
                rownumXML    : string;
                summaaddXML  : string;
                summapodXML  : string;
                code_prizXML : string;
                ozn_pilgXML  : string;
                datapriXML   : string;
                datauwXML    : string;
          end;
var DevXML          : TextFile;
    fmsFloatPoint   : TFormatSettings;
    FName           : string    ;
    SQLStmnt        : string    ;
    FNameXML        : string    ;
    LineNo          : integer   ;
    List            : TList     ;
    i,ix,recordBound : Integer   ;
    nmes1df,year1df :Integer;
    amntOfRow,amntOfPerson:Integer;
    summaAdd,summaPod,summaWar:real;


function getDBFDir(var EscPressed:Boolean):string;
 const FNameINI='DScroll.Ini';
 var S,Ch,DBFDir:String;
     Ini:TIniFile;
     fName:string;
 begin
     fNAme:=getIniFileName;
     s:=fName;
     EscPressed := False;
//     S   := ExtractFilePath(Application.ExeName)+FNameINI;
     Ini := TIniFile.Create(S);
     try
         DBFDir := Ini.ReadString( 'Parameters', '1DFDir', '' );
     finally
         Ini.Free;
     end;
     DBFDir:=Trim(DBFDir);
     if Length(DBFDir)<5 then
        begin
             ShowMessage('Не указан параметр 1DFDir в файле DScroll.ini');
             EscPressed:=True;
             Result:='';
             Exit;
        end;
     if not DirectoryExists(DBFDir) then
     if not CreateDir(DBFDir)       then
        begin
             ShowMessage('Отсутствует каталог '+DBFDir+' и не возможно создать его');
             EscPressed:=True;
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
     getDBFDir:=DBFDir;
 end;
function GetName:string;
 begin
       Result:='1dfdata_Stip.xml';
 end;

 function convertDateToXML(dt:tDate):string;
  var retVal:string;
      y,m,d:Word;
      ds,ms:string;
  begin
      DecodeDate(dt,y,m,d);
      if m<10 then
         ms:='0'+intToStr(m)
      else
         ms:=intToStr(m);
      if d<10 then
         ds:='0'+intToStr(d)
      else
         ds:=intToStr(d);
      retVal:=ds+ms+intToStr(y);
      convertDateToXML:=retVal;
  end;

function PutXMLFileHeader:Boolean;
 var s:string;
     devHat:TextFile;
     fNameHat:string;
     ys,dats,kwas:string;
     escPressed:Boolean;
     Kwartal:Integer;
     dt:TDate;
 begin
      fNameHat:=getDBFDir(EscPressed);
      result:=False;
      if EscPressed  then Exit;
      FNameXML:=fNameHat+getName;
      fNameHat:=fNameHat+'hat_xml.txt';
      kwartal:=rgKwartal.ItemIndex+1;
      if ((Kwartal<1) or (Kwartal>4)) then Kwartal:=1;
      kwas:=intToStr(Kwartal);
      dt:=DateTimePicker1.Date;
      dats:=convertDateToXML(dt);
      Reset(devHat,fNameHat);
      Rewrite(devXML,FNameXML);
      while (not Eof(devHat)) do
        begin
             readln(devHat,S);
             if Pos('PERIOD_MONTH',s)>0 then
                s:='      <PERIOD_MONTH>'+intToStr(nmes1df)+'</PERIOD_MONTH>'
             else
             if Pos('PERIOD_YEAR',s)>0 then
                s:='      <PERIOD_YEAR>'+intToStr(YEAR1df)+'</PERIOD_YEAR>'
             else
             if Pos('<D_FILL',s)>0 then
                s:='      <D_FILL>'+dats+'</D_FILL>'
             else
             if Pos('<HZKV',s)>0 then
                s:='      <HZKV>'+kwas+'</HZKV>'
             else
             if Pos('<HZY',s)>0 then
                s:='      <HZY>'+intToStr(year1df)+'</HZY>'
             else
             if Pos('<R00G01I',s)>0 then
                s:='      <R00G01I>'+intToStr(amntOfPerson)+'</R00G01I>'
             else
             if Pos('<R00G02I',s)>0 then
                s:='      <R00G02I>0</R00G02I>';

             Writeln(devXML,s);
        end;
      CloseFile(devHat);
      result:=True;
 end;
procedure PutXMLFileFooter;
 var s:string;
     devFoot:TextFile;
     fNameFoot:string;
     ys,dats,kwas:string;
     escPressed:Boolean;
 begin
      dats:=convertDateToXML(date);
      fNameFoot:=getDBFDir(EscPressed)+'fot_xml.txt';
      Reset(devFoot,fNameFoot);
      while (not Eof(devFoot)) do
        begin
             readln(devFoot,S);
             if Pos('R01G03A',s)>0 then
                s:='      <R01G03A>'+trim(replChar(format('%12.2f',[summaAdd]),',','.'))+'</R01G03A>'
             else
             if Pos('R01G03',s)>0 then
                s:='      <R01G03>'+trim(replChar(format('%12.2f',[summaAdd]),',','.'))+'</R01G03>'
             else
             if Pos('R01G04A',s)>0 then
                s:='      <R01G04A>'+trim(replChar(format('%12.2f',[summaPod]),',','.'))+'</R01G04A>'
             else
             if Pos('R01G04',s)>0 then
                s:='      <R01G04>'+trim(replChar(format('%12.2f',[summaPod]),',','.'))+'</R01G04>'
             else
             if Pos('<R0205G03A',s)>0 then
                s:='      <R0205G03A>'+trim(replChar(format('%12.2f',[summaAdd]),',','.'))+'</R0205G03A>'
             else
             if Pos('<R0205G03',s)>0 then
                s:='      <R0205G03>'+trim(replChar(format('%12.2f',[summaAdd]),',','.'))+'</R0205G03>'
             else
             if Pos('<R0205G04A',s)>0 then
                s:='      <R0205G04A>'+trim(replChar(format('%12.2f',[summaWar]),',','.'))+'</R0205G04A>'
             else
             if Pos('<R0205G04',s)>0 then
                s:='      <R0205G04>'+trim(replChar(format('%12.2f',[summaWar]),',','.'))+'</R0205G04>'
             else
             if Pos('<R02G01I',s)>0 then
                s:='      <R02G01I>'+intToStr(List.Count)+'</R02G01I>'
             else
             if Pos('<R02G01I',s)>0 then
                s:='      <R02G02I>'+intToStr(amntOfPerson)+'</R02G02I>'
             else
             if Pos('<HFILL',s)>0 then
                s:='      <HFILL>'+dats+'</HFILL>';

             Writeln(devXML,s);
        end;
      CloseFile(devFoot);
 end;



 function buildSqlStmntItogi:WideString;
   var s:WideString;
       s1:string;
     begin
          case nmes1df of
            1,2,3: s1:='1,2,3';
            4,5,6: s1:='4,5,6';
            7,8,9: s1:='7,8,9';
            else   s1:='10,11,12';
          end;
          s:='select count(*),count(distinct nal_code),sum(summaadd),sum(summapod),';
          s:=Trim(s)+'(select sum(summa) from fud';
          s:=Trim(s)+' where year_vy='+intToStr(year1df);
          s:=Trim(s)+' and shifrsta='+intToStr(WAR_SBOR_SHIFR);
          s:=Trim(s)+' and month_vy in ('+s1+'))';
          s:=Trim(s)+' from tb_1df';
          s:=Trim(s)+' where y='+intToStr(year1df);
          s:=Trim(s)+' and m='+intToStr(nmes1df);
          s:=Trim(s)+' and strlen(trim(coalesce(nal_code,'''')))=10';
          buildSqlStmntItogi:=s;
     end;

 procedure getSummy(var amntOfRow:Integer;var amntOfPerson:Integer; var summaAdd:Real; var summaPod:Real; var summaWar:real);
     begin
         amntOfRow     := 0;
         amntOfPerson  := 0;
         summaAdd      := 0;
         summaPod      := 0;
         summaWar      := 0;

     end;
 function addRecordToList(lineno:integer):boolean;
  var
     p:pRec;
     Nal_Code:string;
     iVal,iErr:Integer;
     sVal:string;
     aVal:Real;

  begin
       new(p);

       p^.nal_code  := dBase.GetFieldData(7);
       p^.rownum    := lineno;
       p^.summaadd  := 0;
       p^.summapod  := 0;
       sVal:=dBase.GetFieldData(8);
       sVal:=StringReplace(sVal,',','.',[rfReplaceAll]);
       Val(sVal,aVal,iErr);
       if (iErr=0) then
          p^.summaadd:=aVal;
       sVal:=dBase.GetFieldData(10);
       sVal:=StringReplace(sVal,',','.',[rfReplaceAll]);
       Val(sVal,aVal,iErr);
       if (iErr=0) then
          p^.summapod:=aVal;
       sVal:=dBase.GetFieldData(12);
       sVal:=StringReplace(sVal,',','.',[rfReplaceAll]);
       Val(sVal,iVal,iErr);
       if (iErr=0) then
          p^.code_priz:=iVal;
       sVal:=dBase.GetFieldData(15);
       sVal:=StringReplace(sVal,',','.',[rfReplaceAll]);
       Val(sVal,iVal,iErr);
       if (iErr=0) then
          p^.ozn_pilg:=iVal;
       p^.datapri   := EncodeDate(1900,1,1);
       p^.datauw    := EncodeDate(1900,1,1);
       //------------------
       p^.rownumXML   := intToStr(p^.rownum);
       p^.summaaddXML := Trim(format('%10.2f',[p^.summaadd]));
       p^.summaaddXML := ReplChar(p^.summaaddXML,',','.');
       p^.summapodXML := Trim(format('%10.2f',[p^.summapod]));
       p^.summapodXML := ReplChar(p^.summapodXML,',','.');
       if ((p^.code_priz=126) or
           (p^.code_priz=169) or
           (p^.code_priz=102) or
           (p^.code_priz=128)
          ) then
            p^.code_prizXML:=IntToStr(p^.code_priz)
       else
            p^.code_prizXML:='101';

       if yearof(p^.datapri)=year1df then
          p^.datapriXML:=ConvertDateToXML(p^.datapri)
       else
         p^.datapriXML:='';
       if yearof(p^.datauw)=year1df then
          p^.datauwXML:=ConvertDateToXML(p^.datauw)
       else
         p^.datauwXML:='';
       p^.ozn_pilgXML:=IntToStr(P^.ozn_pilg);
       List.Add(p);
       inc(amntOfRow);
       inc(amntOfPerson);
       SummaAdd:=SummaAdd+p^.summaadd;
       SummaPod:=SummaPod+p^.summaPod;
       summaWar:=SummaAdd*0.015;

  end;

  function putXMLNalCode(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        s:='        <T1RXXXXG02 ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.nal_code)+'</T1RXXXXG02>';
        Writeln(devXML,s);
   end;
  function putXMLSummaAdd3A(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Abs(p^.summaadd)<0.01 then Exit;
        s:='        <T1RXXXXG03A ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.summaaddXML)+'</T1RXXXXG03A>';
        Writeln(devXML,s);
   end;
  function putXMLSummaAdd3(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Abs(p^.summaadd)<0.01 then Exit;
        s:='        <T1RXXXXG03 ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.summaaddXML)+'</T1RXXXXG03>';
        Writeln(devXML,s);
   end;
  function putXMLSummaPod4A(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Abs(p^.summapod)<0.01 then Exit;
        s:='        <T1RXXXXG04A ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.summapodXML)+'</T1RXXXXG04A>';
        Writeln(devXML,s);
   end;
  function putXMLSummaPod4(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Abs(p^.summapod)<0.01 then Exit;
        s:='        <T1RXXXXG04 ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.summapodXML)+'</T1RXXXXG04>';
        Writeln(devXML,s);
   end;
  function putXMLCodePriz(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        s:='        <T1RXXXXG05 ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.code_prizXML)+'</T1RXXXXG05>';
        Writeln(devXML,s);
   end;
  function putXMLDataPri(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Length(Trim(p^.datapriXML))<3 then Exit;
        s:='        <T1RXXXXG06D ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.datapriXML)+'</T1RXXXXG06D>';
        Writeln(devXML,s);
   end;
  function putXMLDataUw(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Length(Trim(p^.dataUwXML))<3 then Exit;
        s:='        <T1RXXXXG07D ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.datauwXML)+'</T1RXXXXG07D>';
        Writeln(devXML,s);
   end;
  function putXMLOznPilg(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Length(Trim(p^.dataUwXML))<3 then Exit;
        s:='        <T1RXXXXG08 ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.ozn_pilgXML)+'</T1RXXXXG08>';
        Writeln(devXML,s);
   end;

begin
     dBase:=TDBF.Create(Self);
     dBase.TableName:=FNameDBF;
     dBase.Open;

     nmes1df := rgKwartal.ItemIndex+1;
     case nmes1df of
       1:nmes1df:=3;
       2:nmes1df:=6;
       3:nmes1df:=9;
       4:nmes1df:=12;
     end;
     year1df := round(cxYear.Value);

     RecordBound:=dBase.RecordCount;
     if RecordBound<1 then
        begin
             ShowMessage('Нет записей в таблице');
             dBase.Free;
             Exit;
        end;

     fmsFloatPoint.DecimalSeparator := '.';
     getSummy(amntOfRow,amntOfPerson,summaAdd,summaPod,summaWar);

     List:=TList.Create;
     ix:=0;
     LineNo:=0;
     Application.CreateForm(TFormProgress, FormProgress);
     FormProgress.Show;
     FormProgress.Gauge.MaxValue:=RecordBound;
     FormProgress.Gauge.MinValue:=0;
     FormProgress.Gauge.Progress:=0;
     FormProgress.LabelHeader.Caption:='Перенос данных 1ДФ стипендии в XML';
     FormProgress.LabelFooter.Caption:='0/'+IntToStr(RecordBound);
     Application.ProcessMessages;
     while not dBase.Eof do
       begin
              inc(ix);
              addRecordToList(ix);
              FormProgress.Gauge.Progress := ix;
              FormProgress.LabelFooter.Caption:=IntToStr(ix)+' / '+IntToStr(RecordBound);
              application.ProcessMessages;
              dBase.Next;
       end;
     if PutXMLFileHeader then
        begin
             for i:=0 to List.Count-1 do
                 putXMLNalCode(i);
             for i:=0 to List.Count-1 do
                 putXMLSummaAdd3A(i);
             for i:=0 to List.Count-1 do
                 putXMLSummaAdd3(i);
             for i:=0 to List.Count-1 do
                 putXMLSummaPod4A(i);
             for i:=0 to List.Count-1 do
                 putXMLSummaPod4(i);
             for i:=0 to List.Count-1 do
                 putXMLCodePriz(i);
             for i:=0 to List.Count-1 do
                 putXMLDataPri(i);
             for i:=0 to List.Count-1 do
                 putXMLDataUw(i);
             for i:=0 to List.Count-1 do
                 putXMLOznPilg(i);
             putXMLFileFooter;
             CloseFile(devXML);
        end;
     FormProgress.Hide;
     FormProgress.Free;
     if List.Count>0 then
        for i:=0 to List.Count-1 do
            Dispose(pRec(List.Items[i]));
     List.Free;
     List:=nil;
end;


procedure TForm1DFStipToXML.FormCreate(Sender: TObject);
begin
      cxYear.Value         := CURRYEAR;
      rgKwartal.ItemIndex  := 0;
      DateTimePicker1.Date := Date;
end;

procedure TForm1DFStipToXML.BitBtn2Click(Sender: TObject);
begin
     FNameDBF:=FNameEdit.Text;
     if not FileExists(FNameDBF) then Exit;
     FillXMLDocumentJ0500105;
     ShowMessage('Перенос закончен');
end;

end.
