unit uDBF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBTables, ComCtrls;

type
  TFormDBF = class(TForm)
    dbfPerson: TTable;
    dbfADD: TTable;
    dbfUD: TTable;
    dbfCN: TTable;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure PutNsrvToDBF;
  public
    { Public declarations }
  end;

var
  FormDBF  : TFormDBF;

implementation
 USES sCRDEF,SCRUTIL,SCRIO;
var
  PersonId : integer;

{$R *.dfm}

procedure TFormDBF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     dbfADD.CLOSE;
     dbfUD.CLOSE;
     dbfCN.CLOSE;
     dbfPERSON.CLOSE;
     Action:=caFree;
end;

procedure TFormDBF.PutnsrvToDBF;
   var 
       CURR_PERSON:pERSON_PTR;
       CURR_ADD:ADD_PTR;
       CURR_UD:UD_PTR;
       CURR_CN:CN_PTR;
   begin

        CURR_PERSON:=HEAD_PERSON;
        WHILE CURR_PERSON<>NIL DO
           BEGIN
                PERSONID:=PERSONID+1;
                WITH dbfPERSON DO
                 BEGIN
                      Insert;
                      FIELDBYNAME('SHIFRID').ASINTEGER:=PERSONID;
                      FIELDBYNAME('MONTH_VY').ASINTEGER:=NMES;
                      FIELDBYNAME('YEAR_VY').ASINTEGER:=CURRYEAR;
                      FIELDBYNAME('TABNO').ASINTEGER:=CURR_PERSON^.TABNO;
                      FIELDBYNAME('W_PLACE').ASinteger:=SHIFR_SERV(NSRV);
                      FIELDBYNAME('FIO').ASSTRING:=wINtODOS(CURR_PERSON^.FIO);
                      FIELDBYNAME('GRUPPA').ASINTEGER:=CURR_PERSON^.GRUPPA;
                      FIELDBYNAME('KATEG').ASINTEGER:=CURR_PERSON^.KATEGORIJA;
                      FIELDBYNAME('DOLG').ASSTRING:=wINtODOS(CURR_PERSON^.DOLG);
                      FIELDBYNAME('OKLAD').ASFLOAT:=CURR_PERSON^.OKLAD;
                      FIELDBYNAME('W_R').ASINTEGER:=CURR_PERSON^.WID_RABOTY;
                      FIELDBYNAME('N_TEMY').ASSTRING:=wINtODOS(CURR_PERSON^.N_TEMY);
                      FIELDBYNAME('M_O_R').ASINTEGER:=CURR_PERSON^.MESTO_OSN_RABOTY;
                      FIELDBYNAME('WID_OPLATY').ASINTEGER:=CURR_PERSON^.WID_OPLATY;
                      FIELDBYNAME('MODE').ASINTEGER:=CURR_PERSON^.MODE;
                      FIELDBYNAME('FROM').ASINTEGER:=CURR_PERSON^.FROM;
                      FIELDBYNAME('PODOH').ASINTEGER:=CURR_PERSON^.PODOH;
                      FIELDBYNAME('MALO').ASINTEGER:=CURR_PERSON^.MALO;
                      FIELDBYNAME('PROF').ASINTEGER:=CURR_PERSON^.PROFSOJUZ;
                      FIELDBYNAME('DAY').ASINTEGER:=CURR_PERSON^.START_DAY;
                      FIELDBYNAME('STATE').ASINTEGER:=CURR_PERSON^.STATE;
                      FIELDBYNAME('PENS').ASINTEGER:=CURR_PERSON^.PENS;
                      FIELDBYNAME('NAL_CODE').ASSTRING:=CURR_PERSON^.NAL_CODE;
{                     FIELDBYNAME('DATEFROTP').ASINTEGER:=CURR_PERSON^.BANK;}
                      Post;
                 END;

                CURR_ADD:=CURR_PERSON^.ADD;
                WHILE CURR_ADD<>NIL DO
                      BEGIN
                           WITH dbfAdd DO
                            BEGIN
                                 Insert;
                                 FIELDBYNAME('SHIFR').ASINTEGER      := CURR_ADD^.SHIFR;
                                 FIELDBYNAME('MONTH_ZA').ASINTEGER    := CURR_ADD^.PERIOD;
                                 FIELDBYNAME('YEAR_ZA').ASINTEGER     := CURR_ADD^.YEAR+1990;
                                 if curr_add^.year<5 then
                                    FIELDBYNAME('YEAR_ZA').ASINTEGER := CURRYEAR;
                                 if abs((nmes-curr_add^.period))>4 then
                                    FIELDBYNAME('YEAR_ZA').ASINTEGER := FIELDBYNAME('YEAR_ZA').ASINTEGER-1;
                                 FIELDBYNAME('SUMMA').ASFLOAT        := CURR_ADD^.SUMMA;
                                 FIELDBYNAME('FZP').ASFLOAT          := CURR_ADD^.FZP;
                                 FIELDBYNAME('FMP').ASFLOAT          := CURR_ADD^.FMP;
                                 FIELDBYNAME('OTHER').ASFLOAT        := CURR_ADD^.OTHER;
                                 FIELDBYNAME('DAY').ASINTEGER        := CURR_ADD^.WORK_DAY;
                                 FIELDBYNAME('CLOCK').ASFLOAT        := CURR_ADD^.WORK_CLOCK;
                                 FIELDBYNAME('SHIFRIDP').ASINTEGER   := PERSONID;
                                 Post;
                            END;
                           CURR_ADD:=CURR_ADD^.NEXT;
                      END;
                CURR_UD:=CURR_PERSON^.UD;
                WHILE CURR_UD<>NIL DO
                      BEGIN
                           WITH dbfUd DO
                            BEGIN
                                 Insert;
                                 FIELDBYNAME('SHIFR').ASINTEGER      := CURR_UD^.SHIFR;
                                 FIELDBYNAME('MONTH_ZA').ASINTEGER    := CURR_UD^.PERIOD;
                                 FIELDBYNAME('YEAR_ZA').ASINTEGER     := CURR_UD^.YEAR+1990;
                                 if curr_Ud^.year<5 then
                                    FIELDBYNAME('YEAR_ZA').ASINTEGER     := CURRYEAR;
                                 if abs((nmes-curr_ud^.period))>4 then
                                    FIELDBYNAME('YEAR_ZA').ASINTEGER := FIELDBYNAME('YEAR_ZA').ASINTEGER-1;
                                 FIELDBYNAME('SUMMA').ASFLOAT        := CURR_uD^.SUMMA;
                                 FIELDBYNAME('SHIFRIDP').ASINTEGER   := PERSONID;
                                 Post;
                            END;
                           CURR_UD:=CURR_UD^.NEXT;
                      END;
                CURR_CN:=CURR_PERSON^.CN;
                WHILE CURR_CN<>NIL DO
                      BEGIN
                           WITH dbfCN DO
                            BEGIN
                                 Insert;
                                 FIELDBYNAME('SHIFR').ASINTEGER        := CURR_CN^.SHIFR;
                                 FIELDBYNAME('KOD').ASINTEGER          := CURR_CN^.KOD;
                                 FIELDBYNAME('SUMMA').ASFLOAT          := CURR_CN^.SUMMA;
                                 FIELDBYNAME('PRIM').ASINTEGER         := CURR_CN^.PRIM;
                                 FIELDBYNAME('PRIM_1').ASSTRING        := wINtODOS(CURR_CN^.PRIM_1);
                                 FIELDBYNAME('SHIFRIDP').ASINTEGER     := PERSONID;
                                 Post;
                            END;
                           CURR_CN:=CURR_CN^.NEXT;
                      END;
                CURR_PERSON:=CURR_PERSON^.NEXT;
           END;

   end;
