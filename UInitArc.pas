unit UInitArc;

interface
    function InitParamFromIniFile:boolean;
    function NumeralToPhrase(const SVal: real;Mode:integer=0;ShortMode:boolean=false) : String;

    var
      Block_Program:Boolean;
      isSVDN,isLNR:Boolean;
implementation
  uses IniFiles,SysUtils,Forms,Dialogs;
    function InitParamFromIniFile:boolean;
     var
        Ini: TIniFile;
        I,J : integer;
        FN : string;
        FNameINI : String;
        S,SS:string;
    begin
        InitParamFromIniFile:=True;
        FNameINI :='DScroll.Ini';
        S   := ExtractFilePath(Application.ExeName)+FNameINI;
        if not FileExists(S) then
          begin
               ShowMessage('�� ������ ���� ������������� '+S);
               InitParamFromIniFile:=false;
               Exit;
          end;
        Ini := TIniFile.Create(S);
        try
             SS  := Ini.ReadString('Parameters', 'Block_Program', 'No' );
        finally
          Ini.Free;
        end;
        if (AnsiUpperCase(SS)='YES') then
           Block_Program:=True
        else
           Block_Program:=False;
     end;
//******************************************************************************
// ������� ��� �������� �����, ���������� � ������������ � ��������������� �����
function GeniCase(const S : String; C1,C2,C3 : String): String;
var
    Det1,Det2:Integer;
begin
     Det2:=StrToIntDef(Copy(S,Length(S)-1,2),0);
     Det1:=Det2 mod 10;
     if (Det1=1) and not(Det2=11) then
        GeniCase:=C1
     else
         if (Det1>1) and (Det1<5) and not( (Det2>11) and (Det2<15) ) then
            GeniCase:=C2
         else
            GeniCase:=C3;
end;

function NumeralToPhrase(const SVal: real;Mode:integer=0;ShortMode:boolean=false) : String;
const
     DigitsF: array[1..10] of String = (
                                        '',
                                        '���� ',
                                        '��� ',
                                        '��� ',
                                        '������ ',
                                        '���� ',
                                        '����� ',
                                        '���� ',
                                        '������ ',
                                        '������ '
                                       );
     DigitsFUkr: array[1..10] of String = (
                                        '',
                                        '���� ',
                                        '�� ',
                                        '��� ',
                                        '������ ',
                                        '�''��� ',
                                        '����� ',
                                        '�� ',
                                        '��� ',
                                        '���''��� '
                                       );
     DigitsM: array[1..3] of String = (
                                       '',
                                       '���� ',
                                       '��� '
                                      );
     Teens: array[1..10] of String = (
                                      '������ ',
                                      '����������� ',
                                      '���������� ',
                                      '���������� ',
                                      '������������ ',
                                      '���������� ',
                                      '����������� ',
                                      '���������� ',
                                      '������������ ',
                                      '������������ '
                                     );
     TeensUkr: array[1..10] of String = (
                                      '������ ',
                                      '���������� ',
                                      '���������� ',
                                      '���������� ',
                                      '������������ ',
                                      '�''��������� ',
                                      '����������� ',
                                      '��������� ',
                                      '���������� ',
                                      '���''��������� '
                                     );
     Tens: array[1..10] of String = (
                                     '',
                                     '',
                                     '�������� ',
                                     '�������� ',
                                     '����� ',
                                     '��������� ',
                                     '���������� ',
                                     '��������� ',
                                     '����������� ',
                                     '��������� '
                                    );
     TensUkr: array[1..10] of String = (
                                     '',
                                     '',
                                     '�������� ',
                                     '�������� ',
                                     '����� ',
                                     '�''�������� ',
                                     '���������� ',
                                     '������� ',
                                     '�������� ',
                                     '���''������ '
                                    );
     Hundreds: array[1..10] of String = (
                                         '',
                                         '��� ',
                                         '������ ',
                                         '������ ',
                                         '��������� ',
                                         '������� ',
                                         '�������� ',
                                         '������� ',
                                         '��������� ',
                                         '��������� '
                                        );
     HundredsUkr: array[1..10] of String = (
                                         '',
                                         '��� ',
                                         '���� ',
                                         '������ ',
                                         '��������� ',
                                         '�''������ ',
                                         '�������� ',
                                         '����� ',
                                         '������ ',
                                         '���''������ '
                                        );
