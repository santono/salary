unit UFormRptTstECB1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls,
  Spin, ExtCtrls;

type
  TFormRptTstECB1 = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    frxDotMatrixExportSL: TfrxDotMatrixExport;
    ProgressBar1: TProgressBar;
    frxUserDataSetSl: TfrxUserDataSet;
    LabelPodr: TLabel;
    LabelFIO: TLabel;
    frxReportSL: TfrxReport;
    RadioGroupMode: TRadioGroup;
    WPeriod: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRptTstECB1    : TFormRptTstECB1;
  CntFormRptTstECB1 : integer;


implementation
  uses ScrIo , ScrDef , ScrUtil, ScrLists;

  type  PRecECB=^TRecECB;
        TRecECB = record
                 tabno          : integer;
                 fio            : string;
                 Dolg           : string;
                 ShifrPod       : integer;
                 Comment        : string;
                end;

  var List:TList;
      i_count:integer;
{$R *.dfm}

procedure TFormRptTstECB1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormRptTstECB1>0 then
         Dec(CntFormRptTstECB1);
end;

procedure TFormRptTstECB1.FormCreate(Sender: TObject);
 var i:integer;
begin
      Inc(CntFormRptTstECB1);
      i:=nmes;
      dec(i);
      if i=0 then i:=12;
      WPeriod.Value:=i;
      RadioGroupMode.ItemIndex:=0;

end;

