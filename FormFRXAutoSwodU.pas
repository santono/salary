unit FormFRXAutoSwodU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxCross, StdCtrls, Buttons, ComCtrls, frxExportText,
  frxExportRTF, frxExportXLS, Spin, frxExportPDF;

type
  TFormFRXAutoSwod = class(TForm)
    BitBtn1: TBitBtn;
    frxCrossObject1: TfrxCrossObject;
    CheckBoxGru: TCheckBox;
    Button1: TButton;
    frxReport1: TfrxReport;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxSimpleTextExport1: TfrxSimpleTextExport;
    SpinEditF: TSpinEdit;
    Label2: TLabel;
    cbArchiv: TCheckBox;
    dtArchiv: TDateTimePicker;
    frxpdfxprt1: TfrxPDFExport;
    chkNeedTN: TCheckBox;
   
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBoxGruClick(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure cbArchivClick(Sender: TObject);
  private
    fontSize:integer;
    NeedListTN:boolean;
    WantedMonth,WantedYear:Integer;
    List:TList;
    savedTopSVDN:real;
    topCalcSVDN:real;
    { Private declarations }
    Cross : TfrxCrossView;
    procedure MakeSwod;
    procedure InitListTN;
    function isTabnoInList(Tabno:integer):Boolean;


  public
    { Public declarations }
  end;

var
  FormFRXAutoSwod: TFormFRXAutoSwod;
implementation
 uses Scrdef,ScrUtil,ScrLists,UFormSelPKG,ScrIO,ScrIOSql,DateUTils;

  type
       PPersonRec=^TPersonRec;
       TPersonRec=record
                    ShifrSta : integer;
                    Summa    : real;
                  end;


{$R *.dfm}

procedure TFormFRXAutoSwod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     List.Free;
     Action:=caFree;
end;

   function CompareItems(Item1, Item2: Pointer): Integer;
     begin
          if PPersonRec(Item1)^.ShifrSta>PPersonRec(Item2)^.ShifrSta then Result:=1
          else if PPersonRec(Item1)^.ShifrSta<PPersonRec(Item2)^.ShifrSta then Result:=-1
          else Result:=0;
     end;

procedure TFormFRXAutoSwod.MakeSwod;
 const F='######0.00';
 {$IFDEF SVDN}
 const Nmb_Col=7;
 const Header:array[1..Nmb_Col] of string = ('Т.ном.','ПІБ','Посада',
                                           'Катег','Рб','Вдп','Лк');
 {$ELSE}
 const Nmb_Col=8;
 const Header:array[1..Nmb_Col] of string = ('Т.ном.','ФИО','Должн.','Счет',
                                           'Катег','Рб','Отп','Бл');
 {$ENDIF}
 var Curr_Person : Person_Ptr;
     Curr_Add    : Add_Ptr;
     Curr_Ud     : Ud_Ptr;
     PersonRec   : PPersonRec;
     I,LineNo    : integer;
     ListAdd     : TList;
     ListUd      : TList;
     ListAddT    : TList;
     ListUdT     : TList;
     List        : TList;
     S,S1,LineNoS: string;
     SummaAddT,SummaUdT,SummaAdd,SummaUd:real;
 procedure AddSta(Shifr:integer;Summa:real;List:TList);
   var I         : integer;
       Finded    : boolean;
       PersonRec : PPersonRec;
  begin
        Finded:=false;
        if List.Count>0 then
           for i:=1 to List.Count do
               if PPersonRec(List.Items[i-1])^.ShifrSta=Shifr then
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
               List.Add(PersonRec);
           end;



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

 procedure MakeListTot;
  const l=10;
  var Curr_Person : Person_Ptr;
      Curr_Add    : Add_Ptr;
      Curr_Ud     : Ud_Ptr;
      i,k,j       : integer;
      PersonRec   : PPersonRec;
      S,S1,s2     : string;
  begin
       SummaAddT   := 0;
       SummaUdT    := 0;
       ListAddT    := TList.Create;
       ListUdT     := TList.Create;
       Curr_Person := Head_Person;
       while (Curr_Person<>Nil) do
             begin
                  if CheckBoxGru.Checked then
                  if not GruppyList.IsSelected(Curr_Person^.Gruppa) then
                     begin
                          Curr_Person:=Curr_Person^.NEXT;
                          continue;
                     end;
                  if not IsAddUdPerson(Curr_Person) then
                     begin
                          Curr_Person:=Curr_Person^.NEXT;
                          continue;
                     end;
                  if NeedListTN then
                     begin
                          if not isTabnoInList(Curr_Person^.tabno) then
                             begin
                                  Curr_Person:=Curr_Person^.NEXT;
                                  Continue;
                             end;
                     end;
                  Curr_Add:=Curr_Person^.ADD;
                  while (Curr_Add<>Nil) do
                        begin
                              AddSta(Curr_Add^.Shifr,Curr_Add^.Summa,ListAddT);
                              Curr_Add:=Curr_Add^.NEXT;
                        end;
                  Curr_Ud:=Curr_Person^.Ud;
                  while (Curr_Ud<>Nil) do
                        begin
                              AddSta(Curr_Ud^.Shifr,Curr_Ud^.Summa,ListUdT);
                              Curr_Ud:=Curr_Ud^.NEXT;
                        end;
                  Curr_Person:=Curr_Person^.NEXT;
             end;
       for i:=1 to Nmb_Col do
           Cross.AddValue([0],[Header[i]],[' ']);
       if ListAddT.Count>0 then
          begin
             ListAddT.Sort(@CompareItems);
             SummaAddT:=0;
             for i:=1  to ListAddT.Count do
                 begin
                    PersonRec := PPersonRec(ListAddT.Items[i-1]);
                    SummaAddT := SummaAddT + PersonRec^.Summa;
                    S:=IntToStr(PersonRec^.ShifrSta);
                    S1:=Trim(ShifrList.GetNameFromFirstChar(PersonRec^.ShifrSta));
                    S2:='';
                    if length(S1)>10 then
                       for j:=1 to length(S1) do
                           begin
                                if j<length(S1) then
                                if j mod l = 0 then
                                   S2:=S2+chr(13);
                                s2:=S2+s1[j];
                           end
                    else
                        S2:=S1;
                    Cross.AddValue([0],[S],[S2]);
                 end;
             if isSVDN then
                Cross.AddValue([0],['Ітого'+chr(13)+'нараховано'],[' '])
             else
                Cross.AddValue([0],['Итого'+chr(13)+'начислено'],[' ']);
          end;
       if ListUdT.Count>0 then
          begin
              SummaUdT:=0;
              ListUdT.Sort(@CompareItems);
              for i:=1  to ListUdT.Count do
                 begin
                      PersonRec:=PPersonRec(ListUdT.Items[i-1]);
                      SummaUdT := SummaUdT + PersonRec^.Summa;
                      S:=IntToStr(PersonRec^.ShifrSta);
                      S1:=Trim(ShifrList.GetNameFromFirstChar(PersonRec^.ShifrSta));
                      S2:='';
                      if length(S1)>10 then
                         for j:=1 to length(S1) do
                             begin
                                  if j<length(S1) then
                                  if j mod l = 0 then
                                     S2:=S2+chr(13);
                                  s2:=S2+s1[j];
                             end
                      else
                          S2:=S1;
                      Cross.AddValue([0],[S],[S2]);
                 end;
             if isSVDN then
                Cross.AddValue([0],['Ітого'+chr(13)+'утримано'],[' '])
             else
                Cross.AddValue([0],['Итого'+chr(13)+'удержано'],[' ']);
          end;
  end;
begin
      MakeListTot;
      LineNo := 0;
      curr_person:=head_person;
      while (Curr_Person<>Nil) do
       begin
            if CheckBoxGru.Checked then
            if not GruppyList.IsSelected(Curr_Person^.Gruppa)then
               begin
                    Curr_Person:=Curr_Person^.NEXT;
                    continue;
               end;
            if not IsAddUdPerson(Curr_Person) then
               begin
                    Curr_Person:=Curr_Person^.NEXT;
                    continue;
               end;
           if NeedListTN then
              begin
                  if not isTabnoInList(Curr_Person^.tabno) then
                     begin
                          Curr_Person:=Curr_Person^.NEXT;
                          Continue;
                     end;
              end;

            LineNo := LineNo + 1;
            LineNoS:=IntToStr(LineNo);
            S:=IntToStr(Curr_Person^.Tabno);
            Cross.AddValue([LineNo],[Header[1]],[S]);
            Cross.AddValue([LineNo],[Header[2]],[Curr_Person^.FIO]);
            Cross.AddValue([LineNo],[Header[3]],[Curr_Person^.Dolg]);
            if isSVDN then
               begin
//                    Cross.AddValue([LineNo],[Header[4]],[Get_Ist_Name(Curr_Person^.Gruppa)]);
                    Cross.AddValue([LineNo],[Header[4]],[Get_Kat_Short_Name(Curr_Person^.Kategorija)]);
               end
            else
               begin
                    Cross.AddValue([LineNo],[Header[4]],[Get_Ist_Name(Curr_Person^.Gruppa)]);
                    Cross.AddValue([LineNo],[Header[5]],[Get_Kat_Short_Name(Curr_Person^.Kategorija)]);
               end;
{
            S:='Осн';
            if not Is_Osn_Wid_Raboty(Curr_Person) then
               S:='Свм';
            Cross.AddValue([LineNo],[Header[6]],[S]);
}
            s:=' ';
            if Work_Day(1,31,Curr_Person)>0 then
               S:=IntToStr(Work_Day(1,31,Curr_Person));
            Cross.AddValue([LineNo],[Header[Nmb_Col-2]],[S]);
//            if isSVDN then
//               Cross.AddValue([LineNo],[Header[5]],[S])
//            else
//               Cross.AddValue([LineNo],[Header[6]],[S]);
            s:=' ';
            if Otpusk_Day(1,Curr_Person)>0 then
               S:=IntToStr(Otpusk_Day(1,Curr_Person));
            Cross.AddValue([LineNo],[Header[Nmb_Col-1]],[S]);
//            if isSVDN then
//               Cross.AddValue([LineNo],[Header[6]],[S])
//            else
//               Cross.AddValue([LineNo],[Header[7]],[S]);
            s:=' ';
            if Ill_Day(1,Curr_Person)>0 then
               S:=IntToStr(Ill_Day(1,Curr_Person));
            Cross.AddValue([LineNo],[Header[Nmb_Col]],[S]);
            ListAdd:=TList.Create;
            ListUd:=TList.Create;
            Curr_Ud:=Curr_Person^.Ud;
            while (Curr_Ud<>Nil) do
             begin
                   AddSta(Curr_Ud^.Shifr,Curr_Ud^.Summa,ListUd);
                   Curr_Ud:=Curr_Ud^.NEXT;
             end;
            Curr_Add:=Curr_Person^.Add;
            while (Curr_add<>Nil) do
             begin
                   AddSta(Curr_Add^.Shifr,Curr_Add^.Summa,ListAdd);
                   Curr_Add:=Curr_Add^.NEXT;
             end;
            SummaAdd:=0;
            if ListAdd.Count>0 then
               for i:=1  to ListAdd.Count do
                   begin
                        PersonRec:=PPersonRec(ListAdd.Items[i-1]);
                        S:=IntToStr(PersonRec^.ShifrSta);
                        if Abs(PersonRec^.Summa)<0.01 then
                           S1:=' '
                        else
                           S1:=FormatFloat(F,PersonRec^.Summa);
                        SummaAdd:=SummaAdd+PersonRec^.Summa;
                        Cross.AddValue([LineNo],[S],[S1]);
                        Dispose(PersonRec);
                   end;
            if ListAddT.Count>0 then
               begin
                    S1:=FormatFloat(F,SummaAdd);
                    if isSVDN then
                       Cross.AddValue([LineNo],['Iтого'+chr(13)+'нараховано'],[S1])
                    else
                       Cross.AddValue([LineNo],['Итого'+chr(13)+'начислено'],[S1]);
               end;
            SummaUd:=0;
            if ListUd.Count>0 then
               for i:=1  to ListUd.Count do
                   begin
                        PersonRec:=PPersonRec(ListUd.Items[i-1]);
                        S:=IntToStr(PersonRec^.ShifrSta);
                        if Abs(PersonRec^.Summa)<0.01 then
                           S1:=' '
                        else
                           S1:=FormatFloat(F,PersonRec^.Summa);
                     //   S1:=FormatFloat(F,PersonRec^.Summa);
                        SummaUd:=SummaUd+PersonRec^.Summa;
                        Cross.AddValue([LineNo],[S],[S1]);
                        Dispose(PersonRec);
                   end;
            if ListUdT.Count>0 then
               begin
                    S1:=FormatFloat(F,SummaUd);
                    if isSVDN then
                       Cross.AddValue([LineNo],['Ітого'+chr(13)+'утримано'],[S1])
                    else
                       Cross.AddValue([LineNo],['Итого'+chr(13)+'удержано'],[S1]);
               end;
            ListUd.Free;
            ListAdd.Free;
            Curr_Person:=Curr_Person^.Next;
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
             if isSVDN then
                Cross.AddValue(['9999'],['Ітого'+chr(13)+'нараховано'],[S1])
             else
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
             if isSVDN then
                Cross.AddValue(['9999'],['Ітого'+chr(13)+'утримано'],[S1])
             else
                Cross.AddValue(['9999'],['Итого'+chr(13)+'удержано'],[S1]);
          end;
       ListAddT.Free;
       ListUdT.Free;
end;



procedure TFormFRXAutoSwod.frxReport1BeforePrint(
  Sender: TfrxReportComponent);

 var i,l:Integer;
     rStyle:TfrxStyleItem;
     s:string;
     memo1,memo2,memo : TfrxMemoView;
     pageHeader : TfrxPageHeader;
     colCount,rowCount:integer;

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
          //  TfrxCrossView(Sender).Font.S
             i:=TfrxCrossView(Sender).Font.Size;
             TfrxCrossView(Sender).Font.Size:=fontSize;
             l:=TfrxCrossView(Sender).Font.Size;
       //      TfrxCrossView(Sender).A
             MakeSwod;
             colCount:=Cross.ColCount;
             rowCount:=Cross.rowCount;
   //          Cross.GapY:=1;
   //          Cross.GapX:=1;
{
             with Cross do
              begin
                   AddValue(['Ann'], [2001, 2], [1500]);
                   AddValue(['Ann'], [2001, 3], [1600]);
                   AddValue(['Ann'], [2002, 1], [1700]);
                   AddValue(['Ben'], [2002, 1], [2000]);
                   AddValue(['Den'], [2001, 1], [4000]);
                   AddValue(['Den'], [2001, 2], [4100]);
              end;
}
        end;
    //    memo:=frxReport1.g
      //  frxReport1.frVariables['isSVDN']:='0';
        if Sender is TfrxPageHeader then
        if isSVDN then
           begin
                memo := frxReport1.FindObject('Memo4') as TfrxMemoView;
                if (memo<>Nil) then
                   begin
                        memo.visible:=false;
                        savedTopSvdn:=memo.top;
                   end;
                memo1 := frxReport1.FindObject('Memo3') as TfrxMemoView;
                if (memo1<>Nil) then
                   begin
                        if (abs(memo1.top-savedTopSVDN)>0.1) then
                            begin
//                           memo.top:=memo.top-0.5;
                               topCalcSVDN:=memo1.top;
                               memo1.Top:=savedTopSVDN;
                            end;
                   end;
                memo2 := frxReport1.FindObject('Memo2') as TfrxMemoView;
                if (memo2<>Nil) then
                   begin
                        if (abs(topCalcSVDN-memo2.Top)>0.1) then
                            memo2.top:=topCalcSVDN;
                   end;
                pageHeader := frxReport1.FindObject('PageHeader1') as TfrxPageHeader;
                if (pageHeader<>Nil) then
                   if (memo1.top>1.00) then
                    pageHeader.height:=pageHeader.height-memo1.Height;


           end

end;

procedure TFormFRXAutoSwod.BitBtn1Click(Sender: TObject);
var
   savNMES,savNSRV : integer;
   iNSRV           : integer;
   First           : Boolean;
begin
      NeedListTN:=chkNeedTN.Checked;
      if NeedListTN then
         InitListTN;
      if CheckBoxGru.Checked then
      if GruppyList.CountSelected<=0 then
         begin
              if isSVDN then
                 GruppyList.setAllSelected()
              else
                  begin
                       ShowMessage('Не выбраны счета');
                       Exit;
                  end;
         end;
      if NameServList.CountSelected<=0 then
         begin
              ShowMessage('Не выбраны подразделения');
              Exit;
         end;
      fontSize:=SpinEditF.Value;
      if ((fontSize<6) or (fontSize>22)) then fontSize:=8;
      savNMES:=NMES;
      savNSRV:=NSRV;
      putinf;
      EMPTY_ALL_PERSON;
      First:=True;
      ProgressBar1.Max:=COUNT_SERV;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      if cbArchiv.Checked then
         begin
              WantedMonth:=MonthOf(dtArchiv.Date);
              WantedYear:=YearOf(dtArchiv.Date);
         end;
      for insrv:=1 to COUNT_SERV do
          begin
                ProgressBar1.Position:=insrv;
                label1.Caption:=Name_Serv(insrv);
                Application.ProcessMessages;
                if not NameServList.IsSelected(insrv) then Continue;
                nsrv:=insrv;
                MKFLNM;
                if cbArchiv.Checked=false then
                if not FileExists(fninf) then Continue;
                if cbArchiv.Checked then
                   getinfsqlArc(WantedMonth,WantedYear)
                else
                   getinf(false);
                if First then
                   begin
//                        frVariables['isSVDN']:='0';
//                        frVariables['aaa']:=edit1.Text
//                        frxReport1.Dictionary.Variables['isSVDN']:='1'; 
                        frxReport1.PrepareReport;
                        First:=False;
                   end
                else
                    frxReport1.PrepareReport(false);
//                frxReport1.ShowReport(true);
                EMPTY_ALL_PERSON;
          end;
      if not First then
         frxReport1.ShowPreparedReport;
      NMES:=savNMES;
      NSRV:=savNSRV;
      MKFLNM;
      getInf(true);
end;

procedure TFormFRXAutoSwod.FormCreate(Sender: TObject);
begin
     CheckBoxGru.Checked:=false;
     Button1.Hide;
     Label1.Caption:='';
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     fontSize:=8;
     SpinEditF.Value:=fontSize;
     cbArchiv.Checked:=False;
     dtArchiv.Date:=Date;
     dtArchiv.Visible:=False;
     dtArchiv.Enabled:=False;
     WantedMonth:=NMES;
     WantedYear:=CURRYEAR;
     List:=TList.Create;
     NeedListTN:=False;
     chkNeedTN.Checked:=NeedListTN;
     savedTopSVDN := 0.00;
     topCalcSVDN  := 0.00;
end;

procedure TFormFRXAutoSwod.Button1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormFRXAutoSwod.CheckBoxGruClick(Sender: TObject);
begin
      if CheckBoxGru.Checked then Button1.Show
      else Button1.Hide;
end;

procedure TFormFRXAutoSwod.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName, 'NameRep') = 0 then
        if cbArchiv.Checked then
           if isLNR then
              Value:=trim(GetMonthRus(WantedMonth))+' '+IntToStr(WantedYear)+' г. '+trim(GetFullPodrNameFromSQL(NSRV))
           else
