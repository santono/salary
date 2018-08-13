{$H-}
unit FormUpdCnU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ValEdit, ScrDef;

type
  TFormUpdCN = class(TForm)
    ValueListEditor1: TValueListEditor;
    BitBtn1 : TBitBtn;
    BitBtn2 : TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ValueListEditor1GetPickList(Sender: TObject;
      const KeyName: String; Values: TStrings);
    procedure SetPar(Shifr:integer;Kod:integer;Summa:real;Prim:integer;Prim_1:String);
    procedure GetPar(var Shifr:integer;var Kod:integer;var Summa:real;var Prim:integer;var Prim_1:String);
    function Execute(var RetVal:integer): boolean;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ValueListEditor1Validate(Sender: TObject; ACol,
      ARow: Integer; const KeyName, KeyValue: String);
    procedure BitBtn2Click(Sender: TObject);
    procedure ValueListEditor1StringsChange(Sender: TObject);

  private
   { Private declarations }
    ParCn:Cn;
    ShifrClear : integer;
    RetCode:integer;
    Function IsShifrStaKod100(Shifr:Integer):boolean;
    Function IsShifrStaKod100InCell:boolean;
    Function GetKodSta:integer;
  public
    { Public declarations }
  end;

var
  FormUpdCN: TFormUpdCN;

implementation
Uses ScrLists,ScrUtil,FormCnU;
const KodS:array[1..9] of String =(' Абс.сумма (ФЗП)',
                                  ' % оклада (ФЗП)',
                                  ' Абс.сумма (ФMП)',
                                  ' % оклада (ФMП)',
                                  ' Абс.сумма (Пр)',
                                  ' % оклада (Пр)',
                                  ' % оклада ',
                                  ' % нач суммы ',
                                  ' Блок ');
{
const LenBlSta=23;
const BlSta:array[1..LenBlSta] of integer = (PENSIJA_SHIFR       , STIPENDIJA_SHIFR      , POL_SHIFR       , OSN_MESTO_RABOTY_SHIFR  , SOWMESTIT_CN_SHIFR    ,
                                      PRINAT_UWOLEN_SHIFR , PROC_PODOH_SOWM_SHIFR , PENSIONER_SHIFR , INVALID_SHIFR           , PENS_PROC_ZAKON_SHIFR ,
                                      NeedPensProcSHIFR   , LgotyPN2004Shifr      , OplataObuchShifr, OplataKomandirovokShifr , NotNeedPensProcSHIFR  ,
                                      ASPIRANT_SHIFR      , NMB_STAW_SHIFR        , KOEF_OKLAD_SHIFR, NOM_KAF_SHIFR           , KOD_DOLG_SHIFR        ,
                                      KOEF_UW_OKLAD_SHIFR , KOD_VYPL_SHIFR        , RazrjadShifr    );
}
{$R *.dfm}

procedure TFormUpdCN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormUpdCN.ValueListEditor1GetPickList(Sender: TObject;
  const KeyName: String; Values: TStrings);
  var i:integer;
      s,c:string;
 Function GetWidShifr:integer;
   var k,i,j:integer;
       s:String;
   begin
       K:=0;
       for i:=1 to 5 do
           begin
                s:=copy(ValueListEditor1.Cells[1,1],1,i);
                val(s,K,J);
                if j<>0 then break;
           end;
       if ShifrList.IsAdd(k) then GetWidShifr:=1
                                 else GetWidShifr:=2
   end;
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
{                 if not ShifrList.IsAddByNo(i) then continue;}
                 Values.Add(IntToStr(ShifrList.GetShifrByNo(i))+' '+GetNameShifrByNo(i));
            end;
      end
   else
      if (Pos('од',c)>0) then
         begin
              if Self.IsShifrStaKod100InCell then Values.Add(KodS[9])
                                             else
              if GetWidShifr=1 then for I:=1 to 6 do Values.Add(KodS[i])
                               else for i:=1 to 2 do Values.Add(KodS[i+6])

         end;

end;

