unit UFormTestIOSemaphore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, FIBDataSet, pFIBDataSet;

type
  TFormTestIOSemaphore = class(TForm)
    EditNSRV: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabelResult: TLabel;
    pFIBDataSet1: TpFIBDataSet;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTestIOSemaphore: TFormTestIOSemaphore;

implementation
   USes scrdef, scrutil;

{$R *.dfm}

procedure TFormTestIOSemaphore.BitBtn2Click(Sender: TObject);
begin
     Close;
end;

procedure TFormTestIOSemaphore.BitBtn1Click(Sender: TObject);
 var s:string;
     iVal,iErr:Integer;
     iBool:Boolean;
     NSRVtmp:Integer;
begin
     s:=Trim(EditNSRV.Text);
     val(s,iVal,iErr);
     if iErr>0 then Exit;
     NSRVtmp:=NSRV;
     NSRV:=iVal;
     iBool:=getIOSemaphore;
     if iBool then
        labelResult.Caption:='true'
     else
        labelResult.Caption:='false';
     Application.ProcessMessages;
     NSRV:=NSRVtmp;
end;

procedure TFormTestIOSemaphore.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;

end;

end.
