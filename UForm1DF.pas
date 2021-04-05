{$WARNINGS OFF}
{$HINTS OFF}

unit UForm1DF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, FIBDataSet, pFIBDataSet, dxExEdtr, ExtCtrls,
  DBCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms,
  FIBDatabase, pFIBDatabase, Menus, frxClass, frxDBSet, FIBQuery, pFIBQuery,
  frxExportPDF, frxExportRTF, frxExportXLS, DBClient, StdCtrls;

type
  tKindPodr=(UnivAll,Alchevsk,SelHoz,UnivBezAS);

  TForm1DF = class(TForm)
    DateTimePicker1: TDateTimePicker;
    pFIBDataSet1DF: TpFIBDataSet;
    pFIBDataSet1DFSHIFRID: TFIBIntegerField;
    pFIBDataSet1DFTABNO: TFIBIntegerField;
    pFIBDataSet1DFNAL_CODE: TFIBStringField;
    pFIBDataSet1DFFIO: TFIBStringField;
    pFIBDataSet1DFW_R: TFIBSmallIntField;
    pFIBDataSet1DFSUMMAADD: TFIBBCDField;
    pFIBDataSet1DFSUMMAPOD: TFIBBCDField;
    pFIBDataSet1DFDATAPRI: TFIBDateField;
    pFIBDataSet1DFDATAUW: TFIBDateField;
    pFIBDataSet1DFCODE_PRIZ: TFIBSmallIntField;
    pFIBDataSet1DFOZN_PILG: TFIBSmallIntField;
    pFIBDataSet1DFINVALID: TFIBSmallIntField;
    DataSource1DF: TDataSource;
    dxDBGrid1DF: TdxDBGrid;
    DBNavigator1: TDBNavigator;
    dxDBGrid1DFSHIFRID: TdxDBGridMaskColumn;
    dxDBGrid1DFTABNO: TdxDBGridCalcColumn;
    dxDBGrid1DFNAL_CODE: TdxDBGridMaskColumn;
    dxDBGrid1DFFIO: TdxDBGridMaskColumn;
    dxDBGrid1DFSUMMAADD: TdxDBGridCalcColumn;
    dxDBGrid1DFSUMMAPOD: TdxDBGridCalcColumn;
    dxDBGrid1DFDATAPRI: TdxDBGridDateColumn;
    dxDBGrid1DFDATAUW: TdxDBGridDateColumn;
    dxDBGrid1DFOZN_PILG: TdxDBGridMaskColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    pFIBDataSetSwodUd: TpFIBDataSet;
    pFIBDataSetSwodUdSHIFRGRU: TFIBIntegerField;
    pFIBDataSetSwodUdNAMEGRU: TFIBStringField;
    pFIBDataSetSwodUdSUMMA1: TFIBBCDField;
    pFIBDataSetSwodUdSUMMA2: TFIBBCDField;
    pFIBDataSetSwodUdSUMMA3: TFIBBCDField;
    pFIBDataSetSwodUdSUMMAT: TFIBBCDField;
    pFIBTransaction1: TpFIBTransaction;
    DataSourceSwodUd: TDataSource;
    frxDBDatasetSwodUd: TfrxDBDataset;
    pFIBQuery1DF: TpFIBQuery;
    pFIBTransactionQ1DF: TpFIBTransaction;
    DBF1: TMenuItem;
    dxDBGrid1DFW_R: TdxDBGridMaskColumn;
    dxDBGrid1DFCODE_PRIZ: TdxDBGridMaskColumn;
    dxDBGrid1DFINVALID: TdxDBGridMaskColumn;
    pFIBDataSetBK: TpFIBDataSet;
    pFIBDataSetBKTABNO: TFIBIntegerField;
    pFIBDataSetBKFIO: TFIBStringField;
    pFIBDataSetBKSUMMAADD: TFIBBCDField;
    pFIBDataSetBKSUMMAPOD: TFIBBCDField;
    pFIBDataSetBKDATAPRI: TFIBDateField;
    pFIBDataSetBKDATAUW: TFIBDateField;
    frxDBDatasetBK: TfrxDBDataset;
    N2: TMenuItem;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxPDFExport1: TfrxPDFExport;
    N11: TMenuItem;
    frxReportSwodUd: TfrxReport;
    frxReportBK: TfrxReport;
    pFIBDataSetSummy: TpFIBDataSet;
    pFIBDataSetSummyNAMEB: TFIBStringField;
    pFIBDataSetSummyNMBOFLINE: TFIBIntegerField;
    pFIBDataSetSummySUMMAADD: TFIBBCDField;
    pFIBDataSetSummySUMMAPOD: TFIBBCDField;
    frxDBDatasetSummy: TfrxDBDataset;
    N3: TMenuItem;
    frxReportSummy: TfrxReport;
    XMLJ05001051: TMenuItem;
    XMLj05001052: TMenuItem;
    Excel1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    frxReportFull: TfrxReport;
    cds1DF: TClientDataSet;
    cds1DFlineno: TIntegerField;
    cds1DFINN: TStringField;
    cds1DFPIB: TStringField;
    cds1DFsummaAdd: TFloatField;
    cds1DFsummaPod: TFloatField;
    cds1DFozndox: TStringField;
    cds1DFdataPri: TDateField;
    cds1DFdataUw: TDateField;
    cds1DFoznpilg: TStringField;
    cds1DFoznaka: TStringField;
    frxDBPrint: TfrxDBDataset;
    N12: TMenuItem;
    cbKindPodr: TComboBox;
    pFIBDataSet1DFSUMMAWS: TFIBBCDField;
    dxDBGrid1DFSummaWs: TdxDBGridColumn;
    iDFECB: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure frxReportSwodUdGetValue(const VarName: String;
      var Value: Variant);
    procedure DBF1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure frxReportBKGetValue(const VarName: String;
      var Value: Variant);
    procedure N11Click(Sender: TObject);
    procedure frxReportSummyGetValue(const VarName: String;
      var Value: Variant);
    procedure N3Click(Sender: TObject);
    procedure XMLJ05001051Click(Sender: TObject);
    procedure XMLj05001052Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure frxReportFullGetValue(const VarName: String;
      var Value: Variant);
    procedure cbKindPodrChange(Sender: TObject);
    procedure iDFECBClick(Sender: TObject);
  private
    { Private declarations }
    listAlchevsk,
    listSelHoz:TList;
    listAlchevskString,
    listSelHozString:string;
    kindPodr:tKindPodr;
    summaWarSbor:Real;
    procedure ShowTable;
    function MakeDBFFile(FNameDBF:String;wantedY:Integer;wantedM:integer):string;
    procedure FillDBFTable(wantedY:integer;wantedM:Integer;SummaNo:integer);
    procedure FillDBFTables;
    procedure FillXLSTable(outMode:integer ; pageNo:integer=1);
    procedure FillXMLDocumentJ0500105;
    procedure executePrint1DF;
    procedure initLists;
    function makeFilterString:string;

  public
      Y : integer;
      m : integer;
      CurrKw : integer;
      nmbOfRow : Integer;
      nmbOfRowStarted:Boolean;
    { Public declarations }
  end;

var
  Form1DF: TForm1DF;

implementation
  uses ScrDef,UFibModule,DBF,DateUtils,IniFiles,ScrUtil,UFormProgress,
  uFormWait, UForm1DFStipToXML,ComObj,USQLUnit,
  UFormCMP1DFECB;

{$R *.dfm}

procedure TForm1DF.FormClose(Sender: TObject; var Action: TCloseAction);
 var i:Integer;
begin
     if pFibDataSet1DF.Active then
        pFibDataSet1DF.Active:=false;
     if pFibDataSet1DF.Transaction.Active then
        pFibDataSet1DF.Transaction.Commit;
     if pFibDataSet1DF.UpdateTransaction.Active then
        pFibDataSet1DF.UpdateTransaction.Commit;
     if isLNR then
        begin
             if listAlchevsk.Count>0 then
                for i:=0 to listAlchevsk.Count-1 do
                    Dispose(pInteger(listAlchevsk.Items[i]));
             listAlchevsk.Free;
             if listSelHoz.Count>0 then
                for i:=0 to listSelHoz.Count-1 do
                    Dispose(pInteger(listSelHoz.Items[i]));
             listSelHoz.Free;
        end;
     Action:=caFree;
end;

procedure TForm1DF.FormCreate(Sender: TObject);
var yw,mw : word;
begin
     y := CurrYear;
     M := NMES;
     kindPodr:=UnivAll;
     case m of
      1,2,3: CurrKw:=1;
      4,5,6: CurrKw:=2;
      7,8,9: CurrKw:=3;
      else CurrKw:=4;
     end;
     case CurrKw of
      1:m:=3;
      2:m:=6;
      3:m:=9;
      else m:=12;
     end;
     yw:=y;
     mw:=m;
     DateTimePicker1.Date:=EnCodeDate(yw,mw,10);
     if isLNR then
        begin
             Excel1.visible:=true;
             Excel1.Enabled:=true;
             initLists;
        end
     else
        begin
             Excel1.visible:=false;
             Excel1.Enabled:=False;
        end;
     if isLNR then
        begin
             cbKindPodr.show;
             cbKindPodr.Enabled:=true;
             cbKindPodr.ItemIndex:=0;
        end
     else
        begin
             cbKindPodr.Hide;
             cbKindPodr.Enabled:=false;
        end;
     if isSVDN then
        iDFECB.Visible:=True
     else
        iDFECB.Visible:=False;

     ShowTable;
