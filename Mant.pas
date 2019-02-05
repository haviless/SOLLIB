unit Mant;
// 17 de Setiembre del 2003
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SOLRef01, Wwdbgrid, Wwdbigrd, ControlGridDisp, GridControl, Db, DBClient,
  wwclient, Menus, MConnect, stdctrls, SConnect;
type

  TOnEdit  = procedure ( Sender : TObject ; MantFields : TFields ) of Object;
  TOnDelete= procedure ( Sender : TObject ; MantFields : TFields) of Object;
  TOnCierra= procedure ( Sender : TObject );

  TMant = class(TComponent)
  private
    { Private declarations }
    FOnShow       : TNotifyEvent;
    FOnActivate   : TNotifyEvent;
    FOnInsert     : TNotifyEvent;
    FOnCierra     : TNotifyEvent;
    FOnCreateMant : TNotifyEvent;
    FOnDestroyMant: TNotifyEvent;

    FOnEdit       : TOnEdit;
    FOnDelete     : TOnDelete;

    FPopupMenu   : TPopupMenu;
    FModule      : String;
    FTableName   : String;
    FTabla2      : String;
    FTablaLLave  : String;
    FTabla2LLave : String;
    FTabla2Order : String;
    FAdmin       : String;
    FUser        : String;
    FTipo        : String;
    FFilter      : String;
    FTabla2Filter: String;
    FFilterObliga: Boolean;
    FInsertAutom : Boolean;
    FTitulo      : String;
    FColors      : TStrings;
    FNoVisible   : TStrings;
    FUserCheckB  : TStrings;
    FUsuarioSQL  : TStrings;
    FTiTuloFont  : TFont;
    FGrupoCols   : Integer;
    FNivel       : Integer;
    FRegistros   : Integer;

    FFileNameIni : string;
    FSectionName : string;

    FMultiColorRows,
    FMultiSelect : Boolean;
    FControlGridDisp     : TControlGridDisp;
    FwwClientDataSet     : TwwClientDataSet;
    FDComC               : TSocketConnection;

  protected
    { Protected declarations }
    procedure SetPopupMenu ( value : TPopupMenu );
    procedure SetControlGridDisp(Value :TControlGridDisp);
    procedure SetwwClientDataSet(Value :TwwClientDataSet);
    procedure SetDCOMC(Value :TSocketConnection);
    procedure SetColors(Value: TStrings);
    procedure SetNoVisible(Value: TStrings);
    procedure SetUserCheckB(Value: TStrings);
    procedure SetUsuarioSQL(Value: TStrings);
    procedure SetTituloFont (Value : TFont);
    function  GetTituloFont : TFont;

  public
    { Public declarations }
    FMant   : TSolMantenimiento;
    ComboBox: TCustomComboBox;

    procedure SetFilter(sFilter2 : String);