//              Value:=trim(GetMonthRus(WantedMonth))+' '+IntToStr(WantedYear)+' г. '+trim(Name_Serv(NSRV))
              if wantedYear>2017 then
                 Value:=trim(GetMonthUkr(WantedMonth))+' '+IntToStr(WantedYear)+' р. '+trim(Name_Serv(NSRV))
              else
                 Value:=trim(GetMonthUkr(WantedMonth))+' '+IntToStr(WantedYear)+' р. '+trim(GetHistoryPodrNameFromSQL(nsrv,WantedYear,WantedMonth))


        else
           if isLNR then
              Value:=trim(GetMonthRus(NMES))+' '+IntToStr(Work_Year_Val)+' г. '+trim(GetFullPodrNameFromSQL(NSRV))
           else
//              Value:=trim(GetMonthRus(NMES))+' '+IntToStr(Work_Year_Val)+' г. '+trim(Name_Serv(NSRV))
              if wantedYear>2017 then
                 Value:=trim(GetMonthUkr(WantedMonth))+' '+IntToStr(WantedYear)+' р. '+trim(Name_Serv(NSRV))
              else
                 Value:=trim(GetMonthUkr(WantedMonth))+' '+IntToStr(WantedYear)+' р. '+trim(GetHistoryPodrNameFromSQL(nsrv,WantedYear,WantedMonth))

