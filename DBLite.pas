//{$D-}
{*******************************************************}
{                                                       }
{       Простой модуль для работы с DBF файлами         }
{                                                       }
{        Copyright (c) 2003-2004 Серга Плотников        }
{                                                       }
{*******************************************************}

UNIT DBLite;

//  Основные возможности
//  - Чтение, запись строковых, целочисленных,
//    логических, MEMO и дата полей
//  - Восстановление, удаление записей
//  - Признак удаленной записи
//  - Полная очистка таблицы
//
//  Не поддерживаются (и не будут) никакие индексы.
//  После исправления данных индексы лучше удалить
//  и восстановить программой, предназначенной для этого
//  Нет (и не будет) процедуры упаковки таблицы.
//  Нет (и не будет) процедур для создания таблиц
//  Для создания новой таблицы можно скопировать
//  ее структуру из готовой таблицы
//  Конвертацию кодировок DOS <--> WIN написать несложно
//  Готовые решения есть на сайте Королевства Дельфи
//  Модуль тестировался на базе, созданной в FoxPro для Windows

//  ИСТОРИЯ РАЗВИТИЯ:

//  2005.03.21
//  ~~~~~~~~~~
//  + function StringDBFToDate(const S: string): TDate;
//    конвертация строковой даты в TData

//  2004.03.16
//  ~~~~~~~~~~
//  * При чтении MEMO оставались пробелы в конце строки
//    Исправлено

//  2004.02.28
//  ~~~~~~~~~~
//  * Ошибка при добавлении новой записи - неправильно
//    раскладывал число на байты, записывались верно только первые 2.
//    Исправлено

//  2004.02.23
//  ~~~~~~~~~~
//  * Ошибка при чтении MEMO поля длиной более длины буфера (32766)
//    Сделал принудительное обрезание до 32766

//  2004.02.08
//  ~~~~~~~~~~
//  + function TDBFLite.ReadDate(const aRec, aField: integer): TDate;
//  функция дописана, работает

//  2003.10.20
//  ~~~~~~~~~~
//  + function TDBFLite.WriteDate(const aRec, aField: integer): TDate;
//  + function TDBFLite.ReadDate(const aRec, aField: integer): TDate;

//  2003.10.07
//  ~~~~~~~~~~
//  в ReadBool добавлено "1" = TRUE

//  2003.09.20
//  ~~~~~~~~~~
//  + function TDBFLite.ReadBool(const aRec, aField: integer): boolean;
//    чтение логического значения поля
//    при пустом значении возвращается false
//  + procedure TDBFLite.WriteBool(const aRec, aField: integer; b: boolean);
//    запись логического значения поля
//    при записи подставляются константы:
//    BoolTrue : string[1] = 'T'; // значение поля при записи true
//    BoolFalse: string[1] = 'F'; // значение поля при записи false

//  2003.09.18
//  ~~~~~~~~~~
//  + procedure TDBFLite.Zap;
//    Быстрая очистка таблицы. Файл с MEMO данными не очищается.
//
//  - Переписана процедура записи числа. Теперь пробелы слева добавляются
//    не в цикле, а процедурой Format
//
//  - При чтении пустого значения ReadInteger возвращает 0
//
//  - Найдена ошибка при записи MEMO. При длине строки, кратной BlockSize
//    место резервировалось только для строки без учета того, что перед ней
//    записывается заголовок 8 байт - длина строки. Из-за этого вылезали
//    при чтении лишние байты

//  2003.09.16
//  ~~~~~~~~~~
//  - Обнаружена ошибка при добавлении данных методом Insert
//    в конец таблицы. Не учитывалось наличие завершающего символа 1A,
//    поэтому при добавлении большого кол-ва данных происходил сдвиг
//    Теперь запись добавляется в нужное место и в конце записывается 1A
//
//  - Исправлена ошибка неверного кол-ва записей, т.к. раньше
//    байтовый массив нумеровался с единицы, а теперь с нуля
//    Некоторые программы просмотра DBF ругались на неверный
//    формат файла (хорошо, что не все :)
//
//  ! Кстати, наличие MEMO файла указывается где-то в DBF, поэтому
//    при открытии файла надо проверить этот байт и уже в соответствии
//    с ним открывать MEMO файл
//  ! Посмотреть, как выглядят заголовки DBF файлов, созданных
//    разными программами
//  ! Добавить обновление даты файла. Если есть, то, наверно, кому-то и надо

