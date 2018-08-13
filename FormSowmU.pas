{$WARNINGS OFF}
{$HINTS OFF}
unit FormSowmU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids,ScrDef, StdCtrls, Menus;

type
  TFormSowm = class(TForm)
    StringGrid1: TStringGrid;
    ComboBoxFrom: TComboBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SetCurrPerson(C_Person:Person_Ptr);
    procedure FormCreate(Sender: TObject);
    function Execute: boolean;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBoxFromChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    Curr_Person:Person_Ptr;
    CurrSowm:Sowm_Ptr;
    procedure MakeGrid;
  public
    { Public declarations }
  end;

var
  FormSowm: TFormSowm;

implementation
 uses ScrIO,ScrUtil,ScrLists;

{$R *.dfm}

procedure TFormSowm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormSowm.MakeGrid;
 type PNsrvRec=^TNsrvRec;
      TNsrvRec=record
                  Where:integer;
               end;

var Curr_Sowm : Sowm_Ptr;
    i         : Integer;
    Curr_Row  : integer;
    Curr_P    : Person_Ptr;
    List      : TList;
    Finded    : boolean;
    NsrvRec   : PNsrvRec;

 procedure Put_String;
  const F = '#######0.00';
  var A:Real;
  begin
        Inc(Curr_Row);
        StringGrid1.Cells[0,Curr_Row]   := IntToStr(Curr_Row);
        StringGrid1.Cells[1,Curr_Row]   := Name_Serv(Curr_Sowm^.Where);
        StringGrid1.Cells[2,Curr_Row]   := Curr_P^.Dolg;
        A := Get_Koef_Oklad_Person(Curr_P);
        StringGrid1.Cells[3,Curr_Row]   := FormatFloat(F,A);
        StringGrid1.Cells[4,Curr_Row]   := FormatFloat(F,Curr_P^.Oklad);
        StringGrid1.Cells[5,Curr_Row]   := trim(Curr_P^.N_TEMY);
  end;

 procedure Print_Serv;
  var Sav_NSRV : integer;
    begin
       if (Curr_Sowm^.WHERE<1) or
          (Curr_Sowm^.WHERE>NameServList.Count) then Exit;
       Sav_Nsrv:=NSRV;
       if NSRV<>Curr_Sowm^.WHERE then
          begin
               Select(2);
               Nsrv := Curr_Sowm^.WHERE;
               MKFLNM;
               if not FileExists(FNINF) then
                  begin
                        Select(1);
                        Nsrv := Sav_Nsrv;
                        MKFLNM;
                        Exit;
                  end;
               GetInf(False);
          end;

       Curr_P:=Head_Person;
       while (Curr_P<>NIl) do
         begin
              if (Curr_P^.Tabno = Curr_Person^.Tabno) and (Curr_p<>Curr_Person) then
                 Put_String;
              Curr_P:=Curr_P^.NEXT;
         end;
       if (Sav_Nsrv<>NSRV) then
          begin
               While (Head_Person<>Nil) do Del_Person(Head_Person);
               Select(1);
               Nsrv := Sav_Nsrv;
               MKFLNM;
          end;
  end;

begin
    i:=Count_Sowm(Curr_Person);
    if i=0 then
       begin
            Make_Sowm(Curr_Sowm,Curr_Person);
            Curr_Sowm^.WHERE:=0;
       end;
    StringGrid1.RowCount:=Count_Sowm(Curr_Person)+1;
    List:=TList.Create;
    Curr_Row  := 0;
    Curr_Sowm := Curr_Person^.Sowm;
    while (Curr_Sowm<>Nil) do
      begin
           Finded:=false;
           if List.Count>0 then
              for i:=0 to List.Count-1 do
                  if (PNsrvRec(List.Items[i])^.Where  = Curr_Sowm^.Where) then
                      begin
                           Finded:=true;
                           break;
                      end;
           if not Finded then
              begin
                   New(NsrvRec);
                   NsrvRec.Where := Curr_Sowm^.Where;
                   List.Add(NsrvRec);
                   Print_Serv;
              end;
           Curr_Sowm := Curr_Sowm^.NEXT;
      end;
    List.Free;
