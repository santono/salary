unit uFormMovBol;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ValEdit, ScrDef, ImgList,
  HSHintComboBox;

type
     PRec = ^ARec;
     ARec = record
             Code  : Integer;
             Summa : real;
            end;
     PPersonRec=^TPersonRec;
     TPersonRec = record
                    ShifrKat     : integer;
                    ShifrGru     : Integer;
                    ShifrDol     : Integer;
                    ShifrWR      : Integer;
                    ShifrPod     : Integer;
                    ShifrSwmMode : Integer;
                    Moved        : boolean;
                    Dolg:String;
                    Show:String;
                  end;
  TFormMovBol = class(TForm)
    BitBtn1     : TBitBtn;
    SummaBudTxt : TStaticText;
    SummaVneTxt : TStaticText;
    SummaGNTxt  : TStaticText;
    SummaNISTxt : TStaticText;
    ComboBoxBud : TComboBox;
    ComboBoxVne : TComboBox;
    ComboBoxGN  : TComboBox;
    ComboBoxNIS : TComboBox;
    BtnMove     : TBitBtn;
    StringGridSel: TStringGrid;
    ImageList1: TImageList;
    ComboBoxBudGru: TComboBox;
    ComboBoxBudKat: TComboBox;
    ComboBoxVNEGru: TComboBox;
    ComboBoxVNEKAT: TComboBox;
    ComboBoxGNGru: TComboBox;
    ComboBoxGNKat: TComboBox;
    ComboBoxNISGru: TComboBox;
    ComboBoxNISKat: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FillPersonList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnMoveClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure StringGridSelDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridSelDblClick(Sender: TObject);
    procedure FHSHintComboBoxBudChange(Sender: TObject);
    procedure FHSHintComboBoxVneChange(Sender: TObject);
    procedure FHSHintComboBoxGNChange(Sender: TObject);
    procedure FHSHintComboBoxNISChange(Sender: TObject);
    procedure ComboBoxBudGruChange(Sender: TObject);
    procedure ComboBoxBudKatChange(Sender: TObject);
    procedure ComboBoxVNEGruChange(Sender: TObject);
    procedure ComboBoxVNEKATChange(Sender: TObject);
    procedure ComboBoxGNGruChange(Sender: TObject);
    procedure ComboBoxGNKatChange(Sender: TObject);
    procedure ComboBoxNISGruChange(Sender: TObject);
    procedure ComboBoxNISKatChange(Sender: TObject);

  private
    { Private declarations }
    SummaBud : real;
    SummaVne : real;
    SummaGN  : real;
    SummaNIS : real;
    FHSHintComboBoxBud : THSHintComboBox;
    FHSHintComboBoxVne : THSHintComboBox;
    FHSHintComboBoxGN  : THSHintComboBox;
    FHSHintComboBoxNIS : THSHintComboBox;
    procedure PrepareList;
    function IsMovedBol(ShifrIdBoln:integer):boolean;
public
    WantedTabno : integer;
    Curr_Person : Person_Ptr;
    ShifrIdBoln : Integer;
    Mode_Ill    : integer;
    CodeMove    : integer; {0-перенос всего больничного 5 - 5 дней 6 - всего остального}
    procedure PrepareHints;
    { Public declarations }
  end;

  TStrColor = class(TObject)
   public
        Color      : TColor;  {вы могли бы также определить частные и
                               публичные методы доступа}
        BackColor  : TColor;
        SelectedColor : TColor;
    end;

 function GetNmbOfBoln(Tabno:integer):Integer;

var
  FormMovBol : TFormMovBol;
  PersonList : TList;

implementation
uses UFibModule,uFormWait,ScrUtil,SCRIO,Types,DateUtils,ScrLists,
     USQLUnit;

{$R *.dfm}
  function GetNmbOfBoln(Tabno:integer):Integer;
   var S:String;
       I_Count:integer;
       SQLStmnt:string;
       v:variant;
   begin
         Result := 0;

         SQLStmnt:='SELECT count(*) FROM boln where tabno='+IntToStr(Tabno)+
             ' and Month_Vy='+IntToStr(Nmes)+' and Year_Vy='+IntToStr(CurrYear);
         v:=SQLQueryValue(SQLStmnt);
         i_count:=v;
         if ((I_Count>0) and (I_Count<10)) then
            Result:=I_Count;
   end;

  function IsCorrectPodrForBoln(WantedSrv:integer):boolean;
   var S:String;
       I_Count:integer;
       RetVal:boolean;
       v:Variant;
       SQLStmnt:string;
   begin
         RetVal:=true;
         SQLStmnt:='SELECT count(*) FROM I_PODR where mode=1 and SHIFR_POD='+IntToStr(WANTEDSRV);
         v:=SQLQueryValue(SQLStmnt);
         i_count:=v;
         if (I_Count>0) then RetVal:=false;
         IsCorrectPodrForBoln:=RetVal;
   end;

