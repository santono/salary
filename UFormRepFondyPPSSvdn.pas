unit UFormRepFondyPPSSvdn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Mask, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, Buttons, frxClass, frxDBSet, frxExportRTF,
  frxExportXLS, frxExportPDF;

type
  TFormRepFondyPPSSvdn = class(TForm)
    MaskEdit1: TMaskEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    dsFondy: TpFIBDataSet;
    trRead: TpFIBTransaction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    dsFondyNOMER: TFIBIntegerField;
    dsFondyNAME: TFIBStringField;
    dsFondySUMMATOT: TFIBBCDField;
    dsFondySUMMAPRE: TFIBBCDField;
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure UpDown1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
  private
    wantedYear:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRepFondyPPSSvdn: TFormRepFondyPPSSvdn;

implementation
  USes UFibModule,scrDef,uFormWait;

{$R *.dfm}

procedure TFormRepFondyPPSSvdn.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action := caFree;
end;

procedure TFormRepFondyPPSSvdn.UpDown1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
     wantedYear:=UpDown1.Position;
     MaskEdit1.Text:=IntToStr(wantedYear);

end;

procedure TFormRepFondyPPSSvdn.BitBtn1Click(Sender: TObject);
begin
     BitBtn1.Enabled:=False;
     wantedYear:=UpDown1.Position;
     dsFondy.Params[0].AsInteger:=wantedYear;
     dsFondy.Params[1].AsInteger:=1;
     FormWait.Show;
     dsFondy.Transaction.StartTransaction;
     dsFondy.Open;
     frxReport1.ShowReport;
     dsFondy.Close;
     dsFondy.Transaction.Commit;
     FormWait.Hide;
     BitBtn1.Enabled:=False;
end;

procedure TFormRepFondyPPSSvdn.FormCreate(Sender: TObject);
begin
     wantedYear:=CURRYEAR-1;
     UpDown1.Position:=wantedYear;
     UpDown1.Max:=UpDown1.Position+1;
     UpDown1.Min:=UpDown1.Position-20;
     MaskEdit1.Text:=IntToStr(wantedYear);

end;

procedure TFormRepFondyPPSSvdn.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'Y')=0 then
        Value:=intToStr(wantedYear);
end;

end.
