unit PrevInst;

interface

uses  Windows;

var mmm:boolean; //��� ���������� ���� true �� ��������� ��� ��������

implementation

var

hMutex : integer;
begin

mmm:=false;
hMutex:=CreateMutex(nil,TRUE,'AbraShvabra');       // ������� �������
if GetLastError <> 0 then mmm:=true;       // ������ ������� ��� ������
ReleaseMutex(hMutex);
end.