procedure TFormRptTstECB1.Button1Click(Sender: TObject);
 var savnmes,savnsrv:integer;
     i_nsrv  : integer;
     Curr_Person : Person_Ptr;
     Curr_Add    : Add_ptr;
     Curr_Ud     : Ud_ptr;
     RecECB      : PRecECB;
     I           : integer;
     Finded      : boolean;
     WantedPeriod : integer;
     WantedMode   : integer;

  procedure Filter1;
   var Curr_Person:Person_Ptr;
     IsECBUd,IsECBNUd,IsECBIll,IsECBDP:boolean;
     IsECBIllAdd,IsECBDpAdd:boolean;
     Curr_Add : Add_Ptr;
     Curr_Ud  : Ud_Ptr;
   begin
        curr_person:=head_person;
        while (curr_Person<>NIl) do
          begin
               LabelFIO.Caption:=Curr_Person^.Fio;
               Application.ProcessMessages;
               IsECBUd:=false;
               IsECBNUd:=false;
               IsECBIll:=false;
               IsECBDP:=false;
               Curr_Ud:=Curr_Person^.Ud;
               while (Curr_Ud<>Nil) do
                begin
                     if Curr_Ud^.Period=nmes then
                     if Curr_Ud^.Shifr=142 then
                        IsECBUd:=true
                     else
                     if Curr_Ud^.Shifr=143 then
                        IsECBNUd:=true
                     else
                     if Curr_Ud^.Shifr=145 then
                        IsECBIll:=true
                     else
                     if Curr_Ud^.Shifr=146 then
                        IsECBDP:=true;
                     Curr_Ud:=Curr_Ud^.NEXT;
                end;
               IsECBDpAdd:=true;
               if IsECBDp then
               if not dog_pod_podrazd(NSRV) then IsECBDpAdd:=false;
               if IsECBIll then
                  begin
                       IsECBIllAdd:=false;
                       Curr_Add:=Curr_Person^.Add;
                       while (Curr_Add<>Nil) do
                        begin
                             if IsBolnShifr(Curr_Add^.Shifr) then
                                begin
                                     IsECBIllAdd:=true;
                                     break;
                                end;
                             Curr_Add:=Curr_Add^.NEXT;
                        end;
                  end;
               if IsECBUd and IsECBNUd then
                  begin
                       New(RecECB);
                       RecECB^.tabno    := Curr_Person^.TABNO;
                       RecECB^.fio      := Curr_Person^.FIO;
                       RecECB^.Dolg     := Curr_Person^.Dolg;
                       RecECB^.ShifrPod := NSRV;
                       RecECB^.Comment  := 'Два ЕСВ';
                       List.Add(RecECB);
                  end;
               if IsECBIll and not IsECBIllADD then
                  begin
                       New(RecECB);
                       RecECB^.tabno    := Curr_Person^.TABNO;
                       RecECB^.fio      := Curr_Person^.FIO;
                       RecECB^.Dolg     := Curr_Person^.Dolg;
                       RecECB^.ShifrPod := NSRV;
                       RecECB^.Comment  := 'ЕСВ (Б) без нчсл';
                       List.Add(RecECB);
                  end;
               if IsECBDP and not IsECBDPADD then
                  begin
                       New(RecECB);
                       RecECB^.tabno    := Curr_Person^.TABNO;
                       RecECB^.fio      := Curr_Person^.FIO;
                       RecECB^.Dolg     := Curr_Person^.Dolg;
                       RecECB^.ShifrPod := NSRV;
                       RecECB^.Comment  := 'Ош. ЕСВ ЦПХ';
                       List.Add(RecECB);
                  end;
               Curr_Person:=Curr_Person^.NEXT;
          end;
     end;

  procedure FilterIll(WantedPeriod:integer);
   var Curr_Person:Person_Ptr;
     IsECBIllUd   : boolean;
     IsECBIllAdd : boolean;
     Curr_Add : Add_Ptr;
     Curr_Ud  : Ud_Ptr;
   begin
        curr_person:=head_person;
        while (curr_Person<>NIl) do
          begin
               LabelFIO.Caption:=Curr_Person^.Fio;
               Application.ProcessMessages;
               IsECBIllUd:=false;
               Curr_Ud:=Curr_Person^.Ud;
               while (Curr_Ud<>Nil) do
                begin
                     if Curr_Ud^.Period=WantedPeriod then
                     if Curr_Ud^.Shifr=ECBIllShifr then
                        begin
                             IsECBIllUd:=true;
                             break;
                        end;
                     Curr_Ud:=Curr_Ud^.NEXT;
                end;
               IsECBIllAdd:=false;
               Curr_Add:=Curr_Person^.Add;
               while (Curr_Add<>Nil) do
                 begin
                      if IsBolnShifrForECB(Curr_Add^.Shifr) then
                      if (Curr_Add^.Period=WantedPeriod) then
                         begin
                              IsECBIllAdd:=true;
                              break;
                         end;
                      Curr_Add:=Curr_Add^.NEXT;
                  end;
               if not IsECBIllUd and IsECBIllAdd then
                  begin
                       New(RecECB);
                       RecECB^.tabno    := Curr_Person^.TABNO;
                       RecECB^.fio      := Curr_Person^.FIO;
                       RecECB^.Dolg     := Curr_Person^.Dolg;
                       RecECB^.ShifrPod := NSRV;
                       RecECB^.Comment  := 'Нет ЕСВ для болничного';
                       List.Add(RecECB);
                  end;
               if IsECBIllUd and not IsECBIllAdd then
                  begin
                       New(RecECB);
                       RecECB^.tabno    := Curr_Person^.TABNO;
                       RecECB^.fio      := Curr_Person^.FIO;
                       RecECB^.Dolg     := Curr_Person^.Dolg;
                       RecECB^.ShifrPod := NSRV;
                       RecECB^.Comment  := 'Нет суммы больничного для ЕСВ (Б)';
                       List.Add(RecECB);
                  end;
               Curr_Person:=Curr_Person^.NEXT;
          end;
     end;

  procedure FilterOtp(WantedPeriod:integer);
   var Curr_Person:Person_Ptr;
     IsECBUd  : boolean;
     IsECBAdd : boolean;
     Curr_Add : Add_Ptr;
     Curr_Ud  : Ud_Ptr;
   begin
        curr_person:=head_person;
        while (curr_Person<>NIl) do
          begin
               LabelFIO.Caption:=Curr_Person^.Fio;
               Application.ProcessMessages;
               IsECBUd:=false;
               Curr_Ud:=Curr_Person^.Ud;
               while (Curr_Ud<>Nil) do
                begin
                     if Curr_Ud^.Period=WantedPeriod then
                     if (Curr_Ud^.Shifr=ECBShifr) or
                        (Curr_Ud^.Shifr=ECBNShifr) then
                        begin
                             IsECBUd:=true;
                             break;
                        end;
                     Curr_Ud:=Curr_Ud^.NEXT;
                end;
               IsECBAdd:=false;
               Curr_Add:=Curr_Person^.Add;
               while (Curr_Add<>Nil) do
                 begin
                      if IsOtpShifr(Curr_Add^.Shifr) then
                      if (Curr_Add^.Period=WantedPeriod) then
                         begin
                              IsECBAdd:=true;
                              break;
                         end;
                      Curr_Add:=Curr_Add^.NEXT;
                  end;
               if not IsECBUd and IsECBAdd then
                  begin
                       New(RecECB);
                       RecECB^.tabno    := Curr_Person^.TABNO;
                       RecECB^.fio      := Curr_Person^.FIO;
                       RecECB^.Dolg     := Curr_Person^.Dolg;
                       RecECB^.ShifrPod := NSRV;
                       RecECB^.Comment  := 'Нет ЕСВ для отпускного';
                       List.Add(RecECB);
                  end;
               if IsECBUd and not IsECBAdd then
                  begin
                       New(RecECB);
                       RecECB^.tabno    := Curr_Person^.TABNO;
                       RecECB^.fio      := Curr_Person^.FIO;
                       RecECB^.Dolg     := Curr_Person^.Dolg;
                       RecECB^.ShifrPod := NSRV;
                       RecECB^.Comment  := 'Нет суммы отпускного для ЕСВ ';
                       List.Add(RecECB);
                  end;
               Curr_Person:=Curr_Person^.NEXT;
          end;
     end;

  procedure FilterPererasECB(WantedPeriod:integer);
   var Curr_Person:Person_Ptr;
     IsECBUd  : boolean;
     IsECBAdd : boolean;
     Curr_Add : Add_Ptr;
     Curr_Ud  : Ud_Ptr;
   begin
        curr_person:=head_person;
        while (curr_Person<>NIl) do
          begin
               LabelFIO.Caption:=Curr_Person^.Fio;
               Application.ProcessMessages;
               IsECBUd:=false;
               Curr_Ud:=Curr_Person^.Ud;
               while (Curr_Ud<>Nil) do
                begin
                     if Curr_Ud^.Period=WantedPeriod then
                     if (Curr_Ud^.Shifr=ECBShifr) or
                        (Curr_Ud^.Shifr=ECBNShifr) then
                        begin
                             IsECBUd:=true;
                             break;
                        end;
                     Curr_Ud:=Curr_Ud^.NEXT;
                end;
               IsECBAdd:=false;
               Curr_Add:=Curr_Person^.Add;
               while (Curr_Add<>Nil) do
                 begin
                      if not IsOtherPeriodECBShifr(Curr_Add^.Shifr) then
                      if (Curr_Add^.Period=WantedPeriod) then
                         begin
                              IsECBAdd:=true;
                              break;
                         end;
                      Curr_Add:=Curr_Add^.NEXT;
                  end;
               if IsECBUd and IsECBAdd then
                  begin
                       New(RecECB);
                       RecECB^.tabno    := Curr_Person^.TABNO;
                       RecECB^.fio      := Curr_Person^.FIO;
                       RecECB^.Dolg     := Curr_Person^.Dolg;
                       RecECB^.ShifrPod := NSRV;
                       RecECB^.Comment  := 'Неверный период ЕСВ';
                       List.Add(RecECB);
                  end;
{
               if IsECBUd and not IsECBAdd then
                  begin
                       New(RecECB);
                       RecECB^.tabno    := Curr_Person^.TABNO;
                       RecECB^.fio      := Curr_Person^.FIO;
                       RecECB^.Dolg     := Curr_Person^.Dolg;
                       RecECB^.ShifrPod := NSRV;
                       RecECB^.Comment  := 'Нет суммы отпускного для ЕСВ ';
                       List.Add(RecECB);
                  end;
}                  
               Curr_Person:=Curr_Person^.NEXT;
          end;
     end;





