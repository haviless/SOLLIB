unit GridControl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Wwdbigrd, Wwdbgrid, DB, Wwdatsrc, Grids, ControlGridDisp;

type

  TGridControl = class(TComponent)
  private
    { Private declarations }
    FColorRow,
    FColorGrid,
    FColorTitle          : TColor;
    FLines,
    FColums              : Boolean;
    FCalcCellColors : TCalcCellColorsEvent;
    FGrids               : TStrings;
    FFontGrid            : TFont;
    FFontTitle           : TFont;
    FGrid                : TwwDBGrid;
    FShowRows,
    FShowColumns         : Boolean;
    FHeight, FWidth      : Integer;
    FControlGridDisp     : TControlGridDisp;
    FForm                : TCustomForm;
    procedure ExtractValue;
  protected
    { Protected declarations }
    procedure SetGrids ( Value : TStrings );
    procedure SetForm ( Value : TCustomForm );

    procedure CalcCellColors( Sender: TObject; Field: TField;
                             State: TGridDrawState; Highlight: Boolean;
                             AFont: TFont; ABrush: TBrush); virtual;
    procedure FindGrids;
    procedure ClearGrids;
    procedure SetColorRow (Value : TColor);
    procedure SetColorGrid (Value : TColor);
    procedure SetColorTitle (Value : TColor);
    procedure SetFontGrid  (Value : TFont);
    procedure SetFontTitle  (Value : TFont);
    function  GetFontGrid : TFont;
    function  GetFontTitle : TFont;

    procedure SetControlGridDisp(Value :TControlGridDisp);
    procedure SetGrid(Value :TwwDBGrid);
    procedure SetShowRows( Value: Boolean );
    procedure SetShowColumns( Value: Boolean );
    procedure SetHeight(Value : Integer);
    procedure SetWidth(Value : Integer);
    procedure Notification(AComponent : TComponent; Operation : Toperation); override;
    procedure Loaded; override;
  public
    { Public declarations }
    property Form  : TCustomForm read FForm ;
    constructor Create(AOwner: TComponent); Override;
    destructor Destroy; Override;
  published
    { Published declarations }
    property Grid       : TwwDBGrid read FGrid write SetGrid;
    property Grids      : TStrings read FGrids write SetGrids;
    property ShowRows   : Boolean read FShowRows write SetShowRows default True;
    property ShowColumns: Boolean read FShowColumns write SetShowColumns default True;
    property ColorRow   : TColor  read FColorRow   write SetColorRow default clSilver;
    property ColorGrid  : TColor  read FColorGrid  write SetColorGrid default clWindow;
    property ColorTitle : TColor  read FColorTitle write SetColorTitle default clBtnFace;
    property FontGrid   : TFont   read GetFontGrid write SetFontGrid;
    property FontTitle  : TFont   read GetFontTitle write SetFontTitle;
    property Height     : Integer read FHeight write SetHeight;
    property Width      : Integer read FWidth write SetWidth;
    property ControlGridDisp : TControlGridDisp read FControlGridDisp write SetControlGridDisp;
    property OnCalcCellColorsEvent : TCalcCellColorsEvent read FCalcCellColors write FCalcCellColors;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('oaPck', [TGridControl]);
end;

{ TGridControl }

constructor TGridControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFontGrid            := TFont.Create;
  FFontTitle           := TFont.Create;
  FFontGrid.Color      := clWindowText;
  FFontTitle.Color     := clWindowText;
  FShowRows            := True;
  ShowColumns          := True;
  FColorRow            := clSilver;
  FColorTitle          := clBtnFace;
  FColorGrid           := clWindow;
  FGrids               := TStringList.Create;
  FGrid                := nil;
  FControlGridDisp     := nil;
  FCalcCellColors      := nil;
  FForm                := TForm(Owner);
end;

destructor TGridControl.Destroy;
begin
  FFontGrid.Free;
  FFontTitle.Free;
  ClearGrids;
  FGrids.Free;
  inherited Destroy;
end;

procedure TGridControl.SetGrids(Value: TStrings);
begin
  if Value <> Grids then
  begin
    FGrids.Assign(Value);
    FGrid := nil;
    FindGrids;
  end;
