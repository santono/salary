unit UFormAwansVerirficationByPerson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, DB, DBClient,
  dxExEdtr, ExtCtrls, DBCtrls, dxCntner, dxTL, dxDBCtrl, dxDBGrid, ComCtrls;

type
  TFormAwansVerirficationByPerson = class(TForm)
    dsoValidate: TDataSource;
    cdsValidate: TClientDataSet;
    trRead: TpFIBTransaction;
    qAwans: TpFIBQuery;
    cdsValidateid: TIntegerField;
    cdsValidatetabno: TIntegerField;
    cdsValidateFIO: TStringField;
    cdsValidateshifrpod: TIntegerField;
    cdsValidateshifrgru: TIntegerField;
    cdsValidatenamegru: TStringField;
    cdsValidateshifrsta: TIntegerField;
    cdsValidatesummafixed: TFloatField;
    cdsValidatesummacurr: TFloatField;
    dxDBGridValidate: TdxDBGrid;
    DBNavigator1: TDBNavigator;
    dxDBGridValidateid: TdxDBGridMaskColumn;
    dxDBGridValidatetabno: TdxDBGridMaskColumn;
    dxDBGridValidateFIO: TdxDBGridMaskColumn;
    dxDBGridValidateshifrpod: TdxDBGridMaskColumn;
    dxDBGridValidateshifrgru: TdxDBGridMaskColumn;
    dxDBGridValidatenamegru: TdxDBGridMaskColumn;
    dxDBGridValidateshifrsta: TdxDBGridMaskColumn;
    dxDBGridValidatesummafixed: TdxDBGridMaskColumn;
    dxDBGridValidatesummacurr: TdxDBGridMaskColumn;
    ProgressBar1: TProgressBar;
  private
    wantedShifrGru : integer;
    wantedShifrSta : integer;
    wantedOwnerId  : integer;
    { Private declarations }
    procedure fillCurrInfo;
  public
    { Public declarations }
    constructor Init(AOwner:TComponent;id:integer;shifrgru:integer;shifrsta:integer);
    procedure createValidationSwod;

  end;

var
  FormAwansVerirficationByPerson: TFormAwansVerirficationByPerson;

implementation
  uses UFibModule,scrdef,scrutil,scrio,scrlists;

{$R *.dfm}

  type pRec=^tRec;
       tRec=record
             tabno      : integer;
             shifrpod   : integer;
             shifrsta   : integer;
             shifrgru   : integer;
             summafixed : real;
             summacurr  : real;
            end;

  var list:TList;
constructor TFormAwansVerirficationByPerson.Init(AOwner:TComponent;id:integer;shifrgru:integer;shifrsta:integer);
 begin
      Self.Create(AOwner);
      wantedShifrGru:=shifrGru;
      wantedShifrSta:=shifrSta;
      wantedOwnerId:=id;
      Caption:='Проверка несовпадения выплат. Статья '+intToStr(shifrSta)+'. Cчет '+get_ist_name(shifrgru);
 end;