//    property  User : String read FUser write FUser;
    procedure NewQuery;
    procedure RefreshFilter;
    procedure RefreshDisplay;
    function  Execute : Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Notification(AComponent : TComponent; Operation : Toperation); override;
    procedure GridDblClick ( Sender : TObject );
    procedure GridAdiciona ( Sender : TObject );
    procedure GridDelete(Sender:TObject; var Key: Word; Shift: TShiftState);
    procedure SaveFileIni;
    procedure LoadFileIni;
  published
    { Published declarations }

    property MultiColorRows: Boolean  read FMultiColorRows write FMultiColorRows;
    property Module        : String   read FModule         write FModule;
    property TableName     : String   read FTableName      write FTableName;
    property Admin         : String   read FAdmin          write FAdmin;
    property Filter        : String   read FFilter         write FFilter;
    property Tabla2Filter  : String   read FTabla2Filter   write FTabla2Filter;
    property FilterObliga  : Boolean  read FFilterObliga   write FFilterObliga;
    property InsertAutom   : Boolean  read FInsertAutom    write FInsertAutom;
    property Titulo        : String   read FTitulo         write FTitulo;
    property User          : String   read FUser           write FUser;
    property Tipo          : String   read FTipo           write FTipo;
    property GrupoCols     : Integer  read FGrupoCols      write FGrupoCols;
    property Registros     : Integer  read FRegistros      write FRegistros;
    property Nivel         : Integer  read FNivel          write FNivel;
    property TituloFont    : TFont    read GetTituloFont   write SetTituloFont;
    property Colors        : TStrings read FColors         write SetColors;
    property NoVisible     : TStrings read FNoVisible      write SetNoVisible;
    property UserCheckB    : TStrings read FUserCheckB     write SetUserCheckB;
    property FileNameIni   : string   read FFileNameIni    write FFileNameIni;
    property SectionName   : string   read FSectionName    write FSectionName;
    property UsuarioSQL    : TStrings read FUsuarioSQL     write SetUsuarioSQL;
    property TablaLlave    : String   read FTablaLLave     write FTablaLlave;
    property Tabla2        : String   read FTabla2         write FTabla2;
    property Tabla2Llave   : String   read FTabla2LLave    write FTabla2Llave;
    property Tabla2Order   : String   read FTabla2Order    write FTabla2Order;

    property PopupMenu     : TPopupMenu       read FPopupMenu       write SetPopupMenu;
    property MultiSelect   : Boolean          read FMultiSelect     write FMultiSelect;
    property ControlGridDisp:TControlGridDisp read FControlGridDisp write SetControlGridDisp;
    property ClientDataSet : TwwClientDataSet read FwwClientDataSet write SetwwClientDataSet;
    property DComC         : TSocketConnection  read FDComC           write SetDComC;
    property OnInsert      : TNotifyEvent     read FOnInsert        write FOnInsert;
    property OnEdit        : TOnEdit          read FOnEdit          write FOnEdit;
    property OnCierra      : TNotifyEvent     read FOnCierra        write FOnCierra;
    property OnShow        : TNotifyEvent     read FOnShow          write FOnShow;
    property OnActivate    : TNotifyEvent     read FOnActivate      write FOnActivate;
    property OnDelete      : TOnDelete        read FOnDelete        write FOnDelete;
    property OnCreateMant  : TNotifyEvent     read FOnCreateMant    write FOnCreateMant;
    property OnDestroyMant : TNotifyEvent     read FOnDestroyMant   write FOnDestroyMant;

end;
  TComboBoxStrings = class(TStrings);

procedure Register;

implementation


procedure Register;
begin
  RegisterComponents('oaPck', [TMant]);
end;

{ TMant }

constructor TMant.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOnInsert := nil;
  FOnEdit   := nil;
  FOnCierra := nil;
  FOnDelete := nil;
  FControlGridDisp  := nil;
  FColors    := TStringList.Create;
  FNoVisible := TStringList.Create;
  FUserCheckB:= TStringList.Create;
  FUsuarioSQL:= TStringList.Create;

  // Font del Titulo
  FTituloFont:= TFont.Create;
  FTituloFont.Size := 20;
  FTituloFont.Style:= FTituloFont.Style + [fsBold];
  FTituloFont.Name := 'Comic Sans MS';
  FTituloFont.Color:= clNavy;
end;

destructor TMant.Destroy;
begin
  inherited Destroy;
  FColors.Free;
  FNoVisible.Free;
  FUserCheckB.Free;
  FTituloFont.Free;
  FUsuarioSQL.Free;
end;

function TMant.Execute: Boolean;
begin
  Application.CreateForm( TSolMantenimiento, FMant );

  FMant.Left:=220;
  FMant.Top :=100;

  if Tipo='HELP' then
  begin
     FMant.FormStyle:=fsNormal;
     FMant.Visible  :=False;
  end
  else
     FMant.FormStyle:=fsMDIChild;

  try
    if Assigned(OnCreateMant) then
        OnCreateMant(Self);

    with FMant do
    begin
       if Assigned(FControlGridDisp) then
       begin
          grdCtrl.ControlGridDisp := FControlGridDisp;
          grdCtrl.FontGrid        := ControlGridDisp.FontGrid;
          grdCtrl.ColorTitle      := ControlGridDisp.ColorTitle;
          grdCtrl.ColorGrid       := ControlGridDisp.ColorGrid;
          grdCtrl.ColorRow        := ControlGridDisp.ColorRow;
          grdCtrl.Width           := ControlGridDisp.Width;
          grdCtrl.Height          := ControlGridDisp.Height;
          grdCtrl.ShowRows        := ControlGridDisp.ShowRows;
          grdCtrl.ShowColumns     := ControlGridDisp.ShowColumns;
       end;

       if FTableName='' then
       begin
         Caption := 'Parámetros';
         Z2btnActReg.Enabled  :=True;
         dbgFiltro.OnDblClick :=dbgFiltroDblClick;
         dbgFiltro.OnKeyDown  :=dbgFiltroKeyDown;
         pnlFiltro.Align      :=alNone;
         dbgTables.Visible    :=True;
         dbgTables.Width      :=178;
         pnlColumna.Visible   :=True;
         Z2bbtnImprime.Visible:=True;
         bbtnDiseno.Visible   :=False;
         seGrupo.Visible      :=False;
         bbtnGrupos.Visible   :=False;
         Label12.Visible      :=False;
         clbRepD.Visible      :=False;
       end
       else begin
         Caption := 'Consulta';
         Z2btnActReg.Enabled:= False;
         dbgFiltro.OnDblClick :=nil;
         dbgFiltro.OnKeyDown  :=nil;
         pnlFiltro.left       :=1;
         pnlFiltro.Width      :=dbgFiltro.Width;
         dbgTables.Visible    :=False;
         pnlColumna.Visible   :=False;
         Z2bbtnImprime.Visible:=False;
         bbtnDiseno.Visible   :=True;
         seGrupo.Visible      :=True;
         bbtnGrupos.Visible   :=True;
         Label12.Visible      :=True;
         clbRepD.Visible      :=True;
       end;

       if Assigned(FOnInsert) then
       begin
          Z2btnActReg.Enabled := True;
          dbgFiltro.OnKeyDown := dbgFiltroKeyDown;
          Z2btnActReg.OnClick := GridAdiciona;
