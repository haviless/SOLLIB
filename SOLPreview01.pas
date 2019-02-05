unit SOLPreview01;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppComm, ppRelatv, ppProd,
  ppReport, ppViewr, StdCtrls, Mask, ExtCtrls, Buttons, Db, Wwdatsrc,
  DBTables, Wwtable, ppDB, ppDBPipe, ppEndUsr, ppDBBDE;

type
  TFSOLPreview = class(TForm)
    pprSOL: TppReport;
  private
    { Private declarations }
  public
    { Public declarations }
    function  Execute : Boolean;
  end;

var
  FSOLPreview: TFSOLPreview;

implementation

{$R *.DFM}

function TFSOLPreview.Execute : Boolean;
begin
  try
    ppRSOL.PreviewForm.Caption:='Preview';
//    ppRSOL.Icon.LoadFromFile('\SOLLIB\Solcito.ico');
    Screen.Cursor:= crHourGlass;
    result := true;
    pprSOL.Print;
  finally
    pprSOL.Stop;
    result := False;
    Screen.Cursor:=CrDefault;
    Close;
  end;
end;


end.
