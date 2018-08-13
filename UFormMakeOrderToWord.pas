unit UFormMakeOrderToWord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, WordXP, OleServer, ExtCtrls;

type
  TFormMakeOrderToWord = class(TForm)
    ProgressBarOrder: TProgressBar;
    LabelVar: TLabel;
    LabelPodrFIO: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    WA_Ord: TWordApplication;
    WD_Ord: TWordDocument;
    WordFont1: TWordFont;
    WordParagraphFormat1: TWordParagraphFormat;
    CheckBoxVisible: TCheckBox;
    rgModeFac: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    modeFac:Integer;
    procedure ConvertToWord;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeOrderToWord: TFormMakeOrderToWord;

implementation
  uses UPODataModule,uFIBModule;

{$R *.dfm}

procedure TFormMakeOrderToWord.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormMakeOrderToWord.BitBtn1Click(Sender: TObject);
begin
     ConvertToWord;
end;

procedure TFormMakeOrderToWord.ConvertToWord;
 var sc:Integer;
     SQLStmnt:string;
     SQLStmntIn:string;
     ShifrPod:Integer;
     NamePod:string;
     Text:WideString;
     FIO :string;
     tmp0:OleVariant;
     tmp1:OleVariant;
     tmp2:OleVariant;
     tmp3:OleVariant;
     CntPerson:Integer;
     DocName:String;
     PunktNo:Integer;
     Ch:Char;
     ShifrId : Integer;
 function getCountRec:Integer;
   var SQLStmnt:string;
       RetVal:Integer;
   begin
        SQLStmnt:='select count(*) from tb_k_orderrectext a where a.shifridowner='+IntToStr(SHIFRID);
        dmPO.pFIBQueryR.SQL.Clear;
        dmPO.pFIBQueryR.SQL.Add(SQLStmnt);
        dmPO.pFIBQueryR.Transaction.StartTransaction;
        dmPO.pFIBQueryR.ExecQuery;
        RetVal:=dmPO.pFIBQueryR.Fields[0].AsInteger;
        dmPO.pFIBQueryR.Close;
        dmPO.pFIBQueryR.Transaction.Commit;
        getCountRec:=RetVal;
   end;
   { начало гл процедуры}
 begin
      modeFac:=rgModeFac.ItemIndex+1;
      if ((modeFac<1) or (modeFac>3)) then modeFac:=1;
