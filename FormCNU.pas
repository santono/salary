unit FormCNU;

interface
                  
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ScrDef, Menus, ImgList;

type
  TFormCN = class(TForm)
    StringCN: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ImageList1: TImageList;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    GUID1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SetPerson(C_Person:Person_Ptr);
    procedure FormShow(Sender: TObject);
    function Execute: boolean;
    procedure StringCnDrawCell(Sender: TObject; ACol, ARow: Integer;
                               Rect: TRect; State: TGridDrawState);
    procedure StringCNDblClick(Sender: TObject);
    procedure StringCNKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure StringCNKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N8Click(Sender: TObject);
    procedure GUID1Click(Sender: TObject);

  private
    { Private declarations }
    Curr_Person:Person_Ptr;
    procedure MakeGrid;
    procedure DelAllZeroCn;
    procedure MakeColorRowCn(WantedRow:integer);
    function  IsCnAutomatic(R:Integer):boolean;
    procedure All_Cn(Mode_Cn:integer);
  public
    { Public declarations }
    RetCode:integer;
  end;

var
  FormCN: TFormCN;
implementation
  uses ScrLists,ScrExport,ScrUtil,Qt,Salary,FormUpdCnU,UFormUpdateCn,
  UFormParNadb;

procedure TFormCN.MakeGrid;
  var I_C,I,JJ:Integer;
      Curr_CN:CN_Ptr;
      S:string;
 begin
       Caption:=Alltrim(Curr_Person^.Fio)+' '+AllTrim(Curr_Person^.Dolg)+' '+Get_Kat_Name(Curr_Person^.Kategorija)+' '+Get_Ist_Name(Curr_Person^.Gruppa);
       I_C:=Count_Cn(Curr_Person);
       if i_c<1 then i_c:=1;
       StringCN.ColCount:=6;
       StringCN.RowCount:=I_C+1;
       StringCN.Cells[0,0]   := 'Шифр';
       StringCN.Cells[1,0]   := 'Название';
       StringCN.Cells[2,0]   := 'Код';
       StringCN.Cells[3,0]   := 'Сумма';
       StringCN.Cells[4,0]   := 'Прим';
       StringCN.Cells[5,0]   := 'Прим 1';
       StringCN.ColWidths[0] :=  60;
       StringCN.ColWidths[1] := 320;
       StringCN.ColWidths[2] :=  70;
       StringCN.ColWidths[3] := 100;
       StringCN.ColWidths[4] :=  80;
       StringCN.ColWidths[5] :=  90;
       StringCN.Width:=StringCN.ColWidths[0]+
                       StringCN.ColWidths[1]+
                       StringCN.ColWidths[2]+
                       StringCN.ColWidths[3]+
                       StringCN.ColWidths[4]+
                       StringCN.ColWidths[5]+10;
       i:=0;
       Curr_Cn:=Curr_Person^.Cn;
       if Curr_Cn=Nil then
          begin
             Make_Cn(Curr_Cn,Curr_Person);
             Curr_Cn:=Curr_Person^.Cn;
          end;
       while Curr_Cn<>Nil do
            begin
                 inc(i);
                 if Curr_Cn^.Shifr>Limit_Cn_Base then
                    StringCn.Cells[0,i]:=IntToStr(Curr_Cn^.Shifr-Limit_Cn_Base)
                                                 else
                    StringCn.Cells[0,i]:=IntToStr(Curr_Cn^.Shifr);
                 StringCn.Cells[1,i]:=ShifrList.GetNameCN(Curr_Cn^.Shifr);
                 StringCn.Cells[2,i]:=IntToStr(Curr_Cn^.Kod);
                 StringCn.Cells[3,i]:=FloatToStrF(Curr_Cn^.Summa,ffFixed,12,2);
                 StringCn.Cells[4,i]:=IntToStr(Curr_Cn^.Prim);
                 if ((Curr_Cn^.Shifr=GUIDShifr) or (Curr_Cn^.Shifr=GUIDShifr+Limit_Cn_Base )) then
                    StringCn.Cells[5,i]:=FormatGUID(Curr_Cn^.Prim_1,Curr_Cn^.Summa,Curr_Cn^.FLOW_SUMMA,Curr_Cn^.LIMIT_SUMMA)
                 else
                    StringCn.Cells[5,i]:=Curr_Cn^.Prim_1;
                 if Curr_Cn^.Shifr>Limit_Cn_Base then
                    begin
                         for jj:=0 to StringCn.ColCount-1 do
                            begin
                                 StringCn.Objects[jj,i]:=TStrColor.Create;
                                (StringCn.Objects[jj,i] as TStrColor).Color         := clInfoText;
                                (StringCn.Objects[jj,i] as TStrColor).BackColor     := clInfoBk;
                                (StringCn.Objects[jj,i] as TStrColor).SelectedColor := clYellow;
                            end;
                    end
                 else
                    if Assigned(StringCn.Objects[jj,i]) then
                       begin
                            StringCn.Objects[jj,i].Free;
                            StringCn.Objects[jj,i]:=Nil;
                       end;
                 Curr_Cn:=Curr_Cn^.Next;
            end;
 end;
{$R *.dfm}

