{$WARNINGS OFF}
{$HINTS OFF}
unit FormKadryU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids,ScrDef, ComCtrls, Buttons, Mask, ActnList, Menus,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar;

type
  TFormKadry = class(TForm)
    StringGrid1: TStringGrid;
    ComboBoxKat: TComboBox;
    Label1: TLabel;
    ComboBoxGru: TComboBox;
    Label2: TLabel;
    EditDolg: TEdit;
    Label3: TLabel;
    EditOklad: TEdit;
    LabelOklad: TLabel;
    Label5: TLabel;
    ComboBoxDol: TComboBox;
    Label6: TLabel;
    EditKoef: TEdit;
    Label7: TLabel;
    ComboBoxWR: TComboBox;
    Label8: TLabel;
    ComboBoxSwm: TComboBox;
    Label9: TLabel;
    ComboBoxTemy: TComboBox;
    LabelTemy: TLabel;
    ComboBoxMOR: TComboBox;
    ComboBoxFrom: TComboBox;
    Label11: TLabel;
    Label12: TLabel;
    EditKwoD: TEdit;
    UpDown1: TUpDown;
    LabelUw: TLabel;
    ComboBoxProf: TComboBox;
    Label14: TLabel;
    ComboBoxBank: TComboBox;
    LabelBank: TLabel;
    Label16: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    UpDownRazr: TUpDown;
    EditRazr: TEdit;
    Label17: TLabel;
    EditIdCode: TMaskEdit;
    btnSave: TButton;
    btnChgFam: TBitBtn;
    ActionList1: TActionList;
    ActionCopyPerson: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ActionSetPersonMainParameter: TAction;
    N2: TMenuItem;
    DateTimePickerUw: TDateTimePicker;
    BitBtnUw: TBitBtn;
    BitBtnUwEn: TBitBtn;
    BitBtn3: TBitBtn;
    actCopyPersonFromPreviousMonth: TAction;
    N3: TMenuItem;
    N4: TMenuItem;
    actCopyPersonFromPM: TAction;
    N5: TMenuItem;
    ChgTabno: TBitBtn;
    btSearchDolg: TBitBtn;
    BitBtnDogPodSowm: TBitBtn;
    function Execute: boolean;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure ComboBoxKatChange(Sender: TObject);
    procedure SetCurrPerson(C_Person:Person_Ptr);
    function GetRow:integer;
    procedure ComboBoxGruChange(Sender: TObject);
    procedure EditDolgChange(Sender: TObject);
    procedure EditOkladChange(Sender: TObject);
    procedure ComboBoxDolChange(Sender: TObject);
    procedure EditKoefChange(Sender: TObject);
    procedure ComboBoxWRChange(Sender: TObject);
    procedure ComboBoxSwmChange(Sender: TObject);
    procedure ComboBoxTemyChange(Sender: TObject);
    procedure StringGrid1Enter(Sender: TObject);
    procedure ComboBoxMORChange(Sender: TObject);
    procedure ComboBoxFromChange(Sender: TObject);
    procedure EditKwoDChange(Sender: TObject);
    procedure ComboBoxProfChange(Sender: TObject);
    procedure ComboBoxBankChange(Sender: TObject);
    procedure EditIdCodeChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EditRazrChange(Sender: TObject);
    function  NeedRecalc:boolean;
    procedure btnSaveClick(Sender: TObject);
    procedure btnChgFamClick(Sender: TObject);
    procedure ActionCopyPersonExecute(Sender: TObject);
    procedure ActionSetPersonMainParameterExecute(Sender: TObject);
    procedure DateTimePickerUwChange(Sender: TObject);
    procedure BitBtnUwClick(Sender: TObject);
    procedure BitBtnUwEnClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure actCopyPersonFromPreviousMonthExecute(Sender: TObject);
    procedure actCopyPersonFromPMExecute(Sender: TObject);
    procedure ChgTabnoClick(Sender: TObject);
    procedure btSearchDolgClick(Sender: TObject);
    procedure BitBtnDogPodSowmClick(Sender: TObject);
  private
    { Private declarations }
    Curr_Person : Person_Ptr;
    Old_Person  : PERSON;
    Old_Oklad   : real;
    Setted      : boolean;
    procedure MakeGrid;
    procedure SetUpSowmKadry(Tabno,W_P:integer);
    procedure TestChangePerson;
    procedure copy_Person_From_Another_Podr(wantedMode:integer);
//    PROCEDURE copy_Person_From_Another_Month;
    procedure SetUpDataUwView;
    function getMORItemIndexForShifrPod(shifrPod:integer):Integer;
    function getFromItemIndexForShifrPod(shifrPod:integer):Integer;

  public
    { Public declarations }
  end;

var
  FormKadry: TFormKadry;


implementation
  uses ScrUtil,ScrLists, FormKadryClU,KadClU,ScrIo,ScrNalog,
  UFormSelPodrPerson,uFrmFindKadryFB,UFormPersonMainState,
  DateUtils,UFormSearchDolg,USQLUnit,UFormSelDogPodSowm;
{$R *.dfm}
function TFormKadry.getMORItemIndexForShifrPod(shifrPod:integer):Integer;
  var retVal:Integer;
      i:Integer;
      S:string;
  begin
        retVal:=0;
        if ComboBoxMOR.Items.Count>0 then
        for i:=0 to ComboBoxMOR.Items.Count-1 do
            begin
                 S:= Trim(UPPER_STRING(ComboBoxMOR.Items[i]));
                 if Trim(UPPER_STRING(Name_Serv(shifrPod)))=S then
                    begin
                         retVal:=i;
                        Break;
                    end;
            end;
       getMORItemIndexForShifrPod:=retVal;
  end;
function TFormKadry.getFromItemIndexForShifrPod(shifrPod:integer):Integer;
  var retVal:Integer;
      i:Integer;
      S:string;
  begin
        retVal:=0;
        if ComboBoxFrom.Items.Count>0 then
        for i:=0 to ComboBoxFrom.Items.Count-1 do
            begin
                 S:= Trim(UPPER_STRING(ComboBoxFrom.Items[i]));
                 if Trim(UPPER_STRING(Name_Serv(shifrPod)))=S then
                    begin
                         retVal:=i;
                        Break;
                    end;
            end;
       getFromItemIndexForShifrPod:=retVal;
  end;

procedure TFormKadry.MakeGrid;
 var C_Person:Person_Ptr;
     i:integer;
     S:String;
 begin
      C_Person:=Head_Person;
//      S:=C_Person^.Fio;
      StringGrid1.ColCount:=2;
      i:=Count_Person+1;
      StringGrid1.RowCount:=i;
      StringGrid1.Cells[0,0]:='Таб.ном.';
      StringGrid1.Cells[1,0]:='Фамилия И О.';
      StringGrid1.ColWidths[0]:=50;
      StringGrid1.ColWidths[1]:=200;
      i:=0;
      while (C_Person<>Nil) do
       begin
             Inc(i);
             if C_Person^.Tabno>0 then
                begin
                     StringGrid1.Cells[0,i]:=IntToStr(C_Person^.Tabno);
                     StringGrid1.Cells[1,i]:=C_Person^.Fio;
                     if C_Person^.Main=0 then
                        StringGrid1.Cells[1,i]:=Trim(C_Person^.Fio)+' переведен';
                end;
             if C_Person=Curr_Person then StringGrid1.Row:=i;
             C_Person:=C_Person^.Next;
       end;

 end;

