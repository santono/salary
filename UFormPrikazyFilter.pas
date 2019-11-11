unit UFormPrikazyFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, dxCntner, dxEditor, dxExEdtr,
  dxDBEdtr, dxDBELib;

type
  TFormPrikazyFilter = class(TForm)
    cbNeedDateFilter: TCheckBox;
    cbNeedTypeFilter: TCheckBox;
    cbNeedTabnoFilter: TCheckBox;
    dtFr: TDateTimePicker;
    dtTo: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    BitBtnFio: TBitBtn;
    LabelFio: TLabel;
    BitBtnSet: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    dxLookupEdit1: TdxLookupEdit;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnSetClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrikazyFilter: TFormPrikazyFilter;

implementation

{$R *.dfm}
  uses UFormPrikazyBrowseTot,scrutil,dateutils;


procedure TFormPrikazyFilter.FormCreate(Sender: TObject);
begin
      labelFio.Caption:='';
      if FormPrikazyBrowseTot.needDateFilter then
         begin
             cbNeedDateFilter.Checked:=true;
             if dayOf(FormPrikazyBrowseTot.DateFr)>0 then
                dtFr.Date:=FormPrikazyBrowseTot.DateFr;
             if dayOf(FormPrikazyBrowseTot.DateTo)>0 then
                dtTo.Date:=FormPrikazyBrowseTot.DateTo;
         end
      else
         cbNeedDateFilter.Checked:=false;
      if FormPrikazyBrowseTot.needTypeFilter then
         begin
              cbNeedTypeFilter.Checked:=true;
              dxLookupEdit1.LookupKeyValue:=FormPrikazyBrowseTot.prikazTypeFilter;
         end
      else
         cbNeedTypeFilter.Checked:=false;
      if FormPrikazyBrowseTot.needTabnoFilter then
         begin
              cbNeedTabnoFilter.Checked:=true;
              if FormPrikazyBrowseTot.tabnoFilter>0 then
                labelFio.Caption:=GetFullUkrFioPerson(FormPrikazyBrowseTot.tabnoFilter);

         end
      else
         cbNeedTabnoFilter.Checked:=false;
end;

procedure TFormPrikazyFilter.BitBtnSetClick(Sender: TObject);
var need:boolean;
begin
     need:=false;
     if cbNeedDateFilter.Checked<>FormPrikazyBrowseTot.needDateFilter then
        begin
             need:=true;
             FormPrikazyBrowseTot.needDateFilter:=cbNeedDateFilter.Checked;
             if FormPrikazyBrowseTot.needDateFilter then
                begin
                     FormPrikazyBrowseTot.DateFr:=dtFr.date;
                     FormPrikazyBrowseTot.DateTo:=dtTo.date;
                end
        end;
     if (cbNeedTypeFilter.Checked<>FormPrikazyBrowseTot.needTypeFilter)
        or
        (cbNeedTypeFilter.Checked
        and
        (FormPrikazyBrowseTot.prikazTypeFilter<>FormPrikazyBrowseTot.dsPriTypeID.Value))
         then
        begin
             need:=true;
             FormPrikazyBrowseTot.needTypeFilter:=cbNeedTypeFilter.Checked;
             if FormPrikazyBrowseTot.needTypeFilter then
                FormPrikazyBrowseTot.prikazTypeFilter:=FormPrikazyBrowseTot.dsPriTypeID.Value
             else
                FormPrikazyBrowseTot.prikazTypeFilter:=0;
        end;
     ModalResult:=mrOk;


end;

procedure TFormPrikazyFilter.BitBtn2Click(Sender: TObject);
begin
    if FormPrikazyBrowseTot.needDateFilter
       or
       FormPrikazyBrowseTot.needTypeFilter
       or
       FormPrikazyBrowseTot.needTabnoFilter then
       begin
            FormPrikazyBrowseTot.needDateFilter := false;
            FormPrikazyBrowseTot.needTypeFilter := false;
            FormPrikazyBrowseTot.needTabnoFilter :=false;
            ModalResult:=mrOk;
       end
    else
       modalResult:=mrCancel;
end;

end.
