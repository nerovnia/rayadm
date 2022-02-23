object DataDovid: TDataDovid
  OldCreateOrder = False
  Left = 257
  Top = 136
  Height = 555
  Width = 696
  object srcGosp: TDataSource
    DataSet = tblGosp
    Left = 184
    Top = 16
  end
  object tblGosp: TTable
    AutoCalcFields = False
    CachedUpdates = True
    BeforeDelete = tblGospBeforeDelete
    AfterDelete = tblGospAfterDelete
    OnNewRecord = tblGospNewRecord
    DatabaseName = 'MainDatabase'
    SessionName = 'Default'
    IndexName = 'indCod'
    TableName = 'gosp.DB'
    Left = 240
    Top = 16
  end
  object srcVirob: TDataSource
    DataSet = tblVirob
    Left = 32
    Top = 72
  end
  object tblVirob: TTable
    CachedUpdates = True
    DatabaseName = 'MainDatabase'
    IndexName = 'Referential'
    MasterFields = 'Cod'
    MasterSource = srcGosp
    TableName = 'zvvirob.DB'
    Left = 120
    Top = 72
  end
  object srcZatrVir: TDataSource
    DataSet = tblZatrVir
    Left = 184
    Top = 72
  end
  object tblZatrVir: TTable
    CachedUpdates = True
    DatabaseName = 'MainDatabase'
    IndexFieldNames = 'Referential'
    MasterFields = 'Cod'
    MasterSource = srcGosp
    TableName = 'zvzatrvir.DB'
    Left = 248
    Top = 72
  end
  object srcFinrez: TDataSource
    DataSet = tblFinRez
    Left = 296
    Top = 72
  end
  object tblFinRez: TTable
    CachedUpdates = True
    DatabaseName = 'MainDatabase'
    IndexName = 'Referential'
    MasterFields = 'Cod'
    MasterSource = srcGosp
    TableName = 'finrez.DB'
    Left = 368
    Top = 72
  end
  object srcZemlekorist: TDataSource
    DataSet = tblZemlekorist
    Left = 304
    Top = 152
  end
  object tblZemlekorist: TTable
    CachedUpdates = True
    DatabaseName = 'MainDatabase'
    IndexName = 'Referential'
    MasterFields = 'Cod'
    MasterSource = srcGosp
    TableName = 'zemlekorist.DB'
    Left = 376
    Top = 152
  end
  object srcObZvit: TDataSource
    DataSet = qryObZvit
    Left = 40
    Top = 184
  end
  object qryObZvit: TQuery
    DatabaseName = 'MainDatabase'
    SQL.Strings = (
      
        'SELECT DISTINCT d.Cod, d.Referential, d.Vidprod, d.Zaglavie, d.C' +
        'ode, d.C1, d.C2, d.C3, d.C4, d.C5, d.C6, d1.Cod, d1.PorNom, d1.N' +
        'ame'
      'FROM "Zvvirob.db" d, "Gosp.db" d1'
      'WHERE'
      '(d1.Cod = d.Referential and d.Code='#39'0020'#39')'
      
        'ORDER BY d.Cod, d.Referential, d.Vidprod, d.Zaglavie, d.Code, d.' +
        'C1, d.C2, d.C3, d.C4, d.C5, d.C6, d1.Cod, d1.PorNom, d1.Name')
    Left = 104
    Top = 184
  end
  object srcVirobAll: TDataSource
    DataSet = tblVirobAll
    Left = 32
    Top = 296
  end
  object tblVirobAll: TTable
    CachedUpdates = True
    DatabaseName = 'MainDatabase'
    IndexName = 'Referential'
    TableName = 'ZvvirobAll.DB'
    Left = 96
    Top = 296
  end
  object srcZatrVirAll: TDataSource
    DataSet = tblZatrVirAll
    Left = 168
    Top = 296
  end
  object tblZatrVirAll: TTable
    CachedUpdates = True
    DatabaseName = 'MainDatabase'
    IndexFieldNames = 'Referential'
    TableName = 'zvzatrvirAll.DB'
    Left = 240
    Top = 296
  end
  object srcFinRezAll: TDataSource
    DataSet = tblFinRezAll
    Left = 312
    Top = 296
  end
  object tblFinRezAll: TTable
    CachedUpdates = True
    DatabaseName = 'MainDatabase'
    IndexName = 'Referential'
    TableName = 'FinrezAll.DB'
    Left = 400
    Top = 296
  end
  object srcZemlekoristAll: TDataSource
    DataSet = tblZemlekoristAll
    Left = 320
    Top = 352
  end
  object tblZemlekoristAll: TTable
    CachedUpdates = True
    DatabaseName = 'MainDatabase'
    IndexName = 'Referential'
    TableName = 'zemlekoristAll.DB'
    Left = 400
    Top = 352
  end
  object srGospAll: TDataSource
    DataSet = tblGospAll
    Left = 168
    Top = 248
  end
  object tblGospAll: TTable
    CachedUpdates = True
    BeforeDelete = tblGospBeforeDelete
    AfterDelete = tblGospAfterDelete
    DatabaseName = 'MainDatabase'
    SessionName = 'Default'
    IndexName = 'indCod'
    TableName = 'gosp.DB'
    Left = 232
    Top = 248
  end
end
