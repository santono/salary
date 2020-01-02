unit UFormPlatReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, ExtCtrls, DBCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  DB, FIBDataSet, pFIBDataSet, dxDBTLCl, dxGrClms, StdCtrls, Menus,
  frxClass, frxDBSet, frxDMPExport;

type
  TFormPlatReestr = class(TForm)
    pFIBDataSetPlatRee: TpFIBDataSet;
    DataSourcePlatReestr: TDataSource;
    pFIBDataSetPlatReeNOMER: TFIBIntegerField;
    pFIBDataSetPlatReeSHIFRPOD: TFIBSmallIntField;
    pFIBDataSetPlatReeNAME: TFIBStringField;
    pFIBDataSetPlatReeNMBOFREC: TFIBSmallIntField;
    pFIBDataSetPlatReeSUMMATOT: TFIBBCDField;
    pFIBDataSetPlatReeDATEWRK: TFIBDateTimeField;
    pFIBDataSetPlatReeSHIFRID: TFIBIntegerField;
    dxDBGridPlatReestr: TdxDBGrid;
    DBNavigator1: TDBNavigator;
    dxDBGridPlatReestrNOMER: TdxDBGridMaskColumn;
    dxDBGridPlatReestrSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridPlatReestrNAME: TdxDBGridMaskColumn;
    dxDBGridPlatReestrNMBOFREC: TdxDBGridMaskColumn;
    dxDBGridPlatReestrSUMMATOT: TdxDBGridCurrencyColumn;
    dxDBGridPlatReestrDATEWRK: TdxDBGridDateColumn;
    LabelHea: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    CheckBoxASCIIPrinter: TCheckBox;
    pFIBDataSetPlatReeSHIFRGRU: TFIBSmallIntField;
    pFIBDataSetPlatReeNAMEGRU: TFIBStringField;
    dxDBGridPlatReestrNameGru: TdxDBGridColumn;
    dxDBGridPlatReestrShifrGru: TdxDBGridColumn;
    frxDBDataset1: TfrxDBDataset;
    FR1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    CheckBoxAllPltWed: TCheckBox;
    frxDotMatrixExport1: TfrxDotMatrixExport;
    FR2: TMenuItem;
    EPSON1: TMenuItem;
    N5: TMenuItem;
    FR3: TMenuItem;
    frxReport1: TfrxReport;
    frxReport2: TfrxReport;
    frxReport3: TfrxReport;
    DBF1: TMenuItem;
    N6: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FR1Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FR2Click(Sender: TObject);
    procedure EPSON1Click(Sender: TObject);
    procedure frxReport2GetValue(const VarName: String;
      var Value: Variant);
    procedure frxReport3ManualBuild(Page: TfrxPage);
    procedure FR3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBF1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
       NeedASCIIPrinter : boolean;
       NeedAllPltWed    : boolean;
       NeedView         : boolean;
       NeedDosCode      : boolean;
       isPrivat         : boolean;
       isPUMB           : Boolean;
       isOSHAD          : Boolean;
       procedure ShowTable;
       function PrintPlatPodr(ShifrPod:integer;NomerPlat:integer):boolean;
       function PrintPlatPodrFR(ShifrPod:integer;NomerPlat:integer):boolean;
       procedure PrintAllWed;
       procedure PrintAllWedFR;
       function GetNameDirPlt:string;
       function GetNamePlt:string;
       function testASCIIPrinter:boolean;
       function IsSelectedPodrGru(WantedShifrPod:integer;WantedShifrGru:integer):boolean;
       procedure PrepareAllPlatInDBF;


  public
    { Public declarations }
    ShifrBan : integer;
    ShifrSta : integer;
    ShifrGru : integer;
    Mode_U_K : integer;
    MonthVy  : integer;
    YearVy   : integer;
  end;

var
  FormPlatReestr: TFormPlatReestr;

implementation
  uses UFibModule, uFormWait,ScrUtil,ScrLists,ScrDef,UFORMVIEW,IniFiles,ComObj,
       TextPrinter,DBF,UFormWaitMess,UFormBankDBFView;
  var
      dev : TextFile;
      ASCIIPrinter:TTextPrinter;

{$R *.dfm}

procedure TFormPlatReestr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetPlatRee.Active then pFIBDataSetPlatRee.Active:=false;

{
     if pFIBDataSetPlatRee.Transaction.InTransaction then
        pFIBDataSetPlatRee.Transaction.Commit;
}        
     Action:=caFree;
end;

procedure TFormPlatReestr.ShowTable;
var i:integer;
    S,C:string;
    GruppyListStr,GruppyNameListStr:string;
    FilterString : String;
begin
      c:=BankiList.getBankName(shifrBan);
(*
      case ShifrBan of
       0: C:='Касса';
       1: C:='ПриватБанк';
       2: C:='УкрСоцБанк';
      else
//          C:='БрокБизнесБанк';
          C:='УкрСибБанк';
      end;
*)      
       GruppyListStr:='';
       GruppyNameListStr:='';
       FilterString:='';
       for i:=1 to MAX_GRUPPA do
           begin
                if CURR_GRUPPA[I] then
                   begin
                        if length(trim(GruppyListStr))>0 then
                           begin
                                GruppyListStr:=GruppyListStr+',';
                                GruppyNameListStr:=GruppyNameListStr+',';
                                FilterString:=FilterString+' or ';
                           end;
                        GruppyListStr := GruppyListStr+trim(IntToStr(i));
                        GruppyNameListStr := GruppyNameListStr+trim(GET_IST_NAME(i));
                        FilterString := FilterString+'(SHIFRGRU='+trim(IntToStr(i))+')';
                   end;
           end;

//      S:='Реестр платежных ведомостей '+trim(GruppyNameListStr);
      S:=trim(GruppyNameListStr);
      S:=s+' '+trim(ShifrList.GetName(ShifrSta))+' '+Trim(C);
      s:=s+' в '+trim(MONTH[MonthVy])+' '+IntToStr(WORK_YEAR_VAL);
      LabelHea.Caption:=S;
      FormWait.Show;
      Application.ProcessMessages;
      if pFIBDataSetPlatRee.Active then
         pFIBDataSetPlatRee.Active:=false;
      pFIBDataSetPlatRee.Params[0].AsInteger:=Self.MonthVy;
      pFIBDataSetPlatRee.Params[1].AsInteger:=Self.YearVy;
      pFIBDataSetPlatRee.Params[2].AsInteger:=Self.ShifrBan;
{      pFIBDataSetPlatRee.Params[3].AsInteger:=Self.ShifrGru;}
//      pFIBDataSetPlatRee.Params[3].AsString:=GruppyListStr;
      pFIBDataSetPlatRee.Params[3].AsInteger:=Self.ShifrSta;
      pFIBDataSetPlatRee.Params[4].AsInteger:=Self.Mode_U_K;
      if pFIBDataSetPlatRee.Prepared then
         i:=1
      else
         begin
             pFIBDataSetPlatRee.Prepare;
             i:=0;
         end;
      i:=pFIBDataSetPlatRee.SelectSql.Count;
      s:='';
      for i:=0 to pFIBDataSetPlatRee.SelectSql.Count-1 do
          begin
                c:=pFIBDataSetPlatRee.SelectSql[i];
                S:=s+c;
          end;
      pFIBDataSetPlatRee.Filter:=FilterString;
      pFIBDataSetPlatRee.Filtered:=true;
      pFIBDataSetPlatRee.Open;
      FormWait.Hide;
end;
procedure TFormPlatReestr.FormShow(Sender: TObject);
begin
     ShowTable;
end;

procedure TFormPlatReestr.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetPlatRee.Active then
        pFIBDataSetPlatRee.Active:=true;
     if not TestASCIIPrinter then
        CheckBoxASCIIPrinter.Hide
                             else
        CheckBoxASCIIPrinter.Show;
     NeedView := true;

end;

function TFormPlatReestr.PrintPlatPodr(ShifrPod:integer;NomerPlat:integer):boolean;
 const PageSize=19;
 var
    PageNo   : integer;
    PageSum  : real;
    TotalSum : real;
    LineNo   : integer;
    SQLStmnt : string;
  function OutLine(S:String):boolean;
   begin
         Result := true;
         if NeedASCIIPrinter then
            begin
                  try
                     ASCIIPrinter.WriteLn(S);
                  except
                     if YesNo('Ошибка печати. Завершить печать?') then
                        Result := false;
                  end
            end
         else
            if NeedDosCode then S:=wintodos(S);
            writeln(dev,S);
   end;
  procedure OutLineLF;
   begin
         if NeedASCIIPrinter then
            ASCIIPrinter.WriteLn(chr(12))
                             else
            writeln(dev,chr(12));
   end;
  procedure PrintHat;
   var S:string;
   begin
        if (NeedASCIIPrinter and (PageNo>0)) then
           ShowMessage('Смените страницу на принтере');
        OutLine('                  УКРАЇНА');
        s:=getNameHat;
