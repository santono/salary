unit UPersonEntity;

interface
 uses Classes;
 type
     TTabel=array[1..31] of byte;
     PPersonEntity=^TPersonEntity;
     TPersonEntity=class
             public
                tabno      : integer;
                FIO        : string;
                shifrGru   : word;     {1991 - 1 è ò ä}
                shifrKat   : word;
                dolg       : string;
                oklad      : real;
                widRaboty  : word;
                nTemy      : string;
                mestoOsnRaboty : integer;
                widOplaty  : integer;
                mode       : integer;
                from       : integer;
                podoh      : integer;
                malo       : integer;
                profsojuz  : integer;
                day        : real;
                main       : integer;
                state      : integer;
                automatic  : integer;
                startDay   : integer;
                pens       : integer;
                bank       : integer;
                id         : longword;
                nalCode    : string;
                 count      : string;
//              tabel      : ttabel read getTabel write setTabel;
                addList    : TList;
                udList     : TList;
                cnList     : TList;
                sowmList   : TList;
                tabel:TTabel;
                constructor Create;
                destructor Destroy;
                function getTabno:integer;
                function getFIO:string;
                function getShifrGru:word;
                function getShifrKat:word;
                function getDolg:string;
                function getOklad:real;
                function getWidRaboty:word;
                function getNTemy:string;
                function getMestoOsnRaboty:integer;
                function getWidOplaty:integer;
                function getMode:integer;
                function getFrom:integer;
                function getPodoh:integer;
                function getMalo:integer;
                function getProfsojuz:integer;
                function getDay:real;
                function getMain:integer;
                function getState:integer;
                function getAutomatic:integer;
                function getStartDay:integer;
                function getPens:integer;
                function getBank:integer;
                function getId:longWord;
                function getNalCode:string;
                function getCount:string;
                function getTabel:TTabel;
                function getAddList:TList;
                function getUdList:TList;
                function getCnList:TList;
                function getSowmList:TList;
                procedure setTabno(tabno:integer);
                procedure setFIO(fio:string);
                procedure setShifrGru(shifrGru:word);
                procedure setShifrKat(shifrKat:word);
                procedure setDolg(dolg:string);
                procedure setOklad(oklad:real);
                procedure setWidRaboty(widRaboty:word);
                procedure setNTemy(nTemy:string);
                procedure setMestoOsnRaboty(mestoOsnRaboty:integer);
                procedure setWidOplaty(widOplaty:integer);
                procedure setMode(mode:integer);
                procedure setFrom(from:integer);
                procedure setPodoh(podoh:integer);
                procedure setMalo(malo:integer);
                procedure setProfsojuz(profsojuz:integer);
                procedure setDay(day:real);
                procedure setMain(main:integer);
                procedure setState(state:integer);
                procedure setAutomatic(automatic:integer);
                procedure setStartDay(startDay:integer);
                procedure setPens(pens:integer);
                procedure setBank(bank:integer);
                procedure setId(id:longword);
                procedure setNalCode(nalCode:string);
                procedure setCount(count:string);
                procedure setTabel(tabel:TTabel);
                procedure setAddList(addList:TList);
                procedure setUdList(udList:TList);
                procedure setCnList(cnList:TList);
                procedure setSowmList(sowmList:TList);
//                       HOLIDAY          : HOLIDAY_TYPE;

               end;

