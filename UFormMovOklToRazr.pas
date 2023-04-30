unit UFormMovOklToRazr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, FIBDatabase, pFIBDatabase, FIBQuery,
  pFIBQuery, ComCtrls;

type
  TFormMoveNewOkladToRazr = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    SpinEditLoRazr: TSpinEdit;
    SpinEditHiRazr: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    ProgressBar1: TProgressBar;
    cbRKoef: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     LoRazr:integer;
     HiRazr:integer;
     R_O:array[1..25] of real;
     R_P:array[1..25] of real;
     function FillOkladyForRazr:boolean;
     procedure MakeOkl052016;

  public
    { Public declarations }
  end;

var
  FormMoveNewOkladToRazr: TFormMoveNewOkladToRazr;

implementation
 uses ScrDef,ScrIO,Scrutil,UFibModule,UFormSelPod,ScrLists,UFormWaitMess,Math,
  UFormSelPKG,SCRNalog,DateUtils;

{$R *.dfm}

procedure TFormMoveNewOkladToRazr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMoveNewOkladToRazr.BitBtn1Click(Sender: TObject);
 type pRec=^TRec;
      TRec=record
            shifrDol:integer;
            razr:integer;
            oklad:real;
           end;
 const lDolg=14;
       shifrDols:array[1..lDolg] of integer=(20,30,40,520,605,1424,80,1531,1532,185,1536,180,302,1631);

 var SaveNMES,SaveNSRV,SC,I_NSRV:integer;
     Curr_Person:Person_Ptr;
     Koef,KoefP:real;
     Razr:integer;
     Oklad:real;
     NeedPut:boolean;
     shifrdol:Integer;
     list:TList;
     testOklad:real;
     oldOklad,newOklad:real;

 function isInSpecDolgList(shifrDol:integer):boolean;
  var retVal:boolean;
      i:integer;
  begin
      retVal:=false;
      for i:=1 to lDolg do
          if shifrDols[i]=shifrDol then
             begin
                  retVal:=true;
                  break;
             end;
      isInSpecDolgList:=retVal;
  end;
 function fillDolgOklady:boolean;
  var fName:String;
      dev:TextFile;
      s:string;
      shifrDolS,okladS:string;
      iErr,l:integer;
      shifrDol:integer;
      oklad:real;
      rec:pRec;
  begin
       fName:=cdir+'DolgOklady.txt';
       if not FileExists(fNAme) then
          begin
               showMessage('Отсутствует файл '+FName);
               result:=false;
               exit;
          end;
       list:=TList.Create;
       AssignFile(dev,fName);
       reset(dev);
       while not eof(dev) do
         begin
              readln(dev,s);
            //  s:=trim(s);
              l:=length(s);
              if l<53 then continue;
              shifrDolS:=copy(s,1,4);
              val(shifrDolS,shifrDol,iErr);
              if iErr<>0 then continue;
              if shifrDol=1532 then
                 iErr:=iErr;
              okladS:=copy(s,49,5);
              val(okladS,oklad,iErr);
              if iErr<>0 then continue;
              if ((oklad<3000) or (oklad>13000)) then
                continue;
              new(Rec);
              fillChar(Rec^,sizeOf(rec^),0);
              rec^.shifrDol:=shifrDol;
              rec^.oklad:=oklad;
              list.Add(rec);
         end;
       closeFile(dev);
       result:=true;
  end;
 function fillDolgOkladyFromSQL:boolean;
  var
      shifrDol,razr:integer;
      oklad:real;
      rec:pRec;
      SQLStmnt:string;
  begin
       SQLStmnt:='select shifrdol,razr,oklad from tb_dolg where razr>0 and oklad>0';
       pFIBQuery1.SQL.clear;
       pFIBQuery1.SQL.Add(SQLStmnt);
       pFIBQuery1.Transaction.StartTransaction;
       pFibQuery1.ExecQuery;
       list:=TList.Create;
       while not pFIBQuery1.Eof do
         begin
              shifrDol:=pFIBQuery1.Fields[0].Value;
              razr:=pFIBQuery1.Fields[1].Value;
              oklad:=pFIBQuery1.Fields[2].Value;
              new(Rec);
              fillChar(Rec^,sizeOf(rec^),0);
              rec^.shifrDol:=shifrDol;
              rec^.razr:=razr;
              rec^.oklad:=oklad;
              list.Add(rec);
              pFIBQuery1.Next;
         end;
       pFIBQuery1.close;
       pFIBQuery1.Transaction.Commit;
       result:=true;
  end;
 function getOkladByShifrDol(shifrDol:integer):real;
  var retVal:real;
      i:integer;
  begin
       retVal:=0;
       if list.Count>0 then
       for i:=1 to list.Count do
           if pRec(list.Items[i-1])^.shifrDol=shifrDol then
              begin
                   retVal:=pRec(list.Items[i-1])^.oklad;
                   break;
              end;
       getOkladByShifrDol:=retVal;
  end;
 function OkladProrektor:Real;
 // shifrDol=20,30,40
   begin
         OkladProrektor:=SimpleRoundTo(R_O[24]*0.95,0);
   end;
 function OkladPomRektora:Real;
 // ShifrDol=520
   begin
         OkladPomRektora:=SimpleRoundTo(R_O[24]*0.7,0);
   end;
 function OkladGlBuh:Real;
 //shifrDol=605
   begin
         OkladGlBuh:=SimpleRoundTo(R_O[24]*0.9,0);
   end;
 function OkladZamGlBuh:Real;
 //shifrDol=1424
   begin
         OkladZamGlBuh:=SimpleRoundTo(OkladGlBuh*0.95,0);
   end;
 function OkladZamDekana:Real;
 //ShifrDol=80,1531
   begin
         OkladZamDekana:=SimpleRoundTo(R_O[22]*0.9,0);
   end;
 function OkladZamDirInst:Real;
 //ShifrDol=1532
   begin
         OkladZamDirInst:=SimpleRoundTo(R_O[21]*0.9,0);
   end;
 function OkladZamDirDepartament:Real;
   begin
         OkladZamDirDepartament:=SimpleRoundTo(R_O[12]*0.95,0);
   end;
 function OkladZamNachETO:Real;
 //shifrDol=302
   begin
         OkladZamNachETO:=SimpleRoundTo(R_O[11]*0.95,0);
   end;
 function OkladZamDirStudGorodka:Real;
 //ShifrDol=185
   begin
         OkladZamDirStudGorodka:=SimpleRoundTo(R_O[10]*0.85,0);
   end;
 function OkladZamDirBiblioteki:Real;
 //ShifrDol=1536
   begin
         OkladZamDirBiblioteki:=SimpleRoundTo(R_O[15]*0.95,0);
   end;
 function OkladZamNachUcjOtdela:Real;
 //ShifrDol=180
   begin
         OkladZamNachUcjOtdela:=SimpleRoundTo(R_O[11]*0.9,0);
   end;

 function MakeOzdorov(Curr_Person:Person_ptr):Boolean;
  const ozdShifr=20;
  var retVal:boolean;
      Curr_Add:ADD_PTR;
  begin
      Curr_Add:=Curr_Person.ADD;
      while (Curr_Add<>Nil) do
       begin
            if Curr_Add^.SHIFR=OzdShifr then
               begin
                    Curr_add^.SUMMA := Curr_person^.OKLAD;
                    Curr_add^.FZP   := Curr_person^.OKLAD;
                    Break;
               end;
            Curr_Add:=Curr_Add.NEXT;
       end;
      makeOzdorov:=retVal;
  end;
