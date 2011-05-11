program LinkedList;

uses
  sysUtils;
type 
  NodePtr = ^Node;
  
  Node = record
    data  : Integer;
    next  : NodePtr;
    prev  : NodePtr;
  end;

  LinkedLst = record
    start: NodePtr;
    last: NodePtr;
  end;

// Create Node
function CreateNode(data : Integer; next,prev : NodePtr): NodePtr;
begin
  New(result);
  result^.data := data;
  result^.next := next;
  result^.prev := prev;
end;

// Dispose all nodes
procedure DisposeNodes(var start: NodePtr);
begin
  if start <> nil then
  begin
  DisposeNodes(start^.next);
  Dispose(start);
  start := nil;
  end;
end;

// Insert After Function
function InsertBefore(data: Integer; n, p : NodePtr): NodePtr;
begin
  result := CreateNode(data, n^.next, p^.prev^.prev); // follow n 
  n^.next := result;
  p^.prev := result;
end;

// Insert After Function
function InsertAfter(data: Integer; n, p : NodePtr): NodePtr;
begin
  result := CreateNode(data, n^.next, p^.prev); // follow n 
  n^.prev := result;
  p^.next := result;
end;

// Insert At Start of List
function PrependNode(data: Integer; n, p : NodePtr): NodePtr;
begin
  result := CreateNode(data, n^.next^.next, p^.prev^.prev);
  n^.next := result;
  p^.prev := nil;
  
end;

// Print Nodes
procedure PrintBackTo(n: NodePtr);
begin
  if (n <> nil) then
  begin
  PrintBackTo(n^.next);
  Write(' <- ', n^.data);
  end
  else
  begin
    Write('nil');
  end;
end;

// Print From Node
procedure PrintFrom(n: NodePtr);
begin
  if n <> nil then
    begin
      Write(n^.data,' -> ');
      PrintFrom(n^.next);
     end
    else
    begin
      WriteLn('nil');
    end;
    //WriteLn();
end;

// Count nodes
function Count(n: NodePtr):Integer;
var
  current: NodePtr;
begin
  current := n;
  result := 0;
  while (current <> nil) do
  begin
    result +=1;
    current := current^.next;  
  end;
  
  // if n <> nil then
  // result := 1+Count(n^.next)
  // else
  //   result := 0;
end;

procedure Main();
var
  start: NodePtr;
begin
  start := CreateNode(1, nil, nil);
  start := CreateNode(2, start, start);
  InsertBefore(8, start, start);
  start := CreateNode(3, start, start);
  InsertBefore(4, start, start);
  // AppendNode(start^.next, 4);
  // AppendNode(start^.next^.next, 5);
  WriteLn('Count is ', Count(start));

  PrependNode(start^.data, start^.prev, start^.next);

  PrintFrom(start);
  PrintBackTo(start);
  WriteLn();
  DisposeNodes(start);
  
  // start is = nill
end;

// Main executable
begin
  Main();
end.