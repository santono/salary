unit UFormRptTstPod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls,
  frxExportTXT, frxExportXLS, frxExportHTML, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery;

type
  TFormRptTstPod = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    frxDotMatrixExportSL: TfrxDotMatrixExport;
    ProgressBar1: TProgressBar;
    frxUserDataSetSl: TfrxUserDataSet;
    LabelPodr: TLabel;
    LabelFIO: TLabel;
    frxHTMLExport1: TfrxHTMLExport;
    frxXLSExport1: TfrxXLSExport;
    frxTXTExport1: TfrxTXTExport;
    frxReportSL: TfrxReport;
    chkExcel: TCheckBox;
    pFIBQuery: TpFIBQuery;
    pFIBTransaction: TpFIBTransaction;
    CheckBox1: TCheckBox;
    CheckBoxOtherPeriod: TCheckBox;
    CheckBoxOnlyLim: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure frxUserDataSetSlFirst(Sender: TObject);
    procedure frxUserDataSetSlNext(Sender: TObject);
    procedure frxUserDataSetSlGetValue(const VarName: String;
      var Value: Variant);
    procedure frxUserDataSetSlCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxReportSLGetValue(const VarName: String;
      var Value: Variant);
    procedure frxsrdtst1GetValue(const VarName: String;
      var Value: Variant);
    procedure frxsrdtst1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxsrdtst1Next(Sender: TObject);
    procedure frxsrdtst1First(Sender: TObject);
    procedure frxrprtswod1GetValue(const VarName: String;
      var Value: Variant);
    procedure frxsrdtst2CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxsrdtst2First(Sender: TObject);
    procedure frxsrdtst2Next(Sender: TObject);
    procedure frxsrdtst2GetValue(const VarName: String;
      var Value: Variant);
    procedure frxrprtswod2GetValue(const VarName: String;
      var Value: Variant);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBoxOnlyLimClick(Sender: TObject);
  private
    { Private declarations }
    Y,M : integer;
    NeedSeparateSwodyByPeriods:Boolean;
    procedure DownLoadToExcel;
    procedure MakeEcbSwod1;
    procedure BuildListYMForSwod;

  public
    { Public declarations }
  end;

  type  PRecPod=^TRecPod;
        TRecPod = record
                 Y               : Integer;
                 m               : Integer;
                 IsOtp           : Boolean;
                 IsOther         : Boolean;
                 NeedInSwod      : Boolean;
                 tabno           : integer;
                 shifrpod        : Integer;
                 fio             : string;
                 SummaPodAdd     : Real;
                 SummaPodFakt    : Real;
                 SummaPodRas     : Real;
                 SummaPodRazn    : Real;
                end;

var
  FormRptTstPod    : TFormRptTstPod;
  CntFormRptTstECB : integer;
  List:TStringList;
  ListOth:TStringList;
  ListYMForSwod:TList;


implementation
  uses ScrIo , ScrDef , ScrUtil , ScrLists , ComOBJ, uFormMkPensList,uFIBmODULE,
       UFormTstECBAddFromSQL,ScrNalog,UORecalcAbon;
  type
        PItemYM=^TItemYM;
        TItemYM=record
                 Y:Integer;
                 M:Integer;
                end;



  var {List:TStringList;}
      i_count:integer;
{$R *.dfm}

procedure TFormRptTstPod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormRptTstECB>0 then
         Dec(CntFormRptTstECB);
end;

procedure TFormRptTstPod.FormCreate(Sender: TObject);
begin
      Inc(CntFormRptTstECB);
      NeedSeparateSwodyByPeriods:=false;
      CheckBoxOtherPeriod.Checked:=False;
      CheckBoxOnlyLim.Checked:=False;
      CheckBox1.Checked:=False;

end;

