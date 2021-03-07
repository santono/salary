unit UFormECBPerson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, scrdef,
  ScrECB,ScrECBService;

type
  TFormECBPerson = class(TForm)
    gbTB5: TGroupBox;
    gbTB6: TGroupBox;
    gbTB7: TGroupBox;
    cbZO6: TComboBox;
    Label1: TLabel;
    cbPayTP: TComboBox;
    Label2: TLabel;
    cbOTK: TCheckBox;
    cbNRC: TCheckBox;
    cbEXP: TCheckBox;
    gbDay: TGroupBox;
    meKDPTV: TMaskEdit;
    UpDown1: TUpDown;
    Label3: TLabel;
    meKDNP: TMaskEdit;
    meKDNZP: TMaskEdit;
    meKDVP: TMaskEdit;
    UpDown2: TUpDown;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown3Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDown4Click(Sender: TObject; Button: TUDBtnType);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    personRec6Service:TPersonRec6Service;
    personRec6:TPersonRec6;
  public
    constructor myCreate(AOwner: TComponent;Curr_person:person_ptr);
    { Public declarations }
  end;

var
  FormECBPerson: TFormECBPerson;


implementation
 const lenZO6=9;
 const lenPayTp=3;
 const zo6Items:array[1..lenZO6] of string=(
  ' 1 - обычный','2 - инвалид - обычный',
  '25 - научный стаж','26 - договора подряда',
  '29 - больничный','32 - научный инвалид',
  '36 - больничный инвалид','42 - декретный',
  '43 - декретный - инвалидов');
 const zo6ItemsNo:array[1..lenZO6] of integer=(
  1,2,25,26,29,32,36,42,43);
 const PayTpItems:array[1..lenPayTp] of string=(
  ' 0 - зарплата (PayTP - не указывается)',
  '10 - отпускные',
  '13 - разница между мин зп и зп работника'
 );
 const PayTpNo:array[1..lenPayTp] of integer=(
  0,10,13);



{$R *.dfm}

constructor  TFormECBPerson.myCreate(AOwner: TComponent;Curr_person:person_ptr);
 var curr_cn:CN_PTR;
     finded:Boolean;
 begin
      Self.Create(AOwner);
      personRec6Service:=TPersonRec6Service.init(Curr_person);
      personRec6:=nil;
//      PersonRec6.Create;
      finded:=false;
      curr_cn:=curr_person^.CN;
      while (curr_cn<>nil) do
        begin
             if curr_cn^.shifr=REC6CN_SHIFR+LIMIT_CN_BASE then
                begin
                     finded:=True;
                     personRec6:=TPersonRec6.CreateFromCN(curr_cn^.PRIM_1);
                     Break;
                end;
             curr_cn:=curr_cn^.Next;
        end;
      if not finded then
         begin
              personRec6Service.fillRec6Person;
              finded:=false;
              curr_cn:=curr_person^.CN;
              while (curr_cn<>nil) do
                begin
                     if curr_cn^.shifr=REC6CN_SHIFR+LIMIT_CN_BASE then
                        begin
                             finded:=True;
                             personRec6:=TPersonRec6.CreateFromCN(curr_cn^.PRIM_1);
                             Break;
                        end;
                     curr_cn:=curr_cn^.Next;
                end;
         end;
 end;
procedure TFormECBPerson.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     personRec6.Free;
     Action:=caFree;
end;

procedure TFormECBPerson.UpDown1Click(Sender: TObject; Button: TUDBtnType);
var s:string;
    iVal,iValOld,iErr:Integer;
begin
     s:=Trim(meKDPTV.Text);
     if Length(s)<2 then
        iVal:=0
     else
        begin
             Val(s,iVal,iErr);
             if iErr>0 then
                iVal:=0;
             if iVal>31 then iVal:=31
        end;
     iValOld:=iVal;
     if Button=btNext then
        if iVal<31 then inc(iVal)
        else
     else
     if Button=btPrev then
        if iVal>0 then Dec(iVal);
     if iVal>iValOld then
        begin
             Str(iVal:2,S);
             meKDPTV.Text:=s;
             Application.ProcessMessages;
        end
end;

procedure TFormECBPerson.UpDown2Click(Sender: TObject; Button: TUDBtnType);
var s:string;
    iVal,iValOld,iErr:Integer;
begin
     s:=Trim(meKDNP.Text);
     if Length(s)<2 then
        iVal:=0
     else
        begin
             Val(s,iVal,iErr);
             if iErr>0 then
                iVal:=0;
             if iVal>31 then iVal:=31
        end;
     iValOld:=iVal;
     if Button=btNext then
        if iVal<31 then inc(iVal)
        else
     else
     if Button=btPrev then
        if iVal>0 then Dec(iVal);
     if iVal>iValOld then
        begin
             Str(iVal:2,S);
             meKDNP.Text:=s;
             Application.ProcessMessages;
        end
end;

procedure TFormECBPerson.UpDown3Click(Sender: TObject; Button: TUDBtnType);
var s:string;
    iVal,iValOld,iErr:Integer;
begin
     s:=Trim(meKDNZP.Text);
     if Length(s)<2 then
        iVal:=0
     else
        begin
             Val(s,iVal,iErr);
             if iErr>0 then
                iVal:=0;
             if iVal>31 then iVal:=31
        end;
     iValOld:=iVal;
     if Button=btNext then
        if iVal<31 then inc(iVal)
        else
     else
     if Button=btPrev then
        if iVal>0 then Dec(iVal);
     if iVal>iValOld then
        begin
             Str(iVal:2,S);
             meKDNZP.Text:=s;
             Application.ProcessMessages;
        end
end;
procedure TFormECBPerson.UpDown4Click(Sender: TObject; Button: TUDBtnType);
var s:string;
    iVal,iValOld,iErr:Integer;
begin
     s:=Trim(meKDVP.Text);
     if Length(s)<2 then
        iVal:=0
     else
        begin
             Val(s,iVal,iErr);
             if iErr>0 then
                iVal:=0;
             if iVal>31 then iVal:=31
        end;
     iValOld:=iVal;
     if Button=btNext then
        if iVal<31 then inc(iVal)
        else
     else
     if Button=btPrev then
        if iVal>0 then Dec(iVal);
     if iVal>iValOld then
        begin
             Str(iVal:2,S);
             meKDVP.Text:=s;
             Application.ProcessMessages;
        end
end;

procedure TFormECBPerson.FormCreate(Sender: TObject);
var i:Integer;
begin
     cbZO6.Items.Clear;
     cbZO6.ItemIndex := 0;
     for i:=1 to lenZO6 do
         begin
              cbZO6.Items.Add(zo6Items[i]);
              if personRec6.zo=zo6ItemsNo[i] then
                 cbZO6.ItemIndex := i-1;
         end;
     cbPayTp.Items.Clear;
     cbPayTp.ItemIndex := 0;
     for i:=1 to lenPayTp do
         begin
              cbPayTP.Items.Add(PayTpItems[i]);
              if personRec6.payTp=PayTpNo[i] then
                 cbPayTP.ItemIndex:=i-1;
         end;
     cbOTK.Checked:=false;
     if personRec6.otk > 0 then
        cbOTK.Checked:=True;
     cbEXP.Checked:=false;
     if personRec6.exp > 0 then
        cbEXP.Checked:=True;
     cbNRC.Checked:=false;
     if personRec6.nrc > 0 then
        cbNRC.Checked:=True;

end;

end.
