{$WARNINGS OFF}
{$HINTS OFF}
unit UFormBlnAbo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBGrid, dxDBTLCl,
  dxGrClms, dxTL, dxDBCtrl, dxCntner, ExtCtrls, DBCtrls, ActnList,
  ComCtrls, ToolWin, Scrdef, Menus, ImgList;

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
    pFIBDataSetBAMEAN_DAY: TFIBBCDField;
    pFIBDataSetBAK_WO_DAY1: TFIBSmallIntField;
    ActionPrintBoln: TAction;
    ToolButton5: TToolButton;
    pFIBDataSetBAMODE_V_Z: TFIBSmallIntField;
    pFIBDataSetBAPROCENT: TFIBBCDField;
    pFIBDataSetBAMEAN_DAY_BUD: TFIBBCDField;
    pFIBDataSetBAMEAN_DAY_VNE: TFIBBCDField;
    pFIBDataSetBAMEAN_DAY_GN: TFIBBCDField;
    pFIBDataSetBAMEAN_DAY_NIS: TFIBBCDField;
    pFIBDataSetBASHIFR_STA: TFIBSmallIntField;
    dxDBGridBAShifrSta: TdxDBGridDateColumn;
    pFIBDataSetBAMODE_ILL: TFIBSmallIntField;
    dxDBGridBAModeIll: TdxDBGridColumn;
    pFIBDataSetBAMODE_DAY_CLOCK: TFIBSmallIntField;
    ActionMoveBoln5: TAction;
    ToolButton6: TToolButton;
    ActionMoveBolnNot5: TAction;
    ToolButton7: TToolButton;
    pFIBDataSetBADATA_P_VNE: TFIBDateField;
    dxDBGridBAData_P_V: TdxDBGridColumn;
    pFIBDataSetBADATA_P_V: TStringField;
    pFIBDataSetBASWIDSS: TFIBStringField;
    pFIBDataSetBACODE_REASON_ILL: TFIBIntegerField;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N51: TMenuItem;
    pFIBDataSetBASHIFRBUH: TFIBIntegerField;
    il1: TImageList;
    DBNavigator1: TDBNavigator;
    pFIBDataSetBAMODEWR: TFIBIntegerField;
    pFIBDataSetBAMODEWRNAME: TStringField;
    dxDBGridBAMODEWRNAME: TdxDBGridColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pFIBDataSetBACalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure ShowTable;
    procedure FormShow(Sender: TObject);
    procedure ActionSelectBolnExecute(Sender: TObject);
    procedure ActionInsBolnExecute(Sender: TObject);
    procedure ActionDelBolnExecute(Sender: TObject);
    procedure ActionMoveBolnExecute(Sender: TObject);
    procedure ActionPrintBolnExecute(Sender: TObject);
    procedure dxDBGridBACustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    procedure ActionMoveBoln5Execute(Sender: TObject);
    procedure ActionMoveBolnNot5Execute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N51Click(Sender: TObject);


  private
    { Private declarations }
    procedure SeeBoln(Act:integer);
    procedure MoveBoln(Code:integer);
    procedure MoveBolnSingle;
  public
    { Public declarations }
     WantedTabno:integer;
     WantedFio:string;
     ShifrKat:integer;
     ShifrGru:integer;
     WantedMode:integer;  {10 - командировочные}
     WantedCurrPerson:Person_Ptr;
  end;

var
  FormBlnAbo: TFormBlnAbo;

implementation
uses  uFIBModule, uFormWait, UFormUpdBoln, ScrUtil, uFormMovBol,
      uFormBoln,DateUtils,USQLUnit;

{$R *.dfm}

procedure TFormBlnAbo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
       if pFIBDataSetBA.Active then
          pFIBDataSetBA.Close;
       if pFIBDataSetBA.Transaction.Active then
          pFIBDataSetBA.Transaction.Commit;
       if pFIBDataSetBA.UpdateTransaction.Active then
          pFIBDataSetBA.UpdateTransaction.Commit;
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

 Dt:=DataSet.FieldByName('Data_P_Vne').AsDateTime;
     DeCodeDate(DT,Y,M,D);
     if Y<1995 then
        pFIBDataSetBADATA_P_V.Value:=''
               else
        pFIBDataSetBADATA_P_V.Value:=IntToStr(D)+'.'+IntToStr(M)+'.'+IntToStr(Y);
