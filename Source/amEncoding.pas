unit amEncoding;

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

//------------------------------------------------------------------------------
//
//      Determine text encoding
//
//------------------------------------------------------------------------------
type
  TAnsiSet = set of AnsiChar;
  TTextEncoding = (teUnknown, teASCII, teAnsi, teUnicode, teUTF8);

function GuessStreamEncoding(Data: TStream): TTextEncoding;

function IsASCII(Stream: TStream; Extra: TAnsiSet = []): boolean;
function IsUTF8(Stream: TStream; Extra: TAnsiSet = []): boolean;
function IsUnicode(Stream: TStream; Extra: TAnsiSet = []): boolean;
function IsAnsi(Stream: TStream; Extra: TAnsiSet = []): boolean; overload;
function IsAnsi(const Data: UnicodeString): boolean; overload;


//------------------------------------------------------------------------------
//
//      File signature
//
//------------------------------------------------------------------------------
function CheckFileSignature(Stream: TStream; const Signature, Mask: AnsiString; Offset: int64 = 0): boolean; overload;
function CheckFileSignature(Stream: TStream; const Signature: AnsiString; Offset: int64 = 0): boolean; overload;

function CheckFileSignature(Stream: TStream; const Signature; Size: Cardinal; const Mask; MaskSize: Cardinal; Offset: int64 = 0): boolean; overload;
function CheckFileSignature(Stream: TStream; const Signature; Size: Cardinal; Offset: int64): boolean; overload;

function CheckFileSignatureWide(Stream: TStream; const Signature: UnicodeString; Offset: int64 = 0): boolean;

const
  UTF8Signature: AnsiString             = #$EF#$BB#$BF;
  UTF8SignatureMask: AnsiString         = #$ff#$ff#$ff;
  UTF16Signature: AnsiString            = #$FF#$FE; // Little-endian
  UTF16SignatureMask: AnsiString        = #$ff#$ff;
  UTF16BESignature: AnsiString          = #$FE#$FF; // Big-endian
  UTF16BESignatureMask: AnsiString      = #$ff#$ff;
  UTF32Signature: AnsiString            = #$FF#$FE#$00#$00; // Little-endian
  UTF32SignatureMask: AnsiString        = #$ff#$ff#$ff#$ff;
  UTF32BESignature: AnsiString          = #$00#$00#$FE#$FF; // Big-endian
  UTF32BESignatureMask: AnsiString      = #$ff#$ff#$ff#$ff;


//------------------------------------------------------------------------------
//
//      Text decoding
//
//------------------------------------------------------------------------------
function DecodeTextStream(Data: TStream): string;


//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------

implementation

uses
  SysUtils,
  Character,
  Windows;



//------------------------------------------------------------------------------
//
//      Determine text encoding
//
//------------------------------------------------------------------------------
const
  MaxSampleANSI = 1024; // Characters
  MaxSampleUnicode = 1024; // Characters

function IsAnsi(const Data: UnicodeString): boolean;
var
  UsedDefaultChar: BOOL;
begin
  // From SynUnicode unit:
  WideCharToMultiByte(DefaultSystemCodePage, 0, PWideChar(Data), Length(Data), nil, 0, nil, @UsedDefaultChar);
  Result := not UsedDefaultChar;
end;

//------------------------------------------------------------------------------

// TODO : Use Windows API functions for this.

function IsASCII(Stream: TStream; Extra: TAnsiSet): boolean;
var
  Count: integer;
  Value: AnsiChar;
  SavePos: int64;
  Allowed: set of AnsiChar;
  Terminated: boolean;
