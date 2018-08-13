unit USelLists;

interface
    uses Classes;
    type
         TItemSelList = class(TList)
                         public
                           function CountSelected:integer;
                           function MarkItem(ItemNo:integer):integer;
                           procedure AddItem(ShifrId:integer;Name:string);
                           function GetItem(WantedNo:integer; var ShifrId:integer;var Name:string):boolean;
                           function IsSelected(WantedNo:integer):boolean;
                       end;
    var PodrSelOtpList   : TItemSelList;
        KategSelOtpList  : TItemSelList;
        GruppySelOtpList : TItemSelList;
implementation
    type PRecItemSelList=^TRecItemSelList;
         TRecItemSelList=record
                          ShifrId : integer;
                          Name    : string;
                          Marked  : boolean;
                         end;
    function TItemSelList.CountSelected:integer;
      var RetVal,i:integer;
      begin
            RetVal:=0;
            if Self.Count>0 then
               begin
                    for i:=0 to Self.Count-1 do
                        begin
                             if PRecItemSelList(Self.Items[i])^.Marked then
                                RetVal:=RetVal+1;
                        end;
               end;
            CountSelected:=RetVal;
      end;
    function TItemSelList.MarkItem(ItemNo:integer):integer;
      var RetVal,i:integer;
      begin
            RetVal:=0;
            if ((ItemNo>=0) and (ItemNo<Self.Count)) then
               PRecItemSelList(Self.Items[ItemNo])^.Marked :=
                  not PRecItemSelList(Self.Items[ItemNo])^.Marked;
            MarkItem:=RetVal;
      end;
    procedure TItemSelList.AddItem(ShifrId:integer;Name:string);
      var RecItem:PRecItemSelList;
      begin
           New(RecItem);
           RecItem^.ShifrId:=ShifrId;
           RecItem^.Name:=Name;
           RecItem^.Marked:=false;
           Self.Add(RecItem);
      end;
   function TItemSelList.GetItem(WantedNo:integer; var ShifrId:integer;var Name:string):boolean;
      var RetVal : boolean;
      begin
            RetVal:=false;
            if ((WantedNo>=0) and (WantedNo<Self.Count)) then
               begin
                     ShifrId:=PRecItemSelList(Self.Items[WantedNo])^.ShifrId;
                     Name:=PRecItemSelList(Self.Items[WantedNo])^.Name;
                     Retval:=true;
               end;
            GetItem:=RetVal;
      end;
   function TItemSelList.IsSelected(WantedNo:integer):boolean;
      var RetVal : boolean;
      begin
           RetVal:=false;
           if ((WantedNo>=0) and (WantedNo<Self.Count)) then
               RetVal:=PRecItemSelList(Self.Items[WantedNo])^.Marked;
           IsSelected:=RetVal;    
      end;
end.
