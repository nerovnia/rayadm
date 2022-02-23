object frmZvVirob: TfrmZvVirob
  Left = 194
  Top = 110
  Width = 799
  Height = 571
  Caption = 'Звітність. Виробництво і реалізація с/х продукції (диалог)'
  Color = clBtnFace
  Constraints.MinHeight = 494
  Constraints.MinWidth = 799
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 0
    Top = 0
    Width = 791
    Height = 19
    Align = alTop
    Alignment = taCenter
    Caption = '1. Виробництво і реалізація с/х продукції'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object lblVibFormZvit: TLabel
    Left = 8
    Top = 506
    Width = 313
    Height = 13
    AutoSize = False
    Caption = 'Вибір форми звіту'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ctrlZvVirob: TDBCtrlGrid
    Left = 8
    Top = 201
    Width = 721
    Height = 304
    AllowDelete = False
    AllowInsert = False
    ColCount = 1
    DataSource = DataDovid.srcVirob
    PanelHeight = 76
    PanelWidth = 705
    TabOrder = 4
    RowCount = 4
    OnKeyDown = ctrlZvVirobKeyDown
    object DBText1: TDBText
      Left = 8
      Top = 7
      Width = 153
      Height = 65
      DataField = 'Vidprod'
      DataSource = DataDovid.srcVirob
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Shape11: TShape
      Left = 168
      Top = 0
      Width = 1
      Height = 75
    end
    object Shape12: TShape
      Left = 218
      Top = 0
      Width = 1
      Height = 75
    end
    object Shape13: TShape
      Left = 293
      Top = 0
      Width = 1
      Height = 75
    end
    object Shape14: TShape
      Left = 377
      Top = 0
      Width = 1
      Height = 75
    end
    object Shape15: TShape
      Left = 461
      Top = 0
      Width = 1
      Height = 75
    end
    object Shape16: TShape
      Left = 535
      Top = 0
      Width = 1
      Height = 75
    end
    object Shape17: TShape
      Left = 624
      Top = 0
      Width = 1
      Height = 75
    end
    object DBText2: TDBText
      Left = 173
      Top = 51
      Width = 41
      Height = 17
      Alignment = taCenter
      DataField = 'Code'
      DataSource = DataDovid.srcVirob
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 229
      Top = 51
      Width = 41
      Height = 17
      Alignment = taCenter
      DataField = 'Code'
      DataSource = DataDovid.srcVirob
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edEdit1: TDBEdit
      Left = 223
      Top = 48
      Width = 65
      Height = 21
      DataField = 'C1'
      DataSource = DataDovid.srcVirob
      TabOrder = 0
    end
    object edEdit2: TDBEdit
      Left = 299
      Top = 48
      Width = 73
      Height = 21
      DataField = 'C2'
      DataSource = DataDovid.srcVirob
      TabOrder = 1
    end
    object edEdit3: TDBEdit
      Left = 385
      Top = 48
      Width = 70
      Height = 21
      DataField = 'C3'
      DataSource = DataDovid.srcVirob
      TabOrder = 2
    end
    object edEdit4: TDBEdit
      Left = 466
      Top = 48
      Width = 65
      Height = 21
      DataField = 'C4'
      DataSource = DataDovid.srcVirob
      TabOrder = 3
    end
    object edEdit5: TDBEdit
      Left = 539
      Top = 48
      Width = 81
      Height = 21
      DataField = 'C5'
      DataSource = DataDovid.srcVirob
      TabOrder = 4
    end
    object edEdit6: TDBEdit
      Left = 627
      Top = 48
      Width = 73
      Height = 21
      DataField = 'C6'
      DataSource = DataDovid.srcVirob
      TabOrder = 5
    end
  end
  object pZvVirob: TPanel
    Left = 4
    Top = 24
    Width = 711
    Height = 177
    BevelOuter = bvNone
    Caption = 'pZvVirob'
    TabOrder = 0
    object Shape18: TShape
      Left = 4
      Top = 71
      Width = 705
      Height = 89
      Brush.Color = clGreen
    end
    object Label20: TLabel
      Left = 4
      Top = 107
      Width = 169
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Види продукції'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label21: TLabel
      Left = 178
      Top = 105
      Width = 41
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'Код'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label22: TLabel
      Left = 228
      Top = 87
      Width = 65
      Height = 57
      Alignment = taCenter
      AutoSize = False
      Caption = 'Вироб- ництво продукції, ц'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label23: TLabel
      Left = 300
      Top = 87
      Width = 82
      Height = 57
      Alignment = taCenter
      AutoSize = False
      Caption = 'Собівартість основної продукції, тис., грн.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label24: TLabel
      Left = 380
      Top = 76
      Width = 81
      Height = 81
      Alignment = taCenter
      AutoSize = False
      Caption = 'Прямі затрати праці на продукцію - всього, тис. люд.-год.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label25: TLabel
      Left = 468
      Top = 108
      Width = 73
      Height = 36
      Alignment = taCenter
      AutoSize = False
      Caption = 'у фізичній вазі, ц'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label26: TLabel
      Left = 548
      Top = 107
      Width = 73
      Height = 57
      Alignment = taCenter
      AutoSize = False
      Caption = 'собівартість продукції, тис. грн.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label27: TLabel
      Left = 629
      Top = 99
      Width = 77
      Height = 57
      Alignment = taCenter
      AutoSize = False
      Caption = 'доход (виручка) від реалізації, тис. грн.'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      WordWrap = True
    end
    object Label28: TLabel
      Left = 476
      Top = 74
      Width = 217
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Реалізація продукції (робіт, послуг)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clSilver
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Shape19: TShape
      Left = 4
      Top = 159
      Width = 705
      Height = 17
      Brush.Color = clGray
    end
    object Shape20: TShape
      Left = 172
      Top = 71
      Width = 1
      Height = 105
    end
    object Shape21: TShape
      Left = 222
      Top = 71
      Width = 1
      Height = 105
    end
    object Shape22: TShape
      Left = 297
      Top = 71
      Width = 1
      Height = 105
    end
    object Shape23: TShape
      Left = 381
      Top = 71
      Width = 1
      Height = 105
    end
    object Shape24: TShape
      Left = 465
      Top = 71
      Width = 1
      Height = 105
    end
    object Shape25: TShape
      Left = 539
      Top = 93
      Width = 1
      Height = 83
    end
    object Shape26: TShape
      Left = 465
      Top = 92
      Width = 244
      Height = 1
    end
    object Shape27: TShape
      Left = 628
      Top = 93
      Width = 1
      Height = 83
    end
    object Label29: TLabel
      Left = 83
      Top = 161
      Width = 9
      Height = 13
      Caption = 'А'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label30: TLabel
      Left = 195
      Top = 161
      Width = 9
      Height = 13
      Caption = 'Б'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label31: TLabel
      Left = 255
      Top = 161
      Width = 8
      Height = 13
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label32: TLabel
      Left = 336
      Top = 161
      Width = 8
      Height = 13
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label33: TLabel
      Left = 420
      Top = 161
      Width = 8
      Height = 13
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label34: TLabel
      Left = 500
      Top = 161
      Width = 8
      Height = 13
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label35: TLabel
      Left = 580
      Top = 161
      Width = 8
      Height = 13
      Caption = '5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label36: TLabel
      Left = 665
      Top = 161
      Width = 8
      Height = 13
      Caption = '6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lblZvVirob: TLabel
      Left = 445
      Top = 37
      Width = 88
      Height = 13
      Caption = 'Господарство:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object lblYear: TLabel
      Left = 9
      Top = 37
      Width = 23
      Height = 13
      Caption = 'Рік:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object lblKolvo: TLabel
      Left = 124
      Top = 27
      Width = 149
      Height = 31
      AutoSize = False
      Caption = 'Кількість підприємств, що звітували:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 6
      Top = 3
      Width = 195
      Height = 22
      AutoSize = False
      Caption = 'Основні економічні показники:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      WordWrap = True
    end
    object cmbGosp: TComboBox
      Left = 567
      Top = 32
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 3
      OnChange = cmbGospChange
    end
    object edYear: TEdit
      Left = 41
      Top = 33
      Width = 72
      Height = 21
      TabOrder = 1
    end
    object edKolvo: TEdit
      Left = 280
      Top = 33
      Width = 149
      Height = 21
      TabOrder = 2
    end
    object cmbOsnEkPok: TComboBox
      Left = 200
      Top = 0
      Width = 511
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnChange = cmbOsnEkPokChange
    end
  end
  object btnRasch: TButton
    Left = 632
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Рассчет'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = btnRaschClick
  end
  object btnPrint: TButton
    Left = 712
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Печать'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnPrintClick
  end
  object btnSave: TButton
    Left = 520
    Top = 512
    Width = 107
    Height = 25
    Caption = 'Зберегти зміни'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnSaveClick
  end
  object lbPrintZvit: TListBox
    Left = 736
    Top = 24
    Width = 49
    Height = 481
    ItemHeight = 13
    TabOrder = 5
  end
  object cmbTipZvit: TComboBox
    Left = 8
    Top = 520
    Width = 313
    Height = 21
    ItemHeight = 13
    TabOrder = 6
  end
  object btnClear: TButton
    Left = 408
    Top = 512
    Width = 107
    Height = 25
    Caption = 'Очистити'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = btnClearClick
  end
end