implementation
  uses ScrDef;
  constructor TPersonEntity.Create;
   var tabel0:TTabel;
   begin
        fillChar(tabel0,sizeOf(tabel0),0);
        tabno      := 0;
        FIO        := '';
        shifrGru   := 1;
        shifrKat   := 1;
        dolg       := '';
        oklad      := 0.00;
        widRaboty  := OSN_WID_RABOTY;
        nTemy      := '';
        mestoOsnRaboty :=NSRV;
        widOplaty  := 1;
        mode       := FIVE_DAY;
        from       := mestoOsnRaboty;
        podoh      := 0;
        malo       := 0;
        if isLNR then
           profsojuz  := 1
        else
           profsojuz  := 0;
        day        := 0.00;
        main       := 1;
        state      := 0;
        automatic  := 0;
        startDay   := 1;
        pens       := 0;
        bank       := 0;
        id         := 0;
        nalCode    := '';
        count      := '';
        tabel      := tabel0;
        addList    := TList.Create;
        udList     := TList.Create;
        cnList     := TList.Create;
        sowmList   := TList.Create;
   end;
  destructor TPersonEntity.Destroy;
   begin
        addList.Free;
        udList.Free;
        cnList.Free;
        sowmList.Free;
   end;
  function TPersonEntity.getTabno:integer;
    begin
         Result:=self.Tabno;
    end;
  function TPersonEntity.getFIO:string;
    begin
         Result:=self.FIO;
    end;
  function TPersonEntity.getShifrGru:word;
    begin
         Result:=self.shifrGru;
    end;
  function TPersonEntity.getShifrKat:word;
    begin
         Result:=self.shifrKat;
    end;
  function TPersonEntity.getDolg:string;
    begin
         Result:=self.Dolg;
    end;
  function TPersonEntity.getOklad:real;
    begin
         Result:=self.oklad;
    end;
  function TPersonEntity.getWidRaboty:word;
    begin
         Result:=self.widRaboty;
    end;
  function TPersonEntity.getNTemy:string;
    begin
         Result:=self.nTemy;
    end;
  function TPersonEntity.getMestoOsnRaboty:integer;
    begin
         Result:=self.MestoOsnRaboty;
    end;
  function TPersonEntity.getWidOplaty:integer;
    begin
         Result:=self.widOplaty;
    end;
  function TPersonEntity.getMode:integer;
    begin
         Result:=self.mode;
    end;
  function TPersonEntity.getFrom:integer;
    begin
         Result:=self.from;
    end;
  function TPersonEntity.getPodoh:integer;
    begin
         Result:=self.podoh;
    end;
  function TPersonEntity.getMalo:integer;
    begin
         Result:=self.malo;
    end;
  function TPersonEntity.getProfsojuz:integer;
    begin
         Result:=self.profsojuz;
    end;
  function TPersonEntity.getDay:real;
    begin
         Result:=self.day;
    end;
  function TPersonEntity.getMain:integer;
    begin
         Result:=self.main;
    end;
  function TPersonEntity.getState:integer;
    begin
         Result:=self.state;
    end;
  function TPersonEntity.getAutomatic:integer;
    begin
         Result:=self.automatic;
    end;
  function TPersonEntity.getStartDay:integer;
    begin
         Result:=self.startDay;
    end;
  function TPersonEntity.getPens:integer;
    begin
         Result:=self.pens;
    end;
  function TPersonEntity.getBank:integer;
    begin
         Result:=self.bank;
    end;
  function TPersonEntity.getId:longWord;
    begin
         Result:=self.id;
    end;
  function TPersonEntity.getNalCode:string;
    begin
         Result:=self.nalCode;
    end;
  function TPersonEntity.getCount:string;
    begin
         Result:=self.count;
    end;
  function TPersonEntity.getTabel:TTabel;
    begin
         Result:=self.tabel;
    end;
  function TPersonEntity.getAddList:TList;
    begin
         Result:=self.addList;
    end;
  function TPersonEntity.getUdList:TList;
    begin
         Result:=self.udList;
    end;
  function TPersonEntity.getCnList:TList;
    begin
         Result:=self.cnList;
    end;
  function TPersonEntity.getSowmList:TList;
    begin
         Result:=self.sowmList;
    end;
  procedure TPersonEntity.setTabno(tabno:integer);
   begin
        self.tabno:=tabno;
   end;
  procedure TPersonEntity.setFIO(fio:string);
   begin
        self.FIO:=fio;
   end;
  procedure TPersonEntity.setShifrGru(shifrGru:word);
   begin
        self.shifrGru:=shifrGru;
   end;
  procedure TPersonEntity.setShifrKat(shifrKat:word);
   begin
        self.shifrKat:=shifrKat;
   end;
  procedure TPersonEntity.setDolg(dolg:string);
   begin
        self.dolg:=dolg;
   end;
  procedure TPersonEntity.setOklad(oklad:real);
   begin
        self.oklad:=oklad;
   end;
  procedure TPersonEntity.setWidRaboty(widRaboty:word);
   begin
        self.widRaboty:=widRaboty;
   end;
  procedure TPersonEntity.setNTemy(nTemy:string);
   begin
        self.nTemy:=nTemy;
   end;
  procedure TPersonEntity.setMestoOsnRaboty(mestoOsnRaboty:integer);
   begin
        self.mestoOsnRaboty:=mestoOsnRaboty;
   end;
  procedure TPersonEntity.setWidOplaty(widOplaty:integer);
   begin
        self.widOplaty:=widOplaty;
   end;
  procedure TPersonEntity.setMode(mode:integer);
   begin
        self.mode:=mode;
   end;
  procedure TPersonEntity.setFrom(from:integer);
   begin
        self.from:=from;
   end;
  procedure TPersonEntity.setPodoh(podoh:integer);
   begin
        self.podoh:=podoh;
   end;
  procedure TPersonEntity.setMalo(malo:integer);
   begin
        self.malo:=malo;
   end;
  procedure TPersonEntity.setProfsojuz(profsojuz:integer);
   begin
        self.profsojuz:=profsojuz;
   end;
  procedure TPersonEntity.setDay(day:real);
   begin
        self.day:=day;
   end;
  procedure TPersonEntity.setMain(main:integer);
   begin
        self.main:=main;
   end;
  procedure TPersonEntity.setState(state:integer);
   begin
        self.state:=state;
   end;
  procedure TPersonEntity.setAutomatic(automatic:integer);
   begin
        self.automatic:=automatic;
   end;
  procedure TPersonEntity.setStartDay(startDay:integer);
   begin
        self.startDay:=startDay;
   end;
  procedure TPersonEntity.setPens(pens:integer);
   begin
        self.pens:=pens;
   end;
  procedure TPersonEntity.setBank(bank:integer);
   begin
        self.bank:=bank;
   end;
  procedure TPersonEntity.setId(id:longWord);
   begin
        self.id:=id;
   end;
  procedure TPersonEntity.setNalCode(nalCode:string);
   begin
        self.nalCode:=nalCode;
   end;
  procedure TPersonEntity.setCount(count:string);
   begin
        self.count:=count;
   end;
  procedure TPersonEntity.setTabel(tabel:TTabel);
   begin
        self.tabel:=tabel;
   end;
  procedure TPersonEntity.setAddList(addList:TList);
   begin
        self.addList:=addList;
   end;
  procedure TPersonEntity.setUdList(udList:TList);
   begin
        self.udList:=udList;
   end;
  procedure TPersonEntity.setCnList(cnList:TList);
   begin
        self.cnList:=cnList;
   end;
  procedure TPersonEntity.setSowmList(sowmList:TList);
   begin
        self.sowmList:=sowmList;
   end;


end.