//          Z2btnActReg.OnClick := FOnInsert;
       end;

       if Assigned(FOnEdit) then
       begin
         dbgFiltro.Enabled    := True;
         dbgFiltro.OnDblClick := GridDblClick;
       end;

       bbtnCierra.OnClick:=OnCierra;

       if FTableName='' then
       else begin
          dbgFiltro.OnKeyDown  := nil;
       end;
       if Assigned(FOnDelete) then
       begin
         dbgFiltro.Enabled    := True;
         dbgFiltro.OnKeyDown  := GridDelete;
       end;

    end;

     if Assigned(FOnShow)     then FOnShow(Self);
     if Assigned(FOnActivate) then FOnActivate(Self);

     FMant.Titulo       := FTitulo;
     FMant.Colors       := FColors;
     FMant.TituloFont   := FTituloFont;
     FMant.NoVisible    := FNoVisible;
     FMant.UserCheckB   := FUserCheckB;
     FMant.GrupoCols    := FGrupoCols;
     FMant.Registros    := FRegistros;
     FMant.seGrupo.Value:= FGrupoCols;
     FMant.UsuarioSQL   := FUsuarioSQL;
     FMant.FilterObliga := FFilterObliga;
     FMant.FInsertAutom := FInsertAutom;
     FMant.wTabla2      := FTabla2;
     FMant.wTabla2LLave := FTabla2LLave;
     FMant.wTabla2Order := FTabla2Order;
     FMant.wTablaLLave  := FTablaLLave;

     if FPopupMenu<>nil then
       FMant.dbgFiltro.PopupMenu.Assign(FPopupMenu)
     else
       FMant.dbgFiltro.PopupMenu := nil;

     if FMultiSelect then
     begin
        FMant.dbgFiltro.Options  := FMant.dbgFiltro.Options + [ dgMultiSelect, dgAlwaysShowSelection]; //
        FMant.dbgFiltro.MultiSelectOptions := [msoShiftSelect, msoAutoUnSelect];
     end
     else begin
        FMant.dbgFiltro.Options  := FMant.dbgFiltro.Options - [dgMultiSelect, dgAlwaysShowSelection]; // , dgRowSelect
        FMant.dbgFiltro.MultiSelectOptions := [];
     end;

     if Assigned(FControlGridDisp) then
     begin
        FMant.dbgFiltro.Font     := ControlGridDisp.FontGrid;
        FMant.dbgFiltro.TitleFont:= ControlGridDisp.FontTitle;
     end;

     if FMultiColorRows then
     begin
        FMant.grdCtrl.Grid := FMant.dbgFiltro;
        FMant.dbgFiltro.FooterColor:= FMant.dbgFiltro.TitleColor;
     end
     else begin
        FMant.grdCtrl.Grid := nil;
        FMant.grdCtrl.Grids.Clear;
     end;

     if (FFileNameIni<>'') then
        if not FileExists(FFileNameIni) then
        begin
           FMant.dbgFiltro.IniAttributes.Enabled := True;
           FMant.dbgFiltro.IniAttributes.SaveToRegistry := False;
           FMant.dbgFiltro.IniAttributes.FileName := FFileNameIni;
           FMant.dbgFiltro.IniAttributes.SectionName := FSectionName;
        end;
 {
     FMant.Left:=220;
     FMant.Top :=100;
     }
     //FMant.Position   := poScreenCenter;
     //FMant.WindowState:= wsMaximized;
     //FMant.Align      := alClient;

     result := FMant.Execute( FTableName,   FModule,
                              FAdmin,       FTipo,     FUser,
                              FFilter,      FTabla2Filter,
                              FFileNameIni, FSectionName,
                              FwwClientDataSet,
                              FDComC );
  finally
     {
     if Assigned(OnDestroyMant) then
        OnDestroyMant(Self);
     FMant.ppdFiltro.Free;
     FMant.Destroy;
     FMant:=Nil;
     }
  end;
