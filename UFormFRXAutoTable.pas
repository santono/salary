unit UFormFRXAutoTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxCross, StdCtrls, Buttons, ComCtrls, frxExportText,
  frxExportRTF, frxExportXLS, Spin, frxExportPDF, ExtCtrls;

type
  TFormFRXAutoTable = class(TForm)
    BitBtn1: TBitBtn;
    frxCrossObject1: TfrxCrossObject;
    frxReport1: TfrxReport;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    SpinEditF: TSpinEdit;
    Label2: TLabel;
    dtArchivFr: TDateTimePicker;
    frxpdfxprt1: TfrxPDFExport;
    FIOLabel: TLabel;
    PersonBtn: TBitBtn;
    Label3: TLabel;
    Label4: TLabel;
    dtArchivTo: TDateTimePicker;
    rgWantedGUID: TRadioGroup;
   
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure BitBtn1Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure PersonBtnClick(Sender: TObject);
    constructor GUIDCreate(AOwner: TComponent;GUID:string;FIO:string;Dolg:string;tabno:integer);
    constructor MyCreate(AOwner: TComponent);

  private
    fontSize:integer;
    WantedMonth,WantedYear,WantedTabno:Integer;
    WantedFIO  : string;
    wantedDolg : string;
    wantedGUID : string;
    ListM      : TList;
    ListAddT   : TList;
    ListUdT    : TList;
    ListVyplT  : TList;
    { Private declarations }
    Cross : TfrxCrossView;
    procedure MakeSwod;
    procedure fillLine(wantedYear,wantedMonth:integer);
    procedure fillListsT;

  public
    { Public declarations }
  end;

var
  FormFRXAutoTable: TFormFRXAutoTable;
implementation
 uses Scrdef,ScrUtil,ScrLists,ScrIO,ScrIOSql,DateUTils,types,uFrmFindKadryFB,
      uFormWait;

  type
       PPersonRec=^TPersonRec;
       TPersonRec=record
                    ShifrSta : integer;
                    Summa    : real;
                    m        : Integer;
                    y        : Integer;
                  end;
       PListRec=^TListRec;
       TListRec=record
                 y:Integer;
                 m:Integer;
                 ListAdd  : TList;
                 ListUd   : TList;
                 ListVypl : TList;
                end;

{$R *.dfm}

procedure TFormFRXAutoTable.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ListM.Free;
     ListAddT.Free;
     ListUdT.Free;
     ListVyplT.Free;
     Action:=caFree;
end;

   function CompareItems(Item1, Item2: Pointer): Integer;
     begin
          if PPersonRec(Item1)^.ShifrSta>PPersonRec(Item2)^.ShifrSta then Result:=1
          else if PPersonRec(Item1)^.ShifrSta<PPersonRec(Item2)^.ShifrSta then Result:=-1
          else if (PPersonRec(Item1)^.y*12+PPersonRec(Item1)^.m)>(PPersonRec(Item2)^.y*12+PPersonRec(Item2)^.m) then Result:=1
          else if (PPersonRec(Item1)^.y*12+PPersonRec(Item1)^.m)<(PPersonRec(Item2)^.y*12+PPersonRec(Item2)^.m) then result:=-1
          else Result:=0;
     end;

   function CompareListRecs(Item1, Item2: Pointer): Integer;
     begin
          if (PListRec(Item1)^.y*12+PListRec(Item1)^.m)>(PListRec(Item2)^.y*12+PListRec(Item2)^.m) then Result:=1
          else if (PListRec(Item1)^.y*12+PListRec(Item1)^.m)<(PListRec(Item2)^.y*12+PListRec(Item2)^.m) then result:=-1
          else Result:=0;
     end;
   function CompareSta(Item1, Item2: Pointer): Integer;
     begin
          if (PPersonRec(Item1)^.ShifrSta>PPersonRec(Item2)^.ShifrSta) then Result:=1
          else if (PPersonRec(Item1)^.ShifrSta<PPersonRec(Item2)^.ShifrSta) then Result:=-1
          else if (PPersonRec(Item1)^.y>PPersonRec(Item2)^.y) then result:=1
          else if (PPersonRec(Item1)^.y<PPersonRec(Item2)^.y) then result:=-1
          else if (PPersonRec(Item1)^.m>PPersonRec(Item2)^.m) then result:=1
          else if (PPersonRec(Item1)^.m<PPersonRec(Item2)^.m) then result:=-1
          else Result:=0;
     end;
   function CompareTot(Item1, Item2: Pointer): Integer;
     begin
          if (PPersonRec(Item1)^.ShifrSta>PPersonRec(Item2)^.ShifrSta) then Result:=1
          else if (PPersonRec(Item1)^.ShifrSta<PPersonRec(Item2)^.ShifrSta) then Result:=-1
          else Result:=0;
     end;


