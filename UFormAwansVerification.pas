unit UFormAwansVerification;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery,
  dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, ComCtrls, ImgList, ToolWin;

type
  TFormAwansVerification = class(TForm)
    cdsValidate: TClientDataSet;
    dsoValidate: TDataSource;
    cdsValidateid: TIntegerField;
    cdsValidateshifrgru: TIntegerField;
    cdsValidateshifrsta: TIntegerField;
    cdsValidatenamegru: TStringField;
    cdsValidatenmbofrecfixed: TIntegerField;
    cdsValidatesummafixed: TFloatField;
    cdsValidatenmbofreccurr: TIntegerField;
    cdsValidatesummacurr: TFloatField;
    qAwans: TpFIBQuery;
    trRead: TpFIBTransaction;
    dxDBGridVal: TdxDBGrid;
    dxDBGridValid: TdxDBGridMaskColumn;
    dxDBGridValshifrgru: TdxDBGridMaskColumn;
    dxDBGridValshifrsta: TdxDBGridMaskColumn;
    dxDBGridValnamegru: TdxDBGridMaskColumn;
    dxDBGridValnmbofrecfixed: TdxDBGridMaskColumn;
    dxDBGridValsummafixed: TdxDBGridMaskColumn;
    dxDBGridValnmbofreccurr: TdxDBGridMaskColumn;
    dxDBGridValsummacurr: TdxDBGridMaskColumn;
    ProgressBar1: TProgressBar;
    ToolBar1: TToolBar;
    ImageList1: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure dxDBGridValsummacurrCustomDraw(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
      AColumn: TdxDBTreeListColumn; const AText: String; AFont: TFont;
      var AColor: TColor; ASelected, AFocused: Boolean;
      var ADone: Boolean);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    wantedOwnerId:integer;
    procedure fillCurrInfo;

  public
    constructor Init(AOwner:TComponent;wantedId:integer);
    procedure createValidationSwod;
    { Public declarations }
  end;

var
  FormAwansVerification: TFormAwansVerification;

implementation
  uses uSQLUnit,scrutil,ScrLists,ScrDef,ScrIo,
  UFormAwansVerirficationByPerson;

  type pRec=^tRec;
       tRec=record
             shifrsta   : integer;
             shifrgru   : integer;
             nmbofrecfixed:integer;
             summafixed : real;
             nmbofreccurr:integer;
             summacurr : real;
            end;
  var list:TList;

constructor TFormAwansVerification.Init(AOwner:TComponent;wantedId:integer);
    begin
         self.Create(AOwner);
         self.wantedOwnerId:=wantedId;
    end;
procedure TFormAwansVerification.createValidationSwod;
 var SQLStmnt:string;
     rec:pRec;
     i:integer;
 begin
      shifrList.ClearAllSelected;
      list:=TList.Create;
      SQLStmnt:='select a.shifrgru,a.shifrsta,sum(a.summa),count(*) from tb_saved_awans_det a';
      SQLStmnt:=SQLStmnt+' where a.shifridowner='+intToStr(wantedOwnerId);
      SQLStmnt:=SQLStmnt+' group by 1,2';
      qAwans.SQL.Clear;
      qAwans.SQL.Add(SQLStmnt);
      qAwans.Transaction.StartTransaction;
      qAwans.ExecQuery;
      while (not qAwans.Eof) do
        begin
             rec := new(pRec);
             rec^.shifrgru      := qAwans.Fields[0].Value;
             rec^.shifrsta      := qAwans.Fields[1].Value;
             rec^.nmbofrecfixed := qAwans.Fields[3].Value;
             rec^.summafixed    := qAwans.Fields[2].Value;
             rec^.nmbofreccurr  := 0;
             rec^.summacurr     := 0;
             list.Add(rec);
             shifrList.SetSelected(rec^.shifrsta);
             qAwans.Next;
        end;
      qAwans.Close;
      qAwans.Transaction.commit;
      fillCurrInfo;
      cdsValidate.Open;
      if list.count>0 then
         for i:=1 to list.count do
             begin
                  cdsValidate.Append;
                  cdsValidateshifrsta.value:=pRec(list.items[i-1])^.shifrsta;
                  cdsValidateshifrgru.value:=pRec(list.items[i-1])^.shifrgru;
                  cdsValidatesummafixed.value:=pRec(list.items[i-1])^.summafixed;
                  cdsValidatenmbofrecfixed.value:=pRec(list.items[i-1])^.nmbofrecfixed;
                  cdsValidatesummacurr.value:=pRec(list.items[i-1])^.summacurr;
                  cdsValidatenmbofreccurr.value:=pRec(list.items[i-1])^.nmbofreccurr;
                  cdsValidatenamegru.value:=GET_IST_NAME(pRec(list.items[i-1])^.shifrgru);
                  cdsValidateid.value:=i;
                  cdsValidate.Post;
             end;
      FreeAndNil(list);

 end;
