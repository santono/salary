unit UFormRepSowmInOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls, DBClient;

type
  TFormRepSowmInOut = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsoREP: TDataSource;
    pFIBdsRep: TpFIBDataSet;
    pFIBTrRepRead: TpFIBTransaction;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    pFIBdsRepTABNO: TFIBIntegerField;
    pFIBdsRepFIO: TFIBStringField;
    pFIBdsRepSHIFRPOD: TFIBIntegerField;
    pFIBdsRepNAMEPOD: TFIBStringField;
    pFIBdsRepSUMMA: TFIBBCDField;
    dtIn: TDateTimePicker;
    Label2: TLabel;
    rgMode: TRadioGroup;
    pFIBdsRepNAMEKIND: TFIBStringField;
    cbSummy: TCheckBox;
    BitBtn3: TBitBtn;
    ProgressBar1: TProgressBar;
    cdsSwm: TClientDataSet;
    cdsSwmtabno: TIntegerField;
    cdsSwmfio: TStringField;
    cdsSwmsumma: TFloatField;
    cdsSwmshifrpod: TIntegerField;
    cdsSwmnamepod: TStringField;
    frxReport2: TfrxReport;
    frxDBDatasetCDS: TfrxDBDataset;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtn3Click(Sender: TObject);
    procedure frxReport2GetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
    procedure CreateReport;
    procedure makeList;

  public
    { Public declarations }
  end;

var
  FormRepSowmInOut: TFormRepSowmInOut;

implementation
  uses
      uFIBModule,scRdEF,UFormWait,ScrUtil,DateUtils,ScrIo,ScrLists;
{$R *.dfm}

type PRec=^TRec;
     TRec=record
           tabno:Integer;
           fio:string;
           shifrPod:Integer;
           need:boolean;
           summa:Real;
          end;

var list:TList;

procedure TFormRepSowmInOut.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepSowmInOut.FormCreate(Sender: TObject);
begin
     rgMode.ItemIndex := 0;
     dtIn.Date        := IncMonth(Date,-1);
end;

procedure TFormRepSowmInOut.BitBtn1Click(Sender: TObject);
begin
     if YesNo('Отчет создается из БД.'+^M+' Если данные перенесены в БД создавайте отчет. Создать отчет из БД?') then
        begin
             CreateReport;
             Close;
        end;
end;
procedure TFormRepSowmInOut.CreateReport;
  begin
       if pFIBdsRep.Active then
          pFIBdsRep.Close;
       if pFIBdsRep.Transaction.Active then
          pFIBdsRep.Transaction.Commit;
       pFIBdsRep.Transaction.StartTransaction;
       pFIBdsRep.Params[0].AsInteger := YearOf(dtIn.Date);
       pFIBdsRep.Params[1].AsInteger := monthOf(dtIn.Date);
       pFIBdsRep.Params[2].AsInteger := rgMode.ItemIndex + 1;
       if cbSummy.Checked then
          pFIBdsRep.Params[3].AsInteger := 1
       else
          pFIBdsRep.Params[3].AsInteger := 0;
       FormWait.Show;
       Application.ProcessMessages;
       pFIBdsRep.Open;
       FormWait.Hide;
       Application.ProcessMessages;
       frxReport1.ShowReport;
       pFIBdsRep.Close;
       pFIBdsRep.Transaction.Commit;

  end;

procedure TFormRepSowmInOut.frxReport1GetValue(const VarName: String;
  var Value: Variant);

begin                                
     if Trim(VarName)='Year' then
        Value:=IntToStr(YearOf(dtIn.Date))
     else
     if Trim(VarName)='Month' then
        Value:=GetMonthRus(MonthOf(dtIn.Date))
     else
     if Trim(VarName)='Mode' then
        if rgMode.ItemIndex=1 then
           Value:='внутренние'
        else
           Value:='внешние';
end;