procedure TFormUpdCN.SetPar(Shifr:integer;Kod:integer;Summa:real;Prim:integer;Prim_1:String);
 var i:integer;
 begin
       Self.ParCn.Shifr  := Shifr;
       Self.ShifrClear  := Shifr;
       if Shifr > Limit_Cn_Base then
          Self.ShifrClear := Shifr - Limit_Cn_Base;
       Self.ParCn.Summa  := Summa;
       Self.ParCn.Kod    := Kod;
       Self.ParCn.Prim   := Prim;
       Self.ParCn.Prim_1 := Prim_1;
       ValueListEditor1.Cells[1,1]:=IntToStr(Self.ShifrClear)+' '+GetNameShifr(Self.ShifrClear);
       ValueListEditor1.Cells[1,2]:=IntToStr(Kod);
       if (Shifr > Limit_Cn_Base) then ValueListEditor1.Cells[1,2]:=KodS[9]
                                  else
       if ShifrList.IsAddByNo(Shifr) then ValueListEditor1.Cells[1,2]:=KodS[Kod]
                                     else ValueListEditor1.Cells[1,2]:=KodS[Kod+6];
       ValueListEditor1.Cells[1,3]:=FloatToStrF(Summa,ffFixed,10,2);
       i:=pos(',',ValueListEditor1.Cells[1,3]);
       if i>0 then
          ValueListEditor1.Cells[1,3]:=copy(ValueListEditor1.Cells[1,3],1,i-1)+
                                   '.'+copy(ValueListEditor1.Cells[1,3],i+1,2);
       ValueListEditor1.Cells[1,4]:=IntToStr(Prim);
       ValueListEditor1.Cells[1,5]:=Trim(Prim_1);
 end;

 procedure TFormUpdCN.GetPar(var Shifr:integer;var Kod:integer;var Summa:real;var Prim:integer;var Prim_1:String);
 var S:string;
     k,i,j:integer;
     A:real;
 begin
       Shifr  := 0;
       Kod    := 0;
       Summa  := 0;
       Prim   := 0;
       Prim_1 := '';
       Shifr := Self.ParCn.Shifr;
       K:=100;
       for i:=1 to 9 do
           begin
                 if ValueListEditor1.Cells[1,2]=KodS[I] then
                    begin
                         if (I<7) then K:=I
                                  else
                         if ((i>6) and (i<9)) then K:=I-6
                                              else K:=100;
                         break;
                    end;
           end;
       Kod:=k;
{
       val(ValueListEditor1.Cells[1,2],I,J);
       if j=0 then Kod := I;
}       
       S:=ValueListEditor1.Cells[1,3];
       val(S,A,J);
       if j=0 then Summa:=a;
       val(ValueListEditor1.Cells[1,4],I,J);
       if j=0 then Prim:=i;
       Prim_1 := ValueListEditor1.Cells[1,5];
       K:=0;
       for i:=1 to 5 do
           begin
                s:=copy(ValueListEditor1.Cells[1,1],1,i);
                val(s,K,J);
                if j<>0 then break;
           end;
       Shifr:=k;
       if kod=100 then Shifr:=Shifr+Limit_Cn_Base;
 end;

function TFormUpdCN.Execute(var RetVal:integer): boolean;
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



procedure TFormUpdCN.FormActivate(Sender: TObject);
begin
     ValueListEditor1.ItemProps[0].EditStyle := esPickList;
     ValueListEditor1.ItemProps[1].EditStyle := esSimple;
     ValueListEditor1.ItemProps[2].EditStyle := esSimple;
     ValueListEditor1.ItemProps[3].EditStyle := esSimple;
     ValueListEditor1.ItemProps[4].EditStyle := esSimple;
{     ValueListEditor1.ItemProps[1].EditMask  := '!##0;';}
{     ValueListEditor1.ItemProps[2].EditMask  := '!######0.99; ';}
{     ValueListEditor1.ItemProps[4].EditStyle := esPickList; }

end;

procedure TFormUpdCN.FormCreate(Sender: TObject);
begin
     FillChar(Self.ParCn, SizeOf(Self.ParCn), 0);
     RetCode:=0;
end;

procedure TFormUpdCN.ValueListEditor1Validate(Sender: TObject; ACol,
  ARow: Integer; const KeyName, KeyValue: String);
var S:String;
    A:real;
    J,I:integer;
begin
     if ACol<3 then Exit;
     if (aRow=3) then
        begin
              S:=ValueListEditor1.Cells[aCol,aRow];
              val(S,A,j);
              if (j<>0) then
                 ShowMessage('Неверная сумма '+S)
                        else
              if abs(A)>10e7 then
                 ShowMessage('Неверная сумма '+S);
        end
                 else
     if (aRow=4) then
        begin
              S:=ValueListEditor1.Cells[aCol,aRow];
              val(S,i,j);
              if (j<>0) then
                 ShowMessage('Неверное примечание '+S)
                        else
              if (i<0) then
                 ShowMessage('Неверное примечание '+S);
        end

end;

procedure TFormUpdCN.BitBtn2Click(Sender: TObject);
begin
            ModalResult:=mrOk;
end;
Function TFormUpdCN.IsShifrStaKod100(Shifr:Integer):boolean;
 var i:integer;
 begin
     IsShifrStaKod100:=False;
     for i:= 1 to LenBlSta do
         if ((Shifr=BlSta[i]) or (Shifr-Limit_Cn_Base=BlSta[i])) then
            begin
                 IsShifrStaKod100:=True;
                 Break;
            end;
 end;
Function TFormUpdCN.GetKodSta:integer;
   var k,i,j:integer;
       s:String;
   begin
       K:=0;
       for i:=1 to 5 do
           begin
                s:=copy(ValueListEditor1.Cells[1,1],1,i);
                val(s,K,J);
                if j<>0 then break;
           end;
      if (K>0) then Result := K
                           else Result := 0;
   end;
Function TFormUpdCN.IsShifrStaKod100InCell:boolean;
   var k,i,j:integer;
       s:String;
   begin
       K:=Self.GetKodSta;
       if Self.IsShifrStaKod100(k) then IsShifrStaKod100InCell:=True
                                   else IsShifrStaKod100InCell:=false;
   end;
procedure TFormUpdCN.ValueListEditor1StringsChange(Sender: TObject);
var
    I:Integer;
begin
      if ValueListEditor1.Row=1      then
      if ValueListEditor1.Col=1      then
      if Self.IsShifrStaKod100InCell then
      if trim(ValueListEditor1.Cells[1,2])<>Trim(KodS[9]) then
         begin
              ValueListEditor1.Cells[1,2]:=KodS[9];
              I:=Self.GetKodSta;
              if i>0 then
                 Self.ParCn.Shifr:=I+Limit_Cn_Base;
         end
                                     else
         begin
              I:=Self.GetKodSta;
              if i>0 then
                 Self.ParCn.Shifr:=I;
         end;

end;

end.
