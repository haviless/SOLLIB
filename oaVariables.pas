unit oaVariables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBClient, wwclient,  wwdblook, fcButton, fcImgBtn,
  ExtCtrls, fcClearPanel, fcButtonGroup, Buttons, IniFiles,
  wwdbedit, wwdbdatetimepicker, Wwdbspin, Grids, Wwdbigrd, Wwdbgrid,
  wwFrame, Wwdbdlg, DB, Wwdatsrc, SConnect;
type
  TFVariables = class(TForm)
    fcbBotones: TfcButtonGroup;
    o2bbtnPrevio: TfcImageBtn;
    o2bbtnPAplica: TfcImageBtn;
    o2bbtnRegresa: TfcImageBtn;
    o2bbtnCancela: TfcImageBtn;
    o2bbtnGraba: TfcImageBtn;
    o2bbtnAcepta: TfcImageBtn;
    o2bbtnAnula: TfcImageBtn;
    o2bbtnContab: TfcImageBtn;
    o2bbtnNuevo: TfcImageBtn;
    o2bbtnAplica: TfcImageBtn;               
    o2bbtnImprime: TfcImageBtn;
    wcdsModulo: TwwClientDataSet;
    wdsModulo: TwwDataSource;
    w_Var_lbOpcDeshabilitadas: TListBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    sktDComC               : TSocketConnection;

  protected
    procedure SetDCOMC(Value :TSocketConnection);

  public
    { Public declarations }

    // Codigo del Servidor
    w_CodigoServidor, w_CodigoServidor_1 : String;


    // Para Saber si hace RefreshFilter
    w_RefreshFilter : String;

    // Variables para Validar que
    w_AD_Registro : Boolean;   // 1.  Adquisiciones
    w_IN_Registro : Boolean;   // 2.  Inventarios
    w_OP_Registro : Boolean;   // 3.  Obligaciones por Pagar
    w_VE_Registro : Boolean;   // 4.  Ventas
    w_CC_Registro : Boolean;   // 5.  Cuentas por Cobrar
    w_TE_Registro : Boolean;   // 6.  Tesoreria
    w_CN_Registro : Boolean;   // 7.  Contabilidad
    w_AF_Registro : Boolean;   // 8.  Activos fijos
    w_PL_Registro : Boolean;   // 9.  Planillas
    w_RH_Registro : Boolean;   // 10. Evaluacion de Recursos Humanos
    w_PR_Registro : Boolean;   // 11. Presupuestos
    w_IG_Registro : Boolean;   // 12. Informacion Gerencial
    w_DD_Registro : Boolean;   // 13. Diccionario
    //
    w_Num_Formas  : Integer;
    w_Max_Formas  : Integer;
    //
    w_Var_Acceso  : String;
    //
    wvUsuario    : String;
    wvModulo     : String;

    w_Var_sObjetoNombr : String; // Identificador de la opción que se levanta del treeview ej: '3010101'
    w_Var_sObjetoDescr : String; // Descripción de la opción que se levanta en treeview
    w_Var_sObjetoForma : String; // Forma de donde se levanta la opción del treeview. Valor fijo 'FCMENU'

    w_Var_Vers_AD   : String; // Variable que toma valor de label de versión del módulo AD
    w_Var_Vers_IN   : String; // Variable que toma valor de label de versión del módulo IN
    w_Var_Vers_OP   : String; // Variable que toma valor de label de versión del módulo OP
    w_Var_Vers_VE   : String; // Variable que toma valor de label de versión del módulo VE
    w_Var_Vers_CC   : String; // Variable que toma valor de label de versión del módulo CC
    w_Var_Vers_TE   : String; // Variable que toma valor de label de versión del módulo TE
    w_Var_Vers_CN   : String; // Variable que toma valor de label de versión del módulo CN
    w_Var_Vers_AF   : String; // Variable que toma valor de label de versión del módulo AF
    w_Var_Vers_PL   : String; // Variable que toma valor de label de versión del módulo PL
    w_Var_Vers_RH   : String; // Variable que toma valor de label de versión del módulo RH
    w_Var_Vers_PR   : String; // Variable que toma valor de label de versión del módulo PR
    w_Var_Vers_AC   : String; // Variable que toma valor de label de versión del módulo AC
    w_Var_Vers_AP   : String; // Variable que toma valor de label de versión del módulo AP
    w_Var_Vers_DD   : String; // Variable que toma valor de label de versión del módulo DD
    w_NombreForma   : String; // Variable que toma el nombre del Tool, se usa para acceso de botones

    w_Var_bAccesoOpcionRH : boolean; // identifica si ha habido accesos a una opción de Menú

    dblcTempVar  : TwwDBLookupCombo;
    cdsTempVar   : TwwClientDataSet;
    wComponente  : TCustomControl;
    wComponente1 : TControl;
    wFormaTmp    : TForm;
    inifile : TIniFile;
    //
    function  StrZero(wNumero:String;wLargo:Integer):string;
    //
    procedure CreaBotones( CONST wForma : TForm; wPrevio, wRegresa, wCancelar, wGrabar, wAceptar,
                           wAnular, wContabiliza, wNuevo, wAplica, wImprimir, wPAplica : Boolean );
    procedure ConfiguraPaneles( wwFormaL : TForm );
    procedure ConfiguraLabels( wwFormaL : TForm );
    procedure ConfiguraCombos( wwFormaL : TForm );
    procedure ConfiguraGrids( wwFormaL : TForm );
    procedure ConfiguraForma( wwForma : TForm );
    //
    //
  published
    property w_Var_sktDCOM : TSocketConnection  read sktDComC write SetDComC;

  end;

