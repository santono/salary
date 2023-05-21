unit UFormMakeNOPERSSVFL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormMakeNOPERSSVFL = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    procedure MakeList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeNOPERSSVFL: TFormMakeNOPERSSVFL;

implementation

{$R *.dfm}
  USes comObj,ScrDef,ScrUtil,scrIo,USQLUnit,uFormWait,DateUtils;
 type PRec=^TRec;
      TRec=record
            tabno:Integer;
            summa:Real;
           end;
 var list:TList;
procedure TFormMakeNOPERSSVFL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ACtion:=caFree;
end;

procedure TFormMakeNOPERSSVFL.BitBtn1Click(Sender: TObject);
begin
     BitBtn1.Enabled:=False;
     MakeList;
     BitBtn1.Enabled:=True;

end;
procedure TFormMakeNOPERSSVFL.MakeList;
 var savNMES,savNSRV:Integer;
     i_NSRV:Integer;
     sc:Integer;
     curr_person:PERSON_PTR;
  function getSummaAdd(curr_person:Person_ptr):Real;
    var summa:Real;
        curr_add:ADD_PTR;
    begin
         summa := 0;
         curr_add:=curr_person^.ADD;
         while (curr_add<>nil) do
          begin
               if Abs(curr_add^.SUMMA)>0.01 then
                  summa:=summa+curr_add^.SUMMA;
               curr_add:=curr_add^.NEXT;
          end;
         getSummaAdd:=summa;
    end;
  procedure addPersonToList(curr_person:person_Ptr);
   var i:Integer;
       finded:boolean;
       PInt:PInteger;
       SQLStmnt:string;
       v:variant;
       rec:PRec;
       summa:Real;
    begin
         summa:=getSummaAdd(curr_person);
         if Abs(summa)<0.01 then Exit;
         finded:=False;
         if List.Count>0 then
            begin
                 for i:=0 to List.Count-1 do
                     begin
                          if PRec(List.Items[i])^.tabno=curr_person^.tabno then
                             begin
                                  PRec(List.Items[i])^.summa:=PRec(List.Items[i])^.summa+summa;
                                  finded:=True;
                                  Break;
                             end;
                     end;
            end;
       if not finded then
          begin
//               SQLStmnt:='select first 1 nomer_scheta from tb_psb_rez where tabno='+IntToStr(curr_person^.tabno);
//               v:=SQLQueryValue(SQLStmnt);
//               if VarIsNull(v) then
//                  begin
             New(Rec);
             Rec^.tabno:=curr_person^.tabno;
             Rec^.summa:=summa;
             List.Add(Rec);
          end;
    end;
  procedure exportToFile;
    var E,WC:Variant;
        sc,i:Integer;
        rec,currrow,currcol:Integer;
        fio:string;
        tabno:Integer;
        devi,devo:TextFile;
        fnamei,fnameo,fnameXML:string;
        SNILS,INN:string;
        FAM,NAM,OTC:shortstring;
        summaS:string;
        SQLStmnt,S:string;
        V:Variant;
    function getXMLFileName:string;
     var retVal:string;
         ys,ms,ds:string;
         datas:string;
         currData:TDate;
         GUID:TGUID;
         GUIDS:string;
     begin
         currData:=date;
         ys:=IntToStr(YearOf(currData));
         ms:=Trim(intToStr(MonthOf(currData)));
         if Length(ms)=1 then
            ms:='0'+ms;
         ds:=Trim(IntToStr(dayOf(currData)));
         if Length(ds)=1 then
            ds:='0'+ds;
         datas:=ys+ms+ds;
         retval:='NO_PERSSVFL_9400_9403_9403007252940301001_';
         CreateGUID(GUID);
         GUIDS:=GUIDTOString(GUID);
         GUIDS:=StringReplace(GUIDS,'{','',[rfReplaceAll]);
         GUIDS:=StringReplace(GUIDS,'}','',[rfReplaceAll]);
