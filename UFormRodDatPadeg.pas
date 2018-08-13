unit UFormRodDatPadeg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormRodDatPadeg = class(TForm)
    BitBtnStart: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    procedure BitBtnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRodDatPadeg: TFormRodDatPadeg;

implementation

   uses UPODataModule,UPadegDLL;

{$R *.dfm}

procedure TFormRodDatPadeg.BitBtnStartClick(Sender: TObject);
var fio,s:string;
    icnt:Integer;
    f,i,o:string;
   function SplitFIO:Boolean;
   var s1,S2,S3:string;
       i1,i2:Integer;
   begin
        SplitFIO:=False;
        s1:=Trim(S);
        i1:=Pos(' ',S1);
        if i1>0 then
           begin
                f:=Copy(s1,1,I1-1);
                s2:=Copy(s1,I1,Length(S1)-i1+1);
                s2:=Trim(S2);
                i2:=Pos(' ',S2);
                if i2>0 then
                   begin
                        i:=Copy(s2,1,I2-1);
                        o:=Copy(s2,I2,Length(S2)-i2+1);
                        o:=Trim(o);
                        if ((Length(f)>0) and
                            (Length(I)>0) and
                            (Length(O)>0)) then
                            SplitFIO:=True;
                   end;

           end;

   end;

begin
     dmPO.pFIBdsKadry.Transaction.StartTransaction;
     dmPo.pFIBdsKadry.Active:=true;
     icnt:=0;
     while not dmPo.pFIBdsKadry.Eof do
        begin
             Inc(icnt);
             label2.Caption:='Записей '+intToStr(icnt);
             Application.processMessages;
             FIO:=Trim(dmPO.pFIBdsKadryPIB.Value);
             s:=getDatelPadegFIO(FIO);
             SplitFIO;
             s:=AnsiUpperCase(Trim(F))+' '+trim(i)+' '+trim(o);
             dmPo.pFIBdsKadry.Edit;
             dmPO.pFIBdsKadryPIB_DAT_PAD.Value:=Trim(s);
             s:=getRoditPadegFIO(FIO);
             dmPO.pFIBdsKadryPIB_ROD_PAD.Value:=Trim(s);
             dmPo.pFIBdsKadry.post;
             dmPo.pFIBdsKadry.Next;
        end;
     dmPo.pFIBdsKadry.Active:=false;
     if dmPO.pFIBdsKadry.Transaction.Active then
        dmPO.pFIBdsKadry.Transaction.Commit;
     if dmPO.pFIBdsKadry.UpdateTransaction.Active then
        dmPO.pFIBdsKadry.UpdateTransaction.Commit;

    ShowMessage('Готово');
end;

end.
