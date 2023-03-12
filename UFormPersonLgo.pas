unit UFormPersonLgo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,ScrDef, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  StdCtrls, ComCtrls, dxCntner, dxEditor, dxExEdtr, dxEdLib, Buttons;

type
  TFormPersonLgo = class(TForm)
    dsLgotniki: TpFIBDataSet;
    trWrite: TpFIBTransaction;
    dsLgotyDet: TpFIBDataSet;
    trReadLgDet: TpFIBTransaction;
    trRead: TpFIBTransaction;
    dsLgotnikiID: TFIBIntegerField;
    dsLgotnikiTABNO: TFIBIntegerField;
    dsLgotnikiDATAFR: TFIBDateField;
    dsLgotnikiSUMMAVY: TFIBBCDField;
    dsLgotnikiFIO: TFIBStringField;
    dsLgotnikiSUMMAYEARLIMIT: TFIBBCDField;
    dsLgotnikiSHIFRLG: TFIBIntegerField;
    dsLgotnikiCOMMENT: TFIBStringField;
    dsLgotnikiDATAEND: TFIBDateField;
    dsLgotnikiGUID: TFIBStringField;
    dsLgotnikiENABLED: TFIBIntegerField;
    dsLgotyDetID: TFIBIntegerField;
    dsLgotyDetIDLGO: TFIBIntegerField;
    dsLgotyDetNAME: TFIBStringField;
    dsNalLgoty: TpFIBDataSet;
    trReadLg: TpFIBTransaction;
    dsNalLgotyID: TFIBIntegerField;
    dsNalLgotySHIFRLGO: TFIBIntegerField;
    dsNalLgotySUMMAVY: TFIBBCDField;
    dsNalLgotyDATEFR: TFIBDateField;
    dsNalLgotySUMMALIMITYEAR: TFIBBCDField;
    dsLgotyDetSummaVy: TFIBFloatField;
    SSummVy: TdxCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dtFrom: TDateTimePicker;
    Label4: TLabel;
    dtTo: TDateTimePicker;
    Label5: TLabel;
    cbEnabled: TCheckBox;
    cbLgota: TComboBox;
    SSSummaLimit: TdxCalcEdit;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label8: TLabel;
    MemoComment: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    tabno:Integer;
    fio:string;
    shifrlg:Integer;
    comment:string;
    summavy:Real;
    summaYearLimit:Real;
    DataFr:TDate;
    DataTo:TDate;
    Enabled:Boolean;
    GUID:string;
    id:Integer;
    curr_person:PERSON_PTR;
    { Private declarations }
    procedure fillForm;
    procedure fillRecord;
    procedure saveRecord;


  public
    constructor myCreate(AOwner:TComponent;Curr_Person:Person_Ptr);
    { Public declarations }
  end;

var
  FormPersonLgo: TFormPersonLgo;

implementation
 USeS ScrUtil,DateUtils,UFibModule,USQLUnit,scrio;
{$R *.dfm}

constructor TFormPersonLgo.myCreate(AOwner: TComponent;curr_person:person_ptr);
 var v,v1:Variant;
     SqlStmnt:string;
     iCount:Integer;
 begin
      inherited Create(AOwner);
      Self.curr_person:=Curr_Person;
      self.tabno:=curr_person^.TABNO;
      Self.fio:=GetFullRusFioPerson(Self.tabno);
      Self.shifrlg:=0;
      Self.comment:='';
      Self.summavy:=0.00;
      Self.DataFr:=Now;
      Self.DataTo:=EncodeDate(1900,1,1);
      Self.Enabled:=True;
      Self.GUID:=GetGUIDPersonToString(curr_person);