// if isLNR then
    if pFIBDataSetBAMODEWR.IsNull then
        pFIBDataSetBAMODEWRNAME.Value:='ОиС'
    else
    case pFIBDataSetBAMODEWR.Value of
      1 : pFIBDataSetBAMODEWRNAME.Value:='Осн';
      2 : pFIBDataSetBAMODEWRNAME.Value:='Свм';
      else
        pFIBDataSetBAMODEWRNAME.Value:='ОиС';
    end
// else

//    pFIBDataSetBAMODEWRNAME.Value:='';

end;


procedure TFormBlnAbo.FormCreate(Sender: TObject);
var selectSQL:wideString;
    deleteSQL:widestring;
    insertSQL:widestring;
    updateSQL:widestring;
    refreshSQL:widestring;
begin
     WantedTabno:=0;
     WantedFio:='';
     if isLNR then
        begin
              selectSQL:='select Year_Vy,Month_Vy,f_data,l_data,k_wo_day,'+
                         'case when summa_bol>0 then summa_bol '+
                         ' else (select sum(summa_b_bud+summa_b_vne+summa_b_gn+summa_b_nis) from boln_res where boln_res.shifridboln=boln.shifrid)'+
                         ' end as summa_bol,'+
                         ' ShifrId,ShifrKat,ShifrGru,Nomer_B,Data_P_Bud,MEAN_DAY,K_WO_DAY,MODE_V_Z,PROCENT,MEAN_DAY_BUD,MEAN_DAY_VNE,MEAN_DAY_GN,MEAN_DAY_NIS,SHIFR_STA,MODE_ILL,MODE_DAY_CLOCK,Data_P_Vne,SwidSS,CODE_REASON_ILL,SHIFRBUH,modeWR from boln '+
                         ' where Tabno=:Tabno'+
                         ' order by F_data desc';

              insertSQL:='INSERT INTO BOLN('+
                           'YEAR_VY,'+
                           'MONTH_VY,'+
                           'F_DATA,'+
                           'L_DATA,'+
                           'K_WO_DAY,'+
                           'SUMMA_BOL,'+
                           'SHIFRID,'+
                           'SHIFRKAT,'+
                           'SHIFRGRU,'+
                           'NOMER_B,'+
                           'DATA_P_BUD'+
                         ')'+
                          'VALUES('+
                            ':YEAR_VY,'+
                            ':MONTH_VY,'+
                            ':F_DATA,'+
                            ':L_DATA,'+
                            ':K_WO_DAY,'+
                            ':SUMMA_BOL,'+
                            ':SHIFRID,'+
                            ':SHIFRKAT,'+
                            ':SHIFRGRU,'+
                            ':NOMER_B,'+
                            ':DATA_P_BUD'+
                           ')';
              refreshSQL:='select Year_Vy,Month_Vy,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,ShifrGru,Nomer_B,Data_P_Bud from boln '+
                           ' where(  Tabno=:Tabno'+
                           ') and (     BOLN.SHIFRID = :OLD_SHIFRID'+
                            ')';
              updateSQL:='UPDATE BOLN '+
                           ' SET '+
                           ' YEAR_VY = :YEAR_VY,'+
                           ' MONTH_VY = :MONTH_VY,'+
                           ' F_DATA = :F_DATA,'+
                           ' L_DATA = :L_DATA,'+
                           ' K_WO_DAY = :K_WO_DAY,'+
                           ' SUMMA_BOL = :SUMMA_BOL,'+
                           ' SHIFRID = :SHIFRID,'+
                           ' SHIFRKAT = :SHIFRKAT,'+
                           ' SHIFRGRU = :SHIFRGRU,'+
                           ' NOMER_B = :NOMER_B,'+
                           ' DATA_P_BUD = :DATA_P_BUD,'+
                           ' DATA_P_VNE = :DATA_P_VNE '+
                     ' WHERE SHIFRID = :OLD_SHIFRID';

              deleteSQL:='DELETE FROM BOLN WHERE SHIFRID = :OLD_SHIFRID';
