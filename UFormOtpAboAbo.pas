unit UFormOtpAboAbo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBGrid, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxCntner, ExtCtrls, DBCtrls, ActnList,
  ComCtrls, ToolWin, Scrdef;

type
  TFormBlnAbo = class(TForm)
    pFIBDataSetBA: TpFIBDataSet;
    pFIBDataSetBAYEAR_VY: TFIBSmallIntField;
    pFIBDataSetBAMONTH_VY: TFIBSmallIntField;
    pFIBDataSetBAF_DATA: TFIBDateField;
    pFIBDataSetBAL_DATA: TFIBDateField;
    pFIBDataSetBAK_WO_DAY: TFIBSmallIntField;
    pFIBDataSetBASUMMA_BOL: TFIBBCDField;
    pFIBDataSetBASHIFRID: TFIBIntegerField;
    pFIBDataSetBANOMER_B: TFIBStringField;
    pFIBDataSetBADATA_P_BUD: TFIBDateField;
    pFIBDataSetBADATA_P: TStringField;
    DataSourceBA: TDataSource;
    dxDBGridBA: TdxDBGrid;
    dxDBGridBAF_DATA: TdxDBGridDateColumn;
    dxDBGridBAL_DATA: TdxDBGridDateColumn;
    dxDBGridBANOMER_B: TdxDBGridMaskColumn;
    dxDBGridBADATA_P: TdxDBGridColumn;
    dxDBGridBASUMMA_BOL: TdxDBGridColumn;
    dxDBGridBAYEAR_VY: TdxDBGridColumn;
    dxDBGridBAMONTH_VY: TdxDBGridColumn;
    dxDBGridBAK_WO_DAY: TdxDBGridColumn;
    ActionList1: TActionList;
    ActionSelectBoln: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ActionInsBoln: TAction;
    ToolButton2: TToolButton;
    ActionDelBoln: TAction;
    ToolButton3: TToolButton;
    pFIBDataSetBASHIFRKAT: TFIBSmallIntField;
    pFIBDataSetBASHIFRGRU: TFIBSmallIntField;
    ActionMoveBoln: TAction;
    ToolButton4: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSetBACalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ShowTable;
    procedure FormShow(Sender: TObject);
    procedure ActionSelectBolnExecute(Sender: TObject);
    procedure ActionInsBolnExecute(Sender: TObject);
    procedure ActionDelBolnExecute(Sender: TObject);
    procedure ActionMoveBolnExecute(Sender: TObject);


  private
    { Private declarations }
    procedure SeeBoln(Act:integer);
    procedure MoveBoln;
    procedure MoveBolnSingle;
  public
    { Public declarations }
     WantedTabno:integer;
     WantedFio:string;
     ShifrKat:integer;
     ShifrGru:integer;
     WantedCurrPerson:Person_Ptr;
  end;

var
  FormBlnAbo: TFormBlnAbo;

implementation
uses  uFIBModule, uFormWait, UFormUpdBoln, ScrUtil, uFormMovBol;

{$R *.dfm}

procedure TFormBlnAbo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormBlnAbo.pFIBDataSetBACalcFields(DataSet: TDataSet);
var DT:TDateTime;
    Y,M,D:Word;
begin
 Dt:=DataSet.FieldByName('Data_P_Bud').AsDateTime;
     DeCodeDate(DT,Y,M,D);
     if Y<1995 then
        pFIBDataSetBADATA_P.Value:=''
               else
        pFIBDataSetBADATA_P.Value:=IntToStr(D)+'.'+IntToStr(M)+'.'+IntToStr(Y);

end;


procedure TFormBlnAbo.FormCreate(Sender: TObject);
begin
     WantedTabno:=0;
     WantedFio:='';
end;

procedure TFormBlnAbo.FormShow(Sender: TObject);
begin
      Caption:=IntToStr(WAntedTabno)+' '+WantedFio;
      ShowTable;
end;

