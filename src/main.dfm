object frmMain: TfrmMain
  Left = 0
  Top = 0
  Width = 1032
  Height = 748
  Caption = '�������� ����������� �������'
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
        Text = '�������'
        Width = 100
      end
      item
        Text = '�������'
        Width = 50
      end>
    SimplePanel = False
  end
  object MainMenu1: TMainMenu
    Left = 120
    Top = 40
    object N6: TMenuItem
      Caption = '��������'
      object N7: TMenuItem
        Caption = '������������'
        OnClick = N7Click
      end
    end
    object N1: TMenuItem
      Caption = '�������'
      object N2: TMenuItem
        Caption = '����������� �������'
        OnClick = N2Click
      end
    end
    object N5: TMenuItem
      Caption = '��� ��������...'
    end
    object N4: TMenuItem
      Caption = '�����'
      OnClick = N4Click
    end
  end
end
