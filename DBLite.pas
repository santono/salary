//{$D-}
{*******************************************************}
{                                                       }
{       ������� ������ ��� ������ � DBF �������         }
{                                                       }
{        Copyright (c) 2003-2004 ����� ���������        }
{                                                       }
{*******************************************************}

UNIT DBLite;

//  �������� �����������
//  - ������, ������ ���������, �������������,
//    ����������, MEMO � ���� �����
//  - ��������������, �������� �������
//  - ������� ��������� ������
//  - ������ ������� �������
//
//  �� �������������� (� �� �����) ������� �������.
//  ����� ����������� ������ ������� ����� �������
//  � ������������ ����������, ��������������� ��� �����
//  ��� (� �� �����) ��������� �������� �������.
//  ��� (� �� �����) �������� ��� �������� ������
//  ��� �������� ����� ������� ����� �����������
//  �� ��������� �� ������� �������
//  ����������� ��������� DOS <--> WIN �������� ��������
//  ������� ������� ���� �� ����� ����������� ������
//  ������ ������������ �� ����, ��������� � FoxPro ��� Windows

//  ������� ��������:

//  2005.03.21
//  ~~~~~~~~~~
//  + function StringDBFToDate(const S: string): TDate;
//    ����������� ��������� ���� � TData

//  2004.03.16
//  ~~~~~~~~~~
//  * ��� ������ MEMO ���������� ������� � ����� ������
//    ����������

//  2004.02.28
//  ~~~~~~~~~~
//  * ������ ��� ���������� ����� ������ - �����������
//    ����������� ����� �� �����, ������������ ����� ������ ������ 2.
//    ����������

//  2004.02.23
//  ~~~~~~~~~~
//  * ������ ��� ������ MEMO ���� ������ ����� ����� ������ (32766)
//    ������ �������������� ��������� �� 32766

//  2004.02.08
//  ~~~~~~~~~~
//  + function TDBFLite.ReadDate(const aRec, aField: integer): TDate;
//  ������� ��������, ��������

//  2003.10.20
//  ~~~~~~~~~~
//  + function TDBFLite.WriteDate(const aRec, aField: integer): TDate;
//  + function TDBFLite.ReadDate(const aRec, aField: integer): TDate;

//  2003.10.07
//  ~~~~~~~~~~
//  � ReadBool ��������� "1" = TRUE

//  2003.09.20
//  ~~~~~~~~~~
//  + function TDBFLite.ReadBool(const aRec, aField: integer): boolean;
//    ������ ����������� �������� ����
//    ��� ������ �������� ������������ false
//  + procedure TDBFLite.WriteBool(const aRec, aField: integer; b: boolean);
//    ������ ����������� �������� ����
//    ��� ������ ������������� ���������:
//    BoolTrue : string[1] = 'T'; // �������� ���� ��� ������ true
//    BoolFalse: string[1] = 'F'; // �������� ���� ��� ������ false

//  2003.09.18
//  ~~~~~~~~~~
//  + procedure TDBFLite.Zap;
//    ������� ������� �������. ���� � MEMO ������� �� ���������.
//
//  - ���������� ��������� ������ �����. ������ ������� ����� �����������
//    �� � �����, � ���������� Format
//
//  - ��� ������ ������� �������� ReadInteger ���������� 0
//
//  - ������� ������ ��� ������ MEMO. ��� ����� ������, ������� BlockSize
//    ����� ��������������� ������ ��� ������ ��� ����� ����, ��� ����� ���
//    ������������ ��������� 8 ���� - ����� ������. ��-�� ����� ��������
//    ��� ������ ������ �����

