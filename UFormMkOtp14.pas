unit UFormMkOtp14;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons,ScrDef, ExtCtrls;

type
  TFormMkOtp14 = class(TForm)
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    function  CalculateOtp:integer;
    procedure CalculateOtpPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;wantedM:integer);
    function  needOtpPerson(Curr_Person:Person_Ptr;wantedM:integer):boolean;


    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMkOtp14: TFormMkOtp14;

implementation
  uses uformselpkg,ScrUtil,ScrLists,ScrIO,UFibModule,ScrNalog;

{$R *.dfm}

procedure TFormMkOtp14.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMkOtp14.BitBtn2Click(Sender: TObject);
begin
      Application.CreateForm(TFormSelPKG,FormSelPKG);
      FormSelPKG.ShowModal;
end;


procedure TFormMkOtp14.FormCreate(Sender: TObject);
begin
     Label1.Caption        := '';
     Label2.Caption        := '';
end;




procedure TFormMkOtp14.CalculateOtpPerson(Curr_Person:Person_Ptr;var NeedPut:boolean;wantedM:integer);
  const Otp14_id=14;
  var Curr_Add:ADD_PTR;
      New_Person:PERSON_PTR;
      Finished:boolean;
      I_C,I:Integer;
      L:Integer;
      finded:Boolean;
      PersonOsn : Person_Ptr;
      SummaAdd  : Real;
      SummaUd   : Real;
      SummaNal  : Real;
      Is3Add    : Boolean;
      SavNextPerson,c_p:PERSON_PTR;
  begin
       Is3Add:=False;
       SummaAdd:=0.00;
       Curr_Add:=Curr_Person^.ADD;
       while (Curr_Add<>Nil) do
        begin
             if Curr_Add.PERIOD=nmes then
                SummaAdd:=SummaAdd+Curr_Add.SUMMA;
             Curr_Add:=Curr_Add.NEXT;
        end;
       new_person:=nil;
       if Abs(SummaAdd)<1 then Exit;
       if ((not isColedgPodr(NSRV)) and
           (Curr_Person.Gruppa=1)) then
          begin
              finded:=false;
              c_p:=head_Person;
              while (c_p<>Nil) do
                begin
                     if c_p^.tabno=curr_person^.tabno then
                     if GET_DOL_CODE(c_p)=1530 then
                        begin
                             new_person:=c_p;
                             finded:=True;
                             Break;
                        end;
                     c_p:=c_p^.next;
                end;
              if New_Person=nil then
                 begin
                      i_c:=Count_Person;
                      MAKE_PERSON(New_Person,Curr_Person);
                      i_c:=Count_Person;
                      l:=SizeOf(New_Person^)-SizeOf(New_Person^.NEXT);
                      SavNextPerson:=New_Person^.NEXT;
                      Move(Curr_Person^,New_Person^,L);
                      New_Person^.NEXT := SavNextPerson;
                      New_Person^.Add  := nil;
                      New_Person^.Ud   := nil;
                      New_Person^.Cn   := nil;
                      New_Person^.Sowm := nil;
                      New_Person^.DOLG := 'Внеб.отп.';
                      MAKE_DOL_PERSON(New_Person,1530);
                      MakeGUID(New_Person);
                      New_Person^.GRUPPA := 11;
                      New_Person^.OKLAD  := 0;
                      New_Person^.WID_RABOTY:=SOWM_WID_RABOTY;
                      if IS_OSN_WID_RABOTY(Curr_Person) then
                          PUT_SWM_MODE_TO_PERSON(New_Person,1);
                 end;
              MAKE_ADD(Curr_Add,New_Person);
          end
       else
           MAKE_ADD(Curr_Add,Curr_Person);
       Curr_Add.SHIFR  := HOLIDAY_FLOW_SHIFR ;
       Curr_Add.PERIOD := wantedM;
       Curr_Add.YEAR   := 2014-1990;
       Curr_Add.Summa  := SummaAdd;
       Curr_Add.FZP    := SummaAdd;
       Curr_Add.WHO    := otp14_id;
       if (wantedM=7) and (Curr_Person.KATEGORIJA=1) then
       if IS_OSN_WID_RABOTY(CURR_PERSON) then
    //   if not isColedgPodr(NSRV) then
          begin
               if New_Person<>nil then
                   MAKE_ADD(Curr_Add,New_Person)
               else
                   MAKE_ADD(Curr_Add,Curr_Person);
               Curr_Add.SHIFR  := 20 ;
               Curr_Add.PERIOD := wantedM;
               Curr_Add.YEAR   := 2014-1990;
               Curr_Add.Summa  := curr_person^.Oklad;
               Curr_Add.FZP    := Curr_Add.Summa;
               Curr_Add.WHO    := otp14_id;
          end;
       if New_Person<>nil then
          begin
               Update_Podoh(New_Person,wantedM,2014-1990);
               PROF_PERSON(New_PERSON);
          end
       else
          begin
               Update_Podoh(Curr_Person,wantedM,2014-1990);
               PROF_PERSON(CURR_PERSON);
          end;
       NeedPut:=True;
  end;