var
   I,
   L,
   R,
   V,
   P,
   KOP :Integer;
   C,S : String;
  function GetHundreds(i:Integer):string;
    begin
         if Mode=0 then
            GetHundreds:=Hundreds[i]
         else
            GetHundreds:=HundredsUkr[i];
    end;
  function GetDigitsF(i:Integer):string;
    begin
         if Mode=0 then
            GetDigitsF:=DigitsF[i]
         else
            GetDigitsF:=DigitsFUkr[i];
    end;
  function GetTeens(i:Integer):string;
    begin
         if Mode=0 then
            GetTeens:=Teens[i]
         else
            GetTeens:=TeensUkr[i];
    end;
  function GetTens(i:Integer):string;
    begin
         if Mode=0 then
            GetTens:=Tens[i]
         else
            GetTens:=TensUkr[i];
    end;
  function GetNames(k,i:integer):string;
   begin
        Result:='';
        if Mode=1 then
           case (K) of
             4: Result:= GeniCase( C[I],
                                       '������ ',
                                       '������ ',
                                       '����� ');
             7: Result:= GeniCase( C[I],
                                       '����� ',
                                       '������ ',
                                       '����� ');
            10: Result:= GeniCase( C[I],
                                       '����� ',
                                       '������ ',
                                       '������ ');
            13: Result:= GeniCase( C[I],
                                       '������� ',
                                       '�������� ',
                                       '�������� ');
            16: Result:= GeniCase( C[I],
                                       '���������� ',
                                       '����������� ',
                                       '����������� ');
            19: Result:= GeniCase( C[I],
                                       '�������� ',
                                       '��������� ',
                                       '��������� ');
            22: Result:= GeniCase( C[I],
                                       '��������� ',
                                       '���������� ',
                                       '���������� ');
            25: Result:= GeniCase( C[I],
                                       '�������� ',
                                       '��������� ',
                                       '��������� ');
            end
        else
        case (K) of
             4: Result:= GeniCase( C[I],
                                       '������ ',
                                       '������ ',
                                       '����� ');
             7: Result:= GeniCase( C[I],
                                       '������� ',
                                       '�������� ',
                                       '��������� ');
            10: Result:= GeniCase( C[I],
                                       '�������� ',
                                       '��������� ',
                                       '���������� ');
            13: Result:= GeniCase( C[I],
                                       '�������� ',
                                       '��������� ',
                                       '���������� ');
            16: Result:= GeniCase( C[I],
                                       '����������� ',
                                       '������������ ',
                                       '������������� ');
            19: Result:= GeniCase( C[I],
                                       '����������� ',
                                       '������������ ',
                                       '������������ ');
            22: Result:= GeniCase( C[I],
                                       '����������� ',
                                       '������������ ',
                                       '������������� ');
            25: Result:= GeniCase( C[I],
                                       '���������� ',
                                       '����������� ',
                                       '������������ ');
        end;

   end;
begin
     i:=round(Int(SVal));
     S:=trim(IntToStr(I));
     KOP:=round((SVal-Int(SVal))*100);
     C:=S;
     L:=Length(C);
     P:=0;
     Result:='';
     for I:=1 to L do
         begin
              R:=(L - I + 1) mod 3;
              V:=StrToIntDef(Copy(C,I,1),0);
              case R of
                   0:
                     begin
                          Result:=Result + GetHundreds(V+1);
                          if (V>0) then
                             Inc(P);
                     end;
                   1:
                     begin
                          if (V>0) then
                             Inc(P);
                          if (V > 2) then
                             Result := Result + GetDigitsF(V+1)
                          else
                              if ((L - i) = 3) then
                                 Result := Result + GetDigitsF(V+1)
                              else
                                  Result := Result + DigitsM[V+1];
 //                                 Result := Result + GetDigitsF(V+1);
                          if P > 0 then
                             Result := Result + GetNames(L-I+1,I);
                          P:=0;
                     end;
                   2:
                     begin
                          if (V <> 1) then
                             Result:= Result + GetTens(V+1)
                          else
                              begin
                                   Result:= Result +
                                            GetTeens(StrToIntDef(Copy(C,I+1,1),0)+1);
                                   Delete(C,I+1,1);
                                   Insert('0',C,I+1);
                              end;
                          if (V>0) then
                             Inc(P);
                     end;
              end;
         end;
     Result:=Trim(Result);
     if (Result='') then
        Result:='����';
     Result:=AnsiUpperCase(Result[1])+Copy(Result,2,Length(Result)-1);
     if not ShortMode then
     if Mode=0 then
        Result:=Trim(Result)+' ���. '+trim(IntToStr(KOP))+' ���.'
     else
        Result:=Trim(Result)+' ���. '+trim(IntToStr(KOP))+' ���.';
end;
     
begin
     block_Program:=False;
     isLNR:=false;
     isSVDN:=False;

     {$IFDEF SVDN}
       isSVDN:=True;
     {$ELSE}
       isLNR:=True;
     {$ENDIF}
end.
