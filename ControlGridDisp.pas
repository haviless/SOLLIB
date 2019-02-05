unit ControlGridDisp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TControlGridDisp = class(TComponent)
  private
    { Private declarations }
    FColorRow,
    FColorGrid,
    FColorTitle : TColor;
    FLines,
    FColums : Boolean;
    FFontGrid  : TFont;
    FFontTitle : TFont;
    FShowRows,
    FShowColumns : Boolean;
    FHeight, FWidth   : Integer;
  protected
    { Protected declarations }
    procedure SetColorRow (Value : TColor);
    procedure SetColorGrid (Value : TColor);
    procedure SetColorTitle (Value : TColor);
    procedure SetFontGrid  (Value : TFont);
    procedure SetFontTitle  (Value : TFont);
    function  GetFontGrid : TFont;
    function  GetFontTitle : TFont;

    procedure SetShowRows( Value: Boolean );
    procedure SetShowColumns( Value: Boolean );
    procedure SetHeight(Value : Integer);
    procedure SetWidth(Value : Integer);
    procedure Notification(AComponent : TComponent; Operation : Toperation); override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); Override;
    destructor Destroy; Override;
  published
    { Published declarations }
    property ShowRows    : Boolean read FShowRows write SetShowRows default True;
    property ShowColumns : Boolean read FShowColumns write SetShowColumns default True;
    property ColorRow    : TColor read FColorRow   write SetColorRow default clSilver;
    property ColorGrid   : TColor read FColorGrid  write SetColorGrid default clWindow;
    property ColorTitle  : TColor read FColorTitle write SetColorTitle default clBtnFace;
    property FontGrid    : TFont  read GetFontGrid write SetFontGrid;
    property FontTitle   : TFont  read GetFontTitle write SetFontTitle;
    property Height      : Integer read FHeight write SetHeight;
    property Width       : Integer read FWidth write SetWidth;
  end;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('oaPck', [TControlGridDisp]);
end;


constructor TControlGridDisp.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FFontGrid         := TFont.Create;
  FFontTitle        := TFont.Create;
  FFontGrid.Color   := clWindowText;
  FFontTitle.Color  := clWindowText;
  FShowRows         := True;
  ShowColumns       := True;
  FColorRow          := clSilver;
  FColorTitle        := clBtnFace;
  FColorGrid         := clWindow;
end;

destructor TControlGridDisp.Destroy;
begin
  FFontGrid.Free;
  FFontTitle.Free;
  inherited Destroy;
end;

procedure TControlGridDisp.SetColorGrid(Value: TColor);
begin
  if Value <> FColorGrid then
  begin
   FColorGrid := Value;
  end;
end;

procedure TControlGridDisp.SetColorRow(Value: TColor);
begin
  if Value <> FColorRow then
  begin
    FColorRow := Value;
  end;
end;

procedure TControlGridDisp.SetColorTitle(Value: TColor);
begin
  if Value <> FColorTitle then
  begin
    FColorTitle := Value;
  end;
end;

procedure TControlGridDisp.SetFontGrid(Value: TFont);
begin
  if Value <> FFontGrid then
  begin
    FFontGrid.Assign(Value);
  end;
end;

procedure TControlGridDisp.SetFontTitle(Value: TFont);
begin
  if Value <> FFontTitle then
  begin
    FFontTitle.Assign(Value);
  end;
end;

procedure TControlGridDisp.Notification(AComponent : TComponent; Operation : Toperation);
begin
  inherited Notification(AComponent,Operation);
//  if (Operation=opRemove) AND (AComponent=FGrid) then
//   FGrid:=nil;
end;

procedure TControlGridDisp.SetShowColumns(Value: Boolean);
begin
  if FShowColumns <> Value then
  begin
    FShowColumns := Value;
  end;
end;

procedure TControlGridDisp.SetShowRows(Value: Boolean);
begin
  if FShowRows <> Value then
  begin
    FShowRows := Value;
  end;
end;

procedure TControlGridDisp.SetHeight(Value: Integer);
begin
   if FHeight <> Value then
   begin
     FHeight := Value;
   end;
end;

procedure TControlGridDisp.SetWidth(Value: Integer);
begin
   if FWidth <> Value then
   begin
     FWidth := Value;
   end;
end;

function TControlGridDisp.GetFontGrid: TFont;
begin
  result := FFontGrid;
end;

function TControlGridDisp.GetFontTitle: TFont;
begin
  result := FFontTitle;
end;

end.



end.



