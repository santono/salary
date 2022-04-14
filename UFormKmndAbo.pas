unit UFormKmndAbo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScrDef, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  ToolWin, ComCtrls, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, ActnList, ImgList, Menus;

type
  TFormKmndAbo = class(TForm)
    tlb1: TToolBar;
    pFIBdsKmndAbo: TpFIBDataSet;
    pFIBtrKmndAbo: TpFIBTransaction;
    pFIBtrKmndAboRead: TpFIBTransaction;
    dsKmndAbo: TDataSource;
    pFIBdsKmndAboSHIFRID: TFIBIntegerField;
    pFIBdsKmndAboF_DATA: TFIBDateField;
    pFIBdsKmndAboL_DATA: TFIBDateField;
    pFIBdsKmndAboMONTH_VY: TFIBSmallIntField;
    pFIBdsKmndAboYEAR_VY: TFIBSmallIntField;
    pFIBdsKmndAboK_WO_DAY: TFIBSmallIntField;
    pFIBdsKmndAboSUMMA_KMD: TFIBBCDField;
    pFIBdsKmndAboDATA_P_BUD: TFIBDateField;
    dxDBGridKmndAbo: TdxDBGrid;
    dxDBGridKmndAboSHIFRID: TdxDBGridMaskColumn;
    dxDBGridKmndAboF_DATA: TdxDBGridDateColumn;
    dxDBGridKmndAboL_DATA: TdxDBGridDateColumn;
    dxDBGridKmndAboMONTH_VY: TdxDBGridMaskColumn;
    dxDBGridKmndAboYEAR_VY: TdxDBGridMaskColumn;
    dxDBGridKmndAboK_WO_DAY: TdxDBGridMaskColumn;
    dxDBGridKmndAboSUMMA_KMD: TdxDBGridCurrencyColumn;
    dxDBGridKmndAboDATA_P_BUD: TdxDBGridDateColumn;
    ImageListKmndAbo: TImageList;
    ActionListKmndAbo: TActionList;
    ActDelKmndAbo: TAction;
    ActUpdKmndAbo: TAction;
    ActInsKmndAbo: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    pFIBdsKmndAboSHIFRKAT: TFIBSmallIntField;
    pFIBdsKmndAboSHIFRGRU: TFIBSmallIntField;
    pFIBdsKmndAboDATA_P: TStringField;
    ToolButton4: TToolButton;
    ActMovKmndAbo: TAction;
    pFIBdsKmndAboMEAN_DAY: TFIBBCDField;
    pFIBdsKmndAboMEAN_DAY_BUD: TFIBBCDField;
    pFIBdsKmndAboMEAN_DAY_VNE: TFIBBCDField;
    pFIBdsKmndAboMEAN_DAY_GN: TFIBBCDField;
    pFIBdsKmndAboMEAN_DAY_NIS: TFIBBCDField;
    pFIBdsKmndAboSHIFR_STA: TFIBSmallIntField;
    pFIBdsKmndAboSHIFRBUH: TFIBIntegerField;
    pFIBdsKmndAboMODE_V_Z: TFIBSmallIntField;
    pFIBdsKmndAboMODEWR: TFIBIntegerField;
    pFIBdsKmndAboNAMEMODEWR: TStringField;
    dxDBGridKmndAboNameWR: TdxDBGridColumn;
    pFIBdsKmndAboGUID: TFIBStringField;
    pFIBdsKmndAboMODE_SIX_FIVE_DAY: TFIBIntegerField;
    pFIBdsKmndAboSHIFRTABEL: TFIBIntegerField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ActDelKmndAboExecute(Sender: TObject);
    procedure ActInsKmndAboExecute(Sender: TObject);
    procedure ActUpdKmndAboExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pFIBdsKmndAboCalcFields(DataSet: TDataSet);
    procedure ActMovKmndAboExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    procedure SeeKomand(Act:integer);
    procedure ShowTable;
    procedure MoveKomand;

    { Private declarations }
  public
    WantedTabno : Integer;
    WantedFIO   : string;
    ShifrKat    : Integer;
    ShifrGru    : integer;
    ModeWR      : Integer;
    WantedCurrPerson : person_ptr;
    GUID        : string;
    constructor CreateKmndForm(AOwner: TComponent; Curr_Person:PERSON_PTR);
    { Public declarations }
  end;

