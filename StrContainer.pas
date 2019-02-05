unit StrContainer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TStrContainer = class(TComponent)
  private
    { Private declarations }
    FLines : TStrings;
  protected
    { Protected declarations }
    procedure SetLines ( Value : TStrings );
    //procedure GetStrings : TStrings;

  public
    { Public declarations }
    constructor Create(AOwner: TComponent) ; override;
    destructor Destroy ; override;
  published
    { Published declarations }
    property Lines : TStrings read FLines write SetLines;

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('oaPck', [TStrContainer]);
end;

procedure TStrContainer.SetLines(Value: TStrings);
begin
  Lines.Assign(Value);
end;

constructor TStrContainer.Create(AOwner: TComponent) ;
begin
  inherited Create(AOwner);
  FLines := TStringList.Create;
end;

destructor  TStrContainer.Destroy;
begin
  inherited Destroy;
  FLines.Free;
end;


end.
