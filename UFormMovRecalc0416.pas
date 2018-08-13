unit UFormMovRecalc0416;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, dxCntner, dxEditor, dxExEdtr, dxEdLib, DB,
  FIBDataSet, pFIBDataSet;

type
  TFormMovRecalc0416 = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn3: TBitBtn;
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
    Button1: TButton;
    pFIBQueryRR: TpFIBQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    NeedEmpty          : boolean;
    NeedNotCheckedOnly : boolean;
    LoSumma,HiSumma    : real;
    procedure MovMonth(M:integer);
  public
    { Public declarations }
  end;

var
  FormMovRecalc0416: TFormMovRecalc0416;

implementation
 uses ScrDef,ScrIo,ScrUtil, uFIBModule, UFormSelPod,ScrLists, UFormSelPKG;

{$R *.dfm}

procedure TFormMovRecalc0416.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMovRecalc0416.BitBtn1Click(Sender: TObject);
var a:real;
    i:integer;
begin
      if not ((NMES=5) and (WORK_YEAR_VAL=2016)) then
         begin
              ShowMessage('Перенос перерасчета возможен только в мае 2016 г.');
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
      MovMonth(4);
end;

procedure TFormMovRecalc0416.MovMonth(M:integer);
 const Id_01=117;
 var SavMonth,I_NSRV,SavPodr:integer;
     Sc,Rec:integer;
     MN,TableName,SQL:string;
     NeedPut:boolean;
     I_Musor:integer;
     ShifrDol:integer;
     Is_O_W_R:integer;
     MarkedLine:boolean;
     v:Variant;
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
           SQLStmnt:string;
           id:Integer;
           Shifr:Integer;
           Summa:Real;
       begin
            Y:=2016;
            SummaRecalc:=0;
            id := pFIBQueryR.FieldByName('id').AsInteger;
            SQLStmnt:='select SHIFRSTA,SUMMA from tb_rclc0416_det where IDOWNER='+IntToStr(id);
            pFIBQueryRR.SQL.Clear;
            pFIBQueryRR.SQL.Add(SQLSTmnt);
            pFIBQueryRR.ExecQuery;
            while (not pFIBQueryRR.Eof) do
               begin
                    shifr:=pFIBQueryRR.FieldByName('SHIFRSTA').AsInteger;
                    if shifr<>40 then     //Только ночные
                       begin
                            pFIBQueryRR.Next;
                            continue
                       end;
                    summa:=pFIBQueryRR.FieldByName('SUMMA').AsFloat;
                    Make_Add(Curr_Add,Curr_Person);
                    Curr_Add^.PERIOD:=M;
                    Curr_Add^.Year:=Y-1990;
                    Curr_Add^.SHIFR:=shifr;
                    Curr_Add^.Summa:=summa;
                    Curr_Add^.Who:=Id_01+M;
                    Curr_Add^.VYPLACHENO:=Get_Out;
                    pFIBQueryRR.Next;
               end;
            pFIBQueryRR.Close;
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
            isSamePerson:=False;
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
       //       if not DejaMoved then
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
      while (head_person<>nil) do del_person(head_person);
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
                TableName:='TB_RCLC1301';
                case m of
                 1: mn:='Январь';
                 2: mn:='Февраль';
                 3: mn:='Март';
                 4: mn:='Апрель';
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
                SQL:='select count(*) from tb_rclc0416 where w_place='+IntToStr(NSRV);
                v:=FIB.pFIBDatabaseSal.QueryValue(SQL,0);
                rec:=0;
                if VarIsNumeric(v) then
                   Rec:=v;
                if Rec<1 then continue;

                MKFLNM;
                if not FileExists(FNINF) then continue;
                getinf(true);
                NeedPut:=false;
        //        if NeedEmpty then
        //           DeleteAuIdPodr;

                pFIBQueryR.Close;
                pFIBQueryR.SQL.Clear;
                SQL:='select id,tabno,fio,guid,dolg from tb_rclc0416 where w_place='+IntToStr(NSRV);
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
                               pFIBQueryW.SQL.Add('update tb_rclc0416 set moved=1 where id='+IntToStr(pFIBQueryR.FieldByName('id').AsInteger));
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
                while (head_person<>nil) do del_person(head_person);
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






procedure TFormMovRecalc0416.BitBtn3Click(Sender: TObject);
begin
{
    Application.CreateForm(TFormSelPodr, FormSelPodr);
    FormSelPodr.ShowModal;
}
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;


end;



procedure TFormMovRecalc0416.FormCreate(Sender: TObject);
begin
     NeedEmpty          := false;
     NeedNotCheckedOnly := false;
     HiSumma            := 200;
     LoSumma            := 0;
     dxCalcEditLoSumma.Text := format('%10.2f',[LoSumma]);
     dxCalcEditHiSumma.Text := format('%10.2f',[HiSumma]);
end;







end.
