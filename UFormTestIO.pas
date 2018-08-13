unit UFormTestIO;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit;

type
  TFormTestIO = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    cxNmbOfStep: TcxSpinEdit;
    cxDelayVal: TcxSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cxWantedNSRV: TcxSpinEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    NmbOfSteps:Integer;
    DelayVal:Integer;
    WantedNSRV:Integer;
    { Private declarations }
    procedure performTest;
  public
    { Public declarations }
  end;

var
  FormTestIO: TFormTestIO;

implementation
  uses scrdef,ScrIo,scrutil,scrnalog;

{$R *.dfm}

procedure TFormTestIO.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormTestIO.FormCreate(Sender: TObject);
begin
     self.NmbOfSteps    := 100;
     Self.DelayVal      := 1000;
     wantedNSRV         := 57;
     cxNmbOfStep.Value  := self.NmbOfSteps;
     cxDelayVal.Value   := Self.DelayVal;
     cxWantedNSRV.Value := wantedNSRV;
     Label1.Caption:='';

end;

procedure TFormTestIO.BitBtn1Click(Sender: TObject);
begin
     PerformTest;
end;

procedure TFormTestIO.PerformTest;
 var i,j:Integer;
     NSRVTmp:Integer;
     Curr_Person:PERSON_PTR;
     Curr_Add:Add_PTR;
     StartNSRV,EndNSRV:Integer;
 begin
      NSRVTmp               := NSRV;
      wantedNSRV            := cxWantedNSRV.Value;
      NmbOfSteps            := cxNmbOfStep.Value ;
      DelayVal              := cxDelayVal.Value  ;
      NSRV                  := WantedNSRV;
      Label1.Caption        := '';
      ProgressBar1.Min      := 0;
      ProgressBar1.Max      := NmbOfSteps;
      ProgressBar1.Position :=0 ;
      PUTINF;
      while (HEAD_PERSON<>Nil) do DEL_PERSON(head_person);
      MKFLNM;
      StartNSRV:=1;
      EndNSRV:=179;
      nsrv:=StartNSRV;
      for i:=1 to NmbOfSteps do
         begin
              Label1.Caption:='Выполняется шаг '+IntToStr(i)+' из '+IntToStr(NmbOfSteps);
              ProgressBar1.Position:=i;
              Application.ProcessMessages;
              for j:=1 to 100 do
                  begin
                       NSRV:=Random(EndNsrv);
                       if (NSRV<1) then nsrv:=8;
                       MKFLNM;
                       if FileExists(FNINF) then
                          begin
                       GETINF(TRUE);
                       while (Curr_Person<>nil) do
                         begin
                              MAKE_ADD(Curr_Add,Curr_Person);
                              Curr_Add.shifr:=PerersZaProshlPeriody;
                              Curr_Add.PERIOD:=10;
                              Curr_Add.YEAR:=2014-1990;
                              Curr_Add.SUMMA:=1000;
                              Curr_Add.FZP:=curr_Add.SUMMA;
                              Curr_Add.WHO:=117;
                              Calc_Naud_Person(Curr_Person,31);
                              FLAG_NAUD_FOR_OTHER_MONTH:=True;
                              UPDATE_PODOH(Curr_Person,10,2014);
                              FLAG_NAUD_FOR_OTHER_MONTH:=false;
                              curr_Add:=Curr_Person.ADD;
                              while (Curr_Add<>nil) do
                               begin
                                    if ((Curr_Add.Shifr=PerersZaProshlPeriody) and
                                      (curr_Add.WHO=117)) then
                                      begin
                                           DEL_ADD(Curr_Add,Curr_Person);
                                           Break;
                                      end;
                                    Curr_Add:=Curr_Add.next;
                               end;
                              FLAG_NAUD_FOR_OTHER_MONTH:=True;
                              UPDATE_PODOH(Curr_Person,10,2014);
                              FLAG_NAUD_FOR_OTHER_MONTH:=false;
                              Calc_Naud_Person(Curr_Person,31);
                              Curr_Person:=Curr_Person.NEXT;
                         end;
                       PUTINF;
                       while (HEAD_PERSON<>Nil) do DEL_PERSON(head_person);
                          end;
                       Inc(NSRV);
                       if (NSRV>EndNSRV) then
                          NSRV:=StartNSRV;
                  end;
              DelayPascal(DelayVal);
         end;
      Label1.Caption:='Тест завершен';
      Application.ProcessMessages;
      NSRV:=NSRVTmp;
      MKFLNM;
      GETINF(true);
 end;



end.
