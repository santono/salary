{$WARNINGS OFF}
{$HINTS OFF}
unit UFormSBSSpr;

interface                       

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,
  dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, dxCntner,
  ExtCtrls, DBCtrls, Menus, frxClass, frxDBSet, frxExportRTF, FIBQuery,
  pFIBQuery;

type
  TFormSBSSpr = class(TForm)
    DataSourceSBS: TDataSource;
    pFIBTransactionRead: TpFIBTransaction;
    pFIBDataSetSBS: TpFIBDataSet;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBDataSetSBSTABNO: TFIBSmallIntField;
    pFIBDataSetSBSSHIFRID: TFIBIntegerField;
    pFIBDataSetSBSNAL_CODE: TFIBStringField;
    pFIBDataSetSBSFIO: TFIBStringField;
    pFIBDataSetSBSMONTH_VY: TFIBSmallIntField;
    pFIBDataSetSBSYEAR_VY: TFIBSmallIntField;
    pFIBDataSetSBSMODE_VY_ZA: TFIBSmallIntField;
    pFIBDataSetSBSBUH_NAME: TFIBStringField;
    pFIBDataSetSBSSUMMA_TOT: TFIBBCDField;
    pFIBDataSetSBSSHIFRWRK: TFIBSmallIntField;
    dxDBGridSBS: TdxDBGrid;
    dxDBGridSBSTABNO: TdxDBGridMaskColumn;
    dxDBGridSBSSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSBSNAL_CODE: TdxDBGridMaskColumn;
    dxDBGridSBSFIO: TdxDBGridMaskColumn;
    dxDBGridSBSMONTH_VY: TdxDBGridMaskColumn;
    dxDBGridSBSYEAR_VY: TdxDBGridMaskColumn;
    dxDBGridSBSMODE_VY_ZA: TdxDBGridMaskColumn;
    dxDBGridSBSBUH_NAME: TdxDBGridMaskColumn;
    dxDBGridSBSSUMMA_TOT: TdxDBGridCurrencyColumn;
    dxDBGridSBSSHIFRWRK: TdxDBGridMaskColumn;
    DBNavigator1: TDBNavigator;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    frxDBDatasetSBS: TfrxDBDataset;
    pFIBDataSetSBSPrt: TpFIBDataSet;
    pFIBTransactionSbsPrt: TpFIBTransaction;
    pFIBDataSetSBSPrtSUMMA: TFIBBCDField;
    pFIBDataSetSBSPrtSUMMA_ALIM: TFIBBCDField;
    pFIBDataSetSBSPrtYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetSBSPrtMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetSBSPrtY_M: TStringField;
    N2: TMenuItem;
    N3: TMenuItem;
    frxRTFExport1: TfrxRTFExport;
    pFIBQuerySBS: TpFIBQuery;
    pFIBTransactionSBS: TpFIBTransaction;
    N4: TMenuItem;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure pFIBDataSetSBSPrtCalcFields(DataSet: TDataSet);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure N3Click(Sender: TObject);
    procedure dxDBGridSBSDblClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    { Private declarations }
    FIO:String;
    INN:String;
    ShifrIdSBS:integer;
    Name_W_R : string;
    DolgName : string;
    Prop1,Prop2 : string;
    Period : string;
    SummaTot:string;
    Prorektor:string;
    GlBuh:string;
    BuhName:string;
  public
    { Public declarations }
  end;

var
  FormSBSSpr: TFormSBSSpr;

implementation
  uses UFibModule,UFormSBSUpd,ScrUtil,ScrDef,UFormSBSPr;

{$R *.dfm}

procedure TFormSBSSpr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetSBS.Active then
         pFIBDataSetSBS.Close;
      if pFIBDataSetSBS.UpdateTransaction.Active then
         pFIBDataSetSBS.UpdateTransaction.Commit;
      if pFIBDataSetSBS.Transaction.Active then
         pFIBDataSetSBS.Transaction.Commit;
      Action:=caFree;
end;

procedure TFormSBSSpr.FormCreate(Sender: TObject);
begin
      if pFIBDataSetSBS.Active then
         pFIBDataSetSBS.Close;
      if pFIBDataSetSBS.UpdateTransaction.Active then
         pFIBDataSetSBS.UpdateTransaction.Commit;
      if pFIBDataSetSBS.Transaction.Active then
         pFIBDataSetSBS.Transaction.Commit;
      pFIBDataSetSBS.Transaction.StartTransaction;
      pFIBDataSetSBS.Open;
end;

procedure TFormSBSSpr.N1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSBSUpd, FormSBSUpd);
    FormSBSUpd.MyAction:=1;
    FormSBSUpd.ShowModal;
    pFIBDataSetSBS.Close;
    pFIBDataSetSBS.Open;
    pFIBDataSetSBS.Last;
    pFIBDataSetSBS.ReFresh;
    dxDBGridSBS.SetFocus;

end;