begin
     WantedPeriod := WPeriod.Value;
     WantedMode   := RadioGroupMode.ItemIndex+1;

     savnmes := nmes;
     savnsrv := nsrv;
     putinf;
     while (head_person<>nil) do del_person(Head_person);
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     List:=TList.Create;
     for i_nsrv:=1 to count_serv do
         begin
              ProgressBar1.Position:=i_nsrv;
              nsrv:=i_nsrv;
              mkflnm;
              if not FileExists(fninf) then continue;
              LabelPodr.Caption:=Name_Serv(NSRV);
              getinf(true);
              case WantedMode of
                2: FilterIll(WantedPeriod);
                3: FilterOtp(WantedPeriod);
                4: FilterPererasECB(WantedPeriod);
              else
                  Filter1;
              end;
              while (head_person<>nil) do del_person(Head_person);
         end;
     ShowMessage('K-wo '+IntToStr(List.Count));

     if List.Count=0 then
        ShowMessage('Нет сотрудников одновременно с ЕСВ (Н) и ЕСВ')
     else
        begin
             frxUserDataSetSl.RangeEndCount := List.Count;
             frxReportSL.ShowReport;
        end;
     List.Free;
     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);
     Self.Close;
end;

procedure TFormRptTstECB1.frxUserDataSetSlFirst(Sender: TObject);
begin
      i_count:=0;
end;

procedure TFormRptTstECB1.frxUserDataSetSlNext(Sender: TObject);
begin
      inc(i_count);
end;

procedure TFormRptTstECB1.frxUserDataSetSlGetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'tabno')=0 then
        Value:=PRecECB(List.Items[i_count])^.tabno
     else if CompareText(VarName,'fio')=0 then
             Value:=PRecECB(List.Items[i_count])^.fio
     else if CompareText(VarName,'dolg')=0 then
             Value:=PRecECB(List.Items[i_count])^.dolg
     else if CompareText(VarName,'shifrpod')=0 then
             Value:=PRecECB(List.Items[i_count])^.shifrpod
     else if CompareText(VarName,'comment')=0 then
             Value:=PRecECB(List.Items[i_count])^.comment;
end;

procedure TFormRptTstECB1.frxUserDataSetSlCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=List.Count-1 then Eof:=true
      else eof:=false;
end;

procedure TFormRptTstECB1.frxReportSLGetValue(const VarName: String;
  var Value: Variant);
begin
      if CompareText(VarName,'month')=0 then
         Value:=GetMonthRus(nmes)
      else if CompareText(VarName,'year')=0 then
         Value:=CurrYear;
end;
begin
  CntFormRptTstECB1:=0;

end.
