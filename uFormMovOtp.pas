unit uFormMovOtp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, ValEdit, ScrDef, ImgList,
  HSHintComboBox;
type
(*
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, HSHintComboBox;

type
  TForm1 = class(TForm)
    ComboBox: TComboBox;
    ListBox: TListBox;
    lbCoord: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FHSHintComboBox : THSHintComboBox;
    procedure HSHintComboBoxListMouseMove (Sender : TObject;
                                       Shift : TShiftState; X, Y : Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FHSHintComboBox := THSHintComboBox.Create(Self);
  with FHSHintComboBox do begin
    Parent := Self;
    Items.Assign(ComboBox.Items);
    BoundsRect := ComboBox.BoundsRect;
    if NOT (ComboBox.Style in [csDropDown, csDropDownList]) then
      raise Exception.Create (
       'HSHintComboBox поддерживает стиль только csDropDown и csDropDownList');
    Style := ComboBox.Style;
    DropDownCount := ComboBox.DropDownCount;
    TabOrder := ComboBox.TabOrder;
    TabStop := ComboBox.TabStop;
    OnListMouseMove := HSHintComboBoxListMouseMove;
  end;
  ComboBox.Free();
end;
*)

  TFormMovOtp = class(TForm)
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
    Label1: TLabel;
    CheckBoxBud: TCheckBox;
    CheckBoxVne: TCheckBox;
    CheckBoxGn: TCheckBox;
    CheckBoxNIS: TCheckBox;
    ComboBoxPodr: TComboBox;
    CheckBoxPodr: TCheckBox;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FillPersonList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure BtnMoveClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure StringGridSelDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGridSelDblClick(Sender: TObject);
    procedure PrepareList;

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
    Mode     : integer;   // если 1, то это компенсация и не надо править табель
    ModePodr : integer;   // если 1, то переносить толькол в одно подразделение
    WantedPodr : integer; // Номер подразделения, в которое переносить отпускные
    KindOtp  : Integer; // Вид отпускных 0-тарифный 1 учебный 2 Чернобыльский 3 На датей 
    function IsMovedOtp(ShifrIdOtp:integer):boolean;

  public
    WantedTabno : integer;
    Curr_Person : Person_Ptr;
    ShifrIdOtp  : Integer;
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

 function GetNmbOfOtp(Tabno:integer):Integer;

var
  FormMovOtp : TFormMovOtp;
  PersonList : TList;
  WPodrList  : TList;

implementation
uses UFibModule,uFormWait,ScrUtil,SCRIO,Types,DateUtils,ScrLists;
type
     PRec = ^ARec;
     ARec = record
             Code  : Integer;
             Summa : real;
            end;
     PPersonRec=^TPersonRec;
     TPersonRec = record
                    ShifrKat : integer;
                    ShifrGru : Integer;
                    ShifrDol : Integer;
                    ShifrWR  : Integer;
                    ShifrPod : Integer;
                    ShifrSwmMode : Integer;
                    Blocked  : Boolean;
                    Dolg     : String;
                    Show     : String;
                    LineNo   : Integer;
                    GUID     : string;
                    Moved    : Boolean;
                  end;

     PWPodrRec=^TWPodrRec;
     TWPodrRec = record
                    ShifrPod : integer;
                    NamePod  : string;
                  end;

{$R *.dfm}
  function GetNmbOfOtp(Tabno:integer):Integer;
   var S:String;
       I_Count:integer;
   begin
         Result := 0;
         S:='SELECT count(*) FROM otp where tabno='+IntToStr(Tabno)+
             ' and Month_Vy='+IntToStr(Nmes)+' and Year_Vy='+IntToStr(CurrYear);
         if not FIB.pFIBQuery.Transaction.Active then
            FIB.pFIBQuery.Transaction.StartTransaction;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(S);
         try
            FormWait.Show;
            Application.ProcessMessages;
            FIB.pFIBQuery.ExecQuery;
            FormWait.Hide;
            I_Count:=FIB.pFIBQuery.Fields[0].AsInteger;
            FIB.pFIBQuery.Close;
         except
            MessageDlg('Ошибка получения количества отпускных',mtInformation, [mbOk], 0);
            if FIB.pFIBQuery.Transaction.Active then
               FIB.pFIBQuery.Transaction.Commit;
            Exit;
         end;
         if ((I_Count>0) and (I_Count<10)) then
            Result:=I_Count;
         if FIB.pFIBQuery.Transaction.Active then
            FIB.pFIBQuery.Transaction.Commit;
   end;

  function IsCorrectPodrForOtp(WantedSrv:integer):boolean;
   var S:String;
       I_Count:integer;
       RetVal:boolean;
   begin
         RetVal:=true;
         S:='SELECT count(*) FROM I_PODR where MODE=2 AND SHIFR_POD='+IntToStr(WANTEDSRV);
         if not FIB.pFIBQuery.Transaction.Active then
            FIB.pFIBQuery.Transaction.StartTransaction;
         FIB.pFIBQuery.SQL.Clear;
         FIB.pFIBQuery.SQL.Add(S);
         try
            FormWait.Show;
            Application.ProcessMessages;
            FIB.pFIBQuery.ExecQuery;
            FormWait.Hide;
            I_Count:=FIB.pFIBQuery.Fields[0].AsInteger;
            FIB.pFIBQuery.Close;
         except
            MessageDlg('Ошибка проверки подразделения',mtInformation, [mbOk], 0);
            if FIB.pFIBQuery.Transaction.Active then
               FIB.pFIBQuery.Transaction.Commit;
            Exit;
         end;
         if (I_Count>0) then RetVal:=false;
         IsCorrectPodrForOtp:=RetVal;
         if FIB.pFIBQuery.Transaction.Active then
            FIB.pFIBQuery.Transaction.Commit;
   end;

procedure TFormMovOtp.PrepareList;
var
    Rec     : PRec;
    S       : String;
    I       : Integer;
    WantedIndex : integer;
    Data_Pere_Bud : TDateTime;
    Data_Pere_Vne : TDateTime;
    Data_Pere_Gn  : TDateTime;
    Data_Pere_Nis : TDateTime;


begin
    if WPodrList.Count>0 then
       for i:=0 to WPodrList.Count-1 do
           begin
                ComboBoxPodr.Items.Add(PWPodrRec(WPodrList.Items[i])^.NamePod);
                if PWPodrRec(WPodrList.Items[i])^.ShifrPod=NSRV then
                   ComboBoxPodr.ItemIndex := i;
           end;

    S:= 'select Sum(case when otp_res.need_pere_bud=1 and extract(year from cast(coalesce(otp_res.data_pere_bud,''1900-01-01'') as date))<2000 then otp_res.summa_o_bud else 0 end),' +
        'Sum(case when otp_res.need_pere_vne=1 and extract(year from cast(coalesce(otp_res.data_pere_vne,''1900-01-01'') as date))<2000 then otp_res.summa_o_vne else 0 end),' +
        'Sum(case when otp_res.need_pere_gn=1 and extract(year from cast(coalesce(otp_res.data_pere_gn,''1900-01-01'') as date))<2000 then otp_res.summa_o_gn else 0 end),' +
        'Sum(case when otp_res.need_pere_nis=1 and extract(year from cast(coalesce(otp_res.data_pere_nis,''1900-01-01'') as date))<2000 then otp_res.summa_o_nis else 0 end)' +
        ' from otp_res'            +
        ' join otpuska on otpuska.shifrid=Otp_res.shifridOtp'+
        ' where otpuska.ShifrId='+IntToStr(ShifrIdOtp);
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
       ShowMessage('Ошибка получени суммы отпусных');
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       Exit;
    end;
    if FIB.pFIBQuery.Transaction.Active then
       FIB.pFIBQuery.Transaction.Commit;
    if (SummaBud+SummaVne+SummaGN+SummaNis)<0.01 then
        begin
             ShowMessage('Отпускные для переноса либо не отмечены либо уже перенесены');
            // Self.Close;
             Exit;
        end;
    S:= 'select first 1 mode,kind_otp from otpuska where ShifrId='+IntToStr(ShifrIdOtp);
    if not FIB.pFIBQuery.Transaction.Active then
       FIB.pFIBQuery.Transaction.StartTransaction;
    FIB.pFIBQuery.SQL.Clear;
    FIB.pFIBQuery.SQL.Add(S);
    try
       FormWait.Show;
       Application.ProcessMessages;
       FIB.pFIBQuery.ExecQuery;
       FormWait.Hide;
       Mode := FIB.pFIBQuery.Fields[0].AsInteger;
       KindOtp := FIB.pFIBQuery.Fields[1].AsInteger;
       if ((Mode<0) or (Mode>2)) then Mode:=0;
       if ((KindOtp<0) or (KindOtp>3)) then KindOtp:=0;
       FIB.pFIBQuery.Close;
    except
       ShowMessage('Ошибка получения режима начисления отпускных');
       if FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.Commit;
       Exit;
    end;
    if FIB.pFIBQuery.Transaction.Active then
       FIB.pFIBQuery.Transaction.Commit;
    S:= 'select b.data_pere_bud,b.data_pere_vne,b.data_pere_gn,b.data_pere_nis from otpuska b where b.ShifrId=' + IntToStr(ShifrIDOtp);
    if not FIB.pFIBQuery.Transaction.Active then
       FIB.pFIBQuery.Transaction.StartTransaction;
    FIB.pFIBQuery.SQL.Clear;
    FIB.pFIBQuery.SQL.Add(S);
    FIB.pFIBQuery.ExecQuery;
    Data_Pere_Bud := FIB.pFIBQuery.Fields[0].AsDate;
    Data_Pere_Vne := FIB.pFIBQuery.Fields[1].AsDate;
    Data_Pere_Gn  := FIB.pFIBQuery.Fields[2].AsDate;
    Data_Pere_Nis := FIB.pFIBQuery.Fields[3].AsDate;
    if FIB.pFIBQuery.Transaction.Active then
       FIB.pFIBQuery.Transaction.Commit;
    SummaBudTxt.Caption := '';
    SummaVneTxt.Caption := '';
    SummaGnTxt.Caption  := '';
    SummaNisTxt.Caption := '';
    CheckBoxBud.Checked := false;
    CheckBoxVne.Checked := false;
    CheckBoxGN.Checked  := false;
    CheckBoxNIS.Checked := false;
    if KindOtp=ChernobKindOtp then
       begin
            i:=PersonList.Count;;
            if i>0 then
               begin
                    i:=i-1;
                    PPersonRec(PersonList.Items[i]).ShifrGru:=ChernobSchet;
               end;

       end;
    CheckBoxBud.Hide;
    CheckBoxVne.Hide;
    CheckBoxGN.Hide;
    CheckBoxNIS.Hide;
    if abs(SummaBud)>0.009 then
       begin
            SummaBudTxt.Caption := FORMAT('Бюджет    %12.2f грн',[SummaBud]);
            CheckBoxBUD.Checked := true;
            CheckBoxBUD.Show;
            if (YearOf(Data_Pere_Bud)>2000) then
               begin
                    CheckBoxBUD.Checked:=false;
                    CheckBoxBUD.Enabled:=false;
               end;
            ComboBoxBud.Show;
            WantedIndex := -1;
            for i:=1 to PersonList.Count do
                begin
                     ComboBoxBud.Items.Add(PPersonRec(PersonList.Items[i-1])^.Show);
                     if (WantedIndex < 0) then
                        if GruppyList.GetShifrGruM(PPersonRec(PersonList.Items[i-1])^.ShifrGru)=1 then
                        if PPersonRec(PersonList.Items[i-1])^.ShifrPod=NSRV then
                        if PPersonRec(PersonList.Items[i-1])^.ShifrDol<>1500 then
                           WantedIndex := i-1;
                end;
            if WantedIndex>=0 then
               ComboBoxBud.ItemIndex:=WantedIndex
            else
               begin
                    if ComboBoxBud.Items.Count>0 then
                       ComboBoxBud.ItemIndex:=ComboBoxBud.Items.Count-1
                    else
                        ComboBoxBud.ItemIndex:=-1;
               end;
            if KindOtp=ChernobKindOtp then
               begin
      //              PPersonRec(ComboBoxBud.Items[PersonList.Count-1])^.ShifrGru:=ChernobSchet;
                    ComboBoxBud.ItemIndex:=ComboBoxBud.Items.Count-1;
               end;
       end
    else ComboBoxBud.Hide;
    if abs(SummaVne)>0.009 then
       begin
            SummaVneTxt.Caption := FORMAT('Внебюджет %12.2f грн',[SummaVne]);
            ComboBoxVne.Show;
            CheckBoxVNE.Checked := true;
            CheckBoxVNE.Show;
            if (YearOf(Data_Pere_Vne)>2000) then
               begin
                    CheckBoxVne.Checked:=false;
                    CheckBoxVne.Enabled:=false;
               end;
            WantedIndex := -1;
            for i:=1 to PersonList.Count do
               begin
                    ComboBoxVne.Items.Add(PPersonRec(PersonList.Items[i-1])^.Show);
                     if (WantedIndex < 0) then
                        if GruppyList.GetShifrGruM(PPersonRec(PersonList.Items[i-1])^.ShifrGru)=2 then
                        if PPersonRec(PersonList.Items[i-1])^.ShifrPod=NSRV then
                        if PPersonRec(PersonList.Items[i-1])^.ShifrDol<>1500 then
                           WantedIndex := i-1;
               end;
            if WantedIndex>=0 then
               ComboBoxVne.ItemIndex:=WantedIndex
            else
               begin
                    if ComboBoxVne.Items.Count>0 then
                       ComboBoxVne.ItemIndex:=ComboBoxVne.Items.Count-1
                    else
                       ComboBoxVne.ItemIndex:=-1;
               end;
            if KindOtp=ChernobKindOtp then
               begin
        //            PPersonRec(ComboBoxVne.Items[ComboBoxVne.Items.Count-1])^.ShifrGru:=ChernobSchet;
                    ComboBoxVne.ItemIndex:=ComboBoxVne.Items.Count-1;
               end;
       end
    else  ComboBoxVne.Hide;
    if abs(SummaGn)>0.009 then
       begin
            SummaGnTxt.Caption :=  FORMAT('ГН        %12.2f грн',[SummaGN]);
            ComboBoxGn.Show;
            CheckBoxGN.Checked := true;
            CheckBoxGN.Show;
            if (YearOf(Data_Pere_GN)>2000) then
               begin
                    CheckBoxGN.Checked:=false;
                    CheckBoxGN.Enabled:=false;
               end;
            WantedIndex := -1;
            for i:=1 to PersonList.Count do
                begin
                     ComboBoxGn.Items.Add(PPersonRec(PersonList.Items[i-1])^.Show);
                     if (WantedIndex < 0) then
                        if GruppyList.GetShifrGruM(PPersonRec(PersonList.Items[i-1])^.ShifrGru)=3 then
                        if PPersonRec(PersonList.Items[i-1])^.ShifrPod=NSRV then
                        if PPersonRec(PersonList.Items[i-1])^.ShifrDol<>1500 then
                           WantedIndex := i-1;
                end;
            if WantedIndex>=0 then
               ComboBoxGn.ItemIndex:=WantedIndex
            else
                begin
                    if ComboBoxGn.Items.Count>0 then
                       ComboBoxGn.ItemIndex:=ComboBoxGn.Items.Count-1
                    else
                       ComboBoxGN.ItemIndex:=-1;
                end;
            if KindOtp=ChernobKindOtp then
               begin
         //           PPersonRec(ComboBoxGN.Items[ComboBoxGN.Items.Count-1])^.ShifrGru:=ChernobSchet;
                    ComboBoxGn.ItemIndex:=ComboBoxGn.Items.Count-1;
               end;
       end
    else
        ComboBoxGn.Hide;
    if abs(SummaNIS)>0.009 then
       begin
            SummaNISTxt.Caption := FORMAT('НИС       %12.2f грн',[SummaNis]);
            ComboBoxNIS.Show;
            CheckBoxNIS.Checked := true;
            CheckBoxNIS.Show;
            if (YearOf(Data_Pere_NIS)>2000) then
               begin
                    CheckBoxNIS.Checked:=false;
                    CheckBoxNIS.Enabled:=false;
               end;
            WantedIndex := -1;
            for i:=1 to PersonList.Count do
                begin
                     ComboBoxNIS.Items.Add(PPersonRec(PersonList.Items[i-1])^.Show);
                     if (WantedIndex < 0) then
                        if GruppyList.GetShifrGruM(PPersonRec(PersonList.Items[i-1])^.ShifrGru)=4 then
                        if PPersonRec(PersonList.Items[i-1])^.ShifrPod=NSRV then
                        if PPersonRec(PersonList.Items[i-1])^.ShifrDol<>1500 then
                           WantedIndex := i-1;
                end;
            if WantedIndex>=0 then
               ComboBoxNIS.ItemIndex:=WantedIndex
            else
                begin
                    if ComboBoxNIS.Items.Count>0 then
                       ComboBoxNIS.ItemIndex:=ComboBoxNIS.Items.Count-1
                    else
                       ComboBoxNIS.ItemIndex:=-1;
                end;
            if KindOtp=ChernobKindOtp then
               begin
         //           PPersonRec(ComboBoxNis.Items[ComboBoxNis.Items.Count-1])^.ShifrGru:=ChernobSchet;
                    ComboBoxNis.ItemIndex:=ComboBoxNis.Items.Count-1;
               end;
       end
    else
        ComboBoxNIS.Hide;
    StringGridSel.RowCount     := PersonList.Count;
    StringGridSel.ColWidths[0] := StringGridSel.Width;
//    j:=0;
    for i:=0 to PersonList.Count-1 do
        begin
//             if (PPersonRec(PersonList.Items[i])^.ShifrKat>0) then
                begin
//                     Inc(j);
                     StringGridSel.Cells[0,i]   := PPersonRec(PersonList.Items[i])^.Show;
{             StringGridSel.Objects[0,i] := Nil;}
                     StringGridSel.Objects[0,i]:=TStrColor.Create;
                end;
        end
  end;

procedure TFormMovOtp.FormCreate(Sender: TObject);
begin
     SummaBud := 0;
     SummaVne := 0;
     SummaGN  := 0;
     SummaNIS := 0;
     Mode     := 0;
     ModePodr := 1;

end;

procedure TFormMovOtp.FillPersonList;
 var
     Curr_Sowm : Sowm_Ptr;
     NSRV_TMP  : integer;
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
      WPodrRec  : PWPodrRec  ;
      S_Osn     : String     ;
      i         : integer    ;
      Finded    : boolean    ;
      ShString  : Shortstring     ;
  begin
     C_P:=Head_Person;
     while (C_P<>Nil) do
      begin
            if (C_P^.Tabno=WantedTabno) then
            if (C_P^.KATEGORIJA<>1) or
               ((C_P^.KATEGORIJA=1)
               {and (POS('ПОВ',UPPER_STRING(C_P^.DOLG))=0)}) then
                begin
                     New(PersonRec);
                     PersonRec^.ShifrKat := C_P^.KATEGORIJA;
                     PersonRec^.ShifrGru := C_P^.GRUPPA;
                     PersonRec^.ShifrDol := Get_Dol_Code(C_P);
                     PersonRec^.ShifrPod := NSRV;
                     if C_P^.AUTOMATIC=Manual_Mode then
                        PersonRec^.Blocked:=True
                     else
                        PersonRec^.Blocked:=False;
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
                     PersonRec^.Dolg:=C_P^.Dolg;
                     ShString:='';
                     if not GetGUIDPerson(C_P,ShString) then
                        ShString:='';
                     PersonRec^.GUID:=ShString;
                     PersonRec^.ShifrSwmMode := Get_Swm_Mode_Person(C_P);
                     PersonRec^.Show:=trim(AllTrim(C_P^.Dolg)+' '+S_Osn+' '+
                                      AllTrim(GET_IST_NAME(C_P^.GRUPPA))+' '+
                                      AllTrim(GET_KAT_NAME(C_P^.KATEGORIJA))+' '+
                                      AllTrim(NAME_SERV(NSRV))+' '+
                                      AllTrim(GET_DOL_NAME(C_P))); {+' '+
                                      AllTrim(Get_Swm_Name(Get_Swm_Mode_Person(C_P))));}
                    if PersonRec^.Blocked then
                       PersonRec^.Show:=Trim(PersonRec^.Show)+' Блокирован';
                    PersonRec^.Moved:=False;
                    PersonList.Add(PersonRec);
                    Finded:=false;
                    if WPodrList.Count>0 then
                       for i:=0 to WPodrList.Count-1 do
                           begin
                                if PWPodrRec(WPodrList.Items[i])^.ShifrPod=nsrv then
                                   begin
                                        Finded:=true;
                                        break;
                                   end;
                           end;
                    if not Finded then
                       begin
                            New(WPodrRec);
                            WPodrRec^.ShifrPod:=NSRV;
                            WPodrRec^.NamePod:=Name_Serv(NSRV);
                            WPodrList.Add(WPodrRec);
                       end;
                end;
            C_P:=C_P^.Next;
      end;
     
  end;


