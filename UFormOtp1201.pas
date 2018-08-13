{$WARNINGS OFF}
{$HINTS OFF}
unit UFormOtp1201;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, DBCtrls,
  dxDBTLCl, dxGrClms, StdCtrls, Menus, ComCtrls, Buttons, dxEditor, dxEdLib;

type
  TFormOtp1201 = class(TForm)
    pFIBDataSetOtp1201: TpFIBDataSet;
    pFIBTransactionOtp1201Wrire: TpFIBTransaction;
    pFIBTransactionOtp1201Read: TpFIBTransaction;
    DataSourceOtp1201: TDataSource;
    dxDBGridOtp1201: TdxDBGrid;
    pFIBDataSetOtp1201TABNO: TFIBIntegerField;
    pFIBDataSetOtp1201FIO: TFIBStringField;
    pFIBDataSetOtp1201SELECTED: TFIBIntegerField;
    dxDBGridOtp1201TABNO: TdxDBGridMaskColumn;
    dxDBGridOtp1201FIO: TdxDBGridMaskColumn;
    dxDBGridOtp1201SELECTED: TdxDBGridCheckColumn;
    DBNavigator1: TDBNavigator;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ProgressBar1: TProgressBar;
    pFIBDataSetOtp1201W_PLACE: TFIBIntegerField;
    pFIBDataSetOtp1201NAMEPODR: TFIBStringField;
    dxDBGridOtp1201WPlace: TdxDBGridColumn;
    dxDBGridOtp1201NamePodr: TdxDBGridColumn;
    dxCalcEditShifrPod: TdxCalcEdit;
    BitBtn1: TBitBtn;
    N2: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dxDBGridOtp1201DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOtp1201: TFormOtp1201;

implementation
  uses UFibModule,ScrDef,ScrUtil,ScrIO, UFormSelPKG, ScrLists;

{$R *.dfm}

procedure TFormOtp1201.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetOtp1201.Active then
         pFIBDataSetOtp1201.Close;
      if pFIBDataSetOtp1201.Transaction.Active then
         pFIBDataSetOtp1201.Transaction.Commit;
      if pFIBDataSetOtp1201.UpdateTransaction.Active then
         pFIBDataSetOtp1201.UpdateTransaction.Commit;
      Action:=caFree;
end;

procedure TFormOtp1201.FormCreate(Sender: TObject);
begin
      if not pFIBDataSetOtp1201.Transaction.Active then
         pFIBDataSetOtp1201.Transaction.StartTransaction;
      if not pFIBDataSetOtp1201.Active then
         pFIBDataSetOtp1201.Open;
end;


procedure TFormOtp1201.dxDBGridOtp1201DblClick(Sender: TObject);
begin
     if not pFIBDataSetOtp1201.UpdateTransaction.Active then
        pFIBDataSetOtp1201.UpdateTransaction.StartTransaction;
     pFIBDataSetOtp1201.Edit;
     if pFIBDataSetOtp1201SELECTED.Value=0 then
        pFIBDataSetOtp1201SELECTED.Value:=1
     else
        pFIBDataSetOtp1201SELECTED.Value:=0;
     pFIBDataSetOtp1201.Post;
     if pFIBDataSetOtp1201.UpdateTransaction.Active then
        pFIBDataSetOtp1201.UpdateTransaction.Commit;
     pFIBDataSetOtp1201.Refresh;
     dxDBGridOtp1201.Refresh;
     Application.ProcessMessages;
end;

procedure TFormOtp1201.N2Click(Sender: TObject);
 var i,j,nsrv_i,nsrvsav,nmessav:Integer;
     List:TList;
     PInt:PInteger;
     Curr_Person:PERSON_PTR;
     isChanged:Boolean;
     saveBookmark:TBookmark;
     SaveFilter:string;
     IsFiltered:Boolean;
     Finded : Boolean;
