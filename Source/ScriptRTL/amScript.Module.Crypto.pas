unit amScript.Module.Crypto;

(*
 * Copyright © 2014 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

{.$define FEATURE_FULL_CRYPTO}

interface

uses
  SysUtils, Classes,
  Controls,
  Generics.Collections,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,

  amScript.Module;

// -----------------------------------------------------------------------------
//
// TDataModuleSigmaScriptEncoding
//
// -----------------------------------------------------------------------------
// Note: This DFM is stored in binary format because we require UTF8 to store the
// name "Vigenère".
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptCrypto = class(TDataModule)
    dwsCrypto: TdwsUnit;
    procedure dwsCryptoClassesSHA256MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesSHA1MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesMD5MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesEncryptionAESSHA256FullMethodsEncryptDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesEncryptionAESSHA256FullMethodsDecryptDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesHashRIPEMD160MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesHashCRC32MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesEncryptionCryptProtectMethodsEncryptDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesEncryptionCryptProtectMethodsDecryptDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesHashSHA3_256MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesEncryptionBlowfishMethodsEncryptDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesEncryptionBlowfishMethodsDecryptDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesObfuscationROTMethodsROT5Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesObfuscationROTMethodsROT13Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesObfuscationROTMethodsROT18Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesObfuscationROTMethodsROT47Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesEncryptionVigenèreMethodsEncryptDataEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsCryptoClassesEncryptionVigenèreMethodsDecryptDataEval(Info: TProgramInfo; ExtObject: TObject);
  private
  public
  end;

// -----------------------------------------------------------------------------
//
//              Vigenère encryption
//
// -----------------------------------------------------------------------------
// https://en.wikipedia.org/wiki/Vigen%C3%A8re_cipher
// -----------------------------------------------------------------------------
type
  TCryptVigenère = class
  strict private
    const
      OrdBigA = Ord('A');
      OrdBigZ = Ord('Z');
      OrdSmlA = Ord('a');
      OrdSmlZ = Ord('z');
    class procedure Vigenère(var Str: string; const Key: string); static;
    class procedure VigenèreD(var Str: string; const Key: string); static;
    class function imod(const x: integer; const y: integer): integer;
  public
    class function Encode(const Str: string; const Key: string): string;
    class function Decode(const Str: string; const Key: string): string;
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

{$R *.dfm}

uses
  Math,
{$ifdef FEATURE_FULL_CRYPTO}
  SynCrypto,
  SynZip,
  dwsRipeMD160,
  dwsCryptProtect,
  dwsSHA3,
{$endif FEATURE_FULL_CRYPTO}
  DECCiphers,
  DECUtil,
  DECFormat;

// -----------------------------------------------------------------------------
//
//              Vigenère encryption
//
// -----------------------------------------------------------------------------
// Based on a post by Andreas Rejbrand
// http://stackoverflow.com/a/6800389
// -----------------------------------------------------------------------------
class function TCryptVigenère.imod(const x: integer; const y: integer): integer;
begin
  if x >= 0 then
    imod := x - floor(x/y) * y
  else
    imod := x + ceil(-x/y) * y;
end;

class procedure TCryptVigenère.Vigenère(var Str: string; const Key: string);
var
  n, i, o: integer;
  KeyChrs: TBytes;
begin

  n := length(Key);
  SetLength(KeyChrs, n);
  for i := 1 to n do
    if InRange(ord(Key[i]), OrdBigA, OrdBigZ) then
      KeyChrs[i - 1] := Ord(Key[i]) - OrdBigA
    else
      raise Exception.Create('Invalid character in Vigenère key.');

  for i := 1 to length(Str) do
  begin
    o := Ord(Str[i]);
    if InRange(o, OrdBigA, OrdBigZ) then
      Str[i] := Chr(OrdBigA + imod((o - OrdBigA + KeyChrs[(i-1) mod n]), 26))
    else if InRange(o, OrdSmlA, OrdSmlZ) then
      Str[i] := Chr(OrdSmlA + imod((o - OrdSmlA + KeyChrs[(i-1) mod n]), 26));
  end;

end;

class function TCryptVigenère.Encode(const Str: string; const Key: string): string;
begin
  result := Str;
  Vigenère(result, Key);
end;

class procedure TCryptVigenère.VigenèreD(var Str: string; const Key: string);
var
  n, i, o: integer;
  KeyChrs: TBytes;
begin

  n := length(Key);
  SetLength(KeyChrs, n);
  for i := 1 to n do
    if InRange(ord(Key[i]), OrdBigA, OrdBigZ) then
      KeyChrs[i - 1] := Ord(Key[i]) - OrdBigA
    else
      raise Exception.Create('Invalid character in Vigenère key.');

  for i := 1 to length(Str) do
  begin
    o := Ord(Str[i]);
    if InRange(o, OrdBigA, OrdBigZ) then
      Str[i] := Chr(OrdBigA + imod((o - OrdBigA - KeyChrs[(i-1) mod n]), 26))
    else if InRange(o, OrdSmlA, OrdSmlZ) then
      Str[i] := Chr(OrdSmlA + imod((o - OrdSmlA - KeyChrs[(i-1) mod n]), 26));
  end;

end;

class function TCryptVigenère.Decode(const Str: string; const Key: string): string;
begin
  result := Str;
  VigenèreD(result, Key);
end;

// -----------------------------------------------------------------------------

function DoAESFull(const data, key: RawByteString; encrypt: Boolean): RawByteString;
{$ifdef FEATURE_FULL_CRYPTO}
var
  outbuf: TWriteOnlyBlockStream;
{$endif FEATURE_FULL_CRYPTO}
begin
{$ifdef FEATURE_FULL_CRYPTO}
  outbuf := TWriteOnlyBlockStream.AllocFromPool;
  try
    AESSHA256Full(Pointer(data), Length(data), outbuf, key, encrypt);
    Result := outbuf.ToRawBytes;
  finally
    outbuf.ReturnToPool;
  end;
{$endif FEATURE_FULL_CRYPTO}
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesEncryptionAESSHA256FullMethodsDecryptDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_FULL_CRYPTO}
  Info.ResultAsDataString := DoAESFull(Info.ParamAsDataString[0], Info.ParamAsDataString[1], False);
{$endif FEATURE_FULL_CRYPTO}
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesEncryptionAESSHA256FullMethodsEncryptDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_FULL_CRYPTO}
  Info.ResultAsDataString := DoAESFull(Info.ParamAsDataString[0], Info.ParamAsDataString[1], True);
{$endif FEATURE_FULL_CRYPTO}
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesEncryptionCryptProtectMethodsDecryptDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_FULL_CRYPTO}
  Info.ResultAsDataString := CryptUnProtect(Info.ParamAsDataString[0], Info.ParamAsDataString[1]);
{$endif FEATURE_FULL_CRYPTO}
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesEncryptionCryptProtectMethodsEncryptDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_FULL_CRYPTO}
  Info.ResultAsDataString := CryptProtect(Info.ParamAsDataString[0], Info.ParamAsDataString[1]);
{$endif FEATURE_FULL_CRYPTO}
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesEncryptionVigenèreMethodsDecryptDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsDataString := TCryptVigenère.Decode(Info.ParamAsDataString[0], Info.ParamAsDataString[1]);
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesEncryptionVigenèreMethodsEncryptDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsDataString := TCryptVigenère.Encode(Info.ParamAsDataString[0], Info.ParamAsDataString[1]);
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesHashCRC32MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_FULL_CRYPTO}
  Info.ResultAsString := IntToHex(CRC32string(Info.ParamAsDataString[0]), 8);
{$endif FEATURE_FULL_CRYPTO}
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesHashRIPEMD160MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
{$ifdef FEATURE_FULL_CRYPTO}
var
  data: RawByteString;
  digest: TRipe160Digest;
  remaining: Integer;
  p: PRipe160Block;
{$endif FEATURE_FULL_CRYPTO}
begin
{$ifdef FEATURE_FULL_CRYPTO}
  data := Info.ParamAsDataString[0];
  p := PRipe160Block(data);
  remaining := Length(data);

  RipeMD160Init(digest);
  while remaining >= SizeOf(TRipe160Block) do
  begin
    RipeMD160(digest, p);
    Inc(p);
    Dec(remaining, SizeOf(TRipe160Block));
  end;
  RipeMD160Final(digest, p, remaining, Length(data));

  Info.ResultAsString := BinToHex(digest, SizeOf(digest));
{$endif FEATURE_FULL_CRYPTO}
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesHashSHA3_256MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
{$ifdef FEATURE_FULL_CRYPTO}
var
  data: RawByteString;
  sponge: TSpongeState;
  hash: array [0 .. 256 div 8 - 1] of Byte;
{$endif FEATURE_FULL_CRYPTO}
begin
{$ifdef FEATURE_FULL_CRYPTO}
  data := Info.ParamAsDataString[0];

  SHA3_Init(sponge, SHA3_256);
  SHA3_Update(sponge, Pointer(data), Length(data));
  SHA3_FinalHash(sponge, @hash);

  Info.ResultAsString := BinToHex(hash, SizeOf(hash));
{$endif FEATURE_FULL_CRYPTO}
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesMD5MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_FULL_CRYPTO}
  Info.ResultAsDataString := MD5(Info.ParamAsDataString[0]);
{$endif FEATURE_FULL_CRYPTO}
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesSHA1MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_FULL_CRYPTO}
  Info.ResultAsDataString := SHA1(Info.ParamAsDataString[0]);
{$endif FEATURE_FULL_CRYPTO}
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesSHA256MethodsHashDataEval(Info: TProgramInfo; ExtObject: TObject);
begin
{$ifdef FEATURE_FULL_CRYPTO}
  Info.ResultAsDataString := SHA256(Info.ParamAsDataString[0]);
{$endif FEATURE_FULL_CRYPTO}
end;