//              pFIBDataSetBAMODEWR.Visible:=true;
//              dxDBGridBAMODEWRNAME.Visible:=true;
        end
     else
        begin
              selectSQL:='select Year_Vy,Month_Vy,f_data,l_data,k_wo_day,'+
                         'case when summa_bol>0 then summa_bol '+
                         ' else (select sum(summa_b_bud+summa_b_vne+summa_b_gn+summa_b_nis) from boln_res where boln_res.shifridboln=boln.shifrid)'+
                         ' end as summa_bol,'+
                         ' ShifrId,ShifrKat,ShifrGru,Nomer_B,Data_P_Bud,MEAN_DAY,K_WO_DAY,MODE_V_Z,PROCENT,MEAN_DAY_BUD,MEAN_DAY_VNE,MEAN_DAY_GN,MEAN_DAY_NIS,SHIFR_STA,MODE_ILL,MODE_DAY_CLOCK,Data_P_Vne,SwidSS,CODE_REASON_ILL,SHIFRBUH,MODEWR from boln '+
                         ' where Tabno=:Tabno'+
                         ' order by F_data desc';

              insertSQL:='INSERT INTO BOLN('+
                           'YEAR_VY,'+
                           'MONTH_VY,'+
                           'F_DATA,'+
                           'L_DATA,'+
                           'K_WO_DAY,'+
                           'SUMMA_BOL,'+
                           'SHIFRID,'+
                           'SHIFRKAT,'+
                           'SHIFRGRU,'+
                           'NOMER_B,'+
                           'DATA_P_BUD'+
                         ')'+
                          'VALUES('+
                            ':YEAR_VY,'+
                            ':MONTH_VY,'+
                            ':F_DATA,'+
                            ':L_DATA,'+
                            ':K_WO_DAY,'+
                            ':SUMMA_BOL,'+
                            ':SHIFRID,'+
                            ':SHIFRKAT,'+
                            ':SHIFRGRU,'+
                            ':NOMER_B,'+
                            ':DATA_P_BUD'+
                           ')';
              refreshSQL:='select Year_Vy,Month_Vy,f_data,l_data,k_wo_day,summa_bol,ShifrId,ShifrKat,ShifrGru,Nomer_B,Data_P_Bud from boln '+
                           ' where(  Tabno=:Tabno'+
                           ') and (     BOLN.SHIFRID = :OLD_SHIFRID'+
                            ')';
              updateSQL:='UPDATE BOLN '+
                           ' SET '+
                           ' YEAR_VY = :YEAR_VY,'+
                           ' MONTH_VY = :MONTH_VY,'+
                           ' F_DATA = :F_DATA,'+
                           ' L_DATA = :L_DATA,'+
                           ' K_WO_DAY = :K_WO_DAY,'+
                           ' SUMMA_BOL = :SUMMA_BOL,'+
                           ' SHIFRID = :SHIFRID,'+
                           ' SHIFRKAT = :SHIFRKAT,'+
                           ' SHIFRGRU = :SHIFRGRU,'+
                           ' NOMER_B = :NOMER_B,'+
                           ' DATA_P_BUD = :DATA_P_BUD,'+
                           ' DATA_P_VNE = :DATA_P_VNE '+
                     ' WHERE SHIFRID = :OLD_SHIFRID';

              deleteSQL:='DELETE FROM BOLN WHERE SHIFRID = :OLD_SHIFRID';
//              pFIBDataSetBAMODEWR.Visible:=false;
//              dxDBGridBAMODEWRNAME.Visible:=false;

        end;
     pFIBDataSetBA.SQLs.SelectSQL.Clear;
     pFIBDataSetBA.SQLs.SelectSQL.Add(trim(selectSQL));
     pFIBDataSetBA.SQLs.InsertSQL.Clear;
     pFIBDataSetBA.SQLs.InsertSQL.Add(trim(insertSQL));
     pFIBDataSetBA.SQLs.RefreshSQL.Clear;
     pFIBDataSetBA.SQLs.RefreshSQL.Add(trim(refreshSQL));
     pFIBDataSetBA.SQLs.UpdateSQL.Clear;
     pFIBDataSetBA.SQLs.UpdateSQL.Add(trim(updateSQL));
     pFIBDataSetBA.SQLs.DeleteSQL.Clear;
     pFIBDataSetBA.SQLs.DeleteSQL.Add(trim(deleteSQL));

end;

