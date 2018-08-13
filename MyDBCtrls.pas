unit MyDBCtrls;

{$R-,H+,X+}

interface

uses Variants, Windows, SysUtils, Messages, Controls, Forms, Classes,
     ComCtrls, DB,DBCtrls,Dialogs;

type
  TDBDateTimePicker = class (TDateTimePicker)
  private
    FDataLink: TFieldDataLink;
    procedure ActiveChange(Sender: TObject);
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    procedure UpdateData(Sender: TObject);        
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
  protected
    procedure Change; override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Field: TField read GetField;
  published
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
  end;

  TDBEditModified = class(TDBEdit)
  private
  protected
      procedure KeyPress(var Key: Char); override;
  public
  published
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Data Controls', [TDBDateTimePicker,TDBEditModified]);
end;


{ TDBDateTimePicker }

constructor TDBDateTimePicker.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
//  inherited ReadOnly := True;
  Enabled:=false;
  ControlStyle := ControlStyle + [csReplicatable];
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataLink.OnActiveChange := ActiveChange;
end;

destructor TDBDateTimePicker.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
//  FCanvas.Free;
//  inherited Destroy;
  inherited;
end;


procedure TDBDateTimePicker.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TDBDateTimePicker.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBDateTimePicker.SetDataSource(Value: TDataSource);
begin
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
    FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

function TDBDateTimePicker.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

function TDBDateTimePicker.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TDBDateTimePicker.ActiveChange(Sender: TObject);
begin
{  ResetMaxLength;  }
end;

procedure TDBDateTimePicker.DataChange(Sender: TObject);
begin

  if FDataLink.Field <> nil then
  begin
    Enabled:=true;

    begin
      Enabled:=true;
    end;
    if (FDataLink.Field.IsNull) and (FDataLink.DataSet.State in [dsEdit, dsInsert]) then
    begin
      DateTime :=  date;
//      if not FDataLink.Field. then showMessage('test');
      FDataLink.Field.Text := DateToStr( DateTime);
//      Change;
    end
    else DateTime :=  FDataLink.Field.AsDateTime;

    Format:=TDateTimeField(FDataLink.Field).DisplayFormat;
    if FDataLink.Editing and FDataLink.CanModify then FDataLink.Modified;
  end else
  begin
    Enabled:=false;
{    FAlignment := taLeftJustify;
    EditMask := '';
    if csDesigning in ComponentState then
      EditText := Name else
      EditText := '';
}
  end;
end;

procedure TDBDateTimePicker.EditingChange(Sender: TObject);
begin
//  inherited ReadOnly := not FDataLink.Editing;
end;

procedure TDBDateTimePicker.UpdateData(Sender: TObject);
begin
  FDataLink.Field.Text := DateToStr( DateTime);
end;

procedure TDBDateTimePicker.Change;
begin
  inherited Change;
  FDataLink.Edit;
  FDataLink.Modified;
end;

procedure TDBDateTimePicker.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
//    SelectAll;
    SetFocus;
    raise;
  end;
//  SetFocused(False);
//  CheckCursor;
  DoExit;
end;

procedure TDBDateTimePicker.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if (Key = VK_LEFT) or (Key = VK_RIGHT)  or (Key = VK_UP) or (Key = VK_DOWN) then FDataLink.Edit;
end;


{ TDBEditModified }

procedure TDBEditModified.KeyPress(var Key: Char);
begin
  if (Key in ['.',',']) and (Field.DataType in [ftFloat, ftCurrency, ftBCD])  then
      Key:=DecimalSeparator;

  inherited KeyPress(Key);
end;

end.
