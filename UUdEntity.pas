unit UUdEntity;

interface
 type PUdEntity=^TUdEntity;
      TUdEntity=class
             public
              shifr      : word;
              period     : byte;
              year       : word;     {1991 - 1 и т д}
              summa      : real;
              vyplacheno : word;
              who        : word;     {ѕолучена автоматически или вручную}
              count      : string;
                constructor Create;
                destructor Destroy;
                function getShifr:word;
                function getPeriod:byte;
                function getYear:word;
                function getSumma:real;
                function getVyplacheno:word;
                function getWho:word;
                function getCount:string;
                procedure setShifr(shifr:word);
                procedure setPeriod(period:byte);
                procedure setYear(year:word);
                procedure setSumma(summa:real);
                procedure setVyplacheno(vyplacheno:word);
                procedure setWho(who:word);
                procedure setCount(count:string);
               end;

implementation
  uses scrdef;
  constructor TUdEntity.Create;
   begin
        shifr      := 0;
        period     := nmes;
        year       := currYear-1990;
        summa      := 0.00;
        vyplacheno := not_get_out;
        who        := 0;
        count      :='';
   end;
  destructor TUdEntity.Destroy;
   begin

   end;
  function TUdEntity.getShifr:word;
    begin
         Result:=self.shifr;
    end;
  function TUdEntity.getPeriod:byte;
    begin
         Result:=self.period;
    end;
  function TUdEntity.getYear:word;
    begin
         Result:=self.year;
    end;
  function TUdEntity.getSumma:real;
    begin
         Result:=self.summa;
    end;
  function TUdEntity.getVyplacheno:word;
    begin
         Result:=self.vyplacheno;
    end;
  function TUdEntity.getWho:word;
    begin
         Result:=self.who;
    end;
  function TUdEntity.getCount:string;
    begin
         Result:=self.count;
    end;
  procedure TUdEntity.setShifr(shifr:word);
   begin
        self.shifr:=shifr;
   end;
  procedure TUdEntity.setPeriod(period:byte);
   begin
        self.period:=period;
   end;
  procedure TUdEntity.setYear(year:word);
   begin
        self.year:=year;
   end;
  procedure TUdEntity.setSumma(summa:real);
   begin
        self.summa:=summa;
   end;
  procedure TUdEntity.setVyplacheno(vyplacheno:word);
   begin
        self.Vyplacheno:=Vyplacheno;
   end;
  procedure TUdEntity.setWho(who:word);
   begin
        self.who:=who;
   end;
  procedure TUdEntity.setCount(count:string);
   begin
        self.count:=count;
   end;


end.
