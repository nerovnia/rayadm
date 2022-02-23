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
    //  ��������� ������� �������� ��������
    if CheckLicense=True then begin
      Application.Title := '�������� ����������� �������';
      Application.CreateForm(TMainDataModule, MainDataModule);
      Application.CreateForm(TDataDovid, DataDovid);
      Application.CreateForm(TDataZvit, DataZvit);
      Application.CreateForm(TfrmMain, frmMain);
      Application.Run;
    end else begin
      ShowMessage('��������������� ����!!! ��������� �� ����������.');
      Application.Terminate;
    end
  end else
    ShowMessage('³������ ���� �������� mysys.dll!!! �������� ���� �������� �� ������������ ��������.');
  if not (LibHandle=0) then begin
    FreeLibrary(LibHandle);
    LibHandle:=0;
  end;
  Application.Terminate;
end.