// -----------------------------------------------------------------------------
//
// Obfuscation class
//
// -----------------------------------------------------------------------------
// Various ROT functions
// -----------------------------------------------------------------------------
(*
  http://delphi.cjcsoft.net/viewthread.php?tid=44121

  The four ROT algorithms ROT5, ROT13, ROT18 and ROT47 vary in the characters that can be encoded/decoded:

    * ROT5 covers the numbers 0-9.
    * ROT13 covers the 26 upper and lower case letters of the Latin alphabet (A-Z, a-z).
    * ROT18 is a combination of ROT5 and ROT13.
    * ROT47 covers all printable ASCII characters, except empty spaces.
      Besides numbers and the letters of the Latin alphabet, the following characters are included: !"#$%&'()*+,-./:;?[\]^_`{|}~
*)


function RotateBy(const AStr: String; const ARotate: Integer): String;

  function RotateChar(AChr: Char; ARotate: Integer): Char;
  var
    iStart, iRotate: Integer;
  begin
    iStart := 0;
    iRotate := 0;
    case ARotate of
       5: if AChr in ['0'..'9'] then
          begin
            iStart := 48;                                   // '0'
            iRotate := 5;
          end;
      13: if AChr in ['A'..'Z'] then
          begin
            iStart := 65;                                   // 'A'
            iRotate := 13;
          end
          else if Achr in ['a'..'z'] then
          begin
            iStart := 97;                                   // 'a'
            iRotate := 13;
          end;
      18: if AChr in ['0'..'9'] then
          begin
            iStart := 48;                                   // '0'
            iRotate := 5;
          end
          else if AChr in ['A'..'Z'] then
          begin
            iStart := 65;                                   // 'A'
            iRotate := 13;
          end
          else if AChr in ['a'..'z'] then
          begin
            iStart := 97;                                   // 'a'
            iRotate := 13;
          end;
      47: if AChr in ['!'..'~'] then
          begin
            iStart := 33;                                   // '!'
            iRotate := 47;
          end
    else
      raise Exception.CreateFmt('Invalid RotateBy value: %d', [ARotate]);
    end;

    Result := Chr(iStart + ((Ord(AChr) - iStart + iRotate) mod (iRotate * 2)));
  end;

