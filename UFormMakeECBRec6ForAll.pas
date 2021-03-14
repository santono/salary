unit UFormMakeECBRec6ForAll;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls;

type
  TFormMakeECBRec6ForAll = class(TForm)
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    LabelFio: TLabel;
    LabelPodr: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure makeAllRecECBTable6Recs;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMakeECBRec6ForAll: TFormMakeECBRec6ForAll;

implementation
  uses scrdef,ScrIo,ScrUtil,screcb,ScrECBService;

{$R *.dfm}



procedure TFormMakeECBRec6ForAll.makeAllRecECBTable6Recs;
 var savNMES,savNSRV,iNSRV:Integer;
     curr_person:PERSON_PTR;
     personRec6Service:TpersonRec6Service;
 begin
      savNMES:=NMES;
      savNSRV:=NSRV;
      EMPTY_ALL_PERSON;
      ProgressBar1.Position:=0;
      ProgressBar1.MIN:=0;
      ProgressBar1.MAX:=Count_Serv;
      LabelFio.Caption:='';
      LabelPodr.Caption:='';
      Application.ProcessMessages;
      for iNSRV:=1 to Count_Serv do
        begin
             ProgressBar1.Position:=iNSRV;
             LabelPodr.Caption:=Name_Serv(iNSRV);
             Application.ProcessMessages;
             if iNSRV = 82 then Continue;
             NSRV:=iNSRV;
             MKFLNM;
             if not FileExists(FNINF) then continue;
             GETINF(true);
             curr_person:=HEAD_PERSON;
             while curr_person<>nil do
              begin
                   if curr_person.add<>nil then
                      begin
                           LabelFio.Caption:=curr_person^.fio;
                           Application.ProcessMessages;
                           personRec6Service:=TPersonRec6Service.init(Curr_person);
                           personRec6Service.fillRec6Person;
                           personRec6Service.free;
                      end;
                   curr_person:=curr_person^.NEXT;
              end;
             PUTINF;
             EMPTY_ALL_PERSON;
        end;

      NMES:=savNMES;
      NSRV:=savNSRV;
      MKFLNM;
      GETINF(true);
      ShowMessage('Записи созданы');

 end;



procedure TFormMakeECBRec6ForAll.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TFormMakeECBRec6ForAll.BitBtn1Click(Sender: TObject);
begin
     if YesNo('Добавить записи классификации таблицы 6 отчета по ЕСВ каждому сотруднику?') then
        begin
             makeAllRecECBTable6Recs;
             Self.Close;
        end;     
end;

end.
