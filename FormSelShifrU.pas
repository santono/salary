unit FormSelShifrU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ComCtrls;

type
  TShowShifrMode=(AddMode,UdMode,AllMode);
  TFormSelShifr = class(TForm)
    PageControl1: TPageControl;
    TabAdd: TTabSheet;
    TabUd: TTabSheet;
    StringGridAdd: TStringGrid;
    StringGridUd: TStringGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure StringGridAddDblClick(Sender: TObject);
    procedure StringGridUdDblClick(Sender: TObject);
    procedure SetShifr(I:Integer;A:TShowShifrMode);
    function GetShifr(var A:TShowShifrMode):Integer;
    function Execute: boolean;
    procedure StringGridAddDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridUdDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SetUpFocus;
    procedure StringGridAddKeyPress(Sender: TObject; var Key: Char);
    procedure StringGridUdKeyPress(Sender: TObject; var Key: Char);
  private
    Locator       : integer;
    SelectedShifr : integer;
    SelectedMode  : TShowShifrMode;
    MinShifrAdd,MaxSHifrAdd,MinShifrUd,MaxShifrUd:integer;
    procedure MakeGrid;
    procedure LocateAdd;
    procedure LocateUd;
    procedure FocusRowAdd;
    procedure FocusRowUd;
    procedure FocusRow;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSelShifr: TFormSelShifr;

implementation
 uses ScrLists,ScrUtil,ScrDef;

{$R *.dfm}

procedure TFormSelShifr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//     Action:=caFree;
end;

procedure TFormSelShifr.FormCreate(Sender: TObject);
begin
      Locator       := 0;
      SelectedShifr := 0;
      SelectedMode  := AllMode;
      MinShifrAdd   := $FFFF;
      MaxSHifrAdd   := 0;
      MinShifrUd    := $FFFF;
      MaxShifrUd    := 0;
end;

procedure TFormSelShifr.MakeGrid;
var I_A,I_U,I,I_Row : Integer;
    ShifrSta : integer;
begin
     I_A:=0;
     I_U:=0;
     for i:=0 to ShifrList.Count-1 do
          if ShifrList.IsAddByNo(i+1) then inc(i_a) else inc(i_u);
     StringGridAdd.RowCount     := i_a+1;
     StringGridAdd.ColCount     := 2;
     StringGridUd.RowCount      := i_u+1;
     StringGridUd.ColCount      := 2;
     StringGridAdd.Cells[0,0]   := 'Шифр';
     StringGridAdd.Cells[1,0]   := 'Название';
     StringGridUd.Cells[0,0]    := 'Шифр';
     StringGridUd.Cells[1,0]    := 'Название';
     StringGridAdd.ColWidths[0] :=  50;
     StringGridAdd.ColWidths[1] := 300;
     StringGridUd.ColWidths[0]  :=  50;
     StringGridUd.ColWidths[1]  := 300;
{
     StringGridUd.Width         := StringGridUd.ColWidths[0]  + StringGridUd.ColWidths[1]  + 50;
     StringGridAdd.Width        := StringGridAdd.ColWidths[0] + StringGridAdd.ColWidths[1] + 50;
     TabAdd.Width               := StringGridAdd.Width + 50;
     TabUd.Width                := StringGridUd.Width  + 50;
     PageControl1.Width         := TabAdd.Width+10;
     Self.Width                 := PageControl1.Width+50;
}
     i_Row:=0;
     if i_a>0 then
        for i:=1 to ShifrList.Count do
            begin
                 if not ShifrList.IsAddByNo(i) then continue;
                 ShifrSta := ShifrList.GetShifrByNo(i);
                 if MinShifrAdd > ShifrSta then
                    MinShifrAdd := ShifrSta;
                 if MaxShifrAdd < ShifrSta then
                    MaxShifrAdd := ShifrSta;
                 Inc(I_Row);
                 StringGridAdd.Cells[0,i_Row]:=IntToStr(ShifrSta);
                 StringGridAdd.Cells[1,i_Row]:=GetNameShifrByNo(i)
            end;
     i_Row:=0;
     if i_u>0 then
        for i:=1 to ShifrList.Count do
            begin
                 if ShifrList.IsAddByNo(i) then continue;
                 inc(I_Row);
                 ShifrSta := ShifrList.GetShifrByNo(i);
                 if MinShifrUd > ShifrSta then
                    MinShifrUd := ShifrSta;
                 if MaxShifrUd < ShifrSta then
                    MaxShifrUd := ShifrSta;
                 StringGridUd.Cells[0,i_Row] := IntToStr(ShifrSta);
                 StringGridUd.Cells[1,i_Row] := GetNameShifrByNo(i)
            end;