procedure TFormBlnAbo.FormShow(Sender: TObject);
begin
      if WantedMode<>10 then
         begin
              Caption:='Больничные ';
              ToolButton4.Enabled:=false;
              ToolButton4.Visible:=false;
              ToolButton6.Enabled:=true;
              ToolButton6.Visible:=true;
              ToolButton7.Enabled:=true;
              ToolButton7.Visible:=true;
         end
      else
         begin
              Caption:='Командировки ';
              ToolButton4.Enabled:=true;
              ToolButton4.Visible:=true;
              ToolButton6.Enabled:=false;
              ToolButton6.Visible:=false;
              ToolButton7.Enabled:=false;
              ToolButton7.Visible:=false;
         end;
      Caption := Caption + IntToStr(WantedTabno)+' '+WantedFio;
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
      if WantedMode<>10 then
         pFIBDataSetBA.Filter:='Mode_Ill<>10'
      else
         pFIBDataSetBA.Filter:='Mode_Ill=10';
      pFIBDataSetBA.Filtered:=true;
      FormWait.Hide;
end;

procedure TFormBlnAbo.SeeBoln(Act:integer);
var
  BtnName  : string  ;
  ShifrIdB : integer ;
  s        : string  ;
  Nal_Code : string  ;
  SwidSer  : string  ;
  SwidNom  : string  ;
  SQLStmnt : string  ;
  v        : Variant ;
begin
  IF ((ACT=3) OR (ACT=2)) AND (SELF.pFIBDataSetBA.RecordCount=0) then Exit;
  if (Act=3) then
     if YesNo('Удалить больничный лист?') then
        begin
              ShifrIdB:=SELF.pFIBDataSetBA.FieldByName('SHIFRID').AsInteger;
              if ShifrIdB>0 then
                 begin
//                      FIB.pFIBQuery.SQL.Clear;
//                      FIB.pFIBQuery.SQL.Add('DELETE FROM BOLN WHERE SHIFRID='+IntToSTr(ShifrIdB));
//                      FIB.pFIBTransactionSAL.StartTransaction;
//                      try
//                         FIB.pFIBQuery.ExecQuery;
//                         FIB.pFIBQuery.Close;
//                      except
//                         MessageDlg('Ошибка удаления больничного',mtInformation, [mbOk], 0);
//                      end;
//                      FIB.pFIBTransactionSAL.Commit;
                      SQLStmnt:= 'DELETE FROM BOLN WHERE SHIFRID='+IntToSTr(ShifrIdB);
                      SQLExecute(SQLStmnt);
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
                  ActionClar  := Act;
                  WantedTabno := 0;
                  Fio         := '';
                  WorkYear    := CurrYear;
                  WorkMonth   := NMES;
                  ShifrIdBoln := 0;
                  WantedTabno := SELF.WantedTabno;
                  WantedMode  := Self.WantedMode;
                  WantedPodr  := NSRV;
                  Mode_V_Z    := 0;  // за
              // 11 10 2012 с недовольством сказали что и командировка "в" а не "за"

              //    if Self.WantedMode<>10 then // оставить за для командировочных
              //                                // 23 01 2011
                  Mode_V_Z   := 1;  // в - с 19 12 2010
                  if isLNR then
                     Mode_V_Z   := 0;  // за - с 01 10 2020

                  Mode_Ill_GLO   := 0;
                  ModeDC     := 0;
                  ModeWR     := 0; // и осн и свм
                  WantedCodeIll  := 1;
                  ShifrBuh       := CurrWrk;
                  Fio            := SELF.WantedFIO;
                  WantedTabno    := Self.WantedTabno;
                  ShifrKat := SELF.ShifrKat;
                  ShifrGru := SELF.ShifrGru;
                  { Номер свидетельства }
(*
                  S:='SELECT  NAL_CODE, SWID_SS_SER, SWID_SS_NOM FROM KADRY WHERE TABNO='+IntToStr(WantedTabno);
                  if not FIB.pFIBQuery.Transaction.Active then
                     FIB.pFIBQuery.Transaction.StartTransaction;
                  FIB.pFIBQuery.SQL.Clear;
                  FIB.pFIBQuery.SQL.Add(s);
                  try
                     FIB.pFIBQuery.ExecQuery;
                     NAL_CODE := FIB.pFIBQuery.Fields[0].AsString;
                     SwidSer  := FIB.pFIBQuery.Fields[1].AsString;
                     SwidNom  := FIB.pFIBQuery.Fields[2].AsString;
                     FIB.pFIBQuery.Close;
                  except
                        else
                            begin
                                  ShowMessage('Ошибка чистки временных таблиц отпускных');
                                  Exit;
                            end
                  end;
                  if FIB.pFIBQuery.Transaction.Active then
                     FIB.pFIBQuery.Transaction.Commit;
*)
                                //       0          1           2
                  SQLStmnt:='SELECT  NAL_CODE, SWID_SS_SER, SWID_SS_NOM FROM KADRY WHERE TABNO='+IntToStr(WantedTabno);
                  v:=SQLQueryRecValues(SQLStmnt);
                  if not VarIsArray(v) then
                     begin
                          ShowMessage('Ошибка запроса реквизитов работника');
                     end
                  else
                     begin
                          NAL_CODE := getVariantString(v[0]);
                          SwidSer  := getVariantString(v[1]);
                          SwidNom  := getVariantString(v[2]);

                     end;

                  SwidSS   := '';
                  SwidSer  := trim(SwidSer);
                  SwidNom  := trim(SwidNom);
                  if (Length(SwidSer)>0) or (Length(SwidNom)>0) then
                      SwidSS:=SwidSer+'-'+SwidNom
                  else
                     if (length(Nal_Code)=10) then
                        SwidSS:=Nal_Code;
                  if Act=1 then
                     begin
                          SQLStmnt:='EXECUTE PROCEDURE PR_DELETE_ALL_FROM_TMP_BOLN';
                          SQLExecute(SQLStmnt);
