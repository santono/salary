unit toMoodle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ComboBox1: TComboBox;
    XMLDocument1: TXMLDocument;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    function RecursiveFindNode(ANode: IXMLNode; const SearchNodeName: string): IXMLNode;
    function getLine(vNode:IXMLNode):widestring;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var fNameI,FNameO:string;
    devi,devo:textFile;
    s:widestring;
    s1:widestring;
    i:integer;
begin
     if not OpenDialog1.Execute then exit;
     fNameI:= OpenDialog1.FileName;
     FNameO:=ExtractFilePath(fnamei)+'output.txt';
     AssignFile(devi,fnamei);
     AssignFile(devo,fnameo);
     Reset(devi);
     reWrite(devo);
     i:=0;
     while not eof(devi) do
      begin
           readln(devi,s);
           inc(i);
           s1:='::TRBDZ '+trim(intToStr(i))+'::'+trim(s)+'{}';
           writeln(devo,s1);
           writeln(devo);
           writeln(devo);
      end;
     closeFile(devo);
     closeFile(devi);
     showMessage('Конвертация закончена');
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var fNameI:string;
  s,s1,st:widestring;
  vNode,vvNode,avNode : IXMLNode;
  vNodeDescription:IXMLNode;
  xName:string;
  cntQuestion:integer;
  cntAns:integer;
  i,j:integer;
  devo:textFile;
  fNameO:string;
  isCorrect:boolean;
  cntCorrect:integer;
  procInt:integer;
  procFloat:real;
  tstProc:integer;
  cntWrong:integer;
  procStr:string;
  lineno:integer;
begin
     cntWrong:=0;
     if not OpenDialog1.Execute then exit;
     fNameI:= OpenDialog1.FileName;
     FNameO:=ExtractFilePath(fnamei)+'output.txt';
     XMLDocument1.LoadFromFile(fNameI);
     XMLDocument1.Active := true;
     xName:='QUESTION';
//     cntQuestion:=XMLDocument1.DocumentElement.ChildNodes['TUTORIAL'].ChildNodes[xName].ChildNodes.count -1;
     cntQuestion:=XMLDocument1.DocumentElement.ChildNodes['TUTORIAL'].ChildNodes.count;
     AssignFile(devo,fnameo);
     reWrite(devo);
     lineno:=0;
     for i:=0 to cntQuestion-1 do
       begin
             vNode:=XMLDocument1.DocumentElement.ChildNodes['TUTORIAL'].ChildNodes[i];
             vvNode:=vNode.ChildNodes['DESCRIPTION'];
             s:=getLine(vvNode);

             if pos('PHP',S)>0 then continue;
             if pos('РНР',S)>0 then continue;
             if pos('XML',S)>0 then continue;
             if pos('php',S)>0 then continue;
             if pos('xml',S)>0 then continue;
             if pos('xsl',S)>0 then continue;
             if pos('XSL',S)>0 then continue;
             if pos('DTD',S)>0 then continue;
             if pos('dtd',S)>0 then continue;
             if pos('fopen',S)>0 then continue;
             if pos('$',S)>0 then continue;
             if pos('include',S)>0 then continue;
             if pos('require',S)>0 then continue;

             if i>149 then break;
             inc(lineno);
             s1:='::ВТ '+trim(intToStr(lineno))+'::[html]'+trim(s)+'{';
             writeln(devo,s1);
             if vNode.Attributes['TYPE']='Multiple-Choice' then
                begin
                   cntAns:=vNode.ChildNodes['CHOICES'].ChildNodes.count;
                   for j:=0 to cntAns-1 do
                       begin
                           avNode:=vNode.ChildNodes['CHOICES'].ChildNodes[j];
                           isCorrect:=false;
                           if avNode.Attributes['ISCORRECT']='CORRECT' then
                              isCorrect:=true;
                           s:=getLine(avNode);
                           if isCorrect then
                              writeln(devo,'	=[html]'+trim(s))
                           else
                              writeln(devo,'	~[html]'+trim(s));
                       end;
