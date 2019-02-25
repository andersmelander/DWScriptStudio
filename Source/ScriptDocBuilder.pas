unit ScriptDocBuilder;

(*
 * Copyright © 2012 Anders Melander
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *)

interface

uses
  Generics.Collections,
  Classes,
  MSXML2_TLB,
  dwsUtils,
  dwsSymbols,
  dwsUnitSymbols,
  dwsExprs;

type
  TScriptCustomDocBuilder = class abstract
  private
    FProgram: IdwsProgram;
    FDirectory: string;
  protected
    property Prog: IdwsProgram read FProgram;
    property Directory: string read FDirectory;

    procedure LoadUnitTables;

    procedure LoadSymbolTable(ATable: TSymbolTable); overload;
    procedure LoadSymbolTable(ATable: TSymbolTable; const UnitName: string); overload;
    procedure LoadSymbol(Symbol, ParentSymbol: TSymbol);

    procedure BuildUnit(UnitSymbol: TUnitSymbol); overload;
    procedure BuildUnit(UnitSymbol: TUnitSymbol; const UnitName: string); overload;
    procedure BuildUnit(UnitSymbol: TSymbol; ATable: TSymbolTable; const UnitName: string); overload; virtual; abstract;
  public
    constructor Create(const AProgram: IdwsProgram);

    procedure Build(const ADirectory: string); virtual;
  end;

  TScriptDocumentationBuilder = class(TScriptCustomDocBuilder)
  private
  protected
    procedure BuildUnit(UnitSymbol: TSymbol; ATable: TSymbolTable; const UnitName: string); override;
    procedure BuildClass(const MembersNode: IXMLDOMElement; UnitSymbol: TUnitSymbol; ClassSymbol: TClassSymbol);
    procedure BuildMethod(const MembersNode: IXMLDOMElement; ClassSymbol: TClassSymbol; MethodSymbol: TMethodSymbol);
    procedure BuildProperty(const MembersNode: IXMLDOMElement; ClassSymbol: TClassSymbol; PropertySymbol: TPropertySymbol);
  public
  end;

  TScriptSourceBuilder = class(TScriptCustomDocBuilder)
  private
    type TSectionType = (stNone, stType, stVar, stConst);
  private
    FWriter: TStreamWriter;
    FProjectWriter: TStreamWriter;
    FFirstUnit: boolean;
    FLastSection: TSectionType;
    FReservedWords: TStringList;
  protected
    function EnumerateInterface(const item: TResolvedInterface) : TSimpleHashAction;
    procedure StartSection(Writer: TStreamWriter; Section: TSectionType);
    function SanitizeIdentifier(const Name: string): string;
    function SanitizeTypeName(Symbol: TSymbol): string;

    procedure BuildUnit(UnitSymbol: TSymbol; ATable: TSymbolTable; const UnitName: string); override;
    procedure BuildComposite(Writer: TStreamWriter; UnitSymbol: TSymbol; CompositeSymbol: TCompositeTypeSymbol);
    procedure BuildValue(Writer: TStreamWriter; UnitSymbol: TSymbol; ValueSymbol: TValueSymbol);
    procedure BuildMethod(Writer: TStreamWriter; ClassSymbol: TCompositeTypeSymbol; MethodSymbol: TFuncSymbol);
    procedure BuildProperty(Writer: TStreamWriter; ClassSymbol: TCompositeTypeSymbol; PropertySymbol: TPropertySymbol);
  public
    constructor Create(const AProgram: IdwsProgram);
    destructor Destroy; override;

    procedure Build(const ADirectory: string); override;
  end;

implementation

uses
  Variants,
  SysUtils,
  IOUtils,
  dwsFunctions,
  dwsJSON,
  amMSXMLUtils;

procedure TScriptCustomDocBuilder.BuildUnit(UnitSymbol: TUnitSymbol);
begin
  BuildUnit(UnitSymbol, UnitSymbol.Name);
end;

procedure TScriptCustomDocBuilder.BuildUnit(UnitSymbol: TUnitSymbol; const UnitName: string);
begin
  BuildUnit(UnitSymbol, UnitSymbol.Table, UnitSymbol.Name);
end;

procedure TScriptCustomDocBuilder.LoadSymbol(Symbol, ParentSymbol: TSymbol);
begin
  if (Symbol is TUnitSymbol) then
    BuildUnit(TUnitSymbol(Symbol));