begin
//     if isSVDN then
//        begin
//            if ((NMES=05) and (CURRYEAR=2016)) then
//               begin
//                    MakeOkl052016;
//                    Exit;
//               end;
//        end;

     if not YesNo('Установить новые оклады для работников'+#13#10+'(при этом текущие оклады будут утрачены)') then
        Exit;
     if not YesNo('Вы сделали архив зарплаты для возможности восстановления?') then
        Exit;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if KategList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны категории');
             Exit;
        end;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны счета');
             Exit;
        end;
     LoRazr:=SpinEditLoRazr.Value;
     HiRazr:=SpinEditHiRazr.Value;
     if not ((LoRazr>0) and (HiRazr>0) and (HiRazr>=LoRazr)) then
        begin
             ShowMessage('Не верно указан диапазон разрядов');
             Exit;
        end;
     BitBtn1.Enabled:=False;
     Application.ProcessMessages;
     FillOkladyForRazr;
     if isLNR then
        fillDolgOkladyFromSQL;
     SaveNMES:=NMES;
     SaveNSRV:=NSRV;
     PutInf;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Sc:=0;
     for I_NSRV:=1 to Count_Serv do
         begin
              Inc(Sc);
              NSRV:=I_NSRV;
              ProgressBar1.Position:=Sc;
              Application.ProcessMessages;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if not NameServList.IsSelected(NSRV) then continue;
              getinf(true);
              NeedPut:=false;
              Curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
               begin
                     oldOklad:=curr_person^.oklad;
                     Razr:=GetRazrjadPerson(Curr_Person);
                     shifrdol:=get_dol_code(curr_person);
                     if isLNR then
                     if (shifrDol <10) or
                        (shifrDol =1500) or
                        (shifrDol =1510) or
                        (shifrDol =1520) or
                        (shifrDol =1530)  then
                        begin
                             curr_person:=curr_person^.NEXT;
                             continue;
                        end;

                     if ((Razr>=LoRazr) and (Razr<=HiRazr)) then
                     if pos('ПОВ',Upper_String(Curr_Person^.Dolg))=0 then
                     if pos('ПІД',Upper_String(Curr_Person^.Dolg))=0 then
                     if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                     if KategList.IsSelected(Curr_Person^.Kategorija) then
                        begin
                             Koef:=1;
                             KoefP:=1;
                             Koef:=GET_KOEF_OKLAD_PERSON(Curr_Person);
                             if cbRKoef.Checked then
                                begin
                                    if R_P[Razr]>0 then
                                       begin
                                            KoefP:=Curr_Person.OKLAD/R_P[Razr];
                                            if (KoefP<1) and (Koef>0.99) then
                                               Koef:=KoefP;
                                       end;
                                end;
                             koef := SimpleRoundTo(koef,-4);
        //                     koef:=r10(koef);
                             if Koef>1 then koef:=1;
                             Oklad:=R10(R_O[Razr] * Koef);
                             if isSVDN then
                                Curr_Person^.OKLAD:=RoundTo(Oklad,-2)
//                                Curr_Person^.OKLAD:=RoundTo(Oklad,-2)
                             else
                                begin
                                     if (abs(abs(koef)-1.00)<0.001) then
                                        Curr_Person^.OKLAD:=SimpleRoundTo(Oklad,0)
                                     else
                                        Curr_Person^.OKLAD:=SimpleRoundTo(Oklad,-2);

                                end;
                             if isLNR then        // проректора и главбух и его замы
                                begin
                                     shifrdol:=get_dol_code(curr_person);
                                     case shifrdol of
                                      20,30,40: if NSRV=1 then Curr_Person^.OKLAD := OkladProrektor;
                                      520:      if NSRV=1 then Curr_Person^.OKLAD := OkladPomRektora;
                                      605:      if NSRV=3 then Curr_Person^.OKLAD := OkladGlBuh;
                                      1424:     if NSRV=3 then Curr_Person^.OKLAD := OkladZamGlBuh;
                                      80,1531:  Curr_Person^.OKLAD := OkladZamDekana;
                                      1532:     Curr_Person^.OKLAD := OkladZamDirInst;
                                      185:      Curr_Person^.OKLAD := OkladZamDirStudGorodka;
                                      1536:     Curr_Person^.OKLAD := OkladZamDirBiblioteki;
                                      180:      Curr_Person^.OKLAD := OkladZamNachUcjOtdela;
                                      302:      Curr_Person^.OKLAD := OkladZamNachETO;
                                     end;
//                                     if (NMES=7) and (curryear=2016) then
//                                        begin
//                                             MakeOzdorov(Curr_person);
//                                        end;
(*
                                     if isInSpecDolgList(shifrDol) then
                                        begin
                                            testOklad:=getOkladByShifrDol(shifrDol);
                                            if testOklad<3000 then
                                               begin
                                                    showMessage('Не найден оклад для '+Name_DOLG(shifrDol));
                                                    Curr_Person:=Curr_Person^.NEXT;
                                                    continue;
                                               end;
                                            curr_person^.OKLAD:=testOklad;
                                            newOklad:=testOklad;
                                        end;
*)
                                end;
                             NeedPut:=true;
                             if abs(abs(newOklad)-abs(oldOklad))<1.00 then
                                showMessage('Оклад стал меньше у '+intToStr(curr_person^.tabno)+' '+trim(curr_person^.fio));
                        end;
                     Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then PutInf;
              empty_all_person;
         end;

     NMES:=SaveNMES;
     NSRV:=SaveNSRV;
     MKFLNM;
     GetInf(TRUE);
     FormWaitMess.SetMessage('Новые оклады установлены');
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;
     BitBtn1.Enabled:=False;
     Application.ProcessMessages;




end;

function TFormMoveNewOkladToRazr.FillOkladyForRazr:boolean;
 var SQLStmnt:string;
     i:integer;
 begin
       for i:=1 to 25 do R_O[i]:=0;
       if pFIBQuery1.Transaction.Active then
          pFIBQuery1.Transaction.Commit;
       pFIBQuery1.Transaction.StartTransaction;
       if pFIBQuery1.Open then
          pFIBQuery1.Close;
       pFIBQuery1.SQL.Clear;
       SQLStmnt:='select a.razr, a.oklad from tb_razr_proc a';
       SQLStmnt:=SQLStmnt+' where a.datefr = (select max(b.datefr) from tb_razr_proc b)';
       SQLStmnt:=SQLStmnt+' order by 1';
       pFIBQuery1.SQL.Add(SQLStmnt);
       pFIBQuery1.ExecQuery;
       i:=0;
       while (not pFIBQuery1.Eof) and (i<25) do
         begin
              if ((pFIBQuery1.Fields[0].AsInteger>0) and
                  (pFIBQuery1.Fields[0].AsInteger<26)) then
                 begin
                      R_O[pFIBQuery1.Fields[0].AsInteger]:=pFIBQuery1.Fields[1].AsFloat;
                 end;
              pFIBQuery1.Next;
         end;
       pFIBQuery1.Close;
       pFIBQuery1.Transaction.Commit;

       for i:=1 to 25 do R_P[i]:=0;
       if pFIBQuery1.Transaction.Active then
          pFIBQuery1.Transaction.Commit;
       pFIBQuery1.Transaction.StartTransaction;
       if pFIBQuery1.Open then
          pFIBQuery1.Close;
       pFIBQuery1.SQL.Clear;
       SQLStmnt:='select  a.razr, a.oklad from tb_razr_proc a';
//       SQLStmnt:=SQLStmnt+' where a.datefr = (select max(b.datefr) from tb_razr_proc b)';
       SQLStmnt:=SQLStmnt+' where a.datefr = ''2015-09-01''';
//       SQLStmnt:=SQLStmnt+' where a.datefr = (select max(b.datefr) from tb_razr_proc b';
//       SQLStmnt:=SQLStmnt+' where b.datefr<(select max(c.datefr) from tb_razr_proc c))';
       SQLStmnt:=SQLStmnt+' order by 1';
       pFIBQuery1.SQL.Add(SQLStmnt);
       pFIBQuery1.ExecQuery;
       i:=0;
       while (not pFIBQuery1.Eof) and (i<25) do
         begin
              if ((pFIBQuery1.Fields[0].AsInteger>0) and
                  (pFIBQuery1.Fields[0].AsInteger<26)) then
                 begin
                      R_P[pFIBQuery1.Fields[0].AsInteger]:=pFIBQuery1.Fields[1].AsFloat;
                 end;
              pFIBQuery1.Next;
         end;
       pFIBQuery1.Close;
       pFIBQuery1.Transaction.Commit;


       Result:=true;
 end;


procedure TFormMoveNewOkladToRazr.BitBtn3Click(Sender: TObject);
begin
{
    Application.CreateForm(TFormSelPodr, FormSelPodr);
    FormSelPodr.ShowModal;
}
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;


end;

procedure TFormMoveNewOkladToRazr.FormCreate(Sender: TObject);
begin
     HiRazr:=24;
     LoRazr:=1;
end;

procedure TFormMoveNewOkladToRazr.MakeOkl052016;
 var SaveNMES,SaveNSRV,SC,I_NSRV:integer;
     Curr_Person:Person_Ptr;
     Koef:real;
     Razr:integer;
     Oklad:real;
     NeedPut:boolean;
     SQLStmnt:string;
     SummaOld:Real;
     SummaNew:real;
     SummaRazn:Real;
     SummaRaznS:string;
     datauw:tdatetime;
     yearuw:Integer;
     devo:textfile;
     cnt:Integer;
begin
     if not YesNo('Установить новые оклады в 05 2016 для работников'+#13#10+'(при этом текущие оклады будут утрачены)') then
        Exit;
     if not YesNo('Вы сделали архив зарплаты для возможности восстановления?') then
        Exit;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if KategList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны категории');
             Exit;
        end;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны счета');
             Exit;
        end;

     LoRazr:=SpinEditLoRazr.Value;
     HiRazr:=SpinEditHiRazr.Value;
     if not ((LoRazr>0) and (HiRazr>0) and (HiRazr>=LoRazr)) then
        begin
             ShowMessage('Не верно указан диапазон разрядов');
             Exit;
        end;
     FillOkladyForRazr;
     SaveNMES:=NMES;
     SaveNSRV:=NSRV;
     PutInf;
     Empty_all_person;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Sc:=0;
     SQLStmnt:='delete from tb_new_okl_12_2015';
     FIB.pFIBDatabaseSal.Execute(SQLStmnt);
//     assignFile(devo,'t.txt');
//     Rewrite(devo);
     cnt:=0;
     for I_NSRV:=1 to Count_Serv do
         begin
              Inc(Sc);
              NSRV:=I_NSRV;
              ProgressBar1.Position:=Sc;
              Application.ProcessMessages;
              MKFLNM;
              if not FileExists(FNINF) then continue;
              if not NameServList.IsSelected(NSRV) then continue;
              getinf(true);
              NeedPut:=false;
              Curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
               begin
                     datauw:=getDataUwPersonFromSQL(Curr_person^.tabno);
                     yearuw:=yearof(datauw);
                     Razr:=GetRazrjadPerson(Curr_Person);
                     if not ((yearuw>2010) and (yearuw<2016)) then
                     if ((Razr>=LoRazr) and (Razr<=HiRazr)) then
                     if pos('ПОВ',Upper_String(Curr_Person^.Dolg))=0 then
                     if pos('ПІД',Upper_String(Curr_Person^.Dolg))=0 then
                     if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                     if KategList.IsSelected(Curr_Person^.Kategorija) then
                     if Curr_person^.AUTOMATIC=automatic_mode then
                     if Curr_person^.oklad>0.01 then
                        begin
//                             Koef:=1;
//                             Koef:=GET_KOEF_OKLAD_PERSON(Curr_Person);
//
//                             if Abs((curr_person^.OKLAD/koef)-R_P[Razr])>5  then
//                               begin
//                                    Inc(cnt);
//                                    writeln(devo,cnt:4,' ',nsrv:3,' ',Curr_person^.tabno:5,' ',copy(trim(Curr_Person^.FIO)+space(20),1,20),' ',Copy(trim(Curr_Person^.Dolg)+space(10),1,10),' ',razr:3,' ',koef:5:2,' ',curr_person^.oklad:10:2,' ',curr_person^.oklad/koef:10:2,' ',R_P[RAZR]:10:2);
//                               end;
//
                             Koef:=1;
                             Koef:=GET_KOEF_OKLAD_PERSON(Curr_Person);
                             if cbRKoef.Checked then
                                if R_P[Razr]>0 then
                                   Koef:=Curr_Person.OKLAD/R_P[Razr];
                             koef:=r10(koef);
                             if Koef>1 then koef:=1;
                             Oklad:=R10(R_O[Razr] * Koef);
                             {$IFDEF SVDN}
                               calc_naud_person(curr_person,31);
                               summaold:=getSummaAddForPerson(Curr_Person);
                             Curr_Person^.OKLAD:=RoundTo(Oklad,-2);
                               calc_naud_person(curr_person,31);
                               summanew:=getSummaAddForPerson(Curr_Person);
                               summaRazn:=summaNew-summaOld;
                               summaRaznS:=FormatFloatPoint(summaRazn);
                             SQLStmnt:='insert into tb_new_okl_12_2015 (TABNO,GUID,RAZN,PREM,IND,RASRZN,DOLG,FIO,KOEF ) values(';
                             SQLStmnt:=Trim(SQLStmnt)+intToStr(Curr_Person^.tabno)+',';
                             SQLStmnt:=Trim(SQLStmnt)+''''+GetGUIDPersonToString(Curr_Person)+''',';
                             SQLStmnt:=Trim(SQLStmnt)+SummaRaznS+',0.0,0.0,0.0,'''+trim(ReplQto2Q(Curr_Person^.dolg))+''','''+trim(ReplQto2Q(Curr_Person^.FIO))+''',';
                             summaRaznS:=formatFloatPoint(koef);
                             SQLStmnt:=Trim(SQLStmnt)+SummaRaznS+')';
                             FIB.pFIBDatabaseSal.Execute(SQLStmnt);
                             {$ELSE}
                             Curr_Person^.OKLAD:=SimpleRoundTo(Oklad,0);
                             {$ENDIF}
                             NeedPut:=true;
                        end;
                     Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then PutInf;
              empty_all_person;
         end;
  //   CloseFile(devo);
     NMES:=SaveNMES;
     NSRV:=SaveNSRV;
     MKFLNM;
     GetInf(TRUE);
     FormWaitMess.SetMessage('Новые оклады установлены');
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;




end;


end.
