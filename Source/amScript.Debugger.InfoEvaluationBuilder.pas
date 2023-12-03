unit amScript.Debugger.InfoEvaluationBuilder;

interface

uses
  Generics.Collections,

  cxTL,

  dwsSymbols,
  dwsScriptSource,
  dwsInfo,
  dwsEvaluate,

  amScript.Debugger.API;

// -----------------------------------------------------------------------------
//
// TInfoEvaluationBuilder
//
// -----------------------------------------------------------------------------
type
  TInspectOptions = set of (ioShowInherited, ioShowFields, ioShowProperties, ioAllowPropertySideEffects, ioShowGlobal);

  TInfoEvaluationBuilder = class
  private
    FDebugger: IScriptDebugger;
    FTreeList: TcxTreeList;
    FRefreshedNodes: TList<TcxTreeListNode>;
    FVisibilities: TdwsVisibilities;
    FInspectOptions: TInspectOptions;
    FUpdateCount: integer;
    FNeedUpdate: boolean;
  protected
    procedure SetInspectOptions(const Value: TInspectOptions);
    procedure SetVisibilities(const Value: TdwsVisibilities);

  protected
    function FindNode(AParentNode: TcxTreeListNode; const AName: string): TcxTreeListNode;

    procedure LoadNode(ANode: TcxTreeListNode); overload;
    procedure LoadNode(ANode: TcxTreeListNode; const AInfo: IInfo); overload;
    procedure LoadMemberNodes(ANode: TcxTreeListNode; const AInfo: IInfo);

    function GetDisplayValue(const Info: IInfo): string;

  public
    constructor Create(ATreeList: TcxTreeList);
    destructor Destroy; override;

    procedure Initialize(const ADebugger: IScriptDebugger);

    procedure Clear;

    procedure BeginUpdate;
    procedure Changed;
    procedure EndUpdate;

    procedure EvaluateExpression(const AEvaluator: IdwsEvaluateExpr; const AInfo: IInfo; const AExpression: string; AScriptPos: PScriptPos = nil; AImageIndex: integer = -1; AContextSymbol: TSymbol = nil);

    procedure PopulateNode(ANode: TcxTreeListNode); // Called when a node is expanded

    procedure PurgeUnusedNodes;

    property Visibilities: TdwsVisibilities read FVisibilities write SetVisibilities;
    property InspectOptions: TInspectOptions read FInspectOptions write SetInspectOptions;
  end;

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------

implementation

uses
  System.SysUtils,
  dwsInfoClasses,
  dwsDataContext;

// -----------------------------------------------------------------------------
//
// TInfoEvaluationBuilder
//
// -----------------------------------------------------------------------------
constructor TInfoEvaluationBuilder.Create(ATreeList: TcxTreeList);
begin
  inherited Create;

  FTreeList := ATreeList;

  FRefreshedNodes := TList<TcxTreeListNode>.Create;

  FVisibilities := [cvPublic, cvPublished, cvProtected];

  // Properties can have side effects due to getter. Do not show by default
  FInspectOptions := [ioShowFields];
end;

destructor TInfoEvaluationBuilder.Destroy;
begin
  FRefreshedNodes.Free;

  inherited;
end;

// -----------------------------------------------------------------------------

procedure TInfoEvaluationBuilder.Initialize(const ADebugger: IScriptDebugger);
begin
  FDebugger := ADebugger;
end;

// -----------------------------------------------------------------------------

procedure TInfoEvaluationBuilder.BeginUpdate;
begin
  Inc(FUpdateCount);

  if (FUpdateCount = 1) then
  begin
    FRefreshedNodes.Clear;
    FTreeList.BeginUpdate;
  end;
end;

procedure TInfoEvaluationBuilder.EndUpdate;
begin
  if (FUpdateCount = 1) then
  begin
    if (FNeedUpdate) then
    begin

    end;

    FTreeList.EndUpdate;
    FRefreshedNodes.Clear;
    FNeedUpdate := False;
  end;

  Dec(FUpdateCount);
end;

procedure TInfoEvaluationBuilder.Changed;
begin
  BeginUpdate;
  FNeedUpdate := True;
  EndUpdate;
end;

