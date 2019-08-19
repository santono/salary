unit UCnEntity;

interface
 type TCnEntity=class
             public
              shifr      : word;
              kod        : word;
              summa      : real;
              prim       : integer;
              prim_1     : string;
              dejaCounted: real;
              limitSumma : real;
              automatic  : word;
              id         : word;
              count      : string;
                constructor Create;
                destructor destroy;
                function getShifr:word;
                function getKod:word;
                function getSumma:real;
                function getPrim:integer;
                function getPrim_1:string;
                function getDejaCounted:real;
                function getLimitSumma:real;
                function getAutomatic:word;
                function getId:word;
                function getCount:string;
                procedure setShifr(shifr:word);
                procedure setKod(kod:word);
                procedure setSumma(summa:real);
                procedure setPrim(prim:integer);
                procedure setPrim_1(prim_1:string);
                procedure setDejaCounted(dejaCounted:real);
                procedure setLimitSumma(limitSumma:real);
                procedure setAutomatic(automatic:word);
                procedure setId(id:word);
                procedure setCount(count:string);
               end;

implementation
  constructor TCnEntity.Create;
   begin
        shifr       := 0;
        kod         := 0;
        summa       := 0.00;
        prim        := 0;
        prim_1      := '';
        dejaCounted := 0.00;
        limitSumma  := 0.00;
        automatic   := 0;
        id          := 0;
        count      :='';
   end;
  destructor TCnEntity.Destroy;
   begin

   end;
  function TCnEntity.getShifr:word;
    begin
         Result:=self.shifr;
    end;
  function TCnEntity.getKod:word;
    begin
         Result:=self.kod;
    end;
  function TCnEntity.getSumma:real;
    begin
         Result:=self.summa;
    end;
  function TCnEntity.getPrim:integer;
    begin
         Result:=self.prim;
    end;
  function TCnEntity.getPrim_1:string;
    begin
         Result:=self.prim_1;
    end;
  function TCnEntity.getDejaCounted:real;
    begin
         Result:=self.dejaCounted;
    end;
  function TCnEntity.getLimitSumma:real;
    begin
         Result:=self.limitSumma;
    end;
  function TCnEntity.getAutomatic:word;
    begin
         Result:=self.automatic;
    end;
  function TCnEntity.getId:word;
    begin
         Result:=self.id;
    end;
  function TCnEntity.getCount:string;
    begin
         Result:=self.count;
    end;
  procedure TCnEntity.setShifr(shifr:word);
   begin
        self.shifr:=shifr;
   end;
  procedure TCnEntity.setKod(kod:word);
   begin
        self.kod:=kod;
   end;
  procedure TCnEntity.setSumma(summa:real);
   begin
        self.summa:=summa;
   end;
  procedure TCnEntity.setPrim(prim:integer);
   begin
        self.prim:=prim;
   end;
  procedure TCnEntity.setPrim_1(prim_1:string);
   begin
        self.prim_1:=prim_1;
   end;
  procedure TCnEntity.setDejaCounted(dejaCounted:real);
   begin
        self.dejaCounted:=dejaCounted;
   end;
  procedure TCnEntity.setLimitSumma(limitSumma:real);
   begin
        self.limitSumma:=limitSumma;
   end;
  procedure TCnEntity.setId(id:word);
   begin
        self.id:=id;
   end;
  procedure TCnEntity.setAutomatic(automatic:word);
   begin
        self.automatic:=automatic;
   end;
  procedure TCnEntity.setCount(count:string);
   begin
        self.count:=count;
   end;


end.