end;

procedure TFormSowm.FormShow(Sender: TObject);
var T:boolean;
begin

      StringGrid1.ColCount     :=   6;
      StringGrid1.ColWidths[0] :=  40;
  //    StringGrid1.ColWidths[1] := 250;
      StringGrid1.Cells[0,0]   := 'Номер';
      StringGrid1.Cells[1,0]   := 'Подразделение';
      StringGrid1.Cells[2,0]   := 'Должность';
      StringGrid1.Cells[3,0]   := 'Доля ставки';
      StringGrid1.Cells[4,0]   := 'Оклад';
      StringGrid1.Cells[5,0]   := 'Тема';
      MakeGrid;
      Caption:='Совмещения '+IntToStr(Curr_Person^.Tabno)+' '+AllTrim(Curr_Person^.FIO);
      T:=true;
      StringGrid1SelectCell(Sender,1,1,T);

end;

procedure TFormSowm.SetCurrPerson(C_Person:Person_Ptr);
 begin
      Curr_Person:=C_Person;
 end;

procedure TFormSowm.FormCreate(Sender: TObject);
var i:integer;
begin
     Curr_Person:=Nil;
     for i:=1 to Count_Serv do
         ComboBoxFrom.Items.Add(Name_Serv(i));
     ComboBoxFrom.Hide;
     ComboBoxFrom.Enabled:=false;
end;

function TFormSowm.Execute: boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
  Ldel_Sowm_Zero(Curr_Person);
end;

procedure TFormSowm.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol:integer;
    S:String;
    Shift:integer;
begin
      vRow:=aRow;
      vCol:=aCol;
      if vRow<1 then Exit;
      if vCol<1 then Exit;
      S:=StringGrid1.Cells[vCol,vRow];
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
                if (vCol=0)  then
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

procedure TFormSowm.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var i,j:integer;
begin
     CurrSowm:=Curr_Person^.Sowm;
     i:=0;
     while ((i+1)<>ARow) and (CurrSowm<>Nil) do
       begin
            Inc(i);
            CurrSowm:=CurrSowm^.Next;
       end;
     j:=CurrSowm^.WHERE;
     if j>0 then
        begin
             ComboBoxFrom.Text:=ComboBoxFrom.Items[j-1];
             ComboBoxFrom.ItemIndex:=j-1;
        end;
end;

procedure TFormSowm.ComboBoxFromChange(Sender: TObject);
begin
      if Assigned(CurrSowm) then
         begin
              CurrSowm^.Where:=ComboBoxFrom.ItemIndex+1;
              Self.MakeGrid;
         end;

end;

procedure TFormSowm.N2Click(Sender: TObject);
var i:integer;
begin
      if StringGrid1.RowCount=2 then
         begin
              CurrSowm:=Curr_Person^.SOWM;
              CurrSowm.WHERE:=0;
              MakeGrid;
         end
                                else
         begin
              i:=0;
              CurrSowm:=Curr_Person^.Sowm;
              while ((i+1)<>StringGrid1.Row) do
               begin
                    Inc(i);
                    CurrSowm:=CurrSowm^.Next;
               end;
              if CurrSowm<>Nil then Del_Sowm(CurrSowm,Curr_Person);
              MakeGrid;
         end;

end;

procedure TFormSowm.N1Click(Sender: TObject);
var Finded:boolean;
begin
      Finded:=false;
      CurrSowm:=Curr_Person^.SOWM;
      while (CurrSowm<>Nil) do
       begin
             if CurrSowm^.Where=0 then
                begin
                     Finded:=true;
                     break;
                end;
             CurrSowm:=CurrSowm^.NEXT;
       end;
      if not Finded then
         begin
              Make_Sowm(CurrSowm,Curr_Person);
              CurrSowm^.WHERE:=0;
              MakeGrid;
         end;
end;

end.
