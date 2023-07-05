unit UFormMakeNORASCHS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormMakeNORASCHS = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    dtWanted: TDateTimePicker;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    wantedYear:integer;
    wantedKwartal:integer;
    procN:double;
    summaAddTot,summaAddFTot,summaAddDPTot,summaNTot:double;
    summaAddTot1, summaAddTot2 , summaAddTot3 : double ;
    summaAddFTot1, summaAddFTot2 , summaAddFTot3 : double ;
    summaNTot1, summaNTot2 , summaNTot3 : double ;

    summaAddMatHelpTot,summaAddMatHelpTot1,summaAddMatHelpTot2,summaAddMatHelpTot3:double;
    summaAddDPTot1, summaAddDPTot2 , summaAddDPTot3 : double;
    nmbOfPersonTot,nmbOfPersonTot1,nmbOfPersonTot2,nmbOfPersonTot3:integer;
    procedure MakeList;
    { Private declarations }
  public
    { Public declarations }
  end;                  

var
  FormMakeNORASCHS: TFormMakeNORASCHS;

implementation

{$R *.dfm}
  USes comObj,ScrDef,ScrUtil,scrIo,USQLUnit,uFormWait,DateUtils,ScrLists;
 type PRec=^TRec;
      TRec=record
            tabno:Integer;
            summaAdd1:Real;
            summaAdd2:Real;
            summaAdd3:Real;
            summaAddF1:Real;
            summaAddF2:Real;
            summaAddF3:Real;
            summaAddDP1:Real;
            summaAddDP2:Real;
            summaAddDP3:Real;
            summaAddMatHelp1:Real;
            summaAddMatHelp2:Real;
            summaAddMatHelp3:Real;
            summaN1:Real;
            summaN2:Real;
            summaN3:Real;
           end;
 var list:TList;
procedure TFormMakeNORASCHS.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ACtion:=caFree;
end;

procedure TFormMakeNORASCHS.BitBtn1Click(Sender: TObject);
var i:integer;
begin
     BitBtn1.Enabled:=False;
     wantedYear:=yearOf(dtWanted.Date);
     i:=monthOf(dtWanted.Date);
     if i in [1,2,3] then
        wantedKwartal:=1
     else
     if i in [4,5,6] then
        wantedKwartal:=2
     else
     if i in [7,8,9] then
        wantedKwartal:=3
     else
        wantedKwartal:=4;
     MakeList;
     BitBtn1.Enabled:=True;

