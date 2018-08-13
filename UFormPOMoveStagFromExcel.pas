unit UFormPOMoveStagFromExcel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, dxCntner, dxEditor, dxExEdtr, dxEdLib,
  ComCtrls;

type
  TFormPOMoveStagFromExcel = class(TForm)
    OpenDialog1: TOpenDialog;
    EditExlName: TEdit;
    BitBtn1: TBitBtn;
    DateTimePickerFr: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dxCalcEditColTabno: TdxCalcEdit;
    dxCalcEditColStag: TdxCalcEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
     fileName : string;
     dateFr   : TDate;
     colTabno : Integer;
     colStag  : Integer;
     procedure moveStag;
  public
    { Public declarations }
  end;

var
  FormPOMoveStagFromExcel: TFormPOMoveStagFromExcel;

implementation
  uses DateUtils,comObj,Math,UFibModule;

{$R *.dfm}

procedure TFormPOMoveStagFromExcel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;

procedure TFormPOMoveStagFromExcel.BitBtn1Click(Sender: TObject);
begin
     if OpenDialog1.Execute then
        filename := OpenDialog1.FileName;
     EditExlName.Text:=filename;
     Application.ProcessMessages;
end;

procedure TFormPOMoveStagFromExcel.FormCreate(Sender: TObject);
begin
      fileName := '';
      dateFr   := Date;
      colTabno := 1;
      colStag  := 5;
      dateFr   := StartOfTheMonth(dateFr);
      dxCalcEditColTabno.Text := IntToStr(colTabno);
      dxCalcEditColStag.Text  := IntToStr(colStag);
      DateTimePickerFr.Date   := dateFr;
      Label4.Caption:='';
      Label5.Caption:='';


end;

procedure TFormPOMoveStagFromExcel.BitBtn2Click(Sender: TObject);
begin
      if length(Trim(fileName))=0 then
         begin
              ShowMessage('Не указан файл Excel ');
              Exit;
         end;
      fileName:=Trim(fileName);
      if not FileExists(fileName) then
         begin
              ShowMessage('Отсутствует файл '+fileName);
              Exit;
         end;
      if YearOf(DateFr)<2013 then
         begin
              ShowMessage('Не указана дата стажа ');
              Exit;
         end;
      if ((colTabno<1) or (colTabno>25)) then
         begin
              ShowMessage('Не верно указана колонка табельного номера. ');
              Exit;
         end;
      if ((colStag<1) or (colStag>25)) then
         begin
              ShowMessage('Не верно указана колонка стажа. ');
              Exit;
         end;
      MoveStag;

end;

 procedure TFormPOMoveStagFromExcel.moveStag;
   const limitInCorrectLine=2000;
   var E,WC:Variant;
       S:String;
       ExRow,ExCol:integer;
       correctLine:Boolean;
       nmbOfInCorrectine:Integer;
       finished:Boolean;
       tabnoS,stagS:string;
       tabno:Integer;
       stag,a:Real;
       stagY,stagM:integer;
       nmbOfMovedLine:Integer;
       correctTabno,correctStag:Boolean;
       i:Integer;
       SqlStmnt:string;
   begin

     if not FileExists(fileName) then
        begin
             ShowMessage('Отсутствует файл '+fileName);
             Exit;
        end;
     try
        E:=CreateOleObject('Excel.Application');
     except
        ShowMessage('Ошибка запуска Excel');
        Exit;
     end;
     E.Visible:=True;
     E.WorkBooks.Open(fileName);
     ExRow:=1;
     ExCol:=colTabno;
     finished:=False;
     nmbOfInCorrectine:=0;
     nmbOfMovedLine:=0;
     while not finished do
       begin
            inc(exRow);
            tabnoS := E.WorkBooks[1].WorkSheets[1].Cells[ExRow,colTabno];
            stagS  := E.WorkBooks[1].WorkSheets[1].Cells[ExRow,colStag];
            correctLine := true;
            correctTabno:= False;
            correctStag := False;
            if Length(Trim(tabnoS))>0 then
               begin
                    tabno:=0;
                    Val(Trim(tabnoS),tabno,i);
                    if i=0 then
                    if ((tabno>0) and (tabno<15000)) then
                       correctTabno:=True;

               end;
            if correctTabno then
            if Length(Trim(stagS))>0 then
               begin
                    stag:=0;
                    stagS:=StringReplace(stagS,',','.',[rfReplaceAll,rfIgnoreCase]);
                    Val(Trim(stagS),stag,i);
                    if i=0 then
                    if ((stag>0.00) and (stag<60.00)) then
                       begin
                            correctStag:=True;
                            stagY:=Round(int(stag));
                            a:=stag-stagY;
                            stagM := Round(12.00*a);
                            stag:=RoundTo(stag,-2);

                       end;
               end;
            if not (correctTabno and correctStag) then
               correctLine:=False;
            if correctLine then
               begin
                    nmbOfInCorrectine:=0;
                    Inc(nmbOfMovedLine);
                    Label4.Caption:='К-во '+IntToStr(nmbOfMovedLine);
                    Label5.Caption:='';
                    Application.ProcessMessages;
                    SQLStmnt:='update tb_k_kadry set pedstagy='+trim(stagS)+
                                                ', STAG_P_DO_Y='+inttostr(StagY)+
                                                ', STAG_P_DO_M='+inttostr(StagM)+
                                                ', DATE_STAG_P='''+inttostr(yearof(DateFr))+
                                                '-'+inttostr(monthof(DateFr))+
                                                '-'+inttostr(dayof(DateFr))+''' where tabno='+inttostr(Tabno);
                    if not FIB.pFIBDatabaseSal.Execute(SQLStmnt) then
                       begin
                            ShowMessage('Ошибка выполнения запроса '+trim(SQLStmnt));
                       end;
               end
            else
               begin
                    inc(nmbOfInCorrectine);
                    if nmbOfInCorrectine>limitInCorrectLine then
                       begin
                            finished:=True;
                            Break;
                       end;
               end;
       end;
       E.WorkBooks.Close;
       ShowMessage('Перенесено '+IntToStr(nmbOfMovedLine)+' записей.');

   end;

end.
