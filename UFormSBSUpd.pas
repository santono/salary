{$WARNINGS OFF}
{$HINTS OFF}
unit UFormSBSUpd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  StdCtrls, Buttons, FIBQuery, pFIBQuery, ComCtrls, dxCntner, dxEditor,
  dxExEdtr, dxEdLib, dxDBELib, Mask, ExtCtrls;

type
  TFormSBSUpd = class(TForm)
    pFIBTransactionSBS: TpFIBTransaction;
    LabelFIO: TLabel;
    BitBtnFIO: TBitBtn;
    pFIBQuery: TpFIBQuery;
    Label1: TLabel;
    DateTimePickerFr: TDateTimePicker;
    Label2: TLabel;
    DateTimePickerTo: TDateTimePicker;
    BitBtnNew: TBitBtn;
    Label3: TLabel;
    MaskEditNal_Code: TMaskEdit;
    Label4: TLabel;
    LabelNamePod: TLabel;
    Label5: TLabel;
    EditNameDol: TEdit;
    EditPeriod: TEdit;
    Label6: TLabel;
    EditProrektor: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    LabelPeriod: TLabel;
    
    EditGlBuhName: TEdit;
    EditBuhName: TEdit;
    Label9: TLabel;
    EditSumma: TEdit;
    dxCalcEditShifrPod: TdxCalcEdit;
    RadioGroupMode_Vy_Za: TRadioGroup;
    BitBtn1: TBitBtn;
    Label10: TLabel;
    ButtonSave: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnFIOClick(Sender: TObject);
    procedure BitBtnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ButtonSaveClick(Sender: TObject);
  private
    { Private declarations }
     InitialisedData:boolean;
     procedure FillMemFromSQL;
     procedure FillFormFromMem;
     procedure FillMemFromForm;
     procedure FillSQLFromMem;


  public
     MyAction      : integer;
     wantedTabno :integer;
     fio         : string ;
     ShifrIdSBS  : integer;
     DateFr      : TDateTime;
     DateTo      : TDateTime;
     WantedMonth : integer;
     WantedYear  : integer;
     MonthVy     : integer;
     YearVy      : integer;
     Nal_Code : string;
     ShifrKat : integer;
     ShifrGru : integer;
     ShifrPod : integer;
     NamePod  : string;
     SummaTot : real;
     SummaProp: string;
     Dolg     : string;
     Mode_Vy_Za : integer;
     Prorektor : string;
     buh_Name  : string;
     gl_buh    : string;
     Period    : string;

    { Public declarations }
  end;

var
  FormSBSUpd: TFormSBSUpd;

implementation
  uses uFrmFindKadryFB,UFormWait,UFibModule,dateUtils,ScrDef,ScrUtil,
  UFormWaitMess;
{$R *.dfm}

procedure TFormSBSUpd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormSBSUpd.BitBtnFIOClick(Sender: TObject);
var ks,gs:string;
begin
    if MyAction<>1 then
       Exit;
    LabelFio.Caption:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     Self.WantedTabno:=GetTabno;
                     Self.FIO:=GetFio;
                     LabelFio.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(Self.Fio);
(*
                     if not pFIBQuery.Transaction.Active then
                        pFIBQuery.Transaction.StartTransaction;
                     pFIBQuery.SQL.Clear;
                     pFIBQuery.SQL.Add('SELECT shifrkat,shifrgru,namekat,namegru,w_place FROM getkatgru('+IntToSTr(Self.WantedTabno)+')');
                     try
{
                         FormWait.Show;
                         Application.ProcessMessages;
}
                         pFIBQuery.ExecQuery;
{                         FormWait.Hide;}
                         Self.ShifrKat:=pFIBQuery.Fields[0].AsInteger;
                         Self.ShifrGru:=pFIBQuery.Fields[1].AsInteger;
                         KS:=pFIBQuery.Fields[2].AsString;
                         GS:=pFIBQuery.Fields[3].AsString;
                         Self.WantedPodr:=pFIBQuery.Fields[4].AsInteger;
                         LabelFio.Caption:=Trim(LabelFio.Caption)+' '+trim(ks)+' '+trim(gs);
                         pFIBQuery.Close;
                     except
                         MessageDlg('Ошибка getkatgru',mtInformation, [mbOk], 0);
                         if pFIBQuery.Transaction.Active then
                            pFIBQuery.Transaction.Commit;
                         Exit;
                     end;
*)                     
               end;
         finally
{            free;}
         end;
       if pFIBQuery.Transaction.Active then
          pFIBQuery.Transaction.CommitRetaining;
       Self.Repaint;