var
  s_wwCodigoOPC : String;
  s_DerramaOPC  : String;
  s_vvUsuario   : String;
  s_vvPassword  : String;
  xOpcionMenu : String;
  FVariables: TFVariables;
  procedure ActualizaFiltro( wwcdsOrigen, wwcdsDestino : TwwClientDataSet );

implementation

{$R *.dfm}


procedure ActualizaFiltro( wwcdsOrigen, wwcdsDestino : TwwClientDataSet );
begin
   wwcdsDestino.Data:=wwcdsOrigen.Data;
   wwcdsDestino.GotoCurrent( wwcdsOrigen );
end;


procedure TFVariables.CreaBotones( CONST wForma : TForm; wPrevio, wRegresa, wCancelar, wGrabar, wAceptar,
                              wAnular, wContabiliza, wNuevo, wAplica, wImprimir, wPAplica : Boolean );
var
   xName : String;
begin
   w_NombreForma := '';
   fcbBotones.Parent:= Screen.Forms[ Screen.FormCount-1 ];
   fcbBotones.Left:=475;
   fcbBotones.Top :=525;

   o2bbtnPrevio.Visible  :=False;
   o2bbtnRegresa.Visible :=False;
   o2bbtnCancela.Visible :=False;
   o2bbtnGraba.Visible   :=False;
   o2bbtnAcepta.Visible  :=False;
   o2bbtnAnula.Visible   :=False;
   o2bbtnContab.Visible  :=False;
   o2bbtnNuevo.Visible   :=False;
   o2bbtnAplica.Visible  :=False;
   o2bbtnImprime.Visible:=False;

   ShowMessage( 'Nombre : '+ Screen.Forms[ Screen.FormCount-1 ].Name );

   if wPrevio then
   begin
      o2bbtnPrevio.Visible:=True;
      wComponente:=nil;
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'Z2bbtnPreview' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnPrevio'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnPrevio'].Name:=xName;
      end;
   end;
   if wPAplica then
   begin
      o2bbtnPAplica.Visible:=True;
      wComponente:=nil;
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'Z2bbtnPAplica' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnPAplica'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnPAplica'].Name:=xName;
      end;
   end;
   if wRegresa then
   begin
      o2bbtnRegresa.Visible:=True;
      wComponente:=nil;
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'bbtnRegresa' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnRegresa'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnRegresa'].Name:=xName;
      end;
   end;
   if wCancelar then
   begin
      o2bbtnCancela.Visible:=True;
      wComponente:=nil;
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'bbtnCancela' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnCancela'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnCancela'].Name:=xName;
      end;
   end;
   if wGrabar then
   begin
      o2bbtnGraba.Visible:=True;
      wComponente:=nil;
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'Z2bbtnGraba' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnGraba'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnGraba'].Name   :=xName;
      end;
   end;
   if wAceptar then
   begin
      o2bbtnAcepta.Visible:=True;
      wComponente:=nil;
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'Z2bbtnAcepta' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnAcepta'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnAcepta'].Name   :=xName;
      end;
   end;
   if wAnular then
   begin
      o2bbtnAnula.Visible:=True;
      wComponente:=nil;
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'Z2bbtnAnula' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnAnula'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnAnula'].Name   :=xName;
      end;
   end;
   if wContabiliza then
   begin
      o2bbtnContab.Visible:=True;
      wComponente:=nil;
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'Z2bbtnContab' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnContab'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnContab'].Name   :=xName;
      end;
   end;
   if wNuevo then
   begin
      o2bbtnNuevo.Visible:=True;
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'Z2bbtnNuevo' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnNuevo'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnNuevo'].Name   :=xName;
      end;
   end;
   if wAplica then
   begin
      o2bbtnAplica.Visible:=True;
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'Z2bbtnAplica' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnAplica'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnAplica'].Name   :=xName;
      end;
   end;
   if wImprimir then
   begin
      o2bbtnImprime.Visible:=True;
      {
      wComponente:=TCustomControl( Screen.Forms[ Screen.FormCount-1 ].FindComponent( 'Z2bbtnAplica' ) );
      if wComponente<>nil then
      begin
         fcbBotones.Buttons['o2bbtnAplica'].OnClick:=TBitBtn( wComponente ).OnClick;
         xName :=TBitBtn( wComponente ).Name;
         wComponente.Free;
         fcbBotones.Buttons['o2bbtnAplica'].Name   :=xName;
      end;
      }
   end;
