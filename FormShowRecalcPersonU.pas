{$WARNINGS OFF}
{$HINTS OFF}
unit FormShowRecalcPersonU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ScrDef, Menus, frxClass;

type
  TFormShowRecalcPerson = class(TForm)
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PageControl1: TPageControl;
    TabSheetPod: TTabSheet;
    TabSheetPens: TTabSheet;
    TabSheetSS: TTabSheet;
    TabSheetFZ: TTabSheet;
    TreeViewPod: TTreeView;
    TreeViewPens: TTreeView;
    TreeViewSS: TTreeView;
    TreeViewFZ: TTreeView;
    N2: TMenuItem;
    frxReport1: TfrxReport;
    TabSheetECB: TTabSheet;
    TabSheetECBN: TTabSheet;
    TabSheetECBDP: TTabSheet;
    TabSheetECBIll: TTabSheet;
    TreeViewECB: TTreeView;
    TreeViewECBN: TTreeView;
    TreeViewECBDP: TTreeView;
    TreeViewECBIll: TTreeView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FillTree(Tabno:integer;
                      FIO:String;Wanted_Year,
                      Wanted_Month:integer;
                      Mode:integer;
                      TreeView:TTreeView);

    procedure N1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure N2Click(Sender: TObject);
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure frxReport1ManualBuild(Page: TfrxPage);

  private
    { Private declarations }
  public
    Tabno : integer;
    Fio   : string;
    Y     : integer;
    M     : integer;
    { Public declarations }
  end;

var
  FormShowRecalcPerson: TFormShowRecalcPerson;

implementation
  uses UFIBModule,ScrUtil;

{$R *.dfm}

type
   PAddRec = ^TAddRec;
   TAddRec = record
     Shifr      : integer;
     Name       : string;
     Summa      : real;
     Period     : integer;
     Vyplacheno : integer;
     Y          : integer;
     Fond       : integer;
   end;
   PUdRec = ^TUdRec;
   TUdRec = record
     Shifr      : integer;
     Name       : string;
     Summa      : real;
     Period     : integer;
     Vyplacheno : integer;
     Y          : integer;
     Fond       : integer;
   end;
   PPersonRec = ^TPersonRec;
   TPersonRec = record
     Tabno      : integer;
     FIO        : string;
     Dolg       : string;
     ShifrKat   : integer;
     KatName    : string;
     ShifrGru   : integer;
     GruName    : string;
     Koef       : real;
     W_R        : integer;
     W_R_Name   : string;
     W_Place    : integer;
     W_P_Name   : string;
     Y          : integer;
     M          : integer;
     SummaAdd   : real;
     SummaUd    : real;
   end;
   PPersonMainRec = ^TPersonMainRec;
   TPersonMainRec = record
     Tabno      : integer;
     FIO        : string;
     Y          : integer;
     M          : integer;
     SummaAdd   : real;
     SummaUdF   : real;
     SummaUdR   : real;
     SummaUdN   : real;
   end;

procedure TFormShowRecalcPerson.FormClose(Sender: TObject;
  var Action: TCloseAction);

procedure FreeNodes(TreeView:TTreeView);
  var CurItem : TTreeNode;
  procedure FreeNode(TreeNode:TTreeNode);
    var
      CurrItem : TTreeNode;
      Child   : TTreeNode;
    begin
       if TreeNode=Nil then
          Exit;
       CurrItem := TreeNode;
       while CurrItem <> nil do
        begin
           Child:=CurrItem.getFirstChild;
           if Child<>Nil then
               FreeNode(Child);
           Dispose(CurrItem.Data);
           CurrItem := CurrItem.GetNextSibling;
         end;
    end;
begin
  CurItem := TreeView.Items.GetFirstNode;
  FreeNode(CurItem);
