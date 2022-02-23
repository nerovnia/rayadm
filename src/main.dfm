object frmMain: TfrmMain
  Left = 0
  Top = 0
  Width = 1032
  Height = 748
  Caption = 'Державна статистична звітність'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 683
    Width = 1024
    Height = 19
    Panels = <
      item
        Text = 'Сторінка'
        Width = 100
      end
      item
        Text = 'Помилка'
        Width = 50
      end>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 40
    object N6: TMenuItem
      Caption = 'Довідники'
      object N7: TMenuItem
        Caption = 'Господарства'
        OnClick = N7Click
      end
    end
    object N1: TMenuItem
      Caption = 'Звітність'
      object N2: TMenuItem
        Caption = 'Статистична звітність'
        OnClick = N2Click
      end
    end
    object N5: TMenuItem
      Caption = 'Про програму...'
    end
    object N4: TMenuItem
      Caption = 'Вихід'
      OnClick = N4Click
    end
  end
end
