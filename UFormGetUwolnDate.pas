{$H-}
unit UFormGetUwolnDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery;

type
  TFormGetUwolnDate = class(TForm)
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Button1: TButton;
    BitBtn1: TBitBtn;
    pFIBQuery1: TpFIBQuery;
    pFIBTransaction1: TpFIBTransaction;
    ProgressBar1: TProgressBar;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    dateFr:TDateTime;
    procedure ExecuteMovig;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGetUwolnDate: TFormGetUwolnDate;

implementation
  uses ScrDef,ScrIo,ScrUtil,DateUtils,UFibModule;

{$R *.dfm}

procedure TFormGetUwolnDate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormGetUwolnDate.ExecuteMovig;
 var NMESSav,NSRVSav,I_NSRV:Integer;
     Changed:Boolean;
     Tabno:Integer;
     GUIDS,Prim_1:string;
 function ExecSQLForPodr:boolean;
  var SQLStmnt:string;
  begin
      if pFIBQuery1.Open then
         pFIBQuery1.Close;
      SQLStmnt:='select a.tabno,';
      SQLStmnt:=Trim(SQLStmnt)+'(select first 1 GUID from pr_getguid(a.shifridperson,0)) as PCode,';
      SQLStmnt:=Trim(SQLStmnt)+' a.prim_1,a.shifrsta, a.year_vy,a.month_vy,a.w_place from fcn a';
      SQLStmnt:=Trim(SQLStmnt)+' where a.shifrsta in (149,149+500)';
      SQLStmnt:=Trim(SQLStmnt)+'   and a.year_vy='+IntToStr(YearOf(dateFr));
      SQLStmnt:=Trim(SQLStmnt)+'   and a.month_vy='+IntToStr(monthOf(dateFr));
      SQLStmnt:=Trim(SQLStmnt)+'   and a.w_place='+IntToStr(NSRV);
      pFIBQuery1.SQL.Clear;
      pFIBQuery1.SQL.Add(SQLStmnt);
      pFIBQuery1.ExecQuery;
      if (not pFIBQuery1.Eof) then ExecSQLForPodr:=True
               else ExecSQLForPodr:=False;

  end;
 procedure FillDataUwolInCN;
   var Curr_Person : PERSON_PTR;
       Curr_Cn     : CN_PTR;
       GUIDS1      : string;
       Finded      : Boolean;
   begin
       if Tabno<1 then Exit;
       if Length(trim(GUIDS))=0 then Exit;
       Curr_Person:=HEAD_PERSON;
       while not ((Curr_Person=Nil) or not Assigned(Curr_Person)) do
         begin
              if GetGUIDPerson(Curr_Person,GUIDS1) then
              if Curr_Person.Tabno=TABNO           then
              if Trim(GUIDS)=Trim(GUIDS1)          then
              if Length(Trim(GUIDS))>0             then
              if Length(Trim(GUIDS1))>0            then
                 begin
                      Curr_Cn:=Curr_Person.CN;
                      Finded:=false;
                      while not ((Curr_Cn=nil) or not Assigned(Curr_Cn)) do
                        begin
                             if Curr_cn.Shifr=DataUwShifr+Limit_Cn_Base then
                                begin
                                     Finded:=True;
                                     break;
                                end;
                             Curr_Cn:=Curr_Cn.Next;
                        end;
                      if not Finded then
                         begin
                              MAKE_CN(Curr_Cn,Curr_Person);
                              Curr_cn.SHIFR:=DataUwShifr+Limit_Cn_Base;
                              Curr_Cn.KOD:=100;
                              Curr_Cn.PRIM_1:=Prim_1;
                              Changed:=True;
                         end;
                      Break;
                 end;
             Curr_Person:=Curr_Person.NEXT;
         end;
   end;

 begin
      if not ((nmes=flow_month) and
          (CURRYEAR=WORK_YEAR_VAL)) then
         begin
              ShowMessage('ѕеренос возможен только в текущем мес€це');
              Exit;
         end;
      dateFr:=DateTimePicker1.Date;
      if pFIBQuery1.Open then
         pFIBQuery1.Close;
      if not pFIBQuery1.Transaction.Active then
         pFIBQuery1.Transaction.StartTransaction;
      NMESsav:=NMES;
      NSRVSav:=NSRV;
      LDEL_PERSON;
      ProgressBar1.Min := 0;
      ProgressBar1.Max := Count_Serv;
      ProgressBar1.Position:=0;
      Application.ProcessMessages;
      for i_nsrv:=1 to Count_Serv do
          begin
               NSRV:=I_NSRV;
               Label2.Caption:=Name_Serv(I_NSRV);
               ProgressBar1.Position:=I_NSRV;
               Application.ProcessMessages;
               if not ExecSQLForPodr then Continue;
               MKFLNM;
               if not FileExists(fninf) then Continue;
               GETINF(true);
               Changed:=false;
               while not (pFIBQuery1.Eof) do
                 begin
                       Tabno  := 0;
                       GUIDS  := '';
                       Prim_1 := '';
                       tabno  := pFIBQuery1.Fields[0].AsInteger;
                       GUIDS  := pFIBQuery1.Fields[1].AsString;
                       Prim_1 := pFIBQuery1.Fields[2].AsString;
                       FillDataUwolInCN;
                       pFIBQuery1.Next;
                 end;
               if Changed then
                  begin
                       PUTINF;
                       LDEL_PERSON;
                  end;
          end;
      NMES:=NMESSav;
      NSRV:=NSRVSav;
      MKFLNM;
      GETINF(true);

      if pFIBQuery1.Open then
         pFIBQuery1.Close;
      if pFIBQuery1.Transaction.Active then
         pFIBQuery1.Transaction.Commit;



 end;


procedure TFormGetUwolnDate.FormCreate(Sender: TObject);
begin
     Label2.Caption:='';
     Label3.Caption:='';
     DateTimePicker1.Date:=EncodeDate(CurrentYear,NMES,1);
end;

procedure TFormGetUwolnDate.Button1Click(Sender: TObject);
begin
     ExecuteMovig;
end;

end.