end;
begin
      FreeNodes(TreeViewPod);
      if Assigned(TreeViewPens) then
         FreeNodes(TreeViewPens);
      if Assigned(TreeViewFZ) then
         FreeNodes(TreeViewFZ);
      if Assigned(TreeViewSS) then
         FreeNodes(TreeViewSS);
      FreeNodes(TreeViewECB);
      FreeNodes(TreeViewECBN);
      FreeNodes(TreeViewECBDP);
      FreeNodes(TreeViewECBIll);
      TreeViewPod.Free;
      if Assigned(TreeViewPens) then
         TreeViewPens.Free;
      if Assigned(TreeViewFZ) then
         TreeViewFZ.Free;
      if Assigned(TreeViewSS) then
         TreeViewSS.Free;
      TreeViewECB.Free;
      TreeViewECBN.Free;
      TreeViewECBDP.Free;
      TreeViewECBIll.Free;
      Action:=caFree;
end;
procedure TFormShowRecalcPerson.FillTree(Tabno:integer;
                                         FIO:string;
                                         Wanted_Year,
                                         Wanted_Month:integer;
                                         Mode:integer;
                                         TreeView:TTreeView);
var
   RecPersonMainPtr : PPersonMainRec;
   PersonRec        : PPersonRec;
   AddRec           : PAddRec;
   UdRec            : PUdRec;
   CurrTreeNode,TreeNode,AddTreeNode,UdTreeNode : TTreeNode;
   SQL              : string;
   ShifrId          : integer;
function FormatMainStr:string;
   begin
        Result:=Format('%4d %20s %12.2f %12.2f %12.2f %12.2f',[Tabno,FIO,
           FIB.pFIBQuery.FieldByName('SummaAdd').AsFloat,
           FIB.pFIBQuery.FieldByName('SummaUdF').AsFloat,
           FIB.pFIBQuery.FieldByName('SummaUdR').AsFloat,
           FIB.pFIBQuery.FieldByName('SummaUdN').AsFloat]);
   end;
function FormatCurrPersonStr:string;
   begin
        Result:=Format('%4d %2d %10s %4.2f %5s %10s %10s %12.2f %12.2f %30s',[
           FIB.pFIBQuery.FieldByName('yearvy').Asinteger,
           FIB.pFIBQuery.FieldByName('monthvy').Asinteger,
           FIB.pFIBQuery.FieldByName('Dolg').AsString,
           FIB.pFIBQuery.FieldByName('Koef').AsFloat,
           FIB.pFIBQuery.FieldByName('w_r_name').AsString,
           FIB.pFIBQuery.FieldByName('katname').AsString,
           FIB.pFIBQuery.FieldByName('gruname').AsString,
           FIB.pFIBQuery.FieldByName('summaadd').AsFloat,
           FIB.pFIBQuery.FieldByName('summaud').AsFloat,
           FIB.pFIBQuery.FieldByName('w_p_name').AsString]);
   end;
