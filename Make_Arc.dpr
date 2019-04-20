program Make_Arc;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  UArc in 'UArc.pas';
 var s:string;
begin
  error('Archiv creation Started',1);
  s:=getFlowMonth;
  error('getFlowMonth passed',1);
  makeArcDir;
  error('makeArcDir passed',1);
  s:=MakeArchivForData;
  if length(trim(s))>0 then
     error('Архив записан в файл '+s);
//  readln(s);
  { TODO -oUser -cConsole Main : Insert code here }
end.