procedure TFormRptTstPod.Button1Click(Sender: TObject);
 type PItem=^TItem;
      TItem=record
             y:Integer;
             m:Integer;
            end;

 var savnmes,savnsrv:integer;
     i_nsrv  : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_ptr;
     Curr_Ud     : Ud_ptr;
     RecPod      : PRecPod;
     I,JIndex,J  : integer;
     Finded      : boolean;
     Dev         : TextFile;
     FName       : string;
     ListYM      : TList;
     Y,M         : Integer;
     LExpr1      : Boolean; {не др мес или г=г и м=м }
     LExpr2      : Boolean;
  procedure BuildListYM(CurrPerson:Person_Ptr);
   var Curr_Add : ADD_PTR;
       Curr_Ud  : UD_PTR;
       Finded   : Boolean;
       Y,M,I    : Integer;
       Item     : PItem;
   begin
        ListYM:=TList.Create;
        Curr_Add:=Curr_Person^.ADD;
        while (Curr_Add<>Nil) do
         begin
              if IsOtherPeriodECBShifr(Curr_Add^.SHIFR) then
                 begin
                      y:=Curr_Add^.YEAR+1990;
                      m:=Curr_Add^.PERIOD;
                 end
              else
                 begin
                      y:=CURRYEAR;
                      m:=nmes;
                 end;
              finded:=False;
              if ListYM.Count>0 then
                 for i:=0 to ListYM.Count-1 do
                     if ((PItem(ListYM.Items[i]).y=y) and
                         (PItem(ListYM.Items[i]).m=m)) then
                         begin
                              Finded:=True;
                              Break;
                         end;
                 if not Finded then
                    begin
                         New(Item);
                         Item.y:=y;
                         Item.m:=m;
                         ListYM.Add(Item);
                    end;
              Curr_Add:=Curr_Add^.NEXT;
         end;
        Curr_Ud:=Curr_Person^.UD;
        while (Curr_Ud<>Nil) do
         begin
              if (Curr_Ud^.SHIFR=Podoh_Shifr) then
                  begin
                       y:=Curr_Ud^.Year+1990;
                       m:=Curr_Ud^.Period;
                       finded:=False;
                       if ListYM.Count>0 then
                          for i:=0 to ListYM.Count-1 do
                              if ((PItem(ListYM.Items[i]).y=y) and
                                  (PItem(ListYM.Items[i]).m=m)) then
                                  begin
                                       Finded:=True;
                                       Break;
                                  end;
                          if not Finded then
                             begin
                                  New(Item);
                                  Item.y:=y;
                                  Item.m:=m;
                                  ListYM.Add(Item);
                             end;
                  end;
              Curr_Ud:=Curr_Ud^.NEXT;
         end;
   end;
  function Test10001:boolean;
   var F:boolean;
       JI:integer;
       a:real;
   begin
        f:=List.Find('10001',JI);
        if not f then
           begin
               result:=false;
               Exit;
           end;
        a:=PRecPod(List.Objects[JIndex]).SummaNAdd;
        if abs(a)>0.001 then
           begin
                Result:=true;
                Exit;
           end;


   end;
  function BuildStrKey(Tabno:Integer;Y:Integer;m:integer):string;
   var S:string;
   begin
        S:=IntToStr(Tabno);
        S:=S+' '+IntToStr(Y);
        S:=S+' '+IntToStr(M);
        BuildStrKey:=S;
   end;

  procedure AddDataFromSql;
    var FormTstECBAddFromSQL:TFormTstECBAddFromSQL;
    begin
         Application.CreateForm(TFormTstECBAddFromSQL,FormTstECBAddFromSQL);
         FormTstECBAddFromSQL.SetList(List);
         FormTstECBAddFromSQL.Show;
         FormTstECBAddFromSQL.Execute;
    end;


  procedure CalcPodohForAllPersonInList();
    var I_nsrv:Integer;
        savnsrv,savnmes:Integer;
        Curr_Person:PERSON_PTR;
    procedure  CalcPodPerson(Curr_Person:Person_Ptr);
       var finded:Boolean;
           findedoth:Boolean;
           i,ioth:Integer;
           SummaAdd   ,SummaUd      : Real;
           SummaAddOth,SummaUdOth   : Real;
           SummaAddTot,SummaUdTot   : Real;
           SummaPodRasTot           : Real;
           SummaPodAdd,SummaPodUd,SummaPodRas:real;

           y,m:Integer;
       begin
            if List.Count=0 then Exit;

            finded    := False;
            findedoth := False;
            SummaAdd  := 0;
            SummaUd   := 0;
            SummaECB  := 0;
            for i:=0 to List.Count-1 do
                if PRecPod(List.Objects[i]).tabno=Curr_Person^.TABNO then
                   begin
                        SummaAddOth  := 0;
                        SummaUdOth   := 0;
                        SummaECBOth  := 0;
                        y:=PRecPod(List.Objects[i]).Y;
                        m:=PRecPod(List.Objects[i]).M;
                        if (Curr_Person^.tabno=279) and
                            (y=2011) and (m=10) then
                            Curr_Person^.tabno:=279;
                        SummaAdd := PRecPod(List.Objects[i]).SummaPodAdd;
                        SummaUd  := PRecPod(List.Objects[i]).SummaPodFakt;
                        Finded:=ListOth.Find(BuildStrKey(PRecPod(List.Objects[i]).Tabno,
                                                         PRecPod(List.Objects[i]).Y,
                                                         PRecPod(List.Objects[i]).M),IOth);
                        if Finded then
                          begin
                               SummaAddOth := PRecPod(ListOth.Objects[ioth]).SummaPodAdd;
                               SummaUdOth  := PRecPod(ListOth.Objects[ioth]).SummaPodFakt;
                          end;
                        SummaAddTot := SummaAdd + SummaAddOth;
                        SummaUdTot  := SummaUd  + SummaUdOth;
                        SummaPodRasTot:=PODOH_2004_2011(SummaAdd+SummaAddOth,SummaECB+SummaECBOth,0,M,Y,Curr_Person);
                        PRecPod(List.Objects[i]).SummaPodRas:=PODOH_2004_2011(SummaAdd+SummaAddOth,SummaECB+SummaECBOth,0,M,Y,Curr_Person)-SummaUdOth;
                        PRecPod(List.Objects[i]).SummaPodRazn:=PRecPod(List.Objects[i]).SummaPodRas-PRecPod(List.Objects[i]).SummaPodFakt;//-SummaUd;
                        if Abs(PRecPod(List.Objects[i]).SummaPodRazn)>0.02  then
                          begin
                               GetResultRecalcPodohPerson(Y,M,Curr_Person,SummaPodAdd,SummaPodUd,SummaPodRas);
                               SummaAddTot := SummaPodAdd ;
                               SummaUdTot  := SummaPodUd  ;
                               SummaPodRasTot := SummaPodRas;
                               PRecPod(List.Objects[i]).SummaPodRas  := SummaPodRasTot - SummaUdOth;
                               PRecPod(List.Objects[i]).SummaPodRazn := SummaPodRasTot - SummaUdTot;//-SummaUd;
                          end;

                   end;
       end;
    begin
         PUTINF;
         savnsrv:=NSRV;
         savnmes:=NMES;
         LDEL_PERSON;
         Application.ProcessMessages;
         for i_nsrv:=1 to Count_Serv do
             begin
