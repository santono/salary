{$WARNINGS OFF}
{$HINTS OFF}
unit FormKadryClU;

interface                   

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, Menus;

type
  TFormKadryCl = class(TForm)
    BitBtn1 : TBitBtn;
    StringGridKadry : TStringGrid;
    PopupMenu1 : TPopupMenu;
    Find : TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StringGridKadryDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridKadryMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    function Execute: boolean;
    function GetParPerson(var Tabno:integer;var Fio:string;var NalCode:String;var WorkPlace:integer;var RecNo:Integer):boolean;
    procedure StringGridKadryDblClick(Sender: TObject);
    procedure FindClick(Sender: TObject);
  private
    { Private declarations }
    SavTabno     : Integer;
    SavFio       : String;
    SavNalCode   : String;
    SavWorkPlace : Integer;
    SavRecNo     : Integer;

    procedure MakeGrid;
    Procedure FindRow(WantedVal:string;WantedCol:Integer);


  public
    { Public declarations }
  end;

var
  FormKadryCl: TFormKadryCl;

implementation
 uses KadClU,FormKadryFindU,ScrUtil;
 var
     KadryClarion:TKadryClarion;

{$R *.dfm}

procedure TFormKadryCl.BitBtn1Click(Sender: TObject);
begin
     ModalResult:=mrOk;
end;

procedure TFormKadryCl.FormClose(Sender: TObject;
  var Action: TCloseAction);
 var i:integer;
     KadryRec:PKadryRec;
begin
      i:=0;
      try
      if Assigned(KadryList) then
        begin
             if KadryList.Count>0 then
                begin
                     KadryRec     := KadryList.Items[StringGridKadry.Row-1];
                     SavTabno     := KadryRec^.Tabno     ;
                     SavFio       := KadryRec^.Fio       ;
                     SavNalCode   := KadryRec^.NalCode   ;
                     SavWorkPlace := KadryRec^.WorkPlace ;
                     SavRecNo     := KadryRec^.RecNo     ;
                     for i:=0 to KadryList.Count-1 do
                         begin
                               KadryRec:=KadryList.Items[i];
                               Dispose(KadryRec);
                         end;
                end;
             KadryList.Free;
             KadryList:=nil;
        end;
      finally
          i:=i;
      end
{     Action:=caFree; }
end;

procedure TFormKadryCl.FormShow(Sender: TObject);
begin
     StringGridKadry.ColCount:=4;
     StringGridKadry.ColWidths[0]:=60;
     StringGridKadry.ColWidths[1]:=60;     
     StringGridKadry.ColWidths[2]:=350;
     StringGridKadry.ColWidths[3]:=150;
     StringGridKadry.Cells[0,0]:='Т.н.';
     StringGridKadry.Cells[1,0]:='Подр.';
     StringGridKadry.Cells[2,0]:='Фамилия И О';
     StringGridKadry.Cells[3,0]:='Ид.код';
     StringGridKadry.RowCount:=KadryList.Count+1;
     MakeGrid;
end;
Procedure TFormKadryCl.MakeGrid;
 var i:integer;
 begin
     for i:=1 to KadryList.Count do
         begin
              StringGridKadry.Cells[0,i]:=IntToStr(PKadryRec(KadryList.Items[i-1])^.Tabno);
              StringGridKadry.Cells[1,i]:=IntToStr(PKadryRec(KadryList.Items[i-1])^.WorkPlace);
              StringGridKadry.Cells[2,i]:=PKadryRec(KadryList.Items[i-1])^.Fio;
              StringGridKadry.Cells[3,i]:=PKadryRec(KadryList.Items[i-1])^.NalCode;
         end;
 end;
procedure TFormKadryCl.FormCreate(Sender: TObject);
begin
     KadryClarion:=TKadryClarion.Create('CKADRY.DAT');
     if Assigned(KadryClarion) then
        begin
             KadryClarion.FillKadryList;
             KadryClarion.Free;
        end;
     SavTabno     := 0  ;
     SavFio       := '' ;
     SavNalCode   := '' ;
     SavWorkPlace := 0  ;
     SavRecNo     := 0  ;
end;

procedure TFormKadryCl.StringGridKadryDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol:integer;
    S:String;
    Shift:integer;
