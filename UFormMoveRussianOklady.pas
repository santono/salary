unit UFormMoveRussianOklady;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  StdCtrls, ComCtrls, Buttons;

type
  TFormMoveRussianOklady = class(TForm)
    dsDolg: TpFIBDataSet;
    trRead: TpFIBTransaction;
    dsDolgSHIFRIDDOLOG: TFIBIntegerField;
    dsDolgNAMEDOLG: TFIBStringField;
    dsDolgSUMMA: TFIBBCDField;
    dsDolgAMNT: TFIBIntegerField;
    dsDolgSHIFRDOLRUS: TFIBIntegerField;
    ProgressBar1: TProgressBar;
    LabelPodr: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsDolgOKLAD: TFIBBCDField;
    BitBtn3: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
    maked:Boolean;
    function  fillList:Boolean;
    procedure makeFilling;
    function  getShifrRusDol(shifrDol:integer):Integer;
    function  getOkladForRusDol(shifrDol:integer):double;


  public
    { Public declarations }
  end;

var
  FormMoveRussianOklady: TFormMoveRussianOklady;

implementation

{$R *.dfm}

 USes UFibModule,ScrDef,ScrIo,ScrUtil, UFormSelPKG,ScrLists;

 type pRec = ^TRec;
      TRec = record
               shifrdol:Integer;
               shifrRusDol:Integer;
               oklad:Double;
             end;
  var list:TList;
procedure TFormMoveRussianOklady.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;
function TFormMoveRussianOklady.fillList:Boolean;
 var rec:pRec;
      
 begin
      fillList:=False;
      list:=TList.Create;
      dsDolg.Transaction.StartTransaction;
      dsDolg.Open;
      dsDolg.First;
      while not dsDolg.Eof do
        begin
             New(rec);
             Rec^.shifrdol:=dsDolgSHIFRIDDOLOG.Value;
             Rec^.oklad:=dsDolgOKLAD.Value;
             Rec^.shifrRusDol:=dsDolgSHIFRDOLRUS.Value;
             list.add(rec);
             dsDolg.Next;
        end;
      dsDolg.Close;
      dsDolg.Transaction.Commit;
      if list.count>0 then
         fillList:=True;
 end;
function TFormMoveRussianOklady.getShifrRusDol(shifrDol:integer):Integer;
 var i,shifrRusDol:Integer;
     finded:Boolean;
 begin
      getShifrRusDol:=0;
      finded:=False;
      for i:=0 to list.Count-1 do
        if PRec(list.Items[i])^.shifrdol=shifrDol then
           begin
                finded:=True;
                shifrRusDol:=PRec(list.Items[i])^.shifrRusDol;
                getShifrRusDol:=shifrRusDol;
                Break;
           end;
 end;

function TFormMoveRussianOklady.getOkladForRusDol(shifrDol:integer):double;
 var i:Integer;
     oklad:double;
     finded:Boolean;
 begin
      getOkladForRusDol:=0.00;
      finded:=False;
      for i:=0 to list.Count-1 do
        if PRec(list.Items[i])^.shifrdol=shifrDol then
           begin
                finded:=True;
                oklad:=PRec(list.Items[i])^.oklad;
                getOkladForRusDol:=oklad;
                Break;
           end;
 end;
procedure TFormMoveRussianOklady.FormCreate(Sender: TObject);
begin
     if not ((FLOW_MONTH=6) and (WORK_YEAR_VAL=2023)) then
        BitBtn1.Enabled:=False;
     LabelPodr.Caption:='';
     Application.ProcessMessages;   
end;

procedure TFormMoveRussianOklady.makeFilling;
 var savNMES,savNSRV,i_nsrv:Integer;
     curr_person:PERSON_PTR;
 procedure FillPerson(curr_person:person_ptr);
  var shifrDol,shifrRusDol:Integer;
      oklad:double;
      koef:Double;
  procedure blockNadbawkiPerson;
    var curr_cn:CN_PTR;
    begin
         curr_cn:=curr_person^.CN;
         while (curr_cn<>nil) do
           begin
                  if ShifrList.IsSelected(curr_cn^.shifr) then