end;

procedure TGridControl.CalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
begin
  if not(csDesigning in ComponentState) then
  begin

    if not(gdSelected in State) then
    begin
       AFont.Color := clWindowText;
       if TwwDBGrid(Sender).CalcCellRow mod 2=0 then
         ABrush.Color := FColorRow
       else
         ABrush.Color := FColorGrid;
    end else
    begin
      AFont.Color  := clHighlightText;
      ABrush.Color := clHighlight;
    end;

    if (Highlight) then //(gdSelected in State) and 
    begin
      AFont.Color  := clHighlightText;
      ABrush.Color := clHighlight;
    end;

    if Assigned(FCalcCellColors) then
      FCalcCellColors(Sender, Field, State, Highlight, AFont, ABrush );
  end;
end;

procedure TGridControl.FindGrids;
var
  mGrid : TComponent;
  i     : Integer;
begin
  if FGrids=nil then Exit;
  if FForm=nil then Exit;

  for i:=0 to FGrids.Count-1 do
  begin
    mGrid := TForm(FForm).FindComponent(Grids.Strings[i]);
    if mGrid <> nil then
      if mGrid is TwwDBGrid then
      begin
         with TwwDBGrid(mGrid) do
         begin
           OnCalcCellColors := CalcCellColors;
           Color            := FColorGrid;
           TitleColor       := FColorTitle;
           Color            := FColorGrid;
           Font             := FFontGrid;
           TitleFont        := FFontTitle;

           if FShowColumns then
             Options          := Options + [dgColLines]
           else
             Options          := Options - [dgColLines];

           if FShowRows then
             Options          := Options + [dgRowLines]
           else
             Options          := Options - [dgRowLines];

         end;
      end;
  end;
end;

procedure TGridControl.SetColorGrid(Value: TColor);
begin
  if Value <> FColorGrid then
  begin
   if FGrid = nil then exit;
   FColorGrid  := Value;
   FGrid.Color := FColorGrid;
  end;

end;

procedure TGridControl.SetColorRow(Value: TColor);
begin
  if Value <> FColorRow then
  begin
    FColorRow := Value;
  end;
end;

procedure TGridControl.SetColorTitle(Value: TColor);
begin
  if Value <> FColorTitle then
  begin
   FColorTitle := Value;
   if FGrid = nil then exit;
   FGrid.TitleColor       := FColorTitle;
  end;
end;

procedure TGridControl.SetFontGrid(Value: TFont);
begin
  if Value <> FFontGrid then
  begin
    FFontGrid.Assign(Value);
    if Assigned(FGrid)  then
    begin
      FGrid.Font.Assign(FFontGrid);
    end;
  end;
end;

procedure TGridControl.SetFontTitle(Value: TFont);
begin
  if Value <> FFontTitle then
  begin
    FFontTitle.Assign(Value);
    if FGrid <> nil then
    begin
      FGrid.TitleFont.Assign(FFontTitle);
    end;
  end;
end;

procedure TGridControl.SetGrid(Value: TwwDBGrid);
begin
 FGrid := Value;
 if FGrid <> nil then
 begin
   FGrid.FreeNotification(Self);
   FGrid.OnCalcCellColors := CalcCellColors;
   FFontGrid.Assign(FGrid.Font);
   FFontTitle.Assign(FGrid.TitleFont);
   FGrid.Font             := FFontGrid;
   FGrid.TitleFont        := FFontTitle;
   FGrid.Color            := FColorGrid;
   FGrid.TitleColor       := FColorTitle;
   FWidth                 := FGrid.Width;
   FHeight                := FGrid.Height;

   if FShowColumns then
     FGrid.Options          := FGrid.Options + [dgColLines]
   else FGrid.Options       := FGrid.Options - [dgColLines];

   if FShowRows then
     FGrid.Options          := FGrid.Options + [dgRowLines]
   else FGrid.Options       := FGrid.Options - [dgRowLines];

   FGrids.Clear;
 end;
end;

procedure TGridControl.Notification(AComponent : TComponent; Operation : Toperation);
begin
  inherited Notification(AComponent,Operation);
  if (Operation=opRemove) AND (AComponent=FGrid) then
     FGrid:=nil;
  if (Operation=opRemove) AND (AComponent=FControlGridDisp) then
     FControlGridDisp:=nil;