procedure TFormFRXAutoTable.MakeSwod;
 const F='######0.00';
 const Nmb_Col=1;
 const Header:array[1..Nmb_Col] of string = ('Период');
  var
     listRec     : PListRec;
     PersonRec   : PPersonRec;
     I,j,lineno  : integer;
//     ListAddT    : TList;
//     ListUdT     : TList;
     S,S1        : string;
     SummaAddT,SummaUdT,SummaVyplT,SummaAdd,SummaUd,SummaVypl:real;

begin

      if ListM.Count<1 then Exit;
      // Заголовок
      for i:=1 to Nmb_Col do
           Cross.AddValue(['9999'],[Header[i]],[' ']);
       if ListAddT.Count>0 then
          begin
             ListAddT.Sort(@compareTot);
             SummaAddT:=0;
             for i:=1  to ListAddT.Count do
                 begin
                    PersonRec := PPersonRec(ListAddT.Items[i-1]);
                    S:=IntToStr(PersonRec^.ShifrSta);
//                    if PersonRec^.m<>PListRec(listM.Items[i]).m then
//                       s:=s+' '+intToStr(PersonRec^.m);
                    S1:=getStaNameForSwodFromSQL(personRec.ShifrSta);
                    Cross.AddValue(['0'],[S],[S1]);
                //    Dispose(PPersonRec(ListAddT.Items[i-1]));
                 end;
             S1:=' ';
             Cross.AddValue(['0'],['Итого'+chr(13)+'начислено'],[S1]);
          end;
       if ListUdT.Count>0 then
          begin
              ListUdT.Sort(@compareTot);
              SummaUdT:=0;
              for i:=1  to ListUdT.Count do
                 begin
                      PersonRec:=PPersonRec(ListUdT.Items[i-1]);
                      SummaUdT := SummaUdT + PersonRec^.Summa;
                      S:=IntToStr(PersonRec^.ShifrSta);
//                      s:=s+' '+intToStr(PersonRec^.m);
                      S1:=getStaNameForSwodFromSQL(personRec.ShifrSta);
                      Cross.AddValue(['0'],[S],[S1]);
               //       Dispose(PPersonRec(ListUdT.Items[i-1]));
                 end;
             S1:=' ';
             Cross.AddValue(['0'],['Итого'+chr(13)+'удержано'],[S1]);
          end;
       if ListVyplT.Count>0 then
          begin
              ListVyplT.Sort(@compareTot);
              SummaVyplT:=0;
              for i:=1  to ListVyplT.Count do
                 begin
                      PersonRec:=PPersonRec(ListVyplT.Items[i-1]);
                      SummaVyplT := SummaVyplT + PersonRec^.Summa;
                      S:=IntToStr(PersonRec^.ShifrSta);
