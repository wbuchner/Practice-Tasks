program LinkedListAssignment;

type
	NodePtr = ^Node;
	
	Node = record
		data: Integer;
		next: NodePtr;
	end;
		
	LinkedList = record
		first: NodePtr;
		last: NodePtr;
	end;

procedure CreateList(var list: LinkedList);
begin
	list.first := nil; // result.first (because we are talking about THIS one not the next one)
	list.last := nil;
end;

// Create Node
function CreateNode(data : Integer; next : NodePtr): NodePtr;
begin
  New(result);
  result^.data := data;
  result^.next := next;
end;

// procedure PrependNode(var List: LinkedList; value: Integer);
// var
//  newNode: NodePtr;
// begin
//  newNode := CreateNode(value, list.start);
//  
//  LinkedList.first := newNode;
//  if LinkedList.last = nil then
//  begin
//    LinkedList.last := newNode
//  end
// end;

// procedure AppendNode(var List: LinkedList; value: Integer);
// var
//  newNode: NodePtr;
// begin
//  New(newNode);
//  newNode^.data := value;
//  newNode^.next := last;
//  LinkedList.last := newNode;
// end;

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

// procedure ClearList(var list: LinkedList);
// begin
//  if first <> nil then
//  begin
//    ClearList(first^.next);
//    Dispose(first);
//    first := nil;
//  end;
// end;

// procedure DisposeNodes(var start: NodePtr);
// begin
//  if start <> nil then
//  begin
//    DisposeNodes(start^.next);
//    Dispose(start);
//    start := nil;
//  end;
// end;

procedure Main();
var 
  list : LinkedList;
begin
	CreateList(list);
	CreateNode(20, list.first);
  // PrependNode(var list: LinkedList; value: Integer);
  // AppendNode(var list: LinkedList; value: Integer);
	//DeleteNode(var list: LinkedList; node : NodePtr); to implement later!
  // ClearList(var list: LinkedList);
	PrintFrom(list.first);
	//FindValue(list: LinkedList; value: Integer): NodePtr; to implement later!
end;

begin
	Main();
end.