end;


procedure TFVariables.ConfiguraPaneles( wwFormaL : TForm );
var
   i, y, wPosFin : Integer;
   wPanel, wPanelName, wPanelColor : String;
begin
   y:=0;
   wPanel:=IniFile.ReadString('PANEL','PANEL_'+StrZero( IntToStr( y ), 3 ),'');
   if wPanel<>'' then
   begin
      wPosFin:=Pos( '][', wPanel )-1;
      wPanelName:=Copy( wPanel, 1, wPosFin );
      wPanelColor:=Copy( wPanel, wPosFin+3, Length( wPanel )-wPosFin+3 );
      for i:=0 to wwFormaL.ComponentCount-1 do
      begin
          if wwFormaL.Components[i].ClassName = 'TPanel' then
          begin
             TPanel( wwFormaL.components[i] ).Color:= StringToColor( wPanelColor );
          end;
      end;
   end;

   wwFormaL.Color:=StringToColor( wPanelColor );

   for i:=0 to wwFormaL.ComponentCount-1 do
   begin
       if wwFormaL.Components[i].ClassName = 'TGroupBox' then
       begin
          TGroupBox( wwFormaL.components[i] ).Color:= StringToColor( wPanelColor );
       end;
       if wwFormaL.Components[i].ClassName = 'TRadioGroup' then
       begin
          TRadioGroup( wwFormaL.components[i] ).Color:= StringToColor( wPanelColor );
       end;
   end;

   For y:=1 to 10 do
   begin

       wPanel:=IniFile.ReadString('PANEL','PANEL_'+StrZero( IntToStr( y ), 3 ),'');

       if wPanel<>'' then
       begin
          wPosFin:=Pos( '][', wPanel )-1;
          wPanelName:=Copy( wPanel, 1, wPosFin );
          wPanelColor:=Copy( wPanel, wPosFin+3, Length( wPanel )-wPosFin+3 );

          for i:=0 to wwFormaL.ComponentCount-1 do
          begin
              if wwFormaL.Components[i].ClassName = 'TPanel' then
              begin
                 if TPanel( wwFormaL.components[i] ).Name=wPanelName then
                 begin
                    TPanel( wwFormaL.components[i] ).Color:= StringToColor( wPanelColor );
                    Break;
                 end;
              end;
          end;
       end;
   end;