procedure TFormMovBol.PrepareList;
var
    Rec     : PRec;
    S       : String;
    I       : Integer;
    WantedIndex : integer;
    v,vv    : Variant;
begin
{
    S:= 'select Sum(summa_b_bud),'+
        ' Sum(summa_b_vne),'+
        ' Sum(summa_b_gn),'+
        ' Sum(summa_b_nis)'+
        ' from boln_res'+
        ' join boln on boln.shifrid=Boln_res.shifridboln'+
        ' where boln.Tabno='+IntToStr(WantedTabno)+
        ' and Year_Vy='+IntToStr(CurrYear)+' and Month_Vy='+IntToStr(NMES);
}
    S:= 'select Sum(summa_b_bud),'+
        ' Sum(summa_b_vne),'+
        ' Sum(summa_b_gn),'+
        ' Sum(summa_b_nis)'+
        ' from boln_res'+
        ' join boln on boln.shifrid=Boln_res.shifridboln'+
        ' where boln.ShifrId='+IntToStr(ShifrIdBoln);
    if CodeMove=5 then
       S:=S+ ' and boln_res.shifrsta=12'
    else if CodeMove=6 then
       S:=S+ ' and boln_res.shifrsta<>12';
(*
    if not FIB.pFIBQuery.Transaction.Active then
       FIB.pFIBQuery.Transaction.StartTransaction;
    FIB.pFIBQuery.SQL.Clear;
    FIB.pFIBQuery.SQL.Add(S);
    try
       FormWait.Show;
       Application.ProcessMessages;
       FIB.pFIBQuery.ExecQuery;
       FormWait.Hide;
       SummaBud := FIB.pFIBQuery.Fields[0].AsFloat;
       SummaVne := FIB.pFIBQuery.Fields[1].AsFloat;
       SummaGn  := FIB.pFIBQuery.Fields[2].AsFloat;
       SummaNIS := FIB.pFIBQuery.Fields[3].AsFloat;
       FIB.pFIBQuery.Close;
    except
      else
       ShowMessage('Ошибка получения суммы больничного');
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       Exit;
    end;
    if FIB.pFIBQuery.Transaction.Active then
       FIB.pFIBQuery.Transaction.Commit;
*)
    SummaBud := 0.00;
    SummaVne := 0.00;
    SummaGn  := 0.00;
    SummaNIS := 0.00;
    v:=SQLQueryRecValues(s);
    if VarIsArray(v) then
       begin
            if VarIsFloat(v[0]) then
               SummaBud := v[0];
            if VarIsFloat(v[1]) then
               SummaVne := v[1];
            if VarIsFloat(v[2]) then
               SummaGn := v[2];
            if VarIsFloat(v[3]) then
               SummaNis := v[3];
       end;

    SummaBudTxt.Caption := '';
    SummaVneTxt.Caption := '';
    SummaGnTxt.Caption  := '';
    SummaNisTxt.Caption := '';
    if abs(SummaBud)>0.009 then
       begin
            SummaBudTxt.Caption := FORMAT('Бюджет    %12.2f %s',[SummaBud,getShortCurrencyName]);
            ComboBoxBud.Show;
            WantedIndex := -1;
            for i:=1 to PersonList.Count do
                begin
                     ComboBoxBud.Items.Add(PPersonRec(PersonList.Items[i-1])^.Show);
                     if PPersonRec(PersonList.Items[i-1])^.ShifrPod in [76,81,82,102,128,140] then Continue; 
                     if (WantedIndex < 0) then
                        if GruppyList.GetShifrGruM(PPersonRec(PersonList.Items[i-1])^.ShifrGru)=1 then
                           WantedIndex := i-1;
                end;
            if WantedIndex>=0 then
               ComboBoxBud.ItemIndex := WantedIndex
            else
               begin
                    if ComboBoxBud.Items.Count>0 then
                       ComboBoxBud.ItemIndex:=ComboBoxBud.Items.Count-1
                    else
                        ComboBoxBud.ItemIndex:=-1;
               end;
            if (CodeMove=6) and (ComboBoxBud.ItemIndex>0) then
               ComboBoxBud.ItemIndex:=0;
            if ComboBoxBudKat.Visible then
              if (PPersonRec(PersonList.Items[ComboBoxBud.ItemIndex])^.ShifrKat>0) then
                  ComboBoxBudKat.ItemIndex:=PPersonRec(PersonList.Items[ComboBoxBud.ItemIndex])^.ShifrKat-1;
      end
    else
       begin
            ComboBoxBud.Hide;
            ComboBoxBudKat.Hide;
            ComboBoxBudGru.Hide;
{            FHSHintComboBoxBud.Hide;     }
       end;
    if abs(SummaVne)>0.009 then
       begin
            SummaVneTxt.Caption := FORMAT('Внебюджет %12.2f %s',[SummaVne,getShortCurrencyName]);
            ComboBoxVne.Show;
            WantedIndex := -1;
            for i:=1 to PersonList.Count do
               begin
                    ComboBoxVne.Items.Add(PPersonRec(PersonList.Items[i-1])^.Show);
                    if PPersonRec(PersonList.Items[i-1])^.ShifrPod in [76,81,82,102,128,140] then Continue;
                    if (WantedIndex < 0) then
                        if GruppyList.GetShifrGruM(PPersonRec(PersonList.Items[i-1])^.ShifrGru)=2 then
                           WantedIndex := i-1;
               end;
            if WantedIndex>=0 then
               ComboBoxVne.ItemIndex := WantedIndex
            else
               begin
                    if ComboBoxVne.Items.Count>0 then
                       ComboBoxVne.ItemIndex:=ComboBoxVne.Items.Count-1
                    else
                        ComboBoxVne.ItemIndex:=-1;
               end;
            if (CodeMove=6) and (ComboBoxVne.ItemIndex>0) then
               ComboBoxVne.ItemIndex:=0;
            if ComboBoxVneKat.Visible then
              if (PPersonRec(PersonList.Items[ComboBoxVne.ItemIndex])^.ShifrKat>0) then
                  ComboBoxVneKat.ItemIndex:=PPersonRec(PersonList.Items[ComboBoxVne.ItemIndex])^.ShifrKat-1;
       end
    else
       begin
            ComboBoxVne.Hide;
            ComboBoxVneKat.Hide;
            ComboBoxVneGru.Hide;
{            FHSHintComboBoxVne.Hide;         }
       end;
    if abs(SummaGn)>0.009 then
       begin
            SummaGnTxt.Caption :=  FORMAT('ГН        %12.2f %s',[SummaGN,getShortCurrencyName]);
            ComboBoxGn.Show;
            WantedIndex := -1;
            for i:=1 to PersonList.Count do
                begin
                     ComboBoxGn.Items.Add(PPersonRec(PersonList.Items[i-1])^.Show);
                     if PPersonRec(PersonList.Items[i-1])^.ShifrPod in [76,81,82,102,128,140] then Continue;
                     if (WantedIndex < 0) then
                        if GruppyList.GetShifrGruM(PPersonRec(PersonList.Items[i-1])^.ShifrGru)=3 then
                           WantedIndex := i-1;
                end;
            if WantedIndex>=0 then
               ComboBoxGN.ItemIndex := WantedIndex
            else
               begin
                    if ComboBoxGn.Items.Count>0 then
                       ComboBoxGn.ItemIndex:=ComboBoxGn.Items.Count-1
                    else
                        ComboBoxGn.ItemIndex:=-1;
               end;
            if (CodeMove=6) and (ComboBoxGn.ItemIndex>0) then
               ComboBoxGn.ItemIndex:=0;
            if ComboBoxGNKat.Visible then
              if (PPersonRec(PersonList.Items[ComboBoxGN.ItemIndex])^.ShifrKat>0) then
                  ComboBoxGNKat.ItemIndex:=PPersonRec(PersonList.Items[ComboBoxGN.ItemIndex])^.ShifrKat-1;

       end
    else
       begin
            ComboBoxGn.Hide;
            ComboBoxGNKat.Hide;
            ComboBoxGNGru.Hide;
{            FHSHintComboBoxGn.Hide;      }
       end;
    if abs(SummaNIS)>0.009 then
       begin
            SummaNISTxt.Caption := FORMAT('НИС       %12.2f %s',[SummaNis,getShortCurrencyName]);
            ComboBoxNIS.Show;
            WantedIndex := -1;
            for i:=1 to PersonList.Count do
                begin
                     ComboBoxNIS.Items.Add(PPersonRec(PersonList.Items[i-1])^.Show);
                     if PPersonRec(PersonList.Items[i-1])^.ShifrPod in [76,81,82,102,128,140] then Continue; 
                     if (WantedIndex < 0) then
                        if GruppyList.GetShifrGruM(PPersonRec(PersonList.Items[i-1])^.ShifrGru)=4 then
                           WantedIndex := i-1;
                end;
            if WantedIndex>=0 then
               ComboBoxNIS.ItemIndex := WantedIndex
            else
               begin
                    if ComboBoxNIS.Items.Count>0 then
                       ComboBoxNis.ItemIndex:=ComboBoxNIS.Items.Count-1
                    else
                        ComboBoxNis.ItemIndex:=-1;
               end;
            if (CodeMove=6) and (ComboBoxNIS.ItemIndex>0) then
               ComboBoxNIS.ItemIndex:=0;
            if ComboBoxNISKat.Visible then
              if (PPersonRec(PersonList.Items[ComboBoxNIS.ItemIndex])^.ShifrKat>0) then
                  ComboBoxNISKat.ItemIndex:=PPersonRec(PersonList.Items[ComboBoxNIS.ItemIndex])^.ShifrKat-1;
       end
    else
       begin
            ComboBoxNIS.Hide;
            ComboBoxNISKat.Hide;
            ComboBoxNISGru.Hide;
{            FHsHintComboBoxNIS.Hide;    }
       end;

    StringGridSel.RowCount     := PersonList.Count;
    StringGridSel.ColWidths[0] := StringGridSel.Width;
    for i:=0 to PersonList.Count-1 do
        begin
             StringGridSel.Cells[0,i]   := PPersonRec(PersonList.Items[i])^.Show;
{             StringGridSel.Objects[0,i] := Nil;}
             StringGridSel.Objects[0,i]:=TStrColor.Create;

        end
  end;
