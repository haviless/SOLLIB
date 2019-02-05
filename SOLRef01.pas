unit SOLRef01;
// 11 de Diciembre del 2003
//
//  Cambios:
//
//  En Referencias se Añadio Jerarquia para LookUps 09/01/2002
//  Se añadio Tabla 2 para Generar Reportes         09/01/2002
//
//  if wTipoAp='HELP'  // para aperturar filtro para mantenimiento de una tabla desde un ComboBox
//  else // los otro Referencias y Mant normal
//

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Db, StdCtrls, DBClient, MConnect, Wwdatsrc, wwclient, Wwdbigrd,
  Wwdbgrid, wwdblook, Wwdbdlg, ExtCtrls, Buttons, Mask, wwdbedit, DBCtrls,
  wwdbdatetimepicker, Wwkeycb, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppBands, ppCtrls, ppPrnabl, ppVar, CheckLst,
  ppviewr, GridControl, Spin, ComCtrls, Menus, ppEndUsr, FileCtrl,
  ppTypes, ppDBBDE, SOLPreview, inifiles, ppStrtch, ppSubRpt, Printers, ppForms,
  variants, StrContainer, fcLabel, RecError, wwcheckbox, fcpanel, fcImager,
  fcButton, fcImgBtn, fcShapeBtn, fcClearPanel, fcButtonGroup, ToolWin,
  SConnect,  shellapi, wwexport;