//                  ProgressBar1.Position:=i_nsrv+Count_Serv;
                  ProgressBar1.Position:=ProgressBar1.Position+1;
                  nsrv:=i_nsrv;
                  LabelPodr.Caption:=Name_Serv(NSRV);
                  Application.ProcessMessages;
                  if nsrv=82 then continue; // с материальной помощи есв не берется
                  mkflnm;
                  if not FileExists(fninf) then continue;
                  getinf(true);
                  Curr_Person:=HEAD_PERSON;
                  while (Curr_Person<>Nil) do
                    begin
                         LabelFIO.Caption:=Curr_Person^.Fio;
                         if Curr_Person^.WID_RABOTY=osn_wid_raboty then
                            CalcPodPerson(Curr_Person);
                         Curr_Person:=Curr_Person^.NEXT;
                    end;
                  while (Head_Person<>Nil) do del_Person(Head_Person);

             end;
         nsrv    := savnsrv;
         nmes    := savnmes;
         mkflnm;
         GetInf(true);


    end;



begin
     savnmes := nmes;
     savnsrv := nsrv;
     putinf;
     while (head_person<>nil) do del_person(Head_person);
     Application.ProcessMessages;
     NeedSeparateSwodyByPeriods:=CheckBoxOtherPeriod.Checked;
     List:=TStringList.Create;
     List.Sorted:=true;
     List.Capacity:=6000;
     ProgressBar1.max:=count_serv*2;
     ProgressBar1.min:=0;
     ProgressBar1.Position:=0;
     for i_nsrv:=1 to count_serv do
         begin
