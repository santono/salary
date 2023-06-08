unit UFormUpdateKadry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet, StdCtrls,
  dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib, dxDBEdtr, Buttons,
  ExtCtrls, ComCtrls, Mask;

type TKadryRec=record
               TABNO       : INTEGER;
               FIO         : string;
               NAL_CODE    : string;
               SHIFR_POD   : integer;
               PIB         : string;
               DATA_PRI    : TDATETime;
               DATA_UW     : TDATETime;
               DATA_BIRTH  : TDATETime;
               STAG_DO_Y   : integer;
               STAG_DO_M   : integer;
               K_WO_MIN    : integer;
               OKLAD       : real;
               STAWKA      : real;
               PASP_SER    : string;
               PASP_N      : string;
               PASP_DATA   : TDateTime;
               PASP_VYD    : string;
               K_WO_ST     : real;
               SHIFR_DOL   : integer;
               SHIFR_RAJ   : integer;
               SHIFR_U_S   : integer;
               SHIFR_U_Z   : integer;
               WID_RAB     : integer;
               SHIFR_KAT   : integer;
               SHIFR_GRU   : integer;
               SHIFR_POL   : integer;
               PROF        : integer;
               DOLGNOST    : string;
               ADRES       : string;
               MESTO_R     : string;
               COMMENT     : string;
               SWID_SS_SER : string;
               SWID_SS_NOM : string;
               isPensioner : Integer;
               CODE_UWOL   : Integer;
               DESCR_UWOL  : string;
               BANK_COUNT  : string;
               end;

  TFormUpdateKadryFB = class(TForm)
    Label1: TLabel;
    DataSourceKadry: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    pFIBDataSetPodr: TpFIBDataSet;
    pfbtrnsctnReadPodr: TpFIBTransaction;
    DataSourcePodr: TDataSource;
    pFIBDataSetPodrSHIFRPOD: TFIBIntegerField;
    pFIBDataSetPodrNAME: TFIBStringField;
    pFIBDataSetPodrNAMEPOD: TFIBStringField;
    Label11: TLabel;
    BitBtnSave: TBitBtn;
    BitBtnDel: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dxCalcEditTabno: TdxCalcEdit;
    dxEditFIO: TdxEdit;
    dxEditPIB: TdxEdit;
    dxDateEditDataBirth: TdxDateEdit;
    dxDateEditData_Pri: TdxDateEdit;
    dxDateEditData_Uw: TdxDateEdit;
    dxEditAdres: TdxEdit;
    dxCalcEditNal_Code: TdxCalcEdit;
    dxEditSS_Nomer: TdxEdit;
    dxEditSS_Ser: TdxEdit;
    dxLookupEditPodr: TdxLookupEdit;
    BitBtnPodrEmpty: TBitBtn;
    RadioGroupPol: TRadioGroup;
    BitBtnPol: TBitBtn;
    dxCheckEditPensioner: TdxCheckEdit;
    BitBtnUniqIdCode: TBitBtn;
    dxEditPasp_Ser: TdxEdit;
    dxEditPasp_Nom: TdxEdit;
    Label12: TLabel;
    Label13: TLabel;
    dxDatePasp_Data: TdxDateEdit;
    dxEditPasp_Vydan: TdxEdit;
    Label14: TLabel;
    Label15: TLabel;
    uwolMemo: TMemo;
    Label16: TLabel;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label17: TLabel;
    dxEditBankCount: TdxEdit;
    BitBtn4: TBitBtn;
    BitBtnClearINN: TBitBtn;
    TabPSBSheet: TTabSheet;
    EditPSBPassport: TEdit;
    rgPSBRezident: TRadioGroup;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    EditPSBNomerScheta: TMaskEdit;
    EditSNILS: TMaskEdit;
    EditINN: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    constructor CreateUpdKadry(AOwner: TComponent;DBAction:Integer;Tabno:integer);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtnDelClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dxCalcEditTabnoChange(Sender: TObject);
    procedure dxEditFIOChange(Sender: TObject);
    procedure dxEditPIBChange(Sender: TObject);
    procedure dxDateEditDataBirthChange(Sender: TObject);
    procedure dxDateEditData_PriChange(Sender: TObject);
    procedure dxDateEditData_UwChange(Sender: TObject);
    procedure dxCalcEditNal_CodeChange(Sender: TObject);
    procedure dxEditAdresChange(Sender: TObject);
    procedure dxEditSS_NomerChange(Sender: TObject);
    procedure dxEditSS_SerChange(Sender: TObject);
    procedure dxLookupEditPodrChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnPodrEmptyClick(Sender: TObject);
    procedure BitBtnPolClick(Sender: TObject);
    procedure dxCheckEditPensionerChange(Sender: TObject);
    procedure BitBtnUniqIdCodeClick(Sender: TObject);
    procedure dxEditPasp_SerChange(Sender: TObject);
    procedure dxEditPasp_NomChange(Sender: TObject);
    procedure dxEditPasp_VydanChange(Sender: TObject);
    procedure dxDatePasp_DataChange(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure dxEditBankCountChange(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtnClearINNClick(Sender: TObject);
  private
    { Private declarations }
    DBAction : Integer;
    Tabno    : Integer;
    kr       : TKadryRec;
    procedure SaveRecord;
    procedure RestoreRecord;
    procedure RestorePSBRecord(Action:integer);
    procedure FillScreenData;
    function ValidateNOMER_SCHETA:Boolean;
    function ValidateSNILS:Boolean;
    function ValidateINN:Boolean;

  public
    { Public declarations }
  end;

var
  FormUpdateKadryFB: TFormUpdateKadryFB;

implementation
 uses UFibModule,UFormBrowseKadryFB,UFormWaitMess,DateUtils,ScrUtil,
  UFormSeekUwolReason,uSQLUnit,scrdef;

{$R *.dfm}
constructor TFormUpdateKadryFB.CreateUpdKadry(AOwner: TComponent;DBAction:Integer;Tabno:integer);
 var newTabno:Integer;
     SQLStmnt:string;
 begin
      inherited Create(AOwner);
      Self.DBAction:=DBAction;
      Self.Tabno:=Tabno;
      if DBAction=3 then
         begin
              BitBtnSave.Hide;
              BitBtnSave.Enabled:=false;
         end
      else
         begin
              BitBtnDel.Hide;
              BitBtnDel.Enabled:=false;
         end;
      if pFIBDataSetPodr.Active then
         pFIBDataSetPodr.Close;
      if pFIBDataSetPodr.Transaction.Active then
         pFIBDataSetPodr.Transaction.Commit;
  {    if pFIBDataSetKadry.Active then
         pFIBDataSetKadry.Close;
      if pFIBDataSetKadry.Transaction.Active then
         pFIBDataSetKadry.Transaction.Commit;
      if pFIBDataSetKadry.UpdateTransaction.Active then
         pFIBDataSetKadry.UpdateTransaction.Commit;
      pFIBDataSetKadry.Transaction.StartTransaction;
      pFIBDataSetKadry.Params[0].AsInteger:=Self.Tabno;
      pFIBDataSetKadry.Prepare;
      pFIBDataSetKadry.Open;
  }
      pFIBDataSetPodr.Transaction.StartTransaction;
      pFIBDataSetPodr.Open;
      SaveRecord;
  //    FillScreenData;
     if DBAction=1 then
        begin
             FillChar(kr,SizeOf(Kr),0);
             SQLStmnt:='select max(tabno) from kadry';
             newTabno:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0)+1;
             kr.TABNO:=newTabno;
             FillScreenData;
             Caption:='Добавление записи о сотруднике';
        end
     else
     if DBAction=3 then
        Caption:='Запись о сотруднике будет удалена'
     else
        Caption:='Изменение записи о сотруднике';
 end;

procedure TFormUpdateKadryFB.SaveRecord;
   begin
        kr.TABNO       := TFormBrowseKadryFB(Owner).pFIBDataSetKadryTABNO.Value;
        kr.Fio         := TFormBrowseKadryFB(Owner).pFIBDataSetKadryFio.Value;
        kr.PIB         := TFormBrowseKadryFB(Owner).pFIBDataSetKadryPIB.Value;
        kr.NAL_CODE    := TFormBrowseKadryFB(Owner).pFIBDataSetKadryNal_Code.Value;
        kr.Data_Pri    := TFormBrowseKadryFB(Owner).pFIBDataSetKadryData_Pri.Value;
        kr.DATA_UW     := TFormBrowseKadryFB(Owner).pFIBDataSetKadryData_Uw.Value;
        kr.DATA_BIRTH  := TFormBrowseKadryFB(Owner).pFIBDataSetKadryData_Birth.Value;
        kr.ADRES       := TFormBrowseKadryFB(Owner).pFIBDataSetKadryAdres.Value;
        kr.SWID_SS_SER := TFormBrowseKadryFB(Owner).pFIBDataSetKadrySWID_SS_SER.Value;
        kr.SWID_SS_NOM := TFormBrowseKadryFB(Owner).pFIBDataSetKadrySWID_SS_NOM.Value;
        kr.SHIFR_POD   := TFormBrowseKadryFB(Owner).pFIBDataSetKadryShifr_POD.Value;
        if TFormBrowseKadryFB(Owner).pFIBDataSetKadrySHIFR_POL.IsNull then
           kr.SHIFR_POL    :=  -1
        else
            kr.SHIFR_POL   := TFormBrowseKadryFB(Owner).pFIBDataSetKadryShifr_POL.Value;
        kr.isPensioner := TFormBrowseKadryFB(Owner).pFIBDataSetKadryIsPensioner.Value;
        kr.PASP_SER    := TFormBrowseKadryFB(Owner).pFIBDataSetKadryPASP_SER.Value;
        kr.PASP_N      := TFormBrowseKadryFB(Owner).pFIBDataSetKadryPASP_N.Value;
        kr.PASP_DATA   := TFormBrowseKadryFB(Owner).pFIBDataSetKadryPASP_DATA.Value;
        kr.PASP_VYD    := TFormBrowseKadryFB(Owner).pFIBDataSetKadryPASP_VYD.Value;
        kr.CODE_UWOL   := TFormBrowseKadryFB(Owner).pFIBDataSetKadryCODE_UWOL.Value;
        kr.DESCR_UWOL  := TFormBrowseKadryFB(Owner).pFIBDataSetKadryDESCR_UWOL.Value;
        kr.BANK_COUNT  := TFormBrowseKadryFB(Owner).pFIBDataSetKadryBANK_COUNT.Value;
   end;
  procedure TFormUpdateKadryFB.RestoreRecord;
   begin
        kr.SHIFR_POL:=RadioGroupPol.ItemIndex;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryTABNO.Value       := kr.TABNO             ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryFio.Value         := Trim(kr.Fio)         ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryPIB.Value         := Trim(kr.PIB)         ;
        if (length(trim(kr.NAL_CODE))>5) then
           TFormBrowseKadryFB(Owner).pFIBDataSetKadryNal_Code.Value    := Trim(kr.NAL_CODE)
        else
           TFormBrowseKadryFB(Owner).pFIBDataSetKadryNal_Code.Clear;
        if YearOf(kr.DATA_PRI)<1950 then
           TFormBrowseKadryFB(Owner).pFIBDataSetKadryData_Pri.Clear
        else
           TFormBrowseKadryFB(Owner).pFIBDataSetKadryData_Pri.Value    := kr.Data_Pri ;
        if YearOf(kr.DATA_UW)<1950 then
           TFormBrowseKadryFB(Owner).pFIBDataSetKadryData_Uw.Clear
        else
           TFormBrowseKadryFB(Owner).pFIBDataSetKadryData_Uw.Value     := kr.Data_Uw  ;
        if YearOf(Kr.Data_Birth)<1905 then
           TFormBrowseKadryFB(Owner).pFIBDataSetKadryData_Birth.Clear
        else
           TFormBrowseKadryFB(Owner).pFIBDataSetKadryData_Birth.Value  := kr.DATA_BIRTH  ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryAdres.Value       := Trim(kr.ADRES)       ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadrySWID_SS_SER.Value := kr.SWID_SS_SER ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadrySWID_SS_NOM.Value := kr.SWID_SS_NOM ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadrySHIFR_POD.Value   := kr.Shifr_Pod   ;
        if kr.SHIFR_POL < 0 then
           TFormBrowseKadryFB(Owner).pFIBDataSetKadryShifr_POL.Clear
        else
           TFormBrowseKadryFB(Owner).pFIBDataSetKadryShifr_POL.Value   := kr.SHIFR_POL   ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryIsPensioner.Value    := kr.isPensioner ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryPASP_SER.Value       := kr.PASP_SER    ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryPASP_N.Value         := kr.PASP_N      ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryPASP_DATA.Value      := kr.PASP_DATA   ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryPASP_VYD.Value       := kr.PASP_VYD    ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryCODE_UWOL.Value      := kr.CODE_UWOL   ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryDESCR_UWOL.Value     := Trim(kr.DESCR_UWOL)   ;
        TFormBrowseKadryFB(Owner).pFIBDataSetKadryBANK_COUNT.Value     := trim(kr.BANK_COUNT);
   end;
procedure TFormUpdateKadryFB.restorePSBRecord(Action:integer);
   var SQLStmnt:string;
       fam,nam,otc:shortString;
       rezStr:string;
       v:variant;
       finded:Boolean;
   begin
        if not isLNR then Exit;
        if (rgPSBRezident.ItemIndex=0) then
            rezStr:='21'
        else
        if (rgPSBRezident.ItemIndex=1) then
            rezStr:='10'
        else
            rezStr:=' ';

        SplitFIO(Trim(kr.PIB),FAM,NAM,OTC);
        finded:=False;
        if Action=2 then
           begin
                SQLStmnt:='select count(*) from tb_psb_rez where tabno='+intToStr(kr.tabno);
                v:=SQLQueryValue(SQLStmnt);
                if VarIsNumeric(v)
                   and v>0    then
                   finded:=True;
           end;

        if (Action=1) or ((Action=2) and (not finded)) then
           begin
                SQLStmnt:='insert into tb_psb_rez(NOMER_SCHETA,DUMMY,FAM,NAM,OTC,REZIDENT,PASSPORT,TABNO,SNILS,INN) VALUES (';
                SQLStmnt:=Trim(SQLStmnt)+''''+Trim(EditPSBNomerScheta.text)+''',''810'','''+fam+''','''+nam+''','''+otc+''','''+rezStr+''','''+Trim(EditPSBPassport.text)+''','+intToStr(kr.tabno);
                SQLStmnt:=Trim(SQLStmnt)+','''+Trim(EditSNILS.text)+''','''+Trim(EditSNILS.text)+''')';
           end
        else
        if (Action=3) then
           begin
                SQLStmnt:='delete from tb_psb_rez where tabno='+IntToStr(kr.tabno);
           end
        else
           begin
                SQLStmnt:='update tb_psb_rez set ';
                SQLStmnt:=trim(SQLStmnt)+' NOMER_SCHETA='''+trim(EditPSBNomerScheta.text)+''',';
                SQLStmnt:=trim(SQLStmnt)+' DUMMY=''810'',';
                SQLStmnt:=trim(SQLStmnt)+' FAM='''+trim(FAM)+''',';
                SQLStmnt:=trim(SQLStmnt)+' NAM='''+trim(NAM)+''',';
                SQLStmnt:=trim(SQLStmnt)+' OTC='''+trim(OTC)+''',';
                SQLStmnt:=trim(SQLStmnt)+' SNILS='''+trim(EditSNILS.text)+''',';
                SQLStmnt:=trim(SQLStmnt)+' INN='''+trim(EditINN.text)+''',';
                SQLStmnt:=trim(SQLStmnt)+' REZIDENT='''+trim(rezStr)+''',';
                SQLStmnt:=trim(SQLStmnt)+' PASSPORT='''+trim(EditPSBPassport.text)+''' WHERE TABNO=';
                SQLStmnt:=trim(SQLStmnt)+intToStr(KR.tabno);
           end;

        SQLExecute(SQLStmnt);
   end;

procedure TFormUpdateKadryFB.FillScreenData;
   var SQLStmnt:string;
       v:Variant;

   begin
        dxCalcEditTabno.Text            := IntToStr(kr.Tabno) ;
        if kr.Tabno=0 then dxCalcEditTabno.Text:='';
        dxEditFIO.Text                  := kr.FIO         ;
        dxEditPIB.Text                  := kr.PIB         ;
        dxCalcEditNal_Code.Text         := kr.NAL_CODE    ;
        dxDateEditDataBirth.Date        := kr.DATA_BIRTH  ;
        if YearOf(kr.DATA_BIRTH)<1900 then
           dxDateEditDataBirth.Text:='';
        dxDateEditData_Pri.Date         := kr.DATA_PRI    ;
        if YearOf(kr.DATA_PRI)<1900 then
           dxDateEditData_Pri.Text:='';
        dxDateEditData_Uw.Date          := kr.DATA_UW     ;
        if YearOf(kr.DATA_Uw)<1900 then
           dxDateEditData_Uw.Text:='';
        dxEditAdres.Text                := kr.ADRES       ;
        dxEditSS_Nomer.Text             := kr.SWID_SS_NOM ;
        dxEditSS_Ser.Text               := kr.SWID_SS_SER ;
        dxLookupEditPodr.LookupKeyValue := kr.SHIFR_POD   ;
        if kr.Shifr_Pol<0 then
           RadioGroupPol.ItemIndex:=-1
        else
           RadioGroupPol.ItemIndex:=kr.SHIFR_POL;
        if kr.isPensioner=1 then
           dxCheckEditPensioner.Checked:=True
        else
           dxCheckEditPensioner.Checked:=false;
        dxEditPasp_Ser.Text             := kr.PASP_SER ;
        dxEditPasp_nom.Text             := kr.PASP_N   ;
        dxEditPasp_Vydan.Text           := kr.PASP_VYD ;
        dxDatePasp_Data.Date            := kr.PASP_DATA;
        if YearOf(kr.PASP_DATA)<1900 then
           dxDatePasp_Data.Text:='';
        uwolMemo.Lines.Add(kr.DESCR_UWOL);
        dxEditBankCount.Text            := Trim(kr.BANK_COUNT);
        EditPSBNomerScheta.Text:='408178100510';
        EditPSBPassport.Text:='';
        EditSNILS.Text:='';
        EditINN.Text:='';
        rgPSBRezident.ItemIndex:=-1;
        if isLNR then
        if kr.TABNO>0 then
           begin
                SQLStmnt:='select first 1 nomer_scheta,rezident,passport,snils,inn from tb_psb_rez where tabno='+intTostr(kr.tabno);
                v:=SQLQueryRecValues(SQLStmnt);
               if (not (VarIsNull(v))) then
               if (VarIsArray(v)) then
                   begin
                        if not VarIsNull(v[0]) then
                           EditPSBNomerScheta.Text:=Trim(v[0]);
                        if not VarIsNull(v[2]) then
                           EditPSBPassport.Text:=Trim(v[2]);
                        if not VarIsNull(v[3]) then
                           EditSNILS.Text:=Trim(v[3]);
                        if not VarIsNull(v[4]) then
                           EditINN.Text:=Trim(v[4]);
                        if not VarIsNull(v[1]) then
                        if (Trim(v[1])='21') then
                            rgPSBRezident.ItemIndex:=0
                        else
                        if (Trim(v[1])='10') then
                            rgPSBRezident.ItemIndex:=1;
                   end;
           end;
   end;

procedure TFormUpdateKadryFB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
      if pFIBDataSetPodr.Active then
         pFIBDataSetPodr.Close;
      if pFIBDataSetPodr.Transaction.Active then
         pFIBDataSetPodr.Transaction.Commit;
{
      if pFIBDataSetKadry.Active then
         pFIBDataSetKadry.Close;
      if pFIBDataSetKadry.Transaction.Active then
         pFIBDataSetKadry.Transaction.Commit;
      if pFIBDataSetKadry.UpdateTransaction.Active then
         pFIBDataSetKadry.UpdateTransaction.Commit;
}
end;

function TFormUpdateKadryFB.ValidateNOMER_SCHETA:Boolean;
 var s:String;
     i:Integer;
     isRezident:Boolean;
 begin
      isRezident:=True;
      if rgPSBRezident.ItemIndex=1 then
         isRezident:=False;

      s:=Trim(EditPSBNomerScheta.Text);
      if s='' then
         begin
              ValidateNOMER_SCHETA:=TRUE;
              Exit;
         end;
      if Length(s)<>20 then
         begin
              ValidateNOMER_SCHETA:=false;
              Exit;
         end;
       for i:=1 to 20 do
         if not (s[i]  in ['0'..'9']) then
            begin
              ValidateNOMER_SCHETA:=false;
              Exit;
            end;
       if not (((Pos('408178',s)=1) and isRezident)
            or ((Pos('408208',s)=1) and not isRezident)) then
            begin
              ValidateNOMER_SCHETA:=false;
              Exit;
            end;
       ValidateNOMER_SCHETA:=True;
 end;

function TFormUpdateKadryFB.ValidateSNILS:Boolean;
 var s,ss:String;
     i:Integer;
 begin
      s:=Trim(EditSNILS.Text);
      ss:=s;
      if Length(s)>0 then
         begin
              ss:= StringReplace(s, '-',' ',[rfReplaceAll]);
              ss:=trim(ss);
         end;     
      if ss='' then
         begin
              ValidateSNILS:=true;
              Exit;
         end;
      if Length(s)<>14 then
         begin
              ValidateSNILS:=false;
              Exit;
         end;
       for i:=1 to 14 do
         if not (s[i]  in ['0'..'9',' ','-']) then
            begin
              ValidateSNILS:=false;
              Exit;
            end;
       if Pos('-',s)<>4 then
            begin
              ValidateSNILS:=false;
              Exit;
            end;
       if Pos(' ',s)<>12 then
            begin
              ValidateSNILS:=false;
              Exit;
            end;
       ValidateSNILS:=True;
 end;
function TFormUpdateKadryFB.ValidateINN:Boolean;
 var s:String;
     i:Integer;
 begin
      s:=Trim(EditINN.Text);
      if s='' then
         begin
              ValidateINN:=true;
              Exit;
         end;
      if Length(s)<>12 then
         begin
              ValidateINN:=false;
              Exit;
         end;
       for i:=1 to 12 do
         if not (s[i]  in ['0'..'9']) then
            begin
              ValidateINN:=false;
              Exit;
            end;
       ValidateINN:=True;
 end;

procedure TFormUpdateKadryFB.BitBtnSaveClick(Sender: TObject);
 var S:String;
begin
      if isLNR then
         begin
              if not ValidateNOMER_SCHETA then
                 begin
                      ShowMessage('Неверный формат номера счета в ПСБ');
                      Exit;
                 end;
              if not ValidateSNILS then
                 begin
                      ShowMessage('Неверный формат СНИЛС');
                      Exit;
                 end;
              if not ValidateINN then
                 begin
                      ShowMessage('Неверный формат ИНН');
                      Exit;
                 end;
         end;
     if DBAction=1 then
        begin
             S:='Добавлено';
             TFormBrowseKadryFB(Owner).pFIBDataSetKadry.Insert;
             RestoreRecord;
             RestorePSBRecord(1);
        end
     else
        Begin
            S:='Изменено';
            TFormBrowseKadryFB(Owner).pFIBDataSetKadry.Edit;
            RestoreRecord;
            RestorePSBRecord(2);
        end;
     if TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateTransaction.Active then
        TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateTransaction.Commit;
     TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateTransaction.StartTransaction;
     TFormBrowseKadryFB(Owner).pFIBDataSetKadry.Post;
     if TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateTransaction.Active then
        TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateTransaction.Commit;
   //  TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateRecord;
     TFormBrowseKadryFB(Owner).pFIBDataSetKadry.Refresh;
     TFormBrowseKadryFB(Owner).dxDBGridKadry.Refresh;
     FormWaitMess.SetMessage(S);
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;
{
     TFormBrowseKadryFB(Owner).pFIBDataSetKadry.Close;
     TFormBrowseKadryFB(Owner).pFIBDataSetKadry.Open;
     TFormBrowseKadryFB(Owner).RefreshDataset(TFormBrowseKadryFB(Owner).pFIBDataSetKadry);
}
     Close;
end;

procedure TFormUpdateKadryFB.BitBtnDelClick(Sender: TObject);
var testedTabno:integer;
    SQLStmnt:String;
    i:integer;
begin
     testedTabno:=Self.Tabno;
     SQLStmnt:='select count(*) from person where tabno='+intToStr(testedTabno);
     i:=SQLQueryValue(SQLStmnt);
     if i>0 then
        begin
             ShowMessage('Существуют данные в архиве для удаляемого сотрудника.'+^M+'Удаление сотрудника невозможно.');
             Exit;
        end;
     if TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateTransaction.Active then
        TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateTransaction.Commit;
     TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateTransaction.StartTransaction;
     TFormBrowseKadryFB(Owner).pFIBDataSetKadry.Delete;
     if TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateTransaction.Active then
        TFormBrowseKadryFB(Owner).pFIBDataSetKadry.UpdateTransaction.Commit;

     restorePSBRecord(3);
     TFormBrowseKadryFB(Owner).pFIBDataSetKadry.Refresh;
     FormWaitMess.SetMessage('Удалено');
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;
     TFormBrowseKadryFB(Owner).pFIBDataSetKadry.Refresh;
     TFormBrowseKadryFB(Owner).dxDBGridKadry.Refresh;
    // TFormBrowseKadryFB(Owner).RefreshDataset(TFormBrowseKadryFB(Owner).pFIBDataSetKadry);
     Close;
end;
              
procedure TFormUpdateKadryFB.BitBtn2Click(Sender: TObject);
 var Dt,DtStart:TDateTime;
     NmbOfDay:Integer;
     NmbOfDayS:String;
     J:Integer;
begin
     NmbOfDayS:=Copy(Trim(kr.NAL_CODE),1,5);
     val(NmbOfDayS,NmbOfDay,J);
     if j<>0 then
        Exit;
     Dec(nmbOfDay);
     DtStart:=EnCodeDate(1900,1,1);
     dt:=IncDay(DtStart, NmbOfDay);
     kr.DATA_BIRTH:=Dt;
     dxDateEditDataBirth.Date:=Dt;
     dxDateEditDataBirth.Refresh;
     Application.ProcessMessages;

end;

procedure TFormUpdateKadryFB.dxCalcEditTabnoChange(Sender: TObject);
var i,j:Integer;
begin
     Val(Trim(dxCalcEditTabno.Text),i,j);
     if j=0 then
        kr.TABNO:=i;
end;

procedure TFormUpdateKadryFB.dxEditFIOChange(Sender: TObject);
begin
     kr.FIO:=Trim(dxEditFIO.Text);
end;

procedure TFormUpdateKadryFB.dxEditPIBChange(Sender: TObject);
begin
     kr.PIB:=Trim(dxEditPIB.Text);
end;



procedure TFormUpdateKadryFB.dxDateEditDataBirthChange(Sender: TObject);
begin
     kr.DATA_BIRTH := dxDateEditDataBirth.Date;
end;

procedure TFormUpdateKadryFB.dxDateEditData_PriChange(Sender: TObject);
begin
     kr.DATA_PRI   := dxDateEditData_Pri.Date;
end;

procedure TFormUpdateKadryFB.dxDateEditData_UwChange(Sender: TObject);
begin
     kr.DATA_UW:=dxDateEditData_Uw.Date;
end;

procedure TFormUpdateKadryFB.dxCalcEditNal_CodeChange(Sender: TObject);
var SS : String  ;
    l  : Integer ;
begin
     ss:=Trim(dxCalcEditNal_Code.Text);
     l:=length(ss);
     if ((l>1) and (L<11)) then
     if IsNumericString(SS) then
        kr.NAL_CODE := SS;
end;

procedure TFormUpdateKadryFB.dxEditAdresChange(Sender: TObject);
begin
     kr.ADRES := dxEditAdres.Text;
end;

procedure TFormUpdateKadryFB.dxEditSS_NomerChange(Sender: TObject);
begin
     kr.SWID_SS_NOM:=dxEditSS_Nomer.Text;
end;

procedure TFormUpdateKadryFB.dxEditSS_SerChange(Sender: TObject);
begin
     kr.SWID_SS_SER:=dxEditSS_Ser.Text;
end;

procedure TFormUpdateKadryFB.dxLookupEditPodrChange(Sender: TObject);
begin
     kr.SHIFR_POD:=dxLookupEditPodr.LookupKeyValue;
end;

procedure TFormUpdateKadryFB.FormCreate(Sender: TObject);
begin
     FillScreenData;
     PageControl1.ActivePageIndex:=0;
     if isSVDN then
        begin
             BitBtnClearINN.Visible:=false;
             BitBtnClearINN.Enabled:=false;
             TabPSBSheet.Visible:=False;
             TabPSBSheet.Enabled:=False;
        end
     else
        begin
             BitBtnClearINN.Visible:=true;
             BitBtnClearINN.Enabled:=true;
             TabPSBSheet.Visible:=True;
             TabPSBSheet.Enabled:=True;

        end;
end;

procedure TFormUpdateKadryFB.BitBtnPodrEmptyClick(Sender: TObject);
begin
     kr.SHIFR_POD:=0;
     dxLookupEditPodr.LookupKeyValue:=0;
     dxLookupEditPodr.Refresh;
     Application.ProcessMessages;
end;

procedure TFormUpdateKadryFB.BitBtnPolClick(Sender: TObject);
var SS,S : String  ;
    l  : Integer ;
begin
     ss:=Trim(dxCalcEditNal_Code.Text);
     l:=length(SS);
     if ((l>1) and (L<11)) then
     if IsNumericString(SS) then
        begin
             s:=Copy(SS,9,1);
             if s[1] in ['0','2','4','6','8'] then
                kr.SHIFR_POL:=1
             else
                kr.SHIFR_POL:=0;
             RadioGroupPol.ItemIndex:=kr.SHIFR_POL;
             Application.ProcessMessages;   
        end;

end;

procedure TFormUpdateKadryFB.dxCheckEditPensionerChange(Sender: TObject);
begin
     if dxCheckEditPensioner.Checked then
        kr.IsPensioner:=1
     else
        kr.IsPensioner:=0;
end;

procedure TFormUpdateKadryFB.BitBtnUniqIdCodeClick(Sender: TObject);
 var idCode:string;
     Tabno:Integer;
     SQLStmnt:string;
begin
     idCode:=Trim(kr.NAL_CODE);
     if Length(idCode)<>10 then
        begin
             ShowMessage('Длина ид.кода должна быть ровно 10 цифр');
             Exit;
        end;
     if not IsNumericString(idCode) then
        begin
             ShowMessage('В ид.коде должны быть только цифры');
             Exit;
        end;
     SQLStmnt:='select first 1 tabno from kadry where trim(nal_code)='''+idCode+''' and strlen(trim(nal_code))=10 and nal_code is not null';
     tabno:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     if ((Tabno=0) or (Tabno=kr.TABNO)) then
         ShowMessage('Ид. код '+idCode+' является уникальным')
     else
         ShowMessage('Ид. код '+idCode+' является дубликатом')


end;

procedure TFormUpdateKadryFB.dxEditPasp_SerChange(Sender: TObject);
begin
     kr.PASP_SER:=Trim(dxEditPasp_Ser.Text);
end;

procedure TFormUpdateKadryFB.dxEditPasp_NomChange(Sender: TObject);
begin
     kr.PASP_N:=Trim(dxEditPasp_Nom.Text);
end;



procedure TFormUpdateKadryFB.dxEditPasp_VydanChange(Sender: TObject);
begin
     kr.PASP_VYD:=Trim(dxEditPasp_Vydan.Text);
end;

procedure TFormUpdateKadryFB.dxDatePasp_DataChange(Sender: TObject);
begin
     kr.PASP_DATA:=dxDatePasp_Data.Date;
end;

function getUwolSokrAndName(code:integer):string;
 var retVal:string;
     sokr:string;
     name:string;
     v:Variant;
     SQLStmnt:string;
 begin
       retVal:='';
       getUwolSokrAndName:='';
       if code<1 then
          Exit;
       sokr:='';
       name:='';
       SQLStmnt:='select first 1 sork,name from tb_dismis where id='+intToStr(code);
       v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
       if VarIsArray(v) then
          begin
               if VarIsStr(v[1]) then
                  sokr:=v[1];
               if VarIsStr(v[2]) then
                  name:=v[2];
          end;
       if (Length(sokr)>0) and (Length(name)>0) then
          retVal:=Trim(sokr)+' '+trim(name)
       else
       if (Length(sokr)>0) and (Length(name)=0) then
          retVal:=Trim(sokr)
       else
       if (Length(sokr)=0) and (Length(name)>0) then
          retVal:=Trim(name);
       getUwolSokrAndName:=retVal;

 end;

procedure TFormUpdateKadryFB.BitBtn3Click(Sender: TObject);
var kd:Integer;
    s:string;
begin
     Application.CreateForm(TFormSeekUwolReason,FormSeekUwolReason);
     FormSeekUwolReason.code_uwol:=kr.CODE_UWOL;
     FormSeekUwolReason.setActiveRow;
     kd:=FormSeekUwolReason.ShowModal;
     if kd=mrOk then
        begin
             kr.CODE_UWOL:=FormSeekUwolReason.code_uwol;
             kr.DESCR_UWOL:=FormSeekUwolReason.desc_uwol;
             uwolMemo.Lines.Clear;
             uwolMemo.Lines.Add(kr.DESCR_UWOL);
             kd:=length(Trim(kr.descr_uwol));
   //          s:=getUwolSokrAndName(kr.CODE_UWOL);

             Application.ProcessMessages;
        end;
     FormSeekUwolReason.Free;
end;

procedure TFormUpdateKadryFB.dxEditBankCountChange(Sender: TObject);
begin
     kr.BANK_COUNT:=Trim(dxEditBankCount.Text);
end;

procedure TFormUpdateKadryFB.BitBtn4Click(Sender: TObject);
begin
     kr.CODE_UWOL:=0;
     kr.DESCR_UWOL:='';
     uwolMemo.Lines.Clear;
     Application.ProcessMessages
end;

procedure TFormUpdateKadryFB.BitBtnClearINNClick(Sender: TObject);
begin
      kr.NAL_CODE             := '';
      dxCalcEditNal_Code.Text := '';
      Application.ProcessMessages;
end;

end.