//        OutLine('   СХІДНОУКРАЇНСЬКИЙ НАЦІОНАЛЬНИЙ УНІВЕРСИТЕТ ім.В.Даля');
        OutLine(S);
        s:=' ВІДОМІСТЬ ';
        s:=s+trim(ShifrList.GetName(Self.ShifrSta))+' ';
        s:=s+trim(MONTH[NMES])+' ';
{        s:=' ВЕДОМІСТЬ ЗАРПЛ НА БАНКОМАТ ЗА '+Trim(MONTH[NMES])+' ';}
        s:=s+IntToStr(WORK_YEAR_VAL)+' г.      ';
        if NomerPlat>0 then
           s:=s+IntToStr(NomerPlat);
        OutLine(s);
        s:=FORMAT('%60s',[GET_IST_NAME(ShifrGru)]);
        OutLine(s);
        s:={IntToStr(ShifrPod)+' '+}trim(NAME_SERV(ShifrPod));
        if length(trim(s))>54 then
           s:=copy(s+space(54),1,54);
        s:=s+' Аркуш N '+IntToStr(PageNo);
        s:=FORMAT('%60s',[s]);
        OutLine(s);
        OutLine('----------------------------------------------------------------');
//        OutLine(': N :     ПРІЗВИЩЕ       :  : ТАБ :    СУМА    :   ПІДПИС ПРО  :');
//        OutLine(':П/П:  ІМ''Я ПОБАТЬКОВІ   :  :  N  :            :   ОТРИМАННЯ   :');
//09 05 2016        OutLine(': N :     ПРІЗВИЩЕ       :  : ТАБ :    СУМА    :ІДЕНТИФІКАЦІЙН.:');
//09 05 2016        OutLine(':П/П:  ІМ''Я ПОБАТЬКОВІ   :  :  N  :            :      КОД      :');
        OutLine(': N :     ПРІЗВИЩЕ       :ІДЕНТИФІКАЦІЙН.:    СУМА    :');
        OutLine(':П/П:  ІМ''Я ПОБАТЬКОВІ   :      КОД      :            :');
        OutLine('----------------------------------------------------------------');
   end;
  Procedure PrintPageFooter;
   var S:String;
   begin
        S:=FormatSummaForPlt(PageSum);

        OutLine('----------------------------------------------------------------');
//      OutLine(': ИТОГО ПО CТРАНИЦЕ               :'+S+':               :');
        OutLine(': РАЗОМ ПО CТОРИНЦІ                      :'+S+':');
        OutLine('----------------------------------------------------------------');
        PageSum:=0;
        PageNo:=PageNo+1;
   end;
  function PrintLine:boolean;
   var S:String;
   begin
        Result := true;
        s:=FIB.pFIBQuery.Fields[4].AsString;
        S:=FormatSummaForPlt(FIB.pFIBQuery.Fields[3].AsFloat);
        if not OutLine(':'+FORMAT('%3d',[FIB.pFIBQuery.Fields[0].AsInteger])+':'+
//                 FORMAT('%-20s',[FIB.pFIBQuery.Fields[1].AsString])+':  :'+
//                 FORMAT('%5d',[FIB.pFIBQuery.Fields[2].AsInteger])+':'+
//                   S+':  '+copy(FIB.pFIBQuery.Fields[4].AsString+space(10),1,10)+'   :') then
                 FORMAT('%-20s',[FIB.pFIBQuery.Fields[1].AsString])+':  '+
                   copy(FIB.pFIBQuery.Fields[4].AsString+space(10),1,10)+'   :'+s+':        :') then
           begin
                Result:=false;
                Exit;
           end;
        S:=copy(FIB.pFIBQuery.Fields[4].AsString+space(10),1,10);
//        OutLine(':   :                    :  :     :            :               :');
        OutLine(':   :                    :               :            :');
//old        OutLine(':   :'+FORMAT('%-20s',[S])+':  :     :            :               :');
        Inc(LineNo);
        PageSum:=PageSum   + FIB.pFIBQuery.Fields[3].AsFloat;
        TotalSum:=TotalSum + FIB.pFIBQuery.Fields[3].AsFloat;
        if (LineNo Mod PageSize = 0) then
            begin
                 PrintPageFooter;
                 OutLineLf;
                 PrintHat;
            end;

   end;
  Procedure PrintFooter;
   var S:String;
       c:string;
       s1,s2:string;

   begin
        s1:=copy(getRektorDolg+space(40),1,40)+trim(getRektorFIO);
        s2:=copy(getGlBuhDolg+space(40),1,40)+trim(getGlBuhFIO);
        c:=AnsiUpperCase(copy(s2,1,1));
        s2[1]:=c[1];
        c:=AnsiUpperCase(copy(s1,1,1));
        s1[1]:=c[1];
        if PageSum>0.005 then PrintPageFooter;
        s:=FormatSummaForPlt(TotalSum);
   //     c:={copy(IntToStr(ShifrPod)+' '+}trim(Name_serv(ShifrPod))+space(23),1,23);
        c:=copy(trim(Name_serv(ShifrPod))+space(30),1,30);
        OutLine('----------------------------------------------------------------');
//        OutLine(': ИТОГО ПО '+C+':'+S+':               :');
        OutLine(': РАЗОМ ПО '+C+':'+s+':        :');
//old        OutLine(': РАЗОМ ПО '+C+':'+S+':               :');
        OutLine('----------------------------------------------------------------');
//        OutLine(': По настоящей ведомости выплат    выплачено грн.            :');
        OutLine(': За цією відомостю виплат виплачено  грн.                     :');
        OutLine(':                                                              :');
//        OutLine(': '+copy(trim(DIREKTOR_DOLG_NAME)+space(80),1,61)+':');
        OutLine(': '+copy(trim(s1)+space(80),1,61)+':');
        OutLine(':                                                              :');
//        OutLine(': '+copy(trim(GL_BUH_DOLG_NAME)+space(80),1,61)+':');
        OutLine(': '+copy(trim(s2)+space(80),1,61)+':');
        OutLine(':                                                              :');
        OutLine(': Бухгалтер                                                    :');
(*
        OutLine(': За цією відомостю виплат депоновано грн          .           :');
        OutLine(':                                                              :');
        OutLine(': Касир                                                        :');
*)
        OutLine('----------------------------------------------------------------');
        OutLine('');
(*
        OutLine('');
    //    if modeIskra then
           OutLine(trim(DIREKTOR_DOLG_NAME));
    //    else
    //       OutLine('Ректоp                                  Голубенко О.Л.');
        OutLine('');
        OutLine('');
        OutLine('');
    //    if modeIskra then
           OutLine(trim(GL_BUH_DOLG_NAME));
    //   else
    //      OutLine('Головний бухгалтер                       Бєлоусова Л.І.');
*)
        OutLineLf;
   end;

 begin
       result   := true;
       PageNo   := 1;
       PageSum  := 0;
       TotalSum := 0;
       LineNo   := 1;
       FIB.pFIBQuery.Close;
       PrintHat;
       FIB.pFIBQuery.SQL.Clear;
       SQLStmnt:='select lineno,fio,tabno,summa,coalesce((select first 1 nal_code from kadry where kadry.tabno=tb_plat_pr.tabno),'' '') as n_code from tb_plat_pr where shifridplat='+IntToStr(pFIBDataSetPlatRee.FieldByName('ShifrId').AsInteger)+' ORDER BY LINENO';
       FIB.pFIBQuery.SQL.Add(SQLStmnt);
       try
          FIB.pFIBQuery.ExecQuery;
          while not FIB.pFIBQuery.Eof do
           begin
                if not PrintLine then
                   begin
                        result:=false;
                        Exit;
                   end;
                FIB.pFIBQuery.Next;
           end;
       except
          ShowMessage('Ошибка SQL');
       end;
       PrintFooter;
 end;

function TFormPlatReestr.IsSelectedPodrGru(WantedShifrPod:integer;WantedShifrGru:integer):boolean;
var
  i, j, k: Integer;
  s:string;
begin
  Result:=false;
  if NeedAllPltWed then Result:=true
  else
  if dxDBGridPlatReestr.SelectedCount>0 then
    with dxDBGridPlatReestr.DataSource.DataSet do
      for i:=0 to dxDBGridPlatReestr.SelectedCount-1 do
      begin
{           GotoBookmark(pointer(dxDBGridPodr.SelectedRows.Items[i]));}
{           j:=Fields[0].AsInteger;}
{           s:=dxDBGridPlatReestr.SelectedRows[i];}
           s:=dxDBGridPlatReestr.SelectedNodes[i].Strings[7];
           val(dxDBGridPlatReestr.SelectedNodes[i].Strings[2],j,k);
           if k=0 then
               if j>0 then
                  if j=WantedShifrPod then
                     begin
                          val(dxDBGridPlatReestr.SelectedNodes[i].Strings[7],j,k);
                          if k=0 then
                             if j>0 then
                                if j=WantedShifrGru then
                                   begin
                                         Result:=true;
                                         break;
                                   end;
                     end;
      end;