//                      s:=s+' '+intToStr(PersonRec^.m);
                      S1:=getStaNameForSwodFromSQL(personRec.ShifrSta);
                      Cross.AddValue(['0'],[S],[S1]);
               //       Dispose(PPersonRec(ListUdT.Items[i-1]));
                 end;
             S1:=' ';
             Cross.AddValue(['0'],['Итого к'+chr(13)+'выплате'],[S1]);
          end;


      // Конец заголовка

      ListM.Sort(@compareListRecs);
      for i:=0 to ListM.Count-1 do
       begin
            lineno:=i+1;
            S:=GetMonthRus(PListRec(listM.Items[i]).m)+' '+IntToStr(PListRec(listM.Items[i]).y);
            Cross.AddValue([LineNo],[Header[1]],[S]);

            PListRec(listM.Items[i]).ListAdd.Sort(@compareSta);
            PListRec(listM.Items[i]).ListUd.Sort(@compareSta);
            PListRec(listM.Items[i]).ListVypl.Sort(@compareSta);
            SummaAdd:=0;
            if PListRec(listM.Items[i]).ListAdd.Count>0 then
               for j:=1  to PListRec(listM.Items[i]).ListAdd.Count do
                   begin
                        PersonRec:=PPersonRec(PListRec(listM.Items[i]).ListAdd.Items[j-1]);
                        S:=IntToStr(PersonRec^.ShifrSta);
                        if Abs(PersonRec^.Summa)<0.01 then
                           S1:=' '
                        else
                           begin
                                S1:=FormatFloat(F,PersonRec^.Summa);
                                if PersonRec^.m<>PListRec(listM.Items[i]).m then
                                   s1:='('+trim(intToStr(PersonRec^.m))+') '+S1;

                           end;
                        SummaAdd:=SummaAdd+PersonRec^.Summa;
                        Cross.AddValue([LineNo],[S],[S1]);
                        Dispose(PersonRec);
                   end;
            if ListAddT.Count>0 then
               begin
                    S1:=FormatFloat(F,SummaAdd);
                    Cross.AddValue([LineNo],['Итого'+chr(13)+'начислено'],[S1]);
               end;
            SummaUd:=0;
            if PListRec(listM.Items[i]).ListUd.Count>0 then
               for j:=1  to PListRec(listM.Items[i]).ListUd.Count do
                   begin
                        PersonRec:=PPersonRec(PListRec(listM.Items[i]).ListUd.Items[j-1]);
                        S:=IntToStr(PersonRec^.ShifrSta);
//                        if PersonRec^.m<>PListRec(listM.Items[i]).m then
//                           s:=s+' '+intToStr(PersonRec^.m);
                        if Abs(PersonRec^.Summa)<0.01 then
                           S1:=' '
                        else
                           begin
                               S1:=FormatFloat(F,PersonRec^.Summa);
                               if PersonRec^.m<>PListRec(listM.Items[i]).m then
                                  s1:='('+trim(intToStr(PersonRec^.m))+') '+s1;
                           end;
                     //   S1:=FormatFloat(F,PersonRec^.Summa);
                        SummaUd:=SummaUd+PersonRec^.Summa;
                        Cross.AddValue([LineNo],[S],[S1]);
                        Dispose(PersonRec);
                   end;
            if ListUdT.Count>0 then
               begin
                    S1:=FormatFloat(F,SummaUd);
                    Cross.AddValue([LineNo],['Итого'+chr(13)+'удержано'],[S1]);
               end;
            SummaVypl:=0;
            if PListRec(listM.Items[i]).ListVypl.Count>0 then
               for j:=1  to PListRec(listM.Items[i]).ListVypl.Count do
                   begin
                        PersonRec:=PPersonRec(PListRec(listM.Items[i]).ListVypl.Items[j-1]);
                        S:=IntToStr(PersonRec^.ShifrSta);
