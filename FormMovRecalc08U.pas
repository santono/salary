unit FormMovRecalc08U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, dxCntner, dxEditor, dxExEdtr, dxEdLib, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormMovRecalc08 = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    pFIBQueryR: TpFIBQuery;
    pFIBQueryW: TpFIBQuery;
    pFIBTransactionR: TpFIBTransaction;
    pFIBTransactionW: TpFIBTransaction;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    dxCalcEditLoSumma: TdxCalcEdit;
    dxCalcEditHiSumma: TdxCalcEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    Button1: TButton;
    pFIBDataSetR: TpFIBDataSet;
    pFIBTrdsR: TpFIBTransaction;
    pFIBDataSetRSHIFRSTA: TFIBIntegerField;
    pFIBDataSetRDOPL_SUMMA: TFIBBCDField;
    pFIBDataSetRP: TpFIBDataSet;
    pFIBTrRP: TpFIBTransaction;
    pFIBDataSetRPSUMMAOLD: TFIBBCDField;
    pFIBDataSetRPNMBOFCLOCK: TFIBBCDField;
    pFIBDataSetRPSTAWKAOLD: TFIBBCDField;
    pFIBDataSetRPSTAWKANEW: TFIBBCDField;
    pFIBDataSetRPSUMMANEW: TFIBBCDField;
    pFIBDataSetRPDOPL: TFIBBCDField;
    BitBtn8: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
  private
    { Private declarations }
    NeedEmpty          : boolean;
    NeedNotCheckedOnly : boolean;
    LoSumma,HiSumma    : real;
    procedure MovMonth(M:integer);
    procedure MovMonthPochas(M:integer);
    procedure MovMonthInd(M:integer);
  public
    { Public declarations }
  end;

var
  FormMovRecalc08: TFormMovRecalc08;

implementation
 uses ScrDef,ScrIo,ScrUtil, uFIBModule, UFormSelPod,ScrLists, UFormSelPKG;

{$R *.dfm}

procedure TFormMovRecalc08.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMovRecalc08.BitBtn1Click(Sender: TObject);
var a:real;
    i:integer;
begin
      if not ((NMES=10) and (WORK_YEAR_VAL=2015)) then
         begin
              ShowMessage('Перенос перерасчета возможен только в октябре 2015 г.');
              Exit;
         end;

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

      dxCalcEditLoSumma.Text:=ReplChar(dxCalcEditLoSumma.Text,',','.');

      val(dxCalcEditLoSumma.Text,a,i);
      if i=0 then
         LoSumma:=a
      else
         begin
              ShowMessage('Неверно задано нижняя граница переноса');
              Exit;
         end;
      if LoSumma<0 then
         begin
              ShowMessage('Неверно задано нижняя граница переноса');
              Exit;
         end;
      dxCalcEditHiSumma.Text:=ReplChar(dxCalcEditHiSumma.Text,',','.');
      val(dxCalcEditHiSumma.Text,a,i);
      if i=0 then
         HiSumma:=a
      else
         begin
              ShowMessage('Неверно задано верхняя граница переноса');
              Exit;
         end;
      if HiSumma<0 then
         begin
              ShowMessage('Неверно задано верхняя граница переноса');
              Exit;
         end;
      if HiSumma<=LoSumma then
         begin
              ShowMessage('Нижняя граница переноса больше или равноа верхней границе');
              Exit;
         end;
      NeedNotCheckedOnly :=CheckBox2.Checked;
//      MovMonth(1);
//      MovMonth(2);
//      MovMonth(3);
//      MovMonth(4);
//      MovMonth(1);
//      MovMonth(2);
      MovMonth(9);
end;

procedure TFormMovRecalc08.MovMonth(M:integer);
 const Id_01=117;
 var SavMonth,I_NSRV,SavPodr:integer;
     Sc,Rec:integer;
     MN,TableName,SQL:string;
     NeedPut:boolean;
     I_Musor:integer;
     ShifrDol:integer;
     Is_O_W_R:integer;
     MarkedLine:boolean;

      procedure DeleteAuIdPodr;
        var Curr_Add:Add_Ptr;
            Finded:boolean;
            C_Person:Person_Ptr;
        begin
             C_Person:=Head_Person;
             while (C_Person<>Nil) do
              begin
             while true do
              begin
                   Finded:=false;
                   Curr_Add:=C_Person^.Add;
                   while (Curr_Add<>Nil) do
                     begin
                          if Curr_Add^.Vyplacheno=Get_Out then
                          if Curr_Add^.Who=id_01+m then
                             begin
                                   Finded:=true;
                                   Del_Add(Curr_Add,C_Person);
                                   NeedPut:=true;
                                   Break;
                             end;
                          Curr_Add:=Curr_Add^.Next;
                      end;
                   if not finded then Break;
              end;
              C_Person:=C_Person^.NEXT;
            end;
        end;


  procedure MakeLineSql;
    var Curr_Person:Person_Ptr;
        Curr_Add:Add_Ptr;
      function DejaMoved:boolean;
       var RetVal:boolean;
           Curr_Add:Add_Ptr;
           A:real;
           S:integer;
       begin
            RetVal:=false;
            Curr_Add:=Curr_Person^.ADD;
            while (Curr_Add<>Nil) do
                  begin
                        if (Curr_Add^.WHO=Id_01+M) and
                           (Curr_Add^.Vyplacheno=GET_OUT) then
                           begin
                                A:=Curr_Add^.Summa;
                                S:=Curr_Add^.Shifr;
                                RetVal:=true;
                                break;
                           end;
                        Curr_Add:=Curr_Add^.NEXT;
                  end;
            DejaMoved:=RetVal;
       end;
      procedure Make_Prsn;
       var Curr_Add:Add_Ptr;
           Curr_Cn:Cn_Ptr;
           Finded:boolean;
           Dopl_Oklad:real;
           Y : Integer;
           SummaRecalc:Real;
       begin
            Y:=2015;
            SummaRecalc:=0;
            Dopl_Oklad := pFIBQueryR.FieldByName('DOPL_OKLAD').AsFloat;
            if not ((Dopl_Oklad>=LoSumma) and (Dopl_Oklad<=HiSumma)) then
               Exit;
            if abs(pFIBQueryR.FieldByName('DOPL_OKLAD').AsFloat)>0.01 then
               begin
                    SummaRecalc:=SummaRecalc+pFIBQueryR.FieldByName('DOPL_OKLAD').AsFloat;
{
                    Make_Add(Curr_Add,Curr_Person);
                    Curr_Add^.PERIOD:=M;
                    Curr_Add^.Year:=Y-1990;
                    Curr_Add^.SHIFR:=OKLAD_SHIFR;
                    Curr_Add^.Summa:=pFIBQueryR.FieldByName('DOPL_OKLAD').AsFloat;
                    Curr_Add^.Who:=Id_01+M;
                    Curr_Add^.VYPLACHENO:=Get_Out;
}
               end;

            if pFIBDataSetR.Active then
               pFIBDataSetR.Close;
            pFIBDataSetR.Params[0].AsInteger:=pFIBQueryR.FieldByName('SHIFRID').AsInteger;
            pFIBDataSetR.Prepare;
            pFIBDataSetR.Open;
            while not pFIBDataSetR.Eof do
              begin
                   if pFIBDataSetRDOPL_SUMMA.Value>0.01 then
                      begin
                           SummaRecalc:=SummaRecalc+pFIBDataSetRDOPL_SUMMA.Value;
{
                           Make_Add(Curr_Add,Curr_Person);
                           Curr_Add^.PERIOD:=M;
                           Curr_Add^.Year:=Y-1990;
                           Curr_Add^.SHIFR:=pFIBDataSetRShifrSta.Value;
                           Curr_Add^.Summa:=pFIBDataSetRDOPL_SUMMA.Value;
                           Curr_Add^.Who:=Id_01+M;
                           Curr_Add^.VYPLACHENO:=Get_Out;
}
                      end;
                   pFIBDataSetR.Next;
              end;
            pFIBDataSetR.Close;

            if SummaRecalc>0.01 then
    //        if ((SummaRecalc>=LoSumma) and (SummaRecalc<=HiSumma)) then
               begin
                    Make_Add(Curr_Add,Curr_Person);
                    Curr_Add^.PERIOD:=M;
                    Curr_Add^.Year:=Y-1990;
                    Curr_Add^.SHIFR:=PerersZaProshlPeriody;;
                    Curr_Add^.Summa:=SummaRecalc;
                    Curr_Add^.Who:=Id_01+M;
                    Curr_Add^.VYPLACHENO:=Get_Out;

               end;

       end;
      function isSamePerson(Curr_Person:Person_Ptr):Boolean;
       var RetVal:Boolean;
           GUID,GUIDP:string;
           ShifrDol,ShifrDolP:Integer;
           ShifrGru,ShifrGruP:Integer;
           ShifrKat,ShifrKatP:Integer;
           Tabno,TabnoP:Integer;
           Koef,KoefP:Real;
           W_R,W_R_P : Integer;
           CN_OSN,CN_OSNP:Integer;
       begin
            RetVal:=false;
            GUID:=pFIBQueryR.FieldByName('GUID').AsString;
            if Length(Trim(GUID))<5 then GUID:='-------';
            GUIDP:=GetGUIDPersonToString(Curr_Person);
            if Length(Trim(GUIDP))<5 then GUIDP:='+++++++';
            if GUIDP=GUID then
               begin
                    RetVal:=True;
                    isSamePerson:=RetVal;
                    Exit;
               end;
            W_R:=pFIBQueryR.FieldByName('W_R').AsInteger;
            if IS_OSN_WID_RABOTY(Curr_Person) then
               W_R_P:=1
            else
               W_R_P:=2;
            CN_OSNP:=GET_SWM_MODE_PERSON(Curr_Person);
            if CN_OSNP<>1 then CN_OSNP:=0;
            CN_OSN:=pFIBQueryR.FieldByName('CN_OSN').AsInteger;

            ShifrDolP:=GET_DOL_CODE(Curr_Person);
            ShifrDol:=pFIBQueryR.FieldByName('ShifrDol').AsInteger;
            Koef:=pFIBQueryR.FieldByName('Koef').AsFloat;
            KoefP:=GET_KOEF_OKLAD_PERSON(Curr_Person);
            ShifrGru:=pFIBQueryR.FieldByName('ShifrGru').AsInteger;
            ShifrGruP:=Curr_Person^.GRUPPA;
            ShifrKat:=pFIBQueryR.FieldByName('ShifrKat').AsInteger;
            ShifrKatP:=Curr_Person^.KATEGORIJA;
            Tabno:=pFIBQueryR.FieldByName('Tabno').AsInteger;
            TabnoP:=Curr_Person^.Tabno;
            if (
                 (ShifrDol=ShifrDolP) and
                 (ShifrGru=ShifrGruP) and
                 (ShifrKat=ShifrKatP) and
                 (Tabno=TabnoP) and
                 (w_r=w_r_p) and
                 (cn_osn=cn_osnp) and
                 (abs(Abs(Koef)-abs(KoefP))<0.01)
                ) then
                RetVal:=True;
            isSamePerson:=RetVal;
       end;
    begin
        i_Musor:=0;
        if pFIBQueryR.FieldByName('TABNO').AsInteger=1788 then
           I_Musor:=1;