end;


procedure TFVariables.ConfiguraLabels( wwFormaL : TForm );
var
   i, y, wPosIni, wPosFin : Integer;
   wLabel, wLabelName, wLabelCaption : String;
   wLabelTamano, wLabelColor, wLabelFont, wLabelNegrita : String;
begin

   wLabelTamano :=IniFile.ReadString('LABEL','TAMAÑO','');
   wLabelColor  :=IniFile.ReadString('LABEL','COLOR','');
   wLabelFont   :=IniFile.ReadString('LABEL','FONT','');
   wLabelNegrita:=IniFile.ReadString('LABEL','NEGRITA','');

   For y:=1 to 100 do
   begin

       wLabel:=IniFile.ReadString('LABEL','LABEL_'+StrZero( IntToStr( y ), 3 ),'');

       if wLabel<>'' then
       begin
          wPosIni:=Pos( '=', wLabel )+1;
          wPosFin:=Pos( '][', wLabel )-1;
          wLabelName:=Copy( wLabel, 1, wPosFin );
          wLabelCaption:=Copy( wLabel, wPosFin+3, Length( wLabel )-wPosFin+3 );

          for i:=0 to wwFormaL.ComponentCount-1 do
          begin
              if wwFormaL.Components[i].ClassName = 'TLabel' then
              begin

                 TLabel( wwFormaL.components[i] ).Font.Color:=StringToColor( wLabelColor );
                 TLabel( wwFormaL.components[i] ).Font.Name :=wLabelFont;
                 TLabel( wwFormaL.components[i] ).Font.Size :=StrToInt( wLabelTamano );

                 if wLabelNegrita='SI' then
                    TLabel( wwFormaL.components[i] ).Font.Style:=TLabel( wwFormaL.components[i] ).Font.Style + [fsBold]
                 else
                    TLabel( wwFormaL.components[i] ).Font.Style:=TLabel( wwFormaL.components[i] ).Font.Style - [fsBold];

                 if TLabel( wwFormaL.components[i] ).Name=wLabelName then
                 begin
                    TLabel( wwFormaL.components[i] ).Caption:=wLabelCaption;
                    Break;
                 end;
              end;
          end;

       end;
   end;
end;


procedure TFVariables.ConfiguraCombos( wwFormaL : TForm );
var
   i, y, wPosIni, wPosFin : Integer;
   wArriba, wAbajo, wDerecha, wIzquierda : String;
   wColorFondo, wFontTamano, wFontColor, wFontName, wPanel : String;
   wPanelColor, wColorFondoEdit : String;