var
  FormKmndAbo: TFormKmndAbo;

implementation
 uses UFibModule,UFormUpdKmnd,scrUtil, uFormWait,USQLUnit, UFormMovKmd,
      DateUtils;

{$R *.dfm}
constructor TFormKmndAbo.CreateKmndForm(AOwner: TComponent; Curr_Person:PERSON_PTR);
 begin
      Self.Create(AOwner);
      Self.WantedTabno := Curr_Person^.TABNO;
      Self.WantedFio   := Trim(Curr_Person^.FIO)+' '+trim(Curr_Person^.dolg);
      Self.ShifrKat    := Curr_Person^.Kategorija;
      Self.ShifrGru    := Curr_Person^.Gruppa;
      Self.GUID        := GetGUIDPersonToString(Curr_Person);
      Self.modeWR      := 0;
      if isLNR then
      if IS_OSN_WID_RABOTY(Curr_person) then
         Self.MODEWR := 1
      else
         Self.ModeWR := 2;
      Self.WantedCurrPerson:=Curr_Person;
      Caption:='Командировки '+Trim(Curr_Person^.FIO)+' '+trim(Curr_Person^.dolg);
 end;

procedure TFormKmndAbo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBdsKmndAbo.Active then
        pFIBdsKmndAbo.Close;
     if pFIBdsKmndAbo.Transaction.Active then
        pFIBdsKmndAbo.Transaction.Commit;
     if pFIBdsKmndAbo.UpdateTransaction.Active then
        pFIBdsKmndAbo.UpdateTransaction.Commit;
     Action:=caFree;
end;