(*                     if vNode.ChildNodes['DESCRIPTION'].IsTextElement then
                        begin
                     //        s:=vNode.ChildNodes['DESCRIPTION'].Text;
                             s:=vNode.ChildNodes['DESCRIPTION'].Text;
                  //   vNodeDescription:=vNode.ChildNodes['DESCRIPTION'];
                  //   showMessage(vNodeDescription.NodeName+' '+s);
                             s1:='::B '+trim(intToStr(i))+'::[html]'+trim(s)+'{}';
                             writeln(devo,s1);
                             writeln(devo);
                             writeln(devo);
                        end
                     else
                        begin
                             s:='';
                             for j:=0 to vNode.ChildNodes['DESCRIPTION'].ChildNodes.count-1 do
                                 begin
                                      st:='';
                               //  showMessage(vNode.ChildNodes['DESCRIPTION'].ChildNodes[j].NodeName);
                                 if vNode.ChildNodes['DESCRIPTION'].ChildNodes[j].NodeName='#text' then
                                   begin
                                        st:= vNode.ChildNodes['DESCRIPTION'].ChildNodes[j].text;
                                        st:=stringReplace(st,'{','\{',[rfReplaceAll]);
                                        st:=stringReplace(st,'}','\}',[rfReplaceAll]);
                                        st:=stringReplace(st,chr(13),'\n',[rfReplaceAll]);
                                        st:=stringReplace(st,chr(10),'\n',[rfReplaceAll]);
                                   end
                                 else
                                 if vNode.ChildNodes['DESCRIPTION'].ChildNodes[j].NodeName='br' then
                                   st:='<br />';
                                  s:=s+st;
                                 end;
                             s1:='::B '+trim(intToStr(i))+'::[html]'+trim(s)+'{}';
                             writeln(devo,s1);
                             writeln(devo);
                             writeln(devo);
                         //   showMessage(intToStr(vNode.ChildNodes['DESCRIPTION'].ChildNodes.count));
                        end;
*)
                end
             else
             if vNode.Attributes['TYPE']='Poly-Choice' then
                begin
                   cntAns:=vNode.ChildNodes['CHOICES'].ChildNodes.count;
                   cntCorrect:=0;
                   for j:=0 to cntAns-1 do
                       begin
                           avNode:=vNode.ChildNodes['CHOICES'].ChildNodes[j];
                           if avNode.Attributes['ISCORRECT']='CORRECT' then
                              inc(cntCorrect);
                       end;
                   procInt:=0;
                   if cntCorrect=1 then procInt:=100
                   else
                      begin
                          procFloat:=100.00/cntCorrect;
                          procInt:=trunc(procFloat);
                      end;
                   procStr:=intToStr(procInt);
                   if cntCorrect=3 then
                      procStr:='33.33333'
                   else
                   if cntCorrect=6 then
                      procStr:='16.66667'
                   else
                   if cntCorrect=7 then
                      procStr:='14.28571';
                   tstProc:=0;
                   for j:=0 to cntAns-1 do
                       begin
                           avNode:=vNode.ChildNodes['CHOICES'].ChildNodes[j];
                           if avNode.Attributes['ISCORRECT']='CORRECT' then
                              tstProc:=tstProc+procInt;
                       end;
                   if tstProc<>100 then
                      inc(cntWrong);
                   for j:=0 to cntAns-1 do
                       begin
                           avNode:=vNode.ChildNodes['CHOICES'].ChildNodes[j];
                           isCorrect:=false;
                           if avNode.Attributes['ISCORRECT']='CORRECT' then
                              isCorrect:=true;
                           s:=getLine(avNode);
                           if isCorrect then
                              writeln(devo,'	~%'+procStr+'%[html]',trim(s))
                           else
                              writeln(devo,'	~[html]'+trim(s));
//                           if tstProc-100 then
//                              writeln(devo,'	---------------',tstProc);
                       end;
                end
             else
             if vNode.Attributes['TYPE']='Word-Match' then
                begin
                   cntAns:=vNode.ChildNodes['CHOICES'].ChildNodes.count;
                   for j:=0 to cntAns-1 do
                       begin
                           avNode:=vNode.ChildNodes['CHOICES'].ChildNodes[j];
                           s:=getLine(avNode);
                           writeln(devo,'	=%100%[html]'+trim(s)+'#');
                       end;
                end;
             writeln(devo,'}');
             writeln(devo);
             writeln(devo);


       end;
     showMessage('cntQuestion='+intToStr(cntQuestion)+' cntWrong='+intToSTr(cntWrong));
     closeFile(devo);
     showMessage('Конвертация закончена');
   //  vNode := RecursiveFindNode( vXML.DocumentElement, xName );
end;

function TForm1.getLine(vNode:IXMLNode):widestring;
var retVal:widestring;
    s,s1,st,s3:widestring;
    j:integer;
begin
     retVal:='';
     if vNode.IsTextElement then
//     if vNode.NodeName='#text'  then
        retVal:=vNode.Text
     else
        begin
             s:='';
             for j:=0 to vNode.ChildNodes.count-1 do
                  begin
                       st:='';
                       if vNode.ChildNodes[j].NodeName='#text' then
                          begin
                               st:= vNode.ChildNodes[j].text;
                               st:=stringReplace(st,'{','\{',[rfReplaceAll]);
                               st:=stringReplace(st,'}','\}',[rfReplaceAll]);
                               st:=stringReplace(st,chr(13),'\n',[rfReplaceAll]);
                               st:=stringReplace(st,chr(10),'\n',[rfReplaceAll]);
                          end
                       else
                       if vNode.ChildNodes[j].NodeName='br' then
                          st:='<br />'
                       else
                       if vNode.ChildNodes[j].NodeName='IMG' then
                          begin
                               st:='<IMG src\="@@PLUGINFILE@@/BD';
                               //src\="@@PLUGINFILE@@/WebEr1.gif" alt\="Картинка" width\="568" height\="190" /
                               s3:=vNode.ChildNodes[j].Attributes['src'];
                               if pos('%%IMAGES%%',s3)>0 then
                                  s3:=copy(s3,length('%%IMAGES%%')+1,length(s3)-length('%%IMAGES%%'));
                               st:=st+s3;
                               st:=st+'" alt\="Картинка" />';
                          end;
                       s:=s+st;
                  end;
           retVal:=s;
        end;
     retVal:=trim(retVal);
//     if length(retVal)>2 then
//     if pos(retVal,'\n')=0 then
//        retVal:=substrcopy(retVal,2,length(retval-2));
     getLine:=retVal;
end;
function TForm1.RecursiveFindNode(ANode: IXMLNode; const SearchNodeName: string): IXMLNode;
var
  I: Integer;
begin
  Result := nil;
  if AnsiUpperCase(ANode.NodeName) = AnsiUpperCase(SearchNodeName) then
  begin
    Result := ANode;
    exit;
  end;
  if not ANode.HasChildNodes then exit;

  for I := 0 to ANode.ChildNodes.Count - 1 do
  begin
    Result := RecursiveFindNode(ANode.ChildNodes[I], SearchNodeName);
    if Assigned(Result) then Exit;
  end;
end;
end.
