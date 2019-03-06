unit ScriptHostAPI;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

// -----------------------------------------------------------------------------
//
// This unit contains the interfaces that should be implemented by the host
// application in order to provide integration to the script debugger.
//
// -----------------------------------------------------------------------------

uses
  SysUtils,
  Classes;

const
  sScriptAttachmentFilenamePrefix = '';//'\';

// -----------------------------------------------------------------------------
//
//              IScriptHostAlertWindow
//
// -----------------------------------------------------------------------------
// Used by the debugger/editor to display alert messages.
// See ScriptHostAlertWindow.pas for a sample implementation.
// -----------------------------------------------------------------------------
type
  IScriptHostAlertWindow = interface;

  IScriptHostAlertEventSink = interface
    ['{C50A44A9-5373-417D-B92B-64E2648A9171}']
    procedure AlertClicked(const AlertWindow: IScriptHostAlertWindow);
    procedure AlertClosed(const AlertWindow: IScriptHostAlertWindow);
  end;

  IScriptHostAlertWindow = interface
    ['{735EB7C9-3A3C-4DD3-A32E-090CCA1CF3A0}']
    procedure SetEventSink(const EventSink: IScriptHostAlertEventSink; Data: pointer);
    procedure Close;
    function GetData: pointer;
    property Data: pointer read GetData;
  end;

// -----------------------------------------------------------------------------
//
//              IScriptHostApplication
//
// -----------------------------------------------------------------------------
// The application is represented by a single IScriptHostApplication.
// The application can optionally contain one or more documents.
// The ActiveDocument property indicates the currently active document.
// -----------------------------------------------------------------------------
  IScriptHostDocument = interface;

  IScriptHostApplication = interface
    ['{15B8D15D-9F31-4916-B2D2-2E8A40C77258}']
    procedure Subscribe(const Subscriber: IInterface);
    procedure Unsubscribe(const Subscriber: IInterface);

    function GetActiveDocument: IScriptHostDocument;
    // ActiveDocument should return nil if application doesn't support documents or no document is active.
    property ActiveDocument: IScriptHostDocument read GetActiveDocument;

    // AddAlertMessage is called by the debugger to display alert messages.
    // At some point this will be moved to a separate interface since it's very seldom used.
    function AddAlertMessage(const ACaption, AMessage: string; AImageIndex: integer = -1; ATimeout: integer = -1): IScriptHostAlertWindow;
  end;

  {$SCOPEDENUMS ON}
  TScriptHostApplicationNotification = (notifySubscribe, notifyUnsubscribe, notifyClosing);
  {$SCOPEDENUMS OFF}

  IScriptHostApplicationNotification = interface
    ['{A41C2E98-ECAC-468E-ACA0-C7664165CD0E}']
    procedure ApplicationNotify(const ScriptHostApplication: IScriptHostApplication; Notification: TScriptHostApplicationNotification);
  end;

  IScriptHostApplicationCloseNotification = interface
    ['{7919DA77-3529-4239-8A7D-C0C077ED6119}']
    procedure ApplicationCloseQuery(const ScriptHostApplication: IScriptHostApplication; var CanClose: boolean);
  end;