(*
                          if not FIB.pFIBQuery.Transaction.Active then
                             FIB.pFIBQuery.Transaction.StartTransaction;
                          FIB.pFIBQuery.SQL.Clear;
                          s:='EXECUTE PROCEDURE PR_DELETE_ALL_FROM_TMP_BOLN';
                          FIB.pFIBQuery.SQL.Add(s);
                          try
                               FIB.pFIBQuery.ExecQuery;
                               FIB.pFIBQuery.Close;
                          except
                               else
                                    begin
                                         ShowMessage('Ошибка чистки временных таблиц отпускных');
                                         Exit;
                                    end
                          end;
                          if FIB.pFIBQuery.Transaction.Active then
                             FIB.pFIBQuery.Transaction.Commit;
*)                             
                     end;
                  if Act<>1 then
                     begin
                          WantedTabno:=SELF.WantedTabno;
                          Fio:=SELF.WantedFIO;
                          ShifrKat:=SELF.pFIBDataSetBA.FieldByName('SHIFRKAT').AsInteger;
                          ShifrGru:=SELF.pFIBDataSetBA.FieldByName('SHIFRGRU').AsInteger;
                          ShifrIdBoln:=SELF.pFIBDataSetBA.FieldByName('SHIFRID').AsInteger;
                          NomerB:=SELF.pFIBDataSetBA.FieldByName('NOMER_B').AsString;
                          SwidSS:=SELF.pFIBDataSetBA.FieldByName('SWIDSS').AsString;
                          WantedCodeIll := SELF.pFIBDataSetBA.FieldByName('CODE_REASON_ILL').AsInteger;
                          DateTimePickerFr.Date:=SELF.pFIBDataSetBA.FieldByName('F_DATA').AsDateTime;
                          DateTimePickerTo.Date:=SELF.pFIBDataSetBA.FieldByName('L_DATA').AsDateTime;
                          WorkYear    := SELF.pFIBDataSetBA.FieldByName('YEAR_VY').AsInteger;
                          WorkMonth   := SELF.pFIBDataSetBA.FieldByName('MONTH_VY').AsInteger;
                          MeanDay     := SELF.pFIBDataSetBA.FieldByName('MEAN_DAY').AsFloat;
                          B_Day       := SELF.pFIBDataSetBA.FieldByName('K_WO_DAY').AsInteger;
                          MODE_V_Z    := SELF.pFIBDataSetBA.FieldByName('MODE_V_Z').AsInteger;
                          WantedProc  := SELF.pFIBDataSetBA.FieldByName('PROCENT').AsFloat;
                          MeanDay_Bud := SELF.pFIBDataSetBA.FieldByName('MEAN_DAY_BUD').AsFloat;
                          MeanDay_Vne := SELF.pFIBDataSetBA.FieldByName('MEAN_DAY_VNE').AsFloat;
                          MeanDay_GN  := SELF.pFIBDataSetBA.FieldByName('MEAN_DAY_GN').AsFloat;
                          MeanDay_NIS := SELF.pFIBDataSetBA.FieldByName('MEAN_DAY_NIS').AsFloat;
                          WantedShifrSta :=SELF.pFIBDataSetBA.FieldByName('SHIFR_STA').AsInteger;
                          Mode_Ill_GLO    :=SELF.pFIBDataSetBA.FieldByName('MODE_ILL').AsInteger;
                          ModeDC      :=SELF.pFIBDataSetBA.FieldByName('MODE_DAY_CLOCK').AsInteger;
                          ShifrBuh    :=SELF.pFIBDataSetBA.FieldByName('SHIFRBUH').AsInteger;
                          ModeWR      :=SELF.pFIBDataSetBA.FieldByName('MODEWR').AsInteger;
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
      if FLOW_MONTH<>NMES then Exit;
      SeeBoln(1);
