program rayadm;

uses
  Forms, Windows,
  registry,
  Sysutils,
  Dialogs,
  main in 'main.pas' {frmMain},
  datadovidnik in 'datadovidnik.pas' {DataDovid: TDataModule},
  MainBase in 'MainBase.pas' {MainDataModule: TDataModule},
  zvvirob in 'zvvirob.pas' {frmZvVirob},
  dovidnik in 'dovidnik.pas' {frmSprav},
  datazv in 'datazv.pas' {DataZvit: TDataModule},
  PrintZvitVirob in 'PrintZvitVirob.pas' {qrPrintZvitVirob: TQuickRep},
  ZvVirobDop in 'ZvVirobDop.pas',
  Progress in 'Progress.pas' {frmProgress};

type
  TCheckLicense = function : boolean; StdCall;

{$R *.RES}
var
  LibHandle : THandle;
  CheckLicense : TCheckLicense;

begin
  LibHandle:=LoadLibrary('MYSYS.DLL');
  if LibHandle<>0 then begin
    @CheckLicense:=GetProcAddress(LibHandle, 'License');
    Application.Initialize;
    //  Установка времени действия лицензии
    if CheckLicense=True then begin
      Application.Title := 'Державна статистична звітність';
      Application.CreateForm(TMainDataModule, MainDataModule);
      Application.CreateForm(TDataDovid, DataDovid);
      Application.CreateForm(TDataZvit, DataZvit);
      Application.CreateForm(TfrmMain, frmMain);
      Application.Run;
    end else begin
      ShowMessage('Несанкціонована копія!!! Зверніться до розробника.');
      Application.Terminate;
    end
  end else
    ShowMessage('Відсутній файл бібліотеки mysys.dll!!! Перевірте його наявність та перезапустіть програму.');
  if not (LibHandle=0) then begin
    FreeLibrary(LibHandle);
    LibHandle:=0;
  end;
  Application.Terminate;
end.