procedure TInfoEvaluationBuilder.Clear;
begin
  FTreeList.Clear;
  FRefreshedNodes.Clear;
end;

// -----------------------------------------------------------------------------

procedure TInfoEvaluationBuilder.SetInspectOptions(const Value: TInspectOptions);
begin
  if (FInspectOptions = Value) then
    exit;

  FInspectOptions := Value;

  Changed;
end;

procedure TInfoEvaluationBuilder.SetVisibilities(const Value: TdwsVisibilities);
begin
  if (FVisibilities = Value) then
    exit;

  FVisibilities := Value;

  Changed;
end;

// -----------------------------------------------------------------------------

function TInfoEvaluationBuilder.FindNode(AParentNode: TcxTreeListNode; const AName: string): TcxTreeListNode;
begin
  if (AParentNode = nil) then
    AParentNode := FTreeList.Root;

  Result := AParentNode.getFirstChild;

  while (Result <> nil) do
  begin
    if (Result.Texts[0] = AName) then
      break;
    Result := Result.getNextSibling;
  end;
end;

// -----------------------------------------------------------------------------

procedure TInfoEvaluationBuilder.PurgeUnusedNodes;
begin
  // Remove all nodes that didn't get referenced during the update; They're all out of scope.
  var Node := FTreeList.Root.getFirstChild;
  while (Node <> nil) do
  begin
    var NextNode := Node.getNextSibling;

    if (not FRefreshedNodes.Contains(Node)) then
      Node.Free;

    Node := NextNode;
  end;
end;

// -----------------------------------------------------------------------------

procedure TInfoEvaluationBuilder.LoadNode(ANode: TcxTreeListNode);
var
  Info: IInfo;
begin
  if (ANode.Data = nil) then
    exit;

  pointer(Info) := ANode.Data;
  //  Mark the ANode as handled (i.e. we don't need to load it again)
  ANode.Data := nil;

  LoadNode(ANode, Info);
end;

procedure TInfoEvaluationBuilder.LoadNode(ANode: TcxTreeListNode; const AInfo: IInfo);
begin
  var TypeSym := AInfo.TypeSym;

  (*
  ** Get the value
  *)
  var s := GetDisplayValue(AInfo);

  if (ANode.StateIndex = -1) then
  begin
    // The ANode is new
    ANode.OverlayIndex := DebuggerSymbolImageIndexOverlayAdd;
    ANode.StateIndex := 0;
  end else
  begin
    // Has the ANode "value" changed?
    if (ANode.Texts[1] <> s) then
      ANode.OverlayIndex := DebuggerSymbolImageIndexOverlayChanged
    else
      ANode.OverlayIndex := -1;
  end;

  ANode.Texts[1] := s;

  (*
  ** Get the type
  *)
  // TODO : Don't we just need to do this once, for new nodes?
  s := TypeSym.Name;
  if (s = '') then
    s := TypeSym.Typ.Name;
  if (TypeSym is TArraySymbol) then
    ANode.Texts[2] := TypeSym.Description
  else
  if (TypeSym is TAssociativeArraySymbol) then
    ANode.Texts[2] := 'array['+TAssociativeArraySymbol(TypeSym).KeyType.Name+'] of '+s
(*
  else
  if (TypeSym is TArraySymbol) then
    ANode.Texts[2] := 'array['+TArraySymbol(TypeSym).IndexType.Name+'] of '+s
*)
  else
    ANode.Texts[2] := s;
//ANode.Texts[2] := TypeSym.Description;

  (*
  ** For composite types, also load the child nodes
  *)
  if (TypeSym is TCompositeTypeSymbol) then
  begin
    ANode.ImageIndex := FDebugger.SymbolToImageIndex(TypeSym);

    if (AInfo is TInfoClassObj) and (AInfo.ValueIsEmpty) then
    begin
      if (ANode.HasChildren) then
        ANode.DeleteChildren;
      exit;
    end;

    LoadMemberNodes(ANode, AInfo);
  end else
  begin
    // Not composite; Delete children
    if (ANode.HasChildren) then
      ANode.DeleteChildren;
  end;
end;

