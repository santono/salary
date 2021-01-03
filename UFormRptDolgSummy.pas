unit UFormRptDolgSummy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, frxClass, frxDBSet, frxDMPExport, Buttons, StdCtrls, ComCtrls;

type
  TFormRptDolgSummy = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    frxDotMatrixExportDS: TfrxDotMatrixExport;
    ProgressBar1: TProgressBar;
    frxUserDataSetDS: TfrxUserDataSet;
    frxReportDS: TfrxReport;
    btn1: TButton;
    frxReportLaserDS: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure frxUserDataSetDSFirst(Sender: TObject);
    procedure frxUserDataSetDSNext(Sender: TObject);
    procedure frxUserDataSetDSGetValue(const VarName: String;
      var Value: Variant);
    procedure frxUserDataSetDSCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frxReportDSGetValue(const VarName: String;
      var Value: Variant);
    procedure btn1Click(Sender: TObject);
    procedure frxReportLaserDSGetValue(const VarName: String;
      var Value: Variant);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormRptDolgSummy    : TFormRptDolgSummy;
  CntFormRptDS : integer;

implementation
  uses ScrIo , ScrDef , ScrUtil, UFormSelPKG, ScrLists;

  type  PRecDS=^TRecDS;
        TRecDS = record
                 kod          : integer;
                 namedol      : string;
                 summaosn     : real;
                 TabnoListOsn : TList;
                 summaswmvnu  : real;
                 TabnoListVnu : TList;
                 summaswmvne  : real;
                 TabnoListVne : TList;
                 summatot     : real;
                end;
        PTabnoItem=^TTabnoItem;
        TTabnoItem = record
                      Tabno:Integer;
                     end;


  var List:TList;
      i_count:integer;
{$R *.dfm}

procedure TFormRptDolgSummy.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Action:=caFree;
      if CntFormRptDS>0 then
         Dec(CntFormRptDS);
end;

procedure TFormRptDolgSummy.FormCreate(Sender: TObject);
begin
      Inc(CntFormRptDS);
end;

function CompareItems(Item1, Item2: Pointer): Integer;
 var RetVal:Integer;
begin
  if PRecDS(Item1)^.kod>PRecDS(Item2)^.kod then RetVal:=1
  else if PRecDS(Item1)^.kod<PRecDS(Item2)^.kod then RetVal:=-1
  else RetVal:=0;
  CompareItems:=RetVal;
end;

procedure TFormRptDolgSummy.Button1Click(Sender: TObject);
 var savnmes,savnsrv:integer;
     i_nsrv  : integer;
     Curr_Person : Person_Ptr;
     Curr_Add : Add_ptr;
     RecDS   : PRecDS;
     Kod     : INTEGER;
     i,j     : Integer;
     finded,fnd  : Boolean;
     Summa   : Real;
     TabnoItem:PTabnoItem;