var
  I: Integer;
begin
  SetLength(Result, Length(AStr));
  for I := 1 to Length(AStr) do
    Result[i] := RotateChar(AStr[I], ARotate);
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesObfuscationROTMethodsROT13Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsDataString := RotateBy(Info.ParamAsDataString[0], 13);
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesObfuscationROTMethodsROT18Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsDataString := RotateBy(Info.ParamAsDataString[0], 18);
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesObfuscationROTMethodsROT47Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsDataString := RotateBy(Info.ParamAsDataString[0], 47);
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesObfuscationROTMethodsROT5Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsDataString := RotateBy(Info.ParamAsDataString[0], 5);
end;

// -----------------------------------------------------------------------------
//
// EncryptionBlowfish
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptCrypto.dwsCryptoClassesEncryptionBlowfishMethodsDecryptDataEval(Info: TProgramInfo; ExtObject: TObject);
var
  BF: TCipher_Blowfish;
begin
  BF := TCipher_Blowfish.Create;
  try
    BF.Init(Info.ParamAsDataString[1]);
    Info.ResultAsDataString := BF.DecodeStringToString(Info.ParamAsDataString[0], TFormat_HEX);
  finally
    BF.Free;
  end;
end;

procedure TDataModuleScriptCrypto.dwsCryptoClassesEncryptionBlowfishMethodsEncryptDataEval(Info: TProgramInfo; ExtObject: TObject);
var
  BF: TCipher_Blowfish;
begin
  BF := TCipher_Blowfish.Create;
  try
    BF.Init(Info.ParamAsDataString[1]);
    Info.ResultAsDataString := BF.EncodeStringToString(Info.ParamAsDataString[0], TFormat_HEX);
  finally
    BF.Free;
  end;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptCrypto.RegisterModule;
end.