procedure TFormBlnAbo.ShowTable;
begin

      FormWait.Show;
      Application.ProcessMessages;
      if pFIBDataSetBA.Active then
         pFIBDataSetBA.Active:=false;
      pFIBDataSetBA.Params[0].AsInteger:=Self.WantedTabno;
      pFIBDataSetBA.Prepare;
      pFIBDataSetBA.Open;
      FormWait.Hide;
end;

procedure TFormBlnAbo.SeeBoln(Act:integer);
var
  BtnName: string;
  ShifrIdB:integer;
begin
  IF (ACT=3) AND (SELF.pFIBDataSetBA.RecordCount=0) then Exit;
  if (Act=3) then
     if YesNo('Удалить больничный лист?') then
        begin
              ShifrIdB:=SELF.pFIBDataSetBA.FieldByName('SHIFRID').AsInteger;
              if ShifrIdB>0 then
                 begin
                      FIB.pFIBQuery.SQL.Clear;
                      FIB.pFIBQuery.SQL.Add('DELETE FROM BOLN WHERE SHIFRID='+IntToSTr(ShifrIdB));
                      FIB.pFIBTransactionSAL.StartTransaction;
                      try
                         FIB.pFIBQuery.ExecQuery;
                         FIB.pFIBQuery.Close;
                      except
                         MessageDlg('Ошибка удаления больничного',mtInformation, [mbOk], 0);
                      end;
                      FIB.pFIBTransactionSAL.Commit;
                      ShowTable;
                 end;
             Exit
        end
                                          else Exit;
  if Act>0 then
     begin
          with TFormUpdBoln.Create(nil) do
            begin
               try
                  ActionClar:=Act;
                  WantedTabno:=0;
                  Fio:='';
                  WorkYear  := CurrYear;
                  WorkMonth := NMES;
                  ShifrIdBoln:=0;
                  WantedTabno:=SELF.WantedTabno;
                  Fio:=SELF.WantedFIO;
                  ShifrKat:=SELF.ShifrKat;
                  ShifrGru:=SELF.ShifrGru;
                  if Act<>1 then
                     begin
                          WantedTabno:=SELF.WantedTabno;
                          Fio:=SELF.WantedFIO;
                          ShifrKat:=SELF.pFIBDataSetBA.FieldByName('SHIFRKAT').AsInteger;
                          ShifrGru:=SELF.pFIBDataSetBA.FieldByName('SHIFRGRU').AsInteger;
                          ShifrIdBoln:=SELF.pFIBDataSetBA.FieldByName('SHIFRID').AsInteger;
                          NomerB:=SELF.pFIBDataSetBA.FieldByName('NOMER_B').AsString;
                          DateTimePickerFr.Date:=SELF.pFIBDataSetBA.FieldByName('F_DATA').AsDateTime;
                          DateTimePickerTo.Date:=SELF.pFIBDataSetBA.FieldByName('L_DATA').AsDateTime;
                          WorkYear  := SELF.pFIBDataSetBA.FieldByName('YEAR_VY').AsInteger;
                          WorkMonth := SELF.pFIBDataSetBA.FieldByName('MONTH_VY').AsInteger;
                     end;
                  ShifrIdB:=ShifrIdBoln;
                  if execute then
                     begin
                     end;
                  ShifrIdB:=ShifrIdBoln;
              finally
                free;
              end;
            ShowTable;
            if ShifrIdB>0 then
               begin
{                    ShifrIdB:=ShifrIdBoln;}
{                   SELF.pFIBDataSetBoln.FieldByName('SHIFRID').AsInteger:=ShifrIdBoln;}
                    SELF.pFIBDataSetBA.Locate('ShifrId',ShifrIdB,[loPartialKey]);
               end;
           end;
     end;

end;

procedure TFormBlnAbo.ActionSelectBolnExecute(Sender: TObject);
begin
      SeeBoln(2);
end;

procedure TFormBlnAbo.ActionInsBolnExecute(Sender: TObject);
begin
      SeeBoln(1);
end;

procedure TFormBlnAbo.ActionDelBolnExecute(Sender: TObject);
begin
     SeeBoln(3);
end;