//  2003.09.06
//  ~~~~~~~~~~
//  + procedure TDBFLite.WriteMEMO(const aRec, aField: integer; const S: string);
//    Добавление MEMO данных в конец файла
//    При записи пустой строки ссылка на MEMO стирается
//
//  + function TDBFLite.Deleted(const aRec: integer): boolean;
//    Определене удаленной записи. True, если удалена
//
//  + procedure TDBFLite.Delete(const aRec: integer);
//    Удаление записи, неважно, удалена она или нет
//    Ставит признак удаления записи "*"
//
//  + procedure TDBFLite.UnDelete(const aRec: integer);
//    Восстановление записи, неважно, удалена она или нет

//  2003.09.03
//  ~~~~~~~~~~
//  + function TDBFLite.ReadMemo(const aRec, aField: integer): string;
//    Теперь умеет читать не только обычные, но и MEMO поля
//    Если ссылки на MEMO нет, то возвращает пустую строку

//  2003.02.03
//  ~~~~~~~~~~
//    Начало создания.
//    Написаны процедуры чтения, записи простых типов данных


INTERFACE

uses
  Classes, SysUtils, Dialogs, Controls;

const
  BoolTrue : string[1] = 'T'; // значение поля при записи true
  BoolFalse: string[1] = 'F'; // значение поля при записи false

type
  TTableDate=record // дата последнего обновления (не исправляется)
    YY: byte;       // год
    MM: byte;       // месяц
    DD: byte;       // день
  end;

  TFieldDesc=record // описание поля
    fName: string;  // имя (название)
    fType: char;    // тип (C,L,N,M,F,D)
    fLen : byte;    // длина
    fDec : byte;    // кол-во разрядов после точки
    fOff : word;    // смещение от начала
  end;

  TDBFLite=object             // база
    private
      fBase      : TFileStream; // файловый поток, связанный с файлом базы
      fMemo      : TFileStream; // файловый поток, связанный с MEMO файлом базы
      IsMemo     : boolean;     // есть MEMO файл
    public
      FileName   : string;      // имя файла
      Vers       : byte;        // версия
      LastDate   : TTableDate;  // дата последнего изменения базы (не меняю)
      HeaderSize : word;        // размер заголовка в байтах
      RecCount   : longint;     // кол-во записей
      RecLen     : word;        // длина записи вместе с флагом удаления
      FieldsCount: word;        // кол-во полей
      BlockSize  : word;        // размер блока для записи MEMO поля.
                                // Длина каждого значения MEMO кратна этому числу
      NextBlock  : Longword;    // указатель на следующий свободный блок
                                // (в конце файла. наверно, всегда равен длине файла)

      Fields     : array[0..32766] of TFieldDesc; // массив описаний полей ЛАМЕРСТВО!

 // открываем базу, считываем заголовок
    constructor Init(const FN: string);
 // закрываем базу
    destructor  Done;

 // признак удаленной записи
    function    Deleted(const aRec: integer): boolean;
 // удаление записи
    procedure   Delete(const aRec: integer);
 // восстановление записи
    procedure   UnDelete(const aRec: integer);

 // быстрая очистка таблицы
    procedure   Zap;
 // номер поля по названию
    function    FieldByName(const FieldName: string): integer;

 // чтение текста ячейки как есть по номеру записи, номеру поля
    function    ReadCell   (const aRec, aField: integer): string;
 // чтение строкового значения поля
    function    ReadString (const aRec, aField: integer): string;
 // чтение числового значения поля
    function    ReadInteger(const aRec, aField: integer): integer;
 // чтение логического значения поля
    function    ReadBool   (const aRec, aField: integer): boolean;
 // чтение значения поля типа дата
    function    ReadDate   (const aRec, aField: integer): TDate;
 // чтение MEMO значения поля
    function    ReadMemo   (const aRec, aField: integer): string;

 // вставка пустой записи в конец
    procedure   Insert;

 // запись в ячейку строки как есть
    procedure   WriteCell   (const aRec, aField: integer; const S: string);
 // запись строкового значения поля
    procedure   WriteString (const aRec, aField: integer; const S: string); // запись клетки как строки
 // запись числового значения поля
    procedure   WriteInteger(const aRec, aField, x: integer);
 // запись числового значения поля decimal
    procedure   WriteDecimal(const aRec, aField:integer; x: real);
 // запись логического значения поля
    procedure   WriteBool   (const aRec, aField: integer; b: boolean);
 // запись значения поля типа дата
    procedure   WriteDate   (const aRec, aField: integer; d: TDate);
 // запись MEMO значения поля
    procedure   WriteMEMO   (const aRec, aField: integer; const S: string);
  end;

 // конвертация строковой даты в TData
    function StringDBFToDate(const S: string): TDate;