//                        if PersonRec^.m<>PListRec(listM.Items[i]).m then
//                           s:=s+' '+intToStr(PersonRec^.m);
                        if Abs(PersonRec^.Summa)<0.01 then
                           S1:=' '
                        else
                           begin
                               S1:=FormatFloat(F,PersonRec^.Summa);
                               if PersonRec^.m<>PListRec(listM.Items[i]).m then
                                  s1:='('+trim(intToStr(PersonRec^.m))+') '+s1;
                           end;
                     //   S1:=FormatFloat(F,PersonRec^.Summa);
                        SummaVypl:=SummaVypl + PersonRec^.Summa;
                        Cross.AddValue([LineNo],[S],[S1]);
                        Dispose(PersonRec);
                   end;
            if ListVyplT.Count>0 then
               begin
                    S1:=FormatFloat(F,SummaVypl);
                    Cross.AddValue([LineNo],['Итого к'+chr(13)+'выплате'],[S1]);
               end;
       end;
       for i:=1 to Nmb_Col do
           Cross.AddValue(['9999'],[Header[i]],[' ']);
       if ListAddT.Count>0 then
          begin
             SummaAddT:=0;
             for i:=1  to ListAddT.Count do
                 begin
                    PersonRec := PPersonRec(ListAddT.Items[i-1]);
                    SummaAddT := SummaAddT + PersonRec^.Summa;
                    S:=IntToStr(PersonRec^.ShifrSta);
                    S1:=FormatFloat(F,PersonRec^.Summa);
                    Cross.AddValue(['9999'],[S],[S1]);
                    Dispose(PPersonRec(ListAddT.Items[i-1]));
                 end;
             S1:=FormatFloat(F,SummaAddT);
             Cross.AddValue(['9999'],['Итого'+chr(13)+'начислено'],[S1]);
          end;
       if ListUdT.Count>0 then
          begin
              SummaUdT:=0;
              for i:=1  to ListUdT.Count do
                 begin
                      PersonRec:=PPersonRec(ListUdT.Items[i-1]);
                      SummaUdT := SummaUdT + PersonRec^.Summa;
                      S:=IntToStr(PersonRec^.ShifrSta);
                      S1:=FormatFloat(F,PersonRec^.Summa);
                      Cross.AddValue(['9999'],[S],[S1]);
                      Dispose(PPersonRec(ListUdT.Items[i-1]));
                 end;
             S1:=FormatFloat(F,SummaUdT);
             Cross.AddValue(['9999'],['Итого'+chr(13)+'удержано'],[S1]);
          end;
       if ListVyplT.Count>0 then
          begin
              SummaVyplT:=0;
              for i:=1  to ListVyplT.Count do
                 begin
                      PersonRec:=PPersonRec(ListVyplT.Items[i-1]);
                      SummaVyplT := SummaVyplT + PersonRec^.Summa;
                      S:=IntToStr(PersonRec^.ShifrSta);
                      S1:=FormatFloat(F,PersonRec^.Summa);
                      Cross.AddValue(['9999'],[S],[S1]);
                      Dispose(PPersonRec(ListVyplT.Items[i-1]));
                 end;
             S1:=FormatFloat(F,SummaVyplT);
             Cross.AddValue(['9999'],['Итого к'+chr(13)+'выплате'],[S1]);
          end;
end;