end;

procedure TScriptCustomDocBuilder.LoadSymbolTable(ATable: TSymbolTable; const UnitName: string);
begin
  // check if unit is empty
  if (ATable = nil) or (ATable.Count = 0) then
    Exit;

  BuildUnit(nil, ATable, UnitName);
end;

procedure TScriptCustomDocBuilder.LoadUnitTables;
var
  Symbol: TUnitMainSymbol;
  i: integer;
begin
  BuildUnit(nil, FProgram.ProgramObject.SystemTable.SymbolTable, 'system');
  BuildUnit(nil, dwsInternalUnit.StaticTable.SymbolTable, 'standard');

  for i := 0 to FProgram.ProgramObject.UnitMains.Count-1 do
  begin
    Symbol := FProgram.ProgramObject.UnitMains[i];
    BuildUnit(Symbol, Symbol.Table, Symbol.Name);
  end;
end;

procedure TScriptCustomDocBuilder.LoadSymbolTable(ATable: TSymbolTable);
var
  Symbol: TSymbol;
begin
  // Build unit list
  for Symbol in ATable do
    LoadSymbol(Symbol, nil);
end;

constructor TScriptCustomDocBuilder.Create(const AProgram: IdwsProgram);
begin
  inherited Create;
  FProgram := AProgram;
end;

procedure TScriptCustomDocBuilder.Build(const ADirectory: string);
begin
  // Check if symbols are available at all
  if (FProgram.Table.Count = 0) then
    Exit;

  // eventually create directory if not present
  if (not TDirectory.Exists(ADirectory)) then
    TDirectory.CreateDirectory(ADirectory);

  FDirectory := ADirectory;

  LoadUnitTables;
//  BuildUnit(FProgram.ProgramObject.SystemTable.SymbolTable, 'system');

  // Build unit list
//  LoadSymbolTable(FProgram.Table);
end;

procedure TScriptDocumentationBuilder.BuildClass(const MembersNode: IXMLDOMElement; UnitSymbol: TUnitSymbol; ClassSymbol: TClassSymbol);
var
  Node, MemberNode: IXMLDOMElement;
  Attribute: IXMLDOMAttribute;
  Symbol: TSymbol;
begin
  MemberNode := MembersNode.ownerDocument.createElement('member');
  MembersNode.appendChild(MemberNode);

  Attribute := MemberNode.ownerDocument.createAttribute('name');
  Attribute.value := 'T:'+UnitSymbol.Name + '.' + ClassSymbol.Name;
  MemberNode.setAttributeNode(Attribute);

  Node := MemberNode.ownerDocument.createElement('summary');
  MemberNode.appendChild(Node);
  Node.text := ClassSymbol.Description;

  Node := MemberNode.ownerDocument.createElement('remarks');
  MemberNode.appendChild(Node);

  for Symbol in ClassSymbol.Members do
  begin
    if (Symbol is TMethodSymbol) then
    begin
      if (Symbol.IsVisibleFor(cvProtected)) then
        BuildMethod(MembersNode, ClassSymbol, TMethodSymbol(Symbol));
    end else
    if (Symbol is TPropertySymbol) then
    begin
      if (Symbol.IsVisibleFor(cvProtected)) then
        BuildProperty(MembersNode, ClassSymbol, TPropertySymbol(Symbol));
    end;
  end;
end;

procedure TScriptDocumentationBuilder.BuildMethod(const MembersNode: IXMLDOMElement; ClassSymbol: TClassSymbol; MethodSymbol: TMethodSymbol);
var
  Node, MemberNode: IXMLDOMElement;
  Attribute: IXMLDOMAttribute;
  Symbol: TSymbol;
  s, Params: string;
begin
  MemberNode := MembersNode.ownerDocument.createElement('member');
  MembersNode.appendChild(MemberNode);

  s := 'M:'+MethodSymbol.StructSymbol.Name+'.'+MethodSymbol.Name;;
  Params := MethodSymbol.ParamsDescription;
  if (Params <> '') then
    s := s + Params;
  Attribute := MemberNode.ownerDocument.createAttribute('name');
  Attribute.value := s;
  MemberNode.setAttributeNode(Attribute);

  Node := MemberNode.ownerDocument.createElement('summary');
  MemberNode.appendChild(Node);
  Node.text := MethodSymbol.Description;

  Node := MemberNode.ownerDocument.createElement('remarks');
  MemberNode.appendChild(Node);

  for Symbol in MethodSymbol.Params do
  begin
    Node := MemberNode.ownerDocument.createElement('param');
    MemberNode.appendChild(Node);
    Attribute := Node.ownerDocument.createAttribute('name');
    Attribute.value := Symbol.Name;
    Node.setAttributeNode(Attribute);
    Node.text := Symbol.Description;
  end;