end;

procedure TForm1DF.ShowTable;
 var SQLStmnt:string;
 begin
     if pFibDataSet1DF.Active then
        pFibDataSet1DF.Active:=false;
     if pFibDataSet1DF.Transaction.Active then
        pFibDataSet1DF.Transaction.Commit;
     if pFibDataSet1DF.UpdateTransaction.Active then
        pFibDataSet1DF.UpdateTransaction.Commit;
     if isLNR then
        begin
             SQlStmnt:='SELECT SHIFRID'   +
                       '     , TABNO'     +
                       '     , NAL_CODE'  +
                       '     , FIO'       +
                       '     , W_R'       +
                       '     , SUMMAADD'  +
                       '     , SUMMAPOD'  +
                       '     , DATAPRI'   +
                       '     , DATAUW'    +
                       '     , CODE_PRIZ' +
                       '     , OZN_PILG'  +
                       '     , INVALID'   +
                       '     FROM TB_1DF a' +
                       '     where '  +
                       '        y=' + IntToStr(y) +
                       '    and m=' + IntToStr(m);
             if kindPodr = Alchevsk then
                SQLStmnt:=Trim(SQLStmnt)+
                       '    and exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (17))'+
                       '  )'
             else
             if kindPodr = SelHoz then
                SQLStmnt:=Trim(SQLStmnt)+
                       '    and exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (18))'+
                       '  )'

             else
             if kindPodr = UnivBezAS then
                SQLStmnt:=Trim(SQLStmnt)+
                       '    and not exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (17,18))'+
                       '  )';

             SQlStmnt:=Trim(SQLStmnt)+
                       '     order by nal_code';

             pFIBDataSet1DF.SQLs.SelectSQL.Clear;
             pFIBDataSet1DF.SQLs.SelectSQL.Add(SQLStmnt);
        end
     else
        begin
             pFIBDataSet1DF.Params[0].AsInteger:=y;
             pFIBDataSet1DF.Params[1].AsInteger:=m;
        end;
     pFibDataSet1DF.Transaction.StartTransaction;
     pFibDataSet1DF.Open;


 end;

procedure TForm1DF.DateTimePicker1Change(Sender: TObject);
 var yw,mw,dw:word;
begin
     DeCodeDate(DateTimePicker1.Date,yw,mw,dw);
     y := yw;
     M := mw;
     case m of
      1,2,3: CurrKw:=1;
      4,5,6: CurrKw:=2;
      7,8,9: CurrKw:=3;
      else CurrKw:=4;
     end;
     case CurrKw of
      1:m:=3;
      2:m:=6;
      3:m:=9;
      else m:=12;
     end;
     ShowTable;
end;

procedure TForm1DF.N1Click(Sender: TObject);
 var SQLStmnt:string;
begin
     if False then
//     if isLNR then
        begin
             SQLStmnt:='select a.tabno,a.fio,a.summaadd,a.summapod,a.datapri,a.datauw   from tb_1df a'+
                       ' where char_length(trim(coalesce(nal_code,'')))<>10'+
                       ' and y='+Trim(IntToStr(y))+
                       ' and m='+Trim(IntToStr(m));
             if kindPodr <> UnivAll then
                SQLStmnt:=Trim(SQLStmnt)+makeFilterString;
(*
             if kindPodr = Alchevsk then
                SQLStmnt:=Trim(SQLStmnt)+
                       ' and exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (17))'+
                       '  )'
             else
             if kindPodr = SelHoz then
                SQLStmnt:=Trim(SQLStmnt)+
                       ' and exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (18))'+
                       '  )'

             else
             if kindPodr = UnivBezAS then
                SQLStmnt:=Trim(SQLStmnt)+
                       ' and not exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (17,18))'+
                       '  )';
 *)
             SQLStmnt:=Trim(SQLStmnt)+
                       ' order by fio';


             pFIBDataSetSwodUd.SQLs.SelectSQL.Clear;
             pFIBDataSetSwodUd.SQLs.SelectSQL.Add(SQLStmnt);


        end
     else
        begin
             pFIBDataSetSwodUd.Params[0].AsInteger:=y;
             pFIBDataSetSwodUd.Params[1].AsInteger:=CurrKw;
        end;
     pFibDataSetSwodUd.Transaction.StartTransaction;
     pFibDataSetSwodUd.Open;
     frxReportSwodUd.ShowReport();
     pFibDataSetSwodUd.Close;
     pFibDataSetSwodUd.Transaction.Commit;

end;

procedure TForm1DF.frxReportSwodUdGetValue(const VarName: String;
  var Value: Variant);
begin
     if trim(VarName)='d' then
        Value:=IntToStr(CurrKw)+'-й квартал '+IntToStr(Y)+' р.'
     else if trim(VarName)='m1' then
        case CurrKw of
         1:value:='Січень';
         2:value:='Квітень';
         3:value:='Липень';
         else value:='Жовтень';
        end
     else if trim(VarName)='m2' then
        case CurrKw of
         1:value:='Лютий';
         2:value:='Травень';
         3:value:='Серпень';
         else value:='Листопад';
        end
     else if trim(VarName)='m3' then
        case CurrKw of
         1:value:='Березень';
         2:value:='Червень';
         3:value:='Вересень';
         else value:='Грудень';
        end
end;


procedure TForm1DF.FillDBFTable(wantedY:integer;wantedM:Integer;SummaNo:integer);
var dBase: TDBF;
    RecordBound, ix : integer ;
    fmsFloatPoint : TFormatSettings;
    iCheckMode    : integer   ;
    FName         : string    ;
    SQLStmnt      : string    ;
    FNameDBF      : string    ;
    LineNo        : integer   ;
    v             : variant   ;

function GetName:string;
 begin
//       Result:='1dfdata';
       Result:='J0510406';
 end;

function BuildSQLStmnt:string;
 begin
      case SummaNo of
       1:
//                          0         1         2         3        4        5      6        7
         result:='select nal_code,summaadd1,summapod1,code_priz,ozn_pilg,datapri,datauw,summaws1 from tb_1df where y='+IntToStr(Y)+' and m='+IntToStr(M)+' and nal_code is not null and char_length(trim(nal_code))=10 order by nal_code' ;
       2:
         result:='select nal_code,summaadd2,summapod2,code_priz,ozn_pilg,datapri,datauw,summaws2 from tb_1df where y='+IntToStr(Y)+' and m='+IntToStr(M)+' and nal_code is not null and char_length(trim(nal_code))=10 order by nal_code' ;
       3:
         result:='select nal_code,summaadd3,summapod3,code_priz,ozn_pilg,datapri,datauw,summaws3 from tb_1df where y='+IntToStr(Y)+' and m='+IntToStr(M)+' and nal_code is not null and char_length(trim(nal_code))=10 order by nal_code' ;
      else
         result:='select nal_code,summaadd,summapod,code_priz,ozn_pilg,datapri,datauw,summaws from tb_1df where y='+IntToStr(Y)+' and m='+IntToStr(M)+' and nal_code is not null and char_length(trim(nal_code))=10 order by nal_code' ;
      end;
 end;

 function FillDBFRecord:boolean;
  var
     summaadd,summapod,summaws : real;
     nal_code : string;
     code_priz,ozn_pilg:integer;
     datapri,datauw:TDateTime;
     s:string;

// 1	NP 	      Numeric 	   6 	0
// 2	PERIOD 	  Numeric 	   2 	0
// 3	RIK 	    Numeric 	   5 	0
// 4	KOD 	    Character 	10     код едрпо можно оставить пустым
// 5	TYP 	    Numeric 	   2 	0  ставить 0
// 6	TIN 	    Character 	10
// 7	S_NAR 	  Numeric 	  14 	2
// 8	S_DOX 	  Numeric 	  14 	2
// 9	S_TAXN 	  Numeric 	  14 	2
//10	S_TAXP 	  Numeric 	  14 	2
//11	OZN_DOX 	Numeric 	   4 	0
//12	D_PRIYN 	Date 	       8
//13	D_ZVILN 	Date 	       8
//14	OZN_PILG 	Numeric 	   3 	0
//15	OZNAKA  	Numeric 	   2 	0
//16	A051 	    Numeric 	  12 	2
//17	A05 	    Numeric 	  12 	2

 begin
      nal_Code  := pFIBQuery1DF.Fields[0].AsString;
      if length(trim(nal_Code))<10 then Exit;
      summaadd  := pFIBQuery1DF.Fields[1].AsFloat;
      summapod  := pFIBQuery1DF.Fields[2].AsFloat;
      summaws   := pFIBQuery1DF.Fields[7].AsFloat;
      Code_priz := pFIBQuery1DF.Fields[3].AsInteger;
      Ozn_Pilg  := pFIBQuery1DF.Fields[4].AsInteger;
      datapri   := pFIBQuery1DF.Fields[5].AsDate;
      datauw    := pFIBQuery1DF.Fields[6].AsDate;
      LineNo    := LineNo+1;

      dBASE.Append;

