unit UFormBrowseRusPersDet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, DB, ToolWin, ComCtrls, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, dxExEdtr, dxCntner, dxTL,
  dxDBCtrl, dxDBGrid, dxDBTLCl, dxGrClms, ImgList, ActnList;

type
  TFormBrowseRusPersDet = class(TForm)
    ToolBar1: TToolBar;
    dsoPersDet: TDataSource;
    DBNavigator1: TDBNavigator;
    dsRusPersDet: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsRusPersDetSHIFRID: TFIBIntegerField;
    dsRusPersDetTABNO: TFIBIntegerField;
    dsRusPersDetSUMMA: TFIBBCDField;
    dsRusPersDetFAM: TFIBStringField;
    dsRusPersDetNAM: TFIBStringField;
    dsRusPersDetOTC: TFIBStringField;
    dsRusPersDetINN: TFIBStringField;
    dsRusPersDetSNILS: TFIBStringField;
    dsRusPersDetFIO: TFIBStringField;
    dsRusPersDetPRIZNAK_ANULLIR: TFIBIntegerField;
    dxDBGridRusPersDet: TdxDBGrid;
    dxDBGridRusPersDetSHIFRID: TdxDBGridMaskColumn;
    dxDBGridRusPersDetTABNO: TdxDBGridMaskColumn;
    dxDBGridRusPersDetSUMMA: TdxDBGridCurrencyColumn;
    dxDBGridRusPersDetFAM: TdxDBGridMaskColumn;
    dxDBGridRusPersDetNAM: TdxDBGridMaskColumn;
    dxDBGridRusPersDetOTC: TdxDBGridMaskColumn;
    dxDBGridRusPersDetINN: TdxDBGridMaskColumn;
    dxDBGridRusPersDetSNILS: TdxDBGridMaskColumn;
    dxDBGridRusPersDetFIO: TdxDBGridMaskColumn;
    dxDBGridRusPersDetPRIZNAK_ANULLIR: TdxDBGridMaskColumn;
    ImageList1: TImageList;
    ActionList1: TActionList;
    ActionExportToXML: TAction;
    ToolButton1: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionExportToXMLExecute(Sender: TObject);
  private
     shifridOwner:Integer;
     y:Integer;
     m:Integer;
    { Private declarations }
     procedure exportToFile;

  public
     constructor myCreate(AOwner: TComponent;shifrIdOwner:Integer;y:Integer;m:integer);
    { Public declarations }
  end;

var
  FormBrowseRusPersDet: TFormBrowseRusPersDet;

implementation

{$R *.dfm}
  uses ScrUtil,UFibModule,dateutils,scrdef;

 constructor TFormBrowseRusPersDet.myCreate(AOwner: TComponent;shifrIdOwner:Integer;y:Integer;m:integer);
   begin
       inherited Create(AOwner);
       Self.shifridOwner:=shifrIdOwner;
       Self.y:=y;
       Self.m:=m;
       Caption:='Список персонофикации за '+GetMonthRus(m)+' '+IntToStr(y)+' г.';
       dsRusPersDet.Transaction.StartTransaction;
       dsRusPersDet.Params[0].Value:=Self.shifridOwner;
       dsRusPersDet.Open;

   end;


procedure TFormBrowseRusPersDet.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     dsRusPersDet.Close;
     dsRusPersDet.Transaction.Commit;
     Action:=caFree;
end;

procedure TFormBrowseRusPersDet.ActionExportToXMLExecute(Sender: TObject);
begin
     exportToFile;
end;

procedure TFormBrowseRusPersDet.exportToFile;
    var E,WC:Variant;
        sc,i:Integer;
        rec,currrow,currcol:Integer;
        fio:string;
        tabno:Integer;
        devi,devo:TextFile;
        fnamei,fnameo,fnameXML:string;
        SNILS,INN:string;
        FAM,NAM,OTC:shortstring;
        summa:Double;
        summaS:string;
        SQLStmnt,S:string;
        V:Variant;
    function getXMLFileName:string;
     var retVal:string;
         ys,ms,ds:string;
         datas:string;
         currData:TDate;
         GUID:TGUID;
         GUIDS:string;
     begin
         currData:=date;
         ys:=IntToStr(YearOf(currData));
         ms:=Trim(intToStr(MonthOf(currData)));
         if Length(ms)=1 then
            ms:='0'+ms;
         ds:=Trim(IntToStr(dayOf(currData)));
         if Length(ds)=1 then
            ds:='0'+ds;
         datas:=ys+ms+ds;
         retval:='NO_PERSSVFL_9400_9403_9403007252940301001_';
         CreateGUID(GUID);
         GUIDS:=GUIDTOString(GUID);
         GUIDS:=StringReplace(GUIDS,'{','',[rfReplaceAll]);
         GUIDS:=StringReplace(GUIDS,'}','',[rfReplaceAll]);
