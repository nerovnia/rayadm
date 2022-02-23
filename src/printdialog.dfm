object frmDialog: TfrmDialog
  Left = 354
  Top = 251
  BorderStyle = bsDialog
  Caption = 'Допоміжні дані до звіта'
  ClientHeight = 110
  ClientWidth = 310
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 21
    Width = 23
    Height = 13
    Caption = 'Рік:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 145
    Height = 25
    AutoSize = False
    Caption = 'Кількість підприємств, що звітували:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object edYear: TEdit
    Left = 168
    Top = 16
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object edKolvo: TEdit
    Left = 168
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnOk: TButton
    Left = 128
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnOkClick
  end
end