end;


procedure TFormPlatReestr.PrintAllWed;
 type PInteger=^Integer;
 var CurrShifrGru   : integer;
     CurrShifrPod   : integer;
     WorkShifrGru   : integer;
     GruppySelList  : TList;
     GloSavePlace   : TBookmark;
     PShifrIdGru    : PInteger;
     Finded         : boolean;
     i              : integer;
 procedure PrintAllPodrForWantedGru(WantedShifrGru:integer);
   var CShifrGru : integer;
       SavePlace : TBookmark;
       NomerPlat : integer;
       CShifrPod : integer;
       t         : String;
   begin
       Self.ShifrGru:=WantedShifrGru;
       if not NeedASCIIPrinter then
          begin
               t:=GetNamePlt;
               AssignFile(dev,t);
               try
                  ReWrite(dev);
               except
                  on e:Exception do
                     begin
                          ShowMessage(trim(e.Message)+^M+' Проверьте правильность имени файла '+trim(t));
                          Exit;
                     end;
               end
          end;
       SavePlace := pFIBDataSetPlatRee.GetBookmark;
       pFIBDataSetPlatRee.First;
       while not pFIBDataSetPlatRee.Eof do
        begin
             CShifrPod:=pFIBDataSetPlatRee.FieldByName('ShifrPod').AsInteger;
             CShifrGru:=pFIBDataSetPlatRee.FieldByName('ShifrGru').AsInteger;
             if CShifrGru=WantedShifrGru then
             if IsSelectedPodrGru(CShifrPod,CShifrGru) then
                begin
                      NomerPlat:=pFIBDataSetPlatRee.FieldByName('Nomer').AsInteger;
                      if not PrintPlatPodr(CShifrPod,NomerPlat) then break;
                end;
             pFIBDataSetPlatRee.Next;
        end;
       pFIBDataSetPlatRee.GotoBookmark(SavePlace);
       pFIBDataSetPlatRee.FreeBookmark(SavePlace);
       if not NeedASCIIPrinter then
          begin
               CloseFile(dev);
               if NeedView then  view(t);
          end;
  end;
 begin
       if NeedASCIIPrinter then
          begin
               try
                   ASCIIPrinter:=TTextPrinter.Create;
               except
                    ShowMessage('Матричный принтер не включен или не подключен к этому компьютеру');
                    Exit;
               end;
          end;

       GruppySelList := TList.Create;
       GloSavePlace  := pFIBDataSetPlatRee.GetBookmark;
       pFIBDataSetPlatRee.First;
       while not pFIBDataSetPlatRee.Eof do
        begin
             CurrShifrGru:=pFIBDataSetPlatRee.FieldByName('ShifrGru').AsInteger;
             CurrShifrPod:=pFIBDataSetPlatRee.FieldByName('ShifrPod').AsInteger;
             if (IsSelectedPodrGru(CurrShifrPod,CurrShifrGru)) then
                begin
                      Finded:=false;
                      if GruppySelList.Count>0 then
                         for i:=0 to GruppySelList.Count-1 do
                             begin
                                   PShifrIdGru:=GruppySelList.Items[i];
                                   WorkShifrGru := PShifrIdGru^;
                                   if  WorkShifrGru=CurrShifrGru then
                                       begin
                                            Finded:=true;
                                            break;
                                       end;
                             end;
                      if not Finded then
                         begin
                              New(PShifrIdGru);
                              PShifrIdGru^:=CurrShifrGru;
                              GruppySelList.Add(PShifrIdGru);
                          end;
                end;
             pFIBDataSetPlatRee.Next;
        end;
       pFIBDataSetPlatRee.GotoBookmark(GloSavePlace);
       pFIBDataSetPlatRee.FreeBookmark(GloSavePlace);
       if GruppySelList.Count>0 then
          for i:=0 to GruppySelList.Count-1 do
              begin
                   CurrShifrGru:=PInteger(GruppySelList.Items[i])^;
                   PrintAllPodrForWantedGru(CurrShifrGru);
              end;
       GruppySelList.Free;
       if NeedASCIIPrinter then
          if Assigned(ASCIIPrinter) then
             ASCIIPrinter.Free;
 end;
function TFormPlatReestr.GetNameDirPlt:string;
 var s : string;
 begin
      if ShifrBan>0 then
         Result:=cdoc+'disk\'+trim(bankiList.getBankDir(shifrBan))+'\'
      else
         Result:=cdoc+'disk\';
(*
      if ShifrBan=1 then Result:=cdoc+'disk\Privat\'
                    else
      if ShifrBan=2 then Result:=cdoc+'disk\BrokB\'
                    else
      if ShifrBan=3 then Result:=cdoc+'disk\UkrSib\'
                    else Result:=cdoc+'disk\';
*)
 end;
function TFormPlatReestr.GetNamePlt:string;
 var s : string;
     DirName : string;
 begin
       DirName:=GetNameDirPlt;
       FIB.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('select first 1 name_plat from gruppy where shifr='+IntToStr(ShifrGru));
       try
          FIB.pFIBQuery.ExecQuery;
          s:=trim(FIB.pFIBQuery.Fields[0].AsString);
          Result:=DirName+trim(s)+'.txt';
       except
          ShowMessage('Ошибка SQL');
          Result:=cdoc+'disk\'+'_plt.txt';
       end;

 end;
procedure TFormPlatReestr.N1Click(Sender: TObject);
begin
{
      if NeedView then
         begin
               NeedASCIIPrinter := CheckBoxASCIIPrinter.Checked;
               NeedAllPltWed    := CheckBoxAllPltWed.Checked;
         end;
      PrintAllWed;
}
end;

procedure TFormPlatReestr.N2Click(Sender: TObject);
const FNameIni='dscroll.ini';
      StartRow = 1;
      EndRow   = 300;
var FName,S,NomerPlt,SummaTotS,ShifrPodS,NamePodr:string;
    Row,ShifrPod,i  : integer;
    Ini         : TIniFile;
    V           : Variant;
    SummaTot    : real;
begin
     ShowMessage('Для создания реестра воспользуйтесь пунктом ниже');
     Exit;
{
      FName:='';
      S   := ExtractFilePath(Application.ExeName)+FNameINI;
      Ini := TIniFile.Create(S);
      try
          FName := Ini.ReadString( 'Parameters', 'REEPLT', '' )
      finally
         Ini.Free;
      end;
      if not FileExists(FName) then
         begin
               ShowMessage('В Ini файле неверно указано имя шаблона реестра плтежных поручений');
               Exit;
         end;
}
      FName:=TemplateDIR+'REEPLT.xls';
      if not FileExists(FName) then
         begin
               ShowMessage('Отсутствует шаблон '+FName);
               Exit;
         end;



      try

         try
             V:=CreateOleObject('Excel.Application');
         except
             ShowMessage('Ошибка запуска Excel');
             Exit;
         end;
         V.Visible:=True;
         V.WorkBooks.Open(FName);
         V.WorkBooks[1].WorkSheets['Shbl'].Copy(After:=V.WorkBooks[1].WorkSheets['Shbl']);
         V.WorkBooks[1].WorkSheets['Shbl (2)'].Name:='1';
         pFIBDataSetPlatRee.First;
         while not pFIBDataSetPlatRee.Eof do
               begin
                    ShifrPod := pFIBDataSetPlatRee.FieldByName('ShifrPod').AsInteger;
                    NomerPlt := pFIBDataSetPlatRee.FieldByName('Nomer').AsString;
                    SummaTot := pFIBDataSetPlatRee.FieldByName('SummaTot').AsFloat;
                    NamePodr := pFIBDataSetPlatRee.FieldByName('NAME').AsString;
                    for row:=StartRow to EndRow do
                        begin
                              if V.WorkBooks[1].WorkSheets['1'].Cells[row,1].Value=ShifrPod then
                                 begin
                                       V.WorkBooks[1].WorkSheets['1'].Cells[row,2]:=Get_Ist_Name(ShifrGru);
                                       V.WorkBooks[1].WorkSheets['1'].Cells[row,3]:=NomerPlt;
                                       V.WorkBooks[1].WorkSheets['1'].Cells[row,4]:=IntToStr(ShifrPod)+' '+NamePodr;
                                       V.WorkBooks[1].WorkSheets['1'].Cells[row,5]:=SummaTot;
                                       break;
                                 end;
                        end;
                    pFIBDataSetPlatRee.Next;
               end;

          for row:=StartRow to EndRow do
              begin
                   ShifrPodS:=V.WorkBooks[1].WorkSheets['1'].Cells[row,1];
                   SummaTotS:=V.WorkBooks[1].WorkSheets['1'].Cells[row,5];
                   val(ShifrPodS,ShifrPod,i);
                   if i<>0 then continue;
                   if (ShifrPod>0) and (length(trim(SummaTotS))=0) then
                      V.WorkBooks[1].WorkSheets['1'].Rows[row].Hidden:=true;
                   if length(trim(SummaTotS))>0 then
                      SummaTotS:=ReplChar(SummaTotS,',','.');
                   val(SummaTotS,SummaTot,i);
                   if i<>0 then continue;
                   if (ShifrPod>0) and (SummaTot<0.01) then
                      V.WorkBooks[1].WorkSheets['1'].Rows[row].Hidden:=true;
              end;
          V.WorkBooks[1].WorkSheets['1'].Columns[1].Hidden:=true;
      except
          on E:Exception do
             ShowMessage(E.Message);
      end;

