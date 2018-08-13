unit UFormPlatGen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,UFIBModule, dxExEdtr, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, DB, FIBDataSet, pFIBDataSet, Gauges, dxEditor,
  dxEdLib, FIBDatabase, pFIBDatabase, Menus, FIBQuery, pFIBQuery, ComCtrls;

type
  TFormPlatGen = class(TForm)
    BitBtn1: TBitBtn;
    LabelSta: TLabel;
    CheckBoxYellow: TCheckBox;
    pFIBDataSetPodr: TpFIBDataSet;
    DataSourcePodr: TDataSource;
    pFIBDataSetPodrSHIFRPOD: TFIBIntegerField;
    pFIBDataSetPodrNAME: TFIBStringField;
    dxDBGridPodr: TdxDBGrid;
    dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridPodrNAME: TdxDBGridMaskColumn;
    pFIBDataSetGru: TpFIBDataSet;
    DataSourceGru: TDataSource;
    pFIBDataSetGruSHIFR: TFIBIntegerField;
    pFIBDataSetGruNAME: TFIBStringField;
    dxDBGridGRU: TdxDBGrid;
    dxDBGridGRUSHIFR: TdxDBGridMaskColumn;
    dxDBGridGRUNAME: TdxDBGridMaskColumn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    LabelCnt: TLabel;
    GaugePodr: TGauge;
    dxCalcEditNomerPlt: TdxCalcEdit;
    Label1: TLabel;
    ComboBoxBank: TComboBox;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    pFIBTransactionPodr: TpFIBTransaction;
    pFIBTransactionGru: TpFIBTransaction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    pFIBQueryP: TpFIBQuery;
    pFIBTransactionP: TpFIBTransaction;
    CheckBoxColedge: TCheckBox;
    PopupMenu2: TPopupMenu;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    LabelGruppa: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dxDBGridPodrCanNodeSelected(Sender: TObject;
      ANode: TdxTreeListNode; var Allow: Boolean);
    procedure dxDBGridPodrClick(Sender: TObject);
    procedure dxDBGridPodrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBGridPodrKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
    ShifrSta    : integer;
    WantedGru   : integer;
    ShifrBan    : integer;
    NomerPlt    : integer;
    ModeDel     : (Unknown,None,Y,N,YAll,NAll);
    NeedYellow  : boolean;
    NeedColedge : boolean;
    procedure MarkPodr;
    procedure MarkGruppy;
    procedure MakePlt;
  public
    { Public declarations }
  end;

var
  FormPlatGen: TFormPlatGen;

implementation
 uses FormSelShifrU,ScrDef,ScrLists,ScrUtil,ScrIo,UFormPlatReestr,UFormView,
  UFormSaveSelPodr, UFormSelSelection, FormSelSppU;


{$R *.dfm}

procedure TFormPlatGen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if pFIBDataSetPodr.Active then
         pFIBDataSetPodr.Close;
      if pFIBDataSetGru.Active  then
         pFIBDataSetGru.Close;
      if pFIBDataSetPodr.Transaction.Active then
         pFIBDataSetPodr.Transaction.Commit;
      if pFIBDataSetGru.Transaction.Active then
         pFIBDataSetGru.Transaction.Commit;
      if FIB.pFIBQuery.Transaction.Active then
         FIB.pFIBQuery.Transaction.Commit;
      Action := caFree;
end;

procedure TFormPlatGen.BitBtn1Click(Sender: TObject);
 var A:TShowShifrMode;
begin
      with TFormSelShifr.Create(nil) do
         try
             SetShifr(ShifrSta,UdMode);
             if execute then
                begin
                      A                 := UdMode;
                      ShifrSta          := GetShifr(A);
                      LabelSta.Caption  := IntToStr(ShifrSta)+' '+Trim(ShifrList.GetName(ShifrSta));
                end;
         finally
             free;
         end;
      RePaint;


end;

procedure TFormPlatGen.FormCreate(Sender: TObject);
var i:Integer;
begin
      WantedGru := 0;
      ShifrBan  := 0;
      NomerPlt  := 1;
      CheckBoxYellow.Checked:=false;
      NameServList.ClearAllSelected;
      LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
      GaugePodr.Hide;
      GaugePodr.Left   := 10;
      GaugePodr.Top    := 10;
      GaugePodr.Height := 50;
      GaugePodr.Width  := 50;
      ModeDel          := Unknown;
      NeedYellow       := false;
      NeedColedge      := false;
      ShifrSta         := 102;
      LabelSta.Caption := IntToStr(ShifrSta)+' '+Trim(ShifrList.GetName(ShifrSta));
      for i:=1 to BankiList.Count do
          ComboBoxBank.Items.Add(BankiList.getBankNameByNo(i));
      ComboBoxBank.Items.Add('Касса');


end;

procedure TFormPlatGen.FormShow(Sender: TObject);
begin
      if not pFIBDataSetPodr.Transaction.Active then
         pFIBDataSetPodr.Transaction.StartTransaction ;
      if not pFIBDataSetGru.Transaction.Active then
         pFIBDataSetGru.Transaction.StartTransaction ;
      if not pFIBDataSetGru.Active  then pFIBDataSetGru.Active  := true;
      if not pFIBDataSetPodr.Active then pFIBDataSetPodr.Active := true;
      GaugePodr.Hide;
      GaugePodr.Left   := 10;
      GaugePodr.Top    := 10;
      GaugePodr.Height := 50;
      GaugePodr.Width  := 50;

end;


procedure TFormPlatGen.MarkPodr;
var
  i, j, k: Integer;