//              Value:=trim(GetMonthUkr(NMES))+' '+IntToStr(Work_Year_Val)+' г. '+trim(GetHistoryPodrNameFromSQL(nsrv,Work_Year_Val,NMES))
     else
     if CompareText(VarName, 'NameUni') = 0 then
        if isLNR then
     //      Value:='ГОУ ВПО Луганский государственный университет имени В.Даля'
             Value:='ГОУ ВПО '+trim(getNameUniFromSQL)
        else
           Value:='Східноукраїнський національній університет імени В.Даля'   
     else
     if CompareText(VarName, 'nameBuh') = 0 then
        if isLNR then
     //      Value:='ГОУ ВПО Луганский государственный университет имени В.Даля'
             Value:=copy('Главный бухгалтер'+space(30),1,30)+getGlBuhFIO
        else
           Value:='Головний бухгалтер'
     else
     if CompareText(VarName, 'nameRek') = 0 then
        if isLNR then
     //      Value:='ГОУ ВПО Луганский государственный университет имени В.Даля'
             Value:=copy(getRektorDolg+space(35),1,35)+getRektorFIO
        else
//           Value:='Ректор'
           Value:=''
     else
     if CompareText(VarName, 'isSVDN') = 0 then
        if isLNR then
     //      Value:='ГОУ ВПО Луганский государственный университет имени В.Даля'
             Value:='0'
        else
           Value:='1';

