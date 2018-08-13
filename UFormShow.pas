unit UFormShow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons,ScrDef;

type
  TFormShowCalc = class(TForm)
    StringGridS: TStringGrid;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    function Execute: boolean;
    procedure FormShow(Sender: TObject);
    procedure SetCurrPerson(C_Person:Person_Ptr;
                            Podoh_Nach,Podoh_Nalog,Podoh_Ud,Add_Podoh:real;
                            Pens_Nach,Pens_Nalog,Pens_Ud,Add_Pens:real;
                            S_S_Nach,S_S_Nalog,S_S_Ud,Add_S_S:real;
                            Fond_Nach,Fond_Nalog,Fond_Ud,Add_Fond:real);

  private
     Curr_Person:Person_Ptr;
     Podoh_Nach,Podoh_Nalog,Podoh_Ud,Add_Podoh:real;
     Pens_Nach,Pens_Nalog,Pens_Ud,Add_Pens:real;
     S_S_Nach,S_S_Nalog,S_S_Ud,Add_S_S:real;
     Fond_Nach,Fond_Nalog,Fond_Ud,Add_Fond:real;

     procedure MakeGrid;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormShowCalc: TFormShowCalc;

implementation

{$R *.dfm}

procedure TFormShowCalc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormShowCalc.FormCreate(Sender: TObject);
begin
     Curr_Person:=Nil;
end;

procedure TFormShowCalc.FormShow(Sender: TObject);
begin
      StringGridS.ColCount     := 7;
      StringGridS.RowCount     := 6;
      StringGridS.ColWidths[0] := 100;
      StringGridS.Cells[0,0]   := '';
      StringGridS.Cells[0,1]   := 'Подоходн.';
      StringGridS.Cells[0,2]   := 'Пенсион.';
      StringGridS.Cells[0,3]   := 'Соц.страх.';
      StringGridS.Cells[0,4]   := 'Фонд з.';
      StringGridS.Cells[0,5]   := 'Алименты';
      StringGridS.Cells[1,0]   := 'Начислено';
      StringGridS.Cells[2,0]   := 'Больничн.';
      StringGridS.Cells[3,0]   := 'Льготы';
      StringGridS.Cells[4,0]   := 'Нужно уд';
      StringGridS.Cells[5,0]   := 'Уже уд';
      StringGridS.Cells[6,0]   := 'Разница';
      MakeGrid;

end;
procedure TFormShowCalc.SetCurrPerson(C_Person:Person_Ptr;
                            Podoh_Nach,Podoh_Nalog,Podoh_Ud,Add_Podoh:real;
                            Pens_Nach,Pens_Nalog,Pens_Ud,Add_Pens:real;
                            S_S_Nach,S_S_Nalog,S_S_Ud,Add_S_S:real;
                            Fond_Nach,Fond_Nalog,Fond_Ud,Add_Fond:real);
 begin
      Curr_Person := C_Person;
      Self.Podoh_Nach  := Podoh_Nach;
      Self.Podoh_Nalog := Podoh_Nalog;
      Self.Podoh_Ud    := Podoh_Ud;
      Self.Add_Podoh   := Add_Podoh;
      Self.Pens_Nach   := Pens_Nach;
      Self.Pens_Nalog  := Pens_Nalog;
      Self.Pens_Ud     := Pens_Ud;
      Self.Add_Pens    := Add_Pens;
      Self.S_S_Nach    := S_S_Nach;
      Self.S_S_Nalog   := S_S_Nalog;
      Self.S_S_Ud      := S_S_Ud;
      Self.Add_S_S     := Add_S_S;
      Self.Fond_Nach   := Fond_Nach;
      Self.Fond_Nalog  := Fond_Nalog;
      Self.Fond_Ud     := Fond_Ud;
      Self.Add_Fond    := Add_Fond;
      Self.Caption := Curr_Person^.FIO;
 end;

 procedure TFormShowCalc.MakeGrid;
 const F='######0.00';
 begin
      StringGridS.Cells[1,1]   := FormatFloat(F,Podoh_Nach);
      StringGridS.Cells[4,1]   := FormatFloat(F,Podoh_Nalog);
      StringGridS.Cells[5,1]   := FormatFloat(F,Podoh_Ud);
      StringGridS.Cells[6,1]   := FormatFloat(F,Add_Podoh);
      StringGridS.Cells[1,2]   := FormatFloat(F,Pens_Nach);
      StringGridS.Cells[4,2]   := FormatFloat(F,Pens_Nalog);
      StringGridS.Cells[5,2]   := FormatFloat(F,Pens_Ud);
      StringGridS.Cells[6,2]   := FormatFloat(F,Add_Pens);
      StringGridS.Cells[1,3]   := FormatFloat(F,S_S_Nach);
      StringGridS.Cells[4,3]   := FormatFloat(F,S_S_Nalog);
      StringGridS.Cells[5,3]   := FormatFloat(F,S_S_Ud);
      StringGridS.Cells[6,3]   := FormatFloat(F,Add_S_S);
      StringGridS.Cells[1,4]   := FormatFloat(F,Fond_Nach);
      StringGridS.Cells[4,4]   := FormatFloat(F,Fond_Nalog);
      StringGridS.Cells[5,4]   := FormatFloat(F,Fond_Ud);
      StringGridS.Cells[6,4]   := FormatFloat(F,Add_Fond);
 end;

function TFormShowCalc.Execute: boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;


end.