function TFormMkOtp14.CalculateOtp:integer;
 var I_Podr,Cnt:Integer;
     NSRVTmp,NMESTmp:Integer;
     RetVal :Integer;
     NeedPut:Boolean;
     Curr_Person:PERSON_PTR;
     I_C_1,I_C_2:Integer;
begin
     if not ((NMES=6) and (CURRYEAR=2014)) then
        begin
             ShowMessage('Можно запустить только в июне 2014');
             Exit;
        end;
     if not YesNo('Расчитать предварит.отпускные за  июль-август 2014 ?') then Exit;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

     if KategList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны категории');
             Exit;
        end;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны счета');
             Exit;
        end;

     RetVal  := 0;
     NSRVTmp := NSRV;
     NMESTmp := NMES;
     PutInf;
     LDEL_PERSON;
     ProgressBar1.Max      := Count_Serv;
     ProgressBar1.Min      := 0;
     ProgressBar1.Position := 0;
     Label1.Caption:='';
     Label2.Caption:='';
     Cnt           := 0;
     for i_podr:=1 to Count_Serv do
         begin
              Inc(Cnt);
              ProgressBar1.Position:=Cnt;
              Label1.Caption:=Name_Serv(I_Podr);
              Application.ProcessMessages;
              if not NameServList.IsSelected(I_podr) then Continue;
              NSRV:=I_Podr;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GetInf(true);
              i_c_1:=Count_Person;
              NeedPut:=False;
              Curr_Person:=HEAD_PERSON;
              while (Curr_Person<>Nil) do
                 begin
                      Label2.Caption:=Curr_Person^.FIO;
                      if GruppyList.IsSelected(Curr_Person^.Gruppa) then
                      if KategList.IsSelected(Curr_Person^.KATEGORIJA) then
                      if Curr_Person^.automatic=automatic_mode then
                      if get_dol_code(Curr_Person)<1500  then
                      if get_dol_code(Curr_Person)>9     then
                      if get_dol_code(Curr_Person)<>1455 then
                      if needOtpPerson(Curr_Person,7) then
                         begin
                              CalculateOtpPerson(Curr_Person,NeedPut,7);
                           //   if Curr_Person.KATEGORIJA=1 then
                                 CalculateOtpPerson(Curr_Person,NeedPut,8);
                         end;
                      Application.ProcessMessages;
                      Curr_Person:=Curr_Person^.Next;
                 end;
              i_c_2:=Count_Person;
              if NeedPut then
                 PutInf;
              LDEL_PERSON;


         end;
     NSRV := NSRVTmp;
     NMES := NMESTmp;
     MKFLNM;
     GetInf(True);
     CalculateOtp:=RetVal;
end;

procedure TFormMkOtp14.BitBtn4Click(Sender: TObject);
 var RetVal : Integer;
     WantedShifr:Integer;
begin
     if not ((NMES=6) and (WORK_YEAR_VAL=2014)) then
        begin
             ShowMessage('Можно запустить только в июне 2014 г.');
             Exit;
        end;
     if (NameServList.CountSelected<1) then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     WantedShifr := 0;
     RetVal:=CalculateOtp;
     if RetVal>0 then
        ShowMessage('Насчитано '+IntToStr(RetVal)+' отпускных.');
     Close;

end;


function  TFormMkOtp14.needOtpPerson(Curr_Person:Person_Ptr;wantedM:integer):boolean;
 var retVal:Boolean;
     SQLStmnt:string;
     v:Variant;
     i:integer;
     curr_Add:ADD_PTR;
     finded:boolean;
 begin
      retVal:=false;
      curr_Add:=Curr_Person^.ADD;
      finded:=false;
      while (curr_Add<>Nil) do
         begin
              if (curr_Add.Shifr=holiday_Flow_Shifr) then
                 begin
                      finded:=true;
                      Break;
                 end;
              curr_Add:=curr_Add.NEXT;
         end;
      if not finded then
         begin
             SQLStmnt:='select count(*) from fadd f where f.tabno='+IntToStr(Curr_Person^.Tabno)+' and f.shifrsta in (5,6) and f.year_za=2014 and f.month_za='+intToStr(wantedM);
   //          SQLStmnt:='select count(*) from fadd f where f.tabno='+IntToStr(Curr_Person^.Tabno)+' and f.shifrsta in (5,6) and f.year_za=2014';
             v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
             if VarIsNumeric(v) then
                begin
                     i:=v;
                     if i=0 then
                        retVal:=True;
                end;
         end;
      needOtpPerson:=retVal;
 end;



end.
