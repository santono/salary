unit UFormKadryUpd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, dxDBELib, StdCtrls,
  Buttons, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, DBCtrls;

type
  TFormKadryUpd = class(TForm)
    dxDBCalcEdit1: TdxDBCalcEdit;
    LabelTabno: TLabel;
    dxDBEdit1: TdxDBEdit;
    dxDBEdit2: TdxDBEdit;
    dxDBEdit3: TdxDBEdit;
    dxDBSpinEdit1: TdxDBSpinEdit;
    dxDBSpinEdit2: TdxDBSpinEdit;
    dxDBDateEdit1: TdxDBDateEdit;
    dxDBDateEdit2: TdxDBDateEdit;
    dxDBDateEdit3: TdxDBDateEdit;
    LabelPIB: TLabel;
    LabelPIBDp: TLabel;
    LabelPIBRp: TLabel;
    LabelPedStag: TLabel;
    LabelPedStagY: TLabel;
    LabelPedStM: TLabel;
    LabelPrinjat: TLabel;
    LabelZwil: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dxDBGrid1: TdxDBGrid;
    dxDBGrid1DateFr: TdxDBGridDateColumn;
    dxDBGrid1Column2: TdxDBGridButtonColumn;
    DBNavigator1: TDBNavigator;
    dxDBCheckEdit1: TdxDBCheckEdit;
    dxDBCalcEdit2: TdxDBCalcEdit;
    Label1: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    dxDBCheckEdit2: TdxDBCheckEdit;
    DBCheckBoxVer: TDBCheckBox;
    LabelDataVer: TLabel;
    dxDBGrid1DateTo: TdxDBGridDateColumn;
    BitBtn6: TBitBtn;
    dxDBGrid1DatePodtv: TdxDBGridDateColumn;
    BitBtn7: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dxDBGrid1Column2ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dxDBCalcEdit2Change(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure dxDBGrid1ChangeNodeEx(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
  private
    { Private declarations }
  public
       function CreateDatPadeg:string;
       function createRodPadeg:string;

    { Public declarations }
  end;

var
  FormKadryUpd: TFormKadryUpd;

implementation
  uses UPODataModule,DB, UFormSeekWidNadb,UFormKKadry,DateUtils,
       UFormUnivBrowse, StrUtils,UPadegDLL;

{$R *.dfm}

procedure TFormKadryUpd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormKadryUpd.BitBtn1Click(Sender: TObject);
begin
     CurrentPStagDate:=dmPO.pFIBdsKadryDate_Stag_P.Value;
     if dmPO.dsKadry.dataSet.State=dsEdit then
        begin
             dmPO.dsKadry.DataSet.Post;
             if dmPO.dsKadryPr.dataSet.State=dsEdit then
                     dmPO.dsKadryPr.DataSet.Post;
        end;
     Close;
end;

procedure TFormKadryUpd.FormCreate(Sender: TObject);
begin
    // dmPO.dsKadry.Edit;
    if dmPO.pFIBdsKadryVERIFIED.Value=1 then
       begin
            LabelDataVer.Caption:='Дата проверки '+DateTimeToStr(dmPO.pFIBdsKadryDATEVER.Value);
            LabelDataVer.Show;
       end
    else
       LabelDataVer.Hide;
end;

procedure TFormKadryUpd.dxDBGrid1Column2ButtonClick(Sender: TObject;
  AbsoluteIndex : Integer);
 var ShifrKat   : integer;
     ShifrId    : integer;
     Name       : string;
     CodeType,I : Integer;
begin
     Application.CreateForm(TFormSeekWidNadb,FormSeekWidNadb);
     i:=FormSeekWidNadb.ShowModal;
     if i=mrOk then
        begin
             ShifrKat := FormSeekWidNadb.ShifrKat;
             ShifrId  := FormSeekWidNadb.ShifrId;
             Name     := FormSeekWidNadb.Name;
             if ((ShifrKat>0) and
                 (ShifrId>0) and
                 (length(Trim(Name))>0)) then
                begin
                     case ShifrKat of
                 //      1: CodeType:=3;
                       2: CodeType:=2;
                       3: CodeType:=1;
                       4: CodeType:=3;
                       5: CodeType:=5; // зав каф
                       6: CodeType:=6; // декан
                       7: CodeType:=7; // зам.декане
                       8: CodeType:=8; // долножть доцент (проф.) с пониженным окладом
                                       // ст.пр. или асс. (доц.)
                       else CodeType:=0;
                     end;
                     if CodeType>0 then
                        begin
                             if  dmPO.dsKadryPr.State=dsBrowse then
                                 dmPO.dsKadryPr.Edit;
                             dmPO.pFIBdsKadryPrCODETYPE.Value := CodeType;
                             dmPO.pFIBdsKadryPrSHIFRUSZ.Value := ShifrId;
                             dmPO.pFIBdsKadryPrName.Value     := Name;
                             if dmPO.dsKadryPr.State<> dsBrowse then
                                dmPO.dsKadryPr.DataSet.Post;
                             dxDBGrid1.Refresh;
         //                    dmPO.pFIBdsKadryPr.Refresh;
                        end;
                end;
        end;
     FormSeekWidNadb.Free;

end;

procedure TFormKadryUpd.dxDBCalcEdit2Change(Sender: TObject);
begin
  // dmPO.pFIBdsKadrySTAG_P_DO_Y.value:=Round(int(dmPO.pFIBdsKadryPEDSTAGY.value));
  // dmPO.pFIBdsKadrySTAG_P_DO_M.value:=round(frac(dmPO.pFIBdsKadryPEDSTAGY.value)*12.00);
  // Refresh;
end;

procedure TFormKadryUpd.BitBtn3Click(Sender: TObject);
begin
   dmPO.pFIBdsKadrySTAG_P_DO_Y.value:=Round(int(dmPO.pFIBdsKadryPEDSTAGY.value));
   dmPO.pFIBdsKadrySTAG_P_DO_M.value:=round(frac(dmPO.pFIBdsKadryPEDSTAGY.value)*12.00);
   dmPO.pFIBdsKadryPEDSTAGISPRIBLISIT.value:=0;
   dmPO.pFIBdsKadryDATE_STAG_P.Value:=CurrentPStagDate;
   Refresh;
end;

procedure TFormKadryUpd.BitBtn4Click(Sender: TObject);
 var SQLStmnt,SQLStmntu:string;
     sd:string;
     ShifrId:Integer;
     i:Integer;
begin
      sd:=IntToStr(yearof(CurrentPStagDate))+'-'+IntToStr(MonthOf(CurrentPStagDate))+'-'+IntToStr(DayOf(CurrentPStagDate));
      SQLStmnt:='update tb_k_Kadrypr set datefr='''+sd+''' where shifridowner= '+IntToStr(dmPO.pFIBdsKadrySHIFRID.Value);
      dmPO.pFIBQueryW.SQL.Clear;
      dmPO.pFIBQueryW.SQL.Add(SQLStmnt);
      dmPO.pFIBQueryW.Transaction.StartTransaction;
      dmPO.pFIBQueryW.ExecQuery;
      dmPO.pFIBQueryW.Close;
      dmPO.pFIBQueryR.SQL.Clear;
      SQLStmntu:='select shifrid,name from tb_k_Kadrypr where shifridowner= '+IntToStr(dmPO.pFIBdsKadrySHIFRID.Value);
      dmPO.pFIBQueryR.SQL.Add(SQLStmntu);
      dmPO.pFIBQueryR.Transaction.StartTransaction;
      dmPO.pFIBQueryR.ExecQuery;
      while not dmPO.pFIBQueryR.Eof do
        begin
             sd:=dmPO.pFIBQueryR.Fields[1].AsString;
             sd:=Trim(sd);
             i:=Pos('(авт)',sd);
             if i>1 then
                begin
                     ShifrId:=dmPO.pFIBQueryR.Fields[0].AsInteger;
                     sd:=Copy(sd,1,i-1);
                     sd:=Trim(sd);
                     dmPO.pFIBQueryW.SQL.Clear;
                     SQLStmnt:='update tb_k_kadrypr set name='''+sd+''' where shifrid='+IntToStr(ShifrId);
                     dmPO.pFIBQueryW.SQL.Clear;
                     dmPO.pFIBQueryW.SQL.Add(SQLStmnt);
                     dmPO.pFIBQueryW.ExecQuery;
                     dmPO.pFIBQueryW.Close;
                end;
             dmPO.pFIBQueryR.Next;
        end;
      dmPO.pFIBQueryR.Close;
      dmPO.pFIBQueryR.Transaction.Commit;



      dmPO.pFIBQueryW.Transaction.Commit;
      dmPO.pFIBdsKadryPr.Refresh;
      dmPO.pFIBdsKadryPr.CLose;
      dmPO.pFIBdsKadryPr.Open;
      dxDBGrid1.Refresh;

end;

function TFormKadryUpd.CreateDatPadeg:string;
  var OriFIO:string;
      ConvertedFIO:String;
      S:string;
      F,I,O:String;
      iCount:Integer;
      Ch:Char;
      need:Boolean;
      ResultFIO:string;
  function SplitFIO:Boolean;
   var s1,S2,S3:string;
       i1,i2:Integer;
   begin
        SplitFIO:=False;
        s1:=Trim(S);
        i1:=Pos(' ',S1);
        if i1>0 then
           begin
                f:=Copy(s1,1,I1-1);
                s2:=Copy(s1,I1,Length(S1)-i1+1);
                s2:=Trim(S2);
                i2:=Pos(' ',S2);
                if i2>0 then
                   begin
                        i:=Copy(s2,1,I2-1);
                        o:=Copy(s2,I2,Length(S2)-i2+1);
                        o:=Trim(o);
                        if ((Length(f)>0) and
                            (Length(I)>0) and
                            (Length(O)>0)) then
                            SplitFIO:=True;
                   end;

           end;

   end;
  function ConvertFIO:Boolean;
   begin
        f:=AnsiUpperCase(F);
        if Copy(O,Length(O)-1,2)='ич' then
           begin
                 o:=o+'у';
                 if (Copy(F,Length(F),1)='О') then
                    F:=Copy(F,1,Length(F)-1)+'У'
                 else if (Copy(F,Length(F)-1,2)='ОВ') then
                    F:=F+'У'
                 else if (Copy(F,Length(F)-1,2)='ІН') then
                    F:=F+'У'
                 else if (Copy(F,Length(F)-1,2)='ИН') then
                    F:=F+'У'
                 else if (Copy(F,Length(F)-1,2)='ИЙ') then
                    F:=Copy(F,1,Length(F)-2)+'ОМУ'
                 else if (Copy(F,Length(F),1)='К') then
                    F:=F+'У'
                 else if (Copy(F,Length(F),1)='Т') then
                    F:=F+'У';

                 if (Copy(I,Length(I)-1,2)='ій') then
                    I:=Copy(I,1,Length(I)-1)+'ю'
                 else if (Copy(I,Length(I)-1,2)='ла') then
                    I:=Copy(I,1,Length(I)-1)+'і'
                 else if (Copy(I,Length(I)-1,2)='ло') then
                    I:=Copy(I,1,Length(I)-1)+'у'
                 else if (Copy(I,Length(I)-1,2)='ро') then
                    I:=Copy(I,1,Length(I)-1)+'у'
                 else if (Copy(I,Length(I),1)='р') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='н') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='т') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='в') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='м') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='г') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='ь') then
                    I:=Copy(I,1,Length(I)-1)+'ю'
                 else if (Copy(I,Length(I),1)='с') then
                    I:=I+'у';
           end
        else if (Copy(O,Length(O)-1,2)='на') then
           begin
                O:=Copy(O,1,Length(O)-1)+'і';
                if (Copy(F,Length(F)-2,3)='ОВА') then
                    F:=Copy(F,1,Length(F)-1)+'ІЙ'
                else if (Copy(F,Length(F)-2,3)='ЕВА') then
                    F:=Copy(F,1,Length(F)-1)+'ІЙ'
                else if (Copy(F,Length(F)-2,3)='ЄВА') then
                    F:=Copy(F,1,Length(F)-1)+'ІЙ'
                else if (Copy(F,Length(F)-2,3)='ІНА') then
                    F:=Copy(F,1,Length(F)-1)+'ІЙ';
                if (Copy(I,Length(I)-1,2)='ія') then
                    I:=Copy(I,1,Length(I)-1)+'ї'
                 else if (Copy(I,Length(I)-1,2)='ия') then
                    I:=Copy(I,1,Length(I)-1)+'ї'
                 else if (Copy(I,Length(I)-2,3)='іса') then
                    I:=Copy(I,1,Length(I)-1)+'ії'
                 else if (Copy(I,Length(I)-1,2)='са') then
                    I:=Copy(I,1,Length(I)-1)+'і'
                 else if (Copy(I,Length(I)-1,2)='на') then
                    I:=Copy(I,1,Length(I)-1)+'і'
                 else if (Copy(I,Length(I)-1,2)='ов') then
                    I:=Copy(I,1,Length(I)-1)+'і'
                 else if (Copy(I,Length(I)-1,2)='ля') then
                    I:=Copy(I,1,Length(I)-1)+'і'
                 else if (Copy(I,Length(I)-1,2)='ла') then
                    I:=Copy(I,1,Length(I)-1)+'і'
                 else if (Copy(I,Length(I)-1,2)='ра') then
                    I:=Copy(I,1,Length(I)-1)+'і'
                 else if (Copy(I,Length(I)-1,2)='га') then
                    I:=Copy(I,1,Length(I)-2)+'зі'
                 else if (Copy(I,Length(I)-1,2)='''я') then
                    I:=Copy(I,1,Length(I)-1)+'ї'
                 else if (Copy(I,Length(I)-1,2)='на') then
                    I:=Copy(I,1,Length(I)-1)+'і';

           end;
         ConvertFIO:=True;

   end;
  function ConvertFIORus:Boolean;
   begin
        f:=AnsiUpperCase(F);
        if Copy(O,Length(O)-1,2)='ич' then
           begin
                 o:=o+'у';
                 if (Copy(F,Length(F),1)='О') then
                    F:=Copy(F,1,Length(F)-1)+'У'
                 else if (Copy(F,Length(F)-1,2)='ОВ') then
                    F:=F+'У'
                 else if (Copy(F,Length(F)-1,2)='ІН') then
                    F:=F+'У'
                 else if (Copy(F,Length(F)-1,2)='ИН') then
                    F:=F+'У'
                 else if (Copy(F,Length(F)-1,2)='ИЙ') then
                    F:=Copy(F,1,Length(F)-2)+'ОМУ'
                 else if (Copy(F,Length(F),1)='К') then
                    F:=F+'У'
                 else if (Copy(F,Length(F),1)='Т') then
                    F:=F+'У';

                 if (Copy(I,Length(I)-1,2)='ий') then
                    I:=Copy(I,1,Length(I)-1)+'ю'
                 else if (Copy(I,Length(I)-1,2)='ла') then
                    I:=Copy(I,1,Length(I)-1)+'и'
                 else if (Copy(I,Length(I)-1,2)='ло') then
                    I:=Copy(I,1,Length(I)-1)+'у'
                 else if (Copy(I,Length(I)-1,2)='ро') then
                    I:=Copy(I,1,Length(I)-1)+'у'
                 else if (Copy(I,Length(I),1)='р') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='н') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='т') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='в') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='м') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='г') then
                    I:=I+'у'
                 else if (Copy(I,Length(I),1)='ь') then
                    I:=Copy(I,1,Length(I)-1)+'ю'
                 else if (Copy(I,Length(I),1)='с') then
                    I:=I+'у';
           end
        else if (Copy(O,Length(O)-1,2)='на') then
           begin
                O:=Copy(O,1,Length(O)-1)+'и';
                if (Copy(F,Length(F)-2,3)='ОВА') then
                    F:=Copy(F,1,Length(F)-1)+'ОЙ'
                else if (Copy(F,Length(F)-2,3)='ЕВА') then
                    F:=Copy(F,1,Length(F)-1)+'ОЙ'
                else if (Copy(F,Length(F)-2,3)='ЕВА') then
                    F:=Copy(F,1,Length(F)-1)+'ОЙ'
                else if (Copy(F,Length(F)-2,3)='ИНА') then
                    F:=Copy(F,1,Length(F)-1)+'ОЙ'
                else if (Copy(F,Length(F)-2,3)='КАЯ') then
                    F:=Copy(F,1,Length(F)-2)+'ОЙ';
                if (Copy(I,Length(I)-1,2)='ия') then
                    I:=Copy(I,1,Length(I)-1)+'и'
                 else if (Copy(I,Length(I)-1,2)='ия') then
                    I:=Copy(I,1,Length(I)-1)+'и'
                 else if (Copy(I,Length(I)-2,3)='иса') then
                    I:=Copy(I,1,Length(I)-1)+'ии'
                 else if (Copy(I,Length(I)-1,2)='са') then
                    I:=Copy(I,1,Length(I)-1)+'е'
                 else if (Copy(I,Length(I)-1,2)='на') then
                    I:=Copy(I,1,Length(I)-2)+'не'
                 else if (Copy(I,Length(I)-1,2)='ов') then
                    I:=Copy(I,1,Length(I)-1)+'и'
                 else if (Copy(I,Length(I)-1,2)='ля') then
                    I:=Copy(I,1,Length(I)-1)+'е'
                 else if (Copy(I,Length(I)-1,2)='ла') then
                    I:=Copy(I,1,Length(I)-1)+'е'
                 else if (Copy(I,Length(I)-1,2)='ра') then
                    I:=Copy(I,1,Length(I)-1)+'е'
                 else if (Copy(I,Length(I)-1,2)='га') then
                    I:=Copy(I,1,Length(I)-2)+'ге'
                 else if (Copy(I,Length(I)-1,2)='''я') then
                    I:=Copy(I,1,Length(I)-1)+'и'
                 else if (Copy(I,Length(I)-1,2)='на') then
                    I:=Copy(I,1,Length(I)-1)+'е';

           end;
         ConvertFIORus:=True;

   end;
  function ConvertFioRusFromDLL:Boolean;
    var retVal:Boolean;
        ss,fio:string;
    begin
         retVal:=True;
         FIO:=trim(AnsiUpperCase(F))+' '+trim(i)+' '+trim(O);
         ss:=getDatelPadegFIO(FIO);
         s:=Trim(ss);
         SplitFIO;
         f:=AnsiUpperCase(f);
         ResultFIO:=Trim(f)+' '+trim(i)+' '+trim(o);
         ConvertFioRusFromDLL:=retVal;
    end;

 begin
    //  s:=dmPO.pFIBdsKadryPIB_ROD_PAD.Value;
      s:=dmPO.pFIBdsKadryPIB.Value;
      s:=Trim(S);
      need:=false;
      ch:='Ы';
      if Length(s)>1 then
         ch:=Copy(s,Length(s),1)[1];
      if Ch in ['а'..'я'] then need:=True;
      if not need then Result:=S
      else
         begin
              OriFIO:=dmPO.pFIBdsKadryFIO.Value;
              if SplitFIO then
              if ConvertFioRusFromDLL then
                 begin
               //        ConvertedFio:=Trim(F)+' '+trim(I)+' '+trim(O);
               //        Result:=ConvertedFIO;
                       Result:=ResultFIO;
                 end;
         end;
 end;


procedure TFormKadryUpd.BitBtn5Click(Sender: TObject);
var S:string;

begin
     s:=CreateDatPadeg;
//     FIO:=Trim(dmPO.pFIBdsKadryPIB.Value);
//     s:=getDatelPadegFIO(FIO);
     dmPo.pFIBdsKadryPIB_DAT_PAD.Value:=s;
     Refresh;
end;

procedure TFormKadryUpd.BitBtn6Click(Sender: TObject);
 var
    FUB:TFormUnivBrowse;
    ShifrPod:Integer;
    NamePod:string;
 begin
      if dmPO.pFIBdsKadryPrCODETYPE.Value<>5 then
         Exit;
      FUB:=TFormUnivBrowse.Make(nil,dmPO.dsPodr,'ShifrPod','Укажите подразделение',ChoiceRecord,cmManualClose);
      if FUB.ShowModal=mrOk then
         begin
              ShifrPod := dmPO.pFIBdsPodrSHIFRPOD.Value;
              NamePod  := dmPO.pFIBdsPodrNAME.Value;
              if dmPO.pFIBdsKadryPr.State<>dsEdit then
                 dmPO.pFIBdsKadryPr.Edit;
              dmPO.pFIBdsKadryPrSHIFRUSZ.Value:=ShifrPod;
              dmPO.pFIBdsKadryPrNAME.Value:=Copy('зав.'+NamePod+DupeString(' ',50),1,50);
              dmPO.pFIBdsKadryPr.Post;

         end;
end;

procedure TFormKadryUpd.dxDBGrid1ChangeNodeEx(Sender: TObject);
begin
     if dmPO.pFIBdsKadryPrCODETYPE.Value<>5 then
        begin
             BitBtn6.Hide;
             BitBtn6.Enabled:=false;
        end
     else
        begin
             BitBtn6.Show;
             BitBtn6.Enabled:=true;
        end;
end;

procedure TFormKadryUpd.BitBtn7Click(Sender: TObject);
var S:string;
begin
     s:=CreateRodPadeg;
//     FIO:=Trim(dmPO.pFIBdsKadryPIB.Value);
//     s:=getDatelPadegFIO(FIO);
     dmPo.pFIBdsKadryPIB_ROD_PAD.Value:=s;
     Refresh;
end;


function TFormKadryUpd.createRodPadeg:string;
  var s,fio:string;
  begin
       FIO:=Trim(dmPO.pFIBdsKadryPIB.Value);
       s:=getRoditPadegFIO(FIO);
       createRodPadeg:=trim(s);
  end;

end.