//              if i_nsrv<>87 then continue;
              ProgressBar1.Position:=i_nsrv;
              nsrv:=i_nsrv;
              mkflnm;
              if not FileExists(fninf) then continue;
              if nsrv=106 then continue; // с материальной помощи есв не берется
              LabelPodr.Caption:=Name_Serv(NSRV);
              getinf(true);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                     if Curr_Person^.Tabno=1038  then
                        Finded:=false;
                     if ((nsrv=87) and (Curr_Person^.Tabno=10338)) then
                        Finded:=false;
                     BuildListYM(Curr_Person);
                     if not Assigned(ListYM) then
                        begin
                             Curr_Person:=Curr_Person^.NEXT;
                             Continue;
                        end;
                     if ListYM.Count<1 then
                        begin
                             Curr_Person:=Curr_Person^.NEXT;
                             Continue;
                        end;
                     for i_count:=0 to ListYM.Count-1 do
                         begin
                               y:=PItem(ListYM.Items[i_count]).y;
                               m:=PItem(ListYM.Items[i_count]).m;
                               if Curr_Person^.Tabno=1453 then
                                  y:=y;
                               Finded:=false;
                               LabelFIO.Caption:=IntToStr(Curr_Person^.Tabno)+' '+Curr_Person^.Fio;
                               Application.ProcessMessages;
                               if List.Find(BuildStrKey(Curr_Person^.Tabno,y,m),JIndex) then Finded:=true;
                               if not Finded  then
                                  begin
                                       New(RecPod);
                                       FillChar(RecPod^,SizeOf(RecPod^),0);
                                       RecPod^.Y   := Y;
                                       RecPod^.M   := M;
                                       RecPod^.IsOtp   := False;
                                       RecPod^.IsOther := False;
                                       RecPod^.NeedInSwod := False;
                                       RecPod^.tabno   := Curr_Person^.TABNO;
                                       RecPod^.fio     := Curr_Person^.FIO;
                                       RecPod^.shifrpod:= NSRV;
                                       RecPod^.SummaPodAdd    := 0;
                                       RecPod^.SummaPodFakt   := 0;
                                       RecPod^.SummaPodRas    := 0;
                                       RecPod^.SummaPodRazn   := 0;

                                       List.AddObject(BuildStrKey(Curr_Person^.Tabno,y,m),TObject(RecPod));
                                  end;
                               Finded:=List.Find(BuildStrKey(Curr_Person^.Tabno,y,m),JIndex);
                               if Curr_Person^.Wid_raboty=OSN_WID_RABOTY then
                                  PRecPod(List.Objects[JIndex]).shifrpod:=NSRV;
                               Curr_Add:=Curr_Person^.Add;
                               while (Curr_Add<>Nil) do
                                     begin
                                          if Curr_Person^.Tabno=1453 then
                                             y:=y;
                                          LExpr1:=(((not IsOtherPeriodECBShifr(Curr_Add^.Shifr)))
                                                   or ((Curr_Add^.Period=m) and
                                                       (Curr_Add^.YEAR+1990=y)));
                                          LExpr2:= IsOtherPeriodECBShifr(Curr_Add^.Shifr) and
                                                   (Curr_Add^.Period=m) and
                                                   (Curr_Add^.YEAR+1990=y);
                                          if (ShifrList.IsPodoh(Curr_Add^.Shifr)) then
                                          if (((y=CURRYEAR) and (m=NMES) and LExpr1) or
                                              ((not((y=CURRYEAR) and (m=NMES))) and LExpr2)) then
                                             begin
                                                 if IsOtpShifr(Curr_Add^.Shifr) then
                                                    PRecPod(List.Objects[JIndex]).IsOtp:= True;
                                                 if not IsOtherPeriodECBShifr(Curr_Add^.Shifr) then
                                                    PRecPod(List.Objects[JIndex]).IsOther:= True;
                                                 PRecPod(List.Objects[JIndex]).NeedInSwod:= True;
                                                 if Curr_Person^.Tabno=326 then
                                                    Curr_Person^.Tabno:=326;
                                                 if ShifrList.IsPodoh(Curr_Add^.Shifr) then
                                                    PRecECB(List.Objects[JIndex]).SummaPodAdd:=
                                                           PRecECB(List.Objects[JIndex]).SummaPodAdd+Curr_Add^.Summa
                                             end;
                                          Curr_Add:=Curr_Add^.NEXT;
                                     end;
                               Curr_Ud:=Curr_Person^.Ud;
                               while (Curr_Ud<>Nil) do
                                     begin
                                          if ((Curr_Ud^.Period=m) and (Curr_Ud^.Year+1990=Y)) then
                                             begin
                                                  if Curr_Ud^.Shifr=Podoh_Shifr then
                                                     PRecPod(List.Objects[JIndex]).SummaPodFakt :=
                                                        PRecPod(List.Objects[JIndex]).SummaPodFakt+Curr_Ud^.Summa;
                                             end;
                                          Curr_Ud:=Curr_Ud^.NEXT;
                                     end;
                         end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              while (head_person<>nil) do del_person(Head_person);
         end;

     if Assigned(ListYM) then
        begin
             if ListYM.Count>0 then
                for i:=0 to ListYM.Count-1 do
                    Dispose(PItem(ListYM.Items[i]));
             ListYM.Free;
        end;

     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);

     if Test10001 then
        Finded:=true;

     AddDataFromSql;

     if List.Count>0 then
        begin
   //          ShowMessage('К-во='+IntToStr(List.Count)+' в БД '+IntToStr(ListOth.Count));

             CalcPodohForAllPersonInList;


             if chkExcel.Checked then DownLoadToExcel;
             ListYMForSwod:=TList.Create;
             BuildListYMForSwod;
 //    ShowMessage('К-во after ='+IntToStr(List.Count));

  //   if Test10001 then
        Finded:=true;
         //    frxUserDataSetSl.RangeBegin := rbFirst;
         //    frxUserDataSetSl.RangeEnd   := rbLast;
             frxUserDataSetSl.RangeEndCount := List.Count;
             frxReportSL.ShowReport;
             FName:=CDOC+'NeedTN.txt';
             AssignFile(Dev,FName);
             Rewrite(dev);
             for i:=0 to List.Count-1 do
                 writeln(dev,PRecPod(List.Objects[i]).Tabno:5,' ',PRecPod(List.Objects[i]).Y:4,' ',PRecPod(List.Objects[i]).M:2);
             CloseFile(dev);
        end;
     if Assigned(List) then
        List.Free;
     if ListOth<>Nil then
        ListOth.Free;
     if Assigned(ListYMForSwod) then
        begin
             if ListYMForSwod.Count>0   then
                for i:=0 to ListYMForSwod.Count-1 do
                    Dispose(PItemYM(ListYMForSwod.Items[i]));
             ListYMForSwod.Free;
        end;
     while (head_person<>nil) do del_person(Head_person);
     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);
     Self.Close;