end;
procedure TFormMakeNORASCHS.MakeList;
 var savNMES,savNSRV:Integer;
     i_NSRV,I_MONTH:Integer;
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
               if ShifrList.IsPodoh(curr_add^.shifr) then
               if Abs(curr_add^.SUMMA)>0.01 then
                  summa:=summa+curr_add^.SUMMA;
               curr_add:=curr_add^.NEXT;
          end;
         getSummaAdd:=summa;
    end;
  function getSummaAddMatHelp(curr_person:Person_ptr):Real;
    var summa:Real;
        curr_add:ADD_PTR;
    begin
         summa := 0;
         curr_add:=curr_person^.ADD;
         while (curr_add<>nil) do
          begin
               if not ShifrList.IsPodoh(curr_add^.shifr) then
               if curr_add^.shifr<>KASSA_SHIFR then
               if Abs(curr_add^.SUMMA)>0.01 then
                  summa:=summa+curr_add^.SUMMA;
               curr_add:=curr_add^.NEXT;
          end;
         getSummaAddMatHelp:=summa;
    end;
  procedure addPersonToList(curr_person:person_Ptr;WantedMonth:integer);
   var i:Integer;
       finded:boolean;
       PInt:PInteger;
       SQLStmnt:string;
       v:variant;
       rec:PRec;
       summa:Real;
       summaMatHelp:real;
    begin
         summa:=getSummaAdd(curr_person);
         summaMatHelp:=getSummaAddMatHelp(curr_person);
         if (Abs(summa)<0.01) and
            (abs(summaMatHelp)<0.01) then Exit;
         if summaMatHelp<-1 then
            finded:=true;
         finded:=False;
         if List.Count>0 then
            begin
                 for i:=0 to List.Count-1 do
                     begin
                          if PRec(List.Items[i])^.tabno=curr_person^.tabno then
                             begin
                                  case wantedMonth of
                                   1 : begin
                                             PRec(List.Items[i])^.summaAdd1:=PRec(List.Items[i])^.summaAdd1+summa;
                                             PRec(List.Items[i])^.summaAddMatHelp1:=PRec(List.Items[i])^.summaAddMatHelp1+summaMatHelp;
                                       end;
                                   2 : begin
                                             PRec(List.Items[i])^.summaAdd2:=PRec(List.Items[i])^.summaAdd2+summa;
                                             PRec(List.Items[i])^.summaAddMatHelp2:=PRec(List.Items[i])^.summaAddMatHelp2+summaMatHelp;
                                       end
                                   else
                                       begin
                                             PRec(List.Items[i])^.summaAdd3:=PRec(List.Items[i])^.summaAdd3+summa;
                                             PRec(List.Items[i])^.summaAddMatHelp3:=PRec(List.Items[i])^.summaAddMatHelp3+summaMatHelp;
                                       end;
                                  end;
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
             FillChar(Rec^,sizeOf(Rec^),0);
             Rec^.tabno:=curr_person^.tabno;
             case wantedMonth of
               1 :  begin
                         Rec^.summaAdd1:=summa;
                         Rec^.summaAddMatHelp1:=summaMatHelp;
                    end;
               2 :
                    begin
                         Rec^.summaAdd2:=summa;
                         Rec^.summaAddMatHelp2:=summaMatHelp;
                    end;
               else
                    begin
                         Rec^.summaAdd3:=summa;
                         Rec^.summaAddMatHelp3:=summaMatHelp;
                    end;
             end;
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
        summaAdd1S,summaAdd2S,summaAdd3S,
        summaAddF1S,summaAddF2S,summaAddF3S,
        summaAddDP1S,summaAddDP2S,summaAddDP3S,
        summaN1S,summaN2S,summaN3S,
        summaAddMatHelpTotS,summaAddMatHelpTot1S,summaAddMatHelpTot2S,summaAddMatHelpTot3S:string;
        DataRogS,PolS,NomDocS,widDocS:string;

        SQLStmnt:string;
        V:Variant;
        S:widestring;
        ds,ms,ys:string;
        iVal,iErr:integer;
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
         retval:='NO_RASSCH_9400_9403_9403007252940301001_';
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
     summaAddTotS,summaAddTot1S,summaAddTot2S,summaAddTot3S:string;
     summaNTotS,summaNTot1S,summaNTot2S,summaNTot3S:string;
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
          if wantedKwartal=1 then
             periods:='21'
          else
          if wantedKwartal=2 then
             periods:='31'
          else
          if wantedKwartal=3 then
             periods:='41'
          else
             periods:='51';
          if Length(periods)=1 then
             periods:='0'+periods;
          years:=IntToStr(currYear);
          fnamei:=cdir+'NO_RASCHS_HAT.XML';
          if not FileExists(fnamei) then
             begin
                  ShowMessage('Îòñóòñòâóåò ôàéë '+fNameI);
                  Exit;
             end;
          summaAddTotS   := FormatFloatPoint(summaAddTot);
          summaAddTot1S  := FormatFloatPoint(summaAddTot1);
          summaAddTot2S  := FormatFloatPoint(summaAddTot2);
          summaAddTot3S  := FormatFloatPoint(summaAddTot3);
          summaAddMatHelpTotS := FormatFloatPoint(summaAddMatHelpTot);
          summaAddMatHelpTot1S:= FormatFloatPoint(summaAddMatHelpTot1);
          summaAddMatHelpTot2S:= FormatFloatPoint(summaAddMatHelpTot2);
          summaAddMatHelpTot3S:= FormatFloatPoint(summaAddMatHelpTot3);
          summaAddMatHelpTotS:='0';
          summaAddMatHelpTot1S:='0';
          summaAddMatHelpTot2S:='0';
          summaAddMatHelpTot3S:='0';
          summaNTotS := FormatFloatPoint(summaNTot);
          summaNTot1S := FormatFloatPoint(summaNTot1);
          summaNTot2S := FormatFloatPoint(summaNTot2);
          summaNTot3S := FormatFloatPoint(summaNTot3);

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
                         if Pos('#NMBOFPERSONTOTF',S)>0 then
                            s:=StringReplace(s,'#NMBOFPERSONTOTF',trim(intToStr(nmbOfPersonTot)),[rfReplaceAll]);
                         if Pos('#NMBOFPERSONTOT1',S)>0 then
                            s:=StringReplace(s,'#NMBOFPERSONTOT1',trim(intToStr(nmbOfPersonTot1)),[rfReplaceAll]);
                         if Pos('#NMBOFPERSONTOT2',S)>0 then
                            s:=StringReplace(s,'#NMBOFPERSONTOT2',trim(intToStr(nmbOfPersonTot2)),[rfReplaceAll]);
                         if Pos('#NMBOFPERSONTOT3',S)>0 then
                            s:=StringReplace(s,'#NMBOFPERSONTOT3',trim(intToStr(nmbOfPersonTot3)),[rfReplaceAll]);
                         if Pos('#SUMMAADDTOTF',S)>0 then
                            s:=StringReplace(s,'#SUMMAADDTOTF',trim(summaAddTotS) ,[rfReplaceAll]);
                         if Pos('#SUMMAADDTOT1',S)>0 then
                            s:=StringReplace(s,'#SUMMAADDTOT1',trim(summaAddTot1S),[rfReplaceAll]);
                         if Pos('#SUMMAADDTOT2',S)>0 then
                            s:=StringReplace(s,'#SUMMAADDTOT2',trim(summaAddTot2S),[rfReplaceAll]);
                         if Pos('#SUMMAADDTOT3',S)>0 then
                            s:=StringReplace(s,'#SUMMAADDTOT3',trim(summaAddTot3S),[rfReplaceAll]);
                         if Pos('#SUMMAADDMATHELPTOTF',S)>0 then
                            s:=StringReplace(s,'#SUMMAADDMATHELPTOTF',trim(SUMMAADDMATHELPTOTS) ,[rfReplaceAll]);
                         if Pos('#SUMMAADDMATHELPTOT1',S)>0 then
                            s:=StringReplace(s,'#SUMMAADDMATHELPTOT1',trim(SUMMAADDMATHELPTOT1S) ,[rfReplaceAll]);
                         if Pos('#SUMMAADDMATHELPTOT2',S)>0 then
                            s:=StringReplace(s,'#SUMMAADDMATHELPTOT2',trim(SUMMAADDMATHELPTOT2S) ,[rfReplaceAll]);
                         if Pos('#SUMMAADDMATHELPTOT3',S)>0 then
                            s:=StringReplace(s,'#SUMMAADDMATHELPTOT3',trim(SUMMAADDMATHELPTOT3S) ,[rfReplaceAll]);
                         if Pos('#SUMMANTOTF',S)>0 then
                            s:=StringReplace(s,'#SUMMANTOTF',trim(SUMMANTOTS) ,[rfReplaceAll]);
                         if Pos('#SUMMANTOT1',S)>0 then
                            s:=StringReplace(s,'#SUMMANTOT1',trim(SUMMANTOT1S) ,[rfReplaceAll]);
                         if Pos('#SUMMANTOT2',S)>0 then
                            s:=StringReplace(s,'#SUMMANTOT2',trim(SUMMANTOT2S) ,[rfReplaceAll]);
                         if Pos('#SUMMANTOT3',S)>0 then
                            s:=StringReplace(s,'#SUMMANTOT3',trim(SUMMANTOT3S) ,[rfReplaceAll]);

                    end;
                 Writeln(devo,s);
            end;

          CloseFile(devi);
     end;
    begin //----------------------
        fNameXML  := getXMLFileName+'.XML';
        fnameo := cdoc + fNameXML;
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
                 SQLStmnt:='select DATABIRTH,SEX from tb_PSB where tabno='+IntToStr(PREC(list.Items[i])^.tabno);
                 v:=SQLQueryRecValues(SQLStmnt);
                 if VarIsNull(v) then Continue;
                 if VarIsEmpty(v) then Continue;
                 if not VarIsArray(v) then Continue;
                 if not VarIsStr(v[0]) then Continue;
                 if not VarIsStr(v[1]) then Continue;
                 DataRogS:=v[0];
                 Pols:=v[1];
                 if length(dataRogS)<>10 then continue;
                 ds:=copy(dataRogS,1,2);
                 ms:=copy(dataRogS,4,2);
                 ys:=copy(dataRogS,7,4);
                 val(ys,iVal,iErr);
                 if iErr<>0 then continue;
                 if iVal<1910 then continue;


                 SQLStmnt:='select rezident,passport from tb_PSB_REZ where tabno='+IntToStr(PREC(list.Items[i])^.tabno);
                 v:=SQLQueryRecValues(SQLStmnt);
                 if VarIsNull(v) then Continue;
                 if VarIsEmpty(v) then Continue;
                 if not VarIsArray(v) then Continue;
                 if not VarIsStr(v[0]) then Continue;
                 if not VarIsStr(v[1]) then Continue;
                 widDocS:=trim(v[0]);
                 nomDocS:=trim(v[1]);
                 if widDocS='21' then
                 if length(nomDocS)=10 then
                    nomDocS:=copy(nomDocS,1,2)+' '+copy(nomDocS,3,2)+' '+copy(nomDocS,5,6);
                 summaAdd1S  := FormatFloatPoint(PREC(list.Items[i])^.summaAdd1);
                 summaAdd2S  := FormatFloatPoint(PREC(list.Items[i])^.summaAdd2);
                 summaAdd3S  := FormatFloatPoint(PREC(list.Items[i])^.summaAdd3);
                 summaAddF1S := FormatFloatPoint(PREC(list.Items[i])^.summaAddF1);
                 summaAddF2S := FormatFloatPoint(PREC(list.Items[i])^.summaAddF2);
                 summaAddF3S := FormatFloatPoint(PREC(list.Items[i])^.summaAddF3);
                 summaAddDP1S:= FormatFloatPoint(PREC(list.Items[i])^.summaAddDP1);
                 summaAddDP2S:= FormatFloatPoint(PREC(list.Items[i])^.summaAddDP2);
                 summaAddDP3S:= FormatFloatPoint(PREC(list.Items[i])^.summaAddDP3);
                 summaN1S    := FormatFloatPoint(PREC(list.Items[i])^.summaN1);
                 summaN2S    := FormatFloatPoint(PREC(list.Items[i])^.summaN2);
                 summaN3S    := FormatFloatPoint(PREC(list.Items[i])^.summaN3);
                 s:=' <ÏåðñÑâÑòðàõËèö>';
                 s:=s+' <ÄàíÔËÏîëó÷';
                 if Length(trim(inn))=12 then
                   s:=s+' ÈÍÍÔË="'+INN+'"';
                 s:=s+' ÑÍÈËÑ="'+SNILS+'" ÄàòàÐîæä="'+DataRogS+'" Ãðàæä="643" Ïîë="'+PolS+'" ÊîäÂèäÄîê="'+widDocS+'" ÑåðÍîìÄîê="'+nomDocS+'">';
                 s:=S+'<ÔÈÎ Ôàìèëèÿ="'+FAM+'" Èìÿ="'+NAM+'" Îò÷åñòâî="'+OTC+'"/>';
                 s:=s+' </ÄàíÔËÏîëó÷>';
                 s:=s+'<ÑâÂûïëÑÂÎÏÑ>';
                 s:=s+'<ÑâÂûïë>';
                 s:=s+'<ÑâÂûïëÌÊ Ìåñÿö="1" ÊîäÊàòËèö="ÍÐ" ÑóìÂûïë="'+SummaAdd1S+'" ÂûïëÎÏÑ="'+SummaAddF1S+'" Íà÷èñëÑÂ="'+summaN1S+'"/>';
                 s:=s+'<ÑâÂûïëÌÊ Ìåñÿö="2" ÊîäÊàòËèö="ÍÐ" ÑóìÂûïë="'+SummaAdd2S+'" ÂûïëÎÏÑ="'+SummaAddF2S+'" Íà÷èñëÑÂ="'+summaN2S+'"/>';
                 s:=s+'<ÑâÂûïëÌÊ Ìåñÿö="3" ÊîäÊàòËèö="ÍÐ" ÑóìÂûïë="'+SummaAdd3S+'" ÂûïëÎÏÑ="'+SummaAddF3S+'" Íà÷èñëÑÂ="'+summaN3S+'"/>';
                 s:=s+'</ÑâÂûïë>';
                 s:=s+'</ÑâÂûïëÑÂÎÏÑ>';
                 s:=s+' </ÏåðñÑâÑòðàõËèö>';
                 WriteLN(devo,s);
            end;
        s:='</Ðàñ÷åòÑÂ></Äîêóìåíò></Ôàéë>';
        Writeln(devo,s);
        CloseFile(devo);

    end;  //-----------------------

   procedure deleteNegativeSummyFromList;
    var i:integer;
        finished:boolean;
    begin

         repeat
               finished:=true;
               for i:=0 to list.Count-1 do
                  begin
                      if ((pRec(list.Items[i])^.summaAdd1<-0.01)
                          or
                          (pRec(list.Items[i])^.summaAdd2<-0.01)
                          or
                          (pRec(list.Items[i])^.summaAdd3<-0.01)) then
                         begin
                              list.Delete(i);
                              finished:=false;
                              break;
                         end;
            end;
         until finished;
    end;



   procedure calcList;
    var i:integer;
    begin
         summaAddTot     := 0.00 ;
         summaAddTot1    := 0.00 ;
         summaAddTot2    := 0.00 ;
         summaAddTot3    := 0.00 ;
         summaAddMatHelpTot  := 0.00;
         summaAddMatHelpTot1 := 0.00;
         summaAddMatHelpTot2 := 0.00;
         summaAddMatHelpTot3 := 0.00;
         summaAddDPTot1      := 0.00;
         summaAddDPTot2      := 0.00;
         summaAddDPTot3      := 0.00;
         summaAddFTot    := 0.00 ;
         summaAddFTot1   := 0.00 ;
         summaAddFTot2   := 0.00 ;
         summaAddFTot3   := 0.00 ;

         summaAddDPTot   := 0.00 ;
         summaNTot       := 0.00 ;
         summaNTot1      := 0.00;
         summaNTot2      := 0.00;
         summaNTot3      := 0.00;
         nmbOfPersonTot  := list.Count;
         nmbOfPersonTot1 := 0;
         nmbOfPersonTot2 := 0;
         nmbOfPersonTot3 := 0;

         for i:=0 to list.Count-1 do
            begin
                 pRec(list.Items[i])^.summaAddF1:=pRec(list.Items[i])^.summaAdd1;
                 pRec(list.Items[i])^.summaAddF2:=pRec(list.Items[i])^.summaAdd2;
                 pRec(list.Items[i])^.summaAddF3:=pRec(list.Items[i])^.summaAdd3;