procedure TFormSBSSpr.pFIBDataSetSBSPrtCalcFields(DataSet: TDataSet);
begin
     pFIBDataSetSBSPrtY_M.Value:=IntToStr(pFIBDataSetSBSPrtYEAR_ZA.Value)+' '+
                                 trim(GetMonthUkr(pFIBDataSetSBSPrtMonth_ZA.Value))
end;

procedure TFormSBSSpr.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
    if VarName='FIO' then
       Value:=Fio
    else if VarName='INN' then
       Value:=INN
    else if VarName='NAME_W_R' then
       Value:=NAME_W_R
    else if VarName='DOLGNAME' then
       Value:=DolgName
    else if VarName='prop1' then
       Value:=Prop1
    else if VarName='prop2' then
       Value:=Prop2
    else if VarName='period' then
       Value:=Period
    else if VarName='summatot' then
       Value:=SummaTot
    else if VarName='prorektor' then
       Value:=Prorektor
    else if Upper_String(Trim(VarName))='DOLGREKTOR' then
       Value:=getRektorDolg //DIREKTOR_DOLG_NAME 
    else if VarName='glbuh' then
       Value:=GlBuh
    else if VarName='buhname' then
       Value:=BuhName
    else if VarName='SVDN' then
    {$IFDEF SVDN}
       Value:='1';
    {$ELSE}
       Value:='0';
    {$ENDIF}
end;

procedure TFormSBSSpr.N3Click(Sender: TObject);
var i,ic:integer;
    SQLStmnt:string;
    SummaProp : string;
    L : integer;
    a : real;
    d : boolean;
  function ConvertDolg(DName:string):string;
    var i,l:integer;
        c:char;
        s,r:string;
    begin
        s:=trim(DName);
        l:=length(s);
        r:='';
        result:='';
        if l<1 then exit;
        if l>100 then exit;
        d:=true;
        for i:=1 to l do
           begin
                c:=s[i];
                if d then
                if c in ['0'..'9'] then continue;
                d:=false;
                r:=r+c;
           end;
        r:=trim(r);
      //  r:=AnsiLowerCase(r);
        r:=Lower_String(r);
        result:=r;
    end;
begin
     ShifrIdSbs:=pFIBDataSetSBSSHIFRID.Value;
     a := pFIBDataSetSBSSumma_Tot.Value;
     FIO := pFIBDataSetSBSFIO.Value;
     INN := pFIBDataSetSBSNal_Code.Value;
     Name_W_R  := 'Вид работы';
     DolgName  := 'должность';
     Period    := 'период';
     Prop1     := 'проп1';
     Prop2     := 'проп2';
     SummaTot  := '100.00';
     Prorektor := getRektorFIO;
     GlBuh     := getGlBuhFIO;
//     Prorektor := 'О.Л.Голубенко';
//     GlBuh     := ' Л.І.Бєлоусова';
     SummaTot  := format('%12.2f',[a]);
     SQLStmnt:='select first 1 a.buh_name,a.dolg,a.w_r_name,a.summa_prop,a.period,a.prorektor,a.gl_buh from tb_sprsbstable a where shifrid='+IntToStr(ShifrIdSbs);
     if pFIBQuerySBS.Open then
        pFIBQuerySBS.Close;
     if pFIBQuerySBS.Transaction.Active then
        pFIBQuerySBS.Transaction.Commit;
     pFIBQuerySBS.SQL.Clear;
     pFIBQuerySBS.SQL.Add(SQLStmnt);
     pFIBQuerySBS.Transaction.StartTransaction;
     pFIBQuerySBS.ExecQuery;
     BuhName   := trim(pFIBQuerySBS.Fields[0].AsString);
     DolgName  := trim(pFIBQuerySBS.Fields[1].AsString);
     Name_W_R  := trim(pFIBQuerySBS.Fields[2].AsString);
     SummaProp := trim(pFIBQuerySBS.Fields[3].AsString);
     Period    := trim(pFIBQuerySBS.Fields[4].AsString);
 //    Prorektor := trim(pFIBQuerySBS.Fields[5].AsString);
 //    GlBuh     := trim(pFIBQuerySBS.Fields[6].AsString);
     DolgName  := ConvertDolg(DolgName);
     pFIBQuerySBS.Close;
     pFIBQuerySBS.Transaction.Commit;
     L:=90;
     if length(SummaProp)<=l then
        begin
             prop1:=SummaProp;
             prop2:='';
        end
     else
        begin
             ic:=l;
             for i:=l downto 1 do
                 if copy(SummaProp,i,1)=' ' then
                    begin
                         ic:=i;
                         break;
                    end;
             prop1:=trim(copy(SummaProp,1,ic));
             prop2:=trim(copy(SummaProp,ic+1,l));
        end;


     if pFIBDataSetSBSPrt.Active then
        pFIBDataSetSBSPrt.Close;
     if pFIBDataSetSBSPrt.UpdateTransaction.Active then
        pFIBDataSetSBSPrt.UpdateTransaction.Commit;
     if pFIBDataSetSBSPrt.Transaction.Active then
        pFIBDataSetSBSPrt.Transaction.Commit;
     pFIBDataSetSBSPrt.Transaction.StartTransaction;
     pFIBDataSetSBSPrt.Params[0].AsInteger :=ShifrIdSbs;
     pFIBDataSetSBSPrt.Prepare;
     pFIBDataSetSBSPrt.Open;
     i:=pFIBDataSetSBSPrt.RecordCountFromSrv;
     frxReport1.ShowReport;
     if pFIBDataSetSBSPrt.Active then
        pFIBDataSetSBSPrt.Close;
     if pFIBDataSetSBSPrt.UpdateTransaction.Active then
        pFIBDataSetSBSPrt.UpdateTransaction.Commit;
     if pFIBDataSetSBSPrt.Transaction.Active then
        pFIBDataSetSBSPrt.Transaction.Commit;