end;

procedure TFormRptTstPod.DownLoadToExcel;
 var FName : string;
     V     : variant;
     ExRow,ExCol:integer;
     SheetName : string;
     I,J,LineNo  : integer;
     SummaRas,SummaRazn  : real;
     NeedOnlyProblem:Boolean;
     NeedLimitOnly:Boolean;
     S:string;
 begin
     NeedLimitOnly:=false;
     NeedLimitOnly:=CheckBoxOnlyLim.Checked;
     NeedOnlyProblem:=CheckBox1.Checked;
     if NeedOnlyProblem then
        NeedLimitOnly:=false;
     if NeedLimitOnly then
        NeedOnlyProblem:=false;
     if List.Count=0 then Exit;
     FName:=TemplateDIR+'TestECB.xlt';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует файл '+FName);
             Exit;
        end;
     try
        V:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     SheetName:='Test';
     V.Visible:=True;
     V.WorkBooks.Open(FName);
     ExRow:=7;
     LineNo:=0;
     ProgressBar1.Max:=List.Count;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;

     for i:=0 to List.Count-1 do
         begin
              ProgressBar1.Position:=i+1;
              Application.ProcessMessages;
              if NeedOnlyProblem and not NeedLimitOnly then
              Inc(ExRow);
              Inc(LineNo);
              ExCol:=0;
              Inc(ExCol);
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,1]:=LineNo;
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,2]:=PRecPod(List.Objects[i]).tabno;
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,3]:=PRecPod(List.Objects[i]).ShifrPod;
              s:=PRecPod(List.Objects[i]).Fio;
              if not PRecPod(List.Objects[i]).NeedInSwod then
                 S:=Trim(s)+'-прт';
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,4]:=S;
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,5]:=PRecPod(List.Objects[i]).Y;
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,6]:=PRecPod(List.Objects[i]).M;
              if (abs(PRecPod(List.Objects[i]).SummaPodAdd)>0.005) or
                 (abs(PRecPod(List.Objects[i]).SummaPodFakt)>0.005) or
                 (abs(PRecPod(List.Objects[i]).SummaPodRas)>0.005) then
                 begin
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,27]:=PRecPod(List.Objects[i]).SummaPodAdd;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,28]:=PRecPod(List.Objects[i]).SummaPodFakt;
                      SummaRas  := PRecPod(List.Objects[i]).SummaPodRas;
                      SummaRazn := PRecPod(List.Objects[i]).SummaPodRazn;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,29]:=SummaRas;
                      if (abs(SummaRazn)>0.015) then
                         V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,30]:=SummaRazn;
                 end;
         end;
 end;