//        GUID:=pFIBQueryR.FieldByName('GUID').AsString;
//        if Length(Trim(GUID))<5 then GUID:='-------';
        Curr_Person:=Head_Person;
        while (Curr_Person<>Nil) do
         begin
              if IS_OSN_WID_RABOTY(Curr_Person) then Is_O_W_R := 1
                                                else Is_O_W_R := 0;
     //         if (Curr_Person^.Tabno=1356) and (I_Musor=1) then
              if (Curr_Person^.Tabno=1356) and (pFIBQueryR.FieldByName('TABNO').AsInteger=56) then
                  I_Musor:=1;
              ShifrDol:=Get_Dol_Code(Curr_Person);
              if GruppyList.IsSelected(Curr_Person^.Gruppa) then
              if KategList.IsSelected(Curr_Person^.Kategorija) then
              if Curr_Person^.TABNO = pFIBQueryR.FieldByName('TABNO').AsInteger then
//              if Trim(GUID)=Trim(GetGUIDPersonToString(Curr_Person))
              if isSamePerson(Curr_Person) then                
              if not DejaMoved then
                 begin
                      Make_Prsn;
{
              if Pos(UPPER_STRING(TRIM('ПОВ')),UPPER_STRING(trim(Curr_Person^.Dolg)))=0 then Make_Prsn
                                                                                        else Make_Pov;

}
                      NeedPut:=true;
                      MarkedLine:=true;
                      Break;
                 end;
              Curr_Person:=Curr_Person^.NEXT;
         end;
    end;

 begin
      NeedEmpty := CheckBox1.Checked;
      NeedNotCheckedOnly := CheckBox2.Checked;
      if NeedNotCheckedOnly then
         NeedEmpty := false;
      SavMonth := NMES;
      SavPodr  := NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      Sc:=0;
      if pFIBDataSetR.Active then
         pFIBDataSetR.Close;
      if pFIBDataSetR.Transaction.Active then
         pFIBDataSetR.Transaction.Commit;
      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Label1.Caption:=NAME_SERV(I_NSRV);
                TableName:='TB_RCLC1301';
                case m of
                 1: mn:='Январь';
                 2: mn:='Февраль';
                 3: mn:='Март';
                 9: mn:='Сентябрь';
                end;
                Label1.Caption:=MN+' '+NAME_SERV(I_NSRV);
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                if not NameServList.IsSelected(NSRV) then continue;
                if not pFIBQueryR.Transaction.Active then
                   pFIBQueryR.Transaction.StartTransaction;

                if pFIBQueryR.Open then
                   pFIBQueryR.Close;
                pFIBQueryR.SQL.Clear;
                SQL:='select count(*) from '+TableName+' where w_place='+IntToStr(NSRV)+' and m='+IntToStr(m);
                pFIBQueryR.SQL.Add(SQL);
                try
                   pFIBQueryR.ExecQuery;
                except
                   ShowMessage('Ошибка SQL '+SQL);
                end;
                Rec:=pFIBQueryR.Fields[0].AsInteger;
                if Rec<1 then continue;

                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                NeedPut:=false;
                if NeedEmpty then
                   DeleteAuIdPodr;

                pFIBQueryR.Close;
                pFIBQueryR.SQL.Clear;
                SQL:='select tabno,fio,dolg,koef,shifrgru,w_r,cn_osn,dopl_oklad,';
                SQL:=trim(SQL)+'DOPL_ZW,DOPL_ST,DOPL_VYSL,';
                SQL:=trim(SQL)+'NEW_VYPL_OKLAD,NADB_ZW_PR,NADB_ST_PR,old_oklad,';
                SQL:=trim(SQL)+'kalend_day,work_day,ill_day,otp_day,dopl_zs,nadb_zs_pr,';
                pFIBQueryR.SQL.Add(SQL);

                SQL:=' old_vypl_oklad,new_oklad,kalend_day,otp_day,ill_day,ShifrId,ShifrDol,ShifrKat,';
                SQL:=trim(SQL)+'DOPL_ZAM_DEK,GUID ';
                SQL:=trim(SQL)+' from '+TableName+' where w_place='+IntToStr(NSRV)+' and dopl_oklad is not null and y=2015 and m='+IntToStr(m);

                if NeedNotCheckedOnly then
                     SQL:=trim(SQL)+' and (Moved <> 1 or  Moved is Null)';

                SQL:=trim(SQL)+' order by tabno,w_r,cn_osn desc';
                pFIBQueryR.SQL.Add(SQL);
                try
                    pFIBQueryR.ExecQuery;
                except
                   ShowMessage('Ошибка SQL '+SQL);
                   break;
                end;
                while not pFIBQueryR.EOF do
                   begin
                       Label2.Caption:=trim(pFIBQueryR.FieldByName('FIO').AsString)+' '+trim(pFIBQueryR.FieldByName('DOLG').AsString);
                       Application.ProcessMessages;
                       MarkedLine:=false;

                       MakeLineSql;
                       if MarkedLine then
                          begin
                               if not pFIBQueryW.Transaction.Active then
                                  pFIBQueryW.Transaction.StartTransaction;
                               if pFIBQueryW.Open then
                                  pFIBQueryW.Close;
                               pFIBQueryW.Transaction.COMMIT;
                               pFIBQueryW.SQL.Clear;
                               pFIBQueryW.SQL.Add('update '+TableName+' set moved=1 where shifrid='+IntToStr(pFIBQueryR.FieldByName('SHIFRID').AsInteger));
                               try
                                  if not pFIBQueryW.Transaction.Active then
                                     pFIBQueryW.Transaction.StartTransaction;
                                  pFIBQueryW.ExecQuery;
                               except
                                  ShowMessage('Ошибка SQL обновления записи');
                               end;
                               pFIBQueryW.Close;
                               pFIBQueryW.Transaction.COMMIT;
                          end;
                       pFIBQueryR.Next;
                   end;
                if NeedPut then putinf;
                EMPTY_ALL_PERSON;

          end;
      if pFIBQueryR.Open then
         pFIBQueryR.Close;
      if pFIBQueryR.Transaction.Active then
         pFIBQueryR.Transaction.Commit;
      if pFIBDataSetR.Active then
         pFIBDataSetR.Close;
      if pFIBDataSetR.Transaction.Active then
         pFIBDataSetR.Transaction.Commit;
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);

 end;

 procedure TFormMovRecalc08.MovMonthPochas(M:integer);
 const Id_01=105;
 var SavMonth,I_NSRV,SavPodr:integer;
     Sc,Rec:integer;
     MN,TableName,SQL:string;
     NeedPut:boolean;
     I_Musor:integer;
     ShifrDol:integer;
     Is_O_W_R:integer;
     MarkedLine:boolean;
     Dev:TextFile;
     FName:string;
     S:String;

      procedure DeleteAuIdPodr;
        var Curr_Add:Add_Ptr;
            Finded:boolean;
            C_Person:Person_Ptr;
        begin
             C_Person:=Head_Person;
             while (C_Person<>Nil) do
              begin
                   while true do
                     begin
                          Finded:=false;
                          Curr_Add:=C_Person^.Add;
                          while (Curr_Add<>Nil) do
                            begin
                                if Curr_Add^.Vyplacheno=Get_Out then
                                if Curr_Add^.Who=id_01+m then
                                   begin
                                        Finded:=true;
                                        Del_Add(Curr_Add,C_Person);
                                        NeedPut:=true;
                                        Break;
                                   end;
                                Curr_Add:=Curr_Add^.Next;
                            end;
                          if not finded then Break;
                     end;
                   C_Person:=C_Person^.NEXT;
            end;
        end;


  procedure MakeLineSql;
    var Curr_Person:Person_Ptr;
        Curr_Add:Add_Ptr;
      function DejaMoved:boolean;
       var RetVal:boolean;
           Curr_Add:Add_Ptr;
           A:real;
           S:integer;
       begin
            RetVal:=false;
            Curr_Add:=Curr_Person^.ADD;
            while (Curr_Add<>Nil) do
                  begin
                        if (Curr_Add^.WHO=Id_01+M) and
                           (Curr_Add^.Vyplacheno=GET_OUT) then
                           begin
                                A:=Curr_Add^.Summa;
                                S:=Curr_Add^.Shifr;
                                RetVal:=true;
                                break;
                           end;
                        if (Curr_Add^.Shifr=Pochas_Shifr) and
                           (Curr_Add^.Period=m) then
                           begin
                                A:=Curr_Add^.Summa;
                                S:=Curr_Add^.Shifr;
                                RetVal:=true;
                                break;
                           end;

                        Curr_Add:=Curr_Add^.NEXT;
                  end;
            DejaMoved:=RetVal;
       end;
      procedure Make_Prsn;
       var Curr_Add:Add_Ptr;
           Curr_Cn:Cn_Ptr;
           Finded:boolean;
           Dopl_Oklad:real;
           Y : Integer;
       begin
            Y:=2015;
            if pFIBDataSetRP.Active then
               pFIBDataSetRP.Close;
            pFIBDataSetRP.Params[0].AsInteger:=pFIBQueryR.FieldByName('SHIFRID').AsInteger;
            pFIBDataSetRP.Prepare;
            pFIBDataSetRP.Open;
            while not pFIBDataSetRP.Eof do
              begin
                   if ((pFIBDataSetRPDOPL.Value>LoSumma) and
                       (pFIBDataSetRPDOPL.Value<HiSumma)) then
                      begin
                           Make_Add(Curr_Add,Curr_Person);
                           Curr_Add^.PERIOD:=M;
                           Curr_Add^.Year:=Y-1990;
                           Curr_Add^.SHIFR:=POCHAS_SHIFR;
                           Curr_Add^.Summa:=pFIBDataSetRPDOPL.Value;
                           Curr_Add^.Who:=Id_01+M;
                           Curr_Add^.VYPLACHENO:=Get_Out;
                           Writeln(dev,nsrv:5,curr_person^.tabno:5,Copy(curr_person^.FIO+space(20),1,20),curr_add^.PERIOD:5,curr_add^.summa:12:5);
                      end;
                   pFIBDataSetRP.Next;
              end;
            pFIBDataSetRP.Close;
       end;

      function isSamePerson(Curr_Person:Person_Ptr):Boolean;
       var RetVal:Boolean;
           GUID,GUIDP:string;
           ShifrDol,ShifrDolP:Integer;
           ShifrGru,ShifrGruP:Integer;
           ShifrKat,ShifrKatP:Integer;
           Tabno,TabnoP:Integer;
           Koef,KoefP:Real;
           W_R,W_R_P : Integer;
           CN_OSN,CN_OSNP:Integer;
       begin
            RetVal:=false;
            GUID:=pFIBQueryR.FieldByName('GUID').AsString;
            if Length(Trim(GUID))<5 then GUID:='-------';
            GUIDP:=GetGUIDPersonToString(Curr_Person);
            if Length(Trim(GUIDP))<5 then GUIDP:='+++++++';
            if GUIDP=GUID then
               RetVal:=True;
            isSamePerson:=RetVal;
            isSamePerson:=RetVal;
       end;
    begin
        i_Musor:=0;
        if pFIBQueryR.FieldByName('TABNO').AsInteger=1788 then
           I_Musor:=1;
