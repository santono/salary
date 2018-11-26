unit UFormRptTstECB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls,
  frxExportTXT, frxExportXLS, frxExportHTML, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, DB, DBClient;

type
  TFormRptTstECB = class(TForm)
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
    frxrprtswod1: TfrxReport;
    frxsrdtst1: TfrxUserDataSet;
    chkExcel: TCheckBox;
    frxrprtswod2: TfrxReport;
    frxsrdtst2: TfrxUserDataSet;
    pFIBQuery: TpFIBQuery;
    pFIBTransaction: TpFIBTransaction;
    CheckBox1: TCheckBox;
    CheckBoxOtherPeriod: TCheckBox;
    CheckBoxOnlyLim: TCheckBox;
    frxUserDataSetPod: TfrxUserDataSet;
    frxReportPod: TfrxReport;
    BitBtn2: TBitBtn;
    cbCurrentMonthOnly: TCheckBox;
    btnWS: TBitBtn;
    cdsWS: TClientDataSet;
    cdsWStabno: TIntegerField;
    cdsWSFIO: TStringField;
    cdsWSDOLG: TStringField;
    cdsWSsummaadd: TFloatField;
    cdsWSsummaud: TFloatField;
    cdsWSsummaerr: TFloatField;
    frxReportWS: TfrxReport;
    frxUserDataSet1: TfrxUserDataSet;
    frxDBDatasetWS: TfrxDBDataset;
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
    procedure frxUserDataSetPodCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxUserDataSetPodFirst(Sender: TObject);
    procedure frxUserDataSetPodGetValue(const VarName: String;
      var Value: Variant);
    procedure frxUserDataSetPodNext(Sender: TObject);
    procedure PerformTest;
    procedure BitBtn2Click(Sender: TObject);
    procedure btnWSClick(Sender: TObject);
    procedure frxReportWSGetValue(const VarName: String;
      var Value: Variant);

  private
    { Private declarations }
    Y,M : integer;
    PodohOnly:Boolean;
    NeedSeparateSwodyByPeriods:Boolean;
    procedure DownLoadToExcel;
    procedure MakeEcbSwod1;
    procedure MakeEcbSwod1ForYM(Y:Integer;M:Integer);
    procedure BuildListYMForSwod;
    procedure PerformTestWS;


  public
    { Public declarations }
  end;

  type  PRecECB=^TRecECB;
        TRecECB = record
                 Y               : Integer;
                 m               : Integer;
                 IsOtp           : Boolean;
                 IsOther         : Boolean;
                 NeedInSwod      : Boolean;
                 tabno           : integer;
                 shifrpod        : Integer;
                 fio             : string;
                 SummaNAdd       : real;
                 SummaNMaxAdd    : real;
                 SummaECBN       : real;
                 SummaECBNRas    : real;
                 SummaECBNRazn   : real;
                 SummaAdd        : real;
                 SummaMaxAdd     : real;
                 SummaECB        : real;
                 SummaECBRas     : real;
                 SummaECBRazn    : real;
                 SummaDPAdd      : real;
                 SummaDPMaxAdd   : real;
                 SummaDPECB      : real;
                 SummaDPECBRas   : real;
                 SummaDPECBRazn  : real;
                 SummaIllAdd     : real;
                 SummaIllMaxAdd  : real;
                 SummaIllECB     : real;
                 SummaIllECBRas  : real;
                 SummaIllECBRazn : real;
                 SummaPodAdd     : Real;
                 SummaPodFakt    : Real;
                 SummaPodRas     : Real;
                 SummaPodRazn    : Real;
                end;
 {
        PRecECBGtLim=^TRecECBGtLim;
        TRecECBGtLim = record
                 Y               : Integer;
                 m               : Integer;
                 tabno           : integer;
                 fio             : string;
                 SummaNAdd       : real;
                 SummaNMaxAdd    : real;
                 SummaECBN       : real;
                 SummaECBNRas    : real;
                 SummaECBNRazn   : real;
                 SummaAdd        : real;
                 SummaMaxAdd     : real;
                 SummaECB        : real;
                 SummaECBRas     : real;
                 SummaECBRazn    : real;
                 SummaDPAdd      : real;
                 SummaDPMaxAdd   : real;
                 SummaDPECB      : real;
                 SummaDPECBRas   : real;
                 SummaDPECBRazn  : real;
                 SummaIllAdd     : real;
                 SummaIllMaxAdd  : real;
                 SummaIllECB     : real;
                 SummaIllECBRas  : real;
                 SummaIllECBRazn : real;
                 SummaPodAdd     : Real;
                 SummaPodFakt    : Real;
                 SummaPodRas     : Real;
                 SummaPodRazn    : Real;
                end;
  }

var
  FormRptTstECB    : TFormRptTstECB;
  CntFormRptTstECB : integer;
  List             : TStringList;
  ListOth          : TStringList;
  ListYMForSwod    : TList;


implementation
  uses ScrIo , ScrDef , ScrUtil , ScrLists , ComOBJ, uFormMkPensList,uFIBmODULE,
       UFormTstECBAddFromSQL,ScrNalog,UORecalcAbon, UFormAnalyzeNalogi;
  type
        PItemYM=^TItemYM;
        TItemYM=record
                 Y:Integer;
                 M:Integer;
                end;

        TEcbRecSwod1=record
                       SummaAddTot     : Real;
                       SummaAddLim     : Real;
                       SummaEcbFakt    : Real;
                       SummaEcbRas     : Real;
                       SummaEcbPereras : Real;
                     end;
        TEcbRecSwod2=record
                       SummaAddTot:Real;
                       SummaAddLim:Real;
                       SummaEcbFakt:Real;
                     end;


  var {List:TStringList;}
      i_count:integer;     
      EcbSwodAlla1:array[1..4] of TEcbRecSwod1;
      EcbSwodAlla2:array[1..4] of TEcbRecSwod2;
{$R *.dfm}

procedure TFormRptTstECB.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormRptTstECB>0 then
         Dec(CntFormRptTstECB);
end;

procedure TFormRptTstECB.FormCreate(Sender: TObject);
begin
      Inc(CntFormRptTstECB);
      NeedSeparateSwodyByPeriods:=false;
      CheckBoxOtherPeriod.Checked:=False;
      CheckBoxOnlyLim.Checked:=False;
      CheckBox1.Checked:=False;
      cbCurrentMonthOnly.Checked:=False;
      PodohOnly:=false;
      if isSVDN then
         begin
              btnWS.Show;
              btnWS.Enabled:=true;
         end
      else
         begin
              btnWS.Hide;
              btnWS.Enabled:=false;
         end;

end;

procedure TFormRptTstECB.Button1Click(Sender: TObject);
 begin
      PodohOnly:=false;
      PerformTest;
 end;

procedure TFormRptTstECB.BitBtn2Click(Sender: TObject);
begin
     PodohOnly:=True;
     PerformTest;
end;
 
