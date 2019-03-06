unit amShell;

(*
 * Copyright © 2006 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Windows,
  Controls;

type
  Shell = class
  private
  public
    class procedure DisplayURL(const URL: string; Parent: TWinControl = nil; const AdditionalParams: string = '');
    class function DisplayFile(const Filename: string; Parent: TWinControl = nil): boolean;
    class function Execute(const Filename: string; const Parameters: string = ''; Parent: TWinControl = nil; Wait: boolean = False): boolean; overload;
    class function Execute(Parent: TWinControl; const FileName: string; const Operation: string = 'open'; const Parameters: string = ''; ShowCmd: Integer = SW_SHOWNORMAL; Wait: boolean = False): boolean; overload; static;
  end;

resourcestring
  sShellExecuteBrowseError = 'Failed to open the homepage in your default browser.'+#13#13+
    'Homepage: %s'+#13+
    'Error: %s';
  sShellExecuteFileOpenError = 'Failed to open the file.'+#13#13+
    'Filename: %s'+#13+
    'Error: %s';

implementation

uses
  ActiveX,
  ShellAPI,
  SysUtils,
  IOUtils,
  Forms,
  Dialogs,
  StrUtils,
  Classes,
  Types,
  Messages,
  IdURI,
  amCursorService,
  amDialogs;

class function Shell.DisplayFile(const Filename: string; Parent: TWinControl): boolean;
var
  Error: integer;
begin
  Result := Execute(Parent, Filename);

  if (not Result) then
  begin
    Error := GetLastError;
    MessageDlgEx(Format(sShellExecuteFileOpenError, [Filename, SysErrorMessage(Error)]), mtWarning, [mbOk], 0);
  end;
end;

class function Shell.Execute(const Filename, Parameters: string; Parent: TWinControl; Wait: boolean): boolean;
var
  Error: integer;
begin
  Result := Execute(Parent, Filename, '', Parameters, SW_SHOWNORMAL, Wait);

  if (not Result) then
  begin
    Error := GetLastError;
    MessageDlgEx(Format(sShellExecuteFileOpenError, [Filename, SysErrorMessage(Error)]), mtWarning, [mbOk], 0);
  end;
end;

class procedure Shell.DisplayURL(const URL: string; Parent: TWinControl; const AdditionalParams: string);
var
  Error: integer;
  URI: TIdURI;
  FinalURL: string;
  FinalParams: string;
  ParamList: TStringDynArray;
  s: string;
  Params: TStringList;
  n: integer;
  Name, Value: string;
begin
  try
    URI := TIdURI.Create(URL);
    try
      // Note that we use TIdURI even with no additional params as we would still like to get the original params encoded (' '->'%20').
      if (AdditionalParams <> '') then
      begin
        Params := TStringList.Create;
        try
          Params.CaseSensitive := False;

          // Create a Key/Value list of original parameters
          ParamList := SplitString(URI.Params, '&');
          for s in ParamList do
            Params.Add(s);

          // Add additional parameters, overriding the original values if there are duplicates
          ParamList := SplitString(AdditionalParams, '&');
          for s in ParamList do
          begin
            n := Pos('=', s);
            if (n <> 0) then
            begin
              // Key/Value pair
              Name := Copy(s, 1, n-1);
              Value := Copy(s, n+1, MaxInt);
              Params.Values[Name] := Value;
            end else
              // No value, just key
              Params.Values[s] := '';
          end;

          // Build parameter string
          FinalParams := '';
          for s in Params do
            if (FinalParams = '') then
              FinalParams := s
            else
              FinalParams := FinalParams + '&' + s;
        finally
          Params.Free;
        end;
        URI.Params := FinalParams;
      end;

      FinalURL := URI.URI;
    finally
      URI.Free;
    end;
  except
    on E: EIdURIException do
    begin
      s := URL;
      if (AdditionalParams <> '') then
        s := s + '(' + AdditionalParams + ')';
      MessageDlgEx(Format('Invalid URL: %s'#13'%s', [s, E.Message]), mtWarning, [mbOk], 0);
      exit;
    end;
  end;

  if (not Execute(Parent, 'rundll32.exe', 'open', 'url.dll,FileProtocolHandler '+FinalURL)) then
  begin
    Error := GetLastError;
    MessageDlgEx(Format(sShellExecuteBrowseError, [FinalURL, SysErrorMessage(Error)]), mtWarning, [mbOk], 0);
  end;
end;

class function Shell.Execute(Parent: TWinControl; const FileName, Operation, Parameters: string; ShowCmd: Integer; Wait: boolean): boolean;
var
  Handle: HWND;
  ShellExecuteInfo: TShellExecuteInfo;
  Error: integer;
  Res: Cardinal;
  Msg: TMsg;
begin
  if (Parent <> nil) then
    Handle := Parent.Handle
  else
    Handle := Application.MainForm.Handle;

  FillChar(ShellExecuteInfo, SizeOf(ShellExecuteInfo), 0);
  ShellExecuteInfo.cbSize := SizeOf(ShellExecuteInfo);
  ShellExecuteInfo.fMask := SEE_MASK_FLAG_NO_UI or SEE_MASK_HMONITOR or SEE_MASK_NOZONECHECKS;// or SEE_MASK_NOCLOSEPROCESS;
  if (Wait) then
    ShellExecuteInfo.fMask := ShellExecuteInfo.fMask or SEE_MASK_NOCLOSEPROCESS or SEE_MASK_NOASYNC;
  ShellExecuteInfo.Wnd := Handle;
  ShellExecuteInfo.hMonitor := THandle(Application.MainForm.Monitor.Handle); // Cast to avoind range check error
  if (Operation <> '') then
    ShellExecuteInfo.lpVerb := PChar(Operation);
  if (FileName <> '') then
    ShellExecuteInfo.lpFile := PChar(FileName);
  if (Parameters <> '') then
    ShellExecuteInfo.lpParameters := PChar(Parameters);
  ShellExecuteInfo.lpDirectory := PChar(TPath.GetDirectoryName(Filename));
  ShellExecuteInfo.nShow := ShowCmd;

  SaveCursor(crAppStart);

  Result := ShellAPI.ShellExecuteEx(@ShellExecuteInfo);

  if (not Result) then
  begin
    Error := GetLastError;

    if (Error = ERROR_ACCESS_DENIED) then
    begin
      // See:
      // * https://support.microsoft.com/en-us/kb/287087
      // * http://wellsr.com/vba/2016/excel/use-vba-shellexecute-to-open-url-in-default-browser/
      if (ShellAPI.ShellExecute(Handle, ShellExecuteInfo.lpVerb, ShellExecuteInfo.lpFile, ShellExecuteInfo.lpParameters, nil, CmdShow) > SE_ERR_DLLNOTFOUND) then
        Result := True
      else
        SetLastError(Error);
    end;
  end else
  if (Wait) then
  begin
    try
      while (True) do
      begin
        Res := MsgWaitForMultipleObjects(1, ShellExecuteInfo.hProcess, False, INFINITE, QS_PAINT);

        case Res of
          WAIT_OBJECT_0:
            break;

          WAIT_OBJECT_0+1:
            while (PeekMessage(Msg, 0, QS_PAINT shl 16, QS_PAINT shl 16, PM_REMOVE)) do
            begin
              if (Msg.message = WM_QUIT) then
              begin
                PostQuitMessage(Msg.wParam);
                exit;
              end;
              TranslateMessage(Msg);
              DispatchMessage(Msg);
            end;
        else
          break;
        end;
      end;
    finally
      CloseHandle(ShellExecuteInfo.hProcess);
    end;
  end;
end;

var
  NeedCoUninitialize: boolean = False;
initialization
  // ShellExecute needs CoInitialize
  NeedCoUninitialize := Succeeded(CoInitializeEx(nil, COINIT_APARTMENTTHREADED or COINIT_DISABLE_OLE1DDE));
finalization
  if (NeedCoUninitialize) then
    CoUninitialize;
end.