//        GUID:=pFIBQueryR.FieldByName('GUID').AsString;
//        if Length(Trim(GUID))<5 then GUID:='-------';
        Curr_Person:=Head_Person;
        while (Curr_Person<>Nil) do
         begin
              if (Curr_Person^.Tabno=2026) and (pFIBQueryR.FieldByName('TABNO').AsInteger=2026) then
                  I_Musor:=1;
              ShifrDol:=Get_Dol_Code(Curr_Person);
              if GruppyList.IsSelected(Curr_Person^.Gruppa) then
              if KategList.IsSelected(Curr_Person^.Kategorija) then
              if Curr_Person^.TABNO = pFIBQueryR.FieldByName('TABNO').AsInteger then
              if isSamePerson(Curr_Person) then
              if not DejaMoved then
                 begin
                      Make_Prsn;
                      NeedPut:=true;
                      MarkedLine:=true;
                      Break;
                 end;
              Curr_Person:=Curr_Person^.NEXT;
         end;
    end;

 begin
      NeedEmpty := CheckBox1.Checked;
      NeedNotCheckedOnly := CheckBox2.Checked;
      if NeedNotCheckedOnly then
         NeedEmpty := false;
      SavMonth := NMES;
      SavPodr  := NSRV;
      FName:=cdoc+'logclo'+IntToStr(m)+'.txt';
      AssignFile(Dev,FName);
      ReWrite(Dev);
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      Sc:=0;
      if pFIBDataSetRP.Active then
         pFIBDataSetRP.Close;
      if pFIBDataSetRP.Transaction.Active then
         pFIBDataSetRP.Transaction.Commit;
      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Label1.Caption:=NAME_SERV(I_NSRV);
                TableName:='TB_RCLCPOCHAS1301';
                case m of
                 1: mn:='Январь';
                 2: mn:='Февраль';
                 3: mn:='Март';
                end;
                Label1.Caption:=MN+' '+NAME_SERV(I_NSRV);
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                if not NameServList.IsSelected(NSRV) then continue;
                if not pFIBQueryR.Transaction.Active then
                   pFIBQueryR.Transaction.StartTransaction;

                if pFIBQueryR.Open then
                   pFIBQueryR.Close;
                pFIBQueryR.SQL.Clear;
                SQL:='select count(*) from '+TableName+' where shifrpod='+IntToStr(NSRV)+' and m='+IntToStr(m);
                pFIBQueryR.SQL.Add(SQL);
                try
                   pFIBQueryR.ExecQuery;
                except
                   ShowMessage('Ошибка SQL '+SQL);
                end;
                Rec:=pFIBQueryR.Fields[0].AsInteger;
                if Rec<1 then continue;

                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                NeedPut:=false;
                if NeedEmpty then
                   DeleteAuIdPodr;

                pFIBQueryR.Close;
                pFIBQueryR.SQL.Clear;
                SQL:='select tabno,fio,dolg,ShifrId,ShifrDol,GUID from '+TableName+' where shifrpod='+IntToStr(NSRV)+' and y=2015 and m='+IntToStr(m);

                if NeedNotCheckedOnly then
                     SQL:=trim(SQL)+' and (Moved <> 1 or  Moved is Null)';

                SQL:=trim(SQL)+' order by tabno';
                pFIBQueryR.SQL.Add(SQL);
                try
                    pFIBQueryR.ExecQuery;
                except
                   ShowMessage('Ошибка SQL '+SQL);
                   break;
                end;
                while not pFIBQueryR.EOF do
                   begin
                       Label2.Caption:=trim(pFIBQueryR.FieldByName('FIO').AsString)+' '+trim(pFIBQueryR.FieldByName('DOLG').AsString);
                       Application.ProcessMessages;
                       MarkedLine:=false;

                       MakeLineSql;
                       if MarkedLine then
                          begin
                               if not pFIBQueryW.Transaction.Active then
                                  pFIBQueryW.Transaction.StartTransaction;
                               if pFIBQueryW.Open then
                                  pFIBQueryW.Close;
                               pFIBQueryW.Transaction.COMMIT;
                               pFIBQueryW.SQL.Clear;
                               pFIBQueryW.SQL.Add('update '+TableName+' set moved=1 where shifrid='+IntToStr(pFIBQueryR.FieldByName('SHIFRID').AsInteger));
                               try
                                  if not pFIBQueryW.Transaction.Active then
                                     pFIBQueryW.Transaction.StartTransaction;
                                  pFIBQueryW.ExecQuery;
                               except
                                  ShowMessage('Ошибка SQL обновления записи');
                               end;
                               pFIBQueryW.Close;
                               pFIBQueryW.Transaction.COMMIT;
                          end;
                       pFIBQueryR.Next;
                   end;
                if NeedPut then putinf;
                EMPTY_ALL_PERSON;

          end;
      CloseFile(Dev);    
      if pFIBQueryR.Open then
         pFIBQueryR.Close;
      if pFIBQueryR.Transaction.Active then
         pFIBQueryR.Transaction.Commit;
      if pFIBDataSetRP.Active then
         pFIBDataSetRP.Close;
      if pFIBDataSetRP.Transaction.Active then
         pFIBDataSetRP.Transaction.Commit;
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);

 end;



