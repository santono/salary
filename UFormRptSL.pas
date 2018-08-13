{$WARNINGS OFF}
{$HINTS OFF}
unit UFormRptSL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls;

type
  TFormRptSL = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    frxDotMatrixExportSL: TfrxDotMatrixExport;
    ProgressBar1: TProgressBar;
    frxUserDataSetSl: TfrxUserDataSet;
    frxReportSL: TfrxReport;
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
  FormRptSL    : TFormRptSL;
  CntFormRptSL : integer;

implementation
  uses ScrIo , ScrDef , ScrUtil;

  type  PRecSl=^TRecSl;
        TRecSL = record
                 tabno   : integer;
                 fio     : string;
                 dolg    : string;
                 w_place : integer;
                 summa   : real;
                end;

  var List:TList;
      i_count:integer;
{$R *.dfm}

procedure TFormRptSL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormRptSL>0 then
         Dec(CntFormRptSL);
end;

procedure TFormRptSL.FormCreate(Sender: TObject);
begin
      Inc(CntFormRptSL);
end;

procedure TFormRptSL.Button1Click(Sender: TObject);
 var savnmes,savnsrv:integer;
     i_nsrv  : integer;
     Curr_Person : Person_Ptr;
     Curr_Cn : Cn_ptr;
     RecSl   : PRecSl;
begin
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
              getinf(true);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                     Curr_Cn:=Curr_Person^.CN;
                     while (Curr_Cn<>Nil) do
                       begin
                            if Curr_Cn^.Shifr=LgotyPN2004Shifr+Limit_Cn_Base then
                               begin
                                    New(RecSl);
                                    RecSl^.tabno   := Curr_Person^.TABNO;
                                    RecSl^.fio     := Curr_Person^.FIO;
                                    RecSl^.Dolg    := Curr_Person^.Dolg;
                                    RecSl^.w_place := NSRV;
                                    RecSl^.summa   := Curr_Cn^.SUMMA;
                                    List.Add(RecSl);
                               end;
                            Curr_Cn:=Curr_Cn^.Next;
                       end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              while (head_person<>nil) do del_person(Head_person);
         end;
     if List.Count>0 then
        begin
         //    frxUserDataSetSl.RangeBegin := rbFirst;
         //    frxUserDataSetSl.RangeEnd   := rbLast;
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

procedure TFormRptSL.frxUserDataSetSlFirst(Sender: TObject);
begin
      i_count:=0;
end;

procedure TFormRptSL.frxUserDataSetSlNext(Sender: TObject);
begin
      inc(i_count);
end;

procedure TFormRptSL.frxUserDataSetSlGetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'tabno')=0 then
        Value:=PRecSL(List.Items[i_count])^.tabno
     else if CompareText(VarName,'fio')=0 then
             Value:=PRecSL(List.Items[i_count])^.fio
     else if CompareText(VarName,'dolg')=0 then
             Value:=PRecSL(List.Items[i_count])^.dolg
     else if CompareText(VarName,'w_place')=0 then
             Value:=PRecSL(List.Items[i_count])^.w_place
     else if CompareText(VarName,'summa')=0 then
             Value:=PRecSL(List.Items[i_count])^.summa;
end;

procedure TFormRptSL.frxUserDataSetSlCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>=List.Count-1 then Eof:=true
      else eof:=false;
end;

procedure TFormRptSL.frxReportSLGetValue(const VarName: String;
  var Value: Variant);
begin
      if CompareText(VarName,'month')=0 then
         Value:=GetMonthRus(nmes)
      else if CompareText(VarName,'year')=0 then
         Value:=CurrYear;
end;
begin
  CntFormRptSL:=0;

end.
