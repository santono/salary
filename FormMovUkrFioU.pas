unit FormMovUkrFioU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormMovUkrFIO = class(TForm)
    DateTimePickerFr: TDateTimePicker;
    Label1: TLabel;
    DateTimePickerTo: TDateTimePicker;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabelPodr: TLabel;
    LabelFio: TLabel;
    ProgressBar2: TProgressBar;
    LabelMonth: TLabel;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMovUkrFIO: TFormMovUkrFIO;

implementation
 uses KadClU,ScrUtil,ScrDef,ScrIo,DateUtils;
 var
     KadryClarion:TKadryClarion;


{$R *.dfm}

procedure TFormMovUkrFIO.FormClose(Sender: TObject;
  var Action: TCloseAction);
 var i:integer;
     KadryRec:PKadryRec;
begin
     if Assigned(KadryList) then
        begin
             if KadryList.Count>0 then
                begin
                     for i:=0 to KadryList.Count-1 do
                         begin
                               KadryRec:=KadryList.Items[i];
                               Dispose(KadryRec);
                         end;
                end;
             KadryList.Free;
        end;
      Action:=caFree;
end;

procedure TFormMovUkrFIO.FormCreate(Sender: TObject);
begin
     KadryClarion:=TKadryClarion.Create('CKADRY.DAT');
     if Assigned(KadryClarion) then
        begin
             KadryClarion.FillKadryList;
             KadryClarion.Free;
        end;
      DateTimePickerFr.Date:=Date;
      DateTimePickerTo.Date:=Date;
end;

procedure TFormMovUkrFIO.BitBtn1Click(Sender: TObject);
 var
    NMES_Tmp,NSRV_Tmp:integer;
    I_Month,I_NSRV:integer;
    CurrData:TDate;
    I:integer;
    KadryRec:PKadryRec;
    Curr_Person:Person_Ptr;
begin
    If DateTimePickerFr.Date>DateTimePickerTo.Date then
       begin
            ShowMessage('Неверно заданы даты');
            Exit;
       end;
    If YearOf(DateTimePickerFr.Date)<>YearOf(DateTimePickerTo.Date) then
       begin
            ShowMessage('Неверно заданы даты');
            Exit;
       end;
    NMES_Tmp:=NMES;
    NSRV_Tmp:=NSRV;
    PUTINF;
    LDEL_PERSON;
    ProgressBar1.Min:=1;
    ProgressBar1.Max:=Count_Serv;
    ProgressBar1.Position:=0;
    ProgressBar1.Step:=1;
    ProgressBar2.Min:=1;
    ProgressBar2.Max:=12;
    ProgressBar2.Position:=0;
    CurrData:=DateTimePickerFr.Date;
    for I_Month:=1 to 12 do
        begin
             ProgressBar2.Position:=ProgressBar2.Position+1;
             LabelMonth.Caption:=GetMonthRus(I_Month);
             Application.ProcessMessages;
             if (I_Month<MonthOf(DateTimePickerFr.Date)) or
                (I_Month>MonthOf(DateTimePickerTo.Date)) then
             continue;
             for I_NSRV:=1 to Count_Serv do
                 begin
                      ProgressBar1.StepIt;
                      LabelPodr.Caption:=NAME_SERV(I_NSRV);
                      LabelFIO.Caption:='';
                      Application.ProcessMessages;
                      NMES := I_Month;
                      NSRV := I_NSRV;
                      MKFLNM;
                      if not FileExists(FNINF) then continue;
                      getinf(true);
                      Curr_Person:=Head_Person;
                      while Curr_Person<>Nil do
                            begin
                                 LabelFIO.Caption:=Curr_Person^.Fio;
                                 Application.ProcessMessages;
                                 for i:=0 to KadryList.Count-1 do
                                     if PKadryRec(KadryList.Items[i]).Tabno=Curr_Person^.Tabno then
                                        begin
                                             Curr_person^.Fio:=trim(Short_Fio(PKadryRec(KadryList.Items[i]).FIO));
                                             if Curr_Person^.Tabno=5874 then
                                                Curr_Person^.Tabno:=Curr_Person^.Tabno;
                                             IF (Length(Trim(Curr_Person^.NAL_CODE))<>10) and
                                                (Length(trim(PKadryRec(KadryList.Items[i]).NalCode))=10) then
                                                Curr_Person^.NAL_CODE:=trim(PKadryRec(KadryList.Items[i]).NalCode);
                                             Break;
                                        end;
                                 Curr_Person:=Curr_Person^.Next;
                            end;
                      putinf;
                      ldel_person;
                 end;
        end;
    NMES := NMES_Tmp;
    NSRV := NSRV_Tmp;
    MkFlnm;
    GetInf(True);
end;

procedure TFormMovUkrFIO.BitBtn3Click(Sender: TObject);
 var
    NMES_Tmp,NSRV_Tmp:integer;
    I_Month,I_NSRV:integer;
    I:integer;
begin
    NMES_Tmp:=NMES;
    NSRV_Tmp:=NSRV;
    PUTINF;
    LDEL_PERSON;
    ProgressBar1.Min:=1;
    ProgressBar1.Max:=Count_Serv;
    ProgressBar1.Position:=0;
    ProgressBar1.Step:=1;
    ProgressBar2.Min:=1;
    ProgressBar2.Max:=12;
    ProgressBar2.Position:=0;
    for I_Month:=11 to 11 do
        begin
             ProgressBar2.Position:=ProgressBar2.Position+1;
             LabelMonth.Caption:=GetMonthRus(I_Month);
             Application.ProcessMessages;
{
             if (I_Month<MonthOf(DateTimePickerFr.Date)) or
                (I_Month>MonthOf(DateTimePickerTo.Date)) then
             continue;
}             
             for I_NSRV:=1 to Count_Serv do
                 begin
                      ProgressBar1.StepIt;
                      LabelPodr.Caption:=NAME_SERV(I_NSRV);
                      LabelFIO.Caption:='';
                      Application.ProcessMessages;
                      NMES := I_Month;
                      NSRV := I_NSRV;
                      MKFLNM;
                      if not FileExists(FNINF) then continue;
                      getinf(true);
                      putinf;
                      ldel_person;
                 end;
        end;
    NMES := NMES_Tmp;
    NSRV := NSRV_Tmp;
    MkFlnm;
    GetInf(True);

end;

end.
