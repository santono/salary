unit UFormTstOsnMR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls,
  frxExportTXT, frxExportXLS, frxExportHTML;

type
  TFormTstOsnMR = class(TForm)
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
  FormTstOsnMR    : TFormTstOsnMR;
  CntFormTstOsnMR : integer;


implementation
  uses ScrIo , ScrDef , ScrUtil , ScrLists , ComOBJ;

  type  PRec=^TRec;
        TRec = record
                 tabno          : integer;
                 shifrpod       : integer;
                 main           : integer;
                end;

  var List:TList;
      i_count:integer;
{$R *.dfm}

procedure TFormTstOsnMR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormTstOsnMR>0 then
         Dec(CntFormTstOsnMR);
end;

procedure TFormTstOsnMR.FormCreate(Sender: TObject);
begin
      Inc(CntFormTstOsnMR);
end;

procedure TFormTstOsnMR.Button1Click(Sender: TObject);
 var savnmes,savnsrv:integer;
     i_nsrv  : integer;
     Curr_Person : Person_Ptr;
     Rec         : PRec;
     I,JIndex    : integer;
     Dev         : TextFile;
     FName       : string;
     ShifrPod    : integer;
     NeedPut     : boolean;
 function FindInList(Tabno:integer;Main:integer):boolean;
  var RetVal:boolean;
      i:integer;
  begin
       RetVal:=false;
       if List.Count=0 then
          begin
               FindInList:=false;
               Exit;
          end;
       for i:=0 to List.Count-1 do
           begin
                 if PRec(List.Items[i]).tabno=tabno then
                    begin
                         if PRec(List.Items[i]).main<main then
                            begin
                                 PRec(List.Items[i]).main     := main;
                                 PRec(List.Items[i]).shifrpod := NSRV;
                            end;
                         RetVal:=true;
                         break;
                    end;
           end;
       FindInList:=RetVal;
  end;

 function GetMestoOsnRaboty(Tabno:integer):integer;
  var RetVal:integer;
      i:integer;
  begin
       RetVal:=0;
       if List.Count=0 then
          begin
               GetMestoOsnRaboty:=0;
               Exit;
          end;
       for i:=0 to List.Count-1 do
           begin
                 if PRec(List.Items[i]).tabno=tabno then
                    begin
                         RetVal:=PRec(List.Items[i]).shifrpod;
                         break;
                    end;
           end;
       GetMestoOsnRaboty:=RetVal;
  end;

begin
     savnmes := nmes;
     savnsrv := nsrv;
     putinf;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_Serv*2;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     List:=TList.Create;
     List.Capacity:=6000;
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
                     LabelFIO.Caption:=IntToStr(Curr_Person^.Tabno)+' '+Curr_Person^.Fio;
                     Application.ProcessMessages;
                     if Curr_Person^.Wid_Raboty=osn_wid_raboty then
                        begin
                              if not FindInList(Curr_Person^.Tabno,Curr_Person^.Main) then
                                 begin
                                      New(Rec);
                                      Rec^.tabno    := Curr_Person^.TABNO;
                                      Rec^.ShifrPod := NSRV;
                                      Rec^.Main     := Curr_Person^.Main;
                                      List.Add(Rec);
                                 end;
                        end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              EMPTY_ALL_PERSON;
         end;
     if List.Count>0 then
        begin
             for i_nsrv:=1 to count_serv do
                 begin
                      ProgressBar1.Position:=i_nsrv+count_serv;
                      nsrv:=i_nsrv;
                      mkflnm;
                      if not FileExists(fninf) then continue;
                      LabelPodr.Caption:=Name_Serv(NSRV);
                      getinf(true);
                      curr_person:=head_person;
                      NeedPut:=false;
                      while (curr_Person<>NIl) do
                            begin
                                 LabelFIO.Caption:=IntToStr(Curr_Person^.Tabno)+' '+Curr_Person^.Fio;
                                 Application.ProcessMessages;
                                 if Curr_Person^.Wid_Raboty<>osn_wid_raboty then
                                    begin
                                         ShifrPod:=GetMestoOsnRaboty(Curr_Person^.Tabno);
                                         if ShifrPod>0 then
                                            begin
                                                 if ShifrPod<>Curr_Person^.Mesto_Osn_Raboty then
                                                    begin
                                                         NeedPut:=true;
                                                         Curr_Person^.MESTO_OSN_RABOTY:=ShifrPod;
                                                         NeedPut:=true;
                                          //               ShowMessage('Подразделение='+IntToStr(NSRV)+#13+#10+
                                          //                           ' т.н.='+IntToStr(Curr_Person^.Tabno)+' ФИО='+trim(Curr_Person^.fio)+#13+#10+
                                          //                           ' нужно = '+IntToStr(ShifrPod)+', а указано = '+IntToStr(Curr_Person^.Mesto_Osn_Raboty));
                                                    end;
                                            end
                                    end;

                                 Curr_Person:=Curr_Person^.NEXT;
                            end;
                      if NeedPut then
                         PutInf;
                      EMPTY_ALL_PERSON;
                 end;
        end;



     List.Free;
     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);
     ShowMessage('Проверка закончена.');
     Self.Close;
end;




begin
  CntFormTstOsnMR:=0;

end.