end;

function TFormPlatReestr.testASCIIPrinter:boolean;
 var t:string;
     dev:textfile;
 begin
      Result:=true;
      t:='LPT1';
      AssignFile(dev,t);
      try
         ReWrite(Dev);
         CloseFile(Dev);
       except
         Result:=false;
       end;
 end;
procedure TFormPlatReestr.FR1Click(Sender: TObject);
 begin
   {  frxReport1.ShowReport;}
 end;

procedure TFormPlatReestr.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if VarName='Year' then Value:=IntToStr(Self.YearVy)
     else if VarName='Month' then Value:=GetMontHRus(MonthVy)+' '+IntToStr(Self.YearVy)+' г.'
     else if VarName='ShifrNameSta' then Value:=IntToStr(ShifrSta)+' '+trim(ShifrList.GetName(ShifrSta));
//      S:=s+' '+trim(ShifrList.GetName(ShifrSta))+' '+Trim(C);
//      s:=s+' в '+trim(MONTH[MonthVy])+' '+IntToStr(CurrYear);

end;

procedure TFormPlatReestr.N3Click(Sender: TObject);
begin
      ShowMessage('Каталог, в котором сохраняются файлы для дискеты '+GetNameDirPlt);
end;

procedure TFormPlatReestr.N4Click(Sender: TObject);
 begin
       NeedView         := false;
       NeedASCIIPrinter := false;
       NeedAllPltWed    := true;
       NeedDosCode      := true;
       N5Click(Sender);
       NeedDosCode      := false;
       NeedView         := true;
       ShowMessage('Файлы для дискеты подготовлены в каталоге '+GetNameDirPlt);


 end;

procedure TFormPlatReestr.FR2Click(Sender: TObject);
begin
     frxReport1.ShowReport;
end;

procedure TFormPlatReestr.EPSON1Click(Sender: TObject);
begin
     frxReport2.ShowReport;
end;

procedure TFormPlatReestr.frxReport2GetValue(const VarName: String;
  var Value: Variant);
begin
     if VarName='M' then Value:=GetMontHRus(MonthVy)+' '+IntToStr(Self.YearVy)+' г.'
     else if VarName='StaList' then Value:=IntToStr(ShifrSta)+' '+trim(ShifrList.GetName(ShifrSta));

end;

procedure TFormPlatReestr.frxReport3ManualBuild(Page: TfrxPage);
begin
       PrintAllWedFR;
end;

procedure TFormPlatReestr.PrintAllWedFR;
 type PInteger=^Integer;
 var CurrShifrGru   : integer;
     CurrShifrPod   : integer;
     WorkShifrGru   : integer;
     GruppySelList  : TList;
     GloSavePlace   : TBookmark;
     PShifrIdGru    : PInteger;
     Finded         : boolean;
     i              : integer;
 procedure PrintAllPodrForWantedGru(WantedShifrGru:integer);
   var CShifrGru : integer;
       SavePlace : TBookmark;
       NomerPlat : integer;
       CShifrPod : integer;
       t         : String;
   begin
       Self.ShifrGru:=WantedShifrGru;
       SavePlace := pFIBDataSetPlatRee.GetBookmark;
       pFIBDataSetPlatRee.First;
       while not pFIBDataSetPlatRee.Eof do
        begin
             CShifrPod:=pFIBDataSetPlatRee.FieldByName('ShifrPod').AsInteger;
             CShifrGru:=pFIBDataSetPlatRee.FieldByName('ShifrGru').AsInteger;
             if CShifrGru=WantedShifrGru then
             if IsSelectedPodrGru(CShifrPod,CShifrGru) then
                begin
                      NomerPlat:=pFIBDataSetPlatRee.FieldByName('Nomer').AsInteger;
                      if not PrintPlatPodrFR(CShifrPod,NomerPlat) then break;
                end;
             pFIBDataSetPlatRee.Next;
        end;
       pFIBDataSetPlatRee.GotoBookmark(SavePlace);
       pFIBDataSetPlatRee.FreeBookmark(SavePlace);
  end;
 begin

       GruppySelList := TList.Create;
       GloSavePlace  := pFIBDataSetPlatRee.GetBookmark;
       pFIBDataSetPlatRee.First;
       while not pFIBDataSetPlatRee.Eof do
        begin
             CurrShifrGru:=pFIBDataSetPlatRee.FieldByName('ShifrGru').AsInteger;
             CurrShifrPod:=pFIBDataSetPlatRee.FieldByName('ShifrPod').AsInteger;
             if (IsSelectedPodrGru(CurrShifrPod,CurrShifrGru)) then
                begin
                      Finded:=false;
                      if GruppySelList.Count>0 then
                         for i:=0 to GruppySelList.Count-1 do
                             begin
                                   PShifrIdGru:=GruppySelList.Items[i];
                                   WorkShifrGru := PShifrIdGru^;
                                   if  WorkShifrGru=CurrShifrGru then
                                       begin
                                            Finded:=true;
                                            break;
                                       end;
                             end;
                      if not Finded then
                         begin
                              New(PShifrIdGru);
                              PShifrIdGru^:=CurrShifrGru;
                              GruppySelList.Add(PShifrIdGru);
                          end;
                end;
             pFIBDataSetPlatRee.Next;
        end;
       pFIBDataSetPlatRee.GotoBookmark(GloSavePlace);
       pFIBDataSetPlatRee.FreeBookmark(GloSavePlace);
       if GruppySelList.Count>0 then
          for i:=0 to GruppySelList.Count-1 do
              begin
                   CurrShifrGru:=PInteger(GruppySelList.Items[i])^;
                   PrintAllPodrForWantedGru(CurrShifrGru);
              end;
       GruppySelList.Free;
 end;

function TFormPlatReestr.PrintPlatPodrFR(ShifrPod:integer;NomerPlat:integer):boolean;
 const PageSize=19;
 var
    PageNo   : integer;
    PageSum  : real;
    TotalSum : real;
    LineNo   : integer;
  procedure PrintHat;
   var S:string;

   begin
        s:=getNameHat;
        s:=ReplQuot(s);

        frxReport3.Variables['NAMEORGHAT']:=''''+s+'''';

        s:=trim(ShifrList.GetName(Self.ShifrSta))+' ';
        s:=s+trim(MONTH[NMES])+' ';
        s:=s+IntToStr(WORK_YEAR_VAL)+' р.';
        s:=ReplQuot(s);
        frxReport3.Variables['NAMESTA']:=''''+s+'''';
        if NomerPlat>0 then
            s:=IntToStr(NomerPlat)
        else
            s:=' ';
        frxReport3.Variables['NOMER']:=''''+s+'''';
        s:=GET_IST_NAME(ShifrGru);
        s:=ReplQuot(s);
        frxReport3.Variables['NAMEGRU']:=''''+s+'''';
        s:=trim(NAME_SERV(ShifrPod));
        s:=ReplQuot(s);
        frxReport3.Variables['NAMEPODR']:=''''+s+'''';
        frxReport3.Variables['PAGENO']:=''''+IntToStr(PageNo)+'''';
        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataHat') as TfrxMasterData);
   end;
  Procedure PrintPageFooter;
   var S:String;
   begin
        s:=FormatSummaForPlt(PAGESUM);
        frxReport3.Variables['PAGESUMMA']:=''''+s+'''';
        PageSum:=0;
        PageNo:=PageNo+1;
        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataPage') as TfrxMasterData);
   end;
  function PrintLine:boolean;
   var S:String;
   begin
        Result := true;
        S:=FORMAT('%3d',[FIB.pFIBQuery.Fields[0].AsInteger]);
        frxReport3.Variables['LINENO']:=''''+s+'''';
        S:=FORMAT('%-20s',[FIB.pFIBQuery.Fields[1].AsString]);
        s:=ReplQuot(s);
        frxReport3.Variables['FIO']:=''''+s+'''';
        S:=FORMAT('%5d',[FIB.pFIBQuery.Fields[2].AsInteger]);
        frxReport3.Variables['TABNO']:=''''+s+'''';