function FormatAddStr:string;
   begin
        Result:=Format('%3d %23s %12.2f',[
           FIB.pFIBQuerySecond.FieldByName('shifrsta').Asinteger,
           FIB.pFIBQuerySecond.FieldByName('namesta').AsString,
           FIB.pFIBQuerySecond.FieldByName('Summa').AsFloat]);
   end;
 begin
      if TreeView.Items.Count>0 then
         TreeView.Items.Free;
      New(RecPersonMainPtr);
      RecPersonMainPtr^.Tabno := Tabno;
      RecPersonMainPtr^.FIO   := FIO;
      RecPersonMainPtr^.Y     := Wanted_Year;
      RecPersonMainPtr^.M     := Wanted_Month;
      SQL:='select first 1 summaadd,summaudf,summaudr,summaudn from PR_ROOT_CHAIN_PERSON('+IntToStr(TABNO)+','+IntToStr(Wanted_Year)+','+IntToStr(Wanted_Month)+','+IntToStr(Mode)+')';
      if FIB.pFIBQuery.Transaction.Active then
         FIB.pFIBQuery.Transaction.COMMIT;
      FIB.pFIBQuery.Transaction.StartTransaction;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add(SQL);
      try
         FIB.pFIBQuery.ExecQuery;
         new(RecPersonMainPtr);
         RecPersonMainPtr^.Tabno    := TABNO;
         RecPersonMainPtr^.FIO      := FIO;
         RecPersonMainPtr^.SummaAdd := FIB.pFIBQuery.FieldByName('SummaAdd').AsFloat;
         RecPersonMainPtr^.SummaUdF := FIB.pFIBQuery.FieldByName('SummaUdF').AsFloat;
         RecPersonMainPtr^.SummaUdR := FIB.pFIBQuery.FieldByName('SummaUdR').AsFloat;
         RecPersonMainPtr^.SummaUdN := FIB.pFIBQuery.FieldByName('SummaUdN').AsFloat;
         RecPersonMainPtr^.Y        := Wanted_Year;
         RecPersonMainPtr^.M        := Wanted_Month;
         CurrTreeNode:=TreeView.Items.AddObject(nil,FormatMainStr,RecPersonMainPtr);
      except
         CurrTreeNode:=TreeView.Items.AddObject(nil,'Ошибка SQL '+SQL,RecPersonMainPtr);
         FIB.pFIBQuery.Transaction.RollBack;
         Exit;
      end;
      FIB.pFIBQuery.Transaction.COMMIT;
      SQL:= 'select shifridperson,dolg,shifrkat,katname,shifrgru,gruname,koef,w_r,w_r_name,w_place,w_p_name,summaadd,summaud,yearvy,monthvy from PR_PERSON_CHAIN_REC('+IntToStr(TABNO)+','+IntToStr(Wanted_Year)+','+IntToStr(Wanted_Month)+','+IntToStr(Mode)+')';
      FIB.pFIBQuery.Transaction.StartTransaction;
      FIB.pFIBQuery.SQL.Clear;
      FIB.pFIBQuery.SQL.Add(SQL);
      try
         FIB.pFIBQuery.ExecQuery;
         while not FIB.pFIBQuery.Eof do
           begin
                New(PersonRec);
                PersonRec^.Tabno      := RecPersonMainPtr^.Tabno;
                PersonRec^.FIO        := RecPersonMainPtr^.FIO;
                PersonRec^.Dolg       := FIB.pFIBQuery.FieldByName('Dolg').AsString;
                PersonRec^.ShifrKat   := FIB.pFIBQuery.FieldByName('ShifrKat').Asinteger;
                PersonRec^.KatName    := FIB.pFIBQuery.FieldByName('KatName').AsString;
                PersonRec^.ShifrGru   := FIB.pFIBQuery.FieldByName('ShifrGru').Asinteger;
                PersonRec^.GruName    := FIB.pFIBQuery.FieldByName('GruName').AsString;
                PersonRec^.Koef       := FIB.pFIBQuery.FieldByName('Koef').AsFloat;
                PersonRec^.W_R        := FIB.pFIBQuery.FieldByName('W_R').AsInteger;
                PersonRec^.W_R_Name   := FIB.pFIBQuery.FieldByName('W_R_Name').AsString;
                PersonRec^.W_Place    := FIB.pFIBQuery.FieldByName('W_Place').AsInteger;
                PersonRec^.W_P_Name   := FIB.pFIBQuery.FieldByName('W_P_Name').AsString;
                PersonRec^.Y          := FIB.pFIBQuery.FieldByName('YearVy').AsInteger;
                PersonRec^.M          := FIB.pFIBQuery.FieldByName('MonthVy').AsInteger;
                PersonRec^.SummaAdd   := FIB.pFIBQuery.FieldByName('SummaAdd').AsFloat;
                PersonRec^.SummaUd    := FIB.pFIBQuery.FieldByName('SummaUd').AsFloat;

                TreeNode:=TreeView.Items.AddChildObject(CurrTreeNode,FormatCurrPersonStr,PersonRec);
                ShifrId:=FIB.pFIBQuery.FieldByName('ShifrIdPerson').Asinteger;
                AddTreeNode:=TreeView.Items.AddChild(TreeNode,'Начислено');
                UdTreeNode:=TreeView.Items.AddChild(TreeNode,'Удержано');
                if FIB.pFIBQuerySecond.Open then
                   FIB.pFIBQuerySecond.Close;
                if not FIB.pFIBQuerySecond.Transaction.Active then
                   FIB.pFIBQuerySecond.Transaction.StartTransaction;
                SQL:='select shifrsta,namesta,summa from PR_PERSON_CHAIN_ADD_REC('+IntToStr(ShifrId)+','+IntToStr(Wanted_Year)+','+IntToStr(Wanted_Month)+','+IntToStr(Mode)+')';
                FIB.pFIBQuerySecond.SQL.Clear;
                FIB.pFIBQuerySecond.SQL.Add(SQL);
                try
                   FIB.pFIBQuerySecond.ExecQuery;
                   while not FIB.pFIBQuerySecond.EOF do
                     begin
                          New(AddRec);
                          AddRec^.Shifr  := FIB.pFIBQuerySecond.FieldByName('ShifrSta').asInteger;
                          AddRec^.Name   := FIB.pFIBQuerySecond.FieldByName('NameSta').asString;
                          AddRec^.Summa  := FIB.pFIBQuerySecond.FieldByName('Summa').asFloat;
                          AddRec^.Period := 0;
                          AddRec^.Vyplacheno:= 0;
                          AddRec^.Y      :=   0;
                          AddRec^.Fond   :=   0;
                          TreeView.Items.AddChildObject(AddTreeNode,FormatAddStr,AddRec);
                          FIB.pFIBQuerySecond.Next;
                     end;
                except
                end;
                FIB.pFIBQuerySecond.Close;
                SQL:='select shifrsta,namesta,summa from PR_PERSON_CHAIN_UD_REC('+IntToStr(ShifrId)+','+IntToStr(Wanted_Year)+','+IntToStr(Wanted_Month)+','+IntToStr(Mode)+')';
                FIB.pFIBQuerySecond.SQL.Clear;
                FIB.pFIBQuerySecond.SQL.Add(SQL);
                try
                   FIB.pFIBQuerySecond.ExecQuery;
                   while not FIB.pFIBQuerySecond.EOF do
                     begin
                          New(UdRec);
                          UdRec^.Shifr  := FIB.pFIBQuerySecond.FieldByName('ShifrSta').asInteger;
                          UdRec^.Name   := FIB.pFIBQuerySecond.FieldByName('NameSta').asString;
                          UdRec^.Summa  := FIB.pFIBQuerySecond.FieldByName('Summa').asFloat;
                          UdRec^.Period := 0;
                          UdRec^.Vyplacheno:= 0;
                          UdRec^.Y      :=   0;
                          TreeView.Items.AddChildObject(UdTreeNode,FormatAddStr,UdRec);
                          FIB.pFIBQuerySecond.Next;
                     end;
                except
                end;
                FIB.pFIBQuerySecond.Close;

                FIB.pFIBQuery.Next;
           end;
      except

      end;
      FIB.pFIBQuery.Transaction.Commit;
{
      with TreeViewPerson do
      begin
         if Items.Count = 0 then
            Items.AddObject(nil, 'Item' + IntToStr(TreeViewIndex), MyRecPtr)
         else if (TreeViewIndex < Items.Count) and (TreeViewIndex >= 0) then
              Items.AddObject(Items[TreeViewIndex], 'Item' + IntToStr(TreeViewIndex), MyRecPtr);
      end;
}
 end;