//      Self.MemoComment.Lines.Clear;
//      Self.MemoComment.Lines.Add(Self.comment);
      Caption:='Ћьготы '+intToStr(tabno)+' '+self.fio;
      SQLStmnt:='select count(*) from TB_LGOTNIKI where tabno='+intToStr(Self.Tabno);
      iCount:=0;
      v:=SQLQueryValue(SqlStmnt);
      if (not VarIsNull(v))and
         (VarIsNumeric(v)) then
         icount:=v;
      if (iCount>0) then
        begin
          dsLgotniki.Transaction.StartTransaction;
          dsLgotniki.Params[0].Value:=Self.Tabno;
          dsLgotniki.Prepare;
          dsLgotniki.Open;
          iCount:=0;
          while (not dsLgotniki.eof) do
            begin
                if (iCount=0) then
                  begin
                     if not dsLgotnikiGUID.IsNull then
                        if Trim(dsLgotnikiGUID.AsString)<>Trim(Self.GUID) then
                           begin
                                ShowMessage('Ћьгота учитываетс€ по другому месту работы');
                                raise Exception.Create('Exist Lgota');
                           end;
                     if not dsLgotnikiENABLED.IsNull then
                     if dsLgotnikiENABLED.AsInteger>0 then
                        Self.Enabled:=True;
                     if not dsLgotnikiSUMMAVY.IsNull then
                        Self.summavy:=dsLgotnikiSUMMAVY.AsFloat;
                     if not dsLgotnikiSUMMAYEARLIMIT.IsNull then
                        Self.summaYearLimit:=dsLgotnikiSUMMAYEARLIMIT.AsFloat;
                     if not dsLgotnikiDATAFR.IsNull then
                        Self.DataFr:=dsLgotnikiDATAFR.AsDateTime;
                     if not dsLgotnikiDATAEND.IsNull then
                        Self.DataTo:=dsLgotnikiDATAEND.AsDateTime;
                     if not dsLgotnikiCOMMENT.IsNull then
                        Self.comment:=dsLgotnikiCOMMENT.AsString;
                   end;
                dsLgotniki.Next;
            end;
          dsLgotniki.Close;
          dsLgotniki.Transaction.Commit;
        end;
      fillForm;
      Label5.Hide;
      cbLgota.Hide;

 end;
procedure TFormPersonLgo.fillForm;
 var lines:TArrOfAnsiString;
     i:Integer;
 begin
      cbEnabled.Checked:=Self.Enabled;
      dtFrom.Date:=Self.DataFr;
      dtTo.Date:=Self.DataTo;
      SSummVy.Text:=FormatFloatPoint(Self.SummaVy);
      SSSummaLimit.Text:=FormatFloatPoint(Self.summaYearLimit);
      MemoComment.Lines.Clear;
      if Length(Self.comment)>0 then
         begin
              lines:=AnsiSplit(Self.comment,'=^=');
              if High(lines)>0 then
                 for i:=0 to High(lines)-1 do
                     MemoComment.lines.Add(lines[i]);
         end;
 end;
procedure TFormPersonLgo.fillRecord;
 var lines:TArrOfAnsiString;
     i:Integer;
     iErr:Integer;
     aVal:Real;
 begin
      Self.Enabled:=cbEnabled.Checked;
      Self.DataFr:=dtFrom.Date;
      Self.DataTo:=dtTo.Date;
      Val(SSummVy.text,aVal,iErr);
      if iErr>0 then
         Self.summavy:=0
      else
         Self.summavy:=aVal;
      Val(SSSummaLimit.text,aVal,iErr);
      if iErr>0 then
         Self.summaYearLimit:=0
      else
         Self.summaYearLimit:=aVal;
      Self.comment:='';
      if MemoComment.Lines.Count>0 then
         for i:=0 to MemoComment.Lines.Count-1 do
             if i=0 then
                Self.comment:=MemoComment.Lines.Strings[i]
             else
                Self.comment:=Self.comment+'=^='+MemoComment.Lines.Strings[i];
 end;

procedure TFormPersonLgo.saveRecord;
 begin
      dsLgotniki.Transaction.StartTransaction;
      dsLgotniki.Params[0].AsInteger:=Self.tabno;
      dsLgotniki.Open;
      if self.id>0 then
         dsLgotniki.Edit
      else
         dsLgotniki.Insert;
      dsLgotnikiID.Value:=Self.id;
      dsLgotnikiFIO.Value:=Self.fio;
      dsLgotnikiTABNO.Value:=Self.tabno;
      dsLgotnikiDATAFR.Value:=Self.DataFr;
      dsLgotnikiDATAEND.Value:=Self.DataTo;
      dsLgotnikiGUID.Value:=Self.GUID;
      dsLgotnikiSUMMAVY.Value:=Self.summavy;
      dsLgotnikiSUMMAYEARLIMIT.Value:=Self.summaYearLimit;
      dsLgotnikiSHIFRLG.Value:=Self.shifrlg;
      dsLgotniki.Post;
      dsLgotniki.Close;
      if dsLgotniki.UpdateTransaction.Active then
         dsLgotniki.UpdateTransaction.Commit;
      dsLgotniki.Transaction.Commit;
 end;


procedure TFormPersonLgo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormPersonLgo.BitBtn1Click(Sender: TObject);
begin
     fillRecord;
     saveRecord;
     MakeLgotyPNInCN2023(Self.Curr_person,Self.summavy);
     putInf;
     Self.Close;
end;

end.