begin
     if NameServList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны подразделения');
             Exit;
        end;
     if KategList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны категории');
             Exit;
        end;
     if GruppyList.CountSelected<=0 then
        begin
             ShowMessage('Не выбраны счета');
             Exit;
        end;
     for i:=1 to max_gruppa     do curr_gruppa[i]     := false;
     for i:=1 to max_kategorija do curr_kategorija[i] := false;
     for i:=1 to KategList.Count do
         if KategList.IsSelected(i) then
            curr_kategorija[i]:=true;
     for i:=1 to GruppyList.Count do
         if GruppyList.IsSelected(i) then
            curr_gruppa[i]:=true;

     savnmes := nmes;
     savnsrv := nsrv;
     putinf;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     List:=TList.Create;
     for i_nsrv:=1 to count_serv do
         begin
              ProgressBar1.Position:=i_nsrv;
              nsrv:=i_nsrv;
              if not NameServList.IsSelected(NSRV) then continue;
              mkflnm;
              if not FileExists(fninf) then continue;
              getinf(true);
              curr_person:=head_person;
              while (curr_Person<>NIl) do
                begin
                    if not (Curr_Kategorija[Curr_Person^.Kategorija] and
                            Curr_Gruppa[Curr_Person^.Gruppa]) then
                       begin
                             Curr_Person:=Curr_Person^.NEXT;
                             Continue;
                       end;

                     Summa:=0;
                     Curr_Add:=Curr_Person^.Add;
                     while (Curr_Add<>Nil) do
                       begin
                            Summa:=Summa+Curr_Add^.Summa;
                            Curr_Add:=Curr_Add^.Next;
                       end;
                     if Abs(Summa)<0.001 then
                        begin
                             Curr_Person:=Curr_Person^.Next;
                             continue;
                        end;
                     kod:=GET_DOL_CODE(Curr_Person);
                     finded:=False;
                     if List.Count>0 then
                        for i:=0 to List.Count-1 do
                           begin
                                if PRecDS(List.Items[i]).kod=Kod then
                                   begin
                                        Finded:=True;
                                        Break;
                                   end;
                           end;
                     if not finded then
                        begin
                             New(RecDS);
                             RecDS.kod          := kod;
                             RecDS.namedol      := Name_Dolg_By_Shifr(Kod);
                             RecDS.summaosn     := 0;
                             RecDS.summaswmvnu  := 0;
                             RecDS.summaswmvne  := 0;
                             RecDS.summatot     := 0;
                             RecDS.TabnoListOsn := TList.Create;
                             RecDS.TabnoListVnu := TList.Create;
                             RecDS.TabnoListVne := TList.Create;
                             List.Add(RecDS);
                        end;
                     finded:=False;
                     if List.Count>0 then
                        for i:=0 to List.Count-1 do
                           begin
                                if PRecDS(List.Items[i]).kod=Kod then
                                   begin
                                        Finded:=True;
                                        Break;
                                   end;
                           end;
                     if finded then
                        begin
                             if  IS_OSN_WID_RABOTY(Curr_person) then
                                 begin
                                      PRecDS(List.Items[i]).summaosn:=PRecDS(List.Items[i]).summaosn+Summa;
                                      fnd:=False;
                                      if PRecDS(List.Items[i]).TabnoListOsn.Count>0 then
                                         for j:=0 to PRecDS(List.Items[i]).TabnoListOsn.Count-1 do
                                             if PTabnoItem(PRecDS(List.Items[i]).TabnoListOsn.Items[j]).Tabno=Curr_Person^.Tabno then
                                                begin
                                                     Fnd:=True;
                                                     Break;
                                                end;
                                      if not fnd then
                                         begin
                                              New(TabnoItem);
                                              TabnoItem.Tabno:=Curr_Person^.Tabno;
                                              PRecDS(List.Items[i]).TabnoListOsn.Add(TabnoItem);
                                         end;
                                 end
                             else
                             if  not STORONNEE_PODRAZD(Curr_person^.MESTO_OSN_RABOTY) then
                                 begin
                                      PRecDS(List.Items[i]).summaswmvnu:=PRecDS(List.Items[i]).summaswmvnu+Summa;
                                      fnd:=False;
                                      if PRecDS(List.Items[i]).TabnoListVnu.Count>0 then
                                         for j:=0 to PRecDS(List.Items[i]).TabnoListVnu.Count-1 do
                                             if PTabnoItem(PRecDS(List.Items[i]).TabnoListVnu.Items[j]).Tabno=Curr_Person^.Tabno then
                                                begin
                                                     Fnd:=True;
                                                     Break;
                                                end;
                                      if not fnd then
                                         begin
                                              New(TabnoItem);
                                              TabnoItem.Tabno:=Curr_Person^.Tabno;
                                              PRecDS(List.Items[i]).TabnoListVnu.Add(TabnoItem);
                                         end;
                                 end
                             else
                                 begin
                                      PRecDS(List.Items[i]).summaswmvne:=PRecDS(List.Items[i]).summaswmvne+Summa;
                                      fnd:=False;
                                      if PRecDS(List.Items[i]).TabnoListVne.Count>0 then
                                         for j:=0 to PRecDS(List.Items[i]).TabnoListVne.Count-1 do
                                             if PTabnoItem(PRecDS(List.Items[i]).TabnoListVne.Items[j]).Tabno=Curr_Person^.Tabno then
                                                begin
                                                     Fnd:=True;
                                                     Break;
                                                end;
                                      if not fnd then
                                         begin
                                              New(TabnoItem);
                                              TabnoItem.Tabno:=Curr_Person^.Tabno;
                                              PRecDS(List.Items[i]).TabnoListVne.Add(TabnoItem);
                                         end;
                                 end;
                             PRecDS(List.Items[i]).summatot:=PRecDS(List.Items[i]).summaosn+
                                                             PRecDS(List.Items[i]).summaswmvnu+
                                                             PRecDS(List.Items[i]).summaswmvne;
                        end;
                     Curr_Person:=Curr_Person^.NEXT;
                end;
              EMPTY_ALL_PERSON;
         end;
     if List.Count>0 then
        begin
               List.Sort(@CompareItems);
         //    frxUserDataSetSl.RangeBegin := rbFirst;
         //    frxUserDataSetSl.RangeEnd   := rbLast;
             frxUserDataSetDS.RangeEndCount := List.Count;
             frxReportDS.ShowReport;
          //   frxReportLaserDS.ShowReport;
             for i:=0 to List.Count-1 do
                 begin
                       if PRecDS(List.Items[i]).TabnoListOsn.Count>0 then
                          for j:=0 to PRecDS(List.Items[i]).TabnoListOsn.Count-1 do
                              Dispose(PTabnoItem(PRecDS(List.Items[i]).TabnoListOsn.Items[j]));
                       PRecDS(List.Items[i]).TabnoListOsn.Free;
                       if PRecDS(List.Items[i]).TabnoListVnu.Count>0 then
                          for j:=0 to PRecDS(List.Items[i]).TabnoListVnu.Count-1 do
                              Dispose(PTabnoItem(PRecDS(List.Items[i]).TabnoListVnu.Items[j]));
                       PRecDS(List.Items[i]).TabnoListVnu.Free;
                       if PRecDS(List.Items[i]).TabnoListVne.Count>0 then
                          for j:=0 to PRecDS(List.Items[i]).TabnoListVne.Count-1 do
                              Dispose(PTabnoItem(PRecDS(List.Items[i]).TabnoListVne.Items[j]));
                       PRecDS(List.Items[i]).TabnoListVne.Free;
                       Dispose(PRecDS(List.Items[i]));
                 end;
        end;
     List.Free;
     nsrv    := savnsrv;
     nmes    := savnmes;
     mkflnm;
     GetInf(true);
     Self.Close;