procedure TFormShowRecalcPerson.N1Click(Sender: TObject);
begin
     FillTree(Tabno,FIO,Y,M,0,TreeViewPod);
//     FillTree(Tabno,FIO,Y,M,1,TreeViewFZ);
//     FillTree(Tabno,FIO,Y,M,2,TreeViewSS);
//     FillTree(Tabno,FIO,Y,M,3,TreeViewPens);
     FillTree(Tabno,FIO,Y,M,4,TreeViewECB);
     FillTree(Tabno,FIO,Y,M,5,TreeViewECBN);
     FillTree(Tabno,FIO,Y,M,6,TreeViewECBDP);
     FillTree(Tabno,FIO,Y,M,7,TreeViewECBIll);
     PageControl1.ActivePageIndex:=0;
     Application.ProcessMessages;
end;

procedure TFormShowRecalcPerson.FormShow(Sender: TObject);
begin
      N1Click(Sender);
      Caption:='Перерасчет налогов за '+Trim(GetMonthRus(M))+' '+IntToStr(Y)+' г.';
end;

procedure TFormShowRecalcPerson.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName, 'FIO') = 0 then
        Value := Trim(FIO)
     else
     if CompareText(VarName, 'TABNO') = 0 then
        Value := Trim(IntToStr(Tabno))
     else
     if CompareText(VarName, 'YearVy') = 0 then
        Value := Trim(IntToStr(Y))
     else
     if CompareText(VarName, 'MonthVy') = 0 then
        Value := Trim(GetMonthRus(M));

