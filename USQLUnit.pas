unit USQLUnit;

interface
  function SQLQueryRecValues(SQLStmnt:WideString):variant;
  procedure SQLExecute(SQLStmnt:WideString);
  function SQLQueryValue(SQLStmnt:WideString;fieldNo:integer=0):variant;
  procedure setSal;
  procedure setArc;

implementation
 uses UFibModule,pFIBDatabase,SysUtils,Dialogs;
 var dataBase:TpFIBDatabase;
  function SQLQueryRecValues(SQLStmnt:WideString):variant;
     var retVal:Variant;
     begin
          try
             retVal:=dataBase.QueryValues(SQLStmnt);
          except
             on E:Exception do
                begin
                     ShowMessage('Ошибка выполнения запроса '+SQLStmnt+^M+'Сообщение '+E.Message);
                end;
          end;
          SQLQueryRecValues:=retVal;
     end;
  procedure SQLExecute(SQLStmnt:WideString);
     begin
          try
             dataBase.Execute(SQLStmnt);
          except
             on E:Exception do
                begin
                     ShowMessage('Ошибка выполнения запроса '+SQLStmnt+^M+'Сообщение '+E.Message);
                end;
          end;
     end;
  function SQLQueryValue(SQLStmnt:WideString;fieldNo:integer=0):variant;
     var retVal:Variant;
     begin
          try
             retVal:=dataBase.QueryValue(SQLStmnt,fieldNo);
          except
             on E:Exception do
                begin
                     ShowMessage('Ошибка выполнения запроса '+SQLStmnt+^M+'Сообщение '+E.Message);
                end;
          end;
          SQLQueryValue:=retVal;
     end;
  procedure setSal;
     begin
          dataBase:=FIB.pFIBDatabaseSal;
     end;
  procedure setArc;
     begin
          dataBase:=FIB.pFIBDatabaseArc;
     end;
begin
     dataBase:=nil;
end.
