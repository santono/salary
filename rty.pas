

procedure Cross1OnPrintCell(Memo: TfrxMemoView; RowIndex, ColumnIndex, CellIndex: Integer; RowValues, ColumnValues, Value: Variant);
var svdn : string;
    l    : integer;                                        
begin
     svdn:=<isSVDN>;
     if svdn<>'1' then l:=6
                  else l:=5;                                                                                                                                                                                                                  
     if (ColumnIndex>0) and (ColumnIndex<l) and (RowIndex>0) then
        Memo.HAlign:=haLeft
     else
     if (RowIndex=0) then                             
        Memo.HAlign:=haCenter;  
{
     if VarIsStr(Value)      then                                        
     if (trim(Value)='9999') then
        Value:=' ';
}                 
{   
     if (trim(Memo.Text)='9999') then
        begin                 
            Memo.Text:='';
            Value:='';
        end;
     if (Value<>Nil)then                                               
     if (trim(Value)='9999') then
        begin                 
            Memo.Text:=' ';
            Value:=' ';
        end;                      
}  
{
     if (RowIndex mod 2 =1) then
        Memo.Color:=clSilver;

     if ((RowIndex+1)=Cross1.RowCount) then
        Memo.Color:=clSilver;
}            
end;

procedure frxReport1OnStartReport(Sender: TfrxComponent);
begin

end;

procedure Cross1OnPrintRowHeader(Memo: TfrxMemoView; HeaderIndexes, HeaderValues, Value: Variant);
var svdn:string;                   
begin
     svdn:=<isSVDN>;                  
     if (trim(Memo.Text)='9999') then
     if svdn<>'1' then                                       
        Memo.Text:='Итг'
     else
        Memo.Text:='Ітг';    
     if (trim(Memo.Text)='0') then
        Memo.Text:=' '
                                        
  
end;

procedure Cross1OnPrintColumnHeader(Memo: TfrxMemoView; HeaderIndexes, HeaderValues, Value: Variant);
var svdn:string;                   
begin
     svdn:=<isSVDN>;                  
     if (trim(Memo.Text)='Column') then
     if svdn<>'1' then                                       
        Memo.Text:='Статьи начислений и удержаний'
     else
        Memo.Text:='Статті нарахувань та утримань'
         
end;



begin

end.