procedure AddCreateNewPersonRec;
  var    PersonRec : PPersonRec ;
  begin
       New(PersonRec);
       PersonRec^.ShifrKat := 0 ;
       PersonRec^.ShifrGru := 0 ;
       PersonRec^.ShifrDol := 0 ;
       PersonRec^.ShifrPod := 0 ;
       PersonRec^.ShifrWR  := 0 ;
       PersonRec^.ShifrSwmMode := 0 ;
       PersonRec^.Dolg:='Перенос.';
       PersonRec^.Show:='Создать новую запись';
       PersonRec^.Blocked:=false;
       PersonRec^.GUID := '';
       PersonRec^.Moved:=False;
       PersonList.Add(PersonRec);
  end;
 begin
     FillPersonFromPodr;
     MarkSowm(NSRV);
     Curr_Sowm:=Curr_Person^.Sowm;
   //  ShowMessage('Count_Sowm='+IntToStr(Count_Sowm(Curr_Person)));
     select(2);
     NSRV_TMP:=NSRV;
{
     if (Curr_Sowm=Nil) then
         ShowMessage('Curr_Sowm=Nil')
     else
         ShowMessage('Curr_Sowm not Nil');
}         
     while (Curr_Sowm<>Nil) do
      begin
           if Curr_Sowm^.Where<1000 then
       //    if Curr_Sowm^.Where<>102 then
           if IsCorrectPodrForOtp(Curr_Sowm^.Where) then
              begin
                   while (Head_Person<>Nil) do Del_Person(Head_Person);
                   nsrv:=Curr_Sowm^.Where;
                   MKFLNM;
                   GETINF(TRUE);
                   FillPersonFromPodr;
                   MarkSowm(Curr_Sowm^.Where);
                   while head_person<>Nil do Del_Person(Head_person);
              end;
              Curr_Sowm:=Curr_Sowm^.Next;
      end;
     Select(1);
     AddCreateNewPersonRec;
     NSRV:=NSRV_TMP;
     MKFLNM;
     ReMarkSowm;
 end;