type

  TSolMantenimiento = class(TForm)
    cds1: TwwClientDataSet;
    ds1: TwwDataSource;               
    ds2: TwwDataSource;
    CdsGrid: TwwClientDataSet;
    dbgTables: TwwDBGrid;
    dbgFiltro: TwwDBGrid;
    lbRefer: TListBox;
    pnlPie: TPanel;
    pnlColumna: TPanel;
    Z2btnActReg: TwwIButton;
    cdsBusca: TwwClientDataSet;
    dsBusca: TwwDataSource;
    pnlBusca: TPanel;
    lblBusca1: TLabel;
    lblBusca2: TLabel;
    isBusca: TwwIncrementalSearch;
    pnlFiltro: TPanel;
    lbCampos2: TListBox;
    lbCamposReal: TListBox;
    lbFiltro: TListBox;
    lbOrden: TListBox;
    Label1: TLabel;
    pnlFiltro2: TPanel;
    Label3: TLabel;
    bbtnOkF: TBitBtn;
    bbtnCancelF: TBitBtn;
    lbFiltroReal: TListBox;
    edtRegistros: TEdit;
    lblRegistros: TLabel;
    lbOrdenReal: TListBox;
    ppdbMant: TppDBPipeline;
    pprMant: TppReport;
    Cabecera: TppHeaderBand;
    Detalle: TppDetailBand;
    lblTitulo: TppLabel;
    lblCia: TppLabel;  
    ppsvFecha: TppSystemVariable;
    ppsvHora: TppSystemVariable;
    ppsvPagina: TppSystemVariable;
    ppLine1: TppLine;
    ppLine2: TppLine;
    pnlReporte: TPanel;
    clbCampos: TCheckListBox;
    Label5: TLabel;
    edtTitulo: TEdit;
    Label4: TLabel;
    bbtnOkR: TBitBtn;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    clbCamposReal: TCheckListBox;
    clbCampos2: TListBox;
    grdCtrl: TGridControl;
    dsDT: TwwDataSource;
    pnlInfor: TPanel;
    Label6: TLabel;
    bbtnOKFilt: TBitBtn;
    bbtnCancFilt: TBitBtn;
    dbgFiltros: TwwDBGrid;
    dbeNameFilt: TwwDBEdit;
    Label7: TLabel;
    bbtnSaveFil: TBitBtn;
    Panel1: TPanel;
    fclTitulo: TfcLabel;
    bbtnCerrarI: TBitBtn;
    bbtnCerrarF: TBitBtn;
    Z2bbtnConsulta: TBitBtn;
    Z2bbtnModifica: TBitBtn;
    pnlFRegistro: TPanel;
    pnlRegistro: TPanel;
    bbtnOk: TBitBtn;
    bbtnCancela: TBitBtn;
    clbCamposP: TListBox;
    clbCamposA: TListBox;
    sbBorraF: TSpeedButton;
    sbFiltra: TSpeedButton;
    sbBorraO: TSpeedButton;
    pnlbtns: TPanel;
    bbtnDate: TBitBtn;
    meDias: TMaskEdit;
    bbtnGrupos: TBitBtn;
    seGrupo: TSpinEdit;
    cbSuprime: TCheckBox;
    lblDias: TLabel;
    ppdFiltro: TppDesigner;
    mmFiltro: TMainMenu;
    Archivo1: TMenuItem;
    Save1: TMenuItem;
    Exit1: TMenuItem;
    pnlDiseno: TPanel;
    Label2: TLabel;
    bbtnRepOk: TBitBtn;
    bbtnRepCa: TBitBtn;
    cdsReporte: TwwClientDataSet;
    dsReporte: TwwDataSource;
    dbgReporte: TwwDBGrid;
    Label8: TLabel;
    dbeNombre: TwwDBEdit;
    SOLPrevio1: TSOLPrevio;
    bbtnPublica: TBitBtn;
    rgTipo: TRadioGroup;
    bbtnUsuario: TBitBtn;
    pnlAcceso: TPanel;
    dbgUsuSi: TwwDBGrid;
    dbgUsuNo: TwwDBGrid;
    cdsUsuSi: TwwClientDataSet;
    cdsUsuNo: TwwClientDataSet;
    dsUsuSi: TwwDataSource;
    dsUsuNo: TwwDataSource;
    bbtnCancAc: TBitBtn;
    bbtnSi: TBitBtn;
    bbtnNo: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    pnlLibre: TPanel;
    lbCampos: TCheckListBox;
    bbtnInicial: TBitBtn;
    cdsPlan: TwwClientDataSet;
    clbRepD: TCheckListBox;
    Label12: TLabel;
    clbRepDReal: TCheckListBox;
    clbRepDTabla: TCheckListBox;
    SpeedButton1: TSpeedButton;
    lblSection: TLabel;
    dblcCiaRep: TwwDBLookupCombo;
    edtCiaRepDes: TEdit;
    Label13: TLabel;
    rgOrienta: TRadioGroup;
    ConfigurarPgina1: TMenuItem;
    pnlExporta: TPanel;
    bbtnExpOK: TBitBtn;
    bbtnExpCanc: TBitBtn;
    Bevel1: TBevel;
    Label14: TLabel;
    sdGraba: TSaveDialog;
    scFile: TStrContainer;
    meChar: TMaskEdit;
    Label15: TLabel;
    pbExp: TProgressBar;
    bbtnOR: TBitBtn;
    lblTituloM: TLabel;
    ppLabel1: TppLabel;
    pplReg: TppLabel;
    fclVersion: TfcLabel;
    cdsRep2: TwwClientDataSet;
    dsRep2: TwwDataSource;
    ppdbMantD: TppDBPipeline;
    cdsResultSet: TwwClientDataSet;
    Memo1: TMemo;
    seIni: TSpinEdit;
    seLen: TSpinEdit;
    lblSub1: TLabel;
    lblSub2: TLabel;
    rgValor: TRadioGroup;
    cbCampos: TComboBox;
    DBMemo1: TDBMemo;
    cdsGrid2: TwwClientDataSet;
    cdsFiltro2: TwwClientDataSet;
    dsFiltro2: TwwDataSource;
    bbtnCierra: TBitBtn;
    rgLike: TRadioGroup;
    rgFiltro: TRadioGroup;
    dbgFiltro2: TwwDBGrid;
    eb1: TwwExpandButton;
    bbtnSuma: TfcShapeBtn;
    bbtnDiseno: TfcShapeBtn;
    Z2bbtnImprime: TfcShapeBtn;
    Z2bbtnFiltro: TfcShapeBtn;
    bbtnRef: TfcShapeBtn;
    bbtnAcceso: TfcShapeBtn;
    bbtnSalir: TfcShapeBtn;
    bbtnFilt: TfcShapeBtn;
    bbtnExporta: TfcShapeBtn;
    bbtnExcel: TfcShapeBtn;
    cdsQryT: TwwClientDataSet;
    bbtnUsuarios: TfcShapeBtn;
    procedure btnQueryClick(Sender: TObject);
    procedure ds1DataChange(Sender: TObject; Field: TField);
    procedure Z2btnActRegClick(Sender: TObject);
    procedure bbtnOkClick(Sender: TObject);
    procedure dbgFiltroKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgFiltroDblClick(Sender: TObject);
    procedure bbtnCancelaClick(Sender: TObject);
    procedure SetFocusInicial;
    procedure dbgFiltroTitleButtonClick(Sender: TObject; AFieldName: String);
    procedure isBuscaExit(Sender: TObject);
    procedure Z2bbtnFiltroClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure lbCampos2EndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure lbCampos2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbFiltroDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure bbtnOkFClick(Sender: TObject);
    procedure bbtnCancelFClick(Sender: TObject);
    procedure bbtnBasuraDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure sbOrdenaClick(Sender: TObject);
    procedure lbOrdenDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure sbBorraFClick(Sender: TObject);
    procedure sbBorraOClick(Sender: TObject);
    procedure dbgTablesCellChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Z2bbtnImprimeClick(Sender: TObject);
    procedure clbCamposMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure clbCamposDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure bbtnOkRClick(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure pprMantPreviewFormCreate(Sender: TObject);
    procedure clbCamposMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure bbtnAccesoClick(Sender: TObject);
    procedure bbtnSalirClick(Sender: TObject);
    procedure bbtnFiltClick(Sender: TObject);
    procedure bbtnOKFiltClick(Sender: TObject);
    procedure bbtnCancFiltClick(Sender: TObject);
    procedure bbtnSaveFilClick(Sender: TObject);
    procedure bbtnCerrarFClick(Sender: TObject);
    procedure bbtnCerrarIClick(Sender: TObject);
    procedure sbFiltraClick(Sender: TObject);
    procedure dbgFiltrosDblClick(Sender: TObject);
    procedure dbgFiltrosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnSumaClick(Sender: TObject);
    procedure bbtnDateClick(Sender: TObject);
    procedure dbgFiltroCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure bbtnGruposClick(Sender: TObject);
    procedure bbtnDisenoClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure dbgReporteDblClick(Sender: TObject);
    procedure bbtnRepOkClick(Sender: TObject);
    procedure bbtnRepCaClick(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure dbgReporteRowChanged(Sender: TObject);
    procedure dbgReporteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bbtnPublicaClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure bbtnUsuarioClick(Sender: TObject);
    procedure bbtnCancAcClick(Sender: TObject);
    procedure bbtnSiClick(Sender: TObject);
    procedure bbtnNoClick(Sender: TObject);
    procedure lbCamposClickCheck(Sender: TObject);
    procedure bbtnInicialClick(Sender: TObject);
    procedure dbgFiltrosRowChanged(Sender: TObject);
    procedure bbtnRefClick(Sender: TObject);
    procedure dblcCiaRepExit(Sender: TObject);
    procedure ConfigurarPgina1Click(Sender: TObject);
    procedure bbtnExportaClick(Sender: TObject);
    procedure bbtnExpCancClick(Sender: TObject);
    procedure bbtnExpOKClick(Sender: TObject);
    procedure bbtnORClick(Sender: TObject);
    procedure dbgFiltroUpdateFooter(Sender: TObject);
    procedure rgFiltroClick(Sender: TObject);
    procedure rgValorClick(Sender: TObject);
    procedure cdsRep2ReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure bbtnCierraClick(Sender: TObject);
    procedure eb1BeforeExpand(Sender: TObject);
    procedure lbFiltroDblClick(Sender: TObject);
    procedure lbOrdenDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnExcelClick(Sender: TObject);
    procedure bbtnUsuariosClick(Sender: TObject);

  private
    { Private declarations }

    wFlSumatoria : String[2];
    xContSuma    : Integer;
    xWhereSel    : String;
    wRutaCds     : String;

    nContPrv     : Integer;
    nContPrv2    : Integer;
    xIniOr       : Integer;
    wPacketCombo : Integer;
    wUsuarioSQL : TStrings;
    wAdmin  : String;
    wUser   : String;
    wTipoAp : String;
    wFilter : String;
    wTabla2Filter : String;
    wTitulo : String;
    wGrabaD : String;

    wFilterObliga : Boolean;
    wInsertAutom  : Boolean;
    wColors     : TStrings;
    wGrupoCols  : Integer;
    wRegistros  : Integer;
    wNoVisible  : TStrings;
    wUserCheckB : TStrings;
    wTituloFont : TFont;
    aColor : Array[0..20] of TColor;
    sColor : Array[0..20] of String;
    xxDirPub : String;
    xxDirLoc : String;
    xxServer : String;
    xxDirect : String;
    xxDirMod : String;
    xxDirPrn : String;
    xxTipRep : String;
    xxWhereT : String;
    xCurrent : string;
//
    wModulo   : String;
    wFile, wSection : String;
    xSelect   : String;
    xPipeline : TppBDEPipeline;
    xReport   : TppReport;
//
    wdblc     : Array[1..60] of TwwDBLookupCombo;
    wdblcd    : Array[1..60] of TwwDBLookupComboDlg;
    wdbedit   : Array[1..60] of TwwDBEdit;
    wdbMemo   : Array[1..60] of TDBMemo;
    wdbdtp    : Array[1..60] of TwwDBDateTimePicker;
    wcds      : Array[1..60] of TwwClientDataset;
    wcdsLookup: Array[1..60] of TwwClientDataSet;
    wlbl      : Array[1..60] of TLabel;
    wPrnTxt   : Array[1..60] of TppDBText;
    wPrnLbl   : Array[1..60] of TppLabel;
    wPrnLbl2  : Array[1..60] of TppLabel;
    wType     : Array[1..60] of String[1];
    wKey      : Array[1..60] of String[1];
    wFieldN   : Array[1..60] of String[20];
    wTableN   : Array[1..60] of String[20];
    wFlagN    : Array[1..60] of String[1];
    wPicture  : Array[1..60] of String[20];
    wStrZero  : Array[1..60] of String[1];

    wWidthReg : Array[1..60] of Integer;
    wOperator : Array[1..60] of String[2];
    wValida   : Array[1..60] of String[20];
    wPredeces : Array[1..60] of String[40];
    wFlVista  : Boolean;
    //
    wSelect   : String;
    wJoin     : String;
    wJoin2    : String;
    wSelec2   : String;
    wSelRep   : String;
    wFroRep   : String;
    
    // vhnxx 15/12/2003
    wT2Join   : String;
    wT2Join2  : String;
    wT2Selec2 : String;

    wwDBLCD2  : TwwDBLookupComboDlg;
    wwDBLC2   : TwwDBLookupCombo;

    wComp1, wComp2, wComp3, wComp4, wComp5, wComp6, wComp7, wComp8, wComp9 : Byte;
    wComx1, wComx2, wComx3, wComx4, wComx5, wComx6, wComx7 : Byte;
    // para verificar la Base de Datos
    SRV_E : String;
    SRV_D : String;
    SRV_V : String;
   	wFormatFecha : String;
    wReplacCeros : String;
    wRepFecServi : String;
    wRepFuncDate : String;
    //
    xNComp       : Integer;   // contador de Componentes Creados
    wLin, wCol   : integer;
    wFieldName   : String;
    xMaxCampos   : Integer;
    xColCampos   : Integer;   // Maxima Cantidad de Campos por columna;
    xAlturaCampos: Integer;   // Distancia entre campos ( Altura )
    xInicioCampos: Integer;
    xColAncho    : Integer;
    xLabelLeft   : Integer;   // Left de la Etiqueta
    xCampoLeft   : Integer;   // Left de Campo
    xCampoWidth  : Integer;   // Ancho de Edit
    xClAux       : String;
    xFlagDS      : Boolean;

    xVisPanel    : Boolean;
    xElemento    : String;
    xElemento2   : String;
    xElemento3   : String;
    xElemento4   : String;
    xElemReal    : String;
    xPosEleme    : Integer;
    //
    function  StrZero(wNumero:String;wLargo:Integer):string;
    procedure GrabaAuxiliar;
    procedure GeneraListBox;
    procedure Inicializar;
    Procedure PropDBE( wwDBEdit:TwwDBEdit; wwTipo:Integer; wwParent:TPanel );
    Procedure PropDBM( wwDBMemo:TDBMemo; wwTipo:Integer; wwParent:TPanel );
    Procedure PropDTP( wwDBDTP:TwwDBDateTimePicker; wwTipo:Integer; wwParent:TPanel );
    Procedure PropDBLC( wwDBLC:TwwDBLookupCombo; wwTipo:Integer; wwParent:TPanel );
    Procedure PropDBLCD( wwDBLCD:TwwDBLookupComboDlg; wwTipo:Integer; wwParent:TPanel );
    Procedure PropLBL( wwLabel:TLabel; wwCaption:String; wwParent:TPanel );
    procedure CreaCampos( wwTipo : Integer );
    procedure EliminaCampos( wDesde:Integer );
    Procedure MuestraPanel;
    Procedure ValidaCampo(Sender: TObject);
    procedure AsignaValor(Sender: TObject);
    procedure CreaLabel( xField:String; xTop,xLeft,xLN,xAnchoT : Integer);
    procedure CreaText( xField, xDFormat, xAlinea :String; xTop,xLeft,xLN,xAnchoT : Integer);
    procedure DBEExit( Sender: TObject );
    //
    Function  ValidaRegistro : Boolean;
    Function  BuscaRegistro( xTipo : String ) : Boolean;
    Function  ConsistenciaCampo( xN : Integer ): Boolean;
    Function  ConsistenciaTexto( xCampo, xOperator, xValida : String ): Boolean;
    Function  ConsistenciaDate( xCampo:Tdate; xOperator:String; xValida:TDate ): Boolean;
    Function  ConsistenciaReal( xCampo:Real; xOperator:String; xValida:Real ): Boolean;
    Function  GeneraSQLProv : WideString ;
    procedure AplicaDatos( wCDS:TClientDataSet; wNomArch:String );
    procedure ListBoxToCampo( xLBox:TListBox; xNCampoT:String );
    procedure CampoToListBox( xLBox:TListBox; xNCampoT:String );
    procedure GeneraSQLReporte;
    procedure FiltraRep;
    procedure FiltraRep2;
    procedure DBLCDDropDown( Sender: TObject );
    procedure DBLCDropDown( Sender: TObject );
    procedure DBLCDDropDown1( Sender: TObject );
    procedure DBLCDDropDown2( Sender: TObject );
    procedure DBLCDDropDown3( Sender: TObject );
    procedure DBLCDDropDown4( Sender: TObject );
    procedure DBLCDDropDown5( Sender: TObject );
    procedure DBLCDDropDown6( Sender: TObject );
    procedure DBLCDDropDown7( Sender: TObject );
    procedure DBLCDDropDown8( Sender: TObject );
    procedure DBLCDDropDown9( Sender: TObject );
    procedure DBLCDropDownPred( Sender: TObject );
    procedure DBLCDropDown1( Sender: TObject );
    procedure DBLCDropDown2( Sender: TObject );
    procedure DBLCDropDown3( Sender: TObject );
    procedure DBLCDropDown4( Sender: TObject );
    procedure DBLCDropDown5( Sender: TObject );
    //
    function  BuscaColor( xxColor : String ) : TColor;
    function  BuscaStyle( xxStyle : String ) : TFontStyle;
    function  Condicion( xxCond : String ) : Boolean;
    procedure EliminaGrupos;
    procedure cds2GetText1( Sender: TField;
                           var Text: String; DisplayText: Boolean );
    procedure cds2GetText2( Sender: TField;
                           var Text: String; DisplayText: Boolean );
    procedure cds2GetText3( Sender: TField;
                           var Text: String; DisplayText: Boolean );
    procedure cds2GetText4( Sender: TField;
                           var Text: String; DisplayText: Boolean );
    procedure cds2GetText5( Sender: TField;
                           var Text: String; DisplayText: Boolean );
    procedure MuestraReporte;
    procedure MuestraGrupos;
    procedure cdsPost( xxCds:TwwClientDataSet);

    procedure DBLC1Exit( Sender: TObject );
    procedure DBLC2Exit( Sender: TObject );
    procedure DBLC3Exit( Sender: TObject );
    procedure DBLC4Exit( Sender: TObject );
    procedure DBLC5Exit( Sender: TObject );

    procedure DBLCD1Exit( Sender: TObject );
    procedure DBLCD2Exit( Sender: TObject );
    procedure DBLCD3Exit( Sender: TObject );
    procedure DBLCD4Exit( Sender: TObject );
    procedure DBLCD5Exit( Sender: TObject );
    procedure DBLCD6Exit( Sender: TObject );
    procedure DBLCD7Exit( Sender: TObject );
    procedure DBLCD8Exit( Sender: TObject );
    procedure DBLCD9Exit( Sender: TObject );
    function  SQLCombo( wComp : Byte ) : String;
    procedure ValidaDBLC( wComp : Byte );
    procedure ValidaDBLCD( wComp : Byte );
    procedure ActivaDropDown( wComp : Byte );
    procedure ActualizaCampos;
    procedure ActualizaTablas;
    procedure ActualizaGrabarTabla;
    procedure FiltraTablaRemoto( xxCds:TwwClientDataSet; xxArchivo, xxCampo, xxFilter : String  );
    procedure GeneraSQLTabla2Descripciones;
    // OBC
    {
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure mymax(var m: TWMGETMINMAXINFO); message wm_getminmaxinfo;
    }
    //

  public
    { Public declarations }
    SQL       : String;
    SQL_WHERE : String;
    wFilter2  : String;
    cds2      : TwwClientDataSet;
    wUserSQL  : String;
    wTabla    : String;
    wTabla2   : String;
    wTabla2LLave : String;
    wTabla2Order : String;
    wTablaLLave  : String;
    scTablas     : TStrContainer;
    wPacketData  : Integer;


    property  Titulo      : String   read wTitulo       write wTitulo;
    property  FilterObliga: Boolean  read wFilterObliga write wFilterObliga;
    property  FInsertAutom: Boolean  read wInsertAutom  write wInsertAutom;
    property  GrupoCols   : Integer  read wGrupoCols    write wGrupoCols;
    property  Registros   : Integer  read wRegistros    write wRegistros;
    property  Colors      : TStrings read wColors       write wColors;
    property  NoVisible   : TStrings read wNoVisible    write wNoVisible;
    property  UserCheckB  : TStrings read wUserCheckB   write wUserCheckB;
    property  UsuarioSQL  : TStrings read wUsuarioSQL   write wUsuarioSQL;
    property  TituloFont  : TFont    read wTituloFont   write wTituloFont;
    property  User        : String   read wUser         write wUser;
    property  Tipo        : String   read wTipoAp       write wTipoAP;
    procedure FiltraData( xTipo : String );
    Procedure MuestraGrid;
    Procedure MuestraGrid2;
    function  Execute ( sTabla, sModulo, sAdmin, sTipo,
                        sUser, sFilter, sTabla2Filter,
                        sFile, sSection  : String;
                        wcdsj : TwwClientDataSet;
                        wDCOM : TSocketConnection
                      ): Boolean;
    function LoadFilter : String;

    function OperClientDataSet( ClientDataSet : TwwClientDataSet;
                                Expression, Condicion : String  ) : Double;

    procedure pprMantxPreviewFormCreate(Sender: TObject);
    procedure Cierra;
    procedure ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
  end;

var
  ErrorCount : Integer;
  DCOMT     : TSocketConnection;
  SolMantenimiento: TSolMantenimiento;

implementation

uses SOLRef02, SOLRef03, SOLRef04;

{$R *.DFM}

function TSolMantenimiento.OperClientDataSet( ClientDataSet : TwwClientDataSet;
                                              Expression, Condicion : String  ) : Double;
var
  cdsClone    : TwwClientDataSet;
  bmk         : TBookmark;
  Agg         : TAggregate;
begin
  result := 0;
  if trim(Expression)= '' then Exit;
  bmk:=ClientDataSet.GetBookmark;
  cdsClone    := TwwClientDataSet.Create(nil);
  try
    with cdsClone do
    begin
      CloneCursor(ClientDataSet,True);
      Agg := Aggregates.Add;
      Agg.AggregateName := 'OPER';
      Agg.Expression := Expression;
      Agg.Active := True;
      if Trim(Condicion)<>'' then
      begin
        Filtered     := False;
        Filter       := Condicion;
        Filtered     := True;
      end;
      if Aggregates.Items[Aggregates.IndexOf('OPER')].Value<>NULL then
         result := Aggregates.Items[Aggregates.IndexOf('OPER')].Value;
      Aggregates.Clear;
    end;
    ClientDataSet.GotoBookmark(bmk);
    ClientDataSet.FreeBookmark(bmk);
  finally
    cdsClone.Free;
  end;
end;


procedure TSolMantenimiento.Inicializar;
begin
   xMaxCampos   := 36;    // Maxima Cantidad de Campos a Editar;
   xColCampos   := 12;    // Maxima Cantidad de Campos por columna;
   xInicioCampos:= 5;     // Inicio de Campos ( Altura )
   xAlturaCampos:= 24;    // Distancia entre campos ( Altura )
   xLabelLeft   := 20;    // Left de la Etiqueta
   xCampoLeft   := 120;   // Left de Campo
   xCampoWidth  := 100;   // Ancho de Combos
   xColAncho    := xCampoLeft + xCampoWidth + xLabelLeft + 5;  // Ancho del Form por Columna

   sColor[ 0] := 'clAqua';
   sColor[ 1] := 'clBlack';
   sColor[ 2] := 'clBlue';
   sColor[ 3] := 'clDkGray';
   sColor[ 4] := 'clFuchsia';
   sColor[ 5] := 'clGray';
   sColor[ 6] := 'clGreen';
   sColor[ 7] := 'clLime';
   sColor[ 8] := 'clLtGray';
   sColor[ 9] := 'clMaroon';
   sColor[10] := 'clNavy';
   sColor[11] := 'clOlive';
   sColor[12] := 'clPurple';
   sColor[13] := 'clRed';
   sColor[14] := 'clSilver';
   sColor[15] := 'clTeal';
   sColor[16] := 'clWhite';
   sColor[17] := 'clYellow';
   sColor[18] := 'clInfoBk';

   aColor[ 0] := clAqua;
   aColor[ 1] := clBlack;
   aColor[ 2] := clBlue;
   aColor[ 3] := clDkGray;
   aColor[ 4] := clFuchsia;
   aColor[ 5] := clGray;
   aColor[ 6] := clGreen;
   aColor[ 7] := clLime;
   aColor[ 8] := clLtGray;
   aColor[ 9] := clMaroon;
   aColor[10] := clNavy;
   aColor[11] := clOlive;
   aColor[12] := clPurple;
   aColor[13] := clRed;
   aColor[14] := clSilver;
   aColor[15] := clTeal;
   aColor[16] := clWhite;
   aColor[17] := clYellow;
   aColor[18] := clInfoBk;
end;


function TSolMantenimiento.Execute ( sTabla, sModulo, sAdmin, sTipo,
                                     sUser, sFilter, sTabla2Filter,
                                     sFile, sSection  : String;
                                     wcdsj : TwwClientDataSet;
                                     wDCOM : TSocketConnection
                                   ): Boolean;
VAR
   i, wExisteW, wGUID : Integer;
   wsModulo, tSQL : String; wClassSrv : PChar; wResult : string;
begin
  Screen.Cursor:= crHourGlass;
  cds1.RemoteServer:=wDCOM;

  wExisteW:=1;
  //
  if (FindWindow('TAppBuilder',Nil)<> 0) then
  begin
{     wResult:=wDCOM.AppServer.SOLEnlace1(sModulo);
     if wResult<>'' then
     begin
        ShowMessage('Avise a su Proveedor de Software(SOL-00)');
        wDCOM.Connected:=False;
        Application.Terminate;
     end;
}
{    if sModulo='LOG'  then wClassSrv:='SOL LOGsrv';
     if sModulo='ALM'  then wClassSrv:='SOL ALMsrv';
     if sModulo='CXP'  then wClassSrv:='SOL CXPsrv';
     if sModulo='FAC'  then wClassSrv:='SOL FACsrv';
     if sModulo='CXC'  then wClassSrv:='SOL CXCsrv';
     if sModulo='CAJA' then wClassSrv:='SOL CAJAsrv';
     if sModulo='CNT'  then wClassSrv:='SOL CNTsrv';
     if sModulo='ACF'  then wClassSrv:='SOL ACFsrv';
     if sModulo='RRHH' then wClassSrv:='SOL RRHHsrv';
     if sModulo='GRH'  then wClassSrv:='ERHsrv';
     if sModulo='SEG'  then wClassSrv:='SOL SEGsrv';
}
     if sModulo='CNT'  then wClassSrv:='oaCNsrv';
     if sModulo='CXP'  then wClassSrv:='oaOPsrv';
     if sModulo='CAJA' then wClassSrv:='oaTEsrv';
     if sModulo='PP'   then wClassSrv:='oaPRsrv';
     if sModulo='GRH'  then wClassSrv:='ERHsrv';
     if sModulo='APO'  then wClassSrv:='APOsrv';
     if sModulo='CRE'  then wClassSrv:='CREsrv';
     if sModulo='COB'  then wClassSrv:='COBsrv';
     if sModulo='PRE'  then wClassSrv:='PREsrv';
     //ok
     if ParamStr(1)<>'' then
        wExisteW:=FindWindow(nil, wClassSrv);
  end;

  if sModulo='LOG'  then wsModulo:='AD';
  if sModulo='ALM'  then wsModulo:='IN';
  if sModulo='CXP'  then wsModulo:='OP';
  if sModulo='FAC'  then wsModulo:='VE';
  if sModulo='CXC'  then wsModulo:='CC';
  if sModulo='CAJA' then wsModulo:='TE';
  if sModulo='CNT'  then wsModulo:='CN';
  if sModulo='ACF'  then wsModulo:='AF';
  if sModulo='PLA'  then wsModulo:='PL';
  if sModulo='GRH'  then wsModulo:='RH';
  if sModulo='PP'   then wsModulo:='PR';
  if sModulo='GPP'  then wsModulo:='IG';
  if sModulo='GFE'  then wsModulo:='IG';

  wGUID:=1;
  if wsModulo='AD'  then if wDCOM.ServerGUID='{454BF8F4-FDF3-4FF9-98A8-8B52FBAE1B10}' then else wGUID:=0;
  if wsModulo='IN'  then if wDCOM.ServerGUID='{9E3C4406-FAAC-491D-95E1-08E1B5D1F85F}' then else wGUID:=0;
  if wsModulo='OP'  then if wDCOM.ServerGUID='{685CCA99-C035-44DA-B56C-0B599F7B062A}' then else wGUID:=0;
//  if sModulo='FAC'  then if wDCOM.ServerGUID='{294DA083-D58B-11D3-B576-10005ABAB7A3}' then else wGUID:=0;
  if wsModulo='CC'  then if wDCOM.ServerGUID='{0D9012AE-6188-49DA-8578-A6949CD9E92F}' then else wGUID:=0;
  if wsModulo='TE'  then if wDCOM.ServerGUID='{BC18EC06-FCD4-42F7-B8C9-C8C0207C995D}' then else wGUID:=0;
  if wsModulo='CN'  then if wDCOM.ServerGUID='{644F1B97-F4CE-4573-9621-AA90F16B4018}' then else wGUID:=0;
//  if sModulo='ACF'  then if wDCOM.ServerGUID='{294DA083-D58B-11D3-B576-10005ABAB7A3}' then else wGUID:=0;
//  if sModulo='RRHH' then if wDCOM.ServerGUID='{294DA083-D58B-11D3-B576-10005ABAB7A3}' then else wGUID:=0;
//  if sModulo='GRH'  then if wDCOM.ServerGUID='{35946163-9315-11D4-A02F-0020AF63F8A3}' then else wGUID:=0;
  if wsModulo='PR'  then if wDCOM.ServerGUID='{AA7DEC55-8A62-4140-9DFA-BD2AA1808129}' then else wGUID:=0;
//  if sModulo='SEG'  then if wDCOM.ServerGUID='{294DA083-D58B-11D3-B576-10005ABAB7A3}' then else wGUID:=0;
  if wsModulo='IG'  then if wDCOM.ServerGUID='{1AA8B386-BFD7-49C3-9C1E-A886EB375070}' then else wGUID:=0;

  if wsModulo='RH'   then if wDCOM.ServerGUID='{9D5F5C09-2F10-42D6-9B6D-3A1373AD3D66}' then else wGUID:=0;
  if wsModulo='APO'  then if wDCOM.ServerGUID='{6893A1E6-2B7F-473E-8C71-1DE0495B9B23}' then else wGUID:=0;
  if wsModulo='CRE'  then if wDCOM.ServerGUID='{EF8501A3-94AE-11D6-9A80-005004FC893C}' then else wGUID:=0;
  if wsModulo='COB'  then if wDCOM.ServerGUID='{7A6C7183-94BF-11D6-9A80-005004FC893C}' then else wGUID:=0;
  if wsModulo='PRE'  then if wDCOM.ServerGUID='{7A6C7188-94BF-11D6-9A80-005004FC893C}' then else wGUID:=0;
  if AnsiPos(wsModulo,'AD,IN,OP,VE,CC,TE,CN,AF,PL,RH,PR,IG,APO,CRE,COB,PRE')=0 then wGUID:=0;

  wGUID:=1;
  if (wExisteW=0) or (wGUID=0) then
  begin
     ShowMessage( 'Consulte con su Proveedor OASIS');
     Exit;
  end;

///
  wTipoAp    := sTipo;

  if Length(sTabla)>0 then begin
     {  VHNXX Cambiado para que el filtro se abra con cds creados
     cds2 := wcdsj;
     cds2.Close;
     cds2.IndexName:='';
     }
     cds2 := TwwClientDataSet.Create( Self );
     cds2.ProviderName:='prvIndRef';
     cds2.RemoteServer:= wDCOM;
     cds2.OnReconcileError:=cdsRep2ReconcileError;
     pprMant.Free;
     ppdbMant.Free;
  end
  else begin
     if wTipoAp='HELP' then
     begin
        cds2:=wcdsj;
//        cds2.Close;
//        cds2.IndexName:='';
     end
     else
     begin
        cds2 := TwwClientDataSet.Create( Self );
        cds2.ProviderName:='prvIndRef';
        cds2.RemoteServer:= wDCOM;
        cds2.OnReconcileError:=cdsRep2ReconcileError;
     end;
     scTablas:= TStrContainer.Create(self);
  end;

  cdsBusca.RemoteServer  :=wDCOM;
  cdsReporte.RemoteServer:=wDCOM;
  cdsRep2.RemoteServer   :=wDCOM;
  CDSGrid.RemoteServer   :=wDCOM;
  CDSGrid2.RemoteServer  :=wDCOM;
  DCOMT                  :=wDCOM;
  cdsUsuSi.RemoteServer  :=wDCOM;
  cdsUsuNo.RemoteServer  :=wDCOM;
  cdsPlan.RemoteServer   :=wDCOM;
  cdsFiltro2.RemoteServer:=wDCOM;
  cdsQryT.RemoteServer   :=wDCOM;

//  ds2.DataSet:= cds2;

{  VHN REMOTO
  if not cdsPlan.Active then begin
     cdsPlan.Close;
     cdsPlan.DataRequest( 'Select * from PLAN20 WHERE USUARIO='''+sUser+''' AND TABLA='''+sTabla+'''' );
     cdsPlan.Open;
     cdsPlan.FieldByName('DESCRIPTION').DisplayLabel:='Nombre';
     cdsPlan.FieldByName('DESCRIPTION').DisplayWidth:=30;
     cdsPlan.FieldByName('ULTIMO').DisplayLabel:='Ultimo';
     cdsPlan.FieldByName('ULTIMO').Index:=0;
     cdsPlan.FieldByName('TABLA').Visible     :=False;
     cdsPlan.FieldByName('TITULO').Visible    :=False;
     cdsPlan.FieldByName('USUARIO').Visible   :=False;
     //cdsPlan.FieldByName('SQLUSER').Visible   :=False;
     cdsPlan.FieldByName('GRUPOS').Visible    :=False;
     cdsPlan.FieldByName('LISTFIELDL').Visible:=False;
     cdsPlan.FieldByName('LISTFIELDF').Visible:=False;
     cdsPlan.FieldByName('LISTORDERL').Visible:=False;
     cdsPlan.FieldByName('LISTORDERF').Visible:=False;
     cdsPlan.FieldByName('FECREG').Visible    :=False;
     cdsPlan.FieldByName('HORREG').Visible    :=False;
     dbgFiltros.SetControlType( 'ULTIMO',fctCheckBox,'U;N' );
  end;
}

  lblSection.Caption:='';
  if wUsuarioSQL.Count>0 then begin
     lblSection.Visible:=True;
     lblSection.Caption:=sSection;
  end;

  fclTitulo.Font:= wTituloFont;
  wTabla        := sTabla;
  wModulo       := sModulo;
  wAdmin        := sAdmin;
  wUser         := sUser;
  wFilter       := sFilter;
  wTabla2Filter := sTabla2Filter;
  wFile         := sFile;
  wSection      := sSection;

  wRutaCds:='';
  if DirectoryExists( 'C:\WINNT\SYSTEM32' ) then
     wRutaCds:='C:\WINNT\SYSTEM32\'
  else
     wRutaCds:='C:\WINDOWS\SYSTEM\';
  wRutaCds:='.\oaCDS\';

////
// Determinar el tipo de Base de Datos
////
  cdsBusca.Close;
  cdsBusca.DataRequest('Select SRV_EQUIP, SRV_DB, SRV_VERS, SRV_RUTA From SOLCONFIG');
  cdsBusca.Open;

  SRV_E:=cdsBusca.fieldbyname('SRV_EQUIP').AsString;
  SRV_D:=cdsBusca.fieldbyname('SRV_DB').AsString;
  SRV_V:=cdsBusca.fieldbyname('SRV_VERS').AsString;

  if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
  begin
    wFormatFecha:='YYYY-MM-DD';
    wReplacCeros:='COALESCE';
    wRepFecServi:='Days( CURRENT DATE ) ';
    wRepFuncDate:='DATE(';
  end
  else
  if SRV_D = 'ORACLE' then
  begin
   	wFormatFecha:='DD-MM-YYYY';
    wReplacCeros:='NVL';
    wRepFecServi:='SYSDATE';
    wRepFuncDate:='TO_DATE(';
  end;
////
// Fin
////
// vhndema
//  xxDirPub := Trim(cdsBusca.FieldByName('SRV_RUTA').AsString);
//  xxDirPub :='\\'+wDCOM.ComputerName+'\C';
  xxDirPub :='\\'+wDCOM.Address;
  xxDirLoc := 'C:';
  xxServer := 'C:';
//  xxDirect := '\SOL';
  xxDirect := '\oaUser';
  xxDirMod := '\'+wModulo;
  xxDirPrn := '\'+wSection;

  wPacketData :=30;
  wPacketCombo:=100;

  ppdFiltro.Menu.Items.Delete( 0 );
  ppdFiltro.Menu.Items[ 3 ].Visible := False;
  ppdFiltro.MergeMenu :=mmFiltro;
  result := true;

  dbgFiltro.Enabled:=False;
  Inicializar;
  xFlagDS :=False;
  wFlVista:=True;

  btnQueryClick(nil);

  xVisPanel:=False;
  bbtnFilt.Visible := Trim(wTabla)<>'';
  bbtnSalir.Left := (pnlPie.Width - bbtnSalir.Width)-5;
  Icon.Handle := Application.Icon.Handle;

  Screen.Cursor:=CrDefault;

  if not ( Tipo='HELP' ) then
     Exit
  else
     if cds1.RecordCount<=0 then
     begin
        Close;
        Exit;
     end;

  if ShowModal = mrCancel then
  begin

     cds1.Close;

     { VHNXX SE CAMBIO AL EVENTO CLOSE
     // Remoto
     if Length(sTabla)=0 then
        ActualizaTablas;
     }
     cds1 := nil;

     result := False;

     EliminaGrupos;

     if cds2.Active then
        if not (wTipoAp='HELP') then
           cds2.Close;

     cds2.IndexName:='';
     cds2.Filter   :='';
     cds2.Filtered :=False;

     cds2.PacketRecords:=-1;
     cds2.FetchOnDemand:=True;

     cds1.Free;
     cdsPlan.Close;
  end;
end;

procedure TSolMantenimiento.ActualizaTablas;
var
  i    : Integer;
  tSQL, tSQL2 : String;
begin
   tSQL:='Select * from TGE008';
   cdsGrid.Close;
   cdsGrid.IndexFieldNames:='';
   cdsGrid.Filter         :='';
   cdsGrid.Datarequest( tSQL );
   cdsGrid.Open;

   if scTablas.Lines.Count>0 then
   begin
      for i:=0 to scTablas.Lines.Count-1 do
      begin

         cdsGrid.Filtered:=False;
         cdsGrid.Filter  :='';
         cdsGrid.Filter  :='TABLANOMBRE='''+scTablas.Lines[ i ]+'''';
         cdsGrid.Filtered:=True;

         if cdsGrid.RecordCount>0 then
         begin
            while not cdsGrid.Eof do
            begin
               cdsBusca.Close;
               cdsBusca.DataRequest( cdsGrid.fieldByname('SQLSTRING').AsString );
               cdsBusca.Open;
               cdsBusca.SaveToFile( wRutaCds+cdsGrid.fieldByname('CDSNOMBRE').AsString );
               cdsGrid.Next;
            end;

            tSQL2:='Insert Into TGE009( USERID, TABLANOMBRE ) '
                  +'SELECT USERID, '''+scTablas.Lines[ i ]+''' FROM ( select USERID FROM TGE006 GROUP BY USERID ) A '
                  +'where not exists ( select USERID from TGE009 B WHERE A.USERID=B.USERID )';
            cdsBusca.Close;
            cdsBusca.DataRequest( tSQL2 );
            cdsBusca.Execute;
         end;
      end;
   end;
   cdsBusca.Close;
   cdsGrid.Close;
end;

function TSolMantenimiento.LoadFilter : String;
var
  mTabla : String;
begin
  if (trim(wTabla)='') or (trim(wUser)='')  then exit;

  if cdsPlan.Active then begin
     cdsPlan.Filtered:= False;
     cdsPlan.Filter  := '';
     cdsPlan.Filter  := 'USUARIO='''+wUser+''' AND TABLA='''+wTabla+''' AND TITULO='''+wTitulo+'''';
     cdsPlan.Filtered:= True;

     if cdsPlan.Locate('TABLA;USUARIO;ULTIMO;TITULO',VarArrayOf([wTabla,wUser,'U',wTitulo]),[]) then
     begin
        mTabla := cdsPlan.FieldByName('TABLA').AsString;

        if trim(wTabla) <> trim(mTabla) then
        begin
           Application.MessageBox ('Debe seleccionar la tabla que corresponda a informe',
                                PChar(Caption),MB_OK+MB_ICONINFORMATION);
           Exit;
        end;

        dbeNameFilt.Text:=cdsPlan.FieldByName('DESCRIPTION').AsString;
        CampoToListBox( lbFiltro,     'LISTFIELDL' );
        CampoToListBox( lbFiltroReal, 'LISTFIELDF' );
        CampoToListBox( lbOrden,      'LISTORDERL' );
        CampoToListBox( lbOrdenReal,  'LISTORDERF' );

        seGrupo.Value:=cdsPlan.FieldByName('GRUPOS').AsInteger;
        wGrupoCols   :=cdsPlan.FieldByName('GRUPOS').AsInteger;

        Result:= wSelect;
        If Length( wFilter )>0 then
           Result:=Result+' WHERE '+wFilter;
     end;

     if not cdsPlan.Found then
        if cdsPlan.eof then begin
           cdsPlan.Prior;
           result :='';
        end;
  end;
end;

procedure TSolMantenimiento.btnQueryClick(Sender: TObject);
var
  wQuery : string;
begin
  bbtnAcceso.Visible    :=False;
  bbtnRef.Visible       :=False;
  Z2bbtnConsulta.Visible:=False;
  Z2bbtnModifica.Visible:=False;
  bbtnUsuarios.Visible  :=False;

  If (wAdmin='G') then begin
     bbtnAcceso.Visible    :=True;
     bbtnRef.Visible       :=True;
  end;

  // vhn
  If (wAdmin='P') then
  begin
     bbtnUsuarios.Visible:=True;
  end;

  if trim(wTabla)='' then
  begin

     //wQuery:='SELECT CODIGO, DESCRIP, ZARCHIVO, ZPROCEDURE, LISTAREPORT, '
     //  +'LISTADETALLE, ACCESOS, ''N'' AS EDITA FROM SOLREF';

     if wTipoAp='HELP' then
        wQuery:='CDSNAME='''+cds2.Name+''''
     else
     if trim(wModulo)<> '' then
        wQuery:='ACCESOS LIKE '+''''+'%'+WModulo+',%'+'''';
        //wQuery:= wQuery + ' WHERE ACCESOS LIKE '+''''+'%'+WModulo+',%'+'''';

     cds1.DisableControls;
     //cds1.Close;
     //cds1.DataRequest(wQuery);
     //cds1.Open;
     FiltraTablaRemoto( cds1, 'SOLREF', 'ZARCHIVO', wQuery );

     dbgTables.Selected.Clear;
     dbgTables.Selected.Add( 'DESCRIP'+#9+'30'+#9+'Tablas');
     dbgTables.Selected.Add( 'ZARCHIVO'+#9+'10'+#9+'Nombre');

     cds1.IndexFieldNames:='DESCRIP';
     cds1.FieldByName('Descrip').DisplayLabel := 'Referencias';
     fclTitulo.Caption := cds1.FieldByName('Descrip').AsString;

     wQuery:='Select * from TGE005 '
            +'Where MODULOID='''+wModulo+''' and USERID='''+wUser+'''';
     cdsBusca.Close;
     cdsBusca.DataRequest( wQuery );
     cdsBusca.Open;

     if cdsBusca.RecordCount>0 then begin
        if cdsBusca.FieldByName('NIVEL').AsString='0' then
        begin
           cds1.First;
           while not cds1.Eof do begin
              cds1.Edit;
              cds1.FieldByname('EDITA').Value:='S';
              cds1.Next;
           end;
        end
        else begin
           while not cdsBusca.Eof do begin
              cds1.First;
              while not cds1.Eof do begin
                 if cds1.FieldByname('ZArchivo').AsString=cdsBusca.FieldByName('NTABLA').AsString then begin
                    cds1.Edit;
                    cds1.FieldByname('EDITA').Value:='S';
                    Break;
                 end;
                 cds1.Next;
              end;
              cdsBusca.Next;
           end;
        end;
     end;

     cds1.First;
     cds1.EnableControls;
     dbgTables.Enabled := True;
     wFlSumatoria:='N';

  end
  else begin
     fclTitulo.Caption := Titulo;
     //wQuery:='SELECT '+wReplacCeros+'(SUMAGRID,''S'') SUMAGRID, '+wReplacCeros+'(REGISTROS,0) REGISTROS '
     //       +'FROM SOLREF where ZARCHIVO='''+wTabla+'''';
     wQuery:='ZARCHIVO='''+wTabla+'''';
     cds1.DisableControls;
     //cds1.Close;
     //cds1.DataRequest(wQuery);
     //cds1.Open;

     FiltraTablaRemoto( cds1, 'SOLREF', 'ZARCHIVO', wQuery );

     wFlSumatoria:=StringReplace( cds1.FieldByName('SUMAGRID').AsString,'','S',[rfreplaceall] );

     if wRegistros>0 then
        wPacketData :=wRegistros
     else
        wPacketData :=cds1.FieldByName('REGISTROS').AsInteger;

     cds1.Close;
  end;

  bbtnSuma.Visible:=True;
  if wFlSumatoria<>'N' then begin
     bbtnSuma.Visible:=False;
  end;

  dbgFiltro.Enabled  := True;

  xFlagDS := True;

  if (wTipoAp='HELP') then
     if cds1.RecordCount<=0 then
        Exit;

  ds1DataChange( Sender, nil );
end;


procedure TSolMantenimiento.ds1DataChange(Sender: TObject; Field: TField);
var
   wQuery, wQryOrder, wQryWhere, wSQL, wCamposSel, wFilter04 : String;
   xus, xpi, xpf : Integer;
begin
   If not xFlagDS then Exit;

   lbOrden.Items.Clear;
   lbOrdenReal.Items.Clear;
   lbFiltro.Items.Clear;
   lbFiltroReal.Items.Clear;

   // Diccionario de Datos
   if Trim(wTabla)='' then
   begin
      wQuery:= 'SELECT * FROM PLAN04 WHERE ARCHIVO='
             + ''''+AnsiUpperCase(cds1.FieldByName('zArchivo').AsString)+''' '
             + 'ORDER BY ARCHIVO, DETDBGPOS';

      wFilter04:='ARCHIVO='''+AnsiUpperCase(cds1.FieldByName('zArchivo').AsString)+''' ';

      fclTitulo.Caption := cds1.FieldByName('Descrip').AsString;
   end
   else begin
      // vhn 23/09/2002
      cdsPlan.Close;
      cdsPlan.DataRequest( 'Select * from PLAN20 WHERE USUARIO='''+wUser+''' AND TABLA='''+wTabla+'''' );
      cdsPlan.Open;
      cdsPlan.FieldByName('DESCRIPTION').DisplayLabel:='Nombre';
      cdsPlan.FieldByName('DESCRIPTION').DisplayWidth:=30;
      cdsPlan.FieldByName('ULTIMO').DisplayLabel:='Ultimo';
      cdsPlan.FieldByName('ULTIMO').Index:=0;
      cdsPlan.FieldByName('TABLA').Visible     :=False;
      cdsPlan.FieldByName('TITULO').Visible    :=False;
      cdsPlan.FieldByName('USUARIO').Visible   :=False;
      //cdsPlan.FieldByName('SQLUSER').Visible   :=False;
      cdsPlan.FieldByName('GRUPOS').Visible    :=False;
      cdsPlan.FieldByName('LISTFIELDL').Visible:=False;
      cdsPlan.FieldByName('LISTFIELDF').Visible:=False;
      cdsPlan.FieldByName('LISTORDERL').Visible:=False;
      cdsPlan.FieldByName('LISTORDERF').Visible:=False;
      cdsPlan.FieldByName('FECREG').Visible    :=False;
      cdsPlan.FieldByName('HORREG').Visible    :=False;
      dbgFiltros.SetControlType( 'ULTIMO',fctCheckBox,'U;N' );

      wQuery:= 'SELECT * FROM PLAN04 WHERE ARCHIVO='+''''+wTabla+''' '
             + 'ORDER BY ARCHIVO, DETDBGPOS';

      wFilter04:= 'ARCHIVO='+''''+wTabla+''' ';
   end;

   // vhn Remoto
   CDSGrid.Close;
   CDSGrid.DataRequest(wQuery);
   CDSGrid.Open;
   {
   FiltraTablaRemoto( CDSGrid, 'PLAN04', 'ARCHIVO', wFilter04 );
   }
   CDSGrid.INDEXFIELDNAMES:='ARCHIVO;DETDBGPOS';

   if wTabla2<>'' then
   begin
      wQuery:= 'SELECT * FROM PLAN04 WHERE ARCHIVO='+''''+wTabla2+'''';
      CDSGrid2.Close;
      CDSGrid2.DataRequest(wQuery);
      CDSGrid2.Open;
      {
      FiltraTablaRemoto( CDSGrid2, 'PLAN04', 'ARCHIVO', 'ARCHIVO='+''''+wTabla2+''' ' );
      }
      CDSGrid2.INDEXFIELDNAMES:='ARCHIVO;DETDBGPOS';
   end;

   wQryOrder := '';
   if Trim(wTabla)='' then
   begin
      cdsGrid.First;
      while Not cdsGrid.Eof do begin
         If cdsGrid.FieldByName('DetDBGPos').asInteger=1 then begin
            wQryOrder := ' ORDER BY '+cdsGrid.FieldByName('Campo').AsString;
            Break;
         end;
         cdsGrid.Next;
      end;
   end;

   wCamposSel:='';
   cdsGrid.First;
   while Not cdsGrid.Eof do begin
      If wCamposSel='' then
         wCamposSel:=wCamposSel+cdsGrid.FieldByName('Campo').AsString
      else
         wCamposSel:=wCamposSel+', '+cdsGrid.FieldByName('Campo').AsString;
      cdsGrid.Next;
   end;

   wQryWhere := '';

   if trim(wTabla)='' then
   begin
      wQuery  := 'Select * from '+cds1.FieldByName('zArchivo').AsString;
      wSelect := 'Select * from '+cds1.FieldByName('zArchivo').AsString;
   end
   else begin
       // VHN VERIFICAR
      wQuery  := 'Select * from '+wTabla;
      wSelect := 'Select * from '+wTabla;
      wFroRep := 'From '+wTabla;

      If Length( wFilter )>0 then
         wQryWhere := ' WHERE ' + wFilter;
   end;

   // Lee Vista Grabada
   wSQL := LoadFilter;

   // Construye el SQL de UsuarioSQL
   wUserSQL:='';
   For xus:=0 to wUsuarioSQL.Count-1 do
       wUserSQL:= wUserSQL + Trim(wUsuarioSQL[xus])+' ';

   // Ejecuta el SQL
   FiltraData( 'NUEVO' );

end;



procedure TSolMantenimiento.Z2btnActRegClick(Sender: TObject);
begin
   if not cds2.Active then Exit;

   If pnlReporte.Visible then Exit;

   if (cds1.fieldByName('EDITA').AsString='N') or (cds1.fieldByName('EDITA').AsString='') then Exit;

   nContPrv :=0;
   nContPrv2:=0;

   CreaCampos( 1 );

   if Trim(wTabla)='' then
      dbgTables.Enabled   := False;

   dbgFiltro.Enabled   := False;
   pnlFiltro.Enabled   := False;
   pnlPie.Enabled      := False;
   pnlBtns.Enabled     := False;

   If pnlFiltro.Visible then pnlFiltro.Enabled:=False;

   pnlFRegistro.Top     := 150;
   pnlFRegistro.Visible := True;
   pnlRegistro.Enabled  := True;
   lblTituloM.Caption   := 'Adicionar Registro';
   SetFocusInicial;
   cds2.Insert;
end;


procedure TSolMantenimiento.CreaCampos( wwTipo : Integer );
var
   wwFieldTitle, xSQL9, xExisteM : String;
   xWidth, xHeight, r : Integer;
begin
   xExisteM:='N';
   wLin   := 0;
   wCol   := 0;
   xNComp := 0;
   xWidth := xColAncho;
   xHeight:= 50;
   cdsGrid.First;
   while not cdsGrid.Eof do begin

      if cdsGrid.FieldByName('Flag').AsString<>'S' then
      begin
         if Pos('.',cdsGrid.FieldByName('Campo').AsString)=0 then
            wFieldName:=cdsGrid.FieldByName('Campo').AsString
         else
            wFieldName:=Copy(cdsGrid.FieldByName('Campo').AsString, Pos('.',cdsGrid.FieldByName('Campo').AsString)+1 ,Length(cdsGrid.FieldByName('Campo').AsString)-1);

         wwFieldTitle:=cdsGrid.FieldByName('DetDBGTitle').AsString;
         xNComp:=xNComp+1;
         wFieldN[xNComp]  := wFieldName;
         wKey[xNComp]     := cdsGrid.FieldByName('DetDBGKey'  ).AsString;
         wTableN[xNComp]  := cdsGrid.FieldByName('DetDBGRefer').AsString;

         if cds1.active then begin
            If (Length(wKey[xNComp])>0) and (wTableN[xNComp]=cds1.FieldByName('zArchivo').AsString) then begin
               wType[xNComp] := 'E';
               end
            else begin
               wType[xNComp] := cdsGrid.FieldByName('TipoCombo').AsString;
            end;
         end
         else begin
            wType[xNComp] := cdsGrid.FieldByName('TipoCombo').AsString;
         end;

         wFlagN[xNComp]   :=cdsGrid.FieldByName('DetDBGNulo').AsString;
         wPicture[xNComp] :=cdsGrid.FieldByName('DetDBGPicture').AsString;
         wOperator[xNComp]:=cdsGrid.FieldByName('DetOperator').AsString;
         wValida[xNComp]  :=cdsGrid.FieldByName('DetValida').AsString;
         wPredeces[xNComp]:=cdsGrid.FieldByName('Predecesor').AsString;
         wStrZero[xNComp] :=cdsGrid.FieldByName('STRZERO').AsString;
         wWidthReg[xNComp]:=cdsGrid.FieldByName('DETDBGWIDTH').AsInteger;

         wlbl[xNComp]     := TLabel.create(self);
         PropLBL( wlbl[xNComp], wwFieldTitle, pnlRegistro );
         If wType[xNComp]='D' then begin
            wdbdtp[xNComp]:=TwwDBDateTimePicker.create(self);
            PropDTP( wdbdtp[xNComp], wwTipo, pnlRegistro );
            end
         else begin
            If wType[xNComp]='L' then begin
               wdblc[xNComp]:=TwwDBLookupCombo.create(self);
               PropDBLC( wdblc[xNComp], wwTipo, pnlRegistro );
               end
            else begin
               If wType[xNComp]='C' then begin
                  wdblcd[xNComp]:=TwwDBLookupComboDlg.create(self);
                  PropDBLCD( wdblcd[xNComp], wwTipo, pnlRegistro );
                  end
               else begin
                  If wType[xNComp]='M' then begin
                     wdbMemo[xNComp]:=TDBMemo.create(self);
                     PropDBM( wdbMemo[xNComp], wwTipo, pnlRegistro );
                  end
                  else
                  begin
                     wdbedit[xNComp]:=TwwDBEdit.create(self);
                     PropDBE( wdbedit[xNComp], wwTipo, pnlRegistro );
                  end;
               end;
            end;
         end;
         wLin := wLin + xAlturaCampos;
         If xNComp<=xColCampos then xHeight:=xHeight+xAlturaCampos;

         If wType[xNComp]='M' then begin
            xExisteM:='S';
            wLin := wLin + xAlturaCampos;
            If xNComp<=xColCampos then xHeight:=xHeight+xAlturaCampos;
         end;

         If xNComp>=xMaxCampos then cdsGrid.Last;
      end;
      cdsGrid.Next;
      If ( wLin>=(xColCampos*xAlturaCampos) ) and (not cdsGrid.Eof) then begin
         wLin   := 0;
         wCol   := wCol   + xColAncho;
         xWidth := xWidth + xColAncho;
         if xExisteM='S' then
            xWidth := xWidth + xColAncho;
         xExisteM:='N';
      end;
   end;


   // Crea Nuevo Procedimiento

   cdsGrid.First;
   while not cdsGrid.Eof do begin

      if cdsGrid.FieldByName('Flag').AsString<>'S' then
      begin

         if ( ( cdsGrid.FieldByName('TipoCombo').AsString='L' ) or
              ( cdsGrid.FieldByName('TipoCombo').AsString='C' ) ) and
            (cdsGrid.FieldByName('DetDBGRefer').AsString<>cds1.FieldByName('zArchivo').AsString) then
         begin

            if Pos('.',cdsGrid.FieldByName('Campo').AsString)=0 then
               wFieldName:=cdsGrid.FieldByName('Campo').AsString
            else
               wFieldName:=Copy(cdsGrid.FieldByName('Campo').AsString, Pos('.',cdsGrid.FieldByName('Campo').AsString)+1 ,Length(cdsGrid.FieldByName('Campo').AsString)-1);

            xSQL9:='Select * from PLAN04 '
                 +'Where ARCHIVO='''+cdsGrid.FieldByName('DetDBGRefer').AsString+''' and '
                 +      'ACTUALIZA=''S'' ';
            cdsBusca.Close;
            cdsBusca.DataRequest( xSQL9 );
            cdsBusca.Open;
            {
            xSQL9:='ARCHIVO='''+cdsGrid.FieldByName('DetDBGRefer').AsString+''' and '
                 + 'ACTUALIZA=''S'' ';
            FiltraTablaRemoto( cdsBusca, 'PLAN04', 'ARCHIVO', xSQL9 );
            }
            For r:=1 to xNComp do begin

                if wFieldN[ r ]=cdsBusca.FieldByname('CAMPO').AsString then begin

                   if wType[ r ]='D' then begin
                      wdbdtp[ r ].Enabled:=False;
                      Break;
                      end
                   else begin
                      if wType[ r ]='L' then begin
                         wdblc[ r ].Enabled:=False;
                         Break;
                         end
                      else begin
                         if wType[ r ]='C' then begin
                            wdblcd[ r ].Enabled:=False;
                            Break;
                            end
                         else begin
                            wdbedit[ r ].Enabled:=False;
                            Break;
                         end;
                      end;
                   end;
                end;
            end;
         end;
      end;
      cdsGrid.Next;
   end;

   cdsBusca.Filter  :='';
   cdsBusca.Filtered:=False;

   bbtnOk.TabOrder     := xNComp  + 2;
   bbtnCancela.TabOrder:= xNComp  + 3;
   bbtnOk.Top          := xHeight;
   bbtnCancela.Top     := xHeight;
   bbtnOk.Left         := xWidth  - 85;
   bbtnCancela.Left    := xWidth  - 50;
   pnlFRegistro.Width  := xColAncho;
   pnlFRegistro.Left   := 525-( xWidth-pnlFRegistro.Width);
   pnlRegistro.Width   := xWidth;
   pnlRegistro.Height  := xHeight - 37;
   pnlFRegistro.Width  := xWidth  + 20;
   if xExisteM='S' then
   begin
      pnlFRegistro.Width:= pnlFRegistro.Width+xColAncho;
      pnlRegistro.Width := pnlRegistro.Width +xColAncho;
   end;
   pnlFRegistro.Height := xHeight + 30;
end;


Procedure TSolMantenimiento.PropDBLC( wwDBLC:TwwDBLookupCombo; wwTipo:Integer; wwParent:TPanel );
var
   wQuery, wCampoCombo, wCampoTitle : String;
   wCampoWidth : Integer;
begin
   // Crea CDS Para El Combo
   wcds[ xNComp ]        := TwwClientDataset.create(self);
   wcds[ xNComp ].DisableControls;
   wcds[ xNComp ].name   := 'cds' + wFieldName;
   wcds[ xNComp ].RemoteServer := DComT;
   wcds[ xNComp ].providername := 'prvCombo';
   wQuery:='Select * from ' + wTableN[ xNComp ];
//   wcds[ xNComp ].PacketRecords:=wPacketCombo;
//   wcds[ xNComp ].FetchOnDemand:=False;
   wcds[ xNComp ].DataRequest(wQuery);
   wcds[ xNComp ].Open;
   wcds[ xNComp ].EnableControls;

   nContPrv2:=nContPrv2+1;
   // wcds[ xNComp ].FetchOnDemand:=True;
   // Fin CDS Para El Combo
   wwDBLC.name          := 'dblc'+wFieldName;
   wwDBLC.left          := xCampoLeft + wCol;
   wwDBLC.top           := xInicioCampos+wLin;
   wwDBLC.width         := xCampoWidth;
   wwDBLC.parentbidimode:= True;
   wwDBLC.parentcolor   := False;
   wwDBLC.parentctl3d   := True;
   wwDBLC.parentfont    := True;
   if wwTipo<>3 then begin
      wwDBLC.DataSource    := ds2;
      wwDBLC.DataField     := wFieldName;
   end;
   wwDBLC.AutoSize       := True;
   wwDBLC.parent         := wwParent;
   wwDBLC.lookuptable    := wcds[ xNComp ];
   wwDBLC.Options        := wwDBLC.Options + [loColLines];
   wwDBLC.Options        := wwDBLC.Options + [loRowLines];
   wwDBLC.Options        := wwDBLC.Options + [loTitles];
   wwDBLC.ShowMatchText  := True;
   wwDBLC.AutoDropDown   := True;
   wwDBLC.AllowClearKey  := True;
   wwDBLC.Style          := csDropDownList;
   wwDBLC.MaxLength      := cds2.FieldByName( wFieldName ).Size;
   wwDBLC.DropDownAlignment:= TaRightJustify;
   wwDBLC.SearchDelay    :=2;

   // Añadir Evento de Validar Código y Busqueda
   if wwTipo=3 then
      wwDBLC.OnDropDown:=DBLCDropDown
   else
   begin
      if wwTipo=4 then
      begin
         wComx1:=xNComp;
         wwDBLC.OnDropDown:=DBLCDropDownPred;
         //wwDBLC.OnExit    :=DBLC1Exit;
      end
      else
      begin
         if nContPrv2=1 then begin
            wComx1:=xNComp;
            wwDBLC.OnDropDown:=DBLCDropDown1;
            wwDBLC.OnExit    :=DBLC1Exit;
         end;
         if nContPrv2=2 then begin
            wComx2:=xNComp;
            wwDBLC.OnDropDown:=DBLCDropDown2;
            wwDBLC.OnExit    :=DBLC2Exit;
         end;
         if nContPrv2=3 then begin
            wComx3:=xNComp;
            wwDBLC.OnDropDown:=DBLCDropDown3;
            wwDBLC.OnExit    :=DBLC3Exit;
         end;
         if nContPrv2=4 then begin
            wComx4:=xNComp;
            wwDBLC.OnDropDown:=DBLCDropDown4;
            wwDBLC.OnExit    :=DBLC4Exit;
         end;
         if nContPrv2=5 then begin
            wComx5:=xNComp;
            wwDBLC.OnDropDown:=DBLCDropDown5;
            wwDBLC.OnExit    :=DBLC5Exit;
         end;
      end;
   end;

   // Selected de Campos
   wcdsLookup[ xNComp ]:=TwwClientDataset.create(self);
   wcdslookup[ xNComp ].name:= 'cds2' + wFieldName;
   wcdslookup[ xNComp ].remoteserver:=DComT;
   wcdsLookup[ xNComp ].providername:='prvRef';

   wQuery:='Select * from Plan04 '
          +'Where ARCHIVO='''+AnsiUpperCase(wTableN[ xNComp ])+''' and '
          +      '( DETALLE=''C'' or DETALLE=''S'' ) '
          +'ORDER BY Archivo,DetDBGPos';
   wcdsLookup[ xNComp ].Close;
   wcdsLookup[ xNComp ].DataRequest(wQuery);
   wcdsLookup[ xNComp ].Open;
   {
   wQuery:='ARCHIVO='''+AnsiUpperCase(wTableN[ xNComp ])+''' and '
          +'( DETALLE=''C'' or DETALLE=''S'' ) ';
   FiltraTablaRemoto( wcdsLookup[ xNComp ], 'PLAN04', 'ARCHIVO', wQuery );
   }
   wcdsLookup[ xNComp ].IndexFieldNames:='ARCHIVO;DETDBGPOS';

   wcdsLookup[ xNComp ].First;
   while Not wcdsLookup[ xNComp ].Eof do begin
      if ( wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='S' )
         or ( wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='C' ) then begin
         wCampoCombo := wcdsLookup[ xNComp ].FieldByName('Campo').AsString;
         wCampoTitle := wcdsLookup[ xNComp ].FieldByName('DetDBGTitle').asstring;
         If Pos('~',wCampoTitle) > 0 then wCampoTitle[ Pos('~',wCampoTitle)]:= ' ';
         wCampoWidth := wcds[ xNComp ].FieldByName( wCampoCombo ).Size;
         if wcdsLookup[ xNComp ].FieldByName('DetDBGWidth').AsInteger>0 then
            wCampoWidth:=wcdsLookup[ xNComp ].FieldByName('DetDBGWidth').AsInteger;

         wwDBLC.Selected.Add( wCampoCombo + #9 + IntToStr(wCampoWidth) + #9 + wCampoTitle );

         if wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='C' then begin
            wwDBLC.lookupfield := wcdsLookup[ xNComp ].FieldByName('Campo').AsString;
            wcds[ xNComp ].IndexFieldNames:=wcdsLookup[ xNComp ].FieldByName('Campo').AsString;
         end;
      end;
      wcdsLookup[ xNComp ].Next;
   end;
   // End Selected de Campos

   If wwTipo=2 then
      If Length( wKey[ xNComp ] )>0 then
         wwDBLC.Enabled:=False;
end;


procedure TSolMantenimiento.DBLC1Exit( Sender: TObject );
begin
   ValidaDBLC( wComx1 );
end;

procedure TSolMantenimiento.DBLC2Exit( Sender: TObject );
begin
   ValidaDBLC( wComx2 );
end;

procedure TSolMantenimiento.DBLC3Exit( Sender: TObject );
begin
   ValidaDBLC( wComx3 );
end;

procedure TSolMantenimiento.DBLC4Exit( Sender: TObject );
begin
   ValidaDBLC( wComx4 );
end;

procedure TSolMantenimiento.DBLC5Exit( Sender: TObject );
begin
   ValidaDBLC( wComx5 );
end;


procedure TSolMantenimiento.ValidaDBLC( wComp : Byte );
var
   xSQLExit, wQryCombo, xSQLDes, xxCampo : String;
begin
   if bbtnCancela.Focused then Exit;

   if wdblc[ wComp ].Text='' then Exit;

   wQryCombo:=SQLCombo( wComp );

   //xSQLExit:=wQryCombo+wdblc[ wComp ].lookupfield+'='''+wdblc[ wComp ].Text+'''';
   xSQLExit:=wdblc[ wComp ].lookupfield+'='''+wdblc[ wComp ].Text+'''';

   xSQLDes:='Select * from PLAN04 '
           +'Where ARCHIVO='''+wTableN[ wComp ]+''' and '
           +      'ACTUALIZA=''S'' ';
   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.DataRequest(xSQLDes);
   cdsBusca.Open;
   {
   xSQLDes:='ARCHIVO='''+wTableN[ wComp ]+''' and ACTUALIZA=''S'' ';
   FiltraTablaRemoto( cdsBusca, 'PLAN04', 'ARCHIVO', xSQLDes );
   }
   xxCampo:='';
   if cdsBusca.RecordCount=1 then begin
      xxCampo:=cdsBusca.FieldByName('CAMPO').AsString;
   end;
   {
   cdsBusca.Close;
   cdsBusca.DataRequest( xSQLExit );
   cdsBusca.Open;
   }
   FiltraTablaRemoto( cdsBusca, wTableN[ wComp ], xxCampo, xSQLExit );

   if cdsBusca.Recordcount<=0 then begin
      ShowMessage( 'Error : '+wdblc[ wComp ].Text+' NO Existe');
      wdblc[ wComp ].SetFocus;
   end;

   // VHNXX
//   if (wTableN[ wComp ]=cds1.FieldByName('ZARCHIVO').AsString) and (xxCampo<>'') then begin
   if (xxCampo<>'') and ( cds2.FieldDefList.Find( xxCampo )<>nil ) then begin
      try
         cds2.FieldByName( xxCampo ).AsString:=cdsBusca.FieldByName(xxCampo).AsString;
      except
      end;

   end;
   cdsBusca.Close;
end;




procedure TSolMantenimiento.DBLCDropDown(Sender: TObject );
var
   wQuery, wCampoCombo, wCampoTitle : String;
   wCampoWidth : Integer;
begin
   if not wcds[ xNComp ].Active then begin
      wcds[ xNComp ].PacketRecords:=wPacketCombo;
      wcds[ xNComp ].FetchOnDemand:=False;
      wcds[ xNComp ].Open;
      wcds[ xNComp ].FetchOnDemand:=True;

      wcdsLookup[ xNComp ].First;
      while Not wcdsLookup[ xNComp ].Eof do begin
         if ( wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='S' )
            or ( wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='C' ) then begin
            wCampoCombo := wcdsLookup[ xNComp ].FieldByName('Campo').AsString;
            wCampoTitle := wcdsLookup[ xNComp ].FieldByName('DetDBGTitle').asstring;
            If Pos('~',wCampoTitle) > 0 then wCampoTitle[ Pos('~',wCampoTitle)]:= ' ';
            wCampoWidth := wcds[ xNComp ].FieldByName( wCampoCombo ).Size;
            if wcdsLookup[ xNComp ].FieldByName('DetDBGWidth').AsInteger>0 then
               wCampoWidth:=wcdsLookup[ xNComp ].FieldByName('DetDBGWidth').AsInteger;

            wwDBLC2.Selected.Add( wCampoCombo + #9 + IntToStr(wCampoWidth) + #9 + wCampoTitle );
            If wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='C' then
               wwDBLC2.lookupfield := wcdsLookup[ xNComp ].FieldByName('Campo').AsString;
         end;
         wcdsLookup[ xNComp ].Next;
      end;

   end;
end;


procedure TSolMantenimiento.DBLCDropDownPred( Sender: TObject );
var
   wQryComp, xPredec, xPredecTot, xTabla, xTT, xSQL : String;
   xInt, xInt2, wComp, i, j, nPos : Integer;
begin
  wComp:=wComx1;

  wQryComp  :='';
  xPredecTot:=wPredeces[ wComp ];

  while length( xPredecTot )>0 do
  begin
      nPos:=Pos(';', xPredecTot );
      xPredec:=Copy( xPredecTot, 1, nPos );
      xPredec:=StringReplace( xPredec, ';', '', [rfreplaceall] );

      xSQL:='SELECT a.*, rowid FROM PLAN04 a WHERE ARCHIVO='''+xPredec+''' and DETALLE=''C''';
      cdsQryT.close;
      cdsQryT.DataRequest( xSQL );
      cdsQryT.Open;

      for i:=0 to lbFiltroReal.Items.Count-1 do
      begin
          if pos(cdsQryT.FieldByname('CAMPO').AsString,lbFiltroReal.Items[i]) >0 then
          begin
             wQryComp:=wQryComp+ Copy( lbFiltroReal.Items[i],pos(cdsQryT.FieldByname('CAMPO').AsString,lbFiltroReal.Items[i]), length(lbFiltroReal.Items[i]) )+' and ';
          end;
      end;
      xPredecTot:=Copy( xPredecTot, nPos+1, Length(xPredecTot) );
  end;

  wQryComp:=copy(wQryComp,1, length(wQryComp)-5);

  {
   xInt2:=1;
   while Pos( ';', xPredec )>0 do begin

      xTabla :=Copy( xPredec, 1, Pos(';',xPredec)-1 );
      xPredec:=Copy( xPredec, Pos(';',xPredec)+1, Length( xPredec ) );

      for xInt := wComp-1 downto 1 do begin
          if wTableN[ xInt ]=xTabla then begin
             Break;
          end;
      end;
      if xInt2=1 then begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end
      else begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end;
      xInt2:=xInt2+1;
   end;
   }
   TRY
   wcds[ wComp ].Filtered:=False;
   wcds[ wComp ].filter  :='';
   wcds[ wComp ].filter  :=wQryComp;
   wcds[ wComp ].Filtered:=True;
   EXCEPT
     ShowMessage('Error en Configuración de Predecesor');
   END;
end;


procedure TSolMantenimiento.DBLCDropDown1( Sender: TObject );
var
   wQryComp, xPredec, xTabla, xTT : String;
   xInt, xInt2, wComp : Integer;
begin
   wComp:=wComx1;

//   if wcds[ wComp ].IndexFieldNames<>'' then Exit;

   wQryComp:='';
   xPredec:=wPredeces[ wComp ];
   xInt2:=1;
   while Pos( ';', xPredec )>0 do begin

      xTabla :=Copy( xPredec, 1, Pos(';',xPredec)-1 );
      xPredec:=Copy( xPredec, Pos(';',xPredec)+1, Length( xPredec ) );

      for xInt := wComp-1 downto 1 do begin
          if wTableN[ xInt ]=xTabla then begin
             Break;
          end;
      end;
      if xInt2=1 then begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end
      else begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end;
      xInt2:=xInt2+1;
   end;
   wcds[ wComp ].Filtered:=False;
   wcds[ wComp ].filter  :='';
   wcds[ wComp ].filter  :=wQryComp;
   wcds[ wComp ].Filtered:=True;
end;


procedure TSolMantenimiento.DBLCDropDown2( Sender: TObject );
var
   wQryComp, xPredec, xTabla, xTT : String;
   xInt, xInt2, wComp : Integer;
begin
   wComp:=wComx2;

//   if wcds[ wComp ].IndexFieldNames<>'' then Exit;

   wQryComp:='';
   xPredec:=wPredeces[ wComp ];
   xInt2:=1;
   while Pos( ';', xPredec )>0 do begin

      xTabla :=Copy( xPredec, 1, Pos(';',xPredec)-1 );
      xPredec:=Copy( xPredec, Pos(';',xPredec)+1, Length( xPredec ) );

      for xInt := wComp-1 downto 1 do begin
          if wTableN[ xInt ]=xTabla then begin
             Break;
          end;
      end;
      if xInt2=1 then begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end
      else begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end;
      xInt2:=xInt2+1;
   end;
   wcds[ wComp ].Filtered:=False;
   wcds[ wComp ].filter  :='';
   wcds[ wComp ].filter  :=wQryComp;
   wcds[ wComp ].Filtered:=True;
end;


procedure TSolMantenimiento.DBLCDropDown3( Sender: TObject );
var
   wQryComp, xPredec, xTabla, xTT : String;
   xInt, xInt2, wComp : Integer;
begin
   wComp:=wComx3;

//   if wcds[ wComp ].IndexFieldNames<>'' then Exit;

   wQryComp:='';
   xPredec:=wPredeces[ wComp ];
   xInt2:=1;
   while Pos( ';', xPredec )>0 do begin

      xTabla :=Copy( xPredec, 1, Pos(';',xPredec)-1 );
      xPredec:=Copy( xPredec, Pos(';',xPredec)+1, Length( xPredec ) );

      for xInt := wComp-1 downto 1 do begin
          if wTableN[ xInt ]=xTabla then begin
             Break;
          end;
      end;
      if xInt2=1 then begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end
      else begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end;
      xInt2:=xInt2+1;
   end;
   wcds[ wComp ].Filtered:=False;
   wcds[ wComp ].filter  :='';
   wcds[ wComp ].filter  :=wQryComp;
   wcds[ wComp ].Filtered:=True;
end;

procedure TSolMantenimiento.DBLCDropDown4( Sender: TObject );
var
   wQryComp, xPredec, xTabla, xTT : String;
   xInt, xInt2, wComp : Integer;
begin
   wComp:=wComx4;

//   if wcds[ wComp ].IndexFieldNames<>'' then Exit;

   wQryComp:='';
   xPredec:=wPredeces[ wComp ];
   xInt2:=1;
   while Pos( ';', xPredec )>0 do begin

      xTabla :=Copy( xPredec, 1, Pos(';',xPredec)-1 );
      xPredec:=Copy( xPredec, Pos(';',xPredec)+1, Length( xPredec ) );

      for xInt := wComp-1 downto 1 do begin
          if wTableN[ xInt ]=xTabla then begin
             Break;
          end;
      end;
      if xInt2=1 then begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end
      else begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end;
      xInt2:=xInt2+1;
   end;
   wcds[ wComp ].Filtered:=False;
   wcds[ wComp ].filter  :='';
   wcds[ wComp ].filter  :=wQryComp;
   wcds[ wComp ].Filtered:=True;
end;

procedure TSolMantenimiento.DBLCDropDown5( Sender: TObject );
var
   wQryComp, xPredec, xTabla, xTT : String;
   xInt, xInt2, wComp : Integer;
begin
   wComp:=wComx5;

//   if wcds[ wComp ].IndexFieldNames<>'' then Exit;

   wQryComp:='';
   xPredec:=wPredeces[ wComp ];
   xInt2:=1;
   while Pos( ';', xPredec )>0 do begin

      xTabla :=Copy( xPredec, 1, Pos(';',xPredec)-1 );
      xPredec:=Copy( xPredec, Pos(';',xPredec)+1, Length( xPredec ) );

      for xInt := wComp-1 downto 1 do begin
          if wTableN[ xInt ]=xTabla then begin
             Break;
          end;
      end;
      if xInt2=1 then begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end
      else begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblcd[ xInt ].Text+''' ';
      end;
      xInt2:=xInt2+1;
   end;
   wcds[ wComp ].Filtered:=False;
   wcds[ wComp ].filter  :='';
   wcds[ wComp ].filter  :=wQryComp;
   wcds[ wComp ].Filtered:=True;
end;



Procedure TSolMantenimiento.PropDBLCD( wwDBLCD:TwwDBLookupComboDlg; wwTipo:Integer; wwParent:TPanel );
var
   wQuery, wCampoCombo, wCampoTitle : String;
   wCampoWidth : Integer;
begin
   // Crea CDS Para El Combo
   wcds[ xNComp ]:= TwwClientDataset.create(self);
   wcds[ xNComp ].name        :='cdsFFF' + wFieldName;
   wcds[ xNComp ].remoteserver:=DComT;

   nContPrv:=nContPrv+1;

   wcds[ xNComp ].providername:='dspTem'+IntToStr(nContPrv);

   wQuery:='Select * from ' + wTableN[ xNComp ];

   wcds[ xNComp ].Close;

   if wwTipo<>3 then begin
      wcds[ xNComp ].FetchOnDemand:=False;
      wcds[ xNComp ].PacketRecords:=wPacketCombo;
   end;

   wcds[ xNComp ].DataRequest(wQuery);
   wcds[ xNComp ].EnableControls;
   // Fin CDS Para El Combo

   wwDBLCD.Ctl3D         := True;
   wwDBLCD.name          := 'dblcdFFF'+wFieldName;
   wwDBLCD.left          := xCampoLeft + wCol;
   wwDBLCD.top           := xInicioCampos+wLin;
   wwDBLCD.width         := xCampoWidth;
   wwDBLCD.ControlInfoInDataset:=False;

   if wwTipo<>3 then begin
      wwDBLCD.DataSource    :=ds2;
      wwDBLCD.DataField     :=wFieldName;
   end;

   wwDBLCD.parent           :=wwParent;
   wwDBLCD.lookuptable      :=wcds[ xNComp ];
   {
   wwDBLCD.ShowMatchText    :=True;
   wwDBLCD.AllowClearKey    :=True;
   }
   wwDBLCD.SeqSearchOptions :=wwDBLCD.SeqSearchOptions+[ssoEnabled];
   wwDBLCD.MaxLength        :=cds2.FieldByName( wFieldName ).Size;
   wwDBLCD.DropDownAlignment:=TaRightJustify;
   //wwDBLCD.AutoDropDown     :=True;
   wwDBLCD.SearchDelay      :=2;
   wwDBLCD2:=wwDBLCD;

   // Añadir Evento de Validar Código y Busqueda
   if wwTipo=3 then
      wwDBLCD.OnDropDown:=DBLCDDropDown
   else begin
      if nContPrv=1 then begin
         wComp1:=xNComp;
         wwDBLCD.OnDropDown:=DBLCDDropDown1;
         wwDBLCD.OnExit    :=DBLCD1Exit;
      end;
      if nContPrv=2 then begin
         wComp2:=xNComp;
         wwDBLCD.OnDropDown:=DBLCDDropDown2;
         wwDBLCD.OnExit    :=DBLCD2Exit;
      end;
      if nContPrv=3 then begin
         wComp3:=xNComp;
         wwDBLCD.OnDropDown:=DBLCDDropDown3;
         wwDBLCD.OnExit    :=DBLCD3Exit;
      end;
      if nContPrv=4 then begin
         wComp4:=xNComp;
         wwDBLCD.OnDropDown:=DBLCDDropDown4;
         wwDBLCD.OnExit    :=DBLCD4Exit;
      end;
      if nContPrv=5 then begin
         wComp5:=xNComp;
         wwDBLCD.OnDropDown:=DBLCDDropDown5;
         wwDBLCD.OnExit    :=DBLCD5Exit;
      end;
      if nContPrv=6 then begin
         wComp6:=xNComp;
         wwDBLCD.OnDropDown:=DBLCDDropDown6;
         wwDBLCD.OnExit    :=DBLCD6Exit;
      end;
      if nContPrv=7 then begin
         wComp7:=xNComp;
         wwDBLCD.OnDropDown:=DBLCDDropDown7;
         wwDBLCD.OnExit    :=DBLCD7Exit;
      end;
      if nContPrv=8 then begin
         wComp8:=xNComp;
         wwDBLCD.OnDropDown:=DBLCDDropDown8;
         wwDBLCD.OnExit    :=DBLCD8Exit;
      end;
      if nContPrv=9 then begin
         wComp9:=xNComp;
         wwDBLCD.OnDropDown:=DBLCDDropDown9;
         wwDBLCD.OnExit    :=DBLCD9Exit;
      end;
   end;

   // Selected de Campos
   wcdsLookup[ xNComp ]:=TwwClientDataset.create(self);
   wcdslookup[ xNComp ].name:= 'cds2FFF' + wFieldName;
   wcdslookup[ xNComp ].remoteserver:=DComT;
   wcdsLookup[ xNComp ].providername:='prvRef';

   wQuery:='Select * from Plan04 '
          +'Where ARCHIVO='''+AnsiUpperCase(wTableN[ xNComp ])+''' and '
          +      '( DETALLE=''C'' or DETALLE=''S'' ) '
          +'ORDER BY Archivo,DetDBGPos';
   wcdsLookup[ xNComp ].Close;
   wcdsLookup[ xNComp ].DataRequest(wQuery);
   wcdsLookup[ xNComp ].Open;
   {
   wQuery:='ARCHIVO='''+AnsiUpperCase(wTableN[ xNComp ])+''' and '
          +'( DETALLE=''C'' or DETALLE=''S'' ) ';
   FiltraTablaRemoto( wcdsLookup[ xNComp ], 'PLAN04', 'ARCHIVO', wQuery );
   }
   wcdsLookup[ xNComp ].IndexFieldNames:='ARCHIVO;DETDBGPOS';

   // VHNXX1
//   if wwTipo<>3 then begin
      wcdsLookup[ xNComp ].First;
      while Not wcdsLookup[ xNComp ].Eof do begin
         if ( wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='S' )
            or ( wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='C' ) then begin
            wCampoCombo := wcdsLookup[ xNComp ].FieldByName('Campo').AsString;
            wCampoTitle := wcdsLookup[ xNComp ].FieldByName('DetDBGTitle').AsString;
            wCampoWidth := 15;
            if wcdsLookup[ xNComp ].FieldByName('DetDBGWidth').AsInteger>0 then
               wCampoWidth:=wcdsLookup[ xNComp ].FieldByName('DetDBGWidth').AsInteger;

            If Pos('~',wCampoTitle) > 0 then wCampoTitle[ Pos('~',wCampoTitle)]:= ' ';
            wwDBLCD.Selected.Add( wCampoCombo + #9 + IntToStr(wCampoWidth) + #9 + wCampoTitle );
            If wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='C' then begin
               wwDBLCD.lookupfield := wcdsLookup[ xNComp ].FieldByName('Campo').AsString;
            end
         end;
         wcdsLookup[ xNComp ].Next;
      end;
//   end;

   If wwTipo=2 then
      If Length( wKey[ xNComp ] )>0 then
         wwDBLCD.Enabled:=False;
end;



procedure TSolMantenimiento.DBLCD1Exit( Sender: TObject );
begin
   ValidaDBLCD( wComp1 );
end;

procedure TSolMantenimiento.DBLCD2Exit( Sender: TObject );
begin
   ValidaDBLCD( wComp2 );
end;

procedure TSolMantenimiento.DBLCD3Exit( Sender: TObject );
begin
   ValidaDBLCD( wComp3 );
end;

procedure TSolMantenimiento.DBLCD4Exit( Sender: TObject );
begin
   ValidaDBLCD( wComp4 );
end;

procedure TSolMantenimiento.DBLCD5Exit( Sender: TObject );
begin
   ValidaDBLCD( wComp5 );
end;

procedure TSolMantenimiento.DBLCD6Exit( Sender: TObject );
begin
   ValidaDBLCD( wComp6 );
end;

procedure TSolMantenimiento.DBLCD7Exit( Sender: TObject );
begin
   ValidaDBLCD( wComp7 );
end;

procedure TSolMantenimiento.DBLCD8Exit( Sender: TObject );
begin
   ValidaDBLCD( wComp8 );
end;

procedure TSolMantenimiento.DBLCD9Exit( Sender: TObject );
begin
   ValidaDBLCD( wComp9 );
end;


procedure TSolMantenimiento.ValidaDBLCD( wComp : Byte );
var
   xSQLExit, wQryCombo : String;
begin
   if bbtnCancela.Focused then Exit;

   if wdblcd[ wComp ].Text='' then Exit;

   wQryCombo:=SQLCombo( wComp );

   xSQLExit:=wQryCombo+wdblcd[ wComp ].lookupfield+'='''+wdblcd[ wComp ].Text+'''';

   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.DataRequest(xSQLExit);
   cdsBusca.Open;
   if cdsBusca.Recordcount<=0 then begin
      ShowMessage( 'Error : '+wdblcd[ wComp ].Text+' NO Existe');
      wdblcd[ wComp ].SetFocus;
   end;
   cdsBusca.Close;
end;


function TSolMantenimiento.SQLCombo( wComp : Byte ) : String;
var
   xInt2, xInt : Byte;
   xSQLExit, wQryComp, xPredec, xTabla : String;
begin
   wQryComp:='Select * from ' + wTableN[ wComp ]+' Where ';
   xPredec:=wPredeces[ wComp ];
   xInt2:=1;
   while Pos( ';', xPredec )>0 do begin

      xTabla :=Copy( xPredec, 1, Pos(';',xPredec)-1 );
      xPredec:=Copy( xPredec, Pos(';',xPredec)+1, Length( xPredec ) );

      for xInt := wComp-1 downto 1 do begin
          if wTableN[ xInt ]=xTabla then begin
             Break;
          end;
      end;
      if xInt2=1 then
      begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' and '
         else
            if wType[ xInt ]='C' then
               wQryComp:=wQryComp+wdblcd[ xInt ].lookupfield+'='''+wdblcd[ xInt ].Text+''' and '
            else
               if wType[ xInt ]='E' then
                  wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdbEdit[ xInt ].Text+''' and '
      end
      else begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' and '
         else
            if wType[ xInt ]='C' then
               wQryComp:=wQryComp+wdblcd[ xInt ].lookupfield+'='''+wdblcd[ xInt ].Text+''' and '
            else
               if wType[ xInt ]='E' then
                  wQryComp:=wQryComp+wFieldN[ xInt ]+'='''+wdbEdit[ xInt ].Text+''' and '
      end;
      xInt2:=xInt2+1;
   end;
   Result :=wQryComp;
end;


procedure TSolMantenimiento.DBLCDDropDown1( Sender: TObject );
begin
   ActivaDropDown( wComp1 );
end;

procedure TSolMantenimiento.DBLCDDropDown2( Sender: TObject );
begin
   ActivaDropDown( wComp2 );
end;

procedure TSolMantenimiento.DBLCDDropDown3( Sender: TObject );
begin
   ActivaDropDown( wComp3 );
end;

procedure TSolMantenimiento.DBLCDDropDown4( Sender: TObject );
begin
   ActivaDropDown( wComp4 );
end;

procedure TSolMantenimiento.DBLCDDropDown5( Sender: TObject );
begin
   ActivaDropDown( wComp5 );
end;

procedure TSolMantenimiento.DBLCDDropDown6( Sender: TObject );
begin
   ActivaDropDown( wComp6 );
end;

procedure TSolMantenimiento.DBLCDDropDown7( Sender: TObject );
begin
   ActivaDropDown( wComp7 );
end;

procedure TSolMantenimiento.DBLCDDropDown8( Sender: TObject );
begin
   ActivaDropDown( wComp8 );
end;

procedure TSolMantenimiento.DBLCDDropDown9( Sender: TObject );
begin
   ActivaDropDown( wComp9 );
end;

procedure TSolMantenimiento.ActivaDropDown( wComp : Byte );
var
   wQryComp, xPredec, xTabla, xTT : String;
   xInt, xInt2 : Byte;
begin
   xTT:=wdblcd[ wComp ].Text;

   wQryComp:='Select * from ' + wTableN[ wComp ];
   xPredec:=wPredeces[ wComp ];
   xInt2:=1;
   while Pos( ';', xPredec )>0 do begin

      xTabla :=Copy( xPredec, 1, Pos(';',xPredec)-1 );
      xPredec:=Copy( xPredec, Pos(';',xPredec)+1, Length( xPredec ) );

      for xInt := wComp-1 downto 1 do begin
          if wTableN[ xInt ]=xTabla then begin
             Break;
          end;
      end;
      if xInt2=1 then
      begin
         if wType[ xInt ]='L' then
            wQryComp:=wQryComp+' Where '+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            if wType[ xInt ]='C' then
               wQryComp:=wQryComp+' Where '+wdblcd[ xInt ].lookupfield+'='''+wdblcd[ xInt ].Text+''' '
            else
               if wType[ xInt ]='E' then
                  wQryComp:=wQryComp+' Where '+wFieldN[ xInt ]+'='''+wdbEdit[ xInt ].Text+''' ';
      end
      else
      begin
         If wType[ xInt ]='L' then
            wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdblc[ xInt ].Text+''' '
         else
            If wType[ xInt ]='C' then
               wQryComp:=wQryComp+' Where '+wdblcd[ xInt ].lookupfield+'='''+wdblcd[ xInt ].Text+''' '
            else
               if wType[ xInt ]='E' then
                  wQryComp:=wQryComp+' and '+wFieldN[ xInt ]+'='''+wdbEdit[ xInt ].Text+''' '
      end;
      xInt2:=xInt2+1;
   end;
   wcds[ wComp ].FetchOnDemand:=False;
   wcds[ wComp ].PacketRecords:=wPacketCombo;
   wcds[ wComp ].Close;
   wcds[ wComp ].DataRequest( wQryComp );
   wcds[ wComp ].Open;
   wcds[ wComp ].IndexFieldNames:=wdblcd[ wComp ].lookupfield;
   wcds[ wComp ].FetchOnDemand:=True;

   wcds[ wComp ].SetKey;
   wcds[ wComp ].FieldByName( wdblcd[ wComp ].lookupfield ).Value:=xTT;
   wcds[ wComp ].GotoNearest;
end;


procedure TSolMantenimiento.DBLCDDropDown( Sender: TObject );
var
   wQuery, wCampoCombo, wCampoTitle : String;
   wCampoWidth : Integer;
begin

   if not wcds[ xNComp ].Active then begin
      wcds[ xNComp ].FetchOnDemand:=False;
      wcds[ xNComp ].PacketRecords:=wPacketCombo;
      wcds[ xNComp ].Open;
      wcds[ xNComp ].FetchOnDemand:=True;

      wcdsLookup[ xNComp ].IndexFieldNames:='ARCHIVO;DETALLE';

      wcdsLookup[ xNComp ].First;
      while Not wcdsLookup[ xNComp ].Eof do begin
         if ( wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='S' )
            or ( wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='C' ) then begin
            wCampoCombo := wcdsLookup[ xNComp ].FieldByName('Campo').AsString;
            wCampoTitle := wcdsLookup[ xNComp ].FieldByName('DetDBGTitle').AsString;
            wCampoWidth := wcds[ xNComp ].FieldByName( wCampoCombo ).Size;
            if wcdsLookup[ xNComp ].FieldByName('DetDBGWidth').AsInteger>0 then
               wCampoWidth:=wcdsLookup[ xNComp ].FieldByName('DetDBGWidth').AsInteger;

            If Pos('~',wCampoTitle) > 0 then wCampoTitle[ Pos('~',wCampoTitle)]:= ' ';
            wwDBLCD2.Selected.Add( wCampoCombo + #9 + IntToStr(wCampoWidth) + #9 + wCampoTitle );
            If wcdsLookup[ xNComp ].FieldByName('Detalle').AsString='C' then begin
               wwDBLCD2.lookupfield := wcdsLookup[ xNComp ].FieldByName('Campo').AsString;
            end
         end;
         wcdsLookup[ xNComp ].Next;
      end;

   end;
end;


procedure TSolMantenimiento.AsignaValor(Sender: TObject );
begin
   cds2.FieldByName(wFieldName).Value;
   cds2.FieldByName(wFieldName).Value;
end;

Procedure TSolMantenimiento.PropLBL( wwLabel:TLabel; wwCaption:String; wwParent:TPanel );
begin
   // Propiedades del Label
   If Length(wwCaption)>0 then begin
      wwCaption[ Pos('~',wwCaption)] := ' ';
      wwLabel.Caption := wwCaption;
   end;
   wwLabel.name   := 'lblG'+wFieldName;
   wwLabel.left   := xLabelLeft + wCol;
   wwLabel.top    := xInicioCampos+ 5 + wLin;
   wwLabel.width  := 100;
   wwLabel.parent := wwParent;
end;

Procedure TSolMantenimiento.PropDBE( wwDBEdit:TwwDBEdit; wwTipo:Integer; wwParent:TPanel );
begin
   wwdbedit.name          := 'dbexx'+wFieldName;
   wwdbedit.text          := '';
   wwdbedit.left          := xCampoLeft + wCol;
   wwdbedit.top           := xInicioCampos + wLin;
   wwdbedit.width         := xCampoWidth;
   wwdbedit.parentbidimode:= True;
   wwdbedit.parentcolor   := False;
   wwdbedit.parentctl3d   := True;
   wwdbedit.parentfont    := True;
   if wwTipo<>3 then begin
      wwdbedit.DataSource := ds2;
      wwdbedit.DataField  := wFieldName;
   end;
   wwdbedit.AutoSize      := True;
   wwdbedit.parent        := wwParent;

   if wType[xNComp]='R' then
   begin
      wwdbedit.MaxLength     := wWidthReg[xNComp];
      if wwdbedit.MaxLength=0 then
         wwdbedit.MaxLength:=10;
   end
   else
      wwdbedit.MaxLength     := cds2.FieldByName( wFieldName ).Size;

   if wwTipo=3 then begin
      wwDBEdit.OnExit:=DBEExit;
   end;

   if wType[xNComp]='N' then
      wwdbedit.Enabled:=False;

   if wType[xNComp]<>'R' then
      wwdbedit.Picture.PictureMask := wPicture[ xNComp ];

   If wwTipo=2 then
      If Length( wKey[ xNComp ] )>0 then
         wwdbedit.Enabled:=False;
end;


procedure TSolMantenimiento.DBEExit( Sender: TObject );
begin
   if wStrZero[xNComp]='S' then begin
      if wWidthReg[xNComp]>0 then begin
         wdbedit[xNComp].Text:=StrZero( wdbedit[xNComp].Text, wWidthReg[xNComp] );
         wdbedit[xNComp].Refresh;
      end;
   end;
end;


Procedure TSolMantenimiento.PropDBM( wwDBMemo:TDBMemo; wwTipo:Integer; wwParent:TPanel );
begin
   wwdbMemo.name          := 'dbmxx'+wFieldName;
   wwdbMemo.text          := '';
   wwdbMemo.left          := xCampoLeft + wCol;
   wwdbMemo.top           := xInicioCampos + wLin;
   wwdbMemo.width         := xCampoWidth+xCampoWidth;
   wwdbMemo.parentbidimode:= True;
   wwdbMemo.parentcolor   := False;
   wwdbMemo.parentctl3d   := True;
   wwdbMemo.parentfont    := True;
   if wwTipo<>3 then begin
      wwdbMemo. DataSource := ds2;
      wwdbMemo.DataField  := wFieldName;
   end;
   wwdbMemo.Height        :=xAlturaCampos+xAlturaCampos;
   wwdbMemo.parent        := wwParent;
   wwdbMemo.MaxLength     := cds2.FieldByName( wFieldName ).Size;
   {
   if wwTipo=3 then begin
      wwDBEdit.OnExit:=DBEExit;
   end;

   if wType[xNComp]='N' then
      wwdbedit.Enabled:=False;

   if wType[xNComp]<>'R' then
      wwdbedit.Picture.PictureMask := wPicture[ xNComp ];

   If wwTipo=2 then
      If Length( wKey[ xNComp ] )>0 then
         wwdbedit.Enabled:=False;
   }
end;


Procedure TSolMantenimiento.PropDTP( wwDBDTP:TwwDBDateTimePicker; wwTipo:Integer; wwParent:TPanel );
begin
   wwdbdtp.name          := 'dbdtp'+wFieldName;
   wwdbdtp.Text          := '';
   wwdbdtp.left          := xCampoLeft + wCol;
   wwdbdtp.top           := xInicioCampos + wLin;
   wwdbdtp.width         := xCampoWidth;
   wwdbdtp.parentbidimode:= True;
   wwdbdtp.parentcolor   := False;
   wwdbdtp.parentfont    := True;
   wwdbdtp.AutoSize      := True;
   wwdbdtp.Parent        := wwParent;
   if wwTipo<>3 then begin
      wwdbdtp.DataSource    := ds2;
      wwdbdtp.DataField     := wFieldName;
   end;
   If wwTipo=2 then
      If Length( wKey[ xNComp ] )>0 then
         wwdbdtp.Enabled:=False;
end;

procedure TSolMantenimiento.EliminaCampos( wDesde:Integer );
var
  E : integer;
begin

   bbtnDate.Visible:=False;
   meDias.Visible  :=False;
   lblDias.Visible :=False;

   For E:=wDesde to xNComp do begin
       wlbl[ E ].Free;
       If wType[ E ]='D' then
          wdbdtp[ E ].Free
       else
          If wType[ E ]='L' then begin
             wdblc[ E ].Free;
             wcds[ E ].Close;
             wcds[ E ].Free;
             wcdsLookup[ E ].Close;
             wcdsLookup[ E ].Free;
             end
          else
             If wType[ E ]='C' then begin
                wdblcd[ E ].Free;
                wcds[ E ].Close;
                wcds[ E ].Free;
                wcdsLookup[ E ].Close;
                wcdsLookup[ E ].Free;
                end
             Else
                If wType[ E ]='M' then
                   wdbMemo[ E ].Free
                else
                   wdbedit[ E ].Free;
   end;
end;

Function TSolMantenimiento.BuscaRegistro( xTipo : String ) : Boolean;
Var
   N : Integer;
   xSQL, xWhere : String;
begin
   xWhere   :='';
   xWhereSel:='';
   For N:=1 to xNComp do begin

       if Length( wKey[ N ] )> 0 then begin

          if Length(xWhere)>0    then xWhere    := xWhere    + ' and';
          if Length(xWhereSel)>0 then xWhereSel := xWhereSel + ' and';

          if wType[ N ]='D' then
             xWhere:=xWhere+' '+wFieldN[ N ]+'='+wRepFuncDate+''''+
                     FORMATDATETIME(wFormatFecha,wdbdtp[ N ].Date)+''''+')'
          else begin
             if wType[ N ]='L' then begin
                xWhere   :=xWhere   + ' '+wFieldN[ N ]+'='+''''+wdblc[ N ].Text+'''';
                xWhereSel:=xWhereSel+ ' '+wFieldN[ N ]+'='+''''+wdblc[ N ].Text+'''';
             end
             else begin
                if wType[ N ]='C' then begin
                   xWhere   :=xWhere   +' '+wFieldN[ N ]+'='+''''+wdblcd[ N ].Text+'''';
                   xWhereSel:=xWhereSel+' '+wFieldN[ N ]+'='+''''+wdblcd[ N ].Text+'''';
                end
                else begin
                   xWhere   :=xWhere   +' '+wFieldN[ N ]+'='+''''+wdbedit[ N ].Text+'''';
                   xWhereSel:=xWhereSel+' '+wFieldN[ N ]+'='+''''+wdbedit[ N ].Text+'''';
                end;
             end;
          end;

       end;

   end;

   xSQL := wSelect+' where '+xWhere;
   xSQL := StringReplace( xSQL,'*',wFieldN[ 1 ],[rfreplaceall] );

   if xWhereSel<>'' then
      xWhereSel:=' Where '+xWhereSel;

   if xTipo='S' then begin
      cdsBusca.Close;
      cdsBusca.Filter:='';
      cdsBusca.DataRequest(xSQL);
      cdsBusca.Open;

      if cdsBusca.RecordCount>0 then
         Result := True
      else
         Result := False;

   end
   else
      Result := True;

end;

procedure TSolMantenimiento.bbtnOkClick(Sender: TObject);
begin
   if ValidaRegistro then begin
      if MessageDlg( ' ¿ Esta Seguro ? ' ,mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin
         if cds2.State=dsInsert then begin
            if BuscaRegistro( 'S' ) then
               Raise Exception.Create( ' Error :  Registro Existe' )
            else begin
               cds2.Edit;
               cdsPost( cds2 );
               cds2.DataRequest( wSelect+xWhereSel );
               AplicaDatos( cds2, 'Plantillas' );
               if 'GrabaAuxiliar'=cds1.FieldByName('zProcedure').AsString then GrabaAuxiliar;
               cds2.Insert;
               pnlRegistro.SetFocus;
               if wType[1]='D' then
                  wdbdtp[1].SetFocus
               else
                  if wType[1]='L' then
                     wdblc[1].SetFocus
                  else
                     if wType[1]='C' then
                        wdblcd[1].SetFocus
                     else
                        wdbedit[1].SetFocus;
            end;
            end
         else begin
            BuscaRegistro( 'N' );

            cds2.Edit;
            cdsPost( cds2 );
            cds2.DataRequest( wSelect+xWhereSel );
            AplicaDatos( cds2, 'Plantillas' );

            //////////////////////////////////////////////////////
            //  Actualiza Campos de Descripción en Otras Tabla  //
            //////////////////////////////////////////////////////
            ActualizaCampos;

            ////////////////////////////////////////////////
            //  Actualiza En Contabilidad los Auxiliares  //
            ////////////////////////////////////////////////
            if 'GrabaAuxiliar'=cds1.FieldByName('zProcedure').AsString then GrabaAuxiliar;

            EliminaCampos( 1 );
            pnlFRegistro.Visible:= False;

            if wTabla='' then
              dbgTables.Enabled:=True;

            dbgFiltro.Enabled   := True;
            pnlFiltro.Enabled := True;
         end;

         // REMOTO
         ActualizaGrabarTabla;

      end;
   end;
end;

procedure TSolMantenimiento.ActualizaGrabarTabla;
var
   xExiste : Boolean;
   i : Integer;
begin

   if scTablas.Lines.Count>0 then
   begin
      xExiste:=False;
      for i:=0 to scTablas.Lines.Count-1 do
      begin
         if scTablas.Lines[ i ]=cds1.FieldByname('ZARCHIVO').AsString then
            xExiste:=True;
      end;
      if not xExiste then
         scTablas.Lines.Add( cds1.FieldByname('ZARCHIVO').AsString );
   end
   else
      scTablas.Lines.Add( cds1.FieldByname('ZARCHIVO').AsString );

end;


procedure TSolMantenimiento.ActualizaCampos;
var
   xSQL   : WideString;
   xTabla, xxDesc, xLlave : String;
begin
   xNComp:=0;

   cdsGrid.First;
   while not cdsGrid.Eof do begin

      if cdsGrid.FieldByName('Flag').AsString<>'S' then
      begin

         xNComp:=xNComp+1;

         if cdsGrid.FieldByName('ACTUALIZA').AsString='S' then
         begin
            If wType[xNComp]='D' then begin
               {
               wdbdtp[xNComp]:=TwwDBDateTimePicker.create(self);
               PropDTP( wdbdtp[xNComp], wwTipo, pnlRegistro );
               }
               end
            else begin
               If wType[xNComp]='L' then begin
                  xxDesc:=wdblc[xNComp].Text;
                  end
               else begin
                  If wType[xNComp]='C' then begin
                     xxDesc:=wdblcd[xNComp].Text
                     end
                  else begin
                     xxDesc:=wdbedit[xNComp].tEXT;
                  end;
               end;
            end;

            xSQL:='Select * from PLAN04 '
                 +'Where ARCHIVO='''+cds1.FieldByName('zArchivo').AsString+''' AND '
                 +      'DETALLE=''C''';
            cdsBusca.Close;
            cdsBusca.DataRequest(xSQL);
            cdsBusca.Open;
            {
            xSQL:='ARCHIVO='''+cds1.FieldByName('zArchivo').AsString+''' AND DETALLE=''C''';
            FiltraTablaRemoto( cdsBusca, 'PLAN04', 'ARCHIVO', xSQL );
            }
            xLlave:=cdsBusca.fieldByName('CAMPO').AsString;

            xSQL:='Select * from PLAN04 '
                 +'Where CAMPO='''+wFieldN[xNComp]+''' AND '
                 +     ' SUBSTR(ARCHIVO,1,2)<>''VW'' AND ARCHIVO<>'''+cdsBusca.FieldByName('ARCHIVO').AsString+'''';
            cdsBusca.Close;
            cdsBusca.Filter:='';
            cdsBusca.DataRequest(xSQL);
            cdsBusca.Open;
            {
            xSQL:='CAMPO='''+wFieldN[xNComp]+''' AND '
                 +' SUBSTR(ARCHIVO,1,2)<>''VW'' AND ARCHIVO<>'''+cdsBusca.FieldByName('ARCHIVO').AsString+'''';
            FiltraTablaRemoto( cdsBusca, 'PLAN04', 'ARCHIVO', xSQL );
            }
            cdsBusca.First;
            while not cdsBusca.Eof do begin

               xSQL:='Update '+cdsBusca.FieldByName('ARCHIVO').AsString+' '
                    +'Set '+wFieldN[xNComp]+'='''+xxDesc+''' '
                    +'Where '+xLlave+'='''+cds2.fieldByname(xLLave).AsString+''' ';
               cdsRep2.Close;
               cdsRep2.DataRequest( xSQL );
               cdsRep2.Execute;

               cdsBusca.Next;
            end;
         end;
      end;
      cdsGrid.Next;
   end;
end;


procedure TSolMantenimiento.GrabaAuxiliar;
var
   xSQL   : WideString;
   xTabla : String;
begin

   xTabla := cds1.FieldByName('zArchivo').AsString;

   xSQL := 'Select Data1.TAuxID,Data2.ClAuxId from TGE127 Data1, TGE102 Data2 '
         + 'WHERE Data1.Tabla='+''''+xTabla+''''+' and '
         +       'Data1.TAuxID=Data2.TAuxID';
   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.DataRequest(xSQL);
   cdsBusca.Open;

   xClAux := cdsBusca.FieldByName('ClAuxId').AsString;

   xSQL := '';

   If xTabla='TGE201' then xSQL:=GeneraSQLProv;

   if Length(xSQL)>0  then begin
      cdsBusca.Close;
      cdsBusca.Filter:='';
      cdsBusca.DataRequest(xSQL);
      cdsBusca.Execute;
   end;
end;

function TSolMantenimiento.GeneraSQLProv : WideString ;
var
   xSQL2 : WideString;
begin
   xSQL2 := 'Select * from CNT201 '
          + 'WHERE AUXID='+''''+cds2.FieldByName( 'Prov' ).AsString +'''';

   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.DataRequest(xSQL2);
   cdsBusca.Open;

   If cdsBusca.RecordCount>0 then begin
      xSQL2:= 'Update CNT201 '
            + ' Set AUXID='   + ''''+cds2.FieldByName( 'Prov' ).AsString    +''''+','
            +      'AUXNOMB=' + ''''+cds2.FieldByName( 'ProvDes' ).AsString +''''+','
            +      'AUXABR='  + ''''+cds2.FieldByName( 'ProvAbr' ).AsString +''''+','
            +      'AUXRUC='  + ''''+cds2.FieldByName( 'ProvRuc' ).AsString +''''+','
            +      'PAISID='  + ''''+cds2.FieldByName( 'PaisId' ).AsString  +''''+','
            +      'AUXDIR='  + ''''+cds2.FieldByName( 'ProvDir' ).AsString +''''+','
            +      'AUXCZIP=' + ''''+cds2.FieldByName( 'ProvCZip' ).AsString+''''+','
            +      'AUXTELF=' + ''''+cds2.FieldByName( 'ProvTelf' ).AsString+''''+','
            +      'AUXFAX='  + ''''+cds2.FieldByName( 'ProvFax' ).AsString +''''+','
            +      'AUXEMAIL='+ ''''+cds2.FieldByName( 'ProvEMai' ).AsString+''''+','
            +      'CLAUXID=' + ''''+xClAux+''''
            +' WHERE AUXID='+''''+cds2.FieldByName( 'Prov' ).AsString+'''';
      end
   else begin
      xSQL2:= 'INSERT INTO CNT201(AUXID,AUXNOMB,AUXABR,AUXRUC,PAISID,AUXDIR,'
            +                    'AUXCZIP,AUXTELF,AUXFAX,AUXEMAIL,CLAUXID ) '
            + 'VALUES('
            + ''''+cds2.FieldByName( 'Prov' ).AsString    +''''+','
            + ''''+cds2.FieldByName( 'ProvDes' ).AsString +''''+','
            + ''''+cds2.FieldByName( 'ProvAbr' ).AsString +''''+','
            + ''''+cds2.FieldByName( 'ProvRuc' ).AsString +''''+','
            + ''''+cds2.FieldByName( 'PaisId' ).AsString  +''''+','
            + ''''+cds2.FieldByName( 'ProvDir' ).AsString +''''+','
            + ''''+cds2.FieldByName( 'ProvCZip' ).AsString+''''+','
            + ''''+cds2.FieldByName( 'ProvTelf' ).AsString+''''+','
            + ''''+cds2.FieldByName( 'ProvFax' ).AsString +''''+','
            + ''''+cds2.FieldByName( 'ProvEMai' ).AsString+''''+','
            + ''''+xClAux+''''+' )';
   end;
   Result := xSQL2;
end;

Procedure TSolMantenimiento.ValidaCampo(Sender: TObject);
begin
   xNComp := 1;
   If wFlagN[ xNComp ]<>'S' then begin
      If wType[ xNComp ]='D' then begin
         If Length( wdbdtp[ xNComp ].Text )=0 then begin
            wdbdtp[ xNComp ].SetFocus;
            Raise Exception.Create(' Error :  Falta Registrar '+wlbl[ xNComp ].Caption );
         end
         end
      else begin
         If wType[ xNComp ]='L' then begin
            If Length( wdblc[ xNComp ].Text )=0 then begin
               wdblc[ xNComp ].SetFocus;
               Raise Exception.Create(' Error :  Falta Registrar '+wlbl[ xNComp ].Caption );
            end;
            end
         else begin
            If wType[ xNComp ]='C' then begin
               If Length( wdblcd[ xNComp ].Text )=0 then begin
                  wdblcd[ xNComp ].SetFocus;
                  Raise Exception.Create(' Error :  Falta Registrar '+wlbl[ xNComp ].Caption );
               end;
               end
            Else begin
               If Length( wdbedit[ xNComp ].Text )=0 then begin
                  wdbedit[ xNComp ].SetFocus;
                  Raise Exception.Create(' Error :  Falta Registrar '+wlbl[ xNComp ].Caption );
               end;
            end;
         end;
      end;
   end;
end;

Function TSolMantenimiento.ValidaRegistro : Boolean;
var
  I    : integer;
begin
   Result := True;
   For I:=1 to xNComp do begin

       If wFlagN[I]='N' then begin   // Si Es Obligatorio

          If wType[I]='D' then begin
             If Length( wdbdtp[I].Text )=0 then begin
                Result := False;
                wdbdtp[I].SetFocus;
                Raise Exception.Create(' Error :  Falta Registrar '+wlbl[I].Caption );
             end
             end
          else begin
             If wType[I]='L' then begin
                If Length( wdblc[ I ].Text )=0 then begin
                   Result := False;
                   wdblc[I].SetFocus;
                   Raise Exception.Create( ' Error :  Falta Registrar '+wlbl[I].Caption );
                end;
                end
             else begin
                If wType[I]='C' then begin
                   If Length( wdblcd[ I ].Text )=0 then begin
                      Result := False;
                      wdblcd[I].SetFocus;
                      Raise Exception.Create( ' Error :  Falta Registrar '+wlbl[I].Caption );
                   end;
                   end
                else begin
                   If Length( wdbedit[I].Text )=0 then begin
                      Result := False;
                      wdbedit[I].SetFocus;
                      Raise Exception.Create( ' Error :  Falta Registrar '+wlbl[I].Caption );
                   end;
                end;
             end;
          end;
       end;

       If ( Length( wOperator[ I ] )>0 ) and ( Length( wValida[ I ] )>0 ) then begin
          If ConsistenciaCampo( I ) then begin
             Exit
          end;
       end;
   end; //For
end;

Function TSolMantenimiento.ConsistenciaCampo( xN : Integer ): Boolean;
begin
    Result := False;
    If wType[ xN ]='D' then begin
       If not( ConsistenciaDate( wdbdtp[xN].Date, wOperator[xN], StrToDate(wValida[xN]) )) then
       begin
          Result := False;
          wdbdtp[ xN ].SetFocus;
          Raise Exception.Create( ' Error :  En '+wlbl[ xN ].Caption+' Dato Invalido ' );
       end
       end
    else begin
       If wType[ xN ]='L' then begin
          If not( ConsistenciaTexto( wdblc[xN].Text, wOperator[xN], wValida[xN] )) then
          begin
             Result := False;
             wdblc[ xN ].SetFocus;
             Raise Exception.Create( ' Error :  En '+wlbl[ xN ].Caption+' Dato Invalido ' );
          end
          end
       else begin
          If wType[ xN ]='C' then begin
             If not( ConsistenciaTexto( wdblcd[xN].Text, wOperator[xN], wValida[xN] )) then
             begin
                Result := False;
                wdblcd[ xN ].SetFocus;
                Raise Exception.Create( ' Error :  En '+wlbl[ xN ].Caption+' Dato Invalido ' );
             end
             end
          else begin
             If not( ConsistenciaTexto( wdbedit[xN].Text, wOperator[xN], wValida[xN] )) then
             begin
                Result := False;
                wdbedit[ xN ].SetFocus;
                Raise Exception.Create( ' Error :  En '+wlbl[ xN ].Caption+' Dato Invalido ' );
             end;
          end;
       end;
    end;
end;

Function TSolMantenimiento.ConsistenciaTexto( xCampo, xOperator, xValida : String ): Boolean;
begin
   Result := False;
   If xOperator = '>' then  begin
         If xCampo > xValida then
            Result := True;
      end
   else begin
      If xOperator = '<' then  begin
            If xCampo < xValida then
               Result := True;
         end
      else begin
         If xOperator = '=' then  begin
               If xCampo = xValida then
                  Result := True;
            end
         else begin
            If xOperator = '>=' then  begin
                  If xCampo >= xValida then
                     Result := True;
               end
            else begin
               If xOperator = '<=' then  begin
                     If xCampo <= xValida then
                        Result := True;
                  end
               else begin
                  If xOperator = '<>' then  begin
                        If xCampo <> xValida then
                            Result := True;
                  end
               end;
            end;
         end;
      end;
   end;
end;

Function TSolMantenimiento.ConsistenciaDate( xCampo:Tdate; xOperator:String; xValida:TDate ): Boolean;
begin
   Result := False;
   If xOperator = '>' then  begin
         If xCampo > xValida then
            Result := True;
      end
   else begin
      If xOperator = '<' then  begin
            If xCampo < xValida then
               Result := True;
         end
      else begin
         If xOperator = '=' then  begin
               If xCampo = xValida then
                  Result := True;
            end
         else begin
            If xOperator = '>=' then  begin
                  If xCampo >= xValida then
                     Result := True;
               end
            else begin
               If xOperator = '<=' then  begin
                     If xCampo <= xValida then
                        Result := True;
                  end
               else begin
                  If xOperator = '<>' then  begin
                        If xCampo <> xValida then
                            Result := True;
                  end
               end;
            end;
         end;
      end;
   end;
end;

Function TSolMantenimiento.ConsistenciaReal( xCampo:Real; xOperator:String; xValida:Real ): Boolean;
begin
   Result := False;
   If xOperator = '>' then  begin
         If xCampo > xValida then
            Result := True;
      end
   else begin
      If xOperator = '<' then  begin
            If xCampo < xValida then
               Result := True;
         end
      else begin
         If xOperator = '=' then  begin
               If xCampo = xValida then
                  Result := True;
            end
         else begin
            If xOperator = '>=' then  begin
                  If xCampo >= xValida then
                     Result := True;
               end
            else begin
               If xOperator = '<=' then  begin
                     If xCampo <= xValida then
                        Result := True;
                  end
               else begin
                  If xOperator = '<>' then  begin
                        If xCampo <> xValida then
                            Result := True;
                  end
               end;
            end;
         end;
      end;
   end;
end;

procedure TSolMantenimiento.dbgFiltroKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (key=VK_Delete) and (ssCtrl in Shift) then begin
      if (cds1.fieldByName('EDITA').AsString='N') or (cds1.fieldByName('EDITA').AsString='') then Exit;

      if MessageDlg( ' ¿ Eliminar Registro ? ' ,mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin
         cds2.Delete;
         cds2.DataRequest( wSelect );
         AplicaDatos( cds2, 'Plantillas' );
      end
   end;
end;


procedure TSolMantenimiento.FormClose(Sender: TObject; var Action: TCloseAction);
begin

   // Remoto
   if Length(wTabla)=0 then
      ActualizaTablas;

   Action:=caFree;

   if not ( Tipo='HELP' ) then
      bbtnCierra.Click;

   SolMantenimiento:=nil;

end;

procedure TSolMantenimiento.Cierra;
begin
   if cdsPlan.Active then
      cdsPlan.Close;

  // VHNXX
     cds1.Close;

     // Remoto
     if Length(wTabla)=0 then
        ActualizaTablas;

     cds1 := nil;

//     result := False;

//     EliminaGrupos;

     if cds2.Active then
        cds2.Close;

     cds2.IndexName:='';
     cds2.Filter   :='';
     cds2.Filtered :=False;

     cds2.PacketRecords:=-1;
     cds2.FetchOnDemand:=True;

//     cds1.Free;
     cdsPlan.Close;
end;


procedure TSolMantenimiento.dbgFiltroDblClick(Sender: TObject);
begin
   if ( not Z2bbtnConsulta.Enabled ) and
      ( not Z2bbtnModifica.Enabled ) then Exit;

   if not cds2.Active then Exit;
   
   if cds2.RecordCount=0 then Exit;;

   nContPrv:=0;

   CreaCampos( 2 );

   if wTabla='' then
      dbgTables.Enabled:=False;

   dbgFiltro.Enabled   := False;
   pnlFiltro.Enabled   := False;
   pnlFRegistro.Top    := 150;
   pnlFRegistro.Visible:= True;

   Z2bbtnModifica.Enabled:=True;
   if (cds1.fieldByName('EDITA').AsString='N') or (cds1.fieldByName('EDITA').AsString='') then
      Z2bbtnModifica.Enabled:=False;

   if Z2bbtnModifica.Enabled then
   begin
      pnlRegistro.Enabled:=True;
      bbtnOk.Enabled:=True;
      lblTituloM.Caption:='Edición de Registro';
      cds2.Edit;
      SetFocusInicial;
   end
   else
   begin
      lblTituloM.Caption:='Consulta de Registro';
      pnlRegistro.Enabled:=False;
      bbtnOk.Enabled:=False;
   end;
end;

procedure TSolMantenimiento.SetFocusInicial;
var
   N : Integer;
begin
   For N:=1 to xNComp do begin
       If wType[ N ]='D' then
          begin
             If wdbdtp[ N ].Enabled then begin
                wdbdtp[ N ].SetFocus;
                Exit;
             end;
          end
       else begin
          If wType[ N ]='L' then
             begin
                If wdblc[ N ].Enabled then begin
                   wdblc[ N ].SetFocus;
                   Exit;
                end;
             end
          else begin
             If wType[ N ]='C' then
                begin
                   If wdblcd[ N ].Enabled then begin
                      wdblcd[ N ].SetFocus;
                      Exit;
                   end;
                end
             else begin
                If wType[ N ]='M' then
                begin
                   If wdbMemo[ N ].Enabled then begin
                         wdbMemo[ N ].SetFocus;
                         Exit;
                   end;
                end
                else
                begin
                   If wdbedit[ N ].Enabled then begin
                      wdbedit[ N ].SetFocus;
                      Exit;
                   end;
                end;
             end;
          end;
       end;
   end;
end;


procedure TSolMantenimiento.bbtnCancelaClick(Sender: TObject);
begin
   if cds2.State=dsInsert then
      cds2.Delete;

   cds2.CancelUpdates;
   EliminaCampos( 1 );
   pnlFRegistro.Visible:= False;

   if pnlReporte.Visible or pnlFiltro.Visible or pnlFRegistro.Visible then
   begin

     if wTabla='' then
        dbgTables.Enabled := False;

   end
   else begin

     if wTabla='' then
        dbgTables.Enabled := True;

   end;
   dbgFiltro.Enabled  := True;
   pnlFiltro.Enabled:= True;

   if pnlFiltro.Visible then pnlFiltro.Enabled:=True;

   pnlBtns.Enabled := True;
   pnlPie.Enabled  := True;
end;

procedure TSolMantenimiento.dbgFiltroTitleButtonClick(Sender: TObject; AFieldName: String);
var
   xTitLabel : String;
begin
   pnlBusca.Visible := True;
   isBusca.SearchField := AFieldName;
   dbgFiltro.SetActiveField( AFieldName );
   cds2.IndexFieldNames:=AFieldName;
   xTitLabel := dbgFiltro.SelectedField.DisplayLabel;
   xTitLabel[ Pos('~',xTitLabel)] := ' ';
   lblBusca2.caption := xTitLabel;
   isBusca.SetFocus;
end;

procedure TSolMantenimiento.isBuscaExit(Sender: TObject);
begin
   pnlBusca.Visible := False;
   dbgFiltro.Setfocus;
end;


procedure TSolMantenimiento.GeneraListBox;
var
   xTitCampo : String;
   xNomCampo : String;
   i, xxPos, nv  : Integer;
   xContinue : Boolean;
begin
   clbCampos.Items.Clear;
   clbCampos2.Items.Clear;
   clbCamposP.Items.Clear;
   clbCamposA.Items.Clear;
   clbCamposReal.Items.Clear;
   lbCampos.Items.Clear;
   lbCamposReal.Items.Clear;
   clbRepD.Items.Clear;
   clbRepDReal.Items.Clear;
   clbRepDTabla.Items.Clear;

   if cdsGrid.RecordCount>0 then begin
      cdsGrid.First;
      while Not cdsGrid.Eof do begin

         if cdsGrid.FieldByName('Flag').AsString<>'S' then begin

            xNomCampo:=cdsGrid.FieldByName('Campo').AsString;

            xContinue:=True;
            For nv:=0 to wNoVisible.Count-1 do begin
                if xNomCampo=wNoVisible[ nv ] then begin
                   xContinue:=False;
                   Break;
                end;
            end;

            if xContinue then begin
               xTitCampo := cdsGrid.FieldByName('DetDBGTitle').AsString;
               clbCampos2.Items.Add( xTitCampo );
               clbCamposP.Items.Add( cdsGrid.FieldByName('DetDBGPicture').AsString );

               if (cdsGrid.FieldByName('DetDBGPos').AsInteger=0) or (cdsGrid.FieldByName('DetDBGPos').AsInteger=99) then
               begin;
                  if cdsGrid.FieldByName('TipoCombo').asstring='R' then
                     clbCamposA.Items.Add( 'R' )
                  else begin
                     clbCamposA.Items.Add( 'L' );
                  end;
                  If Length( xTitCampo )=0 then begin
                     lbCampos.Items.Add( xNomCampo );
                     clbCampos.Items.Add( xNomCampo );
                     if (cdsGrid.FieldByName('DETDBGREFER').AsString<>'') and
                        (cdsGrid.FieldByName('DETDBGREFER').AsString<>wTabla) then begin
                        clbRepD.Items.Add( xNomCampo );
                     end;
                  end
                  else begin
                     xTitCampo[ Pos('~',xTitCampo) ] := ' ';
                     lbCampos.Items.Add( xTitCampo );
                     clbCampos.Items.Add( xTitCampo );
                     if (cdsGrid.FieldByName('DETDBGREFER').AsString<>'') and
                        (cdsGrid.FieldByName('DETDBGREFER').AsString<>wTabla) then begin
                        clbRepD.Items.Add( xTitCampo );
                     end;
                  end;
                  lbCamposReal.Items.Add( xNomCampo );
                  clbCamposReal.Items.Add( xNomCampo);
                  if (cdsGrid.FieldByName('DETDBGREFER').AsString<>'') and
                     (cdsGrid.FieldByName('DETDBGREFER').AsString<>wTabla) then begin
                     clbRepDReal.Items.Add( xNomCampo );
                     clbRepDTabla.Items.Add( cdsGrid.FieldByName('DETDBGREFER').AsString );
                  end;
               end
               else begin

                  if (cdsGrid.FieldByName('DetDBGPos').AsInteger-1)<=clbCamposA.Items.Count then
                     xxPos := cdsGrid.FieldByName('DetDBGPos').AsInteger-1
                  else begin
                     xxPos := clbCamposA.Items.Count;
                  end;

                  if cdsGrid.FieldByName('TipoCombo').asstring='R' then
                     clbCamposA.Items.Insert( xxPos,'R' )
                  else begin
                     clbCamposA.Items.Insert(xxPos, 'L' );
                  end;
                  If Length( xTitCampo )=0 then begin
                     lbCampos.Items.Insert( xxPos, xNomCampo );
                     clbCampos.Items.Insert( xxPos, xNomCampo );
                     if (cdsGrid.FieldByName('DETDBGREFER').AsString<>'') and
                        (cdsGrid.FieldByName('DETDBGREFER').AsString<>wTabla) then begin
                        clbRepD.Items.Add( xNomCampo );
                     end;
                     end
                  else begin
                     xTitCampo[ Pos('~',xTitCampo) ] := ' ';
                     lbCampos.Items.Insert( xxPos, xTitCampo );
                     clbCampos.Items.Insert( xxPos, xTitCampo );
                     if (cdsGrid.FieldByName('DETDBGREFER').AsString<>'') and
                        (cdsGrid.FieldByName('DETDBGREFER').AsString<>wTabla) then begin
                        clbRepD.Items.Add( xTitCampo );
                     end;
                  end;
                  lbCamposReal.Items.Insert( xxPos, xNomCampo );
                  clbCamposReal.Items.Insert( xxPos, xNomCampo);
                     if (cdsGrid.FieldByName('DETDBGREFER').AsString<>'') and
                        (cdsGrid.FieldByName('DETDBGREFER').AsString<>wTabla) then begin
                     clbRepDReal.Items.Add( xNomCampo );
                     clbRepDTabla.Items.Add( cdsGrid.FieldByName('DETDBGREFER').AsString );
                  end;
               end;
            end;  // xContinue
         end;  //cdsGrid.FieldByName('Flag').AsString<>'S'
         cdsGrid.Next;
      end;
      end
   else begin
      for i:=0 to cds2.Fields.Count-1 do begin
          xNomCampo := cds2.FieldS[ I ].FieldName;
          lbCampos.Items.Add( xNomCampo );
          clbCampos.Items.Add( xNomCampo );
          lbCamposReal.Items.Add( xNomCampo );
          clbCamposReal.Items.Add( xNomCampo );
          clbCampos2.Items.Add( xNomCampo );
          clbCamposP.Items.Add( '' );
          clbCamposA.Items.Add( 'L' );
      end;
   end;

   For nv:=0 to lbCamposReal.Items.Count-1 do begin

//       if Copy(lbCamposReal.Items.Strings[ nv ],3,1)<>'.' then begin
       if Pos('.',lbCamposReal.Items.Strings[ nv ])=0 then begin
          if not cds2.FieldByName( lbCamposReal.Items.Strings[ nv ] ).Visible then
             lbCampos.Checked[ nv ]:=False
          else
             lbCampos.Checked[ nv ]:=True;
       end
       else begin
//          if not cds2.FieldByName( Copy(lbCamposReal.Items.Strings[nv],3,Length(lbCamposReal.Items.Strings[nv])-2 ) ).Visible then
          if not cds2.FieldByName( Copy(lbCamposReal.Items.Strings[nv], Pos('.',lbCamposReal.Items.Strings[ nv ])+1, Length(lbCamposReal.Items.Strings[nv])-2 ) ).Visible then
             lbCampos.Checked[ nv ]:=False
          else
             lbCampos.Checked[ nv ]:=True;
       end
   end;

end;

procedure TSolMantenimiento.FormResize(Sender: TObject);
begin
   pnlReporte.Visible:=False;
   if pnlFiltro.Visible then
   begin
     dbgFiltro.Height := pnlColumna.Height - pnlFiltro.Height - 1;
     dbgFiltro.Width  := pnlFiltro.Width-1;
   end
   else begin
     dbgFiltro.Height := pnlColumna.Height-1;
     dbgFiltro.Width  := pnlFiltro.Width-1;
   end;
   bbtnSalir.Left := (pnlPie.Width - bbtnSalir.Width)-5;
end;

procedure TSolMantenimiento.lbCampos2EndDrag(Sender, Target: TObject; X, Y: Integer);
begin
   if Target=lbFiltro then begin // si el destino es filtros
      dbgFiltro.Enabled  := False;
      pnlFiltro.Enabled  := False;
      pnlPie.Enabled     := False;
      pnlBtns.Enabled    := False;
      bbtnAcceso.Enabled := False;
      bbtnRef.Enabled    := False;
      nContPrv :=0;
      nContPrv2:=0;
      MuestraPanel;
   end;
   if Target=lbOrden then begin  // si el destino es ordenar
      lbOrden.Items.Add(lbCampos.Items.Strings[lbCampos.ItemIndex]);
      lbOrdenReal.Items.Add(lbCamposReal.Items.Strings[lbCampos.ItemIndex]);
   end;
end;

Procedure TSolMantenimiento.MuestraPanel;
var
   wwFieldTitle : String;
//   xWidth, xHeight, wwTipo, nv : Integer;
   wwTipo, nv : Integer;
   xContinue : Boolean;
begin
   // VHNXXX  26112003

   rgValor.ItemIndex:=0;
   cbCampos.Visible :=False;

   bbtnOkF.Visible:=True;
   xIniOr:=0; // Contador de Or

   rgFiltro.ItemIndex:=2;         // asigna valor default '=' a criterio de filtros
   pnlFiltro2.Top:=pnlFiltro.Top-pnlFiltro.Height-40;
   if dbgTables.Visible then
      pnlFiltro2.Left:=trunc((dbgfiltro.width-pnlFiltro2.Width)/2)+dbgTables.Width
      //pnlFiltro2.Left:=trunc((dbgTables.Width+dbgfiltro.width-pnlFiltro2.Width)/2)
   else
      pnlFiltro2.Left:=trunc((dbgfiltro.width-pnlFiltro2.Width)/2);

   pnlFiltro2.Visible:=True;

   wwTipo:=3;
   wLin   := 60;
   wCol   := 0;
   xNComp := 0;
   cdsGrid.First;
   while not cdsGrid.Eof do begin

    if cdsGrid.FieldByName('Flag').AsString<>'S' then begin

      wFieldName:=cdsGrid.FieldByName('Campo').AsString;

      xContinue:=True;
      For nv:=0 to wNoVisible.Count-1 do begin
          if wFieldName=wNoVisible[ nv ] then begin
             xContinue:=False;
             Break;
          end;
      end;

      if Pos('.',cdsGrid.FieldByName('Campo').AsString)=0 then
         wFieldName:=cdsGrid.FieldByName('Campo').AsString
      else
         wFieldName:=Copy(cdsGrid.FieldByName('Campo').AsString, Pos('.',cdsGrid.FieldByName('Campo').AsString)+1, Length(cdsGrid.FieldByName('Campo').AsString)-1);

      if xContinue then
         xNComp:=xNComp+1;

      wTableN[xNComp]  := cdsGrid.FieldByName('DetDBGRefer').AsString;
      wPredeces[xNComp]:= cdsGrid.FieldByName('Predecesor').AsString;

      if xNComp=(lbCampos.ItemIndex+1) then begin

         wFieldN[xNComp]  := wFieldName;
         wwFieldTitle     := cdsGrid.FieldByName('DetDBGTitle').asstring;
         wKey[xNComp]     := cdsGrid.FieldByName('DetDBGKey').AsString;
         wType[xNComp]    := cdsGrid.FieldByName('TipoCombo').AsString;
         wTableN[xNComp]  := cdsGrid.FieldByName('DetDBGRefer').AsString;
         wStrZero[xNComp] := cdsGrid.FieldByName('STRZERO').AsString;
         wWidthReg[xNComp]:= cdsGrid.FieldByName('DETDBGWIDTH').AsInteger;
         wPredeces[xNComp]:= cdsGrid.FieldByName('Predecesor').AsString;

         wlbl[xNComp]   := TLabel.create(self);
         PropLBL( wlbl[xNComp], wwFieldTitle, pnlFiltro2 );
         if wType[xNComp]='D' then begin
            bbtnDate.Visible:=True;
            meDias.Visible  :=True;
            lblDias.Visible :=True;
            wdbdtp[xNComp]:=TwwDBDateTimePicker.create(self);
            PropDTP( wdbdtp[xNComp], wwTipo, pnlFiltro2 );
            wdbdtp[xNComp].Left:=wdbdtp[xNComp].Left+50;
            wdbdtp[xNComp].SetFocus;
         end
         else begin
            bbtnDate.Visible:=False;
            meDias.Visible  :=False;
            lblDias.Visible :=False;
            If wType[xNComp]='L' then begin
               wdblc[xNComp]:=TwwDBLookupCombo.create(self);
               PropDBLC( wdblc[xNComp], 4, pnlFiltro2 );
               wdblc[xNComp].Left:=wdblc[xNComp].Left+50;
               wdblc[xNComp].SetFocus;
               end
            else begin
               If wType[xNComp]='C' then begin
                  wdblcd[xNComp]:=TwwDBLookupComboDlg.create(self);
                  PropDBLCD( wdblcd[xNComp], wwTipo, pnlFiltro2 );
                  wdblcd[xNComp].Left:=wdblcd[xNComp].Left+50;
                  wdblcd[xNComp].SetFocus;
                  end
               else begin
                  wdbedit[xNComp]:=TwwDBEdit.create(self);
                  PropDBE( wdbedit[xNComp], wwTipo, pnlFiltro2 );
                  wdbedit[xNComp].Left:=wdbedit[xNComp].Left+50;
                  wdbedit[xNComp].SetFocus;
               end;
            end;
         end;
         Exit;
      end;
    end;
      cdsGrid.Next;
   end;

   if cdsGrid.RecordCount=0 then begin
      xNComp := lbCampos.ItemIndex;
      wFieldName       := lbCampos.Items.Strings[ xNComp ];
      wFieldN[ xNComp ]:= wFieldName;
      wwFieldTitle     := wFieldName;
      wKey[ xNComp ]   := '';
      wType[ xNComp ]  := 'E';
      wTableN[ xNComp ]:= ' ';
      wlbl[ xNComp ]   := TLabel.create(self);
      PropLBL( wlbl[xNComp], wwFieldTitle, pnlFiltro2 );
      wdbedit[ xNComp ]:=TwwDBEdit.create(self);
      PropDBE( wdbedit[ xNComp ], wwTipo, pnlFiltro2 );
      wdbedit[xNComp].Left:=wdbedit[xNComp].Left+50;
      wdbedit[ xNComp ].SetFocus;
   end;
end;

procedure TSolMantenimiento.lbCampos2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   lbCampos.BeginDrag(False);
end;

procedure TSolMantenimiento.lbFiltroDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TSolMantenimiento.bbtnOkFClick(Sender: TObject);
Var
   wVarFiltro : String;
   wVarFiltroD: String;
   wVariable1 : String;
   wVariable2 : String;
   wRelacion1 : String;
   wTablaxx   : String;
   wRealTmp   : String;
   xnLength, xnIni   : Integer;
begin

   if rgFiltro.ItemIndex=6 then begin
      if (wType[xNComp]='D') or (wType[xNComp]='R') then begin
         ShowMessage('Error : Operador SUBSTR solo se usa con Datos String');
         Exit;
      end
   end;
   // VHNXXX  26112003
   if rgFiltro.ItemIndex=7 then begin
      if (wType[xNComp]='D') or (wType[xNComp]='R') then begin
         ShowMessage('Error : Operador Contiene solo se usa con Datos String');
         Exit;
      end
   end;

   if trim(wTabla)='' then
      wTablaxx:=cds1.FieldByName('zArchivo').AsString+'.'
   else begin
      wTablaxx:=wTabla+'.';
   end;

   if wUsuarioSQL.Count>0 then
      wTablaxx:='';

   pnlFiltro2.Visible:=False;

   xnLength:=0;
   if rgFiltro.ItemIndex=6 then begin
      if wType[xNComp]='L' then
         wVarFiltro := wDBLC[xNComp].Text
      else begin
         if wType[XNComp]='C' then
            wVarFiltro := wDBLCD[xNComp].Text
         else begin
            wVarFiltro :=  wDBEdit[xNComp].Text;
         end;
      end;

      if seLen.Value>0 then
         xnLength:=seLen.Value
      else
         xnLength:=Length(wVarFiltro);

      if seIni.Value>0 then
         xnIni:=seIni.Value
      else
         xnIni:=1;

      wVariable1:='SubStr('+lbCampos.Items.Strings[lbCampos.ItemIndex]
                 +', '+InttoStr(xnIni)+ ','+InttoStr(xnLength)+')' ;
      wRelacion1:='=';
   end
   else begin
      if rgFiltro.ItemIndex=7 then begin
         wVariable1:=lbCampos.Items.Strings[lbCampos.ItemIndex];
         wRelacion1:=' LIKE ';
      end
      else
      begin
         wVariable1:=lbCampos.Items.Strings[lbCampos.ItemIndex];
         wRelacion1:=rgFiltro.Items.Strings[rgFiltro.ItemIndex];
      end;
   end;

   // Modificar para AS400
   If wType[xNComp]='D' then begin
      if rgValor.ItemIndex=1 then begin
         lbFiltro.Items.Add( wVariable1 +wRelacion1 + cbCampos.Text );
         if SRV_D = 'ORACLE' then
            wVariable2:='TO_DATE('+wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex]+')'
         else
            wVariable2:=wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex];

         lbFiltroReal.Items.Add(wVariable2 + wRelacion1 + lbCamposReal.Items.Strings[cbCampos.ItemIndex]);
      end
      else begin
         if wdbdtp[xNComp].Date=0 then
            wVarFiltro :=''
         else
            wVarFiltro :=DateToStr( wdbdtp[xNComp].Date );
         wVarFiltroD:=wRepFuncDate+''''+FORMATDATETIME(wFormatFecha,wdbdtp[xNComp].Date)+''''+')';
         lbFiltro.Items.Add( wVariable1+wRelacion1+''''+wVarFiltro+'''');
         if SRV_D = 'ORACLE' then
            wVariable2:='TO_DATE('+wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex]+')'
         else
            wVariable2:=wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex];
         if wdbdtp[xNComp].Date=0 then
         begin
            if wRelacion1='='  then lbFiltroReal.Items.Add(wVariable2 + 'IS NULL' );
            if wRelacion1='<>' then lbFiltroReal.Items.Add(wVariable2 + 'IS NOT NULL' );
         end
         else
            lbFiltroReal.Items.Add(wVariable2 + wRelacion1 + wVarFiltroD);
      end;
      bbtnDate.Visible:=False;
      meDias.Visible  :=False;
      lblDias.Visible :=False;
      end
   else begin
      If wType[xNComp]='R' then begin
         wVarFiltro := wDBEdit[xNComp].Text;
         lbFiltro.Items.Add( wVariable1+wRelacion1+wVarFiltro);
         wVariable2:=wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex];
         lbFiltroReal.Items.Add(wVariable2 + wRelacion1 + wVarFiltro);
         end
      else begin
         if rgValor.ItemIndex=1 then begin
            lbFiltro.Items.Add( wVariable1 +wRelacion1 + cbCampos.Text );
            wVariable2:=wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex];
            lbFiltroReal.Items.Add(wVariable2 + wRelacion1 + lbCamposReal.Items.Strings[cbCampos.ItemIndex]);
         end
         else begin
            if wType[xNComp]='L' then
               wVarFiltro := wDBLC[xNComp].Text
            else begin
               if wType[XNComp]='C' then
                  wVarFiltro := wDBLCD[xNComp].Text
               else begin
                  wVarFiltro :=  wDBEdit[xNComp].Text;
               end;
            end;
            if rgFiltro.ItemIndex=7 then
            begin
               if rgLike.ItemIndex=0 then
                  wVarFiltro := wVarFiltro+'%';
               if rgLike.ItemIndex=1 then
                  wVarFiltro := '%'+wVarFiltro;
               if rgLike.ItemIndex=2 then
                  wVarFiltro := '%'+wVarFiltro+'%';
            end;

            // Inserta Campo
            lbFiltro.Items.Add( wVariable1+wRelacion1+''''+wVarFiltro+'''');

            if rgFiltro.ItemIndex=6 then begin
               wVariable2:='SubStr('+wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex]
                          +', '+InttoStr(xnIni)+', '+InttoStr(xnLength)+')' ;
            end
            else begin
               wVariable2:=wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex];
            end;
            if wVarFiltro<>'' then
               lbFiltroReal.Items.Add(wVariable2+wRelacion1+''''+wVarFiltro+'''')
            else begin
               if wRelacion1<>'<>' then
                  lbFiltroReal.Items.Add(' ( '+wVariable2+wRelacion1+''''+wVarFiltro+''' or '+wVariable2+' is null ) ' )
               else
                  lbFiltroReal.Items.Add(' ( '+wVariable2+wRelacion1+''''+wVarFiltro+''' or '+wVariable2+' is not null ) ' );
            end;
         end;
      end;
   end;

   // VHN 20110516
   //if (wType[xNComp]='L') OR (wType[XNComp]='C') then
   if (wType[XNComp]='C') then
   begin
      wcdsLookup[ xNComp ].First;
      while not wcdsLookup[ xNComp ].Eof do
      begin
         if wcdsLookup[ xNComp ].FieldByName('DETDBGKEY').AsString<>'' then
         begin
            wVariable2:=wcdsLookup[ xNComp ].FieldByName('CAMPO').AsString;
            wVariable1:=wcdsLookup[ xNComp ].FieldByName('DESCRIPCION').AsString;

            wRealTmp:=lbCamposReal.Items.Strings[lbCampos.ItemIndex];
            if Pos( '.', wRealTmp )>0 then
               wRealTmp:=Copy( wRealTmp, Pos( '.', wRealTmp )+1, Length( wRealTmp ) );
            if wRealTmp<>wVariable2 then
            begin
               wRelacion1:='=';
               wVarFiltro:=wcds[ xNComp ].FieldByName( wcdsLookup[ xNComp ].FieldByName('CAMPO').AsString ).AsString;

               if (wType[xNComp]='L') or (wType[XNComp]='C') or (wType[XNComp]='E') then
               begin
                  lbFiltro.Items.Add( wVariable1+wRelacion1+QuotedStr(wVarFiltro) );
                  lbFiltroReal.Items.Add( wVariable2+wRelacion1+QuotedStr(wVarFiltro) );
               end
               else
               begin
                  lbFiltro.Items.Add( wVariable1+wRelacion1+wVarFiltro );
                  lbFiltroReal.Items.Add( wVariable2+wRelacion1+wVarFiltro );
               end;
            end;
         end;
         wcdsLookup[ xNComp ].Next;
      end;
   end;

   EliminaCampos( xNComp );
   pnlFiltro.Enabled  := True;
   dbgFiltro.Enabled  := True;
   pnlPie.Enabled     := True;
   pnlBtns.Enabled    := True;
   bbtnAcceso.Enabled := True;
   bbtnRef.Enabled    := True;
end;


procedure TSolMantenimiento.bbtnORClick(Sender: TObject);
Var
   wVarFiltro : String;
   wVarFiltroD: String;
   wVariable1 : String;
   wVariable2 : String;
   wRelacion1 : String;
   wTablaxx   : String;
   xnLength   : Integer;
   xOrS       : String;
   xNCamposG  : String;
begin

   bbtnOkF.Visible:=False;

   xIniOr:=xIniOr+1;
   if xIniOr=1 then xOrS:='( ';
   if xIniOr>1 then xOrS:=' or ';

// vhnxxx 26112003
   xNCamposG:='N';
   if (wType[xNComp]='L') OR (wType[XNComp]='C') then
   begin
      wcdsLookup[ xNComp ].First;
      while not wcdsLookup[ xNComp ].Eof do
      begin
         if wcdsLookup[ xNComp ].FieldByName('DETDBGKEY').AsString<>'' then
         begin
            wVariable2:=wcdsLookup[ xNComp ].FieldByName('CAMPO').AsString;
            if lbCamposReal.Items.Strings[lbCampos.ItemIndex]<>wVariable2 then
            begin
               xOrS:=xOrS+' ( ';
               xNCamposG:='S';
               Break;
            end;
         end;
         wcdsLookup[ xNComp ].Next;
      end;
   end;
//
   if rgFiltro.ItemIndex=6 then begin
      if (wType[xNComp]='D') or (wType[xNComp]='R') then begin
         ShowMessage('Error : Operador SUBSTR solo se usa con Datos String');
         Exit;
      end
   end;

   if rgFiltro.ItemIndex=7 then begin
      if (wType[xNComp]='D') or (wType[xNComp]='R') then begin
         ShowMessage('Error : Operador Contiene solo se usa con Datos String');
         Exit;
      end
   end;

   if trim(wTabla)='' then
      wTablaxx:=cds1.FieldByName('zArchivo').AsString+'.'
   else begin
      wTablaxx:=wTabla+'.';
   end;

   if wUsuarioSQL.Count>0 then
      wTablaxx:='';

   xnLength:=0;
   if rgFiltro.ItemIndex=6 then begin
      if wType[xNComp]='L' then
         wVarFiltro := wDBLC[xNComp].Text
      else begin
         if wType[XNComp]='C' then
            wVarFiltro := wDBLCD[xNComp].Text
         else begin
            wVarFiltro :=  wDBEdit[xNComp].Text;
         end;
      end;
      xnLength:=Length(wVarFiltro);
      wVariable1:=xOrS+'SubStr('+lbCampos.Items.Strings[lbCampos.ItemIndex]
                 +',1,'+InttoStr(xnLength)+')' ;
      wRelacion1:='=';
   end
   else begin
      if rgFiltro.ItemIndex=7 then
      begin
         wVariable1:=xOrS+lbCampos.Items.Strings[lbCampos.ItemIndex];
         wRelacion1:=' LIKE ';
      end
      else
      begin
         wVariable1:=xOrS+lbCampos.Items.Strings[lbCampos.ItemIndex];
         wRelacion1:=rgFiltro.Items.Strings[rgFiltro.ItemIndex];
      end;
   end;
   // Modificar para AS400
   If wType[xNComp]='D' then begin
      wVarFiltro :=DateToStr( wdbdtp[xNComp].Date );
      wVarFiltroD:=wRepFuncDate+''''+FORMATDATETIME(wFormatFecha,wdbdtp[xNComp].Date)+''''+')';
      lbFiltro.Items.Add( wVariable1+wRelacion1+''''+wVarFiltro+'''');
      wVariable2:=xOrS+wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex];
      lbFiltroReal.Items.Add(wVariable2 + wRelacion1 + wVarFiltroD);
      bbtnDate.Visible:=False;
      meDias.Visible  :=False;
      lblDias.Visible :=False;
      end
   else begin
      If wType[xNComp]='R' then begin
         wVarFiltro := wDBEdit[xNComp].Text;
         lbFiltro.Items.Add( wVariable1+wRelacion1+wVarFiltro);
         wVariable2:=xOrS+wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex];
         lbFiltroReal.Items.Add(wVariable2 + wRelacion1 + wVarFiltro);
         end
      else begin
         if wType[xNComp]='L' then
            wVarFiltro := wDBLC[xNComp].Text
         else begin
            if wType[XNComp]='C' then
               wVarFiltro := wDBLCD[xNComp].Text
            else begin
               wVarFiltro :=  wDBEdit[xNComp].Text;
            end;
         end;

         if rgFiltro.ItemIndex=7 then
         begin
            if rgLike.ItemIndex=0 then
               wVarFiltro:=wVarFiltro+'%';
            if rgLike.ItemIndex=1 then
               wVarFiltro:='%'+wVarFiltro;
            if rgLike.ItemIndex=2 then
               wVarFiltro:='%'+wVarFiltro+'%';
         end;

         lbFiltro.Items.Add( wVariable1+wRelacion1+''''+wVarFiltro+'''');

         if rgFiltro.ItemIndex=6 then begin
            wVariable2:=xOrS+'SubStr('+wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex]
                       +',1,'+InttoStr(xnLength)+')' ;
         end
         else begin
            wVariable2:=xOrS+wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex];
         end;
         lbFiltroReal.Items.Add(wVariable2+wRelacion1+''''+wVarFiltro+'''');
      end;
   end;

   if (wType[xNComp]='L') OR (wType[XNComp]='C') then
   begin
      wcdsLookup[ xNComp ].First;
      while not wcdsLookup[ xNComp ].Eof do
      begin
         if wcdsLookup[ xNComp ].FieldByName('DETDBGKEY').AsString<>'' then
         begin
            wVariable2:=wcdsLookup[ xNComp ].FieldByName('CAMPO').AsString;
            wVariable1:=wcdsLookup[ xNComp ].FieldByName('DESCRIPCION').AsString;

            if lbCamposReal.Items.Strings[lbCampos.ItemIndex]<>wVariable2 then
            begin

               wRelacion1:='=';
               wVarFiltro:=wcds[ xNComp ].FieldByName( wcdsLookup[ xNComp ].FieldByName('CAMPO').AsString ).AsString;

               if (wType[xNComp]='L') or (wType[XNComp]='C') or (wType[XNComp]='E') then
               begin
                  lbFiltro.Items.Add( wVariable1+wRelacion1+QuotedStr(wVarFiltro) );
                  lbFiltroReal.Items.Add( wVariable2+wRelacion1+QuotedStr(wVarFiltro) );
               end
               else
               begin
                  lbFiltro.Items.Add( wVariable1+wRelacion1+wVarFiltro );
                  lbFiltroReal.Items.Add( wVariable2+wRelacion1+wVarFiltro );
               end;
            end;
         end;
         wcdsLookup[ xNComp ].Next;
      end;

      if xNCamposG='S' then
      begin
         lbFiltro.Items[ lbFiltro.Count-1 ]:=lbFiltro.Items[ lbFiltro.Count-1 ]+' ) ';
         lbFiltroReal.Items[ lbFiltroReal.Count-1 ]:=lbFiltroReal.Items[ lbFiltroReal.Count-1 ]+' ) ';
      end;
   end;
end;


procedure TSolMantenimiento.FiltraData( xTipo : String );
var
   xWhere, wQuery, xOrder, xCampoR : String;
   x, xpi, xpf, xpf2, nIni : Integer;
   poswhere,posgroup,posorder,I:integer;
   xCampo1 : TField;
   xSOLVista : Integer;
begin
   poswhere:=0;
   posgroup:=0;
   posorder:=0;

   Screen.Cursor:=CrHourGlass;
   xWhere   := '';
   SQL_WHERE:='';

   xSOLVista:=Pos('SOLVISTA', wUserSQL);

   for x:=0 to lbFiltroReal.Items.Count - 1 do begin
      xCampoR:=lbFiltroReal.Items.Strings[x];
      if xSOLVista>0 then
      begin
        if Pos( '.', xCampoR )>0 then
           xCampoR:=Copy( xCampoR, Pos( '.', xCampoR )+1, Length( xCampoR ) );
      end;

      if length( xWhere )>0 then
         if Copy(lbFiltroReal.Items.Strings[x],1,4)=' or ' then
            xWhere := xWhere + xCampoR //lbFiltroReal.Items.Strings[x]
         else
            xWhere := xWhere + ' and ' + xCampoR //lbFiltroReal.Items.Strings[x]
      else begin
         xWhere := xCampoR; //lbFiltroReal.Items.Strings[x];
      end;
   end;

    SQL_WHERE:=xWhere;

   xOrder := '';
   for x:=0 to lbOrdenReal.Items.Count - 1 do begin

      xCampoR:=lbOrdenReal.Items.Strings[x];
      if xSOLVista>0 then
      begin
        if Pos( '.', xCampoR )>0 then
           xCampoR:=Copy( xCampoR, Pos( '.', xCampoR )+1, Length( xCampoR ) );
      end;

      if length( xOrder )>0 then
         xOrder := xOrder + ', ' + xCampoR //lbOrdenReal.Items.Strings[x]
      else begin
         xOrder := xCampoR; //lbOrdenReal.Items.Strings[x];
      end;
   end;

   If Length( xWhere ) > 0 then
      wQuery  := wSelect + ' WHERE ' + xWhere
   else
      wQuery  := wSelect;

   if wFilter<>'' then
   begin
      if pos('WHERE',wQuery)>0 then
      begin
         wQuery   :=wQuery   +' AND ('+ wFilter +') ';
         SQL_WHERE:=SQL_WHERE+' AND ('+ wFilter +') ';
      end
      else begin
         wQuery   :=wQuery + ' WHERE ('+wFilter+') ';
         SQL_WHERE:=' ('+ wFilter +') ';
      end;
   end;

   if wFilter2<>'' then
   begin
      if pos('WHERE',wQuery)>0 then
      begin
         wQuery   :=wQuery   +' AND ('+ wFilter2 +') ';
         SQL_WHERE:=SQL_WHERE+' AND ('+ wFilter2 +') ';
      end
      else begin
         wQuery   :=wQuery + ' WHERE ('+wFilter2+') ';
         SQL_WHERE:=' ('+ wFilter2 +') ';
      end;
   end;

   if Length( xOrder ) > 0 then
      wQuery  := wQuery + ' ORDER BY ' + xOrder;

   SQL := wQuery;

   nIni    :=Pos('SOLVISTA', wUserSQL)+7;

   if Length( wUserSQL )>0 then begin

      wQuery := wUserSQL;

      if Length(xWhere)>0 then
      begin

         nIni:=0;
         if Pos('SOLVISTA', wUserSQL)>0 then begin
            nIni    :=Pos('SOLVISTA', wUserSQL)+7;
            PosWhere:=nIni;
            PosGroup:=nIni;
            PosOrder:=nIni;
         end;

         For I:=nIni to length(wUserSQL) do
         begin
            if UpperCase(copy(wuserSQL,I,5))='WHERE' then
                poswhere:=I;
         end;

         For I:=poswhere to length(wUserSQL) do
         begin
            if UpperCase(copy(wuserSQL,I,8))='GROUP BY' then
                posgroup:=I;
         end;

         For I:=poswhere to length(wUserSQL) do
         begin
            if UpperCase(copy(wuserSQL,I,8))='ORDER BY' then
                posOrder:=I;
         end;

         xpf :=posOrder-2;
         xpf2:=posGroup-2;

         if ( xpf-nIni<=0 ) and ( xpf2-nIni<=0 ) then
         begin

            //if pos('WHERE',wQuery)>0 Then
            if PosWhere-nIni>0 then
            begin
               wQuery  := wQuery + ' AND ('+xWhere+')'
            end
            else begin
               if PosOrder-nIni>0 then
                  wQuery  := Copy(wQuery,1,PosOrder-1) + ' WHERE ('+xWhere+') '+Copy(wQuery,PosOrder,Length(wQuery))
               else
                  wQuery  := wQuery + ' WHERE ('+xWhere+')';
            end
         end
         else begin

            //if pos('WHERE',wQuery)>0 Then
            if PosWhere-nIni>0 then
            begin
               if (xpf2-nIni>0) and (xpf-nIni>0) then
               begin
                  if xpf2-nIni>xpf-nIni then
                     wQuery:= Copy( wQuery, 1, xpf )
                            + ' AND ('+xWhere+')'
                            + Copy( wQuery, xpf+1, Length(wQuery) )
                  else
                     wQuery:= Copy( wQuery, 1, xpf2 )
                            + ' AND ('+xWhere+')'
                            + Copy( wQuery, xpf2+1, Length(wQuery) );
               end;

               if (xpf2-nIni>0) and (xpf-nIni<=0) then
               begin
                  wQuery:= Copy( wQuery, 1, xpf2 )
                         + ' AND ('+xWhere+')'
                         + Copy( wQuery, xpf2+1, Length(wQuery) );
               end;

               if (xpf-nIni>0) and (xpf2-nIni<=0) then
               begin
                  wQuery:= Copy( wQuery, 1, xpf )
                         + ' AND ('+xWhere+')'
                         + Copy( wQuery, xpf+1, Length(wQuery) );
               end;

            end
            else begin

               if (xpf2-nIni>0) and (xpf-nIni>0) then
               begin
                  if xpf2-nIni>xpf-nIni then
                     wQuery:= Copy( wQuery, 1, xpf )
                            + ' WHERE ('+xWhere+')'
                            + Copy( wQuery, xpf+1, Length(wQuery) )
                  else
                     wQuery:= Copy( wQuery, 1, xpf2 )
                            + ' WHERE ('+xWhere+')'
                            + Copy( wQuery, xpf2+1, Length(wQuery) );
               end;

               if (xpf2-nIni>0) and (xpf-nIni<=0) then
               begin
                  wQuery:= Copy( wQuery, 1, xpf2 )
                         + ' WHERE ('+xWhere+')'
                         + Copy( wQuery, xpf2+1, Length(wQuery) );
               end;

               if (xpf-nIni>0) and (xpf2-nIni<=0) then
               begin
                  wQuery:= Copy( wQuery, 1, xpf )
                         + ' WHERE ('+xWhere+')'
                         + Copy( wQuery, xpf+1, Length(wQuery) );
               end;

            end;
         end;
      end;

      if wFilter2<>'' then
      begin

         xpf :=AnsiPos('ORDER BY',wQuery)-2;
         xpf2:=AnsiPos('GROUP BY',wQuery)-2;

         if ( xpf<=0 ) and ( xpf2<=0 ) then
         begin
            if pos('WHERE',wQuery)>0 then
            begin
               wQuery  := wQuery + ' AND ('+wFilter2+')'
            end
            else begin
               wQuery  := wQuery + ' WHERE ('+wFilter2+')'
            end

         end
         else begin

            if pos('WHERE',wQuery)>0 Then
            begin
               if (xpf2>0) and (xpf>0) then
               begin
                  if xpf2>xpf then
                     wQuery:= Copy( wQuery, 1, xpf )
                            + ' AND ('+wFilter2+')'
                            + Copy( wQuery, xpf+1, Length(wQuery) )
                  else
                     wQuery:= Copy( wQuery, 1, xpf2 )
                            + ' AND ('+wFilter2+')'
                            + Copy( wQuery, xpf2+1, Length(wQuery) );
               end;

               if (xpf2>0) and (xpf<=0) then
               begin
                  wQuery:= Copy( wQuery, 1, xpf2 )
                         + ' AND ('+wFilter2+')'
                         + Copy( wQuery, xpf2+1, Length(wQuery) );
               end;

               if (xpf>0) and (xpf2<=0) then
               begin
                  wQuery:= Copy( wQuery, 1, xpf )
                         + ' AND ('+wFilter2+')'
                         + Copy( wQuery, xpf+1, Length(wQuery) );
               end;

            end
            else begin
               if (xpf2>0) and (xpf>0) then
               begin
                  if xpf2>xpf then
                     wQuery:= Copy( wQuery, 1, xpf )
                            + ' WHERE ('+wFilter2+')'
                            + Copy( wQuery, xpf+1, Length(wQuery) )
                  else
                     wQuery:= Copy( wQuery, 1, xpf2 )
                            + ' WHERE ('+wFilter2+')'
                            + Copy( wQuery, xpf2+1, Length(wQuery) );
               end;

               if (xpf2>0) and (xpf<=0) then
               begin
                  wQuery:= Copy( wQuery, 1, xpf2 )
                         + ' WHERE ('+wFilter2+')'
                         + Copy( wQuery, xpf2+1, Length(wQuery) );
               end;

               if (xpf>0) and (xpf2<=0) then
               begin
                  wQuery:= Copy( wQuery, 1, xpf )
                         + ' WHERE ('+wFilter2+')'
                         + Copy( wQuery, xpf+1, Length(wQuery) );
               end;

            end;
         end;
      end;

      if Length( xOrder ) > 0 then begin
         if Pos('ORDER BY', UpperCase( Copy(wQuery, nIni, Length(wQuery) ) ))<=0 then begin
            wQuery  := wQuery + ' ORDER BY ' + xOrder;
         end
         else begin
            wQuery  := Copy( wQuery, 1, Pos('ORDER BY',UpperCase(wQuery))-1 ) + ' ORDER BY ' + xOrder;
         end;
      end;


   end;

   SQL     := wQuery;

   xxWhereT:= '';
   if AnsiPos('WHERE',SQL)>0 then begin
      xpi:=AnsiPos('WHERE',SQL);
      xpf:=AnsiPos('ORDER BY',SQL);
      if xpf=0 then
         xxWhereT:= Copy( SQL, xpi, Length(SQL) )
      else
         xxWhereT:= Copy( SQL, xpi, xpf-xpi );
   end;

   xContSuma:=0;

   dbgFiltro.DataSource:=NIL;
   dbgFiltro.Selected.Clear;

   cds2.DisableControls;

   // vhn 06/06/2002
   if xTipo='NUEVO' then begin
      EliminaGrupos;
      if cds2.IndexName='XXX' then
         cds2.DeleteIndex( 'XXX' );
   end;

   MEMO1.Lines.Clear;
   MEMO1.Lines.Add( wQuery );

   dbgFiltro.SelectedList.clear;

   if Trim(wTabla)='' then begin

      if cds1.RecordCount=0 then begin
         ShowMessage( 'Error : No existen Referencias asignadas al MODULO' );
         bbtnSuma.Visible:=False;
         Z2bbtnImprime.Visible:=False;
         Z2bbtnFiltro.Visible:=False;
      end
      else begin
         cds2.Close;
         cds2.IndexFieldNames:='';
         cds2.PacketRecords:=-1;
         cds2.FetchOnDemand:=True;
         cds2.DataRequest(wQuery);
         cds2.Open;
      end;
   end
   else begin
      cds2.Close;
      cds2.IndexFieldNames:='';
      cds2.PacketRecords:=wPacketData;
      cds2.FetchOnDemand:=False;
      cds2.DataRequest(wQuery);
      try
        cds2.Open;
      except
        Screen.Cursor:=crDefault;
        ShowMessage('Error en SQL de Usuario');
        Exit;
      end;

      cds2.PacketRecords:=wPacketData;
      cds2.FetchOnDemand:=True;
   end;
   cds2.EnableControls;

   // VHNXX
   ds2.DataSet:= cds2;

   if cds2.RecordCount>0 then
      dbgFiltro.DataSource:=ds2;

   if xTipo='NUEVO' then begin
      GeneraListBox;
      lbRefer.Clear;
      MuestraGrid;
//      if dbgFiltro.DataSource=ds2 then
//         MuestraGrupos;
   end
   else begin
      MuestraGrid;

      MuestraGrupos;
   end;

{
   if wUsuarioSQL.Count=0 then
      bbtnSumaClick(Self);
}
   Screen.Cursor:=crDefault;
end;

Procedure TSolMantenimiento.MuestraGrid;
var
   wFieldName, wFieldTitle, wFieldPict, xxxCampo, xCampoExpand  : String;
   wFieldPos, wCountFixedCol, wFieldWidth, nv, xCols     : Integer;
   xLin01, xLin02, xSQLd : String;
begin
   wCountFixedCol:=0;
   cds2.DisableControls;

   if cdsGrid.Recordcount>0 then
   begin
      for nv:=0 to cds2.FieldCount-1 do
      begin
          cds2.FieldList.Fields[ nv ].Visible:=False;
      end;
   end;

   cdsGrid.First;
   while Not cdsGrid.Eof do begin

      if Pos('.',cdsGrid.FieldByName('Campo').AsString)=0 then
         wFieldName:=cdsGrid.FieldByName('Campo').AsString
      else
         wFieldName:=Copy(cdsGrid.FieldByName('Campo').AsString, Pos('.',cdsGrid.FieldByName('Campo').AsString)+1, Length(cdsGrid.FieldByName('Campo').AsString)-1);

      if cdsGrid.FieldByName('Flag').AsString<>'S' then
      begin
         cds2.FieldByName(wFieldName).Visible:=True;

         if cdsGrid.FieldByName('DetDBGRefer').asstring<>'' then
            lbRefer.Items.Add(cdsGrid.FieldByName('DetDBGRefer').AsString);

         if cdsGrid.FieldByName('DetDBGFix').asstring='S' then
            wCountFixedCol:=wCountFixedCol+1;

         wFieldTitle:=cdsGrid.FieldByName('DetDBGTitle').asstring;
         wFieldPos  :=cdsGrid.FieldByName('DetDBGPos').asInteger;
         wFieldPict :=cdsGrid.FieldByName('DetDBGPicture').asstring;
         wFieldWidth:=cdsGrid.FieldByName('DetDBGWidth').AsInteger;

         if Copy(wFieldTitle,1,2)='@@' then begin
            xCols := StrToInt( Copy(wFieldTitle,3,3) );
            xLin01:='1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
            xLin02:='         1         2         3         4         5         6         7         8         9        10        11        12        13        14        15        16';
            cds2.FieldByName(wFieldName).DisplayLabel:=Copy( xLin01,1,xCols)+'~'+Copy(xLin02,1,xCols);
         end
         else begin
            if Trim(wFieldTitle)<>'' then
               cds2.FieldByName(wFieldName).DisplayLabel:= wFieldTitle
         end;

         if wFieldPos>0 then
            cds2.FieldByName(wFieldName).Index       := wFieldPos
         else
            cds2.FieldByName(wFieldName).Index       := 99;

         if Trim(wFieldPict)<>'' then begin

            // vhn 20/06/2002
            if cdsGrid.FieldByName('TIPOCOMBO').AsString='D' then begin
               //(cds2.FieldByName(wFieldName) AS TDateTimeField).DisplayFormat:= wFieldPict;
            end
            else begin
               // VHN 20091029
               //(cds2.FieldByName(wFieldName) AS TFloatField).DisplayFormat:=wFieldPict;
               //(cds2.FieldByName(wFieldName) AS TFloatField).EditFormat   :='####0.000';
            end
            // fin
         end;
         if wFieldWidth>0 then
            cds2.FieldByName(wFieldName).DisplayWidth:= wFieldWidth;

      end
      else begin
         cds2.FieldByName(wFieldName).Visible:=False;
      end;
      cdsGrid.Next;
   end;

// vhn 05/12/2000
   if cds2.RecordCount>0 then
   begin
      For nv:=0 to wUserCheckB.Count-1 do
          dbgFiltro.SetControlType( wUserCheckB[ nv ],fctCheckBox,'S;N' );

      // vhn xx
      xSQLd:='Select * from PLAN04 '
            +'Where ARCHIVO='''+wTabla+''' and TIPOCOMBO=''X''';
      cdsBusca.Close;
      cdsBusca.Filter:='';
      cdsBusca.DataRequest( xSQLd );
      cdsBusca.Open;
      {
      FiltraTablaRemoto( cdsBusca, 'PLAN04', 'ARCHIVO', 'ARCHIVO='''+wTabla+''' and TIPOCOMBO=''X''' );
      }
      if ( cdsBusca.RecordCount=1 ) and ( wTabla2<>'' ) and
         ( wTabla2LLave<>'' ) and ( wTablaLLave<>'' ) then
      begin
         xCampoExpand:=cdsBusca.FieldByname('CAMPO').AsString;
         cds2.FieldByName(xCampoExpand).DisplayLabel:= '(+)~Detalle';
         cds2.FieldByName(xCampoExpand).Visible:=True;
         cds2.FieldByName(xCampoExpand).Index  :=0;
         dbgFiltro.SetControlType( xCampoExpand,fctCustom,'eb1' );
         dbgFiltro2.Visible:=True;
         dbgFiltro2.DataSource:=dsFiltro2;
         eb1.Grid:=dbgFiltro2;
      end
      else
      begin
         dbgFiltro2.Visible:=False;
      end;
      cdsBusca.Filter  :='';
      cdsBusca.Filtered:=False;
      cdsBusca.Close;
   end;

   dbgFiltro.FixedCols  := wCountFixedCol;

// vhn 05/12/2000
   if cds2.RecordCount>0 then
   begin
      For nv:=0 to wUserCheckB.Count-1 do
          dbgFiltro.SetControlType( wUserCheckB[ nv ],fctCheckBox,'S;N' );
   end;

// Para Activar la Vista Grabada
   if (wFlVista) and (cdsPlan.Active) then begin
      if (wFile<>'') and (cdsPlan.RecordCount>0) then begin
         if not FileExists(wFile) then
         begin
            dbgFiltro.IniAttributes.Enabled       := False;
            dbgFiltro.IniAttributes.SaveToRegistry:= False;
            dbgFiltro.IniAttributes.FileName      := wFile;

            if wSection='' then
               dbgFiltro.IniAttributes.SectionName:= dbgFiltro.Name
            else
               dbgFiltro.IniAttributes.SectionName:= wSection+cdsPlan.FieldByName('DESCRIPTION').AsString;

            dbgFiltro.SaveToIniFile;
         end
         else begin
            dbgFiltro.IniAttributes.Enabled       := False;
            dbgFiltro.IniAttributes.SaveToRegistry:= False;
            dbgFiltro.IniAttributes.FileName      := wFile;
            if wSection='' then
               dbgFiltro.IniAttributes.SectionName:= dbgFiltro.Name
            else
               dbgFiltro.IniAttributes.SectionName:= wSection+cdsPlan.FieldByName('DESCRIPTION').AsString;
            dbgFiltro.LoadFromIniFile;
         end;
      end;
   end;

{
// Campos Visible Nuevos
   cds2.Fields.Add  FieldDefs.Add( 'TMONABR', ftString, 15, True  );
   cds2.FieldDefs. AddFieldDef;
   cds2.Refresh;

}

// Campos No Visible por Componente
   For nv:=0 to wNoVisible.Count-1 do begin
       if Pos('.', wNoVisible[ nv ] )=0 then
          xxxCampo:=wNoVisible[ nv ]
       else
          xxxCampo:=Copy( wNoVisible[ nv ], Pos('.', wNoVisible[ nv ] )+1, Length( wNoVisible[ nv ] )-2 );

       cds2.FieldByName( xxxCampo ).Visible:=False;
   end;
   cds2.EnableControls;


// Para Poner Checks en Campos que estan Visibles
   For nv:=0 to lbCamposReal.Items.Count-1 do begin

//       if Copy(lbCamposReal.Items.Strings[ nv ],3,1)<>'.' then
       if Pos('.',lbCamposReal.Items.Strings[ nv ])=0 then
          xxxCampo:=lbCamposReal.Items.Strings[ nv ]
       else
          xxxCampo:=Copy(lbCamposReal.Items.Strings[ nv ], Pos('.',lbCamposReal.Items.Strings[ nv ])+1, Length(lbCamposReal.Items.Strings[ nv ])-2 );
//          xxxCampo:=Copy(lbCamposReal.Items.Strings[ nv ],3,Length(lbCamposReal.Items.Strings[ nv ])-2 );

       if not cds2.FieldByName( xxxCampo ).Visible then
          lbCampos.Checked[ nv ]:=False
       else
          lbCampos.Checked[ nv ]:=True;
   end;

end;


Procedure TSolMantenimiento.MuestraGrid2;
var
   wFieldName, wFieldTitle, wFieldPict, xxxCampo, xCampoExpand  : String;
   wFieldPos, wCountFixedCol, wFieldWidth, nv, xCols     : Integer;
   xLin01, xLin02 : String;
begin
   wCountFixedCol:=0;
   cdsFiltro2.DisableControls;

   for nv:=0 to cdsFiltro2.FieldCount-1 do
   begin
       cdsFiltro2.FieldList.Fields[ nv ].Visible:=False;
   end;


   cdsGrid2.First;
   while Not cdsGrid2.Eof do begin

      if Pos('.',cdsGrid2.FieldByName('Campo').AsString)=0 then
         wFieldName:=cdsGrid2.FieldByName('Campo').AsString
      else
         wFieldName:=Copy(cdsGrid2.FieldByName('Campo').AsString, Pos('.',cdsGrid2.FieldByName('Campo').AsString)+1, Length(cdsGrid2.FieldByName('Campo').AsString)-1);

      if cdsGrid2.FieldByName('Flag').AsString<>'S' then
      begin
         cdsFiltro2.FieldByName(wFieldName).Visible:=True;
         {
         if cdsGrid2.FieldByName('DetDBGRefer').asstring<>'' then
            lbRefer.Items.Add(cdsGrid2.FieldByName('DetDBGRefer').AsString);
         }
         if cdsGrid2.FieldByName('DetDBGFix').asstring='S' then
            wCountFixedCol:=wCountFixedCol+1;

         wFieldTitle:=cdsGrid2.FieldByName('DetDBGTitle').asstring;
         wFieldPos  :=cdsGrid2.FieldByName('DetDBGPos').asInteger;
         wFieldPict :=cdsGrid2.FieldByName('DetDBGPicture').asstring;
         wFieldWidth:=cdsGrid2.FieldByName('DetDBGWidth').AsInteger;

         if Copy(wFieldTitle,1,2)='@@' then begin
            xCols := StrToInt( Copy(wFieldTitle,3,3) );
            xLin01:='1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890';
            xLin02:='         1         2         3         4         5         6         7         8         9        10        11        12        13        14        15        16';
            cdsFiltro2.FieldByName(wFieldName).DisplayLabel:=Copy( xLin01,1,xCols)+'~'+Copy(xLin02,1,xCols);
         end
         else begin
            if Trim(wFieldTitle)<>'' then
               cdsFiltro2.FieldByName(wFieldName).DisplayLabel:= wFieldTitle
         end;

         if wFieldPos<>0 then
            cdsFiltro2.FieldByName(wFieldName).Index       := wFieldPos;

         if Trim(wFieldPict)<>'' then begin

            // vhn 20/06/2002
            if cdsGrid2.FieldByName('TIPOCOMBO').AsString='D' then begin
               (cdsFiltro2.FieldByName(wFieldName) AS TDateTimeField).DisplayFormat:= wFieldPict;
               //(cdsFiltro2.FieldByName(wFieldName) AS TDateTimeField).EditFormat   := wFieldPict;
            end
            else begin
               (cdsFiltro2.FieldByName(wFieldName) AS TFloatField).DisplayFormat:= wFieldPict;
               (cdsFiltro2.FieldByName(wFieldName) AS TFloatField).EditFormat   := '####0.000';
            end
            // fin
         end;
         if wFieldWidth>0 then
            cdsFiltro2.FieldByName(wFieldName).DisplayWidth:= wFieldWidth;

      end
      else begin
         cdsFiltro2.FieldByName(wFieldName).Visible:=False;
      end;
      cdsGrid2.Next;
   end;
   dbgFiltro2.FixedCols  := wCountFixedCol;
   cdsFiltro2.EnableControls;

   Exit;

// vhn 05/12/2000
   if cdsFiltro2.RecordCount>0 then
   begin
      For nv:=0 to wUserCheckB.Count-1 do
          dbgFiltro2.SetControlType( wUserCheckB[ nv ],fctCheckBox,'S;N' );
      {
      // vhn xx
      FiltraTablaRemoto( cdsBusca, 'PLAN04', 'ARCHIVO', 'ARCHIVO='''+wTabla+''' and TIPOCOMBO=''X''' );
      if cdsBusca.RecordCount=1 then
      begin
         xCampoExpand:=cdsBusca.FieldByname('CAMPO').AsString;
         dbgFiltro.SetControlType( xCampoExpand,fctCustom,'eb1' );
         cdsFiltro2.FieldByName(xCampoExpand).Visible:=True;
         cdsFiltro2.FieldByName(xCampoExpand).Index  :=0;
         dbgFiltro2.DataSource:=dsFiltro2;
         eb1.Grid:=dbgFiltro2;
      end;
      cdsBusca.Filter  :='';
      cdsBusca.Filtered:=False;
      cdsBusca.Close;
      }
   end;
   {
// Para Activar la Vista Grabada
   if (wFlVista) and (cdsPlan.Active) then begin
      if (wFile<>'') and (cdsPlan.RecordCount>0) then begin
         if not FileExists(wFile) then
         begin
            dbgFiltro.IniAttributes.Enabled       := False;
            dbgFiltro.IniAttributes.SaveToRegistry:= False;
            dbgFiltro.IniAttributes.FileName      := wFile;

            if wSection='' then
               dbgFiltro.IniAttributes.SectionName:= dbgFiltro.Name
            else
               dbgFiltro.IniAttributes.SectionName:= wSection+cdsPlan.FieldByName('DESCRIPTION').AsString;

            dbgFiltro.SaveToIniFile;
         end
         else begin
            dbgFiltro.IniAttributes.Enabled       := False;
            dbgFiltro.IniAttributes.SaveToRegistry:= False;
            dbgFiltro.IniAttributes.FileName      := wFile;
            if wSection='' then
               dbgFiltro.IniAttributes.SectionName:= dbgFiltro.Name
            else
               dbgFiltro.IniAttributes.SectionName:= wSection+cdsPlan.FieldByName('DESCRIPTION').AsString;
            dbgFiltro.LoadFromIniFile;
         end;
      end;
   end;
   }
  {
// Para Poner Checks en Campos que estan Visibles
   For nv:=0 to lbCamposReal.Items.Count-1 do begin

//       if Copy(lbCamposReal.Items.Strings[ nv ],3,1)<>'.' then
       if Pos('.',lbCamposReal.Items.Strings[ nv ])=0 then
          xxxCampo:=lbCamposReal.Items.Strings[ nv ]
       else
          xxxCampo:=Copy(lbCamposReal.Items.Strings[ nv ], Pos('.',lbCamposReal.Items.Strings[ nv ])+1, Length(lbCamposReal.Items.Strings[ nv ])-2 );
//          xxxCampo:=Copy(lbCamposReal.Items.Strings[ nv ],3,Length(lbCamposReal.Items.Strings[ nv ])-2 );

       if not cdsFiltro2.FieldByName( xxxCampo ).Visible then
          lbCampos.Checked[ nv ]:=False
       else
          lbCampos.Checked[ nv ]:=True;
   end;
   }
end;


procedure TSolMantenimiento.bbtnGruposClick(Sender: TObject);
Var
   xGrupos : Integer;
begin
   xGrupos := seGrupo.Value;
   if (xGrupos>0) and (xGrupos<=5) then begin
      wGrupoCols := xGrupos;
      MuestraGrupos;
   end
   else begin
      if xGrupos=0 then
      begin
         EliminaGrupos;
         dbgFiltro.RefreshDisplay;
      end
      else begin
         ShowMessage('Rango de Grupos: Desde 1 hasta 5');
      end;
   end;
end;


procedure TSolMantenimiento.MuestraGrupos;
var
   xCReal, xIndex: String;
   ca : Integer;
begin
// Campos Agregados
   TRY
   // vhnxx 12/11/2003
   if cds2.RecordCount<=0 then Exit;

   wGrupoCols:=seGrupo.Value;
   if wGrupoCols>0 then begin

      EliminaGrupos;
       //
      // añadido para probar UsuarioSQL
      cds2.Filtered:=False;
      cds2.Filter:='';
      cds2.Filtered:=True;
      // end UsuarioSQL

      For ca:=1 to wGrupoCols do begin
          //xCReal:=lbCamposReal.Items.Strings[ca-1];
          xCReal:=dbgFiltro.Columns[ca-1].FieldName;
          if ca=1 then
             xIndex:=xCReal
          else
             xIndex:=xIndex+';'+xCReal;
      end;
      if cds2.IndexName='XXX' then
         cds2.DeleteIndex( 'XXX' );
      cds2.AddIndex( 'XXX', xIndex, [ixCaseInsensitive],'','', wGrupoCols );
      cds2.IndexName:='XXX';

      For ca:=1 to wGrupoCols do begin
          //xCReal:=lbCamposReal.Items.Strings[ca-1];
          xCReal:=dbgFiltro.Columns[ca-1].FieldName;
          cds2.Aggregates.Add;
          cds2.Aggregates[ ca-1 ].AggregateName:=xCReal;
          cds2.Aggregates[ ca-1 ].GroupingLevel:=ca;
          cds2.Aggregates[ ca-1 ].IndexName    :='XXX';
          if ca=1 then cds2.FieldByName( xCReal ).OnGetText:=cds2GetText1;
          if ca=2 then cds2.FieldByName( xCReal ).OnGetText:=cds2GetText2;
          if ca=3 then cds2.FieldByName( xCReal ).OnGetText:=cds2GetText3;
          if ca=4 then cds2.FieldByName( xCReal ).OnGetText:=cds2GetText4;
          if ca=5 then cds2.FieldByName( xCReal ).OnGetText:=cds2GetText5;
          cds2.Aggregates[ ca-1 ].Active := True;
      end;
      cds2.AggregatesActive:=True;

      cds2.Filtered:=True;

      cds2.First;
   end;
   EXCEPT
   END;
end;

procedure TSolMantenimiento.EliminaGrupos;
var
   ca : Integer;
begin
   if cds2.Aggregates.Count>0 then begin
      For ca:=1 to cds2.Aggregates.Count do begin
          if Length(cds2.Aggregates[0].AggregateName)>0 then
             cds2.FieldByName(cds2.Aggregates[0].AggregateName).OnGetText:=nil;
          cds2.Aggregates[0].Active:= False;
          cds2.Aggregates.Delete(0);
      end;
   end;
   cds2.AggregatesActive:=False;
end;

procedure TSolMantenimiento.cds2GetText1( Sender: TField;
  var Text: String; DisplayText: Boolean );
begin
   if gbFirst in cds2.GetGroupState (1) then
      Text := Sender.AsString
   else
      Text := '';
end;

procedure TSolMantenimiento.cds2GetText2( Sender: TField;
  var Text: String; DisplayText: Boolean );
begin
   if gbFirst in cds2.GetGroupState (2) then
      Text := Sender.AsString
   else
      Text := '';
end;

procedure TSolMantenimiento.cds2GetText3( Sender: TField;
  var Text: String; DisplayText: Boolean );
begin
   if gbFirst in cds2.GetGroupState (3) then
      Text := Sender.AsString
   else
      Text := '';
end;

procedure TSolMantenimiento.cds2GetText4( Sender: TField;
  var Text: String; DisplayText: Boolean );
begin
   if gbFirst in cds2.GetGroupState (4) then
      Text := Sender.AsString
   else
      Text := '';
end;

procedure TSolMantenimiento.cds2GetText5( Sender: TField;
  var Text: String; DisplayText: Boolean );
begin
   if gbFirst in cds2.GetGroupState (5) then
      Text := Sender.AsString
   else
      Text := '';
end;

procedure TSolMantenimiento.bbtnCancelFClick(Sender: TObject);
begin

   if xIniOr>0 then begin
      lbFiltroReal.Items.Strings[ lbFiltro.Items.Count-1 ]:=lbFiltroReal.Items.Strings[ lbFiltro.Items.Count-1 ]+' )';
      lbFiltro.Items.Strings[ lbFiltro.Items.Count-1 ]:=lbFiltro.Items.Strings[lbFiltro.Items.Count-1]+' )';
   end;

   pnlFiltro2.Visible:=False;
   EliminaCampos( xNComp );

   dbgFiltro.Enabled  := True;
   pnlFiltro.Enabled  := True;
   pnlPie.Enabled     := True;
   pnlBtns.Enabled    := True;
   bbtnAcceso.Enabled := True;
   bbtnRef.Enabled    := True;
end;

procedure TSolMantenimiento.bbtnBasuraDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TSolMantenimiento.sbOrdenaClick(Sender: TObject);
begin
   wFlVista:=True;
   FiltraData( 'REFRESH' );
end;

procedure TSolMantenimiento.lbOrdenDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TSolMantenimiento.sbBorraFClick(Sender: TObject);
begin
   lbFiltro.Items.Clear;
   lbFiltroReal.Items.Clear;
end;

procedure TSolMantenimiento.sbBorraOClick(Sender: TObject);
begin
   lbOrden.Items.Clear;
   lbOrdenReal.Items.Clear;
end;

procedure TSolMantenimiento.dbgTablesCellChanged(Sender: TObject);
begin
   if pnlFiltro.Visible then begin
     if cdsGrid.Active then Z2bbtnFiltroClick(Sender);
   end;
   if pnlReporte.Visible then begin
     if cdsGrid.Active then Z2bbtnImprimeClick(Sender);
   end;
end;

procedure TSolMantenimiento.FormCreate(Sender: TObject);
begin
   pnlInfor.Visible := False;
end;

procedure TSolMantenimiento.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if key=#13 then begin
      key:=#0;
      perform(CM_DialogKey,VK_TAB,0);
   end;
end;



procedure TSolMantenimiento.clbCamposMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Screen.Cursor:=crDrag;
   xElemento := clbCampos.Items.Strings[ clbCampos.ItemIndex ];
   xElemento2:= clbCampos2.Items.Strings[ clbCampos.ItemIndex ];
   xElemento3:= clbCamposP.Items.Strings[ clbCampos.ItemIndex ];
   xElemento4:= clbCamposA.Items.Strings[ clbCampos.ItemIndex ];
   xElemReal := clbCamposReal.Items.Strings[ clbCampos.ItemIndex ];
   xPosEleme := clbCampos.ItemIndex
end;

procedure TSolMantenimiento.clbCamposDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept:=True;
end;

procedure TSolMantenimiento.bbtnOkRClick(Sender: TObject);
var
   xcol, x , xTAncho, xDistancia : integer;
   xSQLSum : String;
begin
   xCol := 2;
   xDistancia:=0;
   for x:=0 to clbCampos.Items.Count - 1 do begin
       If clbCampos.Checked[x] then begin

          xDistancia:=(CDS2.FieldByName( clbCamposReal.Items.Strings[x] ).Size * 2 );

          If clbCamposA.Items.Strings[x]='R' then
             xDistancia := 20
          else begin
             If xDistancia=0 then
                xDistancia:= 15
             else begin
                If xDistancia<15 then xDistancia:=15;
                If (xDistancia>60) and (xDistancia<=80) then xDistancia:=60;
                If (xDistancia>80) and (xDistancia<=100) then xDistancia:=80;
                If (xDistancia>100) and (xDistancia<=120) then xDistancia:=100;
             end;
          end;

          xTAncho    := xDistancia;
          xDistancia := xDistancia + 2;

          CreaLabel( clbCampos2.Items.Strings[x],  16, xCol, x, xTAncho );
          CreaText( clbCamposReal.Items.Strings[x],clbCamposP.Items.Strings[x],clbCamposA.Items.Strings[x] ,02, xCol, x, xTAncho);

          xCol := xCol + xDistancia;
       end;
   end;


   lblCia.Caption    := edtCiaRepdes.Text;

   cds2.DisableControls;
   if rgOrienta.ItemIndex=0 then begin
      pprMant.PrinterSetup.Orientation:=poPortrait
   end
   else begin
      pprMant.PrinterSetup.Orientation:=poLandscape;
   end;

   lblTitulo.Caption:= edtTitulo.Text;
   lblTitulo.Left   := ((pprMant.PrinterSetup.PaperWidth-lblTitulo.Width)/2)-1;

   ppsvPagina.Left:= pprMant.PrinterSetup.PaperWidth-35;
   ppsvFecha.Left := pprMant.PrinterSetup.PaperWidth-35;
   ppsvHora.Left  := pprMant.PrinterSetup.PaperWidth-35;

   ppLine1.Width := pprMant.PrinterSetup.PaperWidth-10;
   ppLine2.Width := pprMant.PrinterSetup.PaperWidth-10;
   ppLine3.Width := pprMant.PrinterSetup.PaperWidth-10;

   if wTabla='' then
      xSQLSum:='Select Count(*) as NUMREG from '+cds1.FieldByName('zArchivo').AsString+' '+ xxWhereT
   else begin
      xSQLSum:='Select Count(*) as NUMREG from '+wTabla +' '+ xxWhereT;
   end;

   cdsUsuSi.Close;
   cdsUsuSi.ProviderName:='dspTem6';
   cdsUsuSi.DataRequest( xSQLSum );
   cdsUsuSi.Open;

   pplReg.Caption:= formatfloat('###,###,###',cdsUsuSi.FieldByName('NUMREG').AsInteger);

   cds2.Last;
   cds2.First;

   ppdbMant.DataSource:=ds2;

   pprMant.Print;
   pprMant.Stop;

   pprMant.Reset;

   for x:=0 to clbCampos.Items.Count - 1 do begin
       If clbCampos.Checked[x] then begin
          wPrnLbl[ x ].Free;
          wPrnLbl2[ x ].Free;
          wPrnTxt[ x ].Free;
       end;
   end;
   ppdbMant.DataSource:=nil;
   cds2.EnableControls;
end;


procedure TSolMantenimiento.CreaLabel(xField:String; xTop,xLeft,xLN,xAnchoT:Integer);
var
   xField1, xField2 : String;
//   xAncho : Double;
   xLeftR : Integer;
begin
   xField2 :='';
   If Pos('~', xField ) = 0 then
      xField1 := xField
   else begin
      xField1 := Copy(xField,1, Pos('~', xField )-1 );
      xField2 := Copy(xField,Pos('~', xField )+1, Length(xField) );
   end;
   If (xAnchoT>15) and (xAnchoT<=20) then xLeft := xLeft-1;
   If (xAnchoT>20) and (xAnchoT<=25) then xAnchoT:=xAnchoT-4;
   If (xAnchoT>25) and (xAnchoT<=30) then xAnchoT:=xAnchoT-8;
   If (xAnchoT>30) and (xAnchoT<=40) then xAnchoT:=xAnchoT-12;
   If (xAnchoT>40) and (xAnchoT<=50) then xAnchoT:=xAnchoT-16;
   If (xAnchoT>50) and (xAnchoT<=60) then xAnchoT:=xAnchoT-26;
   If (xAnchoT>60)                   then xAnchoT:=xAnchoT-36;

   xLeftR := 0;
   If clbCamposA.Items.Strings[ xLN ]='R' then
      xLeftR := 5;

   wPrnLbl[ xLN ]          := TppLabel.Create( Self );
   wPrnLbl[ xLN ].Band     := TppHeaderBand( Self.Cabecera );
   wPrnLbl[ xLN ].AutoSize := False;
   wPrnLbl[ xLN ].Width    := xAnchoT;
   wPrnLbl[ xLN ].Top      := xTop;
   wPrnLbl[ xLN ].Left     := xLeft + xLeftR;
   wPrnLbl[ xLN ].Caption  := xField1;
   wPrnLbl[ xLN ].Alignment:= taCenter;

   wPrnLbl2[ xLN ]          := TppLabel.Create( Self );
   wPrnLbl2[ xLN ].Band     := TppHeaderBand( Self.Cabecera );
   wPrnLbl2[ xLN ].AutoSize := False;
   wPrnLbl2[ xLN ].Width    := xAnchoT;
   wPrnLbl2[ xLN ].Top      := xTop+4;
   wPrnLbl2[ xLN ].Left     := xLeft + xLeftR;
   wPrnLbl2[ xLN ].Caption  := xField2;
   wPrnLbl2[ xLN ].Alignment:= taCenter;
end;

procedure TSolMantenimiento.CreaText( xField, xDFormat, xAlinea:String; xTop,xLeft,xLN,xAnchoT:Integer);
var
   xLeftR, xLeftT : Integer;
begin
   xLeftR :=0;
   xLeftT :=0;
   if (CDS2.FieldByName( clbCamposReal.Items.Strings[ xLN ] ).Size * 2 )>0 then
      xLeftT := (CDS2.FieldByName( clbCamposReal.Items.Strings[ xLN] ).Size * 2 );

   If xAnchoT=15 then begin
      if (xAnchoT=15) and (xLeftT=14) then xLeftR:=1;
      if (xAnchoT=15) and (xLeftT=12) then xLeftR:=2;
      if (xAnchoT=15) and (xLeftT=10) then xLeftR:=4;
      if (xAnchoT=15) and (xLeftT=08) then xLeftR:=5;
      if (xAnchoT=15) and (xLeftT=06) then xLeftR:=5;
      if (xAnchoT=15) and (xLeftT=04) then xLeftR:=6;
      if (xAnchoT=15) and (xLeftT=02) then xLeftR:=6;
      end
   else begin
      if ( (xAnchoT-xLeftT)>4 ) and ( xLeftT>0 ) then
         xLeftR := Trunc( (xAnchoT-xLeftT)/2 ) - 2;
   end;

   wPrnTxt[ xLN ]              := TppDBText.Create( Self );
   wPrnTxt[ xLN ].Band         := TppDetailBand( Self.Detalle );
   wPrnTxt[ xLN ].Top          := xTop;
   wPrnTxt[ xLN ].Left         := xLeft + xLeftR;
   wPrnTxt[ xLN ].AutoSize     := False;
   wPrnTxt[ xLN ].Width        := xAnchoT;
   wPrnTxt[ xLN ].DataPipeline := ppdbmant;
   wPrnTxt[ xLN ].DataField    := xField;
   wPrnTxt[ xLN ].Font.Size    := 8;
   wPrnTxt[ xLN ].Font.Name    := 'MS Sans Serif';
   wPrnTxt[ xLN ].DisplayFormat:= xDFormat;
   wPrnTxt[ xLN ].SuppressRepeatedValues:= cbSuprime.Checked;
   If xAlinea='R' then
      wPrnTxt[ xLN ].Alignment := taRightJustify;
end;


procedure TSolMantenimiento.FormPaint(Sender: TObject);
begin
  If pnlFiltro.Visible then begin
      pnlReporte.Top := pnlFiltro.Top - pnlReporte.Height - 2;
      end
   else begin
      pnlReporte.Top := pnlPie.Top - pnlReporte.Height - 2;
   end;

   pnlReporte.Left:= pnlColumna.Left + pnlColumna.Width + (Trunc(dbgFiltro.Width/2)-Trunc(pnlReporte.Width/2));
   pnlReporte.Visible:=xVisPanel;
end;

procedure TSolMantenimiento.pprMantPreviewFormCreate(Sender: TObject);
begin
   pprMant.PreviewForm.ClientHeight := 500;
   pprMant.PreviewForm.ClientWidth  := 650;
   TppViewer(pprMant.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;

procedure TSolMantenimiento.pprMantxPreviewFormCreate(Sender: TObject);
begin
   xReport.PreviewForm.ClientHeight := 540;
   xReport.PreviewForm.ClientWidth  := 580;
   TppViewer(xReport.PreviewForm.Viewer).ZoomSetting := zsPagewidth;
end;


procedure TSolMantenimiento.clbCamposMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  xCheck    : Boolean;
  xPosNueva : Integer;
begin
   If xPosEleme <> clbCampos.ItemIndex then begin
      xCheck := clbCampos.Checked[ xPosEleme ];
      clbCampos.Items.Delete( xPosEleme );
      clbCampos2.Items.Delete( xPosEleme );
      clbCamposP.Items.Delete( xPosEleme );
      clbCamposA.Items.Delete( xPosEleme );
      xPosNueva := clbCampos.ItemIndex;
      clbCampos.Items.Insert( xPosNueva,  xElemento  );
      clbCampos2.Items.Insert( xPosNueva, xElemento2 );
      clbCamposP.Items.Insert( xPosNueva, xElemento3 );
      clbCamposA.Items.Insert( xPosNueva, xElemento4 );
      clbCampos.Checked[ xPosNueva ] := xcheck;
      clbCamposReal.Items.Delete( xPosEleme );
      clbCamposReal.Items.Insert( xPosNueva, xElemReal );
   end;
   Screen.Cursor:= Crdefault
end;


procedure TSolMantenimiento.bbtnOKFiltClick(Sender: TObject);
var
  mTabla: String;
  bmk   : TBookmark;
begin
   mTabla := cdsPlan.FieldByName('TABLA').AsString;

   if trim(wTabla)<>trim(mTabla) then
   begin
      Application.MessageBox ('Debe seleccionar la tabla que corresponda a informe',
                               PChar(Caption),MB_OK+MB_ICONINFORMATION);
      Exit;
   end;

   dbeNameFilt.Text:= cdsPlan.FieldByName('DESCRIPTION').AsString;

   CampoToListBox( lbFiltro,     'LISTFIELDL' );
   CampoToListBox( lbFiltroReal, 'LISTFIELDF');
   CampoToListBox( lbOrden,      'LISTORDERL');
   CampoToListBox( lbOrdenReal,  'LISTORDERF');

   wFlVista:=True;
   FiltraData( 'REFRESH' );

   dbgFiltro.Enabled  := True;
   pnlFiltro.Enabled  := True;
   pnlPie.Enabled     := True;
   pnlBtns.Enabled    := True;
   dbgTables.Enabled  := True;

   bmk:=cdsPlan.GetBookmark;

   cdsPlan.DisableControls;
   cdsPlan.First;
   while not cdsPlan.Eof do begin
      cdsPlan.Edit;
      cdsPlan.FieldByName('ULTIMO').Clear;
      cdsPlan.FieldByName('ULTIMO').AsString:='N';
      //cdsPlan.Post;
      cdsPlan.Next;
   end;
   cdsPlan.GotoBookmark(bmk);
   cdsPlan.FreeBookmark(bmk);

   cdsPlan.Edit;
   cdsPlan.FieldByName('ULTIMO').AsString:= 'U';
   cdsPlan.FieldByName('FECREG').Value   := Date;
   cdsPlan.FieldByName('HORREG').Value   := Time;

   AplicaDatos( cdsPlan, 'PLAN20' );

   cdsPlan.EnableControls;

   pnlInfor.Visible := False;
end;

procedure TSolMantenimiento.bbtnCancFiltClick(Sender: TObject);
begin
  dbgFiltro.Enabled := True;
  pnlFiltro.Enabled := True;
  pnlPie.Enabled    := True;
  pnlBtns.Enabled   := True;
  dbgTables.Enabled := True;

  pnlInfor.Visible := False;
end;

procedure TSolMantenimiento.bbtnSaveFilClick(Sender: TObject);
var
   bmk     : TBookMark;
   xxFlNew : Boolean;
begin
   bmk:=cdsPlan.GetBookmark;

   xxFlNew:=True;
   if cdsPlan.Locate('TABLA;USUARIO;DESCRIPTION;TITULO',VarArrayOf([wTabla,wUser,dbeNameFilt.Text,wTitulo]),[]) then
   begin
      if MessageDlg(' Vista Existe ¿ Desea Regrabar ? ' ,mtConfirmation, [mbYes, mbNo], 0)=mrNo then begin
         cdsPlan.GotoBookmark(bmk);
         cdsPlan.FreeBookmark(bmk);
         Exit;
      end;
      xxFlNew:=False;
   end;

   cdsPlan.DisableControls;

   cdsPlan.First;
   while not cdsPlan.Eof do begin
      cdsPlan.Edit;
      cdsPlan.FieldByName('ULTIMO').Clear;
      cdsPlan.FieldByName('ULTIMO').AsString:='N';
      //cdsPlan.Post;
      cdsPlan.Next;
   end;

   AplicaDatos( cdsPlan, 'Plan20' );

   cdsPlan.GotoBookmark(bmk);
   cdsPlan.FreeBookmark(bmk);

   if xxFlNew then begin
      cdsPlan.Insert;
      cdsPlan.FieldByName('TITULO').AsString := wTitulo;
      cdsPlan.FieldByName('TABLA').AsString  := wTabla;
      cdsPlan.FieldByName('USUARIO').AsString:= wUser;
   end;

   cdsPlan.Edit;
   cdsPlan.FieldByName('ULTIMO').AsString := 'U';
   cdsPlan.FieldByName('DESCRIPTION').AsString := dbeNameFilt.Text;

   ListBoxToCampo( lbFiltro,     'LISTFIELDL' );
   ListBoxToCampo( lbFiltroReal, 'LISTFIELDF');
   ListBoxToCampo( lbOrden,      'LISTORDERL');
   ListBoxToCampo( lbOrdenReal,  'LISTORDERF');
   //cdsPlan.FieldByName('SQLUSER').Value      := SQL+'{}';
   cdsPlan.FieldByName('GRUPOS').AsInteger   := seGrupo.Value;

   cdsPlan.FieldByName('FECREG').Value    := Date;
   cdsPlan.FieldByName('HORREG').Value    := Time;

   AplicaDatos( cdsPlan, 'PLAN20' );

   if (wFile<>'') then begin
      dbgFiltro.IniAttributes.Enabled        := True;
      dbgFiltro.IniAttributes.SaveToRegistry := False;
      dbgFiltro.IniAttributes.FileName       := wFile;
      if wSection='' then
         dbgFiltro.IniAttributes.SectionName := dbgFiltro.Name
      else
         dbgFiltro.IniAttributes.SectionName := wSection+dbeNameFilt.Text;

      dbgFiltro.SaveToIniFile;
   end;

   cdsPlan.EnableControls;

   ShowMessage(' Vista Grabada ');
end;

procedure TSolMantenimiento.ListBoxToCampo( xLBox:TListBox; xNCampoT:String );
var
   h    : Integer;
   xVAR : String;
begin
   xVAR :='';
   for h:=0 to xLBox.Items.Count-1 do begin
       xVAR := xVAR + xLBox.Items.Strings[h]+'{}' ;
   end;

   cdsPlan.FieldByName( xNCampoT ).Value:=xVAR;

   if cdsPlan.FieldByName( xNCampoT ).AsString='' then
      cdsPlan.FieldByName( xNCampoT ).AsString:='*';
end;


procedure TSolMantenimiento.CampoToListBox( xLBox:TListBox; xNCampoT:String );
var
   xVAR : String;
   xCAM : String;
begin
   xLBox.Items.Clear;

   if cdsPlan.FieldByName( xNCampoT ).AsString='*' then Exit;

   xVAR:=cdsPlan.FieldByName( xNCampoT ).AsString;

   while AnsiPos( '{}', xVAR )>0 do begin
       xCAM:=Copy( xVAR, 1, AnsiPos( '{}', xVAR )-1 );
       xVAR:=Copy( xVAR, AnsiPos( '{}', xVAR )+2, Length( xVAR ) );
       xLBox.Items.Add( xCAM );
   end;
end;


procedure TSolMantenimiento.bbtnFiltClick(Sender: TObject);
begin
   pnlInfor.Visible := not pnlInfor.Visible ;
   pnlInfor.Top := pnlFiltro.Top - pnlInfor.Height;

   pnlInfor.Left  :=pnlColumna.Left+pnlColumna.Width+(Trunc(dbgFiltro.Width/2)-Trunc(pnlInfor.Width/2));

   if pnlInfor.Visible then
   begin
      cdsPlan.Filtered:= False;
      cdsPlan.Filter  := '';
      cdsPlan.Filter  := 'USUARIO='''+wUser+''' AND TABLA='''+wTabla+''' AND TITULO='''+wTitulo+'''';
      cdsPlan.Filtered:= True;
      dbeNameFilt.Text := 'Nuevo Informe';

      if cdsPlan.Locate('TABLA;USUARIO;ULTIMO;TITULO',VarArrayOf([wTabla,wUser,'U',wTitulo]),[]) then
         if not cdsPlan.Found then
           if cdsPlan.eof then
              cdsPlan.Prior;

      dbgFiltro.Enabled:= False;
      pnlFiltro.Enabled:= False;
      pnlPie.Enabled   := False;
      pnlBtns.Enabled  := False;
      dbgTables.Enabled:= False;
   end;
end;

procedure TSolMantenimiento.bbtnCerrarFClick(Sender: TObject);
begin
   Z2bbtnFiltroClick( Self );
end;

procedure TSolMantenimiento.bbtnCerrarIClick(Sender: TObject);
begin
   Z2bbtnImprimeClick( Self );

   dblcCiaRep.LookupField:='';
   dblcCiaRep.LookupTable:=nil;
end;

procedure TSolMantenimiento.AplicaDatos( wCDS:TClientDataSet; wNomArch:String );
var
   Delta, Results, OwnerData: OleVariant;
   ErrorCount :Integer;
begin
   if ( wCDS.Modified ) or ( wCDS.ChangeCount>0 ) then begin

      if VarIsEmpty( wcds.Delta ) then Exit;

      if (SRV_D = 'DB2NT') then
         DComT.AppServer.ParamDSPGraba( '1', wNomArch );

      wCDS.CheckBrowseMode;
      Results:=DComT.Appserver.AS_ApplyUpdates( wCDS.ProviderName,wcds.Delta,-1,ErrorCount,OwnerData);
      cdsResultSet.Data:=Results;
      wCDS.Reconcile(Results);

      {
      wCDS.CheckBrowseMode;
      Results:=DComT.Appserver.AS_ApplyUpdates( wCDS.ProviderName,wCDS.Delta,-1,ErrorCount,OwnerData);
      if Errorcount=0 then begin
         wCDS.Reconcile(Results);
         Beep;
         end
      else begin
         showmessage( 'Registro No Grabado '+Inttostr(Errorcount) );
      end;
      }
      if (SRV_D = 'DB2NT') then
         DComT.AppServer.ParamDSPGraba( '0', wNomArch );
   end;
end;



procedure TSolMantenimiento.sbFiltraClick(Sender: TObject);
begin
   wFlVista:=True;

   // VHN REMOTO REVISAR
   if wPacketData=0 then
      wPacketData:=30;

   FiltraData( 'REFRESH' );
end;

procedure TSolMantenimiento.dbgFiltrosDblClick(Sender: TObject);
var
 bmk : TBookMark;
begin
  bmk:=cdsPlan.GetBookmark;

  cdsPlan.DisableControls;

  cdsPlan.First;
  while not cdsPlan.Eof do begin
     cdsPlan.Edit;
     cdsPlan.FieldByName('ULTIMO').Clear;
     cdsPlan.FieldByName('ULTIMO').AsString := 'N';
     cdsPlan.Post;
     cdsPlan.Next;
  end;

  cdsPlan.GotoBookmark(bmk);
  cdsPlan.FreeBookmark(bmk);

  cdsPlan.Edit;
  cdsPlan.FieldByName('ULTIMO').AsString := 'U';
  cdsPlan.Post;
  AplicaDatos( cdsPlan, 'Plan20' );
  cdsPlan.EnableControls;

end;

procedure TSolMantenimiento.dbgFiltrosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
   xRegTxt   : TStringList;
   xFlBorra  : Boolean;
   cl, xLinIni, xLInFin : Integer;
begin
  if (key=VK_Delete) and (ssCtrl in Shift) then begin
     if MessageDlg( ' ¿ Eliminar Registro ? ' ,mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin

        xRegTxt:=TStringList.Create;
        xRegTxt.LoadFromFile(dbgFiltro.IniAttributes.FileName);

        xFlBorra:=False;

        xLinIni:=-1;
        xLinFin:=-1;

        for cl:=0 to xRegTxt.Count-1 do begin
            if (xFlBorra) and (Copy(xRegTxT.Strings[cl],1,1)='[') then begin
               xLinFin := cl-1;
               Break;
            end;
            if xRegTxT.Strings[cl]='['+wSection+cdsPlan.FieldByName('DESCRIPTION').AsString+']' then begin
               xLinIni := cl;
               xFlBorra:=True;
            end;
        end;

        if xFlBorra then begin

           if xLinFin=-1 then
              xLinFin:=xRegTxt.Count-1;

           xRegTxt.BeginUpdate;

           for cl:=xLinFin Downto xLinIni do
               xRegTxT.Delete(cl);

           xRegTxt.EndUpdate;
           xRegTxt.SaveToFile(dbgFiltro.IniAttributes.FileName);

        end;

        cdsPlan.Delete;
        AplicaDatos( cdsPlan, 'Plan20' );
     end;

  end;
end;

procedure TSolMantenimiento.bbtnDateClick(Sender: TObject);
Var
   wVarFiltro : String;
   wVarFiltroD: String;
   wVariable1 : String;
   wVariable2 : String;
   wRelacion1 : String;
   cDias      : String;
   wTablaxx   : String;
begin

   if trim(wTabla)='' then
      wTablaxx:=cds1.FieldByName('zArchivo').AsString+'.'
   else begin
      wTablaxx:=wTabla+'.';
   end;

   if wUsuarioSQL.Count>0 then
      wTablaxx:='';

   pnlFiltro2.Visible:=False;
   wVariable1 := lbCampos.Items.Strings[lbCampos.ItemIndex];
   wRelacion1 := rgFiltro.Items.Strings[rgFiltro.ItemIndex];
   cDias:=Trim(TrimRight(TrimLeft(meDias.Text)));
   If wType[xNComp]='D' then begin
      wVarFiltro := DateToStr( wdbdtp[xNComp].Date );
      if Length( Trim( cDias ) )=0 then begin
         wVarFiltroD:= wRepFuncDate+' '+wRepFecServi+' )' ;
         lbFiltro.Items.Add( wVariable1+wRelacion1+'DATE');
         end
      else begin
         if StrtoInt( cDias )>=0 then begin
            wVarFiltroD:= wRepFuncDate+' '+wRepFecServi+' + '+ cDias +')' ;
            lbFiltro.Items.Add( wVariable1+wRelacion1+'DATE + ('+ cDias+')');
         end
         else begin
            wVarFiltroD:= wRepFuncDate+' '+wRepFecServi+' '+ cDias +')' ;
            lbFiltro.Items.Add( wVariable1+wRelacion1+'DATE '+ cDias+' ');
         end
      end;
      wVariable2:=wTablaxx+lbCamposReal.Items.Strings[lbCampos.ItemIndex];
      lbFiltroReal.Items.Add(wVariable2 + wRelacion1 + wVarFiltroD);
   end;
   EliminaCampos( xNComp );
   pnlFiltro.Enabled  := True;
   dbgFiltro.Enabled  := True;
   pnlPie.Enabled     := True;
   pnlBtns.Enabled    := True;
   bbtnAcceso.Enabled := True;
   bbtnRef.Enabled    := True;
end;

procedure TSolMantenimiento.dbgFiltroCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
var
   i     : Integer;
   xCampo: String;
   xColorC, xColorF, xColorT, xColorS, xColorZ, xCampo2 : String;
   vFStyle : TFontStyle;

begin
  For i:=0 to wColors.Count-1 do begin

      xCampo := Copy(Colors[i],1,AnsiPos(';',Colors[i])-1 );
      xCampo2:= Copy(Colors[i],AnsiPos(';',Colors[i]) + 1,100 );
      xColorF:= Copy(xCampo2,1,AnsiPos(';',xCampo2)-1 );
      xCampo2:= Copy(xCampo2,AnsiPos(';',xCampo2)+1,100 );
      xColorT:= Copy(xCampo2,1,AnsiPos(';',xCampo2)-1 );
      xCampo2:=Copy(xCampo2,AnsiPos(';',xCampo2)+1,100 );
      xColorS:= Copy(xCampo2,1,AnsiPos(';',xCampo2)-1 );
      xCampo2:=Copy(xCampo2,AnsiPos(';',xCampo2)+1,100 );
      xColorZ:= Copy(xCampo2,1,AnsiPos(';',xCampo2)-1 );
      xCampo2:=Copy(xCampo2,AnsiPos(';',xCampo2)+1,100 );
      xColorC:= Copy(xCampo2,1,AnsiPos(';',xCampo2) );

      if Field.FieldName = xCampo then begin

         if (not Highlight) then
         begin
            If Length(xColorC)=1 then begin
               if Length(xColorF)>0 then
                  ABrush.Color:= BuscaColor( xColorF );    // FONDO
               if Length(xColorT)>0 then
                  AFont.Color := BuscaColor( xColorT );    // TEXTO
               if Length(xColorS)>0 then
                  AFont.Style := AFont.Style + [BuscaStyle(xColorS)]; // STYLE
               if Length(xColorZ)>0 then
                  AFont.Size  := StrToInt(xColorZ );       // SIZE
            end
            else begin
            If (Length(xColorC)>1) then
             if (Condicion(xColorC)) then begin
               if Length(xColorF)>0 then
                  ABrush.Color:= BuscaColor( xColorF );    // FONDO
               if Length(xColorT)>0 then
                  AFont.Color := BuscaColor( xColorT );    // TEXTO
               if Length(xColorS)>0 then
                  AFont.Style := AFont.Style + [BuscaStyle(xColorS)]; // STYLE
               if Length(xColorZ)>0 then
                  AFont.Size  := StrToInt(xColorZ );       // SIZE
            end;
            end
         end
         else begin
            AFont.Color := clHighlightText;
         end;
      end;
  end;
end;

function TSolMantenimiento.Condicion( xxCond : String ) : Boolean;
var
   xCampo, xTempo, xSigno, xValor, xOpera : string;
begin
   xTempo := xxCond;
   while Length(xTempo)>1 do begin

      xCampo := Copy(xTempo, 1, AnsiPos('%',xTempo )-1 );
      xTempo := Copy(xTempo, AnsiPos('%', xTempo )+1, 80 );
      xSigno := Copy(xTempo, 1, AnsiPos('%',xTempo )-1 );
      xTempo := Copy(xTempo, AnsiPos('%', xTempo )+1, 80 );
      xValor := Copy(xTempo, 1, AnsiPos('%',xTempo )-1 );
      xTempo := Copy(xTempo, AnsiPos('%', xTempo )+1, 80 );

      Result:=False;
      if xSigno='=' then begin
         if (Copy(xValor,1,1)='+') or (Copy(xValor,1,1)='-') then
         begin
            if cds2.FieldByName( xCampo ).AsFloat=StrToFloat(xValor) then
               Result:=True
         end
         else begin
            if Copy(xValor,1,1)='@' then
            begin
               if cds2.FieldByName( xCampo ).AsDateTime=StrToDate(Copy(xValor,2,10) ) then
                  Result:=True;
            end
            else begin
               if cds2.FieldByName( xCampo ).AsString=xValor then
                  Result:=True;
            end;
         end;
      end;

      if xSigno='<' then begin
         if (Copy(xValor,1,1)='+') or (Copy(xValor,1,1)='-') then
         begin
            if cds2.FieldByName( xCampo ).AsFloat<StrToFloat(xValor) then
               Result:=True
         end
         else begin
            if Copy(xValor,1,1)='@' then
            begin
               if cds2.FieldByName( xCampo ).AsDateTime<StrToDate(Copy(xValor,2,10) ) then
                  Result:=True;
            end
            else begin
               if cds2.FieldByName( xCampo ).AsString<xValor then
                  Result:=True;
            end;
         end;
      end;

      if xSigno='>' then begin
         if (Copy(xValor,1,1)='+') or (Copy(xValor,1,1)='-') then
         begin
            if cds2.FieldByName( xCampo ).AsFloat>StrToFloat(xValor) then
               Result:=True;
         end
         else begin
            if Copy(xValor,1,1)='@' then
            begin
               if cds2.FieldByName( xCampo ).AsDateTime>StrToDate(Copy(xValor,2,10) ) then
                  Result:=True;
            end
            else begin
               if cds2.FieldByName( xCampo ).AsString>xValor then
                  Result:=True;
            end;
         end;
      end;

      if xSigno='<>' then begin
         if (Copy(xValor,1,1)='+') or (Copy(xValor,1,1)='-') then
         begin
            if cds2.FieldByName( xCampo ).AsFloat<>StrToFloat(xValor) then
               Result:=True;
         end
         else begin
            if Copy(xValor,1,1)='@' then
            begin
               if cds2.FieldByName( xCampo ).AsDateTime<>StrToDate(Copy(xValor,2,10) ) then
                  Result:=True;
            end
            else begin
               if cds2.FieldByName( xCampo ).AsString<>xValor then
                  Result:=True;
            end;
         end;
      end;

      if xSigno='>=' then begin
         if (Copy(xValor,1,1)='+') or (Copy(xValor,1,1)='-') then
         begin
            if cds2.FieldByName( xCampo ).AsFloat>=StrToFloat(xValor) then
               Result:=True;
         end
         else begin
            if Copy(xValor,1,1)='@' then
            begin
               if cds2.FieldByName( xCampo ).AsDateTime>=StrToDate(Copy(xValor,2,10) ) then
                  Result:=True;
            end
            else begin
               if cds2.FieldByName( xCampo ).AsString>=xValor then
                  Result:=True;
            end;
         end;
      end;

      if xSigno='<=' then begin
         if (Copy(xValor,1,1)='+') or (Copy(xValor,1,1)='-') then
         begin
            if cds2.FieldByName( xCampo ).AsFloat<=StrToFloat(xValor) then
               Result:=True;
         end
         else begin
            if Copy(xValor,1,1)='@' then
            begin
               if cds2.FieldByName( xCampo ).AsDateTime<=StrToDate(Copy(xValor,2,10) ) then
                  Result:=True;
            end
            else begin
               if cds2.FieldByName( xCampo ).AsString<=xValor then
                  Result:=True;
            end;
         end;
      end;

      xOpera := Copy(xTempo, 1, AnsiPos('%',xTempo )-1 );
      xTempo := Copy(xTempo, AnsiPos('%', xTempo )+1, 80 );
      if UpperCase(xOpera)='OR' then begin
         if Result then Exit;
      end;
      if UpperCase(xOpera)='AND' then begin
         if not Result then Exit;
      end;
   end;
end;

function TSolMantenimiento.BuscaStyle( xxStyle : String ) : TFontStyle;
var
   aStyle : Array[0..12] of TFontStyle;
   sStyle : Array[0..12] of String;
   r : Integer;
begin
   sStyle[0] := 'fsBold';
   sStyle[1] := 'fsItalic';

   aStyle[0] := fsBold;
   aStyle[1] := fsItalic;

   For r:=0 to Length(sStyle)-1 do begin
       if UpperCase(xxStyle)=UpperCase(sStyle[r]) then begin
          Result := aStyle[r];
          Exit;
       end;
   end;
   Result := Null;
end;


function TSolMantenimiento.BuscaColor( xxColor : String ) : TColor;
var
   r : Integer;
begin
   For r:=0 to Length(sColor)-1 do begin
       if UpperCase(xxColor)=UpperCase(sColor[r]) then begin
          Result := aColor[r];
          Exit;
       end;
   end;

   Result := clBlack;
end;


procedure TSolMantenimiento.MuestraReporte;
var
   xSQL : String;
begin
   if xxTipRep='L' then
   xSQL:='Select * from SOLREP01 Where USUARIO='''+wUser   +''' and '
        +                             'MODULO=''' +wModulo +''' and '
        +                             'FORMA='''  +wSection+''' and '
        +                             'TIPO='''   +xxTipRep+''''
   else begin
          if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
          begin
         //   xSQL:='Select A.* USUARIO, A.NOMBRE From SOLREP01 A '
            xSQL:='Select A.* From SOLREP01 A '
                 +'INNER JOIN SOLREP02 B on (B.MODULO=A.MODULO and B.FORMA=A.FORMA and '
                 +                    'B.NOMBRE=A.NOMBRE and B.USUARIOS='''+wUser+''') '
                 +'Where A.MODULO='''+wModulo +''' and '
                 +      'A.FORMA=''' +wSection+''' and '
                 +      'A.TIPO=''P'' '
          end;
          if SRV_D = 'ORACLE' then
          begin
         //   xSQL:='Select A.* USUARIO, A.NOMBRE From SOLREP01 A '
            xSQL:='Select A.* From SOLREP01 A, SOLREP02 B '
                 +'WHERE B.MODULO=A.MODULO and B.FORMA=A.FORMA and '
                 +                    ' B.NOMBRE=A.NOMBRE and B.USUARIOS='''+wUser+''' AND '
                 +'  A.MODULO='''+wModulo +''' and '
                 +      'A.FORMA=''' +wSection+''' and '
                 +      'A.TIPO=''P'' '
          end;
   end;
   cdsReporte.Close;
   cdsReporte.DataRequest(xSQL);
   cdsReporte.Open;

   dbeNombre.Text:=cdsReporte.FieldByname('NOMBRE').AsString;
end;

procedure TSolMantenimiento.bbtnDisenoClick(Sender: TObject);
var
   xFileRtm : String;
   xSQL     : String;
begin

   pnlDiseno.Left  :=pnlColumna.Left+pnlColumna.Width+(Trunc(dbgFiltro.Width/2)-Trunc(pnlDiseno.Width/2));
   If pnlFiltro.Visible then
      pnlDiseno.Top:=pnlFiltro.Top - pnlDiseno.Height - 2
   else begin
      pnlDiseno.Top:=pnlPie.Top - pnlDiseno.Height - 2;
   end;

   bbtnFilt.Enabled   :=False;
   bbtnExporta.Enabled:=False;

   rgTipo.ItemIndex:=0;
   rgTipoClick(Sender);
   MuestraReporte;

   dbgReporte.DataSource:=NIL;
   dbgReporte.Selected.Clear;
   dbgReporte.Selected.Add('NOMBRE'#9'20'#9'Nombre del Reporte'#9'F');
   dbgReporte.Selected.Add('USUARIO'#9'10'#9'Usuario'#9'F');
   dbgReporte.DataSource:=dsReporte;

   pnlDiseno.Visible := not pnlDiseno.Visible;
end;


procedure TSolMantenimiento.Exit1Click(Sender: TObject);
begin
   ppdFiltro.Close;
end;

procedure TSolMantenimiento.dbgReporteDblClick(Sender: TObject);
var
   xFileRtm : String;
   x10, x20, x20TC : Integer;
   xSubRep  : TppComponent;
begin

   xFileRtm := xxServer+xxDirect+xxDirMod+xxDirPrn+'\'+dbeNombre.Text+'.rtm';

   If not FileExists( xFileRtm ) then
      Raise Exception.Create( ' Falta Diseñar Reporte ');

   if wUserSQL='' then begin

      GeneraSQLReporte;
      FiltraRep;

      dbgReporte.Enabled:=False;
      cds2.DisableControls;
      {
      xPipeLine := TppBDEPipeline.Create( Self );
      xPipeLine.DataSource := dsBusca;
      xPipeline.Name:= 'ppDBEPipeline1';
      }
      xPipeLine:=TppBDEPipeline.Create( Self );
      xPipeLine.DataSource:=dsBusca;
      xPipeline.UserName  :='Maestro';
      xPipeline.Name      :='ppdbMant1';


   end
   else begin
      dbgReporte.Enabled:=False;
      cds2.DisableControls;
      xPipeLine := TppBDEPipeline.Create( Self );

      GeneraSQLTabla2Descripciones;
      FiltraRep2;
      {
      xPipeLine.DataSource := ds2;
      xPipeline.Name:= 'ppDBEPipeline1';
      xPipeLine:=TppBDEPipeline.Create( Self );
      }
      //xPipeLine.DataSource:=ds2;
      xPipeLine.DataSource:=dsBusca;
      xPipeline.UserName  :='Maestro';
      xPipeline.Name      :='ppdbMant1';

   end;

   xReport := TppReport.Create( Self);
   xReport.Name:= 'ppReport2';
   xReport.Template.FileName := xFileRtm;
   xReport.Template.LoadFromFile;
   xReport.DataPipeline:= xPipeline;
   xReport.OnPreviewFormCreate:=pprMantxPreviewFormCreate;

   {
   // Imprimir en Archivo
   xReport.AllowPrintToFile:= true;
   xReport.DeviceType      := 'HTMLFile';
   xReport.ArchiveFileName := dbeNombre.Text+'.htm';
   xReport.TextFileName    := dbeNombre.Text;
   //
   }
   SOLPrevio1.ppReport:=xReport;
   Try
     SOLPrevio1.Execute;
   Finally
     cds2.First;
     cds2.EnableControls;
     dbgReporte.Enabled:=True;
     xReport.Stop;

     x10:=Self.ComponentCount-1;
     while x10>=0 do begin
        if Self.Components[ x10 ].ClassName='TppGroup' then begin
           Self.Components[ x10 ].Free ;
        end;
        x10:=x10-1;
     end;

     cdsBusca.IndexFieldNames:='';

     cdsRep2.Close;
     cdsRep2.FetchOnDemand  :=False;
     cdsRep2.PacketRecords  :=-1;
     cdsRep2.MasterSource   :=nil;
     cdsRep2.MasterFields   :='';
     cdsRep2.IndexFieldNames:='';
     cdsRep2.FetchOnDemand:=True;

     xPipeLine.Free;
     xReport.Free;
   end;
end;


procedure TSolMantenimiento.bbtnRepOkClick(Sender: TObject);
var
  xSQL    : String;
  xFileRtm: String;
  x10, x     : Integer;
begin
   if Length(dbeNombre.Text)=0 then
      Raise Exception.Create('Falta Ingresar Nombre');

   if not DirectoryExists( xxServer+xxDirect ) then
      if not CreateDir( xxServer+xxDirect ) then
         raise Exception.Create('Error al Crear Directorio '+xxServer+xxDirect );

   if not DirectoryExists( xxServer+xxDirect+xxDirMod ) then
      if not CreateDir( xxServer+xxDirect+xxDirMod ) then
         raise Exception.Create( 'Error al Crear Directorio '+xxServer+xxDirect+xxDirMod );

   if not DirectoryExists( xxServer+xxDirect+xxDirMod+xxDirPrn ) then
      if not CreateDir( xxServer+xxDirect+xxDirMod+xxDirPrn ) then
         raise Exception.Create( 'Error al Crear Directorio '+xxServer+xxDirect+xxDirMod+xxDirPrn );


   if dbeNombre.Text=cdsReporte.FieldByName('NOMBRE').AsString then
   begin
      xSQL:='Select * from SOLREP01 '
           +'Where NOMBRE=''' +dbeNombre.Text+''' and '
           +      'MODULO=''' +wModulo       +''' and '
           +      'FORMA='''  +wSection      +''' and '
           +      'USUARIO='''+wUser         +''' and '
           +      'TIPO='''   +xxTipRep      +'''' ;
      cdsBusca.Close;
      cdsBusca.Filter  :='';
      cdsBusca.Filtered:=False;
      cdsBusca.ProviderName:='prvBusca';
      cdsBusca.DataRequest(xSQL);
      cdsBusca.Open;
      if cdsBusca.RecordCount=0 then
         Raise Exception.Create('Usuario No Tiene Acceso a Diseñar Reporte');
   end
   else begin

      xSQL:='Select * from SOLREP01 '
           +'Where NOMBRE=''' +dbeNombre.Text+''' and '
           +      'MODULO=''' +wModulo +''' and '
           +      'FORMA='''  +wSection+''' and '
           +      'USUARIO='''+wUser   +''' and '
           +      'TIPO='''   +xxTipRep+'''' ;
      cdsBusca.Close;
      cdsBusca.Filter  :='';
      cdsBusca.Filtered:=False;
      cdsBusca.ProviderName:='prvBusca';
      cdsBusca.DataRequest(xSQL);
      cdsBusca.Open;
      if cdsBusca.RecordCount=0 then
      begin
         xSQL:='Insert Into SOLREP01 ( NOMBRE, USUARIO, MODULO, FORMA, TIPO, CAMPODES ) '
              +'Values( '''+dbeNombre.Text+''', '''+wUser   +''', '
              +        ''''+wModulo       +''', '''+wSection+''', '
              +        ''''+xxTipRep      +''', '''+wGrabaD +''' )';
         cdsBusca.Close;
         cdsBusca.Filter:='';
         cdsBusca.Filtered:=False;
         cdsBusca.DataRequest(xSQL);
         cdsBusca.Execute;
      end;
   end;

   cdsReporte.Refresh;

   //GeneraSQLReporte;

   if wUserSQL='' then begin

      GeneraSQLReporte;

      xFileRtm:=xxServer+xxDirect+xxDirMod+xxDirPrn+'\'+dbeNombre.Text+'.rtm';

      FiltraRep;

      xPipeLine:=TppBDEPipeline.Create( Self );
      xPipeLine.DataSource:=dsBusca;
      xPipeline.UserName  :='Maestro';
      xPipeline.Name      :='ppdbMant1';
   end
   else begin

      xFileRtm:=xxServer+xxDirect+xxDirMod+xxDirPrn+'\'+dbeNombre.Text+'.rtm';

      GeneraSQLTabla2Descripciones;

      FiltraRep2;

      xPipeLine:=TppBDEPipeline.Create( Self );
      //xPipeLine.DataSource:=ds2;
      xPipeLine.DataSource:=dsBusca;
      xPipeline.UserName  :='Maestro';
      xPipeline.Name      :='ppdbMant1';
   end;

   for x:=0 to xPipeline.FieldCount-1 do begin
       if cdsGrid.Locate( 'CAMPO', xPipeline.fields[x].FieldAlias,[] ) then begin
          if cdsGrid.FieldByName('Descripcion').AsString<>'' then
             xPipeline.fields[x].FieldAlias:=cdsGrid.FieldByName('Descripcion').AsString;
       end;
   end;

   if wTabla2<>'' then
   begin
     xSQL:='Select * from PLAN04 where ARCHIVO='''+wTabla2+'''';
     cdsGrid2.Close;
     cdsGrid2.DataRequest( xSQL );
     cdsGrid2.Open;

     for x:=0 to ppdbMantD.FieldCount-1 do begin
         if cdsGrid2.Locate( 'CAMPO', ppdbMantD.fields[x].FieldAlias,[] ) then begin
            if cdsGrid2.FieldByName('Descripcion').AsString<>'' then
               ppdbMantD.fields[x].FieldAlias:=cdsGrid2.FieldByName('Descripcion').AsString;
         end;
     end;
   end;

   xReport:=TppReport.Create( Self);
   xReport.Name:='pprMant1';
   xReport.Template.FileName:=xFileRtm;

   ppdFiltro.Report:=xReport;

   if not FileExists( xFileRtm ) then xReport.Template.SaveToFile;
   xReport.Template.LoadFromFile;
   xReport.DataPipeline:=xPipeline;

   ppdFiltro.ShowModal;

   xReport.Stop;

   x10:=xReport.GroupCount-1;
   while x10>=0 do begin
       xReport.Groups[ x10 ].Free;
       x10:=x10-1;
   end;

   xPipeLine.free;
   xReport.Free;

   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.Filtered:=False;
   cdsBusca.FetchOnDemand  :=False;
   cdsBusca.PacketRecords  :=-1;
   cdsBusca.FetchOnDemand  :=True;
   cdsBusca.IndexFieldNames:='';

   cdsRep2.Close;
   cdsRep2.FetchOnDemand  :=False;
   cdsRep2.PacketRecords  :=-1;
   cdsRep2.MasterSource   :=nil;
   cdsRep2.MasterFields   :='';
   cdsRep2.IndexFieldNames:='';
   cdsRep2.FetchOnDemand:=True;

   dbeNombre.Text:=cdsReporte.FieldByname('NOMBRE').AsString;
end;

procedure TSolMantenimiento.GeneraSQLReporte;
var
   xcr  : Integer;
   wQry : String;
   xCampoDes : String;
   xCampoCod : String;
   xVAR : String;
   xCAM : String;
begin
   if cdsReporte.FieldByName( 'CAMPODES' ).AsString<>'' then
   begin

      xVAR:=cdsReporte.FieldByName( 'CAMPODES' ).AsString;

      while AnsiPos( ';', xVAR )>0 do
      begin
         xCAM:=Copy( xVAR, 1, AnsiPos( ';', xVAR )-1 );
         xVAR:=Copy( xVAR, AnsiPos( ';', xVAR )+1, Length( xVAR ) );

         For xcr:=0 to clbRepD.Items.Count-1 do
         begin
             if clbRepDReal.Items[ xcr ]=xCAM then
             begin
                clbRepD.Checked[ xcr ]:=True;
                Break;
             end;
         end;
      end;
   end;

   wJoin  :='';
   wJoin2 :='';
   wSelec2:='';
   wGrabaD:='';
   For xcr:=0 to clbRepD.Items.Count-1 do begin

       if clbRepD.Checked[ xcr ] then begin
          cdsBusca.Close;

          wQry:='Select CAMPO, DETDBGTITLE, DESCRIPCION from PLAN04 '
               +'Where archivo='''+clbRepDTabla.Items[ xcr ]+''' and '
               +'DETALLE='+''''+'S'+'''';
          cdsBusca.DataRequest( wQry );
          cdsBusca.Open;
          {
          wQry:='archivo='''+clbRepDTabla.Items[ xcr ]+''' and DETALLE=''S''';
          FiltraTablaRemoto( cdsBusca, 'PLAN04', 'ARCHIVO', wQry );
          }
          if cdsBusca.RecordCount>0 then begin

             while not cdsBusca.Eof do begin

                xCampoDes:=cdsBusca.FieldByName('Campo').AsString;

                wSelec2:=wSelec2+', '+clbRepDTabla.Items[ xcr ]+'.'+xCampoDes;
                wGrabaD:=wGrabaD+clbRepDReal.Items[ xcr ]+';';

                xCampoDes:=StringReplace(cdsBusca.FieldByName('DESCRIPCION').asstring,' ','_',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,'.','_',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,'~','_',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,'á','I',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,'é','E',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,'í','I',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,'ó','O',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,'ú','U',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,'Ñ','N',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,'ñ','N',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,'(','',[rfreplaceall]);
                xCampoDes:=StringReplace(xCampoDes,')','',[rfreplaceall]);
                xCampoDes:=UpperCase( xCampoDes );

                //wSelec2:=wSelec2+' AS '+xCampoDes+'_NOM';
                wSelec2:=wSelec2+' AS '+xCampoDes;

                cdsBusca.Next;
             end;

             cdsUsuNo.Close;
             cdsUsuNo.ProviderName:='dspTem2';
             wQry:='Select CAMPO, DETDBGTITLE, DESCRIPCION from Plan04 '
                  +'Where archivo='''+clbRepDTabla.Items[ xcr ]+''' and '
                  +'DETALLE='+''''+'C'+'''';
             cdsUsuNo.DataRequest( wQry );
             cdsUsuNo.Open;

             xCampoCod:= cdsUsuNo.FieldByName('Campo').AsString;

             //  vhn
             if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
             begin
                wJoin:=wJoin+'Left Join '+clbRepDTabla.Items[ xcr ]+' on '
                      +wTabla+'.'+clbRepDReal.Items[ xcr ]+'='
                      +clbRepDTabla.Items[xcr]+'.'+xCampoCod+' ';
                wJoin2:='';
             end
             else begin
                {
                if SRV_D = 'ORACLE' then begin
                   wJoin:=wJoin+', '+clbRepDTabla.Items[ xcr ]+' ';
                   if wJoin2='' then
                      wJoin2:=wTabla+'.'+clbRepDReal.Items[ xcr ]+'='
                             +clbRepDTabla.Items[xcr]+'.'+xCampoCod+'(+) '
                   else
                      wJoin2:=wJoin2+' and '+wTabla+'.'+clbRepDReal.Items[ xcr ]+'='
                             +clbRepDTabla.Items[xcr]+'.'+xCampoCod+'(+) '
                }
                if SRV_D = 'ORACLE' then begin

                   cdsUsuNo.Close;
                   cdsUsuNo.ProviderName:='dspTem2';
                   wQry:='Select CAMPO, DETDBGTITLE, DESCRIPCION from Plan04 '
                        +'Where ARCHIVO='''+clbRepDTabla.Items[ xcr ]+''' and '
                        +      'DETDBGKEY>=''1'' AND DETDBGKEY<=''9''';
                   cdsUsuNo.DataRequest( wQry );
                   cdsUsuNo.Open;

                   wJoin:=wJoin+', '+clbRepDTabla.Items[ xcr ]+' ';

                   while not cdsUsuNo.Eof do begin

                      if wJoin2='' then
                         wJoin2:=wTabla+'.'+cdsUsuNo.FieldbYName('CAMPO').AsString+'='
                                +clbRepDTabla.Items[xcr]+'.'+cdsUsuNo.FieldbYName('CAMPO').AsString+'(+) '
                      else
                         wJoin2:=wJoin2+' and '+wTabla+'.'+cdsUsuNo.FieldbYName('CAMPO').AsString+'='
                                +clbRepDTabla.Items[xcr]+'.'+cdsUsuNo.FieldbYName('CAMPO').AsString+'(+) ';

                      cdsUsuNo.Next;
                   end;
                end;
             end;
             //
          end;
       end;
   end;

   if wTabla2<>'' then begin

   end;
end;


procedure TSolMantenimiento.GeneraSQLTabla2Descripciones;
var
   xcr   : Integer;
   wQry  : String;
   xCampoDes : String;
   xCampoCod : String;
   h     : Integer;
   xVAR, xSQL  : String;
   xCAM  : String;
begin


  wT2Join  :='';
  wT2Join2 :='';
  wT2Selec2:='';

  if wTabla2<>'' then
  begin
     xSQL:='Select * from PLAN04 '
          +'where ARCHIVO='''+wTabla2+''' and DETALLE2=''S''';
     cdsGrid2.Close;
     cdsGrid2.DataRequest( xSQL );
     cdsGrid2.Open;

     while not cdsGrid2.Eof do
     begin

        wQry:='Archivo='''+cdsGrid2.FieldByName('DETDBGREFER').AsString+''' and DETALLE=''S''';
        FiltraTablaRemoto( cdsBusca, 'PLAN04', 'ARCHIVO', wQry );

        if cdsBusca.RecordCount>0 then
        begin

           while not cdsBusca.Eof do
           begin

              xCampoDes:=cdsBusca.FieldByName('Campo').AsString;

              wT2Selec2:=wT2Selec2+', '+cdsGrid2.FieldByName('DETDBGREFER').AsString+'.'+xCampoDes;

              xCampoDes:=StringReplace(cdsBusca.FieldByName('DESCRIPCION').asstring,' ','_',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,'.','_',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,'~','_',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,'á','I',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,'é','E',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,'í','I',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,'ó','O',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,'ú','U',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,'Ñ','N',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,'ñ','N',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,'(','',[rfreplaceall]);
              xCampoDes:=StringReplace(xCampoDes,')','',[rfreplaceall]);
              xCampoDes:=UpperCase( xCampoDes );

              wT2Selec2:=wT2Selec2+' AS '+xCampoDes;

              cdsBusca.Next;
           end;

           cdsUsuNo.Close;
           cdsUsuNo.ProviderName:='dspTem2';
           wQry:='Select CAMPO, DETDBGTITLE, DESCRIPCION from Plan04 '
                  +'Where archivo='''+cdsGrid2.FieldByName('DETDBGREFER').AsString+''' and '
                  +'DETALLE='+''''+'C'+'''';
           cdsUsuNo.DataRequest( wQry );
           cdsUsuNo.Open;

           xCampoCod:= cdsUsuNo.FieldByName('Campo').AsString;

           //  vhnxx 15/12/2003
           if (SRV_D = 'DB2NT') or (SRV_D = 'DB2400') then
           begin
              wT2Join:=wT2Join+'Left Join '+cdsGrid2.FieldByName('DETDBGREFER').AsString+' on '
                    +wTabla2+'.'+cdsUsuNo.FieldbYName('CAMPO').AsString+'='
                    +cdsGrid2.FieldByName('DETDBGREFER').AsString+'.'+xCampoCod+' ';
              wT2Join2:='';
           end
           else
           begin
              if SRV_D = 'ORACLE' then begin

                 cdsUsuNo.Close;
                 cdsUsuNo.ProviderName:='dspTem2';
                 wQry:='Select CAMPO, DETDBGTITLE, DESCRIPCION from Plan04 '
                      +'Where ARCHIVO='''+cdsGrid2.FieldByName('DETDBGREFER').AsString+''' and '
                      +      'DETDBGKEY>=''1'' AND DETDBGKEY<=''9''';
                 cdsUsuNo.DataRequest( wQry );
                 cdsUsuNo.Open;

                 wT2Join:=wT2Join+', '+cdsGrid2.FieldByName('DETDBGREFER').AsString+' ';

                 while not cdsUsuNo.Eof do begin

                    if wT2Join2='' then
                       wT2Join2:=wTabla2+'.'+cdsUsuNo.FieldbYName('CAMPO').AsString+'='
                                +cdsGrid2.FieldByName('DETDBGREFER').AsString+'.'+cdsUsuNo.FieldbYName('CAMPO').AsString+'(+) '
                    else
                       wT2Join2:=wT2Join2+' and '+wTabla2+'.'+cdsUsuNo.FieldbYName('CAMPO').AsString+'='
                                +cdsGrid2.FieldByName('DETDBGREFER').AsString+'.'+cdsUsuNo.FieldbYName('CAMPO').AsString+'(+) ';

                    cdsUsuNo.Next;
                 end;
              end;
           end;
        end;
        cdsGrid2.Next;
     end;
  end;
end;


procedure TSolMantenimiento.FiltraRep;
var
   xWhere, xWhere2, wQuery, xOrder, xQuery2, xCampo, xQry99, xCampo2 : String;
   x : Integer;
begin

   Screen.Cursor:=CrHourGlass;

   xWhere := '';
   for x:=0 to lbFiltroReal.Items.Count - 1 do begin
      if length( xWhere )>0 then
         if Copy(lbFiltroReal.Items.Strings[x],1,4)=' or ' then
            xWhere := xWhere + lbFiltroReal.Items.Strings[x]
         else
            xWhere := xWhere + ' and ' + lbFiltroReal.Items.Strings[x]
      else begin
         xWhere := lbFiltroReal.Items.Strings[x];
      end;

      // VHNDEMA   PARA FILTRAR TABLA2 CON CAMPOS IGUALES
      if wTabla2<>'' then
      begin
         xCampo :=StringReplace( lbFiltroReal.Items.Strings[x],wTabla+'.','',[rfreplaceall] );
         xCampo2:=Copy(xCampo,1,Pos('=',xCampo)-1);
         cdsUsuNo.Close;
         cdsUsuNo.ProviderName:='dspTem2';
         xQry99:='Select CAMPO from PLAN04 '
              +'where ARCHIVO='''+wTabla+''' AND CAMPO='''+xCampo2+'''';
         cdsUsuNo.DataRequest( xQry99 );
         cdsUsuNo.Open;

         if cdsUsuNo.RecordCount>0 then
         begin
            if length( xWhere2 )>0 then

               if Copy(xCampo,1,4)=' or ' then
                  xWhere2 := xWhere2 + xCampo
               else
                  xWhere2 := xWhere2 + ' and ' + xCampo
            else begin
               xWhere2 := xCampo;
            end;
         end;
      end;
      // END VHNDEMA
   end;

   xOrder := '';
   for x:=0 to lbOrdenReal.Items.Count - 1 do begin
      if length( xOrder )>0 then
         xOrder := xOrder + ', ' + lbOrdenReal.Items.Strings[x]
      else begin
         xOrder := lbOrdenReal.Items.Strings[x];
      end;
   end;

   wSelRep:='Select ';

   for x:=0 to dbgFiltro.FieldCount-1 do begin
       if dbgFiltro.Columns[x].FieldName<>'' then
          if (UpperCase(Copy(dbgFiltro.Columns[x].FieldName,1,2))<>'LK') then
             wSelRep:=wSelRep+wTabla+'.'+dbgFiltro.Columns[x].FieldName+', ';
   end;

   wSelRep:=Copy(wSelRep,1,Length(wSelRep)-2);

   if wJoin='' then begin
      If Length( xWhere ) > 0 then
         wQuery:=wSelRep+wSelec2+' '+wFroRep+' '
                +'WHERE '+xWhere
      else
         wQuery:=wSelRep+wSelec2+' '+wFroRep+' ';
   end
   else begin
      if SRV_D = 'ORACLE' then begin
         if Length( xWhere ) > 0 then
            wQuery:=wSelRep+wSelec2+' '+wFroRep+' '+wJoin+' '
                   +'WHERE '+xWhere+ ' and ( '+wJoin2+' ) '
         else
            wQuery:=wSelRep+wSelec2+' '+wFroRep+' '+wJoin+' '
                   +'WHERE ( '+wJoin2+' ) ';
      end
      else begin
         if Length( xWhere ) > 0 then
            wQuery:=wSelRep+wSelec2+' '+wFroRep+' '+wJoin+' '
                   +'WHERE '+xWhere+' '
         else
            wQuery:=wSelRep+wSelec2+' '+wFroRep+' '+wJoin+' ';
      end;
   end;

   if wFilter<>'' then
   begin
      if pos('WHERE',wQuery)>0 Then
           wQuery  := wQuery + ' AND ('+wFilter+')'
      else
         wQuery  := wQuery + ' WHERE ('+wFilter+')'
   end;

   if wFilter2<>'' then
   begin
      if pos('WHERE',wQuery)>0 Then
         wQuery  := wQuery + ' AND ('+wFilter2+')'
      else
         wQuery  := wQuery + ' WHERE ('+wFilter2+')'
   end;

   if Length( xOrder ) > 0 then
      wQuery  := wQuery + ' ORDER BY ' + xOrder;

   if Length( wUserSQL )>0 then begin
      wQuery := wUserSQL;
      if Length(xWhere)>0 then
         wQuery := wUserSQL+' AND '+xWhere;
   end;

   cdsBusca.DisableControls;
   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.Filtered:=False;
   cdsBusca.IndexFieldNames:=wTablaLlave;
   cdsBusca.DataRequest( wQuery );
   cdsBusca.FetchOnDemand:=False;
   cdsBusca.PacketRecords:=100;
   cdsBusca.FetchOnDemand:=True;
   cdsBusca.Open;
   cdsBusca.EnableControls;

   ppdbMantD.Visible:=False;

   if wTabla2<>'' then begin
      ppdbMantD.Visible:=True;
      //xQuery2:='Select * from '+wTabla2+' Order by '+StringReplace(wTabla2Llave,';',',',[rfreplaceall]);
      // vhnxx 15/12/2003
      xQuery2:='Select * from '+wTabla2;

      // vhndema
      if (wTabla2Filter<>'') or (xWhere2<>'') then
      begin
         if (wTabla2Filter<>'') and (xWhere2<>'') then
            xQuery2:=xQuery2+' Where '+wTabla2Filter+' and '+xWhere2
         else
            if (wTabla2Filter<>'') then
               xQuery2:=xQuery2+' Where '+wTabla2Filter
            else
               xQuery2:=xQuery2+' Where '+xWhere2;
      end;

      xQuery2:=xQuery2+' Order by '+StringReplace(wTabla2Llave,';',',',[rfreplaceall]);

      cdsRep2.Close;
      cdsRep2.FetchOnDemand:=False;
      cdsRep2.PacketRecords:=100;
      cdsRep2.DataRequest( xQuery2 );
      cdsRep2.MasterSource   :=dsBusca;
      cdsRep2.IndexFieldNames:=wTabla2Llave;
      cdsRep2.MasterFields   :=wTablaLlave;
      try
          cdsRep2.Open;
      except
          xQuery2:='Select * from '+wTabla2;

          if wTabla2Filter<>'' then
             xQuery2:=xQuery2+' Where '+wTabla2Filter;

          xQuery2:=xQuery2+' Order by '+StringReplace(wTabla2Llave,';',',',[rfreplaceall]);

          cdsRep2.Close;
          cdsRep2.FetchOnDemand:=False;
          cdsRep2.PacketRecords:=100;
          cdsRep2.DataRequest( xQuery2 );
          cdsRep2.MasterSource   :=dsBusca;
          cdsRep2.IndexFieldNames:=wTabla2Llave;
          cdsRep2.MasterFields   :=wTablaLlave;
      end;
      // end vhndema

      cdsRep2.FetchOnDemand:=True;
   end;

   cdsBusca.First;

   Screen.Cursor:=crDefault;
end;


procedure TSolMantenimiento.FiltraRep2;
var
   xWhere, wQuery, xOrder, xQuery2 : String;
   x : Integer;
begin

   Screen.Cursor:=CrHourGlass;

   cdsBusca.DisableControls;
   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.Filtered:=False;
   if wTablaLlave<>'' then
      cdsBusca.IndexFieldNames:=wTablaLlave;
      
   cdsBusca.DataRequest( SQL );
   cdsBusca.FetchOnDemand:=False;
   cdsBusca.PacketRecords:=1000;
   cdsBusca.FetchOnDemand:=True;
   cdsBusca.Open;
   cdsBusca.EnableControls;

   ppdbMantD.Visible:=False;

   if wTabla2<>'' then begin
      ppdbMantD.Visible:=True;

      if wT2Selec2='' then
         xQuery2:='Select * from '+wTabla2
      else
         xQuery2:='Select '+wTabla2+'.* '+wT2Selec2+' from '+wTabla2 + wT2Join ;
      {
      if wTabla2Filter<>'' then
      begin
         xQuery2:=xQuery2+' Where '+wTabla2Filter;
      end;
      }
      if SRV_D = 'ORACLE' then
      begin
         if Pos('Where', xQuery2 )=0 then
         begin
            if wT2Join2<>'' then
               xQuery2:=xQuery2+' Where ( '+wT2Join2+' ) ';
         end
         else
         begin
            if Length( xWhere ) > 0 then
               xQuery2:=xQuery2+' and ( '+wJoin2+' ) '
         end;
      end;

      xQuery2:=xQuery2+' Order by '+StringReplace(wTabla2Llave,';',',',[rfreplaceall]);

      cdsRep2.Close;
      if wTabla2Filter<>'' then
      begin
         cdsRep2.Filtered:=False;
         cdsRep2.Filter  :='';
         cdsRep2.Filter  :=wTabla2Filter;
         cdsRep2.Filtered:=True;
      end;
      cdsRep2.FetchOnDemand:=False;
      cdsRep2.PacketRecords:=100;
      cdsRep2.DataRequest( xQuery2 );
      cdsRep2.MasterSource   :=dsBusca;
      cdsRep2.IndexFieldNames:=wTabla2Llave;
      cdsRep2.MasterFields   :=wTablaLlave;
      cdsRep2.Open;
      cdsRep2.FetchOnDemand:=True;

      if wTabla2Order<>'' then
      begin
         if cdsRep2.IndexName='XXX11' then
            cdsRep2.DeleteIndex( 'XXX11' );
         cdsRep2.AddIndex( 'XXX11', wTabla2Order , [ixCaseInsensitive],'','', 0 );
         cdsRep2.IndexName:='XXX11';
      end;
   end;

   Screen.Cursor:=crDefault;
end;


procedure TSolMantenimiento.bbtnRepCaClick(Sender: TObject);
begin
   pnlDiseno.Visible:=False;
   bbtnFilt.Enabled   :=True;
   bbtnExporta.Enabled:=True;
end;

procedure TSolMantenimiento.Save1Click(Sender: TObject);
var
   xSQL    : String;
   x, x10  : Integer;
   xFileRtm: String;
begin
   xReport.Template.SaveToFile;

   xSQL:='Update SOLREP01 set CAMPODES='''+wGrabaD +''' '
        +'Where NOMBRE=''' +dbeNombre.Text+''' and '
        +      'MODULO=''' +wModulo       +''' and '
        +      'FORMA='''  +wSection      +''' and '
        +      'USUARIO='''+wUser         +'''' ;
   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.Filtered:=False;
   cdsBusca.DataRequest(xSQL);
   cdsBusca.Execute;

   cdsReporte.Refresh;

//
   xFileRtm:=xxServer+xxDirect+xxDirMod+xxDirPrn+'\'+dbeNombre.Text+'.rtm';

   if wUserSQL='' then
   begin
      FiltraRep;
   end
   else
   begin
      FiltraRep2;
   end;

//   xPipeLine:=TppBDEPipeline.Create( Self );

   xPipeLine.DataSource:=dsBusca;

   xPipeline.UserName  :='Maestro';
   xPipeline.Name      :='ppdbMant1';

   for x:=0 to xPipeline.FieldCount-1 do begin
       if cdsGrid.Locate( 'CAMPO', xPipeline.fields[x].FieldAlias,[] ) then begin
          if cdsGrid.FieldByName('Descripcion').AsString<>'' then
             xPipeline.fields[x].FieldAlias:=cdsGrid.FieldByName('Descripcion').AsString;
       end;
   end;

//   xReport:=TppReport.Create( Self);
   xReport.Name:='pprMant1';
   xReport.Template.FileName:=xFileRtm;

   ppdFiltro.Report:=xReport;

   x10:=Self.ComponentCount-1;
   while x10>=0 do begin
      if Self.Components[ x10 ].ClassName='TppGroup' then begin
         Self.Components[ x10 ].Free ;
      end;
      x10:=x10-1;
   end;

//   if not FileExists( xFileRtm ) then xReport.Template.SaveToFile;
   xReport.Template.LoadFromFile;
   xReport.DataPipeline:=xPipeline;

//   ppdFiltro.Close;
//   xReport. DataPipeline:=xPipeline;
//   ppdFiltro.ShowData;

end;

procedure TSolMantenimiento.dbgReporteRowChanged(Sender: TObject);
begin
   dbeNombre.Text:=cdsReporte.FieldByname('NOMBRE').AsString;
end;

procedure TSolMantenimiento.dbgReporteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
   xSql, xFileRtm : String;
begin
  if (key=VK_Delete) and (ssCtrl in Shift) then begin
     if MessageDlg( ' ¿ Eliminar Registro ? ' ,mtConfirmation, [mbYes, mbNo], 0)=mrYes then begin

        xFileRtm:=xxServer+xxDirect+xxDirMod+xxDirPrn+'\'+cdsReporte.FieldByname('NOMBRE').AsString+'.rtm';
        xSQL:='Delete from SOLREP01 '
             +'Where NOMBRE=''' +cdsReporte.FieldByname('NOMBRE').AsString+''' and '
             +      'MODULO=''' +wModulo +''' and '
             +      'FORMA='''  +wSection+''' and '
             +      'USUARIO='''+wUser   +'''' ;
        cdsBusca.Close;
        cdsBusca.Filter:='';
        cdsBusca.Filtered:=False;
        cdsBusca.ProviderName:='prvBusca';
        cdsBusca.DataRequest(xSQL);
        cdsBusca.Execute;
        cdsReporte.Refresh;
        dbeNombre.Text:=cdsReporte.FieldByname('NOMBRE').AsString;

        DeleteFile( xFileRtm );
     end
  end;
end;

procedure TSolMantenimiento.bbtnPublicaClick(Sender: TObject);
var
   xFileRtm, xFilePub, xSQL : String;
begin
   if dbeNombre.Text='' then Exit;

   xFileRtm := xxDirLoc+xxDirect+xxDirMod+xxDirPrn+'\'+dbeNombre.Text+'.rtm';
   xFilePub := xxDirPub+xxDirect+xxDirMod+xxDirPrn+'\'+dbeNombre.Text+'.rtm';

   if FileExists( xFilePub ) then
      Raise Exception.Create('Error Reporte ya Existe');

   if not DirectoryExists( xxDirPub+xxDirect ) then
      if not CreateDir( xxDirPub+xxDirect ) then
         raise Exception.Create('Error al Crear Directorio '+xxDirPub+xxDirect );

   if not DirectoryExists( xxDirPub+xxDirect+xxDirMod ) then
      if not CreateDir( xxDirPub+xxDirect+xxDirMod ) then
         raise Exception.Create( 'Error al Crear Directorio '+xxDirPub+xxDirect+xxDirMod );

   if not DirectoryExists( xxDirPub+xxDirect+xxDirMod+xxDirPrn ) then
      if not CreateDir( xxDirPub+xxDirect+xxDirMod+xxDirPrn ) then
         raise Exception.Create( 'Error al Crear Directorio '+xxDirPub+xxDirect+xxDirMod+xxDirPrn );

   MoveFile( PChar(xFileRtm), PChar(xFilePub) );

   xSQL:='Update SOLREP01 Set TIPO=''P'' '
        +'Where NOMBRE=''' +dbeNombre.Text+''' and '
        +      'USUARIO='''+wUser         +''' and '
        +      'MODULO=''' +wModulo       +''' and '
        +      'FORMA='''  +wSection      +''' and TIPO=''L'' ';
   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.Filtered:=False;
   cdsBusca.DataRequest(xSQL);
   cdsBusca.Execute;

   xSQL:='Insert into SOLREP02 ( NOMBRE, USUARIO, MODULO, FORMA, USUARIOS )'
        +'Values( '''+dbeNombre.Text+''', '''+wUser+''' ,'''+wModulo+''', '
        +        ''''+wSection      +''', '''+wUser+''')';
   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.Filtered:=False;
   cdsBusca.DataRequest(xSQL);
   cdsBusca.Execute;

   rgTipo.ItemIndex:=1;
   xxTipRep :='P';
   bbtnPublica.Visible:=False;

   MuestraReporte;
