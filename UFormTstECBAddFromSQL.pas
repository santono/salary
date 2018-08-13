unit UFormTstECBAddFromSQL;
                      
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase,
  StdCtrls;

type
  TFormTstECBAddFromSQL = class(TForm)
    ProgressBar1: TProgressBar;
    pFIBQuery: TpFIBQuery;
    pFIBTransaction: TpFIBTransaction;
    LabelFIO: TLabel;
    pFIBTransactionWrite: TpFIBTransaction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    List:TStringList;
    { Private declarations }
  public
    procedure Execute;
    procedure SetList(List:TStringList);
    { Public declarations }
  end;

var
  FormTstECBAddFromSQL: TFormTstECBAddFromSQL;

implementation
    uses UFormRptTstECB,uFIBModule,ScrDef,uFormWait;

{$R *.dfm}

procedure TFormTstECBAddFromSQL.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      Action:=caFree;
end;

procedure TFormTstECBAddFromSQL.Execute;
 var sc,i:Integer;
     y,m,tabno:Integer;
     SQLStmnt:string;
     SummaECB    , SummaAdd    : Real;
     SummaECBN   , SummaAddN   : Real;
     SummaECBDP  , SummaAddDP  : Real;
     SummaECBIll , SummaAddIll : Real;
     SummaPodUd  , SummaPodAdd : Real;
     RecECB:PRecECB;
  function BuildStrKey(Tabno:Integer;Y:Integer;m:integer):string;
   begin
        BuildStrKey:=IntToStr(Tabno)+' '+IntToStr(Y)+' '+IntToStr(M);
   end;

 begin
      if Self.List.Count<1 then Close;
      ListOth:=TStringList.Create;
      pFIBQuery.Transaction:=pFIBTransactionWrite;
      if pFIBQuery.Transaction.Active then
         pFIBQuery.Transaction.Commit;
      pFIBQuery.Transaction.StartTransaction;
      SQLStmnt:='delete from person where yearvy='+IntToStr(CurrYear)+' and monthvy='+IntToStr(nmes);
      if pFIBQuery.Open then
         pFIBQuery.Close;
      pFIBQuery.SQL.Clear;
      pFIBQuery.SQL.Add(SQLStmnt);
      FormWait.Show;
      pFIBQuery.ExecQuery;
      FormWait.Hide;
      pFIBQuery.Close;
      pFIBQuery.Transaction.Commit;
      pFIBQuery.Transaction:=pFIBTransaction;
      pFIBQuery.Transaction.StartTransaction;

      ProgressBar1.Min:=0;
      ProgressBar1.Max:=Self.List.Count;
      ProgressBar1.Position:=0;
      for i:=0 to Self.List.Count-1 do
          begin
               Inc(sc);
               SummaECB    := 0;
               SummaAdd    := 0;
               SummaECBN   := 0;
               SummaAddN   := 0;
               SummaECBDP  := 0;
               SummaAddDP  := 0;
               SummaECBIll := 0;
               SummaAddIll := 0;
               SummaPodUd  := 0;
               SummaPodAdd := 0;
               ProgressBar1.Position:=sc;
               LabelFIO.Caption := PRecECB(Self.List.Objects[i]).fio;
               Application.ProcessMessages;
               y:=PRecECB(Self.List.Objects[i]).Y;
               m:=PRecECB(Self.List.Objects[i]).M;
               TABNO:=PRecECB(Self.List.Objects[i]).TABNO;
               SQLStmnt:='select summaadd,summaecb from getecbnachud_common('+IntToStr(Tabno)+','+IntToStr(Y)+','+IntToStr(m)+',0,0,0,0)';
               if pFIBQuery.Open then
                 pFIBQuery.Close;
               pFIBQuery.SQL.Clear;
               pFIBQuery.SQL.Add(SQLStmnt);
               pFIBQuery.ExecQuery;
               SummaAdd:=pFIBQuery.Fields[0].AsFloat;
               SummaECB:=pFIBQuery.Fields[1].AsFloat;
               pFIBQuery.Close;
               if tabno=144 then
                  tabno:=144;
               SQLStmnt:='select summaadd,summaecb from getecbnnachud_common('+IntToStr(Tabno)+','+IntToStr(Y)+','+IntToStr(m)+',0,0,0,0)';
               if pFIBQuery.Open then
                 pFIBQuery.Close;
               pFIBQuery.SQL.Clear;
               pFIBQuery.SQL.Add(SQLStmnt);
               pFIBQuery.ExecQuery;
               SummaAddN:=pFIBQuery.Fields[0].AsFloat;
               SummaECBN:=pFIBQuery.Fields[1].AsFloat;
               pFIBQuery.Close;
               if tabno=1453 then
                  tabno:=tabno;
               SQLStmnt:='select summaadd,summaecb from getecbdpnachud_common('+IntToStr(Tabno)+','+IntToStr(Y)+','+IntToStr(m)+',0,0,0,0)';
               if pFIBQuery.Open then
                 pFIBQuery.Close;
               pFIBQuery.SQL.Clear;
               pFIBQuery.SQL.Add(SQLStmnt);
               pFIBQuery.ExecQuery;
               SummaAddDP:=pFIBQuery.Fields[0].AsFloat;
               SummaECBDP:=pFIBQuery.Fields[1].AsFloat;
               pFIBQuery.Close;
               SQLStmnt:='select summaadd,summaecbill from getecbillnachud_common('+IntToStr(Tabno)+','+IntToStr(Y)+','+IntToStr(m)+',0,0,0,0)';
               if pFIBQuery.Open then
                 pFIBQuery.Close;
               pFIBQuery.SQL.Clear;
               pFIBQuery.SQL.Add(SQLStmnt);
               pFIBQuery.ExecQuery;
               SummaAddIll:=pFIBQuery.Fields[0].AsFloat;
               SummaECBIll:=pFIBQuery.Fields[1].AsFloat;
               pFIBQuery.Close;
               SQLStmnt:='select summaadd,summapod from getpodnachud_common('+IntToStr(Tabno)+','+IntToStr(Y)+','+IntToStr(m)+',0,0,0,0)';
               if pFIBQuery.Open then
                 pFIBQuery.Close;
               pFIBQuery.SQL.Clear;
               pFIBQuery.SQL.Add(SQLStmnt);
               pFIBQuery.ExecQuery;
               SummaPodAdd := pFIBQuery.Fields[0].AsFloat;
               SummaPodUd  := pFIBQuery.Fields[1].AsFloat;
               pFIBQuery.Close;
               if (abs(SummaAdd)>0.01)    or
                  (abs(SummaEcb)>0.01)    or
                  (abs(SummaAddN)>0.01)   or
                  (abs(SummaEcbN)>0.01)   or
                  (abs(SummaAddDP)>0.01)  or
                  (abs(SummaEcbDP)>0.01)  or
                  (abs(SummaAddIll)>0.01) or
                  (abs(SummaEcbIll)>0.01) or
                  (abs(SummaPodAdd)>0.01) or
                  (abs(SummaPodUd)>0.01)  then
                  begin
                       New(RecECB);
                       FillChar(RecECB^,SizeOf(RecECB^),0);
                       RecECB^.Y   := Y;
                       RecECB^.M   := M;
                       RecECB^.tabno   := TABNO;
                       RecECB^.fio     := LabelFIO.Caption;
                       RecECB^.SummaNAdd      := SummaAddN;
                       RecECB^.SummaNMaxAdd   := 0;
                       RecECB^.SummaECBN      := SummaEcbN;
                       RecECB^.SummaAdd       := SummaAdd;
                       RecECB^.SummaMaxAdd    := 0;
                       RecECB^.SummaECB       := SummaECB;
                       RecECB^.SummaDPAdd     := SummaECBDp;
                       RecECB^.SummaDPMaxAdd  := 0;
                       RecECB^.SummaDPECB     := SummaECBDp;
                       RecECB^.SummaIllAdd    := SummaAddIll;
                       RecECB^.SummaIllMaxAdd := 0;
                       RecECB^.SummaIllECB    := SummaECbIll;
                       RecECB^.SummaPodAdd    := SummaPodAdd;
                       RecECB^.SummaPodFakt   := SummaPodUd;
                       ListOth.AddObject(BuildStrKey(Tabno,y,m),TObject(RecECB));
                  end;

          end;
      pFIBQuery.Transaction.Commit;

      Self.Close;
 end;
 procedure TFormTstECBAddFromSQL.SetList(List:TStringList);
  begin
       Self.List:=List;
  end;

end.