//         retVal:=retVal+dataS+'_9A96B864-53B5-EF44-8155-5BAB9B145152';
         retVal:=retVal+dataS+'_'+GUIDS;
         getXMLFileName:=retVal;
     end;
    procedure makeHat;
     var
     fNamei:string;
     devi:textfile;
     s:string;
     ds,ms,ys,datas,periodS,yearS:string;
     currData:TDate;
     begin
          currData:=Date;
          ys:=IntToStr(YEAROF(currData));
          ms:=Trim(IntToStr(monthOf(currData)));
          ds:=Trim(IntToStr(dayOf(currData)));
          if Length(ms)=1 then
             ms:='0'+ms;
          if Length(ds)=1 then
             ds:='0'+ds;
          datas:=ds+'.'+ms+'.'+ys;
          periods:=Trim(IntToStr(nmes));
          if Length(periods)=1 then
             periods:='0'+periods;
          years:=IntToStr(currYear);
          fnamei:=cdir+'NO_PERSSVFL_HAT.XML';
          if not FileExists(fnamei) then
             begin
                  ShowMessage('Отсутствует файл '+fNameI);
                  Exit;
             end;
          AssignFile(devi,fnameI);
          reset(devi);
          while not Eof(devi) do
            begin
                 readln(devi,s);
                 if Pos('#',s)>0 then
                    begin
                         if Pos('#FNAMEXML',S)>0 then
                            s:=StringReplace(s,'#FNAMEXML',fnamexml,[rfReplaceAll]);
                         if Pos('#DATADOC',S)>0 then
                            s:=StringReplace(s,'#DATADOC',datas,[rfReplaceAll]);
                         if Pos('#PERIOD',S)>0 then
                            s:=StringReplace(s,'#PERIOD',periods,[rfReplaceAll]);
                         if Pos('#YEAR',S)>0 then
                            s:=StringReplace(s,'#YEAR',years,[rfReplaceAll]);
                    end;
                 Writeln(devo,s);
            end;

          CloseFile(devi);
     end;
    begin //----------------------
        fNameXML  := getXMLFileName+'.XML';
        fnameo := cdoc + fNameXML+'.XML';
        AssignFile(devo,fnameo);
        Rewrite(devo);
        MakeHat;
        for i:=0 to list.count-1 do
            begin
                 SNILS:='';
                 INN:='';
                 SQLStmnt:='select SNILS,INN,FAM,NAM,OTC from tb_rus_pers where tabno='+IntToStr(PREC(list.Items[i])^.tabno);
                 v:=SQLQueryRecValues(SQLStmnt);
                 if VarIsNull(v) then Continue;
                 if VarIsEmpty(v) then Continue;
                 if not VarIsArray(v) then Continue;
                 if not VarIsStr(v[0]) then Continue;
                 if not VarIsStr(v[1]) then Continue;
                 if not VarIsStr(v[2]) then Continue;
                 if not VarIsStr(v[3]) then Continue;

                 SNILS:=v[0];
                 INN:=v[1];
                 FAM:=v[2];
                 NAM:=v[3];
                 OTC:=v[4];
                 if (Length(Trim(NAM))<2) or
                    (Length(Trim(OTC))<2) or
                    (Length(Trim(FAM))<2) then
                    begin
                         FIO:=GetFullRusFioPerson(PREC(list.Items[i])^.tabno);
                         SplitFIO(FIO,FAM,Nam,OTC);
                         fam:=AnsiUpperCase(fam);
                         nam:=AnsiUpperCase(nam);
                         otc:=AnsiUpperCase(otc);
                    end;
                 summas:=FormatFloatPoint(PREC(list.Items[i])^.summa);
                 s:='<ПерсСвФЛ';
                 if Length(trim(inn))=12 then
                   s:=s+' ИННФЛ="'+INN+'"';
                 s:=s+' СНИЛС="'+SNILS+'" СумВыпл="'+summaS+'">';
                 s:=S+'<ФИО Фамилия="'+FAM+'" Имя="'+NAM+'" Отчество="'+OTC+'"/>';
                 S:=S+'</ПерсСвФЛ>';
                 Writeln(devo,s);
            end;
        s:='</Документ></Файл>';
        Writeln(devo,s);
        CloseFile(devo);

    end;  //-----------------------


 begin
      savNSRV:=NSRV;
      savNMES:=NMES;
      EMPTY_ALL_PERSON;
      list:=TList.Create;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      ProgressBar1.Step:=1;
      for i_NSRV:=1 to Count_Serv do
        begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
             Label1.Caption:=Name_Serv(i_NSRV);
             NSRV:=i_NSRV;
             mkflnm;

             if not FileExists(fninf) then
                Continue;
             GETINF(false);
             curr_person:=HEAD_PERSON;
             while (curr_person<>nil) do
               begin
                    addPersonToList(curr_person);
                    curr_person:=curr_person^.NEXT;
               end;
             EMPTY_ALL_PERSON;
        end;
      if list.count>0 then
         exportToFile
      else
         ShowMessage('Нет сотрудников для формирования NO_PERSSVFL');
      list.Free;
      list:=nil;
      NSRV:=savNSRV;
      NMES:=savNMES;
      MKFLNM;
      GETINF(true);

 end;