end;


procedure TFormSelShifr.SetUpFocus;
 var i,j,k:integer;
 begin
     if not Self.Visible then Exit;
     if not Self.Enabled then Exit;
     Self.SetFocus;
     PageControl1.SetFocus;
     if SelectedShifr>0 then
        if (SelectedMode=AddMode) or
           ((SelectedMode=AllMode) and (ShifrList.IsAdd(SelectedShifr)))  then
           begin
                PageControl1.ActivePage:=TabAdd;
                StringGridAdd.SetFocus;
                for i:=1 to StringGridAdd.RowCount-1 do
                    begin
                         val(StringGridAdd.Cells[0,i],j,k);
                         if k=0 then
                            if J=SelectedShifr then
                               StringGridAdd.Row:=i;
                    end;
           end
                       else
        if (SelectedMode=UdMode) or
           ((SelectedMode=AllMode) and (not ShifrList.IsAdd(SelectedShifr)))  then
           begin
                PageControl1.ActivePage:=TabUd;
                StringGridUd.SetFocus;
                for i:=1 to StringGridUd.RowCount-1 do
                    begin
                         val(StringGridUd.Cells[0,i],j,k);
                         if k=0 then
                            if J=SelectedShifr then
                               StringGridUd.Row:=i;
                    end;
           end;

 end;
procedure TFormSelShifr.FormShow(Sender: TObject);
begin
{
     TabAdd.Width := StringGridAdd.Width + 20;
     TabUd.Width  := StringGridUd.Width  + 20;
     PageControl1.Width:=TabAdd.Width;
     if PageControl1.Width<TabUd.Width then
        PageControl1.Width:=TabUd.Width;
     Self.Width:=PageControl1.Width+20;
}

     Locator := 0;
     Self.MakeGrid;
     if Self.Enabled then
     if Self.Visible then
         Self.SetUpFocus;

end;

procedure TFormSelShifr.StringGridAddDblClick(Sender: TObject);
var S:String;
    i,k:integer;
begin
     S:=StringGridAdd.Cells[0,StringGridAdd.Row];
     val(S,I,K);
     SelectedShifr:=0;
     SelectedMode:=AddMode;
     if k=0 then SelectedShifr:=I;
     ModalResult:=mrOk;
end;

procedure TFormSelShifr.StringGridUdDblClick(Sender: TObject);
var S:String;
    i,k:integer;
begin
     S:=StringGridUd.Cells[0,StringGridUd.Row];
     val(S,I,K);
     SelectedShifr:=0;
     SelectedMode:=UdMode;
     if k=0 then SelectedShifr:=I;
     ModalResult:=mrOk;
end;

function TFormSelShifr.Execute: boolean;
begin
{  Self.visible:=false;   }
{   Self.SetUpFocus;   }
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;
procedure TFormSelShifr.SetShifr(I:Integer;a:TShowShifrMode);
 begin
       SelectedShifr := I;
       SelectedMode  := a;
       if SelectedMode=AddMode then
          begin
               TabUd.TabVisible:=false;
               TabAdd.TabVisible:=true;
          end
                      else
      if SelectedMode=UdMode then
          begin
               TabUd.TabVisible:=true;
               TabAdd.TabVisible:=false;
          end
                      else
          begin
               TabUd.TabVisible:=true;
               TabAdd.TabVisible:=true;
          end;

 end;

function TFormSelShifr.GetShifr(var A:TShowShifrMode):integer;
 begin
       A:=SelectedMode;
       Result:=SelectedShifr;
 end;


procedure TFormSelShifr.StringGridAddDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var i,k:integer;
    vRow,vCol:integer;
    a:double;
    S:String;
    Shift:integer;
begin
      i:=1;
      vRow:=aRow;
      vCol:=aCol;
      S:=StringGridAdd.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                if (vRow>0) and (vCol>0) then
                if (gdSelected in State) and (Sender = ActiveControl) then
                   begin
                       Brush.Color := clHighlight;
                       Font.Color  := clHighlightText;
                   end
                                         else
                if (gdFixed in State) and (Sender = ActiveControl ) then
                   begin
                    Brush.Color := FixedColor;
                    Font.Color  := clHighlightText;
                   end
                                         else
                    begin
                         Brush.Color := Color;
                         Font.Color  := clWindowText;
                    end;
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vCol=0) then
                    begin
                         SetTextAlign(Handle, TA_RIGHT);
                         if vCol>1 then Shift:=10
                                   else Shift:= 8;
                         TextOut(Rect.Right-Shift, Rect.Top+2, S);
                    end
                         else
                    begin
                         SetTextAlign(Handle, TA_LEFT);
                         TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;

           end;