procedure TFormFRXAutoTable.fillLine(wantedYear,wantedMonth:Integer);
 var listRec:PListRec;
     curr_person:person_ptr;
     Curr_Add : ADD_PTR;
     Curr_Ud  : UD_PTR;

 procedure AddStaForAddUd(Shifr:integer;
                          Summa:real;
                          y:Integer;
                          m:Integer;
                          List:TList);
   var I         : integer;
       Finded    : boolean;
       PersonRec : PPersonRec;
  begin
        Finded:=false;
        if List.Count>0 then
           for i:=1 to List.Count do
               if PPersonRec(List.Items[i-1])^.ShifrSta=Shifr then
               if PPersonRec(List.Items[i-1])^.y=y then
               if PPersonRec(List.Items[i-1])^.m=m then
                  begin
                        PPersonRec(List.Items[i-1])^.Summa:=PPersonRec(List.Items[i-1])^.Summa+Summa;
                        Finded:=true;
                        break;
                  end;
        if not Finded then
           begin
               New(PersonRec);
               PersonRec^.ShifrSta:=Shifr;
               PersonRec^.Summa:=Summa;
               PersonRec^.y:=y;
               personRec^.m:=m;
               List.Add(PersonRec);
           end;



  end;

 procedure AddStaForAdd(Curr_Add:ADD_PTR;List:TList);
   var
       y,m       : Integer;
  begin
        if Curr_Add=nil then Exit;
        y:=Curr_Add^.YEAR;
        m:=Curr_Add^.PERIOD;
        if y<1990 then y:=y+1990;
        AddStaForAddUd(Curr_Add^.SHIFR,Curr_Add^.SUMMA,y,m,List);
  end;
 procedure AddStaForUd(Curr_Ud:Ud_PTR;List:TList);
   var y,m       : Integer;
  begin
        if Curr_Ud=nil then Exit;
        y:=Curr_Ud^.YEAR;
        m:=Curr_ud^.PERIOD;
        if y<1990 then y:=y+1990;
        AddStaForAddUd(Curr_Ud^.SHIFR,Curr_Ud^.SUMMA,y,m,List);
  end;

 function IsAddUdPerson(Curr_Person:Person_Ptr):Boolean;
   var Curr_Add:ADD_PTR;
       Curr_Ud:UD_PTR;
   begin
        IsAddUdPerson:=False;
        Curr_Add:=Curr_Person.ADD;
        while (Curr_Add<>Nil) do
          begin
               if Abs(Curr_Add.Summa)>0.005 then
                  begin
                       IsAddUdPerson:=True;
                       Break;
                  end;
               Curr_Add:=Curr_Add.NEXT;
          end;
        Curr_Ud:=Curr_Person.UD;
        while (Curr_Ud<>Nil) do
          begin
               if Abs(Curr_Ud.Summa)>0.005 then
                  begin
                       IsAddUdPerson:=True;
                       Break;
                  end;
               Curr_Ud:=Curr_Ud.NEXT;
          end;
   end;

begin
      New(listRec);
      listRec^.y        := wantedYear;
      listRec^.m        := wantedMonth;
      listRec^.ListAdd  := TList.Create;
      listRec^.ListUd   := TList.Create;
      listRec^.ListVypl := TList.Create;
      ListM.Add(listRec);

      curr_person:=head_person;
      while (Curr_Person<>Nil) do
       begin
            if not IsAddUdPerson(Curr_Person) then
               begin
                    Curr_Person:=Curr_Person^.NEXT;
                    continue;
               end;


            Curr_Ud:=Curr_Person^.Ud;
            while (Curr_Ud<>Nil) do
             begin
                   if IsOnHandShifr(Curr_Ud^.SHIFR) then
                      AddStaForUd(Curr_Ud,listRec.ListVypl)
                   else
                      AddStaForUd(Curr_Ud,listRec.ListUd);
                   Curr_Ud:=Curr_Ud^.NEXT;
             end;
            Curr_Add:=Curr_Person^.Add;
            while (Curr_add<>Nil) do
             begin
                   AddStaForAdd(Curr_Add,listRec.ListAdd);
                   Curr_Add:=Curr_Add^.NEXT;
             end;
            Curr_Person:=Curr_Person^.Next;
       end;
end;



procedure TFormFRXAutoTable.fillListsT;
 var i,j:Integer;
     personRec:PPersonRec;
 procedure addSumm(personRec:pPersonRec;list:TList);
  var finded:Boolean;
      pRec:PPersonRec;
      i:Integer;
  begin
       finded:=false;
       if list.count>0 then
          for i:=0 to list.Count-1 do
              begin
 //                   if pPersonRec(list.Items[i]).m=personRec.m then
 //                   if pPersonRec(list.Items[i]).y=personRec.y then
                    if pPersonRec(list.Items[i]).shifrSta=personRec.shifrSta then
                       begin
                            pPersonRec(list.Items[i]).Summa:=pPersonRec(list.Items[i]).Summa+personRec.Summa;
                            finded:=True;
                            Break;
                       end;
              end;
       if not finded then
          begin
               new(pRec);
               pRec.m        := 0;
               pRec.y        := 0;
               pRec.ShifrSta := personRec.shifrsta;
               pRec.Summa    := personRec.Summa;
               list.Add(pRec);
          end;
  end;
 begin
      if ListM.Count<1 then Exit;
      for i:=0 to ListM.Count-1 do
         begin
              for j:=0 to PListRec(ListM.Items[i]).ListAdd.Count-1 do
                  begin
                       personRec:=pPersonRec(PListRec(ListM.Items[i]).ListAdd.Items[j]);
                       AddSumm(personRec,ListAddT)
                  end;
              for j:=0 to PListRec(ListM.Items[i]).ListUd.Count-1 do
                  begin
                       personRec:=pPersonRec(PListRec(ListM.Items[i]).ListUd.Items[j]);
                       AddSumm(personRec,ListUdT)
                  end;
              for j:=0 to PListRec(ListM.Items[i]).ListVypl.Count-1 do
                  begin
                       personRec:=pPersonRec(PListRec(ListM.Items[i]).ListVypl.Items[j]);
                       AddSumm(personRec,ListVyplT)
                  end;
         end;
 end;