IMPLEMENTATION

type
  TCharBuf=array [1..32766] of char; // текстовый буфер для чтения записей
  TByteBuf=array [0..31   ] of byte; // числовой  буфер для чтения записей

// начало работы - инициализация, открытие файлов
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
    raise Exception.Create('Ошибка открытия файла "' + FileName + '"')
  end;

  MemoFileName:= Copy(FileName, 1, pos('.', FileName)) + 'FPT';

  if FileExists(MemoFileName) then begin
    fMemo:= TFileStream.Create(MemoFileName, fmOpenReadWrite);
    IsMemo:= true;
    // чтение заголовка MEMO файла
    try
      fMemo.Seek(0, soFromBeginning);
      fMemo.Read(ByteBuf, 31); // читаем заголовок MEMO файла
      // расположение следующего блока (не в байтах)
      NextBlock:= ByteBuf[0] * 256 * 256 * 256 +
                  ByteBuf[1] * 256 * 256 +
                  ByteBuf[2] * 256 +
                  ByteBuf[3];
      // длина блока для записи MEMO в байтах
      BlockSize:= ByteBuf[6] * 256 +
                  ByteBuf[7];
    except
      raise Exception.Create('Ошибка чтения заголовка MEMO файла "' + MemoFileName + '".');
    end;
  end; // if FileExists(MemoFileName) then begin

  try
    fBase.Seek(0, soFromBeginning);
    fBase.Read(ByteBuf, 32); // читаем заголовок файла базы
  except
    raise Exception.Create('Ошибка чтения заголовка файла "' + FileName + '"');
  end;

  // заполнение свойств базы
  Vers        := ByteBuf[00]; // версия файла
  LastDate.YY := ByteBuf[01]; // дата
  LastDate.MM := ByteBuf[02]; // последнего
  LastDate.DD := ByteBuf[03]; // изменения
  HeaderSize  := ByteBuf[08] +
                 ByteBuf[09]*256; // размер заголовка
  RecLen      := ByteBuf[10] +
                 ByteBuf[11]*256; // длина одной записи
  RecCount    := ByteBuf[04] +
                 ByteBuf[05]*256 +
                 ByteBuf[06]*256*256 +
                 ByteBuf[07]*256*256*256; // кол-во записей
  FieldsCount := (HeaderSize - 32 - 1) div 32; // кол-во полей

  // читаем информацию о полях
  try
    off:= 1; // смещение поля в записи
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
    raise Exception.Create('Ошибка чтения информации о полях файла "' + FileName + '"');
  end;
end;


// завершение работы, закрытие потоков
destructor TDBFLite.Done;
begin
  // тут бы еще добавить дату последнего исправления
  // а в процедурах записи эту дату запоминать
  fBase.Free;
  if IsMemo then
    fMemo.Free;
end;


// признак удаленной записи
function TDBFLite.Deleted(const aRec: integer): boolean;
var
  j: longint;
  c: char;
begin
  c:= ' '; // наверно необязательно
  j:= HeaderSize + aRec*RecLen + Fields[0].fOff - 1;
  fBase.Seek(j, soFromBeginning);
  fBase.Read(c, 1);
  Result:= c = '*';;