function TFormKadry.Execute: boolean;
begin
  Self.visible:=false;
  if ShowModal = mrOk then begin
    result := true;
  end else begin
    result := false;
  end;
end;

procedure TFormKadry.FormClose(Sender: TObject; var Action: TCloseAction);
begin
{      Action:=caFree;}
end;

procedure TFormKadry.FormShow(Sender: TObject);
var m:Boolean;
begin
     MakeGrid;
     StringGrid1.SetFocus;
{     Setted:=true; }
     StringGrid1SelectCell(Sender,0,StringGrid1.Row,m);
end;

procedure TFormKadry.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
    vRow,vCol:integer;
    S:String;
    Shift:integer;
begin

      vRow:=aRow;
      vCol:=aCol;
      if vRow<1 then Exit;
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

procedure TFormKadry.FormCreate(Sender: TObject);
var i:integer;
    Temy:TStringList;
    S:String;
begin
     Setted:=false;
     for i:=1 to max_kategorija do
         ComboBoxKat.Items.Add(Get_Kat_Name(i));
//     for i:=1 to max_ist_fin do
//         ComboBoxGru.Items.Add(Get_Ist_Name(i));
     ComboBoxGru.Items.AddStrings(GruppyList.getActiveNames);
     for i:=1 to count_dolg do
         ComboBoxDol.Items.Add(Name_Dolg(i));
     for i:=1 to 2 do
         ComboBoxWR.Items.Add(Get_WR_Name(i));
     for i:=1 to 3 do
         ComboBoxSWM.Items.Add(Get_SWM_Name(i));
     for i:=1 to nameServList.Count do
         if ((Pos('РЕЗЕРВ',UPPER_STRING(NAME_SERV(i)))=0) and
             (Pos('ПУСТОЕ',UPPER_STRING(NAME_SERV(i)))=0)) then
            ComboBoxMOR.Items.Add(NAME_SERV(i));
     for i:=1 to nameServList.Count do
         if ((Pos('РЕЗЕРВ',UPPER_STRING(NAME_SERV(i)))=0) and
             (Pos('ПУСТОЕ',UPPER_STRING(NAME_SERV(i)))=0)) then
            ComboBoxFrom.Items.Add(NAME_SERV(i));
     ComboBoxProf.Items.Add('Да');
     ComboBoxProf.Items.Add('Нет');
     for i:=1 to BankiList.Count do
         ComboBoxBank.Items.Add(BankiList.getBankNameByNo(i));
     ComboBoxBank.Items.Add('Касса');
 (*
     ComboBoxBank.Items.Add('Приват');
  //   ComboBoxBank.Items.Add('Брокбизнес');
     ComboBoxBank.Items.Add('УкрСоцБанк');
     ComboBoxBank.Items.Add('УкрСибБанк');
     ComboBoxBank.Items.Add('Касса');
*)     
     try
         Temy:=TStringList.Create;
         TemyList.GetName(NSRV,Temy);
         for i:=1 to Temy.Count do
             begin
                  S:=Temy.Strings[i-1];
                  ComboBoxTemy.Items.Add(S);
             end;
     finally
         Temy.Destroy;
     end;
     EditRazr.Text:='0';
     btnSave.Hide;
  //   move Old_Person:=Curr_Person^;
    // TestChangePerson;
//    if isLNR then
//       ComboBoxGru.Enabled:=False; 
    if NMES<>FLOW_MONTH then
       begin
            btnChgFam.Hide;
            ChgTabno.Hide;
            ComboBoxBank.Enabled := False;
            ComboBoxDol.Enabled  := False;
            ComboBoxFrom.Enabled := False;
            ComboBoxGru.Enabled  := False;
            ComboBoxKat.Enabled  := False;
            ComboBoxMOR.Enabled  := False;
            ComboBoxProf.Enabled := False;
            ComboBoxSwm.Enabled  := False;
            ComboBoxTemy.Enabled := False;
            BitBtnDogPodSowm.Enabled:=false;
            ComboBoxWR.Enabled   := False;
            EditDolg.Enabled     := false;
            EditIdCode.Enabled   := false;
            EditKoef.Enabled     := false;
            EditKwoD.Enabled     := false;
            EditOklad.Enabled    := false;
            EditRazr.Enabled     := false;
            DateTimePickerUw.Enabled:=False;
            BitBtnUw.Enabled     := False;
            BitBtnUwEn.Enabled   := False;
            BitBtnUwEn.Hide;
            btSearchDolg.Enabled := False;
            btSearchDolg.Hide;


       end;
     if isLNR then
        begin
             LabelTemy.Hide;
             ComboBoxTemy.Hide;
             ComboBoxTemy.Enabled:=False;
             BitBtnDogPodSowm.Enabled:=false;
             BitBtnDogPodSowm.Hide;

//             LabelBank.Hide;
//             ComboBoxBank.Hide;
//             ComboBoxBank.Enabled:=False;
        end;

end;

procedure TFormKadry.SetCurrPerson(C_Person:Person_ptr);
 var NCode:string;
 begin
      NCode:='';
      Curr_Person:=C_Person;
      NCode:=Curr_Person^.Nal_Code;
      Old_Oklad := Curr_Person^.OKLAD;
      Setted:=true;
      Old_Person:=Curr_Person^;
      TestChangePerson;
 end;

function TFormKadry.GetRow:integer;
 begin
       Result:=StringGrid1.Row;
 end;

procedure TFormKadry.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var i,TABNO:integer;
    FIO:STRING;
    NCode:string;
    Dol_Code:Integer;
    Nomer_Dolg_Val:integer;
    FindedLineno:Integer;
