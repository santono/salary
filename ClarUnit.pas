unit ClarUnit;
interface
  uses classes;
  type RClarionHeader=record
                         Rospis           : longint;  {43 33 A8 00}
                         NumberOfKey      : byte;
                         RecCount         : longint;
                         DeletedRecCount  : longint;
                         NumberOfFields   : longint;
                         Unknown_0        : word;
                         RecLength        : word;
                         DataAddr         : longint;
                         LastActiveRec    : longint;
                         FirstActiveRec   : longint;
                         FirstDeletedRec  : longint;
                         NameOfRecord     : array[1..12] of char;
                         Unknown_1        : array[1..12] of byte;
                         PrefixName       : array[1..3 ] of char;
                         Unknown_2        : array[1..11] of byte;
                         TimeOfLastUpdate : longint;
                         DateOfLastUpdate : longint;
                         Unknown_3        : word;
                   end;
       RClarionFieldHeader=record
                    FieldType   : byte; {01-long,02-real;03-string;05-byte;06-short}
                    FieldName   : array[1..16] of char;
                    FieldOffset : word;
                    FieldLen    : word;
                    Unknown     : array[1..6] of  byte;
                   end;
       PFieldHeader=^TFieldHeader;
       TFieldHeader=class(TObject)
                     FieldHeader:RClarionFieldHeader;
                     Constructor Create(NewFieldHeader:RClarionFieldHeader);
                    end;
       PClarion=^TClarion;
       TClarion=class(TObject)
                 F:file;
                 FileName:string;
                 Header:RClarionHeader;
                 FieldList:TList;
                 PBuffer:Pointer;
                 constructor Create(NewFileName:string;var Succes:boolean);
                 function FieldLen(FieldNo:word):word;
                 function Deleted:boolean;
                 function Go(Recno:longint):boolean;
                 function GetField(FieldNo:word):Pointer;
                 function Write(PMemory:Pointer):boolean;
                 function WriteNo(PMemory:pointer;RecNo:LongInt):boolean;
                 function WriteHeader:boolean;
                 procedure Empty;
                 destructor Destroy;
                end;