procedure TInfoEvaluationBuilder.LoadMemberNodes(ANode: TcxTreeListNode; const AInfo: IInfo);
var
  RefreshedNodes: TList<TcxTreeListNode>;

  procedure DoLoadMemberNodes(ANode: TcxTreeListNode; TypeSym: TCompositeTypeSymbol);
  var
    MemberInfo, NewInfo: IInfo;
  begin
    // Recurse to show inherited members
    if (ioShowInherited in FInspectOptions) and (TypeSym.Parent <> nil) then
    begin
(*
      MemberNode := ANode.AddChild;
      MemberNode.ImageIndex := DwsIde.SymbolToImageIndex(TypeSym.Parent);
      RefreshedNodes.Add(MemberNode);
      MemberNode.Texts[0] := '(' + TypeSym.Parent.Name + ')';
      DoLoadMemberNodes(MemberNode, TypeSym.Parent);
*)
      DoLoadMemberNodes(ANode, TypeSym.Parent);
    end;

    // Iterate through all members to load them
    for var i := 0 to TypeSym.Members.Count-1 do
    begin
      var Symbol := TypeSym.Members[i];

      if (Symbol is TFieldSymbol) or (Symbol is TPropertySymbol) then
      begin
        // Apply filter
        if (Symbol is TPropertySymbol) then
        begin
          if (not (ioShowProperties in FInspectOptions)) then
            continue;
          if (not (TPropertySymbol(Symbol).Visibility in FVisibilities)) then
            continue;
        end else
        begin
          if (not (ioShowFields in FInspectOptions)) then
            continue;
          if (not (TFieldSymbol(Symbol).Visibility in FVisibilities)) then
            continue;
        end;

        // Look for existing child node
        var MemberNode := FindNode(ANode, Symbol.Name);
        // Create node if one wasn't found
        if (MemberNode = nil) then
        begin
          MemberNode := ANode.AddChild;
          MemberNode.Texts[0] := Symbol.Name;
        end;
        RefreshedNodes.Add(MemberNode);

        if (MemberNode.StateIndex = -1) then
        begin
          MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayAdd;
          MemberNode.StateIndex := 0;
        end else
          MemberNode.OverlayIndex := -1;

        if (Symbol is TPropertySymbol) then
        begin
          if (TPropertySymbol(Symbol).ArrayIndices <> nil) and (TPropertySymbol(Symbol).ArrayIndices.Count > 0) then
          begin
            MemberNode.Texts[1] := '[...]';
            MemberNode.Texts[2] := 'array of '+Symbol.Typ.Name;
            MemberNode.ImageIndex := DebuggerSymbolImageIndexArray;
            continue;
          end;
        end;

        MemberNode.ImageIndex := FDebugger.SymbolToImageIndex(Symbol);

        try

          // Properties are syntactic sugar; Their getters can have side effects.
          if (Symbol is TPropertySymbol) then
          begin
            // We're not using Info.Member[] for properties since it uses the symbol lookup (see TInfoClassObj.GetMember)
            // of the wrapped script object and the object might actually be an instance that's shared between
            // multiple objects.
            // E.g. TLayoutItem and TLayoutItem.Items:TLayoutItemList both wrap the same object, so a lookup on
            // the AInfo.Members on TLayoutItem.Items will only find the symbols of TLayoutItem.

            if (TPropertySymbol(Symbol).ReadSym = nil) then
            begin
              // Property without getter
              MemberNode.Texts[1] := '(not readable)';
              MemberNode.Texts[2] := Symbol.Typ.Name;
              MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
              continue;
            end else
            if (TPropertySymbol(Symbol).ReadSym is TFuncSymbol) and (not (ioAllowPropertySideEffects in FInspectOptions)) then
            begin
              // Property with getter but we're not allowed to call it
              MemberNode.Texts[1] := '(getter is method)';
              MemberNode.Texts[2] := Symbol.Typ.Name;
              MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
              continue;
            end else
{$ifdef OLD_DWSCRIPT}
              MemberInfo := TInfoProperty.Create(AInfo.Exec.AInfo, Symbol.Typ, AInfo.Exec.AInfo.Execution.DataContext_Nil, TPropertySymbol(Symbol), AInfo.ScriptObj)
{$else OLD_DWSCRIPT}
              MemberInfo := AInfo.Member[Symbol.Name] // TODO : OLD_DWSCRIPT - see comment above
{$endif OLD_DWSCRIPT}
          end else
            MemberInfo := AInfo.Member[Symbol.Name];

        except
          MemberNode.Texts[1] := '(failed)';
          MemberNode.Texts[2] := Symbol.Typ.Name;
          MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
          continue;
        end;

        // Get value
        var Data: TData;
        try

          Data := MemberInfo.Data;

        except
          MemberNode.Texts[1] := '(unavailable)';
          MemberNode.Texts[2] := Symbol.Typ.Name;
          MemberNode.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
          continue;
        end;

        // Create an IInfo object on the symbol
        CreateInfoOnSymbol(NewInfo, FDebugger.GetDebugger.Execution.Info, Symbol.Typ, Data, 0);

        // If the target node is visible, load it immediately...
        if (ANode.Expanded) then
          LoadNode(MemberNode, NewInfo)
        else
        // ...otherwise attach the IInfo to the node so the node can be
        // populated when the parent is expanded
        begin
          // Delete any existing children. They will be recreated if the node is expanded again.
          if (MemberNode.Count > 0) then
            MemberNode.DeleteChildren;

          MemberNode.Data := pointer(NewInfo);
          pointer(NewInfo) := nil;
        end;

      end;
    end;
  end;

