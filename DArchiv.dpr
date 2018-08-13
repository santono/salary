program DArchiv;

uses
  Windows,
  Forms,
  MainArc in 'MainArc.pas' {FormMainArc},
  uFormWait in 'uFormWait.pas' {FormWait},
  UFibModule in 'UFibModule.pas' {FIB: TDataModule},
  uUpdFormPens in 'uUpdFormPens.pas' {FormPensSpr2006},
  uFormEditPensSpr in 'uFormEditPensSpr.pas' {FormEditPensSpr},
  uFrmFindKadryFB in 'uFrmFindKadryFB.pas' {FormFindKadryFB},
  Uformpensprpr in 'Uformpensprpr.pas' {FormEditPensSprPrPr},
  uFormArc in 'uFormArc.pas' {FormArc},
  uFormArcTot in 'uFormArcTot.pas' {FormArcTot},
  USMessages in 'USMessages.pas',
  UFormSecretSotr in 'UFormSecretSotr.pas' {FormTabnoSecret},
  PrevInstArc in 'PrevInstArc.pas',
  UInitArc in 'UInitArc.pas';

{$R *.res}



begin
     if  mmmArc then
        begin // Запуск программмы  Application.Initialize;
             MessageBox(0,'Нельзя запустить две копии','Архив заработной платы',0);
             HALT;
        end;

  Application.Title := 'Архив заработной платы работников ВНУ';
  Application.CreateForm(TFIB, FIB);
  Application.CreateForm(TFormMainArc, FormMainArc);
  Application.CreateForm(TFormWait, FormWait);
  Application.Run;
end.

