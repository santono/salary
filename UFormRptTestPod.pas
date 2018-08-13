unit UFormRptTestPod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, frxClass, frxDBSet, DB, DBClient,
  frxExportRTF, frxExportXLS, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet;

type
  TFormRptTestPod = class(TForm)
    pb1: TProgressBar;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dsTest: TClientDataSet;
    dsTestshifrPod: TIntegerField;
    dsTesttabno: TIntegerField;
    dsTestfio: TStringField;
    frxrprt1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    dsTestsummaAdd: TFloatField;
    dsTestsummaPodFakt: TFloatField;
    dsTestsummaPodRas: TFloatField;
    dsTestsummaPodRazn: TFloatField;
    dsTestsummaLgSob: TFloatField;
    dsTestsummaLgDeti: TFloatField;
    dsTesty: TIntegerField;
    dsTestm: TIntegerField;
    dsTestisLgotyPN: TIntegerField;
    dsTestkd: TIntegerField;
    dsoOld: TDataSource;
    dsOld: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsOldTN: TFIBIntegerField;
    dsOldSAD: TFIBBCDField;
    dsOldSUD: TFIBBCDField;
    dsTestsummaAddOld: TFloatField;
    dsTestsummaPodOld: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure frxrprt1GetValue(const VarName: String; var Value: Variant);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
      procedure makeTesting;
      procedure addFromDataBase;

  public
    { Public declarations }
  end;

var
  FormRptTestPod: TFormRptTestPod;

implementation
  uses ScrDef,ScrUtil,scrio, UFibModule,ScrNalog,uFormWait;
  type prec=^trec;
       trec=record
            tabno        : Integer;
            summa        : Real;
            summaAdd     : Real;
            summaPodFakt : Real;
            summaPodRas  : Real;
            summaPodRazn : Real;
            summaAddOld  : Real;       // Начисдено и удержано в прошлых периодах
            summaPodOld  : Real;
            y            : Integer;
            m            : Integer;
            shifrpod     : Integer;
            isLgotaPn    : Integer;
            kd           : Integer;
            p            : Real;    //Коеф.льг по под налогу
            fio          : string;
           end;
  var List : TList;

  procedure AddSummaAdd(Curr_Person:PERSON_PTR;Curr_Add:ADD_PTR);
    var finded : Boolean;
        rec    : prec;
        i      : Integer;
        y      : Integer;
        m      : Integer;
        isLgotaPn :integer;
        kd     : Integer;
        p      : Real;
    begin
          finded:=False;
          isLgotaPN:=0;
          kd:=GetKwoDetOdMPN2004(Curr_Person);
          if IsOtherPeriodECBShifr(Curr_Add.SHIFR) then
             begin
                  y := Curr_add^.YEAR+1990;
                  m := Curr_Add^.PERIOD;
             end
          else
             begin
                  y := CURRYEAR;
                  m := nmes;
             end;
          p:=GetLgotyPN2004(Curr_Person);
          if p>0.01 then
             isLgotaPN:=1;
          if ((IsLgotyPN2011(Curr_Person)) and
             (not IsNetLgotyPN(Curr_Person))) then
             isLgotaPN:=1;
          if ((STORONNEE_PODRAZD(Curr_Person^.Mesto_Osn_Raboty)) or
             (RECENZENT_PODRAZD(Curr_Person^.Mesto_Osn_Raboty))) then
             begin
                 isLgotaPN:=0;
                 p:=0;
             end;
          if List.count>0 then
             for i:=0 to List.Count-1 do
                 begin
                      if prec(List.Items[i]).tabno=Curr_Person.TABNO then
                      if prec(List.Items[i]).y=y then
                      if prec(List.Items[i]).m=m then
                         begin
                              prec(List.Items[i]).summaAdd:=prec(List.Items[i]).summaAdd+curr_add.SUMMA;
                              if isLgotaPn>0 then
                                 prec(List.Items[i]).isLgotaPn:=isLgotaPN;
                              if p>0.001 then
                                 prec(List.Items[i]).p:=p;
                              if kd>0 then
                                 prec(List.Items[i]).kd:=kd;
                              finded:=True;
                              break
                         end;
                 end;
          if not finded then
             begin
                  New(rec);
                  rec.tabno    := curr_person.tabno;
                  rec.summaAdd := curr_add^.SUMMA;
                  rec.shifrpod := NSRV;
                  rec.summaPodFakt := 0;
                  rec.summaPodRas  := 0;
                  rec.summaPodRazn := 0;
                  rec.summaAddOld  := 0;
                  rec.summaPodOld  := 0;
                  rec.y := y;
                  rec.m := m;
                  rec.isLgotaPn:=isLgotaPn;
                  rec.kd := kd;
                  rec.p  := p;
                  rec.fio := Curr_Person^.FIO;
                  list.Add(rec);
             end;
    end;
  procedure AddSummaPod(Curr_Person:PERSON_PTR;Curr_Ud:UD_PTR);
    var finded : Boolean;
        rec    : prec;
        i      : Integer;
        y      : Integer;
        m      : Integer;
        isLgotaPN : integer;
        kd     :  Integer;
        p      : Real;
    begin
          finded:=False;
          y := Curr_ud^.YEAR+1990;
          m := Curr_ud^.PERIOD;
          isLgotaPN:=0;
          p:=GetLgotyPN2004(Curr_Person);
          if p>0.01 then
             isLgotaPN:=1;
          if ((IsLgotyPN2011(Curr_Person)) and
             (not IsNetLgotyPN(Curr_Person))) then
             isLgotaPN:=1;
          if ((STORONNEE_PODRAZD(Curr_Person^.Mesto_Osn_Raboty)) or
             (RECENZENT_PODRAZD(Curr_Person^.Mesto_Osn_Raboty))) then
             begin
                 isLgotaPN:=0;
                 p:=0;
             end;

          kd:=GetKwoDetOdMPN2004(Curr_person);
          if List.count>0 then
             for i:=0 to List.Count-1 do
                 begin
                      if prec(List.Items[i]).tabno=Curr_Person.TABNO then
                      if prec(List.Items[i]).y=y then
                      if prec(List.Items[i]).m=m then
                         begin
                              prec(List.Items[i]).summaPodFakt:=prec(List.Items[i]).summaPodFakt+curr_ud.SUMMA;
                              finded:=True;
                              break
                         end;
                 end;
          if not finded then
             begin
                  New(rec);
                  rec.tabno        := curr_person.tabno;
                  rec.summaAdd     := 0;
                  rec.shifrpod     := NSRV;
                  rec.summaPodFakt := curr_ud^.SUMMA;
                  rec.summaPodRas  := 0;
                  rec.summaPodRazn := 0;
                  rec.summaAddOld  := 0;
                  rec.summaPodOld  := 0;
                  rec.y := y;
                  rec.m := m;
                  rec.isLgotaPn:=isLgotaPN;
                  rec.kd := kd;
                  rec.p  := p;
                  rec.fio := Curr_Person^.FIO;
                  list.Add(rec);
             end;
    end;

