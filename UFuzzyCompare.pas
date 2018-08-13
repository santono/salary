unit UFuzzyCompare;

interface
function IndistinctMatching(MaxMatching     : Integer;
                            strInputMatching: WideString;
                            strInputStandart: WideString): Integer;
implementation

Uses SysUtils;

Type
     TRetCount = packed record
                 lngSubRows   : Word;
                 lngCountLike : Word;
                end;

//------------------------------------------------------------------------------
function Matching(StrInputA: WideString;
                  StrInputB: WideString;
                  lngLen: Integer) : TRetCount;
Var
    TempRet   : TRetCount;
    PosStrB   : Integer;
    PosStrA   : Integer;
    StrA      : WideString;
    StrB      : WideString;
    StrTempA  : WideString;
    StrTempB  : WideString;
begin
    StrA := String(StrInputA);
    StrB := String(StrInputB);

    For PosStrA:= 1 To Length(strA) - lngLen + 1 do
    begin
       StrTempA:= System.Copy(strA, PosStrA, lngLen);

       PosStrB:= 1;
       For PosStrB:= 1 To Length(strB) - lngLen + 1 do
       begin
          StrTempB:= System.Copy(strB, PosStrB, lngLen);
          If SysUtils.AnsiCompareText(StrTempA,StrTempB) = 0 Then
          begin
             Inc(TempRet.lngCountLike);
             break;
          end;
       end;

       Inc(TempRet.lngSubRows);
    end; // PosStrA

    Matching.lngCountLike:= TempRet.lngCountLike;
    Matching.lngSubRows  := TempRet.lngSubRows;
end; { function }

//------------------------------------------------------------------------------
function IndistinctMatching(MaxMatching     : Integer;
                            strInputMatching: WideString;
                            strInputStandart: WideString): Integer;
Var
    gret     : TRetCount;
    tret     : TRetCount;
    lngCurLen: Integer   ; //текущая длина подстроки
begin
    //если не передан какой-либо параметр, то выход
    If (MaxMatching = 0) Or (Length(strInputMatching) = 0) Or
       (Length(strInputStandart) = 0) Then
    begin
        IndistinctMatching:= 0;
        exit;
    end;

    gret.lngCountLike:= 0;
    gret.lngSubRows  := 0;
    // Цикл прохода по длине сравниваемой фразы
    For lngCurLen:= 1 To MaxMatching do
    begin
        //Сравниваем строку A со строкой B
        tret:= Matching(strInputMatching, strInputStandart, lngCurLen);
        gret.lngCountLike := gret.lngCountLike + tret.lngCountLike;
        gret.lngSubRows   := gret.lngSubRows + tret.lngSubRows;
        //Сравниваем строку B со строкой A
        tret:= Matching(strInputStandart, strInputMatching, lngCurLen);
        gret.lngCountLike := gret.lngCountLike + tret.lngCountLike;
        gret.lngSubRows   := gret.lngSubRows + tret.lngSubRows;
    end;

    If gret.lngSubRows = 0 Then
    begin
        IndistinctMatching:= 0;
        exit;
    end;

    IndistinctMatching:= Trunc((gret.lngCountLike / gret.lngSubRows) * 100);
end;


end.

