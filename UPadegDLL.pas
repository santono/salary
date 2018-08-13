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
        nPadeg:=3; // ���������
             // 2 �����������
        cFIO:=trim(FIO);
        Result := '';
        nLen := Length(cFIO) + 10; // ������ ������ ��� ��������� ��������������
        tmpS := StrAlloc(nLen);    // ������������� ������ ��� ���������
        try
           RetVal := GetFIOPadegFSAS(PChar(cFIO), nPadeg, tmpS, nLen);
             // �������� ������������ ��������.
           if RetVal=-1 then
              Result:='������������ �������� ������ - ' + IntToStr(nPadeg)
           else
              Result := Copy(tmpS, 1, nLen);
        finally
               StrDispose(tmpS); // ������������ ���������� ������
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
     //   nPadeg:=3; // ���������
        nPadeg:=4;     // 2 �����������
        cFIO:=trim(FIO);
        Result := '';
        nLen := Length(cFIO) + 10; // ������ ������ ��� ��������� ��������������
        tmpS := StrAlloc(nLen);    // ������������� ������ ��� ���������
        try
           RetVal := GetFIOPadegFSAS(PChar(cFIO), nPadeg, tmpS, nLen);
             // �������� ������������ ��������.
           if RetVal=-1 then
              Result:='������������ �������� ������ - ' + IntToStr(nPadeg)
           else
              Result := Copy(tmpS, 1, nLen);
        finally
               StrDispose(tmpS); // ������������ ���������� ������
        end;
        getRoditPadegFIO:=Result;

    end;

end.
 