procedure TFormMovRecalc08.MovMonthInd(M:integer);
 const Id_01=100;
 var SavMonth,I_NSRV,SavPodr:integer;
     Sc,Rec:integer;
     MN,TableName,SQL:string;
     NeedPut:boolean;
     I_Musor:integer;
     Is_O_W_R:integer;
     MarkedLine:boolean;

      procedure DeleteAuIdPodr;
        var Curr_Add:Add_Ptr;
            Finded:boolean;
            C_Person:Person_Ptr;
        begin
             C_Person:=Head_Person;
             while (C_Person<>Nil) do
              begin
             while true do
              begin
                   Finded:=false;
                   Curr_Add:=C_Person^.Add;
                   while (Curr_Add<>Nil) do
                     begin
                          if Curr_Add^.Vyplacheno=Get_Out then
                          if Curr_Add^.Who=id_01+m then
                             begin
                                   Finded:=true;
                                   Del_Add(Curr_Add,C_Person);
                                   NeedPut:=true;
                                   Break;
                             end;
                          Curr_Add:=Curr_Add^.Next;
                      end;
                   if not finded then Break;
              end;
              C_Person:=C_Person^.NEXT;
            end;
        end;


  procedure MakeLineSql;
    var Curr_Person:Person_Ptr;
        Curr_Add:Add_Ptr;
      function DejaMoved:boolean;
       var RetVal:boolean;
           Curr_Add:Add_Ptr;
           A:real;
           S:integer;
       begin
            RetVal:=false;
            Curr_Add:=Curr_Person^.ADD;
            while (Curr_Add<>Nil) do
                  begin
                        if (Curr_Add^.WHO=Id_01+M) and
                           (Curr_Add^.Vyplacheno=GET_OUT) then
                           begin
                                A:=Curr_Add^.Summa;
                                S:=Curr_Add^.Shifr;
                                RetVal:=true;
                                break;
                           end;
                        Curr_Add:=Curr_Add^.NEXT;
                  end;
            DejaMoved:=RetVal;
       end;
      procedure Make_Prsn;
       var Curr_Add:Add_Ptr;
           Finded:boolean;
           DoplInd:real;
       begin
            Doplind := pFIBQueryR.FieldByName('DOPLIND').AsFloat;
            if not ((DoplInd>=LoSumma) and (DoplInd<=HiSumma)) then
               Exit;
            if abs(pFIBQueryR.FieldByName('DOPLIND').AsFloat)>0.01 then
               begin
                    Make_Add(Curr_Add,Curr_Person);
                    Curr_Add^.PERIOD:=M;
                    Curr_Add^.Year:=2010-1990;
                    Curr_Add^.SHIFR:=28;
                    Curr_Add^.Summa:=pFIBQueryR.FieldByName('DOPLIND').AsFloat;
                    Curr_Add^.Who:=Id_01+M;
                    Curr_Add^.VYPLACHENO:=Get_Out;
               end;

       end;
    begin
        i_Musor:=0;
        if pFIBQueryR.FieldByName('TABNO').AsInteger=1788 then
           I_Musor:=1;

        Curr_Person:=Head_Person;
        while (Curr_Person<>Nil) do
         begin
              if IS_OSN_WID_RABOTY(Curr_Person) then Is_O_W_R := 1
                                                else Is_O_W_R := 0;
              if (Curr_Person^.Tabno=1788) and (I_Musor=1) then
                  I_Musor:=1;
              if GruppyList.IsSelected(Curr_Person^.Gruppa) then
              if KategList.IsSelected(Curr_Person^.Kategorija) then
              if pos('ПОВ',Upper_String(Curr_Person^.Dolg)) = 0 then
              if pos('ПІД',Upper_String(Curr_Person^.Dolg)) = 0 then
              if Curr_Person^.TABNO = pFIBQueryR.FieldByName('TABNO').AsInteger then
       //       if ((NeedNotCheckedOnly) or (not NeedNotCheckedOnly) and (trim(Curr_Person^.DOLG) = trim(pFIBQueryR.FieldByName('DOLG').AsString))) then
              if Curr_Person^.GRUPPA = pFIBQueryR.FieldByName('SHIFRGRU').AsInteger then
              if Curr_Person^.Wid_Raboty = pFIBQueryR.FieldByName('W_R').AsInteger then
              if GET_DOL_CODE(Curr_Person) = pFIBQueryR.FieldByName('SHIFRDOL').AsInteger then
              if ((Curr_Person^.Wid_Raboty = 2) and
                  (
                    (
                      (pFIBQueryR.FieldByName('CN_OSN').AsInteger=1) and (Is_O_W_R=1)
                    ) or
                    (
                      (pFIBQueryR.FieldByName('CN_OSN').AsInteger=0) and (Is_O_W_R=0)
                    )
                 ) or
                  (Curr_Person^.Wid_Raboty = 1)) then
              if not DejaMoved then
                 begin
                      Make_Prsn;
{
              if Pos(UPPER_STRING(TRIM('ПОВ')),UPPER_STRING(trim(Curr_Person^.Dolg)))=0 then Make_Prsn
                                                                                        else Make_Pov;

}
                      NeedPut:=true;
                      MarkedLine:=true;
                      Break;
                 end;
              Curr_Person:=Curr_Person^.NEXT;
         end;
    end;

 begin
      NeedEmpty := CheckBox1.Checked;
      NeedNotCheckedOnly := CheckBox2.Checked;
      if NeedNotCheckedOnly then
         NeedEmpty := false;
      SavMonth := NMES;
      SavPodr  := NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      Sc:=0;
      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Label1.Caption:=NAME_SERV(I_NSRV);
                TableName:='rclcind0110';
                case m of
                 1: mn:='Январь';
                 2: mn:='Февраль';
                 3: mn:='Март';
                 4: mn:='Апрель';
                 5: mn:='Май';
                end;
                Label1.Caption:=MN+' '+NAME_SERV(I_NSRV);
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                if not NameServList.IsSelected(NSRV) then continue;
                if not pFIBQueryR.Transaction.Active then
                   pFIBQueryR.Transaction.StartTransaction;

                if pFIBQueryR.Open then
                   pFIBQueryR.Close;
                pFIBQueryR.SQL.Clear;
                SQL:='select count(*) from '+TableName+' where w_place='+IntToStr(NSRV)+' and m='+IntToStr(m);
                pFIBQueryR.SQL.Add(SQL);
                try
                   pFIBQueryR.ExecQuery;
                except
                   ShowMessage('Ошибка SQL '+SQL);
                end;
                Rec:=pFIBQueryR.Fields[0].AsInteger;
                if Rec<1 then continue;

                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                NeedPut:=false;
                if NeedEmpty then
                   DeleteAuIdPodr;

                pFIBQueryR.Close;
                pFIBQueryR.SQL.Clear;
                SQL:='select tabno,fio,dolg,koef,shifrgru,w_r,cn_osn,doplind,';
                SQL:=trim(SQL)+'shifrdol,';
                SQL:=trim(SQL)+'kalend_day,work_day,ill_day,otp_day';
                pFIBQueryR.SQL.Add(SQL);

                SQL:=' ,ShifrId';
                SQL:=trim(SQL)+' from '+TableName+' where w_place='+IntToStr(NSRV)+' and doplind is not null and y=2010 and m='+IntToStr(m);

                if NeedNotCheckedOnly then
                     SQL:=trim(SQL)+' and (Moved <> 1 or  Moved is Null)';

                SQL:=trim(SQL)+' order by tabno,w_r,cn_osn desc';
                pFIBQueryR.SQL.Add(SQL);
                try
                    pFIBQueryR.ExecQuery;
                except
                   ShowMessage('Ошибка SQL '+SQL);
                   break;
                end;
                while not pFIBQueryR.EOF do
                   begin
                       Label2.Caption:=trim(pFIBQueryR.FieldByName('FIO').AsString)+' '+trim(pFIBQueryR.FieldByName('DOLG').AsString);
                       Application.ProcessMessages;
                       MarkedLine:=false;

                       MakeLineSql;
                       if MarkedLine then
                          begin
                               if not pFIBQueryW.Transaction.Active then
                                  pFIBQueryW.Transaction.StartTransaction;
                               if pFIBQueryW.Open then
                                  pFIBQueryW.Close;
                               pFIBQueryW.Transaction.COMMIT;
                               pFIBQueryW.SQL.Clear;
                               pFIBQueryW.SQL.Add('update '+TableName+' set moved=1 where shifrid='+IntToStr(pFIBQueryR.FieldByName('SHIFRID').AsInteger));
                               try
                                  if not pFIBQueryW.Transaction.Active then
                                     pFIBQueryW.Transaction.StartTransaction;
                                  pFIBQueryW.ExecQuery;
                               except
                                  ShowMessage('Ошибка SQL обновления записи');
                               end;
                               pFIBQueryW.Close;
                               pFIBQueryW.Transaction.COMMIT;
                          end;
                       pFIBQueryR.Next;
                   end;
                if NeedPut then putinf;
                EMPTY_ALL_PERSON;

          end;
      if pFIBQueryR.Open then
         pFIBQueryR.Close;
      if pFIBQueryR.Transaction.Active then
         pFIBQueryR.Transaction.Commit;
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);

 end;


