program LinkedList;

uses
  sysUtils;
type 
  NodePtr = ^Node;
  
  Node = record
    data  : Integer;
    next  : NodePtr;
  end;

  LinkedLst = record
    start   : NodePtr;
    finish  : NodePtr;
  end;

procedure CreateList(var list: LinkedLst);
begin
  list.start := nil;
  list.finish := nil;
end;


// Create Node
function CreateNode(data : Integer; next : NodePtr): NodePtr;
begin
  New(result);
  result^.data := data;
  result^.next := next;
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
function InsertBefore(data: Integer; n : NodePtr): NodePtr;
begin
  result := CreateNode(data, n^.next); // follow n 
  n^.next := result;
end;

// Insert After Function
function InsertAfter(data: Integer; n : NodePtr): NodePtr;
begin
  result := CreateNode(data, n^.next); // follow n 
  n^.next := result;
 end;

// Insert At Start of List
function PrependNode(data: Integer; n : NodePtr): NodePtr;
begin
  result := CreateNode(data, n^.next^.next);
  n^.next := result;
  
end;

function FindNode(list, value : nodePtr): NodePtr;
begin
  result := nil;
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
  list : LinkedLst;
  
begin
  CreateList(list);
  start := CreateNode(1, nil);
  start := CreateNode(2, start);
  InsertBefore(8, start);
  start := CreateNode(3, start);
  InsertBefore(4, start);
  // AppendNode(start^.next, 4);
  // AppendNode(start^.next^.next, 5);
  WriteLn('Count is ', Count(start));

  //PrependNode(start^.data, start^.prev);

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