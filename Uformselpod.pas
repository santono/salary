unit UFormSelPod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDataSet, pFIBDataSet, dxExEdtr, dxTL, dxDBCtrl, dxDBGrid,
  dxCntner, StdCtrls, Buttons;

type
  TFormSelPodr = class(TForm)
    pFIBDataSetPodr: TpFIBDataSet;
    pFIBDataSetPodrSHIFRPOD: TFIBIntegerField;
    pFIBDataSetPodrNAME: TFIBStringField;
    DataSourcePodr: TDataSource;
    dxDBGridPodr: TdxDBGrid;
    dxDBGridPodrSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridPodrNAME: TdxDBGridMaskColumn;
    LabelCnt: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dxDBGridPodrClick(Sender: TObject);
    procedure dxDBGridPodrKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dxDBGridPodrKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    procedure MarkPodr;
    procedure MarkKafedry;
  public
    { Public declarations }
  end;

var
  FormSelPodr: TFormSelPodr;

implementation
  uses uFibModule,ScrLists,ScrUtil;

{$R *.dfm}

procedure TFormSelPodr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     IF pFIBDataSetPodr.Active THEN
        pFIBDataSetPodr.Active:=FALSE;
      Action:=caFree;
end;

procedure TFormSelPodr.FormShow(Sender: TObject);
begin
     IF NOT pFIBDataSetPodr.Active THEN
        pFIBDataSetPodr.Active:=TRUE;
     NameServList.ClearAllSelected;
     LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
     Application.ProcessMessages;

end;

procedure TFormSelPodr.MarkPodr;
var
  i, j, k: Integer;
begin
  if dxDBGridPodr.SelectedCount>0 then
    with dxDBGridPodr.DataSource.DataSet do
      for i:=0 to dxDBGridPodr.SelectedCount-1 do
      begin
{           GotoBookmark(pointer(dxDBGridPodr.SelectedRows.Items[i]));}
{           j:=Fields[0].AsInteger;}
           val(dxDBGridPodr.SelectedNodes[i].Strings[0],j,k);
           if k=0 then
               if j>0 then
                  NameServList.SetSelected(j);
      end;
end;

procedure TFormSelPodr.MarkKafedry;
var
  i,j: Integer;
  S:string;
begin
      for i:=0 to dxDBGridPodr.Count-1 do     
      begin
           s:=dxDBGridPodr.Items[i].Strings[1];
           if pos('КАФЕДРА',trim(Upper_String(S)))>0 then
     //         dxDBGridPodr.SelectedNodes.Add(dxDBGridPodr.Items[i]);
              dxDBGridPodr.Items[i].Selected:=true;
           j:=dxDBGridPodr.SelectedCount;
      end;
end;

procedure TFormSelPodr.dxDBGridPodrClick(Sender: TObject);
begin
      LabelCnt.Caption:='Отмечено '+IntToStr(dxDBGridPodr.SelectedCount)+' подразделений';
      Application.ProcessMessages;
end;

procedure TFormSelPodr.dxDBGridPodrKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
      dxDBGridPodrClick(Sender);
end;

procedure TFormSelPodr.dxDBGridPodrKeyPress(Sender: TObject;
  var Key: Char);
begin
      dxDBGridPodrClick(Sender);
end;

procedure TFormSelPodr.BitBtn1Click(Sender: TObject);
begin
      MarkPodr;
      ModalResult:=mrOk;
end;

procedure TFormSelPodr.BitBtn2Click(Sender: TObject);
begin
     NameServList.ClearAllSelected;
end;

procedure TFormSelPodr.BitBtn3Click(Sender: TObject);
begin
      MarkKafedry;
      Application.ProcessMessages;
end;

end.
