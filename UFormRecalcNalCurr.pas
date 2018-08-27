{$WARNINGS OFF}
{$HINTS OFF}
unit UFormRecalcNalCurr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TFormRecalcNalCurr = class(TForm)
    ProgressBarPrsn: TProgressBar;
    ProgressBarPdr: TProgressBar;
    LabelFio: TLabel;
    LabelCnt: TLabel;
    LabelPdr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    CheckBoxTN: TCheckBox;
    RadioGroupMode: TRadioGroup;
    LabelMon: TLabel;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    NeedListTN:boolean;
    wantedShifrPKG:integer;
    function IsTabnoInList(Tabno:integer):boolean;
    function GetRecForTabnoInList(Tabno:integer):Pointer;
    procedure RecalcPodr;
    procedure InitListTN;

  public
    procedure setWantedPKG(noPKG:integer);
    { Public declarations }
  end;

var
  FormRecalcNalCurr: TFormRecalcNalCurr;

implementation
   uses UFormSelPKG,ScrIO,ScrDEF,ScrNalog,ScrLists,ScrUtil,uFIBModule,
        uFormWait,UORecalcAbon;
{$R *.dfm}

  type  PRecTN=^TRecTN;
        TRecTN = record
                    tabno          : integer;
                    ListYM         : TList;
                 end;
        PRecYM=^TRecYM;
        TRecYM = record
                    Y : integer;
                    M : integer;
                 end;
        TRecalcPersonMode=(AllPersonMode,OsnPersonMode,SwmPersonMode);

  var List:TList;
      RecalcPersonMode:TRecalcPersonMode;

procedure TFormRecalcNalCurr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      List.Free;
      Action:=caFree;
end;

procedure TFormRecalcNalCurr.FormCreate(Sender: TObject);
begin
      LabelFio.Caption:='';
      LabelCnt.Caption:='';
      LabelPdr.Caption:='';
      Caption:='Перерасчет налогов за '+GetMonthRus(NMES);
      NeedListTN:=false;
      CheckBoxTN.Checked:=false;
      List:=TList.Create;
      RadioGroupMode.ItemIndex:=0;
      RecalcPersonMode:=AllPersonMode;
      wantedShifrPKG:=66;
end;

procedure TFormRecalcNalCurr.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;


procedure TFormRecalcNalCurr.BitBtn1Click(Sender: TObject);
 var
    nsrvSav,nmesSav:integer;
    i,j:integer;

    procedure DeleteCurrDataFromSQl;
     var SQLStmnt : string;
     begin
          if FIB.pFIBQuery.Transaction.Active then
             FIB.pFIBQuery.Transaction.COMMIT;
          if NOT FIB.pFIBQuery.Transaction.Active then
             FIB.pFIBQuery.Transaction.StartTransaction;
          FIB.pFIBQuery.SQL.Clear;
          SQLStmnt := 'delete from person where yearvy='+IntToStr(CurrYear)+' and monthvy='+IntToStr(NMES);
          FIB.pFIBQuery.SQL.ADD(SQLStmnt);
          try
             FormWait.Show;
             FIB.pFIBQuery.ExecQuery;
             FormWait.Hide;
          except
          end;
          if FIB.pFIBQuery.Transaction.Active then
             FIB.pFIBQuery.Transaction.COMMIT;
     end;

begin
     if (NMES<>Flow_Month) then
        begin
             ShowMessage('Перерасчет возможен только в текущем месяце.');
             Exit;
        end;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

     nsrvSav:=NSRV;
     nmesSav:=NMES;
     putinf;
     EMPTY_ALL_PERSON;
     NeedListTN := false;
     if CheckBoxTn.Checked then NeedListTN:=true;
     if NeedListTN then InitListTN;

     case RadioGroupMode.ItemIndex of
       1 : RecalcPersonMode:=OsnPersonMode;
       2 : RecalcPersonMode:=SwmPersonMode;
       else
           RecalcPersonMode:=AllPersonMode;
     end;
   //  DeleteCurrDataFromSQl;
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
              if not Fileexists(fninf)   then continue;
              if STORONNEE_PODRAZD(nsrv) then continue;
              if RECENZENT_PODRAZD(nsrv) then continue;
              NameServList.ClearSelected(NSRV);
              GETINF(TRUE);
              RecalcPodr;
              Putinf;
              empty_all_person;
         end;
     CloseLog;
     if NeedListTN then
     if List<>Nil then
        begin
             if List.Count>0 then
                for i:=0 to List.Count-1 do
                    begin
                         if PRecTN(List.Items[i]).ListYM<>nil then
                            begin
                                 if PRecTN(List.Items[i]).ListYM.Count>0 then
                                    for j:=0 to PRecTN(List.Items[i]).ListYM.Count-1 do
                                        Dispose(PRecYM(PRecTN(List.Items[i]).ListYM.Items[j]));
                                 PRecTN(List.Items[i]).ListYM.Free;
                            end;
                         Dispose(PRecTN(List.Items[i]));
                    end;
             List.Clear;
        end;
     nmes:=nmesSav;
     nsrv:=nsrvSav;
     mkflnm;
     getinf(true);
end;