procedure TFormRptTstECB.PerformTest;
 type PItem=^TItem;
      TItem=record
             y:Integer;
             m:Integer;
            end;

 var savnmes,savnsrv:integer;
     i_nsrv      : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_ptr;
     Curr_Ud     : Ud_ptr;
     RecECB      : PRecECB;
     I,JIndex,J  : integer;
     Finded      : boolean;
     Dev         : TextFile;
     FName       : string;
     ListYM      : TList;
     Y,M         : Integer;
     LExpr1      : Boolean; {не др мес или г=г и м=м }
     LExpr2      : Boolean;
     SummaAddECBNOth    : real;
     SummaAddECBOth     : Real;
     SummaAddECBDPOth   : Real;
     SummaAddECBIllOth  : Real;
     SummaUdECBNOth     : real;
     SummaUdECBOth      : real;
     SummaUdECBDPOth    : real;
     SummaUdECBIllOth   : real;
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
              if cbCurrentMonthOnly.Checked then
              if not ((y=CURRYEAR) and (m=NMES)) then
                 begin
                      Curr_Add:=Curr_Add.NEXT;
                      Continue;
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
              if ((Curr_Ud^.SHIFR=ECBShifr) or
                  (Curr_Ud^.SHIFR=ECBNShifr) or
                  (Curr_Ud^.SHIFR=ECBIllShifr) or
                  (Curr_Ud^.SHIFR=ECBDpShifr)) then
                  begin
                       y:=Curr_Ud^.Year+1990;
                       m:=Curr_Ud^.Period;
                       if cbCurrentMonthOnly.Checked then
                       if not ((y=CURRYEAR) and (m=NMES)) then
                          begin
                               curr_ud:=curr_ud^.NEXT;
                               Continue;
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
        a:=PRecECB(List.Objects[JIndex]).SummaNAdd;
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
           SummaAdd   ,SummaUd   ,SummaECB   :Real;
           SummaAddOth,SummaUdOth,SummaECBOth:Real;
           SummaAddTot,SummaUdTot,SummaECBTot:Real;
           SummaPodRasTot:Real;
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
                if PRecECB(List.Objects[i]).tabno=Curr_Person^.TABNO then
                   begin
                        SummaAddOth  := 0;
                        SummaUdOth   := 0;
                        SummaECBOth  := 0;
                        y:=PRecECB(List.Objects[i]).Y;
                        m:=PRecECB(List.Objects[i]).M;
                        if (Curr_Person^.tabno=279) and
                            (y=2011) and (m=10) then
                            Curr_Person^.tabno:=279;
                        SummaAdd := PRecECB(List.Objects[i]).SummaPodAdd;
                        SummaUd  := PRecECB(List.Objects[i]).SummaPodFakt;
                        SummaECB := PRecECB(List.Objects[i]).SummaECBRas   +
                                    PRecECB(List.Objects[i]).SummaECBNRas  +
                                    PRecECB(List.Objects[i]).SummaDpECBRas +
                                    PRecECB(List.Objects[i]).SummaIllECBRas;
                        Finded:=ListOth.Find(BuildStrKey(PRecECB(List.Objects[i]).Tabno,
                                                         PRecECB(List.Objects[i]).Y,
                                                         PRecECB(List.Objects[i]).M),IOth);
                        if Finded then
                          begin
                               SummaAddOth := PRecECB(ListOth.Objects[ioth]).SummaPodAdd;
                               SummaUdOth  := PRecECB(ListOth.Objects[ioth]).SummaPodFakt;
                               SummaECBOth := PRecECB(ListOth.Objects[ioth]).SummaECB   +
                                                    PRecECB(ListOth.Objects[ioth]).SummaECBN  +
                                                    PRecECB(ListOth.Objects[ioth]).SummaDPECB +
                                                    PRecECB(ListOth.Objects[ioth]).SummaILLECB;
                          end;
                        SummaAddTot := SummaAdd + SummaAddOth;
                        SummaUdTot  := SummaUd  + SummaUdOth;
                        SummaECBTot := SummaEcb + SummaEcbOth;
                        SummaPodRasTot:=PODOH_2004_2011(SummaAdd+SummaAddOth,SummaECB+SummaECBOth,0,M,Y,Curr_Person);
                        PRecECB(List.Objects[i]).SummaPodRas:=PODOH_2004_2011(SummaAdd+SummaAddOth,SummaECB+SummaECBOth,0,M,Y,Curr_Person)-SummaUdOth;
                        PRecECB(List.Objects[i]).SummaPodRazn:=PRecECB(List.Objects[i]).SummaPodRas-PRecECB(List.Objects[i]).SummaPodFakt;//-SummaUd;
                        if Abs(PRecECB(List.Objects[i]).SummaPodRazn)>0.02  then
                          begin
                               GetResultRecalcPodohPerson(Y,M,Curr_Person,SummaPodAdd,SummaPodUd,SummaPodRas);
                               SummaAddTot := SummaPodAdd ;
                               SummaUdTot  := SummaPodUd  ;
                               SummaPodRasTot := SummaPodRas;
                               PRecECB(List.Objects[i]).SummaPodRas  := SummaPodRasTot - SummaUdOth;
                               PRecECB(List.Objects[i]).SummaPodRazn := SummaPodRasTot - SummaUdTot;//-SummaUd;
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
            //         if not (Curr_Person^.tabno=277) then
            //            begin
            //                 Curr_Person:=Curr_Person^.NEXT;
            //                 continue;
            //            end;
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
                                       New(RecECB);
                                       FillChar(RecECB^,SizeOf(RecECB^),0);
                                       RecECB^.Y   := Y;
                                       RecECB^.M   := M;
                                       RecECB^.IsOtp   := False;
                                       RecECB^.IsOther := False;
                                       RecECB^.NeedInSwod := False;
                                       RecECB^.tabno   := Curr_Person^.TABNO;
                                       RecECB^.fio     := Curr_Person^.FIO;
                                       RecECB^.shifrpod:= NSRV;
                                       RecECB^.SummaNAdd      := 0;
                                       RecECB^.SummaNMaxAdd   := 0;
                                       RecECB^.SummaECBN      := 0;
                                       RecECB^.SummaAdd       := 0;
                                       RecECB^.SummaMaxAdd    := 0;
                                       RecECB^.SummaECB       := 0;
                                       RecECB^.SummaDPAdd     := 0;
                                       RecECB^.SummaDPMaxAdd  := 0;
                                       RecECB^.SummaDPECB     := 0;
                                       RecECB^.SummaIllAdd    := 0;
                                       RecECB^.SummaIllMaxAdd := 0;
                                       RecECB^.SummaIllECB    := 0;
                                       RecECB^.SummaPodAdd    := 0;
                                       RecECB^.SummaPodFakt   := 0;
                                       RecECB^.SummaPodRas    := 0;
                                       RecECB^.SummaPodRazn   := 0;

                                       List.AddObject(BuildStrKey(Curr_Person^.Tabno,y,m),TObject(RecECB));
                                  end;
                               Finded:=List.Find(BuildStrKey(Curr_Person^.Tabno,y,m),JIndex);
                               if Curr_Person^.Wid_raboty=OSN_WID_RABOTY then
                                  PRecECB(List.Objects[JIndex]).shifrpod:=NSRV;
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
                                          if (ShifrList.IsECB(Curr_Add^.Shifr) or ShifrList.IsECBIll(Curr_Add^.Shifr)) then
                                          if (((y=CURRYEAR) and (m=NMES) and LExpr1) or
                                              ((not((y=CURRYEAR) and (m=NMES))) and LExpr2)) then
                                             begin
                                                 if IsOtpShifr(Curr_Add^.Shifr) then
                                                    PRecECB(List.Objects[JIndex]).IsOtp:= True;
                                                 if not IsOtherPeriodECBShifr(Curr_Add^.Shifr) then
                                                    PRecECB(List.Objects[JIndex]).IsOther:= True;
                                                 PRecECB(List.Objects[JIndex]).NeedInSwod:= True;
                                                 if Curr_Person^.Tabno=326 then
                                                    Curr_Person^.Tabno:=326;
                                                 if Dog_Pod_Podrazd(NSRV) then
                                                    PRecECB(List.Objects[JIndex]).SummaDPAdd:=
                                                        PRecECB(List.Objects[JIndex]).SummaDPAdd+Curr_Add^.Summa
                                                 else
                                                 if ShifrList.IsECB(Curr_Add^.Shifr)then
                                                    if IsSciPed(Curr_Person) then
                                                       PRecECB(List.Objects[JIndex]).SummaNAdd:=
                                                        PRecECB(List.Objects[JIndex]).SummaNAdd+Curr_Add^.Summa
                                                    else
                                                       PRecECB(List.Objects[JIndex]).SummaAdd:=
                                                        PRecECB(List.Objects[JIndex]).SummaAdd+Curr_Add^.Summa
                                                 else
                                                 if ShifrList.IsECBIll(Curr_Add^.Shifr)then
                                                    PRecECB(List.Objects[JIndex]).SummaIllAdd:=
                                                        PRecECB(List.Objects[JIndex]).SummaIllAdd+Curr_Add^.Summa;
                                                 PRecECB(List.Objects[JIndex]).SummaPodAdd:=
                                                    PRecECB(List.Objects[JIndex]).SummaNAdd  +
                                                    PRecECB(List.Objects[JIndex]).SummaAdd   +
                                                    PRecECB(List.Objects[JIndex]).SummaDpAdd +
                                                    PRecECB(List.Objects[JIndex]).SummaIllAdd;
                                             end;
                                          Curr_Add:=Curr_Add^.NEXT;
                                     end;
                               Curr_Ud:=Curr_Person^.Ud;
                               while (Curr_Ud<>Nil) do
                                     begin
                                          if ((Curr_Ud^.Period=m) and (Curr_Ud^.Year+1990=Y)) then
                                             begin
                                                  if Curr_Ud^.Shifr=142 then
                                                     PRecECB(List.Objects[JIndex]).SummaECB :=
                                                        PRecECB(List.Objects[JIndex]).SummaECB+Curr_Ud^.Summa
                                                  else
                                                  if Curr_Ud^.Shifr=143 then
                                                     PRecECB(List.Objects[JIndex]).SummaECBN :=
                                                        PRecECB(List.Objects[JIndex]).SummaECBN+Curr_Ud^.Summa
                                                  else
                                                  if Curr_Ud^.Shifr=146 then
                                                     PRecECB(List.Objects[JIndex]).SummaDPECB :=
                                                        PRecECB(List.Objects[JIndex]).SummaDPECB+Curr_Ud^.Summa
                                                  else
                                                  if Curr_Ud^.Shifr=145 then
                                                     PRecECB(List.Objects[JIndex]).SummaIllECB :=
                                                        PRecECB(List.Objects[JIndex]).SummaIllECB+Curr_Ud^.Summa
                                                  else
                                                  if Curr_Ud^.Shifr=Podoh_Shifr then
                                                     PRecECB(List.Objects[JIndex]).SummaPodFakt :=
                                                        PRecECB(List.Objects[JIndex]).SummaPodFakt+Curr_Ud^.Summa;
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
   //          ProgressBar1.Max:=List.Count;
   //          ProgressBar1.Min:=0;
   //          ProgressBar1.Position:=0;
   //          Application.ProcessMessages;
             for i:=0 to List.Count-1 do
                 begin
   //                    ProgressBar1.Position:=i+1;
   //                    Application.ProcessMessages;
                       if PRecECB(List.Objects[i]).Tabno=279 then
                          begin
                               J:=PRecECB(List.Objects[i]).Y;
                               J:=PRecECB(List.Objects[i]).M;
                          end;
                       Finded:=ListOth.Find(BuildStrKey(PRecECB(List.Objects[i]).Tabno,
                                                     PRecECB(List.Objects[i]).Y,
                                                     PRecECB(List.Objects[i]).M),JIndex);
                       if Finded and PRecECB(List.Objects[i]).NeedInSwod then
                          begin
                               SummaAddECBNOth    := PRecECB(ListOth.Objects[JIndex]).SummaNAdd;
                               SummaAddECBOth     := PRecECB(ListOth.Objects[JIndex]).SummaAdd;
                               SummaAddECBDPOth   := PRecECB(ListOth.Objects[JIndex]).SummaDPAdd;
                               SummaAddECBIllOth  := PRecECB(ListOth.Objects[JIndex]).SummaIllAdd;
                               SummaUdECBNOth     := PRecECB(ListOth.Objects[JIndex]).SummaECBN;
                               SummaUdECBOth      := PRecECB(ListOth.Objects[JIndex]).SummaECB;
                               SummaUdECBDPOth    := PRecECB(ListOth.Objects[JIndex]).SummaDPECB;
                               SummaUdECBIllOth   := PRecECB(ListOth.Objects[JIndex]).SummaIllECB;
                          end
                                 else
                          begin
                               SummaAddECBNOth    := 0;
                               SummaAddECBOth     := 0;
                               SummaAddECBDPOth   := 0;
                               SummaAddECBIllOth  := 0;
                               SummaUdECBNOth     := 0;
                               SummaUdECBOth      := 0;
                               SummaUdECBDPOth    := 0;
                               SummaUdECBIllOth   := 0;
                          end;
                       if SummaAddECBNOth>SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M) then
              //            if abs(Abs(SummaUdECBNOth)-abs(LimitForPens)*ECBNProc)<0.01 then
                             begin
                                  PRecECB(List.Objects[i]).SummaNMaxAdd    := 0;
                                  PRecECB(List.Objects[i]).SummaMaxAdd     := 0;
                                  PRecECB(List.Objects[i]).SummaDPMaxAdd   := 0;
                                  PRecECB(List.Objects[i]).SummaILLMaxAdd  := 0;
                             end
              //            else
              //               begin
              //          //          PRecECB(List.Objects[i]).SummaNMaxAdd    := (abs(LimitForPens)*ECBNProc-SummaAddECBNOth)/ECBProc;
              //                    PRecECB(List.Objects[i]).SummaNMaxAdd    := (abs(LimitForPens)*ECBNProc-SummaUdECBNOth)/ECBNProc;
              //                    PRecECB(List.Objects[i]).SummaMaxAdd     := 0;
              //                    PRecECB(List.Objects[i]).SummaDPMaxAdd   := 0;
              //                    PRecECB(List.Objects[i]).SummaILLMaxAdd  := 0;
              //              end
                       else
               //        if (SummaAddECBNOth+PRecECB(List.Objects[i]).SummaNAdd)>LimitForPens then
                       if (SummaAddECBNOth+PRecECB(List.Objects[i]).SummaNAdd)>SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M) then
                          begin
               //                PRecECB(List.Objects[i]).SummaNMaxAdd    := LimitForPens-SummaAddECBNOth;
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M)-SummaAddECBNOth;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := 0;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := 0;
                               PRecECB(List.Objects[i]).SummaILLMaxAdd  := 0;
                          end

                       else
           //            if ( SummaAddECBNOth                    +
           //                 PRecECB(List.Objects[i]).SummaNAdd +
           //                 SummaAddECBOth )>LIMITFORPENS then
                       if ( SummaAddECBNOth                    +
                            PRecECB(List.Objects[i]).SummaNAdd +
                            SummaAddECBOth )>SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M) then
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := SummaAddECBNOth + PRecECB(List.Objects[i]).SummaNAdd;
           //                    PRecECB(List.Objects[i]).SummaMaxAdd     := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M)-PRecECB(List.Objects[i]).SummaNMaxAdd;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := 0;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := 0;
                           end
                       else
            //           if ( SummaAddECBNOth                    +
            //                PRecECB(List.Objects[i]).SummaNAdd +
            //                SummaAddECBOth                     +
            //                PRecECB(List.Objects[i]).SummaAdd)>LIMITFORPENS then
                       if ( SummaAddECBNOth                    +
                            PRecECB(List.Objects[i]).SummaNAdd +
                            SummaAddECBOth                     +
                            PRecECB(List.Objects[i]).SummaAdd)>SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M) then
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := SummaAddECBNOth + PRecECB(List.Objects[i]).SummaNAdd;
           //                    PRecECB(List.Objects[i]).SummaMaxAdd     := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd-SummaAddECBOth;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M)-PRecECB(List.Objects[i]).SummaNMaxAdd-SummaAddECBOth;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := 0;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := 0;
                           end
                       else
           //            if (PRecECB(List.Objects[i]).SummaNAdd+PRecECB(List.Objects[i]).SummaAdd+PRecECB(List.Objects[i]).SummaDPAdd)>LimitForPens then
                       if (PRecECB(List.Objects[i]).SummaNAdd+PRecECB(List.Objects[i]).SummaAdd+PRecECB(List.Objects[i]).SummaDPAdd)>SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M) then
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := PRecECB(List.Objects[i]).SummaAdd;
             //                  PRecECB(List.Objects[i]).SummaDPMaxAdd   := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd-PRecECB(List.Objects[i]).SummaMaxAdd;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M)-PRecECB(List.Objects[i]).SummaNMaxAdd-PRecECB(List.Objects[i]).SummaMaxAdd;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := 0;
                           end
                       else
         //              if (PRecECB(List.Objects[i]).SummaNAdd+PRecECB(List.Objects[i]).SummaAdd+PRecECB(List.Objects[i]).SummaDPAdd+PRecECB(List.Objects[i]).SummaIllAdd)>LimitForPens then
                       if (PRecECB(List.Objects[i]).SummaNAdd+PRecECB(List.Objects[i]).SummaAdd+PRecECB(List.Objects[i]).SummaDPAdd+PRecECB(List.Objects[i]).SummaIllAdd)>SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M) then
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := PRecECB(List.Objects[i]).SummaAdd;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := PRecECB(List.Objects[i]).SummaDPAdd;
         //                      PRecECB(List.Objects[i]).SummaIllMaxAdd  := LimitForPens-PRecECB(List.Objects[i]).SummaNMaxAdd
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := SSLimityList.GetLimitForECB(PRecECB(List.Objects[i]).Y,PRecECB(List.Objects[i]).M)-PRecECB(List.Objects[i]).SummaNMaxAdd
                                                                                       -PRecECB(List.Objects[i]).SummaMaxAdd
                                                                                       -PRecECB(List.Objects[i]).SummaDPMaxAdd;
                           end
                       else
                           begin
                               PRecECB(List.Objects[i]).SummaNMaxAdd    := PRecECB(List.Objects[i]).SummaNAdd;
                               PRecECB(List.Objects[i]).SummaMaxAdd     := PRecECB(List.Objects[i]).SummaAdd;
                               PRecECB(List.Objects[i]).SummaDPMaxAdd   := PRecECB(List.Objects[i]).SummaDPAdd;
                               PRecECB(List.Objects[i]).SummaIllMaxAdd  := PRecECB(List.Objects[i]).SummaIllAdd;
                           end;
                     //  FormAnalyzeNalogi:=TFormAnalyzeNalogi.Create(Nil);
                     //  FormAnalyzeNalogi.YearVy:=PRecECB(List.Objects[i]).Y;
                     //  FormAnalyzeNalogi.MonthVy:=PRecECB(List.Objects[i]).M;
                     //  FormAnalyzeNalogi.Tabno := PRecECB(List.Objects[i]).tabno;
{
                       FormAnalyzeNalogi:=TFormAnalyzeNalogi.CreateDB(nil,
                                                             PRecECB(List.Objects[i]).tabno,
                                                             PRecECB(List.Objects[i]).Y,
                                                             PRecECB(List.Objects[i]).M,
                                                              Nil);
                       FormAnalyzeNalogi.OpenDataSets;
                       FormAnalyzeNalogi.CalculatePodoh;
 }
                       PRecECB(List.Objects[i]).SummaECBNRas    := r10(PRecECB(List.Objects[i]).SummaNMaxAdd*ECBNProc);
                       PRecECB(List.Objects[i]).SummaECBNRazn   := PRecECB(List.Objects[i]).SummaECBNRas-PRecECB(List.Objects[i]).SummaECBN;
                       PRecECB(List.Objects[i]).SummaECBRas     := r10(PRecECB(List.Objects[i]).SummaMaxAdd*ECBProc);
                       PRecECB(List.Objects[i]).SummaECBRazn    := PRecECB(List.Objects[i]).SummaECBRas-PRecECB(List.Objects[i]).SummaECB;
                       PRecECB(List.Objects[i]).SummaDPECBRas   := r10(PRecECB(List.Objects[i]).SummaDPMaxAdd*ECBDPProc);
                       PRecECB(List.Objects[i]).SummaDPECBRazn  := PRecECB(List.Objects[i]).SummaDPECBRas-PRecECB(List.Objects[i]).SummaDPECB;;
                       PRecECB(List.Objects[i]).SummaIllECBRas  := r10(PRecECB(List.Objects[i]).SummaIllMaxAdd*ECBIllProc);;
                       PRecECB(List.Objects[i]).SummaIllECBRazn := PRecECB(List.Objects[i]).SummaIllECBRas-PRecECB(List.Objects[i]).SummaIllECB;
{
                       PRecECB(List.Objects[i]).SummaECBNRas    := r10(FormAnalyzeNalogi.SummaUdECBNRas);
                       PRecECB(List.Objects[i]).SummaECBNRazn   := FormAnalyzeNalogi.SummaUdECBNRazn;
                       PRecECB(List.Objects[i]).SummaECBRas     := r10(FormAnalyzeNalogi.SummaUdECBRas);
                       PRecECB(List.Objects[i]).SummaECBRazn    := FormAnalyzeNalogi.SummaUdECBRazn;
                       PRecECB(List.Objects[i]).SummaDPECBRas   := r10(FormAnalyzeNalogi.SummaUdECBDpRas );
                       PRecECB(List.Objects[i]).SummaDPECBRazn  := FormAnalyzeNalogi.SummaUdECBDpRazn;
                       PRecECB(List.Objects[i]).SummaIllECBRas  := r10(FormAnalyzeNalogi.SummaUdECBIll);
                       PRecECB(List.Objects[i]).SummaIllECBRazn := FormAnalyzeNalogi.SummaUdECBIllRazn;
                       FormAnalyzeNalogi.Free;
}
                 end;

             CalcPodohForAllPersonInList;

             if not PodohOnly then
                begin
                      if chkExcel.Checked then DownLoadToExcel;
                      ListYMForSwod:=TList.Create;
                      BuildListYMForSwod;
                      MakeEcbSwod1;
                      repeat
                           Finded:=false;
                           if List.Count=0 then break;
                           for i:=0 to List.Count-1 do
                               begin
                                   if abs(abs(r10(PRecECB(List.Objects[i]).SummaNMaxAdd*0.061))-abs(r10(PRecECB(List.Objects[i]).SummaECBN)))>0.05 then Continue;
                                   if abs(abs(r10(PRecECB(List.Objects[i]).SummaMaxAdd*0.036))-abs(r10(PRecECB(List.Objects[i]).SummaECB)))>0.05 then Continue;
                                   if abs(abs(r10(PRecECB(List.Objects[i]).SummaDPMaxAdd*0.026))-abs(r10(PRecECB(List.Objects[i]).SummaDPECB)))>0.05 then Continue;
                                   if abs(abs(r10(PRecECB(List.Objects[i]).SummaIllMaxAdd*0.02))-abs(r10(PRecECB(List.Objects[i]).SummaIllECB)))>0.05 then Continue;
                                   if abs(r10(PRecECB(List.Objects[i]).SummaPodRazn))<0.05 then Continue;
                                   Finded:=true;
                                   List.Delete(i);
                                   break;
                               end;
                      until not Finded;
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
                           writeln(dev,PRecECB(List.Objects[i]).Tabno:5,' ',PRecECB(List.Objects[i]).Y:4,' ',PRecECB(List.Objects[i]).M:2);
                       CloseFile(dev);
                end
            else
                begin
                    repeat
                         Finded:=false;
                         if List.Count=0 then break;
                         for i:=0 to List.Count-1 do
                             begin
                                 if abs(r10(PRecECB(List.Objects[i]).SummaPodRazn))>0.005 then Continue;
                                 if abs(abs(r10(PRecECB(List.Objects[i]).SummaPodFakt))-abs(r10(PRecECB(List.Objects[i]).SummaPodRas)))>0.005 then Continue;
                                 if (abs(r10(PRecECB(List.Objects[i]).SummaPodAdd))>0.005) and
                                    ((abs(r10(PRecECB(List.Objects[i]).SummaPodFakt))<0.005) or
                                     (abs(r10(PRecECB(List.Objects[i]).SummaPodRas))<0.005)) then
                                    Continue;
                                 Finded:=true;
                                 List.Delete(i);
                                 break;
                             end;
                    until not Finded;
                    if List.Count>0 then
                       begin
                            frxUserDataSetPod.RangeEndCount := List.Count;
                            frxReportPod.ShowReport;
                       end
                    else
                       ShowMessage('Нет несоответствий расчета налога с дохода');
                end;

        end;
     if Assigned(List) then
    // if List.Count>0 then
    //    for i:=0 to List.Count-1 do
    //        List.Objects[i].Free;
     List.Free;
     if ListOth<>Nil then
        begin
   //          if ListOth.Count>0 then
   //             for i:=0 to ListOth.Count-1 do
   //                 ListOth.Objects[i].Free;
             ListOth.Free;
        end;
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