begin
  if dxDBGridPodr.SelectedCount>0 then
    with dxDBGridPodr.DataSource.DataSet do
      for i:=0 to dxDBGridPodr.SelectedCount-1 do
      begin
{           GotoBookmark(pointer(dxDBGridPodr.SelectedRows.Items[i]));}
{           j:=Fields[0].AsInteger;}
           val(dxDBGridPodr.SelectedNodes[i].Strings[0],j,k);
           if k=0 then
               if j>0 then
                  NameServList.SetSelected(j);
      end;
end;

procedure TFormPlatGen.MarkGruppy;
var
  i, j, k: Integer;
begin
  for i:=1 to Max_Gruppa do CURR_GRUPPA[i]:=false;
  if dxDBGridGru.SelectedCount>0 then
    with dxDBGridGru.DataSource.DataSet do
      for i:=0 to dxDBGridGru.SelectedCount-1 do
      begin
{           GotoBookmark(pointer(dxDBGridPodr.SelectedRows.Items[i]));}
{           j:=Fields[0].AsInteger;}
           val(dxDBGridGru.SelectedNodes[i].Strings[0],j,k);
           if k=0 then
               if j>0 then
                  CURR_GRUPPA[j]:=true;
      end;
end;

procedure TFormPlatGen.MakePlt;
 var i,NSRVT     : integer;
     Curr_Person : Person_Ptr;
     Curr_Ud     : Ud_Ptr;
     Modified    : boolean;
     MakedHeader : boolean;
     ShifrId     : integer;
     LineNo      : integer;
     IsVypl      : boolean;
     I_Gruppy    : integer;
     GruppyListStr : string;
     PodrListStr   : string;
     Mode_U_K      : integer;
     cntGrp      : Integer;
   function ExistAnyPlat:boolean;
    var CondPodr : string;
        ICnt     : integer;
        SQLStmnt : string;
    begin
       CondPodr:='';
(*
       if Fib.pFIBQuery.Open then
          Fib.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
*)
//       FIB.pFIBQuery.SQL.Add('select count(*) from TB_PLAT_HAT where');
(*       FIB.pFIBQuery.SQL.Add(' MONTHVY='+IntToStr(NMES)+' AND YEARVY='+IntToStr(WORK_YEAR_VAL));
       FIB.pFIBQuery.SQL.Add(' AND SHIFRGRU IN ('+GruppyListStr+')');
       FIB.pFIBQuery.SQL.Add(' AND SHIFRPOD IN ('+PodrListStr+')');
       FIB.pFIBQuery.SQL.Add(' AND SHIFRSTA='+IntToStr(ShifrSta));
       FIB.pFIBQuery.SQL.Add(' AND SHIFRBAN='+IntToStr(ShifrBan));
       FIB.pFIBQuery.SQL.Add(' AND MODE_U_K='+IntToStr(Mode_U_K));
       try
          FIB.pFIBQuery.ExecQuery;
       except
          ShowMessage('Не выполнилась проверка существования платежных ведомостей');
          Exit;
       end;
       ICnt:=FIB.pFIBQuery.Fields[0].AsInteger;
       Fib.pFIBQuery.Close;
*)
       SQLStmnt:='select count(*) from TB_PLAT_HAT where';
       SQLStmnt:=Trim(SQLStmnt)+' MONTHVY='+IntToStr(NMES)+' AND YEARVY='+IntToStr(WORK_YEAR_VAL);
       SQLStmnt:=Trim(SQLStmnt)+' AND SHIFRGRU IN ('+GruppyListStr+')';
       SQLStmnt:=Trim(SQLStmnt)+' AND SHIFRPOD IN ('+PodrListStr+')';
       SQLStmnt:=Trim(SQLStmnt)+' AND SHIFRSTA='+IntToStr(ShifrSta);
       SQLStmnt:=Trim(SQLStmnt)+' AND SHIFRBAN='+IntToStr(ShifrBan);
       SQLStmnt:=Trim(SQLStmnt)+' AND MODE_U_K='+IntToStr(Mode_U_K);
       try
         ICnt:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
       except
         else
          begin
               ShowMessage('Не выполнилась проверка существования платежных ведомостей '+SQLStmnt);
               Exit;
          end
       end;
       if ICnt>0 then Result:=true
                 else Result:=false;
    end;
   procedure DeletePlat(WantedNsrv:integer);
    var CondPodr:string;
    begin
       if Fib.pFIBQuery.Open then
          Fib.pFIBQuery.Close;
       CondPodr:='';
       if (WantedNSRV>0) then
          CondPodr:='ShifrPod='+IntToSTr(WantedNsrv)+' and';
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('DELETE FROM TB_PLAT_HAT WHERE');
       if WantedNSRV>0 then
          FIB.pFIBQuery.SQL.Add(' '+AllTrim(CondPodr));
       FIB.pFIBQuery.SQL.Add(' MONTHVY='+IntToStr(NMES)+' AND YEARVY='+IntToStr(WORK_YEAR_VAL));
       FIB.pFIBQuery.SQL.Add(' AND SHIFRGRU IN ('+GruppyListStr+')');
       FIB.pFIBQuery.SQL.Add(' AND SHIFRSTA='+IntToStr(ShifrSta));
       FIB.pFIBQuery.SQL.Add(' AND SHIFRBAN='+IntToStr(ShifrBan));
       FIB.pFIBQuery.SQL.Add(' AND MODE_U_K='+IntToStr(Mode_U_K));
       try
          FIB.pFIBQuery.ExecQuery;
       except
          ShowMessage('Не выполнилось удаление платежной ведомости');
          Exit;
       end;
       Fib.pFIBQuery.Close;
    end;

 procedure MakeHeader;
  var S,DS:String;
      KZ:Word;
      i : integer;
      SQLStmnt:string;
  begin

     { Начало MakeHeader }