// -----------------------------------------------------------------------------
//
//              IScriptHostDocument
//
// -----------------------------------------------------------------------------
// An application can contain zero, one or more instances of IScriptHostDocument.
// It is up to the application to decide what the IScriptHostDocument object
// represents. It commonly represents a document or a file.
// -----------------------------------------------------------------------------
  IScriptHostFiles = interface;

  IScriptHostDocument = interface
    ['{BC6FB7B2-C02C-4D99-B240-51113E9D8D7A}']
    procedure Initialize(const ScriptHostApplication: IScriptHostApplication);
    procedure Finalize;

    procedure Subscribe(const Subscriber: IInterface);
    procedure Unsubscribe(const Subscriber: IInterface);

    function GetFilename: string;
    property Filename: string read GetFilename;

    function GetAllowEdit: boolean;
    property AllowEdit: boolean read GetAllowEdit;

    function GetFiles: IScriptHostFiles;
    property Files: IScriptHostFiles read GetFiles;

    // ActiveItem represent a state object within the document.
    // It is up to the application to decide what that is.
    function GetActiveItem: TObject;
    property ActiveItem: TObject read GetActiveItem;

    procedure Changed;
  end;

  {$SCOPEDENUMS ON}
  TScriptHostDocumentNotification = (notifySubscribe, notifyUnsubscribe, notifyShutdown);
  {$SCOPEDENUMS OFF}

  IScriptHostDocumentNotification = interface
    ['{7D75775F-880A-431E-9BAF-6AE59205E8DA}']
    procedure HostDocumentNotify(const Document: IScriptHostDocument; Notification: TScriptHostDocumentNotification);
  end;

  IScriptHostDocumentCloseNotification = interface
    ['{522D6959-AA77-4375-B7D1-537EC3D2CBA2}']
    procedure HostDocumentCloseQuery(const Document: IScriptHostDocument; var CanClose: boolean);
  end;


// -----------------------------------------------------------------------------
//
//              IScriptHostFile
//
// -----------------------------------------------------------------------------
// A document can contain files - also called attachments.
// These files can be made available to the script file system, both at run and
// compile time, through the IScriptHostFile and IScriptHostFiles interfaces.
// -----------------------------------------------------------------------------
  IScriptHostFile = interface
    ['{708395D4-F483-49D1-9E25-A0113D334127}']
    procedure Subscribe(const Subscriber: IInterface);
    procedure Unsubscribe(const Subscriber: IInterface);

    procedure LoadFromStream(AStream: TStream);
    procedure SaveToStream(AStream: TStream);

    // Return the internal stream if the object has one.
    // Return nil if it hasn't. The stream must be both readable and writable.
    // Can be used to avoid the overhead of creating a temporary memory stream which is often
    // necessary when LoadFromStream/SaveToStream is used.
    function GetStream: TStream;
    property Stream: TStream read GetStream;

    function GetFileSize: Int64;
    property FileSize: Int64 read GetFileSize;

    function GetName: string;
    property Name: string read GetName;
  end;

  {$SCOPEDENUMS ON}
  TScriptHostFileNotification = (notifyFree);
  {$SCOPEDENUMS OFF}

  IScriptHostFileNotification = interface
    ['{7D75775F-880A-431E-9BAF-6AE59205E8DA}']
    procedure HostDocumentNotify(const ScriptHostFile: IScriptHostFile; Notification: TScriptHostFileNotification);
  end;

  IScriptHostFiles = interface
    ['{93246E6B-0B4B-4D12-A509-071539AECB85}']
    function TryGetFile(const Filename: string; out ScriptHostFile: IScriptHostFile): boolean;
    function Add(const Name, Filename: string): IScriptHostFile;
    procedure Remove(const AFile: IScriptHostFile);
  end;


// -----------------------------------------------------------------------------
//
//              ScriptHostApplication
//
// -----------------------------------------------------------------------------
// Reference to the script host application.
// Must be set by the host application before the debugger can be used.
// -----------------------------------------------------------------------------
function ScriptHostApplication: IScriptHostApplication;
procedure RegisterScriptHostApplication(const AScriptHostApplication: IScriptHostApplication);

// Set ScriptDebuggerIsApplication=True if the debugger should become the application main form.
// Requires that RegisterScriptHostApplication() has not been called and that
// Application.MainForm=nil when the debugger is invoked.
var
  ScriptDebuggerIsApplication: boolean = False;


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

// -----------------------------------------------------------------------------
//
//              ScriptHostApplication
//
// -----------------------------------------------------------------------------
var
  FScriptHostApplication: IScriptHostApplication = nil;

procedure RegisterScriptHostApplication(const AScriptHostApplication: IScriptHostApplication);
begin
  FScriptHostApplication := AScriptHostApplication;
end;

function ScriptHostApplication: IScriptHostApplication;
begin
  Result := FScriptHostApplication;
end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

initialization
finalization
  FScriptHostApplication := nil;
end.