//  2003.09.16
//  ~~~~~~~~~~
//  - ���������� ������ ��� ���������� ������ ������� Insert
//    � ����� �������. �� ����������� ������� ������������ ������� 1A,
//    ������� ��� ���������� �������� ���-�� ������ ���������� �����
//    ������ ������ ����������� � ������ ����� � � ����� ������������ 1A
//
//  - ���������� ������ ��������� ���-�� �������, �.�. ������
//    �������� ������ ����������� � �������, � ������ � ����
//    ��������� ��������� ��������� DBF �������� �� ��������
//    ������ ����� (������, ��� �� ��� :)
//
//  ! ������, ������� MEMO ����� ����������� ���-�� � DBF, �������
//    ��� �������� ����� ���� ��������� ���� ���� � ��� � ������������
//    � ��� ��������� MEMO ����
//  ! ����������, ��� �������� ��������� DBF ������, ���������
//    ������� �����������
//  ! �������� ���������� ���� �����. ���� ����, ��, �������, ����-�� � ����

//  2003.09.06
//  ~~~~~~~~~~
//  + procedure TDBFLite.WriteMEMO(const aRec, aField: integer; const S: string);
//    ���������� MEMO ������ � ����� �����
//    ��� ������ ������ ������ ������ �� MEMO ���������
//
//  + function TDBFLite.Deleted(const aRec: integer): boolean;
//    ���������� ��������� ������. True, ���� �������
//
//  + procedure TDBFLite.Delete(const aRec: integer);
//    �������� ������, �������, ������� ��� ��� ���
//    ������ ������� �������� ������ "*"
//
//  + procedure TDBFLite.UnDelete(const aRec: integer);
//    �������������� ������, �������, ������� ��� ��� ���

//  2003.09.03
//  ~~~~~~~~~~
//  + function TDBFLite.ReadMemo(const aRec, aField: integer): string;
//    ������ ����� ������ �� ������ �������, �� � MEMO ����
//    ���� ������ �� MEMO ���, �� ���������� ������ ������

//  2003.02.03
//  ~~~~~~~~~~
//    ������ ��������.
//    �������� ��������� ������, ������ ������� ����� ������


INTERFACE

uses
  Classes, SysUtils, Dialogs, Controls;

const
  BoolTrue : string[1] = 'T'; // �������� ���� ��� ������ true
  BoolFalse: string[1] = 'F'; // �������� ���� ��� ������ false

type
  TTableDate=record // ���� ���������� ���������� (�� ������������)
    YY: byte;       // ���
    MM: byte;       // �����
    DD: byte;       // ����
  end;

  TFieldDesc=record // �������� ����
    fName: string;  // ��� (��������)
    fType: char;    // ��� (C,L,N,M,F,D)
    fLen : byte;    // �����
    fDec : byte;    // ���-�� �������� ����� �����
    fOff : word;    // �������� �� ������
  end;

  TDBFLite=object             // ����
    private
      fBase      : TFileStream; // �������� �����, ��������� � ������ ����
      fMemo      : TFileStream; // �������� �����, ��������� � MEMO ������ ����
      IsMemo     : boolean;     // ���� MEMO ����
    public
      FileName   : string;      // ��� �����
      Vers       : byte;        // ������
      LastDate   : TTableDate;  // ���� ���������� ��������� ���� (�� �����)
      HeaderSize : word;        // ������ ��������� � ������
      RecCount   : longint;     // ���-�� �������
      RecLen     : word;        // ����� ������ ������ � ������ ��������
      FieldsCount: word;        // ���-�� �����
      BlockSize  : word;        // ������ ����� ��� ������ MEMO ����.
                                // ����� ������� �������� MEMO ������ ����� �����
      NextBlock  : Longword;    // ��������� �� ��������� ��������� ����
                                // (� ����� �����. �������, ������ ����� ����� �����)

      Fields     : array[0..32766] of TFieldDesc; // ������ �������� ����� ���������!

 // ��������� ����, ��������� ���������
    constructor Init(const FN: string);
 // ��������� ����
    destructor  Done;

 // ������� ��������� ������
    function    Deleted(const aRec: integer): boolean;
 // �������� ������
    procedure   Delete(const aRec: integer);
 // �������������� ������
    procedure   UnDelete(const aRec: integer);

 // ������� ������� �������
    procedure   Zap;
 // ����� ���� �� ��������
    function    FieldByName(const FieldName: string): integer;

 // ������ ������ ������ ��� ���� �� ������ ������, ������ ����
    function    ReadCell   (const aRec, aField: integer): string;
 // ������ ���������� �������� ����
    function    ReadString (const aRec, aField: integer): string;
 // ������ ��������� �������� ����
    function    ReadInteger(const aRec, aField: integer): integer;
 // ������ ����������� �������� ����
    function    ReadBool   (const aRec, aField: integer): boolean;
 // ������ �������� ���� ���� ����
    function    ReadDate   (const aRec, aField: integer): TDate;
 // ������ MEMO �������� ����
    function    ReadMemo   (const aRec, aField: integer): string;

 // ������� ������ ������ � �����
    procedure   Insert;

 // ������ � ������ ������ ��� ����
    procedure   WriteCell   (const aRec, aField: integer; const S: string);
 // ������ ���������� �������� ����
    procedure   WriteString (const aRec, aField: integer; const S: string); // ������ ������ ��� ������
 // ������ ��������� �������� ����
    procedure   WriteInteger(const aRec, aField, x: integer);
 // ������ ��������� �������� ���� decimal
    procedure   WriteDecimal(const aRec, aField:integer; x: real);
 // ������ ����������� �������� ����
    procedure   WriteBool   (const aRec, aField: integer; b: boolean);
 // ������ �������� ���� ���� ����
    procedure   WriteDate   (const aRec, aField: integer; d: TDate);
 // ������ MEMO �������� ����
    procedure   WriteMEMO   (const aRec, aField: integer; const S: string);
  end;

 // ����������� ��������� ���� � TData
    function StringDBFToDate(const S: string): TDate;

