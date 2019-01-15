unit UFormTestCrossSaving;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, frxClass, frxDBSet, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxSpinEdit;

type
  TFormTestCrossSaving = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    wantedYear:integer;
    procedure CreateReport;

  public
    { Public declarations }
  end;

var
  FormTestCrossSaving: TFormTestCrossSaving;

implementation
  uses
      uFIBModule,ScrUtil,DateUtils,ComObj,ScrIO,ScrDef,ScrLists;


{$R *.dfm}

procedure TFormTestCrossSaving.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormTestCrossSaving.FormCreate(Sender: TObject);
begin
     wantedYear:=currYear;
end;

procedure TFormTestCrossSaving.BitBtn1Click(Sender: TObject);
begin
     CreateReport;
end;

procedure TFormTestCrossSaving.CreateReport;
  var tmpNSRV,tmpNMES:integer;
      i_count,cntErr:integer;
      factNSRV:integer;
      s:string;
  begin
       tmpNSRV := NSRV  ;
       tmpNMES := NMES  ;
       EMPTY_ALL_PERSON ;
       ProgressBar1.Min      := 0 ;
       ProgressBar1.Max      := Count_Serv ;
       ProgressBar1.Position := 0 ;
       cntErr:=0;
       for i_count:=1 to count_Serv do
           begin
                ProgressBar1.stepIt;
                Application.ProcessMessages;
                nsrv:=i_count;

                mkflnm;
                if not fileexists(fninf) then continue;
                if not NameServList.IS_ACTIVE(nsrv) then continue;
                getinf(false);
                factNSRV:=getMORForPutInf;
                if ((count_person=0) and (factNSRV=0)) then continue;
                if nsrv=56 then
                   s:='---';
                if factNSRV<>NSRV then
                   begin
                        s:=' в '+intToStr(NSRV)+' записан '+intToStr(factNSRV);
                        Memo1.Lines.Add(s);
                        Application.ProcessMessages;
                        inc(cntErr);
                   end;
                EMPTY_ALL_PERSON;
           end;
       if cntErr=0 then
          showMessage('Пересортицы подразделений не обнаружено.'); 
       NSRV:=tmpNSRV;
       NMES:=tmpNMES;
       MKFLNM;
       GETINF(TRUE);
  end;

end.
