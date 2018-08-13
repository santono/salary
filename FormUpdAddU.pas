{$H-}
unit FormUpdAddU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, ValEdit, Buttons,ScrDef;

type
  TFormUpdateAdd = class(TForm)
    ValueListEditor1: TValueListEditor;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure ValueListEditor1GetPickList(Sender: TObject;
      const KeyName: String; Values: TStrings);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure SetPar(Shifr:integer;Summa:real;FZP:real;FMP:real;Other:real;Period:integer;Year:integer);
    procedure GetPar(var Shifr:word;var Summa:real;var FZP:real;var FMP:real;var Other:real;var Period:byte;var Year:byte);
    function Execute(var RetVal:integer): boolean;
    procedure ValueListEditor1Validate(Sender: TObject; ACol,
      ARow: Integer; const KeyName, KeyValue: String);

  private
    { Private declarations }
    ParAdd:Add;
    RetCode:integer;
  public
    { Public declarations }
  end;

var
  FormUpdateAdd: TFormUpdateAdd;

implementation
 uses ScrLists,ScrUtil;
{$R *.dfm}

procedure TFormUpdateAdd.FormActivate(Sender: TObject);
begin
     ValueListEditor1.ItemProps[0].EditStyle := esPickList;
     ValueListEditor1.ItemProps[1].EditStyle := esSimple;
     ValueListEditor1.ItemProps[2].EditStyle := esSimple;
     ValueListEditor1.ItemProps[3].EditStyle := esSimple;
     ValueListEditor1.ItemProps[4].EditStyle := esPickList;
{     ValueListEditor1.ItemProps[1].EditMask  := '!######0.99;; ';}
end;

procedure TFormUpdateAdd.ValueListEditor1GetPickList(Sender: TObject;
  const KeyName: String; Values: TStrings);
  var i,i_row:integer;
      s,c:string;
begin
   // Содержимое списка доступно через параметр Values:
   i:=Values.Count;
   s:=KeyName;
   i:=1;
   while (ord(S[i])>32) do
    begin
         c[i]:=s[i];
         c[0]:=chr(i);
         Inc(i);
    end;
   if Pos('татья',c)>0 then
      begin
        for i:=1 to ShifrList.Count do
            begin
                 if not ShifrList.IsAddByNo(i) then continue;
                 Values.Add(IntToStr(ShifrList.GetShifrByNo(i))+' '+GetNameShifrByNo(i));
            end;
      end
                             else
   if Pos('онд',c)>0 then
      begin
           Values.Add('ФЗП');
           Values.Add('ФМП');
           Values.Add('ПР.');
      end
                             else
   if Pos('од',c)>0 then
      begin
           Values.Add('2003');
           Values.Add('2004');
           Values.Add('2005');
      end
                             else
   if Pos('есяц',KeyName)>0 then
      begin
           for i:=1 to 12 do
                Values.Add(GetMonthRus(i));
      end;
end;

procedure TFormUpdateAdd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormUpdateAdd.BitBtn1Click(Sender: TObject);
begin
      ModalResult:=mrOk;
end;

procedure TFormUpdateAdd.FormCreate(Sender: TObject);
begin
     FillChar(Self.ParAdd, SizeOf(Self.ParAdd), 0);
     RetCode:=0;
end;
procedure TFormUpdateAdd.SetPar(Shifr:integer;Summa:real;FZP:real;FMP:real;Other:real;Period:integer;Year:integer);
 var i:integer;
 begin
       Self.ParAdd.Shifr:=Shifr;
       Self.ParAdd.Summa:=Summa;
       Self.ParAdd.FZP:=FZP;
       Self.ParAdd.FMP:=FMP;
       Self.ParAdd.Period:=Period;
       Self.ParAdd.Year:=Year;
       ValueListEditor1.Cells[1,1]:=IntToStr(Shifr)+' '+GetNameShifr(Shifr);
       ValueListEditor1.Cells[1,2]:=FloatToStrF(Summa,ffFixed,10,2);
       i:=pos(',',ValueListEditor1.Cells[1,2]);
       if i>0 then
          begin
               ValueListEditor1.Cells[1,2]:=copy(ValueListEditor1.Cells[1,2],1,i-1)+
                                            '.'+copy(ValueListEditor1.Cells[1,2],i+1,2);
          end;
       ValueListEditor1.Cells[1,3]:=GetMonthRus(Period);
       ValueListEditor1.Cells[1,4]:=IntToStr(Year+1990);
       ValueListEditor1.Cells[1,5]:='ФЗП';
       if abs(FMP)>0.01 then ValueListEditor1.Cells[1,5]:='ФМП';
       if abs(Other)>0.01 then ValueListEditor1.Cells[1,5]:='ПР.';
 end;
procedure TFormUpdateAdd.GetPar(var Shifr:word;var Summa:real;var FZP:real;var FMP:real;var Other:real;var Period:byte;var Year:byte);
 var S:string;
     k,i,j:integer;
     A:real;
 begin
       FMP:=0;
       FZP:=0;
       Other:=0;
       Summa:=0;
       Year:=0;
       Shifr:=0;
       Period:=0;
       for i:=1 to 12 do if ValueListEditor1.Cells[1,3]=GetMonthRus(i) then break;
       Period:=i;
       val(ValueListEditor1.Cells[1,4],I,J);
       if j=0 then Year:=I-1990;
       Shifr:=Self.ParAdd.Shifr;
       val(ValueListEditor1.Cells[1,2],A,J);
       if j=0 then Summa:=a;
       if ValueListEditor1.Cells[1,5]='ФЗП' then FZP:=Summa
                                        else
       if ValueListEditor1.Cells[1,5]='ФМП' then FMP:=Summa
                                        else Other:=Summa;
       K:=0;
       for i:=1 to 5 do
           begin
                s:=copy(ValueListEditor1.Cells[1,1],1,i);
                val(s,K,J);
                if j<>0 then break;
           end;
       Shifr:=k;
 end;

function TFormUpdateAdd.Execute(var RetVal:integer): boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    RetVal:=RetCode;
    Result:=true;
  end else begin
    result := false;
    RetVal:=RetCode;
  end;
end;

procedure TFormUpdateAdd.ValueListEditor1Validate(Sender: TObject; ACol,
  ARow: Integer; const KeyName, KeyValue: String);
var S:String;
    A:real;
    J:integer;
begin
     if aRow<>2 then Exit;
     if ACol<>1 then Exit;
     S:=ValueListEditor1.Cells[aCol,aRow];
     val(S,A,j);
     if (j<>0) then
        ShowMessage('Неверная сумма '+S)
               else
     if abs(A)>10e7 then
        ShowMessage('Неверная сумма '+S);

end;


end.
