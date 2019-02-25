unit ScriptModuleRegExp;

(*
 * Copyright © 2014 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  SysUtils, Classes,
  Controls,
  Generics.Collections,
  RegularExpressions,

  dwsComp,
  dwsExprs,
  dwsCompiler,
  dwsClassesLibModule,
{$ifndef OLD_DWSCRIPT}
  dwsInfo,
{$endif OLD_DWSCRIPT}

  ScriptModule;

// -----------------------------------------------------------------------------
//
// TDataModuleSigmaScriptRegExp
//
// -----------------------------------------------------------------------------
type
  TDataModule = class(TScriptModule);

  TDataModuleScriptRegExp = class(TDataModule)
    dwsUnitRegExp: TdwsUnit;
    procedure dwsUnitRegExpClassesTRegularExpressionCleanUp(ExternalObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch0Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsMatch1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpMatchMethodsGetSuccessEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpMatchCleanUp(ExternalObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsMatch2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsMatch3Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpMatchMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpMatchMethodsGetIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpMatchMethodsGetLengthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsMatches1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsMatches2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpMatchCollectionMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpMatchCollectionMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpMatchMethodsGetGroupsEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpGroupCollectionMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpGroupCollectionMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpGroupMethodsGetSuccessEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpGroupMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpGroupMethodsGetIndexEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpGroupMethodsGetLengthEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegExpMatchMethodsNextMatchEval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionConstructorsCreate2Eval(Info: TProgramInfo; var ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsReplace1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsReplace2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsSplit1Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsSplit2Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsSplit3Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsReplace3Eval(Info: TProgramInfo; ExtObject: TObject);
    procedure dwsUnitRegExpClassesTRegularExpressionMethodsReplace4Eval(Info: TProgramInfo; ExtObject: TObject);
  private
    FEvaluatorInfo: IInfo;
    FEvaluatorprogramInfo: TProgramInfo;
    function MatchEvaluator(const Match: TMatch): string;
  public
  end;

implementation

{$R *.dfm}

uses
  Variants;

(*
  TRegExOption = (roNone, roIgnoreCase, roMultiLine, roExplicitCapture, roCompiled, roSingleLine, roIgnorePatternSpace);
  TRegExOptions = set of TRegExOption;
*)

type
  TRegularExpression = class
  public
    RegExp: TRegEx;
    constructor Create(const APattern: string); overload;
    constructor Create(const APattern: string; AOptions: TRegExOptions); overload;
  end;

constructor TRegularExpression.Create(const APattern: string);
begin
  RegExp := TRegEx.Create(APattern);
end;

constructor TRegularExpression.Create(const APattern: string; AOptions: TRegExOptions);
begin
  RegExp := TRegEx.Create(APattern, AOptions);
end;

type
  TRegularExpressionMatch = class
  public
    Match: TMatch;
    constructor Create(const AMatch: TMatch);
  end;

constructor TRegularExpressionMatch.Create(const AMatch: TMatch);
begin
  Match := AMatch;
end;

type
  TRegularExpressionMatchCollection = class
  public
    Collection: TMatchCollection;
    constructor Create(const ACollection: TMatchCollection);
  end;

constructor TRegularExpressionMatchCollection.Create(const ACollection: TMatchCollection);
begin
  Collection := ACollection;
end;

type
  TRegularExpressionGroup = class
  public
    Group: TGroup;
    constructor Create(const AGroup: TGroup);
  end;

constructor TRegularExpressionGroup.Create(const AGroup: TGroup);
begin
  Group := AGroup;
end;

type
  TRegularExpressionGroupCollection = class
  public
    Collection: TGroupCollection;
    constructor Create(const ACollection: TGroupCollection);
  end;

constructor TRegularExpressionGroupCollection.Create(const ACollection: TGroupCollection);
begin
  Collection := ACollection;
end;


// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//
// TRegularExpression
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionConstructorsCreate1Eval(Info: TProgramInfo; var ExtObject: TObject);
begin
  ASSERT(ExtObject = nil);
  ExtObject := TRegularExpression.Create(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionConstructorsCreate2Eval(Info: TProgramInfo; var ExtObject: TObject);
var
  Options: TRegExOptions;
  Option: TRegExOption;
  OptionValue: integer;
const
  OptionMap: array[TRegExOption] of integer = (
    $00, // roNone
    $01, // roIgnoreCase
    $02, // roMultiLine
    $04, // roExplicitCapture
    $00, // roCompiled
    $08, // roSingleLine
    $10, // roIgnorePatternSpace
    $20);// roNotEmpty
begin
  ASSERT(ExtObject = nil);

  Options := [];
  OptionValue := Info.ParamAsInteger[1];
  for Option := Low(TRegExOption) to High(TRegExOption) do
    if (OptionValue and OptionMap[Option] <> 0) then
      Include(Options, Option);

  ExtObject := TRegularExpression.Create(Info.ParamAsString[0], Options);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch1Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TRegularExpression(ExtObject).RegExp.IsMatch(Info.ParamAsString[0]);
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch2Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TRegularExpression(ExtObject).RegExp.IsMatch(Info.ParamAsString[0], Info.ParamAsInteger[1]);
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsIsMatch0Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TRegEx.IsMatch(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsMatch1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Match: TRegularExpressionMatch;
begin
  Match := TRegularExpressionMatch.Create(TRegularExpression(ExtObject).RegExp.Match(Info.ParamAsString[0]));
  Info.ResultAsVariant := CreateResultScriptObject(Info, Match);
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsMatch2Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Match: TRegularExpressionMatch;
begin
  Match := TRegularExpressionMatch.Create(TRegularExpression(ExtObject).RegExp.Match(Info.ParamAsString[0], Info.ParamAsInteger[1]));
  Info.ResultAsVariant := CreateResultScriptObject(Info, Match);
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsMatch3Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Match: TRegularExpressionMatch;
begin
  Match := TRegularExpressionMatch.Create(TRegularExpression(ExtObject).RegExp.Match(Info.ParamAsString[0], Info.ParamAsInteger[1], Info.ParamAsInteger[2]));
  Info.ResultAsVariant := CreateResultScriptObject(Info, Match);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsMatches1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  MatchCollection: TRegularExpressionMatchCollection;
begin
  MatchCollection := TRegularExpressionMatchCollection.Create(TRegularExpression(ExtObject).RegExp.Matches(Info.ParamAsString[0]));
  Info.ResultAsVariant := CreateResultScriptObject(Info, MatchCollection);
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsMatches2Eval(Info: TProgramInfo; ExtObject: TObject);
var
  MatchCollection: TRegularExpressionMatchCollection;
begin
  MatchCollection := TRegularExpressionMatchCollection.Create(TRegularExpression(ExtObject).RegExp.Matches(Info.ParamAsString[0], Info.ParamAsInteger[1]));
  Info.ResultAsVariant := CreateResultScriptObject(Info, MatchCollection);
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsReplace1Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TRegularExpression(ExtObject).RegExp.Replace(Info.ParamAsString[0], Info.ParamAsString[1]);
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsReplace2Eval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TRegularExpression(ExtObject).RegExp.Replace(Info.ParamAsString[0], Info.ParamAsString[1], Info.ParamAsInteger[2]);
end;

function TDataModuleScriptRegExp.MatchEvaluator(const Match: TMatch): string;
var
  ScriptMatch: TRegularExpressionMatch;
  ParamMatch: IInfo;
begin
  ASSERT(FEvaluatorInfo <> nil);

  ParamMatch := FEvaluatorInfo.Parameter['Match'];

  ScriptMatch := TRegularExpressionMatch.Create(Match);
  ParamMatch.Value := CreateScriptObject(FEvaluatorprogramInfo, ParamMatch.TypeSym.Name, ScriptMatch);

  Result := FEvaluatorInfo.Call.ValueAsString;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsReplace3Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Evaluator: TMatchEvaluator;
begin
  FEvaluatorInfo := nil;
  FEvaluatorProgramInfo := Info;
  try

    if (Info.Params[1].TypeSym <> nil) then
    begin
      Evaluator := MatchEvaluator;
      FEvaluatorInfo := Info.Params[1];
    end else
    begin
      Evaluator := nil;
    end;

    Info.ResultAsString := TRegularExpression(ExtObject).RegExp.Replace(Info.ParamAsString[0], Evaluator);
  finally
    FEvaluatorProgramInfo := nil;
    FEvaluatorInfo := nil;
  end;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsReplace4Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Evaluator: TMatchEvaluator;
begin
  FEvaluatorInfo := nil;
  FEvaluatorProgramInfo := Info;
  try

    if (Info.Params[1].TypeSym <> nil) then
    begin
      Evaluator := MatchEvaluator;
      FEvaluatorInfo := Info.Params[1];
    end else
    begin
      Evaluator := nil;
    end;

    Info.ResultAsString := TRegularExpression(ExtObject).RegExp.Replace(Info.ParamAsString[0], Evaluator, Info.ParamAsInteger[2]);
  finally
    FEvaluatorProgramInfo := nil;
    FEvaluatorInfo := nil;
  end;
end;

// -----------------------------------------------------------------------------

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsSplit1Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Buffer: TArray<string>;
  i: integer;
begin
  Buffer := TRegularExpression(ExtObject).RegExp.Split(Info.ParamAsString[0]);

  Info.ResultVars.ScriptDynArray.ArrayLength := Length(Buffer);
  for i := 0 to Length(Buffer)-1 do
    Info.ResultVars.ScriptDynArray.AsString[i] := Buffer[i];
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsSplit2Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Buffer: TArray<string>;
  i: integer;
begin
  Buffer := TRegularExpression(ExtObject).RegExp.Split(Info.ParamAsString[0], Info.ParamAsInteger[1]);

  Info.ResultVars.ScriptDynArray.ArrayLength := Length(Buffer);
  for i := 0 to Length(Buffer)-1 do
    Info.ResultVars.ScriptDynArray.AsString[i] := Buffer[i];
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegularExpressionMethodsSplit3Eval(Info: TProgramInfo; ExtObject: TObject);
var
  Buffer: TArray<string>;
  i: integer;
begin
  Buffer := TRegularExpression(ExtObject).RegExp.Split(Info.ParamAsString[0], Info.ParamAsInteger[1], Info.ParamAsInteger[2]);

  Info.ResultVars.ScriptDynArray.ArrayLength := Length(Buffer);
  for i := 0 to Length(Buffer)-1 do
    Info.ResultVars.ScriptDynArray.AsString[i] := Buffer[i];
end;

// -----------------------------------------------------------------------------
//
// TRegExpMatch
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpMatchCleanUp(ExternalObject: TObject);
begin
  ExternalObject.Free;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpMatchMethodsGetGroupsEval(Info: TProgramInfo; ExtObject: TObject);
var
  GroupCollection: TRegularExpressionGroupCollection;
begin
  GroupCollection := TRegularExpressionGroupCollection.Create(TRegularExpressionMatch(ExtObject).Match.Groups);
  Info.ResultAsVariant := CreateResultScriptObject(Info, GroupCollection);
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpMatchMethodsGetIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TRegularExpressionMatch(ExtObject).Match.Index;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpMatchMethodsGetLengthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TRegularExpressionMatch(ExtObject).Match.Length;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpMatchMethodsGetSuccessEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TRegularExpressionMatch(ExtObject).Match.Success;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpMatchMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TRegularExpressionMatch(ExtObject).Match.Value;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpMatchMethodsNextMatchEval(Info: TProgramInfo; ExtObject: TObject);
var
  Match: TRegularExpressionMatch;
begin
  Match := TRegularExpressionMatch.Create(TRegularExpressionMatch(ExtObject).Match.NextMatch);
  Info.ResultAsVariant := CreateResultScriptObject(Info, Match);
end;

// -----------------------------------------------------------------------------
//
// TRegExpMatchCollection
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpMatchCollectionMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TRegularExpressionMatchCollection(ExtObject).Collection.Count;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpMatchCollectionMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Match: TRegularExpressionMatch;
begin
  Match := TRegularExpressionMatch.Create(TRegularExpressionMatchCollection(ExtObject).Collection.Item[Info.ParamAsInteger[0]]);
  Info.ResultAsVariant := CreateResultScriptObject(Info, Match);
end;


// -----------------------------------------------------------------------------
//
// TRegExpMatchGroupCollection
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpGroupCollectionMethodsGetCountEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TRegularExpressionGroupCollection(ExtObject).Collection.Count;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpGroupCollectionMethodsGetItemEval(Info: TProgramInfo; ExtObject: TObject);
var
  Index: Variant;
  Group: TRegularExpressionGroup;
begin
  Index := Info.ParamAsVariant[0];
  if (VarIsOrdinal(Index)) then
    Index := integer(Index);

  Group := TRegularExpressionGroup.Create(TRegularExpressionGroupCollection(ExtObject).Collection.Item[Index]);
  Info.ResultAsVariant := CreateResultScriptObject(Info, Group);
end;

// -----------------------------------------------------------------------------
//
// TRegExpMatchGroup
//
// -----------------------------------------------------------------------------
procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpGroupMethodsGetIndexEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TRegularExpressionGroup(ExtObject).Group.Index;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpGroupMethodsGetLengthEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsInteger := TRegularExpressionGroup(ExtObject).Group.Length;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpGroupMethodsGetSuccessEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsBoolean := TRegularExpressionGroup(ExtObject).Group.Success;
end;

procedure TDataModuleScriptRegExp.dwsUnitRegExpClassesTRegExpGroupMethodsGetValueEval(Info: TProgramInfo; ExtObject: TObject);
begin
  Info.ResultAsString := TRegularExpressionGroup(ExtObject).Group.Value;
end;

// -----------------------------------------------------------------------------

initialization
  TDataModuleScriptRegExp.RegisterModule;
end.