//      dBASE.SetFieldData(1  , '0');
      dBASE.SetFieldData(1  , IntToStr(LineNo));
      dBASE.SetFieldData(2  , IntToStr(wantedM));
//      dBASE.SetFieldData(3  , IntToStr(CurrKw));
      dBASE.SetFieldData(3  , IntToStr(Y));
      dBASE.SetFieldData(4  , SPACE(10));
//      dBASE.SetFieldData(5  , '02070714');
      dBASE.SetFieldData(5  , '0');
    //  dBASE.SetFieldData(6  , IntToStr(Code_priz));
      dBASE.SetFieldData(6  , NAL_CODE);
      dBASE.SetFieldData(7  , format('%14.2f',[summaadd]));
      dBASE.SetFieldData(8  , format('%14.2f',[summaadd]));
      dBASE.SetFieldData(9 , format('%14.2f',[summapod]));
      dBASE.SetFieldData(10 , format('%14.2f',[summapod]));
//      dBASE.SetFieldData(12 , IntToStr(Code_Priz));
      if nal_code='2051609910'  then
         S:='';
      if ((code_priz=126) or
          (code_priz=169) or
          (code_priz=102) or
          (code_priz=128)
          ) then
         dBASE.SetFieldData(11 , IntToStr(code_priz))
      else
         dBASE.SetFieldData(11 , '101');
      if ((yearof(datapri)=y)  and (MonthOf(datapri)=wantedM)) then
         begin
              s:=ConvertDataForDBF(datapri);
              dBASE.SetFieldData(12 , s);
         end
      else
         dBASE.SetFieldData(12 , '       ');
      if ((yearof(datauw)=y) and (MonthOf(datauw)=wantedM)) then
         begin
             s:=ConvertDataForDBF(datauw);
             dBASE.SetFieldData(13 , S);
         end
      else
         dBASE.SetFieldData(13 , '       ');
      dBASE.SetFieldData(14 , IntToStr(Ozn_Pilg));
      dBASE.SetFieldData(15 , '0');
      dBASE.SetFieldData(16  , format('%12.2f',[summaws]));
      dBASE.SetFieldData(17  , format('%12.2f',[summaws]));
      dBase.Post;
 end;

begin
     FNameDBF := GetName;
     if Length(Trim(FNameDBF))<5 then Exit;
  //   LabelUp.Caption:='Перенос таблицы '+FNameDBF;;
  //   Application.ProcessMessages;
     try
        FName:=MakeDBFFile(FNameDBF,wantedY,wantedM);
     except
        on E: Exception do
           begin
                ShowMessage(pchar(E.Message));
           end;
        else
     end;
     FName:=trim(FName);
     if Length(FName)<5 then Exit;
     if pFIBQuery1DF.Open then
        pFIBQuery1DF.Close;
     if pFIBQuery1DF.Transaction.Active then
        pFIBQuery1DF.Transaction.Commit;
     SQLStmnt:='select count(*) from tb_1df where y='+IntToStr(Y)+' and m='+IntToStr(M);
     v:=SQLQueryValue(SQLStmnt);
     if VarIsNumeric(v) then
        RecordBound:=v
     else
        RecordBound:=0;
     if RecordBound<1 then
        begin
             ShowMessage('Нет записей в таблице');
             pFIBQuery1DF.Close;
             pFIBQuery1DF.Transaction.Commit;
             raise Exception.Create('Нет записей в таблице');
//             Exit;
        end;
     fmsFloatPoint.DecimalSeparator := '.';
     try
        dBase:=TDBF.Create(Self);
     except
       on E: Exception do begin
           messagebox(0,pchar(E.Message),'Ошибка',16);
           dBase.Free;
           raise Exception.Create(pchar(E.Message));
           Exit;
       end;
     end;
     dBase.TableName:=FName;
//  dBase.CodePage:=OEM;
     dBase.Open;
     pFIBQuery1DF.Close;
     SQLStmnt:=BuildSQLStmnt;
     pFIBQuery1DF.SQL.Clear;
     pFIBQuery1DF.SQL.Add(SQLStmnt);
     if not pFIBQuery1DF.Transaction.Active then
        pFIBQuery1DF.Transaction.StartTransaction;
     pFIBQuery1DF.ExecQuery;
//     ProgressBarPFU.Min:=0;
//     ProgressBarPFU.Max:=RecordBound;
//     ProgressBarPFU.Position:=0;
     ix:=0;
     LineNo:=0;
     Application.CreateForm(TFormProgress, FormProgress);
     FormProgress.Show;
     FormProgress.Gauge.MaxValue:=RecordBound;
     FormProgress.Gauge.MinValue:=0;
     FormProgress.Gauge.Progress:=0;
     FormProgress.LabelHeader.Caption:='Перенос данных 1ДФ в dbf';
     FormProgress.LabelFooter.Caption:='0/'+IntToStr(RecordBound);
     Application.ProcessMessages;
     while not pFIBQuery1DF.Eof do
       begin
              FillDBFRecord;
              inc(ix);
              FormProgress.Gauge.Progress := ix;
              FormProgress.LabelFooter.Caption:=IntToStr(ix)+' / '+IntToStr(RecordBound);
              application.ProcessMessages;
              pFIBQuery1DF.Next;
       end;
     FormProgress.Hide;
     FormProgress.Free;
     dBase.Close;
     dBase.Free;
     if pFIBQuery1DF.Open then
        pFIBQuery1DF.Close;
     if pFIBQuery1DF.Transaction.Active then
        pFIBQuery1DF.Transaction.Commit;
end;

procedure TForm1DF.FillDBFTables;
var CurrM  : integer;

begin
     if m<4 then
        currm:=1
     else
     if m<7 then
        currm:=4
     else
     if m<10 then
        currm:=7
     else
        currm:=10;
     try
        FillDBFTable(Self.Y,Currm  ,1);
        FillDBFTable(self.Y,Currm+1,2);
        FillDBFTable(self.Y,Currm+2,3);
        showMessage('Перенос закончен');
     except
        on E: Exception do
           begin
                ShowMessage(pchar(E.Message));
           end;
        else
     end;
end;

function TForm1DF.MakeDBFFile(FNameDBF:String;wantedY:Integer;wantedM:integer):String;
 const FNameINI='DScroll.Ini';
 var
    Ini      : TIniFile ;
    S        : string   ;
    DBFDir   : string   ;
    Ch       : string   ;
    DBFNameE : string   ;
    DBFNameD : string   ;
    fName    : string   ;
    ms,ys    : string   ;
 begin
     fName   := getIniFileName;
     s:=fName;
