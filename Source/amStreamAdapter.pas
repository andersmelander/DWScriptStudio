unit amStreamAdapter;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Classes;

// -----------------------------------------------------------------------------
//
//              TFixedStreamAdapter
//
// -----------------------------------------------------------------------------
// Same as TStreamAdapter but handles EOutOfMemory and EAbort properly.
// This is not the same class as the one of the same name in DragDropFormats.pas
// -----------------------------------------------------------------------------
type
  TFixedStreamAdapter = class(TStreamAdapter)
  public
    function Write(pv: Pointer; cb: FixedUInt; pcbWritten: PFixedUInt): HResult; override; stdcall;
    function Read(pv: Pointer; cb: FixedUInt; pcbRead: PFixedUInt): HResult; override; stdcall;
  end;


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  Windows,
  ActiveX,
  SysUtils;

// -----------------------------------------------------------------------------

function TFixedStreamAdapter.Read(pv: Pointer; cb: FixedUInt; pcbRead: PFixedUInt): HResult;
var
  NumRead: Longint;
begin
  try
    if (pv = nil) then
      Exit(STG_E_INVALIDPOINTER);

    NumRead := Stream.Read(pv^, cb);

    if (pcbRead <> nil) then
      pcbRead^ := NumRead;

    Result := S_OK;
  except
    on E: EOutOfMemory do
      Result := E_OUTOFMEMORY;
    on E: EAbort do
      Result := E_ABORT;
  else
    Result := S_FALSE;
  end;
end;

// -----------------------------------------------------------------------------

function TFixedStreamAdapter.Write(pv: Pointer; cb: FixedUInt; pcbWritten: PFixedUInt): HResult;
var
  NumWritten: Longint;
begin
  try
    if (pv = nil) then
      Exit(STG_E_INVALIDPOINTER);

    NumWritten := Stream.Write(pv^, cb);

    if (pcbWritten <> nil) then
      pcbWritten^ := NumWritten;

    Result := S_OK;
  except
    on E: EOutOfMemory do
      Result := E_OUTOFMEMORY;
    on E: EAbort do
      Result := E_ABORT;
  else
    Result := STG_E_CANTSAVE;
  end;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.