begin
   wArriba    :=IniFile.ReadString('COMBOS','BORDE_ARRIBA','');
   wAbajo     :=IniFile.ReadString('COMBOS','BORDE_ABAJO','');
   wDerecha   :=IniFile.ReadString('COMBOS','BORDE_DERECHA','');
   wIzquierda :=IniFile.ReadString('COMBOS','BORDE_IZQUIERDA','');
   wColorFondo:=IniFile.ReadString('COMBOS','COLOR_FONDO','');
   wFontTamano:=IniFile.ReadString('COMBOS','FONT_TAMAÑO','');
   wFontColor :=IniFile.ReadString('COMBOS','FONT_COLOR','');
   wFontName  :=IniFile.ReadString('COMBOS','FONT_NAME','');
   wColorFondoEdit:=IniFile.ReadString('COMBOS','COLOR_FONDO_EDIT','');

   wPanel     :=IniFile.ReadString('PANEL','PANEL_'+StrZero( IntToStr( 1 ), 3 ),'');
   if wPanel<>'' then
   begin
      wPosFin:=Pos( '][', wPanel )-1;
      wPanelColor:=Copy( wPanel, wPosFin+3, Length( wPanel )-wPosFin+3 );
   end;

   for i:=0 to wwFormaL.ComponentCount-1 do
   begin

       if wwFormaL.Components[i].ClassName = 'TwwDBLookupCombo' then
       begin

        if ( TwwDBLookupCombo( wwFormaL.components[i] ).Name<>'dblcCia'  ) and
           ( TwwDBLookupCombo( wwFormaL.components[i] ).Name<>'dblcClAux') then
        begin

          TwwDBLookupCombo( wwFormaL.components[i] ).Frame.Enabled:=False;

          if wIzquierda='SI' then
             TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders + [efLeftBorder]
          else
             TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders - [efLeftBorder];

          if wArriba='SI' then
             TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders + [efTopBorder]
          else
             TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders - [efTopBorder];

          if wDerecha='SI' then
             TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders + [efRightBorder]
          else
             TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders - [efRightBorder];

          if wAbajo='SI' then
             TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders + [efBottomBorder]
          else
             TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupCombo( wwFormaL.components[i] ).Frame.NonFocusBorders - [efBottomBorder];

          TwwDBLookupCombo( wwFormaL.components[i] ).Frame.Transparent:=True;
          TwwDBLookupCombo( wwFormaL.components[i] ).Font.Color:=StringToColor( wFontColor );
          TwwDBLookupCombo( wwFormaL.components[i] ).Font.Name :=wFontName;
          TwwDBLookupCombo( wwFormaL.components[i] ).Font.Size :=StrToInt( wFontTamano );
          TwwDBLookupCombo( wwFormaL.components[i] ).Color     :=StringToColor( wColorFondo );
          TwwDBLookupCombo( wwFormaL.components[i] ).Frame.Enabled:=True;
        end;
       end;

       if wwFormaL.Components[i].ClassName = 'TwwDBLookupComboDlg' then
       begin
          TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.Enabled:=False;

          if wIzquierda='SI' then
             TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders + [efLeftBorder]
          else
             TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders - [efLeftBorder];

          if wArriba='SI' then
             TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders + [efTopBorder]
          else
             TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders - [efTopBorder];

          if wDerecha='SI' then
             TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders + [efRightBorder]
          else
             TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders - [efRightBorder];

          if wAbajo='SI' then
             TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders + [efBottomBorder]
          else
             TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.NonFocusBorders - [efBottomBorder];

          TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.Enabled:=True;
          TwwDBLookupComboDlg( wwFormaL.components[i] ).Frame.Transparent:=True;
          TwwDBLookupComboDlg( wwFormaL.components[i] ).Font.Color:=StringToColor( wFontColor );
          TwwDBLookupComboDlg( wwFormaL.components[i] ).Font.Name :=wFontName;
          TwwDBLookupComboDlg( wwFormaL.components[i] ).Font.Size :=StrToInt( wFontTamano );
          TwwDBLookupComboDlg( wwFormaL.components[i] ).Color     :=StringToColor( wColorFondo );
       end;


       if wwFormaL.Components[i].ClassName = 'TwwDBEdit' then
       begin
          TwwDBEdit( wwFormaL.components[i] ).Frame.Enabled:=False;

          if wIzquierda='SI' then
             TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders + [efLeftBorder]
          else
             TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders - [efLeftBorder];

          if wArriba='SI' then
             TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders + [efTopBorder]
          else
             TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders - [efTopBorder];

          if wDerecha='SI' then
             TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders + [efRightBorder]
          else
             TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders - [efRightBorder];

          if wAbajo='SI' then
             TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders + [efBottomBorder]
          else
             TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBEdit( wwFormaL.components[i] ).Frame.NonFocusBorders - [efBottomBorder];

          TwwDBEdit( wwFormaL.components[i] ).Frame.Enabled:=True;
          TwwDBEdit( wwFormaL.components[i] ).Frame.Transparent:=True;
          TwwDBEdit( wwFormaL.components[i] ).Font.Color:=StringToColor( wFontColor );
          TwwDBEdit( wwFormaL.components[i] ).Font.Name :=wFontName;
          TwwDBEdit( wwFormaL.components[i] ).Font.Size :=StrToInt( wFontTamano );
          TwwDBEdit( wwFormaL.components[i] ).Color     :=StringToColor( wColorFondo );

       end;

       if wwFormaL.Components[i].ClassName = 'TwwDBDateTimePicker' then
       begin
          TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.Enabled:=False;

          if wIzquierda='SI' then
             TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders + [efLeftBorder]
          else
             TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders - [efLeftBorder];

          if wArriba='SI' then
             TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders + [efTopBorder]
          else
             TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders - [efTopBorder];

          if wDerecha='SI' then
             TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders + [efRightBorder]
          else
             TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders - [efRightBorder];

          if wAbajo='SI' then
             TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders + [efBottomBorder]
          else
             TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.NonFocusBorders - [efBottomBorder];

          TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.Enabled:=True;
          TwwDBDateTimePicker( wwFormaL.components[i] ).Frame.Transparent:=True;
          TwwDBDateTimePicker( wwFormaL.components[i] ).Font.Color:=StringToColor( wFontColor );
          TwwDBDateTimePicker( wwFormaL.components[i] ).Font.Name :=wFontName;
          TwwDBDateTimePicker( wwFormaL.components[i] ).Font.Size :=StrToInt( wFontTamano );
          TwwDBDateTimePicker( wwFormaL.components[i] ).Color     :=StringToColor( wColorFondo );
       end;

       if wwFormaL.Components[i].ClassName = 'TwwDBSpinEdit' then
       begin
           TwwDBSpinEdit( wwFormaL.components[i] ).Frame.Enabled:=False;

          if wIzquierda='SI' then
             TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders + [efLeftBorder]
          else
             TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders - [efLeftBorder];

          if wArriba='SI' then
             TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders + [efTopBorder]
          else
             TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders - [efTopBorder];

          if wDerecha='SI' then
             TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders + [efRightBorder]
          else
             TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders - [efRightBorder];

          if wAbajo='SI' then
             TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders + [efBottomBorder]
          else
             TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders:=TwwDBSpinEdit( wwFormaL.components[i] ).Frame.NonFocusBorders - [efBottomBorder];

          TwwDBSpinEdit( wwFormaL.components[i] ).Frame.Enabled:=True;
          TwwDBSpinEdit( wwFormaL.components[i] ).Frame.Transparent:=True;
          TwwDBSpinEdit( wwFormaL.components[i] ).Font.Color:=StringToColor( wFontColor );
          TwwDBSpinEdit( wwFormaL.components[i] ).Font.Name :=wFontName;
          TwwDBSpinEdit( wwFormaL.components[i] ).Font.Size :=StrToInt( wFontTamano );
          TwwDBSpinEdit( wwFormaL.components[i] ).Color     :=StringToColor( wColorFondo );

       end;
       if wwFormaL.Components[i].ClassName = 'TEdit' then
       begin
          //TwwDBSpinEdit( wwFormaL.components[i] ).Frame.Transparent:=True;