procedure TFormRepSowmInOut.makeList;
 var NMESTmp,NSRVTmp:Integer;
     i_NSRV,i:Integer;
     Curr_Person:PERSON_PTR;
     summa:Real;
    function isValidDolg:boolean;
      const ld=10;
      const invalidDolg:array[1..ld] of Integer =(4,5,6,7,8,9,1500,1510,1520,1530);
      var retVal:Boolean;
          i:Integer;
          shifrDol:Integer;
      begin
           retVal:=True;
           shifrDol:=GET_DOL_CODE(curr_person);
           for i:=1 to ld do
              if (shifrDol=invalidDolg[i]) then
                 begin
                      retVal:=False;
                      Break;
                 end;
           isValidDolg:=retVal;
      end;

    procedure markSelected;
     const len_e=17;
     const epodr:ARRAY[1..Len_e] of integer= (76,79,81,82,85,86,89,91,102,105,106,121,140,156,157,158,165);
     var i:Integer;
     begin
          for i:=1 to Count_Serv do
              nameservlist.SetSelected(i);
          for i:=1 to len_e do
              nameservlist.ClearSelected(epodr[i]);

     end;
    procedure addPersonToList;
     var vPRec:PRec;
         finded:boolean;
         i:Integer;
     begin
          finded:=false;
          if list.Count>0 then
             for i:=0 to list.Count-1 do
                 if PRec(list.Items[i])^.tabno=curr_person^.TABNO then
                    begin
                         PRec(list.Items[i])^.summa:=PRec(list.Items[i])^.summa+summa;
                         finded:=True;
                         Break;
                    end;
          if not finded then
             begin
                  New(vPRec);
                  vPRec.tabno:=curr_person^.TABNO;
                  vPRec.fio:=curr_person^.FIO;
                  if rgMode.ItemIndex=1 then
                      vPRec.need:=false
                  else
                      vPRec.need:=true;
                  vPRec.summa:=SUMMA;
                  vPRec.shifrPod:=NSRV;
                  list.Add(vPRec);
             end;
     end;
    procedure markPersonInList;
     var vPRec:PRec;
         i:Integer;
     begin
          if list.Count>0 then
             for i:=0 to list.Count-1 do
                 if PRec(list.Items[i])^.tabno=curr_person^.TABNO then
                    begin
                         PRec(list.Items[i])^.need:=true;
                         Break;
                    end;
     end;

 begin
      NMESTmp:=NMES;
      NSRVTmp:=NSRV;
      putinf;
      EMPTY_ALL_PERSON;
      NMES:=MonthOf(dtIn.Date);
      markSelected;
      list:=TList.Create;
      ProgressBar1.Show;
      if rgMode.ItemIndex=0 then
         ProgressBar1.Max:=Count_Serv
      else
         ProgressBar1.Max:=Count_Serv*2;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      ProgressBar1.Step:=1;
      Application.ProcessMessages;

      for i_NSRV:=1 to Count_Serv do
          begin
               ProgressBar1.StepIt;
               Application.ProcessMessages;
               if not NameServList.IsSelected(I_NSRV) then
                  Continue;
               NSRV:=i_NSRV;
               MKFLNM;
               if not FileExists(FNINF) then
                  continue;
               GETINF(False);
               curr_person:=HEAD_PERSON;
               while (Curr_Person<>Nil) do
                 begin
                      if curr_person^.WID_RABOTY=2 then
                      if isValidDolg then
                      if ((rgMode.ItemIndex=0) and (Curr_Person^.MESTO_OSN_RABOTY=82))
                         or
                         ((rgMode.ItemIndex=1) and (Curr_Person^.MESTO_OSN_RABOTY<>82))
                       then
                         begin
                              summa:=getSummaAddForPerson(curr_person);
                              AddPersonToList;;
                         end;
                      Curr_Person:=Curr_Person^.NEXT;
                 end;
               EMPTY_ALL_PERSON;

          end;
      if rgMode.ItemIndex=1 then
         for i_nsrv:=1 to Count_Serv do
             begin
                ProgressBar1.StepIt;
                Application.ProcessMessages;
                if not NameServList.IsSelected(I_NSRV) then
                   Continue;
                NSRV:=i_NSRV;
                MKFLNM;
                if not FileExists(FNINF) then
                   continue;
                GETINF(False);
                curr_person:=HEAD_PERSON;
                while (Curr_Person<>Nil) do
                  begin
                      if IS_OSN_WID_RABOTY(curr_person) then
                         MarkPersonInList;
                      Curr_Person:=Curr_Person^.NEXT;
                 end;
               EMPTY_ALL_PERSON;
             end;
      NameServList.ClearAllSelected;
      if list.count<>0 then
         begin
              cdsSwm.Open;
              cdsSwm.EmptyDataSet;
              for i:=0 to list.Count-1 do
                  begin
                       if (cbSummy.Checked and (Abs(pRec(list.items[i]).summa)>0.01))
                          or
                          not cbSummy.Checked  then
                       if pRec(list.items[i]).need then
                          begin
                               cdsSwm.Append;
                               cdsSwmtabno.value:=pRec(list.items[i]).tabno;
                               cdsSwmfio.value:=Trim(pRec(list.items[i]).fio);
                               cdsSwmsumma.value:=pRec(list.items[i]).summa;
                               cdsSwmshifrpod.value:=pRec(list.items[i]).shifrpod;
                               cdsSwmnamepod.value:=Trim(name_serv(pRec(list.items[i]).shifrpod));
                               cdsSwm.Post;
                          end;
                       Dispose(pRec(list.items[i]));
                  end;
              frxReport2.ShowReport;    
            (*
               18 адонин выпал
               9204 97 Вилентейчик
               11601 8 Соболева
               11726 93 Филин
               обычный свод по бюджет
            *)


         end
      else
         ShowMessage('Нет совместителей');
      list.Free;   
      ProgressBar1.Hide;
      Application.ProcessMessages;
      NMES:=NMESTmp;
      NSRV:=NSRVTmp;
      MKFLNM;
      getinf(true);
 end;


procedure TFormRepSowmInOut.BitBtn3Click(Sender: TObject);
begin
     makeList;
end;

procedure TFormRepSowmInOut.frxReport2GetValue(const VarName: String;
  var Value: Variant);
begin
     if Trim(VarName)='Year' then
        Value:=IntToStr(YearOf(dtIn.Date))
     else
     if Trim(VarName)='Month' then
        Value:=GetMonthRus(MonthOf(dtIn.Date))
     else
     if Trim(VarName)='comment' then
        if rgMode.ItemIndex=1 then
           Value:='внутренних за '+trim(GetMonthRus(MonthOf(dtIn.Date)))+' '+IntToStr(YearOf(dtIn.Date))+' г.'
        else
           Value:='внешних за '+trim(GetMonthRus(MonthOf(dtIn.Date)))+' '+IntToStr(YearOf(dtIn.Date))+' г.';

end;

end.
