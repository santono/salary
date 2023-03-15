unit UFormUpdateLgotnik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxButtonEdit, cxDBEdit, cxCheckBox, cxCalc, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  StdCtrls, Buttons, cxMemo;

type
  TFormUpdateLgotnik = class(TForm)
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxDBCalcEdit1: TcxDBCalcEdit;
    cxDBCalcEdit2: TcxDBCalcEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBButtonEditTn: TcxDBButtonEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    cxDBTextEditFIO: TcxDBTextEdit;
    Label6: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cxMemo1: TcxMemo;
    Label7: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxDBButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    ACtionClarion:Integer;
  public
    constructor myCreate(ActionClarion:integer);
    { Public declarations }
  end;

var
  FormUpdateLgotnik: TFormUpdateLgotnik;

implementation
  uses UFormEditLgotniki,ScrUtil,ScrDef,db,UFrmFindKadryFB; 

{$R *.dfm}

constructor TFormUpdateLgotnik.myCreate(ActionClarion:integer);
 var Fraza:string;
     lines:TArrOfAnsiString;
     i:Integer;
 begin
      inherited Create(Nil);
      Self.ACtionClarion:=ActionClarion;
      Fraza:='';
      if ActionClarion=1 then
         Fraza:='Вставка записи льготника'
      else
      if ActionClarion=2 then
         Fraza:='Редактирование записи льготника'
      else
      if ActionClarion=3 then
         Fraza:='Удаление записи льготника';
      Caption:=Fraza;
      if (ActionClarion=2) or (ActionClarion=3) then
      Caption:=Caption+' '+intToStr(FormEditLgotniki.dsLgotnikiTABNO.value)+' '+FormEditLgotniki.dsLgotnikiFIO.Value;
      if ActionClarion=1 then
         FormEditLgotniki.dsoLgotniki.DataSet.Insert
      else
      if ActionClarion=2 then
         begin
              FormEditLgotniki.dsoLgotniki.Edit;
              cxDBButtonEditTn.Enabled:=false;
              cxDBTextEditFIO.Enabled:=False;
              cxMemo1.Lines.Clear;
              if Length(FormEditLgotniki.dsLgotnikiCOMMENT.value)>0 then
                 begin
                   lines:=AnsiSplit(FormEditLgotniki.dsLgotnikiCOMMENT.value,'=^=');
                   if High(lines)>0 then
                      for i:=0 to High(lines) do
                          cxMemo1.lines.Add(lines[i]);
                 end;
         end;



 end;

procedure TFormUpdateLgotnik.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Action:=caFree;
end;





procedure TFormUpdateLgotnik.cxDBButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var state: TDataSetState;
begin
    state := FormEditLgotniki.dsLgotniki.State;
    with TFormFindKadryFB.Create(nil) do
         try
            if execute then
               begin
                     state := FormEditLgotniki.dsLgotniki.State;
                     FormEditLgotniki.dsLgotnikiTABNO.Value := getTabno;
                     FormEditLgotniki.dsLgotnikiFIO.Value   := getFio;
               end;
         finally
{            free;}
         end;
       Self.Repaint;

end;

procedure TFormUpdateLgotnik.BitBtn1Click(Sender: TObject);
 var i:Integer;
begin
    FormEditLgotniki.dsLgotnikiCOMMENT.value:='';
    if cxMemo1.Lines.Count>0 then
       for i:=0 to cxMemo1.Lines.Count-1 do
          if i=0 then
             FormEditLgotniki.dsLgotnikiCOMMENT.value:=cxMemo1.Lines.Strings[i]
          else
             FormEditLgotniki.dsLgotnikiCOMMENT.value:=FormEditLgotniki.dsLgotnikiCOMMENT.value+'=^='+cxMemo1.Lines.Strings[i];
    if FormEditLgotniki.dsLgotniki.State=dsEdit then
       i:=10;
    FormEditLgotniki.dsLgotniki.Post;
end;

end.
