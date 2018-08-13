unit UPoSpr;

interface
    type
   TSprEditor=class
               public
                 procedure StartWUSSpr;
                 procedure StartWUZSpr;
                 procedure StartWUSPrSpr;
                 procedure StartWNSpr;
                 procedure StartWNSSpr(Sender:TObject);
                 procedure StartPodrSpr;
                 procedure StartShtatRaspPed;
                 procedure StartShtatRaspPedRec(Sender:TObject);
                 procedure StartShtatRaspPedRpt(Sender:TObject);
                 procedure StartOrderBrowse;
                 procedure StartConvertOrderToWord(Sender:TObject);
                 procedure StartWidyZasl;
                 procedure StartExlSpr;
                 procedure StartFacSpr;
                 procedure StartZamDecSpr;


              end;
   var SprEditor:TSprEditor;
implementation
    uses UPODataModule,UFormUnivBrowse,ActnList,UFormMakeOrderToWord,UFormShtRaspRecUpd,
         UFormShtRaspRpt, UDBFilter, UFormUpdFac , UFormUpdZamDec;

 procedure BrowseShtRasrRecsStarter;
  begin
       SprEditor.StartShtatRaspPedRec(Nil);
  end;

 procedure TSprEditor.StartWUSSpr;
  var FUB:TFormUnivBrowse;
  begin
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsWUS,'ShifrId','���� ������ ��������',UpdateByFields,cmAutomaticClose);
       FUB.ShowModal;
  end;
 procedure TSprEditor.StartWNSSpr(Sender:TObject);
  var FUB:TFormUnivBrowse;
  begin
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsWNS,'ShifrId','������ ��������',UpdateByFields,cmAutomaticClose);
       FUB.ShowModal;
  end;
 procedure TSprEditor.StartWNSpr;
  var FUB:TFormUnivBrowse;
      ac:TAction;
  begin
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsWN,'ShifrId','���� ��������',UpdateByFields,cmAutomaticClose);
       ac:=TAction.Create(Nil);
       ac.Caption:='������ ��������';
       ac.OnExecute:=StartWNSSpr;
       FUB.AddPopUpItemAction(ac);
       FUB.ShowModal;
  end;

 procedure TSprEditor.StartWUZSpr;
  var FUB:TFormUnivBrowse;
  begin
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsWUZ,'ShifrId','���� ������ ������',UpdateByFields,cmAutomaticClose);
       FUB.ShowModal;
  end;

 procedure TSprEditor.StartWUSPrSpr;
  var FUB:TFormUnivBrowse;
  begin
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsWUSPr,'ShifrId','��������� ������������� ������ ��������',UpdateByFields,cmAutomaticClose);
       FUB.ShowModal;
  end;

 procedure TSprEditor.StartPodrSpr;
  var FUB:TFormUnivBrowse;
  begin
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsPodr,'ShifrPod','��� �������� ������������� ��� ��������',UpdateByFields,cmAutomaticClose);
       FUB.ShowModal;
  end;

 procedure TSprEditor.StartShtatRaspPedRpt(Sender:TObject);
  begin
       FormShtRaspRpt:=TFormShtRaspRpt.Create(Nil);
       FormShtRaspRpt.ShowModal;
  end;

 procedure TSprEditor.StartShtatRaspPedRec(Sender:TObject);
  var FUB:TFormUnivBrowse;
      ac:TAction;

  begin
       dmPO.pFIBdsPodr.Transaction.StartTransaction;
       dmPO.pFIBdsPodr.Open;
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsShtatRaspPedRec,'ShifrId','������',UpdateByRecord,cmAutomaticClose,true);   // true - �������� ������
       FormShtRaspRecUpd:=TFormShtRaspRecUpd.Create(Nil);
       FUB.SetUpdateForm(FormShtRaspRecUpd);
       ac:=TAction.Create(Nil);
       ac.Caption:='������';
       ac.OnExecute:=StartShtatRaspPedRpt;
       FUB.AddPopUpItemAction(ac);

       FUB.ShowModal;
       FormShtRaspRecUpd.Free;
       dmPO.pFIBdsPodr.Close;
       dmPO.pFIBdsPodr.Transaction.Commit;
  end;

 procedure TSprEditor.StartShtatRaspPed;
  var FUB:TFormUnivBrowse;
      ac,ac1:TAction;
      DataFilter:TDBDataFilter;
  begin
 //      FUB:=TFormUnivBrowse.Make(nil,dmPO.dsShtatRaspPed,'ShifrId','������� ���������� ���',UpdateByRecord,cmAutomaticClose,true); // �������� ������ ������������
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsShtatRaspPed,'ShifrId','������� ���������� ���',CallChildBrowse,cmAutomaticClose,true); // �������� ������ ������������
       FUB.SetChildBrowse(BrowseShtRasrRecsStarter);
       ac:=TAction.Create(Nil);
       ac.Caption:='������';
       ac.OnExecute:=StartShtatRaspPedRec;
       FUB.AddPopUpItemAction(ac);
       ac1:=TAction.Create(Nil);
       ac1.Caption:='������';
       ac1.OnExecute:=StartShtatRaspPedRpt;

       FUB.AddPopUpItemAction(ac1);
       DataFilter:=TDBDataFilter.Create;
       DataFilter.DataSet:=dmPO.pFIBdsShtatRasPed;
       FUB.SetFilter(DataFilter);
       FUB.ShowModal;
  end;

 procedure TSprEditor.StartOrderBrowse;
  var FUB:TFormUnivBrowse;
      ac:TAction;
  begin
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsOrder,'ShifrId','�������',UpdateByFields,cmAutomaticClose);
       ac:=TAction.Create(Nil);
       ac.Caption:='������������� � MS Word';
       ac.OnExecute:=StartConvertOrderToWord;
       FUB.AddPopUpItemAction(ac);
       FUB.ShowModal;
  end;

 procedure TSprEditor.StartConvertOrderToWord(Sender:TObject);
