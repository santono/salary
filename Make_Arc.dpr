program Make_Arc;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  UArc in 'UArc.pas';
 var s:string;
begin
  s:=getFlowMonth;
  makeArcDir;
  s:=MakeArchivForData;
  if length(trim(s))>0 then
     error('Архив записан в файл '+s);
//  readln(s);
  { TODO -oUser -cConsole Main : Insert code here }
end.
