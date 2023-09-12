(*
Plugin Name:	External import demo
Description:	Demonstrates import and use of functions in external libraries (DLLs).
Version:	1.0
Author:	Anders Melander
*)
// BOOL WINAPI MessageBeep(_In_ UINT uType);
function TestExternal(a: DWORD): BOOL; external "MessageBeep@user32.dll"; stdcall;

// int WINAPI MessageBox(_In_opt_ HWND hWnd, _In_opt_ LPCTSTR lpText, _In_opt_ LPCTSTR lpCaption, _In_ UINT uType);
function MyMessageBox(HWND: DWORD; const Text: string; const Caption: string; Kind: DWORD): DWORD; external "MessageBoxW@user32.dll"; stdcall;


TestExternal(0);
var Res := MyMessageBox(0, 'Hello world', 'Whoopey!', 3);

case Res of
  2: ShowMessage('You selected: Cancel ');
  6: ShowMessage('You selected: Yes ');
  7: ShowMessage('You selected: No ');
else
  ShowMessage('Unknown selection');
end;