procedure TFormAwansVerirficationByPerson.createValidationSwod;
 var SQLStmnt:string;
     rec:pRec;
     i:integer;
     isRecs:boolean;
 begin
      shifrList.ClearAllSelected;
      list:=TList.Create;
      SQLStmnt:='select a.tabno,a.w_place,sum(a.summa),count(*) from tb_saved_awans_det a';
      SQLStmnt:=SQLStmnt+' where a.shifridowner='+intToStr(wantedOwnerId)+' and shifrsta='+intToSTr(wantedShifrSta)+' and shifrgru='+intToSTr(wantedShifrGru);
      SQLStmnt:=SQLStmnt+' group by 1,2';
      qAwans.SQL.Clear;
      qAwans.SQL.Add(SQLStmnt);
      qAwans.Transaction.StartTransaction;
      qAwans.ExecQuery;
      while (not qAwans.Eof) do
        begin
             rec := new(pRec);
             rec^.tabno         := qAwans.Fields[0].Value;
             rec^.shifrpod      := qAwans.Fields[1].Value;
             rec^.shifrgru      := wantedShifrGru;
             rec^.shifrsta      := wantedShifrSta;
             rec^.summafixed    := qAwans.Fields[2].Value;
             rec^.summacurr     := 0;
             list.Add(rec);
             shifrList.SetSelected(rec^.shifrsta);
             qAwans.Next;
        end;
      qAwans.Close;
      qAwans.Transaction.commit;
      fillCurrInfo;
      cdsValidate.Open;
      isRecs:=false;
      if list.count>0 then
         for i:=1 to list.count do
            if abs(abs(pRec(list.items[i-1])^.summacurr)-abs(pRec(list.items[i-1])^.summafixed))>0.05 then
                begin
                  isRecs:=true;
                  cdsValidate.Append;
                  cdsValidatetabno.value:=pRec(list.items[i-1])^.tabno;
                  cdsValidateshifrsta.value:=pRec(list.items[i-1])^.shifrsta;
                  cdsValidateshifrgru.value:=pRec(list.items[i-1])^.shifrgru;
                  cdsValidatesummafixed.value:=pRec(list.items[i-1])^.summafixed;
                  cdsValidatesummacurr.value:=pRec(list.items[i-1])^.summacurr;
                  cdsValidatenamegru.value:=GET_IST_NAME(pRec(list.items[i-1])^.shifrgru);
                  cdsValidateFIO.value:=short_fio(GetFullRusFioPerson(pRec(list.items[i-1])^.tabno));
                  cdsValidateid.value:=i;
                  cdsValidate.Post;
                end;
      FreeAndNil(list);
      if not isRecs then
         showMessage('Нет несовпадений');

 end;
procedure TFormAwansVerirficationByPerson.fillCurrInfo;
  var tmpNSRV,tmpNMES:integer;
      curr_person:person_ptr;
      curr_ud:ud_ptr;
      i_nsrv : integer;
      rec:Prec;
    procedure addUdToList;
     var i:integer;
         finded:boolean;
     begin
          finded:=false;
          if list.Count>0 then
             for i:=1 to list.Count do
                 if pRec(list.Items[i-1])^.tabno=curr_person^.tabno then
                 if pRec(list.Items[i-1])^.shifrgru=self.wantedShifrGru then
                 if pRec(list.Items[i-1])^.shifrsta=curr_ud^.shifr then
                 if pRec(list.Items[i-1])^.shifrpod=NSRV then
                    begin
                         finded:=true;
                         prec(list.Items[i-1])^.summacurr:=r10(r10(prec(list.Items[i-1])^.summacurr)+r10(curr_ud^.summa));
                         break;
                    end;
          if not finded then
             begin
                  rec:=new(pRec);
                  rec^.shifrsta   := self.wantedShifrSta;
                  rec^.shifrgru   := self.wantedShifrGru;
                  rec^.summafixed := 0;
                  rec^.summacurr  := curr_ud^.SUMMA;
                  rec^.tabno      := curr_person^.TABNO;
                  rec^.shifrpod   := nsrv;
                  list.Add(rec);
             end;
     end;
  begin
      tmpNSRV:=NSRV;
      PUTINF;
      EMPTY_ALL_PERSON;
      ProgressBar1.show;

      ProgressBar1.Min:=0;
      progressBar1.Max:=count_serv;
      progressBar1.Position:=0;
      ProgressBar1.Step:=1;

      for i_nsrv:=1 to COUNT_SERV do
          begin
            progressBar1.StepIt;
            application.ProcessMessages;
            nsrv:=i_nsrv;
            mkflnm;
            if not fileexists(fninf) then continue;
            getinf(false);
            curr_person:=head_person;
            while (curr_person<>nil) do
              begin
                   if curr_person^.gruppa=self.wantedShifrGru then
                      begin
                           curr_ud:=curr_person^.ud;
                           while (curr_ud<>nil) do
                              begin
                                   if (curr_ud.VYPLACHENO=get_out) then
                                   if (curr_ud^.shifr=self.wantedShifrSta) then
                                      addUdToList;
                                   curr_ud:=curr_ud^.NEXT;
                              end;
                      end;
                   curr_person:=curr_person^.NEXT;
              end;
            EMPTY_ALL_PERSON;

          end;
//      list.Sort(@compare);
      NSRV:=tmpNSRV;
      MKFLNM;
      GETINF(TRUE);
      ProgressBar1.Hide;
  end;

end.