end;

procedure TFormSelShifr.StringGridUdDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var i,k:integer;
    vRow,vCol:integer;
    a:double;
    S:String;
    Shift:integer;
begin
      i:=1;
      vRow:=aRow;
      vCol:=aCol;
      S:=StringGridUd.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                if (vRow>0) and (vCol>0) then
                if (gdSelected in State) and (Sender = ActiveControl) then
                   begin
                       Brush.Color := clHighlight;
                       Font.Color  := clHighlightText;
                   end
                                         else
                if (gdFixed in State) and (Sender = ActiveControl ) then
                   begin
                    Brush.Color := FixedColor;
                    Font.Color  := clHighlightText;
                   end
                                         else
                    begin
                         Brush.Color := Color;
                         Font.Color  := clWindowText;
                    end;
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vCol=0) then
                    begin
                         SetTextAlign(Handle, TA_RIGHT);
                         if vCol>1 then Shift:=10
                                   else Shift:= 8;
                         TextOut(Rect.Right-Shift, Rect.Top+2, S);
                    end
                         else
                    begin
                         SetTextAlign(Handle, TA_LEFT);
                         TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;

           end;


end;

procedure TFormSelShifr.StringGridAddKeyPress(Sender: TObject;
  var Key: Char);
 var i,j:integer;
begin
      i:=ord(Key);
      if not ((key in ['0'..'9']) or (i=8) or (i=13)) then Exit;
      if (i=13) then
         begin
              StringGridAddDblClick(Sender);
              Exit;
         end
      else
          if (i=8) and (Locator>0) then
              begin
                   Locator:=Locator div 10;
        {        if Locator<1 then Locator:=0;}
                   LocateAdd;
              end
          else
              begin
                  if Locator>MaxShifrAdd then Exit;
                  if key in ['0'..'9'] then
                     begin
                          val(Key,i,j);
                          Locator := Locator*10 + i;
                          LocateAdd;
                     end;
          end;

end;

procedure TFormSelShifr.LocateAdd;
begin
      if (Locator>=MinShifrAdd) and (Locator<=MaxShifrAdd)then
         begin
              if Locator=0 then SetShifr(1,SelectedMode)
                           else SetShifr(Locator,SelectedMode);
              FocusRow;
              Application.ProcessMessages;
         end;
end;


procedure TFormSelShifr.FocusRow;
 begin
      if SelectedMode = AddMode  then
         FocusRowAdd
      else
         FocusRowUd;
 end;

procedure TFormSelShifr.FocusRowAdd;
 var i:integer;
 begin
     if SelectedShifr>0 then
        begin
             for i:=1 to StringGridAdd.RowCount do
                 begin
                       if AllTrim(StringGridAdd.Cells[0,i])=AllTrim(IntToStr(SelectedShifr)) then
                          begin
                               StringGridAdd.Row:=I;
                               Exit;
                          end;
                 end;
        end;
 end;

procedure TFormSelShifr.FocusRowUd;
 var i:integer;
 begin
     if SelectedShifr>0 then
        begin
             for i:=1 to StringGridUd.RowCount do
                 begin
                       if AllTrim(StringGridUd.Cells[0,i])=AllTrim(IntToStr(SelectedShifr)) then
                          begin
                               StringGridUd.Row:=I;
                               Exit;
                          end;
                 end;
        end;
 end;

procedure TFormSelShifr.StringGridUdKeyPress(Sender: TObject;
  var Key: Char);
 var i,j:integer;
begin
      i:=ord(Key);
      if not ((key in ['0'..'9']) or (i=8) or (i=13)) then Exit;
      if (i=13) then
         begin
              StringGridUdDblClick(Sender);
              Exit;
         end
      else
          if (i=8) and (Locator>0) then
              begin
                   Locator:=Locator div 10;
        {        if Locator<1 then Locator:=0;}
                   LocateUd;
              end
          else
              begin
                  if Locator>MaxShifrUd then Exit;
                  if key in ['0'..'9'] then
                     begin
                          val(Key,i,j);
                          Locator := Locator*10 + i;
                          LocateUd;
                     end;
          end;
end;

procedure TFormSelShifr.LocateUd;
begin
      if (Locator>=MinShifrUd) and (Locator<=MaxShifrUd)then
         begin
              if Locator=0 then SetShifr(MinShifrUd,SelectedMode)
                           else SetShifr(Locator,SelectedMode);
              FocusRow;
              Application.ProcessMessages;
         end;
end;


end.