procedure TFormMovBol.FormCreate(Sender: TObject);
var i:integer;
begin
     SummaBud := 0;
     SummaVne := 0;
     SummaGN  := 0;
     SummaNIS := 0;
     for i:=1 to Max_Kategorija do
         begin
              ComboBoxBudKat.Items.Add(get_kat_name(i));
              ComboBoxVneKat.Items.Add(get_kat_name(i));
              ComboBoxGNKat.Items.Add(get_kat_name(i));
              ComboBoxNISKat.Items.Add(get_kat_name(i));
              ComboBoxBudKat.ItemIndex := 0;
              ComboBoxVneKat.ItemIndex := 0;
              ComboBoxGNKat.ItemIndex  := 0;
              ComboBoxNISKat.ItemIndex := 0;
         end;
     for i:=1 to Max_Ist_Fin do
         begin
              ComboBoxBudGru.Items.Add(Get_Ist_Name(i));
              ComboBoxVneGru.Items.Add(Get_Ist_Name(i));
              ComboBoxGNGru.Items.Add(Get_Ist_Name(i));
              ComboBoxNISGru.Items.Add(Get_Ist_Name(i));
              ComboBoxBudGru.ItemIndex := 0;
              ComboBoxVneGru.ItemIndex :=10;
              ComboBoxGNGru.ItemIndex  := 2;
              ComboBoxNISGru.ItemIndex := 5;
         end;
      BtnMove.Enabled:=true;