procedure TFormFRXAutoTable.frxReport1BeforePrint(
  Sender: TfrxReportComponent);

 var i,l:Integer;
     rStyle:TfrxStyleItem;
     s:string;
begin
     l:=frxReport1.Styles.Count;
     if l>0 then
        for i:=0 to l-1 do
            begin
                 frxReport1.Styles.Items[i].Font.Size:=fontSize;
            end;
     if Sender is TfrxCrossView then
        begin
             Cross := TfrxCrossView(Sender);
             i:=TfrxCrossView(Sender).Font.Size;
             TfrxCrossView(Sender).Font.Size:=fontSize;
             TfrxCrossView(Sender).Align:=baRight;
             l:=TfrxCrossView(Sender).Font.Size;
             MakeSwod;
        end;

end;

procedure TFormFRXAutoTable.BitBtn1Click(Sender: TObject);
var
   rec,sc          : integer;
   First           : Boolean;
   currDate        : TDate;
   savNMES,savNSRV : Integer;
   y1,y2,m1,m2,d1,d2:Integer;
   finished         : Boolean;
   curr_person     : PERSON_PTR;
   begin
      if WantedTabno<1 then
         begin
              ShowMessage('Сотрудник не указан');
              Exit;
         end;
      savNMES := NMES;
      savNSRV := NSRV;
      PUTINF;
      LDEL_PERSON;
      fontSize:=SpinEditF.Value;
      if ((fontSize<6) or (fontSize>22)) then fontSize:=8;
      First:=True;
      dtArchivFr.date:=encodeDate(yearOf(dtArchivFr.date),monthOf(dtArchivFr.date),1);
      dtArchivTo.date:=encodeDate(yearOf(dtArchivTo.date),monthOf(dtArchivTo.date),1);
      currDate:=dtArchivFr.date;
      Rec:=0;
      while (compareDate(CurrDate,dtArchivTo.date)<GreaterThanValue) do
       begin
            y1:=yearof(CurrDate);
            m1:=monthof(CurrDate);
            d1:=dayof(CurrDate);
            y2:=yearof(dtArchivTo.date);
            m2:=monthof(dtArchivTo.date);
            d2:=dayof(dtArchivTo.date);
            Inc(rec);
            currDate:=IncMonth(currDate,1);
       end;
      ProgressBar1.Max:=rec;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      currDate:=dtArchivFr.date;
      Sc:=0;
      while (compareDate(CurrDate,dtArchivTo.date)<GreaterThanValue) do
          begin
                WantedMonth := monthOf(currDate);
                WantedYear  := yearOf(currDate);
                ProgressBar1.Position:=sc;
                inc(sc);
                label1.Caption:=GetMonthRus(wantedMonth)+' '+intToStr(wantedYear);
                FormWait.Show;
                Application.ProcessMessages;
                getinfsqlArcForTabno(WantedMonth,WantedYear,wantedTabno);
                FormWait.Hide;
                Application.ProcessMessages;
                if COUNT_PERSON>0 then
                if rgWantedGUID.ItemIndex=1 then
                if Length(Trim(wantedGuid))>5 then
                   begin
                        repeat
                              finished:=True;
                              curr_person:=HEAD_PERSON;
                              while (curr_person<>nil) do
                                begin
                                     if GetGUIDPersonToString(curr_person)<>wantedGuid then
                                        begin
                                             finished:=False;
                                             DEL_PERSON(curr_person);
                                             Break;
                                        end;
                                     curr_person:=curr_person^.NEXT;
                                end;
                        until finished;
                   end;
                fillLine(WantedYear,WantedMonth);
                LDEL_PERSON;
                currDate:=incMonth(currDate,1);
          end;
      FillListsT;
      frxReport1.PrepareReport;
      frxReport1.ShowPreparedReport;
      NMES := savNMES;
      NSRV := savNSRV;
      MKFLNM;
      GETINF(TRUE);