end;


// удаление записи
procedure TDBFLite.Delete(const aRec: integer);
var
  c: char;
  j: longint;
begin
  if aRec<=RecCount then begin
    c:= '*'; // ежик - признак удаленной записи
    j:= HeaderSize + aRec*RecLen + Fields[0].fOff-1; // находим местоположение записи
    fBase.Seek(j, soFromBeginning);
    fBase.WriteBuffer(c, 1); // и пишем данные
  end;
end;


// восстановление записи
procedure TDBFLite.UnDelete(const aRec: integer);
var
  c: char;
  j: longint;
begin
  if aRec<=RecCount then begin
    c:= ' '; // пробул - признак неудаленной записи
    j:= HeaderSize + aRec*RecLen + Fields[0].fOff-1; // находим местоположение записи
    fBase.Seek(j, soFromBeginning);
    fBase.WriteBuffer(c, 1); // и пишем данные
  end;
end;


// очистка таблицы
procedure TDBFLite.Zap;
var
  ByteBuf: TByteBuf;
begin
  fBase.Size:= HeaderSize; // обрежем файл до размера заголовка
  ByteBuf[0]:= 26; // 1A
  fBase.Seek(0, soFromEnd); // запишем признак последней записи
  fBase.WriteBuffer(ByteBuf, 1);

  RecCount:= 0;
  ByteBuf[0]:= (RecCount                ) mod 256;
  ByteBuf[1]:= (RecCount div 256        ) mod 256;
  ByteBuf[2]:= (RecCount div 256*256    ) mod 256;
  ByteBuf[3]:= (RecCount div 256*256*256) mod 256;
  fBase.Seek(4, soFromBeginning); // местоположение кол-ва записей
  fBase.WriteBuffer(ByteBuf, 4);  // сохраняем в файле кол-во записей
end;


// поиск номера поля по имени
// наверно, их можно отсортировать по алвавиту и применить быстрый поиск
// но влом, и так работает
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
    raise Exception.Create('Поле ' + FieldName + ' не найдено');
end;


// чтение любых данных как строки
function TDBFLite.ReadCell(const aRec, aField: integer): string;
var
  CharBuf: TCharBuf;
  j: integer;