procedure TFormMovOtp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if Assigned(PersonList) then
        PersonList.Free;
     if Assigned(WPodrList) then
        WPodrList.Free;
     Action:=caFree;
end;

procedure TFormMovOtp.FormShow(Sender: TObject);
begin
{
     PersonList:=TList.Create;
     FillPersonList;
     PrepareList;
}
end;

function TFormMovOtp.IsMovedOtp(ShifrIdOtp:integer):boolean;
  var S:String;
      RetVal:boolean;
      Date_Pere:Tdate;
  begin
       RetVal:=false;
       S:='select Data_Pere from otpuska  where ShifrId=' + IntToStr(ShifrIDOtp);
       if FIB.pFIBQuery.Open then FIB.pFIBQuery.Close;
       FIB.pFIBQuery.SQL.Clear;
       FIB.pFIBQuery.SQL.Add(S);
       if not FIB.pFIBQuery.Transaction.Active then
          FIB.pFIBQuery.Transaction.StartTransaction;
       try
          FIB.pFIBQuery.ExecQuery;
          while not FIB.pFIBQuery.Eof do
             begin
                  Date_Pere := FIB.pFIBQuery.Fields[0].AsDate;
                  if YearOf(Date_Pere)>2005 then
                     RetVal:=true;
                  break;
             end;
       except
       end;
       FIB.pFIBQuery.Transaction.Commit;
       IsMovedOtp:=RetVal;
  end;


