unit FormPersonoficU;
                            
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxDBTLCl, dxGrClms, dxTL,
  dxDBCtrl, dxDBGrid, dxCntner, ExtCtrls, DBCtrls, Menus, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, DBTables;

type
  TFormPersonofic = class(TForm)
    pFIBDataSetAnk: TpFIBDataSet;
    pFIBDataSetAnkTIN: TFIBStringField;
    pFIBDataSetAnkFULLN_U: TFIBStringField;
    pFIBDataSetAnkNAME_U: TFIBStringField;
    pFIBDataSetAnkFATH_U: TFIBStringField;
    pFIBDataSetAnkD_ROG: TFIBDateField;
    pFIBDataSetAnkPOL: TFIBStringField;
    pFIBDataSetAnkSHIFRID: TFIBIntegerField;
    pFIBDataSetAnkTABNO: TFIBIntegerField;
    DataSourceANK: TDataSource;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1TIN: TdxDBGridMaskColumn;
    dxDBGrid1FULLN_U: TdxDBGridMaskColumn;
    dxDBGrid1NAME_U: TdxDBGridMaskColumn;
    dxDBGrid1FATH_U: TdxDBGridMaskColumn;
    dxDBGrid1D_ROG: TdxDBGridDateColumn;
    dxDBGrid1POL: TdxDBGridMaskColumn;
    dxDBGrid1SHIFRID: TdxDBGridMaskColumn;
    dxDBGrid1TABNO: TdxDBGridMaskColumn;
    DBNavigatorANK: TDBNavigator;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    pFIBStoredProc1: TpFIBStoredProc;
    pFIBQueryAnk: TpFIBQuery;
    pFIBTransactionProc: TpFIBTransaction;
    pFIBTransactionQuery: TpFIBTransaction;
    TableANK: TTable;
    TableANKTIN: TStringField;
    TableANKFULLN_U: TStringField;
    TableANKNAME_U: TStringField;
    TableANKFATH_U: TStringField;
    TableANKD_ROG: TDateField;
    TableANKPOL: TStringField;
    TableANKD_TIN: TDateField;
    TableANKKRPOU: TStringField;
    TableANKRNPD: TFloatField;
    TableANKDFPV: TDateField;
    TableANKKOP: TStringField;
    TableANKTOZ: TStringField;
    TableInd: TTable;
    TableIndKTF: TStringField;
    TableIndTIN: TStringField;
    TableIndZVIT_R: TSmallintField;
    TableIndZVIT_P: TStringField;
    TableIndSPLAT_R: TSmallintField;
    TableIndKRPOU: TStringField;
    TableIndOTK: TStringField;
    TableIndKTSZ: TStringField;
    TableIndSVR: TFloatField;
    TableIndSVZ: TFloatField;
    TableIndSZ1: TFloatField;
    TableIndSZP1: TFloatField;
    TableIndSL1: TFloatField;
    TableIndSPD1: TFloatField;
    TableIndKD1: TSmallintField;
    TableIndSZ2: TFloatField;
    TableIndSZP2: TFloatField;
    TableIndSL2: TFloatField;
    TableIndSPD2: TFloatField;
    TableIndKD2: TSmallintField;
    TableIndSZ3: TFloatField;
    TableIndSZP3: TFloatField;
    TableIndSL3: TFloatField;
    TableIndSPD3: TFloatField;
    TableIndKD3: TSmallintField;
    TableIndSZ4: TFloatField;
    TableIndSZP4: TFloatField;
    TableIndSL4: TFloatField;
    TableIndSPD4: TFloatField;
    TableIndKD4: TSmallintField;
    TableIndSZ5: TFloatField;
    TableIndSZP5: TFloatField;
    TableIndSL5: TFloatField;
    TableIndSPD5: TFloatField;
    TableIndKD5: TSmallintField;
    TableIndSZ6: TFloatField;
    TableIndSZP6: TFloatField;
    TableIndSL6: TFloatField;
    TableIndSPD6: TFloatField;
    TableIndKD6: TSmallintField;
    TableIndSZ7: TFloatField;
    TableIndSZP7: TFloatField;
    TableIndSL7: TFloatField;
    TableIndSPD7: TFloatField;
    TableIndKD7: TSmallintField;
    TableIndSZ8: TFloatField;
    TableIndSZP8: TFloatField;
    TableIndSL8: TFloatField;
    TableIndSPD8: TFloatField;
    TableIndKD8: TSmallintField;
    TableIndSZ9: TFloatField;
    TableIndSZP9: TFloatField;
    TableIndSL9: TFloatField;
    TableIndSPD9: TFloatField;
    TableIndKD9: TSmallintField;
    TableIndSZ10: TFloatField;
    TableIndSZP10: TFloatField;
    TableIndSL10: TFloatField;
    TableIndSPD10: TFloatField;
    TableIndKD10: TSmallintField;
    TableIndSZ11: TFloatField;
    TableIndSZP11: TFloatField;
    TableIndSL11: TFloatField;
    TableIndSPD11: TFloatField;
    TableIndKD11: TSmallintField;
    TableIndSZ12: TFloatField;
    TableIndSZP12: TFloatField;
    TableIndSL12: TFloatField;
    TableIndSPD12: TFloatField;
    TableIndKD12: TSmallintField;
    TableIndSZ: TFloatField;
    TableIndSZP: TFloatField;
    TableIndSL: TFloatField;
    TableIndSP: TFloatField;
    TableIndKD: TSmallintField;
    TableIndDPR: TDateField;
    TableIndDZR: TDateField;
    TableIndKPM: TSmallintField;
    TableIndKPD: TSmallintField;
    TableIndKPLG1: TStringField;
    TableIndKMZ1: TSmallintField;
    TableIndKST1: TStringField;
    TableIndSSM1: TSmallintField;
    TableIndSSD1: TSmallintField;
    TableIndSST1: TSmallintField;
    TableIndSSG1: TSmallintField;
    TableIndSSH1: TSmallintField;
    TableIndSSZ1: TSmallintField;
    TableIndNST1: TFloatField;
    TableIndKSZ1: TStringField;
    TableIndKPLG2: TStringField;
    TableIndKMZ2: TSmallintField;
    TableIndKST2: TStringField;
    TableIndSSM2: TSmallintField;
    TableIndSSD2: TSmallintField;
    TableIndSST2: TSmallintField;
    TableIndSSG2: TSmallintField;
    TableIndSSH2: TSmallintField;
    TableIndSSZ2: TSmallintField;
    TableIndNST2: TFloatField;
    TableIndKSZ2: TStringField;
    TableIndKPLG3: TStringField;
    TableIndKMZ3: TSmallintField;
    TableIndKST3: TStringField;
    TableIndSSM3: TSmallintField;
    TableIndSSD3: TSmallintField;
    TableIndSST3: TSmallintField;
    TableIndSSG3: TSmallintField;
    TableIndSSH3: TSmallintField;
    TableIndSSZ3: TSmallintField;
    TableIndNST3: TFloatField;
    TableIndKSZ3: TStringField;
    TableIndKPLG4: TStringField;
    TableIndKMZ4: TSmallintField;
    TableIndKST4: TStringField;
    TableIndSSM4: TSmallintField;
    TableIndSSD4: TSmallintField;
    TableIndSST4: TSmallintField;
    TableIndSSG4: TSmallintField;
    TableIndSSH4: TSmallintField;
    TableIndSSZ4: TSmallintField;
    TableIndNST4: TFloatField;
    TableIndKSZ4: TStringField;
    TableIndRNPD: TFloatField;
    TableIndDFPV: TDateField;
    TableIndNPD: TFloatField;
    TableIndDFD: TDateField;
    TableIndKPFU: TStringField;
    TableIndNZV: TStringField;
    TableIndKOP: TStringField;
    TableIndTOZ: TStringField;
    DBF1: TMenuItem;
    pFIBQueryIndB: TpFIBQuery;
    N4: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure DBF1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
  private
    procedure GeneratePerson(Mode:integer);

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPersonofic: TFormPersonofic;

