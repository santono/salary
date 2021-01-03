{$WARNINGS OFF}
{$HINTS OFF}
unit UFormMoveIskra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, FIBDataSet, pFIBDataSet, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery;

type
  TFormMoveIskra = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    pFIBTransaction1: TpFIBTransaction;
    pFIBQuery1: TpFIBQuery;
    BitBtn3: TBitBtn;
    btn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
     procedure MoveIskra;
  public
    { Public declarations }
  end;

var
  FormMoveIskra: TFormMoveIskra;

implementation
   uses ScrDef,ScrUtil,ScrIo,UFibModule;

{$R *.dfm}

procedure TFormMoveIskra.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMoveIskra.BitBtn1Click(Sender: TObject);
begin
     if not ((nmes=6) and (CurrYear=2013))  then
        begin
             ShowMessage('Работает только в июне 2013');
             Exit;
        end;
     if (NSRV<>179)  then
        begin
             ShowMessage('Работает в подразделении 179');
             Exit;
        end;
     if not YesNo('Все данные из 179 подр будут потеряны и созданы новые. Уверены?') then
        Exit;

     EMPTY_ALL_PERSON;
     MoveIskra;
     PUTINF;
end;

procedure TFormMoveIskra.MoveIskra;
 var Curr_Person:Person_Ptr;
     v:array of Variant;
     SQLStmnt:string;
     Tabno:Integer;
     FIO:string;
     nal_code:string;
     dolg:string;
     oklad:Real;
 begin
      SQLStmnt:='select a.tabno,a.fio,a.nal_code,b.okl,c.nprof from kadry a join tb_i_person b on a.tabno=b.tabno_vnu join tb_i_prof c on b.kprof=c.kprof where shifr_pod=179';
      if pFIBQuery1.Open then
         pFIBQuery1.Close;
      if pFIBQuery1.Transaction.Active then
         pFIBQuery1.Transaction.Commit;
      pFIBQuery1.SQL.Clear;
      pFIBQuery1.SQL.Add(SQLStmnt);
      pFIBQuery1.Transaction.StartTransaction;
      pFIBQuery1.ExecQuery;
      while not pFIBQuery1.Eof do
       begin
            tabno    := pFIBQuery1.Fields[0].AsInteger;
            FIO      := pFIBQuery1.Fields[1].AsString;
            nal_code := pFIBQuery1.Fields[2].AsString;
            oklad    := pFIBQuery1.Fields[3].AsFloat;
            dolg     := pFIBQuery1.Fields[4].AsString;
            MAKE_PERSON(Curr_Person);
            Curr_Person^.TABNO    := Tabno;
            Curr_Person^.FIO      := SHORT_FIO(FIO);
            Curr_Person^.NAL_CODE := NAL_CODE;
            Curr_Person^.OKLAD    := OKLAD;
            Curr_Person^.GRUPPA   := 38;
            Curr_Person^.KATEGORIJA := 3;
            Curr_Person^.DOLG     := Trim(copy(Trim(dolg)+space(10),1,10));

            pFIBQuery1.Next;
       end;
      if pFIBQuery1.Open then
         pFIBQuery1.Close;
      if pFIBQuery1.Transaction.Active then
         pFIBQuery1.Transaction.Commit;
      PUTINF;

 end;

procedure TFormMoveIskra.BitBtn3Click(Sender: TObject);
 var Curr_Person:PERSON_PTR;
     done:Boolean;
     i:Integer;
begin
     if not modeIskra then Exit;
     if NSRV<>179 then Exit;
     nsrv:=3;
     MKFLNM;
     EMPTY_ALL_PERSON;
     GETINF(true);
     while (true) do
       begin
            done:=True;
            curr_Person:=HEAD_PERSON;
            while (Curr_Person<>NIl) do
              begin
                   if Curr_Person^.tabno<>173 then
                      begin
                            Del_Person(Curr_Person);
                            Done:=False;
                            Break;
                      end;
                   Curr_Person:=Curr_Person^.NEXT;
              end;
            if done then Break;
       end;
       Curr_Person:=HEAD_PERSON;
       i:=Count_Person;
       if i=1 then
       if Curr_Person.Tabno=173 then
          begin
               while (Curr_Person.Add<>Nil) do DEL_ADD(Curr_Person.Add,Curr_Person);
               while (Curr_Person.Ud<>Nil) do DEL_Ud(Curr_Person.Ud,Curr_Person);
               PUTINF;
          end;
     EMPTY_ALL_PERSON;
     nsrv:=82;
     MKFLNM;
     GETINF(true);
     EMPTY_ALL_PERSON;
     PUTINF;
     nsrv:=179;
     GETINF(true);


end;

procedure TFormMoveIskra.btn1Click(Sender: TObject);
 var Curr_Person:PERSON_PTR;
     done:Boolean;
     i:Integer;
begin
     if not modeIskra then Exit;
     if NSRV<>179 then Exit;
     if NMES<>1 then Exit;
     if CURRYEAR<>2015 then Exit;
     curr_Person:=HEAD_PERSON;
     while (Curr_Person<>NIl) do
        begin
             while (Curr_Person^.Add<>Nil) do DEL_ADD(Curr_Person^.Add,Curr_Person);
             while (Curr_Person^.Ud<>Nil ) do DEL_UD(Curr_Person^.Ud,Curr_Person);
             Curr_Person:=Curr_Person^.NEXT;
        end;
     PUTINF;
     GETINF(true);
     ShowMessage('Чистка закончена');


end;


end.