procedure TFormMovRecalc08.BitBtn3Click(Sender: TObject);
begin
{
    Application.CreateForm(TFormSelPodr, FormSelPodr);
    FormSelPodr.ShowModal;
}
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;


end;

procedure TFormMovRecalc08.BitBtn4Click(Sender: TObject);
var Dev:TextFile;
    FName:string;
    tabno:integer;
begin
    fname:='t_k.sql';
    AssignFile(dev,fname);
    Reset(Dev);
    pFIBQueryW.Transaction.StartTransaction;
    if pFIBQueryW.Open then
       pFIBQueryW.Close;
    pFIBQueryW.SQL.Clear;
    pFIBQueryW.SQL.Add('delete from tb_tabno_krim');
    pFIBQueryW.ExecQuery;
    while not eof(Dev) do
      begin
           Readln(Dev,Tabno);
           if pFIBQueryW.Open then
              pFIBQueryW.Close;
           pFIBQueryW.SQL.Clear;
           pFIBQueryW.SQL.Add('insert into tb_tabno_krim (tabno) values('+IntToStr(Tabno)+')');
           pFIBQueryW.ExecQuery;
      end;
    CloseFile(Dev);
    if pFIBQueryW.Open then
       pFIBQueryW.Close;
    pFIBQueryW.Transaction.COMMIT;
