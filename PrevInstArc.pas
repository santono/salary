unit PrevInstArc;

interface

uses  Windows;

var mmmArc:boolean; //��� ���������� ���� true �� ��������� ��� ��������

implementation

var

hMutex : integer;
begin

mmmArc:=false;
hMutex:=CreateMutex(nil,TRUE,'AbraShvabraArc');       // ������� �������
if GetLastError <> 0 then mmmArc:=true;       // ������ ������� ��� ������
ReleaseMutex(hMutex);
end.