end;

procedure TFormSBSSpr.dxDBGridSBSDblClick(Sender: TObject);
 var SQLStmnt:string;
     SavePlace: TBookmark;
begin
     ShifrIdSbs:=pFIBDataSetSBSSHIFRID.Value;


     SQLStmnt:='select first 1 a.dolg,a.w_r_name,a.period,a.prorektor,a.gl_buh,a.f_data,a.l_data,a.w_place,a.buh_name from tb_sprsbstable a where shifrid='+IntToStr(ShifrIdSbs);
     if pFIBQuerySBS.Open then
        pFIBQuerySBS.Close;
     if pFIBQuerySBS.Transaction.Active then
        pFIBQuerySBS.Transaction.Commit;
     pFIBQuerySBS.SQL.Clear;
     pFIBQuerySBS.SQL.Add(SQLStmnt);
     pFIBQuerySBS.Transaction.StartTransaction;
     pFIBQuerySBS.ExecQuery;

     Application.CreateForm(TFormSBSUpd, FormSBSUpd);
     FormSBSUpd.MyAction:=2;
     FormSBSUpd.wantedTabno :=pFIBDataSetSBSTabno.Value;
     FormSBSUpd.fio        := pFIBDataSetSBSFIO.Value;
     FormSBSUpd.ShifrIdSBS := ShifrIDSbs;
     FormSBSUpd.DateFR     := pFIBQuerySBS.Fields[5].AsDateTime;
     FormSBSUpd.DateTo     := pFIBQuerySBS.Fields[6].AsDateTime;
     FormSBSUpd.WantedMonth:= CurrYear;
     FormSBSUpd.WantedYear := NMES;
     FormSBSUpd.MonthVy    := pFIBDataSetSBSMONTH_VY.Value;
     FormSBSUpd.YearVy     := pFIBDataSetSBSYear_VY.Value;
     FormSBSUpd.Nal_Code   :=pFIBDataSetSBSNal_Code.Value;
     FormSBSUpd.SummaTot   := pFIBDataSetSBSSumma_Tot.Value;
     FormSBSUpd.Dolg       := pFIBQuerySBS.Fields[0].AsString;
     FormSBSUpd.Mode_Vy_Za := pFIBDataSetSBSMODE_VY_ZA.Value;
     FormSBSUpd.Prorektor  := pFIBQuerySBS.Fields[3].AsString;
     FormSBSUpd.buh_Name   := pFIBDataSetSBSBuh_Name.Value;
     FormSBSUpd.gl_buh     := pFIBQuerySBS.Fields[4].AsString;
     FormSBSUpd.Period     := pFIBQuerySBS.Fields[2].AsString;
     FormSBSUpd.ShifrPod   := pFIBQuerySBS.Fields[7].AsInteger;
     FormSBSUpd.Buh_Name   := pFIBQuerySBS.Fields[8].AsString;
     if pFIBQuerySBS.Open then
        pFIBQuerySBS.Close;
     if pFIBQuerySBS.Transaction.Active then
        pFIBQuerySBS.Transaction.Commit;

     FormSBSUpd.ShowModal;
     SavePlace := pFIBDataSetSBS.GetBookmark;
     pFIBDataSetSBS.Close;
     pFIBDataSetSBS.Open;
     pFIBDataSetSBS.GotoBookmark(SavePlace);
     pFIBDataSetSBS.FreeBookmark(SavePlace);
     dxDBGridSBS.SetFocus;

end;

procedure TFormSBSSpr.N4Click(Sender: TObject);
begin
     if pFIBDataSetSBSSHIFRID.Value<1 then Exit;
     Application.CreateForm(TFormSBSPr, FormSBSPr);
     FormSBSPr.ShifrIdOwner:=pFIBDataSetSBSSHIFRID.Value;
     FormSBSPr.Fio  := pFIBDataSetSBSFIO.Value;
     FormSBSPr.Mode_Vy_Za  := pFIBDataSetSBSMode_Vy_Za.Value;
     FormSBSPr.ShowModal;
     dxDBGridSBS.SetFocus;
end;

end.