{$R *.dfm}

procedure TFormRptTestPod.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

//function compare(p1:Pointer,p2:pointer):Integer;
//  var retVal:integer;
//  begin
//       prec(p1).tabno
//  end;
procedure addToRecOldSummy(tabno:Integer;summaAdd:Real;summaPod:real);
    var finded : Boolean;
        rec    : prec;
        i      : Integer;
        y      : Integer;
        m      : Integer;
        isLgotaPN : integer;
        kd     :  Integer;
        p      : Real;
    begin
          finded:=False;
          y := curryear;
          m := nmes;
          isLgotaPN:=0;
          p:=0;
          kd:=0;
          if List.count>0 then
             for i:=0 to List.Count-1 do
                 begin
                      if prec(List.Items[i]).tabno=tabno then
                      if prec(List.Items[i]).y=y then
                      if prec(List.Items[i]).m=m then
                         begin
                              prec(List.Items[i]).summaAddOld:=prec(List.Items[i]).summaAddOld+summaAdd;
                              prec(List.Items[i]).summaPodOld:=prec(List.Items[i]).summaPodOld+summaPod;
                              finded:=True;
                              break
                         end;
                 end;

 end;
procedure TFormRptTestPod.addFromDataBase;
 var tabno:Integer;
     summaAdd:Real;
     summaPod:Real;
 begin
      FormWait.Show;
      if dsOld.Active then
         dsOld.Close;
      if dsOld.Transaction.Active then
         dsOld.Transaction.Commit;
      dsOld.ParamByName('y').AsInteger:=CURRYEAR;
      dsOld.ParamByName('m').AsInteger:=NMES;
      dsOld.Transaction.StartTransaction;
      dsOld.Active:=true;
      while (not dsOld.Eof) do
        begin
             tabno:=dsOld.Fields[0].AsInteger;
             summaAdd:=dsOld.Fields[1].AsFloat;
             summaPod:=dsOld.Fields[2].AsFloat;
             if ((tabno>0) and (tabno<20000)) then
                addToRecOldSummy(tabno,summaAdd,summaPod);
             dsOld.Next;
        end;
      dsOld.Close;
      dsOld.Transaction.Commit;
      FormWait.Hide;



 end;