end;

procedure TFormBlnAbo.ActionDelBolnExecute(Sender: TObject);
begin
     if FLOW_MONTH<>NMES then Exit;
     SeeBoln(3);
end;

procedure TFormBlnAbo.ActionMoveBolnExecute(Sender: TObject);
var ShifrIDB:integer;
    DT:TDateTime;
    Y,M,D:Word;
    Year_VY,Month_Vy:integer;
    Save_Place : TBookmark;
    Mode_Ill   : integer;

begin
  if Self.pFIBDataSetBA.RecordCount=0 then Exit;
  Year_Vy  := pFIBDataSetBA.FieldByName('YEAR_VY').AsInteger;
  Month_Vy := pFIBDataSetBA.FieldByName('MONTH_VY').AsInteger;
  Mode_Ill := pFIBDataSetBA.FieldByName('MODE_ILL').AsInteger;
  if ((Year_Vy>2010) and (Mode_Ill<>10)) then
     begin
          ShowMessage('Начиная с 01.01.2011 больничные нужно переносить по частям');
          Exit;
     end;
  if ((Year_Vy>1995) and (Year_Vy<>CurrYear)) or ((Month_Vy>0) and (Month_Vy<>NMES)) then
     begin
          if Mode_Ill=10 then
             ShowMessage('Этот командировочный начислен не в текущем месяце')
          else
             ShowMessage('Этот больничный лист начислен не в текущем месяце');
          Exit;
     end;
  ShifrIdB:=SELF.pFIBDataSetBA.FieldByName('SHIFRID').AsInteger;

  Dt:=SELF.pFIBDataSetBA.FieldByName('Data_P_Bud').AsDateTime;
  DeCodeDate(DT,Y,M,D);
  if (Y>1995) then
     begin
          if Mode_Ill=10 then
             ShowMessage('Командировочные уже перенесены')
          else
             ShowMessage('Больничный уже перенесен');
          Exit;
     end;
  if Mode_Ill=10 then
     if not YesNo('Перенести командировочные?') then Exit else
  else
     if not YesNo('Перенести больничный лист?') then Exit;
  MoveBoln(0);
  if not SELF.pFIBDataSetBA.Transaction.Active then
     begin
          SELF.pFIBDataSetBA.Transaction.StartTransaction;
{          pFIBDataSetBA.Open;}
     end;
  Save_Place:=SELF.pFIBDataSetBA.GetBookmark;
  ShowTable;
  SELF.pFIBDataSetBA.GotoBookmark(Save_Place);

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
    procedure DeleteWantedBol;
     var Curr_Add : Add_Ptr;
         Done     : boolean;
         ShifrId  : Integer;
     begin
          Done    := false;
          ShifrId := ShifrIdB mod 640000;
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
       RetVal   := true;
       Curr_Add := WantedCurrPerson^.Add;
       ShifrId  := ShifrIdB mod 640000;
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
                 if IsBolnShifr(ShifrSta)             then
                 if (B_Day>0)      and (B_Day<=31)    then
                 if (Month_Za>0)   and (Month_Za<13)  then
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
          MessageDlg('Ошибка переноса больничного.',mtInformation, [mbOk], 0);
      end;
      FIB.pFIBTransactionSAL.Commit;

 end;

procedure TFormBlnAbo.MoveBoln(Code:integer);
{ 0 - весь 5 - 5 дней 6 - остальные}
 var ShifrIdB:integer;
     Month_Vy,Year_Vy:Integer;
     DataP:TDate;
     C_Person:Person_Ptr;
     S:String;
     Sav_Person_Rec,Curr_Person_Rec:Person;
     Finded,Eq:boolean;
     Sav,Curr:array[1..L_Person_Data] of byte;
     J : integer;
 begin
      ShifrIdB   := pFIBDataSetBA.FieldByName('ShifrId').AsInteger;
      MONTH_VY   := pFIBDataSetBA.FieldByName('MONTH_VY').AsInteger;
      YEAR_VY    := pFIBDataSetBA.FieldByName('YEAR_VY').AsInteger;