end;

procedure TFormMovRecalc08.BitBtn5Click;
 const Id_01=117;
 var SavMonth,I_NSRV,SavPodr  : integer;
     Sc,Rec                   : integer;
     MN,TableName,SQL         : string;
     NeedPut                  : boolean;
     I_Musor                  : integer;
     Is_O_W_R                 : integer;
     Curr_Person              : Person_Ptr;
     Curr_Add                 : Add_Ptr;
     Curr_Cn                  : Cn_Ptr;
     Proc_St,Proc_Zw          : real;
     SummaOkl,SummaZw,SummaSt : real;

 function IsStepenOnlyAdd:boolean;
   var Curr_Add:Add_Ptr;
       RetVal:boolean;
       IsSt,IsZw:boolean;
   begin
       RetVal:=false;
       IsSt:=false;
       IsZw:=false;
       Curr_Add:=Curr_Person^.ADD;
       while (Curr_Add<>Nil) do
        begin
             if Curr_Add^.Period<4 then
                begin
             if Curr_Add^.Shifr=Za_Step_Shifr then
                IsSt:=true;
             if Curr_Add^.Shifr=Za_Zwan_Shifr then
                IsZw:=true;
                end;
             Curr_Add:=Curr_Add^.NEXT;
        end;
       if (IsSt) and (not IsZw) then
          RetVal:=true;
       IsStepenOnlyAdd:=RetVal;
   end;

 function IsZwanOnlyAdd:boolean;
   var Curr_Add:Add_Ptr;
       RetVal:boolean;
       IsSt,IsZw:boolean;
   begin
       RetVal:=false;
       IsSt:=false;
       IsZw:=false;
       Curr_Add:=Curr_Person^.ADD;
       while (Curr_Add<>Nil) do
        begin
             if Curr_Add^.Period<4 then
                begin
             if Curr_Add^.Shifr=Za_Step_Shifr then
                IsSt:=true;
             if Curr_Add^.Shifr=Za_Zwan_Shifr then
                IsZw:=true;
                end;
             Curr_Add:=Curr_Add^.NEXT;
        end;
       if (not IsSt) and (IsZw) then
          RetVal:=true;
       IsZwanOnlyAdd:=RetVal;
   end;

 function IsStepenOnlyCn:boolean;
   var Curr_Cn:Cn_Ptr;
       RetVal:boolean;
       IsSt,IsZw:boolean;
   begin
       RetVal:=false;
       IsSt:=false;
       IsZw:=false;
       Curr_Cn:=Curr_Person^.Cn;
       while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn^.Shifr=Za_Step_Shifr then
                IsSt:=true;
             if Curr_Cn^.Shifr=Za_Zwan_Shifr then
                IsZw:=true;
             Curr_Cn:=Curr_Cn^.NEXT;
        end;
       if (IsSt) and (not IsZw) then
          RetVal:=true;
       IsStepenOnlyCn:=RetVal;
   end;

 function IsZwanOnlyCn:boolean;
   var Curr_Cn:Cn_Ptr;
       RetVal:boolean;
       IsSt,IsZw:boolean;
   begin
       RetVal:=false;
       IsSt:=false;
       IsZw:=false;
       Curr_Cn:=Curr_Person^.Cn;
       while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn^.Shifr=Za_Step_Shifr then
                IsSt:=true;
             if Curr_Cn^.Shifr=Za_Zwan_Shifr then
                IsZw:=true;
             Curr_Cn:=Curr_Cn^.NEXT;
        end;
       if (not IsSt) and (IsZw) then
          RetVal:=true;
       IsZwanOnlyCn:=RetVal;
   end;

 procedure ChangeZwanToStep;
  var Curr_Cn  : Cn_Ptr;
      Curr_Add : Add_Ptr;
      Proc_St  : real;
      Summa_St : real;
  begin
       Proc_St  := 0;
       Summa_St := 0;
       Curr_Cn:=Curr_Person^.Cn;
       while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn^.Shifr=Za_Zwan_Shifr then
                begin
                     Curr_Cn^.Shifr:=Za_Step_Shifr;
{
                     if abs(Curr_Cn^.SUMMA-33)<0.01 then
                        Curr_Cn^.SUMMA := 25
                     else if abs(Curr_Cn^.SUMMA-25)<0.01 then
                        Curr_Cn^.SUMMA := 18;
}                        
                     Proc_St := Curr_Cn^.SUMMA;
                     break;
                end;
             Curr_Cn:=Curr_Cn^.NEXT;
        end;
       Summa_St := 0 ;
       Curr_Add := Curr_Person^.ADD;
       while (Curr_Add<>NIl) do
         begin
              if Curr_Add^.Shifr=za_Zwan_shifr then
              if Curr_Add^.Period=4 then
                 Summa_St:=Curr_Add^.Summa;
              Curr_Add:=Curr_Add^.NEXT;
         end;
       if (abs(Summa_St)>0.01) and (abs(Proc_ST)>0.01) then
         begin
               Summa_St:=0;
               Curr_Add := Curr_Person^.ADD;
               while (Curr_Add<>NIl) do
                 begin
                      if Curr_Add^.Shifr=Oklad_Shifr then
                      if Curr_Add^.Period=4 then
                         Summa_St:=Curr_Add^.Summa;
                     Curr_Add:=Curr_Add^.NEXT;
                 end;
              Curr_Add:=Curr_Person^.ADD;
              while (Curr_Add<>NIl) do
                begin
                     if Curr_Add^.Shifr=za_Zwan_shifr then
                     if Curr_Add^.Period=4 then
                        begin
                             Curr_Add^.Summa := Sum(Summa_St*Proc_St / 100);
                             Curr_Add^.SHIFR := za_step_shifr;
                             break;
                        end;
                     Curr_Add:=Curr_Add^.NEXT;
                end;
         end
  end;
 procedure ChangeStepenToZwan;
  var Curr_Cn  : Cn_Ptr;
      Curr_Add : Add_Ptr;
      Proc_Zw  : real;
      Summa_Zw : real;
  begin
       Proc_Zw  := 0;
       Summa_Zw := 0;
       Curr_Cn:=Curr_Person^.Cn;
       while (Curr_Cn<>Nil) do
        begin
             if Curr_Cn^.Shifr=Za_Step_Shifr then
                begin
                     Curr_Cn^.Shifr:=Za_Zwan_Shifr;
{
                     if abs(Curr_Cn^.SUMMA-25)<0.01 then
                        Curr_Cn^.SUMMA := 33
                     else if abs(Curr_Cn^.SUMMA-18)<0.01 then
                        Curr_Cn^.SUMMA := 25;
}
                     Proc_Zw := Curr_Cn^.SUMMA;
                     break;
                end;
             Curr_Cn:=Curr_Cn^.NEXT;
        end;
       Summa_Zw := 0 ;
       Curr_Add := Curr_Person^.ADD;
       while (Curr_Add<>NIl) do
         begin
              if Curr_Add^.Shifr=za_Step_shifr then
              if Curr_Add^.Period=4 then
                 Summa_Zw:=Curr_Add^.Summa;
              Curr_Add:=Curr_Add^.NEXT;
         end;
       if (abs(Summa_Zw)>0.01) and (abs(Proc_Zw)>0.01) then
         begin
               Summa_Zw:=0;
               Curr_Add := Curr_Person^.ADD;
               while (Curr_Add<>NIl) do
                 begin
                      if Curr_Add^.Shifr=Oklad_Shifr then
                      if Curr_Add^.Period=4 then
                         Summa_Zw:=Curr_Add^.Summa;
                     Curr_Add:=Curr_Add^.NEXT;
                 end;
              Curr_Add:=Curr_Person^.ADD;
              while (Curr_Add<>NIl) do
                begin
                     if Curr_Add^.Shifr=za_step_shifr then
                     if Curr_Add^.Period=4 then
                        begin
                             Curr_Add^.Summa := Sum(Summa_Zw*Proc_Zw / 100);
                             Curr_Add^.SHIFR := za_Zwan_shifr;
                             break;
                        end;
                     Curr_Add:=Curr_Add^.NEXT;
                end;
         end

  end;