IMPLEMENTATION

type
  TCharBuf=array [1..32766] of char; // ��������� ����� ��� ������ �������
  TByteBuf=array [0..31   ] of byte; // ��������  ����� ��� ������ �������

// ������ ������ - �������������, �������� ������
constructor TDBFLite.Init(const FN: string);
var
  ByteBuf: TByteBuf;
  i, j, off: integer;
  MemoFileName: string;
begin
  FileName:= FN;
  IsMemo:= false;
  try
    fBase:= TFileStream.Create(FileName, fmOpenReadWrite);
  except
    raise Exception.Create('������ �������� ����� "' + FileName + '"')
  end;

  MemoFileName:= Copy(FileName, 1, pos('.', FileName)) + 'FPT';

  if FileExists(MemoFileName) then begin
    fMemo:= TFileStream.Create(MemoFileName, fmOpenReadWrite);
    IsMemo:= true;
    // ������ ��������� MEMO �����
    try
      fMemo.Seek(0, soFromBeginning);
      fMemo.Read(ByteBuf, 31); // ������ ��������� MEMO �����
      // ������������ ���������� ����� (�� � ������)
      NextBlock:= ByteBuf[0] * 256 * 256 * 256 +
                  ByteBuf[1] * 256 * 256 +
                  ByteBuf[2] * 256 +
                  ByteBuf[3];
      // ����� ����� ��� ������ MEMO � ������
      BlockSize:= ByteBuf[6] * 256 +
                  ByteBuf[7];
    except
      raise Exception.Create('������ ������ ��������� MEMO ����� "' + MemoFileName + '".');
    end;
  end; // if FileExists(MemoFileName) then begin

  try
    fBase.Seek(0, soFromBeginning);
    fBase.Read(ByteBuf, 32); // ������ ��������� ����� ����
  except
    raise Exception.Create('������ ������ ��������� ����� "' + FileName + '"');
  end;

  // ���������� ������� ����
  Vers        := ByteBuf[00]; // ������ �����
  LastDate.YY := ByteBuf[01]; // ����
  LastDate.MM := ByteBuf[02]; // ����������
  LastDate.DD := ByteBuf[03]; // ���������
  HeaderSize  := ByteBuf[08] +
                 ByteBuf[09]*256; // ������ ���������
  RecLen      := ByteBuf[10] +
                 ByteBuf[11]*256; // ����� ����� ������
  RecCount    := ByteBuf[04] +
                 ByteBuf[05]*256 +
                 ByteBuf[06]*256*256 +
                 ByteBuf[07]*256*256*256; // ���-�� �������
  FieldsCount := (HeaderSize - 32 - 1) div 32; // ���-�� �����

  // ������ ���������� � �����
  try
    off:= 1; // �������� ���� � ������
    for i:= 0 to FieldsCount do begin
      fBase.Seek(i*32+32, soFromBeginning);
      fBase.Read(ByteBuf, 32);

      Fields[i].fName:= '';
      for j:= 0 to 10 do
        if ByteBuf[j]=0 then
          Break
        else
          Fields[i].fName:= Fields[i].fName + chr(ByteBuf[j]);

      Fields[i].fType := chr(ByteBuf[11]);
      Fields[i].fLen  := ByteBuf[16];
      Fields[i].fDec  := ByteBuf[17];
      Fields[i].fOff  := off;
      off:= off + Fields[i].fLen;
    end;
  except
    raise Exception.Create('������ ������ ���������� � ����� ����� "' + FileName + '"');
  end;