begin
     if count_person=0 then exit;
     if not Setted then EXit;
     Curr_Person:=head_person;
     if ARow>1 then
        for i:=1 to ARow-1 do Curr_Person:=Curr_Person^.NEXT;
     NCode:=Curr_Person^.Nal_Code;   
     if (Curr_Person^.Kategorija>0) and (Curr_Person^.Kategorija<=max_kategorija) then
        begin
             ComboBoxKat.Text:=Get_Kat_Name(Curr_Person^.Kategorija);
             ComboBoxKat.ItemIndex:=Curr_Person^.KATEGORIJA-1;
        end;
     if (Curr_Person^.Gruppa>0) and (Curr_Person^.Gruppa<=max_ist_fin) then
        begin
 //            ComboBoxGru.Text:=Get_Ist_Name(Curr_Person^.Gruppa);
 //            ComboBoxGru.ItemIndex:=Curr_Person^.Gruppa-1;
             FindedLineno:=GruppyList.getLinenoByCodeForActiveOnly(Curr_person.GRUPPA);
             ComboBoxGru.ItemIndex:=FindedLineno-1;
             Application.ProcessMessages;
        end;
     Dol_Code:= Get_Dol_Code(Curr_Person);
     if (Dol_Code>0) then
        begin
             ComboBoxDol.Text:=NAME_DOLG_BY_SHIFR(Dol_Code);
             Nomer_dolg_Val:=Nomer_Dolg(Dol_Code)-1;
             if Nomer_dolg_Val<0 then
                Nomer_dolg_Val:=0;
             ComboBoxDol.ItemIndex:=Nomer_Dolg_Val;
        end;
     ComboBoxWR.Text:=Get_WR_Name(Curr_Person^.Wid_Raboty);
     ComboBoxWR.ItemIndex:=Curr_Person^.Wid_Raboty-1;
     if Curr_Person^.Wid_Raboty=2 then
        begin
            ComboBoxSwm.Text:=GET_SWM_NAME(GET_SWM_MODE_PERSON(Curr_Person));
            ComboBoxSwm.ItemIndex:=GET_SWM_MODE_PERSON(Curr_Person)-1;
            ComboBoxSwm.Show;
            Label9.Show;
        end
                                  else
        begin
            ComboBoxSwm.Hide;
            Label9.Hide;
        end;
     ComboBoxTemy.Text:=Curr_Person^.N_temy;
     BitBtnDogPodSowm.Hide;
     if Curr_Person^.Gruppa=1 then
        begin
            ComboBoxTemy.Hide;
            LabelTemy.Hide;
            BitBtnDogPodSowm.Hide;
        end
                              else
        begin
            ComboBoxTemy.Show;
            LabelTemy.Show;
            if isSVDN then
            if (nmes=flow_month) then
            if (curr_person^.WID_RABOTY=2) then
            if (curr_person^.MESTO_OSN_RABOTY=82) then
                BitBtnDogPodSowm.Show;

        end;
     ComboBoxMOR.Text:=NAME_SERV(Curr_Person^.MESTO_OSN_RABOTY);
  //   ComboBoxMOR.ItemIndex:=Curr_Person^.MESTO_OSN_RABOTY-1;
     ComboBoxMOR.ItemIndex:=getMORItemIndexForShifrPod(Curr_Person^.MESTO_OSN_RABOTY);
     ComboBoxFrom.Text:=NAME_SERV(Curr_Person^.From);
  //     ComboBoxFrom.ItemIndex:=Curr_Person^.From-1;
     ComboBoxFrom.ItemIndex:=getFromItemIndexForShifrPod(Curr_Person^.From);
     if Curr_Person^.PROFSOJUZ=1 then
        begin
             ComboboxProf.Text:='Да';
             ComboboxProf.ItemIndex:=0;
        end
     else
        begin
             ComboboxProf.Text:='Нет';
             ComboboxProf.ItemIndex:=1;
        end;
     ComboboxBank.ItemIndex:=BankiList.getBankItemNoByShifr(Curr_Person^.Bank);
 //    ComboboxBank.Text:=BankiList.getBankNameByItemNo(ComboboxBank.ItemIndex);
(*
     if Curr_Person^.Bank=1 then
        begin
             ComboboxBank.Text:='Приват';
             ComboboxBank.ItemIndex:=0;
        end
                             else
     if Curr_Person^.Bank=2 then
        begin
       //      ComboboxBank.Text:='Брокбизнес';
             ComboboxBank.Text:='УкрСоцБанк';
             ComboboxBank.ItemIndex:=1;
        end
                             else
     if Curr_Person^.Bank=3 then
        begin
       //      ComboboxBank.Text:='Брокбизнес';
             ComboboxBank.Text:='УкрСибБанк';
             ComboboxBank.ItemIndex:=2;
        end
                             else
        begin
             ComboboxBank.Text:='Касса';
             ComboboxBank.ItemIndex:=3;
        end;
*)        
     EditRazr.Text:=IntToStr(GetRazrjadPerson(Curr_Person));
     EditDolg.Text:=Curr_Person^.DOLG;
     DateTimePickerUw.Date:=getDataUwPerson(Curr_Person);
     SetUpDataUwView;
     TABNO:=Curr_Person^.TABNO;
     FIO:=Curr_Person^.FIO;
{     EditIdCode.Text:=Curr_Person^.NAL_CODE;}
    NCode:=Curr_Person^.Nal_Code;

     EditOklad.Text:=FloatToStrF(Curr_Person^.Oklad,ffFixed,12,2);
     if GET_KOEF_UW_OKLAD_PERSON(Curr_Person)>0.001 then
        LabelOklad.Caption:='Оклад+'+FloatToStrF(Get_Koef_Uw_Oklad_Person(Curr_Person),ffFixed,4,2)
     else
        LabelOklad.Caption:='Оклад';
     if isSVDN then
        EditKoef.Text:=FloatToStrF(Get_Koef_Oklad_Person(Curr_Person),ffFixed,4,2)
     else
        EditKoef.Text:=FloatToStrF(Get_Koef_Oklad_Person(Curr_Person),ffFixed,6,4);
     EditKwoD.Text:=IntToStr(Curr_Person^.MALO);
     DateTimePickerUw.Date:=getDataUwPerson(Curr_Person);
     SetUpDataUwView;
{     EditIdCode.Text:=Curr_Person^.NAL_CODE;}
     NCode:=Curr_Person^.Nal_Code;
     EditIdCode.Text:=NCode;
     EditKoef.Repaint;
     EditOklad.Repaint;
     EditDolg.Repaint;
     EditRazr.Repaint;
     EditIdCode.RePaint;
     Application.ProcessMessages;

end;

procedure TFormKadry.ComboBoxKatChange(Sender: TObject);
begin
      if Assigned(Curr_Person) then
         Curr_Person^.Kategorija:=ComboBoxKat.ItemIndex+1;
      TestChangePerson;
end;

procedure TFormKadry.ComboBoxGruChange(Sender: TObject);
 var i,j:Integer;
begin
      if (NMES<>flow_month)then
         begin
              ShowMessage('Изменения возможны только в текущем месяце');
              Exit;
         end;
      if Assigned(Curr_Person) then
         begin
               j:=ComboBoxGru.ItemIndex+1;
               i:=Curr_Person^.Gruppa;
               if j>0 then
                  i:=GruppyList.getCodeByLinenoForActiveOnly(ComboBoxGru.ItemIndex+1);
               if i>0 then
                  Curr_Person^.Gruppa:=i;
         end;
  //       Curr_Person^.Gruppa:=ComboBoxGru.ItemIndex+1;
  //         Curr_Person^.Gruppa:=getGruppaComboBoxGru.ItemIndex+1;
      if Curr_Person^.Gruppa=1 then
         begin
             ComboBoxTemy.Hide;
             LabelTemy.Hide;
             BitBtnDogPodSowm.Hide;
         end
                              else
        begin
            ComboBoxTemy.Show;
            LabelTemy.Show;
            if (NMES=flow_month)then
            if isSVDN then
            if Curr_person^.WID_RABOTY=2 then
            if Curr_person^.MESTO_OSN_RABOTY=82 then
               begin
                    BitBtnDogPodSowm.Show;
               end;

        end ;
      TestChangePerson;

end;

procedure TFormKadry.EditDolgChange(Sender: TObject);
begin
     if Assigned(Curr_Person) then  Curr_Person^.Dolg:=EditDolg.Text;
     TestChangePerson;
end;

procedure TFormKadry.EditOkladChange(Sender: TObject);
VAR S,S1:String;
    A:REAL;
    I:INTEGER;
begin
     if Assigned(Curr_Person) then
        BEGIN
             S:=AllTrim(EditOklad.Text);
             if Length(S)>0 then
                S1:=ReplChar(S,',','.')
             else
                S1:=S;
             VAL(S1,a,I);
             IF I=0 THEN
                Curr_Person^.Oklad:=A;
             if Length(S)=0 then
                Curr_Person^.Oklad:=0;

        END;
      TestChangePerson;