procedure TFormRptTstECB.DownLoadToExcel;
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
              if (abs(PRecECB(List.Objects[i]).SummaNAdd)<0.005)      and
                 (abs(PRecECB(List.Objects[i]).SummaAdd)<0.005)       and
                 (abs(PRecECB(List.Objects[i]).SummaDPAdd)<0.005)     and
                 (abs(PRecECB(List.Objects[i]).SummaIllAdd)<0.005)    and
                 (abs(PRecECB(List.Objects[i]).SummaNMaxAdd)<0.005)   and
                 (abs(PRecECB(List.Objects[i]).SummaMaxAdd)<0.005)    and
                 (abs(PRecECB(List.Objects[i]).SummaDPMaxAdd)<0.005)  and
                 (abs(PRecECB(List.Objects[i]).SummaIllMaxAdd)<0.005) and
                 (abs(PRecECB(List.Objects[i]).SummaECBN)<0.005)      and
                 (abs(PRecECB(List.Objects[i]).SummaECB)<0.005)       and
                 (abs(PRecECB(List.Objects[i]).SummaDPECB)<0.005)     and
                 (abs(PRecECB(List.Objects[i]).SummaIllECB)<0.005)    then
                 continue;
              if PRecECB(List.Objects[i]).tabno=1453 then
                 j:=i;
              if NeedOnlyProblem and not NeedLimitOnly then
              if (Abs(PRecECB(List.Objects[i]).SummaECBNRazn)<0.015)  and
                 (Abs(PRecECB(List.Objects[i]).SummaECBRazn)<0.015)   and
                 (Abs(PRecECB(List.Objects[i]).SummaDpECBRazn)<0.015) and
                 (Abs(PRecECB(List.Objects[i]).SummaIllECBRazn)<0.015) then
                 Continue;
              if not NeedOnlyProblem and NeedLimitOnly then
              if (Abs(Abs(PRecECB(List.Objects[i]).SummaNAdd)    - Abs(PRecECB(List.Objects[i]).SummaNMaxAdd))   <0.015 )  and
                 (Abs(Abs(PRecECB(List.Objects[i]).SummaAdd)     - Abs(PRecECB(List.Objects[i]).SummaMaxAdd))    <0.015 )  and
                 (Abs(Abs(PRecECB(List.Objects[i]).SummaIllAdd)  - Abs(PRecECB(List.Objects[i]).SummaIllMaxAdd)) <0.015 )  and
                 (Abs(Abs(PRecECB(List.Objects[i]).SummaDPAdd)   - Abs(PRecECB(List.Objects[i]).SummaDPMaxAdd))  <0.015 )  then
                 Continue;
              Inc(ExRow);
              Inc(LineNo);
              ExCol:=0;
              Inc(ExCol);
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,1]:=LineNo;
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,2]:=PRecECB(List.Objects[i]).tabno;
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,3]:=PRecECB(List.Objects[i]).ShifrPod;
              s:=PRecECB(List.Objects[i]).Fio;
              if not PRecECB(List.Objects[i]).NeedInSwod then
                 S:=Trim(s)+'-прт';
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,4]:=S;
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,5]:=PRecECB(List.Objects[i]).Y;
              V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,6]:=PRecECB(List.Objects[i]).M;
              if (abs(PRecECB(List.Objects[i]).SummaNAdd)>0.005) or
                 (abs(PRecECB(List.Objects[i]).SummaNMaxAdd)>0.005) or
                 (abs(PRecECB(List.Objects[i]).SummaECBN)>0.005) then
                 begin
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,7]:=PRecECB(List.Objects[i]).SummaNAdd;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,8]:=PRecECB(List.Objects[i]).SummaNMaxAdd;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,9]:=PRecECB(List.Objects[i]).SummaECBN;
                      SummaRas:=PRecECB(List.Objects[i]).SummaECBNRas;
                      SummaRazn:=PRecECB(List.Objects[i]).SummaECBNRazn;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,10]:=SummaRas;
                      if (abs(SummaRazn)>0.015) then
                          V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,11]:=SummaRazn;
                 end;
              if (abs(PRecECB(List.Objects[i]).SummaAdd)>0.005) or
                 (abs(PRecECB(List.Objects[i]).SummaMaxAdd)>0.005) or
                 (abs(PRecECB(List.Objects[i]).SummaECB)>0.005) then
                 begin
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,12]:=PRecECB(List.Objects[i]).SummaAdd;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,13]:=PRecECB(List.Objects[i]).SummaMaxAdd;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,14]:=PRecECB(List.Objects[i]).SummaECB;
                      SummaRas:=PRecECB(List.Objects[i]).SummaECBRas;
                      SummaRazn:=PRecECB(List.Objects[i]).SummaECBRazn;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,15]:=SummaRas;
                      if (abs(SummaRazn)>0.015) then
                          V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,16]:=SummaRazn;
                 end;
              if (abs(PRecECB(List.Objects[i]).SummaDPAdd)>0.005) or
                 (abs(PRecECB(List.Objects[i]).SummaDPMaxAdd)>0.005) or
                 (abs(PRecECB(List.Objects[i]).SummaDPECB)>0.005) then
                 begin
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,17]:=PRecECB(List.Objects[i]).SummaDPAdd;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,18]:=PRecECB(List.Objects[i]).SummaDPMaxAdd;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,19]:=PRecECB(List.Objects[i]).SummaDPECB;
                      SummaRas  := PRecECB(List.Objects[i]).SummaDPECBRas;
                      SummaRazn := PRecECB(List.Objects[i]).SummaDPECBRazn;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,20]:=SummaRas;
                      if (abs(SummaRazn)>0.015) then
                         V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,21]:=SummaRazn;
                 end;
              if (abs(PRecECB(List.Objects[i]).SummaIllAdd)>0.005) or
                 (abs(PRecECB(List.Objects[i]).SummaIllMaxAdd)>0.005) or
                 (abs(PRecECB(List.Objects[i]).SummaIllECB)>0.005) then
                 begin
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,22]:=PRecECB(List.Objects[i]).SummaIllAdd;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,23]:=PRecECB(List.Objects[i]).SummaIllMaxAdd;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,24]:=PRecECB(List.Objects[i]).SummaIllECB;
                      SummaRas  := PRecECB(List.Objects[i]).SummaILLECBRas;
                      SummaRazn := PRecECB(List.Objects[i]).SummaIllECBRazn;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,25]:=SummaRas;
                      if (abs(SummaRazn)>0.015) then
                         V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,26]:=SummaRazn;
                 end;
              if (abs(PRecECB(List.Objects[i]).SummaPodAdd)>0.005) or
                 (abs(PRecECB(List.Objects[i]).SummaPodFakt)>0.005) or
                 (abs(PRecECB(List.Objects[i]).SummaPodRas)>0.005) then
                 begin
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,27]:=PRecECB(List.Objects[i]).SummaPodAdd;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,28]:=PRecECB(List.Objects[i]).SummaPodFakt;
                      SummaRas  := PRecECB(List.Objects[i]).SummaPodRas;
                      SummaRazn := PRecECB(List.Objects[i]).SummaPodRazn;
                      V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,29]:=SummaRas;
                      if (abs(SummaRazn)>0.015) then
                         V.WorkBooks[1].WorkSheets[SheetName].Cells[ExRow,30]:=SummaRazn;
                 end;
         end;
 end;


