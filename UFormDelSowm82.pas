unit UFormDelSowm82;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TFormDelSowm82 = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    dtFr: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure empty82;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDelSowm82: TFormDelSowm82;

implementation
  uses ScrDef,scrio,ScrUtil,UFibModule,DateUtils;

{$R *.dfm}

procedure TFormDelSowm82.Button1Click(Sender: TObject);
begin
     empty82;
end;
procedure TFormDelSowm82.empty82;
 var y,m:Integer;
     SQLStmnt:string;
     tmpNSRV:Integer;
     finished:Boolean;
     no:integer;
     curr_person:PERSON_PTR;
     v:Variant;
     ic:Integer;
begin
     y:=yearOf(dtFr.date);
     m:=monthOf(dtFr.date);
     putinf;
     EMPTY_ALL_PERSON;
     tmpNSRV:=NSRV;
     NSRV:=82;
     GETINF(TRUE);
     no:=0;
     while True do
       begin
            finished:=True;
            curr_person:=HEAD_PERSON;
            while (curr_person<>nil) do
               begin
                    inc(no);
                    ic:=-1;
                    SQLStmnt:='select count(*) from person where yearvy='+intTostr(y)+' and monthvy='+intToStr(m)+' and tabno='+intToStr(curr_person^.TABNO)+' and w_place=82';
                    v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
                    if VarIsNumeric(v) then
                      begin
                           ic:=v;
                           if ic=0 then
                              begin
                                   label2.Caption:=IntToStr(no)+' '+trim(curr_person^.fio);
                                   Application.processMessages;
                                   DEL_PERSON(curr_person);
                                   finished:=False;
                                   break;
                              end;
                      end;
                    curr_person:=curr_person^.NEXT;
               end;
            if finished then Break;
       end;
     label2.Caption:='Чиста 82-го подразделения закончена';
     Application.processMessages;
     PUTINF;
     NSRV:=tmpNSRV;
     mkflnm;
     getinf(true);
end;

procedure TFormDelSowm82.FormCreate(Sender: TObject);
var Y,m:word;
begin
      y:=CURRYEAR;
      m:=NMES;
      Dec(m);
      if m<1 then
        begin
             m:=12;
             Dec(y);
        end;
      dtFr.Date:=encodedate(y,m,1);
end;

end.