//       S:='SELECT COUNT(*) FROM TB_PLAT_HAT WHERE SHIFRPOD=';
(*
       S:=S+IntToStr(NSRV);
       S:=S+' AND MONTHVY='+IntToStr(NMES)+' AND YEARVY='+IntToStr(CurrYear);
       S:=S+' AND SHIFRGRU IN ('+trim(GruppyListStr)+')';
       S:=S+' AND SHIFRSTA='+IntToStr(ShifrSta);
       S:=S+' AND SHIFRBAN='+IntToStr(ShifrBan);
       S:=S+' AND MODE_U_K='+IntToStr(MODE_U_K);
       if Fib.pFIBQuery.Open then
          Fib.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add(S);
       try
          FIB.pFIBQuery.ExecQuery;
          ShifrId:=FIB.pFIBQuery.Fields[0].AsInteger;
       except
          ShowMessage('Не выполнилась проверка наличия платежной ведомости');
          Exit;
       end;
       if Fib.pFIBQuery.Open then
          Fib.pFIBQuery.Close;
       if ShifrId>0 then
          begin
                if not (ModeDel=YAll) then
                   begin
                        case ShifrBan of
                         0: ds:='Касса';
                         1: ds:='ПриватБанк';
                        else
                           ds:='БрокБизнесБанк';
                        end;
                        S:='Платежная ведомость для '+trim(NAME_SERV(NSRV))+' '+trim(GET_IST_NAME(WantedGru));
                        S:=s+' '+trim(ShifrList.GetName(ShifrSta))+' '+Trim(DS);
                        s:=s+' в '+trim(MONTH[NMES])+' '+IntToStr(CurrYear)+' уже есть в базе данных. Удалить?';
                        kz:=MessageDlg(S,mtCustom,[mbYes, mbYesToAll, mbNo, mbNoToAll, mbCancel],0);
                   end
                else
                   begin
                        kz:=2;
                   end;
                case kz of
                  1 :              { mbNo       }
                     begin
                          ModeDel:=None;
                          Exit;
                     end;
                  6 :              { mbYes      }
                     begin
                          DeletePlat(NSRV);
                     end;
                  4 :              { mbCancel   }
                     begin
                          ModeDel:=None;
                          Exit;
                     end;
                 10 :              { mbYesToAll }
                     begin
                          DeletePlat(0);
                          ModeDel := YAll;
                     end
                end;
          end;
*)
       SHIFRID:=0;
       try
         SHIFRID:=FIB.pFIBDatabaseSal.QueryValue('SELECT COUNT(*) FROM TB_PLAT_HAT',0);
       except
         else
            begin
                 ShowMessage('Ошибка SQL в операторе SELECT COUNT(*) FROM TB_PLAT_HAT');
                 Exit;
            end
       end;
       if ShifrId>0 then
          begin
               try
                  SHIFRID:=FIB.pFIBDatabaseSal.QueryValue('SELECT MAX(SHIFRID) FROM TB_PLAT_HAT',0);
               except
                  else
                     begin
                         ShowMessage('Ошибка SQL в операторе SELECT COUNT(*) FROM TB_PLAT_HAT');
                         Exit;
                     end
               end
          end;
       Inc(ShifrId);
{       DateTimeToString(DS,'yyyy-mm-dd',Now);}
       DS:=Fib.pFIBQuery.Database.Name;
       DS:=DateToStr(Date);