procedure TFormMovOtp.BtnMoveClick(Sender: TObject);
var i,i_count:integer;
  function IsBlockedMarked : boolean;
   begin
        IsBlockedMarked:=False;
        if (abs(SummaBud)>0.009) and (FHSHintComboBoxBud.ItemIndex>=0)
           and (CheckBoxBUD.Checked) then
           if PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.Blocked then
              if not YesNo('Для переноса бюджетной части отпускных выбрана заблокированная запись. Продолжить перенос?') then
                 begin
                      IsBlockedMarked:=true;
                      Exit;
                 end;
        if (abs(SummaVne)>0.009) and (FHSHintComboBoxVne.ItemIndex>=0)
           and (CheckBoxVne.Checked) then
           if PPersonRec(PersonList.Items[FHSHintComboBoxVne.ItemIndex])^.Blocked then
              if not YesNo('Для переноса внебюджетной части отпускных выбрана заблокированная запись. Продолжить перенос?') then
                 begin
                      IsBlockedMarked:=true;
                      Exit;
                 end;
        if (abs(SummaGn)>0.009) and (FHSHintComboBoxGn.ItemIndex>=0)
           and (CheckBoxGn.Checked) then
           if PPersonRec(PersonList.Items[FHSHintComboBoxGn.ItemIndex])^.Blocked then
              if not YesNo('Для переноса ГН-овской части отпускных выбрана заблокированная запись. Продолжить перенос?') then
                 begin
                      IsBlockedMarked:=true;
                      Exit;
                 end;
        if (abs(SummaNis)>0.009) and (FHSHintComboBoxNis.ItemIndex>=0)
           and (CheckBoxNis.Checked) then
           if PPersonRec(PersonList.Items[FHSHintComboBoxNis.ItemIndex])^.Blocked then
              if not YesNo('Для переноса НИС-овской части отпускных выбрана заблокированная запись. Продолжить перенос?') then
                 begin
                      IsBlockedMarked:=true;
                      Exit;
                 end;
   end;