end;

procedure TFormSBSUpd.BitBtnNewClick(Sender: TObject);
 var SQLStmnt:String;
     DFrS,DToS:string;
     Y,M,D:word;
begin
      if ((MyAction<1) or (MyAction>2)) then Exit;
      if MyAction<>1 then
         begin
              if ShifrIdSbs=0 then Exit;
              if not YesNo('Выполнить инициализацию справки повторно?'#10#13'(все суммы  при этом будут извлечены заново из архива)') then
                 Exit;
         end;
      DateFr:= DateTimePickerFr.Date;
      DateTo:= DateTimePickerTo.Date;
      if DateFr>=DateTo then
         begin
              ShowMessage('Неверно заданы даты справки');
              Exit;
         end;
      if YearOf(DateFr)<1992 then
         begin
              ShowMessage('Неверно заданы даты справки');
              Exit;
         end;
      if YearOf(DateTo)>CurrYear then
         begin
              ShowMessage('Неверно заданы даты справки');
              Exit;
         end;
      if pFIBQuery.Open then
         pFIBQuery.Close;
      if pFIBQuery.Transaction.Active then
         pFIBQuery.Transaction.Commit;
      DeCodeDate(Self.DateFr,Y,M,D);
      DFrS:=IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
      DeCodeDate(Self.DateTo,Y,M,D);
      DToS:=IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
      if RadioGroupMode_Vy_Za.ItemIndex=1 then
         Mode_Vy_Za:=2
      else
         Mode_Vy_Za:=1;
      if MyAction=1 then
         SQLStmnt := 'select first 1 retval from PR_GEN_NEW_SBS_SPR('+IntToStr(Self.wantedTabno)+','''+DFrS+''','''+DToS+''','+IntToStr(Mode_Vy_Za)+')'
      else
         SQLStmnt := 'select first 1 retval from PR_GEN_RENEW_SBS_SPR('+IntToStr(Self.wantedTabno)+','''+DFrS+''','''+DToS+''','+IntToStr(Mode_Vy_Za)+','+IntToStr(ShifrIdSBS)+')';
      pFIBQuery.Transaction.StartTransaction;
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add(SQLStmnt);
      FormWait.Show;
      Application.ProcessMessages;
      pFIBQuery.ExecQuery;
      ShifrIdSBS:=pFIBQuery.FieldByName('retval').AsInteger;
      FormWait.Hide;
      Application.ProcessMessages;
      if pFIBQuery.Open then
         pFIBQuery.Close;
      if pFIBQuery.Transaction.Active then
         pFIBQuery.Transaction.Commit;
      FillMemFromSQL;
      FillFormFromMem;
      if MyAction=1 then
         BitBtnNew.Enabled:=false;
      Application.ProcessMessages;
end;


procedure TFormSBSUpd.FillMemFromForm;
 var I,J:integer;
     A:real;
 begin
      Nal_Code := MaskEditNal_Code.Text;
      DateFr   := DateTimePickerFr.Date;
      DateTo   := DateTimePickerTo.Date;
      val(trim(dxCalcEditShifrPod.Text),i,j);
      if j=0 then
         ShifrPod:=i
      else
         ShifrPod:=0;
      NamePod  := LabelNamePod.Caption;
      Dolg     := EditNameDol.Text;
      Period   := EditPeriod.Text;
      Prorektor:= EditProrektor.Text;
      Gl_Buh   := EditGlBuhName.Text;
      Buh_Name := EditBuhName.Text;
      val(trim(EditSumma.Text),A,J);
      if (j=0) then
         SummaTot := A
      else
         SummaTot := 0;
      if RadioGroupMode_Vy_Za.ItemIndex=1 then
         Mode_Vy_Za:=2
      else
         Mode_Vy_Za:=1;
 end;


procedure TFormSBSUpd.FillFormFromMem;
 begin
      MaskEditNal_Code.Text   := Nal_Code;
      DateTimePickerFr.Date   := DateFr;
      DateTimePickerTo.Date   := DateTo;
      dxCalcEditShifrPod.Text := IntToStr(ShifrPod);
      LabelNamePod.Caption    := NamePod;
      EditNameDol.Text        := Dolg;
      EditPeriod.Text         := Period;
      EditProrektor.Text      := Prorektor;
      EditGlBuhName.Text      := Gl_Buh;
      EditSumma.Text          := Format('%12.2f',[SummaTot]);
      EditBuhName.Text        := Buh_Name;
      if Mode_Vy_Za <> 1 then
         RadioGroupMode_Vy_Za.ItemIndex:=1
      else
         RadioGroupMode_Vy_Za.ItemIndex:=0;
 end;

procedure TFormSBSUpd.FillMemFromSql;
 var SQLStmnt : string;
 begin
      if pFIBQuery.Open then
         pFIBQuery.Close;
      if pFIBQuery.Transaction.Active then
         pFIBQuery.Transaction.Commit;
      SQLStmnt:= 'select first 1 nal_code,shifr_Kat,Shifr_Gru,W_PLACE,Name,Summa_Tot,Summa_Prop,Period,BUH_NAME,PROREKTOR,DOLG,MODE_VY_ZA,GL_BUH,F_Data,L_Data from TB_SPRSBSTABLE join podr on w_place=shifrpod where ShifrId='+IntToStr(ShifrIdSBS);
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add(SQLStmnt);
      pFIBQuery.Transaction.StartTransaction;
      pFIBQuery.ExecQuery;
      Nal_Code   := pFIBQuery.Fields[0].AsString;
      ShifrKat   := pFIBQuery.Fields[1].AsInteger;
      ShifrGru   := pFIBQuery.Fields[2].AsInteger;
      ShifrPod   := pFIBQuery.Fields[3].AsInteger;
      NamePod    := pFIBQuery.Fields[4].AsString;
      SummaTot   := pFIBQuery.Fields[5].AsFloat;
      SummaProp  := pFIBQuery.Fields[6].AsString;
      Period     := pFIBQuery.Fields[7].AsString;
      Buh_Name   := pFIBQuery.Fields[8].AsString;
      Prorektor  := pFIBQuery.Fields[9].AsString;
      Dolg       := pFIBQuery.Fields[10].AsString;
      Mode_VY_ZA := pFIBQuery.Fields[11].AsInteger;
      Gl_Buh     := pFIBQuery.Fields[12].AsString;
      DateFr     := pFIBQuery.Fields[13].AsDateTime;
      DateTo     := pFIBQuery.Fields[14].AsDateTime;

      if pFIBQuery.Open then
         pFIBQuery.Close;
      if pFIBQuery.Transaction.Active then
         pFIBQuery.Transaction.Commit;
 end;

procedure TFormSBSUpd.FillSQLFromMem;
 var SQLStmnt : string;
     Y,M,D : word;
     DateFrS,DateToS : string;
 begin
      if pFIBQuery.Open then
         pFIBQuery.Close;
      if pFIBQuery.Transaction.Active then
         pFIBQuery.Transaction.Commit;
      Decodedate(DateFr,y,m,d);
      DateFrS:=IntToStr(y)+'-'+IntToStr(m)+'-'+IntToStr(d);
      Decodedate(DateTo,y,m,d);
      DateToS:=IntToStr(y)+'-'+IntToStr(m)+'-'+IntToStr(d);
      SQLStmnt:= 'update TB_SPRSBSTABLE set';
      SQLStmnt:= SQLStmnt+' nal_code='''+trim(NAL_CODE)+''',';
      SQLStmnt:= SQLStmnt+' w_place='+IntToStr(ShifrPod)+',';
      SQLStmnt:= SQLStmnt+' period='''+trim(period)+''',';
      SQLStmnt:= SQLStmnt+' prorektor='''+trim(prorektor)+''',';
      SQLStmnt:= SQLStmnt+' gl_buh='''+trim(gl_buh)+''',';
      SQLStmnt:= SQLStmnt+' buh_name='''+trim(buh_name)+''',';
      SQLStmnt:= SQLStmnt+' dolg='''+trim(dolg)+''',';
      SQLStmnt:= SQLStmnt+' f_data='''+trim(datefrs)+''',';
      SQLStmnt:= SQLStmnt+' l_data='''+trim(datetos)+''',';
      SQLStmnt:= SQLStmnt+' mode_vy_za='+IntToStr(Mode_Vy_Za);
      SQLStmnt:= SQLStmnt+' where shifrid='+IntToStr(ShifrIdSBS);
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add(SQLStmnt);
      pFIBQuery.Transaction.StartTransaction;
      pFIBQuery.ExecQuery;
      if pFIBQuery.Open then
         pFIBQuery.Close;
      if pFIBQuery.Transaction.Active then
         pFIBQuery.Transaction.Commit;
     FormWaitMess.SetMessage('Справка сохранена');
     FormWaitMess.Show;
     repeat
            Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     FormWaitMess.Hide;

 end;

procedure TFormSBSUpd.FormCreate(Sender: TObject);
 var DtFr,DtTo:TDateTime;
     y,m,d:word;
begin
      ShifrIdSBS:=0;
      InitialisedData:=false;
      if MyAction=3 then
         begin
              BitBtnNew.Hide;
              BitBtnNew.Enabled:=false;
         end
      else
         begin
              BitBtnNew.Show;
              BitBtnNew.Enabled:=true;
              dtto:=IncMonth(date,-1);
              dtfr:=IncMonth(dtto,-5);
              DecodeDate(dtfr,y,m,d);
              DecodeDate(dtto,y,m,d);
              DateTimePickerFr.Date:=DtFr;
              DateTimePickerTo.Date:=DtTo;
              DateFr:=DtFr;
              DateTo:=DtTo;
         end

end;

procedure TFormSBSUpd.FormShow(Sender: TObject);
 var DtFr,DtTo:TDateTime;
     y,m,d:word;
 begin
      if MyAction<>1 then
         begin
              BitBtnNew.Hide;
              BitBtnNew.Enabled:=false;
              BitBtnFio.Hide;
              BitBtnFio.Enabled:=false;
         end
      else
         begin
              BitBtnNew.Show;
              BitBtnNew.Enabled:=true;
              BitBtnFio.Show;
              BitBtnFio.Enabled:=true;
              if not InitialisedData then
                 begin
                      dtto:=IncMonth(date,-1);
                      dtfr:=IncMonth(dtto,-5);
                      DecodeDate(dtfr,y,m,d);
                      DecodeDate(dtto,y,m,d);
                      DateTimePickerFr.Date:=DtFr;
                      DateTimePickerTo.Date:=DtTo;
                      DateFr:=DtFr;
                      DateTo:=DtTo;
                      InitialisedData:=true;
                 end;
         end;
      if MyAction=2 then
         begin
              BitBtnNew.Show;
              BitBtnNew.Enabled:=true;
         end;
      BitBtn1.Hide;
      BitBtn1.Enabled:=false;
      if MyAction<>1 then
         begin
              FillFormFromMem;
              LabelFio.Caption:=Self.fio;
              LabelNamePod.Caption:=Name_Serv(ShifrPod);
              if Self.ShifrIdSBS>0 then
                 begin
                      BitBtn1.Show;
                      BitBtn1.Enabled:=true;
                 end;
         end;

end;

procedure TFormSBSUpd.BitBtn1Click(Sender: TObject);
var Y,M,D : word;
    SQLStmnt : string;
begin
 {     if MyAction<>1 then
         Exit;
 }
      if Self.ShifrIdSBS<=0 then Exit;
      DateFr:= DateTimePickerFr.Date;
      DateTo:= DateTimePickerTo.Date;
      if DateFr>=DateTo then
         begin
              ShowMessage('Неверно заданы даты справки');
              Exit;
         end;
      if YearOf(DateFr)<1992 then
         begin
              ShowMessage('Неверно заданы даты справки');
              Exit;
         end;
      if YearOf(DateTo)>CurrYear then
         begin
              ShowMessage('Неверно заданы даты справки');
              Exit;
         end;
      if pFIBQuery.Open then
         pFIBQuery.Close;
      if pFIBQuery.Transaction.Active then
         pFIBQuery.Transaction.Commit;
      DeCodeDate(Self.DateFr,Y,M,D);
   //   DFrS:=IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
      DeCodeDate(Self.DateTo,Y,M,D);
   //   DToS:=IntToStr(Y)+'-'+IntToStr(M)+'-'+IntToStr(D);
      if RadioGroupMode_Vy_Za.ItemIndex=1 then
         Mode_Vy_Za:=2
      else
         Mode_Vy_Za:=1;
      SQLStmnt := 'execute procedure PR_gen_sbs_Spr('+IntToStr(Self.ShifrIdSbs)+')';
      pFIBQuery.Transaction.StartTransaction;
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add(SQLStmnt);
      FormWait.Show;
      Application.ProcessMessages;
      pFIBQuery.ExecQuery;
      FormWait.Hide;
      Application.ProcessMessages;
      if pFIBQuery.Open then
         pFIBQuery.Close;
      if pFIBQuery.Transaction.Active then
         pFIBQuery.Transaction.Commit;
      FillMemFromSQL;
      FillFormFromMem;
      Application.ProcessMessages;
end;

procedure TFormSBSUpd.ButtonSaveClick(Sender: TObject);
begin
      if MyAction=1 then
         begin
              Self.Close;
              Exit;
         end;
      if MyAction<>2 then
         Exit;
      if ShifrIdSbs<1 then
         Exit;
      FillMemFromForm;
      FillSQLFromMem;
      Self.Close;


end;

end.