end;

procedure TFormMovBol.FillPersonList;
 var
     Curr_Sowm:Sowm_Ptr;
     NSRV_TMP:integer;
     ShifrKatOsn,i:integer;
 procedure MarkSowm(N:Integer);
  var C_S:SOWM_PTR;
  begin
        C_S:=CURR_PERSON^.Sowm;
        while (C_S<>Nil) do
         begin
              if C_S^.Where=N then C_S^.Where:=C_S^.Where+1000;
              C_S:=C_S^.Next;
         end;
  end;
 procedure ReMarkSowm;
  var C_S:SOWM_PTR;
  begin
        C_S:=CURR_PERSON^.Sowm;
        while (C_S<>Nil) do
         begin
              if C_S^.Where>999 then C_S^.Where:=C_S^.Where-1000;
              C_S:=C_S^.Next;
         end;
  end;
 procedure FillPersonFromPodr;
  var C_P       : Person_Ptr ;
      PersonRec : PPersonRec ;
      S_Osn     : String     ;
  begin
     C_P:=Head_Person;
     while (C_P<>Nil) do
      begin
            if (C_P^.Tabno=WantedTabno) then
            if (C_P^.KATEGORIJA<>1) or
               ((C_P^.KATEGORIJA=1)
               { and (POS('ПОВ',UPPER_STRING(C_P^.DOLG))=0)}
               ) then
                begin
                     New(PersonRec);
                     if ((ShifrKatOsn=0) or
                         (C_P^.Wid_Raboty=1)) then ShifrKatOsn:=C_P^.KATEGORIJA;
                     PersonRec^.ShifrKat := C_P^.KATEGORIJA;
                     PersonRec^.ShifrGru := C_P^.GRUPPA;
                     PersonRec^.ShifrDol := Get_Dol_Code(C_P);
                     PersonRec^.ShifrPod := NSRV;
                     if IS_OSN_WID_RABOTY(C_P) then
                        begin
                              PersonRec^.ShifrWR  := 1;
                              S_Osn:='Осн';
                        end
                                               else
                        begin
                              PersonRec^.ShifrWR  := 2;
                              S_Osn:='Свм';
                        end;
                     PersonRec^.Dolg         := C_P^.Dolg;
                     PersonRec^.ShifrSwmMode := Get_Swm_Mode_Person(C_P);
                     PersonRec^.Show:=AllTrim(C_P^.Dolg)+' '+S_Osn+' '+
                                      AllTrim(GET_IST_NAME(C_P^.GRUPPA))+' '+
                                      AllTrim(GET_KAT_NAME(C_P^.KATEGORIJA))+' '+
                                      AllTrim(NAME_SERV(NSRV))+' '+
                                      AllTrim(GET_DOL_NAME(C_P))+' '+
                                      AllTrim(Get_Swm_Name(Get_Swm_Mode_Person(C_P)));
                     PersonRec^.Moved := false;
                    PersonList.Add(PersonRec);
                end;
            C_P:=C_P^.Next;
      end;
  end;
