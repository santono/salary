unit UFormUpdatePSB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxGroupBox, cxRadioGroup, cxDBEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, Buttons, cxMaskEdit, cxButtonEdit;

type
  TFormUpdatePSB = class(TForm)
    cxDBTextEditFAM: TcxDBTextEdit;
    cxDBTextEditNam: TcxDBTextEdit;
    cxDBTextEditOtc: TcxDBTextEdit;
    cxDBTextEditPassport: TcxDBTextEdit;
    cxDBRadioGroup1: TcxDBRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxDBButtonEditTabno: TcxDBButtonEdit;
    cxDBTextEditNomerCount: TcxDBMaskEdit;
    cxDBTextEditSNILS: TcxDBMaskEdit;
    cxDBTextEditINN: TcxDBMaskEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxDBTextEditNomerCountPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
    procedure cxDBTextEditSNILSPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption;
      var Error: Boolean);
  private
    ActionClarion:Integer;
    { Private declarations }
    function ValidateNOMER_SCHETA:Boolean;
    function ValidateSNILS:Boolean;
    function ValidateINN:Boolean;

  public
    constructor myCreate(ActionClarion:integer);

    { Public declarations }
  end;

var
  FormUpdatePSB: TFormUpdatePSB;

implementation

{$R *.dfm}
  uses UFormBrowsePSB,ScrUtil,UFrmFindKadryFB,db;

constructor TFormUpdatePSB.myCreate(ActionClarion:integer);
 var Fraza:string;
     i:Integer;
 begin
      inherited Create(Nil);
      Self.ACtionClarion:=ActionClarion;
      Fraza:='';
      if ActionClarion=1 then
         Fraza:='Вставка записи'
      else
      if ActionClarion=2 then
         Fraza:='Редактирование записи'
      else
      if ActionClarion=3 then
         Fraza:='Удаление записи';
      Caption:=Fraza;
      if (ActionClarion=2) or (ActionClarion=3) then
      Caption:=Caption+' '+intToStr(FormBrowsePSB.dsPSBTABNO.value)+
          ' '+FormBrowsePSB.dsPSBFAM.Value+
          ' '+FormBrowsePSB.dsPSBNAM.Value+
          ' '+FormBrowsePSB.dsPSBOTC.Value;
      if ActionClarion=1 then
         FormBrowsePSB.dsoPSB.DataSet.Insert
      else
      if ActionClarion=2 then
         begin
              FormBrowsePSB.dsoPSB.Edit;
//              cxDBButtonEditTn.Enabled:=false;
//              cxDBTextEditFIO.Enabled:=False;
         end;



 end;


procedure TFormUpdatePSB.BitBtn1Click(Sender: TObject);
 var i:Integer;
begin
    if not ValidateNOMER_SCHETA then
       begin
            ShowMessage('Неверный номер счета в ПСБ');
            Exit;
       end;
    if not ValidateSNILS then
       begin
            ShowMessage('Неверны СНИЛС');
            Exit;
       end;
    if not ValidateINN then
       begin
            ShowMessage('Неверный ИНН');
            Exit;
       end;
    if FormBrowsePSB.dsPSB.State=dsEdit then
       i:=10;
    FormBrowsePSB.dsPSB.Post;
end;

procedure TFormUpdatePSB.cxDBButtonEdit1PropertiesButtonClick(
  Sender  : TObject; AButtonIndex: Integer);
var state : TDataSetState;
    fio   : string;
    fam, nam, otc : ShortString;
begin
    state := FormBrowsePSB.dsPSB.State;
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                    state := FormBrowsePSB.dsPSB.State;
                    FormBrowsePSB.dsPSBTABNO.Value := getTabno;
                    fio:=getFio;
                    SplitFIO(Fio,FAM,NAM,OTC);
                    FormBrowsePSB.dsPSBFAM.Value:=fam;
                    FormBrowsePSB.dsPSBNAM.Value:=Nam;
                    FormBrowsePSB.dsPSBOTC.Value:=otc;
               end;
         finally
{            free;}
         end;
       Self.Repaint;
end;
function TFormUpdatePSB.ValidateNOMER_SCHETA:Boolean;
 var s:String;
     i:Integer;
     isRezident:Boolean;
 begin
      isRezident:=True;
      if cxDBRadioGroup1.ItemIndex=1 then
         isRezident:=False;
      s:=Trim(cxDBTextEditNomerCount.Text);
      if s='' then
         begin
              ValidateNOMER_SCHETA:=false;
              Exit;
         end;
      if Length(s)<>20 then
         begin
              ValidateNOMER_SCHETA:=false;
              Exit;
         end;
       for i:=1 to 20 do
         if not (s[i]  in ['0'..'9']) then
            begin
              ValidateNOMER_SCHETA:=false;
              Exit;
            end;
       if not (((Pos('408178',s)=1) and isRezident)
            or ((Pos('408208',s)=1) and not isRezident)) then
            begin
              ValidateNOMER_SCHETA:=false;
              Exit;
            end;
       ValidateNOMER_SCHETA:=True;
 end;

function TFormUpdatePSB.ValidateSNILS:Boolean;
 var s:String;
     i:Integer;
 begin
 //     s:=Trim(cxDBTextEditSNILS.Text);
 //     showMessage(s);
      if s='' then
         begin
              ValidateSNILS:=true;
              Exit;
         end;
      if Trim(s)='-   -' then
         begin
              ValidateSNILS:=true;
              Exit;
         end;
      if Length(s)<>14 then
         begin
              ValidateSNILS:=false;
              Exit;
         end;
       for i:=1 to 14 do
         if not (s[i]  in ['0'..'9',' ','-']) then
            begin
              ValidateSNILS:=false;
              Exit;
            end;
       if Pos('-',s)<>4 then
            begin
              ValidateSNILS:=false;
              Exit;
            end;
       if Pos(' ',s)<>12 then
            begin
              ValidateSNILS:=false;
              Exit;
            end;
       ValidateSNILS:=True;
 end;
function TFormUpdatePSB.ValidateINN:Boolean;
 var s:String;
     i:Integer;
 begin
      s:=Trim(cxDBTextEditINN.Text);
      if s='' then
         begin
              ValidateINN:=true;
              Exit;
         end;
      if Length(s)<>12 then
         begin
              ValidateINN:=false;
              Exit;
         end;
       for i:=1 to 12 do
         if not (s[i]  in ['0'..'9']) then
            begin
              ValidateINN:=false;
              Exit;
            end;
       ValidateINN:=True;
 end;

procedure TFormUpdatePSB.cxDBTextEditNomerCountPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
     error:=false;
     if not ValidateNOMER_SCHETA then
        begin
             error:=True;
             ErrorText:='Неверный номер лицевого счета';
        end;
end;

procedure TFormUpdatePSB.cxDBTextEditSNILSPropertiesValidate(
  Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption;
  var Error: Boolean);
begin
      if DisplayValue='___-___-___ __' then
         error:=false;
end;

end.