end;


procedure TFormKadry.ComboBoxDolChange(Sender: TObject);
begin
      if Assigned(Curr_Person) then
          begin
               MAKE_DOL_PERSON(CURR_PERSON,Shifr_Dolg(ComboBoxDol.ItemIndex+1));
           //    EditRazr.Text:=IntToStr(Razr_Dolg(ComboBoxDol.ItemIndex+1));
           //    EditRazr.Repaint;
           //    SetRazrjadPerson(Curr_Person,Shifr_Dolg(Razr_Dolg(ComboBoxDol.ItemIndex+1)));
          end ;
      TestChangePerson;

end;

procedure TFormKadry.EditKoefChange(Sender: TObject);
VAR S,S1:STRING;
    A,B:REAL;
    I:INTEGER;
begin
     b:=1;
     if Assigned(Curr_Person) then
        BEGIN
             S:=AllTrim(EditKoef.Text);
             if length(s)>0 then
                S1:=ReplChar(S,',','.')
             else
                S1:=S;
             VAL(S1,a,I);
             IF I<>0 THEN a:=b;
             Make_Koef_Oklad_Person(Curr_Person,a);
        END;
      TestChangePerson;

end;

procedure TFormKadry.ComboBoxWRChange(Sender: TObject);
begin
      if Assigned(Curr_Person) then
          CURR_PERSON^.Wid_Raboty:=ComboBoxWR.ItemIndex+1;
      if CURR_PERSON^.WID_RABOTY<>2 THEN
         begin
              ComboBoxSwm.Hide;
              Label9.Hide;
         end
                                    else
         begin
              ComboBoxSwm.Show;
              Label9.Show;
         end;
      TestChangePerson;

end;

procedure TFormKadry.ComboBoxSwmChange(Sender: TObject);
begin
      if Assigned(Curr_Person) then
         PUT_SWM_MODE_TO_PERSON(CURR_PERSON,ComboBoxSwm.ItemIndex+1);
      TestChangePerson;
end;

procedure TFormKadry.ComboBoxTemyChange(Sender: TObject);
begin
      if Assigned(Curr_Person) then
         Curr_Person^.N_TEMY:=ComboBoxTemy.Text;
      TestChangePerson;
end;

procedure TFormKadry.StringGrid1Enter(Sender: TObject);
var m:boolean;
begin
     StringGrid1SelectCell(Sender,0,StringGrid1.Row,m);
end;

procedure TFormKadry.ComboBoxMORChange(Sender: TObject);
var S:string;
    i:Integer;
begin
      if Assigned(Curr_Person) then
         begin
              i:=ComboBoxMOR.ItemIndex;
              if i>=0 then
                 begin
                      s:=Trim(ComboBoxMOR.Items[i]);
                      CURR_PERSON^.MESTO_OSN_RABOTY:=NameServList.findShifrPodByName(S);
                      if CURR_PERSON^.MESTO_OSN_RABOTY=0 then
                         CURR_PERSON^.MESTO_OSN_RABOTY:=NSRV;
                 end;
         end;
  //       CURR_PERSON^.MESTO_OSN_RABOTY:=ComboBoxMOR.ItemIndex+1;
      TestChangePerson;
end;

procedure TFormKadry.ComboBoxFromChange(Sender: TObject);
var S:string;
    i:Integer;
begin
      if Assigned(Curr_Person) then
         begin
              i:=ComboBoxFrom.ItemIndex;
              if i>=0 then
                 begin
                      s:=Trim(ComboBoxFrom.Items[i]);
                      CURR_PERSON^.From:=NameServList.findShifrPodByName(S);
                      if CURR_PERSON^.From=0 then
                         CURR_PERSON^.From:=NSRV;
                 end;
         end;

 //     if Assigned(Curr_Person) then
 //        CURR_PERSON^.FROM:=ComboBoxFrom.ItemIndex+1;
      TestChangePerson;

end;

procedure TFormKadry.EditKwoDChange(Sender: TObject);
 var S:String;
     i,j:integer;
begin
      if Assigned(Curr_Person) then
         begin
              S:=EditKwoD.Text;
              val(S,I,j);
              if (j=0) and (i>-16) and (i<18) then
                 Curr_Person^.MALO:=i;
         end;
      TestChangePerson;
end;

procedure TFormKadry.ComboBoxProfChange(Sender: TObject);
begin
      if Assigned(Curr_Person) then
         if ComboBoxProf.ItemIndex=0 then Curr_Person^.Profsojuz:=1
                                     else Curr_Person^.Profsojuz:=0;
      TestChangePerson;
end;

procedure TFormKadry.ComboBoxBankChange(Sender: TObject);
begin
      if Assigned(Curr_Person) then
  //    if ComboBoxBank.ItemIndex=3 then Curr_Person^.Bank:=0
  //                                else Curr_Person^.Bank:=ComboBoxBank.ItemIndex+1;
      Curr_Person^.Bank:=BankiList.getBankShifrByItemNo(ComboBoxBank.ItemIndex);
      TestChangePerson;

end;

procedure TFormKadry.EditIdCodeChange(Sender: TObject);
var S:String;
    J:Integer;
    I:Int64;
begin
      if Assigned(Curr_Person) then
         begin
              Curr_Person^.NAL_CODE:='';
              S:=EditIdCode.Text;
              if Length(AllTrim(S))=10 then
                 begin
                       val(s,i,j);
                       if j=0 then
                          Curr_Person^.NAL_CODE:=AllTrim(s);
                 end;
         end;
      TestChangePerson;

end;

procedure TFormKadry.BitBtn1Click(Sender: TObject);
var Tabno:Integer;
    FIO:String;
    NalCode:String;
    WorkPLace:integer;
    RecNo:Integer;
    i:integer;
    modeFive:boolean;