procedure AddCreateNewPersonRec;
  var    PersonRec : PPersonRec ;
  begin
       New(PersonRec);
       PersonRec^.ShifrKat      := 0 ;
       if ShifrKatOsn>0 then
          PersonRec^.ShifrKat   := ShifrKatOsn ;
       PersonRec^.ShifrGru      := 0 ;
       PersonRec^.ShifrDol      := 0 ;
       PersonRec^.ShifrPod      := 0 ;
       PersonRec^.ShifrWR       := 0 ;
       PersonRec^.ShifrSwmMode  := 0 ;
       PersonRec^.Dolg          := 'Перенос.';
       PersonRec^.Show          := 'Создать новую запись';
       PersonRec^.Moved         := false;
       PersonList.Add(PersonRec);
  end;
 begin
     ShifrKatOsn:=0;
     if CodeMove = 6 then
        AddCreateNewPersonRec;
     FillPersonFromPodr;
     MarkSowm(NSRV);
     Curr_Sowm:=Curr_Person^.Sowm;
     select(2);
     NSRV_TMP:=NSRV;
     while (Curr_Sowm<>Nil) do
      begin
           if Curr_Sowm^.Where<1000 then
           if IsCorrectPodrForBoln(Curr_Sowm^.Where) then
              begin
                   empty_all_person;
                   nsrv:=Curr_Sowm^.Where;
                   MKFLNM;
                   GETINF(TRUE);
                   FillPersonFromPodr;
                   MarkSowm(Curr_Sowm^.Where);
                   EMPTY_ALL_PERSON;
              end;
              Curr_Sowm:=Curr_Sowm^.Next;
      end;
     Select(1);
     if CodeMove<>6 then
       AddCreateNewPersonRec;
     if ShifrKatOsn>0 then
        for i:=0 to PersonList.Count-1 do
            if PPersonRec(PersonList.Items[i])^.ShifrKat=0 then
               PPersonRec(PersonList.Items[i])^.ShifrKat:=ShifrKatOsn;
     NSRV:=NSRV_TMP;
     MKFLNM;
     ReMarkSowm;
 end;
procedure TFormMovBol.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     PersonList.Free;
     Action:=caFree;
end;

procedure TFormMovBol.FormShow(Sender: TObject);
begin
     if Mode_Ill=10 then
        Caption:='Перенос командировочных'
     else
        Caption:='Перенос больничных';

{
     PersonList:=TList.Create;
     FillPersonList;
     PrepareList;
}
end;


function TFormMovBol.IsMovedBol(ShifrIdBoln:integer):boolean;
  var S:String;
      RetVal:boolean;
      Date_P_Bud,Date_P_Vne,Date_P_GN,Date_P_NIS : Tdate;
  begin
       RetVal:=false;
       S:='select Data_P_Bud,Data_P_Vne,Data_P_GN,Data_P_NIS from boln  where ShifrId=' + IntToStr(ShifrIDBoln);
       if FIB.pFIBQuery.Open then FIB.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add(S);
       if not FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.StartTransaction;
       try
          FIB.pFIBQuery.ExecQuery;
          while not FIB.pFIBQuery.Eof do
             begin
                  Date_P_Bud := FIB.pFIBQuery.Fields[0].AsDate;
                  Date_P_Vne := FIB.pFIBQuery.Fields[1].AsDate;
                  Date_P_GN  := FIB.pFIBQuery.Fields[2].AsDate;
                  Date_P_NIS := FIB.pFIBQuery.Fields[3].AsDate;
                  if CodeMove=5 then
                     begin
                          if (YearOf(Date_P_Bud)>2000) then
                              RetVal:=true;
                     end
                  else if CodeMove=6 then  
                     begin
                          if (YearOf(Date_P_VNE)>2000) then
                              RetVal:=true;
                     end
                  else
                     begin
                          if ((YearOf(Date_P_Bud)>2000)   or
                              (YearOf(Date_P_Vne)>2000)   or
                              (YearOf(Date_P_GN) >2000)    or
                              (YearOf(Date_P_NIS)>2000))  then
                              RetVal:=true;
                     end;
                  break;
             end;
       except
           ShowMessage('Ошибка запроса дат переноса больничного');
       end;
       FIB.pFIBQuery.Transaction.Commit;
       IsMovedBol:=RetVal;
  end;




