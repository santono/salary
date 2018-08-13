unit UFormShtRaspRpt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet;

type
  TFormShtRaspRpt = class(TForm)
    frxReport1: TfrxReport;
    frxDBdsShtRasp: TfrxDBDataset;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormShtRaspRpt: TFormShtRaspRpt;

implementation
  uses UPODataModule;

{$R *.dfm}

procedure TFormShtRaspRpt.FormShow(Sender: TObject);
begin
     frxReport1.ShowReport;
     ModalResult:=mrOk;
     Close;
    
end;

procedure TFormShtRaspRpt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormShtRaspRpt.FormActivate(Sender: TObject);
begin
     ModalResult:=mrOk;
     Close;
end;

procedure TFormShtRaspRpt.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin

     if VarName='NamePod' then
        Value:=dmPO.pFIBdsShtatRasPedNamePod.Value
     else if VarName='DataZa' then
        Value:=DateToStr(dmPo.pFIBdsShtatRasPedDATEFR.Value);
   
end;

end.
