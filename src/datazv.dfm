object DataZvit: TDataZvit
  OldCreateOrder = False
  Left = 278
  Top = 214
  Height = 375
  Width = 545
  object srcGosp: TDataSource
    DataSet = tblGosp
    Left = 24
    Top = 8
  end
  object tblGosp: TTable
    CachedUpdates = True
    DatabaseName = 'MainDatabase'
    SessionName = 'Default'
    TableName = 'gosp.DB'
    Left = 112
    Top = 8
  end
  object srcVirobOb: TDataSource
    DataSet = tblVirobOb
    Left = 24
    Top = 56
  end
  object tblVirobOb: TTable
    CachedUpdates = True
    DatabaseName = 'MainDatabase'
    Filter = 'Code='#39'0010'#39
    Filtered = True
    IndexFieldNames = 'Cod'
    ReadOnly = True
    TableName = 'Zvvirob.DB'
    Left = 112
    Top = 56
  end
end