function compare(Item1:pointer;item2:pointer):integer;
 var retVal:integer;
 begin
      retVal:=0;
      if pRec(item1)^.shifrSta>pRec(item1)^.shifrSta then retVal:=-1
      else
      if pRec(item1)^.shifrSta<pRec(item1)^.shifrSta then retVal:=1
      else
      if pRec(item1)^.shifrGru<pRec(item1)^.shifrGru then retVal:=-1
      else
      if pRec(item1)^.shifrGru>pRec(item1)^.shifrGru then retVal:=1
      else
      retVal:=0;
      compare:=retVal;
 end;
procedure TFormAwansVerification.fillCurrInfo;
  var tmpNSRV,tmpNMES:integer;
      curr_person:person_ptr;
      curr_ud:ud_ptr;
      i_nsrv : integer;
      rec:Prec;
    procedure addUdToList;
     var i:integer;
         finded:boolean;
     begin
          finded:=false;
          if list.Count>0 then
             for i:=1 to list.Count do
                 if pRec(list.Items[i-1])^.shifrsta=curr_ud^.shifr then
                 if pRec(list.Items[i-1])^.shifrgru=curr_person^.gruppa then
                    begin
                         finded:=true;
                         inc(prec(list.Items[i-1])^.nmbofreccurr);
                         prec(list.Items[i-1])^.summacurr:=r10(r10(prec(list.Items[i-1])^.summacurr)+r10(curr_ud^.summa));
                         break;
                    end;
          if not finded then
             begin
                  rec:=new(pRec);
                  rec^.shifrsta      := curr_ud^.shifr;
                  rec^.shifrgru      := curr_person^.gruppa;
                  rec^.nmbofrecfixed := 0;
                  rec^.nmbofreccurr  := 1;
                  rec^.summafixed    := 0;
                  rec^.summacurr     := curr_ud^.summa;
                  list.Add(rec);
             end;
     end;
  begin
      tmpNSRV:=NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Min:=0;
      progressBar1.Max:=count_serv;
      progressBar1.Position:=0;
      ProgressBar1.Step:=1;

      for i_nsrv:=1 to COUNT_SERV do
          begin
            progressBar1.StepIt;
            application.ProcessMessages;
            nsrv:=i_nsrv;
            mkflnm;
            if not fileexists(fninf) then continue;
            getinf(false);
            curr_person:=head_person;
            while (curr_person<>nil) do
              begin
                   curr_ud:=curr_person^.ud;
                   while (curr_ud<>nil) do
                     begin
                          if (curr_ud.VYPLACHENO=get_out) then
                          if shifrList.IsSelected(curr_ud.shifr) then
                             addUdToList;
                          curr_ud:=curr_ud^.NEXT;
                     end;
                   curr_person:=curr_person^.NEXT;
              end;
            EMPTY_ALL_PERSON;

          end;
      list.Sort(@compare);
      NSRV:=tmpNSRV;
      MKFLNM;
      GETINF(TRUE);

  end;


{$R *.dfm}

procedure TFormAwansVerification.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormAwansVerification.FormShow(Sender: TObject);
begin
   //  createValidationSwod;
end;

procedure TFormAwansVerification.ToolButton1Click(Sender: TObject);
begin
     createValidationSwod;
end;

procedure TFormAwansVerification.dxDBGridValsummacurrCustomDraw(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxDBTreeListColumn; const AText: String; AFont: TFont;
  var AColor: TColor; ASelected, AFocused: Boolean; var ADone: Boolean);
 var val1:real;
     val2:real;
     i1,i2:integer;
     s1,s2,s3,s4,s5,s6:string;
     iErr1:integer;
     iErr2:integer;
begin
 //    ACanvas.FillRect(ARect);

  i1 := dxDBGridVal.ColumnByFieldName('summacurr').Index;
  i2 := dxDBGridVal.ColumnByFieldName('summafixed').Index;
  val1:=ANode.Values[i1];
  val2:=ANode.Values[i2];
  if abs(abs(val1)-abs(val2)) > 1.00 then
     AColor:=clRed;
end;

procedure TFormAwansVerification.ToolButton2Click(Sender: TObject);
begin
     FormAwansVerirficationByPerson:=TFormAwansVerirficationByPerson.init(self,self.wantedOwnerId,cdsValidateshifrgru.Value,cdsValidateshifrsta.Value);
     FormAwansVerirficationByPerson.show;
     FormAwansVerirficationByPerson.createValidationSwod;

end;

end.
