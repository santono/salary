unit UFormOtpBsMoveAbo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid,
  StdCtrls, Buttons, dxDBTLCl, dxGrClms, ActnList, ImgList, ComCtrls,
  ToolWin;

type
  TFormOtpBsMoveAbo = class(TForm)
    cdsListAbo: TClientDataSet;
    dsoListAbo: TDataSource;
    cdsListAbocodePerson: TStringField;
    cdsListAboshifrfPod: TIntegerField;
    cdsListAbodolg: TStringField;
    cdsListAboshifrWR: TIntegerField;
    cdsListAbooklad: TFloatField;
    cdsListAbokoef: TFloatField;
    cdsListAbontemy: TStringField;
    cdsListAbosel: TIntegerField;
    cdsListAbonamewr: TStringField;
    cdsListAbonamePod: TStringField;
    dxDBGrid: TdxDBGrid;
    cdsListAbolineno: TIntegerField;
    dxDBGridcodePerson: TdxDBGridMaskColumn;
    dxDBGridshifrfPod: TdxDBGridMaskColumn;
    dxDBGriddolg: TdxDBGridMaskColumn;
    dxDBGridshifrWR: TdxDBGridMaskColumn;
    dxDBGridoklad: TdxDBGridMaskColumn;
    dxDBGridkoef: TdxDBGridMaskColumn;
    dxDBGridntemy: TdxDBGridMaskColumn;
    dxDBGridsel: TdxDBGridMaskColumn;
    dxDBGridnamewr: TdxDBGridColumn;
    dxDBGridnamePod: TdxDBGridMaskColumn;
    dxDBGridlineno: TdxDBGridMaskColumn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dxDBGridColumnChk: TdxDBGridCheckColumn;
    il1: TImageList;
    ActionList1: TActionList;
    ActionMoveOtpBS: TAction;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    procedure cdsListAboCalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionMoveOtpBSExecute(Sender: TObject);
  private
    wantedTabno:Integer;
    wantedFIO:string;
    procedure fillcdsListAbo;
    procedure moveMarkedToSalary;
    { Private declarations }
  public
     constructor createAbo(AOwner: TComponent;wantedTabno:integer);
    { Public declarations }
  end;

var
  FormOtpBsMoveAbo: TFormOtpBsMoveAbo;

implementation
  USes ScrDef,scrutil,scrLists,scrio,UFormOtpBSListAbo;

{$R *.dfm}
constructor TFormOtpBsMoveAbo.createAbo(AOwner: TComponent;wantedTabno:integer);
 var y,m:Integer;
 begin
     inherited Create(AOwner);
     self.wantedtabno:=wantedtabno;
     if isSVDN then
        Self.wantedFIO:=GetFullUkrFioPerson(Self.wantedTabno)
     else
        Self.wantedFIO:=GetFullRusFioPerson(Self.wantedTabno);
     if isSVDN then
        caption:='Перенiс вiдпустки без оплати в зарплату '+IntToStr(wantedTabno)+' '+trim(Self.wantedFIO)
     else
        caption:='Перенос отпуска без оплаты в зарплату '+IntToStr(wantedTabno)+' '+trim(Self.wantedFIO);
     y:=FormOtpBSListAbo.dsOtpBSY.Value;
     m:=FormOtpBSListAbo.dsOtpBSM.Value;
     if not ((y=CURRYEAR) and (m=NMES)) then
        ActionMoveOtpBS.Enabled:=False;
     fillcdsListAbo;
 end;

procedure TFormOtpBsMoveAbo.cdsListAboCalcFields(DataSet: TDataSet);
begin
     if cdsListAboshifrWR.Value=1 then
        cdsListAbonamewr.Value:='Осн'
     else
        cdsListAbonamewr.Value:='Совм';
end;

procedure TFormOtpBsMoveAbo.fillcdsListAbo;
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
    Curr_person : person_ptr;
    lineno    : Integer;
 procedure putRecordToCds;
 begin
    inc(lineno);
    cdsListAbo.Append;
    cdsListAbocodePerson.Value:=GetGUIDPersonToString(curr_p);
    cdsListAbodolg.Value:=Trim(curr_p^.dolg);
    cdsListAboshifrfPod.Value:=nsrv;