//      if ((MONTH_VY<>NMES) OR (YEAR_VY<>CURRYEAR)) AND (CODE<>6) then
//         begin
//              ShowMessage('Можно перенести только начисленные в этом месяце больничный');
//              Exit;
//         end;
      if ShifrIdB=0 then Exit;
      Application.CreateForm(TFormMovBol, FormMovBol);
      FormMovBol.WantedTabno := WantedTabno;
      FormMovBol.Curr_Person := WantedCurrPerson;
      FormMovBol.ShifrIdBoln := ShifrIdB;
      FormMovBol.Mode_Ill    := WantedMode;
      FormMovBol.CodeMove    := Code; 
      FormMovBol.PrepareHints;
      Sav_Person_Rec:=WantedCurrPerson^;
      move(WantedCurrPerson^,Sav,L_Person_Data);
      FormMovBol.ShowModal;
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
procedure TFormBlnAbo.ActionPrintBolnExecute(Sender: TObject);
var ShifrIdBoln:integer;
begin
     ShifrIdBoln:=SELF.pFIBDataSetBA.FieldByName('SHIFRID').AsInteger;
     PrintBolnListM(ShifrIdBoln);
     ShowTable;
     if ShifrIdBoln>0 then
        SELF.pFIBDataSetBA.Locate('ShifrId',ShifrIdBoln,[loPartialKey]);

end;