procedure TFormRecalcNalCurr.RecalcPodr;
 var
     Curr_Person:person_ptr;
     i,i_person:integer;
     Rec:PRecTN;
     RecYM:PRecYM;
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
    //           ProgressBarPrsn.Position := i;
            if Curr_Person^.Tabno=10933 then
               Curr_Person^.Tabno:=10933;
            if (RecalcPersonMode=AllPersonMode) or
               ((IS_OSN_W_R_FOR_NALOG_RECALC(Curr_Person)) and
                (RecalcPersonMode=OsnPersonMode)) or
               ((not IS_OSN_W_R_FOR_NALOG_RECALC(Curr_Person)) and
                (RecalcPersonMode=SwmPersonMode)) then
            if (not NeedListTN) or
               (NeedListTN and IsTabnoInList(Curr_Person^.TABNO)) then
            if Curr_Person^.AUTOMATIC=AUTOMATIC_MODE then
               begin
                    LabelMon.Caption:=GetMonthRus(NMes);
                    Application.ProcessMessages;
                    if RecalcPersonMode=SwmPersonMode then RecalcMode:=1
                                                      else RecalcMode:=0;
                    if Curr_Person^.Tabno=1282 then
                       Curr_Person^.Tabno:=1282;
                    Calc_Naud(I_Person,31,RecalcMode);
                    if ((NeedListTN) and IsTabnoInList(Curr_Person^.TABNO)) then
                       begin
                            Rec:=PRecTN(GetRecForTabnoInList(Curr_Person^.TABNO));
                            if Rec<>nil then
                            if Rec.ListYM.Count>0 then
                               for i:=0 to Rec.ListYM.Count-1 do
                                   if ((PRecYM(Rec.ListYM.Items[i]).Y<>CURRYEAR) or (PRecYM(Rec.ListYM.Items[i]).M<>NMES))  then
                                      begin
                                           LabelMon.Caption:=GetMonthRus(PRecYM(Rec.ListYM.Items[i]).M);
                                           Application.ProcessMessages;
                                           FLAG_NAUD_FOR_OTHER_MONTH:=true;
                                           UPDATE_PODOH(Curr_Person,PRecYM(Rec.ListYM.Items[i]).M,PRecYM(Rec.ListYM.Items[i]).Y-1990,RecalcMode);
                                           FLAG_NAUD_FOR_OTHER_MONTH:=false;
                                      end;
                       end;

               end;
            Curr_Person:=Curr_Person^.Next;
       end;
end;


procedure TFormRecalcNalCurr.InitListTN;
 var FName:string;
     Dev:TextFile;
     tn:integer;
     rec:PRecTN;
     recYM:PRecYM;
     i:Integer;
     finded:Boolean;
     y,m : Integer;
 begin
     FName:=CDOC+'NeedTN.txt';
     if not FileExists(FName) then Exit;
     AssignFile(dev,FName);
     Reset(Dev);
     while not eof(dev) do
      begin
           readln(dev,tn,y,m);
           finded:=false;
           if List.Count>0 then
              for i:=0 to List.Count-1 do
                  if PRecTN(List.Items[i]).tabno=tn then
                     begin
                           finded:=True;
                           Rec:=PRecTN(List.Items[i]);
                           Break;
                     end;
           if not finded then
              begin
                   new(rec);
                   Rec^.tabno:=tn;
                   Rec^.ListYM:=TList.Create;
         //  ldkb;sldknb;sdlkfnb;sdkfjb
                   List.Add(Rec);
              end;
           New(RecYM);
           recYM.Y:=Y;
           recYM.M:=m;
           Rec^.ListYM.Add(RecYM);

      end;
     CloseFile(Dev);
 end;

function TFormRecalcNalCurr.IsTabnoInList(Tabno:integer):boolean;
  var i:integer;
 begin
{
      if Tabno=7622 then
         begin
               Result:=true;
               Exit;
         end
      else
         begin
               Result:=false;
               Exit;
         end;
}
      Result:=false;
      if List.Count>0 then
         begin
              for i:=0 to List.Count-1 do
                  if PRecTN(List.Items[i])^.tabno=tabno then
                     begin
                          Result:=true;
                          Exit;
                     end;
         end;
 end;

function TFormRecalcNalCurr.GetRecForTabnoInList(Tabno:integer):Pointer;
 var i:integer;
 begin
{
      if Tabno=7622 then
         begin
               Result:=true;
               Exit;
         end
      else
         begin
               Result:=false;
               Exit;
         end;
}
      Result:=Nil;
      if List.Count>0 then
         begin
              for i:=0 to List.Count-1 do
                  if PRecTN(List.Items[i])^.tabno=tabno then
                     begin
                          Result:=PRecTN(List.Items[i]);
                          Exit;
                     end;
         end;
 end;

procedure TFormRecalcNalCurr.BitBtn4Click(Sender: TObject);


begin
    markPKG66(wantedShifrPKG);
    RadioGroupMode.ItemIndex := 2;
    BitBtn1Click(Sender);
//    markPodrs66;
//    markKat66;
//    markGru66;
    markPKG66(wantedShifrPKG);
    RadioGroupMode.ItemIndex := 1;
    Application.ProcessMessages;
    BitBtn1Click(Sender);
    if not needHideGenerMessages then
       ShowMessage('Перерасчет налогов закончен.');
end;

procedure TFormRecalcNalCurr.setWantedPKG(noPKG:integer);
  begin
       wantedShifrPKG:=noPKG;
  end;

end.