begin
     if (NMES<>1) then
     if (Flow_Month<>1) or (CurrYear<>2012) then
        begin
             ShowMessage('Откорректировать табель можно только в январе 2012 года');
             Exit;
        end;
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;

     if not YesNo('Откорректировать табель у отмеченных сотрудников? ') then Exit;
     Application.ProcessMessages;
     ProgressBar1.Min:=0;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Position:=0;
     saveBookmark:=pFIBDataSetOtp1201.GetBookmark;
     isFiltered:=pFIBDataSetOtp1201.Filtered;
     SaveFilter:=pFIBDataSetOtp1201.Filter;
     List:=TList.Create;
     pFIBDataSetOtp1201.First;
     while (not pFIBDataSetOtp1201.EOF) do
      begin
           Finded:=False;
           if List.Count>0 then
              for i:=0 to List.Count-1 do
                  if (pFIBDataSetOtp1201TABNO.Value=PInteger(List.Items[i])^) then
                     begin
                          Finded:=True;
                          Break;
                     end;
           if not Finded then
           if pFIBDataSetOtp1201SELECTED.Value=1 then
              begin
                   New(PInt);
                   PInt^:=pFIBDataSetOtp1201TABNO.Value;
                   List.Add(PInt);
              end;
           pFIBDataSetOtp1201.Next;
      end;
     if IsFiltered then
        begin
             pFIBDataSetOtp1201.Filter:=SaveFilter;
             pFIBDataSetOtp1201.Filtered:=isFiltered;
             pFIBDataSetOtp1201.Refresh;
        end;
     pFIBDataSetOtp1201.GotoBookmark(saveBookmark);
     pFIBDataSetOtp1201.FreeBookmark(saveBookmark);
     if List.Count=0 then
        begin
             List.Free;
             ShowMessage('Нет отмеченных сотрудников');
             Exit;
        end;
     nsrvsav:=NSRV;
     nmessav:=NMES;
     putinf;
     while(Head_Person<>Nil) do DEL_PERSON(head_person);
     for nsrv_i:=1 to Count_Serv do
         begin
              nsrv:=nsrv_i;
              ProgressBar1.Position:=nsrv_i;
              Application.ProcessMessages;
              if not NameServList.IsSelected(NSRV) then continue;
              mkflnm;
              if not FILEEXIST(FNINF) then continue;
              GETINF(true);
              Curr_Person:=HEAD_PERSON;
              isChanged:=False;
              while (Curr_Person<>Nil) do
               begin
                    if Curr_Person^.tabno=1356 then
                       Curr_Person^.tabno:=1356;
                    for i:=0 to List.count-1 do
                        if PInteger(List.Items[i])^=Curr_Person^.TABNO then
                           begin
                                for j:=3 to 13 do
                                    if Curr_Person^.TABEL[j]=jawka then
                                       Curr_Person^.TABEL[j]:=OTPUSK_BEZ_OPLATY;
                                isChanged:=true;
                                Break;
                           end;
                    Curr_Person:=Curr_Person^.NEXT;
               end;
              if isChanged then PUTINF;
              while(Head_Person<>Nil) do DEL_PERSON(head_person);
         end;
     if List.Count>0 then
        for i:=0 to List.Count-1 do
            Dispose(PInteger(List.Items[i]));
     List.Free;
     nsrv:=NSRVsav;
     nmes:=NMESsav;
     MKFLNM;
     getInf(true);

end;

procedure TFormOtp1201.BitBtn1Click(Sender: TObject);
 var ShifrPod,i:Integer;
     s:string;
begin
     if Length(Trim(dxCalcEditShifrPod.Text))=0 then
        ShifrPod:=0
     else
        begin
             Val(Trim(dxCalcEditShifrPod.Text),ShifrPod,i);
             if i<>0 then ShifrPod:=0;
        end;
     if ShifrPod=0 then
        begin
             pFIBDataSetOtp1201.Filtered:=False;
             pFIBDataSetOtp1201.Filter:='';
        end
     else
        begin
             s:='w_place='+IntToStr(ShifrPod);
             pFIBDataSetOtp1201.Filter:=s;
             pFIBDataSetOtp1201.Filtered:=true;
        end;
     pFIBDataSetOtp1201.Refresh;
     dxDBGridOtp1201.Refresh;
     Application.ProcessMessages;

end;

procedure TFormOtp1201.N1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

end.
