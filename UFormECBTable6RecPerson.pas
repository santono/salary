unit UFormECBTable6RecPerson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask,ScrECB,
  scrdef, Buttons;

type
  TFormECBTable6RecPerson = class(TForm)
    Label2: TLabel;
    Label1: TLabel;
    cbZO6: TComboBox;
    cbPayTP: TComboBox;
    cbOTK: TCheckBox;
    cbNRC: TCheckBox;
    gbDay: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    meKDPTV: TMaskEdit;
    UpDown1: TUpDown;
    meKDNP: TMaskEdit;
    meKDNZP: TMaskEdit;
    meKDVP: TMaskEdit;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    cbEXP: TCheckBox;
    mePayYear: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    mePayMnth: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    personRec6:TPersonRec6;
    curr_cn:CN_PTR;
    procedure SaveRecord;

  public
    constructor myCreate(AOwner: TComponent;Curr_cn:cn_ptr);
  end;

var
  FormECBTable6RecPerson: TFormECBTable6RecPerson;

implementation
 uses ScrUtil;

{$R *.dfm}
constructor  TFormECBTable6RecPerson.myCreate(AOwner: TComponent;Curr_cn:cn_ptr);
 var finded:Boolean;
 begin
      Self.Create(AOwner);
      personRec6:=TPersonRec6.CreateFromCN(curr_cn^.PRIM_1);
      Self.curr_cn:=Curr_cn;
 end;

procedure TFormECBTable6RecPerson.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     personRec6.Free;
     Action:=caFree;
end;


procedure TFormECBTable6RecPerson.FormCreate(Sender: TObject);
var i:Integer;
    s:string;
begin
     cbZO6.Items.Clear;
     cbZO6.ItemIndex := 0;
     for i:=1 to lenZO6 do
         begin
              cbZO6.Items.Add(zo6Items[i]);
              if Assigned(personRec6) then
              if personRec6.zo=zo6ItemsNo[i] then
                 cbZO6.ItemIndex := i-1;
         end;
     cbPayTp.Items.Clear;
     cbPayTp.ItemIndex := 0;
     for i:=1 to lenPayTp do
         begin
              cbPayTP.Items.Add(PayTpItems[i]);
              if Assigned(personRec6) then
              if personRec6.payTp=PayTpNo[i] then
                 cbPayTP.ItemIndex:=i-1;
         end;
     cbOTK.Checked:=false;
     if Assigned(personRec6) then
     if personRec6.otk > 0 then
        cbOTK.Checked:=True;
     cbEXP.Checked:=false;
     if Assigned(personRec6) then
     if personRec6.exp > 0 then
        cbEXP.Checked:=True;
     cbNRC.Checked:=false;
     if Assigned(personRec6) then
     if personRec6.nrc > 0 then
        cbNRC.Checked:=True;
     s:='';
     if personRec6.payYear>0 then
        Str(personRec6.payYear:4,s);
     mePayYear.Text:=s;
     s:='';
     if personRec6.payMnth>0 then
        Str(personRec6.payMnth:2,s);
     mePayMnth.Text:=s;
     s:='';
     meKDPTV.Text:=s;
     if personRec6.kdPtv>0 then
        begin
             Str(personRec6.kdPtv:2,s);
             meKDPTV.Text:=s;
             UpDown1.Position:=personRec6.kdPtv;
        end;
     s:='';
     meKDNP.Text:=s;
     if personRec6.kdNp>0 then
        begin
             Str(personRec6.kdNp:2,s);
             meKDNP.Text:=s;
             UpDown2.Position:=personRec6.kdNP;
        end;
     s:='';
     meKDNZP.Text:=s;
     if personRec6.kdNZp>0 then
        begin
             Str(personRec6.kdNZp:2,s);
             meKDNZP.Text:=s;
             UpDown3.Position:=personRec6.kdNZp;
        end;
     s:='';
     meKDVP.Text:=s;
     if personRec6.kdVP>0 then
        begin
             Str(personRec6.kdVP:2,s);
             meKDVP.Text:=s;
             UpDown4.Position:=personRec6.kdVp;
        end;
end;

procedure TFormECBTable6RecPerson.BitBtn1Click(Sender: TObject);
begin
     SaveRecord;
     Close;
end;
procedure TFormECBTable6RecPerson.SaveRecord;
  var i,j,zo,payTp,PayYear,PayMnth,
      kdPTV,kdNp,kdNZP,kdVP,lastDay,
      Exp,otk,nrc:Integer;
      changed:boolean;
      iVal,iErr:Integer;
      dt:TDate;
  begin
       dt:=EncodeDate(CURRYEAR,NMES,1);
       lastDay:=lenMonth(dt);
       zo:=0;
       changed:=false;
       j:=cbZO6.ItemIndex;
       Inc(j);
       if (j>0) and (j<=lenZO6) then
           zo:=zo6ItemsNo[j];
       if zo<>personRec6.zo then
          changed:=True;
       if zo>0 then
          personRec6.zo:=zo;
       PayTp:=0;
       if cbPayTP.ItemIndex=1 then
          PayTp:=10
       else
       if cbPayTP.ItemIndex=2 then
          PayTp:=13;
       if PayTp<>personRec6.PayTp then
          changed:=True;
       personRec6.PayTp:=payTp;
       PayYear:=0;
       Val(mePayYear.Text,iVal,iErr);
       if iErr=0 then
          if (iVal=0) or
              ((iVal>CurrYear-2) and (iVal<currYear+2)) then
              payYear:=iVal;
       if PayYear<>personRec6.PayYear then
          changed:=True;
       personRec6.PayYear:=PayYear;
       PayMnth:=0;
       Val(mePayMnth.text,iVal,iErr);
       if iErr=0 then
          if ((iVal>0) and (iVal<13)) then
              payMnth:=iVal;
       if PayMnth<>personRec6.PayMnth then
          changed:=True;
       personRec6.PayMnth:=PayMnth;
       KdPTV:=0;
       if (UpDown1.Position>=0) and (UpDown1.Position<=lastDay) then
          kdPTV:=UpDown1.Position;
       if kdPTV<>personRec6.kdPtv then
          changed:=True;
       personRec6.KdPTV:=kdPtv;
       KdNP:=0;
       if (UpDown2.Position>=0) and (UpDown2.Position<=lastDay) then
          kdNP:=UpDown2.Position;
       if kdNP<>personRec6.kdNP then
          changed:=True;
       personRec6.KdNP:=kdNP;
       KdNZP:=0;
       if (UpDown3.Position>=0) and (UpDown3.Position<=lastDay) then
          kdNZP:=UpDown3.Position;
       if kdNZP<>personRec6.kdNZP then
          changed:=True;
       personRec6.KdNZP:=kdNZP;
       KdVP:=0;
       if (UpDown4.Position>=0) and (UpDown4.Position<=lastDay) then
          kdVP:=UpDown3.Position;
       if kdVP<>personRec6.kdVP then
          changed:=True;
       personRec6.KdVP:=kdVP;
       exp:=0;
       if cbEXP.Checked then
          exp:=1;
       if exp<>personRec6.exp then
          changed:=True;
       personRec6.exp:=exp;
       otk:=0;
       if cbOTK.Checked then
          otk:=1;
       if otk<>personRec6.otk then
          changed:=True;
       personRec6.otk:=otk;
       nrc:=0;
       if cbNRC.Checked then
          nrc:=1;
       if nrc<>personRec6.nrc then
          changed:=True;
       personRec6.nrc:=nrc;

       if changed then
          curr_cn^.PRIM_1:=personRec6.packRec6;
  end;
end.
