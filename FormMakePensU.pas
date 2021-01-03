unit FormMakePensU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls ;

type
  TFormMakePens = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakePens: TFormMakePens;

implementation
  uses ScrDef,ScrUtil,ScrIO,UFibModule;

{$R *.dfm}

procedure TFormMakePens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

 function GetNalCodePerson(Tabno:integer):string;
  var S:String;
  begin
        S:='';
        FIB.pFIBQuery.SQL.Clear;
        FIB.pFIBQuery.SQL.Add('select first 1 nal_code from kadry where tabno='+IntToStr(Tabno));
        if not FIB.pFIBQuery.Transaction.Active then
           FIB.pFIBQuery.Transaction.StartTransaction;
        try
           FIB.pFIBQuery.ExecQuery;
           S:=FIB.pFIBQuery.Fields[0].AsString;
        except
        end;
        FIB.pFIBQuery.Transaction.COMMIT;
        GetNalCodePerson:=S;
  end;

procedure TFormMakePens.BitBtn1Click(Sender: TObject);
var Sc,REC  : integer;
    SavPodr : integer;
    I_NSRV  : integer;
    Curr_Person:Person_Ptr;
    NeedPut : boolean;
    S       : string;
    CountP  : integer;

  procedure WorkPerson(Curr_Person:Person_Ptr);
   var Curr_Cn:Cn_Ptr;
   FUNCTION  IS_PENSIONE_R(CURR_PERSON:PERSON_PTR):BOOLEAN;
   VAR
       CURR_CN:CN_PTR;
       FOUND:BOOLEAN;
   BEGIN
       FOUND:=FALSE;
       CURR_CN:=CURR_PERSON^.CN;
       WHILE (CURR_CN<>NIL) AND(NOT FOUND) DO
             IF CURR_CN^.SHIFR=PENSIONER_SHIFR+LIMIT_CN_BASE THEN FOUND:=TRUE
                                                             ELSE CURR_CN:=CURR_CN^.NEXT;
       IS_PENSIONE_R:=FOUND;
   END;

   begin
         if Is_Pensione_r(Curr_Person) then Exit;
         if Length(Curr_Person^.NAL_CODE)<>0 then
            begin
                 S:=GetNalCodePerson(Curr_Person^.Tabno);
                 Curr_Person^.NAL_CODE:=S;
            end;
         if Length(Curr_Person^.NAL_CODE)=10 then
            begin
                  if IsPensionerByDate(Curr_Person) then
                     begin
                          NeedPut:=true;
                          Make_Cn(Curr_Cn,Curr_Person);
                          Curr_Cn^.SHIFR:=Pensioner_Shifr+Limit_Cn_Base;
                          Curr_Cn^.KOD:=100;
                          Inc(CountP);
                     end;
            end;
   end;

begin
     Sc:=0;
     CountP:=0;
     Rec:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Max:=Rec;
     ProgressBar1.Position:=0;
     SavPodr:=NSRV;
     EMPTY_ALL_PERSON;
     for I_NSRV:=1 to REC do
         begin
              Inc(Sc);
              Label3.Caption:=IntToStr(Sc)+' / '+IntToStr(Rec);
              ProgressBar1.Position:=Sc;
              Label1.Caption:=Name_Serv(I_NSRV);
              Application.ProcessMessages;
              NSRV:=I_NSRV;
              MKFLNM;
              if not fileexists(FNINF) then continue;
              GETINF(TRUE);
              NeedPut:=false;
              Curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
               begin
                    Label2.Caption:=Curr_Person^.FIO;
                    Application.ProcessMessages;
                    WorkPerson(Curr_Person);
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if NeedPut then
                 PutInf;
              EMPTY_ALL_PERSON;
         end;
     NSRV:=SavPodr;
     MKFLNM;
     GetInf(True);
     ShowMessage('Исправлено '+IntToStr(CountP)+' записей');
end;

end.
