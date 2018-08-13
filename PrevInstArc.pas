unit PrevInstArc;

interface

uses  Windows;

var mmmArc:boolean; //эта переменная если true то программа уже запущена

implementation

var

hMutex : integer;
begin

mmmArc:=false;
hMutex:=CreateMutex(nil,TRUE,'AbraShvabraArc');       // Создаем семафор
if GetLastError <> 0 then mmmArc:=true;       // Ошибка семафор уже создан
ReleaseMutex(hMutex);
end.