begin
     if NMES<>FLOW_MONTH then
        begin
             ShowMessage('Добавлять сотрудника можно только в текущем месяце');
             Exit;
        end;
     modeFive:=true;
     if isLNR then
        begin
             if yesNo('Шестидневка') then
                modeFive:=false;
        end;
     if modeKadrySQL then
      with TFormFindKadryFB.Create(nil) do
         try
           if execute then
              begin
                   WorkPlace:=GetShifrPod;
       //            GetParPerson(Tabno,Fio,NalCode,WorkPlace,RecNo);
                   FIO:=GetFio;
                   NalCode:=GetNalCode;
                   Tabno := GetTabno;
                   Make_Person(Curr_Person);
                   Curr_Person^.FIO      := SHORT_FIO(Fio);
                   Curr_Person^.TABNO    := Tabno;
                   Curr_Person^.Nal_Code := NalCode;
                   MakeGUID(Curr_Person);
                   Curr_Person^.FROM     := NSRV;
                   if WorkPlace=0 then
                      begin
                           Curr_Person^.MESTO_OSN_RABOTY:=NSRV;
                           Curr_Person^.Wid_Raboty:=Osn_Wid_Raboty;
                           SetWorkPlaceKadrySQL(NSRV,TABNO);
                      end
                   else
                      begin
                           Curr_Person^.Wid_Raboty:=Sowm_Wid_Raboty;
                           Curr_Person^.MESTO_OSN_RABOTY:=WorkPlace;
                           SetUpSowm(Tabno,WorkPlace);
                      end;
                   if isLNR then
                      if modeFive then
                         begin
                              Curr_Person^.KATEGORIJA:=2;
                              FILL_STANDARD_TABEL_PERSON(CURR_PERSON);
                         end;
                   MakeGrid;

              end;
         finally
       //     free;
         end
     else
      with TFormKadryCl.Create(nil) do
         try
           if execute then
              begin
                   GetParPerson(Tabno,Fio,NalCode,WorkPlace,RecNo);
                   if WorkPlace=0 then
                      begin
                           Make_Person(Curr_Person);
                           Curr_Person^.FIO      := SHORT_FIO(Fio);
                           Curr_Person^.TABNO    := Tabno;
                           Curr_Person^.Nal_Code := NalCode;
                           Curr_Person^.MESTO_OSN_RABOTY:=NSRV;
                           Curr_Person^.FROM     := NSRV;
                           MakeGUID(Curr_Person);
                           MakeGrid;
                           SetWorkPlace(NSRV,RecNo);
                      end
                                  else
                      begin
                           Make_Person(Curr_Person);
                           Curr_Person^.FIO:=SHORT_FIO(Fio);
                           Curr_Person^.TABNO:=Tabno;
                           Curr_Person^.Nal_Code:=NalCode;
                           Curr_Person^.Wid_Raboty:=Sowm_Wid_Raboty;
                           Curr_Person^.MESTO_OSN_RABOTY:=WorkPlace;
                           Curr_Person^.FROM:=NSRV;
                           MakeGUID(Curr_Person);
                           MakeGrid;
                           SetUpSowm(Tabno,WorkPlace);
                      end;

              end;
         finally
            free;
            if Assigned(KadryList) then
            if KadryList.Count>0   then
               KadryList.Free;
         end;

end;

procedure TFormKadry.BitBtn2Click(Sender: TObject);
var Tabno : integer;
    W_P   : integer;
 //   C_P   : Integer;

begin
     if (NMES<>FLOW_MONTH) then
        begin
             ShowMessage('Удалить сотрудника можно только в текущем месяце');
             Exit;
        end;
     if not Assigned(Curr_Person) then Exit;
     if Curr_Person^.Tabno<1 then Exit;
     if not YesNo('Удалить работника?') then Exit;
     if Curr_Person^.Wid_Raboty=OSN_WID_RABOTY then
        if Count_Sowm(Curr_Person)>0 then
           begin
                ShowMessage('У этого сотрудника есть совмещения. Вначале удалите их');
                Exit;
           end;
     if (Count_Ud(Curr_Person)>0) or (Count_Add(Curr_Person)>0) then
        if not YesNo('У работника есть начисления/удержания. Удалить запись?') then Exit;
     Tabno:=Curr_Person^.Tabno;
     if Curr_Person^.Wid_Raboty=1 then
        W_P:=0
                                  else
        W_P:=Curr_Person^.Mesto_Osn_Raboty;
     Del_Person(Curr_Person);
     if W_P>0 then SetUpSowm(Tabno,W_P)
              else
        begin
             if modeKadrySQL then
                ZeroWorkPlaceKadrySQL(Tabno)
             else
                ZeroWorkPlace(Tabno);
        end;
     if COUNT_PERSON=0 then
        begin
             MAKE_PERSON(Curr_Person);
             Curr_Person.TABNO:=0;
             Curr_Person.FIO:='';
        end;
     MakeGrid;
end;

procedure TFormKadry.SetUpSowmKadry(Tabno,W_P:integer);
{ W_P - место основной работы}
 var C_Person:Person_Ptr;
     C:integer;
     TempHeadPerson:Person_Ptr;
     TempNSRV:INTEGER;
 procedure Repair_Sowm(C_Person:Person_Ptr;W_P:integer;C:Integer);
  var Curr_Sowm:Sowm_Ptr;
      Done:boolean;
      i:integer;
  begin
       Done:=false;
       Curr_Sowm:=Curr_Person^.Sowm;
       while not Done do
        begin
             Done:=true;
             Curr_Sowm:=Curr_Person^.Sowm;
             while (Curr_Sowm<>Nil) do
              begin
                   if Curr_Sowm^.Where=W_P then
                      begin
                           Del_Sowm(Curr_Sowm,C_Person);
                           Done:=false;
                           break;
                      end;
                   Curr_Sowm:=Curr_Sowm^.NEXT;
              end;
        end;
       if C>0 then
          for i:=1 to C do
              begin
                   make_Sowm(Curr_Sowm,C_Person);
                   Curr_Sowm^.WHERE:=W_p;
              end;
  end;
 begin
      c:=0;
      c_Person:=head_Person;
      while (C_Person<>Nil) do
       begin
            if (c_Person^.Tabno=TABNO) then
            if (c_Person^.wid_raboty=Sowm_Wid_Raboty) then Inc(c);
            C_Person:=C_Person^.NEXT;
       end;

      if W_p=NSRV then
         begin
              c_person:=head_Person;
              while c_Person<>Nil do
               begin
                    if c_Person^.wid_raboty=Osn_Wid_Raboty then
                       begin
                            Repair_Sowm(C_Person,nsrv,c);
                            break;
                       end;
                    c_person:=c_person^.Next;
               end;
         end
                  else
         begin
              TempHeadPerson:=Head_Person;
              TempNSRV:=NSRV;
              NSRV:=W_P;
              MKFLNM;
              GETINF(TRUE);
              c_person:=head_Person;
              while c_Person<>Nil do
               begin
                    if c_Person^.wid_raboty=1 then
                       begin
                            Repair_Sowm(C_Person,W_P,c);
                            break;
                       end;
                    c_person:=c_person^.Next;
               end;

              PUTINF;
              while HEAD_PERSON<>NIL do Del_Person(Head_Person);
              Head_Person:=TempHeadPerson;
              NSRV:=TempNSRV;
              MKFLNM;

         end;
 end;

procedure TFormKadry.EditRazrChange(Sender: TObject);
var I,J:Integer;
begin
      if Assigned(Curr_Person) then
         begin
              val(EditRazr.Text,I,J);
              if ((i>=0) and (i<=23)) then
                  if J=0 then SetRazrjadPerson(Curr_Person,i);
         end;
end;

function  TFormKadry.NeedRecalc:boolean;
 begin
      Result := false;
      if abs(abs(Curr_Person^.Oklad)-abs(Old_Oklad))>0.01 then
         Result := true;
 end;

procedure TFormKadry.TestChangePerson;
 const l=SizeOf(add_ptr)+SizeOf(ud_ptr)+SizeOf(cn_ptr)+SizeOf(Sowm_ptr)+SizeOf(Person_Ptr);
 type t=array[1..SizeOf(person)-l] of Byte;
 var New_Person:PERSON;
     r1,r2:t;
 function CmpArr:Boolean;
  var i:Integer;
      RetVal:Boolean;
  begin
       RetVal:=True;
       for i:=1 to SizeOf(t) do
           if r1[i]<>r2[i] then
              begin
                   RetVal:=False;
                   Break;
              end;
       CmpArr:=RetVal;
  end;
 begin
      if not Assigned(Curr_Person) then Exit;
      Move(Curr_Person^,r1,SizeOf(r1));
      Move(Old_Person,r2,SizeOf(r2));
      if not CmpArr then
         if NMES=FLOW_MONTH then
            btnSave.Show
          else  
      else
         btnSave.Hide
 end;