procedure TFormBlnAbo.ActionMoveBolnExecute(Sender: TObject);
var ShifrIDB:integer;
    DT:TDateTime;
    Y,M,D:Word;
    Year_VY,Month_Vy:integer;

begin
  IF SELF.pFIBDataSetBA.RecordCount=0 then Exit;
  if not YesNo('Перенести больничный лист?') then Exit;
  Year_Vy:=pFIBDataSetBA.FieldByName('YEAR_VY').AsInteger;
  Month_Vy:=pFIBDataSetBA.FieldByName('MONTH_VY').AsInteger;
  if ((Year_Vy>1995) and (Year_Vy<>CurrYear)) or ((Month_Vy>0) and (Month_Vy<>NMES)) then
     begin
          ShowMessage('Этот больничный лист начислен не в текущем месяце');
          Exit;
     end;
  ShifrIdB:=SELF.pFIBDataSetBA.FieldByName('SHIFRID').AsInteger;

  Dt:=SELF.pFIBDataSetBA.FieldByName('Data_P_Bud').AsDateTime;
  DeCodeDate(DT,Y,M,D);
  if (Y>1995) then
     begin
          ShowMessage('Больничный уже перенесен');
          Exit;
     end;
  MoveBoln;
end;

procedure TFormBlnAbo.MoveBolnSingle;
 var ShifrSta,B_Day,Month_Za,Year_Za:Integer;
     SUMMA_B_BUD,SUMMA_B_VNE,SUMMA_B_GN,SUMMA_B_NIS:real;
     ShifrIdB:integer;
     Curr_Add:Add_Ptr;
 function IsNeedMove:boolean;
  var RetVal:boolean;
      Curr_Add:Add_Ptr;
      ShifrId:Integer;
    procedure deleteWantedBol;
     var Curr_Add:Add_Ptr;
         Done:boolean;
         ShifrId:Integer;
     begin
          Done:=false;
          ShifrId:=ShifrIdB mod 640000;
          while true do
            begin
                  Done:=false;
                  Curr_Add:=WantedCurrPerson^.Add;
                  while Curr_Add<>Nil do
                   begin
                        if IsBolnShifr(Curr_Add^.Shifr)    then
                        if (ShifrSta=Curr_Add^.Shifr)      then
                        if Curr_Add^.YEAR+1990=Year_Za     then
                        if Curr_Add^.Period=Month_Za       then
                        if Curr_Add^.VYPLACHENO<>get_out   then
                        if ShifrId=Curr_Add^.WHO           then
                            begin
                                Del_Add(Curr_add,WantedCurrPerson);
                                Done:=true;
                                break;
                             end;
                        Curr_Add:=Curr_Add^.NEXT;
                   end;
                  if not Done then break;
            end;
     end;
  begin
       DeleteWantedBol;
       RetVal:=true;
       Curr_Add:=WantedCurrPerson^.Add;
       ShifrId:=ShifrIdB mod 640000;
       while Curr_Add<>Nil do
        begin

              if IsBolnShifr(Curr_Add^.Shifr)    then
              if Curr_Add^.YEAR+1990=Year_Za     then
              if Curr_Add^.Period=Month_Za       then
              if Curr_Add^.VYPLACHENO=get_out    then
              if Curr_Add^.Who=ShifrId           then
                 begin
                      RetVal:=false;
                      break;
                 end;
              Curr_Add:=Curr_Add^.NEXT;
        end;
  end;
 function IsCoincindenceKat:boolean;
  var RetVal:boolean;
  begin
       RetVal:=true;
       if (WantedCurrPerson^.KATEGORIJA=1) and (abs(Summa_B_Bud)<0.009) then
          RetVal:=false
       else if (WantedCurrPerson^.KATEGORIJA=2) and (abs(Summa_B_Nis)<0.009) then
          RetVal:=false
       else if ((WantedCurrPerson^.KATEGORIJA=3)  or
                (WantedCurrPerson^.KATEGORIJA=4)  or
                (WantedCurrPerson^.KATEGORIJA=5)) and (abs(Summa_B_GN)<0.009) then
          RetVal:=false
       else if abs(Summa_B_NIS)<0.008 then
            RetVal:=false;
  end;
 begin
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add('SELECT SHIFRSTA,B_DAY,MONTH_ZA,YEAR_ZA,SUMMA_B_BUD,SUMMA_B_VNE,SUMMA_B_GN,SUMMA_B_NIS FROM BOLN_RES WHERE SHIFRIDBOLN='+IntToSTr(ShifrIdB));
      FIB.pFIBTransactionSAL.StartTransaction;
      try
          FIB.pFIBQuery.ExecQuery;
          while not FIB.pFIBQuery.eof do
            begin
                 ShifrSta    := FIB.pFIBQuery.FieldByName('SHIFRSTA').AsInteger;
                 B_DAY       := FIB.pFIBQuery.FieldByName('B_DAY').AsInteger;
                 MONTH_ZA    := FIB.pFIBQuery.FieldByName('MONTH_ZA').AsInteger;
                 YEAR_ZA     := FIB.pFIBQuery.FieldByName('YEAR_ZA').AsInteger;
                 SUMMA_B_BUD := FIB.pFIBQuery.FieldByName('SUMMA_B_BUD').AsFloat;
                 SUMMA_B_VNE := FIB.pFIBQuery.FieldByName('SUMMA_B_VNE').AsFloat;
                 SUMMA_B_GN  := FIB.pFIBQuery.FieldByName('SUMMA_B_GN').AsFloat;
                 SUMMA_B_NIS := FIB.pFIBQuery.FieldByName('SUMMA_B_NIS').AsFloat;
                 if IsBolnShifr(ShifrSta) then
                 if (B_Day>0) and (B_Day<=31) then
                 if (Month_Za>0) and (Month_Za<13) then
                 if (Year_Za>1995) and (Year_Za<2010) then
                 if IsNeedMove then
                 if IsCoincindenceKat then
                     begin
                          MAKE_ADD(CURR_ADD,WantedCURRPERSON);
                          CURR_ADD^.SHIFR       := SHIFRSTA;
                          CURR_ADD^.PERIOD      := MONTH_ZA;
                          CURR_ADD^.YEAR        := YEAR_ZA-1990;
                          CURR_ADD^.SUMMA       := R10(SUMMA_B_BUD);
                          IF CURR_ADD^.SHIFR=BOL_5_SHIFR THEN CURR_ADD^.FMP   := CURR_ADD^.SUMMA
                                                         ELSE CURR_ADD^.OTHER := CURR_ADD^.SUMMA;
                          CURR_ADD^.WHO         := ShifrIdB mod 640000;
                          CURR_ADD^.WORK_DAY    := B_Day;
                     end
                                      else
                     ShowMessage('Больничный другой категории.')
                               else
                     ShowMessage('Больничный уже перенесен.');
                 FIB.pFIBQuery.Next;
            end;
          FIB.pFIBQuery.Close;
      except
          MessageDlg('Ошибка удаления больничного.',mtInformation, [mbOk], 0);
      end;
      FIB.pFIBTransactionSAL.Commit;

 end;

procedure TFormBlnAbo.MoveBoln;
 var ShifrIdB:integer;
     Month_Vy,Year_Vy:Integer;
     DataP:TDate;
 begin
      ShifrIdB   := pFIBDataSetBA.FieldByName('ShifrId').AsInteger;
      MONTH_VY   := pFIBDataSetBA.FieldByName('MONTH_VY').AsInteger;
      YEAR_VY    := pFIBDataSetBA.FieldByName('YEAR_VY').AsInteger;
      if (MONTH_VY<>NMES) OR (YEAR_VY<>CURRYEAR) then
         begin
              ShowMessage('Можно перенести только начисленніей в єтом месяце больничній');
              Exit;
         end;
      if ShifrIdB=0 then Exit;
      Application.CreateForm(TFormMovBol, FormMovBol);
      FormMovBol.WantedTabno := WantedTabno;
      FormMovBol.Curr_Person := WantedCurrPerson;
      FormMovBol.ShifrIdBoln:=ShifrIdB;
      FormMovBol.Show;


 end;
end.
