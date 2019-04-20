unit UFormSelDogPodSowm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  ExtCtrls, DBCtrls, dxExEdtr, dxDBTLCl, dxGrClms, dxTL, dxDBCtrl,
  dxDBGrid, dxCntner, StdCtrls, Buttons;

type
  TFormSelDogPodSowm = class(TForm)
    dsoWorkersDog: TDataSource;
    DBNavigator1: TDBNavigator;
    dsWorkerDogs: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsWorkerDogsID: TFIBIntegerField;
    dsWorkerDogsIDDOG: TFIBIntegerField;
    dsWorkerDogsTABNO: TFIBIntegerField;
    dsWorkerDogsFIO: TFIBStringField;
    dsWorkerDogsDATEFR: TFIBDateField;
    dsWorkerDogsDATETO: TFIBDateField;
    dsWorkerDogsNOMER: TFIBStringField;
    dsWorkerDogsGUID: TFIBStringField;
    dsWorkerDogsREASONOK: TFIBStringField;
    dsWorkerDogsNOMERDOGGN: TFIBStringField;
    dxDBGridWorkerDogs: TdxDBGrid;
    dxDBGridWorkerDogsID: TdxDBGridMaskColumn;
    dxDBGridWorkerDogsIDDOG: TdxDBGridMaskColumn;
    dxDBGridWorkerDogsTABNO: TdxDBGridMaskColumn;
    dxDBGridWorkerDogsFIO: TdxDBGridMaskColumn;
    dxDBGridWorkerDogsDATEFR: TdxDBGridDateColumn;
    dxDBGridWorkerDogsDATETO: TdxDBGridDateColumn;
    dxDBGridWorkerDogsNOMER: TdxDBGridMaskColumn;
    dxDBGridWorkerDogsGUID: TdxDBGridMaskColumn;
    dxDBGridWorkerDogsREASONOK: TdxDBGridMaskColumn;
    dxDBGridWorkerDogsNOMERDOGGN: TdxDBGridMaskColumn;
    BitBtn1: TBitBtn;
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dxDBGridWorkerDogsDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    selectedId:integer;
    selectedTema:string;
    constructor init(AOwner:TComponent;Tabno:integer;FIO:String;selectedId:integer=0);
    { Public declarations }
  end;

var
  FormSelDogPodSowm: TFormSelDogPodSowm;

implementation
//  uses DB,

{$R *.dfm}
  constructor TFormSelDogPodSowm.init(AOwner:TComponent;Tabno:integer;FIO:String;selectedId:integer=0);
    begin
         self.Create(AOwner);
         Caption:='Укажите договор для работника '+intToStr(Tabno)+' '+trim(fio);
        if dsWorkerDogs.Transaction.Active then
           dsWorkerDogs.Transaction.Commit;
        dsWorkerDogs.Params[0].Value:=tabno;
//        DBNavigator1.VisibleButtons.
        dsWorkerDogs.Transaction.StartTransaction;
        dsWorkerDogs.Open;
        if (selectedId>0) then
           begin
             dsWorkerDogs.Locate('ID',selectedId,[]);
           end;

    end;

procedure TFormSelDogPodSowm.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
     if (button=nbPost) then
        begin
             selectedId:=dsWorkerDogsID.Value;
             selectedTema:=trim(dsWorkerDogsNOMERDOGGN.Value);
             modalResult:=mrOk;
        end;
end;

procedure TFormSelDogPodSowm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
        if dsWorkerDogs.Transaction.Active then
           dsWorkerDogs.Transaction.Commit;
        dsWorkerDogs.Close;

end;

procedure TFormSelDogPodSowm.dxDBGridWorkerDogsDblClick(Sender: TObject);
begin
     DBNavigator1Click(Sender,nbPost);
end;

procedure TFormSelDogPodSowm.BitBtn1Click(Sender: TObject);
begin
     DBNavigator1Click(Sender,nbPost);
end;

end.
