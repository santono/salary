unit UFormEditShifr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, FIBDataSet, pFIBDataSet,
  dxExEdtr, ExtCtrls, DBCtrls, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, FIBDatabase, pFIBDatabase;

type
  TFormEditShifr = class(TForm)
    PageControlShifr: TPageControl;
    BitBtn1: TBitBtn;
    TabSheetAdd: TTabSheet;
    TabSheetUd: TTabSheet;
    pFIBDataSetAdd: TpFIBDataSet;
    pFIBDataSetAddSHIFR: TFIBIntegerField;
    pFIBDataSetAddNAME: TFIBStringField;
    pFIBDataSetAddSHORTNAME: TFIBStringField;
    pFIBDataSetAddPODOH: TFIBSmallIntField;
    pFIBDataSetAddPENS: TFIBSmallIntField;
    pFIBDataSetAddSS: TFIBSmallIntField;
    pFIBDataSetAddFONDZ: TFIBSmallIntField;
    pFIBDataSetAddBOLN: TFIBSmallIntField;
    pFIBDataSetAddOTP: TFIBSmallIntField;
    pFIBDataSetAddPROF: TFIBSmallIntField;
    pFIBDataSetAddALIM: TFIBSmallIntField;
    DataSourceAdd: TDataSource;
    dxDBGridAdd: TdxDBGrid;
    dxDBGridAddSHIFR: TdxDBGridMaskColumn;
    dxDBGridAddNAME: TdxDBGridMaskColumn;
    dxDBGridAddSHORTNAME: TdxDBGridMaskColumn;
    dxDBGridAddPODOH: TdxDBGridCheckColumn;
    dxDBGridAddPENS: TdxDBGridCheckColumn;
    dxDBGridAddSS: TdxDBGridCheckColumn;
    dxDBGridAddFONDZ: TdxDBGridCheckColumn;
    dxDBGridAddBOLN: TdxDBGridCheckColumn;
    dxDBGridAddOTP: TdxDBGridCheckColumn;
    dxDBGridAddPROF: TdxDBGridCheckColumn;
    dxDBGridAddALIM: TdxDBGridCheckColumn;
    DBNavigatorAdd: TDBNavigator;
    pFIBDataSetUd: TpFIBDataSet;
    DataSourceUd: TDataSource;
    dxDBGridUd: TdxDBGrid;
    pFIBDataSetUdSHIFR: TFIBIntegerField;
    pFIBDataSetUdNAME: TFIBStringField;
    pFIBDataSetUdSHORTNAME: TFIBStringField;
    dxDBGridUdSHIFR: TdxDBGridMaskColumn;
    dxDBGridUdNAME: TdxDBGridMaskColumn;
    dxDBGridUdSHORTNAME: TdxDBGridMaskColumn;
    DBNavigatorUd: TDBNavigator;
    pFIBDataSetAddIND: TFIBSmallIntField;
    dxDBGridAddInd: TdxDBGridCheckColumn;
    pFIBDataSetAddDEKR: TFIBSmallIntField;
    pFIBDataSetAddKOMAND: TFIBSmallIntField;
    dxDBGridAddDekr: TdxDBGridCheckColumn;
    dxDBGridAddKomand: TdxDBGridCheckColumn;
    dxDBGridAddECB: TdxDBGridCheckColumn;
    dxDBGridAddECB_INV: TdxDBGridCheckColumn;
    dxDBGridAddECB_ILL: TdxDBGridCheckColumn;
    pFIBDataSetAddECB: TFIBSmallIntField;
    pFIBDataSetAddECB_INV: TFIBSmallIntField;
    pFIBDataSetAddECB_ILL: TFIBSmallIntField;
    pFIBDataSetAddNAMEFORSWOD: TFIBStringField;
    pFIBDataSetUdNAMEFORSWOD: TFIBStringField;
    trAddWrite: TpFIBTransaction;
    trAddRead: TpFIBTransaction;
    trUdWrite: TpFIBTransaction;
    trUdRead: TpFIBTransaction;
    pFIBDataSetAddWS: TFIBSmallIntField;
    dxDBGridAddWS: TdxDBGridCheckColumn;
    pFIBDataSetAddOTP_25_07_2016: TFIBSmallIntField;
    dxDBGridAddOTP_25_07_2016: TdxDBGridCheckColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBNavigatorAddClick(Sender: TObject; Button: TNavigateBtn);
    procedure DBNavigatorUdClick(Sender: TObject; Button: TNavigateBtn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditShifr: TFormEditShifr;

implementation
 uses UFibModule, UFormUpdShifrAdd, UFormUpdShifrUd,ScrDef;

{$R *.dfm}

procedure TFormEditShifr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     if pFIBDataSetAdd.Active then
        pFIBDataSetAdd.Active:=false;
     if pFIBDataSetUd.Active then
        pFIBDataSetUd.Active:=false;
     if pFIBDataSetAdd.Transaction.Active then
        pFIBDataSetAdd.Transaction.Commit;
     if pFIBDataSetUd.Transaction.Active then
        pFIBDataSetUd.Transaction.Commit;
      Action:=caFree;
end;

procedure TFormEditShifr.FormShow(Sender: TObject);
begin
     if not pFIBDataSetAdd.Active then
        pFIBDataSetAdd.Active:=true;
     if not pFIBDataSetUd.Active then
        pFIBDataSetUd.Active:=true;
end;

procedure TFormEditShifr.DBNavigatorAddClick(Sender: TObject;
  Button: TNavigateBtn);
begin
     if Button=nbEdit then
        begin
            Application.CreateForm(TFormUpdShifrAdd,FormUpdShifrAdd);
            FormUpdShifrAdd.ShowModal;
        end;
end;

procedure TFormEditShifr.DBNavigatorUdClick(Sender: TObject;
  Button: TNavigateBtn);
begin
     if Button=nbEdit then
        begin
            Application.CreateForm(TFormUpdShifrUd,FormUpdShifrUd);
            FormUpdShifrUd.ShowModal;
        end;

end;

procedure TFormEditShifr.FormCreate(Sender: TObject);
begin
     if isLNR then
        begin
             dxDBGridAddOTP_25_07_2016.Visible:=true;
        end
     else
        begin
             dxDBGridAddOTP_25_07_2016.Visible:=false;
        end;
end;



end.