end;

procedure TGridControl.SetShowColumns(Value: Boolean);
begin
  if FShowColumns <> Value then
  begin
    FShowColumns := Value;
   if FGrid = nil then exit;
   if FShowColumns then
      FGrid.Options          := FGrid.Options + [dgColLines]
   else
      FGrid.Options          := FGrid.Options - [dgColLines];
  end;
end;

procedure TGridControl.SetShowRows(Value: Boolean);
begin
  if FShowRows <> Value then
  begin
   FShowRows := Value;
   if FGrid = nil then exit;
   if FShowRows then
      FGrid.Options  := FGrid.Options + [dgRowLines]
   else
      FGrid.Options  := FGrid.Options - [dgRowLines];
  end;
end;

procedure TGridControl.SetHeight(Value: Integer);
begin
   if FHeight <> Value then
   begin
     FHeight := Value;
     if FGrid = nil then exit;
     if FHeight>0 then FGrid.Height := FHeight;
   end;
end;

procedure TGridControl.SetWidth(Value: Integer);
begin
   if FWidth <> Value then
   begin
     FWidth := Value;

     if FGrid = nil then exit;

     if FWidth>0 then FGrid.Width := FWidth;

   end;
end;

function TGridControl.GetFontGrid: TFont;
begin
  result := FFontGrid;
end;

function TGridControl.GetFontTitle: TFont;
begin
  result := FFontTitle;
end;

procedure TGridControl.SetControlGridDisp(Value: TControlGridDisp);
begin
 FControlGridDisp := Value;
 if FControlGridDisp <> nil then
 begin
   FControlGridDisp.FreeNotification(Self);

   ExtractValue;

   if FGrid = nil then exit;

   FGrid.Font             := FFontGrid;
   FGrid.TitleFont        := FFontTitle;

   FGrid.Color            := FColorGrid;
   FGrid.TitleColor       := FColorTitle;

   if FWidth>0 then
     FGrid.Width            := FWidth
   else
     FWidth                 := FGrid.Width;

   if FHeight>0 then
     FGrid.Height           := FHeight
   else
     FHeight                := FGrid.Height;

   if FShowRows then
      FGrid.Options  := FGrid.Options + [dgRowLines]
   else
      FGrid.Options  := FGrid.Options - [dgRowLines];

   if FShowColumns then
      FGrid.Options          := FGrid.Options + [dgColLines]
   else
      FGrid.Options          := FGrid.Options - [dgColLines];
 end;

end;

procedure TGridControl.ExtractValue;
begin
  if FControlGridDisp = nil then exit;
   FFontGrid.Assign(FControlGridDisp.FontGrid);
   FFontTitle.Assign(FControlGridDisp.FontTitle);

   FColorGrid             := FControlGridDisp.ColorGrid;
   FColorTitle            := FControlGridDisp.ColorTitle;
   FColorRow              := FControlGridDisp.ColorRow;

   FWidth                 := FControlGridDisp.Width;
   FHeight                := FControlGridDisp.Height;

   FShowRows              := FControlGridDisp.ShowRows;
   FShowColumns           := FControlGridDisp.ShowColumns;
end;

procedure TGridControl.Loaded;
begin
  inherited Loaded;
  if not(csDesigning in ComponentState)  then
  begin
    ExtractValue;
    FindGrids;
  end;
end;

procedure TGridControl.ClearGrids;
var
  mGrid : TComponent;
  i     : Integer;
begin
  if FGrids = nil then Exit;
  if FForm = nil then Exit;
  for i:=0 to FGrids.Count-1 do
  begin
    mGrid := TForm(FForm).FindComponent(Grids.Strings[i]);
    if mGrid <> nil then
      if mGrid is TwwDBGrid then
      begin
         TwwDBGrid(mGrid).OnCalcCellColors := nil;
      end;
  end;
end;

procedure TGridControl.SetForm(Value: TCustomForm);
begin
 FForm.Assign(Value);
 if Assigned(FForm) then
 begin
   FForm.FreeNotification(Self);
 end;
end;

end.
