{$WARNINGS OFF}
{$HINTS OFF}
unit UFormListDblVpl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxCntner, dxEditor, dxExEdtr, dxEdLib, StdCtrls, ComCtrls, Grids,
  ExtCtrls;

type
  TFormListDblVpl = class(TForm)
    StringGridDblVpl: TStringGrid;
    ProgressBar1: TProgressBar;
    Button1: TButton;
    Label1: TLabel;
    dxCalcEditSta: TdxCalcEdit;
    RadioGroupAdd: TRadioGroup;
    Mode: TGroupBox;
    chkPeriod: TCheckBox;
    chkSumma: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    ShifrSta:integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormListDblVpl: TFormListDblVpl;

implementation
  uses ScrDef,ScrIo,ScrUtil,ScrLists;

  type
      PRecDblVpl=^TRecDblVpl;
      TRecDblVpl=record
                  tabno       : integer;
                  shifrpod    : integer;
                  FIO         : string;
                  DolgName    : string;
                  NmbOfRec    : integer;
                 end;
    var ListDblVpl:TList;


{$R *.dfm}

procedure TFormListDblVpl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormListDblVpl.FormCreate(Sender: TObject);
begin
     ShifrSta:=102;
end;

procedure TFormListDblVpl.Button1Click(Sender: TObject);
 type PCmpRecord=^TCmpRecord;
      TCmpRecord=record
                  period : Integer;
                  summa  : Real;
                 end;

 var NsrvSav,NmesSav : integer;
     i_Nsrv,I    : integer;
     Curr_Person : Person_Ptr;
     Curr_Ud     : Ud_Ptr ;
     N           : integer;
     RecDblVpl   : PRecDblVpl;
     k,l         : integer;
     s           : string ;
     modeAdd     : Boolean;
     Curr_Add    : ADD_PTR;
     needPeriod  : Boolean;
     needSumma   : Boolean;
     list        : TList  ;
     function existInPeriod(Period:integer):Boolean;
      var i:Integer;
          retVal:Boolean;
      begin
           retVal:=false;
           if (list.Count>0) then
              for i:=0 to list.count-1 do
                  if pCmpRecord(list.Items[i]).period=Period then
                     begin
                          retVal:=True;
                          Break;
                     end;
           existInPeriod:=retVal;
      end;
     function existInSumma(Period:integer;Summa:real):Boolean;
      var i:Integer;
          retVal:Boolean;
      begin
           retVal:=false;
           if (list.Count>0) then
              for i:=0 to list.count-1 do
                  if pCmpRecord(list.Items[i]).period=Period then
                  if abs(abs(pCmpRecord(list.Items[i]).summa)-abs(Summa))<0.01 then
                     begin
                          retVal:=True;
                          Break;
                     end;
           existInSumma:=retVal;
      end;
     procedure addToList(period:Integer;summa:Real);
       var i:Integer;
           finded:Boolean;
           pCmpRec : PCmpRecord;
       begin
            if list.count>0 then
               begin
                     finded:=false;
                     for i:=0 to list.count-1 do
                         if PCmpRecord(list.Items[i]).period=period then
                         if Abs(abs(PCmpRecord(list.Items[i]).summa)-Abs(summa))<0.01 then
                            begin
                                 finded:=true;
                                 break;
                            end;
               end;
            if finded then Exit;
            New(pCmpRec)             ;
            pCmpRec.period := period ;
            pCmpRec.summa  := summa  ;
            list.Add(pCmpRec);
       end;