end;

constructor TFormFRXAutoTable.GUIDCreate(AOwner: TComponent;GUID:string;FIO:string;Dolg:string;tabno:integer);
 begin
      inherited Create(AOwner);
     Label1.Caption:='';
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     fontSize:=8;
     SpinEditF.Value:=fontSize;
     dtArchivFr.Date:=incMonth(Date,-1);
     dtArchivTo.Date:=Date;
     WantedMonth:=NMES;
     WantedYear:=CURRYEAR;
  //   List:=TList.Create;
     WantedTabno:=tabno;
     WantedFIO  := FIO;
     wantedDolg := dolg;
     wantedGUID := GUID;
     if Length(Trim(wantedGUID))>0 then
        rgWantedGUID.ItemIndex:=1
     else
        rgWantedGuid.ItemIndex:=0;
     ListM      := TList.Create;
     ListAddT   := TList.Create;
     ListUdT    := TList.Create;
     ListVyplT  := TList.Create;
     FIOLabel.Caption:=Trim(FIO)+' '+trim(dolg);

 end;
constructor TFormFRXAutoTable.MyCreate(AOwner: TComponent);
 begin
      inherited Create(AOwner);
     Label1.Caption:='';
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     fontSize:=8;
     SpinEditF.Value:=fontSize;
     dtArchivFr.Date:=incMonth(Date,-1);
     dtArchivTo.Date:=Date;
     WantedMonth:=NMES;
     WantedYear:=CURRYEAR;
  //   List:=TList.Create;
     WantedTabno := 0;
     WantedFIO   := '';
     wantedDolg  := '';
     wantedGUID  := '';
     rgWantedGUID.ItemIndex:=0;
     rgWantedGUID.Hide;
     rgWantedGUID.Enabled:=False;
     ListM       := TList.Create;
     ListAddT    := TList.Create;
     ListUdT     := TList.Create;
     ListVyplT   := TList.Create;
     FIOLabel.Caption:='Укажите сотрудника';

 end;




procedure TFormFRXAutoTable.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName, 'NameRep') = 0 then
        begin
             Value:=Trim(WantedFIO);
             if length(Trim(wantedGUID))>5 then
             if length(Trim(wantedDolg))>1 then
                Value:=Trim(WantedFIO)+' '+trim(wanteddolg);
        end
     else
     if CompareText(VarName, 'NameUni') = 0 then
        if isLNR then
           Value:='ГОУ ВПО Луганский государственный университет имени В.Даля'
        else
           Value:='Східноукраїнський національній університет імени В.Даля';   

end;




procedure TFormFRXAutoTable.PersonBtnClick(Sender: TObject);
var WT:integer;
    WF:String; 
begin
{    Tabno:=0;}
    wantedFio:='';
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     WT:=GetTabno;
                     WF:=GetFio;
                  {   if FIB.GetRightForSecretWorker(WT) then}
                     if true then
                        begin
                             Self.WantedTabno := WT;
                             Self.WantedFIO   := WF;
                             Self.wantedGUID  := '';
                             self.wantedDolg  := '';
                             Self.FIOLabel.Caption:=IntToStr(Self.WantedTabno)+' '+Trim(wantedFio);
                             Self.Repaint;
                        end
                     else
                        begin
                             ShowMessage('Нет прав на доступ к данным этого сотрудника');
                        end;
               end;
         finally
{
            try
               free;
            finally
            end;
}            
          end;


end;



end.