procedure TFormCN.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     DelAllZeroCn;
     Action:=caFree;
end;

procedure TFormCN.FormCreate(Sender: TObject);
begin
     RetCode:=0;
end;

procedure TFormCn.SetPerson(C_Person:Person_Ptr);
 begin
      Self.Curr_Person:=C_Person;
 end;

function TFormCn.Execute: boolean;
begin
     Self.visible:=false;
     if ShowModal = mrOk then begin
{        RetVal:=RetCode;}
        result := true;
     end else begin
        result := false;
{        RetVal:=RetCode; }
     end;
end;


procedure TFormCN.FormShow(Sender: TObject);
begin
      Self.MakeGrid;
end;


function TFormCn.IsCnAutomatic(R:Integer):boolean;
 var Curr_cn:cn_ptr;
     i:integer;
 begin
      I:=0;
      Result:=true;
      curr_cn:=curr_Person^.cn;
      while (curr_cn<>Nil) do
       begin
            inc(i);
            if i=r then
               begin
                     if Curr_Cn^.Automatic=Automatic_mode then
                        Result:=false;
                     break;
               end;
            Curr_Cn:=Curr_Cn^.Next;
       end;
 end;

procedure TFormCn.StringCnDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var i,k:integer;
    vRow,vCol:integer;
    a:double;
    S:String;
    Shift:integer;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
begin
      i:=1;
      vRow := aRow;
      vCol := aCol;
      if vRow<1 then Exit;
      S:=StringCn.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                if (gdSelected in State) and (Sender = ActiveControl) then
                   begin
                        Brush.Color := clHighlight;
                        If assigned(Objects[vCol,vRow]) then
                           begin
                                 OldFontColor := Font.Color;
                                 OldBrushColor := Brush.Color;
                                 Font.Color := (Objects[vCol,vRow] as TStrColor).SelectedColor;
                           end
                   end
                                         else
                if (gdFixed in State) and (Sender = ActiveControl ) then
                   begin
                        Brush.Color := FixedColor;
                        If assigned(Objects[vCol,vRow]) then
                           begin
                                OldFontColor := Font.Color;
                                OldBrushColor := Brush.Color;
                                Font.Color := (Objects[vCol,vRow] as TStrColor).Color;
                                Brush.Color := (Objects[vCol,vRow] as TStrColor).BackColor;
                           end
                   end
                                         else
                    begin
                         Brush.Color := Color;
                         Font.Color  := clWindowText;
                         if (vRow mod 2 = 1) then Brush.Color:=clInfoBk
                                             else Brush.Color:=cl3dLight;
{
                         If assigned(Objects[vCol,vRow]) then
                            begin
                                 OldFontColor  := Font.Color;
                                 OldBrushColor := Brush.Color;
                                 Font.Color    := (Objects[vCol,vRow] as TStrColor).Color;
                                 Brush.Color   := (Objects[vCol,vRow] as TStrColor).BackColor;
                           end;
}                           
                    end;
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                if (vCol=0) or (vCol=2) or (vCol=3) or (vCol=4) then
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
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;

        if (vCol=0) and (VRow>0) then
           if IsCnAutomatic(VRow) then
              ImageList1.Draw(TStringGrid(Sender).Canvas,Rect.Left+1,Rect.Top+2,2)
                                  else
           if Assigned(TStringGrid(Sender).Objects[vCol,vRow]) then
           ImageList1.Draw(TStringGrid(Sender).Canvas,Rect.Left+1,Rect.Top+2,1)
                                           else
           ImageList1.Draw(TStringGrid(Sender).Canvas,Rect.Left+1,Rect.Top+2,0)

