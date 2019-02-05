unit SOLPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SOLPreview01, Wwdbgrid, Wwdbigrd, ControlGridDisp, GridControl, Db, DBClient,
  wwclient, Menus, MConnect, stdctrls, ppReport;
type

  TSOLPrevio = class(TComponent)
  private
    { Private declarations }
    FOnShow      : TNotifyEvent;
    FOnActivate  : TNotifyEvent;
    FppReport    : TppReport;

  protected
    { Protected declarations }
    procedure SetppReport( Value : TppReport );

  public
    { Public declarations }
    FSOLPreview   : TFSOLPreview;

    function    Execute : Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure   Notification(AComponent : TComponent; Operation : Toperation); override;
  published
    { Published declarations }

    property ppReport  : TppReport    read FppReport   write FppReport;
    property OnShow    : TNotifyEvent read FOnShow     write FOnShow;
    property OnActivate: TNotifyEvent read FOnActivate write FOnActivate;

end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('oaPck', [TSOLPrevio]);
end;

{ TSOLPreview }

constructor TSOLPrevio.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TSOLPrevio.Destroy;
begin
  inherited Destroy;
end;

function TSOLPrevio.Execute: Boolean;
begin
  Application.CreateForm( TFSOLPreview, FSOLPreview);
  try
     if Assigned(FOnShow)     then FOnShow(Self);
     if Assigned(FOnActivate) then FOnActivate(Self);

     FSOLPreview.pprSOL:=FppReport;
     FSOLPreview.ppRSOL.ICon := FSOLPreview.Icon;

     result := FSOLPreview.Execute;
  finally

     FSOLPreview.Free;
     FSOLPreview:=Nil;
  end;
end;

procedure TSOLPrevio.Notification(AComponent : TComponent; Operation : Toperation);
begin
  inherited Notification(AComponent,Operation);
  if (Operation=opRemove) AND (AComponent=FppReport) then
     FppReport:=nil;
end;

procedure TSOLPrevio.SetppReport( Value: TppReport );
begin
  FppReport := Value;
  if FppReport <> nil then
  begin
     FppReport.FreeNotification(Self);
  end;
end;

end.
