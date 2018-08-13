unit uFormTestBoln;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TFormTestBoln = class(TForm)
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTestBoln: TFormTestBoln;

implementation
  uses ScrDef,ScrUtil,ScrIo;
{$R *.dfm}

procedure TFormTestBoln.BitBtn1Click(Sender: TObject);
var nmes_save,nsrv_save:integer;
    summa:real;
    i:integer;
    Curr_Person:Person_Ptr;
    Curr_Add:Add_Ptr;
begin
    nsrv_save:=nsrv;
    nmes_save:=nmes;
    putinf;
    while (head_person<>Nil) do Del_person(Head_Person);
    summa:=0;
    for i:=1 to count_serv do
        begin
              nsrv:=i;
              mkflnm;
              if  not FileExists(FNINF) then continue;
              getinf(true);
              Curr_person:=head_person;
              while (Curr_Person<>NIl) do
               begin
                     curr_add:=curr_person^.Add;
                     while (Curr_Add<>Nil) do
                      begin
                            if ((Curr_Add^.Shifr=13) or
                                (Curr_Add^.Shifr=14)) then
                                Summa:=Summa+Curr_Add^.summa;
                            Curr_Add:=Curr_Add^.Next;
                      end;
                     Curr_Person:=Curr_Person^.Next;
               end;
              while (head_person<>Nil) do Del_person(Head_Person);
        end;
    nsrv:=nsrv_save;
    MKFLNM;
    getinf(True);
    ShowMessage(Format('%12.2f',[summa]));

end;

end.
