unit UFormRecalcNalPassPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFormRecalcNalPass = class(TForm)
    ProgressBarPrsn: TProgressBar;
    ProgressBarPdr: TProgressBar;
    LabelFio: TLabel;
    LabelCnt: TLabel;
    LabelPdr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    CheckBoxBlock: TCheckBox;
    cbIndex: TCheckBox;
    cbFullYear: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    WantedM,WantedY:Integer;
    procedure RecalcPodr;
  public
    { Public declarations }
  end;

var
  FormRecalcNalPass: TFormRecalcNalPass;

implementation
   uses UFormSelPKG,ScrIO,ScrDEF,ScrNalog,ScrLists,ScrUtil,uFIBModule,
        uFormWait,UORecalcAbon, DateUtils;
{$R *.dfm}



procedure TFormRecalcNalPass.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRecalcNalPass.FormCreate(Sender: TObject);
var M,Y:word;
begin
      LabelFio.Caption:='';
      LabelCnt.Caption:='';
      LabelPdr.Caption:='';
      Caption:='Перерасчет налогов за выбранный месяц';
      M:=NMES;
      y:=CURRYEAR;
      m:=M-1;
      if M=0 then
         begin
              M:=12;
              Y:=Y-1;
         end;
      DateTimePicker1.Date:=EncodeDate(Y,M,1);
      CheckBoxBlock.Checked:=True;
      cbIndex.Checked:=False;
      cbFullYear.Checked:=false;
end;

procedure TFormRecalcNalPass.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;


procedure TFormRecalcNalPass.BitBtn1Click(Sender: TObject);
 var
    nsrvSav,nmesSav:integer;
    i,j,i_nmes:integer;
    ModeBlockSav:boolean;
    WM:Integer;

begin
     WantedM:=MonthOf(DateTimePicker1.Date);
     WantedY:=YearOf(DateTimePicker1.Date);
     if ((WantedM<1) or (WantedM>12)) then
        begin
             ShowMessage('Неверно указана дата');
             Exit;
        end;
     if (WantedY<2011) then
        begin
             ShowMessage('Неверно указана дата');
             Exit;
        end;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

     nsrvSav:=NSRV;
     nmesSav:=NMES;
     ModeBlockSav:=NeedBlockRecalcedNalogi;
     if CheckBoxBlock.Checked then
        NeedBlockRecalcedNalogi:=True
     else
        NeedBlockRecalcedNalogi:=False;
     putinf;
     while (head_person<>nil) do del_Person(head_person);

   //  DeleteCurrDataFromSQl;
//     for WM:=2 to 12 do
//       begin
//          WantedM:=WM;
     Caption:='Перерасчет за '+getMonthRus(WM);
     ProgressBarPdr.Min       :=  0;
     ProgressBarPdr.Max       :=  Count_Serv;
     ProgressBarPdr.Position  :=  0;
     ProgressBarPrsn.Max      := 10;
     ProgressBarPrsn.Min      :=  0;
     ProgressBarPrsn.Position :=  0;
     Application.ProcessMessages;
     OpenLog;
     for i:=1 to Count_Serv do
         begin
              ProgressBarPdr.Position  :=  i;
              nsrv:=i;
              LabelPdr.Caption:=NAME_SERV(NSRV);
              Application.ProcessMessages;
              if not NameServList.IsSelected(NSRV) then continue;
              mkflnm;
              if not Fileexists(fninf) then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              if Pos('ПУСТОЕ',UPPER_STRING(Name_Serv(NSRV)))>0 then Continue;
              if Pos('РЕЗЕРВ',UPPER_STRING(Name_Serv(NSRV)))>0 then Continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              if (cbFullYear.Checked and (nmesSav>1)) then
                 for i_nmes:=1 to nmessav - 1 do
                     begin
                          wantedM:=i_nmes;
                          LabelPdr.Caption:=trim(NAME_SERV(NSRV))+' '+trim(GetMonthUkr(i_nmes));
                          Application.ProcessMessages;
                          RecalcPodr;
                     end

              else
                RecalcPodr;
              Putinf;
              EMPTY_ALL_PERSON;
         end;

     CloseLog;
//         end;
     nmes:=nmesSav;
     nsrv:=nsrvSav;
     NeedBlockRecalcedNalogi:=ModeBlockSav;
     mkflnm;
     getinf(true);
end;

procedure TFormRecalcNalPass.RecalcPodr;
 var
     Curr_Person:person_ptr;
     i,i_person,l1,l2:integer;
     RecalcMode:Integer;
 begin
     if Count_Person<1 then Exit;
     ProgressBarPrsn.Min:=0;
     ProgressBarPrsn.Max:=Count_Person;
     ProgressBarPrsn.Position:=0;
     i:=0;
     i_person:=0;
     Curr_Person:=Head_Person;
     while (Curr_Person<>Nil) do
       begin
            inc(i_person);
            ProgressBarPrsn.Position := i_person;
            LabelFio.Caption      := Curr_Person^.FIO;
            Application.ProcessMessages;
    //        if Curr_Person^.tabno=9112 then
            if (Curr_Person^.Wid_Raboty=OSN_WID_RABOTY) then
            if Curr_Person^.AUTOMATIC=AUTOMATIC_MODE then
               begin
                    if cbIndex.Checked then
                    if Abs(getSummaAddForPersonW(Curr_Person,INDEX_SHIFR,WantedM))<0.01 then
                       begin
                            Curr_Person:=Curr_Person.NEXT;
                            Continue;
                       end;
                    FLAG_NAUD_FOR_OTHER_MONTH:=true;
                    RecalcMode:=0;
                    if Curr_Person^.Tabno=297 then
                       Curr_Person^.Tabno:=297;
                    l1:= COUNT_WANTED_UD_YEAR(Curr_Person,PODOH_SHIFR,WantedM,CURRYEAR);
                    l2:= COUNT_WANTED_UD_YEAR(Curr_Person,PODOH_SHIFR,WantedM,WantedY);
                    if Curr_Person.tabno=2139 then
                       Curr_Person.tabno:=2139;
                    UPDATE_PODOH(Curr_Person,WantedM,WantedY-1990,RecalcMode);
                    l1:= COUNT_WANTED_UD_YEAR(Curr_Person,PODOH_SHIFR,WantedM,CURRYEAR);
                    l2:= COUNT_WANTED_UD_YEAR(Curr_Person,PODOH_SHIFR,WantedM,WantedY);
                    FLAG_NAUD_FOR_OTHER_MONTH:=false;
                    if Curr_Person^.Tabno=11111 then
                       Curr_Person^.Tabno:=11111;

               end;
            Curr_Person:=Curr_Person^.Next;
       end;
end;



end.