implementation

uses UFibModule,ScrUtil,DateUtils,FormPersPrU,UFormProgress,uFormWait;

{$R *.dfm}

procedure TFormPersonofic.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBDataSetAnk.Active then
        pFIBDataSetAnk.Active:=false;
     if pFIBDataSetAnk.Transaction.Active then
        pFIBDataSetAnk.Transaction.Commit;
     if pFIBDataSetAnk.UpdateTransaction.Active then
        pFIBDataSetAnk.UpdateTransaction.Commit;
      Action:=caFree;
end;

procedure TFormPersonofic.FormCreate(Sender: TObject);
begin
     if not pFIBDataSetAnk.Transaction.Active then
        pFIBDataSetAnk.Transaction.StartTransaction;
     if not pFIBDataSetAnk.Active then
        pFIBDataSetAnk.Active:=true;
end;

procedure TFormPersonofic.N1Click(Sender: TObject);
var Tabno,I : integer;
    Nal_Code,FIO,PIB,FAM,NAM,OTC,S:string;
    Pol:string[1];
    J,NmbOfDay:integer;
    D_Rog,BaseDate:TDate;
    y,m,d:word;
begin
     y:=1900;
     m:=1;
     d:=1;
     BaseDate:=EnCodeDate(y,m,d);
     tabno:=pFIBDataSetAnk.FieldByName('TABNO').AsInteger;
     if Tabno<=0 then
        begin
             ShowMessage('Не указан табельный номер');
        end;
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select first 1 nal_code,fio,pib from kadry where tabno='+IntToStr(Tabno));
     try
         FIB.pFIBQuery.ExecQuery;
         Nal_Code:=FIB.pFIBQuery.Fields[0].AsString;
         FIO:=FIB.pFIBQuery.Fields[1].AsString;
         PIB:=FIB.pFIBQuery.Fields[2].AsString;
     except
         ShowMessage('Ошибка запроса фамилии');
     end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     if Length(trim(Nal_code))=10 then
        begin
             pol:=copy(nal_code,9,1);
             if pos(pol,'02468')>0 then pol:='Ж'
                                   else pol:='Ч';
             S:=copy(nal_code,1,5);
             val(S,NmbOfDay,J);
             if j=0 then
                begin
                     D_Rog:=IncDay(BaseDate,NmbOfDay-1);
                end;
             pFIBDataSetAnk.Edit;
             pFIBDataSetAnk.FieldByName('TIN').AsString:=Trim(Nal_Code);
             pFIBDataSetAnk.FieldByName('POL').AsString:=POL;
             pFIBDataSetAnk.FieldByName('D_ROG').AsDateTime:=D_Rog;
             pFIBDataSetAnk.Post;
        end;
     fio:=trim(fio);
     if length(fio)>0 then
        begin
             fam:='';
             nam:='';
             otc:='';
             i:=pos(' ',Fio);
             if i>1 then
                begin
                     fam:=copy(fio,1,i-1);
                     fio:=copy(fio,i+1,length(fio));
                     fio:=trim(fio);
                     if length(fio)>0 then
                        begin
                              i:=pos(' ',fio);
                              if i=0 then i:=pos('.',fio);
                              if i=0 then i:=pos(',',fio);
                              if i=0 then nam:=fio
                                     else
                                 begin
                                      nam:=copy(fio,1,i-1);
                                      otc:=copy(fio,i+1,length(fio));
                                 end;
                        end;
                end;
        end;
     if length(fam)>0 then
        begin
             pFIBDataSetAnk.Edit;
             pFIBDataSetAnk.FieldByName('FULLN_U').AsString:=UPPER_STRING(Trim(FAM));
             pFIBDataSetAnk.FieldByName('NAME_U').AsString:=UPPER_STRING(Trim(NAM));
             pFIBDataSetAnk.FieldByName('FATH_U').AsString:=UPPER_STRING(Trim(OTC));
             pFIBDataSetAnk.Post;
        end;

     pFIBDataSetAnk.RefResh;
end;

procedure TFormPersonofic.N2Click(Sender: TObject);
var TABNO:INTEGER;
begin
     tabno:=pFIBDataSetAnk.FieldByName('TABNO').AsInteger;
     if Tabno<=0 then
        begin
             ShowMessage('Не указан табельнЫй номер');
        end;
    Application.CreateForm(TFormPersPr, FormPersPr);
    FormPersPr.WantedTabno:=tabno;
    FormPersPr.WantedFio  :=trim(pFIBDataSetAnk.FieldByName('FULLN_U').AsString)+' '+
                            trim(pFIBDataSetAnk.FieldByName('NAME_U').AsString)+' '+
                            trim(pFIBDataSetAnk.FieldByName('FATH_U').AsString);
    FormPersPr.ShifrIdAnk := pFIBDataSetAnk.FieldByName('SHIFRID').AsInteger;
    FormPersPr.ShowModal;


end;