end;


// ���������� ������, �������� �������
destructor TDBFLite.Done;
begin
  // ��� �� ��� �������� ���� ���������� �����������
  // � � ���������� ������ ��� ���� ����������
  fBase.Free;
  if IsMemo then
    fMemo.Free;
end;


// ������� ��������� ������
function TDBFLite.Deleted(const aRec: integer): boolean;
var
  j: longint;
  c: char;
begin
  c:= ' '; // ������� �������������
  j:= HeaderSize + aRec*RecLen + Fields[0].fOff - 1;
  fBase.Seek(j, soFromBeginning);
  fBase.Read(c, 1);
  Result:= c = '*';;
end;


// �������� ������
procedure TDBFLite.Delete(const aRec: integer);
var
  c: char;
  j: longint;
begin
  if aRec<=RecCount then begin
    c:= '*'; // ���� - ������� ��������� ������
    j:= HeaderSize + aRec*RecLen + Fields[0].fOff-1; // ������� �������������� ������
    fBase.Seek(j, soFromBeginning);
    fBase.WriteBuffer(c, 1); // � ����� ������
  end;
end;


// �������������� ������
procedure TDBFLite.UnDelete(const aRec: integer);
var
  c: char;
  j: longint;
begin
  if aRec<=RecCount then begin
    c:= ' '; // ������ - ������� ����������� ������
    j:= HeaderSize + aRec*RecLen + Fields[0].fOff-1; // ������� �������������� ������
    fBase.Seek(j, soFromBeginning);
    fBase.WriteBuffer(c, 1); // � ����� ������
  end;
end;


// ������� �������
procedure TDBFLite.Zap;
var
  ByteBuf: TByteBuf;
begin
  fBase.Size:= HeaderSize; // ������� ���� �� ������� ���������
  ByteBuf[0]:= 26; // 1A
  fBase.Seek(0, soFromEnd); // ������� ������� ��������� ������
  fBase.WriteBuffer(ByteBuf, 1);

  RecCount:= 0;
  ByteBuf[0]:= (RecCount                ) mod 256;
  ByteBuf[1]:= (RecCount div 256        ) mod 256;
  ByteBuf[2]:= (RecCount div 256*256    ) mod 256;
  ByteBuf[3]:= (RecCount div 256*256*256) mod 256;
  fBase.Seek(4, soFromBeginning); // �������������� ���-�� �������
  fBase.WriteBuffer(ByteBuf, 4);  // ��������� � ����� ���-�� �������
end;


// ����� ������ ���� �� �����
// �������, �� ����� ������������� �� �������� � ��������� ������� �����
// �� ����, � ��� ��������
function TDBFLite.FieldByName(const FieldName: string): integer;
var
  i: integer;
begin
  i:= 0;
  while (i<FieldsCount) and (Fields[i].fName<>FieldName) do
    inc(i);
  if Fields[i].fName<>FieldName then
    Result:= -1
  else
    Result:= i;
  if Result=-1 then
    raise Exception.Create('���� ' + FieldName + ' �� �������');
end;


// ������ ����� ������ ��� ������
function TDBFLite.ReadCell(const aRec, aField: integer): string;
var
  CharBuf: TCharBuf;
  j: integer;