implementation
  uses ScrUtil,SysUtils;
  Constructor TFieldHeader.Create(NewFieldHeader:RClarionFieldHeader);
    begin
         FieldHeader:=NewFieldHeader;
    end;

   constructor TClarion.Create(NewFileName:string;var Succes:boolean);
     var
         I:integer;
         ClarionFieldHeader:RClarionFieldHeader;
         S:string;
         Params:LongInt;
         SavFileMode:byte;
     begin
          FileName:=NewFileName;
          if not FileExist(FileName) then
             begin
                  Error('Отсутствует файл '+FileName);
                  Succes:=false;
                  Exit;
             end;
          Assign(F,FileName);
{          Reset(F,1);}
          RESET_NET(F,1,FileName);
          {$I-}  BlockRead(F,Header,SizeOf(Header)); {$I+}
          if IoResult<>0 then
             begin
                  Succes:=false;
                  Close(f);
                  Error('Ошибка чтения заголовка файла '+FileName);
                  Exit;
             end;
{          if Header.Rospis<>$00A83343 then
             begin
                  error(FileName+' не является файлом Clarion');
                  Succes:=false;
                  close(F);
                  Exit;
             end;}
          FieldList:=TList.Create;
          for  I:=1 to Header.NumberOfFields do
           begin
                {$I-} BlockRead(F,ClarionFieldHeader,SizeOf(ClarionFieldHeader));  {$I+}
                if IoResult<>0 then
                   begin
                        Params:=I;
                        S:='Ошибка чтения описателя '+IntToStr(I)+'-го поля файла '+FileName;
                        Error(S);
                        Succes:=false;
                        Close(f);
                        Exit;
                   end;
                FieldList.Add(TFieldHeader.Create(ClarionFieldHeader));
           end;
         GetMem(PBuffer,Header.RecLength);
         Succes:=True;
     end;

  destructor TClarion.Destroy;
   begin
        Close(F);
        FieldList.Destroy;
        FreeMem(PBuffer,Header.RecLength);
   end;

  function TClarion.Go(Recno:longint):boolean;
   type pa=^ta;
         ta=Array[1..77] of byte;
   var S:string;
       Params:LongInt;
       a:ta;
   begin
        if RecNo>Header.RecCount then
           begin
                Go:=false;
                Params:=Header.RecCount;
                S:='В файле '+FileName+' всего '+IntToStr(Header.RecCount)+' записей';
                Error(s);
           end;
        Seek(F,Header.DataAddr+Pred(Recno)*Header.RecLength);
        {$I-} BlockRead(F,Pbuffer^,Header.RecLength); {$I+}
        if IoResult<>0 then
           begin
                Go:=false;
                Params:=Recno;
                S:='Ошибка чтения записи номер '+IntToStr(Recno)+' файла '+FileName;
                Error(s);
                Exit;
           end;
        a:=pa(PBuffer)^;
        Go:=True;
   end;

  function TClarion.Write(PMemory:pointer):boolean;
   var S:string;
       Params:LongInt;
   begin
        Seek(F,Header.DataAddr+Header.Reccount*Header.RecLength);
        {$I-} BlockWrite(F,PMemory^,Header.RecLength); {$I+}
        if IoResult<>0 then
           begin
                Params:=Header.Reccount+1;
                S:='Ошибка при записи записи номер '+IntToStr(Header.Reccount+1)+' файла '+FileName;
                Error(s);
                Write:=false;
                Exit;
           end
                       else
           begin
                Inc(Header.Reccount);
                Inc(Header.LastActiveRec);
                Header.FirstActiveRec:=1;
           end;
        Write:=True;
   end;

  function TClarion.WriteNo(PMemory:pointer;RecNo:LongInt):boolean;
   var S:string;
       Params:LongInt;
   begin
        if RecNo>Header.RecCount then
           begin
                WriteNo:=false;
                Exit;
           end;
        Seek(F,Header.DataAddr+(RecNo-1)*Header.RecLength);
        {$I-} BlockWrite(F,PMemory^,Header.RecLength); {$I+}
        if IoResult<>0 then
           begin
                Params:=Header.Reccount+1;
                S:='Ошибка при записи записи номер '+IntToStr(Header.Reccount+1)+' файла '+FileName;
                Error(s);
                WriteNo:=false;
                Exit;
           end;
        WriteNo:=True;
   end;

  function TClarion.WriteHeader:boolean;
   var S:string;
   begin
        Seek(F,0);
        {$I-} BlockWrite(F,Header,SizeOf(Header)); {$I+}
        if IoResult<>0 then
           begin
                S:='Ошибка при записи записи номер заголовка файла '+FileName;
                Error(s);
                WriteHeader:=false;
                Exit;
           end;
        WriteHeader:=True;
   end;

  function  TClarion.FieldLen(FieldNo:word):word;
   var ClarionField:RClarionFieldHeader;
       S:string;
       Params:Longint;
   begin
        if FieldNo>Header.NumberOfFields then FieldLen:=0
                                         else
           begin
                ClarionField:=PFieldHeader(FieldList.Items[Pred(FieldNo)])^.FieldHeader;
                FieldLen:=ClarionField.FieldLen;
           end;
   end;

  function  TClarion.Deleted:boolean;
   type PByte=^Byte;
   var  Flag:byte;
   begin
        Flag:=PByte(PBuffer)^;
        if Flag>=16 then Deleted:=true
                    else Deleted:=false;
   end;

  function TClarion.GetField(FieldNo:word):Pointer;
   type pa=^ta;
         ta=Array[1..77] of byte;
   var ClarionField:RClarionFieldHeader;
       S:string;
       Params:Integer;
       P:Pointer;
       I,j:integer;
       a,b:ta;
   begin
        if FieldNo>Header.NumberOfFields then
           begin
                GetField:=Nil;
                Params:=Header.NumberOfFields;
                S:='В файле '+FileName+' всего '+IntToStr(Header.NumberOfFields)+' полей';
                Error(S);
                Exit;
           end;
{        ClarionField:=PFieldHeader(FieldList.Items[Pred(FieldNo)])^.FieldHeader;     }
        j:=FieldList.Count;
        i:=Pred(FieldNo);
        ClarionField:=TFieldHeader(FieldList.Items[i]).FieldHeader;
{        GetField:=Ptr(Addr(PBuffer^)+ClarionField.FieldOffset+5);  }
{
        Params:=Addr(PBuffer^);
        Params:=Params+ClarionField.FieldOffset+5;
        GetField:=Ptr(Params+ClarionField.FieldOffset+5);
}
        Params:=ClarionField.FieldOffset+5;
{        GetField:=Ptr(Addr(PBuffer^))+Ptr(Params);}
        a:=pa(PBuffer)^;
        b:=pa(Ptr(integer(Addr(PBuffer^))+Params))^;
        GetField:=Ptr(integer(Addr(PBuffer^))+Params);
   end;
  procedure TClarion.Empty;
   begin
        seek(F,SizeOf(Header));
        Truncate(F);
        Header.RecCount:=0;
        Header.LastActiveRec:=0;
        Header.FirstActiveRec:=0;
        Header.FirstDeletedRec:=0;
        if WriteHeader then;
   end;


end.
