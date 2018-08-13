unit UFormFimdUwolPerson;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, DB, FIBDataSet, pFIBDataSet,
  StdCtrls, Buttons, ComCtrls;

type
  TFormFimdUwolPerson = class(TForm)
    dsoUwol: TDataSource;
    dsUwol: TpFIBDataSet;
    trRead: TpFIBTransaction;
    trWrite: TpFIBTransaction;
    dsUwolINN: TFIBStringField;
    dsUwolFIO: TFIBStringField;
    dsUwolFIO_KADRY: TFIBStringField;
    dsUwolFAM: TFIBStringField;
    dsUwolNAM: TFIBStringField;
    dsUwolOTC: TFIBStringField;
    dsUwolREASON: TFIBStringField;
    dsUwolDAY_UW: TFIBSmallIntField;
    dsUwolID: TFIBSmallIntField;
    dsoKadry: TDataSource;
    dsKadry: TpFIBDataSet;
    trKadryRead: TpFIBTransaction;
    dsKadryTABNO: TFIBIntegerField;
    dsKadryFIO: TFIBStringField;
    dsKadryNAL_CODE: TFIBStringField;
    dsKadrySHIFR_POD: TFIBIntegerField;
    dsKadryPIB: TFIBStringField;
    ProgressBar1: TProgressBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    dsUwolTABNO: TFIBIntegerField;
    procedure BitBtn1Click(Sender: TObject);
  private
    procedure performSearch;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFimdUwolPerson: TFormFimdUwolPerson;

implementation
   uses UFibModule,ScrUtil,UPadegDLL,UFuzzyCompare;
  type PPersonDB=^TPersonDB;
       TPersonDB=record
                   FAM:string;
                   NAM:string;
                   OTC:string;
                   Tabno:Integer;
                   INN:string;
                   RodPadFIO:string;
                 end;
   var              
       listp:TList;

{$R *.dfm}

procedure TFormFimdUwolPerson.BitBtn1Click(Sender: TObject);
begin
     performSearch;
     ShowMessage('Готово');
end;

procedure TFormFimdUwolPerson.performSearch;
 var rodpadfio,fio,fam,nam,otc:shortstring;
     personDB:PPersonDB;
     sc:Integer;
  function fuzzyFindPerson(fio:string):PPersonDB;
   var retVal:PPersonDB;
       i:Integer;
       fiol:string;

   function fuzzyCompare(str1,Str2:string):Boolean;
     var retVal:Boolean;
         find:longWord;
     begin
          retVal:=False;
          if AnsiUpperCase(Copy(str1,1,1))<>AnsiUpperCase(Copy(str2,1,1)) then
             begin
                 retVal:=False;
                 fuzzyCompare:=retVal;
                 Exit;
             end;
          Find := IndistinctMatching(3,  str1, str2);
          IF  Find > 50 Then
              retVal:=True;
         fuzzyCompare:=retVal;
     end;

   begin
         retVal     := nil;
         for i:=0 to listp.Count-1 do
            begin
                 fiol:=PPersonDB(listp.items[i]).rodpadfio;
                 fiol:=Trim(fiol);
                 fiol:=AnsiUpperCase(fiol);
                 if (fuzzyCompare(fio,fiol)) then
                    begin
                         retVal:=PPersonDB(listp.items[i]);
                         Break;
                    end;
            end;
         fuzzyFindPerson := retVal;
   end;

  function findPersonByTabno(tabno:integer):PPersonDB;
   var retVal:PPersonDB;
       i:Integer;
       tabnol:integer;
   begin
         retVal     := nil;
         for i:=0 to listp.Count-1 do
            begin
                 tabnol:=PPersonDB(listp.items[i]).Tabno;
                 if (tabno=tabnol) then
                    begin
                         retVal:=PPersonDB(listp.items[i]);
                         Break;
                    end;
            end;
         findPersonByTabno := retVal;
   end;

  function findPerson(fio:string):PPersonDB;
   var retVal:PPersonDB;
       i:Integer;
       fiol:string;
   begin
         retVal     := nil;
         for i:=0 to listp.Count-1 do
            begin
                 fiol:=PPersonDB(listp.items[i]).rodpadfio;
                 fiol:=Trim(fiol);
                 fiol:=AnsiUpperCase(fiol);
                 if (fio=fiol) then
                    begin
                         retVal:=PPersonDB(listp.items[i]);
                         Break;
                    end;
            end;
         findPerson := retVal;
   end;
begin
     dsKadry.StartTransaction;
     dsKadry.Active:=True;
     listp:=TList.Create;
     label1.caption:='Формирование списка';
     Application.ProcessMessages;
     while (not dsKadry.Eof) do
       begin
            New(personDB);
            personDB.Tabno:=dsKadryTABNO.Value;
            personDB.INN := dsKadryNAL_CODE.Value;
            fio:=dsKadryFIO.Value;
            fio:=Trim(FIO);
            fio:=AnsiUpperCase(fio);
            SplitFIO(FIO,FAM,NAM,OTC);
            personDB.fam:=fam;
            personDB.nam:=nam;
            personDB.otc:=otc;
            personDB.fam:=fam;
            rodpadfio:=getRoditPadegFIO(FIO);
            personDB.rodpadfio:=AnsiUpperCase(Trim(rodpadfio));
            listp.add(personDB);

            dsKadry.Next;
       end;
     sc:=0;
     dsKadry.Active:=False;
     dsKadry.Transaction.Commit;
     dsUwol.Transaction.StartTransaction;
     dsUwol.Active:=True;
     while (not dsUwol.Eof) do
       begin
            inc(sc);
//            if ((dsUwolTABNO.IsNull)
//                 or ((dsUwolTABNO.Value>50000))
//               )   then
            if dsUwolTABNO.Value<0 then
              begin
            fio:=dsUwolFIO.Value;
            fio:=Trim(fio);
            fio:=AnsiUpperCase(fio);
            Label1.Caption:=IntToStr(sc)+' '+fio;
            Application.ProcessMessages;
//            personDb:=findPerson(FIO);
//            personDb:=fuzzyFindPerson(FIO);
            personDb:=findPersonByTabno(-dsUwolTABNO.Value);
            if personDB<>nil then
               begin
                    dsUwol.Edit;
                    dsUwolTABNO.Value:=personDB.Tabno+50000;
                    dsUwolINN.Value:=personDB.INN;
                    dsUwolFIO_KADRY.VALUE:=personDB.RodPadFIO;
                    dsUwolFAM.VALUE:=personDB.FAM;
                    dsUwolNAM.VALUE:=personDB.NAM;
                    dsUwolOTC.VALUE:=personDB.OTC;
                    dsUwol.Post;

               end;
               end;
            dsUwol.Next;
       end;
     dsUwol.Active:=False;
     dsUwol.Transaction.Commit;
     if dsUwol.UpdateTransaction.Active then
       dsUwol.UpdateTransaction.Commit;
end;


end.
