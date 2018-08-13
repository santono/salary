

unit UPrivat;

interface
(*
   uses Scrdef,DBTables;
   type PPrivat=^TPrivat;
        TPrivat=class
                Date:TDateTime;
                DBF:TTable;
                WantedBank:integer;
                constructor Init(NewDate:TDateTime;NewWantedBank:integer);
                destructor Done;
                procedure AddItem(Shifr_Gru,Shifr_Kat,W_Place,Tabno,Wr:word;
                                  Summa:real;Fio,Id:string);
                function GetSumma(ShifrGru:word):real;
                procedure CalcSummy;
                procedure PrintReestr;
               end;
*)
implementation
 uses ScrUtil;
 (*
   type PItem=^TItem;
        TItem=record
               ShifrGru : word;
               Summa    : real;
               Kwo      : LongInt;
              end;

    constructor TPrivat.init(NewDate:TDateTime;NewWantedBank:integer);
     var Devi,Devo:file;
         S,NN:string;
         buf:array[1..1024] of byte;
         NumRead,NumWritten:word;
         NeedCreate:boolean;

     begin
          WantedBank:=NewWantedBank;
          Date:=NewDate;
          S:=dtos(NewDate);
          S:=copy(s,1,2)+copy(s,4,2)+copy(s,7,2)+'.dbf';
          if WantedBank=1 then S:=Bank_Privat_Dir+S
                          else
          if WantedBank=2 then S:=Bank_Brok_Dir+S
                          else S:=Bank_Dir+S;
          NeedCreate:=true;
          if FileExist(S) then
             begin
                  if YesNo('Файл '+S+' существует. Удалить его?') then
                     begin
                          Assign(Dev,S);
                          Reset(Dev);
                          Close(Dev);
                          Erase(Dev);
                          if IoResult<>0 then
                             begin
                                  Error('Ошибка удаления файла');
                                  Fail;
                             end;
                     end
                                                                  else NeedCreate:=false;
             end;
          if NeedCreate then
             begin
                   if WantedBank=1 then NN := Bank_Privat_Dir+'Bank.DBF'
                                   else
                   if WantedBank=2 then NN := Bank_Brok_Dir+'Bank.DBF'
                                   else NN := Bank_Dir+'Bank.DBF';
                   FileMode := FileMode or $0002;
                   OpenDb(Dbf,NN);
                   if not Dbf^._Ok then
                      begin
                           Error('Плохой эталонный файл '+NN);
                           Fail;
                      end;
                   CloseDB(Dbf);
                   Assign(Devi,NN);
                   Assign(Devo,S);
                   Reset(Devi,1);
                   ReWrite(Devo,1);
                   repeat
                         BlockRead(Devi,Buf,SizeOf(Buf),NumRead);
                         BlockWrite(Devo,Buf,NumRead,NumWritten);
                   until (NumRead=0) or (NumRead<>NumWritten);
                   Close(Devi);
                   Close(Devo);
            end;
          FileMode:=$0002;
          OpenDb(Dbf,S);
          Dbf^.Zap;
     end;
  destructor TPrivat.Done;
   begin
        CloseDb(Dbf);
   end;

  procedure TPrivat.AddItem(Shifr_Gru,Shifr_Kat,W_Place,Tabno,Wr:word;
                                  Summa:real;Fio,Id:string);
   var S:string;
   begin
        Dbf^.AppendBlank;
        Str(I:5,S);
        DBF^.ReplFld(1,'     1');
        Str(Shifr_Gru:10,S);
        DBF^.ReplFld(2,S);
        Str(Shifr_Kat:10,S);
        DBF^.ReplFld(3,S);
        Str(W_Place:10,S);
        DBF^.ReplFld(4,S);
        Str(Wr:10,S);
        DBF^.ReplFld(5,S);
        Str(Tabno:10,S);
        DBF^.ReplFld(6,S);
        DBF^.ReplFld(7,Fio);
        S:=Name_Serv(W_Place);
        DBF^.ReplFld(8,S);
        Str(Summa:15:2,S);
        DBF^.ReplFld(9,S);
        S:=dtosy(Date);
        S:=copy(S,7,4)+copy(S,4,2)+copy(S,1,2);
        DBF^.ReplFld(10,S);
        S:=Get_Kat_Name(Shifr_Kat);
        DBF^.ReplFld(11,S);
        S:=Get_Ist_Name(Shifr_Gru);
        DBF^.ReplFld(12,S);
        DBF^.ReplFld(13,Id);
   end;

  function TPrivat.GetSumma(ShifrGru:word):real;
   var fns:string;
       S:string;
       a:real;
       RetVal:real;
       i,j:integer;
   begin
        RetVal:=0;
        GetSumma:=RetVal;
        DBF^.GotoRec(1);
        if DBF^._FOUND then
           while not DBF^._eof do
                 begin
                      fns := AllTrim(dbf^.getfld(1));
                      if fns='99999' then
                         begin
                              fns := AllTrim(dbf^.getfld(2));
                              val(fns,j,i);
                              if i=0 then
                                 if j=ShifrGru then
                                    begin
                                         fns := AllTrim(dbf^.getfld(9));
                                         val(fns,a,i);
                                         if i=0 then retval:=sum(a);
                                         break;
                                    end;
                         end;
                      DBF^.skip;
                  end;
        GetSumma:=RetVal;
   end;

  procedure TPrivat.CalcSummy;
   var
        i,JIndex : integer;
        fns : string;
        List : PList;
        ShifrGru:word;
        Summa:real;
        Item:PItem;
        SummaTot:real;
        KWoTot:LongInt;
        StatusDialog:PStatusDialog;
   procedure AddItog;
    var s:string;
    begin
         DBF^.AppendBlank;
         S:='99999';
         DBF^.ReplFld(1,S);
         S:='         0';
         DBF^.ReplFld(2,S);
         DBF^.ReplFld(3,S);
         DBF^.ReplFld(4,S);
         DBF^.ReplFld(5,S);
         Str(KWoTot:10,S);
         DBF^.ReplFld(6,S);
         S:='Итого в файле';
         DBF^.ReplFld(7,S);
         Str(SummaTot:15:2,S);
         DBF^.ReplFld(9,S);
         S:=dtosy(Date);
         S:=copy(S,7,4)+copy(S,4,2)+copy(S,1,2);
         DBF^.ReplFld(10,S);
         S:='';
         DBF^.ReplFld(11,S);
         S:='по всем счетам';
         DBF^.ReplFld(12,S);
    end;
   procedure AddLine(Item:Pointer);far;
    var s:string;
    begin
         DBF^.AppendBlank;
         S:='99999';
         DBF^.ReplFld(1,S);
         Str(PItem(Item)^.ShifrGru:10,S);
         DBF^.ReplFld(2,S);
         S:='         0';
         DBF^.ReplFld(3,S);
         DBF^.ReplFld(4,S);
         DBF^.ReplFld(5,S);
         Str(PItem(Item)^.KWo:10,S);
         DBF^.ReplFld(6,S);
         S:='Итого';
         DBF^.ReplFld(7,S);
         Str(PItem(Item)^.Summa:15:2,S);
         DBF^.ReplFld(9,S);
         S:=dtosy(Date);
         S:=copy(S,7,4)+copy(S,4,2)+copy(S,1,2);
         DBF^.ReplFld(10,S);
         S:='';
         DBF^.ReplFld(11,S);
         S:=Get_Ist_Name(PItem(Item)^.ShifrGru);
         DBF^.ReplFld(12,S);
         SummaTot:=Sum(SummaTot) + Sum(PItem(Item)^.Summa);
         KWoTot  := KWoTot       + PItem(Item)^.KWo;
    end;
   begin
        StatusDialog:=New(PStatusDialog,Init('Расчет сумм'));
        SummaTot:=0;
        KWoTot  :=0;
        DBF^.GotoRec(1);
        if DBF^._FOUND then
           while not DBF^._eof do
                 begin
                      fns := AllTrim(dbf^.getfld(1));
                      if fns='99999' then
                      if not dbf^.deleted then dbf^.DeleteRec(dbf^.RecNo);
                      if Assigned(StatusDialog) then StatusDialog^.Update;
                      DBF^.skip;
                  end;
        DBF^.Pack;
        List:=New(PList,Init(20,1));
        DBF^.GotoRec(1);
        if DBF^._FOUND then
           while not DBF^._eof do
                 begin
                      fns := AllTrim(dbf^.getfld(2));
                      if Assigned(StatusDialog) then StatusDialog^.Update;
                      if not dbf^.deleted then
                         begin
                              val(fns,ShifrGru,I);
                              if i=0 then
                                 begin
                                      fns := AllTrim(dbf^.getfld(9));
                                      val(fns,Summa,I);
                                      if i=0 then
                                         begin
                                              if not List^.Search(Addr(ShifrGru),JIndex) then
                                                 List^.Insert(New(PItem,Init(ShifrGru)));
                                              if List^.Search(Addr(ShifrGru),JIndex) then
                                                 begin
                                                      Item:=PItem(List^.At(JIndex));
                                                      Item^.Summa:=Sum(Item^.Summa)+Sum(Summa);
                                                      Inc(Item^.KWo);
                                                 end;
                                         end;
                                 end;
                         end;
                      DBF^.skip;
                  end;
           if List^.Count>0 then List^.ForEach(@AddLine);
           Dispose(List,Done);
           AddItog;
           if Assigned(StatusDialog) then Dispose(StatusDialog,Done);

   end;

 procedure TPrivat.PrintReestr;
  var Dev:Text;
      LineNo:LongInt;
      T:LongInt;
      A:real;
      I,J:integer;
      fns:string;
      StatusDialog:PStatusDialog;
      ShifrKat,ShifrGru,WPlace,Wr,Tabno:integer;
      Summa:real;
      Fio,S:string;
  label M1;
  begin
       LineNo:=0;
       S:=dtos(Date);
       S:=copy(s,1,2)+copy(s,4,2)+copy(s,7,2)+'.txt';
       if WantedBank=1 then S:=Bank_Privat_Dir+S
                       else
       if WantedBank=2 then S:=Bank_Brok_Dir+S
                       else S:=Bank_Dir+S;
       if YesNo('Выводить реестр на принтер?') then Assign(dev,'prn')
                                               else Assign(Dev,S);
       StatusDialog:=New(PStatusDialog,Init('Формирование реестра'));
       ReWrite(dev);
       writeln(dev,' Востояноукраинский национальный университет');
       writeln(dev,' Реестр сумм перечисленных в ЛФ КБ "ПриватБанк"');
       writeln(dev,' Дата '+dtos(Date));

 { Сформировать итоговые данные }

       DBF^.GotoRec(1);
       if DBF^._FOUND then
          while not DBF^._eof do
                begin
                     fns := AllTrim(dbf^.getfld(1));
                     if fns='99999' then
                     if not dbf^.deleted then
                        Begin
                              fns := AllTrim(dbf^.getfld(2));
                              val(fns,j,i);
                              if i=0 then
                                 if j=0 then
                                    begin
                                         fns := AllTrim(dbf^.getfld(9));
                                         val(fns,a,i);
                                         if i=0 then
                                            begin
                                                  fns := AllTrim(dbf^.getfld(6));
                                                  val(fns,T,i);
                                                  if i=0 then
                                                     begin
        writeln(dev,' Реестр содержит ',T:5,' строк. На сумму ',A:14:2,' грв.');
                                                           break;
                                                     end;
                                            end;
                                    end;
                        end;
                     if Assigned(StatusDialog) then StatusDialog^.Update;
                     DBF^.skip;
                 end;

       writeln(dev,' том числе:');

 { Сформировать данные по счетам }

       DBF^.GotoRec(1);
       if DBF^._FOUND then
          while not DBF^._eof do
                begin
                     fns := AllTrim(dbf^.getfld(1));
                     if fns='99999' then
                     if not dbf^.deleted then
                        Begin
                              fns := AllTrim(dbf^.getfld(2));
                              val(fns,j,i);
                              if i=0 then
                                 if j<>0 then
                                    begin
                                         fns := AllTrim(dbf^.getfld(9));
                                         val(fns,a,i);
                                         if i=0 then
                                            begin
                                                  fns := AllTrim(dbf^.getfld(6));
                                                  val(fns,T,i);
                                                  if i=0 then
                                                     begin
                                                          writeln(dev,'счет '+copy(Get_Ist_Name(j)+space(10),1,10),
                                                                      ' строк ',T:5,' на сумму ',A:14:2,' грв.');
                                                     end;
                                            end;
                                    end;
                        end;
                     if Assigned(StatusDialog) then StatusDialog^.Update;
                     DBF^.skip;
                 end;

 { Проход по строкам }

       writeln(dev,'-------------------------------------------------------');
       writeln(dev,': N  :Т.н.: Фамилия И О                  :  Сумма     :');
       writeln(dev,':----:----:------------------------------:------------:');
       LineNo:=0;
       DBF^.GotoRec(1);
       if DBF^._FOUND then
          while not DBF^._eof do
                begin
                     fns := AllTrim(dbf^.getfld(1));
                     if fns<>'99999' then
                     if not dbf^.deleted then
                        Begin
{
                              val(fns,LineNo,i);
                              if I<>0 then goto M1;
}
                              fns := AllTrim(dbf^.getfld(2));
                              val(fns,ShifrGru,i);
                              if I<>0 then goto M1;
                              fns := AllTrim(dbf^.getfld(3));
                              val(fns,ShifrKat,i);
                              if I<>0 then goto M1;
                              fns := AllTrim(dbf^.getfld(4));
                              val(fns,WPlace,i);
                              if I<>0 then goto M1;
                              fns := AllTrim(dbf^.getfld(5));
                              val(fns,WR,i);
                              if I<>0 then goto M1;
                              fns := AllTrim(dbf^.getfld(6));
                              val(fns,Tabno,i);
                              if I<>0 then goto M1;
                              Fio := AllTrim(dbf^.getfld(7));
                              fns := AllTrim(dbf^.getfld(9));
                              val(fns,Summa,i);
                              if I<>0 then goto M1;
                              inc(LineNo);
                              writeln(dev,':',LineNo:4,
                                          ':',Tabno:4,
                                          ':',copy(Fio+space(30),1,30),
                                          ':',Summa:12:2,':');
                        end;
M1:                  if Assigned(StatusDialog) then StatusDialog^.Update;
                     DBF^.skip;
                 end;
        Dispose(StatusDialog,Done);
        Close(Dev);

  end;
 *)
   end.