//  var FormMakeOrderToWord:TFormMakeOrderToWord;
  begin
       FormMakeOrderToWord:=TFormMakeOrderToWord.Create(Nil);
       FormMakeOrderToWord.ShowModal;
  end;

 procedure TSprEditor.StartWidyZasl;
  var FUB:TFormUnivBrowse;
  begin
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsWidyZasl,'ShifrId','³�� ���������� ������',UpdateByFields,cmAutomaticClose);
       FUB.ShowModal;
  end;

 procedure TSprEditor.StartExlSpr;
  var FUB:TFormUnivBrowse;
  begin
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsExl,'ShifrId','���������� ��� ������� ������',UpdateByFields,cmAutomaticClose);
       FUB.ShowModal;
  end;

 procedure TSprEditor.StartFacSpr;
  var FUB:TFormUnivBrowse;
  begin
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsFacList,'ShifrId','���������� �����������',UpdateByRecord,cmAutomaticClose,True);
       FormUpdFac:=TFormUpdFac.Create(Nil);
       FUB.SetUpdateForm(FormUpdFac);
       FUB.ShowModal;
       FormUpdFac.Free;

  end;

 procedure TSprEditor.StartZamDecSpr;
  var FUB:TFormUnivBrowse;
      DataZamDecFilter:TDBDataZamDecFilter;
  begin
       dmPO.pFIBdsFacList.Open;
       dmPO.pFIBdsKadry.Open;
       FUB:=TFormUnivBrowse.Make(nil,dmPO.dsZamDec,'ShifrId','������ � ���.������',UpdateByRecord,cmAutomaticClose,True);
       FormUpdZamDec:=TFormUpdZamDec.Create(Nil);
       FUB.SetUpdateForm(FormUpdZamDec);
       DataZamDecFilter:=TDBDataZamDecFilter.Create;
       DataZamDecFilter.DataSet:=dmPO.pFIBdsZamDec;
       FUB.SetFilter(DataZamDecFilter);

       FUB.ShowModal;
       FormUpdZamDec.Free;
       dmPO.pFIBdsKadry.Close;
       dmPO.pFIBdsFacList.Close;

  end;


end.
