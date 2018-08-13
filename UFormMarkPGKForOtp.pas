unit UFormMarkPGKForOtp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids;

type
  TFormMarkPGKForOtp = class(TForm)
    PageControl1: TPageControl;
    TabSheetPodr: TTabSheet;
    TabSheetKat: TTabSheet;
    TabSheetGru: TTabSheet;
    StringGridPodr: TStringGrid;
    BitBtn1: TBitBtn;
    StringGridKat: TStringGrid;
    StringGridGru: TStringGrid;
    Label1: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StringGridGruDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridPodrDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridPodrDblClick(Sender: TObject);
    procedure StringGridGruDblClick(Sender: TObject);
    procedure StringGridKatDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridKatDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FillGrids;
    { Public declarations }
  end;

var
  FormMarkPGKForOtp: TFormMarkPGKForOtp;

implementation
  uses USelLists;

{$R *.dfm}

procedure TFormMarkPGKForOtp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormMarkPGKForOtp.FillGrids;
 var i:integer;
     ShifrId:integer;
     name:String;
 begin
      StringGridPodr.ColCount:=3;
      StringGridPodr.RowCount:=PodrSelOtpList.Count+1;
      StringGridPodr.Cells[1,0]   := 'Шфр';
      StringGridPodr.Cells[2,0]   := 'Название';
      StringGridPodr.ColWidths[0] :=  35;
      StringGridPodr.ColWidths[1] :=  35;
      StringGridPodr.ColWidths[2] := 400;
      for i:=0 to PodrSelOtpList.Count-1 do
          begin
               PodrSelOtpList.GetItem(i,ShifrId,name);
               StringGridPodr.Cells[1,i+1]:=FORMAT('%3d',[ShifrId]);
               StringGridPodr.Cells[2,i+1]:=Name;
          end;
      StringGridKat.ColCount:=3;
      StringGridKat.RowCount:=KategSelOtpList.Count+1;
      StringGridKat.Cells[1,0]   := 'Шфр';
      StringGridKat.Cells[2,0]   := 'Название';
      StringGridKat.ColWidths[0] :=  35;
      StringGridKat.ColWidths[1] :=  35;
      StringGridKat.ColWidths[2] := 400;
      for i:=0 to KategSelOtpList.Count-1 do
          begin
               KategSelOtpList.GetItem(i,ShifrId,name);
               StringGridKat.Cells[1,i+1]:=FORMAT('%3d',[ShifrId]);
               StringGridKat.Cells[2,i+1]:=Name;
          end;
      StringGridGru.ColCount:=3;
      StringGridGru.RowCount:=GruppySelOtpList.Count+1;
      StringGridGru.Cells[1,0]   := 'Шфр';
      StringGridGru.Cells[2,0]   := 'Название';
      StringGridGru.ColWidths[0] :=  35;
      StringGridGru.ColWidths[1] :=  35;
      StringGridGru.ColWidths[2] := 400;
      for i:=0 to GruppySelOtpList.Count-1 do
          begin
               GruppySelOtpList.GetItem(i,ShifrId,name);
               StringGridGru.Cells[1,i+1]:=FORMAT('%3d',[ShifrId]);
               StringGridGru.Cells[2,i+1]:=Name;
          end;
 end;
procedure TFormMarkPGKForOtp.FormShow(Sender: TObject);
begin
      FillGrids;
end;

procedure TFormMarkPGKForOtp.StringGridGruDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol     : integer;
    S             : String;
    Shift         : integer;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
begin
      vRow := aRow ;
      vCol := aCol ;
      S    := StringGridGru.Cells[vCol,vRow];
      if vCol<>0 then Exit;
      with Sender as TStringGrid, Canvas do
           begin
                OldFontColor  := Font.Color;
                OldBrushColor := Brush.Color;
                if GruppySelOtpList.IsSelected(vRow-1) then
                   Brush.Color := clLime;
                FillRect(Rect);
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;
end;

procedure TFormMarkPGKForOtp.StringGridPodrDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol     : integer;
    S             : String;
    Shift         : integer;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
 begin
      vRow := aRow ;
      vCol := aCol ;
      S    := StringGridPodr.Cells[vCol,vRow];
      if vCol<>0 then Exit;
      if vRow=0 then Exit;
      with Sender as TStringGrid, Canvas do
           begin
                if vRow=1 then
                   vRow:=1;
                OldFontColor  := Font.Color;
                OldBrushColor := Brush.Color;
                if PodrSelOtpList.IsSelected(vRow-1) then
                   Brush.Color := clLime;
                FillRect(Rect);
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;
 end;
procedure TFormMarkPGKForOtp.StringGridPodrDblClick(Sender: TObject);
var ItemNo : integer;
begin
     if StringGridPodr.Row>0 then
        begin
            ItemNo:=StringGridPodr.Row-1;
            PodrSelOtpList.MarkItem(ItemNo);
            StringGridPodr.Repaint;
        end;
end;

procedure TFormMarkPGKForOtp.StringGridGruDblClick(Sender: TObject);
var ItemNo : integer;
begin
     if StringGridGru.Row>0 then
        begin
            ItemNo:=StringGridGru.Row-1;
            GruppySelOtpList.MarkItem(ItemNo);
            StringGridGru.Repaint;
        end;
end;

procedure TFormMarkPGKForOtp.StringGridKatDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var ItemNo : integer;
var
    vRow,vCol     : integer;
    S             : String;
    Shift         : integer;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
 begin
      vRow := aRow ;
      vCol := aCol ;
      S    := StringGridKat.Cells[vCol,vRow];
      if vCol<>0 then Exit;
      if vRow=0 then Exit;
      with Sender as TStringGrid, Canvas do
           begin
                if vRow=1 then
                   vRow:=1;
                OldFontColor  := Font.Color;
                OldBrushColor := Brush.Color;
                if KategSelOtpList.IsSelected(vRow-1) then
                   Brush.Color := clLime;
                FillRect(Rect);
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;
 end;



procedure TFormMarkPGKForOtp.StringGridKatDblClick(Sender: TObject);
var ItemNo : integer;
begin

     if StringGridKat.Row>0 then
        begin
            ItemNo:=StringGridKat.Row-1;
            KategSelOtpList.MarkItem(ItemNo);
            StringGridKat.Repaint;
        end;

end;

end.
