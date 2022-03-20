unit UFormCNSrd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  ComCtrls,ScrDef, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet;

type
  TFormCNSrd = class(TForm)
    LabelFr: TLabel;
    dtFR: TDateTimePicker;
    LabelTo: TLabel;
    dtTo: TDateTimePicker;
    LabelSRD: TLabel;
    dxCalcEditSrd: TdxCalcEdit;
    LabelSta: TLabel;
    cbShifrSta: TComboBox;
    LabelTab: TLabel;
    cbTabel: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsShifr: TpFIBDataSet;
    trRead: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    curr_person:PERSON_PTR;
    procedure DecodeCnSRD(var dtfr1:TDateTime;var dtTo1:TDateTime;var srd_summa:Real;var shifrSta:Integer;var ShifrTabel:integer);
    procedure EncodeCnSRD;
    function unformatDate(s:string):TDateTime;
    function formatDate(dt:TDateTime):String;
    { Private declarations }
  public
    { Public declarations }
     constructor myCreate(AOwner:TComponent;curr_person:person_ptr);
  end;

var
  FormCNSrd: TFormCNSrd;

implementation
  uses UFibModule, scrLists, DateUtils, scrUtil;

{$R *.dfm}
constructor TFormCNSrd.myCreate(AOwner:TComponent;curr_person:person_ptr);
 var i:Integer;
     s:string;
     dt:TDateTime;
 begin
      inherited Create(AOwner);
      Self.curr_person:=curr_person;
      for i:=0 to ShifrList.Count-1 do
          begin
               if pShifrRec(ShifrList.Items[i])^.Add then
                  begin
                       s:=IntToStr(PShifrRec(ShifrList.Items[i])^.Shifr)+' '+
                          Trim(PShifrRec(ShifrList.Items[i])^.Short_Name);
                       cbShifrSta.Items.Add(s);
                  end;
          end;
      for i:=1 to MAX_TABEL_KOD do
          begin
               s:=SHIFR_TABEL[i]+' '+Trim(NAME_TABEL[i]);
               cbTabel.Items.Add(s);
          end;
      dt:=EncodeDate(CURRYEAR,NMES,1);
      dtFR.Date:=dt;
      dtTo.Date:=incDay(IncMonth(dt),-1);
 end;
function TFormCNSrd.formatDate(dt:TdateTime):String;
 var retVal   : string;
     y,m,d    : word;
     ys,ms,ds : string;
 begin
      SysUtils.DecodeDate(dt,y,m,d);
      ys:=IntToStr(y);
      ms:=IntToStr(m);
      ds:=IntToStr(d);
      if m<10 then ms:='0'+ms;
      if d<10 then ds:='0'+ds;
      retVal:=ys+'-'+ms+'-'+ds;
      formatDate:=Retval;
 end;
function TFormCNSrd.unformatDate(s:string):TDateTime;
 var retValDt:TDateTime;
     y,m,d:Integer;
     ys,ms,ds:String;
     iVal,iErr:Integer;
 begin
      y:=2022;
      m:=2;
      d:=1;
      ys:=Copy(s,1,4);
      Val(ys,iVal,iErr);
      if iErr=0 then
         y:=iVal;
      ms:=Copy(s,6,2);
      Val(ms,iVal,iErr);
      if iErr=0 then
         m:=iVal;
      ds:=Copy(s,9,2);
      Val(ds,iVal,iErr);
      if iErr=0 then
         d:=iVal;
      retValDt:=SysUtils.EncodeDate(y,m,d);
      result:=retValDt;
 end;

procedure TFormCNSrd.DecodeCnSRD(var dtfr1:TDateTime;var dtTo1:TDateTime;var srd_summa:Real;var shifrSta:Integer;var ShifrTabel:integer);
 var curr_cn:CN_PTR;
     finded:Boolean;
     aVal:Real;
     iVal,iErr:Integer;
     s,s1:string;
     y1,m1,d1,y2,m2,d2:word;
     ys1,ms1,ds1,ys2,ms2,ds2:string;
     i:Integer;
     dt:TDateTime;
 begin
      dt:=EncodeDate(CURRYEAR,NMES,1);
      dtFR1:=dt;
      dtTo1:=incDay(IncMonth(dt),-1);
      srd_summa:=0.00;
      shifrSta:=0;
      shifrTabel:=0;
      finded:=False;
      curr_cn:=curr_person^.cn;
      while (curr_cn<>nil) do
        begin
             if curr_cn^.shifr=srd_Cn_shifr+limit_cn_base then
             if curr_cn^.kod=100 then
                begin
                     finded:=True;
                     Break;
                end;
             curr_cn:=curr_cn^.Next;
        end;
      if not finded then
         Exit;
      shifrSta:=curr_cn^.PRIM;
      srd_summa:=curr_cn^.SUMMA;
      curr_cn^.PRIM_1:=Trim(curr_cn^.prim_1);
      if Length(curr_cn^.PRIM_1)>23 then
         begin
              s:=Copy(curr_cn^.PRIM_1,23,Length(curr_cn^.PRIM_1)-23);
              s:=Trim(s);
              Val(s,iVal,iErr);
              if iErr=0 then
                 shifrTabel:=iVal;
         end;
      if Length(curr_cn^.PRIM_1)>10 then
         begin
              s:=Copy(curr_cn^.prim_1,1,10);
              dtFr1:=self.unformatDate(s);
         end;
      if Length(curr_cn^.PRIM_1)>21 then
         begin
              s:=Copy(curr_cn^.prim_1,12,10);
              dtTo1:=Self.unformatDate(s);
         end
 end;
procedure TFormCNSrd.EncodeCnSRD;
 var curr_cn:CN_PTR;
     finded:Boolean;
     aVal:Real;
     iVal,iErr:Integer;
     s,s1,s2:string;
     shifrSta,ShifrTabel:Integer;
     i:Integer;
 begin
      finded:=False;
      curr_cn:=curr_person^.cn;
      while (curr_cn<>nil) do
        begin
             if curr_cn^.shifr=srd_Cn_shifr+limit_cn_base then
             if curr_cn^.kod=100 then
                begin
                     finded:=True;
                     Break;
                end;
             curr_cn:=curr_cn^.Next;
        end;
      if not finded then
         begin
              make_cn(curr_cn,curr_person);
              curr_cn^.SHIFR := srd_Cn_shifr+limit_cn_base;
              curr_cn^.KOD   := 100;
         end;
      s:=Trim(dxCalcEditSrd.text);
      Val(s,aVal,iErr);
      if iErr<>0 then aVal:=0;
      curr_cn^.SUMMA:=aVal;
      shifrSta:=0;
      if cbShifrSta.itemIndex>=0 then
          begin
               s := Trim(cbshifrsta.Text);
               s1 := '';
               for i:=1 to Length(s) do
                   begin
                        if s[i] in ['0'..'9'] then
                           s1:=s1+s[i]
                        else
                           Break;
                   end;
               if length(s1)>0 then
                  begin
                       Val(s1,iVal,ierr);
                       if iErr=0 then
                          shifrSta:=iVal;
                  end
          end;
      curr_cn^.PRIM:=shifrSta;
      s1:=self.formatDate(dtFR.Date);
      s2:=self.formatDate(dtFR.Date);
      s:=s1+':'+s2;
      s:=s+' '+IntToStr(shifrTabel);
      curr_cn^.PRIM_1:=Trim(s);
 end;

procedure TFormCNSrd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

end.