begin
  if aField<0 then
    raise Exception.Create('����� ���� ������ ���� ������ ��� ����� 0');
  FillChar(CharBuf, SizeOf(CharBuf), #0);
  j:= HeaderSize + aRec*RecLen + Fields[aField].fOff;
  fBase.Seek(j, soFromBeginning);
  fBase.Read(CharBuf, Fields[aField].fLen);
  Result:= Copy(CharBuf, 1, Fields[aField].fLen);
end;


// ������ ���������� �������� ����
function TDBFLite.ReadString(const aRec, aField: integer): string;
begin // ����������� ������� �� �����
  Result:= Trim(ReadCell(aRec, aField));
end;


// ������ ��������� �������� ����
function TDBFLite.ReadInteger(const aRec, aField: integer): integer;
var
  S: string;
begin // ��������� �������� - . 0 1 2 3 4 5 6 7 8 9
  S:= Trim(ReadCell(aRec, aField));
  if S='' then
    S:= '0';
  Result:= StrToIntDef(S, 0); // ��� ������ ���������� 0 (����� Raise ������)
end;


// ������ ����������� �������� ����
function TDBFLite.ReadBool(const aRec, aField: integer): boolean;
var
  S: string;
begin // ��������� �������� ? Y y N n T t F f (? - �� ����������������)
  S:= Trim(ReadCell(aRec, aField));
  if (S<>'') and (S[1] in ['Y', 'y', 't', 'T', '1']) then
    Result:= true
  else
    Result:= false;
end;


// ������ �������� ���� ���� ����
function TDBFLite.ReadDate(const aRec, aField: integer): TDate;
var
  Year, Month, Day: Word;
  S: string;
begin
  S:= Trim(ReadCell(aRec, aField));
  Year := StrToIntDef(Copy(S, 1, 4), 1001);
  Month:= StrToIntDef(Copy(S, 5, 2), 1);
  Day  := StrToIntDef(Copy(S, 7, 2), 1);
  try
    Result:= EncodeDate(Year, Month, Day);
  except
    Result:= 0;
  end;
end;


// ����������� ��������� ���� � TData
function StringDBFToDate(const S: string): TDate;
var
  Year, Month, Day: Word;
begin
  Year := StrToIntDef(Copy(S, 1, 4), 1001);
  Month:= StrToIntDef(Copy(S, 5, 2), 1);
  Day  := StrToIntDef(Copy(S, 7, 2), 1);
  try
    Result:= EncodeDate(Year, Month, Day);
  except
    Result:= 0;
  end;
end;


// ������ MEMO ������
function TDBFLite.ReadMemo(const aRec, aField: integer): string;
var
  ByteBuf: TByteBuf; // ��������  �����
  CharBuf: TCharBuf; // ��������� �����
  Len: Longword;
  Beg: integer;
begin
  FillChar(CharBuf, SizeOf(CharBuf), #0);
  FillChar(ByteBuf, SizeOf(ByteBuf), #0);

  //Beg:= ReadInteger(aRec, aField) * BlockSize; // ������ ����� � MEMO �����. BlockSize - ����� �����
  Beg:= StrToIntDef(ReadString(aRec, aField), -1) * BlockSize; // ������ ����� � MEMO �����. BlockSize - ����� �����
  Result:= '';
  if Beg>=0 then begin
    fMemo.Seek(Beg, soFromBeginning); // ������������� ������
    fMemo.Read(ByteBuf, 8); // ��������� ����� MEMO

    // ������ ����� MEMO � ������
    try // ��� ���������� MEMO ����� ������ ������ ������
      Len:= ByteBuf[4] * 256 * 256 * 256 +
            ByteBuf[5] * 256 * 256 +
            ByteBuf[6] * 256 +
            ByteBuf[7];
    except
      Len:= 0;
    end;

    if Len>0 then begin
      if Len>32766 then
        Len:= 32766;
      try
        fMemo.Read(CharBuf, Len); // ��������� MEMO
        Result:= TrimRight(Copy(CharBuf, 1, Len));
      except
        Result:= '';
      end;
    end;
  end;
end;


// ������� ������ ������ � ����� �����
procedure TDBFLite.Insert;
var
  CharBuf: TCharBuf;
  ByteBuf: TByteBuf;
  j: integer;
begin
  FillChar(CharBuf, RecLen, #32); // �������� ���������

  //j:= HeaderSize + aRec*RecLen + Fields[aField].fOff;
  // ������ � ����� ����� - 1 ����, �.�. ��������� ���� ������ #26 (1A)
  j:= HeaderSize + RecCount*RecLen + Fields[0].fOff-1;
  fBase.Seek(j, soFromBeginning);
  //j:= fBase.Size;

  {fBase.Seek(0, soFromEnd); // ������ � ����� �����}
  CharBuf[RecLen+1]:= #26; // ��������� �������� ������� 1A
  fBase.WriteBuffer(CharBuf, RecLen+1);
  inc(RecCount);
  ByteBuf[0]:= (RecCount                  ) mod 256;
  ByteBuf[1]:= (RecCount div 256          ) mod 256;
  ByteBuf[2]:= (RecCount div (256*256)    ) mod 256;
  ByteBuf[3]:= (RecCount div (256*256*256)) mod 256;
  fBase.Seek(4, soFromBeginning); // �������������� ���-�� �������
  fBase.WriteBuffer(ByteBuf, 4);  // ��������� � ����� ���-�� �������
end;

// ������ ������ ��� ������
procedure TDBFLite.WriteCell(const aRec, aField: integer; const S: string); // ������ ������ ��� ������
var
  CharBuf: TCharBuf;
  j, L: integer;
begin
  if aField<0 then
    raise Exception.Create('����� ���� ������ ���� ������ ��� ����� 0');
  if aRec>RecCount-1 then // ��������� ������ � �����
    Insert;
  // ��������� �����
  FillChar(CharBuf, Fields[aField].fLen, #32);
  L:= Length(S);
  if L>Fields[aField].fLen then // �� ������ �������� ������
    L:= Fields[aField].fLen;
  for j:= 1 to L do
    CharBuf[j]:= S[j]; // ��� ��� � ����� ����� ��������� ������?

  j:= HeaderSize + aRec*RecLen + Fields[aField].fOff; // ������� �������������� ������
  fBase.Seek(j, soFromBeginning);
  fBase.WriteBuffer(CharBuf, Fields[aField].fLen);           // � ����� ������
end;


// ������ ���������� �������� ����
procedure TDBFLite.WriteString(const aRec, aField: integer; const S: string); // ������ ������ ��� ������
begin
  {if  (Fields[aField].fType<>'C')
  and (Fields[aField].fType<>'D')
  then
    raise Exception.Create('�������� ��� ��������');}
  if Length(S)>Fields[aField].fLen then // �� ������ �������� ������
    WriteCell(aRec, aField, Copy(S, 1, Fields[aField].fLen))
  else
    WriteCell(aRec, aField, S)
    //WriteCell(aRec, aField, Format('%' + IntToStr(Fields[aField].fLen)+ 's', [S]))
end;


// ������ ��������� �������� ����
procedure TDBFLite.WriteInteger(const aRec, aField, x: integer);
var
  S: string;
begin
  // �� ���� ��������� ��������. ������ ����������� � ��������� ����� �����
  // �������� ����� �������� � ��������� ���� 
  {if Fields[aField].fType<>'N' then
    raise Exception.Create('�������� ��� ��������');}
  S:= Format('%' + IntToStr(Fields[aField].fLen) + 'd', [x]);
  if Length(S)>Fields[aField].fLen then // �������� �� ������, ���� ����������
    S:= Copy(S, 1, Fields[aField].fLen);

  WriteCell(aRec, aField, S); // ����� ��� ������
end;

// ������ ��������� �������� ���� decimal
procedure TDBFLite.WriteDecimal(const aRec, aField:integer; x: real);
var
  S: string;
begin
  // �� ���� ��������� ��������. ������ ����������� � ��������� ����� �����
  // �������� ����� �������� � ��������� ����
  {if Fields[aField].fType<>'N' then
    raise Exception.Create('�������� ��� ��������');}
  S:= Format('%' + IntToStr(Fields[aField].fLen)+'.'+IntToStr(Fields[aField].fDec) + 'd', [x]);
  if Length(S)>Fields[aField].fLen then // �������� �� ������, ���� ����������
    S:= Copy(S, 1, Fields[aField].fLen);

  WriteCell(aRec, aField, S); // ����� ��� ������
end;

// ������ ����������� �������� ����
procedure TDBFLite.WriteBool(const aRec, aField: integer; b: boolean);
var
  S: string;
begin // ��������� �������� ? Y y N n T t F f (? - �� ����������������)
  if Fields[aField].fType<>'L' then
    raise Exception.Create('�������� ��� ��������');
  if b then
    S:= BoolTrue
  else
    S:= BoolFalse;
  WriteCell(aRec, aField, S); // ����� ��� ������
end;


// ������ �������� ���� ���� ����
procedure TDBFLite.WriteDate(const aRec, aField: integer; d: TDate);
var
  Year, Month, Day: Word;
  S: string;
begin
  DecodeDate(d, Year, Month, Day);
  if {(Year>=0) and} (Year<=9) then
    Year:= 2000 + Year;
  if (Year>=10) and (Year<=99) then
    Year:= 1900 + Year;
  S:= IntToStr(Year);
  if Month<10 then
    S:= S + '0' + IntToStr(Month)
  else
    S:= S +       IntToStr(Month);
  if Day<10 then
    S:= S + '0' + IntToStr(Day)
  else
    S:= S +       IntToStr(Day);
  WriteCell(aRec, aField, S);
end;


// ���������� MEMO ������ � ����� �����
procedure TDBFLite.WriteMEMO(const aRec, aField: integer; const S: string);
var
  i,
  L  : word; // ����� MEMO ������
  Len: word; // ����� ������, ������� BlockSize
  CurrentBlock: integer;
  CharBuf: TCharBuf;
  ByteBuf: TByteBuf;
begin
  if Fields[aField].fType<>'M' then
    raise Exception.Create('�������� ��� ��������');
  // �������� ������ �� MEMO ����, ���� ������ ������
  if Trim(S)='' then begin
    WriteCell(aRec, aField, '          ');
    Exit;
  end; // ����� ������� ������

  L:= Length(S);
  Len:= ((L+8) div BlockSize) * BlockSize; // 8 - ����� ��������� ������
  if ((L+8) mod BlockSize)<>0 then
    Len:= Len + BlockSize; // ����� ������ ��� ������ � ������

  FillChar(CharBuf, Len+8, #0);
  FillChar(ByteBuf, Len+8, #0);

  // ��������� ��������� MEMO ������
  // ��� ��� ���� ����� �����-�� ����� ���������� � ����� 1234
  CharBuf[8]:= CHR((L                ) mod 256);
  CharBuf[7]:= CHR((L div 256        ) mod 256);
  CharBuf[6]:= CHR((L div 256*256    ) mod 256);
  CharBuf[5]:= CHR((L div 256*256*256) mod 256);

  // �������� ������ � �����
  for i:= 1 to L do
    CharBuf[i+8]:= S[i];

  // 1. ������� ������ MEMO
  fMemo.Seek(NextBlock * BlockSize, soFromBeginning);
  fMemo.WriteBuffer(CharBuf, Len);

  // �������� ������������ �������� �����
  CurrentBlock:= NextBlock;

  // ������������ ���������� �����
  NextBlock:= NextBlock + Len div BlockSize;
  // ��������� MEMO �����
  ByteBuf[0]:= (NextBlock div 256*256*256) mod 256;
  ByteBuf[1]:= (NextBlock div 256*256    ) mod 256;
  ByteBuf[2]:= (NextBlock div 256        ) mod 256;
  ByteBuf[3]:= (NextBlock                ) mod 256;

  // 2. ������� ��������� MEMO �����
  fMemo.Seek(0, soFromBeginning);
  fMemo.WriteBuffer(ByteBuf, 4);

  // 3. ������� ������ �� MEMO ���� � ����
  WriteInteger(aRec, aField, CurrentBlock);
end;

END.