procedure TFormMovBol.BtnMoveClick(Sender: TObject);
var i,j:integer;
begin
      BtnMove.Enabled:=False;
      if IsMovedBol(ShifrIdBoln) then
         begin
              ShowMessage('Больничный уже перенесен.');
              Exit;
         end;
 //    if IsShifrInAddPerson(Curr_Person,138) then
 //       i:=1;;

     if (abs(SummaBud)>0.009) and (FHSHintComboBoxBud.ItemIndex>=0) then
        begin
             if CodeMove=6 then // Создание новой строки
             if PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrDol = 0  then
                begin
                     PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrKat := ComboBoxBudKat.ItemIndex+1;
                     PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrGru := ComboBoxBudGru.ItemIndex+1;
                end;
             MoveBolToPerson(ShifrIdBoln,1,WantedTabno,
                 PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrPod,
                 PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrKat,
                 PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrGru,
                 PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrDol,
                 PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrWR,
                 PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrSwmMode,
                 PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.Dolg,True,Self.CodeMove);
             PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.Moved:=true;
        end;
  //   if IsShifrInAddPerson(Curr_Person,138) then
  //      i:=1;;


     if (abs(SummaVNE)>0.009) and (FHSHintComboBoxVNE.ItemIndex>=0) then
        begin
             if CodeMove=6 then // Создание новой строки
             if PPersonRec(PersonList.Items[FHSHintComboBoxVne.ItemIndex])^.ShifrDol = 0  then
                begin
                     PPersonRec(PersonList.Items[FHSHintComboBoxVne.ItemIndex])^.ShifrKat := ComboBoxVneKat.ItemIndex+1;
                     PPersonRec(PersonList.Items[FHSHintComboBoxVne.ItemIndex])^.ShifrGru := ComboBoxVneGru.ItemIndex+1;
                end;
             MoveBolToPerson(ShifrIdBoln,2,WantedTabno,
                 PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrPod,
                 PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrKat,
                 PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrGru,
                 PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrDol,
                 PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrWR,
                 PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrSwmMode,
                 PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.Dolg,True,Self.CodeMove);
             PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.Moved:=true;
        end;
     if (abs(SummaGN)>0.009) and (FHSHintComboBoxGN.ItemIndex>=0) then
        begin
             if CodeMove=6 then // Создание новой строки
             if PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrDol = 0  then
                begin
                     PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrKat := ComboBoxGNKat.ItemIndex+1;
                     PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrGru := ComboBoxGNGru.ItemIndex+1;
                end;
             MoveBolToPerson(ShifrIdBoln,3,WantedTabno,
                 PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrPod,
                 PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrKat,
                 PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrGru,
                 PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrDol,
                 PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrWR,
                 PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrSwmMode,
                 PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.Dolg,True,Self.CodeMove);
             PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.Moved:=true;
        end;
     if (abs(SummaNIS)>0.009) and (FHSHintComboBoxNIS.ItemIndex>=0) then
        begin
             if CodeMove=6 then // Создание новой строки
             if PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrDol = 0  then
                begin
                     PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrKat := ComboBoxNISKat.ItemIndex+1;
                     PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrGru := ComboBoxNISGru.ItemIndex+1;
                end;
             MoveBolToPerson(ShifrIdBoln,4,WantedTabno,
                 PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrPod,
                 PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrKat,
                 PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrGru,
                 PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrDol,
                 PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrWR,
                 PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrSwmMode,
                 PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.Dolg,True,Self.CodeMove);
             PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.Moved:=true;
        end;
   //  if IsShifrInAddPerson(Curr_Person,138) then
   //     i:=1;;

     for i:=0 to StringGridSel.RowCount-1 do
         begin
               if i=FHSHintComboBoxBud.ItemIndex then continue;
               if i=FHSHintComboBoxVNE.ItemIndex then continue;
               if PPersonRec(PersonList.Items[i])^.Moved then continue;
               if not Assigned(StringGridSel.Objects[0,i]) then continue;
               MoveBolToPerson(ShifrIdBoln,2,WantedTabno, { Группа указана вторая но это все равно ведь только перрасчет по табелю }
                   PPersonRec(PersonList.Items[i])^.ShifrPod,
                   PPersonRec(PersonList.Items[i])^.ShifrKat,
                   PPersonRec(PersonList.Items[i])^.ShifrGru,
                   PPersonRec(PersonList.Items[i])^.ShifrDol,
                   PPersonRec(PersonList.Items[i])^.ShifrWR,
                   PPersonRec(PersonList.Items[i])^.ShifrSwmMode,
                   PPersonRec(PersonList.Items[i])^.Dolg,
                   False,Self.CodeMove);
 //    try
 //       j:=1;
 //       if IsShifrInAddPerson(Curr_Person,138) then
 //         j:=1;;
 //    finally
 //       j:=2;
 //    end;



         end;
     if Mode_Ill=10 then
        ShowMessage('Командировочный перенесен')
     else
        ShowMessage('Больничный перенесен');
  //   if IsShifrInAddPerson(Curr_Person,138) then
  //      i:=1;;
     ModalResult:=mrYes;
//     Self.Close;
end;

procedure TFormMovBol.FormResize(Sender: TObject);
begin
    StringGridSel.ColWidths[0]:=StringGridSel.Width;
end;


