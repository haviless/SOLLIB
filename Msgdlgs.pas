unit MsgDlgs;

interface
uses {$IFDEF Win32} Forms, Windows, Registry, ShellAPI, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  Messages, Classes, Graphics, SysUtils;

function  MsgBox      (const aTitle,aMsg: String; aFlag: Integer): Integer;

function  Question    (const aTitle : String;const Msg: String):Boolean;
procedure Information (const aTitle : String;const Msg: String);
procedure ErrorMsg    (const aTitle : String;const Msg: String);
function  ErrorRC     (const aTitle : String;const Msg: String):Boolean;
function  ErrorARI    (const aTitle : String;const Msg: String):Word;
function  Confirmation(const aTitle : String;const Msg: String):Word;

implementation

const
  mrABORT   :Word=3;
  mrCANCEL  :Word=2;
  mrIGNORE  :Word=5;
  mrNO      :Word=7;
  mrOK      :Word=1;
  mrRETRY   :Word=4;
  mrYES     :Word=6;

function MsgBox(const aTitle,aMsg: String; aFlag: Integer): Integer;
var
  ActiveWindow : hWnd;
  WindowList   : Pointer;
  TmpA         : array[0..200] of char;
  TmpB         : array[0..100] of char;
begin
  ActiveWindow:=GetActiveWindow;
  WindowList:= DisableTaskWindows(0);
  try
    StrPCopy(TmpB,aTitle);
    StrPCopy(TmpA,aMsg);
    Result:=Windows.MessageBox(Application.Handle, TmpA, TmpB, aFlag);
  finally
    EnableTaskWindows(WindowList);
    SetActiveWindow(ActiveWindow);
  end;
end;

function Question(const aTitle : String;const Msg: String):Boolean;
begin
    Result:=MsgBox(aTitle,Msg, MB_ICONQUESTION or MB_YESNO)=IDYES
end;

procedure Information(const aTitle : String;const Msg: String);
begin
    MsgBox(aTitle, Msg, MB_ICONINFORMATION or MB_OK )
end;

procedure ErrorMsg(const aTitle : String;const Msg: String);
begin
   MsgBox(aTitle, Msg, MB_ICONERROR or MB_OK )
end;

function ErrorRC(const aTitle : String;const Msg: String):Boolean;
begin
   Result:=MsgBox(aTitle,Msg, MB_ICONEXCLAMATION or MB_RETRYCANCEL)=IDRETRY
end;

function  ErrorARI(const aTitle : String;const Msg: String):Word;
begin
  case MsgBox(aTitle,Msg, MB_ICONWARNING or MB_ABORTRETRYIGNORE)of
     IDABORT : Result := mrAbort;
     IDRETRY : Result := mrRetry;
     IDIGNORE: Result := mrIgnore;
     else      Result := mrIgnore;
  end;
end;

function Confirmation(const aTitle : String; const Msg: String): Word;
begin
  case MsgBox(aTitle,Msg,MB_ICONQUESTION or MB_YESNOCANCEL) of
    IDYES    : Result := mrYes;
    IDNO     : Result := mrNo;
    IDCANCEL : Result := mrCancel;
    else       Result := mrCancel;
  end
end;

end.