procedure TFormRptTestPod.makeTesting;

  var tmpNMES , tmpNSRV , i_nsrv , i : Integer;
      Curr_Person : PERSON_PTR;
      Curr_Add    : Add_Ptr;
      Curr_Ud     : Ud_Ptr;
      Count       : Integer;
      fio         : string;

  begin
       tmpNMES := NMES;
       tmpNSRV := NSRV;
       putinf;
       while HEAD_PERSON<>nil do DEL_PERSON(head_person);
       pb1.Max      := Count_Serv;
       pb1.Min      := 0;
       pb1.Position := 0;
       COUNT        := 0;
       list   := TList.Create;
       for i_nsrv:=1 to Count_Serv do
           begin
                pb1.Position := i_nsrv ;
                lbl1.Caption := Name_Serv(i_nsrv);
                Application.ProcessMessages ;
                if isSVDN then
                if NSRV in [105,106] then
                   Continue;
                nsrv:=i_nsrv;
                mkflnm;
                if not FileExists(fninf) then Continue;
                getinf(false);
                curr_person:=HEAD_PERSON;
                while (Curr_Person<>Nil) do
                  begin
                       if Curr_Person^.tabno=6421 then
                          nsrv:=i_nsrv;
                       curr_Add:=curr_person.Add;
                       while (Curr_Add<>Nil) do
                         begin
                              AddSummaAdd(Curr_Person,Curr_Add);
                              Curr_Add:=Curr_Add.Next;
                         end;
                       curr_Ud:=curr_person.Ud;
                       while (Curr_Ud<>Nil) do
                         begin
                              if Curr_Ud^.Shifr=podoh_shifr then
                                 AddSummaPod(Curr_Person,Curr_Ud);
                              Curr_Ud:=Curr_Ud.Next;
                         end;
                       Curr_Person:=Curr_Person.NEXT;
                  end;
                while HEAD_PERSON<>nil do DEL_PERSON(head_person);

           end;
       if List.Count>0 then
          begin
              if not isSVDN then
                 addFromDataBase;
              for i:=0 to list.count-1 do
                  begin
                    if prec(List.Items[i]).tabno=11691 then
                       prec(List.Items[i]).tabno:=11691;
                      prec(List.Items[i]).SummaPodRas:= R10(PODOH_2004_2011((prec(List.Items[i]).SummaAdd+prec(List.Items[i]).SummaAddOld),0.0,0.0,prec(List.Items[i]).m,prec(List.Items[i]).y,prec(List.Items[i]).isLgotaPN,prec(List.Items[i]).kd,prec(List.Items[i]).p));
                      prec(List.Items[i]).SummaPodRazn:= R10(prec(List.Items[i]).SummaPodRas-prec(List.Items[i]).SummaPodFakt-prec(List.Items[i]).SummaPodOld);
                      if (prec(List.Items[i]).y<>curryear)
                         or
                         (prec(List.Items[i]).m<>nmes) then
                         begin
                              prec(List.Items[i]).SummaPodRas:=prec(List.Items[i]).SummaPodFakt;
                              prec(List.Items[i]).SummaPodRazn:=0;
                         end;

                  end;

              dsTest.Open;
              for i:=0 to list.count-1 do
                  begin
                      dstest.Append;
                      dsTestshifrPod.Value     := prec(List.Items[i]).shifrpod;
                      dsTesttabno.Value        := prec(List.Items[i]).tabno;
                      dsTestsummaAdd.Value     := prec(List.Items[i]).summaAdd;
                      dsTestsummaPodFakt.Value := prec(List.Items[i]).summaPodFakt;
                      dsTestsummaPodRas.Value  := prec(List.Items[i]).summaPodRas;
                      dsTestsummaPodRazn.Value := prec(List.Items[i]).summaPodRazn;
                      dsTestfio.Value          := Trim(prec(List.Items[i]).FIO);
                      dsTestisLgotyPN.Value    := prec(List.Items[i]).isLgotaPN;
                      dsTestKd.Value           := prec(List.Items[i]).kd;
                      dsTesty.Value            := prec(List.Items[i]).y;
                      dsTestM.Value            := prec(List.Items[i]).M;
                      dstest.Post;
                  end;
               for i:=0 to List.Count-1 do
                  Dispose(pRec(List.Items[i]));
               List.Free;
               frxrprt1.ShowReport;
               dsTest.Close;
          end
        //  ShowMessage('Найдено '+intToStr(Count)+' несоответствий')
       else
          ShowMessage('Не найдено сотрудников ');
       NMES := tmpNMES;
       NSRV := tmpNSRV;
       mkflnm;
       getInf(true);

  end;


procedure TFormRptTestPod.btn1Click(Sender: TObject);
begin
     makeTesting;
     Close;
end;

procedure TFormRptTestPod.frxrprt1GetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthRus(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          Value:=IntToStr(CURRYEAR)+' г.';
end;

procedure TFormRptTestPod.FormCreate(Sender: TObject);
begin
      lbl1.Caption:='';
end;

end.