procedure TFormMovBol.StringGridSelDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var i,k           : integer;
    vRow,vCol     : integer;
    S             : String;
begin
      i:=1;
      vRow:=aRow;
      vCol:=aCol;
      if vRow<0 then Exit;
      S:=StringGridSel.Cells[vCol,vRow];
      with Sender as TStringGrid, Canvas do
           begin
                if (gdSelected in State) and (Sender = ActiveControl) then
                    begin
                         Brush.Color := clHighlight;
                         Font.Color := clWindow;
                    end
                else if (gdFixed in State) and (Sender = ActiveControl ) then
                         Brush.Color := FixedColor
                else
                    begin
                         Brush.Color := Color;
                         Font.Color  := clWindowText;
                         if (vRow mod 2 = 1) then Brush.Color:=clInfoBk
                                             else Brush.Color:=cl3dLight;
                    end;
                FillRect(Rect);
                SetBkMode(Handle, TRANSPARENT);
                SetTextAlign(Handle, TA_LEFT);
                TextRect(Rect, Rect.Left+20, Rect.Top, S);
           end;
      if Assigned(TStringGrid(Sender).Objects[vCol,vRow]) then
          ImageList1.Draw(TStringGrid(Sender).Canvas,Rect.Left+1,Rect.Top+2,0)
end;

procedure TFormMovBol.StringGridSelDblClick(Sender: TObject);
 var I:Integer;
     Row,Col:Integer;
 begin
       Row:=StringGridSel.Row;
       Col:=StringGridSel.Col;
       if Assigned(StringGridSel.Objects[Col,Row]) then
          begin
                StringGridSel.Objects[Col,Row].Free;
                StringGridSel.Objects[Col,Row]:=Nil;
          end
       else
          begin
               StringGridSel.Objects[Col,Row]:=TStrColor.Create;
               (StringGridSel.Objects[Col,Row] as TStrColor).Color     := clInfoText;
               (StringGridSel.Objects[Col,Row] as TStrColor).BackColor := clInfoBk;
               (StringGridSel.Objects[Col,Row] as TStrColor).SelectedColor := clYellow;
          end;

end;

procedure TFormMovBol.PrepareHints;
 begin
     PersonList:=TList.Create;
     FillPersonList;
     PrepareList;

     FHSHintComboBoxBud := THSHintComboBox.Create(Self);
     with FHSHintComboBoxBud do
          begin
               Parent := Self;
               Anchors := ComboBoxBud.Anchors;
               Items.Assign(ComboBoxBud.Items);
               ItemIndex:=ComboBoxBud.ItemIndex;
               BoundsRect := ComboBoxBud.BoundsRect;
               if NOT (ComboBoxBud.Style in [csDropDown, csDropDownList]) then
                 raise Exception.Create (
                    'HSHintComboBox поддерживает стиль только csDropDown и csDropDownList');
               Style := ComboBoxBud.Style;
               DropDownCount := ComboBoxBud.DropDownCount;
               TabOrder := ComboBoxBud.TabOrder;
               TabStop  := ComboBoxBud.TabStop;
               onChange := FHSHintComboBoxBudChange;
  //  OnListMouseMove := HSHintComboBoxListMouseMove;
          end;
      if not ComboBoxBud.Visible then
         FHSHintComboBoxBud.Hide;
     ComboBoxBud.Free();


     FHSHintComboBoxVne := THSHintComboBox.Create(Self);
     with FHSHintComboBoxVne do
          begin
               Parent     := Self;
               Anchors    := ComboBoxVne.Anchors;
               Items.Assign(ComboBoxVne.Items);
               ItemIndex  := ComboBoxVne.ItemIndex;
               BoundsRect := ComboBoxVne.BoundsRect;
               if NOT (ComboBoxVne.Style in [csDropDown, csDropDownList]) then
                 raise Exception.Create (
                    'HSHintComboBox поддерживает стиль только csDropDown и csDropDownList');
               Style := ComboBoxVne.Style;
               DropDownCount := ComboBoxVne.DropDownCount;
               TabOrder := ComboBoxVne.TabOrder;
               TabStop  := ComboBoxVne.TabStop;
               onChange := FHSHintComboBoxVneChange;
  //  OnListMouseMove := HSHintComboBoxListMouseMove;
          end;
     if not ComboBoxVne.Visible then
        FHSHintComboBoxVne.Hide;
     ComboBoxVne.Free();

     FHSHintComboBoxGN := THSHintComboBox.Create(Self);
     with FHSHintComboBoxGN do
          begin
               Parent     := Self;
               Anchors    := ComboBoxGN.Anchors;
               Items.Assign(ComboBoxGN.Items);
               ItemIndex  := ComboBoxGN.ItemIndex;
               BoundsRect := ComboBoxGN.BoundsRect;
               if NOT (ComboBoxGN.Style in [csDropDown, csDropDownList]) then
                 raise Exception.Create (
                    'HSHintComboBox поддерживает стиль только csDropDown и csDropDownList');
               Style := ComboBoxGN.Style;
               DropDownCount := ComboBoxGN.DropDownCount;
               TabOrder := ComboBoxGN.TabOrder;
               TabStop  := ComboBoxGN.TabStop;
               onChange := FHSHintComboBoxGNChange;
  //  OnListMouseMove := HSHintComboBoxListMouseMove;
          end;
     if not ComboBoxGn.Visible then
        FHSHintComboBoxGn.Hide;
     ComboBoxGN.Free();

     FHSHintComboBoxNIS := THSHintComboBox.Create(Self);
     with FHSHintComboBoxNIS do
          begin
               Parent     := Self;
               Anchors    := ComboBoxNIS.Anchors;
               Items.Assign(ComboBoxNIS.Items);
               ItemIndex  := ComboBoxNIS.ItemIndex;
               BoundsRect := ComboBoxNIS.BoundsRect;
               if NOT (ComboBoxNIS.Style in [csDropDown, csDropDownList]) then
                 raise Exception.Create (
                    'HSHintComboBox поддерживает стиль только csDropDown и csDropDownList');
               Style := ComboBoxNIS.Style;
               DropDownCount := ComboBoxNIS.DropDownCount;
               TabOrder := ComboBoxNIS.TabOrder;
               TabStop  := ComboBoxNIS.TabStop;
               onChange := FHSHintComboBoxGNChange;
  //  OnListMouseMove := HSHintComboBoxListMouseMove;
          end;
     if not ComboBoxNIS.Visible then
        FHSHintComboBoxNIS.Hide;
     ComboBoxNIS.Free();

 end;



