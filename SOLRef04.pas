unit SOLRef04;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, CheckLst, Db, Wwdatsrc, DBClient,
  wwclient, ExtCtrls, Buttons, SolRef01;

type
  TFAccesoUsu = class(TForm)
    dbgUsuario: TwwDBGrid;
    cdsUsuario: TwwClientDataSet;
    dsUsuario : TwwDataSource;
    cdsAcceso : TwwClientDataSet;
    dsAcceso  : TwwDataSource;
    cdsUsuarioUSERID: TStringField;
    cdsUsuarioUSERNOM: TStringField;
    cdsUsuarioPASSWORD: TStringField;
    Panel2: TPanel;
    pnlPie: TPanel;
    bbtnGraba: TBitBtn;
    dbgData: TwwDBGrid;
    cdsData: TwwClientDataSet;
    dsData: TwwDataSource;
    lblTabla: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure dbgUsuarioRowChanged(Sender: TObject);
    procedure bbtnGrabaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    xModulo  : String;
    SolMantenimiento : TSolMantenimiento;
    xTemUser : String;
  end;

var
  FAccesoUsu  : TFAccesoUsu;
  xNCampo1 : String;
  xNCampo2 : String;
  xNCampo3 : String;
  xArchivo : String;

implementation

{$R *.DFM}

procedure TFAccesoUsu.FormActivate(Sender: TObject);
var
   xSQL : String;
begin
   cdsAcceso.RemoteServer :=DComT;
   cdsUsuario.RemoteServer:=DComT;
   cdsAcceso.Close;
   cdsAcceso.DataRequest( 'Select * from TGE004' );
   cdsAcceso.Open;

   xSQL:='SELECT A.USERID, A.USERNOM, C.MODULOID, '' '' password '
        +'FROM TGE006 A, TGE007 B, TGE001 C '
        +'WHERE A.USERID=B.USERID(+) '
        + ' AND B.GRUPOID=C.GRUPOID(+) AND MODULOID=''CNT'' '
        + ' AND ((FECEXP IS NULL AND FECFIN_PWD IS NULL) OR (TO_DATE(SYSDATE)<FECFIN_PWD )) '
        +'GROUP BY A.USERID, A.USERNOM, C.MODULOID '
        +'ORDER BY A.USERID';
   cdsUsuario.Close;
   cdsUsuario.DataRequest( xSQL );
   cdsUsuario.Open;

   dbgUsuarioRowChanged(Sender);
end;

procedure TFAccesoUsu.dbgUsuarioRowChanged(Sender: TObject);
var
   xNC, xCLB : Integer;
   xVarAc    : String;
   xDesc1, xDesc2 : String;
begin

//   if clbAcceso. Tag>0 then
//      bbtnGrabaClick( Self );

   xTemUser := cdsUsuario.FieldByName('UserId').AsString;

   with SOLMAntenimiento do begin
      lblTabla.Caption:=cds1.FieldByName('Descrip').AsString;
      lblTabla.Refresh;

      xNC := 0;
      xNCampo1 := '';
      xNCampo2 := '';
      cdsGrid.First;
      while not cdsGrid.Eof do begin
         if cdsGrid.FieldByName('Detalle').Value='C' then begin
            xNC := xNC + 1;
            xNCampo1 := cdsGrid.FieldByName('Campo').asstring;
            xDesc1   := cdsGrid.FieldByName('DetDBGTitle').asstring;
         end;
         if cdsGrid.FieldByName('Detalle').Value='S' then begin
            xNC := xNC + 1;
            xNCampo2 := cdsGrid.FieldByName('Campo').asstring;
            xDesc2   := cdsGrid.FieldByName('DetDBGTitle').asstring;
         end;
         If xNC=2 then cds2.Last;
         cdsGrid.Next;
      end;

      if xNC=0 then begin
         cdsGrid.First;
         while not cdsGrid.Eof do begin
            if cdsGrid.FieldByName('Flag').AsString<>'S' then begin
               xNC := xNC + 1;
               case xNC of
                 1 : begin
                     xNCampo1 := cdsGrid.FieldByName('Campo').asstring;
                     xDesc1   := cdsGrid.FieldByName('DetDBGTitle').asstring;
                     end;
                 2 : begin
                     xNCampo2 := cdsGrid.FieldByName('Campo').asstring;
                     xDesc2   := cdsGrid.FieldByName('DetDBGTitle').asstring;
                     end;
               end;
            end;
            If xNC=2 then cds2.Last;
            cdsGrid.Next;
         end;
      end;

      dbgData.Selected.Clear;
      dbgData.Selected.Add( 'CHK'+#9+'3'+#9+'[x]');
      dbgData.Selected.Add( xNCampo1+#9+'15'+#9+xDesc1);
      dbgData.Selected.Add( xNCampo2+#9+'20'+#9+xDesc2);
      dbgData.SetControlType( 'CHK',fctCheckBox,'S;N' );

      cdsData.Close;
      cdsData.FieldDefs.Clear;
      cdsData.FieldDefs.Add( 'CHK' , ftString,  1, False );
      cdsData.FieldDefs.Add( xNCampo1, ftString, 15, False );
      cdsData.FieldDefs.Add( xNCampo2, ftString, 15, False );
      cdsData.CreateDataSet;
      cdsData.Open;
      cdsData.EmptyDataSet;

      cds2.First;
      while not cds2.Eof do begin
         cdsData.Insert;
         cdsData.FieldByName('CHK').AsString:='';
         cdsData.FieldByName(xNCampo1).AsString:=cds2.FieldByname(xNCampo1).AsString;
         cdsData.FieldByName(xNCampo2).AsString:=cds2.FieldByName(xNCampo2).AsString;
         cds2.Next;
      end;
      cdsData.IndexFieldNames:=xNCampo1;

      xArchivo := cds1.FieldByname('ZArchivo').AsString;
      cdsAcceso.Filtered:= False;
      cdsAcceso.Filter  := 'MODULOID='+''''+xModulo+''''+' and '+
                           'USERID='  +''''+cdsUsuario.FieldByName('UserId').AsString+''''+' and '+
                           'NTABLA='  +''''+xArchivo+'''';
      cdsAcceso.Filtered:= True;

      if cdsAcceso.RecordCount>0 then
      begin
         while not cdsAcceso.Eof do
         begin
            cdsData.SetKey;
            cdsData.FieldByName(xNCampo1).AsString:=cdsAcceso.FieldByname('CODIGO').AsString;
            if cdsData.GotoKey then
            begin
               cdsData.Edit;
               cdsData.FieldByName('CHK').AsString:='S'
            end;
            cdsAcceso.Next;
         end;
      end;
      cdsData.First;
   end;
end;

procedure TFAccesoUsu.bbtnGrabaClick(Sender: TObject);
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
          cdsAcceso.FieldByName('MODULOID').AsString:= xModulo;
          cdsAcceso.FieldByName('USERID').AsString  := xTemUser;
          cdsAcceso.FieldByName('NTABLA').AsString  := xArchivo;
          cdsAcceso.FieldByName('CODIGO').AsString  := cdsdata.FieldByName( xNCampo1 ).AsString;
          cdsAcceso.Post;
       end;
       cdsdata.Next;
   end;

   cdsAcceso.ApplyUpdates( 0 );
   cdsdata.First;
   
end;

procedure TFAccesoUsu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   cdsAcceso.Active := False;
   cdsUsuario.Active:= False;
end;

end.