begin
      vRow:=aRow;
      vCol:=aCol;
      if vRow<1 then Exit;
      S:=StringGridKadry.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                if (gdSelected in State) {and (Sender = ActiveControl)} then
                   begin
                        Brush.Color := clHighlight;
                        Font.Color  := clHighlightText;
                   end
                                         else
                if (gdFixed in State){ and (Sender = ActiveControl )} then
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
                if (vCol<2)  then
                    begin
                         SetTextAlign(Handle, TA_RIGHT);
                         Shift:= 5;
                         TextOut(Rect.Right-Shift, Rect.Top+2, S);
                    end
                         else
                    begin
                         SetTextAlign(Handle, TA_LEFT);
                         TextRect(Rect, Rect.Left+5, Rect.Top, S);
                    end;

           end;

end;

procedure TFormKadryCl.StringGridKadryMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row : Longint;

begin
  StringGridKadry.MouseToCell(X, Y, Column, Row);
  if (Row<1) then
     if (Column=0) then
        begin
             KadryList.Sort(CompareTabno);
             MakeGrid;
             Repaint;
        end
                   else
     if (Column=1) then
        begin
             KadryList.Sort(CompareWorkPlace);
             MakeGrid;
             Repaint;
        end
                   else
     if (Column=2) then
        begin
             KadryList.Sort(CompareFio);
             MakeGrid;
             Repaint;
        end
                   else
     if (Column=3) then
        begin
             KadryList.Sort(CompareNalCode);
             MakeGrid;
             Repaint;
        end
  end;
function TFormKadryCl.Execute: boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;

function TFormKadryCl.GetParPerson(var Tabno:integer;var Fio:string;var NalCode:String;var WorkPlace:integer;var RecNo:Integer):boolean;
 var I : integer;
 begin
      Result:=false;
      I := StringGridKadry.Row;
      if (i>0) then
          begin
               Tabno     := SavTabno     ;
               Fio       := SavFio       ;
               NalCode   := SavNalCode   ;
               WorkPlace := SavWorkPlace ;
               RecNo     := SavRecNo     ;
               Result    := true         ;
          end;
 end;

procedure TFormKadryCl.StringGridKadryDblClick(Sender: TObject);
begin
{     ModalResult:=mrOk;}
{     FormClose;        }
end;

procedure TFormKadryCl.FindClick(Sender: TObject);
var RetVal:Integer;
    WantedVal:String;
    WantedCol:integer;
begin
         Application.CreateForm(TFormFindKadry,FormFindKadry);
         try
             if FormFindKadry.Execute(RetVal) then
              begin
                   FormFindKadry.GetPar(WantedVal,WantedCol);
                   FindRow(WantedVal,WantedCol);
              end
        finally
          if Assigned(FormFindKadry) then
             FormFindKadry.free;
     end;
  {
          with TFormFindKadry.Create(nil) do
        try
            if execute(RetVal) then
              begin
                   GetPar(WantedVal,WantedCol);
                   Self.FindRow(WantedVal,WantedCol);
              end
        finally
          free;
     end;
     }
end;

Procedure TFormKadryCl.FindRow(WantedVal:string;WantedCol:Integer);
var SS : String;
    I,J,K,L:Integer;
    Finded:boolean;
    RowSv:integer;
  begin
     RowSv := StringGridKadry.Row;
     Finded:=false;
     if ((WantedCol=0) or (WantedCol=3)) then
        begin
              Val(WantedVal,I,J);
              if j<>0 then Exit;
        end;
     for j:=1 to StringGridKadry.RowCount do
         begin
               if WantedCol=0 then
                  begin
                        val(StringGridKadry.Cells[WantedCol,J],K,L);
                        if K=i then
                           begin
                                StringGridKadry.Row:=J;
                                Finded:=True;
                                break;
                           end;
                  end
                        else
               if WantedCol=3 then
                  begin
                       SS:=Trim(StringGridKadry.Cells[WantedCol,J]);
                       if Length(SS)<>10 then continue;
                       if Trim(WantedVal)=SS then
                          begin
                                StringGridKadry.Row:=J;
                                Finded:=True;
                                break;
                          end;
                  end
                        else
               if WantedCol=2 then
                  begin
                       SS:=Trim(StringGridKadry.Cells[WantedCol,J]);
                       if Length(SS)<1 then continue;
                       SS:=Upper_String(SS);
                       if POS(Upper_String(WantedVal),SS)=1 then
                          begin
                                StringGridKadry.Row:=J;
                                Finded:=True;
                                break;
                          end;
                  end
         end;

     if Not Finded then
        begin
             ShowMessage('Не найден сотрудник');
             StringGridKadry.Row:=RowSv;
        end;     
end;
{
function CustomSortProc(Item1, Item2: TListItem;
  ParamSort: integer): integer; stdcall;
begin
  Result := CompareUkrText(Item1.Caption, Item2.Caption);
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  ListView1.CustomSort(@CustomSortProc, 0);
end;
}
end.