//                if curr_cn^.SHIFR in [7,8,17,18,22,30,33,41,164,167,168] then
                   curr_cn^.automatic:=manual_mode;
                curr_cn:=curr_cn^.Next;
           end;
    end;
  procedure deleteNadbawkiPerson;
    var curr_add:add_PTR;
        finished:Boolean;
    begin
         while True do
          begin
               finished:=True;
               curr_add:=curr_person^.add;
               while (curr_add<>nil) do
                 begin
                     if ShifrList.IsSelected(curr_add^.shifr) then
                     //^.SHIFR in [7,8,17,18,22,30,33,41,164,167,168] then
                     if curr_add^.PERIOD=6 then
                     if curr_add^.VYPLACHENO<>get_out then
                        begin
                             DEL_ADD(curr_add,curr_person);
                             finished:=false;
                             Break;
                        end;
                     curr_add:=curr_add^.NEXT;
                 end;
               if finished then Break;
          end;
    end;
  begin
       if curr_person^.oklad<1.00 then
          Exit;
       shifrDol:=GET_DOL_CODE(curr_person);
       koef:=GET_KOEF_OKLAD_PERSON(curr_person);
       if koef<0.005 then
          Exit;
       if shifrDol<10 then Exit;
       if ((shifrDol=1500) or
           (shifrDol=1510)) then Exit;
       shifrRusDol:=getShifrRusDol(shifrDol);
       if shifrRusDol<1 then exit;
       oklad:=getOkladForRusDol(shifrDol);
       if oklad<1000.00 then Exit;
       oklad:=R10(oklad*koef);
       curr_person^.OKLAD:=oklad;
       blockNadbawkiPerson;
       deleteNadbawkiPerson;
       MAKE_RUS_DOL_PERSON(curr_person,shifrRusDol);
       maked:=True;
  end;

 begin
      savNMES:=NMES;
      savNSRV:=NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.Min:=0;
      ProgressBar1.Max:=Count_Serv;
      ProgressBar1.Step:=1;
      Application.ProcessMessages;
      for i_nsrv:=1 to Count_Serv do
          begin
               ProgressBar1.StepIt;
               LabelPodr.Caption:=Name_Serv(i_nsrv);
               Application.ProcessMessages;
               nsrv:=i_nsrv;
               if not NameServList.IsSelected(nsrv) then Continue;
               MKFLNM;
               if not FileExists(fninf) then
                  Continue;
               maked:=False;
               GETINF(true);
               if COUNT_PERSON<1 then Continue;
               curr_person:=HEAD_PERSON;
               while (curr_person<>nil) do
                 begin
                      if KategList.IsSelected(curr_person^.KATEGORIJA) then
                      if GruppyList.IsSelected(curr_person^.Gruppa) then
                         FillPerson(curr_person);
                      curr_person:=curr_person^.NEXT;
                 end;
               if maked then
                  PUTINF;
               EMPTY_ALL_PERSON;
          end;

      NMES:=savNMES;
      NSRV:=savNSRV;
      MKFLNM;
      GETINF(true);

 end;
procedure TFormMoveRussianOklady.BitBtn1Click(Sender: TObject);
begin
     if not ((FLOW_MONTH=6) and (WORK_YEAR_VAL=2023)) then
        begin
             ShowMessage('Запустить можно только в июне 2023 г.');
             Exit;
        end;
     if NameServList.CountSelected<=0 then
       begin
            ShowMessage('Не выбраны подразделения');
            Exit;
       end;
     if GruppyList.CountSelected<=0 then
       begin
            ShowMessage('Не выбраны счета');
            Exit;
       end;
     if KategList.CountSelected<=0 then
       begin
            ShowMessage('Не выбраны категории');
            Exit;
       end;
     if ShifrList.CountSelected<=0 then
       begin
            ShowMessage('Не выбраны надбавки для удаления');
            Exit;
       end;

     if not fillList then
        begin
             ShowMessage('Ошибка иницbализацит списка должностей');
             Exit;
        end;
     makeFilling;

end;

procedure TFormMoveRussianOklady.BitBtn3Click(Sender: TObject);
begin
    Application.CreateForm(TFormSelPKG, FormSelPKG);
    FormSelPKG.ShowModal;
end;

end.