procedure TFormRptTstECB.frxUserDataSetSlFirst(Sender: TObject);
begin
      i_count:=0;
end;

procedure TFormRptTstECB.frxUserDataSetSlNext(Sender: TObject);
begin
      inc(i_count);
end;

procedure TFormRptTstECB.frxUserDataSetSlGetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'tabno')=0 then
        Value:=PRecECB(List.Objects[i_count])^.tabno
     else if CompareText(VarName,'fio')=0 then
             Value:=PRecECB(List.Objects[i_count])^.fio
     else if CompareText(VarName,'summanadd')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaNAdd
     else if CompareText(VarName,'summanmaxadd')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaNMaxAdd
     else if CompareText(VarName,'summanecb')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaECBN
     else if CompareText(VarName,'summaadd')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaAdd
     else if CompareText(VarName,'summamaxadd')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaMaxAdd
     else if CompareText(VarName,'summaecb')=0 then
             Value:=PRecECB(List.Objects[i_count])^.summaecb
     else if CompareText(VarName,'summadpadd')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaDPAdd
     else if CompareText(VarName,'summadpmaxadd')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaDpMaxAdd
     else if CompareText(VarName,'summadpecb')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaDPECB
     else if CompareText(VarName,'summailladd')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaillAdd
     else if CompareText(VarName,'summaillmaxadd')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaillMaxAdd
     else if CompareText(VarName,'summaillecb')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaillECB;
