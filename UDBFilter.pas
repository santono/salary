unit UDBFilter;

interface
   uses DB;
   type
    TDBFilter=class
                DataSet:TDataSet;
                function Execute(Form:TObject):Boolean;virtual;abstract;
              end;
    TDBPodrFilter=class(TDBFilter)
                   function Execute(Form:TObject):Boolean;override;
                 end;
    TDBDataFilter=class(TDBFilter)
                   function Execute(Form:TObject):Boolean;override;
                 end;
    TDBDataZamDecFilter=class(TDBFilter)
                   function Execute(Form:TObject):Boolean;override;
                 end;

implementation
 uses UFormUnivBrowse,UPODataModule, Controls, SysUtils, Forms,
      UFormAskData,DateUtils;
    function TDBPodrFilter.Execute(Form:TObject):Boolean;
      var RetVal:Boolean;
          FUB:TFormUnivBrowse;
          ShifrPod:Integer;
      begin
           RetVal:=false;
           FUB:=TFormUnivBrowse.Make(nil,dmPO.dsPodr,'ShifrPod','Укажите подразделение',ChoiceRecord,cmManualClose);
           if FUB.ShowModal=mrOk then
              begin
                   ShifrPod:=dmPO.pFIBdsPodrSHIFRPOD.Value;
                //   DataSet.Params[0].AsInteger:=ShifrPod;
                   DataSet.Filter:='SHIFR_POD='+IntToStr(ShifrPod);
                   if (Form is TForm) then
                       TForm(Form).Caption:='Кадры '+trim(dmPO.pFIBdsPodrNAME_K.Value);
                   DataSet.Filtered:=True;
                   dmPO.pFIBdsPodr.Close;
                   dmPO.pFIBdsPodr.Transaction.Commit;
                   FUB.Free;
                   RetVal:=True;
                   Execute:=RetVal;
              end
             else
                 begin
                     FUB.Free;
                     DataSet.Filtered:=False;
                     if (Form is TForm) then
                         TForm(Form).Caption:='Кадры';

                 end;
           Execute:=RetVal;
      end;

 function TDBDataFilter.Execute(Form:TObject):Boolean;
      var RetVal:Boolean;
          FormAskData:TFormAskData;
          WantedData:TDateTime;
          Y,m,d:word;
          s,sf,ms:string;
      begin
           RetVal:=false;
           Application.CreateForm(TFormAskData,FormAskData);
           if FormAskData.ShowModal=mrOk then
              begin
                   WantedData:=FormAskData.GetData();
                   Decodedate(WantedData,y,m,d);
                   ms:=IntToStr(m);
                   if (m<10) then
                      ms:='0'+ms;
                //   s:=IntToStr(y)+'.'+IntToStr(m)+'.01';
                   s:='01.'+ms+'.'+IntToStr(y);
                   sf:='DATEFR='+QuotedStr(S);
                //   sf:='DATEFR=WantedData';
                   DataSet.Filter:=sf;
                   if (Form is TForm) then
                       TForm(Form).Caption:='Штатные расписания на '+trim(s);
                   DataSet.Filtered:=True;
            //       dmPO.pFIBdsPodr.Close;
            //       dmPO.pFIBdsPodr.Transaction.Commit;
                   FormAskData.Free;
                   RetVal:=True;
                   Execute:=RetVal;
              end
             else
                 begin
                      FormAskData.Free;
                      DataSet.Filtered:=False;
                      if (Form is TForm) then
                         TForm(Form).Caption:='Все штатные расписания';

                 end;
           Execute:=RetVal;
      end;
      
    function TDBDataZamDecFilter.Execute(Form:TObject):Boolean;
      var RetVal:Boolean;
          FormAskData:TFormAskData;
          WantedData:TDateTime;
          Y,m,d:word;
          s,sf,ms:string;
      begin
           RetVal:=false;
           Application.CreateForm(TFormAskData,FormAskData);
           if FormAskData.ShowModal=mrOk then
              begin
                   WantedData:=FormAskData.GetData();
                   Decodedate(WantedData,y,m,d);
                   ms:=IntToStr(m);
                   if (m<10) then
                      ms:='0'+ms;
                //   s:=IntToStr(y)+'.'+IntToStr(m)+'.01';
                   s:='01.'+ms+'.'+IntToStr(y);
                   sf:='DATEFR='+QuotedStr(S);
                //   sf:='DATEFR=WantedData';
                   DataSet.Filter:=sf;
                   if (Form is TForm) then
                       TForm(Form).Caption:='Список деканов на '+trim(s);
                   DataSet.Filtered:=True;
                   dmPO.pFIBdsZamDec.Close;
                   dmPO.pFIBdsZamDec.Transaction.Commit;
                   FormAskData.Free;
                   RetVal:=True;
                   Execute:=RetVal;
              end
             else
                 begin
                      FormAskData.Free;
                      DataSet.Filtered:=False;
                      if (Form is TForm) then
                         TForm(Form).Caption:='Список деканов';

                 end;
           Execute:=RetVal;
      end;
end.