end;

procedure TScriptDocumentationBuilder.BuildProperty(const MembersNode: IXMLDOMElement; ClassSymbol: TClassSymbol; PropertySymbol: TPropertySymbol);
var
  Node, MemberNode: IXMLDOMElement;
  Attribute: IXMLDOMAttribute;
begin
  MemberNode := MembersNode.ownerDocument.createElement('member');
  MembersNode.appendChild(MemberNode);

  Attribute := MemberNode.ownerDocument.createAttribute('name');
  Attribute.value := 'P:'+PropertySymbol.OwnerSymbol.Name+'.'+PropertySymbol.Name;
  MemberNode.setAttributeNode(Attribute);

  Node := MemberNode.ownerDocument.createElement('summary');
  MemberNode.appendChild(Node);
  Node.text := PropertySymbol.Description;

  Node := MemberNode.ownerDocument.createElement('remarks');
  MemberNode.appendChild(Node);

  Node := MemberNode.ownerDocument.createElement('value');
  MemberNode.appendChild(Node);
end;

procedure TScriptDocumentationBuilder.BuildUnit(UnitSymbol: TSymbol; ATable: TSymbolTable; const UnitName: string);
var
  Symbol: TSymbol;
  XMLDoc: IXMLDOMDocument;
  Parent, Node, MembersNode: IXMLDOMElement;
begin
  XMLDoc := MSXML2_TLB.CoDOMDocument60.Create();
  XMLDoc.preserveWhiteSpace := True;

  XMLDoc.documentElement := XMLDoc.createElement('doc');

  Parent := XMLDoc.createElement('assembly');
  XMLDoc.documentElement.appendChild(Parent);
  Node := XMLDoc.createElement('name');
  Parent.appendChild(Node);
  Node.text := UnitName;

  MembersNode := XMLDoc.createElement('members');
  XMLDoc.documentElement.appendChild(MembersNode);

  for Symbol in ATable do
  begin
    if (Symbol is TClassSymbol) then
      BuildClass(MembersNode, TUnitSymbol(TClassSymbol(Symbol).UnitSymbol), TClassSymbol(Symbol))
