unit UFormSaveAwans;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons;

type
  TFormSaveAwans = class(TForm)
    EditName: TEdit;
    Label1: TLabel;
    BitBtnSave: TBitBtn;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    LabelPodr: TLabel;
    BitBtn2: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    procedure SaveAwans;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSaveAwans: TFormSaveAwans;

implementation
 uses uSQLUnit,uFIBModule,scrUtil,scrdef,scrIO,scrlists, UFormSelPKG;

{$R *.dfm}

procedure TFormSaveAwans.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormSaveAwans.FormCreate(Sender: TObject);
begin
     LabelPodr.Caption:='';
     EditName.Text:='';
     shifrList.ClearAllSelected;
end;

procedure TFormSaveAwans.BitBtnSaveClick(Sender: TObject);
begin
     SaveAwans;
end;
procedure TFormSaveAwans.SaveAwans;
 var sqlStmnt:string;
     v:variant;
     id:integer;
     iddet:integer;
     tmpNSRV,tmpNMES:integer;
     i_nsrv:integer;
     curr_person:person_ptr;
     curr_ud:ud_ptr;
     s:string;

 begin
     if (length(trim(EditName.Text))<5) then
        begin
             showMessage('Укажите название');
             exit;
        end;
     if (shifrList.CountSelected<1) then
        begin
             showMessage('Не указаны статьи выплат');
             exit;
        end;
     sqlStmnt:='select count(*) from tb_saved_awans_hat';
     v:=SQLQueryValue(sqlStmnt);
     id:=v;
     if id>0 then
        begin
             sqlStmnt:='select max(shifrid) from tb_saved_awans_hat';
             v:=SQLQueryValue(sqlStmnt);
             id:=v;
        end
     else
        id:=0;
     inc(id);
     sqlStmnt:='insert into tb_saved_awans_hat (shifrid,name,yearvy,monthvy) values (';
     sqlStmnt:=sqlStmnt+intToStr(id)+',';
     sqlStmnt:=sqlStmnt+''''+trim(EditName.Text)+''',';
     sqlStmnt:=sqlStmnt+intToStr(CurrentYear)+',';
     sqlStmnt:=sqlStmnt+intToStr(NMES)+')';
     SQLExecute(sqlStmnt);
     sqlStmnt:='select count(*) from tb_saved_awans_det';
     v:=SQLQueryValue(sqlStmnt);
     iddet:=v;
     if iddet>0 then
        begin
             sqlStmnt:='select max(shifrid) from tb_saved_awans_det';
             v:=SQLQueryValue(sqlStmnt);
             iddet:=v;
        end
     else
        iddet:=0;
//     inc(iddet);
     tmpNSRV:=NSRV;
     putinf;
     empty_all_person;
     ProgressBar1.Min      := 0;
     progressBar1.Max      := count_serv;
     progressBar1.Position := 0;
     ProgressBar1.Step     := 1;
     for i_nsrv:=1 to count_serv do
       begin
            LabelPodr.Caption:=Name_Serv(i_nsrv);
            progressBar1.StepIt;
            application.ProcessMessages;
            nsrv:=i_nsrv;
            mkflnm;
            if not fileexists(fninf) then continue;
            getinf(false);
            curr_person:=head_person;
            while (curr_person<>nil) do
              begin
                   curr_ud:=curr_person^.ud;
                   while (curr_ud<>nil) do
                     begin
                          if (curr_ud.VYPLACHENO=get_out) then
                          if shifrList.IsSelected(curr_ud.shifr) then
                             begin
                                  inc(iddet);
                                  sqlStmnt:='insert into tb_saved_awans_det values(';
                                  sqlStmnt:=sqlStmnt+intToStr(iddet)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(id)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(curr_person^.tabno)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(NSRV)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(curr_person^.wid_raboty)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(curr_person^.GRUPPA)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(curr_person^.KATEGORIJA)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(curr_UD^.SHIFR)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(curr_UD^.period)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(curr_UD^.YEAR+1990)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(NMES)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(CURRYEAR)+',';
                                  s:=FormatFloatPoint(curr_ud^.summa);
                                  sqlStmnt:=sqlStmnt+trim(s)+',';
                                  sqlStmnt:=sqlStmnt+intToStr(curr_UD^.VYPLACHENO)+',';
                                  sqlStmnt:=sqlStmnt+''''+trim(curr_UD^.COUNT)+''')';
                                  SQLExecute(sqlStmnt);
                             end;
                          curr_ud:=curr_ud^.NEXT;
                     end;
                   curr_person:=curr_person^.NEXT;
              end;
            EMPTY_ALL_PERSON;

       end;
     NSRV:=tmpNSRV;
     MKFLNM;
     GETINF(true);
 end;

procedure TFormSaveAwans.BitBtn2Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

end.