procedure TFormBlnAbo.dxDBGridBACustomDrawCell(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
var
  Value: Variant;
  i:integer;
begin
  if ANode.HasChildren then
    Exit;
  //if not ASelected and (AColumn = dxDBGrid2PaymentAmount) then
  if not ASelected then
  begin
     i := TdxDBGrid(Sender).ColumnByFieldName('MODE_ILL').Index;
     Value := ANode.Values[i];
     if not VarIsNull(Value) then
        begin
             if Value=1 then
                AColor := clYellow
             else if Value=2 then
                AColor := clInactiveCaptionText;
        end;
  end;

end;

procedure TFormBlnAbo.ActionMoveBoln5Execute(Sender: TObject);
var ShifrIDB:integer;
    DT:TDateTime;
    Y,M,D:Word;
    Year_VY,Month_Vy:integer;
    Save_Place : TBookmark;
    Mode_Ill   : integer;
    DtBVy,DtCurr:integer;
begin
  if Self.pFIBDataSetBA.RecordCount=0 then Exit;
  Year_Vy  := pFIBDataSetBA.FieldByName('YEAR_VY').AsInteger;
  Month_Vy := pFIBDataSetBA.FieldByName('MONTH_VY').AsInteger;
  Mode_Ill := pFIBDataSetBA.FieldByName('MODE_ILL').AsInteger;
  if Mode_Ill=10 then
     begin
          ShowMessage('5 дней командировочного перенести нельзя');
          Exit;
     end;
  DtBVy:=Year_VY*12+Month_Vy;
  DtCurr:=CurrYear*12+Nmes;
  if ((Year_Vy>1995) and (Year_Vy<>CurrYear)) or ((Month_Vy>0) and (Month_Vy<>NMES)) then
     begin
         if ((DtCurr-DtBVy)<6) then
            if not YesNo('Этот больничный лист начислен не в текущем месяце.'^M'Перенести его все равно?') then
               Exit
            else
         else
             begin
                 ShowMessage('Этот больничный начислен слишком давно. Его нельзя перенести');
                 Exit;
             end;
     end;
  ShifrIdB:=SELF.pFIBDataSetBA.FieldByName('SHIFRID').AsInteger;

  Dt:=SELF.pFIBDataSetBA.FieldByName('Data_P_Bud').AsDateTime;
  DeCodeDate(DT,Y,M,D);
  if (Y>1995) then
     begin
          ShowMessage('5 дней больничного уже перенесены');
          Exit;
     end;
  if not YesNo('Перенести 5-ть дней больничного листа?') then Exit;
  MoveBoln(5);
  if not SELF.pFIBDataSetBA.Transaction.Active then
     begin
          SELF.pFIBDataSetBA.Transaction.StartTransaction;
{          pFIBDataSetBA.Open;}
     end;
  Save_Place:=SELF.pFIBDataSetBA.GetBookmark;
  ShowTable;
  SELF.pFIBDataSetBA.GotoBookmark(Save_Place);

end;

procedure TFormBlnAbo.ActionMoveBolnNot5Execute(Sender: TObject);
var ShifrIDB:integer;
    DT:TDateTime;
    Y,M,D:Word;
    Year_VY,Month_Vy:integer;
    Save_Place : TBookmark;
    Mode_Ill   : integer;
    DtBVy, DtCurr : integer;
begin
  if Self.pFIBDataSetBA.RecordCount=0 then Exit;
  Year_Vy  := pFIBDataSetBA.FieldByName('YEAR_VY').AsInteger;
  Month_Vy := pFIBDataSetBA.FieldByName('MONTH_VY').AsInteger;
  Mode_Ill := pFIBDataSetBA.FieldByName('MODE_ILL').AsInteger;
  if Mode_Ill=10 then
     begin
          ShowMessage('Командировочный перенести нельзя');
          Exit;
     end;
  if (Year_Vy<2011) then
   if (Year_Vy=2010) and (Month_Vy<12) then
     begin
          ShowMessage('Этот больничный лист начислен раньше реформы 2011 года');
          Exit;
     end;
  DtBVy:=Year_VY*12+Month_Vy;
  DtCurr:=CurrYear*12+Nmes;
  if ((Year_Vy>1995) and (Year_Vy<>CurrYear)) or ((Month_Vy>0) and (Month_Vy<>NMES)) then
     begin
         if ((DtCurr-DtBVy)<6) then
            if not YesNo('Этот больничный лист начислен не в текущем месяце.'^M'Перенести его все равно?') then
               Exit
            else
         else
             begin
                 ShowMessage('Этот больничный начислен слишком давно. Его нельзя перенести');
                 Exit;
             end;
     end;

  ShifrIdB:=SELF.pFIBDataSetBA.FieldByName('SHIFRID').AsInteger;

  Dt:=SELF.pFIBDataSetBA.FieldByName('Data_P_Vne').AsDateTime;
  DeCodeDate(DT,Y,M,D);
  if (Y>1995) then
     begin
          ShowMessage('Соц.страховская часть больничного уже перенесена');
          Exit;
     end;
  if not YesNo('Перенести Соц.страховская часть больничного листа?') then Exit;
  MoveBoln(6);
  if not SELF.pFIBDataSetBA.Transaction.Active then
     begin
          SELF.pFIBDataSetBA.Transaction.StartTransaction;
{          pFIBDataSetBA.Open;}
     end;
  Save_Place:=SELF.pFIBDataSetBA.GetBookmark;
  ShowTable;
  SELF.pFIBDataSetBA.GotoBookmark(Save_Place);

end;

procedure TFormBlnAbo.N1Click(Sender: TObject);
var Dt:TDateTime;
    y,m,d:word;
begin
      if pFIBDataSetBADATA_P_Vne.IsNull then
         begin
              ShowMessage('Соц.страховская часть больничного еще не переносилась');
              Exit;
         end;
      if YearOf(pFIBDataSetBADATA_P_Vne.value)<2010 then
         begin
              ShowMessage('Соц.страховская часть больничного еще не переносилась');
              Exit;
         end;
      if not YesNo('Вы уверены, что хотите сбросить признак переноса соц.страховской части больничного?') then Exit;
      dt:=encodedate(1990,1,1);
      pFIBDataSetBA.Edit;
      pFIBDataSetBADATA_P_Vne.value:=dt;
      pFIBDataSetBA.Post;
      pFIBDataSetBA.ApplyUpdates;
      pFIBDataSetBA.Refresh;
end;

procedure TFormBlnAbo.N51Click(Sender: TObject);
var Dt:TDateTime;
    y,m,d:word;
begin
      if pFIBDataSetBADATA_P_Bud.IsNull then
         begin
              ShowMessage('5 дней больничного еще не переносилась');
              Exit;
         end;
      if YearOf(pFIBDataSetBADATA_P_BUD.value)<2010 then
         begin
              ShowMessage('5 дней больничного еще не переносилась');
              Exit;
         end;
      if not YesNo('Вы уверены, что хотите сбросить признак переноса 5 дней больничного?') then Exit;
      dt:=encodedate(1990,1,1);
      pFIBDataSetBA.Edit;
      pFIBDataSetBADATA_P_Bud.value:=dt;
      pFIBDataSetBA.Post;
      pFIBDataSetBA.Refresh;

end;

end.