//      S:=FORMAT('%12.2f',[FIB.pFIBQuery.Fields[3].AsFloat]);
//      s:=ReplChar(S,',','-');
        s:=FormatSummaForPlt(FIB.pFIBQuery.Fields[3].AsFloat);
        frxReport3.Variables['SUMMA']:=''''+s+'''';
        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataLine') as TfrxMasterData);
        Inc(LineNo);
        PageSum:=PageSum   + FIB.pFIBQuery.Fields[3].AsFloat;
        TotalSum:=TotalSum + FIB.pFIBQuery.Fields[3].AsFloat;
        if (LineNo Mod PageSize = 0) then
            begin
                 PrintPageFooter;
                 frxReport3.Engine.NewPage;
                 PrintHat;
            end;

   end;
  Procedure PrintFooter;
   var S,s1,s2:String;
       c:string;
       DirectName:string;
       GlBuhName:string;

   begin
    //    if modeIskra then
           begin
                DirectName := DIREKTOR_DOLG_NAME;
                GlBuhName  := GL_BUH_DOLG_NAME;
                s1:=copy(getRektorDolg+space(40),1,40)+trim(getRektorFIO);
                s2:=copy(getGlBuhDolg+space(40),1,40)+trim(getGlBuhFIO);
                c:=AnsiUpperCase(copy(s2,1,1));
                s2[1]:=c[1];
                c:=AnsiUpperCase(copy(s1,1,1));
                s1[1]:=c[1];
                DirectName := s1;
                GlBuhName  := s2;
           end;
    //    else
    //       begin
    //            DirectName := 'Ректор                                    Голубенко О.Л.';
    //            GlBuhName  := 'Головний бухгалтер                        Бєлоусова Л.І.';
    //       end;
        if PageSum>0.005 then PrintPageFooter;
//        S:=Format('%12.2f',[TotalSum]);
//        s:=ReplChar(S,',','-');
        s:=FormatSummaForPlt(TotalSum);
        frxReport3.Variables['PODRSUMMA']:=''''+s+'''';
        frxReport3.Variables['DirektName']:=''''+DirectName+'''';
        frxReport3.Variables['GlBuhName']:=''''+GlBuhName+'''';
        frxReport3.Engine.ShowBand(frxReport3.FindObject('MasterDataFot') as TfrxMasterData);
        frxReport3.Engine.NewPage;
   end;

 begin
       result   := true;
       PageNo   := 1;
       PageSum  := 0;
       TotalSum := 0;
       LineNo   := 1;
       FIB.pFIBQuery.Close;
       PrintHat;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add('select lineno,fio,tabno,summa from tb_plat_pr where shifridplat='+IntToStr(pFIBDataSetPlatRee.FieldByName('ShifrId').AsInteger)+' ORDER BY LINENO');
       try
          FIB.pFIBQuery.ExecQuery;
          while not FIB.pFIBQuery.Eof do
           begin
                if not PrintLine then
                   begin
                        result:=false;
                        Exit;
                   end;
                FIB.pFIBQuery.Next;
           end;
       except
          ShowMessage('Ошибка SQL');
       end;
       PrintFooter;
 end;

procedure TFormPlatReestr.FR3Click(Sender: TObject);
begin
        NeedAllPltWed    := CheckBoxAllPltWed.Checked;
        frxReport3.ShowReport;
end;

procedure TFormPlatReestr.N5Click(Sender: TObject);
begin
      if NeedView then
         begin
               NeedASCIIPrinter := CheckBoxASCIIPrinter.Checked;
               NeedAllPltWed    := CheckBoxAllPltWed.Checked;
         end;
      PrintAllWed;

end;

