unit UFormOtp1204;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ExtCtrls, DBCtrls,
  dxDBTLCl, dxGrClms, StdCtrls, Menus, ComCtrls, Buttons, dxEditor, dxEdLib;

type
  TFormOtp1204 = class(TForm)
    pFIBDataSetOtp1204: TpFIBDataSet;
    pFIBTransactionOtp1204Wrire: TpFIBTransaction;
    pFIBTransactionOtp1204Read: TpFIBTransaction;
    DataSourceOtp1204: TDataSource;
    dxDBGridOtp1204: TdxDBGrid;
    pFIBDataSetOtp1204TABNO: TFIBIntegerField;
    pFIBDataSetOtp1204FIO: TFIBStringField;
    dxDBGridOtp1204TABNO: TdxDBGridMaskColumn;
    dxDBGridOtp1204FIO: TdxDBGridMaskColumn;
    dxDBGridOtp1204APR30: TdxDBGridCheckColumn;
    DBNavigator1: TDBNavigator;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ProgressBar1: TProgressBar;
    pFIBDataSetOtp1204W_PLACE: TFIBIntegerField;
    pFIBDataSetOtp1204NAMEPODR: TFIBStringField;
    dxDBGridOtp1204WPlace: TdxDBGridColumn;
    dxDBGridOtp1204NamePodr: TdxDBGridColumn;
    dxCalcEditShifrPod: TdxCalcEdit;
    BitBtn1: TBitBtn;
    N2: TMenuItem;
    pFIBDataSetOtp1204APR30: TFIBSmallIntField;
    pFIBDataSetOtp1204MAY03: TFIBSmallIntField;
    pFIBDataSetOtp1204MAY04: TFIBSmallIntField;
    pFIBDataSetOtp1204MAY07: TFIBSmallIntField;
    pFIBDataSetOtp1204MAY08: TFIBSmallIntField;
    pFIBDataSetOtp1204MAY10: TFIBSmallIntField;
    pFIBDataSetOtp1204MAY11: TFIBSmallIntField;
    dxDBGridOtp1204May03: TdxDBGridCheckColumn;
    dxDBGridOtp1204May04: TdxDBGridCheckColumn;
    dxDBGridOtp1204May07: TdxDBGridCheckColumn;
    dxDBGridOtp1204May08: TdxDBGridCheckColumn;
    dxDBGridOtp1204May10: TdxDBGridCheckColumn;
    dxDBGridOtp1204May11: TdxDBGridCheckColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dxDBGridOtp1204DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOtp1204: TFormOtp1204;

implementation
  uses UFibModule,ScrDef,ScrUtil,ScrIO, UFormSelPKG, ScrLists;

{$R *.dfm}

procedure TFormOtp1204.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      if pFIBDataSetOtp1204.Active then
         pFIBDataSetOtp1204.Close;
      if pFIBDataSetOtp1204.Transaction.Active then
         pFIBDataSetOtp1204.Transaction.Commit;
      if pFIBDataSetOtp1204.UpdateTransaction.Active then
         pFIBDataSetOtp1204.UpdateTransaction.Commit;
      Action:=caFree;
end;

procedure TFormOtp1204.FormCreate(Sender: TObject);
begin
      if not pFIBDataSetOtp1204.Transaction.Active then
         pFIBDataSetOtp1204.Transaction.StartTransaction;
      if not pFIBDataSetOtp1204.Active then
         pFIBDataSetOtp1204.Open;
end;


procedure TFormOtp1204.dxDBGridOtp1204DblClick(Sender: TObject);
begin
     if not pFIBDataSetOtp1204.UpdateTransaction.Active then
        pFIBDataSetOtp1204.UpdateTransaction.StartTransaction;
     pFIBDataSetOtp1204.Edit;
     if pFIBDataSetOtp1204Apr30.Value=0 then
        pFIBDataSetOtp1204Apr30.Value:=1
     else
        pFIBDataSetOtp1204Apr30.Value:=0;
     pFIBDataSetOtp1204.Post;
     if pFIBDataSetOtp1204.UpdateTransaction.Active then
        pFIBDataSetOtp1204.UpdateTransaction.Commit;
     pFIBDataSetOtp1204.Refresh;
     dxDBGridOtp1204.Refresh;
     Application.ProcessMessages;
end;

procedure TFormOtp1204.N2Click(Sender: TObject);
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
     if (NMES<>4) then
     if (Flow_Month<>4) or (CurrYear<>2012) then
        begin
             ShowMessage('Откорректировать табель можно только в апреле 2012 года');
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
     saveBookmark:=pFIBDataSetOtp1204.GetBookmark;
     isFiltered:=pFIBDataSetOtp1204.Filtered;
     SaveFilter:=pFIBDataSetOtp1204.Filter;
     List:=TList.Create;
     pFIBDataSetOtp1204.First;
     while (not pFIBDataSetOtp1204.EOF) do
      begin
           Finded:=False;
           if List.Count>0 then
              for i:=0 to List.Count-1 do
                  if (pFIBDataSetOtp1204TABNO.Value=PInteger(List.Items[i])^) then
                     begin
                          Finded:=True;
                          Break;
                     end;
           if not Finded then
           if pFIBDataSetOtp1204Apr30.Value=1 then
              begin
                   New(PInt);
                   PInt^:=pFIBDataSetOtp1204TABNO.Value;
                   List.Add(PInt);
              end;
           pFIBDataSetOtp1204.Next;
      end;
     if IsFiltered then
        begin
             pFIBDataSetOtp1204.Filter:=SaveFilter;
             pFIBDataSetOtp1204.Filtered:=isFiltered;
             pFIBDataSetOtp1204.Refresh;
        end;
     pFIBDataSetOtp1204.GotoBookmark(saveBookmark);
     pFIBDataSetOtp1204.FreeBookmark(saveBookmark);
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

procedure TFormOtp1204.BitBtn1Click(Sender: TObject);
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
             pFIBDataSetOtp1204.Filtered:=False;
             pFIBDataSetOtp1204.Filter:='';
        end
     else
        begin
             s:='w_place='+IntToStr(ShifrPod);
             pFIBDataSetOtp1204.Filter:=s;
             pFIBDataSetOtp1204.Filtered:=true;
        end;
     pFIBDataSetOtp1204.Refresh;
     dxDBGridOtp1204.Refresh;
     Application.ProcessMessages;

end;

procedure TFormOtp1204.N1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;

end;

end.
