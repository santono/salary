unit UFormFindPerson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, ComCtrls, DBClient, frxClass, frxExportPDF, frxDBSet;

type
  TFormFindPerson = class(TForm)
    BitBtn1: TBitBtn;
    LabelFIO: TLabel;
    cdsPlaces: TClientDataSet;
    ProgressBar1: TProgressBar;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    cdsPlacesshifrPod: TIntegerField;
    cdsPlacesnamePod: TStringField;
    cdsPlacesshifrWR: TIntegerField;
    cdsPlacesnameWR: TStringField;
    cdsPlacesdolg: TStringField;
    cdsPlacessummaAdd: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
     wantedTabno : integer;
     wantedFIO   : string;
     procedure FindPerson;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFindPerson: TFormFindPerson;

implementation
  uses UFibModule,ScrDef,ScrIo,ScrUtil,uFrmFindKadryFB;

{$R *.dfm}

procedure TFormFindPerson.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormFindPerson.BitBtn1Click(Sender: TObject);

begin
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     wantedTabno := GetTabno;
                     wantedFIO   := GetFio;
                     LabelFIO.Caption:=IntToStr(wantedTabno)+' '+trim(wantedFIO);
                     Application.ProcessMessages;
               end;
         finally
{            free;   }
          end;
end;


procedure TFormFindPerson.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(Trim(VarName),'FIO')=0 then
        Value:=LabelFIO.Caption;
end;

procedure TFormFindPerson.BitBtn2Click(Sender: TObject);
begin
     if WantedTabno>0 then
        FindPerson;
end;

procedure TFormFindPerson.FormCreate(Sender: TObject);
begin
     wantedTabno := 0;
     wantedFio   := '';
     LabelFIO.Caption:='Укажите работника';
end;
procedure TFormFindPerson.FindPerson;
 var i_NSRV:Integer;
     tmpNSRV:Integer;
     curr_person:PERSON_PTR;
     finded:Boolean;
begin
     tmpNSRV:=NSRV;
     PUTINF;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     finded:=false;
     cdsPlaces.Open;
     for i_nsrv:=1 to Count_Serv do
         begin
              ProgressBar1.Position:=i_NSRV;
              Application.ProcessMessages;
              nsrv:=i_NSRV;
              MKFLNM;
              if not FileExists(FNINF) then Continue;
              GETINF(false);
              curr_person:=HEAD_PERSON;
              while (curr_person<>nil) do
                begin
                     if curr_person^.TABNO=wantedTabno then
                        begin
                             finded:=True;
                             cdsPlaces.Insert;
                             cdsPlacesshifrPod.Value:=NSRV;
                             cdsPlacesnamePod.Value:=name_serv(nsrv);
                             cdsPlacesnameWR.Value:=GET_WR_NAME(curr_person^.WID_RABOTY);
                             cdsPlacesdolg.Value:=curr_person^.dolg;
                             cdsPlacessummaAdd.Value:=0;
                             cdsPlaces.Post;
                        end;
                     curr_person:=curr_person.NEXT;
                end;
              EMPTY_ALL_PERSON;

         end;
     if not finded then
        ShowMessage('Не найдено мест работы сотрудника')
     else
        frxReport1.showreport();
     cdsPlaces.Close;    
     NSRV:=tmpNSRV;
     MKFLNM;
     getinf(true);

end;
end.
