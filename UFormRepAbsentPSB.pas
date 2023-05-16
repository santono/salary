unit UFormRepAbsentPSB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormRepAbsentPSB = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure MakeList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRepAbsentPSB: TFormRepAbsentPSB;

implementation

{$R *.dfm}
  USes comObj,ScrDef,ScrUtil,scrIo,USQLUnit,uFormWait;

 var list:TList;
procedure TFormRepAbsentPSB.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     ACtion:=caFree;
end;

procedure TFormRepAbsentPSB.BitBtn1Click(Sender: TObject);
begin
     BitBtn1.Enabled:=False;
     MakeList;
     BitBtn1.Enabled:=True;

end;
procedure TFormRepAbsentPSB.MakeList;
 var savNMES,savNSRV:Integer;
     i_NSRV:Integer;
     sc:Integer;
     curr_person:PERSON_PTR;
  function getSummaAdd(curr_person:Person_ptr):Real;
    var summa:Real;
        curr_add:ADD_PTR;
    begin
         summa := 0;
         curr_add:=curr_person^.ADD;
         while (curr_add<>nil) do
          begin
               if Abs(curr_add^.SUMMA)>0.01 then
                  summa:=summa+curr_add^.SUMMA;
               curr_add:=curr_add^.NEXT;
          end;
         getSummaAdd:=summa;
    end;
  procedure addPersonToList(curr_person:person_Ptr);
   var i:Integer;
       finded:boolean;
       PInt:PInteger;
       SQLStmnt:string;
       v:variant;
    begin
         finded:=False;
         if List.Count>0 then
            begin
                 for i:=0 to List.Count-1 do
                     begin
                          if PInteger(List.Items[i])^=curr_person^.tabno then
                             begin
                                  finded:=True;
                                  Break;
                             end;
                     end;
            end;
       if not finded then
          begin
               SQLStmnt:='select first 1 nomer_scheta from tb_psb_rez where tabno='+IntToStr(curr_person^.tabno);
               v:=SQLQueryValue(SQLStmnt);
               if VarIsNull(v) then
                  begin
                       New(PInt);
                       PInt^:=curr_person^.tabno;
                       List.Add(PInt);
                  end;
          end;
    end;
  procedure exportToExcel;
    var E,WC:Variant;
        sc,i:Integer;
        rec,currrow,currcol:Integer;
        fio:string;
        tabno:Integer;
    begin //----------------------
        FormWait.Show;
        Application.ProcessMessages;
        try
           E:=CreateOleObject('Excel.Application');
          FormWait.Hide;
          Application.ProcessMessages;
        except
           FormWait.Hide;
           Application.ProcessMessages;
           ShowMessage('Ошибка запуска Excel');
           Exit;
        end;

        sc:=0;
        CurrRow:=1;
        E.WorkBooks.Add;
        E.Visible:=true;
        for i:=0 to list.count-1 do
          begin
               Inc(CurrRow);
               tabno:=PInteger(List.Items[i])^;
               fio:=GetFullRusFioPerson(Tabno);
               E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,1]:=tabno;
               E.WorkBooks[1].WorkSheets[1].Cells[CurrRow,2]:=fio;
          end;


    end;  //-----------------------


 begin
      savNSRV:=NSRV;
      savNMES:=NMES;
      EMPTY_ALL_PERSON;
      list:=TList.Create;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Min:=0;
      ProgressBar1.Position:=0;
      ProgressBar1.Step:=1;
      for i_NSRV:=1 to Count_Serv do
        begin
             ProgressBar1.StepIt;
             Application.ProcessMessages;
             Label1.Caption:=Name_Serv(i_NSRV);
             NSRV:=i_NSRV;
             mkflnm;

             if not FileExists(fninf) then
                Continue;
             GETINF(false);
             curr_person:=HEAD_PERSON;
             while (curr_person<>nil) do
               begin
                    if (getSummaAdd(curr_person)>0.01) then
                        addPersonToList(curr_person);
                    curr_person:=curr_person^.NEXT;
               end;
             EMPTY_ALL_PERSON;
        end;
      if list.count>0 then
         exportToExcel
      else
         ShowMessage('Нет сотрудников без счета в ПСБ');
      list.Free;
      list:=nil;
      NSRV:=savNSRV;
      NMES:=savNMES;
      MKFLNM;
      GETINF(true);

 end;

procedure TFormRepAbsentPSB.FormCreate(Sender: TObject);
begin
     Label1.Caption:='';
end;

end.