procedure TFormDBF.FormCreate(Sender: TObject);
begin
     dbfADD.Open;
     dbfUD.Open;
     dbfCN.Open;
     dbfPERSON.Open;
end;

procedure TFormDBF.BitBtn1Click(Sender: TObject);
VAR I,J:INTEGER;
    NSRVT:INTEGER;
    NMES_T:INTEGER;
begin
     PersonId:=0;
{     
     PersonId:=63879;
     PersonId:=150000;
     PersonId:=230000;
     PersonId:=290000;
}
     ProgressBar1.Min:=0;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Step:=1;
     ProgressBar2.Min:=0;
     ProgressBar2.Max:=12;
     ProgressBar2.Step:=1;
     NSRVT:=NSRV;
     EMPTY_ALL_PERSON;
{     CurrYear:=20001999;}
     nmes_t:=nmes;
     nmes:=1;
     FOR j:=1 TO 12 do
         begin
              NMES:=J;
              ProgressBar2.Position:=j;
     Label2.Caption:=MONTH[NMES];
     Label2.ReFresh;
     Label2.RePaint;

     FOR I:=1 TO COUNT_SERV DO
         BEGIN
              NSRV:=I;
              MKFLNM;
              GETINF(TRUE);
              ProgressBar1.Position:=i;
              Label1.Caption:=NAME_SERV(NSRV);
              Label1.ReFresh;
              Label1.RePaint;
              PUTnsrvTODBF;
              EMPTY_ALL_PERSON;
         END;
         END;
     NMES:=NMES_t;
     NSRV:=NSRVT;
     MKFLNM;
     GETINF(TRUE);

end;

end.