end;

procedure TMant.SetTituloFont(Value: TFont);
begin
  if Value <> FTituloFont then
  begin
    FTituloFont.Assign(Value);
  end;
end;

function TMant.GetTituloFont: TFont;
begin
  result := FTituloFont;
end;

procedure TMant.SetColors(Value: TStrings);
begin
  Colors.Assign(Value);
end;

procedure TMant.SetNoVisible(Value: TStrings);
begin
  NoVisible.Assign(Value);
end;

procedure TMant.SetUserCheckB(Value: TStrings);
begin
  UserCheckB.Assign(Value);
end;

procedure TMant.SetUsuarioSQL(Value: TStrings);
begin
  UsuarioSQL.Assign(Value);
end;

procedure TMant.SetPopupMenu(value: TPopupMenu);
begin
 FPopupMenu := Value;
 if FPopupMenu <> nil then
 begin
   FPopupMenu.FreeNotification(Self);
 end;
end;

procedure TMant.SetControlGridDisp(Value: TControlGridDisp);
begin
 FControlGridDisp := nil;
 FControlGridDisp := Value;
 if FControlGridDisp <> nil then
 begin
   FControlGridDisp.FreeNotification(Self);
 end;
end;

procedure TMant.Notification(AComponent : TComponent; Operation : Toperation);
begin
  inherited Notification(AComponent,Operation);
  if (Operation=opRemove) AND (AComponent=FControlGridDisp) then
     FControlGridDisp:=nil;
  if (Operation=opRemove) AND (AComponent=FwwClientDataSet) then
     FwwClientDataSet:=nil;
end;

procedure TMant.SetwwClientDataSet(Value: TwwClientDataSet);
begin
 FwwClientDataSet := Value;
 if FwwClientDataSet <> nil then
 begin
   FwwClientDataSet.FreeNotification(Self);
 end;
end;

procedure TMant.SetDCOMC(Value :TSocketConnection);
begin
 FDComC := Value;
 if FDComC <> nil then
 begin
   FDComC.FreeNotification(Self);
 end;
end;

procedure TMant.RefreshFilter;
begin
  if Assigned(FMant) then
  begin
     if FMant.wPacketData=0 then
        FMant.wPacketData:=30;

     FMant.FiltraData( 'REFRESH' );
  end;
end;

procedure TMant.RefreshDisplay;
begin
  if FMant.cds2.RecordCount>0 then
     FMant.dbgFiltro.DataSource:=FMant.ds2;

  if Assigned(FMant) then
  begin
    FMant.MuestraGrid;
  end;
end;

procedure TMant.SetFilter (sFilter2 : String);
begin
  if Assigned(FMant) then
  begin
    FMant.wFilter2 := sFilter2;
    FMant.FiltraData( 'REFRESH' );
  end;
end;

procedure TMant.GridAdiciona(Sender: TObject);
begin
  FOnInsert( Self );
end;

procedure TMant.GridDblClick(Sender: TObject);
begin
  FOnEdit( Self, Fmant.cds2.Fields);
end;

procedure TMant.GridDelete(Sender:TObject; var Key: Word; Shift: TShiftState);
begin
   if (key=VK_Delete) and (ssCtrl in Shift) then
      FOnDelete( Self, FMant.cds2.Fields);
end;

procedure TMant.LoadFileIni;
begin
end;

procedure TMant.SaveFileIni;
begin
end;

procedure TMant.NewQuery;
begin
   if FMant.wPacketData=0 then
      FMant.wPacketData:=30;

   FMant.ds1DataChange( Self, nil );
end;

end.