end;

procedure TSolMantenimiento.rgTipoClick(Sender: TObject);
begin
   if rgTipo.ItemIndex=0 then begin
      xxTipRep :='L';
      bbtnPublica.Visible:=True;
      bbtnUsuario.Visible:=False;
      dbeNombre.Enabled  :=True;
      xxServer := xxDirLoc;
      end
   else begin
      xxTipRep :='P';
      bbtnPublica.Visible:=False;
      bbtnUsuario.Visible:=True;
      dbeNombre.Enabled  :=False;
      xxServer := xxDirPub;
   end;

   MuestraReporte;
end;

procedure TSolMantenimiento.bbtnUsuarioClick(Sender: TObject);
var
   xSQL : String;
begin
   if cdsReporte.FieldByname('USUARIO').AsString='' then Exit;

   if cdsReporte.FieldByname('USUARIO').AsString<>wUser then
      Raise Exception.Create('Usuario No Puede Dar Accesos');

   pnlAcceso.Top:=pnlDiseno.Top-20;
   pnlAcceso.Left:=pnlDiseno.Left+205;

   pnlPie.Enabled   :=False;
   pnlBtns.Enabled  :=False;
   pnlDiseno.Enabled:=False;
   pnlFiltro.Enabled:=False;
   pnlbtns.Enabled  :=False;
   dbgFiltro.Enabled:=False;

   xSQL:='Select USUARIOS From SOLREP02 '
        +'Where Modulo='''+wModulo+''' and Forma='''+wSection+''' and '
        +      'Nombre='''+dbeNombre.Text+''' and Usuario='''+wUser+''' ';

   cdsUsuSi.Close;
//   cdsUsuSi.ProviderName:='prvEjecuta';
   cdsUsuSi.ProviderName:='dspTem1';
   cdsUsuSi.DataRequest(xSQL);
   try
      cdsUsuSi.Open;
   except
   end;
   { vhndema
   xSQL:='Select A.USERID From tge002 A, Tge001 B '
        +'Where A.grupoid=B.grupoid and B.moduloid='''+wModulo+''' and '
        +      'TIPO=''0'' and '
        +      'not exists( Select * from SOLREP02 C '
        +      'where C.Modulo='''+wModulo+''' and C.Forma='''+wSection+''' and '
        +      'C.Nombre='''+dbeNombre.Text+''' and '
        +      'C.Usuario='''+wUser+''' and C.Usuarios=A.Userid ) ';
   }
   
   xSQL:='Select A.USERID from TGE006 A, TGE007 B, TGE001 D '
        +'WHERE A.USERID=B.USERID '
        +  'and B.GRUPOID=D.GRUPOID AND D.MODULOID='''+wModulo+''' and D.TIPO=''0'' '
        +  'and not exists( Select * from SOLREP02 C '
        +                  'where C.Modulo='''+wModulo+''' and C.Forma='''+wSection+''' '
        +                    'and C.Nombre='''+dbeNombre.Text+''' '
        +                    'and C.Usuario='''+wUser+''' and C.Usuarios=A.Userid ) '
        +'ORDER BY A.USERID';

   cdsUsuNo.Close;
//   cdsUsuNo.ProviderName:='prvEjecuta';
   cdsUsuNo.ProviderName:='dspTem2';
   cdsUsuNo.DataRequest(xSQL);
   try
     cdsUsuNo.Open;
   except
   end;  

   pnlAcceso.Visible:=True;

end;

procedure TSolMantenimiento.bbtnCancAcClick(Sender: TObject);
begin
   pnlPie.Enabled   :=True;
   pnlBtns.Enabled  :=True;
   pnlDiseno.Enabled:=True;
   pnlFiltro.Enabled:=True;
   pnlbtns.Enabled  :=True;
   dbgFiltro.Enabled:=True;
   pnlAcceso.Visible:=False;
end;

procedure TSolMantenimiento.bbtnSiClick(Sender: TObject);
var
   xSQL : String;
begin
   xSQL:='Insert into SOLREP02 ( NOMBRE, USUARIO, MODULO, FORMA, USUARIOS )'
        +'Values( '''+dbeNombre.Text+''', '''+wUser+''' ,'''+wModulo+''', '
        + ''''+wSection+''', '''+cdsUsuNo.FieldByname('USERID').AsString+''')';
   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.Filtered:=False;
   cdsBusca.DataRequest(xSQL);
   cdsBusca.Execute;

   bbtnUsuarioClick(Sender);
