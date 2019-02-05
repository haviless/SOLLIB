unit SOLRef03;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc, DBClient, wwclient, StdCtrls,
  Buttons, CheckLst, ExtCtrls, SolRef01;

type
  TFAccesoRef = class(TForm)
    Panel2: TPanel;
    pnlPie: TPanel;
    bbtnGraba: TBitBtn;
    cdsUsuario: TwwClientDataSet;
    cdsAcceso: TwwClientDataSet;
    cdsAccesoMODULOID: TStringField;
    cdsAccesoUSERID: TStringField;
    cdsAccesoNTABLA: TStringField;
    dsAcceso: TwwDataSource;
    dsUsuario: TwwDataSource;
    dbgUsuario: TwwDBGrid;
    cdsData: TwwClientDataSet;
    dsData: TwwDataSource;
    lblTabla: TLabel;
    dbgData: TwwDBGrid;
    procedure FormActivate(Sender: TObject);
    procedure dbgUsuarioRowChanged(Sender: TObject);
    procedure bbtnGrabaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    xModulo  : String;
    SolMantenimiento : TSolMantenimiento;
    xTemUser : String;
  end;

var
  FAccesoRef: TFAccesoRef;
  xArchivo : String;

implementation

{$R *.DFM}

procedure TFAccesoRef.FormActivate(Sender: TObject);
begin
   cdsAcceso.RemoteServer :=DComT;
   cdsUsuario.RemoteServer:=DComT;
   cdsAcceso.Close;
   cdsAcceso.DataRequest( 'Select * from TGE005' );
   cdsAcceso.Open;

   cdsUsuario.Close;
   cdsUsuario.DataRequest( 'Select * from TGE006' );
   cdsUsuario.Open;

   dbgUsuarioRowChanged(Sender);
end;

procedure TFAccesoRef.dbgUsuarioRowChanged(Sender: TObject);
var
   xCLB : Integer;
   xSaveRecno : TBookmark;
begin
   {
   if clbAcceso.Tag>0 then
      bbtnGrabaClick( Self );
   }
   xTemUser := cdsUsuario.FieldByName('UserId').AsString;

   with SOLMAntenimiento do begin

      lblTabla.Caption:=cds1.FieldByName('Descrip').AsString;
      lblTabla.Refresh;

      dbgData.Selected.Clear;
      dbgData.Selected.Add( 'CHK'+#9+'3'+#9+'[x]');
      dbgData.Selected.Add( 'ZARCHIVO'+#9+'10'+#9+'Archivo');
      dbgData.Selected.Add( 'DESCRIP' +#9+'25'+#9+'Nombre' );
      dbgData.SetControlType( 'CHK',fctCheckBox,'S;N' );

      cdsData.Close;
      cdsData.FieldDefs.Clear;
      cdsData.FieldDefs.Add( 'CHK' , ftString,  1, False );
      cdsData.FieldDefs.Add( 'ZARCHIVO', ftString, 15, False );
      cdsData.FieldDefs.Add( 'DESCRIP',  ftString, 15, False );
      cdsData.CreateDataSet;
      cdsData.Open;
      cdsData.EmptyDataSet;

      cds1.DisableControls;
      xSaveRecno:=cds1.GetBookmark;
      cds1.First;
      while not cds1.Eof do begin
         cdsData.Insert;
         cdsData.FieldByName('CHK').AsString:='';
         cdsData.FieldByName('ZARCHIVO').AsString:=cds1.FieldByname('ZARCHIVO').AsString;
         cdsData.FieldByName('DESCRIP' ).AsString:=cds1.FieldByName('DESCRIP').AsString;
         cds1.Next;
      end;
      cds1.GotoBookmark(xSaveRecno);
      cds1.FreeBookmark(xSaveRecno);
      cds1.EnableControls;
      cdsData.IndexFieldNames:='ZARCHIVO';

      cdsAcceso.Filtered:= False;
      cdsAcceso.Filter  := 'MODULOID='+''''+xModulo+''''+' and '+
                           'USERID='  +''''+cdsUsuario.FieldByName('UserId').AsString+'''';
      cdsAcceso.Filtered:= True;

      if cdsAcceso.RecordCount>0 then
      begin
         while not cdsAcceso.Eof do
         begin
            cdsData.SetKey;
            cdsData.FieldByName('ZARCHIVO').AsString:=cdsAcceso.FieldByname('NTABLA').AsString;
            if cdsData.GotoKey then
            begin
               cdsData.Edit;
               cdsData.FieldByName('CHK').AsString:='S'
            end;
            cdsAcceso.Next;
         end;
      end;
   end;
end;

procedure TFAccesoRef.bbtnGrabaClick(Sender: TObject);
var
   xCLB      : Integer;
begin
   cdsAcceso.First;
   while not cdsAcceso.Eof do begin
      cdsAcceso.Delete;
      cdsAcceso.First;
   end;

   cdsdata.First;
   while not cdsdata.Eof do
   begin
       If cdsdata.FieldByName('CHK').AsString='S' then
       begin
          cdsAcceso.Insert;
          cdsAcceso.FieldByName('ModuloId').Value:=xModulo;
          cdsAcceso.FieldByname('Userid').Value  :=xTemUser;
          cdsAcceso.FieldByName('NTabla').Value  :=cdsdata.FieldByName( 'ZARCHIVO' ).AsString;
          cdsAcceso.Post;
       end;
       cdsdata.Next;
   end;

   cdsAcceso.ApplyUpdates( 0 );

end;

end.