procedure TFormPersonofic.N3Click(Sender: TObject);
label  m1;
var Tabno,Wanted_Y:integer;
    Rec:integer;
    FULLN_U,NAME_U,FATH_U,D_ROG_S,POL,NAL_CODE:string;
    I_Count,ShifrId:integer;
    Dev:TextFile;
    FName:string;
    SQLStmnt:string;
  procedure FillRecv;
    var y,d,m:word;
        D_ROG,BaseDate:TDateTime;
        S:String;
        NmbOfDay,J,i:integer;
        Fio,Fam,Nam,Otc:string;
   function ReplQuot(C:String):String;
    var i      : integer ;
        RetVal : string  ;
    begin
         FillChar(RetVal,SizeOf(RetVal),0);
         if length(AllTrim(C))=0 then RetVal:=c
                                 else
            begin
                 for i:=1 to length(C) do
                     begin
                           if ord(c[i])<ord(' ') then continue;
                           if c[i]<>'''' then RetVal:=RetVal+c[i]
                                         else
                              begin
                                   RetVal:=RetVal+c[i];
                                   RetVal:=RetVal+c[i];
                              end;
                     end;
            end;
        ReplQuot:=RetVal;
    end;
    begin
         FULLN_U  := 'Не найден';
         NAME_U   := '';
         FATH_U   := '';
         D_ROG_S  := '';
         POL      := 'Ч';
         NAL_CODE := '';
         y:=1900;
         m:=1;
         d:=1;
         BaseDate:=EnCodeDate(y,m,d);
         if pFIBQueryAnk.Open then
            pFIBQueryAnk.Close;
         pFIBQueryAnk.SQL.Clear;
         pFIBQueryAnk.SQL.Add('select first 1 nal_code,fio from kadry where tabno='+IntToStr(Tabno));
         try
            pFIBQueryAnk.ExecQuery;
            Nal_Code:=pFIBQueryAnk.Fields[0].AsString;
            FIO:=pFIBQueryAnk.Fields[1].AsString;
         except
            ShowMessage('Ошибка запроса фамилии');
         end;
         if Length(trim(Nal_code))=10 then
            begin
                pol:=copy(nal_code,9,1);
                if pos(pol,'02468')>0 then pol:='Ж'
                                      else pol:='Ч';
                S:=copy(nal_code,1,5);
                val(S,NmbOfDay,J);
                if j=0 then
                   begin
                        D_Rog:=IncDay(BaseDate,NmbOfDay-1);
                        DecodeDate(D_Rog,y,m,d);
                        d_rog_s:=IntToStr(y)+'-'+IntToStr(m)+'-'+IntToStr(d);
                   end;
        end;
     fio:=trim(fio);
     if length(fio)>0 then
        begin
             fam:='';
             nam:='';
             otc:='';
             i:=pos(' ',Fio);
             if i>1 then
                begin
                     fam:=copy(fio,1,i-1);
                     fio:=copy(fio,i+1,length(fio));
                     fio:=trim(fio);
                     if length(fio)>0 then
                        begin
                              i:=pos(' ',fio);
                              if i=0 then i:=pos('.',fio);
                              if i=0 then i:=pos(',',fio);
                              if i=0 then nam:=fio
                                     else
                                 begin
                                      nam:=copy(fio,1,i-1);
                                      otc:=copy(fio,i+1,length(fio));
                                 end;
                        end;
                end;
        end;
     if length(Trim(Fam))>0 then FULLN_U:=ReplQuot(UPPER_STRING(fam));
     if length(Trim(Nam))>0 then NAME_U:=ReplQuot(UPPER_STRING(Nam));
     if length(Trim(Otc))>0 then FATH_U:=ReplQuot(UPPER_STRING(Otc));
    end;
begin  {TFormPersonofic.N3Click(Sender: TObject);}
     GeneratePerson(1);
     if not pFIBDataSetAnk.Active then
        pFIBDataSetAnk.Open;
     Exit;
     FName:='TestP.txt';
     Wanted_Y:=2009;
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     FIB.pFIBQuery.SQL.Clear;
//     SQLStmnt:='select count(distinct tabno) from fadd where year_za='+IntToStr(Wanted_Y)+' and year_vy in ('+IntToStr(Wanted_Y)+','+IntToStr(Wanted_Y+1)+')'
 //  Убрать то что ниже это в январе 2010 за 2009
     SQLStmnt:='select count(distinct p.tabno) from person p ';
     SQLStmnt:=Trim(SQLStmnt)+' where p.yearvy=2010 and p.monthvy=1 and';
     SQLStmnt:=Trim(SQLStmnt)+' exists (select * from fadd a';
     SQLStmnt:=Trim(SQLStmnt)+' where a.shifridperson=p.shifrid and ';
     SQLStmnt:=Trim(SQLStmnt)+' a.year_za=2009)';
//     SQLStmnt:=Trim(SQLStmnt)+' group by 1';
     FIB.pFIBQuery.SQL.Add(SQLStmnt);

     try
         FormWait.Show;
         Application.ProcessMessages;
         FIB.pFIBQuery.ExecQuery;
         FormWait.Hide;
         Rec:=FIB.pFIBQuery.Fields[0].AsInteger;
     except
         ShowMessage('Ошибка запроса количества записей');
         FIB.pFIBQuery.Transaction.Commit;
         Exit;
     end;

     FIB.pFIBQuery.Close;
     FIB.pFIBQuery.SQL.Clear;
//     FIB.pFIBQuery.SQL.Add('select tabno from fadd where year_za='+IntToStr(Wanted_Y)+' and year_vy in ('+IntToStr(Wanted_Y)+','+IntToStr(Wanted_Y+1)+') group by 1');
     SQLStmnt:='select p.tabno from person p ';
     SQLStmnt:=Trim(SQLStmnt)+' where p.yearvy=2010 and p.monthvy=1 and';
     SQLStmnt:=Trim(SQLStmnt)+' exists (select * from fadd a';
     SQLStmnt:=Trim(SQLStmnt)+' where a.shifridperson=p.shifrid and ';
     SQLStmnt:=Trim(SQLStmnt)+' a.year_za=2009)';
     SQLStmnt:=Trim(SQLStmnt)+' group by 1';
     FIB.pFIBQuery.SQL.Add(SQLStmnt);
     try
         FIB.pFIBQuery.ExecQuery;
         Application.CreateForm(TFormProgress, FormProgress);
         FormProgress.Gauge.MinValue:=0;
         FormProgress.Gauge.MaxValue:=Rec;
         FormProgress.Gauge.Progress:=0;
         FormProgress.LabelHeader.Caption:='';
         FormProgress.LabelFooter.Caption:='';
         FormProgress.Caption:='Генерация данных по персонофикации всех сотрудников';
         FormProgress.Show;
         I_COUNT:=0;
         while not  FIB.pFIBQuery.Eof do
           begin
                Tabno:=FIB.pFIBQuery.Fields[0].AsInteger;
{
                if Tabno>=610 then
                   Tabno:=tabno
                else
                   goto m1;
}
                if not pFIBStoredProc1.Transaction.Active then
                       pFIBStoredProc1.Transaction.StartTransaction;
                pFIBStoredProc1.Params[0].AsInteger:=Tabno;
                pFIBStoredProc1.Params[1].AsInteger:=Wanted_Y;
                pFIBStoredProc1.Prepare;
                try
                   pFIBStoredProc1.ExecProc;
                except
                   ShowMessage('Ошибка процедуры заполнения персонофикации');
                   if pFIBStoredProc1.Transaction.Active then
                      pFIBStoredProc1.Transaction.Rollback;
                   Exit;
                end;
                if pFIBStoredProc1.Transaction.Active then
                   pFIBStoredProc1.Transaction.Commit;

                if not pFIBQueryAnk.Transaction.Active then
                   pFIBQueryAnk.Transaction.StartTransaction;
                if pFIBQueryAnk.Open then
                   pFIBQueryAnk.Close;
                pFIBQueryAnk.SQL.Clear;
                pFIBQueryAnk.SQL.Add('select first 1 shifrid from tb_apm_ank where tabno='+IntToStr(Tabno));
                try
                   pFIBQueryAnk.ExecQuery;
                   ShifrId:=pFIBQueryAnk.Fields[0].AsInteger;
                except
                   ShowMessage('Ошибка запроса записи для фамилии');
                   pFIBQueryAnk.Transaction.Commit;
                   Exit;
                end;
                FillRecv;
                if length(trim(D_Rog_s))=0 then
                   D_Rog_s:='1900-01-01';

//                AssignFile(DEV,FName);
//                ReWrite(Dev);
//                Writeln(Dev,' Tabno=',Tabno:8,' I_COUNT=',I_Count:8);
//                CloseFile(Dev);
                if Tabno=8890 then
                   Tabno:=8890;

                if pFIBQueryAnk.Open then
                   pFIBQueryAnk.Close;
                pFIBQueryANK.SQL.Clear;
                pFIBQueryAnk.SQL.Add('update tb_apm_ank set ');
                pFIBQueryAnk.SQL.Add('FULLN_U='''+Trim(FULLN_U)+''',');
                pFIBQueryAnk.SQL.Add('NAME_U='''+Trim(NAME_U)+''',');
                pFIBQueryAnk.SQL.Add('FATH_U='''+Trim(FATH_U)+''',');
                pFIBQueryAnk.SQL.Add('D_ROG='''+TRIM(D_ROG_S)+''',');
                pFIBQueryAnk.SQL.Add('TIN='''+TRIM(NAL_CODE)+''',');
                pFIBQueryAnk.SQL.Add('POL='''+TRIM(POL)+'''');
                pFIBQueryAnk.SQL.Add(' where shifrid='+IntToStr(ShifrId));
                try
                   pFIBQueryAnk.ExecQuery;
                except
                   ShowMessage('Ошибка записи для фамилии');
                   pFIBQueryAnk.Transaction.Commit;
                   Exit;
                end;
                if pFIBQueryAnk.Transaction.Active then
                   pFIBQueryAnk.Transaction.Commit;
m1:                Inc(I_Count);
                FormProgress.Gauge.Progress:=I_COUNT;
                FormProgress.LabelHeader.Caption:=IntToStr(I_Count)+' / '+IntToStr(Rec);
                FormProgress.LabelFooter.Caption:=Trim(FULLN_U);
                FormProgress.RePaint;
                Application.ProcessMessages;
                FIB.pFIBQuery.Next;
         end;
        FormProgress.Free;
     except
         ShowMessage('Ошибка запроса фамилии');
     end;

end;

procedure TFormPersonofic.DBF1Click(Sender: TObject);
const sz:array[1..12] of string=('sz1','sz2','sz3','sz4','sz5','sz6','sz7','sz8','sz9','sz10','sz11','sz12');
const szp:array[1..12] of string=('szp1','szp2','szp3','szp4','szp5','szp6','szp7','szp8','szp9','szp10','szp11','szp12');
const sl:array[1..12] of string=('sl1','sl2','sl3','sl4','sl5','sl6','sl7','sl8','sl9','sl10','sl11','sl12');
const spd:array[1..12] of string=('spd1','spd2','spd3','spd4','spd5','spd6','spd7','spd8','spd9','spd10','spd11','spd12');
const kd:array[1..12] of string=('kd1','kd2','kd3','kd4','kd5','kd6','kd7','kd8','kd9','kd10','kd11','kd12');
const kplg:array[1..4] of string=('kplg1','kplg2','kplg3','kplg4');
const kmz:array[1..4] of string=('kmz1','kmz2','kmz3','kmz4');
const kst:array[1..4] of string=('kst1','kst2','kst3','kst4');
const ssm:array[1..4] of string=('ssm1','ssm2','ssm3','ssm4');
const ssd:array[1..4] of string=('ssd1','ssd2','ssd3','ssd4');
const sst:array[1..4] of string=('sst1','sst2','sst3','sst4');
const ssg:array[1..4] of string=('ssg1','ssg2','ssg3','ssg4');
const ssh:array[1..4] of string=('ssh1','ssh2','ssh3','ssh4');
const ssz:array[1..4] of string=('ssz1','ssz2','ssz3','ssz4');
const nst:array[1..4] of string=('nst1','nst2','nst3','nst4');
const ksz:array[1..4] of string=('ksz1','ksz2','ksz3','ksz4');
var Rec,I_Count,i_Row,Period:Integer;
    KPLGS,FULLN_U,NAME_U,FATH_U:string;
begin
     I_Count:=0;
     TableAnk.Active:=TRUE;
     TableInd.Active:=TRUE;
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     if not pFIBQueryAnk.Transaction.Active then
        pFIBQueryAnk.Transaction.StartTransaction;
     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select count(*) from tb_apm_ank');
     try
         FIB.pFIBQuery.ExecQuery;
         Rec:=FIB.pFIBQuery.Fields[0].AsInteger;
     except
         ShowMessage('Ошибка запроса количества анкет');
         FIB.pFIBQuery.Transaction.Commit;
         Exit;
     end;
     FIB.pFIBQuery.Close;

     FIB.pFIBQuery.SQL.Clear;
     FIB.pFIBQuery.SQL.Add('select TIN,FULLN_U,NAME_U,FATH_U,D_ROG,POL,D_TIN,KRPOU,RNPD,DFPV,KOP,TOZ,SHIFRID,TABNO from TB_APM_ANK where ltrim(rtrim(Tin))>''0''');
     try
         FIB.pFIBQuery.ExecQuery;
         Application.CreateForm(TFormProgress, FormProgress);
         FormProgress.Gauge.MinValue:=0;
         FormProgress.Gauge.MaxValue:=Rec;
         FormProgress.Gauge.Progress:=0;
         FormProgress.LabelHeader.Caption:='';
         FormProgress.LabelFooter.Caption:='';
         FormProgress.Caption:='Сохранение данных в DBF';
         FormProgress.Show;
         I_Count:=0;
         while not FIB.pFIBQuery.Eof do
          begin
               TableAnk.Insert;
               FULLN_U:=Upper_String(FIB.pFIBQuery.FieldByName('FULLN_U').AsString);
               FULLN_U:=ReplChar(FULLN_U,'Ы','И');
               FULLN_U:=ReplChar(FULLN_U,'Э','Е');
               FULLN_U:=ReplChar(FULLN_U,'"','''');
               NAME_U:=Upper_String(FIB.pFIBQuery.FieldByName('NAME_U').AsString);
               NAME_U:=ReplChar(NAME_U,'Ы','И');
               NAME_U:=ReplChar(NAME_U,'Э','Е');
               NAME_U:=ReplChar(NAME_U,'"','''');
               FATH_U:=Upper_String(FIB.pFIBQuery.FieldByName('FATH_U').AsString);
               FATH_U:=ReplChar(FATH_U,'Ы','И');
               FATH_U:=ReplChar(FATH_U,'Э','Е');
               FATH_U:=ReplChar(FATH_U,'"','''');
               TableAnk.FieldByName('TIN').AsString:=FIB.pFIBQuery.FieldByName('TIN').AsString;
               TableAnk.FieldByName('FULLN_U').AsString:=WinToDos(FULLN_U);
               TableAnk.FieldByName('NAME_U').AsString:=WinToDos(NAME_U);
               TableAnk.FieldByName('FATH_U').AsString:=WinToDos(FATH_U);
               TableAnk.FieldByName('D_ROG').AsDateTime:=FIB.pFIBQuery.FieldByName('D_ROG').AsDate;
               TableAnk.FieldByName('POL').AsString:=WinToDos(FIB.pFIBQuery.FieldByName('POL').AsString);
               TableAnk.FieldByName('D_TIN').AsDateTime:=FIB.pFIBQuery.FieldByName('D_TIN').AsDate;
               TableAnk.FieldByName('KRPOU').AsString:=FIB.pFIBQuery.FieldByName('KRPOU').AsString;
               TableAnk.FieldByName('RNPD').AsInteger:=FIB.pFIBQuery.FieldByName('RNPD').AsInteger;
 //              TableAnk.FieldByName('DFPV').AsDateTime:=FIB.pFIBQuery.FieldByName('DFPV').AsDate;
               TableAnk.FieldByName('KOP').AsString:=FIB.pFIBQuery.FieldByName('KOP').AsString;
               TableAnk.FieldByName('TOZ').AsString:=FIB.pFIBQuery.FieldByName('TOZ').AsString;
               TableAnk.Post;
               Inc(I_Count);
               FormProgress.Gauge.Progress:=I_COUNT;
               FormProgress.LabelHeader.Caption:=IntToStr(I_Count)+' / '+IntToStr(Rec);
               FormProgress.LabelFooter.Caption:=Trim(FIB.pFIBQuery.FieldByName('FULLN_U').AsString);
               FormProgress.RePaint;
               Application.ProcessMessages;
            { -----------------------------  }
               if (FIB.pFIBQuery.FieldByName('TABNO').AsInteger=5010) then
                   I_Row:=I_Row;
               pFIBQueryAnk.SQL.Clear;
               pFIBQueryAnk.SQL.Add('select SHIFRID,SHIFRIDANK,KTF,TIN,ZVIT_R,');
               pFIBQueryAnk.SQL.Add('ZVIT_P ,SPLAT_R,KRPOU,OTK,KTSZ,');
               pFIBQueryAnk.SQL.Add('SVR,SVZ,SZ,SZP,SL,');
               pFIBQueryAnk.SQL.Add('SP,KD,DPR,DZR,KPM,');
               pFIBQueryAnk.SQL.Add('KPD,RNPD,DFPV,NPD,DFD,');
               pFIBQueryAnk.SQL.Add('KPFU,NZV,KOP,TOZ,ISPENSIONER,');
               pFIBQueryAnk.SQL.Add('ISINVALID from TB_APM_IND ');
               pFIBQueryAnk.SQL.Add(' where shifridank='+IntToStr(FIB.pFIBQuery.FieldByName('ShifrId').AsInteger));
               try
                  pFIBQueryAnk.ExecQuery;
                  while not pFIBQueryAnk.Eof do
                    begin
                         TableInd.Insert;
                         TableInd.FieldByName('TIN').AsString      := FIB.pFIBQuery.FieldByName('TIN').AsString;
                         TableInd.FieldByName('KTF').AsString      := pFIBQueryAnk.FieldByName('KTF').AsString;
                         TableInd.FieldByName('ZVIT_R').AsInteger  := pFIBQueryAnk.FieldByName('ZVIT_R').AsInteger;
                         TableInd.FieldByName('ZVIT_P').AsString   := pFIBQueryAnk.FieldByName('ZVIT_P').AsString;
                         TableInd.FieldByName('SPLAT_R').AsInteger := pFIBQueryAnk.FieldByName('SPLAT_R').AsInteger;
                         TableInd.FieldByName('KRPOU').AsString    := pFIBQueryAnk.FieldByName('KRPOU').AsString;
                         TableInd.FieldByName('OTK').AsString      := pFIBQueryAnk.FieldByName('OTK').AsString;
                         TableInd.FieldByName('KTSZ').AsString     := pFIBQueryAnk.FieldByName('KTSZ').AsString;
                         TableInd.FieldByName('SVR').AsFloat       := pFIBQueryAnk.FieldByName('SVR').AsFloat;
                         TableInd.FieldByName('SVZ').AsFloat       := pFIBQueryAnk.FieldByName('SVZ').AsFloat;
                         TableInd.FieldByName('SZ').AsFloat        := pFIBQueryAnk.FieldByName('SZ').AsFloat;
                         TableInd.FieldByName('SZP').AsFloat       := pFIBQueryAnk.FieldByName('SZP').AsFloat;
                         TableInd.FieldByName('SL').AsFloat        := pFIBQueryAnk.FieldByName('SL').AsFloat;
                         TableInd.FieldByName('SP').AsFloat        := pFIBQueryAnk.FieldByName('SP').AsFloat;
                         TableInd.FieldByName('KD').AsInteger      := pFIBQueryAnk.FieldByName('KD').AsInteger;
                         TableInd.FieldByName('DPR').AsDateTime    := pFIBQueryAnk.FieldByName('DPR').AsDate;
                         TableInd.FieldByName('DZR').AsDateTime    := pFIBQueryAnk.FieldByName('DZR').AsDate;
                         TableInd.FieldByName('KPM').AsInteger     := pFIBQueryAnk.FieldByName('KPM').AsInteger;
                         TableInd.FieldByName('KPD').AsInteger     := pFIBQueryAnk.FieldByName('KPD').AsInteger;
                         TableInd.FieldByName('RNPD').AsInteger    := pFIBQueryAnk.FieldByName('RNPD').AsInteger;
  //                       TableInd.FieldByName('DFPV').AsDateTime   := pFIBQueryAnk.FieldByName('DFPV').AsDate;
                         TableInd.FieldByName('NPD').AsInteger     := pFIBQueryAnk.FieldByName('NPD').AsInteger;
                         TableInd.FieldByName('DFD').AsDateTime    := pFIBQueryAnk.FieldByName('DFD').AsDate;
                         TableInd.FieldByName('KPFU').AsString     := pFIBQueryAnk.FieldByName('KPFU').AsString;
                         TableInd.FieldByName('NZV').AsString      := pFIBQueryAnk.FieldByName('NZV').AsString;
                         TableInd.FieldByName('KOP').AsString      := pFIBQueryAnk.FieldByName('KOP').AsString;
                         TableInd.FieldByName('TOZ').AsString      := pFIBQueryAnk.FieldByName('TOZ').AsString;

                         if pFIBQueryIndB.Open then
                            pFIBQueryIndB.Close;
                         pFIBQueryIndB.SQL.Clear;
                         pFIBQueryIndB.SQL.Add('select SHIFRID,SHIFRIDIND,SZ,SZP,SL,SPD,KD,PERIOD,ISPENSIONER,ISINVALID from tb_apm_ind_body where shifridind='+IntToStr(pFIBQueryAnk.FieldByName('SHIFRID').AsInteger));
                         try
                             pFIBQueryIndB.ExecQuery;
                             I_Row:=0;
                             while not pFIBQueryIndB.Eof do
                              begin
                                   Inc(I_Row);
                                   if (I_Row>12) then break;
                                   period:=pFIBQueryIndB.FieldByName('PERIOD').AsInteger;
                                   if ((Period<1) or (Period>12)) then
                                      ShowMessage('Неверный период в BODY'+IntToStr(Period));

                                   if (pFIBQueryIndB.FieldByName('SZ').AsFloat>0.01) or
                                      (pFIBQueryIndB.FieldByName('SZP').AsFloat>0.01) or
                                      (pFIBQueryIndB.FieldByName('SL').AsFloat>0.01) or
                                      (pFIBQueryIndB.FieldByName('SPD').AsFloat>0.01) then
                                     begin
                                   TableInd.FieldByName(sz[Period]).AsFloat    := pFIBQueryIndB.FieldByName('SZ').AsFloat;
                                   TableInd.FieldByName(szp[Period]).AsFloat   := pFIBQueryIndB.FieldByName('SZP').AsFloat;
                                   TableInd.FieldByName(sl[Period]).AsFloat    := pFIBQueryIndB.FieldByName('SL').AsFloat;
                                   TableInd.FieldByName(spd[Period]).AsFloat   := pFIBQueryIndB.FieldByName('SPD').AsFloat;
                                   TableInd.FieldByName(kd[Period]).AsInteger  := pFIBQueryIndB.FieldByName('KD').AsInteger;
                                     end;
                                   pFIBQueryIndB.Next;
                              end
                         except
                               ShowMessage('Ошибка запроса сумм по сотруднику '+FIB.pFIBQuery.FieldByName('FULLN_U').AsString);
                               pFIBQueryIndB.Transaction.Commit;
                               Exit;
                         end;

                         pFIBQueryIndB.Close;
                         pFIBQueryIndB.SQL.Clear;
                         pFIBQueryIndB.SQL.Add('select SHIFRID,SHIFRIDIND,KPLG,KMZ,KSL,SSM,SSD,SST,SSG,SSH,SSZ,NSL,KSZ from tb_apm_ind_ss where shifridind='+IntToStr(pFIBQueryAnk.FieldByName('SHIFRID').AsInteger));
                         try
                             pFIBQueryIndB.ExecQuery;
                             I_Row:=0;
                             while not pFIBQueryIndB.Eof do
                              begin
                                   Inc(I_Row);
                                   if (I_Row>4) then break;
                                   KPLGS:=Trim(pFIBQueryIndB.FieldByName('KPLG').AsString);
          //                         KPLGS:=WinToDos(KPLGS);
                                   TableInd.FieldByName(kplg[i_row]).AsString := TRIM(KPLGS);
                                   TableInd.FieldByName(kmz[i_row]).AsFloat   := pFIBQueryIndB.FieldByName('KMZ').AsFloat;
                                   TableInd.FieldByName(kst[i_row]).AsString  := pFIBQueryIndB.FieldByName('KSL').AsSTring;
                                   TableInd.FieldByName(ssm[i_row]).AsFloat   := pFIBQueryIndB.FieldByName('SSM').AsFloat;
                                   TableInd.FieldByName(ssd[i_row]).AsFloat   := pFIBQueryIndB.FieldByName('SSD').AsFloat;
                                   TableInd.FieldByName(sst[i_row]).AsFloat   := pFIBQueryIndB.FieldByName('SST').AsFloat;
                                   TableInd.FieldByName(ssg[i_row]).AsFloat   := pFIBQueryIndB.FieldByName('SSG').AsFloat;
                                   TableInd.FieldByName(ssh[i_row]).AsFloat   := pFIBQueryIndB.FieldByName('SSH').AsFloat;
                                   TableInd.FieldByName(ssz[i_row]).AsFloat   := pFIBQueryIndB.FieldByName('SSZ').AsFloat;
                                   TableInd.FieldByName(nst[i_row]).AsFloat   := pFIBQueryIndB.FieldByName('NSL').AsFloat;
                                   TableInd.FieldByName(ksz[i_row]).AsSTring  := pFIBQueryIndB.FieldByName('KSZ').AsString;
                                   pFIBQueryIndB.Next;
                              end
                         except
                               ShowMessage('Ошибка запроса сумм льгот по сотруднику '+FIB.pFIBQuery.FieldByName('FULLN_U').AsString);
                               pFIBQueryIndB.Transaction.Commit;
                               Exit;
                         end;




                         pFIBQueryIndB.Close;
                         if (abs(TableInd.FieldByName('SZ').AsFloat)<0.01) then
                            TableInd.Cancel
                         else
                            TableInd.Post;
                         pFIBQueryAnk.Next;
                    end;
               except
                 ShowMessage('Ошибка запроса данных по сотруднику '+FIB.pFIBQuery.FieldByName('FULLN_U').AsString);
                 pFIBQueryAnk.Transaction.Commit;
                 Exit;
               end;
               pFIBQueryAnk.Close;



            { ------------------------------ }
               FIB.pFIBQuery.Next;
          end;
     except
         ShowMessage('Ошибка запроса организации цикла просмотра анкет');
         FIB.pFIBQuery.Transaction.Commit;
         Exit;
     end;

     FIB.pFIBQuery.Close;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.Commit;
     pFIBQueryAnk.Close;
     if pFIBQueryAnk.Transaction.Active then
        pFIBQueryAnk.Transaction.Commit;

     TableAnk.Active:=FALSE;
     TableInd.Active:=FALSE;
end;

procedure TFormPersonofic.GeneratePerson(Mode:integer);
{ Mode=1 - все
  Mode=2 - заданный
}
label  m1;
var Tabno,Wanted_Y:integer;
    Rec:integer;
    FULLN_U,NAME_U,FATH_U,D_ROG_S,POL,NAL_CODE:string;
    I_Count,ShifrId:integer;
    Dev:TextFile;
    FName:string;
    SQLText:string;
    SQLStmnt:string;
  procedure FillRecv;
    var y,d,m:word;
        D_ROG,BaseDate:TDateTime;
        S:String;
        NmbOfDay,J,i:integer;
        Fio,Fam,Nam,Otc:string;
   function ReplQuot(C:String):String;
    var i      : integer ;
        RetVal : string  ;
    begin
         FillChar(RetVal,SizeOf(RetVal),0);
         if length(AllTrim(C))=0 then RetVal:=c
                                 else
            begin
                 for i:=1 to length(C) do
                     begin
                           if ord(c[i])<ord(' ') then continue;
                           if c[i]<>'''' then RetVal:=RetVal+c[i]
                                         else
                              begin
                                   RetVal:=RetVal+c[i];
                                   RetVal:=RetVal+c[i];
                              end;
                     end;
            end;
        ReplQuot:=RetVal;
    end;
    begin
         FULLN_U  := 'Не найден';
         NAME_U   := '';
         FATH_U   := '';
         D_ROG_S  := '';
         POL      := 'Ч';
         NAL_CODE := '';
         y:=1900;
         m:=1;
         d:=1;
         BaseDate:=EnCodeDate(y,m,d);
         if pFIBQueryAnk.Open then
            pFIBQueryAnk.Close;
         pFIBQueryAnk.SQL.Clear;
         pFIBQueryAnk.SQL.Add('select first 1 nal_code,fio from kadry where tabno='+IntToStr(Tabno));
         try
            pFIBQueryAnk.ExecQuery;
            Nal_Code:=pFIBQueryAnk.Fields[0].AsString;
            FIO:=pFIBQueryAnk.Fields[1].AsString;
         except
            ShowMessage('Ошибка запроса фамилии');
         end;
         if Length(trim(Nal_code))=10 then
            begin
                pol:=copy(nal_code,9,1);
                if pos(pol,'02468')>0 then pol:='Ж'
                                      else pol:='Ч';
                S:=copy(nal_code,1,5);
                val(S,NmbOfDay,J);
                if j=0 then
                   begin
                        D_Rog:=IncDay(BaseDate,NmbOfDay-1);
                        DecodeDate(D_Rog,y,m,d);
                        d_rog_s:=IntToStr(y)+'-'+IntToStr(m)+'-'+IntToStr(d);
                   end;
        end;
     fio:=trim(fio);
     if length(fio)>0 then
        begin
             fam:='';
             nam:='';
             otc:='';
             i:=pos(' ',Fio);
             if i>1 then
                begin
                     fam:=copy(fio,1,i-1);
                     fio:=copy(fio,i+1,length(fio));
                     fio:=trim(fio);
                     if length(fio)>0 then
                        begin
                              i:=pos(' ',fio);
                              if i=0 then i:=pos('.',fio);
                              if i=0 then i:=pos(',',fio);
                              if i=0 then nam:=fio
                                     else
                                 begin
                                      nam:=copy(fio,1,i-1);
                                      otc:=copy(fio,i+1,length(fio));
                                 end;
                        end;
                end;
        end;
     if length(Trim(Fam))>0 then FULLN_U:=ReplQuot(UPPER_STRING(fam));
     if length(Trim(Nam))>0 then NAME_U:=ReplQuot(UPPER_STRING(Nam));
     if length(Trim(Otc))>0 then FATH_U:=ReplQuot(UPPER_STRING(Otc));
     if length(FULLN_U)>30  then FULLN_U:=copy(FULLN_U,1,30);
     if length(NAME_U)>15   then NAME_U:=copy(NAME_U,1,15);
     if length(FATH_U)>20   then FATH_U:=copy(FATH_U,1,20);
    end;
begin  {TFormPersonofic.N3Click(Sender: TObject);}
     FName:='TestP.txt';
     Wanted_Y:=2009;
     if Mode=2 then
        begin
             Tabno:=pFIBDataSetAnk.FieldByName('TABNO').AsInteger;
             if ((Tabno<1) or (Tabno>10000)) then
                begin
                     ShowMessage('Неверный табельный номер сотрудника');
                     Exit;
                end;

        end;
     if not FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.StartTransaction;
     if Mode=1 then
        begin
             FIB.pFIBQuery.SQL.Clear;
//             FIB.pFIBQuery.SQL.Add('select count(distinct tabno) from fadd where year_za='+IntToStr(Wanted_Y)+' and year_vy in ('+IntToStr(Wanted_Y)+','+IntToStr(Wanted_Y+1)+')');
             SQLStmnt:='select count(distinct p.tabno) from person p ';
             SQLStmnt:=Trim(SQLStmnt)+' where p.yearvy=2010 and p.monthvy=1 and';
             SQLStmnt:=Trim(SQLStmnt)+' exists (select * from fadd a';
             SQLStmnt:=Trim(SQLStmnt)+' where a.shifridperson=p.shifrid and ';
             SQLStmnt:=Trim(SQLStmnt)+' a.year_za=2009)';
//             SQLStmnt:=Trim(SQLStmnt)+' group by 1';

             FIB.pFIBQuery.SQL.Add(SQLStmnt);
             try
                FormWait.Show;
                Application.ProcessMessages;
                FIB.pFIBQuery.ExecQuery;
                FormWait.Hide;
                Rec:=FIB.pFIBQuery.Fields[0].AsInteger;
             except
                ShowMessage('Ошибка запроса количества записей');
                FIB.pFIBQuery.Transaction.Commit;
                Exit;
             end;
             FIB.pFIBQuery.Close;
        end;
     FIB.pFIBQuery.SQL.Clear;
     if mode=1 then
        begin
//        FIB.pFIBQuery.SQL.Add('select tabno from fadd where year_za='+IntToStr(Wanted_Y)+' and year_vy in ('+IntToStr(Wanted_Y)+','+IntToStr(Wanted_Y+1)+') group by 1')
        SQLStmnt:='select p.tabno from person p ';
        SQLStmnt:=Trim(SQLStmnt)+' where p.yearvy=2010 and p.monthvy=1 and';
        SQLStmnt:=Trim(SQLStmnt)+' exists (select * from fadd a';
        SQLStmnt:=Trim(SQLStmnt)+' where a.shifridperson=p.shifrid and ';
        SQLStmnt:=Trim(SQLStmnt)+' a.year_za=2009)';
        SQLStmnt:=Trim(SQLStmnt)+' group by 1';
        FIB.pFIBQuery.SQL.Add(SQLStmnt);
        end
     else
        FIB.pFIBQuery.SQL.Add('select tabno from fadd where tabno='+IntToStr(Tabno)+'and  year_za='+IntToStr(Wanted_Y)+' and year_vy in ('+IntToStr(Wanted_Y)+','+IntToStr(Wanted_Y+1)+') group by 1');
     try
         FIB.pFIBQuery.ExecQuery;
         Application.CreateForm(TFormProgress, FormProgress);
         FormProgress.Gauge.MinValue:=0;
         FormProgress.Gauge.MaxValue:=Rec;
         FormProgress.Gauge.Progress:=0;
         FormProgress.LabelHeader.Caption:='';
         FormProgress.LabelFooter.Caption:='';
         FormProgress.Caption:='Генерация данных по персонофикации всех сотрудников';
         FormProgress.Show;
         I_COUNT:=0;
         while not  FIB.pFIBQuery.Eof do
           begin
                Tabno:=FIB.pFIBQuery.Fields[0].AsInteger;
{
                if Tabno=9537 then
                   Tabno:=tabno
                else
                   goto m1;
}

                AssignFile(DEV,'TesrP1.txt');
                ReWrite(Dev);
                Writeln(Dev,' Tabno=',Tabno:8,' I_COUNT=',I_Count:8);
                CloseFile(Dev);

                if not pFIBStoredProc1.Transaction.Active then
                       pFIBStoredProc1.Transaction.StartTransaction;
                pFIBStoredProc1.Params[0].AsInteger:=Tabno;
                pFIBStoredProc1.Params[1].AsInteger:=Wanted_Y;
                pFIBStoredProc1.Prepare;
                try
                   pFIBStoredProc1.ExecProc;
                except
                   ShowMessage('Ошибка процедуры заполнения персонофикации');
                   if pFIBStoredProc1.Transaction.Active then
                      pFIBStoredProc1.Transaction.Rollback;
                   Exit;
                end;
                if pFIBStoredProc1.Transaction.Active then
                   pFIBStoredProc1.Transaction.Commit;

                if not pFIBQueryAnk.Transaction.Active then
                   pFIBQueryAnk.Transaction.StartTransaction;
                if pFIBQueryAnk.Open then
                   pFIBQueryAnk.Close;
                pFIBQueryAnk.SQL.Clear;
                pFIBQueryAnk.SQL.Add('select first 1 shifrid from tb_apm_ank where tabno='+IntToStr(Tabno));
                try
                   pFIBQueryAnk.ExecQuery;
                   ShifrId:=pFIBQueryAnk.Fields[0].AsInteger;
                except
                   ShowMessage('Ошибка запроса записи для фамилии');
                   pFIBQueryAnk.Transaction.Commit;
                   Exit;
                end;
                FillRecv;
                if length(trim(D_Rog_s))=0 then
                   D_Rog_s:='1900-01-01';

                AssignFile(DEV,FName);
                ReWrite(Dev);
                Writeln(Dev,' Tabno=',Tabno:8,' I_COUNT=',I_Count:8);
                CloseFile(Dev);
                if Tabno=8890 then
                   Tabno:=8890;

                if pFIBQueryAnk.Open then
                   pFIBQueryAnk.Close;
                pFIBQueryANK.SQL.Clear;
                SQLText:='update tb_apm_ank set ';
                SQLText:=SQLText+'FULLN_U='''+Trim(FULLN_U)+''',';
                SQLText:=SQLText+'NAME_U='''+Trim(NAME_U)+''',';
                SQLText:=SQLText+'FATH_U='''+Trim(FATH_U)+''',';
                SQLText:=SQLText+'D_ROG='''+TRIM(D_ROG_S)+''',';
                SQLText:=SQLText+'TIN='''+TRIM(NAL_CODE)+''',';
                SQLText:=SQLText+'POL='''+TRIM(POL)+'''';
                SQLText:=SQLText+' where shifrid='+IntToStr(ShifrId);
{
                if Tabno=9537 then
                   Tabno:=Tabno;
}
                pFIBQueryAnk.SQL.Add(SQLText);
                try
                   pFIBQueryAnk.ExecQuery;
                except
                   ShowMessage('Ошибка записи для фамилии');
                   pFIBQueryAnk.Transaction.Commit;
                   Exit;
                end;

                AssignFile(DEV,'TestP2.txt');
                ReWrite(Dev);
                Writeln(Dev,' Tabno=',Tabno:8,' I_COUNT=',I_Count:8);
                CloseFile(Dev);

                if pFIBQueryAnk.Transaction.Active then
                   pFIBQueryAnk.Transaction.Commit;
m1:                Inc(I_Count);
                FormProgress.Gauge.Progress:=I_COUNT;
                FormProgress.LabelHeader.Caption:=IntToStr(I_Count)+' / '+IntToStr(Rec);
                FormProgress.LabelFooter.Caption:=Trim(FULLN_U);
                FormProgress.RePaint;
                Application.ProcessMessages;
                FIB.pFIBQuery.Next;
         end;
        FormProgress.Free;
     except
         ShowMessage('Ошибка запроса фамилии');
     end;
     if FIB.pFIBQuery.Transaction.Active then
        FIB.pFIBQuery.Transaction.COMMIT;
     if pFIBStoredProc1.Transaction.Active then
        pFIBStoredProc1.Transaction.COMMIT;
     if pFIBQueryAnk.Transaction.Active then
        pFIBQueryAnk.Transaction.COMMIT;

end;

procedure TFormPersonofic.N4Click(Sender: TObject);
begin
     GeneratePerson(2);
     if not pFIBDataSetAnk.Active then
        pFIBDataSetAnk.Open;

end;

end.
