object f_request: Tf_request
  Left = 0
  Top = 0
  BorderIcons = []
  Caption = 'Request Lagu'
  ClientHeight = 175
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 32
    Top = 10
    Width = 68
    Height = 16
    Caption = 'Judul Lagu'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label1: TLabel
    Left = 32
    Top = 64
    Width = 59
    Height = 16
    Caption = 'Penyanyi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object spSkinXFormButton1: TspSkinXFormButton
    Left = 240
    Top = 120
    Width = 92
    Height = 31
    HintImageIndex = 0
    TabOrder = 0
    DrawDefault = True
    SkinData = dm.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    CheckedMode = False
    ImageIndex = -1
    AlwaysShowLayeredFrame = False
    UseSkinSize = False
    UseSkinFontColor = True
    RepeatMode = False
    RepeatInterval = 100
    AllowAllUp = False
    CanFocused = False
    Down = False
    GroupIndex = 0
    Caption = '&Ok'
    NumGlyphs = 1
    Spacing = 1
    OnClick = spSkinXFormButton1Click
    DefActiveFontColor = clBlack
    DefDownFontColor = clBlack
  end
  object Edit1: TEdit
    Left = 32
    Top = 32
    Width = 300
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object Edit2: TEdit
    Left = 32
    Top = 85
    Width = 300
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    OnKeyPress = Edit1KeyPress
  end
  object spSkinXFormButton2: TspSkinXFormButton
    Left = 142
    Top = 120
    Width = 92
    Height = 31
    HintImageIndex = 0
    TabOrder = 3
    DrawDefault = True
    SkinData = dm.SkinData1
    SkinDataName = 'button'
    AlphaBlend = False
    AlphaBlendValue = 200
    UseSkinCursor = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 14
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultWidth = 0
    DefaultHeight = 0
    CheckedMode = False
    ImageIndex = -1
    AlwaysShowLayeredFrame = False
    UseSkinSize = False
    UseSkinFontColor = True
    RepeatMode = False
    RepeatInterval = 100
    AllowAllUp = False
    CanFocused = False
    Down = False
    GroupIndex = 0
    Caption = '&Batal'
    NumGlyphs = 1
    Spacing = 1
    OnClick = spSkinXFormButton2Click
    DefActiveFontColor = clBlack
    DefDownFontColor = clBlack
  end
  object spDynamicSkinForm1: TspDynamicSkinForm
    UseRibbon = False
    WindowState = wsNormal
    ShowMDIScrollBars = True
    QuickButtons = <>
    QuickButtonsShowHint = False
    ClientInActiveEffect = False
    ClientInActiveEffectType = spieSemiTransparent
    DisableSystemMenu = False
    PositionInMonitor = sppDefault
    UseFormCursorInNCArea = False
    MaxMenuItemsInWindow = 0
    ClientWidth = 0
    ClientHeight = 0
    HideCaptionButtons = False
    AlwaysShowInTray = False
    LogoBitMapTransparent = False
    AlwaysMinimizeToTray = False
    UseSkinFontInMenu = True
    UseSkinFontInCaption = True
    UseSkinSizeInMenu = True
    ShowIcon = False
    MaximizeOnFullScreen = False
    ShowObjectHint = False
    UseDefaultObjectHint = True
    UseSkinCursors = False
    DefCaptionFont.Charset = DEFAULT_CHARSET
    DefCaptionFont.Color = clBtnText
    DefCaptionFont.Height = 14
    DefCaptionFont.Name = 'Arial'
    DefCaptionFont.Style = [fsBold]
    DefInActiveCaptionFont.Charset = DEFAULT_CHARSET
    DefInActiveCaptionFont.Color = clBtnShadow
    DefInActiveCaptionFont.Height = 14
    DefInActiveCaptionFont.Name = 'Arial'
    DefInActiveCaptionFont.Style = [fsBold]
    DefMenuItemHeight = 20
    DefMenuItemFont.Charset = DEFAULT_CHARSET
    DefMenuItemFont.Color = clWindowText
    DefMenuItemFont.Height = 14
    DefMenuItemFont.Name = 'Arial'
    DefMenuItemFont.Style = []
    UseDefaultSysMenu = False
    SupportNCArea = True
    AlphaBlendAnimation = False
    AlphaBlendValue = 200
    AlphaBlend = False
    MenusAlphaBlend = False
    MenusAlphaBlendAnimation = False
    MenusAlphaBlendValue = 200
    SkinData = dm.SkinData1
    MinHeight = 0
    MinWidth = 0
    MaxHeight = 0
    MaxWidth = 0
    Sizeable = True
    DraggAble = False
    NCDraggAble = True
    Magnetic = False
    MagneticSize = 10
    BorderIcons = [biSystemMenu]
    Left = 88
    Top = 128
  end
end