procedure TFormMakeNOPERSSVFL.FormCreate(Sender: TObject);
begin
     Label1.Caption:='';
end;

procedure TFormMakeNOPERSSVFL.BitBtn3Click(Sender: TObject);
 var savNMES,savNSRV:Integer;
     i_NSRV:Integer;
     sc:Integer;
     curr_person:PERSON_PTR;
  function getSummaAdd(curr_person:Person_ptr):Real;
    var summa:Real;
        curr_add:ADD_PTR;
    begin
         summa := 0;
         curr_add:=curr_person^.ADD;
         while (curr_add<>nil) do
          begin
               if Abs(curr_add^.SUMMA)>0.01 then
                  summa:=summa+curr_add^.SUMMA;
               curr_add:=curr_add^.NEXT;
          end;
         getSummaAdd:=summa;
    end;
     
  procedure addSNILSToPerson(curr_person:person_Ptr);
   var i:Integer;
       finded:boolean;
       PInt:PInteger;
       SQLStmnt:string;
       v:variant;
       SNILS,INN:string;
       retVal:string;
    begin
         finded:=False;
         if List.Count>0 then
            begin
                 for i:=0 to List.Count-1 do
                     begin
                          if PInteger(List.Items[i])^=curr_person^.tabno then
                             begin
                                  finded:=True;
                                  Break;
                             end;
                     end;
            end;
       if not finded then
          begin
               SNILS:=generateDummySNILS(curr_Person^.tabno);
               INN:=generateDummyINN(curr_Person^.tabno);
               retVal:=snils+'#'+inn;
               SQLStmnt:='update kadry set dolgnost='''+SNILS+''',descr_uwol = '''+inn+''' where tabno='+IntToStr(curr_person^.tabno);
               SQLExecute(SQLStmnt);
               New(PInt);
               PInt^:=curr_person^.tabno;
               List.Add(PInt);
          end;
    end;

begin
      savNSRV:=NSRV;
      savNMES:=NMES;
      EMPTY_ALL_PERSON;
      list:=TList.Create;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      ProgressBar1.Step:=1;
      for i_NSRV:=1 to Count_Serv do
        begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
             Label1.Caption:=Name_Serv(i_NSRV);
             NSRV:=i_NSRV;
             mkflnm;

             if not FileExists(fninf) then
                Continue;
             GETINF(false);
             curr_person:=HEAD_PERSON;
             while (curr_person<>nil) do
               begin
                    if (getSummaAdd(curr_person)>0.01) then
                        addSNILSToPerson(curr_person);
                    curr_person:=curr_person^.NEXT;
               end;
             EMPTY_ALL_PERSON;
        end;
//      if list.count>0 then
//         exportToExcel
//      else
//         ShowMessage('Нет сотрудников без счета в ПСБ');
      list.Free;
      list:=nil;
      NSRV:=savNSRV;
      NMES:=savNMES;
      MKFLNM;
      GETINF(true);

end;

end.