end;

procedure TFormShowRecalcPerson.N2Click(Sender: TObject);
begin
     if Tabno>0               then
     if length(trim(FIO))>0   then
     if (Y>1990) and (Y<2100) then
     if (m>0) and (m<13)      then
        frxReport1.ShowReport;
end;

procedure TFormShowRecalcPerson.frxReport1BeforePrint(
  Sender: TfrxReportComponent);
begin
      if (Sender.Name='Header') then
         begin
               case PageControl1.ActivePageIndex of
                1 : frxReport1.Variables['HatLine']:=''''+
                       'Перерасчет пенсионного налога за '+trim(GetMonthRus(M))+
                       ' '+IntToStr(Y)+' г.'+'''';
                2 : frxReport1.Variables['HatLine']:=''''+
                       'Перерасчет соц.страха за '+trim(GetMonthRus(M))+
                       ' '+IntToStr(Y)+' г.'+'''';
                3 : frxReport1.Variables['HatLine']:=''''+
                       'Перерасчет фонда занятости за '+trim(GetMonthRus(M))+
                       ' '+IntToStr(Y)+' г.'+'''';
                else
                    frxReport1.Variables['HatLine']:=''''+
                       'Перерасчет подоходного налога за '+trim(GetMonthRus(M))+
                       ' '+IntToStr(Y)+' г.'+'''';
               end;        
               frxReport1.Variables['FIO']:=''''+IntToStr(Tabno)+' '+
               Trim(FIO)+'''';

         end;
end;

procedure TFormShowRecalcPerson.frxReport1ManualBuild(Page: TfrxPage);
 var S:String;
     Band1: TfrxMasterData;
   procedure PrintLines(TreeView:TTreeView);
     var CurItem : TTreeNode;
     procedure PrintNode(TreeNode:TTreeNode);
      var
        CurrItem : TTreeNode;
        Child    : TTreeNode;
        I        : integer;
      begin
         if TreeNode=Nil then
            Exit;
         CurrItem := TreeNode;
         while CurrItem <> nil do
          begin
             S:=CurrItem.Text;
//             i:=pos('Кафедра',S);
//             if i>0 then
//               ShowMessage('I='+IntToStr(I));
             if ((pos('Начислено',S)=0) and (pos('Удержано',S)=0)) then
                begin
                     frxReport1.Variables['DetF']:=''''+S+'''';
                     frxReport1.Engine.ShowBand(Band1);
                     if Length(Trim(S))>81 then
                        begin
                             frxReport1.Variables['DetF']:=''''+copy(S,82,Length(S)-81)+'''';
                             frxReport1.Engine.ShowBand(Band1);
                        end;
                end;
             Child:=CurrItem.getFirstChild;
             if Child<>Nil then
                 PrintNode(Child);
             CurrItem := CurrItem.GetNextSibling;
         end;
      end;
   begin
      CurItem := TreeView.Items.GetFirstNode;
      S:=CurItem.Text;
    //  frxReport1.Variables['DetF']:=''''+S+'''';
    //  frxReport1.Engine.ShowBand(Band1);
      PrintNode(CurItem);
   end;

begin
     Band1 := frxReport1.FindObject('MasterData1') as TfrxMasterData;
     case PageControl1.ActivePageIndex of
       1 : PrintLines(TreeViewPens);
       2 : PrintLines(TreeViewSS);
       3 : PrintLines(TreeViewFZ);
       else
         PrintLines(TreeViewPod);
     end;
end;

end.
