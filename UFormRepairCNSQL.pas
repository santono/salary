{$WARNINGS OFF}
{$HINTS OFF}
unit UFormRepairCNSQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls;

type
  TFormRepairCNSQL = class(TForm)
    DateTimePickerFr: TDateTimePicker;
    DateTimePickerTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    LabelFio: TLabel;
    LabelMonth: TLabel;
    LabelAmnt: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
         procedure ExecuteUpdateCN;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRepairCNSQL: TFormRepairCNSQL;

implementation
  uses DateUtils,Types,ScrDef,ScrIo,ScrUtil,UFibModule;

{$R *.dfm}

procedure TFormRepairCNSQL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormRepairCNSQL.Button1Click(Sender: TObject);
begin
     if not YesNo('Вы действительно хотите обновить флаг АUTOMATIC?') then Exit;
     ExecuteUpdateCN;
end;
procedure TFormRepairCNSQL.ExecuteUpdateCN;
 var DateFr,DateTo,DateCurr:TDateTime;
      Y,M,D:Word;
      SavNSRV,SavNMES:Integer;
      I_NSRV:Integer;
      Curr_Person:Person_Ptr;
      Curr_Cn:CN_PTR;
      CntOfRec:Integer;
   procedure UpdateCn;
    var SQLStmnt:string;
        S:string;
        Id:Integer;
    begin
         S:=FormatFloatPoint(Curr_Cn^.Summa);
         s:=Trim(s);
         FIB.pFIBQuery.Transaction.StartTransaction;
         FIB.pFIBQuery.SQL.Clear;
         SQLStmnt:='SELECT COUNT(*) FROM FCN WHERE tabno='+IntToStr(Curr_Person^.Tabno)+
                   ' and month_vy='+IntToStr(NMES)+' and year_vy='+IntToStr(Y)+
                   ' and shifrsta='+IntToStr(Curr_Cn^.SHIFR)+
                   ' and shifrkat='+IntToStr(Curr_Person^.Kategorija)+
                   ' and shifrgru='+IntToStr(Curr_Person^.GRUPPA)+
                   ' and w_place='+IntToStr(NSRV)+
                   ' and w_r='+IntToStr(Curr_Person^.WID_RABOTY)+
                   ' and kod='+IntToStr(Curr_Cn^.kod)+
                   ' and prim='+IntToStr(Curr_Cn^.prim)+
                   ' and abs(abs(summa)-abs('+S+'))<0.01';
         FIB.pFIBQuery.SQL.Add(SQLStmnt);
         FIB.pFIBQuery.ExecQuery;
         Id:=FIB.pFIBQuery.Fields[0].AsInteger;
         FIB.pFIBQuery.Close;
         if Id<>1 then
            begin
                 FIB.pFIBQuery.Transaction.Commit;
                 Exit;
            end;
         FIB.pFIBQuery.SQL.Clear;
         SQLStmnt:='SELECT SHIFRID FROM FCN WHERE tabno='+IntToStr(Curr_Person^.Tabno)+
                   ' and month_vy='+IntToStr(NMES)+' and year_vy='+IntToStr(Y)+
                   ' and shifrsta='+IntToStr(Curr_Cn^.SHIFR)+
                   ' and shifrkat='+IntToStr(Curr_Person^.Kategorija)+
                   ' and shifrgru='+IntToStr(Curr_Person^.GRUPPA)+
                   ' and w_place='+IntToStr(NSRV)+
                   ' and w_r='+IntToStr(Curr_Person^.WID_RABOTY)+
                   ' and kod='+IntToStr(Curr_Cn^.kod)+
                   ' and prim='+IntToStr(Curr_Cn^.prim)+
                   ' and abs(abs(summa)-abs('+S+'))<0.01';
         FIB.pFIBQuery.SQL.Add(SQLStmnt);
         FIB.pFIBQuery.ExecQuery;
         Id:=FIB.pFIBQuery.Fields[0].AsInteger;
         FIB.pFIBQuery.Close;
         FIB.pFIBQuery.SQL.Clear;
         SQLStmnt:='UPDATE FCN SET AUTOMATIC=2'+
                   ' WHERE SHIFRID='+IntToStr(Id);
         FIB.pFIBQuery.SQL.Add(SQLStmnt);
         FIB.pFIBQuery.ExecQuery;
         FIB.pFIBQuery.Close;
         FIB.pFIBQuery.Transaction.Commit;
         CntOfRec:=CntOfRec+1;
         LabelAmnt.Caption:='К-во '+IntToStr(CntOfRec)+' изменений';

    end;

begin
     DateFr:=DateTimePickerFr.Date;
     DateTo:=DateTimePickerTo.Date;
     DateFr:=RecodeDay(DateFr,1);
     DateTo:=RecodeDay(DateTo,1);
     if CompareDate(DateFr,DateTo)=GreaterThanValue then
        begin
             ShowMessage('Неверно заданы даты');
             Exit;
        end;
     DecodeDate(DateFr,y,m,d);
     DateCurr:=DateFr;
     SavNMES:=NMES;
     SavNSRV:=NSRV;
     PUTINF;
     LDEL_PERSON;
     CntOfRec:=0;
     while True do
       begin
            ProgressBar1.Max:=Count_Serv;
            ProgressBar1.Min:=0;
            ProgressBar1.Position:=0;
            LabelMonth.Caption:=GetMonthRus(M);
            NMES:=M;
            for i_nsrv:=1 to Count_Serv do
                begin
                     ProgressBar1.Position:=i_nsrv;
                     LabelPodr.Caption:=Name_SERV(I_NSRV);
                     LabelFIO.Caption:='';
                     Application.ProcessMessages;
                     NSRV:=I_NSRV;
                     MKFLNM;
                     if not FileExists(FNINF) then Continue;
                     GETINF(false);
                     Curr_Person:=Head_Person;
                     while (Curr_Person<>Nil) do
                      begin
                            LabelFIO.Caption:=Curr_Person^.Fio;
                            Application.ProcessMessages;
                            Curr_Cn:=Curr_Person^.Cn;
                            while (Curr_Cn<>nil) do
                              begin
                                   if Curr_Cn^.AUTOMATIC=manual_Mode then
                                      UpdateCn;
                                   Curr_Cn:=Curr_Cn^.Next;
                              end;
                            Curr_Person:=Curr_Person^.NEXT;
                      end;
                     LDEL_PERSON;
                end;


            DateCurr:=EncodeDate(y,m,d);
            DateCurr:=IncMonth(DateCurr);
            DecodeDate(DateCurr,y,m,d);
            if CompareDate(DateTo,DateCurr)=EqualsValue then Break;
            if CompareDate(DateTo,DateCurr)=LessThanValue then Break;
       end;
     NMES:=SavNMES;
     NSRV:=SavNSRV;
     MKFLNM;
     GETINF(True);
end;

end.