begin
  RefreshedNodes := TList<TcxTreeListNode>.Create;
  try

    var TypeSym := AInfo.TypeSym as TCompositeTypeSymbol;
    DoLoadMemberNodes(ANode, TypeSym);

    (*
    ** Any node that wasn't added or updated is obsolete and will now be deleted
    *)
    var MemberNode := ANode.getFirstChild;
    while (MemberNode <> nil) do
    begin
      var NextNode := MemberNode.getNextSibling;

      if (not RefreshedNodes.Contains(MemberNode)) then
        MemberNode.Free;

      MemberNode := NextNode;
    end;

  finally
    RefreshedNodes.Free;
  end;
end;

// -----------------------------------------------------------------------------

procedure TInfoEvaluationBuilder.PopulateNode(ANode: TcxTreeListNode);
begin
  Assert(FDebugger <> nil);

  var ChildNode := ANode.getFirstChild;

  while (ChildNode <> nil) do
  begin
    // If Node.Data <> nil then the node has not been expanded before and we
    // need to populate its children (grand-children actually)
    if (ChildNode.Data <> nil) then
      LoadNode(ChildNode);

    ChildNode := ChildNode.getNextSibling;
  end;
end;

// -----------------------------------------------------------------------------

procedure TInfoEvaluationBuilder.EvaluateExpression(const AEvaluator: IdwsEvaluateExpr; const AInfo: IInfo; const AExpression: string;
  AScriptPos: PScriptPos; AImageIndex: integer; AContextSymbol: TSymbol);
