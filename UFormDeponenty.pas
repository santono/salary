unit UFormDeponenty;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxExEdtr, DB, dxCntner, dxTL, dxDBCtrl, dxDBGrid, dxDBTLCl,
  dxGrClms, ExtCtrls, DBCtrls, Menus;

type
  TFormDeponenty = class(TForm)
    dxDBGrid1: TdxDBGrid;
    dsDeponent: TDataSource;
    dxDBGrid1NPP: TdxDBGridMaskColumn;
    dxDBGrid1TABNO: TdxDBGridMaskColumn;
    dxDBGrid1FIO: TdxDBGridMaskColumn;
    dxDBGrid1SUMMA_RUB: TdxDBGridMaskColumn;
    dxDBGrid1IDCODE: TdxDBGridMaskColumn;
    dxDBGrid1BANKCOUNT: TdxDBGridMaskColumn;
    dxDBGridButt: TdxDBGridButtonColumn;
    DBNavigator1: TDBNavigator;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    dxDBGrid1SUMMA: TdxDBGridCalcColumn;
    procedure dxDBGridButtButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDeponenty: TFormDeponenty;

implementation
  uses UFormToExcelKomend,UFrmFindKadryFB;

 type pRec=^trec;
      trec=record
            tabno:Integer;
            fio:string;
            summa:Real;
            nalCode:String;
            bankCount:String;
           end;


{$R *.dfm}

procedure TFormDeponenty.dxDBGridButtButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
  var WT:Integer;
      WF,NC,BC:String;
begin
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     WT:=GetTabno;
                     WF:=GetFio;
                     NC:=GetNalCode;
                     BC:=getBankCount;
                  {   if FIB.GetRightForSecretWorker(WT) then}
                     if true then
                        begin
                             FormToExcelKomend.cdsRubFIO.Value       := WF;
                             FormToExcelKomend.cdsRubTABNO.Value     := WT;
                             FormToExcelKomend.cdsRubIDCODE.Value    := NC;
                             FormToExcelKomend.cdsRubBANKCOUNT.Value := BC;
                             Self.Repaint;
                        end
                     else
                        begin
                             ShowMessage('Нет прав на доступ к аданным этого сотрудника');
                        end;
               end;
         finally
{
            try
               free;
            finally
            end;
}            
          end;

end;

procedure TFormDeponenty.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;
function CompareFio(Item1, Item2: Pointer): Integer;
begin
  Result := CompareText(pRec(Item1).Fio, prec(Item2).fio);
end;

procedure TFormDeponenty.N1Click(Sender: TObject);
  var rec:pRec;
      list:TList;
      i:Integer;
begin
      list:=TList.Create;
      FormToExcelKomend.cdsRub.First;
      while (not FormToExcelKomend.cdsRub.Eof) do
       begin
            New(rec);
            rec.tabno     := FormToExcelKomend.cdsRubTABNO.Value;
            rec.fio       := FormToExcelKomend.cdsRubFIO.Value;
            rec.summa     := FormToExcelKomend.cdsRubSumma.Value;
            rec.nalCode   := FormToExcelKomend.cdsRubIDCODE.Value;
            rec.bankCount := FormToExcelKomend.cdsRubBANKCOUNT.Value;
            list.Add(rec);
            FormToExcelKomend.cdsRub.Next;
       end;
      if list.count=0 then
         begin
              ShowMessage('Пустой список депонентов');
              list.Free;
              Exit;
         end;
      list.Sort(@CompareFio);
      FormToExcelKomend.cdsRub.EmptyDataSet;
      for i:=0 to list.Count-1 do
          begin
               FormToExcelKomend.cdsRub.Append;
               FormToExcelKomend.cdsRubNPP.Value       := i+1    ;
               FormToExcelKomend.cdsRubTABNO.Value     := prec(list.Items[i]).tabno     ;
               FormToExcelKomend.cdsRubFIO.Value       := prec(list.Items[i]).fio       ;
               FormToExcelKomend.cdsRubSumma.Value     := prec(list.Items[i]).summa     ;
               FormToExcelKomend.cdsRubSUMMA_RUB.Value := prec(list.Items[i]).summa     ;
               FormToExcelKomend.cdsRubIDCODE.Value    := prec(list.Items[i]).nalCode   ;
               FormToExcelKomend.cdsRubBANKCOUNT.Value := prec(list.Items[i]).bankCount ;
               FormToExcelKomend.cdsRub.Post;
          end;
      if list.count>0 then
         for i:=0 to list.count-1 do
             Dispose(pRec(list.Items[i]));
      list.Free;
      FormToExcelKomend.PrintDeponenty;

end;

end.
