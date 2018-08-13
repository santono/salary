{$WARNINGS OFF}
{$HINTS OFF}
unit UFormBrowseInd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet,
  dxExEdtr, dxDBTLCl, dxTL, dxDBCtrl, dxCntner, dxDBTL, ExtCtrls, DBCtrls,
  ComCtrls, dxGrClms, dxDBGrid;

type
  TFormBrowseInd = class(TForm)
    pFIBdsInd: TpFIBDataSet;
    pFIBtrRead: TpFIBTransaction;
    dsInd: TDataSource;
    pFIBdsIndSHIFRID: TFIBIntegerField;
    pFIBdsIndTABNO: TFIBIntegerField;
    pFIBdsIndFIO: TFIBStringField;
    pFIBdsIndSHIFRPOD: TFIBSmallIntField;
    pFIBdsIndDOLG: TFIBStringField;
    pFIBdsIndDATABASEIND: TFIBDateField;
    pFIBdsIndSUMMAINDBUD: TFIBBCDField;
    pFIBdsIndSUMMAINDVNE: TFIBBCDField;
    pFIBdsIndMOVEDBUD: TFIBSmallIntField;
    pFIBdsIndMOVEDVNE: TFIBSmallIntField;
    DBNavigator1: TDBNavigator;
    DateTimePickerYM: TDateTimePicker;
    dxDBGridInd: TdxDBGrid;
    dxDBGridIndSHIFRID: TdxDBGridMaskColumn;
    dxDBGridIndTABNO: TdxDBGridMaskColumn;
    dxDBGridIndFIO: TdxDBGridMaskColumn;
    dxDBGridIndSHIFRPOD: TdxDBGridMaskColumn;
    dxDBGridIndDOLG: TdxDBGridMaskColumn;
    dxDBGridIndDATABASEIND: TdxDBGridDateColumn;
    dxDBGridIndSUMMAINDBUD: TdxDBGridCurrencyColumn;
    dxDBGridIndSUMMAINDVNE: TdxDBGridCurrencyColumn;
    dxDBGridIndMOVEDBUD: TdxDBGridCheckColumn;
    dxDBGridIndMOVEDVNE: TdxDBGridCheckColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DateTimePickerYMChange(Sender: TObject);
    procedure dxDBGridIndDblClick(Sender: TObject);
  private
    { Private declarations }
    y,m:Integer;
    procedure OpenDs;
  public
    constructor CreateIndWnd(AOwner: TComponent;Y:Integer;M:Integer);

    { Public declarations }
  end;

var
  FormBrowseInd: TFormBrowseInd;

implementation
  uses UFibModule,ScrDef,ScrUtil,DateUtils,
       UFormIndexUpdate;
constructor TFormBrowseInd.CreateIndWnd(AOwner: TComponent;Y:Integer;M:Integer);
 var yy,mm,dd:word;
     dt:TDateTime;
 begin
      inherited Create(AOwner);
      Self.Y     := Y;
      Self.M     := M;
      mm:=7;
      dd:=1;
      yy:=2012;
      dt:=EncodeDate(yy,mm,dd);
      DateTimePickerYM.MinDate:=dt;
      mm:=m;
      dd:=1;
      yy:=CurrYear;
      dt:=EncodeDate(yy,mm,dd);
      DateTimePickerYM.MaxDate:=dt;
      OpenDs;
 end;
procedure TFormBrowseInd.OpenDs;
 begin
     Caption:='Расчет индексации за '+GetMonthRus(M)+' '+IntToStr(Y)+' г.';
     if pFIBdsInd.Active then
        pFIBdsInd.Close;
     if pFIBdsInd.Transaction.Active then
        pFIBdsInd.Transaction.Commit;
     pFIBdsInd.Params[0].AsInteger:=Y;
     pFIBdsInd.Params[1].AsInteger:=M;
     RecodeDay(DateTimePickerYM.Date,1);
     RecodeMonth(DateTimePickerYM.Date,M);
     RecodeYear(DateTimePickerYM.Date,Y);
     pFIBdsInd.Transaction.StartTransaction;
     pFIBdsInd.Open;

 end;


{$R *.dfm}

procedure TFormBrowseInd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     if pFIBdsInd.Active then
        pFIBdsInd.Close;
     if pFIBdsInd.Transaction.Active then
        pFIBdsInd.Transaction.Commit;
     Action:=caFree;
end;

procedure TFormBrowseInd.DateTimePickerYMChange(Sender: TObject);
 var YC,MC:Integer;
begin
     YC:=YearOf(DateTimePickerYM.Date);
     MC:=MonthOf(DateTimePickerYM.Date);
     if not ((Y=YC) and (M=MC)) then
        begin
             y:=YC;
             m:=MC;
             OpenDs;
        end;
end;

procedure TFormBrowseInd.dxDBGridIndDblClick(Sender: TObject);
begin
      FormIndexUpdate:=TFormIndexUpdate.CreateIndWnd(Self,pFIBdsIndTABNO.Value,y,m);
      FormIndexUpdate.ShowModal;
end;

end.
