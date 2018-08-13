unit UFormUpdKomand;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormUpdBoln, dxExEdtr, Menus, FIBDatabase, pFIBDatabase,
  FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet,
  StdCtrls, ExtCtrls, Grids, dxDBTLCl, dxGrClms, dxDBGrid, dxTL, dxDBCtrl,
  dxCntner, ComCtrls, Buttons;

type
  TFormUpdKomand = class(TFormUpdBoln)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUpdKomand: TFormUpdKomand;

implementation

{$R *.dfm}

end.