end;

procedure TFormFRXAutoSwod.cbArchivClick(Sender: TObject);
begin
     if cbArchiv.Checked then
        begin
             dtArchiv.Visible:=True;
             dtArchiv.Enabled:=True;
        end
     else
        begin
             dtArchiv.Visible:=false;
             dtArchiv.Enabled:=false;
        end
end;

function TFormFRXAutoSwod.isTabnoInList(Tabno:integer):Boolean;
 var retVal:Boolean;
     i : Integer;
 begin
      retVal:=False;
      if List<>nil then
      if Assigned(List) then
      if List.Count>0 then
         for i:=0 to List.Count-1 do
             begin
                  if pInteger(List.Items[i])^=Tabno then
                     begin
                          retVal:=True;
                          Break;
                     end;
             end;
      isTabnoInList:=retVal;
 end;
procedure TFormFRXAutoSwod.InitListTN;
 var FName:string;
     Dev:TextFile;
     tn:integer;
     pInt:PInteger;
 begin
     List.Free;
     List:=TList.Create;
     FName:=CDOC+'NeedTNRep.txt';
     if not FileExists(FName) then
        begin
             ShowMessage('Отсутствует файл '+FName);
             Exit;
        end;
     AssignFile(dev,FName);
     Reset(Dev);
     while not eof(dev) do
      begin
           readln(dev,tn);
           if not isTabnoInList(tn) then
              begin
                   new(pInt);
                   pInt^:=tn;
         //  ldkb;sldknb;sdlkfnb;sdkfjb
                   List.Add(pInt);
              end;

      end;
     CloseFile(Dev);
 end;


end.