begin
  Assert(FDebugger <> nil);

  var Node := FindNode(nil, AExpression);

  // Is it a new variable?
  if (Node = nil) then
    Node := FTreeList.AddChild(nil)
  else
  // Have we already evaluated that variable (can happen due to the global scope option)?
  if (FRefreshedNodes.Contains(Node)) then
  begin
    // If we have a context now, but didn't before, we refresh the node with the context.
    // This happens when the node is initially added from the inner scope (without a context)
    // and then later updated from the outermost scope with a context.
    if (AContextSymbol <> nil) and (Node.Texts[3] = '') then
      Node.Texts[3] := AContextSymbol.Name;

    exit;
  end;
  try
    FRefreshedNodes.Add(Node);

    var Evaluator := AEvaluator;

    if (AEvaluator = nil) then
      // Create a new evaluation if the passed one is missing (e.g. a local variable).
      Evaluator := TdwsEvaluateExpr.Evaluate(FDebugger.GetDebugger.Execution, AExpression, [], AScriptPos)
    else
      // We assume that the Evaluator context is valid because TdwsDebuggerWatch.Update
      // has just been called.
      Evaluator := AEvaluator;

    // var AEvaluator := FDebugger.GetDebugger.Evaluate(AExpression, AScriptPos);
    try
      Node.Texts[0] := AExpression;
      Node.ImageIndex := AImageIndex;

      if (AContextSymbol <> nil) then
        Node.Texts[3] := AContextSymbol.Name;


      var TypedExpr := Evaluator.Expression;
      if (TypedExpr.Typ = nil) then
      begin
        Node.Texts[1] := '(not an expression)';
        Node.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
        exit;
      end else
      if (Evaluator.EvaluationError) then
      begin
        Node.Texts[1] := '(evaluation error)';
        Node.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
        exit;
      end else
      if (TypedExpr.Typ.Size <> 1) then
      begin
        Node.Texts[1] := '[size:'+IntToStr(TypedExpr.Typ.Size)+']';
        Node.Texts[2] := TypedExpr.Typ.Name;
        Node.OverlayIndex := DebuggerSymbolImageIndexOverlayWarning;
        exit;
      end else
        Node.OverlayIndex := -1;

      var ValueInfo: IInfo;
      if (AInfo = nil) then
      begin
        var Data: TData;
        SetLength(Data, 1);
        Evaluator.Expression.EvalAsVariant(FDebugger.GetDebugger.Execution.ExecutionObject, Data[0]);

        CreateInfoOnSymbol(ValueInfo, FDebugger.GetDebugger.Execution.Info, Evaluator.Expression.Typ, Data, 0);
      end else
        ValueInfo := AInfo;

      Node.Data := pointer(ValueInfo);
      pointer(ValueInfo) := nil;

      LoadNode(Node);
    finally
      Evaluator := nil;
    end;
  except
    on E : Exception do
    begin
      var s := Node.Texts[1];
      if (s <> '') then
        s := s + ' - ';
      Node.Texts[1] := s + E.Message;
    end;
  end;
end;

// -----------------------------------------------------------------------------

function TInfoEvaluationBuilder.GetDisplayValue(const Info: IInfo): string;
begin
  var TypeSym := Info.TypeSym;

  if (TypeSym is TEnumerationSymbol) then
  begin
    var ElementSymbol := TEnumerationSymbol(TypeSym).ElementByValue(Info.ValueAsInteger);
    if (ElementSymbol <> nil) then
      Result := ElementSymbol.Name
    else
      Result := Format('(%d)', [Info.ValueAsInteger]);
  end else
  if (TypeSym is TSetOfSymbol) then
  begin
    var BaseType := TSetOfSymbol(TypeSym).Typ;
    Result := '';
    var n := Info.ValueAsInteger;
    if (BaseType is TEnumerationSymbol) then
    begin
      var i := 0;
      while (n > 0) do
      begin
        if (n and 1 <> 0) then
        begin
          if (Result <> '') then
            Result := Result + ',';
          var ElementSymbol := TEnumerationSymbol(BaseType).ElementByValue(i);
          if (ElementSymbol <> nil) then
            Result := Result + ElementSymbol.Name
          else
            Result := Result + Format('(%d)', [i]);
        end;
        n := n shr 1;
        inc(i);
      end;
    end else
    begin
      var i := 0;
      while (n > 0) do
      begin
        if (n and 1 <> 0) then
        begin
          if (Result <> '') then
            Result := Result + ',';
          Result := Result + IntToStr(i);
        end;
        n := n shr 1;
        inc(i);
      end;
    end;
    Result := '[' + Result + ']';
  end else
  if (TypeSym is TAssociativeArraySymbol) or (TypeSym is TArraySymbol) then
  begin
    Result := '[count:' + Info.Member['count'].ValueAsString + ']';
  end else
  if (TypeSym is TClassSymbol) then
  begin
    if (Info.ValueIsEmpty) then
      Result := 'nil'
    else
      Result := '(object)';
  end else
  if (TypeSym is TFuncSymbol) then
  begin
    if (Info.ValueIsEmpty) then
      Result := 'nil'
    else
      Result := '(delegate)';
  end else
  begin
    Result := Info.ValueAsString; // Conversion error is handled by caller
    if (TypeSym is TBaseStringSymbol) then
      Result := '''' + Result + '''';
  end;
end;

end.
