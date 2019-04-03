unit amMSXMLUtils;

(*
 * Copyright © 2008 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  MSXML2_TLB,
  Classes,
  ActiveX;

// -----------------------------------------------------------------------------
//
//              MSXMLTool
//
// -----------------------------------------------------------------------------
type
  MSXMLTool = class abstract
  public
    class function CreateDOM: IXMLDOMDocument2;
    class procedure WriteDocumentToStream(const Document: IXMLDOMDocument; const Stream: IStream; Encoding: string = 'UTF-8'); overload;
    class procedure WriteDocumentToStream(const Document: IXMLDOMDocument; const Stream: TStream; Encoding: string = 'UTF-8'); overload;
    class procedure WriteDocumentToFile(const Document: IXMLDOMDocument; const Filename: string; Encoding: string = 'UTF-8');
  end;


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  Windows,
  SysUtils,
  amStreamAdapter;

class function MSXMLTool.CreateDOM: IXMLDOMDocument2;
begin
  Result := MSXML2_TLB.CoDOMDocument60.Create;
  Result.preserveWhiteSpace := True;
  Result.validateOnParse := False;
  Result.resolveExternals := False;
end;

class procedure MSXMLTool.WriteDocumentToFile(const Document: IXMLDOMDocument; const Filename: string; Encoding: string);
var
  Stream: TFileStream;
begin
  Stream := TFileStream.Create(Filename, fmCreate);
  try
    WriteDocumentToStream(Document, Stream, Encoding);
  finally
    Stream.Free;
  end;
end;

class procedure MSXMLTool.WriteDocumentToStream(const Document: IXMLDOMDocument; const Stream: TStream; Encoding: string);
var
  StreamAdapter: IStream;
begin
  StreamAdapter := TFixedStreamAdapter.Create(Stream);
  try
    WriteDocumentToStream(Document, StreamAdapter, Encoding);
  finally
    StreamAdapter := nil;
  end;
end;

class procedure MSXMLTool.WriteDocumentToStream(const Document: IXMLDOMDocument; const Stream: IStream; Encoding: string = 'UTF-8');
var
  Writer: IMXWriter;
  Reader: IVBSAXXMLReader;
begin
  {
    From http://support.microsoft.com/kb/275883
    INFO: XML Encoding and DOM Interface Methods

    MSXML has native support for the following encodings:
    UTF-8
    UTF-16
    UCS-2
    UCS-4
    ISO-10646-UCS-2
    UNICODE-1-1-UTF-8
    UNICODE-2-0-UTF-16
    UNICODE-2-0-UTF-8

    It also recognizes (internally using the WideCharToMultibyte API function for mappings) the following encodings:
    US-ASCII
    ISO-8859-1
    ISO-8859-2
    ISO-8859-3
    ISO-8859-4
    ISO-8859-5
    ISO-8859-6
    ISO-8859-7
    ISO-8859-8
    ISO-8859-9
    WINDOWS-1250
    WINDOWS-1251
    WINDOWS-1252
    WINDOWS-1253
    WINDOWS-1254
    WINDOWS-1255
    WINDOWS-1256
    WINDOWS-1257
    WINDOWS-1258
  }

  ASSERT(Document <> nil);
  ASSERT(Stream <> nil);

  // Set properties on the XML Writer - including BOM, XML declaration and encoding
  Writer := CoMXXMLWriter60.Create;
  Writer.byteOrderMark := True;
  // Determines whether to write the Byte Order Mark (BOM). The byteOrderMark property has no effect for BSTR or DOM output. (Default True)
  Writer.omitXMLDeclaration := False; // Forces the IMXWriter to skip the XML declaration. Useful for creating document fragments. (Default False)
  Writer.Encoding := Encoding; // Sets and gets encoding for the output. (Default "UTF-16")
  Writer.indent := True; // Sets whether to indent output. (Default False)
  // Writer.standalone := True;

  // Set the XML Writer to the SAX content handler.
  Reader := CoSAXXMLReader60.Create;
  Reader.contentHandler := Writer as IVBSAXContentHandler;
  Reader.dtdHandler := Writer as IVBSAXDTDHandler;
  Reader.errorHandler := Writer as IVBSAXErrorHandler;
  Reader.putProperty('http://xml.org/sax/properties/lexical-handler', Writer);
  Reader.putProperty('http://xml.org/sax/properties/declaration-handler', Writer);

  Writer.output := Stream; // The resulting document will be written into the provided IStream

  // Now pass the DOM through the SAX handler, and it will call the Writer
  Reader.parse(Document);

  Writer.flush;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

end.