end;

procedure TSolMantenimiento.bbtnNoClick(Sender: TObject);
var
   xSQL : String;
begin
   if cdsUsuSi.FieldByName('USUARIOS').AsString=wUser then
      Raise Exception.Create('No se Puede Quitar Acceso al Creador');

   xSQL:='Delete From SOLREP02 '
        +'Where NOMBRE='''  +dbeNombre.Text+''' and '
        +      'USUARIO=''' +wUser         +''' and '
        +      'MODULO='''  +wModulo       +''' and '
        +      'FORMA='''   +wSection      +''' and '
        +      'USUARIOS='''+cdsUsuSi.FieldByname('USUARIOS').AsString+'''';
   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.Filtered:=False;
   cdsBusca.DataRequest(xSQL);
   cdsBusca.Execute;
   bbtnUsuarioClick(Sender);
end;

procedure TSolMantenimiento.lbCamposClickCheck(Sender: TObject);
begin
   if lbCampos.Checked[ lbCampos.ItemIndex ] then begin
//      if Copy(lbCamposReal.Items.Strings[lbCampos.ItemIndex],3,1)<>'.' then
      if Pos('.',lbCamposReal.Items.Strings[lbCampos.ItemIndex])=0 then
         cds2.FieldByName( lbCamposReal.Items.Strings[lbCampos.ItemIndex] ).Visible:=True
      else
         cds2.FieldByName( Copy(lbCamposReal.Items.Strings[lbCampos.ItemIndex], Pos('.',lbCamposReal.Items.Strings[lbCampos.ItemIndex])+1, Length(lbCamposReal.Items.Strings[lbCampos.ItemIndex])-2) ).Visible:=True;
//         cds2.FieldByName( Copy(lbCamposReal.Items.Strings[lbCampos.ItemIndex],3,Length(lbCamposReal.Items.Strings[lbCampos.ItemIndex])-2) ).Visible:=True;
   end
   else begin
//      if Copy(lbCamposReal.Items.Strings[lbCampos.ItemIndex],3,1)<>'.' then
      if Pos('.',lbCamposReal.Items.Strings[lbCampos.ItemIndex])=0 then
         cds2.FieldByName( lbCamposReal.Items.Strings[lbCampos.ItemIndex]).Visible:=False
      else
         cds2.FieldByName( Copy(lbCamposReal.Items.Strings[lbCampos.ItemIndex], Pos('.',lbCamposReal.Items.Strings[lbCampos.ItemIndex])+1, Length(lbCamposReal.Items.Strings[lbCampos.ItemIndex])-2) ).Visible:=False;
//         cds2.FieldByName( Copy(lbCamposReal.Items.Strings[lbCampos.ItemIndex],3,Length(lbCamposReal.Items.Strings[lbCampos.ItemIndex])-2) ).Visible:=False;
   end;
end;

procedure TSolMantenimiento.bbtnInicialClick(Sender: TObject);
var
  mTabla : String;
begin
   mTabla := cdsPlan.FieldByName('TABLA').AsString;

   if trim(wTabla) <> trim(mTabla) then
   begin
      Application.MessageBox ('Debe seleccionar la tabla que corresponda a informe',
                               PChar(Caption),MB_OK+MB_ICONINFORMATION);
      Exit;
   end;

   dbeNameFilt.Text := cdsPlan.FieldByName('DESCRIPTION').AsString;

   lbFiltro.Items.Clear;
   lbFiltroReal.Items.Clear;
   lbOrden.Items.Clear;
   lbOrdenReal.Items.Clear;
   seGrupo.Value:=0;
   EliminaGrupos;
   dbgFiltro.RefreshDisplay;
   wFlVista:=False;

   FiltraData( 'REFRESH' );

   dbgFiltro.Enabled := True;
   pnlFiltro.Enabled := True;
   pnlPie.Enabled    := True;
   pnlBtns.Enabled   := True;
   dbgTables.Enabled := True;

   pnlInfor.Visible := False;
end;

procedure TSolMantenimiento.dbgFiltrosRowChanged(Sender: TObject);
begin
   dbeNameFilt.Text := cdsPlan.FieldByName('DESCRIPTION').AsString;
end;

procedure TSolMantenimiento.bbtnRefClick(Sender: TObject);
var
   xSaveRecno : TBookmark;
begin
   cds1.DisableControls;
   xSaveRecno := cds1.GetBookmark;

   FAccesoRef:=TFAccesoRef.Create(Self);
   FAccesoRef.xModulo := wModulo;
   FAccesoRef.SolMantenimiento:=Self;
   With FAccesoRef Do
   Try
      ShowModal;
   Finally
      Free;
   End;

   cds1.GotoBookmark(xSaveRecno);
   cds1.FreeBookmark(xSaveRecno);
   cds1.EnableControls;
end;

procedure TSolMantenimiento.dblcCiaRepExit(Sender: TObject);
begin
   edtCiaRepDes.Text:=cdsBusca.FieldByname('CIADES').AsString;
   if edtCiaRepDes.Text='' then begin
      ShowMessage('Error : Compañía no Existe');
      dblcCiaRep.SetFocus;
   end;
end;

procedure TSolMantenimiento.ConfigurarPgina1Click(Sender: TObject);
var
  lPageSetupDlg: TppCustomPageSetupDialog;
  lFormClass: TFormClass;

begin
  if ( xReport = nil) then Exit;

  lFormClass := ppGetFormClass(TppCustomPageSetupDialog);

  lPageSetupDlg := TppCustomPageSetupDialog(lFormClass.Create(Self));
  lPageSetupDlg.Report := xReport;
  lPageSetupDlg.LanguageIndex := xReport.LanguageIndex;
  lPageSetupDlg.ShowModal;

  lPageSetupDlg.Release;

end;

procedure TSolMantenimiento.bbtnExportaClick(Sender: TObject);
begin

   pnlExporta.Left:=pnlColumna.Left+pnlColumna.Width+(Trunc(dbgFiltro.Width/2)-Trunc(pnlExporta.Width/2));

   pnlExporta.Top:=pnlFiltro.Top - pnlExporta.Height - 2;

   pbExp.Position   := 0;
   dbgFiltro.Enabled:= False;
   pnlFiltro.Enabled:= False;
   pnlPie.Enabled   := False;
   pnlBtns.Enabled  := False;
   dbgTables.Enabled:= False;
   pnlExporta.Visible:=True;
end;

procedure TSolMantenimiento.bbtnExpCancClick(Sender: TObject);
begin
   pnlExporta.Visible:=False;
   
   dbgFiltro.Enabled:= True;
   pnlFiltro.Enabled:= True;
   pnlPie.Enabled   := True;
   pnlBtns.Enabled  := True;
   dbgTables.Enabled:= True;
end;

procedure TSolMantenimiento.bbtnExpOKClick(Sender: TObject);
var
   i, xSpace, xTem : Integer;
   xBlanco, xCampo, xLinea : String;
   bmk2 : TBookMark;
begin

   if meChar.Text='' then begin
      ShowMessage('Error : Falta Separador de Columna');
      Exit;
   end;

   if not sdGraba.Execute then Exit;


   pbExp.Max:=100;
   pbExp.Position:=5;
   pnlExporta.Refresh;

   xBlanco:='                                                                      ';
   xSpace :=0;

   scFile.Lines.Clear;

   cds2.DisableControls;

   bmk2:=cds2.GetBookmark;

   cds2.Last;

   xTem:= Trunc(cds2.RecordCount/20)*2;

   pbExp.Max:=cds2.RecordCount + ( xTem*3 );

   pbExp.Position:=(xTem*2);

   pnlExporta.Refresh;

   pbExp.Position:=xTem;
   pnlExporta.Refresh;

   cds2.First;

   For i:=0 to lbCampos.Items.Count-1 do begin

       if lbCampos.Checked[ i ] then begin

          xCampo:=lbCampos.Items[ i ];

          xSpace:=cds2.FieldByName( lbCamposReal.Items[ i ] ).Size-Length( xCampo );

          xCampo:=xCampo+Copy(xBlanco,1,xSpace);

          xLinea:=xLinea+xCampo+meChar.Text;
       end;

   end;

   pbExp.Position:=pbExp.Position+xTem;
   pnlExporta.Refresh;

   scFile.Lines.Add( xLinea );

   while not cds2.Eof do begin

      xLinea:='';

      For i:=0 to lbCampos.Items.Count-1 do begin

          if lbCampos.Checked[ i ] then begin

             xCampo:=lbCamposReal.Items[ i ];

             if cds2.FieldByName( xCampo ).Size>0 then
                xSpace:=cds2.FieldByName( xCampo ).Size-
                        Length( cds2.FieldByName( xCampo ).AsString)
             else
                xSpace:=15-Length( cds2.FieldByName( xCampo ).AsString);

             xCampo:=cds2.FieldByName( xCampo ).AsString+
                     Copy(xBlanco,1,xSpace);
             xLinea:=xLinea+xCampo+meChar.Text;
          end;

      end;

      pbExp.Position:=pbExp.Position+1;
      pnlExporta.Refresh;

      scFile.Lines.Add( xLinea );
      cds2.Next;
   end;

   scFile.Lines.SaveToFile( sdGraba.FileName );

   cds2.GotoBookmark( bmk2 );
   cds2.FreeBookmark( bmk2 );

   cds2.EnableControls;

   pbExp.Position:=pbExp.Position+1;
   pnlExporta.Refresh;

   ShowMessage('Archivo Grabado');

   dbgFiltro.Enabled:= True;
   pnlFiltro.Enabled:= True;
   pnlPie.Enabled   := True;
   pnlBtns.Enabled  := True;
   dbgTables.Enabled:= True;

   pbExp.Position    :=0;
   pnlExporta.Visible:=False;

end;

procedure TSolMantenimiento.cdsPost( xxCds:TwwClientDataSet);
var
   i:integer;
begin
   for i:=0 to xxCds.Fields.Count-1 do
   begin

   	 if xxCds.Fields[i].Classtype=TStringField then
     begin
       if xxCds.Fields[i].AsString='' then xxCds.Fields[i].clear;
     end;

   	 if xxCds.Fields[i].Classtype=TMemoField then
     begin
       if xxCds.Fields[i].AsString='' then xxCds.Fields[i].AsString:='.';
     end;

   end;
end;



procedure TSolMantenimiento.dbgFiltroUpdateFooter(Sender: TObject);
begin

   if wFlSumatoria<>'N' then begin
      try
         if xContSuma=0 then
            bbtnSumaClick(Self);
         xContSuma:=xContSuma+1;
      except
      end;
   end;

end;

function TSolMantenimiento.StrZero(wNumero:String;wLargo:Integer):string;
var
   i : integer;
   s : string;
begin
   s := '';
   for i:=1 to wLargo do
   begin
      s := s+'0';
   end;
   s := s+trim(wNumero);
   result:= copy(s,length(s)-(wLargo-1),wLargo);
end;

procedure TSolMantenimiento.rgFiltroClick(Sender: TObject);
begin
   lblSub1.Visible:=False;
   lblSub2.Visible:=False;
   seIni.Visible  :=False;
   seLen.Visible  :=False;
   rgLike.Visible :=False;
   if rgFiltro.ItemIndex=6 then begin
      lblSub1.Visible:=True;
      lblSub2.Visible:=True;
      seIni.Visible  :=True;
      seLen.Visible  :=True;
   end;
   if rgFiltro.ItemIndex=7 then begin
      rgLike.Visible :=True;
   end
end;

procedure TSolMantenimiento.rgValorClick(Sender: TObject);
begin
   if rgValor.ItemIndex=1 then begin

      cbCampos.Items.Clear;
      cbCampos.Text :='';
      cbCampos.Items:=lbCampos.Items;

      cbCampos.BringToFront;
      cbCampos.left          := xCampoLeft + wCol+50;
      cbCampos.top           := xInicioCampos + wLin;
      cbCampos.Visible       := True;
   end
   else begin
      cbCampos.Visible       := False;
   end;
end;


procedure TSolMantenimiento.FiltraTablaRemoto( xxCds:TwwClientDataSet; xxArchivo, xxCampo, xxFilter : String  );
var
   xFiltro : String;
   xSQL2 : string;
begin
   xxCds.Close;
   xxCds.Filtered:=False;
   xxCds.Filter  :='';
   xxCds.IndexFieldNames:='';

   { -- Para que lea de archivos cds
   if not FileExists( wRutaCds+xxArchivo ) then
   begin
      try
         if not DirectoryExists( wRutaCds ) then
            CreateDir( wRutaCds );
      except
      end;

      xSQL2 := 'SELECT * FROM '+ xxArchivo;
      xxCds.DataRequest( xSQL2 );
      xxCds.Open;

      try
         xxCds.SaveToFile( wRutaCds+xxArchivo );
         xxCds.Close;
         xxCds.LoadFromFile( wRutaCds+xxArchivo );
      except
      end;
   end
   else
   begin
      xxCds.LoadFromFile( wRutaCds+xxArchivo );
   end;
   }

   // Para que no Lea CDS
   xSQL2 := 'SELECT * FROM '+ xxArchivo;
   xxCds.DataRequest( xSQL2 );
   xxCds.Open;

   xFiltro:=xxFilter;
   if Length(xFiltro)>0 then
   begin
      xxCds.Filter  :=xFiltro;
      xxCds.Filtered:=True;
   end;
end;

procedure TSolMantenimiento.cdsRep2ReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  Action:=HandleReconcileError( DataSet, UpdateKind, E )
end;

procedure TSolMantenimiento.bbtnCierraClick(Sender: TObject);
begin
   ShowMessage('xx');
end;

procedure TSolMantenimiento.bbtnSumaClick(Sender: TObject);
var
   xtotal : Single;
   xLenS, xLenT  : Integer;
   xSQLSum: String;
   xSumat : String;
   xSQLTmp: String;
begin

   Screen.Cursor:= crHourGlass;

   xSumat:='';
   cdsGrid.First;
   while Not cdsGrid.Eof do begin
      if cdsGrid.FieldByName('SUMATORIA').AsString='S' then
         xSumat:=xSumat+'SUM( '+wReplacCeros+'( '+cdsGrid.FieldByName('Campo').AsString+',0) ) as '+cdsGrid.FieldByName('Campo').AsString+', ';
      cdsGrid.Next;
   end;

   if wUserSQL<>'' then begin

      //xLenS:=Pos( 'ORDER BY', UpperCase( wUserSQL ) );
      xLenT:=Pos( 'SOLVISTA', SQL );
      xLenS:=Pos( 'ORDER BY', Copy(UpperCase( SQL ),xLenT, Length(SQL) ) );

      //xSQLTmp:=wUserSQL;
      xSQLTmp:=SQL;

//      xSQLTmp:=wUserSQL;
      if xLenS>0 then begin
         xSQLTmp:=Copy(xSQLTmp, 1, xLenS+xLenT-2 )
      end;

      //xSQLSum:='Select ' + xSumat + 'Count(*) as NUMREG from ( '+ wUserSQL+') A ';
      xSQLSum:='Select ' + xSumat + 'Count(*) as NUMREG from ( '+ xSQLTmp +') A ';
   end
   else begin
      if wTabla='' then
         xSQLSum:='Select ' + xSumat + 'Count(*) as NUMREG from '+cds1.FieldByName('zArchivo').AsString+' '+ xxWhereT
      else begin
         xSQLSum:='Select ' + xSumat + 'Count(*) as NUMREG from '+wTabla +' '+ xxWhereT;
      end;
   end;

   cdsBusca.Close;
   cdsBusca.Filter:='';
   cdsBusca.Filtered:=False;
   cdsBusca.DataRequest( xSQLSum );

   try
     cdsBusca.Open;
   except
      ShowMessage('Error : Al Ejecutar Sumatorias. Avise a Sistemas...');
      Screen.Cursor:=CrDefault;
      Exit;
   end;

   cdsGrid.First;
   while Not cdsGrid.Eof do begin
      wFieldName:=cdsGrid.FieldByName('Campo').AsString;
      if ( cdsGrid.FieldByName('SUMATORIA').AsString='S') then begin
         dbgFiltro.ColumnByName( cdsGrid.FieldByName('Campo').AsString ).FooterValue:=
         floattostrf( cdsBusca.FieldByName(cdsGrid.FieldByName('Campo').AsString).AsFloat, ffNumber, 10, 2);
      end;
      cdsGrid.Next;
   end;

   edtRegistros.Text:=formatfloat('###,###,###',cdsBusca.FieldByName('NUMREG').AsInteger);

   Screen.Cursor:=CrDefault;

end;


procedure TSolMantenimiento.Z2bbtnImprimeClick(Sender: TObject);
begin
{   dblcCiaRep.Clear;
   dblcCiaRep.Enabled:=True;
   dblcCiaRep.LookupField:='';
   dblcCiaRep.LookupTable:=cdsBusca;
   cdsBusca.Close;
   cdsBusca.Fields.Clear;
}
   if pnlFRegistro.Visible then Exit;

   pnlReporte.Left  :=pnlColumna.Left+pnlColumna.Width+(Trunc(dbgFiltro.Width/2)-Trunc(pnlReporte.Width/2));
   If pnlFiltro.Visible then
      pnlReporte.Top:=pnlFiltro.Top - pnlReporte.Height - 2
   else begin
      pnlReporte.Top:=pnlPie.Top - pnlReporte.Height - 2;
   end;

   pnlReporte.Visible := not pnlReporte.Visible;

   if pnlReporte.Visible then
   begin
      dbgFiltro.Enabled:= False;
      pnlFiltro.Enabled:= False;
      pnlPie.Enabled   := False;
      pnlBtns.Enabled  := False;
      dbgTables.Enabled:= False;

      if wTabla='' then
         dbgTables.Enabled := False;
   end
   else begin
      if not pnlFiltro.Visible then begin
         if wTabla='' then
            dbgTables.Enabled := True;
      end;

      dbgFiltro.Enabled:= True;
      pnlFiltro.Enabled:= True;
      pnlPie.Enabled   := True;
      pnlBtns.Enabled  := True;
      dbgTables.Enabled:= True;
   end;

   xVisPanel:=pnlReporte.Visible;

   if pnlReporte.Visible then GeneraListBox;
   if not pnlReporte.Visible then GeneraListBox;

   cdsBusca.Close;
   cdsBusca.Filter  :='';
   cdsBusca.Filtered:=False;
   cdsBusca.ProviderName:='prvBusca';
   cdsBusca.DataRequest('Select * from TGE101');
   cdsBusca.Open;

   dblcCiaRep.LookupTable:=cdsBusca;
   dblcCiaRep.LookupField:='CIAID';
   dblcCiaRep.Selected.Clear;
   dblcCiaRep.Selected.Add( 'CIAID'+#9+'5'+#9+'Id.');
   dblcCiaRep.Selected.Add( 'CIADES'+#9+'30'+#9+'Compañía');

   dblcCiaRep.Text  :=cdsBusca.FieldByname('CIAID').AsString;
   edtCiaRepDes.Text:=cdsBusca.FieldByname('CIADES').AsString;

   if cdsBusca.RecordCount<=1 then
      dblcCiaRep.Enabled:=False
   else begin
      dblcCiaRep.Enabled:=True;
   end;

   edtTitulo.Text:=fclTitulo.Caption;
end;

procedure TSolMantenimiento.Z2bbtnFiltroClick(Sender: TObject);
{var
   xHG, xHR : Integer;}
begin
   If pnlFRegistro.Visible then Exit;

   pnlFiltro.Top := pnlPie.Top - pnlFiltro.Height - 1;
   pnlFiltro.Visible := not pnlFiltro.Visible;

   If pnlReporte.Visible or pnlFiltro.Visible then
   begin
      if Trim( wTabla )='' then
         dbgTables.Enabled := False;
   end
   else begin
      if Trim( wTabla )='' then
         dbgTables.Enabled := True;
   end;

   If pnlFiltro.Visible then begin
      dbgFiltro.Align  := alNone;
      dbgFiltro.Height := dbgFiltro.Height - pnlFiltro.Height-1;
      pnlFiltro.Width  := dbgFiltro.Width;
      pnlFiltro.Left   := dbgFiltro.Left;

      bbtnCerrarF.Left := pnlFiltro.Width-bbtnCerrarF.Width-2;
      bbtnFilt.Left    := pnlFiltro.Width-bbtnFilt.Width-40;
      bbtnExporta.Left := pnlFiltro.Width-bbtnExporta.Width-40;
      edtRegistros.Left:= pnlFiltro.Width-edtRegistros.Width-30;
      lblRegistros.Left:= pnlFiltro.Width-lblRegistros.Width-30;
      pnlReporte.Top   := pnlFiltro.Top - pnlReporte.Height - 2;
      pnlReporte.Left  := pnlColumna.Left + pnlColumna.Width + (Trunc(dbgFiltro.Width/2)-Trunc(pnlReporte.Width/2));
      pnlDiseno.Top    := pnlFiltro.Top - pnlDiseno.Height - 2;
      pnlDiseno.Left   := pnlColumna.Left + pnlColumna.Width + (Trunc(dbgFiltro.Width/2)-Trunc(pnlDiseno.Width/2));
      GeneraListBox;
      end
   else begin
      dbgFiltro.Height:= dbgFiltro.Height + pnlFiltro.Height-1;
      dbgFiltro.Align := alClient;
      pnlReporte.Top  := pnlPie.Top - pnlReporte.Height - 2;
      pnlReporte.Left := pnlColumna.Left + pnlColumna.Width + (Trunc(dbgFiltro.Width/2)-Trunc(pnlReporte.Width/2));
      pnlDiseno.Top   := pnlPie.Top - pnlDiseno.Height - 2;
      pnlDiseno.Left  := pnlColumna.Left + pnlColumna.Width + (Trunc(dbgFiltro.Width/2)-Trunc(pnlDiseno.Width/2));
   end;
end;

procedure TSolMantenimiento.bbtnAccesoClick(Sender: TObject);
var
   xSaveRecno : TBookmark;
begin

   cds2.DisableControls;
   xSaveRecno := cds2.GetBookmark;

   FAcceso:=TFAcceso.Create(Self);
   FAcceso.xModulo := wModulo;
   FAcceso.SolMantenimiento := Self;
   With FAcceso Do
   Try
      ShowModal;
   Finally
      Free;
   End;

   cds2.GotoBookmark(xSaveRecno);
   cds2.FreeBookmark(xSaveRecno);
   cds2.EnableControls;
end;


procedure TSolMantenimiento.bbtnSalirClick(Sender: TObject);
begin
  Close;
end;


procedure TSolMantenimiento.eb1BeforeExpand(Sender: TObject);
var
   xSQL : String;
   xCampos1, xCampos2 : String;
   xCampo1, xCampo2 : String;
   xNVal : Integer;
begin
   {
   xSQL:='Select CIAID, TDIARID, DCPANOMM, CPNOREG, CUENTAID, DCPDH, '
        +  'CASE WHEN DCPDH=''D'' THEN DCPMOORI ELSE 0 END DEBE, '
        +  'CASE WHEN DCPDH=''H'' THEN DCPMOORI ELSE 0 END HABER '
        +'From CXP302 '
        +'Where ';
   }
   xSQL:='Select * From '+wTabla2+' where ';

   xCampos1:=wTablaLlave;
   xCampos2:=wTabla2Llave;

   xNVal:=0;

   while Length(xCampos1)>0 do
   begin
      if ( Pos(';',xCampos1)>0 ) or ( Pos(',',xCampos1)>0 ) or (Length(xCampos1)>0) then
      begin
         if ( Pos(';',xCampos1)>0 ) or ( Pos(',',xCampos1)>0 ) then
         begin
            xCampo1:=Copy( xCampos1, 1, Pos(';',xCampos1)-1 );
            xCampo2:=Copy( xCampos2, 1, Pos(';',xCampos2)-1 );
            xCampos1:=Copy( xCampos1, Pos(';',xCampos1)+1, Length(xCampos1) );
            xCampos2:=Copy( xCampos2, Pos(';',xCampos2)+1, Length(xCampos2) );
         end
         else
         begin
            xCampo1 :=Copy( xCampos1, 1, Length(xCampos1) );
            xCampo2 :=Copy( xCampos2, 1, Length(xCampos2) );
            xCampos1:='';
            xCampos2:='';
         end;

         xNVal:=xNVal+1;
         if xNVal=1 then
            xSQL:=xSQL+' '+ xCampo2+'='''+cds2.FieldByname( xCampo1 ).AsString   +''' '
         else
            xSQL:=xSQL+' and '+ xCampo2+'='''+cds2.FieldByname( xCampo1 ).AsString   +''' ';
      end;
      {
        +'Where CIAID='''   +cds2.FieldByname('CIAID').AsString   +''' '
        +  'and TDIARID=''' +cds2.FieldByname('TDIARID').AsString +''' '
        +  'and DCPANOMM='''+cds2.FieldByname('CPANOMES').AsString+''' '
        +  'and CPNOREG=''' +cds2.FieldByname('CPNOREG').AsString +'''';
       }
   end;

   cdsFiltro2.Close;
   cdsFiltro2.DataRequest( xSQL );
   cdsFiltro2.IndexFieldNames:='CIAID;TDIARID;DCPANOMM;CPNOREG';
   cdsFiltro2.Open;

   MuestraGrid2;

end;


{
procedure TSolMantenimiento.WMSysCommand(var Msg: TWMSysCommand);
begin
{
  if (Msg.CmdType = SC_MINIMIZE) or
     (Msg.CmdType = SC_MAXIMIZE) then
     ShowMessage( 'max' );
//    MessageBeep(0);
  DefaultHandler(Msg);
 }
//end;

{
procedure TSolMantenimiento.mymax(var m : TWMGETMINMAXINFO);
begin

//   m.minmaxinfo^.ptmaxsize.x      := 900;     {Width/Ancho}
//   m.minmaxinfo^.ptmaxsize.y      := 700;     {Height/Alto}
//   m.minmaxinfo^.ptmaxposition.x  := 150;     {Left/Posicion X}
//   m.minmaxinfo^.ptmaxposition.y  := 50;      {Top/Posicion Y}
//   m.minmaxinfo^.ptMinTrackSize.x := 800;     {Ancho Mínimo/Min Width}
//   m.minmaxinfo^.ptMinTrackSize.y := 600;     {Alto  Mínimo/Min Height}
//end;


procedure TSolMantenimiento.lbFiltroDblClick(Sender: TObject);
begin
   lbFiltroReal.Items.Delete(lbFiltro.ItemIndex);
   lbFiltro.Items.Delete(lbFiltro.ItemIndex);
end;

procedure TSolMantenimiento.lbOrdenDblClick(Sender: TObject);
begin
   lbOrdenReal.Items.Delete( lbOrden.ItemIndex );
   lbOrden.Items.Delete( lbOrden.ItemIndex );
end;

procedure TSolMantenimiento.FormShow(Sender: TObject);
begin
  if wTabla='' then
     dbgTables.Enabled:=True;

  if wInsertAutom then
     Z2btnActReg.OnClick( Self );
end;

procedure TSolMantenimiento.ExportaGridExcel(xDataGrid: TwwDBGrid; xFileName: String);
begin
   Screen.Cursor := crHourGlass;
   With xDataGrid, xDataGrid.ExportOptions Do
   Begin
      ExportType:= wwgetSYLK;
      FileName := xFileName+'.slk';
      Save;
      If Not (esoClipboard In Options) Then
         ShellExecute(Handle, 'Open', PChar(xDataGrid.exportoptions.Filename),
         Nil, Nil, sw_shownormal);
   End;
   Screen.Cursor := crDefault;
end;

procedure TSolMantenimiento.bbtnExcelClick(Sender: TObject);
begin
   ExportaGridExcel( dbgFiltro, 'Exporta' );
end;

procedure TSolMantenimiento.bbtnUsuariosClick(Sender: TObject);
var
   xSaveRecno : TBookmark;
begin

   cds2.DisableControls;
   xSaveRecno := cds2.GetBookmark;

   FAccesoUsu:=TFAccesoUsu.Create(Self);
   FAccesoUsu.xModulo := wModulo;
   FAccesoUsu.SolMantenimiento := Self;
   With FAccesoUsu Do
   Try
      ShowModal;
   Finally
      Free;
   End;

   cds2.GotoBookmark(xSaveRecno);
   cds2.FreeBookmark(xSaveRecno);
   cds2.EnableControls;
end;

end.

