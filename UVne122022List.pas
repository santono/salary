unit UVne122022List;

interface
 USes classes;
  type
    PVne122023Rec=^TVne122023Rec;
    TVne122023Rec=record
                   tabno:Integer;
                   GUID:String;
                   shifrGru:Integer;
                  end;
  var
    vne122023List:TList;
  function initVne122023List:Boolean;
  procedure convertGruForPodr;
implementation
uses ScrDef,ScrUtil,SysUtils,Dialogs;

function initVne122023List:Boolean;
 var fName:string;
     dev:TextFile;
     line,s:string;
     vne122023Rec:pVne122023Rec;
     lineNo:Integer;
     arrStr:TArrOfString;
     iVal,iErr:Integer;
     aVal:Real;
 begin
      if not (
          (CURRYEAR=2023) and
          (FLOW_MONTH=4)
         ) then
         begin
              initVne122023List:=False;
              Exit;
         end;
      fName:=cdir+'vne122022List.csv';
      if not fileExists(fName) then
         begin
              showMessage('Отсутствует файл '+fName);
              initVne122023List:=False;
              Exit;
         end;
      vne122023List:=TList.Create;
      AssignFile(dev,fname);
      Reset(dev);
      lineNo:=0;
      while not Eof(dev) do
        begin
             inc(lineNo);
             Readln(dev,line);
             if lineno=1 then
                Continue;
             line:=Trim(line);
             if Length(line)<30 then
                Continue;
             arrStr:=Split(line,';');
             if high(arrStr)<2 then
                Continue;
             New(vne122023Rec);
             FillChar(vne122023Rec^,SizeOf(vne122023Rec^),0);
             s:=arrStr[0];
             s:=Trim(s);
             Val(s,iVal,iErr);
             if iErr=0 then
                vne122023Rec^.tabno:=iVal
             else
                Continue;
             s:=arrStr[1];
             vne122023Rec^.GUID:=trim(s);
             s:=arrStr[2];
             s:=Trim(s);
             Val(s,iVal,iErr);
             if iErr=0 then
                vne122023Rec^.shifrGru:=iVal
             else
                Continue;
             vne122023List.add(vne122023Rec);
        end;
      CloseFile(dev);
      initVne122023List:=true;
 end;

procedure changeShifrGruPerson(curr_person:person_ptr);
 var guid:string;
     finded:boolean;
     i:Integer;
 begin
      if vne122023List=nil then
         Exit;
      if not (
          (CURRYEAR=2023) and
          (FLOW_MONTH=4)
         ) then
         Exit;
      if not (NMES in [1,2,3]) then
         Exit;   
      guid:=GetGUIDPersonToString(curr_person);
      finded:=False;
      if vne122023List.count>0 then
         for i:=0 to vne122023List.count-1 do
             begin
                  if Trim(pVne122023Rec(vne122023List.Items[i]).GUID)=Trim(guid) then
                  if pVne122023Rec(vne122023List.Items[i]).tabno=curr_person^.tabno then
                     begin
                          curr_person^.GRUPPA:=pVne122023Rec(vne122023List.Items[i]).shifrGru;
                          finded:=True;
                          Break;
                     end;
             end;
 end;

procedure convertGruForPodr;
 var curr_person:PERSON_PTR;
 begin
      curr_person:=head_person;
      while (curr_person<>nil) do
       begin
            changeShifrGruPerson(curr_person);
            curr_person:=curr_person^.next;
       end;

 end;

begin
     vne122023List:=nil;
end.