begin
  if aField<0 then
    raise Exception.Create('Номер поля должен быть больше или равен 0');
  FillChar(CharBuf, SizeOf(CharBuf), #0);
  j:= HeaderSize + aRec*RecLen + Fields[aField].fOff;
  fBase.Seek(j, soFromBeginning);
  fBase.Read(CharBuf, Fields[aField].fLen);
  Result:= Copy(CharBuf, 1, Fields[aField].fLen);
end;


// чтение строкового значения поля
function TDBFLite.ReadString(const aRec, aField: integer): string;
begin // завершающие пробелы не нужны
  Result:= Trim(ReadCell(aRec, aField));
end;


// чтение числового значения поля
function TDBFLite.ReadInteger(const aRec, aField: integer): integer;
var
  S: string;
begin // возможные значения - . 0 1 2 3 4 5 6 7 8 9
  S:= Trim(ReadCell(aRec, aField));
  if S='' then
    S:= '0';
  Result:= StrToIntDef(S, 0); // при ошибке возвращает 0 (лучше Raise делать)
end;


// чтение логического значения поля
function TDBFLite.ReadBool(const aRec, aField: integer): boolean;
var
  S: string;
begin // возможные значения ? Y y N n T t F f (? - не инициализировано)
  S:= Trim(ReadCell(aRec, aField));
  if (S<>'') and (S[1] in ['Y', 'y', 't', 'T', '1']) then
    Result:= true
  else
    Result:= false;
end;


// чтение значения поля типа дата
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


// конвертация строковой даты в TData
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


// чтение MEMO данных
function TDBFLite.ReadMemo(const aRec, aField: integer): string;
var
  ByteBuf: TByteBuf; // байтовый  буфер
  CharBuf: TCharBuf; // текстовый буфер
  Len: Longword;
  Beg: integer;
begin
  FillChar(CharBuf, SizeOf(CharBuf), #0);
  FillChar(ByteBuf, SizeOf(ByteBuf), #0);

  //Beg:= ReadInteger(aRec, aField) * BlockSize; // начало блока в MEMO файле. BlockSize - длина блока
  Beg:= StrToIntDef(ReadString(aRec, aField), -1) * BlockSize; // начало блока в MEMO файле. BlockSize - длина блока
  Result:= '';
  if Beg>=0 then begin
    fMemo.Seek(Beg, soFromBeginning); // устанавливаем начало
    fMemo.Read(ByteBuf, 8); // заголовок блока MEMO

    // узнаем длину MEMO в байтах
    try // при разрушении MEMO файла вернет пустую строку
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
        fMemo.Read(CharBuf, Len); // прочитаем MEMO
        Result:= TrimRight(Copy(CharBuf, 1, Len));
      except
        Result:= '';
      end;
    end;
  end;
end;


// вставка пустой записи в конец файла
procedure TDBFLite.Insert;
var
  CharBuf: TCharBuf;
  ByteBuf: TByteBuf;
  j: integer;
begin
  FillChar(CharBuf, RecLen, #32); // забиваем пробелами

  //j:= HeaderSize + aRec*RecLen + Fields[aField].fOff;
  // встаем в конец файла - 1 байт, т.к. последним идет символ #26 (1A)
  j:= HeaderSize + RecCount*RecLen + Fields[0].fOff-1;
  fBase.Seek(j, soFromBeginning);
  //j:= fBase.Size;

  {fBase.Seek(0, soFromEnd); // встаем в конец файла}
  CharBuf[RecLen+1]:= #26; // последним символом запишем 1A
  fBase.WriteBuffer(CharBuf, RecLen+1);
  inc(RecCount);
  ByteBuf[0]:= (RecCount                  ) mod 256;
  ByteBuf[1]:= (RecCount div 256          ) mod 256;
  ByteBuf[2]:= (RecCount div (256*256)    ) mod 256;
  ByteBuf[3]:= (RecCount div (256*256*256)) mod 256;
  fBase.Seek(4, soFromBeginning); // местоположение кол-ва записей
  fBase.WriteBuffer(ByteBuf, 4);  // сохраняем в файле кол-во записей
end;

// запись клетки как строки
procedure TDBFLite.WriteCell(const aRec, aField: integer; const S: string); // запись клетки как строки
var
  CharBuf: TCharBuf;
  j, L: integer;
begin
  if aField<0 then
    raise Exception.Create('Номер поля должен быть больше или равен 0');
  if aRec>RecCount-1 then // добавляем запись в конец
    Insert;
  // заполняем буфер
  FillChar(CharBuf, Fields[aField].fLen, #32);
  L:= Length(S);
  if L>Fields[aField].fLen then // по тихому обрезаем данные
    L:= Fields[aField].fLen;
  for j:= 1 to L do
    CharBuf[j]:= S[j]; // как еще в буфер можно поместить строку?

  j:= HeaderSize + aRec*RecLen + Fields[aField].fOff; // находим местоположение записи
  fBase.Seek(j, soFromBeginning);
  fBase.WriteBuffer(CharBuf, Fields[aField].fLen);           // и пишем данные
end;


// запись строкового значения поля
procedure TDBFLite.WriteString(const aRec, aField: integer; const S: string); // запись клетки как строки
begin
  {if  (Fields[aField].fType<>'C')
  and (Fields[aField].fType<>'D')
  then
    raise Exception.Create('Неверный тип значения');}
  if Length(S)>Fields[aField].fLen then // по тихому обрезаем данные
    WriteCell(aRec, aField, Copy(S, 1, Fields[aField].fLen))
  else
    WriteCell(aRec, aField, S)
    //WriteCell(aRec, aField, Format('%' + IntToStr(Fields[aField].fLen)+ 's', [S]))
end;


// запись числового значения поля
procedure TDBFLite.WriteInteger(const aRec, aField, x: integer);
var
  S: string;
begin
  // не буду проверять значение. Вместо конвертации в программе лучше сразу
  // записать число допустим в строковое поле 
  {if Fields[aField].fType<>'N' then
    raise Exception.Create('Неверный тип значения');}
  S:= Format('%' + IntToStr(Fields[aField].fLen) + 'd', [x]);
  if Length(S)>Fields[aField].fLen then // обрезаем по тихому, если необходимо
    S:= Copy(S, 1, Fields[aField].fLen);

  WriteCell(aRec, aField, S); // пишем как строку
end;

// запись числового значения поля decimal
procedure TDBFLite.WriteDecimal(const aRec, aField:integer; x: real);
var
  S: string;
begin
  // не буду проверять значение. Вместо конвертации в программе лучше сразу
  // записать число допустим в строковое поле
  {if Fields[aField].fType<>'N' then
    raise Exception.Create('Неверный тип значения');}
  S:= Format('%' + IntToStr(Fields[aField].fLen)+'.'+IntToStr(Fields[aField].fDec) + 'd', [x]);
  if Length(S)>Fields[aField].fLen then // обрезаем по тихому, если необходимо
    S:= Copy(S, 1, Fields[aField].fLen);

  WriteCell(aRec, aField, S); // пишем как строку
end;

// запись логического значения поля
procedure TDBFLite.WriteBool(const aRec, aField: integer; b: boolean);
var
  S: string;
begin // возможные значения ? Y y N n T t F f (? - не инициализировано)
  if Fields[aField].fType<>'L' then
    raise Exception.Create('Неверный тип значения');
  if b then
    S:= BoolTrue
  else
    S:= BoolFalse;
  WriteCell(aRec, aField, S); // пишем как строку
end;


// запись значения поля типа дата
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


// добавление MEMO данных в конец файла
procedure TDBFLite.WriteMEMO(const aRec, aField: integer; const S: string);
var
  i,
  L  : word; // длина MEMO строки
  Len: word; // длина строки, кратная BlockSize
  CurrentBlock: integer;
  CharBuf: TCharBuf;
  ByteBuf: TByteBuf;
begin
  if Fields[aField].fType<>'M' then
    raise Exception.Create('Неверный тип значения');
  // затираем ссылку на MEMO поле, если строка пустая
  if Trim(S)='' then begin
    WriteCell(aRec, aField, '          ');
    Exit;
  end; // иначе запишем данные

  L:= Length(S);
  Len:= ((L+8) div BlockSize) * BlockSize; // 8 - длина заголовка строки
  if ((L+8) mod BlockSize)<>0 then
    Len:= Len + BlockSize; // длина блоков для записи в байтах

  FillChar(CharBuf, Len+8, #0);
  FillChar(ByteBuf, Len+8, #0);

  // заполняем заголовок MEMO записи
  // тут еще надо вроде какую-то маску записывать в байты 1234
  CharBuf[8]:= CHR((L                ) mod 256);
  CharBuf[7]:= CHR((L div 256        ) mod 256);
  CharBuf[6]:= CHR((L div 256*256    ) mod 256);
  CharBuf[5]:= CHR((L div 256*256*256) mod 256);

  // копируем строку в буфер
  for i:= 1 to L do
    CharBuf[i+8]:= S[i];

  // 1. Запишем данные MEMO
  fMemo.Seek(NextBlock * BlockSize, soFromBeginning);
  fMemo.WriteBuffer(CharBuf, Len);

  // запомним расположение текущего блока
  CurrentBlock:= NextBlock;

  // расположение следующего блока
  NextBlock:= NextBlock + Len div BlockSize;
  // заголовок MEMO файла
  ByteBuf[0]:= (NextBlock div 256*256*256) mod 256;
  ByteBuf[1]:= (NextBlock div 256*256    ) mod 256;
  ByteBuf[2]:= (NextBlock div 256        ) mod 256;
  ByteBuf[3]:= (NextBlock                ) mod 256;

  // 2. Запишем заголовок MEMO файла
  fMemo.Seek(0, soFromBeginning);
  fMemo.WriteBuffer(ByteBuf, 4);

  // 3. Запишем ссылку на MEMO поле в безе
  WriteInteger(aRec, aField, CurrentBlock);
end;

END.

