unit amIOUtils;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  IOUtils;

type
  TPathHelper = record helper for TPath
    // This fixes a bug in TPath.GetTempPath when the "long" filename is shorter than the "short" filename.
    class function GetTempPath: string; reintroduce; static;
  end;

implementation

uses
  Windows,
  SysUtils;

{ TPathHelper }

class function TPathHelper.GetTempPath: string;
var
  Len: Integer;
begin
  SetLastError(ERROR_SUCCESS);

  // get memory for the buffer retaining the temp path (plus null-termination)
  Len := Windows.GetTempPath(0, nil);
  SetLength(Result, Len - 1);
  if (Windows.GetTempPath(Len, PChar(Result)) = 0) then
    RaiseLastOSError;

  // GetLongPathName:
  // Return value = (the following, complete nonsense, is from MSDN)
  //  a) Buffer is too small: size of buffer including terminating zero.
  //  b) Buffer is large enough: size of buffer not including terminating zero.
  // Count param = Size of buffer including terminating zero.

  // Determine required size of buffer.
  Len := GetLongPathName(PChar(Result), nil, 0) - 1;

  // If result of GetLongPathName will be longer than existing string we expand the buffer.
  if (Len > Length(Result)) then
    SetLength(Result, Len);

  // Get long file name.
  Len := GetLongPathName(PChar(Result), PChar(Result), Length(Result) + 1);
  SetLength(Result, Len);
end;

end.