//          TwwDBSpinEdit( wwFormaL.components[i] ).Font.Color:=StringToColor( wFontColor );
  //        TwwDBSpinEdit( wwFormaL.components[i] ).Font.Name :=wFontName;
    //      TwwDBSpinEdit( wwFormaL.components[i] ).Font.Size :=StrToInt( wFontTamano );
          TEdit( wwFormaL.components[i] ).Color      :=StringToColor( wColorFondoEdit );
//          TEdit( wwFormaL.components[i] ).BorderStyle:=bsNone;
//          TEdit( wwFormaL.components[i] ).BevelInner :=bvNone;
//          TEdit( wwFormaL.components[i] ).BevelOuter :=bvNone;
       end;
   end;
end;


procedure TFVariables.ConfiguraGrids( wwFormaL : TForm );
var
   i, y, wPosIni, wPosFin : Integer;
   wDetalleFontTamano, wDetalleFontColor, wDetalleFontName : String;
   wTituloFontTamano, wTituloFontColor, wTituloFontName : String;
   wTituloColor, wPieColor : String;
   wDetalleColorFila, wDetalleColorFilaAlterna, wDetalleColorFilaActivo : String;
begin

   wDetalleFontTamano:=IniFile.ReadString('GRID','DETALLE_FONT_TAMAÑO','');
   wDetalleFontColor :=IniFile.ReadString('GRID','DETALLE_FONT_COLOR','');
   wDetalleFontName  :=IniFile.ReadString('GRID','DETALLE_FONT_NAME','');
   wDetalleColorFila :=IniFile.ReadString('GRID','DETALLE_COLOR_FILA','');
   wDetalleColorFilaAlterna:=IniFile.ReadString('GRID','DETALLE_COLOR_FILA_ALTERNA','');
   wDetalleColorFilaActivo :=IniFile.ReadString('GRID','DETALLE_COLOR_FILA_ACTIVO', '');

   wTituloFontTamano:=IniFile.ReadString('GRID','TITULO_FONT_TAMAÑO','');
   wTituloFontColor :=IniFile.ReadString('GRID','TITULO_FONT_COLOR','');
   wTituloFontName  :=IniFile.ReadString('GRID','TITULO_FONT_NAME','');
   wTituloColor     :=IniFile.ReadString('GRID','TITULO_COLOR','');
   wPieColor        :=IniFile.ReadString('GRID','PIE_COLOR','');

   for i:=0 to wwFormaL.ComponentCount-1 do
   begin
       if wwFormaL.Components[i].ClassName = 'TwwDBGrid' then
       begin

          TwwDBGrid( wwFormaL.components[i] ).Font.Color:=StringToColor( wDetalleFontColor );
          TwwDBGrid( wwFormaL.components[i] ).Font.Name :=wDetalleFontName;
          TwwDBGrid( wwFormaL.components[i] ).Font.Size :=StrToInt( wDetalleFontTamano );

          TwwDBGrid( wwFormaL.components[i] ).TitleFont.Color:=StringToColor( wTituloFontColor );
          TwwDBGrid( wwFormaL.components[i] ).TitleFont.Name :=wTituloFontName;
          TwwDBGrid( wwFormaL.components[i] ).TitleFont.Size :=StrToInt( wTituloFontTamano );
          TwwDBGrid( wwFormaL.components[i] ).TitleColor     :=StringToColor( wTituloColor );
          TwwDBGrid( wwFormaL.components[i] ).FooterColor    :=StringToColor( wPieColor );
          TwwDBGrid( wwFormaL.components[i] ).LineColors.DataColor            :=StringToColor( wDetalleColorFila );
          TwwDBGrid( wwFormaL.components[i] ).PaintOptions.AlternatingRowColor:=StringToColor( wDetalleColorFilaAlterna );
          TwwDBGrid( wwFormaL.components[i] ).PaintOptions.ActiveRecordColor  :=StringToColor( wDetalleColorFilaActivo );
          {
          if TLabel( wwFormaL.components[i] ).Name=wLabelName then
          begin
             TLabel( wwFormaL.components[i] ).Caption:=wLabelCaption;
             Break;
          end;
          }
       end;
   end;
end;


procedure TFVariables.ConfiguraForma( wwForma : TForm );
begin
   inifile:=TIniFile.Create('C:\oaEjecuta\oaCFG.ini');

   //ConfiguraPaneles( wwForma  );

   //ConfiguraCombos( wwForma  );

   ConfiguraLabels( wwForma  );

   //ConfiguraGrids( wwForma );

   wwForma.Repaint;
   wwForma.Refresh;
end;

Function TFVariables.StrZero(wNumero:String;wLargo:Integer):string;
var
  i : integer;
  s, xTemp : string;
begin
  s := '';
  for i:=1 to wLargo do
  	s := s+'0';

  s := s+trim(wNumero);
  xTemp := copy(s,length(s)-(wLargo-1),wLargo);
	result := xTemp;
end;


procedure TFVariables.FormCreate(Sender: TObject);
begin
   w_Max_Formas:=5;
end;

procedure TFVariables.SetDCOMC(Value: TSocketConnection);
begin
   sktDComC := Value;
   if sktDComC <> nil then
   begin
      sktDComC.FreeNotification(Self);
   end;
end;

end.
