object FAccesoRef: TFAccesoRef
  Left = 243
  Top = 221
  Width = 726
  Height = 420
  Caption = 'Acceso a Referencias ( Editar o Consulta )'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 398
    Top = 8
    Width = 314
    Height = 374
    TabOrder = 0
    object lblTabla: TLabel
      Left = 12
      Top = 8
      Width = 289
      Height = 25
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblTabla'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object pnlPie: TPanel
      Left = 1
      Top = 341
      Width = 312
      Height = 32
      Align = alBottom
      TabOrder = 0
      object bbtnGraba: TBitBtn
        Left = 211
        Top = 4
        Width = 75
        Height = 25
        Caption = 'Grabar'
        TabOrder = 0
        OnClick = bbtnGrabaClick
      end
    end
    object dbgData: TwwDBGrid
      Left = 11
      Top = 38
      Width = 293
      Height = 296
      DisableThemesInTitle = False
      IniAttributes.Delimiter = ';;'
      TitleColor = 7566265
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsData
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
    end
  end
  object dbgUsuario: TwwDBGrid
    Left = 8
    Top = 8
    Width = 377
    Height = 373
    DisableThemesInTitle = False
    Selected.Strings = (
      'GRUPOID'#9'15'#9'Grupo'#9'F'
      'USERID'#9'15'#9'Usuario'
      'USERNOM'#9'25'#9'Nombre')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    OnRowChanged = dbgUsuarioRowChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = dsUsuario
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    TabOrder = 1
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object cdsUsuario: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'prvUsuario'
    ValidateWithMask = True
    Left = 144
    Top = 224
  end
  object cdsAcceso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'prvAcceso'
    ValidateWithMask = True
    Left = 96
    Top = 224
    object cdsAccesoMODULOID: TStringField
      FieldName = 'MODULOID'
      FixedChar = True
    end
    object cdsAccesoUSERID: TStringField
      FieldName = 'USERID'
      FixedChar = True
    end
    object cdsAccesoNTABLA: TStringField
      FieldName = 'NTABLA'
      FixedChar = True
      Size = 15
    end
  end
  object dsAcceso: TwwDataSource
    DataSet = cdsAcceso
    Left = 96
    Top = 272
  end
  object dsUsuario: TwwDataSource
    DataSet = cdsUsuario
    Left = 144
    Top = 272
  end
  object cdsData: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 192
    Top = 224
  end
  object dsData: TwwDataSource
    DataSet = cdsData
    Left = 192
    Top = 272
  end
end
