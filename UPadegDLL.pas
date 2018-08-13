unit UPadegDLL;

interface
      function getDatelPadegFIO(FIO:String):string;
       function getRoditPadegFIO(FIO:String):string;

implementation
    uses SysUtils;
    function GetFIOPadegFSAS(pFIO: PChar; nPadeg: LongInt; pResult: PChar; var
                         nLen: LongInt):Integer; stdcall; external 
  //                       'padeg_UA.dll' Name 'GetFIOPadegFSAS';
                         'padeg.dll' Name 'GetFIOPadegFSAS';

  function getDatelPadegFIO(FIO:String):string;
    var cFIO:string;
        tmpS   : PChar;
        nLen   : LongInt;
        RetVal : Integer;
        nPadeg : Integer;
    begin
        nPadeg:=3; // ƒательный
             // 2 родительный
        cFIO:=trim(FIO);
        Result := '';
        nLen := Length(cFIO) + 10; // размер буфера под результат преобразовани€
        tmpS := StrAlloc(nLen);    // распределение пам€ти под результат
        try
           RetVal := GetFIOPadegFSAS(PChar(cFIO), nPadeg, tmpS, nLen);
             // проверим возвращенное значени€.
           if RetVal=-1 then
              Result:='Ќедопустимое значение падежа - ' + IntToStr(nPadeg)
           else
              Result := Copy(tmpS, 1, nLen);
        finally
               StrDispose(tmpS); // освобождение выделенной пам€ти
        end;
        getDatelPadegFIO:=Result;

    end;


  function getRoditPadegFIO(FIO:String):string;
    var cFIO:string;
        tmpS   : PChar;
        nLen   : LongInt;
        RetVal : Integer;
        nPadeg : Integer;
    begin
     //   nPadeg:=3; // ƒательный
        nPadeg:=4;     // 2 родительный
        cFIO:=trim(FIO);
        Result := '';
        nLen := Length(cFIO) + 10; // размер буфера под результат преобразовани€
        tmpS := StrAlloc(nLen);    // распределение пам€ти под результат
        try
           RetVal := GetFIOPadegFSAS(PChar(cFIO), nPadeg, tmpS, nLen);
             // проверим возвращенное значени€.
           if RetVal=-1 then
              Result:='Ќедопустимое значение падежа - ' + IntToStr(nPadeg)
           else
              Result := Copy(tmpS, 1, nLen);
        finally
               StrDispose(tmpS); // освобождение выделенной пам€ти
        end;
        getRoditPadegFIO:=Result;

    end;

end.
 