procedure TFormKadry.btnSaveClick(Sender: TObject);
 var rb,re:PERSON;
begin
     if NMES<>FLOW_MONTH then
        begin
             btnSave.Hide;
             Exit;
        end;

     rb:=Curr_Person^;
     re:=Old_Person;
     if Abs(Abs(Curr_Person^.Oklad)-Abs(Old_Person.Oklad))>0.005 then
     if Curr_Person^.AUTOMATIC=AutoMatic_mode   then
        Calc_NAUD_Person(Curr_Person,31);

     Self.Close;
end;

procedure TFormKadry.btnChgFamClick(Sender: TObject);
 const s='АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЬЫЭЮЯІЇЄ .''';
 var FIO:string;
     upperFIO:string;
     i,l:Integer;
     c:String;
     wrongCharacter:string;
     IsCorrect:Boolean;
begin
     if (NMES<>flow_month)then
        begin
             ShowMessage('Изменить фамилию можно только в текущем месяце');
             Exit;
        end;
     if not Assigned(Curr_Person) then
        begin
             ShowMessage('Не выбран сотрудник');
             Exit;
        end;
     Fio:=InputBox('Изменение фамилии','Введите Фамилию И.О.',StringGrid1.Cells[1,StringGrid1.Row]);
     Fio:=Trim(Fio);
     if Length(Fio)>20 then
        begin
             ShowMessage('Фамилия И.О. - не более 20 букв. А у Вас '+IntToStr(Length(Fio))+' символов');
             Exit;
        end;
     if Length(Fio)<0 then
        begin
             ShowMessage('Фамилия И.О. - не введена.');
             Exit;
        end;
     upperFIO:=AnsiUpperCase(fio);
     l:=length(upperFio);
     IsCorrect:=True;
     for i:=1 to l do
         begin
              c := upperFIO[i];
              if Pos(c,S)=0 then
                 begin
                      wrongCharacter:=c;
                      IsCorrect:=False;
                      Break;
                 end;
         end;
     if not IsCorrect then
        begin
             ShowMessage('Неверный символ '+wrongCharacter+'в фамилии '+fio);
             Exit;
        end;
     if Assigned(Curr_Person) then
        begin
             StringGrid1.Cells[1,StringGrid1.Row]:=FIO;
             StringGrid1.Repaint;
             Application.ProcessMessages;
             Curr_Person^.FIO:=FIO;
        end;


end;

{ ************************************************************ }
{ *     Процедура копирования сотрудника из другого          * }
{ *     подразделения в текущее                              * }
{ ************************************************************ }
PROCEDURE TFormKadry.copy_Person_From_Another_Podr(wantedMode:integer);
 // wantedMode
 // 1 из др подр  но в тек месяце
 // 2 из тек подр но в др месяце
 // 3 из др подр и в др месяце
 // 4 из тек подр и в прошл месяце
 VAR I,J,I_C,II,III,I_T:integer;
     CURR:PERSON_PTR;
     NSRV_TEMP:INTEGER;
     NMES_TEMP:Integer;
     toPointer:Integer;