end;

procedure TFormRptTstECB.frxUserDataSetSlCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=List.Count-1 then Eof:=true
      else eof:=false;
end;

procedure TFormRptTstECB.frxReportSLGetValue(const VarName: String;
  var Value: Variant);
begin
      if CompareText(VarName,'month')=0 then
         Value:=GetMonthRus(nmes)
      else if CompareText(VarName,'year')=0 then
         Value:=CurrYear;
end;

procedure TFormRptTstECB.MakeEcbSwod1;
 var I,Y,M:Integer;
 begin
      MAKEPENSLIST(2);
      if NeedSeparateSwodyByPeriods then
         for i:=0 to ListYMForSwod.Count-1 do
             begin
                  Y:=PItemYM(ListYMForSwod.Items[i]).Y;
                  M:=PItemYM(ListYMForSwod.Items[i]).M;
                  MakeEcbSwod1ForYM(Y,M);
             end;
      Y:=0;
      M:=0;
      MakeEcbSwod1ForYM(Y,M);
      for i:=0 to PensionerList.Count-1 do
          Dispose(PPensionerRec(PensionerList.Items[i]));
      PensionerList.Free;
 end;
procedure TFormRptTstECB.MakeEcbSwod1ForYM(Y:Integer;M:integer);
 var I:Integer;
     S:string;
 begin
      Self.Y:=Y;
      Self.M:=M;
      for i:=1 to 4 do
          begin
               EcbSwodAlla1[i].SummaAddTot := 0;
               EcbSwodAlla1[i].SummaAddLim := 0;
               EcbSwodAlla1[i].SummaEcbFakt:= 0;
               EcbSwodAlla1[i].SummaEcbRas := 0;
               EcbSwodAlla1[i].SummaEcbPereras := 0;
               EcbSwodAlla2[i].SummaAddTot := 0;
               EcbSwodAlla2[i].SummaAddLim := 0;
               EcbSwodAlla2[i].SummaEcbFakt:= 0;
          end;
      if List.Count>0 then
         begin
            for i:=0 to List.Count-1 do
                if (((PRecECB(List.Objects[i]).Y=Y) or (Y=0))  and
                    ((PRecECB(List.Objects[i]).M=M) or (M=0))) then
                begin
                     if PRecECB(List.Objects[i]).NeedInSwod then
                        begin
                             if Abs(abs(PRecECB(List.Objects[i]).SummaNAdd)-abs(PRecECB(List.Objects[i]).SummaNMaxAdd))>0.1 then
                                S:=PRecECB(List.Objects[i]).fio;
                             EcbSwodAlla1[1].SummaAddTot :=EcbSwodAlla1[1].SummaAddTot  + PRecECB(List.Objects[i]).SummaNAdd;
                             EcbSwodAlla1[1].SummaAddLim :=EcbSwodAlla1[1].SummaAddLim  + PRecECB(List.Objects[i]).SummaNMaxAdd;
                             EcbSwodAlla1[1].SummaEcbFakt:=EcbSwodAlla1[1].SummaEcbFakt + PRecECB(List.Objects[i]).SummaECBN;
              //       EcbSwodAlla1[1].SummaAddLim :=EcbSwodAlla1[1].SummaEcbFakt / ECBNProc;

                             EcbSwodAlla1[1].SummaEcbRas :=EcbSwodAlla1[1].SummaEcbRas  + PRecECB(List.Objects[i]).SummaECBNRas;

                             EcbSwodAlla1[2].SummaAddTot :=EcbSwodAlla1[2].SummaAddTot  + PRecECB(List.Objects[i]).SummaAdd;
                             EcbSwodAlla1[2].SummaAddLim :=EcbSwodAlla1[2].SummaAddLim  + PRecECB(List.Objects[i]).SummaMaxAdd;
                             EcbSwodAlla1[2].SummaEcbFakt:=EcbSwodAlla1[2].SummaEcbFakt + PRecECB(List.Objects[i]).SummaECB;
             //        EcbSwodAlla1[2].SummaAddLim :=EcbSwodAlla1[2].SummaEcbFakt / ECBProc;

                             EcbSwodAlla1[2].SummaEcbRas :=EcbSwodAlla1[2].SummaEcbRas  + PRecECB(List.Objects[i]).SummaECBRas;
                             EcbSwodAlla1[3].SummaAddTot :=EcbSwodAlla1[3].SummaAddTot  + PRecECB(List.Objects[i]).SummaDpAdd;
                             EcbSwodAlla1[3].SummaAddLim :=EcbSwodAlla1[3].SummaAddLim  + PRecECB(List.Objects[i]).SummaDpMaxAdd;
                             EcbSwodAlla1[3].SummaEcbFakt:=EcbSwodAlla1[3].SummaEcbFakt + PRecECB(List.Objects[i]).SummaDpECB;
             //        EcbSwodAlla1[3].SummaAddLim :=EcbSwodAlla1[3].SummaEcbFakt / ECBDpProc;

                             EcbSwodAlla1[3].SummaEcbRas :=EcbSwodAlla1[3].SummaEcbRas  + PRecECB(List.Objects[i]).SummaDpECBRas;
                             EcbSwodAlla1[4].SummaAddTot :=EcbSwodAlla1[4].SummaAddTot  + PRecECB(List.Objects[i]).SummaIllAdd;
                             EcbSwodAlla1[4].SummaAddLim :=EcbSwodAlla1[4].SummaAddLim  + PRecECB(List.Objects[i]).SummaIllMaxAdd;
                             EcbSwodAlla1[4].SummaEcbFakt:=EcbSwodAlla1[4].SummaEcbFakt + PRecECB(List.Objects[i]).SummaIllECB;
             //        EcbSwodAlla1[4].SummaAddLim :=EcbSwodAlla1[4].SummaEcbFakt / ECBIllProc;

                             EcbSwodAlla1[4].SummaEcbRas :=EcbSwodAlla1[4].SummaEcbRas   + PRecECB(List.Objects[i]).SummaIllECBRas;



                             EcbSwodAlla2[2].SummaAddTot  :=EcbSwodAlla2[2].SummaAddTot  + PRecECB(List.Objects[i]).SummaDpAdd;
                             EcbSwodAlla2[2].SummaAddLim  :=EcbSwodAlla2[2].SummaAddLim  + PRecECB(List.Objects[i]).SummaDpMaxAdd;
                             EcbSwodAlla2[2].SummaEcbFakt :=EcbSwodAlla2[2].SummaEcbFakt + PRecECB(List.Objects[i]).SummaDpEcb;
   // Было                   EcbSwodAlla2[3].SummaAddTot  :=EcbSwodAlla2[3].SummaAddTot  + PRecECB(List.Objects[i]).SummaIllAdd;
   //  до                    EcbSwodAlla2[3].SummaAddLim  :=EcbSwodAlla2[3].SummaAddLim  + PRecECB(List.Objects[i]).SummaIllMaxAdd;
   //   16 03 2014           EcbSwodAlla2[3].SummaEcbFakt :=EcbSwodAlla2[3].SummaEcbFakt + PRecECB(List.Objects[i]).SummaIllEcb;
                             if PensionerList.IsPensioner(PRecECB(List.Objects[i]).tabno) then
                                begin
                                     // Инвалидские больничные теперь относить к инвалидат
                                     EcbSwodAlla2[4].SummaAddTot  :=EcbSwodAlla2[4].SummaAddTot  + PRecECB(List.Objects[i]).SummaIllAdd;
                                     EcbSwodAlla2[4].SummaAddLim  :=EcbSwodAlla2[4].SummaAddLim  + PRecECB(List.Objects[i]).SummaIllMaxAdd;
                                     EcbSwodAlla2[4].SummaEcbFakt :=EcbSwodAlla2[4].SummaEcbFakt + PRecECB(List.Objects[i]).SummaIllEcb;

                                     EcbSwodAlla2[4].SummaAddTot  :=EcbSwodAlla2[4].SummaAddTot  + PRecECB(List.Objects[i]).SummaNAdd    + PRecECB(List.Objects[i]).SummaAdd;
                                     EcbSwodAlla2[4].SummaAddLim  :=EcbSwodAlla2[4].SummaAddLim  + PRecECB(List.Objects[i]).SummaNMaxAdd + PRecECB(List.Objects[i]).SummaMaxAdd;
                                     EcbSwodAlla2[4].SummaEcbFakt :=EcbSwodAlla2[4].SummaEcbFakt + PRecECB(List.Objects[i]).SummaEcbN    + PRecECB(List.Objects[i]).SummaEcb; ;
                                end
                             else
                                begin
                                     // Обычные больничные - обычным людям
                                     EcbSwodAlla2[3].SummaAddTot  := EcbSwodAlla2[3].SummaAddTot  + PRecECB(List.Objects[i]).SummaIllAdd;
                                     EcbSwodAlla2[3].SummaAddLim  := EcbSwodAlla2[3].SummaAddLim  + PRecECB(List.Objects[i]).SummaIllMaxAdd;
                                     EcbSwodAlla2[3].SummaEcbFakt := EcbSwodAlla2[3].SummaEcbFakt + PRecECB(List.Objects[i]).SummaIllEcb;

                                     EcbSwodAlla2[1].SummaAddTot  := EcbSwodAlla2[1].SummaAddTot  + PRecECB(List.Objects[i]).SummaNAdd    + PRecECB(List.Objects[i]).SummaAdd;
                                     EcbSwodAlla2[1].SummaAddLim  := EcbSwodAlla2[1].SummaAddLim  + PRecECB(List.Objects[i]).SummaNMaxAdd + PRecECB(List.Objects[i]).SummaMaxAdd;
                                     EcbSwodAlla2[1].SummaEcbFakt := EcbSwodAlla2[1].SummaEcbFakt + PRecECB(List.Objects[i]).SummaEcbN    + PRecECB(List.Objects[i]).SummaEcb; ;
                                end;
                        end
                     else
                        begin
                             EcbSwodAlla1[1].SummaEcbPereras :=EcbSwodAlla1[1].SummaEcbPereras  + PRecECB(List.Objects[i]).SummaECBN;
                             EcbSwodAlla1[2].SummaEcbPereras :=EcbSwodAlla1[2].SummaEcbPereras  + PRecECB(List.Objects[i]).SummaECB;
                             EcbSwodAlla1[3].SummaEcbPereras :=EcbSwodAlla1[3].SummaEcbPereras  + PRecECB(List.Objects[i]).SummaDpECB;
                             EcbSwodAlla1[4].SummaEcbPereras :=EcbSwodAlla1[4].SummaEcbPereras  + PRecECB(List.Objects[i]).SummaIllECB;
                        end;


                 end;
             frxsrdtst1.RangeEndCount := 4;
             frxrprtswod1.ShowReport;
             frxsrdtst2.RangeEndCount := 4;
             frxrprtswod2.ShowReport;
         end;


 end;
