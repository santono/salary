unit UAddEntity;

interface
 type TAddEntity=class
             public
                constructor Create;
                destructor Free;
                function getShifr:word;
                function getPeriod:byte;
                function getYear:word;
                function getSumma:real;
                function getFZP:real;
                function getFMP:real;
                function getOther:real;
                function getVyplacheno:word;
                function getWho:word;
                function getWorkDay:word;
                function getWorkClock:real;
                function getCount:string;
                procedure setShifr(shifr:word);
                procedure setPeriod(period:byte);
                procedure setYear(year:word);
                procedure setSumma(summa:real);
                procedure setFZP(FZP:real);
                procedure setFMP(FMP:real);
                procedure setOTHER(OTHER:real);
                procedure setVyplacheno(vyplacheno:word);
                procedure setWho(who:word);
                procedure setWorkDay(workDay:word);
                procedure setWorkClock(workClock:real);
                procedure setCount(count:string);
             property shifr      : word read getShifr write setShifr;
             property period     : byte read getPeriod write setPeriod;
             property year       : word read getYear write setYear;     {1991 - 1 и т д}
             property summa      : real read getSumma write setSumma;
             property FMP        : real read getFMP write setFMP;
             property FZP        : real read getFZP write setFZP;
             property OTHER      : real read getOther write setOther;
             property vyplacheno : word read getVyplacheno write setVyplacheno;
             property who        : word read getWho write setWho;     {ѕолучена автоматически или вручную}
             property workDay    : word read getWorkDay write setWorkDay  ;
             property workClock  : real read getWorkClock write setWorkClock ;
             property count      : string read getCount write setCount;
               end;

implementation
  uses scrdef;
  constructor TAddEntity.Create;
   begin
        shifr      := 0;
        period     := nmes;
        year       := currYear-1990;
        summa      := 0.00;
        FZP        := 0.00;
        FMP        := 0.00;
        other      := 0.00;
        vyplacheno := not_get_out;
        who        := 0;
        workDay    := 0;
        workClock  := 0.00;
        count      :='';
   end;
  destructor TAddEntity.Free;
   begin
   
   end;
  function TAddEntity.getShifr:word;
    begin
         Result:=self.shifr;
    end;
  function TAddEntity.getPeriod:byte;
    begin
         Result:=self.period;
    end;
  function TAddEntity.getYear:word;
    begin
         Result:=self.year;
    end;
  function TAddEntity.getSumma:real;
    begin
         Result:=self.summa;
    end;
  function TAddEntity.getFZP:real;
    begin
         Result:=self.FZP;
    end;
  function TAddEntity.getFMP:real;
    begin
         Result:=self.FMP;
    end;
  function TAddEntity.getOther:real;
    begin
         Result:=self.other;
    end;
  function TAddEntity.getVyplacheno:word;
    begin
         Result:=self.vyplacheno;
    end;
  function TAddEntity.getWho:word;
    begin
         Result:=self.who;
    end;
  function TAddEntity.getWorkDay:word;
    begin
         Result:=self.workDay;
    end;
  function TAddEntity.getWorkClock:real;
    begin
         Result:=self.workClock;
    end;
  function TAddEntity.getCount:string;
    begin
         Result:=self.count;
    end;
  procedure TAddEntity.setShifr(shifr:word);
   begin
        self.shifr:=shifr;
   end;
  procedure TAddEntity.setPeriod(period:byte);
   begin
        self.period:=period;
   end;
  procedure TAddEntity.setYear(year:word);
   begin
        self.year:=year;
   end;
  procedure TAddEntity.setSumma(summa:real);
   begin
        self.summa:=summa;
   end;
  procedure TAddEntity.setFZP(FZP:real);
   begin
        self.FZP:=FZP;
   end;
  procedure TAddEntity.setFMP(FMP:real);
   begin
        self.FMP:=FMP;
   end;
  procedure TAddEntity.setOther(other:real);
   begin
        self.other:=other;
   end;
  procedure TAddEntity.setVyplacheno(vyplacheno:word);
   begin
        self.Vyplacheno:=Vyplacheno;
   end;
  procedure TAddEntity.setWho(who:word);
   begin
        self.who:=who;
   end;
  procedure TAddEntity.setWorkDay(workDay:word);
   begin
        self.workDay:=workDay;
   end;
  procedure TAddEntity.setWorkClock(workClock:real);
   begin
        self.workClock:=workClock;
   end;
  procedure TAddEntity.setCount(count:string);
   begin
        self.count:=count;
   end;

end.
