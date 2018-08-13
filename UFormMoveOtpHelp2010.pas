{$WARNINGS OFF}
{$HINTS OFF}
unit UFormMoveOtpHelp2010;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, FIBQuery, pFIBQuery, StdCtrls,
  ComCtrls, Buttons;

type
  TFormMoveOtpHelp2010 = class(TForm)
    pFIBQueryOtp: TpFIBQuery;
    pFIBTransactionOtpR: TpFIBTransaction;
    ProgressBarMonth: TProgressBar;
    ProgressBarP: TProgressBar;
    LabelMon: TLabel;
    LabelPodr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
   procedure MoveAllDataFor2010;
  end;
var
  FormMoveOtpHelp2010: TFormMoveOtpHelp2010;

implementation
 uses ScrDef,ScrIo,ScrUtil,UFibModule;

{$R *.dfm}

procedure TFormMoveOtpHelp2010.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMoveOtpHelp2010.BitBtn1Click(Sender: TObject);
begin
     if not YesNo('Вы уверены в необходимости переноса данных (премии вместо отпускных за 2011 год)?') then Exit;
     if not YesNo('Данные за 2011-й год в файловой структуре подготовлены?') then Exit;
     MoveAllDataFor2010;
end;
procedure TFormMoveOtpHelp2010.MoveAllDataFor2010;
 const Prem_Id=78;
 var savNMES,savNSRV:Integer;
     savFlow_MOnth:Integer;
     iNMES,iNSRV:Integer;
     isChanged:Boolean;
 procedure MovePodr;
   var
      SQLStmnt:string;
      SummaO,SummaPre:Real;
      MonthO,ShifrGruO:Integer;
      Tabno:Integer;
  procedure CorrectPerson;
   var Curr_Person : PERSON_PTR;
       Curr_Add,C_Add : Add_Ptr;
       Finded:Boolean;
    begin
         Finded:=false;
         Curr_Person:=head_person;
         while (Curr_Person<>Nil) do
           begin
                if (Curr_Person^.TABNO  = Tabno) then
                if (Curr_Person^.GRUPPA = ShifrGruO) then
                   begin
                         Curr_Add:=Curr_Person^.ADD;
                         while (Curr_Add<>Nil) do
                           begin
                                if ((Curr_Add^.Shifr=5)  or
                                    (Curr_Add^.Shifr=6)) and
                                   (Abs(Abs(SummaO)-abs(Curr_Add^.Summa))<0.01) and
                                   (Curr_Add^.PERIOD=MonthO) then
                                   begin
                                        IsChanged:=True;
                                        Curr_Add^.Summa:=Curr_Add^.SUMMA-SummaPre;
                                        MAKE_ADD(C_Add,Curr_Person);
                                        C_Add^.SHIFR  := 2;
                                        c_Add^.SUMMA  := SummaPre;
                                        C_Add^.PERIOD := MonthO;
                                        C_Add^.FZP    := c_Add^.SUMMA;
                                        C_Add^.WHO    := PREM_ID;
                                        C_Add^.VYPLACHENO:=Get_Out;
                                        finded:=True;
                                        Break;
                                   end;
                                Curr_Add:=Curr_Add^.NEXT;
                           end;
                         if Finded then Break;
                   end;
                Curr_Person:=Curr_Person^.NEXT;
           end;
         if not Finded then
            ShowMessage('Не найден Tabno='+IntToStr(Tabno)+
                        ' NSRV='+IntToStr(NSRV)+
                        ' NMES='+IntToStr(NMES)+
                        ' SummaO='+FloatToStr(SummaO)+
                        ' Period='+IntToStr(MonthO)+
                        ' ShifrGru='+IntToStr(ShifrGruO)
                       );
    end;

  begin
       SQLSTmnt:='select a.tabno, a.fio, a.dolgname,';
       SQLSTmnt:=SQLSTmnt+'a.summah1,a.shifrgruh1,';
       SQLSTmnt:=SQLSTmnt+'a.datah1,a.shifrpodh1,';
       SQLSTmnt:=SQLSTmnt+'a.summah2,a.shifrgruh2,';
       SQLSTmnt:=SQLSTmnt+'a.datah2,a.shifrpodh2,';
       SQLSTmnt:=SQLSTmnt+'a.dataotpfr,a.dataotpto,a.dayotp,';
       SQLSTmnt:=SQLSTmnt+'a.summaotp1,a.shifrgruo1,a.montho1,';
       SQLSTmnt:=SQLSTmnt+'extract(month from a.datao1),a.shifrpodo1,';
       SQLSTmnt:=SQLSTmnt+'a.summaotp2,a.shifrgruo2,a.montho2,';
       SQLSTmnt:=SQLSTmnt+'extract(month from a.datao2),a.shifrpodo2,';
       SQLSTmnt:=SQLSTmnt+'a.summapre1,a.summapre2';
       SQLSTmnt:=SQLSTmnt+' from tb_otphelplist2011 a';
       SQLSTmnt:=SQLSTmnt+'         where (a.summaotp1>0.01) and';
       SQLSTmnt:=SQLSTmnt+'               (a.summapre1>0.01) and';
       SQLSTmnt:=SQLSTmnt+'               ((montho1='+IntToStr(NMES)+') and ';
       SQLSTmnt:=SQLSTmnt+'                (shifrpodo1='+IntToStr(NSRV)+'))' ;
       SQLSTmnt:=SQLSTmnt+'         order by a.shifrpodo1,a.fio';
       if pFIBQueryOtp.Open then
          pFIBQueryOtp.Close;
       pFIBQueryOtp.SQL.Clear;
       pFIBQueryOtp.SQL.Add(SQLStmnt);
       pFIBQueryOtp.ExecQuery;
       while (not pFIBQueryOtp.Eof) do
         begin
              Tabno     := pFIBQueryOtp.Fields[0].AsInteger;
              SummaO    := pFIBQueryOtp.Fields[14].AsFloat;
              SummaPre  := pFIBQueryOtp.Fields[24].AsFloat;
              MonthO    := pFIBQueryOtp.Fields[17].AsInteger;
              ShifrGruO := pFIBQueryOtp.Fields[15].AsInteger;
              if (SummaO>0.01)   and
                 (SummaPre>0.01) and
                 (MonthO>0)      and
                 (MonthO<13)     and
                 (ShifrGruO>0)    then
                 CorrectPerson;
              pFIBQueryOtp.Next;
         end;
       pFIBQueryOtp.Close;

       // 2 step 

       SQLSTmnt:='select a.tabno, a.fio, a.dolgname,';
       SQLSTmnt:=SQLSTmnt+'a.summah1,a.shifrgruh1,';
       SQLSTmnt:=SQLSTmnt+'a.datah1,a.shifrpodh1,';
       SQLSTmnt:=SQLSTmnt+'a.summah2,a.shifrgruh2,';
       SQLSTmnt:=SQLSTmnt+'a.datah2,a.shifrpodh2,';
       SQLSTmnt:=SQLSTmnt+'a.dataotpfr,a.dataotpto,a.dayotp,';
       SQLSTmnt:=SQLSTmnt+'a.summaotp1,a.shifrgruo1,a.montho1,';
       SQLSTmnt:=SQLSTmnt+'extract(month from a.datao1),a.shifrpodo1,';
       SQLSTmnt:=SQLSTmnt+'a.summaotp2,a.shifrgruo2,a.montho2,';
       SQLSTmnt:=SQLSTmnt+'extract(month from a.datao2),a.shifrpodo2,';
       SQLSTmnt:=SQLSTmnt+'a.summapre1,a.summapre2';
       SQLSTmnt:=SQLSTmnt+' from tb_otphelplist2011 a';
       SQLSTmnt:=SQLSTmnt+'         where (a.summaotp2>0.01) and';
       SQLSTmnt:=SQLSTmnt+'               (a.summapre2>0.01) and';
       SQLSTmnt:=SQLSTmnt+'               ((montho2='+IntToStr(NMES)+') and ';
       SQLSTmnt:=SQLSTmnt+'                (shifrpodo2='+IntToStr(NSRV)+'))' ;
       SQLSTmnt:=SQLSTmnt+'         order by a.shifrpodo2,a.fio';
       if pFIBQueryOtp.Open then
          pFIBQueryOtp.Close;
       pFIBQueryOtp.SQL.Clear;
       pFIBQueryOtp.SQL.Add(SQLStmnt);
       pFIBQueryOtp.ExecQuery;
       while (not pFIBQueryOtp.Eof) do
         begin
              Tabno     := pFIBQueryOtp.Fields[0].AsInteger;
              SummaO    := pFIBQueryOtp.Fields[19].AsFloat;
              SummaPre  := pFIBQueryOtp.Fields[25].AsFloat;
              MonthO    := pFIBQueryOtp.Fields[22].AsInteger;
              ShifrGruO := pFIBQueryOtp.Fields[20].AsInteger;
              if (SummaO>0.01)   and
                 (SummaPre>0.01) and
                 (MonthO>0)      and
                 (MonthO<13)     and
                 (ShifrGruO>0)    then
                 CorrectPerson;
              pFIBQueryOtp.Next;
         end;
       pFIBQueryOtp.Close;



  end;
 begin
      savNMES:=NMES;
      savNSRV:=NSRV;
      savFlow_MOnth:=Flow_MOnth;
      PUTINF;
      while (Head_Person<>NIL) do DEL_PERSON(Head_Person);
      ProgressBarMonth.Max:=12;
      ProgressBarMOnth.Min:=0;
      ProgressBarMonth.Position:=0;
      if not pFIBQueryOtp.Transaction.Active then
         pFIBQueryOtp.Transaction.StartTransaction;
      for iNMES:=1 to 12 do
          begin
               ProgressBarMonth.Position:=iNMES;
               LabelMon.Caption:=GetMonthRus(INMES);
               Application.ProcessMessages;
               ProgressBarP.Max:=Count_Serv;
               ProgressBarP.Min:=0;
               ProgressBarP.Position:=0;
               NMES:=iNMES;
               for iNSRV:=1 to Count_Serv do
                   begin
                        ProgressBarP.Position:=iNSRV;
                        LabelPodr.Caption:=Name_Serv(iNSRV);
                        Application.ProcessMessages;
                        NSRV:=iNSRV;
                        MKFLNM;
                        if not FileExists(FNINF) then continue;
                        GETINF(True);
                        isChanged:=False;
                        MovePodr;
                        if isChanged then
                           begin
                                FLOW_MONTH:=NMES;
                                PUTINF;
                           end;
                        while (Head_Person<>NIL) do DEL_PERSON(Head_Person);

                   end;
          end;
      if pFIBQueryOtp.Transaction.Active then
         pFIBQueryOtp.Transaction.Commit;
      Flow_MOnth:=savFlow_MOnth;
      NMES:=savNMES;
      NSRV:=savNSRV;
      MKFLNM;
      getInf(true);

 end;

end.
