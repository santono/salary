{$H-}
{$WARNINGS OFF}
{$HINTS OFF}
program DScroll;

uses
  Windows,
  Forms,
  SysUtils,
  Dialogs,
  Salary in 'Salary.pas' {MainForm},
  ScrDef in 'ScrDef.pas',
  FormPodrU in 'FormPodrU.pas' {FormPodr},
  ScrIo in 'ScrIo.pas',
  ScrIni in 'ScrIni.pas',
  ScrLini in 'ScrLini.pas',
  ScrLists in 'ScrLists.pas',
  FormShifrU in 'FormShifrU.pas' {FormShifr},
  ScrExport in 'ScrExport.pas',
  UToSQL in 'UToSQL.pas' {FormToSQL},
  uDBF in 'uDBF.pas' {FormDBF},
  ScrNetwork in 'ScrNetwork.pas',
  uCKadry in 'uCKadry.pas' {frmKadry},
  FormNmesU in 'FormNmesU.pas' {FormNmes},
  FormAddUdU in 'FormAddUdU.pas' {FormAdd},
  FormSelShifrU in 'FormSelShifrU.pas' {FormSelShifr},
  FormUpdAddU in 'FormUpdAddU.pas' {FormUpdateAdd},
  FormSortU in 'FormSortU.pas' {FormSort},
  FormUpdUdU in 'FormUpdUdU.pas' {FormUpdateUd},
  FormKadryU in 'FormKadryU.pas' {FormKadry},
  ClarUnit in 'ClarUnit.pas',
  KadClU in 'KadClU.pas',
  FormKadryClU in 'FormKadryClU.pas' {FormKadryCl},
  FormSowmU in 'FormSowmU.pas' {FormSowm},
  FormCNU in 'FormCNU.pas' {FormCN},
  UFibModule in 'UFibModule.pas' {FIB: TDataModule},
  FormUpdCnU in 'FormUpdCnU.pas' {FormUpdCN},
  Clarion in 'Clarion.pas',
  FormKadryFindU in 'FormKadryFindU.pas' {FormFindKadry},
  FormTabelU in 'FormTabelU.pas' {FormTabel},
  ScrNalog in 'ScrNalog.pas',
  SQlConnectU in 'SQlConnectU.pas' {FormSQLConnect},
  UFormShow in 'UFormShow.pas' {FormShowCalc},
  ScrSwod in 'ScrSwod.pas',
  ScrUtil in 'ScrUtil.pas',
  uFormMkPensList in 'uFormMkPensList.pas' {FormMkPensList},
  USelSwodMode in 'USelSwodMode.pas' {FormSwodMode},
  UFormView in 'UFormView.pas' {FormViewASCII},
  uFormArc in 'uFormArc.pas' {FormArc},
  uFrmFindKadryFB in 'uFrmFindKadryFB.pas' {FormFindKadryFB},
  uFormBoln in 'uFormBoln.pas' {FormBoln},
  UFormUpdBoln in 'UFormUpdBoln.pas' {FormUpdBoln},
  uFormEditIPodr in 'uFormEditIPodr.pas' {FormEditIPodr},
  UFORMEDITIKAT in 'UFORMEDITIKAT.pas' {FormEditiKat},
  UFORMEDITPRZB in 'UFORMEDITPRZB.pas' {FormEditPrzB},
  Uformbolkoe in 'Uformbolkoe.pas' {FormBolKoe},
  uFormTmpBolna in 'uFormTmpBolna.pas' {FormBolnA},
  uFormOtp in 'uFormOtp.pas' {FormOtp},
  uFormUpdOtp in 'uFormUpdOtp.pas' {FormUpdOtp},
  uFormTmpOtpA in 'uFormTmpOtpA.pas' {FormOtpA},
  uFormWait in 'uFormWait.pas' {FormWait},
  uFormMovBol in 'uFormMovBol.pas' {FormMovBol},
  UFormUpdAdd in 'UFormUpdAdd.pas' {FormUpdAdd},
  UFormRecalc in 'UFormRecalc.pas' {FormRecalc},
  ScrLera in 'ScrLera.pas',
  UFormSelLera in 'UFormSelLera.pas' {FormSelLeraSwodMode},
  UFormProgress in 'UFormProgress.pas' {FormProgress},
  UFORMBUH in 'UFORMBUH.pas' {FormOpe},
  SplashForm in 'SplashForm.pas' {AboutBox},
  UFormBolnAbo in 'UFormBolnAbo.pas' {FormBolnAbo},
  UFormBlnABo in 'UFormBlnABo.pas' {FormBlnAbo},
  UFormRecalcPPSSFZ in 'UFormRecalcPPSSFZ.pas' {FormRecalcPPSZ},
  Uformselpod in 'Uformselpod.pas' {FormSelPodr},
  UFormEditPodr in 'UFormEditPodr.pas' {FormEditPodr},
  UFormEditGru in 'UFormEditGru.pas' {FormEditGruppy},
  UFormEditShifr in 'UFormEditShifr.pas' {FormEditShifr},
  UFormMemBud in 'UFormMemBud.pas' {FormMemBud},
  FormKafGruU in 'FormKafGruU.pas' {FormSwodKafGru},
  UFormUpdUd in 'UFormUpdUd.pas' {FormUpdUd},
  UFormUpdateCn in 'UFormUpdateCn.pas' {FormUpdateCn},
  FormAlimU in 'FormAlimU.pas' {FormAlim},
  UPrivat in 'UPrivat.pas',
  FormRListU in 'FormRListU.pas' {FormRList},
  FormIndexU in 'FormIndexU.pas' {FormIndex},
  uFormOtpAbo in 'uFormOtpAbo.pas' {FormOtpAbo},
  PrevInst in 'PrevInst.pas',
  USMessages in 'USMessages.pas',
  UFormPlatGen in 'UFormPlatGen.pas' {FormPlatGen},
  UFormPlatReestr in 'UFormPlatReestr.pas' {FormPlatReestr},
  TextPrinter in 'TextPrinter.pas',
  UFormSelPKG in 'uformselpkg.pas' {FormSelPKG},
  UFormListVypl in 'UFormListVypl.pas' {FormListVypl},
  FormUpdAlimU in 'FormUpdAlimU.pas' {FormUpdAlim},
  FormSwodAlimU in 'FormSwodAlimU.pas' {FormSwodAlim},
  FormRecalcPersonU in 'FormRecalcPersonU.pas' {FormTestRecalcPerson},
  UFormSwodGt2660 in 'UFormSwodGt2660.pas' {FormSwodGt2660},
  uFormSwodSS in 'uFormSwodSS.pas' {FormSwodSS},
  UFormSwodTemy in 'UFormSwodTemy.pas' {FormSwodTemy},
  uFormMovOtp in 'uFormMovOtp.pas' {FormMovOtp},
  FormMovUkrFioU in 'FormMovUkrFioU.pas' {FormMovUkrFIO},
  FormAutoRepU in 'FormAutoRepU.pas' {FormAutoRep},
  FormPersonoficU in 'FormPersonoficU.pas' {FormPersonofic},
  FormPersPrU in 'FormPersPrU.pas' {FormPersPr},
  FormRazrU in 'FormRazrU.pas' {FormRazr},
  FormMakePensU in 'FormMakePensU.pas' {FormMakePens},
  FormMovRecalc08U in 'FormMovRecalc08U.pas' {FormMovRecalc08},
  FindCompare in 'FindCompare.pas',
  FormMakeAllChainU in 'FormMakeAllChainU.pas' {FormMakeAllChain},
  FormShowRecalcPersonU in 'FormShowRecalcPersonU.pas' {FormShowRecalcPerson},
  FormParSalU in 'FormParSalU.pas' {FormParSal},
  FormYSprU in 'FormYSprU.pas' {FormYSpr},
  FormGenYU in 'FormGenYU.pas' {FormGenYSpr},
  FormKreditSprU in 'FormKreditSprU.pas' {FormKreditSpr},
  FormGenKreditU in 'FormGenKreditU.pas' {FormGenKredit},
  FormUpdKreditSprU in 'FormUpdKreditSprU.pas' {FormUpdKreditSpr},
  FormFRXAutoSwodU in 'FormFRXAutoSwodU.pas' {FormFRXAutoSwod},
  USprModule in 'USprModule.pas' {DataModuleSPR: TDataModule},
  UFormMinSal in 'UFormMinSal.pas' {FormMinSalSpr},
  UFormEditPensProcNalogPrep in 'UFormEditPensProcNalogPrep.pas' {FormEditPensProcNalogPrep},
  UFormEditPodohTBL in 'UFormEditPodohTBL.pas' {FormEditPodohTBL},
  HSHintComboBox in 'HSHintComboBox.pas',
  UFormMonthsHea in 'UFormMonthsHea.pas' {FormMonthsHea},
  UFormMonthsPr in 'UFormMonthsPr.pas' {FormMonthPr},
  UFormMakeAwans in 'UFormMakeAwans.pas' {FormMakeAwans},
  UFormRecalcPodr in 'UFormRecalcPodr.pas' {FormRecalcPodr},
  UFormWaitMess in 'UFormWaitMess.pas' {FormWaitMess},
  UFormMpSwod in 'UFormMpSwod.pas' {FormMPSwod},
  UFormDolg in 'UFormDolg.pas' {FormDolg},
  uFormSelParentBoln in 'uFormSelParentBoln.pas' {FormSelParentBoln},
  uFormIGruppy in 'uFormIGruppy.pas' {FormIGruppy},
  uFormEditGruGru in 'uFormEditGruGru.pas' {FormEditGruGru},
  uFormEdirDayClock in 'uFormEdirDayClock.pas' {FormEditDayClock},
  UFormRepairTableForOtp in 'UFormRepairTableForOtp.pas' {FormRepairTableForOtp},
  UFormEditSecretTabno in 'UFormEditSecretTabno.pas' {FormEditSecretTabno},
  UFormSelBay in 'UFormSelBay.pas' {FormSelBay},
  UFormSaveSelPodr in 'UFormSaveSelPodr.pas' {FormSaveSelPodr},
  UFormSelSelection in 'UFormSelSelection.pas' {FormSelSelection},
  UFormEditSelPodrList in 'UFormEditSelPodrList.pas' {FormEditSelPodrList},
  UFormEditChangeRazrGrid in 'UFormEditChangeRazrGrid.pas' {FormEditChangeRazrGrid},
  ULPTPrinter in 'ULPTPrinter.pas',
  FormEditParSelPlatU in 'FormEditParSelPlatU.pas' {FormEditParSelPlat},
  FormSelSppU in 'FormSelSppU.pas' {FormSelSPP},
  UFormEditTemy in 'UFormEditTemy.pas' {FormEditTemy},
  uFormPersMonthMenu in 'uFormPersMonthMenu.pas' {FormPersMonthMenu},
  UFormMovPFUToDBF in 'UFormMovPFUToDBF.pas' {FormMovPFUToDBF},
  DBF in 'DBF.pas',
  UFormGetDRFO in 'UFormGetDRFO.pas' {FormGetDRFO},
  uFormTestBoln in 'uFormTestBoln.pas' {FormTestBoln},
  UFormIndProc in 'UFormIndProc.pas' {FormIndProc},
  UFormMovOklToRazr in 'UFormMovOklToRazr.pas' {FormMoveNewOkladToRazr},
  UFormTestP4 in 'UFormTestP4.pas' {FormTestP4},
  UFormSetBaseData in 'UFormSetBaseData.pas' {FormSetBaseData},
  UFormSwodMNFR in 'UFormSwodMNFR.pas' {FormSwodMNFR},
  UForm1DF in 'UForm1DF.pas' {Form1DF},
  UFormGrid in 'UFormGrid.pas' {FormGrid},
  UFormPlanSwod in 'UFormPlanSwod.pas' {FormPlanSwod},
  UFormMarkPGKForOtp in 'UFormMarkPGKForOtp.pas' {FormMarkPGKForOtp},
  USelLists in 'USelLists.pas',
  UFormMakeOtpChoice in 'UFormMakeOtpChoice.pas' {FormMakeOtpChoice},
  UFormMakeAllGuid in 'UFormMakeAllGuid.pas' {FormMakeALLGuid},
  UFormGen in 'UFormGen.pas' {FormGen},
  UFormPivotDolg in 'UFormPivotDolg.pas' {FormPivotDolg},
  UFormSBSSpr in 'UFormSBSSpr.pas' {FormSBSSpr},
  UFormSBSUpd in 'UFormSBSUpd.pas' {FormSBSUpd},
  UFormSBSPr in 'UFormSBSPr.pas' {FormSbsPr},
  UFormSbsPrAdd in 'UFormSbsPrAdd.pas' {FormSbsPrAdd},
  UFormListPerepl in 'UFormListPerepl.pas' {FormListPerepl},
  UFormListDblVpl in 'UFormListDblVpl.pas' {FormListDblVpl},
  UFormTstGruPrsnAddUd in 'UFormTstGruPrsnAddUd.pas' {FormTstGruPrsnAddUd},
  uFormPrepRl in 'uFormPrepRl.pas' {FormPrepRl},
  UFormRecalcNalCurr in 'UFormRecalcNalCurr.pas' {FormRecalcNalCurr},
  UFormRptSL in 'UFormRptSL.pas' {FormRptSL},
  UFormSelPKGSave in 'UFormSelPKGSave.pas' {FormSelPKGSave},
  UFormDelWantedUd in 'UFormDelWantedUd.pas' {FormDelWantedUd},
  UFormMoveGUID in 'UFormMoveGUID.pas' {FormMoveGUID},
  UFormNotUkr in 'UFormNotUkr.pas' {FormNotUkr},
  UFormECBMonthMenu in 'UFormECBMonthMenu.pas' {FormECBMonthMenu},
  UFormMovECBtoDBF in 'UFormMovECBtoDBF.pas' {FormMovECBtoDBF},
  UFormTestE4 in 'UFormTestE4.pas' {FormTestE4},
  UFormSSNomera in 'UFormSSNomera.pas' {FormSSNomera},
  UFormReeBoln in 'UFormReeBoln.pas' {FormReeBoln},
  UFormReeBolPr in 'UFormReeBolPr.pas' {FormReeBolPr},
  UFormReeBolFill in 'UFormReeBolFill.pas' {FormReeBolPrFill},
  UFormRptTstECB in 'UFormRptTstECB.pas' {FormRptTstECB},
  UFormRecalcPECB in 'UFormRecalcPECB.pas' {FormRecalcPECB},
  UFormRptTstECB1 in 'UFormRptTstECB1.pas' {FormRptTstECB1},
  UFormRptWantedAdd in 'UFormRptWantedAdd.pas' {FormRptWantedAdd},
  UFormMakeALLTabel032011 in 'UFormMakeALLTabel032011.pas' {FormMakeALLTabel032011},
  UFormMakeTestECBAlla in 'UFormMakeTestECBAlla.pas' {FormMakeTestECBAlla},
  UFormTstOsnMR in 'UFormTstOsnMR.pas' {FormTstOsnMR},
  UFormGetDate in 'UFormGetDate.pas' {FormGetDate},
  UFormDelWantedECB in 'UFormDelWantedECB.pas' {FormDelWantedECB},
  UFormAnalyzeNalogi in 'UFormAnalyzeNalogi.pas' {FormAnalyzeNalogi},
  UFormSwodSwmMode in 'UFormSwodSwmMode.pas' {FormSwodSwmMode},
  UFormRptDolgSummy in 'UFormRptDolgSummy.pas' {FormRptDolgSummy},
  UFormRptSwodECB in 'UFormRptSwodECB.pas' {FormRptSwodECB},
  UFormMakeLgotyPNSwm in 'UFormMakeLgotyPNSwm.pas' {FormMakeLgotyPNSwm},
  UFormDelUdForWantedMonth in 'UFormDelUdForWantedMonth.pas' {FormDelUdForWantedMonth},
  UFormTstECBAddFromSQL in 'UFormTstECBAddFromSQL.pas' {FormTstECBAddFromSQL},
  UORecalcAbon in 'UORecalcAbon.pas',
  UCrc32 in 'UCrc32.pas',
  UFormRecalcNalPassPeriod in 'UFormRecalcNalPassPeriod.pas' {FormRecalcNalPass},
  UFormRestorePodr in 'UFormRestorePodr.pas' {FormRestorePodr},
  UFormRestorePodrFromDrive in 'UFormRestorePodrFromDrive.pas' {FormRestorePodrFromDrive},
  UFormPochasSwod in 'UFormPochasSwod.pas' {FormPochasSwod},
  UGetCurrSummmaTot in 'UGetCurrSummmaTot.pas',
  KadKprClU in 'KadKprClU.pas',
  UFormOtp1201 in 'UFormOtp1201.pas' {FormOtp1201},
  UFormRepairCNSQL in 'UFormRepairCNSQL.pas' {FormRepairCNSQL},
  UFormSelPodrPerson in 'UFormSelPodrPerson.pas' {FormSelPodrPerson},
  UFormMoveOtpHelp2010 in 'UFormMoveOtpHelp2010.pas' {FormMoveOtpHelp2010},
  UFormEkonom in 'UFormEkonom.pas' {FormEkonom},
  UFormMakeOtpTableFromSQL in 'UFormMakeOtpTableFromSQL.pas' {FormMakeOtpTableFromSQL},
  UFormInfProc in 'UFormInfProc.pas' {FormInfProc},
  UFormUnivBrowse in 'UFormUnivBrowse.pas' {FormUnivBrowse},
  USortAdd in 'USortAdd.pas',
  UFormSwodyCmp in 'UFormSwodyCmp.pas' {FormSwodyCmp},
  UFormSwodyCmpRes in 'UFormSwodyCmpRes.pas' {FormSwodyCmpRes},
  UFormTestDuplicates in 'UFormTestDuplicates.pas' {FormTestDuplicates},
  UFormKmndAbo in 'UFormKmndAbo.pas' {FormKmndAbo},
  UFormUpdKmnd in 'UFormUpdKmnd.pas' {FormUpdKmnd},
  UFormIndexUpdate in 'UFormIndexUpdate.pas' {FormIndexUpdate},
  UFormBrowseInd in 'UFormBrowseInd.pas' {FormBrowseInd},
  UCDSFactory in 'UCDSFactory.pas',
  UFormMovePod12Recalc in 'UFormMovePod12Recalc.pas' {FormMovePod12Recalc},
  UDuplTest in 'UDuplTest.pas',
  UFormDelRecen in 'UFormDelRecen.pas' {FormDelRecen},
  UFormDelAllCN in 'UFormDelAllCN.pas' {FormDelAllCN},
  UFormOtpUhod in 'UFormOtpUhod.pas' {FormOtpUhod},
  UFormMoveIskra in 'UFormMoveIskra.pas' {FormMoveIskra},
  UFormTestNadbPresent in 'UFormTestNadbPresent.pas' {FormTestNadbPresent},
  UMainFormCDS in 'UMainFormCDS.pas' {MainFormCDS},
  UFormBrowseKadryFB in 'UFormBrowseKadryFB.pas' {FormBrowseKadryFB},
  UFormUpdateKadry in 'UFormUpdateKadry.pas' {FormUpdateKadryFB},
  UFormBankDBFView in 'UFormBankDBFView.pas' {FormBankDBFView},
  UFormPersonMainState in 'UFormPersonMainState.pas' {FormPersonMainState},
  UMD5 in 'UMD5.pas',
  UFormGetUwolnDate in 'UFormGetUwolnDate.pas' {FormGetUwolnDate},
  UFormRepPensInv in 'UFormRepPensInv.pas' {FormRepPensInv},
  UFormMakeSZNadb2014 in 'UFormMakeSZNadb2014.pas' {FormMakeSZNadb2014},
  UFormReMakeSZNadb2014 in 'UFormReMakeSZNadb2014.pas' {FormReMakeSZNadb2014},
  ScrIOSQL in 'ScrIOSQL.pas',
  UFormShowPB in 'UFormShowPB.pas' {FormShowPB},
  UFormReturnSZNadb2014 in 'UFormReturnSZNadb2014.pas' {FormReturnSZNadb2014},
  UFormReMakeSZNMinus in 'UFormReMakeSZNMinus.pas' {FormReMakeSZNMinus},
  UFormSumLimit in 'UFormSumLimit.pas' {FormSumLimit},
  UFormUpdShifrAdd in 'UFormUpdShifrAdd.pas' {FormUpdShifrAdd},
  UFormListLogForDeti in 'UFormListLogForDeti.pas' {FormListLogForDeti},
  UFormUpdShifrUd in 'UFormUpdShifrUd.pas' {FormUpdShifrUd},
  UFormRptDolgHostel in 'UFormRptDolgHostel.pas' {FormRptDolgHostel},
  UFormMkOtp14 in 'UFormMkOtp14.pas' {FormMkOtp14},
  UFormAllAddUdForAbsenBank in 'UFormAllAddUdForAbsenBank.pas' {FormAllAddUdForAbsenBank},
  UFormMkOtp14_10 in 'UFormMkOtp14_10.pas' {FormMkOtp14_10},
  UFormMkEmpList in 'UFormMkEmpList.pas' {FormMkEmpList},
  UFormParNadb in 'UFormParNadb.pas' {FormParNadb},
  UFormToExcelKomend in 'UFormToExcelKomend.pas' {FormToExcelKomend},
  UFormYSprRec in 'UFormYSprRec.pas' {FormYSprRec},
  UFormSaveRestTabno in 'UFormSaveRestTabno.pas' {FormSaveRestTabno},
  UFormGetSaldo in 'UFormGetSaldo.pas' {FormGetSaldo},
  UFormTestIO in 'UFormTestIO.pas' {FormTestIO},
  UIOMonitor in 'UIOMonitor.pas',
  UFormRptPersonDolg in 'UFormRptPersonDolg.pas' {FormRptPersonDolg},
  UFormSwodTemyByPeriod in 'UFormSwodTemyByPeriod.pas' {FormSwodTemyByPeriod},
  UFormKindListLnr in 'UFormKindListLnr.pas' {FormKindListLnr},
  UFormShtRasp in 'UFormShtRasp.pas' {FormShtRasp},
  UFormSingleForDouble in 'UFormSingleForDouble.pas' {FormSingleForDouble},
  UForm1DFStipToXML in 'UForm1DFStipToXML.pas' {Form1DFStipToXML},
  UFormParams in 'UFormParams.pas' {FormParams},
  UFormRepSowmInOut in 'UFormRepSowmInOut.pas' {FormRepSowmInOut},
  UFormPrikazyBrowse in 'UFormPrikazyBrowse.pas' {FormPrikazyBrowse},
  UFormPrikazRekvizity in 'UFormPrikazRekvizity.pas' {FormPrikazRekvizity},
  UFormBrowsePrikazyTyp in 'UFormBrowsePrikazyTyp.pas' {FormBrowsePrikazyTyp},
  UFormUpdPriType in 'UFormUpdPriType.pas' {FormUpdPriType},
  UFormVyplLNR in 'UFormVyplLNR.pas' {FormVyplLNR},
  UFormVyplLNRUpd in 'UFormVyplLNRUpd.pas' {FormVyplLNRUpd},
  UFormMoveVyplFromExcel in 'UFormMoveVyplFromExcel.pas' {FormMoveVyplFromExcel},
  UFormTestGener in 'UFormTestGener.pas' {FormTestGener},
  UFormLessMinSal in 'UFormLessMinSal.pas' {FormLessMinSal},
  UFormVipTabno in 'UFormVipTabno.pas' {FormVipTabno},
  UFormSwodOtp in 'UFormSwodOtp.pas' {FormSwodOtp},
  UFormFindPerson in 'UFormFindPerson.pas' {FormFindPerson},
  UFormExportFroPlanLNR in 'UFormExportFroPlanLNR.pas' {FormExportFroPlanLNR},
  UFormSeekUwolReason in 'UFormSeekUwolReason.pas' {FormSeekUwolReason},
  UFormTestECB in 'UFormTestECB.pas' {FormTestECB},
  UFormDeponenty in 'UFormDeponenty.pas' {FormDeponenty},
  UFormPovLNR in 'UFormPovLNR.pas' {FormPovLNR},
  UFormRptTestPod in 'UFormRptTestPod.pas' {FormRptTestPod},
  UFormMovECBtoExcel in 'UFormMovECBtoExcel.pas' {FormMovECBtoExcel},
  UFormPers22SVDN in 'UFormPers22SVDN.pas' {FormPers22SVDN},
  UFormProfsojuzList in 'UFormProfsojuzList.pas' {FormProfsojuzList},
  UFormTestMissing in 'UFormTestMissing.pas' {FormTestMissing},
  UFormMovRecalc0416 in 'UFormMovRecalc0416.pas' {FormMovRecalc0416},
  UFormFRXAutoTable in 'UFormFRXAutoTable.pas' {FormFRXAutoTable},
  UFormExportKadryToMedok in 'UFormExportKadryToMedok.pas' {FormExportKadryToMedok},
  UFormDepartmentBrowse in 'UFormDepartmentBrowse.pas' {FormDepartmentBrowse},
  UFormDepUpdate in 'UFormDepUpdate.pas' {FormDepUpdate},
  UFormSubDepUpdate in 'UFormSubDepUpdate.pas' {FormSubDepUpdate},
  UFormTestRazr in 'UFormTestRazr.pas' {FormTestRazr},
  UFormClearBolnGenerators in 'UFormClearBolnGenerators.pas' {FormClearBolnGenerators},
  UFormFimdUwolPerson in 'UFormFimdUwolPerson.pas' {FormFimdUwolPerson},
  UFuzzyCompare in 'UFuzzyCompare.pas',
  UFormMakeAwansLNR in 'UFormMakeAwansLNR.pas' {FormMakeAwansLNR},
  UFormPlan160916 in 'UFormPlan160916.pas' {FormPlan160916},
  UFormMoveRecalcOtp2016 in 'UFormMoveRecalcOtp2016.pas' {FormMoveRecalcOtp2016},
  UFormMinZP in 'UFormMinZP.pas' {FormMinZP},
  UFormImportFromKU in 'UFormImportFromKU.pas' {FormImportFromKU},
  UFormListRecalcYear in 'UFormListRecalcYear.pas' {FormListRecalcYear},
  USQLUnit in 'USQLUnit.pas',
  UFormSearchDolg in 'UFormSearchDolg.pas' {FormSearchDolg},
  UFormSwodAlla in 'UFormSwodAlla.pas' {FormSwodAlla},
  UFormDelSowm82 in 'UFormDelSowm82.pas' {FormDelSowm82},
  UFormReport148 in 'UFormReport148.pas' {FormReport148},
  UFormConvertXMLGrnToRub in 'UFormConvertXMLGrnToRub.pas' {FormConvertXMLGrnToRub},
  UFormRepPersDolgOsn in 'UFormRepPersDolgOsn.pas' {FormRepPersDolgOsn},
  UFormRepRecalcOtp2015 in 'UFormRepRecalcOtp2015.pas' {FormRepRecalcOtp2015},
  UFormRepAUP_PPS in 'UFormRepAUP_PPS.pas' {FormRepAUP_PPS},
  UFormKomand in 'UFormKomand.pas' {FormKomand},
  UFormKomandA in 'UFormKomandA.pas' {FormKomandA},
  UFormMovKmd in 'UFormMovKmd.pas' {FormMovKmd},
  UFormRepairUwol in 'UFormRepairUwol.pas' {FormRepairUwol},
  UFormRecalcNight in 'UFormRecalcNight.pas' {FormRecalcNight},
  UFormImportDayTxt in 'UFormImportDayTxt.pas' {FormImportDayTxt},
  UFormChangeTabno in 'UFormChangeTabno.pas' {FormChangeTabno},
  UFormChangeNMES in 'UFormChangeNMES.pas' {FormChangeNMES},
  UFormDepartmentSeek in 'UFormDepartmentSeek.pas' {FormDepartmentSeek},
  UFormFillExcel0417 in 'UFormFillExcel0417.pas' {FormFillExcel0417},
  UFormMovePremFromSQL in 'UFormMovePremFromSQL.pas' {FormMovePremFromSQL},
  UFormCalcPrem_11_2017 in 'UFormCalcPrem_11_2017.pas' {FormCalcPrem_11_2017},
  UFormMoveAwans2017_12 in 'UFormMoveAwans2017_12.pas' {FormMoveAwans2017_12},
  UFormRepWordkers in 'UFormRepWordkers.pas' {FormRepWordkers},
  UFormGener in 'UFormGener.pas' {FormGener},
  UFormMonthForGener in 'UFormMonthForGener.pas' {FormMonthForGener},
  UFormSearchClassificator in 'UFormSearchClassificator.pas' {FormSearchClassificator},
  UFormExportTabelToExcel in 'UFormExportTabelToExcel.pas' {FormExportTabelToExcel},
  UFormBrowseDogovora in 'UFormBrowseDogovora.pas' {FormBrowseDogovora},
  UFormUpdateDogovora in 'UFormUpdateDogovora.pas' {FormUpdateDogovora},
  UFormBrowseDogovoraDet in 'UFormBrowseDogovoraDet.pas' {FormBrowseDogovoraDet},
  UFormSelDogPodSowm in 'UFormSelDogPodSowm.pas' {FormSelDogPodSowm},
  UFormRepPomKOtp in 'UFormRepPomKOtp.pas' {FormRepPomKOtp},
  UFormTestCrossSaving in 'UFormTestCrossSaving.pas' {FormTestCrossSaving},
  UFormSavedAwans in 'UFormSavedAwans.pas' {FormSavedAwans},
  UFormSaveAwans in 'UFormSaveAwans.pas' {FormSaveAwans},
  UFormAwansSwod in 'UFormAwansSwod.pas' {FormAwansSwod},
  UFormAwansVerification in 'UFormAwansVerification.pas' {FormAwansVerification},
  UFormAwansVerirficationByPerson in 'UFormAwansVerirficationByPerson.pas' {FormAwansVerirficationByPerson},
  UFormRecalcJan2019 in 'UFormRecalcJan2019.pas' {FormRecalcJan2019},
  UFormTabelItogoClocks in 'UFormTabelItogoClocks.pas' {FormTabelItogoClocks},
  UFormRepClockItogi in 'UFormRepClockItogi.pas' {FormRepClockItogi},
  UFormRepRazr in 'UFormRepRazr.pas' {FormRepRazr},
  UMatHelpCalc in 'UMatHelpCalc.pas',
  UFormRepNeSovpRazrOklad in 'UFormRepNeSovpRazrOklad.pas' {FormRepNeSovpRazrOklad},
  UFormRepFondy in 'UFormRepFondy.pas' {FormRepFondy},
  UFormRepF4 in 'UFormRepF4.pas' {FormRepF4},
  UFormRepPensionery in 'UFormRepPensionery.pas' {FormRepPensionery},
  UFormDekrList in 'UFormDekrList.pas' {FormDekrList},
  UFormDekrUpd in 'UFormDekrUpd.pas' {FormDekrUpd},
  UFormRepFondySVDN in 'UFormRepFondySVDN.pas' {FormRepFondySVDN},
  UAddUdList in 'UAddUdList.pas',
  UUdEntity in 'UUdEntity.pas',
  UAddEntity in 'UAddEntity.pas',
  UCnEntity in 'UCnEntity.pas',
  UPersonEntity in 'UPersonEntity.pas',
  UPersonService in 'UPersonService.pas',
  UFormMakeCorrectNagativeVypl in 'UFormMakeCorrectNagativeVypl.pas' {FormMakeCorrectNagativeVypl},
  UFormPrikazyBrowseTot in 'UFormPrikazyBrowseTot.pas' {FormPrikazyBrowseTot},
  UFormPrikazyFilter in 'UFormPrikazyFilter.pas' {FormPrikazyFilter},
  UFormPrikazRekvizityTot in 'UFormPrikazRekvizityTot.pas' {FormPrikazRekvizityTot},
  UFormKRUReport in 'UFormKRUReport.pas' {FormKRUReport},
  UFormRptPremGM in 'UFormRptPremGM.pas' {FormRptPremGM},
  UFormSumLimitForCarantine in 'UFormSumLimitForCarantine.pas' {FormSumLimitForCarantine},
  UFormMoveNabdToDB in 'UFormMoveNabdToDB.pas' {FormMoveNabdToDB},
  UFormBrowseNadbPlanoviy in 'UFormBrowseNadbPlanoviy.pas' {FormBrowseNadbPlanoviy},
  UFormUpdateNadbPlanoviy in 'UFormUpdateNadbPlanoviy.pas' {FormUpdateNadbPlanoviy},
  FormKRURosDNRU in 'FormKRURosDNRU.pas' {FormKRURosDNR},
  UFormRepBolnPlan in 'UFormRepBolnPlan.pas' {FormRepBolnPlan},
  UFormTestKassaBank in 'UFormTestKassaBank.pas' {FormTestKassaBank},
  UFormMakeVypl082020 in 'UFormMakeVypl082020.pas' {FormMakeVypl082020},
  UFormMakeVypl156082020 in 'UFormMakeVypl156082020.pas' {FormMakeVypl156082020};