procedure TFormRptTstPod.frxUserDataSetSlFirst(Sender: TObject);
begin
      i_count:=0;
end;

procedure TFormRptTstPod.frxUserDataSetSlNext(Sender: TObject);
begin
      inc(i_count);
end;

procedure TFormRptTstPod.frxUserDataSetSlGetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'tabno')=0 then
        Value:=PRecPod(List.Objects[i_count])^.tabno
     else if CompareText(VarName,'fio')=0 then
             Value:=PRecPod(List.Objects[i_count])^.fio
     else if CompareText(VarName,'summapodadd')=0 then
             Value:=PRecPod(List.Objects[i_count])^.SummaPodAdd
     else if CompareText(VarName,'summapodfakt')=0 then
             Value:=PRecPod(List.Objects[i_count])^.SummaPodFakt
     else if CompareText(VarName,'summapodras')=0 then
             Value:=PRecPod(List.Objects[i_count])^.Summapodras
     else if CompareText(VarName,'summapodrazn')=0 then
             Value:=PRecPod(List.Objects[i_count])^.Summapodraxn;
end;

procedure TFormRptTstPod.frxUserDataSetSlCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=List.Count-1 then Eof:=true
      else eof:=false;
end;

procedure TFormRptTstPod.frxReportSLGetValue(const VarName: String;
  var Value: Variant);
begin
      if CompareText(VarName,'month')=0 then
         Value:=GetMonthRus(nmes)
      else if CompareText(VarName,'year')=0 then
         Value:=CurrYear;
end;

procedure TFormRptTstPod.frxsrdtst1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'name')=0 then
        case i_count of
          1 : Value:='6.1%';
          2 : Value:='3.6%';
          3 : Value:='2.6%';
          4 : Value:='2.0%';
        end
     else if CompareText(VarName,'summaadd')=0 then
             Value:=EcbSwodAlla1[i_count].SummaAddTot
     else if CompareText(VarName,'summaaddlim')=0 then
             Value:=EcbSwodAlla1[i_count].SummaAddLim
     else if CompareText(VarName,'summaecb')=0 then
             Value:=EcbSwodAlla1[i_count].SummaEcbFakt
     else if CompareText(VarName,'summaecbras')=0 then
             Value:=EcbSwodAlla1[i_count].SummaEcbRas
     else if CompareText(VarName,'summaecbpereras')=0 then
             Value:=EcbSwodAlla1[i_count].SummaEcbPereras;


end;




procedure TFormRptTstPod.frxsrdtst1CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=5 then Eof:=true
      else Eof:=false;
end;

procedure TFormRptTstPod.frxsrdtst1Next(Sender: TObject);
begin
     Inc(i_count);
end;