begin
      if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

      SavMonth := NMES;
      SavPodr  := NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max      := Count_Serv;
      ProgressBar1.Min      := 0;
      ProgressBar1.Position := 0;
      Sc                    := 0;
      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Label1.Caption:=NAME_SERV(I_NSRV);
                if not NameServList.IsSelected(NSRV) then continue;
                if I_NSRV  in [56,57,58,169,170,171,172,173] then continue;
                Application.ProcessMessages;
                MKFLNM;
                if not FileExists(FNINF) then continue;
                GetInf(true);
                Curr_Person:=Head_Person;
                while (Curr_Person<>Nil) do
                 begin
                      if (pos('ПОВ',trim(Upper_String(Curr_Person^.DOLG)))=1) and
                         (Curr_Person^.Kategorija=1) then
                         begin
                              if (Curr_Person^.Tabno=907) then
                                  Curr_Person^.Tabno:=907;
                              if IsStepenOnlyAdd and IsZwanOnlyCn then
                                 ChangeZwanToStep
                              else if IsZwanOnlyAdd and IsStepenOnlyCn then
                                 ChangeStepenToZwan
                              else
                                  begin
                              Curr_Cn:=Curr_Person^.Cn;
                              Proc_Zw := 0;
                              Proc_St := 0;

                              while (Curr_Cn<>Nil) do
                                begin
                                     if Curr_Cn^.Shifr=za_zwan_shifr then
                                        begin
                                             if abs(Curr_Cn^.Summa-15.00)<0.01 then
                                                begin
                                                     Curr_Cn^.Summa := 25.00;
                                                     Proc_Zw        := 25.00;
                                                end
                                             else if abs(Curr_Cn^.Summa-25.00)<0.01 then
                                                begin
                                                     Curr_Cn^.Summa := 33.00;
                                                     Proc_Zw        := 33.00;
                                                end
                                        end;
                                     if Curr_Cn^.Shifr=za_step_shifr then
                                        begin
                                             if abs(Curr_Cn^.Summa-33.00)<0.01 then
                                                begin
                                                     Curr_Cn^.Summa := 25.00;
                                                     Proc_St        := 25.00;
                                                end
                                             else if abs(Curr_Cn^.Summa-25.00)<0.01 then
                                                begin
                                                     Curr_Cn^.Summa := 15.00;
                                                     Proc_St        := 15.00;
                                                end
                                        end;
                                     Curr_Cn:=Curr_Cn^.Next;
                                end;
                             if (abs(Proc_Zw)>0.01) and (abs(Proc_St)>0.01) then
                                begin
                                     SummaSt := 0 ;
                                     SummaZw := 0 ;
                                     Curr_Add := Curr_Person^.ADD;
                                     while (Curr_Add<>NIl) do
                                      begin
                                           if Curr_Add^.Shifr=za_Zwan_shifr then
                                           if Curr_Add^.Period=4 then
                                              SummaZw:=Curr_Add^.Summa;
                                           if Curr_Add^.Shifr=za_step_shifr then
                                           if Curr_Add^.Period=4 then
                                              SummaSt:=Curr_Add^.Summa;
                                           Curr_Add:=Curr_Add^.NEXT;
                                      end;
                                     if (abs(SummaZw)>0.01) and (abs(SummaSt)>0.01) then
                                        begin
                                             Curr_Add:=Curr_Person^.ADD;
                                             while (Curr_Add<>NIl) do
                                                    begin
                                                          if Curr_Add^.Shifr=za_Zwan_shifr then
                                                          if Curr_Add^.Period=4 then
                                                              Curr_Add^.Summa:=SummaSt;
                                                          if Curr_Add^.Shifr=za_step_shifr then
                                                          if Curr_Add^.Period=4 then
                                                             Curr_Add^.Summa:=SummaZw;
                                                          Curr_Add:=Curr_Add^.NEXT;
                                                     end;

                                        end
                                end
                             else
                                begin
                             SummaOkl := 0;
                             Curr_Add := Curr_Person^.Add;
                             while (Curr_Add <> Nil) do
                               begin
                                    if Curr_Add^.Shifr=oklad_Shifr then
                                    if Curr_Add^.Period=4 then
                                       SummaOkl:=SummaOkl + Curr_Add^.Summa;
                                    Curr_Add:=Curr_Add^.Next;
                               end;
                             if abs(SummaOkl)>0.01 then
                                begin
                                     if (Proc_Zw>10) then
                                        begin
                                             Curr_Add:=Curr_Person^.Add;
                                             while (Curr_Add<>Nil) do
                                                   begin
                                                        if Curr_Add^.Shifr=za_zwan_shifr then
                                                        if Curr_Add^.Period=4 then
                                                           begin
                                                                Curr_Add^.Summa := sum(SummaOkl*Proc_Zw/100);
                                                                break;
                                                           end;
                                                        Curr_Add:=Curr_Add^.Next;
                                                   end
                                        end;
                                     if (Proc_St>10) then
                                        begin
                                             Curr_Add:=Curr_Person^.Add;
                                             while (Curr_Add<>Nil) do
                                                   begin
                                                        if Curr_Add^.Shifr=za_step_shifr then
                                                        if Curr_Add^.Period=4 then
                                                           begin
                                                                Curr_Add^.Summa := sum(SummaOkl*Proc_St/100);
                                                                break;
                                                           end;
                                                        Curr_Add:=Curr_Add^.Next;
                                                   end
                                        end;
                                end;
                                end;
                               end; {Конец блока Is ... only ...}
                         end;
                      Curr_Person:=Curr_Person^.Next;
                 end;
                PutInf;
                EMPTY_ALL_PERSON;
          end;
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);
end;

procedure TFormMovRecalc08.FormCreate(Sender: TObject);
begin
     NeedEmpty          := false;
     NeedNotCheckedOnly := false;
     HiSumma            := 200;
     LoSumma            := 0;
     dxCalcEditLoSumma.Text := format('%10.2f',[LoSumma]);
     dxCalcEditHiSumma.Text := format('%10.2f',[HiSumma]);
end;



procedure TFormMovRecalc08.BitBtn6Click(Sender: TObject);
 var SavMonth,SavPodr,SC,I_NSRV:integer;
     NeedPut:Boolean;
     Curr_Person:Person_Ptr;
     Curr_Add:Add_Ptr;