//                 pRec(list.Items[i])^.summaAddF3:=pRec(list.Items[i])^.summaAdd3;
                 if abs(pRec(list.Items[i])^.summaAddF1)>0.01 then
                    inc(nmbOfPersonTot1);
                 if abs(pRec(list.Items[i])^.summaAddF2)>0.01 then
                    inc(nmbOfPersonTot2);
                 if abs(pRec(list.Items[i])^.summaAddF3)>0.01 then
                    inc(nmbOfPersonTot3);
                 pRec(list.Items[i])^.summaN1:=(pRec(list.Items[i])^.summaAddF1+pRec(list.Items[i])^.summaAddDP1)*procN;
                 pRec(list.Items[i])^.summaN2:=(pRec(list.Items[i])^.summaAddF2+pRec(list.Items[i])^.summaAddDP2)*procN;
                 pRec(list.Items[i])^.summaN3:=(pRec(list.Items[i])^.summaAddF3+pRec(list.Items[i])^.summaAddDP3)*procN;
                 summaAddTot1  := summaAddTot1  + pRec(list.Items[i])^.summaAdd1;
                 summaAddTot2  := summaAddTot2  + pRec(list.Items[i])^.summaAdd2;
                 summaAddTot3  := summaAddTot3  + pRec(list.Items[i])^.summaAdd3;
                 summaAddMatHelpTot1 := summaAddMatHelpTot1 + pRec(list.Items[i])^.summaAddMatHelp1;
                 summaAddMatHelpTot2 := summaAddMatHelpTot2 + pRec(list.Items[i])^.summaAddMatHelp2;
                 summaAddMatHelpTot3 := summaAddMatHelpTot3 + pRec(list.Items[i])^.summaAddMatHelp3;
                 summaAddDPTot1 := summaAddDPTot1 + pRec(list.Items[i])^.summaAddDP1;
                 summaAddDPTot2 := summaAddDPTot2 + pRec(list.Items[i])^.summaAddDP2;
                 summaAddDPTot3 := summaAddDPTot3 + pRec(list.Items[i])^.summaAddDP3;
                 summaAddFTot1  := summaAddFTot1 + pRec(list.Items[i])^.summaAddF1;
                 summaAddFTot2  := summaAddFTot2 + pRec(list.Items[i])^.summaAddF2;
                 summaAddFTot3  := summaAddFTot3 + pRec(list.Items[i])^.summaAddF3;
                 summaNTot1 := summaNTot1 + pRec(list.Items[i])^.summaN1;
                 summaNTot2 := summaNTot2 + pRec(list.Items[i])^.summaN2;
                 summaNTot3 := summaNTot3 + pRec(list.Items[i])^.summaN3;
            end;
         summaNTot          := summaNTot1          + summaNTot2          + summaNTot3;
         summaAddDPTot      := summaAddDPTot1      + summaAddDPTot2      + summaAddDPTot3;
         summaAddMatHelpTot := summaAddMatHelpTot1 + summaAddMatHelpTot2 + summaAddMatHelpTot3;
         summaAddFTot       := summaAddFTot1       + summaAddFTot2       + summaAddFTot3;
         summaAddTot        := summaAddTot1        + summaAddTot2        + summaAddTot3;
    end;
 begin
      savNSRV:=NSRV;
      savNMES:=NMES;
      EMPTY_ALL_PERSON;
      list:=TList.Create;
      ProgressBar1.Max:=Count_Serv*3;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      ProgressBar1.Step:=1;
      for i_month:=1 to 3 do
          begin
               if wantedKwartal=1 then
                  nmes:=i_month
               else
               if wantedKwartal=2 then
                  nmes:=i_month+3
               else
               if wantedKwartal=3 then
                  nmes:=i_month+6
               else
                  nmes:=i_month+9;

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
                        if i_month>2 then
                           nmes:=i_month;
                        while (curr_person<>nil) do
                          begin
//                               if Curr_person^.tabno=1356 then
                                  addPersonToList(curr_person,i_Month);
                               curr_person:=curr_person^.NEXT;
                          end;
                        EMPTY_ALL_PERSON;
                   end;
          end;

      if list.count>0 then
         begin
              deleteNegativeSummyFromList;
              calcList;
              exportToFile;
         end
      else
         ShowMessage('Íåò ñîòðóäíèêîâ äëÿ ôîðìèðîâàíèÿ NO_RASCHS');
      list.Free;
      list:=nil;
      NSRV:=savNSRV;
      NMES:=savNMES;
      MKFLNM;
      GETINF(true);

 end;

procedure TFormMakeNORASCHS.FormCreate(Sender: TObject);
begin
     Label1.Caption:='';
     dtWanted.Date:=encodeDate(currYear,nmes,1);
     dtWanted.MaxDate:=encodeDate(currYear+1,nmes,1);
     dtWanted.MinDate:=encodeDate(currYear-1,nmes,1);
     procN:=0.3;
end;


end.