PROCEDURE PUTINF_SAFE;
  var saveNSRV:integer;
 BEGIN
     SAVENSRV:=NSRV;
     SAFE_PUTINF:=TRUE;
     if (selected_field=2) and (nsrvarr[2]>0) then
        begin
             nsrv:=nsrvarr[2];
             mkflnm;
        end;
     PUTINF;
     SAFE_PUTINF:=FALSE;
     NSRV:=SAVENSRV;
     MKFLNM;

 END;
 PROCEDURE MAKE_NEW_SOWM(APOINTER:INTEGER);
  VAR I:INTEGER;
      CURR_PERSON,CURR_PERSON_OLD,CURR_PERSON_MAIN:PERSON_PTR;
      CURR_SOWM:SOWM_PTR;
      ListPodr:TList;
      Finded:Boolean;
      saveNSRV:INTEGER;
{ -------------------------------------------------------- }
   procedure SavePodr(WantedTabno:integer;WantedPodr:integer);
    var Curr_Person:PERSON_PTR;
        PInt:PInteger;
        saveNSRV:INTEGER;
    begin
         SELECT(2);
         saveNSRV:=nsrv;
         NSRV:=WantedPodr;
         mkflnm;
         if not FileExists(FNINF) then
            BEGIN
                 nsrv:=saveNSRV;
                 MKFLNM;
                 Exit;
            END;
         GETINF(true);
         NSRVARR[2]:=NSRV;
         Curr_Person:=HEAD_PERSON;
         while (Curr_PERSON<>Nil) do
           begin
                if Curr_Person^.Tabno=WantedTabno then
                if Curr_Person^.Wid_Raboty=2 then
                   Curr_Person^.MESTO_OSN_RABOTY:=NSRV_TEMP;
                Curr_Person:=Curr_Person^.NEXT;
           end;
         PUTINF;
         NSRVARR[2]:=0;
         EMPTY_ALL_PERSON;
         New(PInt);
         PInt^:=WantedPodr;
         ListPodr.Add(PInt);
         SELECT(1);
         NSRV:=saveNSRV;
         MKFLNM;

    end;
{ -------------------------------------------------- }
  BEGIN
     IF NMES<>FLOW_MONTH THEN
        begin
            error('Изменения можно вносить только в текущем месяце');
            exit;
        end;
      saveNSRV:=NSRV;
      ListPodr:=TList.Create;
      KZ:=0;
      SELECT(1);
      CURR_PERSON_MAIN:=GET_PERSON_CURFIL(APOINTER);
      Curr_Sowm:=Curr_Person_Main^.Sowm;
      while (CURR_SOWM<>Nil) do
       begin
            NSRV:=NOMER_SERV(CURR_SOWM^.WHERE);
            if NSRV<>NSRV_TEMP then
               begin
                    Finded:=false;
                    if ListPodr.Count>0 then
                       for i:=0 to ListPodr.Count-1 do
                           if PInteger(ListPodr.Items[i])^=nsrv then
                              begin
                                   Finded:=True;
                                   Break;
                              end;
                    if Finded then
                       SavePodr(Curr_Person_Main^.Tabno,NSRV);
               end;
            Curr_Sowm:=Curr_Sowm.NEXT;
       end; {END FOR}
      if ListPodr.Count>0 then
         for i:=0 to ListPodr.Count-1 do
             Dispose(PInteger(ListPodr.Items[0]));
      ListPodr.Free;
      SELECT(1);
      Curr_Person:=HEAD_PERSON;
      while (Curr_PERSON<>Nil) do
       begin
            if Curr_Person^.Tabno=Curr_Person_Main^.Tabno then
            if Curr_Person^.Wid_Raboty=2 then
               Curr_Person^.MESTO_OSN_RABOTY:=NSRV_TEMP;
            Curr_Person:=Curr_Person^.NEXT;
       end;
      NSRV:=saveNSRV;
      MKFLNM;
  END; {Конец процедуры Make_new_sowm}
{+++++++++++++++++++++++++++++++++++++++++++++++++}
 PROCEDURE COPY_OLD_PERSON(FROMPOINTER,TOPOINTER:INTEGER);
  VAR I,J,K:INTEGER;
      TEMP_NEXT:PERSON_PTR;
      CURR_PERSON,CURR_PERSON_OLD:PERSON_PTR;
      CURR_SOWM,CURR_SOWM_OLD:SOWM_PTR;
      CURR_CN,CURR_CN_OLD:CN_PTR;
      CURR_ADD,CURR_ADD_OLD:ADD_PTR;
      CURR_UD,CURR_UD_OLD:UD_PTR;
      saveNSRV:INTEGER;
  BEGIN

      SaveNSRV:=NSRV;
      KZ:=0;
  { CURR_PERSON_OLD - которого копировать }
  { CURR_PERSON     - куда копировать     }
      SELECT(2);
      CURR_PERSON_OLD:=GET_PERSON_CURFIL(FROMPOINTER);
      if Curr_Person_Old=Nil then
         begin
              select(1);
              KZ:=-1;
              NSRV:=saveNSRV;
              MKFLNM;
              Exit;
         end;
      IF CURR_PERSON_OLD^.WID_RABOTY<>1 THEN
         BEGIN
              Select(1);
              ERROR(' Переводить можно только с основного места работы');
              KZ:=-1;
              NSRV:=saveNSRV;
              MKFLNM;
              EXIT;
         END;
      SELECT(1);
      CURR_PERSON:=GET_PERSON_CURFIL(TOPOINTER);
      TEMP_NEXT:=CURR_PERSON^.NEXT;
      CURR_PERSON^:=CURR_PERSON_OLD^;
      WITH CURR_PERSON^ DO
       BEGIN
           DAY :=0;
           SOWM:=NIL;
           ADD :=NIL;
           UD  :=NIL;
           CN  :=NIL;
           MAIN:=2;     { Переведен в этом месяце }
           MESTO_OSN_RABOTY:=SHIFR_SERV(NSRV_TEMP);
           FROM:=SHIFR_SERV(NSRV);
           NEXT:=TEMP_NEXT;
       END;
      if WantedMode<>1 then
         FILL_STANDARD_TABEL_PERSON(CURR_PERSON);
      if wantedMode=1 then
         begin
              CURR_PERSON_OLD^.MAIN:=0; {Флаг неглавного основного места работы}
              CURR_PERSON_OLD^.MESTO_OSN_RABOTY:=SHIFR_SERV(NSRV_TEMP);
              SELECT(2);
              PUTINF_SAFE;        {Сохранить новый MAIN}
              NSRV:=saveNSRV;
              MkFLNM;
              SELECT(1);
         end;
      CURR_PERSON^.SOWM:=NIL;
      CURR_PERSON^.CN:=NIL;
      CURR_CN_OLD:=CURR_PERSON_OLD^.CN;
      WHILE CURR_CN_OLD<>NIL DO
          BEGIN
               MAKE_CN(CURR_CN,CURR_PERSON);
               CURR_CN^      := CURR_CN_OLD^;
               CURR_CN^.NEXT := NIL;
               CURR_CN_OLD   := CURR_CN_OLD^.NEXT;
          END;
      CURR_PERSON^.ADD:=NIL;
      CURR_PERSON^.UD:=NIL;
      if wantedMode=1 then
         begin
              CURR_SOWM_OLD:=CURR_PERSON_OLD^.SOWM;
              WHILE CURR_SOWM_OLD<>NIL DO
                BEGIN
                     MAKE_SOWM(CURR_SOWM,CURR_PERSON);
                     CURR_SOWM^.WHERE:=CURR_SOWM_OLD^.WHERE;
                     CURR_SOWM_OLD:=CURR_SOWM_OLD^.NEXT;
                END;
               CURR_ADD_OLD:=CURR_PERSON_OLD^.ADD;
               WHILE (CURR_ADD_OLD<>NIL) DO
                  BEGIN
                       MAKE_ADD(CURR_ADD,CURR_PERSON);
                       CURR_ADD^ := CURR_ADD_OLD^;
                       CURR_ADD^.NEXT := NIL;
                       CURR_ADD_OLD   := CURR_ADD_OLD^.NEXT;
                  END;
               CURR_UD_OLD:=CURR_PERSON_OLD^.UD;
               WHILE (CURR_UD_OLD<>NIL) DO
                  BEGIN
                       MAKE_UD(CURR_UD,CURR_PERSON);
                       CURR_UD^      := CURR_UD_OLD^;
                       CURR_UD^.NEXT := NIL;
                       CURR_UD_OLD   := CURR_UD_OLD^.NEXT;
                  END;
         end;
         if modeKadrySQL then
            SetWorkPlaceKadrySQL(NSRV_TEMP,CURR_PERSON^.TABNO)
         else
            SetWorkPlaceForTabno(NSRV_TEMP,CURR_PERSON^.TABNO);
        NSRV:=saveNSRV;
        MkFLNM;

 END;
 { ************************************************* }
 { *   Началo программы копирования сотрудника     * }
 { ************************************************* }
 BEGIN
   //   CURR:=GET_PERSON_CURFIL(TOPOINTER);
      NSRV_TEMP:=NSRV;
      NMES_TEMP:=NMES;
      KZ:=0;
      Application.CreateForm(TFormSelPodrPerson,FormSelPodrPerson);
      FormSelPodrPerson.setWantedMode(wantedMode);
//      FormSelPodrPerson.fillPodrGrid;
      i:=0;
      if FormSelPodrPerson.Execute then
         begin
              I:=FormSelPodrPerson.WantedPointer;
         end
      else
          Kz:=-1;
      FormSelPodrPerson.Free;
      if ((kz<0) or (i<1)) then
         begin
              NSRV:=NSRV_TEMP;
              NMES:=NMES_TEMP;
              MKFLNM;
              SELECT(2);
              EMPTY_ALL_PERSON;
              NSRVARR[2]:=0;
              SELECT(1);
              Exit;
         end;
      if SELECTED_FIELD<>1 then
         SELECT(1);
      MAKE_PERSON(Curr_Person);
      toPointer:=COUNT_PERSON;
      COPY_OLD_PERSON(I,toPointer);
      SELECT(2);
      EMPTY_ALL_PERSON;
      NSRVARR[2]:=0;
      SELECT(1);
      NSRV:=NSRV_TEMP;
      NMES:=NMES_TEMP;
      MKFLNM;
      IF KZ>=0 THEN
         MAKE_NEW_SOWM(TOPOINTER);
      SELECT(1);
      NSRV:=NSRV_TEMP;
      NMES:=NMES_TEMP;
      MKFLNM;
      PUTINF;
      GETINF(NEED_NET_FOR_GETINF);
      MakeGrid;
 END;


procedure TFormKadry.ActionCopyPersonExecute(Sender: TObject);
begin
     if NMES<>FLOW_MONTH then
        begin
             ShowMessage('Копировать сотрудника можно только в текущем месяце');
             Exit;
        end;
     copy_Person_From_Another_Podr(1);
end;

procedure TFormKadry.ActionSetPersonMainParameterExecute(Sender: TObject);
 var Curr:PERSON_PTR;
     i,aRow:Integer;
begin
     if NMES<>FLOW_MONTH then
        begin
             ShowMessage('Изменять только в текущем месяце');
             Exit;
        end;
     if count_person=0 then exit;
     if not Setted then EXit;
     Curr:=head_person;
     aRow:=StringGrid1.Row;
     if ARow>1 then
        for i:=1 to ARow-1 do Curr:=Curr^.NEXT;
      if Curr=nil  then Exit;
      if not Assigned(Curr)  then Exit;
      if Curr.WID_RABOTY<>OSN_WID_RABOTY then
         begin
             ShowMessage('Только для основного места работы');
             Exit;
         end;
      if Curr=nil then Exit;
      FormPersonMainState:=TFormPersonMainState.CreateP(Self,Curr);
      FormPersonMainState.ShowModal;