procedure TFormKmndAbo.FormCreate(Sender: TObject);
var selectSQL:string;
begin
{
     if pFIBdsKmndAbo.Active then
        pFIBdsKmndAbo.Close;
     if pFIBdsKmndAbo.Transaction.Active then
        pFIBdsKmndAbo.Transaction.Commit;
     if pFIBdsKmndAbo.UpdateTransaction.Active then
        pFIBdsKmndAbo.UpdateTransaction.Commit;
     pFIBdsKmndAbo.Params[0].Value:=Self.WantedTabno;
     pFIBdsKmndAbo.Transaction.StartTransaction;
     pFIBdsKmndAbo.Open;
}
     WantedTabno:=0;
     WantedFIO:='';

     if isLNR then
         begin
              selectSQL:='SELECT '
                        +'SHIFRID,'
                        +'F_DATA,'
                        +'L_DATA,'
                        +'MONTH_VY,'
                        +'YEAR_VY,'
                        +'K_WO_DAY,'
                        +'SUMMA_KMD,'
                        +'DATA_P_BUD,'
                        +'SHIFRKAT,'
                        +'SHIFRGRU,'
                        +'MEAN_DAY,'
                        +'MEAN_DAY_BUD,'
                        +'MEAN_DAY_VNE,'
                        +'MEAN_DAY_GN,'
                        +'MEAN_DAY_NIS,'
                        +'SHIFR_STA,'
                        +'SHIFRBUH,'
                        +'MODE_V_Z,'
                        +'MODEWR,'
                        +'GUID,'
                        +'MODE_SIX_FIVE_DAY,'
                        +'SHIFRTABEL'
                        +' FROM'
                        +' TB_KOMAND'
                        +' where TABNO=:TABNO'
                        +' order by F_DATA desc';
              dxDBGridKmndAboNameWR.Visible:=true;
         end
     else
         begin
              selectSQL:='SELECT '
                        +'SHIFRID,'
                        +'F_DATA,'
                        +'L_DATA,'
                        +'MONTH_VY,'
                        +'YEAR_VY,'
                        +'K_WO_DAY,'
                        +'SUMMA_KMD,'
                        +'DATA_P_BUD,'
                        +'SHIFRKAT,'
                        +'SHIFRGRU,'
                        +'MEAN_DAY,'
                        +'MEAN_DAY_BUD,'
                        +'MEAN_DAY_VNE,'
                        +'MEAN_DAY_GN,'
                        +'MEAN_DAY_NIS,'
                        +'SHIFR_STA,'
                        +'SHIFRBUH,'
                        +'MODE_V_Z,'
                        +'0 AS MODEWR,'
                        + ''' '' AS GUID,'
                        + '5 AS MODE_SIX_FIVE_DAY,'
                        + '3 AS SHIFRTABEL'
                        +' FROM'
                        +' TB_KOMAND'
                        +' where TABNO=:TABNO'
                        +' order by F_DATA desc';

              dxDBGridKmndAboNameWR.Visible:=false;
         end;
     pFIBdsKmndAbo.SQLs.SelectSQL.Clear;
     pFIBdsKmndAbo.SQLs.selectSQL.add(selectSQL);


end;

procedure TFormKmndAbo.ActDelKmndAboExecute(Sender: TObject);
begin
     if FLOW_MONTH<>NMES then Exit;
     SeeKomand(3);
end;

procedure TFormKmndAbo.ActInsKmndAboExecute(Sender: TObject);
begin
      if FLOW_MONTH<>NMES then Exit;
     SeeKomand(1);
end;

procedure TFormKmndAbo.ActUpdKmndAboExecute(Sender: TObject);
begin
     SeeKomand(2);
end;
procedure TFormKmndAbo.ShowTable;
begin

      FormWait.Show;
      Application.ProcessMessages;
      if pFIBdsKmndAbo.Active then
         pFIBdsKmndAbo.Active:=false;
      pFIBdsKmndAbo.Params[0].AsInteger:=Self.WantedTabno;
      pFIBdsKmndAbo.Prepare;
      pFIBdsKmndAbo.Open;
      FormWait.Hide;
      Application.ProcessMessages;
end;


procedure TFormKmndAbo.SeeKomand(Act:integer);
var
  BtnName    : string  ;
  ShifrIdKmd : integer ;
  s          : string  ;
  Nal_Code   : string  ;
  SQLStmnt   : string  ;
  v          : Variant ;
begin
  IF ((ACT=3) OR (ACT=2)) AND (SELF.pFIBdsKmndAbo.RecordCount=0) then Exit;
  if (Act=3) then
     if YesNo('Удалить этот расчет командировки?') then
        begin
              ShifrIdKmd:=SELF.pFIBdsKmndAbo.FieldByName('SHIFRID').AsInteger;
              if ShifrIdKmd>0 then
                 begin
                      SQLStmnt:='DELETE FROM TB_KOMAND WHERE SHIFRID='+IntToSTr(ShifrIdKmd);
                      SQLExecute(SQLStmnt);
                      ShowTable;
                 end;
             Exit;
        end
     else Exit;
  if Act>0 then
     begin
          with TFormUpdKmnd.Create(nil) do
            begin
               try
                  ActionClar  := Act;
                  WantedTabno := 0;
                  Fio         := '';
                  WorkYear    := CurrYear;
                  WorkMonth   := NMES;
                  ShifrIdKmnd := 0;
                  WantedTabno := SELF.WantedTabno;
                  WantedPodr  := NSRV;
                  WantedCurrPerson := Self.WantedCurrPerson;
                  Mode_V_Z    := 0;  // за
              // 11 10 2012 с недовольством сказали что и командировка "в" а не "за"

              //    if Self.WantedMode<>10 then // оставить за для командировочных
              //                                // 23 01 2011
                  Mode_V_Z   := 1;  // в - с 19 12 2010
                  ShifrBuh       := CurrWrk;
                  Fio            := SELF.WantedFIO;
                  WantedTabno    := Self.WantedTabno;
                  ShifrKat       := SELF.ShifrKat;
                  ShifrGru       := SELF.ShifrGru;
                  MODEWR         := 0;
                  GUID           := Self.GUID;
                  WantedShifrSta := Komandirowki_Shifr;
                  if isSixDayMode(WantedCurrPerson) then
                     mode_six_five_day := 6
                  else
                     mode_six_five_day := 5;
                  wantedShifrTabel     := KOMANDIROWKA;
                  if isLNR then modeWR := Self.ModeWR;
                  if Act=1 then
                     begin
                          SQLStmnt:='EXECUTE PROCEDURE PR_DELETE_ALL_FROM_TMP_KOMAND';
                          SQLExecute(SQLStmnt);
                     end;
                  if Act<>1 then
                     begin
                          WantedTabno:=SELF.WantedTabno;
                          Fio:=SELF.WantedFIO;
                          ShifrKat:=SELF.pFIBdsKmndAbo.FieldByName('SHIFRKAT').AsInteger;
                          ShifrGru:=SELF.pFIBdsKmndAbo.FieldByName('SHIFRGRU').AsInteger;
                          ShifrIdKmnd:=SELF.pFIBdsKmndAbo.FieldByName('SHIFRID').AsInteger;
                          DateTimePickerFr.Date:=SELF.pFIBdsKmndAbo.FieldByName('F_DATA').AsDateTime;
                          DateTimePickerTo.Date:=SELF.pFIBdsKmndAbo.FieldByName('L_DATA').AsDateTime;
                          WorkYear    := SELF.pFIBdsKmndAbo.FieldByName('YEAR_VY').AsInteger;
                          WorkMonth   := SELF.pFIBdsKmndAbo.FieldByName('MONTH_VY').AsInteger;
                          MeanDay     := SELF.pFIBdsKmndAbo.FieldByName('MEAN_DAY').AsFloat;
                          Kmnd_Day    := SELF.pFIBdsKmndAbo.FieldByName('K_WO_DAY').AsInteger;
                          MODE_V_Z    := SELF.pFIBdsKmndAbo.FieldByName('MODE_V_Z').AsInteger;
                          MeanDay_Bud := SELF.pFIBdsKmndAbo.FieldByName('MEAN_DAY_BUD').AsFloat;
                          MeanDay_Vne := SELF.pFIBdsKmndAbo.FieldByName('MEAN_DAY_VNE').AsFloat;
                          MeanDay_GN  := SELF.pFIBdsKmndAbo.FieldByName('MEAN_DAY_GN').AsFloat;
                          MeanDay_NIS := SELF.pFIBdsKmndAbo.FieldByName('MEAN_DAY_NIS').AsFloat;
                          WantedShifrSta :=SELF.pFIBdsKmndAbo.FieldByName('SHIFR_STA').AsInteger;
                      //    ModeDC      :=SELF.pFIBdsKmndAbo.FieldByName('MODE_DAY_CLOCK').AsInteger;
                          ShifrBuh    :=SELF.pFIBdsKmndAbo.FieldByName('SHIFRBUH').AsInteger;
                          MODEWR      := SELF.pFIBdsKmndAbo.FieldByName('MODEWR').AsInteger;
                          GUID        :=SELF.pFIBdsKmndAbo.FieldByName('GUID').AsString;
                          MODE_SIX_FIVE_DAY:=SELF.pFIBdsKmndAbo.FieldByName('MODE_SIX_FIVE_DAY').AsInteger;
                          wantedShifrTabel  := Self.pFIBdsKmndAbo.FieldByName('SHIFRTABEL').AsInteger;
                          if (wantedShifrTabel<1) or (WantedShifrTabel>MAX_TABEL_KOD) then
                             wantedShifrTabel:=komandirowki_shifr;
                     end;
                  ShifrIdKmd:=ShifrIdKmnd;
                  if execute then
                     begin
                     end;
                  ShifrIdKmd:=ShifrIdKmnd;
              finally
                free;
              end;
            ShowTable;
            if ShifrIdKmd>0 then
               begin
                    SELF.pFIBdsKmndAbo.Locate('ShifrId',ShifrIdKmd,[loPartialKey]);
               end;
           end;
     end;

end;

procedure TFormKmndAbo.FormShow(Sender: TObject);
begin
      Caption := Caption + IntToStr(WantedTabno)+' '+WantedFio;
      ShowTable;

end;

procedure TFormKmndAbo.pFIBdsKmndAboCalcFields(DataSet: TDataSet);
var DT:TDateTime;
    Y,M,D:Word;
begin
 Dt:=DataSet.FieldByName('Data_P_Bud').AsDateTime;
     DeCodeDate(DT,Y,M,D);
     if Y<1995 then
        pFIBdsKmndAboDATA_P.Value:=''
               else
        pFIBdsKmndAboDATA_P.Value:=IntToStr(D)+'.'+IntToStr(M)+'.'+IntToStr(Y);
 if pFIBdsKmndAboMODEWR.value=1 then
    pFIBdsKmndAboNAMEMODEWR.value:='Осн'
 else
 if pFIBdsKmndAboMODEWR.value=2 then
    pFIBdsKmndAboNAMEMODEWR.value:='Свм'
 else
    pFIBdsKmndAboNAMEMODEWR.value:='ОиС';


end;

procedure TFormKmndAbo.ActMovKmndAboExecute(Sender: TObject);
var ShifrIDKmd:integer;
    DT:TDateTime;
    Y,M,D:Word;
    Year_VY,Month_Vy:integer;
    Save_Place : TBookmark;
    DtBVy,DtCurr:integer;
begin
  if Self.pFIBdsKmndAbo.RecordCount=0 then Exit;
  Year_Vy  := pFIBdsKmndAbo.FieldByName('YEAR_VY').AsInteger;
  Month_Vy := pFIBdsKmndAbo.FieldByName('MONTH_VY').AsInteger;
  DtBVy:=Year_VY*12+Month_Vy;
  DtCurr:=CurrYear*12+Nmes;
  if ((Year_Vy>1995) and (Year_Vy<>CurrYear)) or ((Month_Vy>0) and (Month_Vy<>NMES)) then
     begin
         if ((DtCurr-DtBVy)<6) then
            if not YesNo('Этот командировочный начислен не в текущем месяце.'^M'Перенести его все равно?') then
               Exit
            else
         else
             begin
                 ShowMessage('Этот командировочный начислен слишком давно. Его нельзя перенести!');
                 Exit;
             end;
     end;
  ShifrIdKmd:=SELF.pFIBdsKmndAbo.FieldByName('SHIFRID').AsInteger;

  Dt:=SELF.pFIBdsKmndAbo.FieldByName('Data_P_Bud').AsDateTime;
  DeCodeDate(DT,Y,M,D);
  if (Y>1995) then
     begin
          ShowMessage('Командировочный уже перенесен.');
          Exit;
     end;
  if not YesNo('Перенести командировочный?') then Exit;
  MoveKomand;
  if not SELF.pFIBdsKmndAbo.Transaction.Active then
     begin
          SELF.pFIBdsKmndAbo.Transaction.StartTransaction;
{          pFIBDataSetBA.Open;}
     end;
  Save_Place:=SELF.pFIBdsKmndAbo.GetBookmark;
  ShowTable;
  SELF.pFIBdsKmndAbo.GotoBookmark(Save_Place);
  SELF.pFIBdsKmndAbo.FreeBookmark(Save_Place);
end;

procedure TFormKmndAbo.MoveKomand;
{ 0 - весь 5 - 5 дней 6 - остальные}
 var ShifrIdKmd:integer;
     Month_Vy,Year_Vy:Integer;
     DataP:TDate;
     C_Person:Person_Ptr;
     S:String;
     Sav_Person_Rec,Curr_Person_Rec:Person;
     Finded,Eq:boolean;
     Sav,Curr:array[1..L_Person_Data] of byte;
     J : integer;
     shifrSta : Integer;
     shifrTabel : Integer;
 begin
      ShifrIdKmd := pFIBdsKmndAbo.FieldByName('ShifrId').AsInteger;
      MONTH_VY   := pFIBdsKmndAbo.FieldByName('MONTH_VY').AsInteger;
      YEAR_VY    := pFIBdsKmndAbo.FieldByName('YEAR_VY').AsInteger;
      shifrSta   := pFIBdsKmndAbo.FieldByName('SHIFR_STA').AsInteger;
      shifrTabel := pFIBdsKmndAbo.FieldByName('SHIFRTABEL').AsInteger;
      if shifrSta<>GOSOB_SHIFR then
         begin
              shifrSta:=Komandirowki_Shifr;
              shifrTabel:=KOMPENS_SHIFR;
         end
      else
      if not (shifrTabel in [Mobili_Tabel,GOS_OB]) then
         shifrTabel:=Mobili_Tabel;
//      if ((MONTH_VY<>NMES) OR (YEAR_VY<>CURRYEAR)) AND (CODE<>6) then
//         begin
//              ShowMessage('Можно перенести только начисленные в этом месяце больничный');
//              Exit;
//         end;
      if ShifrIdKmd=0 then Exit;
      Application.CreateForm(TFormMovKmd, FormMovKmd);
      FormMovKmd.WantedTabno := WantedTabno;
      FormMovKmd.Curr_Person := WantedCurrPerson;
      FormMovKmd.ShifrIdKmd  := ShifrIdKmd;
      FormMovKmd.shifrSta    := shifrSta;
      FormMovKmd.shifrTabel  := shifrTabel;
      FormMovKmd.PrepareHints;
      Sav_Person_Rec:=WantedCurrPerson^;
      move(WantedCurrPerson^,Sav,L_Person_Data);
      FormMovKmd.ShowModal;
      c_Person:=Head_Person;
      Finded:=false;
      while (C_Person<>Nil) do
       begin
            Curr_Person_Rec:=C_Person^;
            move(C_Person^,Curr,L_Person_Data);
            Eq:=true;
            for j:=1 to L_Person_Data do
                if Sav[j]<>Curr[j] then
                   begin
                        Eq:=false;
                        break;
                   end;
            if Eq then
               begin
                     Finded:=true;
                     break;
               end;
            C_Person:=C_Person^.Next;
       end;
      if Finded then
         WantedCurrPerson:=C_Person;
 end;


procedure TFormKmndAbo.N1Click(Sender: TObject);
var Dt:TDateTime;
    y,m,d:word;
begin
      if pFIBdsKmndAboDATA_P_BUD.IsNull then
         begin
              ShowMessage('Командировочный еще не перенесился.');
              Exit;
         end;
      if YearOf(pFIBdsKmndAboDATA_P_BUD.value)<2010 then
         begin
              ShowMessage('Командировочный еще не перенесился.');
              Exit;
         end;
      if not YesNo('Вы уверены, что хотите сбросить признак переноса командировочного?') then Exit;
      dt:=encodedate(1990,1,1);
      pFIBdsKmndAbo.Edit;
      pFIBdsKmndAboDATA_P_BUD.value:=dt;
      pFIBdsKmndAbo.Post;
      pFIBdsKmndAbo.ApplyUpdates;
      pFIBdsKmndAbo.Refresh;
      dxDBGridKmndAbo.Refresh;
      Application.ProcessMessages;

end;

end.