//         retVal:=retVal+dataS+'_9A96B864-53B5-EF44-8155-5BAB9B145152';
         retVal:=retVal+dataS+'_'+GUIDS;
         getXMLFileName:=retVal;
     end;
    procedure makeHat;
     var
     fNamei:string;
     devi:textfile;
     s:string;
     ds,ms,ys,datas,periodS,yearS:string;
     currData:TDate;
     begin
          currData:=Date;
          ys:=IntToStr(YEAROF(currData));
          ms:=Trim(IntToStr(monthOf(currData)));
          ds:=Trim(IntToStr(dayOf(currData)));
          if Length(ms)=1 then
             ms:='0'+ms;
          if Length(ds)=1 then
             ds:='0'+ds;
          datas:=ds+'.'+ms+'.'+ys;
          periods:=Trim(IntToStr(Self.m));
          if Length(periods)=1 then
             periods:='0'+periods;
          years:=IntToStr(Self.y);
          fnamei:=cdir+'NO_PERSSVFL_HAT.XML';
          if not FileExists(fnamei) then
             begin
                  ShowMessage('Отсутствует файл '+fNameI);
                  Exit;
             end;
          AssignFile(devi,fnameI);
          reset(devi);
          while not Eof(devi) do
            begin
                 readln(devi,s);
                 if Pos('#',s)>0 then
                    begin
                         if Pos('#FNAMEXML',S)>0 then
                            s:=StringReplace(s,'#FNAMEXML',fnamexml,[rfReplaceAll]);
                         if Pos('#DATADOC',S)>0 then
                            s:=StringReplace(s,'#DATADOC',datas,[rfReplaceAll]);
                         if Pos('#PERIOD',S)>0 then
                            s:=StringReplace(s,'#PERIOD',periods,[rfReplaceAll]);
                         if Pos('#YEAR',S)>0 then
                            s:=StringReplace(s,'#YEAR',years,[rfReplaceAll]);
                    end;
                 Writeln(devo,s);
            end;

          CloseFile(devi);
     end;
    begin //----------------------
        fNameXML  := getXMLFileName+'.XML';
        fnameo := cdoc + fNameXML+'.XML';
        AssignFile(devo,fnameo);
        Rewrite(devo);
        MakeHat;
        dsRusPersDet.First;
        while (not dsRusPersDet.Eof) do
            begin
                 SNILS:=dsRusPersDetSNILS.Value;
                 INN:=dsRusPersDetINN.Value;
                 FAM:=dsRusPersDetFAM.Value;
                 NAM:=dsRusPersDetNAM.Value;
                 OTC:=dsRusPersDetOTC.Value;
                 SUMMA:=dsRusPersDetSUMMA.Value;
                 if (Length(Trim(NAM))<2) or
                    (Length(Trim(OTC))<2) or
                    (Length(Trim(FAM))<2) or
                    (Length(Trim(SNILS))<10) or
                    (Length(Trim(INN))<10) then
                    begin
                         dsRusPersDet.Next;
                         Continue;
                    end;
                 summas:=FormatFloatPoint(summa);
                 s:='<ПерсСвФЛ';
                 if Length(trim(inn))=12 then
                   s:=s+' ИННФЛ="'+INN+'"';
                 s:=s+' СНИЛС="'+SNILS+'" СумВыпл="'+summaS+'">';
                 s:=S+'<ФИО Фамилия="'+FAM+'" Имя="'+NAM+'" Отчество="'+OTC+'"/>';
                 S:=S+'</ПерсСвФЛ>';
                 Writeln(devo,s);
                 dsRusPersDet.Next;
            end;
        s:='</Документ></Файл>';
        Writeln(devo,s);
        CloseFile(devo);

    end;  //-----------------------

end.
