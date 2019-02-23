# DWScriptStudio #

DWScriptStudio is a debugger and editor for DWScript. It can be used either as a stand alone IDE or it can be 
integrated into applications that use DWScript.

---

In addition to the editor/debugger this library also contains a Delphi framework that can be used to create DWScript 
class wrappers for Delphi components and visual controls.

## Features

* DWScriptStudio:
    * Syntax highligting editor.
        * Based on SynEdit.
    	* Multi page.
    	* RegEx search.
    	* Rename refactoring.
        * Macro recording/playback.
        * Code completion.
	    * Parameter proposal.
    * Script debugger.
        * Single stepping.
    	* Break points.
        * Call stack view.
    	* Data stack view.
    	* Local variables view.
    	* Abstract Syntax Tree view.
    	* Defined symbols view.
    	* Watches.
    	* Evaluate/Modify.
    * Generate HTML based class library documentation.  
      Note: Requires Documentation Insight.
* Script integration framework:
    * Virtual file system.  
	  Supported actual file systems are:
        * Physical file system.
    	* Editor files.
    	* Bundles (zip files containing scripts).
    	* Application provided files (e.g. attachments within documents).
    	* Combination of the above.
    * Script compilation and execution from virtual file systems.
    * Object life time management.  
      Script side objects are automatically invalidated when Delphi side components are destroyed.
    * Event handlers and delegates.  
      The event handlers of Delphi side objects can be implemented in script.
* Class library:
    * Mirrors the VCL class hierachy (e.g. TObject->TComponent->TControl->TCustomControl->etc...).
    * Most common Delphi classes and controls are wrapped and available to script.  
      More than 20 different controls are currently wrapped.
    * Visual controls are mostly based on the Developer Express VCL library.

## Requirements

DWScriptStudio has been tested with the following versions:

* Delphi 10.2 (community edition is supported)
* Developer Express VCL version 17.2.4

## Dependencies

The core DWScriptStudio editor/debugger functionality requires the following 3rd party libraries:

* DWScript (*)
* Developer Express VCL (*)
* SynEdit (*)
* Drag and Drop Component Suite (*)
* Various libs by Anders Melander (included)
* Synopse

(*) Design time packages must be installed in the Delphi IDE before the debugger forms can be opened in the Delphi IDE.

Be aware that Developer Express VCL is a commercial library.

## History

DWScriptStudio is based on the IDEDialog sample included with DWScript. As far as I know IDEDialog was written by Brian Frost.
Most of the original code from IDEDialog is still included but much of it has been disabled. Either because it 
has been superceeded or because it isn't relevant to the DWScriptStudio architecture.

Before DWScriptStudio was made into an independant library and released here, it served as the editor and debugger of the script
ecosystem of a commercial application. There are still some traces of this integration left in the code - and even the UI. They'll
disappear as/if I get to it.

---
