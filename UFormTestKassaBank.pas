unit UFormTestKassaBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ComCtrls;

type
  TFormTestKassaBank = class(TForm)
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ProgressBar1: TProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    lineno:Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTestKassaBank: TFormTestKassaBank;

implementation
 Uses scrdef,ScrIo,ScrUtil;

{$R *.dfm}

procedure TFormTestKassaBank.FormCreate(Sender: TObject);
begin
     StringGrid1.ColCount:=6;
     StringGrid1.RowCount:=2;
     StringGrid1.Cells[0,0]:='№ п.п.';
     StringGrid1.Cells[1,0]:='Т.н.';
     StringGrid1.Cells[2,0]:='ФИО';
     StringGrid1.Cells[3,0]:='Подр';
     StringGrid1.Cells[4,0]:='Статья';
     StringGrid1.Cells[5,0]:='Cумма';
     LineNo:=0;
end;

procedure TFormTestKassaBank.BitBtn1Click(Sender: TObject);
 var NSRVTMP,NMESTMP:Integer;
     i_nsrv:Integer;
     curr_person:PERSON_PTR;
     curr_ud:UD_PTR;
begin
     BitBtn1.Enabled:=false;
     BitBtn2.Enabled:=false;
     lineno:=0;
     StringGrid1.RowCount:=2;
     Application.ProcessMessages;
     NSRVTMP:=NSRV;
     nmesTMP:=NMES;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     for i_nsrv:=1 to Count_Serv do
         begin
              ProgressBar1.StepIt;
              Application.ProcessMessages;
              nsrv:=i_nsrv;
              mkflnm;
              if not FileExists(fninf) then Continue;
              GETINF(false);
              curr_person:=HEAD_PERSON;
              while (curr_person<>nil) do
               begin
                    curr_ud:=curr_person^.UD;
                    while (curr_ud<>nil) do
                     begin
                          if curr_ud^.SHIFR in [51, 52, 65, 86,      //Аванс бюджет    51, 52, 65, 86,
                                                80,         67,     //Аваес вне бюджет  80, 51, 65,  67,
                                                53,     69, 77,      //З п бджет         53, 67, 69, 77,
                                                91            ]      //З п вне бюджет     91, 53, 69, 52
                                                then
                          if curr_person^.bank>0 then
                             begin
                                  Inc(Lineno);
                                  StringGrid1.RowCount:=lineno+1;
                                  StringGrid1.Cells[0,lineno]:=IntToStr(lineno);
                                  StringGrid1.Cells[1,lineno]:=IntToStr(curr_person^.tabno);
                                  StringGrid1.Cells[2,lineno]:=Trim(Curr_person^.FIO);
                                  StringGrid1.Cells[3,lineno]:=IntToStr(nsrv);
                                  StringGrid1.Cells[4,lineno]:=IntToStr(curr_ud^.SHIFR);
                                  StringGrid1.Cells[5,lineno]:=FormatSummaForPlt(curr_ud^.summa);;
                                  Application.ProcessMessages;
                             end
                          else
                          else
                          if curr_ud^.SHIFR in [102,103] then
                          if curr_person^.bank<1 then
                             begin
                                  Inc(Lineno);
                                  StringGrid1.RowCount:=lineno+1;
                                  StringGrid1.Cells[0,lineno]:=IntToStr(lineno);
                                  StringGrid1.Cells[1,lineno]:=IntToStr(curr_person^.tabno);
                                  StringGrid1.Cells[2,lineno]:=Trim(Curr_person^.FIO);
                                  StringGrid1.Cells[3,lineno]:=IntToStr(nsrv);
                                  StringGrid1.Cells[4,lineno]:=IntToStr(curr_ud^.SHIFR);
                                  StringGrid1.Cells[5,lineno]:=FormatSummaForPlt(curr_ud^.summa);;
                                  Application.ProcessMessages;
                             end;
                          curr_ud:=curr_ud^.NEXT;
                     end;

                    curr_person:=curr_person^.NEXT;
               end;
              empty_all_person
         end;
     NSRV:=NSRVTMP;
     nmes:=NMESTMP;
     MKFLNM;
     GETINF(TRUE);
     if lineno=0 then
        begin
             ShowMessage('Несоответствий не найдено');
        end;
    BitBtn1.Enabled:=True;
    BitBtn2.Enabled:=true;
end;

end.
