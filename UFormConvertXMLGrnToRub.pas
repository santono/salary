unit UFormConvertXMLGrnToRub;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormConvertXMLGrnToRub = class(TForm)
    OpenDialog1: TOpenDialog;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    fName:string;

  public
    { Public declarations }
  end;

var
  FormConvertXMLGrnToRub: TFormConvertXMLGrnToRub;

implementation
  uses ScrUtil,scrDef,uFormWait;

{$R *.dfm}

procedure TFormConvertXMLGrnToRub.BitBtn1Click(Sender: TObject);
begin
     if OpenDialog1.Execute then
        begin
              fName:=OpenDialog1.FileName;
              Label1.Caption:=fName;
              Application.ProcessMessages;
        end
     else
        Exit;

end;

procedure TFormConvertXMLGrnToRub.FormCreate(Sender: TObject);
begin
     fName:='';
end;

procedure TFormConvertXMLGrnToRub.BitBtn2Click(Sender: TObject);
const lt=6;
const tags:array[1..lt]of string=('SUM_TOTAL','SUM_MAX','SUM_INS','PAGE_SUM_TOTAL','PAGE_SUM_MAX','PAGE_SUM_INS');

var filei,fileo:TextFile;
    fnameo:string;
    i:Integer;
    s,so,s1:string;
    finded:Boolean;
    numbers:string;
    resultS:string;
    aVal:Real;
    ierr:Integer;
    done:Boolean;
    ch:Char;
begin
     if Length(Trim(fname))<5 then
        begin
             ShowMessage('Не указан файл для конвертации');
             Exit;
        end;
     if not FileExists(fname) then
        begin
             ShowMessage('Не верное имя файла '+fname);
             Exit;
        end;
     fNameO:=cdoc+'temp.xml';
     AssignFile(filei,fname);
     reset(filei);
     AssignFile(fileo,fnameo);
     rewrite(fileo);
     FormWait.Show;
     while not Eof(filei) do
      begin
            Readln(filei,s);
            finded:=false;
            for i:=1 to lt do
                if (pos(tags[i],s)>1) then
                   begin
                        finded:=True;
                        Break;
                   end;
            if not finded then
               begin
                    Writeln(fileo,s);
                    Continue;
               end;
            numberS:='';
            done:=False;
            for i:=1 to Length(s) do
                begin
                     ch:=Copy(s,i,1)[1];
                     if ch in ['0'..'9','.'] then
                        numberS:=numberS+ch;
                end;
            if Length(numberS)>1 then
               begin
                    Val(numbers,aVal,iErr);
                    if ierr=0 then
                       begin
                            aVal:=r10(aVal*2);
                            resultS:=Trim(Format('%12.2f',[aVal]));
                            s1:=StringReplace(s,numbers,results,[rfReplaceAll]);
                            so:=ReplChar(S1,',','.');
                            Writeln(fileo,so);
                       end;
               end;
      end;
     CloseFile(filei);
     CloseFile(fileo);
     FormWait.Hide;
     ShowMessage('Готово. Результат в '+fnameO);


end;

end.