procedure TFormMovBol.FHSHintComboBoxBudChange(Sender: TObject);
begin
      if CodeMove<>6 then Exit;
      if FHSHintComboBoxBud.ItemIndex=0 then
         begin
               ComboBoxBudGru.Show;
               ComboBoxBudKat.Show;
         end
      else
         begin
               ComboBoxBudGru.Hide;
               ComboBoxBudKat.Hide;
         end

end;

procedure TFormMovBol.FHSHintComboBoxVneChange(Sender: TObject);
begin
      if CodeMove<>6 then Exit;
      if FHSHintComboBoxVne.ItemIndex=0 then
         begin
               ComboBoxVneGru.Show;
               ComboBoxVneKat.Show;
         end
      else
         begin
               ComboBoxVneGru.Hide;
               ComboBoxVneKat.Hide;
         end

end;

procedure TFormMovBol.FHSHintComboBoxGNChange(Sender: TObject);
begin
      if CodeMove<>6 then Exit;
      if FHSHintComboBoxGN.ItemIndex=0 then
         begin
               ComboBoxGNGru.Show;
               ComboBoxGNKat.Show;
         end
      else
         begin
               ComboBoxGNGru.Hide;
               ComboBoxGNKat.Hide;
         end

end;

procedure TFormMovBol.FHSHintComboBoxNISChange(Sender: TObject);
begin
      if CodeMove<>6 then Exit;
      if FHSHintComboBoxNIS.ItemIndex=0 then
         begin
               ComboBoxNISGru.Show;
               ComboBoxNISKat.Show;
         end
      else
         begin
               ComboBoxNISGru.Hide;
               ComboBoxNISKat.Hide;
         end

end;


procedure TFormMovBol.ComboBoxBudGruChange(Sender: TObject);
begin
     PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrGru:=ComboBoxBudGru.ItemIndex+1;
end;

procedure TFormMovBol.ComboBoxBudKatChange(Sender: TObject);
begin
     PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrKat:=ComboBoxBudKat.ItemIndex+1;
end;

procedure TFormMovBol.ComboBoxVNEGruChange(Sender: TObject);
begin
     PPersonRec(PersonList.Items[FHSHintComboBoxVne.ItemIndex])^.ShifrGru:=ComboBoxVneGru.ItemIndex+1;
end;

procedure TFormMovBol.ComboBoxVNEKATChange(Sender: TObject);
begin
     PPersonRec(PersonList.Items[FHSHintComboBoxVne.ItemIndex])^.ShifrKat:=ComboBoxVneKat.ItemIndex+1;
end;

procedure TFormMovBol.ComboBoxGNGruChange(Sender: TObject);
begin
     PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrGru:=ComboBoxGNGru.ItemIndex+1;
end;

procedure TFormMovBol.ComboBoxGNKatChange(Sender: TObject);
begin
     PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrKat:=ComboBoxGNKat.ItemIndex+1;
end;

procedure TFormMovBol.ComboBoxNISGruChange(Sender: TObject);
begin
     PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrGru:=ComboBoxNISGru.ItemIndex+1;
end;

procedure TFormMovBol.ComboBoxNISKatChange(Sender: TObject);
begin
     PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrKat:=ComboBoxNISKat.ItemIndex+1;
end;

end.