//     S   := ExtractFilePath(Application.ExeName)+FNameINI;
//     S   := ExtractFilePath(Application.ExeName)+FNameINI;
     Ini := TIniFile.Create(S);
     try
         DBFDir := Ini.ReadString( 'Parameters', '1DFDir', '' );
     finally
         Ini.Free;
     end;
     DBFDir:=Trim(DBFDir);
     if Length(DBFDir)<5 then
        begin
             ShowMessage('Не указан параметр 1DFDir в файле DScroll.ini');
             Result:='';
             raise Exception.Create('Не указан параметр 1DFDir в файле DScroll.ini');
             Exit;
        end;
     if not DirectoryExists(DBFDir) then
     if not CreateDir(DBFDir)       then
        begin
             ShowMessage('Отсутствует каталог '+DBFDir+' и не возможно создать его');
             Result:='';
             raise Exception.Create('Отсутствует каталог '+DBFDir+' и не возможно создать его');
             Exit;
        end;
     Ch:=copy(DBFDir,Length(DBFDir),1);
     if (not (Ch[1]  in ['\','/'])) then
        begin
              if pos('\',DBFDir)>0 then DBFDir:=DBFDir+'\'
              else
              if pos('/',DBFDir)>0 then DBFDir:=DBFDir+'/';
        end;
//     DBFNameE:=DBFDir+FNameDBF+'E.dbf';
     DBFNameE:=TemplateDIR+FNameDBF+'E.dbf';
     if not FileExists(DBFNameE) then
        begin
             ShowMessage('Отсутствует файл '+DBFNameE);
             Result:='';
             raise   Exception.Create('Отсутствует файл '+DBFNameE);
             Exit;
        end;
     ms:=Trim(IntToStr(wantedM));
     if m<10 then
        ms:='0'+ms;
     ys:=IntToStr(wantedY);
     DBFNameD:=DBFDir+FNameDBF+'_'+ms+'_'+ys+'.dbf';
     if FileExists(DBFNameD)     then
     if not DeleteFile(DBFNameD) then
        begin
             ShowMessage('Ошибка удаления файла  '+DBFNameD);
             Result:='';
             raise   Exception.Create('Ошибка удаления файла '+DBFNameE);
             Exit;
        end;
     if not CopyFile(PChar(DBFNameE),PChar(DBFNameD),true) then
        begin
             ShowMessage('Ошибка копирования файла '+DBFNameE+' в '+ DBFNameD);
             Result:='';
             raise   Exception.Create('Ошибка копирования файла '+DBFNameE);
             Exit;
        end;
     Result:=DBFNameD;
(*
     DBFNameE:=DBFDir+FNameDBF+'E.cdx';
     if not FileExists(DBFNameE) then
        begin
             ShowMessage('Отсутствует файл '+DBFNameE);
             Result:='';
             Exit;
        end;
     DBFNameD:=DBFDir+FNameDBF+'.cdx';
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
*)        
 end;


procedure TForm1DF.DBF1Click(Sender: TObject);
begin
      if YesNo('Перенести данные в dbf-файл?') then
//         FillDBFTable;
         FillDBFTables;
end;

procedure TForm1DF.N2Click(Sender: TObject);
var SQLStmnt:string;
begin
     if isLNR then
        begin
             SQLStmnt:='select a.tabno,a.fio,a.summaadd,a.summapod,a.datapri,a.datauw   from tb_1df a'+
                       ' where char_length(trim(coalesce(nal_code,'''')))<>10'+
                       ' and y='+Trim(IntToStr(y))+
                       ' and m='+Trim(IntToStr(m));
             if kindPodr<>UnivAll then
                SQLStmnt:=Trim(SQLStmnt)+makeFilterString;
(*
             if kindPodr = Alchevsk then
                SQLStmnt:=Trim(SQLStmnt)+
                       ' and exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (17))'+
                       '  )'
             else
             if kindPodr = SelHoz then
                SQLStmnt:=Trim(SQLStmnt)+
                       ' and exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (18))'+
                       '  )'

             else
             if kindPodr = UnivBezAS then
                SQLStmnt:=Trim(SQLStmnt)+
                       ' and not exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (17,18))'+
                       '  )';
*)
             SQLStmnt:=Trim(SQLStmnt)+
                       ' order by fio';


             pFibDataSetBK.SQLs.SelectSQL.Clear;
             pFibDataSetBK.SQLs.SelectSQL.Add(SQLStmnt);
        end
     else
      begin
           pFIBDataSetBK.Params[0].AsInteger:=y;
           pFIBDataSetBK.Params[1].AsInteger:=m;
      end;
     pFibDataSetBK.Transaction.StartTransaction;
     pFibDataSetBK.Open;
     frxReportBK.ShowReport();
     pFibDataSetBK.Close;
     pFibDataSetBK.Transaction.Commit;
end;

procedure TForm1DF.frxReportBKGetValue(const VarName: String;
  var Value: Variant);
 var S:string;
begin
    if trim(VarName)='d' then
       begin
            S:=IntToStr(CurrKw)+'-й квартал '+IntToStr(Y)+' г.';
            Value:=S;
       end;
end;

procedure TForm1DF.N11Click(Sender: TObject);
var SQLStmnt:string;
begin
      if not YesNo('При создании новой ведомости 1ДФ старые данные (если они были) будут потеряны!'+#10#13+'Создать новую справку?') then
         Exit;

      if pFIBQuery1DF.Open then
         pFIBQuery1DF.Close;
      if pFIBQuery1DF.Transaction.Active then
         pFIBQuery1DF.Transaction.Commit;
      SQLStmnt:='select retval from pr_1df_mk_all('+IntToStr(Y)+','+IntToStr(M)+')';
      pFIBQuery1DF.Transaction.StartTransaction;
      pFIBQuery1DF.SQL.Clear;

      pFIBQuery1DF.SQL.Add(SQLStmnt);
      FormWait.Show;
      Application.ProcessMessages;
      pFIBQuery1DF.ExecQuery;
      FormWait.Hide;
      Application.ProcessMessages;
      pFIBQuery1DF.Close;
      pFIBQuery1DF.Transaction.Commit;
      ShowTable;


end;

procedure TForm1DF.frxReportSummyGetValue(const VarName: String;
  var Value: Variant);
begin
     if trim(VarName)='d' then
        Value:=IntToStr(CurrKw)+'-й квартал '+IntToStr(Y)+' г.'
end;

procedure TForm1DF.N3Click(Sender: TObject);
begin
     pFIBDataSetSummy.Params[0].AsInteger:=y;
     pFIBDataSetSummy.Params[1].AsInteger:=m;
     pFibDataSetSummy.Transaction.StartTransaction;
     pFibDataSetSummy.Open;
     frxReportSummy.ShowReport();
     pFibDataSetSummy.Close;
     pFibDataSetSummy.Transaction.Commit;

end;

procedure TForm1DF.FillXMLDocumentJ0500105;
type pRec=^tRec;
     tRec=record
                nal_code     : string;
                rownum       : Integer;
                summaadd     : Real;
                summapod     : Real;
                code_priz    : integer;
                ozn_pilg     : integer;
                datapri      : TDate;
                datauw       : TDate;
                rownumXML    : string;
                summaaddXML  : string;
                summapodXML  : string;
                code_prizXML : string;
                ozn_pilgXML  : string;
                datapriXML   : string;
                datauwXML    : string;
          end;
var DevXML          : TextFile;
    fmsFloatPoint   : TFormatSettings;
    FName           : string    ;
    SQLStmnt        : string    ;
    FNameXML        : string    ;
    LineNo          : integer   ;
    List            : TList     ;
    i,ix,recordBound : Integer   ;
    nmes1df,year1df :Integer;
    amntOfRow,amntOfPerson:Integer;
    summaAdd,summaPod,summaWar:real;


function getDBFDir(var EscPressed:Boolean):string;
 const FNameINI='DScroll.Ini';
 var S,Ch,DBFDir:String;
     Ini:TIniFile;
     fName:string;
 begin
     fName:=getIniFileName;
     s:=fName;
     EscPressed := False;
//     S   := ExtractFilePath(Application.ExeName)+FNameINI;
     Ini := TIniFile.Create(S);
     try
         DBFDir := Ini.ReadString( 'Parameters', '1DFDir', '' );
     finally
         Ini.Free;
     end;
     DBFDir:=Trim(DBFDir);
     if Length(DBFDir)<5 then
        begin
             ShowMessage('Не указан параметр 1DFDir в файле DScroll.ini');
             EscPressed:=True;
             Result:='';
             Exit;
        end;
     if not DirectoryExists(DBFDir) then
     if not CreateDir(DBFDir)       then
        begin
             ShowMessage('Отсутствует каталог '+DBFDir+' и не возможно создать его');
             EscPressed:=True;
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
     getDBFDir:=DBFDir;
 end;
function GetName:string;
 begin
       Result:='1dfdata.xml';
 end;

 function convertDateToXML(dt:tDate):string;
  var retVal:string;
      y,m,d:Word;
      ds,ms:string;
  begin
      DecodeDate(dt,y,m,d);
      if m<10 then
         ms:='0'+intToStr(m)
      else
         ms:=intToStr(m);
      if d<10 then
         ds:='0'+intToStr(d)
      else
         ds:=intToStr(d);
      retVal:=ds+ms+intToStr(y);
      convertDateToXML:=retVal;
  end;

function PutXMLFileHeader:Boolean;
 var s:string;
     devHat:TextFile;
     fNameHat:string;
     ys,dats,kwas:string;
     escPressed:Boolean;
 begin
      fNameHat:=getDBFDir(EscPressed);
      result:=False;
      if EscPressed  then Exit;
      FNameXML:=fNameHat+getName;
      fNameHat:=fNameHat+'hat_xml.txt';

      dats:=convertDateToXML(date);
      case NMES1df of
       1,2,3: kwas:='1';
       4,5,6: kwas:='2';
       7,8,9: kwas:='3';
       else kwas:='4';
      end;
      Reset(devHat,fNameHat);
      Rewrite(devXML,FNameXML);
      while (not Eof(devHat)) do
        begin
             readln(devHat,S);
             if Pos('PERIOD_MONTH',s)>0 then
                s:='      <PERIOD_MONTH>'+intToStr(nmes1df)+'</PERIOD_MONTH>'
             else
             if Pos('PERIOD_YEAR',s)>0 then
                s:='      <PERIOD_YEAR>'+intToStr(YEAR1df)+'</PERIOD_YEAR>'
             else
             if Pos('<D_FILL',s)>0 then
                s:='      <D_FILL>'+dats+'</D_FILL>'
             else
             if Pos('<HZKV',s)>0 then
                s:='      <HZKV>'+kwas+'</HZKV>'
             else
             if Pos('<HZY',s)>0 then
                s:='      <HZY>'+intToStr(year1df)+'</HZY>'
             else
             if Pos('<R00G01I',s)>0 then
                s:='      <R00G01I>'+intToStr(amntOfPerson)+'</R00G01I>'
             else
             if Pos('<R00G02I',s)>0 then
                s:='      <R00G02I>0</R00G02I>';

             Writeln(devXML,s);
        end;
      CloseFile(devHat);
      result:=True;
 end;
procedure PutXMLFileFooter;
 var s:string;
     devFoot:TextFile;
     fNameFoot:string;
     ys,dats,kwas:string;
     escPressed:Boolean;
 begin
      dats:=convertDateToXML(date);
      fNameFoot:=getDBFDir(EscPressed)+'fot_xml.txt';
      Reset(devFoot,fNameFoot);
      while (not Eof(devFoot)) do
        begin
             readln(devFoot,S);
             if Pos('R01G03A',s)>0 then
                s:='      <R01G03A>'+trim(replChar(format('%12.2f',[summaAdd]),',','.'))+'</R01G03A>'
             else
             if Pos('R01G03',s)>0 then
                s:='      <R01G03>'+trim(replChar(format('%12.2f',[summaAdd]),',','.'))+'</R01G03>'
             else
             if Pos('R01G04A',s)>0 then
                s:='      <R01G04A>'+trim(replChar(format('%12.2f',[summaPod]),',','.'))+'</R01G04A>'
             else
             if Pos('R01G04',s)>0 then
                s:='      <R01G04>'+trim(replChar(format('%12.2f',[summaPod]),',','.'))+'</R01G04>'
             else
             if Pos('<R0205G03A',s)>0 then
                s:='      <R0205G03A>'+trim(replChar(format('%12.2f',[summaAdd]),',','.'))+'</R0205G03A>'
             else
             if Pos('<R0205G03',s)>0 then
                s:='      <R0205G03>'+trim(replChar(format('%12.2f',[summaAdd]),',','.'))+'</R0205G03>'
             else
             if Pos('<R0205G04A',s)>0 then
                s:='      <R0205G04A>'+trim(replChar(format('%12.2f',[summaWar]),',','.'))+'</R0205G04A>'
             else
             if Pos('<R0205G04',s)>0 then
                s:='      <R0205G04>'+trim(replChar(format('%12.2f',[summaWar]),',','.'))+'</R0205G04>'
             else
             if Pos('<R02G01I',s)>0 then
                s:='      <R02G01I>'+intToStr(List.Count)+'</R02G01I>'
             else
             if Pos('<R02G01I',s)>0 then
                s:='      <R02G02I>'+intToStr(amntOfPerson)+'</R02G02I>'
             else
             if Pos('<HFILL',s)>0 then
                s:='      <HFILL>'+dats+'</HFILL>';

             Writeln(devXML,s);
        end;
      CloseFile(devFoot);
 end;

function BuildSQLStmnt:string;
 begin
      result:='select nal_code,summaadd,summapod,code_priz,ozn_pilg,datapri,datauw from tb_1df where y='+IntToStr(Y)+' and m='+IntToStr(M)+' and nal_code is not null and char_length(trim(nal_code))=10 order by nal_code' ;
 end;

 function buildSqlStmntItogi:WideString;
   var s:WideString;
       s1:string;
     begin
          case nmes1df of
            1,2,3: s1:='1,2,3';
            4,5,6: s1:='4,5,6';
            7,8,9: s1:='7,8,9';
            else   s1:='10,11,12';
          end;
          s:='select count(*),count(distinct nal_code),sum(summaadd),sum(summapod),';
          s:=Trim(s)+'(select sum(summa) from fud';
          s:=Trim(s)+' where year_vy='+intToStr(year1df);
          s:=Trim(s)+' and shifrsta='+intToStr(WAR_SBOR_SHIFR);
          s:=Trim(s)+' and month_vy in ('+s1+'))';
          s:=Trim(s)+' from tb_1df';
          s:=Trim(s)+' where y='+intToStr(year1df);
          s:=Trim(s)+' and m='+intToStr(nmes1df);
          s:=Trim(s)+' and strlen(trim(coalesce(nal_code,'''')))=10';
          buildSqlStmntItogi:=s;
     end;

 procedure getSummy(var amntOfRow:Integer;var amntOfPerson:Integer; var summaAdd:Real; var summaPod:Real; var summaWar:real);
     var SQLStmnt:WideString;
         v:Variant;
     begin
         SQLStmnt:=buildSqlStmntItogi;
         FormWait.Show;
         Application.ProcessMessages;
         v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
         FormWait.Hide;
         Application.ProcessMessages;
         amntOfRow     := v[0];
         amntOfPerson  := v[1];
         summaAdd      := v[2];
         summaPod      := v[3];
         summaWar      := v[4];

     end;
 function addRecordToList(lineno:integer):boolean;
  var
     p:pRec;
  begin
       new(p);
       p^.nal_code  := pFIBQuery1DF.Fields[0].AsString;
       p^.rownum    := lineno;
       p^.summaadd  := pFIBQuery1DF.Fields[1].AsFloat;
       p^.summapod  := pFIBQuery1DF.Fields[2].AsFloat;
       p^.code_priz := pFIBQuery1DF.Fields[3].AsInteger;
       p^.ozn_pilg  := pFIBQuery1DF.Fields[4].AsInteger;
       p^.datapri   := pFIBQuery1DF.Fields[5].AsDate;
       p^.datauw    := pFIBQuery1DF.Fields[6].AsDate;
       //------------------
       p^.rownumXML   := intToStr(p^.rownum);
       p^.summaaddXML := Trim(format('%10.2f',[p^.summaadd]));
       p^.summaaddXML := ReplChar(p^.summaaddXML,',','.');
       p^.summapodXML := Trim(format('%10.2f',[p^.summapod]));
       p^.summapodXML := ReplChar(p^.summapodXML,',','.');
       if ((p^.code_priz=126) or
           (p^.code_priz=169) or
           (p^.code_priz=102) or
           (p^.code_priz=128)
          ) then
            p^.code_prizXML:=IntToStr(p^.code_priz)
       else
            p^.code_prizXML:='101';

       if yearof(p^.datapri)=year1df then
          p^.datapriXML:=ConvertDateToXML(p^.datapri)
       else
         p^.datapriXML:='';
       if yearof(p^.datauw)=year1df then
          p^.datauwXML:=ConvertDateToXML(p^.datauw)
       else
         p^.datauwXML:='';
       p^.ozn_pilgXML:=IntToStr(P^.ozn_pilg);
       List.Add(p);
  end;

  function putXMLNalCode(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        s:='        <T1RXXXXG02 ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.nal_code)+'</T1RXXXXG02>';
        Writeln(devXML,s);
   end;
  function putXMLSummaAdd3A(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Abs(p^.summaadd)<0.01 then Exit;
        s:='        <T1RXXXXG03A ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.summaaddXML)+'</T1RXXXXG03A>';
        Writeln(devXML,s);
   end;
  function putXMLSummaAdd3(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Abs(p^.summaadd)<0.01 then Exit;
        s:='        <T1RXXXXG03 ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.summaaddXML)+'</T1RXXXXG03>';
        Writeln(devXML,s);
   end;
  function putXMLSummaPod4A(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Abs(p^.summapod)<0.01 then Exit;
        s:='        <T1RXXXXG04A ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.summapodXML)+'</T1RXXXXG04A>';
        Writeln(devXML,s);
   end;
  function putXMLSummaPod4(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Abs(p^.summapod)<0.01 then Exit;
        s:='        <T1RXXXXG04 ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.summapodXML)+'</T1RXXXXG04>';
        Writeln(devXML,s);
   end;
  function putXMLCodePriz(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        s:='        <T1RXXXXG05 ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.code_prizXML)+'</T1RXXXXG05>';
        Writeln(devXML,s);
   end;
  function putXMLDataPri(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Length(Trim(p^.datapriXML))<3 then Exit;
        s:='        <T1RXXXXG06D ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.datapriXML)+'</T1RXXXXG06D>';
        Writeln(devXML,s);
   end;
  function putXMLDataUw(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Length(Trim(p^.dataUwXML))<3 then Exit;
        s:='        <T1RXXXXG07D ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.datauwXML)+'</T1RXXXXG07D>';
        Writeln(devXML,s);
   end;
  function putXMLOznPilg(recNo:integer):Boolean;
   var p:pRec;
       s:string;
   begin
        p:=pRec(List.Items[recNo]);
        if Length(Trim(p^.dataUwXML))<3 then Exit;
        s:='        <T1RXXXXG08 ROWNUM="'+intToStr(p^.rownum)+'">'+trim(p^.ozn_pilgXML)+'</T1RXXXXG08>';
        Writeln(devXML,s);
   end;

begin

     if pFIBQuery1DF.Open then
        pFIBQuery1DF.Close;
     if pFIBQuery1DF.Transaction.Active then
        pFIBQuery1DF.Transaction.Commit;
     nmes1df:=MonthOf(DateTimePicker1.Date);
     year1df:=yearOf(DateTimePicker1.Date);

     SQLStmnt:='select count(*) from tb_1df where y='+IntToStr(Y)+' and m='+IntToStr(M);
     pFIBQuery1DF.Transaction.StartTransaction;
     pFIBQuery1DF.SQL.Clear;

     pFIBQuery1DF.SQL.Add(SQLStmnt);
     pFIBQuery1DF.ExecQuery;
     RecordBound:=pFIBQuery1DF.Fields[0].AsInteger;
     if RecordBound<1 then
        begin
             ShowMessage('Нет записей в таблице');
             pFIBQuery1DF.Close;
             pFIBQuery1DF.Transaction.Commit;
             Exit;
        end;

     fmsFloatPoint.DecimalSeparator := '.';
     getSummy(amntOfRow,amntOfPerson,summaAdd,summaPod,summaWar);

     List:=TList.Create;
     pFIBQuery1DF.Close;
     SQLStmnt:=BuildSQLStmnt;
     pFIBQuery1DF.SQL.Clear;
     pFIBQuery1DF.SQL.Add(SQLStmnt);
     pFIBQuery1DF.ExecQuery;
//     ProgressBarPFU.Min:=0;
//     ProgressBarPFU.Max:=RecordBound;
//     ProgressBarPFU.Position:=0;
     ix:=0;
     LineNo:=0;
     Application.CreateForm(TFormProgress, FormProgress);
     FormProgress.Show;
     FormProgress.Gauge.MaxValue:=RecordBound;
     FormProgress.Gauge.MinValue:=0;
     FormProgress.Gauge.Progress:=0;
     FormProgress.LabelHeader.Caption:='Перенос данных 1ДФ в XML';
     FormProgress.LabelFooter.Caption:='0/'+IntToStr(RecordBound);
     Application.ProcessMessages;
     while not pFIBQuery1DF.Eof do
       begin
              inc(ix);
              addRecordToList(ix);
              FormProgress.Gauge.Progress := ix;
              FormProgress.LabelFooter.Caption:=IntToStr(ix)+' / '+IntToStr(RecordBound);
              application.ProcessMessages;
              pFIBQuery1DF.Next;
       end;
     if pFIBQuery1DF.Open then
        pFIBQuery1DF.Close;
     if pFIBQuery1DF.Transaction.Active then
        pFIBQuery1DF.Transaction.Commit;
     if PutXMLFileHeader then
        begin
             for i:=0 to List.Count-1 do
                 putXMLNalCode(i);
             for i:=0 to List.Count-1 do
                 putXMLSummaAdd3A(i);
             for i:=0 to List.Count-1 do
                 putXMLSummaAdd3(i);
             for i:=0 to List.Count-1 do
                 putXMLSummaPod4A(i);
             for i:=0 to List.Count-1 do
                 putXMLSummaPod4(i);
             for i:=0 to List.Count-1 do
                 putXMLCodePriz(i);
             for i:=0 to List.Count-1 do
                 putXMLDataPri(i);
             for i:=0 to List.Count-1 do
                 putXMLDataUw(i);
             for i:=0 to List.Count-1 do
                 putXMLOznPilg(i);
             putXMLFileFooter;
             CloseFile(devXML);
        end;
     FormProgress.Hide;
     FormProgress.Free;
     if List.Count>0 then
        for i:=0 to List.Count-1 do
            Dispose(pRec(List.Items[i]));
     List.Free;
     List:=nil;
end;


procedure TForm1DF.XMLJ05001051Click(Sender: TObject);
begin
     FillXMLDocumentJ0500105;
     ShowMessage('Перенос закончен');
end;

procedure TForm1DF.XMLj05001052Click(Sender: TObject);
begin
     Application.CreateForm(TForm1DFStipToXML,Form1DFStipToXML);
     Form1DFStipToXML.ShowModal;
end;

procedure TForm1DF.N4Click(Sender: TObject);
var pageNo:Integer;
begin
      if not isLNR then Exit;
      if YesNo('Перенести данные в Excel для печати?') then
        if YesNo('Вывести первую часть (от 1 до 1000 строк)?') then  pageNo:=1
        else pageNo:=2;
         FillXLSTable(0,pageNo);

end;

procedure TForm1DF.N5Click(Sender: TObject);
begin
      if not isLNR then Exit;
      if YesNo('Перенести данные в Excel файл для передачи?') then
         FillXLSTable(1);

end;
procedure TForm1DF.FillXLSTable(outMode:integer;pageNo:integer);
var
    RecordBound, ix : integer ;
    iCheckMode    : integer   ;
    SQLStmnt      : string    ;
    FNameXLS      : string    ;
    LineNo        : integer   ;
    CurrRow       : Integer   ;
    E             : Variant   ;
    needPrint     : Boolean   ;
    v             : Variant   ;

function GetName:string;
 const FNameINI='DScroll.Ini';
 var
    Ini      : TIniFile ;
    S        : string   ;
    Ch       : string   ;
    FileName : string;
    fName    : string;
 begin
     fName:=getIniFileName;
     s:=fName;
//     S   := ExtractFilePath(Application.ExeName)+FNameINI;
     Ini := TIniFile.Create(S);
     try
         if outMode=0 then
            FileName := Ini.ReadString( 'Parameters', 'Excel1DFName', '' )
         else
            FileName := Ini.ReadString( 'Parameters', 'Excel1DFNameOut', '' );
     finally
         Ini.Free;
     end;
     FileName:=Trim(FileName);
     if Length(FileName)<5 then
        begin
             if outMode=0 then
                 ShowMessage('Не указан параметр Excel1DFName в файле DScroll.ini')
             else
                 ShowMessage('Не указан параметр Excel1DFNameOut в файле DScroll.ini');
             Result:='';
             Exit;
        end;
     if not FileExists(FileName) then
        begin
             ShowMessage('Отсутствует файл '+FileName);
             Result:='';
             Exit;
        end;
     Result:=FileName;
 end;

 procedure getKwartalYearS(var KwartalS:string;var YearS:string);
  var kw:Integer;
  begin
       kw:= ((m-1) div 3)+1;
       kwartalS:=IntToStr(kw);
       yearS:=IntToStr(y);
  end;
function BuildSQLStmnt:string;
 var SQLStmnt:string;
 begin
 //     result:='select nal_code,summaadd,summapod,code_priz,ozn_pilg,datapri,datauw from tb_1df where y='+IntToStr(Y)+' and m='+IntToStr(M)+' and nal_code is not null and char_length(trim(nal_code))=10 order by nal_code' ;
        SQlStmnt:='select nal_code,summaadd,summapod,code_priz,ozn_pilg,datapri,datauw,tabno from tb_1df a where y='+IntToStr(Y)+' and m='+IntToStr(M);
        if kindPodr<>UnivAll then
           SQLStmnt:=Trim(SQLStmnt)+makeFilterString;
(*
        if kindPodr = Alchevsk then
           SQLStmnt:=Trim(SQLStmnt)+
                       '    and exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (17))'+
                       '  )'
        else
        if kindPodr = SelHoz then
           SQLStmnt:=Trim(SQLStmnt)+
                       '    and exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (18))'+
                       '  )'

        else
        if kindPodr = UnivBezAS then
                SQLStmnt:=Trim(SQLStmnt)+
                       '    and not exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (17,18))'+
                       '  )';
*)
        SQlStmnt:=Trim(SQlStmnt)+' order by nal_code' ;
        BuildSQLStmnt:=SQLStmnt;
 end;

 procedure getItogiFromSQL(var NmbOfRec:Integer;var nmbOfTabno:Integer;var nmbOfSal:Integer;var nmbOfDog:Integer);
  var SQLStmnt:WideString;
      v:Variant;
  begin
       NmbOfRec   := 0;
       nmbOfTabno := 0;
       nmbOfSal   := 0;
       nmbOfDog   := 0;
       if pageNo=1 then
          SQLStmnt:='select count(*) cnt, count(distinct tabno) ctn,sum(case when (code_priz=102) then 0 else 1 end),sum(case when (code_priz=102) then 1 else 0 end) from ( select first 1000 * from tb_1df a where a.y='+intToStr(y)+' and a.m='+intToStr(m)
       else
          SQLStmnt:='select count(*) cnt, count(distinct tabno) ctn,sum(case when (code_priz=102) then 0 else 1 end),sum(case when (code_priz=102) then 1 else 0 end) from (select first 1000 skip 1000 * from tb_1df a where a.y='+intToStr(y)+' and a.m='+intToStr(m);

       if kindPodr<>UnivAll then
          SQLStmnt:=trim(SQlStmnt)+makeFilterString;
       SQlStmnt:=Trim(SQLStmnt)+' order by a.nal_code)';

       v:=FIB.pFIBDatabaseSal.QueryValues(SQLStmnt);
       if VarIsArray(v) then
          begin
               NmbOfRec    := v[0];
               nmbOfTabno  := v[1];
               nmbOfSal    := v[2];
               nmbOfDog    := v[3];
          end;
  end;

 procedure FillItogi;
  var
     NmbOfRec    : integer;
     nmbOfTabno  : integer;
     nmbOfSal    : integer;
     nmbOfDog    : integer;
     NmbOfRecS   : string;
     nmbOfTabnoS : string;
     nmbOfSalS   : string;
     nmbOfDogS   : string;
     i           : integer;
  begin
     NmbOfRec    := 0;
     nmbOfTabno  := 0;
     nmbOfSal    := 0;
     nmbOfDog    := 0;
     getItogiFromSQL(NmbOfRec,nmbOfTabno,nmbOfSal,nmbOfDog);
     nmbOfSalS:=Trim(IntToStr(nmbOfSal));
     if Length(nmbOfSalS)<5 then
        nmbOfSalS:=SPACE(5-Length(nmbOfSalS))+nmbofSalS;
     for i:=1 to 5 do
         E.WorkBooks[1].sheets[1].cells[20,11+i]:=Copy(nmbOfSalS,i,1);
     nmbOfDogS:=Trim(IntToStr(nmbOfDog));
     if Length(nmbOfDogS)<5 then
        nmbOfDogS:=SPACE(5-Length(nmbOfDogS))+nmbofDogS;
     for i:=1 to 5 do
         E.WorkBooks[1].sheets[1].cells[21,11+i]:=Copy(nmbOfDogS,i,1);
     nmbOfRecS:=Trim(IntToStr(nmbOfRec));
     if Length(nmbOfRecS)<5 then
        nmbOfRecS:=SPACE(5-Length(nmbOfRecS))+nmbofRecS;
     for i:=1 to 5 do
         E.WorkBooks[1].sheets[1].cells[75,6+i]:=Copy(nmbOfRecS,i,1);
     nmbOfTabnoS:=Trim(IntToStr(nmbOfTabno));
     if Length(nmbOfTabnoS)<5 then
        nmbOfTabnoS:=SPACE(5-Length(nmbOfTabnoS))+nmbofTabnoS;
     for i:=1 to 5 do
         E.WorkBooks[1].sheets[1].cells[76,6+i]:=Copy(nmbOfTabnoS,i,1);
  end;
 procedure fillHeader;
  var kwartalS,yearS:string;
      i:Integer;
  begin
       getKwartalYearS(kwartalS,yearS);
       E.WorkBooks[1].sheets[1].cells[8,7]:=kwartalS;
       for i:=1 to 4 do
           E.WorkBooks[1].sheets[1].cells[8,9+i]:=Copy(yearS,i,1);

  end;

 function FillXLSRecord:boolean;
  var
     summaadd,summapod : real;
     nal_code : string;
     code_priz,ozn_pilg:integer;
     datapri,datauw:TDateTime;
     i:Integer;
     s:string;
     rub,kop:Real;
     rubs,kops:string;
     tabno : Integer;
 begin
      nal_Code  := pFIBQuery1DF.Fields[0].AsString;
  //    if length(trim(nal_Code))<10 then Exit;
      summaadd  := pFIBQuery1DF.Fields[1].AsFloat;
      summapod  := pFIBQuery1DF.Fields[2].AsFloat;
      Code_priz := pFIBQuery1DF.Fields[3].AsInteger;
      Ozn_Pilg  := pFIBQuery1DF.Fields[4].AsInteger;
      datapri   := pFIBQuery1DF.Fields[5].AsDate;
      datauw    := pFIBQuery1DF.Fields[6].AsDate;
      tabno     := pFIBQuery1DF.Fields[7].AsInteger;
      if (Length(trim(nal_code))<>10)
         and (tabno>0) then
         begin
              nal_code:=getPersonPaspForInn(tabno);
              if Length(nal_code)<10 then
                 nal_code:=Copy(nal_code+space(10),1,10)
         end;
  //    LineNo    := LineNo+1;
      Inc(currRow);
      if outMode=0 then
         begin
              E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1].Select;
              E.Selection.EntireRow.Insert;
              s:=space(5)+trim(IntToStr(lineNo));
              s:=Copy(s,Length(s)-4,5);
              for i:=1 to 5 do
                  if Copy(s,i,1)<>' ' then
                     E.workBooks[1].Sheets[1].Cells(currRow,i):=Copy(s,i,1);
              for i:=1 to 10 do
                  E.workBooks[1].Sheets[1].Cells(currRow,5+i):=Copy(nal_code,i,1);
              rub := Round(int(summaadd));
              kop := Round(frac(summaadd)*100);
              E.workBooks[1].Sheets[1].Cells(currRow,16):=rub;
              E.workBooks[1].Sheets[1].Cells(currRow,17):=kop;
              E.workBooks[1].Sheets[1].Cells(currRow,18):=rub;
              E.workBooks[1].Sheets[1].Cells(currRow,19):=kop;
              rub:=Round(int(summapod));
              kop:= Round(frac(summapod)*100);
              E.workBooks[1].Sheets[1].Cells(currRow,20):=rub;
              E.workBooks[1].Sheets[1].Cells(currRow,21):=kop;
              E.workBooks[1].Sheets[1].Cells(currRow,22):=rub;
              E.workBooks[1].Sheets[1].Cells(currRow,23):=kop;
              if code_priz=102 then
                 E.workBooks[1].Sheets[1].Cells(currRow,24):=102
              else
                 E.workBooks[1].Sheets[1].Cells(currRow,24):=101;

              if yearof(datapri)=y then
                 begin
                     E.workBooks[1].Sheets[1].Cells(currRow,25):=DayOf(dataPri);
                     E.workBooks[1].Sheets[1].Cells(currRow,26):=MonthOf(dataPri);
                     E.workBooks[1].Sheets[1].Cells(currRow,27):=YearOf(dataPri);
                 end;
              if yearof(datauw)=y then
                 begin
                     E.workBooks[1].Sheets[1].Cells(currRow,28):=DayOf(dataUw);
                     E.workBooks[1].Sheets[1].Cells(currRow,29):=MonthOf(dataUw);
                     E.workBooks[1].Sheets[1].Cells(currRow,30):=YearOf(dataUw);
                 end;


         end
      else
         begin
              E.workBooks[1].Sheets[1].Cells(currRow,1):=nal_code;
              E.workBooks[1].Sheets[1].Cells(currRow,2):=summaadd;
              E.workBooks[1].Sheets[1].Cells(currRow,3):=summaadd;
              E.workBooks[1].Sheets[1].Cells(currRow,4):=summapod;
              E.workBooks[1].Sheets[1].Cells(currRow,5):=summapod;
//              E.workBooks[1].Sheets[1].Cells(currRow,6):=101;
              if code_priz=102 then
                 E.workBooks[1].Sheets[1].Cells(currRow,6):=102
              else
                 E.workBooks[1].Sheets[1].Cells(currRow,6):=101;
              if yearof(datapri)=y then
                 begin
                     s:=ConvertDataToDDMMYYYY(datapri);
                     E.workBooks[1].Sheets[1].Cells(currRow,7):=s;
                 end;
              if yearof(datauw)=y then
                 begin
                     s:=ConvertDataToDDMMYYYY(datauw);
                     E.workBooks[1].Sheets[1].Cells(currRow,8):=s;
                 end;
         end;
end;

begin
     FNameXLS := GetName;
     if Length(Trim(FNameXLS))<5 then Exit;
  //   LabelUp.Caption:='Перенос таблицы '+FNameDBF;;
  //   Application.ProcessMessages;
     if pFIBQuery1DF.Open then
        pFIBQuery1DF.Close;
     if pFIBQuery1DF.Transaction.Active then
        pFIBQuery1DF.Transaction.Commit;
     SQLStmnt:='select count(*) from tb_1df a where a.y='+IntToStr(Y)+' and a.m='+IntToStr(M);
     if isLNR and (kindPodr<>UnivAll) then
       SQLStmnt:=trim(SQLStmnt)+makeFilterString;
(*
     pFIBQuery1DF.Transaction.StartTransaction;
     pFIBQuery1DF.SQL.Clear;

     pFIBQuery1DF.SQL.Add(SQLStmnt);
     pFIBQuery1DF.ExecQuery;
     RecordBound:=pFIBQuery1DF.Fields[0].AsInteger;
     if RecordBound<1 then
        begin
             ShowMessage('Нет записей в таблице');
             pFIBQuery1DF.Close;
             pFIBQuery1DF.Transaction.Commit;
             Exit;
        end;
*)
     RecordBound:=0;
     v:=SQLQueryValue(SQLStmnt);
     if VarIsNumeric(v) then
        RecordBound:=v;
     if RecordBound=0 then
        begin
             ShowMessage('Нет записей в таблице');
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
       on E: Exception do begin
           messagebox(0,pchar(E.Message),'Ошибка',16);
           Exit;
       end;
     end;
     E.Visible:=false;
     E.WorkBooks.Open(FNameXLS);
     E.WorkBooks[1].WorkSheets[1].Activate;
     pFIBQuery1DF.Close;
     if pFIBQuery1DF.Transaction.Active then
        pFIBQuery1DF.Transaction.Commit;
     SQLStmnt:=BuildSQLStmnt;
     pFIBQuery1DF.SQL.Clear;
     pFIBQuery1DF.SQL.Add(SQLStmnt);
     pFIBQuery1DF.Transaction.StartTransaction;
     pFIBQuery1DF.ExecQuery;
//     ProgressBarPFU.Min:=0;
//     ProgressBarPFU.Max:=RecordBound;
//     ProgressBarPFU.Position:=0;
     ix:=0;
     LineNo:=0;
     Application.CreateForm(TFormProgress, FormProgress);
     FormProgress.Show;
     FormProgress.Gauge.MaxValue:=RecordBound;
     FormProgress.Gauge.MinValue:=0;
     FormProgress.Gauge.Progress:=0;
     FormProgress.LabelHeader.Caption:='Перенос данных 1ДФ в Excel';
     FormProgress.LabelFooter.Caption:='0/'+IntToStr(RecordBound);
     Application.ProcessMessages;
     if outMode=1 then
        CurrRow:=2
     else
        begin
             CurrRow:=26;
             FillItogi;
             fillHeader;
        end;
     while not pFIBQuery1DF.Eof do
       begin
              needPrint:=False;
              if outMode=1 then  needPrint:=True;
              if needPrint=False then
              if pageNo=1 then
                 if ix<1000 then needPrint:=True;
              if needPrint=False then
              if pageNo=2 then
                 if ix>=1000 then needPrint:=True;
              Inc(LineNo);
              if needPrint then
                 FillXLSRecord;
              inc(ix);
              FormProgress.Gauge.Progress := ix;
              FormProgress.LabelFooter.Caption:=IntToStr(ix)+' / '+IntToStr(RecordBound);
              application.ProcessMessages;
              pFIBQuery1DF.Next;
       end;
     FormProgress.Hide;
     FormProgress.Free;
     E.Visible:=true;
     if pFIBQuery1DF.Open then
        pFIBQuery1DF.Close;
     if pFIBQuery1DF.Transaction.Active then
        pFIBQuery1DF.Transaction.Commit;
end;


procedure TForm1DF.N12Click(Sender: TObject);
begin
     if isSVDN then
        executePrint1DF
     else
        ShowMessage('Печать пока не реализована');
end;
procedure TForm1DF.executePrint1DF;
 var lineno:integer;
     wss:string;
     wsr:Real;
     iErr:Integer;
 begin
      summaWarSbor:=0;
      wss:=InputBox('Запрос','Укажите сумму военного сбора для печати','0.00');
      Val(wss,wsr,iErr);
      if iErr<>0 then
         begin
              ShowMessage('Ошибка ввода '+Wss);
         end;
      summaWarSbor:=wsr;
      cds1DF.Open;
      cds1DF.EmptyDataSet;
      pFIBDataSet1DF.First;
      lineno:=0;
      while not pFIBDataSet1DF.Eof do
       begin
            inc(lineno);
            cds1DF.Append;
            cds1DFlineno.Value:=lineno;
            cds1DFINN.Value:=pFIBDataSet1DFNAL_CODE.Value;
            cds1DFPIB.Value:=pFIBDataSet1DFFIO.Value;
            cds1DFsummaAdd.Value:=pFIBDataSet1DFSUMMAADD.Value;
            cds1DFsummaPod.Value:=pFIBDataSet1DFSUMMAPOD.Value;
            cds1DFozndox.Value:=IntToStr(pFIBDataSet1DFCODE_PRIZ.Value);
            cds1DFoznpilg.Value:=IntToStr(pFIBDataSet1DFOZN_PILG.Value);
            cds1DFoznaka.Value:='';
            cds1DFdataPri.Value:=pFIBDataSet1DFDATAPRI.Value;
            cds1DFdataUw.Value:=pFIBDataSet1DFDATAUW.Value;
            cds1DF.Post;
            pFIBDataSet1DF.Next;
       end;
      nmbofRow:=lineno;
      nmbOfRowStarted:=false;
      frxReportFull.ShowReport;
      cds1DF.Close;

 end;



procedure TForm1DF.frxReportFullGetValue(const VarName: String;
  var Value: Variant);
 var s:string;
begin
      if CompareText(VarName,'KWAS')=0 then
         begin
              s:=IntToStr(CurrKw);
              value:=s;
         end
      else
      if CompareText(VarName,'Y1S')=0 then
         begin
              s:=IntToStr(y);
              value:=s[1];
         end
      else
      if CompareText(VarName,'Y2S')=0 then
         begin
              s:=IntToStr(y);
              value:=s[2];
         end
      else
      if CompareText(VarName,'Y3S')=0 then
         begin
              s:=IntToStr(y);
              value:=s[3];
         end
      else
      if CompareText(VarName,'Y4S')=0 then
         begin
              s:=IntToStr(y);
              value:=s[4];
         end
      else
      if CompareText(VarName,'R1S')=0 then
         begin
              s:=Trim(IntToStr(nmbOfRow));
              if Length(s)>=4 then
                 value:=s[1]
              else
                 value:=''
         end
      else
      if CompareText(VarName,'R2S')=0 then
         begin
              s:=Trim(IntToStr(nmbOfRow));
              if Length(s)>=4 then
                 value:=s[2]
              else
              if Length(s)=3 then
                 value:=s[1]
              else
                 value:=''
         end
      else
      if CompareText(VarName,'R3S')=0 then
         begin
              s:=Trim(IntToStr(nmbOfRow));
              if Length(s)>=4 then
                 value:=s[3]
              else
              if Length(s)=3 then
                 value:=s[2]
              else
              if Length(s)=2 then
                 value:=s[1]
              else
                 value:=''
         end
      else
      if CompareText(VarName,'R4S')=0 then
         begin
              s:=Trim(IntToStr(nmbOfRow));
              if Length(s)>=4 then
                 value:=s[4]
              else
              if Length(s)=3 then
                 value:=s[3]
              else
              if Length(s)=2 then
                 value:=s[2]
              else
              if Length(s)=1 then
                 value:=s[1]
              else
                 value:=''
         end
      else
      if CompareText(VarName,'summaWarSbor')=0 then
         begin
           //   s:=IntToStr(y);
              value:=summaWarSbor;
         end;
end;

procedure TForm1DF.initLists;
 var SQLStmnt:string;
     shifrbay,shifrpod:Integer;
     PInt:PInteger;
 begin
      listAlchevsk := nil;
      listSelHoz   := nil;
      listAlchevskString := '';
      listSelHozString   := '';
      if not isLNR then Exit;
      listAlchevsk:=TList.Create;
      listSelHoz:=TList.Create;
      if pFIBQuery1DF.Open then
         pFIBQuery1DF.Close;
      if pFIBQuery1DF.Transaction.Active then
         pFIBQuery1DF.Transaction.Commit;
      SQLStmnt:='select shifrbuh,shifrpod from bay where shifrbuh in (17,18)';
      pFIBQuery1DF.SQL.Clear;
      pFIBQuery1DF.SQL.Add(SQLStmnt);
      pFIBQuery1DF.Transaction.StartTransaction;
      pFIBQuery1DF.ExecQuery;
      while (not pFIBQuery1DF.eof) do
        begin
             shifrbay:=pFIBQuery1DF.Fields[0].AsInteger;
             shifrpod:=pFIBQuery1DF.Fields[1].AsInteger;
             New(PInt);
             PInt^:=shifrpod;
             if shifrbay=17 then
                begin
                     if listAlchevsk.Count>0 then
                        listAlchevskString:=Trim(listAlchevskString)+',';
                     listAlchevskString:=Trim(listAlchevskString)+Trim(IntToStr(shifrPod));
                     listAlchevsk.Add(PInt);
                end
             else
                begin
                     if listSelHoz.Count>0 then
                        listSelHozString:=Trim(listSelHozString)+',';
                     listSelHozString:=Trim(listSelHozString)+Trim(IntToStr(shifrPod));
                     listSelHoz.Add(pInt);
                end;
            pFIBQuery1DF.Next;
        end;

 end;


procedure TForm1DF.cbKindPodrChange(Sender: TObject);
 var kindPodrSav:tKindPodr;
begin
     kindPodrSav := kindPodr;
     case cbKindPodr.ItemIndex of
      0:
        if kindPodr<>UnivAll then
           kindPodr:=UnivAll;
      1:
        if kindPodr<>Alchevsk then
           kindPodr:=Alchevsk;
      2:
        if kindPodr<>SelHoz then
           kindPodr:=SelHoz;
      3:
        if kindPodr<>UnivBezAS then
           kindPodr:=UnivBezAS;
     end;
     if kindPodrSav <> kindPodr then
        ShowTable;

end;

function TForm1DF.makeFilterString:string;
 var retVal:string;
     SQLSTmnt:string;
 begin
      retVal:='';
      SQlStmnt:='';
      if not isLNR then
         begin
              makeFilterString:='';
              Exit;
         end;
      if kindPodr = Alchevsk then
         SQLStmnt:=
                   '    and exists (' +
                   ' select * from tb_1df_add b'+
                   ' where b.shifrid1df=a.shifrid'+
                   ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (17))'+
                   '  )'
      else
      if kindPodr = SelHoz then
         SQLStmnt:=
                       '    and exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (18))'+
                       '  )'

      else
      if kindPodr = UnivBezAS then
         SQLStmnt:=
                       '    and not exists (' +
                       ' select * from tb_1df_add b'+
                       ' where b.shifrid1df=a.shifrid'+
                       ' and b.w_place in (select c.shifrpod from bay c where c.shifrbuh in (17,18))'+
                       '  )';
      makeFilterString:=SQLSTmnt;
 end;

procedure TForm1DF.iDFECBClick(Sender: TObject);
begin
     if not isSVDN then Exit;
     FormCMP1DFECB:=TFormCMP1DFECB.myCreate(Self,Y,M);
     FormCMP1DFECB.ShowModal;
end;

end.