//  UFormSelDogPodSowm in '..\SVDN\ib\UFormSelDogPodSowm.pas'} {FormSelDogPodSowm};

{$R *.res}

const
  IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE = $8000;
  // Following are already defined in D7's Windows.pas
  IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP       = $0400;
  IMAGE_FILE_NET_RUN_FROM_SWAP             = $0800;

{$SetPEOptFlags IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE}

{$SetPEFlags IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP or IMAGE_FILE_NET_RUN_FROM_SWAP}
begin
  if mmm then
     begin // ������ ����������  Application.Initialize;
          MessageBox(0,'������ ��������� ��� �����','������ ���������� ����� ����������� ���',0);
          HALT;
     end;
  Application.Initialize;
  Application.Title := '������ ���������� ����� ���������� ��� ��.�.����';
  try
     AboutBox:=TAboutBox.Create(Application);
     AboutBox.Show;
     AboutBox.Update;
  Application.CreateForm(TFIB, FIB);
  try
     Application.CreateForm(TMainForm, MainForm);
  except
    else
        Halt;
  end;
  Application.CreateForm(TFormWait, FormWait);
  Application.CreateForm(TDataModuleSPR, DataModuleSPR);
  Application.CreateForm(TFormWaitMess, FormWaitMess);
  repeat
        Application.ProcessMessages;
  until AboutBox.CloseQuery;
     AboutBox.Hide;
  finally
     AboutBox.Free;
  end;
  try
     Application.Run;
  except
     on E: Exception do ShowMessage(E.Message);
  end

end.






