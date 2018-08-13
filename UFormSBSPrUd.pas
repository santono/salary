unit UFormSBSPrUd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet;

type
  TFormSbsPrUd = class(TForm)
    DataSourceSbsUd: TDataSource;
    pFIBDataSetSBSUd: TpFIBDataSet;
    pFIBTransactionSBSUd: TpFIBTransaction;
    pFIBDataSetSBSUdSHIFRID: TFIBIntegerField;
    pFIBDataSetSBSUdW_PLACE: TFIBSmallIntField;
    pFIBDataSetSBSUdNAMEPOD: TFIBStringField;
    pFIBDataSetSBSUdW_R: TFIBSmallIntField;
    pFIBDataSetSBSUdNAMEWR: TFIBStringField;
    pFIBDataSetSBSUdSHIFRGRU: TFIBSmallIntField;
    pFIBDataSetSBSUdNAMEGRU: TFIBStringField;
    pFIBDataSetSBSUdSHIFRKAT: TFIBSmallIntField;
    pFIBDataSetSBSUdNAMEKAT: TFIBStringField;
    pFIBDataSetSBSUdSHIFRSTA: TFIBSmallIntField;
    pFIBDataSetSBSUdNAMESTA: TFIBStringField;
    pFIBDataSetSBSUdMONTH_ZA: TFIBSmallIntField;
    pFIBDataSetSBSUdYEAR_ZA: TFIBSmallIntField;
    pFIBDataSetSBSUdMONTH_VY: TFIBSmallIntField;
    pFIBDataSetSBSUdYEAR_VY: TFIBSmallIntField;
    pFIBDataSetSBSUdSUMMA: TFIBBCDField;
    pFIBDataSetSBSUdMARK: TFIBSmallIntField;
   
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
    ShifrIdSbs:Integer;
    M   : integer;
    Y   : integer;
    Mode_Vy_Za : integer;
  public
    constructor OwnCreate(AOwner: TComponent;NewId:integer;NewY:Integer;NewM:Integer;NewMode_Vy_Za:integer);
    { Public declarations }
  end;

var
  FormSbsPrUd: TFormSbsPrUd;

implementation
  uses uFIBModule,Scrutil;

{$R *.dfm}

constructor TFormSbsPrUd.OwnCreate(AOwner: TComponent;NewId:integer;NewY:Integer;NewM:Integer;NewMode_Vy_Za:integer);
begin
  inherited Create(AOwner);
  ShifrIdSbs:=NewId;
  M:=NewM;
  Y:=NewY;
  Mode_Vy_Za := NewMode_Vy_Za;


end;



procedure TFormSbsPrUd.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

end.
