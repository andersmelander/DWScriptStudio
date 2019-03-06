unit ScriptBundleAPI deprecated 'Feature not available';

(*
 * Copyright © 2016 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

{$ifdef FEATURE_SCRIPT_BUNDLE}

const
  sScriptBundleComment = 'Script Bundle';
  sScriptBundleManifestFilename = 'manifest.xml';
  sScriptBundleManifestTag = 'script.bundle';
  cScriptBundleManifestVersion = 0;

const
  sScriptBundleFileType = '.bundle';
  sScriptBundleProjectFileType = '.bundleproj';

resourcestring
  sScriptFileFilter = 'Script add-in files (*.pas)|*.pas';
  sPackageInstallerFileFilter = 'Script add-in package files (*.spackage)|*.spackage';
  sScriptBundleFileFilter = 'Script add-in bundle files (*.bundle)|*.bundle';
  sScriptBundleProjectFileFilter = 'Script bundle project files (*.bundleproj)|*.bundleproj';

const
  // Windows explorer file type classes
  sScriptBundleFileClass = 'dwscript.bundle';
  sScriptBundleProjectFileClass = 'dwscript.bundleproject';

//  sScriptPackageInstallerFileClass = 'dwscript.package';
//  sScriptSourceFileClass = 'dwscript.script';

{$endif FEATURE_SCRIPT_BUNDLE}

implementation

end.