procedure TFormPlatReestr.PrepareAllPlatInDBF;
 type PInteger=^Integer;
 var CurrShifrGru   : integer;
     CurrShifrPod   : integer;
     WorkShifrGru   : integer;
     GruppySelList  : TList;
     GloSavePlace   : TBookmark;
     PShifrIdGru    : PInteger;
     Finded         : boolean;
     i              : integer;
     dBase          : TDBF;
     fmsFloatPoint  : TFormatSettings;
     DateForDBFRecordS : string;
 { ----- Копирование DBF файла из эталонного -----}
 function MakeDBFFileForPrivat(FNameDBF:String):String;
   var
      S        : string   ;
      DBFDir   : string   ;
      Ch       : string   ;
      DBFNameE : string   ;
      DBFNameD : string   ;
   begin
     DBFDir:=Bank_Dir;
     if not DirectoryExists(DBFDir) then
     if not CreateDir(DBFDir)       then
        begin
             ShowMessage('Отсутствует каталог '+DBFDir+' и не возможно создать его');
             Result:='';
             Exit;
        end;
     Ch:=copy(DBFDir,Length(DBFDir),1);
     if (not (Ch[1]  in ['\','/'])) then
        begin
              if pos('\',DBFDir)>0 then DBFDir:=DBFDir+'\'
              else
              if pos('/',DBFDir)>0 then DBFDir:=DBFDir+'/';
        end;
     DBFNameE:=DBFDir+'PriBankE.dbf';
     if not FileExists(DBFNameE) then
        begin
             ShowMessage('Отсутствует файл '+DBFNameE);
             Result:='';
             Exit;
        end;
     DBFNameD:=FNameDBF;
     if FileExists(DBFNameD)     then
     if not DeleteFile(DBFNameD) then
        begin
             ShowMessage('Ошибка удаления файла  '+DBFNameD);
             Result:='';
             Exit;
        end;
     if not CopyFile(PChar(DBFNameE),PChar(DBFNameD),true) then
        begin
             ShowMessage('Ошибка копирования файла '+DBFNameE+' в '+ DBFNameD);
             Result:='';
             Exit;
        end;
     Result:=DBFNameD;
 end;
 function MakeDBFFileForPUMB(FNameDBF:String):String;
   var
      S        : string   ;
      DBFDir   : string   ;
      Ch       : string   ;
      DBFNameE : string   ;
      DBFNameD : string   ;
   begin
     DBFDir:=Bank_Dir;
     if not DirectoryExists(DBFDir) then
     if not CreateDir(DBFDir)       then
        begin
             ShowMessage('Отсутствует каталог '+DBFDir+' и не возможно создать его');
             Result:='';
             Exit;
        end;
     Ch:=copy(DBFDir,Length(DBFDir),1);
     if (not (Ch[1]  in ['\','/'])) then
        begin
              if pos('\',DBFDir)>0 then DBFDir:=DBFDir+'\'
              else
              if pos('/',DBFDir)>0 then DBFDir:=DBFDir+'/';
        end;
     DBFNameE:=DBFDir+'PUMB66E.dbf';
     if not FileExists(DBFNameE) then
        begin
             ShowMessage('Отсутствует файл '+DBFNameE);
             Result:='';
             Exit;
        end;
     DBFNameD:=FNameDBF;
     if FileExists(DBFNameD)     then
     if not DeleteFile(DBFNameD) then
        begin
             ShowMessage('Ошибка удаления файла  '+DBFNameD);
             Result:='';
             Exit;
        end;
     if not CopyFile(PChar(DBFNameE),PChar(DBFNameD),true) then
        begin
             ShowMessage('Ошибка копирования файла '+DBFNameE+' в '+ DBFNameD);
             Result:='';
             Exit;
        end;
     Result:=DBFNameD;
 end;

 function MakeDBFFileForSber(FNameDBF:String):String;
   var
      S        : string   ;
      DBFDir   : string   ;
      Ch       : string   ;
      DBFNameE : string   ;
      DBFNameD : string   ;
   begin
     DBFDir:=Bank_Dir;
     if not DirectoryExists(DBFDir) then
     if not CreateDir(DBFDir)       then
        begin
             ShowMessage('Отсутствует каталог '+DBFDir+' и не возможно создать его');
             Result:='';
             Exit;
        end;
     Ch:=copy(DBFDir,Length(DBFDir),1);
     if (not (Ch[1]  in ['\','/'])) then
        begin
              if pos('\',DBFDir)>0 then DBFDir:=DBFDir+'\'
              else
              if pos('/',DBFDir)>0 then DBFDir:=DBFDir+'/';
        end;
     DBFNameE:=DBFDir+'sberUnE.dbf';
     if not FileExists(DBFNameE) then
        begin
             ShowMessage('Отсутствует файл '+DBFNameE);
             Result:='';
             Exit;
        end;
     DBFNameD:=FNameDBF;
     if FileExists(DBFNameD)     then
     if not DeleteFile(DBFNameD) then
        begin
             ShowMessage('Ошибка удаления файла  '+DBFNameD);
             Result:='';
             Exit;
        end;
     if not CopyFile(PChar(DBFNameE),PChar(DBFNameD),true) then
        begin
             ShowMessage('Ошибка копирования файла '+DBFNameE+' в '+ DBFNameD);
             Result:='';
             Exit;
        end;
     Result:=DBFNameD;
 end;


 function MakeDBFFile(FNameDBF:String):String;
   const nmbofbank=3;
         bannames:array[1..nmbofbank] of string=('ПРИВАТ','ПУМБ','ОЩАД');
   var
      S        : string   ;
      DBFDir   : string   ;
      Ch       : string   ;
      DBFNameE : string   ;
      DBFNameD : string   ;
      finded   : boolean  ;
      index,jindex    : Integer  ;
   begin
        if isSVDN then
           begin
                isPrivat:=false;
                isPUMB:=False;
                isOSHAD:=false;
                s := BankiList.getBankName(shifrBan);
                s := Trim(s);
                s := Upper_STRING(s);
                finded:=False;
                MakeDBFFile:='';
                for index:=1 to nmbofbank do
                    begin
                         i:=Pos(bannames[index],s);
                         if i>0 then
                            begin
                              finded:=True;
                              jindex:=index;
                              Break;
                            end;
                    end;
                if finded then
                   begin
                        case jindex of
                           1: begin
                                    isPrivat:=True;
                                    Result := MakeDBFFileForPrivat(FNameDBF);
                              end;
                           2: begin
                                   isPUMB:=True;
                                   Result := MakeDBFFileForPUMB(FNameDBF)
                              end;
                           3: begin
                                   isOSHAD:=True;
                                   Result := MakeDBFFileForSber(FNameDBF)
                              end
                           else
                              ShowMessage('Неверно указан банк');
                        end
                   end
                else
                   ShowMessage('Неверно указан банк');
(*
                i:=Pos('ПРИВАТ',s);
                if i>0 then
                   begin
                        isPrivat:=True;
                        Result := MakeDBFFileForPrivat(FNameDBF);
                   end
                else
                   begin
                        i:=Pos('ПУМБ',s);
                        if i>0 then
                           begin
                                isPUMB:=True;
                                Result := MakeDBFFileForPUMB(FNameDBF)
                           end
                        else
                           begin
                                i:=Pos('ОЩАД',s);
                                if i>0 then
                                   begin
                                        isOSHAD:=True;
                                        Result := MakeDBFFileForSber(FNameDBF)
                                   end
                                else
                                  ShowMessage('Неверно указан банк для формирования файла');
                           end;
                   end;
*)
                Exit;
           end;
     DBFDir:=Bank_Dir;
     if not DirectoryExists(DBFDir) then
     if not CreateDir(DBFDir)       then
        begin
             ShowMessage('Отсутствует каталог '+DBFDir+' и не возможно создать его');
             Result:='';
             Exit;
        end;
     Ch:=copy(DBFDir,Length(DBFDir),1);
     if (not (Ch[1]  in ['\','/'])) then
        begin
              if pos('\',DBFDir)>0 then DBFDir:=DBFDir+'\'
              else
              if pos('/',DBFDir)>0 then DBFDir:=DBFDir+'/';
        end;
     DBFNameE:=DBFDir+'BankE.dbf';
     if not FileExists(DBFNameE) then
        begin
             ShowMessage('Отсутствует файл '+DBFNameE);
             Result:='';
             Exit;
        end;
     DBFNameD:=FNameDBF;
     if FileExists(DBFNameD)     then
     if not DeleteFile(DBFNameD) then
        begin
             ShowMessage('Ошибка удаления файла  '+DBFNameD);
             Result:='';
             Exit;
        end;
     if not CopyFile(PChar(DBFNameE),PChar(DBFNameD),true) then
        begin
             ShowMessage('Ошибка копирования файла '+DBFNameE+' в '+ DBFNameD);
             Result:='';
             Exit;
        end;
     Result:=DBFNameD;
 end;
 { ----- Конец копирование DBF файла из эталонного -----}


 { -------------- Начало вывода подразделения в DBF -------------- }
 function MovePodrInDBF(ShifrPod:integer;NomerPlat:integer):boolean;
  var LineNo   : Integer;
      SQLStmnt : string;
      SummaS   : string;

  function MoveLineToPrivatDBF:boolean;
   var Summa:Real;
       FIO,FAM,NAM,OTC:shortstring;
       Tabno:Integer;
       nal_code:string;
   (*
   BRANCH	C	3	0           1
   ZPKOD	C	10	0         2
   CARD_NO	C	16	0       3
   LSTBL	C	20	0         4
   FAM	C	50	0           5
   NAME	C	50	0           6
   OT	C	50	0             7
   INN	C	20	0           8
   DETAILS	C	50	0       9
   RLSUM	N	15	2        10
   PROJ_REF	C	14	0      11
*)


   begin
        Result := true;
        LineNo:=dBase.RecordCount;
        FIO:=FIB.pFIBQuery.Fields[1].AsString;
        Tabno:=FIB.pFIBQuery.Fields[3].AsInteger;
        FIO:=GetFullUkrFioPerson(Tabno);
        SplitFIO(FIO,FAM,NAM,OTC);
        Inc(LineNo);
        Summa  := FIB.pFIBQuery.Fields[4].AsFloat;
        SummaS := format('%15.2f',[Summa]);
        SummaS := ReplChar(SummaS,',','.');

        dBase.Append;
        Caption:=IntToStr(LinenO)+' '+FAM+' '+nam+' '+OTC+' '+trim(SummaS);
        Application.ProcessMessages;
        Nal_Code:= trim(FIB.pFIBQuery.Fields[2].AsString);
        // Таб номер
     //Не нужен с 09 05 2016   dBASE.SetFieldData(4 , IntToStr(Tabno));
     // c 16 06 2016 в 4 поле писать тоже INN
        dBASE.SetFieldData(4 , nal_code);
        dBASE.SetFieldData(5 , WinToDos(System.Copy(FAM+space(50),1,50)));
        dBASE.SetFieldData(6 , WinToDos(System.Copy(NAM+space(50),1,50)));
        dBASE.SetFieldData(7 , WinToDos(System.Copy(OTC+space(50),1,50)));
        dBASE.SetFieldData(8 , nal_code);
        dBASE.SetFieldData(10 , SummaS);

//        dBASE.SetFieldData(1 , IntToStr(LineNo));
//        dBASE.SetFieldData(2 , IntToStr(FIB.pFIBQuery.Fields[5].AsInteger));
//        dBASE.SetFieldData(3 , '0');
//        dBASE.SetFieldData(4 , IntToStr(FIB.pFIBQuery.Fields[6].AsInteger));
//        dBASE.SetFieldData(5 , '0');
//        dBASE.SetFieldData(6 , IntToStr(FIB.pFIBQuery.Fields[3].AsInteger));
//        dBASE.SetFieldData(7 , WinToDos(System.Copy(FIB.pFIBQuery.Fields[1].AsString+space(25),1,25)));
//        dBASE.SetFieldData(8 , WinToDos(System.Copy(FIB.pFIBQuery.Fields[9].AsString+space(20),1,20)));
//        dBASE.SetFieldData(9 , SummaS);
//        dBASE.SetFieldData(10, DateForDBFRecordS);
//        dBASE.SetFieldData(11, '');
//        dBASE.SetFieldData(12 , WinToDOS(Copy(FIB.pFIBQuery.Fields[8].AsString+space(20),1,20)));
//        dBASE.SetFieldData(13 , Copy(FIB.pFIBQuery.Fields[2].AsString+space(10),1,10));
        dBase.Post;
   end;

  function MoveLineToPUMBDBF:boolean;
   var Summa:Real;
       FIO,FAM,NAM,OTC:shortstring;
       Tabno:Integer;
       TabnoS:ShortString;
       bankCount:shortstring;
       mfo:ShortString;
//       countLen:byte;
   (*
TNUM	    C	10	0    1
MFO	      C	 9	0    2
ACCOUNT	  C	14	0    3   с 23 12 2019 29
LASTNAME	C	40	0    4
FIRSTNAME	C	40	0    5
SURNAME	  C	40	0    6
AMOUNT	  C	15	0    7
*)


   begin
        Result := true;
        LineNo:=dBase.RecordCount;
        FIO:=FIB.pFIBQuery.Fields[1].AsString;
        Tabno:=FIB.pFIBQuery.Fields[3].AsInteger;
        FIO:=GetFullUkrFioPerson(Tabno);
        SplitFIO(FIO,FAM,NAM,OTC);
        Inc(LineNo);
        Summa  := FIB.pFIBQuery.Fields[4].AsFloat;
        SummaS := format('%15.2f',[Summa]);
        SummaS := ReplChar(SummaS,',','.');
        bankCount := Trim(getPersonBankCount(tabno));
        MFO:='334851';
        TabnoS:=IntToStr(tabno);

        dBase.Append;
        Caption:=IntToStr(LinenO)+' '+FAM+' '+nam+' '+OTC+' '+trim(SummaS);
        Application.ProcessMessages;

        dBASE.SetFieldData(1 , System.Copy(tabnoS+space(10),1,10));
        dBASE.SetFieldData(2 , System.Copy(MFO+space(dBASE.GetFieldSize(2)),1,dBASE.GetFieldSize(2)));
//        dBASE.SetFieldData(3 , System.Copy(bankCount+space(14),1,14));
//        countLen := dBASE.GetFieldSize(3);
        dBASE.SetFieldData(3 , System.Copy(bankCount+space(dBASE.GetFieldSize(3)),1,dBASE.GetFieldSize(3)));

        dBASE.SetFieldData(4 , WinToDos(System.Copy(FAM+space(50),1,40)));
        dBASE.SetFieldData(5 , WinToDos(System.Copy(NAM+space(50),1,40)));
        dBASE.SetFieldData(6 , WinToDos(System.Copy(OTC+space(50),1,40)));
        dBASE.SetFieldData(7 , System.copy(SummaS+space(15),1,15));

        dBase.Post;
   end;

  function MoveLineToSberDBF:boolean;
   var Summa:Real;
       FIO,FAM,NAM,OTC:shortstring;
       Tabno:Integer;
       TabnoS:ShortString;
       bankCount:shortstring;
       mfo:ShortString;
       ndoc:shortString;
       OKPOCLI:ShortString;
       NAMECLI:ShortString;
       ACCCLI:ShortString;
       BANKCli:ShortString;
       MFOCor:ShortString;
       ACCCor:ShortString;
       OKPOCor:shortString;
       NameCor:ShortSTring;
       BankCor:shortString;
       SummaInt,l:Integer;
       Nazn:shortString;
       Val15:ShortString;
       dt:tdatetime;
//       countLen:byte;
   (*
NDOC	 C	 10	0   1
DT   	  D	  8	0   2
MFOCLI	C	 12	0   3
OKPOCLI	C	 14	0   4
ACCCLI	C	 15	0   5
NAMECLI	C	 38	0   6
BANKCLI	C	254	0   7
MFOCOR	C	 12	0   8
ACCCOR	C	 15	0   9   с 23 12 2019 29
OKPOCOR	C	 14	0  10
NAMECOR	C	 38	0  11
BANKCOR	C	254	0  12
DK	    N  	1	0  13
SUMMA	  N	 20	0  14
NAZN   	C	160	0  15
VAL	    N	 4	0  16

*)


   begin
        Result := true;
        LineNo:=dBase.RecordCount;
        FIO:=FIB.pFIBQuery.Fields[1].AsString;
        Tabno:=FIB.pFIBQuery.Fields[3].AsInteger;
        FIO:=GetFullUkrFioPerson(Tabno);
        FIO:=Trim(FIO);
        FIO:=AnsiUpperCase(FIO);
//        SplitFIO(FIO,FAM,NAM,OTC);
        Inc(LineNo);
        Summa  := FIB.pFIBQuery.Fields[4].AsFloat*100;
 //       SummaS := format('%15.2f',[Summa]);
        SummaInt:=Round(summa);
//        SummaS := format('%15d',[Summa]);
        SummaS := IntToStr(SummaInt);
        l:=20-length(SummaS);
        SummaS := SPACE(l)+SummaS;
//        SummaS := ReplChar(SummaS,',','.');
        bankCount := Trim(getPersonBankCount(tabno));
      //  MFO:='334851';
        MFO:='304665';
        OKPOCLI:='02070714';
        ACCCLI:='29090300675710';
        NAMECLI:='Схiдноукраїнський нацiональний унiверс';
        BANKCli:='AT "ОЩАДБАНК"';
        ndoc:='1';
        MFOCor:=mfo;
      //  ACCCor:='26250000184612';
        OKPOCor:=FIB.pFIBQuery.Fields[2].AsString; //INN
        NAMECor:=FIO;
  //      bankCount := Trim(getPersonBankCount(tabno));
        ACCCor := bankCount;
        Nazn:= 'Заробітна плата';
        BankCor:=BANKCli;
        TabnoS:=IntToStr(tabno);
        Val15:=' 980';

        dBase.Append;
        Caption:=IntToStr(LinenO)+' '+FAM+' '+nam+' '+OTC+' '+trim(SummaS);
        dt:= Date;
        DateForDBFRecordS:= ConvertDataForDBF(dt);
        Application.ProcessMessages;

 //       dBASE.SetFieldData(1  , System.Copy(space(dBASE.GetFieldSize(dBASE.GetFieldSize(1))-length(ndoc)),1,dBASE.GetFieldSize(dBASE.GetFieldSize(9))-length(ndoc))+ndoc);
        dBASE.SetFieldData(1  , System.Copy(space(9),1,9)+ndoc);
        dBASE.SetFieldData(2  , DateForDBFRecordS);
        dBASE.SetFieldData(3  , System.Copy(MFO+space(dBASE.GetFieldSize(3)),1,dBASE.GetFieldSize(3)));
        dBASE.SetFieldData(4  , System.Copy(OKPOCli+space(dBASE.GetFieldSize(4)),1,dBASE.GetFieldSize(4)));
        dBASE.SetFieldData(5  , System.Copy(ACCCLI+space(dBASE.GetFieldSize(5)),1,dBASE.GetFieldSize(5)));
        dBASE.SetFieldData(6  , winToDos(System.Copy(NAMECli+space(dBASE.GetFieldSize(6)),1,dBASE.GetFieldSize(6))));
        dBASE.SetFieldData(7  , winToDos(System.Copy(BANKCli+space(dBASE.GetFieldSize(7)),1,dBASE.GetFieldSize(7))));
        dBASE.SetFieldData(8  , System.Copy(MFOCor+space(dBASE.GetFieldSize(8)),1,dBASE.GetFieldSize(8)));
//        dBASE.SetFieldData(9  , System.Copy(ACCCor+space(15),1,15));
//        countLen:=dBASE.GetFieldSize(9);
        dBASE.SetFieldData(9  , System.Copy(ACCCor+space(dBASE.GetFieldSize(9)),1,dBASE.GetFieldSize(9)));
        dBASE.SetFieldData(10 , System.Copy(OKPOCor+space(dBASE.GetFieldSize(10)),1,dBASE.GetFieldSize(10)));
        dBASE.SetFieldData(11 , WinToDos(System.Copy(NAMECor+space(dBASE.GetFieldSize(11)),1,dBASE.GetFieldSize(11))));
        dBASE.SetFieldData(12 , WinToDos(System.Copy(BANKCor+space(dBASE.GetFieldSize(12)),1,dBASE.GetFieldSize(12))));
        dBASE.SetFieldData(13 , '1');
        dBASE.SetFieldData(14 , System.copy(SummaS+space(dBASE.GetFieldSize(14)),1,dBASE.GetFieldSize(14)));
        dBASE.SetFieldData(15 , WinToDos(System.copy(Nazn+space(dBASE.GetFieldSize(15)),1,dBASE.GetFieldSize(15))));
        dBASE.SetFieldData(16 , System.Copy(VAl15+space(dBASE.GetFieldSize(16)),1,dBASE.GetFieldSize(16)));

        dBase.Post;
   end;




  {
   1 - Lineno   N(5)
   2 - ShifrGru N(10)
   3 - Kateg    N(10)
   4 - W_Place  N(10)
   5 - W_R      N(10)
   6 - TABNO    N(10)
   7 - FIO      C(25)
   8 - NAME_WP  C(20)
   9 - SUMMA    N(15,2)
  10 - DATA     D
  11 - KAT_NAME C(20)
  12 - GRU_NAME C(20)
  13 - ID       C(10)
  }

  function MoveLineToDBF:boolean;
   var Summa:Real;

   begin
        if isSVDN then
           begin
                if isPRIVAT then
                   Result:=MoveLineToPrivatDBF
                else
                if isPUMB then
                   Result:=MoveLineToPUMBDBF
                else
                if isOSHAD then
                   Result:=MoveLineToSberDBF;

                Exit;
           end;
        Result := true;
        LineNo:=dBase.RecordCount;
        Inc(LineNo);
        Summa  := FIB.pFIBQuery.Fields[4].AsFloat;
        SummaS := format('%15.2f',[Summa]);
        SummaS := ReplChar(SummaS,',','.');

        dBase.Append;
        dBASE.SetFieldData(1 , IntToStr(LineNo));
        dBASE.SetFieldData(2 , IntToStr(FIB.pFIBQuery.Fields[5].AsInteger));
        dBASE.SetFieldData(3 , '0');
        dBASE.SetFieldData(4 , IntToStr(FIB.pFIBQuery.Fields[6].AsInteger));
        dBASE.SetFieldData(5 , '0');
        dBASE.SetFieldData(6 , IntToStr(FIB.pFIBQuery.Fields[3].AsInteger));
        dBASE.SetFieldData(7 , WinToDos(System.Copy(FIB.pFIBQuery.Fields[1].AsString+space(25),1,25)));
        dBASE.SetFieldData(8 , WinToDos(System.Copy(FIB.pFIBQuery.Fields[9].AsString+space(20),1,20)));
        dBASE.SetFieldData(9 , SummaS);
        dBASE.SetFieldData(10, DateForDBFRecordS);
        dBASE.SetFieldData(11, '');
        dBASE.SetFieldData(12 , WinToDOS(Copy(FIB.pFIBQuery.Fields[8].AsString+space(20),1,20)));
        dBASE.SetFieldData(13 , Copy(FIB.pFIBQuery.Fields[2].AsString+space(10),1,10));
        dBase.Post;
   end;

  begin
       result   := true;
       LineNo   := 1;
       FIB.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
       SQLStmnt:='select a.lineno,a.fio,c.nal_code,a.tabno,a.summa,b.shifrgru,b.shifrpod,b.nomer,d.name,e.name from tb_plat_pr a '+
                 'join tb_plat_hat b on a.shifridplat=b.shifrid '+
                 'join kadry c on c.tabno=a.tabno '+
                 'join gruppy d on d.shifr=b.shifrgru '+
                 'join podr e on e.shifrpod=b.shifrpod '+
                 'where shifridplat='+IntToStr(pFIBDataSetPlatRee.FieldByName('ShifrId').AsInteger)+' ORDER BY LINENO';
       FIB.pFIBQuery.SQL.Add(SqlStmnt);
       try
          FIB.pFIBQuery.ExecQuery;
          while not FIB.pFIBQuery.Eof do
           begin
                if not MoveLineToDBF then
                   begin
                        result:=false;
                        Exit;
                   end;
                FIB.pFIBQuery.Next;
           end;
       except
         else
          ShowMessage('Ошибка SQL');
       end;
  end;
   { -------------- Конец вывода подразделения в DBF -------------- }
 procedure CreateAllPodrInDBFForWantedGru(WantedShifrGru:integer);
   var CShifrGru : integer;
       SavePlace : TBookmark;
       NomerPlat : integer;
       CShifrPod : integer;
       FNameDBF  : String;
  function GetNameDirBankDBF:string;
     var s : string;
         d,m,y    : word;
         dt       : TDateTime;
         ds,ms,ys,dates : string;
     begin
          if ShifrBan>0 then
             s:=bank_dir+trim(bankiList.getBankDir(shifrBan))+'\'
          else
             s:=Bank_Dir;
(*
          if ShifrBan=1 then s:=bank_dir+'Privat\'
                        else
          if ShifrBan=2 then s:=bank_dir+'BrokB\'
                        else
          if ShifrBan=3 then s:=bank_dir+'UkrSib\'
                        else s:=bank_dir;
*)
          if not DirectoryExists(S) then
             MkDir(S);
          dt:= Date;
          DateForDBFRecordS:= ConvertDataForDBF(dt);
          DecodeDate(dt,y,m,d);
          ys:=IntToStr(Y);
          s:=s+ys+'\';
          if not DirectoryExists(S) then
             MkDir(S);
          ms:=IntToStr(M);
          if m<10 then ms:='0'+ms;
          ds:=IntToStr(d);
          if d<10 then ds:='0'+ds;
          dates:=ys+ms+ds;
          s:=s+dateS;
          if not DirectoryExists(S) then
             begin
                  MkDir(S);
             end;
          s:=s+'\';
          result:=s;

     end;

   function GetNameBankDBF:string;
    var s : string;
        DirName : string;
    begin
         DirName:=GetNameDirBankDBF;
         FIB.pFIBQuery.Close;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add('select first 1 name_plat from gruppy where shifr='+IntToStr(ShifrGru));
         try
           FIB.pFIBQuery.ExecQuery;
           s:=trim(FIB.pFIBQuery.Fields[0].AsString);
           Result:=DirName+trim(s)+'.dbf';
         except
           else
               begin
                    ShowMessage('Ошибка SQL');
                    Result:=cdoc+'disk\'+'_plt.dbf';
               end
         end;

 end;

   begin
       Self.ShifrGru := WantedShifrGru;
       FNameDBF:=GetNameBankDBF;
       isPrivat := false;
       isPUMB   := false;
       isOSHAD  := False;
       FNameDBF:=MakeDBFFile(FNameDBF);
       FNameDBF:=Trim(FNameDBF);
       if Length(FNameDBF)<5 then
          Exit;
       try
          dBase:=TDBF.Create(Self);
       except
          on E: Exception do begin
             messagebox(0,pchar(E.Message),'Ошибка',16);
             dBase.Free;
             dBase:=Nil;
             Exit;
          end;
       end;
       dBase.TableName:=FNameDBF;
       dBase.Open;
       SavePlace     := pFIBDataSetPlatRee.GetBookmark;
       pFIBDataSetPlatRee.First;
       while not pFIBDataSetPlatRee.Eof do
        begin
             CShifrPod:=pFIBDataSetPlatRee.FieldByName('ShifrPod').AsInteger;
             CShifrGru:=pFIBDataSetPlatRee.FieldByName('ShifrGru').AsInteger;
             if CShifrGru=WantedShifrGru then
             if IsSelectedPodrGru(CShifrPod,CShifrGru) then
                begin
                      NomerPlat:=pFIBDataSetPlatRee.FieldByName('Nomer').AsInteger;
                      if not MovePodrInDBF(CShifrPod,NomerPlat) then break;
                end;
             pFIBDataSetPlatRee.Next;
        end;
       pFIBDataSetPlatRee.GotoBookmark(SavePlace);
       pFIBDataSetPlatRee.FreeBookmark(SavePlace);
       if Assigned(dBase) then
          begin
               dBase.Close;
               dBase.Free;
               dBase:=nil;
          end;
  end;
 begin
 //      CreateAllPodrInDBFForWantedGru(1);
       fmsFloatPoint.DecimalSeparator := '.';

       GruppySelList := TList.Create;
       GloSavePlace  := pFIBDataSetPlatRee.GetBookmark;
       pFIBDataSetPlatRee.First;
       while not pFIBDataSetPlatRee.Eof do
        begin
             CurrShifrGru:=pFIBDataSetPlatRee.FieldByName('ShifrGru').AsInteger;
             CurrShifrPod:=pFIBDataSetPlatRee.FieldByName('ShifrPod').AsInteger;
             if (IsSelectedPodrGru(CurrShifrPod,CurrShifrGru)) then
                begin
                      Finded:=false;
                      if GruppySelList.Count>0 then
                         for i:=0 to GruppySelList.Count-1 do
                             begin
                                   PShifrIdGru:=GruppySelList.Items[i];
                                   WorkShifrGru := PShifrIdGru^;
                                   if  WorkShifrGru=CurrShifrGru then
                                       begin
                                            Finded:=true;
                                            break;
                                       end;
                             end;
                      if not Finded then
                         begin
                              New(PShifrIdGru);
                              PShifrIdGru^:=CurrShifrGru;
                              GruppySelList.Add(PShifrIdGru);
                          end;
                end;
             pFIBDataSetPlatRee.Next;
        end;
       pFIBDataSetPlatRee.GotoBookmark(GloSavePlace);
       pFIBDataSetPlatRee.FreeBookmark(GloSavePlace);
       if GruppySelList.Count>0 then
          for i:=0 to GruppySelList.Count-1 do
              begin
                   CurrShifrGru:=PInteger(GruppySelList.Items[i])^;
                   CreateAllPodrInDBFForWantedGru(CurrShifrGru);
              end;
       GruppySelList.Free;
     FormWaitMess.SetMessage('Cформированы!');
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;

 end;


procedure TFormPlatReestr.DBF1Click(Sender: TObject);
begin
     PrepareAllPlatInDBF;
     Caption:='Реестр платежных ведомостей';
     Application.ProcessMessages;
end;

procedure TFormPlatReestr.N6Click(Sender: TObject);
begin
     Application.CreateForm(TFormBankDBFView,FormBankDBFView);
     FormBankDBFView.ShowModal;
end;

end.