begin


      if IsMovedOtp(ShifrIdOtp) then
         begin
              ShowMessage('Отпускные уже перенесены');
              Exit;
         end;

     if IsBlockedMarked then Exit;

     // 1. Перенос бюджета
     if (abs(SummaBud)>0.009) and (FHSHintComboBoxBud.ItemIndex>=0)
         and (CheckBoxBUD.Checked) then
         begin
              MoveOtpToPerson(ShifrIdOtp,1,WantedTabno,
                  PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrPod,
                  PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrKat,
                  PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrGru,
                  PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrDol,
                  PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrWR,
                  PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.ShifrSwmMode,
                  PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.Dolg,
                  PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.GUID,
                  True);
              PPersonRec(PersonList.Items[FHSHintComboBoxBud.ItemIndex])^.Moved:=True;
         end;
     // 2. Перенос внебюджета
     if (abs(SummaVNE)>0.009) and (FHSHintComboBoxVNE.ItemIndex>=0)
         and (CheckBoxVNE.Checked) then
         begin
              MoveOtpToPerson(ShifrIdOtp,2,WantedTabno,
                  PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrPod,
                  PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrKat,
                  PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrGru,
                  PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrDol,
                  PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrWR,
                  PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.ShifrSwmMode,
                  PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.Dolg,
                  PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.GUID,
                  True);
                  PPersonRec(PersonList.Items[FHSHintComboBoxVNE.ItemIndex])^.Moved:=True;
         end;
     // 3. Перенос Г Н
     if (abs(SummaGN)>0.009) and (FHSHintComboBoxGN.ItemIndex>=0)
         and (CheckBoxGN.Checked) then
         begin
              MoveOtpToPerson(ShifrIdOtp,3,WantedTabno,
                  PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrPod,
                  PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrKat,
                  PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrGru,
                  PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrDol,
                  PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrWR,
                  PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.ShifrSwmMode,
                  PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.Dolg,
                  PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.GUID,
                  True);
              PPersonRec(PersonList.Items[FHSHintComboBoxGN.ItemIndex])^.Moved:=True;
         end;
     // 4. Перенос Н И С
     if (abs(SummaNIS)>0.009) and (FHSHintComboBoxNIS.ItemIndex>=0)
         and (CheckBoxNIS.Checked) then
         begin
              MoveOtpToPerson(ShifrIdOtp,4,WantedTabno,
                  PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrPod,
                  PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrKat,
                  PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrGru,
                  PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrDol,
                  PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrWR,
                  PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.ShifrSwmMode,
                  PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.Dolg,
                  PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.GUID,
                  True);
              PPersonRec(PersonList.Items[FHSHintComboBoxNIS.ItemIndex])^.Moved:=True;
         end;
     // 5. Подсчитать количество строк, для которых перерасчет по табелю
     i_count:=0;
     for i:=0 to StringGridSel.RowCount do
         begin
  //             if i=FHSHintComboBoxBud.ItemIndex then continue;
  //             if i=FHSHintComboBoxVNE.ItemIndex then continue;
               if not Assigned(StringGridSel.Objects[0,i]) then continue;
               inc(I_Count);
         end;



     // 6. перерасчет по табелю
     if CheckBoxBud.Checked or
        CheckBoxVne.Checked or
        CheckBoxGn.Checked  or
        CheckBoxNIS.Checked then
     if i_count>0 then
     for i:=0 to StringGridSel.RowCount do
         begin
  //             if i=FHSHintComboBoxBud.ItemIndex then continue;
  //             if i=FHSHintComboBoxVNE.ItemIndex then continue;
               if not Assigned(StringGridSel.Objects[0,i]) then continue;
               if (PPersonRec(PersonList.Items[i])^.ShifrKat=0) then continue;
          //     if PPersonRec(PersonList.Items[i])^.ShifrSwmMode = OSN_WID_RABOTY then
          //        Continue;
               MoveOtpToPerson(ShifrIdOtp,2,WantedTabno, { Группа указана вторая но это все равно ведь только перрасчет по табелю }
                   PPersonRec(PersonList.Items[i])^.ShifrPod,
                   PPersonRec(PersonList.Items[i])^.ShifrKat,
                   PPersonRec(PersonList.Items[i])^.ShifrGru,
                   PPersonRec(PersonList.Items[i])^.ShifrDol,
                   PPersonRec(PersonList.Items[i])^.ShifrWR,
                   PPersonRec(PersonList.Items[i])^.ShifrSwmMode,
                   PPersonRec(PersonList.Items[i])^.Dolg,
                   PPersonRec(PersonList.Items[i])^.GUID,
                   False);
         end;
    // 7 Допересчитать по основному месту работу
     if i_count>0 then
     for i:=0 to StringGridSel.RowCount do
         begin
  //             if i=FHSHintComboBoxBud.ItemIndex then continue;
  //             if i=FHSHintComboBoxVNE.ItemIndex then continue;
               if not Assigned(StringGridSel.Objects[0,i]) then continue;
               if (PPersonRec(PersonList.Items[i])^.ShifrKat=0) then continue;
               if PPersonRec(PersonList.Items[i])^.ShifrWR<>1 then continue;

               MoveOtpToPerson(ShifrIdOtp,2,WantedTabno, { Группа указана вторая но это все равно ведь только перрасчет по табелю }
                   PPersonRec(PersonList.Items[i])^.ShifrPod,
                   PPersonRec(PersonList.Items[i])^.ShifrKat,
                   PPersonRec(PersonList.Items[i])^.ShifrGru,
                   PPersonRec(PersonList.Items[i])^.ShifrDol,
                   PPersonRec(PersonList.Items[i])^.ShifrWR,
                   PPersonRec(PersonList.Items[i])^.ShifrSwmMode,
                   PPersonRec(PersonList.Items[i])^.Dolg,
                   PPersonRec(PersonList.Items[i])^.GUID,
                   False);
               break;
         end;


     ShowMessage('Отпускные перенесены');
     Self.Close;

