object FAcceso: TFAcceso
  Left = 282
  Top = 186
  Width = 729
  Height = 422
  Caption = 'Accesos a Referencia ( Data )'
  Color = 14869218
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
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
    TitleColor = 7566265
    OnRowChanged = dbgUsuarioRowChanged
    FixedCols = 0
    ShowHorzScrollBar = True
    DataSource = dsUsuario
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    KeyOptions = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
    ParentFont = False
    TabOrder = 0
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object Panel2: TPanel
    Left = 400
    Top = 8
    Width = 313
    Height = 374
    Color = 14869218
    TabOrder = 1
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
      Width = 311
      Height = 32
      Align = alBottom
      Color = 14869218
      TabOrder = 0
      object bbtnGraba: TBitBtn
        Left = 228
        Top = 5
        Width = 58
        Height = 24
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
  object cdsUsuario: TwwClientDataSet
    Aggregates = <>
    IndexFieldNames = 'USERID'
    Params = <>
    ProviderName = 'prvUsuario'
    ValidateWithMask = True
    Left = 136
    Top = 224
    object cdsUsuarioUSERID: TStringField
      DisplayLabel = 'Usuario'
      DisplayWidth = 15
      FieldName = 'USERID'
    end
    object cdsUsuarioUSERNOM: TStringField
      DisplayLabel = 'Nombre'
      DisplayWidth = 25
      FieldName = 'USERNOM'
      Size = 30
    end
    object cdsUsuarioPASSWORD: TStringField
      DisplayWidth = 20
      FieldName = 'PASSWORD'
      Visible = False
    end
  end
  object dsUsuario: TwwDataSource
    DataSet = cdsUsuario
    Left = 136
    Top = 288
  end
  object cdsAcceso: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAcceso'
    ValidateWithMask = True
    Left = 96
    Top = 224
  end
  object dsAcceso: TwwDataSource
    DataSet = cdsAcceso
    Left = 96
    Top = 288
  end
  object cdsData: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 184
    Top = 224
  end
  object dsData: TwwDataSource
    DataSet = cdsData
    Left = 184
    Top = 288
  end
end
