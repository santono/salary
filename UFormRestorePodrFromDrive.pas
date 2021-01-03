{$H-}
unit UFormRestorePodrFromDrive;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus;

type
  TFormRestorePodrFromDrive = class(TForm)
    StringGridFiles: TStringGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
  private
         procedure FillFileLists;
         procedure MakeGrid;
         function GetCountPersonInFile(Tmpl:string;FName:string):Integer;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRestorePodrFromDrive: TFormRestorePodrFromDrive;

implementation
  uses ScrDef,ScrIo,ScrUtil,DateUtils, UFormWaitMess;
  type PItem = ^TItem;
       TItem=record
              FileName : string;
              Time     : TTime;
              Date     : TDate;
              Count    : Integer;
             end;
  var List : TList;

{$R *.dfm}

procedure TFormRestorePodrFromDrive.FormCreate(Sender: TObject);
begin
     List:=TList.Create;
     FillFileLists;
     MakeGrid;
end;

function Compare(Item1,Item2:pointer):Integer;
 begin
      if PItem(Item1).Date<PItem(Item2).Date      then Result:=1
      else if PItem(Item1).Date>PItem(Item2).Date then Result:=-1
      else if PItem(Item1).Time<PItem(Item2).Time then Result:=1
      else if PItem(Item1).Time>PItem(Item2).Time then Result:=-1
                                                  else Result:=0;
 end;

procedure TFormRestorePodrFromDrive.MakeGrid;
 var i: Integer;
 begin
      StringGridFiles.RowCount:=List.Count+1;
      if List.Count>0 then
         for i:=0 to List.Count-1 do
             begin
                  StringGridFiles.Cells[0,i+1]:=PItem(List.Items[i]).FileName;
                  StringGridFiles.Cells[1,i+1]:=DateToStr(PItem(List.Items[i]).Date);
                  StringGridFiles.Cells[2,i+1]:=TimeToStr(PItem(List.Items[i]).Time);
                  StringGridFiles.Cells[3,i+1]:=IntToStr(PItem(List.Items[i]).Count);
             end;
 end;

procedure TFormRestorePodrFromDrive.FillFileLists;
     var
        sr         : TSearchRec;
        FileAttrs  : Integer;
        CurrVersio : Integer;
        Template   : string;
        S,ss       : string;
        i,j        : Integer;
        Dt         : TDateTime;
        D          : TDate;
        T          : TTime;
        Item       : PItem;
        FAge       : Integer;
     begin
           CurrVersio:=0;
           MKFLNM_BAK_FOR_VERSION(Template);
           FileAttrs := FileAttrs + faAnyFile;
           if FindFirst(Template, FileAttrs, sr) = 0 then
              repeat
                   S  := Trim(sr.Name);
                 //  I  := sr.FindData.ftCreationTime;
                   I  := sr.Time;
                   dt := FileDateToDateTime(I);
                 //  FAge := FileAge(S);
                 //  dt := FileDateToDateTime(FAge);
                   s  := Copy(S,length(S)-16,17);
                   New(Item);
                   Item.FileName := s;
                   Item.Date := DateOf(dt);
                   Item.Time := TimeOf(dt);
                   Item.Count := GetCountPersonInFile(Template,s);
                   List.Add(Item);
              until FindNext(sr) <> 0;
           SysUtils.FindClose(sr);
           List.Sort(@Compare);

     end;

function TFormRestorePodrFromDrive.GetCountPersonInFile(Tmpl:string;FName:string):Integer;
 var H:Person_Ptr;
     S:string;
     D,F:string;
     i,l,l1:Integer;
 begin
      D:=trim(Tmpl);
      L:=Length(D);
      FName:=trim(Fname);
      L1:=Length(FName);
      F:=copy(D,1,L-L1);
      F:=F+FName;
      SELECT(5);
      s:=fninf;
      fninf:=f;
      getinf(false);
      i:=Count_Person;
      EMPTY_ALL_PERSON;
      select(1);
      fninf:=s;
      GetCountPersonInFile:=i;
 end;
procedure TFormRestorePodrFromDrive.FormClose(Sender: TObject;
  var Action: TCloseAction);
 var i:Integer;
begin
     if List.Count>0 then
        for i:=0 to List.Count-1 do
            Dispose(PItem(List.Items[i]));
     List.Free;
     Action:=caFree;
end;

procedure TFormRestorePodrFromDrive.N1Click(Sender: TObject);
 var I,i_c,l,l1:integer;
     S,d,f,sv:String;
     Template:string;
begin
     i:=StringGridFiles.Row;
     if i<1 then Exit;
     if List.Count<1 then Exit;
     i_c:=PItem(List.Items[i-1]).Count;
     if i_c<1 then
        begin
             ShowMessage('Выбранный файл пуст.');
             Exit;
        end;
     if COUNT_PERSON>1 then
        begin
             ShowMessage('Текущий файл не потерян. Его нельзя восстановить');
             Exit;
        end;
     MKFLNM_BAK_FOR_VERSION(Template);
     D:=trim(Template);
     L:=Length(D);
     S:=PItem(List.Items[i-1])^.FileName;
     S:=trim(S);
     L1:=Length(S);
     F:=copy(D,1,L-L1);
     F:=F+S;
     EMPTY_ALL_PERSON;
     sv:=fninf;
     fninf:=f;
     getinf(true);
     fninf:=sv;
     FormWaitMess.SetMessage('Подразделение восстановлено виконано');
     FormWaitMess.Show;
     repeat
           Application.ProcessMessages;
     until FormWaitMess.Timer1.Enabled=false;
     ModalResult:=mrOk;
end;

end.