begin
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

      SavMonth := NMES;
      SavPodr  := NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      Sc:=0;
      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Label1.Caption:=NAME_SERV(I_NSRV);
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                if not NameServList.IsSelected(NSRV) then continue;
                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                NeedPut:=false;
                Curr_Person:=Head_Person;
                while (Curr_Person<>NIl) do
                  begin
{                       IF GetRazrjadPerson(cURR_pERSON)=17 THEN}
                       IF GetRazrjadPerson(cURR_pERSON)=23 THEN
                          BEGIN
                               Curr_Add:=Curr_Person^.Add;
                               while (Curr_Add<>Nil) do
                                 begin
                                      if (((Curr_Add^.Shifr=1) or (Curr_Add^.Shifr=8)
                                                               or (Curr_Add^.Shifr=17)
                                                               or (Curr_Add^.Shifr=18)
                                                               or (Curr_Add^.Shifr=22)) and
                                         (Curr_Add^.Period>0) and (Curr_Add^.Period<5) and (Curr_Add^.Who=117+Curr_Add^.Period)) then
                                         begin
                                              if Curr_Add^.Period<4 then
                                                 Curr_Add^.Summa:=Sum(Curr_Add^.Summa*42/113)
                                              else
                                                 Curr_Add^.Summa:=Sum(Curr_Add^.Summa*91/164);
{ для 17 разряда                                 Curr_Add^.Summa:=Sum(Curr_Add^.Summa*1.5);}
                                              NeedPut:=true;
                                         end;
                                      Curr_Add:=Curr_Add^.Next;
                                 end;
                          END;
                       Curr_Person:=Curr_pERSON^.nEXT;
                  end;
                if NeedPut then putinf;
                EMPTY_ALL_PERSON;

          end;
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);


end;

procedure TFormMovRecalc08.BitBtn7Click(Sender: TObject);
 var SavMonth,SavPodr,SC,I_NSRV,i:integer;
     NeedPut:Boolean;
     Curr_Person:Person_Ptr;
     Curr_Add:Add_Ptr;
     Z:array[1..4] of boolean;
begin
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

      SavMonth := NMES;
      SavPodr  := NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      Sc:=0;
      for I_NSRV:=1 to Count_Serv do
          begin
                Inc(Sc);
                NSRV:=I_NSRV;
                ProgressBar1.Position:=Sc;
                Label1.Caption:=NAME_SERV(I_NSRV);
                Application.ProcessMessages;
                NSRV:=I_NSRV;
                if not NameServList.IsSelected(NSRV) then continue;
                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                NeedPut:=false;
                Curr_Person:=Head_Person;
                while (Curr_Person<>NIl) do
                  begin
{                       IF GetRazrjadPerson(cURR_pERSON)=17 THEN}
                       IF (((GetRazrjadPerson(cURR_pERSON)=22) and (GET_DOL_CODE(CURR_PERSON)=605)) or
                           ((GetRazrjadPerson(cURR_pERSON)=20) and (GET_DOL_CODE(CURR_PERSON)=1424)))  THEN
                          BEGIN
                               for i:=1 to 4 do z[i]:=false;
                               Curr_Add:=Curr_Person^.Add;
                               while (Curr_Add<>Nil) do
                                 begin
                                      if (((Curr_Add^.Shifr=1) or (Curr_Add^.Shifr=8)
                                                               or (Curr_Add^.Shifr=17)
                                                               or (Curr_Add^.Shifr=18)
                                                               or (Curr_Add^.Shifr=22)) and
                                         (Curr_Add^.Period>0) and (Curr_Add^.Period<5) and (Curr_Add^.Who=117+Curr_Add^.Period)) then
                                         begin
                                              if (GetRazrjadPerson(cURR_pERSON)=22) then
                                              if Curr_Add^.Period<4 then
                                                 Curr_Add^.Summa:=Sum(Curr_Add^.Summa*40/115)
                                              else
                                                 Curr_Add^.Summa:=Sum(Curr_Add^.Summa*87/164)
                                               else
                                              if Curr_Add^.Period<4 then
                                                 begin
                                                      Curr_Add^.Summa:=38;
                                                      z[Curr_Add^.Period]:=true;
                                                 end
                                              else
                                                 begin
                                                      Curr_Add^.Summa:=83;
                                                      z[Curr_Add^.Period]:=true;
                                                 end;

                                              NeedPut:=true;
                                         end;
                                      Curr_Add:=Curr_Add^.Next;
                                 end;
                            if ((GetRazrjadPerson(cURR_pERSON)=20) and (z[4]=true)) then
                               begin
                                     for i:=1 to 3 do
                                       if not z[i] then
                                          begin
                    Make_Add(Curr_Add,Curr_Person);
                    Curr_Add^.PERIOD:=i;
                    Curr_Add^.Year:=2010-1990;
                    Curr_Add^.SHIFR:=OKLAD_SHIFR;
                    Curr_Add^.Summa:=38;
                    Curr_Add^.Who:=117+i;
                    Curr_Add^.VYPLACHENO:=Get_Out;

                                          end;
                               end;

                          END;
                       Curr_Person:=Curr_pERSON^.nEXT;
                  end;
                if NeedPut then putinf;
                EMPTY_ALL_PERSON;

          end;
      NMES     := SavMonth;
      NSRV     := SavPodr;
      MKFLNM;
      GETINF(TRUE);


end;

procedure TFormMovRecalc08.Button1Click(Sender: TObject);
 var a : real;
     i : integer;
begin
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

      dxCalcEditLoSumma.Text:=ReplChar(dxCalcEditLoSumma.Text,',','.');

      val(dxCalcEditLoSumma.Text,a,i);
      if i=0 then
         LoSumma:=a
      else
         begin
              ShowMessage('Неверно задано нижняя граница переноса');
              Exit;
         end;
    //  if LoSumma<0 then
    //     begin
    //          ShowMessage('Неверно задано нижняя граница переноса');
    //          Exit;
    //     end;
      dxCalcEditHiSumma.Text:=ReplChar(dxCalcEditHiSumma.Text,',','.');
      val(dxCalcEditHiSumma.Text,a,i);
      if i=0 then
         HiSumma:=a
      else
         begin
              ShowMessage('Неверно задано верхняя граница переноса');
              Exit;
         end;
      if HiSumma<0 then
         begin
              ShowMessage('Неверно задано верхняя граница переноса');
              Exit;
         end;
      if HiSumma<=LoSumma then
         begin
              ShowMessage('Нижняя граница переноса больше или равноа верхней границе');
              Exit;
         end;
      NeedNotCheckedOnly := CheckBox2.Checked;
  //    MovMonthInd(1);
  //    MovMonthInd(2);
      MovMonthInd(3);
      MovMonthInd(4);
      MovMonthInd(5);

end;

procedure TFormMovRecalc08.BitBtn8Click(Sender: TObject);
var a:real;
    i:integer;
begin
      if not ((NMES=4) and (WORK_YEAR_VAL=2015)) then
         begin
              ShowMessage('Перенос перерасчета почасовки возможен только в апреле 2015 г.');
              Exit;
         end;
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

      dxCalcEditLoSumma.Text:=ReplChar(dxCalcEditLoSumma.Text,',','.');

      val(dxCalcEditLoSumma.Text,a,i);
      if i=0 then
         LoSumma:=a
      else
         begin
              ShowMessage('Неверно задано нижняя граница переноса');
              Exit;
         end;
      if LoSumma<0 then
         begin
              ShowMessage('Неверно задано нижняя граница переноса');
              Exit;
         end;
      dxCalcEditHiSumma.Text:=ReplChar(dxCalcEditHiSumma.Text,',','.');
      val(dxCalcEditHiSumma.Text,a,i);
      if i=0 then
         HiSumma:=a
      else
         begin
              ShowMessage('Неверно задано верхняя граница переноса');
              Exit;
         end;
      if HiSumma<0 then
         begin
              ShowMessage('Неверно задано верхняя граница переноса');
              Exit;
         end;
      if HiSumma<=LoSumma then
         begin
              ShowMessage('Нижняя граница переноса больше или равноа верхней границе');
              Exit;
         end;
      NeedNotCheckedOnly :=CheckBox2.Checked;
//      MovMonth(1);
//      MovMonth(2);
//      MovMonth(3);
//      MovMonth(4);
      MovMonthPochas(1);
      MovMonthPochas(2);
      MovMonthPochas(3);

end;

end.
