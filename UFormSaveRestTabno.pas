unit UFormSaveRestTabno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalc;

type
  TFormSaveRestTabno = class(TForm)
    cxCalcEdit1: TcxCalcEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label2: TLabel;
    cxCalcEdit2: TcxCalcEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSaveRestTabno: TFormSaveRestTabno;

implementation
  uses ScrLists,uformselpkg, uFormWait, UFibModule;

{$R *.dfm}

procedure TFormSaveRestTabno.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormSaveRestTabno.BitBtn4Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormSaveRestTabno.BitBtn1Click(Sender: TObject);
 var Tabno:Integer;
     WantedPodr:Integer;

  procedure DeleteInDB(mode:integer);
    var SQLStmnt:string;
        v : Variant;
        retVal:Integer;
   begin
     SQLStmnt:='select retval from pr_s_del_tabno('+intToStr(tabno)+','+intToStr(wantedPodr)+')';
     FormWait.Show;
     Application.ProcessMessages;
     if (mode=2) then
        v:=FIB.pFIBDatabaseArc.QueryValue(SQLStmnt,0)
     else
        v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     FormWait.Hide;
     Application.ProcessMessages;
     retVal:=99;
     if VarIsNumeric(v) then
        retVal:=v;
     if (retVal=0) then
        if (mode=2) then
           ShowMessage('��������� ������ � ������')
        else
           ShowMessage('��������� ������ � ����������� ��')
     else
     if (retVal=1) then
        if (mode=2) then
          ShowMessage('������� ������ - �� �� �������� � �������� ���� SALARC')
        else
          ShowMessage('������� ������ - �� �� �������� � ����������� ���� SAL')
     else
     if (retVal=2) then
        if (mode=2) then
           ShowMessage('������� ������ - �-�� ����������� ������� �� ����� �-�� ��������� � �������� ��')
        else
           ShowMessage('������� ������ - �-�� ����������� ������� �� ����� �-�� ��������� � ����������� ��')
     else
     if (retVal=3) then
        if (mode=3) then
           ShowMessage('������� ������ - ��� ��� �� ���� �� ������ �������� � �������� ��')
        else
           ShowMessage('������� ������ - ��� ��� �� ���� �� ������ �������� � ����������� ��')
     else
        if (mode=2) then
           ShowMessage('������ �������� ���������� � �������� ��')
        else
           ShowMessage('������ �������� ���������� � ����������� ��')

   end;


begin
     tabno:=Round(cxCalcEdit1.Value);
     if (Tabno<0) or (Tabno>20000) then
        begin
              ShowMessage('�������� ��������� �����');
              Exit;
        end;
     wantedPodr:=Round(cxCalcEdit2.Value);
     if (wantedPodr<0) or (wantedPodr>182) then
        begin
              ShowMessage('�������� �������������');
              Exit;
        end;
     if not (
         (WantedPodr=102) or
         (WantedPodr=76) or
         (WantedPodr=81) or
         (WantedPodr=98) or
         (WantedPodr=140) or
         (WantedPodr=157)
         ) then
        begin
              ShowMessage('������������ �������������');
              Exit;
        end;
     DeleteInDB(1);
     DeleteInDB(2);




end;

procedure TFormSaveRestTabno.BitBtn2Click(Sender: TObject);
 var Tabno:Integer;
     WantedPodr:Integer;

  procedure RestInDB(mode:integer);
    var SQLStmnt:string;
        v : Variant;
        retVal:Integer;
   begin
     SQLStmnt:='select code from pr_s_rest_tabno('+intToStr(tabno)+','+intToStr(wantedPodr)+')';
     FormWait.Show;
     Application.ProcessMessages;
     if (mode=2) then
        v:=FIB.pFIBDatabaseArc.QueryValue(SQLStmnt,0)
     else
        v:=FIB.pFIBDatabaseSal.QueryValue(SQLStmnt,0);
     FormWait.Hide;
     Application.ProcessMessages;
     retVal:=99;
     if VarIsNumeric(v) then
        retVal:=v;
     if (retVal=0) then
        if (mode=2) then
           ShowMessage('��������� ������������ � ������')
        else
           ShowMessage('��������� ������������ � ����������� ��')
     else
     if (retVal=1) then
        if (mode=2) then
          ShowMessage('��������� ��� ��� � �������� ���� � �� ��������� � ��������������')
        else
          ShowMessage('��������� ��� ��� � ����������� �� � �� ��������� � ��������������')
     else
     if (retVal=2) then
        if (mode=2) then
           ShowMessage('��������� �� ������ � ���� ��� �������������� � �� ����� ���� ������������ � �������� ��')
        else
           ShowMessage('��������� �� ������ � ���� ��� �������������� � �� ����� ���� ������������ � ����������� ��')
     else
        if (mode=2) then
           ShowMessage('������ �������������� ���������� � �������� ��')
        else
           ShowMessage('������ �������������� ���������� � ����������� ��')

   end;
begin
     tabno:=Round(cxCalcEdit1.Value);
     if (Tabno<0) or (Tabno>20000) then
        begin
              ShowMessage('�������� ��������� �����');
              Exit;
        end;
     wantedPodr:=Round(cxCalcEdit2.Value);
     if (wantedPodr<0) or (wantedPodr>182) then
        begin
              ShowMessage('�������� �������������');
              Exit;
        end;
     if not (
         (WantedPodr=102) or
         (WantedPodr=76) or
         (WantedPodr=81) or
         (WantedPodr=98) or
         (WantedPodr=140) or
         (WantedPodr=157)
         ) then
        begin
              ShowMessage('������������ �������������');
              Exit;
        end;
     RestInDB(1);
     RestInDB(2);

end;

end.