begin
  Result := (Stream.Size-Stream.Position >= SizeOf(AnsiChar));

  SavePos := Stream.Position;
  try
    Allowed := [#0, #9, #10, #13, #32..#126]+Extra; // #0 is special - see below
    Terminated := False;
    Count := 0;

    while (Result) and (Count < MaxSampleANSI) do
    begin
      if (Stream.Read(Value, SizeOf(Value)) <> SizeOf(Value)) then
        break;

      Result := (Value in Allowed) and
        // Allow terminating zero if no none-zero characters follow it
        ((not Terminated) or (Value = #0) or (AnsiChar(#0) in Extra));
      Terminated := (Value = #0);
      Inc(Count);
    end;
  finally
    Stream.Position := SavePos;
  end;
end;

//------------------------------------------------------------------------------

function IsANSI(Stream: TStream; Extra: TAnsiSet): boolean;
begin
  Result := IsASCII(Stream, Extra + [#128..#255]);
end;

//------------------------------------------------------------------------------

function IsUnicode(Stream: TStream; Extra: TAnsiSet): boolean;
var
  Count: integer;
  Value: WideChar;
  SavePos: int64;
  Terminated: boolean;
begin
  Result := (Stream.Size-Stream.Position >= SizeOf(WideChar)) and
    ((Stream.Size-Stream.Position) mod SizeOf(WideChar) = 0);

  if (Result) and (CheckFileSignature(Stream, UTF16Signature, UTF16SignatureMask)) then
    exit;

  SavePos := Stream.Position;
  try
    Count := 0;
    Terminated := False;

    while (Result) and (Count < MaxSampleUnicode) do
    begin
      if (Stream.Read(Value, SizeOf(Value)) <> SizeOf(Value)) then
        break;

      Result := ((Value = #0) or (AnsiChar(Value) in Extra) or not(Value.GetUnicodeCategory in
        [TUnicodeCategory.ucControl, TUnicodeCategory.ucUnassigned, TUnicodeCategory.ucPrivateUse])) and
        // Allow terminating zero if no none-zero characters follow it
        ((not Terminated) or (Value = #0) or (AnsiChar(#0) in Extra));
      Terminated := (Value = #0);
      Inc(Count);
    end;
  finally
    Stream.Position := SavePos;
  end;
end;

//------------------------------------------------------------------------------

function IsUTF8(Stream: TStream; Extra: TAnsiSet): boolean;
// Based on a snippet from Markus Spoettl

  function UTF8CharLength(const c: byte): Integer;
  begin
    // First Byte: 0xxxxxxx
    if ((c and $80) = $00) then
      Result := 1
    // First Byte: 110yyyyy
    else
    if ((c and $E0) = $C0) then
      Result := 2
    // First Byte: 1110zzzz
    else
    if ((c and $F0) = $E0) then
       Result := 3
    // First Byte: 11110uuu
    else
    if ((c and $F8) = $F0) then
      Result := 4
    // not valid, return the error value
    else
      Result := -1;
  end;

  function UTF8IsTrailChar(const c: byte): boolean;
  begin
    // trail bytes have this form: 10xxxxxx
    Result := ((c and $C0) = $80);
  end;

var
  SavePos: int64;
  Count: integer;
  Value: byte;
  c: byte;
  CharCount: integer;
  InBuffer: TBytes;
  OutBuffer: TBytes;
  OutStream: TMemoryStream;
begin
  Result := (Stream.Size-Stream.Position >= SizeOf(Value));

  if (Result) and (CheckFileSignature(Stream, UTF8Signature, UTF8SignatureMask)) then
    exit;

  SavePos := Stream.Position;
  try
    Count := 0;
    CharCount := 0;
    while (Result) and (Count < MaxSampleANSI) do
    begin
      if (Stream.Read(Value, SizeOf(Value)) <> SizeOf(Value)) then
        break;
      Inc(Count);

      // get the length if the current UTF-8 character
      c := UTF8CharLength(Value);

      // check if it's valid and fits into ASize
      if (c >= 1) and (c <= 4) then
      begin
        inc(CharCount);

        // if it's a multi-byte character, check the trail bytes
        while (c > 1) do
        begin
          if (Stream.Read(Value, SizeOf(Value)) <> SizeOf(Value)) or
            (not UTF8IsTrailChar(Value)) then
          begin
            Result := False;
            break;
          end;
          Inc(Count);
          dec(c);
        end;

        if (CharCount >= MaxSampleUnicode) then
          break;

      end else
        Result := False;
    end;

    // Appears to be valid UTF8. Now check if the chars it contains are allowed.
    if (Result) then
    begin
      SetLength(InBuffer, MaxSampleANSI);
      Stream.Position := SavePos;
      Stream.Read(InBuffer[0], MaxSampleANSI);
      OutBuffer := TEncoding.Convert(TEncoding.UTF8, TEncoding.Unicode, InBuffer);
      OutStream := TMemoryStream.Create;
      try
        OutStream.Write(OutBuffer[0], Length(OutBuffer));
        OutStream.Position := 0;
        Result := IsUnicode(OutStream, Extra + [#9, #10, #13]);
      finally
        OutStream.Free;
      end;
    end;
  finally
    Stream.Position := SavePos;
  end;
end;

//------------------------------------------------------------------------------
//
//      File signature
//
//------------------------------------------------------------------------------
function CheckFileSignature(Stream: TStream; const Signature; Size: Cardinal; const Mask; MaskSize: Cardinal; Offset: int64): boolean; overload;
var
  Buffer: TBytes;
  i: Cardinal;
  SavePos: int64;
  BufferByte, SigByte, MaskByte: PByte;
begin
  ASSERT(Size >= MaskSize);
  ASSERT(Size > 0);

  SetLength(Buffer, Size);

  SavePos := Stream.Position;
  try
    Stream.Position := Offset;

    if (Stream.Read(Buffer[0], Size) = integer(Size)) then
    begin
      Result := True;
      BufferByte := @Buffer[0];
      SigByte := PByte(@Signature);
      MaskByte := PByte(@Mask);
      i := 1;
      while (Result) and (i <= Size) do
      begin
        if (i <= MaskSize) then
          Result := ((BufferByte^ and MaskByte^) = (SigByte^ and MaskByte^))
        else
          Result := (BufferByte^ = SigByte^);
        inc(i);
        inc(BufferByte);
        inc(SigByte);
        inc(MaskByte);
      end;
    end else
      Result := False;

  finally
    Stream.Position := SavePos;
  end;
end;

function CheckFileSignature(Stream: TStream; const Signature; Size: Cardinal; Offset: int64): boolean;
begin
  Result := CheckFileSignature(Stream, Signature, Size, nil^, 0, Offset);
end;

function CheckFileSignature(Stream: TStream; const Signature, Mask: AnsiString; Offset: int64): boolean;
begin
  Result := CheckFileSignature(Stream, Signature[1], Length(Signature), Mask[1], Length(Mask), Offset);
end;

function CheckFileSignature(Stream: TStream; const Signature: AnsiString; Offset: int64): boolean;
begin
  Result := CheckFileSignature(Stream, Signature[1], Length(Signature), Offset);
end;

function CheckFileSignatureWide(Stream: TStream; const Signature: UnicodeString; Offset: int64): boolean;
var
  AnsiSignature: AnsiString;
begin
  SetLength(AnsiSignature, Length(Signature)*SizeOf(WideChar));
  Move(PWideChar(Signature)^, PAnsiChar(AnsiSignature)^, Length(AnsiSignature));
  Result := CheckFileSignature(Stream, AnsiSignature, '', Offset);
end;

//------------------------------------------------------------------------------
//
//      Text decoding
//
//------------------------------------------------------------------------------
function GuessStreamEncoding(Data: TStream): TTextEncoding;
begin
  Data.Position := 0;

  if (Data.Size = 0) then
    Result := teASCII
  else
  if (IsASCII(Data)) then
    Result := teASCII
  else
  if (IsUTF8(Data)) then
    Result := teUTF8
  else
  if (IsUnicode(Data, [#10, #13])) then
    Result := teUnicode
  else
  if (IsANSI(Data)) then
    Result := teANSI
  else
    Result := teUnknown;
end;

function DecodeTextStream(Data: TStream): string;
var
  Buffer: TBytes;
  Preamble: TBytes;
  TextEncoding: TTextEncoding;
  Encoding: TEncoding;
  Start: integer;
begin
  TextEncoding := GuessStreamEncoding(Data);
  Data.Position := 0;

  if (TextEncoding = teUnknown) then
    raise Exception.Create('Unknown text encoding');

  SetLength(Buffer, Data.Size);
  Data.Read(Buffer[0], Data.Size);

  case TextEncoding of
    teUnicode:
      Encoding := TEncoding.Unicode;
    teUTF8:
      Encoding := TEncoding.UTF8;
    teASCII:
      Encoding := TEncoding.ASCII;
  else
    Encoding := TEncoding.Default;
  end;

  // Detect and delete preamble
  Preamble := Encoding.GetPreamble;
  if (Length(Preamble) > 0) and (Length(Preamble) <= Length(Buffer)) and (CompareMem(@Preamble[0], @Buffer[0], Length(Preamble))) then
    Start := Length(Preamble)
  else
    Start := 0;

  Result := Encoding.GetString(Buffer, Start, Length(Buffer)-Start);
end;

//------------------------------------------------------------------------------

end.