(*
       if Fib.pFIBQuery.Open then
          Fib.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('INSERT INTO TB_PLAT_HAT (SHIFRID,NOMER,MONTHVY,YEARVY,SHIFRPOD,SHIFRGRU,');
       FIB.pFIBQuery.SQL.Add('SHIFRBAN,SHIFRSTA,DATAVY,MODE_U_K) VALUES (');
       FIB.pFIBQuery.SQL.Add(IntToStr(SHIFRID)+',');
       FIB.pFIBQuery.SQL.Add(IntToStr(NomerPlt)+','+IntToStr(NMES)+','+IntToStr(WORK_YEAR_VAL)+',');
       FIB.pFIBQuery.SQL.Add(IntToStr(NSRV)+','+IntToStr(WantedGru)+','+IntToStr(ShifrBan)+','+IntToStr(ShifrSta)+',');
       FIB.pFIBQuery.SQL.Add(''''+ds+''','+IntToStr(MODE_U_K)+')');
       try
          FIB.pFIBQuery.ExecQuery;
       except
          ShowMessage('Не создался заголовок платежной ведомости');
       end;
*)       
       SQLStmnt:='INSERT INTO TB_PLAT_HAT (SHIFRID,NOMER,MONTHVY,YEARVY,SHIFRPOD,SHIFRGRU,';
       SQLStmnt:=Trim(SQLStmnt)+ ' SHIFRBAN,SHIFRSTA,DATAVY,MODE_U_K) VALUES (';
       SQLStmnt:=Trim(SQLStmnt)+ IntToStr(SHIFRID)+',';
       SQLStmnt:=Trim(SQLStmnt)+ IntToStr(NomerPlt)+','+IntToStr(NMES)+','+IntToStr(WORK_YEAR_VAL)+',';
       SQLStmnt:=Trim(SQLStmnt)+ IntToStr(NSRV)+','+IntToStr(WantedGru)+','+IntToStr(ShifrBan)+','+IntToStr(ShifrSta)+',';
       SQLStmnt:=Trim(SQLStmnt)+ ''''+ds+''','+IntToStr(MODE_U_K)+')';
       FIB.pFIBDatabaseSal.Execute(SQLStmnt);
       MakedHeader := true;
       inc(NomerPlt);
  end;
 procedure MakeStringUdPlt;
  var S,C:string;
      SQLStmnt:string;
  begin
       C:=Trim(CURR_PERSON^.FIO);
       if Length(Trim(C))=0 then C:=' ';
       C:=ReplQuot(C);
       Inc(LineNo);
       s:='INSERT INTO TB_PLAT_PR (SHIFRIDPLAT,LINENO,TABNO,FIO,SUMMA) ';
       s:=s+' VALUES (';
       s:=s+IntToStr(ShifrId)+',';
       s:=s+IntToStr(LineNo)+','+IntToStr(Curr_Person^.Tabno)+','''+Trim(C)+''','+TRIM(ReplChar(FORMAT('%10.2f',[Curr_ud^.Summa]),',','.'))+')';
       SQLStmnt:=s;
    (*
       if Fib.pFIBQuery.Open then
          Fib.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add(S);

*)
       try
          FIB.pFIBDatabaseSal.Execute(SQLStmnt);
       except
         else
          ShowMessage('Ошибка записи строки в таблицу платежной ведомости '+S);
       end;
  end;
procedure MakeItogiPodrPlat;
 var s:string;
     SQLStmnt:string;
 begin

       SQLStmnt:='update tb_plat_hat ';
       SQLStmnt:=Trim(SQLStmnt)+' set tb_plat_hat.nmbofrec=(select count(*) from tb_plat_pr where tb_plat_pr.shifridplat=tb_plat_hat.shifrid),';
       SQLStmnt:=Trim(SQLStmnt)+' tb_plat_hat.summatot =(select sum(tb_plat_pr.summa) from tb_plat_pr where tb_plat_pr.shifridplat=tb_plat_hat.shifrid)';
       SQLStmnt:=Trim(SQLStmnt)+' where tb_plat_hat.ShifrId='+IntToStr(ShifrId);
(*
       if FIB.pFIBQuery.Open then
          Fib.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('update tb_plat_hat ');
*)
//       FIB.pFIBQuery.SQL.Add('set tb_plat_hat.nmbofrec=(select count(*) from tb_plat_pr where tb_plat_pr.shifridplat=tb_plat_hat.shifrid),');
(*       FIB.pFIBQuery.SQL.Add('tb_plat_hat.summatot =(select sum(tb_plat_pr.summa) from tb_plat_pr where tb_plat_pr.shifridplat=tb_plat_hat.shifrid)');
       FIB.pFIBQuery.SQL.Add(' where tb_plat_hat.ShifrId='+IntToStr(ShifrId));
       Fib.pFIBQuery.Close;
*)
       try
          FIB.pFIBDataBaseSal.Execute(SQLStmnt);
       except
          else
          ShowMessage('Ошибка подсчета сумм платежных поручений');
       end;

 end;
procedure MakeYellowAll;
 var Curr_Add:Add_Ptr;
     Curr_Ud:Ud_Ptr;
 begin
     Curr_Add:=Curr_Person^.ADD;
     while Curr_Add<>Nil do
      begin
           Curr_Add^.VYPLACHENO:=Get_Out;
           Curr_Add:=Curr_Add^.NEXT;
      end;
     Curr_UD:=Curr_Person^.UD;
     while Curr_UD<>Nil do
      begin
           Curr_UD^.VYPLACHENO:=Get_Out;
           Curr_UD:=Curr_UD^.NEXT;
      end;
 end;
 begin
      { Начало MakePlt }
      { Проверить наличие существующих платежек }
       ModeDel  := Unknown;
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       FIB.pFIBQuery.Transaction.StartTransaction;


       if NeedColedge then Mode_U_K:=1
                      else Mode_U_K:=0;

       {      Построить список выбранных счетов }
       GruppyListStr:='';
       CntGrp:=0;
       for i:=1 to MAX_GRUPPA do
           begin
                if CURR_GRUPPA[I] then
                   begin
                        Inc(cntGrp);
                        if length(trim(GruppyListStr))>0 then
                           GruppyListStr:=GruppyListStr+',';
                        GruppyListStr:=GruppyListStr+trim(IntToStr(i));
                   end;

           end;
       {      Построить список подразделений }
       PodrListStr:='';
       for i:=1 to Count_Serv do
           begin
                 if not NameServList.IsSelected(i) then continue;
                 if length(trim(PodrListStr))>0 then
                    PodrListStr:=PodrListStr+',';
                 PodrListStr:=PodrListStr+trim(IntToStr(i));
           end;

       if ExistAnyPlat then
          begin
                ModeDel := YAll;
                DeletePlat(0);
          end;

      { выполнить формирование                  }
      dxDBGridPodr.Hide;
      GaugePodr.Top      := dxDBGridPodr.Top    ;
      GaugePodr.Left     := dxDBGridPodr.Left   ;
      GaugePodr.Width    := dxDBGridPodr.Width  ;
      GaugePodr.Height   := dxDBGridPodr.Height ;
      if GaugePodr.Height>GaugePodr.Width then GaugePodr.Height:=GaugePodr.Width;
      if GaugePodr.Width>GaugePodr.Height then GaugePodr.Width:=GaugePodr.Height;

      GaugePodr.MinValue := 1 ;
      GaugePodr.MaxValue := COUNT_SERV*cntGrp;
      GaugePodr.Height   := dxDBGridPodr.Height-ProgressBar1.Height-LabelPodr.Height-LabelGruppa.Height ;
      GaugePodr.Progress := 1 ;
      ProgressBar1.Top:=GaugePodr.Top+GaugePodr.Height;
      ProgressBar1.Min:=0;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Position:=0;
      ProgressBar1.Left:=GaugePodr.Left;
      ProgressBar1.Width:=GaugePodr.Width;
      LabelGruppa.Top:=ProgressBar1.Top+ProgressBar1.Height;
      LabelGruppa.Left:=ProgressBar1.Left;
      LabelGruppa.Width:=ProgressBar1.Width;
      LabelGruppa.Caption:='';
      LabelPodr.Top:=LabelGruppa.Top+LabelGruppa.Height;      LabelPodr.Left:=ProgressBar1.Left;
      LabelPodr.Width:=ProgressBar1.Width;
      LabelPodr.Caption:='';

      ProgressBar1.Show ;
      GaugePodr.Show    ;
      LabelPodr.Show    ;
      LabelGruppa.Show  ;

      NSRVT := NSRV;
      PutInf;
      WHILE HEAD_PERSON<>NIL DO DEL_PERSON(HEAD_PERSON);
      for I_GRUPPY:=1 to MAX_GRUPPA do
          begin
               if not CURR_GRUPPA[I_GRUPPY] then
                  begin
//                       GaugePodr.Progress:=GaugePodr.Progress+COUNT_SERV;
//                       Application.ProcessMessages;
                       continue;
                  end;
               WantedGru := I_GRUPPY;
               ProgressBar1.Position:=0;
               LabelGruppa.Caption:=GET_IST_NAME(I_GRUPPY);
               FOR I:=1 TO COUNT_SERV DO
                   BEGIN
                        NSRV:=I;
                        if ((i=57) or (i=169)) then
                             Curr_Person:=Head_Person;
{                        GaugePodr.Progress:=i;}
                        GaugePodr.Progress:=GaugePodr.Progress+1;
                        ProgressBar1.Position:=i;
                        LabelPodr.Caption:=Name_Serv(NSRV);
                        Application.ProcessMessages;
                        if not NameServList.IsSelected(NSRV) then continue;
                        MKFLNM;
                        if not FileExists(FNINF) then continue;
                        GETINF(TRUE);
                        Curr_Person:=Head_Person;
                        Modified:=false;
                        MakedHeader:=false;
                        LineNo := 0;
                        while (Curr_Person<>Nil) do
                              begin
(*
                                    if ((ShifrBan=1) and IsPrivatBankPerson(Curr_Person)) or
                                       ((ShifrBan=2) and IsBrokBiznesBankPerson(Curr_Person)) or
                                       ((ShifrBan=3) and IsUkrSibBankPerson(Curr_Person)) or
                                       ((ShifrBan=0) and IsKassaPerson(Curr_Person)) then
*)
                                    if (ShifrBan=Curr_Person.BANK) then
                                    if (Curr_Person^.GRUPPA=WantedGru) then
                                        begin
                                             IsVypl := false;
                                             Curr_Ud:=Curr_Person^.UD;
                                             while (Curr_Ud<>Nil) do
                                                    begin
                                                         if Curr_Ud^.Shifr=ShifrSta then
                                                            begin
                                                                 Curr_Ud^.VYPLACHENO := GET_OUT;
                                                                 IsVypl := true;
                                                                 Modified := true;
                                                                 if not MakedHeader then
                                                                    begin
                                                                         MakeHeader;
                                                                         if ModeDel=None then break;
                                                                    end;
                                                                 MakeStringUdPlt;
                                                            end;
                                                         Curr_Ud:=Curr_Ud^.NEXT;
                                                    end;
                                             if (IsVypl and NeedYellow) then
                                                 MakeYellowAll;
                                        end;     {Приват Брокбизнес Касса}
                                    if ModeDel=None then break;
                                    Curr_Person:=Curr_Person^.NEXT;
                              end;
                        if ModeDel<>None then
                           begin
                                if MakedHeader then MakeItogiPodrPlat;
                                if Modified then PUTINF;
                           end;
                        WHILE HEAD_PERSON<>NIL DO DEL_PERSON(HEAD_PERSON);
                        if ModeDel=None then break;
                   END;    { end of count_serv}
          end;             { end of cycle by gruppy} 
      if FIB.pFIBQuery.Open then
         FIB.pFIBQuery.Close;
      if FIB.pFIBQuery.Transaction.Active then
         FIB.pFIBQuery.Transaction.Commit;
      GaugePodr.Hide;
      ProgressBar1.Hide;
      LabelPodr.Hide;
      dxDBGridPodr.Show;
      NSRV:=NSRVT;
      MKFLNM;
      GetInf(TRUE);

 end;

procedure TFormPlatGen.BitBtn2Click(Sender: TObject);
var i:integer;
    NomerPltS:string;
    S:string;
begin
     if ((ShifrList.IsAdd(ShifrSta)) or (ShifrSta<1)) then
        begin
             ShowMessage('Укажите статью удержаний');
             Exit;
        end;
     NomerPltS:=dxCalcEditNomerPlt.Text;
     val(NomerPltS,NomerPlt,I);
     if i<>0 then
        begin
             ShowMessage('Неверно указан номер платежной ведомости');
             Exit;
        end;
     if dxDBGridGru.SelectedCount<1 then
        begin
             ShowMessage('Укажите счета');
             Exit;
        end;
     NameServList.ClearAllSelected;
     if dxDBGridPodr.SelectedCount<1 then
        begin
             ShowMessage('Укажите подразделения');
             Exit;
        end;
     MarkPodr;
     for i:=1 to Max_Gruppa do CURR_GRUPPA[i]:=false;
     WantedGru:=pFIBDataSetGru.FieldByName('SHIFR').AsInteger;
     MarkGruppy;
     NeedYellow  := CheckBoxYellow.Checked;
     NeedColedge := CheckBoxColedge.Checked;
     ShifrBan:=BankiList.getBankShifrByItemNo(ComboBoxBank.ItemIndex);
(*
     ShifrBan    := ComboBoxBank.ItemIndex;
     case ShifrBan of
       0: ShifrBan:=1;
       1: ShifrBan:=2;
       2: ShifrBan:=3;
       3: ShifrBan:=0;
     end;
*)
     S:=FIB.pFIBQuery.Database.Name;
     MakePlt;


end;

procedure TFormPlatGen.dxDBGridPodrCanNodeSelected(Sender: TObject;
  ANode: TdxTreeListNode; var Allow: Boolean);
begin
    LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
    LabelCnt.Repaint;
    Application.ProcessMessages;
end;

procedure TFormPlatGen.dxDBGridPodrClick(Sender: TObject);
begin
    LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
    LabelCnt.Repaint;
    Application.ProcessMessages;
end;

procedure TFormPlatGen.dxDBGridPodrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     dxDBGridPodrClick(Sender);
end;

procedure TFormPlatGen.dxDBGridPodrKeyPress(Sender: TObject;
  var Key: Char);
begin
     dxDBGridPodrClick(Sender);
end;

procedure TFormPlatGen.BitBtn4Click(Sender: TObject);
var Mode_U_K : integer;
begin
     if ((ShifrList.IsAdd(ShifrSta)) or (ShifrSta<1)) then
        begin
             ShowMessage('Укажите статью удержаний');
             Exit;
        end;
     WantedGru:=pFIBDataSetGru.FieldByName('SHIFR').AsInteger;


     NeedColedge := CheckBoxColedge.Checked;
     if NeedColedge then Mode_U_K := 1
     else Mode_U_K := 0;
     ShifrBan := BankiList.getBankShifrByItemNo(ComboBoxBank.ItemIndex);
(*
     ShifrBan:=ComboBoxBank.ItemIndex;
     case ShifrBan of
       0: ShifrBan:=1;
       1: ShifrBan:=2;
       2: ShifrBan:=3;
       3: ShifrBan:=0;
     end;
*)
     MarkGruppy;
     Application.CreateForm(TFormPlatReestr, FormPlatReestr);
     FormPlatReestr.MonthVy    := NMES;
     FormPlatReestr.YearVy     := WORK_YEAR_VAL;
     FormPlatReestr.ShifrBan   := ShifrBan;
     FormPlatReestr.ShifrSta   := ShifrSta;
     FormPlatReestr.ShifrGru   := WantedGru;
     FormPlatReestr.Mode_U_K   := Mode_U_K;
     FormPlatReestr.ShowModal;

end;

procedure TFormPlatGen.BitBtn5Click(Sender: TObject);
var HatPrinted:boolean;
    SummaTot:real;
    dev:TextFile;
    FName:String;

procedure PrintHat;
 var S:String;
 begin
      s:='_rplt';
      if ShifrBan>0 then
         FName:=cdoc+'disk\'+trim(bankiList.getBankDir(shifrBan))+'\'+trim(s)+'.txt'
(*
      if ShifrBan=1 then FName:=cdoc+'disk\Privat\'+trim(s)+'.txt'
                    else
      if ShifrBan=2 then FName:=cdoc+'disk\BrokB\'+trim(s)+'.txt'
                    else
      if ShifrBan=3 then FName:=cdoc+'disk\UkrSib\'+trim(s)+'.txt'
*)
                    else FName:=cdoc+'disk\'+trim(s)+'.txt';
      AssignFile(dev,FNAme);
      ReWrite(Dev);
      if shifrban<1 then
         s:='кассу'
      else
         s:=BankiList.getBankName(ShifrBan);
(*
      case ShifrBan of
        1: S:='Приватбанк';
//        2: S:='Брокбизнесбанк';
        2: S:='УкрСоцБанк';
        3: S:='УкрСибБанк';
      else S:='Кассу';
      end;
*)
      Writeln(dev,'Реестр сумм перечисленных в '+S);
      Writeln(dev,MONTH[nmes]+' '+IntToStr(WORK_YEAR_VAL)+' г.');
      Writeln(dev,IntToStr(ShifrSta)+' '+Trim(ShifrList.GetName(ShifrSta)));
      SummaTot:=0;
      HatPrinted:=true;
 end;
procedure PrintLine;
 begin
      writeln(dev,copy(GET_ISt_NAME(FIB.pFIBQuery.Fields[0].AsInteger)+Space(20),1,20)+':'+
                  format('%12.2f',[FIB.pFIBQuery.Fields[1].AsFloat])+':');
      SummaTot:=SummaTot + FIB.pFIBQuery.Fields[1].AsFloat;
 end;
procedure PrintFooter;
 begin
      writeln(dev,copy('И т о г о'+Space(20),1,20)+':'+
                  format('%12.2f',[SummaTot])+':');
      CloseFile(Dev);
      View(FName);
 end;
begin
     if ((ShifrList.IsAdd(ShifrSta)) or (ShifrSta<1)) then
        begin
             ShowMessage('Укажите статью удержаний');
             Exit;
        end;
     ShifrBan := bankiList.getBankShifrByItemNo(ComboBoxBank.ItemIndex);
(*
     ShifrBan:=ComboBoxBank.ItemIndex;
     case ShifrBan of
       0: ShifrBan:=1;
       1: ShifrBan:=2;
       2: ShifrBan:=3;
       3: ShifrBan:=0;
     end;
*)
     if not Fib.pFIBQuery.Transaction.Active then
        Fib.pFIBQuery.Transaction.StartTransaction;
     if Fib.pFIBQuery.Open then
        Fib.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select shifrgru,sum(summatot) from tb_plat_hat');
     FIB.pFIBQuery.SQL.Add('where monthvy='+IntToStr(NMES)+' and yearvy='+IntToStr(WORK_YEAR_VAL)+' and shifrsta='+IntToStr(ShifrSta));
     FIB.pFIBQuery.SQL.Add('group by shifrgru');
     try
        FIB.pFIBQuery.ExecQuery;
        while not FIB.pFIBQuery.EOF do
         begin
              if Not HatPrinted then PrintHat;
              PrintLine;
              FIB.pFIBQuery.Next;
         end;
        if HatPrinted then PrintFooter
        else
           ShowMessage('Не было перечислений в багк по этой статье');

     except
        ShowMessage('Ошибка подготовки свода перечисленных в банк сумм');
        Exit;
     end;
     if Fib.pFIBQuery.Open then
        Fib.pFIBQuery.Close;
     if Fib.pFIBQuery.Transaction.Active then
        Fib.pFIBQuery.Transaction.Commit;

end;

procedure TFormPlatGen.N2Click(Sender: TObject);
var I,J,K   : integer;
    ItemRec : PItemRec;
begin
     if dxDBGridPodr.SelectedCount<1 then
        begin
              ShowMessage('Не отмечено ни одного подразделения');
              Exit;
        end;
     Application.CreateForm(TFormSaveSelPodr, FormSaveSelPodr);
     FormSaveSelPodr.WantedMode:=1; { Список подразделений }
     for i:=0 to dxDBGridPodr.SelectedCount-1 do
      begin
           val(dxDBGridPodr.SelectedNodes[i].Strings[0],j,k);
           if k=0 then
               if j>0 then
                  begin
                       NameServList.SetSelected(j);
                       New(ItemRec);
                       ItemRec^.Month := j;
                       ItemRec^.Year  := 0;
                       FormSaveSelPodr.PodrList.Add(ItemRec);
                  end;
      end;

     FormSaveSelPodr.ShowModal;

end;

procedure TFormPlatGen.N1Click(Sender: TObject);
  var ShifrIdMain,ShifrPod,i:integer;
 procedure MarkSelPodr(ShifrPod:Integer);
  var I,j,k:integer;
      Finded:boolean;
  begin
  {
       Finded:=false;
       pFIBDataSetPodr.Last;
       while not pFIBDataSetPodr.Bof do
        begin
             if (ShifrPod=pFIBDataSetPodrSHIFRPOD.AsInteger) then
                 begin
                      pFIBDataSetPodr.GetBookmark;
                      finded:=true;
                      break;
                 end;
             pFIBDataSetPodr.Prior;
        end;
       exit;
   }

       for i:=0 to dxDBGridPodr.Count-1 do
           begin
                val(dxDBGridPodr.Items[i].Strings[0],j,k);
                if k=0 then
                   if j=ShifrPod then
                      begin
                           dxDBGridPodr.Items[i].Focused:=true;
                           dxDBGridPodr.Items[i].Selected:=true;
{                           dxDBGridPodr.SelectedNodes.Add(dxDBGridPodr.Items[i]);}
                           Break;
                      end;
            end;

  end;
begin
     Application.CreateForm(TFormSelSelection, FormSelSelection);
     FormSelSelection.WantedMode:=1;  { Подразделения }
     ShifrIdMain:=FormSelSelection.Execute;
     if ShifrIdMain<1 then Exit;
     NameServList.ClearAllSelected;
     dxDBGridPodr.ClearSelection;
 {
     for i:=0 to dxDBGridPodr.Count-1 do
         dxDBGridPodr.Items[0].Selected:=false;
 }
     pFibQueryP.Transaction.StartTransaction;
     pFibQueryP.SQL.Clear;
     pFibQueryP.SQL.Add('select shifrpod from tb_podr_selection_list where shifridowner='+IntToSTr(ShifrIdMain)+' and mode=1');
     pFibQueryP.ExecQuery;
     while not pFibQueryP.Eof do
      begin
           ShifrPod:=pFibQueryP.Fields[0].AsInteger;
           MarkSelPodr(ShifrPod);
           pFibQueryP.Next;
      end;
     LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
     LabelCnt.Repaint;
     Application.ProcessMessages;

     pFibQueryP.Transaction.Commit;

end;

procedure TFormPlatGen.N4Click(Sender: TObject);
var I,J,K   : integer;
    ItemRec : PItemRec;
begin
     if dxDBGridGru.SelectedCount<1 then
        begin
              ShowMessage('Не отмечено ни одного счета');
              Exit;
        end;
     Application.CreateForm(TFormSaveSelPodr, FormSaveSelPodr);
     FormSaveSelPodr.WantedMode:=2; { Список счетов }
     for i:=0 to dxDBGridGru.SelectedCount-1 do
      begin
           val(dxDBGridGru.SelectedNodes[i].Strings[0],j,k);
           if k=0 then
               if j>0 then
                  begin
                       Curr_Gruppa[j]:=true;
                       New(ItemRec);
                       ItemRec^.Month := j;
                       ItemRec^.Year  := 0;
                       FormSaveSelPodr.PodrList.Add(ItemRec);
                  end;
      end;
     FormSaveSelPodr.ShowModal;
end;

procedure TFormPlatGen.N3Click(Sender: TObject);
  var ShifrIdMain,ShifrGru,i:integer;
 procedure MarkSelGruppy(ShifrGru:Integer);
  var I,j,k:integer;
      Finded:boolean;
  begin

       for i:=0 to dxDBGridGru.Count-1 do
           begin
                val(dxDBGridGru.Items[i].Strings[0],j,k);
                if k=0 then
                   if j=ShifrGru then
                      begin
                           dxDBGridGru.Items[i].Focused:=true;
                           dxDBGridGru.Items[i].Selected:=true;
                           Break;
                      end;
            end;

  end;
begin
     Application.CreateForm(TFormSelSelection, FormSelSelection);
     FormSelSelection.WantedMode:=2;
     ShifrIdMain:=FormSelSelection.Execute;
     if ShifrIdMain<1 then Exit;
     for i:=1 to max_gruppa do curr_gruppa[i]:=false;
     dxDBGridGru.ClearSelection;
     pFibQueryP.Transaction.StartTransaction;
     pFibQueryP.SQL.Clear;
     pFibQueryP.SQL.Add('select shifrpod from tb_podr_selection_list where shifridowner='+IntToStr(ShifrIdMain));
     pFibQueryP.ExecQuery;
     while not pFibQueryP.Eof do
      begin
           ShifrGru:=pFibQueryP.Fields[0].AsInteger;
           CURR_GRUPPA[ShifrGru]:=true;
           MarkSelGruppy(ShifrGru);
           pFibQueryP.Next;
      end;
     Application.ProcessMessages;

     pFibQueryP.Transaction.Commit;

end;

procedure TFormPlatGen.N5Click(Sender: TObject);
var ShifrIdOwner:integer;
    ShifrIdMain,ShifrIdSta,ShifrIdPodList,ShifrIdGruList,ModeUK:integer;
    i,ShifrPod,ShifrGru:integer;

 procedure MarkSelPodr(ShifrPod:Integer);
  var I,j,k:integer;
      Finded:boolean;
  begin

       for i:=0 to dxDBGridPodr.Count-1 do
           begin
                val(dxDBGridPodr.Items[i].Strings[0],j,k);
                if k=0 then
                   if j=ShifrPod then
                      begin
                           dxDBGridPodr.Items[i].Focused:=true;
                           dxDBGridPodr.Items[i].Selected:=true;
                           Break;
                      end;
            end;

  end;

 procedure MarkSelGruppy(ShifrGru:Integer);
  var I,j,k:integer;
      Finded:boolean;
  begin

       for i:=0 to dxDBGridGru.Count-1 do
           begin
                val(dxDBGridGru.Items[i].Strings[0],j,k);
                if k=0 then
                   if j=ShifrGru then
                      begin
                           dxDBGridGru.Items[i].Focused:=true;
                           dxDBGridGru.Items[i].Selected:=true;
                           Break;
                      end;
            end;

  end;

begin
     Application.CreateForm(TFormSelSPP, FormSelSPP);
     ShifrIdMain:=FormSelSPP.Execute;
     if ShifrIdMain<1 then Exit;
     NameServList.ClearAllSelected;
     dxDBGridPodr.ClearSelection;
     for i:=1 to max_gruppa do curr_gruppa[i]:=false;
     dxDBGridGru.ClearSelection;


     pFibQueryP.Transaction.StartTransaction;
     pFibQueryP.SQL.Clear;
     pFibQueryP.SQL.Add('select shifrsta,mode_u_k,shifrpodlist,shifrgrulist from TB_SEL_PAR_PLAT where shifrid='+IntToSTr(ShifrIdMain));
     pFibQueryP.ExecQuery;
     ShifrIdSta:=pFibQueryP.Fields[0].AsInteger;
     ModeUK:=pFibQueryP.Fields[1].AsInteger;
     ShifrIdPodList:=pFibQueryP.Fields[2].AsInteger;
     ShifrIdGruList:=pFibQueryP.Fields[3].AsInteger;
     Self.ShifrSta:=ShifrIdSta;
     LabelSta.Caption  := IntToStr(Self.ShifrSta)+' '+Trim(ShifrList.GetName(Self.ShifrSta));
     if ModeUk=1 then self.NeedColedge := true
                 else self.NeedColedge := false;
     if Self.NeedColedge then
        CheckBoxColedge.Checked:=true
     else
        CheckBoxColedge.Checked:=false;

     pFibQueryP.Close;
     pFibQueryP.SQL.Clear;
     pFibQueryP.SQL.Add('select shifrpod from tb_podr_selection_list where shifridowner='+IntToSTr(ShifrIdPodList));
     pFibQueryP.ExecQuery;
     while not pFibQueryP.Eof do
      begin
           ShifrPod:=pFibQueryP.Fields[0].AsInteger;
           MarkSelPodr(ShifrPod);
           pFibQueryP.Next;
      end;
     LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
     LabelCnt.Repaint;

     pFibQueryP.Close;
     pFibQueryP.SQL.Clear;
     pFibQueryP.SQL.Add('select shifrpod from tb_podr_selection_list where shifridowner='+IntToStr(ShifrIdGruList));
     pFibQueryP.ExecQuery;
     while not pFibQueryP.Eof do
      begin
           ShifrGru:=pFibQueryP.Fields[0].AsInteger;
           CURR_GRUPPA[ShifrGru]:=true;
           MarkSelGruppy(ShifrGru);
           pFibQueryP.Next;
      end;
     Application.ProcessMessages;

     Application.ProcessMessages;

     pFibQueryP.Transaction.Commit;

end;

end.
