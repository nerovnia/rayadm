object frmProgress: TfrmProgress
  Left = 309
  Top = 375
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 58
  ClientWidth = 395
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object lblProgress: TLabel
    Left = 0
    Top = 8
    Width = 393
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
    Transparent = True
  end
  object prgProgress: TProgressBar
    Left = 8
    Top = 32
    Width = 377
    Height = 9
    Min = 0
    Max = 100
    Position = 10
    TabOrder = 0
  end
end