end;



procedure TFormCN.StringCNDblClick(Sender: TObject);
var RetVal:integer;
    Curr_Cn:Cn_Ptr;
    i:integer;
    Shifr,Kod,Prim:integer;
    Prim_1:string;
    Summa:Real;
begin
{
     FormUpdateAdd:=TFormUpdateAdd.Create(Self);
     if FormUpdateAdd.ShowModal=mrOk then;
}
     if (Nmes<>Flow_Month) then
        begin
             ShowMessage('Изменения можно вносить только в текущий месяц');
             Exit;
        end;

     Curr_Cn := Curr_Person^.Cn;
     i:=0;
     while (Curr_Cn<>Nil) do
      begin
           inc(i);
           if I=StringCn.Row then break;
              Curr_Cn:=Curr_Cn^.Next;
      end;

     if Curr_Cn^.Shifr=GUIDShifr+Limit_CN_Base then
        begin
             ShowMessage('Уникальный код '+#13+#10+FormatGUID(Curr_CN^.PRIM_1,Curr_CN^.SUMMA,Curr_CN^.FLOW_SUMMA,Curr_CN^.LIMIT_SUMMA));
             Exit;
        end;

     Shifr  := Curr_Cn^.SHIFR;
     Kod    := Curr_Cn^.Kod;
     Summa  := Curr_Cn^.Summa;
     Prim   := Curr_Cn^.Prim;
     Prim_1 := Curr_Cn^.Prim_1;


     with TFormUpdateCn.Create(nil) do
         try
             ShifrSta := Curr_Cn^.Shifr;
             Summa    := Curr_Cn^.Summa;
             Kod      := Curr_Cn^.Kod;
             Prim     := Curr_Cn^.PRIM;
             Prim_1   := Curr_Cn^.PRIM_1;
             if execute(RetVal) then
                begin
                     if abs(abs(Curr_Cn^.SUMMA)-abs(Summa))>0.005 then RetCode:=1
                     else
                     if (Curr_Cn^.Shifr<>ShifrSta) then RetCode:=1
                     else
                     if (Curr_Cn^.Kod<>Kod) then RetCode:=1
                     else
                     if (Curr_Cn^.Prim<>Prim) then RetCode:=1
                     else
                     if (Curr_Cn^.Prim_1<>Prim_1) then RetCode:=1;
                     Curr_Cn^.SUMMA  := Summa;
                     Curr_Cn^.SHIFR  := ShifrSta;
                     Curr_Cn^.Kod    := Kod;
                     Curr_Cn^.Prim   := Prim;
                     Curr_Cn^.Prim_1 := Prim_1;
                end;
         finally
             free;
         end;


{
     with TFormUpdCn.Create(nil) do
        try
            SetPar(Shifr,Kod,Summa,Prim,Prim_1);
            if execute(RetVal) then
              begin
                   GetPar(Shifr,Kod,Summa,Prim,Prim_1);
                   Curr_Cn^.Shifr   := Shifr;
                   Curr_Cn^.Kod     := Kod;
                   Curr_Cn^.SUMMA   := Summa;
                   Curr_Cn^.Prim    := Prim;
                   Curr_Cn^.Prim_1  := Prim_1;
              end
        finally
        free;
      end;
}
      Self.MakeGrid;

end;

procedure TFormCn.DelAllZeroCn;
 begin
      Ldel_Cn_Zero(Curr_Person);
 end;

procedure TFormCn.MakeColorRowCn(WantedRow:integer);
 var I:Integer;
 begin
       for i:=0 to StringCn.ColCount-1 do
           begin
                if Assigned(StringCn.Objects[i,WantedRow]) then
                   begin
                         StringCn.Objects[i,WantedRow].Free;
                         StringCn.Objects[i,WantedRow]:=Nil;
                   end
                                                             else
                   begin
                        StringCn.Objects[i,WantedRow]:=TStrColor.Create;
                       (StringCn.Objects[i,WantedRow] as TStrColor).Color         := clInfoText;
                       (StringCn.Objects[i,WantedRow] as TStrColor).BackColor     := clInfoBk;
                       (StringCn.Objects[i,WantedRow] as TStrColor).SelectedColor := clYellow;
                   end;
           end;
 end;

procedure TFormCN.StringCnKeyPress(Sender: TObject; var Key: Char);
var Curr_Cn : Cn_Ptr;
    i,j:integer;
begin
      if (Key='O') or (Key='o') or (Key='щ') or (Key ='Щ') then
         begin
               if (Nmes<>Flow_Month) then
                   begin
                       ShowMessage('Изменения можно вносить только в текущий месяц');
                       Exit;
                   end;

               J:=Count_Cn(Curr_Person);
               if StringCn.Row<=j then
                  begin
                        i:=0;
                        Curr_Cn:=Curr_Person^.Cn;
                        while (Curr_Cn<>Nil) do
                              begin
                                   inc(i);
                                   if (i = StringCn.Row) and (Curr_Cn^.Shifr < Limit_Cn_Base) then
                                      begin
                                           IF CURR_CN^.AUTOMATIC=AUTOMATIC_MODE THEN
                                              CURR_CN^.AUTOMATIC:=MANUAL_MODE
                                           ELSE
                                              CURR_CN^.AUTOMATIC:=AUTOMATIC_MODE;
                                           MakeColorRowCn(StringCn.Row);
                                           break;
                                      end;
                                   Curr_Cn:=Curr_Cn^.NEXT;
                              end;
                  end;
               StringCn.Refresh;
         end;


end;


procedure TFormCN.N1Click(Sender: TObject);
var Curr_Cn:Cn_Ptr;
    RetVal:Integer;
    Shifr,Kod,Prim:Integer;
    Summa:real;
    Prim_1:String;
begin
     Make_Cn(Curr_Cn,Curr_Person);
     Curr_cn^.SHIFR  := 1;
     Curr_cn^.Kod    := 1;
     Curr_cn^.Summa  := 0;
     Curr_cn^.Prim   := 0;
     Curr_cn^.Prim_1 := '';
     Shifr           := 1;
     Kod             := 1;
     Summa           := 0;
     Prim            := 0;
     Prim_1          := '';
     Shifr  := Curr_Cn^.SHIFR;
     Kod    := Curr_Cn^.Kod;
     Summa  := Curr_Cn^.Summa;
     Prim   := Curr_Cn^.Prim;
     Prim_1 := Curr_Cn^.Prim_1;


     with TFormUpdateCn.Create(nil) do
         try
             ShifrSta := Curr_Cn^.Shifr;
             Summa    := Curr_Cn^.Summa;
             Kod      := Curr_Cn^.Kod;
             Prim     := Curr_Cn^.PRIM;
             Prim_1   := Curr_Cn^.PRIM_1;
             if execute(RetVal) then
                begin
                     Curr_Cn^.SUMMA  := Summa;
                     Curr_Cn^.SHIFR  := ShifrSta;
                     Curr_Cn^.Kod    := Kod;
                     Curr_Cn^.Prim   := Prim;
                     Curr_Cn^.Prim_1 := Prim_1;
                end
             else
                Curr_Cn^.Shifr:=0;
         finally
{             free;   }
         end;

{
     with TFormUpdCn.Create(nil) do
        try
            SetPar(Shifr,
                   Kod,
                   Summa,
                   Prim,
                   Prim_1);
            if execute(RetVal) then
              begin
                   GetPar(Shifr,
                          Kod,
                          Summa,
                          Prim,
                          Prim_1);
                   Curr_Cn^.Shifr   := Shifr;
                   Curr_Cn^.Kod     := Kod;
                   Curr_Cn^.SUMMA   := Summa;
                   Curr_Cn^.Prim    := Prim;
                   Curr_Cn^.Prim_1  := Prim_1;
              end
        finally
        free;
      end;
}
      DelAllZeroCn;
      StringCn.Row:=StringCn.RowCount-1;
      Self.MakeGrid;
end;


procedure TFormCN.N2Click(Sender: TObject);
 var Curr_Cn : Cn_Ptr;
     i       : Integer;
begin
     if StringCn.Row<1 then Exit;
     Curr_Cn:=Curr_Person^.Cn;
     i:=0;
     while (Curr_Cn<>Nil) do
      begin
           inc(i);
           if I=StringCn.Row then break;
              Curr_Cn:=Curr_Cn^.Next;
      end;
     if i>0 then
        begin
             if not ((Curr_Cn^.SHIFR=GUIDShifr) or (Curr_Cn^.SHIFR=GUIDShifr+Limit_Cn_Base)) then
                Del_Cn(Curr_Cn,Curr_Person) else
                ShowMessage('Уникальный номер удалять нельзя');
             RetCode:=1; { Были изменения }
        end;
     Self.MakeGrid;
end;

procedure TFormCN.All_Cn(Mode_Cn:integer);
 VAR I       : integer;
     Curr_Cn : Cn_Ptr;
     Mode    : integer;
  procedure Block_For_All(Mode:integer);
{ MODE=1 - всем блокировать    }
{     =2 - всем разблокировать }
   var I,I_C:integer;
       C_Person:Person_ptr;
   procedure Block_Wanted_Cn;
    var I_CN,I:integer;
        C_CN:Cn_Ptr;
    begin
         I_Cn:=COUNT_CN(C_PERSON);
         C_CN:=C_Person.CN;
         while (C_Cn<>Nil) do
           begin
                 if C_Cn^.shifr  = Curr_Cn^.shifr  then
                 if mode = 1 then C_Cn^.automatic := manual_mode
                             else C_Cn^.automatic := automatic_mode;
                 C_Cn:=C_Cn^.next;
           end;
    end;
   begin
       if (Mode<1) or (Mode>2) then exit;
       c_person:=Head_Person;
       while (c_person<>Nil) do
         begin
              Block_Wanted_Cn;
              c_person:=c_person^.next;
         end;
   end;
  procedure Add_To_All;
   var
       C_Cn:Cn_Ptr;
       C_Person:Person_ptr;
       P:pointer;
   begin
       C_Person:=Head_Person;
       while (c_person<>Nil) do
         begin
              if C_Person<>Curr_person then
                begin
                     Make_Cn(C_Cn,C_Person);
                     p:=C_Cn^.Next;
                     C_Cn^:=Curr_Cn^;
                     C_Cn^.Next:=p;
                end;
              C_Person:=C_Person^.Next;
         end;
   end;
  procedure Del_From_All;
   var j,i,i_c:integer;
       C_Person:person_ptr;
       Period,Shifr:integer;
   begin
       Shifr  := Curr_Cn^.Shifr;
       if Curr_Cn^.Automatic=MANUAL_MODE then
          begin
                ShowMessage('Удалять заблокированную запись нельзя');
                exit;
          end;
       C_Person:=Head_Person;
       while (C_Person<>Nil) do
         begin
              repeat
              until not (Del_Wanted_Cn(Shifr,C_Person));
              if C_Person=Curr_Person then
                 if Count_Cn(Curr_Person)=0 then Make_Cn(Curr_Cn,Curr_Person);
              C_Person:=C_Person^.Next;
         end;
   end;
 begin
      i:=0;
      Curr_Cn:=Curr_Person^.Cn;
      while (Curr_Cn<>Nil) do
        begin
             Inc(I);
             if I=StringCn.Row then break;
             Curr_Cn:=Curr_Cn^.Next;
        end;
      if Curr_Cn^.Shifr<=0       then Exit;
{      if Curr_Cn^.Shifr>MAXSHIFR then Exit;}
      if Mode_Cn=1 then Add_To_All;
      if Mode_Cn=2 then Del_From_All;
      if Mode_Cn=3 then Block_For_All(1);
      if Mode_Cn=4 then Block_For_All(2);
 end;


procedure TFormCN.N4Click(Sender: TObject);
begin
     All_Cn(1);
     Application.ProcessMessages;
end;

procedure TFormCN.N5Click(Sender: TObject);
begin
     All_Cn(2);
     Application.ProcessMessages;
end;

procedure TFormCN.N6Click(Sender: TObject);
begin
     All_Cn(3);
     Application.ProcessMessages;
end;

procedure TFormCN.N7Click(Sender: TObject);
begin
     All_Cn(4);
     Application.ProcessMessages;
end;

procedure TFormCN.StringCNKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

     if (Key=46) or (key=85) then self.N2Click(Sender)
               else
     if Key=45 then self.N1Click(Sender);
    
end;

procedure TFormCN.N8Click(Sender: TObject);
 var ZwanProc,StepProc,StagProc:real;
     mr:TModalResult;
 procedure AddToCn(WantedShifr:Integer;WantedProc:real);
  var curr_Cn:CN_PTR;
      finded:Boolean;
  begin
       if WantedProc<0.01 then
          Exit;
       finded:=false;
       curr_cn:=Self.Curr_Person.Cn;
       while (Curr_Cn<>Nil) do
        begin
             if (Curr_cn^.SHIFR=WantedShifr) then
                begin
                     Finded:=True;
                     if Abs(Abs(Curr_cn^.Summa)-abs(WantedProc))<0.01 then
                        Exit;
                     Break;
                end;
             Curr_cn:=Curr_cn^.Next;
        end;
       if finded then
          Curr_cn^.SUMMA:=WantedProc
       else
          begin
               make_Cn(curr_Cn,Curr_Person);
               curr_Cn.SHIFR := WantedShifr;
               curr_Cn.SUMMA := WantedProc;
               curr_Cn.KOD   := 2;
          end;
  end;
begin
     ZwanProc:=0;
     StepProc:=0;
     StagProc:=0;
     Application.CreateForm(TFormParNadb,FormParNadb);
     mr:=FormParNadb.ShowModal;
     if mr=mrOk then
        begin
             case FormParNadb.StepValue of
              1 : StepProc:=15;
              2 : StepProc:=25;
             end;
             case FormParNadb.ZwanValue of
              1 : ZwanProc:=25;
              2 : ZwanProc:=33;
             end;
             case FormParNadb.StagValue of
              1 : StagProc:=10;
              2 : StagProc:=20;
              3 : StagProc:=30;
             end;
        end;
     FormParNadb.Free;
     if mr=mrOk then
        begin
             AddToCn(ZA_STEP_SHIFR,StepProc);
             AddToCn(ZA_ZWAN_SHIFR,ZwanProc);
             AddToCn(VYSLUGA_SHIFR,StagProc);
             Self.MakeGrid;
             Application.ProcessMessages;
        end;
end;

procedure TFormCN.GUID1Click(Sender: TObject);
  var curr_cn:cn_ptr;
      i:integer;
begin
     if (Nmes<>Flow_Month) then exit;
     Curr_Cn:=Curr_Person^.Cn;
     i:=0;
     while (Curr_Cn<>Nil) do
      begin
           inc(i);
           if I=StringCn.Row then break;
              Curr_Cn:=Curr_Cn^.Next;
      end;
      if i>0 then
         begin
              if curr_cn^.shifr=GUIDSHIFR+LIMIT_CN_BASE then
              if YesNo('Изменить GUID?') then
                 begin
                      makeguid(Curr_Person);
                      Self.MakeGrid;
                      showMessage('Изменен');
                 end;
        end;

end;

end.