procedure TFormRptTstPod.frxsrdtst1First(Sender: TObject);
begin
     i_count:=1;
end;

procedure TFormRptTstPod.frxrprtswod1GetValue(const VarName: String;
  var Value: Variant);
  var i:Integer;
begin
     if VarName='DATAZA' then
        if Self.M=0 then
           Value:='Итого'
        else
           Value:='за '+GetMonthRus(Self.M)+' '+IntToStr(Self.Y)+' г.';

end;

procedure TFormRptTstPod.frxsrdtst2CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=5 then Eof:=true
      else Eof:=false;
end;
procedure TFormRptTstPod.frxsrdtst2First(Sender: TObject);
begin
      i_count:=1;
end;
procedure TFormRptTstPod.frxsrdtst2Next(Sender: TObject);
begin
      Inc(i_count);
end;
procedure TFormRptTstPod.frxsrdtst2GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'name')=0 then
        case i_count of
          1 : Value:='Для 36,3% (все остальные)';
          2 : Value:='Для 34,7% (договора подряда)';
          3 : Value:='Для 33,2% (больничные)';
          4 : Value:='Для  8,41%(инвалиды)';
        end
     else if CompareText(VarName,'summaadd')=0 then
             Value:=EcbSwodAlla2[i_count].SummaAddTot
     else if CompareText(VarName,'summalim')=0 then
             Value:=EcbSwodAlla2[i_count].SummaAddLim
     else if CompareText(VarName,'summaecb')=0 then
             case i_count of
              1: Value:=R10(EcbSwodAlla2[i_count].SummaAddLim*0.363);
              2: Value:=R10(EcbSwodAlla2[i_count].SummaAddLim*0.347);
              3: Value:=R10(EcbSwodAlla2[i_count].SummaAddLim*0.332);
              4: Value:=R10(EcbSwodAlla2[i_count].SummaAddLim*0.0841);
             end;

end;

function CompareYM(Item1, Item2: Pointer): Integer;
begin
     if PItemYM(Item1).Y>PItemYM(Item2).Y then Result:=1
     else
     if PItemYM(Item1).Y<PItemYM(Item2).Y then Result:=-1
     else
     if PItemYM(Item1).M>PItemYM(Item2).M then Result:=1
     else
     if PItemYM(Item1).M<PItemYM(Item2).M then Result:=-1
     else
        Result:=0;
end;

procedure TFormRptTstPod.BuildListYMForSwod;
  var  Finded   : Boolean;
       Y,M,I,J  : Integer;
       ItemYM   : PItemYM;
   begin
        if not Assigned(List) then Exit;
        if List.Count<=0 then Exit;
        for i:=0 to List.Count-1 do
            begin
                 y:=PRecPod(List.Objects[i]).Y;
                 m:=PRecPod(List.Objects[i]).M;
                 finded:=False;
                 if ListYMForSwod.Count>0 then
                    for j:=0 to ListYMForSwod.Count-1 do
                     if ((PItemYM(ListYMForSwod.Items[j]).y=y) and
                         (PItemYM(ListYMForSwod.Items[j]).m=m)) then
                         begin
                              Finded:=True;
                              Break;
                         end;
                 if not Finded then
                    begin
                         New(ItemYM);
                         ItemYM.y:=y;
                         ItemYM.m:=m;
                         ListYMForSwod.Add(ItemYM);
                    end;

            end;
        ListYMForSwod.Sort(@CompareYM);
   end;




procedure TFormRptTstPod.frxrprtswod2GetValue(const VarName: String;
  var Value: Variant);
begin
     if VarName='DATAZA' then
     if Self.M=0 then
        Value:='Итого'
     else
        Value:='за '+GetMonthRus(Self.M)+' '+IntToStr(Self.Y)+' г.';
end;

procedure TFormRptTstPod.CheckBox1Click(Sender: TObject);
begin
     if CheckBox1.Checked then
        CheckBoxOnlyLim.Checked:=False;
end;

procedure TFormRptTstPod.CheckBoxOnlyLimClick(Sender: TObject);
begin
     if CheckBoxOnlyLim.Checked then
        CheckBox1.Checked:=False;

end;
begin
  CntFormRptTstECB:=0;

end.