(*
    else
    if (Symbol is TConstSymbol) then
      BuildContentFileMember('Constants\')
    else
    if (Symbol is TFuncSymbol) then
      BuildContentFileMember('Routines\')
    else
    if (Symbol is TTypeSymbol) then
      BuildContentFileMember('Types\');
*)
  end;

  MSXMLTool.WriteDocumentToFile(XMLDoc, Directory + UnitName + '.xml');
end;

function TScriptSourceBuilder.EnumerateInterface(const item: TResolvedInterface): TSimpleHashAction;
begin
  FWriter.Write(', '+item.IntfSymbol.Name);
  Result := shaNone;
end;

function TScriptSourceBuilder.SanitizeIdentifier(const Name: string): string;
begin
  if (FReservedWords.IndexOf(Name) <> -1) then
    Result := '&'+Name
  else
    Result := Name;
end;

function TScriptSourceBuilder.SanitizeTypeName(Symbol: TSymbol): string;
begin
  if (Symbol is TArraySymbol) and (Pos(' ', Symbol.Name) > 0) then
    Result := 'T'+Symbol.Typ.Name+'Array'
  else
    Result := Symbol.Name;
end;

procedure TScriptSourceBuilder.StartSection(Writer: TStreamWriter; Section: TSectionType);
begin
  if (Section = FLastSection) then
    exit;
  FLastSection := Section;

  Writer.WriteLine;
  case FLastSection of
    stType:
      Writer.WriteLine('type');
    stVar:
      Writer.WriteLine('var');
    stConst:
      Writer.WriteLine('const');
  end;

end;

procedure TScriptSourceBuilder.Build(const ADirectory: string);
begin
  FProjectWriter := TStreamWriter.Create(ADirectory + 'script_rtl.dpr', False, TEncoding.UTF8);
  try
    FProjectWriter.WriteLine('program Script;');
    FProjectWriter.WriteLine;
    FProjectWriter.WriteLine('uses');

    FFirstUnit := True;

    inherited;

    if (not FFirstUnit) then
      FProjectWriter.WriteLine(';');

    FProjectWriter.WriteLine('begin');
    FProjectWriter.WriteLine('end.');
  finally
    FProjectWriter.Free;
  end;
end;

procedure TScriptSourceBuilder.BuildComposite(Writer: TStreamWriter; UnitSymbol: TSymbol; CompositeSymbol: TCompositeTypeSymbol);

  function SanitizeName(const Name: string): string;
  var
    i: integer;
    DoUpper: boolean;
  begin
    Result := '';
    DoUpper := True;
    for i := 1 to Length(Name) do
      if (Name[i] <> ' ') then
      begin
        if (DoUpper) then
        begin
          Result := Result + AnsiUpperCase(Name[i]);
          DoUpper := False;
        end else
          Result := Result + Name[i];
      end else
        DoUpper := True;
  end;

var
  Symbol: TSymbol;
  Name: string;
  First: boolean;
  WriteScope: boolean;
  s: string;
begin
  if (CompositeSymbol is THelperSymbol) then
    Name := SanitizeName(THelperSymbol(CompositeSymbol).ForType.Name)+'Helper'
  else
    Name := CompositeSymbol.Name;

  StartSection(Writer, stType);
//  Writer.WriteLine('(*');
//  Writer.WriteLine(CompositeSymbol.Description);
//  Writer.WriteLine('*)');
  if (CompositeSymbol is TClassSymbol) and (TClassSymbol(CompositeSymbol).IsAbstract) then
  begin
    if (not TClassSymbol(CompositeSymbol).IsSealed) then
      Writer.WriteLine(Format('  /// <remarks>%s is an abstract base class and can not be instantiated directly.</remarks>', [Name]));
      // Writer.WriteLine(Format('  /// <remarks>%s is a static singleton class and does not need to be instantiated.</remarks>', [Name]))
  end;

  Name := SanitizeIdentifier(Name);

  WriteScope := True;
  Writer.Write('  '+Name+' = ');
  if (CompositeSymbol is THelperSymbol) then
  begin
    if (THelperSymbol(CompositeSymbol).ForType is TClassSymbol) then
      Writer.Write('class ')
    else
      Writer.Write('record ');
    s := THelperSymbol(CompositeSymbol).ForType.Name;
    if (s = 'array of string') then
      s := 'TStringArray';
    Writer.Write('helper for ' + s);
  end else
  if (CompositeSymbol is TStructuredTypeSymbol) then
  begin
    if (CompositeSymbol is TClassSymbol) then
    begin
      Writer.Write('class');

      if (TClassSymbol(CompositeSymbol).IsSealed) then
        Writer.Write(' sealed');

      if (TClassSymbol(CompositeSymbol).Parent <> nil) and (TClassSymbol(CompositeSymbol).Parent.Name <> 'Object') then
        Writer.Write('(' + TClassSymbol(CompositeSymbol).Parent.Name);

      if (TClassSymbol(CompositeSymbol).Interfaces <> nil) then
      begin
        FWriter := Writer;
        TClassSymbol(CompositeSymbol).Interfaces.Enumerate(EnumerateInterface);
        FWriter := nil;
      end;

      if (TClassSymbol(CompositeSymbol).Parent <> nil) and (TClassSymbol(CompositeSymbol).Parent.Name <> 'Object') then
        Writer.Write(')');
      //if (TClassSymbol(CompositeSymbol).IsAbstract) then
      //  Writer.Write(' abstract;');
    end else
    if (CompositeSymbol is TRecordSymbol) then
      Writer.Write('record')
    else
    if (CompositeSymbol is TInterfaceSymbol) then
    begin
      Writer.Write('interface');
      WriteScope := False;
    end else
      Writer.Write(CompositeSymbol.ClassName)
  end;
  Writer.WriteLine;

  First := True;
  // Fields
  for Symbol in CompositeSymbol.Members do
    if (Symbol is TFieldSymbol) then
    begin
      if (TFieldSymbol(Symbol).Visibility = cvProtected) then
      begin
        if (First) and (WriteScope) then
          Writer.WriteLine('  protected');
        First := False;
        Writer.WriteLine('    '+SanitizeIdentifier(Symbol.Name)+': '+Symbol.Typ.Name+';');
        //Writer.WriteLine(TFieldSymbol(Symbol).Description);
      end;
    end;
  // Methods
  for Symbol in CompositeSymbol.Members do
    if (Symbol is TMethodSymbol) then
    begin
      if (TMethodSymbol(Symbol).Visibility = cvProtected) then
      begin
        if (First) and (WriteScope) then
          Writer.WriteLine('  protected');
        First := False;
        BuildMethod(Writer, CompositeSymbol, TMethodSymbol(Symbol));
      end;
    end;
  // Properties
  for Symbol in CompositeSymbol.Members do
    if (Symbol is TPropertySymbol) then
    begin
      if (TPropertySymbol(Symbol).Visibility = cvProtected) then
      begin
        if (First) and (WriteScope) then
          Writer.WriteLine('  protected');
        First := False;
        BuildProperty(Writer, CompositeSymbol, TPropertySymbol(Symbol));
      end;
    end;

  First := True;
  for Symbol in CompositeSymbol.Members do
    if (Symbol is TFieldSymbol) then
    begin
      if (TFieldSymbol(Symbol).Visibility = cvPublic) then
      begin
        if (First) and (WriteScope) then
          Writer.WriteLine('  public');
        First := False;
        Writer.WriteLine('    '+SanitizeIdentifier(Symbol.Name)+': '+Symbol.Typ.Name+';');
      end;
    end;
  for Symbol in CompositeSymbol.Members do
    if (Symbol is TMethodSymbol) then
    begin
      if (TMethodSymbol(Symbol).IsVisibleFor(cvPublic)) then
      begin
        if (First) and (WriteScope) then
          Writer.WriteLine('  public');
        First := False;
        BuildMethod(Writer, CompositeSymbol, TMethodSymbol(Symbol));
      end;
    end;
  for Symbol in CompositeSymbol.Members do
    if (Symbol is TPropertySymbol) then
    begin
      if (TPropertySymbol(Symbol).IsVisibleFor(cvPublic)) then
      begin
        if (First) and (WriteScope) then
          Writer.WriteLine('  public');
        First := False;
        BuildProperty(Writer, CompositeSymbol, TPropertySymbol(Symbol));
      end;
    end;
  Writer.WriteLine('  end;');
  Writer.WriteLine;
end;

procedure TScriptSourceBuilder.BuildMethod(Writer: TStreamWriter; ClassSymbol: TCompositeTypeSymbol; MethodSymbol: TFuncSymbol);
var
  Indent: string;
  First: boolean;
  i: integer;
  s: string;
begin
{
  Writer.WriteLine('(*');
  Writer.WriteLine(MethodSymbol.Description);
  Writer.WriteLine('  '+MethodSymbol.ParamsDescription);
  Writer.WriteLine('*)');
}
  if (MethodSymbol is TMethodSymbol) then
    Indent := '    '
  else
    Indent := '';

  if (MethodSymbol.IsType) then
  begin
    // Delegate
    if (ClassSymbol = nil) then
      StartSection(Writer, stType)
    else
      Writer.WriteLine(Indent+'type');
    Indent := Indent + '  ';
  end;

  if (MethodSymbol.IsDeprecated) then
  begin
    Writer.Write(Indent+'/// <remarks><note type="warning">This method has been deprecated.');
    if (MethodSymbol.DeprecatedMessage <> '') then
    Writer.Write('<br />'+MethodSymbol.DeprecatedMessage+'.');
    Writer.WriteLine('</note></remarks>');
  end;

  Writer.Write(Indent);
  if (MethodSymbol.IsType) then
    Writer.Write(MethodSymbol.Name + ' = ');

  if (MethodSymbol is TMethodSymbol) and (TMethodSymbol(MethodSymbol).IsClassMethod) then
    Writer.Write('class ');

  case MethodSymbol.Kind of
    fkFunction:
      Writer.Write('function ');
    fkProcedure:
      Writer.Write('procedure ');
    fkConstructor:
      Writer.Write('constructor ');
    fkDestructor:
      Writer.Write('destructor ');
    fkMethod:
      begin
        if (MethodSymbol.Result <> nil) then
          Writer.Write('function ')
        else
          Writer.Write('procedure ');
      end;
    fkLambda:
      Writer.Write('lambda ');
  end;

  if (not MethodSymbol.IsType) then
    Writer.Write(MethodSymbol.Name);

  if (MethodSymbol.Params.Count > 0) then
  begin
    Writer.Write('(');
    First := True;
    for i := 0 to MethodSymbol.Params.Count-1 do
    begin
      if (not First) then
        Writer.Write('; ');
      First := False;
      if (MethodSymbol.Params[i].Typ is TAnyTypeSymbol) then
      begin
        s := MethodSymbol.Params[i].Name;
        if (FReservedWords.IndexOf(MethodSymbol.Params[i].Name) <> -1) then
          s := 'A'+s;
        // Untyped parameter
        s := 'const '+s;
      end else
      begin
        s := MethodSymbol.Params[i].Description;
        if (FReservedWords.IndexOf(MethodSymbol.Params[i].Name) <> -1) then
          s := 'A'+s;
      end;
      Writer.Write(s);
      //Writer.Write(Symbol.Name+': '+Symbol.Typ.Name);
    end;
    Writer.Write(')');
  end;

  if (MethodSymbol.Result <> nil) then
  begin
    s:= SanitizeTypeName(MethodSymbol.Result.Typ);
    Writer.Write(': '+s);
  end;
  Writer.Write(';');

  if (MethodSymbol.IsOverloaded) then
    Writer.Write(' overload;');
  if (MethodSymbol is TMethodSymbol) then
  begin
    if (TMethodSymbol(MethodSymbol).IsVirtual) then
    begin
      if (TMethodSymbol(MethodSymbol).IsOverride) then
        Writer.Write(' override;')
      else
        Writer.Write(' virtual;');
      if (TMethodSymbol(MethodSymbol).IsAbstract) then
        Writer.Write(' abstract;');
    end;
    if (TMethodSymbol(MethodSymbol).IsStatic) then
      Writer.Write(' static;');
    if (TMethodSymbol(MethodSymbol).IsDefault) then
      Writer.Write(' default;');
  end;
  if (MethodSymbol.IsDeprecated) then
    Writer.Write(' deprecated;');// '''+MethodSymbol.DeprecatedMessage+''';');

  Writer.WriteLine;
end;

procedure TScriptSourceBuilder.BuildProperty(Writer: TStreamWriter; ClassSymbol: TCompositeTypeSymbol; PropertySymbol: TPropertySymbol);
var
  s: string;
begin
  Writer.Write('    ');

  if (PropertySymbol.Typ <> nil) and (PropertySymbol.Typ is TFuncSymbol) then
    // Event
    s := 'property ' + PropertySymbol.Name + ': '+PropertySymbol.Typ.Name + ';'
  else
    s := PropertySymbol.Description;

  Writer.Write(s);
  if (s[Length(s)] <> ';') then
    Writer.Write(';');
  Writer.WriteLine;
(*
  Writer.Write('property '+PropertySymbol.Name);
  if (PropertySymbol.IndexSym <> nil) then
    Writer.Write('['+PropertySymbol.IndexSym.Name+':'+PropertySymbol.IndexSym.Typ.Name+']');
  Writer.Write(': '+PropertySymbol.Typ.Name);
  Writer.Write(';');
  if (PropertySymbol.IsDefault) then
    Writer.Write(' default;');
*)
end;

procedure TScriptSourceBuilder.BuildUnit(UnitSymbol: TSymbol; ATable: TSymbolTable; const UnitName: string);
var
  IsDeprecated: boolean;
  DeprecatedMessage: string;
  Symbol: TSymbol;
  Writer: TStreamWriter;
  First: boolean;
  Dependencies: TList<TSymbol>;
  s: string;
begin
  if (ATable.Count = 0) then
    exit;

  FLastSection := stNone;

  if (not FFirstUnit) then
    FProjectWriter.WriteLine(',')
  else
    FFirstUnit := False;
  FProjectWriter.Write('  '+UnitName+' in '''+UnitName+'.pas''');

  IsDeprecated := False;
  DeprecatedMessage := '';
  if (UnitSymbol is TUnitSymbol) then
  begin
    if (TUnitSymbol(UnitSymbol).IsDeprecated) then
    begin
      IsDeprecated := True;
      DeprecatedMessage := TUnitSymbol(UnitSymbol).DeprecatedMessage;
    end;
  end else
  if (UnitSymbol is TUnitMainSymbol) then
  begin
    DeprecatedMessage := TUnitMainSymbol(UnitSymbol).DeprecatedMessage;
    IsDeprecated := (DeprecatedMessage <> '');
  end;

  Writer := TStreamWriter.Create(Directory + UnitName + '.pas', False, TEncoding.UTF8);
  try
    if (IsDeprecated) then
    begin
      Writer.Write('/// <remarks><note type="warning">This unit has been deprecated.');
      if (DeprecatedMessage <> '') then
        Writer.Write('<br />'+DeprecatedMessage+'.');
      Writer.WriteLine('</note></remarks>');
    end;

    Writer.Write('unit '+UnitName);

    if (IsDeprecated) then
    begin
      Writer.Write(' deprecated');
      if (DeprecatedMessage <> '') then
        Writer.Write(' '''+DeprecatedMessage+'''');
    end;

    Writer.WriteLine(';');
    Writer.WriteLine;
    Writer.WriteLine('interface');
    Writer.WriteLine;

    // Dependencies
    Dependencies := TList<TSymbol>.Create;
    try
      for Symbol in ATable do
        if (Symbol is TUnitSymbol) and (not Dependencies.Contains(Symbol)) then
          Dependencies.Add(Symbol);

      First := True;
      for Symbol in Dependencies do
      begin
        if (First) then
        begin
          Writer.WriteLine('// Dependencies');
          Writer.WriteLine('uses');
        end else
          Writer.WriteLine(',');
        First := False;
        Writer.Write('  '+Symbol.Name);
      end;
      if (not First) then
      begin
        Writer.WriteLine(';');
        Writer.WriteLine;
      end;
    finally
      Dependencies.Free;
    end;

    // forward declarations
    First := True;
    for Symbol in ATable do
      if (Symbol is TClassSymbol) then
      begin
        if (Symbol.Name = 'TObject') or (Symbol.Name = 'Object') then
          continue;

        if (First) then
        begin
          Writer.WriteLine('// Forward declarations');
          StartSection(Writer, stType)
        end;
        First := False;
        s := SanitizeIdentifier(Symbol.Name);
        Writer.WriteLine('  '+s+' = class;');
      end;
    if (not First) then
      Writer.WriteLine;

    for Symbol in ATable do
    begin
      if (Symbol is TValueSymbol) then
        BuildValue(Writer, UnitSymbol, TValueSymbol(Symbol))
      else
      if (Symbol is TTypeSymbol) then
      begin
        if (Symbol is TCompositeTypeSymbol) then
        begin
          if (Symbol.Name = 'TObject') or (Symbol.Name = 'Object') then
            continue;

          BuildComposite(Writer, UnitSymbol, TCompositeTypeSymbol(Symbol));
        end else
        if (Symbol is TFuncSymbol) then
        begin
          BuildMethod(Writer, nil, TFuncSymbol(Symbol));
          StartSection(Writer, stNone);
        end else
        if (Symbol is TEnumerationSymbol) then
        begin
          StartSection(Writer, stType);
          Writer.WriteLine('  '+Symbol.Name + ' = ' + Symbol.Description + ';');
        end else
        if (Symbol is TAliasSymbol) then
        begin
          StartSection(Writer, stType);
          Writer.WriteLine('  '+Symbol.Description + ' = ' + Symbol.BaseType.Name + ';');
        end else
        if (Symbol is TStructuredTypeMetaSymbol) then
        begin
          StartSection(Writer, stType);
          Writer.WriteLine('  '+Symbol.Name + ' = ' + Symbol.Description + ';');
        end else
        if (Symbol is TArraySymbol) then
        begin
          StartSection(Writer, stType);
          s:= SanitizeTypeName(Symbol);
          Writer.WriteLine('  ' + s + ' = ' + Symbol.Description + ';');
        end else
        if (Symbol is TSetOfSymbol) then
        begin
          StartSection(Writer, stType);
          Writer.WriteLine('  '+Symbol.Name + ' = set of ' + Symbol.Typ.Name + ';')
        end else
        if (Symbol is TUnitSymbol) then
        begin
          //  Ignore
        end else
        begin
          if (Symbol is TAnyTypeSymbol) then
          begin
            Writer.WriteLine('  // Ignored type: '+Symbol.ClassName + ' = ' + Symbol.Description)
          end else
          if (Symbol is TBaseSymbol) then
          begin
            Writer.WriteLine('  // Base type: '+Symbol.ClassName + ' = ' + Symbol.Description);
            if (Symbol is TBaseVariantSymbol) and (Symbol.ClassType <> TBaseVariantSymbol) then
            begin
              StartSection(Writer, stType);
              Writer.WriteLine('  '+Symbol.Name + ' = Variant;');
            end;
          end else
          begin
            StartSection(Writer, stType);
            Writer.WriteLine('  // Unknown type: '+Symbol.ClassName + ' = ' + Symbol.Description);
            // Writer.WriteLine('  '+Symbol.Name + ' = type Variant;');
            // Work around for Documentation Insight incorrect handling of distinct type declaration:
            Writer.WriteLine('  '+Symbol.Name + ' = Variant;');
          end;
        end;
      end else
        Writer.WriteLine('// Not handled: '+Symbol.ClassName + ' = ' + Symbol.Description)
    end;

    Writer.WriteLine;
    Writer.WriteLine('implementation');
    Writer.WriteLine;
    Writer.WriteLine('end.');
  finally
    Writer.Free;
  end;
end;

procedure TScriptSourceBuilder.BuildValue(Writer: TStreamWriter; UnitSymbol: TSymbol; ValueSymbol: TValueSymbol);
var
  Value: Variant;
  ValueOrdinal: int64;
  Digits: integer;
  s: string;
begin
  if (ValueSymbol is TParamSymbol) then
    Writer.WriteLine(ValueSymbol.Description+';')
  else
  if (ValueSymbol is TPropertySymbol) then
    Writer.WriteLine(ValueSymbol.Description+';')
  else
  if (ValueSymbol is TConstSymbol) then
  begin
    //Writer.WriteLine('const');
    if (not (ValueSymbol is TElementSymbol)) then
    begin
      StartSection(Writer, stConst);
      Writer.Write('  '+SanitizeIdentifier(ValueSymbol.Name)+': '+ValueSymbol.Typ.Name+' = ');
      Value := TConstSymbol(ValueSymbol).Data[0];
      if (VarType(Value) = varError) then
        Writer.Write('[varError]')
      else
      if (VarIsOrdinal(Value)) then
      begin
        ValueOrdinal := Value;
        if (ValueOrdinal <= 1024) then
          Writer.Write(IntToStr(ValueOrdinal))
        else
        begin
          if (ValueOrdinal <= $FFFF) then
            Digits := 4
          else
          if (ValueOrdinal <= $FFFFFFFF) then
            Digits := 8
          else
            Digits := 16;
          Writer.Write('$'+IntToHex(ValueOrdinal, Digits));
        end;
      end else
      if (VarIsStr(Value)) then
      begin
        Writer.Write(''''+VarToStr(Value)+'''');
      end else
      begin
        s := VarToStr(Value);
        if (s = '') then
          s := '''''';
        Writer.Write(s)
      end;
      Writer.WriteLine(';');
//      Writer.WriteLine(ValueSymbol.Description+';');
//      StartSection(Writer, stNone);
    end;
  end else
  if (ValueSymbol.Name <> '') then
  begin
    StartSection(Writer, stVar);
    Writer.WriteLine('  '+ValueSymbol.Description+';')
  end;
end;

const
  sReservedWords: array[0..65] of string = (
    'const', 'and', 'end', 'interface', 'record',
    'var', 'array', 'except', 'is', 'repeat',
    'while', 'until', 'as', 'exports', 'label',
    'resourcestring', 'with', 'asm', 'file', 'library',
    'set', 'xor', 'begin', 'finalization', 'mod',
    'shl', 'case', 'finally', 'nil', 'shr',
    'class', 'for', 'not', 'string', 'const',
    'function', 'object', 'then', 'constructor', 'goto',
    'of', 'threadvar', 'destructor', 'if', 'or',
    'to', 'dispinterface', 'implementation', 'packed', 'try',
    'div', 'in', 'procedure', 'type', 'do',
    'inherited', 'program', 'unit', 'downto', 'initialization',
    'property', 'until', 'else', 'inline', 'raise',
    'uses');

constructor TScriptSourceBuilder.Create(const AProgram: IdwsProgram);
var
  s: string;
begin
  inherited;
  FReservedWords := TStringList.Create;
  FReservedWords.CaseSensitive := False;
  for s in sReservedWords do
    FReservedWords.Add(s);
  FReservedWords.Sorted := True;
end;

destructor TScriptSourceBuilder.Destroy;
begin
  FReservedWords.Free;
  inherited;
end;

end.