procedure TFormRptTstECB.frxsrdtst1GetValue(const VarName: String;
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




procedure TFormRptTstECB.frxsrdtst1CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=5 then Eof:=true
      else Eof:=false;
end;

procedure TFormRptTstECB.frxsrdtst1Next(Sender: TObject);
begin
     Inc(i_count);
end;

procedure TFormRptTstECB.frxsrdtst1First(Sender: TObject);
begin
     i_count:=1;
end;

procedure TFormRptTstECB.frxrprtswod1GetValue(const VarName: String;
  var Value: Variant);
  var i:Integer;
begin
     if VarName='DATAZA' then
        if Self.M=0 then
           Value:='Итого'
        else
           Value:='за '+GetMonthRus(Self.M)+' '+IntToStr(Self.Y)+' г.';

end;

procedure TFormRptTstECB.frxsrdtst2CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=5 then Eof:=true
      else Eof:=false;
end;
procedure TFormRptTstECB.frxsrdtst2First(Sender: TObject);
begin
      i_count:=1;
end;
procedure TFormRptTstECB.frxsrdtst2Next(Sender: TObject);
begin
      Inc(i_count);
end;
procedure TFormRptTstECB.frxsrdtst2GetValue(const VarName: String;
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

procedure TFormRptTstECB.BuildListYMForSwod;
  var  Finded   : Boolean;
       Y,M,I,J  : Integer;
       ItemYM   : PItemYM;
   begin
        if not Assigned(List) then Exit;
        if List.Count<=0 then Exit;
        for i:=0 to List.Count-1 do
            begin
                 y:=PRecECB(List.Objects[i]).Y;
                 m:=PRecECB(List.Objects[i]).M;
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




procedure TFormRptTstECB.frxrprtswod2GetValue(const VarName: String;
  var Value: Variant);
begin
     if VarName='DATAZA' then
     if Self.M=0 then
        Value:='Итого'
     else
        Value:='за '+GetMonthRus(Self.M)+' '+IntToStr(Self.Y)+' г.';
end;

procedure TFormRptTstECB.CheckBox1Click(Sender: TObject);
begin
     if CheckBox1.Checked then
        CheckBoxOnlyLim.Checked:=False;
end;

procedure TFormRptTstECB.CheckBoxOnlyLimClick(Sender: TObject);
begin
     if CheckBoxOnlyLim.Checked then
        CheckBox1.Checked:=False;

end;

procedure TFormRptTstECB.frxUserDataSetPodCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=List.Count-1 then Eof:=true
      else eof:=false;
end;

procedure TFormRptTstECB.frxUserDataSetPodFirst(Sender: TObject);
begin
      i_count:=0;
end;

procedure TFormRptTstECB.frxUserDataSetPodGetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'Tabno')=0 then
        Value:=PRecECB(List.Objects[i_count])^.tabno
     else if CompareText(VarName,'FIO')=0 then
             Value:=PRecECB(List.Objects[i_count])^.fio
     else if CompareText(VarName,'SummaPodAdd')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaPodAdd
     else if CompareText(VarName,'SummaPodFakt')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaPodFakt
     else if CompareText(VarName,'SummaPodRas')=0 then
             Value:=PRecECB(List.Objects[i_count])^.SummaPodRas
     else if CompareText(VarName,'SummaPodRazn')=0 then
             Value:=R10(PRecECB(List.Objects[i_count])^.SummaPodRazn)
     else if CompareText(VarName,'Y')=0 then
             Value:=PRecECB(List.Objects[i_count])^.Y
     else if CompareText(VarName,'M')=0 then
             Value:=PRecECB(List.Objects[i_count])^.M
     else if CompareText(VarName,'Podr')=0 then
             Value:=PRecECB(List.Objects[i_count])^.ShifrPod;

end;

procedure TFormRptTstECB.frxUserDataSetPodNext(Sender: TObject);
begin
      inc(i_count);

end;



procedure TFormRptTstECB.btnWSClick(Sender: TObject);
begin
     PerformTestWS;
end;
procedure TFormRptTstECB.PerformTestWS;
 var savnmes,savnsrv:integer;
     curr_person:person_ptr;
     curr_add:add_ptr;
     curr_ud:ud_ptr;
     i_nsrv:integer;
     summaadd:real;
     summaud:real;
     countErr:integer;
 begin
     if not isSVDN then Exit;
     savnmes := nmes;
     savnsrv := nsrv;
     putinf;
     empty_all_person;
     Application.ProcessMessages;
     List:=TStringList.Create;
     List.Sorted:=true;
     List.Capacity:=6000;
     ProgressBar1.max:=count_serv*2;
     ProgressBar1.min:=0;
     ProgressBar1.Position:=0;
     cdsWS.Open;
     countErr:=0;
     for i_nsrv:=1 to count_serv do
         begin
//              if i_nsrv<>87 then continue;
              ProgressBar1.Position:=i_nsrv;
              LabelPodr.Caption:=name_serv(i_nsrv);
              Application.ProcessMessages;
              nsrv:=i_nsrv;
              mkflnm;
              if not FileExists(fninf) then continue;
              if nsrv=106 then continue; // с материальной помощи есв не берется
              LabelPodr.Caption:=Name_Serv(NSRV);
              getinf(true);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                     LabelFio.Caption:=Curr_Person^.FIO;
                     summaadd:=0;
                     summaud:=0;
                     Curr_Add:=Curr_Person^.Add;
                     while (Curr_Add<>Nil) do
                       begin
                            if ((curr_add^.shifr<>31) //мат помощь
                                and
                                (curr_add^.shifr<>32)) then//Декретный больничный
                                summaadd:=summaadd+r10(curr_add^.summa);
                            Curr_Add:=Curr_Add^.NEXT;
                       end;
                     Curr_Ud:=Curr_Person^.Ud;
                     while (Curr_Ud<>Nil) do
                        begin
                            if (curr_ud^.shifr=WAR_SBOR_SHIFR) then
                                summaud:=summaud+r10(curr_ud^.summa);
                            Curr_Ud:=Curr_Ud^.NEXT;
                        end;
                     if abs(abs(summaadd)*0.015-abs(summaud))>0.01 then
                        begin
                              inc(countErr);
                              cdsWS.Append;
                              cdsWStabno.Value:=curr_person^.TABNO;
                              cdsWsFio.Value:=Curr_Person^.FIO;
                              cdsWSDOLG.Value:=curr_person^.DOLG;
                              cdsWSsummaadd.value:=summaadd;
                              cdsWSsummaud.value:=summaud;
                              cdsWSsummaerr.value:=abs(summaadd)*0.015-abs(summaud);
                              cdsWS.Post;
                        end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              EMPTY_ALL_PERSON;
         end;
     if (countErr<1)  then
         showMessage('Ошибок расчета не обнаружено')
     else
       begin
            frxReportWS.ShowReport;
       end;
     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);
     Self.Close;

 end;

procedure TFormRptTstECB.frxReportWSGetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(ansiUpperCase(varName),'M')=0 then
        value:=getMonthUkr(nmes)
     else
     if CompareText(ansiUpperCase(varName),'Y')=0 then
        value:=IntToStr(CURRYEAR);
end;
begin
  CntFormRptTstECB:=0;

end.
