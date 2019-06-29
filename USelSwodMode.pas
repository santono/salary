unit USelSwodMode;
                               
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxTL, dxDBCtrl, dxDBGrid, dxCntner, frxClass, Menus,
  FIBDatabase, pFIBDatabase, DBCtrls, FIBQuery, pFIBQuery;

type
  TFormSwodMode = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    StringGridGrp: TStringGrid;
    StringGridKat: TStringGrid;
    ComboBoxMode: TComboBox;
    ComboBoxUch: TComboBox;
    pFIBDataSetOpe: TpFIBDataSet;
    DataSourceOpe: TDataSource;
    pFIBDataSetOpeSHIFRWRK: TFIBIntegerField;
    pFIBDataSetOpeFIOOP: TFIBStringField;
    dxDBGridOpe: TdxDBGrid;
    dxDBGridOpeSHIFRWRK: TdxDBGridMaskColumn;
    dxDBGridOpeFIOOP: TdxDBGridMaskColumn;
    pFIBDataSetPodr: TpFIBDataSet;
    pFIBDataSetPodrSHIFRPOD: TFIBIntegerField;
    pFIBDataSetPodrNAME: TFIBStringField;
    DataSourcePodr : TDataSource;
    dxDBGridPodr   : TdxDBGrid;
    dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridPodrNAME: TdxDBGridMaskColumn;
    RadioGroupM: TRadioGroup;
    RadioGroupP: TRadioGroup;
    LabelCnt: TLabel;
    pFIBDataSetOpeNOMEROP: TFIBSmallIntField;
    dxDBGridOpeNomerOp: TdxDBGridColumn;
    CheckBoxDogPod: TCheckBox;
    CheckBoxTotal: TCheckBox;
    RadioGroupPrintMode: TRadioGroup;
    dxDBGridSelPKG: TdxDBGrid;
    pFIBDataSetSelPKG: TpFIBDataSet;
    pFIBTransactionSelPKG: TpFIBTransaction;
    DataSourceSelPKG: TDataSource;
    pFIBDataSetSelPKGSHIFRID: TFIBIntegerField;
    pFIBDataSetSelPKGNAME: TFIBStringField;
    dxDBGridSelPKGSHIFRID: TdxDBGridMaskColumn;
    dxDBGridSelPKGNAME: TdxDBGridMaskColumn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DBNavigatorSelPKG: TDBNavigator;
    pFIBTransactionWrite: TpFIBTransaction;
    pFIBQuerySel: TpFIBQuery;
    pFIBTransactionSel: TpFIBTransaction;
    RadioGroupIllSS: TRadioGroup;
    btnSowmMode: TButton;
    RadioGroupChernob: TRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure StringGridGrpKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGridGrpMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGridKatKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StringGridKatMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure StringGridGrpDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridKatDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure ComboBoxModeChange(Sender: TObject);
    procedure ComboBoxUchChange(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SetSwodSowmMode(NewMode:integer);
    procedure btnSowmModeClick(Sender: TObject);
  private
    { Private declarations }

    Select_Key:Integer;
    PrintMode : integer;
    InInsertMode : boolean;
    SwodSowmMode : Integer;
    Procedure MakeGrid;
    procedure MakeCnt;
    procedure SetCaptionSowmButton;
    procedure SetAllServSelected;



  public

    { Public declarations }
  end;

var
  FormSwodMode: TFormSwodMode;

implementation
 Uses ScrDef,ScrUtil,ScrSwod,UFibModule, UFormSelPKGSave,ScrLists,UFormSwodSwmMode,
      UAddUdList;

{$R *.dfm}
procedure TFormSwodMode.SetSwodSowmMode(NewMode:integer);
 begin
      if NewMode <0 then Exit;
      if NewMode >3 then Exit;
      SwodSowmMode:=NewMode;
      SetCaptionSowmButton;
 end;

procedure TFormSwodMode.MakeGrid;
 var i:integer;
 begin
     StringGridGrp.ColCount:=1;
     StringGridGrp.RowCount:=max_ist_fin;
     StringGridGrp.ColWidths[0]:=100;
     StringGridGrp.Width:=StringGridGrp.ColWidths[0]+30;
     for i:=1 to max_ist_fin do
         begin
               StringGridGrp.Cells[0,i-1]:=GET_IST_NAME(I);
               Curr_Gruppa[I]:=false;
         end;

     StringGridKat.ColCount:=1;
//     StringGridKat.RowCount:=max_kategorija-1;
     StringGridKat.RowCount:=max_kategorija;
     StringGridKat.Left:=StringGridGrp.Left+StringGridGrp.Width+10;
     StringGridKat.ColWidths[0]:=200;
     StringGridKat.Width:=StringGridKat.ColWidths[0]+25;
     for i:=1 to max_kategorija do
         begin
               StringGridKat.Cells[0,i-1]:=GET_KAT_NAME(I);
               Curr_Kategorija[I]:=false;
         end;

      dxDBGridOpe.Left:=StringGridKat.Left+StringGridKat.Width+10;
      dxDBGridOpe.Width:=160;
      LabelCnt.Caption:='';

 end;

procedure TFormSwodMode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

      if pFIBDataSetOpe.Active then
         pFIBDataSetOpe.Active:=false;
      if pFIBDataSetPodr.Active then
         pFIBDataSetPodr.Active:=false;
      if pFIBDataSetOpe.Transaction.Active then
         pFIBDataSetOpe.Transaction.Commit;
      if pFIBDataSetPodr.Transaction.Active then
         pFIBDataSetPodr.Transaction.Commit;
      if pFIBDataSetSelPKG.Active then
         pFIBDataSetSelPKG.Close;
      if pFIBDataSetSelPKG.Transaction.Active then
         pFIBDataSetSelPKG.Transaction.Commit;
      if pFIBDataSetSelPKG.UpdateTransaction.Active then
         pFIBDataSetSelPKG.UpdateTransaction.Commit;

     Action:=caFree;
end;

procedure TFormSwodMode.SetCaptionSowmButton;
 begin
      case SwodSowmMode of
        1: btnSowmMode.Caption:='Осн только';
        2: btnSowmMode.Caption:='Свм внут';
        3: btnSowmMode.Caption:='Свм внеш';
      else
        btnSowmMode.Caption:='Осн и свм';
      end;
 end;
procedure TFormSwodMode.FormCreate(Sender: TObject);
begin
     ComboBoxMode.ItemIndex := 0;
     ComboBoxUch.ItemIndex  := 0;
     SwodSowmMode := 0;
     SetCaptionSowmButton;
     InInsertMode := false;
     StringGridGrp.Hide;
     StringGridKat.Hide;
     dxDBGridOpe.Hide;
     dxDBGridPodr.Hide;
     RadioGroupM.ItemIndex:=0;
     RadioGroupP.ItemIndex:=0;
     CheckBoxDogPod.Checked:=true;
     CheckBoxTotal.Checked:=false; {В свод для Аллы входит все без всяких исключении     }
                                   { все начисления и все удержания по все подразделениям}
                                   { и счетам      }
     RadioGroupPrintMode.ItemIndex:=0;
     dxDBGridSelPkg.Hide;
     DBNavigatorSelPKG.Hide;
     dxDBGridSelPkg.Enabled:=false;
     RadioGroupIllSS.ItemIndex:=1;
     RadioGroupChernob.ItemIndex:=0;
     if needTestMem then
        begin
             if Assigned(TestListClass) then
                begin
                     TestListClass.Done;
                end;
             TestListClass:=TTestListClass.init;
        end;

     MakeGrid;
end;

procedure TFormSwodMode.BitBtn1Click(Sender: TObject);
var Select_Bay_Mode,SelectedBay,ModeIllSS,ModeChernob:Integer;
    TotalMode:boolean;
    NameBay:String;
    NeedDogPod:boolean;
    ShifrId,ShifrPod,Mode:integer;
begin
     NeedDogPod  := CheckBoxDogPod.Checked;
     SelectedBay := 0;
     NameBay     := '';
     Select_Key:=ComboBoxMode.ItemIndex+1;
     Select_Bay_Mode:=ComboBoxUch.ItemIndex+1;
     {
      Select_Bay_Mode = 1;    все подразделения
      Select_Bay_Mode = 2;    выбранный участок
      Select_Bay_Mode = 3;    выбранное подразделение
     }
     if Select_Bay_Mode=2 then
        begin
             SelectedBay:=pFIBDataSetOpe.FieldByName('ShifrWrk').AsInteger;
             NameBay:=pFIBDataSetOpe.FieldByName('FIOOP').AsString
        end
     else if Select_Bay_Mode=3 then
        SelectedBay:=pFIBDataSetPodr.FieldByName('ShifrPod').AsInteger;
     case RadioGroupM.ItemIndex of
      1: Swod_Mode:=Pens_Swod;
      2: Swod_Mode:=INVALID_SWOD;
     else
         Swod_Mode:=COMMON_SWOD;
     end;
     case RadioGroupP.ItemIndex of
      1: Sowm_Swod:=true;
     else
         Sowm_Swod:=false;
     end;
     ModeIllSS:=RadioGroupIllSS.ItemIndex;
     ModeChernob:=RadioGroupChernob.ItemIndex;
     if ModeChernob<0 then ModeChernob:=0;
     TotalMode:=CheckBoxTotal.Checked;
     PrintMode:=RadioGroupPrintMOde.ItemIndex;
     if ((PrintMode < 0) or (PrintMode>2)) then
        PrintMode:=0;   // 0-FastRep 1 -Excel 2 - Dos
     if Select_Key=5 then
        begin
             NameBay:=pFIBDataSetSelPKGNAME.Value;
             ShifrId:=pFIBDataSetSelPKGShifrId.Value;
             NameServList.ClearAllSelected;
             KategList.ClearAllSelected;
             GruppyList.ClearAllSelected;
             ShifrList.ClearAllSelected;

             pFibQuerySel.Transaction.StartTransaction;
             pFibQuerySel.SQL.Clear;
             pFibQuerySel.SQL.Add('select shifrpod,mode from tb_podr_selection_list where shifridowner='+IntToSTr(ShifrId));
             pFibQuerySel.ExecQuery;
             while not pFibQuerySel.Eof do
              begin
                   ShifrPod:=pFibQuerySel.Fields[0].AsInteger;
                   Mode:=pFibQuerySel.Fields[1].AsInteger;
                   if Mode=1 then
                      NameServList.SetSelected(ShifrPod)
                   else if Mode=2 then
                      GruppyList.SetSelected(ShifrPod)
                   else if Mode=3 then
                      KategList.SetSelected(ShifrPod);
                   pFibQuerySel.Next;
              end;
             pFibQuerySel.Transaction.Commit;

        end;
     MAKE_MAIN_SWOD(Select_Key,Select_Bay_Mode,SelectedBay,NameBay,NeedDogPod,TotalMode,PrintMode,ModeIllSS,SwodSowmMode,ModeChernob);
     if pFIBDataSetOpe.Active then
        pFIBDataSetOpe.Active:=false;
     pFIBDataSetOpe.Open;
     if pFIBDataSetPodr.Active then
        pFIBDataSetPodr.Active:=false;
     pFIBDataSetPodr.Open;

end;

procedure TFormSwodMode.StringGridGrpKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
 var I_Row:integer;
begin
      if Key=VK_Insert then
         begin
              I_Row:=StringGridGrp.Row+1;
              Curr_Gruppa[I_Row]:=Not Curr_Gruppa[I_Row];
              if Curr_Gruppa[I_Row] then
                 StringGridGrp.Cells[0,StringGridGrp.Row]:='*'+StringGridGrp.Cells[0,StringGridGrp.Row]
              else
                 if copy(StringGridGrp.Cells[0,StringGridGrp.Row],1,1)='*' then
                    StringGridGrp.Cells[0,StringGridGrp.Row]:=copy(StringGridGrp.Cells[0,StringGridGrp.Row],2,length(trim(StringGridGrp.Cells[0,StringGridGrp.Row])));

              if StringGridGrp.Row+1<StringGridGrp.RowCount then
                 StringGridGrp.Row:=StringGridGrp.Row+1;
              MakeCnt;
         end;
end;

procedure TFormSwodMode.StringGridGrpMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row     : Longint;
  WantedRow       : integer;
begin
     StringGridGrp.MouseToCell(X, Y, Column, Row);
     if Row<0 then Exit;
     WantedRow := StringGridGrp.Row;
     StringGridGrp.Row:=Row;
     Curr_Gruppa[Row+1] := Not Curr_Gruppa[Row+1];
     if Curr_Gruppa[Row+1] then
        StringGridGrp.Cells[0,Row]:='*'+StringGridGrp.Cells[0,Row]
     else
        if copy(StringGridGrp.Cells[0,Row],1,1)='*' then
           StringGridGrp.Cells[0,Row]:=copy(StringGridGrp.Cells[0,Row],2,length(trim(StringGridGrp.Cells[0,Row])));
     MakeCnt;
end;

procedure TFormSwodMode.StringGridKatKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
 var I_Row:integer;
begin
      if Key=VK_Insert then
         begin
              I_Row:=StringGridKat.Row+1;
              Curr_Kategorija[I_Row]:=Not Curr_Kategorija[I_Row];
              if StringGridKat.Row+1<StringGridKat.RowCount then
                 StringGridKat.Row:=StringGridKat.Row+1;
              MakeCnt;
         end;
end;

procedure TFormSwodMode.StringGridKatMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Column, Row     : Longint;
  WantedRow       : integer;
begin
     StringGridKat.MouseToCell(X, Y, Column, Row);
     if Row<0 then Exit;
     WantedRow := StringGridKat.Row;
     StringGridKat.Row:=Row;
     Curr_Kategorija[Row+1] := Not Curr_Kategorija[Row+1];
     MakeCnt;
end;



procedure TFormSwodMode.StringGridGrpDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol : integer;
    S             : String;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
begin
      vRow := aRow ;
      vCol := aCol ;
      S    := StringGridGrp.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                OldFontColor  := Font.Color;
                OldBrushColor := Brush.Color;
                if (gdSelected in State) then
                   begin
                        Brush.Color := clHighlight;
                        If Curr_Gruppa[vRow+1] then
                           Font.Color := clYellow;
                   end
                                         else
                   if (gdFixed in State) then
                      begin
                           Brush.Color := FixedColor;
                           If Curr_Gruppa[vRow+1] then
                              Brush.Color := clInfoBk;
                      end
                                         else
                      begin
                           Brush.Color := Color;
                           If Curr_Gruppa[vRow+1] then
                              Brush.Color := clInfoBk;
                      end;
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                TextRect(Rect, Rect.Left+5, Rect.Top, S);
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;
end;

procedure TFormSwodMode.StringGridKatDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol : integer;
    S             : String;
    OldFontColor  : TColor;
    OldBrushColor : TColor;
begin
      vRow := aRow ;
      vCol := aCol ;
      S    := StringGridKat.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                OldFontColor  := Font.Color;
                OldBrushColor := Brush.Color;
                if (gdSelected in State) then
                   begin
                        Brush.Color := clHighlight;
                        If Curr_Kategorija[vRow+1] then
                           Font.Color := clYellow;
                   end
                                         else
                   if (gdFixed in State) then
                      begin
                           Brush.Color := FixedColor;
                           If Curr_Kategorija[vRow+1] then
                              Brush.Color := clInfoBk;
                      end
                                         else
                      begin
                           Brush.Color := Color;
                           If Curr_Kategorija[vRow+1] then
                              Brush.Color := clInfoBk;
                      end;
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                TextRect(Rect, Rect.Left+5, Rect.Top, S);
                Font.Color := OldFontColor;
                Brush.Color := OldBrushColor;
           end;
end;

procedure TFormSwodMode.FormShow(Sender: TObject);
begin
      if pFIBDataSetOpe.Active then
         pFIBDataSetOpe.Active:=false;
      pFIBDataSetOpe.Open;
      if pFIBDataSetPodr.Active then
         pFIBDataSetPodr.Active:=false;
      pFIBDataSetPodr.Open;
      if pFIBDataSetSelPKG.Active then
         pFIBDataSetSelPKG.Close;
      if pFIBDataSetSelPKG.Transaction.Active then
         pFIBDataSetSelPKG.Transaction.Commit;
      if pFIBDataSetSelPKG.UpdateTransaction.Active then
         pFIBDataSetSelPKG.UpdateTransaction.Commit;
      if pFIBDataSetSelPKG.Active then
         pFIBDataSetSelPKG.Active:=false;
      pFIBDataSetSelPKG.Transaction.StartTransaction;
      pFIBDataSetSelPKG.Open;
end;

procedure TFormSwodMode.ComboBoxModeChange(Sender: TObject);
begin
     if ComboBoxMode.ItemIndex=0 then
        begin
             StringGridGrp.Hide;
             StringGridKat.Hide;
             dxDBGridSelPkg.Hide;
             dxDBGridSelPkg.Enabled:=false;
             DBNavigatorSelPKG.Hide;

        end
     else if ComboBoxMode.ItemIndex=1 then
        begin
             StringGridGrp.Show;
             StringGridKat.Hide;
             dxDBGridSelPkg.Hide;
             dxDBGridSelPkg.Enabled:=false;
             DBNavigatorSelPKG.Hide;
             
        end
     else if ComboBoxMode.ItemIndex=2 then
        begin
             StringGridGrp.Hide;
             StringGridKat.Show;
             dxDBGridSelPkg.Hide;
             dxDBGridSelPkg.Enabled:=false;
             DBNavigatorSelPKG.Hide;
             
        end
     else if ComboBoxMode.ItemIndex=3 then
        begin
             StringGridGrp.Show;
             StringGridKat.Show;
             dxDBGridSelPkg.Hide;
             dxDBGridSelPkg.Enabled:=false;
             DBNavigatorSelPKG.Hide;
             
        end
     else if ComboBoxMode.ItemIndex=4 then
        begin
             StringGridGrp.Hide;
             StringGridKat.Hide;
             dxDBGridSelPkg.Show;
             dxDBGridSelPkg.Enabled:=true;
             DBNavigatorSelPKG.Show;

        end
end;

procedure TFormSwodMode.ComboBoxUchChange(Sender: TObject);
begin
     if ComboBoxUch.ItemIndex=0 then
        begin
             dxDBGridOpe.Hide;
             dxDBGridPodr.Hide;
        end
     else if ComboBoxUch.ItemIndex=1 then
        begin
             dxDBGridOpe.Show;
             dxDBGridPodr.Hide;
             dxDBGridSelPkg.Hide;
             dxDBGridSelPkg.Enabled:=false;
        end
     else if ComboBoxUch.ItemIndex=2 then
        begin
             dxDBGridOpe.Hide;
             dxDBGridPodr.Show;
             dxDBGridSelPkg.Hide;
             dxDBGridSelPkg.Enabled:=false;
        end

end;

procedure TFormSwodMode.MakeCnt;
 var CntGrp,CntKat,CntPodr:integer;
     i:integer;
 begin
      CntGrp  := 0;
      CntKat  := 0;
      CntPodr := 0;
      for i:=1 to max_ist_fin do
          if Curr_Gruppa[i] then Inc(CntGrp);

      for i:=1 to max_kategorija do
          if Curr_Kategorija[i] then Inc(CntKat);

      if (CntGrp>0) or (CntKat>0) then
         begin
              LabelCnt.Caption:=IntToStr(CntGrp);
              if (CntKat>0) then
                 LabelCnt.Caption:=trim(LabelCnt.Caption)+' '+IntToStr(CntKat);
         end
                                  else
         LabelCnt.Caption:='';
 end;



procedure TFormSwodMode.N1Click(Sender: TObject);
begin
      if CntFormSelPKGSave=0 then
         begin
              Application.CreateForm(TFormSelPKGSave,FormSelPKGSave);
              FormSelPKGSave.Show;
         end;
      Self.InInsertMode:=true;
      pFIBDataSetSelPKG.Close;
      pFIBDataSetSelPKG.Open;

end;

procedure TFormSwodMode.N2Click(Sender: TObject);
 var ShifrId : integer;
begin
      ShifrId:=pFIBDataSetSelPKGSHIFRID.Value;
      if ShifrId<=0 then Exit;
      if CntFormSelPKGSave=0 then
         begin
              Application.CreateForm(TFormSelPKGSave,FormSelPKGSave);
              FormSelPKGSave.MarkPKG(ShifrId);
              FormSelPKGSave.Show;
         end;

end;

procedure TFormSwodMode.FormActivate(Sender: TObject);
begin
    if Self.InInsertMode then
       begin
            pFIBDataSetSelPKG.Close;
            pFIBDataSetSelPKG.Open;
            Self.InInsertMode:=false;
       end;

end;

procedure TFormSwodMode.btnSowmModeClick(Sender: TObject);
begin
     FormSwodSwmMode:=TFormSwodSwmMode.MyCreate(nil,SwodSowmMode);
     FormSwodSwmMode.ShowModal;
     Application.ProcessMessages;
end;

procedure TFormSwodMode.SetAllServSelected;
 var I:Integer;
 begin
      for i:=1 to Count_Serv do
          NameServList.SetSelected(I);
 end;





end.