end;

procedure TFormMovOtp.FormResize(Sender: TObject);
begin
    StringGridSel.ColWidths[0]:=StringGridSel.Width;
end;


procedure TFormMovOtp.StringGridSelDrawCell(Sender: TObject; ACol,
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

procedure TFormMovOtp.StringGridSelDblClick(Sender: TObject);
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



 function ComparePodr(Item1, Item2: Pointer): Integer;
  var I1,I2 : Integer;
      ShifrPod1,ShifrPod2:Integer;
      ShifrDol1,ShifrDol2:Integer;
  begin

       ShifrPod1:=PPersonRec(Item1).ShifrPod;
       ShifrPod2:=PPersonRec(Item2).ShifrPod;

       ShifrDol1:=PPersonRec(Item1).ShifrDol;
       ShifrDol2:=PPersonRec(Item2).ShifrDol;

       i1:=PPersonRec(Item1).LineNo;
       i2:=PPersonRec(Item2).LineNo;
       if ((ShifrPod1=76) or (ShifrPod1=82) or (ShifrPod1=81) or (ShifrPod1=102) or (ShifrPod1=106) or (ShifrPod1=122)) then i1:=ShifrPod1+1000;
       if ((ShifrPod2=76) or (ShifrPod2=82) or (ShifrPod2=81) or (ShifrPod2=102) or (ShifrPod2=106) or (ShifrPod2=122)) then i2:=ShifrPod2+1000;
       if ShifrPod1=0    then I1:=10000;
       if ShifrPod2=0    then I2:=10000;
       if ShifrDol1=1500 then I1:=9999;  {Больничные}
       if ShifrDol2=1500 then I2:=9999;
       if ShifrDol1=4    then I1:=9998;  {Повышение}
       if ShifrDol2=4    then I2:=9998;
       if I1>I2 then Result:=1
       else if I1<I2 then Result:=-1
       else Result:=0;
  end;


procedure QuickSort(SortList: PPointerList; L, R: Integer;
  SCompare: TListSortCompare);
var
  I, J: Integer;
  P, T: Pointer;
begin
  repeat
    I := L;
    J := R;
    P := SortList^[(L + R) shr 1];
    repeat
      while SCompare(SortList^[I], P) < 0 do
        Inc(I);
      while SCompare(SortList^[J], P) > 0 do
        Dec(J);
      if I <= J then
      begin
        T := SortList^[I];
        SortList^[I] := SortList^[J];
        SortList^[J] := T;
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then
      QuickSort(SortList, L, J, SCompare);
    L := I;
  until I >= R;
end;
  

procedure TFormMovOtp.PrepareHints;
 var i,j:Integer;
 begin
     PersonList := TList.Create;
     WPodrList  := TList.Create;
     FillPersonList;
   //  PersonList.Sort(@ComparePodr);
     for i:=0 to PersonList.Count-1 do
         PPersonRec(PersonList.Items[i]).LineNo:=i+1;
     QuickSort(PersonList.List, 0, PersonList.Count - 1, @ComparePodr);
     for i:=0 to PersonList.Count-1 do
        begin
             j:=PPersonRec(PersonList.Items[i]).ShifrPod;
             j:=j;
        end;
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
  //  OnListMouseMove := HSHintComboBoxListMouseMove;
          end;
     if not ComboBoxBud.Visible then FHSHintComboBoxBud.Hide;
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
  //  OnListMouseMove := HSHintComboBoxListMouseMove;
          end;
     if not ComboBoxVne.Visible then FHSHintComboBoxVne.Hide;
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
  //  OnListMouseMove := HSHintComboBoxListMouseMove;
          end;
     if not ComboBoxGN.Visible then FHSHintComboBoxGN.Hide;
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
  //  OnListMouseMove := HSHintComboBoxListMouseMove;
          end;
     if not ComboBoxNIS.Visible then FHSHintComboBoxNIS.Hide;
     ComboBoxNIS.Free();

 end;

end.
