object MainDataModule: TMainDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 20
  Top = 150
  Height = 480
  Width = 696
  object MainDatabase: TDatabase
    DatabaseName = 'MainDatabase'
    DriverName = 'STANDARD'
    LoginPrompt = False
    Params.Strings = (
      'PATH=C:\WORK\RAYADM\BASE'
      'DEFAULT DRIVER=PARADOX'
      'ENABLE BCD=FALSE')
    SessionName = 'Default'
    Left = 32
    Top = 16
  end
end
