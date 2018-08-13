unit UFormTestRazr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, frxClass, frxDBSet, DB, DBClient,
  dxCntner, dxEditor, dxExEdtr, dxEdLib;

type
  TFormTestRazr = class(TForm)
    pb1: TProgressBar;
    lbl1: TLabel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    dsTest: TClientDataSet;
    dsTestshifrPod: TIntegerField;
    dsTesttabno: TIntegerField;
    dsTestfio: TStringField;
    frxrprt1: TfrxReport;
    frxDBDataset2: TfrxDBDataset;
    dsTestDolg: TStringField;
    dsTestDolgPerson: TStringField;
    dsTestRazrNeed: TIntegerField;
    dsTestRazrFakt: TIntegerField;
    dsTestdolgCode: TIntegerField;
    cbMode: TCheckBox;
    dxCalcDolgCode: TdxCalcEdit;
    dxCalcRazr: TdxCalcEdit;
    LabelDolgCode: TLabel;
    LabelRazr: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure frxrprt1GetValue(const VarName: String; var Value: Variant);
    procedure FormCreate(Sender: TObject);
    procedure cbModeClick(Sender: TObject);
  private
    { Private declarations }
      wantedDolgCode:Integer;
      wantedRazr:Integer;
      checkMode:Integer; {0 все должности 1 заданная}
      isErr: Boolean;
      procedure makeTesting;
      procedure testPodr;
      procedure hideAuxFields;
      procedure showAuxFields;
  public
    { Public declarations }
  end;

var
  FormTestRazr: TFormTestRazr;

implementation
  uses ScrDef,ScrUtil,scrio,UFibModule, FIBDatabase,ScrLists;

{$R *.dfm}

procedure TFormTestRazr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormTestRazr.testPodr;
 var
    curr_Person:PERSON_PTR;
    curr_ud:UD_PTR;
    summa:real;
    SqlStmnt:string;
    v:Variant;
    Razr,razrneed:Integer;
    shifrDol:Integer;
begin
     curr_person:=HEAD_PERSON;

     while (Curr_Person<>Nil) do
        begin
             razr:=GetRazrjadPerson(Curr_Person);
             shifrDol:=GET_DOL_CODE(curr_person);
             if checkMode=1 then
                if shifrDol<>wantedDolgCode then
                   begin
                        curr_person:=curr_Person.NEXT;
                        Continue;
                   end;
             if checkNeedDolgTest(shifrDol) then
             if shifrDol>0 then
                begin
                     if checkMode=1 then
                        razrNeed:=wantedRazr
                     else
                        razrNeed:=nameDolgList.GetRazr(shifrDol);
                     if ((razrNeed>0) and (razrNeed<26)) then
                     if Razr<>razrneed then
                        begin
                             dsTest.Append;
                             dsTestshifrPod.Value   := nsrv;
                             dsTesttabno.Value      := curr_Person^.tabno;
                             dsTestfio.Value        := trim(curr_Person^.fio);
                             dsTestDolg.Value       := Trim(nameDolgList.GetName(shifrDol));
                             dsTestDolgPerson.value := trim(Curr_Person^.dolg);
                             dsTestRazrNeed.value   := razrneed;
                             dsTestRazrFakt.Value   := Razr;
                             dsTestdolgCode.Value   := shifrDol;
                             dsTest.Post;
                             isErr:=true;
                        end
                end;
             curr_person:=curr_Person.NEXT;
        end;


end;

procedure TFormTestRazr.makeTesting;
  var tmpNMES , tmpNSRV,i_nsrv : Integer;
      Curr_Person : PERSON_PTR;
      Curr_Cn     : cn_Ptr;
      Count       : Integer;


  begin
       if cbMode.Checked then
          begin
               Val(dxCalcRazr.Text,wantedRazr,i_nsrv);
               if (i_nsrv<>0) then
                   begin
                        showMessage('Неверно указан разряд');
                        Exit;
                   end;
               if ((wantedRazr>25) or (wantedRazr<1)) then
                   begin
                        showMessage('Неверно указан разряд');
                        Exit;
                   end;
               Val(dxCalcDolgCode.Text,wantedDolgCode,i_nsrv);
               if (i_nsrv<>0) then
                   begin
                        showMessage('Неверно указан код должности');
                        Exit;
                   end;
               if ((wantedDolgCode<100) or (wantedDolgCode>1500)) then
                   begin
                        showMessage('Неверно указан код должности');
                        Exit;
                   end;
                checkMode:=1;
          end;
       tmpNMES := NMES;
       tmpNSRV := NSRV;
       putinf;
       while HEAD_PERSON<>nil do DEL_PERSON(head_person);
       pb1.Max      := Count_Serv;
       pb1.Min      := 0;
       pb1.Position := 0;
       COUNT        := 0;
       IsErr        := False;
       dsTest.Open;
       for i_nsrv:=1 to Count_Serv do
           begin
                pb1.Position := i_nsrv ;
                lbl1.Caption := Name_Serv(i_nsrv);
                Application.ProcessMessages ;
                nsrv:=i_nsrv;
                mkflnm;
                if not FileExists(fninf) then Continue;
                getinf(false);
                testPodr;
                while HEAD_PERSON<>nil do DEL_PERSON(head_person);

           end;
         if not IsErr  then
            ShowMessage('Несоответсвия не найдено')
         else
            frxrprt1.ShowReport;
  //     if Count>0 then
        //  ShowMessage('Найдено '+intToStr(Count)+' несоответствий')
   //    else
  //        ShowMessage('Не найдено ошибок ');
       dsTest.Close;
       NMES := tmpNMES;
       NSRV := tmpNSRV;
       mkflnm;
       getInf(true);

  end;


procedure TFormTestRazr.btn1Click(Sender: TObject);
begin
     makeTesting;
     Close;
end;

procedure TFormTestRazr.frxrprt1GetValue(const VarName: String;
  var Value: Variant);
begin
      if (Trim(UPPER_STRING(VarName))='MONTH') then
          Value:=GetMonthRus(NMES)
      else
      if (Trim(UPPER_STRING(VarName))='YEAR') then
          Value:=IntToStr(CURRYEAR)+' г.';
end;

procedure TFormTestRazr.hideAuxFields;
  begin
       LabelDolgCode.Visible  := False;
       LabelRazr.Visible      := false;
       dxCalcDolgCode.Visible := false;
       dxCalcRazr.Visible     := false;
       dxCalcDolgCode.Enabled := false;
       dxCalcRazr.Enabled     := false;
  end;
procedure TFormTestRazr.showAuxFields;
  begin
       LabelDolgCode.Visible  := true;
       LabelRazr.Visible      := true;
       dxCalcDolgCode.Visible := true;
       dxCalcRazr.Visible     := true;
       dxCalcDolgCode.Enabled := true;
       dxCalcRazr.Enabled     := true;
  end;
procedure TFormTestRazr.FormCreate(Sender: TObject);
begin
     lbl1.Caption   := '';
     wantedDolgCode := 0 ;
     wantedRazr     := 0 ;
     checkMode      := 0 ; {0 все должности 1 заданная}
     hideAuxFields;
end;

procedure TFormTestRazr.cbModeClick(Sender: TObject);
begin
     if cbMode.Checked then
        showAuxFields
     else
        hideAuxFields;
     Application.ProcessMessages;      
end;

end.