//    cdsListAboshifrfPod.Value:=999;

    if IS_OSN_WID_RABOTY(curr_p) then
       cdsListAboshifrWr.value:=1
    else
       cdsListAboshifrWr.value:=2;
    cdsListAbonamePod.value:=name_serv(nsrv);
    cdsListAbokoef.value:=GET_KOEF_OKLAD_PERSON(curr_p);
    cdsListAbooklad.Value:=curr_p^.OKLAD;
    cdsListAbontemy.Value:=Trim(curr_p^.N_TEMY);
    cdsListAbosel.Value:=0;
    cdsListAbolineno.Value:=lineno;
    cdsListAbo.Post;

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
                 putRecordToCds;
              Curr_P:=Curr_P^.NEXT;
         end;
       if (Sav_Nsrv<>NSRV) then
          begin
               EMPTY_ALL_PERSON;
               Select(1);
               Nsrv := Sav_Nsrv;
               MKFLNM;
          end;
  end;
 function isIncds(wantedShifrPod:integer):Boolean;
  var finded:Boolean;
  begin
       finded:=false;
       cdsListAbo.First;
       while not cdsListAbo.Eof do
        begin
             if cdsListAboshifrfPod.value=wantedShifrPod then
                begin
                     finded:=True;
                     Break;
                end;
             cdsListAbo.Next;
        end;
       isIncds:=Finded;
  end;
begin
  // 1 Найти осное место работы в текущем подразделении
    curr_person:=nil;
    finded:=false;
    curr_person:=head_person;
    while (Curr_person<>nil) do
      begin
           if curr_person^.TABNO=wantedTabno then
           if IS_OSN_WID_RABOTY(curr_person) then
              begin
                   finded:=True;
                   Break;
              end;
           Curr_person:=curr_person^.NEXT;
      end;
    if not finded then
       begin
            showMessage('Не найдено основное место работы сотрудника '+IntToStr(wantedTabno)+Trim(wantedFio));
            Exit;
       end;
    i:=Count_Sowm(Curr_Person);
    Curr_Sowm := Curr_Person^.Sowm;
    lineno:=1;
    while (Curr_Sowm<>Nil) do
      begin
           if not isIncds(Curr_Sowm^.WHERE) then
              Print_Serv;
           Curr_Sowm := Curr_Sowm^.NEXT;
      end;
    lineno:=1;
    cdsListAbo.Insert;
    cdsListAbocodePerson.Value:=GetGUIDPersonToString(curr_person);
    cdsListAbodolg.Value:=Trim(curr_person^.dolg);
    cdsListAboshifrfPod.Value:=nsrv;
//    cdsListAboshifrfPod.Value:=999;
    cdsListAboshifrWr.value:=1;
    cdsListAbonamePod.value:=name_serv(nsrv);
    cdsListAbokoef.value:=GET_KOEF_OKLAD_PERSON(curr_person);
    cdsListAbooklad.Value:=curr_person^.OKLAD;
    cdsListAbontemy.Value:=Trim(curr_person^.N_TEMY);
    cdsListAbosel.Value:=0;
    cdsListAbolineno.Value:=lineno;
    cdsListAbo.Post;
end;

procedure TFormOtpBsMoveAbo.moveMarkedToSalary;
var  SavePlace : TBookmark;
     v,v0      : Variant;
     Node      : TdxTreeListNode;
     GUID      : string;
     shifrIdObo:Integer;
     DateFrObo,DateToObo:TDateTime;
     tabno     : Integer;
     shifrPod  : Integer;
     moved     : Boolean;
   begin
        Node:=dxDBGrid.TopNode;
        moved:=False;
        while Node<>nil do
          begin
               v0:=Node.Values[3];
               if VarIsNumeric(v0) then
               if v0=1 then
                  begin
                       moved:=True;
                       v:=Node.Values[0];
                       GUID:=v;
                       v:=Node.Values[1];
                       shifrPod:=v;
                       ShifrIdObo:=FormOtpBSListAbo.dsOtpBSSHIFRID.Value;
                       DateFrObo:=FormOtpBSListAbo.dsOtpBSDATEFR.Value;
                       DateToObo:=FormOtpBSListAbo.dsOtpBSDATETO.Value;
                       tabno:=Self.wantedTabno;
                       RecalcPersonForObo(ShifrIdObo, //ShifrIdObo : integer ;
                               DateFrObo,
                               DateToObo,
                               GUID,
                               Tabno,
                               ShifrPod);

                  end;
               node:=Node.GetNext;
          end;
        if not moved then
           begin
                ShowMessage('Нет отмеченных строк для перноса');
           end;
   end;


procedure TFormOtpBsMoveAbo.BitBtn1Click(Sender: TObject);
   begin
     BitBtn1.Enabled:=False;
     moveMarkedToSalary;
     BitBtn1.Enabled:=true;
   end;



procedure TFormOtpBsMoveAbo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormOtpBsMoveAbo.ActionMoveOtpBSExecute(Sender: TObject);
begin
     Self.moveMarkedToSalary;
end;

end.