//      SQLStmnt:='select shifrid from pr_k_getorderidformode('+IntToStr(dmPO.pFIBdsOrderSHIFRID.Value)+','+IntToStr(modeFac)+')';
      SQLStmnt:='select shifrid from pr_k_getorderidformode(33,'+IntToStr(modeFac)+')';
      ShifrId:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
      if ShifrId<1 then
         Close;
      ch:=chr(167);
      try
         WA_Ord.Connect;
      except
        Exception.Create('Word не запускается');
        Exit;
      end;
      if CheckBoxVisible.Checked then
         WA_Ord.Visible:=true;
      DocName:=WA_Ord.Version;
      tmp0 := wdNormalTemplate;
      tmp1 := wdNewBlankDocument;//WdNewDocumentType
      tmp2 := wdTypeDocument;
      DocName:=ExtractFilePath(Application.EXEName)+'Report.doc';
      tmp3:=DocName;
      WA_Ord.Documents.Add(EmptyParam,EmptyParam,EmptyParam,EmptyParam);
      WD_Ord.ConnectTo(WA_Ord.ActiveDocument);
      WD_Ord.PageSetup.Orientation := wdOrientPortrait;
      WD_Ord.PageSetup.PaperSize   := wdPaperA4;
      WD_Ord.PageSetup.RightMargin  := WA_ord.CentimetersToPoints(1);//, 28; //Пример 1 см
      WD_Ord.PageSetup.LeftMargin   := WA_ord.CentimetersToPoints(2);//56;   //Примерно 2 см (1,98)
      WD_Ord.PageSetup.TopMargin    := WA_ord.CentimetersToPoints(2);//56;
      WD_Ord.PageSetup.BottomMargin := WA_ord.CentimetersToPoints(2);//56;
      WD_Ord.Range.Font.Name := 'Times New Roman';
      WD_Ord.Range.Font.Size := 14;

      WD_Ord.Range.Text:='';
      //  WA_pov.Visible:=true;

      ProgressBarOrder.Max:=getCountRec;
      ProgressBarOrder.Min:=0;
      ProgressBarOrder.Position:=0;
      Application.ProcessMessages;
      sc:=0;
      if modeFac=1 then
         begin
               SQLStmnt:= 'select a.shifrpod,(select first 1 b.name_k from tb_k_Podr b where b.shifrpod=a.shifrpod) from tb_k_orderrectext a';
               SQLStmnt:= Trim(SQLStmnt)+' where a.shifridowner='+IntToStr(ShifrId);
               SQLStmnt:= Trim(SQLStmnt)+' group by 1,2';
               SQLStmnt:= Trim(SQLStmnt)+' order by (select first 1 b.name_s from tb_k_Podr b where b.shifrpod=a.shifrpod) ';
         end
      else
      if ((modeFac=2) or (modeFac=3)) then
         begin
               SQLStmnt:= 'select a.shifrfac ,';
               SQLStmnt:= Trim(SQLStmnt)+' (select first 1 b.name_s from tb_k_facultety b where b.shifrid=a.shifrfac)';
               SQLStmnt:= Trim(SQLStmnt)+' from tb_k_orderrectext a';
               SQLStmnt:= Trim(SQLStmnt)+' where a.shifridowner='+IntToStr(ShifrId);
               SQLStmnt:= Trim(SQLStmnt)+' group by 1,2';
               SQLStmnt:= Trim(SQLStmnt)+' order by (select first 1 c.name_s from tb_k_facultety c where c.shifrid  =a.shifrfac)';
         end;
      dmPO.pFIBQueryR.SQL.Clear;
      dmPO.pFIBQueryR.SQL.Add(SQLStmnt);
      dmPO.pFIBQueryR.Transaction.StartTransaction;
      dmPO.pFIBQueryR.ExecQuery;
    //  dmPO.pFIBQueryR.First;
      PunktNo:=0;
      while not dmPO.pFIBQueryR.Eof do
        begin
             Inc(PunktNo);
             ShifrPod := dmPO.pFIBQueryR.Fields[0].AsInteger;
             NamePod  := dmPO.pFIBQueryR.Fields[1].AsString;
      //       if Copy(NamePod,1,1)='И' then
      //          NamePod[1]:='І';
   //          SQLStmntIn:='select a.fio,a.text from tb_k_orderrectext a where a.shifridowner='+IntToStr(dmPO.pFIBdsOrderSHIFRID.Value)+' and a.shifrpod='+IntToStr(ShifrPod)+' order by a.lineno';
             SQLStmntIn:='select fio,text from PR_K_SELRECFORWORD('+IntToStr(ShifrId)+','+IntToStr(ShifrPod)+','+IntToStr(modeFac)+')';
             dmPO.pFIBQueryRIn.SQL.Clear;
             dmPO.pFIBQueryRIn.SQL.Add(SQLStmntIn);
             dmPO.pFIBQueryRIn.Transaction.StartTransaction;
             dmPO.pFIBQueryRIn.ExecQuery;
             CntPerson:=0;
             while not dmPO.pFIBQueryRIn.Eof do
               begin
                    Inc(CntPerson);
                    if (CntPerson=1) then
                       begin
                            WD_Ord.Range.InsertAfter(#0167+IntToStr(PunktNo)+#13);
                            WD_Ord.Paragraphs.Item(WD_Ord.Paragraphs.Count-1).Range.ParagraphFormat.Alignment:=wdAlignParagraphCenter;
                            if (modeFac=1) and (ShifrPod<>104) then
                               WD_Ord.Range.InsertAfter('Кафедра "');
                            WD_Ord.Range.InsertAfter(Trim(AnsiUpperCase(NamePod)));
                            if (modeFac=1) and (ShifrPod<>104) then
                               WD_Ord.Range.InsertAfter('"');
                            WD_Ord.Range.InsertAfter(#13);
                            WD_Ord.Paragraphs.Item(WD_Ord.Paragraphs.Count-1).Range.ParagraphFormat.Alignment:=wdAlignParagraphCenter;
                            WD_Ord.Paragraphs.Item(WD_Ord.Paragraphs.Count-1).Range.ParagraphFormat.SpaceAfter:=15;
                       end;

                    Inc(sc);
                    FIO:=dmPO.pFIBQueryRIn.Fields[0].AsString;
                    Text:=dmPO.pFIBQueryRIn.Fields[1].AsWideString;
                    ProgressBarOrder.Position:=sc;
                    LabelVar.Caption:=IntToStr(sc)+' / '+IntToStr(ProgressBarOrder.Max);
                    LabelPodrFIO.Caption:=Trim(NamePod)+' '+Trim(FIO);
                    Application.ProcessMessages;
                    WD_Ord.Range.InsertAfter(Trim(Text)+#13);
                    WD_Ord.Paragraphs.Item(WD_Ord.Paragraphs.Count-1).Range.Font.AllCaps:=0;
                    WD_Ord.Paragraphs.Item(WD_Ord.Paragraphs.Count-1).Range.ParagraphFormat.Alignment:=wdAlignParagraphJustify;
                    WD_Ord.Paragraphs.item(WD_Ord.Paragraphs.Count-1).Range.ParagraphFormat.FirstLineIndent:=35;
                    WD_Ord.Paragraphs.Item(WD_Ord.Paragraphs.Count-1).Range.ParagraphFormat.SpaceAfter:=10;

                    dmPO.pFIBQueryRIn.Next;
               end;
             dmPO.pFIBQueryRIn.Close;
             dmPO.pFIBQueryRIn.Transaction.Commit;
             dmPO.pFIBQueryR.Next;
        end;
      dmPO.pFIBQueryR.Close;
      dmPO.pFIBQueryR.Transaction.Commit;
      if not CheckBoxVisible.Checked then
         WA_Ord.Visible:=true;


 end;

procedure TFormMakeOrderToWord.FormCreate(Sender: TObject);
begin
      modeFac:=1;
      rgModeFac.ItemIndex:=0;

end;

end.