end;

procedure TFormRptDolgSummy.frxUserDataSetDSFirst(Sender: TObject);
begin
      i_count:=0;
end;

procedure TFormRptDolgSummy.frxUserDataSetDSNext(Sender: TObject);
begin
      inc(i_count);
end;

procedure TFormRptDolgSummy.frxUserDataSetDSGetValue(const VarName: String;
  var Value: Variant);
begin
     if CompareText(VarName,'kod')=0 then
        Value:=PRecDS(List.Items[i_count])^.kod
     else if CompareText(VarName,'namedol')=0 then
             Value:=PRecDS(List.Items[i_count])^.namedol
     else if CompareText(VarName,'kwoosn')=0 then
             Value:=PRecDS(List.Items[i_count])^.TabnoListOsn.Count
     else if CompareText(VarName,'kwovnu')=0 then
             Value:=PRecDS(List.Items[i_count])^.TabnoListVnu.Count
     else if CompareText(VarName,'kwovne')=0 then
             Value:=PRecDS(List.Items[i_count])^.TabnoListVne.Count
     else if CompareText(VarName,'kwotot')=0 then
             Value:=PRecDS(List.Items[i_count])^.TabnoListOsn.Count+
                    PRecDS(List.Items[i_count])^.TabnoListVnu.Count+
                    PRecDS(List.Items[i_count])^.TabnoListVne.Count
     else if CompareText(VarName,'osn')=0 then
             Value:=PRecDS(List.Items[i_count])^.summaosn
     else if CompareText(VarName,'sowmvnu')=0 then
             Value:=PRecDS(List.Items[i_count])^.summaswmvnu
     else if CompareText(VarName,'sowmvne')=0 then
             Value:=PRecDS(List.Items[i_count])^.summaswmvne
     else if CompareText(VarName,'tot')=0 then
             Value:=PRecDS(List.Items[i_count])^.summatot;
end;

procedure TFormRptDolgSummy.frxUserDataSetDSCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin
      if i_Count>List.Count-1 then Eof:=true
      else eof:=false;
end;

procedure TFormRptDolgSummy.frxReportDSGetValue(const VarName: String;
  var Value: Variant);
begin
      if CompareText(VarName,'month')=0 then
         Value:=GetMonthRus(nmes)
      else if CompareText(VarName,'year')=0 then
         Value:=CurrYear;
end;



procedure TFormRptDolgSummy.btn1Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

procedure TFormRptDolgSummy.frxReportLaserDSGetValue(const VarName: String;
  var Value: Variant);
begin
      if CompareText(VarName,'month')=0 then
         Value:=GetMonthRus(nmes)
      else if CompareText(VarName,'year')=0 then
         Value:=CurrYear;

end;
begin
  CntFormRptDS:=0;

end.
