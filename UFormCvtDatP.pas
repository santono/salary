unit UFormCvtDatP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormCvtDatP = class(TForm)
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
        procedure CvtDatP;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCvtDatP: TFormCvtDatP;

implementation
  uses UPODataModule;

{$R *.dfm}

procedure TFormCvtDatP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ACtion:=caFree;
end;
procedure TFormCvtDatP.CvtDatP;
  var S:string;
      F,I,O:String;
      iCount:Integer;
      Ch:Char;
      need:Boolean;
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
  function ConvertFIO:Boolean;
   begin
        f:=AnsiUpperCase(F);
        if Copy(O,Length(O)-1,2)='��' then
           begin
                 o:=o+'�';
                 if (Copy(F,Length(F),1)='�') then
                    F:=Copy(F,1,Length(F)-1)+'�'
                 else if (Copy(F,Length(F)-1,2)='��') then
                    F:=F+'�'
                 else if (Copy(F,Length(F)-1,2)='��') then
                    F:=F+'�'
                 else if (Copy(F,Length(F)-1,2)='��') then
                    F:=F+'�'
                 else if (Copy(F,Length(F)-1,2)='��') then
                    F:=Copy(F,1,Length(F)-2)+'���'
                 else if (Copy(F,Length(F),1)='�') then
                    F:=F+'�'
                 else if (Copy(F,Length(F),1)='�') then
                    F:=F+'�';

                 if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I),1)='�') then
                    I:=I+'�'
                 else if (Copy(I,Length(I),1)='�') then
                    I:=I+'�'
                 else if (Copy(I,Length(I),1)='�') then
                    I:=I+'�'
                 else if (Copy(I,Length(I),1)='�') then
                    I:=I+'�'
                 else if (Copy(I,Length(I),1)='�') then
                    I:=I+'�'
                 else if (Copy(I,Length(I),1)='�') then
                    I:=I+'�'
                 else if (Copy(I,Length(I),1)='�') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I),1)='�') then
                    I:=I+'�';
           end
        else if (Copy(O,Length(O)-1,2)='��') then
           begin
                O:=Copy(O,1,Length(O)-1)+'�';
                if (Copy(F,Length(F)-2,3)='���') then
                    F:=Copy(F,1,Length(F)-1)+'��'
                else if (Copy(F,Length(F)-2,3)='���') then
                    F:=Copy(F,1,Length(F)-1)+'��'
                else if (Copy(F,Length(F)-2,3)='���') then
                    F:=Copy(F,1,Length(F)-1)+'��'
                else if (Copy(F,Length(F)-2,3)='���') then
                    F:=Copy(F,1,Length(F)-1)+'��';
                if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-2,3)='���') then
                    I:=Copy(I,1,Length(I)-1)+'��'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-2)+'�'
                 else if (Copy(I,Length(I)-1,2)='''�') then
                    I:=Copy(I,1,Length(I)-1)+'�'
                 else if (Copy(I,Length(I)-1,2)='��') then
                    I:=Copy(I,1,Length(I)-1)+'�';

           end;
         ConvertFIO:=True;

   end;
  begin
       ShowMessage('���������');
       Exit;
       dmPO.pFIBdsKadry.Transaction.StartTransaction;
       dmPO.pFIBdsKadry.Open;
       dmPO.pFIBdsKadry.First;
       iCount:=0;
       while not dmPO.pFIBdsKadry.Eof do
        begin
               s:=dmPO.pFIBdsKadryPIB_ROD_PAD.Value;
               s:=Trim(S);
               need:=false;
               ch:='�';
               if Length(s)>1 then
                  ch:=Copy(s,Length(s),1)[1];
               if Ch in ['�'..'�'] then need:=True;
//             if (dmPO.pFIBdsKadrySTAG_P_DO_Y.Value=0) then
              if need then
                begin
                      Label1.Caption:=dmPO.pFIBdsKadryPIB_DAT_PAD.Value;
                      Application.ProcessMessages;
                      s:=dmPO.pFIBdsKadryPIB_ROD_PAD.Value;
                      if SplitFIO then
                      if ConvertFIO then
                         begin
                               s:=Trim(F)+' '+trim(I)+' '+trim(O);
                               dmPO.pFIBdsKadry.Edit;
                               dmPO.pFIBdsKadryPIB_DAT_PAD.Value:=S;
                               dmPO.pFIBdsKadry.Post;
                               Inc(iCount);
                               Label2.Caption:=IntToStr(iCount);
                               Application.ProcessMessages;
                         end;
                end;
             dmPO.pFIBdsKadry.Next;
        end;

       dmPO.pFIBdsKadry.Close;
       dmPO.pFIBdsKadry.Transaction.COMMIT;
       Label1.Caption:='Finished';
       Application.ProcessMessages;
  end;
procedure TFormCvtDatP.BitBtn1Click(Sender: TObject);
begin
      CvtDatP;
end;

end.