begin
      if RadioGroupAdd.ItemIndex=1 then
        modeAdd:=False
     else
        modeAdd := True;

     s:=dxCalcEditSta.Text;
     val(s,k,l);
     if l<>0 then
        begin
             ShowMessage('Неверно указан шифр статьи.');
             Exit;
        end;
     ShifrSta:=k;
     if not ShifrList.IsAdd(ShifrSta) and modeAdd then
        begin
             ShowMessage('Неверно указан шифр статьи начисления.');
             Exit;
        end
     else
     if ShifrList.IsAdd(ShifrSta) and not modeAdd then
        begin
             ShowMessage('Неверно указан шифр статьи удержания.');
             Exit;
        end;
     needPeriod := False;
     needSumma  := False;
     if chkPeriod.Checked then
        needPeriod:=True;
     if chkSumma.Checked then
        needSumma:=True;

     NsrvSav  := NSRV;
     NmesSav  := NMES;
     ListDblVpl := TList.Create;
     putinf;
     EMPTY_ALL_PERSON;
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     for i_nsrv:=1 to Count_Serv do
         begin
              nsrv:=i_nsrv;
              mkflnm;
              ProgressBar1.Position:=i_nsrv;
              Application.ProcessMessages;
              if not FileExists(FnInf) then continue;
              getinf(true);
              curr_Person:=Head_Person;
              while (Curr_Person<>Nil) do
                begin
                     n:=0;
                     list:=TList.Create;
                     if ModeAdd then
                        begin
                             Curr_Add:=Curr_Person^.Add;
                             while (Curr_Add<>Nil) do
                               begin
                     if ((Curr_Person.tabno=1356) and (Curr_Add.shifr=5)) then
                        Curr_Person.tabno:=1356;
                                   if Curr_Add^.Shifr=ShifrSta then
                                   if (needPeriod and existInPeriod(Curr_Add^.PERIOD)) or not needPeriod  then
                                   if (needSumma and existInSumma(Curr_Add^.PERIOD,Curr_Add^.Summa)) or not needSumma  then
                                       n:=n+1;
                                   if ((needPeriod) or (needSumma)) then
                                   if Curr_Add.SHIFR=ShifrSta then
                                      addToList(Curr_Add^.Period,Curr_Add^.Summa);
                                   Curr_Add:=Curr_Add^.NEXT;
                               end;
                        end
                     else
                        begin
                             Curr_Ud:=Curr_Person^.UD;
                             while (Curr_Ud<>Nil) do
                                begin
                                     if Curr_Ud^.Shifr=ShifrSta then n:=n+1;
                                     if (needPeriod and existInPeriod(Curr_Ud^.PERIOD)) or not needPeriod  then
                                     if (needSumma and existInSumma(Curr_Ud^.PERIOD,Curr_Ud^.Summa)) or not needSumma  then
                                         n:=n+1;
                                    if ((needPeriod) or (needSumma)) then
                                    if Curr_Ud.SHIFR=ShifrSta then
                                       addToList(Curr_Ud^.Period,Curr_Ud^.Summa);
                                     Curr_Ud:=Curr_Ud^.NEXT;
                                end;
                        end;
                     if ((n>1) or ((n=1) and (needPeriod or needSumma))) then
                        begin
                             new(RecDblVpl);
                             RecDblVpl^.tabno     := Curr_Person^.TABNO;
                             RecDblVpl^.FIO       := Curr_Person^.Fio;
                             RecDblVpl^.shifrpod  := NSRV;
                             RecDblVpl^.DolgName  := Curr_Person^.Dolg;
                             RecDblVpl^.NmbOfRec  := n;
                             ListDblVpl.Add(RecDblVpl);
                        end;
                     Curr_Person:=Curr_Person^.NEXT;
                     if list.Count>0 then
                        for i:=0 to list.Count-1 do
                            Dispose(PCmpRecord(list.Items[i]));
                    list.Free;
                end;
              EMPTY_ALL_PERSON;
         end;
     if ListDblVpl.Count>0 then
        begin
             StringGridDblVpl.ColCount:=6;
             StringGridDblVpl.RowCount:=ListDblVpl.Count+1;
             StringGridDblVpl.Cells[0,0]:='№';
             StringGridDblVpl.Cells[1,0]:='Пдр';
             StringGridDblVpl.Cells[2,0]:='Т.н.';
             StringGridDblVpl.Cells[3,0]:='ФИО';
             StringGridDblVpl.Cells[4,0]:='Должность';
             StringGridDblVpl.Cells[5,0]:='К-во';
             for i:=0 to ListDblVpl.Count-1 do
                 begin
                      StringGridDblVpl.Cells[0,i+1]:=IntToStr(i+1);
                      StringGridDblVpl.Cells[1,i+1]:=IntToStr(PRecDblVpl(ListDblVpl.Items[i])^.ShifrPod);
                      StringGridDblVpl.Cells[2,i+1]:=IntToStr(PRecDblVpl(ListDblVpl.Items[i])^.Tabno);
                      StringGridDblVpl.Cells[3,i+1]:=PRecDblVpl(ListDblVpl.Items[i])^.FIO;
                      StringGridDblVpl.Cells[4,i+1]:=PRecDblVpl(ListDblVpl.Items[i])^.DolgName;
                      k:=PRecDblVpl(ListDblVpl.Items[i])^.NmbOfRec;
                      StringGridDblVpl.Cells[5,i+1]:=Format('%d',[k]);
                 end;

        end
     else
        ShowMessage('Нет двойных выплат');
     ProgressBar1.Max:=Count_Serv;
     ProgressBar1.Min:=0;
     ProgressBar1.Position:=0;
     Application.ProcessMessages;
     ListDblVpl.Free;
     NSRV:=NsrvSav;
     Nmes:=NmesSav;
     mkflnm;
     getinf(true);
end;

end.
