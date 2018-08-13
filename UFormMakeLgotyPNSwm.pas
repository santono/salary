unit UFormMakeLgotyPNSwm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  Buttons, StdCtrls, ComCtrls;

type
  TFormMakeLgotyPNSwm = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    LabelFIO: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormMakeLgotyPNSwm    : TFormMakeLgotyPNSwm;
  CntFormMakeLgotyPNSwm : integer;


implementation
  uses ScrIo , ScrDef , ScrUtil , ScrLists , ComOBJ, uFormMkPensList;

  type  PRecPN=^TRecPN;
        TRecPN = record
                 tabno           : integer;
                 Shifr           : Integer;
                 Summa           : Real;
                end;


  var List:TList;
      i_count:integer;
{$R *.dfm}

procedure TFormMakeLgotyPNSwm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormMakeLgotyPNSwm>0 then
         Dec(CntFormMakeLgotyPNSwm);
end;

procedure TFormMakeLgotyPNSwm.FormCreate(Sender: TObject);
begin
      Inc(CntFormMakeLgotyPNSwm);
end;

procedure TFormMakeLgotyPNSwm.Button1Click(Sender: TObject);

 var savnmes,savnsrv:integer;
     i_nsrv  : integer;
     Curr_Person : Person_Ptr;
     Curr_Cn     : Cn_ptr;
     RecPN       : PRecPN;
     I           : integer;
     Finded      : boolean;
     FindedCn    : boolean;

begin
     savnmes := nmes;
     savnsrv := nsrv;
     putinf;
     while (head_person<>nil) do del_person(Head_person);
     ProgressBar1.Max:=Count_Serv*2;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     List:=TList.Create;
     for i_nsrv:=1 to count_serv do
         begin
              ProgressBar1.Position:=i_nsrv;
              nsrv:=i_nsrv;
              mkflnm;
              if not FileExists(fninf) then continue;
              LabelPodr.Caption:=Name_Serv(NSRV);
              getinf(true);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                     if Curr_Person^.Wid_Raboty<>Osn_Wid_Raboty then
                        begin
                             Curr_Person:=Curr_Person^.NEXT;
                             Continue;
                        end;
                     LabelFIO.Caption:=IntToStr(Curr_Person^.Tabno)+' '+Curr_Person^.Fio;
                     Application.ProcessMessages;
                     Curr_Cn:=Curr_Person^.Cn;
                     while (Curr_Cn<>Nil) do
                         begin
                              if (Curr_Cn^.Shifr=LgotyPN2011Shifr+Limit_Cn_Base) or
                                 (Curr_Cn^.Shifr=LgotyPN2004Shifr+Limit_Cn_Base) then
                                 begin
                                      New(RecPN);
                                      RecPN^.tabno:=Curr_Person^.TABNO;
                                      RecPN^.shifr:=Curr_Cn^.Shifr;
                                      RecPN^.summa:=Curr_Cn^.Summa;
                                      List.Add(RecPN);
                                 end;
                              Curr_Cn:=Curr_Cn^.NEXT;
                         end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              while (head_person<>nil) do del_person(Head_person);
         end;

     for i_nsrv:=1 to count_serv do
         begin
              ProgressBar1.Position:=i_nsrv+count_serv;
              nsrv:=i_nsrv;
              mkflnm;
              if not FileExists(fninf) then continue;
              LabelPodr.Caption:=Name_Serv(NSRV);
              getinf(true);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                     if Curr_Person^.Wid_Raboty=Osn_Wid_Raboty then
                        begin
                             Curr_Person:=Curr_Person^.NEXT;
                             Continue;
                        end;
                     LabelFIO.Caption:=IntToStr(Curr_Person^.Tabno)+' '+Curr_Person^.Fio;
                     Application.ProcessMessages;
                     if List.Count>0 then
                        begin
                              Finded:=false;
                              for i:=0 to List.Count-1 do
                                  if PRecPn(List.Items[i]).Tabno=Curr_Person^.TABNO then
                                      begin
                                           FindedCn:=false;
                                           Curr_Cn:=Curr_Person^.CN;
                                           while (Curr_Cn<>Nil) do
                                             begin
                                                  if (Curr_Cn^.Shifr=PRecPn(List.Items[i]).Shifr) then
                                                     begin
                                                          FindedCn:=True;
                                                          Break;
                                                     end;
                                                  Curr_Cn:=Curr_Cn^.Next;
                                             end;
                                           if not FindedCn then
                                              begin
                                                    MAKE_CN(Curr_Cn,Curr_Person);
                                                    Curr_Cn^.Shifr:=PRecPn(List.Items[i]).Shifr;
                                                    Curr_Cn^.Kod:=100;
                                                    Curr_Cn^.Summa:=PRecPn(List.Items[i]).Summa;
                                              end;

                                      end;
                        end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              PUTINF;
              while (head_person<>nil) do del_person(Head_person);
         end;

     if Assigned(List) then
        begin
             if List.Count>0 then
                for i:=0 to List.Count-1 do
                    Dispose(PRecPN(List.Items[i]));
             List.Free;
        end;

     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);
     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);
     Self.Close;
end;





begin
  CntFormMakeLgotyPNSwm:=0;
end.