end;

procedure TFormKadry.DateTimePickerUwChange(Sender: TObject);
var Dt:TDateTime;
begin
      if Assigned(Curr_Person) then
         begin
              Dt:=DateTimePickerUw.Date;
              if not DateBetween(Dt,Encodedate(1990,1,1),EncodeDate(2100,1,1)) then
                 Fillchar(Dt,SizeOf(Dt),0);
              setDataUwPerson(Curr_Person,Dt);
              SetUpDataUwView;
         end;
end;

procedure TFormKadry.BitBtnUwClick(Sender: TObject);
var Dt:TDateTime;
begin
     FillChar(Dt,SizeOf(Dt),0);
     DateTimePickerUw.Date:=Dt;
     if Assigned(Curr_Person) then
        begin
             setDataUwPerson(Curr_Person,Dt);
        end;
     SetUpDataUwView;


end;

procedure TFormKadry.BitBtnUwEnClick(Sender: TObject);
begin
     if NMES<>FLOW_MONTH then Exit;
     DateTimePickerUw.Show;
     LabelUw.Show;
     BitBtnUw.Show;
     BitBtnUw.Enabled:=True;
     BitBtnUwEn.Hide;
     BitBtnUwEn.Enabled:=false;

end;
procedure TFormKadry.SetUpDataUwView;
var Dt:TDateTime;
begin
    Dt:=DateTimePickerUw.Date;
    if ((YearOf(Dt)>1990) and (YearOf(Dt)<2100)) then
        begin
             DateTimePickerUw.Show;
             LabelUw.Show;
             BitBtnUw.Show;
             BitBtnUw.Enabled:=true;
             BitBtnUwEn.Hide;
             BitBtnUwEn.Enabled:=false;
        end
              else
        begin
             DateTimePickerUw.Hide;
             LabelUw.Hide;
             BitBtnUw.Hide;
             BitBtnUw.Enabled:=False;
             BitBtnUwEn.Show;
             BitBtnUwEn.Enabled:=true;
        end;
    Application.ProcessMessages;


end;

procedure TFormKadry.BitBtn3Click(Sender: TObject);
var Oklad : Real;
    Razr  : Integer;
    Koef  : Real;
    ROklad : Real;
begin
     Oklad:=0;
     Razr:=GetRazrjadPerson(Curr_Person);
     if ((Razr<1) or (Razr>25)) then Exit;
     Koef := GET_KOEF_OKLAD_PERSON(Curr_Person);
     if ((Koef<0.05) or (Koef>1.0001)) then Exit;
     Oklad:=getOkladLastForRazr(Razr);
     if ((Oklad<0.05) or (Oklad>5000)) then Exit;
     ROklad:=Oklad / koef;
     Curr_Person.OKLAD:=R10(ROklad);
     EditOklad.Text:=FloatToStrF(Curr_Person^.Oklad,ffFixed,12,2)
end;



procedure TFormKadry.actCopyPersonFromPreviousMonthExecute(
  Sender: TObject);
begin
     if NMES<>FLOW_MONTH then
        begin
             ShowMessage('Копировать сотрудника можно только в текущем месяце');
             Exit;
        end;
     copy_Person_From_Another_Podr(4);

end;

procedure TFormKadry.actCopyPersonFromPMExecute(Sender: TObject);
begin
     if NMES<>FLOW_MONTH then
        begin
             ShowMessage('Копировать сотрудника можно только в текущем месяце');
             Exit;
        end;
     copy_Person_From_Another_Podr(3);

end;

procedure TFormKadry.ChgTabnoClick(Sender: TObject);
 var Tabno:integer;
     i:Integer;
     iVal,ICode:Integer;
     S:string;
     IsCorrect:Boolean;
begin
     if (NMES<>flow_month)then
        begin
             ShowMessage('Изменить таб.номер можно только в текущем месяце');
             Exit;
        end;
     if not Assigned(Curr_Person) then
        begin
             ShowMessage('Не выбран сотрудник');
             Exit;
        end;
     S:=InputBox('Изменение таб.номера','Введите таб.номер',StringGrid1.Cells[0,StringGrid1.Row]);
     S:=Trim(S);
     if not IsNumericString(S) then
        begin
             ShowMessage('Ножно ввести число. А у Вас '+S);
             Exit;
        end;
     if Length(S)=0 then
        begin
             ShowMessage('Т.н. - не введен.');
             Exit;
        end;
     Val(s,iVal,Icode);
     if ICode<>0 then
        begin
             ShowMessage('Неверное число');
             Exit;
        end;
     if ((iVal<1) or (iVal>20000)) then
        begin
             ShowMessage('Неверное число '+IntToStr(iVal));
             Exit;
        end;
     Tabno:=iVal;
     if Assigned(Curr_Person) then
        begin
             StringGrid1.Cells[0,StringGrid1.Row]:=IntToStr(Tabno);
             StringGrid1.Repaint;
             Application.ProcessMessages;
             Curr_Person^.Tabno:=Tabno;
        end;


end;


procedure TFormKadry.btSearchDolgClick(Sender: TObject);
 var i:Integer;
begin
     Application.CreateForm(TFormSearchDolg,FormSearchDolg);
     if FormSearchDolg.ShowModal=mrOk then
        begin
             i:=NameDolgList.GetNomerByShifr(selectedInteger);
             if i>0 then
                begin
                     ComboBoxDol.ItemIndex:=i-1;
                     ComboBoxDolChange(Sender);
                     Application.ProcessMessages;
                end;


        end;
end;
procedure TFormKadry.BitBtnDogPodSowmClick(Sender: TObject);
 var Stmnt:string;
     v:variant;
     cnt:integer;
     selectedId:integer;
     selectedTema:string;
begin
     if not isSVDN then
        Exit;
     Stmnt:='select count(*) from tb_dogovora_gn_det where tabno='+intToStr(curr_person^.tabno);
     v:=SQLQueryValue(Stmnt);
     cnt:=0;
     if not VarIsNull(v) then
     if VarIsNumeric(v) then
        cnt:=v;
     if (v<1) then
        begin
             ShowMessage('Для этого сотрудника на введена информация по договорам поряда');
             Exit;
        end;
     FormSelDogPodSowm:=TFormSelDogPodSowm.init(Self,Curr_Person^.TABNO,trim(curr_person^.fio));
     if (FormSelDogPodSowm.ShowModal=mrOk) then
        begin
             selectedId:=FormSelDogPodSowm.selectedId;
             if selectedId>0 then
             selectedTema:=trim(FormSelDogPodSowm.selectedTema);
             if selectedId>0 then
                MAKE_IDDOGPODFORSOWM_PERSON(curr_person,selectedId);
//             if (length(selectedTema)<=10)
//              and (length(selectedTema)>2) then
//                begin
//                     ComboBoxTemy.Text:=selectedtema;
//                     curr_person^.N_TEMY:=ComboBoxTemy.Text;
//                end;
             Application.ProcessMessages;

        end;
     FormSelDogPodSowm.Free;
end;

end.
